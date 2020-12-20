#ifndef STAT_H
#define STAT_H
#include "point.h"
#include <vector>

namespace GMapping {

double sampleGaussian(double sigma,unsigned int S=0);
double evalLogGaussian(double sigmaSquare, double delta);

struct Covariance3{
	Covariance3 operator + (const Covariance3 & cov) const;
	static Covariance3 zero;
	double xx, yy, tt, xy, xt, yt;
};

struct EigenCovariance3{
	EigenCovariance3();
	EigenCovariance3(const Covariance3& c);
	EigenCovariance3 rotate(double angle) const;
	OrientedPoint sample() const;
	double eval[3];
	double evec[3][3];
};

struct Gaussian3{
	OrientedPoint mean;
	EigenCovariance3 covariance;
	Covariance3 cov;
	double eval(const OrientedPoint& p) const;
};


}; //end namespace
#endif

