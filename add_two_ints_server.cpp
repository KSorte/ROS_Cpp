#include "ros/ros.h"
#include "ros_cpp/AddTwoInts.h"

bool add(ros_cpp::AddTwoInts::Request &req, ros_cpp::AddTwoInts::Response &res)
{
res.sum = req.a + req.b;
  ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
  ROS_INFO("sending back response: [%ld]", (long int)res.sum);
  return true;
}

int main(int argc, char **argv)
{

ros::init(argc, argv, "add_two_ints_server");
ros:: NodeHandle n;

ros::ServiceServer service = n.advertiseService("add2ints_service",add);   // calls the bool add function
ROS_INFO("Ready to add two ints.");
ros::spin();
return 0;
}


