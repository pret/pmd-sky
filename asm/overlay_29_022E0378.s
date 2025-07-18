	.include "asm/macros.inc"
	.include "overlay_29_022E0378.inc"

	.text

; https://decomp.me/scratch/Cgi9a
	arm_func_start ov29_022E0378
ov29_022E0378: ; 0x022E0378
	ldr r1, _022E03A8 ; =ov29_0237CFC0
	ldrb r1, [r1]
	cmp r1, #0
	movne r0, #1
	bxne lr
	ldr r1, _022E03AC ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r1, r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E03A8: .word ov29_0237CFC0
_022E03AC: .word SECONDARY_TERRAIN_TYPES
	arm_func_end ov29_022E0378

	arm_func_start GetFloorType
GetFloorType: ; 0x022E03B0
	stmdb sp!, {r3, lr}
	ldr r0, _022E0430 ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	ldreqb r1, [r2, #0x751]
	ldreqb r0, [r2, #0x749]
	cmpeq r1, r0
	moveq r0, #2
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0
	beq _022E03F8
	cmp r0, #0x6e
	movlo r0, #1
	blo _022E041C
_022E03F8:
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	bne _022E0410
	bl IsJirachiChallengeFloor
	cmp r0, #0
	beq _022E0418
_022E0410:
	mov r0, #1
	b _022E041C
_022E0418:
	mov r0, #0
_022E041C:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0430: .word DUNGEON_PTR
	arm_func_end GetFloorType

	arm_func_start ov29_022E0434
ov29_022E0434: ; 0x022E0434
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	ldr r4, _022E0618 ; =DUNGEON_PTR
	mov r5, r7
	mov r6, #1
	mov fp, r7
_022E044C:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa94]
#else
	ldr r8, [r0, #0xb38]
#endif
	mov r0, r8
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E04B4
	ldr sl, [r8, #0xb4]
	mov sb, r6
	ldrb r0, [sl, #9]
	cmp r0, #1
	mov r0, sl
	moveq sb, r5
	bl IsExperienceLocked
	cmp r0, #0
	ldrb r0, [sl, #0xbc]
	movne sb, fp
	cmp r0, #7
	moveq sb, #0
	cmp sb, #0
	beq _022E04B4
	ldr r1, _022E061C ; =0x00000246
	mov r0, r8
	mov r2, r8
	bl HandleFaint
_022E04B4:
	add r7, r7, #1
	cmp r7, #0x10
	blt _022E044C
#ifdef JAPAN
	mov r6, #0
_022E04C4:
	ldr r0, _022E0618 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r4, [r0, #0xa84]
	mov r0, r4
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E1C2C
	mov r0, #0
	mov r3, #1
	strb r0, [r4, #0x22]
	strb r3, [r4, #0x20]
	ldr r5, [r4, #0xb4]
	rsb r0, r3, #0x3e8
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r3, _022E0618 ; =DUNGEON_PTR
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r5, #0x10]
	add r2, r5, #0x100
	ldrh r0, [r2, #0x46]
	mov r1, #0
	strh r0, [r2, #0x42]
	ldrh r4, [r2, #0x48]
	mov r0, r5
	strh r4, [r2, #0x44]
	ldr r2, [r3]
	strb r1, [r2, #0x78d]
	bl SubInitMonster
	ldrsh r0, [r5, #2]
	mov r4, #0
	add r8, r5, #0x120
	strh r0, [r5, #4]
	strb r4, [r5, #0x105]
	mov r5, r4
	mov r7, #1
_022E1BF8:
	ldrb r0, [r8, r4, lsl #3]
	add sb, r8, r4, lsl #3
	tst r0, #1
	movne r0, r7
	moveq r0, r5
	tst r0, #0xff
	beq _022E1C20
	mov r0, sb
	bl GetMaxPpWrapper
	strb r0, [sb, #6]
_022E1C20:
	add r4, r4, #1
	cmp r4, #4
	blt _022E1BF8
_022E1C2C:
	add r6, r6, #1
	cmp r6, #4
#else
	mov r8, #0
_022E04C4:
	ldr r0, _022E0618 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, r6
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E05A0
	mov r0, #0
	mov r3, #1
	strb r0, [r6, #0x22]
	strb r3, [r6, #0x20]
	ldr r4, [r6, #0xb4]
	rsb r0, r3, #0x3e8
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r3, _022E0618 ; =DUNGEON_PTR
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x10]
	add r2, r4, #0x100
	ldrh r0, [r2, #0x4a]
	mov r1, #0
	strh r0, [r2, #0x46]
	ldrh r5, [r2, #0x4c]
	mov r0, r4
	strh r5, [r2, #0x48]
	ldr r2, [r3]
	strb r1, [r2, #0x78d]
	bl SubInitMonster
	ldrsh r0, [r4, #2]
	mov r5, #0
	mov sb, r5
	strh r0, [r4, #4]
	strb r5, [r4, #0x106]
	str r5, [r4, #0x188]
	add r4, r4, #0x124
	mov sl, #1
_022E0564:
	ldrb r0, [r4, r5, lsl #3]
	add r7, r4, r5, lsl #3
	tst r0, #1
	movne r0, sl
	moveq r0, sb
	tst r0, #0xff
	beq _022E058C
	mov r0, r7
	bl GetMaxPpWrapper
	strb r0, [r7, #6]
_022E058C:
	add r5, r5, #1
	cmp r5, #4
	blt _022E0564
	mov r0, r6
	bl CalcSpeedStageWrapper
_022E05A0:
	add r8, r8, #1
	cmp r8, #4
#endif
	blt _022E04C4
	mov r8, #0
	mov r4, #5
	mov r5, r8
_022E05B8:
	mov r6, r5
_022E05BC:
	mov r0, r6
	mov r1, r8
	bl GetTileSafe
	ldr r7, [r0, #0x10]
	mov r0, r7
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E05FC
	ldr r0, [r7]
	cmp r0, #2
	bne _022E05FC
	mov r0, r7
	bl GetTrapInfo
	ldrb r1, [r0]
	cmp r1, #0x20
	streqb r4, [r0]
_022E05FC:
	add r6, r6, #1
	cmp r6, #0x38
	blt _022E05BC
	add r8, r8, #1
	cmp r8, #0x20
	blt _022E05B8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E0618: .word DUNGEON_PTR
_022E061C: .word 0x00000246
	arm_func_end ov29_022E0434

	arm_func_start TryForcedLoss
TryForcedLoss: ; 0x022E0620
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r6, #0
	bl ov29_0234B034
	cmp r5, #0
	bne _022E0648
	bl IsFloorOver
	cmp r0, #0
	movne r0, r6
	ldmneia sp!, {r4, r5, r6, pc}
_022E0648:
	bl GetForcedLossReason
	cmp r0, #1
	bne _022E06C8
	bl GetLeader
	mov r4, r0
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E07F8
	cmp r5, #0
	bne _022E0698
	ldr r1, _022E0800 ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x400
	bl ov29_0234B0B4
#ifdef JAPAN
	ldr r1, _022E1E90 ; =0x00000881
	mov r0, #0
#else
	mov r0, #0
	mov r1, #0xb70
#endif
	mov r2, #1
	bl DisplayMessage2
_022E0698:
	ldr r0, _022E0800 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75f]
	cmp r0, #0
	beq _022E06B0
	bl ov29_022E0A18
_022E06B0:
	ldr r1, _022E0804 ; =0x0000025E
	mov r0, r4
	mov r2, r4
	bl HandleFaint
	mov r6, #1
	b _022E07F8
_022E06C8:
	bl GetForcedLossReason
	cmp r0, #2
	bne _022E0738
	bl GetLeader
	mov r4, r0
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E07F8
	cmp r5, #0
	bne _022E0718
	ldr r1, _022E0800 ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x400
	bl ov29_0234B0B4
	ldr r1, _022E0808 ; =0x00000B71
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022E0718:
	mov r0, r4
	bl ov29_022E68BC
	ldr r1, _022E080C ; =0x00000261
	mov r0, r4
	mov r2, r4
	bl HandleFaint
	mov r6, #1
	b _022E07F8
_022E0738:
	bl GetForcedLossReason
	cmp r0, #3
	bne _022E07BC
	bl GetLeader
	mov r4, r0
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E07F8
	ldr r0, _022E0800 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x75f]
	cmp r0, #0
	beq _022E0774
	bl ov29_022E0A18
	b _022E07A4
_022E0774:
	cmp r5, #0
	bne _022E079C
	add r0, r1, #0x248
	add r1, r0, #0x400
	mov r0, #0
	bl ov29_0234B0B4
	ldr r1, _022E0810 ; =0x00000B72
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022E079C:
	mov r0, r4
	bl ov29_022E68BC
_022E07A4:
	ldr r1, _022E0814 ; =0x00000266
	mov r0, r4
	mov r2, r4
	bl HandleFaint
	mov r6, #1
	b _022E07F8
_022E07BC:
	bl GetForcedLossReason
	cmp r0, #4
	bne _022E07F8
	bl GetLeader
	mov r4, r0
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022E07F8
	mov r0, r4
	bl ov29_022E68BC
	ldr r1, _022E0818 ; =0x00000265
	mov r0, r4
	mov r2, r4
	bl HandleFaint
	mov r6, #1
_022E07F8:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E0800: .word DUNGEON_PTR
#ifdef JAPAN
#define TRY_FORCED_LOSS_OFFSET -0x2EF
_022E1E90: .word 0x00000881
#else
#define TRY_FORCED_LOSS_OFFSET 0
#endif
_022E0804: .word 0x0000025E
_022E0808: .word 0x00000B71 + TRY_FORCED_LOSS_OFFSET
_022E080C: .word 0x00000261
_022E0810: .word 0x00000B72 + TRY_FORCED_LOSS_OFFSET
_022E0814: .word 0x00000266
_022E0818: .word 0x00000265
	arm_func_end TryForcedLoss

	arm_func_start ov29_022E081C
ov29_022E081C: ; 0x022E081C
	stmdb sp!, {r3, lr}
	ldr r0, _022E0860 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl GetMaxItemsAllowed
	cmp r0, #0
	bne _022E083C
	bl RemoveAllItems
_022E083C:
	ldr r0, _022E0860 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsMoneyAllowed
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl SetMoneyCarried
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0860: .word DUNGEON_PTR
	arm_func_end ov29_022E081C
