#!/usr/bin/env python
# -*- coding:utf-8 -*-

import unittest
import append_path
from scss_preprocessor import *


class ScssPreprocessorTest(unittest.TestCase):
    def test_addPrefixes_1(self):
        e = ("selector {"
             "-webkit-box-sizing: border-box;"
             "-moz-box-sizing: border-box;"
             "-ms-box-sizing: border-box;"
             "-o-box-sizing: border-box;"
             "box-sizing: border-box;"
             "}")
        a_arg = ("selector {"
                 "box-sizing: border-box;"
                 "}")
        a = addPrefixes(a_arg, 'box-sizing')
        self.assertEqual(e, a)

    def test_replaceRem_1(self):
        e = ("selector {"
             "font: 2em/3em sans-serif;font-size:2rem;line-height:3rem;"
             "}")
        a_arg = ("selector {"
                 "font: 2rem/3rem sans-serif;"
                 "}")
        a = replaceRem(a_arg)
        self.assertEqual(e, a)

    def test_replaceRem_2(self):
        e = ("selector {"
             "font: 2em/3em sans-serif;font-size:2rem;"
             "}")
        a_arg = ("selector {"
                 "font: 2rem/3em sans-serif;"
                 "}")
        a = replaceRem(a_arg)
        self.assertEqual(e, a)

    def test_replaceRem_3(self):
        e = ("selector {"
             "font: 2em/3em sans-serif;line-height:3rem;"
             "}")
        a_arg = ("selector {"
                 "font: 2em/3rem sans-serif;"
                 "}")
        a = replaceRem(a_arg)
        self.assertEqual(e, a)

if __name__ == "__main__":
    unittest.main()
