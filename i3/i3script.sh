#!/bin/bash

# shell scipt to prepend i3status with more stuff
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
i3status --config $DIR/i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}') 
    if [ $LG == "us,is" ]
    then
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#009E00\" },"
    else
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#C60101\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
