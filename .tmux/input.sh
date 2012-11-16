#!/bin/sh
ISRC=`~/bin/inputsource | sed 's/.*\.//g'`
if [ $ISRC = 'Roman' ]; then
    echo "[A]"
else
    echo "[J]"
fi
