	.include "asm/macros.inc"
	.include "overlay_29_023494CC.inc"

	.text

	arm_func_start GetItemToRetrieve
GetItemToRetrieve: ; 0x023494CC
	ldr r0, _023494EC ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r1, r1, #0x760
	cmp r0, #0
	ldrnesh r0, [r1, #4]
	moveq r0, #0
	bx lr
	.align 2, 0
_023494EC: .word DUNGEON_PTR
	arm_func_end GetItemToRetrieve

	arm_func_start GetItemToDeliver
GetItemToDeliver: ; 0x023494F0
	stmdb sp!, {r4, lr}
	ldr r1, _02349518 ; =DUNGEON_PTR
	mov r0, #7
	ldr r1, [r1]
	add r4, r1, #0x760
	bl IsCurrentMissionType
	cmp r0, #0
	ldrnesh r0, [r4, #6]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349518: .word DUNGEON_PTR
	arm_func_end GetItemToDeliver

	arm_func_start GetSpecialTargetItem
GetSpecialTargetItem: ; 0x0234951C
	stmdb sp!, {r4, lr}
	ldr r1, _02349560 ; =DUNGEON_PTR
	mov r0, #3
	ldr r2, [r1]
	mov r1, #1
	add r4, r2, #0x760
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349550
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349558
_02349550:
	ldrsh r0, [r4, #8]
	ldmia sp!, {r4, pc}
_02349558:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349560: .word DUNGEON_PTR
	arm_func_end GetSpecialTargetItem

	arm_func_start IsDestinationFloorWithItem
IsDestinationFloorWithItem: ; 0x02349564
	stmdb sp!, {r4, lr}
	ldr r0, _023495C0 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r4, r1, #0x760
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	mov r0, #7
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	ldrsh r0, [r4, #4]
	cmp r0, #0
	bne _023495B8
_023495B0:
	mov r0, #0
	ldmia sp!, {r4, pc}
_023495B8:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023495C0: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithItem
