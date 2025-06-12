# GFortran AArch64 minimal

2025-06-12


```python
! gfortran --version
```

    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    Copyright (C) 2023 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    



```python
! as --version
```

    GNU assembler (GNU Binutils for Ubuntu) 2.42
    Copyright (C) 2024 Free Software Foundation, Inc.
    This program is free software; you may redistribute it under the terms of
    the GNU General Public License version 3 or later.
    This program has absolutely no warranty.
    This assembler was configured for a target of `aarch64-linux-gnu'.



```python
! ld --version
```

    GNU ld (GNU Binutils for Ubuntu) 2.42
    Copyright (C) 2024 Free Software Foundation, Inc.
    This program is free software; you may redistribute it under the terms of
    the GNU General Public License version 3 or (at your option) a later version.
    This program has absolutely no warranty.



```python
! gcc --version
```

    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    Copyright (C) 2023 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    



```python
%%writefile entry.s
/*
 * entry.s
 *
 * This is the actual entry point of our executable for Linux AArch64.
 * It's crucial for setting up the minimal environment before your Fortran code runs.
 *
 */
    .global _start  // Makes the _start label visible to the linker. This is where execution begins.
    .text           // Places the following code in the executable .text section.

_start:
    /* 1. Align the stack to a 16-byte boundary.
     * This step is vital for complying with the AArch64 ABI (Application Binary Interface).
     * We use a 4-instruction workaround due to specific assembler limitations previously encountered.
     */
    mov       x0, sp                  // Copy the current Stack Pointer (sp) value into x0.
    mov       x1, #0xFFFFFFFFFFFFFFF0 // Load the 16-byte alignment mask into x1.
    and       x0, x0, x1              // Apply the mask to x0.
    mov       sp, x0                  // Copy the aligned address back to sp.

    /* 2. Call our Fortran function.
     * Now that the stack is properly aligned, the 'fortran_main' function can execute correctly.
     * 'bl' (Branch with Link) saves the return address in the Link Register (lr/x30).
     */
    bl        fortran_main            // Call the fortran_main function. Its return value (42) will be placed in x0/w0.

    /* 3. Prepare for the 'exit' system call.
     * The return value from 'fortran_main' (42) is already correctly in x0/w0, which is
     * where the 'exit' syscall expects its status argument.
     */

    /* Put the syscall number for 'exit' (93) into register w8. */
    mov       w8, #93                 // Linux AArch64 syscall convention: syscall number goes into w8/x8.

    /* 4. Invoke the kernel to perform the system call. */
    svc       #0                      // 'Supervisor Call' instruction. This traps into the kernel, which then executes the 'exit' syscall based on w8 and x0.
    #0                              // This is an extraneous comment or instruction. It won't be executed as the program terminates after 'svc #0'.
```

    Overwriting entry.s



```python
! as entry.s -o entry.o
```

Why a FUNCTION instead of a PROGRAM?
-----------------------------------

1. **External Control**: A standard Fortran PROGRAM block is designed to be
   the primary entry point for a standalone Fortran application. It has
   its own built-in startup and shutdown routines managed by the Fortran
   runtime library.
3. **Minimal Executable Size**: Our goal is to create the smallest possible
   executable by writing our own `_start` entry point in Assembly. This
   Assembly code handles the very basic setup (like stack alignment) and
   then directly calls a specific function.
4. **Avoiding Fortran Runtime Overhead**: If we used a `PROGRAM` block,
  the gfortran compiler would automatically link in much more of the
   Fortran runtime library (libgfortran.a) and its own startup code.
   This would significantly increase the executable size, which goes
   against our goal of creating a "tiny" executable.
5. **C Interoperability (bind(C))**: By defining `fortran_main` as a
   `FUNCTION` and using `bind(C, name='fortran_main')`, we tell gfortran
   to create a function that follows the C calling conventions. This means
   its name in the object file will be exactly `fortran_main` (without
   any Fortran-specific mangling like underscores or case changes), making
  it easy for our Assembly `_start` routine to call it directly.



```python
%%writefile tiny_main.f90
! This is our Fortran "payload".
! It's not a PROGRAM, but a FUNCTION, so it can be called from elsewhere.
! We use bind(C) to ensure the symbol name in the object file
! is exactly "fortran_main", without any suffixes or case changes
! that gfortran might otherwise add.

integer function fortran_main() bind(C, name='fortran_main')
    implicit none  ! Requires all variables to be explicitly declared.
    fortran_main = 42 ! Assigns the value 42 as the return value of the function.
