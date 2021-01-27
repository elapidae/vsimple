#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vposix.pri

#========================================================================================
isEmpty(qi_vposix) {
    qi_vposix = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vposix appended ===")

    isEmpty(VSIMPLE_DIR): error("vposix: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )

    LIBS *= -pthread

    include( $$VSIMPLE_DIR/qmake/vcat.pri )
    include( $$VSIMPLE_DIR/qmake/vlog.pri )
    include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )
    include( $$VSIMPLE_DIR/qmake/vsignal.pri )
    include( $$VSIMPLE_DIR/qmake/vbyte_buffer.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vposix

    #------------------------------------------------------------------------------------

    OTHER_FILES += $$VSIMPLE_DIR/vposix/vposix.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vposix/README
    OTHER_FILES += $$VSIMPLE_DIR/vposix/impl_vposix/_z_wrap_fish.h
    OTHER_FILES += $$VSIMPLE_DIR/vposix/impl_vposix/_z_wrap_fish.cpp

    #------------------------------------------------------------------------------------

    HEADERS     += $$VSIMPLE_DIR/vposix/vinvoke_iface.h
    SOURCES     += $$VSIMPLE_DIR/vposix/vinvoke_iface.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/vapplication.h
    SOURCES     += $$VSIMPLE_DIR/vposix/vapplication.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/vthread.h
    SOURCES     += $$VSIMPLE_DIR/vposix/vthread.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/vthread_context.h
    SOURCES     += $$VSIMPLE_DIR/vposix/vthread_context.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/vprocess.h
    SOURCES     += $$VSIMPLE_DIR/vposix/vprocess.cpp

    #------------------------------------------------------------------------------------

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/linux_call.h

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/pipe.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/pipe.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/poll_context.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/poll_context.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/safe_fd.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/safe_fd.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_arpa_inet.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_arpa_inet.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_errno.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_errno.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_fcntl.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_fcntl.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_linux_can.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_linux_can.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_net_if.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_net_if.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_stdio.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_stdio.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_signal.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_signal.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_epoll.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_epoll.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_eventfd.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_eventfd.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_file.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_file.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_ioctl.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_ioctl.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_socket.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_socket.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_stat.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_stat.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_timerfd.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_sys_timerfd.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_termios.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_termios.cpp

    HEADERS     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_unistd.h
    SOURCES     += $$VSIMPLE_DIR/vposix/impl_vposix/wrap_unistd.cpp

    #------------------------------------------------------------------------------------
}
# vposix.pri
#========================================================================================
