#!/bin/bash

ip=$(cat ~/.config/waybar/current-htb-ip 2>/dev/null)

if [[ -n "$ip" ]]; then
    echo -n "$ip" | wl-copy
    notify-send "HTB IP Copied" "$ip copied to clipboard"
else
    notify-send "No IP Set" "Paste one in ~/.config/waybar/current-htb-ip"
fi

