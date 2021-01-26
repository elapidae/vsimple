/*! \file vnetwork_test.h
 * \brief vnetwork_test class interface.
 *
 * vnetwork_test tests.
 *
 * \authors Dmitrii Leliuhin
 * \date January 2020
 */

//=======================================================================================

#pragma once

#include "gtest/gtest.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpragmas"
#pragma GCC diagnostic ignored "-Wweak-vtables"

//=======================================================================================
/*! \test vnetwork_test_test
 * \brief The vnetwork_test class tests
 */
class vnetwork_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
