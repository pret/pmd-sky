	.include "asm/macros.inc"
	.include "overlay_29_02348020.inc"

	.text

	arm_func_start DoesProjectileHitTarget
DoesProjectileHitTarget: ; 0x02348020
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r1, #9]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _023480F8 ; =THROWN_ITEM_HIT_CHANCE
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r1, #1
	movge r1, #0
	ldr r0, [r5]
	and r6, r1, #0xff
	cmp r0, #1
	bne _023480A8
	mov r0, r5
	mov r1, #0x2f
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r6, #0
	bne _023480A8
	mov r0, r5
	mov r1, #0x31
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r6, #1
_023480A8:
	ldr r0, [r4]
	cmp r0, #1
	bne _023480F0
	mov r0, r4
	bl ov29_022FB9BC
	cmp r0, #0
	bne _023480EC
	mov r0, r4
	mov r1, #0x2c
	bl ItemIsActive__02347B50
	cmp r0, #0
	bne _023480EC
	mov r0, r4
	mov r1, #0x53
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _023480F0
_023480EC:
	mov r6, #0
_023480F0:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023480F8: .word THROWN_ITEM_HIT_CHANCE
	arm_func_end DoesProjectileHitTarget

	arm_func_start ov29_023480FC
ov29_023480FC: ; 0x023480FC
	bx lr
	arm_func_end ov29_023480FC

	arm_func_start ov29_02348100
