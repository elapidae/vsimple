/*! \file vserial_port_test.h
 * \brief vserial_port_test class interface.
 *
 * vserial_port_test tests.
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
/*! \test vserial_port_test_test
 * \brief The vserial_port_test class tests
 */
class vserial_port_test : public testing::Test
{};
//=======================================================================================

#pragma GCC diagnostic pop
