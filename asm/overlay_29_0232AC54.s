	.include "asm/macros.inc"
	.include "overlay_29_0232AC54.inc"

	.text

	arm_func_start DoMoveBellyDrum
DoMoveBellyDrum: ; 0x0232AC54
#ifdef JAPAN
#define DO_MOVE_BELLY_DRUM_OFFSET -4
#else
#define DO_MOVE_BELLY_DRUM_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r5, [r7, #0xb4]
	sub r3, sp, #4
	add r0, r5, #0x100
	ldrh r2, [r0, #0x46 + DO_MOVE_BELLY_DRUM_OFFSET]
	mov r6, r1
	mov r4, #0
	strh r2, [r3]
	ldrh r0, [r0, #0x48 + DO_MOVE_BELLY_DRUM_OFFSET]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl CeilFixedPoint
	cmp r0, #1
	ble _0232ACD8
	ldr r1, _0232AD00 ; =ATK_STAT_IDX
	mov r0, r7
	ldr r2, [r1]
	mov r1, r6
	mov r3, #0x63
	bl BoostOffensiveStat
	mov r0, #1
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r2, [sp]
	add r0, r5, #0x100
	ldrh r1, [sp, #2]
	strh r2, [r0, #0x46 + DO_MOVE_BELLY_DRUM_OFFSET]
	mov r4, #1
	strh r1, [r0, #0x48 + DO_MOVE_BELLY_DRUM_OFFSET]
	b _0232ACF8
_0232ACD8:
	mov r0, r4
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232AD04 ; =0x00000EEB
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0232ACF8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232AD00: .word ATK_STAT_IDX
#ifdef JAPAN
_0232AD04: .word 0x00000C2D
#else
_0232AD04: .word 0x00000EEB
#endif
	arm_func_end DoMoveBellyDrum
