cmake_minimum_required(VERSION 3.8)
project(tutrc_ament NONE)

set(ignoreMe "${CMAKE_C_COMPILER_LAUNCHER}${CMAKE_CXX_COMPILER_LAUNCHER}${CMAKE_CXX_FLAGS}${CMAKE_C_FLAGS}")

find_package(ament_cmake REQUIRED)

ament_package(
  CONFIG_EXTRAS "tutrc_ament-extras.cmake"
)

install(
  DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME}
)
