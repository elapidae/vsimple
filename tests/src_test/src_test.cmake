#========================================================================================

include_directories( ${CMAKE_CURRENT_LIST_DIR} )

#========================================================================================

set( VSIMPLE_DIR ${CMAKE_CURRENT_LIST_DIR}/../../include )

include( ${VSIMPLE_DIR}/cmake/all.cmake )

#========================================================================================

include( ${CMAKE_CURRENT_LIST_DIR}/vbyte_buffer_test/vbyte_buffer_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vcan_socket_test/vcan_socket_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vcat_test/vcat_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vchrono_test/vchrono_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vcmdline_parser_test/vcmdline_parser_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vcompiler_traits_test/vcompiler_traits_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vgit_test/vgit_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vlog_test/vlog_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vnetwork_test/vnetwork_test.cmake )
#include( ${CMAKE_CURRENT_LIST_DIR}/vposix_test/vposix_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vprofile_test/vprofile_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vserial_port_test/vserial_port_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vsettings_test/vsettings_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vsignal_test/vsignal_test.cmake )
include( ${CMAKE_CURRENT_LIST_DIR}/vtimer_test/vtimer_test.cmake )

#========================================================================================

set( SRC_TEST
    ${V_HEADERS}
    ${V_SOURCES}
    ${VBYTE_BUFFER_TEST}
    ${VCAN_SOCKET_TEST}
    ${VCAT_TEST}
    ${VCHRONO_TEST}
    ${VCMDLINE_PARSER_TEST}
    ${VCOMPILER_TRAITS_TEST}
    ${VGIT_TEST}
    ${VLOG_TEST}
    ${VNETWORK_TEST}
    ${VPOSIX_TEST}
    ${VPROFILE_TEST}
    ${VSERIAL_PORT_TEST}
    ${VSETTINGS_TEST}
    ${VSIGNAL_TEST}
    ${VTIMER_TEST}
    )

#========================================================================================
