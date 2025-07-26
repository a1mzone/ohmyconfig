#!/bin/bash
status=$(cat /sys/class/power_supply/BAT*/status)
capacity=$(cat /sys/class/power_supply/BAT*/capacity)
remaining="n/a"
echo "$status ${capacity}% $remaining"
