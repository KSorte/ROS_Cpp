cmake_minimum_required(VERSION 2.8.3)
project(obstacle_detection)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  std_msgs
  visualization_msgs
)

catkin_package(
  CATKIN_DEPENDS
  roscpp
  sensor_msgs
  visualization_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(detector_node src/detector_node.cpp)
target_link_libraries(detector_node ${catkin_LIBRARIES})
add_dependencies(detector_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

install(
  TARGETS detector_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
