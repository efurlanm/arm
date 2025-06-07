# Understanding executables

Running on a laptop with an i7-9750H processor

* https://stackoverflow.com/questions/200292/process-for-reducing-the-size-of-an-executable
* http://www.muppetlabs.com/~breadbox/software/tiny/
* https://stac47.github.io/c/relocation/elf/tutorial/2018/03/01/understanding-relocation-elf.html
* http://timelessname.com/elfbin/


```python
!lscpu
```

    Architecture:            x86_64
      CPU op-mode(s):        32-bit, 64-bit
      Address sizes:         39 bits physical, 48 bits virtual
      Byte Order:            Little Endian
    CPU(s):                  12
      On-line CPU(s) list:   0-11
    Vendor ID:               GenuineIntel
      Model name:            Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
        CPU family:          6
        Model:               158
        Thread(s) per core:  2
        Core(s) per socket:  6
        Socket(s):           1
        Stepping:            10
        CPU max MHz:         4500,0000
        CPU min MHz:         800,0000
        BogoMIPS:            5199.98
        Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc
                             a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss 
                             ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art
                              arch_perfmon pebs bts rep_good nopl xtopology nonstop_
                             tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cp
                             l vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
                              sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsav
                             e avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault
                              epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow
                              vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust 
                             bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap cl
                             flushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm
                              ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
                              md_clear flush_l1d arch_capabilities
    Virtualization features: 
      Virtualization:        VT-x
    Caches (sum of all):     
      L1d:                   192 KiB (6 instances)
      L1i:                   192 KiB (6 instances)
      L2:                    1,5 MiB (6 instances)
      L3:                    12 MiB (1 instance)
    NUMA:                    
      NUMA node(s):          1
      NUMA node0 CPU(s):     0-11
    Vulnerabilities:         
      Itlb multihit:         KVM: Mitigation: VMX disabled
      L1tf:                  Mitigation; PTE Inversion; VMX conditional cache flushe
                             s, SMT vulnerable
      Mds:                   Mitigation; Clear CPU buffers; SMT vulnerable
      Meltdown:              Mitigation; PTI
      Mmio stale data:       Mitigation; Clear CPU buffers; SMT vulnerable
      Retbleed:              Mitigation; IBRS
      Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
                              and seccomp
      Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer
                              sanitization
      Spectre v2:            Mitigation; IBRS, IBPB conditional, RSB filling, PBRSB-
                             eIBRS Not affected
      Srbds:                 Mitigation; Microcode
      Tsx async abort:       Not affected



```python
%%writefile helloworld.c
#include <stdio.h>
extern int puts(const char *);
void main(void)
{
    puts("Hello, world!");
}
```

    Overwriting helloworld.c



```python
! gcc helloworld.c
```


```python
! ls -gG a.out
```

    -rwxrwxr-x 1 16704 set 10 20:34 a.out



```python
! ./a.out
```

    Hello, world!


-s  Remove all symbol table and relocation information from the executable.


```python
! gcc -s helloworld.c 
```


```python
! ls -gG a.out
```

    -rwxrwxr-x 1 14472 set 10 20:38 a.out


-nostartfiles    Do not use the standard system startup files when linking. The standard libraries are used normally. 


```python
! gcc -s -nostartfiles helloworld.c 
```

    /usr/bin/ld: warning: cannot find entry symbol _start; defaulting to 0000000000001030



```python
! ls -gG a.out
```

    -rwxrwxr-x 1 13808 set 10 20:40 a.out



```python
%%writefile tiny.c
int main(void)
{
    return 42;
}
```

    Writing tiny.c



```python
! gcc tiny.c
```


```python
! ./a.out ; echo $?  # $? = last command return
```

    42



```python
! ls -gG a.out
```

    -rwxrwxr-x 1 16464 set 10 20:45 a.out



```python
! wc -c a.out
```

    16464 a.out



```python

```


```python

```


```python
! gcc -s -nostartfiles -nostdlib tiny.c
```

    /usr/bin/ld: warning: cannot find entry symbol _start; defaulting to 0000000000001000



```python
! ls -gG a.out
```

    -rwxrwxr-x 1 13296 set 10 20:46 a.out



