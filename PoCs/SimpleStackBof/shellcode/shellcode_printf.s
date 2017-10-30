.global      _start                             
.text
_start:
    mov     %esp, %ebp                                         
    mov     $4, %eax
    mov     $1, %ebx                        
    mov     %esi, %ecx
    sub     $0xa3, %ecx
    mov     $23, %edx
    int     $0x80                                

    mov 	$0, %ebx							
    mov     $1, %eax                             
    int     $0x80                               

.section .data
hello: .ascii  "Hello, world\n"
s_len =    . - hello
ret_c = 0x0
