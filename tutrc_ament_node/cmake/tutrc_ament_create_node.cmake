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

  if(ARG_UNPARSED_ARGUMENTS)
    set(cxx_sources ${ARG_UNPARSED_ARGUMENTS})
  else()
    file(
      GLOB_RECURSE
      cxx_sources
      RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
      "src/*.c"
      "src/*.cc"
      "src/*.cpp"
      "src/*.cxx"
    )
  endif()

  tutrc_ament_add_library("${target}"
    "${ARG_NODE_NAME}_component_generated.cpp"
    ${cxx_sources}
  )
  ament_target_dependencies("${target}" rclcpp_components)

  rclcpp_components_register_node("${target}"
    PLUGIN      "${ARG_NODE_PLUGIN}"
    EXECUTABLE  "${ARG_NODE_NAME}"
  )
endmacro()
