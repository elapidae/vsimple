#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vsettings.pri

#========================================================================================
isEmpty(qi_vsettings) {
    qi_vsettings = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vsettings appended ===")

    isEmpty(VSIMPLE_DIR): error("vsettings: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vlog.pri         )
    include( $$VSIMPLE_DIR/qmake/vbyte_buffer.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vsettings

    HEADERS     += $$VSIMPLE_DIR/vsettings/vsettings.h
    SOURCES     += $$VSIMPLE_DIR/vsettings/vsettings.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vsettings/vsettings.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vsettings/README
}
# vsettings.pri
#========================================================================================
