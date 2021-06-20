/*
  * @Description: LIO mapping backend workflow, implementation
  * @Author: Zhai Kai
  * @Date: 2021-6-20 15:29
  */
#include "lidar_localization/mapping/back_end/lio_back_end.hpp"

#include <Eigen/Dense>
#include <pcl/io/pcd_io.h>
#include "glog/logging.h"

#include "lidar_localization/global_defination/global_defination.h"
#include "lidar_localization/tools/file_manager.hpp"

LIOBackEnd::LIOBackEnd()
{
    InitWithConfig();
}

bool LIOBackEnd::InitWithConfig()
{
    std::string config_file_path = WORK_SPACE_PATH + "/config/mapping/lio_back_end.yaml";
    YAML::Node config_node = YAML::LoadFile(config_file_path);

    std::cout << "-----------------Init LIO Backend-------------------" << std::endl;

    InitDataPath(config_node);
    InitParam(config_node);
    InitGraphOptimizer(config_node);
    InitIMUPreIntegrator(config_node);
    InitOdoPreIntegrator(config_node);

    return true;
}

bool LIOBackEnd::InitDataPath(const YAML::Node& config_node) {
    std::string data_path = config_node["data_path"].as<std::string>();
    if (data_path == "./") {
        data_path = WORK_SPACE_PATH;
    }

    if (!FileManager::CreateDirectory(data_path + "/slam_data"))
        return false;

    key_frames_path_ = data_path + "/slam_data/key_frames";
    scan_context_path_ = data_path + "/slam_data/scan_context";
    trajectory_path_ = data_path + "/slam_data/trajectory";

    if (!FileManager::InitDirectory(key_frames_path_, "Point Cloud Key Frames"))
        return false;
    if (!FileManager::InitDirectory(scan_context_path_, "Scan Context Index & Data"))
        return false;
    if (!FileManager::InitDirectory(trajectory_path_, "Estimated Trajectory"))
        return false;

    return true;
}

bool LIOBackEnd::InitParam(const YAML::Node& config_node) {
    key_frame_distance_ = config_node["key_frame_distance"].as<float>();

    return true;
}

bool LIOBackEnd::InitGraphOptimizer(const YAML::Node& config_node) {
    std::string graph_optimizer_type = config_node["graph_optimizer_type"].as<std::string>();

    if (graph_optimizer_type == "g2o") {
        graph_optimizer_ptr_ = std::make_shared<G2oGraphOptimizer>("lm_var");
    } else {
        LOG(ERROR) << "Optimizer " << graph_optimizer_type << " NOT FOUND!";
        return false;
    }
    std::cout << "\tOptimizer:" << graph_optimizer_type << std::endl << std::endl;

    graph_optimizer_config_.use_gnss = config_node["use_gnss"].as<bool>();
    graph_optimizer_config_.use_loop_close = config_node["use_loop_close"].as<bool>();
    graph_optimizer_config_.use_imu_pre_integration = config_node["use_imu_pre_integration"].as<bool>();
    graph_optimizer_config_.use_odo_pre_integration = config_node["use_odo_pre_integration"].as<bool>();

    graph_optimizer_config_.optimization_step_size.key_frame = (
        config_node["optimization_step_size"]["key_frame"].as<int>()
    );
    graph_optimizer_config_.optimization_step_size.loop_closure = (
        config_node["optimization_step_size"]["loop_closure"].as<int>()
    );

    // x-y-z & yaw-roll-pitch
    for (int i = 0; i < 6; ++i) {
        graph_optimizer_config_.odom_edge_noise(i) =
            config_node[graph_optimizer_type + "_param"]["odom_edge_noise"][i].as<double>();
        graph_optimizer_config_.close_loop_noise(i) =
            config_node[graph_optimizer_type + "_param"]["close_loop_noise"][i].as<double>();
    }

    // x-y-z:
    for (int i = 0; i < 3; i++) {
        graph_optimizer_config_.gnss_noise(i) =
            config_node[graph_optimizer_type + "_param"]["gnss_noise"][i].as<double>();
    }

    return true;
}

bool LIOBackEnd::InitIMUPreIntegrator(const YAML::Node& config_node) {
    imu_pre_integrator_ptr_ = nullptr;
    
    if (graph_optimizer_config_.use_imu_pre_integration) {
        imu_pre_integrator_ptr_ = std::make_shared<IMUPreIntegrator>(config_node["imu_pre_integration"]);
    }

    return true;
}

bool LIOBackEnd::InitOdoPreIntegrator(const YAML::Node& config_node) {
    odo_pre_integrator_ptr_ = nullptr;
    
    if (graph_optimizer_config_.use_odo_pre_integration) {
        odo_pre_integrator_ptr_ = std::make_shared<OdoPreIntegrator>(config_node["odo_pre_integration"]);
    }

    return true;
}

bool LIOBackEnd::InsertLoopPose(const LoopPose& loop_pose) {
    if (!graph_optimizer_config_.use_loop_close)
        return false;

    // get vertex IDs:
    const int vertex_index_i = loop_pose.index0;
    const int vertex_index_j = loop_pose.index1;
    // get relative pose measurement:
    Eigen::Matrix4d relative_pose = loop_pose.pose.cast<double>();
    // add constraint, lidar frontend / loop closure detection:
    graph_optimizer_ptr_->AddPRVAGRelativePoseEdge(
        vertex_index_i, vertex_index_j, 
        relative_pose, graph_optimizer_config_.close_loop_noise
    );

    // update loop closure count:
    ++counter_.loop_closure;
    
    LOG(INFO) << "Add loop closure: " << loop_pose.index0 << "," << loop_pose.index1 << std::endl;

    return true;
}

