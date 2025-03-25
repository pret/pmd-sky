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
	bl DetermineMonsterShadow
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
#ifdef JAPAN
	strb r0, [r1, #0xcb7]
#else
	strb r0, [r1, #0xd5b]
#endif
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
#ifdef JAPAN
	strb r0, [r1, #0xcb8]
#else
	strb r0, [r1, #0xd5c]
#endif
	bl GetLeader
	ldr r1, _023354C0 ; =0x00000CDB
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
	.align 2, 0
_023354B4: .word SPORT_CONDITION_TURN_RANGE
_023354B8: .word DUNGEON_PTR
#ifdef JAPAN
_023354BC: .word 0x00000A1A
_023354C0: .word 0x00000A1B
#else
_023354BC: .word 0x00000CDA
_023354C0: .word 0x00000CDB
#endif
	arm_func_end ActivateSportCondition

	arm_func_start TryActivateWeather
TryActivateWeather: ; 0x023354C4
#ifdef JAPAN
#define TRY_ACTIVATE_WEATHER_OFFSET -0xA4
#else
#define TRY_ACTIVATE_WEATHER_OFFSET 0
#endif
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
#ifdef JAPAN
	add r0, r0, #0xcc00
	ldrh r2, [r0, #0xa6]
	ldrh r1, [r0, #0x96]
	cmp r1, r2
	strloh r2, [r0, #0x96]
	blo _02335524
	bls _02335524
	add r0, r3, #0x96
	add r0, r0, #0xcc00
#else
	add r0, r0, #0xcd00
	ldrh r2, [r0, #0x4a]
	ldrh r1, [r0, #0x3a]
	cmp r1, r2
	strloh r2, [r0, #0x3a]
	blo _02335524
	bls _02335524
	add r0, r3, #0x3a
	add r0, r0, #0xcd00
#endif
	add r0, r0, r8, lsl #1
	bl ov29_022E9A6C
_02335524:
	ldr r1, [fp]
	add r0, r1, r8, lsl #1
#ifdef JAPAN
	add r0, r0, #0xcc00
	ldrh r0, [r0, #0x96]
#else
	add r0, r0, #0xcd00
	ldrh r0, [r0, #0x3a]
#endif
	cmp r4, r0
	movlt r5, r8
	add r8, r8, #1
	movlt r4, r0
	cmp r8, #8
	blt _023354F0
	cmp r5, #0
	addge r0, r1, #0xc000
	strgeb r5, [r0, #0xd38 + TRY_ACTIVATE_WEATHER_OFFSET]
	bge _02335570
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r1, [r0, #0xd39 + TRY_ACTIVATE_WEATHER_OFFSET]
	strb r1, [r0, #0xd38 + TRY_ACTIVATE_WEATHER_OFFSET]
_02335570:
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r1, [r0, #0xd5d + TRY_ACTIVATE_WEATHER_OFFSET]
	cmp r1, #0
	movne r1, #0
	strneb r1, [r0, #0xd38 + TRY_ACTIVATE_WEATHER_OFFSET]
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
	ldrb r1, [r0, #0xd5a + TRY_ACTIVATE_WEATHER_OFFSET]
	cmp r1, #0
	subne r1, r1, #1
	moveq r1, #9
	strb r1, [r0, #0xd5a + TRY_ACTIVATE_WEATHER_OFFSET]
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5b + TRY_ACTIVATE_WEATHER_OFFSET]
	cmp r0, #0
	beq _02335614
#ifdef JAPAN
	add r0, r1, #0xb7
	add r0, r0, #0xcc00
#else
	add r0, r1, #0x5b
	add r0, r0, #0xcd00
#endif
	bl TickStatusTurnCounter
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b + TRY_ACTIVATE_WEATHER_OFFSET]
	cmp r0, #0
	bne _02335614
	bl GetLeader
	ldr r1, _02335668 ; =0x00000C93
	bl LogMessageByIdWithPopupCheckUser
_02335614:
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5c + TRY_ACTIVATE_WEATHER_OFFSET]
	cmp r0, #0
	beq _0233565C
	add r0, r1, #0x15c + TRY_ACTIVATE_WEATHER_OFFSET
	add r0, r0, #0xcc00
	bl TickStatusTurnCounter
	ldr r0, _02335664 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c + TRY_ACTIVATE_WEATHER_OFFSET]
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
#ifdef JAPAN
_02335668: .word 0x000009D3
_0233566C: .word 0x000009D2
#else
_02335668: .word 0x00000C93
_0233566C: .word 0x00000C92
#endif
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
#ifdef JAPAN
	ldr r1, _02335750 ; =ov29_02352B4C
	add r0, sp, #0
	ldr r2, [r1, #0xc]
	ldr ip, [r1, #8]
	str r2, [sp, #4]
	mov r1, #4
	mov r2, #0x3f0
	mov r3, #0x300
	str ip, [sp]
#else
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
#endif
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0x1000
	mov r2, #2
	mov r3, #0
	bl ProcessWte
#ifdef JAPAN
	ldr r1, _02336B28 ; =0x000003F1
	mov r0, #4
#else
	bl GetLanguage
	mov r3, r0, lsl #1
	ldr r1, _02335758 ; =ov29_02353720
	mov r0, #4
	ldrh r1, [r1, r3]
#endif
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
#ifdef JAPAN
_02336B28: .word 0x000003F1
#else
_02335754: .word ov29_0235371C
_02335758: .word ov29_02353720
#endif
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
#if defined(EUROPE)
	ldr r0, _023357F4 ; =ov29_02352B4C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r1, [sp, #4]
	str r0, [sp]
	bl GetLanguage
	ldr r1, _02336244 ; =0x0235431C
	mov r0, r0, lsl #1
	ldrh r2, [r1, r0]
#elif defined(JAPAN)
	ldr r1, _023357F4 ; =ov29_02352B4C
	ldr r2, _023357F8 ; =0x000003EF
	ldr r3, [r1, #4]
	ldr ip, [r1]
	str r3, [sp, #4]
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
#ifdef JAPAN
	add r0, r0, #0x178
#else
	add r0, r0, #0x21c
#endif
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
#ifdef JAPAN
	ldrh r1, [r0, #0x42]
#else
	ldrh r1, [r0, #0x46]
#endif
	sub r2, sp, #4
	movne r6, #1
	strh r1, [r2]
#ifdef JAPAN
	ldrh r0, [r0, #0x44]
#else
	ldrh r0, [r0, #0x48]
#endif
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
#ifdef JAPAN
	mov r6, #8
#else
	mov r6, #0
#endif
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
#ifdef JAPAN
	add r0, sp, #4
	mov r1, r6
	mov r2, #0
#else
	mov r1, r6
	add r0, sp, #4
	mov r2, r1
#endif
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

