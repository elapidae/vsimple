#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vchrono.pri

#========================================================================================
isEmpty(qi_vchrono) {
    qi_vchrono = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vchrono appended ===")

    isEmpty(VSIMPLE_DIR): error("vchrono: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vchrono

    HEADERS     += $$VSIMPLE_DIR/vchrono/VTimePoint
    HEADERS     += $$VSIMPLE_DIR/vchrono/VTimeMeter

    HEADERS     += $$VSIMPLE_DIR/vchrono/vtime_point.h
    SOURCES     += $$VSIMPLE_DIR/vchrono/impl_vchrono/vtime_point.cpp

    HEADERS     += $$VSIMPLE_DIR/vchrono/vtime_meter.h

    HEADERS     += $$VSIMPLE_DIR/vchrono/impl_vchrono/time_meter.h
    HEADERS     += $$VSIMPLE_DIR/vchrono/impl_vchrono/time_point_base.h

    HEADERS     += $$VSIMPLE_DIR/vchrono/impl_vchrono/human_readable_time.h
    SOURCES     += $$VSIMPLE_DIR/vchrono/impl_vchrono/human_readable_time.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vchrono/vchrono.cmake
}
# vchrono.pri
#========================================================================================
