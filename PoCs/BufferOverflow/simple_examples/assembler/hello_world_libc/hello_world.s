.global 	main
.text
main:                                         
	mov     %esp, %ebp                      
    mov     $hello, %ecx                        
    push    %ecx
    call    puts

    mov 	$ret_c, %ebx							
    mov     $1, %eax                             
    int     $0x80                               
.section .data
hello: .ascii  "Hello, world\n"
s_len =    . - hello
ret_c = 0x0
