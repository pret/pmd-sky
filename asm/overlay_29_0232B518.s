	.include "asm/macros.inc"
	.include "overlay_29_0232B518.inc"

	.text

	arm_func_start DoMoveCamouflage
DoMoveCamouflage: ; 0x0232B518
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	bl AllocateTemp1024ByteBufferFromPool
	ldr r0, _0232B5B8 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r0, [r0]
	ldr r3, _0232B5BC ; =ov10_022C6322
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh ip, [r0, #0x30]
#else
	ldrsh ip, [r0, #0xd4]
#endif
	mov r0, r4
	mov r1, #0x25
	smulbb r2, ip, r2
	ldr r7, [r4, #0xb4]
	ldrb r6, [r3, r2]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0232B578
	ldr r2, _0232B5C0 ; =0x00000DC3
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232B578:
	strb r6, [r7, #0x5e]
	mov r2, #0
	mov r1, r4
	strb r2, [r7, #0x5f]
	mov r0, #1
	strb r0, [r7, #0xff]
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #0
	bl SetPreprocessorArgsIdVal
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc30
#else
	ldr r2, _0232B5C4 ; =0x00000EEE
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B5B8: .word DUNGEON_PTR
_0232B5BC: .word ov10_022C6322
#ifdef JAPAN
_0232B5C0: .word 0x00000B03
#else
_0232B5C0: .word 0x00000DC3
_0232B5C4: .word 0x00000EEE
#endif
	arm_func_end DoMoveCamouflage
