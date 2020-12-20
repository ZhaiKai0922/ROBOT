#ifndef MOTIONMODEL_H
#define MOTIONMODEL_H

#include "../utils/point.h"
#include "../utils/stat.h"
#include <iostream>

namespace  GMapping { 

struct MotionModel{
	
	OrientedPoint drawFromMotion(const OrientedPoint& p, const OrientedPoint& pnew, const OrientedPoint& pold) const;
	double srr, str, srt, stt;
};

};

#endif
