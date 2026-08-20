	.include "asm/macros.inc"
	.include "main_0202FD50.inc"

	.text

	arm_func_start CloseAreaNameBox
CloseAreaNameBox: ; 0x0202FD50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAreaNameBox

	arm_func_start IsAreaNameBoxActive
IsAreaNameBoxActive: ; 0x0202FD6C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAreaNameBoxActive

	arm_func_start UpdateAreaNameBox
UpdateAreaNameBox: ; 0x0202FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FDA8: ; jump table
	b _0202FDB8 ; case 0
	b _0202FDD0 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FE0C ; case 3
_0202FDB8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FDD0:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1b0]
	ldr r2, [r6, #0x1ac]
	add r3, r6, #0xac
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FE0C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateAreaNameBox

	arm_func_start CreateControlsChart
CreateControlsChart: ; 0x0202FE2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r5, r1
	mov r0, #0xa8
	mov r1, #8
	mov r4, r2
	mov r6, r3
	bl MemAlloc
	mov ip, r0
	cmp r7, #0
	ldreq r0, _0202FECC ; =CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
	strh r6, [ip, #0xa4]
	add lr, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia lr, {r0, r1, r2, r3}
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FED0 ; =UpdateControlsChart
	str ip, [sp, #0xc]
	strne r0, [sp]
	ldr r0, _0202FED0 ; =UpdateControlsChart
	cmp r4, #0
	stmia ip, {r0, r5}
	beq _0202FEB0
	add lr, ip, #8
	mov r5, #9
_0202FE98:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202FE98
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_0202FEB0:
	mov r2, #0
	add r0, sp, #0
	mov r1, #3
	str r2, [ip, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202FECC: .word CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
_0202FED0: .word UpdateControlsChart
	arm_func_end CreateControlsChart

	arm_func_start CloseControlsChart
CloseControlsChart: ; 0x0202FED4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseControlsChart

	arm_func_start IsControlsChartActive
IsControlsChartActive: ; 0x0202FEF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsControlsChartActive

	arm_func_start UpdateControlsChart
UpdateControlsChart: ; 0x0202FF10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FF2C: ; jump table
	b _0202FF3C ; case 0
	b _0202FF54 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FF90 ; case 3
_0202FF3C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FF54:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldrh r3, [r6, #0xa4]
	mov r1, #4
	mov r2, #2
	bl AppendStandardStringToMission
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FF90:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateControlsChart

	arm_func_start CreateAlertBox
CreateAlertBox: ; 0x0202FFB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x650
	mov r1, #8
	bl MemAlloc
	mov r1, #0x650
	mov r4, r0
	bl MemZero
	cmp r5, #0
	ldreq r0, _0203003C ; =ALERT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030040 ; =UpdateAlertBox
	str r4, [sp, #0xc]
	strne r0, [sp]
	add r0, sp, #0
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	ldrsb r1, [r4]
	add r0, r4, #8
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	add r0, r4, #0x600
	strh r1, [r0, #0x44]
	strh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsb r0, [r4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203003C: .word ALERT_BOX_DEFAULT_WINDOW_PARAMS
_02030040: .word UpdateAlertBox
	arm_func_end CreateAlertBox

	arm_func_start CloseAlertBox
CloseAlertBox: ; 0x02030044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4]
	bl sub_0202836C
	add r0, r4, #8
	bl sub_0202613C
	mov r0, r5
	bl GetWindowContents
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAlertBox

	arm_func_start sub_0203007C
sub_0203007C: ; 0x0203007C
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x44]
	add r1, r1, #1
	strh r1, [r0, #0x44]
	ldrsh r1, [r0, #0x44]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x44]
	bx lr
	arm_func_end sub_0203007C

	arm_func_start sub_020300A0
sub_020300A0: ; 0x020300A0
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x44]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	movge r0, #0
	bx lr
	arm_func_end sub_020300A0

	arm_func_start sub_020300C0
sub_020300C0: ; 0x020300C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add ip, sp, #0
	str r1, [sp]
	mov r1, ip
	add r0, r5, #0xc
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02020B60
	ldr r1, _02030108 ; =0x0000C402
	mov r2, r4
	add r0, r5, #0xc
	bl sub_02020BC4
	add r0, r5, #0xc
	bl AnalyzeText
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02030108: .word 0x0000C402
	arm_func_end sub_020300C0

	arm_func_start AddMessageToAlertBox
AddMessageToAlertBox: ; 0x0203010C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	beq _02030144
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
_02030144:
	mov r0, r4
	bl sub_020300A0
	add r1, r4, #0x600
	ldrsh r2, [r1, #0x46]
	cmp r2, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r5, [sp]
	ldrsh r1, [r1, #0x44]
	add r0, r4, #0x29
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r0, r1, r0, r2
	mov r2, r6
	mov r3, r7
	mov r1, #0x140
	bl PreprocessString
	add r1, r4, #0x600
	add r0, r4, #0x29
	ldrsh r1, [r1, #0x44]
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r2, r1, r0, r2
	mov r1, r7
	add r0, r4, #8
	bl sub_02026194
	add r1, r4, #0x600
	ldrsh r0, [r1, #0x44]
	mov r2, #0x148
	mov r6, #0
	smlabb r0, r0, r2, r4
	add r0, r0, #0x200
	strh r7, [r0, #0x6a]
	ldrsh r5, [r1, #0x44]
	ldrb r3, [sp, #0x18]
	mov r0, r4
	smlabb r5, r5, r2, r4
	str r6, [r5, #0x124]
	ldrsh r1, [r1, #0x44]
	smlabb r1, r1, r2, r4
	strb r3, [r1, #0x128]
	bl sub_0203007C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end AddMessageToAlertBox

	arm_func_start IsAlertBoxActive
IsAlertBoxActive: ; 0x020301F4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAlertBoxActive

	arm_func_start sub_02030214
sub_02030214: ; 0x02030214
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030260
_02030230: ; jump table
	b _02030260 ; case 0
	b _02030248 ; case 1
	b _02030254 ; case 2
	b _02030254 ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
_02030248:
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030254:
	mov r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030260:
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030214

	arm_func_start UpdateAlertBox
UpdateAlertBox: ; 0x02030274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030290: ; jump table
	b _020302A8 ; case 0
	b _020302C8 ; case 1
	b _020302E0 ; case 2
	b _02030438 ; case 3
	b _0203056C ; case 4
	b _02030588 ; case 5
_020302A8:
	add r0, r4, #8
	bl sub_020261D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_020302C8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020302E0:
	ldrsb r0, [r5, #0x10]
	bl GetWindowContents
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x46]
	ldrsh r0, [r0, #0x44]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsb r4, [r5, #0x10]
	mov r0, r4
	bl GetWindowContents
	mov r6, r0
	add r3, r6, #0x600
	ldr r1, [r6, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r5, [r6, #0x10]
	mov r8, r1, asr #0x10
	mla r1, r2, r8, r5
	ldr r2, [r6, #0xc]
	mov r7, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	ldrsh r3, [r3, #0x46]
	mov r1, #0x148
	add r5, r6, #0x124
	smulbb r3, r3, r1
	ldr r1, [r5, r3]
	add r5, r5, r3
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov r7, r7, asr #0x10
	bne _02030388
	mov r5, #0x17
	mov r0, r4
	add r2, r7, r8
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
	b _020303C4
_02030388:
	mov r2, r7
	add r3, r5, #5
	bl sub_020300C0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _020303C4
	cmp r7, r8
	blt _020303C4
	mov r5, #0x17
	mov r0, r4
	sub r2, r7, #2
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
_020303C4:
	mov r0, r4
	bl UpdateWindow
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsh r1, [r0, #0x46]
	add r1, r1, #1
	strh r1, [r0, #0x46]
	ldrsh r1, [r0, #0x46]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x46]
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x4a]
	cmp r1, #3
	movge r1, #3
	strge r1, [r6, #4]
	movge r1, #0
	strgeh r1, [r0, #0x4c]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r6, #0xa0]
	ldr r0, [r6, #0x10]
	add r2, r1, r8
	mov r1, r8
	sub r0, r2, r0
	bl _s32_div_f
	add r1, r6, #0x600
	strh r0, [r1, #0x4a]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030438:
	ldrsb r5, [r5, #0x10]
	mov r0, r5
	bl GetWindowContents
	mov r7, r0
	add r3, r7, #0x600
	ldr r1, [r7, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r6, [r7, #0x10]
	mov r8, r1, asr #0x10
	ldr r1, [r7, #0xc]
	mla r6, r2, r8, r6
	ldrsh sb, [r3, #0x4c]
	mov r2, r1, lsl #0x10
	ldrsh ip, [r3, #0x48]
	mov r1, #0x148
	add r3, sb, r6
	mov r3, r3, lsl #0x10
	smulbb r6, ip, r1
	add sb, r7, #0x124
	ldr r1, [sb, r6]
	add r6, sb, r6
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov sb, r3, asr #0x10
	bne _020304C0
	mov r6, #0x17
	mov r0, r5
	add r2, sb, r8
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
	b _020304FC
_020304C0:
	mov r2, sb
	add r3, r6, #5
	bl sub_020300C0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _020304FC
	cmp sb, r8
	blt _020304FC
	mov r6, #0x17
	mov r0, r5
	sub r2, sb, #2
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
_020304FC:
	add r0, r7, #0x600
	ldrsh r0, [r0, #0x4c]
	add r0, r0, r8
	cmp r0, #1
	mov r0, r5
	bne _02030528
	bl sub_01FF9128
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #1
	b _02030538
_02030528:
	bl sub_01FF929C
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #2
_02030538:
	strh r1, [r0, #0x4c]
	add r0, r7, #0x600
	ldrsh r2, [r0, #0x4c]
	rsb r1, r8, #0
	cmp r2, r1
	movle r1, #3
	strleh r1, [r0, #0x4a]
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0203056C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030588:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	add r0, r4, #8
	str r1, [r4, #4]
	bl sub_0202613C
	mvn r0, #5
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end UpdateAlertBox

	arm_func_start CreateAdvancedTextBox
CreateAdvancedTextBox: ; 0x020305B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	add r1, r0, #0x100
	str r4, [r0, #0x1a4]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBox

	arm_func_start CreateAdvancedTextBoxWithArg
CreateAdvancedTextBoxWithArg: ; 0x020305E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	ldr r2, [sp, #0x10]
	str r4, [r0, #0x1a8]
	add r1, r0, #0x100
	str r2, [r0, #0x1ac]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBoxWithArg

	arm_func_start CreateAdvancedTextBoxInternal
CreateAdvancedTextBoxInternal: ; 0x0203061C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r8, r0
	mov r7, r1
	mov r0, #0x1c8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x1a4]
	str r0, [r4, #0x1a8]
	str r0, [r4, #0x1ac]
	str r0, [r4, #0x1b8]
	mov r0, #1
	cmp r8, #0
	strb r0, [r4, #0x1c4]
	addne ip, sp, #0x18
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030774 ; =UpdateAdvancedTextBox
	strne r0, [sp, #0x18]
	bne _02030690
	ldr r0, _02030778 ; =ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x18
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r7, r7, #0x300000
_02030690:
	tst r7, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	str r4, [sp, #0x24]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r7, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02030774 ; =UpdateAdvancedTextBox
	cmp r6, #0
	str r0, [r4]
	str r7, [r4, #0x104]
	beq _020306F0
	add ip, r4, #0x108
	mov r8, #9
_020306D8:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _020306D8
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_020306F0:
	mov r2, #0
	str r2, [r4, #0x1bc]
	strb r2, [r4, #0x1c0]
	strb r2, [r4, #0x1c1]
	strb r2, [r4, #0x1c2]
	str r2, [r4, #0x1b0]
	str r2, [r4, #0x1b4]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r4, #0x1c3]
	bl NewWindowScreenCheck
	add r1, sp, #8
	strb r0, [r4, #0x1a0]
	bl GetWindowRectangle
	mov r1, #0x100
	strh r1, [r4, #0xfc]
	tst r7, #0x8000
	moveq r5, #0
	streq r5, [sp, #0x40]
	strh r1, [r4, #0xfe]
	add r0, r4, #0x100
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #0x40]
	add r3, sp, #8
	mov r1, r7
	add r0, r4, #4
	add r2, r4, #0x108
	stmia sp, {r5, r6}
	bl InitWindowInput
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02030774: .word UpdateAdvancedTextBox
_02030778: .word ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAdvancedTextBoxInternal

	arm_func_start SetAdvancedTextBoxPartialMenu
SetAdvancedTextBoxPartialMenu: ; 0x0203077C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c3]
	ldr r1, [r0, #0x104]
	tst r4, #0xff
	orrne r1, r1, #0x400000
	biceq r1, r1, #0x400000
	str r1, [r0, #0x104]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxPartialMenu
