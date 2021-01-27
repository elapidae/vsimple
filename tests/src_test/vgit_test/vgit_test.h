/*! \file vgit_test.h
 * \brief vgit_test class interface.
 *
 * vgit_test tests.
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
/*! \test vgit_test
 * \brief The vgit_test class tests
 */
class vgit_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
