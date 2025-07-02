#!/bin/bash

ip=$(cat ~/.config/waybar/current-htb-ip 2>/dev/null)

if [[ -n "$ip" ]]; then
    echo "{\"text\": \"🎯 $ip\", \"class\": \"htb-ip\"}"
else
    echo "{\"text\": \"\", \"class\": \"hidden\"}"
fi

