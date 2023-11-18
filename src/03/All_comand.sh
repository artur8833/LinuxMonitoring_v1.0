#!/bin/bash 

back=( " " "\e[37m" "\e[31m" "\e[32m" "\e[34m" "\e[35m" "\e[30m")
front=( " " "\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")

echo -e "${back[$2]}${front[$1]}HOSTNAME = ${back[$4]}${front[$3]}$HOSTNAME \e[0m"
echo -e "${back[$2]}${front[$1]}TIMEZONE = ${back[$4]}${front[$3]}$(date +%Z) \e[0m"
echo -e "${back[$2]}${front[$1]}DATE = ${back[$4]}${front[$3]}$(date  "+%d %b %Y %H:%M:%S") \e[0m"
echo -e "${back[$2]}${front[$1]}USER = ${back[$4]}${front[$3]}$(whoami) \e[0m"
echo -e "${back[$2]}${front[$1]}OS = ${back[$4]}${front[$3]}$(uname -sr)  \e[0m"
echo -e "${back[$2]}${front[$1]}UPTIME = ${back[$4]}${front[$3]}$(uptime -p) \e[0m"
echo -e "${back[$2]}${front[$1]}UPTIME_SEC = ${back[$4]}${front[$3]}$(awk '{print $1}' /proc/uptime) \e[0m"
echo -e "${back[$2]}${front[$1]}IP = ${back[$4]}${front[$3]}$(hostname -i) \e[0m"
echo -e "${back[$2]}${front[$1]}MASK = ${back[$4]}${front[$3]}$(ifconfig | grep netmask | awk '{print $4}' | head -1 ) \e[0m"
echo -e "${back[$2]}${front[$1]}GATEWAY = ${back[$4]}${front[$3]}$(ip rout | grep default | awk '{print $3}') \e[0m"
echo -e "${back[$2]}${front[$1]}RAM_TOTAL = ${back[$4]}${front[$3]}$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/1024/1024}') \e[0m"
echo -e "${back[$2]}${front[$1]}RAM_USED = ${back[$4]}${front[$3]}$(free| grep Mem | awk '{printf "%.3f GB", $3/1024/1024}') \e[0m"
echo -e "${back[$2]}${front[$1]}RAM_FREE = ${back[$4]}${front[$3]}$(free| grep Mem | awk '{printf "%.3f GB", $4/1024/1024}') \e[0m" 
echo -e "${back[$2]}${front[$1]}SPACE_ROOT = ${back[$4]}${front[$3]}$(df / | awk 'NR ==2 {memory=$2;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
echo -e "${back[$2]}${front[$1]}SPACE_ROOT_USED = ${back[$4]}${front[$3]}$(df / | awk 'NR ==2 {memory=$3;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
echo -e "${back[$2]}${front[$1]}SPACE_ROOT_FREE = ${back[$4]}${front[$3]}$(df / | awk 'NR ==2 {memory=$4;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
