	.include "asm/macros.inc"
	.include "overlay_29_023047DC.inc"

	.text

	arm_func_start ov29_023047DC
ov29_023047DC: ; 0x023047DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _0230482C ; =DUNGEON_PTR
	mov r5, #0
_023047E8:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__023047B8
	cmp r0, #0
	beq _0230481C
	mov r0, r6
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r6
	bl ov29_02304830
_0230481C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _023047E8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230482C: .word DUNGEON_PTR
	arm_func_end ov29_023047DC

	arm_func_start ov29_02304830
ov29_02304830: ; 0x02304830
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r2, _0230494C ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r2]
	ldr r4, [r5, #0xb4]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldr r2, [r0, #0x188]
	ldrb r3, [r0, #0x1a1]
#else
	ldr r2, [r0, #0x22c]
	ldrb r3, [r0, #0x245]
#endif
	cmp r5, r2
	mov r2, #0
	strb r2, [r5, #0x28]
	strb r1, [r5, #0xaf]
	and r0, r1, #0xff
	strb r0, [r5, #0xae]
	ldrb r0, [r4, #0x4c]
	moveq r3, #0
	strb r0, [r5, #0xb1]
	strb r0, [r5, #0xb0]
	strb r2, [r5, #0xb3]
	ldrb r0, [r4, #0xd8]
	ldrsh r6, [r5, #0xac]
	cmp r0, #2
	beq _023048E0
	cmp r3, #0
	bne _023048E0
	ldrsh r1, [r5, #0xa8]
	add r0, r5, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	ldrb r1, [r5, #0xaa]
	and r0, r0, #3
	mov r3, r6, lsl #0x10
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r5, #0xae]
	ldrb r2, [r5, #0xb0]
	add r0, r5, #0x2c
	mov r3, r3, asr #0x10
	bl SetAndPlayAnimationForAnimationControl
	b _0230492C
_023048E0:
	ldr r0, _02304950 ; =0x00000229
	bl DungeonGetSpriteIndex
	mov r1, r0
	add r0, r5, #0x2c
	bl SetSpriteIdForAnimationControl
	bl Rand16Bit
	mov r1, r6, lsl #0x10
	mov r3, r1, asr #0x10
	ldrb r2, [r5, #0xaa]
	and r1, r0, #3
	mov r0, #0
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0x2c
	ldrb r1, [r5, #0xae]
	ldrb r2, [r5, #0xb0]
	bl SetAndPlayAnimationForAnimationControl
_0230492C:
	mov r0, #0
	strb r0, [r5, #0xb2]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _02304944
	bl ov29_022E8104
_02304944:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230494C: .word DUNGEON_PTR
_02304950: .word 0x00000229
	arm_func_end ov29_02304830

	arm_func_start ov29_02304954
ov29_02304954: ; 0x02304954
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _023049A4 ; =DUNGEON_PTR
	mov r5, #0
_02304960:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__023047B8
	cmp r0, #0
	beq _02304994
	mov r0, r6
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r6
	bl ov29_02304830
_02304994:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02304960
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023049A4: .word DUNGEON_PTR
	arm_func_end ov29_02304954

	arm_func_start ChangeMonsterAnimation
ChangeMonsterAnimation: ; 0x023049A8
	ldr r3, [r0]
	cmp r3, #1
	bxne lr
	mov r3, #0
	strb r3, [r0, #0x28]
	strb r1, [r0, #0xae]
	cmp r2, #0
	bxlt lr
	cmp r2, #8
	strltb r2, [r0, #0xb0]
	bx lr
	arm_func_end ChangeMonsterAnimation

	arm_func_start ov29_023049D4
ov29_023049D4: ; 0x023049D4
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #1
	ldmneia sp!, {r3, pc}
	ldrb r3, [r0, #0xaf]
	cmp r3, r1
	ldreqb r3, [r0, #0xb1]
	cmpeq r3, r2
	ldmeqia sp!, {r3, pc}
	bl ChangeMonsterAnimation
	ldmia sp!, {r3, pc}
	arm_func_end ov29_023049D4

	arm_func_start ov29_02304A00
ov29_02304A00: ; 0x02304A00
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r2, [r5]
	mov r4, r1
	cmp r2, #1
	ldmneia sp!, {r3, r4, r5, pc}
	bl GetIdleAnimationId
	strb r0, [r5, #0xae]
	mov r0, #0
	strb r0, [r5, #0x28]
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, pc}
	cmp r4, #8
	ldrlt r0, [r5, #0xb4]
	andlt r1, r4, #7
	strltb r1, [r0, #0x4c]
	strltb r1, [r5, #0xb0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02304A00

	arm_func_start ov29_02304A48
ov29_02304A48: ; 0x02304A48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r2, [r5]
	mov r4, r1
	cmp r2, #1
	ldmneia sp!, {r3, r4, r5, pc}
	bl GetIdleAnimationId
	strb r0, [r5, #0xae]
	mov r0, #0
	strb r0, [r5, #0x28]
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, pc}
	cmp r4, #8
	strltb r4, [r5, #0xb0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02304A48

	arm_func_start ov29_02304A84
ov29_02304A84: ; 0x02304A84
	ldr r2, [r0]
	cmp r2, #1
	bxne lr
	mov r2, #6
	strb r2, [r0, #0xae]
	mov r2, #0
	strb r2, [r0, #0x28]
	cmp r1, #0
	bxlt lr
	cmp r1, #8
	strltb r1, [r0, #0xb0]
	bx lr
	arm_func_end ov29_02304A84

	arm_func_start GetIdleAnimationId
GetIdleAnimationId: ; 0x02304AB4
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	bne _02304AE8
	ldrsh r0, [r1, #4]
	cmp r0, #0xb9
	ldreqb r0, [r1, #0xbe]
	cmpeq r0, #0x7f
	moveq r0, #7
	movne r0, #5
	bx lr
_02304AE8:
	ldrb r0, [r1, #0xd2]
	cmp r0, #1
	moveq r0, #0xb
	movne r0, #7
	bx lr
	arm_func_end GetIdleAnimationId

	arm_func_start ov29_02304AFC
ov29_02304AFC: ; 0x02304AFC
	ldr r2, [r0, #0xb4]
	and r1, r1, #7
	ldr ip, _02304B10 ; =ov29_02304A48
	strb r1, [r2, #0x4c]
	bx ip
	.align 2, 0
_02304B10: .word ov29_02304A48
	arm_func_end ov29_02304AFC

	arm_func_start ov29_02304B14
ov29_02304B14: ; 0x02304B14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl EntityIsValid__023047B8
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r6, [r7, #0xb4]
	mov r5, #0
	mov r4, #0x21
	b _02304B58
_02304B38:
	mov r0, r4
	bl AdvanceFrame
	ldrsh r0, [r6, #4]
	ldrb r1, [r7, #0xaf]
	bl sub_02053038
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r5, r5, #1
_02304B58:
	cmp r5, #0x64
	blt _02304B38
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_02304B14

	arm_func_start DetermineAllMonsterShadow
DetermineAllMonsterShadow: ; 0x02304B64
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _02304BA8 ; =DUNGEON_PTR
	mov r5, #0
_02304B70:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__023047B8
	cmp r0, #0
	beq _02304B98
	mov r0, r6
	bl DetermineMonsterShadow
_02304B98:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02304B70
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02304BA8: .word DUNGEON_PTR
	arm_func_end DetermineAllMonsterShadow

	arm_func_start DetermineMonsterShadow
DetermineMonsterShadow: ; 0x02304BAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	bl GetTileAtEntity
	ldrh r1, [r0]
	ldr r5, [r4, #0xb4]
	ldrsh r0, [r5, #4]
	and r6, r1, #3
	bl GetShadowSize
	mov r4, r0
	cmp r6, #3
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r6, #1
	bne _02304BF8
	bl IsWaterTileset
	cmp r0, #0
	ldrne r0, _02304C30 ; =ov29_02352808
	ldrneb r4, [r0, r4]
	b _02304C24
_02304BF8:
	cmp r6, #2
	bne _02304C24
	ldr r0, _02304C34 ; =DUNGEON_PTR
	ldr r1, _02304C38 ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	ldrne r0, _02304C30 ; =ov29_02352808
	ldrneb r4, [r0, r4]
_02304C24:
	mov r0, r4
#ifdef JAPAN
	strb r4, [r5, #0x21c]
#else
	strb r4, [r5, #0x220]
#endif
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02304C30: .word ov29_02352808
_02304C34: .word DUNGEON_PTR
_02304C38: .word SECONDARY_TERRAIN_TYPES
	arm_func_end DetermineMonsterShadow

	arm_func_start ov29_02304C3C
ov29_02304C3C: ; 0x02304C3C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r0
	mov sl, r1
	bl EntityIsValid__023047B8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r4]
	cmp r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r4, #0xb4]
	mov r0, r4
	ldrb r7, [r1, #0x4c]
	mov r8, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov sb, #0
	mov r6, #2
	mov r5, #0x43
	b _02304CC0
_02304C8C:
	mov r0, r4
	mov r1, r8
	bl ov29_02304A48
	mov r0, r6
	mov r1, r5
	bl ov29_022EA370
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	and r8, r1, #7
	mov sb, r0, asr #0x10
_02304CC0:
	cmp sb, sl, lsl #3
	blt _02304C8C
	mov r6, #2
	mov r5, #0x43
	b _02304CFC
_02304CD4:
	mov r0, r4
	mov r1, r8
	bl ov29_02304A48
	mov r0, r6
	mov r1, r5
	bl ov29_022EA370
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	and r8, r0, #7
_02304CFC:
	cmp r8, r7
	bne _02304CD4
	mov r0, r4
	mov r1, r8
	bl ov29_02304A48
	mov r0, #2
	mov r1, #0x43
	bl ov29_022EA370
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_02304C3C

	arm_func_start ov29_02304D20
ov29_02304D20: ; 0x02304D20
#ifdef JAPAN
#define OV29_02304D20_OFFSET -4
#else
#define OV29_02304D20_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	ldr sb, [r6, #0xb4]
	mov r5, r1
	add r0, sb, #0x200
	ldrsh r0, [r0, #0xc + OV29_02304D20_OFFSET]
	mov r4, r2
	cmp r0, #4
	movge r0, #0
	strgeh r0, [sb, #0x4a]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_0204AEE0
	cmp r0, #0
	movne r1, #2
	ldr r2, _02304FD4 ; =ov29_0237C9CC
	moveq r1, #1
	str r1, [r2]
	add r0, sb, #0x200
	ldrsh r3, [r0, #0xc + OV29_02304D20_OFFSET]
	mov r1, #0x1c
	add r0, sb, #0x19c + OV29_02304D20_OFFSET
	smulbb sl, r3, r1
	add r7, r0, sl
	mov r1, #0
	strb r1, [r7, #0x1a]
	str r5, [r7, #0xc]
	ldrsh r8, [r6, #4]
	mov r3, r5, lsl #2
	ldr r1, _02304FD8 ; =ov29_0235173C
	strh r8, [r0, sl]
	ldrsh r5, [r6, #6]
	ldr r0, _02304FDC ; =ov29_0235173E
	ldrsh r1, [r1, r3]
	strh r5, [r7, #2]
	ldrsh r5, [r4]
	ldrsh r0, [r0, r3]
	str r5, [r7, #4]
	ldrsh r3, [r4, #2]
	str r3, [r7, #8]
	ldr r3, [r2]
	mul r1, r3, r1
	str r1, [r7, #0x10]
	ldr r1, [r2]
	mul r0, r1, r0
	str r0, [r7, #0x14]
	bl sub_0204AEE0
	cmp r0, #0
	movne r1, #2
	ldr r5, _02304FD4 ; =ov29_0237C9CC
	moveq r1, #1
	add r0, sb, #0x200
	str r1, [r5]
	ldrsh r1, [r0, #0xc + OV29_02304D20_OFFSET]
	add r1, r1, #1
	strh r1, [r0, #0xc + OV29_02304D20_OFFSET]
	ldrsh r0, [r0, #0xc + OV29_02304D20_OFFSET]
	cmp r0, #2
	bne _02304E6C
	ldr r1, [r5]
	mov r0, #0x18
	mov r1, r1, lsl #1
	bl _s32_div_f
	add r1, sb, #0x100
	strh r0, [r1, #0xb4 + OV29_02304D20_OFFSET]
	ldr r0, [sb, #0x1ac + OV29_02304D20_OFFSET]
	mov r1, r5
	mov r0, r0, lsl #1
	str r0, [sb, #0x1ac + OV29_02304D20_OFFSET]
	ldr r2, [sb, #0x1b0 + OV29_02304D20_OFFSET]
	mov r0, #0x18
	mov r2, r2, lsl #1
	str r2, [sb, #0x1b0 + OV29_02304D20_OFFSET]
	ldr r1, [r1]
	mov r1, r1, lsl #1
	bl _s32_div_f
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	mov r0, r0, lsl #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x14]
	mov r0, r0, lsl #1
	str r0, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02304E6C:
	cmp r0, #3
	bne _02304F14
	mov r6, #0
	mov r4, #0x18
	mov sl, #0x1c
_02304E80:
	mla r8, r6, sl, sb
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r1, lsl #1
	bl _s32_div_f
	add r1, r8, #0x100
	strh r0, [r1, #0xb4 + OV29_02304D20_OFFSET]
	ldr r0, [r8, #0x1ac + OV29_02304D20_OFFSET]
	add r6, r6, #1
	add r0, r0, r0, lsl #1
	str r0, [r8, #0x1ac + OV29_02304D20_OFFSET]
	ldr r0, [r8, #0x1b0 + OV29_02304D20_OFFSET]
	cmp r6, #2
	add r0, r0, r0, lsl #1
	str r0, [r8, #0x1b0 + OV29_02304D20_OFFSET]
	ldr r0, [r8, #0x1ac + OV29_02304D20_OFFSET]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r8, #0x1ac + OV29_02304D20_OFFSET]
	ldr r0, [r8, #0x1b0 + OV29_02304D20_OFFSET]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r8, #0x1b0 + OV29_02304D20_OFFSET]
	blt _02304E80
	ldr r1, _02304FD4 ; =ov29_0237C9CC
	mov r0, #0x18
	ldr r1, [r1]
	add r1, r1, r1, lsl #1
	bl _s32_div_f
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	add r0, r0, r0, lsl #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x14]
	add r0, r0, r0, lsl #1
	str r0, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02304F14:
	cmp r0, #4
	bne _02304FC0
	mov r8, #0
	mov r6, #0x18
	mov fp, #3
	mov r4, #0x1c
_02304F2C:
	mla sl, r8, r4, sb
	ldr r1, [r5]
	mov r0, r6
	mov r1, r1, lsl #2
	bl _s32_div_f
	add r1, sl, #0x100
	strh r0, [r1, #0xb4 + OV29_02304D20_OFFSET]
	ldr r0, [sl, #0x1ac + OV29_02304D20_OFFSET]
	mov r1, fp
	mov r0, r0, lsl #2
	str r0, [sl, #0x1ac + OV29_02304D20_OFFSET]
	ldr r0, [sl, #0x1b0 + OV29_02304D20_OFFSET]
	mov r0, r0, lsl #2
	str r0, [sl, #0x1b0 + OV29_02304D20_OFFSET]
	ldr r0, [sl, #0x1ac + OV29_02304D20_OFFSET]
	bl _s32_div_f
	str r0, [sl, #0x1ac + OV29_02304D20_OFFSET]
	ldr r0, [sl, #0x1b0 + OV29_02304D20_OFFSET]
	mov r1, #3
	bl _s32_div_f
	add r8, r8, #1
	str r0, [sl, #0x1b0 + OV29_02304D20_OFFSET]
	cmp r8, #3
	blt _02304F2C
	ldr r1, _02304FD4 ; =ov29_0237C9CC
	mov r0, #0x18
	ldr r1, [r1]
	mov r1, r1, lsl #2
	bl _s32_div_f
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	mov r0, r0, lsl #2
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x14]
	mov r0, r0, lsl #2
	str r0, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02304FC0:
	ldr r1, [r5]
	mov r0, #0x18
	bl _s32_div_f
	strh r0, [r7, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02304FD4: .word ov29_0237C9CC
_02304FD8: .word ov29_0235173C
_02304FDC: .word ov29_0235173E
	arm_func_end ov29_02304D20

	arm_func_start DisplayActions
DisplayActions: ; 0x02304FE0
#ifdef JAPAN
#define DISPLAY_ACTIONS_OFFSET -4
#define DISPLAY_ACTIONS_OFFSET_2 -0xA4
#else
#define DISPLAY_ACTIONS_OFFSET 0
#define DISPLAY_ACTIONS_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _02305580 ; =ov29_0237C9C1
	mov r6, #0
	mov sl, r0
	mov r7, r6
	strb r6, [r1]
	bl sub_0204AEE0
	cmp r0, #0
	mov r5, #0
	movne r1, #2
	ldr r0, _02305584 ; =ov29_0237C9CC
	moveq r1, #1
	str r1, [r0]
	mov r4, r5
	mov fp, r5
_02305020:
	ldr r0, _02305588 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78 + DISPLAY_ACTIONS_OFFSET_2]
	mov r0, r8
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _02305160
	ldr sb, [r8, #0xb4]
	add r0, sb, #0x200
	ldrsh r0, [r0, #0xc + DISPLAY_ACTIONS_OFFSET]
	cmp r0, #0
	bne _023050EC
	ldrb r0, [sb, #0x151 + DISPLAY_ACTIONS_OFFSET]
	cmp r0, #0
	beq _02305160
	strb r4, [sb, #0x151 + DISPLAY_ACTIONS_OFFSET]
	add r0, sb, #0x100
	ldrsh r1, [r0, #0x7e + DISPLAY_ACTIONS_OFFSET]
	cmp r1, #0
	ldreqsh r0, [r0, #0x80 + DISPLAY_ACTIONS_OFFSET]
	cmpeq r0, #0
	beq _02305160
	ldrsh r0, [r8, #4]
	cmp r1, r0
	addeq r0, sb, #0x100
	ldreqsh r1, [r0, #0x80 + DISPLAY_ACTIONS_OFFSET]
	ldreqsh r0, [r8, #6]
	cmpeq r1, r0
	beq _02305160
	mov r0, r8
	mov r1, #1
	bl CheckVariousStatuses2
	cmp r0, #0
	beq _023050C0
	mov r0, r8
	bl CheckVariousStatuses
	cmp r0, #0
	bne _02305160
_023050C0:
	add r0, r8, #4
	add r1, sb, #0x7e + DISPLAY_ACTIONS_OFFSET
	add r1, r1, #0x100
	bl GetDirectionTowardsPosition
	mov r1, r0
	ldrb r0, [sb, #0x4c]
	cmp r1, r0
	beq _02305160
	mov r0, r8
	bl ov29_02304A48
	b _02305160
_023050EC:
	ldrh r2, [sb]
	mov r0, r8
	add r1, sp, #0xc
	orr r2, r2, #0x2000
	strh r2, [sb]
	ldr r3, [sb, #0x1a0 + DISPLAY_ACTIONS_OFFSET]
	mov r2, #0x18
	mul r2, r3, r2
	add r2, r2, #0xc
	mov r2, r2, lsl #8
	str r2, [sp, #0xc]
	ldr r3, [sb, #0x1a4 + DISPLAY_ACTIONS_OFFSET]
	mov r2, #0x18
	mul r2, r3, r2
	add r2, r2, #0x10
	mov r2, r2, lsl #8
	str r2, [sp, #0x10]
	bl UpdateEntityPixelPos
	ldr r2, [sb, #0x1a8 + DISPLAY_ACTIONS_OFFSET]
	mov r0, r8
	mov r1, #0
	bl ov29_023049D4
	add r0, sb, #0x200
	strh fp, [r0, #0xe + DISPLAY_ACTIONS_OFFSET]
	mov r0, r8
	mov r6, #1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r7, r6
_02305160:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02305020
	cmp r6, #0
	moveq r0, #0
	beq _02305578
	ldr r0, _02305588 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r6, [r1, #0xc4]
	str sl, [r1, #0xc4]
	ldr r0, [r0]
	ldrb r0, [r0, #0x78b]
	cmp r0, #0
	bne _0230532C
	cmp r7, #0
	beq _0230532C
	mov r0, #0x35
	bl ov29_0234BA18
	mov r5, #0
	b _02305314
_023051B0:
	mov r0, #7
	bl AdvanceFrame
	mov sl, #0
	ldr r4, _02305588 ; =DUNGEON_PTR
	mov fp, sl
_023051C4:
	ldr r0, [r4]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78 + DISPLAY_ACTIONS_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _02305304
	ldr sb, [r7, #0xb4]
	add r0, sb, #0x200
	ldrsh r2, [r0, #0xe + DISPLAY_ACTIONS_OFFSET]
	ldrsh r1, [r0, #0xc + DISPLAY_ACTIONS_OFFSET]
	add r3, sb, #0x19c + DISPLAY_ACTIONS_OFFSET
	mov r0, #0x1c
	smlabb r8, r2, r0, r3
	cmp r1, #0
	beq _02305304
	mov r0, r7
	ldr r1, [r8, #0x10]
	ldr r2, [r8, #0x14]
	bl IncrementEntityPixelPosXY
	ldrb r0, [sb, #7]
	cmp r0, #0
	beq _02305258
	ldr r0, [r4]
	add r0, r0, #0x100
	ldrsh r1, [r0, #0xdc]
	cmp r1, #0
	blt _02305258
	ldr r1, [r7, #0xc]
	mov r1, r1, asr #8
	strh r1, [r0, #0xdc]
	ldr r1, [r7, #0x10]
	ldr r0, [r4]
	mov r1, r1, asr #8
	add r0, r0, #0x100
	strh r1, [r0, #0xde]
_02305258:
	ldrsh r0, [r8, #0x18]
	sub r0, r0, #1
	strh r0, [r8, #0x18]
	ldrsh r0, [r8, #0x18]
	cmp r0, #0
	bne _02305304
	add r2, sb, #0x200
	ldrsh r0, [r2, #0xe + DISPLAY_ACTIONS_OFFSET]
	add r0, r0, #1
	strh r0, [r2, #0xe + DISPLAY_ACTIONS_OFFSET]
	ldrsh r1, [r2, #0xe + DISPLAY_ACTIONS_OFFSET]
	ldrsh r0, [r2, #0xc + DISPLAY_ACTIONS_OFFSET]
	cmp r1, r0
	streqh fp, [r2, #0xc + DISPLAY_ACTIONS_OFFSET]
	beq _02305304
	mov r0, #0x1c
	smlabb r0, r1, r0, sb
	ldr r3, [r0, #0x1a0 + DISPLAY_ACTIONS_OFFSET]
	mov r1, #0x18
	mul r1, r3, r1
	add r1, r1, #0xc
	mov r1, r1, lsl #8
	str r1, [sp, #4]
	ldrsh r3, [r2, #0xe + DISPLAY_ACTIONS_OFFSET]
	mov r2, #0x1c
	mov r0, r7
	smlabb r2, r3, r2, sb
	ldr r3, [r2, #0x1a4 + DISPLAY_ACTIONS_OFFSET]
	mov r2, #0x18
	mul r2, r3, r2
	add r2, r2, #0x10
	mov r2, r2, lsl #8
	add r1, sp, #4
	str r2, [sp, #8]
	bl UpdateEntityPixelPos
	add r2, sb, #0x200
	ldrsh r3, [r2, #0xe + DISPLAY_ACTIONS_OFFSET]
	mov r2, #0x1c
	mov r0, r7
	smlabb r2, r3, r2, sb
	ldr r2, [r2, #0x1a8 + DISPLAY_ACTIONS_OFFSET]
	mov r1, #0
	bl ov29_023049D4
_02305304:
	add sl, sl, #1
	cmp sl, #0x14
	blt _023051C4
	add r5, r5, #1
_02305314:
	ldr r1, _02305584 ; =ov29_0237C9CC
	mov r0, #0x18
	ldr r1, [r1]
	bl _s32_div_f
	cmp r5, r0
	blt _023051B0
_0230532C:
	mov r7, #0
	ldr r8, _02305588 ; =DUNGEON_PTR
	mov r4, r7
_02305338:
	ldr r0, [r8]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78 + DISPLAY_ACTIONS_OFFSET_2]
	mov r0, r5
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230537C
	ldr r1, [r5, #0xb4]
	add r0, r1, #0x200
	strh r4, [r0, #0xc + DISPLAY_ACTIONS_OFFSET]
	ldrh r0, [r1]
	tst r0, #0x2000
	beq _0230537C
	mov r0, r5
	mov r1, r4
	bl UpdateEntityPixelPos
_0230537C:
	add r7, r7, #1
	cmp r7, #0x14
	blt _02305338
	bl ov29_02307DD0
	mov r8, #0
_02305390:
	mov sl, #0
	mov fp, sl
	mov r7, #1
	ldr r5, _02305588 ; =DUNGEON_PTR
	ldr r4, _02305580 ; =ov29_0237C9C1
	b _02305530
_023053A8:
	ldr r0, [r5]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78 + DISPLAY_ACTIONS_OFFSET_2]
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	bl IsFloorOver
	cmp r0, #0
	bne _02305538
	ldr r0, [sb, #0xb4]
	cmp r8, #0
	ldrb r1, [r0, #7]
	bne _023053F0
	cmp r1, #0
	beq _0230552C
	b _023053F8
_023053F0:
	cmp r1, #0
	bne _0230552C
_023053F8:
	ldrh r3, [sb, #4]
	ldrh r2, [sb, #6]
	ldrh r1, [r0]
	strh r3, [sp]
	strh r2, [sp, #2]
	tst r1, #0x2000
	bne _02305430
	mov r0, sb
	bl ov29_0234AD10
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	b _023054E4
_02305430:
	bic r1, r1, #0x2000
	strh r1, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0230545C
	add r0, sb, #4
	bl DiscoverMinimap
	mov r0, fp
	bl ov29_022F62CC
	bl CheckLeaderTile
	b _0230547C
_0230545C:
	mov r0, sb
	bl ov29_0234AD10
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	mov r0, sb
	bl CheckNonLeaderTile
_0230547C:
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	bl IsFloorOver
	cmp r0, #0
	bne _02305538
	mov r0, #0
	bl TryForcedLoss
	mov r0, sb
	bl ov29_0230FC24
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	bl IsFloorOver
	cmp r0, #0
	bne _02305538
	mov r0, sb
	bl EnemyEvolution
	bl ov29_02346888
	ldr r1, [r5]
	mov r0, sb
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc4 + DISPLAY_ACTIONS_OFFSET_2]
	bl ov29_02305814
_023054E4:
	mov r0, sb
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _0230552C
	bl IsFloorOver
	cmp r0, #0
	bne _02305538
	ldrsh r1, [sp]
	ldrsh r0, [sb, #4]
	cmp r1, r0
	ldreqsh r1, [sp, #2]
	ldreqsh r0, [sb, #6]
	cmpeq r1, r0
	mov r0, sb
	strneb r7, [r4]
	bl ov29_022F9C74
	mov r0, sb
	bl EnsureCanStandCurrentTile
_0230552C:
	add sl, sl, #1
_02305530:
	cmp sl, #0x14
	blt _023053A8
_02305538:
	add r8, r8, #1
	cmp r8, #2
	blt _02305390
	bl ov29_022EF9C8
	bl IsFloorOver
	cmp r0, #0
	ldrne r1, _02305588 ; =DUNGEON_PTR
	movne r0, #1
	ldrne r1, [r1]
	strne r6, [r1, #0xc4]
	bne _02305578
	bl ov29_022EF9BC
	ldr r1, _02305588 ; =DUNGEON_PTR
	mov r0, #1
	ldr r1, [r1]
	str r6, [r1, #0xc4]
_02305578:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02305580: .word ov29_0237C9C1
_02305584: .word ov29_0237C9CC
_02305588: .word DUNGEON_PTR
	arm_func_end DisplayActions
