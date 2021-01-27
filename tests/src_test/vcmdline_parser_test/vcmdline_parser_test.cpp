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

#include "vcmdline_parser_test.h"

#include "gtest/gtest.h"
#include "vcmdline_parser.h"

using namespace std;

//=======================================================================================
TEST_F( vcmdline_parser_test, vapplication_args_parser )
{
    std::vector<const char*> v_args;
    v_args.push_back( "/app/path/app_name" );

    v_args.push_back( "has" );

    v_args.push_back( "key" );
    v_args.push_back( "val" );

    v_args.push_back( "if=somefile" );
    v_args.push_back( "-p722" );

    vcmdline_parser args( v_args.size(), v_args.data() );

    EXPECT_EQ( args.app_name(), "app_name"  );
    EXPECT_EQ( args.app_path(), "/app/path" );

    //  has не трогает, take помечает аргументы как использованные.
    EXPECT_TRUE( args.has("has") );
    EXPECT_TRUE( args.has("has") );
    EXPECT_TRUE( args.take("has") );
    EXPECT_FALSE( args.has("has") );
    EXPECT_FALSE( args.take("has") );

    EXPECT_EQ( args.take_next("key"), "val" );
    EXPECT_EQ( args.safe_next("key", "not"), "not" );
    EXPECT_EQ( args.safe_next("-c", "%"), "%" );
    EXPECT_THROW( args.take_next("key"), vcmdline_parser::error );

    EXPECT_EQ( args.take_starts_with("if="), "somefile" );
    EXPECT_EQ( args.take_starts_with("-p"), "722" );

    EXPECT_THROW( args.take_starts_with("if="), vcmdline_parser::error );
    EXPECT_THROW( args.take_starts_with("-p"),  vcmdline_parser::error );

    EXPECT_EQ( args.safe_starts_with("-c=", "%"), "%" );
}

//=======================================================================================
TEST_F( vcmdline_parser_test, fake_1 )
{
    // type here
}
//=======================================================================================
