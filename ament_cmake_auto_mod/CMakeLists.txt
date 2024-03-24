cmake_minimum_required(VERSION 3.12)

project(ament_cmake_auto_mod NONE)

set(ignoreMe "${CMAKE_C_COMPILER_LAUNCHER}${CMAKE_CXX_COMPILER_LAUNCHER}${CMAKE_CXX_FLAGS}${CMAKE_C_FLAGS}")

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_gtest REQUIRED)

ament_package(
  CONFIG_EXTRAS "ament_cmake_auto_mod-extras.cmake"
)

install(
  DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME}
)
