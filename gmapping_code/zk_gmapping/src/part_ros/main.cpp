#include "ros/ros.h";
#include "zk_gmapping.h";

int main(int argc, char** argv)
{
    ros::init(argc, argv, "zk_gmapping");

    ZkGMapping slamer;
    slamer.startLiveSlam( );
    ros::spin( );

    return 0;
}