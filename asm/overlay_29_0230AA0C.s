	.include "asm/macros.inc"
	.include "overlay_29_0230AA0C.inc"

	.text

	arm_func_start AftermathCheck
AftermathCheck: ; 0x0230AA0C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r2
	mov r2, #0x76
#ifndef JAPAN
	mov r3, #1
#endif
	mov r6, r0
	mov r5, r1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230AA78
	ldr r0, _0230AA84 ; =AFTERMATH_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	ldrne ip, _0230AA88 ; =0x0000026F
	cmpne r4, ip
	beq _0230AA78
	mov r0, #0
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	add r2, r5, #4
	mov r3, #1
	str ip, [sp, #4]
	bl TryAftermathExplosion
	mov r0, #1
	b _0230AA7C
_0230AA78:
	mov r0, #0
_0230AA7C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230AA84: .word AFTERMATH_CHANCE
_0230AA88: .word 0x0000026F
	arm_func_end AftermathCheck

	arm_func_start GetTypeMatchupBothTypes
GetTypeMatchupBothTypes: ; 0x0230AA8C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _0230AB4C ; =ov29_02352838
	mov sl, r0
	ldrh r4, [r3]
	ldrh r3, [r3, #2]
	mov sb, r1
	mov r8, r2
	strh r4, [sp]
	strh r3, [sp, #2]
	bl ScrappyShouldActivate
	ldr fp, _0230AB50 ; =DUNGEON_PTR
	mov r7, r0
	mov r6, #0
	mov r5, #1
	add r4, sp, #0
_0230AAC8:
	cmp r7, #0
	bne _0230AB04
	mov r0, r8
	bl IsTypeIneffectiveAgainstGhost
	cmp r0, #0
	beq _0230AB04
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl GhostImmunityIsActive
	cmp r0, #0
	ldrne r1, [fp]
	movne r0, #0
	strneb r5, [r1, #0x1d4]
	bne _0230AB18
_0230AB04:
	mov r0, sl
	mov r1, sb
	mov r2, r6
	mov r3, r8
	bl GetTypeMatchup
_0230AB18:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r2, r6, lsl #1
	mov r6, r1, asr #0x10
	strh r0, [r4, r2]
	cmp r6, #2
	blt _0230AAC8
	ldrsh r2, [sp]
	ldr r0, _0230AB54 ; =TYPE_MATCHUP_COMBINATOR_TABLE
	ldrsh r1, [sp, #2]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230AB4C: .word ov29_02352838
_0230AB50: .word DUNGEON_PTR
_0230AB54: .word TYPE_MATCHUP_COMBINATOR_TABLE
	arm_func_end GetTypeMatchupBothTypes

	arm_func_start ScrappyShouldActivate
ScrappyShouldActivate: ; 0x0230AB58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r5, #0x57
	mov fp, r6
	mov r4, #1
	b _0230ABDC
_0230AB7C:
	mov r0, sl
	mov r1, r5
	ldr r7, [sb, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230ABB4
	add r0, r7, r6
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xe
	bne _0230ABB4
	cmp r8, #1
	cmpne r8, #7
	moveq r0, r4
	beq _0230ABB8
_0230ABB4:
	mov r0, fp
_0230ABB8:
	cmp r0, #0
	ldrne r1, _0230ABEC ; =DUNGEON_PTR
	movne r0, #1
	ldrne r1, [r1]
	strneb r0, [r1, #0x1cc]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230ABDC:
	cmp r6, #2
	blt _0230AB7C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230ABEC: .word DUNGEON_PTR
	arm_func_end ScrappyShouldActivate

	arm_func_start IsTypeIneffectiveAgainstGhost
IsTypeIneffectiveAgainstGhost: ; 0x0230ABF0
	cmp r0, #1
	cmpne r0, #7
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end IsTypeIneffectiveAgainstGhost

	arm_func_start GhostImmunityIsActive
GhostImmunityIsActive: ; 0x0230AC04
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	add r1, r3, r2
	ldrb r1, [r1, #0x5e]
	cmp r1, #0xe
	bne _0230AC50
	ldrb r1, [r3, #0xfe]
	cmp r1, #0
	bne _0230AC38
	mov r1, #0x45
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230AC40
_0230AC38:
	mov r0, #1
	b _0230AC44
_0230AC40:
	mov r0, #0
_0230AC44:
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0230AC50:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GhostImmunityIsActive
