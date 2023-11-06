macro(tutrc_ament_register_node target)
  cmake_parse_arguments(ARG
    ""
    "PLUGIN;EXECUTABLE;HEADER"
    ""
    ${ARGN}
  )

  if(NOT ARG_HEADER)
    set(ARG_HEADER "${ARG_EXECUTABLE}/${ARG_EXECUTABLE}_component.hpp")
  endif()

  configure_file(
    "${tutrc_ament_DIR}/rclcpp_component_template.cpp.in"
    "${ARG_EXECUTABLE}_component_generated.cpp"
    @ONLY
  )

  file(
    GLOB_RECURSE
    cxx_sources
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "src/*.c"
    "src/*.cc"
    "src/*.cpp"
    "src/*.cxx"
  )

  if(ARG_UNPARSED_ARGUMENTS)
    tutrc_ament_add_library("${target}" SHARED
      "${ARG_EXECUTABLE}_component_generated.cpp"
      ${ARG_UNPARSED_ARGUMENTS}
    )
  else()
    tutrc_ament_add_library("${target}" SHARED
      "${ARG_EXECUTABLE}_component_generated.cpp"
      ${cxx_sources}
    )
  endif()

  rclcpp_components_register_node("${target}"
    PLUGIN      "${ARG_PLUGIN}"
    EXECUTABLE  "${ARG_EXECUTABLE}"
  )
endmacro()
