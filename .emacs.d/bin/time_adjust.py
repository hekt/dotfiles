#!/usr/bin/env python
# -*- coding:utf-8 -*-


""" Adjust time strings

Example:
  $ python time_adjust.py 1230 << EOF
  > 0:00:00
  > 0:00:00.0, 123:45:67.890
  > EOF
  0:00:01
  0:00:01.2, 123:46:09.120
"""


import sys
import re
from datetime import timedelta


def str2delta(s):
    (h, m, s) = s.split(":")
    h = int(h)
    m = int(m)
    s = float(s)

    if h < 0:
        raise ValueError("hours must be positive integer.")
    elif not (0 <= m < 60):
        raise ValueError("minutes must be positive integer and less then 60.")
    elif not (0 <= s < 60):
        raise ValueError("seconds must be positive number and less then 60.")
    
    return timedelta(hours=h, minutes=m, seconds=s)


def delta2str(d, decimal_digits=2):
    hours = d.seconds // 60 // 60 + d.days * 24
    minutes = d.seconds // 60 % 60
    seconds = d.seconds % 60 + d.microseconds / 1000000.0

    second_digits = decimal_digits + 3 if decimal_digits > 0 else 2
    return "{h:d}:{m:02d}:{s:0{}.{}f}".format(second_digits, decimal_digits,
                                              h=hours, m=minutes, s=seconds)


if __name__ == "__main__":
    ms = int(sys.argv[1])
    r = re.compile("[0-9]+:[0-9]{2}:[0-9]{2}(\.[0-9]+)?")

    def repl(m):
        decimal_digits = len(m.group(1)) - 1 if m.group(1) else 0
        delta = str2delta(m.group(0)) + timedelta(milliseconds=ms)
        return delta2str(delta, decimal_digits)

    result = "".join([re.sub(r, repl, l) for l in sys.stdin])
    sys.stdout.write(result)
