macro(tutrc_ament_add_executable target)
  cmake_parse_arguments(ARG
    ""
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

  ament_auto_add_executable("${target}" ${cxx_sources} ${ARG_UNPARSED_ARGUMENTS})
endmacro()
