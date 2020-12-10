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