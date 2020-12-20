#ifndef ARRAY2D_H
#define ARRAY2D_H

#include <assert.h>
#include "../utils/point.h"
#include "accessstate.h"
#include <iostream>

namespace GMapping {

//Array2D类 可以理解为二维的数组，数组的模板元素为Cell,在gmapping的使用过程中cell类的实例是PointAccumulator
/*
	Cell ** m_cells;       指向每个栅格的二级指针，可通过m_cells[i][j]访问每个栅格的内容
	int m_xsize, m_ysize;  栅格地图的大小
*/

//Array2D的一个对象就是一个二维数组（栅格地图）

template<class Cell, const bool debug=false> 
class Array2D
{
	public:
		//构造函数，参数栅格地图大小，为每个栅格申请内存
		Array2D(int xsize=0, int ysize=0);
		//重载 = 运算符
		Array2D& operator=(const Array2D &);
		//重载的构造函数，根据Array2D对象作为参数，为每个栅格申请内存
		Array2D(const Array2D<Cell,debug> &);
		//析构函数，销毁整个地图每个栅格的内存
		~Array2D();
		//清空栅格地图
		void clear();
		//重新调整地图大小
		void resize(int xmin, int ymin, int xmax, int ymax);
		//判断某个栅格是否在该栅格地图内
		inline bool isInside(int x, int y) const;
		inline bool isInside(const IntPoint& p) const { return isInside(p.x, p.y);}
		//输入栅格坐标（x，y）返回cell对象
		inline Cell& cell(int x, int y);
		inline Cell& cell(const IntPoint& p) {return cell(p.x,p.y);}
		inline const Cell& cell(int x, int y) const;
		inline const Cell& cell(const IntPoint& p) const {return cell(p.x,p.y);}
		
		inline AccessibilityState cellState(int x, int y) const { return (AccessibilityState) (isInside(x,y)?(Inside|Allocated):Outside);}
		inline AccessibilityState cellState(const IntPoint& p) const { return cellState(p.x, p.y);}

		inline int getPatchSize() const{return 0;}
		inline int getPatchMagnitude() const{return 0;}

		inline Cell** cells() {return m_cells;}
		inline int getXSize() const {return m_xsize;}
		inline int getYSize() const {return m_ysize;}

		//每个地图指向所有栅格的二级指针
		Cell ** m_cells;
	protected:
		//栅格地图的大小
		int m_xsize, m_ysize;
};
//参数栅格地图大小，为整个栅格地图的每个栅格申请内存
template <class Cell, const bool debug>
Array2D<Cell,debug>::Array2D(int xsize, int ysize)
{
	m_xsize=xsize;
	m_ysize=ysize;
	if (m_xsize>0 && m_ysize>0)
	{
		m_cells=new Cell*[m_xsize];
		for (int i=0; i<m_xsize; i++)
			m_cells[i]=new Cell[m_ysize];
	}
	else
	{
		m_xsize=m_ysize=0;
		m_cells=0;
	}
}

//相同类型的Array2D对象，可以进行 = 赋值操作
template <class Cell, const bool debug>
Array2D<Cell,debug> & Array2D<Cell,debug>::operator=(const Array2D<Cell,debug> & g)
{
	if (debug || m_xsize!=g.m_xsize || m_ysize!=g.m_ysize)
	{
		for (int i=0; i<m_xsize; i++)
			delete [] m_cells[i];
		delete [] m_cells;
		m_xsize=g.m_xsize;
		m_ysize=g.m_ysize;
		m_cells=new Cell*[m_xsize];
		for (int i=0; i<m_xsize; i++)
			m_cells[i]=new Cell[m_ysize];
	}
	for (int x=0; x<m_xsize; x++)
		for (int y=0; y<m_ysize; y++)
			m_cells[x][y]=g.m_cells[x][y];
	
	return *this;
}

//根据Array2D对象作为参数，为整个栅格地图的每个栅格申请内存
template <class Cell, const bool debug>
Array2D<Cell,debug>::Array2D(const Array2D<Cell,debug> & g)
{
	m_xsize=g.m_xsize;
	m_ysize=g.m_ysize;
	m_cells=new Cell*[m_xsize];
	for (int x=0; x<m_xsize; x++)
	{
		m_cells[x]=new Cell[m_ysize];
		for (int y=0; y<m_ysize; y++)
			m_cells[x][y]=g.m_cells[x][y];
	}
}

//销毁整个地图每个栅格的内存
template <class Cell, const bool debug>
Array2D<Cell,debug>::~Array2D()
{
  for (int i=0; i<m_xsize; i++)
  {
    delete [] m_cells[i];
    m_cells[i]=0;
  }
  delete [] m_cells;
  m_cells=0;//指向为空
}

//销毁整个地图每个栅格的内存，清空栅格地图
template <class Cell, const bool debug>
void Array2D<Cell,debug>::clear()
{
  for (int i=0; i<m_xsize; i++)
  {
    delete [] m_cells[i];
    m_cells[i]=0;
  }
  delete [] m_cells;
  m_cells=0;
  m_xsize=0;
  m_ysize=0;
}

//根据栅格地图的的四个角点坐标参数，重新调整地图大小
template <class Cell, const bool debug>
void Array2D<Cell,debug>::resize(int xmin, int ymin, int xmax, int ymax)
{
	int xsize=xmax-xmin;
	int ysize=ymax-ymin;
	//重新为新地图的所有栅格申请内存
	Cell ** newcells=new Cell *[xsize];
    for (int x=0; x<xsize; x++)
    {
		newcells[x]=new Cell[ysize];
	}
	//xmin、ymin最小值为0，因为地图坐标没有负值的缘故
	int dx= xmin < 0 ? 0 : xmin;
	int dy= ymin < 0 ? 0 : ymin;
	//此方法可以合理的遍历内存，不越界也不做无用的访问，因为只取原来的值
	int Dx= xmax < this->m_xsize ? xmax:this->m_xsize;
	int Dy= ymax < this->m_ysize ? ymax:this->m_ysize;
	//把原来的地图中的栅格数据复制到新的内存中，然后销毁原来的指针
    for (int x=dx; x<Dx; x++)
    {
        for (int y=dy; y<Dy; y++)
        {
			newcells[x-xmin][y-ymin]=this->m_cells[x][y];
		}
		delete [] this->m_cells[x]; //销毁每一列
	}
	delete [] this->m_cells;
	this->m_cells=newcells;	//新的二级指针指向老的二级指针
	this->m_xsize=xsize;    //新的地图大小
	this->m_ysize=ysize; 
}

//判断某个栅格是否在该栅格地图内
template <class Cell, const bool debug>
inline bool Array2D<Cell,debug>::isInside(int x, int y) const
{
	return x>=0 && y>=0 && x<m_xsize && y<m_ysize; 
}

//输入栅格坐标（x，y）返回cell对象，每个cell对象包含一个栅格所有成员函数和成员变量
template <class Cell, const bool debug>
inline Cell& Array2D<Cell,debug>::cell(int x, int y)
{
	assert(isInside(x,y));
	return m_cells[x][y];
}

template <class Cell, const bool debug>
inline const Cell& Array2D<Cell,debug>::cell(int x, int y) const
{
	assert(isInside(x,y));
	return m_cells[x][y];
}

};

#endif