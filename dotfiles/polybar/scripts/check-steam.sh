#!/bin/sh

# check steam status
steam_status=$(ps -aux | grep "steam.sh" | grep -vE "grep|check-steam")
if [ "$steam_status" = "" ]; then
    steam_icon=""
else
    steam_icon=""
fi

echo $steam_icon
