default rel

extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

section .data
    msg db "Hello, world!", 13, 10
    msg_len equ $ - msg

section .bss
    written resd 1

section .text
global _start

_start:
    ; GetStdHandle(STD_OUTPUT_HANDLE = -11)
    mov rcx, -11
    call GetStdHandle
    mov rbx, rax

    ; WriteConsoleA(hConsole, msg, len, &written, NULL)
    mov rcx, rbx
    lea rdx, [msg]
    mov r8d, msg_len
    lea r9, [written]
    sub rsp, 40              ; 32 shadow + 8 to keep 16-byte alignment
    xor eax, eax             ; (not required, but harmless)
    mov qword [rsp+32], 0    ; 5th arg = NULL (lpReserved) goes on stack
    call WriteConsoleA
    add rsp, 40

    ; ExitProcess(0)
    xor ecx, ecx
    call ExitProcess
