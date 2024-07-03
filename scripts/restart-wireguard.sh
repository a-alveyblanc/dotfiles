#!/bin/sh

if [ "$1" = "" ]; then
    echo "Provide an interface as a command line argument."
    exit 1
fi

new_interface=$1
old_interface=$(wg | grep "interface" | sed -r "s/interface: //")

if [ "$old_interface" = "" ]; then
    wg-quick up $new_interface 
elif [ "$old_interface" != "$new_interface" ]; then
    wg-quick down $old_interface
    wg-quick up $new_interface
elif [ "$old_interface" = "$new_interface" ]; then
    echo "Interface already running. Running \`wg\` to show status."
    wg
    exit 0
fi
