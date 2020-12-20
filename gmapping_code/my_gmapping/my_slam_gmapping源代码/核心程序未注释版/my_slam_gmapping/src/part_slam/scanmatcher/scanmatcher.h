#ifndef SCANMATCHER_H
#define SCANMATCHER_H

#include "../grid/smmap.h"
#include "../utils/macro_params.h"

#define LASER_MAXBEAMS 2048

namespace GMapping {

class ScanMatcher{
public:
    ScanMatcher();
    ~ScanMatcher();

    void setLaserParameters(unsigned int beams, double* angles);
    void setMatchingParameters(double urange, double range, double sigma, int kernsize, double lopt, double aopt, int iterations, double likelihoodSigma=1, unsigned int likelihoodSkip=0 );

    double optimize(OrientedPoint& pnew, const ScanMatcherMap& map, const OrientedPoint& p, const double* readings) const;
    inline double score(const ScanMatcherMap& map, const OrientedPoint& p, const double* readings) const;
    inline unsigned int likelihoodAndScore(double& s, double& l, const ScanMatcherMap& map, const OrientedPoint& p, const double* readings) const;

    void computeActiveArea(ScanMatcherMap& map, const OrientedPoint& p, const double* readings);
    void registerScan(ScanMatcherMap& map, const OrientedPoint& p, const double* readings);

    static const double nullLikelihood;
private:

protected:

    unsigned int  m_laserBeams;														
    double        m_laserAngles[LASER_MAXBEAMS];								    
    IntPoint*     m_linePoints;
    
    PARAM_SET_GET(double, laserMaxRange, protected, public, public)					
    PARAM_SET_GET(double, usableRange, protected, public, public)					
    PARAM_SET_GET(double, gaussianSigma, protected, public, public)
    PARAM_SET_GET(double, likelihoodSigma, protected, public, public)
    PARAM_SET_GET(int,    kernelSize, protected, public, public)
    PARAM_SET_GET(double, optAngularDelta, protected, public, public)				
    PARAM_SET_GET(double, optLinearDelta, protected, public, public)				
    PARAM_SET_GET(unsigned int, optRecursiveIterations, protected, public, public)	
    PARAM_SET_GET(unsigned int, likelihoodSkip, protected, public, public)
    PARAM_SET_GET(bool, generateMap, protected, public, public)
    PARAM_SET_GET(double, enlargeStep, protected, public, public)
    PARAM_SET_GET(double, fullnessThreshold, protected, public, public)				
    PARAM_SET_GET(double, angularOdometryReliability, protected, public, public)	
    PARAM_SET_GET(double, linearOdometryReliability, protected, public, public)		
    PARAM_SET_GET(double, freeCellRatio, protected, public, public)					
    PARAM_SET_GET(unsigned int, initialBeamsSkip, protected, public, public)		
    
};

inline double ScanMatcher::score(const ScanMatcherMap& map, const OrientedPoint& p, const double* readings) const
{
    double s=0;
    const double * angle=m_laserAngles+m_initialBeamsSkip;

    OrientedPoint lp=p;

    unsigned int skip=0;
    double freeDelta=map.getDelta()*m_freeCellRatio;

    for (const double* r=readings+m_initialBeamsSkip; r<readings+m_laserBeams; r++, angle++)
    {
        skip++;
        skip=skip>m_likelihoodSkip?0:skip;
        if (skip||*r>m_usableRange||*r==0.0) continue;

        Point phit=lp;
        phit.x+=*r*cos(lp.theta+*angle);
        phit.y+=*r*sin(lp.theta+*angle);

        IntPoint iphit=map.world2map(phit);

        Point pfree=lp;
        pfree.x+=(*r - freeDelta)*cos(lp.theta+*angle);
        pfree.y+=(*r - freeDelta)*sin(lp.theta+*angle);

        pfree=pfree-phit;
        IntPoint ipfree=map.world2map(pfree);

        bool found=false;
        Point bestMu(0.,0.);
        for (int xx=-m_kernelSize; xx<=m_kernelSize; xx++)
            for (int yy=-m_kernelSize; yy<=m_kernelSize; yy++)
            {
                IntPoint pr=iphit+IntPoint(xx,yy); 
                IntPoint pf=pr+ipfree;             

                const PointAccumulator& cell=map.cell(pr);
                const PointAccumulator& fcell=map.cell(pf);

                if (((double)cell )> m_fullnessThreshold && ((double)fcell )<m_fullnessThreshold)
                {

                    Point mu=phit-cell.mean();
                    if (!found)
                    {
                        bestMu=mu;
                        found=true;
                    }
                    else
                    {
                        bestMu=(mu*mu)<(bestMu*bestMu)?mu:bestMu;
                    }
                }
            }
        if (found)
        {
            double tmp_score = exp(-1.0/m_gaussianSigma*bestMu*bestMu);
            s += tmp_score;                                            
        }
    }
    return s;
}

inline unsigned int ScanMatcher::likelihoodAndScore(double& s, double& l, const ScanMatcherMap& map, const OrientedPoint& p, const double* readings) const
{
    using namespace std;
    l=0;
    s=0;
    const double * angle=m_laserAngles+m_initialBeamsSkip;

    OrientedPoint lp=p;

    double noHit=nullLikelihood/(m_likelihoodSigma);

    unsigned int skip=0;
    unsigned int c=0;
    double freeDelta=map.getDelta()*m_freeCellRatio;

    for (const double* r=readings+m_initialBeamsSkip; r<readings+m_laserBeams; r++, angle++)
    {
        skip++;
        skip=skip>m_likelihoodSkip?0:skip;
        if (*r>m_usableRange) continue;
        if (skip) continue;

        Point phit=lp;
        phit.x+=*r*cos(lp.theta+*angle);
        phit.y+=*r*sin(lp.theta+*angle);
        IntPoint iphit=map.world2map(phit);

        Point pfree=lp;
        pfree.x+=(*r - freeDelta)*cos(lp.theta+*angle);
        pfree.y+=(*r - freeDelta)*sin(lp.theta+*angle);
        pfree=pfree-phit;
        IntPoint ipfree=map.world2map(pfree);

        bool found=false;
        Point bestMu(0.,0.);
        for (int xx=-m_kernelSize; xx<=m_kernelSize; xx++)
            for (int yy=-m_kernelSize; yy<=m_kernelSize; yy++)
            {
                IntPoint pr=iphit+IntPoint(xx,yy);
                IntPoint pf=pr+ipfree;
                const PointAccumulator& cell=map.cell(pr);
                const PointAccumulator& fcell=map.cell(pf);

                if (((double)cell )>m_fullnessThreshold && ((double)fcell )<m_fullnessThreshold)
                {
                    Point mu=phit-cell.mean();
                    if (!found)
                    {
                        bestMu=mu;
                        found=true;
                    }
                    else
                    {
                        bestMu=(mu*mu)<(bestMu*bestMu)?mu:bestMu;
                    }
                }
            }
        if (found)
        {
            s+=exp(-1./m_gaussianSigma*bestMu*bestMu);
            c++;
        }

        if (!skip)
        {
            double f=(-1./m_likelihoodSigma)*(bestMu*bestMu);
            l+=(found)?f:noHit;
        }
    }
    return c;
}

};

#endif
