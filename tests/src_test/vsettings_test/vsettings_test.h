/*! \file vsettings_test.h
 * \brief vsettings_test class interface.
 *
 * vsettings_test tests.
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
/*! \test vsettings_test_test
 * \brief The vsettings_test class tests
 */
class vsettings_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
