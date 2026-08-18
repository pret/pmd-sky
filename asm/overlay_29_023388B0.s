	.include "asm/macros.inc"
	.include "overlay_29_023388B0.inc"

	.text

	arm_func_start LoadWeather3DFiles
LoadWeather3DFiles: ; 0x023388B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _02338974 ; =ov29_02352F1C
	mov sl, #0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r7, _02338978 ; =ov29_02352F40
	add r8, sp, #0
	str r1, [sp, #4]
	str r0, [sp]
	mov r6, #4
	mov r5, #0x300
	mov fp, sl
	mov r4, #0x14
_023388E8:
	mul sb, sl, r4
	ldrh r2, [r7, sb]
	mov r0, r8
	mov r1, r6
	mov r3, r5
	add sb, r7, sb
	bl LoadWteFromFileDirectory
	ldrsh r2, [sb, #8]
	ldr r0, [sp, #4]
	ldr r1, [sb, #4]
	mov r3, fp
	bl ProcessWte
	mov r0, r8
	bl DelayWteFree
	add sl, sl, #1
	cmp sl, #3
	blt _023388E8
	ldr r0, _0233897C ; =ov29_0237CACC
	mov r1, #0
	bl ov29_02338D94
	ldr r0, _02338980 ; =ov29_0237CD40
	mov r1, #1
	bl ov29_02338D94
	ldr r0, _02338984 ; =ov29_02352F7C
	ldr r2, _0233897C ; =ov29_0237CACC
	mov r1, #0
	ldr r4, [r0]
	strb r1, [r2, #0x240]
	ldr r3, [r0, #4]
	str r4, [r2, #0x254]
	ldr r0, _02338980 ; =ov29_0237CD40
	str r3, [r2, #0x258]
	bl ov29_02338D34
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338974: .word ov29_02352F1C
_02338978: .word ov29_02352F40
_0233897C: .word ov29_0237CACC
_02338980: .word ov29_0237CD40
_02338984: .word ov29_02352F7C
	arm_func_end LoadWeather3DFiles

	arm_func_start Weather3DEffectActive
Weather3DEffectActive: ; 0x02338988
	stmdb sp!, {r3, lr}
	ldr r0, _023389BC ; =ov29_0237CACC
	bl ov29_02338D58
	cmp r0, #0
	bne _023389AC
	ldr r0, _023389C0 ; =ov29_0237CD40
	bl ov29_02338D58
	cmp r0, #0
	beq _023389B4
_023389AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023389B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023389BC: .word ov29_0237CACC
_023389C0: .word ov29_0237CD40
	arm_func_end Weather3DEffectActive

	arm_func_start ov29_023389C4
ov29_023389C4: ; 0x023389C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r0, #0xc
	mul r2, r4, r0
	ldr r1, _02338A3C ; =ov10_022C6326
	ldr r0, _02338A40 ; =ov29_0237CACC
	ldrb r1, [r1, r2]
	bl ov29_02338D34
	cmp r4, #0xc3
	bne _02338A34
	ldr r1, _02338A44 ; =ov29_02352F1C
	ldr r2, _02338A48 ; =0x000003EB
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	str r3, [sp, #4]
	add r0, sp, #0
	mov r1, #4
	mov r3, #0
	str ip, [sp]
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0xb000
	mov r2, #0x14
	mov r3, #0
	bl ProcessWte
	add r0, sp, #0
	bl DelayWteFree
_02338A34:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02338A3C: .word ov10_022C6326
_02338A40: .word ov29_0237CACC
_02338A44: .word ov29_02352F1C
_02338A48: .word 0x000003EB
	arm_func_end ov29_023389C4

	arm_func_start ov29_02338A4C
ov29_02338A4C: ; 0x02338A4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02338AB4 ; =ov29_02353730
	mov r4, r0
	ldrb r1, [r1, r4, lsl #3]
	ldr r0, _02338AB8 ; =ov29_0237CD40
	bl ov29_02338D34
	ldr r1, _02338ABC ; =ov29_0235372C
	mov sb, #0
	ldr r7, [r1, r4, lsl #3]
	ldr r0, _02338AC0 ; =ov29_0237CACC
	ldr r5, _02338AB8 ; =ov29_0237CD40
	str r7, [r0, #0x4e4]
	mov r6, sb
	mov r4, #0xc0
_02338A84:
	mla sl, sb, r4, r5
	mov r8, r6
_02338A8C:
	mov r1, r7
	add r0, sl, r8, lsl #6
	bl ov29_02338E50
	add r8, r8, #1
	cmp r8, #3
	blt _02338A8C
	add sb, sb, #1
	cmp sb, #3
	blt _02338A84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02338AB4: .word ov29_02353730
_02338AB8: .word ov29_0237CD40
_02338ABC: .word ov29_0235372C
_02338AC0: .word ov29_0237CACC
	arm_func_end ov29_02338A4C

	arm_func_start RenderWeather3D
RenderWeather3D: ; 0x02338AC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
_02338ACC:
	ldr r1, _02338D28 ; =ov29_0237CACC
	mov r0, #0x274
	mla r6, r5, r0, r1
	ldrb r0, [r6, #0x240]
	cmp r0, #0
	beq _02338D18
	bl DungeonScreenEffectActive
	cmp r0, #0
	movne r0, #0
	strneb r0, [r6, #0x26d]
	bne _02338B04
	mov r0, r6
	mov r1, #1
	bl ov29_02338D6C
_02338B04:
	mov r0, r6
	bl ov29_02338D58
	cmp r0, #0
	beq _02338D18
	ldr r4, [r6, #0x24c]
	ldr fp, [r6, #0x250]
	mov r7, #0
_02338B20:
	mov r0, #0xc0
	mla sl, r7, r0, r6
	mov r0, r7, lsl #7
	add sb, r0, fp, asr #8
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	mov r8, #0
	str r0, [sp]
_02338B40:
	cmp sb, #0xc0
	bge _02338B74
	mov r0, r8, lsl #7
	ldr r1, [r6, #0x244]
	add r2, r0, r4, asr #8
	mov r0, r8, lsl #6
	strh r2, [sl, r0]
	ldr r2, [sp]
	add r0, sl, r8, lsl #6
	strh r2, [r0, #2]
	mov r1, r1, asr #8
	strb r1, [r0, #0x2f]
	bl sub_0201F2A0
_02338B74:
	add r8, r8, #1
	cmp r8, #3
	blt _02338B40
	add r7, r7, #1
	cmp r7, #3
	blt _02338B20
	ldrb r0, [r6, #0x240]
	cmp r0, #9
	beq _02338BBC
	ldr r1, [r6, #0x24c]
	ldr r0, [r6, #0x254]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r1, [r6, #0x250]
	ldr r0, [r6, #0x258]
	add r0, r1, r0
	str r0, [r6, #0x250]
	b _02338C48
_02338BBC:
	ldr r0, [r6, #0x25c]
	bl SinAbs4096
	ldr r3, [r6, #0x254]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r1, [r6, #0x24c]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r0, [r6, #0x260]
	bl SinAbs4096
	ldr r3, [r6, #0x258]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r2, [r6, #0x250]
	ldr r1, _02338D2C ; =0x00000FFF
	add r0, r2, r0
	str r0, [r6, #0x250]
	ldr r2, [r6, #0x25c]
	ldr r0, [r6, #0x264]
	add r0, r2, r0
	str r0, [r6, #0x25c]
	ldr r2, [r6, #0x260]
	ldr r0, [r6, #0x268]
	add r0, r2, r0
	str r0, [r6, #0x260]
	ldr r0, [r6, #0x25c]
	and r0, r0, r1
	str r0, [r6, #0x25c]
	ldr r0, [r6, #0x260]
	and r0, r0, r1
	str r0, [r6, #0x260]
_02338C48:
	ldr r1, [r6, #0x24c]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x24c]
	bgt _02338C70
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x24c]
_02338C70:
	ldr r1, [r6, #0x250]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x250]
	bgt _02338C98
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x250]
_02338C98:
	ldrb r0, [r6, #0x26e]
	cmp r0, #0
	beq _02338CC8
	ldr r0, [r6, #0x244]
	add r0, r0, #0x400
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movge r0, #1
	strgeb r0, [r6, #0x26c]
	movge r0, #0
	strgeb r0, [r6, #0x26e]
	b _02338D18
_02338CC8:
	ldrb r0, [r6, #0x26c]
	ldr r1, [r6, #0x244]
	cmp r0, #0
	ldr r0, [r6, #0x248]
	bne _02338CFC
	sub r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movlt r0, #1
	strltb r0, [r6, #0x26c]
	movlt r0, #0x4000
	strlt r0, [r6, #0x244]
	b _02338D18
_02338CFC:
	add r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0xc000
	movgt r0, #0
	strgtb r0, [r6, #0x26c]
	movgt r0, #0xc000
	strgt r0, [r6, #0x244]
_02338D18:
	add r5, r5, #1
	cmp r5, #2
	blt _02338ACC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338D28: .word ov29_0237CACC
_02338D2C: .word 0x00000FFF
	arm_func_end RenderWeather3D

	arm_func_start ov29_02338D30
ov29_02338D30: ; 0x02338D30
	bx lr
	arm_func_end ov29_02338D30

	arm_func_start ov29_02338D34
ov29_02338D34: ; 0x02338D34
	ldr r3, _02338D54 ; =ov29_02352F7C
	strb r1, [r0, #0x240]
	add r2, r3, r1, lsl #3
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, #4]
	str r3, [r0, #0x254]
	str r1, [r0, #0x258]
	bx lr
	.align 2, 0
_02338D54: .word ov29_02352F7C
	arm_func_end ov29_02338D34

	arm_func_start ov29_02338D58
ov29_02338D58: ; 0x02338D58
	ldrb r1, [r0, #0x240]
	cmp r1, #0
	moveq r0, #0
	ldrneb r0, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D58

	arm_func_start ov29_02338D6C
ov29_02338D6C: ; 0x02338D6C
	cmp r1, #0
	beq _02338D8C
	ldrb r2, [r0, #0x26d]
	cmp r2, #0
	moveq r2, #1
	streqb r2, [r0, #0x26e]
	moveq r2, #0
	streq r2, [r0, #0x244]
_02338D8C:
	strb r1, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D6C

	arm_func_start ov29_02338D94
ov29_02338D94: ; 0x02338D94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0x4000
	str r0, [sl, #0x244]
	mov r0, #0
	str r0, [sl, #0x248]
	strb r0, [sl, #0x26c]
	str r0, [sl, #0x24c]
	str r0, [sl, #0x250]
	mov r0, #0x400
	mov sb, r1
	bl DungeonRandInt
	str r0, [sl, #0x25c]
	mov r0, #0x400
	bl DungeonRandInt
	str r0, [sl, #0x260]
	mov r0, #4
	str r0, [sl, #0x264]
	mov r0, #1
	str r0, [sl, #0x268]
	mov r5, #0
	strb r0, [sl, #0x26d]
	strb r5, [sl, #0x26e]
	str sb, [sl, #0x270]
	mov fp, r5
_02338DF8:
	mov r0, #0xc0
	mla r8, r5, r0, sl
	mov r6, #0
_02338E04:
	add r7, r8, r6, lsl #6
	mov r0, r7
	mov r4, r6, lsl #6
	bl InitRender3dElement64
	strb fp, [r7, #0x3c]
	strh fp, [r8, r4]
	strh fp, [r7, #2]
	ldr r2, [sl, #0x244]
	mov r0, r7
	mov r1, sb
	strb r2, [r7, #0x2f]
	bl ov29_02338E50
	add r6, r6, #1
	cmp r6, #3
	blt _02338E04
	add r5, r5, #1
	cmp r5, #3
	blt _02338DF8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02338D94

	arm_func_start ov29_02338E50
ov29_02338E50: ; 0x02338E50
	ldr r3, _02338F08 ; =ov29_02352F40
	mov r2, #0x14
	mla r2, r1, r2, r3
	ldr r3, [r2, #4]
	mov r1, #0
	str r3, [r0, #0x20]
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	mov r1, #0x80
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh r3, [r0, #0x14]
	ldr r1, _02338F0C ; =_020AFC70
	bic r3, r3, #7
	orr r3, r3, #4
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x38
	orr r3, r3, #0x20
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0xc0
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x700
	orr r3, r3, #0x300
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x1800
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x6000
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	orr r3, r3, #0x8000
	strh r3, [r0, #0x14]
	ldr r3, [r1]
	ldrsh r1, [r2, #8]
	ldr r3, [r3, #0xe0]
	add r1, r3, r1, lsl #9
	str r1, [r0, #0x24]
	ldr r1, [r2, #0xc]
	strh r1, [r0, #0x2a]
	ldr r1, [r2, #0x10]
	strb r1, [r0, #0x3e]
	bx lr
	.align 2, 0
_02338F08: .word ov29_02352F40
_02338F0C: .word _020AFC70
	arm_func_end ov29_02338E50

	arm_func_start ov29_02338F10
ov29_02338F10: ; 0x02338F10
	ldr r0, _02338F20 ; =ov29_0235376C
	mov r1, #0x64
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02338F20: .word ov29_0235376C
	arm_func_end ov29_02338F10

	arm_func_start ov29_02338F24
ov29_02338F24: ; 0x02338F24
	ldr r2, _02338F34 ; =ov29_0235376C
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	bx lr
	.align 2, 0
_02338F34: .word ov29_0235376C
	arm_func_end ov29_02338F24

	arm_func_start ov29_02338F38
ov29_02338F38: ; 0x02338F38
	ldr r1, _02338F44 ; =ov29_0237CFB8
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_02338F44: .word ov29_0237CFB8
	arm_func_end ov29_02338F38

	arm_func_start ov29_02338F48
ov29_02338F48: ; 0x02338F48
	ldr r1, _02338F54 ; =ov29_0237CFB8
	strb r0, [r1]
	bx lr
	.align 2, 0
_02338F54: .word ov29_0237CFB8
	arm_func_end ov29_02338F48

	arm_func_start ov29_02338F58
ov29_02338F58: ; 0x02338F58
	ldr r1, _02338F64 ; =ov29_0235376C
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02338F64: .word ov29_0235376C
	arm_func_end ov29_02338F58

	arm_func_start ov29_02338F68
ov29_02338F68: ; 0x02338F68
	stmdb sp!, {r3, lr}
	ldr r1, _02338FBC ; =0x0000040B
	ldr r2, _02338FC0 ; =ov29_02353784
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, _02338FC4 ; =ov29_0235376C
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	bl HandleSir0Translation
	ldr r1, [sp]
	ldr r0, _02338FC4 ; =ov29_0235376C
	str r1, [r0, #8]
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r2, #0
	ldr r1, _02338FC4 ; =ov29_0235376C
	strb r2, [r0, #0x447]
	str r2, [r1, #0xc]
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_02338FBC: .word 0x000003FF
#else
_02338FBC: .word 0x0000040B
#endif
_02338FC0: .word ov29_02353784
_02338FC4: .word ov29_0235376C
	arm_func_end ov29_02338F68

	arm_func_start ov29_02338FC8
ov29_02338FC8: ; 0x02338FC8
	stmdb sp!, {r3, lr}
	ldr r0, _02339000 ; =ov29_0235376C
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02338FF0
	ldr r0, _02339004 ; =ov29_02353784
	bl UnloadFile
	ldr r0, _02339000 ; =ov29_0235376C
	mov r1, #0
	str r1, [r0, #8]
_02338FF0:
	ldr r0, _02339008 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339000: .word ov29_0235376C
_02339004: .word ov29_02353784
_02339008: .word ov29_0237CFB8
	arm_func_end ov29_02338FC8

	arm_func_start ov29_0233900C
ov29_0233900C: ; 0x0233900C
	stmdb sp!, {r3, lr}
	ldr r0, _02339044 ; =ov29_0235352C
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov29_022DE288
	ldr r1, _02339044 ; =ov29_0235352C
	ldr r2, _02339048 ; =ov29_0235376C
	ldr r1, [r1]
	str r0, [r2, #0x10]
	add r0, r1, #0x2c
	bl ov29_022DE288
	ldr r1, _02339048 ; =ov29_0235376C
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339044: .word ov29_0235352C
_02339048: .word ov29_0235376C
	arm_func_end ov29_0233900C

	arm_func_start ov29_0233904C
ov29_0233904C: ; 0x0233904C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	bl GetMinimapData
	mov r7, r0
	mov r6, #0
	add r4, r7, #0x7000
_02339064:
	mov r0, #0x700
	mul r1, r6, r0
	mov r0, #0x1c
	mla sl, r6, r0, r7
	mov r5, #0
	add r8, r7, r1
	add sb, r4, r1
_02339080:
	add r0, r8, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sb, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sl, r5
	add r1, r0, #0xe000
	mov r0, #0
	add r5, r5, #1
	strb r0, [r1]
	cmp r5, #0x1c
	blt _02339080
	add r6, r6, #1
	cmp r6, #0x10
	blt _02339064
	cmp fp, #0
	ldreq r0, _02339110 ; =ov29_0235376C
	moveq r1, #0x64
	streqh r1, [r0, #2]
	streqh r1, [r0, #4]
	add r0, r7, #0xe000
	mov r3, #0
	str r3, [r0, #0x440]
	mov r2, #1
	strb r2, [r0, #0x444]
	ldr r1, _02339114 ; =ov29_0237CFB8
	strb r3, [r0, #0x446]
	strb r2, [r1, #3]
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldr r0, _02339114 ; =ov29_0237CFB8
	mov r1, #1
	strb r1, [r0, #2]
	bl ov29_02339148
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02339110: .word ov29_0235376C
_02339114: .word ov29_0237CFB8
	arm_func_end ov29_0233904C
