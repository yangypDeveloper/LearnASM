;nasm -f macho64 -o hello.o hello.asm
;ld -o hello -e _main hello.o
;./hello
SECTION .data

msg: db "hello world!", 0x0a
len: equ $-msg

SECTION .text
global _main
kernel:
    syscall
    ret

_main:
    mov rax,0x2000004
    mov rdi,1
    mov rsi,msg
    mov rdx,len
    call kernel

    mov rax,0x2000001
    mov rdi,0
    call kernel