default rel
global _start

section .text
_start:
    ; Let's do some arithmetic
    ; I'll put what I expect the registers to be on each line as they would be after that line executes, and verify it in gdb debugger
    mov rdi, 3                  ; rdi = 3
    mov rax, rdi                ; rdi = 3, rax = 3
    add rax, rdi                ; rdi = 3, rax = 6
    mul rdi                     ; rdi = 3, rax = 18
    mov rdi, 2                  ; rdi = 2, rax = 18
    add rax, rdi                ; rdi = 2, rax = 20
    mov rdi, 4                  ; rdi = 4, rax = 20
    mul rdi                     ; rdi = 4, rax = 80
    mov rdi, rax                ; rdi = 80, rax = 80

    ; set the exit system call number
    mov rax, 60
    syscall
