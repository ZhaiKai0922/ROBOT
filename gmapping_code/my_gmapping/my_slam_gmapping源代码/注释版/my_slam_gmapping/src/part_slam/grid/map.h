#ifndef MAP_H
#define MAP_H
#include "../utils/point.h"
#include <assert.h>
#include "accessstate.h"
#include "array2d.h"

namespace GMapping 
{

//在gmapping使用的过程中，cell为PointAccumulator Storage为HierarchicalArray2D<PointAccumulator>
/*
Point   m_center;									//地图的中心
double  m_worldSizeX, m_worldSizeY, m_delta;		//世界坐标系的大小，以及地图的分辨率
Storage m_storage;								    //地图数据存储的地方
int     m_mapSizeX, m_mapSizeY;						//地图的大小
int     m_sizeX2, m_sizeY2;                         //表示地图大小的一半
static const Cell m_unknown;                        //表示栅格的状态，表示整个地图栅格的初始状态
*/

//Map的一个对象，就是一张地图，大小尺寸、分辨率、地图中心

template <class Cell, class Storage, const bool isClass=true> 
class Map
{
	public:
		//构造函数 设置地图大小以及地图的分辨率
		//方式一
		Map(int mapSizeX, int mapSizeY, double delta);
		//方式二
		Map(const Point& center, double worldSizeX, double worldSizeY, double delta);
		//方式三
		Map(const Point& center, double xmin, double ymin, double xmax, double ymax, double delta);

		//重新设置地图大小
		void resize(double xmin, double ymin, double xmax, double ymax);
		//扩展地图大小
		void grow(double xmin, double ymin, double xmax, double ymax);
		
		//物理坐标和栅格坐标的转换
		inline IntPoint world2map(const Point& p) const;
		inline IntPoint world2map(double x, double y) const { return world2map(Point(x,y)); }
		inline Point map2world(const IntPoint& p) const;
		inline Point map2world(int x, int y) const { return map2world(IntPoint(x,y)); }

		//返回地图的一些参数，包括：大小、分辨率之类的参数
		inline Point getCenter() const {return m_center;}	
		inline double getWorldSizeX() const {return m_worldSizeX;}
		inline double getWorldSizeY() const {return m_worldSizeY;}
		inline int getMapSizeX() const {return m_mapSizeX;}
		inline int getMapSizeY() const {return m_mapSizeY;}
		inline double getDelta() const { return m_delta;}
		inline double getMapResolution() const { return m_delta;}
		inline double getResolution() const { return m_delta;}
		inline void getSize(double & xmin, double& ymin, double& xmax, double& ymax) const 
		{
			Point min=map2world(0,0), max=map2world(IntPoint(m_mapSizeX-1, m_mapSizeY-1)); 
			xmin=min.x, ymin=min.y,  xmax=max.x, ymax=max.y; 
		}
		
		//通过物理坐标或者栅格坐标访问栅格状态，调用cell函数
		inline Cell& cell(const IntPoint& p);
        inline Cell& cell(int x, int y){ return cell(IntPoint(x, y)); }

		inline const Cell& cell(const IntPoint& p) const;
        inline const Cell& cell(int x, int y) const{ return cell(IntPoint(x, y)); }

		inline Cell& cell(const Point& p);
        inline Cell& cell(double x, double y){ return cell(Point(x, y)); }

		inline const Cell& cell(const Point& p) const;
        inline const Cell& cell(double x, double y) const{ return cell(Point(x, y)); }

        //判断某一个点是否在地图里面 引用的是模板类m_storage(实际上是HierarchicalArray2D)中的函数
        inline bool isInside(int x, int y) const{ return m_storage.cellState(IntPoint(x,y))&Inside; }
        inline bool isInside(const IntPoint& p) const{	return m_storage.cellState(p)&Inside; }

        inline bool isInside(double x, double y) const{	return m_storage.cellState(world2map(x,y))&Inside; }
        inline bool isInside(const Point& p) const{	return m_storage.cellState(world2map(p))&Inside; }
		
		//=======待验证===========
		inline Storage& storage() { return m_storage; }
		inline const Storage& storage() const { return m_storage; }

