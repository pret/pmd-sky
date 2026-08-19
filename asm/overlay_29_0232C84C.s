	.include "asm/macros.inc"
	.include "overlay_29_0232C84C.inc"

	.text

	arm_func_start DoMoveTransfer
DoMoveTransfer: ; 0x0232C84C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	mov r8, r1
	mov fp, #0
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	beq _0232C890
	mov r0, fp
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232C890:
	ldr r7, [r8, #0xb4]
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _0232C9E4
	ldrsh r4, [r7, #2]
	mov r0, fp
	mov r1, r8
	mov r2, r0
	mov r5, r4
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xbc]
	cmp r0, #6
	bls _0232C8DC
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232C8DC:
	mov r6, fp
	b _0232C970
_0232C8E4:
	mov r0, #0
	bl GetMonsterIdToSpawn
	mov r1, #0
	mov r4, r0
	bl MewSpawnCheck
	cmp r0, #0
	beq _0232C96C
	mov r0, r7
	bl IsMonsterLoneOutlaw
	cmp r0, #0
	bne _0232C96C
	ldrb r0, [r7, #6]
	cmp r0, #0
	cmpne r5, r4
	beq _0232C96C
	mov r0, r4
	bl GetBodySize
	mov sl, r0
	mov r0, r5
	bl GetBodySize
	cmp sl, r0
	bne _0232C96C
	ldrb r1, [r8, #0xaa]
	mov r0, r4
	bl ov29_022E1AAC
	str r0, [sp]
	mov r0, r8
	bl ov29_022E1AD4
	mov sl, r0
	bl ov29_022E1EF8
	add r1, sl, r0
	ldr r0, [sp]
	cmp r1, r0
	bge _0232C978
_0232C96C:
	add r6, r6, #1
_0232C970:
	cmp r6, #0x1e
	blt _0232C8E4
_0232C978:
	cmp r6, #0x1e
	ldrnesh r0, [r7, #2]
	cmpne r0, r4
	bne _0232C99C
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232CA04
_0232C99C:
	mov r0, #1
	bl GetSize0x80Buffer
	mov r5, r0
	mov r1, r4
	mov r2, #0x4e
	bl GetNameWithGender
	mov r1, r5
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
	ldr r2, _0232CA10 ; =0x00000F01
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r4
	bl ov29_022FD7A0
	mov fp, #1
	b _0232CA04
_0232C9E4:
	mov r0, fp
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232CA0C ; =0x00000F02
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CA04:
	mov r0, fp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_0232CA0C: .word 0x00000C44
_0232CA10: .word 0x00000C43
#else
_0232CA0C: .word 0x00000F02
_0232CA10: .word 0x00000F01
#endif
	arm_func_end DoMoveTransfer
