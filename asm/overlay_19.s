	.include "asm/macros.inc"
	.include "overlay_19.inc"

	.text

	arm_func_start GetBarItem
GetBarItem: ; 0x0238A140
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _0238A17C ; =BAR_AVAILABLE_ITEMS
	mov r1, #0x16
	b _0238A16C
_0238A154:
	mul ip, lr, r1
	ldrsh r2, [r3, ip]
	cmp r0, r2
	addeq r0, r3, ip
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_0238A16C:
	cmp lr, #0x42
	blo _0238A154
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A17C: .word BAR_AVAILABLE_ITEMS
	arm_func_end GetBarItem

	arm_func_start ov19_0238A180
ov19_0238A180: ; 0x0238A180
	mov r2, #2
	str r2, [r0]
	mov r0, #5
	str r0, [r1]
	bx lr
	arm_func_end ov19_0238A180

	arm_func_start ov19_0238A194
ov19_0238A194: ; 0x0238A194
	mov r2, #1
	str r2, [r0]
	mov r0, #3
	str r0, [r1]
	bx lr
	arm_func_end ov19_0238A194

	arm_func_start ov19_0238A1A8
ov19_0238A1A8: ; 0x0238A1A8
	stmdb sp!, {r3, lr}
	bl GetBarItem
	add r0, r0, #0xe
	ldmia sp!, {r3, pc}
	arm_func_end ov19_0238A1A8

	arm_func_start ov19_0238A1B8
ov19_0238A1B8: ; 0x0238A1B8
	ldr r0, _0238A1C0 ; =OVERLAY19_UNKNOWN_TABLE__NA_238DAE0
	bx lr
	.align 2, 0
_0238A1C0: .word OVERLAY19_UNKNOWN_TABLE__NA_238DAE0
	arm_func_end ov19_0238A1B8

	arm_func_start GetRecruitableMonsterAll
GetRecruitableMonsterAll: ; 0x0238A1C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0x430
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r4, #0
	mov r6, #1
_0238A1E0:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	beq _0238A210
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetBodySize
	cmp r0, #1
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	addeq r4, r4, #1
_0238A210:
	add r6, r6, #1
	cmp r6, #0x218
	blt _0238A1E0
	cmp r4, #0
	ble _0238A260
	mov r0, r4
	bl RandInt
	mov r1, r0, lsl #1
	ldrsh r4, [r5, r1]
	mov r0, #2
	bl RandInt
	cmp r0, #1
	mov r0, r4
	bne _0238A254
	bl FemaleToMaleForm
	mov r4, r0
	b _0238A264
_0238A254:
	bl GetSecondFormIfValid
	mov r4, r0
	b _0238A264
_0238A260:
	mov r4, #0
_0238A264:
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GetRecruitableMonsterAll

	arm_func_start GetRecruitableMonsterList
GetRecruitableMonsterList: ; 0x0238A274
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r0, #0xd8
	mov r1, #0xf
	bl MemAlloc
	mov r6, #0
	ldr r4, _0238A318 ; =BAR_RECRUITABLE_MONSTER_TABLE
	mov r5, r0
	mov r7, r6
_0238A294:
	mov r0, r7, lsl #1
	ldrsh r8, [r4, r0]
	mov r0, r8
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	movne r0, r6, lsl #1
	add r7, r7, #1
	strneh r8, [r5, r0]
	addne r6, r6, #1
	cmp r7, #0x6c
	blt _0238A294
	cmp r6, #0
	ble _0238A304
	mov r0, r6
	bl RandInt
	mov r1, r0, lsl #1
	ldrsh r4, [r5, r1]
	mov r0, #2
	bl RandInt
	cmp r0, #1
	mov r0, r4
	bne _0238A2F8
	bl FemaleToMaleForm
	mov r4, r0
	b _0238A308
_0238A2F8:
	bl GetSecondFormIfValid
	mov r4, r0
	b _0238A308
_0238A304:
	mov r4, #0
_0238A308:
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238A318: .word BAR_RECRUITABLE_MONSTER_TABLE
	arm_func_end GetRecruitableMonsterList

	arm_func_start GetRecruitableMonsterListRestricted
GetRecruitableMonsterListRestricted: ; 0x0238A31C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r0, #0xd8
	mov r1, #0xf
	bl MemAlloc
	mov r6, #0
	ldr r4, _0238A3D0 ; =BAR_RECRUITABLE_MONSTER_TABLE
	mov r5, r0
	mov r7, r6
_0238A33C:
	mov r0, r7, lsl #1
	ldrsh r8, [r4, r0]
	mov r0, r8
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	beq _0238A36C
	mov r0, r8
	bl GetBodySize
	cmp r0, #1
	moveq r0, r6, lsl #1
	streqh r8, [r5, r0]
	addeq r6, r6, #1
_0238A36C:
	add r7, r7, #1
	cmp r7, #0x6c
	blt _0238A33C
	cmp r6, #0
	ble _0238A3BC
	mov r0, r6
	bl RandInt
	mov r1, r0, lsl #1
	ldrsh r4, [r5, r1]
	mov r0, #2
	bl RandInt
	cmp r0, #1
	mov r0, r4
	bne _0238A3B0
	bl FemaleToMaleForm
	mov r4, r0
	b _0238A3C0
_0238A3B0:
	bl GetSecondFormIfValid
	mov r4, r0
	b _0238A3C0
_0238A3BC:
	mov r4, #0
_0238A3C0:
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238A3D0: .word BAR_RECRUITABLE_MONSTER_TABLE
	arm_func_end GetRecruitableMonsterListRestricted

	arm_func_start ov19_0238A3D4
ov19_0238A3D4: ; 0x0238A3D4
	cmp r0, #0
	ldrne r1, _0238A3E8 ; =BAR_UNLOCKABLE_DUNGEONS_TABLE
	strne r1, [r0]
	mov r0, #6
	bx lr
	.align 2, 0
_0238A3E8: .word BAR_UNLOCKABLE_DUNGEONS_TABLE
	arm_func_end ov19_0238A3D4

	arm_func_start ov19_0238A3EC
ov19_0238A3EC: ; 0x0238A3EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	bl GetScenarioBalance
	mov r6, #0
	ldr r5, _0238A464 ; =BAR_UNLOCKABLE_DUNGEONS_TABLE
	mov r4, r0
	mov r7, r6
