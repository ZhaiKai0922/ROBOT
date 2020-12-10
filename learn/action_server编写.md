

# 小海龟前行的action server示例

## 1. forward.action文件编写

service消息有两个区域

- request
- response

然而**action**消息有三个区域

- **goal**
- **result**
- **feedback**

以下是本例中创建的一个action消息

新建一个工作空间，创建一个名为forward_server的功能包，先进入/forward_server目录下创建一个action文件夹，在actio文件夹下创建一个forward.action的文件，内容如下：

![image-20201210203022747](/home/zhx/.config/Typora/typora-user-images/image-20201210203022747.png)

**goal**内容为：line(小乌龟前行的距离)、linear_velocity(小乌龟前行的速度)、time(用户设定前行的时间，规定时间内没有完成则退出)

**result**内容为：output_x(小乌龟前行结束终点的X坐标)、output_y(小乌龟前行结束终点的Y坐标)

**feedback**内容为：feedback_x(小乌龟前行过程中返回此时X坐标)、feedback_y(返回此时Y坐标)

action server提供一个实时的反馈，client可以在进行一半时可以退出，goal是请求、result（只能传一次）、feedback（多次传递）

---

## 2. 修改CMakeLists.txt文件

### 2.1 find_package

![image-20201210205042562](/home/zhx/.config/Typora/typora-user-images/image-20201210205042562.png)

### 2.2  add_action_files、generate_message

![image-20201210205249875](/home/zhx/.config/Typora/typora-user-images/image-20201210205249875.png)

### 2.3 include_directories

![image-20201210205426208](/home/zhx/.config/Typora/typora-user-images/image-20201210205426208.png)

## 3. 编译forward.action

对forward.action文件进行编译，在工作空间的devel/include/forward_server路径下生成下列头文件

![image-20201207185818530](/home/zhx/.config/Typora/typora-user-images/image-20201207185818530.png)

在工作空间的devel/share/forward_server/msg路径下生成下列.msg文件

![image-20201210210417694](/home/zhx/.config/Typora/typora-user-images/image-20201210210417694.png)



## 4. forward.cpp编写

完整代码如下：

