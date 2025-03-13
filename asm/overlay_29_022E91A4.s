	.include "asm/macros.inc"
	.include "overlay_29_022E91A4.inc"

	.text

	arm_func_start IsPositionInSight
IsPositionInSight: ; 0x022E91A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r7, r2
	bl GetTile
	ldrb r6, [r0, #7]
	cmp r6, #0xff
	beq _022E9230
	cmp r7, #0
	bne _022E9230
	ldr r0, _022E9294 ; =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
	ldrsh r2, [r4]
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r3, r6, r1, r0
	ldrsh r0, [r3, #2]
	sub r0, r0, #1
	cmp r0, r2
	ldrlesh r0, [r3, #4]
	ldrlesh r1, [r4, #2]
	suble r0, r0, #1
	cmple r0, r1
	bgt _022E9230
	ldrsh r0, [r3, #6]
	add r0, r0, #1
	cmp r0, r2
	ldrgtsh r0, [r3, #8]
	addgt r0, r0, #1
	cmpgt r0, r1
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
_022E9230:
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [r5]
	ldrsh r1, [r4]
	mov r6, r0
	sub r0, r2, r1
	bl abs
	cmp r0, r6
	movle r0, r6
	cmp r0, #2
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	bne _022E928C
	mov r0, r5
	mov r1, r4
	bl ov29_022E935C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E928C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E9294: .word DUNGEON_PTR
	arm_func_end IsPositionInSight

	arm_func_start ov29_022E9298
ov29_022E9298: ; 0x022E9298
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r7, r2
	bl GetTile
	mov r6, r0
	bl GetVisibilityRange
	cmp r7, #0
	ldrb r2, [r6, #7]
	bne _022E92D0
	cmp r2, #0xff
	bne _022E930C
_022E92D0:
	ldrsh r1, [r5]
	sub r1, r1, r0
	str r1, [r4]
	ldrsh r1, [r5]
	add r1, r1, r0
	add r1, r1, #1
	str r1, [r4, #8]
	ldrsh r1, [r5, #2]
	sub r1, r1, r0
	str r1, [r4, #4]
	ldrsh r1, [r5, #2]
	add r0, r1, r0
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E930C:
	ldr r0, _022E9358 ; =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r1, r2, r1, r0
	ldrsh r0, [r1, #2]
	sub r0, r0, #1
	str r0, [r4]
	ldrsh r0, [r1, #6]
	add r0, r0, #2
	str r0, [r4, #8]
	ldrsh r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	ldrsh r0, [r1, #8]
	add r0, r0, #2
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E9358: .word DUNGEON_PTR
	arm_func_end ov29_022E9298

	arm_func_start ov29_022E935C
ov29_022E935C: ; 0x022E935C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldrsh r4, [r8]
	ldrsh r0, [r7]
	sub r0, r4, r0
	bl abs
	mov r6, r0
	cmp r6, #1
	bgt _022E93A0
	ldrsh r1, [r8, #2]
	ldrsh r0, [r7, #2]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	movle r0, #1
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
_022E93A0:
	ldrsh r5, [r8, #2]
	ldrsh r0, [r7, #2]
	sub r0, r5, r0
	bl abs
	cmp r6, r0
	movle r6, r0
	cmp r6, #2
	bne _022E9480
	mov r6, #0
	b _022E9410
_022E93C8:
	ldrsh r0, [r7]
	cmp r4, r0
	addlt r4, r4, #1
	cmp r4, r0
	ldrsh r0, [r7, #2]
	subgt r4, r4, #1
	cmp r5, r0
	addlt r5, r5, #1
	cmp r5, r0
	subgt r5, r5, #1
	mov r0, r4
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r6, r6, #1
_022E9410:
	cmp r6, #2
	blt _022E93C8
	ldrsh r4, [r7]
	ldrsh r5, [r7, #2]
	mov r6, #0
	b _022E9470
_022E9428:
	ldrsh r0, [r8]
	cmp r4, r0
	addlt r4, r4, #1
	cmp r4, r0
	ldrsh r0, [r8, #2]
	subgt r4, r4, #1
	cmp r5, r0
	addlt r5, r5, #1
	cmp r5, r0
	subgt r5, r5, #1
	mov r0, r4
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r6, r6, #1
_022E9470:
	cmp r6, #2
	blt _022E9428
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E9480:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_022E935C

	arm_func_start ov29_022E9488
ov29_022E9488: ; 0x022E9488
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022E955C ; =DUNGEON_PTR
	ldr r3, _022E9560 ; =0x0001A224
	ldr r4, [ip]
	add ip, r3, #2
	ldrsh r3, [r4, r3]
	ldrsh r4, [r4, ip]
	mvn lr, #0xf
	sub r3, r0, r3
	sub r0, r1, r4
	cmp r3, lr
	cmpge r0, lr
	blt _022E9554
	rsb r1, lr, #0xff
	cmp r3, r1
	cmplt r0, #0xd0
	bge _022E9554
	mov r1, #0xc
	mul ip, r2, r1
	ldr r4, _022E9564 ; =ov29_0237C88A
	ldr r5, _022E9568 ; =ov29_0237C890
	ldrh r2, [r4, ip]
	sub r1, r1, #0x20c
	ldrsh r5, [r5, ip]
	and r1, r2, r1
	strh r1, [r4, ip]
	add r1, r3, r5
	ldrh r2, [r4, ip]
	and r1, r1, lr, lsr #23
	ldr r3, _022E956C ; =ov29_0237C88E
	orr r1, r2, r1
	strh r1, [r4, ip]
	ldr r1, _022E9570 ; =ov29_0237C892
	ldrh r4, [r3, ip]
	ldrsh lr, [r1, ip]
	ldr r1, _022E9574 ; =0xFFFF000F
	ldr r2, _022E9578 ; =_020AFC4C
	and r1, r4, r1
	strh r1, [r3, ip]
	add r0, r0, lr
	ldr r1, _022E957C ; =ov29_0237C888
	mov lr, r0, lsl #0x14
	ldrh r4, [r3, ip]
	ldr r0, [r2]
	add r1, r1, ip
	orr r4, r4, lr, lsr #16
	mov r2, #0
	strh r4, [r3, ip]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022E9554:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E955C: .word DUNGEON_PTR
#ifdef JAPAN
_022E9560: .word 0x0001A180
#else
_022E9560: .word 0x0001A224
#endif
_022E9564: .word ov29_0237C88A
_022E9568: .word ov29_0237C890
_022E956C: .word ov29_0237C88E
_022E9570: .word ov29_0237C892
_022E9574: .word 0xFFFF000F
_022E9578: .word _020AFC4C
_022E957C: .word ov29_0237C888
	arm_func_end ov29_022E9488

	arm_func_start GetLeader
GetLeader: ; 0x022E9580
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022E95EC ; =LEADER_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r5, #0
	ldr r4, _022E95F0 ; =DUNGEON_PTR
	b _022E95DC
_022E95A0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	mov r0, r6
	bl EntityIsValid__022E95F4
	cmp r0, #0
	ldrne r0, [r6, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	ldrne r1, _022E95EC ; =LEADER_PTR
	movne r0, r6
	strne r6, [r1]
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E95DC:
	cmp r5, #4
	blt _022E95A0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E95EC: .word LEADER_PTR
_022E95F0: .word DUNGEON_PTR
	arm_func_end GetLeader
