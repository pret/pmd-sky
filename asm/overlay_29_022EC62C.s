	.include "asm/macros.inc"
	.include "overlay_29_022EC62C.inc"

	.text

	arm_func_start ov29_022EC62C
ov29_022EC62C: ; 0x022EC62C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	bl GetLeader
	cmp r6, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r7, _022EC6D8 ; =DUNGEON_PTR
	ldr r1, [r7]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	strb r4, [r1, #0x10]
	mov sb, r4
	mov r8, r4
	b _022EC6CC
_022EC668:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78]
	mov r0, r5
	bl EntityIsValid__022EC608
	cmp r0, #0
	cmpne r6, r5
	beq _022EC6C8
	ldr r0, [r5, #0xb4]
	ldrh r0, [r0]
	tst r0, #0x8000
	beq _022EC6C8
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	mov r1, sb
	bl RunMonsterAi
	mov r0, r5
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, r8
	bl TryForcedLoss
_022EC6C8:
	add r4, r4, #1
_022EC6CC:
	cmp r4, #0x14
	blt _022EC668
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EC6D8: .word DUNGEON_PTR
	arm_func_end ov29_022EC62C

	arm_func_start TrySpawnMonsterAndActivatePlusMinus
TrySpawnMonsterAndActivatePlusMinus: ; 0x022EC6DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022EC7E0 ; =DUNGEON_PTR
	ldr r1, _022EC7E4 ; =ov29_023522B6
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x80]
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl TrySpawnMonsterAndTickSpawnCounter
	ldr r4, _022EC7E0 ; =DUNGEON_PTR
	mov r8, #0
	ldr r0, [r4]
	mov fp, #1
	add r0, r0, #0x3000
	strb r8, [r0, #0xe34]
	ldr r0, [r4]
	mov r7, r8
	add r0, r0, #0x3000
	strb r8, [r0, #0xe35]
	ldr r0, [r4]
	mov r6, fp
	add r0, r0, #0x3000
	strb r8, [r0, #0xe36]
	ldr r0, [r4]
	mov r5, fp
	add r0, r0, #0x3000
	strb r8, [r0, #0xe37]
_022EC750:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC7C8
	ldr r0, [sb, #0xb4]
	mov r1, #0x3f
	strb r7, [r0, #0x152]
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq sl, fp
	mov r0, sb
	movne sl, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	mov r1, #0x38
	addne r0, r0, sl
	addne r0, r0, #0x3000
	strneb r6, [r0, #0xe36]
	mov r0, sb
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, sl
	addne r0, r0, #0x3000
	strneb r5, [r0, #0xe34]
_022EC7C8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022EC750
	mov r0, #0
	bl TryForcedLoss
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC7E0: .word DUNGEON_PTR
_022EC7E4: .word ov29_023522B6
	arm_func_end TrySpawnMonsterAndActivatePlusMinus

	arm_func_start IsFloorOver
IsFloorOver: ; 0x022EC7E8
	stmdb sp!, {r3, lr}
	ldr r0, _022EC858 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl GetLeader
	cmp r0, #0
	ldreq r1, _022EC858 ; =DUNGEON_PTR
	moveq r0, #1
	ldreq r1, [r1]
	streqb r0, [r1, #0x758]
	ldmeqia sp!, {r3, pc}
	ldr r0, _022EC858 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #1
	moveq r0, #2
	streqb r0, [r1, #0x758]
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	moveq r0, #2
	streqb r0, [r1, #0x758]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EC858: .word DUNGEON_PTR
	arm_func_end IsFloorOver

	arm_func_start ov29_022EC85C
ov29_022EC85C: ; 0x022EC85C
	stmdb sp!, {r3, lr}
	bl GetForcedLossReason
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl IsFloorOver
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022EC85C

	arm_func_start ov29_022EC878
ov29_022EC878: ; 0x022EC878
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	ldr r1, _022EC8A4 ; =ov29_02353598
	strb r2, [r0, #5]
	mov r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_022EC8A4: .word ov29_02353598
	arm_func_end ov29_022EC878

	arm_func_start ov29_022EC8A8
ov29_022EC8A8: ; 0x022EC8A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r0, r2
	mov r1, #0x30
	mov r4, r3
	bl _s32_div_f
	mov r3, r1, lsl #1
	and r0, r3, #0xff
	mov r2, r0, lsr #1
	ldr r1, _022EC998 ; =ov29_02352390
	mov r0, #0xc0
	strb r3, [r6, #4]
	add r2, r2, #1
	strb r2, [r6, #2]
	add r4, r4, #2
	smlabb r5, r5, r0, r1
	b _022EC96C
_022EC8F0:
	strb r4, [r6, #3]
	mov r8, #0x63
	ldr r7, _022EC99C ; =DUNGEON_PTR
	b _022EC93C
_022EC900:
	ldrb r1, [r6, #3]
	mov r0, r8
	sub r1, r1, #1
	strb r1, [r6, #3]
	ldrb r1, [r6, #5]
	eor r1, r1, #1
	strb r1, [r6, #5]
	ldrb r3, [r6, #4]
	and r2, r1, #0xff
	ldr r1, [r7]
	add r2, r3, r2
	ldr r2, [r5, r2, lsl #2]
	add r1, r1, #0x1a000
	str r2, [r1, #0x230]
	bl AdvanceFrame
_022EC93C:
	ldrb r0, [r6, #3]
	cmp r0, #0
	bne _022EC900
	ldrb r0, [r6, #4]
	cmp r0, #0
	subne r0, r0, #2
	strneb r0, [r6, #4]
	mov r0, #0
	strb r0, [r6, #5]
	ldrb r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [r6, #2]
_022EC96C:
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _022EC8F0
	ldr r0, _022EC99C ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r0]
	ldr r1, _022EC9A0 ; =ov29_02353598
	add r0, r0, #0x1a000
	str r2, [r0, #0x230]
	strb r2, [r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022EC998: .word ov29_02352390
_022EC99C: .word DUNGEON_PTR
_022EC9A0: .word ov29_02353598
	arm_func_end ov29_022EC8A8

	arm_func_start ov29_022EC9A4
ov29_022EC9A4: ; 0x022EC9A4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r3, #0xc
	smulbb r3, r1, r3
	ldr r1, _022ECAD8 ; =ov10_022C6320
	mov r6, r0
	ldrb r4, [r1, r3]
	mov r5, r2
	cmp r4, #5
	beq _022ECA28
	cmp r5, #0
	bne _022EC9E0
	ldr r1, _022ECADC ; =0x00000BFD
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA18
_022EC9E0:
	cmp r5, #1
	bne _022EC9F4
	ldr r1, _022ECAE0 ; =0x00000BFE
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA18
_022EC9F4:
	cmp r5, #2
	bne _022ECA08
	ldr r1, _022ECAE4 ; =0x00000BFF
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA18
_022ECA08:
	cmp r5, #3
	bne _022ECA18
	mov r1, #0xc00
	bl LogMessageByIdWithPopupCheckUser
_022ECA18:
	mov r0, r4
	mov r1, #0
	bl ov29_022E5DBC
	b _022ECAD0
_022ECA28:
	bl ov29_022EAEF0
	mov r4, r0
	cmp r5, #0
	bne _022ECA48
	ldr r1, _022ECAE8 ; =0x00000C01
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA8C
_022ECA48:
	cmp r5, #1
	bne _022ECA60
	ldr r1, _022ECAEC ; =0x00000C02
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA8C
_022ECA60:
	cmp r5, #2
	bne _022ECA78
	ldr r1, _022ECAF0 ; =0x00000C03
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022ECA8C
_022ECA78:
	cmp r5, #3
	bne _022ECA8C
	ldr r1, _022ECAF4 ; =0x00000C04
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_022ECA8C:
	add r0, sp, #0
	bl ov29_022EC878
	ldr r0, _022ECAF8 ; =ov29_02352380
	ldr r0, [r0, r5, lsl #2]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ChangeDungeonMusic
	mov r0, r5, lsl #2
	add r0, r0, #8
	mov r2, r0, lsl #0x10
	mov r3, r2, asr #0x10
	add r0, sp, #0
	mov r1, r5
	mov r2, #0x10
	bl ov29_022EC8A8
	mov r0, r4
	bl ChangeDungeonMusic
_022ECAD0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022ECAD8: .word ov10_022C6320
_022ECADC: .word 0x00000BFD
_022ECAE0: .word 0x00000BFE
_022ECAE4: .word 0x00000BFF
_022ECAE8: .word 0x00000C01
_022ECAEC: .word 0x00000C02
_022ECAF0: .word 0x00000C03
_022ECAF4: .word 0x00000C04
_022ECAF8: .word ov29_02352380
	arm_func_end ov29_022EC9A4

	arm_func_start ov29_022ECAFC
ov29_022ECAFC: ; 0x022ECAFC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	add r0, sp, #0
	bl ov29_022EC878
	mov r0, r4, lsl #2
	add r0, r0, #2
	mov r2, r0, lsl #0x10
	mov r3, r2, asr #0x10
	add r0, sp, #0
	mov r1, r4
	mov r2, #8
	bl ov29_022EC8A8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022ECAFC

	arm_func_start ov29_022ECB38
ov29_022ECB38: ; 0x022ECB38
	ldr r0, _022ECB44 ; =ov29_02353598
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_022ECB44: .word ov29_02353598
	arm_func_end ov29_022ECB38

	arm_func_start DecrementWindCounter
DecrementWindCounter: ; 0x022ECB48
	stmdb sp!, {r4, lr}
	bl GetLeader
	movs r4, r0
	moveq r0, #0
	beq _022ECB70
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022ECB70:
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r1, [r0, #0x84]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0, #0x84]
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x84]
	cmp r0, #1
	movlt r0, #3
	strltb r0, [r1, #0x79a]
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x79a]
	cmp r0, #0
	bne _022ECC2C
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x84]
	cmp r0, #0xfa
	ldmgeia sp!, {r4, pc}
	bl ov29_022F2FE4
	mov r1, #1
	mov r0, r4
	mov r2, r1
	bl TryPointCameraToMonster
	mov r0, r4
	bl DisplayActions
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022ECD7C ; =DUNGEON_PTR
	mov r0, r4
	ldr r2, [r1]
	add r1, r2, #0x4000
	ldrsh r1, [r1, #0xd4]
	ldrb r2, [r2, #0x79a]
	bl ov29_022EC9A4
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x79a]
	ldmia sp!, {r4, pc}
_022ECC2C:
	cmp r0, #1
	bne _022ECC9C
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x84]
	cmp r0, #0x96
	ldmgeia sp!, {r4, pc}
	bl ov29_022F2FE4
	mov r1, #1
	mov r0, r4
	mov r2, r1
	bl TryPointCameraToMonster
	mov r0, r4
	bl DisplayActions
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022ECD7C ; =DUNGEON_PTR
	mov r0, r4
	ldr r2, [r1]
	add r1, r2, #0x4000
	ldrsh r1, [r1, #0xd4]
	ldrb r2, [r2, #0x79a]
	bl ov29_022EC9A4
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	mov r1, #2
	ldr r0, [r0]
	strb r1, [r0, #0x79a]
	ldmia sp!, {r4, pc}
_022ECC9C:
	cmp r0, #2
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x84]
	bne _022ECD0C
	cmp r0, #0x32
	ldmgeia sp!, {r4, pc}
	bl ov29_022F2FE4
	mov r1, #1
	mov r0, r4
	mov r2, r1
	bl TryPointCameraToMonster
	mov r0, r4
	bl DisplayActions
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022ECD7C ; =DUNGEON_PTR
	mov r0, r4
	ldr r2, [r1]
	add r1, r2, #0x4000
	ldrsh r1, [r1, #0xd4]
	ldrb r2, [r2, #0x79a]
	bl ov29_022EC9A4
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x79a]
	ldmia sp!, {r4, pc}
_022ECD0C:
	cmp r0, #1
	ldmgeia sp!, {r4, pc}
	bl ov29_022F2FE4
	mov r1, #1
	mov r0, r4
	mov r2, r1
	bl TryPointCameraToMonster
	mov r0, r4
	bl DisplayActions
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022ECD7C ; =DUNGEON_PTR
	mov r0, r4
	ldr r2, [r1]
	add r1, r2, #0x4000
	ldrsh r1, [r1, #0xd4]
	ldrb r2, [r2, #0x79a]
	bl ov29_022EC9A4
	ldr r0, _022ECD7C ; =DUNGEON_PTR
	ldr r1, _022ECD80 ; =0x0000025D
	ldr r3, [r0]
	mov ip, #4
	mov r0, r4
	mov r2, r4
	strb ip, [r3, #0x79a]
	bl HandleFaint
	ldmia sp!, {r4, pc}
	.align 2, 0
_022ECD7C: .word DUNGEON_PTR
_022ECD80: .word 0x0000025D
	arm_func_end DecrementWindCounter

	arm_func_start ov29_022ECD84
ov29_022ECD84: ; 0x022ECD84
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__022ECDC0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	cmp r0, #1
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0xb4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022ECDBC ; =ov29_0237C974
	bl GetMonsterName
	ldmia sp!, {r4, pc}
	.align 2, 0
_022ECDBC: .word ov29_0237C974
	arm_func_end ov29_022ECD84
