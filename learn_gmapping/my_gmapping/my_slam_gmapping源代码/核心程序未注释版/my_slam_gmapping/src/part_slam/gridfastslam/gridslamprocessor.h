#ifndef GRIDSLAMPROCESSOR_H
#define GRIDSLAMPROCESSOR_H

#include <string>
#include <list>
#include <map>
#include <set>
#include <iomanip>
#include <climits>
#include <limits>
#include <fstream>
#include <vector>
#include <deque>
#include <omp.h>

#include "../particlefilter/particlefilter.h"
#include "../utils/stat.h"
#include "../utils/point.h"
#include "../sensor_range/rangereading.h"
#include "../scanmatcher/scanmatcher.h"
#include "../motionmodel/motionmodel.h"

namespace GMapping {

class GridSlamProcessor
{
public:

  struct TNode
  {
    TNode(const OrientedPoint& pose, TNode* parent=0);
    ~TNode();

    OrientedPoint pose; 
    const RangeReading* reading;
    TNode* parent;

  };
  
  typedef std::vector<GridSlamProcessor::TNode*> TNodeVector;

  struct Particle
  {
    Particle(const ScanMatcherMap& map);

    inline operator double() const {return weight;}
    inline operator OrientedPoint() const {return pose;}

    inline void setWeight(double w) {weight = w;}

    ScanMatcherMap map;
    OrientedPoint pose;
    double weight;
    double weightSum;
    TNode* node; 

  };

  typedef std::vector<Particle> ParticleVector;

  GridSlamProcessor();

  virtual ~GridSlamProcessor();

  void setMatchingParameters(double urange, double range, double sigma, int kernsize, 
                             double lopt, double aopt, int iterations, double likelihoodSigma=1, 
                             double likelihoodGain=1, unsigned int likelihoodSkip=0);

  void setMotionModelParameters(double srr, double srt, double str, double stt);

  void setUpdateDistances(double linear, double angular, double resampleThreshold);

  void setUpdatePeriod(double p) {period_=p;}

  void init(unsigned int size, double xmin, double ymin, double xmax, double ymax, double delta, 
            OrientedPoint initialPose=OrientedPoint(0,0,0));

  bool processScan(const RangeReading & reading, int adaptParticles=0);

  inline const ParticleVector& getParticles() const {return m_particles; }

  inline const std::vector<unsigned int>& getIndexes() const{return m_indexes; }

  int getBestParticleIndex() const;

  ScanMatcher m_matcher;

  MEMBER_PARAM_SET_GET(m_matcher, double, laserMaxRange, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, double, usableRange, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, double, gaussianSigma, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, double, likelihoodSigma, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, int,    kernelSize, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, double, optAngularDelta, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, double, optLinearDelta, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, unsigned int, optRecursiveIterations, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, unsigned int, likelihoodSkip, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, bool, generateMap, protected, public, public);
  MEMBER_PARAM_SET_GET(m_matcher, bool, enlargeStep, protected, public, public);

  STRUCT_PARAM_SET_GET(m_motionModel, double, srr, protected, public, public);
  STRUCT_PARAM_SET_GET(m_motionModel, double, srt, protected, public, public);
  STRUCT_PARAM_SET_GET(m_motionModel, double, str, protected, public, public);
  STRUCT_PARAM_SET_GET(m_motionModel, double, stt, protected, public, public);

  PARAM_SET_GET(double, minimumScore, protected, public, public);

protected:
  double                    last_update_time_;
  double                    period_;
  unsigned int              m_beams;

  ParticleVector            m_particles;

  std::vector<unsigned int> m_indexes;

  std::vector<double>       m_weights;

  MotionModel               m_motionModel;
 
  OrientedPoint             m_odoPose;

  OrientedPoint             m_pose;

  int                       m_count;

  double                    m_linearDistance;

  double                    m_angularDistance;

  PARAM_GET(double, xmin, protected, public);
  PARAM_GET(double, ymin, protected, public);
  PARAM_GET(double, xmax, protected, public);
  PARAM_GET(double, ymax, protected, public);
  PARAM_GET(double, delta, protected, public);

