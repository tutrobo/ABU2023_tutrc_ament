macro(tutrc_ament_add_library target)
  cmake_parse_arguments(ARG
    "INTERFACE"
    ""
    ""
    ${ARGN}
  )

  if(ARG_INTERFACE)
    ament_auto_add_library("${target}" INTERFACE)
  elseif(ARG_UNPARSED_ARGUMENTS)
    ament_auto_add_library("${target}" SHARED ${ARG_UNPARSED_ARGUMENTS})
  else()
    ament_auto_add_library("${target}" SHARED DIRECTORY src)
  endif()
endmacro()
