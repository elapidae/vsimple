#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vtimer.pri

#========================================================================================
isEmpty(qi_vtimer) {
    qi_vtimer = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vtimer appended ===")

    isEmpty(VSIMPLE_DIR): error("vtimer: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vposix.pri  )
    include( $$VSIMPLE_DIR/qmake/vsignal.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vtimer

    HEADERS     += $$VSIMPLE_DIR/vtimer/vtimer.h
    SOURCES     += $$VSIMPLE_DIR/vtimer/vtimer.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vtimer/vtimer.cmake
}
# vtimer.pri
#========================================================================================
