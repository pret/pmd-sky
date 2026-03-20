	.include "asm/macros.inc"
	.include "main_0205B0B8.inc"

	.text

	arm_func_start sub_0205B0B8
sub_0205B0B8: ; 0x0205B0B8
	stmdb sp!, {r3, lr}
	ldrsh r1, [r0, #0x56]
	mov r2, #0x10
	mov lr, #0
	mov r3, lr
	sub ip, r1, #1
	sub r2, r2, #0xc
	b _0205B110
_0205B0D8:
	cmp ip, #0
	cmpge r2, #0x10
	blt _0205B104
	cmp ip, #0x1e
	bge _0205B118
	add r1, r0, ip
	ldrb r1, [r1, #0x58]
	cmp r1, #0
	beq _0205B104
	cmp r3, #1
	addge lr, lr, #1
_0205B104:
	add r3, r3, #1
	add ip, ip, #1
	add r2, r2, #0xc
_0205B110:
	cmp r3, #0xa
	blt _0205B0D8
_0205B118:
	mov r0, lr
	ldmia sp!, {r3, pc}
	arm_func_end sub_0205B0B8

; https://decomp.me/scratch/gWhya
	arm_func_start sub_0205B120
sub_0205B120: ; 0x0205B120
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, #0
	strh r6, [r5]
	strh r6, [r5, #2]
	strh r6, [r5, #4]
	mov r4, r2
	strh r6, [r5, #6]
	add r0, sp, #0
	mov r7, r1
	mov r2, r3
	strh r6, [r5, #8]
	bl EnableAllLearnableIqSkills
	mov r0, r7
	mov r1, r6
	bl GetType
	mov r6, r0
	mov r0, r7
	mov r1, #1
	bl GetType
	mov r3, r0
	mov r1, r7
	mov r2, r6
	add r0, sp, #0xc
	bl sub_02011220
	add r0, sp, #0xc
	bl GetHpBoostFromExclusiveItems
	ldrsh r2, [r5]
	ldrb r1, [sp, #0x38]
	add r0, r2, r0
	strh r0, [r5]
	cmp r1, #0
	ldrsh r1, [r5, #2]
	ldrb r0, [sp, #0xc]
	add r0, r1, r0
	strh r0, [r5, #2]
	ldrsh r1, [r5, #4]
	ldrb r0, [sp, #0xd]
	add r0, r1, r0
	strh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	ldrb r0, [sp, #0xe]
	add r0, r1, r0
	strh r0, [r5, #6]
	ldrsh r1, [r5, #8]
	ldrb r0, [sp, #0xf]
	add r0, r1, r0
	strh r0, [r5, #8]
	bne _0205B30C
	cmp r4, #0
	beq _0205B30C
	ldrb r0, [r4]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0205B30C
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0205B30C
	ldrsh r0, [r4, #4]
	cmp r0, #0x1a
	ldreq r0, _0205B338 ; =POWER_BAND_STAT_BOOST
	ldreqsh r1, [r5, #2]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #2]
	ldrsh r0, [r4, #4]
	cmp r0, #0x32
	ldreq r0, _0205B33C ; =MUNCH_BELT_STAT_BOOST
	ldreqsh r1, [r5, #2]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #2]
	ldrsh r0, [r4, #4]
	cmp r0, #0x28
	ldreq r0, _0205B340 ; =SPECIAL_BAND_STAT_BOOST
	ldreqsh r1, [r5, #4]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0x32
	ldreq r0, _0205B33C ; =MUNCH_BELT_STAT_BOOST
	ldreqsh r1, [r5, #4]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0x25
	ldreq r0, _0205B344 ; =DEF_SCARF_STAT_BOOST
	ldreqsh r1, [r5, #6]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #6]
	ldrsh r0, [r4, #4]
	cmp r0, #0x29
	ldreq r0, _0205B348 ; =ZINC_BAND_STAT_BOOST
	ldreqsh r1, [r5, #8]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #8]
	ldrsh r0, [r4, #4]
	bl IsAuraBow
	cmp r0, #0
	beq _0205B30C
	ldr r0, _0205B34C ; =AURA_BOW_STAT_BOOST
	ldrsh r1, [r5, #2]
	ldrsh r2, [r0]
	add r0, r1, r2
	strh r0, [r5, #2]
	ldrsh r0, [r5, #4]
	add r0, r0, r2
	strh r0, [r5, #4]
	ldrsh r0, [r5, #6]
	add r0, r0, r2
	strh r0, [r5, #6]
	ldrsh r0, [r5, #8]
	add r0, r0, r2
	strh r0, [r5, #8]
_0205B30C:
	add r0, sp, #0
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r0, #0
	ldrne r0, _0205B350 ; =_020A1870
	ldrnesh r1, [r5]
	ldrnesh r0, [r0]
	addne r0, r1, r0
	strneh r0, [r5]
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0205B338: .word POWER_BAND_STAT_BOOST
_0205B33C: .word MUNCH_BELT_STAT_BOOST
_0205B340: .word SPECIAL_BAND_STAT_BOOST
_0205B344: .word DEF_SCARF_STAT_BOOST
_0205B348: .word ZINC_BAND_STAT_BOOST
_0205B34C: .word AURA_BOW_STAT_BOOST
_0205B350: .word _020A1870
	arm_func_end sub_0205B120
