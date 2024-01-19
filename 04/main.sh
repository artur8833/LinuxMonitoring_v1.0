#!/bin/bash 
source Change_color.sh

back=( " " "\e[37m" "\e[31m" "\e[32m" "\e[34m" "\e[35m" "\e[30m")
front=( " " "\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
name_color=(" " "white" "red" "green" "blue" "purple" "black")

echo -e "${back[$column1_background]}${front[$column1_font_color]}HOSTNAME = ${back[$column2_background]}${front[$column2_font_color]}$HOSTNAME \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}TIMEZONE = ${back[$column2_background]}${front[$column2_font_color]}$(date +%Z) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}DATE = ${back[$column2_background]}${front[$column2_font_color]}$(date  "+%d %b %Y %H:%M:%S") \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}USER = ${back[$column2_background]}${front[$column2_font_color]}$(whoami) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}OS = ${back[$column2_background]}${front[$column2_font_color]}$(uname -sr)  \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}UPTIME = ${back[$column2_background]}${front[$column2_font_color]}$(uptime -p) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}UPTIME_SEC = ${back[$column2_background]}${front[$column2_font_color]}$(awk '{print $1}' /proc/uptime) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}IP = ${back[$column2_background]}${front[$column2_font_color]}$(hostname -i) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}MASK = ${back[$column2_background]}${front[$column2_font_color]}$(ifconfig | grep netmask | awk '{print $4}' | head -1 ) \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}GATEWAY = ${back[$column2_background]}${front[$column2_font_color]}$(ip rout | grep default | awk '{print $3}') \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}RAM_TOTAL = ${back[$column2_background]}${front[$column2_font_color]}$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/1024/1024}') \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}RAM_USED = ${back[$column2_background]}${front[$column2_font_color]}$(free| grep Mem | awk '{printf "%.3f GB", $3/1024/1024}') \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}RAM_FREE = ${back[$column2_background]}${front[$column2_font_color]}$(free| grep Mem | awk '{printf "%.3f GB", $4/1024/1024}') \e[0m" 
echo -e "${back[$column1_background]}${front[$column1_font_color]}SPACE_ROOT = ${back[$column2_background]}${front[$column2_font_color]}$(df / | awk 'NR ==2 {memory=$2;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}SPACE_ROOT_USED = ${back[$column2_background]}${front[$column2_font_color]}$(df / | awk 'NR ==2 {memory=$3;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
echo -e "${back[$column1_background]}${front[$column1_font_color]}SPACE_ROOT_FREE = ${back[$column2_background]}${front[$column2_font_color]}$(df / | awk 'NR ==2 {memory=$4;calculation=memory/1024;printf "%.2f MB", calculation}') \e[0m"
echo

if [ -n "$flag_column1_background" ]
then 
echo "Column 1 background = $column1_background (default)"
else 
echo "Column 1 background = $column1_background (${name_color[$column1_background]})"
fi

if [ -n "$flag_column1_font_color" ]
then 
echo "Column 1 font color = $column1_font_color (default)"
else 
echo "Column 1 font color= $column1_font_color (${name_color[$column1_font_color]})"
fi

if [ -n "$flag_column2_background" ]
then 
echo "Column 2 background = $column2_background (default)"
else 
echo "Column 2 background = $column2_background (${name_color[$column2_background]})"
fi

if [ -n "$flag_column2_font_color" ]
then 
echo "Column 2 font color = $column2_font_color (default)"
else
echo "Column 2 font color= $column2_font_color (${name_color[$column2_font_color]})"
fi
