	.include "asm/macros.inc"
	.include "overlay_29_022E7EC4.inc"

	.text

	arm_func_start AllocTopScreenStatus
AllocTopScreenStatus: ; 0x022E7EC4
	stmdb sp!, {r3, lr}
	mov r0, #0x230
	mov r1, #0
	bl MemAlloc
	ldr r2, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0x230
	str r0, [r2]
	bl MemZero
	ldr r0, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0x29]
	ldr r1, [r0]
	strb r2, [r1, #0x2c]
	ldr r1, [r0]
	strb r2, [r1, #0x2b]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #0x228]
	bl ov29_022E8708
	ldr r0, _022E7F40 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x229]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F40: .word TOP_SCREEN_STATUS_PTR
	arm_func_end AllocTopScreenStatus

	arm_func_start FreeTopScreenStatus
FreeTopScreenStatus: ; 0x022E7F44
	stmdb sp!, {r3, lr}
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl FreeTopScreen
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7F78 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F78: .word TOP_SCREEN_STATUS_PTR
	arm_func_end FreeTopScreenStatus

	arm_func_start ov29_022E7F7C
ov29_022E7F7C: ; 0x022E7F7C
	ldr r0, _022E7F90 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E7F90: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E7F7C

	arm_func_start ov29_022E7F94
ov29_022E7F94: ; 0x022E7F94
	stmdb sp!, {r3, lr}
	ldr r0, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x228]
	ldr r0, [r0]
	strb r1, [r0]
	bl ov29_02339138
	mov r0, #1
	mov r1, r0
	bl ov29_02339D7C
	bl UpdateMinimap
	mov r0, #0
	bl SetMinimapDataE447
	ldr r1, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	bl ov29_022E8104
	bl GetPlayerGender
	cmp r0, #2
	ldr r0, _022E8014 ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC738
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8014: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E7F94

	arm_func_start ov29_022E8018
ov29_022E8018: ; 0x022E8018
	stmdb sp!, {r3, lr}
	ldr r0, _022E8050 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E8048
	bl ov29_022DC76C
	bl ov29_022DC778
	ldr r0, _022E8050 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E8048:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8050: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8018

	arm_func_start ov29_022E8054
ov29_022E8054: ; 0x022E8054
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl GetTopScreenOption
	cmp r0, #3
	ldrne r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0]
	ldmneia sp!, {r3, pc}
	ldr r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov29_02339138
	mov r0, #0
	mov r1, #1
	bl ov29_0233A0E8
	mov r0, #1
	mov r1, #0
	bl ov29_02339D7C
	ldr r0, _022E80CC ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E80CC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8054

	arm_func_start ov29_022E80D0
ov29_022E80D0: ; 0x022E80D0
	stmdb sp!, {r3, lr}
	bl ov29_022DC77C
	ldr r1, _022E8100 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	mov r0, #1
	bl ov29_0233A1BC
	bl ov29_02339138
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8100: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E80D0

	arm_func_start ov29_022E8104
ov29_022E8104: ; 0x022E8104
	stmdb sp!, {r3, lr}
	ldr r0, _022E812C ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov10_022C1E50
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E812C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8104

	arm_func_start InitializeTeamStats
InitializeTeamStats: ; 0x022E8130
	stmdb sp!, {r3, lr}
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	strb r2, [r0, #0x229]
	bl ov29_022E8104
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x24]
	bl GetPlayerGender
	cmp r0, #2
	ldr r0, _022E818C ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC694
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E818C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end InitializeTeamStats

	arm_func_start UpdateTeamStatsWrapper
UpdateTeamStatsWrapper: ; 0x022E8190
	stmdb sp!, {r3, lr}
	ldr r0, _022E81C4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E81BC
	bl ov29_022DC6D0
	ldr r0, _022E81C4 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E81BC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E81C4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end UpdateTeamStatsWrapper

	arm_func_start ov29_022E81C8