```python
! objdump -x a.out
```

    
    a.out:     file format elf64-x86-64
    a.out
    architecture: i386:x86-64, flags 0x00000150:
    HAS_SYMS, DYNAMIC, D_PAGED
    start address 0x0000000000001000
    
    Program Header:
        PHDR off    0x0000000000000040 vaddr 0x0000000000000040 paddr 0x0000000000000040 align 2**3
             filesz 0x00000000000002d8 memsz 0x00000000000002d8 flags r--
      INTERP off    0x0000000000000318 vaddr 0x0000000000000318 paddr 0x0000000000000318 align 2**0
             filesz 0x000000000000001c memsz 0x000000000000001c flags r--
        LOAD off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**12
             filesz 0x00000000000003b9 memsz 0x00000000000003b9 flags r--
        LOAD off    0x0000000000001000 vaddr 0x0000000000001000 paddr 0x0000000000001000 align 2**12
             filesz 0x000000000000000f memsz 0x000000000000000f flags r-x
        LOAD off    0x0000000000002000 vaddr 0x0000000000002000 paddr 0x0000000000002000 align 2**12
             filesz 0x0000000000000050 memsz 0x0000000000000050 flags r--
        LOAD off    0x0000000000002f20 vaddr 0x0000000000003f20 paddr 0x0000000000003f20 align 2**12
             filesz 0x00000000000000e0 memsz 0x00000000000000e0 flags rw-
     DYNAMIC off    0x0000000000002f20 vaddr 0x0000000000003f20 paddr 0x0000000000003f20 align 2**3
             filesz 0x00000000000000e0 memsz 0x00000000000000e0 flags rw-
        NOTE off    0x0000000000000338 vaddr 0x0000000000000338 paddr 0x0000000000000338 align 2**3
             filesz 0x0000000000000020 memsz 0x0000000000000020 flags r--
        NOTE off    0x0000000000000358 vaddr 0x0000000000000358 paddr 0x0000000000000358 align 2**2
             filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--
    0x6474e553 off    0x0000000000000338 vaddr 0x0000000000000338 paddr 0x0000000000000338 align 2**3
             filesz 0x0000000000000020 memsz 0x0000000000000020 flags r--
    EH_FRAME off    0x0000000000002000 vaddr 0x0000000000002000 paddr 0x0000000000002000 align 2**2
             filesz 0x0000000000000014 memsz 0x0000000000000014 flags r--
       STACK off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**4
             filesz 0x0000000000000000 memsz 0x0000000000000000 flags rw-
       RELRO off    0x0000000000002f20 vaddr 0x0000000000003f20 paddr 0x0000000000003f20 align 2**0
             filesz 0x00000000000000e0 memsz 0x00000000000000e0 flags r--
    
    Dynamic Section:
      GNU_HASH             0x0000000000000380
      STRTAB               0x00000000000003b8
      SYMTAB               0x00000000000003a0
      STRSZ                0x0000000000000001
      SYMENT               0x0000000000000018
      DEBUG                0x0000000000000000
      FLAGS                0x0000000000000008
      FLAGS_1              0x0000000008000001
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .interp       0000001c  0000000000000318  0000000000000318  00000318  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      1 .note.gnu.property 00000020  0000000000000338  0000000000000338  00000338  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      2 .note.gnu.build-id 00000024  0000000000000358  0000000000000358  00000358  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      3 .gnu.hash     0000001c  0000000000000380  0000000000000380  00000380  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      4 .dynsym       00000018  00000000000003a0  00000000000003a0  000003a0  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      5 .dynstr       00000001  00000000000003b8  00000000000003b8  000003b8  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      6 .text         0000000f  0000000000001000  0000000000001000  00001000  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      7 .eh_frame_hdr 00000014  0000000000002000  0000000000002000  00002000  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      8 .eh_frame     00000038  0000000000002018  0000000000002018  00002018  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      9 .dynamic      000000e0  0000000000003f20  0000000000003f20  00002f20  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     10 .comment      0000002a  0000000000000000  0000000000000000  00003000  2**0
                      CONTENTS, READONLY
    SYMBOL TABLE:
    no symbols
    
    