ov29_02348100: ; 0x02348100
#ifdef JAPAN
#define OV29_02348100_OFFSET -4
#else
#define OV29_02348100_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r0
	moveq r0, #0
	beq _02348124
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02348124:
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r7, [r4, #0xb4]
	ldrb r0, [r7, #6]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsh r1, [r7, #4]
	ldrb r2, [r7, #0x5e]
	ldrb r3, [r7, #0x5f]
	add r0, r7, #0x224 + OV29_02348100_OFFSET
	bl sub_02011220
	mov r0, r4
	mov r1, #0x4c
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	ldrne r0, _023482AC ; =_020A1878
	ldrnesh r1, [r7, #0x16]
	ldrnesh r0, [r0]
	addne r0, r1, r0
	strneh r0, [r7, #0x16]
	mov r0, r4
	mov r1, #0x4d
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	ldrne r0, _023482AC ; =_020A1878
	ldrnesh r1, [r7, #0x16]
	ldrnesh r0, [r0]
	addne r0, r1, r0, lsl #1
	strneh r0, [r7, #0x16]
	mov r0, r4
	mov r1, #0x4e
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	beq _023481C4
	ldr r0, _023482AC ; =_020A1878
	ldrsh r1, [r7, #0x16]
	ldrsh r0, [r0]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	strh r0, [r7, #0x16]
_023481C4:
	mov r5, #0
	mov r0, r4
	mov r1, #0x4a
	mov r6, r5
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	mov r0, r4
	mov r1, #0x4b
	movne r5, #1
	bl ExclusiveItemEffectIsActive__023482B0
	cmp r0, #0
	movne r6, #1
	mov r8, #0
	add r4, r7, #0x124 + OV29_02348100_OFFSET
_023481FC:
	add r0, r7, r8, lsl #3
	cmp r5, #0
	addne r0, r0, #0x100
	ldrneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	orrne r1, r1, #0x200
	strneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	bne _02348248
	add r1, r0, #0x100
	ldrh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	add r0, r4, r8, lsl #3
	bic r2, r2, #0x200
	strh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	bl GetMaxPp
	add r2, r7, r8, lsl #3
	mov r0, r0, lsl #0x10
	ldrb r1, [r2, #0x12a + OV29_02348100_OFFSET]
	mov r3, r0, asr #0x10
	cmp r1, r0, asr #16
	strgtb r3, [r2, #0x12a + OV29_02348100_OFFSET]
_02348248:
	add r0, r7, r8, lsl #3
	cmp r6, #0
	addne r0, r0, #0x100
	ldrneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	orrne r1, r1, #0x400
	strneh r1, [r0, #0x26 + OV29_02348100_OFFSET]
	bne _02348294
	add r1, r0, #0x100
	ldrh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	add r0, r4, r8, lsl #3
	bic r2, r2, #0x400
	strh r2, [r1, #0x26 + OV29_02348100_OFFSET]
	bl GetMaxPp
	add r2, r7, r8, lsl #3
	mov r0, r0, lsl #0x10
	ldrb r1, [r2, #0x12a + OV29_02348100_OFFSET]
	mov r3, r0, asr #0x10
	cmp r1, r0, asr #16
	strgtb r3, [r2, #0x12a + OV29_02348100_OFFSET]
_02348294:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _023481FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023482AC: .word _020A1878
	arm_func_end ov29_02348100

	arm_func_start ExclusiveItemEffectIsActive__023482B0
ExclusiveItemEffectIsActive__023482B0: ; 0x023482B0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__023482B0

	arm_func_start DisplayFloorCard
DisplayFloorCard: ; 0x023482D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02348308 ; =DUNGEON_PTR
	mov r5, r0
	ldr r4, [r1]
	bl GetCurrentHiddenStairsType
	mov r3, r0
	ldrb ip, [r4, #0x749]
	ldrsh r1, [r4, #0x1e]
	ldrb r0, [r4, #0x748]
	mov r2, r5
	add r1, ip, r1
	bl HandleFloorCard
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02348308: .word DUNGEON_PTR
	arm_func_end DisplayFloorCard

	arm_func_start HandleFloorCard
HandleFloorCard: ; 0x0234830C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r0, #4
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r2, _02348498 ; =ov29_023537C4
	mov r1, #4
	str r0, [r2]
	bl MemZero
	mov r0, #1
	mov r1, #0
	bl ov29_022E0DD8
	mov r0, #3
	mov r1, #0
	bl ov29_022E0DD8
	mov r0, #4
	mov r1, #0
	bl ov29_022E0DD8
	bl ov29_022E0DFC
	mov r0, #1
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl sub_02051EB8
	mov sb, r0
	mov r0, #0
	mov r1, r0
	bl sub_02051DFC
	mov r8, r0
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl GetBgRegionArea
	mov r1, r8
	mov r2, sb
	mov r3, #0
	str r3, [sp]
	mov ip, #0xe
	str ip, [sp, #4]
	str r3, [sp, #8]
	bl sub_02015328
	bl sub_02015588
	cmp r4, #1
	bne _023483D8
	bl sub_02017A00
	b _023483F8
_023483D8:
	cmp r4, #2
	bne _023483E8
	bl sub_02017A20
	b _023483F8
_023483E8:
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl sub_020178A8
_023483F8:
	mov r0, #0
	bl ov29_0234C738
	mov r6, #2
	ldr r4, _0234849C ; =ov29_0237C694
	b _02348424
_0234840C:
	mov r0, r6
	bl AdvanceFrame
	ldrh r0, [r4, #2]
	tst r0, #1
	bne _0234842C
	sub r5, r5, #1
_02348424:
	cmp r5, #0
	bgt _0234840C
_0234842C:
	mov r0, #2
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	mov r1, #0
	bl ov29_022E0DE4
	mov r0, #3
	mov r1, #0
	bl ov29_022E0DE4
	mov r0, #4
	mov r1, #0
	bl ov29_022E0DE4
	bl ov29_022E0E44
	bl sub_0201551C
	ldr r0, _02348498 ; =ov29_023537C4
	ldr r0, [r0]
	cmp r0, #0
	beq _02348490
	bl MemFree
	ldr r0, _02348498 ; =ov29_023537C4
	mov r1, #0
	str r1, [r0]
_02348490:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02348498: .word ov29_023537C4
_0234849C: .word ov29_0237C694
	arm_func_end HandleFloorCard

	arm_func_start FillMissionDestinationInfo
FillMissionDestinationInfo: ; 0x023484A0
#ifdef JAPAN
#define OV29_023484A0_OFFSET -0xA4
#else
#define OV29_023484A0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r7, r0, #0x400
	add r0, r7, #0x18
	bl ov29_023496EC
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov fp, #0x6f
	mov sl, #0xa5
	mov r5, #3
	mov r6, #1
	ldr r4, _02348804 ; =DUNGEON_PTR
	b _02348798
_023484FC:
#ifdef JAPAN
	mov r0, r8
	bl GetAcceptedMission
	mov sb, r0
	ldrb r0, [sb]
	cmp r0, #5
	ldreqb r1, [r7]
	ldreqb r0, [sb, #4]
	cmpeq r1, r0
	ldreqb r1, [r7, #1]
	ldreqb r0, [sb, #5]
	cmpeq r1, r0
	movne r0, #0
	bne _02348784
#else
	mov r0, r7
	mov r1, r8
	bl GetMissionIfActiveOnFloor
	movs sb, r0
	moveq r0, #0
	beq _02348784
#endif
	strb r6, [r7, #0x18]
	ldrb r0, [sb, #1]
	strb r0, [r7, #0x19]
	ldrb r0, [sb, #2]
	strb r0, [r7, #0x1a]
	ldrsh r0, [sb, #0xe]
	strh r0, [r7, #0x22]
	ldr r0, [r4]
	strb r6, [r0]
	ldrb r0, [r7, #0x19]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0234877C
_02348548: ; jump table
	b _02348584 ; case 0
	b _02348590 ; case 1
	b _0234859C ; case 2
	b _023485AC ; case 3
	b _02348608 ; case 4
	b _02348618 ; case 5
	b _02348628 ; case 6
	b _02348648 ; case 7
	b _0234865C ; case 8
	b _02348668 ; case 9
	b _0234869C ; case 10
	b _02348718 ; case 11
	b _0234876C ; case 12
	b _0234877C ; case 13
	b _0234877C ; case 14
_02348584:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_02348590:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_0234859C:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	strb r6, [r7, #0x30]
	b _0234877C
_023485AC:
	ldrb r0, [sb, #2]
	cmp r0, #0
	ldreq r0, [r4]
	streqb r5, [r0]
	beq _0234877C
	cmp r0, #1
	ldreqsh r0, [sb, #0x14]
	streqh r0, [r7, #0x20]
	streqb sl, [r7, #0x2e]
	beq _0234877C
	cmp r0, #2
	bne _0234877C
	mov r0, #4
	bl DungeonRandInt
	mov r1, r0, lsl #1
	ldr r0, _02348808 ; =ov10_022C48E4
	strb fp, [r7, #0x2e]
	ldrsh r0, [r0, r1]
	strh r0, [r7, #0x1c]
	ldr r1, [r4]
	mov r0, #2
	strb r0, [r1]
	b _0234877C
_02348608:
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1c]
	strb r6, [r7, #0x2f]
	b _0234877C
_02348618:
	ldr r1, [r4]
	mov r0, #3
	strb r0, [r1]
	b _0234877C
_02348628:
	ldrb r0, [sb, #2]
	cmp r0, #4
	moveq r0, #0
	streqh r0, [r7, #0x1c]
	ldrnesh r0, [sb, #0x14]
	strneh r0, [r7, #0x1c]
	strneb r6, [r7, #0x2f]
	b _0234877C
_02348648:
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1e]
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_0234865C:
	ldrsh r0, [sb, #0x10]
	strh r0, [r7, #0x24]
	b _0234877C
_02348668:
	ldrb r0, [sb, #2]
	cmp r0, #1
	beq _02348680
	cmp r0, #2
	moveq r0, #0x64
	streqb r0, [r7, #0x34]
_02348680:
	add r0, r7, #0x18
	add r1, sb, #0x10
	mov r2, #1
	bl ov29_023497C8
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x1c]
	b _0234877C
_0234869C:
	ldrb r0, [sb, #2]
	cmp r0, #4
	bne _023486BC
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	b _0234877C
_023486BC:
	cmp r0, #5
	bne _023486E0
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	mov r0, #0x64
	strb r0, [r7, #0x34]
	b _0234877C
_023486E0:
	cmp r0, #6
	bne _02348704
	add r0, r7, #0x18
	add r1, sb, #0x10
	mov r2, #2
	bl ov29_023497C8
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	b _0234877C
_02348704:
	add r1, sb, #0x10
	add r0, r7, #0x18
	mov r2, r6
	bl ov29_023497C8
	b _0234877C
_02348718:
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	ldrb r0, [r7, #0x1a]
	cmp r0, #0
	bne _02348744
	ldrsh r1, [sb, #0xe]
	add r0, r7, #0x18
	add r2, sb, #0x10
	mov r3, #3
	bl ov29_02349818
	b _0234877C
_02348744:
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #4
	bhi _0234877C
	ldrsh r1, [sb, #0xe]
	add r0, r7, #0x18
	mov r2, #0
	mov r3, #3
	bl ov29_02349818
	b _0234877C
_0234876C:
	ldrb r0, [sb, #0xc]
	strb r0, [r7, #0x2e]
	ldrsh r0, [sb, #0x14]
	strh r0, [r7, #0x20]
_0234877C:
	strb r8, [r7, #0x1b]
	mov r0, #1
_02348784:
	cmp r0, #0
	bne _023487A0
	add r0, r8, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, asr #0x18
_02348798:
	cmp r8, #8
	blt _023484FC
_023487A0:
	ldr r0, _02348804 ; =DUNGEON_PTR
	ldr r4, [r0]
	ldrb r0, [r4, #0x760]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsGoldenChamber
	cmp r0, #0
	beq _023487D4
	bl TrySpawnGoldenChamber
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023487D4:
	ldr r1, _02348804 ; =DUNGEON_PTR
	ldrb r2, [r4, #0x776]
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda + OV29_023484A0_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x4000
	ldrb r1, [r0, #0xda + OV29_023484A0_OFFSET]
	cmp r1, #0x95
	moveq r1, #0xc6
	streqh r1, [r0, #0xd4 + OV29_023484A0_OFFSET]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02348804: .word DUNGEON_PTR
_02348808: .word ov10_022C48E4
	arm_func_end FillMissionDestinationInfo

#ifndef JAPAN
	arm_func_start ov29_0234880C
ov29_0234880C: ; 0x0234880C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02348840
_0234881C:
	mov r0, r5
	mov r1, r4
	bl GetMissionIfActiveOnFloor
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
_02348840:
	cmp r4, #8
	blt _0234881C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234880C

	arm_func_start ov29_02348850
ov29_02348850: ; 0x02348850
	stmdb sp!, {r3, lr}
	ldr r0, _02348884 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x348
	add r0, r0, #0x400
	bl ov29_0234880C
	ldr r1, _02348884 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x763]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348884: .word DUNGEON_PTR
	arm_func_end ov29_02348850
#endif

	arm_func_start ov29_02348888
ov29_02348888: ; 0x02348888
	ldr ip, _02348890 ; =ov29_02349AD4
	bx ip
	.align 2, 0
_02348890: .word ov29_02349AD4
	arm_func_end ov29_02348888

	arm_func_start ov29_02348894
ov29_02348894: ; 0x02348894
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov r4, #8
_023488A0:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	add r5, r5, #1
	cmp r1, #7
	streqb r4, [r0]
	cmp r5, #8
	blt _023488A0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02348894

	arm_func_start ov29_023488C8
ov29_023488C8: ; 0x023488C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, #0
	mov r5, #5
_023488D4:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #7
	ldreqb r1, [r0, #1]
	cmpeq r1, #0xb
	bne _02348908
	ldrb r1, [r0, #2]
	add r1, r1, #0xff
	and r1, r1, #0xff
	cmp r1, #4
	strlsb r5, [r0]
_02348908:
	add r4, r4, #1
	cmp r4, #8
	blt _023488D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023488C8

	arm_func_start ov29_02348918
ov29_02348918: ; 0x02348918
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02348990 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r5, r0, #0x348
	bl GetForcedLossReason
	cmp r0, #4
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	mov r6, #7
_0234893C:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r5, #0x400]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r1, [r0, #1]
	cmpeq r1, #3
	ldreqb r1, [r0, #2]
	cmpeq r1, #3
	streqb r6, [r0]
	ldreqb r1, [r0, #0x16]
	cmpeq r1, #5
	bne _02348980
	bl GenerateMissionEggMonster
_02348980:
	add r4, r4, #1
	cmp r4, #8
	blt _0234893C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348990: .word DUNGEON_PTR
	arm_func_end ov29_02348918

	arm_func_start ov29_02348994
ov29_02348994: ; 0x02348994
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02348A14 ; =DUNGEON_PTR
	mov r4, #0
	ldr r0, [r0]
	add r6, r0, #0x348
_023489A8:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r5, r0
	ldrb r0, [r5]
	cmp r0, #5
	ldreqb r1, [r6, #0x400]
	ldreqb r0, [r5, #4]
	cmpeq r1, r0
	bne _02348A04
	ldrb r0, [r5, #1]
	cmp r0, #6
	cmpne r0, #4
	bne _02348A04
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	beq _02348A04
	ldrb r0, [r5, #0x16]
	cmp r0, #5
	bne _02348A04
	mov r0, r5
	bl GenerateMissionEggMonster
_02348A04:
	add r4, r4, #1
	cmp r4, #8
	blt _023489A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348A14: .word DUNGEON_PTR
	arm_func_end ov29_02348994

	arm_func_start ov29_02348A18
ov29_02348A18: ; 0x02348A18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov r5, #1
	ldr r6, _02348AB8 ; =0x00000E24
	mov sl, r0
	mov r4, r7
	mov fp, r5
	mov sb, r7
	mov r8, r5
_02348A3C:
	mov r0, sb
	mov r1, sl
	mov r2, sb
	mov r3, r8
	str sb, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A90
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r5
	str r7, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A3C
	mov r0, #2
	mov r1, #1
	bl ov29_022E09E8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02348A90:
	mov r0, r4
	mov r2, fp
	mov r3, fp
	add r1, r6, #1
	str r4, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _02348A3C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02348AB8: .word 0x00000B65
#else
_02348AB8: .word 0x00000E24
#endif
	arm_func_end ov29_02348A18

	arm_func_start ov29_02348ABC
ov29_02348ABC: ; 0x02348ABC
	stmdb sp!, {r3, lr}
	bl GetItemToRetrieve
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #1
	bl ov29_02344B9C
	ldr r1, _02348B20 ; =DUNGEON_PTR
	ldr r0, _02348B24 ; =0x00000E22
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x777]
	bl ov29_02348A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02349AD4
	ldr r0, _02348B20 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02348B20: .word DUNGEON_PTR
#ifdef JAPAN
_02348B24: .word 0x00000B63
#else
_02348B24: .word 0x00000E22
#endif
	arm_func_end ov29_02348ABC

	arm_func_start ov29_02348B28
ov29_02348B28: ; 0x02348B28
	stmdb sp!, {r4, lr}
	ldr r1, _02348B94 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x700
	ldrsh r1, [r1, #0x6a]
	bl SetMessageLogPreprocessorArgsFlagVal
	mov r1, r4
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r1, _02348B98 ; =0x00000E17
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, _02348B9C ; =0x00000E44
	bl ov29_02348A18
	mov r1, #1
	ldr r0, _02348B94 ; =DUNGEON_PTR
	ldr r0, [r0]
	strb r1, [r0, #0x77a]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02348B94: .word DUNGEON_PTR
#ifdef JAPAN
_02348B98: .word 0x00000B58
_02348B9C: .word 0x00000B85
#else
_02348B98: .word 0x00000E17
_02348B9C: .word 0x00000E44
#endif
	arm_func_end ov29_02348B28

	arm_func_start ov29_02348BA0
ov29_02348BA0: ; 0x02348BA0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_02349A70
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl ov29_023009CC
	cmp r0, #0
	beq _02348BD8
	mov r0, r5
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	bne _02348BE0
_02348BD8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02348BE0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02348BA0

	arm_func_start ov29_02348BE8
ov29_02348BE8: ; 0x02348BE8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	bl ov29_02349A70
	movs r4, r0
	beq _02348C50
	ldr r1, [r4, #0xb4]
	add r0, sp, #0
	ldrsh r1, [r1, #4]
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02348C58 ; =0x00000E3B
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _02348C5C ; =0x00000E3C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _02348C60 ; =0x00000E3D
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage2
_02348C50:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02348BE8_OFFSET -0x2BF
#else
#define OV29_02348BE8_OFFSET 0
#endif
_02348C58: .word 0x00000E3B + OV29_02348BE8_OFFSET
_02348C5C: .word 0x00000E3C + OV29_02348BE8_OFFSET
_02348C60: .word 0x00000E3D + OV29_02348BE8_OFFSET
	arm_func_end ov29_02348BE8

	arm_func_start ov29_02348C64
ov29_02348C64: ; 0x02348C64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	ldr r1, _02348CFC ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	add r6, r0, #0x348
	b _02348CEC
_02348C84:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r6, #0x400]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r1, [r0, #1]
	cmpeq r1, #2
	bne _02348CE8
	ldrsh r1, [r0, #0x10]
	add r0, sp, #0
	mov r2, #0x4e
	bl GetName
	mov r0, r5
	bl GetSize0x80Buffer
	add r1, sp, #0
	bl strcpy
	mov r0, r5
	bl GetSize0x80Buffer
	mov r1, r0
	mov r0, r5
	bl SetMessageLogPreprocessorArgsString
	b _02348CF4
_02348CE8:
	add r4, r4, #1
_02348CEC:
	cmp r4, #8
	blt _02348C84
_02348CF4:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02348CFC: .word DUNGEON_PTR
	arm_func_end ov29_02348C64
