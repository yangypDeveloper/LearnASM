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
    mov rax,0x2000004   ;0x2000004 表示 syscall 调用号 write
    mov rdi,1           ;表示控制台输出
    mov rsi,msg         ;syscall 调用会到 rsi 来获取字符
    mov rdx,len         ;字符串长度
    call kernel

    mov rax,0x2000001   ;0x2000001 表示退出 syscall  
    mov rdi,0
    call kernel