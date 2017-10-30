.global _start
.text
_start:
    mov     $1, %rax                
    mov     $1, %rdi                
    mov     $hello, %rsi            
    mov     $s_len, %rdx            
    syscall                         
    mov     $60, %rax               
    xor     %rdi, %rdi              
    syscall                         
.section .data
hello: .ascii  "Hello, world\n"
s_len =    . - hello
ret_c = 0x0

        