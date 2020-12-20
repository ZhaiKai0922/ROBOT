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

/*构造函数-初始化相关变量，比如指针的初始化*/
MySlamGMapping::MySlamGMapping():
    map_to_odom_(tf::Transform(tf::createQuaternionFromRPY( 0, 0, 0 ), tf::Point(0, 0, 0 ))),//默认两个坐标系重合
    private_nh_("~"), 
    scan_filter_sub_(NULL), 
    scan_filter_(NULL), 
    transform_thread_(NULL)
{
    seed_ = time(NULL);
    init();
}

/*析构函数*/
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

/*slamgmapping的初始化，主要用来读取配置文件中写入的参数*/
void MySlamGMapping::init()
{
    //new一个GridSlamProcessor对象，也是ros和gridslam的连接
    gsp_ = new GMapping::GridSlamProcessor();              //这里需要跳入去看，第一次不要看
    //new一个TransformBroadcaster对象，用来发布map和odom的关系
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

    //GMapping算法本身使用的参数
    maxUrange_ = 0.0;  maxRange_ = 0.0; 
    if(!private_nh_.getParam("minimumScore", minimum_score_))
        minimum_score_ = 0;
    if(!private_nh_.getParam("sigma", sigma_))
        sigma_ = 0.05;
    if(!private_nh_.getParam("kernelSize", kernelSize_))
        kernelSize_ = 1;
    if(!private_nh_.getParam("lstep", lstep_))
        lstep_ = 0.05;//默认一个栅格距离大小变化
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

/*开始实时SLAM*/
void MySlamGMapping::startLiveSlam()
{
    sst_ = node_.advertise<nav_msgs::OccupancyGrid>("map", 1, true);
    sstm_ = node_.advertise<nav_msgs::MapMetaData>("map_metadata", 1, true);
    ss_ = node_.advertiseService("dynamic_map", &MySlamGMapping::mapCallback, this);

    {
        //用message_filters来订阅scan_topic_，进而初始化scan_filter_，
        scan_filter_sub_ = new message_filters::Subscriber<sensor_msgs::LaserScan>(node_, scan_topic_, 5);
        //tf::MessageFilter，订阅激光数据同时和odom_frame之间的转换同步
        scan_filter_ = new tf::MessageFilter<sensor_msgs::LaserScan>(*scan_filter_sub_, tf_, odom_frame_, 5);
        //scan_filter_注册回调函数laserCallback
        scan_filter_->registerCallback(boost::bind(&MySlamGMapping::laserCallback, this, _1));

        std::cout <<"Start Subscribe LaserScan & odom!!!"<<std::endl;
    }

    /*发布map到odom的转换关系的线程*/
    transform_thread_ = new boost::thread(boost::bind(&MySlamGMapping::publishLoop, this, transform_publish_period_));

    std::cout <<"Start transform_thread "<<std::endl;
}

//每当到达一帧scan数据，就将调用laserCallback函数
void MySlamGMapping::laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
    static ros::Time last_map_update(0,0);     //上一次地图更新的时间

    if(!got_first_scan_)                       //如果是第一次接收scan
    {
        if(!initMapper(*scan))                 //初始化地图
            return;
        got_first_scan_ = true;                //改变第一帧的标志位
    }

    GMapping::OrientedPoint odom_pose;         //当前里程计坐标系下的激光雷达位姿的临时变量    
    if(addScan(*scan, odom_pose))
    {
        std::cout<<"addScan finish"<<std::endl;

        //最优粒子，地图坐标系下的位姿
        GMapping::OrientedPoint mpose = gsp_->getParticles()[gsp_->getBestParticleIndex()].pose;

        //在激光雷达当前位姿下，用当前的里程计坐标系下的激光雷达位姿和map坐标系下的激光雷达位姿，来表述里程计坐标系和map坐标系的差距
        //因为两个坐标系描述的是同一个激光雷达，所以才能用位姿的不同描述坐标系变换关系（差异）
        tf::Transform map_to_lidar  = tf::Transform(tf::createQuaternionFromRPY(0, 0, mpose.theta), 
                                                    tf::Vector3(mpose.x, mpose.y, 0.0));
        tf::Transform odom_to_lidar = tf::Transform(tf::createQuaternionFromRPY(0, 0, odom_pose.theta), 
                                                    tf::Vector3(odom_pose.x, odom_pose.y, 0.0));
        //多个线程访问同一资源时，为了保证数据的一致性，最简单的方式就是使用 mutex（互斥锁）
        //阻止了同一时刻有多个线程并发访问共享资源
        map_to_odom_mutex_.lock();
        map_to_odom_ = map_to_lidar * (odom_to_lidar.inverse()); //表述里程计坐标系和map坐标系的差距 
        map_to_odom_mutex_.unlock();

        //多久更新一次地图
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

//第一帧激光数据来临，需要做的事情，保证雷达水平朝上安装，确保车体坐标系和激光雷达坐标系方向一致
bool MySlamGMapping::initMapper(const sensor_msgs::LaserScan& scan)
{
    laser_frame_=scan.header.frame_id;
    // 这里认为激光雷达数据的角度是对称的，且是从小到大递增的,也是误差产生的原因
    // 因此根据激光雷达数据中的angle_min,angle_increment等数据为每个激光束分配角度。
    laser_angles_.resize(scan.ranges.size());
    double theta = scan.angle_min;                  //直接从最小的角度开始，这里暂时只考虑LaserScan的数据
    for(unsigned int i=0; i<scan.ranges.size(); ++i)
    {
        laser_angles_[i]=theta;                     //从小到大记录激光雷达数据的弧度
        theta += scan.angle_increment;
    }

    //通过真实的激光雷达数据，设置gmapping算法中激光的最大距离和最大使用距离，这样是为什么前面不一起初始化的原因
    ros::NodeHandle private_nh_("~");
    if(!private_nh_.getParam("maxRange", maxRange_))
        maxRange_ = scan.range_max - 0.01;
    if(!private_nh_.getParam("maxUrange", maxUrange_))
        maxUrange_ = maxRange_;

    //得到里程计的初始位姿，如果没有 则把初始位姿设置为(0,0,0)，也是建立地图的起始位置
    GMapping::OrientedPoint initialPose;
    if(!getOdomPose(initialPose, scan.header.stamp))
    {
        ROS_WARN("Unable to determine inital pose of laser! Starting point will be set to zero.");
        initialPose = GMapping::OrientedPoint(0.0, 0.0, 0.0);
    }

    //设置激光雷达参数
    gsp_->m_matcher.setLaserParameters(scan.ranges.size(),&(laser_angles_[0]));
    //为gmapping算法设置各种参数
    gsp_->setMatchingParameters(maxUrange_, maxRange_, sigma_,kernelSize_, lstep_, astep_, iterations_,lsigma_, ogain_, lskip_);
    gsp_->setMotionModelParameters(srr_, srt_, str_, stt_);
    gsp_->setUpdateDistances(linearUpdate_, angularUpdate_, resampleThreshold_);
    gsp_->setUpdatePeriod(temporalUpdate_);
    //初始化 m_generateMap = false（是scanmatch中的成员变量）
    gsp_->setgenerateMap(false);
    //初始化粒子个数，地图尺寸，分辨率，建图初始位姿
    gsp_->GridSlamProcessor::init(particles_, xmin_, ymin_, xmax_, ymax_,delta_, initialPose);
    gsp_->setminimumScore(minimum_score_);
    //高斯噪声的随机数种子
    GMapping::sampleGaussian(1,seed_);

    ROS_DEBUG("initMapper complete");

    return true;
}

//每一帧激光数据，都要通过该函数封装gmapping算法需要的数据格式，并调用核心算法
bool MySlamGMapping::addScan(const sensor_msgs::LaserScan& scan, GMapping::OrientedPoint& gmap_pose)
{
    //得到与激光的时间戳相对应的里程计位姿gmap_pose
    if(!getOdomPose(gmap_pose, scan.header.stamp))
        return false;

    //对一帧激光数据的预处理，对距离小于range_min的数据，最大化
    double* ranges_double = new double[scan.ranges.size()];
    
    //数据处理
    for(unsigned int i=0; i < scan.ranges.size(); i++)
    {
        if(scan.ranges[i] < scan.range_min)
            ranges_double[i] = (double)scan.range_max;
        else
            ranges_double[i] = (double)scan.ranges[i];
    }

    //把ROS的激光雷达数据信息 转换为 GMapping算法看得懂的形式
    GMapping::RangeReading reading(scan.ranges.size(),
                                   ranges_double);

    //内存释放。
    delete[] ranges_double;

    //为每一个reading设置里程计位姿
    reading.setPose(gmap_pose);

    //调用gmapping算法进行处理,传入算法看的懂的数据结构
    return gsp_->processScan(reading);
}

//通过每一帧scan的时间戳，计算出当前里程计坐标系下激光雷达的位姿
bool MySlamGMapping::getOdomPose(GMapping::OrientedPoint& gmap_pose, const ros::Time& t)
{
    tf::Stamped<tf::Pose> ident (tf::Transform(tf::createQuaternionFromRPY(0,0,0),tf::Vector3(0,0,0)), t, laser_frame_);
    //odom_pose存储输出的里程计坐标系下激光雷达tf::Stamped<tf::Pose>格式的位姿
    tf::Stamped<tf::Pose> odom_pose;
    try
    {
        //odom_frame_ 目标坐标系
        //ident，传入时间戳和坐标系
        //odom_pose 得到该时间戳下的位姿数据
        tf_.transformPose(odom_frame_, ident, odom_pose);
    }
    catch(tf::TransformException e)
    {
        ROS_WARN("Failed to compute odom pose, skipping scan (%s)", e.what());
        return false;
    }
    //通过转化得到OrientedPoint格式的里程计坐标系下的位姿
    double yaw = tf::getYaw(odom_pose.getRotation());
    gmap_pose = GMapping::OrientedPoint(odom_pose.getOrigin().x(),
                                        odom_pose.getOrigin().y(),
                                        yaw);
    return true;
}

//地图更新，第一次没有地图直接更新，之后按照周期更新地图
void MySlamGMapping::updateMap(const sensor_msgs::LaserScan& scan)
{
    ROS_DEBUG("Update map start");
    //scope_lock:严格基于作用域的锁管理类模板
    //构造时是否加锁是可选的(不加锁时假定当前线程已经获得锁的所有权)，析构时自动释放锁，所有权不可转移
    //对象生存期内不允许手动加锁和释放锁
    boost::mutex::scoped_lock map_lock (map_mutex_);
    GMapping::ScanMatcher matcher;

    /*设置scanmatcher的各个参数*/
    matcher.setLaserParameters(scan.ranges.size(), &(laser_angles_[0]));
    matcher.setlaserMaxRange(maxRange_);
    matcher.setusableRange(maxUrange_);
    matcher.setgenerateMap(true);

    /*得到权重最高的粒子*/
    GMapping::GridSlamProcessor::Particle best = gsp_->getParticles()[gsp_->getBestParticleIndex()];

    //如果没有地图 则初始化一个地图，连地图map_.map的长宽都没初始化
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

    /*地图的中点*/
    GMapping::Point center;
    center.x=(xmin_ + xmax_) / 2.0;
    center.y=(ymin_ + ymax_) / 2.0;

    /*初始化一个scanmatcherMap 创建一个地图*/
    //这里的地图一定要区分，part_slam算法部分的地图，这里可视化用
    //区别smap与map_.map这个非常重要
    GMapping::ScanMatcherMap smap(center, xmin_, ymin_, xmax_, ymax_,delta_);

    //遍历粒子的整条轨迹 按照轨迹上各个节点存储的信息来重新绘制一个地图
    for(GMapping::GridSlamProcessor::TNode* n = best.node;n;n = n->parent)
    {
        if(!n->reading)
        {
            ROS_DEBUG("Reading is NULL");
            continue;
        }
        //拓展地图大小、找到地图的有效区域、申请内存、更新每个被经过的栅格数据，一条龙
        matcher.computeActiveArea(smap, n->pose, &(n->reading->m_dists[0]));
        matcher.registerScan(smap, n->pose, &(n->reading->m_dists[0]));
    }

    // 根据smap地图更改可视化地图的内容
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
        map_.map.data.resize(map_.map.info.width * map_.map.info.height);//存储栅格数据的数组大小，可视化用的

        ROS_DEBUG("map origin: (%f, %f)", map_.map.info.origin.position.x, map_.map.info.origin.position.y);
    }

    //根据smap地图中存储的栅格数据，修改map_.map.data[]的数据,这里为一维数组
    for(int x=0; x < smap.getMapSizeX(); x++)
    {
        for(int y=0; y < smap.getMapSizeY(); y++)
        {
            //从smap中得到栅格点p(x, y)被占用的概率
            GMapping::IntPoint p(x, y);
            double occ=smap.cell(p); // -1、0-1，到达一定的occ_thresh_认为被占用
            assert(occ <= 1.0);

            //未知
            if(occ < 0)
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_UNKNOWN;
            //占用
            else if(occ > occ_thresh_)//默认0.25
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_OCC;
            //空闲
            else
                map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = GMAPPING_FREE;
        }
    }

    //到了这一步，肯定是有地图了。
    got_map_ = true;

    //把计算出来的地图发布出去
    map_.map.header.stamp = ros::Time::now();
    map_.map.header.frame_id = map_frame_;

    //发布map和map_metadata
    sst_.publish(map_.map);      
    sstm_.publish(map_.map.info);
}

//地图服务的回调函数
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

/*发布map->odom的转换关系*/
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

/*发布map到odom的转换关系*/
void MySlamGMapping::publishTransform()
{
    map_to_odom_mutex_.lock();
    //默认情况下 tf_delay_ = transform_publish_period_;
    //默认情况下ros::Duration(tf_delay_)时间长度，等于 r.sleep();的时间长度
    ros::Time tf_expiration = ros::Time::now() + ros::Duration(tf_delay_);//这个没搞明白为啥要加这一点时间，感觉没有必要
    tfB_->sendTransform( tf::StampedTransform (map_to_odom_, tf_expiration, map_frame_, odom_frame_));
    map_to_odom_mutex_.unlock();
}
