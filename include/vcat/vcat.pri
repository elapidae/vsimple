#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vcat.pri

#========================================================================================
isEmpty(qi_vcat) {
    qi_vcat = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vcat appended ===")

    isEmpty(VSIMPLE_DIR): error("vcat: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/v_has_qt.pri )
    include( $$VSIMPLE_DIR/qmake/vcompiler_traits.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vcat

    HEADERS     += $$VSIMPLE_DIR/vcat/vcat.h
    SOURCES     += $$VSIMPLE_DIR/vcat/vcat.cpp

    HEADERS     += $$VSIMPLE_DIR/vcat/impl_vcat/vcat_iface.h
    HEADERS     += $$VSIMPLE_DIR/vcat/impl_vcat/tuple.h
    HEADERS     += $$VSIMPLE_DIR/vcat/impl_vcat/containers.h

    HEADERS     += $$VSIMPLE_DIR/vcat/impl_vcat/vcat_qt_deploy.h
    SOURCES     += $$VSIMPLE_DIR/vcat/impl_vcat/vcat_qt_deploy.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vcat/README
    OTHER_FILES += $$VSIMPLE_DIR/vcat/vcat.cmake
}
# vcat.pri
#========================================================================================

