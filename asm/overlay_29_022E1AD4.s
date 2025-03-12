	.include "asm/macros.inc"
	.include "overlay_29_022E1AD4.inc"

	.text

	arm_func_start ov29_022E1AD4
ov29_022E1AD4: ; 0x022E1AD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r4, #0xb4]
#ifdef JAPAN
	ldrneb r0, [r0, #0x177]
#else
	ldrneb r0, [r0, #0x17b]
#endif
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E1AD4

	arm_func_start ov29_022E1AF4
ov29_022E1AF4: ; 0x022E1AF4
	ldr r2, _022E1B24 ; =ov29_0237C754
	mov r3, #0
	add ip, r2, r0
	mov r2, #1
	b _022E1B18
_022E1B08:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	strb r2, [ip, r3]
	mov r3, r0, lsr #0x10
_022E1B18:
	cmp r3, r1
	blo _022E1B08
	bx lr
	.align 2, 0
_022E1B24: .word ov29_0237C754
	arm_func_end ov29_022E1AF4

	arm_func_start ov29_022E1B28
ov29_022E1B28: ; 0x022E1B28
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r5, r4
_022E1B38:
	ldr r0, _022E1C04 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E1BD8
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl GetSpriteSize
	mov r6, r0
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE954
	cmp r0, #0
	add r0, r4, #0x1a
	strh r0, [r7, #0xac]
	ldr r0, [r7, #0xb4]
	movne r6, r6, lsl #1
#ifdef JAPAN
	strb r4, [r0, #0x176]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x177]
#else
	strb r4, [r0, #0x17a]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x17b]
#endif
	mov r1, #1
	ldr r0, _022E1C08 ; =ov29_0237C754
	b _022E1BB4
_022E1BA4:
	cmp r4, #0x48
	strltb r1, [r0, r4]
	addlt r4, r4, #1
	add r2, r2, #1
_022E1BB4:
	cmp r2, r6
	blt _022E1BA4
	cmp r8, #0
	beq _022E1BD8
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
_022E1BD8:
	add r5, r5, #1
	cmp r5, #4
	blt _022E1B38
	mov r1, #0
	ldr r0, _022E1C08 ; =ov29_0237C754
	b _022E1BF8
_022E1BF0:
	strb r1, [r0, r4]
	add r4, r4, #1
_022E1BF8:
	cmp r4, #0x48
	blt _022E1BF0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1C04: .word DUNGEON_PTR
_022E1C08: .word ov29_0237C754
	arm_func_end ov29_022E1B28

	arm_func_start ov29_022E1C0C
ov29_022E1C0C: ; 0x022E1C0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r7, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrne r5, _022E1C7C ; =ov29_0237C79C
	ldreq r5, _022E1C80 ; =ov29_0237C754
	cmp r6, #0
	beq _022E1C48
	ldrb r0, [r7, #0xaa]
	bl ov29_022DEA1C
_022E1C48:
	mov r3, #0
	mov r2, r3
	b _022E1C6C
_022E1C54:
#ifdef JAPAN
	ldrb r1, [r4, #0x176]
#else
	ldrb r1, [r4, #0x17a]
#endif
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r5, r1
	strb r2, [r3, r1]
	mov r3, r0, asr #0x10
_022E1C6C:
#ifdef JAPAN
	ldrb r0, [r4, #0x177]
#else
	ldrb r0, [r4, #0x17b]
#endif
	cmp r3, r0
	blt _022E1C54
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E1C7C: .word ov29_0237C79C
_022E1C80: .word ov29_0237C754
	arm_func_end ov29_022E1C0C

	arm_func_start ov29_022E1C84
ov29_022E1C84: ; 0x022E1C84
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r0, r2
	mov r6, r1
	mvn r4, #0
	bl GetSpriteSize
	mov r5, r0
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov29_022DE954
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r3, #0
	rsb ip, r5, #0x48
	mov r2, r3
	ldr r1, _022E1D28 ; =ov29_0237C754
	b _022E1D04
_022E1CD0:
	mov r8, r2
	add lr, r1, r3
	b _022E1CEC
_022E1CDC:
	ldrb r0, [lr, r8]
	cmp r0, #0
	bne _022E1CF4
	add r8, r8, #1
_022E1CEC:
	cmp r8, r5
	blt _022E1CDC
_022E1CF4:
	cmp r8, r5
	moveq r4, r3
	beq _022E1D0C
	add r3, r3, #1
_022E1D04:
	cmp r3, ip
	ble _022E1CD0
_022E1D0C:
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0
	strne r4, [r7]
	strne r5, [r6]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1D28: .word ov29_0237C754
	arm_func_end ov29_022E1C84

	arm_func_start ov29_022E1D2C
ov29_022E1D2C: ; 0x022E1D2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mvn r1, #0
	mov r0, #1
	str r1, [sp, #8]
	bl ov29_022DEA10
	mov r6, r0
	mov r1, r8
	mov r0, #0
	bl GetMonsterApparentId
	bl DungeonGetSpriteIndex
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r6, [sp]
	bl ov29_022E1C84
	cmp r0, #0
	moveq r0, #0
	beq _022E1EB8
	mov r5, #0
	ldr sb, _022E1EC0 ; =DUNGEON_PTR
	b _022E1EAC
_022E1D90:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E1EA8
	mov r0, #1
	str r0, [r7]
	ldr r0, _022E1EC0 ; =DUNGEON_PTR
	strb r5, [r7, #0x24]
	ldr r0, [r0]
#ifdef JAPAN
	mov r1, #0x23c
	add r0, r0, #0x3f4
	add r0, r0, #0x400
	mla r0, r5, r1, r0
#else
	add r1, r5, r5, lsl #3
	add r0, r0, #0x3f4
	add r0, r0, #0x400
	add r0, r0, r1, lsl #6
#endif
	str r0, [r7, #0xb4]
	strh r8, [r0, #2]
	mov r1, r8
	mov r0, #0
	bl GetMonsterApparentId
	ldr r1, [r7, #0xb4]
	mov r2, #0
	strh r0, [r1, #4]
	ldr r1, [r7, #0xb4]
	and r0, r6, #0xff
	strb r2, [r1, #6]
	ldr r1, [r7, #0xb4]
	strb r2, [r1, #8]
	strh r4, [r7, #0xa8]
	strb r6, [r7, #0xaa]
	bl ov29_022DE9F8
	ldr r1, [sp, #8]
	mov r0, #7
	add r1, r1, #0x1a
	strh r1, [r7, #0xac]
	strb r0, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0x28]
	strb r1, [r7, #0xb0]
	mov r0, #0xff
	strb r0, [r7, #0xaf]
	mov r0, #1
	strb r0, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	str r1, [r7, #0x1c]
	bl PopulateActiveMonsterPtrs
	ldr r1, [sp, #8]
	ldr r0, [r7, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1AF4
	ldr r1, _022E1EC0 ; =DUNGEON_PTR
	mov r0, r7
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrh r3, [r1, #0x88]
	add r2, r3, #1
	strh r2, [r1, #0x88]
	strh r3, [r7, #0x26]
	b _022E1EB8
_022E1EA8:
	add r5, r5, #1
_022E1EAC:
	cmp r5, #4
	blt _022E1D90
	mov r0, #0
_022E1EB8:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E1EC0: .word DUNGEON_PTR
	arm_func_end ov29_022E1D2C

	arm_func_start ov29_022E1EC4
ov29_022E1EC4: ; 0x022E1EC4
	ldr r2, _022E1EF4 ; =ov29_0237C79C
	mov r3, #0
	add ip, r2, r0
	mov r2, #1
	b _022E1EE8
_022E1ED8:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	strb r2, [ip, r3]
	mov r3, r0, lsr #0x10
_022E1EE8:
	cmp r3, r1
	blo _022E1ED8
	bx lr
	.align 2, 0
_022E1EF4: .word ov29_0237C79C
	arm_func_end ov29_022E1EC4

	arm_func_start ov29_022E1EF8
ov29_022E1EF8: ; 0x022E1EF8
	mov r0, #0
	ldr r2, _022E1F30 ; =ov29_0237C79C
	mov r3, r0
_022E1F04:
	ldrb r1, [r2, r3]
	cmp r1, #0
	add r1, r3, #1
	addeq r0, r0, #1
	mov r1, r1, lsl #0x10
	moveq r0, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	moveq r0, r0, asr #0x10
	cmp r3, #0xae
	blo _022E1F04
	bx lr
	.align 2, 0
_022E1F30: .word ov29_0237C79C
	arm_func_end ov29_022E1EF8

	arm_func_start ov29_022E1F34
ov29_022E1F34: ; 0x022E1F34
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r5, r4
_022E1F44:
	ldr r0, _022E2010 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa94]
#else
	ldr r7, [r0, #0xb38]
#endif
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E1FE4
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl GetSpriteSize
	mov r6, r0
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE954
	cmp r0, #0
	add r0, r4, #0x62
	strh r0, [r7, #0xac]
	ldr r0, [r7, #0xb4]
	movne r6, r6, lsl #1
#ifdef JAPAN
	strb r5, [r0, #0x176]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x177]
#else
	strb r5, [r0, #0x17a]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x17b]
#endif
	mov r1, #1
	ldr r0, _022E2014 ; =ov29_0237C79C
	b _022E1FC0
_022E1FB0:
	cmp r4, #0xae
	strltb r1, [r0, r4]
	addlt r4, r4, #1
	add r2, r2, #1
_022E1FC0:
	cmp r2, r6
	blt _022E1FB0
	cmp r8, #0
	beq _022E1FE4
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
_022E1FE4:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E1F44
	mov r1, #0
	ldr r0, _022E2014 ; =ov29_0237C79C
	b _022E2004
_022E1FFC:
	strb r1, [r0, r4]
	add r4, r4, #1
_022E2004:
	cmp r4, #0xae
	blt _022E1FFC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E2010: .word DUNGEON_PTR
_022E2014: .word ov29_0237C79C
	arm_func_end ov29_022E1F34

	arm_func_start ov29_022E2018
ov29_022E2018: ; 0x022E2018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r0, r2
	mov r6, r1
	mvn r4, #0
	bl GetSpriteSize
	mov r5, r0
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov29_022DE954
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r3, #0
	rsb ip, r5, #0xae
	mov r2, r3
	ldr r1, _022E20BC ; =ov29_0237C79C
	b _022E2098
_022E2064:
	mov r8, r2
	add lr, r1, r3
	b _022E2080
_022E2070:
	ldrb r0, [lr, r8]
	cmp r0, #0
	bne _022E2088
	add r8, r8, #1
_022E2080:
	cmp r8, r5
	blt _022E2070
_022E2088:
	cmp r8, r5
	moveq r4, r3
	beq _022E20A0
	add r3, r3, #1
_022E2098:
	cmp r3, ip
	ble _022E2064
_022E20A0:
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0
	strne r4, [r7]
	strne r5, [r6]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E20BC: .word ov29_0237C79C
	arm_func_end ov29_022E2018

	arm_func_start CreateEnemyEntity
CreateEnemyEntity: ; 0x022E20C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r0, #2
	bl ov29_022DEA10
	mov r6, r0
	mov r1, r8
	mov r0, #0
	bl GetMonsterApparentId
	mov r4, r0
	bl DungeonGetSpriteIndex
	mov r3, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	str r6, [sp]
	bl ov29_022E2018
	cmp r0, #0
	moveq r0, #0
	beq _022E2254
	mov r5, #0
	ldr sb, _022E225C ; =DUNGEON_PTR
	b _022E2248
_022E211C:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa94]
#else
	ldr r7, [r0, #0xb38]
#endif
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E2244
	mov r0, #1
	str r0, [r7]
	strb r5, [r7, #0x24]
	mov r0, #0
	ldr r1, _022E225C ; =DUNGEON_PTR
	strb r0, [r7, #0x22]
	ldr r1, [r1]
#ifdef JAPAN
	mov r2, #0x23c
	add r1, r1, #0xe4
	add r1, r1, #0x1000
	mla r2, r5, r2, r1
#else
	add r2, r5, r5, lsl #3
	add r1, r1, #0xf4
	add r1, r1, #0x1000
	add r2, r1, r2, lsl #6
#endif
	str r2, [r7, #0xb4]
	mov r1, r8
	strh r8, [r2, #2]
	bl GetMonsterApparentId
	ldr r2, [r7, #0xb4]
	mov r1, #1
	strh r0, [r2, #4]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r1, [r0, #6]
	ldr r1, [r7, #0xb4]
	mov r0, r4
	strb r2, [r1, #8]
	bl DungeonGetSpriteIndex
	strh r0, [r7, #0xa8]
	strb r6, [r7, #0xaa]
	ldr r0, [sp, #8]
	add r0, r0, #0x62
	strh r0, [r7, #0xac]
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE9F8
	mov r0, #7
	strb r0, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0x28]
	strb r1, [r7, #0xb0]
	mov r0, #0xff
	strb r0, [r7, #0xaf]
	mov r0, #1
	strb r0, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	str r1, [r7, #0x1c]
	ldr r1, [sp, #8]
	ldr r0, [r7, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
	bl PopulateActiveMonsterPtrs
	ldr r1, _022E225C ; =DUNGEON_PTR
	mov r0, r7
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrh r3, [r1, #0x88]
	add r2, r3, #1
	strh r2, [r1, #0x88]
	strh r3, [r7, #0x26]
	b _022E2254
_022E2244:
	add r5, r5, #1
_022E2248:
	cmp r5, #0x10
	blt _022E211C
	mov r0, #0
_022E2254:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E225C: .word DUNGEON_PTR
	arm_func_end CreateEnemyEntity

	arm_func_start SpawnTrap
SpawnTrap: ; 0x022E2260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	mov r5, #0
	ldr r4, _022E2310 ; =DUNGEON_PTR
	b _022E2300
_022E2280:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xc24]
#else
	ldr r6, [r0, #0xcc8]
#endif
	mov r0, r6
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E22FC
	mov r1, #2
	ldr r0, _022E2310 ; =DUNGEON_PTR
	str r1, [r6]
	ldr r0, [r0]
	mov r2, #0
#ifdef JAPAN
	add r0, r0, #0xf20
	add r0, r0, #0x3000
#else
	add r0, r0, #0x3c4
	add r0, r0, #0x3c00
#endif
	add r0, r0, r5, lsl #2
	str r0, [r6, #0xb4]
	strb sl, [r0]
	ldr r1, [r6, #0xb4]
	mov r0, r6
	strb r8, [r1, #1]
	ldr r1, [r6, #0xb4]
	strb r7, [r1, #2]
	str r2, [r6, #0x1c]
	strb r2, [r6, #0x22]
	ldrh r1, [sb]
	strh r1, [r6, #4]
	ldrh r1, [sb, #2]
	strh r1, [r6, #6]
	strh r2, [r6, #0x26]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022E22FC:
	add r5, r5, #1
_022E2300:
	cmp r5, #0x40
	blt _022E2280
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E2310: .word DUNGEON_PTR
	arm_func_end SpawnTrap

	arm_func_start SpawnItemEntity
SpawnItemEntity: ; 0x022E2314
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022E2410 ; =DUNGEON_PTR
	ldr r2, _022E2414 ; =SECONDARY_TERRAIN_TYPES
	ldr r1, [r1]
	mov r6, r0
	add r0, r1, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _022E235C
	ldrsh r0, [r6]
	ldrsh r1, [r6, #2]
	bl GetTileSafe
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022E235C:
	mov r4, #0
	ldr r7, _022E2410 ; =DUNGEON_PTR
	b _022E2400
_022E2368:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xb24]
#else
	ldr r5, [r0, #0xbc8]
#endif
	mov r0, r5
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E23FC
#ifdef JAPAN
	mov r1, #3
	str r1, [r5]
	ldr r0, _022E2410 ; =DUNGEON_PTR
	mov r1, #6
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x19c
	add r0, r0, #0x3c00
	mla r0, r4, r1, r0
#else
	ldr r0, _022E2410 ; =DUNGEON_PTR
	mov r1, #3
	str r1, [r5]
	ldr r1, [r0]
	mov r0, #6
	add r1, r1, #0x3e40
	mla r0, r4, r0, r1
#endif
	str r0, [r5, #0xb4]
	ldrh r0, [r6]
	mov r1, #0x18
#ifndef JAPAN
	mov r2, #0
#endif
	strh r0, [r5, #4]
	ldrh r3, [r6, #2]
	mov r0, r5
	strh r3, [r5, #6]
	ldrsh r3, [r6]
	ldrsh r4, [r6, #2]
	smulbb r3, r3, r1
	smulbb r4, r4, r1
	add r1, r3, #4
	mov r1, r1, lsl #8
	add r3, r4, #4
	str r1, [r5, #0xc]
	mov r1, r3, lsl #8
	str r1, [r5, #0x10]
	strh r2, [r5, #0x26]
	strb r2, [r5, #0x22]
	str r2, [r5, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E23FC:
	add r4, r4, #1
_022E2400:
	cmp r4, #0x40
	blt _022E2368
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E2410: .word DUNGEON_PTR
_022E2414: .word SECONDARY_TERRAIN_TYPES
	arm_func_end SpawnItemEntity

	arm_func_start ov29_022E2418
ov29_022E2418: ; 0x022E2418
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl HiddenStairsPresent
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022E246C ; =DUNGEON_PTR
	mov r1, #5
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xd24]
#else
	ldr r0, [r0, #0xdc8]
#endif
	str r1, [r0]
	str r2, [r0, #0x1c]
	strb r2, [r0, #0x22]
	ldrh r1, [r4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	strh r2, [r0, #0x26]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E246C: .word DUNGEON_PTR
	arm_func_end ov29_022E2418

	arm_func_start ov29_022E2470
ov29_022E2470: ; 0x022E2470
	mov r1, #6
	str r1, [r0]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	strh r1, [r0, #0x26]
	strb r1, [r0, #0x22]
	bx lr
	arm_func_end ov29_022E2470

	arm_func_start ShouldMinimapDisplayEntity
ShouldMinimapDisplayEntity: ; 0x022E2498
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _022E2560
	cmp r0, #1
	beq _022E24C0
	cmp r0, #6
	beq _022E2560
	b _022E2568
_022E24C0:
	ldrb r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022E2570 ; =DUNGEON_PTR
	ldr r2, [r5, #0xb4]
	ldr r0, [r0]
	ldrb r1, [r2, #6]
#ifdef JAPAN
	add r0, r0, #0x178
#else
	add r0, r0, #0x21c
#endif
	add r4, r0, #0x1a000
	ldr r0, [r4, #0x10]
	cmp r1, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x28]
	cmp r1, #0
	ldreqb r1, [r2, #0xef]
	cmpeq r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x34]
	cmp r1, #0
	bne _022E252C
	ldrb r1, [r4, #0x23]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_022E252C:
	ldrb r1, [r4, #0x26]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r4
	add r1, r5, #4
	bl IsPositionActuallyInSight
	ldmia sp!, {r3, r4, r5, pc}
_022E2560:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022E2568:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E2570: .word DUNGEON_PTR
	arm_func_end ShouldMinimapDisplayEntity

	arm_func_start ShouldDisplayEntity
ShouldDisplayEntity: ; 0x022E2574
#ifdef JAPAN
#define SHOULD_DISPLAY_ENTITY_OFFSET -0xA4
#else
#define SHOULD_DISPLAY_ENTITY_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb r5, [r0, #0x20]
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr lr, [r0]
	cmp r1, #0
	movne r6, #0x40
	moveq r6, #0x20
	cmp lr, #2
	bne _022E25D8
	ldr r2, _022E2724 ; =DUNGEON_PTR
	ldr r3, _022E2728 ; =0x0001A224
	ldr r4, [r2]
	add r8, r3, #2
	ldrsh ip, [r0, #4]
	mov r7, #0x18
	ldrsh r2, [r0, #6]
	ldrsh r3, [r4, r3]
	smulbb ip, ip, r7
	ldrsh r8, [r4, r8]
	smulbb r7, r2, r7
	sub r2, ip, r3
	sub r7, r7, r8
	b _022E2600
_022E25D8:
	ldr r3, _022E2724 ; =DUNGEON_PTR
	ldr r2, _022E2728 ; =0x0001A224
	ldr r4, [r3]
	add r3, r2, #2
	ldrsh r2, [r4, r2]
	ldr r8, [r0, #0xc]
	ldrsh r3, [r4, r3]
	ldr r7, [r0, #0x10]
	rsb r2, r2, r8, asr #8
	rsb r7, r3, r7, asr #8
_022E2600:
	rsb r3, r6, #0
	cmp r2, r3
	cmpge r7, r3
	blt _022E271C
	add r3, r6, #0xff
	cmp r2, r3
	addle r2, r6, #0xc0
	cmple r7, r2
	bgt _022E271C
	add r2, r4, #0x21c + SHOULD_DISPLAY_ENTITY_OFFSET
	cmp lr, #6
	add r6, r2, #0x1a000
	addls pc, pc, lr, lsl #2
	b _022E2714
_022E2638: ; jump table
	b _022E270C ; case 0
	b _022E267C ; case 1
	b _022E26F0 ; case 2
	b _022E2654 ; case 3
	b _022E2714 ; case 4
	b _022E2714 ; case 5
	b _022E270C ; case 6
_022E2654:
	ldrb r1, [r6, #0x27]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r0, #4
	bl ov29_022E2CA0
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E267C:
	ldr r3, [r0, #0xb4]
	ldrb r2, [r3, #6]
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r2, r4, #0x1a000
	ldrb r2, [r2, #0x244 + SHOULD_DISPLAY_ENTITY_OFFSET]
	cmp r2, #0
	ldreqb r2, [r3, #0xef]
	cmpeq r2, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r2, [r6, #0x26]
	cmp r2, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r1, #0
	add r0, r0, #4
	beq _022E26DC
	bl ov29_022E2D3C
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E26DC:
	bl ov29_022E2CA0
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E26F0:
	add r0, r4, #0x1a000
	ldrb r0, [r0, #0x244 + SHOULD_DISPLAY_ENTITY_OFFSET]
	cmp r0, #0
	cmpeq r5, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E270C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E2714:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E271C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E2724: .word DUNGEON_PTR
_022E2728: .word 0x0001A224 + SHOULD_DISPLAY_ENTITY_OFFSET
	arm_func_end ShouldDisplayEntity

	arm_func_start ShouldDisplayEntityWrapper
ShouldDisplayEntityWrapper: ; 0x022E272C
	ldr ip, _022E2738 ; =ShouldDisplayEntity
	mov r1, #0
	bx ip
	.align 2, 0
_022E2738: .word ShouldDisplayEntity
	arm_func_end ShouldDisplayEntityWrapper

	arm_func_start ov29_022E273C
ov29_022E273C: ; 0x022E273C
	ldr ip, _022E2748 ; =ShouldDisplayEntity
	mov r1, #1
	bx ip
	.align 2, 0
_022E2748: .word ShouldDisplayEntity
	arm_func_end ov29_022E273C
