# Gmapping原理及代码解析

https://blog.csdn.net/weixin_40863346/article/details/88870663

https://www.bbsmax.com/A/WpdKwowZdV/

https://blog.csdn.net/shoufei403/article/details/102737676

---

2020.12.16  

---

## 1. inline函数

在函数声明或者定义中，函数返回类型前加上关键字inline即把min( )指定为内联。

关键字inline必须与函数定义体放在一起才能使函数成为内联，仅将inline放在函数声明前面不起任何作用。

定义在类声明之中的成员函数自动成为内联函数

## 2. C++中的struct与class

C++ 中保留了C语言的struct关键字，并且加以扩充 。在C语言中，struct只能包含成员变量不能包含成员函数。而在C++中，struct类似于class，既可以包含成员变量又可以包含成员函数。

C++中struct与class基本上是通用的，唯有几个细节不同：

- 使用class时，类成员默认都是private属性的；而在使用struct时，结构体中的成员默认都是public属性的。
- class继承默认是private继承，而struct继承默认是public继承。

## 3.派生类语法说明

```cpp
class B:public A  //  : 后面的被称为基类名表，基类名表构成：访问控制+基类名；
//访问控制表示派生类对基类的继承方式
{
}
```

访问控制使用关键字：

- public:公有继承
- private:私有继承
- protected:保护继承

### 继承的重要说明：

1.子类拥有父类除了父类构造和析构函数，所有的成员函数和成员变量

2.子类就是一种特殊的父类

3.子类对象可以当做父类对象使用

4.子类可以拥有父类没有的方法和属性

---

2020.12.17

---

## 1. 双线程和程序的基本执行流程

Gmapping采用GridSlamProcessorThread后台线程进行数据的读取和运算，在**gsp_thread.h**和相应的**gsp_thread.cpp**中可以看到初始化，参数配置，扫描数据读取等方法。

最关键的流程是在后台线程调用的方法：void* GridSlamProcessorThread::fastslamthread(GridSlamProcessorThread* gpt)

而这个方法中最主要的处理扫描数据的过程在428行，bool processed = gpt->processScan(*rr); 同时可以看到Gmapping支持在线和离线两种模式。

注意到：struct GridSlamProcessoThread:public GridSlamProcessor，这个后台线程执行类GridSlamProcessorThread继承自GridSlamProcessor，所以执行的是**GridSlamProcessor**的**processScan**方法。

### 1.1 运动模型

t时刻粒子的位姿最初由运动模型进行更新。在初始值的基础上增加高斯采样的noisypoint，参考MotionModel::drawFromMotion( )方法。

![image-20201217105223078](/home/zk/zk/ROBOT/learn_gmapping/image-20201217105223078.png)

![image-20201217105251043](/home/zk/zk/ROBOT/learn_gmapping/image-20201217105251043.png)

里程计数据通过轮编码器获取，随着时间的推移，误差会不断积累，而且角度误差积累的更厉害。IMU对角度的误差比距离积累要小。另外，机器人也可能存在机器人“绑架”之类的机械问题。这些都是运动模型的局限性，需要对运动观测数据进行优化校正，提高机器人的位姿精度。

机器人“绑架”指的是机器人在运动过程中发生了滑动，机器人传感器观测并不知道此情况的发生。

参考博客：https://www.cnblogs.com/yhlx125/p/5677135.html

**代码部分**

p是粒子的t-1时刻的位姿，pnew是当前t时刻的里程计读数，pold是t-1时刻的里程计读数。

**utils/point.h**

```cpp
template <class T>
struct point{  //point 类
	inline point():x(0),y(0) {}
	inline point(T _x, T _y):x(_x),y(_y){}
	T x, y;
};
```

