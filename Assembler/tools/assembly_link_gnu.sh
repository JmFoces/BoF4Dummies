#!/bin/bash
set -e

LINK_OS="\
--sysroot=/ \
/usr/lib/x86_64-linux-gnu/crt1.o \
/usr/lib/x86_64-linux-gnu/crti.o \
/usr/lib/gcc/x86_64-linux-gnu/6/crtbeginT.o \
-L /lib \
-L/usr/lib/gcc/x86_64-linux-gnu/6/ \
--start-group \
-lgcc \
-lgcc_eh \
-lc \
--end-group \
/usr/lib/gcc/x86_64-linux-gnu/6/crtend.o \
/usr/lib/gcc/x86_64-linux-gnu/6/../../../../lib/x86_64-linux-gnu/crtn.o \
" 

f=$1
arch=$2

lst_f=`echo $f |perl -pe 's/(.*)(\..*)$/\1/'`.lst
output=`echo $f |perl -pe 's/(.*)\.(.*)$/\1/'`
ul_output=`echo $f | perl -0pe 's/\..*//'`.o

find ./ -name $ul_output -exec rm {} \;
find ./ -name $output -exec rm {} \;

assembler_options=""
pre_linker_options="\
-static \
"

case $arch in
32)
  assembler_options+="-32 "
  pre_linker_options+="-m elf_i386"
  ;;
64*)
  assembler_options+="-64 "
  pre_linker_options+="-m elf_x86_64"
  ;;
*)
  assembler_options+="-64 "
  pre_linker_options+="-m elf_x86_64"
  ;;
esac



assemble_cmd="as $assembler_options -o $ul_output $f "
echo "Assemble: "$assemble_cmd
$assemble_cmd
echo "Assembled"
if ( nm $ul_output | grep main &> /dev/null )
then
	link_os=$LINK_OS
else
	link_os=""
fi

link_cmd="ld -o $output $pre_linker_options $ul_output $link_os"
echo "Link :"$link_cmd
$link_cmd

echo  "Linked" $output
file $output
file $ul_output
echo "Exec: ---"
./$output
echo "FinExec: ---"
