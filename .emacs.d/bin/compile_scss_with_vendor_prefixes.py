#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys
import re
from subprocess import Popen, PIPE, STDOUT


PROPERTIES = ["box-sizing", "box-flex", "transform"]
PREFIXES = ["-webkit-", "-moz-", "-ms-", "-o-", ""]


def addPrefixes(s, prop):
    reg = re.compile(r"(?:^|[\s\t\n\r;]){0}[\s\S]*?(:[\s\S]*?;)".format(prop),
                     re.M)
    repl = lambda m: "".join([p + prop + m.group(1) for p in PREFIXES])

    return re.sub(reg, repl, s)


def replaceRem(s):
    """Add `font-size` and `line-height` after `font` that uses `rem`.

    A font shorthand property that uses rem in IE is not work. This
    function replaces font-size and line-height definition in the font
    property by `em` and add a font-size and a line-height property that
    define actual value.
    """

    fs_reg = re.compile(r"(font[\s\t\n\r]*?:.*?)(?<=[^/])([0-9\.]+)rem(.*?;)")
    fs_repl = lambda m: ("{0}{1}em{2}font-size:{1}rem;"
                         .format(m.group(1), m.group(2), m.group(3)))
    lh_reg = re.compile(r"(font[\s\t\n\r]*?:.*?)(?<=/)([0-9\.]+)rem(.*?;)")
    lh_repl = lambda m: ("{0}{1}em{2}line-height:{1}rem;"
                         .format(m.group(1), m.group(2), m.group(3)))

    s = re.sub(lh_reg, lh_repl, s)
    s = re.sub(fs_reg, fs_repl, s)

    return s


def doAll(s):
    for p in PROPERTIES:
        s = addPrefixes(s, p)
    s = replaceRem(s)

    return s


def compileScss(outputName, outputContent):
    ps = Popen(("sass", "--scss", "--stdin", outputName),
               stdin=PIPE, stdout=PIPE, stderr=STDOUT)

    ps.stdin.write(outputContent)
    ps.stdin.close()

    code = ps.wait()
    output = ps.stdout.read()

    return (code, output)


if __name__ == '__main__':
    inputContent = sys.stdin.read()

    outputName = sys.argv[1]
    outputContent = doAll(inputContent)

    c, o = compileScss(outputName, outputContent)
    sys.exit(c) if (c == 0) else sys.exit(o)
