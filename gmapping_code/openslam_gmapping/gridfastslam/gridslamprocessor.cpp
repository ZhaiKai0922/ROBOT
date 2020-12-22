#include <string>
#include <deque>
#include <list>
#include <map>
#include <set>
#include <fstream>
#include <iomanip>
#include <utils/stat.h>
#include "gridslamprocessor.h"

//#define MAP_CONSISTENCY_CHECK
//#define GENERATE_TRAJECTORIES

namespace GMapping {

const double m_distanceThresholdCheck = 20;
 
using namespace std;

  GridSlamProcessor::GridSlamProcessor(): m_infoStream(cout){
    
    m_obsSigmaGain=1;
    m_resampleThreshold=0.5;
    m_minimumScore=0.;
  }
  
  GridSlamProcessor::GridSlamProcessor(const GridSlamProcessor& gsp) 
    :m_particles(gsp.m_particles), m_infoStream(cout){
    
    m_obsSigmaGain=gsp.m_obsSigmaGain;
    m_resampleThreshold=gsp.m_resampleThreshold;
    m_minimumScore=gsp.m_minimumScore;
    
    m_beams=gsp.m_beams;
    m_indexes=gsp.m_indexes;
    m_motionModel=gsp.m_motionModel;
    m_resampleThreshold=gsp.m_resampleThreshold;
    m_matcher=gsp.m_matcher;
    
    m_count=gsp.m_count;
    m_readingCount=gsp.m_readingCount;
    m_lastPartPose=gsp.m_lastPartPose;
    m_pose=gsp.m_pose;
    m_odoPose=gsp.m_odoPose;
    m_linearDistance=gsp.m_linearDistance;
    m_angularDistance=gsp.m_angularDistance;
    m_neff=gsp.m_neff;
	
    cerr << "FILTER COPY CONSTRUCTOR" << endl;
    cerr << "m_odoPose=" << m_odoPose.x << " " <<m_odoPose.y << " " << m_odoPose.theta << endl;
    cerr << "m_lastPartPose=" << m_lastPartPose.x << " " <<m_lastPartPose.y << " " << m_lastPartPose.theta << endl;
    cerr << "m_linearDistance=" << m_linearDistance << endl;
    cerr << "m_angularDistance=" << m_linearDistance << endl;
    
		
    m_xmin=gsp.m_xmin;
    m_ymin=gsp.m_ymin;
    m_xmax=gsp.m_xmax;
    m_ymax=gsp.m_ymax;
    m_delta=gsp.m_delta;
    
    m_regScore=gsp.m_regScore;
    m_critScore=gsp.m_critScore;
    m_maxMove=gsp.m_maxMove;
    
    m_linearThresholdDistance=gsp.m_linearThresholdDistance;
    m_angularThresholdDistance=gsp.m_angularThresholdDistance;
    m_obsSigmaGain=gsp.m_obsSigmaGain;
    
#ifdef MAP_CONSISTENCY_CHECK
    cerr << __PRETTY_FUNCTION__ <<  ": trajectories copy.... ";
#endif
    TNodeVector v=gsp.getTrajectories();
    for (unsigned int i=0; i<v.size(); i++){
		m_particles[i].node=v[i];
    }
#ifdef MAP_CONSISTENCY_CHECK
    cerr <<  "end" << endl;
#endif


    cerr  << "Tree: normalizing, resetting and propagating weights within copy construction/cloneing ..." ;
    updateTreeWeights(false);
    cerr  << ".done!" <<endl;
  }
  
  GridSlamProcessor::GridSlamProcessor(std::ostream& infoS): m_infoStream(infoS){
    m_obsSigmaGain=1;
    m_resampleThreshold=0.5;
    m_minimumScore=0.;
	
  }

