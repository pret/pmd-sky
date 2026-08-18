	.include "asm/macros.inc"
	.include "overlay_29_02348D3C.inc"

	.text

	arm_func_start ov29_02348D3C
ov29_02348D3C: ; 0x02348D3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #9
	mov r4, #0
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348D78
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02348DCC
	ldrb r0, [r5]
	tst r0, #0x80
	movne r4, #1
	b _02348DCC
_02348D78:
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348DA8
	bl GetSpecialTargetItem
	ldrh r1, [r5, #2]
	cmp r1, r0
	bne _02348DCC
	ldrb r0, [r5]
	tst r0, #0x80
	movne r4, #3
	b _02348DCC
_02348DA8:
	ldr r0, _02348DD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x777]
	cmp r0, #0
	beq _02348DCC
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	moveq r4, #2
_02348DCC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02348DD4: .word DUNGEON_PTR
	arm_func_end ov29_02348D3C

	arm_func_start ov29_02348DD8
ov29_02348DD8: ; 0x02348DD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GetSpecialTargetItem
	cmp r0, #0
	beq _02348E04
	mov r0, r6
	bl EntityIsValid__0234987C
	cmp r0, #0
	bne _02348E0C
_02348E04:
	mov r0, #0
	b _02348E64
_02348E0C:
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #0
	bne _02348E64
	ldrsh r0, [r5, #4]
	cmp r0, #0
	beq _02348E60
	bl GetSpecialTargetItem
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02348E60
	ldrb r0, [r5]
	tst r0, #0x80
	beq _02348E60
	mov r0, r6
	bl ov29_02348BA0
	cmp r0, #0
	moveq r0, #1
	movne r0, #2
	b _02348E64
_02348E60:
	mov r0, #0
_02348E64:
	cmp r0, #1
	bne _02348EAC
	cmp r4, #0
	beq _02348E9C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r5
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _02348EC8 ; =0x00000BD2
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_02348E9C:
	mov r0, r6
	bl ov29_0234A244
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02348EAC:
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_0234AA98
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02348EC8: .word 0x00000911
#else
_02348EC8: .word 0x00000BD2
#endif
	arm_func_end ov29_02348DD8

	arm_func_start ov29_02348ECC
ov29_02348ECC: ; 0x02348ECC
	stmdb sp!, {r3, lr}
	cmp r1, #1
	mov r2, #0
	bne _02348EF4
	ldrb r1, [r0]
	tst r1, #2
	bne _02348F18
	bl ov29_02348B28
	mov r2, #1
	b _02348F18
_02348EF4:
	cmp r1, #2
	bne _02348F08
	bl ov29_02348ABC
	mov r2, #1
	b _02348F18
_02348F08:
	cmp r1, #3
	bne _02348F18
	bl TreasureMemoComplete
	mov r2, #1
_02348F18:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02348ECC

	arm_func_start ov29_02348F20
ov29_02348F20: ; 0x02348F20
	stmdb sp!, {r3, lr}
	bl MissionTargetEnemyIsDefeated
	cmp r0, #0
	ldrne r0, _02348FD4 ; =DUNGEON_PTR
	ldrne r0, [r0]
	ldrneb r0, [r0, #1]
	cmpne r0, #0
	beq _02348FCC
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348F68
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234A790
	b _02348FB4
_02348F68:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348F90
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234A8BC
	b _02348FB4
_02348F90:
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02348FB4
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bl ov29_0234ABB0
_02348FB4:
	ldr r0, _02348FD4 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #1]
	ldmia sp!, {r3, pc}
_02348FCC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348FD4: .word DUNGEON_PTR
	arm_func_end ov29_02348F20

	arm_func_start ov29_02348FD8
ov29_02348FD8: ; 0x02348FD8
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl IsDestinationFloorWithItem
	cmp r0, #0
	beq _02349014
	ldr r0, _02349088 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349014
	bl GetItemToRetrieve
	bl IsItemInBag
	cmp r0, #0
	movne r4, #1
	b _02349058
_02349014:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349050
	ldr r0, _02349088 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349050
	bl GetItemToRetrieve
	mov r1, #0x40
	bl IsItemWithFlagsInBag
	cmp r0, #0
	movne r4, #1
	b _02349058
_02349050:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02349058:
	cmp r4, #0
	beq _02349080
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl TryCompleteMission
	ldr r0, _02349088 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
_02349080:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349088: .word DUNGEON_PTR
	arm_func_end ov29_02348FD8

	arm_func_start ov29_0234908C
ov29_0234908C: ; 0x0234908C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl IsDestinationFloorWithItem
	cmp r0, #0
	beq _023490CC
	ldr r0, _02349148 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _023490CC
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	moveq r4, #1
	b _02349118
_023490CC:
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349110
	ldr r0, _02349148 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x77a]
	cmp r0, #0
	bne _02349110
	bl GetItemToRetrieve
	ldrsh r1, [r5, #4]
	cmp r1, r0
	bne _02349118
	ldrb r0, [r5]
	tst r0, #0x40
	movne r4, #1
	b _02349118
_02349110:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02349118:
	cmp r4, #0
	beq _02349140
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl TryCompleteMission
	ldr r0, _02349148 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
_02349140:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02349148: .word DUNGEON_PTR
	arm_func_end ov29_0234908C

	arm_func_start CheckActiveChallengeRequest
CheckActiveChallengeRequest: ; 0x0234914C
	stmdb sp!, {r3, lr}
	ldr r0, _02349184 ; =DUNGEON_PTR
	mov r1, #5
	ldr r0, [r0]
	strb r1, [sp]
	ldrb r2, [r0, #0x748]
	add r1, sp, #0
	mov r0, #0xb
	bl CheckAcceptedMissionByTypeAndDungeon
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349184: .word DUNGEON_PTR
	arm_func_end CheckActiveChallengeRequest
