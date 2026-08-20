	.include "asm/macros.inc"
	.include "overlay_29_02339138.inc"

	.text

	arm_func_start ov29_02339138
ov29_02339138: ; 0x02339138
	stmdb sp!, {r3, lr}
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02339138

	arm_func_start ov29_02339148
ov29_02339148: ; 0x02339148
	stmdb sp!, {r4, lr}
	ldr r0, _02339188 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r0, [r0]
	ldr r3, _0233918C ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	mov r1, #0
	smulbb r0, r0, r2
	ldr r4, [r3, r0]
	mov r0, r4
	bl ov29_0233A548
	mov r0, r4
	mov r1, #1
	bl ov29_0233A548
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339188: .word DUNGEON_PTR
_0233918C: .word TILESET_PROPERTIES
	arm_func_end ov29_02339148

	arm_func_start ov29_02339190
ov29_02339190: ; 0x02339190
	stmdb sp!, {r3, lr}
	ldr r2, _023391B8 ; =ov29_0235376C
	ldr r2, [r2, #8]
	cmp r2, #0
	ldrne r2, _023391BC ; =ov29_0237CFB8
	ldrneb r2, [r2, #2]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_0233A548
	ldmia sp!, {r3, pc}
	.align 2, 0
_023391B8: .word ov29_0235376C
_023391BC: .word ov29_0237CFB8
	arm_func_end ov29_02339190

	arm_func_start ov29_023391C0
ov29_023391C0: ; 0x023391C0
	ldr r0, _023391E4 ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _023391E8 ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	smulbb r0, r0, r1
	ldr r0, [r2, r0]
	bx lr
	.align 2, 0
_023391E4: .word DUNGEON_PTR
_023391E8: .word TILESET_PROPERTIES
	arm_func_end ov29_023391C0

	arm_func_start DrawMinimapTile
DrawMinimapTile: ; 0x023391EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sl, r0
	mov sb, r1
	bl GetMinimapData
	ldr r2, _023398C4 ; =ov29_02352FCC
	ldr r3, _023398C8 ; =DUNGEON_PTR
	ldrh r4, [r2]
	ldr r5, [r3]
	ldrh r3, [r2, #2]
	ldr r1, _023398CC ; =ov29_0235376C
	mov r7, #1
	ldr r2, [r1, #8]
	mov fp, r0
	cmp r2, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	str r7, [sp, #0x14]
	ldrneb r0, [r0, #2]
#ifdef JAPAN
	add r1, r5, #0x178
#else
	add r1, r5, #0x21c
#endif
	strh r4, [sp, #0x2c]
	strh r3, [sp, #0x2e]
	add r4, r1, #0x1a000
	cmpne r0, #0
	beq _023398BC
	cmp sl, #0
	cmpge sb, #2
	blt _023398BC
	cmp sl, #0x38
	cmplt sb, #0x20
	bge _023398BC
	mov r0, sl
	mov r1, sb
	bl GetTile
	mov r6, r0
	ldrb r1, [r4, #0x32]
	ldrh r2, [r6]
	ldrb r0, [r4, #0x29]
	cmp r1, #0
	moveq r1, r7
	str r0, [sp, #0x24]
	and r0, r2, #3
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x22]
	movne r1, #0
	and r1, r1, #0xff
	str r0, [sp, #0x20]
	ldrb r0, [r4, #0x28]
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x27]
	str r0, [sp, #0x1c]
	ldrb r0, [r4, #0x23]
	ldrb r5, [r4, #0x25]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0x33]
	cmp r1, #0
	movne r1, #0
	ldreq r1, _023398D0 ; =ov29_0237CFB8
	ldreqb r1, [r1, #3]
	and r1, r1, #0xff
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	cmp r1, #0
	ldrneh r1, [r6, #2]
	movne r0, #0
	strne r0, [sp, #0x10]
	andne r8, r1, #1
	bne _02339344
	ldrb r1, [r4, #0x34]
	cmp r1, #0
	bne _02339310
	cmp r0, #0
	movne r8, #1
	bne _02339318
_02339310:
	ldrh r0, [r6, #2]
	and r8, r0, #1
_02339318:
	bl GetFloorType
	cmp r0, #0
	ldreqb r0, [r4, #0x2a]
	streq r0, [sp, #0x10]
	movne r0, #0
	strne r0, [sp, #0x10]
	cmp r5, #0
	beq _02339344
	cmp r8, #0
	streq r8, [sp, #0x14]
	moveq r8, #1
_02339344:
	bl IsMapShownOnEitherScreen
	cmp r0, #0
	ldreq r0, _023398CC ; =ov29_0235376C
	ldreqb r1, [r0, #1]
	cmpeq r1, #0
	beq _02339788
	ldr r0, [sp, #0x20]
	mov r5, #0
	cmp r0, #0
	bne _0233946C
	ldr r0, [r6, #0xc]
	str r0, [sp, #4]
	cmp r0, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	ldrneb r0, [r0, #3]
	cmpne r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #1
	bne _0233946C
	ldr r0, [sp, #4]
	bl ShouldMinimapDisplayEntity
	cmp r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	mov r7, r5
	ldr r0, [r0, #0xb4]
	str r0, [sp]
	bl IsExperienceLocked
	cmp r0, #0
	bne _023393D4
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #7
	bne _023393DC
_023393D4:
	mov r5, #0xa
	b _0233946C
_023393DC:
	ldr r0, [sp]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0233943C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02339434
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #2
	moveq r0, r5
	beq _02339410
	bl IsBehaviorLoneOutlaw
_02339410:
	cmp r0, #0
	movne r5, #0xc
	bne _0233946C
	ldr r0, [sp]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r5, #0xa
	moveq r5, #2
	b _0233946C
_02339434:
	mov r7, #1
	b _0233946C
_0233943C:
	ldr r0, [sp]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _02339468
	ldr r0, _023398CC ; =ov29_0235376C
	strh sl, [r0, #2]
	strh sb, [r0, #4]
	ldrb r0, [r4, #0x2d]
	cmp r0, #0
	movne r5, #8
	b _0233946C
_02339468:
	mov r5, #0xa
_0233946C:
	cmp r7, #0
	beq _0233963C
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0233963C
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _023395D0
	cmp r8, #0
	ldr r1, [r0]
	bne _023394F4
	ldr r0, [sp, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _023394D8
	cmp r1, #3
	bne _023394D8
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _023394C8
	ldrh r0, [r6, #2]
	tst r0, #2
	beq _023394EC
_023394C8:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	movne r5, #3
	b _023394EC
_023394D8:
	cmp r1, #5
	bne _023394EC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	movne r5, #0xd
_023394EC:
	mov r7, #0
	b _0233963C
_023394F4:
	cmp r7, #0
	beq _0233963C
	cmp r1, #2
	bne _0233953C
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0233953C
	ldrb r2, [r0, #0x20]
	cmp r2, #0
	ldreq r2, [sp, #0x18]
	cmpeq r2, #0
	beq _0233953C
	bl GetTrapInfo
	ldrb r1, [r0]
	ldr r0, _023398D4 ; =ov29_02352FF4
	mov r7, #0
	ldrb r5, [r0, r1]
	b _0233963C
_0233953C:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0233957C
	cmp r1, #3
	bne _0233957C
	ldr r2, [sp, #0x1c]
	cmp r2, #0
	bne _02339568
	ldrh r2, [r6, #2]
	tst r2, #2
	beq _0233957C
_02339568:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	movne r5, #3
	movne r7, #0
	bne _0233963C
_0233957C:
	cmp r1, #5
	bne _023395BC
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _023395B0
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0233963C
	ldr r1, [sp, #0x18]
	cmp r1, #0
	ldreqb r0, [r0, #0x20]
	cmpeq r0, #0
	beq _0233963C
_023395B0:
	mov r5, #0xd
	mov r7, #0
	b _0233963C
_023395BC:
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #0
	movne r7, r5
	b _0233963C
_023395D0:
	cmp r8, #0
	bne _02339608
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0233963C
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
	b _0233963C
_02339608:
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
_0233963C:
	cmp r7, #0
	bne _02339654
	ldr r0, [sp, #0x24]
	cmp r0, #0
	cmpne r5, #0
	movne r5, #0xb
_02339654:
	cmp r5, #0
	bne _02339734
	cmp r8, #0
	moveq r5, #1
	beq _02339734
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #1
	bne _02339734
	cmp sb, #0x1f
	mov r4, #0xf
	bge _023396A0
	mov r0, sl
	add r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #1
_023396A0:
	cmp sb, #1
	blt _023396C4
	mov r0, sl
	sub r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #4
_023396C4:
	cmp sl, #0x37
	bge _023396E8
	mov r1, sb
	add r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #2
_023396E8:
	cmp sl, #1
	blt _0233970C
	mov r1, sb
	sub r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #8
_0233970C:
	ldrh r1, [r6, #2]
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	tst r1, #2
	addne r0, r0, #0x10
	movne r0, r0, lsl #0x10
	movne r5, r0, asr #0x10
	addeq r0, r0, #0x20
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
_02339734:
	bl GetTopScreenOption
	cmp r0, #3
	addeq r0, r5, #0x80
	streqh r0, [sp, #0x2e]
	bl GetBottomScreenOption
	cmp r0, #0
	bne _02339770
	ldr r0, _023398CC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	addne r0, r5, #0x40
	strneh r0, [sp, #0x2c]
	moveq r0, #1
	streqh r0, [sp, #0x2c]
	b _0233979C
_02339770:
	bl GetBottomScreenOption
	cmp r0, #1
	addeq r0, r5, #0x40
	streqh r0, [sp, #0x2c]
	strneh r5, [sp, #0x2c]
	b _0233979C
_02339788:
	mov r2, #1
	mov r1, #0x64
	strh r2, [sp, #0x2c]
	strh r2, [sp, #0x2e]
	strh r1, [r0, #2]
_0233979C:
	sub r3, sb, #2
	add r0, r3, r3, lsr #31
	mov r5, r0, asr #1
	mov r0, #0x700
	mul r7, r5, r0
	ldr r0, _023398CC ; =ov29_0235376C
	mov r2, sl, lsr #0x1f
	mov r4, r3, lsr #0x1f
	rsb r1, r2, sl, lsl #31
	rsb r3, r4, r3, lsl #31
	ldr sb, [r0, #8]
	add r0, sl, sl, lsr #31
	ldrsh r6, [sp, #0x2c]
	add r2, r2, r1, ror #31
	add r1, r4, r3, ror #31
	add r8, r2, r1, lsl #1
	ldr r2, [sb]
	add r1, r8, r6, lsl #2
	mov r4, r0, asr #1
	add r0, fp, r7
	add r6, r0, r4, lsl #6
	ldr r1, [r2, r1, lsl #2]
	mov r0, r6
	bl InitMinimapDisplayTile
	ldr r0, _023398CC ; =ov29_0235376C
	ldrsh r1, [sp, #0x2e]
	ldr r0, [r0, #8]
	add r2, fp, #0x7000
	add r2, r2, r7
	add r7, r2, r4, lsl #6
	ldr r2, [r0]
	add r0, r8, r1, lsl #2
	ldr r1, [r2, r0, lsl #2]
	mov r0, r7
	bl InitMinimapDisplayTile
	add r0, fp, #0xe000
	ldrb r1, [r0, #0x445]
	cmp r1, #0
	bne _023398BC
	mov r1, #0x1c
	mul r8, r5, r1
	add r1, r0, r8
	ldrb r2, [r1, r4]
	add r1, r1, r4
	cmp r2, #0
	bne _023398BC
	mov r3, #1
	strb r3, [r1]
	ldr r2, [r0, #0x440]
	cmp r2, #0x28
	strgeb r3, [r0, #0x445]
	bge _023398BC
	add r3, r4, r8
	add r2, fp, r2, lsl #4
	mov r3, r3, lsl #6
	add r2, r2, #0xe000
	str r3, [r2, #0x1c0]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r6, [r2, #0x1c4]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r7, [r2, #0x1c8]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r1, [r2, #0x1cc]
	ldr r1, [r0, #0x440]
	add r1, r1, #1
	str r1, [r0, #0x440]
_023398BC:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023398C4: .word ov29_02352FCC
_023398C8: .word DUNGEON_PTR
_023398CC: .word ov29_0235376C
_023398D0: .word ov29_0237CFB8
_023398D4: .word ov29_02352FF4
	arm_func_end DrawMinimapTile

	arm_func_start ov29_023398D8
ov29_023398D8: ; 0x023398D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, #0x7000
	mla r6, r1, r2, r0
	add r0, r0, #0xe000
	mov r5, #0
	ldr r2, _02339928 ; =ov29_0235377C
	strb r5, [r0, #0x445]
	ldr r7, [r2, r1, lsl #2]
	mov r4, #0x200
	b _0233991C
_02339900:
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl Memcpy32
	add r7, r7, #0x200
	add r6, r6, #0x200
	add r5, r5, #8
_0233991C:
	cmp r5, #0x1c0
	blo _02339900
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02339928: .word ov29_0235377C
	arm_func_end ov29_023398D8

	arm_func_start ov29_0233992C
ov29_0233992C: ; 0x0233992C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02339A1C ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	mov r5, r4
	bl ov29_022EA408
	ldr r1, _02339A20 ; =ov29_0237CFB8
	ldrb r1, [r1]
	cmp r1, #0
	beq _0233996C
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	moveq r4, #1
_0233996C:
	bl GetTopScreenOption
	cmp r0, #3
	moveq r5, #1
	bl GetMinimapData
	mov r6, r0
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x444]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov10_022BFD20
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x445]
	cmp r0, #0
	bne _023399D8
	cmp r4, #0
	beq _023399C0
	mov r0, r6
	mov r1, #0
	bl ov29_0233A470
_023399C0:
	cmp r5, #0
	beq _02339A0C
	mov r0, r6
	mov r1, #1
	bl ov29_0233A470
	b _02339A0C
_023399D8:
	cmp r4, #0
	beq _023399EC
	mov r0, r6
	mov r1, #0
	bl ov29_023398D8
_023399EC:
	cmp r5, #0
	beq _02339A00
	mov r0, r6
	mov r1, #1
	bl ov29_023398D8
_02339A00:
	add r0, r6, #0xe000
	mov r1, #1
	strb r1, [r0, #0x446]
_02339A0C:
	add r0, r6, #0xe000
	mov r1, #0
	str r1, [r0, #0x440]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339A1C: .word DUNGEON_PTR
_02339A20: .word ov29_0237CFB8
	arm_func_end ov29_0233992C

	arm_func_start FlashLeaderIcon
FlashLeaderIcon: ; 0x02339A24
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r1, _02339CB8 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a5]
#else
	ldrb r0, [r0, #0x249]
#endif
	cmp r0, #0
	bne _02339CB0
	ldr r0, _02339CBC ; =ov29_0235376C
	ldrsh r0, [r0, #2]
	cmp r0, #0x64
	bge _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	tst r1, #8
	bne _02339CB0
	add r0, sp, #0
	mov r1, #8
	bl MemZero
	ldrh r2, [sp]
	ldrh r0, [sp, #6]
	ldrh r1, [sp, #2]
	bic r2, r2, #0x100
	strh r2, [sp]
	ldrh r2, [sp]
	bic r0, r0, #1
	strh r0, [sp, #6]
	bic r2, r2, #0x200
	strh r2, [sp]
	ldrh r2, [sp]
	bic r1, r1, #0x3e00
	strh r1, [sp, #2]
	bic r0, r2, #0xc00
	strh r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	bic r0, r0, #0x1000
	strh r0, [sp]
	ldrh r3, [sp]
	ldrh r0, [sp, #6]
	bic r2, r2, #0xc000
	bic r3, r3, #0xc000
	bic r1, r1, #0xc00
	bic r0, r0, #2
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	strh r0, [sp, #6]
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x448]
	cmp r0, #0
	beq _02339BC0
	bl GetTopScreenOption
	cmp r0, #3
	bne _02339BC0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldr ip, _02339CBC ; =ov29_0235376C
	ldrh r3, [sp, #2]
	orr r5, r0, #0x70
	add r0, r2, #0x200
	and r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r1, [ip, #2]
	bic r5, r5, #0xf000
	strh r5, [sp, #4]
	mov r0, r1, lsl #2
	ldrh r1, [sp]
	add r5, r0, #0x10
	and r2, r5, r2, lsr #23
	ldrh r6, [sp, #2]
	ldrh r3, [sp, #4]
	bic r1, r1, #0x2000
	orr r6, r6, r2
	orr r0, r3, #0xc000
	ldr r3, _02339CC4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r5, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	strh r1, [sp]
	and r1, r5, r2
	strh r1, [sp, #6]
	strh r6, [sp, #2]
	strh r0, [sp, #4]
	ldrsh r0, [ip, #4]
	ldrh r2, [sp, #6]
	ldr r3, [r3]
	mov r0, r0, lsl #0x16
	orr r5, r2, r0, lsr #16
	ldr r2, _02339CCC ; =0x0000013F
	add r1, sp, #0
	add r0, r3, #0x70
	strh r5, [sp, #6]
	bl AddSimpleObjToOam
_02339BC0:
	cmp r4, #0
	bne _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02339CB0
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x447]
	cmp r0, #0
	beq _02339CB0
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339CB0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldrh r4, [sp]
	ldrh r6, [sp, #2]
	add r2, r2, #0x200
	orr r1, r0, #0xdd
	ldr ip, _02339CBC ; =ov29_0235376C
	and r2, r6, r2
	strh r2, [sp, #2]
	ldrsh r0, [ip, #2]
	orr r1, r1, #0x100
	bic r4, r4, #0x2000
	strh r4, [sp]
	strh r1, [sp, #4]
	mov r5, r0, lsl #2
	ldrh r0, [sp, #4]
	ldrh r1, [sp]
	ldrh lr, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	bic r0, r0, #0xf000
	and r2, lr, r2
	orr r1, r1, #0x2000
	ldr r3, _02339CD0 ; =0x000001DD
	strh r2, [sp, #6]
	ldrh r6, [sp, #2]
	add r5, r5, #8
	add r2, r3, #0x22
	and r2, r5, r2
	orr r2, r6, r2
	strh r2, [sp, #2]
	strh r0, [sp, #4]
	strh r1, [sp]
	ldrsh r1, [ip, #4]
	ldr r4, _02339CC4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r2, [sp, #6]
	ldr r0, [r4]
	mov r1, r1, lsl #0x16
	orr r4, r2, r1, lsr #16
	add r1, sp, #0
	sub r2, r3, #0x9e
	strh r4, [sp, #6]
	bl AddSimpleObjToOam
_02339CB0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339CB8: .word DUNGEON_PTR
_02339CBC: .word ov29_0235376C
_02339CC0: .word ov29_0237CFB8
_02339CC4: .word OBJ_GRAPHICS_CONTROLS_PTR
_02339CC8: .word 0xFFFF000F
_02339CCC: .word 0x0000013F
_02339CD0: .word 0x000001DD
	arm_func_end FlashLeaderIcon

	arm_func_start ov29_02339CD4
ov29_02339CD4: ; 0x02339CD4
	ldr r0, _02339CE4 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02339CE4: .word ov29_0237CFB8
	arm_func_end ov29_02339CD4

	arm_func_start UpdateMinimap
UpdateMinimap: ; 0x02339CE8
	stmdb sp!, {r4, r5, r6, lr}
	bl GetMinimapData
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x445]
	mov r4, r6
_02339D0C:
	mov r5, r4
_02339D10:
	mov r0, r5
	mov r1, r6
	bl DrawMinimapTile
	add r5, r5, #1
	cmp r5, #0x38
	blt _02339D10
	add r6, r6, #1
	cmp r6, #0x20
	blt _02339D0C
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339D54
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
_02339D54:
	ldr r0, _02339D78 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339D78: .word ov29_0235376C
	arm_func_end UpdateMinimap

	arm_func_start ov29_02339D7C
ov29_02339D7C: ; 0x02339D7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #1
	mov r5, #0x10
	moveq r6, #0
	beq _02339D9C
	cmp r1, #0
	movne r6, #0
	moveq r6, #5
_02339D9C:
	cmp r0, #1
	mov sl, #0x1140
	mov r8, #1
	bne _02339E6C
	mov sb, #0
	mov fp, sb
	b _02339E00
_02339DB8:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_02339DC4:
	add r0, r7, #2
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #1
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _02339DC4
	add r8, r8, #1
	add sb, sb, #1
_02339E00:
	cmp sb, r5
	blt _02339DB8
	mov sb, #0
	mov r4, #0x1000
	mov fp, #1
	mov r7, sb
	b _02339E58
_02339E1C:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339E28:
	add r0, sl, #2
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339E28
	add r8, r8, #1
	add sb, sb, #1
_02339E58:
	cmp sb, r6
	blt _02339E1C
	mov r0, #1
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02339E6C:
	mov r7, #0
	mov fp, r7
	b _02339EC0
_02339E78:
	mov r0, r8, lsl #0x10
	mov sb, fp
	mov r4, r0, asr #0x10
_02339E84:
	add r0, sb, #1
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #0
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _02339E84
	add r8, r8, #1
	add r7, r7, #1
_02339EC0:
	cmp r7, r5
	blt _02339E78
	mov sb, #0
	mov r4, #0x1000
	mov fp, sb
	mov r7, sb
	b _02339F18
_02339EDC:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339EE8:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339EE8
	add r8, r8, #1
	add sb, sb, #1
_02339F18:
	cmp sb, r6
	blt _02339EDC
	mov r0, #0
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02339D7C

	arm_func_start ov29_02339F2C
ov29_02339F2C: ; 0x02339F2C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02339F60 ; =ov29_0235352C
	str r1, [sp, #4]
	ldr ip, [ip]
	mov r1, #0xc
	mla r1, r3, r1, ip
	str r0, [sp]
	ldr r0, [r1, #0x24]
	add r1, sp, #0
	bl sub_0200B3FC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339F60: .word ov29_0235352C
	arm_func_end ov29_02339F2C

	arm_func_start ov29_02339F64
ov29_02339F64: ; 0x02339F64
	ldr r2, _02339F80 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _02339F84 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_02339F80: .word ov29_0235352C
_02339F84: .word sub_0200B330
	arm_func_end ov29_02339F64

	arm_func_start ov29_02339F88
ov29_02339F88: ; 0x02339F88
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339FAC
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
_02339FAC:
	ldr r0, _02339FCC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339FCC: .word ov29_0235376C
	arm_func_end ov29_02339F88

	arm_func_start ov29_02339FD0
ov29_02339FD0: ; 0x02339FD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FD0

	arm_func_start ov29_02339FF4
ov29_02339FF4: ; 0x02339FF4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_02339F88
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FF4

	arm_func_start ov29_0233A01C
ov29_0233A01C: ; 0x0233A01C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #0
	movne r6, #0
	mov sb, #0
	mov sl, r1
	mov r5, #0x10
	moveq r6, #5
	mov r8, #1
	mov fp, sb
	b _0233A080
_0233A044:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_0233A050:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, #0x1000
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _0233A050
	add r8, r8, #1
	add sb, sb, #1
_0233A080:
	cmp sb, r5
	blt _0233A044
	mov r7, #0
	mov fp, #0x1000
	mov r5, r7
	b _0233A0D4
_0233A098:
	mov r0, r8, lsl #0x10
	mov sb, r5
	mov r4, r0, asr #0x10
_0233A0A4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, fp
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _0233A0A4
	add r8, r8, #1
	add r7, r7, #1
_0233A0D4:
	cmp r7, r6
	blt _0233A098
	mov r0, sl
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_0233A01C

	arm_func_start ov29_0233A0E8
ov29_0233A0E8: ; 0x0233A0E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #1
	bne _0233A114
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A114:
	cmp r1, #0
	ldmneia sp!, {r4, pc}
	bl GetBottomScreenOption
	cmp r0, #0
	beq _0233A138
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A138:
	ldr r0, _0233A158 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A158: .word ov29_0235376C
	arm_func_end ov29_0233A0E8

	arm_func_start ov29_0233A15C
ov29_0233A15C: ; 0x0233A15C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetTopScreenOption
	cmp r0, #3
	bne _0233A17C
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
_0233A17C:
	bl GetBottomScreenOption
	cmp r0, #0
	beq _0233A198
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A198:
	ldr r0, _0233A1B8 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A1B8: .word ov29_0235376C
	arm_func_end ov29_0233A15C

	arm_func_start ov29_0233A1BC
ov29_0233A1BC: ; 0x0233A1BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	mov r7, r0
	mov r8, #0x1000
	mov r4, r6
_0233A1D0:
	mov r0, r6, lsl #0x10
	mov r5, r4
	mov sb, r0, asr #0x10
_0233A1DC:
	mov r0, r5, lsl #0x10
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r5, r5, #1
	cmp r5, #0x1c
	blt _0233A1DC
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233A1D0
	mov r0, r7
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_0233A1BC
