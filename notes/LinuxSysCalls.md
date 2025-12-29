# Linux System Calls
Linux system call table can usually be found at /usr/include/x86_64-linux-gnu/asm/unistd_64.h

The official reference is at https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl

Can also get some information on them from:
* man syscall
* man syscalls
* man 2 write
* man 2 exit

A note on the `2` in the `man` commands.  This provides the syscall’s C signature and argument semantics, which is more useful
than `man write` or `man exit` alone.



## How System calls arguments are passed
This is the gospel of the Linux **x86-64** syscall ABI (Application Binary Interface):

| Purpose        | Register  |
|----------------|-----------|
| syscall number | `rax`     |
| arg1           | `rdi`     |
| arg2           | `rsi`     |
| arg3           | `rdx`     |
| arg4           | `r10`     |
| arg5           | `r8`      |
| arg6           | `r9`      |

### Clobbered registers
The `syscall` instruction clobbers:
* `rcx`
* `r11`

> Note: `rcx` and `r11` are clobbered because the `syscall` instruction itself uses them
during the privilege-level transition.

These must not be relied upon across a syscall.

## How return values and errors work
* Success -> `rax >= 0` (return value)
* Error -> `rax < 0` (negative errno, e.g. `-ENOENT`)

> Note: The kernel reserves small negative values for error codes; libc typically treats
returns in the range `[-4095, -1]` as errors.

### Example: write syscall
C signature:
ssize_t write(int fd, const void *buf, size_t count);

Register mapping:
* `rax` = 1 (sys_write)
* `rdi` = fd
* `rsi` = buf
* `rdx` = count

## Rules of Thumb
* Syscalls take at most 6 arguments
* More complex data is passed via pointers to structs
* If it is not documented in `man 2`, it should not be used
* Syscall numbers are architecture- and OS-specific
