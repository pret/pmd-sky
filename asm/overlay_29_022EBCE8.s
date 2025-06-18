	.include "asm/macros.inc"
	.include "overlay_29_022EBCE8.inc"

	.text

	arm_func_start ov29_022EBCE8
ov29_022EBCE8: ; 0x022EBCE8
	ldrh r1, [r0]
	cmp r1, #0x15
	ldreqb r0, [r0, #4]
	bxeq lr
	cmp r1, #0x14
	ldreqb r0, [r0, #0xa]
	mvnne r0, #0
	bx lr
	arm_func_end ov29_022EBCE8

	arm_func_start RunFractionalTurn
RunFractionalTurn: ; 0x022EBD08
#ifdef JAPAN
#define RUN_FRACTIONAL_TURN_OFFSET -0xA4
#define RUN_FRACTIONAL_TURN_OFFSET_2 -4
#else
#define RUN_FRACTIONAL_TURN_OFFSET 0
#define RUN_FRACTIONAL_TURN_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r4, r0
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	bl TrySpawnMonsterAndActivatePlusMinus
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	mov r0, r4
	bl RunLeaderTurn
	mov r4, r0
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	cmp r4, #0
	beq _022EBD60
	bl DecrementWindCounter
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
_022EBD60:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	bl GetLeader
	mov r8, r0
	bl ov29_02348FD8
	mov r5, #0
	b _022EBECC
_022EBD80:
	ldr r0, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r4, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r4
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EBEC8
	ldr r6, [r4, #0xb4]
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _022EBEC8
	bl IsFloorOver
	cmp r0, #0
	bne _022EBED4
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1, #0xc4]
	bl sub_01FFBDF4
	bl TryActivateArtificialWeatherAbilities
	mov r1, #0
	mov r0, r4
	strb r1, [r6, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl CalcSpeedStageWrapper
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	ldr r3, _022EC300 ; =FRACTIONAL_TURN_SEQUENCE
	ldr r2, [r1]
	mov r1, #0x32
	add r2, r2, #0x700
	ldrsh r2, [r2, #0x80]
	mla r1, r0, r1, r3
	mov r0, r2, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _022EBEC8
	ldrb r0, [r6, #0x152 + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmp r0, #0
	bne _022EBEC8
	ldrh r0, [r6]
	tst r0, #0x8000
	bne _022EBEC8
	tst r0, #0x4000
	bicne r0, r0, #0x4000
	strneh r0, [r6]
	bne _022EBEC8
	mov r1, #0
	mov r0, r4
	strb r1, [r6, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl TickStatusAndHealthRegen
	mov r0, r4
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EBEC8
	mov r0, r4
	bl EnemyEvolution
	mov r0, r4
	mov r1, #1
	bl TryRestoreRoostTyping
	mov sb, #0
	mov r7, sb
	mov r6, sb
	b _022EBEC0
_022EBE80:
	mov r0, r4
	mov r1, r7
	bl RunMonsterAi
	bl IsFloorOver
	cmp r0, #0
	bne _022EBEC8
	mov r0, r4
	bl ExecuteMonsterAction
	cmp r0, #0
	beq _022EBEC8
	mov r0, r6
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	bne _022EBEC8
	add sb, sb, #1
_022EBEC0:
	cmp sb, #3
	blt _022EBE80
_022EBEC8:
	add r5, r5, #1
_022EBECC:
	cmp r5, #4
	blt _022EBD80
_022EBED4:
	mov sb, #0
_022EBED8:
	mov r3, #0
	mov sl, r3
	add r2, sp, #0
_022EBEE4:
	mov r0, r3, lsl #3
	str sl, [r2, r3, lsl #3]
	add r3, r3, #1
	add r1, r2, r3, lsl #3
	add r0, r2, r0
	str r1, [r0, #4]
	cmp r3, #3
	blt _022EBEE4
	str sl, [sp, #0x18]
	str sl, [sp, #0x1c]
	add r4, sp, #0x20
	add fp, sp, #0
	mov r6, #0
_022EBF18:
	ldr r0, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r1, [r7, #0xb4]
	ldrneb r0, [r1, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EBFA8
	ldrb r0, [r1, #7]
	cmp r0, #0
	strneb r6, [r1, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	strneb r6, [r1, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bne _022EBFA8
	ldrsh r1, [r8, #6]
	ldrsh r0, [r7, #6]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [r8, #4]
	ldrsh r1, [r7, #4]
	mov r5, r0
	sub r0, r2, r1
	bl abs
	cmp r0, r5
	movle r0, r5
	cmp r0, #3
	movge r0, #2
	add r2, fp, r0, lsl #3
	ldr r1, [r2, #4]
	add r0, r4, sl, lsl #3
	str r7, [r4, sl, lsl #3]
	str r1, [r0, #4]
	str r0, [r2, #4]
_022EBFA8:
	add sl, sl, #1
	cmp sl, #4
	blt _022EBF18
	mov r7, #0
	add r5, sp, #0
	mov sl, #1
	mov r6, r7
	b _022EC00C
_022EBFC8:
	ldr r4, [r5]
	cmp r4, #0
	beq _022EC008
	ldr r2, [r4, #0xb4]
	mov r0, r4
	strb sl, [r2, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	mov r1, sl
	strb r7, [r2, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl RunMonsterAi
	mov r0, r4
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, r6
	bl TryForcedLoss
	mov r0, r4
	bl EntityIsValid__022EC608
_022EC008:
	ldr r5, [r5, #4]
_022EC00C:
	cmp r5, #0
	bne _022EBFC8
	add sb, sb, #1
	cmp sb, #3
	blt _022EBED8
	bl IsFloorOver
	cmp r0, #0
	bne _022EC094
	mov r4, #0
	ldr r5, _022EC2FC ; =DUNGEON_PTR
	mov r6, r4
_022EC038:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r0, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EC088
	mov r0, r7
	bl ov29_0230FC24
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC088
	mov r0, r7
	bl EnemyEvolution
	strb r6, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
_022EC088:
	add r4, r4, #1
	cmp r4, #4
	blt _022EC038
_022EC094:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	mov sb, #0
	mov r5, sb
	mov r7, sb
	ldr r6, _022EC300 ; =FRACTIONAL_TURN_SEQUENCE
	mov fp, #0x32
	ldr r4, _022EC2FC ; =DUNGEON_PTR
	b _022EC1C0
_022EC0BC:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r8
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC1BC
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
	ldr sl, [r8, #0xb4]
	ldr r1, [r4]
	mov r0, r8
	str r8, [r1, #0xc4]
	bl sub_01FFBDF4
	bl TryActivateArtificialWeatherAbilities
	ldrh r0, [sl]
	tst r0, #0x8000
	bne _022EC1BC
	tst r0, #0x4000
	bicne r0, r0, #0x4000
	strneh r0, [sl]
	bne _022EC1BC
	mov r0, r8
	strb r7, [sl, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl CalcSpeedStageWrapper
	ldr r2, [r4]
	mla r1, r0, fp, r6
	add r0, r2, #0x700
	ldrsh r0, [r0, #0x80]
	mov r0, r0, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _022EC1BC
	ldrb r0, [sl, #0x152 + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmp r0, #0
	bne _022EC1BC
	ldrh r1, [sl]
	mov r0, r8
	bic r1, r1, #0xc000
	strh r1, [sl]
	strb r5, [sl, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl TickStatusAndHealthRegen
	mov r0, r8
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC1BC
	mov r0, r8
	bl EnemyEvolution
	mov r0, r8
	mov r1, #0
	bl RunMonsterAi
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
	mov r0, r8
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
_022EC1BC:
	add sb, sb, #1
_022EC1C0:
	cmp sb, #0x10
	blt _022EC0BC
_022EC1C8:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC23C
	mov r4, #0
	ldr r5, _022EC2FC ; =DUNGEON_PTR
	mov r6, r4
_022EC1E0:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r0, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EC230
	mov r0, r7
	bl ov29_0230FC24
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC230
	mov r0, r7
	bl EnemyEvolution
	strb r6, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
_022EC230:
	add r4, r4, #1
	cmp r4, #0x10
	blt _022EC1E0
_022EC23C:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	ldr r4, _022EC2FC ; =DUNGEON_PTR
	ldr r1, _022EC304 ; =ov29_023522B6
	ldr r0, [r4]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x80]
	add r0, r0, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _022EC2C4
	mov r5, #0
	b _022EC2A4
_022EC278:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb78 + RUN_FRACTIONAL_TURN_OFFSET]
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC2A0
	mov r0, #0
	bl DisplayActions
	b _022EC2AC
_022EC2A0:
	add r5, r5, #1
_022EC2A4:
	cmp r5, #0x14
	blt _022EC278
_022EC2AC:
	mov r0, #1
	mov r1, #0
	bl TryActivateWeather
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
_022EC2C4:
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r1]
	add r0, r0, #0x700
	ldrsh r2, [r0, #0x80]
	add r2, r2, #1
	strh r2, [r0, #0x80]
	ldr r0, [r1]
	add r0, r0, #0x700
	ldrsh r1, [r0, #0x80]
	cmp r1, #0x18
	moveq r1, #0
	streqh r1, [r0, #0x80]
_022EC2F4:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC2FC: .word DUNGEON_PTR
_022EC300: .word FRACTIONAL_TURN_SEQUENCE
_022EC304: .word ov29_023522B6
	arm_func_end RunFractionalTurn

	arm_func_start RunLeaderTurn
RunLeaderTurn: ; 0x022EC308
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl GetLeader
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov29_02348FD8
	bl TryActivateArtificialWeatherAbilities
	mov r0, r4
	bl CalcSpeedStageWrapper
	ldr r1, _022EC600 ; =DUNGEON_PTR
	ldr r3, _022EC604 ; =FRACTIONAL_TURN_SEQUENCE
	ldr r2, [r1]
	mov r1, #0x32
	add r2, r2, #0x700
	mla r1, r0, r1, r3
	ldrsh r2, [r2, #0x80]
	mov r0, r2, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x14e]
#else
	ldrb r0, [r0, #0x152]
#endif
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r4
	mov r1, #1
	bl TryRestoreRoostTyping
_022EC380:
	bl GetLeader
	movs sb, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_01FFBDF4
	mov r0, #0
	bl DisplayActions
	cmp r0, #0
	bne _022EC3C8
	ldr r0, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x78b]
	cmp r0, #0
	ldreqb r0, [r1, #0x78e]
	cmpeq r0, #0
	beq _022EC3C8
	mov r0, #0xc
	bl AdvanceFrame
_022EC3C8:
	cmp sb, #0
	moveq r0, #0
	beq _022EC3E8
	ldr r0, [sb]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_022EC3E8:
	cmp r0, #0
	ldrne r0, [sb, #0xb4]
	movne r1, #0
	strneb r1, [r0, #0x101]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	cmp sl, #0
	str sb, [r2, #0xc4]
	ldr r0, [r0]
	movne sl, r1
	str r1, [r0, #0xc8]
	bne _022EC434
	mov r0, sb
	bl TickStatusAndHealthRegen
_022EC434:
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov29_022E81F8
	mov r0, sb
	bl EnemyEvolution
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x11]
	bl SetLeaderAction
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x11]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sb, #0xb4]
	ldrh r0, [r1]
	tst r0, #0x8000
	bicne r0, r0, #0x8000
	strneh r0, [r1]
	ldrneh r0, [r1]
	orrne r0, r0, #0x4000
	strneh r0, [r1]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _022EC59C
	mov r7, #0
	strb r7, [r1, #0x10]
	mov r5, r7
	mov fp, r7
	b _022EC594
_022EC500:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC590
	ldr r8, [r6, #0xb4]
	ldrh r0, [r8]
	tst r0, #0x8000
	beq _022EC590
	bl IsFloorOver
	cmp r0, #0
	bne _022EC59C
	mov r0, r6
	bl TickStatusAndHealthRegen
	mov r0, r6
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC590
	mov r0, r6
	bl EnemyEvolution
	mov r0, r6
	mov r1, r5
	bl RunMonsterAi
	mov r0, r6
	bl ExecuteMonsterAction
	mov r0, fp
	bl TryForcedLoss
	ldrh r0, [r8]
	bic r0, r0, #0x8000
	strh r0, [r8]
	ldrh r0, [r8]
	orr r0, r0, #0x4000
	strh r0, [r8]
_022EC590:
	add r7, r7, #1
_022EC594:
	cmp r7, #0x14
	blt _022EC500
_022EC59C:
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0xc8]
	cmp r0, #0
	beq _022EC5DC
	bl ChangeLeader
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	mov sl, #1
	str r1, [r0, #0xc8]
	b _022EC380
_022EC5DC:
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0x101]
	cmp r0, #0
	addne r0, r1, #0x700
	movne r1, #0
	strneh r1, [r0, #0x80]
	bne _022EC380
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC600: .word DUNGEON_PTR
_022EC604: .word FRACTIONAL_TURN_SEQUENCE
	arm_func_end RunLeaderTurn
