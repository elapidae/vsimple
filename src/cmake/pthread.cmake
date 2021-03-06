#########################################################################################
##  GNU Lesser General Public License Usage
##  This file may be used under the terms of the GNU Lesser General Public License
##  version 3 as published by the Free Software Foundation and appearing in the file
##  LICENSE.LGPL3 included in the packaging of this file. Please review the following
##  information to ensure the GNU Lesser General Public License version 3 requirements
##  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#########################################################################################


#========================================================================================
if ( NOT  PTHREAD_LIBRARY_INCLUDED )
    set ( PTHREAD_LIBRARY_INCLUDED TRUE )

    message( "=== from pthread.cmake -- V_LIBRARIES += -lpthread ===" )

    set( V_LIBRARIES ${V_LIBRARIES} -lpthread )

endif() # PTHREAD_LIBRARY_INCLUDED
#========================================================================================


