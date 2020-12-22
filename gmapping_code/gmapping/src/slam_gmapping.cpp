
#include "slam_gmapping.h"

#include <iostream>

#include <time.h>

#include "ros/ros.h"
#include "ros/console.h"
#include "nav_msgs/MapMetaData.h"

#include "gmapping/sensor/sensor_range/rangesensor.h"
#include "gmapping/sensor/sensor_odometry/odometrysensor.h"

#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <boost/foreach.hpp>
#define foreach BOOST_FOREACH

// compute linear index for given map coords
#define MAP_IDX(sx, i, j) ((sx) * (j) + (i))

//构造函数-初始化相关变量，比如指针初始化
SlamGMapping::SlamGMapping():
  map_to_odom_(tf::Transform(tf::createQuaternionFromRPY( 0, 0, 0 ), tf::Point(0, 0, 0 ))),
  laser_count_(0), private_nh_("~"), scan_filter_sub_(NULL), scan_filter_(NULL), transform_thread_(NULL)
{
  seed_ = time(NULL);
  init();
}

SlamGMapping::SlamGMapping(ros::NodeHandle& nh, ros::NodeHandle& pnh):
  map_to_odom_(tf::Transform(tf::createQuaternionFromRPY( 0, 0, 0 ), tf::Point(0, 0, 0 ))),
  laser_count_(0),node_(nh), private_nh_(pnh), scan_filter_sub_(NULL), scan_filter_(NULL), transform_thread_(NULL)
{
  seed_ = time(NULL);
  init();
}

SlamGMapping::SlamGMapping(long unsigned int seed, long unsigned int max_duration_buffer):
  map_to_odom_(tf::Transform(tf::createQuaternionFromRPY( 0, 0, 0 ), tf::Point(0, 0, 0 ))),
  laser_count_(0), private_nh_("~"), scan_filter_sub_(NULL), scan_filter_(NULL), transform_thread_(NULL),
  seed_(seed), tf_(ros::Duration(max_duration_buffer))
{
  init();
}

//slamgmapping的初始化，主要用来读取配置文件写入的参数
void SlamGMapping::init()
{
  //new一个GridSlamProessor对象，也是ros和gridslam的连接
  gsp_ = new GMapping::GridSlamProcessor();
  //new一个TransformBroadcaster对象，用来发布map与odom的关系
  tfB_ = new tf::TransformBroadcaster();
  ROS_ASSERT(tfB_);

  got_first_scan_ = false;
  got_map_ = false;
  
  
  // Parameters used by our GMapping wrapper
  //GMapping算法本身使用的参数
  if(!private_nh_.getParam("throttle_scans", throttle_scans_))
    throttle_scans_ = 1;
  if(!private_nh_.getParam("base_frame", base_frame_))
    base_frame_ = "base_link";
  if(!private_nh_.getParam("map_frame", map_frame_))
    map_frame_ = "map";
  if(!private_nh_.getParam("odom_frame", odom_frame_))
    odom_frame_ = "odom";

  private_nh_.param("transform_publish_period", transform_publish_period_, 0.05);

  double tmp;
  if(!private_nh_.getParam("map_update_interval", tmp))
    tmp = 5.0;
  map_update_interval_.fromSec(tmp);
  
  // Parameters used by GMapping itself
  maxUrange_ = 0.0;  maxRange_ = 0.0; // preliminary default, will be set in initMapper()
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
  if(!private_nh_.getParam("llsamplerange", llsamplerange_))
    llsamplerange_ = 0.01;
  if(!private_nh_.getParam("llsamplestep", llsamplestep_))
    llsamplestep_ = 0.01;
  if(!private_nh_.getParam("lasamplerange", lasamplerange_))
    lasamplerange_ = 0.005;
  if(!private_nh_.getParam("lasamplestep", lasamplestep_))
    lasamplestep_ = 0.005;
    
  if(!private_nh_.getParam("tf_delay", tf_delay_))
    tf_delay_ = transform_publish_period_;

}

//nav_msgs消息类型：GridCells 栅格单元 ①std_msgs/Header header 消息头，时间戳与坐标系 ② float32 cell_width float celll_heiht 宽度与高度
//③geometry_msgs/Point[] cells数组
//Odometry 估计的位姿与速度 ①std_msgs/Header header 位姿所在的坐标系 ②string child_frame_id 速度所在坐标系
// ③ geometry_msgs/PoseWithCovariance pose 位姿 ④ geometry_msgs/TwistWithCovariance twist 速度

