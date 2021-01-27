/*! \file vsignal_test.h
 * \brief vsignal_test class interface.
 *
 * vsignal_test tests.
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
/*! \test vsignal_test_test
 * \brief The vsignal_test class tests
 */
class vsignal_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
