#include "my_slam_gmapping.h"
#include <iostream>
#include <time.h>
#include "ros/console.h"
#include "nav_msgs/MapMetaData.h"
#include "std_msgs/String.h"

/***********************************************************************************************************
  基于滤波器的SLAM算法-《gmapping算法的删减版》
  在原来gmapping源码的基础之上，公众号：小白学移动机器人的作者对其进行了大刀阔斧的修改。
  （1）删除几乎所有不需要的代码，对代码的运行结构也进行了调整
  （2）对该代码进行详细中文注释，以及对核心代码进行更改
  （3）算法核心功能改变不大，算法效果和源码无明显差别
  =============公众号：小白学移动机器人========================================================================
  欢迎关注公众号，从此学习的路上变得不再孤单，加油！奥利给！！！
  2020年11月11日
***********************************************************************************************************/


MySlamGMapping::MySlamGMapping():
    map_to_odom_(tf::Transform(tf::createQuaternionFromRPY( 0, 0, 0 ), tf::Point(0, 0, 0 ))),
    private_nh_("~"), 
    scan_filter_sub_(NULL), 
    scan_filter_(NULL), 
    transform_thread_(NULL)
{
    seed_ = time(NULL);
    init();
}

MySlamGMapping::~MySlamGMapping()
{
    if(transform_thread_)
    {
        transform_thread_->join();
        delete transform_thread_;
    }

    delete gsp_;

    if (scan_filter_)
        delete scan_filter_;
    if (scan_filter_sub_)
        delete scan_filter_sub_;
}


void MySlamGMapping::init()
{
    gsp_ = new GMapping::GridSlamProcessor();             
    tfB_ = new tf::TransformBroadcaster();

    got_first_scan_ = false;
    got_map_ = false;

    if(!private_nh_.getParam("map_frame", map_frame_))
        map_frame_ = "map";
    if(!private_nh_.getParam("odom_frame", odom_frame_))
        odom_frame_ = "odom";
    if(!private_nh_.getParam("scan_topic", scan_topic_))
        scan_topic_ = "scan";

    private_nh_.param("transform_publish_period", transform_publish_period_, 0.05);

    double tmp;
    if(!private_nh_.getParam("map_update_interval", tmp))
        tmp = 5.0;
    map_update_interval_.fromSec(tmp);

    maxUrange_ = 0.0;  maxRange_ = 0.0; 
    if(!private_nh_.getParam("minimumScore", minimum_score_))
        minimum_score_ = 0;
    if(!private_nh_.getParam("sigma", sigma_))
        sigma_ = 0.05;
    if(!private_nh_.getParam("kernelSize", kernelSize_))
        kernelSize_ = 1;
    if(!private_nh_.getParam("lstep", lstep_))
        lstep_ = 0.05;
    if(!private_nh_.getParam("astep", astep_))
        astep_ = 0.05;
    if(!private_nh_.getParam("iterations", iterations_))
        iterations_ = 5;
    if(!private_nh_.getParam("lsigma", lsigma_))
        lsigma_ = 0.075;
    if(!private_nh_.getParam("ogain", ogain_))
        ogain_ = 3.0;
    if(!private_nh_.getParam("lskip", lskip_))
        lskip_ = 0;
    if(!private_nh_.getParam("srr", srr_))
        srr_ = 0.1;
    if(!private_nh_.getParam("srt", srt_))
        srt_ = 0.2;
    if(!private_nh_.getParam("str", str_))
        str_ = 0.1;
    if(!private_nh_.getParam("stt", stt_))
        stt_ = 0.2;
    if(!private_nh_.getParam("linearUpdate", linearUpdate_))
        linearUpdate_ = 1.0;
    if(!private_nh_.getParam("angularUpdate", angularUpdate_))
        angularUpdate_ = 0.5;
    if(!private_nh_.getParam("temporalUpdate", temporalUpdate_))
        temporalUpdate_ = -1.0;
    if(!private_nh_.getParam("resampleThreshold", resampleThreshold_))
        resampleThreshold_ = 0.5;
    if(!private_nh_.getParam("particles", particles_))
        particles_ = 30;
    if(!private_nh_.getParam("xmin", xmin_))
        xmin_ = -100.0;
    if(!private_nh_.getParam("ymin", ymin_))
        ymin_ = -100.0;
    if(!private_nh_.getParam("xmax", xmax_))
        xmax_ = 100.0;
    if(!private_nh_.getParam("ymax", ymax_))
        ymax_ = 100.0;
    if(!private_nh_.getParam("delta", delta_))
        delta_ = 0.05;
    if(!private_nh_.getParam("occ_thresh", occ_thresh_))
        occ_thresh_ = 0.25;

    if(!private_nh_.getParam("tf_delay", tf_delay_))
        tf_delay_ = transform_publish_period_;
        
    std::cout<<"MySlamGMapping::init finish"<<std::endl;
}

