	.include "asm/macros.inc"
	.include "overlay_29_0233ED34.inc"

	.text

	arm_func_start GenerateRoomImperfections
GenerateRoomImperfections: ; 0x0233ED34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov fp, #0
	b _0233F100
_0233ED50:
	ldr r1, _0233F114 ; =0x000001C2
	ldr r0, [sp]
	mov sl, #0
	mla r0, fp, r1, r0
	str r0, [sp, #0xc]
	mvn r0, #0
	str r0, [sp, #0x30]
	b _0233F0F0
_0233ED70:
	ldr r0, [sp, #0xc]
	mov r1, #0x1e
	mla sb, sl, r1, r0
	ldrb r0, [sb, #8]
	cmp r0, #0
	ldreqb r0, [sb, #0x11]
	cmpeq r0, #0
	ldreqb r0, [sb, #0x12]
	cmpeq r0, #0
	bne _0233F0EC
	ldrb r0, [sb, #0xb]
	cmp r0, #0
	ldrneb r0, [sb, #0xa]
	cmpne r0, #0
	beq _0233F0EC
	ldrb r0, [sb, #9]
	cmp r0, #0
	ldreqb r0, [sb, #0x10]
	cmpeq r0, #0
	bne _0233F0EC
	ldrb r0, [sb, #0x1c]
	cmp r0, #0
	beq _0233F0EC
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x3c
	blt _0233F0EC
	ldrsh r3, [sb, #4]
	ldrsh r2, [sb]
	ldrsh r1, [sb, #6]
	ldrsh r0, [sb, #2]
	sub r2, r3, r2
	sub r0, r1, r0
	add r1, r2, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	movs r0, r0, asr #2
	str r0, [sp, #0x24]
	moveq r0, #1
	streq r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x2c]
	b _0233F0DC
_0233EE1C:
	mov r4, #0
_0233EE20:
	mov r0, #4
	bl DungeonRandInt
	str r0, [sp, #0x20]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233EE48
_0233EE38: ; jump table
	b _0233EE48 ; case 0
	b _0233EE70 ; case 1
	b _0233EE9C ; case 2
	b _0233EECC ; case 3
_0233EE48:
	cmp r4, #0
	movne r0, #1
	strne r0, [sp, #0x28]
	movne r5, #0
	moveq r0, #0
	ldrsh r8, [sb]
	ldrsh r7, [sb, #2]
	streq r0, [sp, #0x28]
	moveq r5, #1
	b _0233EEF4
_0233EE70:
	ldrsh r0, [sb, #4]
	cmp r4, #0
	movne r5, #1
	sub r8, r0, #1
	movne r0, #0
	strne r0, [sp, #0x28]
	ldreq r0, [sp, #0x30]
	ldrsh r7, [sb, #2]
	streq r0, [sp, #0x28]
	moveq r5, #0
	b _0233EEF4
_0233EE9C:
	ldrsh r0, [sb, #6]
	cmp r4, #0
	ldrsh r1, [sb, #4]
	sub r7, r0, #1
	ldrne r0, [sp, #0x30]
	movne r5, #0
	strne r0, [sp, #0x28]
	moveq r0, #0
	sub r8, r1, #1
	streq r0, [sp, #0x28]
	ldreq r5, [sp, #0x30]
	b _0233EEF4
_0233EECC:
	ldrsh r0, [sb, #6]
	cmp r4, #0
	ldrne r5, [sp, #0x30]
	sub r7, r0, #1
	movne r0, #0
	strne r0, [sp, #0x28]
	moveq r0, #1
	ldrsh r8, [sb]
	streq r0, [sp, #0x28]
	moveq r5, #0
_0233EEF4:
	mov r6, #0
	b _0233F0BC
_0233EEFC:
	ldrsh r0, [sb]
	cmp r8, r0
	blt _0233F0C4
	ldrsh r0, [sb, #4]
	cmp r8, r0
	bge _0233F0C4
	ldrsh r0, [sb, #2]
	cmp r7, r0
	blt _0233F0C4
	ldrsh r0, [sb, #6]
	cmp r7, r0
	bge _0233F0C4
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233F0AC
	mov r5, #0
	b _0233F014
_0233EF50:
	ldr r0, _0233F118 ; =DIRECTIONS_XY
	mov r1, r5, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r5, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r7, r1
	str r0, [sp, #0x18]
	ldr r6, [sp, #0x30]
	b _0233EFFC
_0233EF84:
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x14]
	b _0233EFE0
_0233EF90:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	ldr r1, [sp, #0x18]
	add r1, r1, r6
	bl GetTile
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	bne _0233EFD4
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	moveq r0, #1
	streq r0, [sp, #0x10]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233EFEC
_0233EFD4:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
_0233EFE0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _0233EF90
_0233EFEC:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233F004
	add r6, r6, #1
_0233EFFC:
	cmp r6, #1
	ble _0233EF84
_0233F004:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233F01C
	add r5, r5, #1
_0233F014:
	cmp r5, #8
	blt _0233EF50
_0233F01C:
	cmp r5, #8
	bne _0233F0C4
	ldr r1, _0233F11C ; =CORNER_CARDINAL_NEIGHBOR_IS_OPEN
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r6, r1, r0, lsl #3
	b _0233F080
_0233F038:
	ldr r0, _0233F118 ; =DIRECTIONS_XY
	mov r1, r5, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r5, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r8, r2
	add r1, r7, r1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r1, r0, #0xff
	ldrb r0, [r5, r6]
	cmp r1, r0
	bne _0233F088
	add r5, r5, #2
_0233F080:
	cmp r5, #8
	blt _0233F038
_0233F088:
	cmp r5, #8
	bne _0233F0C4
	mov r0, r8
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	b _0233F0C4
_0233F0AC:
	ldr r0, [sp, #0x28]
	add r7, r7, r5
	add r8, r8, r0
	add r6, r6, #1
_0233F0BC:
	cmp r6, #0xa
	blt _0233EEFC
_0233F0C4:
	add r4, r4, #1
	cmp r4, #2
	blt _0233EE20
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
_0233F0DC:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	blt _0233EE1C
_0233F0EC:
	add sl, sl, #1
_0233F0F0:
	ldr r0, [sp, #8]
	cmp sl, r0
	blt _0233ED70
	add fp, fp, #1
_0233F100:
	ldr r0, [sp, #4]
	cmp fp, r0
	blt _0233ED50
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233F114: .word 0x000001C2
_0233F118: .word DIRECTIONS_XY
_0233F11C: .word CORNER_CARDINAL_NEIGHBOR_IS_OPEN
	arm_func_end GenerateRoomImperfections

	arm_func_start CreateHallway
CreateHallway: ; 0x0233F120
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r6, [sp, #0x28]
	mov sl, r0
	ldr r0, [sp, #0x30]
	mov sb, r1
	cmp r6, #0
	mov r8, r2
	mov r7, r3
	mov r4, sl
	mov r5, sb
	ldr fp, [sp, #0x2c]
	str r0, [sp, #0x30]
	mov r6, #0
	beq _0233F328
	b _0233F1C4
_0233F15C:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F1AC
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F1B4
_0233F1AC:
	cmp sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F1B4:
	ldr r0, [sp, #0x30]
	cmp sb, r0
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F1C4:
	ldr r0, [sp, #0x30]
	cmp sb, r0
	bne _0233F15C
	mov r6, #0
	b _0233F240
_0233F1D8:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F228
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F234
_0233F228:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F234:
	cmp sl, r8
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F240:
	cmp sl, r8
	bne _0233F1D8
	mov r6, #0
	b _0233F2B8
_0233F250:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F2A0
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F2AC
_0233F2A0:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F2AC:
	cmp sb, r7
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F2B8:
	cmp sb, r7
	bne _0233F250
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F2C4:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F314
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F31C
_0233F314:
	cmp sl, r4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F31C:
	cmp sl, fp
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F328:
	cmp sl, fp
	bne _0233F2C4
	mov r6, #0
	b _0233F3A0
_0233F338:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F388
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F394
_0233F388:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F394:
	cmp sb, r7
	addlt sb, sb, #1
	subge sb, sb, #1
_0233F3A0:
	cmp sb, r7
	bne _0233F338
	mov r6, #0
	b _0233F418
_0233F3B0:
	cmp r6, #0x38
	add r6, r6, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _0233F400
	mov r0, sl
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233F40C
_0233F400:
	cmp sl, r4
	cmpeq sb, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233F40C:
	cmp sl, r8
	addlt sl, sl, #1
	subge sl, sl, #1
_0233F418:
	cmp sl, r8
	bne _0233F3B0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end CreateHallway

	arm_func_start EnsureConnectedGrid
EnsureConnectedGrid: ; 0x0233F424
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	str r0, [sp, #0xc]
	mov r7, r1
	mov fp, r2
	mov r6, r3
	ldr r5, [sp, #0x50]
	mov r8, #0
	b _0233F818
_0233F448:
	ldr r1, _0233F8FC ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov r4, #0
	mla sb, r8, r1, r0
	sub r0, fp, #1
	str r0, [sp, #0x20]
	add r0, r6, r8, lsl #2
	str r0, [sp, #0x28]
	sub r0, r7, #1
	str r0, [sp, #0x24]
	b _0233F80C
_0233F474:
	mov r0, #0x1e
	mla sl, r4, r0, sb
	ldrb r0, [sl, #8]
	cmp r0, #0
	ldreqb r0, [sl, #0x11]
	cmpeq r0, #0
	ldreqb r0, [sl, #0xb]
	cmpeq r0, #0
	bne _0233F808
	ldrb r0, [sl, #0xa]
	cmp r0, #0
	beq _0233F7CC
	ldrb r0, [sl, #9]
	cmp r0, #0
	bne _0233F7CC
	ldrsh r0, [sl]
	ldrsh r1, [sl, #4]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x1c]
	ldrsh r0, [sl, #2]
	ldrsh r1, [sl, #6]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x18]
	cmp r4, #0
	ble _0233F590
	ldrb r0, [sl, #-0x16]
	cmp r0, #0
	ldreqb r0, [sl, #-0xc]
	cmpeq r0, #0
	bne _0233F590
	ldrb r0, [sl, #-0x13]
	cmp r0, #0
	beq _0233F590
	ldrb r0, [sl, #-0x14]
	cmp r0, #0
	ldrsh r0, [sl, #-0x1e]
	streq r0, [sp, #0x14]
	beq _0233F544
	ldrsh r1, [sl, #-0x1a]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x14]
	ldrsh r0, [sl, #-0x1c]
	ldrsh r1, [sl, #-0x18]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
_0233F544:
	mov r1, #1
	str r1, [sp]
	mov r1, #0x1e
	mla sl, r4, r1, sb
	ldr r1, [r6, r8, lsl #2]
	ldr r0, [sp, #0x1c]
	str r1, [sp, #4]
	ldr r1, [r5, r4, lsl #2]
	ldr r2, [sp, #0x14]
	str r1, [sp, #8]
	ldrsh r3, [sl, #-0x18]
	ldrsh r1, [sl, #2]
	sub r3, r3, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x13]
	strb r0, [sl, #-0xa]
	b _0233F808
_0233F590:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _0233F64C
	ldrb r0, [sl, #0x26]
	cmp r0, #0
	ldreqb r0, [sl, #0x30]
	cmpeq r0, #0
	bne _0233F64C
	ldrb r0, [sl, #0x29]
	cmp r0, #0
	beq _0233F64C
	ldrb r0, [sl, #0x28]
	cmp r0, #0
	ldrsh r0, [sl, #0x1e]
	streq r0, [sp, #0x10]
	beq _0233F5F8
	ldrsh r1, [sl, #0x22]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
	str r0, [sp, #0x10]
	ldrsh r0, [sl, #0x20]
	ldrsh r1, [sl, #0x24]
	add r0, r0, #1
	sub r1, r1, #1
	bl DungeonRandRange
_0233F5F8:
	mov r1, #1
	str r1, [sp]
	mov r1, #0x1e
	mla sl, r4, r1, sb
	ldr r3, [r6, r8, lsl #2]
	add r1, r5, r4, lsl #2
	str r3, [sp, #4]
	ldr r1, [r1, #4]
	ldr r0, [sp, #0x1c]
	sub r1, r1, #1
	str r1, [sp, #8]
	ldrsh r1, [sl, #6]
	ldrsh r3, [sl, #0x20]
	ldr r2, [sp, #0x10]
	sub r1, r1, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x14]
	strb r0, [sl, #0x31]
	b _0233F808
_0233F64C:
	cmp r8, #0
	ble _0233F708
	ldrb r0, [sl, #-0x1ba]
	cmp r0, #0
	ldreqb r0, [sl, #-0x1b0]
	cmpeq r0, #0
	bne _0233F708
	ldrb r0, [sl, #-0x1b7]
	cmp r0, #0
	beq _0233F708
	ldrb r0, [sl, #-0x1b8]
	cmp r0, #0
	sub r0, sl, #0x100
	ldreqsh r3, [r0, #-0xc0]
	beq _0233F6B8
	ldrsh r1, [r0, #-0xbe]
	ldrsh r2, [r0, #-0xc2]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	sub r0, sl, #0x100
	ldrsh r1, [r0, #-0xbc]
	ldrsh r2, [r0, #-0xc0]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233F6B8:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	mul r0, r4, r0
	ldr ip, [r6, r8, lsl #2]
	add sl, sb, r0
	str ip, [sp, #4]
	ldr ip, [r5, r4, lsl #2]
	sub r2, sl, #0x100
	str ip, [sp, #8]
	ldrsh r2, [r2, #-0xc2]
	ldrsh r0, [sb, r0]
	ldr r1, [sp, #0x18]
	sub r2, r2, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x15]
	strb r0, [sl, #-0x1ac]
	b _0233F808
_0233F708:
	ldr r0, [sp, #0x24]
	cmp r8, r0
	bge _0233F808
	ldrb r0, [sl, #0x1ca]
	cmp r0, #0
	ldreqb r0, [sl, #0x1d4]
	cmpeq r0, #0
	bne _0233F808
	ldrb r0, [sl, #0x1cd]
	cmp r0, #0
	beq _0233F808
	ldrb r0, [sl, #0x1cc]
	cmp r0, #0
	add r0, sl, #0x100
	ldreqsh r3, [r0, #0xc4]
	beq _0233F778
	ldrsh r1, [r0, #0xc6]
	ldrsh r2, [r0, #0xc2]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	add r0, sl, #0x100
	ldrsh r1, [r0, #0xc8]
	ldrsh r2, [r0, #0xc4]
	sub r1, r1, #1
	add r0, r2, #1
	bl DungeonRandRange
	mov r3, r0
_0233F778:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x1e
	mla sl, r4, r0, sb
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	ldr r2, [r0, #4]
	add r0, sl, #0x100
	sub r2, r2, #1
	str r2, [sp, #4]
	ldr r2, [r5, r4, lsl #2]
	str r2, [sp, #8]
	ldrsh r2, [r0, #0xc2]
	ldrsh r0, [sl, #4]
	sub r0, r0, #1
	bl CreateHallway
	mov r0, #1
	strb r0, [sl, #0xb]
	strb r0, [sl, #0x16]
	strb r0, [sl, #0x1d7]
	b _0233F808
_0233F7CC:
	ldrsh r0, [sl]
	ldrsh r1, [sl, #2]
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #2
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_0233F808:
	add r4, r4, #1
_0233F80C:
	cmp r4, fp
	blt _0233F474
	add r8, r8, #1
_0233F818:
	cmp r8, r7
	blt _0233F448
	mov r8, #0
	b _0233F8EC
_0233F828:
	ldr r1, _0233F8FC ; =0x000001C2
	ldr r0, [sp, #0xc]
	mov sb, #0
	mla sl, r8, r1, r0
	b _0233F8E0
_0233F83C:
	mov r0, #0x1e
	mla r5, sb, r0, sl
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldreqb r0, [r5, #0x11]
	cmpeq r0, #0
	ldreqb r0, [r5, #0xb]
	cmpeq r0, #0
	ldreqb r0, [r5, #0xf]
	cmpeq r0, #0
	bne _0233F8DC
	ldrsh r6, [r5]
	b _0233F8D0
_0233F870:
	ldrsh r4, [r5, #2]
	b _0233F8C0
_0233F878:
	mov r0, r6
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #2
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #7]
_0233F8C0:
	ldrsh r0, [r5, #6]
	cmp r4, r0
	blt _0233F878
	add r6, r6, #1
_0233F8D0:
	ldrsh r0, [r5, #4]
	cmp r6, r0
	blt _0233F870
_0233F8DC:
	add sb, sb, #1
_0233F8E0:
	cmp sb, fp
	blt _0233F83C
	add r8, r8, #1
_0233F8EC:
	cmp r8, r7
	blt _0233F828
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233F8FC: .word 0x000001C2
	arm_func_end EnsureConnectedGrid

	arm_func_start SetTerrainObstacleChecked
SetTerrainObstacleChecked: ; 0x0233F900
	ldrh r3, [r0]
	cmp r1, #0
	bic r1, r3, #3
	strh r1, [r0]
	bxeq lr
	ldrb r1, [r0, #7]
	cmp r1, r2
	bxne lr
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	bx lr
	arm_func_end SetTerrainObstacleChecked

	arm_func_start FinalizeJunctions
FinalizeJunctions: ; 0x0233F93C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
_0233F944:
	sub r5, r4, #1
	mov r6, #0
	mov r7, #0xff
_0233F950:
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _0233FAFC
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	bne _0233FAD4
	cmp r4, #0
	ble _0233F9D4
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233F9D4
	ldrh r1, [r0]
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233F9D4
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233F9D4:
	cmp r6, #0
	ble _0233FA28
	mov r0, r4
	sub r1, r6, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FA28
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FA28
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233FA28:
	cmp r6, #0x1f
	bge _0233FA7C
	mov r0, r4
	add r1, r6, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FA7C
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FA7C
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233FA7C:
	cmp r4, #0x37
	bge _0233FAFC
	mov r1, r6
	add r0, r4, #1
	bl GetTileSafe
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0233FAFC
	ldrh r1, [r0]
	orr r1, r1, #8
	orr r2, r1, #8
	and r1, r2, #3
	strh r2, [r0]
	cmp r1, #2
	bne _0233FAFC
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	b _0233FAFC
_0233FAD4:
	mov r0, r4
	mov r1, r6
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xfe
	bne _0233FAFC
	mov r0, r4
	mov r1, r6
	bl GetTileSafe
	strb r7, [r0, #7]
_0233FAFC:
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233F950
	add r4, r4, #1
	cmp r4, #0x38
	blt _0233F944
	bl ov29_0233FB1C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FinalizeJunctions

	arm_func_start ov29_0233FB1C
ov29_0233FB1C: ; 0x0233FB1C
#ifdef JAPAN
#define OV29_0233FB1C_OFFSET 0x5C
#else
#define OV29_0233FB1C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0233FBE4 ; =DUNGEON_PTR
	mov r1, #0
	ldr r6, [r0]
	mov r7, r1
_0233FB30:
	add r0, r6, r1, lsl #1
#ifdef JAPAN
	add r0, r0, #0xf100
#else
	add r0, r0, #0xf200
#endif
	add r1, r1, #1
	strh r7, [r0, #0x68 + OV29_0233FB1C_OFFSET]
	cmp r1, #0x20
	blt _0233FB30
_0233FB48:
	mov r0, r7, lsl #0x10
	mov r5, #0
	mov r4, r0, asr #0x10
_0233FB54:
	mov r0, r7
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #8
	beq _0233FBC8
	mov r0, r7
	mov r1, r5
	bl GetTile
	ldrb r2, [r0, #7]
	cmp r2, #0
	blt _0233FBC8
	cmp r2, #0x20
	addlt r0, r6, r2, lsl #1
#ifdef JAPAN
	addlt r1, r0, #0xf100
#else
	addlt r1, r0, #0xf200
#endif
	ldrltsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	cmplt r0, #0x20
	bge _0233FBC8
	add r2, r6, r2, lsl #7
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf200
#ifdef JAPAN
	strh r4, [r0, #4]
#else
	strh r4, [r0, #0xa8]
#endif
	ldrsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf200
#ifdef JAPAN
	strh r5, [r0, #6]
#else
	strh r5, [r0, #0xaa]
#endif
	ldrsh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
	add r0, r0, #1
	strh r0, [r1, #0x68 + OV29_0233FB1C_OFFSET]
_0233FBC8:
	add r5, r5, #1
	cmp r5, #0x20
	blt _0233FB54
	add r7, r7, #1
	cmp r7, #0x38
	blt _0233FB48
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233FBE4: .word DUNGEON_PTR
	arm_func_end ov29_0233FB1C

	arm_func_start GenerateKecleonShop
GenerateKecleonShop: ; 0x0233FBE8
#ifdef JAPAN
#define GENERATE_KECLEON_SHOP_OFFSET -0xA4
#else
#define GENERATE_KECLEON_SHOP_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r5, _0233FF8C ; =DUNGEON_PTR
	ldr r4, _0233FF90 ; =FLOOR_GENERATION_STATUS
	mvn r7, #0
	ldr r6, [r5]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	ldrb r4, [r4, #1]
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	mov r5, r3
	cmp r4, #0
	bne _0233FF84
	bl GetFloorType
	cmp r0, #2
	cmpne r5, #0
	beq _0233FF84
	mov r0, #0x64
	bl DungeonRandInt
	cmp r5, r0
	ble _0233FF84
	mov r4, #0
	add r2, sp, #0x26
	add r1, sp, #8
_0233FC50:
	mov r0, r4, lsl #0x10
	mov r3, r4, lsl #1
	mov r0, r0, asr #0x10
	add r4, r4, #1
	strh r0, [r2, r3]
	strh r0, [r1, r3]
	cmp r4, #0xf
	blt _0233FC50
	mov r7, #0xf
	mov r8, #0
	mov r5, r7
	add r4, sp, #0x26
_0233FC80:
	mov r0, r7
	bl DungeonRandInt
	mov sb, r0
	mov r0, r5
	bl DungeonRandInt
	mov r3, sb, lsl #1
	mov r1, r0, lsl #1
	add r8, r8, #1
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	cmp r8, #0xc8
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	blt _0233FC80
	mov r7, #0xf
	mov r8, #0
	mov r5, r7
	add r4, sp, #8
_0233FCC8:
	mov r0, r7
	bl DungeonRandInt
	mov sb, r0
	mov r0, r5
	bl DungeonRandInt
	mov r3, sb, lsl #1
	mov r1, r0, lsl #1
	add r8, r8, #1
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	cmp r8, #0xc8
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	blt _0233FCC8
	mov r4, #0
	b _0233FF7C
_0233FD08:
	add r0, sp, #0x26
	mov r1, r4, lsl #1
	ldrsh r1, [r0, r1]
	ldr r0, [sp]
	cmp r1, r0
	bge _0233FF78
	ldr r0, _0233FF94 ; =0x000001C2
	mov r5, #0
	mul fp, r1, r0
	add sb, sl, fp
	b _0233FF70
_0233FD34:
	mov r1, r5, lsl #1
	add r0, sp, #8
	ldrsh r1, [r0, r1]
	ldr r0, [sp, #4]
	cmp r1, r0
	bge _0233FF6C
	mov r0, #0x1e
	mul r7, r1, r0
	add r8, sb, r7
	ldrb r0, [r8, #8]
	cmp r0, #0
	ldreqb r0, [r8, #0x11]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x12]
	cmpeq r0, #0
	bne _0233FF6C
	ldrb r0, [r8, #0xb]
	cmp r0, #0
	ldrneb r0, [r8, #0xa]
	cmpne r0, #0
	beq _0233FF6C
	ldrb r0, [r8, #9]
	cmp r0, #0
	ldreqb r0, [r8, #0x10]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x1d]
	cmpeq r0, #0
	bne _0233FF6C
	ldrsh r1, [r8, #4]
	ldrsh r0, [r8]
	sub r0, r1, r0
	bl abs
	cmp r0, #5
	blt _0233FF6C
	ldrsh r1, [r8, #6]
	ldrsh r0, [r8, #2]
	sub r0, r1, r0
	bl abs
	cmp r0, #4
	blt _0233FF6C
	ldr r0, _0233FF90 ; =FLOOR_GENERATION_STATUS
	add r1, sl, fp
	mov r3, #1
	strb r3, [r0, #3]
	add r2, r1, r7
	strb r3, [r2, #0xc]
	ldrsh r1, [sb, r7]
	add r1, r1, #1
	str r1, [r0, #0x30]
	ldrsh r1, [r2, #4]
	sub r1, r1, #1
	str r1, [r0, #0x38]
	ldrsh r1, [r2, #2]
	add r3, r1, #1
	str r3, [r0, #0x34]
	ldrsh r1, [r2, #6]
	sub r2, r1, #1
	sub r1, r2, r3
	cmp r1, #3
	str r2, [r0, #0x3c]
	addlt r1, r2, #1
	strlt r1, [r0, #0x3c]
	ldr r1, _0233FF98 ; =0x0000270F
	add r0, r6, #0xc000
	str r1, [r0, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	str r1, [r0, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	rsb r2, r1, #0
	str r2, [r0, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r1, _0233FF90 ; =FLOOR_GENERATION_STATUS
	str r2, [r0, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r4, [r1, #0x30]
	b _0233FED8
_0233FE54:
	ldr sl, _0233FF90 ; =FLOOR_GENERATION_STATUS
	add r8, r6, #0xc000
	ldr r5, [sl, #0x34]
	b _0233FEC8
_0233FE64:
	mov r0, r4
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x20
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #8
	strh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #1
	strh r1, [r0, #2]
	ldr r0, [r8, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r4
	strgt r4, [r8, #0xd14 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r5
	strgt r5, [r8, #0xd18 + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r4
	strlt r4, [r8, #0xd1c + GENERATE_KECLEON_SHOP_OFFSET]
	ldr r0, [r8, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	cmp r0, r5
	strlt r5, [r8, #0xd20 + GENERATE_KECLEON_SHOP_OFFSET]
	add r5, r5, #1
_0233FEC8:
	ldr r0, [sl, #0x3c]
	cmp r5, r0
	blt _0233FE64
	add r4, r4, #1
_0233FED8:
	ldr r0, _0233FF90 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x38]
	cmp r4, r0
	blt _0233FE54
	add r4, sb, r7
	ldrsh r5, [sb, r7]
	b _0233FF28
_0233FEF4:
	ldrsh r6, [r4, #2]
	b _0233FF18
_0233FEFC:
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	orr r1, r1, #0x10
	strh r1, [r0, #2]
_0233FF18:
	ldrsh r0, [r4, #6]
	cmp r6, r0
	blt _0233FEFC
	add r5, r5, #1
_0233FF28:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233FEF4
	ldr r1, _0233FF90 ; =FLOOR_GENERATION_STATUS
	ldr r2, [r1, #0x30]
	ldr r0, [r1, #0x38]
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r1, #0x20]
	ldr r2, [r1, #0x34]
	ldr r0, [r1, #0x3c]
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r1, #0x22]
	b _0233FF84
_0233FF6C:
	add r5, r5, #1
_0233FF70:
	cmp r5, #0xf
	blt _0233FD34
_0233FF78:
	add r4, r4, #1
_0233FF7C:
	cmp r4, #0xf
	blt _0233FD08
_0233FF84:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233FF8C: .word DUNGEON_PTR
_0233FF90: .word FLOOR_GENERATION_STATUS
_0233FF94: .word 0x000001C2
_0233FF98: .word 0x0000270F
	arm_func_end GenerateKecleonShop

	arm_func_start GenerateMonsterHouse
GenerateMonsterHouse: ; 0x0233FF9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x100
	ldr r4, _02340218 ; =DUNGEON_PTR
	movs r5, r3
	mov sl, r0
	mov sb, r1
	mov r8, r2
	ldr r6, [r4]
	beq _02340210
	mov r0, #0x64
	bl DungeonRandInt
	cmp r5, r0
	ble _02340210
	ldr r0, _0234021C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #3]
	cmp r0, #0
	bne _02340210
	bl IsOutlawMonsterHouseFloor
	cmp r0, #0
	bne _0233FFF8
	bl IsDestinationFloorWithMonster
	cmp r0, #0
	bne _02340210
_0233FFF8:
	bl GetFloorType
	cmp r0, #0
	bne _02340210
	mov r5, #0
	mov r2, r5
	mov r1, r5
	b _02340088
_02340014:
	ldr r0, _02340220 ; =0x000001C2
	mov r3, r1
	mla r4, r2, r0, sl
	mov r7, #0x1e
	b _0234007C
_02340028:
	mla r0, r3, r7, r4
	ldrb fp, [r0, #8]
	cmp fp, #0
	ldreqb fp, [r0, #0x11]
	cmpeq fp, #0
	bne _02340078
	ldrb fp, [r0, #0xb]
	cmp fp, #0
	ldrneb fp, [r0, #0xa]
	cmpne fp, #0
	beq _02340078
	ldrb fp, [r0, #0xc]
	cmp fp, #0
	ldreqb fp, [r0, #0xf]
	cmpeq fp, #0
	ldreqb fp, [r0, #0x10]
	cmpeq fp, #0
	ldreqb r0, [r0, #9]
	cmpeq r0, #0
	addeq r5, r5, #1
_02340078:
	add r3, r3, #1
_0234007C:
	cmp r3, r8
	blt _02340028
	add r2, r2, #1
_02340088:
	cmp r2, sb
	blt _02340014
	cmp r5, #0
	beq _02340210
	mov r1, #0
	mov r7, r1
	add r0, sp, #0
_023400A4:
	strb r7, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x100
	blt _023400A4
	mov r0, #1
	strb r0, [sp]
	add fp, sp, #0
_023400C0:
	mov r0, r5
	bl DungeonRandInt
	mov r4, r0
	mov r0, r5
	bl DungeonRandInt
	add r7, r7, #1
	ldrb r2, [fp, r4]
	ldrb r1, [fp, r0]
	cmp r7, #0x40
	strb r1, [fp, r4]
	strb r2, [fp, r0]
	blt _023400C0
	mov r7, #0
	mov r4, r7
	add fp, sp, #0
	b _02340208
_02340100:
	ldr r0, _02340220 ; =0x000001C2
	mov r5, #0
	mul r3, r4, r0
	add r2, sl, r3
	mov lr, #0x1e
	b _023401FC
_02340118:
	mul r1, r5, lr
	add r0, r2, r1
	ldrb ip, [r0, #8]
	cmp ip, #0
	ldreqb ip, [r0, #0x11]
	cmpeq ip, #0
	bne _023401F8
	ldrb ip, [r0, #0xb]
	cmp ip, #0
	ldrneb ip, [r0, #0xa]
	cmpne ip, #0
	beq _023401F8
	ldrb ip, [r0, #0xc]
	cmp ip, #0
	ldreqb ip, [r0, #0xf]
	cmpeq ip, #0
	ldreqb ip, [r0, #0x10]
	cmpeq ip, #0
	ldreqb r0, [r0, #9]
	cmpeq r0, #0
	bne _023401F8
	ldrb r0, [fp, r7]
	cmp r0, #0
	beq _023401F4
	ldr r0, _0234021C ; =FLOOR_GENERATION_STATUS
	add r2, sl, r3
	mov r3, #1
	strb r3, [r0, #1]
	add r7, r2, r1
	strb r3, [r7, #0xe]
	ldrsh r5, [r2, r1]
	add r6, r6, #0x4000
	b _023401E4
_0234019C:
	ldrsh r4, [r7, #2]
	b _023401D4
_023401A4:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	orr r2, r2, #0x40
	strh r2, [r0]
	mov r0, r5
	bl GetTile
	ldrb r0, [r0, #7]
	add r4, r4, #1
#ifdef JAPAN
	strb r0, [r6, #0x25]
#else
	strb r0, [r6, #0xc9]
#endif
_023401D4:
	ldrsh r0, [r7, #6]
	cmp r4, r0
	blt _023401A4
	add r5, r5, #1
_023401E4:
	ldrsh r0, [r7, #4]
	cmp r5, r0
	blt _0234019C
	b _02340210
_023401F4:
	add r7, r7, #1
_023401F8:
	add r5, r5, #1
_023401FC:
	cmp r5, r8
	blt _02340118
	add r4, r4, #1
_02340208:
	cmp r4, sb
	blt _02340100
_02340210:
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02340218: .word DUNGEON_PTR
_0234021C: .word FLOOR_GENERATION_STATUS
_02340220: .word 0x000001C2
	arm_func_end GenerateMonsterHouse

	arm_func_start GenerateMazeRoom
GenerateMazeRoom: ; 0x02340224
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x100
	ldr r7, _02340450 ; =DUNGEON_PTR
	movs r8, r3
	mov r6, r0
	mov r5, r1
	mov r4, r2
	ldr r7, [r7]
	beq _02340448
	mov r0, #0x64
	bl DungeonRandInt
	cmp r8, r0
	ble _02340448
	add r0, r7, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x3a]
#else
	ldrsh r0, [r0, #0xde]
#endif
	cmp r0, #0
	bge _02340448
	mov sb, #0
	mov r1, sb
	b _02340310
_02340274:
	ldr r0, _02340454 ; =0x000001C2
	mov r2, #0
	mla r3, r1, r0, r6
	mov r7, #0x1e
	b _02340304
_02340288:
	mla r0, r2, r7, r3
	ldrb r8, [r0, #8]
	cmp r8, #0
	ldreqb r8, [r0, #0x11]
	cmpeq r8, #0
	bne _02340300
	ldrb r8, [r0, #0xb]
	cmp r8, #0
	ldrneb r8, [r0, #0xa]
	cmpne r8, #0
	beq _02340300
	ldrb r8, [r0, #0xc]
	cmp r8, #0
	ldreqb r8, [r0, #0xf]
	cmpeq r8, #0
	ldreqb r8, [r0, #0xe]
	cmpeq r8, #0
	ldreqb r8, [r0, #9]
	cmpeq r8, #0
	bne _02340300
	ldrsh sl, [r0, #4]
	ldrsh r8, [r0]
	sub r8, sl, r8
	tst r8, #1
	beq _02340300
	ldrsh r8, [r0, #6]
	ldrsh r0, [r0, #2]
	sub r0, r8, r0
	tst r0, #1
	addne sb, sb, #1
_02340300:
	add r2, r2, #1
_02340304:
	cmp r2, r4
	blt _02340288
	add r1, r1, #1
_02340310:
	cmp r1, r5
	blt _02340274
	cmp sb, #0
	beq _02340448
	mov r1, #0
	mov sl, r1
	add r0, sp, #0
_0234032C:
	strb sl, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x100
	blt _0234032C
	mov r0, #1
	strb r0, [sp]
	add r7, sp, #0
_02340348:
	mov r0, sb
	bl DungeonRandInt
	mov r8, r0
	mov r0, sb
	bl DungeonRandInt
	add sl, sl, #1
	ldrb r2, [r7, r8]
	ldrb r1, [r7, r0]
	cmp sl, #0x40
	strb r1, [r7, r8]
	strb r2, [r7, r0]
	blt _02340348
	mov r7, #0
	mov r2, r7
	b _02340440
_02340384:
	ldr r0, _02340454 ; =0x000001C2
	mov r3, #0
	mla r1, r2, r0, r6
	add sl, sp, #0
	mov r8, #0x1e
	b _02340434
_0234039C:
	mla r0, r3, r8, r1
	ldrb sb, [r0, #8]
	cmp sb, #0
	ldreqb sb, [r0, #0x11]
	cmpeq sb, #0
	bne _02340430
	ldrb sb, [r0, #0xb]
	cmp sb, #0
	ldrneb sb, [r0, #0xa]
	cmpne sb, #0
	beq _02340430
	ldrb sb, [r0, #0xc]
	cmp sb, #0
	ldreqb sb, [r0, #0xf]
	cmpeq sb, #0
	ldreqb sb, [r0, #0xe]
	cmpeq sb, #0
	ldreqb sb, [r0, #9]
	cmpeq sb, #0
	bne _02340430
	ldrsh ip, [r0, #4]
	ldrsh sb, [r0]
	sub sb, ip, sb
	tst sb, #1
	beq _02340430
	ldrsh ip, [r0, #6]
	ldrsh sb, [r0, #2]
	sub sb, ip, sb
	tst sb, #1
	beq _02340430
	ldrb sb, [sl, r7]
	cmp sb, #0
	beq _0234042C
	mov r1, #0
	bl GenerateMaze
	b _02340448
_0234042C:
	add r7, r7, #1
_02340430:
	add r3, r3, #1
_02340434:
	cmp r3, r4
	blt _0234039C
	add r2, r2, #1
_02340440:
	cmp r2, r5
	blt _02340384
_02340448:
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02340450: .word DUNGEON_PTR
_02340454: .word 0x000001C2
	arm_func_end GenerateMazeRoom

	arm_func_start GenerateMaze
GenerateMaze: ; 0x02340458
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r2, _023406D0 ; =FLOOR_GENERATION_STATUS
	mov r3, #1
	mov r5, r0
	strb r3, [r2, #7]
	strb r3, [r5, #0x10]
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTile
	ldrsh r1, [r5]
	ldrb r7, [r0, #7]
	add r6, r1, #1
	b _023404DC
_02340494:
	ldrsh r1, [r5, #2]
	mov r0, r6
	sub r1, r1, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023404D8
	ldrsh r3, [r5, #2]
	ldrsh r2, [r5, #4]
	mov r0, r6
	sub r1, r3, #1
	str r2, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	bl GenerateMazeLine
_023404D8:
	add r6, r6, #2
_023404DC:
	ldrsh r0, [r5, #4]
	sub r0, r0, #1
	cmp r6, r0
	blt _02340494
	ldrsh r0, [r5, #2]
	add r6, r0, #1
	b _02340538
_023404F8:
	ldrsh r0, [r5, #4]
	mov r1, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _02340534
	ldrsh r0, [r5, #4]
	mov r1, r6
	str r0, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_02340534:
	add r6, r6, #2
_02340538:
	ldrsh r0, [r5, #6]
	sub r0, r0, #1
	cmp r6, r0
	blt _023404F8
	ldrsh r0, [r5]
	add r6, r0, #1
	b _02340594
_02340554:
	ldrsh r1, [r5, #6]
	mov r0, r6
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _02340590
	ldrsh r1, [r5, #6]
	ldrsh r2, [r5, #4]
	mov r0, r6
	str r2, [sp]
	stmib sp, {r1, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_02340590:
	add r6, r6, #2
_02340594:
	ldrsh r0, [r5, #4]
	sub r0, r0, #1
	cmp r6, r0
	blt _02340554
	ldrsh r0, [r5, #2]
	add r6, r0, #1
	b _023405F8
_023405B0:
	ldrsh r0, [r5]
	mov r1, r6
	sub r0, r0, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023405F4
	ldrsh r2, [r5]
	ldrsh r3, [r5, #4]
	mov r1, r6
	sub r0, r2, #1
	str r3, [sp]
	ldrsh r3, [r5, #6]
	stmib sp, {r3, r4, r7}
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_023405F4:
	add r6, r6, #2
_023405F8:
	ldrsh r0, [r5, #6]
	sub r0, r0, #1
	cmp r6, r0
	blt _023405B0
	ldrsh r0, [r5]
	add r8, r0, #3
	b _023406B8
_02340614:
	ldrsh r0, [r5, #2]
	sub r6, r8, #1
	add sb, r0, #3
	b _023406A4
_02340624:
	mov r0, r8
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _023406A0
	cmp r4, #0
	mov r0, r6
	mov r1, sb
	beq _0234066C
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	b _02340678
_0234066C:
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
_02340678:
	strh r1, [r0]
	ldrsh r2, [r5, #4]
	mov r0, r8
	mov r1, sb
	str r2, [sp]
	ldrsh r2, [r5, #6]
	stmib sp, {r2, r4, r7}
	ldrsh r2, [r5]
	ldrsh r3, [r5, #2]
	bl GenerateMazeLine
_023406A0:
	add sb, sb, #2
_023406A4:
	ldrsh r0, [r5, #6]
	sub r0, r0, #3
	cmp sb, r0
	blt _02340624
	add r8, r8, #2
_023406B8:
	ldrsh r0, [r5, #4]
	sub r0, r0, #3
	cmp r8, r0
	blt _02340614
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023406D0: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateMaze

	arm_func_start GenerateMazeLine
GenerateMazeLine: ; 0x023406D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x34]
	ldr fp, [sp, #0x30]
	ldr r7, [sp, #0x38]
	ldr r6, [sp, #0x3c]
	str r4, [sp, #0x34]
	mov sb, r0
	mov r8, r1
	str r2, [sp]
	str r3, [sp, #4]
_02340700:
	mov r0, #4
	bl DungeonRandInt
	mov r4, r0
	mov r0, sb
	mov r1, r8
	mov sl, #0
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	mvn r0, #1
	str r0, [sp, #8]
_02340730:
	and r5, r4, #3
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _02340774
_02340740: ; jump table
	b _02340750 ; case 0
	b _0234075C ; case 1
	b _02340768 ; case 2
	b _02340774 ; case 3
_02340750:
	mov r0, #2
	mov r2, #0
	b _0234077C
_0234075C:
	mov r0, #0
	ldr r2, [sp, #8]
	b _0234077C
_02340768:
	ldr r0, [sp, #8]
	mov r2, #0
	b _0234077C
_02340774:
	mov r0, #0
	mov r2, #2
_0234077C:
	ldr r1, [sp]
	add r0, sb, r0
	cmp r1, r0
	bgt _023407C4
	cmp fp, r0
	ble _023407C4
	add r1, r8, r2
	ldr r2, [sp, #4]
	cmp r2, r1
	bgt _023407C4
	ldr r2, [sp, #0x34]
	cmp r2, r1
	ble _023407C4
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	beq _023407D8
_023407C4:
	add r4, r4, #1
	add sl, sl, #1
	cmp sl, #4
	blt _02340730
	b _02340874
_023407D8:
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _02340700
_023407E4: ; jump table
	b _023407F4 ; case 0
	b _02340814 ; case 1
	b _02340834 ; case 2
	b _02340854 ; case 3
_023407F4:
	mov r1, r8
	add r0, sb, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	add sb, sb, #2
	b _02340700
_02340814:
	mov r0, sb
	sub r1, r8, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	sub r8, r8, #2
	b _02340700
_02340834:
	mov r1, r8
	sub r0, sb, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	sub sb, sb, #2
	b _02340700
_02340854:
	mov r0, sb
	add r1, r8, #1
	bl GetTileSafe
	mov r1, r7
	and r2, r6, #0xff
	bl SetTerrainObstacleChecked
	add r8, r8, #2
	b _02340700
_02340874:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end GenerateMazeLine

	arm_func_start SetSpawnFlag5
SetSpawnFlag5: ; 0x0234087C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrsh r5, [r6]
	b _023408C0
_0234088C:
	ldrsh r4, [r6, #2]
	b _023408B0
_02340894:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r4, r4, #1
	orr r1, r1, #0x20
	strh r1, [r0, #2]
_023408B0:
	ldrsh r0, [r6, #6]
	cmp r4, r0
	blt _02340894
	add r5, r5, #1
_023408C0:
	ldrsh r0, [r6, #4]
	cmp r5, r0
	blt _0234088C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetSpawnFlag5

	arm_func_start IsNextToHallway
IsNextToHallway: ; 0x023408D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mvn r5, #0
	mov sl, r0
	mov sb, r1
	mov r4, r5
	b _02340964
_023408E8:
	adds r8, sl, r5
	bmi _02340960
	cmp r8, #0x38
	bge _0234096C
	mov r6, r4
	b _02340958
_02340900:
	adds r7, sb, r6
	bmi _02340954
	cmp r7, #0x20
	bge _02340960
	cmp r5, #0
	cmpne r6, #0
	bne _02340954
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _02340954
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02340954:
	add r6, r6, #1
_02340958:
	cmp r6, #1
	ble _02340900
_02340960:
	add r5, r5, #1
_02340964:
	cmp r5, #1
	ble _023408E8
_0234096C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end IsNextToHallway

	arm_func_start ResolveInvalidSpawns
ResolveInvalidSpawns: ; 0x02340974
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
_0234097C:
	mov r4, #0
_02340980:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	beq _023409BC
	ldrh r1, [r0]
	tst r1, #0x110
	ldrneh r1, [r0, #2]
	bicne r1, r1, #2
	strneh r1, [r0, #2]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_023409BC:
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _023409E0
	ldrh r1, [r0]
	orr r1, r1, #0x200
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r1, #4
	strh r1, [r0, #2]
_023409E0:
	ldrh r1, [r0, #2]
	add r4, r4, #1
	tst r1, #2
	bicne r1, r1, #4
	strneh r1, [r0, #2]
	cmp r4, #0x20
	blt _02340980
	add r5, r5, #1
	cmp r5, #0x38
	blt _0234097C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ResolveInvalidSpawns

	arm_func_start ConvertSecondaryTerrainToChasms
ConvertSecondaryTerrainToChasms: ; 0x02340A0C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02340A18:
	mov r5, r4
_02340A1C:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _02340A5C
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #3
	strh r1, [r0]
_02340A5C:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340A1C
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340A18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ConvertSecondaryTerrainToChasms

	arm_func_start EnsureImpassableTilesAreWalls
EnsureImpassableTilesAreWalls: ; 0x02340A78
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02340A84:
	mov r5, r4
_02340A88:
	mov r0, r6
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x10
	beq _02340AB8
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
_02340AB8:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340A88
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340A84
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EnsureImpassableTilesAreWalls

	arm_func_start InitializeTile
InitializeTile: ; 0x02340AD4
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #7]
	strh r2, [r0, #4]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r2, [r0, #6]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	bx lr
	arm_func_end InitializeTile

	arm_func_start ResetFloor
ResetFloor: ; 0x02340B0C
#ifdef JAPAN
#define RESET_FLOOR_OFFSET -0xA4
#else
#define RESET_FLOOR_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov r4, r6
_02340B18:
	mov r5, r4
	sub r7, r6, #1
_02340B20:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	bl InitializeTile
	sub r8, r5, #1
	mov r0, r6
	mov r1, r8
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r1, r8
	add r0, r6, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r1, r8
	add r0, r6, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	add r0, r6, #1
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r6
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	add r1, r5, #1
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	mov r1, r5
	bl PosIsOutOfBounds
	cmp r0, #0
	bne _02340BD4
	mov r0, r7
	mov r1, r8
	bl PosIsOutOfBounds
	cmp r0, #0
	beq _02340BEC
_02340BD4:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x10
	strh r1, [r0]
_02340BEC:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02340B20
	add r6, r6, #1
	cmp r6, #0x38
	blt _02340B18
	ldr r6, _02340CA8 ; =DUNGEON_PTR
	mov sb, #0
	ldr r0, [r6]
	mvn r1, #0
	add r0, r0, #0xcc00
	strh r1, [r0, #0xe4 + RESET_FLOOR_OFFSET]
	ldr r0, [r6]
	mov r7, sb
	add r0, r0, #0xcc00
	strh r1, [r0, #0xe6 + RESET_FLOOR_OFFSET]
	mov r4, #0x14
	mov r5, #0xa0
_02340C34:
	mul r8, sb, r5
	mov sl, r7
_02340C3C:
	ldr r0, [r6]
#ifdef JAPAN
	add r0, r0, #0xbc
	add r0, r0, #0xcc00
#else
	add r0, r0, #0xd60
	add r0, r0, #0xc000
#endif
	add r0, r0, r8
	mla r0, sl, r4, r0
	bl InitializeTile
	add sl, sl, #1
	cmp sl, #8
	blt _02340C3C
	add sb, sb, #1
	cmp sb, #8
	blt _02340C34
	ldr r1, _02340CA8 ; =DUNGEON_PTR
	mov r3, #0
	ldr r0, [r1]
	mov r2, r3
	add r0, r0, #0x3f00
	strh r3, [r0, #0xc0 + RESET_FLOOR_OFFSET]
_02340C84:
	ldr r0, [r1]
	add r0, r0, r3, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xcc8 + RESET_FLOOR_OFFSET]
	add r3, r3, #1
	str r2, [r0]
	cmp r3, #0x40
	blt _02340C84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02340CA8: .word DUNGEON_PTR
	arm_func_end ResetFloor