```python
! hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  03 00 3e 00 01 00 00 00  00 10 00 00 00 00 00 00  |..>.............|
    00000020  40 00 00 00 00 00 00 00  b0 30 00 00 00 00 00 00  |@........0......|
    00000030  00 00 00 00 40 00 38 00  0d 00 40 00 0d 00 0c 00  |....@.8...@.....|
    00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
    00000050  40 00 00 00 00 00 00 00  40 00 00 00 00 00 00 00  |@.......@.......|
    00000060  d8 02 00 00 00 00 00 00  d8 02 00 00 00 00 00 00  |................|
    00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
    00000080  18 03 00 00 00 00 00 00  18 03 00 00 00 00 00 00  |................|
    00000090  18 03 00 00 00 00 00 00  1c 00 00 00 00 00 00 00  |................|
    000000a0  1c 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000000b0  01 00 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
    000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000000d0  b9 03 00 00 00 00 00 00  b9 03 00 00 00 00 00 00  |................|
    000000e0  00 10 00 00 00 00 00 00  01 00 00 00 05 00 00 00  |................|
    000000f0  00 10 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
    00000100  00 10 00 00 00 00 00 00  0f 00 00 00 00 00 00 00  |................|
    00000110  0f 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
    00000120  01 00 00 00 04 00 00 00  00 20 00 00 00 00 00 00  |......... ......|
    00000130  00 20 00 00 00 00 00 00  00 20 00 00 00 00 00 00  |. ....... ......|
    00000140  50 00 00 00 00 00 00 00  50 00 00 00 00 00 00 00  |P.......P.......|
    00000150  00 10 00 00 00 00 00 00  01 00 00 00 06 00 00 00  |................|
    00000160  20 2f 00 00 00 00 00 00  20 3f 00 00 00 00 00 00  | /...... ?......|
    00000170  20 3f 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  | ?..............|
    00000180  e0 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
    00000190  02 00 00 00 06 00 00 00  20 2f 00 00 00 00 00 00  |........ /......|
    000001a0  20 3f 00 00 00 00 00 00  20 3f 00 00 00 00 00 00  | ?...... ?......|
    000001b0  e0 00 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  |................|
    000001c0  08 00 00 00 00 00 00 00  04 00 00 00 04 00 00 00  |................|
    000001d0  38 03 00 00 00 00 00 00  38 03 00 00 00 00 00 00  |8.......8.......|
    000001e0  38 03 00 00 00 00 00 00  20 00 00 00 00 00 00 00  |8....... .......|
    000001f0  20 00 00 00 00 00 00 00  08 00 00 00 00 00 00 00  | ...............|
    00000200  04 00 00 00 04 00 00 00  58 03 00 00 00 00 00 00  |........X.......|
    00000210  58 03 00 00 00 00 00 00  58 03 00 00 00 00 00 00  |X.......X.......|
    00000220  24 00 00 00 00 00 00 00  24 00 00 00 00 00 00 00  |$.......$.......|
    00000230  04 00 00 00 00 00 00 00  53 e5 74 64 04 00 00 00  |........S.td....|
    00000240  38 03 00 00 00 00 00 00  38 03 00 00 00 00 00 00  |8.......8.......|
    00000250  38 03 00 00 00 00 00 00  20 00 00 00 00 00 00 00  |8....... .......|
    00000260  20 00 00 00 00 00 00 00  08 00 00 00 00 00 00 00  | ...............|
    00000270  50 e5 74 64 04 00 00 00  00 20 00 00 00 00 00 00  |P.td..... ......|
    00000280  00 20 00 00 00 00 00 00  00 20 00 00 00 00 00 00  |. ....... ......|
    00000290  14 00 00 00 00 00 00 00  14 00 00 00 00 00 00 00  |................|
    000002a0  04 00 00 00 00 00 00 00  51 e5 74 64 06 00 00 00  |........Q.td....|
    000002b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    000002d0  00 00 00 00 00 00 00 00  10 00 00 00 00 00 00 00  |................|
    000002e0  52 e5 74 64 04 00 00 00  20 2f 00 00 00 00 00 00  |R.td.... /......|
    000002f0  20 3f 00 00 00 00 00 00  20 3f 00 00 00 00 00 00  | ?...... ?......|
    00000300  e0 00 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  |................|
    00000310  01 00 00 00 00 00 00 00  2f 6c 69 62 36 34 2f 6c  |......../lib64/l|
    00000320  64 2d 6c 69 6e 75 78 2d  78 38 36 2d 36 34 2e 73  |d-linux-x86-64.s|
    00000330  6f 2e 32 00 00 00 00 00  04 00 00 00 10 00 00 00  |o.2.............|
    00000340  05 00 00 00 47 4e 55 00  02 00 00 c0 04 00 00 00  |....GNU.........|
    00000350  03 00 00 00 00 00 00 00  04 00 00 00 14 00 00 00  |................|
    00000360  03 00 00 00 47 4e 55 00  55 09 76 ac 2c c8 7d 45  |....GNU.U.v.,.}E|
    00000370  96 53 c3 2f 07 6e 2f ab  f1 fe c9 37 00 00 00 00  |.S./.n/....7....|
    00000380  01 00 00 00 01 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000390  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00001000  f3 0f 1e fa 55 48 89 e5  b8 2a 00 00 00 5d c3 00  |....UH...*...]..|
    00001010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00002000  01 1b 03 3b 14 00 00 00  01 00 00 00 00 f0 ff ff  |...;............|
    00002010  30 00 00 00 00 00 00 00  14 00 00 00 00 00 00 00  |0...............|
    00002020  01 7a 52 00 01 78 10 01  1b 0c 07 08 90 01 00 00  |.zR..x..........|
    00002030  1c 00 00 00 1c 00 00 00  c8 ef ff ff 0f 00 00 00  |................|
    00002040  00 45 0e 10 86 02 43 0d  06 46 0c 07 08 00 00 00  |.E....C..F......|
    00002050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00002f20  f5 fe ff 6f 00 00 00 00  80 03 00 00 00 00 00 00  |...o............|
    00002f30  05 00 00 00 00 00 00 00  b8 03 00 00 00 00 00 00  |................|
    00002f40  06 00 00 00 00 00 00 00  a0 03 00 00 00 00 00 00  |................|
    00002f50  0a 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00002f60  0b 00 00 00 00 00 00 00  18 00 00 00 00 00 00 00  |................|
    00002f70  15 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00002f80  1e 00 00 00 00 00 00 00  08 00 00 00 00 00 00 00  |................|
    00002f90  fb ff ff 6f 00 00 00 00  01 00 00 08 00 00 00 00  |...o............|
    00002fa0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00003000  47 43 43 3a 20 28 55 62  75 6e 74 75 20 39 2e 33  |GCC: (Ubuntu 9.3|
    00003010  2e 30 2d 31 37 75 62 75  6e 74 75 31 7e 32 30 2e  |.0-17ubuntu1~20.|
    00003020  30 34 29 20 39 2e 33 2e  30 00 00 2e 73 68 73 74  |04) 9.3.0...shst|
    00003030  72 74 61 62 00 2e 69 6e  74 65 72 70 00 2e 6e 6f  |rtab..interp..no|
    00003040  74 65 2e 67 6e 75 2e 70  72 6f 70 65 72 74 79 00  |te.gnu.property.|
    00003050  2e 6e 6f 74 65 2e 67 6e  75 2e 62 75 69 6c 64 2d  |.note.gnu.build-|
    00003060  69 64 00 2e 67 6e 75 2e  68 61 73 68 00 2e 64 79  |id..gnu.hash..dy|
    00003070  6e 73 79 6d 00 2e 64 79  6e 73 74 72 00 2e 74 65  |nsym..dynstr..te|
    00003080  78 74 00 2e 65 68 5f 66  72 61 6d 65 5f 68 64 72  |xt..eh_frame_hdr|
    00003090  00 2e 65 68 5f 66 72 61  6d 65 00 2e 64 79 6e 61  |..eh_frame..dyna|
    000030a0  6d 69 63 00 2e 63 6f 6d  6d 65 6e 74 00 00 00 00  |mic..comment....|
    000030b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    000030f0  0b 00 00 00 01 00 00 00  02 00 00 00 00 00 00 00  |................|
    00003100  18 03 00 00 00 00 00 00  18 03 00 00 00 00 00 00  |................|
    00003110  1c 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00003120  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00003130  13 00 00 00 07 00 00 00  02 00 00 00 00 00 00 00  |................|
    00003140  38 03 00 00 00 00 00 00  38 03 00 00 00 00 00 00  |8.......8.......|
    00003150  20 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  | ...............|
    00003160  08 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00003170  26 00 00 00 07 00 00 00  02 00 00 00 00 00 00 00  |&...............|
    00003180  58 03 00 00 00 00 00 00  58 03 00 00 00 00 00 00  |X.......X.......|
    00003190  24 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |$...............|
    000031a0  04 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000031b0  39 00 00 00 f6 ff ff 6f  02 00 00 00 00 00 00 00  |9......o........|
    000031c0  80 03 00 00 00 00 00 00  80 03 00 00 00 00 00 00  |................|
    000031d0  1c 00 00 00 00 00 00 00  05 00 00 00 00 00 00 00  |................|
    000031e0  08 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000031f0  43 00 00 00 0b 00 00 00  02 00 00 00 00 00 00 00  |C...............|
    00003200  a0 03 00 00 00 00 00 00  a0 03 00 00 00 00 00 00  |................|
    00003210  18 00 00 00 00 00 00 00  06 00 00 00 01 00 00 00  |................|
    00003220  08 00 00 00 00 00 00 00  18 00 00 00 00 00 00 00  |................|
    00003230  4b 00 00 00 03 00 00 00  02 00 00 00 00 00 00 00  |K...............|
    00003240  b8 03 00 00 00 00 00 00  b8 03 00 00 00 00 00 00  |................|
    00003250  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00003270  53 00 00 00 01 00 00 00  06 00 00 00 00 00 00 00  |S...............|
    00003280  00 10 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
    00003290  0f 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000032a0  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000032b0  59 00 00 00 01 00 00 00  02 00 00 00 00 00 00 00  |Y...............|
    000032c0  00 20 00 00 00 00 00 00  00 20 00 00 00 00 00 00  |. ....... ......|
    000032d0  14 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000032e0  04 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000032f0  67 00 00 00 01 00 00 00  02 00 00 00 00 00 00 00  |g...............|
    00003300  18 20 00 00 00 00 00 00  18 20 00 00 00 00 00 00  |. ....... ......|
    00003310  38 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |8...............|
    00003320  08 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00003330  71 00 00 00 06 00 00 00  03 00 00 00 00 00 00 00  |q...............|
    00003340  20 3f 00 00 00 00 00 00  20 2f 00 00 00 00 00 00  | ?...... /......|
    00003350  e0 00 00 00 00 00 00 00  06 00 00 00 00 00 00 00  |................|
    00003360  08 00 00 00 00 00 00 00  10 00 00 00 00 00 00 00  |................|
    00003370  7a 00 00 00 01 00 00 00  30 00 00 00 00 00 00 00  |z.......0.......|
    00003380  00 00 00 00 00 00 00 00  00 30 00 00 00 00 00 00  |.........0......|
    00003390  2a 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |*...............|
    000033a0  01 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000033b0  01 00 00 00 03 00 00 00  00 00 00 00 00 00 00 00  |................|
    000033c0  00 00 00 00 00 00 00 00  2a 30 00 00 00 00 00 00  |........*0......|
    000033d0  83 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000033e0  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000033f0



```python
! strip --strip-all --verbose a.out
```

    copy from `a.out' [elf64-x86-64] to `staUnA4g' [elf64-x86-64]



