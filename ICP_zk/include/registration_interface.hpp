/*
  *@Author: Zhai Kai
  *@Data:2021-10-26 09:37
  */

#ifndef REGISTRATION_INTERFACE_HPP
#define REGISTRATION_INTERFACE_HPP

#include <yaml-cpp/yaml.h>
#include <eigen3/Eigen/Dense>
#include "cloud_data.hpp"

class RegistrationInterface{
    public:
    virtual ~RegistrationInterface() = default;

    virtual bool SetInputTarget(const CloudData::CLOUD_PTR& input_target) = 0;
    virtual bool ScanMatch(const CloudData::CLOUD_PTR& input_source,
                                                     const Eigen::Matrix4f& predict_pose,
                                                     CloudData::CLOUD_PTR& result_cloud_ptr,
                                                     Eigen::Matrix4f& result_pose) = 0;
};

#endif