#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vserial_port.pri

#========================================================================================
isEmpty(qi_vserial_port) {
    qi_vserial_port = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vserial_port appended ===")

    isEmpty(VSIMPLE_DIR): error("vserial_port: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vlog.pri    )
    include( $$VSIMPLE_DIR/qmake/vposix.pri  )
    include( $$VSIMPLE_DIR/qmake/vsignal.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vserial_port

    HEADERS     += $$VSIMPLE_DIR/vserial_port/vserial_port.h
    SOURCES     += $$VSIMPLE_DIR/vserial_port/vserial_port.cpp

    HEADERS     += $$VSIMPLE_DIR/vserial_port/vterminal_options.h
    SOURCES     += $$VSIMPLE_DIR/vserial_port/vterminal_options.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vserial_port/vserial_port.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vserial_port/README
}
# vserial_port.pri
#========================================================================================
