#========================================================================================
cmake_minimum_required(VERSION 2.8)

project( test_vcan_socket )

set( VSIMPLE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../.." )

include( "${VSIMPLE_DIR}/cmake/gtest.cmake" )
include( "${VSIMPLE_DIR}/cmake/vcan_socket.cmake" )
include( "${VSIMPLE_DIR}/cmake/vtimer.cmake" )

add_executable( ${PROJECT_NAME} ${V_HEADERS} ${V_SOURCES} "main.cpp" )

target_link_libraries( ${PROJECT_NAME} ${V_LIBRARIES} )

#========================================================================================
