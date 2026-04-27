	.include "asm/macros.inc"
	.include "main_02029A68.inc"

	.text

	arm_func_start sub_02029A68
sub_02029A68: ; 0x02029A68
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r2, r3
	beq _02029AAC
	mov r3, #0
	strb r3, [r1, #4]
	ldr r2, [r1]
	stmia r0, {r2, r3}
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
	b _02029AE8
_02029AAC:
	cmp r3, #0
	ldrneb r2, [r1, #4]
	cmpne r2, #0
	beq _02029AE8
	mov r2, #0
	strb r2, [r1, #4]
	str r2, [r0, #4]
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
_02029AE8:
	ldrb r2, [r1, #0x19]
	strb r2, [r0, #0x19]
	ldrb r2, [r1, #0x18]
	strb r2, [r0, #0x18]
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x20]
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02029A68

	arm_func_start sub_02029B0C
sub_02029B0C: ; 0x02029B0C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02029EB0
	cmp r0, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #1
	strne r0, [r4, #4]
	ldr r0, [r4, #4]
	tst r0, #0x10
	bne _02029EB0
	ldr r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02029EB0
_02029B50: ; jump table
	b _02029EB0 ; case 0
	b _02029B70 ; case 1
	b _02029B70 ; case 2
	b _02029BBC ; case 3
	b _02029C08 ; case 4
	b _02029C64 ; case 5
	b _02029D38 ; case 6
	b _02029D94 ; case 7
_02029B70:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BA4
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BA4:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BBC:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C08:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029C44
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C44:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C64:
	ldr r1, _02029EC0 ; =0x0000FFFF
	mov ip, #0
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0x18
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	add r1, sp, #0x18
	cmp r0, #0
	bne _02029CF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029CF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029D38:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029D74
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D74:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D94:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029DD0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029DEC
_02029DD0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
_02029DEC:
	mov ip, #0
	ldr r1, _02029EC0 ; =0x0000FFFF
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	ldrb r0, [r4, #0x26]
	add r1, sp, #0xc
	cmp r0, #0
	bne _02029E6C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029E6C:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl FillOamAttributeInfo
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
_02029EB0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02029EB8: .word CURSOR_ANIMATION_CONTROL
_02029EBC: .word CURSOR_16_ANIMATION_CONTROL
_02029EC0: .word 0x0000FFFF
	arm_func_end sub_02029B0C

	arm_func_start sub_02029EC4
sub_02029EC4: ; 0x02029EC4
	bx lr
	arm_func_end sub_02029EC4

	arm_func_start Arm9LoadUnkFieldNa0x2029EC8
Arm9LoadUnkFieldNa0x2029EC8: ; 0x02029EC8
	ldr r1, _02029ED4 ; =_022AAC68
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02029ED4: .word _022AAC68
	arm_func_end Arm9LoadUnkFieldNa0x2029EC8

	arm_func_start Arm9StoreUnkFieldNa0x2029ED8
Arm9StoreUnkFieldNa0x2029ED8: ; 0x02029ED8
	ldr r2, _02029EE4 ; =_022AAC68
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02029EE4: .word _022AAC68
	arm_func_end Arm9StoreUnkFieldNa0x2029ED8

	arm_func_start LoadAlert
LoadAlert: ; 0x02029EE8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029F74 ; =WAN_TABLE
	ldr r1, _02029F78 ; =_0209AE20
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029F7C ; =ALERT_SPRITE_ID
	strh r0, [r1]
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02029F7C ; =ALERT_SPRITE_ID
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r1, #0
	mov r0, #0xd
	stmia sp, {r0, r1}
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	mov r2, r1
	mov r3, #0x3e4
	str r1, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_02029FBC
	ldr r0, _02029F84 ; =_020AFDA0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029F74: .word WAN_TABLE
_02029F78: .word _0209AE20
_02029F7C: .word ALERT_SPRITE_ID
_02029F80: .word ALERT_ANIMATION_CONTROL
_02029F84: .word _020AFDA0
	arm_func_end LoadAlert

	arm_func_start sub_02029F88
sub_02029F88: ; 0x02029F88
	ldr ip, _02029FB4 ; =ALERT_ANIMATION_CONTROL
	ldr r3, _02029FB8 ; =_020AFDA0
	strh r0, [ip, #0x1c]
	strh r1, [ip, #0x1e]
	ldrh r1, [ip, #2]
	mov r0, #0
	str r0, [r3, #4]
	bic r0, r1, #2
	strh r0, [ip, #2]
	strb r2, [r3]
	bx lr
	.align 2, 0
_02029FB4: .word ALERT_ANIMATION_CONTROL
_02029FB8: .word _020AFDA0
	arm_func_end sub_02029F88

	arm_func_start sub_02029FBC
sub_02029FBC: ; 0x02029FBC
	ldr r1, _02029FE0 ; =ALERT_ANIMATION_CONTROL
	ldr r0, _02029FE4 ; =_020AFDA0
	ldrh r3, [r1, #2]
	mov r2, #0
	str r2, [r0, #4]
	orr r3, r3, #2
	strh r3, [r1, #2]
	strb r2, [r0]
	bx lr
	.align 2, 0
_02029FE0: .word ALERT_ANIMATION_CONTROL
_02029FE4: .word _020AFDA0
	arm_func_end sub_02029FBC

	arm_func_start sub_02029FE8
sub_02029FE8: ; 0x02029FE8
	stmdb sp!, {r3, lr}
	ldr r0, _0202A034 ; =ALERT_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldr r1, _0202A038 ; =_020AFDA0
	ldrb r2, [r1]
	cmp r2, #0
	beq _0202A02C
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	ldr r1, [r1, #4]
	tst r1, #0x10
	ldmneia sp!, {r3, pc}
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
_0202A02C:
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A034: .word ALERT_ANIMATION_CONTROL
_0202A038: .word _020AFDA0
	arm_func_end sub_02029FE8

	arm_func_start sub_0202A03C
sub_0202A03C: ; 0x0202A03C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020334A8
	mov r0, r5
	mov r1, r4
	bl sub_02033BC0
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A0A8
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A0A8
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A0A8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A03C

	arm_func_start sub_0202A0B0
sub_0202A0B0: ; 0x0202A0B0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020335A8
	mov r0, r5
	mov r1, r4
	bl sub_02034360
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A11C
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A11C
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A11C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A0B0

	arm_func_start sub_0202A124
sub_0202A124: ; 0x0202A124
	stmdb sp!, {r3, lr}
	ldr r0, _0202A144 ; =0x00000488
	mov r1, #0
	bl MemAlloc
	ldr r1, _0202A148 ; =_020AFDA8
	str r0, [r1]
	bl sub_0202A14C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A144: .word 0x00000488
_0202A148: .word _020AFDA8
	arm_func_end sub_0202A124

	arm_func_start sub_0202A14C
sub_0202A14C: ; 0x0202A14C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, #0
	ldr r8, _0202A1D0 ; =_020AFDA8
	mov r4, r5
	mov r7, #0x48
_0202A160:
	mul r6, r5, r7
	ldr r0, [r8]
	add r0, r0, r6
	add r0, r0, #4
	bl InitRender3dElement64
	ldr r0, [r8]
	mov ip, #4
	strb r4, [r0, r6]
	ldr sb, [r8]
	add lr, sb, r6
	add r6, lr, #0x244
_0202A18C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202A18C
	add r5, r5, #1
	ldmia lr, {r0, r1}
	stmia r6, {r0, r1}
	cmp r5, #8
	blo _0202A160
	add r0, sb, #0x200
	mov r2, #0
	ldr r1, _0202A1D0 ; =_020AFDA8
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r2, [r0, #0x84]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A1D0: .word _020AFDA8
	arm_func_end sub_0202A14C

	arm_func_start sub_0202A1D4
sub_0202A1D4: ; 0x0202A1D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0202A2A0 ; =_020AFDA8
	mov sb, r0
	ldr r0, [r4]
	mov r7, r2
	add r0, r0, #0x200
	mov r8, r1
	ldrh r1, [r0, #0x40]
	mov r6, r3
	mov r2, #1
	add r1, r1, #1
	strh r1, [r0, #0x40]
	ldr r0, [r4]
	ldr r5, [sp, #0x20]
	add r0, r0, #0x200
	ldrh r1, [r0, #0x40]
	cmp r1, #8
	movhs r1, #0
	strhsh r1, [r0, #0x40]
	ldr r0, _0202A2A0 ; =_020AFDA8
	mov r1, #0x48
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrh r0, [r0, #0x40]
	mul r1, r0, r1
	add r4, r3, r1
	add r0, r4, #4
	strb r2, [r3, r1]
	bl InitRender3dElement64
	mov r0, #2
	mov r3, r5
	strb r0, [r4, #0x40]
	add r2, r4, #0x30
	mov r1, #4
_0202A25C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _0202A25C
	ldrb r2, [r5, #3]
	mov r1, #8
	ldrsh r0, [sp, #0x24]
	strb r2, [r4, #0x33]
	strh sb, [r4, #4]
	strh r8, [r4, #6]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r1, [r4, #0x2e]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r0, [r4, #0x44]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A2A0: .word _020AFDA8
	arm_func_end sub_0202A1D4

	arm_func_start sub_0202A2A4
sub_0202A2A4: ; 0x0202A2A4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrsh ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_0202A1D4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A2A4

	arm_func_start sub_0202A2C8
sub_0202A2C8: ; 0x0202A2C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0202A384 ; =_020AFDA8
	cmp r0, #0
	ldr ip, [r1]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, ip, #0x400
	mov lr, #0
	strh lr, [r0, #0x84]
_0202A2E8:
	ldr r0, _0202A384 ; =_020AFDA8
	ldr r4, [r0]
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	cmp r1, #8
	ldrneb r0, [ip]
	cmpne r0, #0
	beq _0202A368
	mov r0, #0x48
	mla r0, r1, r0, r4
	mov r7, ip
	add r6, r0, #0x244
	mov r5, #4
_0202A31C:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A31C
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	add r1, r1, #1
	strh r1, [r0, #0x84]
	ldrb r1, [ip, #0x33]
	ldrsh r0, [ip, #0x44]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	movle r0, #0
	strleb r0, [ip]
	strgtb r0, [ip, #0x33]
_0202A368:
	add r0, lr, #1
	mov r0, r0, lsl #0x10
	mov lr, r0, asr #0x10
	cmp lr, #8
	add ip, ip, #0x48
	blt _0202A2E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202A384: .word _020AFDA8
	arm_func_end sub_0202A2C8