```python
! ls -gG a.out
```

    -rwxrwxr-x 1 13296 set 10 20:56 a.out



```bash
%%bash
gcc tiny.c -Wl,--gc-sections -fno-ident -Qn -s -nostartfiles -nostdlib  \
    -ffunction-sections -fdata-sections  \
```

    /usr/bin/ld: warning: cannot find entry symbol _start; not setting start address



```python
! ls -gG a.out
```

    -rwxrwxr-x 1 9016 set 10 21:15 a.out



```python
! strip a.out --remove-section=.comment --remove-section=.note* \
    --remove-section=.gnu.hash
```


```python
! ls -gG a.out
```

    -rwxrwxr-x 1 8848 set 10 21:21 a.out



```python
! objdump -x a.out
```

    
    a.out:     file format elf64-x86-64
    a.out
    architecture: i386:x86-64, flags 0x00000150:
    HAS_SYMS, DYNAMIC, D_PAGED
    start address 0x0000000000000000
    
    Program Header:
        PHDR off    0x0000000000000040 vaddr 0x0000000000000040 paddr 0x0000000000000040 align 2**3
             filesz 0x0000000000000230 memsz 0x0000000000000230 flags r--
      INTERP off    0x00000000000002a8 vaddr 0x00000000000002a8 paddr 0x00000000000002a8 align 2**0
             filesz 0x000000000000001c memsz 0x000000000000001c flags r--
        LOAD off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**12
             filesz 0x0000000000001010 memsz 0x0000000000001010 flags r--
        LOAD off    0x0000000000001f20 vaddr 0x0000000000002f20 paddr 0x0000000000002f20 align 2**12
             filesz 0x00000000000000e0 memsz 0x00000000000000e0 flags rw-
     DYNAMIC off    0x0000000000001f20 vaddr 0x0000000000002f20 paddr 0x0000000000002f20 align 2**3
             filesz 0x00000000000000e0 memsz 0x00000000000000e0 flags rw-
        NOTE off    0x0000000000000000 vaddr 0x00000000000002c8 paddr 0x0000000000000000 align 2**3
             filesz 0x0000000000000000 memsz 0x0000000000000000 flags r--
        NOTE off    0x0000000000000000 vaddr 0x00000000000002e8 paddr 0x0000000000000000 align 2**3
             filesz 0x0000000000000000 memsz 0x0000000000000000 flags r--
    0x6474e553 off    0x0000000000000000 vaddr 0x00000000000002c8 paddr 0x0000000000000000 align 2**3
             filesz 0x0000000000000000 memsz 0x0000000000000000 flags r--
    EH_FRAME off    0x0000000000001000 vaddr 0x0000000000001000 paddr 0x0000000000001000 align 2**2
             filesz 0x000000000000000c memsz 0x000000000000000c flags r--
       STACK off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**3
             filesz 0x0000000000000000 memsz 0x0000000000000000 flags rw-
    
    Dynamic Section:
      GNU_HASH             0x0000000000000310
      STRTAB               0x0000000000000348
      SYMTAB               0x0000000000000330
      STRSZ                0x0000000000000001
      SYMENT               0x0000000000000018
      DEBUG                0x0000000000000000
      FLAGS                0x0000000000000008
      FLAGS_1              0x0000000008000001
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .interp       0000001c  00000000000002a8  00000000000002a8  000002a8  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      1 .gnu.hash     0000001c  0000000000000310  0000000000000310  00000310  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      2 .dynsym       00000018  0000000000000330  0000000000000330  00000330  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      3 .dynstr       00000001  0000000000000348  0000000000000348  00000348  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      4 .eh_frame_hdr 0000000c  0000000000001000  0000000000001000  00001000  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      5 .eh_frame     00000000  0000000000001010  0000000000001010  00001010  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      6 .dynamic      000000e0  0000000000002f20  0000000000002f20  00001f20  2**3
                      CONTENTS, ALLOC, LOAD, DATA
    SYMBOL TABLE:
    no symbols
    
    



