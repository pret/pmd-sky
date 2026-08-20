	.include "asm/macros.inc"
	.include "main_02065998.inc"

	.text

	arm_func_start GetActorMatchingStorageId
GetActorMatchingStorageId: ; 0x02065998
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r0, sp, #0x18
	bl sub_02065050
	ldrsh r1, [sp, #0x18]
	cmp r1, #1
	cmpne r1, #0xc
	cmpne r1, #0x3c
	bne _020659C8
	bl GetMainCharacter1MemberIdx
	b _02065B04
_020659C8:
	cmp r1, #2
	cmpne r1, #0xd
	cmpne r1, #0x3d
	bne _020659E0
	bl GetMainCharacter2MemberIdx
	b _02065B04
_020659E0:
	cmp r1, #3
	cmpne r1, #0xe
	cmpne r1, #0x3e
	bne _020659F8
	bl GetMainCharacter3MemberIdx
	b _02065B04
_020659F8:
	cmp r1, #4
	cmpne r1, #0xf
	cmpne r1, #0x3f
	bne _02065A10
	bl GetAppointedLeaderMemberIdx
	b _02065B04
_02065A10:
	cmp r1, #0x40
	bne _02065A20
	bl GetHeroMemberIdx
	b _02065B04
_02065A20:
	cmp r1, #0x41
	bne _02065A30
	bl GetPartnerMemberIdx
	b _02065B04
_02065A30:
	cmp r1, #0x16
	blt _02065A84
	cmp r1, #0x19
	bgt _02065A84
	mov r0, #0xd
	sub r4, r1, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065A64
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065A64:
	add r0, sp, #8
	bl GetUnitNpcIds
	cmp r4, r0
	bge _02065B00
	add r0, sp, #8
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065A84:
	cmp r1, #0x1a
	blt _02065AD8
	cmp r1, #0x1d
	bgt _02065AD8
	mov r0, #0xd
	sub r4, r1, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065AB8
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065AB8:
	add r0, sp, #0
	bl GetAdventureNpcIds
	cmp r4, r0
	bge _02065B00
	add r0, sp, #0
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065AD8:
	cmp r1, #0x1e
	blt _02065AE8
	cmp r1, #0x2d
	ble _02065B00
_02065AE8:
	cmp r1, #0x99
	bne _02065B00
	mov r0, #0x214
	mov r1, #0
	bl GetRecruitMentryIdBySpecies
	b _02065B04
_02065B00:
	mvn r0, #0
_02065B04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end GetActorMatchingStorageId
