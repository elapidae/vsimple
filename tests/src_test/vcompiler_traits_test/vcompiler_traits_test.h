/*! \file vcompiler_traits_test.h
 * \brief vcompiler_traits_test class interface.
 *
 * vcompiler_traits tests.
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
/*! \test vcompiler_traits_test_test
 * \brief The vcompiler_traits_test class tests
 */
class vcompiler_traits_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
