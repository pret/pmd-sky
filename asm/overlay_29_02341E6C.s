	.include "asm/macros.inc"
	.include "overlay_29_02341E6C.inc"

	.text

	arm_func_start StairsAlwaysReachable
StairsAlwaysReachable: ; 0x02341E6C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x700
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, #0
_02341E84:
	mov sl, #0
	add r0, sp, #0
	mov r8, sl
	add sb, r0, r4, lsl #5
_02341E94:
	mov r0, r4
	mov r1, sl
	bl GetTileSafe
	ldrh r1, [r0]
	cmp r5, #0
	strb r8, [sb, sl]
	ldrneh r2, [r0]
	and r1, r1, #3
	bicne r2, r2, #0x8000
	strneh r2, [r0]
	cmp r1, #1
	beq _02341ED8
	ldrh r2, [r0]
	tst r2, #4
	ldreqb r2, [sb, sl]
	orreq r2, r2, #1
	streqb r2, [sb, sl]
_02341ED8:
	cmp r1, #2
	bne _02341EF4
	ldrh r0, [r0]
	tst r0, #4
	ldreqb r0, [sb, sl]
	orreq r0, r0, #2
	streqb r0, [sb, sl]
_02341EF4:
	add sl, sl, #1
	cmp sl, #0x20
	blt _02341E94
	add r4, r4, #1
	cmp r4, #0x38
	blt _02341E84
	add r1, sp, #0
	ldr r0, _02342174 ; =DUNGEON_PTR
	add r2, r1, r7, lsl #5
	ldrb r1, [r2, r6]
	ldr r0, [r0]
	orr r1, r1, #0x50
	add r0, r0, #0xcc00
	strb r1, [r2, r6]
