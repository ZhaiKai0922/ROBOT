/*
 * @Description: 数据预处理模块，包括时间同步、点云去畸变等
 * @Author: Ren Qian
 * @Date: 2020-02-10 08:38:42
 */
#include "lidar_localization/data_pretreat/data_pretreat_flow.hpp"

#include "glog/logging.h"
#include "lidar_localization/global_defination/global_defination.h"

namespace lidar_localization {
DataPretreatFlow::DataPretreatFlow(ros::NodeHandle& nh, std::string cloud_topic) {
    // subscriber
    // a. velodyne measurement:
    //cloud_sub_ptr_ = std::make_shared<CloudSubscriber>(nh, "/kitti/velo/pointcloud", 100000);
    cloud_sub_ptr_ = std::make_shared<CloudSubscriber>(nh, "/velodyne_points", 100000);
 
    // publisher
    cloud_pub_ptr_ = std::make_shared<CloudPublisher>(nh, cloud_topic, "/velo_link", 100);
}

bool DataPretreatFlow::Run() {
    if (!ReadData())
        return false;

    while(HasData()) {
        if (!ValidData())
            continue;

        //TransformData();
        PublishData();
    }

    return true;
}

bool DataPretreatFlow::ReadData() {

    // fetch lidar measurements from buffer:
    cloud_sub_ptr_->ParseData(cloud_data_buff_);
 

    if (cloud_data_buff_.size() == 0)
        return false;



    // only mark lidar as 'inited' when all the three sensors are synced:
    static bool sensor_inited = false;
    if (!sensor_inited) {
 
        sensor_inited = true;
    }

    return true;
}

bool DataPretreatFlow::HasData() {
    if (cloud_data_buff_.size() == 0)
        return false;

    return true;
}

bool DataPretreatFlow::ValidData() {
    current_cloud_data_ = cloud_data_buff_.front();

    cloud_data_buff_.pop_front();

    return true;
}

bool DataPretreatFlow::PublishData() {
    cloud_pub_ptr_->Publish(current_cloud_data_.cloud_ptr, current_cloud_data_.time);

    return true;
}
}