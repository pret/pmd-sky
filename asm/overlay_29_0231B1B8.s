	.include "asm/macros.inc"
	.include "overlay_29_0231B1B8.inc"

	.text

	arm_func_start TryActivateBadDreams
TryActivateBadDreams: ; 0x0231B1B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	mov sl, r0
	ldr r0, [sl, #0xb4]
	mov r6, #0
	ldrb r0, [r0, #6]
	ldr r4, _0231B30C ; =DUNGEON_PTR
	mov r7, #0
	cmp r0, #0
	moveq r0, #1
	movne r0, r6
	and sb, r0, #0xff
	add r5, sp, #0
_0231B1EC:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl IsMonster__0231B318
	cmp r0, #0
	beq _0231B240
	ldr r0, [r8, #0xb4]
	cmp sb, #0
	ldrb r0, [r0, #6]
	beq _0231B228
	cmp r0, #0
	beq _0231B240
	b _0231B230
_0231B228:
	cmp r0, #0
	bne _0231B240
_0231B230:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	str r8, [r5, r6, lsl #2]
	mov r6, r0, asr #0x10
_0231B240:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x14
	blt _0231B1EC
	mov r0, #2
	mov r1, #0x69
	bl ov29_0234B084
	ldr r0, _0231B310 ; =ov10_022C4530
	mov r8, #0
	ldrsh r7, [r0]
	mov r4, #0x18
	ldr fp, _0231B314 ; =0x0000026E
	add r5, sp, #0
	b _0231B2FC
_0231B27C:
	ldr sb, [r5, r8, lsl #2]
	cmp sb, #0
	beq _0231B2F0
	mov r0, sb
	bl IsMonster__0231B318
	cmp r0, #0
	beq _0231B2F0
	mov r0, sl
	mov r1, sb
	bl ov29_022E28D4
	cmp r0, #0
	cmpne sl, sb
	beq _0231B2F0
	mov r0, sb
	bl IsMonsterSleeping
	cmp r0, #0
	beq _0231B2F0
	mov r0, sb
	mov r1, r7
	mov r2, r4
	mov r3, fp
	bl ApplyDamageAndEffectsWrapper
	mov r0, sb
	bl EntityIsValid__0231B194
	cmp r0, #0
	beq _0231B2F0
	mov r0, sl
	mov r1, sb
	bl ov29_02307BDC
_0231B2F0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_0231B2FC:
	cmp r8, r6
	blt _0231B27C
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231B30C: .word DUNGEON_PTR
_0231B310: .word ov10_022C4530
_0231B314: .word 0x0000026E
	arm_func_end TryActivateBadDreams
