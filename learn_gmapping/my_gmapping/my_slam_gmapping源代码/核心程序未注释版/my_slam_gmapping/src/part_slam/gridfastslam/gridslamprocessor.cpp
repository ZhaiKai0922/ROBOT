#include "gridslamprocessor.h"

namespace GMapping {

  using namespace std;

  GridSlamProcessor::TNode::TNode(const OrientedPoint& p, TNode* n)
  {
    pose=p;
    parent=n;
    reading=0;
  }

  GridSlamProcessor::TNode::~TNode()
  {
    if (parent)
      delete parent;
  }

  GridSlamProcessor::Particle::Particle(const ScanMatcherMap& m):
    map(m),pose(0,0,0), weight(0), weightSum(0)
  {
    node=0;
  }
  
  GridSlamProcessor::GridSlamProcessor()
  {  
    period_            = 5.0;
    m_obsSigmaGain     = 1;
    m_resampleThreshold= 0.5;
    m_minimumScore     = 0.;
  }
  
  GridSlamProcessor::~GridSlamProcessor()
  {
    for (std::vector<Particle>::iterator it=m_particles.begin(); it!=m_particles.end(); it++){

      if (it->node)
	      delete it->node;
    }
  }

  void GridSlamProcessor::setMatchingParameters (double urange, double range, double sigma, int kernsize, double lopt, double aopt, 
                         int iterations, double likelihoodSigma, double likelihoodGain, unsigned int likelihoodSkip)
  {
    m_obsSigmaGain=likelihoodGain;
    m_matcher.setMatchingParameters(urange, range, sigma, kernsize, lopt, aopt, iterations, likelihoodSigma, likelihoodSkip);
  }
  
  void GridSlamProcessor::setMotionModelParameters(double srr, double srt, double str, double stt)
  {
    m_motionModel.srr = srr;
    m_motionModel.srt = srt;
    m_motionModel.str = str;
    m_motionModel.stt = stt;	
  }
  
  void GridSlamProcessor::setUpdateDistances(double linear, double angular, double resampleThreshold)
  {
    m_linearThresholdDistance  = linear; 
    m_angularThresholdDistance = angular;
    m_resampleThreshold = resampleThreshold;	
  }
  
  void GridSlamProcessor::init(unsigned int size, double xmin, double ymin, double xmax, double ymax, double delta, OrientedPoint initialPose)
  {
	  m_xmin=xmin;
    m_ymin=ymin;
    m_xmax=xmax;
    m_ymax=ymax;
    m_delta=delta;

    m_particles.clear();

    TNode* node=new TNode(initialPose, 0);

    ScanMatcherMap lmap(Point(xmin+xmax, ymin+ymax)*.5, xmax-xmin, ymax-ymin, delta);

    for (unsigned int i=0; i<size; i++)
	  {
      m_particles.push_back(Particle(lmap)); 
      m_particles.back().pose=initialPose;   
      m_particles.back().setWeight(0);       
      m_particles.back().node= node;         
    }

    m_neff=(double)size;
    m_count=0;
    m_linearDistance=m_angularDistance=0;
  }

  bool GridSlamProcessor::processScan(const RangeReading & reading, int adaptParticles)
  {
	  OrientedPoint relPose=reading.getPose();

    if (!m_count)
    {
      m_odoPose=relPose;
    }

    int tmp_size = m_particles.size();

    for(int i = 0; i < tmp_size;i++)
    {
      OrientedPoint& pose(m_particles[i].pose);
      pose = m_motionModel.drawFromMotion(m_particles[i].pose,relPose,m_odoPose);
    }

    std::cout<<"drawFromMotion"<<std::endl;

    OrientedPoint move = relPose - m_odoPose;
    Point temp(move.x,move.y);

    m_linearDistance  += sqrt(temp*temp);   
    m_angularDistance += fabs(move.theta);

    m_odoPose = relPose;

    bool processed = false;

    last_update_time_+=1.0;

    if (!m_count 
	      || m_linearDistance  >= m_linearThresholdDistance 
	      || m_angularDistance >= m_angularThresholdDistance
        || (period_ >= 0.0 && (last_update_time_) > period_))
	  { 
      last_update_time_ = 0;

      std::cout<<"Start to Process Scan "<<std::endl;

      int beam_number = reading.getSize();
      double * plainReading = new double[beam_number];
      for(unsigned int i=0; i<beam_number; i++)
      {
        plainReading[i]=reading.m_dists[i];
      }

      RangeReading* reading_copy = new RangeReading(beam_number,
                                                    &(reading.m_dists[0]));
                                                    
      if (m_count>0)
      {       
        scanMatch(plainReading);
        std::cout<<"scanmatch finish"<<std::endl;

        normalize();
        std::cout << "normalize" << std::endl;

        if(resample(plainReading, adaptParticles, reading_copy))
        {
          normalize();
          std::cout << "normalize" << std::endl;
        }
      }
      else
      {
        for (ParticleVector::iterator it=m_particles.begin(); it!=m_particles.end(); it++)
        {
          m_matcher.computeActiveArea(it->map, it->pose, plainReading);
          m_matcher.registerScan(it->map, it->pose, plainReading);

          TNode* node=new	TNode(it->pose, it->node);
          node->reading = reading_copy;    
          it->node=node;
        }
        normalize();
        std::cout << "normalize" << std::endl;
      }
      delete [] plainReading;

      m_linearDistance=0;
      m_angularDistance=0;

      m_count++;
      processed = true;

      std::cout << "processed" << std::endl;
    }
    return processed;
 }
  
  int GridSlamProcessor::getBestParticleIndex() const
  {
    unsigned int bi=0;
    double bw=-std::numeric_limits<double>::max();
    for (unsigned int i=0; i<m_particles.size(); i++)
    {
      if (bw<m_particles[i].weightSum)
      {
        bw=m_particles[i].weightSum;
        bi=i;                       
      }
    }
    return (int) bi;
  }

};