void MySlamGMapping::startLiveSlam()
{
    sst_ = node_.advertise<nav_msgs::OccupancyGrid>("map", 1, true);
    sstm_ = node_.advertise<nav_msgs::MapMetaData>("map_metadata", 1, true);
    ss_ = node_.advertiseService("dynamic_map", &MySlamGMapping::mapCallback, this);

    {
        scan_filter_sub_ = new message_filters::Subscriber<sensor_msgs::LaserScan>(node_, scan_topic_, 5);
        scan_filter_ = new tf::MessageFilter<sensor_msgs::LaserScan>(*scan_filter_sub_, tf_, odom_frame_, 5);
        scan_filter_->registerCallback(boost::bind(&MySlamGMapping::laserCallback, this, _1));

        std::cout <<"Start Subscribe LaserScan & odom!!!"<<std::endl;
    }

    transform_thread_ = new boost::thread(boost::bind(&MySlamGMapping::publishLoop, this, transform_publish_period_));

    std::cout <<"Start transform_thread "<<std::endl;
}


void MySlamGMapping::laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
    static ros::Time last_map_update(0,0);     

    if(!got_first_scan_)                       
    {
        if(!initMapper(*scan))                 
            return;
        got_first_scan_ = true;                
    }

    GMapping::OrientedPoint odom_pose;             
    if(addScan(*scan, odom_pose))
    {
        std::cout<<"addScan finish"<<std::endl;

        GMapping::OrientedPoint mpose = gsp_->getParticles()[gsp_->getBestParticleIndex()].pose;

        tf::Transform map_to_base  = tf::Transform(tf::createQuaternionFromRPY(0, 0, mpose.theta), 
                                                    tf::Vector3(mpose.x, mpose.y, 0.0));
        tf::Transform odom_to_base = tf::Transform(tf::createQuaternionFromRPY(0, 0, odom_pose.theta), 
                                                    tf::Vector3(odom_pose.x, odom_pose.y, 0.0));

        map_to_odom_mutex_.lock();
        map_to_odom_ = map_to_base * (odom_to_base.inverse());
        map_to_odom_mutex_.unlock();

        if(!got_map_ || (scan->header.stamp - last_map_update) > map_update_interval_)
        {
            updateMap(*scan);
            last_map_update = scan->header.stamp;
            std::cout<<"Updated the map"<<std::endl;
        }
    }
    else
    {
        ROS_DEBUG("cannot process scan");
    }
}

bool MySlamGMapping::initMapper(const sensor_msgs::LaserScan& scan)
{
    laser_frame_=scan.header.frame_id;
    laser_angles_.resize(scan.ranges.size());
    double theta = scan.angle_min;                  
    for(unsigned int i=0; i<scan.ranges.size(); ++i)
    {
        laser_angles_[i]=theta;                     
        theta += scan.angle_increment;
    }

    ros::NodeHandle private_nh_("~");
    if(!private_nh_.getParam("maxRange", maxRange_))
        maxRange_ = scan.range_max - 0.01;
    if(!private_nh_.getParam("maxUrange", maxUrange_))
        maxUrange_ = maxRange_;

    GMapping::OrientedPoint initialPose;
    if(!getOdomPose(initialPose, scan.header.stamp))
    {
        ROS_WARN("Unable to determine inital pose of laser! Starting point will be set to zero.");
        initialPose = GMapping::OrientedPoint(0.0, 0.0, 0.0);
    }

    gsp_->m_matcher.setLaserParameters(scan.ranges.size(),&(laser_angles_[0]));
    gsp_->setMatchingParameters(maxUrange_, maxRange_, sigma_,kernelSize_, lstep_, astep_, iterations_,lsigma_, ogain_, lskip_);
    gsp_->setMotionModelParameters(srr_, srt_, str_, stt_);
    gsp_->setUpdateDistances(linearUpdate_, angularUpdate_, resampleThreshold_);
    gsp_->setUpdatePeriod(temporalUpdate_);
    gsp_->setgenerateMap(false);
    gsp_->GridSlamProcessor::init(particles_, xmin_, ymin_, xmax_, ymax_,delta_, initialPose);
    gsp_->setminimumScore(minimum_score_);

    GMapping::sampleGaussian(1,seed_);

    ROS_DEBUG("initMapper complete");

    return true;
}

bool MySlamGMapping::addScan(const sensor_msgs::LaserScan& scan, GMapping::OrientedPoint& gmap_pose)
{
    if(!getOdomPose(gmap_pose, scan.header.stamp))
        return false;

    double* ranges_double = new double[scan.ranges.size()];
    
    for(unsigned int i=0; i < scan.ranges.size(); i++)
    {
        if(scan.ranges[i] < scan.range_min)
            ranges_double[i] = (double)scan.range_max;
        else
            ranges_double[i] = (double)scan.ranges[i];
    }

    GMapping::RangeReading reading(scan.ranges.size(),
                                   ranges_double);

    delete[] ranges_double;

    reading.setPose(gmap_pose);

    return gsp_->processScan(reading);
}

