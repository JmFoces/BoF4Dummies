.global      _start
.text
_start:                                         
	nop
	nop
	nop
	nop
	nop
	call _bye
_bye:
    mov 	$ret_c, %ebx							
    mov     $1, %eax                             
    int     $0x80                               
.section .data
ret_c = 0x0
