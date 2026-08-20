	.include "asm/macros.inc"
	.include "overlay_29_0234B130.inc"

	.text

	arm_func_start ov29_0234B130
ov29_0234B130: ; 0x0234B130
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr r1, _0234B1A0 ; =MESSAGE_LOG_INFO
	mov r0, r3
_0234B140:
	ldr r2, [r1, #4]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0xc80]
	cmp r3, #0xa
	blt _0234B140
	ldr r1, _0234B1A0 ; =MESSAGE_LOG_INFO
	mvn ip, #1
	ldr r3, [r1, #4]
	mov r2, #1
	strb ip, [r3, #0xcec]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xcee]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xced]
	str r0, [r1, #8]
	strb r2, [r1]
	bl ov29_0234B1A4
	ldr r0, _0234B1A0 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B1A0: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B130

	arm_func_start ov29_0234B1A4
ov29_0234B1A4: ; 0x0234B1A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022E9FC0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov ip, #0
	ldr r2, _0234B24C ; =MESSAGE_LOG_INFO
	mov r0, ip
_0234B1C4:
	ldr r3, [r2, #4]
	add r1, ip, ip, lsl #2
	add ip, ip, #1
	strb r0, [r3, r1, lsl #6]
	cmp ip, #0xa
	blt _0234B1C4
	ldr r2, _0234B24C ; =MESSAGE_LOG_INFO
	mov r3, #4
	ldr r1, [r2, #4]
	strb r0, [r1, #0xc8b]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8c]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8e]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x90]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r3, [r1, #0x92]
	ldr r1, [r2, #4]
	str r0, [r1, #0xc98]
	bl FullyCloseAlertBox
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, r0
	bl UnkMapRelatedFunc
	mov r0, #0xb
	bl AdvanceFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234B24C: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B1A4

	arm_func_start LogMessageByIdWithPopupCheckParticipants
LogMessageByIdWithPopupCheckParticipants: ; 0x0234B250
	stmdb sp!, {r3, lr}
	ldr ip, _0234B290 ; =MESSAGE_LOG_INFO
	cmp r1, #0
	ldr ip, [ip, #4]
	ldrsh lr, [sp, #8]
	add r3, ip, r3, lsl #2
	cmpne r0, #0
	str lr, [r3, #0xcac]
	beq _0234B27C
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, pc}
_0234B27C:
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B290: .word MESSAGE_LOG_INFO
	arm_func_end LogMessageByIdWithPopupCheckParticipants

	arm_func_start WaitUntilAlertBoxTextIsLoadedWrapper
WaitUntilAlertBoxTextIsLoadedWrapper: ; 0x0234B294
	ldr ip, _0234B2A0 ; =WaitUntilAlertBoxTextIsLoaded
	mov r0, #0x50
	bx ip
	.align 2, 0
_0234B2A0: .word WaitUntilAlertBoxTextIsLoaded
	arm_func_end WaitUntilAlertBoxTextIsLoadedWrapper

	arm_func_start LogMessageByIdWithPopupCheckUser
LogMessageByIdWithPopupCheckUser: ; 0x0234B2A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r6
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageByIdWithPopupCheckUser

	arm_func_start LogMessageWithPopupCheckUser
LogMessageWithPopupCheckUser: ; 0x0234B2E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageWithPopupCheckUser

	arm_func_start LogMessageByIdQuiet
LogMessageByIdQuiet: ; 0x0234B31C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdQuiet
