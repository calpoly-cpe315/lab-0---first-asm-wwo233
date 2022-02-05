    .global	main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (x29), and store them.
	stp	x29, x30, [sp, -16]!

    // Load the argument and perform the call. Like 'printf("...")' in C.
	ldr	x0, =line1
	bl	printf
	ldr	x0, =line2
	bl	printf
	ldr	x0, =line3
	bl	printf

    // initialize the return value in the return register
	mov	x0, 0

    // restore the registers and post-decrement 
    // the stack pointer for consistency
	ldp	x29, x30, [sp], 16

    // return from the call
	ret

line1:
	.asciz "My friends egged me on.\n"
line2:
	.asciz "So I had a second cup.\n"
line3:
	.asciz "Now I’m nogging off.\n"
