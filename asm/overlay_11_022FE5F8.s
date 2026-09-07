	.include "asm/macros.inc"
	.include "overlay_11_022FE5F8.inc"

	.text

	arm_func_start SetAnimationLivePerformer
SetAnimationLivePerformer: ; 0x022FE5F8
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	tst r1, #0x800
	mov ip, r2, lsr #0x10
	beq _022FE628
	add r1, r0, #0x100
	mov r2, #0x400
	strh r2, [r1, #0x4a]
	mov r1, #1
	strb r1, [r0, #0x148]
	bx lr
_022FE628:
	cmp r3, #0
	ldrne r1, _022FE6B4 ; =ov11_023220DC
	movne r2, r3, lsl #1
	ldrnesh r3, [r1, r2]
	addeq r1, r0, #0x100
	ldreqsh r3, [r1, #0x4a]
	cmp ip, #0x200
	bgt _022FE660
	bge _022FE67C
	cmp ip, #0x100
	orreq r1, r3, #0x300
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE660:
	cmp ip, #0x300
	ble _022FE688
	cmp ip, #0x400
	orreq r1, r3, #0x200
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE67C:
	orr r1, r3, #0x100
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_022FE688:
	add r1, r0, #0x100
	ldrsh r2, [r1, #0x4a]
	cmp r2, r3
	strneh r3, [r1, #0x4a]
	movne r1, #1
	strneb r1, [r0, #0x148]
	bxne lr
	tst r2, #0x1000
	movne r1, #1
	strneb r1, [r0, #0x148]
	bx lr
	.align 2, 0
_022FE6B4: .word ov11_023220DC
	arm_func_end SetAnimationLivePerformer

	arm_func_start SetEffectLivePerformer
SetEffectLivePerformer: ; 0x022FE6B8
	add r0, r0, #0x100
	strh r1, [r0, #0x4c]
	strh r2, [r0, #0x4e]
	bx lr
	arm_func_end SetEffectLivePerformer

	arm_func_start GetAnimationStatusLivePerformer
GetAnimationStatusLivePerformer: ; 0x022FE6C8
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x148]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end GetAnimationStatusLivePerformer

	arm_func_start GetEffectStatusLivePerformer
GetEffectStatusLivePerformer: ; 0x022FE6E8
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r3, [r1, #0x4c]
	mvn r2, #0
	cmp r3, r2
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldrsh r1, [r1, #0x4e]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end GetEffectStatusLivePerformer

	arm_func_start GetAttributeBitfieldLivePerformer
GetAttributeBitfieldLivePerformer: ; 0x022FE720
	ldr r0, [r0, #0x128]
	str r0, [r1]
	bx lr
	arm_func_end GetAttributeBitfieldLivePerformer

	arm_func_start SetAttributeBitfieldLivePerformerWrapper
SetAttributeBitfieldLivePerformerWrapper: ; 0x022FE72C
	ldr ip, _022FE738 ; =SetAttributeBitfieldLivePerformer
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE738: .word SetAttributeBitfieldLivePerformer
	arm_func_end SetAttributeBitfieldLivePerformerWrapper

	arm_func_start ResetAttributeBitfieldLivePerformerWrapper
ResetAttributeBitfieldLivePerformerWrapper: ; 0x022FE73C
	ldr ip, _022FE748 ; =ResetAttributeBitfieldLivePerformer
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE748: .word ResetAttributeBitfieldLivePerformer
	arm_func_end ResetAttributeBitfieldLivePerformerWrapper

	arm_func_start SetBlinkLivePerformer
SetBlinkLivePerformer: ; 0x022FE74C
	ldr ip, _022FE758 ; =ov11_022F4984
	add r0, r0, #0x150
	bx ip
	.align 2, 0
_022FE758: .word ov11_022F4984
	arm_func_end SetBlinkLivePerformer

	arm_func_start SetPositionOffsetLivePerformer
SetPositionOffsetLivePerformer: ; 0x022FE75C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr ip, [r1]
	ldr r2, [r0, #0x130]
	ldr lr, [r1, #4]
	add r4, r2, ip
	ldr r1, [r0, #0x13c]
	ldr r3, [r0, #0x138]
	ldr r2, [r0, #0x2c]
	add r3, r3, ip
	add r1, r1, lr
	ldr ip, [r0, #0x134]
	str r1, [sp, #0xc]
	cmp r4, r2
	ldrlt r1, [r0, #0x10]
	add ip, ip, lr
	str r4, [sp]
	str r3, [sp, #8]
	addlt r1, r2, r1
	str ip, [sp, #4]
	strlt r2, [sp]
	strlt r1, [sp, #8]
	blt _022FE7D0
	ldr r2, [r0, #0x34]
	cmp r3, r2
	ldrge r1, [r0, #0x10]
	strge r2, [sp, #8]
	subge r1, r2, r1
	strge r1, [sp]
_022FE7D0:
	ldr r2, [r0, #0x30]
	ldr r1, [sp, #4]
	cmp r1, r2
	ldrlt r1, [r0, #0x14]
	strlt r2, [sp, #4]
	addlt r1, r2, r1
	strlt r1, [sp, #0xc]
	blt _022FE80C
	ldr r2, [r0, #0x38]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	ldrge r1, [r0, #0x14]
	strge r2, [sp, #0xc]
	subge r1, r2, r1
	strge r1, [sp, #4]
_022FE80C:
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r0, #0x130]
	ldr r2, [sp, #8]
	str r1, [r0, #0x134]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x138]
	str r1, [r0, #0x13c]
	mov r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetPositionOffsetLivePerformer

	arm_func_start ov11_022FE838
ov11_022FE838: ; 0x022FE838
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE8C8 ; =ov11_02324D04
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FE850:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FE8AC
	add r0, r5, #0x3c
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FE888
	cmp r0, #6
	bne _022FE888
	mov r0, r4
	bl DeleteLivePerformer
	b _022FE8AC
_022FE888:
	ldrb r0, [r5, #0x148]
	cmp r0, #0
	beq _022FE8AC
	strb r7, [r5, #0x148]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4a]
	mov r2, r7
	add r0, r5, #0x150
	bl SetAnimDataFields2
_022FE8AC:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x214
	blt _022FE850
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE8C8: .word ov11_02324D04
	arm_func_end ov11_022FE838

	arm_func_start ov11_022FE8CC
ov11_022FE8CC: ; 0x022FE8CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FE9D8 ; =ov11_023220B4
	ldr r1, _022FE9DC ; =ov11_02324D04
	ldr r8, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FE8FC:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FE9B8
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x130]
	ldr r1, [sl, #0x18]
#ifdef JAPAN
	add r0, sl, #0x150
#else
	add r0, sl, #0x100
#endif
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
#ifdef JAPAN
	ldr r6, [sl, #0x140]
	ldr r5, [sl, #0x144]
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FE970
	strb fp, [sl, #0x148]
	add r0, sl, #0x100
#else
	ldrsh r1, [r0, #0xe2]
	ldr r6, [sl, #0x140]
	ldr r5, [sl, #0x144]
	cmp r1, #0
	bge _022FE970
	ldrsh r1, [r0, #0xdc]
	cmp r1, #0
	ble _022FE970
	strb fp, [sl, #0x148]
#endif
	ldrsh r1, [r0, #0x4a]
	mov r2, fp
	add r0, sl, #0x150
	bl SetAnimDataFields2
_022FE970:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x4c]
	cmp r1, r4
	beq _022FE9A8
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x4e]
	ldrsb r3, [r3, #0x2c]
	add r0, sl, #0x150
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x4c]
	mov r0, #0
	strh r0, [r1, #0x4e]
_022FE9A8:
	add r1, sp, #0xc
	add r0, sl, #0x150
	add r2, r6, r5
	bl ov11_022F6FA8
_022FE9B8:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x214
	blt _022FE8FC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE9D8: .word ov11_023220B4
_022FE9DC: .word ov11_02324D04
	arm_func_end ov11_022FE8CC

	arm_func_start ov11_022FE9E0
ov11_022FE9E0: ; 0x022FE9E0
	stmdb sp!, {r3, lr}
	mov r0, #0x400
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FEA24 ; =ov11_02324D08
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FEA00:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x20
	add r0, r0, #0x20
	blt _022FEA00
	bl ov11_022FEA28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA24: .word ov11_02324D08
	arm_func_end ov11_022FE9E0

	arm_func_start ov11_022FEA28
ov11_022FEA28: ; 0x022FEA28
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FEA6C ; =ov11_02324D08
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FEA3C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022FEA50
	mov r0, r5
	bl DeleteLiveEvent
_022FEA50:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r6, r6, #0x20
	blt _022FEA3C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FEA6C: .word ov11_02324D08
	arm_func_end ov11_022FEA28

	arm_func_start ov11_022FEA70
ov11_022FEA70: ; 0x022FEA70
	stmdb sp!, {r3, lr}
	bl ov11_022FEA28
	ldr r0, _022FEA94 ; =ov11_02324D08
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FEA94 ; =ov11_02324D08
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA94: .word ov11_02324D08
	arm_func_end ov11_022FEA70

	arm_func_start ov11_022FEA98
ov11_022FEA98: ; 0x022FEA98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bpl _022FEB00
	ldr r0, _022FEBF4 ; =ov11_02324D08
	mov r2, #0
	ldr r4, [r0]
	mvn r1, #0
	b _022FEAE8
_022FEAC8:
	ldrsh r0, [r4, #2]
	cmp r0, r1
	moveq sl, r2
	beq _022FEAF0
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r4, r4, #0x20
_022FEAE8:
	cmp r2, #0x20
	blt _022FEAC8
_022FEAF0:
	cmp sl, #0
	bge _022FEB0C
	mvn r0, #0
	b _022FEBEC
_022FEB00:
	ldr r0, _022FEBF4 ; =ov11_02324D08
	ldr r0, [r0]
	add r4, r0, sl, lsl #5
_022FEB0C:
	str r8, [sp]
	str r7, [sp, #4]
	ldrsh r3, [sb]
	ldr r1, _022FEBF8 ; =ov11_02322368
	mov r2, sl
	mov r0, #1
	bl Debug_Print
	ldrsh r0, [sb]
	bl ov11_022E7FA8
	strh sl, [r4]
	ldrsh r1, [sb]
	strh r1, [r4, #2]
	strh r8, [r4, #4]
	strb r7, [r4, #6]
	ldrsh r1, [sb, #8]
	strh r1, [r4, #8]
	ldrsh r0, [r0, #2]
	cmp r0, #1
	cmpne r0, #2
	beq _022FEB64
	cmp r0, #7
	b _022FEB70
_022FEB64:
	mov r0, #0x1800
	str r0, [r4, #0xc]
	b _022FEB78
_022FEB70:
	mov r0, #0x800
	str r0, [r4, #0xc]
_022FEB78:
	ldrb r2, [sb, #2]
	ldrb r0, [sb, #3]
	ldrb r1, [sb, #6]
	mov r2, r2, lsl #0xb
	mov r0, r0, lsl #0xb
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	tst r1, #4
	bne _022FEBAC
	ldrb r0, [sb, #4]
	tst r1, #2
	mov r5, r0, lsl #0xb
	addne r5, r5, #0x400
_022FEBAC:
	ldrb r1, [sb, #7]
	tst r1, #4
	bne _022FEBC8
	ldrb r0, [sb, #5]
	tst r1, #2
	mov r6, r0, lsl #0xb
	addne r6, r6, #0x400
_022FEBC8:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r5, [r4, #0x10]
	add r1, r5, r1
	str r1, [r4, #0x18]
	str r6, [r4, #0x14]
	add r1, r6, r0
	mov r0, sl
	str r1, [r4, #0x1c]
_022FEBEC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FEBF4: .word ov11_02324D08
_022FEBF8: .word ov11_02322368
	arm_func_end ov11_022FEA98

	arm_func_start ov11_022FEBFC
ov11_022FEBFC: ; 0x022FEBFC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022FEC64 ; =ov11_02324D08
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	mov r5, #0
	mvn r8, #0
_022FEC18:
	ldrsh r0, [r4, #2]
	cmp r0, r8
	beq _022FEC48
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _022FEC48
	cmp r6, r8
	ldrnesb r0, [r4, #6]
	cmpne r6, r0
	bne _022FEC48
	mov r0, r5
	bl DeleteLiveEvent
_022FEC48:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r4, r4, #0x20
	blt _022FEC18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FEC64: .word ov11_02324D08
	arm_func_end ov11_022FEBFC

	arm_func_start DeleteLiveEvent
DeleteLiveEvent: ; 0x022FEC68
	stmdb sp!, {r4, lr}
	ldr r1, _022FEC94 ; =ov11_02324D08
	mov r2, r0
	ldr r3, [r1]
	ldr r1, _022FEC98 ; =ov11_023223A4
	mov r0, #1
	add r4, r3, r2, lsl #5
	bl Debug_Print
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEC94: .word ov11_02324D08
_022FEC98: .word ov11_023223A4
	arm_func_end DeleteLiveEvent

	arm_func_start ov11_022FEC9C
ov11_022FEC9C: ; 0x022FEC9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FED68 ; =ov11_023223C0
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FED60
	ldr r0, _022FED6C ; =ov11_02324D08
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FED70 ; =ov11_023223EC
	mov r8, #0
	add r5, r4, #1
	mov r6, #1
_022FECF8:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022FED48
	ldrsh r2, [r7, #4]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #6]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #4]
	cmp sl, r0
	bne _022FED48
	cmp sb, r4
	ldrnesb r0, [r7, #6]
	cmpne sb, r0
	bne _022FED48
	mov r0, r8
	bl DeleteLiveEvent
_022FED48:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x20
	add r7, r7, #0x20
	blt _022FECF8
_022FED60:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FED68: .word ov11_023223C0
_022FED6C: .word ov11_02324D08
_022FED70: .word ov11_023223EC
	arm_func_end ov11_022FEC9C

	arm_func_start ov11_022FED74
ov11_022FED74: ; 0x022FED74
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FEDF0 ; =ov11_02324D08
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _022FEDF4 ; =ov11_02322418
	add r4, r0, r2, lsl #5
	ldrsh r3, [r4, #4]
	mov r0, #1
	str r3, [sp]
	ldrsh r3, [r4, #8]
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl Debug_Print
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	beq _022FEDE4
	ldrsh r1, [r4, #8]
	cmp r1, r2
	bne _022FEDD4
	mov r1, #0
	bl ov11_022F7188
	b _022FEDDC
_022FEDD4:
	ldrsh r0, [r4, #4]
	bl ov11_022F74A0
_022FEDDC:
	mov r0, #1
	b _022FEDE8
_022FEDE4:
	mov r0, #0
_022FEDE8:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEDF0: .word ov11_02324D08
_022FEDF4: .word ov11_02322418
	arm_func_end ov11_022FED74

	arm_func_start GetCollidingEventId
GetCollidingEventId: ; 0x022FEDF8
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FEE8C ; =ov11_02324D08
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FEE7C
_022FEE10:
	ldrsh r4, [ip, #2]
	cmp r4, lr
	beq _022FEE6C
	ldr r4, [ip, #0xc]
	tst r4, r0
	beq _022FEE6C
	ldr r5, [ip, #0x10]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x18]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FEE6C
	ldr r5, [ip, #0x14]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x1c]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FEE6C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x20
_022FEE7C:
	cmp r3, #0x20
	blt _022FEE10
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEE8C: .word ov11_02324D08
	arm_func_end GetCollidingEventId

	arm_func_start ov11_022FEE90
ov11_022FEE90: ; 0x022FEE90
	bx lr
	arm_func_end ov11_022FEE90

	arm_func_start CreateTeamInfoBox
CreateTeamInfoBox: ; 0x022FEE94
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r0, #0x378
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	bl GetGameMode
	cmp r0, #3
	ldreq r0, _022FEF18 ; =ov11_0232246C
	add r5, sp, #0
	ldrne r0, _022FEF1C ; =TEAM_INFO_BOX_DEFAULT_WINDOW_PARAMS
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r2, _022FEF20 ; =UpdateTeamInfoBox
	str r4, [sp, #0xc]
	add r0, sp, #0
	mov r1, #1
	str r2, [r4]
	bl NewWindowScreenCheck
	mov r2, #1
	mov r5, r0
	mov r1, #0
	str r2, [r4, #0x370]
	str r1, [r4, #0x374]
	sub r1, r1, #2
	add r0, r4, #8
	strb r1, [r4, #4]
	bl InitPortraitParams
	mov r1, #3
	mov r0, r5
	str r1, [r4, #0x18]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEF18: .word ov11_0232246C
_022FEF1C: .word TEAM_INFO_BOX_DEFAULT_WINDOW_PARAMS
_022FEF20: .word UpdateTeamInfoBox
	arm_func_end CreateTeamInfoBox

	arm_func_start ov11_022FEF24
ov11_022FEF24: ; 0x022FEF24
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #4
	str r1, [r0, #0x370]
	ldrsb r0, [r0, #4]
	sub r1, r1, #6
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F954
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FEF24

	arm_func_start CloseTeamInfoBox
CloseTeamInfoBox: ; 0x022FEF4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FEF70
	bl CloseTextBox
_022FEF70:
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseTeamInfoBox

	arm_func_start IsTeamInfoBoxActive
IsTeamInfoBoxActive: ; 0x022FEF84
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x370]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamInfoBoxActive

	arm_func_start UpdateTeamInfoBox
UpdateTeamInfoBox: ; 0x022FEFA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r8, r0
	ldr r4, [r8, #0xc]
	ldr r0, [r4, #0x370]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FF1B4
_022FEFC8: ; jump table
	b _022FF1B4 ; case 0
	b _022FEFDC ; case 1
	b _022FEFFC ; case 2
	b _022FF1B4 ; case 3
	b _022FF17C ; case 4
_022FEFDC:
	ldrsb r0, [r8, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _022FF1B4
	mov r0, #2
	str r0, [r4, #0x370]
	mov r0, #1
	str r0, [r4, #0x374]
_022FEFFC:
	ldr r6, [r8, #0xc]
	bl GetGameMode
	mov r5, r0
	ldrsb r0, [r8, #0x10]
	bl sub_02027B1C
	cmp r5, #3
	beq _022FF118
	bl GetRank
	str r0, [sp, #0x14]
	bl GetRankupPoints
	cmp r0, #0
	ldreq r7, _022FF1C0 ; =0x00000222
	str r0, [sp, #0x28]
	add ip, sp, #4
	ldr r2, _022FF1C4 ; =0x0000021F
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	ldrne r7, _022FF1CC ; =0x00000221
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x54
	bl sub_020265A8
	ldrsb r0, [r8, #0x10]
	mov r1, #0x3a
#ifdef EUROPE
	mov r2, #0xe
#else
	mov r2, #4
#endif
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _022FF0AC
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _022FF1D0 ; =0x00000226
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x28
	mov r2, #0x16
	bl DrawTextInWindow
_022FF0AC:
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r2, r7
	mov r1, #0x100
	bl PreprocessStringFromId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x3a
#ifdef EUROPE
	mov r2, #0x1a
#else
	mov r2, #0x16
#endif
	bl DrawTextInWindow
	ldrsb r0, [r6, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FF0F8
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r6, #4]
_022FF0F8:
	bl GetRank
	mov r1, #3
	mov r3, r1
	mov r2, #0x12
	bl PrintBadgeMark
	strb r0, [r6, #4]
	ldrsb r0, [r8, #0x10]
	bl UpdateWindow
_022FF118:
	bl GetMoneyCarried
	str r0, [sp, #0x28]
	add r6, sp, #4
#ifdef JAPAN
	ldr r2, _0230083C ; =0x0000042B
#endif
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
#ifndef JAPAN
	mov r2, #0x224
#endif
	str r6, [sp]
	bl PreprocessStringFromId
	cmp r5, #3
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
#ifdef EUROPE
	mov r2, #2
	beq _022FF15C
	mov r1, #0xaa
#else
	beq _022FF15C
	mov r1, #0x9a
	mov r2, #4
#endif
	bl DrawTextInWindow
	b _022FF168
_022FF15C:
	mov r1, #0x10
#ifndef EUROPE
	mov r2, #2
#endif
	bl DrawTextInWindow
_022FF168:
	mov r0, #3
	str r0, [r4, #0x370]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	b _022FF1B4
_022FF17C:
	mov r1, #4
	str r1, [r4, #0x374]
	ldrsb r0, [r4, #4]
	sub r1, r1, #6
	cmp r0, r1
	beq _022FF198
	bl sub_0202F954
_022FF198:
	ldrsb r0, [r8, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r8, #0xb8]
	movne r0, #5
	strne r0, [r4, #0x370]
_022FF1B4:
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_022FF1C0: .word 0x00000429
_022FF1C4: .word 0x00000426
_022FF1C8: .word 0x0000C402
_022FF1CC: .word 0x00000428
_022FF1D0: .word 0x0000042D
_0230083C: .word 0x0000042B
#else
_022FF1C0: .word 0x00000222
_022FF1C4: .word 0x0000021F
_022FF1C8: .word 0x0000C402
_022FF1CC: .word 0x00000221
_022FF1D0: .word 0x00000226
#endif
	arm_func_end UpdateTeamInfoBox

	arm_func_start ov11_022FF1D4
ov11_022FF1D4: ; 0x022FF1D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FF20C ; =ov11_0232247C
	mov r4, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FF210 ; =ov11_02324D0C
	ldr r0, _022FF214 ; =ov11_0238A074
	ldr r2, _022FF218 ; =0x000002BD
	strh r4, [r1]
	strh r5, [r0]
	strh r2, [r1, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF20C: .word ov11_0232247C
_022FF210: .word ov11_02324D0C
_022FF214: .word ov11_0238A074
_022FF218: .word 0x000002BD
	arm_func_end ov11_022FF1D4

	arm_func_start EatOverworldGummiEntryPoint
EatOverworldGummiEntryPoint: ; 0x022FF21C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r0, #0x620
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FF304 ; =ov11_02324D0C
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl CopyMenuControlWindowExtraInfo
	ldr r3, _022FF304 ; =ov11_02324D0C
	mov r1, r4
	ldr ip, [r3, #4]
	ldr r2, _022FF308 ; =ov11_0238A074
	str r0, [ip, #8]
	ldrsh r2, [r2]
	ldr r0, [r3, #4]
	ldr lr, _022FF30C ; =C_ROUTINES
	strh r2, [r0, #0xa4]
	ldr r0, _022FF310 ; =0x000002BD
	mov r5, r1
_022FF270:
	ldr r6, [r3, #4]
	ldrsh ip, [lr, #2]
	ldrsh r2, [r6, #0xa4]
	cmp ip, r2
	bne _022FF29C
	ldrsh r2, [r3]
	cmp r2, r5
	add r2, r6, r1, lsl #1
	moveq r4, r1
	strh r5, [r2, #0xa6]
	add r1, r1, #1
_022FF29C:
	add r5, r5, #1
	cmp r5, r0
	add lr, lr, #8
	blt _022FF270
	ldr r2, _022FF304 ; =ov11_02324D0C
	mov r3, #0xa
	ldr ip, [r2, #4]
	ldr r0, _022FF314 ; =ov11_0232248C
	str r4, [ip, #0xc]
	stmia sp, {r1, r3}
	ldr r1, [r2, #4]
	ldr r3, _022FF318 ; =ov11_022FF438
	add r2, r1, #0xc
	mov r1, #0x33
	bl CreateAdvancedMenu
	ldr r1, _022FF304 ; =ov11_02324D0C
	mov r4, #0
	ldr r3, [r1, #4]
	ldr r2, _022FF310 ; =0x000002BD
	strb r0, [r3]
	ldr r3, [r1, #4]
	mov r0, #1
	str r4, [r3, #4]
	strh r2, [r1, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FF304: .word ov11_02324D0C
_022FF308: .word ov11_0238A074
_022FF30C: .word C_ROUTINES
_022FF310: .word 0x000002BD
_022FF314: .word ov11_0232248C
_022FF318: .word ov11_022FF438
	arm_func_end EatOverworldGummiEntryPoint

	arm_func_start EatOverworldGummiDestructor
EatOverworldGummiDestructor: ; 0x022FF31C
	stmdb sp!, {r3, lr}
	ldr r0, _022FF354 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF354 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF354 ; =ov11_02324D0C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF354: .word ov11_02324D0C
	arm_func_end EatOverworldGummiDestructor

	arm_func_start EatOverworldGummiFrameUpdate
EatOverworldGummiFrameUpdate: ; 0x022FF358
	stmdb sp!, {r3, lr}
	ldr r0, _022FF434 ; =ov11_02324D0C
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _022FF384
	cmp r1, #1
	beq _022FF3A4
	cmp r1, #2
	beq _022FF3FC
	b _022FF42C
_022FF384:
	ldrsb r0, [r2]
	bl IsAdvancedMenuActive
	cmp r0, #0
	ldreq r0, _022FF434 ; =ov11_02324D0C
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _022FF42C
_022FF3A4:
	ldrsb r0, [r2]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF42C
	ldr r0, _022FF434 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF434 ; =ov11_02324D0C
	mvnlt r1, #0
	strlth r1, [r0, #2]
	ldrge r1, _022FF434 ; =ov11_02324D0C
	ldrge r2, [r1, #4]
	addge r0, r2, r0, lsl #1
	ldrgesh r0, [r0, #0xa6]
	strgeh r0, [r1, #2]
	ldr r0, _022FF434 ; =ov11_02324D0C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF42C
_022FF3FC:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _022FF424
	ldrsh r1, [r0, #2]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_022FF424:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022FF42C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF434: .word ov11_02324D0C
	arm_func_end EatOverworldGummiFrameUpdate

	arm_func_start ov11_022FF438
ov11_022FF438: ; 0x022FF438
	ldr r0, _022FF458 ; =ov11_02324D0C
	ldr r2, _022FF45C ; =C_ROUTINES
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #1
	ldrsh r0, [r0, #0xa6]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022FF458: .word ov11_02324D0C
_022FF45C: .word C_ROUTINES
	arm_func_end ov11_022FF438

	arm_func_start ov11_022FF460
ov11_022FF460: ; 0x022FF460
	ldr r2, _022FF488 ; =ov11_02324D0C
	ldr r1, _022FF48C ; =0x000002BD
	ldrsh r3, [r2, #2]
	strh r3, [r0]
	ldrsh r0, [r2, #2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FF488: .word ov11_02324D0C
_022FF48C: .word 0x000002BD
	arm_func_end ov11_022FF460

	arm_func_start ov11_022FF490
ov11_022FF490: ; 0x022FF490
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, _022FF4F0 ; =ov11_0232249C
	mov r5, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
#ifdef JAPAN
	ldr r0, _022FF4F8 ; =ov11_02324D14
	mov r1, #0x1b4
	strh r1, [r0, #2]
	cmp r5, #0
#else
	ldr r1, _022FF4F4 ; =0x000001AF
	ldr r0, _022FF4F8 ; =ov11_02324D14
	cmp r5, #0
	strh r1, [r0, #2]
#endif
	bne _022FF4CC
	ldr r0, _022FF4FC ; =ov11_0238A078
	bl ov11_022E45F4
	b _022FF4E4
_022FF4CC:
	ldr r2, _022FF4FC ; =ov11_0238A078
	mov r1, #8
_022FF4D4:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF4D4
_022FF4E4:
	ldr r0, _022FF4F8 ; =ov11_02324D14
	strh r4, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF4F0: .word ov11_0232249C
#if defined(EUROPE)
_022FF4F4: .word 0x000001CB
#elif !defined(JAPAN)
_022FF4F4: .word 0x000001AF
#endif
_022FF4F8: .word ov11_02324D14
_022FF4FC: .word ov11_0238A078
	arm_func_end ov11_022FF490

	arm_func_start ov11_022FF500
ov11_022FF500: ; 0x022FF500
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	mov r1, #8
	bl MemAlloc
	ldr r1, _022FF57C ; =ov11_02324D14
	mvn r2, #1
	str r0, [r1, #4]
	strb r2, [r0]
	ldrsh ip, [r1]
	add r0, r2, #1
	ldr r3, _022FF580 ; =ov11_0238A078
	cmp ip, r0
	ldr r0, [r1, #4]
	moveq r1, #0
	movne r1, #2
	str r1, [r0, #4]
	ldr r0, _022FF57C ; =ov11_02324D14
	mov r1, #8
	ldr r2, [r0, #4]
	strh ip, [r2, #0x1c]
	ldr r0, [r0, #4]
	add r2, r0, #0x14
_022FF558:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF558
#ifdef JAPAN
	ldr r0, _022FF57C ; =ov11_02324D14
	mov r1, #0x1b4
	strh r1, [r0, #2]
	mov r0, #1
#else
	ldr r2, _022FF584 ; =0x000001AF
	ldr r1, _022FF57C ; =ov11_02324D14
	mov r0, #1
	strh r2, [r1, #2]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF57C: .word ov11_02324D14
_022FF580: .word ov11_0238A078
#if defined(EUROPE)
_022FF584: .word 0x000001CB
#elif !defined(JAPAN)
_022FF584: .word 0x000001AF
#endif
	arm_func_end ov11_022FF500

	arm_func_start ov11_022FF588
ov11_022FF588: ; 0x022FF588
	stmdb sp!, {r3, lr}
	ldr r0, _022FF5CC ; =ov11_02324D14
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FF5B0
	bl CloseAdvancedMenu
_022FF5B0:
	ldr r0, _022FF5CC ; =ov11_02324D14
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF5CC ; =ov11_02324D14
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF5CC: .word ov11_02324D14
	arm_func_end ov11_022FF588

	arm_func_start ov11_022FF5D0
ov11_022FF5D0: ; 0x022FF5D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x128
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FF9D4
_022FF5F0: ; jump table
	b _022FF608 ; case 0
	b _022FF694 ; case 1
	b _022FF724 ; case 2
	b _022FF8B8 ; case 3
	b _022FF950 ; case 4
	b _022FF9C4 ; case 5
_022FF608:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF644
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF644:
	ldr r0, _022FF9E0 ; =ov11_02324D14
#ifdef JAPAN
	mov r1, #0x1b4
#else
	ldr r1, _022FF9E4 ; =0x000001AF
#endif
	ldr r2, [r0, #4]
	ldr r0, _022FF9E8 ; =ov11_023224AC
	ldrsh r4, [r2, #0x1c]
	ldr r3, _022FF9EC ; =ov11_022FF9FC
	add r2, sp, #0x90
	str r4, [sp, #0x90]
	str r1, [sp]
	mov r4, #0xa
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF694:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _022FF6EC
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r2, #0
	ldr r1, [r0, #4]
	strh r2, [r1, #0x1c]
	ldr r0, [r0, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF6EC:
	ldr r1, _022FF9E0 ; =ov11_02324D14
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0x1c]
	cmp r2, r0
	beq _022FF710
	strh r0, [r3, #0x1c]
	ldr r0, [r1, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
_022FF710:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF724:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF760
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF760:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0x1c]
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022FF9F0 ; =ov11_023224BC
	add r0, sp, #0x10
	mov r3, r2
	mov r5, #0
	bl sprintf
	add r0, sp, #0x10
	bl sub_02008BA8
	cmp r0, #0
	ldrle r0, _022FF9E0 ; =ov11_02324D14
	movle r1, r5
	ldrle r0, [r0, #4]
	strle r1, [r0, #4]
	ble _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	add r1, sp, #0x10
	ldr r0, [r0, #4]
	mov r2, #8
	add r0, r0, #8
	bl LoadFileFromRomVeneer
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	ldrh r1, [r1]
	str r1, [r2, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bgt _022FF800
	add r0, r1, #8
	bl UnloadFile
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, r5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF800:
	add r0, r1, #0x14
	bl ov11_022E4630
	cmp r0, #0
	bne _022FF86C
	ldr r8, _022FF9E0 ; =ov11_02324D14
	mov r7, r5
	ldr r0, [r8, #4]
	add r4, sp, #8
	ldr r6, [r0, #8]
	b _022FF85C
_022FF828:
	mov r0, r7, lsl #3
	add r1, r0, #2
	mov r0, r4
	add r1, r6, r1
	bl ov11_022E4600
	ldr r1, [r8, #4]
	mov r0, r4
	add r1, r1, #0x14
	bl ov11_022E465C
	cmp r0, #0
	movne r5, r7
	bne _022FF86C
	add r7, r7, #1
_022FF85C:
	ldr r0, [r8, #4]
	ldr r0, [r0, #0x10]
	cmp r7, r0
	blt _022FF828
_022FF86C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	str r5, [sp, #0x90]
	ldr r1, [r0, #4]
	ldr r0, _022FF9E8 ; =ov11_023224AC
	ldr r1, [r1, #0x10]
	ldr r3, _022FF9F4 ; =ov11_022FFA14
	str r1, [sp]
	mov r4, #0xa
	add r2, sp, #0x90
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r2, #3
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF8B8:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF9E0 ; =ov11_02324D14
	movlt r1, #0
	ldrlt r0, [r0, #4]
	strlt r1, [r0, #4]
	blt _022FF93C
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r0, r0, lsl #3
	ldr r3, [r1, #4]
	add r1, r0, #2
	ldr r2, [r3, #8]
	add r0, r3, #0x14
	add r1, r2, r1
	bl ov11_022E4600
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, _022FF9F8 ; =ov11_0238A078
	ldr r4, [r0, #4]
	mov r1, #8
	add r3, r4, #0x14
_022FF924:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF924
	mov r0, #4
	str r0, [r4, #4]
_022FF93C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl UnloadFile
	b _022FF9D4
_022FF950:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF98C
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF98C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, _022FF9F8 ; =ov11_0238A078
	ldr r5, [r0, #4]
	mov r1, #8
	ldrsh r4, [r5, #0x1c]
	add r3, r5, #0x14
	strh r4, [r0, #2]
_022FF9A8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF9A8
	mov r0, #5
	str r0, [r5, #4]
	b _022FF9D4
_022FF9C4:
	mov r0, #6
	str r0, [r1, #4]
	mov r0, #4
	b _022FF9D8
_022FF9D4:
	mov r0, #1
_022FF9D8:
	add sp, sp, #0x128
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FF9E0: .word ov11_02324D14
#if defined(EUROPE)
_022FF9E4: .word 0x000001CB
#elif !defined(JAPAN)
_022FF9E4: .word 0x000001AF
#endif
_022FF9E8: .word ov11_023224AC
_022FF9EC: .word ov11_022FF9FC
_022FF9F0: .word ov11_023224BC
_022FF9F4: .word ov11_022FFA14
_022FF9F8: .word ov11_0238A078
	arm_func_end ov11_022FF5D0

	arm_func_start ov11_022FF9FC
ov11_022FF9FC: ; 0x022FF9FC
	ldr r2, _022FFA10 ; =EVENTS
	mov r0, #0xc
	mla r0, r1, r0, r2
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022FFA10: .word EVENTS
	arm_func_end ov11_022FF9FC

	arm_func_start ov11_022FFA14
ov11_022FFA14: ; 0x022FFA14
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022FFA58 ; =ov11_02324D14
	mov r1, r1, lsl #3
	ldr r2, [r2, #4]
	mov r4, r0
	ldr r2, [r2, #8]
	add r1, r1, #2
	add r0, sp, #0
	add r1, r2, r1
	bl ov11_022E4600
	add r0, sp, #0
	mov r1, r4
	bl ov11_022E466C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FFA58: .word ov11_02324D14
	arm_func_end ov11_022FFA14

	arm_func_start ov11_022FFA5C
ov11_022FFA5C: ; 0x022FFA5C
	ldr r2, _022FFAA0 ; =ov11_02324D14
	ldr r3, _022FFAA4 ; =ov11_0238A078
	ldrsh ip, [r2, #2]
	mov r2, #8
	strh ip, [r0]
_022FFA70:
	ldrb r0, [r3], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022FFA70
#ifdef JAPAN
	ldr r0, _022FFAA0 ; =ov11_02324D14
	ldrsh r0, [r0, #2]
	cmp r0, #0x1b4
#else
	ldr r1, _022FFAA0 ; =ov11_02324D14
	ldr r0, _022FFAA8 ; =0x000001AF
	ldrsh r1, [r1, #2]
	cmp r1, r0
#endif
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FFAA0: .word ov11_02324D14
_022FFAA4: .word ov11_0238A078
#if defined(EUROPE)
_022FFAA8: .word 0x000001CB
#elif !defined(JAPAN)
_022FFAA8: .word 0x000001AF
#endif
	arm_func_end ov11_022FFA5C

	arm_func_start ov11_022FFAAC
ov11_022FFAAC: ; 0x022FFAAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FFAE4 ; =ov11_023224FC
	mov r4, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FFAE8 ; =ov11_0238A080
	ldr r0, _022FFAEC ; =ov11_02324D1C
	str r5, [r1]
	strh r4, [r0, #2]
	mov r1, #0xd5
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FFAE4: .word ov11_023224FC
_022FFAE8: .word ov11_0238A080
_022FFAEC: .word ov11_02324D1C
	arm_func_end ov11_022FFAAC

	arm_func_start ov11_022FFAF0
ov11_022FFAF0: ; 0x022FFAF0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _022FFE60 ; =0x00000518
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FFE64 ; =ov11_0238A080
	ldr r2, _022FFE68 ; =ov11_02324D1C
	ldr r1, [r1]
	str r0, [r2, #4]
	str r1, [r0, #8]
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	streqb r0, [r1, #0xc]
	beq _022FFB48
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0xc]
	movne r0, r4
	strneb r0, [r1, #0xc]
_022FFB48:
	ldr r5, _022FFE68 ; =ov11_02324D1C
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _022FFBA8
	mov r6, #0
_022FFB60:
	add r0, r6, #0xb4
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFB98
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFB98:
	add r6, r6, #1
	cmp r6, #0xb
	blt _022FFB60
	b _022FFE08
_022FFBA8:
	cmp r0, #3
	bne _022FFBFC
	mov r6, #0
_022FFBB4:
	add r0, r6, #0xbf
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFBEC
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFBEC:
	add r6, r6, #1
	cmp r6, #0xa
	blt _022FFBB4
	b _022FFE08
_022FFBFC:
	cmp r0, #4
	bne _022FFCB4
	mov r6, #0
_022FFC08:
	mov r0, r6, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x6f
	blt _022FFC20
	cmp r7, #0xa4
	ble _022FFCA4
_022FFC20:
	mov r0, r7
	bl GetDungeonMode
	mov r8, r0
	mov r0, r7
	bl DungeonSwapIdxToId
	bl GetMaxReachedFloor
	cmp r0, #0
	ble _022FFCA4
	cmp r7, #0x26
	cmpne r7, #0x29
	bne _022FFC78
	sub r0, r8, #2
	cmp r0, #1
	bhi _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
	b _022FFCA4
_022FFC78:
	cmp r7, #0x36
	beq _022FFCA4
	cmp r8, #3
	bne _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
_022FFCA4:
	add r6, r6, #1
	cmp r6, #0xae
	ble _022FFC08
	b _022FFE08
_022FFCB4:
	cmp r0, #1
	mov r5, #0
	bne _022FFD08
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FFD08
_022FFCD0: ; jump table
	b _022FFCE4 ; case 0
	b _022FFCEC ; case 1
	b _022FFCF4 ; case 2
	b _022FFCFC ; case 3
	b _022FFD04 ; case 4
_022FFCE4:
	ldr r5, _022FFE6C ; =ov11_023224D0
	b _022FFD08
_022FFCEC:
	ldr r5, _022FFE70 ; =ov11_023224DC
	b _022FFD08
_022FFCF4:
	ldr r5, _022FFE74 ; =ov11_023224EA
	b _022FFD08
_022FFCFC:
	ldr r5, _022FFE78 ; =ov11_0232251C
	b _022FFD08
_022FFD04:
	ldr r5, _022FFE7C ; =ov11_02322548
_022FFD08:
	cmp r5, #0
	beq _022FFD60
	ldr r7, _022FFE68 ; =ov11_02324D1C
	mvn r6, #0
	b _022FFD50
_022FFD1C:
	ldrsh r8, [r5], #2
	mov r0, r8
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	bne _022FFD50
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #1
	strh r8, [r1, #0x18]
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFD50:
	ldrsh r0, [r5]
	cmp r0, r6
	bne _022FFD1C
	b _022FFE08
_022FFD60:
	mov r7, #0xd4
	ldr r5, _022FFE68 ; =ov11_02324D1C
	mov r8, #0
	mov r6, r7
_022FFD70:
	ldr r1, [r5, #4]
	mov r0, r8, lsl #0x10
	ldr r1, [r1, #8]
	mov sb, r0, asr #0x10
	cmp r1, #0
	bne _022FFDA0
	cmp sb, #0xb0
	beq _022FFDFC
	cmp sb, #0x7b
	blt _022FFDA0
	cmp sb, #0xa4
	ble _022FFDFC
_022FFDA0:
	mov r0, sb
	bl GetDungeonMode
	mov sl, r0
	cmp sl, #1
	cmpne sl, #3
	bne _022FFDFC
	ldr r0, [r5, #4]
	cmp sb, #6
	add r0, r0, r4, lsl #1
	strh sb, [r0, #0x18]
	bne _022FFDEC
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	ldreq r1, [r5, #4]
	moveq sl, r0
	addeq r0, r1, r4, lsl #1
	streqh r6, [r0, #0x18]
_022FFDEC:
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str sl, [r0, #0x1c4]
	add r4, r4, #1
_022FFDFC:
	add r8, r8, #1
	cmp r8, #0xb4
	blt _022FFD70
_022FFE08:
	ldr r0, _022FFE68 ; =ov11_02324D1C
	mvn r2, #1
	ldr r1, [r0, #4]
	cmp r4, #0
	strb r2, [r1]
	ldr r1, [r0, #4]
	strb r2, [r1, #1]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r1, [r0, #4]
	str r4, [r1, #0x14]
	addeq r1, r2, #1
	streqh r1, [r0]
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	mov r1, #0xd5
	strh r1, [r0]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FFE60: .word 0x00000518
_022FFE64: .word ov11_0238A080
_022FFE68: .word ov11_02324D1C
_022FFE6C: .word ov11_023224D0
_022FFE70: .word ov11_023224DC
_022FFE74: .word ov11_023224EA
_022FFE78: .word ov11_0232251C
_022FFE7C: .word ov11_02322548
	arm_func_end ov11_022FFAF0

	arm_func_start ov11_022FFE80
ov11_022FFE80: ; 0x022FFE80
	stmdb sp!, {r3, lr}
	ldr r0, _022FFEFC ; =ov11_02324D1C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FFEA8
	bl CloseAdvancedMenu
_022FFEA8:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _022FFEC4
	bl CloseDialogueBox
_022FFEC4:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _022FFEE0
	bl CloseParentMenu
_022FFEE0:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FFEFC: .word ov11_02324D1C
	arm_func_end ov11_022FFE80

	arm_func_start ov11_022FFF00
ov11_022FFF00: ; 0x022FFF00
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xf0
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r2, [r0, #4]
	ldr r0, [r2, #4]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02300570
_022FFF20: ; jump table
	b _022FFF4C ; case 0
	b _022FFF90 ; case 1
	b _02300024 ; case 2
	b _02300040 ; case 3
	b _0230018C ; case 4
	b _02300218 ; case 5
	b _02300300 ; case 6
	b _02300570 ; case 7
	b _023003E4 ; case 8
	b _02300458 ; case 9
	b _02300560 ; case 10
_022FFF4C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _022FFF84
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	mov r0, #2
	bl WorldMapSetMode
	bl ov11_0230E964
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_022FFF84:
	mov r0, #3
	str r0, [r2, #4]
	b _02300570
_022FFF90:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #0
	ldr lr, [r0, #4]
	mov r2, r1
	ldrsh r3, [r0, #2]
	ldr ip, [lr, #0x14]
	b _022FFFD0
_022FFFB8:
	add r0, lr, r2, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r3, r0
	moveq r1, r2
	beq _022FFFD8
	add r2, r2, #1
_022FFFD0:
	cmp r2, ip
	blt _022FFFB8
_022FFFD8:
	add r0, lr, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl WorldMapSetCamera
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300024:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02300040:
	ldr r2, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr ip, [r2, #4]
	ldrsb r0, [ip, #1]
	cmp r0, r1
	ldreqsb r3, [ip, #2]
	cmpeq r3, r1
	beq _023000F8
	mvn r1, #1
	cmp r0, r1
	beq _02300078
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300570
_02300078:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0230009C
	bl IsParentMenuActive
	cmp r0, #0
	bne _02300570
_0230009C:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023000C8
	bl CloseDialogueBox
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_023000C8:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300570
	bl CloseParentMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	b _02300570
_023000F8:
	ldrsb r0, [ip]
	cmp r0, r1
	bne _02300178
	mov r1, #0
	str r1, [sp, #0x58]
	ldrsh r2, [r2, #2]
	ldr r3, [ip, #0x14]
	b _02300130
_02300118:
	add r0, ip, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r2, r0
	streq r1, [sp, #0x58]
	beq _02300138
	add r1, r1, #1
_02300130:
	cmp r1, r3
	blt _02300118
_02300138:
	ldr r1, _02300580 ; =0x0000022E
	mov r0, #0x10
	strh r1, [sp, #0x60]
	str r0, [sp, #0x64]
	ldr ip, [ip, #0x14]
	ldr r0, _02300584 ; =ov11_0232250C
	str ip, [sp]
	mov ip, #8
	ldr r1, _02300588 ; =0x00801833
	ldr r3, _0230058C ; =ov11_023005A0
	add r2, sp, #0x58
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1]
_02300178:
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_0230018C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _023001F4
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl WorldMapSetCamera
_023001F4:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300218:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _0230027C
	ldrsb r0, [r2]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0xe]
	cmp r2, r0
	beq _0230027C
	strh r0, [r3, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #0xc
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F138
_0230027C:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _023002E4
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _023002C4
	bl ov11_0230CFF4
_023002C4:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r3, #0
	ldr r2, [r0, #4]
	mov r1, #9
	str r3, [r2, #0x10]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023002E4:
	ldr r1, _0230057C ; =ov11_02324D1C
	mov r2, #6
	ldr r3, [r1, #4]
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02300570
_02300300:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300340
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _02300570
_02300340:
	ldrsb r0, [r2, #1]
	cmp r0, r1
	bne _02300398
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strb r0, [r2, #1]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	strh r0, [r1, #2]
	bl DungeonSwapIdxToId
#ifdef JAPAN
	ldr r2, _0230057C ; =ov11_02324D1C
	ldr r1, _02300590 ; =0x00000408
	ldr r2, [r2, #4]
	str r0, [sp, #0x18]
	ldrsb r0, [r2, #1]
	add r3, sp, #8
	add r2, r1, #0x2e
#else
	ldr r1, _0230057C ; =ov11_02324D1C
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	ldr r1, _02300590 ; =0x00000408
	ldrsb r0, [r0, #1]
	ldr r2, _02300594 ; =0x0000022F
	add r3, sp, #8
#endif
	bl ShowStringIdInDialogueBox
_02300398:
	ldr r1, _0230057C ; =ov11_02324D1C
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _023003D0
	mov r0, #0
	ldr r1, _02300598 ; =0x00400013
	ldr r3, _0230059C ; =ov11_02322530
	mov r2, r0
	bl CreateParentMenuFromStringIds
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
_023003D0:
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023003E4:
	ldrsb r0, [r2, #2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl GetSimpleMenuResult__0202AEA4
	cmp r0, #2
	bne _02300430
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300430:
	cmp r0, #1
	ldreq r0, _0230057C ; =ov11_02324D1C
	moveq r1, #3
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	ldrne r0, _0230057C ; =ov11_02324D1C
	movne r1, #9
	ldrne r0, [r0, #4]
	strne r1, [r0, #4]
	b _02300570
_02300458:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300494
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_02300494:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023004B8
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300570
_023004B8:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _023004DC
	bl IsParentMenuActive
	cmp r0, #0
	bne _02300570
_023004DC:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02300508
	bl CloseDialogueBox
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_02300508:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300534
	bl CloseParentMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
_02300534:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	mvnlt r1, #0
	addge r1, r2, r1, lsl #1
	ldrgesh r1, [r1, #0x18]
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r2, #4]
	b _02300570
_02300560:
	mov r0, #0xb
	str r0, [r2, #4]
	mov r0, #4
	b _02300574
_02300570:
	mov r0, #1
_02300574:
	add sp, sp, #0xf0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230057C: .word ov11_02324D1C
#ifdef JAPAN
_02300580: .word 0x00000435
#else
_02300580: .word 0x0000022E
#endif
_02300584: .word ov11_0232250C
_02300588: .word 0x00801833
_0230058C: .word ov11_023005A0
_02300590: .word 0x00000408
#ifndef JAPAN
_02300594: .word 0x0000022F
#endif
_02300598: .word 0x00400013
_0230059C: .word ov11_02322530
	arm_func_end ov11_022FFF00

	arm_func_start ov11_023005A0
ov11_023005A0: ; 0x023005A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r2, _02300660 ; =ov11_02324D1C
	mov r8, r0
	ldr r2, [r2, #4]
	add r0, r2, r1, lsl #1
	ldrsh r4, [r0, #0x18]
	add r0, r2, r1, lsl #2
	ldr r5, [r0, #0x1c4]
	mov r0, r4
	bl DungeonSwapIdxToId
	ldr r1, _02300660 ; =ov11_02324D1C
	mov r6, r0
	ldr r1, [r1, #4]
	ldr r7, _02300664 ; =ov11_0232256C
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _0230060C
	cmp r5, #1
	ldreq r7, _02300668 ; =ov11_02322574
	beq _02300630
	cmp r5, #3
	bne _02300630
	bl AnyDungeonRequestsDone
	cmp r0, #0
	ldrne r7, _0230066C ; =ov11_02322580
	b _02300630
_0230060C:
	sub r0, r1, #2
	cmp r0, #1
	bhi _02300630
	cmp r4, #0xbe
	beq _02300630
	mov r0, r4
	bl sub_0204CF0C
	cmp r0, #0
	ldrne r7, _02300670 ; =ov11_0232258C
_02300630:
	ldr r2, _02300674 ; =ov11_02322598
	ldr r3, _02300678 ; =0x0000C402
	add r4, sp, #4
	mov r0, r8
	str r6, [sp, #0x14]
	str r7, [sp, #0x3c]
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r0, r8
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02300660: .word ov11_02324D1C
_02300664: .word ov11_0232256C
_02300668: .word ov11_02322574
_0230066C: .word ov11_02322580
_02300670: .word ov11_0232258C
_02300674: .word ov11_02322598
_02300678: .word 0x0000C402
	arm_func_end ov11_023005A0

	arm_func_start ov11_0230067C
ov11_0230067C: ; 0x0230067C
	ldr r1, _023006A0 ; =ov11_02324D1C
	ldrsh r2, [r1]
	strh r2, [r0]
	ldrsh r0, [r1]
	cmp r0, #0xd5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023006A0: .word ov11_02324D1C
	arm_func_end ov11_0230067C

	arm_func_start ov11_023006A4
ov11_023006A4: ; 0x023006A4
	stmdb sp!, {r3, lr}
	ldr r0, _023006D8 ; =ov11_02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _023006D8 ; =ov11_02324D24
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023006D8: .word ov11_02324D24
	arm_func_end ov11_023006A4

	arm_func_start ov11_023006DC
ov11_023006DC: ; 0x023006DC
	stmdb sp!, {r3, lr}
	ldr r0, _02300720 ; =ov11_02324D24
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _02300724 ; =ov11_023225BC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300720: .word ov11_02324D24
_02300724: .word ov11_023225BC
	arm_func_end ov11_023006DC

	arm_func_start ov11_02300728
ov11_02300728: ; 0x02300728
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_023006A4
	ldr r0, _023007A4 ; =ov11_02324D24
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl strcpy
	ldr r0, _023007A4 ; =ov11_02324D24
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl CopyOrInitPreprocessorArgs
	ldr r1, _023007A4 ; =ov11_02324D24
	ldr r0, _023007A8 ; =ov11_023225BC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _023007A8 ; =ov11_023225BC
	bl InitMenu
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023007A4: .word ov11_02324D24
_023007A8: .word ov11_023225BC
	arm_func_end ov11_02300728

	arm_func_start ov11_023007AC
ov11_023007AC: ; 0x023007AC
	stmdb sp!, {r3, lr}
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r1, _023007E8 ; =ov11_02324D24
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, _023007EC ; =ov11_023225CC
	bl CreateDialogueBox
	ldr r1, _023007E8 ; =ov11_02324D24
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023007E8: .word ov11_02324D24
_023007EC: .word ov11_023225CC
	arm_func_end ov11_023007AC

	arm_func_start ov11_023007F0
ov11_023007F0: ; 0x023007F0
	stmdb sp!, {r3, lr}
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0]
	cmp r0, #0
	beq _02300824
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300848 ; =ov11_02324D24
	mov r1, #0
	str r1, [r0]
_02300824:
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300848 ; =ov11_02324D24
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300848: .word ov11_02324D24
	arm_func_end ov11_023007F0

	arm_func_start ov11_0230084C
ov11_0230084C: ; 0x0230084C
	stmdb sp!, {r3, lr}
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02300A18
_02300868: ; jump table
	b _02300880 ; case 0
	b _023008A4 ; case 1
	b _02300964 ; case 2
	b _02300990 ; case 3
	b _023009C4 ; case 4
	b _023009F4 ; case 5
_02300880:
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _02300A18
	mov r1, #1
	mov r0, #0
	str r1, [r3, #4]
	bl ov11_022E9BD0
	b _02300A18
_023008A4:
	ldr r2, [r0, #4]
	ldr r1, _02300A24 ; =0x00000408
	ldr r0, [r2, #0x45c]
	cmp r0, #0
	ldr r0, [r2]
	movge r1, #0x20
	cmp r0, #1
	beq _023008D0
	cmp r0, #2
	beq _023008EC
	b _02300904
_023008D0:
	ldr r2, _02300A20 ; =ov11_02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowStringIdInDialogueBox
	b _02300904
_023008EC:
	ldr r2, _02300A20 ; =ov11_02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl ShowStringInDialogueBox
_02300904:
	ldr r0, _02300A20 ; =ov11_02324D24
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x458]
	str r2, [r1, #8]
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x45c]
	str r2, [r1, #0xc]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x45c]
	cmp r1, #0
	blt _02300940
	ldr r0, [r0]
	mov r2, r1
	ldrsb r0, [r0]
	bl sub_0202F190
_02300940:
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9B84
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_02300964:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r2, #3
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F3F8
	b _02300A18
_02300990:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9BD0
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009C4:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009F4:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	bne _02300A18
	mov r0, #0
	bl ov11_022E9B84
	mov r0, #4
	ldmia sp!, {r3, pc}
_02300A18:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A20: .word ov11_02324D24
_02300A24: .word 0x00000408
	arm_func_end ov11_0230084C

	arm_func_start ov11_02300A28
ov11_02300A28: ; 0x02300A28
	stmdb sp!, {r3, lr}
	ldr r0, _02300A5C ; =ov11_02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300A5C ; =ov11_02324D2C
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A5C: .word ov11_02324D2C
	arm_func_end ov11_02300A28

	arm_func_start ov11_02300A60
ov11_02300A60: ; 0x02300A60
	stmdb sp!, {r3, lr}
	ldr r0, _02300AC4 ; =ov11_02324D2C
	ldr r1, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	beq _02300A8C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	ldmia sp!, {r3, pc}
_02300A8C:
	cmp r0, #0
	beq _02300AA8
	ldr r0, [r0]
	cmp r0, #0
	beq _02300ABC
	mov r0, #1
	ldmia sp!, {r3, pc}
_02300AA8:
	ldr r0, _02300AC8 ; =ov11_023225DC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02300ABC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300AC4: .word ov11_02324D2C
_02300AC8: .word ov11_023225DC
	arm_func_end ov11_02300A60

	arm_func_start ov11_02300ACC
ov11_02300ACC: ; 0x02300ACC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_02300A28
	ldr r0, _02300B48 ; =ov11_02324D2C
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl strcpy
	ldr r0, _02300B48 ; =ov11_02324D2C
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl CopyOrInitPreprocessorArgs
	ldr r1, _02300B48 ; =ov11_02324D2C
	ldr r0, _02300B4C ; =ov11_023225DC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02300B4C ; =ov11_023225DC
	bl InitMenu
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02300B48: .word ov11_02324D2C
_02300B4C: .word ov11_023225DC
	arm_func_end ov11_02300ACC

	arm_func_start ov11_02300B50
ov11_02300B50: ; 0x02300B50
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300B94 ; =ov11_02324D2C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, _02300B98 ; =ov11_023225EC
	strb r2, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02300B94 ; =ov11_02324D2C
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300B94: .word ov11_02324D2C
_02300B98: .word ov11_023225EC
	arm_func_end ov11_02300B50

	arm_func_start ov11_02300B9C
ov11_02300B9C: ; 0x02300B9C
	stmdb sp!, {r3, lr}
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0]
	cmp r0, #0
	beq _02300BD0
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300BF4 ; =ov11_02324D2C
	mov r1, #0
	str r1, [r0]
_02300BD0:
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300BF4 ; =ov11_02324D2C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300BF4: .word ov11_02324D2C
	arm_func_end ov11_02300B9C

	arm_func_start ov11_02300BF8
ov11_02300BF8: ; 0x02300BF8
	stmdb sp!, {r3, lr}
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _02300C24
	cmp r1, #1
	beq _02300CC8
	cmp r1, #2
	beq _02300D38
	b _02300D50
_02300C24:
	ldr r0, [r0, #4]
	ldr r2, [r0]
	cmp r2, #0
	beq _02300D50
	ldr r0, [r0, #0x458]
	mov r1, #0x218
	cmp r0, #0
	movge r1, #0x20
	cmp r2, #1
	beq _02300C58
	cmp r2, #2
	beq _02300C74
	b _02300C8C
_02300C58:
	ldr r2, _02300D58 ; =ov11_02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowStringIdInDialogueBox
	b _02300C8C
_02300C74:
	ldr r2, _02300D58 ; =ov11_02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl ShowStringInDialogueBox
_02300C8C:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x458]
	cmp r1, #0
	blt _02300CB0
	ldr r0, [r0]
	ldr r2, [r2, #0x45c]
	ldrsb r0, [r0]
	bl sub_0202F190
_02300CB0:
	ldr r0, _02300D58 ; =ov11_02324D2C
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #8]
	ldr r0, [r0]
	str r2, [r0, #4]
_02300CC8:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsDialogueBoxActive
	ldr r1, _02300D58 ; =ov11_02324D2C
	cmp r0, #0
	ldr r2, [r1]
	strb r0, [r2, #8]
	bne _02300D50
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl sub_0202F16C
	cmp r0, #0x10
	cmpne r0, #0
	bne _02300D24
	ldr r0, _02300D58 ; =ov11_02324D2C
	mov r3, #2
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
	b _02300D50
_02300D24:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F2C4
	b _02300D50
_02300D38:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
_02300D50:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D58: .word ov11_02324D2C
	arm_func_end ov11_02300BF8

	arm_func_start ov11_02300D5C
ov11_02300D5C: ; 0x02300D5C
	stmdb sp!, {r3, lr}
	ldr r0, _02300D80 ; =ov11_0232260C
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02300D84 ; =ov11_02324D34
	movne r1, #0
	strne r1, [r0, #8]
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D80: .word ov11_0232260C
_02300D84: .word ov11_02324D34
	arm_func_end ov11_02300D5C

	arm_func_start CreateTopGroundMenu
CreateTopGroundMenu: ; 0x02300D88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x98
	bl GetGameMode
	mov r4, r0
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	add r2, r4, #0xff
	ldr r1, _02300ED8 ; =ov11_02324D34
	and r2, r2, #0xff
	cmp r2, #1
	str r0, [r1]
	ldrls r8, _02300EDC ; =ov11_02322684
	bls _02300DCC
	cmp r4, #3
	ldreq r8, _02300EE0 ; =ov11_02322654
	ldrne r8, _02300EE4 ; =ov11_0232262C
_02300DCC:
	ldr r0, _02300ED8 ; =ov11_02324D34
	mov fp, #1
	ldr r0, [r0]
	mov sb, r8
	add sl, r0, #8
	add r0, r4, #0xff
	mov r4, #0
	str sl, [sp, #0x60]
	and r6, r0, #0xff
	mov r5, r4
	mov r7, fp
	b _02300E5C
_02300DFC:
	ldr r0, [sb, #4]
	cmp r0, #2
	beq _02300E1C
	cmp r0, #3
	beq _02300E24
	cmp r0, #4
	beq _02300E2C
	b _02300E44
_02300E1C:
	bl IsBagNotEmpty
	b _02300E48
_02300E24:
	mov r0, r7
	b _02300E48
_02300E2C:
	cmp r6, #1
	movhi r0, r4
	bhi _02300E48
	mov r0, r5
	bl ov11_0230488C
	b _02300E48
_02300E44:
	mov r0, fp
_02300E48:
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	strb r0, [sl], #1
	add sb, sb, #8
_02300E5C:
	ldrh r0, [sb]
	cmp r0, #0
	bne _02300DFC
	ldr r0, _02300EE8 ; =ov11_023225FC
	ldr r1, _02300EEC ; =0x00400213
	add r2, sp, #0
	mov r3, r8
	bl CreateParentMenuFromStringIds
	ldr r2, _02300ED8 ; =ov11_02324D34
	mov r1, #0x13
	ldr r3, [r2]
	mov r2, #0
	strb r0, [r3]
	ldr r0, _02300EF0 ; =ov11_0232261C
	mov r3, #0x10000
	bl CreateAreaNameBox
	ldr r1, _02300ED8 ; =ov11_02324D34
	ldr r1, [r1]
	strb r0, [r1, #1]
	bl CreateTeamInfoBox
	ldr r1, _02300ED8 ; =ov11_02324D34
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2, #2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #8]
	str r3, [r1, #4]
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02300ED8: .word ov11_02324D34
_02300EDC: .word ov11_02322684
_02300EE0: .word ov11_02322654
_02300EE4: .word ov11_0232262C
_02300EE8: .word ov11_023225FC
_02300EEC: .word 0x00400213
_02300EF0: .word ov11_0232261C
	arm_func_end CreateTopGroundMenu

	arm_func_start CloseTopGroundMenu
CloseTopGroundMenu: ; 0x02300EF4
	stmdb sp!, {r3, lr}
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAreaNameBox
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseTeamInfoBox
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300F4C ; =ov11_02324D34
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300F4C: .word ov11_02324D34
	arm_func_end CloseTopGroundMenu

	arm_func_start UpdateTopGroundMenu
UpdateTopGroundMenu: ; 0x02300F50
	stmdb sp!, {r3, lr}
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02301130
_02300F6C: ; jump table
	b _02300F80 ; case 0
	b _02300FA4 ; case 1
	b _0230100C ; case 2
	b _02301060 ; case 3
	b _023010B0 ; case 4
_02300F80:
	bl ov11_0230D220
	cmp r0, #0
	bne _02301130
	bl ov11_0230D000
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02300FA4:
	ldrsb r0, [r2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _02301138 ; =ov11_02324D34
	cmp r0, #1
	str r0, [r1, #8]
	ldr r0, [r1]
	movne r1, #2
	strne r1, [r0, #4]
	bne _02301130
	ldrsb r0, [r0, #1]
	bl SetAreaNameBoxState3
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_0230100C:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl SetParentMenuState7
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl SetAreaNameBoxState3
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02301060:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsAreaNameBoxActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl IsTeamInfoBoxActive
	cmp r0, #0
	ldreq r0, _02301138 ; =ov11_02324D34
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02301130
_023010B0:
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0, #8]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230111C
_023010C8: ; jump table
	b _0230111C ; case 0
	b _0230111C ; case 1
	b _023010E8 ; case 2
	b _023010F4 ; case 3
	b _02301100 ; case 4
	b _02301110 ; case 5
	b _0230111C ; case 6
	b _0230111C ; case 7
_023010E8:
	bl ov11_02304AE0
	mov r0, #4
	ldmia sp!, {r3, pc}
_023010F4:
	bl ov11_02304BC4
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301100:
	mov r0, #0
	bl ov11_023048AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301110:
	bl ov11_02301174
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230111C:
	ldr r1, _02301138 ; =ov11_02324D34
	mov r0, #4
	ldr r2, [r1, #8]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
_02301130:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301138: .word ov11_02324D34
	arm_func_end UpdateTopGroundMenu

	arm_func_start ov11_0230113C
ov11_0230113C: ; 0x0230113C
	ldr r1, _02301148 ; =ov11_02324D34
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_02301148: .word ov11_02324D34
	arm_func_end ov11_0230113C

	arm_func_start ov11_0230114C
ov11_0230114C: ; 0x0230114C
	ldr r1, _02301170 ; =ov11_02324D34
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02301170: .word ov11_02324D34
	arm_func_end ov11_0230114C

	arm_func_start ov11_02301174
ov11_02301174: ; 0x02301174
	stmdb sp!, {r3, lr}
	ldr r0, _02301194 ; =ov11_023226C4
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02301198 ; =ov11_02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301194: .word ov11_023226C4
_02301198: .word ov11_02324D40
	arm_func_end ov11_02301174

	arm_func_start GroundBagOthersMenuEntryPoint
GroundBagOthersMenuEntryPoint: ; 0x0230119C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _0230120C ; =ov11_02324D40
	ldr r4, _02301210 ; =0x00000227
	str r0, [r1, #4]
	mov lr, #0x10
	mov ip, #0
	ldr r0, _02301214 ; =ov11_023226B4
	ldr r1, _02301218 ; =0x00001813
	ldr r3, _0230121C ; =ov11_023226D4
	add r2, sp, #0
	strh r4, [sp, #8]
	str lr, [sp, #0xc]
	str ip, [sp]
	bl CreateParentMenuFromStringIds
	ldr r1, _0230120C ; =ov11_02324D40
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230120C: .word ov11_02324D40
#ifdef JAPAN
_02301210: .word 0x0000042E
#else
_02301210: .word 0x00000227
#endif
_02301214: .word ov11_023226B4
_02301218: .word 0x00001813
_0230121C: .word ov11_023226D4
	arm_func_end GroundBagOthersMenuEntryPoint

	arm_func_start GroundBagOthersMenuDestructor
GroundBagOthersMenuDestructor: ; 0x02301220
	stmdb sp!, {r3, lr}
	ldr r0, _02301258 ; =ov11_02324D40
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02301258 ; =ov11_02324D40
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02301258 ; =ov11_02324D40
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301258: .word ov11_02324D40
	arm_func_end GroundBagOthersMenuDestructor

	arm_func_start GroundBagOthersMenuFrameUpdate
GroundBagOthersMenuFrameUpdate: ; 0x0230125C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x130
	ldr r0, _02301398 ; =ov11_02324D40
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _0230128C
	cmp r1, #1
	beq _023012AC
	cmp r1, #2
	beq _023012E4
	b _0230138C
_0230128C:
	ldrsb r0, [r2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	ldreq r0, _02301398 ; =ov11_02324D40
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _0230138C
_023012AC:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0230138C
	ldr r0, _02301398 ; =ov11_02324D40
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _02301398 ; =ov11_02324D40
	mov r2, #2
	str r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _0230138C
_023012E4:
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230137C
_023012FC: ; jump table
	b _0230137C ; case 0
	b _0230131C ; case 1
	b _02301328 ; case 2
	b _0230134C ; case 3
	b _0230137C ; case 4
	b _0230137C ; case 5
	b _0230137C ; case 6
	b _02301370 ; case 7
_0230131C:
	bl ov11_02300D5C
	mov r0, #4
	b _02301390
_02301328:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r2, #0
	add r1, sp, #0x98
	mov r0, #0x100
	str r3, [sp, #0x11c]
	str r2, [sp, #0x120]
	bl sub_0203559C
	mov r0, #4
	b _02301390
_0230134C:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r0, #0
	add r2, sp, #0
	mov r1, #0x100
	str r3, [sp, #0x84]
	str r0, [sp, #0x88]
	bl sub_02035CE4
	mov r0, #4
	b _02301390
_02301370:
	bl ov11_0230A07C
	mov r0, #4
	b _02301390
_0230137C:
	mov r0, #1
	bl ov11_0230113C
	mov r0, #4
	b _02301390
_0230138C:
	mov r0, #1
_02301390:
	add sp, sp, #0x130
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301398: .word ov11_02324D40
_0230139C: .word ov11_023013A0
	arm_func_end GroundBagOthersMenuFrameUpdate

	arm_func_start ov11_023013A0
ov11_023013A0: ; 0x023013A0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	beq _023013B8
	mov r0, #1
	bl ov11_0230113C
	ldmia sp!, {r3, pc}
_023013B8:
	ldr r0, _023013D4 ; =ov11_023226C4
	bl InitMenu
	cmp r0, #0
	ldrne r0, _023013D8 ; =ov11_02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023013D4: .word ov11_023226C4
_023013D8: .word ov11_02324D40
	arm_func_end ov11_023013A0

	arm_func_start ov11_023013DC
ov11_023013DC: ; 0x023013DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x258
	mov r1, #6
	bl MemAlloc
	ldr r1, _023014A8 ; =ov11_02324D48
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #0x1c]
	ldr r0, [r1]
	str r2, [r0, #0x184]
	ldr r0, [r1]
	str r2, [r0, #0xc]
	ldr r0, [r1]
	add r0, r0, #0x188
	bl InitPreprocessorArgs
	ldr r1, _023014A8 ; =ov11_02324D48
	ldrsh r2, [r5, #4]
	ldr r0, [r1]
	cmp r4, #0
	add r0, r0, #0x200
	strh r2, [r0, #0x4c]
	ldrb r2, [r5, #1]
	ldr r0, [r1]
	str r2, [r0, #0x250]
	ldreq r0, [r1]
	mov r2, #0
	streqb r2, [r0, #0x24]
	beq _02301468
	ldrb r0, [r5, #2]
	ldr r3, [r1]
	strb r0, [r3, #0x24]
	ldrb r0, [r5, #3]
	strb r0, [r3, #0x25]
_02301468:
	ldr r0, [r1]
	mvn r3, #1
	strb r2, [r0, #0x25]
	ldr r2, _023014A8 ; =ov11_02324D48
	mov r0, #0
	ldr r4, [r2]
	add r1, r4, #0x200
	ldrsh r1, [r1, #0x4c]
	str r1, [r4, #0x188]
	ldr r1, [r2]
	strb r3, [r1, #0x254]
	ldr r1, [r2]
	strb r3, [r1, #0x255]
	bl ov11_023014AC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023014A8: .word ov11_02324D48
	arm_func_end ov11_023013DC

	arm_func_start ov11_023014AC
ov11_023014AC: ; 0x023014AC
	stmdb sp!, {r3, lr}
	ldr r3, _02301A10 ; =ov11_02324D48
	ldr r1, [r3]
	str r0, [r1]
	ldr r2, [r3]
	ldr r0, [r2]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_023014D0: ; jump table
	b _0230152C ; case 0
	b _023015BC ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _023015F0 ; case 3
	b _02301618 ; case 4
	b _023017B4 ; case 5
	b _0230187C ; case 6
	b _023015D8 ; case 7
	b _023016E8 ; case 8
	b _02301680 ; case 9
	b _02301780 ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301658 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _0230191C ; case 17
	b _02301938 ; case 18
	b _023019A0 ; case 19
	b _023019DC ; case 20
	b _023019F8 ; case 21
	b _02301A04 ; case 22
_0230152C:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301554
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301554:
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _0230157C
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230157C:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, _02301A14 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023015BC:
	bl ov11_02302618
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015D8:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r3]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015F0:
	ldr r0, _02301A18 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301618:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0xe
	str r1, [r0, #4]
	ldr ip, [r3]
	ldr r2, _02301A24 ; =0x0000038F
	ldrsh r0, [ip, #0x14]
	mov r1, #8
	str r0, [ip, #0x19c]
	ldr r3, [r3]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301658:
	ldr r0, _02301A18 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301680:
	add r0, r2, #0x1d8
	bl ZeroInitMissionRewardDataStruct
	ldr r1, _02301A10 ; =ov11_02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301A28 ; =ov11_023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_023016E8:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301730
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301730
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301730:
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301768
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301768:
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301780:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0
	str r1, [r0, #4]
#ifdef JAPAN
	ldr r1, [r3]
	ldr r2, _02303080 ; =0x00003288
	add r0, r1, #0x200
	add r3, r1, #0x188
	ldrsb r0, [r0, #0x54]
	mov r1, #0x18
#else
	ldr r2, [r3]
	mov r1, #0x18
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r2, #0x188
	mov r2, #0x3a4
#endif
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023017B4:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301804
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301A28 ; =ov11_023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =ov11_02324D48
	b _0230180C
_02301804:
	bl GetTeamMember
	ldr r1, _02301A10 ; =ov11_02324D48
_0230180C:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230187C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r3]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301A28 ; =ov11_023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230191C:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301938:
	bl ov11_02310BDC
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, _02301A2C ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023019A0:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl CloseDialogueBox
	ldr r1, _02301A10 ; =ov11_02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019DC:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019F8:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301A04:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301A10: .word ov11_02324D48
#ifdef JAPAN
_02301A14: .word 0x00002479
#else
_02301A14: .word 0x000002A5
#endif
_02301A18: .word ov11_023226FC
_02301A1C: .word 0x00300011
_02301A20: .word ov11_0232271C
#ifdef JAPAN
_02301A24: .word 0x00003273
_02301A28: .word ov11_023226F4
_02303080: .word 0x00003288
_02301A2C: .word 0x00003287
#else
_02301A24: .word 0x0000038F
_02301A28: .word ov11_023226F4
_02301A2C: .word 0x000003A3
#endif
	arm_func_end ov11_023014AC

	arm_func_start ov11_02301A30
ov11_02301A30: ; 0x02301A30
	stmdb sp!, {r3, lr}
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_02301A4C: ; jump table
	b _02301AA8 ; case 0
	b _02301B38 ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02301B6C ; case 3
	b _02301B94 ; case 4
	b _02301D30 ; case 5
	b _02301DF8 ; case 6
	b _02301B54 ; case 7
	b _02301C64 ; case 8
	b _02301BFC ; case 9
	b _02301CFC ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301BD4 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _02301E98 ; case 17
	b _02301EB4 ; case 18
	b _02301F1C ; case 19
	b _02301F58 ; case 20
	b _02301F74 ; case 21
	b _02301F80 ; case 22
_02301AA8:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301AD0
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301AD0:
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _02301AF8
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301AF8:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, _02301F90 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301B38:
	bl ov11_02302618
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B54:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B6C:
	ldr r0, _02301F94 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301B94:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0xe
	str r2, [r1, #4]
	ldr ip, [r0]
	ldr r2, _02301FA0 ; =0x0000038F
	ldrsh r3, [ip, #0x14]
	mov r1, #8
	str r3, [ip, #0x19c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301BD4:
	ldr r0, _02301F94 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301BFC:
	add r0, r2, #0x1d8
	bl ZeroInitMissionRewardDataStruct
	ldr r1, _02301F8C ; =ov11_02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301FA4 ; =ov11_023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_02301C64:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301CAC
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301CAC
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CAC:
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301CE4
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CE4:
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CFC:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #4]
#ifdef JAPAN
	ldr r1, [r0]
	ldr r2, _02303600 ; =0x00003288
	add r0, r1, #0x200
	add r3, r1, #0x188
	ldrsb r0, [r0, #0x54]
	mov r1, #0x18
#else
	ldr r2, [r0]
	mov r1, #0x18
	add r0, r2, #0x200
	add r3, r2, #0x188
	ldrsb r0, [r0, #0x54]
	mov r2, #0x3a4
#endif
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301D30:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301D80
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301FA4 ; =ov11_023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =ov11_02324D48
	b _02301D88
_02301D80:
	bl GetTeamMember
	ldr r1, _02301F8C ; =ov11_02324D48
_02301D88:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301DF8:
	mov r1, #1
	str r1, [r2, #0x20]
	ldr r2, [r0]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301FA4 ; =ov11_023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301E98:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301EB4:
	bl ov11_02310BDC
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, _02301FA8 ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301F1C:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl CloseDialogueBox
	ldr r1, _02301F8C ; =ov11_02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F58:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F74:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301F80:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301F8C: .word ov11_02324D48
#ifdef JAPAN
_02301F90: .word 0x00002479
#else
_02301F90: .word 0x000002A5
#endif
_02301F94: .word ov11_023226FC
_02301F98: .word 0x00300011
_02301F9C: .word ov11_0232271C
#ifdef JAPAN
_02301FA0: .word 0x00003273
_02301FA4: .word ov11_023226F4
_02303600: .word 0x00003288
_02301FA8: .word 0x00003287
#else
_02301FA0: .word 0x0000038F
_02301FA4: .word ov11_023226F4
_02301FA8: .word 0x000003A3
#endif
	arm_func_end ov11_02301A30

	arm_func_start ov11_02301FAC
ov11_02301FAC: ; 0x02301FAC
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_023014AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302000: .word ov11_02324D48
	arm_func_end ov11_02301FAC

	arm_func_start ov11_02302004
ov11_02302004: ; 0x02302004
	stmdb sp!, {r3, lr}
	ldr r0, _0230202C ; =ov11_02324D48
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230202C ; =ov11_02324D48
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230202C: .word ov11_02324D48
	arm_func_end ov11_02302004

	arm_func_start ov11_02302030
ov11_02302030: ; 0x02302030
	stmdb sp!, {r4, lr}
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r0, [r1]
	ldr r2, [r0, #0x184]
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _023025DC
_0230204C: ; jump table
	b _0230205C ; case 0
	b _02302068 ; case 1
	b _023025A4 ; case 2
	b _023025CC ; case 3
_0230205C:
	mov r1, #1
	str r1, [r0, #0x184]
	b _023025DC
_02302068:
	ldr r2, [r0]
	cmp r2, #0x19
	addls pc, pc, r2, lsl #2
	b _02302550
_02302078: ; jump table
	b _023020E0 ; case 0
	b _02302550 ; case 1
	b _023022D4 ; case 2
	b _02302114 ; case 3
	b _0230228C ; case 4
	b _02302550 ; case 5
	b _02302550 ; case 6
	b _02302550 ; case 7
	b _02302550 ; case 8
	b _023021A4 ; case 9
	b _02302550 ; case 10
	b _023022E0 ; case 11
	b _02302550 ; case 12
	b _02302550 ; case 13
	b _0230228C ; case 14
	b _02302480 ; case 15
	b _023024C4 ; case 16
	b _023024EC ; case 17
	b _02302504 ; case 18
	b _0230232C ; case 19
	b _0230232C ; case 20
	b _02302390 ; case 21
	b _023023B8 ; case 22
	b _02302460 ; case 23
	b _02302378 ; case 24
	b _0230250C ; case 25
_023020E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02302554
	mov r0, #3
	bl ov11_023014AC
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	b _02302554
_02302114:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	beq _02302170
	cmp r0, #4
	beq _0230213C
	cmp r0, #5
	beq _02302170
	b _02302554
_0230213C:
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	bl ov11_02302618
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0xf
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0]
	b _02302554
_02302170:
	bl ov11_02302618
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302198
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302198:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021A4:
	bl ov11_02306C9C
	cmp r0, #3
	beq _023021D4
	cmp r0, #4
	bne _02302554
	bl ov11_02306C64
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r1, [r1]
	str r0, [r1, #0x248]
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021D4:
	bl ov11_02306C64
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	ldr r0, [r2, #0x248]
	cmp r0, #0
	bne _0230221C
	add r0, r2, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302210
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302210:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_0230221C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	str r2, [r1, #0xc]
	bl ov11_023014AC
	b _02302554
_0230228C:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	beq _023022C4
	cmp r0, #4
	beq _023022B4
	cmp r0, #5
	beq _023022C4
	b _02302554
_023022B4:
	bl ov11_02302618
	mov r0, #8
	bl ov11_023014AC
	b _02302554
_023022C4:
	bl ov11_02302618
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023022D4:
	bl ov11_0230D71C
	mov r0, #3
	b _02302558
_023022E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0x1a
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_0230232C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02302554
	bl GetKeyboardStringResult
	ldr r1, _023025E4 ; =ov11_02324D48
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x26
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x46
	bl StrcpySimple
	mov r0, #0x18
	bl ov11_023014AC
	b _02302554
_02302378:
	bl sub_02037468
	cmp r0, #0
	beq _02302554
	mov r0, #0x15
	bl ov11_023014AC
	b _02302554
_02302390:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x16
	bl ov11_023014AC
	b _02302554
_023023B8:
	bl sub_0203931C
	cmp r0, #0
	bne _0230243C
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x46
	bl StrcpySimple
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0xa
	ldr r1, [r0]
	ldr r0, [r1, #0x248]
	add r1, r1, #0x6e
	add r0, r0, #0x3a
	add r1, r1, #0x100
	bl StrncpySimple
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl SetNewFriendActor
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #0xf
	ldr r0, [r0]
	add r0, r0, #0x46
	bl sub_02065C08
	mov r0, #0x17
	bl ov11_023014AC
	b _02302554
_0230243C:
	cmp r0, #1
	bne _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0x14
	ldr r1, [r0]
	mov r0, #0x17
	str r2, [r1, #8]
	bl ov11_023014AC
	b _02302554
_02302460:
	bl sub_02039218
	cmp r0, #0
	beq _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023014AC
	b _02302554
_02302480:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _02302554
	cmp r0, #3
	bne _02302554
	ldr r0, [r1, #4]
	bl ov11_023014AC
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _02302554
_023024C4:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x11
	bl ov11_023014AC
	b _02302554
_023024EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02302554
	mov r0, #0x12
	bl ov11_023014AC
	b _02302554
_02302504:
	bl ov11_02301FAC
	b _02302554
_0230250C:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _02302534
	cmp r0, #0xa
	beq _02302544
	b _02302554
_02302534:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_02302544:
	mov r0, #0x13
	bl ov11_023014AC
	b _02302554
_02302550:
	bl ov11_02301FAC
_02302554:
	mov r0, #0
_02302558:
	cmp r0, #3
	bne _023025DC
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r3, #2
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0x184]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl sub_0202836C
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _023025DC
_023025A4:
	mov r2, #3
	str r2, [r0, #0x184]
	ldr r0, [r1]
	sub r1, r2, #5
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl CloseDialogueBox
	b _023025DC
_023025CC:
	ldr r0, [r0, #0x20]
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r4, pc}
_023025DC:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023025E4: .word ov11_02324D48
	arm_func_end ov11_02302030

	arm_func_start ov11_023025E8
ov11_023025E8: ; 0x023025E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302614 ; =ov11_0232270C
	mov r4, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov11_023013DC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302614: .word ov11_0232270C
	arm_func_end ov11_023025E8

	arm_func_start ov11_02302618
ov11_02302618: ; 0x02302618
	stmdb sp!, {r3, lr}
	ldr r0, _02302664 ; =ov11_02324D48
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02302664 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl CloseSimpleMenu
	ldr r0, _02302664 ; =ov11_02324D48
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x255]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302664: .word ov11_02324D48
	arm_func_end ov11_02302618

	arm_func_start ov11_02302668
ov11_02302668: ; 0x02302668
	stmdb sp!, {r3, lr}
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _023027D0
_02302684: ; jump table
	b _023027D0 ; case 0
	b _02302744 ; case 1
	b _0230283C ; case 2
	b _023027D0 ; case 3
	b _023027D0 ; case 4
	b _023027D0 ; case 5
	b _023027D0 ; case 6
	b _023026B8 ; case 7
	b _0230274C ; case 8
	b _023027D0 ; case 9
	b _023027D0 ; case 10
	b _023027D0 ; case 11
	b _0230278C ; case 12
_023026B8:
	bl ov11_02305B98
	cmp r0, #1
	beq _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	add r0, r0, #0xfe
	bl ov11_02305B40
	cmp r0, #3
	beq _023026E8
	cmp r0, #5
	beq _0230271C
	b _0230283C
_023026E8:
	ldr r1, _02302844 ; =ov11_02324D4C
	mov r3, #1
	ldr r0, [r1]
	ldr r2, _02302848 ; =0x00000276
	str r3, [r0, #0x20]
	ldr ip, [r1]
	mov r0, #4
	ldrsh r3, [ip, #0xfe]
	str r3, [ip, #0x44]
	ldr r1, [r1]
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_0230271C:
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0230284C ; =0x00000287
	str r3, [r1, #0x20]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_02302744:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0230274C:
	ldrsb r0, [r2, #0xfc]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl sub_0202F2C4
	b _0230283C
_0230278C:
	ldr r1, [r2, #0xc]
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _0230283C
	cmp r0, #3
	bne _0230283C
	ldr r0, [r1, #4]
	bl ov11_02302850
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0230283C
_023027D0:
	ldrsb r0, [r2, #0xfc]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	cmp r0, r1
	beq _0230282C
	bl sub_0202F2C4
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl CloseDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xfc]
_0230282C:
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_02302850
_0230283C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302844: .word ov11_02324D4C
#ifdef JAPAN
_02302848: .word 0x0000244A
_0230284C: .word 0x0000245B
#else
_02302848: .word 0x00000276
_0230284C: .word 0x00000287
#endif
	arm_func_end ov11_02302668

	arm_func_start ov11_02302850
ov11_02302850: ; 0x02302850
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r1, _02302A44 ; =ov11_02324D4C
	ldr r2, [r1]
	str r0, [r2]
	ldr ip, [r1]
	ldr r0, [ip]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302878: ; jump table
	b _023028A8 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302998 ; case 4
	b _023028B4 ; case 5
	b _023028EC ; case 6
	b _023028C0 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023028A8:
	mov r0, #1
	str r0, [ip]
	b _02302A3C
_023028B4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302A3C
_023028C0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_023028EC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302908: ; jump table
	b _02302938 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302988 ; case 4
	b _02302944 ; case 5
	b _0230297C ; case 6
	b _02302950 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_02302938:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_02302944:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_02302950:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_0230297C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302988:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302998:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_023029B4: ; jump table
	b _023029E4 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302A34 ; case 4
	b _023029F0 ; case 5
	b _02302A24 ; case 6
	b _023029FC ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023029E4:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_023029F0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_023029FC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_02302A24:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302A34:
	str r3, [r1]
	bl ov11_02302A48
_02302A3C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302A44: .word ov11_02324D4C
	arm_func_end ov11_02302850

	arm_func_start ov11_02302A48
ov11_02302A48: ; 0x02302A48
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _02302C34 ; =ov11_02324D4C
	ldr ip, [r0]
	ldr r1, [ip]
	cmp r1, #0xb
	addls pc, pc, r1, lsl #2
	b _02302C2C
_02302A68: ; jump table
	b _02302A98 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B88 ; case 4
	b _02302AA4 ; case 5
	b _02302ADC ; case 6
	b _02302AB0 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302A98:
	mov r0, #1
	str r0, [ip]
	b _02302C2C
_02302AA4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302C2C
_02302AB0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302ADC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302AF8: ; jump table
	b _02302B28 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B78 ; case 4
	b _02302B34 ; case 5
	b _02302B6C ; case 6
	b _02302B40 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302B28:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302B34:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302B40:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302B6C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B78:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B88:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302BA4: ; jump table
	b _02302BD4 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302C24 ; case 4
	b _02302BE0 ; case 5
	b _02302C14 ; case 6
	b _02302BEC ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302BD4:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302BE0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302BEC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302C14:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302C24:
	str r3, [r1]
	bl ov11_02302A48
_02302C2C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302C34: .word ov11_02324D4C
	arm_func_end ov11_02302A48

	arm_func_start ov11_02302C38
ov11_02302C38: ; 0x02302C38
	stmdb sp!, {r3, lr}
	ldr r0, _02302C60 ; =ov11_02324D4C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302C60 ; =ov11_02324D4C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302C60: .word ov11_02324D4C
	arm_func_end ov11_02302C38

	arm_func_start ov11_02302C64
ov11_02302C64: ; 0x02302C64
	stmdb sp!, {r3, lr}
	ldr r0, _02302CDC ; =ov11_02324D4C
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02302CD4
_02302C80: ; jump table
	b _02302C90 ; case 0
	b _02302C9C ; case 1
	b _02302CB8 ; case 2
	b _02302CC4 ; case 3
_02302C90:
	mov r0, #1
	str r0, [r1, #0x28]
	b _02302CD4
_02302C9C:
	bl ov11_02302668
	cmp r0, #3
	ldreq r0, _02302CDC ; =ov11_02324D4C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0x28]
	b _02302CD4
_02302CB8:
	mov r0, #3
	str r0, [r1, #0x28]
	b _02302CD4
_02302CC4:
	ldr r0, [r1, #0x20]
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_02302CD4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302CDC: .word ov11_02324D4C
	arm_func_end ov11_02302C64

	arm_func_start ov11_02302CE0
ov11_02302CE0: ; 0x02302CE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302D84 ; =ov11_02322740
	mov r4, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x104
	mov r1, #6
	bl MemAlloc
	ldr r2, _02302D88 ; =ov11_02324D4C
	mov r1, #0
	str r0, [r2]
	str r1, [r0, #0x1c]
	ldr r0, [r2]
	sub r3, r1, #2
	str r1, [r0, #0x28]
	ldr r0, [r2]
	str r1, [r0, #0xc]
	ldrsh ip, [r5, #4]
	ldr r0, [r2]
	strh ip, [r0, #0xf0]
	ldrh ip, [r5, #2]
	ldr r0, [r2]
	str ip, [r0, #0xf4]
	ldr r0, [r2]
	strb r4, [r0, #0x100]
	ldr r0, [r2]
	strh r1, [r0, #0xfe]
	ldr r0, [r2]
	strb r3, [r0, #0xfc]
	ldr r0, [r2]
	add r0, r0, #0x2c
	bl InitPreprocessorArgs
	ldr r0, _02302D88 ; =ov11_02324D4C
	ldrsh r2, [r5, #4]
	ldr r1, [r0]
	mov r0, #7
	str r2, [r1, #0x3c]
	bl ov11_02302850
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302D84: .word ov11_02322740
_02302D88: .word ov11_02324D4C
	arm_func_end ov11_02302CE0

	arm_func_start ov11_02302D8C
ov11_02302D8C: ; 0x02302D8C
	stmdb sp!, {r3, lr}
	ldr r0, _02302DB4 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302DB4 ; =ov11_02324D4C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302DB4: .word ov11_02324D4C
	arm_func_end ov11_02302D8C

	arm_func_start ov11_02302DB8
ov11_02302DB8: ; 0x02302DB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _023031E4 ; =ov11_02324D4C
#ifdef JAPAN
	ldr r1, [sb, #4]
	ldr r0, [r1]
#else
	ldr r3, [sb, #4]
	ldr r0, [r3]
#endif
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _023031DC
_02302DD4: ; jump table
	b _02302E0C ; case 0
	b _02302E4C ; case 1
	b _02302E74 ; case 2
	b _02302EA8 ; case 3
	b _02302F4C ; case 4
	b _02302FF4 ; case 5
	b _0230301C ; case 6
	b _02303050 ; case 7
	b _02303088 ; case 8
	b _023030F4 ; case 9
	b _0230311C ; case 10
	b _0230313C ; case 11
	b _023031A4 ; case 12
	b _023031C0 ; case 13
_02302E0C:
#ifdef JAPAN
	add r0, r1, #0x3c
	str r0, [r1, #0x174]
#else
	add r0, r3, #0x3c
	str r0, [r3, #0x174]
#endif
	ldr r1, [sb, #4]
	mvn r0, #1
	ldrsb r1, [r1, #9]
	cmp r1, r0
	bne _023031DC
	mov r0, #0
	bl CreateDialogueBox
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #1
	strb r0, [r3, #9]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302E4C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	ldr r2, _023031E8 ; =0x000002C5
	mov r1, #0x10
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0]
	b _023031DC
_02302E74:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #3
	str r1, [r0]
	b _023031DC
_02302EA8:
#ifdef JAPAN
	add r0, r1, #0x3c
	mov r7, #0
	ldr r5, _023031EC ; =ov11_02322780
	str r0, [r1, #0x174]
#else
	add r0, r3, #0x3c
	mov r7, #0
	ldr r5, _023031EC ; =ov11_02322780
	str r0, [r3, #0x174]
#endif
	mov r6, #0x100
	mov r4, r7
_02302EC0:
	ldr r3, [sb, #4]
	mov r0, r7, lsl #3
	add r1, r3, #0x13c
	str r1, [sp]
	ldrh r2, [r5, r0]
	add r8, r7, r7, lsl #6
	add r0, r3, #0x18c
	mov r1, r6
	mov r3, r4
	add r0, r0, r8, lsl #2
	bl PreprocessStringFromId
	add r1, r5, r7, lsl #3
	ldr r0, [sb, #4]
	add r7, r7, #1
	ldr r1, [r1, #4]
	add r0, r0, r8, lsl #2
	str r1, [r0, #0x28c]
	cmp r7, #3
	blt _02302EC0
	mov r1, #3
	ldr r0, _023031E4 ; =ov11_02324D4C
	str r1, [sp]
	ldr r2, [r0, #4]
	ldr r0, _023031F0 ; =ov11_02322750
	ldr r1, _023031F4 ; =0x00300011
	add r3, r2, #0x18c
	mov r2, #0
	bl CreateSimpleMenu
	ldr r1, _023031E4 ; =ov11_02324D4C
	mov r2, #4
	ldr r3, [r1, #4]
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302F4C:
#ifdef JAPAN
	ldrsb r0, [r1, #0xa]
#else
	ldrsb r0, [r3, #0xa]
#endif
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult__0202B870
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02302FA8
	cmp r0, #1
	beq _02302FC4
	cmp r0, #2
	b _02302FE8
_02302FA8:
	ldrsb r0, [r1, #9]
	bl CloseDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xb
	str r1, [r0]
	b _023031DC
_02302FC4:
	ldrsb r0, [r1, #9]
	bl CloseDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl ov11_02302CE0
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02302FE8:
	mov r0, #5
	str r0, [r1]
	b _023031DC
_02302FF4:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
	ldr r2, _023031F8 ; =0x000002C9
	add r3, r1, #0x13c
#else
	ldrsb r0, [r3, #9]
	ldr r2, _023031F8 ; =0x000002C9
	add r3, r3, #0x13c
#endif
	mov r1, #0x10
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #6
	str r1, [r0]
	b _023031DC
_0230301C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #7
	str r1, [r0]
	b _023031DC
_02303050:
	ldr r0, _023031FC ; =ov11_02322760
	mov r4, #2
	ldr r1, _02303200 ; =0x00300013
	ldr r3, _02303204 ; =ov11_02322798
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #8
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02303088:
#ifdef JAPAN
	ldrsb r0, [r1, #0xa]
#else
	ldrsb r0, [r3, #0xa]
#endif
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult__0202B870
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #3
	beq _023030DC
	cmp r0, #4
	b _023030E8
_023030DC:
	mov r0, #9
	str r0, [r1]
	b _023031DC
_023030E8:
	mov r0, #1
	str r0, [r1]
	b _023031DC
_023030F4:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
	ldr r2, _02304864_JP ; =0x00002FEA
	add r3, r1, #0x13c
	mov r1, #0x218
#else
	ldrsb r0, [r3, #9]
	mov r1, #0x218
	add r2, r1, #0xb2
	add r3, r3, #0x13c
#endif
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xa
	str r1, [r0]
	b _023031DC
_0230311C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	moveq r0, sb
	ldreq r0, [r0, #4]
	moveq r1, #0xd
	streq r1, [r0]
	b _023031DC
_0230313C:
#ifdef JAPAN
	add r0, r1, #0x10
#else
	add r0, r3, #0x10
#endif
	bl ZeroInitMissionRewardDataStruct
	mov r0, sb
	ldr r1, [r0, #4]
	mov r3, #1
	str r3, [r1, #0x1c]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1]
	strh r0, [r2, #0x20]
	ldrh r0, [r1, #2]
	strh r0, [r2, #0x22]
	ldrh r0, [r1, #4]
	mov r1, #0
	strh r0, [r2, #0x24]
	ldrb r0, [r2, #8]
	cmp r0, #0
	movne r3, #8
	add r0, r2, #0x10
	orr r2, r3, #6
	bl sub_0203D438
	ldr r0, _023031E4 ; =ov11_02324D4C
	mov r1, #0xc
	ldr r0, [r0, #4]
	str r1, [r0]
	b _023031DC
_023031A4:
	bl sub_0203D538
	cmp r0, #1
	bne _023031DC
	bl FreeMissionRewardStructMain
	bl ReturnScriptMenuResultZero
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031C0:
	bl ReturnScriptMenuResultZero
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl CloseDialogueBox
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023031E4: .word ov11_02324D4C
#ifdef JAPAN
_023031E8: .word 0x00002FE5
#else
_023031E8: .word 0x000002C5
#endif
_023031EC: .word ov11_02322780
_023031F0: .word ov11_02322750
_023031F4: .word 0x00300011
#ifdef JAPAN
_023031F8: .word 0x00002FE9
#else
_023031F8: .word 0x000002C9
#endif
_023031FC: .word ov11_02322760
_02303200: .word 0x00300013
_02303204: .word ov11_02322798
#ifdef JAPAN
_02304864_JP: .word 0x00002FEA
#endif
	arm_func_end ov11_02302DB8

	arm_func_start ov11_02303208
ov11_02303208: ; 0x02303208
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _023032B4 ; =ov11_02322770
	mov r4, r1
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _023032B8 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02303248
	ldr r0, _023032BC ; =0x00000498
	mov r1, #6
	bl MemAlloc
	ldr r1, _023032B8 ; =ov11_02324D4C
	str r0, [r1, #4]
_02303248:
	ldr r0, _023032B8 ; =ov11_02324D4C
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #0
	strb r3, [r2, #9]
	ldr r3, [r0, #4]
	ldr r2, _023032C0 ; =ov11_02322734
	str r5, [r3, #0xc]
	ldr r5, [r0, #4]
	mov r3, #1
	strb r4, [r5, #8]
	ldr r0, [r0, #4]
	str r1, [sp]
	ldr r1, [r0, #0xc]
	add r0, r0, #0x3c
	bl MaybeGetFormattedItemName
	ldr r0, _023032B8 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	add r0, r0, #0x13c
	bl InitPreprocessorArgs
	ldr r0, _023032B8 ; =ov11_02324D4C
	cmp r4, #0
	movne r1, #0xb
	ldr r0, [r0, #4]
	moveq r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023032B4: .word ov11_02322770
_023032B8: .word ov11_02324D4C
_023032BC: .word 0x00000498
_023032C0: .word ov11_02322734
	arm_func_end ov11_02303208

	arm_func_start InitDiaryAndFaqBoardMenu
InitDiaryAndFaqBoardMenu: ; 0x023032C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0xc80
	mov r1, #6
	bl MemAlloc
	ldr r2, _023033F0 ; =ov11_02324D54
	mov r1, #0x5c
	str r0, [r2]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _023033F0 ; =ov11_02324D54
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	sub r2, r3, #2
	ldr r0, [r1, #0x10]
	cmp r0, #0
	movle r0, #5
	strle r0, [r1, #0x10]
	ldr r0, _023033F0 ; =ov11_02324D54
	ldr r1, [r0]
	str r3, [r1, #0x1c]
	ldr r1, [r0]
	str r3, [r1, #0xc24]
	ldr r1, [r0]
	str r3, [r1, #0x14]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #0xc7d]
	ldr r0, [r0]
	add r0, r0, #0x28
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldr r0, _023033F0 ; =ov11_02324D54
#ifdef JAPAN
	ldr r2, _02304A54 ; =0x000032FC
	ldr r1, [r0]
	ldr r3, _023033F4 ; =0x0000C402
	add r0, r1, #0x28
	add r4, r0, #0xc00
	add r0, r1, #0x24
	mov r1, #0x400
#else
	mov r1, #0x400
	ldr r2, [r0]
	ldr r3, _023033F4 ; =0x0000C402
	add r0, r2, #0x28
	add r4, r0, #0xc00
	add r0, r2, #0x24
	add r2, r1, #0x4a
#endif
	str r4, [sp]
	bl PreprocessStringFromId
	ldr r6, _023033F8 ; =ov11_023227B0
	ldr r5, _023033F4 ; =0x0000C402
	ldr r4, _023033F0 ; =ov11_02324D54
	mov r8, #0
	mov r7, #0x400
_02303390:
	ldr r3, [r4]
	mov r1, r7
	add r0, r3, #0x28
	add r0, r0, #0xc00
	str r0, [sp]
	ldr r2, [r3, #4]
	add r0, r3, #0x24
	mov r2, r2, lsl #1
	ldrh r2, [r6, r2]
	add ip, r0, #0x400
	mov r3, r5
	add r0, r8, r2
	mov r2, r0, lsl #0x10
	add r0, ip, r8, lsl #6
	mov r2, r2, lsr #0x10
	bl PreprocessStringFromId
	add r8, r8, #1
	cmp r8, #0x1e
	blt _02303390
	mov r0, #0
	bl ov11_023035C0
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023033F0: .word ov11_02324D54
#ifdef JAPAN
_02304A54: .word 0x000032FC
#endif
_023033F4: .word 0x0000C402
_023033F8: .word ov11_023227B0
	arm_func_end InitDiaryAndFaqBoardMenu

	arm_func_start ov11_023033FC
ov11_023033FC: ; 0x023033FC
	stmdb sp!, {r3, lr}
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _02303538
_02303418: ; jump table
	b _0230344C ; case 0
	b _02303538 ; case 1
	b _023034A0 ; case 2
	b _023035B4 ; case 3
	b _02303538 ; case 4
	b _02303538 ; case 5
	b _02303538 ; case 6
	b _02303538 ; case 7
	b _023034A8 ; case 8
	b _02303538 ; case 9
	b _02303538 ; case 10
	b _02303538 ; case 11
	b _023034F4 ; case 12
_0230344C:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl GetAdvancedMenuResult
	ldr r1, _023035BC ; =ov11_02324D54
	add r2, r0, #1
	ldr r0, [r1]
	str r2, [r0, #0x18]
	ldr r0, [r1]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl CloseAdvancedMenu
	mov r0, #2
	bl ov11_023035C0
	b _023035B4
_023034A0:
	mov r0, #3
	ldmia sp!, {r3, pc}
_023034A8:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl sub_0202F2C4
	b _023035B4
_023034F4:
	ldr r1, [r2, #0x14]
	add r1, r1, #1
	str r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	cmp r0, #1
	cmpne r0, #2
	beq _023035B4
	cmp r0, #3
	bne _023035B4
	ldr r0, [r1, #8]
	bl ov11_023035C0
	ldr r0, _023035BC ; =ov11_02324D54
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _023035B4
_02303538:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	cmp r0, r1
	beq _023035A4
	bl sub_0202F2C4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl CloseDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc7d]
_023035A4:
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023035C0
_023035B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023035BC: .word ov11_02324D54
	arm_func_end ov11_023033FC

	arm_func_start ov11_023035C0
ov11_023035C0: ; 0x023035C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r2, [r1]
	str r0, [r2]
	ldr r3, [r1]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0230371C
_023035E8: ; jump table
	b _02303618 ; case 0
	b _023036A4 ; case 1
	b _023036C0 ; case 2
	b _023036E8 ; case 3
	b _0230371C ; case 4
	b _02303700 ; case 5
	b _023036CC ; case 6
	b _0230371C ; case 7
	b _0230371C ; case 8
	b _0230371C ; case 9
	b _0230371C ; case 10
	b _023036F4 ; case 11
_02303618:
	ldr r0, [r3, #4]
	mov r1, #0
#ifdef JAPAN
	add r0, r0, #0xfe
	add r2, r0, #0x3200
#else
	add r0, r0, #0x4c
	add r2, r0, #0x400
#endif
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _02303728 ; =0x00001813
	add r2, sp, #8
	beq _0230367C
	ldr r0, _0230372C ; =ov11_023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_0230367C:
	ldr r0, _02303734 ; =ov11_023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_023036A4:
	ldr r0, _02303738 ; =ov11_023227E8
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0230371C
_023036C0:
	ldr r0, _0230373C ; =ov11_02322808
	bl Debug_Print0
	b _0230371C
_023036CC:
	ldr r0, _02303740 ; =ov11_02322828
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230371C
_023036E8:
	ldr r0, _02303744 ; =ov11_02322850
	bl Debug_Print0
	b _0230371C
_023036F4:
	ldr r0, _02303748 ; =ov11_0232287C
	bl Debug_Print0
	b _0230371C
_02303700:
	ldr r0, _0230374C ; =ov11_02322894
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_0230371C:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303724: .word ov11_02324D54
_02303728: .word 0x00001813
_0230372C: .word ov11_023227D8
_02303730: .word ov11_02303750
_02303734: .word ov11_023227B8
_02303738: .word ov11_023227E8
_0230373C: .word ov11_02322808
_02303740: .word ov11_02322828
_02303744: .word ov11_02322850
_02303748: .word ov11_0232287C
_0230374C: .word ov11_02322894
	arm_func_end ov11_023035C0

	arm_func_start ov11_02303750
ov11_02303750: ; 0x02303750
	stmdb sp!, {r4, lr}
	ldr r2, _02303778 ; =ov11_02324D54
	mov r4, r0
	ldr r2, [r2]
	add r2, r2, #0x24
	add r2, r2, #0x400
	add r1, r2, r1, lsl #6
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303778: .word ov11_02324D54
	arm_func_end ov11_02303750

	arm_func_start ov11_0230377C
ov11_0230377C: ; 0x0230377C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r0, _023038D8 ; =ov11_02324D54
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _023038D0
_0230379C: ; jump table
	b _023037CC ; case 0
	b _02303858 ; case 1
	b _02303874 ; case 2
	b _0230389C ; case 3
	b _023038D0 ; case 4
	b _023038B4 ; case 5
	b _02303880 ; case 6
	b _023038D0 ; case 7
	b _023038D0 ; case 8
	b _023038D0 ; case 9
	b _023038D0 ; case 10
	b _023038A8 ; case 11
_023037CC:
	ldr r0, [r3, #4]
	mov r1, #0
#ifdef JAPAN
	add r0, r0, #0xfe
	add r2, r0, #0x3200
#else
	add r0, r0, #0x4c
	add r2, r0, #0x400
#endif
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _023038DC ; =0x00001813
	add r2, sp, #8
	beq _02303830
	ldr r0, _023038E0 ; =ov11_023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303830:
	ldr r0, _023038E8 ; =ov11_023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303858:
	ldr r0, _023038EC ; =ov11_023227E8
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _023038D0
_02303874:
	ldr r0, _023038F0 ; =ov11_02322808
	bl Debug_Print0
	b _023038D0
_02303880:
	ldr r0, _023038F4 ; =ov11_02322828
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023038D0
_0230389C:
	ldr r0, _023038F8 ; =ov11_02322850
	bl Debug_Print0
	b _023038D0
_023038A8:
	ldr r0, _023038FC ; =ov11_0232287C
	bl Debug_Print0
	b _023038D0
_023038B4:
	ldr r0, _02303900 ; =ov11_02322894
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_023038D0:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023038D8: .word ov11_02324D54
_023038DC: .word 0x00001813
_023038E0: .word ov11_023227D8
_023038E4: .word ov11_02303750
_023038E8: .word ov11_023227B8
_023038EC: .word ov11_023227E8
_023038F0: .word ov11_02322808
_023038F4: .word ov11_02322828
_023038F8: .word ov11_02322850
_023038FC: .word ov11_0232287C
_02303900: .word ov11_02322894
	arm_func_end ov11_0230377C

	arm_func_start FreeDiaryAndFaqBoardMenuMenu
FreeDiaryAndFaqBoardMenuMenu: ; 0x02303904
	stmdb sp!, {r3, lr}
	ldr r0, _0230392C ; =ov11_02324D54
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230392C ; =ov11_02324D54
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230392C: .word ov11_02324D54
	arm_func_end FreeDiaryAndFaqBoardMenuMenu

	arm_func_start DiaryAndFaqBoardMenuFrameUpdate
DiaryAndFaqBoardMenuFrameUpdate: ; 0x02303930
	stmdb sp!, {r3, lr}
	ldr r0, _023039A8 ; =ov11_02324D54
	ldr r1, [r0]
	ldr r0, [r1, #0xc24]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _023039A0
_0230394C: ; jump table
	b _0230395C ; case 0
	b _02303968 ; case 1
	b _02303984 ; case 2
	b _02303990 ; case 3
_0230395C:
	mov r0, #1
	str r0, [r1, #0xc24]
	b _023039A0
_02303968:
	bl ov11_023033FC
	cmp r0, #3
	ldreq r0, _023039A8 ; =ov11_02324D54
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0xc24]
	b _023039A0
_02303984:
	mov r0, #3
	str r0, [r1, #0xc24]
	b _023039A0
_02303990:
	ldr r0, [r1, #0x18]
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_023039A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023039A8: .word ov11_02324D54
	arm_func_end DiaryAndFaqBoardMenuFrameUpdate

	arm_func_start ov11_023039AC
ov11_023039AC: ; 0x023039AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023039D0 ; =ov11_023227C8
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl InitDiaryAndFaqBoardMenu
	ldmia sp!, {r4, pc}
	.align 2, 0
_023039D0: .word ov11_023227C8
	arm_func_end ov11_023039AC

	arm_func_start ov11_023039D4
ov11_023039D4: ; 0x023039D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x21c
	mov r1, #8
	bl MemAlloc
	ldr r1, _02303AF8 ; =ov11_02324D58
	cmp r4, #0
	str r0, [r1, #4]
	str r4, [r0, #0x14]
	bne _02303A14
	ldr r0, [r1, #4]
	add r0, r0, #0x60
	bl CopyMenuControlWindowExtraInfo
	ldr r1, _02303AF8 ; =ov11_02324D58
	ldr r1, [r1, #4]
	str r0, [r1, #0x5c]
_02303A14:
	mov r2, #0
	ldr r0, _02303AF8 ; =ov11_02324D58
	mov r3, r2
_02303A20:
	ldr r1, [r0, #4]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x38]
	cmp r2, #8
	blt _02303A20
	ldr r2, _02303AF8 ; =ov11_02324D58
	mov lr, #1
	ldr r0, [r2, #4]
	mov ip, #4
	str r3, [r0, #0x18]
	ldr r1, [r2, #4]
	ldr r0, _02303AFC ; =ov11_023228E0
	str r3, [r1, #0x1c]
	ldr r3, [r2, #4]
	ldr r1, _02303B00 ; =ov11_023042A8
	str lr, [r3, #0x20]
	ldr r3, [r2, #4]
	str lr, [r3, #0x24]
	ldr r3, [r2, #4]
	str lr, [r3, #0x28]
	ldr r3, [r2, #4]
	str lr, [r3, #0x2c]
	ldr r3, [r2, #4]
	str lr, [r3, #0x30]
	ldr r3, [r2, #4]
	str lr, [r3, #0x34]
	ldr r3, [r2, #4]
	str ip, [r3, #0x40]
	ldr r3, [r2, #4]
	ldr r2, [r3, #0x40]
	sub r2, r2, #2
	str r2, [r3, #0x10]
	bl CreateTextBox
	ldr r1, _02303AF8 ; =ov11_02324D58
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3, #1]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	ldr r0, _02303AF8 ; =ov11_02324D58
	ldr r0, [r0, #4]
	add r0, r0, #0x1bc
	bl InitPreprocessorArgs
	ldr r1, _02303AF8 ; =ov11_02324D58
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	strb r3, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303AF8: .word ov11_02324D58
_02303AFC: .word ov11_023228E0
_02303B00: .word ov11_023042A8
	arm_func_end ov11_023039D4

	arm_func_start ov11_02303B04
ov11_02303B04: ; 0x02303B04
	stmdb sp!, {r3, lr}
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #1]
	bl sub_0202836C
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseTextBox
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02303B4C ; =ov11_02324D58
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303B4C: .word ov11_02324D58
	arm_func_end ov11_02303B04

	arm_func_start ov11_02303B50
ov11_02303B50: ; 0x02303B50
	stmdb sp!, {r3, lr}
	ldr r0, _02303BBC ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02303B7C
	cmp r1, #1
	beq _02303BB4
	cmp r1, #2
	beq _02303B84
	b _02303BB4
_02303B7C:
	bl ov11_02303D80
	b _02303BB4
_02303B84:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x5c]
	tst r1, #0x100
	beq _02303BAC
	ldrb r1, [r0]
	ldr r0, [r2, #0xe8]
	ldr r2, [r2, #0xe4]
	blx r2
_02303BAC:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02303BB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303BBC: .word ov11_02324D58
	arm_func_end ov11_02303B50

	arm_func_start ov11_02303BC0
ov11_02303BC0: ; 0x02303BC0
	stmdb sp!, {r3, lr}
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #8]
	ldr r3, [r1, #4]
	ldr r0, [r3, #8]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02303BE4: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02303BFC ; case 1
	b _02303C5C ; case 2
	b _02303C94 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	b _02303D4C ; case 5
_02303BFC:
	ldr r2, _02303D6C ; =0x00003CFF
	add r0, r3, #0x100
	strh r2, [r0]
	ldr r0, [r1, #4]
	mov r2, #0x10
	str r2, [r0, #0x104]
	ldr ip, [r1, #4]
	mov r2, #4
	ldr r3, [ip, #0x3c]
	ldr r0, _02303D70 ; =ov11_023228D0
	str r3, [ip, #0xf8]
	str r2, [sp]
	ldr r1, [r1, #4]
	ldr r3, _02303D74 ; =ov11_023228F0
	add r2, r1, #0xf8
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r2, [r1, #4]
	strb r0, [r2, #2]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldmia sp!, {r3, pc}
_02303C5C:
	ldr r2, [r3, #0x40]
	mov r0, #3
	str r2, [r3, #0xf8]
	str r0, [sp]
	ldr r1, [r1, #4]
	ldr r0, _02303D70 ; =ov11_023228D0
	add r2, r1, #0xf8
	ldr r3, _02303D78 ; =ov11_02322910
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
	ldmia sp!, {r3, pc}
_02303C94:
	mov r0, #0
	str r0, [r3, #0x198]
	ldr r0, [r1, #4]
	mov r2, #0x50
	str r2, [r0, #0x1b0]
	ldr r0, [r1, #4]
	mov r2, #4
	str r2, [r0, #0x1b4]
	ldr r0, [r1, #4]
	mov ip, #0x12
	str ip, [r0, #0x1a8]
	ldr r0, [r1, #4]
	mov r3, #0xc
	str r3, [r0, #0x1ac]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _02303CF4
	mov r0, #0x1f
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
	b _02303D24
_02303CF4:
	cmp r0, #1
	addne r0, ip, #0x470
	strne r0, [r2, #0x19c]
	ldrne r0, [r1, #4]
	rsbne r1, r3, #0x10000
	strne r1, [r0, #0x1a0]
	bne _02303D24
	mov r0, #0x14
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
_02303D24:
	ldr r0, _02303D68 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x18]
	str r1, [r2, #0x194]
	ldr r0, [r0, #4]
	add r0, r0, #0x190
	bl DigitInputMenuInit
	ldmia sp!, {r3, pc}
_02303D4C:
	ldrsb r0, [r3, #2]
	bl CloseSimpleMenu
	ldr r0, _02303D68 ; =ov11_02324D58
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303D68: .word ov11_02324D58
#if defined(EUROPE)
_02303D6C: .word 0x00003D01
#elif defined(JAPAN)
_02303D6C: .word 0x000004A6
#else
_02303D6C: .word 0x00003CFF
#endif
_02303D70: .word ov11_023228D0
_02303D74: .word ov11_023228F0
_02303D78: .word ov11_02322910
_02303D7C: .word 0x0000FFF2
	arm_func_end ov11_02303BC0

	arm_func_start ov11_02303D80
ov11_02303D80: ; 0x02303D80
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa8
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0230428C
_02303DA0: ; jump table
	b _0230428C ; case 0
	b _02303DBC ; case 1
	b _0230406C ; case 2
	b _0230417C ; case 3
	b _02304250 ; case 4
	b _02304268 ; case 5
	b _0230422C ; case 6
_02303DBC:
	ldrsb r0, [r2, #2]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230428C
_02303DD0: ; jump table
	b _0230428C ; case 0
	b _0230404C ; case 1
	b _02303DE8 ; case 2
	b _02303E10 ; case 3
	b _02303E38 ; case 4
	b _02303E60 ; case 5
_02303DE8:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #2
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E10:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #3
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E38:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r4, [r1, #4]
	mov r2, #1
	str r0, [r4, #0x3c]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	b _0230428C
_02303E60:
	ldr r1, _02304298 ; =ov11_02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #0x3c]
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02303E90
	cmp r0, #1
	beq _02303F30
	cmp r0, #2
	beq _02303FD0
	b _0230402C
_02303E90:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303F00
	bl GetHero
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _0230429C ; =ov11_02322978
	ldr r2, [r0, #0x18]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x3f
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303F00:
	add r0, sp, #0x1c
	bl sub_02048764
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r1, _0230429C ; =ov11_02322978
	ldr r2, [r0, #4]
	add r0, sp, #0x1c
	ldr r2, [r2, #0x18]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x1c]
	bl sub_02048794
	b _0230402C
_02303F30:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303FA0
	bl GetPartner
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _023042A0 ; =ov11_02322930
	ldr r2, [r0, #0x1c]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x40
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x41
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303FA0:
	add r0, sp, #0x58
	bl sub_02048764
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r1, _023042A0 ; =ov11_02322930
	ldr r2, [r0, #4]
	add r0, sp, #0x58
	ldr r2, [r2, #0x1c]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x5a]
	bl sub_02048794
	b _0230402C
_02303FD0:
	ldr r1, _023042A4 ; =ov11_023228BC
	add r0, sp, #0x94
	ldrb r2, [r1]
	strb r2, [sp, #4]
	ldrb r1, [r1, #1]
	strb r1, [sp, #5]
	ldr r1, [r3, #0x20]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl GetNameRaw
	add r0, sp, #0x94
	mov r1, r0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	mov r3, #0
	ldr r0, _02304298 ; =ov11_02324D58
	str r3, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0x94
	ldr r0, [r0, #0x20]
	add r2, sp, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055DD0
_0230402C:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230404C:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #6
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230406C:
	ldrsb r0, [r2, #2]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0230428C
_02304080: ; jump table
	b _0230428C ; case 0
	b _02304150 ; case 1
	b _02304094 ; case 2
	b _023040D4 ; case 3
	b _02304110 ; case 4
_02304094:
	ldr r1, _02304298 ; =ov11_02324D58
	mov ip, #0
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_023040D4:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r3, #1
	ldr ip, [r1, #4]
	mov r2, #5
	str r0, [ip, #0x40]
	ldr r0, [r1, #4]
	str r3, [r0, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	str r3, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304110:
	ldr r1, _02304298 ; =ov11_02324D58
	mov ip, #2
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304150:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r1, [r0, #4]
	mov r2, #1
	str r3, [r1, #8]
	ldr r1, [r0, #4]
	str r2, [r1, #0xc]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_0230417C:
	add r0, r2, #0x190
	ldr r4, [r2, #0x190]
	bl DigitInputMenuReturn
	mvn r1, #1
	cmp r0, r1
	beq _023041D8
	add r1, r1, #1
	cmp r0, r1
	ldr r1, _02304298 ; =ov11_02324D58
	ldreq r0, _02304298 ; =ov11_02324D58
	ldr lr, [r1, #4]
	ldreq r0, [r0, #4]
	ldr ip, [lr, #0x10]
	ldreq r0, [r0, #0x194]
	add ip, lr, ip, lsl #2
	str r0, [ip, #0x18]
	ldr r0, [r1, #4]
	mov r3, #4
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	mov r2, #1
	str r2, [r0, #0xc]
	b _0230428C
_023041D8:
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r0, [r0, #4]
	ldr r3, [r0, #0x190]
	cmp r4, r3
	bne _023041F8
	ldr r0, [r0, #0x58]
	cmp r0, #0xff
	bne _0230428C
_023041F8:
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	str r3, [r1, #0x18]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldr r0, _02304298 ; =ov11_02324D58
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x58]
	b _0230428C
_0230422C:
	mov r1, #2
	str r1, [r2, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _02304248
	bl ov11_02303B04
_02304248:
	mvn r0, #0
	b _02304290
_02304250:
	ldr r1, [r2, #0xc]
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	b _0230428C
_02304268:
	ldrsb r0, [r2, #2]
	bl CloseSimpleMenu
	ldr r0, _02304298 ; =ov11_02324D58
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2, #2]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
_0230428C:
	mov r0, #0
_02304290:
	add sp, sp, #0xa8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304298: .word ov11_02324D58
_0230429C: .word ov11_02322978
_023042A0: .word ov11_02322930
_023042A4: .word ov11_023228BC
	arm_func_end ov11_02303D80

	arm_func_start ov11_023042A8
ov11_023042A8: ; 0x023042A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _02304390 ; =ov11_02324D58
	ldr r2, _02304394 ; =ov11_02324D60
	ldr r1, [r0, #4]
	mov r0, r4
	ldr r3, [r1, #0x10]
	mov r1, #1
	ldr r3, [r2, r3, lsl #2]
	mov r2, #3
	bl DrawTextInWindow
	ldr r0, _02304390 ; =ov11_02324D58
	ldr r3, [r0, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02304300
	cmp r0, #1
	beq _02304314
	b _02304328
_02304300:
	ldr r1, [r3, #0x18]
	ldr r0, _02304398 ; =ov11_02322978
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304314:
	ldr r1, [r3, #0x1c]
	ldr r0, _0230439C ; =ov11_02322930
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304328:
	ldr r0, [r3, #0x20]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_02304334:
	ldr r0, _02304390 ; =ov11_02324D58
	str r2, [r3, #0x1bc]
	ldr r1, [r0, #4]
	orr r2, r2, #0x10000
	str r2, [r1, #0x1cc]
	ldr r1, [r0, #4]
	ldr r2, _023043A0 ; =ov11_023229B8
	add ip, r1, #0x1bc
	ldr r3, _023043A4 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #4
	mov r0, r4
	mov r1, #0x3c
	mov r2, #3
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #4
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02304390: .word ov11_02324D58
_02304394: .word ov11_02324D60
_02304398: .word ov11_02322978
_0230439C: .word ov11_02322930
_023043A0: .word ov11_023229B8
_023043A4: .word 0x0000C402
	arm_func_end ov11_023042A8

	arm_func_start ov11_023043A8
ov11_023043A8: ; 0x023043A8
	ldr ip, _023043B4 ; =InitMenu
	ldr r0, _023043B8 ; =ov11_023229DC
	bx ip
	.align 2, 0
_023043B4: .word InitMenu
_023043B8: .word ov11_023229DC
	arm_func_end ov11_023043A8

	arm_func_start ov11_023043BC
ov11_023043BC: ; 0x023043BC
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _023043E4 ; =ov11_02324D6C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023043E4: .word ov11_02324D6C
	arm_func_end ov11_023043BC

	arm_func_start ov11_023043E8
ov11_023043E8: ; 0x023043E8
	stmdb sp!, {r3, lr}
	ldr r0, _02304410 ; =ov11_02324D6C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304410 ; =ov11_02324D6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304410: .word ov11_02324D6C
	arm_func_end ov11_023043E8

	arm_func_start ov11_02304414
ov11_02304414: ; 0x02304414
	stmdb sp!, {r3, lr}
	ldr r0, _02304510 ; =ov11_02324D6C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304440
	cmp r0, #1
	beq _02304478
	cmp r0, #2
	beq _023044C4
	b _02304508
_02304440:
	mov r0, #9
	bl sub_02067584
	cmp r0, #0
	beq _02304460
	mvn r0, #0
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304460:
	bl ov11_0230D71C
	ldr r0, _02304510 ; =ov11_02324D6C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_02304478:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304508
	mov r0, #9
	bl sub_020668B4
	cmp r0, #0
	bne _023044AC
	bl sub_02067664
	mvn r0, #0
	bl ReturnScriptMenuResult
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_023044AC:
	bl ov11_02310BDC
	ldr r0, _02304510 ; =ov11_02324D6C
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_023044C4:
	bl sub_02066A44
	cmp r0, #0
	beq _02304508
	mvn r1, #0
	cmp r0, r1
	bne _023044E8
	mov r0, r1
	bl ReturnScriptMenuResult
	b _023044F8
_023044E8:
	cmp r0, #1
	bne _023044F8
	bl sub_020674CC
	bl ReturnScriptMenuResult
_023044F8:
	bl sub_02067664
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304508:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304510: .word ov11_02324D6C
	arm_func_end ov11_02304414

	arm_func_start ov11_02304514
ov11_02304514: ; 0x02304514
	ldr ip, _02304520 ; =InitMenu
	ldr r0, _02304524 ; =ov11_023229EC
	bx ip
	.align 2, 0
_02304520: .word InitMenu
_02304524: .word ov11_023229EC
	arm_func_end ov11_02304514

	arm_func_start ov11_02304528
ov11_02304528: ; 0x02304528
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304550 ; =ov11_02324D70
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304550: .word ov11_02324D70
	arm_func_end ov11_02304528

	arm_func_start ov11_02304554
ov11_02304554: ; 0x02304554
	stmdb sp!, {r3, lr}
	ldr r0, _0230457C ; =ov11_02324D70
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230457C ; =ov11_02324D70
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230457C: .word ov11_02324D70
	arm_func_end ov11_02304554

	arm_func_start ov11_02304580
ov11_02304580: ; 0x02304580
	stmdb sp!, {r3, lr}
	ldr r0, _02304660 ; =ov11_02324D70
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023045AC
	cmp r0, #1
	beq _023045E0
	cmp r0, #2
	beq _02304630
	b _02304658
_023045AC:
	bl ov11_022E8340
	cmp r0, #0
	bne _023045CC
	bl ov11_022E84AC
	mvn r0, #0
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_023045CC:
	ldr r0, _02304660 ; =ov11_02324D70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_023045E0:
	bl ov11_022E83F8
	cmp r0, #0
	beq _02304658
	cmp r0, #1
	bne _02304608
	mvn r0, #0
	bl ReturnScriptMenuResult
	bl ov11_022E84AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304608:
	cmp r0, #2
	bne _02304658
	ldr r0, _02304660 ; =ov11_02324D70
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_02304630:
	ldr r0, [r1, #8]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #8]
	bgt _02304658
	bl ov11_022E84AC
	mov r0, #0
	bl ov11_022E6EE8
	mov r0, #3
	ldmia sp!, {r3, pc}
_02304658:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304660: .word ov11_02324D70
	arm_func_end ov11_02304580

	arm_func_start ov11_02304664
ov11_02304664: ; 0x02304664
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02304684 ; =ov11_023229FC
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02304688 ; =ov11_0238A084
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304684: .word ov11_023229FC
_02304688: .word ov11_0238A084
	arm_func_end ov11_02304664

	arm_func_start ov11_0230468C
ov11_0230468C: ; 0x0230468C
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023046B4 ; =ov11_02324D74
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046B4: .word ov11_02324D74
	arm_func_end ov11_0230468C

	arm_func_start ov11_023046B8
ov11_023046B8: ; 0x023046B8
	stmdb sp!, {r3, lr}
	ldr r0, _023046E0 ; =ov11_02324D74
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023046E0 ; =ov11_02324D74
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046E0: .word ov11_02324D74
	arm_func_end ov11_023046B8

	arm_func_start ov11_023046E4
ov11_023046E4: ; 0x023046E4
	stmdb sp!, {r3, lr}
	ldr r0, _02304880 ; =ov11_02324D74
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304878
_02304700: ; jump table
	b _02304718 ; case 0
	b _0230473C ; case 1
	b _023047AC ; case 2
	b _023047C8 ; case 3
	b _023047EC ; case 4
	b _02304810 ; case 5
_02304718:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_0230473C:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304884 ; =ov11_0238A084
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bl sub_020664B8
	cmp r0, #0
	bne _0230477C
	bl sub_02066888
	mvn r0, #0
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230477C:
	ldr r0, _02304884 ; =ov11_0238A084
	ldr r0, [r0]
	cmp r0, #0
	bne _02304794
	bl ov11_02310BF0
	b _02304798
_02304794:
	bl ov11_02310C04
_02304798:
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_023047AC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023047C8:
	bl sub_02066510
	cmp r0, #0
	beq _02304878
	ldr r1, _02304880 ; =ov11_02324D74
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_023047EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_02304810:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =ov11_02324D74
	ldr r1, _02304888 ; =ov11_02322A0C
	ldr r2, [r0]
	b _0230483C
_0230482C:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304848
	add r1, r1, #8
_0230483C:
	ldr r3, [r1]
	cmp r3, #0
	bne _0230482C
_02304848:
	cmp r3, #0
	beq _02304864
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #1
	bl ReturnScriptMenuResult
	b _0230486C
_02304864:
	mov r0, #0
	bl ReturnScriptMenuResult
_0230486C:
	bl sub_02066888
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304878:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304880: .word ov11_02324D74
_02304884: .word ov11_0238A084
_02304888: .word ov11_02322A0C
	arm_func_end ov11_023046E4

	arm_func_start ov11_0230488C
ov11_0230488C: ; 0x0230488C
	stmdb sp!, {r3, lr}
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230488C

	arm_func_start ov11_023048AC
ov11_023048AC: ; 0x023048AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023048CC ; =ov11_02322AB4
	bl InitMenu
	cmp r0, #0
	ldrne r0, _023048D0 ; =ov11_0238A088
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023048CC: .word ov11_02322AB4
_023048D0: .word ov11_0238A088
	arm_func_end ov11_023048AC

	arm_func_start ov11_023048D4
ov11_023048D4: ; 0x023048D4
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023048FC ; =ov11_02324D78
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023048FC: .word ov11_02324D78
	arm_func_end ov11_023048D4

	arm_func_start ov11_02304900
ov11_02304900: ; 0x02304900
	stmdb sp!, {r3, lr}
	ldr r0, _02304928 ; =ov11_02324D78
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304928 ; =ov11_02324D78
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304928: .word ov11_02324D78
	arm_func_end ov11_02304900

	arm_func_start ov11_0230492C
ov11_0230492C: ; 0x0230492C
	stmdb sp!, {r3, lr}
	ldr r0, _02304ABC ; =ov11_02324D78
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304AB4
_02304948: ; jump table
	b _02304960 ; case 0
	b _023049A4 ; case 1
	b _023049D0 ; case 2
	b _023049EC ; case 3
	b _02304A10 ; case 4
	b _02304A34 ; case 5
_02304960:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	beq _0230498C
	mvn r0, #0
	bl ReturnScriptMenuResult
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230498C:
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049A4:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_020668B4
	bl ov11_02310BDC
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049D0:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023049EC:
	bl sub_02066A44
	cmp r0, #0
	beq _02304AB4
	ldr r1, _02304ABC ; =ov11_02324D78
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_02304A10:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_02304A34:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r1, _02304ABC ; =ov11_02324D78
	mvn r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, r0
	bne _02304A60
	bl ov11_02300D5C
	b _02304AA8
_02304A60:
	ldr r1, _02304AC0 ; =ov11_02322AC4
	b _02304A78
_02304A68:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304A84
	add r1, r1, #8
_02304A78:
	ldr r3, [r1]
	cmp r3, #0
	bne _02304A68
_02304A84:
	cmp r3, #0
	beq _02304AA0
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #6
	bl ov11_0230113C
	b _02304AA8
_02304AA0:
	mov r0, #1
	bl ov11_0230113C
_02304AA8:
	bl sub_02067664
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304AB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304ABC: .word ov11_02324D78
_02304AC0: .word ov11_02322AC4
	arm_func_end ov11_0230492C

	arm_func_start IsBagNotEmpty
IsBagNotEmpty: ; 0x02304AC4
	stmdb sp!, {r3, lr}
	bl GetNbItemsInBag
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsBagNotEmpty

	arm_func_start ov11_02304AE0
ov11_02304AE0: ; 0x02304AE0
	ldr ip, _02304AEC ; =InitMenu
	ldr r0, _02304AF0 ; =ov11_02322B6C
	bx ip
	.align 2, 0
_02304AEC: .word InitMenu
_02304AF0: .word ov11_02322B6C
	arm_func_end ov11_02304AE0

	arm_func_start ov11_02304AF4
ov11_02304AF4: ; 0x02304AF4
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304B1C ; =ov11_02324D7C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B1C: .word ov11_02324D7C
	arm_func_end ov11_02304AF4

	arm_func_start ov11_02304B20
ov11_02304B20: ; 0x02304B20
	stmdb sp!, {r3, lr}
	ldr r0, _02304B48 ; =ov11_02324D7C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304B48 ; =ov11_02324D7C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B48: .word ov11_02324D7C
	arm_func_end ov11_02304B20

	arm_func_start ov11_02304B4C
ov11_02304B4C: ; 0x02304B4C
	stmdb sp!, {r3, lr}
	ldr r0, _02304BC0 ; =ov11_02324D7C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304B70
	cmp r0, #1
	beq _02304B9C
	b _02304BB8
_02304B70:
	bl ov11_02307244
	cmp r0, #0
	bne _02304B88
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304B88:
	ldr r0, _02304BC0 ; =ov11_02324D7C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304BB8
_02304B9C:
	bl ov11_02307334
	cmp r0, #0
	beq _02304BB8
	bl ov11_02300D5C
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304BB8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304BC0: .word ov11_02324D7C
	arm_func_end ov11_02304B4C

	arm_func_start ov11_02304BC4
ov11_02304BC4: ; 0x02304BC4
	ldr ip, _02304BD0 ; =InitMenu
	ldr r0, _02304BD4 ; =ov11_02322B7C
	bx ip
	.align 2, 0
_02304BD0: .word InitMenu
_02304BD4: .word ov11_02322B7C
	arm_func_end ov11_02304BC4

	arm_func_start ov11_02304BD8
ov11_02304BD8: ; 0x02304BD8
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304C00 ; =ov11_02324D80
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C00: .word ov11_02324D80
	arm_func_end ov11_02304BD8

	arm_func_start ov11_02304C04
ov11_02304C04: ; 0x02304C04
	stmdb sp!, {r3, lr}
	ldr r0, _02304C2C ; =ov11_02324D80
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304C2C ; =ov11_02324D80
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C2C: .word ov11_02324D80
	arm_func_end ov11_02304C04

	arm_func_start ov11_02304C30
ov11_02304C30: ; 0x02304C30
	stmdb sp!, {r3, lr}
	ldr r0, _02304CA8 ; =ov11_02324D80
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304C54
	cmp r0, #1
	beq _02304C84
	b _02304CA0
_02304C54:
	mov r0, #0
	bl ov11_02309040
	cmp r0, #0
	bne _02304C70
	bl ov11_02309DF8
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304C70:
	ldr r0, _02304CA8 ; =ov11_02324D80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304CA0
_02304C84:
	bl ov11_023090DC
	cmp r0, #0
	beq _02304CA0
	bl ov11_02309DF8
	bl ov11_02300D5C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304CA0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304CA8: .word ov11_02324D80
	arm_func_end ov11_02304C30

	arm_func_start ov11_02304CAC
ov11_02304CAC: ; 0x02304CAC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02304D8C ; =ov11_02324D84
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	bne _02304CDC
	ldr r0, _02304D90 ; =0x000004C4
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304D8C ; =ov11_02324D84
	str r0, [r1]
_02304CDC:
	ldr r0, _02304D8C ; =ov11_02324D84
	ldrh r1, [r5]
	ldr r2, [r0]
	strh r1, [r2]
	ldrh r1, [r5, #2]
	add r0, r2, #0x54
	strh r1, [r2, #2]
	ldrh r1, [r5, #4]
	strh r1, [r2, #4]
	bl ItemZInit
	ldr r0, _02304D8C ; =ov11_02324D84
	ldr r0, [r0]
	add r0, r0, #0x15c
	bl InitPreprocessorArgs
	ldr r0, _02304D8C ; =ov11_02324D84
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #2
	str r3, [r1, #0x50]
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r1, [r0]
	strb r2, [r1, #0x4a]
	ldr r1, [r0]
	strb r2, [r1, #0x49]
	ldr r1, [r0]
	strb r2, [r1, #0x4b]
	ldr r1, [r0]
	str r3, [r1, #0x44]
_02304D50:
	ldr r1, [r0]
	add r1, r1, r3
	strb r3, [r1, #0x4bc]
	add r3, r3, #1
	cmp r3, #5
	blt _02304D50
	ldr r1, _02304D8C ; =ov11_02324D84
	mov r0, #0
	ldr r2, [r1]
	str r0, [r2, #0x1ac]
	ldr r1, [r1]
	strb r4, [r1, #0x4c]
	bl ov11_02304DC8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02304D8C: .word ov11_02324D84
_02304D90: .word 0x000004C4
	arm_func_end ov11_02304CAC

	arm_func_start ov11_02304D94
ov11_02304D94: ; 0x02304D94
	stmdb sp!, {r4, lr}
	ldr ip, _02304DC4 ; =ov11_02324D84
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #6]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304DC4: .word ov11_02324D84
	arm_func_end ov11_02304D94

	arm_func_start ov11_02304DC8
ov11_02304DC8: ; 0x02304DC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r4, [r1]
	ldr r0, [r4, #0x38]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _0230543C
_02304DF0: ; jump table
	b _02304E50 ; case 0
	b _02304EA8 ; case 1
	b _02304EDC ; case 2
	b _02304F24 ; case 3
	b _0230527C ; case 4
	b _023052D0 ; case 5
	b _023050BC ; case 6
	b _0230543C ; case 7
	b _0230543C ; case 8
	b _0230543C ; case 9
	b _0230543C ; case 10
	b _02305138 ; case 11
	b _0230523C ; case 12
	b _02305300 ; case 13
	b _02305310 ; case 14
	b _02305374 ; case 15
	b _023053CC ; case 16
	b _0230543C ; case 17
	b _0230543C ; case 18
	b _02305348 ; case 19
	b _02304FE4 ; case 20
	b _0230508C ; case 21
	b _0230543C ; case 22
	b _02305408 ; case 23
_02304E50:
	bl IsBagFull
	cmp r0, #0
	beq _02304E90
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02304E80
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _0230543C
_02304E80:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02304EA8
_02304E90:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02304EA8:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305448 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02304EDC:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _02306AB0 ; =0x00002FB1
#else
	rsb r2, r3, #0x2e0
#endif
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02304F24:
#ifdef JAPAN
	ldr r1, _02306AB4 ; =0x00002FAC
	add r0, r4, #0x1b0
#else
	add r0, r4, #0x1b0
	mov r1, #0x2d8
#endif
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x18
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305444 ; =ov11_02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl MaybeGetFormattedItemName
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305450 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x18
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x28]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x3c]
	ldrb lr, [r5]
	str lr, [sp, #0x40]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305444 ; =ov11_02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl CreateSimpleMenu
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02304FE4:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =ov11_02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r1, sp, #0xc
	strh ip, [sp, #0xc]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0xe]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x10]
	strb r4, [sp, #0xc]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r4, #0x15
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02306AC0 ; =0x00002FC5
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
#endif
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_0230508C:
	mov r4, #3
	str r4, [sp, #0x68]
	ldr r0, _02305454 ; =ov11_02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =ov11_02322BC8
	add r2, sp, #0x68
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_023050BC:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305444 ; =ov11_02324D84
	ldr r0, _02305460 ; =ov11_02322BA8
	ldr lr, [r4]
	ldr r1, _02305464 ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305468 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0230543C
_02305138:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0x12]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0x14]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x16]
	strb r1, [sp, #0x12]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldrsh r3, [sp, #0x16]
	ldr r2, [r0]
	add r1, sp, #0x12
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r0, r0, #0x5a
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _0230544C ; =ov11_02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _0230546C ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305444 ; =ov11_02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305444 ; =ov11_02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _0230543C
_0230523C:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _02305264
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02305264:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_0230527C:
	add r0, r4, #0x5a
	str r0, [r4, #0x19c]
	ldr r0, [r1]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305470 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_023052D0:
	mov r4, #3
	str r4, [sp, #0x100]
	ldr r0, _02305454 ; =ov11_02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =ov11_02322BC8
	add r2, sp, #0x100
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305300:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _0230543C
_02305310:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305474 ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02305348:
	ldr r0, _02305478 ; =ov11_02322BB8
	mov r4, #3
	ldr r3, _0230547C ; =ov11_02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305374:
	ldrsb r0, [r4, #0x48]
	bl CloseDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl CreateInventoryMenuOuter
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_023053CC:
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl CreateInventoryMenuOuter
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_02305408:
	mov r0, #0xf
	str r0, [r4, #0x3c]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305484 ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
_0230543C:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_02304DC8_OFFSET 0x2CD4
#else
#define OV11_02304DC8_OFFSET 0
#endif
_02305444: .word ov11_02324D84
_02305448: .word 0x000002D7 + OV11_02304DC8_OFFSET
#ifdef JAPAN
_02306AB0: .word 0x00002FB1
_02306AB4: .word 0x00002FAC
#endif
_0230544C: .word ov11_02322B8C
_02305450: .word 0x000002D9 + OV11_02304DC8_OFFSET
#ifdef JAPAN
_02306AC0: .word 0x00002FC5
#endif
_02305454: .word ov11_02322B98
_02305458: .word 0x00300033
_0230545C: .word ov11_02322BC8
_02305460: .word ov11_02322BA8
_02305464: .word 0x00001013
#ifdef JAPAN
_02305468: .word 0x00001D3C
_0230546C: .word 0x00002FB3
_02305470: .word 0x00002FCA
#else
_02305468: .word 0x000008E4
_0230546C: .word 0x000002DF
_02305470: .word 0x000002D6
#endif
_02305474: .word 0x000002DE + OV11_02304DC8_OFFSET
_02305478: .word ov11_02322BB8
_0230547C: .word ov11_02322BE0
_02305480: .word ov11_02304D94
_02305484: .word 0x000002DA + OV11_02304DC8_OFFSET
	arm_func_end ov11_02304DC8

	arm_func_start ov11_02305488
ov11_02305488: ; 0x02305488
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r4, [r0]
	ldr r1, [r4, #0x38]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02305AF4
_023054A8: ; jump table
	b _02305508 ; case 0
	b _02305560 ; case 1
	b _02305594 ; case 2
	b _023055DC ; case 3
	b _02305934 ; case 4
	b _02305988 ; case 5
	b _02305774 ; case 6
	b _02305AF4 ; case 7
	b _02305AF4 ; case 8
	b _02305AF4 ; case 9
	b _02305AF4 ; case 10
	b _023057F0 ; case 11
	b _023058F4 ; case 12
	b _023059B8 ; case 13
	b _023059C8 ; case 14
	b _02305A2C ; case 15
	b _02305A84 ; case 16
	b _02305AF4 ; case 17
	b _02305AF4 ; case 18
	b _02305A00 ; case 19
	b _0230569C ; case 20
	b _02305744 ; case 21
	b _02305AF4 ; case 22
	b _02305AC0 ; case 23
_02305508:
	bl IsBagFull
	cmp r0, #0
	beq _02305548
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02305538
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305538:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305560
_02305548:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305560:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B00 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305594:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _02307174 ; =0x00002FB1
#else
	rsb r2, r3, #0x2e0
#endif
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_023055DC:
#ifdef JAPAN
	ldr r1, _02307178 ; =0x00002FAC
	add r0, r4, #0x1b0
#else
	add r0, r4, #0x1b0
	mov r1, #0x2d8
#endif
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x148
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305AFC ; =ov11_02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl MaybeGetFormattedItemName
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B08 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x148
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x158]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x16c]
	ldrb lr, [r5]
	str lr, [sp, #0x170]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305AFC ; =ov11_02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl CreateSimpleMenu
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_0230569C:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r1, sp, #0x12
	strh ip, [sp, #0x12]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0x14]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x16]
	strb r4, [sp, #0x12]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r4, #0x15
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02307184 ; =0x00002FC5
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
#endif
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305744:
	mov r4, #3
	str r4, [sp, #0xb0]
	ldr r0, _02305B0C ; =ov11_02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =ov11_02322BC8
	add r2, sp, #0xb0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305774:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305AFC ; =ov11_02324D84
	ldr r0, _02305B18 ; =ov11_02322BA8
	ldr lr, [r4]
	ldr r1, _02305B1C ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305B20 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _02305AF4
_023057F0:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0xc]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0xe]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x10]
	strb r1, [sp, #0xc]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldrsh r3, [sp, #0x10]
	ldr r2, [r0]
	add r1, sp, #0xc
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r0, r0, #0x5a
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B04 ; =ov11_02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B24 ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305AFC ; =ov11_02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305AFC ; =ov11_02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _02305AF4
_023058F4:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _0230591C
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_0230591C:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305934:
	add r1, r4, #0x5a
	str r1, [r4, #0x19c]
	ldr r0, [r0]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305B28 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305988:
	mov r4, #3
	str r4, [sp, #0x18]
	ldr r0, _02305B0C ; =ov11_02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =ov11_02322BC8
	add r2, sp, #0x18
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_023059B8:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _02305AF4
_023059C8:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B2C ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305A00:
	ldr r0, _02305B30 ; =ov11_02322BB8
	mov r4, #3
	ldr r3, _02305B34 ; =ov11_02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305A2C:
	ldrsb r0, [r4, #0x48]
	bl CloseDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl CreateInventoryMenuOuter
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305A84:
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl CreateInventoryMenuOuter
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305AC0:
	mov r1, #0xf
	str r1, [r4, #0x3c]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B3C ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
_02305AF4:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_02305488_OFFSET 0x2CD4
#else
#define OV11_02305488_OFFSET 0
#endif
_02305AFC: .word ov11_02324D84
_02305B00: .word 0x000002D7 + OV11_02305488_OFFSET
#ifdef JAPAN
_02307174: .word 0x00002FB1
_02307178: .word 0x00002FAC
#endif
_02305B04: .word ov11_02322B8C
_02305B08: .word 0x000002D9 + OV11_02305488_OFFSET
#ifdef JAPAN
_02307184: .word 0x00002FC5
#endif
_02305B0C: .word ov11_02322B98
_02305B10: .word 0x00300033
_02305B14: .word ov11_02322BC8
_02305B18: .word ov11_02322BA8
_02305B1C: .word 0x00001013
#ifdef JAPAN
_02305B20: .word 0x00001D3C
_02305B24: .word 0x00002FB3
_02305B28: .word 0x00002FCA
#else
_02305B20: .word 0x000008E4
_02305B24: .word 0x000002DF
_02305B28: .word 0x000002D6
#endif
_02305B2C: .word 0x000002DE + OV11_02305488_OFFSET
_02305B30: .word ov11_02322BB8
_02305B34: .word ov11_02322BE0
_02305B38: .word ov11_02304D94
_02305B3C: .word 0x000002DA + OV11_02305488_OFFSET
	arm_func_end ov11_02305488

	arm_func_start ov11_02305B40
ov11_02305B40: ; 0x02305B40
	stmdb sp!, {r4, lr}
	ldr r1, _02305B94 ; =ov11_02324D84
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _02305B84
	cmp r0, #0
	ldr r4, [r1, #0x1ac]
	ldrnesh r1, [r1, #0x58]
	strneh r1, [r0]
	ldr r0, _02305B94 ; =ov11_02324D84
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02305B94 ; =ov11_02324D84
	mov r1, #0
	str r1, [r0]
	b _02305B8C
_02305B84:
	cmp r0, #0
	strneh r4, [r0]
_02305B8C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02305B94: .word ov11_02324D84
	arm_func_end ov11_02305B40

	arm_func_start ov11_02305B98
ov11_02305B98: ; 0x02305B98
	stmdb sp!, {r3, lr}
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r3, [r0]
	ldr r1, [r3, #0x50]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02306140
_02305BB4: ; jump table
	b _02305BC4 ; case 0
	b _02305BD0 ; case 1
	b _02306120 ; case 2
	b _02306138 ; case 3
_02305BC4:
	mov r0, #1
	str r0, [r3, #0x50]
	b _02306140
_02305BD0:
	ldr r1, [r3, #0x38]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _02306090
_02305BE0: ; jump table
	b _023060C0 ; case 0
	b _02306090 ; case 1
	b _02306090 ; case 2
	b _02305C3C ; case 3
	b _02306090 ; case 4
	b _02305CC4 ; case 5
	b _02305FE0 ; case 6
	b _0230602C ; case 7
	b _02306038 ; case 8
	b _02306044 ; case 9
	b _02306044 ; case 10
	b _02306090 ; case 11
	b _023060C0 ; case 12
	b _02306090 ; case 13
	b _02306090 ; case 14
	b _02305D08 ; case 15
	b _02305D08 ; case 16
	b _02305ECC ; case 17
	b _02305F00 ; case 18
	b _02305F24 ; case 19
	b _02306090 ; case 20
	b _02305C80 ; case 21
	b _02306050 ; case 22
_02305C3C:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	beq _02305C70
	cmp r0, #2
	beq _02305C60
	cmp r0, #3
	beq _02305C70
	b _023060C0
_02305C60:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305C70:
	bl ov11_0230614C
	mov r0, #4
	bl ov11_02304DC8
	b _023060C0
_02305C80:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	beq _02305CB4
	cmp r0, #2
	beq _02305CA4
	cmp r0, #3
	beq _02305CB4
	b _023060C0
_02305CA4:
	bl ov11_0230614C
	mov r0, #0xb
	bl ov11_02304DC8
	b _023060C0
_02305CB4:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305CC4:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	beq _02305CF8
	cmp r0, #2
	beq _02305CE8
	cmp r0, #3
	beq _02305CF8
	b _023060C0
_02305CE8:
	bl ov11_0230614C
	mov r0, #0xe
	bl ov11_02304DC8
	b _023060C0
_02305CF8:
	bl ov11_0230614C
	mov r0, #0
	bl ov11_02304DC8
	b _023060C0
_02305D08:
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02305D9C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuState3
	cmp r0, #0
	beq _02305D9C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDA8
	cmp r0, #0
	blt _02305D9C
	ldr r1, _02306148 ; =ov11_02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCD10
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305D9C:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuState3
	cmp r0, #0
	beq _02305E44
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl PopInventoryMenuField0x1A3
	ldrh r1, [sp]
	tst r1, #4
	cmpeq r0, #0
	beq _02305E44
	cmp r0, #0
	bne _02305DE4
	mov r0, #5
	bl PlaySeVolumeWrapper
_02305DE4:
	bl SortItemsInBag
	bl GetNbItemsInBag
	ldr r2, _02306148 ; =ov11_02324D84
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC60
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCCB0
	bl IsBagFull
	cmp r0, #0
	bne _02305E44
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305E44:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl CheckInventoryMenuField0x1A0
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDBC
	mvn r1, #0
	cmp r0, r1
	bne _02305EB4
	ldr r1, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x11
	str r3, [r2, #0x40]
	ldr r1, [r1]
	str r3, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305EB4:
	ldr r1, _02306148 ; =ov11_02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0x13
	bl ov11_02304DC8
	b _023060C0
_02305ECC:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl CloseInventoryMenu
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F00:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F24:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _023060C0
_02305F38: ; jump table
	b _023060C0 ; case 0
	b _02305FBC ; case 1
	b _023060C0 ; case 2
	b _023060C0 ; case 3
	b _02305F54 ; case 4
	b _02305F80 ; case 5
	b _02305FBC ; case 6
_02305F54:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F80:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl SetInventoryMenuState6
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305FBC:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	mov r2, #0xf
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC7C
	b _023060C0
_02305FE0:
	ldrsb r0, [r3, #0x4b]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4b]
	bl CloseScrollBox
	ldr r0, _02306148 ; =ov11_02324D84
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xf
	strb r3, [r1, #0x4b]
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl SetInventoryMenuState0
	b _023060C0
_0230602C:
	bl ov11_022DC504
	mov r2, #3
	b _023060C4
_02306038:
	bl ov11_022DC504
	mov r2, #2
	b _023060C4
_02306044:
	bl ov11_022DC504
	mov r2, #5
	b _023060C4
_02306050:
	ldrsb r0, [r3, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02306148 ; =ov11_02324D84
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _023060C0
_02306090:
	ldrsb r0, [r3, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
_023060C0:
	mov r2, #1
_023060C4:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r1, [r0]
	str r2, [r1, #0x1ac]
	ldr r2, [r0]
	ldr r1, [r2, #0x1ac]
	cmp r1, #1
	beq _02306140
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x1ac]
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	beq _02306140
	mov r1, #2
	str r1, [r2, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202836C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _02306140
_02306120:
	mov r1, #3
	str r1, [r3, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl CloseDialogueBox
	b _02306140
_02306138:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02306140:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306148: .word ov11_02324D84
	arm_func_end ov11_02305B98

	arm_func_start ov11_0230614C
ov11_0230614C: ; 0x0230614C
	stmdb sp!, {r3, lr}
	ldr r0, _02306190 ; =ov11_02324D84
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02306190 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	bl CloseSimpleMenu
	ldr r0, _02306190 ; =ov11_02324D84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306190: .word ov11_02324D84
	arm_func_end ov11_0230614C

	arm_func_start ov11_02306194
ov11_02306194: ; 0x02306194
	stmdb sp!, {r3, lr}
	ldr r1, _023061C8 ; =ov11_02324D84
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x48]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _023061C8 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x48]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023061C8: .word ov11_02324D84
	arm_func_end ov11_02306194

	arm_func_start ov11_023061CC
ov11_023061CC: ; 0x023061CC
	ldr ip, _023061E0 ; =ov11_023061FC
#ifdef JAPAN
	mov r1, #0
	mov r2, #1
#else
	mov r2, #1
	mov r3, r2
	mov r1, #3
#endif
	bx ip
	.align 2, 0
_023061E0: .word ov11_023061FC
	arm_func_end ov11_023061CC

	arm_func_start ov11_023061E4
ov11_023061E4: ; 0x023061E4
	ldr ip, _023061F8 ; =ov11_023061FC
	mov r2, r1
	mov r1, #3
#ifndef JAPAN
	mov r3, #0
#endif
	bx ip
	.align 2, 0
_023061F8: .word ov11_023061FC
	arm_func_end ov11_023061E4

	arm_func_start ov11_023061FC
ov11_023061FC: ; 0x023061FC
#ifdef JAPAN
#define OV11_023061FC_OFFSET -4
#else
#define OV11_023061FC_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _023062B8 ; =ov11_02324D88
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	mov r4, r2
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _023062B8 ; =ov11_02324D88
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	mov r5, r2
	mov r4, r3
#endif
	cmp r0, #0
	bne _02306234
	mov r0, #0x124 + OV11_023061FC_OFFSET
	mov r1, #8
	bl MemAlloc
	ldr r1, _023062B8 ; =ov11_02324D88
	str r0, [r1]
_02306234:
	ldr r0, _023062B8 ; =ov11_02324D88
	mov r2, #0
	ldr r1, [r0]
#ifdef JAPAN
	str r5, [r1, #0x84]
	ldr r1, [r0]
	strb r4, [r1, #0x20]
	ldr r1, [r0]
	str r6, [r1]
#else
	str r4, [r1, #0x24]
	ldr r1, [r0]
	str r6, [r1, #0x88]
	ldr r1, [r0]
	strb r5, [r1, #0x20]
	ldr r1, [r0]
	str r7, [r1]
#endif
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	add r0, r0, #0x30 + OV11_023061FC_OFFSET
	bl InitPreprocessorArgs
	ldr r1, _023062B8 ; =ov11_02324D88
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x7c + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	str r0, [r2, #0x30 + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	str r0, [r2, #0x28 + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	strb r3, [r2, #0x21]
	ldr r2, [r1]
	strb r3, [r2, #0x22]
	ldr r1, [r1]
	str r0, [r1, #0x80 + OV11_023061FC_OFFSET]
	bl ov11_023062BC
	mov r0, #1
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_023062B8: .word ov11_02324D88
	arm_func_end ov11_023061FC

	arm_func_start ov11_023062BC
ov11_023062BC: ; 0x023062BC
#ifdef JAPAN
#define OV11_023062BC_OFFSET -4
#else
#define OV11_023062BC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _02306760
_023062E4: ; jump table
	b _02306344 ; case 0
	b _02306388 ; case 1
	b _023063BC ; case 2
	b _02306404 ; case 3
	b _02306430 ; case 4
	b _02306474 ; case 5
	b _023064B8 ; case 6
	b _02306760 ; case 7
	b _02306760 ; case 8
	b _02306760 ; case 9
	b _02306760 ; case 10
	b _02306524 ; case 11
	b _023065CC ; case 12
	b _02306760 ; case 13
	b _02306600 ; case 14
	b _023066F4 ; case 15
	b _02306760 ; case 16
	b _0230671C ; case 17
	b _02306760 ; case 18
	b _02306610 ; case 19
	b _0230663C ; case 20
	b _0230666C ; case 21
	b _02306760 ; case 22
	b _0230672C ; case 23
_02306344:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306370
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306388
_02306370:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306388:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02307D74 ; =0x00002FB4
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
#endif
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306760
_023063BC:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x2fc0
#else
	rsb r2, r3, #0x2ec
#endif
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306760
_02306404:
	ldr r0, _0230676C ; =ov11_02322C10
	mov r4, #3
	ldr r1, _02306770 ; =0x00300011
	ldr r3, _02306774 ; =ov11_02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_02306430:
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r2, _02306778 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306474:
	mov r0, #3
	str r0, [r2, #0x8c + OV11_023062BC_OFFSET]
	mov r0, #2
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0230676C ; =ov11_02322C10
	ldr r1, _0230677C ; =0x00300031
	ldr r3, _02306780 ; =ov11_02322C20
	add r2, r2, #0x8c + OV11_023062BC_OFFSET
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306760
_023064B8:
	ldrsb r0, [r2, #0x22]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02306760
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02306768 ; =ov11_02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	cmp r4, #2
	beq _023064FC
	cmp r4, #3
	b _02306510
_023064FC:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306510:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306524:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306538
	mov r0, #3
	bl sub_02017C50
_02306538:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c + OV11_023062BC_OFFSET]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02307D90_JP ; =0x00002FB8
	ldr ip, [r0]
	mov r1, #0x218
#else
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
#endif
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30 + OV11_023062BC_OFFSET]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
#ifndef JAPAN
	bl sub_0203AF0C
#endif
	bl sub_02057180
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306760
	bl sub_02055D4C
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306760
_023065CC:
	ldr r0, [r2]
	cmp r0, #0
	beq _023065E8
	bl sub_02055D4C
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_023065E8:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306600:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306760
_02306610:
	ldr r0, _02306784 ; =ov11_02322C00
	mov ip, #4
	ldr r3, _02306788 ; =ov11_02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_0230663C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306768 ; =ov11_02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88 + OV11_023062BC_OFFSET]
	bl sub_0203F150
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84 + OV11_023062BC_OFFSET]
	b _02306760
_0230666C:
#ifdef JAPAN
	ldr r0, _0230678C ; =TEAM_MEMBER_TABLE_PTR
	ldrsh r2, [r2, #0xc]
	ldr r1, [r0]
	mov r0, #0x44
#else
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _023066C0
	bl sub_0205633C
	cmp r0, #0
	beq _023066C0
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _023066C0
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306760
_023066C0:
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r0, _0230678C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
#endif
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
#ifdef JAPAN
	mov r3, #0
#endif
	bl PrintIqSkillsMenu
	b _02306760
_023066F4:
	ldrsb r0, [r2, #0x21]
	bl CloseDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306760
_0230671C:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306760
_0230672C:
	mov r0, #0xf
	str r0, [r2, #0x14]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r2, _02306790 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
_02306760:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306768: .word ov11_02324D88
#ifdef JAPAN
_02307D74: .word 0x00002FB4
#endif
_0230676C: .word ov11_02322C10
_02306770: .word 0x00300011
_02306774: .word ov11_02322C38
#ifdef JAPAN
_02306778: .word 0x00002FBE
#else
_02306778: .word 0x000002EA
#endif
_0230677C: .word 0x00300031
_02306780: .word ov11_02322C20
#ifdef JAPAN
_02307D90_JP: .word 0x00002FB8
#endif
_02306784: .word ov11_02322C00
_02306788: .word ov11_02322C50
_0230678C: .word TEAM_MEMBER_TABLE_PTR
#ifdef JAPAN
_02306790: .word 0x00002FB7
#else
_02306790: .word 0x000002E3
#endif
	arm_func_end ov11_023062BC

	arm_func_start ov11_02306794
ov11_02306794: ; 0x02306794
#ifdef JAPAN
#define OV11_02306794_OFFSET -4
#else
#define OV11_02306794_OFFSET 0
#endif
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02306C30
_023067B4: ; jump table
	b _02306814 ; case 0
	b _02306858 ; case 1
	b _0230688C ; case 2
	b _023068D4 ; case 3
	b _02306900 ; case 4
	b _02306944 ; case 5
	b _02306988 ; case 6
	b _02306C30 ; case 7
	b _02306C30 ; case 8
	b _02306C30 ; case 9
	b _02306C30 ; case 10
	b _023069F4 ; case 11
	b _02306A9C ; case 12
	b _02306C30 ; case 13
	b _02306AD0 ; case 14
	b _02306BC4 ; case 15
	b _02306C30 ; case 16
	b _02306BEC ; case 17
	b _02306C30 ; case 18
	b _02306AE0 ; case 19
	b _02306B0C ; case 20
	b _02306B3C ; case 21
	b _02306C30 ; case 22
	b _02306BFC ; case 23
_02306814:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306840
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306858
_02306840:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306858:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _023081EC ; =0x00002FB4
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
#endif
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306C30
_0230688C:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x2fc0
#else
	rsb r2, r3, #0x2ec
#endif
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306C30
_023068D4:
	ldr r0, _02306C3C ; =ov11_02322C10
	mov r4, #3
	ldr r1, _02306C40 ; =0x00300011
	ldr r3, _02306C44 ; =ov11_02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306900:
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, _02306C48 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_02306944:
	mov r1, #3
	str r1, [r2, #0x8c + OV11_02306794_OFFSET]
	mov r1, #2
	str r1, [sp]
	ldr r2, [r0]
	ldr r0, _02306C3C ; =ov11_02322C10
	ldr r1, _02306C4C ; =0x00300031
	ldr r3, _02306C50 ; =ov11_02322C20
	add r2, r2, #0x8c + OV11_02306794_OFFSET
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306C30
_02306988:
	ldrsb r0, [r2, #0x22]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02306C30
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02306C38 ; =ov11_02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	cmp r4, #2
	beq _023069CC
	cmp r4, #3
	b _023069E0
_023069CC:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069E0:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069F4:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306A08
	mov r0, #3
	bl sub_02017C50
_02306A08:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c + OV11_02306794_OFFSET]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02308208 ; =0x00002FB8
	ldr ip, [r0]
	mov r1, #0x218
#else
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
#endif
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30 + OV11_02306794_OFFSET]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
#ifndef JAPAN
	bl sub_0203AF0C
#endif
	bl sub_02057180
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306C30
	bl sub_02055D4C
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306C30
_02306A9C:
	ldr r0, [r2]
	cmp r0, #0
	beq _02306AB8
	bl sub_02055D4C
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_02306AB8:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AD0:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AE0:
	ldr r0, _02306C54 ; =ov11_02322C00
	mov ip, #4
	ldr r3, _02306C58 ; =ov11_02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306B0C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306C38 ; =ov11_02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88 + OV11_02306794_OFFSET]
	bl sub_0203F150
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84 + OV11_02306794_OFFSET]
	b _02306C30
_02306B3C:
#ifdef JAPAN
	ldr r0, _02306C5C ; =TEAM_MEMBER_TABLE_PTR
	ldrsh r2, [r2, #0xc]
	ldr r1, [r0]
	mov r0, #0x44
#else
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _02306B90
	bl sub_0205633C
	cmp r0, #0
	beq _02306B90
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02306B90
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306C30
_02306B90:
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r0, _02306C5C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
#endif
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
#ifdef JAPAN
	mov r3, #0
#endif
	bl PrintIqSkillsMenu
	b _02306C30
_02306BC4:
	ldrsb r0, [r2, #0x21]
	bl CloseDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306C30
_02306BEC:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306C30
_02306BFC:
	mov r1, #0xf
	str r1, [r2, #0x14]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, _02306C60 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
_02306C30:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306C38: .word ov11_02324D88
#ifdef JAPAN
_023081EC: .word 0x00002FB4
#endif
_02306C3C: .word ov11_02322C10
_02306C40: .word 0x00300011
_02306C44: .word ov11_02322C38
#ifdef JAPAN
_02306C48: .word 0x00002FBE
#else
_02306C48: .word 0x000002EA
#endif
_02306C4C: .word 0x00300031
_02306C50: .word ov11_02322C20
#ifdef JAPAN
_02308208: .word 0x00002FB8
#endif
_02306C54: .word ov11_02322C00
_02306C58: .word ov11_02322C50
_02306C5C: .word TEAM_MEMBER_TABLE_PTR
#ifdef JAPAN
_02306C60: .word 0x00002FB7
#else
_02306C60: .word 0x000002E3
#endif
	arm_func_end ov11_02306794

	arm_func_start ov11_02306C64
ov11_02306C64: ; 0x02306C64
	stmdb sp!, {r4, lr}
	ldr r0, _02306C98 ; =ov11_02324D88
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _02306C90
	ldr r4, [r0, #8]
	bl MemFree
	ldr r0, _02306C98 ; =ov11_02324D88
	mov r1, #0
	str r1, [r0]
_02306C90:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02306C98: .word ov11_02324D88
	arm_func_end ov11_02306C64

	arm_func_start ov11_02306C9C
ov11_02306C9C: ; 0x02306C9C
#ifdef JAPAN
#define OV11_02306C9C_OFFSET -4
#else
#define OV11_02306C9C_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _023071B8
_02306CB8: ; jump table
	b _02306CC8 ; case 0
	b _02306CD4 ; case 1
	b _0230717C ; case 2
	b _023071B0 ; case 3
_02306CC8:
	mov r0, #1
	str r0, [r2, #0x28 + OV11_02306C9C_OFFSET]
	b _023071B8
_02306CD4:
	ldr r0, [r2, #0x10]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	b _023070B0
_02306CE4: ; jump table
	b _02307120 ; case 0
	b _023070B0 ; case 1
	b _023070B0 ; case 2
	b _02306D40 ; case 3
	b _023070B0 ; case 4
	b _023070B0 ; case 5
	b _023070B0 ; case 6
	b _023070E4 ; case 7
	b _02307058 ; case 8
	b _02307060 ; case 9
	b _02307068 ; case 10
	b _023070B0 ; case 11
	b _02307120 ; case 12
	b _02307104 ; case 13
	b _023070B0 ; case 14
	b _02306DE8 ; case 15
	b _02306DDC ; case 16
	b _02306DE8 ; case 17
	b _02306ED0 ; case 18
	b _02306EFC ; case 19
	b _02306FDC ; case 20
	b _02307018 ; case 21
	b _02307070 ; case 22
_02306D40:
	ldrsb r0, [r2, #0x22]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _023071C0 ; =ov11_02324D88
	ldrne r1, [r1]
	strne r0, [r1, #0x1c]
	cmp r0, #1
	beq _02306D84
	cmp r0, #2
	beq _02306D74
	cmp r0, #3
	beq _02306D84
	b _02307120
_02306D74:
	bl ov11_023071C4
	mov r0, #0x17
	bl ov11_023062BC
	b _02307120
_02306D84:
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	beq _02306DA0
	mov r0, #3
	bl sub_02017C50
_02306DA0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl CloseDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xa
	strb r3, [r1, #0x21]
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #0x2c + OV11_02306C9C_OFFSET]
	bl ov11_023062BC
	b _02307120
_02306DDC:
	mov r0, #0x11
	bl ov11_023062BC
	b _02307120
_02306DE8:
	bl sub_0203A5A8
	cmp r0, #0
	beq _02306E70
	bl sub_0203A9EC
	cmp r0, #0
	beq _02307120
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02307120
	bl sub_0203AAB0
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203A5F0
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #0xc
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306E70:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _02306EA8
	bl sub_0203A51C
	ldr r1, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x12
	str r3, [r2, #0x18]
	ldr r1, [r1]
	str r3, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EA8:
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0x13
	bl ov11_023062BC
	b _02307120
_02306ED0:
	ldr r1, [r2, #0x18]
	sub r0, r1, #1
	str r0, [r2, #0x18]
	cmp r1, #0
	bne _02307120
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EFC:
	ldrsb r0, [r2, #0x22]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02307120
_02306F10: ; jump table
	b _02307120 ; case 0
	b _02306FC0 ; case 1
	b _02307120 ; case 2
	b _02307120 ; case 3
	b _02306F30 ; case 4
	b _02306F60 ; case 5
	b _02306F90 ; case 6
	b _02306FC0 ; case 7
_02306F30:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #4
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F60:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F90:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x15
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306FC0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl sub_0203A638
	b _02307120
_02306FDC:
	bl sub_0203F398
	cmp r0, #1
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x84 + OV11_02306C9C_OFFSET]
	bl sub_0202836C
	bl sub_0203F990
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1, #0x84 + OV11_02306C9C_OFFSET]
	bl ov11_023062BC
	b _02307120
_02307018:
	bl sub_02041B7C
	cmp r0, #1
	bne _02307120
	bl sub_020420F4
#ifndef JAPAN
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0230704C
	bl sub_0205633C
	cmp r0, #0
	bne _0230704C
#endif
	bl sub_020572EC
_0230704C:
	mov r0, #0x10
	bl ov11_023062BC
	b _02307120
_02307058:
	mov r2, #3
	b _02307124
_02307060:
	mov r2, #2
	b _02307124
_02307068:
	mov r2, #4
	b _02307124
_02307070:
	ldrsb r0, [r2, #0x21]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl sub_0202F2C4
	b _02307120
_023070B0:
	ldrsb r0, [r2, #0x21]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_023070E4:
	ldr r1, [r2, #0x2c + OV11_02306C9C_OFFSET]
	sub r0, r1, #1
	str r0, [r2, #0x2c + OV11_02306C9C_OFFSET]
	cmp r1, #0
	bgt _02307120
	mov r0, #8
	bl ov11_023062BC
	b _02307120
_02307104:
	ldr r1, [r2, #0x2c + OV11_02306C9C_OFFSET]
	sub r0, r1, #1
	str r0, [r2, #0x2c + OV11_02306C9C_OFFSET]
	cmp r1, #0
	bgt _02307120
	mov r0, #0xe
	bl ov11_023062BC
_02307120:
	mov r2, #1
_02307124:
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r1, [r0]
	str r2, [r1, #0x80 + OV11_02306C9C_OFFSET]
	ldr r2, [r0]
	ldr r1, [r2, #0x80 + OV11_02306C9C_OFFSET]
	cmp r1, #1
	beq _023071B8
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x80 + OV11_02306C9C_OFFSET]
	ldreq r0, [r0]
	streq r1, [r0, #0x28 + OV11_02306C9C_OFFSET]
	beq _023071B8
	mov r1, #2
	str r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	ldr r0, [r0]
	sub r1, r1, #4
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl sub_0202F2C4
	b _023071B8
_0230717C:
	mov r1, #3
	str r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	ldr r0, [r0]
	sub r1, r1, #5
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl CloseDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x21]
	b _023071B8
_023071B0:
	ldr r0, [r2, #0x80 + OV11_02306C9C_OFFSET]
	ldmia sp!, {r3, pc}
_023071B8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023071C0: .word ov11_02324D88
	arm_func_end ov11_02306C9C

	arm_func_start ov11_023071C4
ov11_023071C4: ; 0x023071C4
	stmdb sp!, {r3, lr}
	ldr r0, _02307208 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02307208 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	ldr r0, _02307208 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x22]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307208: .word ov11_02324D88
	arm_func_end ov11_023071C4

	arm_func_start ov11_0230720C
ov11_0230720C: ; 0x0230720C
	stmdb sp!, {r3, lr}
	ldr r1, _02307240 ; =ov11_02324D88
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x21]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02307240 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x21]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307240: .word ov11_02324D88
	arm_func_end ov11_0230720C

	arm_func_start ov11_02307244
ov11_02307244: ; 0x02307244
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #8
	bl MemAlloc
	ldr r1, _023072FC ; =ov11_02324D8C
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x31c
	bl ValidateTeamMembers
	ldr r2, _023072FC ; =ov11_02324D8C
	mvn lr, #1
	ldr r0, [r2]
	add ip, lr, #1
	strb lr, [r0, #4]
	ldr r0, [r2]
	mov r3, #0
	strb lr, [r0, #5]
	ldr r1, [r2]
	mov r0, #1
	strb lr, [r1, #6]
	ldr r1, [r2]
	strb lr, [r1, #7]
	ldr r1, [r2]
	strb lr, [r1, #8]
	ldr r1, [r2]
	strb lr, [r1, #9]
	ldr r1, [r2]
	strb lr, [r1, #0xa]
	ldr r1, [r2]
	strb lr, [r1, #0xb]
	ldr r1, [r2]
	strb lr, [r1, #0xc]
	ldr r1, [r2]
	str ip, [r1, #0x18]
	ldr r1, [r2]
	str r3, [r1, #0x10]
	ldr r1, [r2]
	add r1, r1, #0x200
	strh ip, [r1, #0x54]
	ldr r1, [r2]
	str r3, [r1]
	ldr r1, [r2]
	str r3, [r1, #0x324]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023072FC: .word ov11_02324D8C
	arm_func_end ov11_02307244

	arm_func_start ov11_02307300
ov11_02307300: ; 0x02307300
	stmdb sp!, {r4, lr}
	ldr ip, _02307330 ; =ov11_02324D8C
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #0x104]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02307330: .word ov11_02324D8C
	arm_func_end ov11_02307300
