#!/bin/bash 
if [  -n "$1" ]
then 
    echo "Скрипт работает без параметров"
    exit 1
fi

source All_comand.sh

echo "Записать полученные данные в файл?"
read ANSWER
if [ "$ANSWER" == "Y" ] || [ "$ANSWER" == "y" ];
then 
    { 
        source All_comand.sh 
    } > " $(date "+%d_%m_%y_%H_%M_%S").status "
fi

