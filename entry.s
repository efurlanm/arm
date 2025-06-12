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

    and sp, sp, #0xFFFFFFFFFFFFFFF0

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
