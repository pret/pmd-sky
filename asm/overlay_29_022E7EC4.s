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
	bl DungeonChangeTopScreenType
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

	arm_func_start InitDungeonControlsMenuWithBg
InitDungeonControlsMenuWithBg: ; 0x022E8500
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
	bl InitDungeonControlsMenu
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8548: .word TOP_SCREEN_STATUS_PTR
	arm_func_end InitDungeonControlsMenuWithBg

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

	arm_func_start FreeDungeonControlsMenuWithBg
FreeDungeonControlsMenuWithBg: ; 0x022E8588
	stmdb sp!, {r3, lr}
	ldr r0, _022E85A4 ; =TOP_SCREEN_STATUS_PTR
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl FreeDungeonControlsMenu
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E85A4: .word TOP_SCREEN_STATUS_PTR
	arm_func_end FreeDungeonControlsMenuWithBg

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
