/*! \file vtimer_test.h
 * \brief vtimer_test class interface.
 *
 * vtimer_test tests.
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
/*! \test vtimer_test_test
 * \brief The vtimer_test class tests
 */
class vtimer_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
