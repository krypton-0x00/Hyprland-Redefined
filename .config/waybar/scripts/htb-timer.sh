#!/bin/bash

file="$HOME/.config/waybar/htb-box.json"

if [[ ! -f "$file" ]]; then
  echo '{"text": ""}'
  exit 0
fi

ip=$(jq -r '.ip' "$file")
start=$(jq -r '.started' "$file")
start_s=$(date -d "$start" +%s)
now_s=$(date +%s)
elapsed=$((now_s - start_s))

h=$(($elapsed / 3600))
m=$((($elapsed % 3600) / 60))
s=$(($elapsed % 60))

printf -v duration "%02d:%02d:%02d" $h $m $s

echo "{\"text\": \"⏱️ $duration\", \"tooltip\": \"Box $ip\"}"

