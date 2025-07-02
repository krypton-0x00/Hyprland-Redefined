#!/bin/bash

ip=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ -n "$ip" ]; then
    echo "{\"text\": \"🔐 $ip\", \"class\": \"tun0\"}"
else
    echo "{\"text\": \"\", \"class\": \"hidden\"}"
fi

