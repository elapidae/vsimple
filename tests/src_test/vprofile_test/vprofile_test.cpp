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

#include "vprofile_test.h"

#include "gtest/gtest.h"
#include "vlog.h"
#include "vprofile.h"

using namespace std;

//=======================================================================================
TEST_F( vprofile_test, _test_name )
{
    V_PROFILE;
    // type here
}
//=======================================================================================
void s1()
{
    V_PROFILE;
    sleep(1);
}
void s2()
{
    V_PROFILE;
    sleep(1);
}

//=======================================================================================
TEST_F( vprofile_test, double_test )
{
    V_PROFILE;
    s1();
    s2();
}
//=======================================================================================
