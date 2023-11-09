#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

while pgrep -x polybar > /dev/null; do sleep 1; done

# https://github.com/polybar/polybar/issues/763
if type "xrandr"; then

    primary=$(xrandr --query | grep " primary" | cut -d" " -f1)
    
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ $m == $primary ]]; then
            MONITOR=$m TRAY_POS=right polybar --reload bar1 &
        else
            MONITOR=$m TRAY_POS=none polybar --reload bar2 & 
        fi 
    done
else
    polybar --reload bar &
fi