#ifdef JAPAN
	ldrsh r1, [r0, #0x40]
	cmp r1, r7
	ldreqsh r0, [r0, #0x42]
#else
	ldrsh r1, [r0, #0xe4]
	cmp r1, r7
	ldreqsh r0, [r0, #0xe6]
#endif
	cmpeq r0, r6
	movne r0, #0
	bne _0234216C
	ldr r0, _02342178 ; =FLOOR_GENERATION_STATUS
	mov r4, #0
	str r4, [r0, #0x24]
_02341F50:
	mov r3, #0
	mov r7, r3
	add r4, r4, #1
	add r0, sp, #0
	mov r2, r3
_02341F64:
	mov r8, r2
	add r1, r0, r7, lsl #5
_02341F6C:
	ldrb sb, [r1, r8]
	add r6, r1, r8
	tst sb, #0x80
	bne _023420D0
	tst sb, #0x40
	beq _023420D0
	bic sl, sb, #0x40
	and sb, sl, #0xff
	orr sb, sb, #0x80
	strb sb, [r6]
	cmp r7, #0
	add r3, r3, #1
	ble _02341FB0
	ldrb sb, [r6, #-0x20]
	tst sb, #0x83
	orreq sb, sb, #0x40
	streqb sb, [r6, #-0x20]
_02341FB0:
	cmp r8, #0
	ble _02341FC8
	ldrb sb, [r6, #-1]
	tst sb, #0x83
	orreq sb, sb, #0x40
	streqb sb, [r6, #-1]
_02341FC8:
	cmp r7, #0x37
	bge _02341FE0
	ldrb sb, [r6, #0x20]
	tst sb, #0x83
	orreq sb, sb, #0x40
	streqb sb, [r6, #0x20]
_02341FE0:
	cmp r8, #0x1f
	bge _02341FF8
	ldrb sb, [r6, #1]
	tst sb, #0x83
	orreq sb, sb, #0x40
	streqb sb, [r6, #1]
_02341FF8:
	cmp r7, #0
	cmpgt r8, #0
	ble _0234202C
	ldrb sl, [r6, #-0x21]
	tst sl, #0x87
	bne _0234202C
	ldrb sb, [r6, #-0x20]
	tst sb, #1
	bne _0234202C
	ldrb sb, [r6, #-1]
	tst sb, #1
	orreq sb, sl, #0x40
	streqb sb, [r6, #-0x21]
_0234202C:
	cmp r7, #0x37
	bge _02342064
	cmp r8, #0
	ble _02342064
	ldrb sl, [r6, #0x1f]
	tst sl, #0x87
	bne _02342064
	ldrb sb, [r6, #0x20]
	tst sb, #1
	bne _02342064
	ldrb sb, [r6, #-1]
	tst sb, #1
	orreq sb, sl, #0x40
	streqb sb, [r6, #0x1f]
_02342064:
	cmp r7, #0
	ble _0234209C
	cmp r8, #0x1f
	bge _0234209C
	ldrb sl, [r6, #-0x1f]
	tst sl, #0x87
	bne _0234209C
	ldrb sb, [r6, #-0x20]
	tst sb, #1
	bne _0234209C
	ldrb sb, [r6, #1]
	tst sb, #1
	orreq sb, sl, #0x40
	streqb sb, [r6, #-0x1f]
_0234209C:
	cmp r7, #0x37
	cmplt r8, #0x1f
	bge _023420D0
	ldrb sl, [r6, #0x21]
	tst sl, #0x87
	bne _023420D0
	ldrb sb, [r6, #0x20]
	tst sb, #1
	bne _023420D0
	ldrb sb, [r6, #1]
	tst sb, #1
	orreq sb, sl, #0x40
	streqb sb, [r6, #0x21]
_023420D0:
	add r8, r8, #1
	cmp r8, #0x20
	blt _02341F6C
	add r7, r7, #1
	cmp r7, #0x38
	blt _02341F64
	cmp r3, #0
	bne _02341F50
	ldr r0, _02342178 ; =FLOOR_GENERATION_STATUS
	mov r8, #0
	str r4, [r0, #0x24]
	add r6, sp, #0
	mov r7, r8
	b _02342160
_02342108:
	mov sb, r7
	add r4, r6, r8, lsl #5
	b _02342154
_02342114:
	mov r0, r8
	mov r1, sb
	bl GetTileSafe
	ldrb r1, [sb, r4]
	tst r1, #0x87
	bne _02342150
	cmp r5, #0
	ldrneh r1, [r0]
	orrne r1, r1, #0x8000
	strneh r1, [r0]
	bne _02342150
	ldrh r0, [r0]
	tst r0, #0x100
	moveq r0, #0
	beq _0234216C
_02342150:
	add sb, sb, #1
_02342154:
	cmp sb, #0x20
	blt _02342114
	add r8, r8, #1
_02342160:
	cmp r8, #0x38
	blt _02342108
	mov r0, #1
_0234216C:
	add sp, sp, #0x700
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02342174: .word DUNGEON_PTR
_02342178: .word FLOOR_GENERATION_STATUS
	arm_func_end StairsAlwaysReachable

	arm_func_start ov29_0234217C
ov29_0234217C: ; 0x0234217C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r4, #0
	str r0, [sp]
	mov r0, r4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x58]
	str r4, [sp, #0x1c]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	str r1, [sp, #4]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x60]
	str r2, [sp, #8]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x64]
	str r3, [sp, #0xc]
	str r0, [sp, #0x64]
	b _023424B8
_023421C8:
	ldr r0, [sp]
	mov r1, #0x1e
	mla r8, r4, r1, r0
	ldr r0, [sp, #0x58]
	mov sl, #0
	add r0, r0, r4, lsl #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r0, r0, #1
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	sub r0, r0, #1
	str r0, [sp, #0x2c]
	b _023424A8
_02342200:
	ldr r0, [sp, #4]
	cmp r0, #2
	ldr r0, [sp, #0xc]
	ldr r2, [r0, sl, lsl #2]
	ldr r0, [sp, #0x58]
	add sb, r2, #2
	ldr r3, [r0, r4, lsl #2]
	ldr r0, [sp, #0xc]
	add r5, r3, #2
	add r0, r0, sl, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x20]
	sub r2, r1, r2
	ldr r0, [r0, #4]
	sub r1, r0, r3
	sub r0, r2, #4
	str r0, [sp, #0x14]
	sub fp, r1, #4
	movle r1, #0xe
	strle r1, [sp, #0x14]
	mov r0, #5
	mov r7, r0
	ldr r1, [sp, #8]
	movle r0, #0xa
	cmp r1, #1
	ldr r1, _023424CC ; =0x000001C2
	moveq r7, #0x10
	mla r1, sl, r1, r8
	str r1, [sp, #0x10]
	ldrb r1, [r1, #0xa]
	moveq fp, #0x18
	cmp r1, #0
	beq _023423D8
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x5c]
	cmp r2, r1
	beq _0234231C
	ldr r1, [sp, #0x14]
	bl DungeonRandRange
	mov r6, r0
	mov r0, r7
	mov r1, fp
	bl DungeonRandRange
	mov r7, r0
	ldr r0, [sp, #0x14]
	orr r1, r6, #1
	cmp r1, r0
	orr r0, r7, #1
	movlt r6, r1
	cmp r0, fp
	movlt r7, r0
	add r0, r7, r7, lsl #1
	add r0, r0, r0, lsr #31
	cmp r6, r0, asr #1
	mov r0, r0, asr #1
	movgt r6, r0
	add r0, r6, r6, lsl #1
	add r0, r0, r0, lsr #31
	cmp r7, r0, asr #1
	mov r0, r0, asr #1
	movgt r7, r0
	ldr r0, [sp, #0x14]
	sub r0, r0, r6
	bl DungeonRandInt
	add sb, sb, r0
	sub r0, fp, r7
	bl DungeonRandInt
	add r5, r5, r0
	add fp, sb, r6
	add r6, r5, r7
	b _0234232C
_0234231C:
	ldr r0, [sp, #0x60]
	add fp, sb, r0
	ldr r0, [sp, #0x64]
	add r6, r5, r0
_0234232C:
	ldr r0, _023424CC ; =0x000001C2
	mul r0, sl, r0
	strh sb, [r8, r0]
	add r0, r8, r0
	strh fp, [r0, #4]
	strh r5, [r0, #2]
	strh r6, [r0, #6]
	ldr r0, [sp, #0x1c]
	and r0, r0, #0xff
	str r0, [sp, #0x24]
	b _023423A8
_02342358:
	mov r7, r5
	b _0234239C
_02342360:
	mov r0, sb
	mov r1, r7
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r7
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, sb
	bl GetTileSafe
	ldr r1, [sp, #0x24]
	add r7, r7, #1
	strb r1, [r0, #7]
_0234239C:
	cmp r7, r6
	blt _02342360
	add sb, sb, #1
_023423A8:
	cmp sb, fp
	blt _02342358
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x5c]
	cmp r1, r0
	ldrne r0, [sp, #0x10]
	movne r1, #1
	strneb r1, [r0, #0x1d]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	b _02342498
_023423D8:
	mov r2, #2
	ldr r0, [sp, #0x28]
	mov r7, r2
	cmp sl, #0
	moveq r2, #1
	cmp r4, #0
	moveq r7, #1
	cmp sl, r0
	mov r1, #4
	mov r6, r1
	ldr r0, [sp, #0x2c]
	moveq r1, #2
	cmp r4, r0
	add r0, sb, r2
	ldr r2, [sp, #0x14]
	moveq r6, #2
	add r2, sb, r2
	sub r1, r2, r1
	bl DungeonRandRange
	add r1, r5, fp
	sub r1, r1, r6
	mov r6, r0
	add r0, r5, r7
	bl DungeonRandRange
	mov r5, r0
	ldr r0, _023424CC ; =0x000001C2
	mul r0, sl, r0
	strh r6, [r8, r0]
	add r1, r8, r0
	add r0, r6, #1
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	add r0, r5, #1
	strh r0, [r1, #6]
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r6
	bl GetTileSafe
	mov r1, #0xff
	strb r1, [r0, #7]
_02342498:
	ldr r0, [sp, #0x18]
	add sl, sl, #1
	add r0, r0, #1
	str r0, [sp, #0x18]
_023424A8:
	ldr r0, [sp, #4]
	cmp sl, r0
	blt _02342200
	add r4, r4, #1
_023424B8:
	ldr r0, [sp, #8]
	cmp r4, r0
	blt _023421C8
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023424CC: .word 0x000001C2
	arm_func_end ov29_0234217C

	arm_func_start GetNextFixedRoomAction
GetNextFixedRoomAction: ; 0x023424D0
	ldr r1, _02342510 ; =FLOOR_GENERATION_STATUS
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	subne r0, r0, #1
	bne _02342504
	ldr r0, _02342514 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr ip, [r0, #4]
	ldrh r3, [ip]
	add r2, ip, #2
	add r2, r2, #2
	strh r3, [r1, #0xe]
	str r2, [r0, #4]
	ldrh r0, [ip, #2]
_02342504:
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_02342510: .word FLOOR_GENERATION_STATUS
_02342514: .word HIDDEN_STAIRS_SPAWN_BLOCKED
	arm_func_end GetNextFixedRoomAction

	arm_func_start ov29_02342518
ov29_02342518: ; 0x02342518
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrh r4, [r0]
	ldrb ip, [sp, #0x10]
	mov lr, #0
	orr r4, r4, #0x100
	strh r4, [r0]
	strb lr, [r0, #6]
	str ip, [sp]
	bl PlaceFixedRoomTile
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov29_02342518

	arm_func_start ConvertWallsToChasms
ConvertWallsToChasms: ; 0x02342548
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02342554:
	mov r5, r4
_02342558:
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	tst r1, #3
	ldreqh r1, [r0]
	orreq r1, r1, #3
	streqh r1, [r0]
	cmp r5, #0x38
	blt _02342558
	add r6, r6, #1
	cmp r6, #0x20
	blt _02342554
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ConvertWallsToChasms

	arm_func_start ov29_02342594
ov29_02342594: ; 0x02342594
#ifdef JAPAN
#define OV29_02342594_OFFSET -0xA4
#else
#define OV29_02342594_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r2, _023427D8 ; =DUNGEON_PTR
	ldr r4, _023427DC ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr sb, [r2]
	ldr r3, _023427E0 ; =FLOOR_GENERATION_STATUS
	add r2, sb, #0x12000
	ldr r5, [r2, #0xaa4 + OV29_02342594_OFFSET]
	mov r6, #0
	ldr r5, [r5, r1, lsl #2]
	mov sl, r0
	add r0, r5, #6
	str r0, [r4, #4]
	strh r6, [r3, #0xa]
	ldr r0, [r2, #0xaa4 + OV29_02342594_OFFSET]
	ldr r0, [r0, r1, lsl #2]
	ldrh r0, [r0, #4]
	tst r0, #1
	beq _0234274C
	ldrsh r1, [sl]
	add r0, sb, #0xc000
	str r1, [r0, #0xd24 + OV29_02342594_OFFSET]
	ldrsh r1, [sl, #2]
	str r1, [r0, #0xd28 + OV29_02342594_OFFSET]
	ldrsh r1, [sl, #4]
	str r1, [r0, #0xd2c + OV29_02342594_OFFSET]
	ldrsh r1, [sl, #6]
	str r1, [r0, #0xd30 + OV29_02342594_OFFSET]
	ldrsh r8, [sl, #2]
	b _0234273C
_0234260C:
	mov r0, #0x14
	mul r0, r6, r0
	str r0, [sp, #4]
	add r0, sb, r0
	str r0, [sp, #8]
	add r0, sb, r6, lsl #1
#ifdef JAPAN
	add r1, sb, #0xbc
	str r0, [sp, #0xc]
	add r0, r1, #0xcc00
#else
	add r1, sb, #0xd60
	str r0, [sp, #0xc]
	add r0, r1, #0xc000
#endif
	str r0, [sp, #0x10]
	add r0, sb, #0xd000
	ldrsh r4, [sl]
	mov r5, #0
	str r0, [sp, #0x14]
	b _02342728
_02342648:
	bl GetNextFixedRoomAction
	mov fp, r0
	mov r0, r4
	mov r1, r8
	bl GetTileSafe
	mov r7, r0
	ldr r0, [sp, #0xc]
	mov r1, fp
	add r0, r0, r5, lsl #4
#ifdef JAPAN
	add r0, r0, #0xd100
	strh fp, [r0, #0xbc]
#else
	add r0, r0, #0xd200
	strh fp, [r0, #0x60]
#endif
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa0
	mul fp, r5, r0
	ldr r0, [sp, #0x10]
	mov r3, r8
	add r2, r0, fp
	ldr r0, [sp, #4]
	add r0, r2, r0
	mov r2, r4
	bl ov29_02342518
	ldr r0, [sp, #8]
	ldrb ip, [r7, #7]
	add r0, r0, fp
#ifdef JAPAN
	add r0, r0, #0xbc
	add fp, r0, #0xcc00
#else
	add r0, r0, #0xd60
	add fp, r0, #0xc000
#endif
	ldmia fp!, {r0, r1, r2, r3}
	mov lr, r7
	stmia lr!, {r0, r1, r2, r3}
	ldr r0, [fp]
	str r0, [lr]
	ldrsh r0, [sl]
	add r0, r0, #2
	cmp r4, r0
	blt _02342714
	ldrsh r0, [sl, #4]
	sub r0, r0, #2
	cmp r4, r0
	bge _02342714
	ldrsh r0, [sl, #2]
	add r0, r0, #2
	cmp r8, r0
	blt _02342714
	ldrsh r0, [sl, #6]
	sub r0, r0, #2
	cmp r8, r0
	movlt r0, #0x110
	strlth r0, [r7]
	movlt r0, #0xe
	strltb r0, [r7, #6]
_02342714:
	ldr r0, [sp, #0x14]
	strb ip, [r7, #7]
	strb ip, [r0, #0x2e0 + OV29_02342594_OFFSET]
	add r5, r5, #1
	add r4, r4, #1
_02342728:
	ldrsh r0, [sl, #4]
	cmp r4, r0
	blt _02342648
	add r6, r6, #1
	add r8, r8, #1
_0234273C:
	ldrsh r0, [sl, #6]
	cmp r8, r0
	blt _0234260C
	b _023427D0
_0234274C:
	ldrsh r8, [sl, #2]
	add r4, sb, #0xd000
	mov r5, r6
	mov fp, #1
	b _023427C4
_02342760:
	ldrsh sb, [sl]
	b _023427B4
_02342768:
	bl GetNextFixedRoomAction
	mov r6, r0
	mov r0, sb
	mov r1, r8
	bl GetTileSafe
	mov r1, r6
	mov r6, r0
	ldrb r7, [r6, #7]
	ldrh ip, [r6]
	mov r2, sb
	mov r3, r8
	orr ip, ip, #0x100
	strh ip, [r6]
	strb r5, [r6, #6]
	str fp, [sp]
	bl PlaceFixedRoomTile
	strb r7, [r6, #7]
	strb r7, [r4, #0x2e0 + OV29_02342594_OFFSET]
	add sb, sb, #1
_023427B4:
	ldrsh r0, [sl, #4]
	cmp sb, r0
	blt _02342768
	add r8, r8, #1
_023427C4:
	ldrsh r0, [sl, #6]
	cmp r8, r0
	blt _02342760
_023427D0:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023427D8: .word DUNGEON_PTR
_023427DC: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_023427E0: .word FLOOR_GENERATION_STATUS
	arm_func_end ov29_02342594

	arm_func_start ov29_023427E4
ov29_023427E4: ; 0x023427E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r6, #3
	str r0, [sp]
	mov r7, r6
	mov r5, #0
	mov sb, r6
	mov r4, r6
	ldr r8, _02342B74 ; =FLOOR_GENERATION_STATUS
	b _0234283C
_0234280C:
	ldr r2, [r8, #0x38]
	ldr r1, [r8, #0x30]
	mov r0, r4
	sub r1, r2, r1
	sub r1, r1, #2
	bl DungeonRandRange
	mov r6, r0
	cmp r6, #3
	movlt r6, sb
	cmp r6, #3
	bge _02342844
	add r5, r5, #1
_0234283C:
	cmp r5, #0x14
	blt _0234280C
_02342844:
	mov sb, #3
	mov r5, #0
	mov r4, sb
	ldr r8, _02342B74 ; =FLOOR_GENERATION_STATUS
	b _02342888
_02342858:
	ldr r2, [r8, #0x3c]
	ldr r1, [r8, #0x34]
	mov r0, r4
	sub r1, r2, r1
	sub r1, r1, #2
	bl DungeonRandRange
	mov r7, r0
	cmp r7, #3
	movlt r7, sb
	cmp r7, #3
	bge _02342890
	add r5, r5, #1
_02342888:
	cmp r5, #0x14
	blt _02342858
_02342890:
	mov r0, #2
	mov r1, #4
	bl DungeonRandRange
	mov r5, r0
	mov r4, #0
	b _0234295C
_023428A8:
	ldr r0, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r1, [r0, #0x38]
	ldr r0, [r0, #0x30]
	sub r0, r1, r0
	cmp r0, r6
	ble _02342964
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	bge _02342918
	ldr sb, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r8, [sb, #0x34]
	b _023428F8
_023428DC:
	ldr r0, [sb, #0x30]
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	add r8, r8, #1
	bic r1, r1, #0x20
	strh r1, [r0]
_023428F8:
	ldr r0, [sb, #0x3c]
	cmp r8, r0
	blt _023428DC
	ldr r0, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r1, [r0, #0x30]
	add r1, r1, #1
	str r1, [r0, #0x30]
	b _02342958
_02342918:
	ldr sb, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r0, [sb, #0x38]
	sub r0, r0, #1
	str r0, [sb, #0x38]
	ldr r8, [sb, #0x34]
	b _0234294C
_02342930:
	ldr r0, [sb, #0x38]
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	add r8, r8, #1
	bic r1, r1, #0x20
	strh r1, [r0]
_0234294C:
	ldr r0, [sb, #0x3c]
	cmp r8, r0
	blt _02342930
_02342958:
	add r4, r4, #1
_0234295C:
	cmp r4, r5
	blt _023428A8
_02342964:
	mov r6, #0
	b _02342A20
_0234296C:
	ldr r0, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r1, [r0, #0x3c]
	ldr r0, [r0, #0x34]
	sub r0, r1, r0
	cmp r0, r7
	ble _02342A28
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	bge _023429DC
	ldr r8, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r4, [r8, #0x30]
	b _023429BC
_023429A0:
	ldr r1, [r8, #0x34]
	mov r0, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #0x20
	strh r1, [r0]
_023429BC:
	ldr r0, [r8, #0x38]
	cmp r4, r0
	blt _023429A0
	ldr r0, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r1, [r0, #0x34]
	add r1, r1, #1
	str r1, [r0, #0x34]
	b _02342A1C
_023429DC:
	ldr r8, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r8, #0x3c]
	sub r0, r0, #1
	str r0, [r8, #0x3c]
	ldr r4, [r8, #0x30]
	b _02342A10
_023429F4:
	ldr r1, [r8, #0x3c]
	mov r0, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #0x20
	strh r1, [r0]
_02342A10:
	ldr r0, [r8, #0x38]
	cmp r4, r0
	blt _023429F4
_02342A1C:
	add r6, r6, #1
_02342A20:
	cmp r6, r5
	blt _0234296C
_02342A28:
	ldr r4, _02342B74 ; =FLOOR_GENERATION_STATUS
	ldr r6, [r4, #0x30]
	b _02342A74
_02342A34:
	ldr r5, [r4, #0x34]
	b _02342A64
_02342A3C:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	tst r1, #0x20
	beq _02342A60
	tst r1, #8
	bicne r1, r1, #0x20
	strneh r1, [r0]
_02342A60:
	add r5, r5, #1
_02342A64:
	ldr r0, [r4, #0x3c]
	cmp r5, r0
	blt _02342A3C
	add r6, r6, #1
_02342A74:
	ldr r3, [r4, #0x38]
	cmp r6, r3
	blt _02342A34
	ldr r0, _02342B74 ; =FLOOR_GENERATION_STATUS
	mov r7, #0
	ldr r1, [r0, #0x30]
	ldr r2, [r0, #0x34]
	add r3, r1, r3
	ldr r1, [r0, #0x3c]
	add r0, r3, r3, lsr #31
	mov r0, r0, asr #1
	sub r6, r0, #1
	add r0, r2, r1
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	add r0, r6, #3
	cmp r6, r0
	sub r0, r1, #1
	mov sb, r6
	str r0, [sp, #4]
	bge _02342B6C
_02342AC8:
	ldr r0, [sp, #4]
	mov r8, #0
	add r5, r0, #3
	mov sl, r0
	cmp r0, r5
	bge _02342B58
	ldr r0, _02342B78 ; =SHOP_ITEM_CHANCES
	add fp, r0, r7, lsl #1
_02342AE8:
	mov r0, sb
	mov r1, sl
	bl GetTileSafe
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #0x20
	beq _02342B48
	tst r0, #0x40
	bne _02342B48
	tst r0, #8
	bne _02342B48
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, [sp]
	mov r2, #6
	mul r3, r8, r2
	ldrb r1, [r1, #0x18]
	mov r2, #0x12
	mla r2, r1, r2, fp
	ldrsh r1, [r3, r2]
	cmp r1, r0
	ldrgth r0, [r4, #2]
	orrgt r0, r0, #2
	strgth r0, [r4, #2]
_02342B48:
	add sl, sl, #1
	cmp sl, r5
	add r8, r8, #1
	blt _02342AE8
_02342B58:
	add sb, sb, #1
	add r0, r6, #3
	cmp sb, r0
	add r7, r7, #1
	blt _02342AC8
_02342B6C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02342B74: .word FLOOR_GENERATION_STATUS
_02342B78: .word SHOP_ITEM_CHANCES
	arm_func_end ov29_023427E4

	arm_func_start ResetInnerBoundaryTileRows
ResetInnerBoundaryTileRows: ; 0x02342B7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r5, #0x1e
	mov r6, #1
_02342B8C:
	mov r0, r4
	mov r1, r6
	bl GetTileSafe
	mov r7, r0
	bl InitializeTile
	cmp r4, #0
	cmpne r4, #0x37
	ldreqh r0, [r7]
	mov r1, r5
	orreq r0, r0, #0x10
	streqh r0, [r7]
	mov r0, r4
	bl GetTileSafe
	mov r7, r0
	bl InitializeTile
	cmp r4, #0
	cmpne r4, #0x37
	ldreqh r0, [r7]
	add r4, r4, #1
	orreq r0, r0, #0x10
	streqh r0, [r7]
	cmp r4, #0x38
	blt _02342B8C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ResetInnerBoundaryTileRows

	arm_func_start ov29_02342BEC
ov29_02342BEC: ; 0x02342BEC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrh r5, [r0]
	ldrh r6, [r0, #2]
	add r4, r0, #6
	mov r0, r5, lsl #1
	mul r0, r6, r0
	ldr r3, _02342C60 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr r2, _02342C64 ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	str r4, [r3, #4]
	strh r1, [r2, #0xa]
	bl MemAlloc
	mov r7, r0
	mov r8, #0
	mov sl, r7
	mov r4, r8
	b _02342C50
_02342C30:
	mov sb, r4
	b _02342C44
_02342C38:
	bl GetNextFixedRoomAction
	strh r0, [sl], #2
	add sb, sb, #1
_02342C44:
	cmp sb, r5
	blt _02342C38
	add r8, r8, #1
_02342C50:
	cmp r8, r6
	blt _02342C30
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02342C60: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_02342C64: .word FLOOR_GENERATION_STATUS
	arm_func_end ov29_02342BEC

	arm_func_start ResetImportantSpawnPositions
ResetImportantSpawnPositions: ; 0x02342C68
	add r0, r0, #0x8c00
	mvn r1, #0
	strh r1, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	bx lr
	arm_func_end ResetImportantSpawnPositions

	arm_func_start SpawnStairs
SpawnStairs: ; 0x02342C8C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r8, r1
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	mov r5, r2
	bl GetTileSafe
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r5, #0
	orr r0, r0, #1
	bic r0, r0, #2
	strh r0, [r4, #2]
	beq _02342D00
	ldr r0, _02342D94 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldrb r1, [r6]
	ldrb r0, [r0]
	cmp r0, #0
	ldrne r0, _02342D98 ; =FLOOR_GENERATION_STATUS
	strneh r1, [r0, #0x1c]
	ldrneb r1, [r6, #1]
	strneh r1, [r0, #0x1e]
	bne _02342D20
	add r0, r8, #0x8c00
	strh r1, [r0, #0x24]
	ldrb r1, [r6, #1]
	strh r1, [r0, #0x26]
	str r5, [r8, #8]
	b _02342D20
_02342D00:
	ldrb r2, [r6]
	add r0, r8, #0x8c00
	ldr r1, _02342D98 ; =FLOOR_GENERATION_STATUS
	strh r2, [r0, #0x20]
	ldrb r2, [r6, #1]
	strh r2, [r0, #0x22]
	ldrb r0, [r4, #7]
	strb r0, [r1, #2]
_02342D20:
	cmp r5, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	bl GetFloorType
	cmp r0, #2
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r5, [r4, #7]
	mov r7, #0
	mov r4, r7
_02342D40:
	mov r6, r4
_02342D44:
	mov r0, r7
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0]
	add r6, r6, #1
	and r1, r1, #3
	cmp r1, #1
	ldreqb r1, [r0, #7]
	cmpeq r1, r5
	ldreqh r1, [r0]
	orreq r1, r1, #0x40
	streqh r1, [r0]
	ldreqb r0, [r0, #7]
	streqb r0, [r8, #5]
	cmp r6, #0x20
	blt _02342D44
	add r7, r7, #1
	cmp r7, #0x38
	blt _02342D40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02342D94: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_02342D98: .word FLOOR_GENERATION_STATUS
	arm_func_end SpawnStairs

	arm_func_start GetHiddenStairsType
GetHiddenStairsType: ; 0x02342D9C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02342EB0 ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r2]
	mov r6, r1
	ldr r0, [r0, #0x7cc]
	mov r4, #0
#ifdef JAPAN
	sub r0, r0, #1
	cmp r0, #1
	movls r0, r4
	ldmlsia sp!, {r4, r5, r6, pc}
#else
	cmp r0, #1
	cmpne r0, #2
	beq _02342EA8
#endif
	mov r0, #4
	bl DungeonRngSetSecondary
	ldrb r0, [r5, #0x16]
	cmp r0, #0
	bne _02342EA4
	ldrb r0, [r6, #0x1a]
	cmp r0, #0xff
	bne _02342DFC
	bl DungeonRand16Bit
	and r0, r0, #8
	tst r0, #8
	movne r4, #1
	moveq r4, #2
	b _02342E00
_02342DFC:
	add r4, r0, #1
_02342E00:
	ldr r0, _02342EB0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	beq _02342E24
	bl IsDestinationFloor
	cmp r0, #0
	beq _02342E2C
_02342E24:
	mov r0, #1
	b _02342E30
_02342E2C:
	mov r0, #0
_02342E30:
	tst r0, #0xff
	ldrne r0, _02342EB4 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	movne r1, #1
	strneb r1, [r0]
	bne _02342EA4
	cmp r4, #0
	beq _02342EA4
	bl DungeonRand16Bit
	mov r1, #0x64
	bl _s32_div_f
	mov r5, r1
	ldrb r6, [r6, #0x1b]
	bl ShouldBoostHiddenStairsSpawnChance
	cmp r0, #0
	beq _02342E94
	ldr r1, _02342EB8 ; =HIDDEN_STAIRS_SPAWN_CHANCE_MULTIPLIER
	mov r0, r6, lsl #8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r6, r0
	mov r0, #0
	bl SetShouldBoostHiddenStairsSpawnChance
	mov r0, r6, asr #7
	add r0, r6, r0, lsr #24
	mov r6, r0, asr #8
_02342E94:
	cmp r5, r6
	ldrhs r0, _02342EB4 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	movhs r1, #1
	strhsb r1, [r0]
_02342EA4:
	bl DungeonRngSetPrimary
_02342EA8:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02342EB0: .word DUNGEON_PTR
_02342EB4: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_02342EB8: .word HIDDEN_STAIRS_SPAWN_CHANCE_MULTIPLIER
	arm_func_end GetHiddenStairsType

	arm_func_start GetFinalKecleonShopSpawnChance
GetFinalKecleonShopSpawnChance: ; 0x02342EBC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ShouldBoostKecleonShopSpawnChance
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, pc}
	ldr r1, _02342F04 ; =KECLEON_SHOP_BOOST_CHANCE_MULTIPLIER
	mov r0, r4, lsl #8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r4, r0
	mov r0, #0
	bl SetShouldBoostKecleonShopSpawnChance
	mov r0, r4, asr #7
	add r0, r4, r0, lsr #24
	mov r0, r0, lsl #8
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02342F04: .word KECLEON_SHOP_BOOST_CHANCE_MULTIPLIER
	arm_func_end GetFinalKecleonShopSpawnChance

	arm_func_start ResetHiddenStairsSpawn
ResetHiddenStairsSpawn: ; 0x02342F08
	ldr r1, _02342F28 ; =FLOOR_GENERATION_STATUS
	mvn r2, #0
	strh r2, [r1, #0x1c]
	ldr r0, _02342F2C ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	strh r2, [r1, #0x1e]
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_02342F28: .word FLOOR_GENERATION_STATUS
_02342F2C: .word HIDDEN_STAIRS_SPAWN_BLOCKED
	arm_func_end ResetHiddenStairsSpawn

	arm_func_start PlaceFixedRoomTile
PlaceFixedRoomTile: ; 0x02342F30
#ifdef JAPAN
#define PLACE_FIXED_ROOM_TILE_OFFSET -0xA4
#else
#define PLACE_FIXED_ROOM_TILE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldr r4, _02343928 ; =0x00000FFF
	mov sb, r1
	and r1, sb, r4
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r6, r0
	mov r5, r2
	mov r4, r3
	cmp r1, #0x10
	blo _02342F78
	ldrh r0, [r6]
	bic r0, r0, #3
	strh r0, [r6]
	ldrh r0, [r6]
	orr r0, r0, #1
	strh r0, [r6]
_02342F78:
	cmp r1, #0x62
	bgt _02342FE8
	bge _0234334C
	cmp r1, #0x60
	bgt _02342FDC
	bge _0234334C
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _023433B8
_02342F9C: ; jump table
	b _0234304C ; case 0
	b _02343070 ; case 1
	b _02343094 ; case 2
	b _0234391C ; case 3
	b _023430B8 ; case 4
	b _0234313C ; case 5
	b _02343160 ; case 6
	b _02343184 ; case 7
	b _023431B8 ; case 8
	b _02343244 ; case 9
	b _02343194 ; case 10
	b _02343268 ; case 11
	b _02343290 ; case 12
	b _023432DC ; case 13
	b _02343328 ; case 14
	b _0234391C ; case 15
_02342FDC:
	cmp r1, #0x61
	beq _0234334C
	b _023433B8
_02342FE8:
	cmp r1, #0x6b
	bgt _02343000
	bge _023431B8
	cmp r1, #0x63
	beq _0234334C
	b _023433B8
_02343000:
	cmp r1, #0x6c
	bgt _02343010
	beq _02343208
	b _023433B8
_02343010:
	cmp r1, #0x6d
	bne _023433B8
	ldr r3, _0234392C ; =DUNGEON_PTR
	mov r1, r5
	ldr r0, [r3]
	mov r2, r4
	add r0, r0, #0x700
	strh r5, [r0, #0xa4]
	ldr r0, [r3]
	mov r3, #0
	add r0, r0, #0x700
	strh r4, [r0, #0xa6]
	mov r0, #0xb
	str r3, [sp]
	bl SpawnEnemyTrapAtPos
_0234304C:
	ldrh r1, [r6]
	mov r0, #0
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #1
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343070:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	bic r1, r1, #0x100
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343094:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x10
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_023430B8:
	ldrh r2, [r6]
	mov r0, r5, lsl #0x10
	mov r1, r4, lsl #0x10
	bic r2, r2, #3
	strh r2, [r6]
	ldrh r4, [r6]
	mov r3, sb, asr #0xc
	ldr r2, _0234392C ; =DUNGEON_PTR
	orr r4, r4, #1
	strh r4, [r6]
	ldr r4, [r2]
	mov r5, r0, asr #0x10
	add r0, r4, #0xcc00
	strh r5, [r0, #0xe0 + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldr r0, [r2]
	mov r4, r1, asr #0x10
	add r0, r0, #0xcc00
	strh r4, [r0, #0xe2 + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldr r1, [r2]
	and r0, r3, #0xff
	add r1, r1, #0xcc00
	strh r5, [r1, #0xec + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldr r1, [r2]
	add r1, r1, #0xcc00
	strh r4, [r1, #0xee + PLACE_FIXED_ROOM_TILE_OFFSET]
	bl FixedRoomActionParamToDirection
	ldr r1, _0234392C ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r1]
	add r1, r1, #0xc000
	strb r0, [r1, #0xd0c + PLACE_FIXED_ROOM_TILE_OFFSET]
	strb r2, [r6, #7]
	b _0234391C
_0234313C:
	ldrh r1, [r6]
	mov r0, #0
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #2
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343160:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #3
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343184:
	ldr r0, _02343930 ; =ov29_0237CFC0
	mov r1, #1
	strb r1, [r0]
	bl ov29_023365E8
_02343194:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x13
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_023431B8:
	ldrh r2, [r6]
	ldr r1, _0234392C ; =DUNGEON_PTR
	mov r0, #0
	bic r2, r2, #3
	strh r2, [r6]
	ldrh r2, [r6]
	orr r2, r2, #1
	strh r2, [r6]
	ldrh r2, [r6, #2]
	orr r2, r2, #1
	bic r2, r2, #2
	strh r2, [r6, #2]
	strb r0, [r6, #7]
	ldr r0, [r1]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe4 + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0xcc00
	strh r4, [r0, #0xe6 + PLACE_FIXED_ROOM_TILE_OFFSET]
	b _0234391C
_02343208:
	ldrh r1, [r6]
	mov r0, #0
	orr r1, r1, #0x800
	strh r1, [r6]
	ldrh r1, [r6]
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #1
	strh r1, [r6]
	ldrh r1, [r6, #2]
	bic r1, r1, #2
	strh r1, [r6, #2]
	strb r0, [r6, #7]
	b _0234391C
_02343244:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #1
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343268:
	ldrh r1, [r6]
	mov r0, #0
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #1
	orr r1, r1, #0x800
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343290:
	bl IsFullFloorFixedRoom
	ldrh r1, [r6]
	cmp r0, #0
	moveq r2, #1
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	movne r2, #0
	mov r0, #0
	orr r1, r1, r2
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x1000
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x810
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_023432DC:
	bl IsFullFloorFixedRoom
	ldrh r1, [r6]
	cmp r0, #0
	moveq r2, #1
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	movne r2, #0
	mov r0, #0
	orr r1, r1, r2
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x810
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x2000
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_02343328:
	ldrh r1, [r6]
	mov r0, #0xff
	bic r1, r1, #3
	strh r1, [r6]
	ldrh r1, [r6]
	orr r1, r1, #0x10
	strh r1, [r6]
	strb r0, [r6, #7]
	b _0234391C
_0234334C:
	ldr r2, _0234392C ; =DUNGEON_PTR
	mov r3, sb, asr #0xc
	ldr r0, [r2]
	sub r7, r1, #0x5f
	add r0, r0, r7, lsl #2
	add r0, r0, #0xcc00
	strh r5, [r0, #0xec + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldr r1, [r2]
	and r0, r3, #0xff
	add r1, r1, r7, lsl #2
	add r1, r1, #0xcc00
	strh r4, [r1, #0xee + PLACE_FIXED_ROOM_TILE_OFFSET]
	bl FixedRoomActionParamToDirection
	ldr r1, _0234392C ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r1]
	add r1, r1, r7
	add r1, r1, #0xc000
	strb r0, [r1, #0xd0c + PLACE_FIXED_ROOM_TILE_OFFSET]
	ldrh r0, [r6]
	bic r0, r0, #3
	strh r0, [r6]
	ldrh r0, [r6]
	orr r0, r0, #1
	strh r0, [r6]
	strb r2, [r6, #7]
	b _0234391C
_023433B8:
	cmp r1, #0x10
	blo _0234391C
	ldr r0, _02343934 ; =0x000001FF
	cmp r1, r0
	bhi _0234391C
	sub r1, r1, #0x10
	mov r0, #0xc
	smulbb r2, r1, r0
	ldr r0, _02343938 ; =ov29_023502F4
	ldr r1, _0234393C ; =FIXED_ROOM_ENTITY_SPAWN_TABLE
	ldr r8, [r0, r2]
	ldr sl, [r1, r2]
	ldrb r0, [r8, #2]
	ldr r1, _02343940 ; =ov29_023502F0
	strb r0, [r6, #7]
	ldrsh r0, [sl]
	ldr r7, [r1, r2]
	cmp r0, #0
	ldrneb r1, [sp, #0x58]
	cmpne r1, #0
	beq _02343678
	cmp r0, #0xb2
	bne _02343468
	ldr r0, _0234392C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	cmpne r0, #3
	beq _02343678
	mov r0, #0x17
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02343678
	ldr r1, [sl, #4]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldrsh r0, [sl]
	ldrsh r3, [sl, #2]
	mov r1, r5
	mov r2, r4
	bl GenerateAndSpawnItem
	b _02343678
_02343468:
	bl IsTreasureBox
	cmp r0, #0
	ldrsh r0, [sl]
	beq _02343548
	str r0, [sp, #0x14]
	mov r0, r0
	ldr sl, [sl, #4]
	bl IsTreasureBox
	cmp r0, #0
	bne _023434B0
	mov r1, r5
	mov r2, r4
	str sl, [sp]
	mov r3, #0
	mov r0, #0x49
	str r3, [sp, #4]
	bl GenerateAndSpawnItem
	b _02343678
_023434B0:
	ldr r0, _0234392C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb fp, [r0, #0x748]
	bl IsGoldenChamber
	cmp r0, #0
	beq _023434D8
	ldr r0, _02343944 ; =ov10_022C4B34
	bl ov29_023442B8
	mov r3, r0
	b _02343528
_023434D8:
	bl IsSecretRoom
	cmp r0, #0
	beq _023434F0
	bl GetRandomSecretRoomItem
	mov r3, r0
	b _02343528
_023434F0:
	ldr r0, _02343948 ; =ov29_02353050
	b _02343504
_023434F8:
	cmp fp, r1
	beq _02343510
	add r0, r0, #8
_02343504:
	ldrb r1, [r0]
	cmp r1, #0
	bne _023434F8
_02343510:
	cmp r1, #0
	moveq r3, #0x49
	beq _02343528
	ldr r0, [r0, #4]
	bl ov29_023442B8
	mov r3, r0
_02343528:
	ldr r0, [sp, #0x14]
	mov r1, r5
	str sl, [sp]
	mov sl, #0
	mov r2, r4
	str sl, [sp, #4]
	bl GenerateAndSpawnItem
	b _02343678
_02343548:
	ldr r2, _0234394C ; =0x00000578
	cmp r0, r2
	bne _02343580
	bl GetSpecialTargetItem
	ldr r2, [sl, #4]
	mov r1, #0
	orr r2, r2, #0x80
	str r2, [sp]
	str r1, [sp, #4]
	ldrsh r3, [sl, #2]
	mov r1, r5
	mov r2, r4
	bl GenerateAndSpawnItem
	b _02343678
_02343580:
	add r1, r2, #1
	cmp r0, r1
	bne _023435BC
	bl GetSpecialTargetItem
	ldr r1, [sl, #4]
	mov r3, r0
	orr r2, r1, #0x80
	ldr r0, _02343950 ; =0x00000181
	mov r1, r5
	str r2, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r2, r4
	bl GenerateAndSpawnItem
	b _02343678
_023435BC:
	add r1, r2, #0xa
	cmp r0, r1
	blt _02343658
	add r1, r2, #0x13
	cmp r0, r1
	bgt _02343658
	mov r0, #0xc
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	ldrsh r2, [sl]
	ldr r1, _02343954 ; =0xFFFFFA7E
	str r0, [sp, #0x20]
	add r0, r2, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x18]
	mov r0, #4
	bl DungeonRandInt
	mov fp, r0, lsl #0x10
	ldr r0, [sp, #0x18]
	mov r1, #0xa
	bl _s32_div_f
	ldr r3, [sl, #4]
	ldr r0, [sp, #0x20]
	str r3, [sp]
	mov r2, r0, asr #0xf
	mov sl, fp, asr #0xf
	mov r0, #1
	mov r3, r1
	str r0, [sp, #4]
	ldr fp, _02343958 ; =ov29_023534F0
	ldr r0, _0234395C ; =TREASURE_BOX_1_ITEM_IDS
	ldr r3, [fp, r3, lsl #2]
	ldrsh r0, [r0, r2]
	ldrsh r3, [r3, sl]
	mov r1, r5
	mov r2, r4
	bl GenerateAndSpawnItem
	b _02343678
_02343658:
	ldr r2, [sl, #4]
	mov r1, #1
	str r2, [sp]
	str r1, [sp, #4]
	ldrsh r3, [sl, #2]
	mov r1, r5
	mov r2, r4
	bl GenerateAndSpawnItem
_02343678:
	ldrsh r0, [r7]
	bl GetMatchingMonsterId
	movs fp, r0
	beq _023438BC
	mov r0, sb, asr #0xc
	and r0, r0, #0xff
	bl FixedRoomActionParamToDirection
	mov r1, #0
	str r1, [sp, #8]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r0, [sp, #0xc]
	ldrb sb, [r7, #3]
	ldr r0, [sp, #0x10]
	mov r1, #0xc
	smulbb r0, r0, r1
	ldr sl, [sp, #8]
	str r0, [sp, #0x1c]
	ldrsh r7, [r7]
	b _023436FC
_023436C8:
	mov r0, sl
	bl GetExplorerMazeMonster
	ldrb r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #1
	strne r0, [sp, #8]
	bne _02343704
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_023436FC:
	cmp sl, #4
	blt _023436C8
_02343704:
	ldr r0, _02343960 ; =0x00000229
	cmp fp, r0
	bne _023437C8
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02343790
	mov r0, #0
	cmp sb, #0xb
	cmp sb, #0xc
	moveq r0, #1
	cmp sb, #0xd
	moveq r0, #2
	cmp sb, #0xe
	moveq r0, #3
	bl GetExplorerMazeMonster
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _023438BC
	ldrsh r3, [r0, #4]
	mov r2, #0
	mov r1, #1
	strh r3, [sp, #0x24]
	ldrb r3, [r0, #1]
	add r0, sp, #0x24
	strh r3, [sp, #0x2c]
	strb sb, [sp, #0x26]
	str r2, [sp, #0x28]
	strb r2, [sp, #0x32]
	strh r5, [sp, #0x2e]
	strh r4, [sp, #0x30]
	bl SpawnMonster
	b _023438BC
_02343790:
	mov r0, #0x3c
	strh r0, [sp, #0x24]
	bl GetMonsterLevelToSpawn
	mov r2, #0
	strh r0, [sp, #0x2c]
	add r0, sp, #0x24
	mov r1, #1
	strb sb, [sp, #0x26]
	str r2, [sp, #0x28]
	strb r2, [sp, #0x32]
	strh r5, [sp, #0x2e]
	strh r4, [sp, #0x30]
	bl SpawnMonster
	b _023438BC
_023437C8:
	cmp fp, #0
	beq _023438BC
	mov r1, #0
	cmp sb, #6
	cmpne sb, #0xa
	str r1, [sp, #0x28]
	strb r1, [sp, #0x32]
	ldreq r1, _02343964 ; =FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	ldreq r0, [sp, #0x1c]
	strh fp, [sp, #0x24]
	ldreqsh r0, [r1, r0]
	strb sb, [sp, #0x26]
	strh r5, [sp, #0x2e]
	strh r4, [sp, #0x30]
	streqh r0, [sp, #0x2c]
	beq _02343898
	cmp sb, #1
	bne _0234382C
	ldr r0, _0234392C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawLevel
	strh r0, [sp, #0x2c]
	b _02343898
_0234382C:
	cmp sb, #4
	bne _02343850
	ldr r0, _0234392C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawLeaderLevel
	strh r0, [sp, #0x2c]
	b _02343898
_02343850:
	cmp sb, #5
	bne _02343874
	ldr r0, _0234392C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawMinionLevel
	strh r0, [sp, #0x2c]
	b _02343898
_02343874:
	add r0, r0, #0x25c
	cmp r7, r0
	strneh r1, [sp, #0x2c]
	bne _02343898
	ldr r1, _0234392C ; =DUNGEON_PTR
	ldr r0, _02343968 ; =0x0002C9E6
	ldr r1, [r1]
	ldrsh r0, [r1, r0]
	strh r0, [sp, #0x2c]
_02343898:
	add r0, sp, #0x24
	mov r1, #1
	bl SpawnMonster
	cmp sb, #6
	cmpne sb, #0xa
	bne _023438BC
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl InitOtherMonsterData
_023438BC:
	ldrb r0, [r8]
	cmp r0, #0x19
	ldrneb r1, [sp, #0x58]
	cmpne r1, #0
	beq _023438F8
	ldrb r1, [r8, #3]
	mov r2, r4
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
	str r1, [sp]
	ldrb r3, [r8, #1]
	mov r1, r5
	bl SpawnEnemyTrapAtPos
_023438F8:
	ldrb r0, [r8, #3]
	tst r0, #8
	beq _0234391C
	ldrh r0, [r6]
	bic r0, r0, #3
	strh r0, [r6]
	ldrh r0, [r6]
	orr r0, r0, #2
	strh r0, [r6]
_0234391C:
	mov r0, #0
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02343928: .word 0x00000FFF
_0234392C: .word DUNGEON_PTR
_02343930: .word ov29_0237CFC0
_02343934: .word 0x000001FF
_02343938: .word ov29_023502F4
_0234393C: .word FIXED_ROOM_ENTITY_SPAWN_TABLE
_02343940: .word ov29_023502F0
_02343944: .word ov10_022C4B34
_02343948: .word ov29_02353050
_0234394C: .word 0x00000578
_02343950: .word 0x00000181
_02343954: .word 0xFFFFFA7E
_02343958: .word ov29_023534F0
_0234395C: .word TREASURE_BOX_1_ITEM_IDS
_02343960: .word 0x00000229
_02343964: .word FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
_02343968: .word 0x0002C9E6 + PLACE_FIXED_ROOM_TILE_OFFSET
	arm_func_end PlaceFixedRoomTile
