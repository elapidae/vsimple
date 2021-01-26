/*! \file vprofile_test.h
 * \brief vprofile_test class interface.
 *
 * vprofile_test tests.
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
/*! \test vprofile_test_test
 * \brief The vprofile_test class tests
 */
class vprofile_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
