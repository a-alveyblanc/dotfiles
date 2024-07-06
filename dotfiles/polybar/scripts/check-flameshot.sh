#!/bin/sh

# check flameshot status
flameshot_status=$(ps -aux | grep "flameshot" | grep -v "grep")
if [ "$flameshot_status" = "" ]; then
    flameshot_icon=""
else 
    flameshot_icon=""
fi

echo $flameshot_icon
