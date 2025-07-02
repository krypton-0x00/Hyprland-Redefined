#!/bin/bash

ipfile="$HOME/.config/waybar/current-htb-ip"
ip=$(cat "$ipfile" 2>/dev/null)

if [[ -z "$ip" ]]; then
  echo "{\"text\": \"\", \"class\": \"hidden\"}"
  exit 0
fi

ping -c 1 -W 1 "$ip" &> /dev/null

if [[ $? -eq 0 ]]; then
  echo "{\"text\": \"🟢 $ip\", \"class\": \"online\"}"
else
  echo "{\"text\": \"🔴 $ip\", \"class\": \"offline\"}"
fi

