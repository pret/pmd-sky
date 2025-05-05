	.include "asm/macros.inc"
	.include "overlay_29_0233861C.inc"

	.text

	arm_func_start UpdateShouldBoostHiddenStairsSpawnChance
UpdateShouldBoostHiddenStairsSpawnChance: ; 0x0233861C
	stmdb sp!, {r3, lr}
	ldr r0, _02338658 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x5f
	add r1, r1, #0x12000
#ifdef JAPAN
	strb r2, [r1, #0xa81]
#else
	strb r2, [r1, #0xb25]
#endif
	bl TeamMemberHasExclusiveItemEffectActive
	cmp r0, #0
	ldrne r0, _02338658 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x12000
#ifdef JAPAN
	strneb r1, [r0, #0xa81]
#else
	strneb r1, [r0, #0xb25]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338658: .word DUNGEON_PTR
	arm_func_end UpdateShouldBoostHiddenStairsSpawnChance

	arm_func_start IsSecretRoom
IsSecretRoom: ; 0x0233865C
	ldr r0, _02338680 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0x71
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02338680: .word DUNGEON_PTR
	arm_func_end IsSecretRoom

	arm_func_start IsSecretFloor
IsSecretFloor: ; 0x02338684
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	bne _023386A0
	bl IsSecretRoom
	cmp r0, #0
	beq _023386A8
_023386A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023386A8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSecretFloor

	arm_func_start GetCurrentHiddenStairsType
GetCurrentHiddenStairsType: ; 0x023386B0
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl IsSecretRoom
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetCurrentHiddenStairsType

	arm_func_start HiddenStairsPresent
HiddenStairsPresent: ; 0x023386D8
	ldr r0, _02338704 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
#ifdef JAPAN
	ldrsh r2, [r0, #0x44]
	cmp r2, r1
	ldrnesh r0, [r0, #0x46]
#else
	ldrsh r2, [r0, #0xe8]
	cmp r2, r1
	ldrnesh r0, [r0, #0xea]
#endif
	cmpne r0, r1
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_02338704: .word DUNGEON_PTR
	arm_func_end HiddenStairsPresent

	arm_func_start PositionIsOnHiddenStairs
PositionIsOnHiddenStairs: ; 0x02338708
	ldr r1, _02338738 ; =DUNGEON_PTR
	ldrsh r2, [r0]
	ldr r1, [r1]
	add r1, r1, #0xcc00
#ifdef JAPAN
	ldrsh r3, [r1, #0x44]
	cmp r3, r2
	ldreqsh r1, [r1, #0x46]
#else
	ldrsh r3, [r1, #0xe8]
	cmp r3, r2
	ldreqsh r1, [r1, #0xea]
#endif
	ldreqsh r0, [r0, #2]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02338738: .word DUNGEON_PTR
	arm_func_end PositionIsOnHiddenStairs

	arm_func_start ov29_0233873C
ov29_0233873C: ; 0x0233873C
	stmdb sp!, {r3, lr}
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _02338764 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x44
#else
	add r0, r0, #0xe8
#endif
	add r0, r0, #0xcc00
	bl ov29_02338768
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338764: .word DUNGEON_PTR
	arm_func_end ov29_0233873C

	arm_func_start ov29_02338768
ov29_02338768: ; 0x02338768
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_022E2418
	mov r4, r0
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTileSafe
	str r4, [r0, #0x10]
	mov r0, #0
	strb r0, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02338768

	arm_func_start HiddenStairsTrigger
HiddenStairsTrigger: ; 0x02338794
#ifdef JAPAN
#define HIDDEN_STAIRS_TRIGGER_OFFSET -0xA4
#else
#define HIDDEN_STAIRS_TRIGGER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl GetTileSafe
	mov r4, r0
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x1a000
	ldrb r1, [r0, #0x246 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmp r1, #0
	ldreqb r0, [r0, #0x244 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmpeq r0, #0
	bne _0233881C
	cmp r5, #0
	beq _0233881C
	add r0, r2, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET
	add r0, r0, #0xcc00
	mov r1, #0x41
	mov r2, #1
	bl PlayEffectAnimationPos
	bl GetLeader
	ldr r1, _0233884C ; =0x00000F31
	bl LogMessageByIdWithPopupCheckUser
_0233881C:
	ldr r1, [r4, #0x10]
	mov r2, #1
	ldr r0, _02338848 ; =DUNGEON_PTR
	strb r2, [r1, #0x20]
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl DrawMinimapTile
	bl UpdateTrapsVisibility
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02338848: .word DUNGEON_PTR
#ifdef JAPAN
_0233884C: .word 0x000008A8
#else
_0233884C: .word 0x00000F31
#endif
	arm_func_end HiddenStairsTrigger

	arm_func_start GetHiddenStairsField
GetHiddenStairsField: ; 0x02338850
	ldr r0, _02338864 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldr r0, [r0, #0x28]
#else
	ldr r0, [r0, #0xcc]
#endif
	bx lr
	.align 2, 0
_02338864: .word DUNGEON_PTR
	arm_func_end GetHiddenStairsField

	arm_func_start SetHiddenStairsField
SetHiddenStairsField: ; 0x02338868
	ldr r1, _0233887C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	str r0, [r1, #0x28]
#else
	str r0, [r1, #0xcc]
#endif
	bx lr
	.align 2, 0
_0233887C: .word DUNGEON_PTR
	arm_func_end SetHiddenStairsField

	arm_func_start GetHiddenFloorField
GetHiddenFloorField: ; 0x02338880
	ldr r0, _02338894 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldr r0, [r0, #0x2c]
#else
	ldr r0, [r0, #0xd0]
#endif
	bx lr
	.align 2, 0
_02338894: .word DUNGEON_PTR
	arm_func_end GetHiddenFloorField

	arm_func_start SetHiddenFloorField
SetHiddenFloorField: ; 0x02338898
	ldr r1, _023388AC ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	str r0, [r1, #0x2c]
#else
	str r0, [r1, #0xd0]
#endif
	bx lr
	.align 2, 0
_023388AC: .word DUNGEON_PTR
	arm_func_end SetHiddenFloorField

	arm_func_start LoadWeather3DFiles
LoadWeather3DFiles: ; 0x023388B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _02338974 ; =ov29_02352F1C
	mov sl, #0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r7, _02338978 ; =ov29_02352F40
	add r8, sp, #0
	str r1, [sp, #4]
	str r0, [sp]
	mov r6, #4
	mov r5, #0x300
	mov fp, sl
	mov r4, #0x14
_023388E8:
	mul sb, sl, r4
	ldrh r2, [r7, sb]
	mov r0, r8
	mov r1, r6
	mov r3, r5
	add sb, r7, sb
	bl LoadWteFromFileDirectory
	ldrsh r2, [sb, #8]
	ldr r0, [sp, #4]
	ldr r1, [sb, #4]
	mov r3, fp
	bl ProcessWte
	mov r0, r8
	bl DelayWteFree
	add sl, sl, #1
	cmp sl, #3
	blt _023388E8
	ldr r0, _0233897C ; =ov29_0237CACC
	mov r1, #0
	bl ov29_02338D94
	ldr r0, _02338980 ; =ov29_0237CD40
	mov r1, #1
	bl ov29_02338D94
	ldr r0, _02338984 ; =ov29_02352F7C
	ldr r2, _0233897C ; =ov29_0237CACC
	mov r1, #0
	ldr r4, [r0]
	strb r1, [r2, #0x240]
	ldr r3, [r0, #4]
	str r4, [r2, #0x254]
	ldr r0, _02338980 ; =ov29_0237CD40
	str r3, [r2, #0x258]
	bl ov29_02338D34
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338974: .word ov29_02352F1C
_02338978: .word ov29_02352F40
_0233897C: .word ov29_0237CACC
_02338980: .word ov29_0237CD40
_02338984: .word ov29_02352F7C
	arm_func_end LoadWeather3DFiles

	arm_func_start ov29_02338988
ov29_02338988: ; 0x02338988
	stmdb sp!, {r3, lr}
	ldr r0, _023389BC ; =ov29_0237CACC
	bl ov29_02338D58
	cmp r0, #0
	bne _023389AC
	ldr r0, _023389C0 ; =ov29_0237CD40
	bl ov29_02338D58
	cmp r0, #0
	beq _023389B4
_023389AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023389B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023389BC: .word ov29_0237CACC
_023389C0: .word ov29_0237CD40
	arm_func_end ov29_02338988

	arm_func_start ov29_023389C4
ov29_023389C4: ; 0x023389C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r0, #0xc
	mul r2, r4, r0
	ldr r1, _02338A3C ; =ov10_022C6326
	ldr r0, _02338A40 ; =ov29_0237CACC
	ldrb r1, [r1, r2]
	bl ov29_02338D34
	cmp r4, #0xc3
	bne _02338A34
	ldr r1, _02338A44 ; =ov29_02352F1C
	ldr r2, _02338A48 ; =0x000003EB
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	str r3, [sp, #4]
	add r0, sp, #0
	mov r1, #4
	mov r3, #0
	str ip, [sp]
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0xb000
	mov r2, #0x14
	mov r3, #0
	bl ProcessWte
	add r0, sp, #0
	bl DelayWteFree
_02338A34:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02338A3C: .word ov10_022C6326
_02338A40: .word ov29_0237CACC
_02338A44: .word ov29_02352F1C
_02338A48: .word 0x000003EB
	arm_func_end ov29_023389C4

	arm_func_start ov29_02338A4C
ov29_02338A4C: ; 0x02338A4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02338AB4 ; =ov29_02353730
	mov r4, r0
	ldrb r1, [r1, r4, lsl #3]
	ldr r0, _02338AB8 ; =ov29_0237CD40
	bl ov29_02338D34
	ldr r1, _02338ABC ; =ov29_0235372C
	mov sb, #0
	ldr r7, [r1, r4, lsl #3]
	ldr r0, _02338AC0 ; =ov29_0237CACC
	ldr r5, _02338AB8 ; =ov29_0237CD40
	str r7, [r0, #0x4e4]
	mov r6, sb
	mov r4, #0xc0
_02338A84:
	mla sl, sb, r4, r5
	mov r8, r6
_02338A8C:
	mov r1, r7
	add r0, sl, r8, lsl #6
	bl ov29_02338E50
	add r8, r8, #1
	cmp r8, #3
	blt _02338A8C
	add sb, sb, #1
	cmp sb, #3
	blt _02338A84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02338AB4: .word ov29_02353730
_02338AB8: .word ov29_0237CD40
_02338ABC: .word ov29_0235372C
_02338AC0: .word ov29_0237CACC
	arm_func_end ov29_02338A4C

	arm_func_start RenderWeather3D
RenderWeather3D: ; 0x02338AC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
_02338ACC:
	ldr r1, _02338D28 ; =ov29_0237CACC
	mov r0, #0x274
	mla r6, r5, r0, r1
	ldrb r0, [r6, #0x240]
	cmp r0, #0
	beq _02338D18
	bl ov29_022E3580
	cmp r0, #0
	movne r0, #0
	strneb r0, [r6, #0x26d]
	bne _02338B04
	mov r0, r6
	mov r1, #1
	bl ov29_02338D6C
_02338B04:
	mov r0, r6
	bl ov29_02338D58
	cmp r0, #0
	beq _02338D18
	ldr r4, [r6, #0x24c]
	ldr fp, [r6, #0x250]
	mov r7, #0
_02338B20:
	mov r0, #0xc0
	mla sl, r7, r0, r6
	mov r0, r7, lsl #7
	add sb, r0, fp, asr #8
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	mov r8, #0
	str r0, [sp]
_02338B40:
	cmp sb, #0xc0
	bge _02338B74
	mov r0, r8, lsl #7
	ldr r1, [r6, #0x244]
	add r2, r0, r4, asr #8
	mov r0, r8, lsl #6
	strh r2, [sl, r0]
	ldr r2, [sp]
	add r0, sl, r8, lsl #6
	strh r2, [r0, #2]
	mov r1, r1, asr #8
	strb r1, [r0, #0x2f]
	bl sub_0201F2A0
_02338B74:
	add r8, r8, #1
	cmp r8, #3
	blt _02338B40
	add r7, r7, #1
	cmp r7, #3
	blt _02338B20
	ldrb r0, [r6, #0x240]
	cmp r0, #9
	beq _02338BBC
	ldr r1, [r6, #0x24c]
	ldr r0, [r6, #0x254]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r1, [r6, #0x250]
	ldr r0, [r6, #0x258]
	add r0, r1, r0
	str r0, [r6, #0x250]
	b _02338C48
_02338BBC:
	ldr r0, [r6, #0x25c]
	bl sub_020018D0
	ldr r3, [r6, #0x254]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r1, [r6, #0x24c]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r0, [r6, #0x260]
	bl sub_020018D0
	ldr r3, [r6, #0x258]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r2, [r6, #0x250]
	ldr r1, _02338D2C ; =0x00000FFF
	add r0, r2, r0
	str r0, [r6, #0x250]
	ldr r2, [r6, #0x25c]
	ldr r0, [r6, #0x264]
	add r0, r2, r0
	str r0, [r6, #0x25c]
	ldr r2, [r6, #0x260]
	ldr r0, [r6, #0x268]
	add r0, r2, r0
	str r0, [r6, #0x260]
	ldr r0, [r6, #0x25c]
	and r0, r0, r1
	str r0, [r6, #0x25c]
	ldr r0, [r6, #0x260]
	and r0, r0, r1
	str r0, [r6, #0x260]
_02338C48:
	ldr r1, [r6, #0x24c]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x24c]
	bgt _02338C70
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x24c]
_02338C70:
	ldr r1, [r6, #0x250]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x250]
	bgt _02338C98
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x250]
_02338C98:
	ldrb r0, [r6, #0x26e]
	cmp r0, #0
	beq _02338CC8
	ldr r0, [r6, #0x244]
	add r0, r0, #0x400
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movge r0, #1
	strgeb r0, [r6, #0x26c]
	movge r0, #0
	strgeb r0, [r6, #0x26e]
	b _02338D18
_02338CC8:
	ldrb r0, [r6, #0x26c]
	ldr r1, [r6, #0x244]
	cmp r0, #0
	ldr r0, [r6, #0x248]
	bne _02338CFC
	sub r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movlt r0, #1
	strltb r0, [r6, #0x26c]
	movlt r0, #0x4000
	strlt r0, [r6, #0x244]
	b _02338D18
_02338CFC:
	add r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0xc000
	movgt r0, #0
	strgtb r0, [r6, #0x26c]
	movgt r0, #0xc000
	strgt r0, [r6, #0x244]
_02338D18:
	add r5, r5, #1
	cmp r5, #2
	blt _02338ACC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338D28: .word ov29_0237CACC
_02338D2C: .word 0x00000FFF
	arm_func_end RenderWeather3D

	arm_func_start ov29_02338D30
ov29_02338D30: ; 0x02338D30
	bx lr
	arm_func_end ov29_02338D30

	arm_func_start ov29_02338D34
ov29_02338D34: ; 0x02338D34
	ldr r3, _02338D54 ; =ov29_02352F7C
	strb r1, [r0, #0x240]
	add r2, r3, r1, lsl #3
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, #4]
	str r3, [r0, #0x254]
	str r1, [r0, #0x258]
	bx lr
	.align 2, 0
_02338D54: .word ov29_02352F7C
	arm_func_end ov29_02338D34

	arm_func_start ov29_02338D58
ov29_02338D58: ; 0x02338D58
	ldrb r1, [r0, #0x240]
	cmp r1, #0
	moveq r0, #0
	ldrneb r0, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D58

	arm_func_start ov29_02338D6C
ov29_02338D6C: ; 0x02338D6C
	cmp r1, #0
	beq _02338D8C
	ldrb r2, [r0, #0x26d]
	cmp r2, #0
	moveq r2, #1
	streqb r2, [r0, #0x26e]
	moveq r2, #0
	streq r2, [r0, #0x244]
_02338D8C:
	strb r1, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D6C

	arm_func_start ov29_02338D94
ov29_02338D94: ; 0x02338D94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0x4000
	str r0, [sl, #0x244]
	mov r0, #0
	str r0, [sl, #0x248]
	strb r0, [sl, #0x26c]
	str r0, [sl, #0x24c]
	str r0, [sl, #0x250]
	mov r0, #0x400
	mov sb, r1
	bl DungeonRandInt
	str r0, [sl, #0x25c]
	mov r0, #0x400
	bl DungeonRandInt
	str r0, [sl, #0x260]
	mov r0, #4
	str r0, [sl, #0x264]
	mov r0, #1
	str r0, [sl, #0x268]
	mov r5, #0
	strb r0, [sl, #0x26d]
	strb r5, [sl, #0x26e]
	str sb, [sl, #0x270]
	mov fp, r5
_02338DF8:
	mov r0, #0xc0
	mla r8, r5, r0, sl
	mov r6, #0
_02338E04:
	add r7, r8, r6, lsl #6
	mov r0, r7
	mov r4, r6, lsl #6
	bl InitRender3dElement64
	strb fp, [r7, #0x3c]
	strh fp, [r8, r4]
	strh fp, [r7, #2]
	ldr r2, [sl, #0x244]
	mov r0, r7
	mov r1, sb
	strb r2, [r7, #0x2f]
	bl ov29_02338E50
	add r6, r6, #1
	cmp r6, #3
	blt _02338E04
	add r5, r5, #1
	cmp r5, #3
	blt _02338DF8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02338D94

	arm_func_start ov29_02338E50
ov29_02338E50: ; 0x02338E50
	ldr r3, _02338F08 ; =ov29_02352F40
	mov r2, #0x14
	mla r2, r1, r2, r3
	ldr r3, [r2, #4]
	mov r1, #0
	str r3, [r0, #0x20]
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	mov r1, #0x80
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh r3, [r0, #0x14]
	ldr r1, _02338F0C ; =_020AFC70
	bic r3, r3, #7
	orr r3, r3, #4
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x38
	orr r3, r3, #0x20
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0xc0
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x700
	orr r3, r3, #0x300
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x1800
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x6000
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	orr r3, r3, #0x8000
	strh r3, [r0, #0x14]
	ldr r3, [r1]
	ldrsh r1, [r2, #8]
	ldr r3, [r3, #0xe0]
	add r1, r3, r1, lsl #9
	str r1, [r0, #0x24]
	ldr r1, [r2, #0xc]
	strh r1, [r0, #0x2a]
	ldr r1, [r2, #0x10]
	strb r1, [r0, #0x3e]
	bx lr
	.align 2, 0
_02338F08: .word ov29_02352F40
_02338F0C: .word _020AFC70
	arm_func_end ov29_02338E50

	arm_func_start ov29_02338F10
ov29_02338F10: ; 0x02338F10
	ldr r0, _02338F20 ; =ov29_0235376C
	mov r1, #0x64
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02338F20: .word ov29_0235376C
	arm_func_end ov29_02338F10

	arm_func_start ov29_02338F24
ov29_02338F24: ; 0x02338F24
	ldr r2, _02338F34 ; =ov29_0235376C
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	bx lr
	.align 2, 0
_02338F34: .word ov29_0235376C
	arm_func_end ov29_02338F24

	arm_func_start ov29_02338F38
ov29_02338F38: ; 0x02338F38
	ldr r1, _02338F44 ; =ov29_0237CFB8
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_02338F44: .word ov29_0237CFB8
	arm_func_end ov29_02338F38

	arm_func_start ov29_02338F48
ov29_02338F48: ; 0x02338F48
	ldr r1, _02338F54 ; =ov29_0237CFB8
	strb r0, [r1]
	bx lr
	.align 2, 0
_02338F54: .word ov29_0237CFB8
	arm_func_end ov29_02338F48

	arm_func_start ov29_02338F58
ov29_02338F58: ; 0x02338F58
	ldr r1, _02338F64 ; =ov29_0235376C
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02338F64: .word ov29_0235376C
	arm_func_end ov29_02338F58

	arm_func_start ov29_02338F68
ov29_02338F68: ; 0x02338F68
	stmdb sp!, {r3, lr}
	ldr r1, _02338FBC ; =0x0000040B
	ldr r2, _02338FC0 ; =ov29_02353784
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, _02338FC4 ; =ov29_0235376C
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	bl HandleSir0Translation
	ldr r1, [sp]
	ldr r0, _02338FC4 ; =ov29_0235376C
	str r1, [r0, #8]
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r2, #0
	ldr r1, _02338FC4 ; =ov29_0235376C
	strb r2, [r0, #0x447]
	str r2, [r1, #0xc]
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_02338FBC: .word 0x000003FF
#else
_02338FBC: .word 0x0000040B
#endif
_02338FC0: .word ov29_02353784
_02338FC4: .word ov29_0235376C
	arm_func_end ov29_02338F68

	arm_func_start ov29_02338FC8
ov29_02338FC8: ; 0x02338FC8
	stmdb sp!, {r3, lr}
	ldr r0, _02339000 ; =ov29_0235376C
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02338FF0
	ldr r0, _02339004 ; =ov29_02353784
	bl UnloadFile
	ldr r0, _02339000 ; =ov29_0235376C
	mov r1, #0
	str r1, [r0, #8]
_02338FF0:
	ldr r0, _02339008 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339000: .word ov29_0235376C
_02339004: .word ov29_02353784
_02339008: .word ov29_0237CFB8
	arm_func_end ov29_02338FC8

	arm_func_start ov29_0233900C
ov29_0233900C: ; 0x0233900C
	stmdb sp!, {r3, lr}
	ldr r0, _02339044 ; =ov29_0235352C
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov29_022DE288
	ldr r1, _02339044 ; =ov29_0235352C
	ldr r2, _02339048 ; =ov29_0235376C
	ldr r1, [r1]
	str r0, [r2, #0x10]
	add r0, r1, #0x2c
	bl ov29_022DE288
	ldr r1, _02339048 ; =ov29_0235376C
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339044: .word ov29_0235352C
_02339048: .word ov29_0235376C
	arm_func_end ov29_0233900C

	arm_func_start ov29_0233904C
ov29_0233904C: ; 0x0233904C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	bl GetMinimapData
	mov r7, r0
	mov r6, #0
	add r4, r7, #0x7000
_02339064:
	mov r0, #0x700
	mul r1, r6, r0
	mov r0, #0x1c
	mla sl, r6, r0, r7
	mov r5, #0
	add r8, r7, r1
	add sb, r4, r1
_02339080:
	add r0, r8, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sb, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sl, r5
	add r1, r0, #0xe000
	mov r0, #0
	add r5, r5, #1
	strb r0, [r1]
	cmp r5, #0x1c
	blt _02339080
	add r6, r6, #1
	cmp r6, #0x10
	blt _02339064
	cmp fp, #0
	ldreq r0, _02339110 ; =ov29_0235376C
	moveq r1, #0x64
	streqh r1, [r0, #2]
	streqh r1, [r0, #4]
	add r0, r7, #0xe000
	mov r3, #0
	str r3, [r0, #0x440]
	mov r2, #1
	strb r2, [r0, #0x444]
	ldr r1, _02339114 ; =ov29_0237CFB8
	strb r3, [r0, #0x446]
	strb r2, [r1, #3]
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldr r0, _02339114 ; =ov29_0237CFB8
	mov r1, #1
	strb r1, [r0, #2]
	bl ov29_02339148
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02339110: .word ov29_0235376C
_02339114: .word ov29_0237CFB8
	arm_func_end ov29_0233904C

	arm_func_start GetMinimapData
GetMinimapData: ; 0x02339118
	ldr r0, _02339134 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
#ifdef JAPAN
	addne r0, r0, #0x21c0
	addne r0, r0, #0x18000
#else
	addne r0, r0, #0x264
	addne r0, r0, #0x1a000
#endif
	moveq r0, #0
	bx lr
	.align 2, 0
_02339134: .word DUNGEON_PTR
	arm_func_end GetMinimapData

	arm_func_start ov29_02339138
ov29_02339138: ; 0x02339138
	stmdb sp!, {r3, lr}
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02339138

	arm_func_start ov29_02339148
ov29_02339148: ; 0x02339148
	stmdb sp!, {r4, lr}
	ldr r0, _02339188 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r0, [r0]
	ldr r3, _0233918C ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	mov r1, #0
	smulbb r0, r0, r2
	ldr r4, [r3, r0]
	mov r0, r4
	bl ov29_0233A548
	mov r0, r4
	mov r1, #1
	bl ov29_0233A548
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339188: .word DUNGEON_PTR
_0233918C: .word TILESET_PROPERTIES
	arm_func_end ov29_02339148

	arm_func_start ov29_02339190
ov29_02339190: ; 0x02339190
	stmdb sp!, {r3, lr}
	ldr r2, _023391B8 ; =ov29_0235376C
	ldr r2, [r2, #8]
	cmp r2, #0
	ldrne r2, _023391BC ; =ov29_0237CFB8
	ldrneb r2, [r2, #2]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_0233A548
	ldmia sp!, {r3, pc}
	.align 2, 0
_023391B8: .word ov29_0235376C
_023391BC: .word ov29_0237CFB8
	arm_func_end ov29_02339190

	arm_func_start ov29_023391C0
ov29_023391C0: ; 0x023391C0
	ldr r0, _023391E4 ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _023391E8 ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	smulbb r0, r0, r1
	ldr r0, [r2, r0]
	bx lr
	.align 2, 0
_023391E4: .word DUNGEON_PTR
_023391E8: .word TILESET_PROPERTIES
	arm_func_end ov29_023391C0

	arm_func_start DrawMinimapTile
DrawMinimapTile: ; 0x023391EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sl, r0
	mov sb, r1
	bl GetMinimapData
	ldr r2, _023398C4 ; =ov29_02352FCC
	ldr r3, _023398C8 ; =DUNGEON_PTR
	ldrh r4, [r2]
	ldr r5, [r3]
	ldrh r3, [r2, #2]
	ldr r1, _023398CC ; =ov29_0235376C
	mov r7, #1
	ldr r2, [r1, #8]
	mov fp, r0
	cmp r2, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	str r7, [sp, #0x14]
	ldrneb r0, [r0, #2]
#ifdef JAPAN
	add r1, r5, #0x178
#else
	add r1, r5, #0x21c
#endif
	strh r4, [sp, #0x2c]
	strh r3, [sp, #0x2e]
	add r4, r1, #0x1a000
	cmpne r0, #0
	beq _023398BC
	cmp sl, #0
	cmpge sb, #2
	blt _023398BC
	cmp sl, #0x38
	cmplt sb, #0x20
	bge _023398BC
	mov r0, sl
	mov r1, sb
	bl GetTile
	mov r6, r0
	ldrb r1, [r4, #0x32]
	ldrh r2, [r6]
	ldrb r0, [r4, #0x29]
	cmp r1, #0
	moveq r1, r7
	str r0, [sp, #0x24]
	and r0, r2, #3
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x22]
	movne r1, #0
	and r1, r1, #0xff
	str r0, [sp, #0x20]
	ldrb r0, [r4, #0x28]
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x27]
	str r0, [sp, #0x1c]
	ldrb r0, [r4, #0x23]
	ldrb r5, [r4, #0x25]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0x33]
	cmp r1, #0
	movne r1, #0
	ldreq r1, _023398D0 ; =ov29_0237CFB8
	ldreqb r1, [r1, #3]
	and r1, r1, #0xff
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	cmp r1, #0
	ldrneh r1, [r6, #2]
	movne r0, #0
	strne r0, [sp, #0x10]
	andne r8, r1, #1
	bne _02339344
	ldrb r1, [r4, #0x34]
	cmp r1, #0
	bne _02339310
	cmp r0, #0
	movne r8, #1
	bne _02339318
_02339310:
	ldrh r0, [r6, #2]
	and r8, r0, #1
_02339318:
	bl GetFloorType
	cmp r0, #0
	ldreqb r0, [r4, #0x2a]
	streq r0, [sp, #0x10]
	movne r0, #0
	strne r0, [sp, #0x10]
	cmp r5, #0
	beq _02339344
	cmp r8, #0
	streq r8, [sp, #0x14]
	moveq r8, #1
_02339344:
	bl sub_0204AF30
	cmp r0, #0
	ldreq r0, _023398CC ; =ov29_0235376C
	ldreqb r1, [r0, #1]
	cmpeq r1, #0
	beq _02339788
	ldr r0, [sp, #0x20]
	mov r5, #0
	cmp r0, #0
	bne _0233946C
	ldr r0, [r6, #0xc]
	str r0, [sp, #4]
	cmp r0, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	ldrneb r0, [r0, #3]
	cmpne r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #1
	bne _0233946C
	ldr r0, [sp, #4]
	bl ShouldMinimapDisplayEntity
	cmp r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	mov r7, r5
	ldr r0, [r0, #0xb4]
	str r0, [sp]
	bl IsExperienceLocked
	cmp r0, #0
	bne _023393D4
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #7
	bne _023393DC
_023393D4:
	mov r5, #0xa
	b _0233946C
_023393DC:
	ldr r0, [sp]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0233943C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02339434
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #2
	moveq r0, r5
	beq _02339410
	bl ov29_022EFAE8
_02339410:
	cmp r0, #0
	movne r5, #0xc
	bne _0233946C
	ldr r0, [sp]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r5, #0xa
	moveq r5, #2
	b _0233946C
_02339434:
	mov r7, #1
	b _0233946C
_0233943C:
	ldr r0, [sp]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _02339468
	ldr r0, _023398CC ; =ov29_0235376C
	strh sl, [r0, #2]
	strh sb, [r0, #4]
	ldrb r0, [r4, #0x2d]
	cmp r0, #0
	movne r5, #8
	b _0233946C
_02339468:
	mov r5, #0xa
_0233946C:
	cmp r7, #0
	beq _0233963C
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0233963C
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _023395D0
	cmp r8, #0
	ldr r1, [r0]
	bne _023394F4
	ldr r0, [sp, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _023394D8
	cmp r1, #3
	bne _023394D8
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _023394C8
	ldrh r0, [r6, #2]
	tst r0, #2
	beq _023394EC
_023394C8:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	movne r5, #3
	b _023394EC
_023394D8:
	cmp r1, #5
	bne _023394EC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	movne r5, #0xd
_023394EC:
	mov r7, #0
	b _0233963C
_023394F4:
	cmp r7, #0
	beq _0233963C
	cmp r1, #2
	bne _0233953C
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0233953C
	ldrb r2, [r0, #0x20]
	cmp r2, #0
	ldreq r2, [sp, #0x18]
	cmpeq r2, #0
	beq _0233953C
	bl GetTrapInfo
	ldrb r1, [r0]
	ldr r0, _023398D4 ; =ov29_02352FF4
	mov r7, #0
	ldrb r5, [r0, r1]
	b _0233963C
_0233953C:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0233957C
	cmp r1, #3
	bne _0233957C
	ldr r2, [sp, #0x1c]
	cmp r2, #0
	bne _02339568
	ldrh r2, [r6, #2]
	tst r2, #2
	beq _0233957C
_02339568:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	movne r5, #3
	movne r7, #0
	bne _0233963C
_0233957C:
	cmp r1, #5
	bne _023395BC
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _023395B0
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0233963C
	ldr r1, [sp, #0x18]
	cmp r1, #0
	ldreqb r0, [r0, #0x20]
	cmpeq r0, #0
	beq _0233963C
_023395B0:
	mov r5, #0xd
	mov r7, #0
	b _0233963C
_023395BC:
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #0
	movne r7, r5
	b _0233963C
_023395D0:
	cmp r8, #0
	bne _02339608
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0233963C
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
	b _0233963C
_02339608:
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
_0233963C:
	cmp r7, #0
	bne _02339654
	ldr r0, [sp, #0x24]
	cmp r0, #0
	cmpne r5, #0
	movne r5, #0xb
_02339654:
	cmp r5, #0
	bne _02339734
	cmp r8, #0
	moveq r5, #1
	beq _02339734
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #1
	bne _02339734
	cmp sb, #0x1f
	mov r4, #0xf
	bge _023396A0
	mov r0, sl
	add r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #1
_023396A0:
	cmp sb, #1
	blt _023396C4
	mov r0, sl
	sub r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #4
_023396C4:
	cmp sl, #0x37
	bge _023396E8
	mov r1, sb
	add r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #2
_023396E8:
	cmp sl, #1
	blt _0233970C
	mov r1, sb
	sub r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #8
_0233970C:
	ldrh r1, [r6, #2]
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	tst r1, #2
	addne r0, r0, #0x10
	movne r0, r0, lsl #0x10
	movne r5, r0, asr #0x10
	addeq r0, r0, #0x20
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
_02339734:
	bl sub_0204AEA0
	cmp r0, #3
	addeq r0, r5, #0x80
	streqh r0, [sp, #0x2e]
	bl sub_0204AEC0
	cmp r0, #0
	bne _02339770
	ldr r0, _023398CC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	addne r0, r5, #0x40
	strneh r0, [sp, #0x2c]
	moveq r0, #1
	streqh r0, [sp, #0x2c]
	b _0233979C
_02339770:
	bl sub_0204AEC0
	cmp r0, #1
	addeq r0, r5, #0x40
	streqh r0, [sp, #0x2c]
	strneh r5, [sp, #0x2c]
	b _0233979C
_02339788:
	mov r2, #1
	mov r1, #0x64
	strh r2, [sp, #0x2c]
	strh r2, [sp, #0x2e]
	strh r1, [r0, #2]
_0233979C:
	sub r3, sb, #2
	add r0, r3, r3, lsr #31
	mov r5, r0, asr #1
	mov r0, #0x700
	mul r7, r5, r0
	ldr r0, _023398CC ; =ov29_0235376C
	mov r2, sl, lsr #0x1f
	mov r4, r3, lsr #0x1f
	rsb r1, r2, sl, lsl #31
	rsb r3, r4, r3, lsl #31
	ldr sb, [r0, #8]
	add r0, sl, sl, lsr #31
	ldrsh r6, [sp, #0x2c]
	add r2, r2, r1, ror #31
	add r1, r4, r3, ror #31
	add r8, r2, r1, lsl #1
	ldr r2, [sb]
	add r1, r8, r6, lsl #2
	mov r4, r0, asr #1
	add r0, fp, r7
	add r6, r0, r4, lsl #6
	ldr r1, [r2, r1, lsl #2]
	mov r0, r6
	bl InitMinimapDisplayTile
	ldr r0, _023398CC ; =ov29_0235376C
	ldrsh r1, [sp, #0x2e]
	ldr r0, [r0, #8]
	add r2, fp, #0x7000
	add r2, r2, r7
	add r7, r2, r4, lsl #6
	ldr r2, [r0]
	add r0, r8, r1, lsl #2
	ldr r1, [r2, r0, lsl #2]
	mov r0, r7
	bl InitMinimapDisplayTile
	add r0, fp, #0xe000
	ldrb r1, [r0, #0x445]
	cmp r1, #0
	bne _023398BC
	mov r1, #0x1c
	mul r8, r5, r1
	add r1, r0, r8
	ldrb r2, [r1, r4]
	add r1, r1, r4
	cmp r2, #0
	bne _023398BC
	mov r3, #1
	strb r3, [r1]
	ldr r2, [r0, #0x440]
	cmp r2, #0x28
	strgeb r3, [r0, #0x445]
	bge _023398BC
	add r3, r4, r8
	add r2, fp, r2, lsl #4
	mov r3, r3, lsl #6
	add r2, r2, #0xe000
	str r3, [r2, #0x1c0]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r6, [r2, #0x1c4]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r7, [r2, #0x1c8]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r1, [r2, #0x1cc]
	ldr r1, [r0, #0x440]
	add r1, r1, #1
	str r1, [r0, #0x440]
_023398BC:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023398C4: .word ov29_02352FCC
_023398C8: .word DUNGEON_PTR
_023398CC: .word ov29_0235376C
_023398D0: .word ov29_0237CFB8
_023398D4: .word ov29_02352FF4
	arm_func_end DrawMinimapTile

	arm_func_start ov29_023398D8
ov29_023398D8: ; 0x023398D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, #0x7000
	mla r6, r1, r2, r0
	add r0, r0, #0xe000
	mov r5, #0
	ldr r2, _02339928 ; =ov29_0235377C
	strb r5, [r0, #0x445]
	ldr r7, [r2, r1, lsl #2]
	mov r4, #0x200
	b _0233991C
_02339900:
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl Memcpy32
	add r7, r7, #0x200
	add r6, r6, #0x200
	add r5, r5, #8
_0233991C:
	cmp r5, #0x1c0
	blo _02339900
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02339928: .word ov29_0235377C
	arm_func_end ov29_023398D8

	arm_func_start ov29_0233992C
ov29_0233992C: ; 0x0233992C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02339A1C ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	mov r5, r4
	bl ov29_022EA408
	ldr r1, _02339A20 ; =ov29_0237CFB8
	ldrb r1, [r1]
	cmp r1, #0
	beq _0233996C
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	moveq r4, #1
_0233996C:
	bl sub_0204AEA0
	cmp r0, #3
	moveq r5, #1
	bl GetMinimapData
	mov r6, r0
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x444]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov10_022BFD20
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x445]
	cmp r0, #0
	bne _023399D8
	cmp r4, #0
	beq _023399C0
	mov r0, r6
	mov r1, #0
	bl ov29_0233A470
_023399C0:
	cmp r5, #0
	beq _02339A0C
	mov r0, r6
	mov r1, #1
	bl ov29_0233A470
	b _02339A0C
_023399D8:
	cmp r4, #0
	beq _023399EC
	mov r0, r6
	mov r1, #0
	bl ov29_023398D8
_023399EC:
	cmp r5, #0
	beq _02339A00
	mov r0, r6
	mov r1, #1
	bl ov29_023398D8
_02339A00:
	add r0, r6, #0xe000
	mov r1, #1
	strb r1, [r0, #0x446]
_02339A0C:
	add r0, r6, #0xe000
	mov r1, #0
	str r1, [r0, #0x440]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339A1C: .word DUNGEON_PTR
_02339A20: .word ov29_0237CFB8
	arm_func_end ov29_0233992C

	arm_func_start FlashLeaderIcon
FlashLeaderIcon: ; 0x02339A24
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r1, _02339CB8 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a5]
#else
	ldrb r0, [r0, #0x249]
#endif
	cmp r0, #0
	bne _02339CB0
	ldr r0, _02339CBC ; =ov29_0235376C
	ldrsh r0, [r0, #2]
	cmp r0, #0x64
	bge _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	tst r1, #8
	bne _02339CB0
	add r0, sp, #0
	mov r1, #8
	bl MemZero
	ldrh r2, [sp]
	ldrh r0, [sp, #6]
	ldrh r1, [sp, #2]
	bic r2, r2, #0x100
	strh r2, [sp]
	ldrh r2, [sp]
	bic r0, r0, #1
	strh r0, [sp, #6]
	bic r2, r2, #0x200
	strh r2, [sp]
	ldrh r2, [sp]
	bic r1, r1, #0x3e00
	strh r1, [sp, #2]
	bic r0, r2, #0xc00
	strh r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	bic r0, r0, #0x1000
	strh r0, [sp]
	ldrh r3, [sp]
	ldrh r0, [sp, #6]
	bic r2, r2, #0xc000
	bic r3, r3, #0xc000
	bic r1, r1, #0xc00
	bic r0, r0, #2
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	strh r0, [sp, #6]
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x448]
	cmp r0, #0
	beq _02339BC0
	bl sub_0204AEA0
	cmp r0, #3
	bne _02339BC0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldr ip, _02339CBC ; =ov29_0235376C
	ldrh r3, [sp, #2]
	orr r5, r0, #0x70
	add r0, r2, #0x200
	and r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r1, [ip, #2]
	bic r5, r5, #0xf000
	strh r5, [sp, #4]
	mov r0, r1, lsl #2
	ldrh r1, [sp]
	add r5, r0, #0x10
	and r2, r5, r2, lsr #23
	ldrh r6, [sp, #2]
	ldrh r3, [sp, #4]
	bic r1, r1, #0x2000
	orr r6, r6, r2
	orr r0, r3, #0xc000
	ldr r3, _02339CC4 ; =_020AFC4C
	ldrh r5, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	strh r1, [sp]
	and r1, r5, r2
	strh r1, [sp, #6]
	strh r6, [sp, #2]
	strh r0, [sp, #4]
	ldrsh r0, [ip, #4]
	ldrh r2, [sp, #6]
	ldr r3, [r3]
	mov r0, r0, lsl #0x16
	orr r5, r2, r0, lsr #16
	ldr r2, _02339CCC ; =0x0000013F
	add r1, sp, #0
	add r0, r3, #0x70
	strh r5, [sp, #6]
	bl sub_0201B9F8
_02339BC0:
	cmp r4, #0
	bne _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02339CB0
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x447]
	cmp r0, #0
	beq _02339CB0
	bl sub_0204AEC0
	cmp r0, #0
	beq _02339CB0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldrh r4, [sp]
	ldrh r6, [sp, #2]
	add r2, r2, #0x200
	orr r1, r0, #0xdd
	ldr ip, _02339CBC ; =ov29_0235376C
	and r2, r6, r2
	strh r2, [sp, #2]
	ldrsh r0, [ip, #2]
	orr r1, r1, #0x100
	bic r4, r4, #0x2000
	strh r4, [sp]
	strh r1, [sp, #4]
	mov r5, r0, lsl #2
	ldrh r0, [sp, #4]
	ldrh r1, [sp]
	ldrh lr, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	bic r0, r0, #0xf000
	and r2, lr, r2
	orr r1, r1, #0x2000
	ldr r3, _02339CD0 ; =0x000001DD
	strh r2, [sp, #6]
	ldrh r6, [sp, #2]
	add r5, r5, #8
	add r2, r3, #0x22
	and r2, r5, r2
	orr r2, r6, r2
	strh r2, [sp, #2]
	strh r0, [sp, #4]
	strh r1, [sp]
	ldrsh r1, [ip, #4]
	ldr r4, _02339CC4 ; =_020AFC4C
	ldrh r2, [sp, #6]
	ldr r0, [r4]
	mov r1, r1, lsl #0x16
	orr r4, r2, r1, lsr #16
	add r1, sp, #0
	sub r2, r3, #0x9e
	strh r4, [sp, #6]
	bl sub_0201B9F8
_02339CB0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339CB8: .word DUNGEON_PTR
_02339CBC: .word ov29_0235376C
_02339CC0: .word ov29_0237CFB8
_02339CC4: .word _020AFC4C
_02339CC8: .word 0xFFFF000F
_02339CCC: .word 0x0000013F
_02339CD0: .word 0x000001DD
	arm_func_end FlashLeaderIcon

	arm_func_start ov29_02339CD4
ov29_02339CD4: ; 0x02339CD4
	ldr r0, _02339CE4 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02339CE4: .word ov29_0237CFB8
	arm_func_end ov29_02339CD4

	arm_func_start UpdateMinimap
UpdateMinimap: ; 0x02339CE8
	stmdb sp!, {r4, r5, r6, lr}
	bl GetMinimapData
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x445]
	mov r4, r6
_02339D0C:
	mov r5, r4
_02339D10:
	mov r0, r5
	mov r1, r6
	bl DrawMinimapTile
	add r5, r5, #1
	cmp r5, #0x38
	blt _02339D10
	add r6, r6, #1
	cmp r6, #0x20
	blt _02339D0C
	bl sub_0204AEC0
	cmp r0, #0
	beq _02339D54
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
_02339D54:
	ldr r0, _02339D78 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339D78: .word ov29_0235376C
	arm_func_end UpdateMinimap

	arm_func_start ov29_02339D7C
ov29_02339D7C: ; 0x02339D7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #1
	mov r5, #0x10
	moveq r6, #0
	beq _02339D9C
	cmp r1, #0
	movne r6, #0
	moveq r6, #5
_02339D9C:
	cmp r0, #1
	mov sl, #0x1140
	mov r8, #1
	bne _02339E6C
	mov sb, #0
	mov fp, sb
	b _02339E00
_02339DB8:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_02339DC4:
	add r0, r7, #2
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #1
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _02339DC4
	add r8, r8, #1
	add sb, sb, #1
_02339E00:
	cmp sb, r5
	blt _02339DB8
	mov sb, #0
	mov r4, #0x1000
	mov fp, #1
	mov r7, sb
	b _02339E58
_02339E1C:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339E28:
	add r0, sl, #2
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339E28
	add r8, r8, #1
	add sb, sb, #1
_02339E58:
	cmp sb, r6
	blt _02339E1C
	mov r0, #1
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02339E6C:
	mov r7, #0
	mov fp, r7
	b _02339EC0
_02339E78:
	mov r0, r8, lsl #0x10
	mov sb, fp
	mov r4, r0, asr #0x10
_02339E84:
	add r0, sb, #1
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #0
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _02339E84
	add r8, r8, #1
	add r7, r7, #1
_02339EC0:
	cmp r7, r5
	blt _02339E78
	mov sb, #0
	mov r4, #0x1000
	mov fp, sb
	mov r7, sb
	b _02339F18
_02339EDC:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339EE8:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339EE8
	add r8, r8, #1
	add sb, sb, #1
_02339F18:
	cmp sb, r6
	blt _02339EDC
	mov r0, #0
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02339D7C

	arm_func_start ov29_02339F2C
ov29_02339F2C: ; 0x02339F2C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02339F60 ; =ov29_0235352C
	str r1, [sp, #4]
	ldr ip, [ip]
	mov r1, #0xc
	mla r1, r3, r1, ip
	str r0, [sp]
	ldr r0, [r1, #0x24]
	add r1, sp, #0
	bl sub_0200B3FC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339F60: .word ov29_0235352C
	arm_func_end ov29_02339F2C

	arm_func_start ov29_02339F64
ov29_02339F64: ; 0x02339F64
	ldr r2, _02339F80 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _02339F84 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_02339F80: .word ov29_0235352C
_02339F84: .word sub_0200B330
	arm_func_end ov29_02339F64

	arm_func_start ov29_02339F88
ov29_02339F88: ; 0x02339F88
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0204AEC0
	cmp r0, #0
	beq _02339FAC
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
_02339FAC:
	ldr r0, _02339FCC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339FCC: .word ov29_0235376C
	arm_func_end ov29_02339F88

	arm_func_start ov29_02339FD0
ov29_02339FD0: ; 0x02339FD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0204AEA0
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FD0

	arm_func_start ov29_02339FF4
ov29_02339FF4: ; 0x02339FF4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_02339F88
	bl sub_0204AEA0
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FF4

	arm_func_start ov29_0233A01C
ov29_0233A01C: ; 0x0233A01C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #0
	movne r6, #0
	mov sb, #0
	mov sl, r1
	mov r5, #0x10
	moveq r6, #5
	mov r8, #1
	mov fp, sb
	b _0233A080
_0233A044:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_0233A050:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, #0x1000
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _0233A050
	add r8, r8, #1
	add sb, sb, #1
_0233A080:
	cmp sb, r5
	blt _0233A044
	mov r7, #0
	mov fp, #0x1000
	mov r5, r7
	b _0233A0D4
_0233A098:
	mov r0, r8, lsl #0x10
	mov sb, r5
	mov r4, r0, asr #0x10
_0233A0A4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, fp
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _0233A0A4
	add r8, r8, #1
	add r7, r7, #1
_0233A0D4:
	cmp r7, r6
	blt _0233A098
	mov r0, sl
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_0233A01C

	arm_func_start ov29_0233A0E8
ov29_0233A0E8: ; 0x0233A0E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #1
	bne _0233A114
	bl sub_0204AEA0
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A114:
	cmp r1, #0
	ldmneia sp!, {r4, pc}
	bl sub_0204AEC0
	cmp r0, #0
	beq _0233A138
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A138:
	ldr r0, _0233A158 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A158: .word ov29_0235376C
	arm_func_end ov29_0233A0E8

	arm_func_start ov29_0233A15C
ov29_0233A15C: ; 0x0233A15C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0204AEA0
	cmp r0, #3
	bne _0233A17C
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
_0233A17C:
	bl sub_0204AEC0
	cmp r0, #0
	beq _0233A198
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A198:
	ldr r0, _0233A1B8 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A1B8: .word ov29_0235376C
	arm_func_end ov29_0233A15C

	arm_func_start ov29_0233A1BC
ov29_0233A1BC: ; 0x0233A1BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	mov r7, r0
	mov r8, #0x1000
	mov r4, r6
_0233A1D0:
	mov r0, r6, lsl #0x10
	mov r5, r4
	mov sb, r0, asr #0x10
_0233A1DC:
	mov r0, r5, lsl #0x10
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r5, r5, #1
	cmp r5, #0x1c
	blt _0233A1DC
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233A1D0
	mov r0, r7
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_0233A1BC

	arm_func_start SetMinimapDataE447
SetMinimapDataE447: ; 0x0233A218
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetMinimapData
	add r0, r0, #0xe000
	strb r4, [r0, #0x447]
	ldmia sp!, {r4, pc}
	arm_func_end SetMinimapDataE447

#ifdef EUROPE
	arm_func_start GetMinimapDataE447
GetMinimapDataE447: ; 0x0233AE00
	stmdb sp!, {r3, lr}
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x447]
	ldmia sp!, {r3, pc}
	arm_func_end GetMinimapDataE447
#endif

	arm_func_start SetMinimapDataE448
SetMinimapDataE448: ; 0x0233A230
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetMinimapData
	add r0, r0, #0xe000
	strb r4, [r0, #0x448]
	ldmia sp!, {r4, pc}
	arm_func_end SetMinimapDataE448

	arm_func_start ov29_0233A248
ov29_0233A248: ; 0x0233A248
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	bl ov29_0233A0E8
	cmp r4, #0
	bne _0233A274
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x447]
_0233A274:
	cmp r4, #1
	ldmneia sp!, {r4, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x448]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0233A248

	arm_func_start InitWeirdMinimapMatrix
InitWeirdMinimapMatrix: ; 0x0233A290
	stmdb sp!, {r3, r4, r5, lr}
	bl GetMinimapData
	add r1, r0, #0xe000
	ldrb r1, [r1, #0x446]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
	mov r3, r4
	mov ip, r4
	mov r2, #0x1c
_0233A2B8:
	mla r5, r4, r2, r0
	mov lr, ip
_0233A2C0:
	add r1, r5, lr
	add r1, r1, #0xe000
	add lr, lr, #1
	strb r3, [r1]
	cmp lr, #0x38
	blt _0233A2C0
	add r4, r4, #1
	cmp r4, #0x20
	blt _0233A2B8
	add r0, r0, #0xe000
	strb r3, [r0, #0x446]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitWeirdMinimapMatrix

	arm_func_start InitMinimapDisplayTile
InitMinimapDisplayTile: ; 0x0233A2F0
	ldr r3, [r0]
	ldmia r1, {r2, ip}
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0]
	ldr r3, [r0, #4]
	ldr r2, [r1, #8]
	ldr ip, [r1, #0xc]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #4]
	ldr r3, [r0, #8]
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0x14]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #8]
	ldr r3, [r0, #0xc]
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x1c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0xc]
	ldr r3, [r0, #0x10]
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x24]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x10]
	ldr r3, [r0, #0x14]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x2c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x14]
	ldr r3, [r0, #0x18]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x34]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	ldr r2, [r1, #0x38]
	ldr ip, [r1, #0x3c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x1c]
	ldr r3, [r0, #0x20]
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x44]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r2, [r1, #0x48]
	ldr ip, [r1, #0x4c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x24]
	ldr r3, [r0, #0x28]
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x54]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x28]
	ldr r3, [r0, #0x2c]
	ldr r2, [r1, #0x58]
	ldr ip, [r1, #0x5c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r1, #0x60]
	ldr ip, [r1, #0x64]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x30]
	ldr r3, [r0, #0x34]
	ldr r2, [r1, #0x68]
	ldr ip, [r1, #0x6c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x34]
	ldr r3, [r0, #0x38]
	ldr r2, [r1, #0x70]
	ldr ip, [r1, #0x74]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x38]
	ldr r3, [r0, #0x3c]
	ldr r2, [r1, #0x78]
	ldr ip, [r1, #0x7c]
	and r1, r3, r2
	orr r1, ip, r1
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitMinimapDisplayTile

	arm_func_start ov29_0233A470
ov29_0233A470: ; 0x0233A470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	add r2, r0, #0x21c0
	add r5, r0, #0xe000
	add ip, r2, #0xc000
	ldr r0, _0233A544 ; =ov29_0235377C
	mov r6, r4
	b _0233A534
_0233A490:
	add lr, ip, r4, lsl #4
	add r2, lr, r1, lsl #2
	ldr r3, [r2, #4]
	ldr sb, [ip, r4, lsl #4]
	ldr r8, [r0, r1, lsl #2]
	ldr r7, [r3]
	add r2, sb, r8
	str r7, [sb, r8]
	ldr r7, [r3, #4]
	add r4, r4, #1
	str r7, [r2, #4]
	ldr r7, [r3, #8]
	str r7, [r2, #8]
	ldr r7, [r3, #0xc]
	str r7, [r2, #0xc]
	ldr r7, [r3, #0x10]
	str r7, [r2, #0x10]
	ldr r7, [r3, #0x14]
	str r7, [r2, #0x14]
	ldr r7, [r3, #0x18]
	str r7, [r2, #0x18]
	ldr r7, [r3, #0x1c]
	str r7, [r2, #0x1c]
	ldr r7, [r3, #0x20]
	str r7, [r2, #0x20]
	ldr r7, [r3, #0x24]
	str r7, [r2, #0x24]
	ldr r7, [r3, #0x28]
	str r7, [r2, #0x28]
	ldr r7, [r3, #0x2c]
	str r7, [r2, #0x2c]
	ldr r7, [r3, #0x30]
	str r7, [r2, #0x30]
	ldr r7, [r3, #0x34]
	str r7, [r2, #0x34]
	ldr r7, [r3, #0x38]
	str r7, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	str r3, [r2, #0x3c]
	ldr r2, [lr, #0xc]
	strb r6, [r2]
_0233A534:
	ldr r2, [r5, #0x440]
	cmp r4, r2
	blt _0233A490
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233A544: .word ov29_0235377C
	arm_func_end ov29_0233A470

	arm_func_start ov29_0233A548
ov29_0233A548: ; 0x0233A548
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0233A5E0 ; =MAP_COLOR_TABLE
	ldr r7, _0233A5E4 ; =ov29_0235376C
	mov r6, r1
	add r5, r2, r0, lsl #2
	mov r4, #0
_0233A560:
	cmp r4, #7
	bne _0233A5B0
	cmp r6, #0
	bne _0233A58C
	add r0, r4, #0x100
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r2, r6
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A58C:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A5B0:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
_0233A5D0:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0233A560
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233A5E0: .word MAP_COLOR_TABLE
_0233A5E4: .word ov29_0235376C
	arm_func_end ov29_0233A548

	arm_func_start ov29_0233A5E8
ov29_0233A5E8: ; 0x0233A5E8
	stmdb sp!, {r4, lr}
	ldr ip, _0233A620 ; =ov29_0235352C
	mov r3, #0xc
	ldr ip, [ip]
	mov lr, r0
	add r0, ip, #0x20
	mla r4, r2, r3, r0
	ldr r0, [r4, #8]
	mov r2, r1
	mov r1, lr
	bl sub_0200C008
	ldr r0, [r4, #8]
	bl sub_0200A174
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A620: .word ov29_0235352C
	arm_func_end ov29_0233A5E8

	arm_func_start LoadFixedRoomDataVeneer
LoadFixedRoomDataVeneer: ; 0x0233A624
	ldr ip, _0233A62C ; =LoadFixedRoomData
	bx ip
	.align 2, 0
_0233A62C: .word LoadFixedRoomData
	arm_func_end LoadFixedRoomDataVeneer

	arm_func_start UnloadFixedRoomData
UnloadFixedRoomData: ; 0x0233A630
	stmdb sp!, {r3, lr}
	bl ov29_02343DD8
	ldr r0, _0233A650 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x12000
#ifdef JAPAN
	str r1, [r0, #0xa00]
#else
	str r1, [r0, #0xaa4]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A650: .word DUNGEON_PTR
	arm_func_end UnloadFixedRoomData

	arm_func_start IsNormalFloor
IsNormalFloor: ; 0x0233A654
	stmdb sp!, {r3, lr}
	bl IsHiddenStairsFloor
	cmp r0, #0
	bne _0233A6C4
	bl IsGoldenChamber
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xa
	mov r1, #6
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	ldr r0, _0233A6D4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0
	beq _0233A6CC
	cmp r0, #0xa5
	bhs _0233A6CC
_0233A6C4:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0233A6CC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A6D4: .word DUNGEON_PTR
	arm_func_end IsNormalFloor

	arm_func_start GenerateFloor
GenerateFloor: ; 0x0233A6D8
#ifdef JAPAN
#define GENERATE_FLOOR_OFFSET -0xA4
#else
#define GENERATE_FLOOR_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	ldr r2, _0233AE64 ; =DUNGEON_PTR
	mov r8, #0
	ldr r3, [r2]
	ldr r0, _0233AE68 ; =0x000286B2
	add r1, r3, #0x12000
	str r8, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r2]
	add sb, r3, r0
	add r0, r1, #0x3f00
	strh r8, [r0, #0xc2 + GENERATE_FLOOR_OFFSET]
	bl LoadFixedRoomDataVeneer
	bl ov29_02343DC4
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	mov r3, r8
	add r1, r1, #0x12000
	str r0, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	strb r3, [r2, #3]
	strb r3, [r2, #1]
	strb r3, [r2, #7]
	bl ResetHiddenStairsSpawn
	bl IsOutlawMonsterHouseFloor
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r3, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r2, [r1]
	mov r1, sb
	add r2, r2, #0xc4 + GENERATE_FLOOR_OFFSET
	strb r0, [r3, #8]
	add r0, r2, #0x4000
	bl GetHiddenStairsType
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	str r0, [r2, #0x2c]
	add r0, r1, #0x4000
	ldrsh r1, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	ldr r0, _0233AE70 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r0, r1]
	mov r1, #0xff
	cmp r0, #2
	moveq r2, #1
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movne r2, r8
	strb r2, [r0, #4]
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #6]
	ldrb r0, [sb, #7]
	bl GetFinalKecleonShopSpawnChance
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strh r0, [r1, #0xc]
	ldrb r0, [sb, #8]
	strh r0, [r1, #0x10]
	ldrb r0, [r1, #8]
	cmp r0, #0
	movne r0, #0x64
	strneh r0, [r1, #0x10]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #1
	strb r1, [r0]
	sub r1, r1, #2
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bl ResetFloor
	bl IsNormalFloor
	cmp r0, #0
	bne _0233A810
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0x86]
	b _0233A828
_0233A810:
	ldrb r0, [sb, #6]
	bl abs
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x700
	strh r0, [r1, #0x86]
_0233A828:
	ldr r3, _0233AE64 ; =DUNGEON_PTR
	mov r7, #0
	ldr r0, [r3]
	ldr r1, _0233AE74 ; =0x00012AFA
	add r0, r0, #0x4000
	strb r7, [r0, #0xc5 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	add r0, r0, #0x4000
	strb r7, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	strh r7, [r0, r1]
	ldr r0, [r3]
	add r0, r0, #0x4000
	str r7, [r0, #0xcc + GENERATE_FLOOR_OFFSET]
	ldrb r0, [sb, #0xc]
	str r0, [r2, #0x18]
	b _0233AD3C
_0233A870:
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	mov r0, #0
	str r0, [sp]
	ldr r0, [r1]
	add r0, r0, #0xc4 + GENERATE_FLOOR_OFFSET
	add r0, r0, #0x4000
	bl ResetImportantSpawnPositions
	mov r6, #0
	mvn r5, #0
	ldr r4, _0233AE64 ; =DUNGEON_PTR
	b _0233AC50
_0233A89C:
	ldr r0, [sp]
	cmp r0, #0
	beq _0233A8C8
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	bl IsNotFullFloorFixedRoom
	cmp r0, #0
	beq _0233AC58
	mov r0, #0
	str r0, [sp]
_0233A8C8:
	ldr r0, [r4]
	cmp r6, #1
	add r0, r0, #0x4000
	strh r6, [r0, #0xde + GENERATE_FLOOR_OFFSET]
	ldrge r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movge r1, #0
	strge r1, [r0, #0x18]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	strb r1, [r0, #5]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	bl ResetFloor
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #0
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	cmp r0, #0
	beq _0233A954
	mov r1, sb
	bl GenerateFixedRoom
	cmp r0, #0
	bne _0233AC58
	mov r0, #1
	str r0, [sp]
	b _0233AB78
_0233A954:
	mov r0, #2
	ldrb sl, [sb]
	mov fp, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	b _0233A9DC
_0233A96C:
	cmp sl, #8
	mov r0, #2
	beq _0233A998
	mov r1, #9
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #8
	bl DungeonRandRange
	str r0, [sp, #4]
	b _0233A9B4
_0233A998:
	mov r1, #5
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #4
	bl DungeonRandRange
	str r0, [sp, #4]
_0233A9B4:
	ldr r0, [sp, #8]
	cmp r0, #6
	ldrle r0, [sp, #4]
	cmple r0, #4
	ble _0233A9E4
	subs fp, fp, #1
	moveq r0, #4
	streq r0, [sp, #8]
	streq r0, [sp, #4]
	beq _0233A9E4
_0233A9DC:
	cmp fp, #0
	bne _0233A96C
_0233A9E4:
	ldr r1, [sp, #8]
	mov r0, #0x38
	bl _s32_div_f
	cmp r0, #7
	movle r0, #1
	strle r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, #0x20
	bl _s32_div_f
	ldr r1, [r4]
	cmp r0, #7
	add r2, r1, #0x4000
	mov r1, #0
	strb r1, [r2, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r4]
	movle r0, #1
	add r2, r1, #0x4000
	mov r1, #0xff
	strb r1, [r2, #0xc9 + GENERATE_FLOOR_OFFSET]
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strle r0, [sp, #4]
	and r0, sl, #0xf
	cmp r0, #0xb
	str sl, [r1, #0x28]
	addls pc, pc, r0, lsl #2
	b _0233AAD4
_0233AA4C: ; jump table
	b _0233AAD4 ; case 0
	b _0233AA7C ; case 1
	b _0233AAEC ; case 2
	b _0233AB04 ; case 3
	b _0233AB14 ; case 4
	b _0233AB24 ; case 5
	b _0233AB3C ; case 6
	b _0233AB4C ; case 7
	b _0233AAD4 ; case 8
	b _0233AB58 ; case 9
	b _0233AB64 ; case 10
	b _0233AAA8 ; case 11
_0233AA7C:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #1
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAA8:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #2
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAD4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAEC:
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB04:
	mov r0, sb
	bl GenerateOuterRingFloor
	mov r8, #1
	b _0233AB78
_0233AB14:
	mov r0, sb
	bl GenerateCrossroadsFloor
	mov r8, #1
	b _0233AB78
_0233AB24:
	bl GenerateTwoRoomsWithMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB3C:
	mov r0, sb
	bl GenerateLineFloor
	mov r8, #1
	b _0233AB78
_0233AB4C:
	mov r0, sb
	bl GenerateCrossFloor
	b _0233AB78
_0233AB58:
	mov r0, sb
	bl GenerateBeetleFloor
	b _0233AB78
_0233AB64:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateOuterRoomsFloor
	mov r8, #1
_0233AB78:
	bl ResetInnerBoundaryTileRows
	bl EnsureImpassableTilesAreWalls
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0233AC4C
	mov sl, #0
	mov r2, sl
_0233AB98:
	mov r1, #0
	add r0, sp, #0x14
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x40
	blt _0233AB98
	mov r0, r1
	str r0, [sp, #0xc]
_0233ABB8:
	mov fp, #0
_0233ABBC:
	ldr r0, [sp, #0xc]
	mov r1, fp
	bl GetTile
	str r0, [sp, #0x10]
	bl GetTileTerrain
	cmp r0, #1
	bne _0233ABFC
	ldr r0, [sp, #0x10]
	ldrb r2, [r0, #7]
	cmp r2, #0xf0
	bhi _0233ABFC
	cmp r2, #0x40
	movlo r1, #1
	addlo r0, sp, #0x14
	add sl, sl, #1
	strlob r1, [r0, r2]
_0233ABFC:
	add fp, fp, #1
	cmp fp, #0x20
	blt _0233ABBC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x38
	blt _0233ABB8
	mov r1, #0
	mov r2, r1
_0233AC24:
	add r0, sp, #0x14
	ldrb r0, [r0, r2]
	add r2, r2, #1
	cmp r0, #0
	addne r1, r1, #1
	cmp r2, #0x40
	blt _0233AC24
	cmp sl, #0x1e
	cmpge r1, #2
	bge _0233AC58
_0233AC4C:
	add r6, r6, #1
_0233AC50:
	cmp r6, #0xa
	blt _0233A89C
_0233AC58:
	cmp r6, #0xa
	bne _0233AC88
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
_0233AC88:
	bl FinalizeJunctions
	cmp r8, #0
	beq _0233ACA0
	mov r1, sb
	mov r0, #1
	bl GenerateSecondaryTerrainFormations
_0233ACA0:
	bl DungeonRand100
	ldrb r1, [sb, #0x19]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r4, r0, #0xff
	mov r0, sb
	mov r1, r4
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, r4
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r2, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	cmp r2, r1
	ldrnesh r0, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	cmpne r0, r1
	beq _0233AD38
	bl GetFloorType
	cmp r0, #1
	beq _0233AD44
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r2, #0
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4 + GENERATE_FLOOR_OFFSET]
	cmp r0, r2
	ldrnesh r1, [r1, #0xe6 + GENERATE_FLOOR_OFFSET]
	cmpne r1, r2
	beq _0233AD38
	mov r2, #0
	bl StairsAlwaysReachable
	cmp r0, #0
	bne _0233AD44
_0233AD38:
	add r7, r7, #1
_0233AD3C:
	cmp r7, #0xa
	blt _0233A870
_0233AD44:
	cmp r7, #0xa
	bne _0233AD98
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl ResetFloor
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
	bl FinalizeJunctions
	mov r0, sb
	mov r1, #0
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, #0
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
_0233AD98:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrsh r1, [r0, #0x20]
	cmp r1, #0
	ldrgesh r0, [r0, #0x22]
	cmpge r0, #0
	blt _0233ADCC
	bl GetKecleonIdToSpawnByFloor
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, r0
	ldrsh r0, [r1, #0x20]
	ldrsh r1, [r1, #0x22]
	mov r3, #0
	bl MarkShopkeeperSpawn
_0233ADCC:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x30]
	cmp r0, #0
	ldrlt r0, _0233AE64 ; =DUNGEON_PTR
	movlt r1, #0
	blt _0233ADF4
	mov r0, sb
	bl ov29_023427E4
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
_0233ADF4:
	ldr r0, [r0]
	mov r2, #0x38
	add r0, r0, #0x4000
	strb r1, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	mov r0, #0
	mov r1, r0
	mov r3, #0x20
	bl FlagHallwayJunctions
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0233AE28
	bl ConvertSecondaryTerrainToChasms
_0233AE28:
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	sub r0, r0, #0x1a
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0233AE58
	bl ConvertWallsToChasms
_0233AE58:
	bl UnloadFixedRoomData
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233AE64: .word DUNGEON_PTR
_0233AE68: .word 0x000286B2 + GENERATE_FLOOR_OFFSET
_0233AE6C: .word FLOOR_GENERATION_STATUS
_0233AE70: .word SECONDARY_TERRAIN_TYPES
_0233AE74: .word 0x00012AFA + GENERATE_FLOOR_OFFSET
	arm_func_end GenerateFloor

	arm_func_start GetTileTerrain
GetTileTerrain: ; 0x0233AE78
	ldrh r0, [r0]
	and r0, r0, #3
	bx lr
	arm_func_end GetTileTerrain

	arm_func_start DungeonRand100
DungeonRand100: ; 0x0233AE84
	ldr ip, _0233AE90 ; =DungeonRandInt
	mov r0, #0x64
	bx ip
	.align 2, 0
_0233AE90: .word DungeonRandInt
	arm_func_end DungeonRand100

	arm_func_start ClearHiddenStairs
ClearHiddenStairs: ; 0x0233AE94
	stmdb sp!, {r3, lr}
	ldr r0, _0233AF04 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0233AF08 ; =FLOOR_GENERATION_STATUS
	mvn r2, #0
	ldrsh r0, [r1, #0x1c]
	cmp r0, r2
	ldrnesh r1, [r1, #0x1e]
	cmpne r1, r2
	beq _0233AEFC
	bl GetTileSafe
	mov r2, #0
	strh r2, [r0]
	ldr r1, _0233AF08 ; =FLOOR_GENERATION_STATUS
	strh r2, [r0, #2]
	ldrsh r0, [r1, #0x1c]
	ldrsh r1, [r1, #0x1e]
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233AEFC:
	bl ResetHiddenStairsSpawn
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233AF04: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_0233AF08: .word FLOOR_GENERATION_STATUS
	arm_func_end ClearHiddenStairs

	arm_func_start FlagHallwayJunctions
FlagHallwayJunctions: ; 0x0233AF0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov fp, r1
	mov sb, r2
	mov r8, r3
	b _0233B01C
_0233AF24:
	mov r7, fp
	sub r6, sl, #1
	b _0233B010
_0233AF30:
	mov r0, sl
	mov r1, r7
	mov r4, #0
	bl GetTileSafe
	mov r5, r0
	ldrh r0, [r5]
	bic r0, r0, #4
	strh r0, [r5]
	ldrb r0, [r5, #7]
	cmp r0, #0xff
	ldreqh r0, [r5]
	andeq r0, r0, #3
	cmpeq r0, #1
	bne _0233B00C
	cmp sl, #0
	ble _0233AF90
	mov r0, r6
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, r4
	addeq r4, r0, #1
_0233AF90:
	cmp r7, #0
	ble _0233AFB4
	mov r0, sl
	sub r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFB4:
	cmp sl, #0x36
	bge _0233AFD8
	mov r1, r7
	add r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFD8:
	cmp sl, #0x1e
	bge _0233AFFC
	mov r0, sl
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFFC:
	cmp r4, #3
	ldrgeh r0, [r5]
	orrge r0, r0, #8
	strgeh r0, [r5]
_0233B00C:
	add r7, r7, #1
_0233B010:
	cmp r7, r8
	blt _0233AF30
	add sl, sl, #1
_0233B01C:
	cmp sl, sb
	blt _0233AF24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end FlagHallwayJunctions

	arm_func_start GenerateStandardFloor
GenerateStandardFloor: ; 0x0233B028
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r5, r1
	mov r6, r0
	mov r4, r2
	add r0, sp, #0x44
	add r1, sp, #8
	mov r2, r6
	mov r3, r5
	bl GetGridPositions
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl InitDungeonGrid
	ldrsb r3, [r4, #1]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl AssignRooms
	add r1, sp, #8
	str r1, [sp]
	ldrb r3, [r4, #0xd]
	add r0, sp, #0x80
	mov r1, r6
	str r3, [sp, #4]
	mov r2, r5
	add r3, sp, #0x44
	bl CreateRoomsAndAnchors
	mov r0, r6
	bl DungeonRandInt
	mov r7, r0
	mov r0, r5
	bl DungeonRandInt
	stmia sp, {r0, r4}
	mov r3, r7
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl AssignGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	add r3, sp, #0x44
	bl CreateGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldrb r3, [r4, #9]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateMazeRoom
	ldr r3, _0233B18C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, r6
	mov r2, r5
	bl GenerateKecleonShop
	ldr r3, _0233B18C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0x10]
	mov r1, r6
	mov r2, r5
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateRoomImperfections
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateSecondaryStructures
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233B18C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateStandardFloor

	arm_func_start GenerateOuterRingFloor
GenerateOuterRingFloor: ; 0x0233B190
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f4
	sub sp, sp, #0x1800
	mov r1, #5
	mov r2, #0x1c
	add r3, r2, #0x33
	add r3, r3, r3, lsr #31
	mov r8, r3, asr #1
	mov fp, #0x33
	mov sl, #0x38
	mov r7, #2
	mov r6, #7
	mov r5, #0x10
	mov r3, #0x1e
	str r2, [sp, #0x64]
	add r4, r1, #0x1c
	str r0, [sp, #8]
	add r0, r4, r4, lsr #31
	mov sb, r0, asr #1
	mov r0, #0
	mov r4, #0x19
	str r0, [sp, #0x58]
	str r1, [sp, #0x5c]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	str fp, [sp, #0x6c]
	str sl, [sp, #0x70]
	str sb, [sp, #0x60]
	str r8, [sp, #0x68]
	str r7, [sp, #0x1c]
	str r6, [sp, #0x20]
	str r5, [sp, #0x24]
	str r4, [sp, #0x28]
	str r3, [sp, #0x2c]
	bl InitDungeonGrid
	mov r3, #0
	ldr r0, _0233B614 ; =0x000001C2
	add r1, sp, #0x94
	mov r4, r3
_0233B230:
	mla r2, r3, r0, r1
	strb r4, [r2, #0xa]
	add r3, r3, #1
	strb r4, [r2, #0x64]
	cmp r3, #6
	blt _0233B230
	add r2, sp, #0x94
	mov r1, #0
	mov r0, #0x1e
_0233B254:
	mla r3, r4, r0, r2
	strb r1, [r3, #0xa]
	add r4, r4, #1
	strb r1, [r3, #0x8d4]
	cmp r4, #4
	blt _0233B254
	mov r7, #1
	ldr r1, _0233B614 ; =0x000001C2
	mov r3, r7
	mov r5, r7
	add r4, sp, #0x94
	mov r0, #0x1e
_0233B284:
	mla r6, r7, r1, r4
	mov r8, r5
_0233B28C:
	mla r2, r8, r0, r6
	add r8, r8, #1
	strb r3, [r2, #0xa]
	cmp r8, #3
	blt _0233B28C
	add r7, r7, #1
	cmp r7, #5
	blt _0233B284
	mov sl, #0
	str sl, [sp, #0xc]
_0233B2B4:
	add r1, sp, #0x94
	mov r0, #0x1e
	mla r7, sl, r0, r1
	add r0, sp, #0x1c
	add r0, r0, sl, lsl #2
	mov sb, #0
	str r0, [sp, #0x10]
_0233B2D0:
	ldr r0, _0233B614 ; =0x000001C2
	mla r0, sb, r0, r7
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	add r0, sp, #0x58
	add r1, r0, sb, lsl #2
	beq _0233B3F8
	ldr r8, [r0, sb, lsl #2]
	add r0, sp, #0x1c
	ldr r1, [r1, #4]
	ldr r4, [r0, sl, lsl #2]
	sub r0, r1, r8
	sub r5, r0, #3
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, #5
	sub r1, r1, r4
	sub r6, r1, #3
	mov r1, r5
	bl DungeonRandRange
	mov fp, r0
	mov r0, #4
	mov r1, r6
	bl DungeonRandRange
	str r0, [sp, #0x14]
	sub r0, r5, fp
	bl DungeonRandInt
	add r1, r8, #2
	add r8, r1, r0
	ldr r0, [sp, #0x14]
	sub r0, r6, r0
	bl DungeonRandInt
	add r1, r4, #2
	add r4, r1, r0
	ldr r0, [sp, #0x14]
	add fp, r8, fp
	add r5, r4, r0
	ldr r0, _0233B614 ; =0x000001C2
	mul r0, sb, r0
	strh r8, [r7, r0]
	add r0, r7, r0
	strh fp, [r0, #4]
	strh r4, [r0, #2]
	strh r5, [r0, #6]
	ldr r0, [sp, #0xc]
	and r0, r0, #0xff
	str r0, [sp, #0x18]
	b _0233B3E0
_0233B390:
	mov r6, r4
	b _0233B3D4
_0233B398:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r6
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r8
	bl GetTileSafe
	ldr r1, [sp, #0x18]
	add r6, r6, #1
	strb r1, [r0, #7]
_0233B3D4:
	cmp r6, r5
	blt _0233B398
	add r8, r8, #1
_0233B3E0:
	cmp r8, fp
	blt _0233B390
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _0233B4A0
_0233B3F8:
	ldr r2, [r0, sb, lsl #2]
	ldr r1, [r1, #4]
	add r0, r2, #1
	sub r1, r1, r2
	add r2, sp, #0x1c
	ldr r3, [r2, sl, lsl #2]
	ldr r2, [sp, #0x10]
	sub r1, r1, #3
	ldr r2, [r2, #4]
	add r1, r0, r1
	sub r2, r2, r3
	add r4, r3, #1
	sub r5, r2, #3
	bl DungeonRandRange
	add r1, r4, r5
	mov r5, r0
	mov r0, r4
	bl DungeonRandRange
	mov r4, r0
	ldr r0, _0233B614 ; =0x000001C2
	mul r0, sb, r0
	strh r5, [r7, r0]
	add r1, r7, r0
	add r0, r5, #1
	strh r0, [r1, #4]
	strh r4, [r1, #2]
	add r0, r4, #1
	strh r0, [r1, #6]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	mov r1, #0xff
	strb r1, [r0, #7]
_0233B4A0:
	add sb, sb, #1
	cmp sb, #6
	blt _0233B2D0
	add sl, sl, #1
	cmp sl, #4
	blt _0233B2B4
	mov r1, #1
	mov r0, #6
	strb r1, [sp, #0xaa]
	strb r1, [sp, #0x26b]
	strb r1, [sp, #0x26c]
	strb r1, [sp, #0x42d]
	strb r1, [sp, #0x42e]
	strb r1, [sp, #0x5ef]
	strb r1, [sp, #0x5f0]
	strb r1, [sp, #0x7b1]
	strb r1, [sp, #0x7b2]
	strb r1, [sp, #0x973]
	strb r1, [sp, #0xa8]
	strb r1, [sp, #0xc5]
	strb r1, [sp, #0xc6]
	strb r1, [sp, #0xe3]
	strb r1, [sp, #0xe4]
	strb r1, [sp, #0x101]
	strb r1, [sp, #0x104]
	strb r1, [sp, #0x2c5]
	strb r1, [sp, #0x2c6]
	strb r1, [sp, #0x487]
	strb r1, [sp, #0x488]
	strb r1, [sp, #0x649]
	strb r1, [sp, #0x64a]
	strb r1, [sp, #0x80b]
	strb r1, [sp, #0x80c]
	strb r1, [sp, #0x9cd]
	strb r1, [sp, #0x972]
	strb r1, [sp, #0x98f]
	strb r1, [sp, #0x990]
	strb r1, [sp, #0x9ad]
	strb r1, [sp, #0x9ae]
	strb r1, [sp, #0x9cb]
	bl DungeonRandInt
	mov r4, r0
	mov r0, #4
	bl DungeonRandInt
	mov r3, r4
	str r0, [sp]
	ldr r4, [sp, #8]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	str r4, [sp, #4]
	bl AssignGridCellConnections
	add r1, sp, #0x1c
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	add r3, sp, #0x58
	bl CreateGridCellConnections
	add r1, sp, #0x1c
	str r1, [sp]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	add r3, sp, #0x58
	bl EnsureConnectedGrid
	ldr r1, _0233B618 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x94
	ldrsh r3, [r1, #0xc]
	mov r1, #6
	mov r2, #4
	bl GenerateKecleonShop
	ldr r1, _0233B618 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x94
	ldrsh r3, [r1, #0x10]
	mov r1, #6
	mov r2, #4
	bl GenerateMonsterHouse
	ldr r0, [sp, #8]
	mov r1, #6
	ldrb r3, [r0, #0x13]
	add r0, sp, #0x94
	mov r2, #4
	bl GenerateExtraHallways
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	bl GenerateRoomImperfections
	add sp, sp, #0x2f4
	add sp, sp, #0x1800
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233B614: .word 0x000001C2
_0233B618: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateOuterRingFloor

	arm_func_start GenerateCrossroadsFloor
GenerateCrossroadsFloor: ; 0x0233B61C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x1800
	mov r1, #0
	mov r2, #0xb
	str r0, [sp, #8]
	mov fp, #0x16
	mov sl, #0x21
	mov sb, #0x2c
	mov r8, #0x38
	mov r7, #1
	mov r6, #9
	mov r5, #0x10
	mov r4, #0x17
	mov r3, #0x1f
	str r1, [sp, #0x5c]
	str r2, [sp, #0x60]
	add r0, sp, #0x98
	mov r1, #5
	mov r2, #4
	str fp, [sp, #0x64]
	str sl, [sp, #0x68]
	str sb, [sp, #0x6c]
	str r8, [sp, #0x70]
	str r7, [sp, #0x20]
	str r6, [sp, #0x24]
	str r5, [sp, #0x28]
	str r4, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl InitDungeonGrid
	ldr r0, _0233BA74 ; =0x000001C2
	mov r4, #0
	add r2, sp, #0x98
	mov r1, r7
_0233B6A4:
	mla r3, r4, r0, r2
	strb r1, [r3, #0xa]
	add r4, r4, #1
	strb r1, [r3, #0x64]
	cmp r4, #5
	blt _0233B6A4
	mov r3, #0
	add r1, sp, #0x98
	mov r7, #1
	mov r0, #0x1e
_0233B6CC:
	mla r2, r3, r0, r1
	strb r7, [r2, #0xa]
	add r3, r3, #1
	strb r7, [r2, #0x712]
	cmp r3, #4
	blt _0233B6CC
	ldr r1, _0233BA74 ; =0x000001C2
	mov r4, #0
	mov r5, #1
	add r3, sp, #0x98
	mov r0, #0x1e
_0233B6F8:
	mla r6, r7, r1, r3
	mov r8, r5
_0233B700:
	mla r2, r8, r0, r6
	add r8, r8, #1
	strb r4, [r2, #0xa]
	cmp r8, #3
	blt _0233B700
	add r7, r7, #1
	cmp r7, #4
	blt _0233B6F8
	mov r0, #1
	mov sl, r4
	strb r0, [sp, #0xa0]
	strb r0, [sp, #0x7a8]
	strb r0, [sp, #0xfa]
	strb r0, [sp, #0x802]
_0233B738:
	add r1, sp, #0x98
	mov r0, #0x1e
	mla r7, sl, r0, r1
	add r0, sp, #0x20
	add r0, r0, sl, lsl #2
	mov sb, #0
	str r0, [sp, #0x10]
_0233B754:
	ldr r0, _0233BA74 ; =0x000001C2
	mla r1, sb, r0, r7
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0233B938
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	add r0, sp, #0x5c
	add r1, r0, sb, lsl #2
	beq _0233B890
	ldr r8, [r0, sb, lsl #2]
	add r0, sp, #0x20
	ldr r1, [r1, #4]
	ldr r5, [r0, sl, lsl #2]
	sub r0, r1, r8
	sub r6, r0, #3
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, #5
	sub r1, r1, r5
	sub fp, r1, #3
	mov r1, r6
	bl DungeonRandRange
	str r0, [sp, #0x14]
	mov r0, #4
	mov r1, fp
	bl DungeonRandRange
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, r6, r0
	bl DungeonRandInt
	add r1, r8, #2
	add r8, r1, r0
	ldr r0, [sp, #0x18]
	sub r0, fp, r0
	bl DungeonRandInt
	add r1, r5, #2
	add r5, r1, r0
	ldr r0, [sp, #0x14]
	add r0, r8, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add fp, r5, r0
	ldr r0, _0233BA74 ; =0x000001C2
	mul r0, sb, r0
	strh r8, [r7, r0]
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	and r0, r4, #0xff
	strh fp, [r1, #6]
	str r0, [sp, #0x1c]
	b _0233B87C
_0233B82C:
	mov r6, r5
	b _0233B870
_0233B834:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r6
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r8
	bl GetTileSafe
	ldr r1, [sp, #0x1c]
	add r6, r6, #1
	strb r1, [r0, #7]
_0233B870:
	cmp r6, fp
	blt _0233B834
	add r8, r8, #1
_0233B87C:
	ldr r0, [sp, #0xc]
	cmp r8, r0
	blt _0233B82C
	add r4, r4, #1
	b _0233B938
_0233B890:
	ldr r2, [r0, sb, lsl #2]
	ldr r1, [r1, #4]
	add r0, r2, #1
	sub r1, r1, r2
	add r2, sp, #0x20
	ldr r3, [r2, sl, lsl #2]
	ldr r2, [sp, #0x10]
	sub r1, r1, #3
	ldr r2, [r2, #4]
	add r1, r0, r1
	sub r2, r2, r3
	add r5, r3, #1
	sub r6, r2, #3
	bl DungeonRandRange
	add r1, r5, r6
	mov r6, r0
	mov r0, r5
	bl DungeonRandRange
	mov r5, r0
	ldr r0, _0233BA74 ; =0x000001C2
	mul r0, sb, r0
	strh r6, [r7, r0]
	add r1, r7, r0
	add r0, r6, #1
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	add r0, r5, #1
	strh r0, [r1, #6]
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r6
	bl GetTileSafe
	mov r1, #0xff
	strb r1, [r0, #7]
_0233B938:
	add sb, sb, #1
	cmp sb, #5
	blt _0233B754
	add sl, sl, #1
	cmp sl, #4
	blt _0233B738
	mov r7, #1
	ldr r2, _0233BA74 ; =0x000001C2
	mov r0, r7
	mov r5, #0
	add r4, sp, #0x98
	mov r1, #0x1e
_0233B968:
	mla r6, r7, r2, r4
	mov r8, r5
_0233B970:
	mla r3, r8, r1, r6
	strb r0, [r3, #0x14]
	add r8, r8, #1
	strb r0, [r3, #0x31]
	cmp r8, #3
	blt _0233B970
	add r7, r7, #1
	cmp r7, #4
	blt _0233B968
	ldr r1, _0233BA74 ; =0x000001C2
	mov r4, #1
	mov r6, #0
	add r5, sp, #0x98
	mov r2, #0x1e
_0233B9A8:
	mla r7, r0, r2, r5
	mov r8, r6
_0233B9B0:
	mla r3, r8, r1, r7
	strb r4, [r3, #0x16]
	add r8, r8, #1
	strb r4, [r3, #0x1d7]
	cmp r8, #4
	blt _0233B9B0
	add r0, r0, #1
	cmp r0, #3
	blt _0233B9A8
	add r1, sp, #0x20
	str r1, [sp]
	add r0, sp, #0x98
	add r3, sp, #0x5c
	mov r1, #5
	mov r2, #4
	str r4, [sp, #4]
	bl CreateGridCellConnections
	add r4, sp, #0x20
	add r0, sp, #0x98
	add r3, sp, #0x5c
	mov r1, #5
	mov r2, #4
	str r4, [sp]
	bl EnsureConnectedGrid
	ldr r1, _0233BA78 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x98
	ldrsh r3, [r1, #0xc]
	mov r1, #5
	mov r2, #4
	bl GenerateKecleonShop
	ldr r1, _0233BA78 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x98
	ldrsh r3, [r1, #0x10]
	mov r1, #5
	mov r2, #4
	bl GenerateMonsterHouse
	ldr r0, [sp, #8]
	mov r1, #5
	ldrb r3, [r0, #0x13]
	add r0, sp, #0x98
	mov r2, #4
	bl GenerateExtraHallways
	add r0, sp, #0x98
	mov r1, #5
	mov r2, #4
	bl GenerateRoomImperfections
	add sp, sp, #0x2f8
	add sp, sp, #0x1800
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233BA74: .word 0x000001C2
_0233BA78: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateCrossroadsFloor

	arm_func_start GenerateLineFloor
GenerateLineFloor: ; 0x0233BA7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r7, #0
	mov r6, #0xb
	mov lr, #0x16
	mov ip, #0x21
	mov r5, #0x2c
	mov r3, #0x38
	mov r2, #4
	mov r1, #0xf
	mov r4, r0
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x80
	str r7, [sp, #0x44]
	str r6, [sp, #0x48]
	str lr, [sp, #0x4c]
	str ip, [sp, #0x50]
	str r5, [sp, #0x54]
	str r3, [sp, #0x58]
	mov r1, #5
	mov r2, #1
	bl InitDungeonGrid
	ldrsb r3, [r4, #1]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl AssignRooms
	add r1, sp, #8
	str r1, [sp]
	ldrb r2, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	str r2, [sp, #4]
	mov r1, #5
	mov r2, #1
	bl CreateRoomsAndAnchors
	mov r0, #5
	bl DungeonRandInt
	mov r5, r0
	mov r0, #1
	bl DungeonRandInt
	stmia sp, {r0, r4}
	mov r3, r5
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl AssignGridCellConnections
	add r0, sp, #8
	mov r2, #1
	stmia sp, {r0, r2}
	add r0, sp, #0x80
	mov r1, #5
	add r3, sp, #0x44
	bl CreateGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldr r3, _0233BBD8 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, #5
	mov r2, #1
	bl GenerateKecleonShop
	ldr r1, _0233BBD8 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r1, #0x10]
	mov r1, #5
	mov r2, #1
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233BBD8: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateLineFloor

	arm_func_start GenerateCrossFloor
GenerateCrossFloor: ; 0x0233BBDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r1, #3
	mov r8, #0xb
	mov r4, r0
	mov r7, #0x16
	mov r6, #0x21
	mov r5, #0x2c
	mov lr, #2
	mov ip, #0x14
	mov r3, #0x1e
	add r0, sp, #0x80
	mov r2, r1
	str r8, [sp, #0x44]
	str r7, [sp, #0x48]
	str r6, [sp, #0x4c]
	str r5, [sp, #0x50]
	str lr, [sp, #8]
	str r8, [sp, #0xc]
	str ip, [sp, #0x10]
	str r3, [sp, #0x14]
	bl InitDungeonGrid
	mov r5, #0
	ldr r1, _0233BD6C ; =0x000001C2
	mov r3, #1
	mov lr, r5
	add ip, sp, #0x80
	mov r0, #0x1e
_0233BC50:
	mla r7, r5, r1, ip
	mov r6, lr
_0233BC58:
	mla r2, r6, r0, r7
	add r6, r6, #1
	strb r3, [r2, #0xa]
	cmp r6, #3
	blt _0233BC58
	add r5, r5, #1
	cmp r5, #3
	blt _0233BC50
	add r0, sp, #8
	strb r3, [sp, #0x88]
	strb r3, [sp, #0x40c]
	mov r1, #3
	strb r3, [sp, #0xc4]
	strb r3, [sp, #0x448]
	str r0, [sp]
	ldrb ip, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateRoomsAndAnchors
	mov ip, #1
	mov r1, #3
	add r0, sp, #8
	strb ip, [sp, #0xb4]
	strb ip, [sp, #0x275]
	strb ip, [sp, #0x276]
	strb ip, [sp, #0x437]
	strb ip, [sp, #0x256]
	strb ip, [sp, #0x273]
	strb ip, [sp, #0x274]
	strb ip, [sp, #0x291]
	str r0, [sp]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateGridCellConnections
	mov r1, #3
	add ip, sp, #8
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp]
	bl EnsureConnectedGrid
	ldr r1, _0233BD70 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r1, #0xc]
	mov r1, #3
	mov r2, r1
	bl GenerateKecleonShop
	ldr r3, _0233BD70 ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0x10]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateMonsterHouse
	mov r1, #3
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateExtraHallways
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233BD6C: .word 0x000001C2
_0233BD70: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateCrossFloor

	arm_func_start GenerateBeetleFloor
GenerateBeetleFloor: ; 0x0233BD74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r1, #3
	mov r4, r0
	mov sb, #5
	mov r8, #0xf
	mov r7, #0x23
	mov r6, #0x32
	mov r5, #2
	mov lr, #0xb
	mov ip, #0x14
	mov r3, #0x1e
	add r0, sp, #0x80
	mov r2, r1
	str sb, [sp, #0x44]
	str r8, [sp, #0x48]
	str r7, [sp, #0x4c]
	str r6, [sp, #0x50]
	str r5, [sp, #8]
	str lr, [sp, #0xc]
	str ip, [sp, #0x10]
	str r3, [sp, #0x14]
	bl InitDungeonGrid
	mov r5, #0
	ldr r1, _0233BF28 ; =0x000001C2
	mov r3, #1
	mov lr, r5
	add ip, sp, #0x80
	mov r0, #0x1e
_0233BDEC:
	mla r7, r5, r1, ip
	mov r6, lr
_0233BDF4:
	mla r2, r6, r0, r7
	add r6, r6, #1
	strb r3, [r2, #0xa]
	cmp r6, #3
	blt _0233BDF4
	add r5, r5, #1
	cmp r5, #3
	blt _0233BDEC
	add r0, sp, #8
	str r0, [sp]
	ldrb ip, [r4, #0xd]
	mov r1, #3
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateRoomsAndAnchors
	mov r3, #0
	add r0, sp, #0x80
	mov ip, #1
	mov r1, #0x1e
_0233BE48:
	mla r2, r3, r1, r0
	strb ip, [r2, #0x16]
	strb ip, [r2, #0x1d7]
	strb ip, [r2, #0x1d8]
	add r3, r3, #1
	strb ip, [r2, #0x399]
	cmp r3, #3
	blt _0233BE48
	add r2, sp, #8
	str r2, [sp]
	mov r1, #3
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateGridCellConnections
	mov r0, #1
	add r3, sp, #0x80
	mov r2, r0
	mov r1, #0
	bl MergeRoomsVertically
	add r3, sp, #0x80
	mov r0, #1
	mov r1, #0
	mov r2, #2
	bl MergeRoomsVertically
	add r1, sp, #8
	str r1, [sp]
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldr r3, _0233BF2C ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0xc]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateKecleonShop
	ldr r3, _0233BF2C ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0x10]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateMonsterHouse
	mov r1, #3
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateExtraHallways
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233BF28: .word 0x000001C2
_0233BF2C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateBeetleFloor

	arm_func_start MergeRoomsVertically
MergeRoomsVertically: ; 0x0233BF30
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov r5, #0x1e
	add r4, r5, #0x1a4
	add r2, r1, r2
	mul r7, r0, r4
	mov sl, r3
	mul r8, r2, r5
	add fp, sl, r7
	ldrsh r0, [fp, r8]
	mul r6, r1, r5
	str r0, [sp]
	ldrsh r0, [fp, r6]
	ldr r1, [sp]
	cmp r0, r1
	add r1, sl, #4
	add r1, r1, r7
	strlt r0, [sp]
	str r1, [sp, #0x14]
	ldrsh r2, [r1, r8]
	ldrsh sb, [r1, r6]
	add r1, sl, #2
	add r1, r1, r7
	str r1, [sp, #0x10]
	ldrsh r1, [r1, r6]
	cmp sb, r2
	movle sb, r2
	str r1, [sp, #8]
	add r1, sl, #6
	add r1, r1, r7
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrsh r2, [r2, r8]
	str r2, [sp, #0xc]
	bl GetTile
	ldrb r0, [r0, #7]
	ldr r5, [sp]
	and r0, r0, #0xff
	str r0, [sp, #0x18]
	b _0233C01C
_0233BFD4:
	ldr r4, [sp, #8]
	b _0233C00C
_0233BFDC:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #7]
_0233C00C:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _0233BFDC
	add r5, r5, #1
_0233C01C:
	cmp r5, sb
	blt _0233BFD4
	ldr r0, [sp]
	add r3, sl, #0x12
	strh r0, [fp, r6]
	ldr r0, [sp, #0x14]
	add r2, sl, r7
	strh sb, [r0, r6]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	strh r1, [r0, r6]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0, r6]
	add r0, r3, r7
	mov r3, #1
	strb r3, [r0, r8]
	strb r3, [r0, r6]
	add r0, r2, r8
	mov r1, #0
	strb r1, [r0, #0xb]
	strb r3, [r0, #0x11]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MergeRoomsVertically

	arm_func_start GenerateOuterRoomsFloor
GenerateOuterRoomsFloor: ; 0x0233C07C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r5, r1
	mov r6, r0
	mov r4, r2
	add r0, sp, #0x44
	add r1, sp, #8
	mov r2, r6
	mov r3, r5
	bl GetGridPositions
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl InitDungeonGrid
	mov sb, #0
	mov r3, #1
	mov r8, sb
	add r7, sp, #0x80
	mov r0, #0x1e
	ldr r1, _0233C308 ; =0x000001C2
	b _0233C0F8
_0233C0D4:
	mla fp, sb, r1, r7
	mov sl, r8
	b _0233C0EC
_0233C0E0:
	mla r2, sl, r0, fp
	strb r3, [r2, #0xa]
	add sl, sl, #1
_0233C0EC:
	cmp sl, r5
	blt _0233C0E0
	add sb, sb, #1
_0233C0F8:
	cmp sb, r6
	blt _0233C0D4
	mov fp, #1
	sub r3, r5, #1
	sub r2, r6, #1
	mov r8, fp
	mov lr, fp
	add sb, sp, #0x80
	mov r0, #0x1e
	ldr r1, _0233C308 ; =0x000001C2
	b _0233C148
_0233C124:
	mla sl, fp, r1, sb
	mov ip, lr
	b _0233C13C
_0233C130:
	mla r7, ip, r0, sl
	strb r8, [r7, #8]
	add ip, ip, #1
_0233C13C:
	cmp ip, r3
	blt _0233C130
	add fp, fp, #1
_0233C148:
	cmp fp, r2
	blt _0233C124
	add r1, sp, #8
	str r1, [sp]
	ldrb r7, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp, #4]
	bl CreateRoomsAndAnchors
	mov r2, #1
	add r3, sp, #0x80
	sub r1, r5, #1
	mov r0, #0x1e
	mla r7, r1, r0, r3
	mov r8, #0
	sub r1, r6, #2
	sub r0, r6, #1
	mov fp, r2
	ldr sb, _0233C308 ; =0x000001C2
	b _0233C1D4
_0233C1A0:
	cmp r8, #0
	mulne ip, r8, sb
	addne sl, r3, ip
	strneb r2, [sl, #0x16]
	addne sl, r7, ip
	strneb r2, [sl, #0x16]
	cmp r8, r1
	mullt ip, r8, sb
	addlt sl, r3, ip
	strltb fp, [sl, #0x1d7]
	addlt sl, r7, ip
	strltb fp, [sl, #0x1d7]
	add r8, r8, #1
_0233C1D4:
	cmp r8, r0
	blt _0233C1A0
	ldr r2, _0233C308 ; =0x000001C2
	add r1, sp, #0x80
	mla r2, r0, r2, r1
	mov r0, #1
	mov ip, #0x1e
	mov r3, #0
	sub sl, r5, #2
	sub lr, r5, #1
	mov r8, r0
	mov fp, ip
	b _0233C23C
_0233C208:
	cmp r3, #0
	mulne sb, r3, ip
	addne r7, r1, sb
	strneb r0, [r7, #0x13]
	addne r7, r2, sb
	strneb r0, [r7, #0x13]
	cmp r3, sl
	mullt sb, r3, fp
	addlt r7, r1, sb
	strltb r8, [r7, #0x14]
	addlt r7, r2, sb
	strltb r8, [r7, #0x14]
	add r3, r3, #1
_0233C23C:
	cmp r3, lr
	blt _0233C208
	add r7, sp, #8
	str r7, [sp]
	mov r7, #0
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp, #4]
	bl CreateGridCellConnections
	add r7, sp, #8
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp]
	bl EnsureConnectedGrid
	ldrb r3, [r4, #9]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateMazeRoom
	ldr r3, _0233C30C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, r6
	mov r2, r5
	bl GenerateKecleonShop
	ldr r3, _0233C30C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0x10]
	mov r1, r6
	mov r2, r5
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateRoomImperfections
	mov r1, r6
	mov r2, r5
	add r0, sp, #0x80
	bl GenerateSecondaryStructures
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C308: .word 0x000001C2
_0233C30C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateOuterRoomsFloor

	arm_func_start IsNotFullFloorFixedRoom
IsNotFullFloorFixedRoom: ; 0x0233C310
	cmp r0, #0
	ble _0233C324
	cmp r0, #0xa5
	movlt r0, #0
	bxlt lr
_0233C324:
	mov r0, #1
	bx lr
	arm_func_end IsNotFullFloorFixedRoom

	arm_func_start GenerateFixedRoom
GenerateFixedRoom: ; 0x0233C32C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x1800
	ldr r2, _0233C764 ; =DUNGEON_PTR
	str r1, [sp, #0x10]
	ldr r2, [r2]
	mov sl, r0
	add r1, r2, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa00]
#else
	ldr r1, [r1, #0xaa4]
#endif
	ldr r1, [r1, sl, lsl #2]
	ldrh r4, [r1]
	ldrh r5, [r1, #2]
	cmp r4, #0
	cmpne r5, #0
	bne _0233C374
	bl GenerateOneRoomMonsterHouseFloor
	mov r0, #0
	b _0233C758
_0233C374:
	bl IsNotFullFloorFixedRoom
	cmp r0, #0
	bne _0233C590
	ldr r0, _0233C764 ; =DUNGEON_PTR
#ifdef JAPAN
	ldr r2, _0233C768 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr r4, [r0]
	ldr r1, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r0, r4, #0x12000
	ldr r3, [r0, #0xa00]
	add r4, r4, #0xcc00
	ldr r5, [r3, sl, lsl #2]
	mov r3, #0
	ldrh r7, [r5]
	ldrh r6, [r5, #2]
	mov sb, #5
	add fp, r7, #5
	strh r7, [r4, #0x90]
	strh r6, [r4, #0x92]
	ldr r0, [r0, #0xa00]
	ldr r0, [r0, sl, lsl #2]
	add r0, r0, #6
	str r0, [r2, #4]
	add r0, r6, #5
	strh r3, [r1, #0xa]
	str r0, [sp, #0x1c]
#else
	ldr r4, _0233C768 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr r0, [r0]
	ldr r3, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r2, r0, #0x12000
	ldr r5, [r2, #0xaa4]
	add r1, r0, #0xcd00
	ldr r6, [r5, sl, lsl #2]
	add r0, r0, #0xcc00
	ldrh r7, [r6]
	ldrh r6, [r6, #2]
	mov r5, #0
	mov sb, #5
	strh r7, [r1, #0x34]
	strh r6, [r1, #0x36]
	ldr r1, [r2, #0xaa4]
	add fp, r6, #5
	ldr r1, [r1, sl, lsl #2]
	str r0, [sp, #0x1c]
	add r1, r1, #6
	str r1, [r4, #4]
	strh r5, [r3, #0xa]
	add r4, r7, #5
#endif
	b _0233C450
_0233C3E0:
	mov r0, sb, lsl #0x10
	mov r8, #5
	mov r5, r0, asr #0x10
	b _0233C444
_0233C3F0:
	bl GetNextFixedRoomAction
	str r0, [sp, #0x18]
	mov r0, r8
	mov r1, sb
	bl GetTileSafe
	ldrh ip, [r0]
	ldr r1, [sp, #0x18]
	mov r2, r8
	orr ip, ip, #0x100
	strh ip, [r0]
	mov ip, #0
	strb ip, [r0, #6]
	mov ip, #1
	mov r3, sb
	str ip, [sp]
	bl PlaceFixedRoomTile
	cmp r0, #0
#ifdef JAPAN
	strneh r8, [r4, #0x40]
	strneh r5, [r4, #0x42]
#else
	ldrne r0, [sp, #0x1c]
	strneh r8, [r0, #0xe4]
	strneh r5, [r0, #0xe6]
#endif
	add r8, r8, #1
_0233C444:
#ifdef JAPAN
	cmp r8, fp
#else
	cmp r8, r4
#endif
	blt _0233C3F0
	add sb, sb, #1
_0233C450:
#ifdef JAPAN
	ldr r0, [sp, #0x1c]
	cmp sb, r0
#else
	cmp sb, fp
#endif
	blt _0233C3E0
	mov r8, #0
	add r4, r6, #5
	ldr sb, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r5, r7, #5
	mov r6, r8
_0233C46C:
	mov r7, r6
_0233C470:
	cmp r7, #5
	blt _0233C490
	cmp r7, r5
	bge _0233C490
	cmp r8, #5
	blt _0233C490
	cmp r8, r4
	blt _0233C4D4
_0233C490:
	mov r0, r7
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x10
	strh r1, [r0]
	ldrb r1, [sb, #4]
	cmp r1, #0
	ldrh r1, [r0]
	biceq r1, r1, #3
	streqh r1, [r0]
	beq _0233C4D4
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #3
	strh r1, [r0]
_0233C4D4:
	add r7, r7, #1
	cmp r7, #0x38
	blt _0233C470
	add r8, r8, #1
	cmp r8, #0x20
	blt _0233C46C
	cmp sl, #4
	bne _0233C534
	mov r5, #5
	mov r4, #2
_0233C4FC:
	mov r6, r4
_0233C500:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r6, r6, #1
	cmp r6, #5
	orr r1, r1, #0x10
	bic r1, r1, #3
	strh r1, [r0]
	blt _0233C500
	add r5, r5, #1
	cmp r5, #0x10
	ble _0233C4FC
_0233C534:
	bl IsCurrentTilesetBackground
	cmp r0, #0
	beq _0233C584
	mov r6, #0
	mov r4, r6
_0233C548:
	mov r5, r4
_0233C54C:
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	tst r1, #3
	ldreqh r1, [r0]
	orreq r1, r1, #0x10
	streqh r1, [r0]
	cmp r5, #0x38
	blt _0233C54C
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233C548
_0233C584:
	bl FinalizeJunctions
	mov r0, #1
	b _0233C758
_0233C590:
	add r1, r4, #4
	mov r0, #0x38
	bl _s32_div_f
	mov r6, r0
	cmp r6, #2
	add r1, r5, #4
	mov r0, #0x20
	movlt r6, #1
	bl _s32_div_f
	mov r7, r0
	cmp r7, #2
	movlt r7, #1
	mov r1, #0
	str r1, [sp, #0x14]
	add r0, sp, #0x20
	add r1, sp, #0x5c
	mov r2, r6
	mov r3, r7
	ldr r8, [sp, #0x14]
	bl GetGridPositions
	add r0, sp, #0x98
	mov r1, r6
	mov r2, r7
	bl InitDungeonGrid
	ldr r3, [sp, #0x10]
	add r0, sp, #0x98
	ldrsb r3, [r3, #1]
	mov r1, r6
	mov r2, r7
	bl AssignRooms
	mov sb, #0
	mov r3, #1
	mov lr, sb
	add fp, sp, #0x98
	mov r0, #0x1e
	ldr r1, _0233C770 ; =0x000001C2
	b _0233C648
_0233C624:
	mla ip, sb, r1, fp
	mov r8, lr
	b _0233C63C
_0233C630:
	mla r2, r8, r0, ip
	strb r3, [r2, #0x1b]
	add r8, r8, #1
_0233C63C:
	cmp r8, r7
	blt _0233C630
	add sb, sb, #1
_0233C648:
	cmp sb, r6
	blt _0233C624
	mov fp, #0
	b _0233C69C
_0233C658:
	mov r0, r6
	bl DungeonRandInt
	mov sb, r0
	mov r0, r7
	bl DungeonRandInt
	mov r8, r0
	ldr r1, _0233C770 ; =0x000001C2
	add r0, sp, #0x98
	mla r1, sb, r1, r0
	mov r0, #0x1e
	mla r0, r8, r0, r1
	ldrb r1, [r0, #0xa]
	mla r0, r6, r8, sb
	str r0, [sp, #0x14]
	cmp r1, #0
	bne _0233C6A4
	add fp, fp, #1
_0233C69C:
	cmp fp, #0x40
	blt _0233C658
_0233C6A4:
	add r1, sp, #0x5c
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r0, sp, #0x98
	stmib sp, {r1, r4}
	add r3, sp, #0x20
	mov r1, r6
	mov r2, r7
	str r5, [sp, #0xc]
	bl ov29_0234217C
	cmp r6, #1
	cmpeq r7, #1
	beq _0233C738
	ldr r4, [sp, #0x10]
	str r8, [sp]
	add r0, sp, #0x98
	mov r1, r6
	mov r2, r7
	mov r3, sb
	str r4, [sp, #4]
	bl AssignGridCellConnections
	add r4, sp, #0x5c
	str r4, [sp]
	mov r4, #1
	add r0, sp, #0x98
	add r3, sp, #0x20
	mov r1, r6
	mov r2, r7
	str r4, [sp, #4]
	bl CreateGridCellConnections
	add r0, sp, #0x5c
	str r0, [sp]
	mov r1, r6
	add r0, sp, #0x98
	mov r2, r7
	add r3, sp, #0x20
	bl EnsureConnectedGrid
_0233C738:
	ldr r0, _0233C770 ; =0x000001C2
	add r2, sp, #0x98
	mla r0, sb, r0, r2
	mov r1, #0x1e
	mla r0, r8, r1, r0
	mov r1, sl
	bl ov29_02342594
	mov r0, #0
_0233C758:
	add sp, sp, #0x2f8
	add sp, sp, #0x1800
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C764: .word DUNGEON_PTR
_0233C768: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_0233C76C: .word FLOOR_GENERATION_STATUS
_0233C770: .word 0x000001C2
	arm_func_end GenerateFixedRoom

	arm_func_start GenerateOneRoomMonsterHouseFloor
GenerateOneRoomMonsterHouseFloor: ; 0x0233C774
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa60
	sub sp, sp, #0x1000
	mov r1, #1
	add r0, sp, #0
	mov r2, r1
	bl InitDungeonGrid
	mov r5, #2
	mov r1, #1
	mov r0, #0
	mov r3, #0x36
	mov r2, #0x1e
	strh r5, [sp]
	strh r3, [sp, #4]
	strh r5, [sp, #2]
	strh r2, [sp, #6]
	strb r1, [sp, #0xa]
	strb r1, [sp, #0xb]
	strb r0, [sp, #8]
	mov r6, r0
	b _0233C818
_0233C7C8:
	ldrsh r4, [sp, #2]
	b _0233C808
_0233C7D0:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	strb r6, [r0, #7]
	add r4, r4, #1
_0233C808:
	ldrsh r0, [sp, #6]
	cmp r4, r0
	blt _0233C7D0
	add r5, r5, #1
_0233C818:
	ldrsh r0, [sp, #4]
	cmp r5, r0
	blt _0233C7C8
	mov r1, #1
	add r0, sp, #0
	mov r2, r1
	rsb r3, r1, #0x3e8
	bl GenerateMonsterHouse
	add sp, sp, #0xa60
	add sp, sp, #0x1000
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GenerateOneRoomMonsterHouseFloor

	arm_func_start GenerateTwoRoomsWithMonsterHouseFloor
GenerateTwoRoomsWithMonsterHouseFloor: ; 0x0233C844
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2e4
	sub sp, sp, #0x1800
	mov r1, #2
	mov r5, #0x1c
	mov r4, #0x36
	mov r3, #0x1e
	str r5, [sp, #0x4c]
	add r0, sp, #0x84
	mov r2, #1
	str r1, [sp, #0x48]
	str r4, [sp, #0x50]
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r5, #0
	bl InitDungeonGrid
	mov r6, r5
_0233C888:
	add r1, sp, #0x48
	add r0, r1, r6, lsl #2
	ldr sb, [r1, r6, lsl #2]
	ldr r1, [r0, #4]
	ldr sl, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r1, r1, sb
	sub r7, r1, #3
	sub r0, r0, sl
	sub r8, r0, #3
	mov r1, r7
	mov r0, #0xa
	bl DungeonRandRange
	mov r4, r0
	mov r1, r8
	mov r0, #0x10
	bl DungeonRandRange
	mov fp, r0
	sub r0, r7, r4
	bl DungeonRandInt
	add r1, sb, #1
	add r7, r1, r0
	sub r0, r8, fp
	bl DungeonRandInt
	ldr r1, _0233C9E4 ; =0x000001C2
	add r2, sl, #1
	add r8, r2, r0
	mul r1, r6, r1
	add r0, sp, #0x84
	add r2, r0, r1
	mov r0, #1
	strb r0, [r2, #0xa]
	add r0, sp, #0x84
	strh r7, [r0, r1]
	add r0, r7, r4
	strh r0, [r2, #4]
	strh r8, [r2, #2]
	add sb, r8, fp
	str r0, [sp, #8]
	strh sb, [r2, #6]
	and r4, r5, #0xff
	b _0233C97C
_0233C930:
	mov sl, r8
	b _0233C970
_0233C938:
	mov r0, r7
	mov r1, sl
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, sl
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r7
	bl GetTileSafe
	strb r4, [r0, #7]
	add sl, sl, #1
_0233C970:
	cmp sl, sb
	blt _0233C938
	add r7, r7, #1
_0233C97C:
	ldr r0, [sp, #8]
	cmp r7, r0
	blt _0233C930
	add r6, r6, #1
	cmp r6, #2
	add r5, r5, #1
	blt _0233C888
	mov r2, #1
	add r1, sp, #0xc
	strb r2, [sp, #0x9a]
	strb r2, [sp, #0x25b]
	str r1, [sp]
	mov r4, #0
	add r0, sp, #0x84
	add r3, sp, #0x48
	mov r1, #2
	str r4, [sp, #4]
	bl CreateGridCellConnections
	mov r2, #1
	add r0, sp, #0x84
	rsb r3, r2, #0x3e8
	mov r1, #2
	bl GenerateMonsterHouse
	add sp, sp, #0x2e4
	add sp, sp, #0x1800
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C9E4: .word 0x000001C2
	arm_func_end GenerateTwoRoomsWithMonsterHouseFloor

	arm_func_start GenerateExtraHallways
GenerateExtraHallways: ; 0x0233C9E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r3
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	beq _0233CF70
	mov r5, #0
	b _0233CF68
_0233CA0C:
	ldr r0, [sp, #4]
	bl DungeonRandInt
	mov r4, r0
	ldr r0, [sp, #8]
	bl DungeonRandInt
	mov sb, r0
	ldr r1, _0233CF78 ; =0x000001C2
	ldr r0, [sp]
	mla r1, r4, r1, r0
	mov r0, #0x1e
	mla r6, sb, r0, r1
	ldrb r0, [r6, #0xa]
	cmp r0, #0
	ldrneb r0, [r6, #0xb]
	cmpne r0, #0
	beq _0233CF64
	ldrb r0, [r6, #8]
	cmp r0, #0
	ldreqb r0, [r6, #0x10]
	cmpeq r0, #0
	bne _0233CF64
	ldrsh r0, [r6]
	ldrsh r1, [r6, #4]
	bl DungeonRandRange
	mov r8, r0
	ldrsh r0, [r6, #2]
	ldrsh r1, [r6, #6]
	bl DungeonRandRange
	mov r7, r0
	mov r0, #4
	bl DungeonRandInt
	mov r6, r0, lsl #1
	ldr r0, [sp, #8]
	mov ip, #0
	sub fp, r0, #1
	ldr r0, [sp, #4]
	mov r3, #2
	sub r2, r0, #1
	mov r1, #4
	mov r0, #6
	mov lr, ip
_0233CAB0:
	cmp r6, #0
	bne _0233CAC0
	cmp sb, fp
	movge r6, r3
_0233CAC0:
	cmp r6, #2
	bne _0233CAD0
	cmp r4, r2
	movge r6, r1
_0233CAD0:
	cmp r6, #4
	bne _0233CAE0
	cmp sb, #0
	movle r6, r0
_0233CAE0:
	cmp r6, #6
	bne _0233CAF0
	cmp r4, #0
	movle r6, lr
_0233CAF0:
	add ip, ip, #1
	cmp ip, #3
	blt _0233CAB0
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrb sb, [r0, #7]
	ldr r0, _0233CF7C ; =DIRECTIONS_XY
	mov r4, r6, lsl #2
	add fp, r0, r6, lsl #2
_0233CB18:
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrb r0, [r0, #7]
	cmp sb, r0
	ldreq r0, _0233CF7C ; =DIRECTIONS_XY
	ldreqsh r1, [r0, r4]
	ldreqsh r0, [fp, #2]
	addeq r8, r8, r1
	addeq r7, r7, r0
	beq _0233CB18
	ldr fp, _0233CF7C ; =DIRECTIONS_XY
	mov sb, r6, lsl #2
	add r4, fp, r6, lsl #2
_0233CB50:
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	ldreqsh r1, [fp, sb]
	ldreqsh r0, [r4, #2]
	addeq r8, r8, r1
	addeq r7, r7, r0
	beq _0233CB50
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	beq _0233CF64
	sub sb, r8, #2
	mov r4, #0
	add r1, r7, #2
	sub r3, r7, #2
	add r0, r8, #2
	mov r2, #1
	b _0233CBFC
_0233CBB4:
	mov fp, r3
	b _0233CBE8
_0233CBBC:
	cmp sb, #0
	blt _0233CBDC
	cmp sb, #0x38
	bge _0233CBDC
	cmp fp, #0
	blt _0233CBDC
	cmp fp, #0x20
	blt _0233CBE4
_0233CBDC:
	mov r4, r2
	b _0233CBF0
_0233CBE4:
	add fp, fp, #1
_0233CBE8:
	cmp fp, r1
	ble _0233CBBC
_0233CBF0:
	cmp r4, #0
	bne _0233CC04
	add sb, sb, #1
_0233CBFC:
	cmp sb, r0
	ble _0233CBB4
_0233CC04:
	cmp r4, #0
	bne _0233CF64
	add r0, r6, #2
	and r0, r0, #6
	ldr r1, _0233CF7C ; =DIRECTIONS_XY
	mov r2, r0, lsl #2
	add r0, r1, r0, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233CF64
	sub r0, r6, #2
	and r0, r0, #6
	ldr r1, _0233CF7C ; =DIRECTIONS_XY
	mov r2, r0, lsl #2
	add r0, r1, r0, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233CF64
	mov r0, #3
	bl DungeonRandInt
	ldr r4, _0233CF7C ; =DIRECTIONS_XY
	add sb, r0, #3
_0233CC8C:
	cmp r8, #1
	cmpgt r7, #1
	ble _0233CF64
	cmp r8, #0x37
	cmplt r7, #0x1f
	bge _0233CF64
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233CF64
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x10
	bne _0233CF64
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r8, #1
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CD38
	add r0, r8, #1
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CD38
	mov r0, r8
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0xc]
_0233CD38:
	add r0, r8, #1
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CD94
	sub fp, r7, #1
	add r0, r8, #1
	mov r1, fp
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CD94
	mov r1, fp
	mov r0, r8
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0xc]
_0233CD94:
	sub fp, r8, #1
	mov r0, fp
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CDF0
	mov r0, fp
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CDF0
	mov r0, r8
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0xc]
_0233CDF0:
	mov r0, fp
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CE4C
	mov r0, fp
	sub fp, r7, #1
	mov r1, fp
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233CE4C
	mov r1, fp
	mov r0, r8
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0xc]
_0233CE4C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0233CE7C
	mov r0, r8
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233CE7C:
	add r0, r6, #2
	and r1, r0, #6
	mov r0, r1, lsl #2
	ldrsh r2, [r4, r0]
	add r0, r4, r1, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233CF64
	sub r0, r6, #2
	and r1, r0, #6
	mov r0, r1, lsl #2
	ldrsh r2, [r4, r0]
	add r0, r4, r1, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233CF64
	subs sb, sb, #1
	bne _0233CF48
	mov r0, #3
	bl DungeonRandInt
	add sb, r0, #3
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	addlt r6, r6, #2
	subge r6, r6, #2
	cmp r8, #0x20
	and r6, r6, #6
	blt _0233CF2C
	ldr r0, _0233CF80 ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #6]
	cmp r0, #1
	cmpeq r6, #2
	beq _0233CF64
_0233CF2C:
	cmp r8, #0x30
	blt _0233CF48
	ldr r0, _0233CF80 ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #6]
	cmp r0, #2
	cmpeq r6, #2
	beq _0233CF64
_0233CF48:
	mov r0, r6, lsl #2
	ldrsh r1, [r4, r0]
	add r0, r4, r6, lsl #2
	ldrsh r0, [r0, #2]
	add r8, r8, r1
	add r7, r7, r0
	b _0233CC8C
_0233CF64:
	add r5, r5, #1
_0233CF68:
	cmp r5, sl
	blt _0233CA0C
_0233CF70:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233CF78: .word 0x000001C2
_0233CF7C: .word DIRECTIONS_XY
_0233CF80: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateExtraHallways

	arm_func_start GetGridPositions
GetGridPositions: ; 0x0233CF84
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	mov r6, r4
	mov r5, #0x38
	b _0233CFC0
_0233CFA8:
	mov r0, r5
	mov r1, r8
	str r4, [sl, r6, lsl #2]
	bl _s32_div_f
	add r4, r4, r0
	add r6, r6, #1
_0233CFC0:
	cmp r6, r8
	blt _0233CFA8
	mov r6, #0
	str r4, [sl, r8, lsl #2]
	mov r5, r6
	mov r4, #0x20
	b _0233CFF4
_0233CFDC:
	mov r0, r4
	mov r1, r7
	str r6, [sb, r5, lsl #2]
	bl _s32_div_f
	add r6, r6, r0
	add r5, r5, #1
_0233CFF4:
	cmp r5, r7
	blt _0233CFDC
	str r6, [sb, r7, lsl #2]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end GetGridPositions

	arm_func_start InitDungeonGrid
InitDungeonGrid: ; 0x0233D004
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add r5, r1, r1, lsl #1
	mov r4, r5, asr #1
	add r3, r1, r1, lsr #31
	add ip, r5, r4, lsr #30
	mov r7, #0
	b _0233D0F0
_0233D020:
	ldr r4, _0233D0FC ; =0x000001C2
	mov r8, #0
	mla sb, r7, r4, r0
	mov r5, #1
	mov r4, r8
	mov r6, r5
	mov lr, r8
	b _0233D0E4
_0233D040:
	ldr sl, _0233D100 ; =FLOOR_GENERATION_STATUS
	ldrb sl, [sl, #6]
	cmp sl, #1
	bne _0233D064
	cmp r7, r3, asr #1
	movge sl, #0x1e
	mlage sl, r8, sl, sb
	strgeb r6, [sl, #8]
	bge _0233D08C
_0233D064:
	cmp sl, #2
	bne _0233D080
	cmp r7, ip, asr #2
	movge sl, #0x1e
	mlage sl, r8, sl, sb
	strgeb r5, [sl, #8]
	bge _0233D08C
_0233D080:
	mov sl, #0x1e
	mla sl, r8, sl, sb
	strb r4, [sl, #8]
_0233D08C:
	mov fp, #1
	strb fp, [sl, #0xa]
	strb lr, [sl, #0xb]
	strb lr, [sl, #0xf]
	and fp, lr, #0xff
	strb fp, [sl, #0xe]
	strb fp, [sl, #0xc]
	strb lr, [sl, #0x16]
	strb fp, [sl, #0x15]
	strb fp, [sl, #0x14]
	strb fp, [sl, #0x13]
	strb lr, [sl, #0x1a]
	strb fp, [sl, #0x19]
	strb fp, [sl, #0x18]
	strb fp, [sl, #0x17]
	strb lr, [sl, #9]
	strb lr, [sl, #0x11]
	strb lr, [sl, #0x10]
	strb lr, [sl, #0x12]
	strb lr, [sl, #0x1c]
	strb lr, [sl, #0x1d]
	add r8, r8, #1
_0233D0E4:
	cmp r8, r2
	blt _0233D040
	add r7, r7, #1
_0233D0F0:
	cmp r7, r1
	blt _0233D020
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D0FC: .word 0x000001C2
_0233D100: .word FLOOR_GENERATION_STATUS
	arm_func_end InitDungeonGrid

	arm_func_start AssignRooms
AssignRooms: ; 0x0233D104
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	mov sl, r0
	mov r4, r3
	mov r0, #3
	mov sb, r1
	mov r8, r2
	bl DungeonRandInt
	cmp r4, #0
	rsblt r4, r4, #0
	addge r4, r4, r0
	mov r2, #0
	mov r1, #1
	add r0, sp, #4
	b _0233D148
_0233D140:
	strb r1, [r0, r2]
	add r2, r2, #1
_0233D148:
	cmp r2, r4
	blt _0233D140
	mov r1, #0
	add r0, sp, #4
	b _0233D164
_0233D15C:
	strb r1, [r0, r2]
	add r2, r2, #1
_0233D164:
	cmp r2, #0x100
	blt _0233D15C
	mul r7, sb, r8
	mov r6, #0
	add r4, sp, #4
_0233D178:
	mov r0, r7
	bl DungeonRandInt
	mov r5, r0
	mov r0, r7
	bl DungeonRandInt
	add r6, r6, #1
	ldrb r2, [r4, r5]
	ldrb r1, [r4, r0]
	cmp r6, #0x40
	strb r1, [r4, r5]
	strb r2, [r4, r0]
	blt _0233D178
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	mov fp, #0
	sub r1, sb, #1
	str fp, [r0, #0x14]
	mov r3, fp
	and r5, sb, #1
	add r0, r1, r1, lsr #31
	mov r2, fp
	add lr, sp, #4
	b _0233D25C
_0233D1D0:
	ldr r1, _0233D314 ; =0x000001C2
	mov r4, #0
	mla r6, r3, r1, sl
	ldr r1, _0233D310 ; =FLOOR_GENERATION_STATUS
	b _0233D250
_0233D1E4:
	mov r7, #0x1e
	mla r7, r4, r7, r6
	ldrb ip, [r7, #8]
	cmp ip, #0
	bne _0233D24C
	ldr ip, [r1, #0x14]
	cmp ip, #0x20
	strgeb r2, [r7, #0xa]
	ldrb ip, [lr, fp]
	cmp ip, #0
	beq _0233D240
	mov ip, #1
	strb ip, [r7, #0xa]
	ldr ip, [r1, #0x14]
	cmp r5, #0
	add ip, ip, #1
	str ip, [r1, #0x14]
	beq _0233D248
	cmp r3, r0, asr #1
	cmpeq r4, #1
	moveq ip, #0
	streqb ip, [r7, #0xa]
	b _0233D248
_0233D240:
	mov ip, #0
	strb ip, [r7, #0xa]
_0233D248:
	add fp, fp, #1
_0233D24C:
	add r4, r4, #1
_0233D250:
	cmp r4, r8
	blt _0233D1E4
	add r3, r3, #1
_0233D25C:
	cmp r3, sb
	blt _0233D1D0
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x14]
	cmp r0, #2
	bge _0233D308
	mov r4, #0
	b _0233D2F4
_0233D27C:
	mov r0, #0
	str r0, [sp]
	mov r6, r0
	b _0233D2DC
_0233D28C:
	ldr r0, _0233D314 ; =0x000001C2
	mov r7, #0
	mla fp, r6, r0, sl
	b _0233D2D0
_0233D29C:
	mov r0, #0x1e
	mla r5, r7, r0, fp
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _0233D2CC
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x3c
	movlt r0, #1
	strlt r0, [sp]
	strltb r0, [r5, #0xa]
	blt _0233D2E4
_0233D2CC:
	add r7, r7, #1
_0233D2D0:
	cmp r7, r8
	blt _0233D29C
	add r6, r6, #1
_0233D2DC:
	cmp r6, sb
	blt _0233D28C
_0233D2E4:
	ldr r0, [sp]
	cmp r0, #0
	bne _0233D2FC
	add r4, r4, #1
_0233D2F4:
	cmp r4, #0xc8
	blt _0233D27C
_0233D2FC:
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	strb r1, [r0]
_0233D308:
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D310: .word FLOOR_GENERATION_STATUS
_0233D314: .word 0x000001C2
	arm_func_end AssignRooms

	arm_func_start CreateRoomsAndAnchors
CreateRoomsAndAnchors: ; 0x0233D318
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r5, [sp, #0x5c]
	str r0, [sp]
	and r0, r5, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x58]
	mov r4, #0
	str r4, [sp, #0x1c]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r0, [sp, #0x58]
	b _0233D658
_0233D350:
	ldr r0, [sp]
	mov r1, #0x1e
	mla sb, r4, r1, r0
	ldr r0, [sp, #4]
	mov sl, #0
	sub r0, r0, #1
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	sub r0, r0, #1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x58]
	add r0, r0, r4, lsl #2
	str r0, [sp, #0x20]
	b _0233D648
_0233D388:
	ldr r0, [sp, #0xc]
	ldr r3, [r0, sl, lsl #2]
	ldr r0, [sp, #0x58]
	add fp, r3, #2
	ldr r2, [r0, r4, lsl #2]
	add r0, r2, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r0, r0, sl, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x20]
	sub r1, r1, r3
	ldr r0, [r0, #4]
	sub r5, r1, #4
	sub r0, r0, r2
	sub r6, r0, #3
	ldr r0, _0233D66C ; =0x000001C2
	mla r0, sl, r0, sb
	str r0, [sp, #0x10]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0233D644
	ldr r0, [sp, #0x10]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _0233D580
	mov r0, #5
	mov r1, r5
	bl DungeonRandRange
	mov r7, r0
	mov r0, #4
	mov r1, r6
	bl DungeonRandRange
	mov r8, r0
	orr r0, r7, #1
	cmp r0, r5
	movlt r7, r0
	orr r0, r8, #1
	cmp r0, r6
	movlt r8, r0
	add r0, r8, r8, lsl #1
	add r0, r0, r0, lsr #31
	cmp r7, r0, asr #1
	mov r0, r0, asr #1
	movgt r7, r0
	add r0, r7, r7, lsl #1
	add r0, r0, r0, lsr #31
	cmp r8, r0, asr #1
	mov r0, r0, asr #1
	movgt r8, r0
	sub r0, r5, r7
	bl DungeonRandInt
	add r5, fp, r0
	sub r0, r6, r8
	bl DungeonRandInt
	ldr r1, [sp, #0x18]
	add fp, r5, r7
	add r6, r1, r0
	ldr r0, _0233D66C ; =0x000001C2
	add r7, r6, r8
	mul r0, sl, r0
	strh r5, [sb, r0]
	add r0, sb, r0
	strh fp, [r0, #4]
	strh r6, [r0, #2]
	strh r7, [r0, #6]
	ldr r0, [sp, #0x1c]
	and r0, r0, #0xff
	str r0, [sp, #0x24]
	b _0233D4F0
_0233D4A0:
	mov r8, r6
	b _0233D4E4
_0233D4A8:
	mov r0, r5
	mov r1, r8
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r8
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldr r1, [sp, #0x24]
	add r8, r8, #1
	strb r1, [r0, #7]
_0233D4E4:
	cmp r8, r7
	blt _0233D4A8
	add r5, r5, #1
_0233D4F0:
	cmp r5, fp
	blt _0233D4A0
	mov r5, #1
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x50
	movlt r0, r5
	movge r0, #0
	and r6, r0, #0xff
	ldr r0, _0233D670 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldr r0, [sp, #0x14]
	moveq r6, #0
	cmp r0, #0
	moveq r5, #0
	cmp r5, #0
	cmpne r6, #0
	beq _0233D550
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	movlt r5, #0
	movge r6, #0
_0233D550:
	cmp r5, #0
	ldrne r0, [sp, #0x10]
	movne r1, #1
	strneb r1, [r0, #0x1c]
	cmp r6, #0
	ldrne r0, [sp, #0x10]
	movne r1, #1
	strneb r1, [r0, #0x1d]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	b _0233D644
_0233D580:
	mov r2, #2
	ldr r0, [sp, #0x28]
	mov r8, r2
	cmp sl, #0
	moveq r2, #1
	cmp r4, #0
	moveq r8, #1
	cmp sl, r0
	mov r1, #4
	mov r7, r1
	ldr r0, [sp, #0x2c]
	moveq r1, #2
	cmp r4, r0
	add r0, fp, r2
	add r2, fp, r5
	sub r1, r2, r1
	moveq r7, #2
	bl DungeonRandRange
	ldr r1, [sp, #0x18]
	add r1, r1, r6
	mov r6, r0
	ldr r0, [sp, #0x18]
	sub r1, r1, r7
	add r0, r0, r8
	bl DungeonRandRange
	mov r5, r0
	ldr r0, _0233D66C ; =0x000001C2
	mul r0, sl, r0
	strh r6, [sb, r0]
	add r1, sb, r0
	add r0, r6, #1
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	add r0, r5, #1
	strh r0, [r1, #6]
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r6
	bl GetTileSafe
	mov r1, #0xfe
	strb r1, [r0, #7]
_0233D644:
	add sl, sl, #1
_0233D648:
	ldr r0, [sp, #4]
	cmp sl, r0
	blt _0233D388
	add r4, r4, #1
_0233D658:
	ldr r0, [sp, #8]
	cmp r4, r0
	blt _0233D350
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D66C: .word 0x000001C2
_0233D670: .word FLOOR_GENERATION_STATUS
	arm_func_end CreateRoomsAndAnchors

	arm_func_start GenerateSecondaryStructures
GenerateSecondaryStructures: ; 0x0233D674
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	mov r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r0, [sp, #0x20]
	b _0233E03C
_0233D694:
	ldr r0, [sp, #0x20]
	mov r1, #0x1e
	mul r7, r0, r1
	mov r0, #0
	add r6, sl, r7
	str r0, [sp, #0x24]
	b _0233E020
_0233D6B0:
	ldr r1, [sp, #0x24]
	ldr r0, _0233E054 ; =0x000001C2
	mul sb, r1, r0
	add r8, r6, sb
	ldrb r0, [r8, #8]
	cmp r0, #0
	ldreqb r0, [r8, #0xe]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x12]
	cmpeq r0, #0
	bne _0233E014
	ldrb r0, [r8, #0xa]
	cmp r0, #0
	beq _0233E014
	ldrb r0, [r8, #0x1c]
	cmp r0, #0
	bne _0233E014
	ldrb r0, [r8, #0x1d]
	cmp r0, #0
	beq _0233E014
	mov r0, #6
	bl DungeonRandInt
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0233E014
_0233D714: ; jump table
	b _0233E014 ; case 0
	b _0233DE94 ; case 1
	b _0233DDC8 ; case 2
	b _0233DC9C ; case 3
	b _0233D938 ; case 4
	b _0233D72C ; case 5
_0233D72C:
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	mov r0, #2
	bl DungeonRandInt
	cmp r0, #0
	mov r0, #0
	beq _0233D850
	str r0, [sp, #0x10]
	mov r4, r8
	ldrsh r1, [r6, sb]
	ldrsh r0, [r4, #4]
	ldrsh r5, [r4, #2]
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov fp, r0, asr #1
	b _0233D7AC
_0233D78C:
	mov r0, fp
	mov r1, r5
	bl IsNextToHallway
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x10]
	bne _0233D7B8
	add r5, r5, #1
_0233D7AC:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D78C
_0233D7B8:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233E014
	ldrsh r5, [r4, #2]
	b _0233D7F4
_0233D7CC:
	mov r0, fp
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233D7F4:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D7CC
	ldrsh sb, [r4]
	b _0233D83C
_0233D808:
	ldrsh r5, [r4, #2]
	b _0233D82C
_0233D810:
	mov r0, sb
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	orr r1, r1, #0x80
	strh r1, [r0]
_0233D82C:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D810
	add sb, sb, #1
_0233D83C:
	cmp sb, fp
	blt _0233D808
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233D850:
	str r0, [sp, #0x14]
	mov r4, r8
	ldrsh r1, [r4, #2]
	ldrsh r0, [r4, #6]
	ldrsh r5, [r6, sb]
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov fp, r0, asr #1
	b _0233D894
_0233D874:
	mov r0, r5
	mov r1, fp
	bl IsNextToHallway
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x14]
	bne _0233D8A0
	add r5, r5, #1
_0233D894:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D874
_0233D8A0:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0233E014
	ldrsh r5, [r4]
	b _0233D8DC
_0233D8B4:
	mov r0, r5
	mov r1, fp
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233D8DC:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D8B4
	ldrsh sb, [r4, #2]
	b _0233D924
_0233D8F0:
	ldrsh r5, [r4]
	b _0233D914
_0233D8F8:
	mov r0, r5
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	orr r1, r1, #0x80
	strh r1, [r0]
_0233D914:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D8F8
	add sb, sb, #1
_0233D924:
	cmp sb, fp
	blt _0233D8F0
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233D938:
	mov r1, r8
	ldrsh r4, [r6, sb]
	ldrsh r3, [r1, #4]
	sub r0, r3, r4
	cmp r0, #6
	ldrgesh r2, [r1, #2]
	ldrgesh r1, [r1, #6]
	subge r0, r1, r2
	cmpge r0, #6
	blt _0233E014
	add r0, r4, r3
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	add r1, r2, r1
	ldr r0, [r0, #0x18]
	add r1, r1, r1, lsr #31
	mov r4, r1, asr #1
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	sub r0, r4, #2
	str r0, [sp, #0xc]
	sub r0, r5, #2
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	sub fp, r5, #1
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r1, [r0]
	sub sb, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #6
	strh r1, [r0]
	ldr r0, [sp, #8]
	mov r1, sb
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	add r1, r4, #1
	orr r2, r2, #4
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, sb
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, sb
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #4
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #0x40
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r1, [r0, #2]
	orr r1, r1, #0x10
	strh r1, [r0, #2]
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DC9C:
	mov r4, r8
	ldrsh r3, [r6, sb]
	ldrsh r2, [r4, #4]
	sub r0, r2, r3
	cmp r0, #5
	ldrgesh r1, [r4, #6]
	ldrgesh r0, [r4, #2]
	subge r0, r1, r0
	cmpge r0, #5
	blt _0233E014
	add r0, r3, #2
	sub r1, r2, #3
	bl DungeonRandRange
	ldrsh r1, [r4, #6]
	str r0, [sp, #0x28]
	mov r5, r0
	ldrsh r0, [r4, #2]
	sub r1, r1, #3
	add r0, r0, #2
	bl DungeonRandRange
	str r0, [sp, #0x18]
	ldrsh r0, [r4]
	ldrsh r1, [r4, #4]
	add r0, r0, #2
	sub r1, r1, #3
	bl DungeonRandRange
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #2]
	ldrsh r1, [r4, #6]
	add r0, r0, #2
	sub r1, r1, #3
	bl DungeonRandRange
	mov fp, r0
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	movgt r5, r0
	movgt r0, r1
	strgt r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	cmp r0, fp
	strgt fp, [sp, #0x18]
	movgt fp, r0
	b _0233DDB0
_0233DD74:
	ldr r4, [sp, #0x18]
	b _0233DDA4
_0233DD7C:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233DDA4:
	cmp r4, fp
	ble _0233DD7C
	add r5, r5, #1
_0233DDB0:
	ldr r0, [sp, #0x1c]
	cmp r5, r0
	ble _0233DD74
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DDC8:
	mov r2, r8
	ldrsh r1, [r2, #4]
	ldrsh r0, [r6, sb]
	sub r0, r1, r0
	tst r0, #1
	beq _0233E014
	ldrsh r1, [r2, #6]
	ldrsh r0, [r2, #2]
	sub r0, r1, r0
	tst r0, #1
	ldrne r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldrne r0, [r0, #0x18]
	cmpne r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	mov r5, #0
_0233DE1C:
	ldrsh r1, [r8, #4]
	ldrsh r0, [r8]
	sub r0, r1, r0
	bl DungeonRandInt
	mov r4, r0
	ldrsh r1, [r8, #6]
	ldrsh r0, [r8, #2]
	sub r0, r1, r0
	bl DungeonRandInt
	mov r2, r0
	add r0, r4, r2
	tst r0, #1
	beq _0233DE7C
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	add r0, r0, r4
	add r1, r1, r2
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233DE7C:
	add r5, r5, #1
	cmp r5, #0x40
	blt _0233DE1C
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DE94:
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	mov r0, r8
	ldrsh r2, [r0, #4]
	ldrsh r1, [r6, sb]
	sub r3, r2, r1
	tst r3, #1
	beq _0233DEDC
	ldrsh r2, [r0, #6]
	ldrsh r1, [r0, #2]
	sub r1, r2, r1
	tst r1, #1
	bne _0233DFF4
_0233DEDC:
	cmp r3, #5
	ldrsh r4, [r0]
	ldrsh r3, [r0, #4]
	ldrsh r2, [r0, #6]
	ldrsh r1, [r0, #2]
	add r0, r4, r3
	add r0, r0, r0, lsr #31
	mov r4, r0, asr #1
	add r0, r1, r2
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	subge r0, r2, r1
	cmpge r0, #5
	blt _0233DFCC
	add r0, r4, #1
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r5, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	sub r0, r4, #1
	bl GetTileSafe
	ldrh r2, [r0]
	sub r1, r5, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	mov r1, r5
	ldrh r2, [r0]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	b _0233E00C
_0233DFCC:
	mov r0, r4
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	b _0233E00C
_0233DFF4:
	add r4, sl, sb
	add r0, r4, r7
	bl SetSpawnFlag5
	add r0, r4, r7
	mov r1, #1
	bl GenerateMaze
_0233E00C:
	mov r0, #1
	strb r0, [r8, #9]
_0233E014:
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
_0233E020:
	ldr r1, [sp, #0x24]
	ldr r0, [sp]
	cmp r1, r0
	blt _0233D6B0
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
_0233E03C:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _0233D694
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E054: .word 0x000001C2
_0233E058: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateSecondaryStructures

	arm_func_start AssignGridCellConnections
AssignGridCellConnections: ; 0x0233E05C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r4, [sp, #0x3c]
	mov r8, r1
	mov r1, r4
	ldrb r1, [r1, #5]
	mov sb, r0
	mov r0, #4
	str r4, [sp, #0x3c]
	mov fp, r2
	mov r7, r3
	ldr r5, [sp, #0x38]
	str r1, [sp, #4]
	bl DungeonRandInt
	mov r6, r0
	mov sl, #0
	b _0233E208
_0233E0A0:
	mov r0, #8
	bl DungeonRandInt
	mov r4, r0
	mov r0, #4
	bl DungeonRandInt
	mov lr, #1
	cmp r4, #4
	movlt r6, r0
	sub r1, r8, #1
	sub r0, fp, #1
	mov ip, lr
	mov r3, #0
_0233E0D0:
	and r2, r6, #3
	mov r4, r3
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0233E130
_0233E0E4: ; jump table
	b _0233E0F4 ; case 0
	b _0233E104 ; case 1
	b _0233E114 ; case 2
	b _0233E124 ; case 3
_0233E0F4:
	cmp r7, r1
	movlt r4, ip
	addge r6, r6, #1
	b _0233E130
_0233E104:
	cmp r5, #0
	movgt r4, lr
	addle r6, r6, #1
	b _0233E130
_0233E114:
	cmp r7, #0
	movgt r4, #1
	addle r6, r6, #1
	b _0233E130
_0233E124:
	cmp r5, r0
	movlt r4, #1
	addge r6, r6, #1
_0233E130:
	cmp r4, #0
	beq _0233E0D0
	and r0, r6, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233E204
_0233E148: ; jump table
	b _0233E158 ; case 0
	b _0233E184 ; case 1
	b _0233E1B0 ; case 2
	b _0233E1DC ; case 3
_0233E158:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x16]
	streqb r0, [r1, #0x1d7]
	addeq r7, r7, #1
	b _0233E204
_0233E184:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #-0x16]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x13]
	streqb r0, [r1, #-0xa]
	subeq r5, r5, #1
	b _0233E204
_0233E1B0:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #-0x1ba]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x15]
	streqb r0, [r1, #-0x1ac]
	subeq r7, r7, #1
	b _0233E204
_0233E1DC:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #0x26]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x14]
	streqb r0, [r1, #0x31]
	addeq r5, r5, #1
_0233E204:
	add sl, sl, #1
_0233E208:
	ldr r0, [sp, #4]
	cmp sl, r0
	blt _0233E0A0
	ldr r0, [sp, #0x3c]
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0233E430
_0233E224:
	sub r0, r8, #1
	mov r6, #0
	str r0, [sp, #8]
	sub r0, fp, #1
	str r6, [sp]
	str r0, [sp, #0xc]
	b _0233E41C
_0233E240:
	ldr r0, _0233E438 ; =0x000001C2
	mov r7, #0
	mla sl, r6, r0, sb
	b _0233E410
_0233E250:
	mov r1, #0x1e
	mla r5, r7, r1, sl
	ldrb r1, [r5, #8]
	mov r0, #0
	cmp r1, #0
	ldreqb r1, [r5, #0xa]
	cmpeq r1, #0
	bne _0233E40C
	ldrb r1, [r5, #0x13]
	cmp r1, #0
	ldrb r1, [r5, #0x14]
	addne r0, r0, #1
	cmp r1, #0
	ldrb r1, [r5, #0x15]
	addne r0, r0, #1
	cmp r1, #0
	ldrb r1, [r5, #0x16]
	addne r0, r0, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r0, #1
	bne _0233E40C
	mov r4, #0
	mov r0, #4
	bl DungeonRandInt
	mov r1, r4
	b _0233E370
_0233E2BC:
	and r2, r0, #3
	mov r4, #0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0233E364
_0233E2D0: ; jump table
	b _0233E2E0 ; case 0
	b _0233E304 ; case 1
	b _0233E324 ; case 2
	b _0233E344 ; case 3
_0233E2E0:
	ldr r2, [sp, #8]
	cmp r6, r2
	bge _0233E2FC
	ldrb r2, [r5, #0x16]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E2FC:
	add r0, r0, #1
	b _0233E364
_0233E304:
	cmp r7, #0
	ble _0233E31C
	ldrb r2, [r5, #0x13]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E31C:
	add r0, r0, #1
	b _0233E364
_0233E324:
	cmp r6, #0
	ble _0233E33C
	ldrb r2, [r5, #0x15]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E33C:
	add r0, r0, #1
	b _0233E364
_0233E344:
	ldr r2, [sp, #0xc]
	cmp r7, r2
	bge _0233E360
	ldrb r2, [r5, #0x14]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E360:
	add r0, r0, #1
_0233E364:
	cmp r4, #0
	bne _0233E378
	add r1, r1, #1
_0233E370:
	cmp r1, #8
	blt _0233E2BC
_0233E378:
	cmp r4, #0
	beq _0233E40C
	and r0, r0, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233E40C
_0233E390: ; jump table
	b _0233E3A0 ; case 0
	b _0233E3BC ; case 1
	b _0233E3D8 ; case 2
	b _0233E3F4 ; case 3
_0233E3A0:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x16]
	streqb r0, [r5, #0x1d7]
	streq r0, [sp]
	b _0233E40C
_0233E3BC:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x13]
	streqb r0, [r5, #-0xa]
	streq r0, [sp]
	b _0233E40C
_0233E3D8:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x15]
	streqb r0, [r5, #-0x1ac]
	streq r0, [sp]
	b _0233E40C
_0233E3F4:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x14]
	streqb r0, [r5, #0x31]
	streq r0, [sp]
_0233E40C:
	add r7, r7, #1
_0233E410:
	cmp r7, fp
	blt _0233E250
	add r6, r6, #1
_0233E41C:
	cmp r6, r8
	blt _0233E240
	ldr r0, [sp]
	cmp r0, #0
	bne _0233E224
_0233E430:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E438: .word 0x000001C2
	arm_func_end AssignGridCellConnections

	arm_func_start CreateGridCellConnections
CreateGridCellConnections: ; 0x0233E43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	mov sb, r3
	ldr r8, [sp, #0x70]
	mov r5, #0
	b _0233E510
_0233E460:
	ldr r1, _0233ED30 ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov r6, #0
	mla r7, r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r3, r6
	sub r1, r0, #1
	ldr r0, [sp, #0x14]
	mov r2, r6
	sub r0, r0, #1
	mov ip, r6
	mov lr, r6
	mov r4, r6
	b _0233E500
_0233E498:
	mov sl, #0x1e
	mla sl, r6, sl, r7
	ldrb fp, [sl, #8]
	cmp fp, #0
	strneb r4, [sl, #0x17]
	strneb r4, [sl, #0x18]
	strneb r4, [sl, #0x19]
	strneb r4, [sl, #0x1a]
	bne _0233E4FC
	cmp r5, #0
	strleb r3, [sl, #0x15]
	cmp r6, #0
	strleb r2, [sl, #0x13]
	cmp r5, r1
	strgeb ip, [sl, #0x16]
	cmp r6, r0
	strgeb lr, [sl, #0x14]
	ldrb fp, [sl, #0x13]
	strb fp, [sl, #0x17]
	ldrb fp, [sl, #0x14]
	strb fp, [sl, #0x18]
	ldrb fp, [sl, #0x15]
	strb fp, [sl, #0x19]
	ldrb fp, [sl, #0x16]
	strb fp, [sl, #0x1a]
_0233E4FC:
	add r6, r6, #1
_0233E500:
	ldr sl, [sp, #0x14]
	cmp r6, sl
	blt _0233E498
	add r5, r5, #1
_0233E510:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0233E460
	mov r6, #0
	b _0233E800
_0233E524:
	ldr r1, _0233ED30 ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov r7, #0
	mla r4, r6, r1, r0
	add r0, sb, r6, lsl #2
	str r0, [sp, #0x2c]
	b _0233E7F0
_0233E540:
	mov r0, #0x1e
	mla r5, r7, r0, r4
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _0233E7EC
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	ldreqsh fp, [r5]
	ldreqsh sl, [r5, #2]
	beq _0233E598
	ldrsh r0, [r5]
	ldrsh r1, [r5, #4]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	mov fp, r0
	ldrsh r0, [r5, #2]
	ldrsh r1, [r5, #6]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	mov sl, r0
_0233E598:
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _0233E624
	ldrb r0, [r5, #-0x16]
	cmp r0, #0
	bne _0233E60C
	ldrb r0, [r5, #-0x14]
	cmp r0, #0
	ldreqsh r2, [r5, #-0x1e]
	beq _0233E5D8
	ldrsh r0, [r5, #-0x1e]
	ldrsh r1, [r5, #-0x1a]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	mov r2, r0
_0233E5D8:
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1e
	mla r3, r7, r0, r4
	ldr r1, [sb, r6, lsl #2]
	mov r0, fp
	str r1, [sp, #4]
	ldr r1, [r8, r7, lsl #2]
	str r1, [sp, #8]
	ldrsh r1, [r3, #2]
	ldrsh r3, [r3, #-0x18]
	sub r3, r3, #1
	bl CreateHallway
_0233E60C:
	mov r0, #0
	strb r0, [r5, #0x17]
	strb r0, [r5, #-6]
	mov r0, #1
	strb r0, [r5, #0xb]
	strb r0, [r5, #-0x13]
_0233E624:
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0233E6B8
	ldrb r0, [r5, #0x26]
	cmp r0, #0
	bne _0233E6A0
	ldrb r0, [r5, #0x28]
	cmp r0, #0
	ldreqsh r2, [r5, #0x1e]
	beq _0233E664
	ldrsh r0, [r5, #0x1e]
	ldrsh r1, [r5, #0x22]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	mov r2, r0
_0233E664:
	mov r1, #1
	str r1, [sp]
	mov r0, fp
	mov r1, #0x1e
	ldr fp, [sb, r6, lsl #2]
	mla r1, r7, r1, r4
	add r3, r8, r7, lsl #2
	str fp, [sp, #4]
	ldr r3, [r3, #4]
	sub r3, r3, #1
	str r3, [sp, #8]
	ldrsh fp, [r1, #6]
	ldrsh r3, [r1, #0x20]
	sub r1, fp, #1
	bl CreateHallway
_0233E6A0:
	mov r0, #0
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x35]
	mov r0, #1
	strb r0, [r5, #0xb]
	strb r0, [r5, #0x29]
_0233E6B8:
	ldrb r0, [r5, #0x19]
	cmp r0, #0
	beq _0233E750
	ldrb r0, [r5, #-0x1ba]
	cmp r0, #0
	bne _0233E738
	ldrb r0, [r5, #-0x1b8]
	cmp r0, #0
	sub r0, r5, #0x100
	ldreqsh r3, [r0, #-0xc0]
	beq _0233E6FC
	ldrsh r1, [r0, #-0xbc]
	ldrsh r2, [r0, #-0xc0]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233E6FC:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	mul r0, r7, r0
	ldr fp, [sb, r6, lsl #2]
	add r1, r4, r0
	str fp, [sp, #4]
	ldr fp, [r8, r7, lsl #2]
	sub r2, r1, #0x100
	str fp, [sp, #8]
	ldrsh r2, [r2, #-0xc2]
	ldrsh r0, [r4, r0]
	mov r1, sl
	sub r2, r2, #1
	bl CreateHallway
_0233E738:
	mov r0, #0
	strb r0, [r5, #0x19]
	strb r0, [r5, #-0x1a8]
	mov r0, #1
	strb r0, [r5, #0xb]
	strb r0, [r5, #-0x1b7]
_0233E750:
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	beq _0233E7EC
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	bne _0233E7D4
	ldrb r0, [r5, #0x1cc]
	cmp r0, #0
	add r0, r5, #0x100
	ldreqsh r3, [r0, #0xc4]
	beq _0233E794
	ldrsh r1, [r0, #0xc8]
	ldrsh r2, [r0, #0xc4]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233E794:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	ldr r2, [sp, #0x2c]
	mov r1, sl
	ldr sl, [r2, #4]
	mla r0, r7, r0, r4
	sub sl, sl, #1
	str sl, [sp, #4]
	ldr sl, [r8, r7, lsl #2]
	add r2, r0, #0x100
	str sl, [sp, #8]
	ldrsh r0, [r0, #4]
	ldrsh r2, [r2, #0xc2]
	sub r0, r0, #1
	bl CreateHallway
_0233E7D4:
	mov r0, #0
	strb r0, [r5, #0x1a]
	strb r0, [r5, #0x1db]
	mov r0, #1
	strb r0, [r5, #0xb]
	strb r0, [r5, #0x1cd]
_0233E7EC:
	add r7, r7, #1
_0233E7F0:
	ldr r0, [sp, #0x14]
	cmp r7, r0
	blt _0233E540
	add r6, r6, #1
_0233E800:
	ldr r0, [sp, #0x10]
	cmp r6, r0
	blt _0233E524
	ldrb r0, [sp, #0x74]
	cmp r0, #0
	bne _0233ED28
	mov r7, #0
	b _0233ED1C
_0233E820:
	ldr r1, _0233ED30 ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov r8, #0
	mla r0, r7, r1, r0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	sub r0, r0, #2
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x10]
	sub r0, r0, #2
	str r0, [sp, #0x38]
	b _0233ED0C
_0233E850:
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #5
	bge _0233ED08
	ldr r0, [sp, #0x20]
	mov r1, #0x1e
	mla r6, r8, r1, r0
	ldrb r0, [r6, #8]
	cmp r0, #0
	bne _0233ED08
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #0x12]
	cmp r0, #0
	ldreqb r0, [r6, #9]
	cmpeq r0, #0
	bne _0233ED08
	ldrb r0, [r6, #0xa]
	cmp r0, #0
	beq _0233ED08
	mov r0, #4
	bl DungeonRandInt
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233ED08
_0233E8B8: ; jump table
	b _0233E8C8 ; case 0
	b _0233E9DC ; case 1
	b _0233EAE4 ; case 2
	b _0233EBFC ; case 3
_0233E8C8:
	cmp r7, #1
	blt _0233ED08
	ldrb r0, [r6, #-0x1b7]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #-0x1ba]
	cmp r0, #0
	bne _0233ED08
	ldrb r0, [r6, #-0x1b8]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #-0x1b9]
	cmp r0, #0
	ldreqb r0, [r6, #-0x1b0]
	cmpeq r0, #0
	bne _0233ED08
	sub r1, r6, #0x100
	ldrsh r0, [r1, #-0xc2]
	ldrsh fp, [r1, #-0xc0]
	ldrsh r1, [r6, #2]
	str r0, [sp, #0x28]
	sub r0, r6, #0x100
	ldrsh sb, [r0, #-0xbc]
	ldrsh r2, [r6, #6]
	cmp fp, r1
	movge fp, r1
	cmp sb, r2
	ldrsh r0, [r6]
	ldrsh sl, [r6, #4]
	movle sb, r2
	bl GetTile
	ldrb r0, [r0, #7]
	ldr r5, [sp, #0x28]
	and r0, r0, #0xff
	str r0, [sp, #0x30]
	b _0233E99C
_0233E958:
	mov r4, fp
	b _0233E990
_0233E960:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x30]
	strb r1, [r0, #7]
_0233E990:
	cmp r4, sb
	blt _0233E960
	add r5, r5, #1
_0233E99C:
	cmp r5, sl
	blt _0233E958
	ldr r0, [sp, #0x28]
	sub r1, r6, #0x100
	strh r0, [r1, #-0xc2]
	strh sl, [r1, #-0xbe]
	strh fp, [r1, #-0xc0]
	strh sb, [r1, #-0xbc]
	mov r0, #1
	strb r0, [r6, #0x12]
	strb r0, [r6, #-0x1b0]
	mov r0, #0
	strb r0, [r6, #0xb]
	mov r0, #1
	strb r0, [r6, #0x11]
	b _0233ED08
_0233E9DC:
	cmp r8, #1
	blt _0233ED08
	ldrb r0, [r6, #-0x13]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #-0x16]
	cmp r0, #0
	bne _0233ED08
	ldrb r0, [r6, #-0x14]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #-0x15]
	cmp r0, #0
	ldreqb r0, [r6, #-0xc]
	cmpeq r0, #0
	bne _0233ED08
	ldrsh r1, [r6, #-0x1c]
	ldrsh r0, [r6]
	ldrsh fp, [r6, #-0x1e]
	str r1, [sp, #0x24]
	ldrsh r1, [r6, #4]
	ldrsh sb, [r6, #-0x1a]
	cmp fp, r0
	movge fp, r0
	cmp sb, r1
	movle sb, r1
	ldrsh r1, [r6, #2]
	ldrsh sl, [r6, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	mov r5, fp
	and r0, r0, #0xff
	str r0, [sp, #0x34]
	b _0233EAA8
_0233EA64:
	ldr r4, [sp, #0x24]
	b _0233EA9C
_0233EA6C:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x34]
	strb r1, [r0, #7]
_0233EA9C:
	cmp r4, sl
	blt _0233EA6C
	add r5, r5, #1
_0233EAA8:
	cmp r5, sb
	blt _0233EA64
	strh fp, [r6, #-0x1e]
	ldr r0, [sp, #0x24]
	strh sb, [r6, #-0x1a]
	strh r0, [r6, #-0x1c]
	strh sl, [r6, #-0x18]
	mov r0, #1
	strb r0, [r6, #0x12]
	strb r0, [r6, #-0xc]
	mov r0, #0
	strb r0, [r6, #0xb]
	mov r0, #1
	strb r0, [r6, #0x11]
	b _0233ED08
_0233EAE4:
	ldr r0, [sp, #0x38]
	cmp r7, r0
	bgt _0233ED08
	ldrb r0, [r6, #0x1cd]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #0x1ca]
	cmp r0, #0
	bne _0233ED08
	ldrb r0, [r6, #0x1cc]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #0x1cb]
	cmp r0, #0
	ldreqb r0, [r6, #0x1d4]
	cmpeq r0, #0
	bne _0233ED08
	add r0, r6, #0x100
	ldrsh sl, [r6]
	ldrsh r0, [r0, #0xc4]
	str r0, [sp, #0x1c]
	ldrsh r1, [r6, #2]
	mov r0, r0
	cmp r1, r0
	strlt r1, [sp, #0x1c]
	add r0, r6, #0x100
	ldrsh fp, [r0, #0xc6]
	ldrsh r0, [r0, #0xc8]
	ldrsh sb, [r6, #6]
	cmp sb, r0
	movle sb, r0
	mov r0, sl
	bl GetTile
	ldrb r0, [r0, #7]
	mov r5, sl
	and r0, r0, #0xff
	str r0, [sp, #0x3c]
	b _0233EBC0
_0233EB7C:
	ldr r4, [sp, #0x1c]
	b _0233EBB4
_0233EB84:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x3c]
	strb r1, [r0, #7]
_0233EBB4:
	cmp r4, sb
	blt _0233EB84
	add r5, r5, #1
_0233EBC0:
	cmp r5, fp
	blt _0233EB7C
	strh sl, [r6]
	strh fp, [r6, #4]
	ldr r0, [sp, #0x1c]
	strh r0, [r6, #2]
	strh sb, [r6, #6]
	mov r0, #1
	strb r0, [r6, #0x1d4]
	strb r0, [r6, #0x12]
	mov r0, #0
	strb r0, [r6, #0x1cd]
	mov r0, #1
	strb r0, [r6, #0x1d3]
	b _0233ED08
_0233EBFC:
	ldr r0, [sp, #0x40]
	cmp r8, r0
	bgt _0233ED08
	ldrb r0, [r6, #0x29]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #0x26]
	cmp r0, #0
	bne _0233ED08
	ldrb r0, [r6, #0x28]
	cmp r0, #0
	beq _0233ED08
	ldrb r0, [r6, #0x27]
	cmp r0, #0
	ldreqb r0, [r6, #0x30]
	cmpeq r0, #0
	bne _0233ED08
	ldrsh r0, [r6, #0x1e]
	str r0, [sp, #0x18]
	ldrsh r0, [r6]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	strlt r0, [sp, #0x18]
	ldrsh sl, [r6, #2]
	ldrsh r1, [r6, #0x22]
	ldrsh sb, [r6, #4]
	ldrsh fp, [r6, #0x24]
	cmp sb, r1
	movle sb, r1
	mov r1, sl
	bl GetTile
	ldrb r0, [r0, #7]
	ldr r5, [sp, #0x18]
	and r0, r0, #0xff
	str r0, [sp, #0x44]
	b _0233ECD0
_0233EC8C:
	mov r4, sl
	b _0233ECC4
_0233EC94:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x44]
	strb r1, [r0, #7]
_0233ECC4:
	cmp r4, fp
	blt _0233EC94
	add r5, r5, #1
_0233ECD0:
	cmp r5, sb
	blt _0233EC8C
	ldr r0, [sp, #0x18]
	strh r0, [r6]
	strh sb, [r6, #4]
	strh sl, [r6, #2]
	strh fp, [r6, #6]
	mov r0, #1
	strb r0, [r6, #0x30]
	strb r0, [r6, #0x12]
	mov r0, #0
	strb r0, [r6, #0x29]
	mov r0, #1
	strb r0, [r6, #0x2f]
_0233ED08:
	add r8, r8, #1
_0233ED0C:
	ldr r0, [sp, #0x14]
	cmp r8, r0
	blt _0233E850
	add r7, r7, #1
_0233ED1C:
	ldr r0, [sp, #0x10]
	cmp r7, r0
	blt _0233E820
_0233ED28:
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233ED30: .word 0x000001C2
	arm_func_end CreateGridCellConnections

	arm_func_start GenerateRoomImperfections
GenerateRoomImperfections: ; 0x0233ED34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov fp, #0
	b _0233F100
_0233ED50:
	ldr r1, _0233F114 ; =0x000001C2
	ldr r0, [sp]
	mov sl, #0
	mla r0, fp, r1, r0
	str r0, [sp, #0xc]
	mvn r0, #0
	str r0, [sp, #0x30]
	b _0233F0F0
_0233ED70:
	ldr r0, [sp, #0xc]
	mov r1, #0x1e
	mla sb, sl, r1, r0
	ldrb r0, [sb, #8]
	cmp r0, #0
	ldreqb r0, [sb, #0x11]
	cmpeq r0, #0
	ldreqb r0, [sb, #0x12]
	cmpeq r0, #0
	bne _0233F0EC
	ldrb r0, [sb, #0xb]
	cmp r0, #0
	ldrneb r0, [sb, #0xa]
	cmpne r0, #0
	beq _0233F0EC
	ldrb r0, [sb, #9]
	cmp r0, #0
	ldreqb r0, [sb, #0x10]
	cmpeq r0, #0
	bne _0233F0EC
	ldrb r0, [sb, #0x1c]
	cmp r0, #0
	beq _0233F0EC
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x3c
	blt _0233F0EC
	ldrsh r3, [sb, #4]
	ldrsh r2, [sb]
	ldrsh r1, [sb, #6]
	ldrsh r0, [sb, #2]
	sub r2, r3, r2
	sub r0, r1, r0
	add r1, r2, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	movs r0, r0, asr #2
	str r0, [sp, #0x24]
	moveq r0, #1
	streq r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x2c]
	b _0233F0DC
_0233EE1C:
	mov r4, #0
_0233EE20:
	mov r0, #4
	bl DungeonRandInt
	str r0, [sp, #0x20]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233EE48
_0233EE38: ; jump table
	b _0233EE48 ; case 0
	b _0233EE70 ; case 1
	b _0233EE9C ; case 2
	b _0233EECC ; case 3
_0233EE48:
	cmp r4, #0
	movne r0, #1
	strne r0, [sp, #0x28]
	movne r5, #0
	moveq r0, #0
	ldrsh r8, [sb]
	ldrsh r7, [sb, #2]
	streq r0, [sp, #0x28]
	moveq r5, #1
	b _0233EEF4
_0233EE70:
	ldrsh r0, [sb, #4]
	cmp r4, #0
	movne r5, #1
	sub r8, r0, #1
	movne r0, #0
	strne r0, [sp, #0x28]
	ldreq r0, [sp, #0x30]
	ldrsh r7, [sb, #2]
	streq r0, [sp, #0x28]
	moveq r5, #0
	b _0233EEF4
_0233EE9C:
	ldrsh r0, [sb, #6]
	cmp r4, #0
	ldrsh r1, [sb, #4]
	sub r7, r0, #1
	ldrne r0, [sp, #0x30]
	movne r5, #0
	strne r0, [sp, #0x28]
	moveq r0, #0
	sub r8, r1, #1
	streq r0, [sp, #0x28]
	ldreq r5, [sp, #0x30]
	b _0233EEF4
_0233EECC:
	ldrsh r0, [sb, #6]
	cmp r4, #0
	ldrne r5, [sp, #0x30]
	sub r7, r0, #1
	movne r0, #0
	strne r0, [sp, #0x28]
	moveq r0, #1
	ldrsh r8, [sb]
	streq r0, [sp, #0x28]
	moveq r5, #0
_0233EEF4:
	mov r6, #0
	b _0233F0BC
_0233EEFC:
	ldrsh r0, [sb]
	cmp r8, r0
	blt _0233F0C4
	ldrsh r0, [sb, #4]
	cmp r8, r0
	bge _0233F0C4
	ldrsh r0, [sb, #2]
	cmp r7, r0
	blt _0233F0C4
	ldrsh r0, [sb, #6]
	cmp r7, r0
	bge _0233F0C4
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233F0AC
	mov r5, #0
	b _0233F014
_0233EF50:
	ldr r0, _0233F118 ; =DIRECTIONS_XY
	mov r1, r5, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r5, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r7, r1
	str r0, [sp, #0x18]
	ldr r6, [sp, #0x30]
	b _0233EFFC
_0233EF84:
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x14]
	b _0233EFE0
_0233EF90:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	ldr r1, [sp, #0x18]
	add r1, r1, r6
	bl GetTile
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	bne _0233EFD4
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	moveq r0, #1
	streq r0, [sp, #0x10]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233EFEC
_0233EFD4:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
_0233EFE0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _0233EF90
_0233EFEC:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233F004
	add r6, r6, #1
_0233EFFC:
	cmp r6, #1
	ble _0233EF84
_0233F004:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233F01C
	add r5, r5, #1
_0233F014:
	cmp r5, #8
	blt _0233EF50
_0233F01C:
	cmp r5, #8
	bne _0233F0C4
	ldr r1, _0233F11C ; =CORNER_CARDINAL_NEIGHBOR_IS_OPEN
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r6, r1, r0, lsl #3
	b _0233F080
_0233F038:
	ldr r0, _0233F118 ; =DIRECTIONS_XY
	mov r1, r5, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r5, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r1, r0, #0xff
	ldrb r0, [r5, r6]
	cmp r1, r0
	bne _0233F088
	add r5, r5, #2
_0233F080:
	cmp r5, #8
	blt _0233F038
_0233F088:
	cmp r5, #8
	bne _0233F0C4
	mov r0, r8
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	b _0233F0C4
_0233F0AC:
	ldr r0, [sp, #0x28]
	add r7, r7, r5
	add r8, r8, r0
	add r6, r6, #1
_0233F0BC:
	cmp r6, #0xa
	blt _0233EEFC
_0233F0C4:
	add r4, r4, #1
	cmp r4, #2
	blt _0233EE20
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
_0233F0DC:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	blt _0233EE1C
_0233F0EC:
	add sl, sl, #1
_0233F0F0:
	ldr r0, [sp, #8]
	cmp sl, r0
	blt _0233ED70
	add fp, fp, #1
_0233F100:
	ldr r0, [sp, #4]
	cmp fp, r0
	blt _0233ED50
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233F114: .word 0x000001C2
_0233F118: .word DIRECTIONS_XY
_0233F11C: .word CORNER_CARDINAL_NEIGHBOR_IS_OPEN
	arm_func_end GenerateRoomImperfections

	arm_func_start CreateHallway
CreateHallway: ; 0x0233F120
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r6, [sp, #0x28]
	mov sl, r0
	ldr r0, [sp, #0x30]
	mov sb, r1
	cmp r6, #0
	mov r8, r2
	mov r7, r3
	mov r4, sl
	mov r5, sb
	ldr fp, [sp, #0x2c]
	str r0, [sp, #0x30]
	mov r6, #0
	beq _0233F328
	b _0233F1C4
_0233F15C:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F1AC
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F1B4
_0233F1AC:
	cmp sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F1B4:
	ldr r0, [sp, #0x30]
	cmp sb, r0
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F1C4:
	ldr r0, [sp, #0x30]
	cmp sb, r0
	bne _0233F15C
	mov r6, #0
	b _0233F240
_0233F1D8:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F228
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F234
_0233F228:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F234:
	cmp sl, r8
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F240:
	cmp sl, r8
	bne _0233F1D8
	mov r6, #0
	b _0233F2B8
_0233F250:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F2A0
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F2AC
_0233F2A0:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F2AC:
	cmp sb, r7
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F2B8:
	cmp sb, r7
	bne _0233F250
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F2C4:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F314
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F31C
_0233F314:
	cmp sl, r4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F31C:
	cmp sl, fp
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F328:
	cmp sl, fp
	bne _0233F2C4
	mov r6, #0
	b _0233F3A0
_0233F338:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F388
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F394
_0233F388:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F394:
	cmp sb, r7
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F3A0:
	cmp sb, r7
	bne _0233F338
	mov r6, #0
	b _0233F418
_0233F3B0:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F400
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F40C
_0233F400:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F40C:
	cmp sl, r8
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F418:
	cmp sl, r8
	bne _0233F3B0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end CreateHallway

	arm_func_start EnsureConnectedGrid
EnsureConnectedGrid: ; 0x0233F424
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	str r0, [sp, #0xc]
	mov r7, r1
	mov fp, r2
	mov r6, r3
	ldr r5, [sp, #0x50]
	mov r8, #0
	b _0233F818
_0233F448:
	ldr r1, _0233F8FC ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov r4, #0
	mla sb, r8, r1, r0
	sub r0, fp, #1
	str r0, [sp, #0x20]
	add r0, r6, r8, lsl #2
	str r0, [sp, #0x28]
	sub r0, r7, #1
	str r0, [sp, #0x24]
	b _0233F80C
_0233F474:
	mov r0, #0x1e
	mla sl, r4, r0, sb
	ldrb r0, [sl, #8]
	cmp r0, #0
	ldreqb r0, [sl, #0x11]
	cmpeq r0, #0
	ldreqb r0, [sl, #0xb]
	cmpeq r0, #0
	bne _0233F808
	ldrb r0, [sl, #0xa]
	cmp r0, #0
	beq _0233F7CC
	ldrb r0, [sl, #9]
	cmp r0, #0
	bne _0233F7CC
	ldrsh r0, [sl]
	ldrsh r1, [sl, #4]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x1c]
	ldrsh r0, [sl, #2]
	ldrsh r1, [sl, #6]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x18]
	cmp r4, #0
	ble _0233F590
	ldrb r0, [sl, #-0x16]
	cmp r0, #0
	ldreqb r0, [sl, #-0xc]
	cmpeq r0, #0
	bne _0233F590
	ldrb r0, [sl, #-0x13]
	cmp r0, #0
	beq _0233F590
	ldrb r0, [sl, #-0x14]
	cmp r0, #0
	ldrsh r0, [sl, #-0x1e]
	streq r0, [sp, #0x14]
	beq _0233F544
	ldrsh r1, [sl, #-0x1a]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x14]
	ldrsh r0, [sl, #-0x1c]
	ldrsh r1, [sl, #-0x18]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
_0233F544:
	mov r1, #1
	str r1, [sp]
	mov r1, #0x1e
	mla sl, r4, r1, sb
	ldr r1, [r6, r8, lsl #2]
	ldr r0, [sp, #0x1c]
	str r1, [sp, #4]
	ldr r1, [r5, r4, lsl #2]
	ldr r2, [sp, #0x14]
	str r1, [sp, #8]
	ldrsh r3, [sl, #-0x18]
	ldrsh r1, [sl, #2]
	sub r3, r3, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x13]
	strb r0, [sl, #-0xa]
	b _0233F808
_0233F590:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _0233F64C
	ldrb r0, [sl, #0x26]
	cmp r0, #0
	ldreqb r0, [sl, #0x30]
	cmpeq r0, #0
	bne _0233F64C
	ldrb r0, [sl, #0x29]
	cmp r0, #0
	beq _0233F64C
	ldrb r0, [sl, #0x28]
	cmp r0, #0
	ldrsh r0, [sl, #0x1e]
	streq r0, [sp, #0x10]
	beq _0233F5F8
	ldrsh r1, [sl, #0x22]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x10]
	ldrsh r0, [sl, #0x20]
	ldrsh r1, [sl, #0x24]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
_0233F5F8:
	mov r1, #1
	str r1, [sp]
	mov r1, #0x1e
	mla sl, r4, r1, sb
	ldr r3, [r6, r8, lsl #2]
	add r1, r5, r4, lsl #2
	str r3, [sp, #4]
	ldr r1, [r1, #4]
	ldr r0, [sp, #0x1c]
	sub r1, r1, #1
	str r1, [sp, #8]
	ldrsh r1, [sl, #6]
	ldrsh r3, [sl, #0x20]
	ldr r2, [sp, #0x10]
	sub r1, r1, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x14]
	strb r0, [sl, #0x31]
	b _0233F808
_0233F64C:
	cmp r8, #0
	ble _0233F708
	ldrb r0, [sl, #-0x1ba]
	cmp r0, #0
	ldreqb r0, [sl, #-0x1b0]
	cmpeq r0, #0
	bne _0233F708
	ldrb r0, [sl, #-0x1b7]
	cmp r0, #0
	beq _0233F708
	ldrb r0, [sl, #-0x1b8]
	cmp r0, #0
	sub r0, sl, #0x100
	ldreqsh r3, [r0, #-0xc0]
	beq _0233F6B8
	ldrsh r1, [r0, #-0xbe]
	ldrsh r2, [r0, #-0xc2]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	sub r0, sl, #0x100
	ldrsh r1, [r0, #-0xbc]
	ldrsh r2, [r0, #-0xc0]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233F6B8:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	mul r0, r4, r0
	ldr ip, [r6, r8, lsl #2]
	add sl, sb, r0
	str ip, [sp, #4]
	ldr ip, [r5, r4, lsl #2]
	sub r2, sl, #0x100
	str ip, [sp, #8]
	ldrsh r2, [r2, #-0xc2]
	ldrsh r0, [sb, r0]
	ldr r1, [sp, #0x18]
	sub r2, r2, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x15]
	strb r0, [sl, #-0x1ac]
	b _0233F808
_0233F708:
	ldr r0, [sp, #0x24]
	cmp r8, r0
	bge _0233F808
	ldrb r0, [sl, #0x1ca]
	cmp r0, #0
	ldreqb r0, [sl, #0x1d4]
	cmpeq r0, #0
	bne _0233F808
	ldrb r0, [sl, #0x1cd]
	cmp r0, #0
	beq _0233F808
	ldrb r0, [sl, #0x1cc]
	cmp r0, #0
	add r0, sl, #0x100
	ldreqsh r3, [r0, #0xc4]
	beq _0233F778
	ldrsh r1, [r0, #0xc6]
	ldrsh r2, [r0, #0xc2]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	add r0, sl, #0x100
	ldrsh r1, [r0, #0xc8]
	ldrsh r2, [r0, #0xc4]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233F778:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	mla sl, r4, r0, sb
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	ldr r2, [r0, #4]
	add r0, sl, #0x100
	sub r2, r2, #1
	str r2, [sp, #4]
	ldr r2, [r5, r4, lsl #2]
	str r2, [sp, #8]
	ldrsh r2, [r0, #0xc2]
	ldrsh r0, [sl, #4]
	sub r0, r0, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x16]
	strb r0, [sl, #0x1d7]
	b _0233F808
_0233F7CC:
	ldrsh r0, [sl]
	ldrsh r1, [sl, #2]
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #2
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_0233F808:
	add r4, r4, #1
_0233F80C:
	cmp r4, fp
	blt _0233F474
	add r8, r8, #1
_0233F818:
	cmp r8, r7
	blt _0233F448
	mov r8, #0
	b _0233F8EC
_0233F828:
	ldr r1, _0233F8FC ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov sb, #0
	mla sl, r8, r1, r0
	b _0233F8E0
_0233F83C:
	mov r0, #0x1e
	mla r5, sb, r0, sl
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldreqb r0, [r5, #0x11]
	cmpeq r0, #0
	ldreqb r0, [r5, #0xb]
	cmpeq r0, #0
	ldreqb r0, [r5, #0xf]
	cmpeq r0, #0
	bne _0233F8DC
	ldrsh r6, [r5]
	b _0233F8D0
_0233F870:
	ldrsh r4, [r5, #2]
	b _0233F8C0
_0233F878:
	mov r0, r6
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #2
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #7]
_0233F8C0:
	ldrsh r0, [r5, #6]
	cmp r4, r0
	blt _0233F878
	add r6, r6, #1
_0233F8D0:
	ldrsh r0, [r5, #4]
	cmp r6, r0
	blt _0233F870
_0233F8DC:
	add sb, sb, #1
_0233F8E0:
	cmp sb, fp
	blt _0233F83C
	add r8, r8, #1
_0233F8EC:
	cmp r8, r7
	blt _0233F828
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233F8FC: .word 0x000001C2
	arm_func_end EnsureConnectedGrid

	arm_func_start SetTerrainObstacleChecked
SetTerrainObstacleChecked: ; 0x0233F900
	ldrh r3, [r0]
	cmp r1, #0
	bic r1, r3, #3
	strh r1, [r0]
	bxeq lr
	ldrb r1, [r0, #7]
	cmp r1, r2
	bxne lr
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	bx lr
	arm_func_end SetTerrainObstacleChecked

	arm_func_start FinalizeJunctions
FinalizeJunctions: ; 0x0233F93C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
_0233F944:
	sub r5, r4, #1
	mov r6, #0
	mov r7, #0xff
_0233F950:
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233FAFC
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	bne _0233FAD4
	cmp r4, #0
	ble _0233F9D4
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233F9D4
	ldrh r1, [r0]
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233F9D4
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233F9D4:
	cmp r6, #0
	ble _0233FA28
	mov r0, r4
	sub r1, r6, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FA28
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FA28
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233FA28:
	cmp r6, #0x1f
	bge _0233FA7C
	mov r0, r4
	add r1, r6, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FA7C
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FA7C
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233FA7C:
	cmp r4, #0x37
	bge _0233FAFC
	mov r1, r6
	add r0, r4, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FAFC
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FAFC
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233FAFC
_0233FAD4:
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xfe
	bne _0233FAFC
	mov r0, r4
	mov r1, r6
	bl GetTileSafe
	strb r7, [r0, #7]
_0233FAFC:
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233F950
	add r4, r4, #1
	cmp r4, #0x38
	blt _0233F944
	bl ov29_0233FB1C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FinalizeJunctions

	arm_func_start ov29_0233FB1C
ov29_0233FB1C: ; 0x0233FB1C
#ifdef JAPAN
#define OV29_0233FB1C_OFFSET 0x5C
#else
#define OV29_0233FB1C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0233FBE4 ; =DUNGEON_PTR
	mov r1, #0
	ldr r6, [r0]
	mov r7, r1
_0233FB30:
	add r0, r6, r1, lsl #1
#ifdef JAPAN
	add r0, r0, #0xf100
#else
	add r0, r0, #0xf200
#endif
	add r1, r1, #1
	strh r7, [r0, #0x68 + OV29_0233FB1C_OFFSET]
	cmp r1, #0x20
	blt _0233FB30
_0233FB48:
	mov r0, r7, lsl #0x10
	mov r5, #0
	mov r4, r0, asr #0x10
_0233FB54:
	mov r0, r7
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #8
	beq _0233FBC8
	mov r0, r7
	mov r1, r5
	bl GetTile
	ldrb r2, [r0, #7]
	cmp r2, #0
	blt _0233FBC8
	cmp r2, #0x20
	addlt r0, r6, r2, lsl #1
#ifdef JAPAN
	addlt r1, r0, #0xf100
#else
	addlt r1, r0, #0xf200
#endif
	ldrltsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	cmplt r0, #0x20
	bge _0233FBC8
	add r2, r6, r2, lsl #7
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf200
#ifdef JAPAN
	strh r4, [r0, #4]
#else
	strh r4, [r0, #0xa8]
#endif
	ldrsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf200
#ifdef JAPAN
	strh r5, [r0, #6]
#else
	strh r5, [r0, #0xaa]
#endif
	ldrsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	add r0, r0, #1
	strh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
_0233FBC8:
	add r5, r5, #1
	cmp r5, #0x20
	blt _0233FB54
	add r7, r7, #1
	cmp r7, #0x38
	blt _0233FB48
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233FBE4: .word DUNGEON_PTR
	arm_func_end ov29_0233FB1C

	arm_func_start GenerateKecleonShop
GenerateKecleonShop: ; 0x0233FBE8
#ifdef JAPAN
#define GENERATE_KECLEON_SHOP_OFFSET -0xA4
#else
#define GENERATE_KECLEON_SHOP_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r5, _0233FF8C ; =DUNGEON_PTR
	ldr r4, _0233FF90 ; =FLOOR_GENERATION_STATUS
	mvn r7, #0
	ldr r6, [r5]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	ldrb r4, [r4, #1]
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	mov r5, r3
	cmp r4, #0
	bne _0233FF84
	bl GetFloorType
	cmp r0, #2
	cmpne r5, #0
	beq _0233FF84
	mov r0, #0x64
	bl DungeonRandInt
	cmp r5, r0
	ble _0233FF84
	mov r4, #0
	add r2, sp, #0x26
	add r1, sp, #8
_0233FC50:
	mov r0, r4, lsl #0x10
	mov r3, r4, lsl #1
	mov r0, r0, asr #0x10
	add r4, r4, #1
	strh r0, [r2, r3]
	strh r0, [r1, r3]
	cmp r4, #0xf
	blt _0233FC50
	mov r7, #0xf
	mov r8, #0
	mov r5, r7
	add r4, sp, #0x26
_0233FC80:
	mov r0, r7
	bl DungeonRandInt
	mov sb, r0
	mov r0, r5
	bl DungeonRandInt
	mov r3, sb, lsl #1
	mov r1, r0, lsl #1
	add r8, r8, #1
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	cmp r8, #0xc8
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	blt _0233FC80
	mov r7, #0xf
	mov r8, #0
	mov r5, r7
	add r4, sp, #8
_0233FCC8:
	mov r0, r7
	bl DungeonRandInt
	mov sb, r0
	mov r0, r5
	bl DungeonRandInt
	mov r3, sb, lsl #1
	mov r1, r0, lsl #1
	add r8, r8, #1
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	cmp r8, #0xc8
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	blt _0233FCC8
	mov r4, #0
	b _0233FF7C
_0233FD08:
	add r0, sp, #0x26
	mov r1, r4, lsl #1
	ldrsh r1, [r0, r1]
	ldr r0, [sp]
	cmp r1, r0
	bge _0233FF78
	ldr r0, _0233FF94 ; =0x000001C2
	mov r5, #0
	mul fp, r1, r0
	add sb, sl, fp
	b _0233FF70
_0233FD34:
	mov r1, r5, lsl #1
	add r0, sp, #8
	ldrsh r1, [r0, r1]
	ldr r0, [sp, #4]
	cmp r1, r0
	bge _0233FF6C
	mov r0, #0x1e
	mul r7, r1, r0
	add r8, sb, r7
	ldrb r0, [r8, #8]
	cmp r0, #0
	ldreqb r0, [r8, #0x11]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x12]
	cmpeq r0, #0
	bne _0233FF6C
	ldrb r0, [r8, #0xb]
	cmp r0, #0
	ldrneb r0, [r8, #0xa]
	cmpne r0, #0
	beq _0233FF6C
	ldrb r0, [r8, #9]
	cmp r0, #0
	ldreqb r0, [r8, #0x10]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x1d]
	cmpeq r0, #0
	bne _0233FF6C
	ldrsh r1, [r8, #4]
	ldrsh r0, [r8]
	sub r0, r1, r0
	bl abs
	cmp r0, #5
	blt _0233FF6C
	ldrsh r1, [r8, #6]
	ldrsh r0, [r8, #2]
	sub r0, r1, r0
	bl abs
	cmp r0, #4
	blt _0233FF6C
	ldr r0, _0233FF90 ; =FLOOR_GENERATION_STATUS
	add r1, sl, fp
	mov r3, #1
	strb r3, [r0, #3]
	add r2, r1, r7
	strb r3, [r2, #0xc]
	ldrsh r1, [sb, r7]
	add r1, r1, #1
	str r1, [r0, #0x30]
	ldrsh r1, [r2, #4]
	sub r1, r1, #1
	str r1, [r0, #0x38]
	ldrsh r1, [r2, #2]
	add r3, r1, #1
	str r3, [r0, #0x34]
	ldrsh r1, [r2, #6]
	sub r2, r1, #1
	sub r1, r2, r3
	cmp r1, #3
	str r2, [r0, #0x3c]
	addlt r1, r2, #1
	strlt r1, [r0, #0x3c]
	ldr r1, _0233FF98 ; =0x0000270F
	add r0, r6, #0xc000
	str r1, [r0, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	str r1, [r0, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	rsb r2, r1, #0
	str r2, [r0, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r1, _0233FF90 ; =FLOOR_GENERATION_STATUS
	str r2, [r0, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r4, [r1, #0x30]
	b _0233FED8
_0233FE54:
	ldr sl, _0233FF90 ; =FLOOR_GENERATION_STATUS
	add r8, r6, #0xc000
	ldr r5, [sl, #0x34]
	b _0233FEC8
_0233FE64:
	mov r0, r4
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x20
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #8
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldr r0, [r8, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r4
	strgt r4, [r8, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r5
	strgt r5, [r8, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r4
	strlt r4, [r8, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r5
	strlt r5, [r8, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	add r5, r5, #1
_0233FEC8:
	ldr r0, [sl, #0x3c]
	cmp r5, r0
	blt _0233FE64
	add r4, r4, #1
_0233FED8:
	ldr r0, _0233FF90 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x38]
	cmp r4, r0
	blt _0233FE54
	add r4, sb, r7
	ldrsh r5, [sb, r7]
	b _0233FF28
_0233FEF4:
	ldrsh r6, [r4, #2]
	b _0233FF18
_0233FEFC:
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	orr r1, r1, #0x10
	strh r1, [r0, #2]
_0233FF18:
	ldrsh r0, [r4, #6]
	cmp r6, r0
	blt _0233FEFC
	add r5, r5, #1
_0233FF28:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233FEF4
	ldr r1, _0233FF90 ; =FLOOR_GENERATION_STATUS
	ldr r2, [r1, #0x30]
	ldr r0, [r1, #0x38]
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r1, #0x20]
	ldr r2, [r1, #0x34]
	ldr r0, [r1, #0x3c]
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r1, #0x22]
	b _0233FF84
_0233FF6C:
	add r5, r5, #1
_0233FF70:
	cmp r5, #0xf
	blt _0233FD34
_0233FF78:
	add r4, r4, #1
_0233FF7C:
	cmp r4, #0xf
	blt _0233FD08
_0233FF84:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233FF8C: .word DUNGEON_PTR
_0233FF90: .word FLOOR_GENERATION_STATUS
_0233FF94: .word 0x000001C2
_0233FF98: .word 0x0000270F
	arm_func_end GenerateKecleonShop

	arm_func_start GenerateMonsterHouse
GenerateMonsterHouse: ; 0x0233FF9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x100
	ldr r4, _02340218 ; =DUNGEON_PTR
	movs r5, r3
	mov sl, r0
	mov sb, r1
	mov r8, r2
	ldr r6, [r4]
	beq _02340210
	mov r0, #0x64
	bl DungeonRandInt
	cmp r5, r0
	ble _02340210
	ldr r0, _0234021C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #3]
	cmp r0, #0
	bne _02340210
	bl IsOutlawMonsterHouseFloor
	cmp r0, #0
	bne _0233FFF8
	bl IsDestinationFloorWithMonster
	cmp r0, #0
	bne _02340210
_0233FFF8:
	bl GetFloorType
	cmp r0, #0
	bne _02340210
	mov r5, #0
	mov r2, r5
	mov r1, r5
	b _02340088
_02340014:
	ldr r0, _02340220 ; =0x000001C2
	mov r3, r1
	mla r4, r2, r0, sl
	mov r7, #0x1e
	b _0234007C
_02340028:
	mla r0, r3, r7, r4
	ldrb fp, [r0, #8]
	cmp fp, #0
	ldreqb fp, [r0, #0x11]
	cmpeq fp, #0
	bne _02340078
	ldrb fp, [r0, #0xb]
	cmp fp, #0
	ldrneb fp, [r0, #0xa]
	cmpne fp, #0
	beq _02340078
	ldrb fp, [r0, #0xc]
	cmp fp, #0
	ldreqb fp, [r0, #0xf]
	cmpeq fp, #0
	ldreqb fp, [r0, #0x10]
	cmpeq fp, #0
	ldreqb r0, [r0, #9]
	cmpeq r0, #0
	addeq r5, r5, #1
_02340078:
	add r3, r3, #1
_0234007C:
	cmp r3, r8
	blt _02340028
	add r2, r2, #1
_02340088:
	cmp r2, sb
	blt _02340014
	cmp r5, #0
	beq _02340210
	mov r1, #0
	mov r7, r1
	add r0, sp, #0
_023400A4:
	strb r7, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x100
	blt _023400A4
	mov r0, #1
	strb r0, [sp]
	add fp, sp, #0
_023400C0:
	mov r0, r5
	bl DungeonRandInt
	mov r4, r0
	mov r0, r5
	bl DungeonRandInt
	add r7, r7, #1
	ldrb r2, [fp, r4]
	ldrb r1, [fp, r0]
	cmp r7, #0x40
	strb r1, [fp, r4]
	strb r2, [fp, r0]
	blt _023400C0
	mov r7, #0
	mov r4, r7
	add fp, sp, #0
	b _02340208
_02340100:
	ldr r0, _02340220 ; =0x000001C2
	mov r5, #0
	mul r3, r4, r0
	add r2, sl, r3
	mov lr, #0x1e
	b _023401FC
_02340118:
	mul r1, r5, lr
	add r0, r2, r1
	ldrb ip, [r0, #8]
	cmp ip, #0
	ldreqb ip, [r0, #0x11]
	cmpeq ip, #0
	bne _023401F8
	ldrb ip, [r0, #0xb]
	cmp ip, #0
	ldrneb ip, [r0, #0xa]
	cmpne ip, #0
	beq _023401F8
	ldrb ip, [r0, #0xc]
	cmp ip, #0
	ldreqb ip, [r0, #0xf]
	cmpeq ip, #0
	ldreqb ip, [r0, #0x10]
	cmpeq ip, #0
	ldreqb r0, [r0, #9]
	cmpeq r0, #0
	bne _023401F8
	ldrb r0, [fp, r7]
	cmp r0, #0
	beq _023401F4
	ldr r0, _0234021C ; =FLOOR_GENERATION_STATUS
	add r2, sl, r3
	mov r3, #1
	strb r3, [r0, #1]
	add r7, r2, r1
	strb r3, [r7, #0xe]
	ldrsh r5, [r2, r1]
	add r6, r6, #0x4000
	b _023401E4
_0234019C:
	ldrsh r4, [r7, #2]
	b _023401D4
_023401A4:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	orr r2, r2, #0x40
	strh r2, [r0]
	mov r0, r5
	bl GetTile
	ldrb r0, [r0, #7]
	add r4, r4, #1
#ifdef JAPAN
	strb r0, [r6, #0x25]
#else
	strb r0, [r6, #0xc9]
#endif
_023401D4:
	ldrsh r0, [r7, #6]
	cmp r4, r0
	blt _023401A4
	add r5, r5, #1
_023401E4:
	ldrsh r0, [r7, #4]
	cmp r5, r0
	blt _0234019C
	b _02340210
_023401F4:
	add r7, r7, #1
_023401F8:
	add r5, r5, #1
_023401FC:
	cmp r5, r8
	blt _02340118
	add r4, r4, #1
_02340208:
	cmp r4, sb
	blt _02340100
_02340210:
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02340218: .word DUNGEON_PTR
_0234021C: .word FLOOR_GENERATION_STATUS
_02340220: .word 0x000001C2
	arm_func_end GenerateMonsterHouse

	arm_func_start GenerateMazeRoom
GenerateMazeRoom: ; 0x02340224
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x100
	ldr r7, _02340450 ; =DUNGEON_PTR
	movs r8, r3
	mov r6, r0
	mov r5, r1
	mov r4, r2
	ldr r7, [r7]
	beq _02340448
	mov r0, #0x64
	bl DungeonRandInt
	cmp r8, r0
	ble _02340448
	add r0, r7, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x3a]
#else
	ldrsh r0, [r0, #0xde]
#endif
	cmp r0, #0
	bge _02340448
	mov sb, #0
	mov r1, sb
	b _02340310
_02340274:
	ldr r0, _02340454 ; =0x000001C2
	mov r2, #0
	mla r3, r1, r0, r6
	mov r7, #0x1e
	b _02340304
_02340288:
	mla r0, r2, r7, r3
	ldrb r8, [r0, #8]
	cmp r8, #0
	ldreqb r8, [r0, #0x11]
	cmpeq r8, #0
	bne _02340300
	ldrb r8, [r0, #0xb]
	cmp r8, #0
	ldrneb r8, [r0, #0xa]
	cmpne r8, #0
	beq _02340300
	ldrb r8, [r0, #0xc]
	cmp r8, #0
	ldreqb r8, [r0, #0xf]
	cmpeq r8, #0
	ldreqb r8, [r0, #0xe]
	cmpeq r8, #0
	ldreqb r8, [r0, #9]
	cmpeq r8, #0
	bne _02340300
	ldrsh sl, [r0, #4]
	ldrsh r8, [r0]
	sub r8, sl, r8
	tst r8, #1
	beq _02340300
	ldrsh r8, [r0, #6]
	ldrsh r0, [r0, #2]
	sub r0, r8, r0
	tst r0, #1
	addne sb, sb, #1
_02340300:
	add r2, r2, #1
_02340304:
	cmp r2, r4
	blt _02340288
	add r1, r1, #1
_02340310:
	cmp r1, r5
	blt _02340274
	cmp sb, #0
	beq _02340448
	mov r1, #0
	mov sl, r1
	add r0, sp, #0
_0234032C:
	strb sl, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x100
	blt _0234032C
	mov r0, #1
	strb r0, [sp]
	add r7, sp, #0
_02340348:
	mov r0, sb
	bl DungeonRandInt
	mov r8, r0
	mov r0, sb
	bl DungeonRandInt
	add sl, sl, #1
	ldrb r2, [r7, r8]
	ldrb r1, [r7, r0]
	cmp sl, #0x40
	strb r1, [r7, r8]
	strb r2, [r7, r0]
	blt _02340348
	mov r7, #0
	mov r2, r7
	b _02340440
_02340384:
	ldr r0, _02340454 ; =0x000001C2
	mov r3, #0
	mla r1, r2, r0, r6
	add sl, sp, #0
	mov r8, #0x1e
	b _02340434
_0234039C:
	mla r0, r3, r8, r1
	ldrb sb, [r0, #8]
	cmp sb, #0
	ldreqb sb, [r0, #0x11]
	cmpeq sb, #0
	bne _02340430
	ldrb sb, [r0, #0xb]
	cmp sb, #0
	ldrneb sb, [r0, #0xa]
	cmpne sb, #0
	beq _02340430
	ldrb sb, [r0, #0xc]
	cmp sb, #0
	ldreqb sb, [r0, #0xf]
	cmpeq sb, #0
	ldreqb sb, [r0, #0xe]
	cmpeq sb, #0
	ldreqb sb, [r0, #9]
	cmpeq sb, #0
	bne _02340430
	ldrsh ip, [r0, #4]
	ldrsh sb, [r0]
	sub sb, ip, sb
	tst sb, #1
	beq _02340430
	ldrsh ip, [r0, #6]
	ldrsh sb, [r0, #2]
	sub sb, ip, sb
	tst sb, #1
	beq _02340430
	ldrb sb, [sl, r7]
	cmp sb, #0
	beq _0234042C
	mov r1, #0
	bl GenerateMaze
	b _02340448
_0234042C:
	add r7, r7, #1
_02340430:
	add r3, r3, #1
_02340434:
	cmp r3, r4
	blt _0234039C
	add r2, r2, #1
_02340440:
	cmp r2, r5
	blt _02340384
_02340448:
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02340450: .word DUNGEON_PTR
_02340454: .word 0x000001C2
	arm_func_end GenerateMazeRoom

	arm_func_start GenerateMaze
GenerateMaze: ; 0x02340458
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r2, _023406D0 ; =FLOOR_GENERATION_STATUS
	mov r3, #1
	mov r5, r0
	strb r3, [r2, #7]
	strb r3, [r5, #0x10]
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTile
	ldrsh r1, [r5]
	ldrb r7, [r0, #7]
	add r6, r1, #1
	b _023404DC
_02340494:
	ldrsh r1, [r5, #2]
	mov r0, r6
	sub r1, r1, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023404D8
	ldrsh r3, [r5, #2]
	ldrsh r2, [r5, #4]
	mov r0, r6
	sub r1, r3, #1
	str r2, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	bl GenerateMazeLine
_023404D8:
	add r6, r6, #2
_023404DC:
	ldrsh r0, [r5, #4]
	sub r0, r0, #1
	cmp r6, r0
	blt _02340494
	ldrsh r0, [r5, #2]
	add r6, r0, #1
	b _02340538
_023404F8:
	ldrsh r0, [r5, #4]
	mov r1, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _02340534
	ldrsh r0, [r5, #4]
	mov r1, r6
	str r0, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_02340534:
	add r6, r6, #2
_02340538:
	ldrsh r0, [r5, #6]
	sub r0, r0, #1
	cmp r6, r0
	blt _023404F8
	ldrsh r0, [r5]
	add r6, r0, #1
	b _02340594
_02340554:
	ldrsh r1, [r5, #6]
	mov r0, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _02340590
	ldrsh r1, [r5, #6]
	ldrsh r2, [r5, #4]
	mov r0, r6
	str r2, [sp]
	stmib sp, {r1, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_02340590:
	add r6, r6, #2
_02340594:
	ldrsh r0, [r5, #4]
	sub r0, r0, #1
	cmp r6, r0
	blt _02340554
	ldrsh r0, [r5, #2]
	add r6, r0, #1
	b _023405F8
_023405B0:
	ldrsh r0, [r5]
	mov r1, r6
	sub r0, r0, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023405F4
	ldrsh r2, [r5]
	ldrsh r3, [r5, #4]
	mov r1, r6
	sub r0, r2, #1
	str r3, [sp]
	ldrsh r3, [r5, #6]
	stmib sp, {r3, r4, r7}
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_023405F4:
	add r6, r6, #2
_023405F8:
	ldrsh r0, [r5, #6]
	sub r0, r0, #1
	cmp r6, r0
	blt _023405B0
	ldrsh r0, [r5]
	add r8, r0, #3
	b _023406B8
_02340614:
	ldrsh r0, [r5, #2]
	sub r6, r8, #1
	add sb, r0, #3
	b _023406A4
_02340624:
	mov r0, r8
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _023406A0
	cmp r4, #0
	mov r0, r6
	mov r1, sb
	beq _0234066C
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	b _02340678
_0234066C:
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
_02340678:
	strh r1, [r0]
	ldrsh r2, [r5, #4]
	mov r0, r8
	mov r1, sb
	str r2, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_023406A0:
	add sb, sb, #2
_023406A4:
	ldrsh r0, [r5, #6]
	sub r0, r0, #3
	cmp sb, r0
	blt _02340624
	add r8, r8, #2
_023406B8:
	ldrsh r0, [r5, #4]
	sub r0, r0, #3
	cmp r8, r0
	blt _02340614
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023406D0: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateMaze

	arm_func_start GenerateMazeLine
GenerateMazeLine: ; 0x023406D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x34]
	ldr fp, [sp, #0x30]
	ldr r7, [sp, #0x38]
	ldr r6, [sp, #0x3c]
	str r4, [sp, #0x34]
	mov sb, r0
	mov r8, r1
	str r2, [sp]
	str r3, [sp, #4]
_02340700:
	mov r0, #4
	bl DungeonRandInt
	mov r4, r0
	mov r0, sb
	mov r1, r8
	mov sl, #0
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	mvn r0, #1
	str r0, [sp, #8]
_02340730:
	and r5, r4, #3
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _02340774
_02340740: ; jump table
	b _02340750 ; case 0
	b _0234075C ; case 1
	b _02340768 ; case 2
	b _02340774 ; case 3
_02340750:
	mov r0, #2
	mov r2, #0
	b _0234077C
_0234075C:
	mov r0, #0
	ldr r2, [sp, #8]
	b _0234077C
_02340768:
	ldr r0, [sp, #8]
	mov r2, #0
	b _0234077C
_02340774:
	mov r0, #0
	mov r2, #2
_0234077C:
	ldr r1, [sp]
	add r0, sb, r0
	cmp r1, r0
	bgt _023407C4
	cmp fp, r0
	ble _023407C4
	add r1, r8, r2
	ldr r2, [sp, #4]
	cmp r2, r1
	bgt _023407C4
	ldr r2, [sp, #0x34]
	cmp r2, r1
	ble _023407C4
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023407D8
_023407C4:
	add r4, r4, #1
	add sl, sl, #1
	cmp sl, #4
	blt _02340730
	b _02340874
_023407D8:
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _02340700
_023407E4: ; jump table
	b _023407F4 ; case 0
	b _02340814 ; case 1
	b _02340834 ; case 2
	b _02340854 ; case 3
_023407F4:
	mov r1, r8
	add r0, sb, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	add sb, sb, #2
	b _02340700
_02340814:
	mov r0, sb
	sub r1, r8, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	sub r8, r8, #2
	b _02340700
_02340834:
	mov r1, r8
	sub r0, sb, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	sub sb, sb, #2
	b _02340700
_02340854:
	mov r0, sb
	add r1, r8, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	add r8, r8, #2
	b _02340700
_02340874:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end GenerateMazeLine

	arm_func_start SetSpawnFlag5
SetSpawnFlag5: ; 0x0234087C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrsh r5, [r6]
	b _023408C0
_0234088C:
	ldrsh r4, [r6, #2]
	b _023408B0
_02340894:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r4, r4, #1
	orr r1, r1, #0x20
	strh r1, [r0, #2]
_023408B0:
	ldrsh r0, [r6, #6]
	cmp r4, r0
	blt _02340894
	add r5, r5, #1
_023408C0:
	ldrsh r0, [r6, #4]
	cmp r5, r0
	blt _0234088C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetSpawnFlag5

	arm_func_start IsNextToHallway
IsNextToHallway: ; 0x023408D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mvn r5, #0
	mov sl, r0
	mov sb, r1
	mov r4, r5
	b _02340964
_023408E8:
	adds r8, sl, r5
	bmi _02340960
	cmp r8, #0x38
	bge _0234096C
	mov r6, r4
	b _02340958
_02340900:
	adds r7, sb, r6
	bmi _02340954
	cmp r7, #0x20
	bge _02340960
	cmp r5, #0
	cmpne r6, #0
	bne _02340954
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _02340954
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02340954:
	add r6, r6, #1
_02340958:
	cmp r6, #1
	ble _02340900
_02340960:
	add r5, r5, #1
_02340964:
	cmp r5, #1
	ble _023408E8
_0234096C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end IsNextToHallway

	arm_func_start ResolveInvalidSpawns
ResolveInvalidSpawns: ; 0x02340974
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
_0234097C:
	mov r4, #0
_02340980:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	beq _023409BC
	ldrh r1, [r0]
	tst r1, #0x110
	ldrneh r1, [r0, #2]
	bicne r1, r1, #2
	strneh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_023409BC:
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _023409E0
	ldrh r1, [r0]
	orr r1, r1, #0x200
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_023409E0:
	ldrh r1, [r0, #2]
	add r4, r4, #1
	tst r1, #2
	bicne r1, r1, #4
	strneh r1, [r0, #2]
	cmp r4, #0x20
	blt _02340980
	add r5, r5, #1
	cmp r5, #0x38
	blt _0234097C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ResolveInvalidSpawns

	arm_func_start ConvertSecondaryTerrainToChasms
ConvertSecondaryTerrainToChasms: ; 0x02340A0C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02340A18:
	mov r5, r4
_02340A1C:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _02340A5C
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #3
	strh r1, [r0]
_02340A5C:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340A1C
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340A18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ConvertSecondaryTerrainToChasms

	arm_func_start EnsureImpassableTilesAreWalls
EnsureImpassableTilesAreWalls: ; 0x02340A78
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02340A84:
	mov r5, r4
_02340A88:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x10
	beq _02340AB8
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
_02340AB8:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340A88
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340A84
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EnsureImpassableTilesAreWalls

	arm_func_start InitializeTile
InitializeTile: ; 0x02340AD4
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #7]
	strh r2, [r0, #4]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r2, [r0, #6]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	bx lr
	arm_func_end InitializeTile

	arm_func_start ResetFloor
ResetFloor: ; 0x02340B0C
#ifdef JAPAN
#define RESET_FLOOR_OFFSET -0xA4
#else
#define RESET_FLOOR_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov r4, r6
_02340B18:
	mov r5, r4
	sub r7, r6, #1
_02340B20:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	bl InitializeTile
	sub r8, r5, #1
	mov r0, r6
	mov r1, r8
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r1, r8
	add r0, r6, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r1, r8
	add r0, r6, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	add r0, r6, #1
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r6
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	mov r1, r5
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	mov r1, r8
	bl PosIsOutOfBounds
	cmp r0, #0
	beq _02340BEC
_02340BD4:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x10
	strh r1, [r0]
_02340BEC:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340B20
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340B18
	ldr r6, _02340CA8 ; =DUNGEON_PTR
	mov sb, #0
	ldr r0, [r6]
	mvn r1, #0
	add r0, r0, #0xcc00
	strh r1, [r0, #0xe4 + RESET_FLOOR_OFFSET]
	ldr r0, [r6]
	mov r7, sb
	add r0, r0, #0xcc00
	strh r1, [r0, #0xe6 + RESET_FLOOR_OFFSET]
	mov r4, #0x14
	mov r5, #0xa0
_02340C34:
	mul r8, sb, r5
	mov sl, r7
_02340C3C:
	ldr r0, [r6]
#ifdef JAPAN
	add r0, r0, #0xbc
	add r0, r0, #0xcc00
#else
	add r0, r0, #0xd60
	add r0, r0, #0xc000
#endif
	add r0, r0, r8
	mla r0, sl, r4, r0
	bl InitializeTile
	add sl, sl, #1
	cmp sl, #8
	blt _02340C3C
	add sb, sb, #1
	cmp sb, #8
	blt _02340C34
	ldr r1, _02340CA8 ; =DUNGEON_PTR
	mov r3, #0
	ldr r0, [r1]
	mov r2, r3
	add r0, r0, #0x3f00
	strh r3, [r0, #0xc0 + RESET_FLOOR_OFFSET]
_02340C84:
	ldr r0, [r1]
	add r0, r0, r3, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xcc8 + RESET_FLOOR_OFFSET]
	add r3, r3, #1
	str r2, [r0]
	cmp r3, #0x40
	blt _02340C84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02340CA8: .word DUNGEON_PTR
	arm_func_end ResetFloor
