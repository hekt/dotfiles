#!/bin/sh
cg=`pmset -g ps | awk '{ if (NR == 2) print $4 }'`
if [ $cg = "charged;" ]; then
    echo "(~)"
elif [ $cg = "charging;" ] || [ $cg = "finishing" ]; then
    echo ")~}"
else
    bt=`pmset -g ps | awk '{ if (NR == 2) print $3 }' | sed 's/%;//g'`
    if [ $((bt)) -gt 50 ]; then
        printf ")#[default]%02d#[default]}" $bt
    elif [ $((bt)) -gt 25 ]; then
        printf ")#[fg=default]%02d#[default]}" $bt
    else
        printf ")#[fg=red]%02d#[default]}" $bt
    fi
fi
