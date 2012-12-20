#!/bin/sh
ISRC=`~/bin/inputsource | sed 's/.*\.//g'`
if [ $ISRC = 'Roman' ]; then
    echo "#[fg=brightgreen,bg=black] A #[default]"
else
    echo "#[fg=white,bg=yellow] J #[default]"
fi
