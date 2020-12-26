# Explanation of switch_case

## 1. 示例

```cpp
#include "iostream"
using namespace std;

int main()
{
    int mark;
    cout<<"请输入成绩（0~100）:";
    cin>>mark;

    switch (mark/20)
    {
        case 5:  //当输入mark/20等于5时
        {
            if(mark>100)//100~119都是mark/20==5，所以要用if语句再次进行过滤
            {
                cout<<"ERROR"<<endl;
                break;
            }
            cout<<"perfect"<<endl;//当mark=100时
            break;  
        }
        case 4:  //当mark输入80~99时
        {
            cout<<"Good!"<<endl;
            break;
        }
        case 3: //当mark输入60~79时
        {
            cout<<"Soso"<<endl;
            break;
        }
        case 2://当mark输入小于60时，由于case 2语句块中没有break，所以会继续跳转到下面其他语句块
        case 1:
        case 0://当mark小于60时，最终会进入case 0语句块
        {
            if (mark >=0)
            {
                cout<<"Please work harder!"<<endl; //所有大于等于0，小于60的成绩都会打印出“Please work harder!”
                break;
            }
            cout<<"ERROR!"<<endl;  //当mark小于0则显示出错！
        }
    }
    return 0;
}
```

## 2. 运行结果

![image-20201225165128788](/home/zhx/zk/ROBOT/learn/c++/image-20201225165128788.png)

# Explanation of enum

## 1. 枚举量的声明和定义

```cpp
enum enumType{Monday, TuesDay, Wednesday, Thursday, Friday, Saturday, Sunday}
//这句话有两个作用：
//1. 声明enumType为新的数据类型，称为枚举；
//2. 声明Monday，Tuesday等为符号常量，通常称之为枚举量，其默认值分别为0-6 。

enumType Weekday //声明enumType型的变量
//然而与基本变量类型不同的是，在不进行强制转换的前提下，只能将定义的枚举量赋值给该enumType型变量，如下：
Weekday = Monday;
Weekday = Sounday;  //不能将其他值赋给枚举变量，如：Weekday = 10； 这是不被允许的，因为10不是枚举量
//当然我们也可以利用强制类型转换，将其他类型值赋给枚举变量，我们下面会讲

//上面讲到不能将非枚举量赋给枚举变量，那么我们能不能将枚举量赋给非枚举变量呢？
int a = Sunday;   //这是允许的，因为枚举量是符号常量，这里的赋值编译器会自动把枚举量转换成int类型

//前面讲可以对枚举变量进行赋值运算，那枚举变量能不能进行算术运算呢？
Weekday++ ;                                         //非法
Weekday = Monday + Tuesday;    //这是非法的，因为这些操作可能导致违反类型限制
//比如：Weekday = Sunday; Weekday++; 首先枚举变量被赋值了枚举量中最后一个值Sunday（值为6），再进行递增的话，Weekday增加到了7，而对于enumType类型来说，7是无效的。
//总结来说：对于枚举，只定义了赋值运算，没有定义算术运算

//不能对枚举量进行算术运算，那么枚举量能不能参与其他类型变量的运算呢？
int a;
int a = 1 + Monday;  //这是允许的，因为编译器会自动将枚举量转换为int型

//我们如何通过强制转换将 非枚举量 赋值给 枚举变量 呢？
Weekday = enumType(2);//等同于Ｗeekday=Ｗednesday;
                     //但是，如果试图将一个超出枚举取值范围的值通过强制转换赋给枚举变量，会出现什么后果呢？
Weekday = enumType(20); //结果将是不确定的，这么做不会出错，但是得不到想要的结果
```

## 2. 自定义枚举量的值

```cpp
//前面讲通过定义 enum enumType {Monday, Ｔuesday, Wednesday, Thursday, Friday, Saturday, Sunday}
//枚举量Ｍonday,Tuesday等的值默认分别为0-6，我们可以显式的设置枚举量的值
enum enumType {Monday=1, Tuesday=2, wednesday=3, Thursday=4, Friday=5, Saturday=6, Sunday=7}
//注意指定的值必须是整数

//当然也可以显式的定义一部分枚举量的值
enum enumType {Monday=1, Tuesday, Wednesday=1,Thursday,Friday,Saturday,Sunday};
//这样Monday、Ｗednesday均被定义为１，则Tuesday=2,Thursday,Wednesday,Friday,Saturday,Sunday的值分别默认为２、３、４、５
//总结：未被初始化的枚举值的默认值将比其他前面的枚举值大１
//同时，我们也可以看出枚举量的值可以是相同的
```

## 3. 枚举的取值范围

前面讲到可以通过强制转换将其他类型值赋给枚举变量：Ｗeekday=enumType(2); 这是合法的；但是Weekday=enumType(20);这是非法的。

这里涉及枚举取值范围的概念：枚举的上限是　**大于最大枚举量的　最小的２的幂　减去１**（例如最大枚举量的值为５，大于最大枚举量且为２的幂：８，减去１，为７，所以枚举取值的上限为７）;

枚举的下限有两种情况：一、枚举量的最小值不小于０，则下限取值为０；二、枚举量的最小值取值小于０，则枚举的下限是　**小于最小枚举量的　最大的２的幂　加上１**

举例来讲：

```cpp
enum enumType1{First=-5, Second=14, Third=10};
//则枚举的上限是16-1=15,枚举的下限是-8+1=-7
```

## 4. 枚举的应用

个人觉得**枚举**和**switch**是最好的搭档

```cpp
enum enumType{Step0, Step1, Step2, Step3, Step4};
enumType Step;
Step = Step0;

```













https://blog.csdn.net/songsong2017/article/details/84103565?ops_request_misc