  GridSlamProcessor* GridSlamProcessor::clone() const {
# ifdef MAP_CONSISTENCY_CHECK
    cerr << __PRETTY_FUNCTION__ << ": performing preclone_fit_test" << endl;
    typedef std::map<autoptr< Array2D<PointAccumulator> >::reference* const, int> PointerMap;
    PointerMap pmap;
	for (ParticleVector::const_iterator it=m_particles.begin(); it!=m_particles.end(); it++){
	  const ScanMatcherMap& m1(it->map);
	  const HierarchicalArray2D<PointAccumulator>& h1(m1.storage());
 	  for (int x=0; x<h1.getXSize(); x++){
	    for (int y=0; y<h1.getYSize(); y++){
	      const autoptr< Array2D<PointAccumulator> >& a1(h1.m_cells[x][y]);
	      if (a1.m_reference){
		PointerMap::iterator f=pmap.find(a1.m_reference);
		if (f==pmap.end())
		  pmap.insert(make_pair(a1.m_reference, 1));
		else
		  f->second++;
	      }
	    }
	  }
	}
	cerr << __PRETTY_FUNCTION__ <<  ": Number of allocated chunks" << pmap.size() << endl;
	for(PointerMap::const_iterator it=pmap.begin(); it!=pmap.end(); it++)
	  assert(it->first->shares==(unsigned int)it->second);

	cerr << __PRETTY_FUNCTION__ <<  ": SUCCESS, the error is somewhere else" << endl;
# endif
	GridSlamProcessor* cloned=new GridSlamProcessor(*this);
	
# ifdef MAP_CONSISTENCY_CHECK
	cerr << __PRETTY_FUNCTION__ <<  ": trajectories end" << endl;
	cerr << __PRETTY_FUNCTION__ << ": performing afterclone_fit_test" << endl;
	ParticleVector::const_iterator jt=cloned->m_particles.begin();
	for (ParticleVector::const_iterator it=m_particles.begin(); it!=m_particles.end(); it++){
	  const ScanMatcherMap& m1(it->map);
	  const ScanMatcherMap& m2(jt->map);
	  const HierarchicalArray2D<PointAccumulator>& h1(m1.storage());
	  const HierarchicalArray2D<PointAccumulator>& h2(m2.storage());
	  jt++;
 	  for (int x=0; x<h1.getXSize(); x++){
	    for (int y=0; y<h1.getYSize(); y++){
	      const autoptr< Array2D<PointAccumulator> >& a1(h1.m_cells[x][y]);
	      const autoptr< Array2D<PointAccumulator> >& a2(h2.m_cells[x][y]);
	      assert(a1.m_reference==a2.m_reference);
	      assert((!a1.m_reference) || !(a1.m_reference->shares%2));
	    }
	  }
	}
	cerr << __PRETTY_FUNCTION__ <<  ": SUCCESS, the error is somewhere else" << endl;
# endif
	return cloned;
}
  
  GridSlamProcessor::~GridSlamProcessor(){
    cerr << __PRETTY_FUNCTION__ << ": Start" << endl;
    cerr << __PRETTY_FUNCTION__ << ": Deeting tree" << endl;
    for (std::vector<Particle>::iterator it=m_particles.begin(); it!=m_particles.end(); it++){
#ifdef TREE_CONSISTENCY_CHECK		
      TNode* node=it->node;
      while(node)
	node=node->parent;
      cerr << "@" << endl;
#endif
      if (it->node)
	delete it->node;
      //cout << "l=" << it->weight<< endl;
    }
    
# ifdef MAP_CONSISTENCY_CHECK
    cerr << __PRETTY_FUNCTION__ << ": performing predestruction_fit_test" << endl;
    typedef std::map<autoptr< Array2D<PointAccumulator> >::reference* const, int> PointerMap;
    PointerMap pmap;
    for (ParticleVector::const_iterator it=m_particles.begin(); it!=m_particles.end(); it++){
      const ScanMatcherMap& m1(it->map);
      const HierarchicalArray2D<PointAccumulator>& h1(m1.storage());
      for (int x=0; x<h1.getXSize(); x++){
	for (int y=0; y<h1.getYSize(); y++){
	  const autoptr< Array2D<PointAccumulator> >& a1(h1.m_cells[x][y]);
	  if (a1.m_reference){
	    PointerMap::iterator f=pmap.find(a1.m_reference);
	    if (f==pmap.end())
	      pmap.insert(make_pair(a1.m_reference, 1));
	    else
	      f->second++;
	  }
	}
      }
    }
    cerr << __PRETTY_FUNCTION__ << ": Number of allocated chunks" << pmap.size() << endl;
    for(PointerMap::const_iterator it=pmap.begin(); it!=pmap.end(); it++)
      assert(it->first->shares>=(unsigned int)it->second);
    cerr << __PRETTY_FUNCTION__ << ": SUCCESS, the error is somewhere else" << endl;
# endif
  }


		
  void GridSlamProcessor::setMatchingParameters (double urange, double range, double sigma, int kernsize, double lopt, double aopt, 
						 int iterations, double likelihoodSigma, double likelihoodGain, unsigned int likelihoodSkip){
    m_obsSigmaGain=likelihoodGain;
    m_matcher.setMatchingParameters(urange, range, sigma, kernsize, lopt, aopt, iterations, likelihoodSigma, likelihoodSkip);
    if (m_infoStream)
      m_infoStream << " -maxUrange "<< urange
		   << " -maxUrange "<< range
		   << " -sigma     "<< sigma
		   << " -kernelSize "<< kernsize
		   << " -lstep "    << lopt
		   << " -lobsGain " << m_obsSigmaGain
		   << " -astep "    << aopt << endl;
    
    
  }
  
void GridSlamProcessor::setMotionModelParameters
(double srr, double srt, double str, double stt){
  m_motionModel.srr=srr;
  m_motionModel.srt=srt;
  m_motionModel.str=str;
  m_motionModel.stt=stt;	
  
  if (m_infoStream)
    m_infoStream << " -srr "<< srr 	<< " -srt "<< srt  
		 << " -str "<< str 	<< " -stt "<< stt << endl;
  
}
  
