#!/bin/sh

power_status=$(bluetoothctl show | grep -i "powered" | sed -r "s/\tPowered://")
connected_status=$(
    bluetoothctl info | grep -i "connected" | sed -r "s/\tConnected://")

if [ $power_status = "yes" ]; then
    if [ $connected_status = "yes" ]; then
	echo "󰂱"
    else
	echo "󰂯"
    fi 
elif [ $power_status = "" ]; then 
    echo "󰂲"
fi
