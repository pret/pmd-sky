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
