# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/QuickVtkExample_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/QuickVtkExample_autogen.dir/ParseCache.txt"
  "QuickVtkExample_autogen"
  )
endif()