```cpp
template <class T, class A>
struct orientedpoint: public point<T>{   //orientedpoint 类
  inline orientedpoint() : point<T>(0,0), theta(0) {};
	inline orientedpoint(const point<T>& p);
	inline orientedpoint(T x, T y, A _theta): point<T>(x,y), theta(_theta){}
        inline void normalize();
	inline orientedpoint<T,A> rotate(A alpha){
		T s=sin(alpha), c=cos(alpha);
		A a=alpha+theta;
		a=atan2(sin(a),cos(a));//atan2(y, x) 求的是y/x的反正切，
		return orientedpoint(
			c*this->x - s*this->y,
			s*this->x + c*this->y, 
			a);
	}
	A theta;
};

typedef point<int> IntPoint;  //IntPoint 类
typedef point<double> Point;  //Point 类
typedef orientedpoint<double, double> OrientedPoint; // OrientedPoint 类
```

**gridfastslam/motionmodel.h**

```cpp
struct MotionModel{
	OrientedPoint drawFromMotion(const OrientedPoint& p, double linearMove, double angularMove) const;
	OrientedPoint drawFromMotion(const OrientedPoint& p, const OrientedPoint& pnew, const OrientedPoint& pold) const;
	Covariance3 gaussianApproximation(const OrientedPoint& pnew, const OrientedPoint& pold) const;
	double srr, str, srt, stt;
};
//absoluteDifference
template <class T, class A>
orientedpoint<T,A> absoluteDifference(const orientedpoint<T,A>& p1,const orientedpoint<T,A>& p2){
	orientedpoint<T,A> delta=p1-p2;
	delta.theta=atan2(sin(delta.theta), cos(delta.theta));
	double s=sin(p2.theta), c=cos(p2.theta);
	return orientedpoint<T,A>(c*delta.x+s*delta.y, 
	                         -s*delta.x+c*delta.y, delta.theta);
}
//absoluteSum
template <class T, class A>
orientedpoint<T,A> absoluteSum(const orientedpoint<T,A>& p1,const orientedpoint<T,A>& p2){
	double s=sin(p1.theta), c=cos(p1.theta);
	return orientedpoint<T,A>(c*p2.x-s*p2.y,
				  s*p2.x+c*p2.y, p2.theta) + p1;
}
```

**gridfastslam/motionmodel.cpp**

```c++
OrientedPoint 
MotionModel::drawFromMotion(const OrientedPoint& p, const OrientedPoint& pnew, const OrientedPoint& pold) const{
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
```

运动模型部分至此结束，可以通过t-1时刻的位姿、里程计信息，推算出t时刻机器人的位姿。

## 2. 扫描匹配

扫描匹配获取最优的采样粒子，Gmapping默认采用30个采样粒子。

GridSlamProcessor::scanMatch

注意ScanMatcher::score( )函数的原理是likehood_field_range_finder_model方法，参考《概率机器人》手稿P143页。

ScanMatcher::optimize( )方法获得了一个最优粒子，基本流程是按照预先设定的步长不断移动粒子的位置，根据提议分布计算s，得到score最小的那个作为粒子的新的位姿。

ScanMatcher::likelihoodAndScore( )和ScanMatcher::score( )方法基本一致，但是是将新获得的粒子位姿进行计算q，为后续权重计算做了准备。

ScanMatcher::optimize( )方法——粒子的运动+score( )中激光观测数据。

其他扫描方法也是可以使用的：比如ICP算法（rbpf-gmapping的使用的是ICP方法，先更新了旋转角度，然后采用提议分布再次优化粒子）、CrossCorrelation、线特征等等。

参考网站：https://www.cnblogs.com/yhlx125/p/5586499.html

**slam-gmapping之scanMatch算法原理：**

- 问题描述：给定scan和map，或者给定scan和scan，或者给定map和map，找到最匹配的变换（translation+rotation）
- 作用：提高提议分布
- 方法：

![image-20201217165000018](/home/zk/zk/ROBOT/learn_gmapping/image-20201217165000018.png)













## 4. point.h

##  5. processScan







