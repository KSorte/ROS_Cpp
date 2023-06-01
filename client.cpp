#include "ros/ros.h"
#include "ros_cpp/AddTwoInts.h"
#include <cstdlib>

int main(int argc, char **argv)
{
ros::init(argc, argv, "client_node");

if (argc!= 3)
{
 ROS_INFO("usage: add_two_ints_client X Y");
 return 1;
}
ros::NodeHandle n;
ros::ServiceClient client = n.serviceClient<ros_cpp::AddTwoInts>("add2ints_service");    // The name in quotes here should be the same as one put at ServiceServer in server code. 
ros_cpp::AddTwoInts srv;

srv.request.a = atoll(argv[1]);
srv.request.b = atoll(argv[2]);

if (client.call(srv))
{
ROS_INFO("SUM = %ld",(long int)srv.response.sum);
}
else
{
ROS_ERROR("Failed to Call service");
return 1; 
}
return 0;
}

