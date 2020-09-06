#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vsignal.pri

#========================================================================================
isEmpty(qi_vsignal) {
    qi_vsignal = 1;
    isEmpty(qi_not_print_pri_messages): message("=== vsignal appended ===")

    isEmpty(VLIBS_DIR): error("Need VLIBS_DIR correct path.")

    INCLUDEPATH += $$VLIBS_DIR/vsignal
   
    HEADERS     += $$VLIBS_DIR/vsignal/vsignal.h 
}
# vsignal.pri
#========================================================================================