bool LIOBackEnd::UpdateIMUPreIntegration(const IMUData &imu_data) {
    if ( !graph_optimizer_config_.use_imu_pre_integration || nullptr == imu_pre_integrator_ptr_ )
        return false;
    
    if (
        !imu_pre_integrator_ptr_->IsInited() ||
        imu_pre_integrator_ptr_->Update(imu_data)
    ) {
        return true;
    }

    return false;
}

bool LIOBackEnd::UpdateOdoPreIntegration(const VelocityData &velocity_data) {
    if ( !graph_optimizer_config_.use_odo_pre_integration || nullptr == odo_pre_integrator_ptr_ )
        return false;
    
    if (
        !odo_pre_integrator_ptr_->IsInited() ||
        odo_pre_integrator_ptr_->Update(velocity_data)
    ) {
        return true;
    }

    return false;
}

bool LIOBackEnd::Update(
    const CloudData& cloud_data, 
    const PoseData& laser_odom, 
    const PoseData& gnss_pose,
    const IMUData &imu_data
) {
    ResetParam();

    if ( MaybeNewKeyFrame(cloud_data, laser_odom, gnss_pose, imu_data) ) {
        AddNodeAndEdge(gnss_pose);
        MaybeOptimized();
    }

    return true;
}

void LIOBackEnd::ResetParam() {
    has_new_key_frame_ = false;
    has_new_optimized_ = false;
}

//
//*********************important functions*****************
//
bool LIOBackEnd::MaybeNewKeyFrame(
    const CloudData& cloud_data, 
    const PoseData& laser_odom, 
    const PoseData& gnss_odom,
    const IMUData &imu_data
) {
    static int count = 0;
    static VelocityData velocity_data;
    static PoseData last_laser_pose = laser_odom;
    static PoseData last_gnss_pose = gnss_odom;

    if (key_frames_deque_.size() == 0) {
        // init IMU pre-integrator:
        if ( imu_pre_integrator_ptr_ ) {
            imu_pre_integrator_ptr_->Init(imu_data);
        }

        // init odometer pre-integrator:
        if ( odo_pre_integrator_ptr_ ) {
            gnss_odom.GetVelocityData(velocity_data);
            odo_pre_integrator_ptr_->Init(velocity_data);
        }

        last_laser_pose = laser_odom;
        last_gnss_pose = gnss_odom;

        has_new_key_frame_ = true;
    }

    // whether the current scan is far away enough from last key frame:
    if (fabs(laser_odom.pose(0,3) - last_laser_pose.pose(0,3)) + 
        fabs(laser_odom.pose(1,3) - last_laser_pose.pose(1,3)) +
        fabs(laser_odom.pose(2,3) - last_laser_pose.pose(2,3)) > key_frame_distance_) {

        if ( imu_pre_integrator_ptr_ ) {
            imu_pre_integrator_ptr_->Reset(imu_data, imu_pre_integration_); 
        }

        if ( odo_pre_integrator_ptr_ ) {
            gnss_odom.GetVelocityData(velocity_data);
            odo_pre_integrator_ptr_->Reset(velocity_data, odo_pre_integration_); 
        }

        //
        // for IMU pre-integration debugging ONLY:
        // this is critical to IMU pre-integration verification
        //
        if ( 0 == (++count) % 10 ) {
            // display IMU pre-integration:
            // ShowIMUPreIntegrationResidual(last_gnss_pose, gnss_odom, imu_pre_integration_); 

            // display odometer pre-integration:

            // reset counter:
            count = 0;
        }

        last_laser_pose = laser_odom;
        last_gnss_pose = gnss_odom;
    
        has_new_key_frame_ = true;
    }

    // if so:
    if (has_new_key_frame_) {
        // a. first write new key scan to disk:
        std::string file_path = key_frames_path_ + "/key_frame_" + std::to_string(key_frames_deque_.size()) + ".pcd";
        pcl::io::savePCDFileBinary(file_path, *cloud_data.cloud_ptr);
        current_key_scan_.time = cloud_data.time;
        current_key_scan_.cloud_ptr.reset(
            new CloudData::CLOUD(*cloud_data.cloud_ptr)
        );

        current_key_gnss_.time = current_key_frame_.time = laser_odom.time;
        current_key_gnss_.index = current_key_frame_.index = key_frames_deque_.size();

        // b. create key frame index for lidar scan, relative pose measurement:
        current_key_frame_.pose = laser_odom.pose;

        // c. create key frame index for GNSS measurement, full LIO state:
        current_key_gnss_.pose = gnss_odom.pose;
        current_key_gnss_.vel.v = gnss_odom.vel.v;
        current_key_gnss_.vel.w = gnss_odom.vel.w;

        // add to cache for later evo evaluation:
        key_frames_deque_.push_back(current_key_frame_);
        key_gnss_deque_.push_back(current_key_gnss_);
    }

    return has_new_key_frame_;
}

