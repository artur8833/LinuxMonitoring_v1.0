#!/bin/bash 
START=$(date +%s.%N)

if ! [ $# -eq 1 ] 
then
    echo "Параметр пуст или введено больше 1 параметра"
    exit 1
elif ! [[ "$1" == */ ]]
then
    echo "Ссылка не заканчивается на /"
    exit 1
fi

if [[ $1 == /* && $1 != /.* ]]
then 
absolute_path="$1"
else 
path=$(echo "$1" | sed 's/^[./]*//')
absolute_path="$(dirname $PWD)/$path"
fi

if [ ! -d "$absolute_path" ] 
then
    echo "No such file or directory."
    exit 1
fi

source sort.sh

echo "Total number of folders (including all nested ones) = $(find "$absolute_path" -mindepth 1 -type d  | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):" 
top_five "$absolute_path"
echo "etc up to 5"
echo "Total number of files = $(find "$absolute_path" -mindepth 1 -type f  | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find "$absolute_path" -mindepth 1 -type f -iname "*.conf" | wc -l)"
echo "Text files = $(find "$absolute_path" -mindepth 1 -type f  -iname "*.txt" -or -iname "*.csv" -or -iname "*.md" -or -iname "*.html" -or -iname "*.xml" | wc -l)"
echo "Executable files = $(find "$absolute_path" -mindepth 1 -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find "$absolute_path" -mindepth 1 -type f -name "*.log" | wc -l)"
echo "Archive files = $(find "$absolute_path" -mindepth 1 -type f  -iname "*.zip" -or -iname "*.tar" -or -iname "*.rar" -or -iname "*.7z" -or -iname "*.SIT" | wc -l)"
echo "Symbolic links = $(find "$absolute_path" -mindepth 1 -type l  | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
top_ten_type "$absolute_path"
echo "etc up to 10"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)" 
top_ten_hash "$absolute_path"

END=$(date +%s.%N)

DIFF=$(awk -v num1="$END" -v num2="$START" 'BEGIN { printf "%.1f", (num1 - num2) }')
echo "Script execution time (in seconds) = $DIFF"