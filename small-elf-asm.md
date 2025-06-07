# Small ELF ASM

2025-06-07

Based on: <https://stackoverflow.com/questions/53382589/smallest-executable-program-x86-64-linux>


```python
! as --version
```

    GNU assembler (GNU Binutils) 2.44
    Copyright (C) 2025 Free Software Foundation, Inc.
    This program is free software; you may redistribute it under the terms of
    the GNU General Public License version 3 or later.
    This program has absolutely no warranty.
    This assembler was configured for a target of `aarch64-linux-android'.



```python
! ld --version
```

    GNU ld (GNU Binutils) 2.44
    Copyright (C) 2025 Free Software Foundation, Inc.
    This program is free software; you may redistribute it under the terms of
    the GNU General Public License version 3 or (at your option) a later version.
    This program has absolutely no warranty.



```python
! clang --version
```

    clang version 20.1.6
    Target: aarch64-unknown-linux-android24
    Thread model: posix
    InstalledDir: /data/data/com.termux/files/usr/bin



```python
%%writefile tiny.s
    .arch armv8-a
    .section .text
    .globl _start
    .type _start, %function

_start:
    mov     x8, #93      // Syscall number for _exit (93)
    mov     x0, #42      // Exit code argument
    svc     #0           // Perform syscall
```

    Overwriting tiny.s



```bash
%%bash
clang -Oz -static -nostdlib -nostartfiles -fno-exceptions \
  -Wl,--gc-sections,--strip-all,--build-id=none \
  -Wl,-z,notext,-z,norelro,-z,noseparate-code,--omagic,--nmagic \
  -Wl,-z,max-page-size=1,-z,common-page-size=1 \
  -Wl,--no-dynamic-linker \
  tiny.s -o tiny
strip --strip-section-headers tiny
```

    ld.lld: warning: -z max-page-size set, but paging disabled by omagic or nmagic
    ld.lld: warning: -z common-page-size set, but paging disabled by omagic or nmagic



```python
! wc -c tiny
```

    188 tiny



```python
! ./tiny; echo $?
```

    42



```python
! size tiny
```

       text	   data	    bss	    dec	    hex	filename
          0	      0	      0	      0	      0	tiny



```python
! objdump -h tiny
```

    
    tiny:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn



```python
! objdump -d tiny
```

    
    tiny:     file format elf64-littleaarch64
    



```python
! objdump -s tiny
```

    
    tiny:     file format elf64-littleaarch64
    



```python
! hexdump -C tiny
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  b0 00 20 00 00 00 00 00  |.......... .....|
    00000020  40 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
    00000030  00 00 00 00 40 00 38 00  02 00 00 00 00 00 00 00  |....@.8.........|
    00000040  01 00 00 00 07 00 00 00  b0 00 00 00 00 00 00 00  |................|
    00000050  b0 00 20 00 00 00 00 00  b0 00 20 00 00 00 00 00  |.. ....... .....|
    00000060  0c 00 00 00 00 00 00 00  0c 00 00 00 00 00 00 00  |................|
    00000070  04 00 00 00 00 00 00 00  51 e5 74 64 06 00 00 00  |........Q.td....|
    00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    000000b0  a8 0b 80 d2 40 05 80 d2  01 00 00 d4              |....@.......|
    000000bc



```python

```

## Using as


```bash
%%bash
as -o tiny.o tiny.s
ld tiny.o -o tiny
strip --strip-all --strip-section-headers tiny
```


```python
! wc -c tiny
```

    132 tiny



```python
! ./tiny; echo $?
```

    42



```python
! size tiny
```

       text	   data	    bss	    dec	    hex	filename
          0	      0	      0	      0	      0	tiny



```python
! objdump -h tiny
```

    
    tiny:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn



```python
! objdump -d tiny
```

    
    tiny:     file format elf64-littleaarch64
    



```python
! objdump -s tiny
```

    
    tiny:     file format elf64-littleaarch64
    



```python
! hexdump -C tiny
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  78 00 40 00 00 00 00 00  |........x.@.....|
    00000020  40 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
    00000030  00 00 00 00 40 00 38 00  01 00 00 00 00 00 00 00  |....@.8.........|
    00000040  01 00 00 00 05 00 00 00  78 00 00 00 00 00 00 00  |........x.......|
    00000050  78 00 40 00 00 00 00 00  78 00 40 00 00 00 00 00  |x.@.....x.@.....|
    00000060  0c 00 00 00 00 00 00 00  0c 00 00 00 00 00 00 00  |................|
    00000070  04 00 00 00 00 00 00 00  a8 0b 80 d2 40 05 80 d2  |............@...|
    00000080  01 00 00 d4                                       |....|
    00000084


A minimal ELF executable usually consists of:

- ELF Header (Elf64_Ehdr): 64 bytes for AArch64. Contains essential metadata about the file (type, architecture, entry point, offsets to tables).
- Program Header Table (Elf64_Phdr): Each entry describes a segment of the program to be loaded into memory. For a minimal executable, you usually need only one segment (PT_LOAD) for the code. An Elf64_Phdr entry is 56 bytes for AArch64.
- Executable Code (.text): Your assembly instructions. In this case, mov x8, #93, mov x0, #42, svc #0 total 12 bytes.

Therefore, the theoretical minimum size for a valid ELF executable with a single load segment is:

64(ELF Header)+56(Program Header)+12(Your code)=132 bytes.

The difference between the **188-byte** and **132-byte** executables comes down to **extra ELF headers, alignment padding, and Clang's default linking behavior**. Here’s why:

### **1. Extra ELF Metadata in the 188-Byte Executable**
- When compiled with **Clang**, extra metadata is included, such as:
  - **Build ID** (`--build-id=none` helps remove this, but Clang might still leave some traces).
  - **Additional ELF headers** defining unnecessary sections.
  - **Extra alignment padding** added by Clang’s linker.

- Example of excess padding in the **188-byte hexdump**:
  ```
  00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  ```
  This section consists of **empty bytes**, adding unnecessary space.

### **2. Leaner ELF Structure in the 132-Byte Executable**
- When assembled using **`as` (GNU assembler) and linked with `ld`**, the binary becomes **more compact** because:
  - It does not include **extra ELF headers** that Clang normally adds.
  - Padding is minimized in ELF segments.
  - **Direct linking with `ld` avoids Clang-specific metadata.**

- Example of optimized hexdump in the **132-byte version**:
  ```
  00000070  04 00 00 00 00 00 00 00  a8 0b 80 d2 40 05 80 d2  |............@...|
  00000080  01 00 00 d4                                       |....|
  ```
  The **code starts immediately**, without excess padding.

### **Summary**
- **188-byte executable (Clang):** Contains extra ELF headers, metadata, and padding.
- **132-byte executable (`as` + `ld`):** Removes unnecessary ELF structures, reducing size.

---


```python
%%writefile hello.s
.arch armv8-a

