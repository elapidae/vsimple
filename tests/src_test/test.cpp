#include "vbyte_buffer_test.h"
#include "vcan_socket_test.h"
#include "vcat_test.h"
#include "vchrono_test.h"
#include "vcmdline_parser_test.h"
#include "vcompiler_traits_test.h"
#include "vgit_test.h"
#include "vlog_test.h"
#include "vnetwork_test.h"
#include "vposix_test.h"
#include "vprofile_test.h"
#include "vserial_port_test.h"
#include "vsettings_test.h"
#include "vsignal_test.h"
#include "vtimer_test.h"

#include <iostream>

#include "gtest/gtest.h"

//=======================================================================================
int main( int argc, char **argv )
{
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}
//=======================================================================================
