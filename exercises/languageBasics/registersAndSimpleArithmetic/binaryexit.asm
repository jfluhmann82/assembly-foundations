default rel
global _start
section .text
_start:
    mov rdi, 0b1101         ; run the program and echo $? to find out what this value is, or look it up in gdb
    mov rax, 60
    syscall