#!/bin/bash
iface=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)
if [ -z "$iface" ]; then echo "down"; exit; fi
essid=$(iwgetid -r)
quality=$(grep "$iface" /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
ip=$(ip -4 addr show "$iface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "($quality% at $essid) $ip"
