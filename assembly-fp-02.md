```python
%%writefile double_float.s
.global _start
.section .rodata
double_number: .double 3.141592653589793
format: .asciz "%lf\n"  // Use "%lf" for double precision

.section .text
_start:
    ADR x0, double_number  // Load address of the double-precision float
    LDR d0, [x0]           // Load the 64-bit floating-point value directly into d0

    ADR x0, format         // Load address of the format string
    BL printf              // Call printf

    MOV w8, 93             // Exit syscall number (Linux `exit`)
    MOV x0, 0              // Exit status
    SVC 0                  // System call to exit
```

    Overwriting double_float.s



```python
! clang -nostdlib -s -Os -Wl,--gc-sections -Wl,--strip-all -Wl,--discard-all -o double_float double_float.s -lc
```


```python
! strip --strip-all --remove-section=.comment --remove-section=.note double_float double_float
```


```python
! ./double_float
```

    3.141593



```python

```
