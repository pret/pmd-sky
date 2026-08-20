	.include "asm/macros.inc"
	.include "overlay_29_0232CA70.inc"

	.text

	arm_func_start DoMoveEscape
DoMoveEscape: ; 0x0232CA70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	mov r4, r1
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, _0232CAFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _0232CAB4
	ldr r2, _0232CB00 ; =0x00000F04
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232CAF4
_0232CAB4:
	mov r0, r5
	bl IsSecretBazaarNpc
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _0232CAE8
	ldr r2, _0232CB04 ; =0x00000F03
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0xa
	bl WaitUntilAlertBoxPauseIsOver
_0232CAE8:
	mov r0, #1
	mov r1, r0
	bl SetDungeonEscapeFields
_0232CAF4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232CAFC: .word DUNGEON_PTR
#ifdef JAPAN
_0232CB00: .word 0x00000C46
_0232CB04: .word 0x00000C45
#else
_0232CB00: .word 0x00000F04
_0232CB04: .word 0x00000F03
#endif
	arm_func_end DoMoveEscape
