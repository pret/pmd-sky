	.include "asm/macros.inc"
	.include "overlay_29_0232E744.inc"

	.text

	arm_func_start ov29_0232E744
ov29_0232E744: ; 0x0232E744
	ldr ip, _0232E74C ; =DoMoveEscape
	bx ip
	.align 2, 0
_0232E74C: .word DoMoveEscape
	arm_func_end ov29_0232E744

	arm_func_start DoMoveTag0x1A6
DoMoveTag0x1A6: ; 0x0232E750
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	mov r0, #1
	bl ov29_0234AFFC
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl DoMoveCleanse
	mov r4, r0
	mov r0, #0
	bl ov29_0234AFFC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMoveTag0x1A6

	arm_func_start DoMoveTag0x1A7
DoMoveTag0x1A7: ; 0x0232E794
#ifdef JAPAN
#define DO_MOVE_TAG_0X147_OFFSET -4
#else
#define DO_MOVE_TAG_0X147_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	bl ov29_0234AFFC
	mov r0, r5
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
	ldr r2, _0232E808 ; =0x000003E7
	mov r0, r5
	mov r1, r4
	bl TryRestoreHp
	mov r0, r5
	mov r1, r4
	ldr r2, _0232E808 ; =0x000003E7
	mov r3, #1
	bl RestoreAllMovePP
	ldr r1, [r4, #0xb4]
	mov r0, #0
	add r1, r1, #0x100
	ldrh r2, [r1, #0x4a + DO_MOVE_TAG_0X147_OFFSET]
	strh r2, [r1, #0x46 + DO_MOVE_TAG_0X147_OFFSET]
	ldrh r2, [r1, #0x4c + DO_MOVE_TAG_0X147_OFFSET]
	strh r2, [r1, #0x48 + DO_MOVE_TAG_0X147_OFFSET]
	bl ov29_0234AFFC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232E808: .word 0x000003E7
	arm_func_end DoMoveTag0x1A7

	arm_func_start ov29_0232E80C
ov29_0232E80C: ; 0x0232E80C
	stmdb sp!, {r3, lr}
	ldr r0, _0232E83C ; =ov29_02353718
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, _0232E83C ; =ov29_02353718
	ldrne r0, [r0]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232E83C: .word ov29_02353718
	arm_func_end ov29_0232E80C
