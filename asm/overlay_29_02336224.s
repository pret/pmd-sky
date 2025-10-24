	.include "asm/macros.inc"
	.include "overlay_29_02336224.inc"

	.text

	arm_func_start TrySpawnGoldenChamber
TrySpawnGoldenChamber: ; 0x02336224
	stmdb sp!, {r3, lr}
	bl IsGoldenChamber
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0233625C ; =DUNGEON_PTR
	mov r3, #0x3c
	ldr r0, [r1]
	mov r2, #0x6f
	add r0, r0, #0x4000
#ifdef JAPAN
	strh r3, [r0, #0x30]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0x36]
#else
	strh r3, [r0, #0xd4]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233625C: .word DUNGEON_PTR
	arm_func_end TrySpawnGoldenChamber

	arm_func_start CountItemsOnFloorForAcuteSniffer
CountItemsOnFloorForAcuteSniffer: ; 0x02336260
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, #0
	strh r6, [sp, #2]
	add r4, sp, #0
	mov r5, r6
	b _023362C0
_0233627C:
	strh r5, [sp]
	b _023362A8
_02336284:
	mov r0, r4
	bl PositionHasItem
	cmp r0, #0
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	movne r6, r0, asr #0x10
	ldrsh r0, [sp]
	add r0, r0, #1
	strh r0, [sp]
_023362A8:
	ldrsh r0, [sp]
	cmp r0, #0x38
	blt _02336284
	ldrsh r0, [sp, #2]
	add r0, r0, #1
	strh r0, [sp, #2]
_023362C0:
	ldrsh r0, [sp, #2]
	cmp r0, #0x20
	blt _0233627C
	ldr r1, _023362E4 ; =DUNGEON_PTR
	ldr r0, _023362E8 ; =0x00012AF8
	ldr r1, [r1]
	strh r6, [r1, r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023362E4: .word DUNGEON_PTR
#ifdef JAPAN
_023362E8: .word 0x00012A54
#else
_023362E8: .word 0x00012AF8
#endif
	arm_func_end CountItemsOnFloorForAcuteSniffer

	arm_func_start ov29_023362EC
ov29_023362EC: ; 0x023362EC
#ifdef JAPAN
#define OV29_023362EC_OFFSET -0xA4
#else
#define OV29_023362EC_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	ldr r8, _023363BC ; =DUNGEON_PTR
	mov r2, ip
	mov r5, #0x14
	mov r6, #0x460
	mov r7, #0xe0
_02336308:
	mul lr, ip, r6
	mul r4, ip, r7
	mov r3, r2
_02336314:
	ldr r1, [r8]
	add r0, r1, #0xe0 + OV29_023362EC_OFFSET
	add r0, r0, #0x4000
	add r0, r0, lr
	mla r0, r3, r5, r0
	add r1, r4, r1
	add r1, r1, r3, lsl #2
	add r1, r1, #0xd000
	add r3, r3, #1
	str r0, [r1, #0x2e4 + OV29_023362EC_OFFSET]
	cmp r3, #0x38
	blt _02336314
	add ip, ip, #1
	cmp ip, #0x20
	blt _02336308
	ldr r1, _023363BC ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x4000
	strh r2, [r0, #0xd4 + OV29_023362EC_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strh r2, [r0, #0xd6 + OV29_023362EC_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xaa8 + OV29_023362EC_OFFSET]
	bl ov29_023369F8
	ldr r1, _023363BC ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x4000
	str r2, [r0, #0xd0 + OV29_023362EC_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xc8 + OV29_023362EC_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xb24 + OV29_023362EC_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x12000
	strb r2, [r0, #0xb25 + OV29_023362EC_OFFSET]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023363BC: .word DUNGEON_PTR
	arm_func_end ov29_023362EC

	arm_func_start GetStairsSpawnPosition
GetStairsSpawnPosition: ; 0x023363C0
	ldr r3, _023363E8 ; =DUNGEON_PTR
	ldr r2, [r3]
	add r2, r2, #0xcc00
#ifdef JAPAN
	ldrsh r2, [r2, #0x40]
#else
	ldrsh r2, [r2, #0xe4]
#endif
	strh r2, [r0]
	ldr r0, [r3]
	add r0, r0, #0xcc00
#ifdef JAPAN
	ldrsh r0, [r0, #0x42]
#else
	ldrsh r0, [r0, #0xe6]
#endif
	strh r0, [r1]
	bx lr
	.align 2, 0
_023363E8: .word DUNGEON_PTR
	arm_func_end GetStairsSpawnPosition

	arm_func_start PositionIsOnStairs
PositionIsOnStairs: ; 0x023363EC
	ldr r2, _02336424 ; =DUNGEON_PTR
	mov ip, #0
	ldr r2, [r2]
	add r2, r2, #0xcc00
#ifdef JAPAN
	ldrsh r3, [r2, #0x40]
	cmp r3, r0
	ldreqsh r0, [r2, #0x42]
#else
	ldrsh r3, [r2, #0xe4]
	cmp r3, r0
	ldreqsh r0, [r2, #0xe6]
#endif
	cmpeq r0, r1
	moveq ip, #1
	cmp ip, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02336424: .word DUNGEON_PTR
	arm_func_end PositionIsOnStairs
