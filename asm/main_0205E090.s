	.include "asm/macros.inc"
	.include "main_0205E090.inc"

	.text

	arm_func_start sub_0205E090
sub_0205E090: ; 0x0205E090
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E0D4
_0205E0AC:
	ldr r0, [r7, #0x18]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E0D4:
	cmp r8, #8
	blt _0205E0AC
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E114
_0205E0E8:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x100
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E114:
	cmp r8, #8
	blt _0205E0E8
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E154
_0205E128:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x200
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E154:
	cmp r8, #8
	blt _0205E128
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E194
_0205E168:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x300
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E194:
	cmp r8, #1
	blt _0205E168
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E1D4
_0205E1A8:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x320
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E1D4:
	cmp r8, #1
	blt _0205E1A8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205E1E4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E090
