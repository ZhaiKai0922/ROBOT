

# ROS 中 boost::bind( ) 的使用

## 1. boost::bind( )使用方法

定义如下函数：

```c++
int f(int a, int b)
{
    return a + b;
}
 
int g(int a, int b, int c)
{
    return a + b + c;
}
```

**boost::bind(f, 1, 2)**可以产生一个无参函数对象，返回**f(1, 2)**；类似的，**boost::bind(g, 1, 2, 3)**相当于**g(1, 2, 3)**

---

其中boost::bind()中使用较为频繁的还有**占位符**：

如：boost::bind(f, **_1**, 5) (x)  中，**_1**就是一个占位符，其位于**f**函数形参的**第一形参 int a** 的位置，**5**位于**第二形参 int b** 的位置；

**_1** 表示（x）参数列表的第一个参数；所以，boost::bind(f, **_1**, 5) (x) 相当于 f(**x** ,5)。再看下面这些例子：

```c++
boost::bind(f, _2, _1)(x, y);   //相当于f(y,x)，即_2表示后面参数列表的第二个位置：y
boost::bind(g, _1, 9, _1)(x);  //相当于g(x, 9, x)
boost::bind(g, _3, _3, _3)(x, y, z);  //相当于g(z, z, z)
```



## 2. ROS中boost::bind( )常见用法

ROS编程过程中，有许多需要给回调函数传递多个参数的情况，下面结合实例进行简单总结一下：

### 2.1 回调函数仅单个参数

```c++
#include <ros/ros.h>
#include <turtlesim/Pose.h>

void callback(const turtlesim::PoseConstPtr& msg)  //单个参数为：消息类型为turtlesim::Pose的常量指针msg
{
    float pose_x;
    pose_x = msg->x;
    ROS_INFO("x = [%f]",pose_x);  //打印出小乌龟所在的x坐标
}
```



### 2.2 回调函数含多个参数

```c++
#include <ros/ros.h>
#include <turtlesim/Pose.h>

void callback(const turtlesim::PoseConstPtr& msg, int x, int y)  //三个参数：常量指针msg、x、y
{
    float pose_x;
    pose_x = msg->x;
    ROS_INFO("x = [%f]",pose_x);  //打印出小乌龟所在的x坐标
    ROS_INFO("input_x = [%i] ; input_y = [%i]", x, y);  //打印出输入的参数x、y
}
```



### 2.3 主函数

```c++
int input_x = 1;
int input_y = 2;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test");
    ros::NodeHandle n;
    
    ros::Subscriber pose_sub = n.subscribe<turtlesim::Pose>("/turtle1/pose", 10, callback);
    //回调函数为单个参数时，这里直接使用callback，传递的单个参数为：接收话题名为/turtle1/pose中的内容；
    
    //ros::Subscriber pose_sub = n.subscribe<turtlesim::Pose>("/turtle1/pose", 10, boost::bind(&callback, _1, input_x, input_y));    
    //这里回调函数为三个参数时，使用boost::bind(&callback, _1, input_x, input_y)，这里_1即为占位符，为subscriber接收到的/turtle1/pose话题中的内容占位；相当于callback(turtlesim::PoseConst& msg, input_x, input_y)
    
    ros::Rate loop_rate(1);
    int i=1;
    while(i<=3)
    {
        ros::spinOnce();
        loop_rate.sleep();
        i++;
    }
    return 0;
}
```



## 3.运行示例

### 3.1 完整代码

```c++
#include <ros/ros.h>
#include <turtlesim/Pose.h>

int input_x = 1;
int input_y = 2;

void callback(const turtlesim::PoseConstPtr& msg, int x, int y)
{
    float pose_x;
    pose_x = msg->x;
    ROS_INFO("x = [%f]",pose_x);
    ROS_INFO("input_x = [%i] ; input_y = [%i]", x, y);
}

void callback(const turtlesim::PoseConstPtr& msg)
{
    float pose_x;
    pose_x = msg->x;
    ROS_INFO("x = [%f]",pose_x);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test");
    ros::NodeHandle n;
    ros::Subscriber pose_sub = n.subscribe<turtlesim::Pose>("/turtle1/pose", 10, boost::bind(&callback, _1, input_x, input_y));    
    //ros::Subscriber pose_sub = n.subscribe<turtlesim::Pose>("/turtle1/pose", 10, callback);
    ros::Rate loop_rate(1);
    int i=1;
    while(i<=3)
    {
        ros::spinOnce();
        loop_rate.sleep();
        i++;
    }
    return 0;
}
```

### 3.2 运行结果

![image-20201210115423097](/home/zk/桌面/image-20201210115423097.png)

终端中分别打印出了小乌龟所在的X坐标，以及我们代码中定义的input_x，input_y。

