#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include <actionlib_tutorials/FibonacciAction.h>

class FibonacciAction
{
    protected:

    ros::NodeHandle nh_;
    actionlib::SimpleActionServer<actionlib_tutorials::FibonacciAction> as_;
    std::string action_name_;

    //创建反馈与结果消息，以便在后面的action中发布
    actionlib_tutorials::FibonacciFeedback feedback_;
    actionlib_tutorials::FibonacciResult result_;

    public:

    //在构造函数中，创建了一个动作服务器，参数有：节点句柄，action名称，执行函数
    FibonacciAction(std::string name):
        as_(nh_, name, boost::bind(&FibonacciAction::executeCB, this, _1), false),
        action_name_(name)
    {
        as_.start();
    }

    ~FibonacciAction(void){}
    
    //回调函数，通过一个常量指针来传递goal
    void executeCB(const actionlib_tutorials::FibonacciGoalConstPtr &goal)
    {
        ros::Rate r(1);
        bool success = true;

        //push_back the seeds for the fibonacci sequence
        feedback_.sequence.clear();
        feedback_.sequence.push_back(0);
        feedback_.sequence.push_back(1);

        //publish info to the console for user
        ROS_INFO("%s:  Executing, creating fibonacci sequence of order %i with seeds %i, %i",
                                action_name_.c_str(), goal->order, feedback_.sequence[0], feedback_.sequence[1] );
        
        //start executing the action
        for(int i =1; i<=goal->order; i++)
        {
            //check that preempt has not been requested by the client
            //action server一个重要组件是允许action client请求取消当前目标执行。
            //当client请求取消当前goal时，Server即as_调用setPreempted()函数
            if(as_.isPreemptRequested() || !ros::ok())
            {
                ROS_INFO("%s: Preempted",action_name_.c_str());
                //set the action state to preempted
                as_.setPreempted();
                success = false;
                break;
            }
            feedback_.sequence.push_back(feedback_.sequence[i] + feedback_.sequence[i-1]);
            //publish the feedback
            //斐波那契序列被放入到feedback变量，然后进行发布。
            as_.publishFeedback(feedback_);
            //this sleep is not necessary, the sequence is computed at 1 Hz for demonstration 
            r.sleep();
        }

        if(success)
        {
            result_.sequence = feedback_.sequence;
            ROS_INFO("%s:Succeed", action_name_.c_str());
            //set the action state to succeeded
            as_.setSucceeded(result_);
        }

    }

};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "fibonacci");

    FibonacciAction fibonacci("fibonacci");
    ros::spin();

    return 0;
}