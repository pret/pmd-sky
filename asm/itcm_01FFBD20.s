	.include "asm/macros.inc"
	.include "itcm_01FFBD20.inc"

	.section .itcm,4,1,4

	arm_func_start sub_01FFBD20
sub_01FFBD20: ; 0x01FFBD20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	bl IsMonster__0231A9D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r6, #0xb4]
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _01FFBD5C
	ldrb r0, [r5, #8]
	cmp r0, #0
	moveq r3, #1
	beq _01FFBD60
_01FFBD5C:
	mov r3, #0
_01FFBD60:
	ldr r1, _01FFBDF0 ; =DUNGEON_PTR
	mov r0, r6
	ldr r2, [r1]
	mov r1, #0x32
#ifdef JAPAN
	add r2, r2, #0x1840
	add r2, r2, #0x18000
#else
	add r2, r2, #0xe4
	add r2, r2, #0x19800
#endif
	add r4, r2, r3, lsl #4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _01FFBDB0
	ldr r0, [r4]
	cmp r0, #0
	bne _01FFBDB0
	mov r0, r7
	mov r1, r6
	bl sub_01FFBF78
	cmp r0, #0
	strne r6, [r4]
	ldrne r0, [r5, #0xb0]
	strne r0, [r4, #4]
_01FFBDB0:
	mov r0, r6
	mov r1, #0x7a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	bl sub_01FFBF78
	cmp r0, #0
	strne r6, [r4, #8]
	ldrne r0, [r5, #0xb0]
	strne r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FFBDF0: .word DUNGEON_PTR
	arm_func_end sub_01FFBD20

	arm_func_start sub_01FFBDF4
sub_01FFBDF4: ; 0x01FFBDF4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl ov29_0231B008
	mov r0, r7
	bl EntityIsValid__02319F8C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, _01FFBE58 ; =DUNGEON_PTR
	mov r5, #0
_01FFBE18:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__02319F8C
	cmp r0, #0
	cmpne r7, r6
	beq _01FFBE48
	mov r0, r7
	mov r1, r6
	bl sub_01FFBD20
_01FFBE48:
	add r5, r5, #1
	cmp r5, #0x14
	blt _01FFBE18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FFBE58: .word DUNGEON_PTR
	arm_func_end sub_01FFBDF4

	arm_func_start LightningRodStormDrainCheck
LightningRodStormDrainCheck: ; 0x01FFBE5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	mov r5, #0
	ldr r4, _01FFBF70 ; =_01FFB654
	ldr fp, _01FFBF74 ; =DUNGEON_PTR
	b _01FFBF60
_01FFBE80:
	ldr r1, [fp]
	mov r0, sl
#ifdef JAPAN
	add r1, r1, #0x1840
	add r1, r1, #0x18000
#else
	add r1, r1, #0xe4
	add r1, r1, #0x19800
#endif
	add r6, r1, r5, lsl #4
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _01FFBF5C
	mov r0, sl
	mov r1, r8
	bl GetMoveTypeForMonster
	ldrb r1, [r4, r7]
	cmp r1, r0
	bne _01FFBF5C
	mov r0, sl
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x70
	beq _01FFBF5C
	ldr r0, [r6, r7, lsl #3]
	bl IsMonster__0231A9D4
	cmp r0, #0
	beq _01FFBF4C
	ldr r0, [r6, r7, lsl #3]
	add r1, r6, r7, lsl #3
	ldr r2, [r1, #4]
	ldr r1, [r0, #0xb4]
	ldr r1, [r1, #0xb0]
	cmp r2, r1
	bne _01FFBF4C
	mov r1, sl
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _01FFBF4C
	ldr r0, [sb, #0xb4]
	ldr r2, [r6, r7, lsl #3]
#ifdef JAPAN
	ldrb r0, [r0, #0x10a]
	ldr r1, [r2, #0xb4]
	cmp r0, #0
	ldreqb r0, [r1, #0x10a]
#else
	ldrb r0, [r0, #0x10b]
	ldr r1, [r2, #0xb4]
	cmp r0, #0
	ldreqb r0, [r1, #0x10b]
#endif
	cmpeq r0, #0
	beq _01FFBF44
	cmp sb, r2
	bne _01FFBF4C
_01FFBF44:
	mov r0, #1
	b _01FFBF50
_01FFBF4C:
	mov r0, #0
_01FFBF50:
	cmp r0, #0
	ldrne r0, [r6, r7, lsl #3]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFBF5C:
	add r5, r5, #1
_01FFBF60:
	cmp r5, #2
	blt _01FFBE80
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FFBF70: .word _01FFB654
_01FFBF74: .word DUNGEON_PTR
	arm_func_end LightningRodStormDrainCheck

	arm_func_start sub_01FFBF78
sub_01FFBF78: ; 0x01FFBF78
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl ov29_0231985C
	mov r0, r6
	mov r1, r5
	bl CanSeeTarget
	cmp r0, #0
	beq _01FFBFD8
	add r0, sp, #8
	mov r1, r4
	bl InitMove
	add r0, sp, #8
	str r0, [sp]
	mov ip, #1
	mov r2, r6
	mov r3, r5
	mov r0, r4
	mov r1, #0x30
	str ip, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r4, r0
_01FFBFD8:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_01FFBF78
	; 0x01FFBFF0