//Path路径：①Header header ②geometry_msgs/PoseStamped[] poses 代表路径的三维点的坐标数组

//**************************************************************************************************************
//**********************************************************************************startLiveSlam( )***************
void SlamGMapping::startLiveSlam()
{
  //发布消息类型为std_msgs::Float64的话题entropy,队列长度为1，这是机器人姿态分布的熵的估计值，值越大表示较大的不确定性
  //这三个参数分别表示话题的名称，队列的长度，是否发布消息
  //entropy_publisher_ = private_nh_.advertise<std_msgs::Float64>("entropy", 1, true);
  sst_ = node_.advertise<nav_msgs::OccupancyGrid>("map", 1, true);//OccupancyGrid  2d栅格地图 ：
  //①Header header | ②nav_msgs/MapMetaData info 地图信息 | ③int8[] data 占有率地图数据序列，概率为【0-100】，未知为-1
  //MapMetaData  占有率栅格地图数据 ：
  //①time map_load_time 地图加载的时间 | ②float32 resolution 分辨率 | ③unit32(unsigned int) width , unit32 height 
  //④geometry_msgs/Pose origin 真实世界中的原点（m,m,rad）图像中的（0，0）点
  sstm_ = node_.advertise<nav_msgs::MapMetaData>("map_metadata", 1, true);
  //发布一个/map_metadata的话题，消息类型为：nav_msgs::MapMetaData 即占有率栅格地图数据
  ss_ = node_.advertiseService("dynamic_map", &SlamGMapping::mapCallback, this);
  //发布一个/dynamic_map的服务，一旦有服务请求，进入回调函数
  
  scan_filter_sub_ = new message_filters::Subscriber<sensor_msgs::LaserScan>(node_, "scan", 5);
  //message_filters::Subscriber<sensor_msgs::LaserScan>* scan_filter_sub_;
  scan_filter_ = new tf::MessageFilter<sensor_msgs::LaserScan>(*scan_filter_sub_, tf_, odom_frame_, 5);
  //tf::MessageFilter<sensor_msgs::LaserScan>* scan_filter_;
  scan_filter_->registerCallback(boost::bind(&SlamGMapping::laserCallback, this, _1));
  //注册回调函数，this表示当前对象scan_filter_，_1表示占位符
  
  //发布map到odom的转换关系的线程
  transform_thread_ = new boost::thread(boost::bind(&SlamGMapping::publishLoop, this, transform_publish_period_));

}
//**********************************************************************************startLiveSlam( )***************

void SlamGMapping::publishLoop(double transform_publish_period){
  if(transform_publish_period == 0)
    return;

  ros::Rate r(1.0 / transform_publish_period);
  while(ros::ok()){
    publishTransform();
    r.sleep();
  }
}

SlamGMapping::~SlamGMapping()
{
  if(transform_thread_){
    transform_thread_->join();
    delete transform_thread_;
  }

  delete gsp_;
  if(gsp_laser_)
    delete gsp_laser_;
  if(gsp_odom_)
    delete gsp_odom_;
  if (scan_filter_)
    delete scan_filter_;
  if (scan_filter_sub_)
    delete scan_filter_sub_;
}

