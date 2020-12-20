
#ifndef MY_SLAM_GMAPPING_H
#define MY_SLAM_GMAPPING_H

#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "std_msgs/Float64.h"
#include "nav_msgs/GetMap.h"
#include "tf/transform_listener.h"
#include "tf/transform_broadcaster.h"
#include "message_filters/subscriber.h"
#include "tf/message_filter.h"

#include "../part_slam/gridfastslam/gridslamprocessor.h"

#include <boost/thread.hpp>

/***********************************************************************************************************
  基于滤波器的SLAM算法-《gmapping算法的删减版》
  在原来gmapping源码的基础之上，公众号：小白学移动机器人的作者对其进行了大刀阔斧的更改。
  （1）删除几乎所有不需要的代码，对代码的运行结构也进行了调整
  （2）对该代码进行详细中文注释，以及对核心代码进行更改
  =============公众号：小白学移动机器人========================================================================
  欢迎关注公众号，从此学习的路上变得不再孤单，加油！奥利给！！！
  2020年11月11日
***********************************************************************************************************/

#define   MAP_IDX(sx, i, j) ((sx) * (j) + (i))

#define   GMAPPING_FREE         (0)
#define   GMAPPING_UNKNOWN      (-1)
#define   GMAPPING_OCC          (100)

class MySlamGMapping
{
  public:
    MySlamGMapping();
    ~MySlamGMapping();
    
    void init();          
    void startLiveSlam(); 
    void laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan);                    

    bool mapCallback(nav_msgs::GetMap::Request  &req,nav_msgs::GetMap::Response &res);   
    void publishLoop(double transform_publish_period);                                   
    void publishTransform();                                                          

  private:

    bool initMapper(const sensor_msgs::LaserScan& scan);                                 
    bool addScan(const sensor_msgs::LaserScan& scan, GMapping::OrientedPoint& gmap_pose);
    bool getOdomPose(GMapping::OrientedPoint& gmap_pose, const ros::Time& t);            
    void updateMap(const sensor_msgs::LaserScan& scan);                                  

    ros::NodeHandle node_;                     
    ros::Publisher sst_;                       
    ros::Publisher sstm_;                     
    ros::ServiceServer ss_;                    

    tf::TransformListener tf_;                 
    message_filters::Subscriber<sensor_msgs::LaserScan>* scan_filter_sub_;
    tf::MessageFilter<sensor_msgs::LaserScan>* scan_filter_;

    tf::TransformBroadcaster* tfB_;           

    GMapping::GridSlamProcessor* gsp_;         
    std::vector<double> laser_angles_;         

    bool got_first_scan_;                             
    bool got_map_;                             

    nav_msgs::GetMap::Response map_;           

    ros::Duration map_update_interval_;        
    tf::Transform map_to_odom_;                
    boost::mutex map_to_odom_mutex_;           
    boost::mutex map_mutex_;                   

    boost::thread* transform_thread_;          

    std::string laser_frame_;                  
    std::string scan_topic_;                       
    std::string map_frame_;                    
    std::string odom_frame_;                   

    
    double maxRange_;                         
    double maxUrange_;                         
    double minimum_score_;                     
    double sigma_;                             
    int kernelSize_;                           
    double lstep_;
    double astep_;
    int iterations_;
    double lsigma_;                            
    double ogain_;
    int lskip_;
    double srr_;
    double srt_;
    double str_;
    double stt_;
    double linearUpdate_;
    double angularUpdate_;
    double temporalUpdate_;
    double resampleThreshold_;
    int particles_;
    double xmin_;
    double ymin_;
    double xmax_;
    double ymax_;
    double delta_;
    double occ_thresh_;
    
    ros::NodeHandle private_nh_;              
    
    unsigned long int seed_;                  
    
    double transform_publish_period_;
    double tf_delay_;
};

#endif
