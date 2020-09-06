#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################


#========================================================================================
if ( NOT  CPP_11_STANDARD_INCLUDED )
    set ( CPP_11_STANDARD_INCLUDED TRUE )

    message( "=== from c++11.cmake -- add_definitions(-std=c++11) ===" )

    add_definitions( -std=c++11 )

endif() #CPP_11_STANDARD_INCLUDED
#========================================================================================