//***********************************************************************************getOdomPose*****************
//通过每一帧scan的时间戳，计算出当前里程计坐标系下激光雷达的位姿
bool SlamGMapping::getOdomPose(GMapping::OrientedPoint& gmap_pose, const ros::Time& t)
{
  // Get the pose of the centered laser at the right time
  //centered_laser_pose_.stamp_ = t;
  tf::Stamped<tf::Pose> ident (tf::Transform(tf::creatQurationFromRPY(0, 0, 0), tf::Vector3(0, 0, 0)), t, laser_frame_);
  
  //odom_pose存储输出的里程计坐标系下激光雷达tf::Stamped<tf::Pose>格式的位姿
  tf::Stamped<tf::Transform> odom_pose; 
  try
  {
    //odom_frame_ 目标坐标系
    //ident 传入时间戳和坐标系(laser frame)
    //odom_pose得到该时间戳下的位姿数据
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


bool SlamGMapping::initMapper(const sensor_msgs::LaserScan& scan)
{
  laser_frame_ = scan.header.frame_id;
  // Get the laser's pose, relative to base.
  tf::Stamped<tf::Pose> ident;
  tf::Stamped<tf::Transform> laser_pose;
  ident.setIdentity();
  ident.frame_id_ = laser_frame_;
  ident.stamp_ = scan.header.stamp;
  try
  {
    tf_.transformPose(base_frame_, ident, laser_pose);
  }
  catch(tf::TransformException e)
  {
    ROS_WARN("Failed to compute laser pose, aborting initialization (%s)",
             e.what());
    return false;
  }

  // create a point 1m above the laser position and transform it into the laser-frame
  tf::Vector3 v;
  v.setValue(0, 0, 1 + laser_pose.getOrigin().z());
  tf::Stamped<tf::Vector3> up(v, scan.header.stamp,
                                      base_frame_);
  try
  {
    tf_.transformPoint(laser_frame_, up, up);
    ROS_DEBUG("Z-Axis in sensor frame: %.3f", up.z());
  }
  catch(tf::TransformException& e)
  {
    ROS_WARN("Unable to determine orientation of laser: %s",
             e.what());
    return false;
  }
  
  // gmapping doesnt take roll or pitch into account. So check for correct sensor alignment.
  if (fabs(fabs(up.z()) - 1) > 0.001)
  {
    ROS_WARN("Laser has to be mounted planar! Z-coordinate has to be 1 or -1, but gave: %.5f",
                 up.z());
    return false;
  }

  gsp_laser_beam_count_ = scan.ranges.size();

  double angle_center = (scan.angle_min + scan.angle_max)/2;

  if (up.z() > 0)
  {
    do_reverse_range_ = scan.angle_min > scan.angle_max;
    centered_laser_pose_ = tf::Stamped<tf::Pose>(tf::Transform(tf::createQuaternionFromRPY(0,0,angle_center),
                                                               tf::Vector3(0,0,0)), ros::Time::now(), laser_frame_);
    ROS_INFO("Laser is mounted upwards.");
  }
  else
  {
    do_reverse_range_ = scan.angle_min < scan.angle_max;
    centered_laser_pose_ = tf::Stamped<tf::Pose>(tf::Transform(tf::createQuaternionFromRPY(M_PI,0,-angle_center),
                                                               tf::Vector3(0,0,0)), ros::Time::now(), laser_frame_);
    ROS_INFO("Laser is mounted upside down.");
  }

  // Compute the angles of the laser from -x to x, basically symmetric and in increasing order
  laser_angles_.resize(scan.ranges.size());
  // Make sure angles are started so that they are centered
  double theta = - std::fabs(scan.angle_min - scan.angle_max)/2;
  for(unsigned int i=0; i<scan.ranges.size(); ++i)
  {
    laser_angles_[i]=theta;
    theta += std::fabs(scan.angle_increment);
  }

  ROS_DEBUG("Laser angles in laser-frame: min: %.3f max: %.3f inc: %.3f", scan.angle_min, scan.angle_max,
            scan.angle_increment);
  ROS_DEBUG("Laser angles in top-down centered laser-frame: min: %.3f max: %.3f inc: %.3f", laser_angles_.front(),
            laser_angles_.back(), std::fabs(scan.angle_increment));

  GMapping::OrientedPoint gmap_pose(0, 0, 0);

  // setting maxRange and maxUrange here so we can set a reasonable default
  ros::NodeHandle private_nh_("~");
  if(!private_nh_.getParam("maxRange", maxRange_))
    maxRange_ = scan.range_max - 0.01;
  if(!private_nh_.getParam("maxUrange", maxUrange_))
    maxUrange_ = maxRange_;

  // The laser must be called "FLASER".
  // We pass in the absolute value of the computed angle increment, on the
  // assumption that GMapping requires a positive angle increment.  If the
  // actual increment is negative, we'll swap the order of ranges before
  // feeding each scan to GMapping.
  gsp_laser_ = new GMapping::RangeSensor("FLASER",
                                         gsp_laser_beam_count_,
                                         fabs(scan.angle_increment),
                                         gmap_pose,
                                         0.0,
                                         maxRange_);
  ROS_ASSERT(gsp_laser_);

  GMapping::SensorMap smap;
  smap.insert(make_pair(gsp_laser_->getName(), gsp_laser_));
  gsp_->setSensorMap(smap);

  gsp_odom_ = new GMapping::OdometrySensor(odom_frame_);
  ROS_ASSERT(gsp_odom_);

  /// @todo Expose setting an initial pose
  GMapping::OrientedPoint initialPose;
  if(!getOdomPose(initialPose, scan.header.stamp))
  {
    ROS_WARN("Unable to determine inital pose of laser! Starting point will be set to zero.");
    initialPose = GMapping::OrientedPoint(0.0, 0.0, 0.0);
  }  // If the angle increment is negative, we have to invert the order of the readings.ters(srr_, srt_, str_, stt_);
  gsp_->setUpdateDistances(linearUpdate_, angularUpdate_, resampleThreshold_);
  gsp_->setUpdatePeriod(temporalUpdate_);
  gsp_->setgenerateMap(false);
  gsp_->GridSlamProcessor::init(particles_, xmin_, ymin_, xmax_, ymax_,
                                delta_, initialPose);
  gsp_->setllsamplerange(llsamplerange_);
  gsp_->setllsamplestep(llsamplestep_);
  /// @todo Check these calls; in the gmapping gui, they use
  /// llsamplestep and llsamplerange intead of lasamplestep and
  /// lasamplerange.  It was probably a typo, but who knows.
  gsp_->setlasamplerange(lasamplerange_);
  gsp_->setlasamplestep(lasamplestep_);
  gsp_->setminimumScore(minimum_score_);

  // Call the sampling function once to set the seed.
  GMapping::sampleGaussian(1,seed_);

  ROS_INFO("Initialization complete");

  return true;
}

//************************************************************************************addScan函数********************
//addScan函数，参数：scan、odom_pose(里程计位姿)
//每一帧激光数据，都要通过该函数封装gmapping算法需要的数据格式，并调用核心算法
bool SlamGMapping::addScan(const sensor_msgs::LaserScan& scan, GMapping::OrientedPoint& gmap_pose)
{
  //得到与激光数据的时间戳相对应的里程计位姿gmap_pose
  if(!getOdomPose(gmap_pose, scan.header.stamp))
     return false;
  
  // GMapping wants an array of doubles...
  //Gampping需要一个双精度的数组
  //对一帧激光数据的预处理，对距离小于range_min的数据，最大化
  double* ranges_double = new double[scan.ranges.size()];

  //开始处理
  // If the angle increment is negative, we have to invert the order of the readings.
  //如果角度增量是负的，我们就要颠倒读数的顺序
  if (do_reverse_range_)
  {
    ROS_DEBUG("Inverting scan");
    int num_ranges = scan.ranges.size();
    for(int i=0; i < num_ranges; i++)
    {
      // 对距离小于range_min的数据，最大化
      if(scan.ranges[num_ranges - i - 1] < scan.range_min)
        ranges_double[i] = (double)scan.range_max;
      else
        ranges_double[i] = (double)scan.ranges[num_ranges - i - 1];
    }
  } else 
  {
    for(unsigned int i=0; i < scan.ranges.size(); i++)
    {
      // 对距离小于range_min的数据，最大化
      if(scan.ranges[i] < scan.range_min)
        ranges_double[i] = (double)scan.range_max;
      else
        ranges_double[i] = (double)scan.ranges[i];
    }
  }

  //把ROS的激光雷达数据信息转换为GMapping算法看得懂的形式
  GMapping::RangeReading reading(scan.ranges.size(),
                                 ranges_double,
                                 gsp_laser_,
                                 scan.header.stamp.toSec());
  //释放内存
  delete[] ranges_double;

  //为每一个reading设置里程计位姿
  reading.setPose(gmap_pose);

  //调用gmappig算法进行处理，传入reading
  return gsp_->processScan(reading);  //*************此处进入processScan函数*******************
}
//addscan()函数只是将获取到的scan消息作下一步处理，转换成gmapping需要的形式，将处理过的数据传入processScan()函数


//************************************************************************************laserCallback***************
//每当到达一帧scan数据，就调用laserCallback函数
void SlamGMapping::laserCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
  static ros::Time last_map_update(0,0);    //上次地图更新时间

  // We can't initialize the mapper until we've got the first scan
  if(!got_first_scan_)                                            //判断got_first_scan是否为第一帧数据
  {
    if(!initMapper(*scan))                                    //判断为是，调用initMapper初始化gmapping所需各种参数
      return;
    got_first_scan_ = true;                                  //改变第一帧的标志位
  }

  GMapping::OrientedPoint odom_pose;   //当前里程计坐标系下的激光雷达位姿的临时变量

  if(addScan(*scan, odom_pose))   //调用addScan函数，可以进入到addScan函数看一下
  //addScan函数只是将获取到的scan消息做下一步处理，过滤掉无效值，将处理过的数据传入processScan( )函数中执行gmapping算法流程
  {
    ROS_DEBUG("scan processed");
    
    //最优粒子，地图坐标系下的位姿
    GMapping::OrientedPoint mpose = gsp_->getParticles()[gsp_->getBestParticleIndex()].pose;//不太理解
    
    //在激光雷达当前位姿下，用当前的里程计坐标系下的激光雷达位姿和map坐标系下的激光雷达位姿，来表述里程计坐标系与map坐标系的差距
    //因为两个坐标系描述的是同一激光雷达，所以才能用位姿的不同描述坐标系变换关系
    tf::Transform laser_to_map = tf::Transform(tf::createQuaternionFromRPY(0, 0, mpose.theta), tf::Vector3(mpose.x, mpose.y, 0.0)).inverse();
    tf::Transform odom_to_laser = tf::Transform(tf::createQuaternionFromRPY(0, 0, odom_pose.theta), tf::Vector3(odom_pose.x, odom_pose.y, 0.0));
    
    //多个线程访问同一资源时，为了保证数据一致性，最简单的方式就是使用mutex（互斥锁）
    //阻止了同一时刻有多个线程并发访问共享资源
    map_to_odom_mutex_.lock();
    map_to_odom_ = (odom_to_laser * laser_to_map).inverse(); //表述里程计坐标系与map坐标系的差距
    map_to_odom_mutex_.unlock();

    //多久更新一次地图
    if(!got_map_ || (scan->header.stamp - last_map_update) > map_update_interval_)
    {
      updateMap(*scan);  //调用updateMap更新地图**********************************************************updateMap********************************************************
      last_map_update = scan->header.stamp;
      ROS_DEBUG("Updated the map");
    }
  } else
    ROS_DEBUG("cannot process scan");
}


//************************************************************************************updateMap************
//地图更新，第一次没有地图直接更新，之后按照周期更新地图
void SlamGMapping::updateMap(const sensor_msgs::LaserScan& scan)
{
  ROS_DEBUG("Update map");
  //scoped_lock:严格基于作用域的锁管理类模板
  //构造时是否加锁是可选的（不加锁时假定当前线程已经获得锁的所有权），析构时自动释放锁，所有权不可转移
  //对象生存期内不允许手动加锁和释放锁
  boost::mutex::scoped_lock map_lock (map_mutex_);
  GMapping::ScanMatcher matcher;

  //设置scanmatcher的各个参数
  matcher.setLaserParameters(scan.ranges.size(), &(laser_angles_[0]),
                             gsp_laser_->getPose());

  matcher.setlaserMaxRange(maxRange_);
  matcher.setusableRange(maxUrange_);
  matcher.setgenerateMap(true);

  //得到权重最高的粒子
  GMapping::GridSlamProcessor::Particle best =
          gsp_->getParticles()[gsp_->getBestParticleIndex()];

  //如果没有地图则初始化一个地图
  if(!got_map_) {
    map_.map.info.resolution = delta_;
    map_.map.info.origin.position.x = 0.0;
    map_.map.info.origin.position.y = 0.0;
    map_.map.info.origin.position.z = 0.0;
    map_.map.info.origin.orientation.x = 0.0;
    map_.map.info.origin.orientation.y = 0.0;
    map_.map.info.origin.orientation.z = 0.0;
    map_.map.info.origin.orientation.w = 1.0;
  } 
  //地图的中点
  GMapping::Point center;
  center.x=(xmin_ + xmax_) / 2.0;
  center.y=(ymin_ + ymax_) / 2.0;
  
  //初始化一个ScanMatcherMap，创建一个地图
  //这里地图一定要区分part_slam算法部分的地图，这里可视化用
  //区别smap与map_.map这个非常重要
  GMapping::ScanMatcherMap smap(center, xmin_, ymin_, xmax_, ymax_, 
                                delta_);

  ROS_DEBUG("Trajectory tree:");
  
  //遍历粒子的整条轨迹，按照轨迹上各个节点存储的信息来重新绘制一个地图
  for(GMapping::GridSlamProcessor::TNode* n = best.node;
      n;
      n = n->parent)
  {
    ROS_DEBUG("  %.3f %.3f %.3f",
              n->pose.x,
              n->pose.y,
              n->pose.theta);
    if(!n->reading)
    {
      ROS_DEBUG("Reading is NULL");
      continue;
    }
    matcher.invalidateActiveArea();
    //拓展地图大小，找到地图中有效区域，申请内存，更新每个被经过的栅格数据
    matcher.computeActiveArea(smap, n->pose, &((*n->reading)[0]));
    matcher.registerScan(smap, n->pose, &((*n->reading)[0]));
  }

  // the map may have expanded, so resize ros message as well
  //根据smap地图更改可视化地图的内容
  if(map_.map.info.width != (unsigned int) smap.getMapSizeX() || map_.map.info.height != (unsigned int) smap.getMapSizeY()) {

    // NOTE: The results of ScanMatcherMap::getSize() are different from the parameters given to the constructor
    //       so we must obtain the bounding box in a different way
    GMapping::Point wmin = smap.map2world(GMapping::IntPoint(0, 0));
    GMapping::Point wmax = smap.map2world(GMapping::IntPoint(smap.getMapSizeX(), smap.getMapSizeY()));
    xmin_ = wmin.x; ymin_ = wmin.y;
    xmax_ = wmax.x; ymax_ = wmax.y;
    
    ROS_DEBUG("map size is now %dx%d pixels (%f,%f)-(%f, %f)", smap.getMapSizeX(), smap.getMapSizeY(),
              xmin_, ymin_, xmax_, ymax_);

    map_.map.info.width = smap.getMapSizeX();
    map_.map.info.height = smap.getMapSizeY();
    map_.map.info.origin.position.x = xmin_;
    map_.map.info.origin.position.y = ymin_;
    map_.map.data.resize(map_.map.info.width * map_.map.info.height);

    ROS_DEBUG("map origin: (%f, %f)", map_.map.info.origin.position.x, map_.map.info.origin.position.y);
  }

  //根据smap地图中存储的栅格数据，修改map_.map.data[]的数据，这里为一维数组
  for(int x=0; x < smap.getMapSizeX(); x++)
  {
    for(int y=0; y < smap.getMapSizeY(); y++)
    {
      /// @todo Sort out the unknown vs. free vs. obstacle thresholding
      GMapping::IntPoint p(x, y);
      double occ=smap.cell(p);
      assert(occ <= 1.0);
      //未知
      if(occ < 0)
        map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = -1;
        //占用
      else if(occ > occ_thresh_)
      {
        //map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = (int)round(occ*100.0);
        map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = 100;
      }
      //空闲
      else
        map_.map.data[MAP_IDX(map_.map.info.width, x, y)] = 0;
    }
  }
  got_map_ = true;

  //把计算出来的地图发布出去
  map_.map.header.stamp = ros::Time::now();
  map_.map.header.frame_id = tf_.resolve( map_frame_ );

  //发布map和map_metadata
  sst_.publish(map_.map);
  sstm_.publish(map_.map.info);
}

//地图服务的回调函数 
bool SlamGMapping::mapCallback(nav_msgs::GetMap::Request  &req,
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

//发布map->odom的转换关系
void SlamGMapping::publishTransform()
{
  map_to_odom_mutex_.lock();
  ros::Time tf_expiration = ros::Time::now() + ros::Duration(tf_delay_);
  tfB_->sendTransform( tf::StampedTransform (map_to_odom_, tf_expiration, map_frame_, odom_frame_));
  map_to_odom_mutex_.unlock();
}
