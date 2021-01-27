#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vchrono.cmake

#========================================================================================
if ( NOT  VCHRONO_INCLUDED )
    set ( VCHRONO_INCLUDED TRUE )

    message( "=== about include vchrono... ===" )

    include( "${VSIMPLE_DIR}/cmake/vcompiler_traits.cmake" )

    include_directories( "${VSIMPLE_DIR}/vchrono/" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vchrono/vtime_point.h" )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vchrono/impl_vchrono/vtime_point.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vchrono/vtime_meter.h" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vchrono/impl_vchrono/time_point_base.h" )
    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vchrono/impl_vchrono/time_meter.h" )

    set( V_HEADERS ${V_HEADERS}
                  "${VSIMPLE_DIR}/vchrono/impl_vchrono/human_readable_time.h" )
    set( V_SOURCES ${V_SOURCES}
                  "${VSIMPLE_DIR}/vchrono/impl_vchrono/human_readable_time.cpp" )

    message( "=== vchrono included ===" )

endif()
# vchrono.cmake
#========================================================================================
