#========================================================================================

cmake_minimum_required( VERSION 3.10 )

#========================================================================================

project( vsimple )

#========================================================================================

set( CMAKE_BUILD_TYPE "Release" )

#========================================================================================

set( CMAKE_CXX_STANDARD 11 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

#========================================================================================

include_directories( ${CMAKE_SOURCE_DIR} )

set( VSIMPLE_DIR ${CMAKE_CURRENT_LIST_DIR}/include )

#========================================================================================

include_directories( ${VSIMPLE_DIR}/ )
include_directories( ${VSIMPLE_DIR}/cmake )

#========================================================================================

include( ${VSIMPLE_DIR}/cmake/c++11.cmake )
include( ${VSIMPLE_DIR}/cmake/pthread.cmake )
include( ${VSIMPLE_DIR}/cmake/vbyte_buffer.cmake )
include( ${VSIMPLE_DIR}/cmake/vcan_socket.cmake )
include( ${VSIMPLE_DIR}/cmake/vcat.cmake )
include( ${VSIMPLE_DIR}/cmake/vchrono.cmake )
include( ${VSIMPLE_DIR}/cmake/vcmdline_parser.cmake )
include( ${VSIMPLE_DIR}/cmake/vcompiler_traits.cmake )
include( ${VSIMPLE_DIR}/cmake/vgit.cmake )
include( ${VSIMPLE_DIR}/cmake/vgit_post.cmake )
include( ${VSIMPLE_DIR}/cmake/vlog.cmake )
include( ${VSIMPLE_DIR}/cmake/vnetwork.cmake )
include( ${VSIMPLE_DIR}/cmake/vposix.cmake )
include( ${VSIMPLE_DIR}/cmake/vprofile.cmake )
include( ${VSIMPLE_DIR}/cmake/vserial_port.cmake )
include( ${VSIMPLE_DIR}/cmake/vsettings.cmake )
include( ${VSIMPLE_DIR}/cmake/vsignal.cmake )
include( ${VSIMPLE_DIR}/cmake/vtimer.cmake )

#========================================================================================

add_library( ${PROJECT_NAME} SHARED ${V_HEADERS} ${V_SOURCES} )

target_link_libraries( ${PROJECT_NAME} ${V_LIBRARIES} )

#========================================================================================

unset ( QT_QMAKE_EXECUTABLE )

#========================================================================================
