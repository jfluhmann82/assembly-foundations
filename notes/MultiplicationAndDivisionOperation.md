# Note on Multiplication and Division
The destination is always assumed to be `rax`.  You never list `rax` in the instruction, because it is there implicitly with the instruction.

`mul` Multiplies the source by `rax`.  `rax` is the destination.  A number cannot be used as the source; it must be a register or memory location.

`div` Divides `rax` by the source. `rax` is the destination.  A number cannot be used as the source; it must be a register or memory location.  The remainder is stored in another register, `rdx`, which should be set to zero before the instruciton occurs.

`rax` is known as the "accumulator" since it's often the implicit destination of arithmetic instructions (and thus it accumulates the restuls).