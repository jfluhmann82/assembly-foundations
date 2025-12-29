# Assembling and Linking on Windows

Using nasm on Windows is similar to linux. The process involves using the `nasm` assembler to generate object files and then linking them with a linker like `link.exe` provided by the Windows SDK.

Taking `hello.asm` as an example:

I find it easiest to use the `x64 Native Tools Command Prompt` since it sets the paths to `linker.exe` and all the lib files I need.  This console app can be found by searching for it in the Windows Start Menu, and it comes with Visual Studio.

If we assume the contents of `hello.asm` are:
```asm
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
```

We assemble it with `nasm -f win64 hello.asm -o hello.obj`
Since we have those extern functions, we will have to link it with windows `kernal32.lib`.

`link hello.obj /subsystem:console /entry:_start kernel32.lib`

The syntax for the linker can be explained like:

Think of this as answering four questions for Windows:
1. What code am I linking?
2. What kind of program is this?
3. Where does execution begin?
4. What external functions do I need?

and of course to run the program, we can use `hello.exe`