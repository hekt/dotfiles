#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys
import re
from subprocess import Popen, PIPE, STDOUT

PROPERTIES = ['box-sizing', 'box-flex', 'transform']
PREFIXES = ['-webkit-', '-moz-', '-ms-', '-o-', '']

def addPrefixes(s, prop):
    r = re.compile("(?:^|[\s\t\n]){0}[\\s\\t]*(:[\\s\\t]*.*?;)".format(prop))
    def repl(m):
        return "\n".join([p + prop + m.group(1) for p in PREFIXES])
    return re.sub(r, repl, s);
        
def addPrefixesAll(s):
    for p in PROPERTIES:
        s = addPrefixes(s, p)
    return s

def compileScss(outputName, outputContent):
    ps = Popen(("sass", "--scss", "--stdin", outputName),
               stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    ps.stdin.write(outputContent)
    ps.stdin.close()
    code =  ps.wait()
    output = ps.stdout.read()
    return (code, output)

if __name__ == "__main__":
    inputContent = sys.stdin.read();
    outputName = sys.argv[1]
    outputContent = addPrefixesAll(inputContent)

    c, o =  compileScss(outputName, outputContent)
    sys.exit(c) if (c == 0) else sys.exit(o)