.section .data
.global helloworld
.global helloworld_len

helloworld:
    .ascii "Hello, World!\n"
    .balign 4   /* Garante que o próximo valor seja múltiplo de 4 */
helloworld_len:
    .long . - helloworld  /* Armazena explicitamente o tamanho */

.section .text
.global _start
.type _start, %function

_start:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov     x0, #1               /* fd := STDOUT_FILENO */
    adrp    x1, helloworld       /* buf := msg (usa adrp + add) */
    add     x1, x1, :lo12:helloworld
    ldr     w2, helloworld_len   /* count := len */
    mov     w8, #64              /* write é syscall #64 */
    svc     #0                   /* Executa a chamada do sistema */

    /* syscall exit(int status) */
    mov     x0, #0               /* status := 0 */
    mov     w8, #93              /* exit é syscall #93 */
    svc     #0                   /* Executa a chamada do sistema */
```

    Overwriting hello.s


Only one section:


```python
%%writefile hello.s
.arch armv8-a
.section .text
.globl _start
.type _start, %function

_start:
    /* write(1, msg, len) */
    mov     x0, #1                // fd = stdout
    adr     x1, msg               // carrega endereço da string
    mov     x2, #13               // comprimento da string (sem \n?)
    mov     w8, #64               // syscall write
    svc     #0

    /* exit(0) */
    mov     x0, #0                // status = 0
    mov     w8, #93               // syscall exit
    svc     #0

msg:
    .ascii "Hello, World!\n"
```

    Overwriting hello.s



```bash
%%bash
as -o hello.o hello.s
ld -o hello.elf hello.o
strip --strip-all --strip-section-headers hello.elf
```


```python
! ./hello.elf
```

    Hello, World!


```python
! wc -c hello.elf
```

    166 hello.elf



```python
! size hello.elf
```

       text	   data	    bss	    dec	    hex	filename
          0	      0	      0	      0	      0	hello.elf



```python
! objdump -h hello.elf
```

    
    hello.elf:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn



```python
! objdump -s hello.elf
```

    
    hello.elf:     file format elf64-littleaarch64
    



```python
! objdump -D -j .text hello.elf
```

    
    hello.elf:     file format elf64-littleaarch64
    
    objdump: section '.text' mentioned in a -j option, but not found in any input file



```python
! objdump -d hello.elf
```

    
    hello.elf:     file format elf64-littleaarch64
    



```python
! hexdump -C hello.elf
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  78 00 40 00 00 00 00 00  |........x.@.....|
    00000020  40 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
    00000030  00 00 00 00 40 00 38 00  01 00 00 00 00 00 00 00  |....@.8.........|
    00000040  01 00 00 00 05 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000050  00 00 40 00 00 00 00 00  00 00 40 00 00 00 00 00  |..@.......@.....|
    00000060  a6 00 00 00 00 00 00 00  a6 00 00 00 00 00 00 00  |................|
    00000070  00 00 01 00 00 00 00 00  20 00 80 d2 e1 00 00 10  |........ .......|
    00000080  a2 01 80 d2 08 08 80 52  01 00 00 d4 00 00 80 d2  |.......R........|
    00000090  a8 0b 80 52 01 00 00 d4  48 65 6c 6c 6f 2c 20 57  |...R....Hello, W|
    000000a0  6f 72 6c 64 21 0a                                 |orld!.|
    000000a6



```python

```


```python

```

---


```python
%%writefile tiny.s
    .arch armv8-a
    .section .text
    .align 1
    .globl _start
    .type _start, %function

_start:
    mov     x8, #93      // Syscall number for _exit (93)
    mov     x0, #42      // Exit code argument
    svc     #0           // Perform syscall
```

    Overwriting tiny.s



```bash
%%bash
as -o tiny.o tiny.s
ld  --no-dynamic-linker -s -z max-page-size=1 --omagic --nmagic -no-pie -z noseparate-code tiny.o -o tiny
strip --strip-section-headers tiny
```


```python
! ./tiny ; echo $?
```

    42



```python
! wc -c tiny
```

    132 tiny



```python

```