  void GridSlamProcessor::setUpdateDistances(double linear, double angular, double resampleThreshold){
    m_linearThresholdDistance=linear; 
    m_angularThresholdDistance=angular;
    m_resampleThreshold=resampleThreshold;	
    if (m_infoStream)
      m_infoStream << " -linearUpdate " << linear
		   << " -angularUpdate "<< angular
		   << " -resampleThreshold " << m_resampleThreshold << endl;
  }
  
  //HERE STARTS THE BEEF

  GridSlamProcessor::Particle::Particle(const ScanMatcherMap& m):
    map(m), pose(0,0,0), weight(0), weightSum(0), gweight(0), previousIndex(0){
    node=0;
  }
  
  
  void GridSlamProcessor::setSensorMap(const SensorMap& smap){
    
    /*
      Construct the angle table for the sensor
      
      FIXME For now detect the readings of only the front laser, and assume its pose is in the center of the robot 
    */
    
    SensorMap::const_iterator laser_it=smap.find(std::string("FLASER"));
    if (laser_it==smap.end()){
      cerr << "Attempting to load the new carmen log format" << endl;
      laser_it=smap.find(std::string("ROBOTLASER1"));
      assert(laser_it!=smap.end());
    }
    const RangeSensor* rangeSensor=dynamic_cast<const RangeSensor*>((laser_it->second));
    assert(rangeSensor && rangeSensor->beams().size());
    
    m_beams=static_cast<unsigned int>(rangeSensor->beams().size());
    double* angles=new double[rangeSensor->beams().size()];
    for (unsigned int i=0; i<m_beams; i++){
      angles[i]=rangeSensor->beams()[i].pose.theta;
    }
    m_matcher.setLaserParameters(m_beams, angles, rangeSensor->getPose());
    delete [] angles;
  }
  
  void GridSlamProcessor::init(unsigned int size, double xmin, double ymin, double xmax, double ymax, double delta, OrientedPoint initialPose){
    m_xmin=xmin;
    m_ymin=ymin;
    m_xmax=xmax;
    m_ymax=ymax;
    m_delta=delta;
    if (m_infoStream)
      m_infoStream 
	<< " -xmin "<< m_xmin
	<< " -xmax "<< m_xmax
	<< " -ymin "<< m_ymin
	<< " -ymax "<< m_ymax
	<< " -delta "<< m_delta
	<< " -particles "<< size << endl;
    

    m_particles.clear();
    TNode* node=new TNode(initialPose, 0, 0, 0);
    ScanMatcherMap lmap(Point(xmin+xmax, ymin+ymax)*.5, xmax-xmin, ymax-ymin, delta);
    for (unsigned int i=0; i<size; i++){
      m_particles.push_back(Particle(lmap));
      m_particles.back().pose=initialPose;
      m_particles.back().previousPose=initialPose;
      m_particles.back().setWeight(0);
      m_particles.back().previousIndex=0;
      
		// this is not needed
		//		m_particles.back().node=new TNode(initialPose, 0, node, 0);

		// we use the root directly
		m_particles.back().node= node;
    }
    m_neff=(double)size;
    m_count=0;
    m_readingCount=0;
    m_linearDistance=m_angularDistance=0;
  }

  void GridSlamProcessor::processTruePos(const OdometryReading& o){
    const OdometrySensor* os=dynamic_cast<const OdometrySensor*>(o.getSensor());
    if (os && os->isIdeal() && m_outputStream){
      m_outputStream << setiosflags(ios::fixed) << setprecision(3);
      m_outputStream <<  "SIMULATOR_POS " <<  o.getPose().x << " " << o.getPose().y << " " ;
      m_outputStream << setiosflags(ios::fixed) << setprecision(6) << o.getPose().theta << " " <<  o.getTime() << endl;
    }
  }
  
