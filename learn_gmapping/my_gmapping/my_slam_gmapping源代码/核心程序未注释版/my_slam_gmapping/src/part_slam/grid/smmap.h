#ifndef SMMAP_H
#define SMMAP_H

#include "map.h"
#include "harray2d.h"
#include "../utils/point.h"

#define SIGHT_INC 1

namespace GMapping {

struct PointAccumulator
{

	typedef point<float> FloatPoint;

	PointAccumulator(): acc(0,0), n(0), visits(0){}
	PointAccumulator(int i): acc(0,0), n(0), visits(0){assert(i==-1);}

	inline Point mean() const {return 1./n*Point(acc.x, acc.y);}

	inline operator double() const { return visits?(double)n*SIGHT_INC/(double)visits:-1; }

	inline void add(const PointAccumulator& p) {acc=acc+p.acc; n+=p.n; visits+=p.visits; }

	inline void update(bool value, const Point& p=Point(0,0));

	inline double entropy() const;

	static const PointAccumulator& Unknown();

	static PointAccumulator* unknown_ptr;

	FloatPoint acc;

	int n, visits;

};

void PointAccumulator::update(bool value, const Point& p)
{
	if (value) 
	{
		acc.x+= static_cast<float>(p.x);
		acc.y+= static_cast<float>(p.y); 
		n++; 
		visits+=SIGHT_INC;
    }
    else
		visits++;
}

double PointAccumulator::entropy() const
{
	if (!visits)
		return -log(.5);  
	if (n==visits || n==0)
		return 0;         

	double x=(double)n*SIGHT_INC/(double)visits;
	return -( x*log(x)+ (1-x)*log(1-x) );       
}


typedef Map< PointAccumulator,HierarchicalArray2D<PointAccumulator> > ScanMatcherMap;

};

#endif 