```python
! gcc helloworld.c
```


```python
! objdump -d a.out
```

    
    a.out:     file format elf64-x86-64
    
    
    Disassembly of section .init:
    
    0000000000001000 <_init>:
        1000:	f3 0f 1e fa          	endbr64 
        1004:	48 83 ec 08          	sub    $0x8,%rsp
        1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
        100f:	48 85 c0             	test   %rax,%rax
        1012:	74 02                	je     1016 <_init+0x16>
        1014:	ff d0                	callq  *%rax
        1016:	48 83 c4 08          	add    $0x8,%rsp
        101a:	c3                   	retq   
    
    Disassembly of section .plt:
    
    0000000000001020 <.plt>:
        1020:	ff 35 9a 2f 00 00    	pushq  0x2f9a(%rip)        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
        1026:	f2 ff 25 9b 2f 00 00 	bnd jmpq *0x2f9b(%rip)        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
        102d:	0f 1f 00             	nopl   (%rax)
        1030:	f3 0f 1e fa          	endbr64 
        1034:	68 00 00 00 00       	pushq  $0x0
        1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
        103f:	90                   	nop
    
    Disassembly of section .plt.got:
    
    0000000000001040 <__cxa_finalize@plt>:
        1040:	f3 0f 1e fa          	endbr64 
        1044:	f2 ff 25 ad 2f 00 00 	bnd jmpq *0x2fad(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
        104b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    
    Disassembly of section .plt.sec:
    
    0000000000001050 <puts@plt>:
        1050:	f3 0f 1e fa          	endbr64 
        1054:	f2 ff 25 75 2f 00 00 	bnd jmpq *0x2f75(%rip)        # 3fd0 <puts@GLIBC_2.2.5>
        105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    
    Disassembly of section .text:
    
    0000000000001060 <_start>:
        1060:	f3 0f 1e fa          	endbr64 
        1064:	31 ed                	xor    %ebp,%ebp
        1066:	49 89 d1             	mov    %rdx,%r9
        1069:	5e                   	pop    %rsi
        106a:	48 89 e2             	mov    %rsp,%rdx
        106d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
        1071:	50                   	push   %rax
        1072:	54                   	push   %rsp
        1073:	4c 8d 05 56 01 00 00 	lea    0x156(%rip),%r8        # 11d0 <__libc_csu_fini>
        107a:	48 8d 0d df 00 00 00 	lea    0xdf(%rip),%rcx        # 1160 <__libc_csu_init>
        1081:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1149 <main>
        1088:	ff 15 52 2f 00 00    	callq  *0x2f52(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
        108e:	f4                   	hlt    
        108f:	90                   	nop
    
    0000000000001090 <deregister_tm_clones>:
        1090:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4010 <__TMC_END__>
        1097:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4010 <__TMC_END__>
        109e:	48 39 f8             	cmp    %rdi,%rax
        10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
        10a3:	48 8b 05 2e 2f 00 00 	mov    0x2f2e(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
        10aa:	48 85 c0             	test   %rax,%rax
        10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
        10af:	ff e0                	jmpq   *%rax
        10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        10b8:	c3                   	retq   
        10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    
    00000000000010c0 <register_tm_clones>:
        10c0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4010 <__TMC_END__>
        10c7:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4010 <__TMC_END__>
        10ce:	48 29 fe             	sub    %rdi,%rsi
        10d1:	48 89 f0             	mov    %rsi,%rax
        10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
        10d8:	48 c1 f8 03          	sar    $0x3,%rax
        10dc:	48 01 c6             	add    %rax,%rsi
        10df:	48 d1 fe             	sar    %rsi
        10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
        10e4:	48 8b 05 05 2f 00 00 	mov    0x2f05(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
        10eb:	48 85 c0             	test   %rax,%rax
        10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
        10f0:	ff e0                	jmpq   *%rax
        10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
        10f8:	c3                   	retq   
        10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    
    0000000000001100 <__do_global_dtors_aux>:
        1100:	f3 0f 1e fa          	endbr64 
        1104:	80 3d 05 2f 00 00 00 	cmpb   $0x0,0x2f05(%rip)        # 4010 <__TMC_END__>
        110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
        110d:	55                   	push   %rbp
        110e:	48 83 3d e2 2e 00 00 	cmpq   $0x0,0x2ee2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
        1115:	00 
        1116:	48 89 e5             	mov    %rsp,%rbp
        1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
        111b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4008 <__dso_handle>
        1122:	e8 19 ff ff ff       	callq  1040 <__cxa_finalize@plt>
        1127:	e8 64 ff ff ff       	callq  1090 <deregister_tm_clones>
        112c:	c6 05 dd 2e 00 00 01 	movb   $0x1,0x2edd(%rip)        # 4010 <__TMC_END__>
        1133:	5d                   	pop    %rbp
        1134:	c3                   	retq   
        1135:	0f 1f 00             	nopl   (%rax)
        1138:	c3                   	retq   
        1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    
    0000000000001140 <frame_dummy>:
        1140:	f3 0f 1e fa          	endbr64 
        1144:	e9 77 ff ff ff       	jmpq   10c0 <register_tm_clones>
    
    0000000000001149 <main>:
        1149:	f3 0f 1e fa          	endbr64 
        114d:	55                   	push   %rbp
        114e:	48 89 e5             	mov    %rsp,%rbp
        1151:	48 8d 3d ac 0e 00 00 	lea    0xeac(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
        1158:	e8 f3 fe ff ff       	callq  1050 <puts@plt>
        115d:	90                   	nop
        115e:	5d                   	pop    %rbp
        115f:	c3                   	retq   
    
    0000000000001160 <__libc_csu_init>:
        1160:	f3 0f 1e fa          	endbr64 
        1164:	41 57                	push   %r15
        1166:	4c 8d 3d 4b 2c 00 00 	lea    0x2c4b(%rip),%r15        # 3db8 <__frame_dummy_init_array_entry>
        116d:	41 56                	push   %r14
        116f:	49 89 d6             	mov    %rdx,%r14
        1172:	41 55                	push   %r13
        1174:	49 89 f5             	mov    %rsi,%r13
        1177:	41 54                	push   %r12
        1179:	41 89 fc             	mov    %edi,%r12d
        117c:	55                   	push   %rbp
        117d:	48 8d 2d 3c 2c 00 00 	lea    0x2c3c(%rip),%rbp        # 3dc0 <__do_global_dtors_aux_fini_array_entry>
        1184:	53                   	push   %rbx
        1185:	4c 29 fd             	sub    %r15,%rbp
        1188:	48 83 ec 08          	sub    $0x8,%rsp
        118c:	e8 6f fe ff ff       	callq  1000 <_init>
        1191:	48 c1 fd 03          	sar    $0x3,%rbp
        1195:	74 1f                	je     11b6 <__libc_csu_init+0x56>
        1197:	31 db                	xor    %ebx,%ebx
        1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        11a0:	4c 89 f2             	mov    %r14,%rdx
        11a3:	4c 89 ee             	mov    %r13,%rsi
        11a6:	44 89 e7             	mov    %r12d,%edi
        11a9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
        11ad:	48 83 c3 01          	add    $0x1,%rbx
        11b1:	48 39 dd             	cmp    %rbx,%rbp
        11b4:	75 ea                	jne    11a0 <__libc_csu_init+0x40>
        11b6:	48 83 c4 08          	add    $0x8,%rsp
        11ba:	5b                   	pop    %rbx
        11bb:	5d                   	pop    %rbp
        11bc:	41 5c                	pop    %r12
        11be:	41 5d                	pop    %r13
        11c0:	41 5e                	pop    %r14
        11c2:	41 5f                	pop    %r15
        11c4:	c3                   	retq   
        11c5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
        11cc:	00 00 00 00 
    
    00000000000011d0 <__libc_csu_fini>:
        11d0:	f3 0f 1e fa          	endbr64 
        11d4:	c3                   	retq   
    
    Disassembly of section .fini:
    
    00000000000011d8 <_fini>:
        11d8:	f3 0f 1e fa          	endbr64 
        11dc:	48 83 ec 08          	sub    $0x8,%rsp
        11e0:	48 83 c4 08          	add    $0x8,%rsp
        11e4:	c3                   	retq   



```python
! size a.out    # text = code
```

       text	   data	    bss	    dec	    hex	filename
       1551	    600	      8	   2159	    86f	a.out



```python
! nm a.out    # symbols
```

    0000000000004010 B __bss_start
    0000000000004010 b completed.8060
                     w __cxa_finalize@@GLIBC_2.2.5
    0000000000004000 D __data_start
    0000000000004000 W data_start
    0000000000001090 t deregister_tm_clones
    0000000000001100 t __do_global_dtors_aux
    0000000000003dc0 d __do_global_dtors_aux_fini_array_entry
    0000000000004008 D __dso_handle
    0000000000003dc8 d _DYNAMIC
    0000000000004010 D _edata
    0000000000004018 B _end
    00000000000011d8 T _fini
    0000000000001140 t frame_dummy
    0000000000003db8 d __frame_dummy_init_array_entry
    000000000000215c r __FRAME_END__
    0000000000003fb8 d _GLOBAL_OFFSET_TABLE_
                     w __gmon_start__
    0000000000002014 r __GNU_EH_FRAME_HDR
    0000000000001000 t _init
    0000000000003dc0 d __init_array_end
    0000000000003db8 d __init_array_start
    0000000000002000 R _IO_stdin_used
                     w _ITM_deregisterTMCloneTable
                     w _ITM_registerTMCloneTable
    00000000000011d0 T __libc_csu_fini
    0000000000001160 T __libc_csu_init
                     U __libc_start_main@@GLIBC_2.2.5
    0000000000001149 T main
                     U puts@@GLIBC_2.2.5
    00000000000010c0 t register_tm_clones
    0000000000001060 T _start
    0000000000004010 D __TMC_END__

