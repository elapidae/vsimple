/****************************************************************************************
**
**  VSIMPLE codebase, NIIAS
**
**  GNU Lesser General Public License Usage
**  This file may be used under the terms of the GNU Lesser General Public License
**  version 3 as published by the Free Software Foundation and appearing in the file
**  LICENSE.LGPL3 included in the packaging of this file. Please review the following
**  information to ensure the GNU Lesser General Public License version 3 requirements
**  will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
****************************************************************************************/

#include "vserial_port_test.h"

#include "gtest/gtest.h"

#include "vterminal_options.h"
#include "vserial_port.h"
#include "vapplication.h"
#include "vbyte_buffer.h"
#include "vlog.h"

using namespace std;

//=======================================================================================
//  К сожалению, тестировать без порта нереально, отлаживаюсь здесь.
TEST_F( vserial_port_test, create_only_test )
{
    vserial_port port;
    (void) port;

    vterminal_options opts;
    (void) opts;
}
//=======================================================================================


//=======================================================================================
TEST_F( vserial_port_test, receive_data )
{
    vterminal_options options( 460800 );

    vserial_port port( "/dev/base-ubx" );

}
//=======================================================================================
