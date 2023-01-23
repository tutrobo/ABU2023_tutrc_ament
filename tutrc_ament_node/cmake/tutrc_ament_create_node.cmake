macro(tutrc_ament_create_node target)
  cmake_parse_arguments(ARG
    ""
    "NODE_NAME;NODE_PLUGIN"
    ""
    ${ARGN}
  )

  configure_file(
    "${tutrc_ament_node_DIR}/rclcpp_component_template.cpp.in"
    "${ARG_NODE_NAME}_component_generated.cpp"
    @ONLY
  )

  tutrc_ament_add_library("${target}"
    ${ARG_UNPARSED_ARGUMENTS}
    "${ARG_NODE_NAME}_component_generated.cpp"
  )
  ament_target_dependencies("${target}" rclcpp_components)

  rclcpp_components_register_node("${target}"
    PLUGIN      "${ARG_NODE_PLUGIN}"
    EXECUTABLE  "${ARG_NODE_NAME}"
  )
endmacro()