end function fortran_main
```

    Overwriting tiny_main.f90



```python
! gfortran -Os -c tiny_main.f90 -o tiny_main.o
```


```python
! ld -o a.out entry.o tiny_main.o --nmagic --strip-all
```


```python
! strip -R .eh_frame -R.comment a.out
```


```python
! wc -c a.out
```

    424 a.out



```python
! file a.out
```

    a.out: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, stripped



```python
! ./a.out ; echo $?
```

    42



```python
! size a.out
```

       text	   data	    bss	    dec	    hex	filename
         36	      0	      0	     36	     24	a.out



```python
! objdump -d a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    00000000004000b0 <.text>:
      4000b0:	910003e0 	mov	x0, sp
      4000b4:	928001e1 	mov	x1, #0xfffffffffffffff0    	// #-16
      4000b8:	8a010000 	and	x0, x0, x1
      4000bc:	9100001f 	mov	sp, x0
      4000c0:	94000003 	bl	0x4000cc
      4000c4:	52800ba8 	mov	w8, #0x5d                  	// #93
      4000c8:	d4000001 	svc	#0x0
      4000cc:	52800540 	mov	w0, #0x2a                  	// #42
      4000d0:	d65f03c0 	ret



```python
! objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000024  00000000004000b0  00000000004000b0  000000b0  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE



```python
! objdump -s a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Contents of section .text:
     4000b0 e0030091 e1018092 0000018a 1f000091  ................
     4000c0 03000094 a80b8052 010000d4 40058052  .......R....@..R
     4000d0 c0035fd6                             .._.            



```python
! hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  b0 00 40 00 00 00 00 00  |..........@.....|
    00000020  40 00 00 00 00 00 00 00  e8 00 00 00 00 00 00 00  |@...............|
    00000030  00 00 00 00 40 00 38 00  02 00 40 00 03 00 02 00  |....@.8...@.....|
    00000040  01 00 00 00 05 00 00 00  b0 00 00 00 00 00 00 00  |................|
    00000050  b0 00 40 00 00 00 00 00  b0 00 40 00 00 00 00 00  |..@.......@.....|
    00000060  24 00 00 00 00 00 00 00  24 00 00 00 00 00 00 00  |$.......$.......|
    00000070  08 00 00 00 00 00 00 00  51 e5 74 64 06 00 00 00  |........Q.td....|
    00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    000000a0  00 00 00 00 00 00 00 00  08 00 00 00 00 00 00 00  |................|
    000000b0  e0 03 00 91 e1 01 80 92  00 00 01 8a 1f 00 00 91  |................|
    000000c0  03 00 00 94 a8 0b 80 52  01 00 00 d4 40 05 80 52  |.......R....@..R|
    000000d0  c0 03 5f d6 00 2e 73 68  73 74 72 74 61 62 00 2e  |.._...shstrtab..|
    000000e0  74 65 78 74 00 00 00 00  00 00 00 00 00 00 00 00  |text............|
    000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000120  00 00 00 00 00 00 00 00  0b 00 00 00 01 00 00 00  |................|
    00000130  06 00 00 00 00 00 00 00  b0 00 40 00 00 00 00 00  |..........@.....|
    00000140  b0 00 00 00 00 00 00 00  24 00 00 00 00 00 00 00  |........$.......|
    00000150  00 00 00 00 00 00 00 00  04 00 00 00 00 00 00 00  |................|
    00000160  00 00 00 00 00 00 00 00  01 00 00 00 03 00 00 00  |................|
    00000170  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000180  d4 00 00 00 00 00 00 00  11 00 00 00 00 00 00 00  |................|
    00000190  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000001a0  00 00 00 00 00 00 00 00                           |........|
    000001a8



```python
! objdump -d a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    00000000004000b0 <.text>:
      4000b0:	910003e0 	mov	x0, sp
      4000b4:	928001e1 	mov	x1, #0xfffffffffffffff0    	// #-16
      4000b8:	8a010000 	and	x0, x0, x1
      4000bc:	9100001f 	mov	sp, x0
      4000c0:	94000003 	bl	0x4000cc
      4000c4:	52800ba8 	mov	w8, #0x5d                  	// #93
      4000c8:	d4000001 	svc	#0x0
      4000cc:	52800540 	mov	w0, #0x2a                  	// #42
      4000d0:	d65f03c0 	ret



```python

```
