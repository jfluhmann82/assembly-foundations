; First Exercise, just exit
default rel
global _start

section .text

_start:
    mov rax, 60     ; 60 corresponds to system call `exit`
    mov rdi, 3      ; set the exit status code.
    syscall

; Can confirm the program properly by running `echo $?` from cli after running the executable version of this code.