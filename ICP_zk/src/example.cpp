/*
  *@Author: Zhai Kai
  *@Data:2021-10-27 16:47
  */
#include <iostream>
#include <pcl-1.8/pcl/io/pcd_io.h>
#include <pcl-1.8/pcl/registration/icp.h>
#include "../include/cloud_data.hpp"
#include "../include/icp_registration.hpp"

int main()
{
CloudData::CLOUD_PTR cloud_in(new CloudData::CLOUD());
CloudData::CLOUD_PTR cloud_out(new CloudData::CLOUD());

cloud_in -> width = 5;
cloud_in -> height = 1;
cloud_in -> is_dense = false;
cloud_in -> points.resize(cloud_in -> width * cloud_in -> height);
for(size_t i = 0; i < cloud_in -> points.size(); ++i)
{
    cloud_in -> points[i].x = 1024 * rand()/(RAND_MAX + 1.0f);
    cloud_in -> points[i].y = 1024 * rand()/(RAND_MAX + 1.0f);
    cloud_in -> points[i].z = 1024 * rand()/(RAND_MAX + 1.0f);
}
std::cout << "Saved" << cloud_in -> points.size() << "data points to input:"<<
std::endl;

for(size_t i = 0; i < cloud_in -> points.size(); ++i)
{
    std::cout << "Points in:" << i << cloud_in -> points[i].x << " " 
    << cloud_in -> points[i].y << " "
    << cloud_in -> points[i].z << std::endl;
}

*cloud_out = *cloud_in;
std::cout << "size: " << cloud_out -> points.size() << std::endl;
for(size_t i = 0; i < cloud_in->points.size(); ++i)
{
    cloud_out -> points[i].x = cloud_in -> points[i].x + 0.7f;
}
std::cout << "Transformed" << cloud_in -> points.size() << "data points:" << std::endl;
for(size_t i = 0; i < cloud_out -> points.size(); ++i)
{
    std::cout << "Points in:" << i << cloud_out -> points[i].x << " " 
    << cloud_out -> points[i].y << " "
    << cloud_out -> points[i].z << std::endl;
}
//以上代码实现一个简单的点云刚体变换，以构造目标点云，并再次打印出数据值。

//pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>::Ptr icp_ptr_(new pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>());
std::shared_ptr<pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>> icp_ptr_ 
= std::make_shared<pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>>();

icp_ptr_ -> setInputSource(cloud_in);  //cloud_in为源点云
std::cout << "************CLOUD OUT************" << std::endl;
icp_ptr_ -> setInputTarget(cloud_out);  //cloud_out 为对应的匹配目标
/*以上代码创建了一个IterativeClosestPoint指针，并设置了对应的目标点云和源点云*/

std::cout << "***************ALIGN************" << std::endl;
CloudData::CLOUD_PTR final_cloud (new CloudData::CLOUD());
icp_ptr_ -> align(*final_cloud);
std::cout << "has converged:" << icp_ptr_ -> hasConverged() << "score:" <<
icp_ptr_ -> getFitnessScore() << std::endl;
std::cout << icp_ptr_ -> getFinalTransformation() << std::endl;

return 0;
}
