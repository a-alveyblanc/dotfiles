#!/bin/sh

# check bluetooth status
power_status=$(bluetoothctl show | grep -i "powered" | sed -r "s/\tPowered://")
connected_status=$(
    bluetoothctl info | grep -i "connected" | sed -r "s/\tConnected://")

if [ "$power_status" = "" ]; then
    bluetooth_icon="󰂲"
else 
    if [ "$connected_status" = "" ]; then
	bluetooth_icon="󰂯"
    else
	bluetooth_icon="󰂱"
    fi 
fi


# check steam status
steam_status=$(ps -aux | grep "steam.sh" | grep -v "grep")
if [ "$steam_status" = "" ]; then
    steam_icon=""
else
    steam_icon=""
fi


# check flameshot status
flameshot_status=$(ps -aux | grep "flameshot" | grep -v "grep")
if [ "$flameshot_status" = "" ]; then
    flameshot_icon=""
else 
    flameshot_icon=""
fi
