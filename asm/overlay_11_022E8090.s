	.include "asm/macros.inc"
	.include "overlay_11_022E8090.inc"

	.text

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