  //************************************************************************************addScan——>processScan*****************************************************
  //********************************************************************************************************************************************
  //***********************************************************************************很重要*************************************************************************
  bool GridSlamProcessor::processScan(const RangeReading & reading, int adaptParticles ){
    
    //从reading中获取位姿
    //得到当前激光雷达的里程计位姿
    OrientedPoint relPose=reading.getPose();
    
    //m_count表示这个函数的调用次数，如果是第0次调用，上一次初始化上一次里程计位姿
    if (!m_count){
      m_lastPartPose=m_odoPose=relPose;
    }
    
    //使用运动模型更新所有粒子
    //对于每一个粒子都从运动模型中采样，更新每一个粒子对象存储地图坐标系下的激光雷达的位姿，这里注意是地图坐标系下的坐标
    for (ParticleVector::iterator it=m_particles.begin(); it!=m_particles.end(); it++){
      //对于每一个粒子，将从运动模型传播的激光雷达位姿存放到m_particles[i].pose，即最新的地图坐标系下的激光雷达的位姿
      OrientedPoint& pose(it->pose);
      pose=m_motionModel.drawFromMotion(it->pose, relPose, m_odoPose);
    }
    //这里要区分三个位姿
    //m_particle[i].pose最新的地图坐标系下的激光雷达最优位姿
    //relpose：当前激光雷达的里程计位姿
    //m_odoPose：表示上一次的激光雷达的里程计位姿


    //根据两次里程计的数据，计算出激光雷达的线性位移和角度变化
    OrientedPoint move=relPose-m_odoPose;
    move.theta=atan2(sin(move.theta), cos(move.theta));

    //激光雷达在里程计作用下累计移动线性距离和角度变换，用于判断是否进行核心算法处理
    m_linearDistance+=sqrt(move*move);  //两点之间距离公式
    m_angularDistance+=fabs(move.theta);
    
    //更新上一次的里程计位姿
    m_odoPose=relPose;
    //做返回值使用
    bool processed=false;

    //只有当激光雷达走过一定的距离 或者 旋转一定的角度才处理激光数据 或者 处理第一帧数据
    if (! m_count 
	      || m_linearDistance>m_linearThresholdDistance 
	      || m_angularDistance>m_angularThresholdDistance)
  {
      //拷贝reading的scan数据
      int beam_number = reading.getSize();
      double * plainReading = new double[beam_number];
      for(unsigned int i=0; i<beam_number; i++)
      {
        plainReading[i] = reading.m_dists[i];
      }

      //reading_copy数据用来放在每一个节点，构建地图用
      RangeReading* reading_copy = new RangeReading(beam_number,
                                                                        &(reading.m_dists[0]));

      
      //如果不是第一帧数据
      if (m_count>0)
      {
        /*功能：为每一个粒子，在当前激光雷达位姿下，当前帧激光数据下，求解每个粒子的位姿最优值（策略：爬山，评价机制：得分机制（当前位姿下激光数据和当前地图的匹配程度））
                          求解每个粒子的权重
                          爬山算法：每一层，从不同方向找一个得分最高的一个值，直到出现得分开始下降的地方
                          得分算法：根据当前位姿下的每一帧激光扫描点和地图的匹配程度，对每一个激光点进行计算，累计得分，返回得分
        */
      //进行扫描匹配，得到每个粒子的最优位姿，并且计算粒子得分
      scanMatch(plainReading);
      
      //计算重采样的neff（粒子离散程度）的判断值***************还没写******
	    normalize();

      //重采样
      if(resample(plainReading, adaptParticles, reading_copy))
      {
        //进行重采样之后，粒子的权重又会发生变化，更新归一化的权重
        normalize();
      }
      }
      //如果是第一帧数据
    else
    {
    }
    
    delete [] plainReading;
 
      m_linearDistance=0;
      m_angularDistance=0;
      m_count++;
      processed=true;
      
    }
    return processed;
  }
  //**************************************************************processScan*******************************************************
  //*********************************************************************************************************************************
  //*********************************************************************************************************************************
  
  std::ofstream& GridSlamProcessor::outputStream(){
    return m_outputStream;
  }
  
  std::ostream& GridSlamProcessor::infoStream(){
    return m_infoStream;
  }
  
  
  int GridSlamProcessor::getBestParticleIndex() const{
    unsigned int bi=0;
    double bw=-std::numeric_limits<double>::max();
    for (unsigned int i=0; i<m_particles.size(); i++)
      if (bw<m_particles[i].weightSum){
	bw=m_particles[i].weightSum;
	bi=i;
      }
    return (int) bi;
  }

  void GridSlamProcessor::onScanmatchUpdate(){}
  void GridSlamProcessor::onResampleUpdate(){}
  void GridSlamProcessor::onOdometryUpdate(){}

  
};// end namespace




