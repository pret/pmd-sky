	.include "asm/macros.inc"
	.include "overlay_29_02328030.inc"

	.text

	arm_func_start DoMoveRecoverHp
DoMoveRecoverHp: ; 0x02328030
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	ldr r2, _02328070 ; =0x000003E7
	ldrsh ip, [r3, #0x12]
	ldrsh r3, [r3, #0x16]
	add r3, ip, r3
	cmp r3, r2
	movgt r3, r2
	add r2, r3, r3, lsr #31
	mov ip, #1
	mov r2, r2, asr #1
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328070: .word 0x000003E7
	arm_func_end DoMoveRecoverHp

	arm_func_start DoMoveEarthquake
DoMoveEarthquake: ; 0x02328074
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _023280D0 ; =DUNGEON_PTR
	ldr r5, [r1, #0xb4]
	ldr ip, [lr]
	mov r4, #0xc
	add ip, ip, #0x1a000
#ifdef JAPAN
	str r4, [ip, #0x190]
#else
	str r4, [ip, #0x234]
#endif
	ldr ip, [lr]
	mov lr, #0
	add ip, ip, #0x1a000
#ifdef JAPAN
	str lr, [ip, #0x194]
#else
	str lr, [ip, #0x238]
#endif
	ldrb ip, [r5, #0xd2]
	mov r4, #1
	cmp ip, #0xa
	moveq r4, #2
	str r3, [sp]
	mov r3, r4, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023280D0: .word DUNGEON_PTR
	arm_func_end DoMoveEarthquake

	arm_func_start GetNaturePowerVariant
GetNaturePowerVariant: ; 0x023280D4
	ldr r0, _02328108 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r2, [r0, #0x30]
#else
	ldrsh r2, [r0, #0xd4]
#endif
	mov r0, #0xc
	cmp r2, #0
	movlt r2, #0
	cmp r2, #0xc7
	movge r2, #0xc6
	mul r1, r2, r0
	ldr r0, _0232810C ; =ov10_022C6324
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02328108: .word DUNGEON_PTR
_0232810C: .word ov10_022C6324
	arm_func_end GetNaturePowerVariant

	arm_func_start DoMoveNaturePower
DoMoveNaturePower: ; 0x02328110
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r5, r3
	bl GetNaturePowerVariant
	mov r4, r0
	ldr r0, _02328164 ; =NATURE_POWER_TABLE
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	add r0, sp, #0
	bl InitMove
	ldr ip, _02328168 ; =ov10_022C4E44
	mov r0, r7
	ldr ip, [ip, r4, lsl #3]
	mov r1, r6
	mov r3, r5
	add r2, sp, #0
	blx ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328164: .word NATURE_POWER_TABLE
_02328168: .word ov10_022C4E44
	arm_func_end DoMoveNaturePower

	arm_func_start DoMoveDamageParalyze15
DoMoveDamageParalyze15: ; 0x0232816C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023281C8
	ldr r1, _023281D4 ; =LICK_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023281C8
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_023281C8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023281D4: .word LICK_PARALYZE_CHANCE
	arm_func_end DoMoveDamageParalyze15

	arm_func_start DoMoveSelfdestruct
DoMoveSelfdestruct: ; 0x023281D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r2
	mov r8, r0
	mov r5, r3
	mov r0, r6
	mov r7, r1
	bl GetMoveType
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl GetDamageSourceWrapper
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r7
	add r2, r7, #4
	mov r3, #1
	bl TryExplosion
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveSelfdestruct

	arm_func_start DoMoveParalyze__02328230
DoMoveParalyze__02328230: ; 0x02328230
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveParalyze__02328230

	arm_func_start DoMoveShadowBall
DoMoveShadowBall: ; 0x02328248
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023282B4
	ldr r1, _023282C0 ; =SHADOW_BALL_LOWER_SPECIAL_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023282B4
	ldr r0, _023282C4 ; =SPATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_023282B4:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023282C0: .word SHADOW_BALL_LOWER_SPECIAL_DEFENSE_CHANCE
_023282C4: .word SPATK_STAT_IDX
	arm_func_end DoMoveShadowBall

	arm_func_start DoMoveCharge
DoMoveCharge: ; 0x023282C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02328320 ; =0x00000CD9
	mov r5, r1
	mov r4, r2
	bl StringFromId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0xb
	bl BeginChargedMove
	ldr r2, _02328324 ; =SPATK_STAT_IDX
	mov r0, r6
	mov r1, r5
	ldr r2, [r2]
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02328320: .word 0x00000A19
#else
_02328320: .word 0x00000CD9
#endif
_02328324: .word SPATK_STAT_IDX
	arm_func_end DoMoveCharge

	arm_func_start DoMoveThunderbolt
DoMoveThunderbolt: ; 0x02328328
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328384
	ldr r1, _02328390 ; =THUNDERBOLT_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328384
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_02328384:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328390: .word THUNDERBOLT_PARALYZE_CHANCE
	arm_func_end DoMoveThunderbolt
