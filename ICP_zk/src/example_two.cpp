/*
  *@Author: Zhai Kai
  *@Data:2021-10-28 09:39
*/
#include <deque>
#include <vector>
#include <eigen3/Eigen/Dense>
#include <boost/make_shared.hpp>
#include <pcl-1.8/pcl/io/pcd_io.h>
#include <pcl-1.8/pcl/point_representation.h>
#include <pcl-1.8/pcl/filters/voxel_grid.h>
#include <pcl-1.8/pcl/filters/filter.h>
#include <pcl-1.8/pcl/features/normal_3d.h> //法线特征相关头文件
#include <pcl-1.8/pcl/registration/icp.h>  //ICP类相关头文件
#include <pcl-1.8/pcl/registration/icp_nl.h> //非线性ICP类相关头文件
#include <pcl-1.8/pcl/registration/transforms.h>  //变换矩阵类相关头文件
#include <pcl-1.8/pcl/visualization/pcl_visualizer.h> //可视化类相关文件
#include <glog/logging.h>
#include "../include/cloud_data.hpp"
#include "../include/registration_interface.hpp"
#include "../include/icp_registration.hpp"

using pcl::visualization::PointCloudColorHandlerGenericField;
using pcl::visualization::PointCloudColorHandlerCustom;
using PointNormalT = pcl::PointNormal;
using PointCloudWithNormals = pcl::PointCloud<PointNormalT>;

//ICP 参数设置：
std::shared_ptr<pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>> icp_ptr_ 
= std::make_shared<pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>>();
pcl::visualization::PCLVisualizer *p; //创建可视化对象
int vp_1, vp_2;

class key_frame{
    public:
    key_frame():frame_ptr(new CloudData::CLOUD()){ };
    
    public:
    Eigen::Matrix4f pose = Eigen::Matrix4f::Identity();
    CloudData::CLOUD_PTR frame_ptr;
    std::string f_name;
};

void showCloudLeft(const CloudData::CLOUD_PTR cloud_target, const CloudData::CLOUD_PTR cloud_source)
{
    p -> removePointCloud("vp1_target");
    p -> removePointCloud("vp1_source");
    PointCloudColorHandlerCustom<CloudData::POINT>  tgt_h (cloud_target, 0, 255, 0);
    PointCloudColorHandlerCustom<CloudData::POINT>  src_h (cloud_source, 255, 0, 0);
    p->addPointCloud (cloud_target, tgt_h, "vp1_target", vp_1);
    p->addPointCloud (cloud_source, src_h, "vp1_source", vp_1);
    PCL_INFO ("Press q to begin the registration.\n");
    //p-> spin();
}

void showCloudRight(const CloudData::CLOUD_PTR cloud_target, const CloudData::CLOUD_PTR cloud_source)
{
    p -> removePointCloud("source");
    p -> removePointCloud("target");
    PointCloudColorHandlerCustom<CloudData::POINT>  tgt_h_two (cloud_target, 0, 255, 0); //绿色
    PointCloudColorHandlerCustom<CloudData::POINT>  src_h_two (cloud_source, 255, 0, 0);

    p->addPointCloud (cloud_target, tgt_h_two, "target", vp_2);
    p->addPointCloud (cloud_source, src_h_two, "source", vp_2);
    //p -> spinOnce();
    //p-> spin();
}
// void showCloudRight(const PointCloudWithNormals::Ptr cloud_target, const PointCloudWithNormals::Ptr cloud_source)
// {
//     p -> removePointCloud("source");
//     p -> removePointCloud("target");
//     PointCloudColorHandlerGenericField<PointNormalT> tgt_color_handler(cloud_target, "curvature");
//     PointCloudColorHandlerGenericField<PointNormalT> src_color_handler(cloud_source, "curvature");

//     p->addPointCloud (cloud_target, tgt_color_handler, "target", vp_2);
//     p->addPointCloud (cloud_source, src_color_handler, "source", vp_2);
//     p -> spinOnce();
// }


void loadData(int argc, char** argv, std::deque<key_frame>& models)
{
    for(int i = 1; i < argc; i++)
    {
        std::string fname = std::string(argv[i]);

        key_frame temp;
        temp.f_name = fname;
        pcl::io::loadPCDFile(fname, *temp.frame_ptr);

        std::vector<int> indices;
        pcl::removeNaNFromPointCloud(*temp.frame_ptr, *temp.frame_ptr, indices);

        models.push_back(temp);
    }
}

int main(int argc, char** argv) {
    google::InitGoogleLogging(argv[0]); //初始化Glog库
    FLAGS_logtostderr = 1;
    FLAGS_colorlogtostderr = 1;
    
    //为了可视化目的，方便用户直观的观察到配准前后结果以及配准过程，
    //创建全局可视化对象变量，并定义左右视点分别显示配准前和配准后的结果点云

    std::deque<key_frame> data;
    loadData(argc, argv, data);

    if(data.empty())
    {
        LOG(WARNING) << "Data is empty!!!";
        return -1;
    }
    LOG(INFO) << "Data size :" << data.size();

    p = new pcl::visualization::PCLVisualizer(argc, argv, "Registration");
    p -> createViewPort(0.0, 0, 0.5, 1.0, vp_1);
    p -> createViewPort(0.5, 0, 1.0, 1.0, vp_2);

    static Eigen::Matrix4f step_pose = Eigen::Matrix4f::Identity();
    static Eigen::Matrix4f last_pose = Eigen::Matrix4f::Identity();
    static Eigen::Matrix4f predict_pose = Eigen::Matrix4f::Identity();
    static Eigen::Matrix4f last_key_frame_pose = Eigen::Matrix4f::Identity();

    std::deque<key_frame> local_map_frames;
    CloudData::CLOUD_PTR local_map_ptr;
    CloudData::CLOUD_PTR result(new CloudData::CLOUD());
    Eigen::Matrix4f result_pose = Eigen::Matrix4f::Identity();
    CloudData::CLOUD_PTR transformed_cloud(new CloudData::CLOUD());
    CloudData::CLOUD_PTR source, target;

    for(size_t i = 0; i < (data.size()-1); ++i)
    {
        local_map_frames.push_back(data[i]);
        local_map_ptr.reset(new CloudData::CLOUD());
        for(size_t j = 0; j < local_map_frames.size(); ++j)
        {
            pcl::transformPointCloud(*local_map_frames.at(i).frame_ptr,
                                                                    *transformed_cloud,
                                                                    local_map_frames.at(i).pose);
            *local_map_ptr += *transformed_cloud;
        }

        //Visual
        showCloudLeft(local_map_ptr, data[i+1].frame_ptr);

        LOG(INFO) << "START TO REGISTRATION .....";

        icp_ptr_ -> setInputTarget(local_map_ptr);
        LOG(INFO) << "Set Input Target.....";
        icp_ptr_ -> setInputSource(data[i+1].frame_ptr);
        LOG(INFO) << "Set Input Source.....";
        icp_ptr_ -> align(*result, predict_pose);  //???
        LOG(INFO) << "align.....";
        result_pose = icp_ptr_ -> getFinalTransformation();
        LOG(INFO) << "Get Final Transformation";
        data[i+1].pose = result_pose;

        LOG(INFO) << "SHOW RIGHT .....";

        //Visual
        showCloudRight(local_map_ptr, result);
        
        step_pose = last_pose.inverse() * result_pose;
        predict_pose = result_pose * step_pose;
        last_pose = result_pose;
    }

    p-> spin();
    return 0;

}