	protected:
		Point m_center;									//地图的中心
		double m_worldSizeX, m_worldSizeY, m_delta;		//世界坐标系的大小，以及地图的分辨率
		Storage m_storage;								//地图数据存储的地方
		int m_mapSizeX, m_mapSizeY;						//地图的大小
        int m_sizeX2, m_sizeY2;                         //表示地图大小的一半
		static const Cell m_unknown;
};

//此处初始化m_unknown，调用Cell的构造函数
template <class Cell, class Storage, const bool isClass>
const Cell  Map<Cell,Storage,isClass>::m_unknown = Cell(-1);

//方式一
template <class Cell, class Storage, const bool isClass>
Map<Cell,Storage,isClass>::Map(int mapSizeX, int mapSizeY, double delta):
	m_storage(mapSizeX, mapSizeY)
{
	m_worldSizeX=mapSizeX * delta;
	m_worldSizeY=mapSizeY * delta;
	m_delta=delta;
	m_center=Point(0.5*m_worldSizeX, 0.5*m_worldSizeY);
	m_sizeX2=m_mapSizeX>>1;
	m_sizeY2=m_mapSizeY>>1;
}
//方式二
template <class Cell, class Storage, const bool isClass>
Map<Cell,Storage,isClass>::Map(const Point& center, double worldSizeX, double worldSizeY, double delta):
    m_storage((int)ceil(worldSizeX/delta), (int)ceil(worldSizeY/delta))
{
	m_center=center;
	m_worldSizeX=worldSizeX;
	m_worldSizeY=worldSizeY;
	m_delta=delta;
	m_mapSizeX=m_storage.getXSize()<<m_storage.getPatchSize();
	m_mapSizeY=m_storage.getYSize()<<m_storage.getPatchSize();
	m_sizeX2=m_mapSizeX>>1;
	m_sizeY2=m_mapSizeY>>1;
}
//方式三
template <class Cell, class Storage, const bool isClass>
Map<Cell,Storage,isClass>::Map(const Point& center, double xmin, double ymin, double xmax, double ymax, double delta):
	m_storage((int)ceil((xmax-xmin)/delta), (int)ceil((ymax-ymin)/delta))
{
	m_center=center;
	m_worldSizeX=xmax-xmin;
	m_worldSizeY=ymax-ymin;
	m_delta=delta;
	m_mapSizeX=m_storage.getXSize()<<m_storage.getPatchSize();
	m_mapSizeY=m_storage.getYSize()<<m_storage.getPatchSize();
	m_sizeX2=(int)round((m_center.x-xmin)/m_delta);
	m_sizeY2=(int)round((m_center.y-ymin)/m_delta);
}
		
//重新设置地图的大小
template <class Cell, class Storage, const bool isClass>
void Map<Cell,Storage,isClass>::resize(double xmin, double ymin, double xmax, double ymax)
{
	IntPoint imin=world2map(xmin, ymin);
	IntPoint imax=world2map(xmax, ymax);

	int pxmin, pymin, pxmax, pymax;
	pxmin=(int)floor((float)imin.x/(1<<m_storage.getPatchMagnitude()));
	pxmax=(int)ceil((float)imax.x/(1<<m_storage.getPatchMagnitude()));
	pymin=(int)floor((float)imin.y/(1<<m_storage.getPatchMagnitude()));
	pymax=(int)ceil((float)imax.y/(1<<m_storage.getPatchMagnitude()));
    m_storage.resize(pxmin, pymin, pxmax, pymax);

    m_mapSizeX=m_storage.getXSize()<<m_storage.getPatchSize();
	m_mapSizeY=m_storage.getYSize()<<m_storage.getPatchSize();

    m_worldSizeX=xmax-xmin;
	m_worldSizeY=ymax-ymin;

    m_sizeX2-=pxmin*(1<<m_storage.getPatchMagnitude());
	m_sizeY2-=pymin*(1<<m_storage.getPatchMagnitude());
}
//扩张地图大小
template <class Cell, class Storage, const bool isClass>
void Map<Cell,Storage,isClass>::grow(double xmin, double ymin, double xmax, double ymax)
{
	IntPoint imin=world2map(xmin, ymin);
	IntPoint imax=world2map(xmax, ymax);
	if (isInside(imin) && isInside(imax))
		return;
	imin=min(imin, IntPoint(0,0));
	imax=max(imax, IntPoint(m_mapSizeX-1,m_mapSizeY-1));
	int pxmin, pymin, pxmax, pymax;
	pxmin=(int)floor((float)imin.x/(1<<m_storage.getPatchMagnitude()));
	pxmax=(int)ceil((float)imax.x/(1<<m_storage.getPatchMagnitude()));
	pymin=(int)floor((float)imin.y/(1<<m_storage.getPatchMagnitude()));
	pymax=(int)ceil((float)imax.y/(1<<m_storage.getPatchMagnitude()));
	m_storage.resize(pxmin, pymin, pxmax, pymax);
	m_mapSizeX=m_storage.getXSize()<<m_storage.getPatchSize();
	m_mapSizeY=m_storage.getYSize()<<m_storage.getPatchSize();
	m_worldSizeX=xmax-xmin;
	m_worldSizeY=ymax-ymin;
	m_sizeX2-=pxmin*(1<<m_storage.getPatchMagnitude());
	m_sizeY2-=pymin*(1<<m_storage.getPatchMagnitude());
}

//物理和栅格坐标转换
template <class Cell, class Storage, const bool isClass>
IntPoint Map<Cell,Storage,isClass>::world2map(const Point& p) const
{
	return IntPoint( (int)round((p.x-m_center.x)/m_delta)+m_sizeX2, (int)round((p.y-m_center.y)/m_delta)+m_sizeY2);
}

template <class Cell, class Storage, const bool isClass>
Point Map<Cell,Storage,isClass>::map2world(const IntPoint& p) const
{
	return Point( (p.x-m_sizeX2)*m_delta,
		      (p.y-m_sizeY2)*m_delta)+m_center;
}

//通过物理坐标或者栅格坐标访问栅格状态
template <class Cell, class Storage, const bool isClass>
Cell& Map<Cell,Storage,isClass>::cell(const IntPoint& p) 
{
	AccessibilityState s=m_storage.cellState(p);
	if (! (s&Inside))
		assert(0);
	return m_storage.cell(p);
}

template <class Cell, class Storage, const bool isClass>
Cell& Map<Cell,Storage,isClass>::cell(const Point& p) 
{
	IntPoint ip=world2map(p);
	AccessibilityState s=m_storage.cellState(ip);
	if (! (s&Inside))
		assert(0);
	return m_storage.cell(ip);
}

template <class Cell, class Storage, const bool isClass>
const Cell& Map<Cell,Storage,isClass>::cell(const IntPoint& p) const 
{
  AccessibilityState s=m_storage.cellState(p);
  if (s&Allocated)	 
    return m_storage.cell(p);
  return m_unknown;
}

template <class Cell, class Storage, const bool isClass>
const  Cell& Map<Cell,Storage,isClass>::cell(const Point& p) const 
{
  IntPoint ip=world2map(p);
  AccessibilityState s=m_storage.cellState(ip);
  if (s&Allocated)	 
    return m_storage.cell(ip);
  return  m_unknown;
}

};

#endif
