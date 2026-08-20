	.include "asm/macros.inc"
	.include "overlay_29_022E86A4.inc"

	.text

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
	bl DungeonChangeTopScreenType
	ldmia sp!, {r3, pc}
_022E8724:
	cmp r0, #2
	bne _022E8738
	mov r0, #0
	bl DungeonChangeTopScreenType
	ldmia sp!, {r3, pc}
_022E8738:
	cmp r0, #0
	bne _022E874C
	mov r0, #2
	bl DungeonChangeTopScreenType
	ldmia sp!, {r3, pc}
_022E874C:
	cmp r0, #4
	bne _022E8760
	mov r0, #4
	bl DungeonChangeTopScreenType
	ldmia sp!, {r3, pc}
_022E8760:
	bl ov29_022E81F8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8708

	arm_func_start ov29_022E8768
ov29_022E8768: ; 0x022E8768
	ldr ip, _022E8774 ; =DungeonChangeTopScreenType
	mov r0, #5
	bx ip
	.align 2, 0
_022E8774: .word DungeonChangeTopScreenType
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
	ldr ip, _022E8BC0 ; =FreeDungeonControlsMenuWithBg
	ldr r1, _022E8BC4 ; =InitDungeonControlsMenuWithBg
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
_022E8BC0: .word FreeDungeonControlsMenuWithBg
_022E8BC4: .word InitDungeonControlsMenuWithBg
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

	arm_func_start DungeonChangeTopScreenType
DungeonChangeTopScreenType: ; 0x022E8CA8
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
	arm_func_end DungeonChangeTopScreenType

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

	arm_func_start DrawDungeonControlsText
DrawDungeonControlsText: ; 0x022E8E60
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
	arm_func_end DrawDungeonControlsText

	arm_func_start InitDungeonControlsMenu
InitDungeonControlsMenu: ; 0x022E8E94
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _022E8F1C ; =DUNGEON_CONTROLS_MENU_PTR
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _022E8F14
	mov r0, #0x54
	mov r1, #8
	bl MemAlloc
	ldr r2, _022E8F1C ; =DUNGEON_CONTROLS_MENU_PTR
	mov r1, #0x54
	str r0, [r2]
	bl MemZero
	ldr r0, _022E8F20 ; =DUNGEON_CONTROLS_MENU_WINDOW_PARAMS
	add ip, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _022E8F24 ; =DrawDungeonControlsText
	mov r0, ip
	bl CreateTextBox
	ldr r1, _022E8F1C ; =DUNGEON_CONTROLS_MENU_PTR
	ldr r2, [r1]
	strb r0, [r2]
	ldr r0, [r1]
	add r0, r0, #4
	bl InitPreprocessorArgs
	ldr r0, _022E8F1C ; =DUNGEON_CONTROLS_MENU_PTR
	mov r2, #0x10000
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x50]
_022E8F14:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F1C: .word DUNGEON_CONTROLS_MENU_PTR
_022E8F20: .word DUNGEON_CONTROLS_MENU_WINDOW_PARAMS
_022E8F24: .word DrawDungeonControlsText
	arm_func_end InitDungeonControlsMenu

	arm_func_start FreeDungeonControlsMenu
FreeDungeonControlsMenu: ; 0x022E8F28
	stmdb sp!, {r3, lr}
	ldr r0, _022E8F74 ; =DUNGEON_CONTROLS_MENU_PTR
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseTextBox2
	ldr r0, _022E8F74 ; =DUNGEON_CONTROLS_MENU_PTR
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E8F74 ; =DUNGEON_CONTROLS_MENU_PTR
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F74: .word DUNGEON_CONTROLS_MENU_PTR
	arm_func_end FreeDungeonControlsMenu

	arm_func_start ov29_022E8F78
ov29_022E8F78: ; 0x022E8F78
	stmdb sp!, {r4, lr}
	ldrb r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r0]
	ldr r1, _022E8FC4 ; =DUNGEON_CONTROLS_MENU_PTR
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
_022E8FC4: .word DUNGEON_CONTROLS_MENU_PTR
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
