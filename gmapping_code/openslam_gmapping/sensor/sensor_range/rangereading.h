#ifndef RANGEREADING_H
#define RANGEREADING_H

#include <vector>
#include <sensor/sensor_base/sensorreading.h>
#include "rangesensor.h"

namespace GMapping{

// class RangeReading: public SensorReading, public std::vector<double>{
// 	public:
// 		RangeReading(const RangeSensor* rs, double time=0);
// 		RangeReading(unsigned int n_beams, const double* d, const RangeSensor* rs, double time=0);
// 		virtual ~RangeReading();
// 		inline const OrientedPoint& getPose() const {return m_pose;}
// 		inline void setPose(const OrientedPoint& pose) {m_pose=pose;}
// 		unsigned int rawView(double* v, double density=0.) const;
// 		std::vector<Point> cartesianForm(double maxRange=1e6) const;
// 		unsigned int activeBeams(double density=0.) const;

// 	protected:
// 		OrientedPoint m_pose;
// };

class RangeReading
{
	public:
		//均匀角度的激光雷达数据
		RangeReading(unsigned int n_beams, const double* d);
		//不均匀角度的激光雷达数据
		RangeReading(unsigned int n_beams, const double* d,const double* angle);       

		virtual ~RangeReading();
		
        //得到这帧激光数据的激光雷达位置
		inline const OrientedPoint& getPose() const {return m_pose;}
        //设置这帧传感器数据的位置
		inline void setPose(const OrientedPoint& pose) {m_pose=pose;}
        //返回激光束的多少
        inline const unsigned int getSize() const {return m_beams;}
		
        //存储激光雷达的距离信息
        std::vector<double> m_dists;
        unsigned int        m_beams;
        //每个激光束对应的角度
        std::vector<double> m_angles;
	protected:
        //这帧激光数据的位置 这里的位置表示的是激光雷达的位姿
		OrientedPoint       m_pose;
};

};

#endif
