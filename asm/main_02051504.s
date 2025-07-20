	.include "asm/macros.inc"
	.include "main_02051504.inc"

	.text

	arm_func_start RetrieveFromItemList1
RetrieveFromItemList1: ; 0x02051504
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, _02051564 ; =0x0000270F
	mov r6, r1
	bl RandIntSafe
	mov r4, r0
	ldr r0, _02051564 ; =0x0000270F
	bl RandIntSafe
	mov r5, r0
	ldrb r0, [r7]
	cmp r0, #0xb4
	cmphs r0, #0xd3
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbFloorsPlusOne
	ldrb r1, [r7, #1]
	cmp r1, r0
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl GetItemIdFromList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02051564: .word 0x0000270F
	arm_func_end RetrieveFromItemList1

	arm_func_start IsForbiddenFloor
IsForbiddenFloor: ; 0x02051568
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl DungeonFloorToGroupFloor
	ldrb ip, [sp]
	ldrb lr, [sp, #1]
	ldr r1, _020515C0 ; =MISSION_FLOORS_FORBIDDEN
	mov r3, #0
_02051588:
	ldrb r0, [r1, r3, lsl #1]
	mov r2, r3, lsl #1
	cmp r0, #0x64
	beq _020515B8
	cmp ip, r0
	addeq r0, r1, r2
	ldreqb r0, [r0, #1]
	cmpeq lr, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	add r3, r3, #1
	b _02051588
_020515B8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020515C0: .word MISSION_FLOORS_FORBIDDEN
	arm_func_end IsForbiddenFloor

	arm_func_start sub_020515C4
sub_020515C4: ; 0x020515C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020515C4

	arm_func_start Copy16BitsFrom
Copy16BitsFrom: ; 0x020515EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strb r3, [r4]
	mov r5, r0
	mov r2, #8
	strb r3, [r4, #1]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #8
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Copy16BitsFrom

	arm_func_start sub_02051620
sub_02051620: ; 0x02051620
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051620

	arm_func_start sub_02051648
sub_02051648: ; 0x02051648
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strb r3, [r4]
	mov r5, r0
	mov r2, #7
	strb r3, [r4, #1]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051648

	arm_func_start RetrieveFromItemList2
RetrieveFromItemList2: ; 0x0205167C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, _020516D8 ; =0x0000270F
	mov r6, r1
	bl RandIntSafe
	mov r5, r0
	ldr r0, _020516D8 ; =0x0000270F
	bl RandIntSafe
	mov r4, r0
	ldrb r0, [r7]
	cmp r0, #0xb4
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbFloorsPlusOne
	ldrb r1, [r7, #1]
	cmp r1, r0
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GetItemIdFromList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020516D8: .word 0x0000270F
	arm_func_end RetrieveFromItemList2

	arm_func_start IsInvalidForMission
IsInvalidForMission: ; 0x020516DC
	cmp r0, #0xb4
	movhs r0, #1
	bxhs lr
	mov r2, #0
	ldr r1, _02051718 ; =_020A1864
	b _02051704
_020516F4:
	cmp r3, r0
	moveq r0, #1
	bxeq lr
	add r2, r2, #1
_02051704:
	ldrb r3, [r1, r2]
	cmp r3, #0xb4
	bne _020516F4
	mov r0, #0
	bx lr
	.align 2, 0
_02051718: .word _020A1864
	arm_func_end IsInvalidForMission

	arm_func_start IsExpEnabledInDungeon
IsExpEnabledInDungeon: ; 0x0205171C
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051740 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051740: .word DUNGEON_RESTRICTIONS
	arm_func_end IsExpEnabledInDungeon

	arm_func_start IsSkyExclusiveDungeon
IsSkyExclusiveDungeon: ; 0x02051744
	cmp r0, #0x67
	blo _02051758
	cmp r0, #0xb0
	movls r0, #1
	bxls lr
_02051758:
	mov r0, #0
	bx lr
	arm_func_end IsSkyExclusiveDungeon