_0238A408:
	ldrb r0, [r5, r7, lsl #1]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	bne _0238A450
	add r0, r5, r7, lsl #1
	ldrb r0, [r0, #1]
	mov r1, r7, lsl #1
	cmp r0, r4
	bhi _0238A450
	ldrb r0, [r5, r1]
	bl GetMaxReachedFloor
	cmp r0, #0
	bne _0238A450
	cmp r8, #0
	ldrneb r0, [r5, r7, lsl #1]
	strneb r0, [r8, r6]
	add r6, r6, #1
_0238A450:
	add r7, r7, #1
	cmp r7, #6
	blt _0238A408
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238A464: .word BAR_UNLOCKABLE_DUNGEONS_TABLE
	arm_func_end ov19_0238A3EC

	arm_func_start ov19_0238A468
ov19_0238A468: ; 0x0238A468
	stmdb sp!, {r3, lr}
	ldr r0, _0238A4A0 ; =ov11_02324DB0
	ldr r0, [r0]
	cmp r0, #0
	ldrnesb r0, [r0, #0xc]
	mvnne r1, #1
	cmpne r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClosePortraitBox
	ldr r0, _0238A4A0 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A4A0: .word ov11_02324DB0
	arm_func_end ov19_0238A468

	arm_func_start ov19_0238A4A4
ov19_0238A4A4: ; 0x0238A4A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x308
	sub sp, sp, #0x800
	ldr r0, _0238B424 ; =ov11_02324DB0
	ldr r8, [r0]
	ldr r0, [r8, #4]
	cmp r0, #0x40
	addls pc, pc, r0, lsl #2
	b _0238C598
_0238A4C8: ; jump table
	b _0238A5CC ; case 0
	b _0238A5E8 ; case 1
	b _0238A624 ; case 2
	b _0238A604 ; case 3
	b _0238A664 ; case 4
	b _0238C50C ; case 5
	b _0238C50C ; case 6
	b _0238C50C ; case 7
	b _0238A7D8 ; case 8
	b _0238A838 ; case 9
	b _0238A970 ; case 10
	b _0238AA08 ; case 11
	b _0238AAA8 ; case 12
	b _0238C50C ; case 13
	b _0238AAD4 ; case 14
	b _0238AB00 ; case 15
	b _0238ABC0 ; case 16
	b _0238ACCC ; case 17
	b _0238AD0C ; case 18
	b _0238AD50 ; case 19
	b _0238AD90 ; case 20
	b _0238ADE4 ; case 21
	b _0238AE20 ; case 22
	b _0238AE74 ; case 23
	b _0238AEA8 ; case 24
	b _0238AEC8 ; case 25
	b _0238C50C ; case 26
	b _0238B01C ; case 27
	b _0238B040 ; case 28
	b _0238B320 ; case 29
	b _0238B34C ; case 30
	b _0238B3B4 ; case 31
	b _0238B4A4 ; case 32
	b _0238B4F8 ; case 33
	b _0238B528 ; case 34
	b _0238B5D8 ; case 35
	b _0238B6E0 ; case 36
	b _0238B6C8 ; case 37
	b _0238BDEC ; case 38
	b _0238BE08 ; case 39
	b _0238BE34 ; case 40
	b _0238BE50 ; case 41
	b _0238BE68 ; case 42
	b _0238BEE0 ; case 43
	b _0238BF44 ; case 44
	b _0238BF64 ; case 45
	b _0238BFA4 ; case 46
	b _0238BFBC ; case 47
	b _0238C004 ; case 48
	b _0238C07C ; case 49
	b _0238C0FC ; case 50
	b _0238C1BC ; case 51
	b _0238C244 ; case 52
	b _0238C2A0 ; case 53
	b _0238C2E4 ; case 54
	b _0238C348 ; case 55
	b _0238C380 ; case 56
	b _0238C598 ; case 57
	b _0238C3AC ; case 58
	b _0238C410 ; case 59
	b _0238C43C ; case 60
	b _0238C46C ; case 61
	b _0238C570 ; case 62
	b _0238C50C ; case 63
	b _0238C480 ; case 64
_0238A5CC:
	mvn r0, #0
	mov r1, #0
	bl InitRandomNpcJobs
	bl ov11_02311D6C
	mov r0, #1
	str r0, [r8, #4]
	b _0238C598
_0238A5E8:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r1, [r8, #8]
	mvneq r0, #0
	streq r1, [r8, #4]
	streq r0, [r8, #8]
	b _0238C598
_0238A604:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	blt _0238C598
	bl sub_02057AC4
_0238A624:
	bl ov19_0238D450
	ldr r0, [r8, #4]
	ldr r4, _0238B428 ; =0x0001012E
	cmp r0, #2
	ldreq r0, _0238B42C ; =0x0000458B
	ldr r2, _0238B430 ; =BAR_MAIN_MENU_ITEMS
	ldrne r0, _0238B434 ; =0x0000458C
	mov r1, r0, lsl #0x10
	mov r0, #0
	mov r3, r1, lsr #0x10
	mov r1, #0x3000
	stmia sp, {r0, r4}
	bl ov19_0238D3A0
	mov r0, #4
	str r0, [r8, #4]
	b _0238C598
_0238A664:
	bl ov19_0238D418
	cmp r0, #1
	bne _0238A740
	bl GetCurrentBagCapacity
	mov sb, #0
	mov r7, #1
	mov sl, r0
	mov r6, sb
	mov r4, sb
	mov r5, r7
	b _0238A6D8
_0238A690:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _0238A6D4
	ldrsh r0, [r0, #4]
	bl GetBarItem
	cmp r0, #0
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	movne r0, #1
	bne _0238A6E4
_0238A6D4:
	add sb, sb, #1
_0238A6D8:
	cmp sb, sl
	blt _0238A690
	mov r0, #0
_0238A6E4:
	cmp r0, #0
	movne r4, #7
	movne r5, #8
	ldrne r6, _0238B438 ; =0x00004590
	bne _0238A710
	add r0, r8, #0x100
	mov r1, #0xa
	ldr r6, _0238B43C ; =0x0000458F
	strh r1, [r0]
	mov r4, #6
	mov r5, #3
_0238A710:
	add r0, sp, #0xa00
	add r0, r0, #0xb8
	bl InitPreprocessorArgs
	ldr r3, _0238B428 ; =0x0001012E
	add r2, sp, #0xa00
	ldr r0, _0238B440 ; =0x0000301C
	add r2, r2, #0xb8
	mov r1, r6
	str r3, [sp, #0xb04]
	bl sub_02046BE8
	stmib r8, {r4, r5}
	b _0238C598
_0238A740:
	cmp r0, #2
	bne _0238A790
	add r0, sp, #0xa00
	add r0, r0, #0x68
	bl InitPreprocessorArgs
	ldr r3, _0238B428 ; =0x0001012E
	add r2, sp, #0xa00
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238B444 ; =0x0000458D
	add r2, r2, #0x68
	str r3, [sp, #0xab4]
	bl sub_02046BE8
	add r0, r8, #0x100
	mov r1, #0xa
	strh r1, [r0]
	mov r0, #5
	str r0, [r8, #4]
	mov r0, #3
	str r0, [r8, #8]
	b _0238C598
_0238A790:
	sub r0, r0, #9
	cmp r0, #1
	bhi _0238C598
	add r0, sp, #0xa00
	add r0, r0, #0x18
	bl InitPreprocessorArgs
	ldr r3, _0238B428 ; =0x0001012E
	add r2, sp, #0xa00
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238B448 ; =0x0000458E
	add r2, r2, #0x18
	str r3, [sp, #0xa64]
	bl sub_02046BE8
	mov r0, #0x3f
	str r0, [r8, #4]
	sub r0, r0, #0x40
	str r0, [r8, #8]
	b _0238C598
_0238A7D8:
	bl ov19_0238D47C
	bl sub_02046D20
	bl ov19_0238C5A8
	ldr r1, _0238B424 ; =ov11_02324DB0
	mvn r0, #1
	ldr r4, [r1]
	ldrsb r1, [r4, #0x20]
	cmp r1, r0
	bne _0238A82C
	ldr r1, _0238B44C ; =ov19_0238D4A4
	add r0, r4, #0x5c
	str r1, [sp]
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	ldr r0, [r4, #0x64]
	ldrsh r2, [r2]
	add r3, r4, #0x23
	bl ov10_022BD474
	strb r0, [r4, #0x20]
_0238A82C:
	mov r0, #9
	str r0, [r8, #4]
	b _0238C598
_0238A838:
	add r1, sp, #0x18
	mov r0, #0
	bl GetPressedButtons
	ldrsb r0, [r8, #0x20]
	bl PopInventoryMenuField0x1A3
	mov r4, r0
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCDA8
	ldrh r2, [sp, #0x18]
	ldr r1, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	strh r0, [r1]
	tst r2, #4
	bne _0238A878
	tst r2, #0x800
	cmpeq r4, #0
	beq _0238A8B0
_0238A878:
	cmp r4, #0
	bne _0238A888
	mov r0, #5
	bl PlaySeVolumeWrapper
_0238A888:
	bl SortItemsInBag
	mov r0, #0
	str r0, [r8, #0x58]
	bl ov19_0238C5A8
	ldrsb r0, [r8, #0x20]
	ldr r1, [r8, #0x64]
	bl ov10_022BCC60
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCCB0
	b _0238C598
_0238A8B0:
	ldrsb r0, [r8, #0x20]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _0238A934
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCDBC
	cmp r0, #0
	blt _0238A910
	ldr r1, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	str r0, [r8, #0x58]
	ldrsh r2, [r1, #2]
	mov r1, #0
	ldr r0, _0238B454 ; =BAR_WINDOW_PARAMS_1
	mov r2, r2, lsl #0x18
	mov r4, r2, asr #0x18
	ldr r2, _0238B458 ; =BAR_SUBMENU_ITEMS_1
	mov r3, r1
	str r4, [sp]
	mov r4, #0x70000
	str r4, [sp, #4]
	bl ov19_0238D3A0
	mov r0, #0xa
	str r0, [r8, #4]
	b _0238C598
_0238A910:
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCD10
	bl ov19_0238D4E4
	add r0, r8, #0x100
	mov r1, #0xa
	strh r1, [r0]
	mov r0, #3
	str r0, [r8, #4]
	b _0238C598
_0238A934:
	ldrh r0, [sp, #0x18]
	tst r0, #8
	beq _0238C598
	ldr r0, _0238B45C ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCDA8
	str r0, [r8, #0x58]
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCDF4
	bl ov19_0238D4E4
	mov r0, #0xb
	str r0, [r8, #4]
	b _0238C598
_0238A970:
	bl ov19_0238D418
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	sub r2, r4, #9
	strh r0, [r1, #2]
	cmp r2, #1
	bhi _0238A9A4
	ldrsb r0, [r8, #0x20]
	bl ov10_022BCC7C
	mov r0, #9
	str r0, [r8, #4]
	b _0238C598
_0238A9A4:
	cmp r4, #3
	bne _0238A9F0
	add r0, sp, #0x900
	add r0, r0, #0xc8
	bl InitPreprocessorArgs
	ldr r0, _0238B428 ; =0x0001012E
	str r0, [sp, #0xa14]
	bl ov19_0238D4E4
	add r2, sp, #0x900
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238B460 ; =0x00004594
	add r2, r2, #0xc8
	bl sub_02046BE8
	bl ov19_0238D450
	mov r0, #0xd
	str r0, [r8, #4]
	mov r0, #0xe
	str r0, [r8, #8]
	b _0238C598
_0238A9F0:
	cmp r4, #2
	bne _0238C598
	bl ov19_0238D4E4
	mov r0, #0xb
	str r0, [r8, #4]
	b _0238C598
_0238AA08:
	ldr r0, [r8, #0x58]
	add r0, r8, r0, lsl #1
	ldrsh r0, [r0, #0x68]
	bl GetItemAtIdx
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrnesh r5, [r4, #4]
	add r0, sp, #0x900
	add r0, r0, #0x78
	moveq r5, #0
	bl InitPreprocessorArgs
	str r5, [sp, #0x988]
	ldrh r1, [r4, #2]
#if defined(EUROPE)
	add r0, r5, #0xd3
	add r0, r0, #0x2900
#elif defined(JAPAN)
	add r0, r5, #0xce
	add r0, r0, #0x4100
#else
	add r0, r5, #0xd1
	add r0, r0, #0x2900
#endif
	str r1, [sp, #0x99c]
	ldrh r1, [r4, #2]
	mov r2, #0
	add r4, sp, #0x900
	add r1, r1, #0xbc
	mov r0, r0, lsl #0x10
	str r1, [sp, #0x990]
	add r4, r4, #0x78
	str r2, [sp, #0x9a4]
	str r4, [sp]
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r0, _0238B464 ; =BAR_WINDOW_PARAMS_2
	ldr r1, _0238B468 ; =0x00001013
	ldr r3, _0238B46C ; =0x000008E4
	str r4, [sp, #8]
	bl CreateScrollBoxSingle
	strb r0, [r8, #0x21]
	mov r0, #0xc
	str r0, [r8, #4]
	b _0238C598
_0238AAA8:
	ldrsb r0, [r8, #0x21]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C598
	ldrsb r0, [r8, #0x21]
	bl CloseScrollBox
	mvn r0, #1
	strb r0, [r8, #0x21]
	mov r0, #8
	str r0, [r8, #4]
	b _0238C598
_0238AAD4:
	bl ov19_0238D47C
	bl sub_02046D20
	bl sub_0203A998
	cmp r0, #0
	bne _0238AAF4
	mov r0, #0xb
	mov r1, #0
	bl sub_02039C2C
_0238AAF4:
	mov r0, #0xf
	str r0, [r8, #4]
	b _0238C598
_0238AB00:
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238AB54
	bl sub_0203A9EC
	cmp r0, #0
	beq _0238C598
	add r1, sp, #0x16
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0x16]
	tst r0, #8
	beq _0238C598
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203AAB0
	str r0, [r8, #0xd4]
	bl sub_0203A5F0
	bl sub_0203A51C
	mov r0, #0x11
	str r0, [r8, #4]
	b _0238C598
_0238AB54:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	beq _0238ABA4
	ldr r1, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	str r0, [r8, #0xd4]
	ldrsh r2, [r1, #4]
	mov r1, #0
	ldr r0, _0238B470 ; =BAR_WINDOW_PARAMS_3
	mov r2, r2, lsl #0x18
	mov r4, r2, asr #0x18
	ldr r2, _0238B474 ; =BAR_SUBMENU_ITEMS_2
	mov r3, r1
	str r4, [sp]
	mov r4, #0x70000
	str r4, [sp, #4]
	bl ov19_0238D3A0
	mov r0, #0x10
	str r0, [r8, #4]
	b _0238C598
_0238ABA4:
	bl sub_0203A51C
	add r0, r8, #0x100
	mov r1, #0xa
	strh r1, [r0]
	mov r0, #3
	str r0, [r8, #4]
	b _0238C598
_0238ABC0:
	bl ov19_0238D418
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _0238B450 ; =OVERLAY19_UNKNOWN_POINTER__NA_238E360
	sub r2, r4, #9
	strh r0, [r1, #4]
	cmp r2, #1
	bhi _0238ABF0
	bl sub_0203A638
	mov r0, #0xf
	str r0, [r8, #4]
	b _0238C598
_0238ABF0:
	cmp r4, #4
	bne _0238AC84
	add r0, sp, #0x890
	mov r1, #0x98
	bl MemZero
	ldr r0, [r8, #0x58]
	add r0, r8, r0, lsl #1
	ldrsh r0, [r0, #0x68]
	bl GetItemAtIdx
	mov r4, r0
	add r0, sp, #0x900
	add r0, r0, #0x28
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	ldr r0, _0238B428 ; =0x0001012E
	orr r1, r1, #0x20000
	str r1, [sp, #0x928]
	ldrsh r1, [r4, #4]
	str r1, [sp, #0x938]
	str r0, [sp, #0x974]
	bl sub_0203A51C
	bl ov19_0238D450
	ldr r1, _0238B478 ; =BAR_MENU_ITEMS_CONFIRM_1
	ldr r0, _0238B47C ; =0x0000459A
	str r1, [sp]
	add r1, sp, #0x900
	str r0, [sp, #4]
	add r1, r1, #0x28
	str r1, [sp, #8]
	mov r0, #0
	mov r1, #0x3000
	mov r2, #0x33
	add r3, sp, #0x890
	bl sub_02046A20
	mov r0, #0x19
	str r0, [r8, #4]
	b _0238C598
_0238AC84:
	cmp r4, #5
	bne _0238AC9C
	bl sub_0203A51C
	mov r0, #0x11
	str r0, [r8, #4]
	b _0238C598
_0238AC9C:
	cmp r4, #6
	bne _0238ACB4
	bl sub_0203A51C
	mov r0, #0x13
	str r0, [r8, #4]
	b _0238C598
_0238ACB4:
	cmp r4, #7
	bne _0238C598
	bl sub_0203A51C
	mov r0, #0x17
	str r0, [r8, #4]
	b _0238C598
_0238ACCC:
	ldrsb r1, [r8, #0x22]
	mvn r0, #1
	cmp r1, r0
	bne _0238AD00
	ldr r1, [r8, #0xd4]
	add r0, sp, #0x280
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_0205B028
	add r0, sp, #0x280
	mov r1, #3
	bl sub_0203F150
	strb r0, [r8, #0x22]
_0238AD00:
	mov r0, #0x12
	str r0, [r8, #4]
	b _0238C598
_0238AD0C:
	bl sub_0203F398
	cmp r0, #1
	bne _0238C598
	ldr r1, _0238B424 ; =ov11_02324DB0
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x22]
	cmp r1, r0
	beq _0238AD44
	bl sub_0203F990
	ldr r0, _0238B424 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x22]
_0238AD44:
	mov r0, #0xe
	str r0, [r8, #4]
	b _0238C598
_0238AD50:
	ldrsb r1, [r8, #0x20]
	mvn r0, #1
	cmp r1, r0
	bne _0238AD84
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0203FA64
	mov r1, #0
	mov r2, r1
	mov r0, #9
	bl sub_0204018C
	strb r0, [r8, #0x20]
_0238AD84:
	mov r0, #0x14
	str r0, [r8, #4]
	b _0238C598
_0238AD90:
	bl sub_020407EC
	cmp r0, #1
	bne _0238ADAC
	bl ov19_0238D51C
	mov r0, #0xe
	str r0, [r8, #4]
	b _0238C598
_0238ADAC:
	cmp r0, #2
	cmpne r0, #7
	bne _0238C598
	bl sub_0203FD38
	mov r1, r0
	add r0, r8, #0xda
	mov r2, #0x20
	bl MemcpySimple
	bl sub_02041094
	strh r0, [r8, #0xd8]
	bl ov19_0238D51C
	mov r0, #0x15
	str r0, [r8, #4]
	b _0238C598
_0238ADE4:
	ldrsb r1, [r8, #0x22]
	mvn r0, #1
	cmp r1, r0
	bne _0238AE14
	ldrsh r2, [r8, #0xd8]
	add r0, r8, #0xda
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _0238B424 ; =ov11_02324DB0
	ldr r1, [r1]
	strb r0, [r1, #0x22]
_0238AE14:
	mov r0, #0x16
	str r0, [r8, #4]
	b _0238C598
_0238AE20:
	bl sub_02041A18
	cmp r0, #1
	bne _0238C598
	ldr r1, _0238B424 ; =ov11_02324DB0
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x22]
	cmp r1, r0
	beq _0238AE68
	bl sub_02041A00
	ldr r0, _0238B424 ; =ov11_02324DB0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl CloseScrollBox
	ldr r0, _0238B424 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x22]
_0238AE68:
	mov r0, #0x13
	str r0, [r8, #4]
	b _0238C598
_0238AE74:
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r1, r0
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	mov r3, #0
	bl PrintIqSkillsMenu
	mov r0, #0x18
	str r0, [r8, #4]
	b _0238C598
_0238AEA8:
	bl sub_02041B7C
	cmp r0, #1
	bne _0238C598
	bl sub_020420F4
	bl sub_020572EC
	mov r0, #0xe
	str r0, [r8, #4]
	b _0238C598
_0238AEC8:
	bl ov19_0238D418
	sub r1, r0, #9
	cmp r1, #1
	bhi _0238AF0C
	add r0, sp, #0x840
	bl InitPreprocessorArgs
	ldr r3, _0238B428 ; =0x0001012E
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238B480 ; =0x0000459D
	add r2, sp, #0x840
	str r3, [sp, #0x88c]
	bl sub_02046BE8
	mov r0, #0x1a
	str r0, [r8, #4]
	mov r0, #8
	str r0, [r8, #8]
	b _0238C598
_0238AF0C:
	cmp r0, #8
	bne _0238C598
	ldr r0, [r8, #0x58]
	add r0, r8, r0, lsl #1
	ldrsh r0, [r0, #0x68]
	bl GetItemAtIdx
	ldrh r1, [r0]
	strh r1, [r8, #0xcc]
	ldrh r1, [r0, #2]
	strh r1, [r8, #0xce]
	ldrh r0, [r0, #4]
	strh r0, [r8, #0xd0]
	ldr r0, [r8, #0x58]
	add r0, r8, r0, lsl #1
	ldrsh r0, [r0, #0x68]
	bl RemoveItemNoHole
	add r0, sp, #0x2c
	add r1, r8, #0xcc
	bl ItemToBulkItem
	add r1, sp, #0x2c
	mov r0, #0
	bl sub_02065CB4
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	beq _0238AFB8
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x1c
	str r0, [r8, #8]
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055410
	cmp r0, #0
	movne r0, #5
	moveq r0, #6
	str r0, [r8]
	b _0238C598
_0238AFB8:
	bl ov19_0238C640
	add r0, sp, #0x7f0
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	ldr r0, _0238B428 ; =0x0001012E
	orr r2, r1, #0x20000
	ldr r1, _0238B484 ; =0x0000101C
	str r2, [sp, #0x7f0]
	str r0, [sp, #0x83c]
	add r0, r8, #0x100
	strh r1, [r0, #0xc8]
	add r4, sp, #0x7f0
	add r3, r1, #0x2000
	ldr r2, _0238B488 ; =0x0000459E
	add r0, r8, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, #3
	str r0, [r8, #0x1c4]
	mov r0, #0x1b
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B01C:
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x1c
	str r0, [r8, #8]
	mov r0, #7
	str r0, [r8]
	b _0238C598
_0238B040:
	mov r0, #0xc
	bl RandInt
	ldr r1, _0238B424 ; =ov11_02324DB0
	ldr r2, [r1]
	strh r0, [r2, #0xfa]
	ldr r0, [r1]
	ldrsh r0, [r0, #0xd0]
	bl ov19_0238A1A8
	mov r6, r0
	bl ov19_0238A1B8
	ldr r1, _0238B424 ; =ov11_02324DB0
	mov r7, r0
	mov r0, #0
	ldr r4, [r1]
	mov r2, r0
_0238B07C:
	mov r1, r2, lsl #1
	ldrh r1, [r6, r1]
	add r2, r2, #1
	cmp r2, #4
	add r0, r0, r1
	blt _0238B07C
	mov r5, #3
	bl RandInt
	mov r2, #0
	mov r3, r2
	b _0238B0C4
_0238B0A8:
	mov r1, r3, lsl #1
	ldrh r1, [r6, r1]
	add r2, r2, r1
	cmp r2, r0
	movhi r5, r3
	bhi _0238B0CC
	add r3, r3, #1
_0238B0C4:
	cmp r3, #3
	blt _0238B0A8
_0238B0CC:
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _0238B0E8
_0238B0D8: ; jump table
	b _0238B0E8 ; case 0
	b _0238B0F0 ; case 1
	b _0238B100 ; case 2
	b _0238B0F8 ; case 3
_0238B0E8:
	mov r5, #0
	b _0238B204
_0238B0F0:
	mov r5, #1
	b _0238B204
_0238B0F8:
	mov r5, #2
	b _0238B204
_0238B100:
	mov r0, #0
	mov r2, r0
_0238B108:
	mov r1, r2, lsl #1
	ldrh r1, [r7, r1]
	add r2, r2, #1
	cmp r2, #4
	add r0, r0, r1
	blt _0238B108
	mov r6, #3
	bl RandInt
	mov r3, #0
	mov r2, r3
	b _0238B150
_0238B134:
	mov r1, r2, lsl #1
	ldrh r1, [r7, r1]
	add r3, r3, r1
	cmp r3, r0
	movhi r6, r2
	bhi _0238B158
	add r2, r2, #1
_0238B150:
	cmp r2, #3
	blt _0238B134
_0238B158:
	cmp r6, #0
	mov r5, #6
	beq _0238B178
	cmp r6, #1
	beq _0238B1C4
	cmp r6, #2
	beq _0238B1F4
	b _0238B204
_0238B178:
	bl sub_0201077C
	cmp r0, #0
	bne _0238B204
	mov r0, #0x1e
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0238B204
	bl GetRecruitableMonsterAll
	add r1, r4, #0x100
	strh r0, [r1, #4]
	bl GetRecruitableMonsterList
	add r1, r4, #0x100
	strh r0, [r1, #6]
	ldrsh r0, [r1, #4]
	cmp r0, #0
	ldrnesh r0, [r1, #6]
	cmpne r0, #0
	movne r5, #3
	b _0238B204
_0238B1C4:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _0238B204
	bl GetRecruitableMonsterListRestricted
	add r1, r4, #0x100
	strh r0, [r1, #4]
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r5, #4
	b _0238B204
_0238B1F4:
	mov r0, #0
	bl ov19_0238A3EC
	cmp r0, #0
	movne r5, #5
_0238B204:
	str r5, [r4, #0xfc]
	ldr r0, [r8, #0xfc]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238C598
_0238B218: ; jump table
	b _0238B234 ; case 0
	b _0238B250 ; case 1
	b _0238B234 ; case 2
	b _0238B234 ; case 3
	b _0238B234 ; case 4
	b _0238B234 ; case 5
	b _0238B2B8 ; case 6
_0238B234:
	bl sub_02046D20
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x22
	str r0, [r8, #4]
	b _0238C598
_0238B250:
	bl ov19_0238C640
	add r0, sp, #0x7a0
	bl InitPreprocessorArgs
	ldr r2, _0238B428 ; =0x0001012E
	add r0, r8, #0x10
	mov r1, #0xc
	str r2, [sp, #0x7ec]
	bl SetPortraitEmotion
	bl ov19_0238D450
	mov r0, #4
	ldr r1, _0238B484 ; =0x0000101C
	str r0, [r8, #0x1c4]
	add r0, r8, #0x100
	strh r1, [r0, #0xc8]
	add r3, r1, #0x2000
	add r1, sp, #0x7a0
	str r1, [sp]
	ldr r2, _0238B48C ; =0x000045B1
	add r0, r8, #0x1cc
	mov r1, #0x400
	bl PreprocessStringFromId
	mov r0, #0x1d
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B2B8:
	bl ov19_0238C640
	add r0, sp, #0x750
	bl InitPreprocessorArgs
	ldr r2, _0238B428 ; =0x0001012E
	add r0, r8, #0x10
	mov r1, #0xc
	str r2, [sp, #0x79c]
	bl SetPortraitEmotion
	bl ov19_0238D450
	mov r0, #5
	ldr r1, _0238B484 ; =0x0000101C
	str r0, [r8, #0x1c4]
	add r0, r8, #0x100
	strh r1, [r0, #0xc8]
	add r3, r1, #0x2000
	add r1, sp, #0x750
	str r1, [sp]
	ldr r2, _0238B490 ; =0x000045BC
	add r0, r8, #0x1cc
	mov r1, #0x400
	bl PreprocessStringFromId
	mov r0, #0x1e
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B320:
	bl ov19_0238D47C
	bl sub_02046D20
	add r0, r8, #0x10
	mov r1, #0
	bl SetPortraitEmotion
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x22
	str r0, [r8, #4]
	b _0238C598
_0238B34C:
	bl ov19_0238C640
	add r0, sp, #0x700
	bl InitPreprocessorArgs
	ldr r2, _0238B428 ; =0x0001012E
	add r0, r8, #0x10
	mov r1, #7
	str r2, [sp, #0x74c]
	bl SetPortraitEmotion
	bl ov19_0238D450
	mov r0, #6
#ifdef EUROPE
	ldr r3, _0238B484 ; =0x0000101C
	str r0, [r8, #0x1c4]
	add r0, r8, #0x100
	strh r3, [r0, #0xc8]
	add r1, sp, #0x700
	str r1, [sp]
	add r2, r3, #0x35c0
	add r0, r8, #0x1cc
	mov r1, #0x400
	add r3, r3, #0x2000
#else
	ldr r1, _0238B484 ; =0x0000101C
	str r0, [r8, #0x1c4]
	add r0, r8, #0x100
	strh r1, [r0, #0xc8]
	add r3, r1, #0x2000
	add r1, sp, #0x700
	str r1, [sp]
	ldr r2, _0238B494 ; =0x000045BD
	add r0, r8, #0x1cc
	mov r1, #0x400
#endif
	bl PreprocessStringFromId
	mov r0, #0x1f
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B3B4:
	bl ov19_0238C640
	bl ov19_0238D47C
	add r0, r8, #0x10
	mov r1, #0
	bl SetPortraitEmotion
	add r0, sp, #0x6b0
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	ldr r0, _0238B498 ; =0x00001311
	orr r1, r1, #0x20000
	str r1, [sp, #0x6b0]
	str r0, [sp, #0x6d4]
	mov r3, #0x1c
	add r0, r8, #0x100
	strh r3, [r0, #0xc8]
	add r1, sp, #0x6b0
	str r1, [sp]
	ldr r2, _0238B49C ; =0x000045BE
	add r0, r8, #0x1cc
	mov r1, #0x400
	bl PreprocessStringFromId
	mov r0, #7
	str r0, [r8, #0x1c4]
	mov r0, #0x20
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
	.align 2, 0
#if defined(EUROPE)
#define OV19_0238A4A4_OFFSET 0x1F
#elif defined(JAPAN)
#define OV19_0238A4A4_OFFSET -0xC1C
#else
#define OV19_0238A4A4_OFFSET 0
#endif
_0238B424: .word ov11_02324DB0
_0238B428: .word 0x0001012E
_0238B42C: .word 0x0000458B + OV19_0238A4A4_OFFSET
_0238B430: .word BAR_MAIN_MENU_ITEMS
_0238B434: .word 0x0000458C + OV19_0238A4A4_OFFSET
_0238B438: .word 0x00004590 + OV19_0238A4A4_OFFSET
_0238B43C: .word 0x0000458F + OV19_0238A4A4_OFFSET
_0238B440: .word 0x0000301C
_0238B444: .word 0x0000458D + OV19_0238A4A4_OFFSET
_0238B448: .word 0x0000458E + OV19_0238A4A4_OFFSET
_0238B44C: .word ov19_0238D4A4
_0238B450: .word OVERLAY19_UNKNOWN_POINTER__NA_238E360
_0238B454: .word BAR_WINDOW_PARAMS_1
_0238B458: .word BAR_SUBMENU_ITEMS_1
_0238B45C: .word 0x00003F02
_0238B460: .word 0x00004594 + OV19_0238A4A4_OFFSET
_0238B464: .word BAR_WINDOW_PARAMS_2
_0238B468: .word 0x00001013
#ifdef JAPAN
_0238B46C: .word 0x00001D3C
#else
_0238B46C: .word 0x000008E4
#endif
_0238B470: .word BAR_WINDOW_PARAMS_3
_0238B474: .word BAR_SUBMENU_ITEMS_2
_0238B478: .word BAR_MENU_ITEMS_CONFIRM_1
_0238B47C: .word 0x0000459A + OV19_0238A4A4_OFFSET
_0238B480: .word 0x0000459D + OV19_0238A4A4_OFFSET
_0238B484: .word 0x0000101C
_0238B488: .word 0x0000459E + OV19_0238A4A4_OFFSET
_0238B48C: .word 0x000045B1 + OV19_0238A4A4_OFFSET
_0238B490: .word 0x000045BC + OV19_0238A4A4_OFFSET
#ifndef EUROPE
_0238B494: .word 0x000045BD + OV19_0238A4A4_OFFSET
#endif
_0238B498: .word 0x00001311
_0238B49C: .word 0x000045BE + OV19_0238A4A4_OFFSET
_0238B4A0: .word 0x000045BF + OV19_0238A4A4_OFFSET
_0238B4A4:
	add r0, sp, #0x660
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	add r0, r8, #0x100
	orr r1, r1, #0x20000
	str r1, [sp, #0x660]
	mov r3, #0x1c
	strh r3, [r0, #0xc8]
	add r4, sp, #0x660
	ldr r2, _0238B4A0 ; =0x000045BF
	add r0, r8, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, #8
	str r0, [r8, #0x1c4]
	mov r0, #0x21
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B4F8:
	add r0, sp, #0x610
	bl InitPreprocessorArgs
#ifdef JAPAN
	ldr r1, [r8, #0xd4]
	mov r0, #0x1c
	orr r3, r1, #0x20000
	add r2, sp, #0x610
	rsb r1, r0, #0x39c0
#else
	ldr r0, [r8, #0xd4]
	ldr r1, _0238C488 ; =0x000045C0
	orr r3, r0, #0x20000
	add r2, sp, #0x610
	mov r0, #0x1c
#endif
	str r3, [sp, #0x610]
	bl sub_02046BE8
	mov r0, #0x25
	str r0, [r8, #4]
	b _0238C598
_0238B528:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ble _0238C598
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	add r0, sp, #0x230
	bl InitPreprocessorArgs
	ldr r0, _0238B424 ; =ov11_02324DB0
	add r3, sp, #0x230
	ldr r6, [r0]
	ldr r2, _0238C48C ; =OVERLAY19_UNKNOWN_STRING_IDS__NA_238E238
	ldrsh r5, [r6, #0xd0]
	mov r0, r4
	mov r1, #0x100
	str r5, [sp, #0x240]
	str r3, [sp]
	ldrh r5, [r6, #0xfa]
	mov r3, #0
	mov r5, r5, lsl #1
	ldrh r2, [r2, r5]
	bl PreprocessStringFromId
	add r0, sp, #0x5c0
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	ldr r0, _0238B498 ; =0x00001311
	orr r1, r1, #0x20000
	str r1, [sp, #0x5c0]
	str r0, [sp, #0x5e4]
#ifdef EUROPE
	add r1, r0, #0x32c0
#else
	ldr r1, _0238C490 ; =0x000045B2
#endif
	mov r0, #0x1c
	add r2, sp, #0x5c0
	str r4, [sp, #0x5f8]
	bl sub_02046BE8
	mov r0, r4
	bl MemFree
	mov r0, #0x23
	str r0, [r8, #4]
	b _0238C598
_0238B5D8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	mov r0, #3
	bl RandInt
	mov r4, r0
	bl ov19_0238C640
	ldr r0, [r8, #0xfc]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238B668
_0238B610: ; jump table
	b _0238B62C ; case 0
	b _0238B63C ; case 1
	b _0238B64C ; case 2
	b _0238B62C ; case 3
	b _0238B62C ; case 4
	b _0238B62C ; case 5
	b _0238B668 ; case 6
_0238B62C:
	ldr r0, _0238C494 ; =ov19_0238E18A
	mov r1, r4, lsl #1
	ldrh r5, [r0, r1]
	b _0238B668
_0238B63C:
	ldr r0, _0238C498 ; =ov19_0238E17E
	mov r1, r4, lsl #1
	ldrh r5, [r0, r1]
	b _0238B668
_0238B64C:
	ldr r0, _0238C49C ; =ov19_0238E190
	mov r1, r4, lsl #1
	ldrh r5, [r0, r1]
	ldr r0, _0238C4A0 ; =0x000045B9
	cmp r5, r0
	moveq r0, #0xc
	streq r0, [r8, #0x1c4]
_0238B668:
	ldr r0, [r8, #0x1c4]
	cmp r0, #0
	bne _0238B690
	mov r1, r5
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	mov r0, #0x25
	str r0, [r8, #4]
	b _0238C598
_0238B690:
	add r0, r8, #0x100
	mov r3, #0x1c
	mov r2, r5
	strh r3, [r0, #0xc8]
	mov r4, #0
	add r0, r8, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, #0x24
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238B6C8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
_0238B6E0:
	ldr r0, [r8, #0xfc]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238C598
_0238B6F0: ; jump table
	b _0238B70C ; case 0
	b _0238B70C ; case 1
	b _0238BD48 ; case 2
	b _0238B70C ; case 3
	b _0238B70C ; case 4
	b _0238B70C ; case 5
	b _0238B70C ; case 6
_0238B70C:
	ldr r0, _0238B424 ; =ov11_02324DB0
	ldr r5, [r0]
	ldr r0, [r5, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r1, #0
	str r1, [sp, #0x24]
	mov r4, r0
	bl ov19_0238C640
	ldrsh r1, [r5, #0xd0]
	cmp r1, #0x67
	bgt _0238B7A8
	subs r0, r1, #0x58
	addpl pc, pc, r0, lsl #2
	b _0238B78C
_0238B74C: ; jump table
	b _0238B7FC ; case 0
	b _0238B904 ; case 1
	b _0238BA3C ; case 2
	b _0238BA3C ; case 3
	b _0238BA3C ; case 4
	b _0238B938 ; case 5
	b _0238BA3C ; case 6
	b _0238BA3C ; case 7
	b _0238BA3C ; case 8
	b _0238BA3C ; case 9
	b _0238BA3C ; case 10
	b _0238BA3C ; case 11
	b _0238B96C ; case 12
	b _0238B990 ; case 13
	b _0238B9B4 ; case 14
	b _0238B9D8 ; case 15
_0238B78C:
	cmp r1, #0x47
	bgt _0238B79C
	beq _0238B7C4
	b _0238BA3C
_0238B79C:
	cmp r1, #0x4d
	beq _0238B7E0
	b _0238BA3C
_0238B7A8:
	cmp r1, #0x6c
	bgt _0238B7B8
	beq _0238B9F0
	b _0238BA3C
_0238B7B8:
	cmp r1, #0x89
	beq _0238BA14
	b _0238BA3C
_0238B7C4:
	add r1, sp, #0x24
	mov r0, r4
	bl ApplySitrusBerryBoostToGroundMonster
	ldr r1, [sp, #0x24]
	bl ov19_0238C80C
	mov r5, r0
	b _0238BCE8
_0238B7E0:
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyLifeSeedBoostToGroundMonster
	ldr r1, [sp, #0x24]
	bl ov19_0238C80C
	mov r5, r0
	b _0238BCE8
_0238B7FC:
	add r1, sp, #0x14
	add r2, sp, #0x24
	mov r0, r4
	bl ApplyGinsengToGroundMonster
	ldr r2, _0238B424 ; =ov11_02324DB0
	mov r7, r0
	ldrh sb, [sp, #0x14]
	mov r0, #0x100
	mov r1, #0xf
	ldr r6, [sp, #0x24]
	ldr r4, [r2]
	bl MemAlloc
	mov r5, r0
	add r0, sp, #0x88
	bl InitPreprocessorArgs
	cmp r7, #0
	str sb, [sp, #0x98]
	str r5, [sp, #0xc0]
	cmpeq r6, #0
	bne _0238B85C
	mov r0, r5
	bl MemFree
	mov r5, #0
	b _0238BCE8
_0238B85C:
	mov r0, #1
	str r0, [r4, #0x1c4]
	cmp r7, #0
	bne _0238B8BC
	cmp r6, #0
	beq _0238B8BC
	add r0, r4, #0x100
	mov r1, #0x1c
	cmp r6, #1
	strh r1, [r0, #0xc8]
	ldrne r0, _0238C4A4 ; =0x000045D6
	add r6, sp, #0x88
	ldreq r0, _0238C4A8 ; =0x000045D7
	mov r3, #0x1c
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	add r0, r4, #0x1cc
	mov r1, #0x400
	str r6, [sp]
	bl PreprocessStringFromId
	mov r0, r5
	bl MemFree
	mov r5, #2
	b _0238BCE8
_0238B8BC:
	add r0, r4, #0x100
	mov r1, #0x1c
	strh r1, [r0, #0xc8]
	cmp r7, #1
	ldrne r0, _0238C4AC ; =0x000045D4
	add r6, sp, #0x88
	ldreq r0, _0238C4B0 ; =0x000045D5
	mov r3, #0x1c
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	add r0, r4, #0x1cc
	mov r1, #0x400
	str r6, [sp]
	bl PreprocessStringFromId
	mov r0, r5
	bl MemFree
	mov r5, #1
	b _0238BCE8
_0238B904:
	mov r0, r4
	bl ov11_0230AD7C
	cmp r0, #0
	beq _0238B924
	mov r0, #1
	bl ov19_0238CB2C
	mov r5, #4
	b _0238BCE8
_0238B924:
	mov r0, r4
	mov r1, #1
	bl ov11_0230A31C
	mov r5, #3
	b _0238BCE8
_0238B938:
	mov r0, r4
	bl ov11_0230AD7C
	cmp r0, #0
	beq _0238B958
	mov r0, #5
	bl ov19_0238CB2C
	mov r5, #4
	b _0238BCE8
_0238B958:
	mov r0, r4
	mov r1, #5
	bl ov11_0230A31C
	mov r5, #3
	b _0238BCE8
_0238B96C:
	ldr r5, [sp, #0x24]
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyProteinBoostToGroundMonster
	mov r1, r5
	mov r2, #2
	bl ov19_0238C900
	mov r5, r0
	b _0238BCE8
_0238B990:
	ldr r5, [sp, #0x24]
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyCalciumBoostToGroundMonster
	mov r1, r5
	mov r2, #3
	bl ov19_0238C900
	mov r5, r0
	b _0238BCE8
_0238B9B4:
	ldr r5, [sp, #0x24]
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyIronBoostToGroundMonster
	mov r1, r5
	mov r2, #4
	bl ov19_0238C900
	mov r5, r0
	b _0238BCE8
_0238B9D8:
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyNectarBoostToGroundMonster
	bl ov19_0238C9F0
	mov r5, r0
	b _0238BCE8
_0238B9F0:
	ldr r5, [sp, #0x24]
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyZincBoostToGroundMonster
	mov r1, r5
	mov r2, #5
	bl ov19_0238C900
	mov r5, r0
	b _0238BCE8
_0238BA14:
	mov r0, r4
	bl IsMonsterAffectedByGravelyrockGroundMode
	cmp r0, #0
	beq _0238BA3C
	add r1, sp, #0x24
	mov r0, r4
	bl ApplyGravelyrockBoostToGroundMonster
	bl ov19_0238C9F0
	mov r5, r0
	b _0238BCE8
_0238BA3C:
	ldrsh r0, [r5, #0xd0]
	bl IsGummi
	cmp r0, #0
	beq _0238BCE4
	ldr r0, _0238B424 ; =ov11_02324DB0
	ldr sb, [r0]
	ldr r0, [sb, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r4, r0
	ldr r0, _0238C4B4 ; =0x0000068A
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	add r0, r5, #0x500
	str r0, [sp, #0x10]
	add r0, r5, #0x45
	add r6, r0, #0x600
	ldrsh r2, [r4, #0xa]
	add r1, sp, #0x114
	ldrb r3, [r4, #0xc]
	strh r2, [r1, #0x64]
	ldrsh r2, [r4, #8]
	ldrb r0, [r4, #0xd]
	ldrb fp, [r4, #0xe]
	strh r2, [r1, #0x66]
	strh r3, [r1, #0x68]
	strh r0, [r1, #0x6a]
	add sl, r5, #0x600
	ldrb r3, [r4, #0xf]
	strh fp, [r1, #0x6c]
	mov r0, sl
	strh r3, [r1, #0x6e]
	ldrsh r1, [r4, #4]
	bl GetLearnableIqSkills
	str r0, [sp, #0xc]
	ldrsh r1, [sb, #0xd0]
	mov r0, r4
	mov r2, #0
	add r3, sp, #0x28
	bl ApplyGummiBoostsToGroundMonster
	add r0, sp, #0x114
	ldrsh fp, [r4, #0xa]
	ldrsh r3, [r0, #0x64]
	ldrsh r2, [r4, #8]
	ldrsh r1, [r0, #0x66]
	sub r3, fp, r3
	ldrb lr, [r4, #0xc]
	strh r3, [r0, #0x64]
	sub r1, r2, r1
	strh r1, [r0, #0x66]
	ldrsh ip, [r0, #0x68]
	ldrb r3, [r4, #0xd]
	ldrsh r1, [r0, #0x6a]
	sub fp, lr, ip
	ldrb lr, [r4, #0xe]
	sub r1, r3, r1
	strh fp, [r0, #0x68]
	strh r1, [r0, #0x6a]
	ldrsh ip, [r0, #0x6c]
	ldrb r3, [r4, #0xf]
	ldrsh r1, [r0, #0x6e]
	sub fp, lr, ip
	strh fp, [r0, #0x6c]
	sub r1, r3, r1
	strh r1, [r0, #0x6e]
	ldrsh r1, [r4, #4]
	mov r0, r6
	bl GetLearnableIqSkills
	mov fp, r0
	mov r0, #0
	strb r0, [r5]
	ldrsh r0, [sp, #0x28]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238BB9C
_0238BB70: ; jump table
	b _0238BB80 ; case 0
	b _0238BB88 ; case 1
	b _0238BB90 ; case 2
	b _0238BB98 ; case 3
_0238BB80:
	ldr r7, _0238C4B8 ; =0x000045E3
	b _0238BB9C
_0238BB88:
	ldr r7, _0238C4BC ; =0x000045E4
	b _0238BB9C
_0238BB90:
	ldr r7, _0238C4C0 ; =0x000045E5
	b _0238BB9C
_0238BB98:
	ldr r7, _0238C4C4 ; =0x000045E6
_0238BB9C:
	add r0, sp, #0xd8
	bl InitPreprocessorArgs
	ldr r0, _0238B424 ; =ov11_02324DB0
	mov r2, r7
	ldr r1, [r0]
	add r3, sp, #0xd8
	ldr r7, [r1, #0xd4]
	add r0, r5, #0x400
	orr r7, r7, #0x20000
	str r7, [sp, #0xd8]
	str r3, [sp]
	mov r1, #0x400
	mov r3, #0x1c
	bl PreprocessStringFromId
	mov r0, r5
	add r1, r5, #0x400
	bl strcat
	add r0, sp, #0x114
	ldrsh r0, [r0, #0x66]
	cmp r0, #0
	beq _0238BC0C
	stmia sp, {sl, fp}
	ldr r3, [sp, #0xc]
	mov r0, r5
	mov r2, r4
	add r1, r5, #0x400
	str r6, [sp, #8]
	bl ov19_0238CBC0
_0238BC0C:
	add r0, sp, #0x128
	bl InitPreprocessorArgs
	ldr r0, [sb, #0xd4]
	ldr r4, _0238C4C8 ; =OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
	orr r0, r0, #0x20000
	str r0, [sp, #0x128]
	ldr r0, [sp, #0x10]
	mov r7, #2
	str r0, [sp, #0x160]
	add fp, sp, #0x128
	add r6, sp, #0x178
_0238BC38:
	mov r0, r7, lsl #1
	ldrsh sl, [r6, r0]
	cmp sl, #0
	beq _0238BC8C
	ldr r1, _0238C4CC ; =ov19_0238E2C0
	mov r0, r5
	bl strcat
	mov r1, r7, lsl #1
	ldrh r1, [r4, r1]
	ldr r0, [sp, #0x10]
	str sl, [sp, #0x14c]
	bl GetStringFromFileVeneer
	ldr r2, _0238C4D0 ; =0x000045E7
	add r0, r5, #0x400
	mov r1, #0x100
	mov r3, #0
	str fp, [sp]
	bl PreprocessStringFromId
	mov r0, r5
	add r1, r5, #0x400
	bl strcat
_0238BC8C:
	add r7, r7, #1
	cmp r7, #6
	blt _0238BC38
	add r0, sp, #0x128
	bl InitPreprocessorArgs
	mov r0, #4
	str r0, [sp, #0x14c]
	add r0, sb, #0x100
	mov r3, #0x1c
	strh r3, [r0, #0xc8]
	add r4, sp, #0x128
	mov r2, r5
	add r0, sb, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r1, #1
	mov r0, r5
	str r1, [sb, #0x1c4]
	bl MemFree
	mov r5, #1
	b _0238BCE8
_0238BCE4:
	mov r5, #0
_0238BCE8:
	str r5, [r8, #0x108]
	cmp r5, #0
	bne _0238BD2C
	add r0, sp, #0x570
	bl InitPreprocessorArgs
	ldr r1, [r8, #0xd4]
	add r0, r8, #0x100
	orr r1, r1, #0x20000
	str r1, [sp, #0x570]
	mov r3, #0x1c
	strh r3, [r0, #0xc8]
	add r4, sp, #0x570
	ldr r2, _0238C4D4 ; =0x000045C1
	add r0, r8, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessStringFromId
_0238BD2C:
	cmp r5, #3
	moveq r0, #0x29
	movne r0, #0x26
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238BD48:
	mov r3, #0
	mov r2, r3
_0238BD50:
	add r0, r8, r3, lsl #1
	add r0, r0, #0x100
	strh r2, [r0, #0xc]
	add r1, r8, r3
	strh r2, [r0, #0x18]
	add r3, r3, #1
	strb r2, [r1, #0x124]
	cmp r3, #6
	blt _0238BD50
	add r0, sp, #0x1c
	add r1, sp, #0x20
	bl ov19_0238A194
	mov r0, #5
	bl RandInt
	mov r4, r0
	ldr r1, [sp, #0x20]
	cmp r4, #1
	ldr r0, [sp, #0x1c]
	addge r4, r4, #1
	add r1, r1, #1
	bl RandRange
	add r1, r8, r4, lsl #1
	rsb r3, r0, #0
	add r2, r1, #0x100
	add r0, r8, #0x10c
	mov r1, #0
	strh r3, [r2, #0xc]
	bl ov19_0238CCEC
	cmp r0, #0
	bne _0238BDD0
	bl ov19_0238D310
	b _0238C598
_0238BDD0:
	add r0, r8, #0x10c
	bl ov19_0238CEC0
	mov r0, #0x28
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238BDEC:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #3
	str r0, [r8, #4]
	bl ov19_0238D0D8
	b _0238C598
_0238BE08:
	ldr r1, [r8, #8]
	mvn r0, #0
	cmp r1, r0
	bne _0238BE28
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #3
	b _0238C59C
_0238BE28:
	str r1, [r8, #4]
	str r0, [r8, #8]
	b _0238C598
_0238BE34:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #3
	str r0, [r8, #4]
	bl ov19_0238D0D8
	b _0238C598
_0238BE50:
	bl ov11_0230A390
	cmp r0, #0
	beq _0238C598
	bl ov11_0230AD50
	bl ov19_0238D0D8
	b _0238C598
_0238BE68:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ble _0238C598
	bl ov19_0238C640
	add r0, sp, #0x520
	bl InitPreprocessorArgs
	ldr r1, _0238B428 ; =0x0001012E
	mov r0, #9
	str r1, [sp, #0x56c]
	str r0, [r8, #0x1c4]
	bl ov19_0238D450
	ldr r1, _0238B484 ; =0x0000101C
	add r0, r8, #0x100
	strh r1, [r0, #0xc8]
	add r3, r1, #0x2000
	add r1, sp, #0x520
	str r1, [sp]
	ldr r2, _0238C4D8 ; =0x000045D9
	add r0, r8, #0x1cc
	mov r1, #0x400
	bl PreprocessStringFromId
	mov r0, #0x2b
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238BEE0:
	add r0, r8, #0x100
	ldrsh r0, [r0, #4]
	mov r1, #0
	mov r2, r1
	mov r3, r1
	bl sub_02065BAC
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x2c
	str r0, [r8, #8]
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	movne r0, #0x10
	strne r0, [r8]
	bne _0238C598
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #0x11
	str r0, [r8]
	b _0238C598
_0238BF44:
	bl ov19_0238C640
	mov r0, #0xa
	str r0, [r8, #0x1c4]
	mov r0, #0x2d
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238BF64:
	add r0, sp, #0x5c
	bl sub_0206351C
	mov r0, #1
	strb r0, [sp, #0x7e]
	add r0, r8, #0x100
	ldrsh r4, [r0, #6]
	mov r1, #0
	mov r3, #5
	add r0, sp, #0x5c
	mov r2, r1
	strh r4, [sp, #0x80]
	strb r3, [sp, #0x5e]
	bl sub_0203D438
	mov r0, #0x2e
	str r0, [r8, #4]
	b _0238C598
_0238BFA4:
	bl sub_0203D538
	cmp r0, #0
	beq _0238C598
	bl sub_0203EFD4
	bl ov19_0238D310
	b _0238C598
_0238BFBC:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ble _0238C598
	add r0, sp, #0x4d0
	bl InitPreprocessorArgs
	mov r3, #0x60000
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238C4DC ; =0x000045DA
	add r2, sp, #0x4d0
	str r3, [sp, #0x51c]
	bl sub_02046BE8
	mov r0, #0x30
	str r0, [r8, #4]
	b _0238C598
_0238C004:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	bl sub_02046D20
	mov r0, #0
	add r1, r8, #0x100
	ldrsh r1, [r1, #4]
	mov r2, r0
	mov r3, r0
	bl sub_02065BAC
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x31
	str r0, [r8, #8]
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	movne r0, #0x12
	strne r0, [r8]
	bne _0238C598
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #0x13
	str r0, [r8]
	b _0238C598
_0238C07C:
	add r0, sp, #0x480
	bl InitPreprocessorArgs
	add r1, r8, #0x100
	ldrsh r2, [r1, #4]
	add r0, r8, #0x10
	str r2, [sp, #0x4cc]
	ldrsh r1, [r1, #4]
	bl InitPortraitParamsWithMonsterId
	add r0, r8, #0x10
	mov r1, #0x13
	bl SetPortraitLayout
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	beq _0238C0D0
	ldr r1, _0238C4E0 ; =ov19_0238E1BC
	add r0, r8, #0x10
	bl SetPortraitOffset
	b _0238C0DC
_0238C0D0:
	ldr r1, _0238C4E4 ; =ov19_0238E1C4
	add r0, r8, #0x10
	bl SetPortraitOffset
_0238C0DC:
	ldr r0, _0238B440 ; =0x0000301C
	ldr r1, _0238C4E8 ; =0x000045DB
	add r2, sp, #0x480
	bl sub_02046BE8
	bl ov19_0238D450
	mov r0, #0x32
	str r0, [r8, #4]
	b _0238C598
_0238C0FC:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	add r0, sp, #0x3e8
	mov r1, #0x98
	bl MemZero
	add r0, sp, #0x398
	bl InitPreprocessorArgs
	add r1, r8, #0x100
	ldrsh r2, [r1, #4]
	add r0, r8, #0x10
	str r2, [sp, #0x3e4]
	ldrsh r1, [r1, #4]
	bl InitPortraitParamsWithMonsterId
	add r0, r8, #0x10
	mov r1, #0x13
	bl SetPortraitLayout
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	beq _0238C174
	ldr r1, _0238C4EC ; =OVERLAY19_UNKNOWN_STRUCT__NA_238E1A4
	add r0, r8, #0x10
	bl SetPortraitOffset
	b _0238C180
_0238C174:
	ldr r1, _0238C4F0 ; =ov19_0238E1AC
	add r0, r8, #0x10
	bl SetPortraitOffset
_0238C180:
	bl ov19_0238D450
	ldr r1, _0238C4F4 ; =BAR_MENU_ITEMS_CONFIRM_2
#ifdef JAPAN
	mov r0, #0x39c0
#else
	ldr r0, _0238C4F8 ; =0x000045DC
#endif
	str r1, [sp]
	str r0, [sp, #4]
	add r4, sp, #0x398
	add r3, sp, #0x3e8
	mov r0, #0
	mov r1, #0x3000
	mov r2, #0x31
	str r4, [sp, #8]
	bl sub_02046A20
	mov r0, #0x33
	str r0, [r8, #4]
	b _0238C598
_0238C1BC:
	bl ov19_0238D418
	cmp r0, #8
	bne _0238C200
	bl ov19_0238D47C
	bl sub_02046D20
	ldr r1, _0238C4FC ; =ov19_0238E1B4
	add r0, r8, #0x10
	bl SetPortraitOffset
	add r0, r8, #0x10
	mov r1, #0
	bl SetPortraitLayout
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x36
	str r0, [r8, #4]
	b _0238C598
_0238C200:
	sub r0, r0, #9
	cmp r0, #1
	bhi _0238C598
	bl ov19_0238D47C
	bl sub_02046D20
	add r0, r8, #0x10
	mov r1, #0
	bl SetPortraitLayout
	ldr r1, _0238C4FC ; =ov19_0238E1B4
	add r0, r8, #0x10
	bl SetPortraitOffset
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x34
	str r0, [r8, #4]
	b _0238C598
_0238C244:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ble _0238C598
	bl ov19_0238D47C
	ldr r1, _0238C500 ; =0x00000163
	add r0, r8, #0x10
	bl InitPortraitParamsWithMonsterId
	add r0, sp, #0x348
	bl InitPreprocessorArgs
	add r0, r8, #0x100
	ldrsh r3, [r0, #4]
	ldr r1, _0238C504 ; =0x000045DF
	add r2, sp, #0x348
	mov r0, #0x1c
	str r3, [sp, #0x348]
	bl sub_02046BE8
	mov r0, #0x35
	str r0, [r8, #4]
	b _0238C598
_0238C2A0:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	bl sub_02046D20
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #3
	str r0, [r8, #8]
	mov r0, #0x14
	str r0, [r8]
	b _0238C598
_0238C2E4:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ble _0238C598
	bl ov19_0238D47C
	ldr r1, _0238C500 ; =0x00000163
	add r0, r8, #0x10
	bl InitPortraitParamsWithMonsterId
	add r0, sp, #0x30
	bl sub_0206351C
	mov r0, #6
	strb r0, [sp, #0x32]
	add r0, r8, #0x100
	ldrsh r3, [r0, #4]
	mov r1, #0
	add r0, sp, #0x30
	mov r2, r1
	strh r3, [sp, #0x54]
	bl sub_0203D438
	mov r0, #0x37
	str r0, [r8, #4]
	b _0238C598
_0238C348:
	bl sub_0203D538
	cmp r0, #0
	beq _0238C598
	bl sub_0203EFD4
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x38
	str r0, [r8, #8]
	mov r0, #0x14
	str r0, [r8]
	b _0238C598
_0238C380:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C598
	bl ov11_02311D6C
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	str r0, [r8, #4]
	mov r0, #3
	str r0, [r8, #8]
_0238C3AC:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	bl ov19_0238C640
	add r0, sp, #0x2f8
	bl InitPreprocessorArgs
	add r0, r8, #0x100
	mov r3, #0x1c
	strh r3, [r0, #0xc8]
	add r4, sp, #0x2f8
#ifdef EUROPE
	add r0, r8, #0x1cc
	mov r1, #0x400
	mov r2, #0x4600
#else
	ldr r2, _0238C508 ; =0x000045E1
	add r0, r8, #0x1cc
	mov r1, #0x400
#endif
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, #0xb
	str r0, [r8, #0x1c4]
	mov r0, #0x3b
	str r0, [r8, #4]
	mov r0, #0xc
	str r0, [r8]
	b _0238C598
_0238C410:
	bl sub_02046D20
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x3d
	str r0, [r8, #4]
	mov r0, #0x3c
	str r0, [r8, #8]
	mov r0, #0x15
	str r0, [r8]
	b _0238C598
_0238C43C:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C598
	bl ov11_02311D6C
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	str r0, [r8, #4]
	mov r0, #3
	str r0, [r8, #8]
	b _0238C598
_0238C46C:
	ldr r1, [r8, #8]
	mvn r0, #0
	str r1, [r8, #4]
	str r0, [r8, #8]
	b _0238C598
_0238C480:
	bl ov19_0238D310
	b _0238C598
#ifndef JAPAN
	.align 2, 0
_0238C488: .word 0x000045C0 + OV19_0238A4A4_OFFSET
_0238C48C: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E238
#ifndef EUROPE
_0238C490: .word 0x000045B2
#endif
_0238C494: .word ov19_0238E18A
_0238C498: .word ov19_0238E17E
_0238C49C: .word ov19_0238E190
_0238C4A0: .word 0x000045B9 + OV19_0238A4A4_OFFSET
_0238C4A4: .word 0x000045D6 + OV19_0238A4A4_OFFSET
_0238C4A8: .word 0x000045D7 + OV19_0238A4A4_OFFSET
_0238C4AC: .word 0x000045D4 + OV19_0238A4A4_OFFSET
_0238C4B0: .word 0x000045D5 + OV19_0238A4A4_OFFSET
_0238C4B4: .word 0x0000068A
_0238C4B8: .word 0x000045E3 + OV19_0238A4A4_OFFSET
_0238C4BC: .word 0x000045E4 + OV19_0238A4A4_OFFSET
_0238C4C0: .word 0x000045E5 + OV19_0238A4A4_OFFSET
_0238C4C4: .word 0x000045E6 + OV19_0238A4A4_OFFSET
_0238C4C8: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
_0238C4CC: .word ov19_0238E2C0
_0238C4D0: .word 0x000045E7 + OV19_0238A4A4_OFFSET
_0238C4D4: .word 0x000045C1 + OV19_0238A4A4_OFFSET
_0238C4D8: .word 0x000045D9 + OV19_0238A4A4_OFFSET
_0238C4DC: .word 0x000045DA + OV19_0238A4A4_OFFSET
_0238C4E0: .word ov19_0238E1BC
_0238C4E4: .word ov19_0238E1C4
_0238C4E8: .word 0x000045DB + OV19_0238A4A4_OFFSET
_0238C4EC: .word OVERLAY19_UNKNOWN_STRUCT__NA_238E1A4
_0238C4F0: .word ov19_0238E1AC
_0238C4F4: .word BAR_MENU_ITEMS_CONFIRM_2
_0238C4F8: .word 0x000045DC + OV19_0238A4A4_OFFSET
_0238C4FC: .word ov19_0238E1B4
_0238C500: .word 0x00000163
_0238C504: .word 0x000045DF + OV19_0238A4A4_OFFSET
#ifndef EUROPE
_0238C508: .word 0x000045E1 + OV19_0238A4A4_OFFSET
#endif
#endif
_0238C50C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	cmp r0, #0xa
	bne _0238C598
	ldr r1, [r8, #8]
	mvn r0, #0
	cmp r1, r0
	bne _0238C544
	bl ov19_0238D47C
	bl sub_02046D20
	mov r0, #3
	b _0238C59C
_0238C544:
	cmp r1, #8
	cmpne r1, #0xe
	bne _0238C558
	bl ov19_0238D47C
	bl sub_02046D20
_0238C558:
	mov r0, #0x3e
	str r0, [r8, #4]
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0]
	b _0238C598
#ifdef JAPAN
	.align 2, 0
_0238C48C: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E238
_0238C490: .word 0x00003996
_0238C494: .word ov19_0238E18A
_0238C498: .word ov19_0238E17E
_0238C49C: .word ov19_0238E190
_0238C4A0: .word 0x0000399D
_0238C4A4: .word 0x000039BA
_0238C4A8: .word 0x000039BB
_0238C4AC: .word 0x000039B8
_0238C4B0: .word 0x000039B9
_0238C4B4: .word 0x0000068A
_0238C4B8: .word 0x000039C7
_0238C4BC: .word 0x000039C8
_0238C4C0: .word 0x000039C9
_0238C4C4: .word 0x000039CA
_0238C4C8: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
_0238C4CC: .word ov19_0238E2C0
_0238C4D0: .word 0x000039CB
_0238C4D4: .word 0x000039A5
_0238C4D8: .word 0x000039BD
_0238C4DC: .word 0x000039BE
_0238C4E0: .word ov19_0238E1BC
_0238C4E4: .word ov19_0238E1C4
_0238C4E8: .word 0x000039BF
_0238C4EC: .word OVERLAY19_UNKNOWN_STRUCT__NA_238E1A4
_0238C4F0: .word ov19_0238E1AC
_0238C4F4: .word BAR_MENU_ITEMS_CONFIRM_2
_0238C4FC: .word ov19_0238E1B4
_0238C500: .word 0x00000163
_0238C504: .word 0x000039C3
_0238C508: .word 0x000039C5
#endif
_0238C570:
	add r0, r8, #0x100
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrsh r0, [r0]
	cmp r0, #0xa
	ldrge r1, [r8, #8]
	mvnge r0, #0
	strge r1, [r8, #4]
	strge r0, [r8, #8]
_0238C598:
	mov r0, #0
_0238C59C:
	add sp, sp, #0x308
	add sp, sp, #0x800
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov19_0238A4A4

	arm_func_start ov19_0238C5A8
ov19_0238C5A8: ; 0x0238C5A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetCurrentBagCapacity
	mov sb, #0
	mov r7, #1
	mov r8, r0
	mov sl, sb
	mov r6, sb
	mov fp, sb
	mov r5, r7
	ldr r4, _0238C63C ; =ov11_02324DB0
	b _0238C624
_0238C5D4:
	mov r0, sl, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _0238C620
	ldrsh r0, [r0, #4]
	bl GetBarItem
	cmp r0, #0
	movne r0, r5
	moveq r0, fp
	tst r0, #0xff
	ldrne r0, [r4]
	addne r0, r0, sb, lsl #1
	strneh sl, [r0, #0x68]
	addne sb, sb, #1
_0238C620:
	add sl, sl, #1
_0238C624:
	cmp sl, r8
	blt _0238C5D4
	ldr r0, _0238C63C ; =ov11_02324DB0
	ldr r0, [r0]
	str sb, [r0, #0x64]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238C63C: .word ov11_02324DB0
	arm_func_end ov19_0238C5A8

	arm_func_start ov19_0238C640
ov19_0238C640: ; 0x0238C640
	ldr r0, _0238C66C ; =ov11_02324DB0
	mov r2, #0x1c
	ldr r3, [r0]
	mov r1, #0
	add r0, r3, #0x100
	strh r2, [r0, #0xc8]
	strh r2, [r0, #0xca]
	strb r1, [r3, #0x1cc]
	strb r1, [r3, #0x5cc]
	str r1, [r3, #0x1c4]
	bx lr
	.align 2, 0
_0238C66C: .word ov11_02324DB0
	arm_func_end ov19_0238C640

	arm_func_start ov19_0238C670
ov19_0238C670: ; 0x0238C670
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r1, _0238C6C0 ; =ov11_02324DB0
	add r0, sp, #0
	ldr r4, [r1]
	mov r5, #0
	bl InitPreprocessorArgs
	add r0, r4, #0x1cc
	bl IsEmptyString
	cmp r0, #0
	bne _0238C6B4
	add r0, r4, #0x100
	ldrh r0, [r0, #0xc8]
	add r2, sp, #0
	add r1, r4, #0x1cc
	bl sub_02046C30
	mov r5, #1
_0238C6B4:
	mov r0, r5
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238C6C0: .word ov11_02324DB0
	arm_func_end ov19_0238C670

	arm_func_start ov19_0238C6C4
ov19_0238C6C4: ; 0x0238C6C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0238C7AC ; =ov11_02324DB0
	mov r0, #0
	ldr r4, [r1]
	ldr r1, [r4, #0x1c4]
	cmp r1, #0
	beq _0238C7A4
	ldr r0, [r4, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055410
	cmp r0, #0
	movne r0, #1
	bne _0238C79C
	ldr r0, [r4, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055474
	cmp r0, #0
	movne r0, #0xd
	bne _0238C79C
	ldr r1, [r4, #0xd4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	bl sub_02056E04
	mov r3, #0
	add r2, sp, #0
	b _0238C750
_0238C73C:
	mov r1, r3, lsl #1
	ldrsh r1, [r2, r1]
	cmp r4, r1
	beq _0238C75C
	add r3, r3, #1
_0238C750:
	cmp r3, r0
	blt _0238C73C
	mvn r3, #0
_0238C75C:
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	b _0238C798
_0238C768: ; jump table
	b _0238C778 ; case 0
	b _0238C780 ; case 1
	b _0238C788 ; case 2
	b _0238C790 ; case 3
_0238C778:
	mov r0, #0x16
	b _0238C79C
_0238C780:
	mov r0, #0x17
	b _0238C79C
_0238C788:
	mov r0, #0x18
	b _0238C79C
_0238C790:
	mov r0, #0x19
	b _0238C79C
_0238C798:
	mvn r0, #0
_0238C79C:
	bl sub_02065B70
	mov r0, #1
_0238C7A4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C7AC: .word ov11_02324DB0
	arm_func_end ov19_0238C6C4

	arm_func_start ov19_0238C7B0
ov19_0238C7B0: ; 0x0238C7B0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r1, _0238C808 ; =ov11_02324DB0
	add r0, sp, #0
	ldr r4, [r1]
	mov r5, #0
	bl InitPreprocessorArgs
	add r0, r4, #0x1cc
	add r0, r0, #0x400
	bl IsEmptyString
	cmp r0, #0
	bne _0238C7FC
	add r0, r4, #0x100
	ldrh r0, [r0, #0xca]
	add r1, r4, #0x1cc
	add r2, sp, #0
	add r1, r1, #0x400
	bl sub_02046C30
	mov r5, #1
_0238C7FC:
	mov r0, r5
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238C808: .word ov11_02324DB0
	arm_func_end ov19_0238C7B0

	arm_func_start ov19_0238C80C
ov19_0238C80C: ; 0x0238C80C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r2, _0238C8F4 ; =ov11_02324DB0
	mov r8, r0
	ldr r6, [r2]
	mov r7, r1
	ldr r0, [r6, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r5, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, _0238C8F4 ; =ov11_02324DB0
	ldr r0, [r0]
	ldr r0, [r0, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020564B0
	mov r2, r0
	mov r1, r5
	mov r0, r4
	bl sub_02056094
	str r4, [sp, #0x3c]
	mov r0, #1
	cmp r8, #0
	str r0, [r6, #0x1c4]
	mov r3, #0x1c
	add r5, sp, #4
	bne _0238C8C0
	str r7, [sp, #0x28]
	add r0, r6, #0x100
	strh r3, [r0, #0xc8]
	ldr r2, _0238C8F8 ; =0x000045E9
	add r0, r6, #0x1cc
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r0, r4
	bl MemFree
	b _0238C8E8
_0238C8C0:
	str r8, [sp, #0x28]
	add r0, r6, #0x100
	strh r3, [r0, #0xc8]
	ldr r2, _0238C8FC ; =0x000045E8
	add r0, r6, #0x1cc
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r0, r4
	bl MemFree
_0238C8E8:
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238C8F4: .word ov11_02324DB0
#if defined(EUROPE)
_0238C8F8: .word 0x00004608
_0238C8FC: .word 0x00004607
#elif defined(JAPAN)
_0238C8F8: .word 0x000039CD
_0238C8FC: .word 0x000039CC
#else
_0238C8F8: .word 0x000045E9
_0238C8FC: .word 0x000045E8
#endif
	arm_func_end ov19_0238C80C

	arm_func_start ov19_0238C900
ov19_0238C900: ; 0x0238C900
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r3, _0238C9E0 ; =ov11_02324DB0
	mov r8, r0
	ldr r5, [r3]
	mov r7, r1
	ldr r0, [r5, #0xd4]
	mov r6, r2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, _0238C9E4 ; =OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
	mov r1, r6, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r4
	bl GetStringFromFileVeneer
	ldr r0, _0238C9E0 ; =ov11_02324DB0
	cmp r8, #0
	ldr r0, [r0]
	moveq r6, #1
	ldr r0, [r0, #0xd4]
	movne r6, #0
	orr r0, r0, #0x20000
	cmp r6, #0
	moveq r7, r8
	str r0, [sp, #4]
	str r7, [sp, #0x28]
	str r4, [sp, #0x3c]
	add r0, r5, #0x100
	mov r1, #0x1c
	strh r1, [r0, #0xc8]
	cmp r6, #0
	ldrne r0, _0238C9E8 ; =0x000045EB
	add r7, sp, #4
	ldreq r0, _0238C9EC ; =0x000045EA
	mov r3, #0x1c
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	add r0, r5, #0x1cc
	mov r1, #0x400
	str r7, [sp]
	bl PreprocessStringFromId
	mov r0, r4
	bl MemFree
	mov r0, #1
	str r0, [r5, #0x1c4]
	cmp r6, #0
	movne r0, #2
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238C9E0: .word ov11_02324DB0
_0238C9E4: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
#if defined(EUROPE)
_0238C9E8: .word 0x0000460A
_0238C9EC: .word 0x00004609
#elif defined(JAPAN)
_0238C9E8: .word 0x000039CF
_0238C9EC: .word 0x000039CE
#else
_0238C9E8: .word 0x000045EB
_0238C9EC: .word 0x000045EA
#endif
	arm_func_end ov19_0238C900

	arm_func_start ov19_0238C9F0
ov19_0238C9F0: ; 0x0238C9F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x5c
	ldr r1, _0238CB20 ; =ov11_02324DB0
	mov sb, r0
	ldr r8, [r1]
	ldr r0, [r8, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r4, r0
	ldr r0, _0238CB24 ; =0x0000068A
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	add r0, r5, #0x45
	add r7, r0, #0x600
	mov r0, #0
	strb r0, [r5]
	add r0, sp, #0xc
	add r6, r5, #0x600
	bl InitPreprocessorArgs
	add r1, sp, #0xc
	str r1, [sp]
	ldr r2, _0238CB28 ; =0x000045D8
	add r0, r5, #0x400
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r5
	add r1, r5, #0x400
	bl strcat
	cmp sb, #0
	beq _0238CABC
	ldrsh r2, [r4, #8]
	ldrsh r1, [r4, #4]
	mov r0, r6
	sub r2, r2, sb
	bl GetLearnableIqSkills
	mov sb, r0
	ldrsh r1, [r4, #4]
	ldrsh r2, [r4, #8]
	mov r0, r7
	bl GetLearnableIqSkills
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r5
	str r7, [sp, #8]
	mov r2, r4
	mov r3, sb
	add r1, r5, #0x400
	bl ov19_0238CBC0
_0238CABC:
	add r0, sp, #0xc
	bl InitPreprocessorArgs
	ldr r0, _0238CB20 ; =ov11_02324DB0
	mov r1, #4
	ldr r0, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #0xd4]
	add r0, r8, #0x100
	orr r1, r1, #0x20000
	str r1, [sp, #0xc]
	mov r3, #0x1c
	strh r3, [r0, #0xc8]
	add r4, sp, #0xc
	mov r2, r5
	add r0, r8, #0x1cc
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r1, #1
	mov r0, r5
	str r1, [r8, #0x1c4]
	bl MemFree
	mov r0, #1
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238CB20: .word ov11_02324DB0
_0238CB24: .word 0x0000068A
#if defined(EUROPE)
_0238CB28: .word 0x000045F7
#elif defined(JAPAN)
_0238CB28: .word 0x000039BC
#else
_0238CB28: .word 0x000045D8
#endif
	arm_func_end ov19_0238C9F0

	arm_func_start ov19_0238CB2C
ov19_0238CB2C: ; 0x0238CB2C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	ldr r1, _0238CBB8 ; =ov11_02324DB0
	mov r6, r0
	ldr r5, [r1]
	ldr r0, [r5, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r4, r0
	mov r0, #1
	bl sub_02017C50
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, _0238CBB8 ; =ov11_02324DB0
	mov ip, #0x204
	ldr r0, [r0]
	mov r3, #0x1c
	ldr r0, [r0, #0xd4]
	add r1, r5, #0x100
	orr r0, r0, #0x20000
	str r0, [sp, #4]
	ldrb r4, [r4, #1]
	add r2, sp, #4
	add r0, r5, #0x1cc
	add r4, r4, r6
	str r4, [sp, #0x28]
	str ip, [sp, #0x2c]
	strh r3, [r1, #0xc8]
	str r2, [sp]
	ldr r2, _0238CBBC ; =0x000045EC
	mov r1, #0x400
	bl PreprocessStringFromId
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0238CBB8: .word ov11_02324DB0
#if defined(EUROPE)
_0238CBBC: .word 0x0000460B
#elif defined(JAPAN)
_0238CBBC: .word 0x000039D0
#else
_0238CBBC: .word 0x000045EC
#endif
	arm_func_end ov19_0238CB2C

	arm_func_start ov19_0238CBC0
ov19_0238CBC0: ; 0x0238CBC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r4, _0238CCDC ; =ov11_02324DB0
	mov sl, r0
	ldr r4, [r4]
	mov r0, #0
	ldr r8, [sp, #0x80]
	ldr r7, [sp, #0x84]
	ldr r6, [sp, #0x88]
	mov sb, r1
	mov fp, r2
	str r3, [sp, #4]
	mov r5, #1
	str r0, [sp, #8]
_0238CBF8:
	mov r1, #0
	mov r2, r1
	mov r3, r1
	b _0238CC1C
_0238CC08:
	ldrb r0, [r8, r3]
	cmp r5, r0
	moveq r1, #1
	beq _0238CC28
	add r3, r3, #1
_0238CC1C:
	ldr r0, [sp, #4]
	cmp r3, r0
	blt _0238CC08
_0238CC28:
	mov r3, #0
	b _0238CC44
_0238CC30:
	ldrb r0, [r6, r3]
	cmp r5, r0
	moveq r2, #1
	beq _0238CC4C
	add r3, r3, #1
_0238CC44:
	cmp r3, r7
	blt _0238CC30
_0238CC4C:
	cmp r1, r2
	beq _0238CCC4
	add r0, sp, #0xc
	bl InitPreprocessorArgs
	ldr r1, _0238CCE0 ; =ov19_0238E2C0
	mov r0, sl
	bl strcat
	ldr r1, [r4, #0xd4]
	mov r0, sl
	orr r1, r1, #0x20000
	str r1, [sp, #0xc]
	ldr r1, _0238CCE4 ; =ov19_0238E2C4
	str r5, [sp, #0x1c]
	bl strcat
	add r0, sp, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #8]
	ldr r2, _0238CCE8 ; =0x000045E2
	mov r0, sb
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, sl
	mov r1, sb
	bl strcat
	add r0, fp, #0x14
	and r1, r5, #0xff
	bl EnableIqSkill
	add r5, r5, #1
_0238CCC4:
	add r5, r5, #1
	cmp r5, #0x45
	blt _0238CBF8
	ldr r0, [sp, #8]
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238CCDC: .word ov11_02324DB0
_0238CCE0: .word ov19_0238E2C0
_0238CCE4: .word ov19_0238E2C4
#if defined(EUROPE)
_0238CCE8: .word 0x00004601
#elif defined(JAPAN)
_0238CCE8: .word 0x000039C6
#else
_0238CCE8: .word 0x000045E2
#endif
	arm_func_end ov19_0238CBC0

	arm_func_start ov19_0238CCEC
ov19_0238CCEC: ; 0x0238CCEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _0238CEBC ; =ov11_02324DB0
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	ldr r0, [r0, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r6, r0
	mov r0, #0
	mov sb, r0
	str r4, [r5, #0x20]
	mov fp, r0
	b _0238CEB0
_0238CD28:
	mov r1, sb, lsl #1
	ldrsh r7, [r5, r1]
	cmp r7, #0
	beq _0238CE9C
	cmp sb, #5
	addls pc, pc, sb, lsl #2
	b _0238CE74
_0238CD44: ; jump table
	b _0238CD5C ; case 0
	b _0238CD84 ; case 1
	b _0238CDD4 ; case 2
	b _0238CDFC ; case 3
	b _0238CE24 ; case 4
	b _0238CE4C ; case 5
_0238CD5C:
	mov r1, r7
	add r0, r6, #0xa
	ldrsh r8, [r6, #0xa]
	bl sub_02054FB8
	movs sl, r0
	ldrnesh r0, [r6, #0xa]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _0238CE78
_0238CD84:
	ldrsh r8, [r6, #8]
	ldrsh r1, [r6, #4]
	add r0, r5, #0x2c
	mov r2, r8
	bl GetLearnableIqSkills
	str r0, [r5, #0x24]
	mov r1, r7
	add r0, r6, #8
	bl sub_02055054
	movs sl, r0
	ldrnesh r0, [r6, #8]
	ldrsh r1, [r6, #4]
	ldrsh r2, [r6, #8]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	add r0, r5, #0x71
	bl GetLearnableIqSkills
	str r0, [r5, #0x28]
	b _0238CE78
_0238CDD4:
	mov r1, r7
	add r0, r6, #0xc
	ldrb r8, [r6, #0xc]
	bl sub_02054FEC
	movs sl, r0
	ldrneb r0, [r6, #0xc]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _0238CE78
_0238CDFC:
	mov r1, r7
	add r0, r6, #0xd
	ldrb r8, [r6, #0xd]
	bl sub_02054FEC
	movs sl, r0
	ldrneb r0, [r6, #0xd]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _0238CE78
_0238CE24:
	mov r1, r7
	add r0, r6, #0xe
	ldrb r8, [r6, #0xe]
	bl sub_02055020
	movs sl, r0
	ldrneb r0, [r6, #0xe]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _0238CE78
_0238CE4C:
	mov r1, r7
	add r0, r6, #0xf
	ldrb r8, [r6, #0xf]
	bl sub_02055020
	movs sl, r0
	ldrneb r0, [r6, #0xf]
	subne r0, r0, r8
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	b _0238CE78
_0238CE74:
	mov sl, #0
_0238CE78:
	add r0, r5, sb, lsl #1
	strh r7, [r0, #0xc]
	add r0, r5, sb
	strb sl, [r0, #0x18]
	cmp r4, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	b _0238CEAC
_0238CE9C:
	add r1, r5, r1
	strh fp, [r1, #0xc]
	add r1, r5, sb
	strb fp, [r1, #0x18]
_0238CEAC:
	add sb, sb, #1
_0238CEB0:
	cmp sb, #6
	blt _0238CD28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238CEBC: .word ov11_02324DB0
	arm_func_end ov19_0238CCEC

	arm_func_start ov19_0238CEC0
ov19_0238CEC0: ; 0x0238CEC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x70
	ldr r1, _0238D0BC ; =ov11_02324DB0
	mov sl, r0
	ldr sb, [r1]
	ldr r0, [sb, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	str r0, [sp, #0x10]
	ldr r0, _0238D0C0 ; =0x0000068A
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	add r0, r4, #0x500
	str r0, [sp, #0xc]
	mov r7, #0
	bl ov19_0238C640
	add r0, sp, #0x20
	bl InitPreprocessorArgs
	ldr r0, [sb, #0xd4]
	mov r8, r7
	orr r0, r0, #0x20000
	str r0, [sp, #0x20]
	add r0, sl, #0x2c
	str r0, [sp, #0x14]
	add r0, sl, #0x71
	str r0, [sp, #0x18]
	add r0, sb, #0x100
	add fp, sb, #0x1cc
	str r0, [sp, #0x1c]
_0238CF3C:
	add r0, sl, r8, lsl #1
	ldrsh r5, [r0, #0xc]
	add r0, sl, r8
	ldrb r6, [r0, #0x18]
	cmp r5, #0
	beq _0238D0A0
	cmp r7, #0
	bne _0238CF84
	add r0, sp, #0x20
	str r0, [sp]
	ldr r2, [sl, #0x20]
	add r0, fp, #0x400
	mov r7, r2, lsl #1
	ldr r2, _0238D0C4 ; =OVERLAY19_UNKNOWN_STRING_IDS__NA_238E178
	mov r1, #0x100
	ldrh r2, [r2, r7]
	mov r3, #0
	bl PreprocessStringFromId
_0238CF84:
	add r0, fp, #0x400
	bl sub_02020868
	mov r7, r0
	ldr r1, _0238D0C8 ; =OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
	mov r2, r8, lsl #1
	ldrh r1, [r1, r2]
	ldr r0, [sp, #0xc]
	bl GetStringFromFileVeneer
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x58]
	mov r0, r5
	bl abs
	str r0, [sp, #0x44]
	cmp r8, #1
	ldreq r0, [sl, #0x20]
	moveq r1, r0, lsl #1
	ldreq r0, _0238D0CC ; =ov19_0238E196
	ldreqh r2, [r0, r1]
	beq _0238CFF0
	ldr r0, [sl, #0x20]
	cmp r6, #0
	moveq r1, r0, lsl #1
	ldreq r0, _0238D0D0 ; =ov19_0238E19C
	ldreqh r2, [r0, r1]
	movne r1, r0, lsl #1
	ldrne r0, _0238D0D4 ; =ov19_0238E184
	ldrneh r2, [r0, r1]
_0238CFF0:
	add r0, sp, #0x20
	str r0, [sp]
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	cmp r8, #1
	bne _0238D04C
	cmp r5, #0
	ble _0238D04C
	cmp r6, #0
	beq _0238D04C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	ldr r1, [sl, #0x28]
	mov r0, r4
	str r1, [sp, #4]
	ldr r1, [sp, #0x18]
	str r1, [sp, #8]
	ldr r3, [sl, #0x24]
	add r1, r4, #0x400
	bl ov19_0238CBC0
_0238D04C:
	add r0, sp, #0x20
	bl InitPreprocessorArgs
	mov r0, #4
	str r0, [sp, #0x44]
	mov r0, #0xa
	strb r0, [r7], #1
	ldr r0, [sp, #0x1c]
	mov r1, #0x1c
	strh r1, [r0, #0xca]
	add r0, sp, #0x20
	str r0, [sp]
	mov r0, r7
	mov r1, #0x400
	mov r2, r4
	mov r3, #0x1c
	bl PreprocessString
	cmp r5, #0
	movgt r0, #1
	strgt r0, [sb, #0x1c4]
	movle r0, #2
	strle r0, [sb, #0x1c4]
_0238D0A0:
	add r8, r8, #1
	cmp r8, #6
	blt _0238CF3C
	mov r0, r4
	bl MemFree
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238D0BC: .word ov11_02324DB0
_0238D0C0: .word 0x0000068A
_0238D0C4: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E178
_0238D0C8: .word OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
_0238D0CC: .word ov19_0238E196
_0238D0D0: .word ov19_0238E19C
_0238D0D4: .word ov19_0238E184
	arm_func_end ov19_0238CEC0

	arm_func_start ov19_0238D0D8
ov19_0238D0D8: ; 0x0238D0D8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xc0
	ldr r0, _0238D308 ; =ov11_02324DB0
	ldr r4, [r0]
	bl ov19_0238C640
	ldr r0, [r4, #0xfc]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238D300
_0238D0FC: ; jump table
	b _0238D118 ; case 0
	b _0238D120 ; case 1
	b _0238D118 ; case 2
	b _0238D274 ; case 3
	b _0238D290 ; case 4
	b _0238D2AC ; case 5
	b _0238D1D0 ; case 6
_0238D118:
	bl ov19_0238D310
	b _0238D300
_0238D120:
	ldr r0, _0238D308 ; =ov11_02324DB0
	ldr r0, [r0]
	ldrsh r0, [r0, #0xd0]
	bl GetBarItem
	mov ip, #0
	mov r5, ip
	add r3, sp, #8
_0238D13C:
	mov r1, ip, lsl #1
	strh r5, [r3, r1]
	add r2, r3, ip, lsl #1
	add r1, r3, ip
	strh r5, [r2, #0xc]
	add ip, ip, #1
	strb r5, [r1, #0x18]
	cmp ip, #6
	blt _0238D13C
	ldrsh r2, [r0, #2]
	mov r1, #1
	strh r2, [sp, #8]
	ldrsh r2, [r0, #4]
	strh r2, [sp, #0xa]
	ldrsh r2, [r0, #6]
	strh r2, [sp, #0xc]
	ldrsh r2, [r0, #8]
	strh r2, [sp, #0xe]
	ldrsh r2, [r0, #0xa]
	strh r2, [sp, #0x10]
	ldrsh r2, [r0, #0xc]
	mov r0, r3
	strh r2, [sp, #0x12]
	bl ov19_0238CCEC
	cmp r0, #0
	bne _0238D1AC
	bl ov19_0238D310
	b _0238D300
_0238D1AC:
	add r0, sp, #8
	bl ov19_0238CEC0
	mov r0, #0x27
	str r0, [r4, #4]
	mov r0, #0x40
	str r0, [r4, #8]
	mov r0, #0xc
	str r0, [r4]
	b _0238D300
_0238D1D0:
	mov r5, #0
	mov r3, r5
	add r2, sp, #8
_0238D1DC:
	mov r0, r5, lsl #1
	strh r3, [r2, r0]
	add r1, r2, r5, lsl #1
	add r0, r2, r5
	strh r3, [r1, #0xc]
	add r5, r5, #1
	strb r3, [r0, #0x18]
	cmp r5, #6
	blt _0238D1DC
	add r0, sp, #0
	add r1, sp, #4
	bl ov19_0238A180
	mov r0, #6
	bl RandInt
	ldr r1, [sp, #4]
	mov r5, r0
	ldr r0, [sp]
	add r1, r1, #1
	bl RandRange
	add r1, sp, #8
	mov r2, r5, lsl #1
	strh r0, [r1, r2]
	mov r0, r1
	mov r1, #2
	bl ov19_0238CCEC
	cmp r0, #0
	bne _0238D250
	bl ov19_0238D310
	b _0238D300
_0238D250:
	add r0, sp, #8
	bl ov19_0238CEC0
	mov r0, #0x27
	str r0, [r4, #4]
	mov r0, #0x40
	str r0, [r4, #8]
	mov r0, #0xc
	str r0, [r4]
	b _0238D300
_0238D274:
	bl sub_02046D20
	add r0, r4, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x2a
	str r0, [r4, #4]
	b _0238D300
_0238D290:
	bl sub_02046D20
	add r0, r4, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x2f
	str r0, [r4, #4]
	b _0238D300
_0238D2AC:
	mov r0, #0
	bl ov19_0238A3D4
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	bl ov19_0238A3EC
	bl RandInt
	ldrb r1, [r5, r0]
	mov r0, r5
	strb r1, [r4, #0x102]
	bl MemFree
	ldrb r0, [r4, #0x102]
	bl DungeonSwapIdToIdx
	mov r1, #3
	bl sub_0204D018
	mov r0, #0x1c
	ldr r1, _0238D30C ; =0x000045E0
	mov r2, #0
	bl sub_02046BE8
	mov r0, #0x3a
	str r0, [r4, #4]
_0238D300:
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238D308: .word ov11_02324DB0
#if defined(EUROPE)
_0238D30C: .word 0x000045FF
#elif defined(JAPAN)
_0238D30C: .word 0x000039C4
#else
_0238D30C: .word 0x000045E0
#endif
	arm_func_end ov19_0238D0D8

	arm_func_start ov19_0238D310
ov19_0238D310: ; 0x0238D310
	stmdb sp!, {r4, lr}
	ldr r0, _0238D384 ; =ov11_02324DB0
	ldr r4, [r0]
	bl ov19_0238D47C
	bl sub_02046D20
	add r0, r4, #0x100
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x3d
	str r0, [r4, #4]
	mov r0, #3
	str r0, [r4, #8]
	ldr r0, [r4, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	beq _0238D378
	ldr r0, [r4, #0xd4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055410
	cmp r0, #0
	movne r0, #9
	moveq r0, #0xa
	b _0238D37C
_0238D378:
	mov r0, #8
_0238D37C:
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D384: .word ov11_02324DB0
	arm_func_end ov19_0238D310

	arm_func_start ov19_0238D388
ov19_0238D388: ; 0x0238D388
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xa
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov19_0238D388

	arm_func_start ov19_0238D3A0
ov19_0238D3A0: ; 0x0238D3A0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xf4
	mov r7, r0
	mov r6, r1
	add r0, sp, #0x5c
	mov r1, #0x98
	mov r5, r2
	mov r4, r3
	bl MemZero
	add r0, sp, #0xf8
	ldrsb r0, [r0, #0x10]
	cmp r0, #0
	addge r0, r5, r0, lsl #3
	ldrge r1, [r0, #4]
	add r0, sp, #0xc
	movlt r1, #0
	str r1, [sp, #0x5c]
	bl InitPreprocessorArgs
	ldr r0, [sp, #0x10c]
	add ip, sp, #0xc
	str r0, [sp, #0x58]
	str r5, [sp]
	add r3, sp, #0x5c
	mov r0, r7
	mov r1, r6
	mov r2, #0x33
	stmib sp, {r4, ip}
	bl sub_02046A20
	add sp, sp, #0xf4
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov19_0238D3A0

	arm_func_start ov19_0238D418
ov19_0238D418: ; 0x0238D418
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r2, #0
	cmp r0, r2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #0xa
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #2
	cmp r0, r1
	moveq r0, #0xa
	ldmia sp!, {r3, pc}
	arm_func_end ov19_0238D418

	arm_func_start ov19_0238D450
ov19_0238D450: ; 0x0238D450
	stmdb sp!, {r3, lr}
	ldr r0, _0238D478 ; =ov11_02324DB0
	mvn r1, #1
	ldr r2, [r0]
	ldrsb r0, [r2, #0xc]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	add r1, r2, #0x10
	bl ShowPortraitInPortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D478: .word ov11_02324DB0
	arm_func_end ov19_0238D450

	arm_func_start ov19_0238D47C
ov19_0238D47C: ; 0x0238D47C
	stmdb sp!, {r3, lr}
	ldr r0, _0238D4A0 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl HidePortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D4A0: .word ov11_02324DB0
	arm_func_end ov19_0238D47C

	arm_func_start ov19_0238D4A4
ov19_0238D4A4: ; 0x0238D4A4
	stmdb sp!, {r4, lr}
	ldr ip, _0238D4E0 ; =ov11_02324DB0
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add r2, r2, r1
	strb lr, [r2, #0x23]
	ldr ip, [ip]
	mov r2, #1
	add r1, ip, r1, lsl #1
	ldrsh r1, [r1, #0x68]
	mov r4, r0
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D4E0: .word ov11_02324DB0
	arm_func_end ov19_0238D4A4

	arm_func_start ov19_0238D4E4
ov19_0238D4E4: ; 0x0238D4E4
	stmdb sp!, {r3, lr}
	ldr r0, _0238D518 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x20]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseInventoryMenu
	ldr r0, _0238D518 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x20]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D518: .word ov11_02324DB0
	arm_func_end ov19_0238D4E4

	arm_func_start ov19_0238D51C
ov19_0238D51C: ; 0x0238D51C
	stmdb sp!, {r3, lr}
	ldr r1, _0238D568 ; =ov11_02324DB0
	mvn r0, #1
	ldr r2, [r1]
	ldrsb r1, [r2, #0x20]
	cmp r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r2, #0xd4]
	bl sub_0203FD80
	bl sub_020407C0
	ldr r0, _0238D568 ; =ov11_02324DB0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x20]
	bl CloseAdvancedTextBox
	ldr r0, _0238D568 ; =ov11_02324DB0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x20]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D568: .word ov11_02324DB0
	arm_func_end ov19_0238D51C

	arm_func_start ov19_0238D56C
ov19_0238D56C: ; 0x0238D56C
	stmdb sp!, {r4, lr}
	ldr r0, _0238D5F0 ; =0x00000A68
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	ldr r1, _0238D5F4 ; =ov11_02324DB0
	add r0, r4, #0x9d0
	str r4, [r1]
	bl sub_02034A38
	str r0, [r4, #0x9cc]
	mvn r2, #1
	strb r2, [r4, #0xc]
	strb r2, [r4, #0x20]
	strb r2, [r4, #0x21]
	ldr r1, _0238D5F8 ; =0x00000163
	add r0, r4, #0x10
	strb r2, [r4, #0x22]
	bl InitPortraitParamsWithMonsterId
	add r0, r4, #0x10
	mov r1, #0
	bl SetPortraitLayout
	add r0, r4, #0x10
	mov r1, #0
	bl SetPortraitEmotion
	add r0, r4, #0x5c
	bl sub_020580C4
	mov r0, #0
	str r0, [r4]
	sub r0, r0, #1
	str r0, [r4, #4]
	str r0, [r4, #8]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D5F0: .word 0x00000A68
_0238D5F4: .word ov11_02324DB0
_0238D5F8: .word 0x00000163
	arm_func_end ov19_0238D56C

	arm_func_start ov19_0238D5FC
ov19_0238D5FC: ; 0x0238D5FC
	stmdb sp!, {r4, lr}
	ldr r1, _0238D684 ; =ov11_02324DB0
	mov r0, #0
	ldr r4, [r1]
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	strb r0, [r4, #0xc]
	mvn r2, #1
	strb r2, [r4, #0x20]
	strb r2, [r4, #0x21]
	ldr r1, _0238D688 ; =0x00000163
	add r0, r4, #0x10
	strb r2, [r4, #0x22]
	bl InitPortraitParamsWithMonsterId
	add r0, r4, #0x10
	mov r1, #0
	bl SetPortraitLayout
	add r0, r4, #0x10
	mov r1, #0
	bl SetPortraitEmotion
	add r0, r4, #0x5c
	bl sub_020580C4
	ldr r0, [r4]
	cmp r0, #0
	bne _0238D67C
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	str r0, [r4, #8]
_0238D67C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D684: .word ov11_02324DB0
_0238D688: .word 0x00000163
	arm_func_end ov19_0238D5FC

	arm_func_start ov19_0238D68C
ov19_0238D68C: ; 0x0238D68C
	ldr ip, _0238D694 ; =ov19_0238A468
	bx ip
	.align 2, 0
_0238D694: .word ov19_0238A468
	arm_func_end ov19_0238D68C
	; 0x0238D698

	arm_func_start ov19_0238D698
ov19_0238D698: ; 0x0238D698
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0238DACC ; =ov11_02324DB0
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, #0x15
	addls pc, pc, r0, lsl #2
	b _0238DAC4
_0238D6B4: ; jump table
	b _0238D70C ; case 0
	b _0238D718 ; case 1
	b _0238D72C ; case 2
	b _0238D738 ; case 3
	b _0238D780 ; case 4
	b _0238D7A4 ; case 5
	b _0238D7A4 ; case 6
	b _0238D7A4 ; case 7
	b _0238D7A4 ; case 8
	b _0238D7A4 ; case 9
	b _0238D7A4 ; case 10
	b _0238D7A4 ; case 11
	b _0238D958 ; case 12
	b _0238DA60 ; case 13
	b _0238DA74 ; case 14
	b _0238DAB4 ; case 15
	b _0238D7A4 ; case 16
	b _0238D7A4 ; case 17
	b _0238D7A4 ; case 18
	b _0238D7A4 ; case 19
	b _0238D7A4 ; case 20
	b _0238D7A4 ; case 21
_0238D70C:
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_0238D718:
	bl ov19_0238A4A4
	cmp r0, #3
	moveq r0, #2
	streq r0, [r4]
	b _0238DAC4
_0238D72C:
	mov r0, #3
	str r0, [r4]
	b _0238DAC4
_0238D738:
	ldr r0, [r4, #0x9cc]
	tst r0, #0x100
	beq _0238D758
	ldr r0, [r4, #0xa58]
	ldr r2, [r4, #0xa54]
	mov r1, #0
	blx r2
	b _0238D75C
_0238D758:
	bl ov11_022E6E68
_0238D75C:
	bl ov19_0238A468
	ldr r0, _0238DACC ; =ov11_02324DB0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238DACC ; =ov11_02324DB0
	mov r1, #0
	str r1, [r0]
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_0238D780:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238D798
	bl ov11_0230CC70
	cmp r0, #0
	beq _0238DAC4
_0238D798:
	mov r0, #1
	str r0, [r4]
	b _0238DAC4
_0238D7A4:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238D7BC
	bl ov11_0230CC70
	cmp r0, #0
	beq _0238DAC4
_0238D7BC:
	ldr r0, [r4]
	mvn r5, #0
	sub r0, r0, #5
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _0238D938
_0238D7D4: ; jump table
	b _0238D838 ; case 0
	b _0238D840 ; case 1
	b _0238D828 ; case 2
	b _0238D830 ; case 3
	b _0238D848 ; case 4
	b _0238D850 ; case 5
	b _0238D818 ; case 6
	b _0238D938 ; case 7
	b _0238D938 ; case 8
	b _0238D938 ; case 9
	b _0238D938 ; case 10
	b _0238D858 ; case 11
	b _0238D860 ; case 12
	b _0238D868 ; case 13
	b _0238D870 ; case 14
	b _0238D820 ; case 15
	b _0238D878 ; case 16
_0238D818:
	mov r5, #2
	b _0238D938
_0238D820:
	mov r5, #5
	b _0238D938
_0238D828:
	mov r5, #0xa
	b _0238D938
_0238D830:
	mov r5, #0xe
	b _0238D938
_0238D838:
	mov r5, #0xf
	b _0238D938
_0238D840:
	mov r5, #0x10
	b _0238D938
_0238D848:
	mov r5, #0x11
	b _0238D938
_0238D850:
	mov r5, #0x12
	b _0238D938
_0238D858:
	mov r5, #0x28
	b _0238D938
_0238D860:
	mov r5, #0x29
	b _0238D938
_0238D868:
	mov r5, #0x2d
	b _0238D938
_0238D870:
	mov r5, #0x2e
	b _0238D938
_0238D878:
	ldrb r0, [r4, #0x102]
	sub r0, r0, #0x57
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _0238D938
_0238D88C: ; jump table
	b _0238D8D4 ; case 0
	b _0238D8DC ; case 1
	b _0238D8E4 ; case 2
	b _0238D8EC ; case 3
	b _0238D8F4 ; case 4
	b _0238D8FC ; case 5
	b _0238D904 ; case 6
	b _0238D90C ; case 7
	b _0238D914 ; case 8
	b _0238D91C ; case 9
	b _0238D924 ; case 10
	b _0238D92C ; case 11
	b _0238D938 ; case 12
	b _0238D938 ; case 13
	b _0238D938 ; case 14
	b _0238D938 ; case 15
	b _0238D938 ; case 16
	b _0238D934 ; case 17
_0238D8D4:
	mov r5, #0x14
	b _0238D938
_0238D8DC:
	mov r5, #0x15
	b _0238D938
_0238D8E4:
	mov r5, #0x16
	b _0238D938
_0238D8EC:
	mov r5, #0x17
	b _0238D938
_0238D8F4:
	mov r5, #0x18
	b _0238D938
_0238D8FC:
	mov r5, #0x19
	b _0238D938
_0238D904:
	mov r5, #0x1a
	b _0238D938
_0238D90C:
	mov r5, #0x1b
	b _0238D938
_0238D914:
	mov r5, #0x1c
	b _0238D938
_0238D91C:
	mov r5, #0x1d
	b _0238D938
_0238D924:
	mov r5, #0x1e
	b _0238D938
_0238D92C:
	mov r5, #0x1f
	b _0238D938
_0238D934:
	mov r5, #0x20
_0238D938:
	ldr r0, _0238DAD0 ; =ov19_0238E2D0
	mov r1, r5
	bl Debug_Print0
	mov r0, r5
	bl ov11_022E6E8C
	mov r0, #4
	str r0, [r4]
	b _0238DAC4
_0238D958:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238D970
	bl ov11_0230CC70
	cmp r0, #0
	beq _0238DAC4
_0238D970:
	bl ov19_0238C6C4
	cmp r0, #0
	beq _0238DA38
	ldr r2, [r4, #0x1c4]
	cmp r2, #0xc
	addls pc, pc, r2, lsl #2
	b _0238DA20
_0238D98C: ; jump table
	b _0238DA20 ; case 0
	b _0238D9C0 ; case 1
	b _0238D9C8 ; case 2
	b _0238D9D0 ; case 3
	b _0238D9D8 ; case 4
	b _0238D9E0 ; case 5
	b _0238D9E8 ; case 6
	b _0238D9F0 ; case 7
	b _0238D9F8 ; case 8
	b _0238DA00 ; case 9
	b _0238DA08 ; case 10
	b _0238DA10 ; case 11
	b _0238DA18 ; case 12
_0238D9C0:
	mov r5, #0x32
	b _0238DA24
_0238D9C8:
	mov r5, #0x33
	b _0238DA24
_0238D9D0:
	mov r5, #0x3c
	b _0238DA24
_0238D9D8:
	mov r5, #0x3d
	b _0238DA24
_0238D9E0:
	mov r5, #0x3e
	b _0238DA24
_0238D9E8:
	mov r5, #0x3f
	b _0238DA24
_0238D9F0:
	mov r5, #0x40
	b _0238DA24
_0238D9F8:
	mov r5, #0x41
	b _0238DA24
_0238DA00:
	mov r5, #0x42
	b _0238DA24
_0238DA08:
	mov r5, #0x43
	b _0238DA24
_0238DA10:
	mov r5, #0x44
	b _0238DA24
_0238DA18:
	mov r5, #0x45
	b _0238DA24
_0238DA20:
	mov r5, #0x13
_0238DA24:
	ldr r0, _0238DAD4 ; =ov19_0238E2E8
	mov r1, r5
	bl Debug_Print0
	mov r0, r5
	bl ov11_022E6E8C
_0238DA38:
	bl ov19_0238C670
	cmp r0, #0
	moveq r0, #0xe
	streq r0, [r4]
	beq _0238DAC4
	ldr r0, _0238DAD8 ; =ov19_0238E304
	bl Debug_Print0
	mov r0, #0xd
	str r0, [r4]
	b _0238DAC4
_0238DA60:
	bl ov19_0238D388
	cmp r0, #0xa
	moveq r0, #0xe
	streq r0, [r4]
	b _0238DAC4
_0238DA74:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238DA8C
	bl ov11_0230CC70
	cmp r0, #0
	beq _0238DAC4
_0238DA8C:
	bl ov19_0238C7B0
	cmp r0, #0
	moveq r0, #1
	streq r0, [r4]
	beq _0238DAC4
	ldr r0, _0238DADC ; =ov19_0238E324
	bl Debug_Print0
	mov r0, #0xf
	str r0, [r4]
	b _0238DAC4
_0238DAB4:
	bl ov19_0238D388
	cmp r0, #0xa
	moveq r0, #1
	streq r0, [r4]
_0238DAC4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238DACC: .word ov11_02324DB0
_0238DAD0: .word ov19_0238E2D0
_0238DAD4: .word ov19_0238E2E8
_0238DAD8: .word ov19_0238E304
_0238DADC: .word ov19_0238E324
	arm_func_end ov19_0238D698
	; 0x0238DAE0

	.rodata
	.global OVERLAY19_UNKNOWN_TABLE__NA_238DAE0
OVERLAY19_UNKNOWN_TABLE__NA_238DAE0:
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.global BAR_UNLOCKABLE_DUNGEONS_TABLE
BAR_UNLOCKABLE_DUNGEONS_TABLE:
	.byte 0x57, 0x02, 0x59, 0x02
	.byte 0x5E, 0x06, 0x61, 0x06, 0x5F, 0x06, 0x68, 0x06
	.global BAR_RECRUITABLE_MONSTER_TABLE
BAR_RECRUITABLE_MONSTER_TABLE:
	.byte 0x0A, 0x00, 0x0D, 0x00, 0x1B, 0x00, 0x29, 0x00
	.byte 0x2B, 0x00, 0x2E, 0x00, 0x36, 0x00, 0x3C, 0x00, 0x42, 0x00, 0x48, 0x00, 0x4A, 0x00, 0x51, 0x00
	.byte 0x53, 0x00, 0x54, 0x00, 0x56, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5C, 0x00, 0x5F, 0x00, 0x60, 0x00
	.byte 0x62, 0x00, 0x68, 0x00, 0x6D, 0x00, 0x6F, 0x00, 0x72, 0x00, 0x78, 0x00, 0x7F, 0x00, 0x80, 0x00
	.byte 0x84, 0x00, 0x89, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x8E, 0x00, 0x93, 0x00, 0xA3, 0x00, 0xA7, 0x00
	.byte 0xAC, 0x00, 0xB1, 0x00, 0xB3, 0x00, 0xBB, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC8, 0x00, 0xE6, 0x00
	.byte 0xE7, 0x00, 0xE9, 0x00, 0xEC, 0x00, 0xF0, 0x00, 0xF5, 0x00, 0xF7, 0x00, 0xF9, 0x00, 0xFE, 0x00
	.byte 0xFF, 0x00, 0x02, 0x01, 0x05, 0x01, 0x06, 0x01, 0x0A, 0x01, 0x0B, 0x01, 0x11, 0x01, 0x23, 0x01
	.byte 0x2A, 0x01, 0x32, 0x01, 0x34, 0x01, 0x37, 0x01, 0x39, 0x01, 0x3E, 0x01, 0x4B, 0x01, 0x4C, 0x01
	.byte 0x51, 0x01, 0x53, 0x01, 0x54, 0x01, 0x55, 0x01, 0x56, 0x01, 0x5E, 0x01, 0x64, 0x01, 0x67, 0x01
	.byte 0x6C, 0x01, 0x6D, 0x01, 0x6E, 0x01, 0x6F, 0x01, 0x73, 0x01, 0x75, 0x01, 0x77, 0x01, 0x85, 0x01
	.byte 0x87, 0x01, 0x8B, 0x01, 0x93, 0x01, 0x96, 0x01, 0xAF, 0x01, 0xB4, 0x01, 0xB9, 0x01, 0xBB, 0x01
	.byte 0xBD, 0x01, 0xBF, 0x01, 0xC6, 0x01, 0xC8, 0x01, 0xCB, 0x01, 0xCE, 0x01, 0xCF, 0x01, 0xD3, 0x01
	.byte 0xD5, 0x01, 0xD9, 0x01, 0xDB, 0x01, 0xDE, 0x01, 0xE0, 0x01, 0xEB, 0x01, 0xED, 0x01, 0xF1, 0x01
	.global BAR_AVAILABLE_ITEMS
BAR_AVAILABLE_ITEMS:
	.byte 0x45, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00
	.byte 0x19, 0x00, 0x04, 0x00, 0x00, 0x00, 0x46, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x19, 0x00, 0x04, 0x00, 0x00, 0x00, 0x47, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4A, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x28, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x4D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x1E, 0x00
	.byte 0x32, 0x00, 0x54, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00, 0x50, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x51, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x52, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x53, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x55, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x56, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00, 0x57, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x00, 0x00, 0x58, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x59, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00
	.byte 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x60, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x04, 0x00, 0x00, 0x00, 0x63, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x64, 0x00, 0x04, 0x00, 0x00, 0x00, 0x68, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x14, 0x00
	.byte 0x32, 0x00, 0x69, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x64, 0x00, 0x14, 0x00, 0x32, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x14, 0x00, 0x32, 0x00, 0x6B, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00
	.byte 0x14, 0x00, 0x32, 0x00, 0x6C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x05, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x6E, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00
	.byte 0x05, 0x00, 0x04, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x14, 0x00, 0x14, 0x00, 0x1E, 0x00, 0x70, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x05, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x73, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x05, 0x00, 0x14, 0x00, 0x00, 0x00, 0x74, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x14, 0x00, 0x32, 0x00, 0x75, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00
	.byte 0x14, 0x00, 0x32, 0x00, 0x76, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x14, 0x00, 0x32, 0x00, 0x77, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00
	.byte 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00
	.byte 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x7D, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00
	.byte 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00
	.byte 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x85, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x28, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x88, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00
	.byte 0x28, 0x00, 0x14, 0x00, 0x00, 0x00, 0x89, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x14, 0x00, 0x32, 0x00
	.global OVERLAY19_UNKNOWN_STRING_IDS__NA_238E178
OVERLAY19_UNKNOWN_STRING_IDS__NA_238E178:
#if defined(EUROPE)
#define OVERLAY19_STRING_IDS_OFFSET 0x1F
#elif defined(JAPAN)
#define OVERLAY19_STRING_IDS_OFFSET -0xC1C
#else
#define OVERLAY19_STRING_IDS_OFFSET 0
#endif
	.hword 0x45CA + OVERLAY19_STRING_IDS_OFFSET, 0x45C6 + OVERLAY19_STRING_IDS_OFFSET
	.hword 0x45C2 + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E17E
ov19_0238E17E:
	.hword 0x45B6 + OVERLAY19_STRING_IDS_OFFSET, 0x45B7 + OVERLAY19_STRING_IDS_OFFSET, 0x45B8 + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E184
ov19_0238E184:
	.hword 0x45CB + OVERLAY19_STRING_IDS_OFFSET, 0x45C7 + OVERLAY19_STRING_IDS_OFFSET, 0x45C3 + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E18A
ov19_0238E18A:
	.hword 0x45B3 + OVERLAY19_STRING_IDS_OFFSET
	.hword 0x45B4 + OVERLAY19_STRING_IDS_OFFSET, 0x45B5 + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E190
ov19_0238E190:
	.hword 0x45B9 + OVERLAY19_STRING_IDS_OFFSET, 0x45BA + OVERLAY19_STRING_IDS_OFFSET, 0x45BB + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E196
ov19_0238E196:
	.hword 0x45CD + OVERLAY19_STRING_IDS_OFFSET, 0x45C9 + OVERLAY19_STRING_IDS_OFFSET, 0x45C5 + OVERLAY19_STRING_IDS_OFFSET
	.global ov19_0238E19C
ov19_0238E19C:
	.hword 0x45CC + OVERLAY19_STRING_IDS_OFFSET, 0x45C8 + OVERLAY19_STRING_IDS_OFFSET, 0x45C4 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x00, 0x00
	.global OVERLAY19_UNKNOWN_STRUCT__NA_238E1A4
OVERLAY19_UNKNOWN_STRUCT__NA_238E1A4:
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global ov19_0238E1AC
ov19_0238E1AC:
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global ov19_0238E1B4
ov19_0238E1B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov19_0238E1BC
ov19_0238E1BC:
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global ov19_0238E1C4
ov19_0238E1C4:
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC
OVERLAY19_UNKNOWN_STRING_IDS__NA_238E1CC:
	.hword 0x45CE + OVERLAY19_STRING_IDS_OFFSET, 0x45CF + OVERLAY19_STRING_IDS_OFFSET, 0x45D0 + OVERLAY19_STRING_IDS_OFFSET, 0x45D1 + OVERLAY19_STRING_IDS_OFFSET, 0x45D2 + OVERLAY19_STRING_IDS_OFFSET, 0x45D3 + OVERLAY19_STRING_IDS_OFFSET
	.global BAR_WINDOW_PARAMS_1
BAR_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x05, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BAR_WINDOW_PARAMS_2
BAR_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BAR_WINDOW_PARAMS_3
BAR_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x02, 0x0A, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BAR_MENU_ITEMS_CONFIRM_1
BAR_MENU_ITEMS_CONFIRM_1:
	.word 0x459B + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x459C + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global BAR_MENU_ITEMS_CONFIRM_2
BAR_MENU_ITEMS_CONFIRM_2:
	.word 0x45DD + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x45DE + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global OVERLAY19_UNKNOWN_STRING_IDS__NA_238E238
OVERLAY19_UNKNOWN_STRING_IDS__NA_238E238:
	.hword 0x45A0 + OVERLAY19_STRING_IDS_OFFSET, 0x45A2 + OVERLAY19_STRING_IDS_OFFSET
	.hword 0x45A5 + OVERLAY19_STRING_IDS_OFFSET, 0x45A6 + OVERLAY19_STRING_IDS_OFFSET, 0x45A7 + OVERLAY19_STRING_IDS_OFFSET, 0x45A9 + OVERLAY19_STRING_IDS_OFFSET, 0x45AA + OVERLAY19_STRING_IDS_OFFSET, 0x45AB + OVERLAY19_STRING_IDS_OFFSET, 0x45AC + OVERLAY19_STRING_IDS_OFFSET, 0x45AE + OVERLAY19_STRING_IDS_OFFSET
	.hword 0x45AF + OVERLAY19_STRING_IDS_OFFSET, 0x45B0 + OVERLAY19_STRING_IDS_OFFSET
	.global BAR_MAIN_MENU_ITEMS
BAR_MAIN_MENU_ITEMS:
	.word 0x4588 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x4589 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x458A + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global BAR_SUBMENU_ITEMS_1
BAR_SUBMENU_ITEMS_1:
	.word 0x4591 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x4592 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x4593 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global BAR_SUBMENU_ITEMS_2
BAR_SUBMENU_ITEMS_2:
	.word 0x4595 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x4596 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x4597 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x4598 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x4599 + OVERLAY19_STRING_IDS_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global ov19_0238E2C0
ov19_0238E2C0:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov19_0238E2C4
ov19_0238E2C4:
	.byte 0x5B, 0x6D, 0x65, 0x5F, 0x70, 0x6C, 0x61, 0x79
	.byte 0x3A, 0x30, 0x5D, 0x00
	.global ov19_0238E2D0
ov19_0238E2D0:
	.byte 0x64, 0x69, 0x72, 0x69, 0x6E, 0x6B, 0x62, 0x61, 0x72, 0x20, 0x72, 0x65
	.byte 0x71, 0x75, 0x65, 0x73, 0x74, 0x20, 0x25, 0x33, 0x64, 0x0A, 0x00, 0x00
	.global ov19_0238E2E8
ov19_0238E2E8:
	.byte 0x64, 0x69, 0x72, 0x69
	.byte 0x6E, 0x6B, 0x62, 0x61, 0x72, 0x20, 0x72, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20, 0x25, 0x33
	.byte 0x64, 0x5B, 0x25, 0x33, 0x64, 0x5D, 0x0A, 0x00
	.global ov19_0238E304
ov19_0238E304:
	.byte 0x64, 0x69, 0x72, 0x69, 0x6E, 0x6B, 0x62, 0x61
	.byte 0x72, 0x20, 0x6D, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x20, 0x62, 0x65, 0x66, 0x6F, 0x72, 0x65
	.byte 0x20, 0x73, 0x65, 0x74, 0x0A, 0x00, 0x00, 0x00
	.global ov19_0238E324
ov19_0238E324:
	.byte 0x64, 0x69, 0x72, 0x69, 0x6E, 0x6B, 0x62, 0x61
	.byte 0x72, 0x20, 0x6D, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x20, 0x61, 0x66, 0x74, 0x65, 0x72, 0x20
	.byte 0x73, 0x65, 0x74, 0x0A, 0x00, 0x00, 0x00, 0x00

	.data
	.global OVERLAY19_UNKNOWN_POINTER__NA_238E360
OVERLAY19_UNKNOWN_POINTER__NA_238E360:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
