	.include "asm/macros.inc"
	.include "overlay_29_02313B08.inc"

	.text

; https://decomp.me/scratch/90P8f
	arm_func_start BoostDefensiveStat
BoostDefensiveStat: ; 0x02313B08
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov r6, r3
	mov sb, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r6, r1, asr #0x10
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313C50
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r7, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x28
	ldr r1, [r1]
	mov r0, r8
	bl ov29_022E4F1C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313B90
	ldr r1, _02313C5C ; =0x00000DC9
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
	b _02313BA8
_02313B90:
	ldr r1, _02313C60 ; =0x00000DC8
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
_02313BA8:
	mov r0, r8
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r6, lsl #0x11
	movne r6, r0, asr #0x10
	cmp r6, #1
	bne _02313BE4
	ldr r1, _02313C64 ; =0x00000DCD
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl SetMessageLogPreprocessorArgsString
	b _02313BFC
_02313BE4:
	ldr r1, _02313C68 ; =0x00000DCC
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, #2
	bl SetMessageLogPreprocessorArgsString
_02313BFC:
	ldr r1, [sp, #0x28]
	add r0, r7, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	add r4, r0, r6
	cmp r4, #0x14
	movge r4, #0x14
	cmp r4, r0
	beq _02313C38
	ldr r2, _02313C6C ; =0x00000D8E
	add r3, r7, r1, lsl #1
	mov r0, sb
	mov r1, r8
	strh r4, [r3, #0x28]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313C48
_02313C38:
	ldr r2, _02313C70 ; =0x00000DD6
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02313C48:
	mov r0, r8
	bl UpdateStatusIconFlags
_02313C50:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define BOOST_DEFENSIVE_STAT_OFFSET -0x2C0
#else
#define BOOST_DEFENSIVE_STAT_OFFSET 0
#endif
_02313C5C: .word 0x00000DC9 + BOOST_DEFENSIVE_STAT_OFFSET
_02313C60: .word 0x00000DC8 + BOOST_DEFENSIVE_STAT_OFFSET
_02313C64: .word 0x00000DCD + BOOST_DEFENSIVE_STAT_OFFSET
_02313C68: .word 0x00000DCC + BOOST_DEFENSIVE_STAT_OFFSET
_02313C6C: .word 0x00000D8E + BOOST_DEFENSIVE_STAT_OFFSET
_02313C70: .word 0x00000DD6 + BOOST_DEFENSIVE_STAT_OFFSET
	arm_func_end BoostDefensiveStat
