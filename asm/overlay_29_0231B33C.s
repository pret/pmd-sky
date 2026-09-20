	.include "asm/macros.inc"
	.include "overlay_29_0231B33C.inc"

	.text

	arm_func_start ActivateStench
ActivateStench: ; 0x0231B33C
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	bl ov29_022E60E4
	ldr r0, _0231B360 ; =ov10_022C457C
	mov r1, #2
	ldrsh r0, [r0]
#ifdef JAPAN
	strb r1, [r4, #0x103]
	strb r0, [r4, #0x104]
#else
	strb r1, [r4, #0x104]
	strb r0, [r4, #0x105]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231B360: .word ov10_022C457C
	arm_func_end ActivateStench

	arm_func_start TryActivateSteadfast
TryActivateSteadfast: ; 0x0231B364
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0x70
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end TryActivateSteadfast

	arm_func_start ov29_0231B39C
ov29_0231B39C: ; 0x0231B39C
	mov ip, #0
	mov r3, ip
_0231B3A4:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	strb r3, [r0, ip, lsl #2]
	add r2, r0, ip, lsl #2
	mov ip, r1, asr #0x10
	strh r3, [r2, #2]
	cmp ip, #8
	blt _0231B3A4
	strh r3, [r0, #0x20]
	bx lr
	arm_func_end ov29_0231B39C

	arm_func_start ov29_0231B3CC
ov29_0231B3CC: ; 0x0231B3CC
	ldrsh r3, [r0, #0x20]
	cmp r3, #8
	bxge lr
	mov r2, #1
	strb r2, [r0, r3, lsl #2]
	ldrsh r2, [r0, #0x20]
	add r2, r0, r2, lsl #2
	strh r1, [r2, #2]
	ldrsh r1, [r0, #0x20]
	add r1, r1, #1
	strh r1, [r0, #0x20]
	bx lr
	arm_func_end ov29_0231B3CC

	arm_func_start IsInSpawnList
IsInSpawnList: ; 0x0231B3FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r0, r1
	bl FemaleToMaleForm
	mov r4, r0
	mov r6, #0
	b _0231B44C
_0231B418:
	ldrb r0, [r5, r6, lsl #2]
	mov r1, r6, lsl #2
	cmp r0, #0
	beq _0231B440
	add r0, r5, r1
	ldrsh r0, [r0, #2]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
_0231B440:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0231B44C:
	ldrsh r0, [r5, #0x20]
	cmp r6, r0
	blt _0231B418
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end IsInSpawnList

	arm_func_start ov29_0231B460
ov29_0231B460: ; 0x0231B460
	stmdb sp!, {r3, lr}
	ldr r0, _0231B48C ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsh r1, [r0, #0xa8]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrsh r1, [r0, #0xa8]
	add r0, r2, #0x7d0
	bl ov29_0231B3CC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231B48C: .word DUNGEON_PTR
	arm_func_end ov29_0231B460

	arm_func_start ov29_0231B490
ov29_0231B490: ; 0x0231B490
	ldr r0, _0231B4A8 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	strb r1, [r0, #0xd98]
#else
	strb r1, [r0, #0xe3c]
#endif
	bx lr
	.align 2, 0
_0231B4A8: .word DUNGEON_PTR
	arm_func_end ov29_0231B490

	arm_func_start ov29_0231B4AC
ov29_0231B4AC: ; 0x0231B4AC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldreq r0, _0231B4E8 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x3000
#ifdef JAPAN
	ldreqb r0, [r0, #0xd98]
#else
	ldreqb r0, [r0, #0xe3c]
#endif
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0231B4E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsSkyExclusiveDungeon
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231B4E8: .word DUNGEON_PTR
	arm_func_end ov29_0231B4AC

	arm_func_start ChangeShayminForme
ChangeShayminForme: ; 0x0231B4EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	ldr r7, [r8, #0xb4]
	cmp r1, #1
	mov r6, #0
	ldrsh r0, [r7, #2]
	bne _0231B548
	bl IsShaymin
	cmp r0, #0
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r4, [r7, #2]
	ldr r0, _0231B680 ; =0x00000216
	cmp r4, r0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r1, [r7, #0xc4]
	cmp r1, #1
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r5, r0, #1
	mov r6, #1
	b _0231B570
_0231B548:
	bl IsShaymin
	cmp r0, #0
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r4, [r7, #2]
	ldr r0, _0231B684 ; =0x00000217
	cmp r4, r0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r5, r0, #1
_0231B570:
	ldrsh r0, [r7, #0xc]
	bl GetActiveTeamMember
	mov sb, r0
	cmp r6, #0
	beq _0231B5A0
	mov r0, r8
	mov r1, #0x2b8
	mov r2, #0
	bl ov29_022E3590
	mov r0, #0x21
	mov r1, #0x42
	bl ov29_022EA370
_0231B5A0:
	mov r0, #0
	bl ov29_022E9FD0
	mov r0, r4
	mov r1, r5
	bl SwapMonsterWanFileIndex
	strh r5, [r7, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r7, #4]
	strh r0, [sb, #0xc]
	strh r5, [r7, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r7, #4]
	ldr r4, [r8, #0xb4]
	ldrsh r0, [r4, #4]
	bl DungeonGetSpriteIndex
	strh r0, [r8, #0xa8]
	ldrb r0, [r4, #0xd8]
	cmp r0, #2
	beq _0231B5F4
	add r0, r8, #0x2c
	bl sub_0201CF80
_0231B5F4:
	mov r0, r8
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	mov r0, r8
	bl DetermineMonsterShadow
	mov r0, r8
	bl SetMonsterTypeAndAbility
	mov r0, #1
	bl ov29_022E9FD0
	ldr r0, _0231B684 ; =0x00000217
	cmp r5, r0
	ldreq r0, _0231B688 ; =DUNGEON_PTR
	moveq r1, #1
	ldrne r0, _0231B688 ; =DUNGEON_PTR
	movne r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	strb r1, [r0, #0xd98]
#else
	strb r1, [r0, #0xe3c]
#endif
	bl sub_020017EC
	bl ov29_022E81F8
	mov r0, #1
	mov r1, #0x42
	bl ov29_022EA370
	cmp r6, #0
	beq _0231B678
	mov r0, r8
	bl FreezeAnim
#ifdef JAPAN
	mov r0, #2
#else
	mov r0, #1
#endif
	bl AnimationDelayOrSomething
	mov r0, r8
	bl UnfreezeAnim
_0231B678:
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231B680: .word 0x00000216
_0231B684: .word 0x00000217
_0231B688: .word DUNGEON_PTR
	arm_func_end ChangeShayminForme
