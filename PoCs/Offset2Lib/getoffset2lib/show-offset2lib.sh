#!/bin/sh


file=$1

libc_base=$(cat $file | grep "libc" | grep r-xp | cut -d"-" -f1 )
app_base=$(cat $file | grep "get_offset2lib" | grep r-xp | cut -d"-" -f1)

app2libc=`printf "0x%x" $((0x${app_base}-0x${libc_base}))`

echo "Offset2lib (libc): ${app2libc}"
echo ""
