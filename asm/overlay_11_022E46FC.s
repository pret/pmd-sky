	.include "asm/macros.inc"
	.include "overlay_11_022E46FC.inc"

	.text

	arm_func_start SsbLoad2
SsbLoad2: ; 0x022E46FC
#ifdef EUROPE
#define SSB_LOAD_2_STACK_OFFSET 8
#else
#define SSB_LOAD_2_STACK_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54 + SSB_LOAD_2_STACK_OFFSET
	mov r4, r1
	mov r5, r0
	ldr r1, _022E48A4 ; =ov11_02319694
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	bl FileRom_InitDataTransfer
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	bl FileRom_Veneer_FileInit
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, sp, #0
#ifdef EUROPE
	mov r2, #0x12
#else
	mov r2, #0xc
#endif
	bl FileRom_HandleRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E48A8 ; =ov11_02324F70
	add r1, sp, #0
	add r3, r3, r2
	ldrsb r2, [r0]
	ldr r0, [r5]
	cmp r0, #0
	add r0, r2, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r0, r3, r0
	mov r4, r0, lsl #1
	bne _022E4790
	mov r0, r4
	mov r1, #1
	str r4, [r5, #4]
	bl MemAlloc
	str r0, [r5]
_022E4790:
	ldrh r2, [sp, #4]
	ldr r1, [r5]
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E47D4
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r5]
	add r1, r1, r0
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E47D4:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E488C
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E48A8 ; =ov11_02324F70
	mov r3, #0
	add r1, r2, r1
#ifdef EUROPE
	add r2, r1, #9
#else
	add r2, r1, #6
#endif
	ldrsb ip, [r0]
	add r1, sp, #0
	b _022E4814
_022E4804:
	add r0, r1, r3, lsl #1
	ldrh r0, [r0, #8]
	add r3, r3, #1
	add r2, r2, r0
_022E4814:
	cmp r3, ip
	blt _022E4804
	mov r1, r2, lsl #1
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r2, #0
	bl FileRom_HandleSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r5]
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldr r0, _022E48A8 ; =ov11_02324F70
	add r1, sp, #0
	ldrsb r0, [r0]
	ldrh ip, [sp, #2]
	ldrh r2, [sp, #4]
	add r0, r0, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r1, ip, r2
	ldrh r3, [sp, #6]
	sub r2, r0, ip
	ldr r5, [r5]
	add r1, r3, r1
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r5, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E488C:
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x54 + SSB_LOAD_2_STACK_OFFSET
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E48A4: .word ov11_02319694
_022E48A8: .word ov11_02324F70
	arm_func_end SsbLoad2

	arm_func_start ScriptParamToInt
ScriptParamToInt: ; 0x022E48AC
	tst r0, #0x4000
	movne r1, #0x8000
	rsbne r1, r1, #0
	orrne r1, r0, r1
	ldreq r1, _022E48DC ; =0x00003FFF
	andeq r1, r0, r1
	tst r0, #0x8000
	movne r0, r1, asr #7
	addne r0, r1, r0, lsr #24
	movne r0, r0, asr #8
	moveq r0, r1
	bx lr
	.align 2, 0
_022E48DC: .word 0x00003FFF
	arm_func_end ScriptParamToInt

	arm_func_start ScriptParamToFixedPoint16
ScriptParamToFixedPoint16: ; 0x022E48E0
	tst r0, #0x4000
	movne r1, #0x8000
	rsbne r1, r1, #0
	orrne r1, r0, r1
	ldreq r1, _022E4908 ; =0x00003FFF
	andeq r1, r0, r1
	tst r0, #0x8000
	movne r0, r1
	moveq r0, r1, lsl #8
	bx lr
	.align 2, 0
_022E4908: .word 0x00003FFF
	arm_func_end ScriptParamToFixedPoint16

	arm_func_start ov11_022E490C
ov11_022E490C: ; 0x022E490C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrh r0, [r7]
	mov r4, r1
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r7, #2]
	bl ScriptParamToInt
	mov r6, r0
	tst r5, #4
	bne _022E4958
	ldrh r0, [r7, #4]
	bl ScriptParamToFixedPoint16
	mov r0, r0, lsl #3
	str r0, [r4]
	tst r5, #2
	ldrne r0, [r4]
	addne r0, r0, #0x400
	strne r0, [r4]
_022E4958:
	tst r6, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7, #6]
	bl ScriptParamToFixedPoint16
	mov r0, r0, lsl #3
	str r0, [r4, #4]
	tst r6, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #0x400
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022E490C

	arm_func_start ov11_022E4984
ov11_022E4984: ; 0x022E4984
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrh r0, [sl]
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [sl, #2]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [sl, #8]
	bl ScriptParamToFixedPoint16
	mov r4, r0
	ldrh r0, [sl, #0xa]
	bl ScriptParamToFixedPoint16
	mov fp, r0
	tst r5, #4
	bne _022E49F4
	ldrh r0, [sl, #4]
	bl ScriptParamToFixedPoint16
	mov r0, r0, lsl #3
	str r0, [sb]
	tst r5, #2
	ldrne r0, [sb]
	addne r0, r0, #0x400
	strne r0, [sb]
	b _022E49FC
_022E49F4:
	ldr r0, [r7]
	str r0, [sb]
_022E49FC:
	ldr r0, [sb]
	tst r6, #4
	add r0, r0, r4, lsl #3
	str r0, [r8]
	bne _022E4A34
	ldrh r0, [sl, #6]
	bl ScriptParamToFixedPoint16
	mov r0, r0, lsl #3
	str r0, [sb, #4]
	tst r6, #2
	ldrne r0, [sb, #4]
	addne r0, r0, #0x400
	strne r0, [sb, #4]
	b _022E4A3C
_022E4A34:
	ldr r0, [r7, #4]
	str r0, [sb, #4]
_022E4A3C:
	ldr r0, [sb, #4]
	add r0, r0, fp, lsl #3
	str r0, [r8, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022E4984

	arm_func_start ov11_022E4A4C
ov11_022E4A4C: ; 0x022E4A4C
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E4AF8 ; =ov11_02324F74
	ldr r2, _022E4AFC ; =ov11_02324C6C
	strb r0, [r1, #1]
	mov r0, #0x1000
	mov r1, #6
	str r0, [r2, #0x2c]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x28]
	mov r0, #0x1000
	str r0, [r2, #0x24]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x20]
	mov r0, #0x1000
	str r0, [r2, #4]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2]
	mov r0, #0x2000
	str r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #8]
	mov r0, #0x2000
	str r0, [r2, #0x14]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x10]
	mov r0, #0x8000
	str r0, [r2, #0x1c]
	bl MemAlloc
	ldr r1, _022E4AFC ; =ov11_02324C6C
	str r0, [r1, #0x18]
	bl ov11_022E4B88
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4AF8: .word ov11_02324F74
_022E4AFC: .word ov11_02324C6C
	arm_func_end ov11_022E4A4C

	arm_func_start ov11_022E4B00
ov11_022E4B00: ; 0x022E4B00
	stmdb sp!, {r3, lr}
	ldr r0, _022E4B84 ; =ov11_02324C6C
	ldr r0, [r0, #0x28]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x28]
	ldr r0, [r0, #0x20]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x20]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0]
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r0, [r0, #0x18]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4B84: .word ov11_02324C6C
	arm_func_end ov11_022E4B00

	arm_func_start ov11_022E4B88
ov11_022E4B88: ; 0x022E4B88
	stmdb sp!, {r3, lr}
	ldr r1, _022E4BC8 ; =ov11_02324F74
	mvn r2, #0
	strh r2, [r1, #6]
	strh r2, [r1, #0xa]
	strh r2, [r1, #8]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	mov r0, #0
	strb r0, [r1]
	ldr r0, _022E4BCC ; =ov11_02324F82
	strh r2, [r1, #0xc]
	bl ov11_022E45F4
	ldr r0, _022E4BD0 ; =ov11_02324F8A
	bl ov11_022E45F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4BC8: .word ov11_02324F74
_022E4BCC: .word ov11_02324F82
_022E4BD0: .word ov11_02324F8A
	arm_func_end ov11_022E4B88

	arm_func_start StationLoadHanger
StationLoadHanger: ; 0x022E4BD4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x8c
	mov r5, r0
	mov r4, r1
	cmp r5, #2
	bne _022E4C1C
	add r1, sp, #0
	mov r0, r2
	bl ov11_022E469C
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CB8 ; =ov11_023196B0
	add r0, sp, #9
	add r3, sp, #0
	bl sprintf
	ldr r4, _022E4CBC ; =ov11_02324C8C
	b _022E4C84
_022E4C1C:
	cmp r5, #3
	bne _022E4C54
	add r1, sp, #0
	mov r0, r2
	bl ov11_022E469C
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CC0 ; =ov11_023196C4
	add r0, sp, #9
	add r3, sp, #0
	bl sprintf
	ldr r4, _022E4CC4 ; =ov11_02324C6C
	b _022E4C84
_022E4C54:
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CC8 ; =ov11_023196D8
	add r0, sp, #9
	bl sprintf
	add r0, sp, #9
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E4CB0
	ldr r4, _022E4CCC ; =ov11_02324C94
_022E4C84:
	ldr r1, _022E4CD0 ; =ov11_023196EC
	add r3, sp, #9
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	ldmia r4, {r0, r1}
	bl MemZero
	add r1, sp, #9
	mov r0, r4
	bl sub_02008C18
	mov r0, #1
_022E4CB0:
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E4CB8: .word ov11_023196B0
_022E4CBC: .word ov11_02324C8C
_022E4CC0: .word ov11_023196C4
_022E4CC4: .word ov11_02324C6C
_022E4CC8: .word ov11_023196D8
_022E4CCC: .word ov11_02324C94
_022E4CD0: .word ov11_023196EC
	arm_func_end StationLoadHanger

	arm_func_start ov11_022E4CD4
ov11_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	mov sb, r1
	mov sl, r0
	mov r8, r2
	ldr r1, _022E4FC4 ; =ov11_02319714
	mov r2, sl
	mov r3, sb
	mov r0, #2
	bl Debug_Print
	cmp sl, #2
	ldreq r0, _022E4FC8 ; =ov11_02324C6C
	ldreq r4, [r0, #0x20]
	beq _022E4D20
	cmp sl, #3
	ldreq r0, _022E4FC8 ; =ov11_02324C6C
	ldreq r4, [r0]
	ldrne r0, _022E4FC8 ; =ov11_02324C6C
	ldrne r4, [r0, #0x28]
_022E4D20:
	ldrh r1, [r4, #2]
	mov r0, #0xa
	mvn fp, #0
	mla r0, sb, r0, r1
	add r5, r4, r0, lsl #1
	mov r0, r0, lsl #1
	ldrh r0, [r4, r0]
	ldrh r1, [r5, #2]
	mov r7, #0
	str r0, [sp, #8]
	add r0, fp, #0x10000
	add r6, r4, r1, lsl #1
	str r0, [sp, #0x10]
	b _022E4DC0
_022E4D58:
	ldrh r0, [r6]
	mov r2, sl
	mov r3, sb
	strh r0, [sp, #0x38]
	ldrh r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [sp, #0x3a]
	ldrh r0, [r6, #4]
	strb r0, [sp, #0x3b]
	ldrh r0, [r6, #6]
	strb r0, [sp, #0x3c]
	ldrh r0, [r6, #8]
	strb r0, [sp, #0x3d]
	ldrh r0, [r6, #0xa]
	strb r0, [sp, #0x3e]
	ldrh r1, [r6, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	streqh fp, [sp, #0x40]
	strneh r1, [sp, #0x40]
	mov r0, fp
	add r1, sp, #0x38
	str r8, [sp]
	bl ov11_022F7E78
	add r7, r7, #1
	add r6, r6, #0x10
_022E4DC0:
	ldr r0, [sp, #8]
	cmp r7, r0
	blt _022E4D58
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #6]
	mvn fp, #0
	str r0, [sp, #4]
	add r0, fp, #0x10000
	mov r7, #0
	add r6, r4, r1, lsl #1
	str r0, [sp, #0x14]
	b _022E4E68
_022E4DF0:
	ldrh r0, [r6]
	mov r2, sl
	mov r3, sb
	strh r0, [sp, #0x2c]
	ldrh r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [sp, #0x2e]
	ldrh r0, [r6, #4]
	strb r0, [sp, #0x2f]
	ldrh r0, [r6, #6]
	strb r0, [sp, #0x30]
	ldrh r0, [r6, #8]
	strb r0, [sp, #0x31]
	ldrh r0, [r6, #0xa]
	strb r0, [sp, #0x32]
	ldrh r0, [r6, #0xc]
	strb r0, [sp, #0x33]
	ldrh r0, [r6, #0xe]
	strb r0, [sp, #0x34]
	ldrh r1, [r6, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	streqh fp, [sp, #0x36]
	strneh r1, [sp, #0x36]
	mov r0, fp
	add r1, sp, #0x2c
	str r8, [sp]
	bl ov11_022FBEC4
	add r7, r7, #1
	add r6, r6, #0x14
_022E4E68:
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _022E4DF0
	ldrh r0, [r5, #0xa]
	ldrh fp, [r5, #8]
	mov r7, #0
	add r6, r4, r0, lsl #1
	mvn r0, #0
	str r0, [sp, #0xc]
	b _022E4EF4
_022E4E90:
	ldrh r2, [r6]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x22
	strh r2, [sp, #0x22]
	ldrh ip, [r6, #2]
	mov r2, sl
	mov r3, sb
	sub ip, ip, #1
	strb ip, [sp, #0x24]
	ldrh ip, [r6, #4]
	strb ip, [sp, #0x25]
	ldrh ip, [r6, #6]
	strb ip, [sp, #0x26]
	ldrh ip, [r6, #8]
	strb ip, [sp, #0x27]
	ldrh ip, [r6, #0xa]
	strb ip, [sp, #0x28]
	ldrh ip, [r6, #0xc]
	strb ip, [sp, #0x29]
	ldrh ip, [r6, #0xe]
	strb ip, [sp, #0x2a]
	str r8, [sp]
	bl ov11_022FD72C
	add r7, r7, #1
	add r6, r6, #0x14
_022E4EF4:
	cmp r7, fp
	blt _022E4E90
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022E4FB8
	ldrh r0, [r5, #0xe]
	ldrh r7, [r5, #0xc]
	mvn r5, #0
	mov r8, #0
	add r6, r4, r0, lsl #1
	add fp, r5, #0x8000
	b _022E4FB0
_022E4F34:
	ldrh r1, [r6, #0xc]
	tst r1, #0x8000
	andne r0, r1, fp
	strneh r0, [sp, #0x18]
	strneh r5, [sp, #0x20]
	bne _022E4F64
	mov r0, r1, lsl #1
	ldrsh r0, [r4, r0]
	add r1, r4, r1, lsl #1
	strh r0, [sp, #0x18]
	ldrsh r0, [r1, #6]
	strh r0, [sp, #0x20]
_022E4F64:
	ldrh r2, [r6]
	mov r0, r5
	add r1, sp, #0x18
	strb r2, [sp, #0x1a]
	ldrh ip, [r6, #2]
	mov r2, sl
	mov r3, sb
	strb ip, [sp, #0x1b]
	ldrh ip, [r6, #4]
	strb ip, [sp, #0x1c]
	ldrh ip, [r6, #6]
	strb ip, [sp, #0x1d]
	ldrh ip, [r6, #8]
	strb ip, [sp, #0x1e]
	ldrh ip, [r6, #0xa]
	strb ip, [sp, #0x1f]
	bl ov11_022FEA98
	add r8, r8, #1
	add r6, r6, #0x10
_022E4FB0:
	cmp r8, r7
	blt _022E4F34
_022E4FB8:
	mov r0, #1
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E4FC4: .word ov11_02319714
_022E4FC8: .word ov11_02324C6C
	arm_func_end ov11_022E4CD4

	arm_func_start ov11_022E4FCC
ov11_022E4FCC: ; 0x022E4FCC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x90
	mov r5, r1
	mov r4, r2
	cmp r0, #3
	bne _022E5014
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E512C ; =ov11_02319730
	add r0, sp, #0xd
	add r3, sp, #4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E5014:
	cmp r0, #5
	bne _022E5050
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5134 ; =ov11_02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str r4, [sp]
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E5050:
	cmp r0, #4
	bne _022E507C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =ov11_0231975C
	add r0, sp, #0xd
	mov r3, r4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E507C:
	cmp r0, #6
	bne _022E50A8
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	ldr r1, _022E513C ; =ov11_02319774
	add r0, sp, #0xd
	add r2, sp, #4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E50A8:
	cmp r0, #2
	bne _022E50E8
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	mov ip, #0
	ldr r1, _022E5134 ; =ov11_02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str ip, [sp]
	bl sprintf
	ldr r0, _022E5140 ; =ov11_02324C7C
	b _022E511C
_022E50E8:
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =ov11_0231975C
	add r0, sp, #0xd
	mov r3, #0
	bl sprintf
	add r0, sp, #0xd
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E5124
	ldr r0, _022E5144 ; =ov11_02324C74
_022E511C:
	add r1, sp, #0xd
	bl SsbLoad1
_022E5124:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E512C: .word ov11_02319730
_022E5130: .word ov11_02324C84
_022E5134: .word ov11_02319744
_022E5138: .word ov11_0231975C
_022E513C: .word ov11_02319774
_022E5140: .word ov11_02324C7C
_022E5144: .word ov11_02324C74
	arm_func_end ov11_022E4FCC

	arm_func_start ov11_022E5148
ov11_022E5148: ; 0x022E5148
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E5180 ; =ov11_0231978C
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022E5184 ; =ov11_02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov11_022DCB28
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5180: .word ov11_0231978C
_022E5184: .word ov11_02324F74
	arm_func_end ov11_022E5148

	arm_func_start ov11_022E5188
ov11_022E5188: ; 0x022E5188
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E51C8
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E524C ; =ov11_023197B4
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E51C8:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E5244
	ldr r0, _022E5250 ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E5210
	cmp r5, #0
	movlt r0, #0
	blt _022E5244
	ldr r0, _022E5254 ; =ov11_02324F82
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5244
_022E5210:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	mov r0, #1
_022E5244:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E524C: .word ov11_023197B4
_022E5250: .word ov11_02324F74
_022E5254: .word ov11_02324F82
	arm_func_end ov11_022E5188

	arm_func_start ov11_022E5258
ov11_022E5258: ; 0x022E5258
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5298
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5308 ; =ov11_023197D8
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E5298:
	ldr r0, _022E530C ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E52CC
	cmp r5, #0
	movlt r0, #0
	blt _022E5300
	ldr r0, _022E5310 ; =ov11_02324F82
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5300
_022E52CC:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	mov r0, #1
_022E5300:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E5308: .word ov11_023197D8
_022E530C: .word ov11_02324F74
_022E5310: .word ov11_02324F82
	arm_func_end ov11_022E5258

	arm_func_start ov11_022E5314
ov11_022E5314: ; 0x022E5314
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5354
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E53D8 ; =ov11_02319800
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E5354:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E53D0
	ldr r1, _022E53DC ; =ov11_02324F74
	mvn r0, #0
	ldrsh r2, [r1, #0xc]
	cmp r2, r0
	ldreqsh r0, [r1, #4]
	cmpeq r0, r5
	bne _022E53A8
	cmp r5, #0
	movlt r0, #0
	blt _022E53D0
	ldr r0, _022E53E0 ; =ov11_02324F8A
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E53D0
_022E53A8:
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	mov r0, #1
_022E53D0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E53D8: .word ov11_02319800
_022E53DC: .word ov11_02324F74
_022E53E0: .word ov11_02324F8A
	arm_func_end ov11_022E5314

	arm_func_start ScriptStationLoadTalk
ScriptStationLoadTalk: ; 0x022E53E4
	stmdb sp!, {r3, lr}
	ldr r1, _022E5444 ; =ov11_02319828
	mov r2, r0
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E5448 ; =ov11_02324F74
	mvn r0, #0
	ldrsh r2, [r1, #0xc]
	cmp r2, r0
	ldreqsh r1, [r1, #4]
	cmpeq r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5444: .word ov11_02319828
_022E5448: .word ov11_02324F74
	arm_func_end ScriptStationLoadTalk

	arm_func_start ov11_022E544C
ov11_022E544C: ; 0x022E544C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, _022E550C ; =ov11_0231984C
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E5510 ; =ov11_02324F74
	ldrsh r0, [r1, #6]
	cmp r0, r4
	moveq r0, #0
	beq _022E5504
	mvn r2, #0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #2]
	ldr r0, _022E5514 ; =ov11_02324F82
	strh r2, [r1, #4]
	bl ov11_022E45F4
	ldr r0, _022E5518 ; =ov11_02324F8A
	bl ov11_022E45F4
	cmp r4, #0
	ldrlt r0, _022E5510 ; =ov11_02324F74
	mvnlt r1, #0
	strlth r1, [r0, #6]
	blt _022E5500
	ldr r0, _022E5510 ; =ov11_02324F74
	strh r4, [r0, #6]
	bl ov11_022E5A68
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl StationLoadHanger
	cmp r0, #0
	ldrne r0, _022E5510 ; =ov11_02324F74
	mov r3, #0
	strneh r4, [r0, #8]
	mov r0, #1
	mov r1, r4
	sub r2, r0, #2
	str r3, [sp]
	bl ov11_022E4FCC
	cmp r0, #0
	ldrne r0, _022E5510 ; =ov11_02324F74
	strneh r4, [r0, #0xa]
_022E5500:
	mov r0, #1
_022E5504:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E550C: .word ov11_0231984C
_022E5510: .word ov11_02324F74
_022E5514: .word ov11_02324F82
_022E5518: .word ov11_02324F8A
	arm_func_end ov11_022E544C

	arm_func_start ov11_022E551C
ov11_022E551C: ; 0x022E551C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r0, #2
	mov r5, r1
	mov r4, r2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5564
	add r1, sp, #4
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022E56AC ; =ov11_0231986C
	add r3, sp, #4
	mov r2, r6
	mov r0, #2
	str r4, [sp]
	bl Debug_Print
_022E5564:
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r6
	beq _022E557C
	mov r0, r6
	bl ov11_022E544C
_022E557C:
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r6
	bne _022E55B0
	cmp r6, #0
	movlt r0, #0
	blt _022E56A4
	ldr r0, _022E56B4 ; =ov11_02324F82
	mov r1, r5
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E56A4
_022E55B0:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	cmp r6, #0
	bge _022E5610
	ldr r1, _022E56B0 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =ov11_02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r0, _022E56B0 ; =ov11_02324F74
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5610:
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl StationLoadHanger
	cmp r0, #0
	beq _022E5684
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldr r2, _022E56B4 ; =ov11_02324F82
	mov r3, r5
	strh r6, [r0, #2]
	mov r1, #8
_022E563C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022E563C
	mov r0, #2
	mov r1, r6
	mov r3, r5
	sub r2, r0, #3
	str r4, [sp]
	bl ov11_022E4FCC
	cmp r0, #0
	ldrne r0, _022E56B0 ; =ov11_02324F74
	movne r1, #1
	ldreq r0, _022E56B0 ; =ov11_02324F74
	moveq r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5684:
	ldr r1, _022E56B0 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =ov11_02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r1, _022E56B0 ; =ov11_02324F74
	mov r0, #0
	strb r0, [r1]
_022E56A4:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E56AC: .word ov11_0231986C
_022E56B0: .word ov11_02324F74
_022E56B4: .word ov11_02324F82
	arm_func_end ov11_022E551C

	arm_func_start ov11_022E56B8
ov11_022E56B8: ; 0x022E56B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r5, r0
	mov r0, #2
	mov r4, r1
	mov r6, r2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5700
	add r1, sp, #0xd
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5838 ; =ov11_02319888
	add r3, sp, #0xd
	mov r2, r5
	mov r0, #2
	str r6, [sp]
	bl Debug_Print
_022E5700:
	ldr r0, _022E583C ; =ov11_02324F74
	mvn r1, #0
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #6]
	cmp r0, r5
	beq _022E5720
	mov r0, r5
	bl ov11_022E544C
_022E5720:
	ldr r0, _022E583C ; =ov11_02324F74
	ldrsh r0, [r0, #4]
	cmp r0, r5
	bne _022E5754
	cmp r5, #0
	movlt r0, #0
	blt _022E5830
	ldr r0, _022E5840 ; =ov11_02324F8A
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5830
_022E5754:
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r5, #0
	bge _022E579C
	ldr r1, _022E583C ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #1
	b _022E5830
_022E579C:
	mov r1, r5
	mov r2, r4
	mov r0, #3
	bl StationLoadHanger
	cmp r0, #0
	beq _022E5818
	ldr r0, _022E583C ; =ov11_02324F74
	ldr r2, _022E5840 ; =ov11_02324F8A
	mov r3, r4
	strh r5, [r0, #4]
	mov r1, #8
_022E57C8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022E57C8
	add r1, sp, #4
	mov r0, r4
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5844 ; =ov11_02319730
	add r0, sp, #0x16
	add r3, sp, #4
	bl sprintf
	ldr r0, _022E5848 ; =ov11_02324C84
	add r1, sp, #0x16
	bl SsbLoad1
	cmp r0, #0
	movne r0, #1
	bne _022E5830
_022E5818:
	ldr r1, _022E583C ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #0
_022E5830:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5838: .word ov11_02319888
_022E583C: .word ov11_02324F74
_022E5840: .word ov11_02324F8A
_022E5844: .word ov11_02319730
_022E5848: .word ov11_02324C84
	arm_func_end ov11_022E56B8

	arm_func_start ov11_022E584C
ov11_022E584C: ; 0x022E584C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5884
	add r1, sp, #4
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5900 ; =ov11_023198AC
	add r2, sp, #4
	mov r0, #2
	bl Debug_Print
_022E5884:
	ldr r1, _022E5904 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5908 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r2, #0
	ldr r0, _022E5904 ; =ov11_02324F74
	str r2, [sp]
	ldrsh r1, [r0, #8]
	mov r3, r4
	mov r0, #6
	bl ov11_022E4FCC
	mov r4, r0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r4, #0
	ldrne r0, _022E5904 ; =ov11_02324F74
	movne r1, #6
	ldreq r0, _022E5904 ; =ov11_02324F74
	mvneq r1, #0
	strh r1, [r0, #0xc]
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5900: .word ov11_023198AC
_022E5904: .word ov11_02324F74
_022E5908: .word ov11_02324F8A
	arm_func_end ov11_022E584C

	arm_func_start ov11_022E590C
ov11_022E590C: ; 0x022E590C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	ldr r1, _022E59D8 ; =ov11_023198D0
	mov r2, r4
	mov r3, r5
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E59DC ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E59E0 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	cmp r4, #2
	bne _022E5970
	ldr r0, _022E59DC ; =ov11_02324F74
	mov r1, #0
	str r1, [sp]
	ldrsh r1, [r0, #2]
	mov r4, #5
	ldr r3, _022E59E4 ; =ov11_02324F82
	mov r0, r4
	mov r2, r5
	bl ov11_022E4FCC
	b _022E5990
_022E5970:
	mov r3, #0
	ldr r0, _022E59DC ; =ov11_02324F74
	str r3, [sp]
	ldrsh r1, [r0, #8]
	mov r4, #4
	mov r0, r4
	mov r2, r5
	bl ov11_022E4FCC
_022E5990:
	mov r5, r0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r5, #0
	ldrne r0, _022E59DC ; =ov11_02324F74
	mvneq r1, #0
	strneh r4, [r0, #0xc]
	ldreq r0, _022E59DC ; =ov11_02324F74
	streqh r1, [r0, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E59D8: .word ov11_023198D0
_022E59DC: .word ov11_02324F74
_022E59E0: .word ov11_02324F8A
_022E59E4: .word ov11_02324F82
	arm_func_end ov11_022E590C

	arm_func_start ov11_022E59E8
ov11_022E59E8: ; 0x022E59E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl ov11_022FEBFC
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl ov11_022E4CD4
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E59E8

	arm_func_start ov11_022E5A10
ov11_022E5A10: ; 0x022E5A10
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #2
	bl ov11_022FEBFC
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl ov11_022E4CD4
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5A10

	arm_func_start ov11_022E5A38
ov11_022E5A38: ; 0x022E5A38
	ldr ip, _022E5A4C ; =ov11_022E4CD4
	mov r1, r0
	mov r0, #3
	mov r2, #0
	bx ip
	.align 2, 0
_022E5A4C: .word ov11_022E4CD4
	arm_func_end ov11_022E5A38

	arm_func_start ov11_022E5A50
ov11_022E5A50: ; 0x022E5A50
	ldr ip, _022E5A64 ; =ov11_022E4CD4
	mov r1, r0
	mov r0, #3
	mov r2, #1
	bx ip
	.align 2, 0
_022E5A64: .word ov11_022E4CD4
	arm_func_end ov11_022E5A50

	arm_func_start ov11_022E5A68
ov11_022E5A68: ; 0x022E5A68
	stmdb sp!, {r3, lr}
	ldr r1, _022E5A94 ; =ov11_023198F0
	mov r0, #2
	bl Debug_Print
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5A94: .word ov11_023198F0
	arm_func_end ov11_022E5A68

	arm_func_start ov11_022E5A98
ov11_022E5A98: ; 0x022E5A98
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl ov11_022F8408
	mov r1, r4
	mov r0, #1
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #1
	bl ov11_022FDA7C
	mov r1, r4
	mov r0, #1
	bl ov11_022FEBFC
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5A98

	arm_func_start ov11_022E5AD4
ov11_022E5AD4: ; 0x022E5AD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #2
	bl ov11_022F8408
	mov r1, r4
	mov r0, #2
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #2
	bl ov11_022FDA7C
	mov r1, r4
	mov r0, #2
	bl ov11_022FEBFC
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5AD4

	arm_func_start ov11_022E5B10
ov11_022E5B10: ; 0x022E5B10
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #3
	bl ov11_022F8408
	mov r1, r4
	mov r0, #3
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #3
	bl ov11_022FDA7C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5B10

	arm_func_start ov11_022E5B40
ov11_022E5B40: ; 0x022E5B40
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5B40

	arm_func_start ov11_022E5B7C
ov11_022E5B7C: ; 0x022E5B7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5B7C

	arm_func_start ov11_022E5BB8
ov11_022E5BB8: ; 0x022E5BB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5BB8

	arm_func_start ov11_022E5BF4
ov11_022E5BF4: ; 0x022E5BF4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	mov r1, #0
	str r1, [sp]
	ldr r2, _022E5C80 ; =ov11_02324F74
	mov r1, #1
	ldrsh r3, [r2, #0xc]
	mov r4, r0
	add r0, sp, #4
	sub r2, r1, #2
	bl ov11_022E5EFC
	cmp r0, #0
	moveq r0, #0
	beq _022E5C78
	add r0, sp, #4
	strh r4, [sp, #0x1c]
	bl ov11_022F7594
	ldr r1, _022E5C80 ; =ov11_02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5C80 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5C80 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5C78:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5C80: .word ov11_02324F74
	arm_func_end ov11_022E5BF4

	arm_func_start ov11_022E5C84
ov11_022E5C84: ; 0x022E5C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	mov r1, #0
	str r1, [sp]
	ldr r0, _022E5D10 ; =ov11_02324F74
	mov r1, #1
	ldrsh r3, [r0, #0xc]
	add r0, sp, #4
	sub r2, r1, #2
	bl ov11_022E5EFC
	cmp r0, #0
	moveq r0, #0
	beq _022E5D08
	mov r1, #1
	add r0, sp, #4
	strh r1, [sp, #0x1c]
	bl ov11_022F7594
	ldr r1, _022E5D10 ; =ov11_02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5D10 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5D10 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5D08:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5D10: .word ov11_02324F74
	arm_func_end ov11_022E5C84

	arm_func_start ov11_022E5D14
ov11_022E5D14: ; 0x022E5D14
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #3
	bl ov11_022F8E70
	mov r1, r4
	mov r0, #3
	bl ov11_022FCA9C
	mov r1, r4
	mov r0, #3
	bl ov11_022FE1AC
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5D14

	arm_func_start SsbLoad1
SsbLoad1: ; 0x022E5D50
#ifdef EUROPE
#define SSB_LOAD_1_STACK_OFFSET 8
#else
#define SSB_LOAD_1_STACK_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54 + SSB_LOAD_1_STACK_OFFSET
	mov r5, r1
	mov r4, r0
	ldr r1, _022E5EF4 ; =ov11_02319908
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	bl FileRom_InitDataTransfer
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	bl FileRom_Veneer_FileInit
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r1, r5
	bl FileRom_HandleOpen
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, sp, #0
#ifdef EUROPE
	mov r2, #0x12
#else
	mov r2, #0xc
#endif
	bl FileRom_HandleRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E5EF8 ; =ov11_02324F74
	add r1, sp, #0
	add r3, r3, r2
	ldrsb r2, [r0, #1]
	ldr r0, [r4]
	cmp r0, #0
	add r0, r2, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r0, r3, r0
	mov r0, r0, lsl #1
	bne _022E5DE0
	mov r1, #1
	str r0, [r4, #4]
	bl MemAlloc
	str r0, [r4]
_022E5DE0:
	ldrh r2, [sp, #4]
	ldr r1, [r4]
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E5E24
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r4]
	add r1, r1, r0
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E5E24:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E5EDC
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E5EF8 ; =ov11_02324F74
	mov r3, #0
	add r1, r2, r1
#ifdef EUROPE
	add r2, r1, #9
#else
	add r2, r1, #6
#endif
	ldrsb ip, [r0, #1]
	add r1, sp, #0
	b _022E5E64
_022E5E54:
	add r0, r1, r3, lsl #1
	ldrh r0, [r0, #8]
	add r3, r3, #1
	add r2, r2, r0
_022E5E64:
	cmp r3, ip
	blt _022E5E54
	mov r1, r2, lsl #1
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r2, #0
	bl FileRom_HandleSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r4]
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldr r0, _022E5EF8 ; =ov11_02324F74
	add r1, sp, #0
	ldrsb r0, [r0, #1]
	ldrh ip, [sp, #2]
	ldrh r2, [sp, #4]
	add r0, r0, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r1, ip, r2
	ldrh r3, [sp, #6]
	sub r2, r0, ip
	ldr r4, [r4]
	add r1, r3, r1
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r4, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E5EDC:
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #1
	add sp, sp, #0x54 + SSB_LOAD_1_STACK_OFFSET
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E5EF4: .word ov11_02319908
_022E5EF8: .word ov11_02324F74
	arm_func_end SsbLoad1

	arm_func_start ov11_022E5EFC
ov11_022E5EFC: ; 0x022E5EFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r7, r3
	mov sl, r0
	cmp r7, #3
	ldreq r0, _022E608C ; =ov11_02324C6C
	mov sb, r1
	mov r8, r2
	mov r6, #0
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #5
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #4
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #6
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #2
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x10]
	beq _022E5F90
	ldr r2, _022E6090 ; =ov11_02324F74
	sub r1, r6, #1
	ldrsh r2, [r2, #0xa]
	cmp r2, r1
	bne _022E5F88
	bl ov11_022DC89C
	mov r0, r6
	b _022E6084
_022E5F88:
	ldr r0, _022E608C ; =ov11_02324C6C
	ldr r4, [r0, #8]
_022E5F90:
	ldrh r0, [r4, #2]
	cmp sb, #3
	add r5, r4, #4
	str r0, [sp]
	bne _022E5FF4
	mov fp, #0
	b _022E5FE4
_022E5FAC:
	ldrh r0, [r5, #2]
	cmp r0, sb
	bne _022E5FDC
	ldrh r1, [r5, #4]
	add r0, sp, #4
	strh r1, [sp, #4]
	bl sub_02065050
	ldrsh r0, [sp, #4]
	cmp r0, r8
	ldreqh r0, [r5]
	addeq r6, r4, r0, lsl #1
	beq _022E603C
_022E5FDC:
	add r5, r5, #6
	add fp, fp, #1
_022E5FE4:
	ldr r0, [sp]
	cmp fp, r0
	blt _022E5FAC
	b _022E603C
_022E5FF4:
	mov r1, #0
	b _022E6030
_022E5FFC:
	ldrh r0, [r5, #2]
	cmp r0, sb
	bne _022E6028
	cmp r8, #0
	blt _022E601C
	ldrh r0, [r5, #4]
	cmp r0, r8
	bne _022E6028
_022E601C:
	ldrh r0, [r5]
	add r6, r4, r0, lsl #1
	b _022E603C
_022E6028:
	add r5, r5, #6
	add r1, r1, #1
_022E6030:
	ldr r0, [sp]
	cmp r1, r0
	blt _022E5FFC
_022E603C:
	cmp r6, #0
	beq _022E6078
	stmia sl, {r4, r6}
	ldrh r0, [r4]
	ldrsb r1, [sp, #0x30]
	add r0, r4, r0, lsl #1
	str r0, [sl, #8]
	cmp r1, #0
	strh r7, [sl, #0x14]
	movlt r1, #0
	strb r1, [sl, #0x16]
	mvn r0, #0
	strh r0, [sl, #0x18]
	mov r0, #1
	b _022E6084
_022E6078:
	mov r0, sl
	bl ov11_022DC89C
	mov r0, #0
_022E6084:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E608C: .word ov11_02324C6C
_022E6090: .word ov11_02324F74
	arm_func_end ov11_022E5EFC

	arm_func_start ov11_022E6094
ov11_022E6094: ; 0x022E6094
	ldr r0, _022E60A4 ; =ov11_02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60A4: .word ov11_02324C9C
	arm_func_end ov11_022E6094

	arm_func_start ov11_022E60A8
ov11_022E60A8: ; 0x022E60A8
	ldr r0, _022E60B8 ; =ov11_02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60B8: .word ov11_02324C9C
	arm_func_end ov11_022E60A8

	arm_func_start ov11_022E60BC
ov11_022E60BC: ; 0x022E60BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x144
	mov r5, r0
	mov r4, r1
	ldr r1, _022E68C4 ; =ov11_02319924
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E68C8 ; =ov11_02324C9C
	mov r0, #1
	strb r0, [r1]
	cmp r5, #0x4c
	addls pc, pc, r5, lsl #2
	b _022E68AC
_022E60F4: ; jump table
	b _022E68AC ; case 0
	b _022E624C ; case 1
	b _022E6260 ; case 2
	b _022E6274 ; case 3
	b _022E6294 ; case 4
	b _022E68AC ; case 5
	b _022E68AC ; case 6
	b _022E68AC ; case 7
	b _022E68AC ; case 8
	b _022E68AC ; case 9
	b _022E68AC ; case 10
	b _022E6704 ; case 11
	b _022E62D4 ; case 12
	b _022E62FC ; case 13
	b _022E68AC ; case 14
	b _022E62E0 ; case 15
	b _022E6304 ; case 16
	b _022E68AC ; case 17
	b _022E62E8 ; case 18
	b _022E62F4 ; case 19
	b _022E6310 ; case 20
	b _022E6398 ; case 21
	b _022E68AC ; case 22
	b _022E63A0 ; case 23
	b _022E68AC ; case 24
	b _022E63A8 ; case 25
	b _022E68AC ; case 26
	b _022E63D0 ; case 27
	b _022E68AC ; case 28
	b _022E63B0 ; case 29
	b _022E63B8 ; case 30
	b _022E63C0 ; case 31
	b _022E63C8 ; case 32
	b _022E68AC ; case 33
	b _022E68AC ; case 34
	b _022E6440 ; case 35
	b _022E6510 ; case 36
	b _022E68AC ; case 37
	b _022E68AC ; case 38
	b _022E6518 ; case 39
	b _022E6524 ; case 40
	b _022E652C ; case 41
	b _022E6474 ; case 42
	b _022E6678 ; case 43
	b _022E68AC ; case 44
	b _022E68AC ; case 45
	b _022E68AC ; case 46
	b _022E68AC ; case 47
	b _022E6228 ; case 48
	b _022E6238 ; case 49
	b _022E68AC ; case 50
	b _022E68AC ; case 51
	b _022E6878 ; case 52
	b _022E6890 ; case 53
	b _022E6718 ; case 54
	b _022E6720 ; case 55
	b _022E6728 ; case 56
	b _022E63D8 ; case 57
	b _022E63EC ; case 58
	b _022E6400 ; case 59
	b _022E642C ; case 60
	b _022E6844 ; case 61
	b _022E686C ; case 62
	b _022E631C ; case 63
	b _022E6338 ; case 64
	b _022E6354 ; case 65
	b _022E6730 ; case 66
	b _022E638C ; case 67
	b _022E6384 ; case 68
	b _022E6378 ; case 69
	b _022E636C ; case 70
	b _022E6758 ; case 71
	b _022E68AC ; case 72
	b _022E67B8 ; case 73
	b _022E67D4 ; case 74
	b _022E67DC ; case 75
	b _022E67E4 ; case 76
_022E6228:
	mov r0, #0x11
	bl LoadOverlay
	bl ov28_0238A140
	b _022E68AC
_022E6238:
	mov r0, #0x11
	bl UnloadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E624C:
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6260:
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6274:
	add r0, sp, #0xc0
	mov r1, #0xa
	bl sub_02065BD8
	add r1, sp, #0xc0
	mov r0, #2
	mov r2, r1
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6294:
	bl ov11_02310BDC
#ifdef JAPAN
	mov r1, #0x400
#endif
	mov r4, #0
	ldr r3, _022E68CC ; =0x0000C402
	add r0, sp, #0x60
#ifdef JAPAN
	add r2, r1, #0xc5
#else
	mov r1, #0x400
	mov r2, #0x234
#endif
	str r4, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0xa0
	add r1, sp, #0x60
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	add r1, sp, #0xa0
	mov r0, #1
	mov r2, r1
	bl SetupAndShowKeyboard
	b _022E68AC
_022E62D4:
	mov r0, #0
	bl LoadKangaskhanOverlay
	b _022E68AC
_022E62E0:
	bl LoadDuskullBankOverlay
	b _022E68AC
_022E62E8:
	mov r0, #0
	bl LoadKecleonShopOverlay
	b _022E68AC
_022E62F4:
	bl LoadKecleonShopOverlay
	b _022E68AC
_022E62FC:
	bl LoadKangaskhanOverlay
	b _022E68AC
_022E6304:
	mov r0, #0
	bl LoadChimechoAssemblyOverlay
	b _022E68AC
_022E6310:
	mov r0, #0
	bl LoadElectivireLinkShopOverlay
	b _022E68AC
_022E631C:
	add r1, sp, #0x5a
	mov r0, #0
	bl sub_02065CD8
	add r0, sp, #0x5a
	mov r1, #0
	bl ov11_02302CE0
	b _022E68AC
_022E6338:
	add r1, sp, #0x54
	mov r0, #0
	bl sub_02065CD8
	add r0, sp, #0x54
	mov r1, #1
	bl ov11_02303208
	b _022E68AC
_022E6354:
	add r0, sp, #0x100
	bl ov11_022E8090
	add r0, sp, #0x100
	mov r1, #1
	bl ov11_023025E8
	b _022E68AC
_022E636C:
	mov r0, #3
	bl ov11_023039AC
	b _022E68AC
_022E6378:
	mov r0, #2
	bl ov11_023039AC
	b _022E68AC
_022E6384:
	bl ov11_023039AC
	b _022E68AC
_022E638C:
	mov r0, #0
	bl ov11_023039AC
	b _022E68AC
_022E6398:
	bl LoadLuminousSpringOverlay
	b _022E68AC
_022E63A0:
	bl LoadCroagunkSwapShopOverlay
	b _022E68AC
_022E63A8:
	bl LoadXatuAppraisalOverlay
	b _022E68AC
_022E63B0:
	bl LoadSpindaCafeOverlayInit
	b _022E68AC
_022E63B8:
	bl LoadSpindaCafeOverlayResume
	b _022E68AC
_022E63C0:
	bl LoadRecycleShopOverlayInit
	b _022E68AC
_022E63C8:
	bl LoadRecycleShopOverlayResume
	b _022E68AC
_022E63D0:
	bl LoadChanseyDaycareOverlay
	b _022E68AC
_022E63D8:
	mov r0, #0x12
	bl LoadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E63EC:
	mov r0, #0x12
	bl UnloadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6400:
	mov r0, #0
	mov r1, #0x5c
	bl LoadScriptVariableValue
	cmp r0, #1
	bne _022E6420
	mov r0, #1
	bl ov11_0230CB88
	b _022E68AC
_022E6420:
	mov r0, #0
	bl ov11_0230CB88
	b _022E68AC
_022E642C:
	mov r0, #0x12
	bl LoadOverlay
	mov r0, #2
	bl ov11_0230CB88
	b _022E68AC
_022E6440:
	mov r0, #2
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	ble _022E645C
	bl ov11_023043A8
	b _022E68AC
_022E645C:
	ldr r0, _022E68D0 ; =ov11_02324F94
	mov r1, #2
	str r1, [r0]
	str r1, [r4]
	mov r0, #0
	b _022E68BC
_022E6474:
	add r0, sp, #0x12
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E6504
	add r1, sp, #0x50
	add r2, sp, #0x4c
	mov r0, #2
	bl LoadScriptVarValuePair
	ldr r0, [sp, #0x4c]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r0
	ldrb r2, [sp, #0x12]
	add r0, sp, #0x44
	bl WasMissionCompletedToday
	cmp r0, #0
	beq _022E6504
	ldrsh r0, [sp, #0x48]
	cmp r0, #0
	ldrsh r0, [sp, #0x46]
	movne r1, #2
	moveq r1, #0
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	ldr r0, _022E68D0 ; =ov11_02324F94
	adds r1, r2, r1
	str r1, [r0]
	moveq r1, #3
	streq r1, [r0]
	ldr r1, _022E68D0 ; =ov11_02324F94
	mov r0, #0
	ldr r1, [r1]
	str r1, [r4]
	b _022E68BC
_022E6504:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6510:
	bl ov11_02304514
	b _022E68AC
_022E6518:
	mov r0, #0
	bl ov11_02304664
	b _022E68AC
_022E6524:
	bl ov11_02304664
	b _022E68AC
_022E652C:
	add r0, sp, #0x11
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E6644
	add r1, sp, #0x40
	add r2, sp, #0x3c
	mov r0, #2
	bl LoadScriptVarValuePair
	ldrb r1, [sp, #0x11]
	ldr r2, [sp, #0x3c]
	ldr r0, _022E68D4 ; =ov11_0231993C
	bl Debug_Print0
	mov r8, #0
	ldr r0, [sp, #0x3c]
	add sb, sp, #0x34
	mov r7, #0x68
	mov r6, r8
	mov r5, #0x69
	ldr fp, _022E68D8 ; =ov11_02319960
	b _022E663C
_022E657C:
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sl, r0
	ldrb r2, [sp, #0x11]
	mov r0, sb
	mov r1, sl
	bl WasMissionCompletedToday
	mov r0, r8
	mov r1, r7
	ldrb r2, [sl, #1]
	bl SaveScriptVariableValue
	mov r0, r6
	mov r1, r5
	ldrb r2, [sl, #2]
	bl SaveScriptVariableValue
	ldrb r1, [sl]
	mov r0, fp
	str r1, [sp]
	ldrb r1, [sp, #0x34]
	str r1, [sp, #4]
	ldrsh r1, [sp, #0x36]
	str r1, [sp, #8]
	ldrsh r1, [sp, #0x38]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	ldrb r2, [sl, #4]
	ldrb r3, [sl, #1]
	bl Debug_Print0
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _022E6630
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x3c]
	mov r0, #2
	bl SetScenarioProgressScriptVar
	ldrsh r0, [sp, #0x36]
	ldrsh r1, [sp, #0x38]
	bl SetRandomRequestNpcs1And2
	ldrb r2, [sl, #1]
	ldr r1, _022E68D0 ; =ov11_02324F94
	mov r0, #0
	str r2, [r1]
	str r2, [r4]
	b _022E68BC
_022E6630:
	ldr r0, [sp, #0x3c]
	add r0, r0, #1
	str r0, [sp, #0x3c]
_022E663C:
	cmp r0, #8
	blt _022E657C
_022E6644:
	ldr r0, _022E68D0 ; =ov11_02324F94
	mvn r1, #0
	str r1, [r0]
	ldr r0, _022E68DC ; =ov11_023199B4
	str r1, [r4]
	bl Debug_Print0
	bl sub_0205F504
	mov r1, #0
	mov r2, r1
	mov r0, #2
	bl SetScenarioProgressScriptVar
	mov r0, #0
	b _022E68BC
_022E6678:
	add r0, sp, #0x10
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E66F8
	add r1, sp, #0x30
	add r2, sp, #0x2c
	mov r0, #2
	bl LoadScriptVarValuePair
	ldr r0, [sp, #0x2c]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r0
	ldrb r2, [sp, #0x10]
	add r0, sp, #0x24
	bl WasMissionCompletedToday
	ldrsh r1, [sp, #0x28]
	ldr r0, _022E68E0 ; =ov11_023199D4
	str r1, [sp]
	ldrb r2, [sp, #0x24]
	ldrsh r3, [sp, #0x26]
	ldr r1, [sp, #0x2c]
	bl Debug_Print0
	ldrb r0, [sp, #0x24]
	cmp r0, #0
	beq _022E66F8
	bl LoadRecycleShopOverlay
	ldr r0, _022E68C8 ; =ov11_02324C9C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E68BC
_022E66F8:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6704:
	mov r0, #0
	strb r0, [r1]
	bl ov11_022E6EE8
	mov r0, #1
	b _022E68BC
_022E6718:
	bl LoadRuleDungeonEffectsOverlay
	b _022E68AC
_022E6720:
	bl ov11_0230CDF4
	b _022E68AC
_022E6728:
	bl ov11_0230CE08
	b _022E68AC
_022E6730:
	mov r0, #0
	bl sub_0204F244
	cmp r0, #0
	beq _022E6748
	bl ov11_0230CE1C
	b _022E68AC
_022E6748:
	mvn r0, #0
	str r0, [r4]
	mov r0, #0
	b _022E68BC
_022E6758:
	mov r0, #0x20
	bl LoadOverlay
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022E67AC
_022E6770: ; jump table
	b _022E6784 ; case 0
	b _022E678C ; case 1
	b _022E6794 ; case 2
	b _022E679C ; case 3
	b _022E67A4 ; case 4
_022E6784:
	mov r0, #1
	b _022E67B0
_022E678C:
	mov r0, #2
	b _022E67B0
_022E6794:
	mov r0, #3
	b _022E67B0
_022E679C:
	mov r0, #4
	b _022E67B0
_022E67A4:
	mov r0, #5
	b _022E67B0
_022E67AC:
	mov r0, #0
_022E67B0:
	bl ov28_0238A468
	b _022E68AC
_022E67B8:
	mov r0, #0x20
	bl UnloadOverlay
	ldr r1, _022E68D0 ; =ov11_02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r4]
	b _022E68BC
_022E67D4:
	bl LoadSpecialEpisodeDiscardOverlay1
	b _022E68AC
_022E67DC:
	bl LoadSpecialEpisodeDiscardOverlay2
	b _022E68AC
_022E67E4:
	bl GetRank
	mov r5, r0
	mov r0, #0
	mov r1, #0x6e
	bl LoadScriptVariableValue
	and r1, r0, #0xff
	mov r0, #0
	str r0, [r4]
	cmp r5, r1
	bls _022E683C
	cmp r5, #9
	blo _022E682C
	cmp r1, #9
	movlo r5, #9
	addhs r0, r1, #1
	andhs r5, r0, #0xff
	sub r0, r5, #8
	str r0, [r4]
_022E682C:
	mov r2, r5
	mov r0, #0
	mov r1, #0x6e
	bl SaveScriptVariableValue
_022E683C:
	mov r0, #0
	b _022E68BC
_022E6844:
	add r0, sp, #0x20
	bl sub_02049338
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _022E6860
	mov r0, #1
	bl ScriptSpecialProcess0x16
_022E6860:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E686C:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6878:
	add r0, sp, #0x16
	bl sub_0206C0FC
	ldrsh r1, [sp, #0x16]
	mov r0, #0xa
	bl ov11_022FF1D4
	b _022E68AC
_022E6890:
	add r0, sp, #0x14
	bl sub_0206C120
	add r0, sp, #0x18
	bl sub_0206C144
	ldrsh r0, [sp, #0x14]
	add r1, sp, #0x18
	bl ov11_022FF490
_022E68AC:
	ldr r0, _022E68C8 ; =ov11_02324C9C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
_022E68BC:
	add sp, sp, #0x144
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E68C4: .word ov11_02319924
_022E68C8: .word ov11_02324C9C
_022E68CC: .word 0x0000C402
_022E68D0: .word ov11_02324F94
_022E68D4: .word ov11_0231993C
_022E68D8: .word ov11_02319960
_022E68DC: .word ov11_023199B4
_022E68E0: .word ov11_023199D4
	arm_func_end ov11_022E60BC

	arm_func_start ov11_022E68E4
ov11_022E68E4: ; 0x022E68E4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x20
	mov r6, r1
	cmp r0, #0x4b
	addls pc, pc, r0, lsl #2
	b _022E6E54
_022E68FC: ; jump table
	b _022E6E54 ; case 0
	b _022E6A2C ; case 1
	b _022E6A2C ; case 2
	b _022E6A2C ; case 3
	b _022E6A2C ; case 4
	b _022E6E54 ; case 5
	b _022E6E54 ; case 6
	b _022E6E54 ; case 7
	b _022E6E54 ; case 8
	b _022E6E54 ; case 9
	b _022E6E54 ; case 10
	b _022E6A2C ; case 11
	b _022E6A2C ; case 12
	b _022E6A2C ; case 13
	b _022E6E54 ; case 14
	b _022E6A2C ; case 15
	b _022E6A2C ; case 16
	b _022E6A2C ; case 17
	b _022E6A2C ; case 18
	b _022E6A2C ; case 19
	b _022E6A2C ; case 20
	b _022E6A2C ; case 21
	b _022E6A2C ; case 22
	b _022E6A2C ; case 23
	b _022E6A2C ; case 24
	b _022E6A2C ; case 25
	b _022E6A2C ; case 26
	b _022E6A2C ; case 27
	b _022E6E54 ; case 28
	b _022E6A2C ; case 29
	b _022E6A2C ; case 30
	b _022E6A2C ; case 31
	b _022E6A2C ; case 32
	b _022E6A2C ; case 33
	b _022E6A2C ; case 34
	b _022E6AE0 ; case 35
	b _022E6A2C ; case 36
	b _022E6E54 ; case 37
	b _022E6E54 ; case 38
	b _022E6A9C ; case 39
	b _022E6A9C ; case 40
	b _022E6E54 ; case 41
	b _022E6E54 ; case 42
	b _022E6D0C ; case 43
	b _022E6E54 ; case 44
	b _022E6E54 ; case 45
	b _022E6E54 ; case 46
	b _022E6E54 ; case 47
	b _022E6A2C ; case 48
	b _022E6E54 ; case 49
	b _022E6A2C ; case 50
	b _022E6E54 ; case 51
	b _022E6DB0 ; case 52
	b _022E6DF8 ; case 53
	b _022E6A2C ; case 54
	b _022E6A2C ; case 55
	b _022E6E54 ; case 56
	b _022E6E54 ; case 57
	b _022E6E54 ; case 58
	b _022E6A2C ; case 59
	b _022E6A50 ; case 60
	b _022E6A7C ; case 61
	b _022E6A8C ; case 62
	b _022E6A2C ; case 63
	b _022E6A2C ; case 64
	b _022E6A2C ; case 65
	b _022E6A2C ; case 66
	b _022E6A2C ; case 67
	b _022E6A2C ; case 68
	b _022E6A2C ; case 69
	b _022E6A2C ; case 70
	b _022E6A2C ; case 71
	b _022E6A2C ; case 72
	b _022E6A2C ; case 73
	b _022E6A2C ; case 74
	b _022E6A2C ; case 75
_022E6A2C:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r1, _022E6E64 ; =ov11_02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r6]
	b _022E6E58
_022E6A50:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	mov r0, #0x12
	bl UnloadOverlay
	ldr r1, _022E6E64 ; =ov11_02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r6]
	b _022E6E58
_022E6A7C:
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	b _022E6E58
_022E6A8C:
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	b _022E6E58
_022E6A9C:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r1, [r0]
	str r1, [r6]
	ldr r0, [r0]
	cmp r0, #0
	beq _022E6AD8
	add r0, sp, #4
	bl sub_0206C0FC
	ldrsh r0, [sp, #4]
	mov r1, #0
	bl ov11_022F7188
_022E6AD8:
	mov r0, #1
	b _022E6E58
_022E6AE0:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r0, [r0]
	cmp r0, #0
	blt _022E6CFC
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B77C
	ldr r1, _022E6E64 ; =ov11_02324F94
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	mov r1, r0, lsl #0x18
	add r0, sp, #0x18
	mov r1, r1, asr #0x18
	bl sub_0205BB7C
	ldrb r0, [sp, #0x18]
	ldrb r1, [sp, #0x19]
	mov r2, #0
	bl sub_0204F488
	mov r4, r0
	tst r4, #4
	movne r0, #3
	strne r0, [r6]
	bne _022E6D04
	tst r4, #0x10
	movne r0, #5
	strne r0, [r6]
	bne _022E6D04
	tst r4, #8
	movne r0, #4
	strne r0, [r6]
	bne _022E6D04
	ldrsb r0, [r5, #0xac]
	cmp r0, #0
	movle r0, #6
	strle r0, [r6]
	ble _022E6D04
	tst r4, #0x4000
	beq _022E6CC0
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204E974
	ldrb r1, [sp, #0x18]
	cmp r1, #0x63
	bgt _022E6BEC
	bge _022E6C48
	cmp r1, #0x29
	bgt _022E6BDC
	cmp r1, #0x26
	blt _022E6D04
	beq _022E6C3C
	cmp r1, #0x29
	moveq r0, #0x15
	streq r0, [r6]
	b _022E6D04
_022E6BDC:
	cmp r1, #0x3f
	moveq r0, #0x16
	streq r0, [r6]
	b _022E6D04
_022E6BEC:
	cmp r1, #0x6e
	bgt _022E6C2C
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _022E6D04
_022E6C00: ; jump table
	b _022E6C54 ; case 0
	b _022E6C60 ; case 1
	b _022E6C6C ; case 2
	b _022E6C78 ; case 3
	b _022E6C84 ; case 4
	b _022E6D04 ; case 5
	b _022E6D04 ; case 6
	b _022E6C90 ; case 7
	b _022E6C9C ; case 8
	b _022E6CA8 ; case 9
	b _022E6CB4 ; case 10
_022E6C2C:
	cmp r1, #0xae
	moveq r0, #0x21
	streq r0, [r6]
	b _022E6D04
_022E6C3C:
	mov r0, #0x14
	str r0, [r6]
	b _022E6D04
_022E6C48:
	mov r0, #0x17
	str r0, [r6]
	b _022E6D04
_022E6C54:
	mov r0, #0x18
	str r0, [r6]
	b _022E6D04
_022E6C60:
	mov r0, #0x19
	str r0, [r6]
	b _022E6D04
_022E6C6C:
	mov r0, #0x1a
	str r0, [r6]
	b _022E6D04
_022E6C78:
	mov r0, #0x1b
	str r0, [r6]
	b _022E6D04
_022E6C84:
	mov r0, #0x1c
	str r0, [r6]
	b _022E6D04
_022E6C90:
	mov r0, #0x1d
	str r0, [r6]
	b _022E6D04
_022E6C9C:
	mov r0, #0x1e
	str r0, [r6]
	b _022E6D04
_022E6CA8:
	mov r0, #0x1f
	str r0, [r6]
	b _022E6D04
_022E6CB4:
	mov r0, #0x20
	str r0, [r6]
	b _022E6D04
_022E6CC0:
	tst r4, #1
	movne r0, #0x12
	strne r0, [r6]
	bne _022E6D04
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204E974
	cmp r4, #0
	moveq r0, #0
	streq r0, [r6]
	movne r0, #0x13
	strne r0, [r6]
	b _022E6D04
_022E6CFC:
	mov r0, #1
	str r0, [r6]
_022E6D04:
	mov r0, #1
	b _022E6E58
_022E6D0C:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r0, [r0]
	cmp r0, #0
	mov r0, #0
	blt _022E6D6C
	mov r1, #0x33
	bl LoadScriptVariableValue
	cmp r0, #0x64
	bge _022E6D50
	add r2, r0, #1
	mov r0, #0
	mov r1, #0x33
	bl SaveScriptVariableValue
_022E6D50:
	mov r0, #0
	mov r1, #0x5c
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #1
	str r0, [r6]
	b _022E6D70
_022E6D6C:
	str r0, [r6]
_022E6D70:
	add r1, sp, #0x14
	add r2, sp, #0x10
	mov r0, #2
	bl LoadScriptVarValuePair
	ldr r0, [sp, #0x10]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	bl sub_0205F2B8
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, r0, #1
	mov r0, #2
	bl SetScenarioProgressScriptVar
	mov r0, #1
	b _022E6E58
_022E6DB0:
	add r0, sp, #2
	bl ov11_022FF460
	cmp r0, #0
	beq _022E6E54
	ldrsh r0, [sp, #2]
	mvn r1, #0
	str r0, [r6]
	cmp r0, r1
	beq _022E6DE8
	bl sub_0206C110
	bl sub_02048614
	ldrsh r0, [sp, #2]
	mov r1, #0
	bl ov11_022F7188
_022E6DE8:
	ldr r1, _022E6E60 ; =ov11_02324C9C
	mov r0, #1
	strb r0, [r1]
	b _022E6E58
_022E6DF8:
	add r0, sp, #0
	add r1, sp, #6
	bl ov11_022FFA5C
	cmp r0, #0
	beq _022E6E54
	ldrsh r0, [sp]
	mvn r1, #0
	str r0, [r6]
	cmp r0, r1
	beq _022E6E44
	bl sub_0206C134
	add r0, sp, #6
	bl sub_0206C164
	bl sub_02048614
	mov r2, #0
	ldrsh r0, [sp]
	add r1, sp, #6
	mov r3, r2
	bl ov11_022F7354
_022E6E44:
	ldr r1, _022E6E60 ; =ov11_02324C9C
	mov r0, #1
	strb r0, [r1]
	b _022E6E58
_022E6E54:
	mov r0, #0
_022E6E58:
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E6E60: .word ov11_02324C9C
_022E6E64: .word ov11_02324F94
	arm_func_end ov11_022E68E4

	arm_func_start ReturnScriptMenuResultZero
ReturnScriptMenuResultZero: ; 0x022E6E68
	ldr r1, _022E6E84 ; =ov11_02324C9C
	mov r3, #1
	ldr r0, _022E6E88 ; =ov11_02324F94
	mov r2, #0
	strb r3, [r1]
	str r2, [r0]
	bx lr
	.align 2, 0
_022E6E84: .word ov11_02324C9C
_022E6E88: .word ov11_02324F94
	arm_func_end ReturnScriptMenuResultZero

	arm_func_start ReturnScriptMenuResult
ReturnScriptMenuResult: ; 0x022E6E8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E6EBC ; =ov11_02319A20
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022E6EC0 ; =ov11_02324F94
	ldr r1, _022E6EC4 ; =ov11_02324C9C
	mov r2, #1
	strb r2, [r1]
	str r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6EBC: .word ov11_02319A20
_022E6EC0: .word ov11_02324F94
_022E6EC4: .word ov11_02324C9C
	arm_func_end ReturnScriptMenuResult

	arm_func_start IsScriptMenuReturnDisabled
IsScriptMenuReturnDisabled: ; 0x022E6EC8
	ldr r0, _022E6EE4 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E6EE4: .word ov11_02324C9C
	arm_func_end IsScriptMenuReturnDisabled

	arm_func_start ov11_022E6EE8
ov11_022E6EE8: ; 0x022E6EE8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x98
	mov r5, r0
	bl GetGameMode
	cmp r5, #0
	ldreq r5, _022E6FB4 ; =ov11_022E6FB8
	mov r4, r0
	mov r0, #0
	mov r1, #0x2c
	mov r2, #5
	str r5, [sp, #0x84]
	str r0, [sp, #0x88]
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x2b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x1e
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1d
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	cmp r4, #4
	bne _022E6F80
	bl sub_020573A0
	mov r0, #0
	bl sub_0205730C
	mov r0, #1
	bl sub_0205730C
_022E6F80:
	cmp r4, #1
	beq _022E6FAC
	cmp r4, #5
	add r2, sp, #0
	mov r1, #0x100
	bne _022E6FA4
	mov r0, #5
	bl sub_0204964C
	b _022E6FAC
_022E6FA4:
	mov r0, #6
	bl sub_0204964C
_022E6FAC:
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6FB4: .word ov11_022E6FB8
	arm_func_end ov11_022E6EE8

	arm_func_start ov11_022E6FB8
ov11_022E6FB8: ; 0x022E6FB8
	ldr r0, _022E6FD0 ; =ov11_02324F94
	ldr r2, _022E6FD4 ; =ov11_02324C9C
	mov r3, #1
	strb r3, [r2]
	str r1, [r0]
	bx lr
	.align 2, 0
_022E6FD0: .word ov11_02324F94
_022E6FD4: .word ov11_02324C9C
	arm_func_end ov11_022E6FB8

	arm_func_start ov11_022E6FD8
ov11_022E6FD8: ; 0x022E6FD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x144
	mov r4, r0
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _022E70F0
_022E6FF0: ; jump table
	b _022E7008 ; case 0
	b _022E7014 ; case 1
	b _022E7020 ; case 2
	b _022E7054 ; case 3
	b _022E7088 ; case 4
	b _022E70BC ; case 5
_022E7008:
#ifdef JAPAN
	ldr r1, _022E872C ; =0x000004F2
#else
	mov r1, #0x258
#endif
	bl GetStringFromFileVeneer
	b _022E70F8
_022E7014:
	ldr r1, _022E7100 ; =0x00000259
	bl GetStringFromFileVeneer
	b _022E70F8
_022E7020:
	add r0, sp, #0xf4
	bl InitPreprocessorArgs
	mov r0, #0xa9
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x118]
	add ip, sp, #0xf4
	ldr r2, _022E7104 ; =0x0000025A
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	b _022E70F8
_022E7054:
	add r0, sp, #0xa4
	bl InitPreprocessorArgs
	mov r0, #0xaa
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0xc8]
	add ip, sp, #0xa4
	ldr r2, _022E7108 ; =0x0000025B
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	b _022E70F8
_022E7088:
	add r0, sp, #0x54
	bl InitPreprocessorArgs
	mov r0, #0xab
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x78]
	add ip, sp, #0x54
#ifdef JAPAN
	ldr r2, _022E873C ; =0x000004F6
	mov r0, r4
	mov r1, #0x40
#else
	mov r0, r4
	mov r1, #0x40
	mov r2, #0x25c
#endif
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	b _022E70F8
_022E70BC:
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, #0xac
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x28]
	add ip, sp, #4
	ldr r2, _022E710C ; =0x0000025D
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	b _022E70F8
_022E70F0:
	mov r0, #0
	strb r0, [r4]
_022E70F8:
	add sp, sp, #0x144
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_022E872C: .word 0x000004F2
_022E7100: .word 0x000004F3
_022E7104: .word 0x000004F4
_022E7108: .word 0x000004F5
_022E873C: .word 0x000004F6
_022E710C: .word 0x000004F7
#else
_022E7100: .word 0x00000259
_022E7104: .word 0x0000025A
_022E7108: .word 0x0000025B
_022E710C: .word 0x0000025D
#endif
	arm_func_end ov11_022E6FD8

	arm_func_start ov11_022E7110
ov11_022E7110: ; 0x022E7110
	bx lr
	arm_func_end ov11_022E7110

	arm_func_start ov11_022E7114
ov11_022E7114: ; 0x022E7114
	bx lr
	arm_func_end ov11_022E7114

	arm_func_start ScriptSpecialProcessCall
ScriptSpecialProcessCall: ; 0x022E7118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b8
	mov r5, r1
	mov r4, r0
	mov r7, r2
	ldr r1, _022E7AC8 ; =ov11_02319A48
	mov r2, r5
	mov r0, #2
	mov r6, r3
	bl Debug_Print
	cmp r5, #0x3e
	addls pc, pc, r5, lsl #2
	b _022E7ABC
_022E714C: ; jump table
	b _022E7ABC ; case 0
	b _022E7248 ; case 1
	b _022E7254 ; case 2
	b _022E7260 ; case 3
	b _022E726C ; case 4
	b _022E7278 ; case 5
	b _022E7284 ; case 6
	b _022E72AC ; case 7
	b _022E72D8 ; case 8
	b _022E7314 ; case 9
	b _022E7364 ; case 10
	b _022E737C ; case 11
	b _022E73BC ; case 12
	b _022E73D8 ; case 13
	b _022E73E0 ; case 14
	b _022E73F8 ; case 15
	b _022E7400 ; case 16
	b _022E7408 ; case 17
	b _022E7410 ; case 18
	b _022E7548 ; case 19
	b _022E7534 ; case 20
	b _022E7548 ; case 21
	b _022E7518 ; case 22
	b _022E75D0 ; case 23
	b _022E75DC ; case 24
	b _022E75DC ; case 25
	b _022E75EC ; case 26
	b _022E75FC ; case 27
	b _022E760C ; case 28
	b _022E7630 ; case 29
	b _022E7660 ; case 30
	b _022E7680 ; case 31
	b _022E76C8 ; case 32
	b _022E76D8 ; case 33
	b _022E76F4 ; case 34
	b _022E7708 ; case 35
	b _022E7724 ; case 36
	b _022E7744 ; case 37
	b _022E776C ; case 38
	b _022E778C ; case 39
	b _022E77B4 ; case 40
	b _022E77FC ; case 41
	b _022E7850 ; case 42
	b _022E7870 ; case 43
	b _022E7898 ; case 44
	b _022E78AC ; case 45
	b _022E78C8 ; case 46
	b _022E78E4 ; case 47
	b _022E7938 ; case 48
	b _022E798C ; case 49
	b _022E79D0 ; case 50
	b _022E79E8 ; case 51
	b _022E79F4 ; case 52
	b _022E7A00 ; case 53
	b _022E7A08 ; case 54
	b _022E7A14 ; case 55
	b _022E7A48 ; case 56
	b _022E7A5C ; case 57
	b _022E7A70 ; case 58
	b _022E7A7C ; case 59
	b _022E7A88 ; case 60
	b _022E7A94 ; case 61
	b _022E7AA8 ; case 62
_022E7248:
	bl GroundMainReturnDungeon
	mov r0, #0
	b _022E7AC0
_022E7254:
	bl InitMainTeamAfterQuiz
	mov r0, #0
	b _022E7AC0
_022E7260:
	bl InitSpecialEpisodePartners
	mov r0, #0
	b _022E7AC0
_022E726C:
	bl InitSpecialEpisodeExtraPartner
	mov r0, #0
	b _022E7AC0
_022E7278:
	bl GroundMainNextDay
	mov r0, #0
	b _022E7AC0
_022E7284:
	bl sub_0204E70C
	cmp r0, #1
	bne _022E72A4
	bl sub_0204E770
	bl DungeonRequestsDoneWrapper
	cmp r0, #0
	movgt r0, #1
	bgt _022E7AC0
_022E72A4:
	mov r0, #0
	b _022E7AC0
_022E72AC:
	add r0, sp, #7
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E72D0
	ldrb r0, [sp, #7]
	bl DungeonRequestsDoneWrapper
	cmp r0, #0
	movgt r0, #1
	bgt _022E7AC0
_022E72D0:
	mov r0, #0
	b _022E7AC0
_022E72D8:
	add r0, sp, #6
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E730C
	ldrb r2, [sp, #6]
	mov r3, #4
	add r1, sp, #5
	mov r0, #6
	strb r3, [sp, #5]
	bl sub_0205F464
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E730C:
	mov r0, #0
	b _022E7AC0
_022E7314:
	add r0, sp, #4
	bl MissionRewardValidateDungeonId
	cmp r0, #0
	beq _022E735C
	ldrb r2, [sp, #4]
	mov r3, #4
	add r1, sp, #3
	mov r0, #6
	strb r3, [sp, #3]
	bl sub_0205F464
	movs r1, r0
	beq _022E735C
	ldrb r2, [sp, #4]
	add r0, sp, #0x60
	bl WasMissionCompletedToday
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E735C:
	mov r0, #0
	b _022E7AC0
_022E7364:
	mov r0, #2
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movle r0, #0
	b _022E7AC0
_022E737C:
	add r0, sp, #2
	bl sub_0204F1B4
	cmp r0, #0
	beq _022E73B4
	ldrsb r0, [sp, #2]
	bl sub_0205B77C
	ldrsb r4, [r0, #0xac]
	ldrsb r1, [sp, #2]
	ldr r0, _022E7ACC ; =ov11_02319A68
	mov r2, r4
	bl Debug_Print0
	cmp r4, #0
	movgt r0, r4
	bgt _022E7AC0
_022E73B4:
	mov r0, #0
	b _022E7AC0
_022E73BC:
	mov r0, r7, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl InitRandomNpcJobs
	mov r0, #0
	b _022E7AC0
_022E73D8:
	bl GetRandomNpcJobType
	b _022E7AC0
_022E73E0:
	bl GetRandomNpcJobSubtype
	and r1, r0, #0xff
	strb r0, [sp]
	mov r0, r1
	strb r1, [sp, #1]
	b _022E7AC0
_022E73F8:
	bl GetRandomNpcJobStillAvailable
	b _022E7AC0
_022E7400:
	bl AcceptRandomNpcJob
	b _022E7AC0
_022E7408:
	mov r0, #0
	b _022E7AC0
_022E7410:
	add r1, sp, #0xc
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0xa
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xa]
	tst r0, #0xc
	movne r0, #0
	bne _022E7AC0
	ldrh r0, [sp, #0xc]
	bl ov11_022EAF70
	mvn r1, #0
	cmp r0, r1
	beq _022E7510
	add r1, sp, #0x58
	mov r2, #0x100
	bl sub_02005494
	ldrh r0, [sp, #0xc]
	mov sb, #0
	add fp, sp, #0x48
	tst r0, #2
	ldr r0, _022E7AD0 ; =ov11_02319A38
	movne sl, #4
	ldr r8, [r0]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	ldr r7, [r0, #0xc]
	moveq sl, #2
	str r8, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x10]
	str r7, [sp, #0x14]
	add r5, sp, #0x50
	add r6, sp, #0x58
	b _022E7508
_022E74A0:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, r6
	blx r2
	cmp r0, #0
	beq _022E7504
	ldr r0, [sp, #0x5c]
	str r8, [sp, #0x50]
	str r0, [sp, #0x54]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, r5
	blx r2
	cmp r0, #0
	beq _022E7504
	ldr r0, [sp, #0x58]
	str r7, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, fp
	blx r2
_022E7504:
	add sb, sb, #1
_022E7508:
	cmp sb, sl
	blt _022E74A0
_022E7510:
	mvn r0, #0
	b _022E7AC0
_022E7518:
	cmp r7, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bl ScriptSpecialProcess0x16
	mov r0, #0
	b _022E7AC0
_022E7534:
	bl KeyWaitInit
	ldr r1, _022E7AD4 ; =ov11_02324CA0
	mov r0, #0
	str r7, [r1]
	b _022E7AC0
_022E7548:
	add r1, sp, #8
	mov r0, #0
	bl GetPressedButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	add r0, sp, #0x68
	beq _022E756C
	bl GetReleasedStylus
	b _022E7570
_022E756C:
	bl sub_02006BFC
_022E7570:
	ldrh r1, [sp, #8]
	ldr r0, _022E7AD8 ; =0x00000F0F
	tst r1, r0
	bne _022E7598
	add r0, sp, #0x68
	mov r1, #2
	mov r2, #0
	bl sub_02006C8C
	cmp r0, #0
	beq _022E75A0
_022E7598:
	mov r0, #2
	b _022E7AC0
_022E75A0:
	ldr r0, _022E7AD4 ; =ov11_02324CA0
	ldr r1, [r0]
	cmp r1, #0
	ble _022E75C0
	subs r1, r1, #1
	str r1, [r0]
	moveq r0, #1
	beq _022E7AC0
_022E75C0:
	cmp r5, #0x13
	mvneq r0, #0
	movne r0, #0
	b _022E7AC0
_022E75D0:
	bl RandomizeDemoActors
	mov r0, #0
	b _022E7AC0
_022E75DC:
	mov r0, r7
	bl JumpToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E75EC:
	mvn r0, #0
	bl JumpToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E75FC:
	mov r0, r7
	bl ReturnToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E760C:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpecialRecruitmentSpecies
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7630:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpecialRecruitmentSpecies
	mov r1, #0
	bl GetRecruitMentryIdBySpecies
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	beq _022E7AC0
	bl GetTeamMember
	ldrb r0, [r0, #1]
	b _022E7AC0
_022E7660:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpecialRecruitmentSpecies
	bl sub_02056EB8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7680:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl PrepareMenuAcceptTeamMember
	add r0, sp, #0x174
	bl ov11_022E8090
	add r0, sp, #0x100
	ldrsh r0, [r0, #0x78]
	bl SetNewFriendActor
	add r0, sp, #0x100
	add r0, r0, #0xae
	mov r1, #0xa
	bl sub_02065C08
	add r0, sp, #0x174
	bl sub_02055CCC
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	b _022E7AC0
_022E76C8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl CountItemTypeInBag
	b _022E7AC0
_022E76D8:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x44
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	ldrsh r0, [sp, #0x44]
	bl CountItemTypeInBag
	b _022E7AC0
_022E76F4:
	add r0, sp, #0x40
	strh r7, [sp, #0x40]
	strh r6, [sp, #0x42]
	bl CountItemTypeInStorage
	b _022E7AC0
_022E7708:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x3c
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x3c
	bl CountItemTypeInStorage
	b _022E7AC0
_022E7724:
	add r0, sp, #0x38
	strh r7, [sp, #0x38]
	strh r6, [sp, #0x3a]
	bl SpecialProcAddItemToBag
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7744:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x34
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x34
	bl SpecialProcAddItemToBag
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E776C:
	add r0, sp, #0x30
	strh r7, [sp, #0x30]
	strh r6, [sp, #0x32]
	bl AddBulkItemToStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E778C:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x2c
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x2c
	bl AddBulkItemToStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E77B4:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _022E77F4
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E77E4
	bl sub_020582E0
_022E77E4:
	mov r0, r4
	bl RemoveItemNoHole
	mov r0, #1
	b _022E7AC0
_022E77F4:
	mov r0, #0
	b _022E7AC0
_022E77FC:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x28
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	ldrsh r0, [sp, #0x28]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _022E7848
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E7838
	bl sub_020582E0
_022E7838:
	mov r0, r4
	bl RemoveItemNoHole
	mov r0, #1
	b _022E7AC0
_022E7848:
	mov r0, #0
	b _022E7AC0
_022E7850:
	add r0, sp, #0x24
	strh r7, [sp, #0x24]
	strh r6, [sp, #0x26]
	bl RemoveBulkItemInStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7870:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x20
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x20
	bl RemoveBulkItemInStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7898:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl PrepareMenuAcceptTeamMember
	mov r0, #0
	b _022E7AC0
_022E78AC:
	bl GetHero
	cmp r0, #0
	moveq r0, #0
	beq _022E7AC0
	ldrsh r0, [r0, #4]
	bl ov11_022E8050
	b _022E7AC0
_022E78C8:
	bl GetPartner
	cmp r0, #0
	moveq r0, #0
	beq _022E7AC0
	ldrsh r0, [r0, #4]
	bl ov11_022E8050
	b _022E7AC0
_022E78E4:
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7930
	bl sub_020564B0
	cmp r0, #0
	beq _022E7930
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7930
	bl sub_02056410
	cmp r0, #0
	beq _022E7930
	mov r0, #0
	bl GetUnitNpcIds
	cmp r0, #0
	moveq r0, #1
	beq _022E7AC0
_022E7930:
	mov r0, #0
	b _022E7AC0
_022E7938:
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7984
	bl sub_020564B0
	cmp r0, #0
	beq _022E7984
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7984
	bl sub_02056410
	cmp r0, #0
	beq _022E7984
	mov r0, #0
	bl GetUnitNpcIds
	cmp r0, #0
	moveq r0, #1
	beq _022E7AC0
_022E7984:
	mov r0, #0
	b _022E7AC0
_022E798C:
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E79C8
	bl sub_02056410
	cmp r0, #0
	beq _022E79C8
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E79C8
	bl sub_02056410
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E79C8:
	mov r0, #0
	b _022E7AC0
_022E79D0:
	mov r0, #0
	bl GetPartyMembers
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	b _022E7AC0
_022E79E8:
	bl SetTeamSetupHeroAndPartnerOnly
	mov r0, #0
	b _022E7AC0
_022E79F4:
	bl SetTeamSetupHeroOnly
	mov r0, #0
	b _022E7AC0
_022E7A00:
	mov r0, #0
	b _022E7AC0
_022E7A08:
	bl StatusUpdate
	mov r0, #0
	b _022E7AC0
_022E7A14:
	add r0, sp, #0x8c
	bl sub_0204F244
	cmp r0, #0
	beq _022E7A40
	add r0, sp, #0x8c
	cmp r7, #0
	strgeb r7, [sp, #0xe8]
	cmp r6, #0
	mov r1, #1
	strgeb r6, [sp, #0xe9]
	bl sub_0204F1F0
_022E7A40:
	mov r0, #0
	b _022E7AC0
_022E7A48:
	bl IsBagFull
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7A5C:
	bl IsStorageFull
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7A70:
	bl IncrementNbDungeonsCleared
	mov r0, #0
	b _022E7AC0
_022E7A7C:
	bl IncrementNbBigTreasureWins
	mov r0, #0
	b _022E7AC0
_022E7A88:
	bl IncrementNbSkyGiftsSent
	mov r0, #0
	b _022E7AC0
_022E7A94:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetActorTalkMain
	mov r0, #0
	b _022E7AC0
_022E7AA8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetActorTalkSub
	mov r0, #0
	b _022E7AC0
_022E7ABC:
	mov r0, #0
_022E7AC0:
	add sp, sp, #0x1b8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E7AC8: .word ov11_02319A48
_022E7ACC: .word ov11_02319A68
_022E7AD0: .word ov11_02319A38
_022E7AD4: .word ov11_02324CA0
_022E7AD8: .word 0x00000F0F
	arm_func_end ScriptSpecialProcessCall

	arm_func_start ov11_022E7ADC
ov11_022E7ADC: ; 0x022E7ADC
	bx lr
	arm_func_end ov11_022E7ADC

	arm_func_start ov11_022E7AE0
ov11_022E7AE0: ; 0x022E7AE0
	bx lr
	arm_func_end ov11_022E7AE0

	arm_func_start ov11_022E7AE4
ov11_022E7AE4: ; 0x022E7AE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r2
	mov r5, r3
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_022E7B00: ; jump table
	ldmia sp!, {r4, r5, r6, pc} ; case 0
	b _022E7B18 ; case 1
	b _022E7B38 ; case 2
	b _022E7B58 ; case 3
	b _022E7B64 ; case 4
	ldmia sp!, {r4, r5, r6, pc} ; case 5
_022E7B18:
	mov r1, #0
	mov r0, #0xd
	strh r1, [r4, #0x46]
	bl ov11_02314670
	mov r0, r6
	mov r1, r5
	bl ov11_023159CC
	ldmia sp!, {r4, r5, r6, pc}
_022E7B38:
	mov r0, #0xd
	bl ov11_02314670
	mov r0, r6
	mov r1, r5
	bl ov11_023159CC
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
_022E7B58:
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
_022E7B64:
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022E7AE4

	arm_func_start ov11_022E7B70
ov11_022E7B70: ; 0x022E7B70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #5
	addls pc, pc, r3, lsl #2
	b _022E7E74
_022E7B90: ; jump table
	b _022E7E74 ; case 0
	b _022E7BA8 ; case 1
	b _022E7C20 ; case 2
	b _022E7C98 ; case 3
	b _022E7D10 ; case 4
	b _022E7D88 ; case 5
_022E7BA8:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7BC0
	mov r2, #2
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7BC0:
	ldrsh r0, [r8, #0x46]
	add r0, r0, #1
	strh r0, [r8, #0x46]
	bl ov11_0231474C
	mov r0, #2
	bl ov11_0231598C
	ldr r2, [r0, #4]
	mov r1, #1
	mov r2, r2, lsr #0xc
	mov r2, r2, lsl #8
	str r2, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	ldrsb r0, [r7]
	bl sub_020051A0
	strb r0, [r7]
	ldrsh r0, [r8, #0x46]
	cmp r0, #0x200
	movlt r0, #1
	blt _022E7E78
	bl ov11_023146F8
	b _022E7E74
_022E7C20:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7C38
	mov r2, #0
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7C38:
	ldrsh r0, [r8, #0x46]
	add r0, r0, #1
	strh r0, [r8, #0x46]
	bl ov11_0231474C
	mov r0, #0
	bl ov11_0231598C
	ldr r2, [r0, #4]
	mov r1, #1
	mov r2, r2, lsr #0xc
	mov r2, r2, lsl #8
	str r2, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	ldrsb r0, [r7]
	bl sub_020051A0
	strb r0, [r7]
	ldrsh r0, [r8, #0x46]
	cmp r0, #0x140
	movlt r0, #1
	blt _022E7E78
	bl ov11_023146F8
	b _022E7E74
_022E7C98:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7CB0
	mov r2, #1
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7CB0:
	ldrsh r1, [r8, #0x46]
	mov r0, #1
	add r1, r1, #1
	strh r1, [r8, #0x46]
	bl ov11_0231598C
	cmp r0, #0
	beq _022E7CF0
	ldr r1, [r0, #4]
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	b _022E7CF8
_022E7CF0:
	mov r0, #0
	b _022E7E78
_022E7CF8:
	ldrsb r0, [r7]
	mov r1, #1
	bl sub_020051A0
	strb r0, [r7]
	mov r0, #1
	b _022E7E78
_022E7D10:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7D28
	mov r2, #2
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7D28:
	ldrsh r1, [r8, #0x46]
	mov r0, #2
	add r1, r1, #1
	strh r1, [r8, #0x46]
	bl ov11_0231598C
	cmp r0, #0
	beq _022E7D68
	ldr r1, [r0, #4]
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	b _022E7D70
_022E7D68:
	mov r0, #0
	b _022E7E78
_022E7D70:
	ldrsb r0, [r7]
	mov r1, #1
	bl sub_020051A0
	strb r0, [r7]
	mov r0, #1
	b _022E7E78
_022E7D88:
	ldrsh r0, [r8, #8]
	cmp r0, #3
	bne _022E7E74
	mov r0, #0x2e
	bl GetLiveActorIdxFromScriptEntityId
	mov r4, r0
	mov r0, #0x2f
	bl GetLiveActorIdxFromScriptEntityId
	ldrsh r1, [r8, #0xa]
	mvn r5, #0
	cmp r1, r0
	bne _022E7DDC
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #0x18]
	add r1, sp, #0x18
	blx r2
	ldr r0, [sp, #0x18]
	tst r0, #8
	movne r5, r4
	b _022E7DE4
_022E7DDC:
	cmp r1, r4
	moveq r5, r0
_022E7DE4:
	cmp r5, #0
	blt _022E7E74
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #0xc]
	mov r1, r6
	blx r2
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #8]
	add r1, sp, #8
	blx r2
	add r1, sp, #0x10
	mov r0, r5
	bl ov11_022F90F4
	mov r0, r5
	add r1, sp, #0
	bl ov11_022F90B4
	mov r0, r6
	add r1, sp, #8
	add r2, sp, #0x10
	add r3, sp, #0
	bl sub_020058A8
	mvn r1, #0
	cmp r0, r1
	bne _022E7E60
	ldr r1, _022E7E80 ; =ov11_02319A90
	add r2, sp, #0x10
	mov r0, r6
	mov r3, r1
	bl sub_020057A8
_022E7E60:
	mvn r1, #0
	cmp r0, r1
	ldrnesb r1, [r7]
	cmpne r0, r1
	strneb r0, [r7]
_022E7E74:
	mov r0, #0
_022E7E78:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E7E80: .word ov11_02319A90
	arm_func_end ov11_022E7B70

	arm_func_start ov11_022E7E84
ov11_022E7E84: ; 0x022E7E84
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E7F24 ; =ov11_02319A98
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	add r0, r4, #1
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_022E7EAC: ; jump table
	b _022E7ED4 ; case 0
	b _022E7EDC ; case 1
	b _022E7EE4 ; case 2
	b _022E7EEC ; case 3
	b _022E7EF4 ; case 4
	b _022E7EFC ; case 5
	b _022E7F04 ; case 6
	b _022E7F0C ; case 7
	b _022E7F14 ; case 8
	b _022E7F1C ; case 9
_022E7ED4:
	bl ov11_0230D000
	ldmia sp!, {r4, pc}
_022E7EDC:
	bl ov11_0230CFF4
	ldmia sp!, {r4, pc}
_022E7EE4:
	bl ov11_0230D92C
	ldmia sp!, {r4, pc}
_022E7EEC:
	bl ov11_02313908
	ldmia sp!, {r4, pc}
_022E7EF4:
	bl ov11_0230E964
	ldmia sp!, {r4, pc}
_022E7EFC:
	bl ov11_02310C40
	ldmia sp!, {r4, pc}
_022E7F04:
	bl ov11_0231136C
	ldmia sp!, {r4, pc}
_022E7F0C:
	bl ov11_0231186C
	ldmia sp!, {r4, pc}
_022E7F14:
	bl ov11_02311D6C
	ldmia sp!, {r4, pc}
_022E7F1C:
	bl ov11_02312250
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E7F24: .word ov11_02319A98
	arm_func_end ov11_022E7E84

	arm_func_start ov11_022E7F28
ov11_022E7F28: ; 0x022E7F28
	ldr ip, _022E7F30 ; =ov11_0230D318
	bx ip
	.align 2, 0
_022E7F30: .word ov11_0230D318
	arm_func_end ov11_022E7F28

	arm_func_start ov11_022E7F34
ov11_022E7F34: ; 0x022E7F34
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _022E7F74 ; =ov11_02319AB4
	add r0, sp, #0
	bl ov11_022E46E8
	ldr r1, [sp, #4]
	ldr r0, _022E7F78 ; =ov11_02319AD0
	bl Debug_Print0
	ldr r2, [sp]
	ldr r0, _022E7F7C ; =UNIONALL_RAM_ADDRESS
	str r2, [r0]
	ldrh r1, [r2]
	add r1, r2, r1, lsl #1
	str r1, [r0, #4]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F74: .word ov11_02319AB4
_022E7F78: .word ov11_02319AD0
_022E7F7C: .word UNIONALL_RAM_ADDRESS
	arm_func_end ov11_022E7F34

	arm_func_start ov11_022E7F80
ov11_022E7F80: ; 0x022E7F80
	stmdb sp!, {r3, lr}
	ldr r0, _022E7FA4 ; =UNIONALL_RAM_ADDRESS
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7FA4 ; =UNIONALL_RAM_ADDRESS
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7FA4: .word UNIONALL_RAM_ADDRESS
	arm_func_end ov11_022E7F80

	arm_func_start ov11_022E7FA8
ov11_022E7FA8: ; 0x022E7FA8
	ldr r1, _022E7FB4 ; =C_ROUTINES
	add r0, r1, r0, lsl #3
	bx lr
	.align 2, 0
_022E7FB4: .word C_ROUTINES
	arm_func_end ov11_022E7FA8

	arm_func_start GetCoroutineInfo
GetCoroutineInfo: ; 0x022E7FB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl ov11_022DC89C
	ldr r0, _022E8020 ; =UNIONALL_RAM_ADDRESS
	add r1, r5, r5, lsl #1
	ldr r2, [r0]
	add r3, r2, r1, lsl #1
	ldrh r1, [r3, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	str r2, [r4]
	ldrh r2, [r3, #4]
	ldr r3, [r0]
	mov r1, #0
	add r2, r3, r2, lsl #1
	str r2, [r4, #4]
	ldr r2, [r0, #4]
	sub r0, r1, #1
	str r2, [r4, #8]
	strh r1, [r4, #0x14]
	strb r1, [r4, #0x16]
	strh r0, [r4, #0x18]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8020: .word UNIONALL_RAM_ADDRESS
	arm_func_end GetCoroutineInfo

	arm_func_start ov11_022E8024
ov11_022E8024: ; 0x022E8024
	ldr r0, _022E8034 ; =ov11_02324F98
	mvn r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_022E8034: .word ov11_02324F98
	arm_func_end ov11_022E8024

	arm_func_start ov11_022E8038
ov11_022E8038: ; 0x022E8038
	bx lr
	arm_func_end ov11_022E8038

	arm_func_start GetSpecialRecruitmentSpecies
GetSpecialRecruitmentSpecies: ; 0x022E803C
	ldr r1, _022E804C ; =RECRUITMENT_TABLE_SPECIES
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022E804C: .word RECRUITMENT_TABLE_SPECIES
	arm_func_end GetSpecialRecruitmentSpecies

	arm_func_start ov11_022E8050
ov11_022E8050: ; 0x022E8050
	ldr r1, _022E807C ; =ov11_02320904
	b _022E8068
_022E8058:
	cmp r0, r2
	ldreqsh r0, [r1]
	bxeq lr
	add r1, r1, #4
_022E8068:
	ldrsh r2, [r1, #2]
	cmp r2, #0
	bne _022E8058
	mov r0, #0
	bx lr
	.align 2, 0
_022E807C: .word ov11_02320904
	arm_func_end ov11_022E8050

	arm_func_start PrepareMenuAcceptTeamMember
PrepareMenuAcceptTeamMember: ; 0x022E8080
	ldr r1, _022E808C ; =ov11_02324F98
	strh r0, [r1]
	bx lr
	.align 2, 0
_022E808C: .word ov11_02324F98
	arm_func_end PrepareMenuAcceptTeamMember

	arm_func_start ov11_022E8090
ov11_022E8090: ; 0x022E8090
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r1, #1
	strb r1, [r4]
	ldr r0, _022E810C ; =ov11_02324F98
	ldr r1, _022E8110 ; =RECRUITMENT_TABLE_SPECIES
	ldrsh r2, [r0]
	add r0, sp, #0
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #0
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	mov r0, r4
	bl SetBaseStatsMovesGroundMonster
	ldr r0, _022E810C ; =ov11_02324F98
	ldr r2, _022E8114 ; =RECRUITMENT_TABLE_LEVELS
	ldrsh r3, [r0]
	ldr r1, _022E8118 ; =RECRUITMENT_TABLE_LOCATIONS
	mov r3, r3, lsl #1
	ldrsh r2, [r2, r3]
	strb r2, [r4, #1]
	ldrsh r0, [r0]
	ldrb r0, [r1, r0]
	strb r0, [r4, #2]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E810C: .word ov11_02324F98
_022E8110: .word RECRUITMENT_TABLE_SPECIES
_022E8114: .word RECRUITMENT_TABLE_LEVELS
_022E8118: .word RECRUITMENT_TABLE_LOCATIONS
	arm_func_end ov11_022E8090

	arm_func_start ov11_022E811C
ov11_022E811C: ; 0x022E811C
	bx lr
	arm_func_end ov11_022E811C

	arm_func_start ov11_022E8120
ov11_022E8120: ; 0x022E8120
	bx lr
	arm_func_end ov11_022E8120

	arm_func_start InitRandomNpcJobs
InitRandomNpcJobs: ; 0x022E8124
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022E8164 ; =ov11_02324F9C
	strh r0, [r2, #2]
	strh r1, [r2]
	bl ov11_022E8168
	movs r1, r0
	beq _022E815C
	add r0, sp, #0
	mov r2, #0xff
	bl WasMissionCompletedToday
	ldrsh r0, [sp, #2]
	ldrsh r1, [sp, #4]
	bl SetRandomRequestNpcs1And2
_022E815C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8164: .word ov11_02324F9C
	arm_func_end InitRandomNpcJobs

	arm_func_start ov11_022E8168
ov11_022E8168: ; 0x022E8168
	stmdb sp!, {r3, lr}
	ldr r0, _022E81B8 ; =ov11_02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8188
	cmp r1, #1
	beq _022E819C
	b _022E81B0
_022E8188:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	ldmia sp!, {r3, pc}
_022E819C:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	ldmia sp!, {r3, pc}
_022E81B0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E81B8: .word ov11_02324F9C
	arm_func_end ov11_022E8168

	arm_func_start GetRandomNpcJobType
GetRandomNpcJobType: ; 0x022E81BC
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrneb r0, [r0, #1]
	moveq r0, #0xd
	ldmia sp!, {r3, pc}
	arm_func_end GetRandomNpcJobType

	arm_func_start GetRandomNpcJobSubtype
GetRandomNpcJobSubtype: ; 0x022E81D4
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrnesb r0, [r0, #2]
	moveq r0, #0
	streqb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end GetRandomNpcJobSubtype

	arm_func_start GetRandomNpcJobStillAvailable
GetRandomNpcJobStillAvailable: ; 0x022E81F0
	stmdb sp!, {r3, lr}
	ldr r0, _022E8254 ; =ov11_02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8210
	cmp r1, #1
	beq _022E8230
	b _022E824C
_022E8210:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBF0
	cmp r0, #0
	bne _022E824C
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E8230:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_022E824C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8254: .word ov11_02324F9C
	arm_func_end GetRandomNpcJobStillAvailable

; https://decomp.me/scratch/bAiXn
	arm_func_start AcceptRandomNpcJob
AcceptRandomNpcJob: ; 0x022E8258
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	bl AddMissionToJobList
	cmp r0, #0
	bne _022E82C0
	bl sub_0205F5A8
	bl sub_0205F710
	ldr r0, _022E82C8 ; =ov11_02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8290
	cmp r1, #1
	beq _022E82A8
	b _022E82C0
_022E8290:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC18
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E82A8:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC78
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E82C0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E82C8: .word ov11_02324F9C
	arm_func_end AcceptRandomNpcJob

	arm_func_start ov11_022E82CC
ov11_022E82CC: ; 0x022E82CC
	stmdb sp!, {r4, lr}
	cmp r0, #0
	movne r4, #0xd
	moveq r4, #0xc
	cmp r4, #0xc
	bne _022E82F0
	mov r0, #0x11
	bl GroundMainLoop
	mov r4, r0
_022E82F0:
	cmp r4, #0xc
	bne _022E832C
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	mov r0, #0x12
	bl GroundMainLoop
	mov r4, r0
	cmp r4, #0xd
	bne _022E832C
	mov r0, #0
	mov r1, #0x5c
	bl LoadScriptVariableValue
	cmp r0, #0
	ldmneia sp!, {r4, pc}
_022E832C:
	cmp r4, #0xd
	ldmneia sp!, {r4, pc}
	mov r0, #0x14
	bl GroundMainLoop
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E82CC

	arm_func_start ov11_022E8340
ov11_022E8340: ; 0x022E8340
	stmdb sp!, {r3, lr}
	mov r0, #0x198
	mov r1, #8
	bl MemAlloc
	ldr r3, _022E83F0 ; =ov11_02324CAC
	mov r1, #0
	mov r2, #0x198
	str r0, [r3]
	bl MemsetSimple
	mvn ip, #0
	ldr r0, _022E83F0 ; =ov11_02324CAC
	sub r3, ip, #1
	ldr r1, [r0]
	add r2, ip, #0x134
	strb ip, [r1, #6]
	ldr r1, [r0]
	strb r3, [r1, #4]
	ldr r1, [r0]
	strb r3, [r1, #5]
	ldr r1, [r0]
	str r2, [r1, #0x64]
	ldr r0, [r0]
	add r0, r0, #8
	bl InitPortraitParams
	ldr r0, _022E83F0 ; =ov11_02324CAC
	ldr r1, _022E83F4 ; =0x00000133
	ldr r0, [r0]
	add r0, r0, #8
	bl InitPortraitParamsWithMonsterId
	ldr r0, _022E83F0 ; =ov11_02324CAC
	mov r1, #0x12
	ldr r0, [r0]
	add r0, r0, #8
	bl SetPortraitLayout
	ldr r0, _022E83F0 ; =ov11_02324CAC
	ldr r0, [r0]
	add r0, r0, #6
	bl sub_0204F1B4
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022E84E4
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E83F0: .word ov11_02324CAC
_022E83F4: .word 0x00000133
	arm_func_end ov11_022E8340

	arm_func_start ov11_022E83F8
ov11_022E83F8: ; 0x022E83F8
	stmdb sp!, {r3, lr}
	ldr r0, _022E84A8 ; =ov11_02324CAC
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E84A0
_022E8414: ; jump table
	b _022E8424 ; case 0
	b _022E8440 ; case 1
	b _022E8460 ; case 2
	b _022E8498 ; case 3
_022E8424:
	bl ov11_022E8748
	cmp r0, #0
	bne _022E84A0
	bl ov11_022E86E4
	mov r0, #1
	bl ov11_022E84E4
	b _022E84A0
_022E8440:
	bl sub_0203D538
	cmp r0, #1
	bne _022E84A0
	bl FreeMissionRewardStructMain
	bl sub_02046D20
	mov r0, #2
	bl ov11_022E84E4
	b _022E84A0
_022E8460:
	bl ov11_022E8748
	cmp r0, #0
	bne _022E84A0
	bl ov11_022E86E4
	ldr r0, _022E84A8 ; =ov11_02324CAC
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0205B77C
	mov r1, #4
	strb r1, [r0], #0xa4
	bl sub_0205B584
	mov r0, #3
	bl ov11_022E84E4
	b _022E84A0
_022E8498:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022E84A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84A8: .word ov11_02324CAC
	arm_func_end ov11_022E83F8

	arm_func_start ov11_022E84AC
ov11_022E84AC: ; 0x022E84AC
	stmdb sp!, {r3, lr}
	ldr r0, _022E84E0 ; =ov11_02324CAC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022E86E4
	ldr r0, _022E84E0 ; =ov11_02324CAC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E84E0 ; =ov11_02324CAC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84E0: .word ov11_02324CAC
	arm_func_end ov11_022E84AC

	arm_func_start ov11_022E84E4
ov11_022E84E4: ; 0x022E84E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _022E865C ; =ov11_02324CAC
	ldr r2, [r1]
	str r0, [r2]
	ldr r3, [r1]
	ldr r0, [r3]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E8654
_022E850C: ; jump table
	b _022E851C ; case 0
	b _022E8558 ; case 1
	b _022E861C ; case 2
	b _022E8654 ; case 3
_022E851C:
	bl ov11_022E866C
	bl ov11_022E86A4
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
	ldr r2, _022E8664 ; =0x0000025F
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitInPortraitBox
	b _022E8654
_022E8558:
	ldr r2, _022E8668 ; =0x00000133
	add r0, r3, #0x100
	strh r2, [r0, #0x68]
	ldr r0, [r1]
	mov r2, #2
	strb r2, [r0, #0x16a]
	ldr r0, [r1]
	mov r2, #0
	str r2, [r0, #0x170]
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl sub_0205B77C
	mov r4, r0
	add r2, sp, #0
	add r0, r4, #4
	mov r1, #0
	bl RollRandomItemReward
	ldr r0, _022E865C ; =ov11_02324CAC
	ldrsh r1, [sp]
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x178
	bl InitStandardItem
	bl sub_0206309C
	ldr r2, _022E865C ; =ov11_02324CAC
	mov r1, #0
	ldr r2, [r2]
	add r2, r2, #0x100
	strh r0, [r2, #0x7a]
	add r0, r4, #4
	bl sub_02062DC4
	ldr r3, _022E865C ; =ov11_02324CAC
	mov r1, #0
	ldr r2, [r3]
	mov ip, #1
	str r0, [r2, #0x190]
	ldr r0, [r3]
	mov r2, #0x10
	add r0, r0, #0x100
	strh r1, [r0, #0x82]
	ldr r0, [r3]
	add r0, r0, #0x100
	strh r1, [r0, #0x88]
	ldr r0, [r3]
	str ip, [r0, #0x174]
	ldr r0, [r3]
	add r0, r0, #0x168
	bl sub_0203D438
	b _022E8654
_022E861C:
	bl ov11_022E866C
	bl ov11_022E86A4
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
#ifdef JAPAN
	mov r2, #0x500
#else
	mov r2, #0x260
#endif
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitInPortraitBox
_022E8654:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E865C: .word ov11_02324CAC
_022E8660: .word 0x00003218
#ifdef JAPAN
_022E8664: .word 0x000004FF
#else
_022E8664: .word 0x0000025F
#endif
_022E8668: .word 0x00000133
	arm_func_end ov11_022E84E4

	arm_func_start ov11_022E866C
ov11_022E866C: ; 0x022E866C
	stmdb sp!, {r3, lr}
	ldr r1, _022E86A0 ; =ov11_02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #4]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _022E86A0 ; =ov11_02324CAC
	ldr r1, [r1]
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86A0: .word ov11_02324CAC
	arm_func_end ov11_022E866C

	arm_func_start ov11_022E86A4
ov11_022E86A4: ; 0x022E86A4
	stmdb sp!, {r3, lr}
	ldr r1, _022E86E0 ; =ov11_02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #5]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _022E86E0 ; =ov11_02324CAC
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86E0: .word ov11_02324CAC
	arm_func_end ov11_022E86A4

	arm_func_start ov11_022E86E4
ov11_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _022E8714
	bl CloseDialogueBox
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_022E8714:
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClosePortraitBox
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8744: .word ov11_02324CAC
	arm_func_end ov11_022E86E4

	arm_func_start ov11_022E8748
ov11_022E8748: ; 0x022E8748
	stmdb sp!, {r3, lr}
	ldr r0, _022E8770 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsDialogueBoxActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8770: .word ov11_02324CAC
	arm_func_end ov11_022E8748

	arm_func_start GroundMainLoop
GroundMainLoop: ; 0x022E8774
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldr r2, _022E91E8 ; =ov11_02324FA0
	mov r4, r0
	str r4, [r2, #0x14]
	mov r0, #0
	strb r0, [r2, #4]
	mov r1, #1
	strb r1, [r2, #2]
	strb r0, [r2, #3]
	strb r0, [r2, #1]
	mov r1, #0x2c
	strb r0, [r2]
	bl LoadScriptVariableValue
	mov r2, r0
	ldr r0, _022E91EC ; =ov11_023209B0
	mov r1, r4
	bl Debug_Print0
	bl sub_02028E2C
	mov r0, #0
	mov r1, #0xb0000
	mov r2, #0x20
	mov r3, #1
	bl MemArenaAlloc
	ldr r1, _022E91F0 ; =ov11_02324CB0
	ldr r2, _022E91F4 ; =GROUND_MEMORY_ARENA_1
	str r0, [r1, #8]
	mov r0, #0x64000
	str r0, [sp, #0xc]
	add r0, sp, #8
	mov r1, #0x34
	str r2, [sp, #8]
	bl CreateMemArena
	ldr r2, _022E91F0 ; =ov11_02324CB0
	ldr r1, _022E91F8 ; =GetFreeArenaGround
	str r0, [r2, #4]
	ldr r0, _022E91FC ; =GetAllocArenaGround
	bl SetMemAllocatorParams
	sub r0, r4, #0xc
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022E88B0
_022E881C: ; jump table
	b _022E8840 ; case 0
	b _022E8840 ; case 1
	b _022E8840 ; case 2
	b _022E88B0 ; case 3
	b _022E88B0 ; case 4
	b _022E885C ; case 5
	b _022E8870 ; case 6
	b _022E889C ; case 7
	b _022E889C ; case 8
_022E8840:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r2, #1
	strb r2, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r2, [r0, #4]
	b _022E88B0
_022E885C:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	strb r1, [r0, #2]
	strb r1, [r0, #4]
	b _022E88B0
_022E8870:
	add r0, sp, #4
	bl sub_02049338
	ldr r0, [sp, #4]
	mov r1, #1
	cmp r0, #0
	moveq r2, #1
	ldr r0, _022E91E8 ; =ov11_02324FA0
	movne r2, #0
	strb r2, [r0, #2]
	strb r1, [r0, #4]
	b _022E88B0
_022E889C:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #0
	strb r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
_022E88B0:
	bl sub_02017A68
	bl ov11_022EB848
	cmp r4, #0x11
	moveq r0, #2
	movne r0, #0
	bl ov11_022E9720
	bl ov11_022EAFD4
	bl ov11_022DC6C4
	bl ov11_022F4518
	bl ov11_022EBA44
	mov r0, #1
	bl sub_02047FFC
	bl ov11_022F709C
	bl ov11_022F11DC
	bl ov11_022EA908
	bl ov11_022FE9E0
	bl AllocAndInitPartnerFollowDataAndLiveActorList
	bl ov11_022FBDBC
	bl ov11_022FD624
	bl ov11_0230CE78
	bl ov11_0230CFF4
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r2, #1
	mov r0, #0
	str r2, [r1, #0x1c]
	str r0, [r1, #0x10]
	sub r2, r0, #1
	str r2, [r1, #0x18]
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r2, _022E91E8 ; =ov11_02324FA0
	mov r1, #0x1d
	strh r0, [r2, #8]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mvn r2, #0
	str r0, [r1, #0xc]
	strh r2, [r1, #6]
	ldr r1, _022E91F0 ; =ov11_02324CB0
	mov r2, #1
	ldr r0, _022E9200 ; =ov11_022E9258
	strb r2, [r1]
	bl sub_0200383C
_022E8960:
	mvn r0, #0
	strh r0, [sp, #2]
	bl sub_020038E8
	bl ov11_022DC808
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	cmpne r0, #2
	beq _022E8990
	ldr r0, _022E9204 ; =ov11_023209CC
	bl Debug_Print0
	b _022E8FDC
_022E8990:
	bl sub_02034D0C
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r2, [r0, #0x14]
	cmp r2, #0x14
	addls pc, pc, r2, lsl #2
	b _022E8CD4
_022E89A8: ; jump table
	b _022E89FC ; case 0
	b _022E8CD4 ; case 1
	b _022E8A24 ; case 2
	b _022E8CD4 ; case 3
	b _022E8CD4 ; case 4
	b _022E8CD4 ; case 5
	b _022E8CD4 ; case 6
	b _022E8CD4 ; case 7
	b _022E8AE4 ; case 8
	b _022E8AE4 ; case 9
	b _022E8AE4 ; case 10
	b _022E8AE4 ; case 11
	b _022E8C20 ; case 12
	b _022E8C20 ; case 13
	b _022E8A24 ; case 14
	b _022E8BEC ; case 15
	b _022E8A3C ; case 16
	b _022E8CA8 ; case 17
	b _022E8CB4 ; case 18
	b _022E8CC0 ; case 19
	b _022E8CCC ; case 20
_022E89FC:
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	bl GroundMainNextDay
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8A24:
	add r0, sp, #2
	bl sub_0206C0D8
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8A3C:
	bl sub_0204E70C
	mov r5, r0
	bl sub_0204E760
	mov r4, r0
	mov r2, r4
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r4
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	ldr r0, _022E920C ; =ov11_02320A08
	mov r1, r5
	mov r2, r4
	bl Debug_Print0
	cmp r5, #2
	ldreq r0, _022E9210 ; =0x0000029D
	streqh r0, [sp, #2]
	beq _022E8CD4
	cmp r5, #3
	ldreq r0, _022E9214 ; =0x0000029E
	streqh r0, [sp, #2]
	beq _022E8CD4
	mov r0, #0
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	ldrne r0, _022E9218 ; =0x0000029F
	strneh r0, [sp, #2]
	bne _022E8CD4
	mov r0, r4
	bl GetDungeonModeSpecial
	cmp r0, #3
	moveq r0, #0x29c
	streqh r0, [sp, #2]
	beq _022E8CD4
	cmp r5, #1
	ldreq r0, _022E921C ; =0x0000029B
	streqh r0, [sp, #2]
	ldrne r0, _022E9220 ; =0x0000029A
	strneh r0, [sp, #2]
	b _022E8CD4
_022E8AE4:
	mov r0, #0
	mov r1, #0x2b
	bl SaveScriptVariableValue
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	bl GroundMainNextDay
	mov r0, #0
	mov r1, #0x2a
	mov r2, #1
	mov r3, #2
	bl CalcAndUpdateScriptVarWithOtherValue
	bl sub_0204F034
	mov r4, r0
	bl sub_0204F050
	mov r5, r0
	bl GetDungeonModeSpecial
	mov r3, r0
	ldr r0, _022E9224 ; =ov11_02320A28
	mov r1, r4
	mov r2, r5
	bl Debug_Print0
	cmp r4, #2
	cmpne r4, #3
	beq _022E8B94
	mov r0, #0
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	ldrne r0, _022E9228 ; =0x000002A5
	strneh r0, [sp, #2]
	bne _022E8B94
	mov r0, r5
	bl GetDungeonModeSpecial
	cmp r0, #3
	moveq r0, #0x2a4
	streqh r0, [sp, #2]
	beq _022E8B94
	cmp r4, #1
	ldreq r0, _022E922C ; =0x000002A1
	streqh r0, [sp, #2]
	movne r0, #0x2a0
	strneh r0, [sp, #2]
_022E8B94:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r0, [r0, #0x14]
	cmp r0, #8
	bne _022E8BC4
	cmp r4, #0
	cmpne r4, #1
	bne _022E8BC4
	cmp r5, #0xd5
	bge _022E8BC4
	mov r0, r5
	mov r1, #1
	bl SetDungeonConquest
_022E8BC4:
	mov r0, #0
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _022E8CD4
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	strh r1, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	b _022E8CD4
_022E8BEC:
	bl sub_0204E760
	mov r4, r0
	mov r2, r4
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r4
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	ldr r0, _022E9230 ; =0x000002A6
	strh r0, [sp, #2]
	b _022E8CD4
_022E8C20:
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	bl GroundMainNextDay
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r0, #0
	ldr r2, [r1, #0x14]
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1e
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1c
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1d
	mov r2, r0
	bl SaveScriptVariableValue
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	ldr r0, [r0, #0x14]
	cmp r0, #0xc
	moveq r0, #0x46
	streqh r0, [sp, #2]
	movne r0, #0x47
	strneh r0, [sp, #2]
	ldr r0, _022E91E8 ; =ov11_02324FA0
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8CA8:
	mov r0, #0x4e
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CB4:
	mov r0, #0x4f
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CC0:
	mov r0, #0x50
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CCC:
	mov r0, #0x51
	strh r0, [sp, #2]
_022E8CD4:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022E8D78
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r4, r0
	ldr r2, [r1, #0x14]
	mov r0, #0
	mov r1, #0x2c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	ldr r0, _022E9234 ; =ov11_02320A44
	ldr r1, [r1, #0x14]
	bl Debug_Print0
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r1, [r0, #0x14]
	cmp r1, #1
	beq _022E8D50
	cmp r1, #4
	mov r1, #0x1e
	bne _022E8D44
	ldrsh r2, [r0, #8]
	mov r0, #0
	bl SaveScriptVariableValue
	b _022E8D50
_022E8D44:
	mov r2, r4
	mov r0, #0
	bl SaveScriptVariableValue
_022E8D50:
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r0, #0
	ldrsh r2, [r1, #8]
	mov r1, #0x1c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r0, #0
	ldr r2, [r1, #0xc]
	mov r1, #0x1d
	bl SaveScriptVariableValue
_022E8D78:
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r2, #3
	mov r1, #0
	str r2, [r0, #0x14]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x10]
	sub r2, r1, #1
	str r2, [r0, #0x18]
	ldrsh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r2, [r0, #8]
	bl ov11_022E98CC
	bl ov11_022DC718
	bl ov11_022F468C
	bl ov11_022F7104
	bl ov11_022F1244
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ComputeSpecialCounters
	ldrsh r0, [sp, #2]
	mvn r1, #0
	cmp r0, r1
	mov r1, #0
	beq _022E8DF8
	bl ov11_022F7188
	mvn r0, #0
	strh r0, [sp, #2]
	b _022E8E00
_022E8DF8:
	mov r0, #0x3c
	bl ov11_022F7188
_022E8E00:
	bl sub_020039E4
	mov fp, #0
	mov r6, #1
	mov r8, #0x1e
	ldr r5, _022E91E8 ; =ov11_02324FA0
	ldr r4, _022E9238 ; =0x00000F0F
	mov r7, r6
	mov sl, r8
	mov sb, fp
_022E8E24:
	bl sub_020038E8
	bl ov11_022DC808
	bl sub_0204F9CC
	ldr r1, [r5, #0x1c]
	cmp r1, #0
	beq _022E8EBC
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _022E8E88
	sub r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #0
	bgt _022E8F94
	cmp r1, #1
	cmpne r1, #2
	bne _022E8E70
	ldr r0, [r5, #0x18]
	bl ov11_022E9AD8
	b _022E8F94
_022E8E70:
	ldrb r2, [r5, #4]
	ldrb r1, [r5, #1]
	ldr r0, [r5, #0x18]
	orr r1, r2, r1
	bl ov11_022E9AF0
	b _022E8F94
_022E8E88:
	bl ov11_022E9EFC
	cmp r0, #0
	bne _022E8F94
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	cmpne r0, #2
	bne _022E8FB8
	mov r0, #0
	bl ov11_022E9B24
	mov r0, #0
	bl ov11_022E9B84
	b _022E8FB8
_022E8EBC:
	ldrb r0, [r5, #4]
	cmp r0, #0
	ldreqb r0, [r5, #1]
	cmpeq r0, #0
	beq _022E8F94
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _022E8F1C
	mov r0, sb
	bl sub_02034840
	cmp r0, #0
	bne _022E8F94
	bl ov11_022F7628
	cmp r0, #0
	bne _022E8F94
	bl ov11_0230D170
	cmp r0, #0
	bne _022E8F94
	bl ov11_022F7140
	mov r0, r8
	bl ov11_022E9644
	mov r0, sl
	bl sub_02017ACC
	b _022E8F94
_022E8F1C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _022E8F94
	mov r0, fp
	add r1, sp, #0
	bl GetPressedButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	add r0, sp, #0x10
	beq _022E8F4C
	bl GetReleasedStylus
	b _022E8F50
_022E8F4C:
	bl sub_02006BFC
_022E8F50:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _022E8F6C
	ldrh r0, [sp]
	tst r0, #8
	strneb r7, [r5, #3]
	b _022E8F94
_022E8F6C:
	ldrh r0, [sp]
	tst r0, r4
	bne _022E8F90
	add r0, sp, #0x10
	mov r1, #2
	mov r2, #0
	bl sub_02006C8C
	cmp r0, #0
	beq _022E8F94
_022E8F90:
	strb r6, [r5, #3]
_022E8F94:
	bl ov11_022F766C
	bl ov11_0230D340
	bl sub_020039E4
	bl ov11_022F7BC4
	bl ov11_022F2188
	bl ov11_0230D570
	bl HandleMenus
	bl sub_02028848
	b _022E8E24
_022E8FB8:
	bl ov11_022F1244
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl sub_020039E4
	b _022E8960
_022E8FDC:
	mov r0, #0
	bl sub_0200383C
	bl sub_02034710
	bl ov11_0230CF00
	mov r0, #0
	bl ov11_022E9FC8
	cmp r0, #2
	bne _022E9008
	mov r0, #1
	bl sub_0204F024
	b _022E9010
_022E9008:
	mov r0, #0
	bl sub_0204F024
_022E9010:
	bl ov11_0230CED4
	bl ov11_022F1214
	bl ov11_022EA91C
	bl ov11_022F7DD4
	bl ov11_022FBE4C
	bl ov11_022FD6B4
	bl ov11_022FEA70
	bl ov11_022F70D0
	bl sub_0204804C
	bl ov11_022F47F4
	bl ov11_022DC7A0
	bl ov11_022EAFF4
	bl ov11_022E9848
	bl ov11_022EB9A4
	mov r0, #0
	mov r1, r0
	bl SetMemAllocatorParams
	ldr r0, _022E91F0 ; =ov11_02324CB0
	ldr r0, [r0, #4]
	bl sub_020012D8
	ldr r0, _022E91F0 ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bl sub_020012D8
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldrb r1, [r0]
	cmp r1, #0
	beq _022E9090
	ldr r0, [r0, #0x1c]
	cmp r0, #8
	moveq r0, #0xf
	movne r0, #0xe
	b _022E91E0
_022E9090:
	ldrb r1, [r0, #4]
	ldr r0, [r0, #0x1c]
	cmp r1, #0
	beq _022E90D0
	cmp r0, #6
	beq _022E90C0
	cmp r0, #7
	bne _022E90C0
	ldr r0, _022E923C ; =ov11_02320A60
	bl Debug_Print0
	mov r0, #0xd
	b _022E91E0
_022E90C0:
	ldr r0, _022E9240 ; =ov11_02320A70
	bl Debug_Print0
	mov r0, #0xc
	b _022E91E0
_022E90D0:
	cmp r0, #3
	beq _022E90E4
	cmp r0, #4
	beq _022E914C
	b _022E9170
_022E90E4:
	mov r0, #0
	mov r1, #0x2c
	mov r2, #0xf
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2b
	mov r2, #0xf
	bl SaveScriptVariableValue
	bl sub_0204E6FC
	mov r5, r0
	bl sub_0204E760
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	mov r2, r4
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x29
	mov r2, r4
	bl SaveScriptVariableValue
	mov r1, r5
	mov r2, r4
	ldr r0, _022E9244 ; =ov11_02320A7C
	bl Debug_Print0
	mov r0, #4
	b _022E91E0
_022E914C:
	bl sub_0204E6FC
	mov r4, r0
	bl sub_0204E760
	mov r2, r0
	ldr r0, _022E9248 ; =ov11_02320A94
	mov r1, r4
	bl Debug_Print0
	mov r0, #5
	b _022E91E0
_022E9170:
	mov r0, #0
	mov r1, #0x2c
	mov r2, #1
	bl SaveScriptVariableValue
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r1, [r0, #0x1c]
	cmp r1, #5
	bne _022E91A0
	ldr r0, _022E924C ; =ov11_02320AAC
	bl Debug_Print0
	mov r0, #9
	b _022E91E0
_022E91A0:
	cmp r1, #7
	bne _022E91D4
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E91C4
	ldr r0, _022E924C ; =ov11_02320AAC
	bl Debug_Print0
	mov r0, #9
	b _022E91E0
_022E91C4:
	ldr r0, _022E9250 ; =ov11_02320AB8
	bl Debug_Print0
	mov r0, #0xb
	b _022E91E0
_022E91D4:
	ldr r0, _022E9254 ; =ov11_02320AC8
	bl Debug_Print0
	mov r0, #0xa
_022E91E0:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E91E8: .word ov11_02324FA0
_022E91EC: .word ov11_023209B0
_022E91F0: .word ov11_02324CB0
_022E91F4: .word GROUND_MEMORY_ARENA_1
_022E91F8: .word GetFreeArenaGround
_022E91FC: .word GetAllocArenaGround
_022E9200: .word ov11_022E9258
_022E9204: .word ov11_023209CC
_022E9208: .word ov11_023209EC
_022E920C: .word ov11_02320A08
_022E9210: .word 0x0000029D
_022E9214: .word 0x0000029E
_022E9218: .word 0x0000029F
_022E921C: .word 0x0000029B
_022E9220: .word 0x0000029A
_022E9224: .word ov11_02320A28
_022E9228: .word 0x000002A5
_022E922C: .word 0x000002A1
_022E9230: .word 0x000002A6
_022E9234: .word ov11_02320A44
_022E9238: .word 0x00000F0F
_022E923C: .word ov11_02320A60
_022E9240: .word ov11_02320A70
_022E9244: .word ov11_02320A7C
_022E9248: .word ov11_02320A94
_022E924C: .word ov11_02320AAC
_022E9250: .word ov11_02320AB8
_022E9254: .word ov11_02320AC8
	arm_func_end GroundMainLoop

	arm_func_start ov11_022E9258
ov11_022E9258: ; 0x022E9258
	stmdb sp!, {r4, lr}
	bl sub_020038D8
	cmp r0, #0
	beq _022E9294
	bl sub_02006E14
	bl ov11_022F2178
	bl ov11_022FEE90
	bl ov11_022FAE58
	bl ov11_022FD47C
	bl ov11_022FE838
	bl HandleUnlocks
	bl ov11_022DC81C
	bl ov11_022EA024
	bl sub_02003990
	b _022E92A8
_022E9294:
	bl ov11_022F2178
	bl ov11_022FEE90
	bl ov11_022FAE58
	bl ov11_022FD47C
	bl ov11_022FE838
_022E92A8:
	bl sub_0201BF64
	bl sub_02028E40
	bl ov11_022EB3F0
	bl ov11_022F2194
	bl ov11_0230D6C4
	bl ov11_022EA0BC
	bl ov11_022EFC54
	bl ov11_022F5274
	bl sub_0201F464
	ldr r0, _022E9358 ; =ov11_02324CB0
	ldrb r0, [r0]
	cmp r0, #0
	bne _022E92E0
	bl sub_0201DDFC
_022E92E0:
	bl sub_02008F84
	bl sub_0201BE28
	bl sub_02017A80
	bl sub_02003A40
	ldr r1, _022E9358 ; =ov11_02324CB0
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _022E930C
	mov r0, #0
	bl sub_02008ED0
_022E930C:
	bl sub_02008F88
	bl G3X_Reset
	bl sub_0201DE10
	bl ov11_022F2244
	bl ov11_0230D6F0
	bl ov11_022EFCE4
	bl ov11_022F5B70
	bl ov10_022BF7D4
	mov r0, r4
	bl sub_02028A64
	bl GroupOamAttributesBothScreens
	bl sub_0201BE84
	bl sub_02028E88
	bl sub_0201BF4C
	mov r0, r4
	mov r2, #0
	ldr r1, _022E9358 ; =ov11_02324CB0
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9358: .word ov11_02324CB0
	arm_func_end ov11_022E9258

	arm_func_start GetAllocArenaGround
GetAllocArenaGround: ; 0x022E935C
	cmp r0, #0
	bxne lr
	and r0, r1, #0xff
	sub r0, r0, #8
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022E93B4
_022E9378: ; jump table
	b _022E93A8 ; case 0
	b _022E93B4 ; case 1
	b _022E93B4 ; case 2
	b _022E93B4 ; case 3
	b _022E93B4 ; case 4
	b _022E93B4 ; case 5
	b _022E939C ; case 6
	b _022E93A8 ; case 7
	b _022E93A8 ; case 8
_022E939C:
	ldr r0, _022E93BC ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bx lr
_022E93A8:
	ldr r0, _022E93BC ; =ov11_02324CB0
	ldr r0, [r0, #4]
	bx lr
_022E93B4:
	mov r0, #0
	bx lr
	.align 2, 0
_022E93BC: .word ov11_02324CB0
	arm_func_end GetAllocArenaGround

	arm_func_start GetFreeArenaGround
GetFreeArenaGround: ; 0x022E93C0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =ov11_02324CB0
	ldrne r0, [r0, #8]
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =ov11_02324CB0
	mov r1, r4
	ldr r0, [r0, #4]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =ov11_02324CB0
	ldrne r0, [r0, #4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9410: .word ov11_02324CB0
	arm_func_end GetFreeArenaGround

	arm_func_start GroundMainReturnDungeon
GroundMainReturnDungeon: ; 0x022E9414
	stmdb sp!, {r3, lr}
	ldr r0, _022E9434 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	bl GroundMainNextDay
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9434: .word ov11_023209EC
	arm_func_end GroundMainReturnDungeon

	arm_func_start GroundMainNextDay
GroundMainNextDay: ; 0x022E9438
	stmdb sp!, {r4, lr}
	bl GetGameMode
	mov r4, r0
	ldr r0, _022E94C8 ; =ov11_02320AD4
	bl Debug_Print0
	cmp r4, #3
	bne _022E9468
	mov r0, #0
	bl GenerateKecleonItems1
	mov r0, #0
	bl GenerateKecleonItems2
	ldmia sp!, {r4, pc}
_022E9468:
	cmp r4, #2
	ldmneia sp!, {r4, pc}
	bl GetScenarioBalance
	cmp r0, #6
	movhs r4, #3
	bhs _022E9498
	cmp r0, #4
	movhs r4, #2
	bhs _022E9498
	cmp r0, #2
	movhs r4, #1
	movlo r4, #0
_022E9498:
	ldr r0, _022E94CC ; =ov11_02320AEC
	mov r1, r4
	bl Debug_Print0
	mov r0, r4
	bl GenerateKecleonItems1
	mov r0, r4
	bl GenerateKecleonItems2
	bl GenerateDailyMissions
	bl GenerateCroagunkItems
	bl DecrementEggHatchTimer
	bl UpdateRecycleShop
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E94C8: .word ov11_02320AD4
_022E94CC: .word ov11_02320AEC
	arm_func_end GroundMainNextDay

	arm_func_start ov11_022E94D0
ov11_022E94D0: ; 0x022E94D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _022E9550 ; =ov11_02324FA0
	mov r5, r0
	ldr r0, [r3, #0x1c]
	mov r4, r1
	mov r6, r2
	cmp r0, #0
	bne _022E9548
	ldr r1, _022E9554 ; =ov11_02320B10
	mov r2, r5
	mov r3, r6
	mov r0, #1
	bl Debug_Print
	ldr r0, _022E9550 ; =ov11_02324FA0
	mov r1, #1
	str r1, [r0, #0x1c]
	str r1, [r0, #0x10]
	str r6, [r0, #0x18]
	cmp r4, #0
	movge r1, #3
	movlt r1, #4
	ldr r0, _022E9550 ; =ov11_02324FA0
	cmp r4, #0
	str r1, [r0, #0x14]
	strh r5, [r0, #8]
	ldr r1, _022E9550 ; =ov11_02324FA0
	movlt r4, #0
	mov r0, #1
	str r4, [r1, #0xc]
	ldmia sp!, {r4, r5, r6, pc}
_022E9548:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9550: .word ov11_02324FA0
_022E9554: .word ov11_02320B10
	arm_func_end ov11_022E94D0

	arm_func_start ov11_022E9558
ov11_022E9558: ; 0x022E9558
	ldr r1, _022E9588 ; =ov11_02324FA0
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	movne r0, #0
	bxne lr
	mov r2, #3
	str r2, [r1, #0x1c]
	mov r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x18]
	mov r0, r2
	bx lr
	.align 2, 0
_022E9588: .word ov11_02324FA0
	arm_func_end ov11_022E9558

	arm_func_start ov11_022E958C
ov11_022E958C: ; 0x022E958C
	stmdb sp!, {r4, lr}
	ldr r1, _022E95D4 ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E95D8 ; =ov11_02320B34
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E95D4 ; =ov11_02324FA0
	mov r0, #4
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E95D4: .word ov11_02324FA0
_022E95D8: .word ov11_02320B34
	arm_func_end ov11_022E958C

	arm_func_start JumpToTitleScreen
JumpToTitleScreen: ; 0x022E95DC
	stmdb sp!, {r4, lr}
	ldr r1, _022E963C ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	bne _022E9634
	ldr r1, _022E9640 ; =ov11_02320B58
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r0, _022E963C ; =ov11_02324FA0
	mov r1, #6
	str r1, [r0, #0x1c]
	cmp r4, #0
	movge r1, #1
	strge r1, [r0, #0x10]
	strge r4, [r0, #0x18]
	movlt r1, #0
	strlt r1, [r0, #0x10]
	strlt r1, [r0, #0x18]
	mov r0, #1
	ldmia sp!, {r4, pc}
_022E9634:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E963C: .word ov11_02324FA0
_022E9640: .word ov11_02320B58
	arm_func_end JumpToTitleScreen

	arm_func_start ov11_022E9644
ov11_022E9644: ; 0x022E9644
	stmdb sp!, {r4, lr}
	ldr r1, _022E968C ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E9690 ; =ov11_02320B78
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E968C ; =ov11_02324FA0
	mov r0, #7
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E968C: .word ov11_02324FA0
_022E9690: .word ov11_02320B78
	arm_func_end ov11_022E9644

	arm_func_start ReturnToTitleScreen
ReturnToTitleScreen: ; 0x022E9694
	stmdb sp!, {r4, lr}
	ldr r1, _022E96DC ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E96E0 ; =ov11_02320B9C
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E96DC ; =ov11_02324FA0
	mov r0, #8
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E96DC: .word ov11_02324FA0
_022E96E0: .word ov11_02320B9C
	arm_func_end ReturnToTitleScreen
