/*
* @Description: IMU-Lidar fusion for localizatioin
* @Author: Zhai Kai
* @Date: 2021-6-11 14:47
*/

#include "lidar_localization/filtering/kitti_filtering.hpp"

#include "glog/logging.h"
#include <pcl/common/transforms.h>
#include <pcl/io/pcd_io.h>

#include "lidar_localization/global_defination/global_defination.h"

#include "lidar_localization/models/cloud_filter/no_filter.hpp"
#include "lidar_localization/models/cloud_filter/voxel_filter.hpp"

#include "lidar_localization/models/registration/ndt_registration.hpp"

#include "lidar_localization/models/kalman_filter/error_state_kalman_filter.hpp"
#include "lidar_localization/models/kalman_filter/extended_kalman_filter.hpp"

KITTIFiltering::KITTIFiltering()
    :global_map_ptr_(new CloudData::CLOUD()),
     local_map_ptr_(new CloudData::CLOUD()),
     current_scan_ptr_(new CloudData::CLOUD())
{
    InitWithConfig();
}

bool  KITTIFiltering::Init(const CloudData &init_scan,
                           const Eigen::Vector3f &init_vel,
                           const IMUData &init_imu_data)
{
  if (SetInitScan(init_scan)) {
    current_vel_ = init_vel;

    //***********kalman_filter_ptr_->Init()**********
    kalman_filter_ptr_->Init(current_vel_.cast<double>(), init_imu_data);

    return true;
  }

  return false;
}

bool KITTIFiltering::Init(const Eigen::Matrix4f &init_pose,
                          const Eigen::Vector3f &init_vel,
                          const IMUData &init_imu_data) {
  if (SetInitGNSS(init_pose)) {
    current_vel_ = init_vel;

    kalman_filter_ptr_->Init(current_vel_.cast<double>(), init_imu_data);

    return true;
  }

  return false;
}

//*******************Update********************************
bool KITTIFiltering::Update(const IMUData &imu_data) {
  if (kalman_filter_ptr_->Update(imu_data)) {

    //**********************kalman_filter_ptr_*********************
    kalman_filter_ptr_->GetOdometry(current_pose_, current_vel_);

    return true;
  }

  return false;
}

//*****************Correct*******************************
bool KITTIFiltering::Correct(const IMUData &imu_data,
                             const CloudData &cloud_data,
                             const PosVelData &pos_vel_data,
                             Eigen::Matrix4f &cloud_pose)
{
  static Eigen::Matrix4f step_pose = Eigen::Matrix4f::Identity();
  static Eigen::Matrix4f last_pose = init_pose_;
  static Eigen::Matrix4f predict_pose = init_pose_;

  // remove invalid measurements:
  std::vector<int> indices;
  pcl::removeNaNFromPointCloud(*cloud_data.cloud_ptr, *cloud_data.cloud_ptr,
                               indices);

  // downsample:
  CloudData::CLOUD_PTR filtered_cloud_ptr(new CloudData::CLOUD());
  current_scan_filter_ptr_->Filter(cloud_data.cloud_ptr, filtered_cloud_ptr);

  if (!has_inited_) {
    predict_pose = current_gnss_pose_;
  }

  // matching:
  CloudData::CLOUD_PTR result_cloud_ptr(new CloudData::CLOUD());
  registration_ptr_->ScanMatch(filtered_cloud_ptr, predict_pose,
                               result_cloud_ptr, cloud_pose);
  pcl::transformPointCloud(*cloud_data.cloud_ptr, *current_scan_ptr_,
                           cloud_pose);

  // update predicted pose:
  step_pose = last_pose.inverse() * cloud_pose;
  predict_pose = cloud_pose * step_pose;
  last_pose = cloud_pose;

  // shall the local map be updated:
  std::vector<float> edge = local_map_segmenter_ptr_->GetEdge();
  for (int i = 0; i < 3; i++) {
    if (fabs(cloud_pose(i, 3) - edge.at(2 * i)) > 50.0 &&
        fabs(cloud_pose(i, 3) - edge.at(2 * i + 1)) > 50.0) {
      continue;
    }

    ResetLocalMap(cloud_pose(0, 3), cloud_pose(1, 3), cloud_pose(2, 3));
    break;
  }

  // set lidar measurement:
  current_measurement_.time = cloud_data.time;
  current_measurement_.T_nb =
      (init_pose_.inverse() * cloud_pose).cast<double>();
  current_measurement_.v_b = pos_vel_data.vel.cast<double>();
  current_measurement_.w_b =
      Eigen::Vector3d(imu_data.angular_velocity.x, imu_data.angular_velocity.y,
                      imu_data.angular_velocity.z);

  //***********************!!!************************
  //kalman correction:
  // Kalman correction:
  if (kalman_filter_ptr_->Correct(imu_data, KalmanFilter::MeasurementType::POSE,  //parameter POSE, imu_data???
                                  current_measurement_)) {
    kalman_filter_ptr_->GetOdometry(current_pose_, current_vel_);

    return true;
  }

  return false;
}


