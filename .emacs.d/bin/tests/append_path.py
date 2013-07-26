#!/usr/bin/env python
# -*- coding:utf-8 -*-

"""append parent directory path"""

import sys, os
dirpath = os.path.dirname(os.path.abspath(__file__))
parpath = os.path.join(dirpath, os.pardir)
sys.path.append(parpath)
