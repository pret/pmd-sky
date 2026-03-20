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

	arm_func_start sub_0205E1E8
sub_0205E1E8: ; 0x0205E1E8
	stmdb sp!, {r3, lr}
	ldrb lr, [r0, #1]
	mov r3, #0
	mov ip, #1
	add r1, lr, #0xff
	and r2, r1, #0xff
	cmp r2, #0xd
	bhi _0205E214
	ldr r1, _0205E234 ; =0x00002383
	tst r1, ip, lsl r2
	movne ip, r3
_0205E214:
	cmp ip, #0
	beq _0205E22C
	cmp lr, #0xb
	ldreqb r0, [r0, #2]
	cmpeq r0, #0
	movne r3, #1
_0205E22C:
	and r0, r3, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205E234: .word 0x00002383
	arm_func_end sub_0205E1E8

	arm_func_start IsMissionTypeSpecialEpisode
IsMissionTypeSpecialEpisode: ; 0x0205E238
	ldrb r1, [r0, #1]
	cmp r1, #0xe
	ldreqb r0, [r0, #2]
	cmpeq r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMissionTypeSpecialEpisode

	arm_func_start sub_0205E258
sub_0205E258: ; 0x0205E258
	ldrb r2, [r0, #1]
	mov r3, #1
	add r1, r2, #0xfe
	and r1, r1, #0xff
	cmp r1, #3
	bls _0205E280
	cmp r2, #0xa
	ldreqb r0, [r0, #2]
	cmpeq r0, #4
	movne r3, #0
_0205E280:
	and r0, r3, #0xff
	bx lr
	arm_func_end sub_0205E258
