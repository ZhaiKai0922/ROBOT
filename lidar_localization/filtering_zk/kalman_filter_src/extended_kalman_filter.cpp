/*
 *@Description: Extended Kalman Filter for IMU-Lidar-GNSS-Odom-Mag fusion
 *@Author: Zhai Kai
 *@Date: 2021-06-19 20:16
 */
#include <limits>

#include <cmath>
#include <iostream>
#include <fstream>
#include <ostream>

// use sophus to handle so3 hat & SO3 log operations:
#include <sophus/so3.hpp>

// SVD for observability analysis:
#include <Eigen/SVD>

// mag table lookup:
#include "lidar_localization/models/mag_table/geo_mag_declination.hpp"

#include "lidar_localization/models/kalman_filter/extended_kalman_filter.hpp"

#include "lidar_localization/global_defination/global_defination.h"

#include "lidar_localization/tools/CSVWriter.hpp"

#include "glog/logging.h"

    // e. process equation:
    F_.block<3, 3>( INDEX_POS, INDEX_VEL ) = Eigen::Matrix3d::Identity();

    // f. measurement equation:
    GPose_.block<3, 3>( 0, INDEX_POS ) = Eigen::Matrix3d::Identity();
    GPose_.block<4, 4>( 3, INDEX_ORI ) = Eigen::Matrix4d::Identity();

//**********位姿初始化、速度初始化、姿态初始化*********
/**
 * @brief  init filter
 * @param  pose, init pose
 * @param  vel, init vel
 * @param  imu_data, init IMU measurements
 * @return true if success false otherwise
 */
void ExtendedKalmanFilter::Init(
    const Eigen::Vector3d &vel,
    const IMUData &imu_data
) {
    // get init C_nb from IMU estimation:
    Eigen::Matrix3d C_nb = imu_data.GetOrientationMatrix().cast<double>();
    Eigen::Vector4d q_nb(
        imu_data.orientation.w, 
        imu_data.orientation.x, 
        imu_data.orientation.y, 
        imu_data.orientation.z
    );
    // get init v_n from v_b:
    Eigen::Vector3d v_n = C_nb*vel;

    // set init pose:
    init_pose_.block<3, 3>(0, 0) = C_nb;

    // set init velocity:
    init_vel_ = v_n;

    // set init state:
    X_.block<3, 1>(INDEX_POS, 0) = init_pose_.block<3, 1>(0, 3);
    X_.block<3, 1>(INDEX_VEL, 0) = v_n;
    X_.block<4, 1>(INDEX_ORI, 0) = q_nb;
    X_.block<3, 1>(INDEX_GYRO_BIAS, 0) = gyro_bias_;
    X_.block<3, 1>(INDEX_ACCEL_BIAS, 0) = accel_bias_;

    // init IMU data buffer:
    imu_data_buff_.clear();
    imu_data_buff_.push_back(imu_data);

    // init filter time:
    time_ = imu_data.time;

    LOG(INFO) << std::endl 
              << "IEKF Inited at " << static_cast<int>(time_) << std::endl
              << "Init Position: " 
              << init_pose_(0, 3) << ", "
              << init_pose_(1, 3) << ", "
              << init_pose_(2, 3) << std::endl
              << "Init Velocity: "
              << init_vel_.x() << ", "
              << init_vel_.y() << ", "
              << init_vel_.z() << std::endl;
}

//**************kalman update*******************
/**
 * @brief  Kalman update
 * @param  imu_data, input IMU measurements
 * @return true if success false otherwise
 */
bool ExtendedKalmanFilter::Update(const IMUData &imu_data)
{
    //update IMU buff:
    if(time_ < imu_data.time)
    {
        //kalman prediction for covariance:
        UpdateCovarianceEstimation(imu_data);

        //kalman prediction for state:
        imu_data_buff_.push_back(imu_data);
        UpdateStateEstimation();
        imu_data_buff_.pop_front();

        //move forward:
        time_ = imu_data.time

        return true;
    }

    return false;
}

