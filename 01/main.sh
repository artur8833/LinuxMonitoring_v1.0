#!/bin/bash

if ! [ $# -eq 1 ]
then 
    echo "Параметр пуст или введено больше одного параметра. Введите один параметр"
elif [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "Некорректный ввод. Параметр не должне быть числом"
else 
    echo "$1"
fi 