bool MySlamGMapping::getOdomPose(GMapping::OrientedPoint& gmap_pose, const ros::Time& t)
{
    tf::Stamped<tf::Pose> ident (tf::Transform(tf::createQuaternionFromRPY(0,0,0),tf::Vector3(0,0,0)), t, laser_frame_);
    tf::Stamped<tf::Pose> odom_pose;
    try
    {
        tf_.transformPose(odom_frame_, ident, odom_pose);
    }
    catch(tf::TransformException e)
    {
        ROS_WARN("Failed to compute odom pose, skipping scan (%s)", e.what());
        return false;
    }
    double yaw = tf::getYaw(odom_pose.getRotation());
    gmap_pose = GMapping::OrientedPoint(odom_pose.getOrigin().x(),
                                        odom_pose.getOrigin().y(),
                                        yaw);
    return true;
}

void MySlamGMapping::updateMap(const sensor_msgs::LaserScan& scan)
{
    ROS_DEBUG("Update map start");
    boost::mutex::scoped_lock map_lock (map_mutex_);
    GMapping::ScanMatcher matcher;

    matcher.setLaserParameters(scan.ranges.size(), &(laser_angles_[0]));
    matcher.setlaserMaxRange(maxRange_);
    matcher.setusableRange(maxUrange_);
    matcher.setgenerateMap(true);

    GMapping::GridSlamProcessor::Particle best = gsp_->getParticles()[gsp_->getBestParticleIndex()];

    if(!got_map_)
    {
        map_.map.info.resolution = delta_;
        map_.map.info.origin.position.x = 0.0;
        map_.map.info.origin.position.y = 0.0;
        map_.map.info.origin.position.z = 0.0;
        map_.map.info.origin.orientation.x = 0.0;
        map_.map.info.origin.orientation.y = 0.0;
        map_.map.info.origin.orientation.z = 0.0;
        map_.map.info.origin.orientation.w = 1.0;
    }

    GMapping::Point center;
    center.x=(xmin_ + xmax_) / 2.0;
    center.y=(ymin_ + ymax_) / 2.0;

    GMapping::ScanMatcherMap smap(center, xmin_, ymin_, xmax_, ymax_,delta_);

    for(GMapping::GridSlamProcessor::TNode* n = best.node;n;n = n->parent)
    {
        if(!n->reading)
        {
            ROS_DEBUG("Reading is NULL");
            continue;
        }
        matcher.computeActiveArea(smap, n->pose, &(n->reading->m_dists[0]));
        matcher.registerScan(smap, n->pose, &(n->reading->m_dists[0]));
    }

    if(map_.map.info.width != (unsigned int) smap.getMapSizeX() || map_.map.info.height != (unsigned int) smap.getMapSizeY())
    {
        GMapping::Point wmin = smap.map2world(GMapping::IntPoint(0, 0));
        GMapping::Point wmax = smap.map2world(GMapping::IntPoint(smap.getMapSizeX(), smap.getMapSizeY()));
        xmin_ = wmin.x; 
        ymin_ = wmin.y;
        xmax_ = wmax.x; 
        ymax_ = wmax.y;

        ROS_DEBUG("map size is now %dx%d pixels (%f,%f)-(%f, %f)", smap.getMapSizeX(), smap.getMapSizeY(),
                  xmin_, ymin_, xmax_, ymax_);

        map_.map.info.width = smap.getMapSizeX();
        map_.map.info.height = smap.getMapSizeY();
        map_.map.info.origin.position.x = xmin_;
        map_.map.info.origin.position.y = ymin_;
        map_.map.data.resize(map_.map.info.width * map_.map.info.height);

        ROS_DEBUG("map origin: (%f, %f)", map_.map.info.origin.position.x, map_.map.info.origin.position.y);
    }

    for(int x=0; x < smap.getMapSizeX(); x++)
    {
        for(int y=0; y < smap.getMapSizeY(); y++)
        {
            GMapping::IntPoint p(x, y);
            double occ=smap.cell(p); 
            assert(occ <= 1.0);

            if(occ < 0)
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_UNKNOWN;
            else if(occ > occ_thresh_)
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_OCC;
            else
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_FREE;
        }
    }

    got_map_ = true;

    map_.map.header.stamp = ros::Time::now();
    map_.map.header.frame_id = map_frame_;

    sst_.publish(map_.map);      
    sstm_.publish(map_.map.info);
}

bool MySlamGMapping::mapCallback(nav_msgs::GetMap::Request  &req,
                               nav_msgs::GetMap::Response &res)
{
    boost::mutex::scoped_lock map_lock (map_mutex_);
    if(got_map_ && map_.map.info.width && map_.map.info.height)
    {
        res = map_;
        return true;
    }
    else
        return false;
}

void MySlamGMapping::publishLoop(double transform_publish_period)
{
    if(transform_publish_period == 0)
        return;

    ros::Rate r(1.0 / transform_publish_period);
    while(ros::ok())
    {
        publishTransform();
        r.sleep();
    }
}

void MySlamGMapping::publishTransform()
{
    map_to_odom_mutex_.lock();
    ros::Time tf_expiration = ros::Time::now() + ros::Duration(tf_delay_);
    tfB_->sendTransform( tf::StampedTransform (map_to_odom_, tf_expiration, map_frame_, odom_frame_));
    map_to_odom_mutex_.unlock();
}
