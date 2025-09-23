	.include "asm/macros.inc"
	.include "overlay_29_02301D84.inc"

	.text

	arm_func_start OtherMonsterAbilityIsActive
OtherMonsterAbilityIsActive: ; 0x02301D84
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	mov r7, #0
	ldr r6, _02301E14 ; =DUNGEON_PTR
	b _02303354
_023032F4:
	ldr r0, [r6]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xad4]
	mov r0, r8
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r5, r8
	beq _02303348
	mov r0, r5
	mov r1, r8
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02303348
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02303348:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02303354:
	cmp r7, #0x14
	blt _023032F4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #1
	ldr r8, _02301E14 ; =DUNGEON_PTR
	b _02301E04
_02301DA0:
	ldr r0, [r8]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r7, sb
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	mov r2, r6
	mov r3, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02301DF8:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02301E04:
	cmp r5, #0x14
	blt _02301DA0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#endif
	.align 2, 0
_02301E14: .word DUNGEON_PTR
	arm_func_end OtherMonsterAbilityIsActive
