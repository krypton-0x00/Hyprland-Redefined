#!/bin/bash

ip=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ -n "$ip" ]; then
    echo -n "$ip" | wl-copy
    notify-send "tun0 IP Copied" "$ip copied to clipboard" --icon=network-vpn
else
    notify-send "tun0 not connected" "No IP to copy" --icon=network-error
fi

