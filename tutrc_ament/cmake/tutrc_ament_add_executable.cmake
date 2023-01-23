macro(tutrc_ament_add_executable target)
  cmake_parse_arguments(ARG
    ""
    ""
    ""
    ${ARGN}
  )

  if(ARG_UNPARSED_ARGUMENTS)
    ament_auto_add_executable("${target}" ${ARG_UNPARSED_ARGUMENTS})
  else()
    ament_auto_add_executable("${target}" DIRECTORY src)
  endif()
endmacro()
