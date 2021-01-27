#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vtimer.cmake

#========================================================================================
if ( NOT  VTIMER_INCLUDED )
    set ( VTIMER_INCLUDED TRUE )

    message( "=== include vtimer... ===" )

    include( "${VSIMPLE_DIR}/cmake/c++11.cmake"   )
    include( "${VSIMPLE_DIR}/cmake/vposix.cmake"  )
    include( "${VSIMPLE_DIR}/cmake/vsignal.cmake" )

    include_directories( "${VSIMPLE_DIR}/vtimer/" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vtimer/vtimer.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vtimer/vtimer.cpp" )

    message( "=== vtimer included ===" )
endif()
# vtimer.cmake
#========================================================================================
