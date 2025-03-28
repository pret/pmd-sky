	.include "asm/macros.inc"
	.include "overlay_29_02300D00.inc"

	.text

	arm_func_start ov29_02300D00
ov29_02300D00: ; 0x02300D00
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #2
	cmpne r0, #4
	cmpne r0, #0
	movne r0, #1
	bxne lr
	ldrb r0, [r1, #0xc4]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #6
	moveq r0, #1
	bxeq lr
	ldrb r0, [r1, #0xd2]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov29_02300D00

	arm_func_start ov29_02300D50
ov29_02300D50: ; 0x02300D50
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0xb4]
	ldrb r3, [r1, #0xc4]
	cmp r3, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r3, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r1, #0xd0]
	cmp r2, #7
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r2, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r1, #0xbf]
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r3, #6
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r2, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl CheckVariousStatuses
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02300D50

	arm_func_start ov29_02300DC0
ov29_02300DC0: ; 0x02300DC0
	ldr ip, _02300DC8 ; =ov29_02300D50
	bx ip
	.align 2, 0
_02300DC8: .word ov29_02300D50
	arm_func_end ov29_02300DC0

	arm_func_start ov29_02300DCC
ov29_02300DCC: ; 0x02300DCC
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldr r2, [r0, #0xb4]
	bne _02300DF4
	ldrb r1, [r2, #0xbd]
	cmp r1, #2
	cmpne r1, #4
	cmpne r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02300DF4:
	ldrb r1, [r2, #0xc4]
	cmp r1, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #6
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r2, #0xd0]
	cmp r1, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #7
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r2, #0xbf]
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ShouldMonsterRunAway
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02300DCC

	arm_func_start CanMonsterMoveInDirection
CanMonsterMoveInDirection: ; 0x02300E78
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0xb4]
	mov r5, r1
	ldrsh r1, [r2, #2]
	bl GetMobilityTypeCheckSlipAndFloating
	ldr r2, _02300F24 ; =DIRECTIONS_XY
	mov ip, r5, lsl #2
	ldr r1, _02300F28 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r2, ip]
	ldrsh lr, [r6, #4]
	mov r4, r0
	ldrsh r2, [r6, #6]
	ldrsh r1, [r1, ip]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02302330
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _02302330
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _02302330
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _02302330
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02302330
	tst r5, #1
	movne r4, #2
	moveq r4, #3
_02302330:
#else
	mov r0, r6
	mov r1, r4
	and r2, r5, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	add r0, r0, r4
	ldr r1, _02300F2C ; =ov29_02352798
	and r2, r5, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02300F24: .word DIRECTIONS_XY
_02300F28: .word DIRECTIONS_XY + 2
_02300F2C: .word ov29_02352798
	arm_func_end CanMonsterMoveInDirection

#ifndef JAPAN
	arm_func_start GetDirectionalMobilityType
GetDirectionalMobilityType: ; 0x02300F30
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02300FC4
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r5, #3
	beq _02300FC4
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r5, #3
	bne _02300FC4
	cmp r5, #3
	beq _02300F98
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #2
	bne _02300FC4
_02300F98:
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02300FC4
	cmp r4, #0xff
	moveq r5, #3
	beq _02300FC4
	tst r4, #1
	movne r5, #2
	moveq r5, #3
_02300FC4:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GetDirectionalMobilityType
#endif

	arm_func_start ov29_02300FCC
ov29_02300FCC: ; 0x02300FCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02301050 ; =DIRECTIONS_XY
	mov ip, r4, lsl #2
	ldr r0, _02301054 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r1, ip]
	ldrsh lr, [r5, #4]
	ldrsh r1, [r0, ip]
	ldrsh r2, [r5, #6]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	ldr r1, _02301058 ; =ov29_02352790
	and r2, r4, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02301050: .word DIRECTIONS_XY
_02301054: .word DIRECTIONS_XY + 2
_02301058: .word ov29_02352790
	arm_func_end ov29_02300FCC

	arm_func_start ov29_0230105C
ov29_0230105C: ; 0x0230105C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0xb4]
	mov r5, r1
	ldrsh r1, [r2, #2]
	bl GetMobilityTypeCheckSlipAndFloating
	ldr r2, _0230110C ; =DIRECTIONS_XY
	mov ip, r5, lsl #2
	ldr r1, _02301110 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r2, ip]
	ldrsh lr, [r6, #4]
	mov r4, r0
	ldrsh r2, [r6, #6]
	ldrsh r1, [r1, ip]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _023024DC_JP
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _023024DC_JP
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _023024DC_JP
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _023024DC_JP
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023024DC_JP
	tst r5, #1
	movne r4, #2
	moveq r4, #3
_023024DC_JP:
#else
	mov r0, r6
	mov r1, r4
	and r2, r5, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	add r0, r0, r4
	ldr r1, _02301114 ; =ov29_02352788
	and r2, r5, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
#ifdef JAPAN
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
#else
	moveq r0, #0
	movne r0, #1
#endif
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230110C: .word DIRECTIONS_XY
_02301110: .word DIRECTIONS_XY + 2
_02301114: .word ov29_02352788
	arm_func_end ov29_0230105C

	arm_func_start IsMonsterCornered
IsMonsterCornered: ; 0x02301118
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02301148
_02301128:
	mov r0, r5
	mov r1, r4
	bl ov29_02301158
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #1
	and r4, r0, #0xff
_02301148:
	cmp r4, #8
	blo _02301128
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end IsMonsterCornered

	arm_func_start ov29_02301158
ov29_02301158: ; 0x02301158
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0xb4]
	mov r5, r1
	ldrsh r1, [r2, #2]
	bl GetMobilityTypeCheckSlipAndFloating
	ldr r2, _02301228 ; =DIRECTIONS_XY
	mov ip, r5, lsl #2
	ldr r1, _0230122C ; =DIRECTIONS_XY + 2
	ldrsh r3, [r2, ip]
	ldrsh lr, [r6, #4]
	mov r4, r0
	ldrsh r2, [r6, #6]
	ldrsh r1, [r1, ip]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _023011E0
	ldr r0, [r1]
	cmp r0, #1
	bne _023011E0
	mov r0, r6
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_023011E0:
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02302654
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _02302654
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _02302654
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _02302654
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02302654
	tst r5, #1
	movne r4, #2
	moveq r4, #3
_02302654:
#else
	mov r0, r6
	mov r1, r4
	and r2, r5, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	add r0, r0, r4
	ldr r1, _02301230 ; =ov29_02352780
	and r2, r5, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02301228: .word DIRECTIONS_XY
_0230122C: .word DIRECTIONS_XY + 2
_02301230: .word ov29_02352780
	arm_func_end ov29_02301158

	arm_func_start CanAttackInDirection
CanAttackInDirection: ; 0x02301234
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0xb4]
	mov r5, r1
	ldrsh r1, [r2, #2]
	bl GetMobilityTypeCheckSlipAndFloating
	mov r4, r0
	ldr r1, _023012EC ; =DIRECTIONS_XY
	mov ip, r5, lsl #2
	cmp r4, #1
	ldr r0, _023012F0 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r1, ip]
	ldrsh lr, [r6, #4]
	ldrsh r1, [r0, ip]
	ldrsh r2, [r6, #6]
	add r0, lr, r3
	movls r4, #2
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02302778
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _02302778
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _02302778
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _02302778
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02302778
	tst r5, #1
	movne r4, #2
	moveq r4, #3
_02302778:
#else
	mov r0, r6
	mov r1, r4
	and r2, r5, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	add r0, r0, r4
	ldr r1, _023012F4 ; =ov29_02352778
	and r2, r5, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
#ifdef JAPAN
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
#else
	moveq r0, #0
	movne r0, #1
#endif
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023012EC: .word DIRECTIONS_XY
_023012F0: .word DIRECTIONS_XY + 2
_023012F4: .word ov29_02352778
	arm_func_end CanAttackInDirection

	arm_func_start CanAiMonsterMoveInDirection
CanAiMonsterMoveInDirection: ; 0x023012F8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0xb4]
	mov r7, r1
	ldrsh r1, [r3, #2]
	mov r6, r2
	bl GetMobilityTypeCheckSlipAndFloating
	mov r1, #0
	strb r1, [r6]
	ldr r2, _02301484 ; =DIRECTIONS_XY
	mov r4, r7, lsl #2
	ldr r1, _02301488 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r2, r4]
	ldrsh ip, [r8, #4]
	mov r5, r0
	ldrsh r2, [r8, #6]
	ldrsh r1, [r1, r4]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	tst r0, #0x40
	beq _02301390
	ldr r0, _0230148C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x793]
	cmp r0, #0
	bne _02301390
	mov r0, r8
	mov r1, #0xf
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02301390:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _023013E4
	mov r0, r8
	mov r1, #0xe
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023013E4
	ldr r1, [r4, #0x10]
	ldr r0, [r1]
	cmp r0, #2
	bne _023013E4
	ldrb r0, [r1, #0x20]
	cmp r0, #0
	bne _023013DC
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xf1]
	cmp r0, #3
	bne _023013E4
_023013DC:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023013E4:
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #2
	bne _0230142C
	ldr r0, _0230148C ; =DUNGEON_PTR
	ldr r1, _02301490 ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0230142C
	mov r0, r8
	mov r1, #0x14
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0230142C:
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _0230295C
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r5, #3
	beq _0230295C
	mov r0, r8
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r5, #3
	bne _0230295C
	mov r0, r8
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #2
	bne _0230295C
	mov r0, r8
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230295C
	tst r7, #1
	movne r5, #2
	moveq r5, #3
_0230295C:
#else
	mov r0, r8
	mov r1, r5
	and r2, r7, #0xff
	bl GetDirectionalMobilityType
	mov r5, r0
#endif
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTile
	add r0, r0, r5
	ldr r1, _02301494 ; =ov29_02352770
	and r2, r7, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	mov r0, #1
	strneb r0, [r6]
	movne r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02301484: .word DIRECTIONS_XY
_02301488: .word DIRECTIONS_XY + 2
_0230148C: .word DUNGEON_PTR
_02301490: .word SECONDARY_TERRAIN_TYPES
_02301494: .word ov29_02352770
	arm_func_end CanAiMonsterMoveInDirection

	arm_func_start ov29_02301498
ov29_02301498: ; 0x02301498
#ifdef JAPAN
#define OV29_02301498_OFFSET -4
#else
#define OV29_02301498_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5, #0xb4]
	ldrsh r1, [r1, #2]
	bl GetMobilityTypeCheckSlipAndFloating
#ifdef JAPAN
	mov r4, r0
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02302A30_JP
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _02302A30_JP
	mov r0, r5
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _02302A30_JP
	mov r0, r5
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _02302A30_JP
	mov r0, r5
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
_02302A30_JP:
#else
	mov r1, r0
	mov r0, r5
	mov r2, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	cmp r4, #3
	bne _023014FC
	ldr r4, [r5, #0xb4]
	mov r0, #0x64
	bl DungeonRandInt
	add r1, r4, #0x200
	ldrsh r2, [r1, #0x12 + OV29_02301498_OFFSET]
	add r0, r2, r0
	strh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	ldrsh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	cmp r0, #0xc8
	mov r0, #0
	strgeh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	movge r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_023014FC:
	ldr r0, _0230158C ; =DUNGEON_PTR
	ldr r1, _02301590 ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	cmpeq r4, #1
	bne _02301534
	mov r0, r5
	mov r1, #0x14
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #0
_02301534:
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	add r0, r0, r4
	ldrb r0, [r0, #8]
	cmp r0, #0x54
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x51
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x45
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x15
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x55
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230158C: .word DUNGEON_PTR
_02301590: .word SECONDARY_TERRAIN_TYPES
	arm_func_end ov29_02301498

	arm_func_start ov29_02301594
ov29_02301594: ; 0x02301594
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r1, #3
	bl IsTacticSet
	cmp r0, #0
	cmpne r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02301594
