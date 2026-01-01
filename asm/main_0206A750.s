	.include "asm/macros.inc"
	.include "main_0206A750.inc"

	.text

	arm_func_start sub_0206A7CC
sub_0206A7CC: ; 0x0206A7CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x3e8
	bne _0206A7F4
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	b _0206A82C
_0206A7F4:
	ldr r0, _0206A848 ; =0x000003E9
	cmp r4, r0
	bne _0206A82C
	bl sub_0204E6FC
	cmp r0, #2
	bne _0206A814
	bl sub_0204E780
	b _0206A818
_0206A814:
	bl sub_0204E770
_0206A818:
	cmp r0, #0xff
	addne r0, r0, #1
	mvneq r4, #0
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
_0206A82C:
	cmp r4, #0xd1
	bne _0206A840
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	moveq r4, #0xd2
_0206A840:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206A848: .word 0x000003E9
	arm_func_end sub_0206A7CC

	arm_func_start sub_0206A84C
sub_0206A84C: ; 0x0206A84C
	cmp r0, #0xb4
	addlo r0, r0, #1
	movlo r0, r0, lsl #0x10
	movlo r0, r0, asr #0x10
	bxlo lr
	blo _0206A870
	cmp r0, #0xd3
	movls r0, #0xb8
	bxls lr
_0206A870:
	mvn r0, #0
	bx lr
	arm_func_end sub_0206A84C

	arm_func_start sub_0206A878
sub_0206A878: ; 0x0206A878
	stmdb sp!, {r3, lr}
	bl sub_0206A7CC
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0206A89C ; =MAP_MARKER_PLACEMENTS
	movne r0, r0, lsl #3
	ldrnesh r1, [r1, r0]
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206A89C: .word MAP_MARKER_PLACEMENTS
	arm_func_end sub_0206A878

	arm_func_start sub_0206A8A0
sub_0206A8A0: ; 0x0206A8A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	bl sub_0206A7CC
	mov r5, r0
	mov r0, r4
	bl sub_0206A7CC
	mvn r1, #0
	cmp r5, r1
	mov r4, r0
	ldrne r0, _0206A908 ; =_020A94D2
	movne r2, r5, lsl #3
	ldrnesh r0, [r0, r2]
	cmpne r0, r1
	movne r5, r0
	mvn r0, #0
	cmp r4, r0
	ldrne r1, _0206A908 ; =_020A94D2
	movne r2, r4, lsl #3
	ldrnesh r1, [r1, r2]
	cmpne r1, r0
	movne r4, r1
	cmp r5, r4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206A908: .word _020A94D2
	arm_func_end sub_0206A8A0

	arm_func_start sub_0206A90C
sub_0206A90C: ; 0x0206A90C
#ifdef EUROPE
#define SUB_0206A90C_WORD_OFFSET 2
#else
#define SUB_0206A90C_WORD_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	bl sub_0206A7CC
	mvn r1, #0
	cmp r0, r1
#ifdef JAPAN
	moveq r0, #0x47
	ldmeqia sp!, {r3, pc}
	cmp r0, #0
	moveq r0, #0x40
#else
	ldreq r0, _0206A964 ; =0x0000403A
	ldmeqia sp!, {r3, pc}
	cmp r0, #0
	ldreq r0, _0206A968 ; =0x00004033
#endif
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	blt _0206A950
	cmp r0, #0xb4
	bgt _0206A950
	sub r0, r0, #1
	and r0, r0, #0xff
	bl sub_02024934
	ldmia sp!, {r3, pc}
_0206A950:
#ifdef JAPAN
	sub r0, r0, #0x74
#else
	add r0, r0, #0x7f + SUB_0206A90C_WORD_OFFSET
	add r0, r0, #0x3f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifndef JAPAN
_0206A964: .word 0x0000403A + SUB_0206A90C_WORD_OFFSET
_0206A968: .word 0x00004033 + SUB_0206A90C_WORD_OFFSET
#endif
	arm_func_end sub_0206A90C

	arm_func_start sub_0206A96C
