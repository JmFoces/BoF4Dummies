.global     printf
.global      _start                             
.text

sayhello:
    push    %ebp
    mov     %esp, %ebp
	mov     $4, %eax
	mov     $1, %ebx                        
    mov     $hello, %ecx                        
    mov     $s_len, %edx
    int     $0x80       
    leave                         
    ret

_start:
    mov     %esp, %ebp                                         
	call    sayhello
    mov 	$ret_c, %ebx							
    mov     $1, %eax                             
    int     $0x80                               
.section .data
hello: .ascii  "Hello, world\n"
s_len =    . - hello
ret_c = 0x0
