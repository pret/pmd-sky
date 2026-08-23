	.include "asm/macros.inc"
	.include "main_0201C000.inc"

	.text

	arm_func_start InitOamAdjustmentInfo
InitOamAdjustmentInfo: ; 0x0201C000
	ldr r2, _0201C024 ; =0x0000FFFF
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201C024: .word 0x0000FFFF
	arm_func_end InitOamAdjustmentInfo

	arm_func_start sub_0201C028
sub_0201C028: ; 0x0201C028
	strh r1, [r0]
	strh r2, [r0, #2]
	ldrh r1, [sp]
	strh r3, [r0, #4]
	ldrh r2, [sp, #4]
	strh r1, [r0, #6]
	ldrh r1, [sp, #8]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_0201C028

	arm_func_start InitAnimationControl
InitAnimationControl: ; 0x0201C050
	stmdb sp!, {r4, lr}
	mov r1, #0x7c
	mov r4, r0
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x68]
	str r1, [r4, #0x6c]
	strh r1, [r4, #0x70]
	mov r0, #0xff
	strh r1, [r4, #0x72]
	strb r0, [r4, #0x43]
	add r0, r0, #0xff00
	strh r0, [r4, #0x36]
	mov r0, #9
	strb r0, [r4, #0x40]
	add r0, r4, #0x10
	bl InitOamAdjustmentInfo
	ldrh r0, [r4, #2]
	bic r0, r0, #0x8000
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	orr r0, r0, #0x200
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControl

	arm_func_start InitAnimationControlWithSet__0201C0B0
InitAnimationControlWithSet__0201C0B0: ; 0x0201C0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0B0

	arm_func_start InitAnimationControlWithSet__0201C0CC
InitAnimationControlWithSet__0201C0CC: ; 0x0201C0CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0CC

	arm_func_start SetSpriteIdForAnimationControl
SetSpriteIdForAnimationControl: ; 0x0201C0E8
	strh r1, [r0, #0x70]
	ldrsh r2, [r0, #0x70]
	ldrsh r1, [r0, #0x72]
	cmp r2, r1
	strneh r2, [r0, #0x72]
	movne r1, #0xff
	strneb r1, [r0, #0x43]
	bx lr
	arm_func_end SetSpriteIdForAnimationControl

	arm_func_start sub_0201C108
sub_0201C108: ; 0x0201C108
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x70]
	cmp r0, #0
	bne _0201C124
	ldr r0, _0201C134 ; =_020996E0
	bl Debug_Print0
_0201C124:
	ldrh r0, [r4, #2]
	orr r0, r0, #0x8000
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201C134: .word _020996E0
	arm_func_end sub_0201C108

	arm_func_start sub_0201C138
sub_0201C138: ; 0x0201C138
	ldr ip, _0201C140 ; =InitAnimationControl
	bx ip
	.align 2, 0
_0201C140: .word InitAnimationControl
	arm_func_end sub_0201C138

	arm_func_start sub_0201C144
sub_0201C144: ; 0x0201C144
	stmdb sp!, {r3, lr}
	ldr r1, _0201C178 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201C178: .word _020AFC3C
	arm_func_end sub_0201C144

	arm_func_start SetAnimationForAnimationControlInternal
SetAnimationForAnimationControlInternal: ; 0x0201C17C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	ldmia r1, {ip, lr}
	mov r5, #0
	mov r4, r4, lsl #0x10
	strh r5, [r0]
	strh r5, [r0, #6]
	mov r4, r4, asr #0x10
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	mov r5, #1
	ldrb r4, [sp, #0x1c]
	strh r5, [r0, #4]
	ldrh r5, [r0]
	cmp r4, #0
	orr r4, r5, #0x8000
	strh r4, [r0]
	ldrneh r4, [r0]
	mov r5, #0
	orrne r4, r4, #0x1000
	strneh r4, [r0]
	ldr r4, [ip, #8]
	add r4, r4, r2, lsl #3
	ldrh r4, [r4, #4]
	cmp r3, r4
	strh r5, [r0, #0x20]
	movge r3, #0
	ldr r4, [sp, #0x10]
	strh r5, [r0, #0x22]
	strh r4, [r0, #0x32]
	sub r4, r5, #1
	strh r4, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	str r5, [r0, #0x28]
	str r5, [r0, #0x2c]
	strh r5, [r0, #0xc]
	strh r2, [r0, #0x76]
	strh r3, [r0, #0x78]
	ldr r4, [ip]
	cmp lr, #0
	str r4, [r0, #0x54]
	ldrne r5, [lr]
	cmp lr, #0
	str r5, [r0, #0x58]
	ldrne r4, [lr, #4]
	moveq r4, #0
	str r4, [r0, #0x5c]
	cmp lr, #0
	ldrnesh r4, [lr, #0xa]
	ldrb lr, [sp, #0x14]
	ldreqsh r4, [ip, #0x14]
	and r4, r4, #1
	strh r4, [r0, #0x60]
	ldr r4, [ip, #4]
	str r4, [r0, #0x50]
	ldrb r4, [sp, #0x20]
	strb lr, [r0, #0x41]
	strb r4, [r0, #0x7a]
	ldrb r1, [r1, #8]
	cmp r1, #1
	beq _0201C29C
	ldr r1, [ip, #8]
	ldr r1, [r1]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	b _0201C2C0
_0201C29C:
	ldrsh r1, [ip, #0xc]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	ldr r1, [r1, r2, lsl #3]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	add r1, r1, r2, lsl #3
_0201C2C0:
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x62]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetAnimationForAnimationControlInternal

	arm_func_start SetAnimationForAnimationControl
SetAnimationForAnimationControl: ; 0x0201C2CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldrsh r0, [r7, #0x70]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl SpriteTypeInWanTable
	cmp r0, #0
	beq _0201C304
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0201C348
_0201C304:
	mov r0, r7
	bl GetWanForAnimationControl
	ldrb r3, [sp, #0x28]
	str r4, [sp]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	ldrb r0, [sp, #0x30]
	str r2, [sp, #8]
	ldrb r4, [sp, #0x34]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r6
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C348:
	ldrsh r0, [r7, #0x70]
	mov r1, r6, lsl #0x10
	mov r1, r1, asr #0x10
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	mov r0, r7
	beq _0201C3A4
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r5
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C3A4:
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r3, r5
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
_0201C3E0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end SetAnimationForAnimationControl

	arm_func_start GetWanForAnimationControl
GetWanForAnimationControl: ; 0x0201C3E8
	ldr r1, [r0, #0x68]
	cmp r1, #0
	ldrne r0, [r1, #4]
	bxne lr
	ldr r1, _0201C414 ; =WAN_TABLE
	ldrsh r2, [r0, #0x70]
	ldr r1, [r1]
	mov r0, #0x38
	smlabb r0, r2, r0, r1
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0201C414: .word WAN_TABLE
	arm_func_end GetWanForAnimationControl

	arm_func_start SetAndPlayAnimationForAnimationControl
SetAndPlayAnimationForAnimationControl: ; 0x0201C418
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldrb r4, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	ldrb lr, [sp, #0x20]
	stmia sp, {r4, ip}
	ldrb ip, [sp, #0x24]
	str lr, [sp, #8]
	mov r4, r0
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetAndPlayAnimationForAnimationControl

	arm_func_start SwitchAnimationControlToNextFrame
SwitchAnimationControlToNextFrame: ; 0x0201C458
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201D1B0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x3a]
	cmp r0, #0
	blt _0201C4F4
	ldrh r0, [r4]
	tst r0, #0x4000
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xc]
	ldrsh r0, [r4, #4]
	add r0, r1, r0
	strh r0, [r4, #0xc]
	ldrsh r1, [r4, #0xa]
	cmp r1, #0
	beq _0201C4C0
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #0xa]
	ldrsh r0, [r4, #0xa]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
_0201C4C0:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	beq _0201C4E8
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, #6]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #6]
_0201C4E8:
	ldrsh r0, [r4, #6]
	cmp r0, #0
	ldmgtia sp!, {r4, pc}
_0201C4F4:
	ldr r0, [r4, #0x4c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C550
	ldrh r0, [r4]
	tst r0, #0x1000
	beq _0201C544
	ldrh r1, [r4, #0x62]
	ldr r2, [r4, #0x48]
	mov r0, #0xc
	mla r0, r1, r0, r2
	str r0, [r4, #0x4c]
	ldrsh r0, [r4, #8]
	cmp r0, #0
	beq _0201C550
	bl Rand16Bit
	ldrsh r1, [r4, #8]
	and r0, r1, r0
	strh r0, [r4, #0xa]
	b _0201C550
_0201C544:
	orr r0, r0, #0x2000
	strh r0, [r4]
	ldmia sp!, {r4, pc}
_0201C550:
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	ldmia sp!, {r4, pc}
	arm_func_end SwitchAnimationControlToNextFrame

	arm_func_start LoadAnimationFrameAndIncrementInAnimationControl
LoadAnimationFrameAndIncrementInAnimationControl: ; 0x0201C560
	ldrh r2, [r0]
	orr r2, r2, #0x800
	strh r2, [r0]
	ldrb r2, [r1]
	strh r2, [r0, #6]
	ldrsh r2, [r1, #2]
	strh r2, [r0, #0x3a]
	ldrsh r2, [r1, #4]
	strh r2, [r0, #0x20]
	ldrsh r2, [r1, #6]
	strh r2, [r0, #0x22]
	ldrsh r2, [r1, #8]
	strh r2, [r0, #0x24]
	ldrsh r2, [r1, #0xa]
	strh r2, [r0, #0x26]
	ldrb r2, [r1, #1]
	str r2, [r0, #0x28]
	ldrb r1, [r1, #1]
	ldr r2, [r0, #0x2c]
	orr r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x4c]
	add r1, r1, #0xc
	str r1, [r0, #0x4c]
	bx lr
	arm_func_end LoadAnimationFrameAndIncrementInAnimationControl

	arm_func_start DisplayAnimationControlCurrentFrame
DisplayAnimationControlCurrentFrame: ; 0x0201C5C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201CF40
	ldrsh r0, [r8, #0x3a]
	mov fp, #0
	cmp r0, #0
	bge _0201C618
	mov r0, r8
	bl SwitchAnimationControlToNextFrame
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, fp
	tst r0, #0xff
	beq _0201CF40
_0201C618:
	ldrsh r1, [r8, #0x3c]
	ldrsh r0, [r8, #0x3a]
	cmp r1, r0
	ldrh r0, [r8, #2]
	movne fp, #1
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201C640
	tst r0, #0x100
	movne fp, #1
_0201C640:
	ldrb r0, [r8, #0x7a]
	cmp r0, #4
	bhs _0201CEC8
	ldrsh r0, [r8, #0x70]
	bl SpriteTypeInWanTable
	cmp r0, #3
	bne _0201C928
	mov r0, r8
	bl GetWanForAnimationControl
	ldr r6, [r0]
	ldr r5, [r0, #4]
	ldr sl, [r6, #0x10]
	mov r0, #0
	ldr r3, [r5]
	mov r7, r0
	str r0, [sp, #0x44]
	ldr r0, [r5, #4]
	ldrsh r1, [r8, #0x3a]
	ldr r2, [r6]
	cmp sl, #0
	str r0, [sp, #0x48]
	ldr r4, [r3]
	ldr sb, [r2, r1, lsl #2]
	beq _0201C6CC
	ldrsh r0, [r8, #0x78]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldrh r0, [r8, #0xc]
	add r1, sl, r1, lsl #3
	ldr r1, [r1, #4]
	bl _s32_div_f
	ldr r0, [sp, #0x20]
	ldr r0, [sl, r0, lsl #3]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x44]
_0201C6CC:
	cmp r5, #0
	cmpne fp, #0
	beq _0201C7D8
	ldrh r0, [r8, #2]
	tst r0, #0x8000
	bne _0201C7D8
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x48]
	ldrsh r0, [r0, #6]
	strh r0, [sp, #0x8a]
	ldrsh r0, [r5, #0xa]
	cmp r0, #2
	bne _0201C72C
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #2
	smulbb r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	strh r1, [sp, #0x88]
	mov r5, r0, asr #2
	b _0201C79C
_0201C72C:
	cmp r0, #0
	bne _0201C754
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #0
	smulbb r0, r2, r0
	add r0, r0, r0, lsr #31
	strh r1, [sp, #0x88]
	mov r5, r0, asr #1
	b _0201C79C
_0201C754:
	cmp r0, #3
	bne _0201C774
	ldrsh r2, [r4, #4]
	ldrsh r1, [r4, #6]
	mov r0, #3
	strh r0, [sp, #0x88]
	smulbb r5, r2, r1
	b _0201C79C
_0201C774:
	cmp r0, #4
	ldrsh r2, [r4, #4]
	ldreqsh r1, [r4, #6]
	moveq r0, #4
	streqh r0, [sp, #0x88]
	smulbbeq r5, r2, r1
	ldrnesh r1, [r4, #6]
	movne r0, #1
	smulbbne r5, r2, r1
	strneh r0, [sp, #0x88]
_0201C79C:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrb r2, [r8, #0x40]
	ldr r0, [r0]
	ldrb r3, [r8, #0x41]
	add r1, sp, #0x84
	add r0, r0, #0xcc
	bl sub_0201E408
	ldrh r1, [r8, #0x32]
	ldr r0, [r4]
	mov r2, r5
	mov r3, #0
	bl sub_0201E050
	ldrh r0, [r8, #2]
	orr r0, r0, #0x8000
	strh r0, [r8, #2]
_0201C7D8:
	ldr r0, [sp, #0x44]
	and r0, r0, #0xf8
	mov r0, r0, asr #3
	str r0, [sp, #0x24]
_0201C7E8:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrsh r2, [r8, #0x1c]
	ldr r5, [r0]
	ldrsh r0, [r8, #0x20]
	ldrh sl, [sb, #0x20]
	ldrsh ip, [r8, #0x1e]
	ldrsh r3, [r8, #0x22]
	add r2, r2, r0
	ldrb r4, [r8, #0x41]
	ldrb r1, [r8, #0x40]
	add r3, ip, r3
	add ip, sl, #0x39
	ldrh r0, [r8, #0x32]
	ldr r5, [r5, #0xe0]
	mov sl, #3
	add r1, r4, r1, lsl #8
	strh sl, [sp, #0x5c]
	add r4, r5, r1, lsl #1
	str r0, [sp, #0x60]
	strh ip, [sp, #0x5e]
	mov r0, r4, lsl #0x10
	ldr r1, [sb]
	mov r4, r7
	add r0, r1, r0, lsr #16
	add r1, r7, #1
	and r7, r1, #0xff
	add r5, sp, #0x68
	str r0, [sp, #0x64]
	add sl, sb, #0x10
	mov r1, #4
_0201C860:
	ldrh r0, [sl], #2
	subs r1, r1, #1
	strh r0, [r5], #2
	bne _0201C860
	ldrh r5, [sb, #0x18]
	add r0, sp, #0x7e
	add r1, sb, #0x1a
	strh r5, [sp, #0x70]
	ldrsh r5, [sb, #4]
	strh r5, [sp, #0x72]
	ldrsh sl, [sb, #6]
	add r5, r5, r2
	add r2, sl, r3
	strh r5, [sp, #0x72]
	strh r2, [sp, #0x74]
	ldrsh r2, [sb, #8]
	strh r2, [sp, #0x76]
	ldrsh r2, [sb, #0xa]
	strh r2, [sp, #0x78]
	ldrh r2, [sb, #0xc]
	strh r2, [sp, #0x7a]
	ldrh r2, [sb, #0xe]
	strh r2, [sp, #0x7c]
	ldrh r2, [sb, #0x1e]
	strb r4, [sp, #0x82]
	strh r2, [sp, #0x80]
	ldrb r2, [sb, #0x1d]
	and r2, r2, #0xf8
	mov r2, r2, asr #3
	strb r2, [sp, #0x83]
	bl Rgb8ToRgb5
	ldr r0, [r6, #0x10]
	mov r1, #0x3f
	cmp r0, #0
	ldrne r0, [sp, #0x24]
	strneb r0, [sp, #0x83]
	mov r0, r7
	bl _s32_div_f
	ldrh r0, [r8, #2]
	and r7, r1, #0xff
	tst r0, #2
	bne _0201C910
	add r0, sp, #0x5c
	bl EnqueueRender3dTexture
_0201C910:
	ldrb r0, [sb, #0x22]
	cmp r0, #0
	addeq sb, sb, #0x28
	beq _0201C7E8
	mov r4, #1
	b _0201CF04
_0201C928:
	ldrb r2, [r8, #0x7a]
	ldr r1, _0201CF4C ; =_020AFC50
	mov r0, r8
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x40]
	bl GetWanForAnimationControl
	mov r1, #0
	ldrh r3, [r8, #0x60]
	str r1, [sp, #0x2c]
	ldr r2, _0201CF50 ; =_020AFC30
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	str r1, [sp, #0x28]
	ldrsh r2, [r8, #0x3a]
	ldr r3, [r8, #0x54]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r7, [r0, #4]
	ldr r1, [sp, #0x28]
	ldrb r0, [r8, #0x41]
	ldr r6, [r3, r2, lsl #2]
	cmp r1, #0
	str r0, [sp, #0x30]
	bne _0201C9B4
	ldr r0, [sp, #0x30]
	cmp r0, #0x10
	blo _0201C9B4
	sub r0, r0, #0x10
	mov r1, r0, lsl #0x10
	mov r0, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x38]
	mov r0, r1, lsr #0x10
	str r0, [sp, #0x30]
_0201C9B4:
	ldrh r2, [r8, #2]
	tst r2, #0x20
	addne r0, r8, #0x10
	strne r0, [sp, #0x2c]
	cmp r7, #0
	cmpne fp, #0
	beq _0201CCFC
	ldrh r0, [r7, #8]
	tst r0, #1
	beq _0201CCFC
	tst r2, #0x8000
	bne _0201CCFC
	ldr r0, [sp, #0x40]
	mov r1, #0
	ldrh r5, [r7, #0xe]
	ldrh sb, [r8, #0x32]
	mov r4, r1
	tst r2, #0x80
	movne r1, #1
	tst r2, #0x40
	and r0, r0, #0xff
	movne r4, #1
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0201CCE0
_0201CA18: ; jump table
	b _0201CA28 ; case 0
	b _0201CAD0 ; case 1
	b _0201CB80 ; case 2
	b _0201CC30 ; case 3
_0201CA28:
	cmp r1, #0
	bne _0201CAB0
	mov sl, #0
	b _0201CAA8
_0201CA38:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x3c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x3c]
	ldrh r2, [r1, #0xc]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CAA8:
	cmp sl, r5
	blo _0201CA38
_0201CAB0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	bl LoadObjPalette
	b _0201CCE0
_0201CAD0:
	cmp r1, #0
	bne _0201CB5C
	mov sl, #0
	b _0201CB54
_0201CAE0:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x14]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, #0x7c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CB54:
	cmp sl, r5
	blo _0201CAE0
_0201CB5C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x70
	bl LoadObjPalette
	b _0201CCE0
_0201CB80:
	cmp r1, #0
	bne _0201CC0C
	mov sl, #0
	b _0201CC04
_0201CB90:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x18]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x18]
	ldrh r2, [r1, #0xec]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CC04:
	cmp sl, r5
	blo _0201CB90
_0201CC0C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0xe0
	bl LoadObjPalette
	b _0201CCE0
_0201CC30:
	cmp r1, #0
	bne _0201CCC0
	mov sl, #0
	b _0201CCB8
_0201CC40:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x1c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B388
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r2, [r8, #0x5c]
	ldr r1, [r1]
	ldrh r3, [r2, #4]
	add r1, r1, #0x100
	ldrh r2, [r1, #0x5c]
	ldr r0, [sp, #0x1c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CCB8:
	cmp sl, r5
	blo _0201CC40
_0201CCC0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x150
	bl LoadObjPalette
_0201CCE0:
	ldrh r1, [r8, #2]
	ldr r0, _0201CF58 ; =0x0000FFFF
	orr r1, r1, #0x8000
	strh r1, [r8, #2]
	ldrb r1, [r8, #0x41]
	strb r1, [r8, #0x43]
	strh r0, [r8, #0x36]
_0201CCFC:
	ldr r0, [sp, #0x40]
	mov r1, #0x70
	mul r5, r0, r1
	cmp fp, #0
	moveq sb, #1
	ldr sl, _0201CF58 ; =0x0000FFFF
	movne sb, #0
_0201CD18:
	cmp sb, #0
	mov r4, #0
	bne _0201CD34
	ldrsh r0, [r6]
	cmp r0, #0
	strgeh r0, [r8, #0x36]
	bge _0201CD38
_0201CD34:
	strh sl, [r8, #0x36]
_0201CD38:
	ldrsh r3, [r8, #0x1e]
	ldrsh r2, [r8, #0x22]
	ldrsh r1, [r8, #0x1c]
	ldrsh r0, [r8, #0x20]
	add r2, r3, r2
	add r0, r1, r0
	strh r2, [sp, #0x4e]
	strh r0, [sp, #0x4c]
	ldrh r0, [r8, #0x32]
	strh r0, [sp, #0x50]
	ldrh r0, [r8, #0x38]
	strh r0, [sp, #0x52]
	ldr r0, [sp, #0x30]
	strh r0, [sp, #0x54]
	ldrb r0, [r8, #0x42]
	strh r0, [sp, #0x56]
	ldr r0, [sp, #0x28]
	strh r0, [sp, #0x58]
	ldr r0, [sp, #0x38]
	strb r0, [sp, #0x5a]
	ldrh r0, [r8, #2]
	tst r0, #0x1000
	movne r0, #1
	moveq r0, #0
	strb r0, [sp, #0x5b]
	ldrh r0, [r8, #2]
	tst r0, #2
	bne _0201CDD4
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r3, [sp, #0x2c]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	add r2, sp, #0x4c
	bl AddWanFragmentToOam
	cmp r0, #0
	movne r0, #1
	moveq r4, #1
	strne r0, [sp, #0x34]
_0201CDD4:
	ldrh r2, [r8, #2]
	tst r2, #0x200
	movne r4, #1
	cmp r4, #0
	cmpne r7, #0
	beq _0201CE80
	ldrh r0, [r7, #8]
	tst r0, #1
	bne _0201CE80
	ldrh r0, [r8, #0x36]
	cmp r0, sl
	beq _0201CE80
	ldrb r3, [r8, #0x41]
	ldrb r1, [r8, #0x43]
	mov r0, #1
	cmp r3, r1
	beq _0201CE24
	tst r2, #0x40
	moveq r0, #0
	strb r3, [r8, #0x43]
_0201CE24:
	ldrh r2, [r8, #0x36]
	ldr r3, [r8, #0x58]
	ldrh r1, [r8, #2]
	ldr r3, [r3, r2, lsl #2]
	ldr r2, [r8, #0x5c]
	tst r1, #0x80
	str r2, [sp]
	ldrb r2, [r8, #0x41]
	movne r1, #1
	moveq r1, #0
	str r2, [sp, #4]
	mov r2, #0
	and r4, r1, #0xff
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r2, [r8, #0x32]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	bl sub_0201B53C
	strh sl, [r8, #0x36]
_0201CE80:
	ldrh r0, [r6, #6]
	mov r0, r0, asr #0xb
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addeq r6, r6, #0xa
	beq _0201CD18
	ldrh r0, [r8, #2]
	tst r0, #0x200
	movne r0, #0
	strne r0, [sp, #0x34]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r4, r0, #0xff
	b _0201CF04
_0201CEC8:
	bne _0201CF04
	ldrsh r0, [r8, #0x3a]
	ldr r1, [r8, #0x54]
	ldr r3, [r1, r0, lsl #2]
	mov r0, #0
	mov r1, #1
_0201CEE0:
	ldrh r2, [r3, #6]
	mov r2, r2, asr #0xb
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	addeq r3, r3, #0xa
	beq _0201CEE0
	mov r4, #1
_0201CF04:
	cmp r4, #0
	ldrneh r0, [r8, #2]
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201CF28
	cmp fp, #0
	ldrneh r0, [r8, #2]
	orrne r0, r0, #0x100
	strneh r0, [r8, #2]
_0201CF28:
	ldrsh r0, [r8, #0x3a]
	strh r0, [r8, #0x3c]
	ldrh r0, [r8]
	tst r0, #0x800
	bicne r0, r0, #0x800
	strneh r0, [r8]
_0201CF40:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201CF48: .word _020AFC70
_0201CF4C: .word _020AFC50
_0201CF50: .word _020AFC30
_0201CF54: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201CF58: .word 0x0000FFFF
	arm_func_end DisplayAnimationControlCurrentFrame

	arm_func_start DisplayAndSwitchAnimationControlCurrentFrame
DisplayAndSwitchAnimationControlCurrentFrame: ; 0x0201CF5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DisplayAnimationControlCurrentFrame
	ldrh r0, [r4, #2]
	tst r0, #0x10
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
	arm_func_end DisplayAndSwitchAnimationControlCurrentFrame

	arm_func_start sub_0201CF80
sub_0201CF80: ; 0x0201CF80
	ldrb r1, [r0, #0x41]
	add r1, r1, #1
	strb r1, [r0, #0x43]
	bx lr
	arm_func_end sub_0201CF80

	arm_func_start GetPixelOffsetFromSprite
GetPixelOffsetFromSprite: ; 0x0201CF90
	stmdb sp!, {r3, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	ldrh r3, [r1]
	tst r3, #0x8000
	movne ip, #1
	tst ip, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r2, #4
	ldmhsia sp!, {r3, pc}
	ldrsh ip, [r1, #0x3a]
	mvn r3, #0
	cmp ip, r3
	ldrne r3, [r1, #0x50]
	cmpne r3, #0
	beq _0201D024
	add ip, r3, ip, lsl #4
	mov r3, r2, lsl #2
	ldrsh lr, [ip, r3]
	cmp lr, #0x63
	addeq r3, ip, r3
	ldreqsh r3, [r3, #2]
	cmpeq r3, #0x63
	moveq r1, #0x63
	streqh r1, [r0]
	streqh r1, [r0, #2]
	ldmeqia sp!, {r3, pc}
	ldrsh r3, [r1, #0x20]
	add r2, ip, r2, lsl #2
	add r3, r3, lr
	strh r3, [r0]
	ldrsh r3, [r1, #0x22]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
_0201D024:
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
	arm_func_end GetPixelOffsetFromSprite

	arm_func_start FillPixelOffsetArrayFromSprite
FillPixelOffsetArrayFromSprite: ; 0x0201D034
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r3, [r2]
	tst r3, #0x8000
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r2, #0x50]
	cmp r4, #0
	beq _0201D0CC
	ldrsh r3, [r2, #0x3a]
	mov ip, #0
	mov r5, #0x63
	add r3, r4, r3, lsl #4
	b _0201D0C0
_0201D070:
	mov r4, ip, lsl #2
	ldrsh r6, [r3, r4]
	cmp r6, #0x63
	addeq r4, r3, r4
	ldreqsh r4, [r4, #2]
	cmpeq r4, #0x63
	streqh r5, [r0]
	streqh r5, [r0, #2]
	beq _0201D0B4
	ldrsh r4, [r2, #0x20]
	add lr, r3, ip, lsl #2
	add r4, r4, r6
	strh r4, [r0]
	ldrsh r4, [r2, #0x22]
	ldrsh lr, [lr, #2]
	add r4, r4, lr
	strh r4, [r0, #2]
_0201D0B4:
	add ip, ip, #1
	add r0, r0, #4
	and ip, ip, #0xff
_0201D0C0:
	cmp ip, r1
	blo _0201D070
	ldmia sp!, {r4, r5, r6, pc}
_0201D0CC:
	mov r2, #0
	mov r3, r2
	b _0201D0EC
_0201D0D8:
	strh r3, [r0]
	add r2, r2, #1
	strh r3, [r0, #2]
	add r0, r0, #4
	and r2, r2, #0xff
_0201D0EC:
	cmp r2, r1
	blo _0201D0D8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FillPixelOffsetArrayFromSprite

	arm_func_start sub_0201D0F8
sub_0201D0F8: ; 0x0201D0F8
	strb r1, [r0, #0x40]
	bx lr
	arm_func_end sub_0201D0F8

	arm_func_start sub_0201D100
sub_0201D100: ; 0x0201D100
	ldr ip, _0201D10C ; =sub_0201DC4C
	ldrsh r0, [r0, #0x70]
	bx ip
	.align 2, 0
_0201D10C: .word sub_0201DC4C
	arm_func_end sub_0201D100

	arm_func_start FillOamAttributeInfo
FillOamAttributeInfo: ; 0x0201D110
	add r3, r0, #0x10
	mov r2, #6
_0201D118:
	ldrh r0, [r1], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _0201D118
	bx lr
	arm_func_end FillOamAttributeInfo

	arm_func_start sub_0201D12C
sub_0201D12C: ; 0x0201D12C
	ldrh r3, [r0, #2]
	and r2, r1, #3
	ldr r1, _0201D16C ; =0x0000F3FF
	orr r3, r3, #0x20
	strh r3, [r0, #2]
	ldrh r3, [r0, #0x14]
	mov r2, r2, lsl #0x10
	and r3, r3, r1
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x1a]
	and r1, r3, r1
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0x1a]
	orr r1, r1, r2, lsr #6
	strh r1, [r0, #0x1a]
	bx lr
	.align 2, 0
_0201D16C: .word 0x0000F3FF
	arm_func_end sub_0201D12C

	arm_func_start AnimationControlGetAllocForMaxFrame
AnimationControlGetAllocForMaxFrame: ; 0x0201D170
	stmdb sp!, {r3, lr}
	bl GetWanForAnimationControl
	cmp r0, #0
	ldrne r0, [r0]
	ldrnesh r0, [r0, #0xe]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end AnimationControlGetAllocForMaxFrame

	arm_func_start sub_0201D18C
sub_0201D18C: ; 0x0201D18C
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D18C
