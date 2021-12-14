#include "include/front_end.hpp"
#include <fstream>
#include <boost/filesystem.hpp>
#include <pcl-1.8/pcl/common/transforms.h>
#include <pcl-1.8/pcl/io/pcd_io.h>
#include <glog/logging.h>

FrontEnd::FrontEnd()
:result_cloud_ptr_(new CloudData::CLOUD())
{
    InitWithConfig();
}

bool FrontEnd::InitWithConfig(){
    std::string config_file_path = "../config/config.yaml";
    YAML::Node config_node = YAML::LoadFile(config_file_path);

    InitRegistration(registration_ptr_, config_node);

    return true;
}

bool FrontEnd::InitRegistration(std::shared_ptr<RegistrationInterface>& registration_ptr, const YAML::Node& config_node){
    registration_ptr = std::make_shared<ICPRegistration>(config_node["ICP"])
    LOG(INFO) << "***** ICP*****" << std::endl;

    return true;
}

bool FrontEnd::Update(const CloudData& cloud_data, const CloudData& target_cloud_data, EIgen::Matrix4f& cloud_pose)
{
    static Eigen::Matrix4f predict_pose = init_pose_;

    registration_ptr_ -> SetInputTarget(target_cloud_data.cloud_ptr);

    LOG(INFO) << "***** Begin to ScanMatch *****" << std::endl;

    registration_ptr_ -> ScanMatch(cloud_data.cloud_ptr, predict_pose, result_cloud_ptr_, cloud_pose);

    LOG(INFO) << "CLOUD POSE:" <<cloud_pose << std::endl << std::endl;
    
    return true;
}