sub_0206A96C: ; 0x0206A96C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl sub_0206A7CC
	mvn r2, #0
	cmp r0, r2
	moveq r0, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0206A9D8 ; =MAP_MARKER_PLACEMENTS
	cmp r5, r2
	add r3, r1, r0, lsl #3
	ldrnesh r1, [r3]
	cmpne r1, r5
	movne r0, r2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r2, [r3, #2]
	cmp r2, r0
	mvnne r1, #0
	cmpne r2, r1
	ldrne r1, _0206A9D8 ; =MAP_MARKER_PLACEMENTS
	movne r0, r2
	addne r3, r1, r2, lsl #3
	ldrsh r1, [r3, #4]
	str r1, [r4]
	ldrsh r1, [r3, #6]
	str r1, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206A9D8: .word MAP_MARKER_PLACEMENTS
	arm_func_end sub_0206A96C

	arm_func_start sub_0206A9DC
sub_0206A9DC: ; 0x0206A9DC
	stmdb sp!, {r4, lr}
	bl GetExecuteSpecialEpisodeType
	mov r4, r0
	cmp r4, #4
	bne _0206AA24
	mov r0, #0x3e8
	bl sub_0206A7CC
	ldr r1, _0206AA34 ; =MAP_MARKER_PLACEMENTS
	mov r0, r0, lsl #3
	ldrsh r0, [r1, r0]
	ldr r1, _0206AA38 ; =0xFFFFFED2
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	ldmlsia sp!, {r4, pc}
_0206AA24:
	ldr r0, _0206AA3C ; =_020A94C6
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206AA34: .word MAP_MARKER_PLACEMENTS
#if defined(EUROPE)
_0206AA38: .word 0xFFFFFEC6
#elif defined(JAPAN)
_0206AA38: .word 0xFFFFFECD
#else
_0206AA38: .word 0xFFFFFED2
#endif
_0206AA3C: .word _020A94C6
	arm_func_end sub_0206A9DC

	arm_func_start sub_0206AA40
sub_0206AA40: ; 0x0206AA40
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	ldr r1, _0206AA58 ; =_020A94BC
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206AA58: .word _020A94BC
	arm_func_end sub_0206AA40

	arm_func_start sub_0206AA5C
sub_0206AA5C: ; 0x0206AA5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov r0, #0x40
	mov r1, #1
	bl MemAlloc
	ldr r2, _0206AB90 ; =_020B0B4C
	mov r1, #0x40
	str r0, [r2, #8]
	bl MemZero
	ldr r0, _0206AB90 ; =_020B0B4C
	mov r1, #0x20
	ldr r4, [r0, #8]
	add r0, r4, #4
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x20]
	ldr r0, _0206AB90 ; =_020B0B4C
	strh r1, [r4, #0x1c]
	ldr r1, [r0, #8]
	str r5, [r1]
	ldr r2, [r0, #8]
	ldr r0, [r2]
	cmp r0, #1
	bne _0206AB3C
	ldr r0, _0206AB94 ; =0x00001F64
	mov r1, #6
	add r4, r2, #4
	bl MemAlloc
	ldr r1, _0206AB94 ; =0x00001F64
	mov r5, r0
	bl MemZero
	mov r8, #0x58
	mov sl, #0
	mvn r7, #0
	mov r6, r8
_0206AAE8:
	mul sb, sl, r6
	mov r1, r8
	add r0, r5, sb
	bl MemZero
	add sl, sl, #1
	strh r7, [r5, sb]
	cmp sl, #0x50
	blt _0206AAE8
	add r0, r5, #0x1000
	ldr r2, _0206AB90 ; =_020B0B4C
	str r4, [r0, #0xf5c]
	ldr r0, [r2, #8]
	mov r1, #5
	str r5, [r0, #0x28]
	ldr r0, [r2, #8]
	add r0, r0, #4
	bl sub_0206BBE0
	ldr r1, _0206AB90 ; =_020B0B4C
	ldr r1, [r1, #8]
	str r0, [r1, #0x24]
	b _0206AB5C
_0206AB3C:
	cmp r0, #2
	bne _0206AB5C
	add r0, r2, #4
	mov r1, #4
	bl sub_0206BBE0
	ldr r1, _0206AB90 ; =_020B0B4C
	ldr r1, [r1, #8]
	str r0, [r1, #0x24]
_0206AB5C:
	ldr r1, _0206AB90 ; =_020B0B4C
	mov r3, #0
	ldr r2, [r1, #8]
	mov r0, #0x80
	str r3, [r2, #0x2c]
	ldr r2, [r1, #8]
	strb r3, [r2, #0x30]
	ldr r2, [r1, #8]
	str r3, [r2, #0x34]
	ldr r1, [r1, #8]
	strb r3, [r1, #0x31]
	bl ov10_022C2340
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0206AB90: .word _020B0B4C
_0206AB94: .word 0x00001F64
	arm_func_end sub_0206AA5C

	arm_func_start sub_0206AB98
sub_0206AB98: ; 0x0206AB98
	ldr r0, _0206ABAC ; =_020B0B4C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x30]
	bx lr
	.align 2, 0
_0206ABAC: .word _020B0B4C
	arm_func_end sub_0206AB98

	arm_func_start sub_0206ABB0
sub_0206ABB0: ; 0x0206ABB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r0, _0206AD28 ; =_020B0B4C
	ldr r4, [r0, #8]
	cmp r4, #0
	ldrneb r0, [r4, #0x30]
	cmpne r0, #0
	beq _0206AD1C
	ldr r0, [r4]
	ldr r1, _0206AD2C ; =_020B0B5C
	cmp r0, #1
	movne r5, #1
	moveq r5, #0
	ldr r1, [r1, r5, lsl #3]
	add r0, sp, #8
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD30 ; =_020B0B60
	mov r1, #0
	ldr r0, [r0, r5, lsl #3]
	bl sub_0201DF38
	str r0, [r4, #0x14]
	mov r2, #0
	ldr r1, [r4, #0x20]
	add r0, sp, #8
	mov r3, r2
	bl sub_0201E12C
	add r0, sp, #8
	bl DelayWteFree
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	str r1, [r4, #0x18]
	ldr r2, [r4, #0x20]
	ldr r1, _0206AD34 ; =_020A9F34
	add r2, r2, #0x8000
	str r2, [r4, #0x20]
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD38 ; =_020A9F48
	mov r1, #0
	bl sub_0201DF38
	str r0, [r4, #4]
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0x10
	bl DelayWteFree
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	str r1, [r4, #8]
	ldr r2, [r4, #0x20]
	ldr r1, _0206AD3C ; =_020A9F5C
	add r2, r2, #0x2000
	str r2, [r4, #0x20]
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD40 ; =_020A9F70
	mov r1, #0
	bl sub_0201DF38
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	mov r2, #2
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0x10
	bl DelayWteFree
	ldr r0, [r4, #0x20]
	mov r2, #0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x20]
	ldr r0, _0206AD44 ; =WAN_TABLE
	add r1, r1, #0x4000
	str r1, [r4, #0x20]
	ldr r0, [r0]
	ldr r1, _0206AD48 ; =_020A9F84
	bl LoadWanTableEntry
	strh r0, [r4, #0x1c]
	mov r3, #1
	str r3, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldrsh r0, [r4, #0x1c]
	mov r1, #0x2c0
	bl sub_0201D9C8
	ldr r0, _0206AD28 ; =_020B0B4C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x30]
_0206AD1C:
	mov r0, #1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206AD28: .word _020B0B4C
_0206AD2C: .word _020B0B5C
_0206AD30: .word _020B0B60
_0206AD34: .word _020A9F34
_0206AD38: .word _020A9F48
_0206AD3C: .word _020A9F5C
_0206AD40: .word _020A9F70
_0206AD44: .word WAN_TABLE
_0206AD48: .word _020A9F84
	arm_func_end sub_0206ABB0

	arm_func_start sub_0206AD4C
sub_0206AD4C: ; 0x0206AD4C
	ldr r0, _0206AD7C ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0206AD74
	ldrb r0, [r0, #0x31]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
_0206AD74:
	mov r0, #0
	bx lr
	.align 2, 0
_0206AD7C: .word _020B0B4C
	arm_func_end sub_0206AD4C

	arm_func_start sub_0206AD80
sub_0206AD80: ; 0x0206AD80
	ldr r0, _0206AD9C ; =_020B0B4C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r0, [r1, #0x34]
	addne r0, r0, #1
	strne r0, [r1, #0x34]
	bx lr
	.align 2, 0
_0206AD9C: .word _020B0B4C
	arm_func_end sub_0206AD80

	arm_func_start sub_0206ADA0
sub_0206ADA0: ; 0x0206ADA0
	ldr r1, _0206ADB4 ; =_020B0B4C
	ldr r1, [r1, #8]
	cmp r1, #0
	strne r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0206ADB4: .word _020B0B4C
	arm_func_end sub_0206ADA0

	arm_func_start sub_0206ADB8
sub_0206ADB8: ; 0x0206ADB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	moveq r0, #0
	beq _0206B9B4
	bl ov10_022C23EC
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r8, [r0, #8]
	ldrb r0, [r8, #0x30]
	cmp r0, #0
	bne _0206B9B0
	ldr r0, [r8, #0x2c]
	cmp r0, #0
	beq _0206AE00
	cmp r0, #1
	b _0206B99C
_0206AE00:
	ldr r0, [r8, #0x38]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x38]
	bgt _0206B99C
	ldr r0, [r8]
	cmp r0, #1
	bne _0206B678
	ldr r7, [r8, #0x24]
	ldr sb, [r8, #0x28]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _0206AE48
	cmp r0, #1
	beq _0206AF78
	cmp r0, #2
	beq _0206B1D4
	b _0206B670
_0206AE48:
	ldr r1, [r7, #0x2d4]
	mov r0, #0xc0
	ldr fp, [r7, #0x2d8]
	mov r6, #0
	bl _s32_div_f
	mov sb, r0, lsl #8
	mov r0, #0x14000
	rsb r0, r0, #0
	str r0, [sp, #0x2c]
	b _0206AF50
_0206AE70:
	mul r0, r6, sb
	ands r5, r6, #1
	movne r4, #0x14000
	ldr r1, _0206B9BC ; =_020B0B4C
	ldreq r4, [sp, #0x2c]
	str r0, [sp, #0x18]
	ldr r1, [r1, #4]
	rsb r0, r4, #0
	bl _s32_div_f
	str r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	mov r0, #0x58
	mul sl, r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r7]
	ldr r3, [sp, #0x18]
	mov r1, fp
	add r0, r0, sl
	mov r2, r4
	bl sub_0206BC3C
	cmp r5, #0
	movne r0, #0
	moveq r0, #0x10000
	add r2, r4, r0
	ldr r5, [r7, #4]
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r5, sl
	mov r1, fp
	bl sub_0206BD04
	ldrsh r0, [r5, sl]
	bl sub_0201F324
	ldrsh r1, [r0, #0x1a]
	add r6, r6, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r0, #8]
	mov r1, #0
	strh r1, [r0, #0xa]
_0206AF50:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206AE70
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	add r0, r0, #1
	str r0, [r7, #0xc]
	b _0206B670
_0206AF78:
	mov r4, #0
	mov fp, #0x58
	b _0206B04C
_0206AF84:
	mul r5, r4, fp
	ldr r6, [r7]
	add sl, r6, r5
	ldr r1, [sl, #8]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sl, #8]
	ldr r1, [sl, #0xc]
	ldr r0, [sl, #0x1c]
	add r0, r1, r0
	str r0, [sl, #0xc]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
	ldr r6, [r7, #4]
	add sl, r6, r5
	ldr r1, [sl, #8]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sl, #8]
	ldr r1, [sl, #0xc]
	ldr r0, [sl, #0x1c]
	add r0, r1, r0
	str r0, [sl, #0xc]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	add r4, r4, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B04C:
	ldr r0, [r7, #0x2d4]
	cmp r4, r0
	blt _0206AF84
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0206B0E0
	mov r6, #0
	mov fp, r6
	b _0206B0D0
_0206B070:
	mov r0, #0x58
	mul r4, r6, r0
	ldr r5, [r7]
	ldrsh r0, [r5, r4]
	add sl, r5, r4
	bl sub_0201F324
	str fp, [sl, #8]
	str fp, [sl, #0x18]
	str fp, [sl, #0x1c]
	ldrsh r0, [r5, r4]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r5, r4]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	add r6, r6, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B0D0:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206B070
	b _0206B0E8
_0206B0E0:
	sub r0, r0, #1
	str r0, [r7, #8]
_0206B0E8:
	ldr r0, [r7, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x11000
	ble _0206B670
	add r0, sb, #0x1000
	ldr r5, [r0, #0xf5c]
	mov r1, #0x8000
	str r1, [r0, #0xb8c]
	mov r1, #0x6000
	str r1, [r0, #0xb90]
	bl sub_0201F36C
	add r1, sb, #0x1b00
	strh r0, [r1, #0x84]
	ldrsh r0, [r1, #0x84]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	mov r1, #0x80
	strh r1, [r4, #0x2a]
	add r3, sb, #0x1000
	ldr sl, [r3, #0xb8c]
	mov r6, #2
	mov r1, sl, asr #7
	add r1, sl, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4]
	ldr r3, [r3, #0xb90]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4, #2]
	str r6, [sp]
	str r2, [sp, #4]
	ldr r1, [r5, #8]
	ldr r3, [r5, #0xc]
	bl sub_0201E7D8
	ldrsh r0, [r4, #0x1a]
	mov r5, #0
	mov r1, #0x28
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r4, #8]
	ldrsh r2, [r4, #0x1c]
	add r3, sb, #0x1000
	mov r0, #0x1000
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r4, #0xa]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	str r1, [r3, #0xbd4]
	bl _s32_div_f
	add r1, sb, #0x1b00
	strh r0, [r1, #0xcc]
	ldr r0, [r7, #0xc]
	add r0, r0, #1
	str r0, [r7, #0xc]
	b _0206B670
_0206B1D4:
	add r0, sb, #0x1b00
	ldrsh r3, [r0, #0x84]
	add r0, sb, #0x1000
	add r1, sb, #0x384
	mvn r2, #0
	cmp r3, r2
	add r6, r1, #0x1800
	ldr r7, [r0, #0xf5c]
	beq _0206B2D4
	ldrsh r0, [r6]
	bl sub_0201F324
	ldr r1, [r6, #4]
	mov r5, r0
	cmp r1, #2
	ldrh r4, [r5, #0x10]
	bge _0206B298
	ldr r0, [r6, #0x4c]
	add r1, r0, #1
	str r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _0206B298
	ldr r0, [r6, #4]
	add r0, r0, #1
	str r0, [r6, #4]
	cmp r0, #2
	bne _0206B278
	ldr r1, [r6, #0x50]
	mov r0, #0xc00
	bl _s32_div_f
	strh r0, [r6, #0x48]
	add r0, sb, #0x1000
	mov r1, #1
	str r1, [r0, #0xbf0]
	mov r1, #8
	str r1, [r0, #0xbe8]
	ldr r1, [r0, #0xbec]
	str r1, [r0, #0xbe0]
	ldr r1, [r0, #0xbf0]
	str r1, [r0, #0xbe4]
	b _0206B290
_0206B278:
	cmp r0, #1
	bne _0206B290
	ldr r1, [r6, #0x50]
	mov r0, #0xc00
	bl _s32_div_f
	strh r0, [r6, #0x48]
_0206B290:
	mov r0, #0
	str r0, [r6, #0x4c]
_0206B298:
	ldrsh r0, [r6, #0x48]
	ldr r1, [r6, #4]
	cmp r1, #1
	subeq r4, r4, r0
	beq _0206B2C8
	cmp r1, #2
	add r4, r4, r0
	bne _0206B2C8
	add r0, r0, #0x20
	cmp r4, #0x4000
	strh r0, [r6, #0x48]
	movge r4, #0x4000
_0206B2C8:
	strh r4, [r5, #0x10]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
_0206B2D4:
	add r0, sb, #0x1000
	ldr r1, [r0, #0xbf4]
	cmp r1, #0
	beq _0206B2F0
	cmp r1, #1
	beq _0206B3C4
	b _0206B670
_0206B2F0:
	mov r5, #0
	mov r2, #1
	str r5, [r0, #0xbdc]
	mov r1, #0x10
	str r2, [r0, #0xbe0]
	str r1, [r0, #0xbec]
	str r1, [r0, #0xbe8]
	mov r1, #8
	str r1, [r0, #0xbf0]
	rsb r1, r2, #0x3e8
	str r1, [r0, #0xbe4]
	ldr r4, [r0, #0xf5c]
	add r0, sb, #0x3f8
	add fp, r0, #0x1800
_0206B328:
	mov r0, #0x7c
	mla r6, r5, r0, fp
	mov r0, r6
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r4, #0x18]
	mov r0, r6
	bl SetSpriteIdForAnimationControl
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xc
	mul r1, r5, r0
	ldr r0, _0206B9C0 ; =_020A9EE0
	mov r2, #0
	add sl, r0, r1
	ldr r1, [r0, r1]
	mov r0, r6
	mov r3, #0x2c0
	bl SetAnimationForAnimationControl
	ldr r1, [sl, #4]
	mov r0, r6
	strh r1, [r6, #0x1c]
	ldr r2, [sl, #8]
	mov r1, #0
	strh r2, [r6, #0x1e]
	bl sub_0201D12C
	add r5, r5, #1
	cmp r5, #7
	blt _0206B328
	add r0, sb, #0x1000
	mov r1, #1
	strb r1, [r0, #0xf60]
	ldr r1, [r0, #0xbf4]
	add r1, r1, #1
	str r1, [r0, #0xbf4]
_0206B3C4:
	add r0, sb, #0x1000
	ldr r2, [r0, #0xbe0]
	add r1, r2, #1
	str r1, [r0, #0xbe0]
	ldr r0, [r0, #0xbec]
	cmp r2, r0
	ble _0206B54C
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r4, r0, #3
	ldr r0, _0206B9C4 ; =0x000001FF
	mov r5, #0
	add r0, r0, #0xe00
	str r0, [sp, #0x34]
	b _0206B51C
_0206B408:
	bl Rand16Bit
	bl Rand16Bit
	ldr r1, _0206B9BC ; =_020B0B4C
	ldr r2, [r1, #0xc]
	ldr r1, _0206B9C4 ; =0x000001FF
	and r0, r0, r1
	add r0, r2, r0
	str r0, [sp, #0x14]
	bl Rand16Bit
	ldr r1, _0206B9BC ; =_020B0B4C
	and r0, r0, #0xf
	ldr r1, [r1]
	add fp, r1, r0
	bl Rand16Bit
	ldr r1, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	bl _s32_div_f
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	bl Rand16Bit
	mov r1, #0xd0
	bl _s32_div_f
	add sl, r1, #0x10
	bl Rand16Bit
	str sl, [sp]
	str r6, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #0x34]
	mov r2, #0x8000
	and sl, r0, r1
	mov r0, sb
	mov r1, r7
	mov r3, #0x6000
	bl sub_0206BDF4
	movs r6, r0
	beq _0206B510
	ldrsh r0, [r6]
	bl sub_0201F324
	ldrsh r2, [r0, #0x1a]
	mov r1, r6
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r0, #8]
	ldrsh r2, [r0, #0x1c]
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r0, #0xa]
	mov r2, #0x800
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldr r0, _0206B9C8 ; =sub_0206BFA8
	bl ov10_022C2450
	mov r0, #0x8000
	str r0, [r6, #0x30]
	mov r0, #0x6000
	str r0, [r6, #0x34]
	mov r0, #0
	str r0, [r6, #0x24]
	str sl, [r6, #0x20]
	ldr r0, [sp, #0x14]
	str fp, [r6, #0x38]
	str r0, [r6, #0x3c]
_0206B510:
	cmp r6, #0
	beq _0206B524
	add r5, r5, #1
_0206B51C:
	cmp r5, r4
	blt _0206B408
_0206B524:
	bl Rand16Bit
	add r2, sb, #0x1000
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	ldr r3, [r2, #0xbe8]
	add r0, r1, r0, ror #29
	add r0, r3, r0
	str r0, [r2, #0xbec]
	mov r0, #0
	str r0, [r2, #0xbe0]
_0206B54C:
	add r0, sb, #0x1000
	ldr r1, [r0, #0xbe4]
	add r1, r1, #1
	str r1, [r0, #0xbe4]
	ldr r0, [r0, #0xbf0]
	cmp r1, r0
	ble _0206B670
	bl Rand16Bit
	ldr r1, _0206B9CC ; =0x00000FFF
	mov r4, #0
	and r0, r0, r1
	mov r5, r0, lsl #0x10
	sub fp, r1, #0xe00
_0206B580:
	bl Rand16Bit
	ldr r1, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	bl _s32_div_f
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	bl Rand16Bit
	mov r1, #0xd0
	bl _s32_div_f
	add sl, r1, #0x10
	bl Rand16Bit
	str sl, [sp]
	and sl, r0, fp
	str r6, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, sb
	mov r1, r7
	mov r2, #0x8000
	mov r3, #0x6000
	bl sub_0206BDF4
	movs r6, r0
	beq _0206B658
	ldrsh r0, [r6]
	bl sub_0201F324
	mov r1, #0
	strh r1, [r0, #0x12]
	mov r2, r1
	ldr r1, _0206B9D0 ; =0x00005555
	strh r2, [r0, #0x10]
	mul r1, r4, r1
	add r0, r1, r5, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x20]
	mov r0, r4, lsl #1
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x20]
	bl CosAbs4096
	add r1, sl, #0x300
	bl MultiplyByFixedPoint
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x20]
	bl SinAbs4096
	add r1, sl, #0x300
	rsb r0, r0, #0
	bl MultiplyByFixedPoint
	str r0, [r6, #0x1c]
	ldr r0, _0206B9D4 ; =sub_0206BEAC
	mov r1, r6
	bl ov10_022C2450
_0206B658:
	add r4, r4, #1
	cmp r4, #3
	blt _0206B580
	add r0, sb, #0x1000
	mov r1, #0
	str r1, [r0, #0xbe4]
_0206B670:
	mov r4, #0
	b _0206B990
_0206B678:
	cmp r0, #2
	bne _0206B990
	ldr r5, [r8, #0x24]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0206B6A4
	cmp r0, #1
	beq _0206B838
	cmp r0, #2
	beq _0206B984
	b _0206B98C
_0206B6A4:
	ldr r0, _0206B9D8 ; =_020A9E80
	add r4, sp, #0x3c
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [r5, #0x2d8]
	mov r6, #0
	str r0, [sp, #0x20]
	mov r0, #0x14000
	rsb r0, r0, #0
	str r0, [sp, #0x30]
	mov r0, r0, asr #0x11
	str r0, [sp, #0x38]
	b _0206B810
_0206B6D8:
	add r0, sp, #0x3c
	ldr r0, [r0, r6, lsl #2]
	tst r6, #1
	mov r0, r0, lsl #8
	add r0, r0, #0x800
	movne sb, #0x2000
	moveq sb, #0
	str r0, [sp, #0x24]
	cmp r6, #2
	movlt r0, #1
	movge r0, #0
	ands r4, r0, #0xff
	ldreq r0, [sp, #0x38]
	ldr r1, _0206B9BC ; =_020B0B4C
	muleq r0, sb, r0
	moveq sb, r0
	cmp r4, #0
	ldrne sl, [sp, #0x30]
	ldr r1, [r1, #4]
	moveq sl, #0x14000
	rsb r0, sl, #0
	bl _s32_div_f
	str r0, [sp, #0x28]
	mov r0, #0x58
	mul r7, r6, r0
	mov r0, r6, lsl #0x10
	mov r1, r0, asr #0x10
	ldr fp, [r5]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x24]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	add r0, fp, r7
	add r2, sl, sb
	bl sub_0206BC3C
	ldrsh r0, [fp, r7]
	bl sub_0201F324
	ldrsh r1, [r0, #0x1c]
	cmp r1, #0x28
	moveq r3, #3
	beq _0206B7A4
	cmp r1, #0x20
	moveq r3, #2
	movne r3, #1
_0206B7A4:
	cmp r4, #0
	movne r0, #0x10000
	moveq r0, #0
	add r0, sl, r0
	add r2, r0, sb
	ldr r4, [r5, #4]
	ldr r0, [sp, #0x28]
	add r1, r1, r1, lsr #31
	str r0, [sp]
	mov r0, r3, lsl #0x10
	mov sb, r0, asr #0x10
	ldr r0, [sp, #0x24]
	mov r1, r1, asr #1
	add r3, r0, r1, lsl #8
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	str sb, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	add r0, r4, r7
	bl sub_0206BD04
	ldrsh r0, [r4, r7]
	bl sub_0201F324
	add r6, r6, #1
_0206B810:
	ldr r0, [r5, #0x2d4]
	cmp r6, r0
	blt _0206B6D8
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #4]
	str r0, [r5, #8]
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0206B98C
_0206B838:
	mov sb, #0
	mov r6, #1
	mov fp, sb
	b _0206B95C
_0206B848:
	mov r0, #0x58
	mul sl, sb, r0
	ldr r0, [r5]
	add r4, r0, sl
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0206B8F8
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	ble _0206B8A0
	ldr r0, [r4, #8]
	cmp r0, #0
	stmgeib r4, {r6, fp}
	bge _0206B8C0
_0206B8A0:
	cmp r1, #0
	bge _0206B8C0
	ldr r0, [r4, #8]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4, #8]
	movle r0, #1
	strle r0, [r4, #4]
_0206B8C0:
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r2, [r4, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r2, [r4, #0xc]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B8F8:
	ldr r4, [r5, #4]
	add r7, r4, sl
	ldr r1, [r7, #8]
	ldr r0, [r7, #0x18]
	add r0, r1, r0
	str r0, [r7, #8]
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x1c]
	add r0, r1, r0
	str r0, [r7, #0xc]
	ldrsh r0, [r4, sl]
	bl sub_0201F324
	ldr r2, [r7, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r4, sl]
	bl sub_0201F324
	ldr r2, [r7, #0xc]
	add sb, sb, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B95C:
	ldr r0, [r5, #0x2d4]
	cmp sb, r0
	blt _0206B848
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x11000
	ldrgt r0, [r5, #0xc]
	addgt r0, r0, #1
	strgt r0, [r5, #0xc]
	b _0206B98C
_0206B984:
	mov r4, #1
	b _0206B990
_0206B98C:
	mov r4, #0
_0206B990:
	cmp r4, #0
	movne r0, #1
	strneb r0, [r8, #0x31]
_0206B99C:
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x3c]
	add r0, r0, #1
	str r0, [r1, #0x3c]
_0206B9B0:
	mov r0, #1
_0206B9B4:
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206B9BC: .word _020B0B4C
_0206B9C0: .word _020A9EE0
_0206B9C4: .word 0x000001FF
_0206B9C8: .word sub_0206BFA8
_0206B9CC: .word 0x00000FFF
_0206B9D0: .word 0x00005555
_0206B9D4: .word sub_0206BEAC
_0206B9D8: .word _020A9E80
	arm_func_end sub_0206ADB8

	arm_func_start sub_0206B9DC
sub_0206B9DC: ; 0x0206B9DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0206BA58 ; =_020B0B4C
	ldr r1, [r0, #8]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r1, #0x30]
	cmp r0, #0
	bne _0206BA50
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _0206BA14
	cmp r0, #1
	b _0206BA50
_0206BA14:
	ldr r1, [r1, #0x28]
	cmp r1, #0
	addne r0, r1, #0x1000
	ldrneb r0, [r0, #0xf60]
	cmpne r0, #0
	beq _0206BA50
	add r0, r1, #0x3f8
	mov r6, #0
	add r5, r0, #0x1800
	mov r4, #0x7c
_0206BA3C:
	mla r0, r6, r4, r5
	bl sub_0201CF5C
	add r6, r6, #1
	cmp r6, #7
	blt _0206BA3C
_0206BA50:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206BA58: .word _020B0B4C
	arm_func_end sub_0206B9DC

	arm_func_start sub_0206BA5C
sub_0206BA5C: ; 0x0206BA5C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov10_022C23B0
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r5, [r0, #8]
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r7, [r5, #0x24]
	cmp r7, #0
	beq _0206BAE8
	mov r6, #0
	mov r4, #0x58
	b _0206BABC
_0206BA9C:
	mul r8, r6, r4
	ldr r0, [r7]
	add r0, r0, r8
	bl sub_0206BB94
	ldr r0, [r7, #4]
	add r0, r0, r8
	bl sub_0206BB94
	add r6, r6, #1
_0206BABC:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206BA9C
	ldr r0, [r7]
	bl MemFree
	ldr r0, [r7, #4]
	bl MemFree
	ldr r0, [r5, #0x24]
	bl MemFree
	mov r0, #0
	str r0, [r5, #0x24]
_0206BAE8:
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r5, [r0, #8]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _0206BB3C
	mov r6, #0
	mov r4, #0x58
_0206BB04:
	ldr r0, [r5, #0x28]
	mla r0, r6, r4, r0
	bl sub_0206BB94
	add r6, r6, #1
	cmp r6, #0x50
	blt _0206BB04
	ldr r0, [r5, #0x28]
	add r0, r0, #0x384
	add r0, r0, #0x1800
	bl sub_0206BB94
	ldr r0, [r5, #0x28]
	bl MemFree
	mov r0, #0
	str r0, [r5, #0x28]
_0206BB3C:
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r4, [r0, #8]
	add r0, r4, #0x14
	bl sub_0201E020
	add r0, r4, #4
	bl sub_0201E020
	add r0, r4, #0xc
	bl sub_0201E020
	ldr r0, _0206BB90 ; =WAN_TABLE
	ldrsh r1, [r4, #0x1c]
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _0206BB8C ; =_020B0B4C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0201F248
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206BB8C: .word _020B0B4C
_0206BB90: .word WAN_TABLE
	arm_func_end sub_0206BA5C

	arm_func_start sub_0206BB94
sub_0206BB94: ; 0x0206BB94
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4]
	mvn r0, #0
	cmp r1, r0
	ldmeqia sp!, {r4, pc}
	cmp r1, #0
	bne _0206BBBC
	ldr r0, _0206BBDC ; =_020A9F98
	bl Debug_Print0
_0206BBBC:
	ldrsh r0, [r4]
	bl sub_0201F2AC
	mov r0, r4
	mov r1, #0x58
	bl MemZero
	mvn r0, #0
	strh r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206BBDC: .word _020A9F98
	arm_func_end sub_0206BB94

	arm_func_start sub_0206BBE0
sub_0206BBE0: ; 0x0206BBE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x2dc
	mov r1, #6
	bl MemAlloc
	mov r1, #0x2dc
	mov r4, r0
	bl MemZero
	mov r0, #0x58
	mul r5, r6, r0
	mov r0, r5
	str r7, [r4, #0x2d8]
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov r0, r5
	mov r1, #6
	bl MemAlloc
	str r0, [r4, #4]
	mov r0, r4
	str r6, [r4, #0x2d4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BBE0

	arm_func_start sub_0206BC3C
sub_0206BC3C: ; 0x0206BC3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r1, #0x58
	mov r5, r0
	mov r7, r2
	mov r6, r3
	bl MemZero
	mvn r0, #0
	strh r0, [r5]
	bl sub_0201F36C
	strh r0, [r5]
	ldrsh r1, [r5]
	mvn r0, #0
	cmp r1, r0
	beq _0206BCF8
	str r7, [r5, #8]
	ldr r1, [sp, #0x20]
	str r6, [r5, #0xc]
	ldr r0, [sp, #0x24]
	str r1, [r5, #0x18]
	str r0, [r5, #0x1c]
	ldrsh r0, [r5]
	bl sub_0201F324
	mov r1, #0
	ldr r2, [sp, #0x28]
	strb r1, [r0, #0x3c]
	strh r2, [r0, #0x2a]
	ldr ip, [r5, #8]
	ldrsh r3, [sp, #0x30]
	mov r2, ip, asr #7
	add r2, ip, r2, lsr #24
	mov r2, r2, asr #8
	strh r2, [r0]
	ldr r5, [r5, #0xc]
	mov r3, r3, lsl #0x14
	mov r2, r5, asr #7
	add r2, r5, r2, lsr #24
	mov r2, r2, asr #8
	strh r2, [r0, #2]
	str r1, [sp]
	mov r1, r3, asr #0x10
	str r1, [sp, #4]
	ldrsh r2, [sp, #0x2c]
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0x14]
	bl sub_0201E7D8
_0206BCF8:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BC3C

	arm_func_start sub_0206BD04
sub_0206BD04: ; 0x0206BD04
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r1, #0x58
	mov r6, r0
	mov r7, r2
	mov r4, r3
	bl MemZero
	mvn r0, #0
	strh r0, [r6]
	bl sub_0201F36C
	strh r0, [r6]
	ldrsh r1, [r6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	beq _0206BDEC
	str r7, [r6, #8]
	ldr r1, [sp, #0x20]
	str r4, [r6, #0xc]
	ldr r0, [sp, #0x24]
	str r1, [r6, #0x18]
	str r0, [r6, #0x1c]
	ldrsh r0, [r6]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	ldr r1, [sp, #0x28]
	ldrsh r2, [sp, #0x30]
	strh r1, [r4, #0x2a]
	ldr r3, [r6, #8]
	mov r2, r2, lsl #0x14
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4]
	ldr r3, [r6, #0xc]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4, #2]
	mov r1, #1
	str r1, [sp]
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	ldrsh r2, [sp, #0x2c]
	ldmia r5, {r1, r3}
	bl sub_0201E7D8
	ldrsh r1, [r4, #0x1a]
	mov r0, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r4, #8]
	ldrsh r1, [r4, #0x1c]
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r4, #0xa]
_0206BDEC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BD04

	arm_func_start sub_0206BDF4
sub_0206BDF4: ; 0x0206BDF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov ip, #0
	mov r4, r0
	mov r8, ip
	mov r0, ip
	mov r5, #0x58
	mvn r6, #0
	b _0206BE48
_0206BE18:
	cmp ip, #0x50
	movge ip, r0
	mul r7, ip, r5
	ldrsh r7, [r4, r7]
	cmp r7, r6
	beq _0206BE54
	add r7, r8, #1
	add lr, ip, #1
	mov ip, r7, lsl #0x10
	mov lr, lr, lsl #0x10
	mov r8, ip, asr #0x10
	mov ip, lr, asr #0x10
_0206BE48:
	cmp r8, #0x50
	blt _0206BE18
	mvn ip, #0
_0206BE54:
	cmp ip, #0
	movlt r0, #0
	blt _0206BEA4
	mov r0, #0x58
	mla r6, ip, r0, r4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r5, [sp, #0x30]
	ldrsh r0, [sp, #0x34]
	str r5, [sp, #8]
	ldrsh r5, [sp, #0x38]
	str r0, [sp, #0xc]
	mov r0, r6
	str r5, [sp, #0x10]
	bl sub_0206BD04
	cmp r0, #0
	moveq r0, #0
	movne r0, r6
	strne r4, [r6, #0x54]
_0206BEA4:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0206BDF4

	arm_func_start sub_0206BEAC
sub_0206BEAC: ; 0x0206BEAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r1, [r4, #0x40]
	mov r5, r0
	cmp r1, #0
	ble _0206BEEC
	ldrsh r0, [r4]
	mov r1, #0
	bl sub_0201F348
	ldr r0, [r4, #0x40]
	sub r0, r0, #1
	str r0, [r4, #0x40]
	ldmia sp!, {r4, r5, r6, pc}
_0206BEEC:
	ldrh r0, [r5, #0x10]
	cmp r0, #0x1000
	beq _0206BF10
	add r0, r0, #0x100
	cmp r0, #0x1000
	movge r0, #0x1000
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x10]
_0206BF10:
	ldrsh r0, [r4]
	mov r1, #1
	bl sub_0201F348
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x18]
	mvn r0, #0x3f
	add r1, r2, r1
	str r1, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	add r1, r2, r1
	str r1, [r4, #0xc]
	ldrsh r1, [r5]
	cmp r1, r0
	blt _0206BF68
	cmp r1, #0x140
	bgt _0206BF68
	ldrsh r1, [r5, #2]
	cmp r1, r0
	blt _0206BF68
	cmp r1, #0x100
	ble _0206BF7C
_0206BF68:
	mov r0, r4
	bl sub_0206BB94
	mov r0, r6
	bl ov10_022C24DC
	ldmia sp!, {r4, r5, r6, pc}
_0206BF7C:
	ldr r1, [r4, #8]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5]
	ldr r1, [r4, #0xc]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5, #2]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0206BEAC

	arm_func_start sub_0206BFA8
sub_0206BFA8: ; 0x0206BFA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	ldrsh r0, [r4]
	bl sub_0201F324
	mov r5, r0
	ldr r0, [r4, #0x20]
	bl CosAbs4096
	ldr r1, [r4, #0x24]
	bl MultiplyByFixedPoint
	ldr r1, [r4, #0x30]
	add r7, r1, r0
	ldr r0, [r4, #0x20]
	bl SinAbs4096
	ldr r1, [r4, #0x24]
	rsb r0, r0, #0
	bl MultiplyByFixedPoint
	ldr r2, [r4, #0x34]
	ldr r1, _0206C0D4 ; =0x00000FFF
	add r0, r2, r0
	str r7, [r4, #8]
	str r0, [r4, #0xc]
	ldr r2, [r4, #0x20]
	ldr r0, [r4, #0x38]
	add r2, r2, r0
	and r0, r2, r1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x24]
	ldrh r0, [r5, #0x10]
	cmp r0, #0x1000
	addlo r0, r0, #0x80
	strloh r0, [r5, #0x10]
	ldrloh r0, [r5, #0x12]
	addlo r0, r0, #0x80
	strloh r0, [r5, #0x12]
	ldr r1, [r4, #0x3c]
	mvn r0, #0x3f
	add r1, r1, #8
	str r1, [r4, #0x3c]
	ldrsh r1, [r5]
	cmp r1, r0
	blt _0206C078
	cmp r1, #0x140
	bgt _0206C078
	ldrsh r1, [r5, #2]
	cmp r1, r0
	blt _0206C078
	cmp r1, #0x140
	ble _0206C08C
_0206C078:
	mov r0, r4
	bl sub_0206BB94
	mov r0, r6
	bl ov10_022C24DC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206C08C:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ldr r0, [r4, #0x20]
	movlt r0, r0, lsl #4
	movge r0, r0, lsl #4
	rsbge r0, r0, #0x10000
	strh r0, [r5, #0x28]
	ldr r1, [r4, #8]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5]
	ldr r1, [r4, #0xc]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206C0D4: .word 0x00000FFF
	arm_func_end sub_0206BFA8

	arm_func_start sub_0206C0D8
sub_0206C0D8: ; 0x0206C0D8
	ldr r1, _0206C0E8 ; =_020B0B6C
	ldrsh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C0E8: .word _020B0B6C
	arm_func_end sub_0206C0D8

	arm_func_start sub_0206C0EC
sub_0206C0EC: ; 0x0206C0EC
	ldr r1, _0206C0F8 ; =_020B0B6C
	strh r0, [r1]
	bx lr
	.align 2, 0
_0206C0F8: .word _020B0B6C
	arm_func_end sub_0206C0EC

	arm_func_start sub_0206C0FC
sub_0206C0FC: ; 0x0206C0FC
	ldr r1, _0206C10C ; =_020B0B70
	ldrsh r1, [r1, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C10C: .word _020B0B70
	arm_func_end sub_0206C0FC

	arm_func_start sub_0206C110
sub_0206C110: ; 0x0206C110
	ldr r1, _0206C11C ; =_020B0B70
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0206C11C: .word _020B0B70
	arm_func_end sub_0206C110

	arm_func_start sub_0206C120
sub_0206C120: ; 0x0206C120
	ldr r1, _0206C130 ; =_020B0B70
	ldrsh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C130: .word _020B0B70
	arm_func_end sub_0206C120

	arm_func_start sub_0206C134
sub_0206C134: ; 0x0206C134
	ldr r1, _0206C140 ; =_020B0B70
	strh r0, [r1]
	bx lr
	.align 2, 0
_0206C140: .word _020B0B70
	arm_func_end sub_0206C134

	arm_func_start sub_0206C144
sub_0206C144: ; 0x0206C144
	ldr r3, _0206C160 ; =_020B0B74
	mov r2, #8
_0206C14C:
	ldrb r1, [r3], #1
	subs r2, r2, #1
	strb r1, [r0], #1
	bne _0206C14C
	bx lr
	.align 2, 0
_0206C160: .word _020B0B74
	arm_func_end sub_0206C144

	arm_func_start sub_0206C164
sub_0206C164: ; 0x0206C164
	ldr r3, _0206C180 ; =_020B0B74
	mov r2, #8
_0206C16C:
	ldrb r1, [r0], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _0206C16C
	bx lr
	.align 2, 0
_0206C180: .word _020B0B74
	arm_func_end sub_0206C164

	arm_func_start sub_0206C184
sub_0206C184: ; 0x0206C184
	ldr ip, _0206C198 ; =sub_0207A7EC
	mov r0, #0
	mov r2, r1
	sub r1, r0, #1
	bx ip
	.align 2, 0
_0206C198: .word sub_0207A7EC
	arm_func_end sub_0206C184

	arm_func_start sub_0206C19C
sub_0206C19C: ; 0x0206C19C
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r0, #0
	mov r2, r4
	sub r1, r0, #1
	bl sub_0207A8F4
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206C19C

	arm_func_start sub_0206C1BC
sub_0206C1BC: ; 0x0206C1BC
	bx lr
	arm_func_end sub_0206C1BC

	arm_func_start DseDriver_LoadDefaultSettings
DseDriver_LoadDefaultSettings: ; 0x0206C1C0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C248 ; =DRIVER_WORK
	mov r2, #1
	movs r4, r0
	strb r2, [r1, #0x3d]
	subeq r0, r2, #0x100
	ldmeqia sp!, {r4, pc}
	mov r1, #0x40
	bl DseMem_Clear
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r1, #8
	strb r1, [r4, #0x10]
	strb r0, [r4, #0x11]
	strh r0, [r4, #0x14]
	mov r1, #0xf
	strh r1, [r4, #0x16]
	mov r1, #0x14
	strb r1, [r4, #0x12]
	mov r1, #4
	strh r1, [r4, #0x18]
	ldr r2, _0206C24C ; =_0206C184
	strh r1, [r4, #0x1a]
	ldr r1, _0206C250 ; =_0206C19C
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	ldr r1, _0206C254 ; =sub_0206C1BC
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	str r1, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C248: .word DRIVER_WORK
_0206C24C: .word sub_0206C184
_0206C250: .word sub_0206C19C
_0206C254: .word sub_0206C1BC
	arm_func_end DseDriver_LoadDefaultSettings

	arm_func_start DseDriver_IsSettingsValid
DseDriver_IsSettingsValid: ; 0x0206C258
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	bne _0206C27C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C27C:
	tst r4, #3
	beq _0206C29C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C29C:
	ldr r0, [r4, #8]
	mov r5, #0
	cmp r0, #0
	beq _0206C2B4
	tst r0, #0xf
	beq _0206C2B8
_0206C2B4:
	orr r5, r5, #4
_0206C2B8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0206C2CC
	tst r0, #0xf
	beq _0206C2D0
_0206C2CC:
	orr r5, r5, #8
_0206C2D0:
	ldrb r0, [r4, #0x11]
	ldrb r1, [r4, #0x10]
	cmp r0, #0
	cmpne r0, #1
	orrne r5, r5, #0x100
	cmp r1, #4
	ldrb r0, [r4, #0x12]
	orrlo r5, r5, #0x200
	cmp r0, r1
	ldrsh r1, [r4, #0x14]
	orrls r5, r5, #0x400
	ldrsh r0, [r4, #0x16]
	cmp r1, #0
	orrne r5, r5, #0x4000
	cmp r0, #0x10
	orrge r5, r5, #0x8000
	cmp r1, r0
	orrgt r5, r5, #0xc000
	cmp r5, #0
	beq _0206C330
	mov r1, r5
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
_0206C330:
	mov r0, r5
	str r5, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseDriver_IsSettingsValid

	arm_func_start DseDriver_ConfigureHeap
DseDriver_ConfigureHeap: ; 0x0206C33C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strne r1, [r0, #8]
	strne r2, [r0, #0xc]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end DseDriver_ConfigureHeap

	arm_func_start sub_0206C36C
sub_0206C36C: ; 0x0206C36C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strneb r1, [r0, #0x11]
	strneb r2, [r0, #0x10]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C36C

	arm_func_start sub_0206C39C
sub_0206C39C: ; 0x0206C39C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0206C3C0
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
_0206C3C0:
	cmp r1, #0
	movlt r1, #0
	cmp r2, #0
	strh r1, [r0, #0x14]
	movlt r2, #0xf
	strh r2, [r0, #0x16]
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C39C

	arm_func_start DseDriver_Init
DseDriver_Init: ; 0x0206C3E0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r1, [r1]
	cmp r1, #1
	bne _0206C410
	mov r1, #0
	mov r2, r1
	mvn r0, #0xbf
	bl Dse_SetError
	mvn r0, #0xbf
	ldmia sp!, {r4, pc}
_0206C410:
	bl DseDriver_IsSettingsValid
	movs r1, r0
	beq _0206C430
	mvn r0, #0x1d
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x1d
	ldmia sp!, {r4, pc}
_0206C430:
	bl sub_0207AD54
	mov r0, #0
	mov r1, r0
	bl sub_0207AEF4
	bl sub_0207AFF0
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r3, #0
	strh r3, [r0, #2]
	str r3, [r0, #4]
	str r3, [r0, #0x10]
	mov r2, #0xff
	mov r1, #1
	strb r2, [r0, #0x3c]
	strb r1, [r0, #0x3d]
	rsb r1, r1, #0x1000
	strh r1, [r0, #0x3e]
	str r3, [r0, #0x2c]
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	ldreq r2, _0206C5FC ; =0x00002710
	moveq r1, #0x64
	ldrne r2, _0206C600 ; =0x0000414B
	movne r1, #0x3c
	strh r2, [r0, #0x28]
	str r1, [r0, #0x30]
	ldr r2, _0206C604 ; =0x00BC614E
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	ldr r0, _0206C608 ; =_022B8330
	str r2, [r1, #0x34]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #0xdd8]
	bl sub_0206C814
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r0, #1
	strb r0, [r1, #0x38]
	mov r3, #2
	ldr r2, _0206C60C ; =_020B1290
	ldr r0, _0206C608 ; =_022B8330
	strb r3, [r1, #0x39]
	str r2, [r0, #0xed4]
	mov r2, #0
	str r2, [r1, #0x71c]
	str r2, [r1, #0x720]
	str r2, [r1, #0x724]
	str r2, [r1, #0x728]
	ldrb r1, [r4, #0x10]
	ldr ip, _0206C610 ; =DRIVER_WORK
	mov r3, r2
	strb r1, [r0, #0xd10]
_0206C4F4:
	add r2, r2, #1
	strb r3, [ip, #0x674]
	cmp r2, #0x80
	add ip, ip, #1
	blt _0206C4F4
	ldr ip, _0206C5F8 ; =DRIVER_WORK
	mov r0, #0x64
	strb r0, [ip, #0x67b]
	mov r0, #0x7f
	strb r0, [ip, #0x67f]
	mov r0, #0x40
	strb r0, [ip, #0x67e]
	add r0, r4, #0x28
	ldr lr, _0206C614 ; =_022B734C
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldrsh ip, [ip, #0x28]
	ldr r1, _0206C608 ; =_022B8330
	mov r2, #1
	str r3, [r1, #0xec8]
	str r2, [r1, #0xecc]
	str r3, [r1, #0xebc]
	ldr r0, _0206C618 ; =_022B9130
	str r3, [r1, #0xec0]
	sub r2, r2, #2
	strh r2, [r0, #0xc4]
	strh ip, [r0, #0xc6]
	strb r3, [r1, #0xed0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r4, #0x1c
	bl DseMem_Init
	ldrsh r0, [r4, #0x16]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DseVoice_ResetHW
	bl DseVoice_ResetAll
	bl sub_02070124
	bl sub_02075600
	bl sub_020729A4
	ldr r1, _0206C61C ; =_022B7331
	mov r2, #1
	mov r0, #0x7f
_0206C5A4:
	add r2, r2, #1
	strb r0, [r1, #0x40]
	cmp r2, #0x10
	add r1, r1, #1
	blt _0206C5A4
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #0x40]
	bl DseDriver_StartMainThread
	ldrb r0, [r4, #0x12]
	bl DseSwd_SysInit
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #1
	strb r1, [r0]
	mov r1, #0
	strb r1, [r0, #1]
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	bl DseSe_SysReset
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C5F8: .word DRIVER_WORK
_0206C5FC: .word 0x00002710
_0206C600: .word 0x0000414B
_0206C604: .word 0x00BC614E
_0206C608: .word _022B8330
_0206C60C: .word _020B1290
_0206C610: .word DRIVER_WORK
_0206C614: .word _022B734C
_0206C618: .word _022B9130
_0206C61C: .word _022B7331
	arm_func_end DseDriver_Init

	arm_func_start sub_0206C620
sub_0206C620: ; 0x0206C620
	stmdb sp!, {r3, lr}
	ldr r0, _0206C684 ; =DRIVER_WORK
	ldrsb r0, [r0]
	cmp r0, #0
	mvneq r0, #0xc0
	ldmeqia sp!, {r3, pc}
	bl DseSwd_SysQuit
	mov r0, #0
	bl sub_0206C7F4
	bl sub_020756E8
	bl sub_02070158
	bl sub_02070148
	bl sub_02070EA0
	bl DseVoice_ResetAll
	bl DseMem_Quit
	bl sub_0206C814
	ldr r1, _0206C684 ; =DRIVER_WORK
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	str r0, [r1, #0x2c]
	str r0, [r1, #4]
	str r0, [r1, #0x10]
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C684: .word DRIVER_WORK
	arm_func_end sub_0206C620

	arm_func_start sub_0206C688
sub_0206C688: ; 0x0206C688
	stmdb sp!, {r3, lr}
	ldr r0, _0206C6B8 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	ldrnesb r0, [r0, #1]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C6B8: .word DRIVER_WORK
	arm_func_end sub_0206C688

	arm_func_start sub_0206C6BC
sub_0206C6BC: ; 0x0206C6BC
	stmdb sp!, {r3, lr}
	ldr r0, _0206C750 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	bne _0206C6E8
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
_0206C6E8:
	ldrsb r1, [r0, #1]
	cmp r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r0, #1]
	bl sub_02070F4C
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x664]
	bl DseSequence_PauseList
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x668]
	bl DseSequence_PauseList
	mov r0, #0
	bl sub_0206F6FC
	mov r0, #0
	bl sub_02070188
	mov r0, #0
	bl DseVoice_ResetHW
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #2
	strb r1, [r0, #0x38]
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C750: .word DRIVER_WORK
	arm_func_end sub_0206C6BC

	arm_func_start sub_0206C754
sub_0206C754: ; 0x0206C754
	stmdb sp!, {r4, lr}
	ldr r1, _0206C7F0 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r0, [r1, #1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r1, #0x38]
	ldrh r0, [r1, #0x3e]
	mov r1, r4
	tst r0, #0xf
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r2, #0
	mov r2, r2, lsl #0x18
	ldr r0, [r0, #0x664]
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	ldrh r0, [r0, #0x3e]
	tst r0, #0xf0
	movne r1, #1
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r1, #0
	mov r2, r1, lsl #0x18
	ldr r0, [r0, #0x668]
	mov r1, r4
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	mov r0, r4
	bl sub_0206F774
	mov r0, r4
	bl sub_020701B0
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #1]
	bl DseDriver_StartTickTimer
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C7F0: .word DRIVER_WORK
	arm_func_end sub_0206C754

	arm_func_start sub_0206C7F4
sub_0206C7F4: ; 0x0206C7F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DseBgm_StopAll
	mov r0, r4
	bl DseSe_StopAll
	mov r0, r4
	bl sub_0206F9A4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206C7F4

	arm_func_start sub_0206C814
sub_0206C814: ; 0x0206C814
	ldr r1, _0206C848 ; =DRIVER_WORK
	mov r2, #0
	str r2, [r1, #0x654]
	str r2, [r1, #0x658]
	ldr r0, _0206C84C ; =_022B8330
	str r2, [r1, #0x65c]
	str r2, [r0, #0xddc]
	str r2, [r1, #0x660]
	str r2, [r1, #0x664]
	str r2, [r1, #0x668]
	ldr ip, _0206C850 ; =DseBgm_SysSetupNoteList
	str r2, [r1, #0x66c]
	bx ip
	.align 2, 0
_0206C848: .word DRIVER_WORK
_0206C84C: .word _022B8330
_0206C850: .word DseBgm_SysSetupNoteList
	arm_func_end sub_0206C814

	arm_func_start Dse_SetError
Dse_SetError: ; 0x0206C854
	stmdb sp!, {r3, lr}
	ldr r3, _0206C880 ; =DRIVER_WORK
	stmib r3, {r0, r1, r2}
	ldr ip, [r3, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C884 ; =_022B7334
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C880: .word DRIVER_WORK
_0206C884: .word _022B7334
	arm_func_end Dse_SetError

	arm_func_start Dse_SetError2
Dse_SetError2: ; 0x0206C888
	stmdb sp!, {r3, lr}
	ldr r3, _0206C8BC ; =DRIVER_WORK
	str r0, [r3, #0x10]
	str r1, [r3, #0x14]
	str r2, [r3, #0x18]
	ldr ip, [r3, #0x20]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C8C0 ; =_022B7340
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C8BC: .word DRIVER_WORK
_0206C8C0: .word _022B7340
	arm_func_end Dse_SetError2

; https://decomp.me/scratch/C4osO
	arm_func_start DseUtil_ByteSwap32
DseUtil_ByteSwap32: ; 0x0206C8C4
	mov r3, r0, lsr #0x18
	mov r2, r0, lsr #8
	mov r1, r0, lsl #8
	mov r0, r0, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	and r1, r1, #0xff0000
	orr r1, r2, r1
	and r0, r0, #0xff000000
	orr r0, r1, r0
	bx lr
	arm_func_end DseUtil_ByteSwap32

	arm_func_start DseUtil_GetRandomNumber
DseUtil_GetRandomNumber: ; 0x0206C8F4
	ldr r1, _0206C914 ; =DRIVER_WORK
	ldr r0, _0206C918 ; =0x00007FFF
	ldr r2, [r1, #0x34]
	eor r2, r2, r2, lsl #17
	eor r2, r2, r2, asr #15
	str r2, [r1, #0x34]
	and r0, r2, r0
	bx lr
	.align 2, 0
_0206C914: .word DRIVER_WORK
_0206C918: .word 0x00007FFF
	arm_func_end DseUtil_GetRandomNumber

; https://decomp.me/scratch/KrgBG
	arm_func_start DseMem_Init
DseMem_Init: ; 0x0206C91C
	mov ip, r1
	tst r0, #0xf
	bicne r0, r0, #0xf
	ldr r1, _0206C980 ; =DRIVER_WORK
	addne r0, r0, #0x10
	subne ip, ip, #0x10
	add r3, r0, ip
	str r0, [r1, #0x6f4]
	str r3, [r1, #0x6f8]
	str ip, [r1, #0x6fc]
	ldr r3, _0206C984 ; =0x74647373
	mov r1, #0x82
	str r3, [r0]
	strb r1, [r0, #4]
	mov r3, #0
	strb r3, [r0, #5]
	add r1, r0, #0x10
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	strb r3, [r0, #6]
	ldr r3, _0206C988 ; =_022B7A30
	ldmia r2, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, ip
	bx lr
	.align 2, 0
_0206C980: .word DRIVER_WORK
_0206C984: .word 0x74647373
_0206C988: .word _022B7A30
	arm_func_end DseMem_Init
