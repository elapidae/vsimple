/*! \file vchrono_test.h
 * \brief vchrono_test class interface.
 *
 * vchrono tests.
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
/*! \test vchrono_test_test
 * \brief The vchrono_test class tests
 */
class vchrono_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
