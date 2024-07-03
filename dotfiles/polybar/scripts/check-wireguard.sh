#!/bin/sh

interface=$(ls /sys/devices/virtual/net | grep -E "wg0|vpn")

if [ "$interface" = "" ]; then
    echo ""
else
    echo " $interface"
fi
