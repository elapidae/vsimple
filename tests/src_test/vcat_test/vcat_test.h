/*! \file vcat_test.h
 * \brief vcat_test class interface.
 *
 * vcat_test tests.
 *
 * \authors Dmitrii Leliuhin
 * \date January 2020
 */

//=======================================================================================

#pragma once

#include "gtest/gtest.h"

//=======================================================================================

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpragmas"
#pragma GCC diagnostic ignored "-Wweak-vtables"

//=======================================================================================
/*! \test vcat_test_test
 * \brief The vcat_test class tests
 */
class vcat_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
