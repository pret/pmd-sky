	.include "asm/macros.inc"
	.include "overlay_29_0234B350.inc"

	.text

	arm_func_start LogMessageByIdWithPopupCheckUserTarget
LogMessageByIdWithPopupCheckUserTarget: ; 0x0234B350
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserTarget

	arm_func_start LogMessageWithPopupCheckUserTarget
LogMessageWithPopupCheckUserTarget: ; 0x0234B3A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageWithPopupCheckUserTarget

	arm_func_start LogMessageByIdQuietCheckUserTarget
LogMessageByIdQuietCheckUserTarget: ; 0x0234B3F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdQuietCheckUserTarget

	arm_func_start LogMessageByIdWithPopupCheckUserUnknown
LogMessageByIdWithPopupCheckUserUnknown: ; 0x0234B444
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ov29_022E2CA0
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserUnknown

	arm_func_start LogMessageByIdWithPopup
LogMessageByIdWithPopup: ; 0x0234B498
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdWithPopup
