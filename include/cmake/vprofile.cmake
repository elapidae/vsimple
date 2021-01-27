#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vprofile.cmake

#========================================================================================
if ( NOT  VPROFILE_INCLUDED )
    set ( VPROFILE_INCLUDED TRUE )

    message( "=== include vprofile... ===" )

    add_definitions( -DV_NEED_PROFILE )

    #   If you'd like turn off profiling, use this directive
    #   after profile in your project:
    #remove_definitions( -DV_NEED_PROFILE )

    include_directories( "${VSIMPLE_DIR}/vprofile/" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vprofile/vprofile.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vprofile/vprofile.cpp" )

    message( "=== vprofile included ===" )
endif()
# vprofile.cmake
#========================================================================================