  PARAM_GET(double, neff, protected, public);

  PARAM_SET_GET(double, linearThresholdDistance, protected, public, public);
  PARAM_SET_GET(double, angularThresholdDistance, protected, public, public);
 
  PARAM_SET_GET(double, obsSigmaGain, protected, public, public);
  PARAM_SET_GET(double, resampleThreshold, protected, public, public);

private:

  inline void scanMatch(const double *plainReading);

  inline void normalize();

  inline bool resample(const double* plainReading, int adaptParticles, const RangeReading* rr=0);

};

inline void GridSlamProcessor::scanMatch(const double* plainReading)
{
  int particle_number = m_particles.size();
  for (int i = 0; i < particle_number;i++)
  {
    OrientedPoint corrected;
    double score, l, s;
    score=m_matcher.optimize(corrected, m_particles[i].map, m_particles[i].pose, plainReading);

    if (score > m_minimumScore)
    {
      m_particles[i].pose = corrected;
    }

    m_matcher.likelihoodAndScore(s, l, m_particles[i].map, m_particles[i].pose, plainReading);
    m_particles[i].weight+=l;    
    m_particles[i].weightSum+=l; 
  }
}

inline void GridSlamProcessor::normalize()
{
  double gain=1./(m_obsSigmaGain*m_particles.size());

  double lmax= -std::numeric_limits<double>::max();
  for (ParticleVector::iterator it=m_particles.begin(); it!=m_particles.end(); it++)
  {
    lmax=it->weight>lmax?it->weight:lmax;
  }

  m_weights.clear();
  double wcum=0;
  for (std::vector<Particle>::iterator it=m_particles.begin(); it!=m_particles.end(); it++)
  {
    m_weights.push_back(exp(gain*(it->weight - lmax)));
    wcum+=m_weights.back();
  }

  m_neff=0;
  for (std::vector<double>::iterator it=m_weights.begin(); it!=m_weights.end(); it++)
  {
    *it=*it/wcum;
    double w=*it;
    m_neff+=w*w;
  }
  m_neff=1./m_neff;
}

inline bool GridSlamProcessor::resample(const double* plainReading, int adaptSize, const RangeReading* reading)
{
  bool hasResampled = false;
  
  TNodeVector oldGeneration;
  for (unsigned int i=0; i<m_particles.size(); i++)
  {
    oldGeneration.push_back(m_particles[i].node);
  }
  
  if (m_neff < m_resampleThreshold*m_particles.size())
  {	
    uniform_resampler<double, double> resampler;
    m_indexes=resampler.resampleIndexes(m_weights, adaptSize);

    ParticleVector temp;

    for (unsigned int i=0; i<m_indexes.size(); i++)
    {
      Particle & p=m_particles[m_indexes[i]];

      TNode* node=0;
      TNode* oldNode=oldGeneration[m_indexes[i]];

      node=new TNode(p.pose, oldNode);
      node->reading=reading;

      temp.push_back(p);
      temp.back().node=node;
    }

    m_particles.clear();

    int tmp_size = temp.size();
    for(int i = 0; i<tmp_size;i++)
    {
      temp[i].setWeight(0);

      m_matcher.computeActiveArea(temp[i].map,temp[i].pose,plainReading);
      m_matcher.registerScan(temp[i].map,temp[i].pose,plainReading);

      m_particles.push_back(temp[i]);
    }

    hasResampled = true;
  } 
  else 
  {
    int particle_size = m_particles.size();
 
    for(int i = 0; i < particle_size;i++)
    {
      TNode* node = 0;
      node = new TNode(m_particles[i].pose,oldGeneration[i]);

      node->reading = reading;
      m_particles[i].node = node;

      m_matcher.computeActiveArea(m_particles[i].map, m_particles[i].pose, plainReading);
      m_matcher.registerScan(m_particles[i].map, m_particles[i].pose, plainReading);
    }

  }
  return hasResampled;
}
};
#endif
