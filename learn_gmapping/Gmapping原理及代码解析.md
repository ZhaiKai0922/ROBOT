# Gmapping原理及代码解析

https://blog.csdn.net/weixin_40863346/article/details/88870663

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

## 4. point.h

##  5. processScan







