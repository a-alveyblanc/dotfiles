#!/bin/bash

xrandr --dpi 164 --fb 7680x4320 \
    --output DP-4 --mode 3840x2160 --rate 120 --scale 1 \
    --output DP-2 --mode 1920x1080 --rate 120 --scale 2 --pos 3840x0 \
    --panning 3840x2160+3840+0
