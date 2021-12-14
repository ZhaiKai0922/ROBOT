/*
  *@Author: Zhai Kai
  *@Data:2021-10-26 21:47
  */
#ifndef FRONT_END_HPP
#define FRONT_END_HPP

#include <deque>
#include <eigen3/Eigen/Dense>
#include <pcl-1.8/pcl/registration/icp.h>

#include <yaml-cpp/yaml.h>

#include "include/cloud_data.hpp"
#include "include/registration_interface.hpp"
#include "include/icp_registration.hpp"

class FrontEnd{
    public:
    struct Frame{
        Eigen::Matrix4f pose = Eigen::Matrix4f::Identity();
        CloudData cloud_data;
    };

    public:
    FrontEnd();

    bool InitWithConfig();
    bool Update(const CloudData& cloud_data, const CloudData& target_cloud_data, EIgen::Matrix4f& cloud_pose);
    bool SetInitPose(Eigen::Matrix4f& init_pose);

    bool SaveMap();

    private:
    std::string data_path_ = " ";

    std::shared_ptr<RegistrationInterface> registration_ptr_;

    CloudData::CLOUD_PTR  result_cloud_ptr_;

    Eigen::Matrix4f init_pose_ = Eigen::Matrix4f::Identity();

};

#endif