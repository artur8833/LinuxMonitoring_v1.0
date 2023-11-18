#!/bin/bash 
if ! [ $# -eq 4 ]
then 
    echo "Параметры пусты или введите все параметры до 4"
elif  [[ ! $1 =~ ^[1-6] ]] || [[ ! $2 =~ ^[1-6] ]] || [[ ! $3 =~ ^[1-6] ]] || [[ ! $4 =~ ^[1-6] ]]
then
    echo "Некорректный ввод. Параметр должeн быть числом и находиться в промежутке от 1-6. Вызoвете скрипт повторно."
elif [ "$1" == "$2" ] || [ "$3" == "$4" ]
then
    echo "Некорректный ввод. Цвет шрифта и фона одного столбца не должны совпадать. Вызoвете скрипт повторно."
else 
    source All_comand.sh
fi 
