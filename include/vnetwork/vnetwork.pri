#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vnetwork.pri

#========================================================================================
isEmpty(qi_vnetwork) {
    qi_vnetwork = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vnetwork appended ===")

    isEmpty(VSIMPLE_DIR): error("vnetwork: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vlog.pri    )
    include( $$VSIMPLE_DIR/qmake/vposix.pri  )
    include( $$VSIMPLE_DIR/qmake/vsignal.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vnetwork

    HEADERS     += $$VSIMPLE_DIR/vnetwork/vnetwork.h
    SOURCES     += $$VSIMPLE_DIR/vnetwork/vnetwork.cpp

    HEADERS     += $$VSIMPLE_DIR/vnetwork/vsocket_address.h
    SOURCES     += $$VSIMPLE_DIR/vnetwork/vsocket_address.cpp

    HEADERS     += $$VSIMPLE_DIR/vnetwork/vtcp_socket.h
    SOURCES     += $$VSIMPLE_DIR/vnetwork/vtcp_socket.cpp

    HEADERS     += $$VSIMPLE_DIR/vnetwork/vtcp_server.h
    SOURCES     += $$VSIMPLE_DIR/vnetwork/vtcp_server.cpp

    HEADERS     += $$VSIMPLE_DIR/vnetwork/vudp_socket.h
    SOURCES     += $$VSIMPLE_DIR/vnetwork/vudp_socket.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vnetwork/vnetwork.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vnetwork/README
}
# vnetwork.pri
#========================================================================================
