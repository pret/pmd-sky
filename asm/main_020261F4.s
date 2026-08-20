	.include "asm/macros.inc"
	.include "main_020261F4.inc"

	.text

	arm_func_start sub_020261F4
sub_020261F4: ; 0x020261F4
	ldr ip, _02026200 ; =sub_02020D7C
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026200: .word sub_02020D7C
	arm_func_end sub_020261F4

	arm_func_start sub_02026204
sub_02026204: ; 0x02026204
	ldr ip, _02026210 ; =AnalyzeText
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026210: .word AnalyzeText
	arm_func_end sub_02026204

	arm_func_start DrawTextInWindow
DrawTextInWindow: ; 0x02026214
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026264 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026264: .word 0x0000C402
	arm_func_end DrawTextInWindow

	arm_func_start AppendStandardStringToMission
AppendStandardStringToMission: ; 0x02026268
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	mov ip, #0
	ldr r3, _020262DC ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _020262DC ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020262DC: .word 0x0000C402
	arm_func_end AppendStandardStringToMission

	arm_func_start sub_020262E0
sub_020262E0: ; 0x020262E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	ldr ip, [sp, #0x530]
	ldr r3, _02026354 ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _02026354 ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02026354: .word 0x0000C402
	arm_func_end sub_020262E0

	arm_func_start sub_02026358
sub_02026358: ; 0x02026358
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x138]
	ldr ip, [sp, #0x13c]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020263C4 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020263C4: .word 0x0000C402
	arm_func_end sub_02026358

	arm_func_start sub_020263C8
sub_020263C8: ; 0x020263C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026424 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x130]
	add r0, sp, #0xc
	bl sub_02020B74
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026424: .word 0x0000C402
	arm_func_end sub_020263C8

	arm_func_start sub_02026428
sub_02026428: ; 0x02026428
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x13c]
	ldr ip, [sp, #0x140]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264A0 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x138]
	add r0, sp, #0x14
	bl sub_02020B94
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264A0: .word 0x0000C402
	arm_func_end sub_02026428

	arm_func_start sub_020264A4
sub_020264A4: ; 0x020264A4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264F4 ; =0x0000C403
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264F4: .word 0x0000C403
	arm_func_end sub_020264A4

	arm_func_start sub_020264F8
sub_020264F8: ; 0x020264F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r3
	mov r7, r0
	mov r0, r4
	mov r6, r1
	mov r5, r2
	bl sub_02025C7C
#ifdef JAPAN
	ldrsh r0, [r0, #6]
	cmp r0, #0xc
	rsblt r0, r0, #0xc
	addlt r0, r0, r0, lsr #31
	addlt r6, r6, r0, asr #1
#else
	ldrb r0, [r0, #2]
	cmp r0, #0xc
	rsblo r0, r0, #0xc
	addlo r0, r0, r0, lsr #31
	addlo r6, r6, r0, asr #1
#endif
	ldrb r0, [sp, #0x18]
	bl GetColorCodePaletteOffset
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl DrawChar
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020264F8

	arm_func_start GetCharWidth
GetCharWidth: ; 0x0202654C
	stmdb sp!, {r3, lr}
	ldr r1, _02026590 ; =_020AFD04
	mov r3, r0
#ifdef NORTH_AMERICA
	ldr r1, [r1, #8]
#else
	ldr r1, [r1, #4]
#endif
	cmp r1, #2
	blt _0202657C
	mov r1, #0
	mov r2, r1
	sub r0, r1, #2
	str r1, [sp]
	bl sub_02026C68
	ldmia sp!, {r3, pc}
_0202657C:
	bl sub_02025C7C
	cmp r0, #0
#ifdef JAPAN
	ldrnesh r0, [r0, #6]
#else
	ldrneb r0, [r0, #2]
#endif
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02026590: .word _020AFD04
	arm_func_end GetCharWidth

	arm_func_start sub_02026594
sub_02026594: ; 0x02026594
	ldr r1, _020265A4 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r1, #8]
#elif defined(JAPAN)
	ldr r1, [r1]
#else
	ldr r1, [r1, #0xc]
#endif
	ldrb r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020265A4: .word _020AFD04
	arm_func_end sub_02026594

	arm_func_start sub_020265A8
sub_020265A8: ; 0x020265A8
	ldr ip, _020265B8 ; =sub_02022118
	ldr r1, _020265BC ; =GetCharWidth
	ldr r2, _020265C0 ; =sub_02026594
	bx ip
	.align 2, 0
_020265B8: .word sub_02022118
_020265BC: .word GetCharWidth
_020265C0: .word sub_02026594
	arm_func_end sub_020265A8
