	.include "asm/macros.inc"
	.include "overlay_29_022E9628.inc"

	.text

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
