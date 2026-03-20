	.include "asm/macros.inc"
	.include "main_02052060.inc"

	.text

	arm_func_start sub_02052060
sub_02052060: ; 0x02052060
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r4, _020522E4 ; =_020B09B0
	mov sl, r1
	ldr r7, [sp, #0x54]
	ldr r4, [r4]
	mov r1, #0x30
	mla r4, r7, r1, r4
	ldr fp, [sp, #0x50]
	mov r1, #0x18
	mla r4, fp, r1, r4
	mov sb, r2
	add r1, sp, #0x28
	mov r2, #0xf
	mov r8, r3
	ldr r5, [r4, #0x10]
	bl sub_02051FF0
	mov r3, r0
	ldr r4, [sp, #0x28]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _020522E4 ; =_020B09B0
	ldr r2, [r4, #8]
	ldr r0, [r0]
	add r1, r5, sl
	add r2, r4, r2
	add r0, r0, #0x60
	bl sub_02051804
	mov r0, #1
	str r0, [sp]
	mov r1, #0
	ldr r0, _020522E4 ; =_020B09B0
	str r1, [sp, #4]
	ldr r0, [r0]
	mov r2, r4
	mov r3, r1
	add r0, r0, #0x60
	bl sub_02051804
	ldr r1, [sp, #0x28]
	rsb r0, sb, #0x20
	mov r0, r0, lsl #0x10
	ldr r1, [r1, #0x10]
	str r0, [sp, #0x18]
	add r0, r4, r1
	str r0, [sp, #0xc]
	mov r5, #0
	b _020521CC
_02052120:
	mov r6, #0
	mov r0, r6
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r1, sb, lsl #0x10
	add r0, r0, sb, lsl #6
	str r0, [sp, #0x10]
	mov r0, r1, asr #0x10
	str r0, [sp, #0x14]
_02052144:
	ldr r0, [sp, #0x10]
	mov r1, r6, lsl #1
	ldrh r1, [r1, r0]
	ldr r2, _020522E8 ; =0x00000FFF
	mov r0, r6, lsl #0x10
	and r2, r1, r2
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #4
	mov r2, r2, lsr #0x10
	add r1, r8, r1, lsr #16
	add r2, r2, sl, lsr #5
	mov r1, r1, lsl #0x1c
	mov r2, r2, lsl #0x10
	mov r1, r1, lsr #0x10
	orr r1, r1, r2, lsr #16
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r1, [sp, #0x14]
	mov r0, r0, asr #0x10
	str r7, [sp]
	mov r3, fp
	bl sub_02051D8C
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #8]
	cmp r0, #0x20
	blo _02052144
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	add sb, sb, #1
_020521CC:
	ldr r0, [sp, #0x18]
	cmp r5, r0, lsr #16
	blo _02052120
	mov r0, fp
	mov r1, r7
	bl sub_02051E60
	ldr r0, [sp, #0x28]
	ldr r3, _020522EC ; =ARM9_UNKNOWN_PTR__NA_20A2C84
	ldr r0, [r0]
	add r2, sp, #0x1c
	add r5, r4, r0
	mov r4, #0
	mov r1, #4
_02052200:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052200
	mov r0, #0x28
	mul r6, r7, r0
	b _020522B0
_0205221C:
	add r3, sp, #0x1c
	add r2, sp, #0x20
	mov r1, #4
_02052228:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052228
	ldrb r0, [r5]
	add r3, sp, #0x20
	add r2, sp, #0x24
	strb r0, [sp, #0x20]
	ldrb r0, [r5, #1]
	mov r1, #4
	strb r0, [sp, #0x21]
	ldrb r0, [r5, #2]
	strb r0, [sp, #0x22]
	ldrb r0, [r5, #3]
	strb r0, [sp, #0x23]
_02052264:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052264
	add r0, r4, r8, lsl #4
	cmp r0, #0x100
	bge _020522C8
	ldr r1, _020522E4 ; =_020B09B0
	mov r0, r0, lsl #0x10
	ldr r1, [r1]
	mov r0, r0, asr #0x10
	add r3, r1, #0x1cc
	mov r1, r0, lsl #0x10
	add r2, sp, #0x24
	add r0, r3, r6
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	add r4, r4, #1
	add r5, r5, #4
_020522B0:
	ldr r0, [sp, #0x28]
	ldr r1, [r0, #4]
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r4, r0, asr #2
	blt _0205221C
_020522C8:
	ldr r0, _020522E4 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	add r0, r0, r6
	bl sub_0200A504
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020522E4: .word _020B09B0
_020522E8: .word 0x00000FFF
_020522EC: .word ARM9_UNKNOWN_PTR__NA_20A2C84
	arm_func_end sub_02052060

	arm_func_start sub_020522F0
sub_020522F0: ; 0x020522F0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_02051FF0
	str r0, [r4, #8]
	ldr r1, [r4]
	ldr r0, [r1, #8]
	add r0, r1, r0
	str r0, [r4, #4]
	ldr r0, [r4]
	ldr r0, [r0, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020522F0

	arm_func_start sub_02052334
sub_02052334: ; 0x02052334
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02052334

	arm_func_start LoadMonsterMd
LoadMonsterMd: ; 0x02052358
	stmdb sp!, {r3, lr}
	ldr r0, _02052388 ; =_020B09C0
	ldr r1, _0205238C ; =_020A31B8
	mov r2, #0
	bl LoadFileFromRom
	bl LoadM2nAndN2m
	ldr r0, _02052390 ; =MONSTER_DATA_TABLE_PTR
	ldr r1, [r0, #0xc]
#ifdef EUROPE
	str r1, [r0, #8]
#else
	str r1, [r0, #4]
#endif
	add r1, r1, #8
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052388: .word _020B09C0
_0205238C: .word _020A31B8
_02052390: .word MONSTER_DATA_TABLE_PTR
	arm_func_end LoadMonsterMd

	arm_func_start GetNameRaw
GetNameRaw: ; 0x02052394
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #0x14
	bl strncpy
	ldmia sp!, {r4, pc}
	arm_func_end GetNameRaw

	arm_func_start GetName
GetName: ; 0x020523D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r1, #0x258
	mov r4, r2
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r2, r4
	ldr r1, _02052414 ; =_020A31D4
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02052414: .word _020A31D4
	arm_func_end GetName

	arm_func_start SprintfStatic__02052418
SprintfStatic__02052418: ; 0x02052418
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02052418

	arm_func_start GetNameWithGender
GetNameWithGender: ; 0x02052440
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
#endif
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r1, #0x258
	mov r4, r2
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldr r2, _020524F4 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	mov r3, r0
	smlabb r0, r5, r1, r2
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	cmpne r5, #0x1d
	cmpne r5, #0x20
	bne _020524B0
	ldr r1, _020524F8 ; =_020A31D4
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
#else
	b _020524EC
#endif
_020524B0:
	cmp r0, #2
	bne _020524D4
	ldr r1, _020524FC ; =_020A31E4
#ifdef JAPAN
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
	ldmia sp!, {r4, r5, r6, pc}
_020524D4:
	ldr r1, _02052838_JP ; =_020A45C8_JP
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
	ldmia sp!, {r4, r5, r6, pc}
#else
	mov r5, #0xbe
	mov r0, r6
	mov r2, r4
	str r5, [sp]
	bl SprintfStatic__02052418
	b _020524EC
_020524D4:
	ldr r1, _020524FC ; =_020A31E4
	mov r5, #0xbd
	mov r0, r6
	mov r2, r4
	str r5, [sp]
	bl SprintfStatic__02052418
_020524EC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
#endif
	.align 2, 0
_020524F4: .word MONSTER_DATA_TABLE_PTR
_020524F8: .word _020A31D4
_020524FC: .word _020A31E4
#ifdef JAPAN
_02052838_JP: .word _020A45C8_JP
#endif
	arm_func_end GetNameWithGender

	arm_func_start GetSpeciesString
GetSpeciesString: ; 0x02052500
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetBaseForm
	cmp r0, #0xc9
	bne _02052684
	cmp r4, #0xca
	moveq r4, #1
	beq _02052660
	cmp r4, #0xcb
	moveq r4, #2
	beq _02052660
	cmp r4, #0xcc
	moveq r4, #3
	beq _02052660
	cmp r4, #0xcd
	moveq r4, #4
	beq _02052660
	cmp r4, #0xce
	moveq r4, #5
	beq _02052660
	cmp r4, #0xcf
	moveq r4, #6
	beq _02052660
	cmp r4, #0xd0
	moveq r4, #7
	beq _02052660
	cmp r4, #0xd1
	moveq r4, #8
	beq _02052660
	cmp r4, #0xd2
	moveq r4, #9
	beq _02052660
	cmp r4, #0xd3
	moveq r4, #0xa
	beq _02052660
	cmp r4, #0xd4
	moveq r4, #0xb
	beq _02052660
	cmp r4, #0xd5
	moveq r4, #0xc
	beq _02052660
	cmp r4, #0xd6
	moveq r4, #0xd
	beq _02052660
	cmp r4, #0xd7
	moveq r4, #0xe
	beq _02052660
	cmp r4, #0xd8
	moveq r4, #0xf
	beq _02052660
	cmp r4, #0xd9
	moveq r4, #0x10
	beq _02052660
	cmp r4, #0xda
	moveq r4, #0x11
	beq _02052660
	cmp r4, #0xdb
	moveq r4, #0x12
	beq _02052660
	cmp r4, #0xdc
	moveq r4, #0x13
	beq _02052660
	cmp r4, #0xdd
	moveq r4, #0x14
	beq _02052660
	cmp r4, #0xde
	moveq r4, #0x15
	beq _02052660
	cmp r4, #0xdf
	moveq r4, #0x16
	beq _02052660
	cmp r4, #0xe0
	moveq r4, #0x17
	beq _02052660
	cmp r4, #0xe1
	moveq r4, #0x18
	beq _02052660
	cmp r4, #0xe2
	moveq r4, #0x19
	beq _02052660
	cmp r4, #0xe3
	moveq r4, #0x1a
	beq _02052660
	cmp r4, #0xe4
	moveq r4, #0x1b
	movne r4, #0
_02052660:
	ldr r0, _020526B8 ; =0x000022E8
	bl StringFromId
	ldr r1, _020526BC ; =UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE
	mov r2, r0
	ldr r3, [r1, r4, lsl #2]
	ldr r1, _020526C0 ; =_020A31F4
	mov r0, r5
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
_02052684:
	mov r0, r4
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _020526C4 ; =_020A31FC
	mov r0, r5
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
_020526B8: .word 0x000022EA
#elif defined(JAPAN)
_020526B8: .word 0x00001659
#else
_020526B8: .word 0x000022E8
#endif
_020526BC: .word UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE
_020526C0: .word _020A31F4
_020526C4: .word _020A31FC
	arm_func_end GetSpeciesString

	arm_func_start GetNameString
GetNameString: ; 0x020526C8
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldmia sp!, {r3, pc}
	arm_func_end GetNameString
