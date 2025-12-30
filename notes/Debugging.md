# Debugging Notes

I'm using gdb to step through my code.  One note is that I can tell it to use intel syntax 
via the command `set disassembly-flavor intel`.  This can also be placed in `~/.gdbinit` to make it permanent
for all gdb sessions.

Running `gdb myProgram` will start gdb.

Next I like to set my breakpoints `break *_start`.

Next I can start the run with `run`.

Now I can disassemble the code with `disassemble` to see how the code looks.

# Useful Commands I like
* `disassemble` - this will show the disassembly of the code.
* `stepi` - this will step through the code one instruction at a time.
* `continue` - this will continue running the program until it reaches a breakpoint.
* `print *ADDRESS` - this will print the value of the variable at the address specified.
* `info registers` - this will show the data in the registers.
* `info break` - this will show the breakpoints.

To delete a breakpoint use `delete NUMBER` where number is the breakpoint number from `info break`.
I can also add breakpoints with `break ADDRESS`.  ADDRESS is the address of the instruction I want to break on which I can see in `disassemble`.

Official documentation for GDB can be found [here](https://sourceware.org/gdb/current/onlinedocs/gdb/).