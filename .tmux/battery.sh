#!/bin/sh
bt=`pmset -g ps | awk '{ if (NR == 2) print $2 }' | sed 's/%;//g'`
if [ $((bt)) -gt 50 ]; then
    echo ")≡}"
elif [ $((bt)) -gt 25 ]; then
    echo "[)#[fg=brightyellow]=#[default]}]"
else
    echo "[)#[fg=red]_#[default]}]"
fi
