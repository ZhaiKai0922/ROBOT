#include "motionmodel.h"

namespace GMapping {

OrientedPoint MotionModel::drawFromMotion(const OrientedPoint& p, const OrientedPoint& pnew, const OrientedPoint& pold) const
{
	double sxy=0.3*srr;

	OrientedPoint delta=absoluteDifference(pnew, pold);

	OrientedPoint noisypoint(delta);

	noisypoint.x+=sampleGaussian(srr*fabs(delta.x)+str*fabs(delta.theta)+sxy*fabs(delta.y));

	noisypoint.y+=sampleGaussian(srr*fabs(delta.y)+str*fabs(delta.theta)+sxy*fabs(delta.x));

	noisypoint.theta+=sampleGaussian(stt*fabs(delta.theta)+srt*sqrt(delta.x*delta.x+delta.y*delta.y));

	noisypoint.theta=fmod(noisypoint.theta, 2*M_PI);
	if (noisypoint.theta>M_PI)
		noisypoint.theta-=2*M_PI;

	return absoluteSum(p,noisypoint);
}

};

