	.include "asm/macros.inc"
	.include "overlay_29_022F9194.inc"

	.text

	arm_func_start SetMonsterTypeAndAbility
SetMonsterTypeAndAbility: ; 0x022F9194
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, #0x25
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F91D8
	mov r0, r5
	bl GetApparentWeather
	mov r1, #6
	mul r2, r0, r1
	ldr r1, _022F9234 ; =CASTFORM_WEATHER_ATTRIBUTE_TABLE
	mov r0, #0
	ldrb r1, [r1, r2]
	strb r1, [r4, #0x5e]
	strb r0, [r4, #0x5f]
	b _022F91FC
_022F91D8:
	mov r5, #0
_022F91DC:
	ldrsh r0, [r4, #2]
	mov r1, r5
	bl GetType
	add r1, r4, r5
	add r5, r5, #1
	strb r0, [r1, #0x5e]
	cmp r5, #2
	blt _022F91DC
_022F91FC:
	mov r5, #0
_022F9200:
	ldrsh r0, [r4, #2]
	mov r1, r5
	bl GetAbility
	add r1, r4, r5
	add r5, r5, #1
	strb r0, [r1, #0x60]
	cmp r5, #2
	blt _022F9200
	ldr r0, _022F9238 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xe]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F9234: .word CASTFORM_WEATHER_ATTRIBUTE_TABLE
_022F9238: .word DUNGEON_PTR
	arm_func_end SetMonsterTypeAndAbility

	arm_func_start TryActivateSlowStart
TryActivateSlowStart: ; 0x022F923C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov r7, #1
	ldr r5, _022F92D0 ; =0x00000C17
	ldr r4, _022F92D4 ; =DUNGEON_PTR
	mov r6, sb
	mov fp, r7
	mov r8, #0x5e
_022F925C:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xad4]
#else
	ldr sl, [r0, #0xb78]
#endif
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F92C0
	mov r0, sl
	mov r1, r8
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F92C0
	mov r0, r7
	mov r1, sl
	mov r2, r6
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, sl
	mov r1, sl
	mov r2, fp
	mov r3, #0
	bl LowerSpeed
_022F92C0:
	add sb, sb, #1
	cmp sb, #0x14
	blt _022F925C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022F92D0: .word 0x00000956
#else
_022F92D0: .word 0x00000C17
#endif
_022F92D4: .word DUNGEON_PTR
	arm_func_end TryActivateSlowStart

	arm_func_start TryActivateArtificialWeatherAbilities
TryActivateArtificialWeatherAbilities: ; 0x022F92D8
#ifdef JAPAN
#define TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET -0xA4
#else
#define TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl IsSecretFloor
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _022F9404 ; =DUNGEON_PTR
	ldr r1, [r4]
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	strb sb, [r1, #0xe]
	ldr r0, [r4]
	mov r5, #1
	add r0, r0, #0xc000
	strb sb, [r0, #0xd5d + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
	mov r6, r5
	mov r7, r5
	mov r8, r5
	mov fp, r5
_022F9324:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb78 + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F93F4
	mov r0, sl
	mov r1, #4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r8, [r0, #0xae]
#else
	addne r0, r0, #0xcd00
	strneh r8, [r0, #0x52]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x1c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r7, [r0, #0xaa]
#else
	addne r0, r0, #0xcd00
	strneh r7, [r0, #0x4e]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x31
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r6, [r0, #0xa8]
#else
	addne r0, r0, #0xcd00
	strneh r6, [r0, #0x4c]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x78
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r5, [r0, #0xb0]
#else
	addne r0, r0, #0xcd00
	strneh r5, [r0, #0x54]
#endif
_022F93C0:
	mov r0, sl
	mov r1, #8
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _022F93E8
	mov r0, sl
	mov r1, #0x2d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F93F4
_022F93E8:
	ldr r0, [r4]
	add r0, r0, #0xc000
	strb fp, [r0, #0xd5d + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
_022F93F4:
	add sb, sb, #1
	cmp sb, #0x14
	blt _022F9324
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9404: .word DUNGEON_PTR
	arm_func_end TryActivateArtificialWeatherAbilities

	arm_func_start GetMonsterApparentId
GetMonsterApparentId: ; 0x022F9408
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _022F94A8
	ldr r2, _022F94E0 ; =0x0000017B
	cmp r1, r2
	blt _022F945C
	add r2, r2, #3
	cmp r1, r2
	bgt _022F945C
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldreq r0, _022F94E0 ; =0x0000017B
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetApparentWeather
	mov r1, #6
	mul r1, r0, r1
	ldr r0, _022F94E4 ; =ov10_022C4C6E
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
_022F945C:
	ldr r0, _022F94E8 ; =0x000003D3
	cmp r1, r0
	blt _022F94D8
	add r0, r0, #3
	cmp r1, r0
	bgt _022F94D8
	mov r0, r4
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldreq r0, _022F94E8 ; =0x000003D3
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetApparentWeather
	mov r1, #6
	mul r1, r0, r1
	ldr r0, _022F94EC ; =ov10_022C4C70
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
_022F94A8:
	ldr r0, _022F94E0 ; =0x0000017B
	cmp r1, r0
	blt _022F94C0
	add r2, r0, #3
	cmp r1, r2
	ldmleia sp!, {r4, pc}
_022F94C0:
	ldr r0, _022F94E8 ; =0x000003D3
	cmp r1, r0
	blt _022F94D8
	add r2, r0, #3
	cmp r1, r2
	ldmleia sp!, {r4, pc}
_022F94D8:
	mov r0, r1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F94E0: .word 0x0000017B
_022F94E4: .word ov10_022C4C6E
_022F94E8: .word 0x000003D3
_022F94EC: .word ov10_022C4C70
	arm_func_end GetMonsterApparentId

	arm_func_start TryActivateTraceAndColorChange
TryActivateTraceAndColorChange: ; 0x022F94F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne sb, r8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r5, [sb, #0xb4]
	ldr r6, [r8, #0xb4]
	ldrb r0, [r5, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r6, #0x60]
	mvn r4, #0
	cmp r0, #0x28
	ldrb r0, [r6, #0x61]
	moveq r4, #0
	cmp r0, #0x28
	moveq r4, #1
	cmp r4, #0
	blt _022F95FC
	ldrb r1, [r5, #0x60]
	ldrb r2, [r5, #0x61]
	mov r0, #0
	cmp r1, #0
	strneb r1, [sp]
	addne r0, r0, #1
	cmp r2, #0
	addne r1, sp, #0
	strneb r2, [r1, r0]
	addne r0, r0, #1
	cmp r0, #0
	mvneq r0, #0
	beq _022F95A0
	cmp r0, #1
	moveq r0, #0
	beq _022F95A0
	bl DungeonRandInt
_022F95A0:
	cmp r0, #0
	blt _022F95FC
	add r1, sp, #0
	ldrb r3, [r1, r0]
	ldr r1, _022F96BC ; =DUNGEON_PTR
	add r2, r6, r4
	strb r3, [r2, #0x60]
	mov r0, #0
	ldr r3, [r1]
	mov r4, #1
	mov r1, r8
	mov r2, r0
	strb r4, [r3, #0xe]
	bl SubstitutePlaceholderStringTags
	ldr r2, _022F96C0 ; =0x00000C18
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	bl ov29_022E6260
	mov r0, sb
	mov r1, r8
	bl TryEndStatusWithAbility
_022F95FC:
#ifdef JAPAN
	ldrb r0, [r6, #0x160]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r3, #0
#else
	ldrb r0, [r6, #0x164]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
#endif
	mov r0, sb
	mov r1, r8
	mov r2, #0x3b
#ifdef JAPAN
	strb r3, [r6, #0x160]
#else
	mov r3, #1
	strb r4, [r6, #0x164]
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r7
	bl GetMoveTypeForMonster
	ldrh r1, [r7, #4]
	mov r4, r0
	cmp r1, #0x1f
	bne _022F9658
	mov r0, sb
	bl GetApparentWeather
	ldr r1, _022F96C4 ; =WEATHER_BALL_TYPE_TABLE
	ldrb r4, [r1, r0]
_022F9658:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	mov r1, r4
	bl MonsterIsType
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	strb r4, [r6, #0x5e]
	strb r0, [r6, #0x5f]
	mov r3, #1
	mov r1, r8
	mov r2, r0
	strb r3, [r6, #0xff]
	bl SubstitutePlaceholderStringTags
	ldrb r1, [r6, #0x5e]
	mov r0, #0
	bl ov29_0234B084
	ldr r2, _022F96C8 ; =0x00000C19
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	bl ov29_022E647C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F96BC: .word DUNGEON_PTR
#ifdef JAPAN
_022F96C0: .word 0x00000957
_022F96C4: .word WEATHER_BALL_TYPE_TABLE
_022F96C8: .word 0x00000958
#else
_022F96C0: .word 0x00000C18
_022F96C4: .word WEATHER_BALL_TYPE_TABLE
_022F96C8: .word 0x00000C19
#endif
	arm_func_end TryActivateTraceAndColorChange

	arm_func_start DefenderAbilityIsActive__022F96CC
DefenderAbilityIsActive__022F96CC: ; 0x022F96CC
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	cmp r6, r5
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
#endif
	beq _022F9710
	bl IsMonster__022F9720
	cmp r0, #0
#ifdef JAPAN
	beq _022F9710
	mov r0, r6
#else
	cmpne r4, #0
	beq _022F9710
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_022F9710:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022F9710:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__022F96CC
