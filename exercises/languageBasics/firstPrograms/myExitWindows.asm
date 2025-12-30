default rel

extern ExitProcess

global _start

section .text

_start:
    sub rsp, 40                     ; windows ABI requires 32 bytes of shadow space on rsp to keep stack aligned
                                    ; ExitProcess will push return address (always 8 bytes)  8 + 32 = 40;
    mov ecx, 3                      ; make the return code 3
    call ExitProcess

    ; this return code can be confirmed in powershell via `echo %ERRORLEVEL%` after running this as an executable.