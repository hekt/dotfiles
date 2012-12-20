#!/bin/sh
ISRC=`~/bin/inputsource | sed 's/.*\.//g'`
if [ $ISRC = 'Roman' ]; then
    echo "#[fg=white,bg=black] A #[default]"
else
    echo "#[fg=white,bg=red] J #[default]"
fi
