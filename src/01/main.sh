#!/bin/bash

if [  -z "$1" ]
then 
    echo "Параметр пуст"
elif [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "Некорректный ввод. Параметр не должне быть числом"
else 
    echo "$1"
fi 