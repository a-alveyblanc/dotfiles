#!/bin/sh

# set graphics tablet name
PAD_NAME="Wacom Intuos S Pad pad"

# bind buttons to do useful things
xsetwacom --set "$PAD_NAME" Button 1 "key +ctrl +z -z -ctrl"

# get primary display
MONITOR=`xrandr | grep "primary" | cut -f 1 -d ' '`

# get input id of the stylus
STYLUS_ID=`xinput | grep "Pen stylus" | cut -f 2 | cut -f 2 -d '='`

# map to primary display
xinput map-to-output $STYLUS_ID $MONITOR
