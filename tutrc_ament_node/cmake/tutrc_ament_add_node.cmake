macro(tutrc_ament_add_node target)
  cmake_parse_arguments(ARG
    ""
    "PLUGIN;EXECUTABLE"
    ""
    ${ARGN}
  )

  if(ARG_UNPARSED_ARGUMENTS)
    ament_auto_add_library("${target}" SHARED
      ${ARG_UNPARSED_ARGUMENTS}
    )
  else()
    ament_auto_add_library("${target}" SHARED
      DIRECTORY src
    )
  endif()

  rclcpp_components_register_node("${target}"
    PLUGIN      "${ARG_PLUGIN}"
    EXECUTABLE  "${ARG_EXECUTABLE}"
  )
endmacro()