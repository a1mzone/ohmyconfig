#!/bin/bash
iface=$(ip link | awk '/state UP/ {print $2}' | sed 's/://')
if [ -z "$iface" ]; then echo "E: down"; exit; fi
ip=$(ip -4 addr show "$iface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
speed=$(cat /sys/class/net/"$iface"/speed 2>/dev/null || echo "n/a")
echo "$ip ($speed Mbps)"
