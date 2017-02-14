#!/bin/bash

# shell scipt to prepend i3status with more stuff
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
i3status --config $DIR/i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}') 
    dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#00FF00\" },"
    echo "${line/[/$dat}" || exit 1
done
