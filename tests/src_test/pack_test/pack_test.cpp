/*! \file pack_test.cpp
 * \brief PackTest class implementation.

 * \authors Dmitrii Leliuhin
 * \date July 2020
 */

//=======================================================================================

#include "pack_test.h"
#include "pack.h"

//=======================================================================================
/*! \test TEST( PackTest, test_clear )
 * \brief Clear data;
 */
TEST( PackTest, test_clear )
{
    Pack pack;
    pack.clear();

    ASSERT_EQ( 0, pack.data.timestamp() );
}
//=======================================================================================
/*! \test TEST( PackTest, test_operator_eq )
 * \brief Copy assignment operator test.
 */
TEST( PackTest, test_operator_eq )
{
    ZcmService msg;
    {
        msg.u_timestamp = 1;
        msg.processing_time = 1;
    }

    Data data;
    data = msg;

    ASSERT_EQ( 1, data.timestamp() );
}
//=======================================================================================
