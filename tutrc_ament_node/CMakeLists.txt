cmake_minimum_required(VERSION 3.8)
project(tutrc_ament_node NONE)

set(ignoreMe "${CMAKE_C_COMPILER_LAUNCHER}${CMAKE_CXX_COMPILER_LAUNCHER}")

find_package(ament_cmake REQUIRED)

ament_export_dependencies(rclcpp_components)

ament_package(
  CONFIG_EXTRAS "tutrc_ament_node-extras.cmake"
)

install(
  DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME}
)
