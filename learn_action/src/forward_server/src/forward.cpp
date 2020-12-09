#include <ros/ros.h>
#include <turtlesim/Pose.h>
#include <geometry_msgs/Twist.h>
#include <actionlib/server/simple_action_server.h>
#include "forward_server/forwardAction.h"

ros::Subscriber pose_sub;
ros::Publisher linear_velocity_pub;
turtlesim::Pose nowps;
geometry_msgs::Twist lin_msg,lin_min,definite_lin;
float add_line,time_out;

//使用typedef为现有的SimpleActionServer模板类创建一个别名：Server；
//消息类型为forward_server::forwardAction，即上部分定义的action消息类型
typedef actionlib::SimpleActionServer<forward_server::forwardAction> Server;

//收到action的goal后调用该回调函数
void execute(const forward_server::forwardGoalConstPtr& goal, Server* as)
{
    lin_msg.linear.x = goal->linear_velocity;
    add_line = goal->line;
    time_out = goal->time;

    forward_server::forwardFeedback feedback;
    forward_server::forwardResult result;

    ROS_INFO("Goal: line [%f] , linear_velocity [%f], time[%f]  ", 
                            goal->line,goal->linear_velocity,goal->time);
    
    ros::Time begin = ros::Time::now();
    int count = 0;
    turtlesim::Pose firstps,finalps;
    if(count == 0)
    {
        firstps = nowps;
        ROS_INFO_STREAM("The first pose  X :"<<firstps.x<<"; Y :"<<firstps.y); 
    }
    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        ros::spinOnce();
        float distance = sqrt((nowps.x-firstps.x)*(nowps.x-firstps.x)+(nowps.y-firstps.y)*(nowps.y-firstps.y));

        ros::Time now = ros::Time::now();
        if(now.sec - begin.sec >= time_out)
        {
            ROS_INFO_STREAM("Time out !");
            as->setPreempted();
            break;
        }
        else if(distance < add_line)
        {
            linear_velocity_pub.publish(lin_msg);
            feedback.feedback_x = nowps.x;
            feedback.feedback_y = nowps.y;
        }
        else
        {
            finalps.x = nowps.x;
            finalps.y = nowps.y;
            ROS_INFO_STREAM("The final pose X :"<<finalps.x<<"; Y :"<<finalps.y);
            result.output_x = finalps.x;
            result.output_y = finalps.y;
            as->setSucceeded(result);
            break;
        }  

        as->publishFeedback(feedback);
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

    //定义一个服务器,成员as通过指定的节点句柄n来实例化，并在接到消息后执行一个函数（execute）
    //这里定义了一个server的名称“forward_server”
    //this会告诉“boost::bind”这个函数是类的成员
    //_1会被boost::bind用来通知execute回调函数只取一个数值
    //false的意思是暂时不启动这个server（在后面会启动这个server)
    Server server(n, "forward", boost::bind(&execute, _1, &server), false);
    
    pose_sub = n.subscribe("/turtle1/pose", 10, poseCallback);
    linear_velocity_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);

    //服务器开始运行
    server.start();

    ros::spin();

    return 0;
}