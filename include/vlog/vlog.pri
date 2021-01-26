#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vlog.pri

#========================================================================================
isEmpty(qi_vlog) {
    qi_vlog = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vlog appended ===")

    isEmpty(VSIMPLE_DIR): error("vlog: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vcat.pri    )
    include( $$VSIMPLE_DIR/qmake/vchrono.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vlog

    #------------------------------------------------------------------------------------
    #   CORE
    HEADERS     += $$VSIMPLE_DIR/vlog/vlog.h
    SOURCES     += $$VSIMPLE_DIR/vlog/vlog.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/position_fix.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/position_fix.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/entry.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/entry.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/logger.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/logger.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/error.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/error.cpp

    #------------------------------------------------------------------------------------
    #   PRE POSIX FILE LOG
    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/pre_posix.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/pre_posix.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/log_file.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/log_file.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/rotate_log_file.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/rotate_log_file.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/shared_log.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/shared_log.cpp

    HEADERS     += $$VSIMPLE_DIR/vlog/impl_vlog/leveled_log.h
    SOURCES     += $$VSIMPLE_DIR/vlog/impl_vlog/leveled_log.cpp

    #------------------------------------------------------------------------------------
    OTHER_FILES += $$VSIMPLE_DIR/vlog/vlog.cmake
    OTHER_FILES += $$VSIMPLE_DIR/vlog/README
    OTHER_FILES += $$VSIMPLE_DIR/vlog/readme.md
}
# vlog.pri
#========================================================================================

