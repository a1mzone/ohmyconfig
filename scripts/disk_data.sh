#!/bin/bash
usage=$(df -h /data/datastore | awk 'NR==2 {print $5}')
echo " $usage"