ov29_022E81C8: ; 0x022E81C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022DC6DC
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E81C8

	arm_func_start FreeTeamStatsWrapper
FreeTeamStatsWrapper: ; 0x022E81E8
	stmdb sp!, {r3, lr}
	bl ov29_022DC728
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end FreeTeamStatsWrapper

	arm_func_start ov29_022E81F8
ov29_022E81F8: ; 0x022E81F8
	stmdb sp!, {r3, lr}
	bl IsTeamStatsOnTopScreen
	cmp r0, #0
	bne _022E8210
	bl ov29_022E8104
	ldmia sp!, {r3, pc}
_022E8210:
	bl GetTopScreenOption
	cmp r0, #1
	bne _022E8238
	ldr r0, _022E8240 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrsh r0, [r0, #8]
	cmp r0, #1
	beq _022E8238
	mov r0, #1
	bl ov29_022E8CA8
_022E8238:
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8240: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E81F8

	arm_func_start ov29_022E8244
ov29_022E8244: ; 0x022E8244
	stmdb sp!, {r3, lr}
	bl GetTopScreenOption
	cmp r0, #4
	ldreq r0, _022E826C ; =TOP_SCREEN_STATUS_PTR
	ldreq r0, [r0]
	ldreqsh r0, [r0, #8]
	cmpeq r0, #4
	ldmneia sp!, {r3, pc}
	bl ov29_022E9008
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E826C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8244

	arm_func_start DisplayTeamStatsSprite
DisplayTeamStatsSprite: ; 0x022E8270
#ifdef JAPAN
#define OV29_022E8270_OFFSET -0xA4
#else
#define OV29_022E8270_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r3, _022E83FC ; =TOP_SCREEN_STATUS_PTR
	mov sl, r0
	ldr r3, [r3]
	mov sb, r1
	mov fp, r2
	cmp r3, #0
	beq _022E83F4
	ldr r8, [sl, #0xb4]
	bl GetIdleAnimationId
	ldr r1, _022E8400 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x1a000
	ldr r0, [r1, #0x22c + OV29_022E8270_OFFSET]
	mov r6, r5
	cmp r0, sl
	ldrsh r0, [sl, #0xa8]
	mov r7, r5
	str r0, [sp, #0x18]
	moveq r0, r5
	ldrneb r0, [r1, #0x245 + OV29_022E8270_OFFSET]
	cmp r0, #0
	bne _022E82E4
	ldrb r0, [r8, #0xd8]
	cmp r0, #2
	bne _022E82F0
_022E82E4:
	ldr r0, _022E8404 ; =0x00000229
	bl DungeonGetSpriteIndex
	str r0, [sp, #0x18]
_022E82F0:
	ldrb r0, [r8, #0xc4]
	cmp r0, #1
	cmpne r0, #6
	beq _022E8364
	ldr r0, _022E8400 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x78b]
	cmp r0, #0
	beq _022E832C
	bl ov29_0234B4E0
	cmp r0, #0
	addeq r0, r5, #2
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
	beq _022E8354
_022E832C:
	ldrb r0, [sl, #0xaf]
	cmp r0, #0
	cmpne r0, #7
	bne _022E8354
	ldr r0, [sl, #0xb4]
#ifdef JAPAN
	ldr r0, [r0, #0x10c]
#else
	ldr r0, [r0, #0x110]
#endif
	cmp r0, #1
	addgt r0, r5, #1
	movgt r0, r0, lsl #0x10
	movgt r5, r0, asr #0x10
_022E8354:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	b _022E8368
_022E8364:
	mov r5, #0
_022E8368:
#ifdef JAPAN
	ldrb r0, [r8, #0x10a]
#else
	ldrb r0, [r8, #0x10b]
#endif
	cmp r0, #2
	beq _022E83A4
	ldrb r1, [r8, #0xc4]
	cmp r1, #6
	ldrneb r0, [r8, #0xbf]
	cmpne r0, #4
	cmpne r1, #2
	bne _022E83A4
	ldr r0, _022E8408 ; =DUNGEON_FRAMES_PASSED
	ldr r0, [r0]
	and r0, r0, #2
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E83A4:
	ldrb r0, [r8, #0xef]
	cmp r0, #1
	ldreq r0, _022E8400 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
	ldreqb r0, [r0, #0x244 + OV29_022E8270_OFFSET]
	cmpeq r0, #0
	moveq r7, #1
	cmp r4, #0xff
	beq _022E83F4
	mov r0, #1
	stmia sp, {r0, sb, fp}
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r7, [sp, #0x14]
	ldrsh r1, [r8, #4]
	ldr r3, [r8, #0xb0]
	ldr r0, [sp, #0x18]
	mov r2, r4
	bl ov29_022DC6E8
_022E83F4:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E83FC: .word TOP_SCREEN_STATUS_PTR
_022E8400: .word DUNGEON_PTR
_022E8404: .word 0x00000229
_022E8408: .word DUNGEON_FRAMES_PASSED
	arm_func_end DisplayTeamStatsSprite

	arm_func_start ov29_022E840C
ov29_022E840C: ; 0x022E840C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	movne r0, #0
	bne _022E8470
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	bl sub_02048400
	cmp r0, #0
	beq _022E8460
	bl sub_02048384
_022E8460:
	ldr r1, _022E8478 ; =TOP_SCREEN_STATUS_PTR
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0x29]
_022E8470:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8478: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E840C

	arm_func_start ov29_022E847C
ov29_022E847C: ; 0x022E847C
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl sub_020483B8
	ldr r0, _022E84AC ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84AC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E847C

	arm_func_start ov29_022E84B0
ov29_022E84B0: ; 0x022E84B0
	stmdb sp!, {r3, lr}
	ldr r0, _022E84FC ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x80
	bl ov10_022C2278
	bl sub_02048400
	cmp r0, #0
	beq _022E84E4
	bl sub_020483D8
_022E84E4:
	ldr r0, _022E84FC ; =TOP_SCREEN_STATUS_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0x29]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84FC: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E84B0

	arm_func_start ov29_022E8500
ov29_022E8500: ; 0x022E8500
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8548 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8548 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8E94
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8548: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8500

	arm_func_start ov29_022E854C
ov29_022E854C: ; 0x022E854C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E8F78
	ldr r0, _022E8584 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8584: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E854C

	arm_func_start ov29_022E8588
ov29_022E8588: ; 0x022E8588
	stmdb sp!, {r3, lr}
	ldr r0, _022E85A4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8F28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E85A4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8588

	arm_func_start ov29_022E85A8
ov29_022E85A8: ; 0x022E85A8
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E85F0 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E85F0 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8FCC
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E85F0: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E85A8

	arm_func_start ov29_022E85F4
ov29_022E85F4: ; 0x022E85F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E9014
	ldr r0, _022E862C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E862C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E85F4

	arm_func_start ov29_022E8630
ov29_022E8630: ; 0x022E8630
	stmdb sp!, {r3, lr}
	ldr r0, _022E864C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8FF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E864C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8630

	arm_func_start ov29_022E8650
ov29_022E8650: ; 0x022E8650
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8698 ; =TOP_SCREEN_STATUS_PTR
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8698 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8698: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8650

	arm_func_start ov29_022E869C
ov29_022E869C: ; 0x022E869C
	mov r0, #1
	bx lr
	arm_func_end ov29_022E869C

	arm_func_start ov29_022E86A4
ov29_022E86A4: ; 0x022E86A4
	bx lr
	arm_func_end ov29_022E86A4

	arm_func_start ov29_022E86A8
ov29_022E86A8: ; 0x022E86A8
	stmdb sp!, {r3, lr}
	ldr r0, _022E86C4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86C4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E86A8

	arm_func_start AssignTopScreenHandlers
AssignTopScreenHandlers: ; 0x022E86C8
	str r1, [r0]
	ldr r1, [sp]
	stmib r0, {r2, r3}
	str r1, [r0, #0xc]
	mov r1, #1
	strb r1, [r0, #0x10]
	bx lr
	arm_func_end AssignTopScreenHandlers

	arm_func_start ov29_022E86E4
ov29_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8704 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8704: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E86E4

	arm_func_start ov29_022E8708
ov29_022E8708: ; 0x022E8708
	stmdb sp!, {r3, lr}
	bl GetTopScreenOption
	cmp r0, #3
	bne _022E8724
	mov r0, #3
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8724:
	cmp r0, #2
	bne _022E8738
	mov r0, #0
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8738:
	cmp r0, #0
	bne _022E874C
	mov r0, #2
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E874C:
	cmp r0, #4
	bne _022E8760
	mov r0, #4
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8760:
	bl ov29_022E81F8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8708

	arm_func_start ov29_022E8768
ov29_022E8768: ; 0x022E8768
	ldr ip, _022E8774 ; =ov29_022E8CA8
	mov r0, #5
	bx ip
	.align 2, 0
_022E8774: .word ov29_022E8CA8
	arm_func_end ov29_022E8768

	arm_func_start ov29_022E8778
ov29_022E8778: ; 0x022E8778
	stmdb sp!, {r3, lr}
	ldr r0, _022E87B0 ; =TOP_SCREEN_STATUS_PTR
	mov r3, #3
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0xc]
	ldr r0, [r0]
	strh r1, [r0, #0x10]
	bl ov29_022E8104
	ldr r0, _022E87B0 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrsh r0, [r1, #0x10]
	strh r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87B0: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8778

	arm_func_start ov29_022E87B4
ov29_022E87B4: ; 0x022E87B4
	ldr r1, _022E87D8 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r1]
	ldrsh r1, [r2, #8]
	cmp r1, r0
	ldreq r0, [r2, #4]
	cmpeq r0, #5
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022E87D8: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E87B4

	arm_func_start ov29_022E87DC
ov29_022E87DC: ; 0x022E87DC
	stmdb sp!, {r3, lr}
	bl GetTopScreenOption
	ldr r1, _022E87F8 ; =ov29_023515E8
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bl ov29_022E87B4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87F8: .word ov29_023515E8
	arm_func_end ov29_022E87DC

	arm_func_start ov29_022E87FC
ov29_022E87FC: ; 0x022E87FC
	ldr r1, _022E880C ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x2b]
	bx lr
	.align 2, 0
_022E880C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E87FC

	arm_func_start ov29_022E8810
ov29_022E8810: ; 0x022E8810
	ldr r0, _022E8830 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8830: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8810

	arm_func_start ov29_022E8834
ov29_022E8834: ; 0x022E8834
	ldr r1, _022E8844 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_022E8844: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8834

	arm_func_start ov29_022E8848
ov29_022E8848: ; 0x022E8848
	ldr r0, _022E8868 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8868: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8848

	arm_func_start HandleTopScreenFades
HandleTopScreenFades: ; 0x022E886C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r5, [r0]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_022E8890: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _022E88AC ; case 1
	b _022E88C0 ; case 2
	b _022E8A80 ; case 3
	b _022E8AC8 ; case 4
	b _022E8B00 ; case 5
	b _022E8B5C ; case 6
_022E88AC:
	ldrb r0, [r5, #0x2b]
	cmp r0, #0
	moveq r0, #2
	streq r0, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E88C0:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E88EC
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_022E88EC:
	bl FreeTopScreen
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r4, [r0]
	ldrsh r0, [r4, #0x10]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022E89DC
_022E8908: ; jump table
	b _022E8920 ; case 0
	b _022E8940 ; case 1
	b _022E8960 ; case 2
	b _022E8980 ; case 3
	b _022E89A0 ; case 4
	b _022E89C0 ; case 5
_022E8920:
	ldr ip, _022E8BA4 ; =ov29_022E84B0
	ldr r1, _022E8BA8 ; =ov29_022E840C
	ldr r3, _022E8BAC ; =ov29_022E847C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8940:
	ldr ip, _022E8BB0 ; =FreeTeamStatsWrapper
	ldr r1, _022E8BB4 ; =InitializeTeamStats
	ldr r2, _022E8BB8 ; =UpdateTeamStatsWrapper
	ldr r3, _022E8BBC ; =ov29_022E81C8
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8960:
	ldr ip, _022E8BC0 ; =ov29_022E8588
	ldr r1, _022E8BC4 ; =ov29_022E8500
	ldr r3, _022E8BC8 ; =ov29_022E854C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E8980:
	ldr ip, _022E8BCC ; =ov29_022E80D0
	ldr r1, _022E8BD0 ; =ov29_022E7F94
	ldr r2, _022E8BD4 ; =ov29_022E8018
	ldr r3, _022E8BD8 ; =ov29_022E8054
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E89A0:
	ldr ip, _022E8BDC ; =ov29_022E8630
	ldr r1, _022E8BE0 ; =ov29_022E85A8
	ldr r3, _022E8BE4 ; =ov29_022E85F4
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl AssignTopScreenHandlers
	b _022E89DC
_022E89C0:
	ldr ip, _022E8BE8 ; =ov29_022E86A8
	ldr r1, _022E8BEC ; =ov29_022E8650
	ldr r2, _022E8BF0 ; =ov29_022E869C
	ldr r3, _022E8BF4 ; =ov29_022E86A4
	add r0, r4, #0x14
	str ip, [sp]
	bl AssignTopScreenHandlers
_022E89DC:
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldrsh r1, [r4, #0x10]
	ldr r0, [r0]
	strh r1, [r0, #8]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _022E8A20
	ldr r0, _022E8BF8 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B3D4
	ldr r0, _022E8BF8 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B330
	ldr r0, [r4, #0x14]
	blx r0
_022E8A20:
	mov r1, #0
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	str r1, [r5, #0xc]
	ldr r2, [r0]
	ldrb r1, [r2, #0x2c]
	cmp r1, #0
	movne r0, #3
	strne r0, [r2, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8A80:
	ldrb r1, [r5, #0x2c]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r5, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8AC8:
	bl ov29_022E86E4
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldreq r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	moveq r1, #5
	ldreq r0, [r0]
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B00:
	bl ov29_022E86E4
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	strb r1, [r2, #2]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [r1, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	mov r1, #0x4000
	mov r2, #1
	bl StartFadeDungeonWrapper
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B5C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E8B78
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_022E8B78:
	bl FreeTopScreen
	ldr r0, _022E8BA0 ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x2b]
	cmp r0, #0
	movne r0, #1
	strne r0, [r1, #4]
	moveq r0, #2
	streq r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8BA0: .word TOP_SCREEN_STATUS_PTR
_022E8BA4: .word ov29_022E84B0
_022E8BA8: .word ov29_022E840C
_022E8BAC: .word ov29_022E847C
_022E8BB0: .word FreeTeamStatsWrapper
_022E8BB4: .word InitializeTeamStats
_022E8BB8: .word UpdateTeamStatsWrapper
_022E8BBC: .word ov29_022E81C8
_022E8BC0: .word ov29_022E8588
_022E8BC4: .word ov29_022E8500
_022E8BC8: .word ov29_022E854C
_022E8BCC: .word ov29_022E80D0
_022E8BD0: .word ov29_022E7F94
_022E8BD4: .word ov29_022E8018
_022E8BD8: .word ov29_022E8054
_022E8BDC: .word ov29_022E8630
_022E8BE0: .word ov29_022E85A8
_022E8BE4: .word ov29_022E85F4
_022E8BE8: .word ov29_022E86A8
_022E8BEC: .word ov29_022E8650
_022E8BF0: .word ov29_022E869C
_022E8BF4: .word ov29_022E86A4
_022E8BF8: .word ov29_0235352C
	arm_func_end HandleTopScreenFades

	arm_func_start ov29_022E8BFC
ov29_022E8BFC: ; 0x022E8BFC
	ldr r1, _022E8C0C ; =TOP_SCREEN_STATUS_PTR
	ldr r1, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E8C0C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8BFC

	arm_func_start ov29_022E8C10
ov29_022E8C10: ; 0x022E8C10
	stmdb sp!, {r3, lr}
	ldr r0, _022E8C48 ; =TOP_SCREEN_STATUS_PTR
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r2, #0x2a]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x14
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8C48: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8C10

	arm_func_start FreeTopScreen
FreeTopScreen: ; 0x022E8C4C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8CA4 ; =TOP_SCREEN_STATUS_PTR
	ldr r4, [r0]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _022E8C98
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	blx r0
	movs r5, r0
	beq _022E8C9C
	mov r1, #0
	mov r2, r1
	mov r3, r1
	add r0, r4, #0x14
	str r1, [sp]
	bl AssignTopScreenHandlers
	b _022E8C9C
_022E8C98:
	mov r5, #1
_022E8C9C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8CA4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end FreeTopScreen

	arm_func_start ov29_022E8CA8
ov29_022E8CA8: ; 0x022E8CA8
	ldr r1, _022E8CE4 ; =TOP_SCREEN_STATUS_PTR
	ldr r3, [r1]
	ldrsh r2, [r3, #8]
	cmp r2, r0
	ldrne r2, [r3, #0xc]
	cmpne r2, #1
	bxeq lr
	mov r2, #1
	str r2, [r3, #0xc]
	ldr r3, [r1]
	mov r2, #0
	strh r0, [r3, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x28]
	bx lr
	.align 2, 0
_022E8CE4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8CA8

	arm_func_start ov29_022E8CE8
ov29_022E8CE8: ; 0x022E8CE8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	mov sb, #0
	ldr fp, _022E8E54 ; =0x000003E7
	mov r8, sb
_022E8CFC:
	ldr r0, _022E8E58 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	cmp r0, #0
	moveq r0, #0
	beq _022E8D30
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022E8D30:
	cmp r0, #0
	beq _022E8DE4
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	ldr r7, [r6, #0xb4]
	ldr r0, [r0]
	add r5, r0, #0xb8
	mov r0, #0x5c
	smulbb r4, sb, r0
#ifdef JAPAN
	ldrb r0, [r7, #0x161]
#else
	ldrb r0, [r7, #0x165]
#endif
	cmp r0, #0
	bne _022E8DE4
	add r0, sp, #0x14
	mov r1, r7
	mov r2, #0
	bl ov29_0230027C
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	add sl, r1, r0
	cmp sl, fp
	mov r0, r6
	movgt sl, fp
	bl GetIdleAnimationId
	ldrb r3, [r7, #0xa]
	mov r1, sl, lsl #0x10
	mov r1, r1, asr #0x10
	str r3, [sp]
	ldrsh r3, [r7, #0x10]
	add r2, sp, #0x14
	str r3, [sp, #4]
	str r1, [sp, #8]
	ldrsh r1, [r6, #0xa8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, [r7, #0xb0]
	ldrsh r3, [r7, #4]
	mov r1, r1, lsl #0x10
	add r0, r5, r4
	mov r1, r1, asr #0x10
	bl ov10_022C1DE0
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022E8DE4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022E8CFC
	mov r0, #0x5c
	smulbb r4, sb, r0
	mov r3, #0
	ldr r1, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	b _022E8E24
_022E8E0C:
	ldr r2, [r1]
	add r0, sb, #1
	add r2, r4, r2
	mov r0, r0, lsl #0x10
	strb r3, [r2, #0xb8]
	mov sb, r0, asr #0x10
_022E8E24:
	cmp sb, #4
	blt _022E8E0C
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov29_022DC684
	ldr r0, _022E8E5C ; =TOP_SCREEN_STATUS_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x228]
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E8E54: .word 0x000003E7
_022E8E58: .word DUNGEON_PTR
_022E8E5C: .word TOP_SCREEN_STATUS_PTR
	arm_func_end ov29_022E8CE8

	arm_func_start ov29_022E8E60
ov29_022E8E60: ; 0x022E8E60
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022E8E90 ; =0x00003FCB
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_022E8E90: .word 0x00003FCD
#elif defined(JAPAN)
_022E8E90: .word 0x000049CE
#else
_022E8E90: .word 0x00003FCB
#endif
	arm_func_end ov29_022E8E60

	arm_func_start ov29_022E8E94
ov29_022E8E94: ; 0x022E8E94
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _022E8F1C ; =ov29_02353558
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _022E8F14
	mov r0, #0x54
	mov r1, #8
	bl MemAlloc
	ldr r2, _022E8F1C ; =ov29_02353558
	mov r1, #0x54
	str r0, [r2]
	bl MemZero
	ldr r0, _022E8F20 ; =ov29_023515F4
	add ip, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _022E8F24 ; =ov29_022E8E60
	mov r0, ip
	bl CreateTextBox
	ldr r1, _022E8F1C ; =ov29_02353558
	ldr r2, [r1]
	strb r0, [r2]
	ldr r0, [r1]
	add r0, r0, #4
	bl InitPreprocessorArgs
	ldr r0, _022E8F1C ; =ov29_02353558
	mov r2, #0x10000
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x50]
_022E8F14:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F1C: .word ov29_02353558
_022E8F20: .word ov29_023515F4
_022E8F24: .word ov29_022E8E60
	arm_func_end ov29_022E8E94

	arm_func_start ov29_022E8F28
ov29_022E8F28: ; 0x022E8F28
	stmdb sp!, {r3, lr}
	ldr r0, _022E8F74 ; =ov29_02353558
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseTextBox2
	ldr r0, _022E8F74 ; =ov29_02353558
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E8F74 ; =ov29_02353558
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F74: .word ov29_02353558
	arm_func_end ov29_022E8F28

	arm_func_start ov29_022E8F78
ov29_022E8F78: ; 0x022E8F78
	stmdb sp!, {r4, lr}
	ldrb r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r0]
	ldr r1, _022E8FC4 ; =ov29_02353558
	ldr r0, _022E8FC8 ; =0x00003FCB
	ldr r1, [r1]
	ldrsb r4, [r1]
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8FC4: .word ov29_02353558
#if defined(EUROPE)
_022E8FC8: .word 0x00003FCD
#elif defined(JAPAN)
_022E8FC8: .word 0x000049CE
#else
_022E8FC8: .word 0x00003FCB
#endif
	arm_func_end ov29_022E8F78

	arm_func_start ov29_022E8FCC
ov29_022E8FCC: ; 0x022E8FCC
	stmdb sp!, {r3, lr}
	ldr r0, _022E8FF4 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x700
	ldrsb r0, [r0, #0x98]
	ldrb r1, [r1, #0x748]
	bl ov29_0234F25C
	bl ov29_0234F278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8FF4: .word DUNGEON_PTR
	arm_func_end ov29_022E8FCC

	arm_func_start ov29_022E8FF8
ov29_022E8FF8: ; 0x022E8FF8
	stmdb sp!, {r3, lr}
	bl ov29_0234F2B8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8FF8

	arm_func_start ov29_022E9008
ov29_022E9008: ; 0x022E9008
	ldr ip, _022E9010 ; =ov29_0234F290
	bx ip
	.align 2, 0
_022E9010: .word ov29_0234F290
	arm_func_end ov29_022E9008

	arm_func_start ov29_022E9014
ov29_022E9014: ; 0x022E9014
	ldrb r0, [r0]
	cmp r0, #0
	bx lr
	arm_func_end ov29_022E9014
