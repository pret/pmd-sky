	.include "asm/macros.inc"
	.include "overlay_29_023350FC.inc"

	.text

	arm_func_start ov29_023350FC
ov29_023350FC: ; 0x023350FC
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl GetApparentWeather
	bl GetWeatherColorTable
	ldr r2, _0233516C ; =DUNGEON_PTR
	mov r1, #0
_02335114:
	ldr r3, [r2]
	ldrb ip, [r0, r1, lsl #2]
	add r3, r3, r1, lsl #2
	add lr, r0, r1, lsl #2
	strb ip, [r3, #0x1e0]
	ldr r3, [r2]
	ldrb ip, [lr, #1]
	add r3, r3, r1, lsl #2
	strb ip, [r3, #0x1e1]
	ldr r3, [r2]
	ldrb ip, [lr, #2]
	add r3, r3, r1, lsl #2
	strb ip, [r3, #0x1e2]
	ldr r3, [r2]
	ldrb ip, [lr, #3]
	add r3, r3, r1, lsl #2
	add r1, r1, #1
	strb ip, [r3, #0x1e3]
	cmp r1, #0x100
	blt _02335114
	bl ov29_022DE608
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233516C: .word DUNGEON_PTR
	arm_func_end ov29_023350FC

	arm_func_start TryWeatherFormChange
TryWeatherFormChange: ; 0x02335170
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, #0
	mov sl, r0
	mov r6, r5
	bl EntityIsValid__023350D8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r7, [sl, #0xb4]
	mov r0, sl
	ldrsh r4, [r7, #4]
	ldrb r8, [r7, #0x5e]
	ldrb sb, [r7, #0x5f]
	bl CalcSpeedStageWrapper
	mov r0, sl
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	mov r0, sl
	beq _023351E0
	bl GetApparentWeather
	mov r1, #6
	mul r2, r0, r1
	ldr r1, _02335434 ; =CASTFORM_WEATHER_ATTRIBUTE_TABLE
	mov r0, r5
	ldrb r1, [r1, r2]
	strb r1, [r7, #0x5e]
	strb r0, [r7, #0x5f]
	b _02335220
_023351E0:
	bl Conversion2IsActive
	cmp r0, #0
	ldreqb r0, [r7, #0xff]
	cmpeq r0, #0
	ldreqb r0, [r7, #0xa9]
	cmpeq r0, #0
	bne _02335220
	ldrsh r0, [r7, #2]
	mov r1, r5
	bl GetType
	strb r0, [r7, #0x5e]
	ldrsh r0, [r7, #2]
	mov r1, #1
	bl GetType
	strb r0, [r7, #0x5f]
	mov r6, #1
_02335220:
	ldrb r0, [r7, #0x5e]
	cmp r8, r0
	ldreqb r0, [r7, #0x5f]
	cmpeq sb, r0
	beq _0233523C
	cmp r6, #0
	moveq r5, #1
_0233523C:
	ldrsh r1, [r7, #2]
	ldr r0, _02335438 ; =0x0000017B
	cmp r1, r0
	blt _02335258
	add r0, r0, #3
	cmp r1, r0
	ble _02335270
_02335258:
	ldr r0, _0233543C ; =0x000003D3
	cmp r1, r0
	blt _023352FC
	add r0, r0, #3
	cmp r1, r0
	bgt _023352FC
_02335270:
	mov r0, sl
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02335298
	ldrsh r1, [r7, #2]
	mov r0, sl
	bl GetMonsterApparentId
	strh r0, [r7, #4]
	b _023352C0
_02335298:
	ldrsh r2, [r7, #2]
	ldr r1, _02335438 ; =0x0000017B
	cmp r2, r1
	blt _023352B8
	add r0, r1, #3
	cmp r2, r0
	strleh r1, [r7, #4]
	ble _023352C0
_023352B8:
	ldr r0, _0233543C ; =0x000003D3
	strh r0, [r7, #4]
_023352C0:
	ldrsh r0, [r7, #4]
	cmp r0, r4
	beq _02335420
	ldrsh r0, [r7, #4]
	bl DungeonGetSpriteIndex
	strh r0, [sl, #0xa8]
	mov r0, sl
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sl
	bl ov29_02304830
	mov r0, sl
	bl ov29_02304BAC
	mov r5, #1
	b _02335420
_023352FC:
	cmp r1, #0x1cc
	blt _02335310
	ldr r0, _02335440 ; =0x000001CD
	cmp r1, r0
	ble _02335328
_02335310:
	ldr r0, _02335444 ; =0x00000424
	cmp r1, r0
	blt _02335420
	add r0, r0, #1
	cmp r1, r0
	bgt _02335420
_02335328:
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #1
	ldrsh r1, [r7, #2]
	bne _02335394
	cmp r1, #0x1cc
	ldreq r0, _02335440 ; =0x000001CD
	streqh r0, [r7, #4]
	beq _0233535C
	ldr r0, _02335444 ; =0x00000424
	cmp r1, r0
	addeq r0, r0, #1
	streqh r0, [r7, #4]
_0233535C:
	ldrsh r2, [r7, #2]
	ldr r0, _02335440 ; =0x000001CD
	cmp r2, r0
	ldreqsh r1, [r7, #4]
	cmpeq r1, #0x1cc
	streqh r0, [r7, #4]
	beq _023353F0
	ldr r1, _02335448 ; =0x00000425
	cmp r2, r1
	ldreqsh r2, [r7, #4]
	subeq r0, r1, #1
	cmpeq r2, r0
	streqh r1, [r7, #4]
	b _023353F0
_02335394:
	ldr r0, _02335440 ; =0x000001CD
	cmp r1, r0
	moveq r0, #0x1cc
	streqh r0, [r7, #4]
	beq _023353B8
	add r0, r0, #0x258
	cmp r1, r0
	ldreq r0, _02335444 ; =0x00000424
	streqh r0, [r7, #4]
_023353B8:
	ldrsh r2, [r7, #2]
	cmp r2, #0x1cc
	ldreqsh r1, [r7, #4]
	ldreq r0, _02335440 ; =0x000001CD
	cmpeq r1, r0
	moveq r0, #0x1cc
	streqh r0, [r7, #4]
	beq _023353F0
	ldr r1, _02335444 ; =0x00000424
	cmp r2, r1
	ldreqsh r2, [r7, #4]
	addeq r0, r1, #1
	cmpeq r2, r0
	streqh r1, [r7, #4]
_023353F0:
	ldrsh r0, [r7, #4]
	cmp r0, r4
	beq _02335420
	ldrsh r0, [r7, #4]
	bl DungeonGetSpriteIndex
	strh r0, [sl, #0xa8]
	mov r0, sl
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sl
	bl ov29_02304830
	mov r5, #1
_02335420:
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, sl
	bl ov29_022E65F4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02335434: .word CASTFORM_WEATHER_ATTRIBUTE_TABLE
_02335438: .word 0x0000017B
_0233543C: .word 0x000003D3
_02335440: .word 0x000001CD
_02335444: .word 0x00000424
_02335448: .word 0x00000425
	arm_func_end TryWeatherFormChange

	arm_func_start ActivateSportCondition
ActivateSportCondition: ; 0x0233544C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mov r0, #0
	bne _02335488
	ldr r1, _023354B4 ; =SPORT_CONDITION_TURN_RANGE
	mov r2, r0
	bl CalcStatusDuration
	ldr r1, _023354B8 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0xc000
	strb r0, [r1, #0xd5b]
	bl GetLeader
	ldr r1, _023354BC ; =0x00000CDA
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
_02335488:
	ldr r1, _023354B4 ; =SPORT_CONDITION_TURN_RANGE
	mov r2, r0
	bl CalcStatusDuration
	ldr r1, _023354B8 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0xc000
	strb r0, [r1, #0xd5c]
	bl GetLeader
	ldr r1, _023354C0 ; =0x00000CDB
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
	.align 2, 0
_023354B4: .word SPORT_CONDITION_TURN_RANGE
_023354B8: .word DUNGEON_PTR
_023354BC: .word 0x00000CDA
_023354C0: .word 0x00000CDB
	arm_func_end ActivateSportCondition

	arm_func_start TryActivateWeather
TryActivateWeather: ; 0x023354C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sl, r0
	mov r0, r4
	mov sb, r1
	mov r6, r4
	sub r5, r4, #1
	bl GetApparentWeather
	ldr fp, _02335664 ; =DUNGEON_PTR
	mov r7, r0
	mov r8, r4
_023354F0:
	ldr r3, [fp]
	add r0, r3, r8, lsl #1
	add r0, r0, #0xcd00
	ldrh r2, [r0, #0x4a]
	ldrh r1, [r0, #0x3a]
	cmp r1, r2
	strloh r2, [r0, #0x3a]
	blo _02335524
	bls _02335524
	add r0, r3, #0x3a
	add r0, r0, #0xcd00
	add r0, r0, r8, lsl #1
	bl ov29_022E9A6C
_02335524:
	ldr r1, [fp]
	add r0, r1, r8, lsl #1
	add r0, r0, #0xcd00
	ldrh r0, [r0, #0x3a]
	cmp r4, r0
	movlt r5, r8
	add r8, r8, #1
	movlt r4, r0
	cmp r8, #8
	blt _023354F0
	cmp r5, #0
	addge r0, r1, #0xc000
	strgeb r5, [r0, #0xd38]
	bge _02335570
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r1, [r0, #0xd39]
	strb r1, [r0, #0xd38]
_02335570:
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r1, [r0, #0xd5d]
	cmp r1, #0
	movne r1, #0
	strneb r1, [r0, #0xd38]
	mov r0, #0
	bl GetApparentWeather
	cmp r7, r0
	cmpeq sb, #0
	beq _023355AC
	mov r0, sl
	mov r6, #1
	bl ov29_02334E70
_023355AC:
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r1, [r0, #0xd5a]
	cmp r1, #0
	subne r1, r1, #1
	moveq r1, #9
	strb r1, [r0, #0xd5a]
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5b]
	cmp r0, #0
	beq _02335614
	add r0, r1, #0x5b
	add r0, r0, #0xcd00
	bl TickStatusTurnCounter
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b]
	cmp r0, #0
	bne _02335614
	bl GetLeader
	ldr r1, _02335668 ; =0x00000C93
	bl LogMessageByIdWithPopupCheckUser
_02335614:
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5c]
	cmp r0, #0
	beq _0233565C
	add r0, r1, #0x15c
	add r0, r0, #0xcc00
	bl TickStatusTurnCounter
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c]
	cmp r0, #0
	bne _0233565C
	bl GetLeader
	ldr r1, _0233566C ; =0x00000C92
	bl LogMessageByIdWithPopupCheckUser
_0233565C:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335664: .word DUNGEON_PTR
_02335668: .word 0x00000C93
_0233566C: .word 0x00000C92
	arm_func_end TryActivateWeather

	arm_func_start DigitCount
DigitCount: ; 0x02335670
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	rsblt r0, r0, #0
	movlt r0, r0, lsl #0x10
	movlt r0, r0, asr #0x10
	cmp r0, #0
	mov r5, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0xa
	b _023356B0
_0233569C:
	mov r1, r4
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r5, r5, #1
_023356B0:
	cmp r0, #0
	bne _0233569C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DigitCount

	arm_func_start LoadTextureUi
LoadTextureUi: ; 0x023356C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02335750 ; =ov29_02352B4C
#ifdef EUROPE
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #8]
#else
	ldr r1, [r0, #4]
	ldr r0, [r0]
#endif
	str r1, [sp, #4]
	str r0, [sp]
	bl GetLanguage
	ldr r1, _02335754 ; =ov29_0235371C
	mov r0, r0, lsl #1
	ldrh r2, [r1, r0]
	add r0, sp, #0
	mov r1, #4
	mov r3, #0x300
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0x1000
	mov r2, #2
	mov r3, #0
	bl ProcessWte
	bl GetLanguage
	mov r3, r0, lsl #1
	ldr r1, _02335758 ; =ov29_02353720
	mov r0, #4
	ldrh r1, [r1, r3]
	mov r2, #0
	bl LoadWtuFromBin
	ldr r1, _0233575C ; =ov29_0237CA8C
	ldr r2, [sp, #4]
	str r0, [r1, #4]
	ldrh r2, [r2, #0xc]
	ldr r0, [sp]
	strh r2, [r1]
	bl sub_0201E080
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02335750: .word ov29_02352B4C
_02335754: .word ov29_0235371C
_02335758: .word ov29_02353720
_0233575C: .word ov29_0237CA8C
	arm_func_end LoadTextureUi

	arm_func_start ov29_02335760
ov29_02335760: ; 0x02335760
	ldr ip, _0233576C ; =sub_0201E020
	ldr r0, _02335770 ; =ov29_0237CA90
	bx ip
	.align 2, 0
_0233576C: .word sub_0201E020
_02335770: .word ov29_0237CA90
	arm_func_end ov29_02335760

	arm_func_start ov29_02335774
ov29_02335774: ; 0x02335774
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
#ifdef EUROPE
	ldr r0, _023357F4 ; =ov29_02352B4C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r1, [sp, #4]
	str r0, [sp]
	bl GetLanguage
	ldr r1, _02336244 ; =0x0235431C
	mov r0, r0, lsl #1
	ldrh r2, [r1, r0]
#else
	ldr r1, _023357F4 ; =ov29_02352B4C
	ldr r2, _023357F8 ; =0x000003EF
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	str r3, [sp, #4]
#endif
	add r0, sp, #0
	mov r1, #4
	mov r3, #0x300
#ifndef EUROPE
	str ip, [sp]
#endif
	bl LoadWteFromFileDirectory
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	mov r3, r1
	bl ProcessWte
	ldr ip, [sp, #4]
	ldr r2, _023357FC ; =ov29_0237CA96
	add r3, ip, #0x10
	mov r1, #4
_023357C8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023357C8
	ldrh r2, [ip, #0xc]
	ldr r1, _02335800 ; =ov29_0237CA8C
	ldr r0, [sp]
	strh r2, [r1, #8]
	bl sub_0201E080
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023357F4: .word ov29_02352B4C
#ifdef EUROPE
_02336244: .word 0x0235431C
#else
_023357F8: .word 0x000003EF
#endif
_023357FC: .word ov29_0237CA96
_02335800: .word ov29_0237CA8C
	arm_func_end ov29_02335774

	arm_func_start ov29_02335804
ov29_02335804: ; 0x02335804
	bx lr
	arm_func_end ov29_02335804

	arm_func_start ov29_02335808
ov29_02335808: ; 0x02335808
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl InitRender3dElement64
	mov r1, #0
	mov r0, r5, lsl #0x10
	strb r1, [r4, #0x3c]
	mov r2, #0x28
	strh r2, [r4, #0x2a]
	ldr r2, _02335860 ; =ov29_0237CA8C
	strb r1, [r4, #0x3e]
	ldrh r3, [r2]
	mov r0, r0, asr #0x10
	mov r2, #0x1000
	strh r3, [r4, #0x14]
	str r2, [r4, #0x20]
	bl ov29_02335864
	ldr r1, _02335860 ; =ov29_0237CA8C
	str r0, [r4, #0x24]
	mov r0, #0
	strb r0, [r1, #0x12]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02335860: .word ov29_0237CA8C
	arm_func_end ov29_02335808

	arm_func_start ov29_02335864
ov29_02335864: ; 0x02335864
	ldr r2, _0233587C ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_0233587C: .word _020AFC70
	arm_func_end ov29_02335864

	arm_func_start DisplayNumberTextureUi
DisplayNumberTextureUi: ; 0x02335880
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldr r4, _02335984 ; =ov29_0237CA8C
	mov r5, r0
	ldr r4, [r4, #4]
	mov fp, r1
	add r0, sp, #0
	mov sl, r2
	mov r1, #2
	ldr r4, [r4, #4]
	mov r6, r3
	bl ov29_02335808
	mov r0, sl
	bl DigitCount
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r6, #0
	movne sb, #0xa
	ldrsh r0, [r4, #4]
	sub r1, r8, #1
	moveq sb, #0
	mul r1, r0, r1
	mov r1, r1, lsl #0x10
	add r6, r5, r1, asr #16
	mov r5, #0
	b _02335968
_023358E8:
	smulbb r0, r0, r5
	sub r2, r6, r0
	mov r0, sl
	mov r1, #0xa
	strh r2, [sp]
	strh fp, [sp, #2]
	bl _s32_div_f
	add r0, sb, r1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7, lsl #3
	ldrsh r1, [r4, r0]
	add r2, r4, r7, lsl #3
	add r0, sp, #0
	strh r1, [sp, #0x16]
	ldrsh r1, [r2, #2]
	strh r1, [sp, #0x18]
	ldrsh r1, [r2, #4]
	strh r1, [sp, #0x1a]
	ldrsh r1, [r2, #6]
	strh r1, [sp, #0x1c]
	bl sub_0201F2A0
	mov r0, sl
	mov r1, #0xa
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
	add r0, r4, r7, lsl #3
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	ldrsh r0, [r0, #4]
	mov r5, r1, asr #0x10
_02335968:
	cmp r5, r8
	blt _023358E8
	mul r1, r0, r8
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335984: .word ov29_0237CA8C
	arm_func_end DisplayNumberTextureUi

	arm_func_start DisplayCharTextureUi
DisplayCharTextureUi: ; 0x02335988
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _023359F4 ; =ov29_0237CA8C
	mov r6, r0
	ldr r0, [r4, #4]
	mov r5, r3
	ldr r4, [r0, #4]
	mov r0, #2
	strh r1, [r6]
	ldrsh r1, [sp, #0x10]
	strh r2, [r6, #2]
	bl ov29_02335864
	str r0, [r6, #0x24]
	mov r0, r5, lsl #3
	ldrsh r1, [r4, r0]
	add r2, r4, r5, lsl #3
	mov r0, r6
	strh r1, [r6, #0x16]
	ldrsh r1, [r2, #2]
	strh r1, [r6, #0x18]
	ldrsh r1, [r2, #4]
	strh r1, [r6, #0x1a]
	ldrsh r1, [r2, #6]
	strh r1, [r6, #0x1c]
	bl sub_0201F2A0
	add r0, r4, r5, lsl #3
	ldrsh r0, [r0, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023359F4: .word ov29_0237CA8C
	arm_func_end DisplayCharTextureUi

	arm_func_start ov29_023359F8
ov29_023359F8: ; 0x023359F8
	ldr r1, _02335A08 ; =ov29_0237CA8C
	ldr ip, _02335A0C ; =SetBothScreensWindowColorToDefault
	strb r0, [r1, #0x12]
	bx ip
	.align 2, 0
_02335A08: .word ov29_0237CA8C
_02335A0C: .word SetBothScreensWindowColorToDefault
	arm_func_end ov29_023359F8

	arm_func_start DisplayUi
DisplayUi: ; 0x02335A10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r0, _02335F2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x21c
#ifdef EUROPE
	add r4, r0, #0x1a000
	ldr r0, [r4, #0x10]
	cmp r0, #0
	moveq r1, #0
	beq _02336498
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_02336498:
	cmp r1, #0
	beq _02335F24
	ldr r1, _02335F30 ; =ov29_0237CA8C
	ldrb r1, [r1, #0x12]
	cmp r1, #0
	bne _02335F24
	ldr r8, [r0, #0xb4]
	mov r7, #0
	ldrsh r3, [r8, #0x12]
	ldrsh r2, [r8, #0x16]
	ldr r1, _02335F34 ; =0x000003E7
	mov sb, r7
	add sl, r3, r2
	cmp sl, r1
	movgt sl, r1
	ldr r1, _02335F2C ; =DUNGEON_PTR
	ldrsh r6, [r8, #0x10]
	ldr r1, [r1]
	ldrb fp, [r8, #0xa]
	ldrb r2, [r1, #0x749]
	ldrsh r1, [r1, #0x1e]
	add r5, r2, r1
	bl HasLowHealth
	cmp r0, #0
	add r0, r8, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	movne r7, #1
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	moveq sb, #1
	cmp r7, #0
	beq _02336564
	ldr r0, _02335F38 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #0x10
	beq _02336550
	mov r0, #0
	mov r1, r0
	mov r8, #0x20
	bl SetScreenWindowsColor
	b _0233656C
_02336550:
	mov r0, #1
	mov r1, #0
	mov r8, #0x10
	bl SetScreenWindowsColor
	b _0233656C
_02336564:
	mov r8, #0x10
	bl SetBothScreensWindowColorToDefault
_0233656C:
	cmp sb, #0
	beq _023365A8_EU
	ldr r0, _02335F38 ; =ov29_0237C850
	ldr r0, [r0]
	ands r0, r0, #0x10
	movne r8, #0x30
	cmp r7, #0
	bne _023365A8_EU
	cmp r0, #0
	beq _023365A4_EU
	mov r0, #3
	mov r1, #0
	bl SetScreenWindowsColor
	b _023365A8_EU
_023365A4_EU:
	bl SetBothScreensWindowColorToDefault
_023365A8_EU:
	add r0, sp, #4
	mov r1, #2
	bl ov29_02335808
	bl GetLanguage
	cmp fp, #0x64
	bne _023365D4
	cmp r0, #0
	cmpne r0, #2
	cmpne r0, #4
	moveq r7, #0
	beq _023365D8
_023365D4:
	mov r7, #8
_023365D8:
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	addne r0, r7, #0x18
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	bne _02336818
	bl GetLanguage
	sub r1, r0, #1
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	and r1, r1, #0xff
	cmp r1, #3
	bhi _02336754
	cmp r0, #2
	mov sb, #0
	bne _02336678
	ldr r0, _02335F2C ; =DUNGEON_PTR
	mov sb, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	add r0, sp, #4
	mov r2, #0
	mov r1, r7
	bne _0233665C
	mov r3, #0x18
	str r8, [sp]
	bl DisplayCharTextureUi
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	b _023366DC
_0233665C:
	mov r3, #0x14
	str r8, [sp]
	bl DisplayCharTextureUi
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	b _023366DC
_02336678:
	add r0, sp, #4
	mov r1, r7
	mov r2, sb
	mov r3, #0x14
	str r8, [sp]
	bl DisplayCharTextureUi
	ldr r1, _02335F2C ; =DUNGEON_PTR
	add r2, r7, r0
	ldr r0, [r1]
	mov r1, r2, lsl #0x10
	ldrb r0, [r0, #0x748]
	mov r7, r1, asr #0x10
	bl DungeonGoesUp
	cmp r0, #0
	movne sb, #1
	bne _023366DC
	add r0, sp, #4
	mov r1, r7
	mov r2, sb
	mov r3, #0x18
	str r8, [sp]
	bl DisplayCharTextureUi
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_023366DC:
	cmp r5, #0xa
	ldrb r0, [r4, #0x2f]
	bge _02336710
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r5, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r7
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	b _02336734
_02336710:
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r5, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r7
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
_02336734:
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp sb, #0
	addne r0, r7, #8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _02336818
_02336754:
	ldr r0, _02335F2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	bne _02336790
	add r0, sp, #4
	mov r1, r7
	mov r2, #0
	mov r3, #0x18
	str r8, [sp]
	bl DisplayCharTextureUi
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02336790:
	cmp r5, #0xa
	ldrb r0, [r4, #0x2f]
	bge _023367C4
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r5, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r7
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	b _023367E8
_023367C4:
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r5, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r7
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
_023367E8:
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	add r0, sp, #4
	mov r1, r7
	mov r2, #0
	mov r3, #0x14
	str r8, [sp]
	bl DisplayCharTextureUi
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02336818:
	add r0, sp, #4
	mov r1, r7
	str r8, [sp]
	mov r2, #0
	mov r3, #0x15
	bl DisplayCharTextureUi
	ldrb r1, [r4, #0x2f]
	add r0, r7, r0
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r7, r0, asr #0x10
	movne r3, #0
	mov r1, fp, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r7
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	mov r5, #0x48
	add r0, sp, #4
	mov r1, r5
	str r8, [sp]
	mov r2, #0
	mov r3, #0x16
	bl DisplayCharTextureUi
	ldrb r1, [r4, #0x2f]
	add r0, r0, #0x48
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r5, r0, asr #0x10
	movne r3, #0
	mov r1, r6, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r5
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	add r0, r5, r0
	mov r7, r0, lsl #0x10
	mov r5, r7, asr #0x10
	add r0, sp, #4
	mov r1, r5
	str r8, [sp]
	mov r2, #0
	mov r3, #0x17
	bl DisplayCharTextureUi
	ldrb r1, [r4, #0x2f]
	add r0, r0, r7, asr #16
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r5, r0, asr #0x10
	movne r3, #0
	mov r1, sl, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r5
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	ldr r0, _02335F30 ; =ov29_0237CA8C
	cmp sl, #0
	ldr r0, [r0, #4]
	mov r4, #0x90
	ldr r8, [r0, #4]
	mov r5, #0x10
	blt _02335F24
	add r0, sp, #4
	bl InitRender3dElement64
	ldr r0, _02335F30 ; =ov29_0237CA8C
	mov fp, #5
	ldrh r3, [r0]
	mov r0, r6, lsl #0x10
	mov sb, #0x28
	mov r2, #0x1000
	mov r7, r0, asr #0x10
	ldr r1, _02335F3C ; =_020AFC70
	str r2, [sp, #0x24]
	ldr r0, [r1]
	cmp r7, #0x70
	strb fp, [sp, #0x40]
	strb sb, [sp, #0x42]
	strh r3, [sp, #0x18]
	ldr r0, [r0, #0xe0]
	mov r1, #0
	mov r2, #0x90
	add r0, r0, #0x400
	str r0, [sp, #0x28]
	mov r0, sl, lsl #0x10
	mov sb, r0, asr #0x10
	movgt r7, #0x70
	cmp sb, #0x70
	movgt sb, #0x70
	add r0, sb, #0x90
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	strh r1, [sp, #6]
	strh r3, [sp, #8]
	strh r1, [sp, #0xa]
	add r0, r5, #1
	mov r1, r0, lsl #0x10
	strh r2, [sp, #4]
	strh r2, [sp, #0xc]
	ldrsh r2, [r8, #0xce]
	mov r5, r1, asr #0x10
	add r0, sp, #4
	strh r2, [sp, #0xe]
	strh r3, [sp, #0x10]
	ldrsh r3, [r8, #0xce]
	mov r2, #0x10
	strh r3, [sp, #0x12]
	ldrsh r3, [r8, #0xc8]
	strh r3, [sp, #0x1a]
	ldrsh r1, [r8, #0xca]
	strh r1, [sp, #0x1c]
	ldrsh r1, [r8, #0xcc]
	strh r1, [sp, #0x1e]
	ldrsh r1, [r8, #0xce]
	strh r1, [sp, #0x20]
	strh r2, [sp, #0x2e]
	bl sub_0201F2A0
	cmp r6, #0
	ble _02336A70
	add r0, r7, #0x90
	mov r0, r0, lsl #0x10
	mov r3, #0x90
	mov r2, r0, asr #0x10
	mov r1, #0
	strh r3, [sp, #4]
	strh r2, [sp, #8]
	strh r3, [sp, #0xc]
	strh r1, [sp, #6]
	strh r1, [sp, #0xa]
	ldrsh r1, [r8, #0xe6]
	add r0, sp, #4
	strh r2, [sp, #0x10]
	strh r1, [sp, #0xe]
	ldrsh r1, [r8, #0xe6]
	strh r1, [sp, #0x12]
	ldrsh r1, [r8, #0xe0]
	strh r1, [sp, #0x1a]
	ldrsh r1, [r8, #0xe2]
	strh r1, [sp, #0x1c]
	ldrsh r1, [r8, #0xe4]
	strh r1, [sp, #0x1e]
	ldrsh r1, [r8, #0xe6]
	strh r1, [sp, #0x20]
	strh r5, [sp, #0x2e]
	bl sub_0201F2A0
_02336A70:
	sub r0, sb, r7
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	cmp r1, #0
	ble _02335F24
	add r0, r4, r7
	mov r0, r0, lsl #0x10
	add r1, r1, r0, asr #16
	mov r1, r1, lsl #0x10
	mov r3, r0, asr #0x10
	mov r0, #0
	mov r2, r1, asr #0x10
	strh r3, [sp, #4]
	strh r0, [sp, #6]
	strh r0, [sp, #0xa]
	strh r2, [sp, #8]
	strh r3, [sp, #0xc]
	ldrsh r1, [r8, #0xde]
	add r0, sp, #4
	strh r2, [sp, #0x10]
	strh r1, [sp, #0xe]
	ldrsh r1, [r8, #0xde]
	strh r1, [sp, #0x12]
	ldrsh r1, [r8, #0xd8]
	strh r1, [sp, #0x1a]
	ldrsh r1, [r8, #0xda]
	strh r1, [sp, #0x1c]
	ldrsh r1, [r8, #0xdc]
	strh r1, [sp, #0x1e]
	ldrsh r1, [r8, #0xde]
	strh r1, [sp, #0x20]
	strh r5, [sp, #0x2e]
#else
	add r5, r0, #0x1a000
	ldr r0, [r5, #0x10]
	cmp r0, #0
	moveq r1, #0
	beq _02335A4C
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_02335A4C:
	cmp r1, #0
	beq _02335F24
	ldr r1, _02335F30 ; =ov29_0237CA8C
	ldrb r1, [r1, #0x12]
	cmp r1, #0
	bne _02335F24
	ldr sl, [r0, #0xb4]
	mov r6, #0
	ldrsh r3, [sl, #0x12]
	ldrsh r2, [sl, #0x16]
	ldr r1, _02335F34 ; =0x000003E7
	mov fp, r6
	add r4, r3, r2
	cmp r4, r1
	movgt r4, r1
	ldr r1, _02335F2C ; =DUNGEON_PTR
	ldrsh r8, [sl, #0x10]
	ldr r1, [r1]
	ldrb sb, [sl, #0xa]
	ldrb r2, [r1, #0x749]
	ldrsh r1, [r1, #0x1e]
	add r7, r2, r1
	bl HasLowHealth
	cmp r0, #0
	add r0, sl, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	movne r6, #1
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	moveq fp, #1
	cmp r6, #0
	beq _02335B18
	ldr r0, _02335F38 ; =ov29_0237C850
	ldr r0, [r0]
	tst r0, #0x10
	beq _02335B04
	mov r0, #0
	mov r1, r0
	mov sl, #0x20
	bl SetScreenWindowsColor
	b _02335B20
_02335B04:
	mov r0, #1
	mov r1, #0
	mov sl, #0x10
	bl SetScreenWindowsColor
	b _02335B20
_02335B18:
	mov sl, #0x10
	bl SetBothScreensWindowColorToDefault
_02335B20:
	cmp fp, #0
	beq _02335B5C
	ldr r0, _02335F38 ; =ov29_0237C850
	ldr r0, [r0]
	ands r0, r0, #0x10
	movne sl, #0x30
	cmp r6, #0
	bne _02335B5C
	cmp r0, #0
	beq _02335B58
	mov r0, #3
	mov r1, #0
	bl SetScreenWindowsColor
	b _02335B5C
_02335B58:
	bl SetBothScreensWindowColorToDefault
_02335B5C:
	add r0, sp, #4
	mov r1, #2
	bl ov29_02335808
	mov r6, #0
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	addne r0, r6, #0x18
	movne r0, r0, lsl #0x10
	movne r6, r0, asr #0x10
	bne _02335C48
	ldr r0, _02335F2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	bne _02335BC0
	mov r1, r6
	add r0, sp, #4
	mov r2, r1
	mov r3, #0x18
	str sl, [sp]
	bl DisplayCharTextureUi
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02335BC0:
	cmp r7, #0xa
	ldrb r0, [r5, #0x2f]
	bge _02335BF4
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r7, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r6
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	b _02335C18
_02335BF4:
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r1, r7, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r6
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
_02335C18:
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r0, sp, #4
	mov r1, r6
	mov r2, #0
	mov r3, #0x14
	str sl, [sp]
	bl DisplayCharTextureUi
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02335C48:
	add r0, sp, #4
	mov r1, r6
	str sl, [sp]
	mov r2, #0
	mov r3, #0x15
	bl DisplayCharTextureUi
	ldrb r1, [r5, #0x2f]
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r6, r0, asr #0x10
	movne r3, #0
	mov r1, sb, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r6
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	mov r6, #0x48
	add r0, sp, #4
	mov r1, r6
	str sl, [sp]
	mov r2, #0
	mov r3, #0x16
	bl DisplayCharTextureUi
	ldrb r1, [r5, #0x2f]
	add r0, r0, #0x48
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r6, r0, asr #0x10
	movne r3, #0
	mov r1, r8, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r6
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	add r0, r6, r0
	mov r7, r0, lsl #0x10
	mov r6, r7, asr #0x10
	add r0, sp, #4
	mov r1, r6
	str sl, [sp]
	mov r2, #0
	mov r3, #0x17
	bl DisplayCharTextureUi
	ldrb r1, [r5, #0x2f]
	add r0, r0, r7, asr #16
	mov r0, r0, lsl #0x10
	cmp r1, #0
	moveq r3, #1
	mov r6, r0, asr #0x10
	movne r3, #0
	mov r1, r4, lsl #0x10
	mov r2, r1, asr #0x10
	mov r0, r6
	and r3, r3, #0xff
	mov r1, #0
	bl DisplayNumberTextureUi
	ldr r0, _02335F30 ; =ov29_0237CA8C
	cmp r4, #0
	ldr r0, [r0, #4]
	mov r5, #0x90
	ldr sb, [r0, #4]
	mov r6, #0x10
	blt _02335F24
	add r0, sp, #4
	bl InitRender3dElement64
	ldr r0, _02335F30 ; =ov29_0237CA8C
	mov fp, #5
	ldrh r3, [r0]
	mov r0, r8, lsl #0x10
	mov sl, #0x28
	mov r2, #0x1000
	mov r7, r0, asr #0x10
	ldr r1, _02335F3C ; =_020AFC70
	str r2, [sp, #0x24]
	ldr r0, [r1]
	cmp r7, #0x70
	strb fp, [sp, #0x40]
	strb sl, [sp, #0x42]
	strh r3, [sp, #0x18]
	ldr r0, [r0, #0xe0]
	mov r1, #0
	mov r2, #0x90
	add r0, r0, #0x400
	str r0, [sp, #0x28]
	mov r0, r4, lsl #0x10
	mov r4, r0, asr #0x10
	movgt r7, #0x70
	cmp r4, #0x70
	movgt r4, #0x70
	add r0, r4, #0x90
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	strh r1, [sp, #6]
	strh r3, [sp, #8]
	strh r1, [sp, #0xa]
	add r0, r6, #1
	mov r1, r0, lsl #0x10
	strh r2, [sp, #4]
	strh r2, [sp, #0xc]
	ldrsh r2, [sb, #0xce]
	mov r6, r1, asr #0x10
	add r0, sp, #4
	strh r2, [sp, #0xe]
	strh r3, [sp, #0x10]
	ldrsh r3, [sb, #0xce]
	mov r2, #0x10
	strh r3, [sp, #0x12]
	ldrsh r3, [sb, #0xc8]
	strh r3, [sp, #0x1a]
	ldrsh r1, [sb, #0xca]
	strh r1, [sp, #0x1c]
	ldrsh r1, [sb, #0xcc]
	strh r1, [sp, #0x1e]
	ldrsh r1, [sb, #0xce]
	strh r1, [sp, #0x20]
	strh r2, [sp, #0x2e]
	bl sub_0201F2A0
	cmp r8, #0
	ble _02335EA0
	add r0, r7, #0x90
	mov r0, r0, lsl #0x10
	mov r3, #0x90
	mov r2, r0, asr #0x10
	mov r1, #0
	strh r3, [sp, #4]
	strh r2, [sp, #8]
	strh r3, [sp, #0xc]
	strh r1, [sp, #6]
	strh r1, [sp, #0xa]
	ldrsh r1, [sb, #0xe6]
	add r0, sp, #4
	strh r2, [sp, #0x10]
	strh r1, [sp, #0xe]
	ldrsh r1, [sb, #0xe6]
	strh r1, [sp, #0x12]
	ldrsh r1, [sb, #0xe0]
	strh r1, [sp, #0x1a]
	ldrsh r1, [sb, #0xe2]
	strh r1, [sp, #0x1c]
	ldrsh r1, [sb, #0xe4]
	strh r1, [sp, #0x1e]
	ldrsh r1, [sb, #0xe6]
	strh r1, [sp, #0x20]
	strh r6, [sp, #0x2e]
	bl sub_0201F2A0
_02335EA0:
	sub r0, r4, r7
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	cmp r1, #0
	ble _02335F24
	add r0, r5, r7
	mov r0, r0, lsl #0x10
	add r1, r1, r0, asr #16
	mov r1, r1, lsl #0x10
	mov r3, r0, asr #0x10
	mov r0, #0
	mov r2, r1, asr #0x10
	strh r3, [sp, #4]
	strh r0, [sp, #6]
	strh r0, [sp, #0xa]
	strh r2, [sp, #8]
	strh r3, [sp, #0xc]
	ldrsh r1, [sb, #0xde]
	add r0, sp, #4
	strh r2, [sp, #0x10]
	strh r1, [sp, #0xe]
	ldrsh r1, [sb, #0xde]
	strh r1, [sp, #0x12]
	ldrsh r1, [sb, #0xd8]
	strh r1, [sp, #0x1a]
	ldrsh r1, [sb, #0xda]
	strh r1, [sp, #0x1c]
	ldrsh r1, [sb, #0xdc]
	strh r1, [sp, #0x1e]
	ldrsh r1, [sb, #0xde]
	strh r1, [sp, #0x20]
	strh r6, [sp, #0x2e]
#endif
	bl sub_0201F2A0
_02335F24:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335F2C: .word DUNGEON_PTR
_02335F30: .word ov29_0237CA8C
_02335F34: .word 0x000003E7
_02335F38: .word ov29_0237C850
_02335F3C: .word _020AFC70
	arm_func_end DisplayUi

	arm_func_start ov29_02335F40
ov29_02335F40: ; 0x02335F40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r5, r0
	add r0, sp, #0
	mov sl, r1
	mov r4, r3
	ldr sb, [sp, #0x6c]
	bl InitRender3dElement64
	mov r0, #0
	ldrh r1, [sp, #0x68]
	mov r2, #0x21
	strb r2, [sp, #0x3e]
	mov r1, r1, lsl #0x14
	mov r1, r1, asr #0x10
	strb r0, [sp, #0x3c]
	str r0, [sp, #0x20]
	bl ov29_02335864
	mov r3, #0x31
	ldr r2, _023360F8 ; =ov29_0237CA8C
	rsb r1, r3, #0x2740
	ldrh r2, [r2, #8]
	str r0, [sp, #0x24]
	strb r4, [sp, #0x2f]
	strh r2, [sp, #0x14]
	strh r3, [sp, #0x2a]
	cmp sb, r1
	bne _02335FF0
	mov r7, #0x10
	mov r6, #4
	mov r4, #0x60
	mov r3, #0
	mov r2, #0x20
	mov r1, #8
	add r0, sp, #0
	strh r5, [sp]
	strh sl, [sp, #2]
	strh r7, [sp, #8]
	strh r6, [sp, #0xa]
	strh r4, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	strh r1, [sp, #0x1c]
	bl sub_0201F2A0
	b _023360F0
_02335FF0:
	mov r0, sb
	mov r4, #0
	bl DigitCount
	mov r7, r0
	mov r0, r7, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	ldrb r1, [sp, #0x70]
	sub r0, r5, r0, asr #16
	mov r0, r0, lsl #0x10
	cmp r1, #0
	mov r5, r0, asr #0x10
	beq _02336064
	cmp sb, #0
	mov r1, #8
	movlt r2, #0x58
	movge r2, #0x50
	mov r3, r4
	add r0, sp, #0
	strh r5, [sp]
	strh sl, [sp, #2]
	strh r2, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r1, [sp, #0x1a]
	strh r1, [sp, #0x1c]
	bl sub_0201F2A0
	add r0, r4, #8
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02336064:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	movlt sb, r0, asr #0x10
	add r1, r5, r4
	mov r6, #0
	sub r0, r7, #1
	add r8, r1, r0, lsl #3
	mov r5, r6
	mov r4, r6
	mov fp, #8
	b _023360E8
_02336094:
	sub r2, r8, r6, lsl #3
	mov r0, sb
	mov r1, #0xa
	strh r2, [sp]
	strh sl, [sp, #2]
	strh r5, [sp, #8]
	strh r5, [sp, #0xa]
	bl _s32_div_f
	mov r0, r1, lsl #3
	strh r0, [sp, #0x16]
	add r0, sp, #0
	strh r4, [sp, #0x18]
	strh fp, [sp, #0x1a]
	strh fp, [sp, #0x1c]
	bl sub_0201F2A0
	mov r0, sb
	mov r1, #0xa
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	add r6, r6, #1
_023360E8:
	cmp r6, r7
	blt _02336094
_023360F0:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023360F8: .word ov29_0237CA8C
	arm_func_end ov29_02335F40

	arm_func_start GetTile
GetTile: ; 0x023360FC
	cmp r0, #0
	ldrlt r0, _0233615C ; =DEFAULT_TILE
	ldrlt r0, [r0]
	bxlt lr
	cmp r1, #0
	ldrlt r0, _0233615C ; =DEFAULT_TILE
	ldrlt r0, [r0]
	bxlt lr
	cmp r0, #0x38
	ldrge r0, _0233615C ; =DEFAULT_TILE
	ldrge r0, [r0]
	bxge lr
	cmp r1, #0x20
	ldrge r0, _0233615C ; =DEFAULT_TILE
	ldrge r0, [r0]
	bxge lr
	ldr r3, _02336160 ; =DUNGEON_PTR
	mov r2, #0xe0
	ldr r3, [r3]
	mla r2, r1, r2, r3
	add r0, r2, r0, lsl #2
	add r0, r0, #0xd000
	ldr r0, [r0, #0x2e4]
	bx lr
	.align 2, 0
_0233615C: .word DEFAULT_TILE
_02336160: .word DUNGEON_PTR
	arm_func_end GetTile

	arm_func_start GetTileSafe
GetTileSafe: ; 0x02336164
	stmdb sp!, {r4, lr}
	cmp r0, #0
	cmpge r1, #0
	blt _02336180
	cmp r0, #0x38
	cmplt r1, #0x20
	blt _023361A8
_02336180:
	ldr r0, _023361C8 ; =DEFAULT_TILE
	ldr lr, _023361CC ; =ov29_0237CAB8
	ldr r4, [r0]
	mov ip, lr
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldr r1, [r4]
	mov r0, ip
	str r1, [lr]
	ldmia sp!, {r4, pc}
_023361A8:
	ldr r3, _023361D0 ; =DUNGEON_PTR
	mov r2, #0xe0
	ldr r3, [r3]
	mla r2, r1, r2, r3
	add r0, r2, r0, lsl #2
	add r0, r0, #0xd000
	ldr r0, [r0, #0x2e4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023361C8: .word DEFAULT_TILE
_023361CC: .word ov29_0237CAB8
_023361D0: .word DUNGEON_PTR
	arm_func_end GetTileSafe

	arm_func_start IsFullFloorFixedRoom
IsFullFloorFixedRoom: ; 0x023361D4
	ldr r0, _02336200 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda]
	cmp r0, #0
	beq _023361F8
	cmp r0, #0xa5
	movlo r0, #1
	bxlo lr
_023361F8:
	mov r0, #0
	bx lr
	.align 2, 0
_02336200: .word DUNGEON_PTR
	arm_func_end IsFullFloorFixedRoom

	arm_func_start IsCurrentTilesetBackground
IsCurrentTilesetBackground: ; 0x02336204
	ldr r0, _0233621C ; =DUNGEON_PTR
	ldr ip, _02336220 ; =IsBackgroundTileset
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4]
	bx ip
	.align 2, 0
_0233621C: .word DUNGEON_PTR
_02336220: .word IsBackgroundTileset
	arm_func_end IsCurrentTilesetBackground

	arm_func_start TrySpawnGoldenChamber
TrySpawnGoldenChamber: ; 0x02336224
	stmdb sp!, {r3, lr}
	bl IsGoldenChamber
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0233625C ; =DUNGEON_PTR
	mov r3, #0x3c
	ldr r0, [r1]
	mov r2, #0x6f
	add r0, r0, #0x4000
	strh r3, [r0, #0xd4]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233625C: .word DUNGEON_PTR
	arm_func_end TrySpawnGoldenChamber

	arm_func_start CountItemsOnFloorForAcuteSniffer
CountItemsOnFloorForAcuteSniffer: ; 0x02336260
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, #0
	strh r6, [sp, #2]
	add r4, sp, #0
	mov r5, r6
	b _023362C0
_0233627C:
	strh r5, [sp]
	b _023362A8
_02336284:
	mov r0, r4
	bl PositionHasItem
	cmp r0, #0
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	movne r6, r0, asr #0x10
	ldrsh r0, [sp]
	add r0, r0, #1
	strh r0, [sp]
_023362A8:
	ldrsh r0, [sp]
	cmp r0, #0x38
	blt _02336284
	ldrsh r0, [sp, #2]
	add r0, r0, #1
	strh r0, [sp, #2]
_023362C0:
	ldrsh r0, [sp, #2]
	cmp r0, #0x20
	blt _0233627C
	ldr r1, _023362E4 ; =DUNGEON_PTR
	ldr r0, _023362E8 ; =0x00012AF8
	ldr r1, [r1]
	strh r6, [r1, r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023362E4: .word DUNGEON_PTR
_023362E8: .word 0x00012AF8
	arm_func_end CountItemsOnFloorForAcuteSniffer

	arm_func_start ov29_023362EC
ov29_023362EC: ; 0x023362EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	ldr r8, _023363BC ; =DUNGEON_PTR
	mov r2, ip
	mov r5, #0x14
	mov r6, #0x460
	mov r7, #0xe0
_02336308:
	mul lr, ip, r6
	mul r4, ip, r7
	mov r3, r2
_02336314:
	ldr r1, [r8]
	add r0, r1, #0xe0
	add r0, r0, #0x4000
	add r0, r0, lr
	mla r0, r3, r5, r0
	add r1, r4, r1
	add r1, r1, r3, lsl #2
	add r1, r1, #0xd000
	add r3, r3, #1
	str r0, [r1, #0x2e4]
	cmp r3, #0x38
	blt _02336314
	add ip, ip, #1
	cmp ip, #0x20
	blt _02336308
	ldr r1, _023363BC ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x4000
	strh r2, [r0, #0xd4]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strh r2, [r0, #0xd6]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xaa8]
	bl ov29_023369F8
	ldr r1, _023363BC ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x4000
	str r2, [r0, #0xd0]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xc8]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xb24]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xb25]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023363BC: .word DUNGEON_PTR
	arm_func_end ov29_023362EC

	arm_func_start GetStairsSpawnPosition
GetStairsSpawnPosition: ; 0x023363C0
	ldr r3, _023363E8 ; =DUNGEON_PTR
	ldr r2, [r3]
	add r2, r2, #0xcc00
	ldrsh r2, [r2, #0xe4]
	strh r2, [r0]
	ldr r0, [r3]
	add r0, r0, #0xcc00
	ldrsh r0, [r0, #0xe6]
	strh r0, [r1]
	bx lr
	.align 2, 0
_023363E8: .word DUNGEON_PTR
	arm_func_end GetStairsSpawnPosition

	arm_func_start PositionIsOnStairs
PositionIsOnStairs: ; 0x023363EC
	ldr r2, _02336424 ; =DUNGEON_PTR
	mov ip, #0
	ldr r2, [r2]
	add r2, r2, #0xcc00
	ldrsh r3, [r2, #0xe4]
	cmp r3, r0
	ldreqsh r0, [r2, #0xe6]
	cmpeq r0, r1
	moveq ip, #1
	cmp ip, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02336424: .word DUNGEON_PTR
	arm_func_end PositionIsOnStairs

	arm_func_start GetStairsRoom
GetStairsRoom: ; 0x02336428
	stmdb sp!, {r3, lr}
	ldr r0, _0233644C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4]
	ldrsh r1, [r1, #0xe6]
	bl GetTile
	ldrb r0, [r0, #7]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233644C: .word DUNGEON_PTR
	arm_func_end GetStairsRoom

	arm_func_start GetDefaultTileTextureId
GetDefaultTileTextureId: ; 0x02336450
	ldr r0, _0233645C ; =DEFAULT_TILE
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0233645C: .word DEFAULT_TILE
	arm_func_end GetDefaultTileTextureId

	arm_func_start ov29_02336460
ov29_02336460: ; 0x02336460
	stmdb sp!, {r4, lr}
	ldr r1, _02336598 ; =DUNGEON_PTR
	ldr r0, _0233659C ; =ov29_0237CAAC
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x4000
	ldrsh r4, [r1, #0xd4]
	mov r1, r4
	bl ov10_022C25EC
	ldr r1, _023365A0 ; =ov29_0237CAA0
	mov r0, #0
	ldr ip, [r1, #0x14]
	ldr r3, _023365A4 ; =DEFAULT_TILE
	mov r2, r0
	mov r1, #1
	str ip, [r3, #4]
	bl GetBgRegionArea
	mov r1, r4
	mov r2, #0
	bl ov10_022C2588
	ldr r0, _02336598 ; =DUNGEON_PTR
	mov r1, r4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x2a8
	add r0, r0, #0x10000
	bl InitTilesetBuffer
	ldr r1, _02336598 ; =DUNGEON_PTR
	ldr r0, _023365A8 ; =0x00012162
	ldr r2, [r1]
	mov r1, r4
	add r0, r2, r0
	mov r2, #0
	bl ov10_022C2720
	mov r0, #0
	mov r1, r0
	bl ov29_022E9F80
	ldr r0, _023365AC ; =ov29_0237CAA0
	mov r1, r4
	mov r2, #0
	bl ov10_022C2654
	ldr r0, _023365A0 ; =ov29_0237CAA0
	mov r1, #0x20
	ldr r0, [r0, #8]
	bl ov29_022DE0EC
	ldr r1, _023365B0 ; =ov29_0237C9B8
	mov r4, #0
	mov r3, #1
	strb r4, [r1]
	strb r3, [r1, #1]
	mov r0, #2
	strb r0, [r1, #2]
	mov r0, #3
	strb r0, [r1, #3]
	ldr r0, _02336598 ; =DUNGEON_PTR
	ldr r2, _023365B4 ; =SECONDARY_TERRAIN_TYPES
	ldr ip, [r0]
	add r0, ip, #0x4000
	ldrsh r0, [r0, #0xd4]
	ldrb r0, [r2, r0]
	cmp r0, #1
	streqb r3, [r1, #4]
	streqb r4, [r1, #5]
	strneb r4, [r1, #4]
	strneb r3, [r1, #5]
	add r0, ip, #0x4000
	ldrsh r0, [r0, #0xd4]
	sub r0, r0, #0x1a
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldrls r0, _023365B0 ; =ov29_0237C9B8
	movls r1, #0
	strlsb r1, [r0, #4]
	strlsb r1, [r0, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02336598: .word DUNGEON_PTR
_0233659C: .word ov29_0237CAAC
_023365A0: .word ov29_0237CAA0
_023365A4: .word DEFAULT_TILE
_023365A8: .word 0x00012162
_023365AC: .word ov29_0237CAA0
_023365B0: .word ov29_0237C9B8
_023365B4: .word SECONDARY_TERRAIN_TYPES
	arm_func_end ov29_02336460

	arm_func_start ov29_023365B8
ov29_023365B8: ; 0x023365B8
	stmdb sp!, {r3, lr}
	ldr r0, _023365DC ; =ov29_0237CAAC
	bl ov10_022C2638
	ldr r0, _023365E0 ; =ov29_0237CAA0
	bl ov10_022C26A0
	ldr r0, _023365E4 ; =DEFAULT_TILE
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023365DC: .word ov29_0237CAAC
_023365E0: .word ov29_0237CAA0
_023365E4: .word DEFAULT_TILE
	arm_func_end ov29_023365B8

	arm_func_start ov29_023365E8
ov29_023365E8: ; 0x023365E8
	stmdb sp!, {r3, lr}
	ldr r0, _02336648 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4]
	sub r1, r0, #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	ldrls r1, _0233664C ; =ov29_02352B60
	ldrls r0, _02336650 ; =DEFAULT_TILE
	strls r1, [r0]
	ldmlsia sp!, {r3, pc}
	bl ov29_022E0378
	cmp r0, #0
	ldrne r1, _02336654 ; =ov29_02352B88
	ldrne r0, _02336650 ; =DEFAULT_TILE
	strne r1, [r0]
	ldreq r1, _02336658 ; =ov29_02352B74
	ldreq r0, _02336650 ; =DEFAULT_TILE
	streq r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02336648: .word DUNGEON_PTR
_0233664C: .word ov29_02352B60
_02336650: .word DEFAULT_TILE
_02336654: .word ov29_02352B88
_02336658: .word ov29_02352B74
	arm_func_end ov29_023365E8

	arm_func_start ov29_0233665C
ov29_0233665C: ; 0x0233665C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02336668:
	mov r5, r4
_0233666C:
	mov r0, r5
	mov r1, r6
	bl ov29_02336694
	add r5, r5, #1
	cmp r5, #0x38
	blt _0233666C
	add r6, r6, #1
	cmp r6, #0x20
	blt _02336668
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0233665C

	arm_func_start ov29_02336694
ov29_02336694: ; 0x02336694
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	movs sb, r0
	mov r8, r1
	bmi _023369E8
	cmp r8, #0
	blt _023369E8
	cmp sb, #0x38
	cmplt r8, #0x20
	bge _023369E8
	bl GetTile
	ldr r1, _023369F0 ; =DUNGEON_PTR
	ldrh r2, [r0]
	ldr r4, [r1]
	add r0, r4, #0x4000
	ldrsh r1, [r0, #0xd4]
	and r0, r2, #3
	str r0, [sp, #4]
	cmp r1, #0xaa
	blt _02336728
	cmp sb, #0x20
	cmplt r8, #0x20
	mov r0, sb
	bge _02336714
	mov r1, r8
	bl GetTileSafe
	add r2, r4, r8, lsl #6
	ldr r1, _023369F4 ; =0x00012162
	add r2, r2, sb, lsl #1
	ldrh r1, [r2, r1]
	strh r1, [r0, #4]
	b _023369E8
_02336714:
	mov r1, r8
	bl GetTileSafe
	mov r1, #0
	strh r1, [r0, #4]
	b _023369E8
_02336728:
	mov r0, sb
	add r1, r8, #1
	bl GetTile
	ldrh r2, [r0]
	add r0, sb, #1
	add r1, r8, #1
	and sl, r2, #3
	bl GetTile
	ldrh r2, [r0]
	mov r1, r8
	add r0, sb, #1
	and r2, r2, #3
	str r2, [sp]
	bl GetTile
	ldrh r2, [r0]
	add r0, sb, #1
	sub r1, r8, #1
	and fp, r2, #3
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	sub r1, r8, #1
	and r4, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	sub r1, r8, #1
	and r5, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	mov r1, r8
	and r6, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	add r1, r8, #1
	and r7, r2, #3
	bl GetTile
	ldrh r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, #1
	and r0, r1, #3
	bne _02336828
	cmp sl, #0
	mov sl, #0xff
	ldr r1, [sp]
	biceq sl, sl, #1
	cmp r1, #0
	biceq sl, sl, #2
	cmp fp, #0
	biceq sl, sl, #4
	cmp r4, #0
	biceq sl, sl, #8
	cmp r5, #0
	biceq sl, sl, #0x10
	cmp r6, #0
	biceq sl, sl, #0x20
	cmp r7, #0
	biceq sl, sl, #0x40
	cmp r0, #0
	biceq sl, sl, #0x80
	orr sl, sl, #0x200
	b _0233699C
_02336828:
	ldr r1, [sp, #4]
	cmp r1, #2
	bne _02336884
	cmp sl, #2
	mov sl, #0xff
	ldr r1, [sp]
	bicne sl, sl, #1
	cmp r1, #2
	bicne sl, sl, #2
	cmp fp, #2
	bicne sl, sl, #4
	cmp r4, #2
	bicne sl, sl, #8
	cmp r5, #2
	bicne sl, sl, #0x10
	cmp r6, #2
	bicne sl, sl, #0x20
	cmp r7, #2
	bicne sl, sl, #0x40
	cmp r0, #2
	bicne sl, sl, #0x80
	orr sl, sl, #0x100
	b _0233699C
_02336884:
	cmp r1, #3
	bne _02336954
	ldr r1, _023369F0 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd4]
	sub r1, r1, #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _02336904
	cmp sl, #3
	mov sl, #0
	ldr r1, [sp]
	orreq sl, sl, #1
	cmp r1, #3
	orreq sl, sl, #2
	cmp fp, #3
	orreq sl, sl, #4
	cmp r4, #3
	orreq sl, sl, #8
	cmp r5, #3
	orreq sl, sl, #0x10
	cmp r6, #3
	orreq sl, sl, #0x20
	cmp r7, #3
	orreq sl, sl, #0x40
	cmp r0, #3
	orreq sl, sl, #0x80
	b _0233699C
_02336904:
	cmp sl, #3
	mov sl, #0xff
	ldr r1, [sp]
	bicne sl, sl, #1
	cmp r1, #3
	bicne sl, sl, #2
	cmp fp, #3
	bicne sl, sl, #4
	cmp r4, #3
	bicne sl, sl, #8
	cmp r5, #3
	bicne sl, sl, #0x10
	cmp r6, #3
	bicne sl, sl, #0x20
	cmp r7, #3
	bicne sl, sl, #0x40
	cmp r0, #3
	bicne sl, sl, #0x80
	orr sl, sl, #0x100
	b _0233699C
_02336954:
	cmp sl, #0
	mov sl, #0
	ldr r1, [sp]
	orreq sl, sl, #1
	cmp r1, #0
	orreq sl, sl, #2
	cmp fp, #0
	orreq sl, sl, #4
	cmp r4, #0
	orreq sl, sl, #8
	cmp r5, #0
	orreq sl, sl, #0x10
	cmp r6, #0
	orreq sl, sl, #0x20
	cmp r7, #0
	orreq sl, sl, #0x40
	cmp r0, #0
	orreq sl, sl, #0x80
_0233699C:
	mov r0, #4
	bl RandIntSafe
	mov r4, r0
	cmp r4, #3
	moveq r4, #0
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	mov r0, sb
	mov r1, r8
	movne r4, #0
	bl GetTileSafe
	ldr r1, _023369F0 ; =DUNGEON_PTR
	add r2, sl, sl, lsl #1
	ldr r1, [r1]
	add r1, r1, r2
	add r1, r1, r4
	add r1, r1, #0x12000
	ldrb r1, [r1, #0x162]
	strh r1, [r0, #4]
_023369E8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023369F0: .word DUNGEON_PTR
_023369F4: .word 0x00012162
	arm_func_end ov29_02336694

	arm_func_start ov29_023369F8
ov29_023369F8: ; 0x023369F8
	ldr r1, _02336A48 ; =DUNGEON_PTR
	mov ip, #0
	mvn r3, #0
	mov r2, #0xff
_02336A08:
	ldr r0, [r1]
	add r0, r0, ip, lsl #2
	add r0, r0, #0xcc00
	strh r3, [r0, #0xec]
	ldr r0, [r1]
	add r0, r0, ip, lsl #2
	add r0, r0, #0xcc00
	strh r3, [r0, #0xee]
	ldr r0, [r1]
	add r0, r0, ip
	add r0, r0, #0xc000
	add ip, ip, #1
	strb r2, [r0, #0xd0c]
	cmp ip, #8
	blt _02336A08
	bx lr
	.align 2, 0
_02336A48: .word DUNGEON_PTR
	arm_func_end ov29_023369F8

	arm_func_start DetermineAllTilesWalkableNeighbors
DetermineAllTilesWalkableNeighbors: ; 0x02336A4C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02336A58:
	mov r5, r4
_02336A5C:
	mov r0, r5
	mov r1, r6
	bl DetermineTileWalkableNeighbors
	add r5, r5, #1
	cmp r5, #0x38
	blt _02336A5C
	add r6, r6, #1
	cmp r6, #0x20
	blt _02336A58
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DetermineAllTilesWalkableNeighbors

	arm_func_start DetermineTileWalkableNeighbors
DetermineTileWalkableNeighbors: ; 0x02336A84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r4, r1
	mov r6, #0
	add r1, r4, #1
	mov r5, r0
	mov r7, r6
	mov r8, r6
	bl GetTile
	ldrh r2, [r0]
	add r0, r5, #1
	add r1, r4, #1
	and r2, r2, #3
	str r2, [sp, #8]
	bl GetTile
	ldrh r2, [r0]
	mov r1, r4
	add r0, r5, #1
	and r2, r2, #3
	str r2, [sp, #0xc]
	bl GetTile
	ldrh r1, [r0]
	sub sb, r4, #1
	add r0, r5, #1
	and r1, r1, #3
	str r1, [sp, #0x10]
	mov r1, sb
	bl GetTile
	ldrh r2, [r0]
	mov r0, r5
	mov r1, sb
	and r2, r2, #3
	str r2, [sp, #0x14]
	bl GetTile
	ldrh r2, [r0]
	mov r1, sb
	sub sb, r5, #1
	and r2, r2, #3
	mov r0, sb
	str r2, [sp, #0x18]
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	mov r1, r4
	and r2, r2, #3
	str r2, [sp, #0x1c]
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	add r1, r4, #1
	and r2, r2, #3
	str r2, [sp, #0x20]
	bl GetTile
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	cmp r0, #1
	and r0, r1, #3
	orreq r6, r6, #1
	str r0, [sp, #0x24]
	cmp r2, #1
	ldr r3, [sp, #0x18]
	orreq r6, r6, #4
	cmp r3, #1
	ldr ip, [sp, #0x20]
	orreq r6, r6, #0x10
	cmp ip, #1
	ldr r0, [sp, #8]
	orreq r6, r6, #0x40
	cmp r0, #0
	beq _02336BB4
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02336BB4
	cmp r2, #0
	orrne r6, r6, #2
_02336BB4:
	cmp r2, #0
	beq _02336BD0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02336BD0
	cmp r3, #0
	orrne r6, r6, #8
_02336BD0:
	cmp r3, #0
	beq _02336BEC
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _02336BEC
	cmp ip, #0
	orrne r6, r6, #0x20
_02336BEC:
	cmp ip, #0
	beq _02336C0C
	ldr r0, [sp, #0x24]
	cmp r0, #1
	bne _02336C0C
	ldr r0, [sp, #8]
	cmp r0, #0
	orrne r6, r6, #0x80
_02336C0C:
	mov r1, #0
	mov fp, r1
	add lr, sp, #0
	mov sb, #1
	add r0, sp, #8
_02336C20:
	ldr sl, [r0, r1, lsl #2]
	sub sl, sl, #1
	cmp sl, #1
	strlsb sb, [lr, r1]
	strhib fp, [lr, r1]
	add r1, r1, #1
	cmp r1, #8
	blt _02336C20
	ldrb r0, [sp]
	mov sb, #0xff
	mov r1, r4
	cmp r0, #0
	ldrb r0, [sp, #2]
	orrne r7, r7, #1
	cmp r0, #0
	ldrb r0, [sp, #4]
	orrne r7, r7, #4
	cmp r0, #0
	ldrb r0, [sp, #6]
	orrne r7, r7, #0x10
	cmp r0, #0
	ldr r0, [sp, #8]
	orrne r7, r7, #0x40
	cmp r0, #0
	ldrneb r0, [sp, #1]
	cmpne r0, #0
	cmpne r2, #0
	orrne r7, r7, #2
	cmp r2, #0
	ldrneb r0, [sp, #3]
	cmpne r0, #0
	cmpne r3, #0
	orrne r7, r7, #8
	cmp r3, #0
	ldrneb r0, [sp, #5]
	cmpne r0, #0
	cmpne ip, #0
	orrne r7, r7, #0x20
	cmp ip, #0
	ldrneb r0, [sp, #7]
	cmpne r0, #0
	ldrne r0, [sp, #8]
	cmpne r0, #0
	ldr r0, [sp, #8]
	orrne r7, r7, #0x80
	cmp r0, #0
	orrne r8, r8, #1
	cmp r2, #0
	orrne r8, r8, #4
	cmp r3, #0
	orrne r8, r8, #0x10
	cmp ip, #0
	ldr r0, [sp, #8]
	orrne r8, r8, #0x40
	cmp r0, #0
	ldrne r0, [sp, #0xc]
	cmpne r0, #0
	cmpne r2, #0
	orrne r8, r8, #2
	cmp r2, #0
	ldrne r0, [sp, #0x14]
	cmpne r0, #0
	cmpne r3, #0
	orrne r8, r8, #8
	cmp r3, #0
	ldrne r0, [sp, #0x1c]
	cmpne r0, #0
	cmpne ip, #0
	orrne r8, r8, #0x20
	cmp ip, #0
	ldrne r0, [sp, #0x24]
	cmpne r0, #0
	ldrne r0, [sp, #8]
	cmpne r0, #0
	orrne r8, r8, #0x80
	cmp r5, #1
	bicle sb, sb, #0xe0
	cmp r4, #1
	bicle sb, sb, #0x38
	cmp r5, #0x36
	bicge sb, sb, #0xe
	cmp r4, #0x1e
	mov r0, r5
	bicge sb, sb, #0x83
	bl GetTileSafe
	strb r6, [r0, #8]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb r7, [r0, #9]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb r8, [r0, #0xa]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb sb, [r0, #0xb]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DetermineTileWalkableNeighbors

	arm_func_start ov29_02336DB0
ov29_02336DB0: ; 0x02336DB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	mov r1, r2
	mov r5, r3
	bl GetTile
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #0x200
	beq _02336DE0
	ldr r0, _02336F48 ; =ov29_02352F14
	bl Debug_Print0
_02336DE0:
	ldrh r1, [r4]
	tst r1, #0x1000
	bne _02336DF4
	tst r1, #0x2000
	beq _02336E04
_02336DF4:
	add r0, r6, #0x32
	add r0, r0, #0xe000
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336E04:
	tst r1, #0x20
	addne r0, r6, #0x20
	addne r0, r0, #0xe000
	addne r0, r0, r5, lsl #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [sp, #0x14]
	cmp r0, #0
	beq _02336E40
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336E40:
	ldrh r0, [r4, #2]
	tst r0, #4
	addne r0, r6, #0x44
	addne r0, r0, #0xe000
	addne r0, r0, r5, lsl #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r2, [r4, #0x10]
	cmp r2, #0
	beq _02336EFC
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	ldreqb r0, [sp, #0x10]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	ands r1, r0, #0xff
	beq _02336EB0
	ldr r0, [r2]
	cmp r0, #2
	bne _02336EB0
	ldr r1, [r2, #0xb4]
	add r0, r6, #0x204
	ldrb r1, [r1]
	add r2, r0, #0xdc00
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EB0:
	cmp r1, #0
	beq _02336EE0
	ldr r0, [r2]
	cmp r0, #5
	bne _02336EE0
	ldrsh r1, [r6, #0x14]
	add r0, r6, #0x204
	add r2, r0, #0xdc00
	mov r0, #0x12
	smlabb r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EE0:
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EFC:
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	bne _02336F2C
	tst r1, #0x200
	beq _02336F2C
	ldrsh r1, [r6, #0x14]
	add r0, r6, #0x204
	add r2, r0, #0xdc00
	mov r0, #0x12
	smlabb r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336F2C:
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02336F48: .word ov29_02352F14
	arm_func_end ov29_02336DB0

	arm_func_start UpdateTrapsVisibility
UpdateTrapsVisibility: ; 0x02336F4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r0, _02337108 ; =DUNGEON_PTR
	ldr sl, [r0]
	add r1, sl, #0x1a000
	ldrb r0, [r1, #0x245]
	str r0, [sp, #0x18]
	ldrb fp, [r1, #0x244]
	bl IsSecretBazaar
	ldr r1, _0233710C ; =0x0001A224
	ldr r2, _02337110 ; =ov29_02352B9C
	ldrsh r3, [sl, r1]
	ldr r1, _02337114 ; =ov29_02352D58
	mov sb, r3, asr #3
	str r0, [sp, #0x14]
	add r0, sb, #0x1e
	mov r0, r0, lsl #1
	ldrsh r7, [r2, r0]
	ldrsh r5, [r1, r0]
	mov r0, #0
	str r0, [sp, #0x10]
_02336FA0:
	ldr r0, _02337118 ; =0x0001A226
	add r1, sl, #0xc4
	ldrsh r3, [sl, r0]
	ldr r0, _02337110 ; =ov29_02352B9C
	mov r2, r5, lsl #0x10
	mov r3, r3, asr #3
	sub r4, r3, #1
	add r3, r0, r4, lsl #1
	ldr r0, _02337114 ; =ov29_02352D58
	ldrsh r8, [r3, #0x3c]
	add r0, r0, r4, lsl #1
	ldrsh r6, [r0, #0x3c]
	add r0, r1, #0x4000
	add r3, r8, r8, lsl #1
	mov r1, r2, asr #0x10
	add r2, r7, r3
	mov r2, r2, lsl #0x10
	str fp, [sp]
	mov r3, r2, asr #0x10
	ldr r2, [sp, #0x18]
	and sb, sb, #0x3f
	str r2, [sp, #4]
	ldr r2, [sp, #0x14]
	str r2, [sp, #8]
	mov r2, r6, lsl #0x10
	mov r2, r2, asr #0x10
	bl ov29_02336DB0
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x24]
	add r0, sl, #0xc4
	str r0, [sp, #0x2c]
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x28]
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x20]
_02337044:
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x1c]
	and r4, r4, #0x1f
	ldrh r2, [r3], #6
	str r3, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	mov r1, r4
	mov r3, #1
	bl sub_02051D8C
	add r8, r8, #1
	add r4, r4, #1
	cmp r8, #3
	bne _023370B8
	str fp, [sp]
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, r6, lsl #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r0, r0, #0x4000
	mov r2, r2, asr #0x10
	mov r8, #0
	bl ov29_02336DB0
	str r0, [sp, #0x1c]
_023370B8:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x1b
	blt _02337044
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, r0, #1
	cmp r7, #3
	add sb, sb, #1
	addeq r5, r5, #1
	moveq r7, #0
	str r0, [sp, #0x10]
	cmp r0, #0x21
	blt _02336FA0
	mov r0, #1
	mov r1, #0
	bl sub_02051E60
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337108: .word DUNGEON_PTR
_0233710C: .word 0x0001A224
_02337110: .word ov29_02352B9C
_02337114: .word ov29_02352D58
_02337118: .word 0x0001A226
	arm_func_end UpdateTrapsVisibility

	arm_func_start ov29_0233711C
ov29_0233711C: ; 0x0233711C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r2, _02337294 ; =DUNGEON_PTR
	mov r4, r1
	ldr sl, [r2]
	mov r5, r0
	add r1, sl, #0x1a000
	ldrb r0, [r1, #0x245]
	str r0, [sp, #0x18]
	ldrb fp, [r1, #0x244]
	bl IsSecretBazaar
	ldr r2, _02337298 ; =0x0001A224
	ldr r1, _0233729C ; =ov29_02352B9C
	add r3, r2, #2
	ldrsh r6, [sl, r2]
	ldrsh r2, [sl, r3]
	add r3, r6, r5
	str r0, [sp, #0x14]
	add r0, r2, r4
	mov r0, r0, asr #3
	sub sb, r0, #1
	add r0, sb, #0x1e
	mov r2, r0, lsl #1
	str fp, [sp]
	ldr r0, [sp, #0x18]
	mov r8, r3, asr #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldrsh r7, [r1, r2]
	str r0, [sp, #8]
	add r0, r8, #0x1e
	mov r3, r0, lsl #1
	ldrsh r6, [r1, r3]
	ldr r1, _023372A0 ; =ov29_02352D58
	add r0, sl, #0xc4
	ldrsh r4, [r1, r3]
	ldrsh r5, [r1, r2]
	add r3, r7, r7, lsl #1
	add r3, r6, r3
	mov r1, r4, lsl #0x10
	mov r2, r5, lsl #0x10
	mov r3, r3, lsl #0x10
	add r0, r0, #0x4000
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, asr #0x10
	bl ov29_02336DB0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, r4, lsl #0x10
	mov r1, r6, lsl #0x10
	add r4, sl, #0xc4
	mov r6, r0, asr #0x10
	mov sl, r1, asr #0x10
_023371F8:
	mov r0, #0
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldrh r2, [r3], #6
	and r8, r8, #0x3f
	and sb, sb, #0x1f
	str r3, [sp, #0x10]
	mov r0, r8
	mov r1, sb
	mov r3, #1
	bl sub_02051D8C
	add r7, r7, #1
	add sb, sb, #1
	cmp r7, #3
	bne _0233726C
	str fp, [sp]
	ldr r0, [sp, #0x18]
	add r5, r5, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, r5, lsl #0x10
	str r0, [sp, #8]
	add r0, r4, #0x4000
	mov r1, r6
	mov r2, r2, asr #0x10
	mov r3, sl
	mov r7, #0
	bl ov29_02336DB0
	str r0, [sp, #0x10]
_0233726C:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x1b
	blt _023371F8
	mov r0, #1
	mov r1, #0
	bl sub_02051E60
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337294: .word DUNGEON_PTR
_02337298: .word 0x0001A224
_0233729C: .word ov29_02352B9C
_023372A0: .word ov29_02352D58
	arm_func_end ov29_0233711C

	arm_func_start ov29_023372A4
ov29_023372A4: ; 0x023372A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r2, _02337418 ; =DUNGEON_PTR
	mov r4, r1
	ldr sl, [r2]
	mov r5, r0
	add r1, sl, #0x1a000
	ldrb r0, [r1, #0x245]
	str r0, [sp, #0x18]
	ldrb fp, [r1, #0x244]
	bl IsSecretBazaar
	ldr r2, _0233741C ; =0x0001A224
	ldr r1, _02337420 ; =ov29_02352B9C
	add r3, r2, #2
	ldrsh r6, [sl, r2]
	ldrsh r2, [sl, r3]
	add r3, r6, r5
	str r0, [sp, #0x14]
	add r0, r2, r4
	mov r8, r0, asr #3
	add r0, r8, #0x1e
	mov r7, r3, asr #3
	str fp, [sp]
	mov r2, r0, lsl #1
	ldr r0, [sp, #0x18]
	ldr r3, _02337424 ; =ov29_02352D58
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldrsh r5, [r3, r2]
	str r0, [sp, #8]
	add r0, r7, #0x1e
	mov r4, r0, lsl #1
	ldrsh r6, [r1, r4]
	ldrsh r1, [r1, r2]
	add r0, sl, #0xc4
	mov r2, r5, lsl #0x10
	ldrsh r4, [r3, r4]
	add sb, r1, r1, lsl #1
	add r3, r6, sb
	mov r1, r4, lsl #0x10
	mov r3, r3, lsl #0x10
	add r0, r0, #0x4000
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, asr #0x10
	bl ov29_02336DB0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, r5, lsl #0x10
	mov r1, sb, lsl #0x10
	add r5, sl, #0xc4
	mov sb, r0, asr #0x10
	mov sl, r1, asr #0x10
_0233737C:
	mov r0, #0
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldrh r2, [r3], #2
	and r7, r7, #0x3f
	and r8, r8, #0x1f
	str r3, [sp, #0x10]
	mov r0, r7
	mov r1, r8
	mov r3, #1
	bl sub_02051D8C
	add r6, r6, #1
	add r7, r7, #1
	cmp r6, #3
	bne _023373F0
	str fp, [sp]
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r1, r4, lsl #0x10
	str r0, [sp, #8]
	add r0, r5, #0x4000
	mov r1, r1, asr #0x10
	mov r2, sb
	mov r3, sl
	mov r6, #0
	bl ov29_02336DB0
	str r0, [sp, #0x10]
_023373F0:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x21
	blt _0233737C
	mov r0, #1
	mov r1, #0
	bl sub_02051E60
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337418: .word DUNGEON_PTR
_0233741C: .word 0x0001A224
_02337420: .word ov29_02352B9C
_02337424: .word ov29_02352D58
	arm_func_end ov29_023372A4

	arm_func_start DrawTileGrid
DrawTileGrid: ; 0x02337428
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r5, _02337780 ; =DUNGEON_PTR
	str r2, [sp, #4]
	mov r4, r0
	mov r7, r1
	mov r6, r3
	ldr r5, [r5]
	bl GetLeader
	ldr r1, _02337784 ; =0x0001A224
	ldr r2, _02337780 ; =DUNGEON_PTR
	ldrsh r8, [r5, r1]
	ldr r1, [r2]
	ldr r2, _02337788 ; =DIRECTIONS_XY
	add r1, r1, #0x1a000
	strb r6, [r1, #0x251]
	mov r3, r7, lsl #2
	add r1, r2, r7, lsl #2
	ldrsh r3, [r2, r3]
	ldrsh sl, [r1, #2]
	ldrsh r6, [r4]
	ldrsh r7, [r4, #2]
	str r0, [sp, #0x20]
	mov sb, r8, asr #3
	mov r2, #0
	add r1, sp, #0x2c
_02337490:
	mov r0, r2, lsl #2
	strh r6, [r1, r0]
	add r0, r1, r2, lsl #2
	add r2, r2, #1
	strh r7, [r0, #2]
	cmp r2, #6
	add r6, r6, r3
	add r7, r7, sl
	blt _02337490
	add r0, sb, #0x1e
	mov r2, r0, lsl #1
	ldr r1, _0233778C ; =ov29_02352B9C
	ldr r0, _02337790 ; =ov29_02352D58
	ldrsh r8, [r1, r2]
	ldrsh r6, [r0, r2]
	mov r0, #0
	str r0, [sp, #0xc]
_023374D4:
	ldr r0, _02337794 ; =0x0001A226
	ldr r2, _0233778C ; =ov29_02352B9C
	ldrsh r3, [r5, r0]
	ldr r0, [sp, #4]
	ldr r1, _02337790 ; =ov29_02352D58
	mov fp, r3, asr #3
	cmp r0, #0
	add r0, r2, fp, lsl #1
	add r1, r1, fp, lsl #1
	ldrsh r0, [r0, #0x3c]
	ldrsh r7, [r1, #0x3c]
	strh r6, [sp, #0x28]
	str r0, [sp, #0x1c]
	add r0, r0, r0, lsl #1
	strh r7, [sp, #0x2a]
	add sl, r8, r0
	beq _02337544
	ldrsh r0, [r4]
	cmp r6, r0
	ldreqsh r0, [r4, #2]
	cmpeq r7, r0
	addeq r0, r5, #0x150
	addeq r0, r0, #0x12000
	addeq sl, r0, sl, lsl #1
	addne r0, r5, #0x12c
	addne r0, r0, #0x12000
	addne sl, r0, sl, lsl #1
	b _023375E8
_02337544:
	ldr r0, [sp, #0x20]
	add r1, sp, #0x28
	bl ov29_022FF958
	cmp r0, #0
	bne _023375DC
	ldr r0, [sp, #0x20]
	add r1, sp, #0x28
	bl ov29_022E2930
	cmp r0, #0
	beq _023375DC
	mov r0, #0
	add r2, sp, #0x2c
	b _02337598
_02337578:
	mov r3, r0, lsl #2
	ldrsh r1, [r2, r3]
	cmp r6, r1
	addeq r1, r2, r3
	ldreqsh r1, [r1, #2]
	cmpeq r7, r1
	beq _023375A0
	add r0, r0, #1
_02337598:
	cmp r0, #6
	blt _02337578
_023375A0:
	cmp r0, #6
	bne _023375CC
	bl sub_0204AED0
	cmp r0, #0
	ldrne r0, _02337798 ; =0x0001213E
	addne r0, r5, r0
	addne sl, r0, sl, lsl #1
	addeq r0, r5, #0x12c
	addeq r0, r0, #0x12000
	addeq sl, r0, sl, lsl #1
	b _023375E8
_023375CC:
	add r0, r5, #0x150
	add r0, r0, #0x12000
	add sl, r0, sl, lsl #1
	b _023375E8
_023375DC:
	add r0, r5, #0x12c
	add r0, r0, #0x12000
	add sl, r0, sl, lsl #1
_023375E8:
	add r0, r5, #0x150
	add r0, r0, #0x12000
	add r0, r0, r8, lsl #1
	ldr r1, _02337798 ; =0x0001213E
	str r0, [sp, #0x18]
	add r0, r5, r1
	add r0, r0, r8, lsl #1
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0x12c
	add r0, r0, #0x12000
	add r0, r0, r8, lsl #1
	str r0, [sp, #0x14]
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x24]
_0233762C:
	mov r0, #0
	str r0, [sp]
	ldrh r2, [sl], #6
	and sb, sb, #0x3f
	and fp, fp, #0x1f
	mov r0, sb
	mov r1, fp
	mov r3, #0
	bl sub_02051D8C
	ldr r0, [sp, #0x1c]
	add fp, fp, #1
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #3
	bne _02337730
	ldr r0, [sp, #0x24]
	add r7, r7, #1
	strh r0, [sp, #0x28]
	ldr r0, [sp, #4]
	cmp r0, #0
	mov r0, #0
	str r0, [sp, #0x1c]
	strh r7, [sp, #0x2a]
	beq _023376A8
	ldrsh r0, [r4]
	cmp r6, r0
	ldreqsh r0, [r4, #2]
	cmpeq r7, r0
	ldreq sl, [sp, #0x18]
	ldrne sl, [sp, #0x14]
	b _02337730
_023376A8:
	ldr r0, [sp, #0x20]
	add r1, sp, #0x28
	bl ov29_022FF958
	cmp r0, #0
	bne _0233772C
	ldr r0, [sp, #0x20]
	add r1, sp, #0x28
	bl ov29_022E2930
	cmp r0, #0
	beq _0233772C
	mov r0, #0
	b _02337700
_023376D8:
	mov r2, r0, lsl #2
	add r1, sp, #0x2c
	ldrsh r1, [r1, r2]
	cmp r6, r1
	addeq r1, sp, #0x2c
	addeq r1, r1, r2
	ldreqsh r1, [r1, #2]
	cmpeq r7, r1
	beq _02337708
	add r0, r0, #1
_02337700:
	cmp r0, #6
	blt _023376D8
_02337708:
	cmp r0, #6
	bne _02337724
	bl sub_0204AED0
	cmp r0, #0
	ldrne sl, [sp, #0x10]
	ldreq sl, [sp, #0x14]
	b _02337730
_02337724:
	ldr sl, [sp, #0x18]
	b _02337730
_0233772C:
	ldr sl, [sp, #0x14]
_02337730:
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0x19
	blt _0233762C
	ldr r0, [sp, #0xc]
	add r8, r8, #1
	add r0, r0, #1
	cmp r8, #3
	add sb, sb, #1
	addeq r6, r6, #1
	moveq r8, #0
	str r0, [sp, #0xc]
	cmp r0, #0x21
	blt _023374D4
	mov r0, #0
	mov r1, r0
	bl sub_02051E60
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337780: .word DUNGEON_PTR
_02337784: .word 0x0001A224
_02337788: .word DIRECTIONS_XY
_0233778C: .word ov29_02352B9C
_02337790: .word ov29_02352D58
_02337794: .word 0x0001A226
_02337798: .word 0x0001213E
	arm_func_end DrawTileGrid

	arm_func_start HideTileGrid
HideTileGrid: ; 0x0233779C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, #0
	mov r5, r8
	mov r6, r8
_023377B0:
	mov r0, r8, lsl #0x10
	mov r7, r6
	mov r4, r0, asr #0x10
_023377BC:
	mov r0, r7, lsl #0x10
	mov r1, r4
	mov r2, r5
	mov r3, r5
	mov r0, r0, asr #0x10
	str r5, [sp]
	bl sub_02051D8C
	add r7, r7, #1
	cmp r7, #0x20
	blt _023377BC
	add r8, r8, #1
	cmp r8, #0x20
	blt _023377B0
	mov r0, #0
	mov r1, r0
	bl sub_02051E60
	ldr r0, _02337818 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x251]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02337818: .word DUNGEON_PTR
	arm_func_end HideTileGrid

	arm_func_start ov29_0233781C
ov29_0233781C: ; 0x0233781C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r4, r7
	mov r5, r7
_0233782C:
	mov r6, r5
_02337830:
	mov r0, r6
	mov r1, r7
	bl GetTileSafe
	add r6, r6, #1
	strh r4, [r0, #2]
	cmp r6, #0x38
	blt _02337830
	add r7, r7, #1
	cmp r7, #0x20
	blt _0233782C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0233781C

	arm_func_start ov29_0233785C
ov29_0233785C: ; 0x0233785C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02337A34 ; =0x0000270F
	mov r3, #0
	ldr r6, _02337A38 ; =DUNGEON_PTR
	mov sb, r3
	rsb r0, r1, #0
	mov r4, #0x1c
_02337878:
	mul r2, r3, r4
	ldr r5, [r6]
	add r3, r3, #1
	add r5, r5, r2
	add r5, r5, #0xe000
	strb sb, [r5, #0xee8]
	ldr r5, [r6]
	cmp r3, #0x20
	add r5, r5, r2
	add r5, r5, #0xe000
	strb sb, [r5, #0xee9]
	ldr r5, [r6]
	add r5, r5, r2
	add r5, r5, #0xee00
	strh r1, [r5, #0xea]
	ldr r5, [r6]
	add r5, r5, r2
	add r5, r5, #0xee00
	strh r1, [r5, #0xec]
	ldr r5, [r6]
	add r5, r5, r2
	add r5, r5, #0xee00
	strh r0, [r5, #0xee]
	ldr r5, [r6]
	add r2, r5, r2
	add r2, r2, #0xee00
	strh r0, [r2, #0xf0]
	blt _02337878
	mov sl, sb
_023378EC:
	add r5, sl, #1
	mov r0, sl, lsl #0x10
	mov r1, r5, lsl #0x10
	ldr fp, _02337A38 ; =DUNGEON_PTR
	mov r8, #0
	mov r6, r0, asr #0x10
	mov r4, r1, asr #0x10
	mov r7, #1
_0233790C:
	mov r0, r8
	mov r1, sl
	bl GetTile
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233797C
	mov r0, #0x1c
	mul r2, r1, r0
	ldr r0, [fp]
	add r0, r0, #0x2e8
	add r0, r0, #0xec00
	strb r7, [r0, r2]
	add r0, r0, r2
	ldrsh r2, [r0, #2]
	cmp r2, r8
	strgth r8, [r0, #2]
	ldrsh r2, [r0, #4]
	cmp r2, sl
	strgth r6, [r0, #4]
	ldrsh r3, [r0, #6]
	add r2, r8, #1
	cmp r3, r2
	strlth r2, [r0, #6]
	ldrsh r2, [r0, #8]
	cmp r2, r5
	strlth r4, [r0, #8]
	cmp sb, r1
	andlt sb, r1, #0xff
_0233797C:
	add r8, r8, #1
	cmp r8, #0x38
	blt _0233790C
	add sl, sl, #1
	cmp sl, #0x20
	blt _023378EC
	mov r2, #0x18
	ldr r7, _02337A38 ; =DUNGEON_PTR
	mov r1, #0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, #0x1c
_023379B0:
	mul sl, r1, r6
	ldr r0, [r7]
	add r0, r0, #0x2e8
	add r0, r0, #0xec00
	ldrb r8, [r0, sl]
	add r0, r0, sl
	cmp r8, #0
	beq _02337A10
	ldrsh r8, [r0, #2]
	sub r8, r8, #1
	mul sl, r8, r2
	str sl, [r0, #0xc]
	ldrsh r8, [r0, #4]
	sub r8, r8, #1
	mul sl, r8, r3
	str sl, [r0, #0x10]
	ldrsh r8, [r0, #6]
	add r8, r8, #1
	mul sl, r8, r4
	str sl, [r0, #0x14]
	ldrsh r8, [r0, #8]
	add r8, r8, #1
	mul sl, r8, r5
	str sl, [r0, #0x18]
_02337A10:
	add r1, r1, #1
	cmp r1, #0x20
	blt _023379B0
	ldr r0, _02337A38 ; =DUNGEON_PTR
	add r1, sb, #1
	ldr r0, [r0]
	add r0, r0, #0xe000
	strb r1, [r0, #0xee4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337A34: .word 0x0000270F
_02337A38: .word DUNGEON_PTR
	arm_func_end ov29_0233785C

	arm_func_start DiscoverMinimap
DiscoverMinimap: ; 0x02337A3C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTile
	ldrb r4, [r0, #7]
	bl GetVisibilityRange
	ldr r1, _02337B28 ; =DUNGEON_PTR
	ldr r3, [r1]
	add r1, r3, #0x1a000
	ldrb r2, [r1, #0x23e]
	cmp r2, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r1, [r1, #0x250]
	cmp r1, #0
	bne _02337A84
	cmp r4, #0xff
	bne _02337AA0
_02337A84:
	ldrsh r2, [r5]
	ldrsh r1, [r5, #2]
	sub r4, r2, r0
	sub r7, r1, r0
	add r5, r2, r0
	add r6, r1, r0
	b _02337B1C
_02337AA0:
	add r0, r3, #0x2e8
	add r1, r0, #0xec00
	mov r0, #0x1c
	mla r2, r4, r0, r1
	ldrb r0, [r2, #1]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, #1
	strb r0, [r2, #1]
	ldrsh r1, [r2, #2]
	ldrsh r0, [r2, #4]
	ldrsh r5, [r2, #6]
	ldrsh r6, [r2, #8]
	sub r4, r1, #1
	sub r7, r0, #1
	b _02337B1C
_02337AE0:
	mov r8, r4
	b _02337B10
_02337AE8:
	mov r0, r8
	mov r1, r7
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r7
	orr r2, r2, #3
	strh r2, [r0, #2]
	mov r0, r8
	bl DrawMinimapTile
	add r8, r8, #1
_02337B10:
	cmp r8, r5
	ble _02337AE8
	add r7, r7, #1
_02337B1C:
	cmp r7, r6
	ble _02337AE0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02337B28: .word DUNGEON_PTR
	arm_func_end DiscoverMinimap

	arm_func_start PositionHasItem
PositionHasItem: ; 0x02337B2C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldrsh r0, [r1]
	ldrsh r1, [r1, #2]
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end PositionHasItem

	arm_func_start PositionHasMonster
PositionHasMonster: ; 0x02337B68
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldrsh r0, [r1]
	ldrsh r1, [r1, #2]
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02337B94
	ldr r1, [r0]
	cmp r1, #1
	ldmeqia sp!, {r3, pc}
_02337B94:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end PositionHasMonster

	arm_func_start TrySmashWall
TrySmashWall: ; 0x02337B9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	mov r5, #0
	bl GetTileSafe
	ldrh r1, [r0]
	tst r1, #3
	bne _02337C4C
	ldrh r1, [r0]
	tst r1, #0x100
	bne _02337C4C
	tst r1, #0x10
	bne _02337C4C
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	mov r5, #1
	sub r7, r5, #2
	orr r1, r1, #1
	strh r1, [r0]
	mov r4, r7
_02337BF4:
	mov r6, r4
_02337BF8:
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	add r0, r6, r0
	add r1, r7, r1
	bl ov29_02336694
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	add r0, r6, r0
	add r1, r7, r1
	bl DetermineTileWalkableNeighbors
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	add r0, r6, r0
	add r1, r7, r1
	bl DrawMinimapTile
	add r6, r6, #1
	cmp r6, #1
	ble _02337BF8
	add r7, r7, #1
	cmp r7, #1
	ble _02337BF4
_02337C4C:
	cmp r5, #0
	beq _02337C9C
	ldr r4, _02337CA4 ; =DUNGEON_PTR
	mov r6, #0
_02337C5C:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__02337CA8
	cmp r0, #0
	beq _02337C84
	mov r0, r7
	bl ov29_02304BAC
_02337C84:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02337C5C
	bl UpdateTrapsVisibility
	mov r0, r8
	bl ov29_022E66C4
_02337C9C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02337CA4: .word DUNGEON_PTR
	arm_func_end TrySmashWall
