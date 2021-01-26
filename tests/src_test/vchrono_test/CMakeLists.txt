cmake_minimum_required(VERSION 2.8)

set( VSIMPLE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../.." )

project( test_vchrono )

include( "${VSIMPLE_DIR}/cmake/gtest.cmake" )
include( "${VSIMPLE_DIR}/cmake/vchrono.cmake" )

add_executable( ${PROJECT_NAME} ${V_HEADERS} ${V_SOURCES} "main.cpp" )

target_link_libraries( ${PROJECT_NAME} ${V_LIBRARIES} )
