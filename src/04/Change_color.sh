#!/bin/bash 
if [  -n "$1" ]
then 
    echo "Скрипт работает без параметров. Все параметры цветов задаются в файле config.conf"
    exit 1
fi

source config.conf

if [ -z "$column1_background" ] || [[ ! $column1_background =~ ^[1-6]$ ]]
then 
    column1_background=6
    flag_column1_background=1
fi

if [ -z "$column1_font_color" ] || [[ ! $column1_font_color =~ ^[1-6]$ ]]
then 
    column1_font_color=1
    flag_column1_font_color=1
fi

if [ -z "$column2_background" ] || [[ ! $column2_background =~ ^[1-6]$ ]]
then 
    column2_background=2
    flag_column2_background=1
fi

if [ -z "$column2_font_color" ] || [[ ! $column2_font_color =~ ^[1-6]$ ]]
then 
    column2_font_color=4
    flag_column2_font_color=1
fi