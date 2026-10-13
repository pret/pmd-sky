	.include "asm/macros.inc"
	.include "overlay_29_022DEBA4.inc"

	.text

	arm_func_start ov29_022DEBA4
ov29_022DEBA4: ; 0x022DEBA4
	ldr ip, _022DEBAC ; =ov29_022DEADC
	bx ip
	.align 2, 0
_022DEBAC: .word ov29_022DEADC
	arm_func_end ov29_022DEBA4

	arm_func_start ov29_022DEBB0
ov29_022DEBB0: ; 0x022DEBB0
	ldr ip, _022DEBB8 ; =ov29_022DEB40
	bx ip
	.align 2, 0
_022DEBB8: .word ov29_022DEB40
	arm_func_end ov29_022DEBB0

	arm_func_start ov29_022DEBBC
ov29_022DEBBC: ; 0x022DEBBC
#ifdef JAPAN
#define OV29_022DEBBC_OFFSET -0xA4
#else
#define OV29_022DEBBC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetHiddenFloorField
	mov r4, r0
	mov r0, #0
	bl SetForcedLossReason
	ldr r3, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r3]
	sub r0, r1, #1
	strb r1, [r2, #5]
	ldr r2, [r3]
	mov ip, #1
	strb r1, [r2, #6]
	ldr r2, [r3]
	strb r1, [r2, #0xc]
	ldr r2, [r3]
	strb r1, [r2, #7]
	ldr r2, [r3]
	strb r1, [r2, #0xa]
	ldr r2, [r3]
	strb r1, [r2, #0x11]
	ldr r2, [r3]
	str r0, [r2, #0x614]
	ldr r2, [r3]
	strb r1, [r2, #0xb]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xd8]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xda]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xdc]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xde]
	ldr r0, [r3]
	strb r1, [r0, #0xd]
	ldr r0, [r3]
	strb ip, [r0, #0xf]
	ldr r0, [r3]
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldrb r0, [r0, #0x748]
	bl IsIqEnabled
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	ldr r2, [r1]
	strb r0, [r2, #0x12]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl IsTrapInvisibleWhenAttacking
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #0x13]
	ldr r0, [r1]
	add r0, r0, #0x2c000
	strb r2, [r0, #0xb10 + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	strb r2, [r0, #8]
	ldr r0, [r1]
	str r2, [r0, #0x18]
	bl ov29_02349658
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl SetHiddenStairsField
	bl ov29_02349188
	ldr r2, _022DEF2C ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r2]
	strb r0, [r1, #0x799]
	ldr r1, [r2]
	str r0, [r1, #0x7bc]
	ldr r1, [r2]
	str r0, [r1, #0x7c0]
	ldr r1, [r2]
	str r0, [r1, #0x7c4]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	strb r0, [r1, #0x790]
	ldr r1, [r2]
	strb r0, [r1, #0x791]
	bl SetUnkMusicFlag
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	ldr r5, _022DEF30 ; =0x000003E7
	strb r1, [r2, #0x78f]
	ldr r2, [r0]
	mov r3, #0x63
	strb r1, [r2, #0x78d]
	ldr r2, [r0]
	strb r1, [r2, #0x793]
	ldr r2, [r0]
	strb r1, [r2, #0x794]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r5, [r2, #0x96]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa4]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa6]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r1, [r2, #0x86]
	ldr r2, [r0]
	add r2, r2, #0xc000
	strb r1, [r2, #0xd38 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd4 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b5 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd6 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6c4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strb r2, [r1, #0xda + OV29_022DEBBC_OFFSET]
	ldr r1, [r0]
	ldrb r0, [r1, #0x798]
	cmp r0, #1
	bhi _022DEEA4
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x4c]
	bl GetDungeonMode
	sub r0, r0, #2
	cmp r0, #1
	bhi _022DEE38
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	cmp r2, #0
	ldrne r1, _022DEF34 ; =FIXED_ROOM_REVISIT_OVERRIDES
	ldrneb r1, [r1, r2]
	cmpne r1, #0
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	cmp r1, #0xb3
	moveq r1, #0xb7
	streqh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
_022DEE38:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0x7d
	bne _022DEE78
	mov r0, #0
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	beq _022DEEA4
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0x2a
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	b _022DEEA4
_022DEE78:
	cmp r0, #0x87
	bne _022DEEA4
	mov r0, #0
	mov r1, #0xf
	bl LoadScriptVariableValue
	cmp r0, #0
	ldrne r0, _022DEF2C ; =DUNGEON_PTR
	movne r1, #0x2b
	ldrne r0, [r0]
	addne r0, r0, #0x4000
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEEA4:
	bl FillMissionDestinationInfo
	cmp r4, #1
	bne _022DEF08
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0x70
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	beq _022DEEF0
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc4
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEEF0:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc5
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEF08:
	cmp r4, #2
	ldreq r0, _022DEF2C ; =DUNGEON_PTR
	moveq r1, #0x71
	ldreq r0, [r0]
	addeq r0, r0, #0x4000
	streqb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEF20:
	mov r0, #0
	bl SetHiddenFloorField
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DEF2C: .word DUNGEON_PTR
_022DEF30: .word 0x000003E7
_022DEF34: .word FIXED_ROOM_REVISIT_OVERRIDES
	arm_func_end ov29_022DEBBC

