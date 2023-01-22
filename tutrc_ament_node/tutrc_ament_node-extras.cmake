find_package(tutrc_ament QUIET REQUIRED)
find_package(rclcpp_components QUIET REQUIRED)

include("${tutrc_ament_node_DIR}/tutrc_ament_create_node.cmake")
