	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

	arm_func_start FS_ChangeDir
FS_ChangeDir: ; 0x0207F894
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	add r0, sp, #0xc
	bl FS_InitFile
	add r0, sp, #0xc
	add r3, sp, #0
	mov r1, r4
	mov r2, #0
	bl FSi_FindPath
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r3, _0207F8E8 ; =_022BB5EC
	add r0, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0207F8E8: .word _022BB5EC
	arm_func_end FS_ChangeDir


