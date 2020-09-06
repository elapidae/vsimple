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

    isEmpty(VLIBS_DIR): error("vposix: Need VLIBS_DIR correct path.")

    include( $$VLIBS_DIR/qmake/vcompiler_traits.pri )

    LIBS *= -pthread

    include( $$VLIBS_DIR/qmake/vcat.pri )
    include( $$VLIBS_DIR/qmake/vlog.pri )
    include( $$VLIBS_DIR/qmake/vcompiler_traits.pri )
    include( $$VLIBS_DIR/qmake/vsignal.pri )
    include( $$VLIBS_DIR/qmake/vbyte_buffer.pri )

    INCLUDEPATH += $$VLIBS_DIR/vposix

    #------------------------------------------------------------------------------------

    OTHER_FILES += $$VLIBS_DIR/vposix/vposix.cmake
    OTHER_FILES += $$VLIBS_DIR/vposix/README
    OTHER_FILES += $$VLIBS_DIR/vposix/impl_vposix/_z_wrap_fish.h
    OTHER_FILES += $$VLIBS_DIR/vposix/impl_vposix/_z_wrap_fish.cpp

    #------------------------------------------------------------------------------------

    HEADERS     += $$VLIBS_DIR/vposix/vinvoke_iface.h
    SOURCES     += $$VLIBS_DIR/vposix/vinvoke_iface.cpp

    HEADERS     += $$VLIBS_DIR/vposix/vapplication.h
    SOURCES     += $$VLIBS_DIR/vposix/vapplication.cpp

    HEADERS     += $$VLIBS_DIR/vposix/vthread.h
    SOURCES     += $$VLIBS_DIR/vposix/vthread.cpp

    HEADERS     += $$VLIBS_DIR/vposix/vthread_context.h
    SOURCES     += $$VLIBS_DIR/vposix/vthread_context.cpp

    HEADERS     += $$VLIBS_DIR/vposix/vprocess.h
    SOURCES     += $$VLIBS_DIR/vposix/vprocess.cpp

    #------------------------------------------------------------------------------------

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/linux_call.h

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/pipe.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/pipe.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/poll_context.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/poll_context.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/safe_fd.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/safe_fd.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_arpa_inet.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_arpa_inet.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_errno.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_errno.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_fcntl.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_fcntl.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_linux_can.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_linux_can.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_net_if.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_net_if.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_stdio.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_stdio.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_signal.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_signal.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_epoll.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_epoll.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_eventfd.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_eventfd.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_file.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_file.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_ioctl.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_ioctl.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_socket.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_socket.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_stat.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_stat.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_timerfd.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_sys_timerfd.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_termios.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_termios.cpp

    HEADERS     += $$VLIBS_DIR/vposix/impl_vposix/wrap_unistd.h
    SOURCES     += $$VLIBS_DIR/vposix/impl_vposix/wrap_unistd.cpp

    #------------------------------------------------------------------------------------
}
# vposix.pri
#========================================================================================
