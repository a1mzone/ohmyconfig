#!/bin/bash
used=$(free -h | awk '/Mem:/ {print $3}')
available=$(free -h | awk '/Mem:/ {print $7}')
echo "${used} | ${available}"
