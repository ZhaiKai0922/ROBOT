#include "motionmodel.h"

namespace GMapping {

/*
@desc 里程计运动模型
@p    表示粒子估计的最优位置(激光雷达上一个时刻的最优位置)
@pnew 表示里程计算出来的新的位置
@pold 表示里程计算出来的旧的位置(即上一个里程计的位置)
*/

//运动模型推算地图坐标系下的激光雷达位姿，并不神秘，就是在三个变化量加上高斯噪声，在与之前激光雷达位姿结合就算出来了，就是简单的加法运算

OrientedPoint MotionModel::drawFromMotion(const OrientedPoint& p, const OrientedPoint& pnew, const OrientedPoint& pold) const
{
	double sxy=0.3*srr;
    /*
     * 计算出pnew 相对于 pold走了多少距离
     * 这里的距离表达是相对于车身坐标系来说的。
    */
	OrientedPoint delta=absoluteDifference(pnew, pold);
	
	/*初始化一个点*/
	OrientedPoint noisypoint(delta);
	
	/*走过的X轴方向的距离加入噪声*/
	noisypoint.x+=sampleGaussian(srr*fabs(delta.x)+str*fabs(delta.theta)+sxy*fabs(delta.y));
	
	/*走过的Y轴方向的距离加入噪声*/
	noisypoint.y+=sampleGaussian(srr*fabs(delta.y)+str*fabs(delta.theta)+sxy*fabs(delta.x));
	
	/*走过的Z轴方向的距离加入噪声*/
	noisypoint.theta+=sampleGaussian(stt*fabs(delta.theta)+srt*sqrt(delta.x*delta.x+delta.y*delta.y));
	
	/*限制角度的范围*/
	noisypoint.theta=fmod(noisypoint.theta, 2*M_PI);
	if (noisypoint.theta>M_PI)
		noisypoint.theta-=2*M_PI;
		
	/*把加入了噪声的值 加到粒子估计的最优的位置上  即得到新的位置(根据运动模型推算出来的位置)*/
	return absoluteSum(p,noisypoint);
}

};

