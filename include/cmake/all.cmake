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
