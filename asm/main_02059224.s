	.include "asm/macros.inc"
	.include "main_02059224.inc"

	.text

	arm_func_start ReadMonsterInfoFromSave
ReadMonsterInfoFromSave: ; 0x02059224
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForWrite
	ldr r6, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	ldr r5, _02059330 ; =0x0000022B
	mov r8, #0
	add r7, sp, #0
	mov r4, #0x44
_02059254:
	ldr r1, [r6]
	mov r0, r7
	mla r1, r8, r4, r1
	bl ReadMonsterFromSave
	add r8, r8, #1
	cmp r8, r5
	blt _02059254
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x40
	add r1, r1, #0x78
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x1880
	add r1, r1, #0x8000
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x81
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x50
	add r1, r1, #0x82
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r5, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0
	add r6, sp, #0
	mov r4, #0x44
_020592F0:
	ldr r1, [r5]
	mov r0, r6
	add r1, r1, #0x98
	add r1, r1, #0x9800
	mla r1, r7, r4, r1
	bl ReadMonsterFromSave
	add r7, r7, #1
	cmp r7, #4
	blt _020592F0
	add r0, sp, #0
	bl BitstreamDebug
	bl sub_0205523C
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205932C: .word TEAM_MEMBER_TABLE_PTR
_02059330: .word 0x0000022B
	arm_func_end ReadMonsterInfoFromSave
