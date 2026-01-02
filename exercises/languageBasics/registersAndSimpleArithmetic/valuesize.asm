default rel
global _start
section .text
_start:
mov bx, 0b000000100000010       ; rbx = 258
add bl, bh                      ; bl = 00000011, bx = 000000100000011, rbx = 259
mov bh, 0                       ; bh = 00000000, bx = 000000000000011, rbx = 3 since we zero'd out the most significant bits (bh) of bx
mov rdi, rbx                    ; rbx = 3, rdi = 3
mov rax, 60
syscall