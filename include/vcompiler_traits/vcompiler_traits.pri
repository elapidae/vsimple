#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vcompiler_traits.pri

#========================================================================================
isEmpty(qi_vcompiler_traits) {
    qi_vcompiler_traits = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vcompiler_traits appended ===")

    isEmpty(VSIMPLE_DIR): error("vcompiler_traits: Need VSIMPLE_DIR correct path.")

    CONFIG *= c++11

    INCLUDEPATH *= $$VSIMPLE_DIR/vcompiler_traits

    HEADERS     += $$VSIMPLE_DIR/vcompiler_traits/vcompiler_traits.h
    HEADERS     += $$VSIMPLE_DIR/vcompiler_traits/vvoid_type.h


    OTHER_FILES += $$VSIMPLE_DIR/vcompiler_traits/README
}
# vcompiler_traits.pri
#========================================================================================
