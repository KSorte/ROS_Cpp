#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
using namespace std;

// GLOBAL VARIABLES

ros:: Publisher filtered_publisher;  // Publisher

void lidarCallback(const sensor_msgs::LaserScan::ConstPtr &scan)
{

    float range_max = scan->range_max;
    float range_min = scan->range_min;
    ROS_INFO("Minimum range: %f", scan->range_min);
    ROS_INFO("Maximum range: %f", scan->range_max);
    vector<float> filteredranges;
    
    for (int i = 0; i<scan->ranges.size();i++)
    {
        if (scan->ranges[i]<range_max && scan->ranges[i]>range_min)
        {
            filteredranges.push_back(scan->ranges[i]);
        }
    }
    sensor_msgs::LaserScan filteredScan; 
    filteredScan.header = scan->header;
    filteredScan.angle_min = scan->angle_min;
    filteredScan.angle_max = scan->angle_max;
    filteredScan.angle_increment = scan->angle_increment;
    filteredScan.time_increment = scan->time_increment;
    filteredScan.scan_time = scan->scan_time;
    filteredScan.range_min = scan->range_min;
    filteredScan.range_max = scan->range_max;
    filteredScan.ranges = filteredranges;
    filteredScan.intensities = scan->intensities;
    // 
    filtered_publisher.publish(filteredScan);
    for (int i = 0; i < filteredranges.size(); ++i)
    {
        ROS_INFO("Range[%d]: %f", i, filteredranges[i]);
    }
    }

int main(int argc, char **argv)
{
    ros::init(argc,argv, "lidar_scan_reader");
    ros::NodeHandle n; 
    filtered_publisher = n.advertise<sensor_msgs::LaserScan>("/filtered_scan",10);

    ros::Subscriber lidar = n.subscribe("/scan",10,lidarCallback);
    ros::spin();
    return 0;
}