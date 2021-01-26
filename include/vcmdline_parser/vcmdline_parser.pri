#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vcmdline_parser.pri

#========================================================================================
isEmpty(qi_vcmdline_parser) {
    qi_vcmdline_parser = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vcmdline_parser appended ===")

    isEmpty(VSIMPLE_DIR): error("vcmdline_parser: Need VSIMPLE_DIR correct path.")

    include( $$VSIMPLE_DIR/qmake/vcat.pri )

    INCLUDEPATH += $$VSIMPLE_DIR/vcmdline_parser

    HEADERS     += $$VSIMPLE_DIR/vcmdline_parser/vcmdline_parser.h
    SOURCES     += $$VSIMPLE_DIR/vcmdline_parser/vcmdline_parser.cpp

    OTHER_FILES += $$VSIMPLE_DIR/vcmdline_parser/README
    OTHER_FILES += $$VSIMPLE_DIR/vcmdline_parser/vcmdline_parser.cmake
}
# vcmdline_parser.pri
#========================================================================================

