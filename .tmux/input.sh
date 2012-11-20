#!/bin/sh
ISRC=`~/bin/inputsource | sed 's/.*\.//g'`
if [ $ISRC = 'Roman' ]; then
    echo "#[fg=white,bg=colour235] A #[default]"
else
    echo "#[fg=white,bg=colour235] J #[default]"
fi
