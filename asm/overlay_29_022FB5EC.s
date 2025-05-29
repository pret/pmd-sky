	.include "asm/macros.inc"
	.include "overlay_29_022FB5EC.inc"

	.text

	arm_func_start CheckSpawnThreshold
CheckSpawnThreshold: ; 0x022FB5EC
	stmdb sp!, {r4, lr}
	bl GetSpawnThreshold
	mov r4, r0
	bl GetScenarioBalanceVeneer
	cmp r4, r0
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end CheckSpawnThreshold

	arm_func_start HasLowHealth
HasLowHealth: ; 0x022FB610
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r3, [r4, #0xb4]
	ldr r0, _022FB674 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r3, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FB674: .word 0x000003E7
	arm_func_end HasLowHealth

	arm_func_start AreEntitiesAdjacent
AreEntitiesAdjacent: ; 0x022FB678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	ldr r4, _022FB6E0 ; =DIRECTIONS_XY
	b _022FB6D0
_022FB690:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh r3, [r4, r1]
	ldrsh ip, [r7, #4]
	ldrsh r1, [r0, #2]
	ldrsh r2, [r7, #6]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, r6
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022FB6D0:
	cmp r5, #8
	blt _022FB690
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FB6E0: .word DIRECTIONS_XY
	arm_func_end AreEntitiesAdjacent

	arm_func_start ov29_022FB6E4
ov29_022FB6E4: ; 0x022FB6E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xd6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022FB6E4

	arm_func_start ov29_022FB718
ov29_022FB718: ; 0x022FB718
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, [sl, #0xb4]
	mov r1, #0
	mov r0, sl
	strh r1, [sb, #0x16]
	bl Conversion2IsActive
	mov r6, r0
	mov r0, sl
	mov r1, #0x38
	ldr r4, [sl, #0xb4]
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _022FB834 ; =_020A1870
	mov r8, #0
	ldrnesh r1, [r4, #0x16]
	ldrnesh r0, [r0]
#ifdef JAPAN
	add r5, r4, #0x120
#else
	add r5, r4, #0x124
#endif
	mov fp, r8
	addne r0, r1, r0
	strneh r0, [r4, #0x16]
	mov r4, #1
_022FB77C:
	ldrb r0, [r5, r8, lsl #3]
	add r7, r5, r8, lsl #3
	tst r0, #1
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	beq _022FB7C0
	ldrh r2, [r7, #2]
	mov r0, sl
	mov r1, #0x39
	bic r2, r2, #0x100
	strh r2, [r7, #2]
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneh r0, [r7, #2]
	orrne r0, r0, #0x100
	strneh r0, [r7, #2]
_022FB7C0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FB77C
	mov r0, sl
	bl ov29_02348100
	cmp r6, #2
	bne _022FB7FC
	mov r0, sl
	bl Conversion2IsActive
	cmp r0, #0
	bne _022FB7FC
	mov r0, sl
	bl ov29_02307CE0
_022FB7FC:
	ldrsh r1, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	ldr r2, _022FB838 ; =0x000003E7
	add r1, r1, r0
	cmp r1, r2
	ldrsh r0, [sb, #0x10]
	movle r2, r1
	cmp r0, r2
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022FB838 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [sb, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FB834: .word _020A1870
_022FB838: .word 0x000003E7
	arm_func_end ov29_022FB718

	arm_func_start ov29_022FB83C
ov29_022FB83C: ; 0x022FB83C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r8, [sl, #0xb4]
	mov r7, #0
#ifdef JAPAN
	add r6, r8, #0x120
#else
	add r6, r8, #0x124
#endif
	mov r4, r7
	mov r5, #1
_022FB868:
	ldrb r0, [r6, r7, lsl #3]
	mov r1, r7, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB88C
	add r0, r6, r1
	bl GetMoveBasePp
_022FB88C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FB868
	mov r0, sl
	bl ov29_022FB718
	cmp sb, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrsh r2, [r8, #0x12]
	ldrsh r1, [r8, #0x16]
	ldr r0, _022FB91C ; =0x000003E7
	mov sb, #0
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r8, #0x10]
#ifdef JAPAN
	add r6, r8, #0x120
#else
	add r6, r8, #0x124
#endif
	mov r4, sb
	mov r5, #1
_022FB8DC:
	ldrb r0, [r6, sb, lsl #3]
	add r7, r6, sb, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB904
	mov r0, r7
	bl GetMaxPp
	strb r0, [r7, #6]
_022FB904:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _022FB8DC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FB91C: .word 0x000003E7
	arm_func_end ov29_022FB83C

	arm_func_start ov29_022FB920
ov29_022FB920: ; 0x022FB920
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _022FB980 ; =DUNGEON_PTR
	mov r4, r0
	mov r6, #0
_022FC33C_EU:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	bl ov29_022FB718
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _022FC33C_EU
	bl UpdateMapSurveyorFlag
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl UpdateMinimap
	ldmia sp!, {r4, r5, r6, pc}
#else
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022FB980 ; =DUNGEON_PTR
	mov r5, #0
_022FB92C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl ov29_022FB718
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _022FB92C
	mov r0, #0x41
	bl TeamMemberHasEnabledIqSkill
	cmp r0, #0
	ldrne r0, _022FB980 ; =DUNGEON_PTR
	movne r1, #1
	ldreq r0, _022FB980 ; =DUNGEON_PTR
	moveq r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x19d]
#else
	strb r1, [r0, #0x241]
#endif
	ldmia sp!, {r3, r4, r5, pc}
#endif
	.align 2, 0
_022FB980: .word DUNGEON_PTR
	arm_func_end ov29_022FB920

	arm_func_start ov29_022FB984
ov29_022FB984: ; 0x022FB984
	mov r0, #0
	bx lr
	arm_func_end ov29_022FB984

	arm_func_start ov29_022FB98C
ov29_022FB98C: ; 0x022FB98C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r2, #1
	ldr r0, _022FB9B8 ; =0x0000270F
	mov r4, r1
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
	mov r0, r5
	mov r1, r4
	bl ov29_022E576C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FB9B8: .word 0x0000270F
	arm_func_end ov29_022FB98C

	arm_func_start ov29_022FB9BC
ov29_022FB9BC: ; 0x022FB9BC
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FB9BC

	arm_func_start ov29_022FB9E0
ov29_022FB9E0: ; 0x022FB9E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBA4C
	ldr r1, [r5, #0xb4]
	mov r0, #0
#ifdef JAPAN
	add ip, r1, #0x120
#else
	add ip, r1, #0x124
#endif
	mov r2, r0
	mov r3, #1
	b _022FBA44
_022FBA10:
	ldrb r1, [ip, r0, lsl #3]
	add lr, ip, r0, lsl #3
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _022FBA38
	ldrh r1, [lr, #4]
	cmp r1, r4
	ldmeqia sp!, {r3, r4, r5, pc}
_022FBA38:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022FBA44:
	cmp r0, #4
	blt _022FBA10
_022FBA4C:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FB9E0

	arm_func_start ov29_022FBA54
ov29_022FBA54: ; 0x022FBA54
	stmdb sp!, {r3, lr}
	bl ov29_022FB9E0
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FBA54

	arm_func_start ov29_022FBA70
ov29_022FBA70: ; 0x022FBA70
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBAAC
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xfa
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #0xd9
	blo _022FBAAC
	cmp r0, #0xe4
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_022FBAAC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022FBA70

	arm_func_start ov29_022FBAB4
ov29_022FBAB4: ; 0x022FBAB4
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	addne r0, r2, #0x100
	movne r1, #0
#ifdef JAPAN
	strneh r1, [r0, #0x8e]
	strne r1, [r2, #0x188]
#else
	strneh r1, [r0, #0x92]
	strne r1, [r2, #0x18c]
#endif
	bx lr
	arm_func_end ov29_022FBAB4
