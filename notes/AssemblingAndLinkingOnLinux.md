# Linux assembly and linking notes

to assemble and link code on Linux:
* `nasm -f elf64 file.asm -o file.o`
* `ld file.o -o file`