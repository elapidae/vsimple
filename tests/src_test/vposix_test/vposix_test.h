/*! \file vposix_test.h
 * \brief vposix_test class interface.
 *
 * vposix_test tests.
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
/*! \test vposix_test_test
 * \brief The vposix_test class tests
 */
class vposix_test : public testing::Test
{};

class vpoll_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
