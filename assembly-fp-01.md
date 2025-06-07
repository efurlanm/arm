```python
%%writefile multiply_double.s
.global _start

.section .text
_start:
    // Load double-precision floating-point values into NEON/FP registers
    // d0 and d1 are double-precision (64-bit) registers

    ldr d0, .LC0         // Load 3.1415926535 from literal pool into D0
    ldr d1, .LC1         // Load 2.7182818284 from literal pool into D1

    // Multiply d0 by d1 and store the result in d2
    fmul d2, d0, d1      // d2 = d0 * d1

    // ===============================================
    // Here you would typically do something with the result in d2,
    // such as printing, storing to memory, etc.
    // For this simple example, we'll just exit.
    // ===============================================

    // Code to exit the program (syscall exit)
    mov x8, #93          // sys_exit (syscall number for exit on aarch64 Linux)
    mov x0, #0           // Exit code 0 (success)
    svc #0               // Call supervisor (execute syscall)

.section .data
.align 8             // Ensure 8-byte alignment for doubles (64 bits)
.LC0: .double 3.1415926535   // Define double-precision floating-point constant
.LC1: .double 2.7182818284   // Define double-precision floating-point constant
```

    Writing multiply_double.s



```python
! rm multiply_double.o multiply_double.elf
```

    rm: cannot remove 'multiply_double.o': No such file or directory
    rm: cannot remove 'multiply_double.elf': No such file or directory



```python
! clang -o multiply_double.elf multiply_double.s -nostdlib
```


```python
! strip --strip-all --remove-section=.comment --remove-section=.note multiply_double.elf multiply_double.elf
```


```python
! ./multiply_double.elf
```

or:


```python
! rm multiply_double.o multiply_double.elf
```

    rm: cannot remove 'multiply_double.o': No such file or directory



```python
! as -o multiply_double.o multiply_double.s
```


```python
! ld.lld -pie -o multiply_double.elf multiply_double.o
```


```python
! ./multiply_double.elf
```
