	.include "asm/macros.inc"
	.include "main_0200C4CC.inc"

	.text

	arm_func_start sub_0200C4CC
sub_0200C4CC: ; 0x0200C4CC
	stmdb sp!, {r4, lr}
	ldr lr, _0200C4F8 ; =_02094C18
	mov r4, r0
	mov ip, #0xe
_0200C4DC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0200C4DC
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200C4F8: .word _02094C18
	arm_func_end sub_0200C4CC

; https://decomp.me/scratch/28S9i
	arm_func_start GetDungeonResultMsg
GetDungeonResultMsg: ; 0x0200C4FC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x5c
	ldr ip, _0200C5A8 ; =0x00000233
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, ip
	bge _0200C570
	mov r1, r0, lsl #0x10
	add r0, sp, #4
	mov r1, r1, lsr #0x10
	bl InitMoveCheckId
	mov r0, #0
	bl GetDungeonResultString
	add r1, sp, #4
	mov r2, #0
	bl FormatMoveString
	ldrh r1, [sp, #8]
	ldr r0, _0200C5AC ; =0x000009CB
	str r1, [sp, #0x1c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #0xc
	mov r1, r5
	mov r0, r6
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C5A0
_0200C570:
	rsb r1, ip, #0
	add r1, r0, r1
	ldr r0, _0200C5B0 ; =_0209E7A6
	mov r1, r1, lsl #2
	ldrh r0, [r0, r1]
	bl StringFromId
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C5A0:
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200C5A8: .word 0x00000233
#ifdef JAPAN
_0200C5AC: .word 0x000023B6
#else
_0200C5AC: .word 0x000009CB
#endif
_0200C5B0: .word _0209E7A6
	arm_func_end GetDungeonResultMsg

	arm_func_start sub_0200C5B4
sub_0200C5B4: ; 0x0200C5B4
	ldr r1, _0200C5D4 ; =0x00000233
	cmp r0, r1
	movlt r0, #1
	rsbge r1, r1, #0
	ldrge r2, _0200C5D8 ; =DUNGEON_RETURN_STATUS_TABLE
	addge r0, r0, r1
	ldrgeb r0, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_0200C5D4: .word 0x00000233
_0200C5D8: .word DUNGEON_RETURN_STATUS_TABLE
	arm_func_end sub_0200C5B4

	arm_func_start sub_0200C5DC
sub_0200C5DC: ; 0x0200C5DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r5, r1
	mov r6, r0
	bl GetWindow
	ldrb r1, [r5, #0x5c]
	ldrb r4, [r0, #6]
	cmp r1, #0x3d
	moveq r1, #0x3c
	orr r0, r1, #0x40000
	str r0, [sp, #0x14]
	ldrb r1, [r5, #0x5d]
	ldr r0, _0200CA18 ; =0x000009CC
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x10
	bl DrawTextInWindow
	add r1, r5, #0x1e
	add r0, r5, #0x3c
	str r1, [sp, #0x40]
	str r5, [sp, #0x3c]
	str r0, [sp, #0x44]
	ldrsh r0, [r5, #0x5a]
	bl sub_0200C5B4
	cmp r0, #0
	beq _0200C698
	ldr r0, _0200CA1C ; =0x000009CD
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	b _0200C6BC
_0200C698:
	ldr r0, _0200CA20 ; =0x000009CE
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
_0200C6BC:
	add r0, sp, #0x54
	bl sub_020265A8
	rsb r0, r0, r4, lsl #3
	add r1, r0, r0, lsr #31
	add r3, sp, #0x54
	mov r0, r6
	mov r1, r1, asr #1
	mov r2, #0x1a
	bl DrawTextInWindow
	ldrsh r0, [r5, #0x5a]
	add r1, sp, #0x54
	add r3, sp, #4
	mov r2, #0x400
	bl GetDungeonResultMsg
	add r0, sp, #0x54
	bl sub_020265A8
	rsb r0, r0, r4, lsl #3
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	mov r0, r6
	mov r2, #0x24
	add r3, sp, #0x54
	bl DrawTextInWindow
	ldr r1, [r5, #0x64]
	ldr r0, _0200CA24 ; =0x000009CF
	str r1, [sp, #0x28]
	ldrb r1, [r5, #0x6e]
	str r1, [sp, #0x2c]
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, #0x34
	add r3, sp, #0x54
	bl DrawTextInWindow
	ldrsh r1, [r5, #0x68]
#ifdef JAPAN
	ldr r0, _0200CA28 ; =0x000023BB
#else
	mov r0, #0x9d0
#endif
	str r1, [sp, #0x28]
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, #0x3e
	add r3, sp, #0x54
	bl DrawTextInWindow
#ifdef JAPAN
	ldrb r1, [r5, #0x6a]
	str r1, [sp, #0x28]
	ldrb r0, [r5, #0x6c]
	str r0, [sp, #0x2c]
	ldrb r0, [r5, #0xa9]
	cmp r0, #0
	beq _0200C7EC
	add r1, r1, r0
	mov r0, #0x23c0
#else
	ldrb r2, [r5, #0x6a]
	str r2, [sp, #0x28]
	ldrb r0, [r5, #0x6c]
	str r0, [sp, #0x2c]
	ldrb r1, [r5, #0xa9]
	cmp r1, #0
	beq _0200C7EC
	ldr r0, _0200CA28 ; =0x000009D5
	add r1, r2, r1
#endif
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C810
_0200C7EC:
	ldr r0, _0200CA2C ; =0x000009D1
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C810:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x48
	bl DrawTextInWindow
	ldrb r2, [r5, #0xab]
	cmp r2, #0
	beq _0200C864
	ldr r1, [sp, #0x2c]
	ldr r0, _0200CA30 ; =0x000009D6
	add r1, r1, r2
	str r1, [sp, #0x2c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C888
_0200C864:
	ldr r0, _0200CA34 ; =0x000009D2
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C888:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x48
	bl DrawTextInWindow
	ldrb r2, [r5, #0x6b]
	str r2, [sp, #0x28]
	ldrb r0, [r5, #0x6d]
	str r0, [sp, #0x2c]
	ldrb r1, [r5, #0xaa]
	cmp r1, #0
	beq _0200C8E8
	ldr r0, _0200CA38 ; =0x000009D7
	add r1, r2, r1
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C90C
_0200C8E8:
	ldr r0, _0200CA3C ; =0x000009D3
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C90C:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x52
	bl DrawTextInWindow
	ldrb r2, [r5, #0xac]
	cmp r2, #0
	beq _0200C960
	ldr r1, [sp, #0x2c]
	ldr r0, _0200CA40 ; =0x000009D8
	add r1, r1, r2
	str r1, [sp, #0x2c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C984
_0200C960:
	ldr r0, _0200CA44 ; =0x000009D4
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C984:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x52
	bl DrawTextInWindow
	ldrb r0, [r5, #0x5e]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200C9EC
	bl AllocateTemp1024ByteBufferFromPool
	ldr r2, _0200CA48 ; =_02094C0C
	add r1, r5, #0x5e
	str r0, [sp, #0x3c]
	bl sub_0200D670
	ldr r0, _0200CA4C ; =0x000009DA
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	b _0200C9F8
_0200C9EC:
	ldr r1, _0200CA50 ; =0x000009D9
	add r0, sp, #0x54
	bl GetStringFromFileVeneer
_0200C9F8:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x62
	bl DrawTextInWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_0200C5DC_OFFSET 0x19EB
#else
#define SUB_0200C5DC_OFFSET 0
#endif
_0200CA18: .word 0x000009CC + SUB_0200C5DC_OFFSET
_0200CA1C: .word 0x000009CD + SUB_0200C5DC_OFFSET
_0200CA20: .word 0x000009CE + SUB_0200C5DC_OFFSET
_0200CA24: .word 0x000009CF + SUB_0200C5DC_OFFSET
#ifdef JAPAN
_0200CA28: .word 0x000023BB
#else
_0200CA28: .word 0x000009D5
#endif
_0200CA2C: .word 0x000009D1 + SUB_0200C5DC_OFFSET
_0200CA30: .word 0x000009D6 + SUB_0200C5DC_OFFSET
_0200CA34: .word 0x000009D2 + SUB_0200C5DC_OFFSET
_0200CA38: .word 0x000009D7 + SUB_0200C5DC_OFFSET
_0200CA3C: .word 0x000009D3 + SUB_0200C5DC_OFFSET
_0200CA40: .word 0x000009D8 + SUB_0200C5DC_OFFSET
_0200CA44: .word 0x000009D4 + SUB_0200C5DC_OFFSET
_0200CA48: .word _02094C0C
_0200CA4C: .word 0x000009DA + SUB_0200C5DC_OFFSET
_0200CA50: .word 0x000009D9 + SUB_0200C5DC_OFFSET
	arm_func_end sub_0200C5DC

	arm_func_start GetDamageSource
GetDamageSource: ; 0x0200CA54
	stmdb sp!, {r3, lr}
	cmp r1, #0
	beq _0200CA78
	mov r0, r1
	bl GetItemCategoryVeneer
	cmp r0, #9
	ldreq r0, _0200CA84 ; =0x00000262
	ldrne r0, _0200CA88 ; =0x00000263
	ldmia sp!, {r3, pc}
_0200CA78:
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200CA84: .word 0x00000262
_0200CA88: .word 0x00000263
	arm_func_end GetDamageSource

	arm_func_start sub_0200CA8C
sub_0200CA8C: ; 0x0200CA8C
	stmdb sp!, {r3, lr}
	ldr r1, _0200CAB4 ; =BAG_ITEMS
	ldr r0, _0200CAB8 ; =BAG_ITEMS_PTR_MIRROR
	str r1, [r0]
	bl LoadItemPspi2n
	bl SetActiveInventoryToMain
	bl sub_0200FD38
	bl sub_02010590
	bl sub_02011AB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200CAB4: .word BAG_ITEMS
_0200CAB8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200CA8C

	arm_func_start sub_0200CABC
sub_0200CABC: ; 0x0200CABC
	stmdb sp!, {r3, lr}
	bl AllInventoriesZInit
	bl sub_0200FD3C
	bl AllKecleonShopsZInit
	bl sub_02011AB8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200CABC

	arm_func_start sub_0200CAD4
sub_0200CAD4: ; 0x0200CAD4
	stmdb sp!, {r3, lr}
	bl SpecialEpisodeInventoryZInit
	bl SpecialEpisodeKecleonShopZInit
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200CAD4

	arm_func_start sub_0200CAE4
sub_0200CAE4: ; 0x0200CAE4
	ldr ip, _0200CAEC ; =RescueInventoryZInit
	bx ip
	.align 2, 0
_0200CAEC: .word RescueInventoryZInit
	arm_func_end sub_0200CAE4
