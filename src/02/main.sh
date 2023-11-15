#!/bin/bash 
REGEX="^[0-9]+$"

if [[ ! -n "$1"  ! $1~=REGEX ]]
then 
echo "Параметр является числом или пустым"
else
echo "$1"
fi