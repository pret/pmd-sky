	.include "asm/macros.inc"
	.include "overlay_29_02334D58.inc"

	.text

	arm_func_start ov29_02334D58
ov29_02334D58: ; 0x02334D58
	stmdb sp!, {r3, lr}
	bl IsSecretFloor
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02334DA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x28000
#ifdef JAPAN
	ldrb r0, [r0, #0x612]
#else
	ldrb r0, [r0, #0x6b6]
#endif
	cmp r0, #8
	bne _02334D8C
	mov r0, #8
	bl DungeonRandInt
	and r0, r0, #0xff
_02334D8C:
	bl ov29_02334DA8
	bl TryActivateArtificialWeatherAbilities
	mov r0, #0
	mov r1, #1
	bl TryActivateWeather
	ldmia sp!, {r3, pc}
	.align 2, 0
_02334DA4: .word DUNGEON_PTR
	arm_func_end ov29_02334D58

	arm_func_start ov29_02334DA8
ov29_02334DA8: ; 0x02334DA8
#ifdef JAPAN
#define OV29_02334DA8_OFFSET -0xA4
#else
#define OV29_02334DA8_OFFSET 0
#endif
	ldr r3, _02334E6C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r3]
	add r2, r2, #0xc000
	strb r0, [r2, #0xd39 + OV29_02334DA8_OFFSET]
	ldr r0, [r3]
	add r0, r0, #0xc000
	ldrb r2, [r0, #0xd39 + OV29_02334DA8_OFFSET]
	strb r2, [r0, #0xd38 + OV29_02334DA8_OFFSET]
	ldr r0, [r3]
	add r0, r0, #0xc000
	strb r1, [r0, #0xd5d + OV29_02334DA8_OFFSET]
	mov r0, r1
_02334DDC:
	ldr r2, [r3]
	add r2, r2, r1, lsl #1
#ifdef JAPAN
	add r2, r2, #0xcc00
	strh r0, [r2, #0x96]
	ldr r2, [r3]
	add r2, r2, r1, lsl #1
	add r2, r2, #0xcc00
	add r1, r1, #1
	strh r0, [r2, #0xa6]
#else
	add r2, r2, #0xcd00
	strh r0, [r2, #0x3a]
	ldr r2, [r3]
	add r2, r2, r1, lsl #1
	add r2, r2, #0xcd00
	add r1, r1, #1
	strh r0, [r2, #0x4a]
#endif
	cmp r1, #8
	blt _02334DDC
	ldr r2, _02334E6C ; =DUNGEON_PTR
	mov r3, #9
	ldr r1, [r2]
	add r1, r1, #0xc000
	strb r3, [r1, #0xd5a + OV29_02334DA8_OFFSET]
	ldr r1, [r2]
	add r1, r1, #0xc000
	strb r0, [r1, #0xd5b + OV29_02334DA8_OFFSET]
	ldr r1, [r2]
	add r1, r1, #0xc000
	strb r0, [r1, #0xd5c + OV29_02334DA8_OFFSET]
_02334E34:
	ldr r1, [r2]
	and r3, r0, #0xff
	add r1, r1, r0, lsl #2
	strb r3, [r1, #0x1e0]
	ldr r1, [r2]
	add r1, r1, r0, lsl #2
	strb r3, [r1, #0x1e1]
	ldr r1, [r2]
	add r1, r1, r0, lsl #2
	add r0, r0, #1
	strb r3, [r1, #0x1e2]
	cmp r0, #0x100
	blt _02334E34
	bx lr
	.align 2, 0
_02334E6C: .word DUNGEON_PTR
	arm_func_end ov29_02334DA8

	arm_func_start ov29_02334E70
ov29_02334E70: ; 0x02334E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov r0, #0
	bl GetApparentWeather
	bl GetWeatherColorTable
	mov r5, r0
	mov r0, #0
	bl GetApparentWeather
	ldr r1, [sp]
	bl ov29_022E5FE8
	mov r0, #0x25
	bl AdvanceFrame
	mov r0, #1
	bl AnimationDelayOrSomething
	ldr r0, _0233503C ; =ov29_02353562
	mov r1, #1
	ldrb fp, [r0]
	mov r4, #0
	strb r1, [r0]
	b _0233500C
_02334EC0:
	mov r0, #0x25
	mov r6, #0
	bl AdvanceFrame
	mov r8, r6
_02334ED0:
	ldr r0, _02335040 ; =DUNGEON_PTR
	ldrb r7, [r5, r8, lsl #2]
	ldr sl, [r0]
	add r0, sl, r8, lsl #2
	ldrb sb, [r0, #0x1e0]
	sub r0, sb, r7
	bl abs
	cmp r0, #0xa
	addlt r0, sl, r8, lsl #2
	strltb r7, [r0, #0x1e0]
	blt _02334F28
	cmp sb, r7
	addlo r1, sl, r8, lsl #2
	ldrlob r0, [r1, #0x1e0]
	mov r6, #1
	addlo r0, r0, #0xa
	strlob r0, [r1, #0x1e0]
	blo _02334F28
	addhi r1, sl, r8, lsl #2
	ldrhib r0, [r1, #0x1e0]
	subhi r0, r0, #0xa
	strhib r0, [r1, #0x1e0]
_02334F28:
	ldr r0, _02335040 ; =DUNGEON_PTR
	add r1, r5, r8, lsl #2
	ldr sl, [r0]
	ldrb r7, [r1, #1]
	add r0, sl, r8, lsl #2
	ldrb sb, [r0, #0x1e1]
	sub r0, sb, r7
	bl abs
	cmp r0, #0xa
	addlt r0, sl, r8, lsl #2
	strltb r7, [r0, #0x1e1]
	blt _02334F84
	cmp sb, r7
	addlo r1, sl, r8, lsl #2
	ldrlob r0, [r1, #0x1e1]
	mov r6, #1
	addlo r0, r0, #0xa
	strlob r0, [r1, #0x1e1]
	blo _02334F84
	addhi r1, sl, r8, lsl #2
	ldrhib r0, [r1, #0x1e1]
	subhi r0, r0, #0xa
	strhib r0, [r1, #0x1e1]
_02334F84:
	ldr r0, _02335040 ; =DUNGEON_PTR
	add r1, r5, r8, lsl #2
	ldr sl, [r0]
	ldrb r7, [r1, #2]
	add r0, sl, r8, lsl #2
	ldrb sb, [r0, #0x1e2]
	sub r0, sb, r7
	bl abs
	cmp r0, #0xa
	addlt r0, sl, r8, lsl #2
	strltb r7, [r0, #0x1e2]
	blt _02334FE0
	cmp sb, r7
	addlo r1, sl, r8, lsl #2
	ldrlob r0, [r1, #0x1e2]
	mov r6, #1
	addlo r0, r0, #0xa
	strlob r0, [r1, #0x1e2]
	blo _02334FE0
	addhi r1, sl, r8, lsl #2
	ldrhib r0, [r1, #0x1e2]
	subhi r0, r0, #0xa
	strhib r0, [r1, #0x1e2]
_02334FE0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x100
	blt _02334ED0
	bl ov29_022DE608
	cmp r6, #0
	beq _02335014
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0233500C:
	cmp r4, #0x40
	blt _02334EC0
_02335014:
	ldr r0, _02335040 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xc94]
#else
	ldrb r0, [r0, #0xd38]
#endif
	bl ov29_02338A4C
	ldr r1, _0233503C ; =ov29_02353562
	ldr r0, [sp]
	strb fp, [r1]
	bl ov29_02335044
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233503C: .word ov29_02353562
_02335040: .word DUNGEON_PTR
	arm_func_end ov29_02334E70

	arm_func_start ov29_02335044
ov29_02335044: ; 0x02335044
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _023350D4 ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldr r4, [r0, #0x188]
#else
	ldr r4, [r0, #0x22c]
#endif
	cmp r4, #0
	bne _0233506C
	bl GetLeader
	mov r4, r0
_0233506C:
	cmp r5, #0
	beq _02335094
	mov r0, #0
	bl GetApparentWeather
#ifdef JAPAN
	add r0, r0, #0x56
	add r0, r0, #0xc00
#else
	add r0, r0, #0x45
	add r0, r0, #0xa00
#endif
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl LogMessageByIdWithPopupCheckUser
_02335094:
	ldr r4, _023350D4 ; =DUNGEON_PTR
	mov r5, #0
_0233509C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__023350D8
	cmp r0, #0
	beq _023350C4
	mov r0, r6
	bl TryWeatherFormChange
_023350C4:
	add r5, r5, #1
	cmp r5, #0x14
	blt _0233509C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023350D4: .word DUNGEON_PTR
	arm_func_end ov29_02335044
