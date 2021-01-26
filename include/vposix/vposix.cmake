#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vposix.cmake

#========================================================================================
if ( NOT  VPOSIX_INCLUDED )
    set ( VPOSIX_INCLUDED TRUE )

    #------------------------------------------------------------------------------------

    message( "=== about include vposix... ===" )

    include( "${VSIMPLE_DIR}/cmake/vcat.cmake"  )
    include( "${VSIMPLE_DIR}/cmake/vlog.cmake"  )
    include( "${VSIMPLE_DIR}/cmake/vcompiler_traits.cmake" )
    include( "${VSIMPLE_DIR}/cmake/vsignal.cmake" )
    include( "${VSIMPLE_DIR}/cmake/vbyte_buffer.cmake" )
    include( "${VSIMPLE_DIR}/cmake/pthread.cmake" )

    include_directories( "${VSIMPLE_DIR}/vposix/" )

    #------------------------------------------------------------------------------------

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vinvoke_iface.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vinvoke_iface.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vapplication.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vapplication.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vthread.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vthread.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vthread_context.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vthread_context.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vprocess.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vprocess.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/vfile.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/vfile.cpp" )

    #------------------------------------------------------------------------------------

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/linux_call.h"   )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/pipe.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/pipe.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/poll_context.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/poll_context.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/safe_fd.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/safe_fd.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_arpa_inet.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_arpa_inet.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_errno.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_errno.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_fcntl.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_fcntl.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_linux_can.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_linux_can.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_net_if.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_net_if.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_signal.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_signal.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_stdio.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_stdio.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_epoll.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_epoll.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_eventfd.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_eventfd.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_file.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_file.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_ioctl.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_ioctl.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_socket.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_socket.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_stat.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_stat.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_timerfd.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_sys_timerfd.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_termios.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_termios.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_unistd.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vposix/impl_vposix/wrap_unistd.cpp" )

    #------------------------------------------------------------------------------------

    message( "=== vlog included ===" )
endif()
# vposix.cmake
#========================================================================================
