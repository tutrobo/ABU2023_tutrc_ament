macro(tutrc_ament_add_library target)
  cmake_parse_arguments(ARG
    "INTERFACE"
    "DIRECTORY"
    ""
    ${ARGN}
  )

  if(NOT ARG_DIRECTORY)
    set(ARG_DIRECTORY src)
  endif()
  file(
    GLOB_RECURSE
    cxx_sources
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${ARG_DIRECTORY}/*.c"
    "${ARG_DIRECTORY}/*.cc"
    "${ARG_DIRECTORY}/*.cpp"
    "${ARG_DIRECTORY}/*.cxx"
  )

  if(ARG_INTERFACE)
    ament_auto_add_library("${target}" INTERFACE)
  else()
    ament_auto_add_library("${target}" SHARED ${cxx_sources} ${ARG_UNPARSED_ARGUMENTS})
  endif()
endmacro()
