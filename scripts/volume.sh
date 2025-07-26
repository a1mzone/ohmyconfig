#!/bin/bash
vol=$(amixer get Master | awk -F'[][]' '/%/ { print $2 }' | head -n1)
echo "$vol"
