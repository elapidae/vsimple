#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vcan_socket.pri

#========================================================================================
isEmpty(qi_vcan_socket) {
    qi_vcan_socket = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vcan_socket appended ===")

    isEmpty(VSIMPLE_DIR): error("vcan_socket: Need VSIMPLE_DIR correct path.")

    #include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )
    include( $$VSIMPLE_DIR/qmake/vposix.pri  )
    include( $$VSIMPLE_DIR/qmake/vsignal.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vcan_socket

    HEADERS     += $$VSIMPLE_DIR/vcan_socket/vcan_socket.h
    SOURCES     += $$VSIMPLE_DIR/vcan_socket/vcan_socket.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vcan_socket/vcan_socket.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vcan_socket/can.txt
    OTHER_FILES += $$VSIMPLE_DIR/vcan_socket/README
}
# vcan_socket.pri
#========================================================================================

