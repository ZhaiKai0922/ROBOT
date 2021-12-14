/*
  *@Author: Zhai Kai
  *@Data:2021-10-26 09:37
  */
#ifndef CLOUD_DATA_HPP
#define CLOUD_DATA_HPP

#include <pcl-1.8/pcl/point_types.h>
#include <pcl-1.8/pcl/point_cloud.h>

class CloudData{
    public:
    using POINT = pcl::PointXYZ;
    using CLOUD = pcl::PointCloud<POINT>;
    using CLOUD_PTR = CLOUD::Ptr;

    public:
    CloudData():cloud_ptr(new CLOUD()){

    }

    public:
    double time = 0.0;
    CLOUD_PTR cloud_ptr;
};

#endif