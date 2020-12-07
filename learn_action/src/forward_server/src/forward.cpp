#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include "forward_server/forwardAction.h"

//使用typedef为现有的SimpleActionServer模板类创建一个别名：Server；
//消息类型为forward_server::forwardAction，即上部分定义的action消息类型
typedef actionlib::SimpleActionServer<forward_server::forwardAction> Server;

//收到action的goal后调用该回调函数
void execute(const forward_server::forwardActionConstPtr& goal, Server* as)
{
    ros::Rate r(1);
    forward_server::forwardFeedback feedback;

    ROS_INFO("xxx", goal->)

    for(int i=1; i<=10; i++)
    {
        feedback.percent_complete = i *10;
        as->publishFeedback(feedback);
        r.sleep();
    }

    //当action完成后，向客户端返回结果
    ROS_INFO("forward %d finish working.", goal->)；
    as->setSucceeded();
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

    //服务器开始运行
    server.start();

    ros::spin();

    return 0;
}