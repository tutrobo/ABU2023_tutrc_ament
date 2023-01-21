cmake_minimum_required(VERSION 3.8)
project(tutrc_ament NONE)

find_package(ament_cmake REQUIRED)

ament_package(
  CONFIG_EXTRAS "tutrc_ament-extras.cmake"
)

install(
  DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME}
)
