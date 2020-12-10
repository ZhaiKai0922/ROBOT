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
//规定时间没有运行结束返回false

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
    //定义初始位置firstps，终点位置finalps
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
        //如果此时小乌龟运行距离小于用户设定距离则发布指令继续前行
        else if(distance < add_line)
        {
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
            result.output_x = nowps.x;
            result.output_y = nowps.y;
            //设置action的状态为成功
            as->setSucceeded(result);
            break;
        }  

        count++;
        loop_rate.sleep();
    }

}

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