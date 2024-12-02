	.include "asm/macros.inc"
	.include "overlay_29_02300108.inc"

	.text

#ifndef JAPAN
	arm_func_start GetMonsterDisplayNameType
GetMonsterDisplayNameType: ; 0x02300108
	ldr r1, _02300160 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r2, [r1, #0x23e]
	cmp r2, #0
	ldreqb r2, [r1, #0x245]
	cmpeq r2, #0
	bne _0230013C
	ldrb r1, [r1, #0x244]
	cmp r1, #0
	ldreqb r1, [r0, #0xef]
	cmpeq r1, #1
	bne _0230014C
_0230013C:
	ldrb r1, [r0, #6]
	cmp r1, #0
	movne r0, #1
	bxne lr
_0230014C:
	ldrb r0, [r0, #0xd8]
	cmp r0, #2
	moveq r0, #2
	movne r0, #0
	bx lr
	.align 2, 0
_02300160: .word DUNGEON_PTR
	arm_func_end GetMonsterDisplayNameType
#endif

	arm_func_start GetMonsterName
GetMonsterName: ; 0x02300164
#ifdef JAPAN
	stmdb sp!, {r4, lr}
	ldr r2, _02301678 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r2]
	add r0, r0, #0x1a000
	ldrb r2, [r0, #0x19a]
	cmp r2, #0
	ldreqb r2, [r0, #0x1a1]
	cmpeq r2, #0
	bne _02301574
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	ldreqb r0, [r1, #0xef]
	cmpeq r0, #1
	bne _02300190
_02301574:
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _02300190
	ldr r1, _02300274 ; =0x00000C34
	mov r0, r4
	bl CopyStringFromId
	ldmia sp!, {r4, pc}
_02300190:
	ldrb r0, [r1, #0xd8]
#else
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetMonsterDisplayNameType
	cmp r0, #1
	bne _02300190
	ldr r1, _02300274 ; =0x00000C34
	mov r0, r5
	bl CopyStringFromId
	ldmia sp!, {r3, r4, r5, pc}
_02300190:
#endif
	cmp r0, #2
	bne _023001A8
	ldr r1, _02300278 ; =0x00000C32
#ifdef JAPAN
	mov r0, r4
	bl CopyStringFromId
	ldmia sp!, {r4, pc}
_023001A8:
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _0230025C
	ldrb r0, [r1, #0xbc]
#else
	mov r0, r5
	bl CopyStringFromId
	ldmia sp!, {r3, r4, r5, pc}
_023001A8:
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0230025C
	ldrb r0, [r4, #0xbc]
#endif
	cmp r0, #0xb
	bne _023001DC
	mov r0, #0
	bl GetExplorerMazeMonster
	mov r1, r0
#ifdef JAPAN
	mov r0, r4
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r4, pc}
#else
	mov r0, r5
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r3, r4, r5, pc}
#endif
_023001DC:
	cmp r0, #0xc
	bne _02300200
	mov r0, #1
	bl GetExplorerMazeMonster
	mov r1, r0
#ifdef JAPAN
	mov r0, r4
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r4, pc}
#else
	mov r0, r5
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r3, r4, r5, pc}
#endif
_02300200:
	cmp r0, #0xd
	bne _02300224
	mov r0, #2
	bl GetExplorerMazeMonster
	mov r1, r0
#ifdef JAPAN
	mov r0, r4
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r4, pc}
#else
	mov r0, r5
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r3, r4, r5, pc}
#endif
_02300224:
	cmp r0, #0xe
	bne _02300248
	mov r0, #3
	bl GetExplorerMazeMonster
	mov r1, r0
#ifdef JAPAN
	mov r0, r4
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r4, pc}
_02300248:
	ldrsh r1, [r1, #4]
	mov r0, r4
	mov r2, #0x4e
	bl GetNameWithGender
	ldmia sp!, {r4, pc}
_0230025C:
	ldrsh r0, [r1, #0xc]
	bl GetActiveTeamMember
	mov r1, r0
	mov r0, r4
	bl sub_020585B4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02301678: .word DUNGEON_PTR
_02300274: .word 0x00000973
_02300278: .word 0x00000971
#else
	mov r0, r5
	mov r2, #0x4e
	bl sub_02056084
	ldmia sp!, {r3, r4, r5, pc}
_02300248:
	ldrsh r1, [r4, #4]
	mov r0, r5
	mov r2, #0x4e
	bl GetNameWithGender
	ldmia sp!, {r3, r4, r5, pc}
_0230025C:
	ldrsh r0, [r4, #0xc]
	bl GetActiveTeamMember
	mov r1, r0
	mov r0, r5
	bl sub_020585B4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02300274: .word 0x00000C34
_02300278: .word 0x00000C32
#endif
	arm_func_end GetMonsterName

	arm_func_start ov29_0230027C
ov29_0230027C: ; 0x0230027C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x100
	ldrb r2, [r1, #0xd8]
	mov r4, r0
	cmp r2, #2
	bne _023002B4
	ldr r1, _023002C0 ; =0x00000C32
	add r0, sp, #0
	bl CopyStringFromId
	ldr r1, _023002C4 ; =ov29_023527C0
	add r2, sp, #0
	mov r0, r4
	bl SprintfStatic
	b _023002B8
_023002B4:
	bl GetMonsterName
_023002B8:
	add sp, sp, #0x100
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_023002C0: .word 0x00000971
#else
_023002C0: .word 0x00000C32
#endif
_023002C4: .word ov29_023527C0
	arm_func_end ov29_0230027C

	arm_func_start SprintfStatic
SprintfStatic: ; 0x023002C8
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
	arm_func_end SprintfStatic

	arm_func_start ov29_023002F0
ov29_023002F0: ; 0x023002F0
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r3, [r1, #0xd8]
	mov r5, r0
	mov r4, r2
	cmp r3, #2
	bne _02300328
	ldr r0, _02300350 ; =0x00000C33
	bl StringFromId
	mov r3, r0
	ldr r1, _02300354 ; =ov29_023527D0
	mov r0, r5
	mov r2, r4
	bl SprintfStatic
	ldmia sp!, {r3, r4, r5, pc}
_02300328:
	ldrb r3, [r1, #6]
	cmp r3, #0
	beq _02300344
	ldrsh r1, [r1, #4]
	mov r2, #0x4e
	bl GetName
	ldmia sp!, {r3, r4, r5, pc}
_02300344:
	ldrsh r1, [r1, #0xc]
	bl sub_02058534
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02300350: .word 0x00000972
#else
_02300350: .word 0x00000C33
#endif
_02300354: .word ov29_023527D0
	arm_func_end ov29_023002F0

	arm_func_start ov29_02300358
ov29_02300358: ; 0x02300358
	stmdb sp!, {r4, lr}
	ldr r2, _02300400 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r2]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r2, [r0, #0x19a]
	cmp r2, #0
	ldreqb r0, [r0, #0x1a1]
#else
	ldrb r2, [r0, #0x23e]
	cmp r2, #0
	ldreqb r0, [r0, #0x245]
#endif
	cmpeq r0, #0
	bne _0230038C
	ldrb r0, [r1, #0xef]
	cmp r0, #1
	bne _023003B0
_0230038C:
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _023003B0
	ldr r0, _02300404 ; =0x00000C35
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	ldmia sp!, {r4, pc}
_023003B0:
	ldrb r0, [r1, #0xd8]
	cmp r0, #2
	bne _023003D4
	ldr r0, _02300408 ; =0x00000C33
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	ldmia sp!, {r4, pc}
_023003D4:
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _023003F0
	ldrsh r1, [r1, #4]
	mov r0, r4
	bl GetNameRaw
	ldmia sp!, {r4, pc}
_023003F0:
	ldrsh r1, [r1, #0xc]
	mov r0, r4
	bl sub_0205858C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02300400: .word DUNGEON_PTR
#ifdef JAPAN
_02300404: .word 0x00000974
_02300408: .word 0x00000972
#else
_02300404: .word 0x00000C35
_02300408: .word 0x00000C33
#endif
	arm_func_end ov29_02300358

	arm_func_start ov29_0230040C
ov29_0230040C: ; 0x0230040C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl sub_02024FB8
	ldrsh r1, [sp, #0x18]
	mov r4, r0
	cmp r1, #0
	beq _02300448
	cmp r1, #1
	beq _02300454
	cmp r1, #2
	beq _02300488
	b _02300490
_02300448:
	mov r1, r5
	bl GetMonsterName
	b _02300490
_02300454:
#ifdef JAPAN
	ldrsh r1, [r5, #4]
#else
	mov r0, r5
	bl GetMonsterDisplayNameType
	cmp r0, #0
	bne _02300478
	ldrsh r1, [r5, #4]
	mov r0, r4
#endif
	mov r2, #0x6a
	bl GetNameWithGender
	b _02300490
#ifndef JAPAN
_02300478:
	mov r0, r4
	mov r1, r5
	bl GetMonsterName
	b _02300490
#endif
_02300488:
	mov r1, r5
	bl ov29_02300358
_02300490:
	cmp r7, #0
	addne r0, r7, r6, lsl #2
	strne r4, [r0, #0x38]
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r4
	bl ov29_0234B0B4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0230040C

	arm_func_start IsMonsterDrowsy
IsMonsterDrowsy: ; 0x023004B0
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbd]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #3
	moveq r0, #1
	bxeq lr
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterDrowsy

	arm_func_start MonsterHasNonvolatileNonsleepStatus
MonsterHasNonvolatileNonsleepStatus: ; 0x023004E4
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbf]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasNonvolatileNonsleepStatus

	arm_func_start MonsterHasImmobilizingStatus
MonsterHasImmobilizingStatus: ; 0x02300500
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xc4]
	cmp r0, #3
	cmpne r0, #5
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end MonsterHasImmobilizingStatus

	arm_func_start MonsterHasAttackInterferingStatus
MonsterHasAttackInterferingStatus: ; 0x02300520
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xd0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasAttackInterferingStatus

	arm_func_start MonsterHasSkillInterferingStatus
MonsterHasSkillInterferingStatus: ; 0x0230053C
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #2
	moveq r0, #1
	bxeq lr
	cmp r0, #4
	moveq r0, #1
	bxeq lr
	cmp r0, #5
	moveq r0, #1
	bxeq lr
	cmp r0, #6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasSkillInterferingStatus

	arm_func_start MonsterHasLeechSeedStatus
MonsterHasLeechSeedStatus: ; 0x02300588
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xe0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasLeechSeedStatus

	arm_func_start MonsterHasWhifferStatus
MonsterHasWhifferStatus: ; 0x023005A4
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xec]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasWhifferStatus

	arm_func_start IsMonsterVisuallyImpaired
IsMonsterVisuallyImpaired: ; 0x023005C0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsMonsterVisuallyImpaired

	arm_func_start IsMonsterMuzzled
IsMonsterMuzzled: ; 0x023005FC
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterMuzzled

	arm_func_start MonsterHasMiracleEyeStatus
MonsterHasMiracleEyeStatus: ; 0x02300618
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasMiracleEyeStatus

	arm_func_start MonsterHasNegativeStatus
MonsterHasNegativeStatus: ; 0x02300634
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	bl IsMonsterDrowsy
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasNonvolatileNonsleepStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasImmobilizingStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasAttackInterferingStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasSkillInterferingStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasLeechSeedStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasWhifferStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	bl IsMonsterVisuallyImpaired
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl IsMonsterMuzzled
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl MonsterHasMiracleEyeStatus
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [r4, #0xfe]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
#ifdef JAPAN
	ldrb r0, [r4, #0x105]
#else
	ldrb r0, [r4, #0x106]
#endif
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov ip, #0
#ifdef JAPAN
	add r3, r4, #0x120
#else
	add r3, r4, #0x124
#endif
	mov r1, ip
	mov r2, #1
	b _02300770
_02300740:
	ldrb r0, [r3, ip, lsl #3]
	add lr, r3, ip, lsl #3
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _0230076C
	ldrh r0, [lr, #2]
	tst r0, #1
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_0230076C:
	add ip, ip, #1
_02300770:
	cmp ip, #4
	blt _02300740
	mov r1, #0
	b _02300798
_02300780:
	add r0, r4, r1
#ifdef JAPAN
	ldrb r0, [r0, #0x115]
#else
	ldrb r0, [r0, #0x119]
#endif
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	add r1, r1, #1
_02300798:
	cmp r1, #5
	blt _02300780
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MonsterHasNegativeStatus

	arm_func_start IsMonsterSleeping
IsMonsterSleeping: ; 0x023007A8
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbd]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #5
	moveq r0, #1
	bxeq lr
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterSleeping

	arm_func_start ov29_023007DC
ov29_023007DC: ; 0x023007DC
	ldr r3, [r0, #0xb4]
	ldr r0, _02300814 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r3, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	bx lr
	.align 2, 0
_02300814: .word 0x000003E7
	arm_func_end ov29_023007DC
