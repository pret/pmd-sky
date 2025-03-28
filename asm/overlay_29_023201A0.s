	.include "asm/macros.inc"
	.include "overlay_29_023201A0.inc"

	.text

	arm_func_start ov29_023201A0
ov29_023201A0: ; 0x023201A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__0232017C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022F9C74
	mov r0, r4
	bl EnsureCanStandCurrentTile
	mov r0, r4
	bl ov29_02321238
	ldmia sp!, {r4, pc}
	arm_func_end ov29_023201A0

	arm_func_start ov29_023201D0
ov29_023201D0: ; 0x023201D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sl, r0
	mov r4, r1
	mov r0, #0
	mov sb, r2
	mov r1, sl
	mov r2, r0
	mov r8, r3
	mov r5, #1
	bl SubstitutePlaceholderStringTags
	ldrh r0, [sl, #4]
	ldr r1, _02320330 ; =DIRECTIONS_XY
	mov r2, r4, lsl #2
	strh r0, [sp]
	ldrh r3, [sl, #6]
	ldrsh r6, [r1, r2]
	ldr r0, _02320334 ; =DIRECTIONS_XY + 2
	ldrsh r1, [sp]
	ldrsh r7, [r0, r2]
	strh r3, [sp, #2]
	add r0, r1, r6
	ldrsh r1, [sp, #2]
	strh r0, [sp]
	ldrsh r0, [sp]
	add r1, r1, r7
	strh r1, [sp, #2]
	cmp r0, #0
	ldrgesh r1, [sp, #2]
	cmpge r1, #0
	blt _02320258
	cmp r0, #0x38
	cmplt r1, #0x20
	blt _0232025C
_02320258:
	mov r5, #0
_0232025C:
	ldrsh r1, [sp, #2]
	bl GetTile
	mov r4, r0
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	cmp r0, #0
	mov r0, sl
	movne r5, #0
	bl ov29_022FFB90
	cmp r0, #0
	beq _02320294
	ldrh r0, [r4]
	tst r0, #3
	moveq r5, #0
_02320294:
	cmp r5, #0
	beq _02320328
	ldr r1, _02320338 ; =0x00000212
	mov r0, sl
	bl ov29_022E56A0
	mov r0, sl
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUser
	mov r7, r7, lsl #0xa
	mov r6, r6, lsl #0xa
	mov r5, #0
	mov r4, #0x19
_023202C4:
	mov r0, sl
	mov r1, r6
	mov r2, r7
	bl IncrementEntityPixelPosXY
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023202EC
	mov r0, r4
	bl AdvanceFrame
_023202EC:
	add r5, r5, #1
	cmp r5, #6
	blt _023202C4
	ldrsh r1, [sp]
	ldrsh r2, [sp, #2]
	mov r0, sl
	mov r3, #1
	bl MoveMonsterToPos
	bl IsFloorOver
	cmp r0, #0
	bne _02320328
	cmp sb, #0
	beq _02320328
	mov r0, sl
	bl ov29_023201A0
_02320328:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02320330: .word DIRECTIONS_XY
_02320334: .word DIRECTIONS_XY + 2
_02320338: .word 0x00000212
	arm_func_end ov29_023201D0

	arm_func_start ov29_0232033C
ov29_0232033C: ; 0x0232033C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldrsh r3, [r1]
	ldrsh r2, [r1, #2]
	mov r1, #0x18
	mov sl, r0
	smulbb r3, r3, r1
	smulbb r0, r2, r1
	add r2, r3, #0xc
	ldr r8, [sl, #0xc]
	add r1, r0, #0x10
	sub r0, r8, r2, lsl #8
	mov r6, r2, lsl #8
	mov r7, r1, lsl #8
	bl abs
	cmp r0, #0xc
	bge _02320394
	ldr r0, [sl, #0x10]
	sub r0, r0, r7
	bl abs
	cmp r0, #0xc
	blt _0232041C
_02320394:
	ldr sb, [sl, #0x10]
	sub r0, r6, r8
	mov r1, #0xc
	mov r5, #0
	bl _s32_div_f
	str r0, [sp]
	sub r0, r7, sb
	mov r1, #0xc
	bl _s32_div_f
	mov fp, r0
	mov r4, r5
_023203C0:
	ldr r0, [sp]
	add sb, sb, fp
	add r8, r8, r0
	mov r0, r5
	str r8, [sp, #4]
	str sb, [sp, #8]
	bl sub_020018D0
	mov r1, #0xc
	mul r1, r0, r1
	str r1, [sl, #0x1c]
	mov r0, sl
	add r1, sp, #4
	bl UpdateEntityPixelPos
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0232040C
	mov r0, #0x1a
	bl AdvanceFrame
_0232040C:
	add r4, r4, #1
	cmp r4, #0xc
	add r5, r5, #0xaa
	blt _023203C0
_0232041C:
	add r1, sp, #4
	mov r0, sl
	str r6, [sp, #4]
	str r7, [sp, #8]
	mov r2, #0
	str r2, [sl, #0x1c]
	bl UpdateEntityPixelPos
	mov r0, #0x1a
	bl AdvanceFrame
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_0232033C

	arm_func_start TryExplosion
TryExplosion: ; 0x02320448
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	mov sb, r1
	str r0, [sp, #0x38]
	str r2, [sp, #4]
	mov r8, r3
	ldr fp, [sp, #0x3c]
	mov r5, #0
	mov r7, #0x15
	ldr r4, _0232074C ; =DUNGEON_PTR
	b _023204B4
_0232047C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__02320764
	cmp r0, #0
	beq _023204B0
	mov r0, r6
	mov r1, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _023204BC
_023204B0:
	add r5, r5, #1
_023204B4:
	cmp r5, #0x14
	blt _0232047C
_023204BC:
	cmp r5, #0x14
	beq _023204F4
	mov r0, sl
	mov r1, sb
	bl ov29_022E55F0
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02320750 ; =0x00000BFC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02320744
_023204F4:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #4
	bne _02320518
	ldr r2, _02320750 ; =0x00000BFC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02320744
_02320518:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl ov29_022E5560
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02320754 ; =0x00000BFB
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, _02320758 ; =ov29_023529B8
	mov r6, #0
	ldr r4, [r0, r8, lsl #2]
	mov r7, r6
	b _023206AC
_0232055C:
	ldr r0, [sp, #4]
	ldrsh r0, [r0]
	add r0, r1, r0
	strh r0, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrsh r2, [r4, #2]
	ldrsh r1, [r0, #2]
	ldrsh r0, [sp, #0xc]
	add r1, r2, r1
	strh r1, [sp, #0xe]
	cmp r0, #0
	ldrgesh r1, [sp, #0xe]
	cmpge r1, #0
	blt _023206A8
	cmp r0, #0x38
	cmplt r1, #0x20
	bge _023206A8
	bl GetTileSafe
	ldrsh r1, [sp, #0xc]
	mov r5, r0
	cmp r1, #1
	ldrgesh r0, [sp, #0xe]
	cmpge r0, #1
	blt _02320634
	cmp r1, #0x37
	cmplt r0, #0x1f
	bge _02320634
	ldrh r0, [r5]
	tst r0, #3
	bne _02320634
	ldrh r0, [r5]
	tst r0, #0x10
	bne _02320634
	bic r0, r0, #3
	strh r0, [r5]
	ldrh r0, [r5]
	mvn r7, #0
	str r7, [sp, #8]
	orr r0, r0, #1
	strh r0, [r5]
_023205FC:
	ldr r6, [sp, #8]
_02320600:
	ldrsh r0, [sp, #0xc]
	ldrsh r1, [sp, #0xe]
	add r0, r0, r6
	add r1, r1, r7
	bl ov29_02336694
	add r6, r6, #1
	cmp r6, #1
	ble _02320600
	add r7, r7, #1
	cmp r7, #1
	ble _023205FC
	mov r6, #1
	mov r7, r6
_02320634:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02320664
	cmp r0, sb
	beq _02320660
	ldr r0, [r0]
	cmp r0, #3
	bne _02320660
	add r0, sp, #0xc
	mov r1, #0
	bl RemoveGroundItem
_02320660:
	mov r6, #1
_02320664:
	ldr r1, [r5, #0xc]
	cmp r1, #0
	cmpne r1, sb
	beq _023206A8
	ldr r0, [r1]
	cmp r0, #1
	bne _023206A8
	ldr r2, _0232075C ; =ov29_02353700
	mov r0, sl
	ldr r5, [r2, r8, lsl #2]
	ldr r2, [sp, #0x38]
	mov r3, fp
	str r5, [sp]
	bl ov29_02320AA4
	bl IsFloorOver
	cmp r0, #0
	bne _023206B8
_023206A8:
	add r4, r4, #4
_023206AC:
	ldrsh r1, [r4]
	cmp r1, #0x63
	bne _0232055C
_023206B8:
	bl IsFloorOver
	cmp r0, #0
	bne _02320744
	ldr r0, [sb]
	cmp r0, #1
	bne _023206FC
	ldr r0, _02320760 ; =0x0000026F
	cmp fp, r0
	beq _023206FC
	ldr r1, _0232075C ; =ov29_02353700
	ldr r2, [sp, #0x38]
	ldr r4, [r1, r8, lsl #2]
	mov r0, sl
	mov r1, sb
	mov r3, fp
	str r4, [sp]
	bl ov29_02320AA4
_023206FC:
	cmp r6, #0
	beq _02320744
	cmp r7, #0
	beq _0232073C
	mov r6, #0
	mov r4, r6
_02320714:
	mov r5, r4
_02320718:
	mov r0, r5
	mov r1, r6
	bl DetermineTileWalkableNeighbors
	add r5, r5, #1
	cmp r5, #0x38
	blt _02320718
	add r6, r6, #1
	cmp r6, #0x20
	blt _02320714
_0232073C:
	bl UpdateMinimap
	bl UpdateTrapsVisibility
_02320744:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232074C: .word DUNGEON_PTR
#ifdef JAPAN
_02320750: .word 0x0000093B
_02320754: .word 0x0000093A
#else
_02320750: .word 0x00000BFC
_02320754: .word 0x00000BFB
#endif
_02320758: .word ov29_023529B8
_0232075C: .word ov29_02353700
_02320760: .word 0x0000026F
	arm_func_end TryExplosion
