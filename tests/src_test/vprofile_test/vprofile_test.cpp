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
//#include "vprofile.h"

using namespace std;

//=======================================================================================
//  EXPECT_TRUE
//
//  EXPECT_EQ
//  EXPECT_FLOAT_EQ
//  EXPECT_DOUBLE_EQ
//
//  EXPECT_THROW
//  EXPECT_ANY_THROW
//  EXPECT_NO_THROW
//
TEST_F( vprofile_test, _test_name )
{
//    V_PROFILE;
    // type here
}
//=======================================================================================
void s1()
{
//    V_PROFILE;
//    sleep(1);
}
void s2()
{
//    V_PROFILE;
//    sleep(1);
}

//#ifdef V_HAS_QT
//    #include <QApplication>
//    #include <QTimer>
//    #include <vprofile_widget.h>
//#endif

//=======================================================================================
//  Main, do not delete...
//=======================================================================================
//{
//    V_PROFILE;
//    s1();
//    s2();

//#ifdef V_HAS_QT
//    vsettings s;
//    s.from_ini_file( "sett.ini" );
//    QApplication app(argc,argv);
//    VProfile_Widget w;
//    w.set_settings(s);
//    w.show();
//    QTimer t;
//    t.start(2000);
//    QObject::connect( &t, &QTimer::timeout, [&]{app.quit();} );
//    app.exec();
//    w.save_settings();
//    s.to_ini_file( "sett.ini" );
//#endif
//}
//=======================================================================================
