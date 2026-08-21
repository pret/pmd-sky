	.include "asm/macros.inc"
	.include "overlay_11_022FAC54.inc"

	.text

	arm_func_start SetBlinkLiveActor
SetBlinkLiveActor: ; 0x022FAC54
	ldr ip, _022FAC60 ; =ov11_022F4984
	add r0, r0, #0x18c
	bx ip
	.align 2, 0
_022FAC60: .word ov11_022F4984
	arm_func_end SetBlinkLiveActor

	arm_func_start SetPositionOffsetLiveActor
SetPositionOffsetLiveActor: ; 0x022FAC64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r2, _022FAE54 ; =ov11_02321684
	mov r5, r0
	ldr r0, [r2, #0xd4]
	ldr r3, [r2, #0xd0]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r4, [r5, #0x15c]
	ldr r3, [r1]
	add r0, r5, #0x38
	add r3, r4, r3
	str r3, [sp]
	ldr r4, [r5, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0xc8]
	ldr r2, [r2, #0xcc]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x164]
	ldr r2, [r1]
	add r2, r3, r2
	str r2, [sp, #8]
	ldr r2, [r5, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	bl ov11_022DC958
	cmp r0, #0
	bne _022FAE0C
	ldr r1, [r5, #0x28]
	ldr r0, [sp]
	mov r4, #0
	cmp r0, r1
	bge _022FAD14
	str r1, [sp]
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0xc]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FAD3C
_022FAD14:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r1
	blt _022FAD3C
	ldr r0, [r5, #0xc]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x30]
	str r0, [sp, #8]
_022FAD3C:
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FAD68
	str r1, [sp, #4]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FAD90
_022FAD68:
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FAD90
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0xc]
_022FAD90:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022F921C
	movs r6, r0
	beq _022FADC4
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE48
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FAE48
_022FADC4:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
	beq _022FAE2C
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE04
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FAE04:
	mov r6, #0x40
	b _022FAE48
_022FAE0C:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
_022FAE2C:
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE44
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FAE44:
	mov r6, #0
_022FAE48:
	mov r0, r6
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FAE54: .word ov11_02321684
	arm_func_end SetPositionOffsetLiveActor

	arm_func_start ov11_022FAE58
ov11_022FAE58: ; 0x022FAE58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x9c
	ldr r1, _022FBA18 ; =ov11_02324CF8
	mvn r2, #0
	ldmia r1, {r0, r5}
	add r0, r0, #0x300
	strh r2, [r0, #0x28]
	ldr r0, [r1]
	mov r4, #0
	ldr fp, _022FBA1C ; =ov11_02321684
	str r4, [r0, #0x32c]
	ldr sl, [fp, #0xb8]
	ldr sb, [fp, #0xbc]
	ldr r8, [fp, #8]
	ldr r7, [fp, #0xc]
	ldr r6, [fp, #0x150]
	ldr r3, [fp, #0x154]
	ldr r2, [fp, #0xb0]
	ldr r1, [fp, #0xb4]
	ldr r0, [fp, #0x158]
	ldr fp, [fp, #0x15c]
	str sl, [sp, #0x2c]
	str sb, [sp, #0x30]
	str r8, [sp, #0x24]
	str r7, [sp, #0x28]
	str r6, [sp, #0x1c]
	str r3, [sp, #0x20]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	str fp, [sp, #0x10]
_022FAED4:
	ldrsh r1, [r5, #2]
	mvn r0, #0
	cmp r1, r0
	ldrneb r0, [r5, #4]
	cmpne r0, #0
	beq _022FB894
	add r0, r5, #0x38
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FAF24
	mov r1, #1
	strb r1, [r5, #0x152]
	strb r1, [r5, #0x156]
	mov r1, #0
	str r1, [r5, #0x14c]
	cmp r0, #6
	bne _022FB864
	mov r0, r4
	bl DeleteLiveActor
	b _022FB894
_022FAF24:
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	bne _022FAF4C
	mov r0, #1
	strb r0, [r5, #0x152]
	strb r0, [r5, #0x156]
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FAF4C:
	ldr r1, [r5, #0x128]
	tst r1, #1
	beq _022FB39C
	mov r1, #0
	str r1, [sp, #0x98]
	strb r0, [sp, #8]
	str r1, [sp, #0x94]
	bl ov11_022F9074
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x152]
	streqb r0, [r5, #0x156]
	beq _022FAFA0
	ldrb r0, [r5, #0x156]
	cmp r0, #0
	beq _022FAFA0
	bl sub_02006DC8
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	strb r0, [r5, #0x156]
_022FAFA0:
	ldr r2, _022FBA18 ; =ov11_02324CF8
	add r3, sp, #0x8c
	ldr r0, [r2]
	add r1, sp, #0x98
	add r0, r0, #0x300
	strh r4, [r0, #0x28]
	ldr r0, [r2]
	add r2, sp, #8
	str r5, [r0, #0x32c]
	str r3, [sp]
	ldr r6, [r5, #0x128]
	add r3, sp, #0x94
	add r0, r5, #0x12c
	str r6, [sp, #4]
	bl ov11_022EAA24
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022FB864
_022FAFE8: ; jump table
	b _022FB864 ; case 0
	b _022FB00C ; case 1
	b _022FB090 ; case 2
	b _022FB108 ; case 3
	b _022FB270 ; case 4
	b _022FB864 ; case 5
	b _022FB068 ; case 6
	b _022FB864 ; case 7
	b _022FB068 ; case 8
_022FB00C:
	ldr r0, [sp, #0x98]
	cmp r0, #0
	beq _022FB024
	sub r0, r0, #3
	cmp r0, #2
	bhi _022FB040
_022FB024:
	ldrsb r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	beq _022FB048
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB048
_022FB040:
	add r0, r5, #0x12c
	bl ov11_022EAF60
_022FB048:
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB068:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB090:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r2, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r3, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x84]
	ldr r1, [r5, #0x160]
	ldr r0, [r5, #0x18]
	add r2, r2, #8
	add r1, r1, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	sub r1, r2, r0, asr #8
	add r0, sp, #0x84
	str r1, [sp, #0x88]
	bl sub_020054C0
	strb r0, [sp, #8]
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	str r0, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r0, r5
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB108:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r2, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r2, r0, asr #8
	str r0, [sp, #0x7c]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r3, r3, #8
	add r2, r2, r1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	sub r2, r3, r1, asr #8
	str r2, [sp, #0x80]
	ldr r1, [r5, #0x14c]
	sub r1, r1, #3
	cmp r1, #2
	bhi _022FB194
	mvn r1, #3
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #4
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #4
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB194:
	mvn r1, #0xb
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #0xc
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #0xc
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB1CC:
	add r0, sp, #0x7c
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB264
	ldr r0, [sp, #0x98]
	cmp r0, #0xc
	beq _022FB208
	cmp r0, #0xd
	beq _022FB224
	cmp r0, #0xe
	beq _022FB240
	b _022FB25C
_022FB208:
	mov r6, #0
	mov r0, r5
	mov r1, #3
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB224:
	mov r6, #0
	mov r0, r5
	mov r1, #4
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB240:
	mov r6, #0
	mov r0, r5
	mov r1, #5
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB25C:
	mov r0, #0
	str r0, [r5, #0x14c]
_022FB264:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB864
_022FB270:
	ldr r0, [sp, #0x94]
	ldr r6, [sp, #0x90]
	cmp r0, #0
	ldr r2, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x8c]
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x74]
	ldr r3, [r5, #0x160]
	ldr r2, [r5, #0x18]
	movne r1, #1
	add r3, r3, r2
	mov r2, r3, asr #7
	add r6, r6, #8
	add r2, r3, r2, lsr #24
	sub r3, r6, r2, asr #8
	moveq r1, #0
	mvn r2, #1
	str r3, [sp, #0x78]
	cmp r0, r2
	and r6, r1, #0xff
	blt _022FB300
	cmp r0, #2
	bgt _022FB300
	cmp r3, r2
	blt _022FB300
	cmp r3, #2
	bgt _022FB300
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB300:
	add r0, sp, #0x74
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB864
	ldr r0, [sp, #0x98]
	cmp r0, #0xf
	beq _022FB33C
	cmp r0, #0x10
	beq _022FB358
	cmp r0, #0x11
	beq _022FB374
	b _022FB390
_022FB33C:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #6
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB358:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #7
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB374:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #8
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB390:
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FB39C:
	tst r1, #2
	beq _022FB864
	mov r0, #0
	str r0, [r5, #0x14c]
	add r1, r5, #0x100
	ldr r3, _022FBA18 ; =ov11_02324CF8
	ldrsh r8, [r1, #0x50]
	ldr r6, [r3]
	mov r2, #0xc
	smlabb r7, r8, r2, r6
	cmp r8, #0
	beq _022FB864
	mov r2, #0x300
	strh r2, [r1, #0x76]
	mov r2, #1
	strh r2, [r1, #0x78]
	ldr r8, [r5, #0x15c]
	ldr r6, [r5, #0x14]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r6, r8, r6
	add r2, r2, r1
	str r6, [sp, #0x3c]
	str r2, [sp, #0x40]
	ldr r1, [r7, #8]
	str r6, [sp, #0x34]
	str r2, [sp, #0x38]
	cmp r1, #0
	bge _022FB42C
	ldr r1, [r3]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	blt _022FB864
	str r1, [r7, #8]
	str r0, [r7]
	str r0, [r7, #4]
_022FB42C:
	ldr sl, [r7]
	mov sb, #1
	ldr lr, _022FBA18 ; =ov11_02324CF8
	mov fp, #0xc
	b _022FB570
_022FB440:
	ldr ip, [lr]
	ldr r0, [r7, #8]
	add r1, ip, #0x28
	mla r8, r0, fp, r1
	ldr r6, [r8, #4]
	ldr r2, [sp, #0x3c]
	ldr r1, [r8, #8]
	sub r3, r6, r2
	str r3, [sp, #0x44]
	cmp r3, #0
	ldr r0, [sp, #0x40]
	sub r0, r1, r0
	str r0, [sp, #0x48]
	ble _022FB494
	cmp r3, sl
	addgt r0, r2, sl
	strgt r0, [sp, #0x3c]
	movgt sb, #0
	strle r6, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	b _022FB4C4
_022FB494:
	cmp r3, #0
	bge _022FB4C0
	rsb r0, sl, #0
	cmp r3, r0
	sublt r0, r2, sl
	strlt r0, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	movlt sb, #0
	strge r6, [sp, #0x3c]
	rsb r1, r0, #0
	b _022FB4C4
_022FB4C0:
	mov r1, #0
_022FB4C4:
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _022FB4FC
	cmp r0, sl
	ldrgt r0, [sp, #0x40]
	movgt sb, #0
	addgt r0, r0, sl
	strgt r0, [sp, #0x40]
	bgt _022FB530
	ldr r2, [r8, #8]
	cmp r0, r1
	str r2, [sp, #0x40]
	movgt r1, r0
	b _022FB530
_022FB4FC:
	bge _022FB530
	rsb r2, sl, #0
	cmp r0, r2
	ldrlt r0, [sp, #0x40]
	movlt sb, #0
	sublt r0, r0, sl
	strlt r0, [sp, #0x40]
	blt _022FB530
	ldr r3, [r8, #8]
	rsb r2, r1, #0
	cmp r0, r2
	str r3, [sp, #0x40]
	rsblt r1, r0, #0
_022FB530:
	cmp sb, #0
	beq _022FB570
	sub sl, sl, r1
	cmp sl, #0
	movle sb, #0
	ble _022FB570
	ldr r0, [ip, #0x24]
	ldr r1, [r7, #8]
	cmp r1, r0
	moveq sb, #0
	beq _022FB570
	add r0, r1, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	str r0, [r7, #8]
_022FB570:
	cmp sb, #0
	bne _022FB440
	ldr r0, _022FBA18 ; =ov11_02324CF8
	ldr r3, [r7, #8]
	ldr r1, [r0]
	mov r6, #0
	ldr r0, [r1, #0x24]
	cmp r0, r3
	ble _022FB5BC
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5B0
_022FB5A0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5B0:
	cmp sb, r0
	blt _022FB5A0
	b _022FB608
_022FB5BC:
	bge _022FB608
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5DC
_022FB5CC:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5DC:
	cmp sb, #0x40
	blt _022FB5CC
	mov sb, #0
	mov r2, #0xc
	b _022FB600
_022FB5F0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB600:
	cmp sb, r0
	blt _022FB5F0
_022FB608:
	ldr r0, _022FBA18 ; =ov11_02324CF8
	ldr lr, [sp, #0x14]
	ldr r2, [r0]
	ldr ip, [sp, #0x18]
	add r8, r5, #0x100
	add r0, r2, #0x28
	mov r1, #0xc
	mla r0, r3, r1, r0
	ldrsh r3, [r8, #0x50]
	ldr sl, _022FBA20 ; =ov11_023217EC
	ldr r8, [sp, #0x40]
	mla r2, r3, r1, r2
	ldmib r0, {r1, sb}
	ldr r0, [sp, #0x3c]
	sub r8, sb, r8
	sub r0, r1, r0
	ldr r2, [r2, #-8]
	ldr r1, [sl, r3, lsl #2]
	str r8, [sp, #0x50]
	str lr, [sp, #0x54]
	str r0, [sp, #0x4c]
	str ip, [sp, #0x58]
	add r8, r2, r1
	bl abs
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x50]
	bl abs
	ldr r1, [sp, #0x54]
	str r0, [sp, #0x58]
	cmp r1, r0
	movle r1, r0
	add r1, r6, r1
	str r1, [r7, #4]
	cmp r1, r8
	bgt _022FB6A8
	ldr r0, [r7]
	cmp r0, #0
	subgt r0, r0, #0x100
	strgt r0, [r7]
	b _022FB700
_022FB6A8:
	add r0, r5, #0x100
	ldrsh r2, [r0, #0x50]
	mov r0, #0x1800
	mul r0, r2, r0
	cmp r1, r0
	bgt _022FB6D4
	ldr r0, [r7]
	cmp r0, #0x100
	addlt r0, r0, #0x100
	strlt r0, [r7]
	b _022FB700
_022FB6D4:
	ldr r1, _022FBA18 ; =ov11_02324CF8
	mov r0, #0xc
	ldr r1, [r1]
	mla r0, r2, r0, r1
	ldr r1, [r0, #-0xc]
	ldr r0, [r7]
	cmp r1, #0x100
	movlt r1, #0x100
	cmp r0, r1
	addlt r0, r0, #0x100
	strlt r0, [r7]
_022FB700:
	ldr r2, _022FBA18 ; =ov11_02324CF8
	ldr r0, [r7, #8]
	ldr r1, [r2]
	ldr r3, [r1, #0x24]
	add r1, r3, #0x40
	sub r0, r1, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	cmp r0, #0x3c
	blt _022FB75C
	add r0, r3, #5
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r3, r1, r0, ror #26
	str r3, [r7, #8]
	ldr r1, [r2]
	mov r0, #0xc
	mla r0, r3, r0, r1
	ldr r1, [r0, #0x2c]
	ldr r0, [r0, #0x30]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
_022FB75C:
	add r1, sp, #0x3c
	mov r0, r5
	bl SetPositionLiveActor
	cmp r0, #0
	bne _022FB864
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	sub r2, r3, r2
	sub r1, r1, r0
	add r0, sp, #0x5c
	str r2, [sp, #0x5c]
	str r1, [sp, #0x60]
	bl sub_020054C0
	add r2, r5, #0x100
	mov r1, r0
	ldrsb r0, [r2, #0x5a]
	bl sub_02005430
	strb r0, [r5, #0x15a]
	ldr r0, [r7]
	cmp r0, #0
	ble _022FB7F4
	mov r0, #4
	str r0, [r5, #0x17c]
	ldr r0, [r7]
	ldr r1, [r5, #0x128]
	cmp r0, #0x200
	movgt r0, #0xa00
	movle r0, #0x800
	mov r0, r0, lsl #0x10
	tst r1, #0x20
	mov r6, r0, asr #0x10
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FB818
_022FB7F4:
	mov r0, #0
	str r0, [r5, #0x17c]
	ldr r0, [r5, #0x128]
	ldr r6, _022FBA24 ; =0x00000807
	tst r0, #0x20
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FB818:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	addeq r0, r5, #0x100
	ldreqsh r1, [r0, #0x80]
	cmpeq r6, r1
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FB864
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	strh r6, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FB864:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	beq _022FB894
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FB894:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x18
	add r5, r5, #0x250
	blt _022FAED4
	ldr r7, _022FBA18 ; =ov11_02324CF8
	mov r2, #0
	ldr r5, [r7]
	ldr r1, [r7, #4]
	sub r0, r2, #1
	str r2, [r5]
	str r2, [r5, #4]
	ldrsh r3, [r1, #2]
	cmp r3, r0
	bne _022FB8DC
	bl InitPartnerFollowData
	b _022FBA10
_022FB8DC:
	ldr r0, [r1, #0x128]
	tst r0, #2
	beq _022FBA0C
	ldr r0, [r7]
	ldr r6, [r0, #0x24]
	cmp r6, #0
	bge _022FB948
	str r2, [r0, #0x24]
	str r2, [r0, #0x28]
	ldr r4, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	add r3, r4, r3
	str r3, [r0, #0x2c]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x30]
	ldr r1, [r7]
	mov r0, r2
_022FB928:
	str r0, [r1, #8]
	str r0, [r1]
	add r2, r2, #1
	str r0, [r1, #4]
	cmp r2, #3
	add r1, r1, #0xc
	blt _022FB928
	b _022FBA10
_022FB948:
	add r2, r6, #1
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #26
	add r2, r3, r2, ror #26
	str r2, [r0, #0x24]
	ldr r3, [r7]
	mov r0, #0xc
	ldr r2, [r3, #0x24]
	add r3, r3, #0x28
	mla r4, r2, r0, r3
	ldr r8, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	ldr r2, _022FBA1C ; =ov11_02321684
	add r3, r8, r3
	str r3, [r4, #4]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r4, #8]
	ldr r1, [r7]
	ldr r3, [r2, #0x18]
	add r1, r1, #0x28
	mla r7, r6, r0, r1
	ldr r1, [r2, #0x1c]
	ldr r0, [r7, #8]
	ldr r2, [r4, #8]
	ldr r8, [r4, #4]
	sub r2, r2, r0
	ldr r7, [r7, #4]
	str r2, [sp, #0x70]
	sub r0, r8, r7
	str r3, [sp, #0x64]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x68]
	bl abs
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x70]
	bl abs
	ldr r1, [sp, #0x64]
	str r0, [sp, #0x68]
	cmp r1, r0
	movle r1, r0
	cmp r1, #0
	ldrle r0, _022FBA18 ; =ov11_02324CF8
	str r1, [r4]
	ldrle r0, [r0]
	strle r6, [r0, #0x24]
	strgt r1, [r5]
	b _022FBA10
_022FBA0C:
	bl InitPartnerFollowData
_022FBA10:
	add sp, sp, #0x9c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBA18: .word ov11_02324CF8
_022FBA1C: .word ov11_02321684
_022FBA20: .word ov11_023217EC
_022FBA24: .word 0x00000807
	arm_func_end ov11_022FAE58

	arm_func_start InitPartnerFollowData
InitPartnerFollowData: ; 0x022FBA28
	ldr r0, _022FBA64 ; =ov11_02324CF8
	mvn r2, #0
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0x24]
	ldr r1, [r0]
	mov r0, r3
_022FBA44:
	str r2, [r1, #8]
	str r0, [r1]
	add r3, r3, #1
	str r0, [r1, #4]
	cmp r3, #3
	add r1, r1, #0xc
	blt _022FBA44
	bx lr
	.align 2, 0
_022FBA64: .word ov11_02324CF8
	arm_func_end InitPartnerFollowData

	arm_func_start ov11_022FBA68
ov11_022FBA68: ; 0x022FBA68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FBBC0 ; =ov11_02321684
	ldr r1, _022FBBC4 ; =ov11_02324CF8
	ldr r8, [r0, #0x48]
	ldr r7, [r0, #0x4c]
	mov sb, #0
	ldr sl, [r1, #4]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FBA98:
	ldrsh r0, [sl, #2]
	cmp r0, r4
	ldrneb r0, [sl, #4]
	cmpne r0, #0
	beq _022FBBA0
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r1, [sl, #0x15c]
	ldr r0, [sl, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sl, #0x160]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sl, #0x17c]
	ldr r6, [sl, #0x16c]
	cmp r0, #0
	ldr r5, [sl, #0x170]
	ble _022FBB20
	sub r0, r0, #1
	str r0, [sl, #0x17c]
	cmp r0, #0
	bgt _022FBB20
	add r0, sl, #0x100
	ldrh r1, [r0, #0x78]
	add r0, r1, #0xff
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FBB20
	mov r0, sl
	bl ChangeActorAnimation
_022FBB20:
#ifdef JAPAN
	add r0, sl, #0x18c
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FBB54
#else
	add r0, sl, #0x200
	ldrsh r1, [r0, #0x1e]
	cmp r1, #0
	bge _022FBB54
	ldrsh r0, [r0, #0x18]
	cmp r0, #0
	ble _022FBB54
#endif
	strb fp, [sl, #0x174]
	add r0, sl, #0x100
	ldrsh r1, [r0, #0x80]
	ldrsb r2, [r0, #0x75]
	add r0, sl, #0x18c
	bl SetAnimDataFields2
_022FBB54:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x82]
	cmp r1, r4
	beq _022FBB8C
	ldr r2, [sl, #0x188]
	add r0, sl, #0x18c
	str r2, [sp]
	ldrsh r2, [r3, #0x84]
	ldrsb r3, [r3, #0x5a]
	bl ov11_022F5C48
	add r1, sl, #0x100
	strh r4, [r1, #0x82]
	mov r0, #0
	strh r0, [r1, #0x84]
_022FBB8C:
	ldrsh r1, [sl, #0xa]
	add r2, sp, #0xc
	add r0, sl, #0x18c
	add r3, r6, r5
	bl ov11_022F5C94
_022FBBA0:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x18
	add sl, sl, #0x250
	blt _022FBA98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBBC0: .word ov11_02321684
_022FBBC4: .word ov11_02324CF8
	arm_func_end ov11_022FBA68

	arm_func_start ov11_022FBBC8
ov11_022FBBC8: ; 0x022FBBC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	ldr r1, [sp]
	ldr r0, [r5]
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	add r0, r1, r0
	str r0, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022FBBC8

	arm_func_start ov11_022FBC0C
ov11_022FBC0C: ; 0x022FBC0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, _022FBDB8 ; =ov11_02324CF8
	ldmia r1, {r2, r3}
	add r7, r3, #8
	ldr r8, [sb]
	sub r6, r2, #0xc
	add r3, r2, #0xc
	add r1, r7, #0x14
	ldr fp, [r8, #0x32c]
	mov ip, r6, lsl #8
	sub r4, r7, #4
	mov r6, r4, lsl #8
	mov r3, r3, lsl #8
	mov lr, r1, lsl #8
	mov r5, #0
	str ip, [sp, #0x10]
	str r3, [sp, #8]
	str r6, [sp, #0x14]
	str lr, [sp, #0xc]
	str r5, [sp, #4]
	str r2, [sp, #0x18]
	ldr r2, [sb, #4]
	mov r4, r0
	mov r1, r5
	str r7, [sp, #0x1c]
	add r8, r8, #0x300
	mvn sb, #0
	b _022FBD1C
_022FBC80:
	ldrsh r0, [r2, #2]
	cmp r0, sb
	beq _022FBD0C
	ldr sl, [r2, #0x15c]
	cmp sl, r3
	bge _022FBD0C
	ldr sl, [r2, #0x164]
	cmp sl, ip
	ble _022FBD0C
	ldr sl, [r2, #0x160]
	cmp sl, lr
	bge _022FBD0C
	ldr sl, [r2, #0x168]
	cmp sl, r6
	ble _022FBD0C
	ldrsh sl, [r8, #0x28]
	cmp r1, sl
	moveq r5, #1
	beq _022FBD0C
	cmp r0, #0xd
	moveq r0, #1
	streq r0, [sp, #4]
	beq _022FBD0C
	ldr r0, [r2, #0x128]
	tst r0, #0x2000
	beq _022FBD0C
	add r2, sp, #8
	str r2, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r2, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #0
	b _022FBDB0
_022FBD0C:
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r2, r2, #0x250
_022FBD1C:
	cmp r1, #0x18
	blt _022FBC80
	ldr r0, [sp, #0x18]
	sub r1, r7, #6
	sub r3, r0, #6
	mov r6, r1, lsl #8
	add r2, r0, #6
	add r0, r7, #6
	mov r8, r3, lsl #8
	mov r7, r2, lsl #8
	mov r3, r0, lsl #8
	add r1, sp, #0x10
	add r2, sp, #8
	mov r0, #0x2000
	str r8, [sp, #0x10]
	str r7, [sp, #8]
	str r6, [sp, #0x14]
	str r3, [sp, #0xc]
	bl ov11_022FCDB0
	movs r2, r0
	bmi _022FBD94
	add r1, sp, #8
	str r1, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r1, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #1
	b _022FBDB0
_022FBD94:
	cmp r5, #0
	movne r0, #2
	bne _022FBDB0
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #3
	mvneq r0, #0
_022FBDB0:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBDB8: .word ov11_02324CF8
	arm_func_end ov11_022FBC0C

	arm_func_start ov11_022FBDBC
ov11_022FBDBC: ; 0x022FBDBC
	stmdb sp!, {r3, lr}
	mov r0, #0x2180
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FBE00 ; =ov11_02324D00
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FBDDC:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x218
	blt _022FBDDC
	bl ov11_022FBE04
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE00: .word ov11_02324D00
	arm_func_end ov11_022FBDBC

	arm_func_start ov11_022FBE04
ov11_022FBE04: ; 0x022FBE04
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FBE48 ; =ov11_02324D00
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FBE18:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FBE2C
	mov r0, r5
	bl DeleteLiveObject
_022FBE2C:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x218
	blt _022FBE18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBE48: .word ov11_02324D00
	arm_func_end ov11_022FBE04

	arm_func_start ov11_022FBE4C
ov11_022FBE4C: ; 0x022FBE4C
	stmdb sp!, {r3, lr}
	bl ov11_022FBE04
	ldr r0, _022FBE70 ; =ov11_02324D00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FBE70 ; =ov11_02324D00
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE70: .word ov11_02324D00
	arm_func_end ov11_022FBE4C

	arm_func_start ov11_022FBE74
ov11_022FBE74: ; 0x022FBE74
	mvn r1, #0
	cmp r0, r1
	beq _022FBEB8
	ldr r1, _022FBEC0 ; =ov11_02324D00
	mov r3, #0
	ldr r2, [r1]
	b _022FBEB0
_022FBE90:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x218
_022FBEB0:
	cmp r3, #0x10
	blt _022FBE90
_022FBEB8:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FBEC0: .word ov11_02324D00
	arm_func_end ov11_022FBE74

	arm_func_start ov11_022FBEC4
ov11_022FBEC4: ; 0x022FBEC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrsh r4, [r8]
	ldr r5, _022FC2C0 ; =OBJECTS
	mov r1, #0xc
	mov sb, r0
	smlabb r5, r4, r1, r5
	mov r7, r2
	mov sl, r3
	cmp sb, #0
	bge _022FBF58
	cmp r4, #5
	bne _022FBF08
	mov r0, r4
	bl ov11_022FBE74
	mov sb, r0
_022FBF08:
	cmp sb, #0
	bge _022FBF4C
	ldr r0, _022FC2C4 ; =ov11_02324D00
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FBF44
_022FBF24:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FBF4C
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x218
_022FBF44:
	cmp r3, #0x10
	blt _022FBF24
_022FBF4C:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FC2B8
_022FBF58:
	ldr r0, _022FC2C4 ; =ov11_02324D00
	ldrh r1, [r8]
	ldr r2, [r0]
	mov r0, #0x218
	str r1, [sp]
	ldrsh r1, [r5]
	smlabb r6, sb, r0, r2
	stmib sp, {r1, r7}
	ldr r1, _022FC2C8 ; =ov11_02321E4C
	mov r2, sb
	mov r3, r4
	str sl, [sp, #0xc]
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r6, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands fp, r0, #0xff
	beq _022FBFBC
	mov r1, #0
	add r0, r6, #0x154
	strb r1, [r6, #8]
	bl ov11_022F4A14
_022FBFBC:
	sub r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	strh sb, [r6, #4]
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r4, [r6, #6]
	strlsh r7, [r6, #0xa]
	strlsb sl, [r6, #0xc]
	mvnls r0, #0
	strlsb r0, [r6, #0xd]
	bls _022FC004
	cmp fp, #0
	mvnne r0, #0
	strneh r0, [r6, #0xa]
	strneb r0, [r6, #0xc]
	strb sl, [r6, #0xd]
_022FC004:
	ldrsh r0, [r5]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _022FC100
_022FC014: ; jump table
	b _022FC100 ; case 0
	b _022FC058 ; case 1
	b _022FC0F4 ; case 2
	b _022FC0B8 ; case 3
	b _022FC0C4 ; case 4
	b _022FC0C4 ; case 5
	b _022FC0D0 ; case 6
	b _022FC0DC ; case 7
	b _022FC0E8 ; case 8
	b _022FC0AC ; case 9
	b _022FC064 ; case 10
	b _022FC058 ; case 11
	b _022FC070 ; case 12
	b _022FC0A0 ; case 13
	b _022FC094 ; case 14
	b _022FC088 ; case 15
	b _022FC07C ; case 16
_022FC058:
	mov r0, #0
	str r0, [r6, #0x12c]
	b _022FC108
_022FC064:
	mov r0, #0x20000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC070:
	mov r0, #0x40000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC07C:
	mov r0, #0x20000000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC088:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC094:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0A0:
	mov r0, #0x10000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0AC:
	mov r0, #0x140
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0B8:
	ldr r0, _022FC2CC ; =0x02006100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0C4:
	mov r0, #0x6100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0D0:
	mov r0, #0x1100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0DC:
	mov r0, #0x2100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0E8:
	mov r0, #0x6000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0F4:
	ldr r0, _022FC2D0 ; =0x02003100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC100:
	ldr r0, _022FC2D4 ; =0x02006140
	str r0, [r6, #0x12c]
_022FC108:
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x80000000
	strne r0, [r6, #0x12c]
	ldrb r0, [r5, #2]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r6, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r6, #0x10]
	ldrneb r0, [r5, #3]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x14]
	ldr r0, [r6, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r6, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FC19C
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r6, #0x24]
	addne r0, r0, #0x400
	strne r0, [r6, #0x24]
_022FC19C:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FC1C8
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r6, #0x28]
	addne r0, r0, #0x400
	strne r0, [r6, #0x28]
_022FC1C8:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x800000
	strne r0, [r6, #0x12c]
	cmp fp, #0
	beq _022FC2A0
	ldrsb r0, [r6, #0x20]
	mov r2, #0
	strb r0, [r6, #0x130]
	ldr r3, [r6, #0x24]
	ldr r1, [r6, #0x18]
	add r0, r6, #0x2c
	sub r1, r3, r1
	str r1, [r6, #0x134]
	ldr r4, [r6, #0x24]
	ldr r3, [r6, #0x18]
	add r1, r6, #0x34
	add r3, r4, r3
	str r3, [r6, #0x13c]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	sub r3, r4, r3
	str r3, [r6, #0x138]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	add r3, r4, r3
	str r3, [r6, #0x140]
	str r2, [r6, #0x148]
	str r2, [r6, #0x144]
	bl ov11_022F1F08
	add r0, r6, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4e]
	strb r1, [r6, #0x14c]
	sub r1, r1, #2
	strh r1, [r0, #0x50]
	mov r1, #0
	strh r1, [r0, #0x52]
	ldrsh r1, [r6, #6]
	ldr r2, [r6, #0x12c]
	add r0, r6, #0x154
	bl LoadObjectAnimData
	ldr r1, _022FC2D8 ; =OBJECT_FUNCTION_TABLE
	mov r2, r6
	add r0, r6, #0x3c
	bl InitScriptRoutine
	ldrsh r0, [r5]
	cmp r0, #0x10
	bne _022FC2A0
	add r0, r6, #0x154
	mov r1, #0
	bl ov11_022F4974
_022FC2A0:
	ldrsh r2, [r8, #0xa]
	add r0, r6, #0x100
	mov r1, #1
	strh r2, [r0, #0x28]
	mov r0, sb
	strb r1, [r6, #8]
_022FC2B8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC2C0: .word OBJECTS
_022FC2C4: .word ov11_02324D00
_022FC2C8: .word ov11_02321E4C
_022FC2CC: .word 0x02006100
_022FC2D0: .word 0x02003100
_022FC2D4: .word 0x02006140
_022FC2D8: .word OBJECT_FUNCTION_TABLE
	arm_func_end ov11_022FBEC4

	arm_func_start ov11_022FC2DC
ov11_022FC2DC: ; 0x022FC2DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC43C ; =ov11_02321E98
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
	mov r8, #0
	bhi _022FC3A4
	ldr r0, _022FC440 ; =ov11_02324D00
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FC444 ; =ov11_02321EC4
	add r5, r4, #1
	mov r6, #1
_022FC338:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC388
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC388
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC388
	mov r0, r8
	bl DeleteLiveObject
_022FC388:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC338
	b _022FC434
_022FC3A4:
	ldr r0, _022FC440 ; =ov11_02324D00
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FC3C0:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FC41C
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FC448 ; =ov11_02321EF0
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FC408
	cmp sb, r5
	cmpne sb, r0
	bne _022FC41C
	mov r0, r8
	bl DeleteLiveObject
	b _022FC41C
_022FC408:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FC41C
	mov r0, r8
	bl DeleteLiveObject
_022FC41C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC3C0
_022FC434:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC43C: .word ov11_02321E98
_022FC440: .word ov11_02324D00
_022FC444: .word ov11_02321EC4
_022FC448: .word ov11_02321EF0
	arm_func_end ov11_022FC2DC

	arm_func_start DeleteLiveObject
DeleteLiveObject: ; 0x022FC44C
	stmdb sp!, {r4, lr}
	ldr r1, _022FC48C ; =ov11_02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldr r1, _022FC490 ; =ov11_02321F10
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x154
	bl ov11_022F6EFC
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC48C: .word ov11_02324D00
_022FC490: .word ov11_02321F10
	arm_func_end DeleteLiveObject

	arm_func_start ov11_022FC494
ov11_022FC494: ; 0x022FC494
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC5EC ; =ov11_02321F2C
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
	mov r8, #0
	bhi _022FC564
	ldr r0, _022FC5F0 ; =ov11_02324D00
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FC5F4 ; =ov11_02321EC4
	sub r4, r5, #1
	mov r6, #1
_022FC4F0:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC548
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC548
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC548
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FC548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC4F0
	b _022FC5E4
_022FC564:
	ldr r0, _022FC5F0 ; =ov11_02324D00
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FC5F4 ; =ov11_02321EC4
	sub r4, r5, #1
	mov fp, r7
_022FC580:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FC5CC
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FC5CC
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FC5CC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC580
_022FC5E4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC5EC: .word ov11_02321F2C
_022FC5F0: .word ov11_02324D00
_022FC5F4: .word ov11_02321EC4
	arm_func_end ov11_022FC494

	arm_func_start SetAttributeBitfieldLiveObject
SetAttributeBitfieldLiveObject: ; 0x022FC5F8
	stmdb sp!, {r3, lr}
	ldr r3, _022FC634 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	add r0, ip, #0x154
	orr r1, r2, r1
	str r1, [ip, #0x12c]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC634: .word ov11_02324D00
	arm_func_end SetAttributeBitfieldLiveObject

	arm_func_start ResetAttributeBitfieldLiveObject
ResetAttributeBitfieldLiveObject: ; 0x022FC638
	stmdb sp!, {r3, lr}
	ldr r3, _022FC678 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x154
	str r1, [ip, #0x12c]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC678: .word ov11_02324D00
	arm_func_end ResetAttributeBitfieldLiveObject

	arm_func_start ov11_022FC67C
ov11_022FC67C: ; 0x022FC67C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC6D8
	ldr r0, _022FC6E0 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC6D0
_022FC6A0:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC6C0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC6C0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC6D0:
	cmp r6, #0x10
	blt _022FC6A0
_022FC6D8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC6E0: .word ov11_02324D00
	arm_func_end ov11_022FC67C

	arm_func_start ov11_022FC6E4
ov11_022FC6E4: ; 0x022FC6E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC740
	ldr r0, _022FC748 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC738
_022FC708:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC728
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC728:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC738:
	cmp r6, #0x10
	blt _022FC708
_022FC740:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC748: .word ov11_02324D00
	arm_func_end ov11_022FC6E4

	arm_func_start ov11_022FC74C
ov11_022FC74C: ; 0x022FC74C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0
	sub r3, r0, #1
	mov r8, r1
	mov r7, r2
	cmp sb, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022FC7B8 ; =ov11_02324D00
	mov r6, r0
	ldr r5, [r1]
	mov r4, #1
_022FC77C:
	ldrsh r1, [r5, #6]
	cmp r1, sb
	bne _022FC79C
	mov r1, r8
	mov r2, r7
	add r0, r5, #0x3c
	bl ov11_022DCCEC
	mov r0, r4
_022FC79C:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC77C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC7B8: .word ov11_02324D00
	arm_func_end ov11_022FC74C

	arm_func_start ov11_022FC7BC
ov11_022FC7BC: ; 0x022FC7BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FC830
	ldr r0, _022FC838 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FC7E8:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FC818
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FC818
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FC818:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC7E8
_022FC830:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC838: .word ov11_02324D00
	arm_func_end ov11_022FC7BC

	arm_func_start ov11_022FC83C
ov11_022FC83C: ; 0x022FC83C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FC8BC ; =ov11_02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #0xa]
	add r0, r4, #0x100
	ldr r1, _022FC8C0 ; =ov11_02321F58
	str r3, [sp]
	ldrsh r3, [r0, #0x28]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #6]
	bl Debug_Print
	ldrsh r1, [r4, #6]
	mvn r0, #0
	cmp r1, r0
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x28]
	cmpne r1, r0
	moveq r0, #0
	beq _022FC8B4
	bl SetActorTalkSub
	add r1, r4, #0x100
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r1, #0x28]
	bl ov11_022F74A0
	mov r0, #1
_022FC8B4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC8BC: .word ov11_02324D00
_022FC8C0: .word ov11_02321F58
	arm_func_end ov11_022FC83C

	arm_func_start ov11_022FC8C4
ov11_022FC8C4: ; 0x022FC8C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FC9D4
	ldr r1, _022FCA8C ; =ov11_02321FA0
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCA90 ; =ov11_02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FC920:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FC9B8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FC9B8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FC9B8
	ldr r1, _022FCA94 ; =ov11_02321FE0
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FC9B8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FC9B8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x14c]
_022FC9B8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FC920
	b _022FCA80
_022FC9D4:
	ldr r1, _022FCA98 ; =ov11_02321FF4
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCA90 ; =ov11_02324D00
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FC9FC:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FCA68
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FCA68
	ldr r1, _022FCA94 ; =ov11_02321FE0
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FCA68
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x14c]
_022FCA68:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FC9FC
_022FCA80:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCA8C: .word ov11_02321FA0
_022FCA90: .word ov11_02324D00
_022FCA94: .word ov11_02321FE0
_022FCA98: .word ov11_02321FF4
	arm_func_end ov11_022FC8C4

	arm_func_start ov11_022FCA9C
ov11_022FCA9C: ; 0x022FCA9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FCB54
	ldr r1, _022FCBE0 ; =ov11_02322034
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCBE4 ; =ov11_02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FCAF4:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FCB38
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FCB38
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FCB38
	ldr r1, _022FCBE8 ; =ov11_02321FE0
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FCB38:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FCAF4
	b _022FCBD8
_022FCB54:
	ldr r1, _022FCBEC ; =ov11_02322074
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCBE4 ; =ov11_02324D00
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FCBE8 ; =ov11_02321FE0
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FCB80:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FCBC0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FCBC0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FCBC0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x218
	blt _022FCB80
_022FCBD8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCBE0: .word ov11_02322034
_022FCBE4: .word ov11_02324D00
_022FCBE8: .word ov11_02321FE0
_022FCBEC: .word ov11_02322074
	arm_func_end ov11_022FCA9C

	arm_func_start ov11_022FCBF0
ov11_022FCBF0: ; 0x022FCBF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FCC40 ; =ov11_02324D00
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FCC08:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FCC20
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FCC20:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FCC08
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FCC40: .word ov11_02324D00
	arm_func_end ov11_022FCBF0

	arm_func_start UnlockObjectRoutines
UnlockObjectRoutines: ; 0x022FCC44
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FCC9C ; =ov11_02324D00
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FCC60:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FCC7C
	mov r1, r6
	add r0, r4, #0x3c
	bl UnlockRoutine
	orr r5, r5, r0
_022FCC7C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x218
	blt _022FCC60
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FCC9C: .word ov11_02324D00
	arm_func_end UnlockObjectRoutines

	arm_func_start ov11_022FCCA0
ov11_022FCCA0: ; 0x022FCCA0
	ldr r3, _022FCCC0 ; =ov11_02324D00
	mov r2, #0x218
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldr r0, [r2, #0x12c]
	str r0, [r1]
	ldrsh r0, [r2, #6]
	bx lr
	.align 2, 0
_022FCCC0: .word ov11_02324D00
	arm_func_end ov11_022FCCA0

	arm_func_start ov11_022FCCC4
ov11_022FCCC4: ; 0x022FCCC4
	ldr r3, _022FCD14 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FCD08
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x138]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FCD08:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FCD14: .word ov11_02324D00
	arm_func_end ov11_022FCCC4

	arm_func_start GetCollidingObjectId
GetCollidingObjectId: ; 0x022FCD18
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCDAC ; =ov11_02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCD9C
_022FCD30:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCD8C
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCD8C
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCD8C
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCD8C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCD9C:
	cmp r3, #0x10
	blt _022FCD30
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCDAC: .word ov11_02324D00
	arm_func_end GetCollidingObjectId

	arm_func_start ov11_022FCDB0
ov11_022FCDB0: ; 0x022FCDB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCE44 ; =ov11_02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCE34
_022FCDC8:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCE24
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCE24
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCE24
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCE24:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCE34:
	cmp r3, #0x10
	blt _022FCDC8
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCE44: .word ov11_02324D00
	arm_func_end ov11_022FCDB0

	arm_func_start ov11_022FCE48
ov11_022FCE48: ; 0x022FCE48
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, _022FCF6C ; =ov11_02321D88
	mov r5, r1
	ldr r1, [r3, #0xc]
	ldr r3, [r3, #8]
	str r1, [sp, #0x14]
	str r3, [sp, #0x10]
	ldr r1, [r5]
	mov r6, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r1, r0, asr #3
	mov r0, r1, asr #7
	add r1, r1, r0, lsr #24
	mov r0, r1, asr #8
	str r0, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r4, r2
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r2, r0, asr #3
	mov r0, r2, asr #7
	add r2, r2, r0, lsr #24
	mov r0, r2, asr #8
	str r0, [sp, #0x14]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	sub lr, r3, #1
	sub ip, r0, #1
	mov r0, lr, asr #2
	mov r3, ip, asr #2
	add r0, lr, r0, lsr #29
	add r3, ip, r3, lsr #29
	mov lr, r0, asr #3
	mov ip, r3, asr #3
	mov r0, lr, asr #7
	mov r3, ip, asr #7
	add r0, lr, r0, lsr #24
	mov r0, r0, asr #8
	add r3, ip, r3, lsr #24
	mov ip, r3, asr #8
	sub r3, r0, r1, asr #8
	sub r1, ip, r2, asr #8
	add r2, r3, #1
	add r1, r1, #1
	str r0, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6, #0x12c]
	str ip, [sp, #0xc]
	tst r1, #0x40
	add r0, sp, #0x10
	add r1, sp, #0
	beq _022FCF34
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022FCF64
_022FCF34:
	ldr r0, [r6, #0x12c]
	tst r0, #0x100
	beq _022FCF60
	mov r2, r5
	mov r3, r4
	mvn r0, #0
	mov r1, #0x100
	bl GetCollidingActorId
	cmp r0, #0
	movge r0, #0x100
	bge _022FCF64
_022FCF60:
	mov r0, #0
_022FCF64:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FCF6C: .word ov11_02321D88
	arm_func_end ov11_022FCE48

	arm_func_start SetPositionLiveObject
SetPositionLiveObject: ; 0x022FCF70
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r5, _022FD05C ; =ov11_02321D88
	mov r4, r0
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x30]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	ldr r3, [r1]
	ldr r2, [r4, #0x18]
	add lr, sp, #8
	sub ip, r3, r2
	str ip, [sp, #8]
	ldr r6, [r1, #4]
	ldr r3, [r4, #0x1c]
	add r2, sp, #0
	sub r3, r6, r3
	str r3, [sp, #0xc]
	ldr r6, [r5, #0x28]
	ldr r5, [r5, #0x2c]
	str r6, [sp]
	str r5, [sp, #4]
	ldr r6, [r1]
	ldr r5, [r4, #0x18]
	add r6, r6, r5
	str r6, [sp]
	ldr r5, [r1, #4]
	ldr r1, [r4, #0x1c]
	add r5, r5, r1
	str r5, [sp, #4]
	ldr r1, [r4, #0x2c]
	cmp ip, r1
	blt _022FD018
	ldr r1, [r4, #0x34]
	cmp r6, r1
	bge _022FD018
	ldr r1, [r4, #0x30]
	cmp r3, r1
	blt _022FD018
	ldr r1, [r4, #0x38]
	cmp r5, r1
	blt _022FD020
_022FD018:
	mov r0, #0x40
	b _022FD054
_022FD020:
	mov r1, lr
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD054
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x134]
	str r1, [r4, #0x138]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x13c]
	str r1, [r4, #0x140]
_022FD054:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD05C: .word ov11_02321D88
	arm_func_end SetPositionLiveObject

	arm_func_start GetIdLiveObject
GetIdLiveObject: ; 0x022FD060
	ldrsh r0, [r0, #4]
	bx lr
	arm_func_end GetIdLiveObject

	arm_func_start GetCollisionBoxLiveObject
GetCollisionBoxLiveObject: ; 0x022FD068
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxLiveObject

	arm_func_start SetPositionInitialLiveObject
SetPositionInitialLiveObject: ; 0x022FD07C
	cmp r1, #0
	beq _022FD0C8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x13c]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x138]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x140]
	bx lr
_022FD0C8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x134]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x13c]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x140]
	str r2, [r0, #0x148]
	str r2, [r0, #0x144]
	ldrsb r2, [r1, #0x30]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x14c]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x130]
	bx lr
	arm_func_end SetPositionInitialLiveObject

	arm_func_start SetMovementRangeLiveObject
SetMovementRangeLiveObject: ; 0x022FD138
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x34]
	str r1, [r0, #0x38]
	bx lr
	arm_func_end SetMovementRangeLiveObject

	arm_func_start GetCollisionBoxCenterLiveObject
GetCollisionBoxCenterLiveObject: ; 0x022FD15C
	ldr r3, [r0, #0x134]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x138]
	ldr r0, [r0, #0x1c]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxCenterLiveObject

	arm_func_start SetPositionLiveObjectVeneer
SetPositionLiveObjectVeneer: ; 0x022FD180
	ldr ip, _022FD188 ; =SetPositionLiveObject
	bx ip
	.align 2, 0
_022FD188: .word SetPositionLiveObject
	arm_func_end SetPositionLiveObjectVeneer

	arm_func_start GetHeightLiveObject
GetHeightLiveObject: ; 0x022FD18C
	ldr r3, [r0, #0x144]
	str r3, [r1]
	ldr r0, [r0, #0x148]
	str r0, [r2]
	bx lr
	arm_func_end GetHeightLiveObject
