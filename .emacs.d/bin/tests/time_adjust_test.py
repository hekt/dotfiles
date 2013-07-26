#!/usr/bin/env python
# -*- coding:utf-8 -*-

import unittest
import append_path
from datetime import timedelta
from time_adjust import *


class TimeAdjustTest(unittest.TestCase):
    def test_str2delta_1(self):
        e = timedelta(0, 5025, 670000)
        a = str2delta("1:23:45.67")
        self.assertEqual(e, a)

    def test_str2delta_2(self):
        a_arg = "-1:23:45.67"
        self.assertRaises(ValueError, str2delta, a_arg)

    def test_str2delta_3(self):
        a_arg = "1:60:45.67"
        self.assertRaises(ValueError, str2delta, a_arg)

    def test_str2delta_4(self):
        a_arg = "1:23:60.67"
        self.assertRaises(ValueError, str2delta, a_arg)

    def test_delta2str_1(self):
        e = "1:23:45.67"
        a_arg = timedelta(0, 5025, 670000)
        a = delta2str(a_arg)
        self.assertEqual(e, a)

    def test_delta2str_2(self):
        e = "1:23:45.670"
        a_args = [timedelta(0, 5025, 670000), 3]
        a = delta2str(*a_args)
        self.assertEqual(e, a)


if __name__ == '__main__':
    unittest.main()
