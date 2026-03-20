	.include "asm/macros.inc"
	.include "main_0205E448.inc"

	.text

	arm_func_start sub_0205E448
sub_0205E448: ; 0x0205E448
	stmdb sp!, {r4, lr}
	mov lr, #0
	mov r4, lr
	mov r2, lr
	mov r3, #1
	b _0205E47C
_0205E460:
	ldrb ip, [r1, r4, lsl #5]
	add r4, r4, #1
	cmp ip, #0
	moveq ip, r3
	movne ip, r2
	tst ip, #0xff
	addeq lr, lr, #1
_0205E47C:
	cmp r4, r0
	blt _0205E460
	mov r0, lr
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205E448

	arm_func_start sub_0205E48C
sub_0205E48C: ; 0x0205E48C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, r0
	mov r6, r1
	mov r5, r4
	b _0205E4B4
_0205E4A4:
	ldrb r0, [r6, r4, lsl #5]
	cmp r0, #0
	bne _0205E4BC
	add r4, r4, #1
_0205E4B4:
	cmp r4, r7
	blt _0205E4A4
_0205E4BC:
	cmp r4, r7
	beq _0205E4F0
	cmp r4, r5
	ble _0205E4E4
	add lr, r6, r4, lsl #5
	add ip, r6, r5, lsl #5
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
_0205E4E4:
	add r4, r4, #1
	add r5, r5, #1
	b _0205E4B4
_0205E4F0:
	mov r0, #0
	b _0205E500
_0205E4F8:
	strb r0, [r6, r5, lsl #5]
	add r5, r5, #1
_0205E500:
	cmp r5, r7
	blt _0205E4F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0205E48C

	arm_func_start sub_0205E50C
sub_0205E50C: ; 0x0205E50C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov r8, r0
	mov r7, r1
	mov fp, r2
	mov r5, #0
	b _0205E5BC
_0205E528:
	add r6, r5, #1
	mov r4, r5, lsl #5
	b _0205E5B0
_0205E534:
	ldrb r0, [r7, r6, lsl #5]
	mov r1, r6, lsl #5
	cmp r0, #0
	beq _0205E5AC
	ldrb r0, [r7, r4]
	cmp r0, #0
	beq _0205E564
	add r0, r7, r4
	add r1, r7, r1
	blx fp
	cmp r0, #0
	beq _0205E5AC
_0205E564:
	add sb, sp, #0
	add ip, r7, r4
	mov sl, sb
	ldmia ip!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia ip, {r0, r1, r2, r3}
	stmia sb, {r0, r1, r2, r3}
	add sb, r7, r6, lsl #5
	mov ip, sb
	add lr, r7, r4
	ldmia sb!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia sb, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
_0205E5AC:
	add r6, r6, #1
_0205E5B0:
	cmp r6, r8
	blt _0205E534
	add r5, r5, #1
_0205E5BC:
	sub r0, r8, #1
	cmp r5, r0
	blt _0205E528
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0205E50C

; https://decomp.me/scratch/8eqok
	arm_func_start GenerateDailyMissions
GenerateDailyMissions: ; 0x0205E5D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	mov r1, #8
	bl RandRangeSafe
	mov r7, r0
	mov r0, #4
	mov r1, #8
	bl RandRangeSafe
	mov r8, r0
	mov r0, #3
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, #0
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r3, r2
_0205E610:
	ldr r1, [r0, #0x18]
	strb r3, [r1, r2, lsl #5]
	add r2, r2, #1
	cmp r2, #8
	blt _0205E610
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r2, #0
_0205E62C:
	ldr r1, [r0, #0x18]
	add r1, r1, r3, lsl #5
	add r3, r3, #1
	strb r2, [r1, #0x200]
	cmp r3, #8
	blt _0205E62C
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r0, #0x18]
	strb r2, [r1, #0x300]
	ldr r0, [r0, #0x18]
	strb r2, [r0, #0x320]
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl GenerateAllPossibleMonstersList
	bl GenerateAllPossibleDungeonsList
	bl GenerateAllPossibleDeliverList
	mov r0, #3
	bl sub_02062290
	cmp r0, #0
	beq _0205E70C
	mov sl, #0
	mov r6, #0x1e
	mov fp, sl
	mov r5, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E704
_0205E6A0:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x320
	add sb, r0, sl, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E6DC
	mov r1, sb
	bl GenerateMission
	cmp r0, #0
	bne _0205E6DC
	mov r0, sb
	mov r1, fp
	bl sub_0206315C
	mov r0, #0
_0205E6DC:
	cmp r0, #2
	beq _0205E70C
	cmp r0, #1
	bne _0205E6FC
	sub r6, r6, #1
	cmp r6, #0
	ble _0205E70C
	b _0205E704
_0205E6FC:
	mov r6, #0x1e
	add sl, sl, #1
_0205E704:
	cmp sl, #0
	ble _0205E6A0
_0205E70C:
	bl sub_02062548
	mov r0, #2
	bl sub_02062290
	cmp r0, #0
	beq _0205E7AC
	mov fp, #1
	mov sb, #0
	mov sl, #0x1e
	mov r5, fp
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E7A4
_0205E738:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x300
	add r6, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E77C
	mov r1, r6
	bl GenerateMission
	cmp r0, #0
	bne _0205E77C
	mov r0, r6
	mov r1, fp
	bl sub_0206315C
	mov r0, r6
	bl sub_0205EB5C
	mov r0, #0
_0205E77C:
	cmp r0, #2
	beq _0205E7AC
	cmp r0, #1
	bne _0205E79C
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E7AC
	b _0205E7A4
_0205E79C:
	mov sl, #0x1e
	add sb, sb, #1
_0205E7A4:
	cmp sb, #0
	ble _0205E738
_0205E7AC:
	bl sub_02062548
	mov r0, #0
	bl sub_02062290
	cmp r0, #0
	beq _0205E840
	mov sb, #0
	mov sl, #0x1e
	mov fp, sb
	mov r5, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E838
_0205E7D8:
	ldr r0, [r4, #0x18]
	add r6, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E810
	mov r1, r6
	bl GenerateMission
	cmp r0, #0
	bne _0205E810
	mov r0, r6
	mov r1, fp
	bl sub_0206315C
	mov r0, #0
_0205E810:
	cmp r0, #2
	beq _0205E840
	cmp r0, #1
	bne _0205E830
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E840
	b _0205E838
_0205E830:
	mov sl, #0x1e
	add sb, sb, #1
_0205E838:
	cmp sb, r7
	ble _0205E7D8
_0205E840:
	bl sub_02062548
	mov r0, #1
	bl sub_02062290
	cmp r0, #0
	beq _0205E8DC
	mov sb, #0
	mov sl, #0x1e
	mov r5, sb
	mov fp, sb
	mov r6, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E8D4
_0205E870:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x200
	add r7, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r6
	beq _0205E8AC
	mov r1, r7
	bl GenerateMission
	cmp r0, #0
	bne _0205E8AC
	mov r0, r7
	mov r1, r5
	bl sub_0206315C
	mov r0, fp
_0205E8AC:
	cmp r0, #2
	beq _0205E8DC
	cmp r0, #1
	bne _0205E8CC
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E8DC
	b _0205E8D4
_0205E8CC:
	mov sl, #0x1e
	add sb, sb, #1
_0205E8D4:
	cmp sb, r8
	ble _0205E870
_0205E8DC:
	bl sub_02062548
	bl DeleteAllPossibleMonstersList
	bl DeleteAllPossibleDungeonsList
	bl DeleteAllPossibleDeliverList
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r0, #8
	ldr r1, [r1, #0x18]
	bl sub_0205E48C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205E94C ; =sub_0205E9A8
	ldr r1, [r1, #0x18]
	bl sub_0205E50C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x200
	bl sub_0205E48C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205E950 ; =sub_0205EB28
	ldr r1, [r1, #0x18]
	add r1, r1, #0x200
	bl sub_0205E50C
	bl sub_02051134
	bl sub_020634F4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205E948: .word MISSION_DELIVER_LIST_PTR
_0205E94C: .word sub_0205E9A8
_0205E950: .word sub_0205EB28
	arm_func_end GenerateDailyMissions
