#!/bin/bash 

echo HOSTNAME = $HOSTNAME
echo TIMEZONE = $(timedatectl  | grep "Time zone" | awk '{print $3}')
echo DATE = $(date  "+%d %b %Y %H:%M:%S") 
echo USER =  $(whoami)
echo OS = $(uname -sr)
echo UPTIME = $(uptime -p)
echo UPTIME_SEC = $(awk '{print $1}' /proc/uptime)
echo IP = $(hostname -i)
echo MASK = $(ifconfig | grep netmask | awk '{print $4}' | head -1 )
echo GATEWAY = $(ip rout | grep default | awk '{print $3}')
echo RAM_TOTAL = $(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/1024/1024}' )
echo RAM_USED = $(free| grep Mem | awk '{printf "%.3f GB", $3/1024/1024}')
echo RAM_FREE = $(free| grep Mem | awk '{printf "%.3f GB", $4/1024/1024}')
echo SPACE_ROOT = $(df / | awk 'NR ==2 {memory=$2;calculation=memory/1024;printf "%.2f MB", calculation}')
echo SPACE_ROOT_USED = $(df / | awk 'NR ==2 {memory=$3;calculation=memory/1024;printf "%.2f MB", calculation}')
echo SPACE_ROOT_FREE = $(df / | awk 'NR ==2 {memory=$4;calculation=memory/1024;printf "%.2f MB", calculation}')
