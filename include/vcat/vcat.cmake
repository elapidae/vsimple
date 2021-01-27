#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################
# vcat.cmake

#========================================================================================
if ( NOT  VCAT_INCLUDED )
    set ( VCAT_INCLUDED TRUE )

    message( "=== include vcat... ===" )

    include( "${VSIMPLE_DIR}/cmake/c++11.cmake" )
    include( "${VSIMPLE_DIR}/cmake/vcompiler_traits.cmake" )

    include_directories( "${VSIMPLE_DIR}/vcat/" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vcat/vcat.h"   )
    set( V_SOURCES ${V_SOURCES} "${VSIMPLE_DIR}/vcat/vcat.cpp" )

    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vcat/impl_vcat/vcat_iface.h" )
    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vcat/impl_vcat/tuple.h"      )
    set( V_HEADERS ${V_HEADERS} "${VSIMPLE_DIR}/vcat/impl_vcat/containers.h" )

    message( "=== vcat included ===" )
endif()
# vcat.cmake
#========================================================================================