```c++
#include <ros/ros.h>
#include <turtlesim/Pose.h>
#include <geometry_msgs/Twist.h>
#include <actionlib/server/simple_action_server.h>
#include "forward_server/forwardAction.h"

ros::Subscriber pose_sub;   //小乌龟位姿订阅者
ros::Publisher linear_velocity_pub;  //小乌龟速度发布者
turtlesim::Pose nowps;  //小乌龟现在的位姿 now pose
geometry_msgs::Twist lin_msg;  //小乌龟的速度大小
float add_line,time_out;  //小乌龟前行的距离 add_line、规定前行的时间time_out
//规定时间内没有运行结束则退出

//使用typedef为现有的SimpleActionServer模板类创建一个别名：Server
//消息类型为forward_server::forwardAction，即上部分定义的action消息类型
typedef actionlib::SimpleActionServer<forward_server::forwardAction> Server;

//收到action的goal后调用该回调函数，该回调函数包含两个参数：forwardGoal的常量指针goal、服务器的指针as
void execute(const forward_server::forwardGoalConstPtr& goal, Server* as)
{
    //传入的参数linear_velocity、line、time赋值给前面定义的lin_msg、add_line、time_out
    lin_msg.linear.x = goal->linear_velocity;
    add_line = goal->line;
    time_out = goal->time;
    //声明用于发布的反馈（feedback）以及结果（result）
    forward_server::forwardFeedback feedback;
    forward_server::forwardResult result;

    //打印出接收到的goal的内容
    ROS_INFO("Goal: line [%f] , linear_velocity [%f], time[%f]  ", 
                            goal->line,goal->linear_velocity,goal->time);

    //定义起始时间
    ros::Time begin = ros::Time::now();
    int count = 0;
    //定义初始位置firstps
    turtlesim::Pose firstps;
    if(count == 0)
    {
        //赋值给初始位置firstps
        firstps = nowps;
        //打印出初始位置的信息
        ROS_INFO_STREAM("The first pose  X :"<<firstps.x<<"; Y :"<<firstps.y); 
    }
    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        //定义距离：根号下(x2-x1)的平方加(y2-y1)的平方，即小乌龟运行到某点与小乌龟初始点之间的距离
        float distance = sqrt((nowps.x-firstps.x)*(nowps.x-firstps.x)+(nowps.y-firstps.y)*(nowps.y-firstps.y));
        //定义此刻时间
        ros::Time now = ros::Time::now();
        //此刻时间与起始时间作差，如果超出了用户设定时间则退出循环
        //当client请求取消当前goal时，Server即as_调用setPreempted()函数
        if(as->isPreemptRequested() || now.sec - begin.sec >= time_out)
        {
            ROS_INFO_STREAM("Exit!");
            //设置action的状态为preempted
            as->setPreempted();
            break;
        }
        //如果此时小乌龟运行距离小于用户设定距离
        else if(distance < add_line)
        {
            //发布前行指令
            linear_velocity_pub.publish(lin_msg);
            //给feedback变量赋值
            feedback.feedback_x = nowps.x;
            feedback.feedback_y = nowps.y;
            //发布feedback变量
            as->publishFeedback(feedback);
        }
        //如果小乌龟运行到指定位置
        else
        {
            //打印出终点坐标
            ROS_INFO_STREAM("The final pose X :"<<nowps.x<<"; Y :"<<nowps.y);
            //给result变量赋值
            result.output_x = nowps.x;pose_sub
            result.output_y = nowps.y;
            //设置action的状态为成功
            as->setSucceeded(result);
            break;
        }  pose_sub

        count++;
        loop_rate.sleep();
    }

}

//小乌龟位姿接收者的回调函数
void poseCallback(const turtlesim::Pose pose)
{
    nowps = pose;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "forward_server");
    ros::NodeHandle n;

    //定义了一个服务器server，包含四个参数：节点句柄、服务器名称、回调函数execute(_1, &server)、false
    //回调函数boost::bind( )详解参考：https://blog.csdn.net/weixin_46181372/article/details/110951454
    //false的意思是暂时不启动这个server（在后面会启动这个server)
    Server server(n, "forward", boost::bind(&execute, _1, &server), false);
    
    pose_sub = n.subscribe("/turtle1/pose", 10, poseCallback);
    linear_velocity_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);

    //服务器开始运行
    server.start();

    ros::spin();

    return 0;
}
```

## 5. 修改CMakeList.txt文件

添加图片中的add_executable()、target_link_libraries()、add_dependencies()

![image-20201210211842001](/home/zhx/.config/Typora/typora-user-images/image-20201210211842001.png)

## 6. 编译并运行

```
roscore
rosrun turtlesim turtlesim_node
rosrun forward_server forward_server
```

![image-20201210212632553](/home/zhx/.config/Typora/typora-user-images/image-20201210212632553.png)

```
rostopic list
```

![image-20201210212816706](/home/zhx/.config/Typora/typora-user-images/image-20201210212816706.png)

```
rostopic pub -1 /forward/goal 双击Tab键补全后面内容
```

自行修改line、linear_velocity、time的数值，如图所示：

![image-20201210213056279](/home/zhx/.config/Typora/typora-user-images/image-20201210213056279.png)

**示例结果：**

终端打印出起始位置、终止位置

![image-20201210213339266](/home/zhx/.config/Typora/typora-user-images/image-20201210213339266.png)

小乌龟前行距离为3.0

![image-20201210213634594](/home/zhx/.config/Typora/typora-user-images/image-20201210213634594.png)

小乌龟前行过程中可以查看话题/forward/feedback、/forward/result

```
rostopic echo /forward/feedback
rostopic echo /forward/result
```

![image-20201210214007025](/home/zhx/.config/Typora/typora-user-images/image-20201210214007025.png)



