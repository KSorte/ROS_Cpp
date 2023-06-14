#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <cmath>

// TODO: Implement a simple obstacle detection algorithm
// *  Take in incoming LaserScan messages
// *  Find the point of each obstacle closest to the sensor (smallest range)
// *  Publish these points as a set of Arrow Markers in a MarkerArray message
// A basic template for this project is provided below

int threshold;  /// GLOABL THRESHOLD
int find_minimum_index(std::vector<float> ranges, int start, int end)      // To find the index with minimum range in a given obstacle. 
{
  int minimum_index = 0;
  for (int i = start + 1;i<=end; i++)
  {
    if (ranges[i] < ranges[minimum_index]) {minimum_index = i;}
  }
  return minimum_index;
}

/////////////////////////////////////////////////////////////////////
class ObstacleDetector
{
public:
  /**
   * @brief Construct a new ObstacleDetector object
   * @param nh The ROS NodeHandle
  */
  ObstacleDetector(ros::NodeHandle nh);
  ~ObstacleDetector();

private:
  // ROS NodeHandle
  ros::NodeHandle nh_;

  // LaserScan subscriber
  ros::Subscriber sub_laserscan_;

  // MarkerArray publisher
  ros::Publisher pub_markers_;

  // Threshold over which to ignore laserscan readings, considered not part of an obstacle
  float threshold_;

  /**
   * @brief Callback for incoming LaserScan messages
   * @param msg ConstPtr to incoming LaserScan message
  */
  void callback_scan(const sensor_msgs::LaserScan::ConstPtr & msg);

  /**
   * @brief Helper function that creates a new Marker message
   * @param x x-coordinate of the second point of the arrow
   * @param y y-coordinate of the second point of the arrow
   * @param id ID of the marker
   * @return Pre-formatted visualization_msgs::Marker message
  */
  visualization_msgs::Marker create_marker(float x, float y, int id);
};


ObstacleDetector::ObstacleDetector(ros::NodeHandle nh)
: nh_(nh)
{
  sub_laserscan_ = nh_.subscribe("/scan", 10, &ObstacleDetector::callback_scan, this);
  pub_markers_ = nh_.advertise<visualization_msgs::MarkerArray>("/obstacles", 10);

  ros::param::get("~threshold",threshold_);   /// Global variable edited. 

  ROS_INFO("ObstacleDetector initialized!");
}

ObstacleDetector::~ObstacleDetector() {}

visualization_msgs::Marker ObstacleDetector::create_marker(float x, float y, int id)
{
  auto marker = visualization_msgs::Marker();
  marker.type = visualization_msgs::Marker::ARROW;
  marker.header.frame_id = "laser_frame";
  marker.header.stamp = ros::Time::now();

  // Arrow consists of two points - the first point will be the origin of the laser scan, the
  // second point will be the closest point on the obstacle
  marker.points = {geometry_msgs::Point(), geometry_msgs::Point()};
  marker.points[1].x = x;
  marker.points[1].y = y;
  marker.points[1].z = 0.0;

  // Initialize quaternion
  marker.pose.orientation.w = 1.0;

  // Set the color and scale of the marker
  marker.color.r = 1.0;
  marker.color.a = 1.0;
  marker.scale.x = 0.1;
  marker.scale.y = 0.1;
  marker.scale.z = 0.1;

  // Set the marker ID
  marker.id = id;

  return marker;
}

void ObstacleDetector::callback_scan(const sensor_msgs::LaserScan::ConstPtr & msg)
{
  ROS_INFO("Got a new LaserScan message with %ld points", msg->ranges.size());

  auto markers = visualization_msgs::MarkerArray();

  // TODO: Implement obstacle detection algorithm, finding the closest point of each obstacle
  // For now, this will just publish a zero-length marker for each scan reading

  auto ranges = msg->ranges;  // Storing the ranges in a variable of appropriate data type. 
  std::vector<std::vector<int>> obstacle_indices;    // A vector that stores the start and end indices of the obstacles if their range falls below the threshold. 
  int flag = 0;   // This flag will tell me whether I am iterating through an obstacle or no in the ranges array. 
  int minimum_index;    // This index will store the index of the element with least range. 
  float angleofminimum;
  // x y coordinates of the point
  float x;
  float y;

  std::vector<int> array;
  array.resize(2);
  for (int i = 0; i < msg->ranges.size(); i++) {
    if (ranges[i]<threshold_ && flag == 0)
    {
      array[0] = i; // Storing the start of the obstacle. 
      flag = 1;  // toggling flag.
    }
    else if (ranges[i]<threshold_ && flag == 1)  {continue;}    // if the range < threshold, and flag is 1, do nothing.
    else if (ranges[i]>threshold_ && flag == 1)
      {flag = 0;
      array[1] = i-1; // Storing the closing index of the obstacle inside the array. 
      obstacle_indices.push_back(array);   // Adding the array to the vector. 
      minimum_index = find_minimum_index(ranges,array[0],array[1]);
      angleofminimum = msg->angle_increment*minimum_index;
      x = ranges[minimum_index]*std::cos(angleofminimum);
      y = ranges[minimum_index]*std::sin(angleofminimum);
    }
    auto marker = create_marker(x, y, i);
    markers.markers.push_back(marker);
  }

  // Publish the completed MarkerArray
  pub_markers_.publish(markers);
}


int main(int argc, char ** argv)
{
  ros::init(argc, argv, "detector_node");
  ros::NodeHandle nh;

  ObstacleDetector detector(nh);

  ros::spin();

  return 0;
}
   