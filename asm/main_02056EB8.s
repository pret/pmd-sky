	.include "asm/macros.inc"
	.include "main_02056EB8.inc"

	.text

	arm_func_start sub_02056EB8
sub_02056EB8: ; 0x02056EB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02056F5C ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	add r0, r1, #0x9000
	ldr r4, [r0, #0x84c]
	mov r6, r5
	mov r7, r5
	mov sb, r5
	mov sl, #1
_02056EE4:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sl
	moveq r0, sb
	tst r0, #0xff
	beq _02056F1C
	ldrsh r0, [r4, #8]
	bl sub_02056410
	cmp r0, #0
	beq _02056F1C
	ldrsh r0, [r4, #0xc]
	bl GetBodySize
	add r6, r6, r0
	add r5, r5, #1
_02056F1C:
	add r7, r7, #1
	cmp r7, #4
	add r4, r4, #0x68
	blt _02056EE4
	cmp r5, #4
	movge r0, #0
	ldmgeia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r8, #0
	beq _02056F4C
	mov r0, r8
	bl GetBodySize
	add r6, r6, r0
_02056F4C:
	cmp r6, #6
	movgt r0, #0
	movle r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056F5C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056EB8

	arm_func_start sub_02056F60
sub_02056F60: ; 0x02056F60
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02057000
	ldr r1, _0205700C ; =TEAM_MEMBER_TABLE_PTR
	ldr r3, [r1]
	add r1, r3, #0x9000
	ldrb r1, [r1, #0x877]
	cmp r1, #0
	bne _02056FB8
	mov r2, #0
	b _02056FAC
_02056F90:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x5e]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, r2, #1
_02056FAC:
	cmp r2, #4
	blt _02056F90
	b _02056FEC
_02056FB8:
	cmp r1, #1
	bne _02056FEC
	mov r2, #0
	b _02056FE4
_02056FC8:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, r2, #1
_02056FE4:
	cmp r2, #4
	blt _02056FC8
_02056FEC:
	mov r1, #0x44
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #4]
	bl sub_02056EB8
	ldmia sp!, {r3, pc}
_02057000:
	mov r0, #0
	bl sub_02056EB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205700C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056F60

	arm_func_start sub_02057010
sub_02057010: ; 0x02057010
	ldr r1, _02057028 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _0205702C ; =sub_02057030
	ldr r1, [r1]
	add r1, r1, #0x9000
	ldrb r1, [r1, #0x877]
	bx ip
	.align 2, 0
_02057028: .word TEAM_MEMBER_TABLE_PTR
_0205702C: .word sub_02057030
	arm_func_end sub_02057010

	arm_func_start sub_02057030
sub_02057030: ; 0x02057030
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r0, sb
	bl sub_020568DC
	mov r4, r0
	cmp sl, #0
	mvn r0, #0
	addeq sl, sp, #0
	mov r8, #0
	cmp r4, r0
	beq _0205707C
	mov r0, r4
	bl IsValidTeamMember
	cmp r0, #0
	strneh r4, [sl]
	addne r8, r8, #1
	mvneq r4, #0
_0205707C:
	mov r7, #0
	mvn fp, #0
_02057084:
	ldr r0, _0205717C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	add r0, r2, sb, lsl #3
	add r0, r0, r7, lsl #1
	add r0, r0, #0x9800
	ldrsh r5, [r0, #0x56]
	cmp r5, fp
	cmpne r4, r5
	beq _020570F8
	mov r1, #0x44
	mov r0, r5
	smlabb r6, r5, r1, r2
	bl sub_02055410
	cmp r0, #0
	bne _020570EC
	mov r0, r5
	bl sub_02055474
	cmp r0, #0
	bne _020570EC
	mov r0, r5
	bl sub_020554D8
	cmp r0, #0
	bne _020570EC
	ldrsh r0, [r6, #4]
	cmp r0, #0x214
	bne _020570F8
_020570EC:
	mov r0, r8, lsl #1
	strh r5, [sl, r0]
	add r8, r8, #1
_020570F8:
	add r7, r7, #1
	cmp r7, #4
	blt _02057084
	mov r0, #0
	ldr r3, _0205717C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mvn r2, #0
_02057114:
	ldr r1, [r3]
	add r1, r1, sb, lsl #3
	add r1, r1, r0, lsl #1
	add r1, r1, #0x9800
	ldrsh r6, [r1, #0x56]
	cmp r6, r2
	beq _02057164
	mov r5, r4
	b _0205714C
_02057138:
	mov r1, r5, lsl #1
	ldrsh r1, [sl, r1]
	cmp r6, r1
	beq _02057154
	add r5, r5, #1
_0205714C:
	cmp r5, r8
	blt _02057138
_02057154:
	cmp r5, r8
	movge r1, r8, lsl #1
	strgeh r6, [sl, r1]
	addge r8, r8, #1
_02057164:
	add r0, r0, #1
	cmp r0, #4
	blt _02057114
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205717C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057030

	arm_func_start sub_02057180
sub_02057180: ; 0x02057180
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	sub sp, sp, #0x400
	add r0, sp, #0
	bl sub_020559D8
	mov r8, #0
	ldr fp, _020572E0 ; =_020A3398
	ldr r5, _020572E4 ; =TEAM_MEMBER_TABLE_PTR
	add r6, sp, #0
	mov r7, r8
	mvn r4, #0
_020571AC:
	mov sb, r7
_020571B0:
	ldr r0, [r5]
	add r0, r0, r8, lsl #3
	add r0, r0, sb, lsl #1
	add r0, r0, #0x9800
	ldrsh sl, [r0, #0x56]
	cmp sl, r4
	beq _02057200
	mov r0, sl, lsl #1
	ldrsh r3, [r6, r0]
	mov r0, fp
	mov r1, r8
	mov r2, sl
	bl Debug_Print0
	ldr r0, [r5]
	mov r1, sl, lsl #1
	add r0, r0, r8, lsl #3
	add r0, r0, sb, lsl #1
	ldrsh r1, [r6, r1]
	add r0, r0, #0x9800
	strh r1, [r0, #0x56]
_02057200:
	add sb, sb, #1
	cmp sb, #4
	blt _020571B0
	add r8, r8, #1
	cmp r8, #3
	blt _020571AC
	mov sb, #0
_0205721C:
	ldr r0, _020572E4 ; =TEAM_MEMBER_TABLE_PTR
	mov sl, #0
	ldr r0, [r0]
	mov r1, #0x1a0
	add r0, r0, #0x36c
	add r0, r0, #0x9000
	mla r8, sb, r1, r0
	mov fp, #1
	add r7, sp, #0
	mov r5, sl
	mov r6, sl
	mvn r4, #0
_0205724C:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _020572B0
	ldrsh r2, [r8, #8]
	ldr r0, _020572E8 ; =_020A33B8
	mov r1, sb
	mov r3, r2, lsl #1
	ldrsh r3, [r7, r3]
	bl Debug_Print0
	ldrsh r0, [r8, #8]
	mov r1, r0, lsl #1
	ldrsh r1, [r7, r1]
	cmp r1, r4
	streqb r6, [r8]
	beq _020572B0
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	ldrnesh r0, [r8, #8]
	movne r0, r0, lsl #1
	ldrnesh r0, [r7, r0]
	strneh r0, [r8, #8]
	streqb r5, [r8]
_020572B0:
	add sl, sl, #1
	cmp sl, #4
	add r8, r8, #0x68
	blt _0205724C
	and r0, sb, #0xff
	bl sub_02057464
	add sb, sb, #1
	cmp sb, #3
	blt _0205721C
	add sp, sp, #0x58
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020572E0: .word _020A3398
_020572E4: .word TEAM_MEMBER_TABLE_PTR
_020572E8: .word _020A33B8
	arm_func_end sub_02057180

	arm_func_start sub_020572EC
sub_020572EC: ; 0x020572EC
	ldr r0, _02057304 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _02057308 ; =sub_0205730C
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_02057304: .word TEAM_MEMBER_TABLE_PTR
_02057308: .word sub_0205730C
	arm_func_end sub_020572EC

	arm_func_start sub_0205730C
sub_0205730C: ; 0x0205730C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _0205739C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r8, #0
	add r0, r0, #0x36c
	mov r1, #0x1a0
	add r0, r0, #0x9000
	mla r7, r4, r1, r0
	mov r5, r8
	mov r6, #1
_02057338:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _02057388
	ldrsh r0, [r7, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057388
	ldrsh r0, [r7, #8]
	bl IsValidTeamMember
	cmp r0, #0
	beq _02057388
	ldrsh r1, [r7, #8]
	mov r2, r8, lsl #0x10
	mov r0, r7
	mov r3, r4
	mov r2, r2, asr #0x10
	bl sub_02053174
_02057388:
	add r8, r8, #1
	cmp r8, #4
	add r7, r7, #0x68
	blt _02057338
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205739C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205730C

	arm_func_start sub_020573A0
sub_020573A0: ; 0x020573A0
	ldr r0, _020573B8 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _020573BC ; =sub_020573C0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_020573B8: .word TEAM_MEMBER_TABLE_PTR
_020573BC: .word sub_020573C0
	arm_func_end sub_020573A0

	arm_func_start sub_020573C0
sub_020573C0: ; 0x020573C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02057440 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r1, [r1]
	mov r2, #0x1a0
	add r1, r1, #0x36c
	add r1, r1, #0x9000
	mla r7, r0, r2, r1
	mov r5, r4
	mov r6, #1
_020573E8:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0205742C
	ldrsh r0, [r7, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _0205742C
	ldrsh r0, [r7, #8]
	bl IsValidTeamMember
	cmp r0, #0
	beq _0205742C
	ldrsh r0, [r7, #8]
	mov r1, r7
	bl sub_0205349C
_0205742C:
	add r4, r4, #1
	cmp r4, #4
	add r7, r7, #0x68
	blt _020573E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057440: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020573C0

	arm_func_start sub_02057444
sub_02057444: ; 0x02057444
	ldr r0, _0205745C ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _02057460 ; =sub_02057464
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_0205745C: .word TEAM_MEMBER_TABLE_PTR
_02057460: .word sub_02057464
	arm_func_end sub_02057444

	arm_func_start sub_02057464
sub_02057464: ; 0x02057464
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x8c
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	mov sl, #0
	ldr r2, [r1]
	mov r5, r0
	add r0, r2, r5, lsl #1
	add r0, r0, #0x9800
	ldrsh r1, [r0, #0x50]
	mvn r4, #0
	mov fp, sl
	cmp r1, r4
	addne r0, r2, r5, lsl #3
	addne r0, r0, r1, lsl #1
	addne r0, r0, #0x9800
	ldrnesh r4, [r0, #0x56]
	add r0, r2, #0x36c
	add r1, r0, #0x9000
	mov r0, #0x1a0
	mla sb, r5, r0, r1
	mov r6, #1
	add r7, sp, #0x1c
	mvn r8, #0
_020574C0:
	ldrb r0, [sb]
	mov r1, sl, lsl #1
	strh r8, [r7, r1]
	tst r0, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _02057514
	ldrsh r0, [sb, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057514
	ldrsh r0, [sb, #8]
	bl IsValidTeamMember
	cmp r0, #0
	ldrnesh r1, [sb, #8]
	movne r0, sl, lsl #1
	strneh r1, [r7, r0]
	bne _02057514
	ldrsh r0, [sb, #8]
	bl sub_020566C4
_02057514:
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #0x68
	blt _020574C0
	add r0, sp, #0x14
	mov r1, r5
	bl sub_02057030
	str r0, [sp, #0xc]
	ldr r0, _020577B8 ; =_020A33D4
	ldr r2, [sp, #0xc]
	mov r1, r5
	bl Debug_Print0
	mov r0, #0x1a0
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0
	mul r2, r5, r0
	ldr r1, [r1]
	mov sl, r7
	add r0, r1, #0x36c
	add r0, r0, #0x9000
	add r8, r0, r2
	add r0, r1, r2
	str r0, [sp, #8]
	b _0205767C
_02057574:
	add r0, sp, #0x14
	mov r1, sl, lsl #1
	ldrsh r0, [r0, r1]
	mov sb, r8
	mov r6, #0
	str r0, [sp]
	mov r0, r0
	cmp r4, r0
	moveq r0, sl, lsl #0x10
	moveq r7, r0, asr #0x10
	add r2, sp, #0x1c
	b _020575C0
_020575A4:
	mov r0, r6, lsl #1
	ldrsh r1, [r2, r0]
	ldr r0, [sp]
	cmp r1, r0
	beq _020575C8
	add r6, r6, #1
	add sb, sb, #0x68
_020575C0:
	cmp r6, #4
	blt _020575A4
_020575C8:
	cmp r6, #4
	bge _02057678
	cmp sl, r6
	beq _02057678
	ldr r0, [sp, #8]
	mov r1, #0x68
	mla r0, sl, r1, r0
	str r0, [sp, #4]
	add r0, r0, #0x36c
	add ip, sp, #0x24
	add lr, r0, #0x9000
	mov fp, #6
_020575F8:
	subs fp, fp, #1
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	bne _020575F8
	ldr r0, [sp, #4]
	add r2, r0, #0x36c
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	mov ip, sb
	add fp, r2, #0x9000
	mov lr, #6
_02057624:
	ldmia ip!, {r0, r1, r2, r3}
	stmia fp!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _02057624
	ldmia ip, {r0, r1}
	stmia fp, {r0, r1}
	add fp, sp, #0x24
	mov ip, #6
_02057644:
	ldmia fp!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02057644
	add r3, sp, #0x1c
	mov ip, sl, lsl #1
	ldrsh r2, [r3, ip]
	mov r6, r6, lsl #1
	ldmia fp, {r0, r1}
	stmia sb, {r0, r1}
	ldr r0, [sp]
	strh r2, [r3, r6]
	strh r0, [r3, ip]
_02057678:
	add sl, sl, #1
_0205767C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _02057574
	mov r1, #0
	mov sl, r1
	add r0, sp, #0x10
_02057694:
	strb sl, [r0, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _02057694
	add sb, sp, #0x14
	add r6, sp, #0x1c
	add r4, sp, #0x10
	mov fp, #1
	b _0205774C
_020576B8:
	ldr r0, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	mov r0, sl, lsl #1
	add r1, r1, r5, lsl #3
	add r1, r1, sl, lsl #1
	ldrsh r3, [sb, r0]
	add r1, r1, #0x9800
	ldrsh r2, [r6, r0]
	strh r3, [r1, #0x56]
	ldrsh r1, [sb, r0]
	cmp r2, r1
	beq _020576FC
	mov r0, r8
	mov r2, sl, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_020530D4
	b _02057724
_020576FC:
	ldrb r0, [r8, #0x3e]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r1, sl, #1
	ldrneb r0, [r8, #0x3f]
	andne r1, r1, #0xff
	strneb r1, [r4, r0]
	strneb r1, [r8, #0x3f]
_02057724:
	strh sl, [r8, #0xa]
	ldrb r0, [r8]
	cmp r7, sl
	add sl, sl, #1
	orr r0, r0, #2
	strb r0, [r8]
	streqb fp, [r8, #1]
	movne r0, #0
	strneb r0, [r8, #1]
	add r8, r8, #0x68
_0205774C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _020576B8
	mvn r3, #0
	mov r2, #0
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	b _02057784
_02057768:
	ldr r0, [r1]
	add r0, r0, r5, lsl #3
	add r0, r0, sl, lsl #1
	add r0, r0, #0x9800
	strh r3, [r0, #0x56]
	strb r2, [r8], #0x68
	add sl, sl, #1
_02057784:
	cmp sl, #4
	blt _02057768
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0x10
	ldr r2, [r1]
	mov r1, r5
	add r2, r2, r5, lsl #1
	add r2, r2, #0x9800
	strh r7, [r2, #0x50]
	bl sub_0200FA0C
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020577B4: .word TEAM_MEMBER_TABLE_PTR
_020577B8: .word _020A33D4
	arm_func_end sub_02057464

	arm_func_start sub_020577BC
sub_020577BC: ; 0x020577BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	ldr r0, _02057A24 ; =_020A340C
	bl Debug_Print0
	cmp sl, #0xff
	beq _02057904
	mov r0, sl
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _020578E0
	ldr r4, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, _02057A2C ; =_020A336C
	ldr r3, [r4]
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r3, #0x9000
	ldr r8, [r0, #0x84c]
	strb r2, [sp, #4]
	strb r1, [sp, #5]
	mov sb, #0
	and r7, r2, #0xff
	and r6, r1, #0xff
	add r5, sp, #0x1c
	mov fp, #0x44
_02057820:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020578D0
	strb r7, [sp, #6]
	strb r6, [sp, #7]
	mov r0, #0
	str r0, [sp]
	ldrsh r1, [r8, #8]
	ldr ip, [r4]
	add r0, sp, #8
	smlabb r1, r1, fp, ip
	ldrsh r1, [r1, #4]
	mov r2, #0
	add r3, sp, #6
	bl sub_02052E2C
	ldrb r0, [sp, #9]
	add r3, r8, #0x4c
	strb r0, [r8, #2]
	ldrsh r0, [sp, #0x10]
	strh r0, [r8, #6]
	ldrsh r0, [sp, #0x12]
	strh r0, [r8, #0xe]
	ldrsh r0, [sp, #0x12]
	strh r0, [r8, #0x10]
	ldrb r0, [sp, #0x14]
	strb r0, [r8, #0x12]
	ldrb r0, [sp, #0x15]
	strb r0, [r8, #0x13]
	ldrb r0, [sp, #0x16]
	strb r0, [r8, #0x14]
	ldrb r0, [sp, #0x17]
	strb r0, [r8, #0x15]
	ldr r0, [sp, #0x18]
	str r0, [r8, #0x18]
	ldmia r5, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldrb r2, [sp, #0x28]
	add r0, r8, #0x1c
	add r1, sp, #0x2a
	strb r2, [r8, #0x58]
	bl GroundToDungeonMoveset
_020578D0:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057820
_020578E0:
	ldr r0, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, sb, lsl #1
	ldr r1, [r0]
	ldr r0, _02057A30 ; =_020A343C
	add r1, r1, #0x9000
	ldr r3, [r1, #0x870]
	mov r1, sb
	ldrsh r2, [r3, r2]
	bl Debug_Print0
_02057904:
	ldr r0, _02057A34 ; =_020A344C
	bl Debug_Print0
	mov r0, sl
	bl GetMaxMembersAllowed
	mov r8, #0
	ldr r1, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #1
	ldr r1, [r1]
	mov r7, r0
	add r0, r1, #0x9000
	ldr sl, [r0, #0x84c]
	mov sb, r8
	mov fp, sl
	mov r5, r8
	mov r3, r8
	mov r4, r6
	mov r0, r8
	mov r1, r6
	b _020579A4
_02057950:
	ldrb r2, [fp]
	tst r2, #1
	movne ip, r6
	moveq ip, r5
	tst ip, #0xff
	beq _0205799C
	tst r2, #2
	movne r2, r4
	moveq r2, r3
	tst r2, #0xff
	beq _0205799C
	ldrb r2, [fp, #1]
	cmp r2, #0
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	movne r0, sb, lsl #0x10
	movne r8, r0, asr #0x10
	bne _020579AC
_0205799C:
	add sb, sb, #1
	add fp, fp, #0x68
_020579A4:
	cmp sb, #4
	blt _02057950
_020579AC:
	mov sb, #0
	mov r6, #1
	mov fp, sb
	mov r5, r6
	mov r4, sb
_020579C0:
	ldrb r0, [sl]
	tst r0, #1
	movne r1, r5
	moveq r1, fp
	tst r1, #0xff
	beq _02057A08
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	cmpne r8, sb
	beq _02057A08
	cmp r6, r7
	addlt r6, r6, #1
	blt _02057A08
	strb r4, [sl]
	ldrsh r0, [sl, #8]
	bl sub_020566C4
_02057A08:
	add sb, sb, #1
	cmp sb, #4
	add sl, sl, #0x68
	blt _020579C0
	bl sub_02058064
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02057A24: .word _020A340C
_02057A28: .word TEAM_MEMBER_TABLE_PTR
_02057A2C: .word _020A336C
_02057A30: .word _020A343C
_02057A34: .word _020A344C
	arm_func_end sub_020577BC

	arm_func_start sub_02057A38
sub_02057A38: ; 0x02057A38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mvn r0, #0
	cmp r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetAppointedLeaderMemberIdx
	ldr r1, _02057AC0 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r1, [r1]
	mov r4, r6, lsl #1
	add r1, r1, #0x9000
	ldr r5, [r1, #0x870]
	ldr r3, [r1, #0x84c]
	ldrsh r4, [r5, r4]
	sub r1, r2, #0x69
	mla r5, r6, r2, r3
	mov r7, r0
	cmp r4, r1
	beq _02057AB4
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl sub_020530D4
	strh r6, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, r7
	orr r0, r0, #2
	strb r0, [r5]
	moveq r0, #1
	streqb r0, [r5, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02057AB4:
	mov r0, #0
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057AC0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057A38

	arm_func_start sub_02057AC4
sub_02057AC4: ; 0x02057AC4
	stmdb sp!, {r4, lr}
	mov r4, #0
_02057ACC:
	mov r0, r4
	bl sub_02057A38
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	blt _02057ACC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02057AC4

	arm_func_start sub_02057AEC
sub_02057AEC: ; 0x02057AEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl IsLevelResetDungeon
	cmp r4, #0xff
	moveq sl, #0
	beq _02057B10
	mov r0, r4
	bl IsLevelResetDungeon
	mov sl, r0
_02057B10:
	bl GetGameMode
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	and r7, r0, #0xff
	bl sub_02057C40
	bl RemoveActiveMembersFromMainTeam
	mov sb, #0
	ldr r0, _02057C3C ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #1
	ldr r0, [r0]
	mov r5, sb
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov fp, sb
	mov r4, r6
_02057B50:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _02057C14
	ldrsh r0, [r8, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	bne _02057C14
	ldrsh r0, [r8, #0xc]
	bl GetBaseFormCastformCherrimDeoxys
	strh r0, [r8, #0xc]
	ldrsh r0, [r8, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057C14
	ldrb r0, [r8, #1]
	cmp r0, #0
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	ldrsh r0, [r8, #8]
	beq _02057BB8
	bl TryAddMonsterToActiveTeam
	b _02057BBC
_02057BB8:
	bl sub_02056554
_02057BBC:
	cmp sl, #0
	beq _02057BE8
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058138
	mov r2, sb, lsl #0x10
	ldrsh r1, [r8, #8]
	mov r0, r8
	mov r2, r2, asr #0x10
	bl sub_020530D4
	b _02057C14
_02057BE8:
	cmp r7, #0
	beq _02057C00
	ldrsh r0, [r8, #8]
	mov r1, r8
	bl sub_0205349C
	b _02057C14
_02057C00:
	ldrsh r1, [r8, #8]
	mov r2, sb, lsl #0x10
	mov r0, r8
	mov r2, r2, asr #0x10
	bl sub_020530D4
_02057C14:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057B50
	ldr r0, _02057C3C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02057C3C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057AEC

	arm_func_start sub_02057C40
sub_02057C40: ; 0x02057C40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02057CE4 ; =TEAM_MEMBER_TABLE_PTR
	mov sb, #0
	ldr r0, [r0]
	mov r7, #1
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov r6, sb
	mov r4, sb
	mov r5, r7
_02057C68:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02057CC8
	ldrb r0, [r8, #0x3e]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02057CC8
	ldrb r0, [r8, #0x3e]
	bic r0, r0, #8
	strb r0, [r8, #0x3e]
	ldrsh r0, [r8, #0x42]
	cmp r0, #0xb7
	bne _02057CC8
	add r0, r8, #0x3e
	bl GetMoneyQuantity
	bl AddMoneyCarried
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058138
_02057CC8:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057C68
	bl CleanStickyItemsInBag
	bl RemovePokeItemsInBag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02057CE4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057C40

	arm_func_start sub_02057CE8
sub_02057CE8: ; 0x02057CE8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
_02057D00:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02057D40
	ldrb r1, [r0, #0x3e]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	tst r1, #0xff
	ldrneb r1, [r0, #0x3e]
	bicne r1, r1, #8
	strneb r1, [r0, #0x3e]
_02057D40:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02057D00
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02057CE8

	arm_func_start RefillTeam
RefillTeam: ; 0x02057D58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02057DF8 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldr r4, [r0, #0x84c]
_02057D70:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02057DE4
	ldrsh r1, [r4, #0x10]
	mov r0, r4
	strh r1, [r4, #0xe]
	bl sub_02058810
	mov r6, #0
	add r7, r4, #0x1c
	mov r8, r6
	mov sb, #1
_02057DA8:
	add r0, r4, r6, lsl #3
	ldrb r0, [r0, #0x1c]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _02057DD4
	add r0, r7, r6, lsl #3
	bl GetMaxPp
	add r1, r4, r6, lsl #3
	strb r0, [r1, #0x22]
_02057DD4:
	add r6, r6, #1
	cmp r6, #4
	blt _02057DA8
	strh r5, [r4, #0xa]
_02057DE4:
	add r5, r5, #1
	cmp r5, #4
	add r4, r4, #0x68
	blt _02057D70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02057DF8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RefillTeam

#ifndef JAPAN
	arm_func_start sub_02057DFC
sub_02057DFC: ; 0x02057DFC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02057E8C ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0
	ldr r1, [r1]
	mov ip, #1
	add r1, r1, #0x9000
	ldr r6, [r1, #0x84c]
	mov r3, r0
	mov r4, r0
	mov r5, ip
	mov lr, r0
_02057E28:
	ldrb r1, [r6]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	tst r1, #0xff
	beq _02057E78
	mov r7, lr
_02057E44:
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	addne r2, r6, r7, lsl #3
	ldrneb r1, [r2, #0x1c]
	add r7, r7, #1
	andne r1, r1, #0xf
	strneb r1, [r2, #0x1c]
	cmp r7, #4
	blt _02057E44
_02057E78:
	add r0, r0, #1
	cmp r0, #4
	add r6, r6, #0x68
	blt _02057E28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057E8C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057DFC
#endif

	arm_func_start sub_02057E90
sub_02057E90: ; 0x02057E90
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02057EF0 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r0, [r0]
	mov r6, r4
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov r7, #1
	mov r5, r4
_02057EB4:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02057EDC
	ldrsh r0, [r8, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	strneb r5, [r8]
_02057EDC:
	add r4, r4, #1
	cmp r4, #4
	add r8, r8, #0x68
	blt _02057EB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02057EF0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057E90

	arm_func_start sub_02057EF4
sub_02057EF4: ; 0x02057EF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _02058060 ; =TEAM_MEMBER_TABLE_PTR
	mov r8, #0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
_02057F0C:
	ldrb r0, [r7]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	bne _02057F38
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205804C
_02057F38:
	ldrsh sb, [r7, #8]
	ldrsh r1, [r7, #0x10]
	mov r0, r7
	strh r1, [r7, #0xe]
	bl sub_02058810
	mov sl, #0
	add r5, r7, #0x1c
	mov fp, sl
	mov r6, #1
	mov r4, sl
_02057F60:
	add r0, r7, sl, lsl #3
	ldrb r0, [r0, #0x1c]
	tst r0, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _02057F90
	add r0, r5, sl, lsl #3
	bl GetMaxPp
	add r1, r7, sl, lsl #3
	strb r0, [r1, #0x22]
	strh r4, [r1, #0x1e]
_02057F90:
	add sl, sl, #1
	cmp sl, #4
	blt _02057F60
	strh r8, [r7, #0xa]
	ldrb r1, [r7]
	mov r0, sb
	bic r2, r1, #8
	and r1, r2, #0xff
	orr r1, r1, #1
	strb r1, [r7]
	bl CheckTeamMemberIdx
	cmp r0, #0
	mov r0, sb
	mov r1, #0
	bne _02058048
	bl sub_02056460
	cmp r0, #0
	beq _02057FE4
	mov r0, sb
	mov r1, #0
	bl sub_020565F4
_02057FE4:
	mov r0, sb
	mov r1, #2
	bl sub_02056460
	cmp r0, #0
	beq _02058004
	mov r0, sb
	mov r1, #2
	bl sub_020565F4
_02058004:
	mov r0, sb
	mov r1, #0
	bl sub_02056504
	cmp r0, #0
	beq _02058024
	mov r0, sb
	mov r1, #0
	bl sub_020565F4
_02058024:
	mov r0, sb
	mov r1, #2
	bl sub_02056504
	cmp r0, #0
	beq _0205804C
	mov r0, sb
	mov r1, #2
	bl sub_020565F4
	b _0205804C
_02058048:
	bl sub_020565F4
_0205804C:
	add r8, r8, #1
	cmp r8, #4
	add r7, r7, #0x68
	blt _02057F0C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02058060: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057EF4

	arm_func_start sub_02058064
sub_02058064: ; 0x02058064
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020580C0 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
	mov r6, #1
_02058084:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _020580A4
	add r0, r7, #0x5a
	bl ShuffleHiddenPower
_020580A4:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	add r7, r7, #0x68
	blt _02058084
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020580C0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058064

	arm_func_start ValidateTeamMembers
ValidateTeamMembers: ; 0x020580C4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02058134 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r1, [r1]
	add r2, r5, #1
	add r1, r1, #0x9000
	ldr r4, [r1, #0x84c]
	and r6, r2, #0xff
	strb r5, [r0]
	mov ip, r5
	mov lr, #1
	mov r3, r5
_020580F4:
	ldrb r1, [r4]
	add r4, r4, #0x68
	tst r1, #1
	movne r1, lr
	moveq r1, ip
	tst r1, #0xff
	addeq r1, r0, r5
	streqb r3, [r1, #1]
	addne r1, r0, r5
	addne r2, r6, #1
	strneb r6, [r1, #1]
	add r5, r5, #1
	andne r6, r2, #0xff
	cmp r5, #4
	blt _020580F4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02058134: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ValidateTeamMembers

	arm_func_start sub_02058138
sub_02058138: ; 0x02058138
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _020581EC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x68
	ldr r2, [r2]
	smulbb r1, r0, r1
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r3, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020581E0
	ldrb r1, [r3, #0x3e]
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r3, #0x3f]
	cmpne r0, #0
	beq _020581E0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _020581E0
	ldrh r1, [r3, #0x3e]
	add r0, r3, #0x3e
	strh r1, [sp]
	ldrh r2, [r3, #0x40]
	ldrb r1, [sp]
	strh r2, [sp, #2]
	ldrh r2, [r3, #0x42]
	bic r1, r1, #0x10
	strh r2, [sp, #4]
	strb r1, [sp]
	bl ItemZInit
	add r0, sp, #0
	bl RemoveHolderForItemInBag
	b _020581E4
_020581E0:
	mov r0, #0
_020581E4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020581EC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058138

	arm_func_start ClearItem
ClearItem: ; 0x020581F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _020582DC ; =TEAM_MEMBER_TABLE_PTR
	cmp r0, #0
	ldr r2, [r2]
	add r2, r2, #0x9000
	ldr r2, [r2, #0x84c]
	beq _020582D0
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
	mov r3, r8
	mov ip, r7
	b _020582C8
_02058230:
	ldrb lr, [r2]
	tst lr, #1
	movne sb, r7
	moveq sb, r6
	tst sb, #0xff
	beq _020582C0
	ldrb sb, [r2, #0x3e]
	tst sb, #1
	movne lr, r5
	moveq lr, r4
	tst lr, #0xff
	beq _020582C0
	ldrb lr, [r2, #0x3f]
	cmp lr, r0
	bne _020582C0
	cmp r1, #0
	beq _02058288
	tst sb, #8
	movne sb, ip
	moveq sb, r3
	tst sb, #0xff
	bne _020582C0
_02058288:
	ldrh r1, [r2, #0x3e]
	add r0, r2, #0x3e
	strh r1, [sp]
	ldrh r3, [r2, #0x40]
	ldrb r1, [sp]
	strh r3, [sp, #2]
	ldrh r2, [r2, #0x42]
	bic r1, r1, #0x10
	strh r2, [sp, #4]
	strb r1, [sp]
	bl ItemZInit
	add r0, sp, #0
	bl RemoveHolderForItemInBag
	b _020582D4
_020582C0:
	add r8, r8, #1
	add r2, r2, #0x68
_020582C8:
	cmp r8, #4
	blt _02058230
_020582D0:
	mov r0, #0
_020582D4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020582DC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ClearItem

	arm_func_start sub_020582E0
sub_020582E0: ; 0x020582E0
	ldr ip, _020582EC ; =ClearItem
	mov r1, #1
	bx ip
	.align 2, 0
_020582EC: .word ClearItem
	arm_func_end sub_020582E0

	arm_func_start sub_020582F0
sub_020582F0: ; 0x020582F0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r3, _0205845C ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r3, [r3]
	smulbb r2, r0, r2
	add r0, r3, #0x9000
	ldr r3, [r0, #0x84c]
	mov r5, r1
	ldrb r0, [r3, r2]
	add r4, r3, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02058450
	mov r0, r5
	bl GetItemAtIdx
	ldrb r2, [r4, #0x3e]
	mov r1, r0
	tst r2, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02058404
	ldrb r0, [r4, #0x3f]
	cmp r0, #0
	bne _02058374
	tst r2, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02058448
_02058374:
	ldrh r2, [r4, #0x3e]
	add r0, sp, #6
	strh r2, [sp, #6]
	ldrh r3, [r4, #0x40]
	ldrb r2, [sp, #6]
	strh r3, [sp, #8]
	ldrh ip, [r4, #0x42]
	bic r3, r2, #0x10
	strh ip, [sp, #0xa]
	ldrh r2, [r1]
	strh r2, [sp]
	ldrh ip, [r1, #2]
	ldrb r2, [sp]
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	bic r1, r2, #0x10
	strh ip, [sp, #4]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	strb r2, [sp, #1]
	strb r1, [sp]
	strb r3, [sp, #6]
	bl RemoveHolderForItemInBag
	ldrh r2, [sp]
	add r1, sp, #0
	mov r0, r5
	strh r2, [r4, #0x3e]
	ldrh r2, [sp, #2]
	strh r2, [r4, #0x40]
	ldrh r2, [sp, #4]
	strh r2, [r4, #0x42]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	and r2, r2, #0xff
	bl SetHolderForItemInBag
	b _02058448
_02058404:
	ldrh r2, [r1]
	mov r0, r5
	strh r2, [r4, #0x3e]
	ldrh r2, [r1, #2]
	strh r2, [r4, #0x40]
	ldrh r2, [r1, #4]
	strh r2, [r4, #0x42]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	strb r2, [r4, #0x3f]
	ldrb r2, [r4, #0x3e]
	bic r2, r2, #0x10
	strb r2, [r4, #0x3e]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	and r2, r2, #0xff
	bl SetHolderForItemInBag
_02058448:
	mov r0, #1
	b _02058454
_02058450:
	mov r0, #0
_02058454:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0205845C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020582F0

	arm_func_start sub_02058460
sub_02058460: ; 0x02058460
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, r0
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020584F4 ; =TEAM_MEMBER_TABLE_PTR
	sub r1, r1, #1
	mov ip, r1, lsl #0x10
	ldr r1, [r0]
	mov r0, #0
	add r1, r1, #0x9000
	mov r4, r0
	mov r5, #1
	mov r3, #0x68
	b _020584E4
_0205849C:
	smulbb r6, r0, r3
	ldr r7, [r1, #0x84c]
	ldrb lr, [r7, r6]
	add r6, r7, r6
	tst lr, #1
	movne r7, r5
	moveq r7, r4
	tst r7, #0xff
	beq _020584D8
	ldrsh lr, [r6, #0xa]
	cmp lr, ip, asr #16
	bne _020584D8
	mov r1, r2
	bl sub_020582F0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020584D8:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_020584E4:
	cmp r0, #4
	blt _0205849C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020584F4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058460

	arm_func_start sub_020584F8
sub_020584F8: ; 0x020584F8
	bx lr
	arm_func_end sub_020584F8

	arm_func_start GetRecoloredNameOfTeamMemberAtIdx
GetRecoloredNameOfTeamMemberAtIdx: ; 0x020584FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	ldrb r0, [r1, #1]
	add r1, r1, #0x5e
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r4
	and r2, r2, #0xff
	bl RecolorTeamMemberNameString
	ldmia sp!, {r4, pc}
	arm_func_end GetRecoloredNameOfTeamMemberAtIdx

	arm_func_start sub_02058534
sub_02058534: ; 0x02058534
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	cmp r4, #0x44
	bne _02058578
	ldrb r0, [r1, #1]
	add r1, r1, #0x5e
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	and r2, r2, #0xff
	bl RecolorTeamMemberNameString
	ldmia sp!, {r3, r4, r5, pc}
_02058578:
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x5e
	bl RecolorNameString
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02058534

	arm_func_start GetNameOfTeamMemberAtIdx
GetNameOfTeamMemberAtIdx: ; 0x0205858C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	mov r0, r4
	add r1, r1, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldmia sp!, {r4, pc}
	arm_func_end GetNameOfTeamMemberAtIdx

	arm_func_start GetRecoloredTeamMemberName
GetRecoloredTeamMemberName: ; 0x020585B4
	ldrb r2, [r1, #1]
	ldr ip, _020585D4 ; =RecolorTeamMemberNameString
	add r1, r1, #0x5e
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	and r2, r2, #0xff
	bx ip
	.align 2, 0
_020585D4: .word RecolorTeamMemberNameString
	arm_func_end GetRecoloredTeamMemberName

	arm_func_start ChangeGiratinaFormIfSkyDungeon
ChangeGiratinaFormIfSkyDungeon: ; 0x020585D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl IsSkyExclusiveDungeon
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
	ldr r4, _02058640 ; =0x00000211
	mov r6, r8
	mov r7, #1
	mov r5, #0x218
_020585FC:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02058628
	ldrsh r1, [r0, #0xc]
	cmp r1, r4
	streqh r5, [r0, #0xc]
_02058628:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _020585FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02058640: .word 0x00000211
	arm_func_end ChangeGiratinaFormIfSkyDungeon

	arm_func_start sub_02058644
sub_02058644: ; 0x02058644
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_02058650:
	mov r0, r4
	mov r1, r5
	bl RevertGiratinaAndShaymin
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	blt _02058650
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02058644

	arm_func_start RevertGiratinaAndShaymin
RevertGiratinaAndShaymin: ; 0x02058674
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_02056228
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	tst r4, #2
	beq _020586C8
	ldrsh r1, [r0, #0xc]
	cmp r1, #0x218
	ldreq r1, _020586E8 ; =0x00000211
	streqh r1, [r0, #0xc]
	ldmeqia sp!, {r3, r4, r5, pc}
_020586C8:
	tst r4, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r2, [r0, #0xc]
	ldr r1, _020586EC ; =0x00000217
	cmp r2, r1
	subeq r1, r1, #1
	streqh r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020586E8: .word 0x00000211
_020586EC: .word 0x00000217
	arm_func_end RevertGiratinaAndShaymin

	arm_func_start sub_020586F0
sub_020586F0: ; 0x020586F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetActiveTeamMember
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205878C
	mov r0, r5
	bl GetItemMoveId16
	mov ip, #0
	mov r2, ip
	mov r3, #1
	b _02058768
_02058730:
	add r1, r4, ip, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _0205875C
	add r1, r4, ip, lsl #3
	ldrh r1, [r1, #0x20]
	cmp r0, r1
	beq _02058770
_0205875C:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	mov ip, r1, asr #0x10
_02058768:
	cmp ip, #4
	blt _02058730
_02058770:
	cmp ip, #4
	blt _0205878C
	ldrsh r1, [r4, #0xc]
	bl sub_02053D1C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_0205878C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020586F0

	arm_func_start sub_02058794
sub_02058794: ; 0x02058794
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0204E584
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r4, #8]
	bl GetTeamMember
	mov r1, r4
	bl sub_020534BC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02058794

	arm_func_start sub_020587C8
sub_020587C8: ; 0x020587C8
	stmdb sp!, {r3, lr}
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
	bl RefillTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_020587C8

	arm_func_start sub_020587E0
sub_020587E0: ; 0x020587E0
	stmdb sp!, {r4, lr}
	mov r4, r0
#ifndef JAPAN
	bl sub_02057DFC
#endif
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
	bl RefillTeam
	mov r0, r4
	bl sub_02057AEC
	mov r0, #0
	bl sub_02056318
	ldmia sp!, {r4, pc}
	arm_func_end sub_020587E0

	arm_func_start sub_02058810
sub_02058810: ; 0x02058810
	mov r2, #0x64
	strh r2, [r0, #0x48]
	mov r1, #0
	strh r2, [r0, #0x44]
	strh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	bx lr
	arm_func_end sub_02058810

	arm_func_start sub_0205882C
sub_0205882C: ; 0x0205882C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x30
	ldr r1, _02058AA4 ; =0x000003E3
	mov r4, r0
	mov r3, #0
	add r2, sp, #0x14
	mov r0, #4
	str r3, [sp, #0x1c]
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #0x14]
	add r0, sp, #0x1c
	bl HandleSir0Translation
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl OamTileNumberToVramAddress
	mov r0, r4, lsl #0x10
	ldr r5, [sp, #0x1c]
	mov r0, r0, asr #0x10
	mov r1, #0
	bl OamTileNumberToVramAddress
	add r1, r5, #4
	mov r2, #0x40
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl OamTileNumberToVramAddress
	add r1, r5, #0x24
	mov r2, #0x80
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, r4, #2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl OamTileNumberToVramAddress
	add r1, r5, #0x64
	mov r2, #0x100
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, sp, #0x14
	bl UnloadFile
	mov lr, #0
_020588E4:
	ldr r3, _02058AA8 ; =_020A3468
	ldr r5, _02058AAC ; =_022B578C
	add r2, r3, lr, lsl #4
	ldr r1, [r2, #8]
	ldr r0, _02058AB0 ; =0x000003FF
	add r1, r4, r1
	add r7, r5, lr, lsl #4
	mov sb, #0x400
	ldr r3, [r3, lr, lsl #4]
	and r8, r1, r0
	ldr r2, [r2, #4]
	mov r1, r3, lsl #0x1e
	mov r5, #0
	mov r0, r2, lsl #0x1e
	rsb sb, sb, #0
	mov r2, r5
	mov r3, #1
_02058928:
	mov ip, r5, lsl #3
	ldrh sl, [r7, ip]
	add r6, r7, r5, lsl #3
	cmp r5, #1
	bic sl, sl, #0x100
	strh sl, [r7, ip]
	ldrh sl, [r7, ip]
	add r5, r5, #1
	bic sl, sl, #0x200
	strh sl, [r7, ip]
	ldrh sl, [r6]
	moveq ip, r3
	movne ip, r2
	bic sl, sl, #0xc00
	strh sl, [r6]
	ldrh sl, [r6]
	mov ip, ip, lsl #0x1e
	cmp r5, #2
	orr sl, sl, ip, lsr #20
	strh sl, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0x1000
	strh ip, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0x2000
	strh ip, [r6]
	ldrh ip, [r6]
	orr ip, ip, #0x2000
	strh ip, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0xc000
	strh ip, [r6]
	ldrh ip, [r6]
	orr ip, ip, r1, lsr #16
	strh ip, [r6]
	ldrh ip, [r6, #2]
	bic ip, ip, #0x3e00
	strh ip, [r6, #2]
	ldrh ip, [r6, #2]
	bic ip, ip, #0xc000
	strh ip, [r6, #2]
	ldrh ip, [r6, #2]
	orr ip, ip, r0, lsr #16
	strh ip, [r6, #2]
	ldrh ip, [r6, #4]
	and ip, ip, sb
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	orr ip, ip, r8
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	bic ip, ip, #0xc00
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	orr ip, ip, #0xc00
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	bic ip, ip, #0xf000
	strh ip, [r6, #4]
	ldrh ip, [r6, #6]
	bic ip, ip, #1
	strh ip, [r6, #6]
	ldrh ip, [r6, #6]
	bic ip, ip, #2
	strh ip, [r6, #6]
	blt _02058928
	add lr, lr, #1
	cmp lr, #3
	blt _020588E4
	ldr r1, _02058AB4 ; =0x000003E5
	add r2, sp, #0xc
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #0xc]
	add r0, sp, #8
	bl HandleSir0Translation
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x20
	mov r2, #1
	mov r3, #0x20
	bl FillPaletteInitInfo
	ldr r0, _02058AB8 ; =OBJ_GRAPHICS_CONTROLS_PTR
	add r1, sp, #0x20
	ldr r0, [r0]
	mov r2, #0
	bl LoadObjPalette
	add r0, sp, #0xc
	bl UnloadFile
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02058AA4: .word 0x000003E3
_02058AA8: .word _020A3468
_02058AAC: .word _022B578C
_02058AB0: .word 0x000003FF
_02058AB4: .word 0x000003E5
_02058AB8: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0205882C

	arm_func_start OamTileNumberToVramAddress
OamTileNumberToVramAddress: ; 0x02058ABC
	ldr r3, _02058AF4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	mov r2, #0x70
	ldr ip, [r3]
	ldr r3, _02058AF8 ; =_020AFC28
	mla r2, r1, r2, ip
	ldrh r1, [r2, #0xc]
	ldr ip, [r2, #0x64]
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #30
	add r1, r2, r1, ror #30
	mov r1, r1, lsl #1
	ldrsh r1, [r3, r1]
	smlabb r0, r0, r1, ip
	bx lr
	.align 2, 0
_02058AF4: .word OBJ_GRAPHICS_CONTROLS_PTR
_02058AF8: .word _020AFC28
	arm_func_end OamTileNumberToVramAddress

	arm_func_start sub_02058AFC
sub_02058AFC: ; 0x02058AFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	cmp r0, #0x32
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmpne r0, #0x33
	beq _02058B38
	ldr r1, _02058C08 ; =0xFFFFFD76
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _02058B40
_02058B38:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02058B40:
	bl GetShadowSize
	ldrb r1, [sp, #0x24]
	mov r7, #0x200
	ldrsh lr, [r6]
	cmp r1, #0
	ldr r1, _02058C0C ; =_022B578C
	movne r2, #1
	moveq r2, #0
	add r1, r1, r0, lsl #4
	add r1, r1, r2, lsl #3
	ldr sb, _02058C10 ; =_020A3450
	ldrh r8, [r1, #2]
	ldrsh ip, [r5, #0x24]
	ldrsh r3, [r6, #2]
	ldrsh r2, [r5, #0x26]
	rsb r7, r7, #0
	and r5, r8, r7
	strh r5, [r1, #2]
	ldr r0, [sb, r0, lsl #2]
	add r5, lr, ip
	add r0, r5, r0
	ldrh r5, [r1, #2]
	and r0, r0, r7, lsr #23
	add r2, r3, r2
	orr r0, r5, r0
	strh r0, [r1, #2]
	sub r0, r2, #2
	sub r2, r0, #2
	mov r3, r2, lsl #0x14
	ldrh r5, [r1, #6]
	ldr r0, _02058C14 ; =0xFFFF000F
	ldr r2, [sp, #0x20]
	and r0, r5, r0
	strh r0, [r1, #6]
	ldrh r5, [r1, #6]
	ldr r0, _02058C18 ; =OBJ_GRAPHICS_CONTROLS_PTR
	orr r3, r5, r3, lsr #16
	strh r3, [r1, #6]
	ldrh r5, [r1, #4]
	mov r3, r2, lsl #0x1e
	ldr r0, [r0]
	bic r2, r5, #0xc00
	strh r2, [r1, #4]
	ldrh r5, [r1, #4]
	mov r2, r4
	orr r3, r5, r3, lsr #20
	strh r3, [r1, #4]
	bl AddSimpleObjToOam
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02058C08: .word 0xFFFFFD76
_02058C0C: .word _022B578C
_02058C10: .word _020A3450
_02058C14: .word 0xFFFF000F
_02058C18: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_02058AFC

	arm_func_start GetIqSkillStringId
GetIqSkillStringId: ; 0x02058C1C
#if defined(EUROPE)
	add r0, r0, #0xe7
	add r0, r0, #0x2600
#elif defined(JAPAN)
	add r0, r0, #0x13
	add r0, r0, #0x3f00
#else
	add r0, r0, #0xe5
	add r0, r0, #0x2600
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetIqSkillStringId

	arm_func_start sub_02058C30
sub_02058C30: ; 0x02058C30
	ldr ip, _02058C38 ; =CopyTacticString
	bx ip
	.align 2, 0
_02058C38: .word CopyTacticString
	arm_func_end sub_02058C30
