.text
.global _start
_start:
    adr x0, msg
loop:
    ldrb w1, [x0], #1
    cbz w1, done
    ldr w2, [x19, #24]
    tbnz w2, #5, loop
    str w1, [x19]
    b loop
done:
    ret
msg:
    .ascii "Hello, world!\n\0"
