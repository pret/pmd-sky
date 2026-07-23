	.include "asm/macros.inc"
	.include "main_020151E4.inc"

	.text

	arm_func_start GetPpIncrease
GetPpIncrease: ; 0x020151E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, r1
	mov r1, #0x39
	mov r6, #0
	bl IqSkillFlagTest
	cmp r0, #0
	orrne r0, r6, #0x100
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4a
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x200
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4b
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x400
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GetPpIncrease

	arm_func_start OpenWaza
OpenWaza: ; 0x02015294
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _020152EC ; =_020AF6E8
	mov r4, r0
	ldr r0, _020152F0 ; =_020AF700
	ldr r1, [r1, r4, lsl #2]
	add r0, r0, r4, lsl #3
	mov r2, #0
	bl LoadFileFromRom
	ldr r1, _020152F0 ; =_020AF700
	add r0, sp, #0
	ldr r1, [r1, r4, lsl #3]
	bl HandleSir0Translation
	ldr r3, [sp]
	ldr r1, _020152F4 ; =_020AF6F8
	ldr r2, [r3]
	ldr r0, _020152F8 ; =_020AF6F0
	str r2, [r1, r4, lsl #2]
	ldr r1, [r3, #4]
	str r1, [r0, r4, lsl #2]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020152EC: .word _020AF6E8
_020152F0: .word _020AF700
_020152F4: .word _020AF6F8
_020152F8: .word _020AF6F0
	arm_func_end OpenWaza

	arm_func_start SelectWaza
SelectWaza: ; 0x020152FC
	ldr r1, _0201531C ; =_020AF6F8
	ldr r2, _02015320 ; =_020AF6F0
	ldr r3, [r1, r0, lsl #2]
	ldr r1, _02015324 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r2, r0, lsl #2]
	str r3, [r1, #8]
	str r0, [r1]
	bx lr
	.align 2, 0
_0201531C: .word _020AF6F8
_02015320: .word _020AF6F0
_02015324: .word DUNGEON_MOVE_TABLES
	arm_func_end SelectWaza

	arm_func_start sub_02015328
sub_02015328: ; 0x02015328
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r0, #0x40
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r2, _02015500 ; =_020AF710
	mov r1, #0x40
	str r0, [r2]
	bl MemZero
	ldr r0, _02015500 ; =_020AF710
	ldr r2, [sp, #0x28]
	ldr r1, _02015504 ; =_020AF714
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #0x1c
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [r0]
	add r0, r1, #0x10
	ldr r1, [r1, #0x1c]
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp, #0x28]
	ldr ip, [r0]
	ldrsh r3, [sp, #0x24]
	ldr r2, [ip, #0x10]
	cmp r1, #2
	ldr r2, [r2, #4]
	str r2, [ip, #0x2c]
	ldr r2, [r0]
	str r5, [r2, #8]
	ldr r2, [r0]
	str r4, [r2, #0xc]
	ldr r2, [r0]
	strh r3, [r2, #0x30]
	mov r2, #0
	bne _02015454
	ldr r1, _02015508 ; =_02098F60
	add r0, sp, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	ldr r1, _0201550C ; =_02098F78
	add r0, sp, #0
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	add r1, r4, #1
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	b _020154CC
_02015454:
	cmp r1, #1
	ldr r0, [r0]
	bne _02015470
	ldr r1, _02015510 ; =_02098F90
	add r0, r0, #0x24
	bl LoadFileFromRom
	b _0201547C
_02015470:
	ldr r1, _02015514 ; =_02098FA8
	add r0, r0, #0x24
	bl LoadFileFromRom
_0201547C:
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r2, _02015518 ; =_020AF720
	ldr r0, [r0]
	add r1, r4, #1
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x24
	bl UnloadFile
_020154CC:
	ldr r0, _02015500 ; =_020AF710
	ldrsh r3, [sp, #0x20]
	ldr r2, [r0]
	mov r1, #0
	str r7, [r2]
	ldr r2, [r0]
	str r6, [r2, #4]
	ldr r2, [r0]
	strh r3, [r2, #0x32]
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015500: .word _020AF710
_02015504: .word _020AF714
_02015508: .word _02098F60
_0201550C: .word _02098F78
_02015510: .word _02098F90
_02015514: .word _02098FA8
_02015518: .word _020AF720
	arm_func_end sub_02015328

	arm_func_start sub_0201551C
sub_0201551C: ; 0x0201551C
	stmdb sp!, {r3, lr}
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r0, #0x3c]
	cmp r0, #0
	beq _02015540
	bl sub_02015EB4
_02015540:
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl UnloadFile
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201556C ; =_020AF710
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201556C: .word _020AF710
	arm_func_end sub_0201551C

	arm_func_start sub_02015570
sub_02015570: ; 0x02015570
	ldr r0, _02015584 ; =_020AF710
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	bx lr
	.align 2, 0
_02015584: .word _020AF710
	arm_func_end sub_02015570

	arm_func_start sub_02015588
sub_02015588: ; 0x02015588
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020155F4 ; =_020AF710
	mov r1, #0x6000
	ldr r2, [r0]
	ldrsh r0, [r2, #0x32]
	ldr r2, [r2]
	add r0, r2, r0, lsl #5
	bl MemZero32
	ldr r0, _020155F4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020155EC
	bl sub_02015EB4
	ldr r1, _020155F8 ; =_02098EA8
	ldr r0, _020155F4 ; =_020AF710
	ldr r2, [r1, #4]
	ldr r1, [r1]
	ldr r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl sub_0200B3C0
_020155EC:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020155F4: .word _020AF710
_020155F8: .word _02098EA8
	arm_func_end sub_02015588

	arm_func_start sub_020155FC
sub_020155FC: ; 0x020155FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	bl StringFromId
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov r6, r8
	add r5, sp, #4
	mov fp, #0x100
	mov r4, r8
_02015624:
	ldrb r0, [r7, r8]
	cmp r0, #0
	beq _02015698
	mov r0, r5
	mov r1, fp
	mov r3, #0x440
	str r6, [sp]
	add r2, r7, r8
	bl PreprocessString
	strb r4, [r5, r0]
	add r8, r8, r0
	ldrb sl, [r7, r8]
	cmp sl, #0
	beq _02015690
	ldr r1, _020156A8 ; =_02098FBC
	mov r2, #3
	add r0, r7, r8
	bl strncmp
	cmp r0, #0
	bne _02015684
	ldr r0, _020156A8 ; =_02098FBC
	bl strlen
	add r8, r8, r0
	b _02015690
_02015684:
	cmp sl, #0xd
	cmpne sl, #0xa
	addeq r8, r8, #1
_02015690:
	add sb, sb, #1
	b _02015624
_02015698:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020156A8: .word _02098FBC
	arm_func_end sub_020155FC

	arm_func_start sub_020156AC
sub_020156AC: ; 0x020156AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	cmp r1, #0
	beq _02015780
	ldr r3, _02015788 ; =_020AF710
	mov r2, r0, asr #2
	ldr r6, [r3]
	add r2, r0, r2, lsr #29
	ldrsh r5, [r6, #0x32]
	mov r2, r2, asr #3
	mov r4, r0, lsr #0x1f
	rsb r3, r4, r0, lsl #29
	ldr r6, [r6]
	add r5, r5, r2, lsl #5
	mov r0, #0
	add r3, r4, r3, ror #29
	add r5, r6, r5, lsl #5
	add r3, r5, r3, lsl #2
	mov r4, r0
	and r5, r1, #0xf
_020156FC:
	mov r1, r4, lsl #2
	add r4, r4, #1
	cmp r4, #8
	orr r0, r0, r5, lsl r1
	blt _020156FC
	mov r1, #0
_02015714:
	add r1, r1, #1
	cmp r1, #0x20
	str r0, [r3], #0x20
	blt _02015714
	ldr r7, _02015788 ; =_020AF710
	mov r6, #0
	ldr r0, [r7]
	add r4, sp, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, r2, lsl #5
	mov r0, r0, lsl #0x10
	str r2, [sp, #4]
	mov r5, r0, asr #0x10
_02015748:
	ldr r0, [r7]
	str r6, [sp]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	mov r1, r4
	add r2, r2, #1
	orr r2, r5, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r6, r6, #1
	cmp r6, #0x20
	add r5, r5, #1
	blt _02015748
_02015780:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015788: .word _020AF710
	arm_func_end sub_020156AC

	arm_func_start sub_0201578C
sub_0201578C: ; 0x0201578C
#ifdef EUROPE
#define SUB_0201578C_STACK_OFFSET 4
#else
#define SUB_0201578C_STACK_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x400
	ldr r5, [sp, #0x720]
	mov r4, #0
	str r5, [sp, #0x720]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r7, r2
	str r3, [sp, #0xc]
	str r4, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
_020157B8:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _02015CF8
	ldr r1, [sp, #0xc]
	add r0, sp, #0x500
	mov r5, #0
	add r2, r1, r4
	add r0, r0, #0xf8
	mov r1, #0x100
	mov r3, #0x440
	str r5, [sp]
	bl PreprocessString
	add r1, sp, #0x500
	add r1, r1, #0xf8
	mov r2, r5
	strb r2, [r1, r0]
	add r4, r4, r0
	ldr r0, [sp, #0xc]
	ldrb r5, [r0, r4]
	cmp r5, #0
	beq _02015844
	ldr r1, _02015D08 ; =_02098FBC
	add r0, r0, r4
	mov r2, #3
	bl strncmp
	cmp r0, #0
	bne _02015838
	ldr r0, _02015D08 ; =_02098FBC
	bl strlen
	add r4, r4, r0
	b _02015844
_02015838:
	cmp r5, #0xd
	cmpne r5, #0xa
	addeq r4, r4, #1
_02015844:
	ldr r0, [sp, #0x720]
	cmp r0, #2
	bne _0201586C
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r0, r0, #0x100
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	b _02015888
_0201586C:
	cmp r0, #1
	ldrne r5, [sp, #8]
	bne _02015888
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r5, r0, #0x100
_02015888:
	add r0, r7, #0xa
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	mov r2, r0, asr #2
	mov r3, r0, lsr #0x1f
	add r2, r1, r2, lsr #29
	rsb r1, r3, r1, lsl #29
	add r1, r3, r1, ror #29
	mov r0, r7, lsr #0x1f
	rsb r3, r0, r7, lsl #29
	add r0, r0, r3, ror #29
	str r0, [sp, #0x3c + SUB_0201578C_STACK_OFFSET]
	mov r0, r2, asr #3
	mov r6, r7, asr #2
	str r1, [sp, #0x34 + SUB_0201578C_STACK_OFFSET]
	add r1, r7, r6, lsr #29
	str r0, [sp, #0x30 + SUB_0201578C_STACK_OFFSET]
	mov r0, r1, asr #3
	add r6, sp, #0x500
	str r0, [sp, #0x38 + SUB_0201578C_STACK_OFFSET]
	add r6, r6, #0xf8
	b _02015CD8
#ifdef EUROPE
_020158E0:
	ldrb r0, [r6], #1
	cmp r0, #0x23
	str r0, [sp, #0x18]
	addeq r5, r5, #8
	beq _02015CD8
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02015CD8
	cmp r0, #0x5b
	bne _02015B14
	mov r0, #1
	str r6, [sp, #0x44]
	str r0, [sp, #0x1c]
	mov r1, r0
_020159C0:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _020159E0
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _020159C0
_020159E0:
	ldr r0, [sp, #0x44]
	ldr r1, _02015DEC ; =_02099404_EU
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015A0C
	ldr r0, [sp, #0x48]
	bl sub_0202380C_EU
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	b _02015B08
_02015A0C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015B08
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x34]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x38]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x20]
_02015A78:
	mov sl, sb
	mov lr, #0
	b _02015AD0
_02015A84:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_02015AD0:
	cmp lr, r0, asr #16
	blt _02015A84
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x20]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x20]
	cmp r1, #2
	blt _02015A78
	add r5, r5, r0, asr #16
_02015B08:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02015CD8
_02015B14:
	ldr r0, [sp, #0x18]
	bl sub_02025480
	bl sub_0201628C
	mov sl, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr r3, [r0]
	str r1, [sp, #0x24]
	mov r8, sl
	mov sb, sl
_02015B3C:
	ldrb r2, [r3], #1
	add r1, sp, #0x58
	add r1, r1, sb
	mov fp, r2, asr #4
	and ip, fp, #0xf
	add fp, sp, #0x58
	strb ip, [fp, sb]
	and r2, r2, #0xf
	add sb, sb, #2
	strb r2, [r1, #1]
	cmp sb, #0x240
	blt _02015B3C
_02015B6C:
	cmp r8, #0x240
	bge _02015BFC
	add r1, sp, #0x58
	ldrb r1, [r1, sl]
	add r3, sl, #1
	mov sl, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015BF0
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add sl, r3, #1
	and r3, r2, #0xff
	b _02015BC0
_02015BA8:
	add r2, sp, #0x298
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BC0:
	cmp sb, r1
	blt _02015BA8
	b _02015B6C
_02015BCC:
	add r2, sp, #0x58
	ldrb r3, [r2, sl]
	add r2, sp, #0x298
	add sl, sl, #1
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BF0:
	cmp sb, r1
	blt _02015BCC
	b _02015B6C
_02015BFC:
	mov fp, #0
_02015C00:
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x24]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r8, r1, #0xf00
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r1, r3, r1
	orr r1, r8, r1
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	cmp fp, #0x240
	str r2, [r1]
	blt _02015C00
	ldrb lr, [r0, #6]
	ldr r0, _02015D10 ; =_020AF710
	add r8, sp, #0x400
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r3, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x3c]
	mov r2, r7
	add r0, r1, r0, lsl #5
	add r1, r3, r0
	ldr r0, [sp, #4]
	add r8, r8, #0xd8
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x40]
	add r3, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x28]
_02015D04:
	mov r0, #0
	mov sl, r3
	str r0, [sp, #0x2c]
_02015D10_EU:
	ldr r1, [r8]
	cmp r1, #0
	beq _02015D4C
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015D4C:
	ldr r0, [sp, #0x2c]
	add r8, r8, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x2c]
	cmp r0, #3
	blt _02015D10_EU
	add r2, r2, #1
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	addeq r3, r3, #0x3e0
	str r0, [sp, #0x28]
	cmp r0, #0x18
	blt _02015D04
	ldr r0, [sp, #0x18]
	add r5, r5, lr
	cmp r0, #0x7e
#else
_020158E0:
	ldrb r8, [r6], #1
	cmp r8, #0x23
	addeq r5, r5, #8
	beq _02015CD8
	cmp r8, #0x20
#ifdef JAPAN
	addeq r5, r5, #0xc
#else
	addeq r5, r5, #6
#endif
	beq _02015CD8
	cmp r8, #0x5b
	bne _02015A2C
	str r6, [sp, #0x44]
	mov r1, #1
_0201590C:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _0201592C
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _0201590C
_0201592C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015CD8
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x30]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x34]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x18]
_02015998:
	mov sl, sb
	mov lr, #0
	b _020159F0
_020159A4:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_020159F0:
	cmp lr, r0, asr #16
	blt _020159A4
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x18]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x18]
	cmp r1, #2
	blt _02015998
	add r5, r5, r0, asr #16
	b _02015CD8
_02015A2C:
#ifdef JAPAN
	tst r8, #0x80
	beq _02015A24
	ldrb r0, [r6]
	cmp r0, #0
	orrne r8, r0, r8, lsl #8
	ldr r0, _02015D10_JP ; =0x00008140
	addne r6, r6, #1
	cmp r8, r0
	addeq r5, r5, #0xc
	beq _02015CD8
_02015A24:
#endif
	mov r0, r8
	bl sub_02025480
	bl sub_0201628C
	mov ip, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr sb, [r0]
	str r1, [sp, #0x1c]
	mov sl, ip
	mov fp, ip
_02015A54:
	ldrb r3, [sb], #1
	add r1, sp, #0x58
	add lr, r1, fp
	mov r1, r3, asr #4
	and r2, r1, #0xf
	add r1, sp, #0x58
	strb r2, [r1, fp]
	and r1, r3, #0xf
	add fp, fp, #2
	strb r1, [lr, #1]
	cmp fp, #0x240
	blt _02015A54
_02015A84:
	cmp sl, #0x240
	bge _02015B14
	add r1, sp, #0x58
	ldrb r1, [r1, ip]
	add r3, ip, #1
	mov ip, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015B08
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add ip, r3, #1
	and r3, r2, #0xff
	b _02015AD8
_02015AC0:
	add r2, sp, #0x298
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015AD8:
	cmp sb, r1
	blt _02015AC0
	b _02015A84
_02015AE4:
	add r2, sp, #0x58
	ldrb r3, [r2, ip]
	add r2, sp, #0x298
	add ip, ip, #1
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015B08:
	cmp sb, r1
	blt _02015AE4
	b _02015A84
_02015B14:
	mov fp, #0
_02015B18:
	ldr r1, [sp, #0x1c]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x1c]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r1, r1, #0xf00
	str r1, [sp, #0x40]
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r2, r3, r1
	ldr r1, [sp, #0x40]
	cmp fp, #0x240
	orr r1, r1, r2
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	str r2, [r1]
	blt _02015B18
	ldrb r0, [r0, #6]
	add r3, sp, #0x400
	mov lr, r7
	str r0, [sp, #0x20]
	ldr r0, _02015D10 ; =_020AF710
	add r3, r3, #0xd8
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r2, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x38]
	add r0, r1, r0, lsl #5
	add r1, r2, r0
	ldr r0, [sp, #4]
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x3c]
	add r2, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x24]
_02015C28:
	mov r0, #0
	mov sl, r2
	str r0, [sp, #0x28]
_02015C34:
	ldr r1, [r3]
	cmp r1, #0
	beq _02015C70
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015C70:
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02015C34
	add lr, lr, #1
	mov r1, lr, lsr #0x1f
	rsb r0, r1, lr, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x24]
	add r2, r2, #4
	add r0, r0, #1
	addeq r2, r2, #0x3e0
	str r0, [sp, #0x24]
	cmp r0, #0x18
	blt _02015C28
	ldr r0, [sp, #0x20]
	cmp r8, #0x7e
	add r5, r5, r0
#endif
	ldreqb r0, [r6]
	cmpeq r0, #0x32
	ldreqb r0, [r6, #1]
	cmpeq r0, #0x37
	addeq r6, r6, #2
_02015CD8:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020158E0
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add r7, r7, #0x18
	add r0, r0, #1
	str r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	b _020157B8
_02015CF8:
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add sp, sp, #0x2f8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015D08: .word _02098FBC
#ifdef EUROPE
_02015DEC: .word _02099404_EU
#endif
_02015D0C: .word _02098FC0
_02015D10: .word _020AF710
_02015D14: .word _02098EE0
#ifdef JAPAN
_02015D10_JP: .word 0x00008140
#endif
	arm_func_end sub_0201578C

	arm_func_start sub_02015D18
sub_02015D18: ; 0x02015D18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r6, r4
	str r1, [sp, #4]
	str r5, [sp, #8]
	b _02015D60
_02015D3C:
	ldrb r1, [r2], #1
	cmp r1, #0x7e
	strb r1, [r6], #1
	bne _02015D60
	ldrb r1, [r2]
	cmp r1, #0x32
	ldreqb r1, [r2, #1]
	cmpeq r1, #0x37
	addeq r2, r2, #2
_02015D60:
	ldrb r1, [r2]
	cmp r1, #0
	bne _02015D3C
	mov r1, #0
	strb r1, [r6]
	str r3, [sp]
	ldr r2, _02015E40 ; =_020AF710
	mov r1, r0
	ldr r0, [r2]
	mov r2, r5
	ldr r0, [r0]
	mov r3, r4
	bl sub_0201578C
	mov r1, r5, asr #2
	add r2, r5, r1, lsr #29
	mov r7, r0
	mov r1, #0x18
	mul r0, r7, r1
	add r0, r0, r2, asr #3
	add r3, r0, #7
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r0, r0, asr #3
	mov sb, r2, asr #3
	bl _s32_div_f
	ldr fp, _02015E40 ; =_020AF710
	mov sl, r1
	ldr r0, [fp]
	mov r4, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, sb, lsl #5
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	b _02015E2C
_02015DE8:
	mov r5, #0
	add r8, sb, r4
_02015DF0:
	ldr r0, [fp]
	str r5, [sp, #4]
	str r8, [sp, #8]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	add r1, sp, #4
	orr r2, r6, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r5, r5, #1
	cmp r5, #0x20
	add r6, r6, #1
	blt _02015DF0
	add r4, r4, #1
_02015E2C:
	cmp r4, sl
	blt _02015DE8
	mov r0, r7
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015E40: .word _020AF710
	arm_func_end sub_02015D18

	arm_func_start sub_02015E44
sub_02015E44: ; 0x02015E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r2, r0
	mov r1, r4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	ldmia sp!, {r4, pc}
	arm_func_end sub_02015E44

	arm_func_start sub_02015E6C
sub_02015E6C: ; 0x02015E6C
	stmdb sp!, {r3, lr}
	ldr r0, _02015EB0 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02015E88
	bl sub_0200B330
_02015E88:
	ldr r0, _02015EB0 ; =_020AF710
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02015EA4
	bl sub_0200A174
	ldmia sp!, {r3, pc}
_02015EA4:
	ldr r0, [r1, #0xc]
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EB0: .word _020AF710
	arm_func_end sub_02015E6C

	arm_func_start sub_02015EB4
sub_02015EB4: ; 0x02015EB4
	stmdb sp!, {r3, lr}
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0200B3D4
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0200B330
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EE4: .word _020AF710
	arm_func_end sub_02015EB4

	arm_func_start sub_02015EE8
sub_02015EE8: ; 0x02015EE8
	stmdb sp!, {r3, lr}
	ldr r1, _02015F14 ; =_020AF710
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, r0, lsl #0x10
	ldr r0, [r2, #0xc]
	mov r1, r1, lsr #0x10
	bl sub_0200A618
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015F14: .word _020AF710
	arm_func_end sub_02015EE8

	arm_func_start sub_02015F18
sub_02015F18: ; 0x02015F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r4, _02015FD4 ; =_020AF710
	mov r6, #0
	ldr r0, [r4]
	add r5, sp, #0
	ldr r0, [r0, #8]
	mov r8, #0x10
	cmp r0, #0
	beq _02015F88
	ldr r7, _02015FD8 ; =_020AFC70
_02015F44:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #8]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A2B4
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F44
	b _02015FCC
_02015F88:
	ldr r7, _02015FD8 ; =_020AFC70
_02015F8C:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #0xc]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A5F8
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F8C
_02015FCC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02015FD4: .word _020AF710
_02015FD8: .word _020AFC70
	arm_func_end sub_02015F18

	arm_func_start sub_02015FDC
sub_02015FDC: ; 0x02015FDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	mov r3, r2, asr #2
	add r2, r2, r3, lsr #29
	mov ip, r5
	mov lr, r5
	b _0201602C
_02015FF8:
	mov r6, lr
	add r8, r1, r5, lsl #10
_02016000:
	mov r7, ip
	add r4, r8, r6, lsl #2
_02016008:
	ldr r3, [r4], #0x20
	add r7, r7, #1
	cmp r7, #0x20
	str r3, [r0], #4
	blt _02016008
	add r6, r6, #1
	cmp r6, #8
	blt _02016000
	add r5, r5, #1
_0201602C:
	cmp r5, r2, asr #3
	blt _02015FF8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02015FDC

	arm_func_start sub_02016038
sub_02016038: ; 0x02016038
	ldr ip, _02016048 ; =sub_0201E050
	add r1, r1, #0x10000
	mov r3, #0
	bx ip
	.align 2, 0
_02016048: .word sub_0201E050
	arm_func_end sub_02016038

	arm_func_start sub_0201604C
sub_0201604C: ; 0x0201604C
	stmdb sp!, {r3, lr}
	add r1, r1, #0x10000
	str r1, [r0, #0x20]
	mov ip, #0
	strh ip, [r0, #0x16]
	mov r1, #8
	strh ip, [r0, #0x18]
	mov ip, #0x100
	mov r1, r1, lsl r3
	strh ip, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh lr, [r0, #0x14]
	mov ip, r3, lsl #0x1d
	ldr r1, _02016110 ; =_020AF710
	bic r3, lr, #7
	orr r3, r3, #5
	strh r3, [r0, #0x14]
	ldrh lr, [r0, #0x14]
	ldr r3, _02016114 ; =_020AFC70
	bic lr, lr, #0x38
	orr ip, lr, ip, lsr #26
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0xc0
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x700
	orr ip, ip, #0x300
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x1800
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x6000
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	orr ip, ip, #0x8000
	strh ip, [r0, #0x14]
	ldr r1, [r1]
	ldr r3, [r3]
	ldrsh r1, [r1, #0x30]
	ldr r3, [r3, #0xe0]
	add r1, r2, r1
	mov r1, r1, lsl #0x14
	mov r1, r1, asr #0x10
	add r1, r1, #0x1000
	add r1, r3, r1, lsl #1
	str r1, [r0, #0x24]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016110: .word _020AF710
_02016114: .word _020AFC70
	arm_func_end sub_0201604C

	arm_func_start sub_02016118
sub_02016118: ; 0x02016118
	ldr r2, _02016140 ; =_020AF720
	ldr r3, _02016144 ; =_020AF721
	ldrb ip, [r2, r1, lsl #2]
	ldr r2, _02016148 ; =_020AF722
	strb ip, [r0, #0x2c]
	ldrb r3, [r3, r1, lsl #2]
	strb r3, [r0, #0x2d]
	ldrb r1, [r2, r1, lsl #2]
	strb r1, [r0, #0x2e]
	bx lr
	.align 2, 0
_02016140: .word _020AF720
_02016144: .word _020AF721
_02016148: .word _020AF722
	arm_func_end sub_02016118

	arm_func_start sub_0201614C
sub_0201614C: ; 0x0201614C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, [r6, #8]
	mov r5, r1
	mov r4, r2
	cmp r0, #0
	mov r7, #0
	beq _0201619C
_0201616C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #8]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl sub_0200A29C
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201616C
	ldr r0, [r6, #8]
	bl sub_0200A174
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0201619C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #0xc]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl CopyColorToPaletteDataRgba
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201619C
	ldr r0, [r6, #0xc]
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201614C

	arm_func_start sub_020161CC
sub_020161CC: ; 0x020161CC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	mov r5, r0
	mov r4, #0
	b _02016294
_020161DC:
	ldrb r0, [r5], #1
	cmp r0, #0x23
	addeq r4, r4, #8
	beq _02016294
	cmp r0, #0x20
	addeq r4, r4, #0xc
	beq _02016294
	cmp r0, #0x5b
	bne _02016258
	str r5, [sp]
	mov r2, #1
	add r0, sp, #0
_0201620C:
	ldrb r1, [r5], #1
	cmp r1, #0x5d
	beq _02016228
	cmp r1, #0x3a
	streq r5, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _0201620C
_02016228:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0_JP
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016294
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r4, r4, r0, asr #16
	b _02016294
_02016258:
	tst r0, #0x80
	beq _02016280
	ldrb r1, [r5]
	cmp r1, #0
	orrne r0, r1, r0, lsl #8
	ldr r1, _020162B0_JP ; =0x00008140
	addne r5, r5, #1
	cmp r0, r1
	addeq r4, r4, #0xc
	beq _02016294
_02016280:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r4, r4, r0
_02016294:
	ldrb r0, [r5]
	cmp r0, #0
	bne _020161DC
	mov r0, r4
#else
	mov r4, r0
	mov r5, #0
	b _02016270
_020161E0:
	ldrb r0, [r4], #1
	cmp r0, #0x23
	addeq r5, r5, #8
	beq _02016270
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02016270
	cmp r0, #0x5b
	bne _0201625C
	str r4, [sp]
	mov r2, #1
	add r0, sp, #0
_02016210:
	ldrb r1, [r4], #1
	cmp r1, #0x5d
	beq _0201622C
	cmp r1, #0x3a
	streq r4, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _02016210
_0201622C:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016270
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r5, r5, r0, asr #16
	b _02016270
_0201625C:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r5, r5, r0
_02016270:
	ldrb r0, [r4]
	cmp r0, #0
	bne _020161E0
	mov r0, r5
#endif
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02016288: .word _02098FC0
#ifdef JAPAN
_020162B0_JP: .word 0x00008140
#endif
	arm_func_end sub_020161CC

	arm_func_start sub_0201628C
sub_0201628C: ; 0x0201628C
	stmdb sp!, {r3, lr}
	ldr r1, _020162FC ; =_020AF710
	mov lr, #0
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x2c]
	ldr r3, [r2]
	sub ip, r1, #1
	b _020162DC
_020162B0:
	add r1, lr, ip
	add r1, r1, r1, lsr #31
	mov r2, r1, asr #1
	add r1, r3, r2, lsl #3
	ldrh r1, [r1, #4]
	cmp r0, r1
	moveq lr, r2
	beq _020162E4
	cmp r1, r0
	addlt lr, r2, #1
	movge ip, r2
_020162DC:
	cmp lr, ip
	blt _020162B0
_020162E4:
	add r2, r3, lr, lsl #3
	ldrh r1, [r2, #4]
	cmp r1, r0
	addne r2, r3, #8
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020162FC: .word _020AF710
	arm_func_end sub_0201628C

	arm_func_start sub_02016300
sub_02016300: ; 0x02016300
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x20]
	ldr lr, _0201636C ; =_020AF760
	ldrsh ip, [sp, #0x18]
	str r4, [lr]
	ldrsh r4, [sp, #0x1c]
	str ip, [sp]
	mov ip, #0x14
	str r4, [sp, #4]
	ldr r4, [lr]
	ldr lr, _02016370 ; =_0209901C
	mul ip, r4, ip
	ldr ip, [lr, ip]
	str ip, [sp, #8]
	bl sub_02015328
	ldr r1, _0201636C ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016374 ; =_02099020
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02016364
	blx r0
_02016364:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201636C: .word _020AF760
_02016370: .word _0209901C
_02016374: .word _02099020
	arm_func_end sub_02016300

	arm_func_start sub_02016378
sub_02016378: ; 0x02016378
	stmdb sp!, {r3, lr}
	ldr ip, _020163A4 ; =_020AF760
	mov r3, #0x14
	ldr lr, [ip]
	ldr ip, _020163A8 ; =_02099024
	mul r3, lr, r3
	ldr r3, [ip, r3]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163A4: .word _020AF760
_020163A8: .word _02099024
	arm_func_end sub_02016378

	arm_func_start sub_020163AC
sub_020163AC: ; 0x020163AC
	stmdb sp!, {r3, lr}
	ldr r1, _020163DC ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _020163E0 ; =_02099028
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163DC: .word _020AF760
_020163E0: .word _02099028
	arm_func_end sub_020163AC

	arm_func_start sub_020163E4
sub_020163E4: ; 0x020163E4
	stmdb sp!, {r3, lr}
	ldr r1, _02016414 ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016418 ; =_0209902C
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0201640C
	blx r0
_0201640C:
	bl sub_0201551C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016414: .word _020AF760
_02016418: .word _0209902C
	arm_func_end sub_020163E4

	arm_func_start sub_0201641C
sub_0201641C: ; 0x0201641C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02015588
	mov r1, r4
	mov r0, #3
	mov r2, #0
	bl sub_0204F6F8
	mov r4, r0
	bl sub_02015570
	mov r0, r4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201641C

	arm_func_start sub_02016468
sub_02016468: ; 0x02016468
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r4, r1
	mov r5, r0
	bl sub_02015588
	bl sub_02015570
	add r0, sp, #0
	mov r1, r4
	bl strcpy
	mov r1, r5
	mov r0, #0
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016468

	arm_func_start sub_020164AC
sub_020164AC: ; 0x020164AC
	stmdb sp!, {r3, lr}
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x90
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30c0
	add r0, r0, #0x8000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0xf0
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x60
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x120
	add r0, r0, #0xb000
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016544: .word _020AF760
	arm_func_end sub_020164AC

	arm_func_start sub_02016548
sub_02016548: ; 0x02016548
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x104
	ldrb r4, [sp, #0x118]
	mov ip, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, #0
	add r0, sp, #4
	mov r1, ip
	beq _020165C8
	mov r2, r5
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #4
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r6
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r7
	add r0, sp, #4
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #4
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	b _02016768
_020165C8:
	mov r2, r5
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016770 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r7
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016770 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016770 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #0xa
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r0, r0, asr #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r0, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldr r0, _02016770 ; =_020AF760
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r1, #0x1000
	mov r2, #0
	mov r3, #4
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r3, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r2, r0, asr #0x10
	strb r3, [r4, #0x3c]
	strh r2, [r4]
	strh r1, [r4, #2]
	mov r0, #0xa
	strb r0, [r4, #0x3e]
	strh r2, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #0x21
	cmp r5, #0
	strh r0, [r4, #0x2a]
	beq _02016760
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x60]
	bl sub_0201F324
	mov r1, #2
	strb r1, [r0, #0x3c]
	mov r1, #0
	strh r1, [r0]
	mov r1, #0x3b
	strh r1, [r0, #2]
	mov r1, #0x100
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	mov r2, #0xa
	mov r1, r6
	strb r2, [r0, #0x3e]
	mov r2, #0x21
	strh r2, [r0, #0x2a]
	bl sub_02016118
	b _02016768
_02016760:
	mov r0, #0x80
	bl sub_02015EE8
_02016768:
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02016770: .word _020AF760
	arm_func_end sub_02016548

	arm_func_start sub_02016774
sub_02016774: ; 0x02016774
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_02016774

	arm_func_start sub_02016788
sub_02016788: ; 0x02016788
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r1, r3
	mov r2, #0
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r4
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r5
	add r0, sp, #0
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016788

	arm_func_start sub_020167FC
sub_020167FC: ; 0x020167FC
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_020167FC

	arm_func_start sub_02016814
sub_02016814: ; 0x02016814
	stmdb sp!, {r4, lr}
	ldr r0, _02016880 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016884 ; =_020AF760
	ldr r1, _02016880 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016880: .word 0x0000B160
_02016884: .word _020AF760
	arm_func_end sub_02016814

	arm_func_start sub_02016888
sub_02016888: ; 0x02016888
	stmdb sp!, {r3, lr}
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x100
	bl sub_02015EE8
	bl sub_0201F2E4
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020168C4 ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020168C4: .word _020AF760
	arm_func_end sub_02016888

	arm_func_start sub_020168C8
sub_020168C8: ; 0x020168C8
	stmdb sp!, {r4, lr}
	ldr r0, _02016934 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016938 ; =_020AF760
	ldr r1, _02016934 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016934: .word 0x0000B160
_02016938: .word _020AF760
	arm_func_end sub_020168C8

	arm_func_start sub_0201693C
sub_0201693C: ; 0x0201693C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x104
	mov r3, r0
	mov r4, r1
	mov r6, r2
	add r0, sp, #4
	mov r1, r3
	mov r2, #1
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016BB4 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r4
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016BB4 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02016BB4 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	rsb r0, r3, #0
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r3, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0x6000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r1, #0x1000
	mov r2, #0
	mov r3, #2
	mov r4, r0
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	strb r2, [r4, #0x3c]
	add r0, r3, #0x100
	strh r0, [r4]
	strh r1, [r4, #2]
	mov r0, #1
	strb r0, [r4, #0x3e]
	strh r3, [r4, #8]
	strh r2, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0xa000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0xb000
	add r1, r1, #0x60
	ldrsh r0, [r0, #0x60]
	add r5, r1, #0xb000
	bl sub_0201F324
	mov r4, r0
	mov r1, #2
	strb r1, [r4, #0x3c]
	mvn r1, #0xff
	strh r1, [r4]
	mov r1, #0x3b
	strh r1, [r4, #2]
	mov r1, #0x100
	strh r1, [r4, #4]
	mov r1, #1
	strh r1, [r4, #6]
	strb r1, [r4, #0x3e]
	mov r2, #0x21
	mov r1, r6
	strh r2, [r4, #0x2a]
	bl sub_02016118
	ldrsh r1, [r4]
	mov r2, #0x1800
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02016BB4 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0x14]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	mov r2, #0x10
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02016BB4: .word _020AF760
	arm_func_end sub_0201693C

	arm_func_start sub_02016BB8
sub_02016BB8: ; 0x02016BB8
	stmdb sp!, {r3, lr}
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0201F2E4
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02016BEC ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016BEC: .word _020AF760
	arm_func_end sub_02016BB8

	arm_func_start sub_02016BF0
sub_02016BF0: ; 0x02016BF0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02016EA8 ; =_020AF760
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02016EA0
	add r2, r1, #0xb000
	ldrsh r0, [r2, #0x60]
	add r1, r1, #0x60
	add r6, r1, #0xb000
	ldr r5, [r2, #0x154]
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _02016C44
	cmp r1, #2
	beq _02016C78
	cmp r1, #3
	moveq r0, #0
	streqb r0, [r6, #0x28]
	b _02016C94
_02016C44:
	ldr r1, [r6, #4]
	ldr r0, [r6, #0x14]
	adds r0, r1, r0
	str r0, [r6, #4]
	bmi _02016C94
	ldrb r2, [r6, #0x28]
	mov r1, #0
	mov r0, #0x2d
	add r2, r2, #1
	strb r2, [r6, #0x28]
	str r1, [r6, #4]
	str r0, [r6, #0x2c]
	b _02016C94
_02016C78:
	ldr r1, [r6, #0x2c]
	sub r0, r1, #1
	str r0, [r6, #0x2c]
	cmp r1, #0
	ldreqb r0, [r6, #0x28]
	addeq r0, r0, #1
	streqb r0, [r6, #0x28]
_02016C94:
	ldr r2, [r6, #4]
	mov r1, r5
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	ldr r1, _02016EA8 ; =_020AF760
	strb r0, [r4, #0x2f]
	ldr r0, [r1, #4]
	mov r2, #0
	add r1, r0, #0xb000
	add r0, r0, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r2, _02016EA8 ; =_020AF760
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r3, [r0, #0x94]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	cmp r1, #0x80
	blt _02016D48
	mov r1, #0
	str r1, [r0, #0xa4]
	ldr r0, [r2, #4]
	mov r1, #0x8000
	add r0, r0, #0xb000
	str r1, [r0, #0x94]
	ldr r4, [r2, #4]
	add r0, r4, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	add r1, r4, #0xb000
	ldr r2, [r1, #0x94]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
_02016D48:
	ldr r0, _02016EA8 ; =_020AF760
	ldr r2, [r0, #4]
	add r0, r2, #0xb000
	ldrsh r0, [r0, #0xc0]
	add r1, r2, #0x90
	add r2, r2, #0x30c0
	add r5, r1, #0xb000
	add r4, r2, #0x8000
	bl sub_0201F324
	ldr r1, [r5, #4]
	ldr r2, _02016EA8 ; =_020AF760
	rsb r3, r1, #0x10000
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	str r3, [r4, #4]
	mov r1, r1, asr #8
	strh r1, [r0]
	ldr r0, [r2, #4]
	add r1, r0, #0xb000
	ldr r3, [r1, #0x20]
	cmp r3, #0x14
	bhi _02016DCC
	subs r0, r3, #0x10
	addpl pc, pc, r0, lsl #2
	b _02016DC0
_02016DAC: ; jump table
	b _02016DE0 ; case 0
	b _02016E00 ; case 1
	b _02016E38 ; case 2
	b _02016E64 ; case 3
	b _02016E84 ; case 4
_02016DC0:
	cmp r3, #0
	beq _02016DD8
	b _02016E98
_02016DCC:
	cmp r3, #0xff
	beq _02016E90
	b _02016E98
_02016DD8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02016DE0:
	mov r0, #1
	strb r0, [r1, #0x88]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E00:
	ldrb r0, [r1, #0x88]
	cmp r0, #0
	bne _02016E98
	mov r3, #1
	strb r3, [r1, #0xb8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	strb r3, [r0, #0xe8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E38:
	ldrb r0, [r1, #0xb8]
	cmp r0, #2
	bne _02016E98
	mov r0, #0x3c
	str r0, [r1, #0x150]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E64:
	ldr r2, [r1, #0x94]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	cmp r0, #0x80
	addge r0, r3, #1
	strge r0, [r1, #0x20]
	b _02016E98
_02016E84:
	mov r0, #0xff
	str r0, [r1, #0x20]
	b _02016E98
_02016E90:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_02016E98:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02016EA0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02016EA8: .word _020AF760
	arm_func_end sub_02016BF0

	arm_func_start sub_02016EAC
sub_02016EAC: ; 0x02016EAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	bl sub_020168C8
	ldr r0, _02017128 ; =0x00000A7C
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201712C ; =_020AF760
	ldr r1, _02017128 ; =0x00000A7C
	str r0, [r2, #8]
	bl MemZero
	ldr r0, _02017130 ; =WAN_TABLE
	ldr r1, _02017134 ; =_02099110
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r2, _02017130 ; =WAN_TABLE
	ldr r3, [r1, #8]
	ldr r1, _02017138 ; =_02099124
	strh r0, [r3, #0x94]
	ldr r0, [r2]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r1, [r1, #8]
	strh r0, [r1, #0x96]
	bl sub_02015F18
	ldr r0, _0201712C ; =_020AF760
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0201712C ; =_020AF760
	ldr r1, [r0, #8]
	add r0, r1, #0x98
	ldrsh r1, [r1, #0x94]
	bl SetSpriteIdForAnimationControl
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r0, _0201712C ; =_020AF760
	str r2, [sp, #0xc]
	ldr r0, [r0, #8]
	mov r1, #0xc
	mov r3, #0x100
	add r0, r0, #0x98
	bl SetAnimationForAnimationControl
	ldr r0, _0201712C ; =_020AF760
	mov r4, #0xd0
	ldr r2, [r0, #8]
	mov r3, #0x6a
	strh r4, [r2, #0xb4]
	ldr r2, [r0, #8]
	mov r1, #0
	strh r3, [r2, #0xb6]
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl sub_0201D12C
	ldr r0, _0201712C ; =_020AF760
	ldr r5, _0201713C ; =_02098FC8
	ldr r7, [r0, #8]
	mov sb, #0
	add r6, r7, #0x114
	mov fp, #1
_02016FB0:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x94]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	mov r0, #0xc
	mul r4, sb, r0
	add sl, r5, r4
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #25
	str fp, [sp]
	add r0, r1, r0, ror #25
	stmib sp, {r0, fp}
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r5, r4]
	mov r0, r8
	mov r2, #0
	mov r3, #0x100
	bl SetAnimationForAnimationControl
	ldr r1, [sl, #4]
	mov r0, r8
	strh r1, [r8, #0x1c]
	ldr r2, [sl, #8]
	mov r1, #0
	strh r2, [r8, #0x1e]
	bl sub_0201D12C
	add sb, sb, #1
	cmp sb, #7
	blt _02016FB0
	ldr r0, _0201712C ; =_020AF760
	ldr r4, _02017140 ; =_02099080
	ldr r7, [r0, #8]
	mov sb, #0
	add r0, r7, #0x7c
	add r6, r0, #0x400
	mov r5, #0x40
	mov fp, #0xc
_02017054:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x96]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	strh r5, [r8, #0x38]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mul r0, sb, fp
	mov r2, #0
	ldr r1, [r4, r0]
	add sl, r4, r0
	mov r0, r8
	mov r3, r2
	bl SetAnimationForAnimationControl
	ldr r0, [sl, #4]
	cmp sb, #6
	strh r0, [r8, #0x1c]
	ldr r0, [sl, #8]
	strh r0, [r8, #0x1e]
	blt _020170D8
	add r3, r7, sb, lsl #2
	ldr r2, [r3, #0xa34]
	mov r0, r8
	mov r1, #0
	str r2, [r3, #0xa4c]
	bl sub_0201D12C
	b _020170FC
_020170D8:
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r2, r1, r0, ror #28
	add r1, r7, sb, lsl #2
	str r2, [r1, #0xa4c]
	mov r0, r8
	mov r1, #1
	bl sub_0201D12C
_020170FC:
	add sb, sb, #1
	cmp sb, #0xc
	blt _02017054
	mov r0, #2
	bl sub_0206AA5C
	bl sub_0206AB98
	bl sub_0206ABB0
	mov r0, #0x2d
	bl sub_0206ADA0
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017128: .word 0x00000A7C
_0201712C: .word _020AF760
_02017130: .word WAN_TABLE
_02017134: .word _02099110
_02017138: .word _02099124
_0201713C: .word _02098FC8
_02017140: .word _02099080
	arm_func_end sub_02016EAC

	arm_func_start sub_02017144
sub_02017144: ; 0x02017144
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r2, r0
	mov r4, r1
	mov r1, r2
	add r0, sp, #4
	mov r2, #1
	bl sub_020175F8
	mov r1, #0
	str r1, [sp]
	ldr r0, _02017310 ; =_020AF760
	add r3, sp, #4
	ldr r0, [r0, #4]
	mov r1, r4
	mov r2, #2
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02017310 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02017310 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	sub r2, r1, #0x100
	strh r2, [r4]
	mov r2, #0x20
	strh r2, [r4, #2]
	mov r2, #1
	strb r2, [r4, #0x3e]
	mov r3, #0x21
	strh r3, [r4, #0x2a]
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4]
	mov r2, #0x2000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02017310 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	mov r1, #0x180
	strh r1, [r4]
	mov r1, #0x52
	strh r1, [r4, #2]
	mov r1, #0x80
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	mov r1, #0x21
	strh r1, [r4, #0x2a]
	mov r1, #1
	strb r1, [r4, #0x3e]
	mov r1, #0x1000
	mov r3, #2
	bl sub_0201604C
	ldrsh r1, [r4]
	mov r2, #0x8000
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02017310 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0xc]
	ldr r4, [r5, #8]
	mov r2, #0x10
	str r4, [r5, #0x10]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02017310: .word _020AF760
	arm_func_end sub_02017144

	arm_func_start sub_02017314
sub_02017314: ; 0x02017314
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r0, _02017588 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0201757C
	bl sub_0206ADB8
	bl sub_0206AD4C
	cmp r0, #0
	bne _0201757C
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldmib r0, {r3, r4}
	add r1, r3, #0xb000
	add r0, r3, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldr r0, [r0, #4]
	add r1, r0, #0xb000
	add r0, r0, #0x30c0
	ldr r1, [r1, #0x154]
	add r0, r0, #0x8000
	bl sub_020177AC
	ldr r1, _02017588 ; =_020AF760
	ldr r5, [r1, #4]
	add r0, r5, #0xb000
	ldr r3, [r0, #0x20]
	cmp r3, #0x13
	bhi _020173BC
	subs r2, r3, #0x10
	addpl pc, pc, r2, lsl #2
	b _020173B0
_020173A0: ; jump table
	b _020173D0 ; case 0
	b _020173FC ; case 1
	b _02017438 ; case 2
	b _02017464 ; case 3
_020173B0:
	cmp r3, #0
	beq _020173C8
	b _020174A8
_020173BC:
	cmp r3, #0xff
	beq _020174A0
	b _020174A8
_020173C8:
	mov r0, #0
	b _02017580
_020173D0:
	mov r2, #1
	strb r2, [r0, #0xb8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	strb r2, [r0, #0xe8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _020174A8
_020173FC:
	ldr r1, [r0, #0xd4]
	cmp r1, #0
	ldrne r0, [r0, #0xa4]
	cmpne r0, #0
	bne _020174A8
	add r0, r5, #0xb000
	ldr r2, [r0, #0x20]
	ldr r1, _02017588 ; =_020AF760
	add r2, r2, #1
	str r2, [r0, #0x20]
	ldr r0, [r1, #4]
	mov r1, #0x14
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	b _020174A8
_02017438:
	ldr r2, [r0, #0x150]
	sub r2, r2, #1
	str r2, [r0, #0x150]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x150]
	cmp r1, #0
	ldreq r1, [r0, #0x20]
	addeq r1, r1, #1
	streq r1, [r0, #0x20]
	b _020174A8
_02017464:
	add r0, r4, #0x98
	bl DisplayAndSwitchAnimationControlCurrentFrame
	add r0, r4, #0x98
	bl sub_0201D1B0
	cmp r0, #0
	bne _020174A8
	ldr r0, _02017588 ; =_020AF760
	mov r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldr r2, [r0, #0x20]
	add r2, r2, #1
	str r2, [r0, #0x20]
	strb r1, [r4, #0x478]
	b _020174A8
_020174A0:
	mov r0, #2
	b _02017580
_020174A8:
	ldrb r0, [r4, #0x478]
	cmp r0, #0
	beq _020174D4
	mov r7, #0
	add r6, r4, #0x114
	mov r5, #0x7c
_020174C0:
	mla r0, r7, r5, r6
	bl DisplayAndSwitchAnimationControlCurrentFrame
	add r7, r7, #1
	cmp r7, #7
	blt _020174C0
_020174D4:
	mov r8, #0
	add r0, r4, #0x7c
	add r7, r0, #0x400
	mov fp, r8
	mov r6, #1
	mov r5, #0x7c
_020174EC:
	add r1, r4, r8, lsl #2
	ldr r0, [r1, #0xa4c]
	cmp r0, #0
	bne _02017560
	mla sb, r8, r5, r7
	mov r0, sb
	bl sub_0201D1B0
	cmp r0, #0
	bne _02017554
	ldrsh sl, [sb, #0x78]
	cmp sl, #0
	beq _02017554
	and r0, sl, #1
	cmp r0, #1
	mov r0, sb
	addeq sl, sl, #1
	bl sub_0201C108
	str fp, [sp]
	str fp, [sp, #4]
	str r6, [sp, #8]
	mov r0, sb
	mov r1, sl
	mov r2, fp
	mov r3, fp
	str fp, [sp, #0xc]
	bl SetAnimationForAnimationControl
_02017554:
	mov r0, sb
	bl DisplayAndSwitchAnimationControlCurrentFrame
	b _02017568
_02017560:
	sub r0, r0, #1
	str r0, [r1, #0xa4c]
_02017568:
	add r8, r8, #1
	cmp r8, #0xc
	blt _020174EC
	mov r0, #1
	b _02017580
_0201757C:
	mov r0, #0
_02017580:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017588: .word _020AF760
	arm_func_end sub_02017A00

	arm_func_start sub_0201758C
sub_0201758C: ; 0x0201758C
	stmdb sp!, {r3, lr}
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020175E4
	ldr r0, _020175F4 ; =WAN_TABLE
	ldrsh r1, [r1, #0x94]
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, _020175F4 ; =WAN_TABLE
	ldr r2, [r0, #8]
	ldr r0, [r1]
	ldrsh r1, [r2, #0x96]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020175F0 ; =_020AF760
	mov r1, #0
	str r1, [r0, #8]
	bl ov10_022BDADC
_020175E4:
	bl sub_0206BA5C
	bl sub_02016BB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020175F0: .word _020AF760
_020175F4: .word WAN_TABLE
	arm_func_end sub_0201758C

	arm_func_start sub_020175F8
sub_020175F8: ; 0x020175F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x80
#ifdef JAPAN
	mov r8, r0
	cmp r2, #0
	movne r7, #0x3a
	mov sb, r1
	mvn r0, #0
	moveq r7, #0x38
	cmp sb, r0
	beq _02017708
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r6, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r5, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r6, #0
	and r2, r1, #0xff
	addne r0, r6, #0x4f
	movne r1, #0x82
	strneb r1, [r4]
	strneb r0, [r4, #1]
	addne r4, r4, #2
	cmp r5, #0
	beq _020176B4
	mov r0, #0x82
	strb r0, [r4]
	add r0, r5, #0x4f
	strb r0, [r4, #1]
	add r4, r4, #2
	b _020176CC_JP
_020176B4:
	cmp r6, #0
	movne r0, #0x82
	strneb r0, [r4]
	addne r0, r5, #0x4f
	strneb r0, [r4, #1]
	addne r4, r4, #2
_020176CC_JP:
	mov r0, #0x82
	strb r0, [r4]
	add r2, r2, #0x4f
	strb r2, [r4, #1]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r7
	strb r2, [r4, #2]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
	bl SprintfStatic__020176E4
	b _020176CC
_02017708:
	add r0, sp, #0
	mov r1, #0x39
	bl GetStringFromFileVeneer
	add r0, sp, #0x40
	mov r1, r7
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
#else
	cmp r2, #0
	ldrne r5, _020176D4 ; =0x00000171
	mov r6, r0
	mov sb, r1
	mvn r0, #0
	ldreq r5, _020176D8 ; =0x0000016F
	cmp sb, r0
	beq _020176B0
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r8, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r7, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r8, #0
	addne r0, r8, #0x30
	strneb r0, [r4], #1
	cmp r7, #0
	addne r0, r7, #0x30
	and r1, r1, #0xff
	strneb r0, [r4], #1
	bne _0201767C
	cmp r8, #0
	addne r0, r7, #0x30
	strneb r0, [r4], #1
_0201767C:
	add r2, r1, #0x30
	strb r2, [r4]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r5
	strb r2, [r4, #1]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r6
	bl SprintfStatic__020176E4
	b _020176CC
_020176B0:
	add r0, sp, #0x40
	mov r1, #0x170
	bl GetStringFromFileVeneer
	ldr r1, _020176E0 ; =_02099140
	add r2, sp, #0x40
	mov r0, r6
#endif
	bl SprintfStatic__020176E4
_020176CC:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_020176DC: .word _02099138
#else
_020176D4: .word 0x00000171
_020176D8: .word 0x0000016F
_020176DC: .word _02099138
_020176E0: .word _02099140
#endif
	arm_func_end sub_020175F8

	arm_func_start SprintfStatic__020176E4
SprintfStatic__020176E4: ; 0x020176E4
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
	arm_func_end SprintfStatic__020176E4

	arm_func_start sub_0201770C
sub_0201770C: ; 0x0201770C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r1, #0x6000
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl MemZero
	ldr r2, [sp, #0x18]
	mov r1, #0
	mov r0, r7
	str r2, [sp]
	mov r2, r1
	mov r3, r4
	bl sub_0201578C
	add r0, r7, #0x6000
	mov r1, r7
	mov r2, #0x20
	bl sub_02015FDC
	add r0, r7, #0x6000
	mov r1, #0
	mov r2, #0x1000
	bl sub_02016038
	mov r0, r7
	mov r1, #0x6000
	bl MemZero
	str r5, [sp]
	mov r3, r6
	mov r0, r7
	mov r1, #0
	mov r2, r1
	bl sub_0201578C
	add r0, r7, #0x7000
	mov r1, r7
	mov r2, #0x80
	bl sub_02015FDC
	add r0, r7, #0x7000
	mov r1, #0x1000
	mov r2, #0x4000
	bl sub_02016038
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201770C

	arm_func_start sub_020177AC
sub_020177AC: ; 0x020177AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldrsh r0, [r6]
	mov r5, r1
	mov r7, r2
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _020177E8
	cmp r1, #2
	beq _02017848
	cmp r1, #3
	beq _02017858
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020177E8:
	cmp r7, #0
	mov r3, #0x80
	beq _02017820
	mov r0, #0
	str r0, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017820:
	str r3, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017848:
	cmp r5, #0
	addeq r0, r1, #1
	streqb r0, [r6, #0x28]
	b _02017868
_02017858:
	mov r0, #0xff
	strb r0, [r6, #0x28]
	mov r0, #0
	str r0, [r6, #0x14]
_02017868:
	ldr r2, [r6, #4]
	ldr r0, [r6, #0x14]
	mov r1, r5
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	str r2, [r6, #4]
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	strb r0, [r4, #0x2f]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020177AC

	arm_func_start sub_020178A8
sub_020178A8: ; 0x020178A8
	stmdb sp!, {r4, r5, r6, r7, lr}
#ifdef EUROPE
	sub sp, sp, #0x254
	mov r4, r1
	and r1, r4, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r5, r0
	cmp r5, r7
	and r6, r4, #0xff
	beq _020179BC
	bl GetNbFloors
	cmp r0, #1
	moveq r6, #0
_020179BC:
	mov r1, r7
	and r2, r4, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, r5
	bl DungeonGoesUp
	cmp r0, #0
	movne r2, r6
	rsbeq r2, r6, #0
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #0x54
	str r2, [sp, #0x28]
	bl SprintfStatic__02017A40
	add r5, sp, #4
	add r0, sp, #0x154
	add r2, sp, #0x54
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	bl sub_02015570
	cmp r6, #0
	mov r0, r4
	beq _02017A70
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r5, r0, #0xc0
	mov r0, r5, asr #1
	mov r1, r4
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r5, asr #1
	add r1, r0, #0x20
	add r2, sp, #0x154
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _02017A8C
_02017A70:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
_02017A8C:
	bl sub_02015E6C
	add sp, sp, #0x254
#else
	sub sp, sp, #0x104
	mov r5, r1
	and r1, r5, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r6, r0
	cmp r6, r7
	and r4, r5, #0xff
	beq _020178DC
	bl GetNbFloors
	cmp r0, #1
	moveq r4, #0
_020178DC:
	mov r1, r7
	and r2, r5, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r5, r0
	mov r0, r6
	bl DungeonGoesUp
	cmp r0, #0
	ldrne r0, _020179FC ; =_020AF76C
	ldrne r7, [r0]
	ldreq r0, _020179FC ; =_020AF76C
	ldreq r7, [r0, #4]
	cmp r4, #0xa
	blo _02017954
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	mov r6, r0
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	add r1, r1, #0x30
	ldr r0, _020179FC ; =_020AF76C
	str r1, [sp]
	ldr r1, [r0, #8]
	add r0, sp, #4
	mov r2, r7
	add r3, r6, #0x30
	bl SprintfStatic__02017A40
	b _0201797C
_02017954:
	cmp r4, #0
	moveq r0, #0
	streqb r0, [sp, #4]
	beq _0201797C
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #4
	ldr r1, [r1, #0xc]
	mov r2, r7
	add r3, r4, #0x30
	bl SprintfStatic__02017A40
_0201797C:
	bl sub_02015570
	cmp r4, #0
	mov r0, r5
	beq _020179D4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r4, r0, #0xc0
	mov r0, r4, asr #1
	mov r1, r5
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r4, asr #1
	add r1, r0, #0x20
	add r2, sp, #4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _020179F0
_020179D4:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r5
	mov r0, r0, asr #1
	bl sub_02015E44
_020179F0:
	bl sub_02015E6C
	add sp, sp, #0x104
#endif
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_020179FC: .word _0209958C
#else
_020179FC: .word _020AF76C
#endif
	arm_func_end sub_020178A8

	arm_func_start sub_02017A00
sub_02017A00: ; 0x02017A00
	stmdb sp!, {r3, lr}
	bl sub_02015570
	ldr r1, _02017A1C ; =0x000044BD
	mov r0, #0x3e
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A1C: .word 0x000044BF
#elif defined(JAPAN)
_02017A1C: .word 0x0000076D
#else
_02017A1C: .word 0x000044BD
#endif
	arm_func_end sub_02017A00

	arm_func_start sub_02017A20
sub_02017A20: ; 0x02017A20
	stmdb sp!, {r3, lr}
	bl sub_02015570
#ifdef JAPAN
	mov r0, #0x3e
	add r1, r0, #0x730
#else
	ldr r1, _02017A3C ; =0x000044BE
	mov r0, #0x3e
#endif
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A3C: .word 0x000044C0
#elif !defined(JAPAN)
_02017A3C: .word 0x000044BE
#endif
	arm_func_end sub_02017A20

	arm_func_start SprintfStatic__02017A40
SprintfStatic__02017A40: ; 0x02017A40
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
	arm_func_end SprintfStatic__02017A40

	arm_func_start sub_02017A68
sub_02017A68: ; 0x02017A68
	ldr r0, _02017A7C ; =_022A4BE8
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_02017A7C: .word _022A4BE8
	arm_func_end sub_02017A68

	arm_func_start sub_02017A80
sub_02017A80: ; 0x02017A80
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0, #2]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0, #2]
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0]
	bx lr
	.align 2, 0
_02017AAC: .word _022A4BE8
	arm_func_end sub_02017A80

	arm_func_start sub_02017AB0
sub_02017AB0: ; 0x02017AB0
	stmdb sp!, {r3, lr}
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldmia sp!, {r3, pc}
	arm_func_end sub_02017AB0

	arm_func_start sub_02017ACC
sub_02017ACC: ; 0x02017ACC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017F28
	mov r0, r4
	bl sub_02018158
	ldr r0, _02017AFC ; =0x000003E6
	mov r1, r4
	bl sub_02018460
	mov r1, r4
	mov r0, #0x3f00
	bl sub_02018460
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017AFC: .word 0x000003E6
	arm_func_end sub_02017ACC

	arm_func_start sub_02017B00
sub_02017B00: ; 0x02017B00
	ldr ip, _02017B08 ; =sub_02017D80
	bx ip
	.align 2, 0
_02017B08: .word sub_02017D80
	arm_func_end sub_02017B00

	arm_func_start sub_02017B0C
sub_02017B0C: ; 0x02017B0C
	ldr ip, _02017B14 ; =sub_02017DE8
	bx ip
	.align 2, 0
_02017B14: .word sub_02017DE8
	arm_func_end sub_02017B0C

	arm_func_start sub_02017B18
sub_02017B18: ; 0x02017B18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017D80
	ldr r1, _02017B54 ; =0x000003E7
	cmp r4, r1
	bne _02017B40
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017B4C
_02017B40:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017B4C:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017B54: .word 0x000003E7
	arm_func_end sub_02017B18

	arm_func_start PlayBgmByIdVeneer
PlayBgmByIdVeneer: ; 0x02017B58
	ldr ip, _02017B60 ; =PlayBgmById
	bx ip
	.align 2, 0
_02017B60: .word PlayBgmById
	arm_func_end PlayBgmByIdVeneer

	arm_func_start PlayBgmByIdVolumeVeneer
PlayBgmByIdVolumeVeneer: ; 0x02017B64
	ldr ip, _02017B6C ; =PlayBgmByIdVolume
	bx ip
	.align 2, 0
_02017B6C: .word PlayBgmByIdVolume
	arm_func_end PlayBgmByIdVolumeVeneer

	arm_func_start sub_02017B70
sub_02017B70: ; 0x02017B70
	ldr ip, _02017B78 ; =StopBgmCommand
	bx ip
	.align 2, 0
_02017B78: .word StopBgmCommand
	arm_func_end sub_02017B70

	arm_func_start sub_02017B7C
sub_02017B7C: ; 0x02017B7C
	ldr ip, _02017B84 ; =sub_02017F28
	bx ip
	.align 2, 0
_02017B84: .word sub_02017F28
	arm_func_end sub_02017B7C

	arm_func_start sub_02017B88
sub_02017B88: ; 0x02017B88
	ldr ip, _02017B90 ; =sub_02017F64
	bx ip
	.align 2, 0
_02017B90: .word sub_02017F64
	arm_func_end sub_02017B88

	arm_func_start sub_02017B94
sub_02017B94: ; 0x02017B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017FBC
	ldr r1, _02017BD0 ; =0x000003E7
	cmp r4, r1
	bne _02017BBC
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017BC8
_02017BBC:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017BC8:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017BD0: .word 0x000003E7
	arm_func_end sub_02017B94

	arm_func_start sub_02017BD4
sub_02017BD4: ; 0x02017BD4
	ldr ip, _02017BDC ; =sub_02018024
	bx ip
	.align 2, 0
_02017BDC: .word sub_02018024
	arm_func_end sub_02017BD4

	arm_func_start sub_02017BE0
sub_02017BE0: ; 0x02017BE0
	ldr ip, _02017BE8 ; =sub_020180A0
	bx ip
	.align 2, 0
_02017BE8: .word sub_020180A0
	arm_func_end sub_02017BE0

	arm_func_start sub_02017BEC
sub_02017BEC: ; 0x02017BEC
	ldr ip, _02017BF4 ; =sub_02018118
	bx ip
	.align 2, 0
_02017BF4: .word sub_02018118
	arm_func_end sub_02017BEC

	arm_func_start sub_02017BF8
sub_02017BF8: ; 0x02017BF8
	ldr ip, _02017C00 ; =sub_02018158
	bx ip
	.align 2, 0
_02017C00: .word sub_02018158
	arm_func_end sub_02017BF8

	arm_func_start sub_02017C04
sub_02017C04: ; 0x02017C04
	ldr ip, _02017C0C ; =sub_02018194
	bx ip
	.align 2, 0
_02017C0C: .word sub_02018194
	arm_func_end sub_02017C04

	arm_func_start IsMePlaying
IsMePlaying: ; 0x02017C10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020181E0
	ldr r1, _02017C4C ; =0x000003E6
	cmp r4, r1
	bne _02017C38
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017C44
_02017C38:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017C44:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017C4C: .word 0x000003E6
	arm_func_end IsMePlaying

	arm_func_start sub_02017C50
sub_02017C50: ; 0x02017C50
	ldr ip, _02017C58 ; =PlayMeById
	bx ip
	.align 2, 0
_02017C58: .word PlayMeById
	arm_func_end sub_02017C50

	arm_func_start sub_02017C5C
sub_02017C5C: ; 0x02017C5C
	ldr ip, _02017C64 ; =sub_02018278
	bx ip
	.align 2, 0
_02017C64: .word sub_02018278
	arm_func_end sub_02017C5C

	arm_func_start sub_02017C68
sub_02017C68: ; 0x02017C68
	ldr ip, _02017C70 ; =sub_020182AC
	bx ip
	.align 2, 0
_02017C70: .word sub_020182AC
	arm_func_end sub_02017C68

	arm_func_start sub_02017C74
sub_02017C74: ; 0x02017C74
	ldr ip, _02017C7C ; =PlaySeByIdVolume
	bx ip
	.align 2, 0
_02017C7C: .word PlaySeByIdVolume
	arm_func_end sub_02017C74

	arm_func_start PlaySeByIdVolumeWrapper
PlaySeByIdVolumeWrapper: ; 0x02017C80
	ldr ip, _02017C8C ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017C8C: .word PlaySeByIdVolume
	arm_func_end PlaySeByIdVolumeWrapper

	arm_func_start sub_02017C90
sub_02017C90: ; 0x02017C90
	ldr ip, _02017C98 ; =sub_0201831C
	bx ip
	.align 2, 0
_02017C98: .word sub_0201831C
	arm_func_end sub_02017C90

	arm_func_start sub_02017C9C
sub_02017C9C: ; 0x02017C9C
	ldr ip, _02017CA4 ; =sub_020183A0
	bx ip
	.align 2, 0
_02017CA4: .word sub_020183A0
	arm_func_end sub_02017C9C

	arm_func_start sub_02017CA8
sub_02017CA8: ; 0x02017CA8
	ldr ip, _02017CB0 ; =sub_020183E4
	bx ip
	.align 2, 0
_02017CB0: .word sub_020183E4
	arm_func_end sub_02017CA8

	arm_func_start sub_02017CB4
sub_02017CB4: ; 0x02017CB4
	ldr ip, _02017CBC ; =sub_02018428
	bx ip
	.align 2, 0
_02017CBC: .word sub_02018428
	arm_func_end sub_02017CB4

	arm_func_start sub_02017CC0
sub_02017CC0: ; 0x02017CC0
	ldr ip, _02017CC8 ; =sub_02018460
	bx ip
	.align 2, 0
_02017CC8: .word sub_02018460
	arm_func_end sub_02017CC0

	arm_func_start PlaySeVolumeWrapper
PlaySeVolumeWrapper: ; 0x02017CCC
	ldr r1, _02017CE4 ; =_0209915C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	ldr ip, _02017CE8 ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017CE4: .word _0209915C
_02017CE8: .word PlaySeByIdVolume
	arm_func_end PlaySeVolumeWrapper

	arm_func_start sub_02017CEC
sub_02017CEC: ; 0x02017CEC
	stmdb sp!, {r3, lr}
	ldr r2, _02017D18 ; =_022A4BE8
	ldrsh r0, [r2]
	cmp r0, #0
	ldmgtia sp!, {r3, pc}
	ldr r0, _02017D1C ; =0x00003F05
	mov r3, #3
	mov r1, #0x100
	strh r3, [r2]
	bl PlaySeByIdVolume
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D18: .word _022A4BE8
_02017D1C: .word 0x00003F05
	arm_func_end sub_02017CEC

	arm_func_start sub_02017D20
sub_02017D20: ; 0x02017D20
	stmdb sp!, {r3, lr}
	bl sub_020184CC
	bl sub_02018B50
	ldr r2, _02017D74 ; =0x000003E7
	ldr r0, _02017D78 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	sub r1, r2, #1
	strh r1, [r0, #0xc]
	mov r1, #0x3f00
	strh r1, [r0, #0x10]
	bl sub_02018C0C
	ldr r0, _02017D7C ; =_020AF77C
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D74: .word 0x000003E7
_02017D78: .word _022A4BEC
_02017D7C: .word _020AF77C
	arm_func_end sub_02017D20

	arm_func_start sub_02017D80
sub_02017D80: ; 0x02017D80
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DAC ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DB0 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DB0 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DAC: .word 0x000003E7
_02017DB0: .word _022A4BEC
	arm_func_end sub_02017D80

	arm_func_start sub_02017DB4
sub_02017DB4: ; 0x02017DB4
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DE0 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DE4 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DE4 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DE0: .word 0x000003E7
_02017DE4: .word _022A4BEC
	arm_func_end sub_02017DB4

	arm_func_start sub_02017DE8
sub_02017DE8: ; 0x02017DE8
	ldr ip, _02017DF0 ; =IsSongOver
	bx ip
	.align 2, 0
_02017DF0: .word IsSongOver
	arm_func_end sub_02017DE8

	arm_func_start PlayBgmById
PlayBgmById: ; 0x02017DF4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02017E68 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _02017E6C ; =_022A4BEC
	ldrneh r0, [r0, #2]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017E6C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1]
	strh r5, [r1, #2]
	mov r0, #3
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017E68: .word 0x000003E7
_02017E6C: .word _022A4BEC
	arm_func_end PlayBgmById

	arm_func_start PlayBgmByIdVolume
PlayBgmByIdVolume: ; 0x02017E70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02017EE0 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02017EE4 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #2]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02017EE4 ; =_022A4BEC
	mov r0, #3
	strh r6, [r1]
	strh r6, [r1, #2]
	strh r4, [r1, #4]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02017EE0: .word 0x000003E7
_02017EE4: .word _022A4BEC
	arm_func_end PlayBgmByIdVolume

	arm_func_start StopBgmCommand
StopBgmCommand: ; 0x02017EE8
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02017F20 ; =0x000003E7
	ldr r1, _02017F24 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	mov r0, #5
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017F20: .word 0x000003E7
_02017F24: .word _022A4BEC
	arm_func_end StopBgmCommand

	arm_func_start sub_02017F28
sub_02017F28: ; 0x02017F28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _02017F5C ; =0x000003E7
	ldr r0, _02017F60 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	mov r0, #5
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017F5C: .word 0x000003E7
_02017F60: .word _022A4BEC
	arm_func_end sub_02017F28

	arm_func_start sub_02017F64
sub_02017F64: ; 0x02017F64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02017FA8 ; =_022A4BEC
	ldr r2, _02017FAC ; =0x000003E7
	ldrh r3, [r3, #2]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017FA8 ; =_022A4BEC
	mov r0, #6
	strh r4, [r1, #4]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017FA8: .word _022A4BEC
_02017FAC: .word 0x000003E7
	arm_func_end sub_02017F64

	arm_func_start sub_02017FB0
sub_02017FB0: ; 0x02017FB0
	ldr ip, _02017FB8 ; =sub_02019D04
	bx ip
	.align 2, 0
_02017FB8: .word sub_02019D04
	arm_func_end sub_02017FB0

	arm_func_start sub_02017FBC
sub_02017FBC: ; 0x02017FBC
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _02017FE8 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017FEC ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02017FEC ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017FE8: .word 0x000003E7
_02017FEC: .word _022A4BEC
	arm_func_end sub_02017FBC

	arm_func_start sub_02017FF0
sub_02017FF0: ; 0x02017FF0
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _0201801C ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02018020 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02018020 ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201801C: .word 0x000003E7
_02018020: .word _022A4BEC
	arm_func_end sub_02017FF0

	arm_func_start sub_02018024
sub_02018024: ; 0x02018024
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018098 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _0201809C ; =_022A4BEC
	ldrneh r0, [r0, #8]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _0201809C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1, #6]
	strh r5, [r1, #8]
	mov r0, #7
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018098: .word 0x000003E7
_0201809C: .word _022A4BEC
	arm_func_end sub_02018024

	arm_func_start sub_020180A0
sub_020180A0: ; 0x020180A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02018110 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02018114 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #8]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02018114 ; =_022A4BEC
	mov r0, #7
	strh r6, [r1, #6]
	strh r6, [r1, #8]
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02018110: .word 0x000003E7
_02018114: .word _022A4BEC
	arm_func_end sub_020180A0

	arm_func_start sub_02018118
sub_02018118: ; 0x02018118
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02018150 ; =0x000003E7
	ldr r1, _02018154 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	mov r0, #9
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018150: .word 0x000003E7
_02018154: .word _022A4BEC
	arm_func_end sub_02018118

	arm_func_start sub_02018158
sub_02018158: ; 0x02018158
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _0201818C ; =0x000003E7
	ldr r0, _02018190 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #9
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201818C: .word 0x000003E7
_02018190: .word _022A4BEC
	arm_func_end sub_02018158

	arm_func_start sub_02018194
sub_02018194: ; 0x02018194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020181D8 ; =_022A4BEC
	ldr r2, _020181DC ; =0x000003E7
	ldrh r3, [r3, #8]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _020181D8 ; =_022A4BEC
	mov r0, #0xa
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020181D8: .word _022A4BEC
_020181DC: .word 0x000003E7
	arm_func_end sub_02018194

	arm_func_start sub_020181E0
sub_020181E0: ; 0x020181E0
	stmdb sp!, {r3, lr}
	bl sub_0201A19C
	ldr r1, _02018204 ; =0x000003E6
	cmp r0, r1
	ldreq r0, _02018208 ; =_022A4BEC
	streqh r1, [r0, #0xc]
	ldrne r0, _02018208 ; =_022A4BEC
	ldrh r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018204: .word 0x000003E6
_02018208: .word _022A4BEC
	arm_func_end sub_020181E0

	arm_func_start PlayMeById
PlayMeById: ; 0x0201820C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018270 ; =0x000003E6
	mov r5, r0
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0xd
	ldmhiia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02018274 ; =_022A4BEC
	mov r0, #0xb
	strh r5, [r1, #0xc]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018270: .word 0x000003E6
_02018274: .word _022A4BEC
	arm_func_end PlayMeById

	arm_func_start sub_02018278
sub_02018278: ; 0x02018278
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r2, _020182A4 ; =0x000003E6
	ldr r1, _020182A8 ; =_022A4BEC
	mov r0, #0xc
	strh r2, [r1, #0xc]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_020182A4: .word 0x000003E6
_020182A8: .word _022A4BEC
	arm_func_end sub_02018278

	arm_func_start sub_020182AC
sub_020182AC: ; 0x020182AC
	ldr ip, _020182B4 ; =sub_0201A480
	bx ip
	.align 2, 0
_020182B4: .word sub_0201A480
	arm_func_end sub_020182AC

	arm_func_start PlaySeByIdVolume
PlaySeByIdVolume: ; 0x020182B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r1, _02018318 ; =_0209916C
	mov r2, r6
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r6, #0x3f00
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0xd
	cmp r5, #0x100
	movhi r5, #0x100
	bl sub_02018A78
	mov r4, r0
	mov r0, #4
	strh r6, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r5, #0
	mov r0, r4
	strh r5, [r4, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018318: .word _0209916C
	arm_func_end PlaySeByIdVolume

	arm_func_start sub_0201831C
sub_0201831C: ; 0x0201831C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r6, r2
	mov r7, r1
	mov r5, r3
	str r6, [sp]
	ldr r1, _0201839C ; =_0209918C
	mov r2, r8
	mov r3, r7
	mov r0, #8
	str r5, [sp, #4]
	bl Debug_Print
	cmp r8, #0x3f00
	beq _02018394
	mov r0, #0xe
	cmp r6, #0x100
	movhi r6, #0x100
	bl sub_02018A78
	mov r4, r0
	strh r8, [r4, #4]
	mov r0, #4
	strh r7, [r4, #6]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r6, #0
	strh r6, [r4, #8]
	mov r0, r4
	strh r5, [r4, #0xa]
	bl SendAudioCommand2
_02018394:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201839C: .word _0209918C
	arm_func_end sub_0201831C

	arm_func_start sub_020183A0
sub_020183A0: ; 0x020183A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _020183E0 ; =_020991C8
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x10
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020183E0: .word _020991C8
	arm_func_end sub_020183A0

	arm_func_start sub_020183E4
sub_020183E4: ; 0x020183E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _02018424 ; =_020991F0
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x11
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xa]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018424: .word _020991F0
	arm_func_end sub_020183E4

	arm_func_start sub_02018428
sub_02018428: ; 0x02018428
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _0201845C ; =_02099210
	mov r2, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r4, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201845C: .word _02099210
	arm_func_end sub_02018428

	arm_func_start sub_02018460
sub_02018460: ; 0x02018460
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02018498 ; =_02099224
	mov r2, r5
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018498: .word _02099224
	arm_func_end sub_02018460

	arm_func_start sub_0201849C
sub_0201849C: ; 0x0201849C
	ldr ip, _020184A4 ; =sub_0201906C
	bx ip
	.align 2, 0
_020184A4: .word sub_0201906C
	arm_func_end sub_0201849C

	arm_func_start sub_020184A8
sub_020184A8: ; 0x020184A8
	ldr ip, _020184B0 ; =sub_02019260
	bx ip
	.align 2, 0
_020184B0: .word sub_02019260
	arm_func_end sub_020184A8

	arm_func_start sub_020184B4
sub_020184B4: ; 0x020184B4
	ldr ip, _020184BC ; =sub_0201929C
	bx ip
	.align 2, 0
_020184BC: .word sub_0201929C
	arm_func_end sub_020184B4

	arm_func_start sub_020184C0
sub_020184C0: ; 0x020184C0
	ldr ip, _020184C8 ; =sub_020192D0
	bx ip
	.align 2, 0
_020184C8: .word sub_020192D0
	arm_func_end sub_020184C0

	arm_func_start sub_020184CC
sub_020184CC: ; 0x020184CC
	stmdb sp!, {r3, lr}
	bl InitSoundSystem
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002C40
	ldr r0, _020185D0 ; =_022A4C00
	mov r1, #0x11
	bl sub_02002F34
	ldr r0, _020185D4 ; =_022A4C28
	mov r1, #0x11
	bl sub_02002F34
	mov r1, #0x10
	ldr r0, _020185D8 ; =_020AF7E4
	mov r2, r1
	bl sub_02002A9C
	mov r2, #0
	ldr r1, _020185DC ; =AUDIO_COMMANDS_BUFFER
	mov r0, r2
_02018510:
	add r2, r2, #1
	cmp r2, #0x10
	str r0, [r1], #0x20
	blt _02018510
	ldr r0, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	ldr r0, [r0, #0x34]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #0x30]
	ldr r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #8]
	ldr r0, [r2, #0x20]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E8 ; =_020AF7AC
	str r0, [r2, #0x1c]
	ldr r0, _020185EC ; =_020AF96C
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F0 ; =_020AFA48
	ldr r1, _020185F4 ; =_020AF784
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F8 ; =_020AF890
	ldr r1, _020185FC ; =_020AF798
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	ldr r0, _020185EC ; =_020AF96C
	bl sub_020027E8
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002CB4
	ldr r0, _020185CC ; =_020AF7C0
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	mov r1, #1
	ldr r0, _020185E0 ; =_020AF780
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020185CC: .word _020AF7C0
_020185D0: .word _022A4C00
_020185D4: .word _022A4C28
_020185D8: .word _020AF7E4
_020185DC: .word AUDIO_COMMANDS_BUFFER
_020185E0: .word _020AF780
_020185E4: .word 0x00000701
_020185E8: .word _020AF7AC
_020185EC: .word _020AF96C
_020185F0: .word _020AFA48
_020185F4: .word _020AF784
_020185F8: .word _020AF890
_020185FC: .word _020AF798
	arm_func_end sub_020184CC

	arm_func_start sub_02018600
sub_02018600: ; 0x02018600
	stmdb sp!, {r3, lr}
	bl ManipBgmPlayback
	ldr r0, _02018624 ; =_020AFA48
	bl sub_020027E8
	ldr r0, _02018628 ; =_020AF890
	bl sub_020027E8
_02018618:
	bl sub_02003AB0
	bl ManipBgmPlayback
	b _02018618
	.align 2, 0
_02018624: .word _020AFA48
_02018628: .word _020AF890
	arm_func_end sub_02018600

	arm_func_start sub_0201862C
sub_0201862C: ; 0x0201862C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #1
	ldr sl, _020187F0 ; =_022A4C28
	ldr sb, _020187F4 ; =_022A4C00
	ldr r4, _020187F8 ; =_020AF780
	mov r6, #2
	mov r5, #0
	add r8, sp, #0
	mov r7, fp
_02018650:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl sub_02002F98
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #1
	ldreqb r0, [r4, #1]
	beq _02018650
	mov r0, r6
	bl Debug_GetDebugFlag
	cmp r0, #0
	bne _020187D0
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _020187D0
_02018698: ; jump table
	b _020187D0 ; case 0
	b _020187D0 ; case 1
	b _020186E0 ; case 2
	b _020186E0 ; case 3
	b _020186E0 ; case 4
	b _020186E0 ; case 5
	b _020186E0 ; case 6
	b _020186E0 ; case 7
	b _020186E0 ; case 8
	b _020186E0 ; case 9
	b _020186E0 ; case 10
	b _020186E0 ; case 11
	b _020186E0 ; case 12
	b _020186F0 ; case 13
	b _020186F0 ; case 14
	b _02018790 ; case 15
	b _020186F0 ; case 16
	b _020186F0 ; case 17
_020186E0:
	mov r0, sl
	mov r2, fp
	bl sub_02002F7C
	b _02018650
_020186F0:
	ldrh r0, [r1, #4]
	bl sub_0201AAA0
	cmp r0, #0
	bne _02018714
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_02018714:
	ldr r3, [sp]
	ldr r0, [r3]
	sub r0, r0, #0xd
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020187D0
_0201872C: ; jump table
	b _02018740 ; case 0
	b _02018750 ; case 1
	b _020187D0 ; case 2
	b _02018768 ; case 3
	b _0201877C ; case 4
_02018740:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	b _020187D0
_02018750:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	b _020187D0
_02018768:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _020187D0
_0201877C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
	b _020187D0
_02018790:
	ldrh r0, [r1, #4]
	cmp r0, #0x3f00
	beq _020187BC
	bl sub_0201AAA0
	cmp r0, #0
	beq _020187BC
	ldr r1, [sp]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl StopSe
	b _020187D0
_020187BC:
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_020187D0:
	ldr r0, _020187FC ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, [sp]
	ldr r0, _020187FC ; =_020AF7C0
	str r5, [r1]
	ldr r1, _02018800 ; =_020AF7E4
	bl sub_02002ECC
	b _02018650
	.align 2, 0
_020187F0: .word _022A4C28
_020187F4: .word _022A4C00
_020187F8: .word _020AF780
_020187FC: .word _020AF7C0
_02018800: .word _020AF7E4
	arm_func_end sub_0201862C

	arm_func_start sub_02018804
sub_02018804: ; 0x02018804
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
_0201880C:
	ldr r0, _02018A64 ; =_022A4C28
	add r1, sp, #0
	mov r2, #1
	bl sub_02002F98
	ldr r3, [sp]
	ldr r0, [r3]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _02018A40
_02018830: ; jump table
	b _02018A40 ; case 0
	b _02018A40 ; case 1
	b _02018878 ; case 2
	b _02018880 ; case 3
	b _020188B4 ; case 4
	b _02018900 ; case 5
	b _0201890C ; case 6
	b _0201891C ; case 7
	b _02018950 ; case 8
	b _0201899C ; case 9
	b _020189A8 ; case 10
	b _020189B8 ; case 11
	b _020189D0 ; case 12
	b _020189DC ; case 13
	b _020189F0 ; case 14
	b _02018A0C ; case 15
	b _02018A1C ; case 16
	b _02018A30 ; case 17
_02018878:
	bl SoundDriverReset
	b _02018A40
_02018880:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201888C
_02018888:
	bl sub_02003AB0
_0201888C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018888
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_020188B4:
	ldr r4, _02018A68 ; =0x000003E6
	b _020188C0
_020188BC:
	bl sub_02003AB0
_020188C0:
	bl sub_0201A19C
	cmp r0, r4
	bne _020188BC
	ldr r4, _02018A6C ; =0x000003E7
	b _020188D8
_020188D4:
	bl sub_02003AB0
_020188D8:
	bl sub_02019824
	cmp r0, r4
	bne _020188D4
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_02018900:
	ldrh r0, [r3, #8]
	bl StopBgm
	b _02018A40
_0201890C:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm
	b _02018A40
_0201891C:
	ldr r4, _02018A68 ; =0x000003E6
	b _02018928
_02018924:
	bl sub_02003AB0
_02018928:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018924
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_02018950:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201895C
_02018958:
	bl sub_02003AB0
_0201895C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018958
	ldr r4, _02018A6C ; =0x000003E7
	b _02018974
_02018970:
	bl sub_02003AB0
_02018974:
	bl sub_02019D58
	cmp r0, r4
	bne _02018970
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_0201899C:
	ldrh r0, [r3, #8]
	bl StopBgm2
	b _02018A40
_020189A8:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm2
	b _02018A40
_020189B8:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	ldrh r2, [r3, #6]
	bl PlayME
	bl sub_02003AB0
	b _02018A40
_020189D0:
	ldrh r0, [r3, #8]
	bl StopME
	b _02018A40
_020189DC:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	bl sub_02003AB0
	b _02018A40
_020189F0:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	bl sub_02003AB0
	b _02018A40
_02018A0C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	bl StopSe
	b _02018A40
_02018A1C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _02018A40
_02018A30:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
_02018A40:
	ldr r0, _02018A70 ; =_020AF7C0
	bl sub_02002CB4
	ldr r2, [sp]
	mov r3, #0
	ldr r0, _02018A70 ; =_020AF7C0
	ldr r1, _02018A74 ; =_020AF7E4
	str r3, [r2]
	bl sub_02002ECC
	b _0201880C
	.align 2, 0
_02018A64: .word _022A4C28
_02018A68: .word 0x000003E6
_02018A6C: .word 0x000003E7
_02018A70: .word _020AF7C0
_02018A74: .word _020AF7E4
	arm_func_end sub_02018804

	arm_func_start sub_02018A78
sub_02018A78: ; 0x02018A78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02018AD8 ; =_020AF7C0
	ldr r1, _02018ADC ; =_020AF7E4
	bl sub_02002D14
	mov r1, #0
	ldr r4, _02018AE0 ; =AUDIO_COMMANDS_BUFFER
	b _02018AC0
_02018A98:
	ldr r0, [r4]
	cmp r0, #0
	bne _02018AB8
	ldr r0, _02018AD8 ; =_020AF7C0
	str r5, [r4]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02018AB8:
	add r1, r1, #1
	add r4, r4, #0x20
_02018AC0:
	cmp r1, #0x10
	blt _02018A98
	ldr r0, _02018AD8 ; =_020AF7C0
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018AD8: .word _020AF7C0
_02018ADC: .word _020AF7E4
_02018AE0: .word AUDIO_COMMANDS_BUFFER
	arm_func_end sub_02018A78

	arm_func_start SendAudioCommand2
SendAudioCommand2: ; 0x02018AE4
	stmdb sp!, {r4, lr}
	ldr r1, _02018B3C ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018B0C
	ldr r0, _02018B40 ; =_022A4C00
	ldr r1, _02018B44 ; =_02099240
	bl sub_02002FB4
_02018B0C:
	ldr r0, _02018B48 ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, _02018B4C ; =_020AF780
	mov r2, #1
	ldr r0, _02018B48 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018B40 ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018B3C: .word _022A4C00
_02018B40: .word _022A4C00
_02018B44: .word _02099240
_02018B48: .word _020AF7C0
_02018B4C: .word _020AF780
	arm_func_end SendAudioCommand2

	arm_func_start sub_02018B50
sub_02018B50: ; 0x02018B50
	ldr ip, _02018B60 ; =sub_02002D14
	ldr r0, _02018B64 ; =_020AF7C0
	ldr r1, _02018B68 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018B60: .word sub_02002D14
_02018B64: .word _020AF7C0
_02018B68: .word _020AF7E4
	arm_func_end sub_02018B50

	arm_func_start AllocAudioCommand
AllocAudioCommand: ; 0x02018B6C
	mov r3, #0
	ldr r2, _02018BA4 ; =AUDIO_COMMANDS_BUFFER
	b _02018B94
_02018B78:
	ldr r1, [r2]
	cmp r1, #0
	streq r0, [r2]
	moveq r0, r2
	bxeq lr
	add r3, r3, #1
	add r2, r2, #0x20
_02018B94:
	cmp r3, #0x10
	blt _02018B78
	mov r0, #0
	bx lr
	.align 2, 0
_02018BA4: .word AUDIO_COMMANDS_BUFFER
	arm_func_end AllocAudioCommand

	arm_func_start SendAudioCommand
SendAudioCommand: ; 0x02018BA8
	stmdb sp!, {r4, lr}
	ldr r1, _02018BF8 ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018BD0
	ldr r0, _02018BFC ; =_022A4C00
	ldr r1, _02018C00 ; =_02099240
	bl sub_02002FB4
_02018BD0:
	ldr r1, _02018C04 ; =_020AF780
	mov r2, #1
	ldr r0, _02018C08 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018BFC ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018BF8: .word _022A4C00
_02018BFC: .word _022A4C00
_02018C00: .word _02099240
_02018C04: .word _020AF780
_02018C08: .word _020AF7C0
	arm_func_end SendAudioCommand

	arm_func_start sub_02018C0C
sub_02018C0C: ; 0x02018C0C
	ldr ip, _02018C1C ; =sub_02002ECC
	ldr r0, _02018C20 ; =_020AF7C0
	ldr r1, _02018C24 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018C1C: .word sub_02002ECC
_02018C20: .word _020AF7C0
_02018C24: .word _020AF7E4
	arm_func_end sub_02018C0C

	arm_func_start InitSoundSystem
InitSoundSystem: ; 0x02018C28
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002C40
	ldr r0, _02018E44 ; =_020AFB28
	mov r1, #4
	bl sub_02002CAC
	bl SND_Init
	ldr r0, _02018E48 ; =0x0000FFFF
	mov r1, #0
	bl Snd_LockChannel
	add r0, sp, #0x10
	bl DseDriver_LoadDefaultSettings
	mov r0, #0x10000
	mov r1, #2
	bl MemAlloc
	ldr r2, _02018E4C ; =_022A4E50
	mov r1, #0x3c000
	str r0, [r2]
	mov r0, #0
	mov r2, #0x14
	mov r3, #2
	bl MemArenaAlloc
	ldr r1, _02018E4C ; =_022A4E50
	mov r2, #0x10000
	str r0, [r1, #4]
	ldr r1, [r1]
	add r0, sp, #0x10
	bl DseDriver_ConfigureHeap
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #4
	bl sub_0206C36C
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0xf
	bl sub_0206C39C
	add r0, sp, #0x10
	bl DseDriver_Init
	ldr r1, _02018E50 ; =_0209939C
	add r0, sp, #8
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp, #8]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E58 ; =_020993B4
	str r1, [r2, #0x80]
	bl Debug_Print0
	ldr r1, _02018E5C ; =_020993D0
	add r0, sp, #8
	bl sub_02019314
	ldr r0, [sp, #8]
	bl DseSe_Load
	mov r1, r0
	ldr r0, _02018E54 ; =_022A4E58
	str r1, [r0, #0x7c]
	ldr r0, _02018E60 ; =_020993E8
	bl Debug_Print0
	ldr r1, _02018E64 ; =_02099404
	add r0, sp, #0
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E68 ; =_02099418
	str r1, [r2, #0x8c]
	bl Debug_Print0
	ldr r1, _02018E6C ; =_02099434
	add r0, sp, #0
	bl sub_02019314
	ldr r0, [sp]
	bl DseSe_Load
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E70 ; =_02099448
	str r1, [r2, #0x88]
	bl Debug_Print0
	ldr r0, _02018E54 ; =_022A4E58
	mov r2, #0
	str r2, [r0, #0xc4]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r2, [r0, #0x44]
	ldr r1, _02018E74 ; =0x000003E7
	str r2, [r0, #0x64]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x48]
	sub r1, r1, #1
	strh r1, [r0, #0x68]
	str r2, [r0, #0x94]
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	strh r1, [r0, #0x9a]
	ldr r0, _02018E78 ; =_022A4E7C
	bl ZInit8
	ldr r0, _02018E7C ; =_022A4E84
	bl ZInit8
	ldr r0, _02018E80 ; =_022A4E8C
	bl ZInit8
	ldr r0, _02018E84 ; =_022A4EA4
	bl ZInit8
	ldr r0, _02018E88 ; =_022A4EAC
	bl ZInit8
	ldr r0, _02018E8C ; =_022A4EB4
	bl ZInit8
	ldr r0, _02018E90 ; =_022A4EC4
	bl ZInit8
	ldr r0, _02018E94 ; =_022A4ECC
	bl ZInit8
	ldr r0, _02018E98 ; =_022A4EF4
	bl ZInit8
	ldr r4, _02018E9C ; =_022A4EFC
	mov r5, #0
_02018E04:
	add r0, r4, r5, lsl #3
	bl ZInit8
	add r5, r5, #1
	cmp r5, #4
	blt _02018E04
	mov r1, #0
	ldr r0, _02018EA0 ; =_020AFB4C
	mov r2, r1
	mov r3, r1
	bl DseSwd_LoadMainBank
	ldr r1, _02018E54 ; =_022A4E58
	str r0, [r1, #4]
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018E44: .word _020AFB28
_02018E48: .word 0x0000FFFF
_02018E4C: .word _022A4E50
_02018E50: .word _0209939C
_02018E54: .word _022A4E58
_02018E58: .word _020993B4
_02018E5C: .word _020993D0
_02018E60: .word _020993E8
_02018E64: .word _02099404
_02018E68: .word _02099418
_02018E6C: .word _02099434
_02018E70: .word _02099448
_02018E74: .word 0x000003E7
_02018E78: .word _022A4E7C
_02018E7C: .word _022A4E84
_02018E80: .word _022A4E8C
_02018E84: .word _022A4EA4
_02018E88: .word _022A4EAC
_02018E8C: .word _022A4EB4
_02018E90: .word _022A4EC4
_02018E94: .word _022A4ECC
_02018E98: .word _022A4EF4
_02018E9C: .word _022A4EFC
_02018EA0: .word _020AFB4C
	arm_func_end InitSoundSystem

	arm_func_start ManipBgmPlayback
ManipBgmPlayback: ; 0x02018EA4
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _02018F5C
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018F0C
	ldr r0, [r0]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02018F0C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _02019054 ; =_02099464
	ldrh r2, [r0, #0x20]
	mov r0, #7
	bl Debug_Print
	bl sub_02019408
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02018F0C:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _0201903C
	ldr r0, [r0, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _0201905C ; =_02099470
	ldrh r2, [r0, #0x48]
	mov r0, #7
	bl Debug_Print
	bl sub_02019488
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
	b _0201903C
_02018F5C:
	cmp r1, #1
	ldreq r1, [r0, #0x64]
	cmpeq r1, #2
	bne _0201903C
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	bl sub_02019508
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019060 ; =0x000003E6
	str r2, [r0, #0x64]
	strh r1, [r0, #0x68]
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018FE0
	ldrh r2, [r0, #0x20]
	ldr r1, _02019064 ; =_0209947C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x22]
	ldr r0, [r0]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02018FE0:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _02019030
	ldrh r2, [r0, #0x48]
	ldr r1, _02019068 ; =_0209948C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x4a]
	ldr r0, [r0, #8]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02019030:
	ldr r0, _02019050 ; =_022A4E58
	mov r1, #0
	str r1, [r0, #0x18]
_0201903C:
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_0201904C: .word _020AFB28
_02019050: .word _022A4E58
_02019054: .word _02099464
_02019058: .word 0x000003E7
_0201905C: .word _02099470
_02019060: .word 0x000003E6
_02019064: .word _0209947C
_02019068: .word _0209948C
	arm_func_end ManipBgmPlayback

	arm_func_start sub_0201906C
sub_0201906C: ; 0x0201906C
	stmdb sp!, {r3, lr}
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _020190C4 ; =_022A4E58
	ldr r1, [r0, #0x94]
	cmp r1, #2
	bne _020190B4
	ldr r0, [r0, #0xdc]
	mov r1, #0
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bne _020190B4
	bl sub_02019790
	ldr r0, _020190C4 ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	mov r1, #0
	str r1, [r0, #0x94]
_020190B4:
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020190C0: .word _020AFB28
_020190C4: .word _022A4E58
	arm_func_end sub_0201906C

	arm_func_start SoundDriverReset
SoundDriverReset: ; 0x020190C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019250 ; =_0209949C
	mov r0, #6
	bl Debug_Print
	ldr r4, _02019254 ; =_022A4E58
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02019184
	ldr r5, _0201924C ; =_020AFB28
	b _0201910C
_020190F8:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201910C:
	ldr r0, [r4, #0x64]
	cmp r0, #1
	beq _020190F8
	cmp r0, #2
	bne _02019174
	ldr r0, _02019254 ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	ble _02019174
	ldr r0, _02019254 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x10]
	bl DseBgm_Stop
	ldr r5, _0201924C ; =_020AFB28
	ldr r4, _02019254 ; =_022A4E58
	b _02019164
_02019150:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019164:
	ldr r0, [r4, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019150
_02019174:
	bl sub_02019508
	ldr r1, _02019258 ; =0x000003E6
	ldr r0, _02019254 ; =_022A4E58
	strh r1, [r0, #0x68]
_02019184:
	mov r7, #0
	ldr r6, _0201925C ; =0x000003E7
	ldr sl, _0201924C ; =_020AFB28
	ldr sb, _02019254 ; =_022A4E58
	mov r8, r7
	mov r4, r7
	mov r5, r7
_020191A0:
	ldr r0, [sb, #0x1c]
	cmp r0, #2
	bne _020191D4
	ldr r0, [sb]
	mov r1, r8
	bl DseBgm_Stop
	ldr r0, [sb]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _020191D4
	bl sub_02019408
	str r7, [sb, #0x1c]
	strh r6, [sb, #0x20]
_020191D4:
	ldr r0, [sb, #0x44]
	cmp r0, #2
	bne _02019208
	ldr r0, [sb, #8]
	mov r1, r5
	bl DseBgm_Stop
	ldr r0, [sb, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019208
	bl sub_02019488
	str r4, [sb, #0x44]
	strh r6, [sb, #0x48]
_02019208:
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	ldrne r0, [sb, #0x44]
	cmpne r0, #0
	beq _02019234
	mov r0, sl
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, sl
	bl sub_02002CB4
	b _020191A0
_02019234:
	mov r0, #0x3f00
	mov r1, #0
	bl StopSe
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0201924C: .word _020AFB28
_02019250: .word _0209949C
_02019254: .word _022A4E58
_02019258: .word 0x000003E6
_0201925C: .word 0x000003E7
	arm_func_end SoundDriverReset

	arm_func_start sub_02019260
sub_02019260: ; 0x02019260
	stmdb sp!, {r3, lr}
	ldr r0, _02019294 ; =_020AFB24
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019298 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #1
	bl sub_0206C620
	ldr r0, _02019294 ; =_020AFB24
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019294: .word _020AFB24
_02019298: .word _020AFB28
	arm_func_end sub_02019260

	arm_func_start sub_0201929C
sub_0201929C: ; 0x0201929C
	stmdb sp!, {r3, lr}
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #0
	bl sub_0206C6BC
	ldr r0, _020192CC ; =0x0000FFFF
	mov r1, #0
	bl Snd_UnlockChannel
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192C8: .word _020AFB28
_020192CC: .word 0x0000FFFF
	arm_func_end sub_0201929C

	arm_func_start sub_020192D0
sub_020192D0: ; 0x020192D0
	stmdb sp!, {r3, lr}
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019300 ; =0x0000FFFF
	mov r1, #0
	bl Snd_LockChannel
	mov r0, #0
	bl sub_0206C754
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192FC: .word _020AFB28
_02019300: .word 0x0000FFFF
	arm_func_end sub_020192D0

	arm_func_start sub_02019304
sub_02019304: ; 0x02019304
	ldr r0, _02019310 ; =_022A4E50
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02019310: .word _022A4E50
	arm_func_end sub_02019304

	arm_func_start sub_02019314
sub_02019314: ; 0x02019314
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019388 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #2
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019388: .word _022A4E50
	arm_func_end sub_02019314

	arm_func_start LoadDseFile
LoadDseFile: ; 0x0201938C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019400 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02019404 ; =0x00000302
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019400: .word _022A4E50
_02019404: .word 0x00000302
	arm_func_end LoadDseFile

	arm_func_start sub_02019408
sub_02019408: ; 0x02019408
	stmdb sp!, {r3, lr}
	ldr r0, _0201947C ; =_022A4E8C
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0]
	bl DseBgm_Unload
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x34]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x24]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x2c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201947C: .word _022A4E8C
_02019480: .word _022A4E58
_02019484: .word _022A4E50
	arm_func_end sub_02019408

	arm_func_start sub_02019488
sub_02019488: ; 0x02019488
	stmdb sp!, {r3, lr}
	ldr r0, _020194FC ; =_022A4EB4
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #8]
	bl DseBgm_Unload
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x5c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x4c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x54]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_020194FC: .word _022A4EB4
_02019500: .word _022A4E58
_02019504: .word _022A4E50
	arm_func_end sub_02019488

	arm_func_start sub_02019508
sub_02019508: ; 0x02019508
	stmdb sp!, {r3, lr}
	ldr r0, _02019568 ; =_022A4ECC
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_Unload
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x14]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x74]
	bl MemLocateUnset
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x6c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019568: .word _022A4ECC
_0201956C: .word _022A4E58
_02019570: .word _022A4E50
	arm_func_end sub_02019508

	arm_func_start PlaySeLoad
PlaySeLoad: ; 0x02019574
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10c
	mov r6, r0
	mov r1, r6, asr #8
	and r4, r1, #0xff
	and r5, r6, #0xff
	bl sub_0201AAA0
	cmp r0, #0
	movne r0, #0
	bne _02019758
	cmp r5, #0
	moveq r0, #0
	beq _02019758
	ldr r0, _02019760 ; =_022A4E58
	ldrh r0, [r0, #0x9a]
	cmp r0, r6
	moveq r0, #1
	beq _02019758
	cmp r0, #0x3f00
	beq _020195C8
	bl sub_02019790
_020195C8:
	ldr r0, _02019760 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x94]
	ldr r1, _02019764 ; =_020AFB6C
	strh r6, [r0, #0x9a]
	mov r2, #0
	str r2, [r0, #0xc4]
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02019768 ; =_020994B0
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _0201976C ; =_020994C0
	add r3, sp, #0xc
	mov r2, r6
	mov r0, #8
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	ldr r0, _02019774 ; =_022A4EF4
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019760 ; =_022A4E58
	ldr r0, [r0, #0x9c]
	bl DseSe_Load
	ldr r2, _02019760 ; =_022A4E58
	add r1, sp, #4
	str r0, [r2, #0xc8]
	add r0, r0, r5, lsl #16
	str r0, [r2, #0xdc]
	mov r2, #4
	bl DseSe_GetUsedBankIDs
	mov r7, r0
	ldr r1, _02019778 ; =_020994D8
	mov r2, r6
	mov r3, r5
	mov r8, #0
	mov r0, #8
	str r7, [sp]
	bl Debug_Print
	mov sb, r8
	add r6, sp, #4
	mov fp, #8
	ldr r5, _0201977C ; =_022A4EFC
	ldr r4, _02019760 ; =_022A4E58
	b _0201970C
_02019684:
	mov r0, sb, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, _02019780 ; =_02099500
	mov r0, fp
	and sl, r2, #0xff
	str r2, [sp]
	mov r2, sb
	mov r3, sl
	bl Debug_Print
	ldr r1, _02019784 ; =_02099514
	mov r2, sl
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _02019788 ; =_02099528
	mov r0, #8
	mov r2, r8
	add r3, sp, #0xc
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	add r0, r5, r8, lsl #3
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	add r0, r4, r8, lsl #3
	mov r1, #0
	ldr r0, [r0, #0xa4]
	mov r2, r1
	bl DseSwd_LoadBank
	add r1, r4, r8, lsl #2
	str r0, [r1, #0xcc]
	add r8, r8, #1
	add sb, sb, #1
_0201970C:
	cmp sb, r7
	blt _02019684
	ldr r0, _02019760 ; =_022A4E58
	cmp r8, #0
	str r8, [r0, #0xc4]
	movne r0, #1
	bne _02019758
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _0201978C ; =_022A4E50
	ldr r1, _02019760 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	mov r0, #0
_02019758:
	add sp, sp, #0x10c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02019760: .word _022A4E58
_02019764: .word _020AFB6C
_02019768: .word _020994B0
_0201976C: .word _020994C0
_02019770: .word _020AFB28
_02019774: .word _022A4EF4
_02019778: .word _020994D8
_0201977C: .word _022A4EFC
_02019780: .word _02099500
_02019784: .word _02099514
_02019788: .word _02099528
_0201978C: .word _022A4E50
	arm_func_end PlaySeLoad

	arm_func_start sub_02019790
sub_02019790: ; 0x02019790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0201981C ; =_022A4E58
	ldr r5, [r4, #0xc4]
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	str r6, [r4, #0xc4]
	ldr r7, _02019820 ; =_022A4E50
	b _020197DC
_020197B4:
	add r0, r4, r6, lsl #2
	ldr r0, [r0, #0xcc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	add r1, r4, r6, lsl #3
	ldr r0, [r7, #4]
	ldr r1, [r1, #0xa4]
	bl MemLocateUnset
	add r6, r6, #1
_020197DC:
	cmp r6, r5
	blt _020197B4
	ldr r0, _0201981C ; =_022A4E58
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _02019820 ; =_022A4E50
	ldr r1, _0201981C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	ldr r0, _0201981C ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201981C: .word _022A4E58
_02019820: .word _022A4E50
	arm_func_end sub_02019790

	arm_func_start sub_02019824
sub_02019824: ; 0x02019824
	stmdb sp!, {r4, lr}
	ldr r0, _02019848 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201984C ; =_022A4E58
	ldr r0, _02019848 ; =_020AFB28
	ldrh r4, [r1, #0x20]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019848: .word _020AFB28
_0201984C: .word _022A4E58
	arm_func_end sub_02019824

	arm_func_start IsSongOver
IsSongOver: ; 0x02019850
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020198B0 ; =_020AFB28
	mov r4, #0
	bl sub_02002CB4
	ldr r0, _020198B4 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _0201989C
	ldr r0, [r0]
	add r2, sp, #0
	mov r1, #0xa
	bl DseSequence_GetParameter
	ldr r0, _020198B4 ; =_022A4E58
	ldr r2, [sp]
	ldr r1, [r0, #0x40]
	cmp r2, r1
	strgt r2, [r0, #0x40]
	movgt r4, #1
_0201989C:
	ldr r0, _020198B0 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020198B0: .word _020AFB28
_020198B4: .word _022A4E58
	arm_func_end IsSongOver

	arm_func_start PlayBgm
PlayBgm: ; 0x020198B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019B00 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019B04 ; =_0209953C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019B08 ; =_022A4E58
	ldrh r0, [r0, #0x48]
	cmp r6, r0
	bne _02019914
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019914:
	ldr r1, _02019B08 ; =_022A4E58
	ldr r0, _02019B0C ; =0x000003E7
	ldrh r1, [r1, #0x20]
	cmp r1, r0
	beq _02019940
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019940:
	cmp r6, #1
	blo _02019950
	cmp r6, #0xc9
	bls _02019970
_02019950:
	ldr r1, _02019B08 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019B0C ; =0x000003E7
	str r0, [r1, #0x1c]
	ldr r0, _02019B00 ; =_020AFB28
	strh r2, [r1, #0x20]
	bl sub_02002E98
	b _02019AF8
_02019970:
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x1c]
	strh r6, [r0, #0x20]
	strh r4, [r0, #0x22]
	mov r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019AE4
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019B10 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B14 ; =_022A4E8C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _02019B18 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B1C ; =_022A4E7C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x24]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019B08 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #4]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019B20 ; =_022A4E50
	ldr r2, _02019B08 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x30]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019B08 ; =_022A4E58
	str r0, [r1, #0x2c]
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019B08 ; =_022A4E58
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x2c]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019A5C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019A5C
	bl FileRom_StopDataTransfer
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	ldr r0, [r0, #0x34]
	bl DseBgm_Load
	ldr r3, _02019B08 ; =_022A4E58
	ldr r1, _02019B24 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019B08 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0]
	mov r2, #1
	bl ResumeBgm
_02019AE4:
	ldr r1, _02019B08 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019B00 ; =_020AFB28
	str r2, [r1, #0x1c]
	bl sub_02002E98
_02019AF8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019B00: .word _020AFB28
_02019B04: .word _0209953C
_02019B08: .word _022A4E58
_02019B0C: .word 0x000003E7
_02019B10: .word _02099554
_02019B14: .word _022A4E8C
_02019B18: .word _0209956C
_02019B1C: .word _022A4E7C
_02019B20: .word _022A4E50
_02019B24: .word sub_0201AABC
	arm_func_end PlayBgm

	arm_func_start StopBgm
StopBgm: ; 0x02019B28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019C40 ; =_02099584
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _02019C44 ; =_022A4E58
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02019C2C
	ldr r6, _02019C3C ; =_020AFB28
	b _02019B78
_02019B64:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_02019B78:
	ldr r0, [r5, #0x1c]
	cmp r0, #1
	beq _02019B64
	cmp r0, #2
	bne _02019C2C
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _02019C44 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2]
	bl DseBgm_Stop
	ldr r0, _02019C44 ; =_022A4E58
	str r4, [sp]
	ldrh r3, [r0, #0x20]
	ldr r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	ldr r0, _02019C48 ; =_02099594
	bl Debug_Print0
	cmp r4, #0
	beq _02019BE4
	ldr r0, _02019C44 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02019C2C
_02019BE4:
	ldr r5, _02019C3C ; =_020AFB28
	ldr r4, _02019C44 ; =_022A4E58
	b _02019C04
_02019BF0:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019C04:
	ldr r0, [r4]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019BF0
	bl sub_02019408
	ldr r0, _02019C44 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019C4C ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02019C2C:
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02019C3C: .word _020AFB28
_02019C40: .word _02099584
_02019C44: .word _022A4E58
_02019C48: .word _02099594
_02019C4C: .word 0x000003E7
	arm_func_end StopBgm

	arm_func_start ChangeBgm
ChangeBgm: ; 0x02019C50
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _02019CF8 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _02019CFC ; =_020995BC
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019D00 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019CE8
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019CE0
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _02019D00 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_02019CE0:
	ldr r0, _02019D00 ; =_022A4E58
	strh r4, [r0, #0x22]
_02019CE8:
	ldr r0, _02019CF8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02019CF8: .word _020AFB28
_02019CFC: .word _020995BC
_02019D00: .word _022A4E58
	arm_func_end ChangeBgm

	arm_func_start sub_02019D04
sub_02019D04: ; 0x02019D04
	stmdb sp!, {r4, lr}
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019D54 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019D3C
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	subgt r1, r1, #1
	movgt r4, #1
	strgt r1, [r0, #0x3c]
	movle r4, #0
	b _02019D40
_02019D3C:
	mov r4, #1
_02019D40:
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D50: .word _020AFB28
_02019D54: .word _022A4E58
	arm_func_end sub_02019D04

	arm_func_start sub_02019D58
sub_02019D58: ; 0x02019D58
	stmdb sp!, {r4, lr}
	ldr r0, _02019D7C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019D80 ; =_022A4E58
	ldr r0, _02019D7C ; =_020AFB28
	ldrh r4, [r1, #0x48]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D7C: .word _020AFB28
_02019D80: .word _022A4E58
	arm_func_end sub_02019D58

	arm_func_start PlayBgm2
PlayBgm2: ; 0x02019D84
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019FC0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019FC4 ; =_020995D0
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019FC8 ; =_022A4E58
	ldrh r0, [r0, #0x20]
	cmp r6, r0
	bne _02019DE0
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019DE0:
	ldr r1, _02019FC8 ; =_022A4E58
	ldr r0, _02019FCC ; =0x000003E7
	ldrh r1, [r1, #0x48]
	cmp r1, r0
	beq _02019E0C
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019E0C:
	cmp r6, #1
	blo _02019E1C
	cmp r6, #0xc9
	bls _02019E3C
_02019E1C:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019FCC ; =0x000003E7
	str r0, [r1, #0x44]
	ldr r0, _02019FC0 ; =_020AFB28
	strh r2, [r1, #0x48]
	bl sub_02002E98
	b _02019FB8
_02019E3C:
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x44]
	strh r6, [r0, #0x48]
	strh r4, [r0, #0x4a]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019FA4
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019FD0 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FD4 ; =_022A4EB4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r1, _02019FD8 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FDC ; =_022A4EA4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x4c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019FC8 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #0xc]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019FE0 ; =_022A4E50
	ldr r2, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x58]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019FC8 ; =_022A4E58
	str r0, [r1, #0x54]
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r2, [r0, #0xc]
	ldr r1, [r0, #0x54]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019F1C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019F1C
	bl FileRom_StopDataTransfer
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #0x5c]
	bl DseBgm_Load
	ldr r3, _02019FC8 ; =_022A4E58
	ldr r1, _02019FE4 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3, #8]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019FC8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #8]
	mov r2, #1
	bl ResumeBgm
_02019FA4:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019FC0 ; =_020AFB28
	str r2, [r1, #0x44]
	bl sub_02002E98
_02019FB8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019FC0: .word _020AFB28
_02019FC4: .word _020995D0
_02019FC8: .word _022A4E58
_02019FCC: .word 0x000003E7
_02019FD0: .word _02099554
_02019FD4: .word _022A4EB4
_02019FD8: .word _0209956C
_02019FDC: .word _022A4EA4
_02019FE0: .word _022A4E50
_02019FE4: .word sub_0201AABC
	arm_func_end PlayBgm2

	arm_func_start StopBgm2
StopBgm2: ; 0x02019FE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A0DC ; =_020995E8
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _0201A0E0 ; =_022A4E58
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0201A0CC
	ldr r6, _0201A0D8 ; =_020AFB28
	b _0201A034
_0201A020:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_0201A034:
	ldr r0, [r5, #0x44]
	cmp r0, #1
	beq _0201A020
	cmp r0, #2
	bne _0201A0CC
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A0E0 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #8]
	bl DseBgm_Stop
	cmp r4, #0
	beq _0201A084
	ldr r0, _0201A0E0 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0201A0CC
_0201A084:
	ldr r5, _0201A0D8 ; =_020AFB28
	ldr r4, _0201A0E0 ; =_022A4E58
	b _0201A0A4
_0201A090:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201A0A4:
	ldr r0, [r4, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A090
	bl sub_02019488
	ldr r0, _0201A0E0 ; =_022A4E58
	mov r2, #0
	ldr r1, _0201A0E4 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
_0201A0CC:
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201A0D8: .word _020AFB28
_0201A0DC: .word _020995E8
_0201A0E0: .word _022A4E58
_0201A0E4: .word 0x000003E7
	arm_func_end StopBgm2

	arm_func_start ChangeBgm2
ChangeBgm2: ; 0x0201A0E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _0201A190 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _0201A194 ; =_020995F8
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A198 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _0201A180
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0201A178
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _0201A198 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1, #8]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_0201A178:
	ldr r0, _0201A198 ; =_022A4E58
	strh r4, [r0, #0x4a]
_0201A180:
	ldr r0, _0201A190 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0201A190: .word _020AFB28
_0201A194: .word _020995F8
_0201A198: .word _022A4E58
	arm_func_end ChangeBgm2

	arm_func_start sub_0201A19C
sub_0201A19C: ; 0x0201A19C
	stmdb sp!, {r4, lr}
	ldr r0, _0201A1C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A1C4 ; =_022A4E58
	ldr r0, _0201A1C0 ; =_020AFB28
	ldrh r4, [r1, #0x68]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A1C0: .word _020AFB28
_0201A1C4: .word _022A4E58
	arm_func_end sub_0201A19C

	arm_func_start PlayME
PlayME: ; 0x0201A1C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _0201A3F0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _0201A3F4 ; =_0209960C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r7, _0201A3F8 ; =_022A4E58
	cmp r6, #0xd
	ldr r0, [r7, #0x18]
	movhi r6, #0
	cmp r0, #0
	bne _0201A2B0
	mov r0, #1
	str r0, [r7, #0x18]
	str r0, [r7, #0x64]
	ldr r8, _0201A3F0 ; =_020AFB28
	strh r6, [r7, #0x68]
_0201A228:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _0201A268
	cmp r0, #2
	bne _0201A250
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0]
	bl DseBgm_Stop
	b _0201A268
_0201A250:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A228
_0201A268:
	ldr r8, _0201A3F0 ; =_020AFB28
	ldr r7, _0201A3F8 ; =_022A4E58
_0201A270:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _0201A304
	cmp r0, #2
	bne _0201A298
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #8]
	bl DseBgm_Stop
	b _0201A304
_0201A298:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A270
_0201A2B0:
	ldr r0, [r7, #0x64]
	cmp r0, #2
	bne _0201A304
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopME
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r8, _0201A3F0 ; =_020AFB28
	b _0201A2F0
_0201A2DC:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A2F0:
	ldr r0, [r7, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A2DC
	bl sub_02019508
_0201A304:
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r0, #1
	str r0, [r1, #0x18]
	str r0, [r1, #0x64]
	ldr r0, _0201A3F0 ; =_020AFB28
	strh r6, [r1, #0x68]
	bl sub_02002E98
	ldr r1, _0201A3FC ; =_02099620
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _0201A400 ; =_022A4ECC
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _0201A404 ; =_02099634
	add r0, sp, #0x18
	bl sprintf
	ldr r0, _0201A408 ; =_022A4EC4
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x6c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r1, _0201A3F8 ; =_022A4E58
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x74]
	bl DseBgm_Load
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #4
	str r0, [r1, #0x10]
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	str r2, [sp, #4]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0201A3F8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #0x10]
	mov r2, #1
	bl ResumeBgm
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #2
	ldr r0, _0201A3F0 ; =_020AFB28
	str r2, [r1, #0x64]
	bl sub_02002E98
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A3F0: .word _020AFB28
_0201A3F4: .word _0209960C
_0201A3F8: .word _022A4E58
_0201A3FC: .word _02099620
_0201A400: .word _022A4ECC
_0201A404: .word _02099634
_0201A408: .word _022A4EC4
	arm_func_end PlayME

	arm_func_start StopME
StopME: ; 0x0201A40C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A478 ; =_02099644
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A47C ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #1
	ldreq r0, [r0, #0x64]
	cmpeq r0, #2
	bne _0201A468
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A47C ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x10]
	bl DseBgm_Stop
_0201A468:
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A474: .word _020AFB28
_0201A478: .word _02099644
_0201A47C: .word _022A4E58
	arm_func_end StopME

	arm_func_start sub_0201A480
sub_0201A480: ; 0x0201A480
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7, asr #8
	ldr r0, _0201A4F4 ; =_020AFB28
	and r5, r7, #0xff
	and r4, r1, #0xff
	mov r6, #0
	bl sub_02002CB4
	cmp r5, #0
	cmpne r4, #0x3f
	beq _0201A4E4
	cmp r4, #1
	bne _0201A4D4
	ldr r0, _0201A4F8 ; =_022A4E58
	mov r1, r5, lsl #0x10
	ldr r0, [r0, #0x88]
	mov r1, r1, lsr #0x10
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	movgt r6, #1
	b _0201A4E4
_0201A4D4:
	ldr r0, _0201A4F8 ; =_022A4E58
	ldrh r0, [r0, #0x98]
	cmp r0, r7
	moveq r6, #1
_0201A4E4:
	ldr r0, _0201A4F4 ; =_020AFB28
	bl sub_02002E98
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201A4F4: .word _020AFB28
_0201A4F8: .word _022A4E58
	arm_func_end sub_0201A480

	arm_func_start PlaySe
PlaySe: ; 0x0201A4FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r5, asr #8
	ldr r0, _0201A660 ; =_020AFB28
	mov r7, r1
	and r6, r2, #0xff
	and r4, r5, #0xff
	bl sub_02002CB4
	ldr r1, _0201A664 ; =_02099650
	mov r2, r5
	mov r3, r7
	mov r0, #8
	bl Debug_Print
	rsb r0, r7, r7, lsl #7
	mov r0, r0, asr #8
	mov r1, #4
	str r0, [sp, #0xc]
	str r1, [sp]
	cmp r4, #0
	beq _0201A650
	cmp r6, #0x3f
	bne _0201A578
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A650
_0201A578:
	cmp r6, #1
	bne _0201A5A0
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A650
_0201A5A0:
	ldr r0, _0201A668 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh r5, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A60C
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r8, _0201A660 ; =_020AFB28
	mov r7, #0
	ldr r6, _0201A668 ; =_022A4E58
	b _0201A5F8
_0201A5E4:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A5F8:
	ldr r0, [r6, #0xdc]
	mov r1, r7
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A5E4
_0201A60C:
	mov r0, r5
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A668 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A650
	ldr r3, _0201A668 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A650:
	ldr r0, _0201A660 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A660: .word _020AFB28
_0201A664: .word _02099650
_0201A668: .word _022A4E58
	arm_func_end PlaySe

	arm_func_start PlaySeFullSpec
PlaySeFullSpec: ; 0x0201A66C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	mov sb, r0
	mov r4, sb, asr #8
	ldr r0, _0201A81C ; =_020AFB28
	mov r8, r1
	mov r7, r2
	mov r6, r3
	and r4, r4, #0xff
	and r5, sb, #0xff
	bl sub_02002CB4
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #8
	ldr r1, _0201A820 ; =_02099660
	mov r2, sb
	mov r3, r8
	bl Debug_Print
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3e8
	mul r0, r8, r0
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r7, r7, lsl #7
	rsb r1, r6, r6, lsl #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x14]
	cmp r5, #0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	add r0, r0, #0x40
	str r0, [sp, #0x18]
	mov r0, #0xc
	str r0, [sp, #8]
	beq _0201A80C
	cmp r4, #0x3f
	bne _0201A734
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A80C
_0201A734:
	cmp r4, #1
	bne _0201A75C
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A80C
_0201A75C:
	ldr r0, _0201A824 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh sb, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A7C8
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r7, _0201A81C ; =_020AFB28
	mov r6, #0
	ldr r4, _0201A824 ; =_022A4E58
	b _0201A7B4
_0201A7A0:
	mov r0, r7
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r7
	bl sub_02002CB4
_0201A7B4:
	ldr r0, [r4, #0xdc]
	mov r1, r6
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A7A0
_0201A7C8:
	mov r0, sb
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A824 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A80C
	ldr r3, _0201A824 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #8
	add r0, r0, r5, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A80C:
	ldr r0, _0201A81C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0201A81C: .word _020AFB28
_0201A820: .word _02099660
_0201A824: .word _022A4E58
	arm_func_end PlaySeFullSpec

	arm_func_start SeChangeVolume
SeChangeVolume: ; 0x0201A828
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A8F4 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A8F8 ; =_02099684
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #4
	rsb r2, r6, r6, lsl #7
	str r0, [sp, #4]
	mov r0, r1, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x10]
	cmp r5, #0
	beq _0201A8E4
	cmp r4, #0x3f
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A8D8
	cmp r4, #1
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A8FC ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A8D8:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A8E4:
	ldr r0, _0201A8F4 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A8F4: .word _020AFB28
_0201A8F8: .word _02099684
_0201A8FC: .word _022A4E58
	arm_func_end SeChangeVolume

	arm_func_start SeChangePan
SeChangePan: ; 0x0201A900
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A9D8 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A9DC ; =_020996A4
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r6, r6, lsl #6
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r2, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r1, #8
	str r1, [sp, #4]
	add r1, r2, #0x40
	mov r0, r0, lsr #0x10
	add r0, r1, r0, lsl #16
	str r0, [sp, #0x14]
	cmp r5, #0
	beq _0201A9C8
	cmp r4, #0x3f
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A9BC
	cmp r4, #1
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A9E0 ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A9BC:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A9C8:
	ldr r0, _0201A9D8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A9D8: .word _020AFB28
_0201A9DC: .word _020996A4
_0201A9E0: .word _022A4E58
	arm_func_end SeChangePan

	arm_func_start StopSe
StopSe: ; 0x0201A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r2, r7, asr #8
	ldr r0, _0201AA94 ; =_020AFB28
	mov r5, r1
	and r6, r2, #0xff
	and r4, r7, #0xff
	bl sub_02002CB4
	ldr r1, _0201AA98 ; =_020996C0
	mov r2, r7
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r7, #0x3f00
	bne _0201AA2C
	mov r0, #0
	bl DseSe_StopAll
	b _0201AA88
_0201AA2C:
	cmp r4, #0
	beq _0201AA88
	cmp r6, #0x3f
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r4, r0, r4, lsl #16
	beq _0201AA64
	cmp r6, #1
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r4, r0, r4, lsl #16
	ldrne r0, _0201AA9C ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r4, r0, r4, lsl #16
_0201AA64:
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl DseSe_Stop
_0201AA88:
	ldr r0, _0201AA94 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201AA94: .word _020AFB28
_0201AA98: .word _020996C0
_0201AA9C: .word _022A4E58
	arm_func_end StopSe

	arm_func_start sub_0201AAA0
sub_0201AAA0: ; 0x0201AAA0
	mov r0, r0, asr #8
	and r0, r0, #0xff
	cmp r0, #0x3f
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0201AAA0

	arm_func_start sub_0201AABC
sub_0201AABC: ; 0x0201AABC
	ldr r1, _0201AAD4 ; =_022A4E58
	mov r0, #0
	ldr r2, [r1, #0x3c]
	add r2, r2, #1
	str r2, [r1, #0x3c]
	bx lr
	.align 2, 0
_0201AAD4: .word _022A4E58
	arm_func_end sub_0201AABC

	arm_func_start FillCopyToFlatVramCommand
FillCopyToFlatVramCommand: ; 0x0201AAD8
	ldrb ip, [sp]
	cmp ip, #1
	cmpne ip, #2
	moveq r3, r3, lsl #1
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldrb r2, [sp]
	ldrh r1, [sp, #4]
	strb r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	mov r0, r3
	bx lr
	arm_func_end FillCopyToFlatVramCommand

	arm_func_start ExecuteCopyToFlatVramCommand
ExecuteCopyToFlatVramCommand: ; 0x0201AB0C
	stmdb sp!, {r3, lr}
	mov ip, r0
	ldr r1, [ip, #4]
	cmp r1, #0
	beq _0201AB7C
	ldrb r0, [ip, #0xe]
	cmp r0, #0
	bne _0201AB40
	mov r0, r1
	ldr r1, [ip, #8]
	ldr r2, [ip]
	bl MTi_CpuCopy32
	ldmia sp!, {r3, pc}
_0201AB40:
	cmp r0, #1
	bne _0201AB60
	ldr r2, [ip]
	ldrh r3, [ip, #0xc]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave
	ldmia sp!, {r3, pc}
_0201AB60:
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [ip]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave0
	ldmia sp!, {r3, pc}
_0201AB7C:
	ldr r1, [ip, #8]
	ldr r2, [ip]
	mov r0, #0
	bl MTi_CpuClear32
	ldmia sp!, {r3, pc}
	arm_func_end ExecuteCopyToFlatVramCommand

	arm_func_start sub_0201AB90
sub_0201AB90: ; 0x0201AB90
	ldr ip, _0201ABA8 ; =MemZero
	add r2, r0, #0xe00
	mov r3, #0
	mov r1, #0xe00
	strh r3, [r2]
	bx ip
	.align 2, 0
_0201ABA8: .word MemZero
	arm_func_end sub_0201AB90

	arm_func_start DecodeFragmentByteAssemblyTable
DecodeFragmentByteAssemblyTable: ; 0x0201ABAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r7, #0
	mov sb, r0
	mov r8, r1
	mov r6, r7
	add r5, sp, #8
	b _0201ABF8
_0201ABCC:
	str r6, [sp]
	str r6, [sp, #4]
	ldr r2, [sb], #0xc
	mov r0, r5
	mov r1, r8
	bl FillCopyToFlatVramCommand
	mov r4, r0
	mov r0, r5
	bl ExecuteCopyToFlatVramCommand
	add r8, r8, r4
	add r7, r7, r4
_0201ABF8:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201ABCC
	mov r0, r7
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DecodeFragmentByteAssemblyTable

	arm_func_start sub_0201AC10
sub_0201AC10: ; 0x0201AC10
	add r0, r0, #0xe00
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201AC10

	arm_func_start sub_0201AC20
sub_0201AC20: ; 0x0201AC20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x10]
	ldrh ip, [sp, #0x14]
	mov r4, r0
	str lr, [sp]
	str ip, [sp, #4]
	add r0, r4, #0xe00
	ldrsh r0, [r0]
	add r0, r4, r0, lsl #4
	bl FillCopyToFlatVramCommand
	add r0, r4, #0xe00
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AC20

	arm_func_start sub_0201AC64
sub_0201AC64: ; 0x0201AC64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	add r4, sl, #0xe00
	mov fp, #1
	mov r5, #0
	b _0201AD30
_0201AC90:
	ldrsh r0, [r4]
	cmp r0, #0xe0
	bge _0201AD3C
	cmp r7, #0
	beq _0201ACB8
	cmp r7, #1
	beq _0201ACD8
	cmp r7, #2
	beq _0201ACF8
	b _0201AD1C
_0201ACB8:
	str r5, [sp]
	str r5, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
	b _0201AD1C
_0201ACD8:
	str fp, [sp]
	str r6, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
	b _0201AD1C
_0201ACF8:
	mov r1, #2
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
_0201AD1C:
	ldrsh r0, [r4]
	add r8, r8, r3
	add sb, sb, #0xc
	add r0, r0, #1
	strh r0, [r4]
_0201AD30:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201AC90
_0201AD3C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0201AC64

	arm_func_start sub_0201AD44
sub_0201AD44: ; 0x0201AD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r0, r6, #0xe00
	ldrsh r5, [r0]
	mov r4, #0
	b _0201AD70
_0201AD5C:
	add r0, r6, r4, lsl #4
	bl ExecuteCopyToFlatVramCommand
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201AD70:
	cmp r4, r5
	blt _0201AD5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AD44

	arm_func_start sub_0201AD7C
sub_0201AD7C: ; 0x0201AD7C
	add r0, r0, #0x14
	bx lr
	arm_func_end sub_0201AD7C

	arm_func_start sub_0201AD84
sub_0201AD84: ; 0x0201AD84
	add r0, r0, #0x50
	bx lr
	arm_func_end sub_0201AD84

	arm_func_start sub_0201AD8C
sub_0201AD8C: ; 0x0201AD8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, r2
	mov r5, #0
	mov ip, #1
	b _0201ADC0
_0201ADA4:
	add r2, r1, r5
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	add r5, r5, #0x10
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADC0:
	cmp r5, r0
	blt _0201ADA4
	mov ip, r0, lsr #0x1f
	rsb r2, ip, r0, lsl #28
	adds r2, ip, r2, ror #28
	beq _0201ADF8
	add r2, r1, r0
	sub r2, r2, #1
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	mov ip, #1
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADF8:
	mov r1, r1, lsl #0x10
	mov r2, r3
	mov r3, r0
	add r0, r4, #0x14
	mov r1, r1, lsr #0x10
	bl FillPaletteDataRgba
	add r0, r4, #0x14
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AD8C

	arm_func_start sub_0201AE1C
sub_0201AE1C: ; 0x0201AE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov lr, #0
	add ip, r4, r1, lsl #1
	mov r5, #1
	b _0201AE50
_0201AE34:
	add r0, r2, lr
	and r0, r0, #0xff
	ldrh r6, [ip, #0x7c]
	mov r0, r0, asr #4
	add lr, lr, #0x10
	orr r0, r6, r5, lsl r0
	strh r0, [ip, #0x7c]
_0201AE50:
	cmp lr, r3
	blt _0201AE34
	mov ip, r3, lsr #0x1f
	rsb r0, ip, r3, lsl #28
	adds r0, ip, r0, ror #28
	beq _0201AE90
	add r0, r2, r3
	sub r0, r0, #1
	and r0, r0, #0xff
	add r6, r4, #0x7c
	mov r5, r1, lsl #1
	ldrh lr, [r6, r5]
	mov r0, r0, asr #4
	mov ip, #1
	orr r0, lr, ip, lsl r0
	strh r0, [r6, r5]
_0201AE90:
	add r0, r2, r1, lsl #8
	mov r1, r0, lsl #0x10
	ldr r2, [sp, #0x10]
	add r0, r4, #0x50
	mov r1, r1, lsr #0x10
	bl FillPaletteDataRgba
	add r0, r4, #0x50
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AE1C

	arm_func_start sub_0201AEB4
sub_0201AEB4: ; 0x0201AEB4
	ldrh r3, [r0, #0x7a]
	mov r1, r1, asr #4
	mov r2, #1
	orr r1, r3, r2, lsl r1
	strh r1, [r0, #0x7a]
	bx lr
	arm_func_end sub_0201AEB4

	arm_func_start sub_0201AECC
sub_0201AECC: ; 0x0201AECC
	stmdb sp!, {r3, lr}
	add lr, r0, #0x7c
	mov ip, r1, lsl #1
	ldrh r3, [lr, ip]
	mov r0, r2, asr #4
	mov r1, #1
	orr r0, r3, r1, lsl r0
	strh r0, [lr, ip]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201AECC

	arm_func_start sub_0201AEF0
sub_0201AEF0: ; 0x0201AEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	strb r4, [r5, #0x79]
	ldrb r0, [r5, #0x78]
	orr r0, r0, #2
	strb r0, [r5, #0x78]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AEF0

	arm_func_start sub_0201AF18
sub_0201AF18: ; 0x0201AF18
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r1, #0
	mov r2, #0x100
	mov r4, r0
	str r1, [sp]
	bl sub_0200A124
	mov r2, #0
	mov r1, r4
	str r2, [sp]
	add r0, r4, #0x14
	mov r3, #0x100
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #4
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF18

	arm_func_start sub_0201AF64
sub_0201AF64: ; 0x0201AF64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r1
	mov ip, #0
	add r0, r4, #0x3c
	mov r1, #2
	mov r2, #0x1000
	str ip, [sp]
	bl sub_0200A124
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0x50
	add r1, r4, #0x3c
	mov r3, #0x1000
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #8
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF64

	arm_func_start sub_0201AFB8
sub_0201AFB8: ; 0x0201AFB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _0201AFE0
	add r0, r4, #0x14
	bl sub_0200A510
	mov r0, r4
	bl sub_0200A180
_0201AFE0:
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x50
	bl sub_0200A510
	add r0, r4, #0x3c
	bl sub_0200A180
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AFB8

	arm_func_start sub_0201B004
sub_0201B004: ; 0x0201B004
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrb r1, [r7, #0x78]
	mov r2, r1, lsl #0x1d
	movs r2, r2, lsr #0x1f
	beq _0201B158
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _0201B14C
	ldrb r0, [r7, #8]
	cmp r0, #0
	beq _0201B150
	mov r4, #0
_0201B038:
	mov r2, r4, lsl #4
	and r0, r2, #0xff
	ldrh r1, [r7, #0x7a]
	mov r0, r0, asr #4
	mov r3, #1
	tst r1, r3, lsl r0
	moveq r3, #0
	tst r3, #0xff
	beq _0201B12C
	mov r0, r2, lsl #0x10
	ldr r1, [r7, #0x10]
	mov r3, r0, asr #0x10
	add r5, r1, r3, lsl #1
	ldr r2, [r7, #0xc]
	mov r0, r5
	mov r1, #0x20
	add r6, r2, r3, lsl #1
	bl DC_FlushRange
	ldr r0, [r7]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0201B0A4
_0201B090: ; jump table
	b _0201B0A4 ; case 0
	b _0201B0C0 ; case 1
	b _0201B0DC ; case 2
	b _0201B0F8 ; case 3
	b _0201B114 ; case 4
_0201B0A4:
	mov r1, #0
_0201B0A8:
	ldrh r0, [r5], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r6], #2
	blt _0201B0A8
	b _0201B12C
_0201B0C0:
	bl GX_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0201B12C
_0201B0DC:
	bl GX_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0201B12C
_0201B0F8:
	bl GXS_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0201B12C
_0201B114:
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0201B12C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	blt _0201B038
	mov r0, #0
	strb r0, [r7, #8]
	b _0201B150
_0201B14C:
	bl sub_0200A184
_0201B150:
	mov r0, #0
	strh r0, [r7, #0x7a]
_0201B158:
	ldrb r0, [r7, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #0x3c
	bl sub_0200A184
	mov r3, #0
	mov r2, r3
_0201B178:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r7, r3, lsl #1
	mov r3, r0, asr #0x10
	strh r2, [r1, #0x7c]
	cmp r3, #0x10
	blt _0201B178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201B004

	arm_func_start sub_0201B198
sub_0201B198: ; 0x0201B198
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r8, r1
	mov r4, r0
	mov r1, #0x70
	mov r7, r2
	mov r6, r3
	bl MemZero
	strb r5, [r4, #0xe]
	strb r6, [r4]
	stmib r4, {r7, r8}
	ldr r0, [r4, #4]
	bl sub_0201AC10
	mov r0, #2
	strh r0, [r4, #0xc]
	cmp r6, #0
	moveq r0, #0x6400000
	movne r0, #0x6600000
	str r0, [r4, #0x64]
	cmp r5, #0
	bne _0201B210
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	mov r3, #0x7000000
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B210:
	cmp r5, #1
	bne _0201B238
	ldr r3, _0201B294 ; =0x07000400
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B238:
	cmp r5, #2
	bne _0201B260
	ldr r3, _0201B298 ; =0x07000380
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B260:
	cmp r5, #3
	bne _0201B284
	ldr r3, _0201B29C ; =0x07000780
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
_0201B284:
	mov r0, r4
	bl sub_0201B2A0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201B294: .word 0x07000400
_0201B298: .word 0x07000380
_0201B29C: .word 0x07000780
	arm_func_end sub_0201B198

	arm_func_start sub_0201B2A0
sub_0201B2A0: ; 0x0201B2A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x40]
	add r0, r4, #0x20
	bl ClearGroupedOamObjsAndGroups
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	mov r1, #0xc
	bl MemZero
	mov r0, #0
	strb r0, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201B2A0

	arm_func_start sub_0201B2DC
sub_0201B2DC: ; 0x0201B2DC
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r6, [r0, #0xc]
	ldrh r4, [r3, #4]
	ldr r5, _0201B384 ; =_020AFC28
	mov lr, r6, lsr #0x1f
	rsb r3, lr, r6, lsl #30
	add r3, lr, r3, ror #30
	mov r3, r3, lsl #1
	ldrsh r3, [r5, r3]
	cmp r4, #0
	ldr lr, [r0, #0x64]
	mul r5, r2, r3
	bne _0201B35C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	cmp r3, #0x10
	bhs _0201B344
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B344:
	mov r3, ip
	add r1, r5, lr
	mov r2, #2
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B35C:
	cmp r4, #1
	bne _0201B37C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
_0201B37C:
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201B384: .word _020AFC28
	arm_func_end sub_0201B2DC

	arm_func_start sub_0201B388
sub_0201B388: ; 0x0201B388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r0, #0xc]
	ldrb ip, [r3, #0xa]
	ldr r5, _0201B438 ; =_020AFC28
	mov r4, lr, lsr #0x1f
	rsb lr, r4, lr, lsl #30
	add r4, r4, lr, ror #30
	mov r4, r4, lsl #1
	ldrsh lr, [r5, r4]
	cmp ip, #0xff
	ldr r4, [r0, #0x64]
	mul r5, r2, lr
	ldreqh r2, [sp, #0x10]
	andeq ip, r2, #0xff
	ldrh r2, [r3, #4]
	cmp r2, #0
	bne _0201B414
	cmp ip, #0x10
	bhs _0201B3F8
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
	b _0201B430
_0201B3F8:
	mov r2, #0
	str r2, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	mov r3, #2
	bl sub_0201AC64
	b _0201B430
_0201B414:
	cmp r2, #1
	bne _0201B430
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
_0201B430:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201B438: .word _020AFC28
	arm_func_end sub_0201B388

	arm_func_start LoadObjPalette
LoadObjPalette: ; 0x0201B43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	ldrb r1, [r6, #0xa]
	mov r7, r0
	ldrh r0, [r6, #4]
	mov r5, r2
	cmp r1, #0xff
	movne r5, r1
	cmp r0, #0
	bne _0201B4B8
	cmp r5, #0x10
	bhs _0201B48C
	ldrsh r2, [r6, #6]
	mov r1, r5, lsl #4
	ldr r0, [r7, #8]
	ldr r3, [r6]
	and r1, r1, #0xff
	and r2, r2, #0xff
	bl sub_0201AD8C
	b _0201B534
_0201B48C:
	ldr r1, [r6]
	sub r0, r5, #0x10
	str r1, [sp]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, [r7, #8]
	and r1, r1, #0xff
	mov r2, #0
	mov r3, #0x10
	bl sub_0201AE1C
	b _0201B534
_0201B4B8:
	cmp r0, #1
	bne _0201B534
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _0201B518
	ldrsh r1, [r6, #6]
	mov r4, #0
	mov sb, #0x10
	mov r0, r1, asr #3
	add r8, r1, r0, lsr #28
	b _0201B50C
_0201B4E4:
	ldr r0, [r6]
	add r1, r5, r4
	add r0, r0, r4, lsl #6
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldr r0, [r7, #8]
	mov r3, sb
	and r1, r1, #0xff
	bl sub_0201AE1C
	add r4, r4, #1
_0201B50C:
	cmp r4, r8, asr #4
	blt _0201B4E4
	b _0201B534
_0201B518:
	ldr r0, [r6]
	and r1, r5, #0xff
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #6]
	ldr r0, [r7, #8]
	bl sub_0201AE1C
_0201B534:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadObjPalette

	arm_func_start sub_0201B53C
sub_0201B53C: ; 0x0201B53C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	mov r5, r3
	ldrh ip, [r4, #4]
	ldr r3, _0201B5F4 ; =_020AFC30
	mov r6, r0
	mov r0, ip, lsl #1
	ldrh r7, [r3, r0]
	mov r3, #0
	cmp r7, #0
	bne _0201B57C
	ldrh r0, [sp, #0x1c]
	cmp r0, #0x10
	movhs r0, #1
	movlo r0, r7
	b _0201B580
_0201B57C:
	mov r0, r7
_0201B580:
	mov ip, r2, lsl #0x10
	ldrsh r2, [r6, #0xc]
	cmp r7, #0
	cmpeq r0, #1
	mov r0, r1
	moveq r3, #1
	mov r1, ip, asr #0x10
	bl sub_0201B5F8
	ldrb r1, [sp, #0x24]
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r1, #0
	bne _0201B5D0
	ldrh ip, [sp, #0x1c]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, r4
	str ip, [sp]
	bl sub_0201B388
_0201B5D0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	bne _0201B5EC
	ldrh r2, [sp, #0x1c]
	mov r0, r6
	mov r1, r4
	bl LoadObjPalette
_0201B5EC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201B5F4: .word _020AFC30
	arm_func_end sub_0201B53C

	arm_func_start sub_0201B5F8
sub_0201B5F8: ; 0x0201B5F8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r5, r1
	mov r1, r4
	add r0, sp, #0
	mov r6, r2
	mov r4, r3
	bl sub_0201B678
	ldrh r3, [sp, #8]
	ldr r0, _0201B670 ; =0x000003FF
	ldr r1, _0201B674 ; =_020996D8
	mov r2, r6, lsl #1
	and r0, r3, r0
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, r2]
	mov r0, r0, asr #0x10
	cmp r4, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	movne r1, #1
	mov r0, r0, asr #0x10
	moveq r1, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	add r0, r5, r0, asr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201B670: .word 0x000003FF
_0201B674: .word _020996D8
	arm_func_end sub_0201B5F8

	arm_func_start sub_0201B678
sub_0201B678: ; 0x0201B678
	ldrh r3, [r1]
	ldr r2, _0201B6D0 ; =0x0000FCFF
	strh r3, [r0]
	ldrh ip, [r1, #2]
	sub r3, r2, #0xb00
	strh ip, [r0, #2]
	ldrh ip, [r1, #4]
	and r2, ip, r2
	strh r2, [r0, #4]
	ldrh r2, [r1, #6]
	and r2, r2, r3
	strh r2, [r0, #6]
	ldrh r2, [r1, #8]
	strh r2, [r0, #8]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	mov r1, r2, lsl #0x16
	and r2, r3, #0xe00
	mov r1, r1, lsr #0x12
	orr r1, r1, r2, asr #9
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201B6D0: .word 0x0000FCFF
	arm_func_end sub_0201B678

	arm_func_start AddWanFragmentToOam
AddWanFragmentToOam: ; 0x0201B6D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, r2
	mov r7, r1
	mov r4, r3
	ldrsh r1, [r6, #4]
	ldrsh r2, [r5, #0xc]
	ldrb r3, [r6, #0xe]
	mov r0, r7
	bl sub_0201B5F8
	ldr r1, [r5, #0x40]
	str r0, [sp, #4]
	cmp r1, #0x80
	mvnge r0, #0
	bge _0201B9A4
	ldrh r2, [r6, #0xa]
	ldrh r3, [r6, #8]
	ldrb sl, [r6, #0xf]
	and r8, r2, #0xff
	ldrh r2, [r6, #0xc]
	add r0, sp, #0x16
	mov r1, r7
	str r2, [sp]
	and sb, r3, #0xff
	ldrh r7, [r6, #6]
	ldrsh fp, [r6, #2]
	ldrsh r6, [r6]
	bl sub_0201B678
	ldrsb r0, [sp, #0x19]
	adds r7, r7, r0
	movmi r7, #0
	cmp r7, #0x140
	ldrge r7, _0201B9AC ; =0x0000013F
	cmp r4, #0
	bne _0201B790
	add r3, sp, #0x1a
	ldrh r0, [r3]
	add r4, sp, #0xe
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	strh r0, [r4]
	ldrh r0, [r3, #6]
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	b _0201B7E8
_0201B790:
	add lr, sp, #0x1a
	ldrh r1, [r4]
	ldrh r2, [lr]
	ldrh r0, [r4, #6]
	add ip, sp, #0xe
	and r1, r2, r1
	orr r0, r0, r1
	strh r0, [ip]
	ldrh r2, [lr, #2]
	ldrh r1, [r4, #2]
	ldrh r3, [r4, #8]
	ldrh r0, [lr, #4]
	and r1, r2, r1
	orr r1, r3, r1
	strh r1, [ip, #2]
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	ldrh r3, [lr, #6]
	and r0, r0, r1
	orr r0, r2, r0
	strh r0, [ip, #4]
	strh r3, [ip, #6]
_0201B7E8:
	ldrh r1, [sp, #0x12]
	mov r2, #0x400
	rsb r2, r2, #0
	and r1, r1, r2
	ldrh r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	and r1, r0, r2, lsr #23
	sub r0, r6, #0x100
	add r4, r1, r0
	ldr r1, [sp, #4]
	ldrh r0, [sp, #0x12]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsr #0x16
	and r1, r2, r1, lsr #16
	orr r1, r0, r1
	mov r3, r4, lsl #0x10
	mov r0, r3, asr #0x10
	strh r1, [sp, #0x12]
	bl sub_0201B9B0
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0x10]
	mov r0, #0x200
	rsb r0, r0, #0
	and r1, r1, r0
	strh r1, [sp, #0x10]
	ldrh r3, [sp, #0x14]
	mov r1, r0, lsr #0x14
	sub r2, fp, #0x200
	and r1, r1, r3, asr #4
	add r6, r1, r2
	ldrh r3, [sp, #0x10]
	mov r1, r6, lsl #0x10
	and r2, r4, r0, lsr #23
	mov r0, r1, asr #0x10
	orr r1, r3, r2
	strh r1, [sp, #0x10]
	bl sub_0201B9D4
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0xe]
	ldrh r0, [sp, #0x14]
	and r2, r6, #0xff
	bic r1, r1, #0xff
	strh r1, [sp, #0xe]
	ldrh r3, [sp, #0xe]
	mov r1, r0, asr #1
	ldr r0, [sp]
	orr r2, r3, r2
	bic r2, r2, #0x2000
	strh r2, [sp, #0xe]
	ldrh r2, [sp, #0xe]
	mov r0, r0, lsl #0x1f
	tst r1, #1
	orr r0, r2, r0, lsr #18
	strh r0, [sp, #0xe]
	bne _0201B928
	cmp sl, #0
	beq _0201B8FC
	ldrh r1, [sp, #0x12]
	mov r0, sb, lsl #0x1c
	bic r1, r1, #0xf000
	strh r1, [sp, #0x12]
	ldrh r1, [sp, #0x12]
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
	b _0201B928
_0201B8FC:
	ldrh r2, [sp, #0x12]
	and r1, sb, #0xf
	bic r0, r2, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r2, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r1
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B928:
	ldrh r1, [sp, #0x12]
	bic r0, r1, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r1, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r8
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B950:
	cmp r7, #0
	mvnlt r0, #1
	blt _0201B9A4
	ldr r1, [r5, #0x40]
	ldr r0, [r5, #0x20]
	cmp r1, r0
	bge _0201B9A0
	ldrh r4, [sp, #0xe]
	ldrh r3, [sp, #0x10]
	ldrh r0, [sp, #0x12]
	add r1, sp, #8
	mov r2, r7
	strh r0, [sp, #0xc]
	strh r4, [sp, #8]
	strh r3, [sp, #0xa]
	add r0, r5, #0x20
	bl AddObjToUngroupedOamObjs
	ldr r0, [r5, #0x40]
	add r0, r0, #1
	str r0, [r5, #0x40]
_0201B9A0:
	mov r0, #0
_0201B9A4:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201B9AC: .word 0x0000013F
	arm_func_end AddWanFragmentToOam

	arm_func_start sub_0201B9B0
sub_0201B9B0: ; 0x0201B9B0
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9C4
	cmp r0, #0x100
	blt _0201B9CC
_0201B9C4:
	mov r0, #1
	bx lr
_0201B9CC:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9B0

	arm_func_start sub_0201B9D4
sub_0201B9D4: ; 0x0201B9D4
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9E8
	cmp r0, #0xc0
	blt _0201B9F0
_0201B9E8:
	mov r0, #1
	bx lr
_0201B9F0:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9D4

	arm_func_start AddSimpleObjToOam
AddSimpleObjToOam: ; 0x0201B9F8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #0x40]
	cmp r3, #0x80
	mvnge r0, #0
	bge _0201BA90
	cmp r2, #0
	blt _0201BA24
	cmp r2, #0x140
	blt _0201BA2C
_0201BA24:
	mvn r0, #1
	b _0201BA90
_0201BA2C:
	ldr r0, [r4, #0x20]
	cmp r3, r0
	bge _0201BA8C
	ldrh lr, [r1]
	ldr r3, _0201BA98 ; =0x00000FFF
	add r0, r4, #0x20
	strh lr, [sp]
	ldrh ip, [r1, #2]
	and lr, lr, #0xff00
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	strh ip, [sp, #4]
	ldrh ip, [r1, #6]
	add r1, sp, #0
	and r3, r3, ip, asr #4
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	and r3, r3, #0xff
	orr r3, lr, r3
	strh r3, [sp]
	bl AddObjToUngroupedOamObjs
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0201BA8C:
	mov r0, #0
_0201BA90:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201BA98: .word 0x00000FFF
	arm_func_end AddSimpleObjToOam

	arm_func_start GroupOamAttributesWrapper
GroupOamAttributesWrapper: ; 0x0201BA9C
	ldr ip, _0201BAA8 ; =GroupOamObjs
	add r0, r0, #0x20
	bx ip
	.align 2, 0
_0201BAA8: .word GroupOamObjs
	arm_func_end GroupOamAttributesWrapper

	arm_func_start CopyAttributesToOamWrapper
CopyAttributesToOamWrapper: ; 0x0201BAAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x20
	bl SetShouldCopyToOam
	add r0, r4, #0x20
	bl CopyAttributesToOam
	ldmia sp!, {r4, pc}
	arm_func_end CopyAttributesToOamWrapper

	arm_func_start ChangeSimpleObjTexture
ChangeSimpleObjTexture: ; 0x0201BAC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldrb r5, [sp, #0x18]
	ldrb r4, [sp, #0x1c]
	str r5, [sp]
	str r4, [sp, #4]
	ldrh ip, [r0, #0xc]
	ldr r4, [r0, #0x64]
	ldr r5, _0201BB1C ; =_020AFC28
	mov lr, ip, lsr #0x1f
	rsb ip, lr, ip, lsl #30
	add ip, lr, ip, ror #30
	mov ip, ip, lsl #1
	ldrsh ip, [r5, ip]
	mov r5, r1
	ldr r0, [r0, #4]
	smlabb r1, r2, ip, r4
	mov r2, r5
	bl sub_0201AC20
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201BB1C: .word _020AFC28
	arm_func_end ChangeSimpleObjTexture

	arm_func_start sub_0201BB20
sub_0201BB20: ; 0x0201BB20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	bl sub_0201AD44
	ldr r0, [r4, #4]
	bl sub_0201AC10
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BB20

	arm_func_start InitObjGraphicsControls
InitObjGraphicsControls: ; 0x0201BB3C
	stmdb sp!, {r3, lr}
	mov r0, #0x1f00
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #0x1f00
	str r0, [r2]
	bl MemZero
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC0 ; =0x05000200
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC4 ; =0x06894000
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF64
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _0201BCC8 ; =0x05000600
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r3, #0
	ldr r0, [r0]
	str r3, [sp]
	add r1, r0, #0x1c8
	add r1, r1, #0x1c00
	add r2, r0, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	add r0, r2, #0x70
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #2
	ldr r2, [r0]
	mov r3, #0
	str r1, [sp]
	add r0, r2, #0xe0
	add r1, r2, #0x1c8
	add r1, r1, #0x1c00
	add r2, r2, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r1, #3
	ldr r2, [r0]
	mov r3, #1
	str r1, [sp]
	add r0, r2, #0x150
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BCBC: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BCC0: .word 0x05000200
_0201BCC4: .word 0x06894000
_0201BCC8: .word 0x05000600
	arm_func_end InitObjGraphicsControls

	arm_func_start sub_0201BCCC
sub_0201BCCC: ; 0x0201BCCC
	ldr r1, _0201BCEC ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BCF0 ; =sub_0201AD7C
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BCEC: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BCF0: .word sub_0201AD7C
	arm_func_end sub_0201BCCC

	arm_func_start sub_0201BCF4
sub_0201BCF4: ; 0x0201BCF4
	ldr r1, _0201BD14 ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BD18 ; =sub_0201AD84
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BD14: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201BD18: .word sub_0201AD84
	arm_func_end sub_0201BCF4

	arm_func_start sub_0201BD1C
sub_0201BD1C: ; 0x0201BD1C
	ldr r3, _0201BD4C ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr ip, [r3]
	and r3, r0, #1
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r2, r1, r2, r0
	ldrb r0, [r2, #0x78]
	bic r0, r0, #1
	orr r0, r0, r3
	strb r0, [r2, #0x78]
	bx lr
	.align 2, 0
_0201BD4C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD1C

	arm_func_start sub_0201BD50
sub_0201BD50: ; 0x0201BD50
	stmdb sp!, {r3, lr}
	ldr r3, _0201BD7C ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x9c
	ldr r3, [r3]
	mov ip, r0
	add r0, r3, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r1, r2, r0
	mov r1, ip
	bl sub_0201AEB4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BD7C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD50

	arm_func_start sub_0201BD80
sub_0201BD80: ; 0x0201BD80
	stmdb sp!, {r3, lr}
	ldr ip, _0201BDB0 ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov lr, r0
	ldr ip, [ip]
	mov r3, #0x9c
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r2, r3, r0
	mov r2, r1
	mov r1, lr
	bl sub_0201AECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDB0: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BD80

	arm_func_start CopyAttributesToOamBothScreens
CopyAttributesToOamBothScreens: ; 0x0201BDB4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BDE8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl CopyAttributesToOamWrapper
	ldr r0, _0201BDE8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CopyAttributesToOamWrapper
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDE8: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end CopyAttributesToOamBothScreens

	arm_func_start sub_0201BDEC
sub_0201BDEC: ; 0x0201BDEC
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BE24 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl CopyAttributesToOamWrapper
	ldr r0, _0201BE24 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl CopyAttributesToOamWrapper
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE24: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BDEC

	arm_func_start sub_0201BE28
sub_0201BE28: ; 0x0201BE28
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE58 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldr r0, _0201BE58 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE58: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BE28

	arm_func_start GroupOamAttributesBothScreens
GroupOamAttributesBothScreens: ; 0x0201BE5C
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE80 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl GroupOamAttributesWrapper
	ldr r0, _0201BE80 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl GroupOamAttributesWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE80: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end GroupOamAttributesBothScreens

	arm_func_start sub_0201BE84
sub_0201BE84: ; 0x0201BE84
	stmdb sp!, {r3, lr}
	ldr r0, _0201BEAC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl GroupOamAttributesWrapper
	ldr r0, _0201BEAC ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl GroupOamAttributesWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BEAC: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BE84

	arm_func_start sub_0201BEB0
sub_0201BEB0: ; 0x0201BEB0
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl sub_0201BB20
	ldr r0, _0201BF0C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF0C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BEB0

	arm_func_start sub_0201BF10
sub_0201BF10: ; 0x0201BF10
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF48 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BB20
	ldr r0, _0201BF48 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF48: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BF10

	arm_func_start sub_0201BF4C
sub_0201BF4C: ; 0x0201BF4C
	stmdb sp!, {r3, lr}
	bl sub_0201BEB0
	bl sub_0201BF10
	bl CopyAttributesToOamBothScreens
	bl sub_0201BDEC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201BF4C

	arm_func_start sub_0201BF64
sub_0201BF64: ; 0x0201BF64
	stmdb sp!, {r3, lr}
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201B2A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BFA8: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BF64

	arm_func_start sub_0201BFAC
sub_0201BFAC: ; 0x0201BFAC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _0201BFEC ; =OBJ_GRAPHICS_CONTROLS_PTR
	str r3, [sp]
	ldr lr, [ip]
	ldr ip, [sp, #0x10]
	mov r3, #0x70
	mov r4, r0
	mla r0, ip, r3, lr
	mov ip, r1
	mov r3, r2
	mov r1, r4
	mov r2, ip
	bl sub_0201B2DC
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201BFEC: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201BFAC

	arm_func_start CopyAndInterleaveWrapper
CopyAndInterleaveWrapper: ; 0x0201BFF0
	ldr ip, _0201BFFC ; =CopyAndInterleave
	mov r2, r2, asr #1
	bx ip
	.align 2, 0
_0201BFFC: .word CopyAndInterleave
	arm_func_end CopyAndInterleaveWrapper

	arm_func_start InitOamAdjustmentInfo
InitOamAdjustmentInfo: ; 0x0201C000
	ldr r2, _0201C024 ; =0x0000FFFF
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201C024: .word 0x0000FFFF
	arm_func_end InitOamAdjustmentInfo

	arm_func_start sub_0201C028
sub_0201C028: ; 0x0201C028
	strh r1, [r0]
	strh r2, [r0, #2]
	ldrh r1, [sp]
	strh r3, [r0, #4]
	ldrh r2, [sp, #4]
	strh r1, [r0, #6]
	ldrh r1, [sp, #8]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_0201C028

	arm_func_start InitAnimationControl
InitAnimationControl: ; 0x0201C050
	stmdb sp!, {r4, lr}
	mov r1, #0x7c
	mov r4, r0
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x68]
	str r1, [r4, #0x6c]
	strh r1, [r4, #0x70]
	mov r0, #0xff
	strh r1, [r4, #0x72]
	strb r0, [r4, #0x43]
	add r0, r0, #0xff00
	strh r0, [r4, #0x36]
	mov r0, #9
	strb r0, [r4, #0x40]
	add r0, r4, #0x10
	bl InitOamAdjustmentInfo
	ldrh r0, [r4, #2]
	bic r0, r0, #0x8000
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	orr r0, r0, #0x200
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControl

	arm_func_start InitAnimationControlWithSet__0201C0B0
InitAnimationControlWithSet__0201C0B0: ; 0x0201C0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0B0

	arm_func_start InitAnimationControlWithSet__0201C0CC
InitAnimationControlWithSet__0201C0CC: ; 0x0201C0CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0CC

	arm_func_start SetSpriteIdForAnimationControl
SetSpriteIdForAnimationControl: ; 0x0201C0E8
	strh r1, [r0, #0x70]
	ldrsh r2, [r0, #0x70]
	ldrsh r1, [r0, #0x72]
	cmp r2, r1
	strneh r2, [r0, #0x72]
	movne r1, #0xff
	strneb r1, [r0, #0x43]
	bx lr
	arm_func_end SetSpriteIdForAnimationControl

	arm_func_start sub_0201C108
sub_0201C108: ; 0x0201C108
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x70]
	cmp r0, #0
	bne _0201C124
	ldr r0, _0201C134 ; =_020996E0
	bl Debug_Print0
_0201C124:
	ldrh r0, [r4, #2]
	orr r0, r0, #0x8000
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201C134: .word _020996E0
	arm_func_end sub_0201C108

	arm_func_start sub_0201C138
sub_0201C138: ; 0x0201C138
	ldr ip, _0201C140 ; =InitAnimationControl
	bx ip
	.align 2, 0
_0201C140: .word InitAnimationControl
	arm_func_end sub_0201C138

	arm_func_start sub_0201C144
sub_0201C144: ; 0x0201C144
	stmdb sp!, {r3, lr}
	ldr r1, _0201C178 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201C178: .word _020AFC3C
	arm_func_end sub_0201C144

	arm_func_start SetAnimationForAnimationControlInternal
SetAnimationForAnimationControlInternal: ; 0x0201C17C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	ldmia r1, {ip, lr}
	mov r5, #0
	mov r4, r4, lsl #0x10
	strh r5, [r0]
	strh r5, [r0, #6]
	mov r4, r4, asr #0x10
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	mov r5, #1
	ldrb r4, [sp, #0x1c]
	strh r5, [r0, #4]
	ldrh r5, [r0]
	cmp r4, #0
	orr r4, r5, #0x8000
	strh r4, [r0]
	ldrneh r4, [r0]
	mov r5, #0
	orrne r4, r4, #0x1000
	strneh r4, [r0]
	ldr r4, [ip, #8]
	add r4, r4, r2, lsl #3
	ldrh r4, [r4, #4]
	cmp r3, r4
	strh r5, [r0, #0x20]
	movge r3, #0
	ldr r4, [sp, #0x10]
	strh r5, [r0, #0x22]
	strh r4, [r0, #0x32]
	sub r4, r5, #1
	strh r4, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	str r5, [r0, #0x28]
	str r5, [r0, #0x2c]
	strh r5, [r0, #0xc]
	strh r2, [r0, #0x76]
	strh r3, [r0, #0x78]
	ldr r4, [ip]
	cmp lr, #0
	str r4, [r0, #0x54]
	ldrne r5, [lr]
	cmp lr, #0
	str r5, [r0, #0x58]
	ldrne r4, [lr, #4]
	moveq r4, #0
	str r4, [r0, #0x5c]
	cmp lr, #0
	ldrnesh r4, [lr, #0xa]
	ldrb lr, [sp, #0x14]
	ldreqsh r4, [ip, #0x14]
	and r4, r4, #1
	strh r4, [r0, #0x60]
	ldr r4, [ip, #4]
	str r4, [r0, #0x50]
	ldrb r4, [sp, #0x20]
	strb lr, [r0, #0x41]
	strb r4, [r0, #0x7a]
	ldrb r1, [r1, #8]
	cmp r1, #1
	beq _0201C29C
	ldr r1, [ip, #8]
	ldr r1, [r1]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	b _0201C2C0
_0201C29C:
	ldrsh r1, [ip, #0xc]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	ldr r1, [r1, r2, lsl #3]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	add r1, r1, r2, lsl #3
_0201C2C0:
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x62]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetAnimationForAnimationControlInternal

	arm_func_start SetAnimationForAnimationControl
SetAnimationForAnimationControl: ; 0x0201C2CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldrsh r0, [r7, #0x70]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl SpriteTypeInWanTable
	cmp r0, #0
	beq _0201C304
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0201C348
_0201C304:
	mov r0, r7
	bl GetWanForAnimationControl
	ldrb r3, [sp, #0x28]
	str r4, [sp]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	ldrb r0, [sp, #0x30]
	str r2, [sp, #8]
	ldrb r4, [sp, #0x34]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r6
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C348:
	ldrsh r0, [r7, #0x70]
	mov r1, r6, lsl #0x10
	mov r1, r1, asr #0x10
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	mov r0, r7
	beq _0201C3A4
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r5
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C3A4:
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r3, r5
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
_0201C3E0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end SetAnimationForAnimationControl

	arm_func_start GetWanForAnimationControl
GetWanForAnimationControl: ; 0x0201C3E8
	ldr r1, [r0, #0x68]
	cmp r1, #0
	ldrne r0, [r1, #4]
	bxne lr
	ldr r1, _0201C414 ; =WAN_TABLE
	ldrsh r2, [r0, #0x70]
	ldr r1, [r1]
	mov r0, #0x38
	smlabb r0, r2, r0, r1
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0201C414: .word WAN_TABLE
	arm_func_end GetWanForAnimationControl

	arm_func_start SetAndPlayAnimationForAnimationControl
SetAndPlayAnimationForAnimationControl: ; 0x0201C418
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldrb r4, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	ldrb lr, [sp, #0x20]
	stmia sp, {r4, ip}
	ldrb ip, [sp, #0x24]
	str lr, [sp, #8]
	mov r4, r0
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetAndPlayAnimationForAnimationControl

	arm_func_start SwitchAnimationControlToNextFrame
SwitchAnimationControlToNextFrame: ; 0x0201C458
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201D1B0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x3a]
	cmp r0, #0
	blt _0201C4F4
	ldrh r0, [r4]
	tst r0, #0x4000
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xc]
	ldrsh r0, [r4, #4]
	add r0, r1, r0
	strh r0, [r4, #0xc]
	ldrsh r1, [r4, #0xa]
	cmp r1, #0
	beq _0201C4C0
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #0xa]
	ldrsh r0, [r4, #0xa]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
_0201C4C0:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	beq _0201C4E8
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, #6]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #6]
_0201C4E8:
	ldrsh r0, [r4, #6]
	cmp r0, #0
	ldmgtia sp!, {r4, pc}
_0201C4F4:
	ldr r0, [r4, #0x4c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C550
	ldrh r0, [r4]
	tst r0, #0x1000
	beq _0201C544
	ldrh r1, [r4, #0x62]
	ldr r2, [r4, #0x48]
	mov r0, #0xc
	mla r0, r1, r0, r2
	str r0, [r4, #0x4c]
	ldrsh r0, [r4, #8]
	cmp r0, #0
	beq _0201C550
	bl Rand16Bit
	ldrsh r1, [r4, #8]
	and r0, r1, r0
	strh r0, [r4, #0xa]
	b _0201C550
_0201C544:
	orr r0, r0, #0x2000
	strh r0, [r4]
	ldmia sp!, {r4, pc}
_0201C550:
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	ldmia sp!, {r4, pc}
	arm_func_end SwitchAnimationControlToNextFrame

	arm_func_start LoadAnimationFrameAndIncrementInAnimationControl
LoadAnimationFrameAndIncrementInAnimationControl: ; 0x0201C560
	ldrh r2, [r0]
	orr r2, r2, #0x800
	strh r2, [r0]
	ldrb r2, [r1]
	strh r2, [r0, #6]
	ldrsh r2, [r1, #2]
	strh r2, [r0, #0x3a]
	ldrsh r2, [r1, #4]
	strh r2, [r0, #0x20]
	ldrsh r2, [r1, #6]
	strh r2, [r0, #0x22]
	ldrsh r2, [r1, #8]
	strh r2, [r0, #0x24]
	ldrsh r2, [r1, #0xa]
	strh r2, [r0, #0x26]
	ldrb r2, [r1, #1]
	str r2, [r0, #0x28]
	ldrb r1, [r1, #1]
	ldr r2, [r0, #0x2c]
	orr r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x4c]
	add r1, r1, #0xc
	str r1, [r0, #0x4c]
	bx lr
	arm_func_end LoadAnimationFrameAndIncrementInAnimationControl

	arm_func_start DisplayAnimationControlCurrentFrame
DisplayAnimationControlCurrentFrame: ; 0x0201C5C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201CF40
	ldrsh r0, [r8, #0x3a]
	mov fp, #0
	cmp r0, #0
	bge _0201C618
	mov r0, r8
	bl SwitchAnimationControlToNextFrame
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, fp
	tst r0, #0xff
	beq _0201CF40
_0201C618:
	ldrsh r1, [r8, #0x3c]
	ldrsh r0, [r8, #0x3a]
	cmp r1, r0
	ldrh r0, [r8, #2]
	movne fp, #1
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201C640
	tst r0, #0x100
	movne fp, #1
_0201C640:
	ldrb r0, [r8, #0x7a]
	cmp r0, #4
	bhs _0201CEC8
	ldrsh r0, [r8, #0x70]
	bl SpriteTypeInWanTable
	cmp r0, #3
	bne _0201C928
	mov r0, r8
	bl GetWanForAnimationControl
	ldr r6, [r0]
	ldr r5, [r0, #4]
	ldr sl, [r6, #0x10]
	mov r0, #0
	ldr r3, [r5]
	mov r7, r0
	str r0, [sp, #0x44]
	ldr r0, [r5, #4]
	ldrsh r1, [r8, #0x3a]
	ldr r2, [r6]
	cmp sl, #0
	str r0, [sp, #0x48]
	ldr r4, [r3]
	ldr sb, [r2, r1, lsl #2]
	beq _0201C6CC
	ldrsh r0, [r8, #0x78]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldrh r0, [r8, #0xc]
	add r1, sl, r1, lsl #3
	ldr r1, [r1, #4]
	bl _s32_div_f
	ldr r0, [sp, #0x20]
	ldr r0, [sl, r0, lsl #3]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x44]
_0201C6CC:
	cmp r5, #0
	cmpne fp, #0
	beq _0201C7D8
	ldrh r0, [r8, #2]
	tst r0, #0x8000
	bne _0201C7D8
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x48]
	ldrsh r0, [r0, #6]
	strh r0, [sp, #0x8a]
	ldrsh r0, [r5, #0xa]
	cmp r0, #2
	bne _0201C72C
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #2
	smulbb r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	strh r1, [sp, #0x88]
	mov r5, r0, asr #2
	b _0201C79C
_0201C72C:
	cmp r0, #0
	bne _0201C754
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #0
	smulbb r0, r2, r0
	add r0, r0, r0, lsr #31
	strh r1, [sp, #0x88]
	mov r5, r0, asr #1
	b _0201C79C
_0201C754:
	cmp r0, #3
	bne _0201C774
	ldrsh r2, [r4, #4]
	ldrsh r1, [r4, #6]
	mov r0, #3
	strh r0, [sp, #0x88]
	smulbb r5, r2, r1
	b _0201C79C
_0201C774:
	cmp r0, #4
	ldrsh r2, [r4, #4]
	ldreqsh r1, [r4, #6]
	moveq r0, #4
	streqh r0, [sp, #0x88]
	smulbbeq r5, r2, r1
	ldrnesh r1, [r4, #6]
	movne r0, #1
	smulbbne r5, r2, r1
	strneh r0, [sp, #0x88]
_0201C79C:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrb r2, [r8, #0x40]
	ldr r0, [r0]
	ldrb r3, [r8, #0x41]
	add r1, sp, #0x84
	add r0, r0, #0xcc
	bl sub_0201E408
	ldrh r1, [r8, #0x32]
	ldr r0, [r4]
	mov r2, r5
	mov r3, #0
	bl sub_0201E050
	ldrh r0, [r8, #2]
	orr r0, r0, #0x8000
	strh r0, [r8, #2]
_0201C7D8:
	ldr r0, [sp, #0x44]
	and r0, r0, #0xf8
	mov r0, r0, asr #3
	str r0, [sp, #0x24]
_0201C7E8:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrsh r2, [r8, #0x1c]
	ldr r5, [r0]
	ldrsh r0, [r8, #0x20]
	ldrh sl, [sb, #0x20]
	ldrsh ip, [r8, #0x1e]
	ldrsh r3, [r8, #0x22]
	add r2, r2, r0
	ldrb r4, [r8, #0x41]
	ldrb r1, [r8, #0x40]
	add r3, ip, r3
	add ip, sl, #0x39
	ldrh r0, [r8, #0x32]
	ldr r5, [r5, #0xe0]
	mov sl, #3
	add r1, r4, r1, lsl #8
	strh sl, [sp, #0x5c]
	add r4, r5, r1, lsl #1
	str r0, [sp, #0x60]
	strh ip, [sp, #0x5e]
	mov r0, r4, lsl #0x10
	ldr r1, [sb]
	mov r4, r7
	add r0, r1, r0, lsr #16
	add r1, r7, #1
	and r7, r1, #0xff
	add r5, sp, #0x68
	str r0, [sp, #0x64]
	add sl, sb, #0x10
	mov r1, #4
_0201C860:
	ldrh r0, [sl], #2
	subs r1, r1, #1
	strh r0, [r5], #2
	bne _0201C860
	ldrh r5, [sb, #0x18]
	add r0, sp, #0x7e
	add r1, sb, #0x1a
	strh r5, [sp, #0x70]
	ldrsh r5, [sb, #4]
	strh r5, [sp, #0x72]
	ldrsh sl, [sb, #6]
	add r5, r5, r2
	add r2, sl, r3
	strh r5, [sp, #0x72]
	strh r2, [sp, #0x74]
	ldrsh r2, [sb, #8]
	strh r2, [sp, #0x76]
	ldrsh r2, [sb, #0xa]
	strh r2, [sp, #0x78]
	ldrh r2, [sb, #0xc]
	strh r2, [sp, #0x7a]
	ldrh r2, [sb, #0xe]
	strh r2, [sp, #0x7c]
	ldrh r2, [sb, #0x1e]
	strb r4, [sp, #0x82]
	strh r2, [sp, #0x80]
	ldrb r2, [sb, #0x1d]
	and r2, r2, #0xf8
	mov r2, r2, asr #3
	strb r2, [sp, #0x83]
	bl Rgb8ToRgb5
	ldr r0, [r6, #0x10]
	mov r1, #0x3f
	cmp r0, #0
	ldrne r0, [sp, #0x24]
	strneb r0, [sp, #0x83]
	mov r0, r7
	bl _s32_div_f
	ldrh r0, [r8, #2]
	and r7, r1, #0xff
	tst r0, #2
	bne _0201C910
	add r0, sp, #0x5c
	bl EnqueueRender3dTexture
_0201C910:
	ldrb r0, [sb, #0x22]
	cmp r0, #0
	addeq sb, sb, #0x28
	beq _0201C7E8
	mov r4, #1
	b _0201CF04
_0201C928:
	ldrb r2, [r8, #0x7a]
	ldr r1, _0201CF4C ; =_020AFC50
	mov r0, r8
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x40]
	bl GetWanForAnimationControl
	mov r1, #0
	ldrh r3, [r8, #0x60]
	str r1, [sp, #0x2c]
	ldr r2, _0201CF50 ; =_020AFC30
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	str r1, [sp, #0x28]
	ldrsh r2, [r8, #0x3a]
	ldr r3, [r8, #0x54]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r7, [r0, #4]
	ldr r1, [sp, #0x28]
	ldrb r0, [r8, #0x41]
	ldr r6, [r3, r2, lsl #2]
	cmp r1, #0
	str r0, [sp, #0x30]
	bne _0201C9B4
	ldr r0, [sp, #0x30]
	cmp r0, #0x10
	blo _0201C9B4
	sub r0, r0, #0x10
	mov r1, r0, lsl #0x10
	mov r0, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x38]
	mov r0, r1, lsr #0x10
	str r0, [sp, #0x30]
_0201C9B4:
	ldrh r2, [r8, #2]
	tst r2, #0x20
	addne r0, r8, #0x10
	strne r0, [sp, #0x2c]
	cmp r7, #0
	cmpne fp, #0
	beq _0201CCFC
	ldrh r0, [r7, #8]
	tst r0, #1
	beq _0201CCFC
	tst r2, #0x8000
	bne _0201CCFC
	ldr r0, [sp, #0x40]
	mov r1, #0
	ldrh r5, [r7, #0xe]
	ldrh sb, [r8, #0x32]
	mov r4, r1
	tst r2, #0x80
	movne r1, #1
	tst r2, #0x40
	and r0, r0, #0xff
	movne r4, #1
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0201CCE0
_0201CA18: ; jump table
	b _0201CA28 ; case 0
	b _0201CAD0 ; case 1
	b _0201CB80 ; case 2
	b _0201CC30 ; case 3
_0201CA28:
	cmp r1, #0
	bne _0201CAB0
	mov sl, #0
	b _0201CAA8
_0201CA38:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x3c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x3c]
	ldrh r2, [r1, #0xc]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CAA8:
	cmp sl, r5
	blo _0201CA38
_0201CAB0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	bl LoadObjPalette
	b _0201CCE0
_0201CAD0:
	cmp r1, #0
	bne _0201CB5C
	mov sl, #0
	b _0201CB54
_0201CAE0:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x14]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, #0x7c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CB54:
	cmp sl, r5
	blo _0201CAE0
_0201CB5C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x70
	bl LoadObjPalette
	b _0201CCE0
_0201CB80:
	cmp r1, #0
	bne _0201CC0C
	mov sl, #0
	b _0201CC04
_0201CB90:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x18]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x18]
	ldrh r2, [r1, #0xec]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CC04:
	cmp sl, r5
	blo _0201CB90
_0201CC0C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0xe0
	bl LoadObjPalette
	b _0201CCE0
_0201CC30:
	cmp r1, #0
	bne _0201CCC0
	mov sl, #0
	b _0201CCB8
_0201CC40:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x1c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B388
	ldr r1, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r2, [r8, #0x5c]
	ldr r1, [r1]
	ldrh r3, [r2, #4]
	add r1, r1, #0x100
	ldrh r2, [r1, #0x5c]
	ldr r0, [sp, #0x1c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CCB8:
	cmp sl, r5
	blo _0201CC40
_0201CCC0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x150
	bl LoadObjPalette
_0201CCE0:
	ldrh r1, [r8, #2]
	ldr r0, _0201CF58 ; =0x0000FFFF
	orr r1, r1, #0x8000
	strh r1, [r8, #2]
	ldrb r1, [r8, #0x41]
	strb r1, [r8, #0x43]
	strh r0, [r8, #0x36]
_0201CCFC:
	ldr r0, [sp, #0x40]
	mov r1, #0x70
	mul r5, r0, r1
	cmp fp, #0
	moveq sb, #1
	ldr sl, _0201CF58 ; =0x0000FFFF
	movne sb, #0
_0201CD18:
	cmp sb, #0
	mov r4, #0
	bne _0201CD34
	ldrsh r0, [r6]
	cmp r0, #0
	strgeh r0, [r8, #0x36]
	bge _0201CD38
_0201CD34:
	strh sl, [r8, #0x36]
_0201CD38:
	ldrsh r3, [r8, #0x1e]
	ldrsh r2, [r8, #0x22]
	ldrsh r1, [r8, #0x1c]
	ldrsh r0, [r8, #0x20]
	add r2, r3, r2
	add r0, r1, r0
	strh r2, [sp, #0x4e]
	strh r0, [sp, #0x4c]
	ldrh r0, [r8, #0x32]
	strh r0, [sp, #0x50]
	ldrh r0, [r8, #0x38]
	strh r0, [sp, #0x52]
	ldr r0, [sp, #0x30]
	strh r0, [sp, #0x54]
	ldrb r0, [r8, #0x42]
	strh r0, [sp, #0x56]
	ldr r0, [sp, #0x28]
	strh r0, [sp, #0x58]
	ldr r0, [sp, #0x38]
	strb r0, [sp, #0x5a]
	ldrh r0, [r8, #2]
	tst r0, #0x1000
	movne r0, #1
	moveq r0, #0
	strb r0, [sp, #0x5b]
	ldrh r0, [r8, #2]
	tst r0, #2
	bne _0201CDD4
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r3, [sp, #0x2c]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	add r2, sp, #0x4c
	bl AddWanFragmentToOam
	cmp r0, #0
	movne r0, #1
	moveq r4, #1
	strne r0, [sp, #0x34]
_0201CDD4:
	ldrh r2, [r8, #2]
	tst r2, #0x200
	movne r4, #1
	cmp r4, #0
	cmpne r7, #0
	beq _0201CE80
	ldrh r0, [r7, #8]
	tst r0, #1
	bne _0201CE80
	ldrh r0, [r8, #0x36]
	cmp r0, sl
	beq _0201CE80
	ldrb r3, [r8, #0x41]
	ldrb r1, [r8, #0x43]
	mov r0, #1
	cmp r3, r1
	beq _0201CE24
	tst r2, #0x40
	moveq r0, #0
	strb r3, [r8, #0x43]
_0201CE24:
	ldrh r2, [r8, #0x36]
	ldr r3, [r8, #0x58]
	ldrh r1, [r8, #2]
	ldr r3, [r3, r2, lsl #2]
	ldr r2, [r8, #0x5c]
	tst r1, #0x80
	str r2, [sp]
	ldrb r2, [r8, #0x41]
	movne r1, #1
	moveq r1, #0
	str r2, [sp, #4]
	mov r2, #0
	and r4, r1, #0xff
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0201CF54 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r2, [r8, #0x32]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	bl sub_0201B53C
	strh sl, [r8, #0x36]
_0201CE80:
	ldrh r0, [r6, #6]
	mov r0, r0, asr #0xb
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addeq r6, r6, #0xa
	beq _0201CD18
	ldrh r0, [r8, #2]
	tst r0, #0x200
	movne r0, #0
	strne r0, [sp, #0x34]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r4, r0, #0xff
	b _0201CF04
_0201CEC8:
	bne _0201CF04
	ldrsh r0, [r8, #0x3a]
	ldr r1, [r8, #0x54]
	ldr r3, [r1, r0, lsl #2]
	mov r0, #0
	mov r1, #1
_0201CEE0:
	ldrh r2, [r3, #6]
	mov r2, r2, asr #0xb
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	addeq r3, r3, #0xa
	beq _0201CEE0
	mov r4, #1
_0201CF04:
	cmp r4, #0
	ldrneh r0, [r8, #2]
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201CF28
	cmp fp, #0
	ldrneh r0, [r8, #2]
	orrne r0, r0, #0x100
	strneh r0, [r8, #2]
_0201CF28:
	ldrsh r0, [r8, #0x3a]
	strh r0, [r8, #0x3c]
	ldrh r0, [r8]
	tst r0, #0x800
	bicne r0, r0, #0x800
	strneh r0, [r8]
_0201CF40:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201CF48: .word _020AFC70
_0201CF4C: .word _020AFC50
_0201CF50: .word _020AFC30
_0201CF54: .word OBJ_GRAPHICS_CONTROLS_PTR
_0201CF58: .word 0x0000FFFF
	arm_func_end DisplayAnimationControlCurrentFrame

	arm_func_start DisplayAndSwitchAnimationControlCurrentFrame
DisplayAndSwitchAnimationControlCurrentFrame: ; 0x0201CF5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DisplayAnimationControlCurrentFrame
	ldrh r0, [r4, #2]
	tst r0, #0x10
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
	arm_func_end DisplayAndSwitchAnimationControlCurrentFrame

	arm_func_start sub_0201CF80
sub_0201CF80: ; 0x0201CF80
	ldrb r1, [r0, #0x41]
	add r1, r1, #1
	strb r1, [r0, #0x43]
	bx lr
	arm_func_end sub_0201CF80

	arm_func_start sub_0201CF90
sub_0201CF90: ; 0x0201CF90
	stmdb sp!, {r3, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	ldrh r3, [r1]
	tst r3, #0x8000
	movne ip, #1
	tst ip, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r2, #4
	ldmhsia sp!, {r3, pc}
	ldrsh ip, [r1, #0x3a]
	mvn r3, #0
	cmp ip, r3
	ldrne r3, [r1, #0x50]
	cmpne r3, #0
	beq _0201D024
	add ip, r3, ip, lsl #4
	mov r3, r2, lsl #2
	ldrsh lr, [ip, r3]
	cmp lr, #0x63
	addeq r3, ip, r3
	ldreqsh r3, [r3, #2]
	cmpeq r3, #0x63
	moveq r1, #0x63
	streqh r1, [r0]
	streqh r1, [r0, #2]
	ldmeqia sp!, {r3, pc}
	ldrsh r3, [r1, #0x20]
	add r2, ip, r2, lsl #2
	add r3, r3, lr
	strh r3, [r0]
	ldrsh r3, [r1, #0x22]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
_0201D024:
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201CF90

	arm_func_start sub_0201D034
sub_0201D034: ; 0x0201D034
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r3, [r2]
	tst r3, #0x8000
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r2, #0x50]
	cmp r4, #0
	beq _0201D0CC
	ldrsh r3, [r2, #0x3a]
	mov ip, #0
	mov r5, #0x63
	add r3, r4, r3, lsl #4
	b _0201D0C0
_0201D070:
	mov r4, ip, lsl #2
	ldrsh r6, [r3, r4]
	cmp r6, #0x63
	addeq r4, r3, r4
	ldreqsh r4, [r4, #2]
	cmpeq r4, #0x63
	streqh r5, [r0]
	streqh r5, [r0, #2]
	beq _0201D0B4
	ldrsh r4, [r2, #0x20]
	add lr, r3, ip, lsl #2
	add r4, r4, r6
	strh r4, [r0]
	ldrsh r4, [r2, #0x22]
	ldrsh lr, [lr, #2]
	add r4, r4, lr
	strh r4, [r0, #2]
_0201D0B4:
	add ip, ip, #1
	add r0, r0, #4
	and ip, ip, #0xff
_0201D0C0:
	cmp ip, r1
	blo _0201D070
	ldmia sp!, {r4, r5, r6, pc}
_0201D0CC:
	mov r2, #0
	mov r3, r2
	b _0201D0EC
_0201D0D8:
	strh r3, [r0]
	add r2, r2, #1
	strh r3, [r0, #2]
	add r0, r0, #4
	and r2, r2, #0xff
_0201D0EC:
	cmp r2, r1
	blo _0201D0D8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D034

	arm_func_start sub_0201D0F8
sub_0201D0F8: ; 0x0201D0F8
	strb r1, [r0, #0x40]
	bx lr
	arm_func_end sub_0201D0F8

	arm_func_start sub_0201D100
sub_0201D100: ; 0x0201D100
	ldr ip, _0201D10C ; =sub_0201DC4C
	ldrsh r0, [r0, #0x70]
	bx ip
	.align 2, 0
_0201D10C: .word sub_0201DC4C
	arm_func_end sub_0201D100

	arm_func_start FillOamAttributeInfo
FillOamAttributeInfo: ; 0x0201D110
	add r3, r0, #0x10
	mov r2, #6
_0201D118:
	ldrh r0, [r1], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _0201D118
	bx lr
	arm_func_end FillOamAttributeInfo

	arm_func_start sub_0201D12C
sub_0201D12C: ; 0x0201D12C
	ldrh r3, [r0, #2]
	and r2, r1, #3
	ldr r1, _0201D16C ; =0x0000F3FF
	orr r3, r3, #0x20
	strh r3, [r0, #2]
	ldrh r3, [r0, #0x14]
	mov r2, r2, lsl #0x10
	and r3, r3, r1
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x1a]
	and r1, r3, r1
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0x1a]
	orr r1, r1, r2, lsr #6
	strh r1, [r0, #0x1a]
	bx lr
	.align 2, 0
_0201D16C: .word 0x0000F3FF
	arm_func_end sub_0201D12C

	arm_func_start AnimationControlGetAllocForMaxFrame
AnimationControlGetAllocForMaxFrame: ; 0x0201D170
	stmdb sp!, {r3, lr}
	bl GetWanForAnimationControl
	cmp r0, #0
	ldrne r0, [r0]
	ldrnesh r0, [r0, #0xe]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end AnimationControlGetAllocForMaxFrame

	arm_func_start sub_0201D18C
sub_0201D18C: ; 0x0201D18C
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D18C

	arm_func_start SetAnimationControlPausedFlag
SetAnimationControlPausedFlag: ; 0x0201D198
	cmp r1, #0
	ldrh r1, [r0]
	orrne r1, r1, #0x4000
	biceq r1, r1, #0x4000
	strh r1, [r0]
	bx lr
	arm_func_end SetAnimationControlPausedFlag

	arm_func_start sub_0201D1B0
sub_0201D1B0: ; 0x0201D1B0
	ldrh r0, [r0]
	tst r0, #0x2000
	movne r0, #0
	bxne lr
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0201D1B0

	arm_func_start sub_0201D1D4
sub_0201D1D4: ; 0x0201D1D4
	ldr r0, [r0, #0x2c]
	bx lr
	arm_func_end sub_0201D1D4

	arm_func_start DeleteWanTableEntry
DeleteWanTableEntry: ; 0x0201D1DC
	stmdb sp!, {r4, lr}
	mov r2, #0x38
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	beq _0201D204
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0201D204:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	ldrnesh r0, [r4, #0x2c]
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #1
	strh r0, [r4, #0x2c]
	ldrsh r0, [r4, #0x2c]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x34]
	bl MemFree
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end DeleteWanTableEntry

	arm_func_start AllocateWanTableEntry
AllocateWanTableEntry: ; 0x0201D244
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x1500
	mov lr, #1
	ldrsh r4, [r1, #0xa]
	ldrsh r5, [r1, #8]
	mov ip, lr
	mov r3, #0x38
	b _0201D2C4
_0201D264:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0201D2AC
	add r2, r4, #1
	add r1, r0, #0x1500
	strh r2, [r1, #0xa]
	ldrsh r3, [r1, #0xa]
	ldrsh r2, [r1, #8]
	cmp r3, r2
	movge r2, #1
	strgeh r2, [r1, #0xa]
	mov r1, #0x38
	bl MemZero
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_0201D2AC:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_0201D2C4:
	cmp lr, r5
	blt _0201D264
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AllocateWanTableEntry

	arm_func_start FindWanTableEntry
FindWanTableEntry: ; 0x0201D2D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	add r0, r6, #0x1500
	mov r5, r1
	ldrsh r4, [r0, #8]
	mov r8, #1
	mov r7, #0x38
	b _0201D324
_0201D2F4:
	smlabb r0, r8, r7, r6
	ldrb r1, [r0, #0x21]
	cmp r1, #1
	bne _0201D318
	mov r1, r5
	bl strcmp
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0201D318:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_0201D324:
	cmp r8, r4
	blt _0201D2F4
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FindWanTableEntry

	arm_func_start GetLoadedWanTableEntry
GetLoadedWanTableEntry: ; 0x0201D334
	stmdb sp!, {r3, r4, r5, lr}
	add r3, r0, #0x1500
	ldrsh r5, [r3, #8]
	mov r4, #1
	mov ip, #0x38
	b _0201D37C
_0201D34C:
	smlabb lr, r4, ip, r0
	ldrb r3, [lr, #0x21]
	cmp r3, #2
	ldreqh r3, [lr, #0x22]
	cmpeq r1, r3
	ldreqh r3, [lr, #0x24]
	cmpeq r2, r3
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_0201D37C:
	cmp r4, r5
	blt _0201D34C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetLoadedWanTableEntry

	arm_func_start sub_0201D38C
sub_0201D38C: ; 0x0201D38C
	stmdb sp!, {r4, lr}
	ldr r1, _0201D3B8 ; =0x00001510
	mov r4, r0
	bl MemZero
	add r1, r4, #0x1500
	mov r2, #1
	strh r2, [r1, #0xa]
	add r0, r4, #0x1000
	strb r2, [r0, #0x50c]
	strh r2, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201D3B8: .word 0x00001510
	arm_func_end sub_0201D38C

	arm_func_start InitWanTable
InitWanTable: ; 0x0201D3BC
	stmdb sp!, {r4, lr}
	mov r1, #0x1500
	mov r4, r0
	bl MemZero
	add r0, r4, #0x1500
	mov r1, #0x60
	strh r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end InitWanTable

	arm_func_start LoadWanTableEntry
LoadWanTableEntry: ; 0x0201D3DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	mov r7, r2
	bl FindWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D418
	mov r1, #0x38
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	b _0201D47C
_0201D418:
	mov r0, r5
	bl AllocateWanTableEntry
	mov r4, r0
	mov r0, #0x38
	smlabb r5, r4, r0, r5
	mov r3, #1
	add r0, sp, #0
	mov r1, r6
	mov r2, r7
	strb r3, [r5, #0x21]
	bl LoadFileFromRom
	ldr r1, [sp]
	mov r0, r5
	str r1, [r5, #0x34]
	ldr r2, [sp, #4]
	mov r1, r6
	str r2, [r5, #0x28]
	bl strcpy
	ldrsh r1, [r5, #0x2c]
	add r0, r5, #0x30
	add r1, r1, #1
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r4
_0201D47C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LoadWanTableEntry

	arm_func_start LoadWanTableEntryFromPack
LoadWanTableEntryFromPack: ; 0x0201D484
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D4C0
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D4C0:
	mov r0, sb
	bl AllocateWanTableEntry
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	ldrb r0, [sp, #0x20]
	mov r1, #2
	strb r1, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	cmp r0, #0
	beq _0201D53C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r7, r0
	mov r1, r6
	bl MemAlloc
	mov r1, r7
	mov r2, sb
	mov r6, r0
	bl DecompressAtNormalVeneer
	b _0201D56C
_0201D53C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r1, r6
	mov sb, r0
	bl MemAlloc
	mov r6, r0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
	str sb, [r4, #0x28]
_0201D56C:
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPack

	arm_func_start LoadWanTableEntryFromPackUseProvidedMemory
LoadWanTableEntryFromPackUseProvidedMemory: ; 0x0201D590
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D5CC
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D5CC:
	mov r0, sb
	bl AllocateWanTableEntry
	ldrb r1, [sp, #0x20]
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	cmp r1, #0
	beq _0201D62C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r2, sb
	mov r1, r0
	mov r0, r6
	bl DecompressAtNormalVeneer
	b _0201D648
_0201D62C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D648:
	mov r0, #2
	strb r0, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPackUseProvidedMemory

	arm_func_start ReplaceWanFromBinFile
ReplaceWanFromBinFile: ; 0x0201D684
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb ip, [sp, #0x18]
	mov r4, #0x38
	smlabb r6, r1, r4, r0
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	beq _0201D6E8
	add r0, r0, #0x1000
	ldr r7, [r0, #0x500]
	mov r0, r5
	mov r1, r4
	ldr r8, [r6, #0x34]
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, r7
	bl GetAtSize
	mov r2, r7
	mov r1, r0
	mov r0, r8
	bl DecompressAtNormalVeneer
	b _0201D708
_0201D6E8:
	ldr r7, [r6, #0x34]
	mov r0, r5
	mov r1, r4
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D708:
	ldr r1, [r6, #0x34]
	add r0, r6, #0x30
	bl HandleSir0TranslationVeneer
	mov r0, #2
	strb r0, [r6, #0x21]
	strh r5, [r6, #0x22]
	strh r4, [r6, #0x24]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ReplaceWanFromBinFile

	arm_func_start DeleteWanTableEntryVeneer
DeleteWanTableEntryVeneer: ; 0x0201D72C
	ldr ip, _0201D734 ; =DeleteWanTableEntry
	bx ip
	.align 2, 0
_0201D734: .word DeleteWanTableEntry
	arm_func_end DeleteWanTableEntryVeneer

	arm_func_start sub_0201D738
sub_0201D738: ; 0x0201D738
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r3, r6, #0x1000
	ldr r3, [r3, #0x500]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	beq _0201D75C
	bl sub_0201D778
_0201D75C:
	mov r0, r5
	mov r1, r4
	bl MemAlloc
	add r1, r6, #0x1000
	str r0, [r1, #0x500]
	str r5, [r1, #0x504]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D738

	arm_func_start sub_0201D778
sub_0201D778: ; 0x0201D778
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x1000
	ldr r0, [r0, #0x500]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	add r0, r4, #0x1000
	mov r1, #0
	str r1, [r0, #0x500]
	str r1, [r0, #0x504]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201D778

	arm_func_start sub_0201D7A8
sub_0201D7A8: ; 0x0201D7A8
	stmdb sp!, {r3, lr}
	ldr r0, _0201D7D8 ; =0x00001510
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201D7DC ; =_020AFC64
	ldr r1, _0201D7D8 ; =0x00001510
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0201D7DC ; =_020AFC64
	ldr r0, [r0, #4]
	bl sub_0201D38C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D7D8: .word 0x00001510
_0201D7DC: .word _020AFC64
	arm_func_end sub_0201D7A8

	arm_func_start sub_0201D7E0
sub_0201D7E0: ; 0x0201D7E0
	ldr r2, _0201D7FC ; =_020AFC64
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _0201D800 ; =sub_0201D738
	mov r1, r3
	bx ip
	.align 2, 0
_0201D7FC: .word _020AFC64
_0201D800: .word sub_0201D738
	arm_func_end sub_0201D7E0

	arm_func_start sub_0201D804
sub_0201D804: ; 0x0201D804
	ldr r0, _0201D814 ; =_020AFC64
	ldr ip, _0201D818 ; =sub_0201D778
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201D814: .word _020AFC64
_0201D818: .word sub_0201D778
	arm_func_end sub_0201D804

	arm_func_start sub_0201D81C
sub_0201D81C: ; 0x0201D81C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r4, [sp, #0x2c]
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r4, #0
	ldrh r7, [r5, #0xe]
	beq _0201D848
	cmp r4, #1
	beq _0201D8E4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D848:
	cmp r3, #0
	beq _0201D8C0
	mov r8, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201D8B8
_0201D860:
	ldr r0, [r5]
	mov r2, sl
	ldr r6, [r0, r8, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r6
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0xc]
	ldr r0, [r6, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201D8B8:
	cmp r8, r7
	blo _0201D860
_0201D8C0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	bl LoadObjPalette
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D8E4:
	cmp r3, #0
	beq _0201D960
	mov r6, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201D958
_0201D8FC:
	ldr r0, [r5]
	mov r2, sl
	ldr r8, [r0, r6, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r8
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0x7c]
	ldr r0, [r8, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r6, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r6, r1, lsr #0x10
_0201D958:
	cmp r6, r7
	blo _0201D8FC
_0201D960:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	add r0, r0, #0x70
	bl LoadObjPalette
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201D988: .word _020AFC30
_0201D98C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201D81C

	arm_func_start sub_0201D990
sub_0201D990: ; 0x0201D990
	stmdb sp!, {r3, lr}
	ldr r1, _0201D9C4 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9C4: .word _020AFC3C
	arm_func_end sub_0201D990

	arm_func_start sub_0201D9C8
sub_0201D9C8: ; 0x0201D9C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x14]
	ldr ip, _0201D9FC ; =_020AFC64
	mov r3, #1
	stmia sp, {r3, lr}
	ldr lr, [ip, #4]
	mov ip, #0x38
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201D81C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9FC: .word _020AFC64
	arm_func_end sub_0201D9C8

	arm_func_start sub_0201DA00
sub_0201DA00: ; 0x0201DA00
	ldrb r1, [r0, #8]
	ldr r0, [r0]
	cmp r1, #0
	cmpne r1, #2
	ldreq r0, [r0, #8]
	ldreqsh r0, [r0, #4]
	ldrnesh r0, [r0, #0xc]
	bx lr
	arm_func_end sub_0201DA00

	arm_func_start sub_0201DA20
sub_0201DA20: ; 0x0201DA20
	ldr r2, _0201DA3C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DA40 ; =sub_0201DA00
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA3C: .word _020AFC64
_0201DA40: .word sub_0201DA00
	arm_func_end sub_0201DA20

	arm_func_start WanHasAnimationGroup
WanHasAnimationGroup: ; 0x0201DA44
	ldr r2, [r0]
	ldrsh r0, [r2, #0xc]
	cmp r1, r0
	bge _0201DA70
	cmp r1, #0
	blt _0201DA70
	ldr r0, [r2, #8]
	add r0, r0, r1, lsl #3
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0201DA78
_0201DA70:
	mov r0, #0
	bx lr
_0201DA78:
	mov r0, #1
	bx lr
	arm_func_end WanHasAnimationGroup

	arm_func_start WanTableSpriteHasAnimationGroup
WanTableSpriteHasAnimationGroup: ; 0x0201DA80
	ldr r3, _0201DA9C ; =_020AFC64
	mov r2, #0x38
	ldr r3, [r3, #4]
	ldr ip, _0201DAA0 ; =WanHasAnimationGroup
	smlabb r0, r0, r2, r3
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA9C: .word _020AFC64
_0201DAA0: .word WanHasAnimationGroup
	arm_func_end WanTableSpriteHasAnimationGroup

	arm_func_start sub_0201DAA4
sub_0201DAA4: ; 0x0201DAA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r3, #0
	ldrh r7, [r5, #0xe]
	beq _0201DACC
	cmp r3, #1
	beq _0201DB38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DACC:
	mov r8, #0
	mov r6, r8
	ldr r4, _0201DBB0 ; =_020AFC30
	ldr fp, _0201DBB4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201DB2C
_0201DAE0:
	str r6, [sp]
	ldmia r5, {r0, r2}
	ldr r0, [r0, r8, lsl #2]
	mov r1, sl
	mov r3, sb
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r1, [fp]
	ldrh r3, [r2, #4]
	ldrh r2, [r1, #0xc]
	mov r1, r3, lsl #1
	ldrh r1, [r4, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DB2C:
	cmp r8, r7
	blo _0201DAE0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DB38:
	mov r8, #0
	mov r4, #1
	ldr fp, _0201DBB0 ; =_020AFC30
	b _0201DBA4
_0201DB48:
	ldr r0, [r5]
	mov r1, sl
	ldr r6, [r0, r8, lsl #2]
	mov r3, sb
	str r4, [sp]
	ldr r2, [r5, #4]
	mov r0, r6
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r0, _0201DBB4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r6, #4]
	ldrh r2, [r1, #0x7c]
	mov r1, r3, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DBA4:
	cmp r8, r7
	blo _0201DB48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201DBB0: .word _020AFC30
_0201DBB4: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201DAA4

	arm_func_start sub_0201DBB8
sub_0201DBB8: ; 0x0201DBB8
	stmdb sp!, {r3, lr}
	ldr lr, _0201DBD8 ; =_020AFC64
	mov ip, #0x38
	ldr lr, [lr, #4]
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201DAA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DBD8: .word _020AFC64
	arm_func_end sub_0201DBB8

	arm_func_start sub_0201DBDC
sub_0201DBDC: ; 0x0201DBDC
	ldr r0, [r0, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _0201DC30
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldrsh r0, [r1, #6]
	addne r1, r0, #0xf
	movne r0, r1, asr #3
	addne r0, r1, r0, lsr #28
	movne r0, r0, lsl #0xc
	addeq r1, r0, #0xff
	moveq r0, r1, asr #7
	addeq r0, r1, r0, lsr #24
	moveq r0, r0, lsl #8
	mov r0, r0, asr #0x10
	bx lr
_0201DC30:
	ldrsh r0, [r1, #6]
	add r1, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, lsl #0xc
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201DBDC

	arm_func_start sub_0201DC4C
sub_0201DC4C: ; 0x0201DC4C
	ldr r2, _0201DC68 ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DC6C ; =sub_0201DBDC
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DC68: .word _020AFC64
_0201DC6C: .word sub_0201DBDC
	arm_func_end sub_0201DC4C

	arm_func_start SpriteTypeInWanTable
SpriteTypeInWanTable: ; 0x0201DC70
	ldr r2, _0201DC8C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0201DC8C: .word _020AFC64
	arm_func_end SpriteTypeInWanTable

	arm_func_start sub_0201DC90
sub_0201DC90: ; 0x0201DC90
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCC8 ; =0x000007C4
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201DCCC ; =_020AFC6C
	ldr r1, _0201DCC8 ; =0x000007C4
	str r0, [r2]
	bl MemZero
	ldr r0, _0201DCCC ; =_020AFC6C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCC8: .word 0x000007C4
_0201DCCC: .word _020AFC6C
	arm_func_end sub_0201DC90

	arm_func_start sub_0201DCD0
sub_0201DCD0: ; 0x0201DCD0
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCF0 ; =_020AFC6C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201DCF0 ; =_020AFC6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCF0: .word _020AFC6C
	arm_func_end sub_0201DCD0

	arm_func_start sub_0201DCF4
sub_0201DCF4: ; 0x0201DCF4
	ldr r0, _0201DD44 ; =_020AFC6C
	mov r2, #0
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x7c2]
	ldr r2, [r0]
	mov r1, #0x7c
	b _0201DD30
_0201DD14:
	smlabb r0, r3, r1, r2
	ldrh r0, [r0, #2]
	tst r0, #1
	bxeq lr
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_0201DD30:
	cmp r3, #0x10
	blt _0201DD14
	mov r0, #1
	strb r0, [r2, #0x7c2]
	bx lr
	.align 2, 0
_0201DD44: .word _020AFC6C
	arm_func_end sub_0201DCF4

	arm_func_start sub_0201DD48
sub_0201DD48: ; 0x0201DD48
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0201DD8C ; =_020AFC6C
	mov r6, #1
	mov r4, #0x7c
_0201DD58:
	ldr r0, [r5]
	smlabb r0, r6, r4, r0
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _0201DD70
	bl DisplayAndSwitchAnimationControlCurrentFrame
_0201DD70:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	blt _0201DD58
	bl sub_0201DCF4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DD8C: .word _020AFC6C
	arm_func_end sub_0201DD48

	arm_func_start sub_0201DD90
sub_0201DD90: ; 0x0201DD90
	stmdb sp!, {r3, lr}
	mov r0, #0x2ec
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201DDF0 ; =_020AFC70
	str r0, [r1]
	bl sub_0201E614
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r1, _0201DDF4 ; =0x06860000
	ldr r0, [r0]
	add r2, r1, #0x30000
	add r0, r0, #0xbc
	mov r3, #0x80
	bl sub_0201E190
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r2, _0201DDF8 ; =0x06890000
	ldr r1, [r0]
	mov r0, #0x2000
	str r0, [sp]
	add r0, r1, #0xcc
	add r1, r1, #0xbc
	mov r3, #0
	bl sub_0201E314
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DDF0: .word _020AFC70
_0201DDF4: .word 0x06860000
_0201DDF8: .word 0x06890000
	arm_func_end sub_0201DD90

	arm_func_start sub_0201DDFC
sub_0201DDFC: ; 0x0201DDFC
	stmdb sp!, {r3, lr}
	bl sub_0201E5B0
	bl GeomSwapBuffers
	bl sub_0201E544
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201DDFC

	arm_func_start sub_0201DE10
sub_0201DE10: ; 0x0201DE10
	stmdb sp!, {r3, lr}
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xcc
	bl sub_0201E424
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl PerformPlannedTextureVramTransfer
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl ResetPlannedVramTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DE48: .word _020AFC70
	arm_func_end sub_0201DE10

	arm_func_start LoadWteFromRom
LoadWteFromRom: ; 0x0201DE4C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x10c
	mov r5, r1
	mov r6, r0
	ldr r1, _0201DEBC ; =_02099714
	add r0, sp, #0xc
	mov r4, r2
	bl strcpy
	add r0, sp, #0xc
	mov r1, r5
	bl strcat
	add r0, sp, #4
	add r1, sp, #0xc
	mov r2, r4
	bl LoadFileFromRom
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	ldr r1, _0201DEC0 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp]
	str r0, [r6, #4]
	add sp, sp, #0x10c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201DEBC: .word _02099714
_0201DEC0: .word _0209971C
	arm_func_end LoadWteFromRom

	arm_func_start LoadWteFromFileDirectory
LoadWteFromFileDirectory: ; 0x0201DEC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, r1
	mov r1, r2
	add r2, sp, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp]
	add r0, sp, #8
	bl HandleSir0Translation
	ldr r0, [sp, #8]
	ldr r1, _0201DF14 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201DF14: .word _0209971C
	arm_func_end LoadWteFromFileDirectory

	arm_func_start UnloadWte
UnloadWte: ; 0x0201DF18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadWte

	arm_func_start sub_0201DF38
sub_0201DF38: ; 0x0201DF38
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x108
	mov r6, r0
	mov r0, #8
	mov r5, r1
	bl MemAlloc
	mov r4, r0
	ldr r1, _0201DFAC ; =_02099714
	add r0, sp, #8
	bl strcpy
	add r0, sp, #8
	mov r1, r6
	bl strcat
	add r0, sp, #0
	add r1, sp, #8
	mov r2, r5
	bl LoadFileFromRom
	ldr r5, [sp]
	ldr r1, _0201DFB0 ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DFAC: .word _02099714
_0201DFB0: .word _02099720
	arm_func_end sub_0201DF38

	arm_func_start LoadWtuFromBin
LoadWtuFromBin: ; 0x0201DFB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r6, r1
	mov r1, r5
	mov r0, #8
	bl MemAlloc
	mov r4, r0
	add r2, sp, #0
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r5, [sp]
	ldr r1, _0201E01C ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201E01C: .word _02099720
	arm_func_end LoadWtuFromBin

	arm_func_start sub_0201E020
sub_0201E020: ; 0x0201E020
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E020

	arm_func_start sub_0201E050
sub_0201E050: ; 0x0201E050
	stmdb sp!, {r3, lr}
	ldr ip, _0201E07C ; =_020AFC70
	str r3, [sp]
	ldr ip, [ip]
	mov lr, r1
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E07C: .word _020AFC70
	arm_func_end sub_0201E050

	arm_func_start sub_0201E080
sub_0201E080: ; 0x0201E080
	stmdb sp!, {r3, lr}
	mov r2, #2
	ldr r1, _0201E0AC ; =_020AFC70
	str r2, [sp]
	mov r2, #0
	ldr ip, [r1]
	mov r1, r0
	mov r3, r2
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E0AC: .word _020AFC70
	arm_func_end sub_0201E080

	arm_func_start ProcessWte
ProcessWte: ; 0x0201E0B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov ip, r1
	ldr r1, [r6, #4]
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _0201E0F4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0201E128 ; =_020AFC70
	ldr r3, [r6, #8]
	ldr r0, [r0]
	mov r2, ip
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
_0201E0F4:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _0201E120
	ldr r0, _0201E128 ; =_020AFC70
	str r4, [sp]
	ldr r0, [r0]
	ldrsh r2, [r6, #0x1c]
	ldr r1, [r6, #0x18]
	mov r3, r5
	add r0, r0, #0xcc
	bl sub_0201E3AC
_0201E120:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201E128: .word _020AFC70
	arm_func_end ProcessWte

	arm_func_start sub_0201E12C
sub_0201E12C: ; 0x0201E12C
	ldr ip, _0201E138 ; =ProcessWte
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201E138: .word ProcessWte
	arm_func_end sub_0201E12C

	arm_func_start DelayWteFree
DelayWteFree: ; 0x0201E13C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r2, #2
	ldr r1, _0201E180 ; =_020AFC70
	str r2, [sp]
	mov r4, r0
	ldr r0, [r1]
	mov r2, #0
	ldr r1, [r4]
	mov r3, r2
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E180: .word _020AFC70
	arm_func_end DelayWteFree

	arm_func_start sub_0201E184
sub_0201E184: ; 0x0201E184
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201E184

	arm_func_start sub_0201E190
sub_0201E190: ; 0x0201E190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0x1c
	mul r4, r3, ip
	mov r7, r0
	mov r6, r1
	mov r0, r4
	mov r1, #0
	mov r5, r2
	bl MemAlloc
	mov r1, r4
	str r0, [r7]
	bl MemZero
	mov r0, #0
	strh r0, [r7, #0xc]
	str r6, [r7, #4]
	str r5, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201E190

	arm_func_start ResetPlannedVramTransfer
ResetPlannedVramTransfer: ; 0x0201E1D4
	mov r1, #0
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end ResetPlannedVramTransfer

	arm_func_start PlanCopyTextureToTextureVram
PlanCopyTextureToTextureVram: ; 0x0201E1E0
	stmdb sp!, {r4, lr}
	ldrsh r4, [r0, #0xc]
	cmp r4, #0x80
	mvnge r0, #0
	ldmgeia sp!, {r4, pc}
	ldr lr, [r0]
	mov ip, #0x1c
	smlabb ip, r4, ip, lr
	str r3, [ip, #4]
	str r1, [ip, #8]
	ldrb r3, [sp, #8]
	str r2, [ip, #0xc]
	mov r1, #0
	str r3, [ip, #0x10]
	strb r1, [ip, #0x14]
	ldrsh r1, [r0, #0xc]
	add r1, r1, #1
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end PlanCopyTextureToTextureVram

	arm_func_start PerformPlannedTextureVramTransfer
PerformPlannedTextureVramTransfer: ; 0x0201E230
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r7, [r4, #0xc]
	mov r6, #0
	ldr fp, _0201E310 ; =_022A4F38
	mov r5, #0x1c
	b _0201E304
_0201E24C:
	ldr r0, [r4]
	smlabb r1, r6, r5, r0
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0201E274
	cmp r0, #1
	beq _0201E2C8
	cmp r0, #2
	beq _0201E2F0
	b _0201E2F8
_0201E274:
	ldr sl, [r1, #8]
	cmp sl, #0
	beq _0201E2A4
	ldr sb, [r1, #4]
	ldr r8, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2A4:
	ldr r8, [r1, #4]
	ldr sb, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, fp
	mov r1, sb
	mov r2, r8
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2C8:
	ldr sl, [r1, #4]
	ldr sb, [r1, #0xc]
	ldr r8, [r1, #8]
	bl GX_BeginLoadTexPltt
	mov r0, r8
	mov r1, sb
	mov r2, sl
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	b _0201E2F8
_0201E2F0:
	ldr r0, [r1, #8]
	bl MemFree
_0201E2F8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0201E304:
	cmp r6, r7
	blt _0201E24C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201E310: .word _022A4F38
	arm_func_end PerformPlannedTextureVramTransfer

	arm_func_start sub_0201E314
sub_0201E314: ; 0x0201E314
	stmdb sp!, {r4, lr}
	ldr ip, [sp, #8]
	mov r4, r0
	mov r0, ip, asr #7
	add r0, ip, r0, lsr #24
	stmia r4, {r1, ip}
	mov r0, r0, asr #8
	str r0, [r4, #8]
	mov r1, #0
	strb r1, [r4, #0xc]
	str r2, [r4, #0x10]
	str r3, [r4, #0x14]
	mov r0, ip, lsl #1
	bl MemAlloc
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	mov r1, #0
	bl MemAlloc
	str r0, [r4, #0x1c]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x18]
	mov r1, r1, lsl #1
	bl MemZero
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #8]
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E314
