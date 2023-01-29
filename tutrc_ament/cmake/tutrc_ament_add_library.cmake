macro(tutrc_ament_add_library target)
  cmake_parse_arguments(ARG
    "INTERFACE"
    ""
    ""
    ${ARGN}
  )

  if(ARG_UNPARSED_ARGUMENTS)
    ament_auto_add_library("${target}" ${ARG_UNPARSED_ARGUMENTS})
  else()
    ament_auto_add_library("${target}" SHARED DIRECTORY src)
  endif()
endmacro()
