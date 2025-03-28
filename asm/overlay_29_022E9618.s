	.include "asm/macros.inc"
	.include "overlay_29_022E9618.inc"

	.text

	arm_func_start GetLeaderMonster
GetLeaderMonster: ; 0x022E9618
	stmdb sp!, {r3, lr}
	bl GetLeader
	ldr r0, [r0, #0xb4]
	ldmia sp!, {r3, pc}
	arm_func_end GetLeaderMonster

	arm_func_start GetRandomTile
GetRandomTile: ; 0x022E9628
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe20
	mov sl, r0
	str r1, [sp]
	bl GetLeader
	mov r4, #0
	str r0, [sp, #0x14]
	mov r8, r4
	b _022E9830
_022E964C:
	mov r0, #0x38
	bl DungeonRandInt
	mov sb, r0
	mov r0, #0x20
	bl DungeonRandInt
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	mov r5, #0
	strh r2, [sp, #0x1c]
	ldrsh r0, [sp, #0x1c]
	strh r1, [sp, #0x1e]
	ldrsh fp, [sp, #0x1e]
	str r0, [sp, #8]
	b _022E97F4
_022E968C:
	cmp r4, #0x700
	ldr r7, [sp, #0x10]
	bge _022E97FC
	ldr r0, [sp, #8]
	mov r6, #0
	sub r0, r0, sb
	str r0, [sp, #4]
	and r0, sb, #0xff
	str r0, [sp, #0x18]
	b _022E97DC
_022E96B4:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, sb
	mov r1, r7
	bl GetTile
	cmp r4, #0x700
	bge _022E97E4
	ldr r1, [sp]
	cmp r1, #0
	beq _022E96E8
	ldrh r1, [r0]
	tst r1, #0x800
	bne _022E97D8
_022E96E8:
	cmp r8, #0
	bne _022E974C
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	bne _022E97A8
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _022E97A8
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _022E97A8
	ldr r0, [sp, #4]
	bl abs
	cmp r0, #6
	bge _022E9740
	sub r0, fp, r7
	bl abs
	cmp r0, #6
	blt _022E97A8
_022E9740:
	mov r0, #1
	str r0, [sp, #0xc]
	b _022E97A8
_022E974C:
	ldrh r1, [r0]
	cmp r8, #1
	and r1, r1, #3
	bne _022E978C
	cmp r1, #1
	bne _022E97A8
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _022E97A8
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	b _022E97A8
_022E978C:
	cmp r1, #1
	ldreq r1, [r0, #0x10]
	cmpeq r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_022E97A8:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _022E97CC
	ldr r1, [sp, #0x18]
	add r0, sp, #0x20
	strb r1, [r0, r4, lsl #1]
	add r0, r0, r4, lsl #1
	strb r7, [r0, #1]
	add r4, r4, #1
_022E97CC:
	add r7, r7, #1
	cmp r7, #0x20
	movge r7, #0
_022E97D8:
	add r6, r6, #1
_022E97DC:
	cmp r6, #0x20
	blt _022E96B4
_022E97E4:
	add sb, sb, #1
	cmp sb, #0x38
	movge sb, #0
	add r5, r5, #1
_022E97F4:
	cmp r5, #0x38
	blt _022E968C
_022E97FC:
	cmp r4, #0
	beq _022E982C
	mov r0, r4
	bl DungeonRandInt
	add r2, sp, #0x20
	ldrb r2, [r2, r0, lsl #1]
	add r1, sp, #0x21
	strh r2, [sl]
	ldrb r1, [r1, r0, lsl #1]
	mov r0, #1
	strh r1, [sl, #2]
	b _022E983C
_022E982C:
	add r8, r8, #1
_022E9830:
	cmp r8, #3
	blt _022E964C
	mov r0, #0
_022E983C:
	add sp, sp, #0xe20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end GetRandomTile

	arm_func_start FindNearbyUnoccupiedTile
FindNearbyUnoccupiedTile: ; 0x022E9844
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r8, r3
	mov sl, r0
	mov r0, #0
	str r0, [sp, #4]
	str r1, [sp]
	add r3, r8, #1
	mov r1, r0
	mov r0, r3, lsl #1
	mov sb, r2
	ldr r7, [sp, #0x30]
	bl MemAlloc
	mov r4, r0
	mov r1, #0
	b _022E9890
_022E9884:
	mov r0, r1, lsl #1
	strh r1, [r4, r0]
	add r1, r1, #1
_022E9890:
	cmp r1, r8
	blt _022E9884
	cmp r7, #0
	beq _022E9918
	mov r0, #4
	bl DungeonRandInt
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	str r0, [sp, #8]
	sub fp, r8, #1
	mov r6, #0
	b _022E990C
_022E98C0:
	mov r5, #0
	b _022E98F8
_022E98C8:
	mov r0, r8
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	mov r3, r5, lsl #1
	mov r1, r0, asr #0xf
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	add r5, r5, #1
	mov r5, r5, lsl #0x10
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	mov r5, r5, asr #0x10
_022E98F8:
	cmp r5, fp
	blt _022E98C8
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E990C:
	ldr r0, [sp, #8]
	cmp r6, r0, asr #16
	blt _022E98C0
_022E9918:
	mov r6, #0
	b _022E99D0
_022E9920:
	mov r0, r6, lsl #1
	ldrsh r0, [r4, r0]
	mov r0, r0, lsl #2
	ldrsh r5, [sb, r0]
	cmp r5, #0x63
	beq _022E99D8
	add r1, sb, r0
	ldr r0, [sp]
	ldrsh r1, [r1, #2]
	ldrsh r3, [r0]
	ldrsh r2, [r0, #2]
	add fp, r3, r5
	add r5, r2, r1
	mov r0, fp
	mov r1, r5
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x800
	bne _022E99CC
	cmp r7, #0
	beq _022E99A0
	ldrb r2, [r0, #7]
	cmp r2, #0xff
	beq _022E99CC
	ldr r2, _022E99EC ; =DUNGEON_PTR
	ldr r2, [r2]
	add r2, r2, #0xcc00
#ifdef JAPAN
	ldrsh r3, [r2, #0x40]
	cmp r3, fp
	ldreqsh r2, [r2, #0x42]
#else
	ldrsh r3, [r2, #0xe4]
	cmp r3, fp
	ldreqsh r2, [r2, #0xe6]
#endif
	cmpeq r2, r5
	beq _022E99CC
_022E99A0:
	and r1, r1, #3
	cmp r1, #1
	ldreq r1, [r0, #0x10]
	cmpeq r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	streqh fp, [sl]
	streqh r5, [sl, #2]
	moveq r0, #1
	streq r0, [sp, #4]
	beq _022E99D8
_022E99CC:
	add r6, r6, #1
_022E99D0:
	cmp r6, r8
	blt _022E9920
_022E99D8:
	mov r0, r4
	bl MemFree
	ldr r0, [sp, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E99EC: .word DUNGEON_PTR
	arm_func_end FindNearbyUnoccupiedTile

	arm_func_start FindClosestUnoccupiedTileWithin2
FindClosestUnoccupiedTileWithin2: ; 0x022E99F0
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A08 ; =DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	mov r3, #0x19
	bl FindNearbyUnoccupiedTile
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A08: .word DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	arm_func_end FindClosestUnoccupiedTileWithin2

	arm_func_start FindFarthestUnoccupiedTileWithin2
FindFarthestUnoccupiedTileWithin2: ; 0x022E9A0C
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A24 ; =DISPLACEMENTS_WITHIN_2_LARGEST_FIRST
	mov r3, #0x19
	bl FindNearbyUnoccupiedTile
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A24: .word DISPLACEMENTS_WITHIN_2_LARGEST_FIRST
	arm_func_end FindFarthestUnoccupiedTileWithin2

	arm_func_start FindUnoccupiedTileWithin3
FindUnoccupiedTileWithin3: ; 0x022E9A28
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A40 ; =DISPLACEMENTS_WITHIN_3
	mov r3, #0x31
	bl FindNearbyUnoccupiedTile
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A40: .word DISPLACEMENTS_WITHIN_3
	arm_func_end FindUnoccupiedTileWithin3

	arm_func_start TickStatusTurnCounter
TickStatusTurnCounter: ; 0x022E9A44
	ldrb r1, [r0]
	cmp r1, #0x7f
	moveq r0, r1
	bxeq lr
	cmp r1, #0
	moveq r0, r1
	subne r1, r1, #1
	strneb r1, [r0]
	andne r0, r1, #0xff
	bx lr
	arm_func_end TickStatusTurnCounter

	arm_func_start ov29_022E9A6C
ov29_022E9A6C: ; 0x022E9A6C
	ldrh r2, [r0]
	ldr r1, _022E9A98 ; =0x00007530
	cmp r2, r1
	moveq r0, r2
	bxeq lr
	cmp r2, #0
	moveq r0, r2
	subne r1, r2, #1
	strneh r1, [r0]
	ldrneh r0, [r0]
	bx lr
	.align 2, 0
_022E9A98: .word 0x00007530
	arm_func_end ov29_022E9A6C

	arm_func_start ov29_022E9A9C
ov29_022E9A9C: ; 0x022E9A9C
#ifdef JAPAN
#define OV29_022E9A9C_OFFSET -0xA4
#else
#define OV29_022E9A9C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r1
	ldr r8, [sb, #0xb4]
	mov sl, r0
	mov r0, sb
	mov r1, #1
	ldrb r4, [r8, #0x4c]
	bl CheckVariousStatuses2
	cmp r0, #0
	beq _022E9B00
	ldr r0, _022E9CA0 ; =DIRECTIONS_XY
	mov r2, r4, lsl #2
	ldrsh r1, [r0, r2]
	ldrsh r3, [sb, #4]
	ldr r0, _022E9CA4 ; =DIRECTIONS_XY + 2
	add r1, r1, r1, lsl #1
	add r1, r3, r1
	strh r1, [sl]
	ldrsh r0, [r0, r2]
	ldrsh r1, [sb, #6]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	strh r0, [sl, #2]
	b _022E9C98
_022E9B00:
	ldrsh r2, [r8, #0x5a]
	mvn r0, #0
	cmp r2, r0
	ldreqsh r1, [r8, #0x5c]
	cmpeq r1, r0
	bne _022E9C8C
	ldr r0, _022E9CA8 ; =DUNGEON_PTR
	ldrb r6, [r8, #0x4c]
	ldr r1, [r0]
	ldr r4, _022E9CAC ; =ov29_0235179C
	add r0, r1, #0x3000
	ldrb r0, [r0, #0xe38 + OV29_022E9A9C_OFFSET]
	ldr r3, _022E9CB0 ; =ov29_023517A0
	mov r5, r6, lsl #3
	cmp r0, #0
	ldrsh r0, [r3, r5]
	ldr r2, _022E9CB4 ; =ov29_023517A2
	ldr r4, [r4, r6, lsl #3]
	str r0, [sp, #0x14]
	ldrsh r0, [r2, r5]
	str r0, [sp, #0x10]
	ldrsh r0, [sb, #4]
	str r0, [sp, #0xc]
	ldrsh r0, [sb, #6]
	str r0, [sp, #8]
	beq _022E9B80
	add r0, r1, #0x378 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x14
	str r0, [sp]
	b _022E9C44
_022E9B80:
	ldrb r0, [r8, #6]
	cmp r0, #0
	bne _022E9BA4
	add r0, r1, #0x338 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	b _022E9C44
_022E9BA4:
	add r0, r1, #0x328 + OV29_022E9A9C_OFFSET
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp]
	b _022E9C44
_022E9BBC:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldrsh r2, [r4, #2]
	mla fp, r3, r1, r0
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r6, #0
	mla r5, r2, r1, r0
	b _022E9C34
_022E9BE0:
	ldr r0, [sp, #4]
	ldr r7, [r0, r6, lsl #2]
	mov r0, r7
	bl EntityIsValid__022E95F4
	cmp r0, #0
	beq _022E9C30
	ldrsh r0, [r7, #4]
	cmp r0, fp
	ldreqsh r0, [r7, #6]
	cmpeq r0, r5
	bne _022E9C30
	mov r2, #0
	mov r1, r7
	mov r0, sb
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	streqh fp, [sl]
	streqh r5, [sl, #2]
	beq _022E9C98
_022E9C30:
	add r6, r6, #1
_022E9C34:
	ldr r0, [sp]
	cmp r6, r0
	blt _022E9BE0
	add r4, r4, #4
_022E9C44:
	ldrsh r3, [r4]
	cmp r3, #0x63
	bne _022E9BBC
	ldrb r1, [r8, #0x4c]
	ldr r0, _022E9CA0 ; =DIRECTIONS_XY
	ldrsh r2, [sb, #4]
	mov r1, r1, lsl #2
	ldrsh r1, [r0, r1]
	ldr r0, _022E9CA4 ; =DIRECTIONS_XY + 2
	add r1, r2, r1, lsl #1
	strh r1, [sl]
	ldrb r1, [r8, #0x4c]
	ldrsh r2, [sb, #6]
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	add r0, r2, r0, lsl #1
	strh r0, [sl, #2]
	b _022E9C98
_022E9C8C:
	strh r2, [sl]
	ldrsh r0, [r8, #0x5c]
	strh r0, [sl, #2]
_022E9C98:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E9CA0: .word DIRECTIONS_XY
_022E9CA4: .word DIRECTIONS_XY + 2
_022E9CA8: .word DUNGEON_PTR
_022E9CAC: .word ov29_0235179C
_022E9CB0: .word ov29_023517A0
_022E9CB4: .word ov29_023517A2
	arm_func_end ov29_022E9A9C

	arm_func_start ov29_022E9CB8
ov29_022E9CB8: ; 0x022E9CB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _022E9F04 ; =ov29_0237C850
	ldr r0, _022E9F08 ; =0xFFFF000F
	ldrh r2, [r1, #0x1a]
	mov lr, #0
	and r2, r2, r0
	strh r2, [r1, #0x1a]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x100
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x200
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc00
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x1000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	orr r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x16]
	and r2, r2, r0, asr #7
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0x3e00
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	orr r2, r2, #0x4000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x18]
	and r0, r2, r0, asr #6
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xc00
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xf000
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #1
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #2
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #4
	strh r0, [r1, #0x1a]
_022E9DA0:
	mov r0, #0x48
	mul r5, lr, r0
	ldr r3, _022E9F0C ; =ov29_0237C888
	mov r8, #0x400
	ldr r2, _022E9F10 ; =ov29_02351628
	mov r1, #0x18
	mla r6, lr, r1, r2
	ldr r0, _022E9F14 ; =ov29_02351658
	add r4, r3, r5
	add r5, r0, r5
	mov ip, #0
	rsb r8, r8, #0
	mov r7, #0xc
_022E9DD4:
	mul r3, ip, r7
	ldrh r2, [r4, r3]
	add r1, r5, r3
	ldr r0, [r5, r3]
	bic r2, r2, #0x100
	strh r2, [r4, r3]
	ldrh r2, [r4, r3]
	ldr sl, [r1, #4]
	ldr sb, [r1, #8]
	bic r1, r2, #0x200
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov r0, r0, lsl #0x1e
	add r2, r4, r3
	bic r1, r1, #0xc00
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov sl, sl, lsl #0x1e
	and sb, sb, r8, lsr #22
	bic r1, r1, #0x1000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0xc000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r0, r1, r0, lsr #16
	strh r0, [r4, r3]
	ldrh r0, [r2, #2]
	bic r0, r0, #0x3e00
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	bic r0, r0, #0xc000
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	orr r0, r0, sl, lsr #16
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	and r0, r0, r8
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, sb
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r3, [r2, #4]
	mov r1, ip, lsl #2
	add r0, r6, ip, lsl #2
	bic r3, r3, #0xf000
	strh r3, [r2, #4]
	ldrh r3, [r2, #6]
	add ip, ip, #1
	ldrh r1, [r6, r1]
	bic r3, r3, #1
	strh r3, [r2, #6]
	ldrh r3, [r2, #6]
	ldrh r0, [r0, #2]
	cmp ip, #6
	bic r3, r3, #2
	strh r3, [r2, #6]
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	blt _022E9DD4
	add lr, lr, #1
	cmp lr, #2
	blt _022E9DA0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E9F04: .word ov29_0237C850
_022E9F08: .word 0xFFFF000F
_022E9F0C: .word ov29_0237C888
_022E9F10: .word ov29_02351628
_022E9F14: .word ov29_02351658
	arm_func_end ov29_022E9CB8

	arm_func_start ov29_022E9F18
ov29_022E9F18: ; 0x022E9F18
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F70 ; =0x000003E7
	ldr r1, _022E9F74 ; =ov29_0237C850
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _022E9F78 ; =ov29_02353560
	str r2, [r1, #0x10]
	strb r2, [r0, #2]
	strh r2, [r1, #0x1c]
	bl ov29_022E9CB8
	ldr r2, _022E9F7C ; =DUNGEON_PTR
	mov r3, #1
	ldr r0, [r2]
	ldr r1, _022E9F74 ; =ov29_0237C850
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r3, [r0, #0x1a8]
#else
	strb r3, [r0, #0x24c]
#endif
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r3, [r0, #0x1a9]
#else
	strb r3, [r0, #0x24d]
#endif
	str r2, [r1, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F70: .word 0x000003E7
_022E9F74: .word ov29_0237C850
_022E9F78: .word ov29_02353560
_022E9F7C: .word DUNGEON_PTR
	arm_func_end ov29_022E9F18

	arm_func_start ov29_022E9F80
ov29_022E9F80: ; 0x022E9F80
	ldr r2, _022E9F98 ; =ov29_02353560
	mov r3, #0
	strb r0, [r2]
	str r1, [r2, #8]
	str r3, [r2, #0xc]
	bx lr
	.align 2, 0
_022E9F98: .word ov29_02353560
	arm_func_end ov29_022E9F80

	arm_func_start ov29_022E9F9C
ov29_022E9F9C: ; 0x022E9F9C
	ldr r0, _022E9FBC ; =ov29_02353560
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldrneb r2, [r0, #5]
	movne r1, #0
	strneb r2, [r0, #6]
	strneb r1, [r0, #1]
	bx lr
	.align 2, 0
_022E9FBC: .word ov29_02353560
	arm_func_end ov29_022E9F9C

	arm_func_start ov29_022E9FC0
ov29_022E9FC0: ; 0x022E9FC0
	ldr r0, _022E9FCC ; =ov29_02353560
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_022E9FCC: .word ov29_02353560
	arm_func_end ov29_022E9FC0

	arm_func_start ov29_022E9FD0
ov29_022E9FD0: ; 0x022E9FD0
	ldr r1, _022E9FDC ; =ov29_02353560
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_022E9FDC: .word ov29_02353560
	arm_func_end ov29_022E9FD0

	arm_func_start AdvanceFrame
AdvanceFrame: ; 0x022E9FE0
	stmdb sp!, {r3, lr}
	ldr r1, _022EA004 ; =ov29_02353560
	ldrb r1, [r1, #3]
	cmp r1, #0
	beq _022E9FFC
	bl ov29_022EA2A4
	ldmia sp!, {r3, pc}
_022E9FFC:
	bl ov29_022EA324
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA004: .word ov29_02353560
	arm_func_end AdvanceFrame

	arm_func_start ov29_022EA008
ov29_022EA008: ; 0x022EA008
#ifdef JAPAN
#define OV29_022EA008_OFFSET -0xA4
#else
#define OV29_022EA008_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022EA294 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA27C
	bl ov29_0234B854
	bl HandleTopScreenFades
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	beq _022EA0F8
	mov r0, #1
	bl UpdateCamera
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230 + OV29_022EA008_OFFSET]
	ldrsh r0, [ip, r0]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, #1
	mov r3, #0
	bl sub_02051E20
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r1]
	add ip, r0, #0x1a000
	ldrb r0, [ip, #0x251 + OV29_022EA008_OFFSET]
	cmp r0, #0
	beq _022EA0DC
	mov r0, #2
	strb r0, [ip, #0x23c + OV29_022EA008_OFFSET]
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230 + OV29_022EA008_OFFSET]
	mov r2, #0
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	ldrsh r0, [ip, r0]
	mov r3, r2
	mov r1, r1, asr #0x10
	bl sub_02051E20
	b _022EA0F8
_022EA0DC:
	mov r0, #0
	mov lr, #3
	mov r1, r0
	mov r2, r0
	mov r3, r0
	strb lr, [ip, #0x23c + OV29_022EA008_OFFSET]
	bl sub_02051E20
_022EA0F8:
	bl ov29_0230473C
	bl ov29_022E1854
	bl ov29_022E335C
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrsh r0, [r1, #0x1c]
	cmp r0, #0x64
	addlt r0, r0, #1
	strlth r0, [r1, #0x1c]
	ldr r0, _022EA29C ; =ov29_0237C850
	ldr r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	bne _022EA140
	mov r0, #0
	bl FlashLeaderIcon
	b _022EA154
_022EA140:
	bl sub_0204AEA0
	cmp r0, #3
	bne _022EA154
	mov r0, #1
	bl FlashLeaderIcon
_022EA154:
	bl ov29_022EA64C
	bl ov29_022EA80C
	bl DisplayUi
	ldr r1, _022EA294 ; =ov29_02353560
	ldrb r0, [r1]
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r2, [r0, #0x24a + OV29_022EA008_OFFSET]
	cmp r2, #0
	beq _022EA1B8
	bl ov29_022DE11C
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r0]
	ldr r1, _022EA294 ; =ov29_02353560
	add r0, r0, #0x1a000
	strb r2, [r0, #0x24a + OV29_022EA008_OFFSET]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	b _022EA1D0
_022EA1B8:
	ldr r2, [r1, #0xc]
	sub r2, r2, #1
	str r2, [r1, #0xc]
	cmp r2, #0
	movle r1, #1
	strleb r1, [r0, #0x24a + OV29_022EA008_OFFSET]
_022EA1D0:
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x24a + OV29_022EA008_OFFSET]
	cmp r0, #0
	beq _022EA214
	bl ov29_0234B4F4
	cmp r0, #3
	beq _022EA214
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA294 ; =ov29_02353560
	ldr r1, [r1]
	ldrb r3, [r0, #2]
	add r2, r1, #0x1e0
	mov r0, #0xa0
	mov r1, #0x20
	bl ov29_022DE134
_022EA214:
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA2A0 ; =0x0001A21C
	ldr r2, [r1]
	add r1, r0, #2
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bl GetTile
	cmp r0, #0
	beq _022EA260
	ldr r2, _022EA290 ; =DUNGEON_PTR
	ldrb r1, [r0, #7]
	ldr r2, [r2]
	cmp r2, #0
	addne r0, r2, #0xc4 + OV29_022EA008_OFFSET
	addne r0, r0, #0x4000
	add r2, r2, #0x21c + OV29_022EA008_OFFSET
	moveq r0, #0
	add r2, r2, #0x1a000
	bl ov29_022ED800
_022EA260:
	bl RenderWeather3D
	bl ov29_022E8C10
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x2180
	add r0, r0, #0x18000
#else
	add r0, r0, #0x224
	add r0, r0, #0x1a000
#endif
	bl ov29_022DD8B4
_022EA27C:
	ldr r0, _022EA29C ; =ov29_0237C850
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA290: .word DUNGEON_PTR
_022EA294: .word ov29_02353560
_022EA298: .word 0x0001A224 + OV29_022EA008_OFFSET
_022EA29C: .word ov29_0237C850
_022EA2A0: .word 0x0001A21C + OV29_022EA008_OFFSET
	arm_func_end ov29_022EA008

	arm_func_start ov29_022EA2A4
ov29_022EA2A4: ; 0x022EA2A4
	stmdb sp!, {r3, lr}
	ldr r0, _022EA318 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	bne _022EA2C0
	bl ov29_022DDEF8
	ldmia sp!, {r3, pc}
_022EA2C0:
	ldr r0, _022EA31C ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =ov29_0237C850
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA318 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a4]
#else
	strb r1, [r0, #0x248]
#endif
	bl InitWeirdMinimapMatrix
	ldr r0, _022EA31C ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =ov29_0237C850
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA318: .word DUNGEON_PTR
_022EA31C: .word ov29_02353560
_022EA320: .word ov29_0237C850
	arm_func_end ov29_022EA2A4

	arm_func_start ov29_022EA324
ov29_022EA324: ; 0x022EA324
	stmdb sp!, {r3, lr}
	ldr r0, _022EA368 ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =ov29_0237C850
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA368 ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =ov29_0237C850
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA368: .word ov29_02353560
_022EA36C: .word ov29_0237C850
	arm_func_end ov29_022EA324

	arm_func_start ov29_022EA370
ov29_022EA370: ; 0x022EA370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r4, _022EA3B0 ; =ov29_02353560
	b _022EA3A4
_022EA384:
	ldrb r0, [r4, #3]
	cmp r0, #0
	mov r0, r5
	beq _022EA39C
	bl ov29_022EA2A4
	b _022EA3A0
_022EA39C:
	bl ov29_022EA324
_022EA3A0:
	sub r6, r6, #1
_022EA3A4:
	cmp r6, #0
	bne _022EA384
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3B0: .word ov29_02353560
	arm_func_end ov29_022EA370

	arm_func_start ov29_022EA3B4
ov29_022EA3B4: ; 0x022EA3B4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022EA3F0 ; =ov29_0237C694
	ldr r5, _022EA3F4 ; =ov29_02353560
	mov r6, r0
_022EA3C4:
	ldrb r0, [r5, #3]
	cmp r0, #0
	mov r0, r6
	beq _022EA3DC
	bl ov29_022EA2A4
	b _022EA3E0
_022EA3DC:
	bl ov29_022EA324
_022EA3E0:
	ldrh r0, [r4]
	tst r0, #0xf0
	bne _022EA3C4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3F0: .word ov29_0237C694
_022EA3F4: .word ov29_02353560
	arm_func_end ov29_022EA3B4

	arm_func_start ov29_022EA3F8
ov29_022EA3F8: ; 0x022EA3F8
	ldr ip, _022EA404 ; =ov29_022DE638
	mov r0, #0x100
	bx ip
	.align 2, 0
_022EA404: .word ov29_022DE638
	arm_func_end ov29_022EA3F8

	arm_func_start ov29_022EA408
ov29_022EA408: ; 0x022EA408
	ldr r0, _022EA414 ; =ov29_0237C850
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022EA414: .word ov29_0237C850
	arm_func_end ov29_022EA408

	arm_func_start ov29_022EA418
ov29_022EA418: ; 0x022EA418
	ldr r1, _022EA424 ; =ov29_02353560
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_022EA424: .word ov29_02353560
	arm_func_end ov29_022EA418

	arm_func_start ov29_022EA428
ov29_022EA428: ; 0x022EA428
	stmdb sp!, {r4, lr}
	ldr r1, _022EA620 ; =ov29_0237C850
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xd
	bgt _022EA48C
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _022EA614
_022EA454: ; jump table
	b _022EA4B4 ; case 0
	b _022EA498 ; case 1
	b _022EA540 ; case 2
	b _022EA4E0 ; case 3
	b _022EA540 ; case 4
	b _022EA570 ; case 5
	b _022EA508 ; case 6
	b _022EA524 ; case 7
	b _022EA5C4 ; case 8
	b _022EA5E0 ; case 9
	b _022EA614 ; case 10
	b _022EA5FC ; case 11
	b _022EA614 ; case 12
	b _022EA594 ; case 13
_022EA48C:
	ldr r0, _022EA624 ; =0x000003E7
	cmp r4, r0
	b _022EA614
_022EA498:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA4B4:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	bl UpdateMinimap
	mov r0, #0
	bl ov29_02339FF4
	b _022EA614
_022EA4E0:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	mov r0, #1
	bl ov29_02339FF4
	b _022EA614
_022EA508:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA524:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA540:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	bl sub_0204AEC0
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA570:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA594:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA5BC
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA5BC
	bl UpdateMinimap
	mov r0, #1
	bl ov29_02339FF4
_022EA5BC:
	mov r4, #0
	b _022EA614
_022EA5C4:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5E0:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5FC:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
_022EA614:
	ldr r0, _022EA620 ; =ov29_0237C850
	str r4, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA620: .word ov29_0237C850
_022EA624: .word 0x000003E7
_022EA628: .word ov29_02353560
	arm_func_end ov29_022EA428

	arm_func_start ov29_022EA62C
ov29_022EA62C: ; 0x022EA62C
	ldr r1, _022EA644 ; =ov29_0237C850
	mov r2, #0xa
	ldr ip, _022EA648 ; =ov29_0234B1A4
	mov r0, #0
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_022EA644: .word ov29_0237C850
_022EA648: .word ov29_0234B1A4
	arm_func_end ov29_022EA62C

	arm_func_start ov29_022EA64C
ov29_022EA64C: ; 0x022EA64C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _022EA708 ; =ov29_0237C850
	mov r2, #0
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	movmi r1, #0
	strmi r1, [r0, #8]
	ldr r0, _022EA708 ; =ov29_0237C850
	ldr r1, [r0, #8]
	cmp r1, #0xc
	movge r1, #0
	strge r1, [r0, #8]
	ldr r0, _022EA708 ; =ov29_0237C850
	mov r1, #0xb
	ldr r3, [r0, #8]
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r0, r0, asr #2
	add ip, r0, r0, lsl #1
	str r2, [sp]
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =ov29_02353540
	ldr r1, _022EA710 ; =_020AFC4C
	ldr r2, [r0]
	ldr r0, [r1]
	add r1, r2, ip, lsl #8
	mov r2, #0x1e8
	mov r3, #0x100
	mov r4, ip, lsl #8
	bl sub_0201BAC8
	mov r0, #0
	str r0, [sp]
	mov r1, #0xb
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =ov29_02353540
	ldr r1, _022EA710 ; =_020AFC4C
	ldr ip, [r0]
	add r3, r4, #0x100
	ldr r0, [r1]
	add r1, ip, r3
	ldr r2, _022EA714 ; =0x000001EA
	mov r3, #0x200
	bl sub_0201BAC8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA708: .word ov29_0237C850
_022EA70C: .word ov29_02353540
_022EA710: .word _020AFC4C
_022EA714: .word 0x000001EA
	arm_func_end ov29_022EA64C

	arm_func_start DisplayAnimatedNumbers
DisplayAnimatedNumbers: ; 0x022EA718
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EA7FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
	mov fp, #0x29
	ldr r5, _022EA800 ; =ov29_0237C850
	ldr r4, _022EA804 ; =ov29_02353560
	b _022EA78C
_022EA75C:
	ldrsh r0, [r5, #0x1c]
	cmp r0, #0
	beq _022EA794
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _022EA780
	mov r0, fp
	bl ov29_022EA2A4
	b _022EA788
_022EA780:
	mov r0, #0x29
	bl ov29_022EA324
_022EA788:
	add r6, r6, #1
_022EA78C:
	cmp r6, #0x14
	blt _022EA75C
_022EA794:
	ldr r1, _022EA800 ; =ov29_0237C850
	mov r0, #0x3c
	str sl, [r1, #0x20]
	strb r8, [r1, #0x24]
	strh r0, [r1, #0x1c]
	str sb, [r1, #0x28]
	ldrh r2, [sb, #0x26]
	mov r0, #0
	cmp r7, #0
	str r2, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r0, [r1, #0x34]
	bge _022EA7F4
	ldr r0, _022EA808 ; =0xFFFFFC19
	cmp sl, r0
	movlt r0, #6
	strlth r0, [r1, #0x1e]
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movge r0, #0xa
	strgeh r0, [r1, #0x1e]
	movlt r0, #3
	strlth r0, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022EA7F4:
	strh r7, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EA7FC: .word DUNGEON_PTR
_022EA800: .word ov29_0237C850
_022EA804: .word ov29_02353560
_022EA808: .word 0xFFFFFC19
	arm_func_end DisplayAnimatedNumbers

	arm_func_start ov29_022EA80C
ov29_022EA80C: ; 0x022EA80C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r0, _022EA95C ; =ov29_0237C850
	ldrsh r1, [r0, #0x1c]
	cmp r1, #0
	beq _022EA954
	ldr r0, [r0, #0x28]
	cmp r0, #0
	moveq r0, #0
	beq _022EA848
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022EA848:
	cmp r0, #0
	ldreq r0, _022EA95C ; =ov29_0237C850
	moveq r1, #0
	streqh r1, [r0, #0x1c]
	beq _022EA954
	ldr r3, _022EA95C ; =ov29_0237C850
	ldr r5, [r3, #0x28]
	ldr r1, [r3, #0x2c]
	ldrh r0, [r5, #0x26]
	cmp r1, r0
	movne r0, #0
	strneh r0, [r3, #0x1c]
	bne _022EA954
	ldrsh r2, [r3, #0x1c]
	ldr r1, _022EA960 ; =DUNGEON_PTR
	ldr r0, _022EA964 ; =0x0001A224
	sub r2, r2, #1
	strh r2, [r3, #0x1c]
	ldr r4, [r3, #0x34]
	add r2, r0, #2
	sub lr, r4, #0x2e
	str lr, [r3, #0x34]
	ldr r4, [r5, #0xb4]
	ldr ip, [r1]
	add r1, r4, #0x100
#ifdef JAPAN
	ldrsh r5, [r1, #0x7e]
	ldrsh r4, [r1, #0x80]
#else
	ldrsh r5, [r1, #0x82]
	ldrsh r4, [r1, #0x84]
#endif
	ldr r1, [r3, #0x30]
	ldrsh r0, [ip, r0]
	add r5, r5, r1, asr #8
	ldrsh r1, [ip, r2]
	add r4, r4, lr, asr #8
	sub r2, r4, #0x18
	sub r4, r5, r0
	mvn r0, #0x1f
	cmp r4, r0
	sub r5, r2, r1
	addge r0, r0, #0x18
	cmpge r5, r0
	blt _022EA954
	cmp r4, #0xff
	cmplt r5, #0xc0
	bge _022EA954
	ldrsh r1, [r3, #0x1c]
	mov r0, #0xff
	cmp r1, #0x1f
	bge _022EA910
	rsb r0, r1, r1, lsl #8
	mov r1, #0x1f
	bl _s32_div_f
_022EA910:
	ldr ip, _022EA95C ; =ov29_0237C850
	mov r1, r4, lsl #0x10
	ldrh r4, [ip, #0x1e]
	mov r2, r5, lsl #0x10
	mov r3, r0, lsl #0x10
	str r4, [sp]
	ldr r4, [ip, #0x20]
	mov r0, r1, asr #0x10
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	str r1, [sp, #4]
	ldrb r4, [ip, #0x24]
	mov r1, r2, asr #0x10
	mov r3, r3, asr #0x10
	mov r2, #0xff
	str r4, [sp, #8]
	bl ov29_02335F40
_022EA954:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022EA95C: .word ov29_0237C850
_022EA960: .word DUNGEON_PTR
#ifdef JAPAN
_022EA964: .word 0x0001A180
#else
_022EA964: .word 0x0001A224
#endif
	arm_func_end ov29_022EA80C

	arm_func_start SetDungeonRngPreseed23Bit
SetDungeonRngPreseed23Bit: ; 0x022EA968
	orr r1, r0, #1
	ldr r0, _022EA97C ; =DUNGEON_PRNG_STATE
	bic r1, r1, #0xff000000
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022EA97C: .word DUNGEON_PRNG_STATE
	arm_func_end SetDungeonRngPreseed23Bit

	arm_func_start GenerateDungeonRngSeed
GenerateDungeonRngSeed: ; 0x022EA980
	ldr r2, _022EA9C4 ; =DUNGEON_PRNG_STATE
	mov r1, #0x10000
	ldr r3, [r2, #8]
	ldr r0, _022EA9C8 ; =0x5D588B65
	rsb r1, r1, #0
	mul ip, r3, r0
	add ip, ip, #1
	mul r0, ip, r0
	add r3, r0, #1
	mov r0, ip, lsr #0x10
	mov r0, r0, lsl #0x10
	and r1, r3, r1
	orr r0, r1, r0, lsr #16
	bic r0, r0, #0xff000000
	str r3, [r2, #8]
	orr r0, r0, #1
	bx lr
	.align 2, 0
_022EA9C4: .word DUNGEON_PRNG_STATE
_022EA9C8: .word 0x5D588B65
	arm_func_end GenerateDungeonRngSeed

	arm_func_start GetDungeonRngPreseed
GetDungeonRngPreseed: ; 0x022EA9CC
	ldr r0, _022EA9D8 ; =DUNGEON_PRNG_STATE
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022EA9D8: .word DUNGEON_PRNG_STATE
	arm_func_end GetDungeonRngPreseed

	arm_func_start SetDungeonRngPreseed
SetDungeonRngPreseed: ; 0x022EA9DC
	ldr r1, _022EA9E8 ; =DUNGEON_PRNG_STATE
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_022EA9E8: .word DUNGEON_PRNG_STATE
	arm_func_end SetDungeonRngPreseed
