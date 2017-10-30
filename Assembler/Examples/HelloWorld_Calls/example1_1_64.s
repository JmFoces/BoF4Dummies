.global _start
.text
sayhello:
	mov     $1, %rax                
    mov     $1, %rdi                
    mov     $hello, %rsi            
    mov     $s_len, %rdx            
    syscall 
    ret
_start:
    call    sayhello                    
    mov     $60, %rax               
    xor     %rdi, %rdi              
    syscall                         
.section .data
hello: .ascii  "Hello, world\n"
s_len =    . - hello
ret_c = 0x0

        