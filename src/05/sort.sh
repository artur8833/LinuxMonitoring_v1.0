#!/bin/bash 

top_five()
{
    listt=$(find "$absolute_path" -type d -exec du -sh --exclude="$absolute_path" {} + | sort -rh | head -n 5 | awk '{print $2 "/, " $1}')
    IFS=$'\n'
    count=0
    for var in $listt
    do 
    ((++count))
    size=$(echo "$var"  | awk '{print $2}'| sed -e 's/K/ KB/g' | sed 's/M/ MB/g' | sed 's/G/ GB/g')
    name_folder=$(echo "$var" | awk '{print $1}')
    echo "$count - $name_folder $size"
    done
}

top_ten_type()
{
    listt2=$(find "$absolute_path" -type f -exec du -sh --exclude="$absolute_path" {} + | sort -rh | head -n 10 | awk '{print $2, $1}')
    IFS=$'\n'
    count=0
    for var in $listt2
    do 
    ((++count))
    size=$(echo "$var"  | awk '{print $2}'| sed -e 's/K/ KB/g' | sed 's/M/ MB/g' | sed 's/G/ GB/g')
    name_folder=$(echo "$var" | awk '{print $1}')
    type=$(echo "$name_folder" | rev | cut -d '.' -f 1 | rev )
    echo "$count - $name_folder, $size, $type"
    done
}

top_ten_hash()
{
    listt3=$(find "$absolute_path" -type f -exec du -sh --exclude="$absolute_path" {} + | sort -rh | head -n 10 | awk '{print $2, $1}')
    IFS=$'\n'
    count=0
    for var in $listt3
    do 
    ((++count))
    size=$(echo "$var"  | awk '{print $2}'| sed -e 's/K/ KB/g' | sed 's/M/ MB/g' | sed 's/G/ GB/g')
    name_folder=$(echo "$var" | awk '{print $1}')
    hash=$(md5sum "$name_folder" | awk '{print $1}')
    echo "$count - $name_folder, $size, $hash"
    done
}