	.include "asm/macros.inc"
	.include "overlay_29_022E0378.inc"

	.text

	arm_func_start ov29_022E0378
ov29_022E0378: ; 0x022E0378
	ldr r1, _022E03A8 ; =0x0237CFC0
	ldrb r1, [r1]
	cmp r1, #0
	movne r0, #1
	bxne lr
	ldr r1, _022E03AC ; =0x020A1AE8
	ldrb r0, [r1, r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E03A8: .word 0x0237CFC0
_022E03AC: .word 0x020A1AE8
	arm_func_end ov29_022E0378

	arm_func_start GetFloorType
GetFloorType: ; 0x022E03B0
	stmdb sp!, {r3, lr}
	ldr r0, _022E0430 ; =0x02353538
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
	ldrb r0, [r0, #0xda]
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
_022E0430: .word 0x02353538
	arm_func_end GetFloorType

	arm_func_start ov29_022E0434
ov29_022E0434: ; 0x022E0434
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	ldr r4, _022E0618 ; =0x02353538
	mov r5, r7
	mov r6, #1
	mov fp, r7
_022E044C:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38]
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
	mov r8, #0
_022E04C4:
	ldr r0, _022E0618 ; =0x02353538
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
	ldr r3, _022E0618 ; =0x02353538
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
	bl ov29_022FDDC0
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
	bl ov29_022E1608
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
_022E0618: .word 0x02353538
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
	ldr r1, _022E0800 ; =0x02353538
	mov r0, #0
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x400
	bl ov29_0234B0B4
	mov r0, #0
	mov r1, #0xb70
	mov r2, #1
	bl DisplayMessage2
_022E0698:
	ldr r0, _022E0800 ; =0x02353538
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
	ldr r1, _022E0800 ; =0x02353538
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
	ldr r0, _022E0800 ; =0x02353538
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
_022E0800: .word 0x02353538
_022E0804: .word 0x0000025E
_022E0808: .word 0x00000B71
_022E080C: .word 0x00000261
_022E0810: .word 0x00000B72
_022E0814: .word 0x00000266
_022E0818: .word 0x00000265
	arm_func_end TryForcedLoss

	arm_func_start ov29_022E081C
ov29_022E081C: ; 0x022E081C
	stmdb sp!, {r3, lr}
	ldr r0, _022E0860 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl GetMaxItemsAllowed
	cmp r0, #0
	bne _022E083C
	bl RemoveAllItems
_022E083C:
	ldr r0, _022E0860 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsMoneyAllowed
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl SetMoneyCarried
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0860: .word 0x02353538
	arm_func_end ov29_022E081C

	arm_func_start ov29_022E0864
ov29_022E0864: ; 0x022E0864
	cmp r0, #0
	beq _022E0878
	cmp r0, #0x51
	movlo r0, #1
	bxlo lr
_022E0878:
	mov r0, #0
	bx lr
	arm_func_end ov29_022E0864

	arm_func_start ov29_022E0880
ov29_022E0880: ; 0x022E0880
	ldr r0, _022E0898 ; =0x02353538
	ldr ip, _022E089C ; =ov29_022E0864
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda]
	bx ip
	.align 2, 0
_022E0898: .word 0x02353538
_022E089C: .word ov29_022E0864
	arm_func_end ov29_022E0880

	arm_func_start ov29_022E08A0
ov29_022E08A0: ; 0x022E08A0
	ldr r0, _022E08C8 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xb4
	blo _022E08C0
	cmp r0, #0xbe
	movls r0, #1
	bxls lr
_022E08C0:
	mov r0, #0
	bx lr
	.align 2, 0
_022E08C8: .word 0x02353538
	arm_func_end ov29_022E08A0

	arm_func_start FixedRoomIsSubstituteRoom
FixedRoomIsSubstituteRoom: ; 0x022E08CC
	ldr r0, _022E08F0 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda]
	cmp r0, #0x6e
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E08F0: .word 0x02353538
	arm_func_end FixedRoomIsSubstituteRoom

	arm_func_start ov29_022E08F4
ov29_022E08F4: ; 0x022E08F4
	ldr r0, _022E0924 ; =0x02353538
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E0924: .word 0x02353538
	arm_func_end ov29_022E08F4

	arm_func_start StoryRestrictionsEnabled
StoryRestrictionsEnabled: ; 0x022E0928
	ldr r0, _022E0958 ; =0x02353538
	ldr r1, [r0]
	ldrb r0, [r1, #0x75c]
	cmp r0, #0
	beq _022E0948
	ldrb r0, [r1, #0x75e]
	cmp r0, #0
	beq _022E0950
_022E0948:
	mov r0, #1
	bx lr
_022E0950:
	mov r0, #0
	bx lr
	.align 2, 0
_022E0958: .word 0x02353538
	arm_func_end StoryRestrictionsEnabled

	arm_func_start GetScenarioBalance__022E095C
GetScenarioBalance__022E095C: ; 0x022E095C
	ldr ip, _022E0964 ; =GetScenarioBalance__0204CB94
	bx ip
	.align 2, 0
_022E0964: .word GetScenarioBalance__0204CB94
	arm_func_end GetScenarioBalance__022E095C

	arm_func_start FadeToBlack
FadeToBlack: ; 0x022E0968
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov29_0233A248
	bl ov29_022E0DFC
	mov r0, #2
	mov r1, #0x1000
	mov r2, #0
	bl ov29_0234C668
	mov r0, #2
	mov r1, #0x1000
	mov r2, #1
	bl ov29_0234C668
	mov r0, #0
	bl ov29_0234C738
	bl ov29_022E0E44
	mov r0, #1
	bl ov29_0233A248
	bl ov29_022DE854
	bl ov29_022DE15C
	bl ov29_022E8778
	mov r0, #2
	mov r1, #0x4f
	bl ov29_022EA370
	mov r0, #1
	bl ov29_022E34B0
	mov r1, #1
	ldr r0, _022E09E4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x24d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E09E4: .word 0x02353538
	arm_func_end FadeToBlack

	arm_func_start ov29_022E09E8
ov29_022E09E8: ; 0x022E09E8
	ldr r2, _022E0A00 ; =0x02353538
	ldr r3, [r2]
	str r0, [r3, #0x18]
	ldr r0, [r2]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_022E0A00: .word 0x02353538
	arm_func_end ov29_022E09E8

	arm_func_start ov29_022E0A04
ov29_022E0A04: ; 0x022E0A04
	ldr r0, _022E0A14 ; =0x02353538
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_022E0A14: .word 0x02353538
	arm_func_end ov29_022E0A04

	arm_func_start ov29_022E0A18
ov29_022E0A18: ; 0x022E0A18
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov29_022E38E0
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_022E8BFC
	mov r0, #0
	bl SetMinimapDataE447
	ldr r0, _022E0A60 ; =0x02353538
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x24d]
	bl FadeToBlack
	mov r0, #0
	bl ov29_022E9FD0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0A60: .word 0x02353538
	arm_func_end ov29_022E0A18

	arm_func_start ov29_022E0A64
ov29_022E0A64: ; 0x022E0A64
	stmdb sp!, {r3, lr}
	ldr r1, _022E0B34 ; =0x0237C694
	mov r0, #0
	bl GetHeldButtons
	ldr r1, _022E0B38 ; =0x0237C696
	mov r0, #0
	bl GetPressedButtons
	ldr r1, _022E0B3C ; =0x0237C698
	mov r0, #0
	bl sub_020063F4
	ldr r0, _022E0B40 ; =0x0237C694
	mov r1, #0
	strh r1, [r0, #8]
	ldrh r1, [r0]
	tst r1, #2
	ldrsh r1, [r0, #0xa]
	beq _022E0AB8
	cmp r1, #0x64
	addlt r1, r1, #1
	strlth r1, [r0, #0xa]
	b _022E0ADC
_022E0AB8:
	cmp r1, #2
	blt _022E0AD0
	cmp r1, #0xc
	ldrlth r1, [r0, #8]
	orrlt r1, r1, #2
	strlth r1, [r0, #8]
_022E0AD0:
	ldr r0, _022E0B40 ; =0x0237C694
	mov r1, #0
	strh r1, [r0, #0xa]
_022E0ADC:
	ldr r0, _022E0B40 ; =0x0237C694
	ldrh r1, [r0]
	tst r1, #0x100
	ldrsh r1, [r0, #0xc]
	beq _022E0B00
	cmp r1, #0x64
	addlt r1, r1, #1
	strlth r1, [r0, #0xc]
	b _022E0B24
_022E0B00:
	cmp r1, #2
	blt _022E0B18
	cmp r1, #0xc
	ldrlth r1, [r0, #8]
	orrlt r1, r1, #0x100
	strlth r1, [r0, #8]
_022E0B18:
	ldr r0, _022E0B40 ; =0x0237C694
	mov r1, #0
	strh r1, [r0, #0xc]
_022E0B24:
	ldr r0, _022E0B40 ; =0x0237C694
	ldrh r1, [r0, #8]
	strh r1, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0B34: .word 0x0237C694
_022E0B38: .word 0x0237C696
_022E0B3C: .word 0x0237C698
_022E0B40: .word 0x0237C694
	arm_func_end ov29_022E0A64

	arm_func_start ov29_022E0B44
ov29_022E0B44: ; 0x022E0B44
	ldr r1, _022E0B58 ; =0x000003E7
	ldr r0, _022E0B5C ; =0x0237C694
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	bx lr
	.align 2, 0
_022E0B58: .word 0x000003E7
_022E0B5C: .word 0x0237C694
	arm_func_end ov29_022E0B44

	arm_func_start ov29_022E0B60
ov29_022E0B60: ; 0x022E0B60
	stmdb sp!, {r3, lr}
	bl sub_0204AE80
	cmp r0, #0
	beq _022E0C18
	ldr r0, _022E0C24 ; =0x0237C6A4
	bl GetReleasedStylus
	ldr r0, _022E0C28 ; =0x0237C6A4
	ldrb r1, [r0, #0x2c]
	cmp r1, #0
	beq _022E0B98
	ldrh r1, [r0]
	tst r1, #0x40
	moveq r1, #0
	streqb r1, [r0, #0x2c]
_022E0B98:
	ldr r0, _022E0C28 ; =0x0237C6A4
	mov r2, #0
	ldrh r3, [r0]
	strh r2, [r0, #0x24]
	tst r3, #0x80
	beq _022E0BD0
	ldrh r1, [r0, #0x24]
	tst r3, #0x1000
	orr r1, r1, #0x80
	strh r1, [r0, #0x24]
	str r2, [r0, #0x28]
	movne r1, #1
	strneb r1, [r0, #0x26]
	ldmia sp!, {r3, pc}
_022E0BD0:
	tst r3, #0x40
	beq _022E0C0C
	ldr r1, [r0, #0x28]
	cmp r1, #3
	bls _022E0C00
	ldrh r1, [r0, #0x24]
	tst r3, #0x1000
	orr r1, r1, #0x40
	strh r1, [r0, #0x24]
	movne r1, #1
	strneb r1, [r0, #0x26]
	ldmia sp!, {r3, pc}
_022E0C00:
	add r1, r1, #1
	str r1, [r0, #0x28]
	ldmia sp!, {r3, pc}
_022E0C0C:
	strb r2, [r0, #0x26]
	str r2, [r0, #0x28]
	ldmia sp!, {r3, pc}
_022E0C18:
	ldr r0, _022E0C24 ; =0x0237C6A4
	bl sub_02006BFC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0C24: .word 0x0237C6A4
_022E0C28: .word 0x0237C6A4
	arm_func_end ov29_022E0B60

	arm_func_start ov29_022E0C2C
ov29_022E0C2C: ; 0x022E0C2C
	ldr r1, _022E0C38 ; =0x0237C6A4
	strb r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_022E0C38: .word 0x0237C6A4
	arm_func_end ov29_022E0C2C

	arm_func_start ov29_022E0C3C
ov29_022E0C3C: ; 0x022E0C3C
	ldr r0, _022E0C48 ; =0x0237C6A4
	ldrb r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_022E0C48: .word 0x0237C6A4
	arm_func_end ov29_022E0C3C

	arm_func_start ov29_022E0C4C
ov29_022E0C4C: ; 0x022E0C4C
	stmdb sp!, {r3, lr}
	bl sub_02006564
	ldr r0, _022E0C60 ; =0x0237C6A4
	bl sub_02006BFC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0C60: .word 0x0237C6A4
	arm_func_end ov29_022E0C4C

	arm_func_start ov29_022E0C64
ov29_022E0C64: ; 0x022E0C64
	ldr r1, _022E0C7C ; =0x0237C6A4
	ldr r2, [r1, #4]
	ldr r1, [r1, #8]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0C7C: .word 0x0237C6A4
	arm_func_end ov29_022E0C64

	arm_func_start ov29_022E0C80
ov29_022E0C80: ; 0x022E0C80
	ldr r1, _022E0C98 ; =0x0237C6A4
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #0x10]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0C98: .word 0x0237C6A4
	arm_func_end ov29_022E0C80

	arm_func_start ov29_022E0C9C
ov29_022E0C9C: ; 0x022E0C9C
	ldr r1, _022E0CB4 ; =0x0237C6A4
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0CB4: .word 0x0237C6A4
	arm_func_end ov29_022E0C9C

	arm_func_start ov29_022E0CB8
ov29_022E0CB8: ; 0x022E0CB8
	stmdb sp!, {r3, lr}
	ldr lr, _022E0CF8 ; =0x0237C6B8
	ldr ip, [lr]
	cmp r0, ip
	bgt _022E0CE8
	cmp r2, ip
	blt _022E0CE8
	ldr r0, [lr, #4]
	cmp r1, r0
	bgt _022E0CE8
	cmp r3, r0
	bge _022E0CF0
_022E0CE8:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022E0CF0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0CF8: .word 0x0237C6B8
	arm_func_end ov29_022E0CB8

	arm_func_start ov29_022E0CFC
ov29_022E0CFC: ; 0x022E0CFC
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	bl ov29_022E0E8C
	mov r0, #0
	mov r2, r0
	mov r1, #1
	bl sub_02009454
	mov r0, #1
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #0x40
	mov r1, r0
	mov r2, #0
	bl sub_020094C4
	mov r0, #0
	mov r1, #2
	mov r2, #1
	bl sub_02009454
	mov r0, #1
	mov r1, #2
	mov r2, r0
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, #1
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #1
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #1
	bl sub_02009454
	mov r0, #0x40
	mov r1, r0
	mov r2, #1
	bl sub_020094C4
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E0CFC

	arm_func_start ov29_022E0DD8
ov29_022E0DD8: ; 0x022E0DD8
	ldr ip, _022E0DE0 ; =sub_02009194
	bx ip
	.align 2, 0
_022E0DE0: .word sub_02009194
	arm_func_end ov29_022E0DD8

	arm_func_start ov29_022E0DE4
ov29_022E0DE4: ; 0x022E0DE4
	ldr ip, _022E0DEC ; =sub_020091B0
	bx ip
	.align 2, 0
_022E0DEC: .word sub_020091B0
	arm_func_end ov29_022E0DE4

	arm_func_start ov29_022E0DF0
ov29_022E0DF0: ; 0x022E0DF0
	ldr ip, _022E0DF8 ; =sub_020091CC
	bx ip
	.align 2, 0
_022E0DF8: .word sub_020091CC
	arm_func_end ov29_022E0DF0

	arm_func_start ov29_022E0DFC
ov29_022E0DFC: ; 0x022E0DFC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl sub_020090A0
	mov r0, #1
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E0DFC

	arm_func_start ov29_022E0E44
ov29_022E0E44: ; 0x022E0E44
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r2, r0
	mov r1, #1
	bl sub_020090A0
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E0E44

	arm_func_start ov29_022E0E8C
ov29_022E0E8C: ; 0x022E0E8C
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r2, r0
	mov r1, #1
	bl sub_020090A0
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, #0
	bl sub_020090A0
	mov r0, #0
	mov r1, r0
	mov r2, #1
	bl sub_020090A0
	mov r0, #1
	mov r1, r0
	mov r2, r0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, #1
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, #1
	bl sub_020090A0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E0E8C

	arm_func_start ov29_022E0F14
ov29_022E0F14: ; 0x022E0F14
	ldr ip, _022E0F28 ; =sub_02008F3C
	mov r2, r0, lsl #0x14
	mov r0, r1
	mov r1, r2, asr #0x10
	bx ip
	.align 2, 0
_022E0F28: .word sub_02008F3C
	arm_func_end ov29_022E0F14

	arm_func_start ov29_022E0F2C
ov29_022E0F2C: ; 0x022E0F2C
	ldr r3, _022E0F64 ; =0x020AFC4C
	mov r2, #0x70
	ldr ip, [r3]
	ldr r3, _022E0F68 ; =0x020AFC28
	mla r2, r1, r2, ip
	ldrh r1, [r2, #0xc]
	ldr ip, [r2, #0x64]
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #30
	add r1, r2, r1, ror #30
	mov r1, r1, lsl #1
	ldrsh r1, [r3, r1]
	smlabb r0, r0, r1, ip
	bx lr
	.align 2, 0
_022E0F64: .word 0x020AFC4C
_022E0F68: .word 0x020AFC28
	arm_func_end ov29_022E0F2C

	arm_func_start ov29_022E0F6C
ov29_022E0F6C: ; 0x022E0F6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x74
	ldr r3, _022E11D0 ; =0x023510E0
	add r2, sp, #0x28
	mov r1, #0x16
_022E0F80:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E0F80
	ldr r1, _022E11D4 ; =0x000003E5
	add r2, sp, #8
	mov r0, #4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #8]
	add r0, sp, #0x14
	bl HandleSir0Translation
	mov r0, #0xb0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	add r0, sp, #0x54
	mov r2, #1
	mov r3, #0x20
	bl sub_0201F598
	ldr r0, _022E11D8 ; =0x020AFC4C
	add r1, sp, #0x54
	ldr r0, [r0]
	mov r2, #0
	bl sub_0201B43C
	add r0, sp, #8
	bl UnloadFile
	ldr r1, _022E11DC ; =0x000003E3
	mov r0, #4
	add r2, sp, #8
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #8]
	add r0, sp, #0x10
	bl HandleSir0Translation
	ldr r1, [sp, #0x10]
	mov r0, #0x1d0
	add r1, r1, #4
	str r1, [sp, #0x10]
	mov r1, #0
	bl ov29_022E0F2C
	mov r7, #0
	add r6, sp, #0x28
	mov r5, r7
	mov r4, #0xb
_022E1038:
	mov r0, r7, lsl #2
	add r1, r6, r7, lsl #2
	ldrsh r0, [r6, r0]
	ldrsh r8, [r1, #2]
	mov r1, r5
	bl ov29_022E0F2C
	ldr r1, [sp, #0x10]
	mov r3, r4
	mov r2, r8, lsl #1
	bl sub_0201BFF0
	mov r0, r8, asr #1
	add r0, r8, r0, lsr #30
	add r7, r7, #1
	ldr r1, [sp, #0x10]
	mov r0, r0, asr #2
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x10]
	cmp r7, #0xb
	blo _022E1038
	add r0, sp, #8
	bl UnloadFile
	ldr r1, _022E11E0 ; =0x000003E7
	add r2, sp, #8
	mov r0, #4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #8]
	add r0, sp, #0x18
	bl HandleSir0Translation
	mov r2, #0
	str r2, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, [sp, #0x18]
	add r0, sp, #0x64
	mov r3, #0x10
	bl sub_0201F598
	ldr r0, _022E11D8 ; =0x020AFC4C
	add r1, sp, #0x64
	ldr r0, [r0]
	mov r2, #0xc
	add r0, r0, #0x70
	bl sub_0201B43C
	add r0, sp, #8
	bl UnloadFile
	ldr r1, _022E11E4 ; =0x000003E6
	mov r0, #4
	add r2, sp, #8
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #8]
	add r0, sp, #0x1c
	bl HandleSir0Translation
	ldr r1, [sp, #0x1c]
	mov r0, #0x70
	add r1, r1, #4
	str r1, [sp, #0x1c]
	mov r1, #1
	bl ov29_022E0F2C
	ldr r1, [sp, #0x1c]
	mov r2, #0x80
	bl Memcpy32
	add r0, sp, #8
	bl UnloadFile
	ldr r2, _022E11E8 ; =0x02353544
	mov r0, #4
	mov r1, #0x3e4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, _022E11EC ; =0x02353540
	ldr r0, _022E11F0 ; =0x02353540
	ldr r1, [r1, #4]
	bl HandleSir0Translation
	add r0, sp, #0x20
	mov r1, #4
	mov r2, #0x400
	mov r3, #0
	bl LoadWteFromFileDirectory
	mov r6, #0
	mov r5, r6
	ldr r4, _022E11F4 ; =0x020AFC70
	b _022E11A8
_022E1180:
	ldr r0, [r4]
	ldr r1, [r1, #0x18]
	mov r2, r5
	mov r3, r6
	add r0, r0, #0xcc
	add r1, r1, r6, lsl #2
	bl sub_0201E380
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E11A8:
	ldr r1, [sp, #0x24]
	ldrsh r0, [r1, #0x1c]
	cmp r6, r0
	blt _022E1180
	add r0, sp, #0x20
	bl UnloadWte
	bl ov29_023356C0
	bl ov29_02335774
	add sp, sp, #0x74
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E11D0: .word 0x023510E0
_022E11D4: .word 0x000003E5
_022E11D8: .word 0x020AFC4C
_022E11DC: .word 0x000003E3
_022E11E0: .word 0x000003E7
_022E11E4: .word 0x000003E6
_022E11E8: .word 0x02353544
_022E11EC: .word 0x02353540
_022E11F0: .word 0x02353540
_022E11F4: .word 0x020AFC70
	arm_func_end ov29_022E0F6C

	arm_func_start ov29_022E11F8
ov29_022E11F8: ; 0x022E11F8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022E12EC ; =0x00000409
	add r2, sp, #4
	mov r0, #4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr lr, [sp]
	mov r4, #0
	ldr ip, _022E12F0 ; =0x0237C6D4
	b _022E1254
_022E1230:
	ldr r0, [lr, #8]
	add r2, ip, r4, lsl #2
	add r3, r0, r4, lsl #2
	mov r1, #4
_022E1240:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022E1240
	add r4, r4, #1
_022E1254:
	ldr r0, [lr, #0xc]
	cmp r4, r0
	blt _022E1230
	ldr r1, [lr, #4]
	mov r0, #0x120
	mul r4, r1, r0
	bl ov29_02336204
	cmp r0, #0
	bne _022E1298
	mov r0, #0x5000
	mov r1, #1
	mov r2, #0
	bl GetBgRegionArea
	ldr r1, [sp]
	mov r2, r4
	ldr r1, [r1]
	bl Memcpy32
_022E1298:
	mov r1, #0
	mov r2, r1
	mov r0, #0x5e00
	bl GetBgRegionArea
	mov r1, #0
	mov r2, #0x20
	bl Memset32
	mov r1, #0
	ldr r0, _022E12F4 ; =0x00005E20
	mov r2, r1
	bl GetBgRegionArea
	ldr r1, [sp]
	mov r2, #0x240
	ldr r1, [r1]
	add r1, r1, #0xc20
	add r1, r1, #0x1000
	bl Memcpy32
	add r0, sp, #4
	bl UnloadFile
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E12EC: .word 0x00000409
_022E12F0: .word 0x0237C6D4
_022E12F4: .word 0x00005E20
	arm_func_end ov29_022E11F8

	arm_func_start ov29_022E12F8
ov29_022E12F8: ; 0x022E12F8
	ldr ip, _022E1300 ; =ov29_022E11F8
	bx ip
	.align 2, 0
_022E1300: .word ov29_022E11F8
	arm_func_end ov29_022E12F8

	arm_func_start ov29_022E1304
ov29_022E1304: ; 0x022E1304
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	bl ov29_022E150C
	ldr r1, _022E14EC ; =0x000003FE
	add r2, sp, #8
	mov r0, #4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #8]
	add r0, sp, #0x10
	bl HandleSir0Translation
	ldr sb, [sp, #0x10]
	ldr r4, _022E14F0 ; =0x020AFC4C
	mov r8, #0
	mov r7, #0xd0
	mov r6, #0xff
	add r5, sp, #0x14
	mov fp, #1
_022E134C:
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, [sb, #8]
	mov r0, r5
	mov r2, fp
	mov r3, #0x10
	add r1, r1, r8, lsl #6
	bl sub_0201F598
	mov r1, r8, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r0, [r4]
	mov r1, r5
	bl sub_0201B43C
	add r8, r8, #1
	cmp r8, #0x10
	blt _022E134C
	ldr r4, [sp, #0x10]
	mov r0, #0x110
	mov r1, #0
	bl ov29_022E0F2C
	ldmia r4, {r1, r2}
	mov r2, r2, lsl #8
	mov r3, #0xd
	bl sub_0201BFF0
	add r0, sp, #8
	bl UnloadFile
	bl ov29_022E11F8
	mov r5, #0
	ldr r2, _022E14F4 ; =0x022C4D54
	ldr fp, _022E14F8 ; =0x02353538
	ldr r8, _022E14FC ; =0x00011EC8
	mov r6, #0x280
	mov r3, r5
	mov sb, #0x12
_022E13D4:
	mul r7, r5, sb
	mov r0, r5, lsl #1
	ldrsh r1, [r2, r0]
	mov r4, r3
_022E13E4:
	ldr ip, [fp]
	orr r0, r6, r1, lsl #12
	add ip, r7, ip
	add ip, ip, r4, lsl #1
	add r4, r4, #1
	strh r0, [ip, r8]
	cmp r4, #9
	add r6, r6, #1
	blt _022E13E4
	add r5, r5, #1
	cmp r5, #0x22
	blt _022E13D4
	orr r0, r6, #0xf000
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	ldr r1, _022E14F8 ; =0x02353538
	ldr r0, _022E1500 ; =0x00012A92
	mov r4, #0
_022E142C:
	ldr r2, [r1]
	add r2, r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r2, r0]
	cmp r4, #9
	blt _022E142C
	ldr r3, _022E1504 ; =0x0000F2F0
	ldr r1, _022E14F8 ; =0x02353538
	ldr r0, _022E1508 ; =0x0001212C
	mov r6, #0x2f0
	mov r4, #0
_022E1458:
	ldr r2, [r1]
	add r2, r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r2, r0]
	cmp r4, #9
	blt _022E1458
	ldr r2, _022E14F4 ; =0x022C4D54
	ldr ip, _022E14F8 ; =0x02353538
	ldr sb, _022E1508 ; =0x0001212C
	add r6, r6, #1
	mov r7, #1
	mov r3, #0x1a
	mov r4, #0x19
	mov fp, #0x12
_022E1490:
	cmp r7, #1
	moveq sl, r4
	beq _022E14A4
	cmp r7, #2
	moveq sl, r3
_022E14A4:
	mul r5, r7, fp
	mov r0, sl, lsl #1
	ldrsh r1, [r2, r0]
	mov r8, #0
_022E14B4:
	ldr lr, [ip]
	orr r0, r6, r1, lsl #12
	add lr, r5, lr
	add lr, lr, r8, lsl #1
	strh r0, [lr, sb]
	add r8, r8, #1
	cmp r8, #9
	add r6, r6, #1
	blt _022E14B4
	add r7, r7, #1
	cmp r7, #3
	blt _022E1490
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E14EC: .word 0x000003FE
_022E14F0: .word 0x020AFC4C
_022E14F4: .word 0x022C4D54
_022E14F8: .word 0x02353538
_022E14FC: .word 0x00011EC8
_022E1500: .word 0x00012A92
_022E1504: .word 0x0000F2F0
_022E1508: .word 0x0001212C
	arm_func_end ov29_022E1304

	arm_func_start ov29_022E150C
ov29_022E150C: ; 0x022E150C
	ldr r0, _022E154C ; =0x02353538
	mov r3, #0
_022E1514:
	ldr r1, [r0]
	and r2, r3, #0xff
	add r1, r1, r3, lsl #2
	strb r2, [r1, #0x1e0]
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	strb r2, [r1, #0x1e1]
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	strb r2, [r1, #0x1e2]
	cmp r3, #0x100
	blt _022E1514
	bx lr
	.align 2, 0
_022E154C: .word 0x02353538
	arm_func_end ov29_022E150C

	arm_func_start ov29_022E1550
ov29_022E1550: ; 0x022E1550
	stmdb sp!, {r3, lr}
	bl GetFloorType
	cmp r0, #0
	bne _022E1590
	ldr r0, _022E15C4 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, _022E15C4 ; =0x02353538
	movne r1, #0x1c
	ldr r0, [r0]
	moveq r1, #0x1b
	add r0, r0, #0x4000
	strh r1, [r0, #0xd8]
	ldmia sp!, {r3, pc}
_022E1590:
	cmp r0, #1
	ldrne r0, _022E15C4 ; =0x02353538
	movne r1, #0x1d
	ldrne r0, [r0]
	addne r0, r0, #0x4000
	strneh r1, [r0, #0xd8]
	ldmneia sp!, {r3, pc}
	ldr r0, _022E15C4 ; =0x02353538
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E15C4: .word 0x02353538
	arm_func_end ov29_022E1550

	arm_func_start ov29_022E15C8
ov29_022E15C8: ; 0x022E15C8
	stmdb sp!, {r3, lr}
	ldr r0, _022E15FC ; =0x02353540
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022E15E4
	ldr r0, _022E1600 ; =0x02353544
	bl UnloadFile
_022E15E4:
	bl ov29_02335760
	bl ov29_02335804
	ldr r0, _022E15FC ; =0x02353540
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E15FC: .word 0x02353540
_022E1600: .word 0x02353544
	arm_func_end ov29_022E15C8

	arm_func_start ov29_022E1604
ov29_022E1604: ; 0x022E1604
	bx lr
	arm_func_end ov29_022E1604

	arm_func_start ov29_022E1608
ov29_022E1608: ; 0x022E1608
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1608

	arm_func_start ov29_022E1610
ov29_022E1610: ; 0x022E1610
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1610

	arm_func_start ov29_022E1618
ov29_022E1618: ; 0x022E1618
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1618

	arm_func_start ov29_022E1620
ov29_022E1620: ; 0x022E1620
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1620

	arm_func_start GetTileAtEntity
GetTileAtEntity: ; 0x022E1628
	ldr ip, _022E163C ; =GetTileSafe
	mov r1, r0
	ldrsh r0, [r1, #4]
	ldrsh r1, [r1, #6]
	bx ip
	.align 2, 0
_022E163C: .word GetTileSafe
	arm_func_end GetTileAtEntity

	arm_func_start ov29_022E1640
ov29_022E1640: ; 0x022E1640
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, #0
	ldr r4, _022E1848 ; =0x02353538
	mov r5, r6
	mov r8, r6
	mov r7, #0xb8
_022E1658:
	ldr r2, [r4]
	add r0, r2, #0x1cc
	add r0, r0, #0x12c00
	mla r1, r6, r7, r0
	add r0, r2, r6, lsl #2
	add r0, r0, #0x12000
	str r1, [r0, #0xb28]
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	str r5, [r0]
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	add r0, r0, #0x2c
	bl sub_0201C0CC
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	add r6, r6, #1
	strh r8, [r0, #0xa8]
	cmp r6, #4
	blt _022E1658
	ldr r0, _022E184C ; =0x0237C754
	mov r7, #0
_022E16C8:
	strb r7, [r0, r8]
	add r8, r8, #1
	cmp r8, #0x48
	blt _022E16C8
	mov r5, #0
	ldr r4, _022E1848 ; =0x02353538
	mov r6, r5
	mov r8, #0xb8
_022E16E8:
	ldr r2, [r4]
	add r0, r2, #0xac
	add r0, r0, #0x13000
	mla r1, r7, r8, r0
	add r0, r2, r7, lsl #2
	add r0, r0, #0x12000
	str r1, [r0, #0xb38]
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38]
	str r5, [r0]
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38]
	add r0, r0, #0x2c
	bl sub_0201C0CC
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38]
	add r7, r7, #1
	strh r6, [r0, #0xa8]
	cmp r7, #0x10
	blt _022E16E8
	ldr r0, _022E1850 ; =0x0237C79C
	mov r3, #0
_022E1758:
	strb r3, [r0, r6]
	add r6, r6, #1
	cmp r6, #0xae
	blt _022E1758
	ldr r2, _022E1848 ; =0x02353538
	mov r0, #0
_022E1770:
	ldr r1, [r2]
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
	add r3, r3, #1
	str r0, [r1, #0xb78]
	cmp r3, #0x14
	blt _022E1770
	ldr r4, _022E1848 ; =0x02353538
	mov r1, #0
	mov r3, #0xb8
_022E1798:
	ldr r6, [r4]
	add r2, r6, #0x2c
	add r2, r2, #0x13c00
	mla r5, r0, r3, r2
	add r2, r6, r0, lsl #2
	add r2, r2, #0x12000
	str r5, [r2, #0xbc8]
	ldr r2, [r4]
	add r2, r2, r0, lsl #2
	add r2, r2, #0x12000
	ldr r2, [r2, #0xbc8]
	add r0, r0, #1
	str r1, [r2]
	cmp r0, #0x40
	blt _022E1798
	ldr r4, _022E1848 ; =0x02353538
	mov r0, #0
	mov r3, #0xb8
_022E17E0:
	ldr r6, [r4]
	add r2, r6, #0x22c
	add r2, r2, #0x16800
	mla r5, r1, r3, r2
	add r2, r6, r1, lsl #2
	add r2, r2, #0x12000
	str r5, [r2, #0xcc8]
	ldr r2, [r4]
	add r2, r2, r1, lsl #2
	add r2, r2, #0x12000
	ldr r2, [r2, #0xcc8]
	add r1, r1, #1
	str r0, [r2]
	cmp r1, #0x40
	blt _022E17E0
	ldr r2, _022E1848 ; =0x02353538
	ldr r4, [r2]
	add r1, r4, #0x2c
	add r3, r1, #0x19800
	add r1, r4, #0x12000
	str r3, [r1, #0xdc8]
	ldr r1, [r2]
	add r1, r1, #0x12000
	ldr r1, [r1, #0xdc8]
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1848: .word 0x02353538
_022E184C: .word 0x0237C754
_022E1850: .word 0x0237C79C
	arm_func_end ov29_022E1640

	arm_func_start ov29_022E1854
ov29_022E1854: ; 0x022E1854
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r4, _022E1A18 ; =0x02353538
	ldr r0, [r4]
	add r0, r0, #0x1a000
	ldrb r1, [r0, #0x23e]
	ldrb r8, [r0, #0x245]
	cmp r1, #0
	beq _022E1900
	mov r6, #0
	add r8, sp, #4
	mov r7, r6
_022E1884:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78]
	mov r0, r5
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E18F0
	ldr r0, [r4]
	add r0, r0, #0x1a000
	ldr r0, [r0, #0x22c]
	cmp r5, r0
	mov r0, r5
	bne _022E18C4
	bl ov29_02303F18
	b _022E18F0
_022E18C4:
	ldr sb, [r5, #0xb4]
	bl ov29_023046E8
	mov r0, r8
	mov r1, r5
	bl ov29_022E3A40
	str r7, [sp]
	ldrsh r1, [sb, #4]
	ldr r0, [sb, #0xb0]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	bl ov29_022DD7D8
_022E18F0:
	add r6, r6, #1
	cmp r6, #0x14
	blt _022E1884
	b _022E1A10
_022E1900:
	mov r5, #0
	mov r6, r5
_022E1908:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E196C
	ldr r0, [r7]
	cmp r0, #1
	bne _022E196C
	mov r0, r7
	bl ov29_02303F18
	ldr r0, [r7, #0xb4]
	ldrb r0, [r0, #0x165]
	cmp r0, #0
	bne _022E196C
	mov r2, r6, lsl #0x10
	mov r0, r7
	mov r1, r5
	mov r2, r2, asr #0x10
	bl ov29_022E8270
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022E196C:
	add r6, r6, #1
	cmp r6, #4
	blt _022E1908
	ldr r4, _022E1A18 ; =0x02353538
	mov r5, #0
_022E1980:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb38]
	mov r0, r6
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E19A8
	mov r0, r6
	bl ov29_02303F18
_022E19A8:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E1980
	mov sb, #0
	mov r7, sb
	mov r6, #1
	mov r5, #0xff
	ldr r4, _022E1A18 ; =0x02353538
	b _022E19F0
_022E19CC:
	add r0, r1, sb, lsl #2
	str r7, [sp]
	add r0, r0, #0x12000
	ldr r0, [r0, #0xbc8]
	mov r1, r8
	mov r2, r6
	mov r3, r5
	bl ov29_023457C8
	add sb, sb, #1
_022E19F0:
	ldr r1, [r4]
	add r0, r1, #0x3f00
	ldrsh r0, [r0, #0xc0]
	cmp sb, r0
	blt _022E19CC
	cmp r8, #0
	beq _022E1A10
	bl ov29_022ED9D0
_022E1A10:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E1A18: .word 0x02353538
	arm_func_end ov29_022E1854

	arm_func_start EntityIsValid__022E1A1C
EntityIsValid__022E1A1C: ; 0x022E1A1C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end EntityIsValid__022E1A1C

	arm_func_start ov29_022E1A40
ov29_022E1A40: ; 0x022E1A40
	cmp r1, #0
	ldrne r2, [r1]
	strne r2, [r0, #0xc]
	ldrne r1, [r1, #4]
	bne _022E1A7C
	ldrsh r2, [r0, #4]
	mov r1, #0x18
	smulbb r2, r2, r1
	add r2, r2, #0xc
	mov r2, r2, lsl #8
	str r2, [r0, #0xc]
	ldrsh r2, [r0, #6]
	smulbb r1, r2, r1
	add r1, r1, #0x10
	mov r1, r1, lsl #8
_022E1A7C:
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov29_022E1A40

	arm_func_start ov29_022E1A84
ov29_022E1A84: ; 0x022E1A84
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	bx lr
	arm_func_end ov29_022E1A84

	arm_func_start ov29_022E1A90
ov29_022E1A90: ; 0x022E1A90
	ldr r3, [r0, #0xc]
	add r1, r3, r1
	str r1, [r0, #0xc]
	ldr r1, [r0, #0x10]
	add r1, r1, r2
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov29_022E1A90

	arm_func_start ov29_022E1AAC
ov29_022E1AAC: ; 0x022E1AAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetSpriteSize
	mov r4, r0
	mov r0, r5
	bl ov29_022DE954
	cmp r0, #0
	movne r4, r4, lsl #1
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E1AAC

	arm_func_start ov29_022E1AD4
ov29_022E1AD4: ; 0x022E1AD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r0, [r0, #0x17b]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E1AD4

	arm_func_start ov29_022E1AF4
ov29_022E1AF4: ; 0x022E1AF4
	ldr r2, _022E1B24 ; =0x0237C754
	mov r3, #0
	add ip, r2, r0
	mov r2, #1
	b _022E1B18
_022E1B08:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	strb r2, [ip, r3]
	mov r3, r0, lsr #0x10
_022E1B18:
	cmp r3, r1
	blo _022E1B08
	bx lr
	.align 2, 0
_022E1B24: .word 0x0237C754
	arm_func_end ov29_022E1AF4

	arm_func_start ov29_022E1B28
ov29_022E1B28: ; 0x022E1B28
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r5, r4
_022E1B38:
	ldr r0, _022E1C04 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E1BD8
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl GetSpriteSize
	mov r6, r0
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE954
	cmp r0, #0
	add r0, r4, #0x1a
	strh r0, [r7, #0xac]
	ldr r0, [r7, #0xb4]
	movne r6, r6, lsl #1
	strb r4, [r0, #0x17a]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x17b]
	mov r1, #1
	ldr r0, _022E1C08 ; =0x0237C754
	b _022E1BB4
_022E1BA4:
	cmp r4, #0x48
	strltb r1, [r0, r4]
	addlt r4, r4, #1
	add r2, r2, #1
_022E1BB4:
	cmp r2, r6
	blt _022E1BA4
	cmp r8, #0
	beq _022E1BD8
	mov r0, r7
	bl GetSleepAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
_022E1BD8:
	add r5, r5, #1
	cmp r5, #4
	blt _022E1B38
	mov r1, #0
	ldr r0, _022E1C08 ; =0x0237C754
	b _022E1BF8
_022E1BF0:
	strb r1, [r0, r4]
	add r4, r4, #1
_022E1BF8:
	cmp r4, #0x48
	blt _022E1BF0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1C04: .word 0x02353538
_022E1C08: .word 0x0237C754
	arm_func_end ov29_022E1B28

	arm_func_start ov29_022E1C0C
ov29_022E1C0C: ; 0x022E1C0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r7, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrne r5, _022E1C7C ; =0x0237C79C
	ldreq r5, _022E1C80 ; =0x0237C754
	cmp r6, #0
	beq _022E1C48
	ldrb r0, [r7, #0xaa]
	bl ov29_022DEA1C
_022E1C48:
	mov r3, #0
	mov r2, r3
	b _022E1C6C
_022E1C54:
	ldrb r1, [r4, #0x17a]
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r5, r1
	strb r2, [r3, r1]
	mov r3, r0, asr #0x10
_022E1C6C:
	ldrb r0, [r4, #0x17b]
	cmp r3, r0
	blt _022E1C54
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E1C7C: .word 0x0237C79C
_022E1C80: .word 0x0237C754
	arm_func_end ov29_022E1C0C

	arm_func_start ov29_022E1C84
ov29_022E1C84: ; 0x022E1C84
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r0, r2
	mov r6, r1
	mvn r4, #0
	bl GetSpriteSize
	mov r5, r0
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov29_022DE954
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r3, #0
	rsb ip, r5, #0x48
	mov r2, r3
	ldr r1, _022E1D28 ; =0x0237C754
	b _022E1D04
_022E1CD0:
	mov r8, r2
	add lr, r1, r3
	b _022E1CEC
_022E1CDC:
	ldrb r0, [lr, r8]
	cmp r0, #0
	bne _022E1CF4
	add r8, r8, #1
_022E1CEC:
	cmp r8, r5
	blt _022E1CDC
_022E1CF4:
	cmp r8, r5
	moveq r4, r3
	beq _022E1D0C
	add r3, r3, #1
_022E1D04:
	cmp r3, ip
	ble _022E1CD0
_022E1D0C:
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0
	strne r4, [r7]
	strne r5, [r6]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1D28: .word 0x0237C754
	arm_func_end ov29_022E1C84

	arm_func_start ov29_022E1D2C
ov29_022E1D2C: ; 0x022E1D2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mvn r1, #0
	mov r0, #1
	str r1, [sp, #8]
	bl ov29_022DEA10
	mov r6, r0
	mov r1, r8
	mov r0, #0
	bl ov29_022F9408
	bl GetSpriteIndex__022F7388
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r6, [sp]
	bl ov29_022E1C84
	cmp r0, #0
	moveq r0, #0
	beq _022E1EB8
	mov r5, #0
	ldr sb, _022E1EC0 ; =0x02353538
	b _022E1EAC
_022E1D90:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E1EA8
	mov r0, #1
	str r0, [r7]
	ldr r0, _022E1EC0 ; =0x02353538
	strb r5, [r7, #0x24]
	ldr r0, [r0]
	add r1, r5, r5, lsl #3
	add r0, r0, #0x3f4
	add r0, r0, #0x400
	add r0, r0, r1, lsl #6
	str r0, [r7, #0xb4]
	strh r8, [r0, #2]
	mov r1, r8
	mov r0, #0
	bl ov29_022F9408
	ldr r1, [r7, #0xb4]
	mov r2, #0
	strh r0, [r1, #4]
	ldr r1, [r7, #0xb4]
	and r0, r6, #0xff
	strb r2, [r1, #6]
	ldr r1, [r7, #0xb4]
	strb r2, [r1, #8]
	strh r4, [r7, #0xa8]
	strb r6, [r7, #0xaa]
	bl ov29_022DE9F8
	ldr r1, [sp, #8]
	mov r0, #7
	add r1, r1, #0x1a
	strh r1, [r7, #0xac]
	strb r0, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0x28]
	strb r1, [r7, #0xb0]
	mov r0, #0xff
	strb r0, [r7, #0xaf]
	mov r0, #1
	strb r0, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	str r1, [r7, #0x1c]
	bl ov29_022E2978
	ldr r1, [sp, #8]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17b]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1AF4
	ldr r1, _022E1EC0 ; =0x02353538
	mov r0, r7
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrh r3, [r1, #0x88]
	add r2, r3, #1
	strh r2, [r1, #0x88]
	strh r3, [r7, #0x26]
	b _022E1EB8
_022E1EA8:
	add r5, r5, #1
_022E1EAC:
	cmp r5, #4
	blt _022E1D90
	mov r0, #0
_022E1EB8:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E1EC0: .word 0x02353538
	arm_func_end ov29_022E1D2C

	arm_func_start ov29_022E1EC4
ov29_022E1EC4: ; 0x022E1EC4
	ldr r2, _022E1EF4 ; =0x0237C79C
	mov r3, #0
	add ip, r2, r0
	mov r2, #1
	b _022E1EE8
_022E1ED8:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	strb r2, [ip, r3]
	mov r3, r0, lsr #0x10
_022E1EE8:
	cmp r3, r1
	blo _022E1ED8
	bx lr
	.align 2, 0
_022E1EF4: .word 0x0237C79C
	arm_func_end ov29_022E1EC4

	arm_func_start ov29_022E1EF8
ov29_022E1EF8: ; 0x022E1EF8
	mov r0, #0
	ldr r2, _022E1F30 ; =0x0237C79C
	mov r3, r0
_022E1F04:
	ldrb r1, [r2, r3]
	cmp r1, #0
	add r1, r3, #1
	addeq r0, r0, #1
	mov r1, r1, lsl #0x10
	moveq r0, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	moveq r0, r0, asr #0x10
	cmp r3, #0xae
	blo _022E1F04
	bx lr
	.align 2, 0
_022E1F30: .word 0x0237C79C
	arm_func_end ov29_022E1EF8

	arm_func_start ov29_022E1F34
ov29_022E1F34: ; 0x022E1F34
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r5, r4
_022E1F44:
	ldr r0, _022E2010 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E1FE4
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl GetSpriteSize
	mov r6, r0
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE954
	cmp r0, #0
	add r0, r4, #0x62
	strh r0, [r7, #0xac]
	ldr r0, [r7, #0xb4]
	movne r6, r6, lsl #1
	strb r5, [r0, #0x17a]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r6, [r0, #0x17b]
	mov r1, #1
	ldr r0, _022E2014 ; =0x0237C79C
	b _022E1FC0
_022E1FB0:
	cmp r4, #0xae
	strltb r1, [r0, r4]
	addlt r4, r4, #1
	add r2, r2, #1
_022E1FC0:
	cmp r2, r6
	blt _022E1FB0
	cmp r8, #0
	beq _022E1FE4
	mov r0, r7
	bl GetSleepAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
_022E1FE4:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E1F44
	mov r1, #0
	ldr r0, _022E2014 ; =0x0237C79C
	b _022E2004
_022E1FFC:
	strb r1, [r0, r4]
	add r4, r4, #1
_022E2004:
	cmp r4, #0xae
	blt _022E1FFC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E2010: .word 0x02353538
_022E2014: .word 0x0237C79C
	arm_func_end ov29_022E1F34

	arm_func_start ov29_022E2018
ov29_022E2018: ; 0x022E2018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r0, r2
	mov r6, r1
	mvn r4, #0
	bl GetSpriteSize
	mov r5, r0
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov29_022DE954
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r3, #0
	rsb ip, r5, #0xae
	mov r2, r3
	ldr r1, _022E20BC ; =0x0237C79C
	b _022E2098
_022E2064:
	mov r8, r2
	add lr, r1, r3
	b _022E2080
_022E2070:
	ldrb r0, [lr, r8]
	cmp r0, #0
	bne _022E2088
	add r8, r8, #1
_022E2080:
	cmp r8, r5
	blt _022E2070
_022E2088:
	cmp r8, r5
	moveq r4, r3
	beq _022E20A0
	add r3, r3, #1
_022E2098:
	cmp r3, ip
	ble _022E2064
_022E20A0:
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0
	strne r4, [r7]
	strne r5, [r6]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E20BC: .word 0x0237C79C
	arm_func_end ov29_022E2018

	arm_func_start ov29_022E20C0
ov29_022E20C0: ; 0x022E20C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r0, #2
	bl ov29_022DEA10
	mov r6, r0
	mov r1, r8
	mov r0, #0
	bl ov29_022F9408
	mov r4, r0
	bl GetSpriteIndex__022F7388
	mov r3, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	str r6, [sp]
	bl ov29_022E2018
	cmp r0, #0
	moveq r0, #0
	beq _022E2254
	mov r5, #0
	ldr sb, _022E225C ; =0x02353538
	b _022E2248
_022E211C:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E2244
	mov r0, #1
	str r0, [r7]
	strb r5, [r7, #0x24]
	mov r0, #0
	ldr r1, _022E225C ; =0x02353538
	strb r0, [r7, #0x22]
	ldr r1, [r1]
	add r2, r5, r5, lsl #3
	add r1, r1, #0xf4
	add r1, r1, #0x1000
	add r2, r1, r2, lsl #6
	str r2, [r7, #0xb4]
	mov r1, r8
	strh r8, [r2, #2]
	bl ov29_022F9408
	ldr r2, [r7, #0xb4]
	mov r1, #1
	strh r0, [r2, #4]
	ldr r0, [r7, #0xb4]
	mov r2, #0
	strb r1, [r0, #6]
	ldr r1, [r7, #0xb4]
	mov r0, r4
	strb r2, [r1, #8]
	bl GetSpriteIndex__022F7388
	strh r0, [r7, #0xa8]
	strb r6, [r7, #0xaa]
	ldr r0, [sp, #8]
	add r0, r0, #0x62
	strh r0, [r7, #0xac]
	ldrb r0, [r7, #0xaa]
	bl ov29_022DE9F8
	mov r0, #7
	strb r0, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0x28]
	strb r1, [r7, #0xb0]
	mov r0, #0xff
	strb r0, [r7, #0xaf]
	mov r0, #1
	strb r0, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	str r1, [r7, #0x1c]
	ldr r1, [sp, #8]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17b]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
	bl ov29_022E2978
	ldr r1, _022E225C ; =0x02353538
	mov r0, r7
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrh r3, [r1, #0x88]
	add r2, r3, #1
	strh r2, [r1, #0x88]
	strh r3, [r7, #0x26]
	b _022E2254
_022E2244:
	add r5, r5, #1
_022E2248:
	cmp r5, #0x10
	blt _022E211C
	mov r0, #0
_022E2254:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E225C: .word 0x02353538
	arm_func_end ov29_022E20C0

	arm_func_start ov29_022E2260
ov29_022E2260: ; 0x022E2260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	mov r5, #0
	ldr r4, _022E2310 ; =0x02353538
	b _022E2300
_022E2280:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xcc8]
	mov r0, r6
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E22FC
	mov r1, #2
	ldr r0, _022E2310 ; =0x02353538
	str r1, [r6]
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x3c4
	add r0, r0, #0x3c00
	add r0, r0, r5, lsl #2
	str r0, [r6, #0xb4]
	strb sl, [r0]
	ldr r1, [r6, #0xb4]
	mov r0, r6
	strb r8, [r1, #1]
	ldr r1, [r6, #0xb4]
	strb r7, [r1, #2]
	str r2, [r6, #0x1c]
	strb r2, [r6, #0x22]
	ldrh r1, [sb]
	strh r1, [r6, #4]
	ldrh r1, [sb, #2]
	strh r1, [r6, #6]
	strh r2, [r6, #0x26]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022E22FC:
	add r5, r5, #1
_022E2300:
	cmp r5, #0x40
	blt _022E2280
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E2310: .word 0x02353538
	arm_func_end ov29_022E2260

	arm_func_start ov29_022E2314
ov29_022E2314: ; 0x022E2314
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022E2410 ; =0x02353538
	ldr r2, _022E2414 ; =0x020A1AE8
	ldr r1, [r1]
	mov r6, r0
	add r0, r1, #0x4000
	ldrsh r0, [r0, #0xd4]
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _022E235C
	ldrsh r0, [r6]
	ldrsh r1, [r6, #2]
	bl GetTileSafe
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022E235C:
	mov r4, #0
	ldr r7, _022E2410 ; =0x02353538
	b _022E2400
_022E2368:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xbc8]
	mov r0, r5
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	bne _022E23FC
	ldr r0, _022E2410 ; =0x02353538
	mov r1, #3
	str r1, [r5]
	ldr r1, [r0]
	mov r0, #6
	add r1, r1, #0x3e40
	mla r0, r4, r0, r1
	str r0, [r5, #0xb4]
	ldrh r0, [r6]
	mov r1, #0x18
	mov r2, #0
	strh r0, [r5, #4]
	ldrh r3, [r6, #2]
	mov r0, r5
	strh r3, [r5, #6]
	ldrsh r3, [r6]
	ldrsh r4, [r6, #2]
	smulbb r3, r3, r1
	smulbb r4, r4, r1
	add r1, r3, #4
	mov r1, r1, lsl #8
	add r3, r4, #4
	str r1, [r5, #0xc]
	mov r1, r3, lsl #8
	str r1, [r5, #0x10]
	strh r2, [r5, #0x26]
	strb r2, [r5, #0x22]
	str r2, [r5, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E23FC:
	add r4, r4, #1
_022E2400:
	cmp r4, #0x40
	blt _022E2368
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E2410: .word 0x02353538
_022E2414: .word 0x020A1AE8
	arm_func_end ov29_022E2314

	arm_func_start ov29_022E2418
ov29_022E2418: ; 0x022E2418
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_023386D8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022E246C ; =0x02353538
	mov r1, #5
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x12000
	ldr r0, [r0, #0xdc8]
	str r1, [r0]
	str r2, [r0, #0x1c]
	strb r2, [r0, #0x22]
	ldrh r1, [r4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	strh r2, [r0, #0x26]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E246C: .word 0x02353538
	arm_func_end ov29_022E2418

	arm_func_start ov29_022E2470
ov29_022E2470: ; 0x022E2470
	mov r1, #6
	str r1, [r0]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	strh r1, [r0, #0x26]
	strb r1, [r0, #0x22]
	bx lr
	arm_func_end ov29_022E2470

	arm_func_start ov29_022E2498
ov29_022E2498: ; 0x022E2498
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _022E2560
	cmp r0, #1
	beq _022E24C0
	cmp r0, #6
	beq _022E2560
	b _022E2568
_022E24C0:
	ldrb r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022E2570 ; =0x02353538
	ldr r2, [r5, #0xb4]
	ldr r0, [r0]
	ldrb r1, [r2, #6]
	add r0, r0, #0x21c
	add r4, r0, #0x1a000
	ldr r0, [r4, #0x10]
	cmp r1, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x28]
	cmp r1, #0
	ldreqb r1, [r2, #0xef]
	cmpeq r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x34]
	cmp r1, #0
	bne _022E252C
	ldrb r1, [r4, #0x23]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_022E252C:
	ldrb r1, [r4, #0x26]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r4
	add r1, r5, #4
	bl ov29_022E90CC
	ldmia sp!, {r3, r4, r5, pc}
_022E2560:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022E2568:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E2570: .word 0x02353538
	arm_func_end ov29_022E2498

	arm_func_start ov29_022E2574
ov29_022E2574: ; 0x022E2574
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb r5, [r0, #0x20]
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr lr, [r0]
	cmp r1, #0
	movne r6, #0x40
	moveq r6, #0x20
	cmp lr, #2
	bne _022E25D8
	ldr r2, _022E2724 ; =0x02353538
	ldr r3, _022E2728 ; =0x0001A224
	ldr r4, [r2]
	add r8, r3, #2
	ldrsh ip, [r0, #4]
	mov r7, #0x18
	ldrsh r2, [r0, #6]
	ldrsh r3, [r4, r3]
	smulbb ip, ip, r7
	ldrsh r8, [r4, r8]
	smulbb r7, r2, r7
	sub r2, ip, r3
	sub r7, r7, r8
	b _022E2600
_022E25D8:
	ldr r3, _022E2724 ; =0x02353538
	ldr r2, _022E2728 ; =0x0001A224
	ldr r4, [r3]
	add r3, r2, #2
	ldrsh r2, [r4, r2]
	ldr r8, [r0, #0xc]
	ldrsh r3, [r4, r3]
	ldr r7, [r0, #0x10]
	rsb r2, r2, r8, asr #8
	rsb r7, r3, r7, asr #8
_022E2600:
	rsb r3, r6, #0
	cmp r2, r3
	cmpge r7, r3
	blt _022E271C
	add r3, r6, #0xff
	cmp r2, r3
	addle r2, r6, #0xc0
	cmple r7, r2
	bgt _022E271C
	add r2, r4, #0x21c
	cmp lr, #6
	add r6, r2, #0x1a000
	addls pc, pc, lr, lsl #2
	b _022E2714
_022E2638: ; jump table
	b _022E270C ; case 0
	b _022E267C ; case 1
	b _022E26F0 ; case 2
	b _022E2654 ; case 3
	b _022E2714 ; case 4
	b _022E2714 ; case 5
	b _022E270C ; case 6
_022E2654:
	ldrb r1, [r6, #0x27]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r0, #4
	bl ov29_022E2CA0
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E267C:
	ldr r3, [r0, #0xb4]
	ldrb r2, [r3, #6]
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r2, r4, #0x1a000
	ldrb r2, [r2, #0x244]
	cmp r2, #0
	ldreqb r2, [r3, #0xef]
	cmpeq r2, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r2, [r6, #0x26]
	cmp r2, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r1, #0
	add r0, r0, #4
	beq _022E26DC
	bl ov29_022E2D3C
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E26DC:
	bl ov29_022E2CA0
	cmp r0, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E26F0:
	add r0, r4, #0x1a000
	ldrb r0, [r0, #0x244]
	cmp r0, #0
	cmpeq r5, #0
	bne _022E2714
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E270C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E2714:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E271C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E2724: .word 0x02353538
_022E2728: .word 0x0001A224
	arm_func_end ov29_022E2574

	arm_func_start ov29_022E272C
ov29_022E272C: ; 0x022E272C
	ldr ip, _022E2738 ; =ov29_022E2574
	mov r1, #0
	bx ip
	.align 2, 0
_022E2738: .word ov29_022E2574
	arm_func_end ov29_022E272C

	arm_func_start ov29_022E273C
ov29_022E273C: ; 0x022E273C
	ldr ip, _022E2748 ; =ov29_022E2574
	mov r1, #1
	bx ip
	.align 2, 0
_022E2748: .word ov29_022E2574
	arm_func_end ov29_022E273C

	arm_func_start ov29_022E274C
ov29_022E274C: ; 0x022E274C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #1
	bne _022E27F4
	ldr r0, [r5]
	cmp r0, #1
	bne _022E27E0
	mov r0, r5
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	ldreq r0, [r4, #0xb4]
	ldreqb r0, [r0, #0xef]
	cmpeq r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _022E27F4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022E27E0:
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_022E27F4:
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl ov29_022E90CC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E274C

	arm_func_start CanTargetEntity
CanTargetEntity: ; 0x022E2810
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #1
	bne _022E28B8
	ldr r0, [r5]
	cmp r0, #1
	bne _022E28A4
	mov r0, r5
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	ldreq r0, [r4, #0xb4]
	ldreqb r0, [r0, #0xef]
	cmpeq r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _022E28B8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022E28A4:
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_022E28B8:
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl IsPositionInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanTargetEntity

	arm_func_start ov29_022E28D4
ov29_022E28D4: ; 0x022E28D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl ov29_022E90CC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E28D4

	arm_func_start ov29_022E2930
ov29_022E2930: ; 0x022E2930
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl HasDropeyeStatus
	mov r2, r0
	mov r1, r4
	add r0, r5, #4
	bl ov29_022E90CC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E2930

	arm_func_start CanTargetPosition
CanTargetPosition: ; 0x022E2954
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl HasDropeyeStatus
	mov r2, r0
	mov r1, r4
	add r0, r5, #4
	bl IsPositionInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanTargetPosition

	arm_func_start ov29_022E2978
ov29_022E2978: ; 0x022E2978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r6, _022E2A34 ; =0x02353538
	mov r4, r5
_022E2988:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r6]
	add r4, r4, #1
	addne r0, r0, r5, lsl #2
	addne r0, r0, #0x12000
	strne r7, [r0, #0xb78]
	addne r5, r5, #1
	cmp r4, #4
	blt _022E2988
	ldr r6, _022E2A34 ; =0x02353538
	mov r4, #0
_022E29CC:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	ldrne r0, [r6]
	add r4, r4, #1
	addne r0, r0, r5, lsl #2
	addne r0, r0, #0x12000
	strne r7, [r0, #0xb78]
	addne r5, r5, #1
	cmp r4, #0x10
	blt _022E29CC
	mov r2, #0
	ldr r1, _022E2A34 ; =0x02353538
	b _022E2A28
_022E2A14:
	ldr r0, [r1]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	str r2, [r0, #0xb78]
	add r5, r5, #1
_022E2A28:
	cmp r5, #0x14
	blt _022E2A14
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E2A34: .word 0x02353538
	arm_func_end ov29_022E2978

	arm_func_start ov29_022E2A38
ov29_022E2A38: ; 0x022E2A38
	ldr r1, _022E2A74 ; =0x02353538
	mov r2, #0
	ldr r3, [r1]
	b _022E2A64
_022E2A48:
	add r1, r3, r2, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28]
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	add r2, r2, #1
_022E2A64:
	cmp r2, #4
	blt _022E2A48
	mvn r0, #0
	bx lr
	.align 2, 0
_022E2A74: .word 0x02353538
	arm_func_end ov29_022E2A38

	arm_func_start ov29_022E2A78
ov29_022E2A78: ; 0x022E2A78
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, r0
	cmp r2, #1
	beq _022E2AA0
	cmp r2, #2
	beq _022E2AAC
	cmp r2, #3
	ldmeqia sp!, {r4, pc}
	b _022E2ABC
_022E2AA0:
	ldr r1, [r1, #0xb4]
	bl ov29_02300164
	ldmia sp!, {r4, pc}
_022E2AAC:
	ldr r1, [r1, #0xb4]
	ldrb r1, [r1]
	bl ov29_022ED82C
	ldmia sp!, {r4, pc}
_022E2ABC:
	ldr r0, _022E2AD4 ; =0x00000A42
	bl StringFromMessageId
	mov r1, r0
	mov r0, r4
	bl Strcpy
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E2AD4: .word 0x00000A42
	arm_func_end ov29_022E2A78

	arm_func_start SubstitutePlaceholderStringTags
SubstitutePlaceholderStringTags: ; 0x022E2AD8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	bl ov29_0234B034
	ldr r1, [r6]
	mov r4, r0
	cmp r1, #1
	beq _022E2B10
	cmp r1, #2
	beq _022E2B3C
	cmp r1, #3
	beq _022E2B2C
	b _022E2B50
_022E2B10:
	mov r1, #0
	str r1, [sp]
	ldr r2, [r6, #0xb4]
	mov r1, r7
	mov r3, r5
	bl ov29_0230040C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B2C:
	ldr r2, [r6, #0xb4]
	mov r1, r7
	bl ov29_02344BA8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B3C:
	ldr r2, [r6, #0xb4]
	mov r1, r7
	ldrb r2, [r2]
	bl ov29_022EDF7C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E2B50:
	ldr r0, _022E2B64 ; =0x00000A42
	bl StringFromMessageId
	add r1, r4, r7, lsl #2
	str r0, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E2B64: .word 0x00000A42
	arm_func_end SubstitutePlaceholderStringTags

	arm_func_start ov29_022E2B68
ov29_022E2B68: ; 0x022E2B68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022E2C5C ; =0x02353538
	movs r5, r0
	ldr r2, [r1]
	mov r1, #0
	add r0, r2, #0x21c
	add r4, r0, #0x1a000
	strh r1, [r4, #8]
	ldr r0, _022E2C60 ; =0x0001A21C
	strh r1, [r4, #0xa]
	strh r1, [r2, r0]
	strh r1, [r4, #2]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	str r1, [r4, #0x14]
	strb r1, [r4, #0x2f]
	mov r0, #1
	strb r0, [r4, #0x30]
	strb r0, [r4, #0x31]
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	bne _022E2BF4
	strb r1, [r4, #0x22]
	strb r1, [r4, #0x29]
	strb r1, [r4, #0x28]
	strb r1, [r4, #0x26]
	strb r1, [r4, #0x2a]
	strb r1, [r4, #0x27]
	strb r1, [r4, #0x23]
	strb r1, [r4, #0x24]
	strb r1, [r4, #0x32]
	strb r1, [r4, #0x33]
	strb r1, [r4, #0x34]
_022E2BF4:
	mov r1, #0
	str r1, [r4, #0x10]
	mov r0, #3
	strb r0, [r4, #0x20]
	strb r1, [r4, #0x35]
	strb r1, [r4, #0x2b]
	strb r1, [r4, #0x36]
	strb r1, [r4, #0x37]
	strb r1, [r4, #0x2d]
	mov r0, #1
	strb r0, [r4, #0x2e]
	bl ov29_022E2C6C
	ldr r1, _022E2C64 ; =0x0000FFFF
	ldr r0, _022E2C68 ; =0x0237C84C
	cmp r5, #0
	str r1, [r0]
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _022E2C5C ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x28000
	ldrb r0, [r0, #0x6c8]
	ands r0, r0, #3
	strb r0, [r4, #0x21]
	moveq r0, #1
	streqb r0, [r4, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E2C5C: .word 0x02353538
_022E2C60: .word 0x0001A21C
_022E2C64: .word 0x0000FFFF
_022E2C68: .word 0x0237C84C
	arm_func_end ov29_022E2B68

	arm_func_start ov29_022E2C6C
ov29_022E2C6C: ; 0x022E2C6C
	ldr r0, _022E2C9C ; =0x02353538
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x21c
	add r0, r0, #0x1a000
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x40]
	strh r1, [r0, #0x42]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	bx lr
	.align 2, 0
_022E2C9C: .word 0x02353538
	arm_func_end ov29_022E2C6C

	arm_func_start ov29_022E2CA0
ov29_022E2CA0: ; 0x022E2CA0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022E2D34 ; =0x02353538
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _022E2D38 ; =0x0001A21C
	ldrsh r1, [r4]
	ldrsh r2, [r3, r0]
	add r0, r3, #0x21c
	add r5, r0, #0x1a000
	sub r0, r2, r1
	ldr r6, [r5, #0x10]
	bl Abs
	cmp r0, #6
	bgt _022E2D2C
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl Abs
	cmp r0, #5
	bgt _022E2D2C
	mov r0, r5
	bl ov29_022E3534
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl ov29_022E90CC
	ldmia sp!, {r4, r5, r6, pc}
_022E2D2C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E2D34: .word 0x02353538
_022E2D38: .word 0x0001A21C
	arm_func_end ov29_022E2CA0

	arm_func_start ov29_022E2D3C
ov29_022E2D3C: ; 0x022E2D3C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022E2DD0 ; =0x02353538
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _022E2DD4 ; =0x0001A21C
	ldrsh r1, [r4]
	ldrsh r2, [r3, r0]
	add r0, r3, #0x21c
	add r5, r0, #0x1a000
	sub r0, r2, r1
	ldr r6, [r5, #0x10]
	bl Abs
	cmp r0, #6
	bgt _022E2DC8
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl Abs
	cmp r0, #6
	bgt _022E2DC8
	mov r0, r5
	bl ov29_022E3534
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl HasDropeyeStatus
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl ov29_022E90CC
	ldmia sp!, {r4, r5, r6, pc}
_022E2DC8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E2DD0: .word 0x02353538
_022E2DD4: .word 0x0001A21C
	arm_func_end ov29_022E2D3C

	arm_func_start UpdateMapSurveyorFlag
UpdateMapSurveyorFlag: ; 0x022E2DD8
	stmdb sp!, {r3, lr}
	mov r0, #0x41
	bl TeamMemberHasEnabledIqSkill
	ldr r1, _022E2DF8 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x241]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E2DF8: .word 0x02353538
	arm_func_end UpdateMapSurveyorFlag

	arm_func_start ov29_022E2DFC
ov29_022E2DFC: ; 0x022E2DFC
	stmdb sp!, {r3, lr}
	ldr r1, _022E2E50 ; =0x02353538
	cmp r0, #0
	ldr r1, [r1]
	add r1, r1, #0x21c
	add r1, r1, #0x1a000
	str r0, [r1, #0x10]
	moveq r0, #0
	streqb r0, [r1, #0x2f]
	beq _022E2E40
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #7]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r1, #0x2f]
	movne r0, #1
	strneb r0, [r1, #0x2f]
_022E2E40:
	mov r0, #0
	bl ov29_022E2EC4
	bl ov29_022E2C6C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E2E50: .word 0x02353538
	arm_func_end ov29_022E2DFC

	arm_func_start ov29_022E2E54
ov29_022E2E54: ; 0x022E2E54
	stmdb sp!, {r4, lr}
	ldr r2, _022E2EC0 ; =0x02353538
	mov r4, r1
	ldr r1, [r2]
	cmp r0, #0
	add r1, r1, #0x21c
	add r2, r1, #0x1a000
	moveq r1, #0
	streqb r1, [r2, #0x2f]
	beq _022E2E98
	ldr r1, [r0, #0xb4]
	ldrb r1, [r1, #7]
	cmp r1, #0
	moveq r1, #0
	streqb r1, [r2, #0x2f]
	movne r1, #1
	strneb r1, [r2, #0x2f]
_022E2E98:
	str r0, [r2, #0x10]
	mov r0, #0
	bl ov29_022E2EC4
	bl ov29_022E2C6C
	bl ov29_02304954
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	bl ov29_02336F4C
	bl ov29_02339CE8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E2EC0: .word 0x02353538
	arm_func_end ov29_022E2E54

	arm_func_start ov29_022E2EC4
ov29_022E2EC4: ; 0x022E2EC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r1, _022E32DC ; =0x02353538
	str r0, [sp]
	ldr r0, [r1]
	cmp r0, #0
	beq _022E32D4
	add r0, r0, #0x21c
	add r4, r0, #0x1a000
	ldr r5, [r4, #0x10]
	cmp r5, #0
	beq _022E32D0
	mov r0, r5
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E32D0
	ldrb r8, [r4, #0x32]
	ldrb sb, [r4, #0x33]
	ldrh r0, [r4, #8]
	ldr sl, [r5, #0xb4]
	mov r6, #0
	strh r0, [r4, #0xc]
	ldrh r2, [r4, #0xa]
	mov r0, r5
	mov r1, #0x18
	strh r2, [r4, #0xe]
	ldrh r2, [r4]
	mov fp, r6
	mov r7, r6
	strh r2, [r4, #4]
	ldrh r2, [r4, #2]
	str r6, [sp, #4]
	strh r2, [r4, #6]
	ldrsh r2, [r5, #4]
	strh r2, [r4]
	ldrsh r2, [r5, #6]
	strh r2, [r4, #2]
	ldr r2, [r5, #0xc]
	mov r2, r2, asr #8
	sub r2, r2, #0x80
	strh r2, [r4, #8]
	ldr r2, [r5, #0x10]
	mov r2, r2, asr #8
	sub r2, r2, #0x6c
	strh r2, [r4, #0xa]
	ldrb r2, [r4, #0x27]
	str r2, [sp, #0xc]
	ldrb r2, [r4, #0x26]
	str r2, [sp, #8]
	bl ItemIsActive__022E330C
	cmp r0, #0
	ldrneb r0, [sl, #7]
	mov r1, #0
	cmpne r0, #0
	movne r0, #1
	strneb r0, [r4, #0x26]
	strneb r0, [r4, #0x27]
	ldreqb r0, [sl, #0xf9]
	streqb r0, [r4, #0x26]
	ldreqb r0, [sl, #0xfa]
	streqb r0, [r4, #0x27]
	strb r1, [r4, #0x32]
	strb r1, [r4, #0x33]
	mov r0, r5
	mov r1, #0xe
	bl ItemIsActive__022E330C
	cmp r0, #0
	ldrneb r0, [sl, #7]
	cmpne r0, #0
	movne r0, #1
	strneb r0, [r4, #0x32]
	strneb r0, [r4, #0x33]
	ldrb r1, [r4, #0x27]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	ldreqb r0, [r4, #0x32]
	ldrb r1, [r4, #0x26]
	cmpeq r8, r0
	ldr r0, [sp, #8]
	movne r6, #1
	cmp r0, r1
	ldreqb r0, [r4, #0x33]
	cmpeq sb, r0
	ldrb r0, [sl, #0xfb]
	movne fp, #1
	strb r0, [r4, #0x2a]
	ldrb r0, [r4, #0x2d]
	ldrb r8, [r4, #0x22]
	cmp r0, #0
	bne _022E309C
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	movne r2, #0xe
	strneb r0, [r4, #0x22]
	moveq r2, #0
	ldr r0, _022E32E0 ; =0x0237C84C
	streqb r2, [r4, #0x22]
	ldr r1, [r0]
	cmp r1, r2
	beq _022E30A8
	str r2, [r0]
	cmp r2, #0xe
	mov r0, #2
	mov r1, #0
	bne _022E3088
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	b _022E30A8
_022E3088:
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	b _022E30A8
_022E309C:
	ldr r1, _022E32E4 ; =0x0000FFFF
	ldr r0, _022E32E0 ; =0x0237C84C
	str r1, [r0]
_022E30A8:
	ldrb r0, [r4, #0x22]
	ldrb r1, [r4, #0x29]
	cmp r8, r0
	ldrb r0, [sl, #0xf1]
	movne r7, #1
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	strb r0, [r4, #0x29]
	ldrb r0, [r4, #0x29]
	cmp r1, r0
	ldreq r0, _022E32DC ; =0x02353538
	ldreq r0, [r0]
	addeq r0, r0, #0x2c000
	ldreqb r0, [r0, #0xb10]
	cmpeq r0, #0
	beq _022E3108
	bl ov29_023047DC
	ldr r0, _022E32DC ; =0x02353538
	mov r1, #0
	ldr r0, [r0]
	mov r7, #1
	add r0, r0, #0x2c000
	strb r1, [r0, #0xb10]
_022E3108:
	mov r0, r5
	ldrb r8, [r4, #0x28]
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	strb r0, [r4, #0x28]
	ldrb r0, [r4, #0x28]
	cmp r8, r0
	movne r7, #1
	strne r7, [sp, #4]
	ldrb r8, [r4, #0x34]
	mov r0, r5
	bl HasDropeyeStatus
	and r1, r0, #0xff
	cmp r8, r1
	strb r0, [r4, #0x34]
	movne r7, #1
	strne r7, [sp, #4]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022E3168
	bl ov29_02336F4C
	bl ov29_02339CE8
_022E3168:
	cmp r7, #0
	beq _022E3178
	mov r0, #0
	bl ov29_022E3A58
_022E3178:
	ldr r0, [sp]
	cmp r0, #0
	beq _022E3228
	ldrb r0, [r4, #0x2c]
	cmp r0, #0
	bne _022E3228
	ldrsh r5, [r4, #8]
	ldrsh r7, [r4, #0xc]
	sub r0, r7, r5
	bl Abs
	cmp r0, #8
	bge _022E31C0
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r4, #0xa]
	sub r0, r1, r0
	bl Abs
	cmp r0, #8
	blt _022E31D0
_022E31C0:
	bl ov29_02336F4C
	mov r0, #1
	strb r0, [r4, #0x2c]
	b _022E3228
_022E31D0:
	cmp r7, r5
	bge _022E31E8
	mov r0, #0xff
	mov r1, #0
	bl ov29_0233711C
	b _022E31F8
_022E31E8:
	ble _022E31F8
	mov r0, #0
	mov r1, r0
	bl ov29_0233711C
_022E31F8:
	ldrsh r1, [r4, #0xa]
	ldrsh r0, [r4, #0xe]
	cmp r0, r1
	bge _022E3218
	mov r0, #0
	mov r1, #0xc0
	bl ov29_023372A4
	b _022E3228
_022E3218:
	ble _022E3228
	mov r0, #0
	mov r1, r0
	bl ov29_023372A4
_022E3228:
	cmp fp, #0
	ldreqsh r1, [r4]
	ldreqsh r0, [r4, #4]
	cmpeq r1, r0
	ldreqsh r1, [r4, #2]
	ldreqsh r0, [r4, #6]
	cmpeq r1, r0
	beq _022E3288
	ldr r4, _022E32DC ; =0x02353538
	mov r5, #0
_022E3250:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E327C
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl ov29_023391EC
_022E327C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022E3250
_022E3288:
	cmp r6, #0
	beq _022E32D0
	ldr r4, _022E32DC ; =0x02353538
	mov r5, #0
_022E3298:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xbc8]
	mov r0, r6
	bl EntityIsValid__022E32E8
	cmp r0, #0
	beq _022E32C4
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl ov29_023391EC
_022E32C4:
	add r5, r5, #1
	cmp r5, #0x40
	blt _022E3298
_022E32D0:
	bl ov29_022E34C8
_022E32D4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E32DC: .word 0x02353538
_022E32E0: .word 0x0237C84C
_022E32E4: .word 0x0000FFFF
	arm_func_end ov29_022E2EC4

	arm_func_start EntityIsValid__022E32E8
EntityIsValid__022E32E8: ; 0x022E32E8
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end EntityIsValid__022E32E8

	arm_func_start ItemIsActive__022E330C
ItemIsActive__022E330C: ; 0x022E330C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActive2
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__022E330C

	arm_func_start ov29_022E333C
ov29_022E333C: ; 0x022E333C
	ldr r0, _022E3358 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x23d]
	cmp r0, #0
	moveq r0, #2
	bx lr
	.align 2, 0
_022E3358: .word 0x02353538
	arm_func_end ov29_022E333C

	arm_func_start ov29_022E335C
ov29_022E335C: ; 0x022E335C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E3428 ; =0x02353538
	mov r5, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r1, [r0, #0x24d]
	ldr r4, [r0, #0x22c]
	cmp r1, #0
	bne _022E33A0
	bl ov10_022BFD20
	cmp r0, #0
	bne _022E33A0
	cmp r4, #0
	beq _022E33A0
	ldr r0, [r4]
	cmp r0, #1
	moveq r5, #1
_022E33A0:
	cmp r5, #0
	bne _022E33B0
	bl ov29_022E2C6C
	ldmia sp!, {r3, r4, r5, pc}
_022E33B0:
	ldr r0, _022E3428 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x21c
	add r4, r0, #0x1a000
	ldr r0, [r4, #0x10]
	ldr r5, [r0, #0xb4]
	bl ov29_02335A10
	ldr r1, _022E3428 ; =0x02353538
	ldr r0, _022E342C ; =0x000003E7
	ldr r1, [r1]
	ldrb r2, [r1, #0x749]
	ldrsh r1, [r1, #0x1e]
	add r1, r2, r1
	strh r1, [r4, #0x3c]
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x42]
	ldrsh r0, [r5, #0x10]
	strh r0, [r4, #0x40]
	ldrb r0, [r5, #0xa]
	strh r0, [r4, #0x3e]
	ldrsh r1, [r4, #0x42]
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	strh r0, [r4, #0x44]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E3428: .word 0x02353538
_022E342C: .word 0x000003E7
	arm_func_end ov29_022E335C

	arm_func_start ov29_022E3430
ov29_022E3430: ; 0x022E3430
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022E34A8 ; =0x02353538
	mov r7, #0
	ldr r1, [r1]
	mov r4, r0
	mov r2, #1
	add r0, r1, #0x1a000
	strb r2, [r0, #0x23f]
	mov r5, r7
_022E3454:
	mov r6, r5
_022E3458:
	mov r0, r6
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	cmp r6, #0x38
	orr r1, r1, #1
	strh r1, [r0, #2]
	blt _022E3458
	add r7, r7, #1
	cmp r7, #0x20
	blt _022E3454
	mov r0, #0
	bl ov29_022E2EC4
	bl ov29_02336F4C
	bl ov29_02339CE8
	ldr r1, _022E34AC ; =0x00000B77
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E34A8: .word 0x02353538
_022E34AC: .word 0x00000B77
	arm_func_end ov29_022E3430

	arm_func_start ov29_022E34B0
ov29_022E34B0: ; 0x022E34B0
	ldr r1, _022E34C4 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	strb r0, [r1, #0x24c]
	bx lr
	.align 2, 0
_022E34C4: .word 0x02353538
	arm_func_end ov29_022E34B0

	arm_func_start ov29_022E34C8
ov29_022E34C8: ; 0x022E34C8
	ldr r0, _022E352C ; =0x02353538
	ldr r3, [r0]
	add r0, r3, #0x1a000
	ldr r2, [r0, #0x234]
	cmp r2, #0
	bxeq lr
	ldr r1, _022E3530 ; =0x0235110C
	cmp r2, #0x1f
	movge r2, #0x1f
	ldr r2, [r1, r2, lsl #2]
	add r0, r3, #0x1a000
	ldr r1, _022E352C ; =0x02353538
	str r2, [r0, #0x230]
	ldr r0, [r1]
	add r0, r0, #0x1a000
	ldr r2, [r0, #0x234]
	sub r2, r2, #1
	str r2, [r0, #0x234]
	ldr r0, [r1]
	add r0, r0, #0x1a000
	ldr r1, [r0, #0x234]
	cmp r1, #0
	ldreq r1, [r0, #0x238]
	streq r1, [r0, #0x234]
	bx lr
	.align 2, 0
_022E352C: .word 0x02353538
_022E3530: .word 0x0235110C
	arm_func_end ov29_022E34C8

	arm_func_start ov29_022E3534
ov29_022E3534: ; 0x022E3534
	ldrb r1, [r0, #0x34]
	cmp r1, #0
	bne _022E3558
	ldrb r1, [r0, #0x23]
	cmp r1, #0
	ldreqb r0, [r0, #0x24]
	cmpeq r0, #0
	movne r0, #1
	bxne lr
_022E3558:
	mov r0, #0
	bx lr
	arm_func_end ov29_022E3534

	arm_func_start ov29_022E3560
ov29_022E3560: ; 0x022E3560
	ldr r1, _022E356C ; =0x0235354C
	strb r0, [r1]
	bx lr
	.align 2, 0
_022E356C: .word 0x0235354C
	arm_func_end ov29_022E3560

	arm_func_start ov29_022E3570
ov29_022E3570: ; 0x022E3570
	ldr r0, _022E357C ; =0x0235354C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_022E357C: .word 0x0235354C
	arm_func_end ov29_022E3570

	arm_func_start ov29_022E3580
ov29_022E3580: ; 0x022E3580
	ldr ip, _022E358C ; =ov10_022BF8E8
	mov r0, #0
	bx ip
	.align 2, 0
_022E358C: .word ov10_022BF8E8
	arm_func_end ov29_022E3580

	arm_func_start ov29_022E3590
ov29_022E3590: ; 0x022E3590
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	and r3, r3, #0xff
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022E3590

	arm_func_start ov29_022E35E4
ov29_022E35E4: ; 0x022E35E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x30
	mov r8, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__022E37B8
	cmp r0, #0
	mvneq r0, #0
	beq _022E37A8
	mov r0, r8
	ldr r6, [r8, #0xb4]
	bl ov29_022E5ED0
	cmp r0, #0
	mvneq r0, #0
	beq _022E37A8
	ldrb r0, [sp, #0x4c]
	cmp r0, #0
	ldreqb r0, [r6, #0x10b]
	cmpeq r0, #2
	mvneq r0, #0
	beq _022E37A8
	ldr r0, [sp, #0x48]
	cmp r0, #0
	beq _022E365C
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl ov29_022E38E0
_022E365C:
	add r0, sp, #0
	mov r2, r7
	add r1, r8, #0x2c
	bl sub_0201CF90
	ldrsh r7, [sp]
	cmp r7, #0x63
	ldrnesh r2, [sp, #2]
	cmpne r2, #0x63
	ldreq r1, [r8, #0x10]
	ldreq r0, [r6, #0x188]
	ldreq r7, [r8, #0xc]
	subeq r8, r1, r0
	beq _022E36A8
	ldr r1, [r8, #0x10]
	ldr r3, [r8, #0xc]
	ldr r0, [r6, #0x188]
	add r2, r1, r2, lsl #8
	add r7, r3, r7, lsl #8
	sub r8, r2, r0
_022E36A8:
	ldr r0, _022E37B0 ; =0x02353538
	ldr r2, _022E37B4 ; =0x0001A226
	ldr r3, [r0]
	add r0, sp, #4
	ldrsh r2, [r3, r2]
	rsb r6, r2, r1, asr #8
	bl ov10_022BF274
	ldrsh r0, [sp, #0x50]
	mov r1, #0
	str r5, [sp, #4]
	str r1, [sp, #8]
	cmp r0, #0
	blt _022E36E4
	cmp r0, #8
	ble _022E36F0
_022E36E4:
	mvn r0, #0
	str r0, [sp, #0xc]
	b _022E36F4
_022E36F0:
	str r0, [sp, #0xc]
_022E36F4:
	add r0, r6, r6, lsr #31
	mov r0, r0, asr #1
	mov r1, #0
	ldr r3, [sp, #0x54]
	mov r6, r7, asr #8
	mov r5, r8, asr #8
	add r0, r0, #1
	mvn r2, #0
	strh r6, [sp, #0x10]
	strh r5, [sp, #0x12]
	strb r2, [sp, #0x18]
	strh r1, [sp, #0x14]
	strh r1, [sp, #0x16]
	str r0, [sp, #0x1c]
	cmp r3, #0
	bne _022E3740
	add r0, sp, #0x20
	bl sub_0201C000
	b _022E3758
_022E3740:
	add r2, sp, #0x20
	mov r1, #6
_022E3748:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E3748
_022E3758:
	add r0, sp, #4
	mov r1, #0
	bl ov10_022BF2B4
	cmp r4, #0
	beq _022E37A8
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r5, r0, asr #0x10
	mov r4, #0x42
	b _022E379C
_022E3780:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E37A4
	mov r0, r4
	bl AdvanceFrame
	add r6, r6, #1
_022E379C:
	cmp r6, #0x64
	blt _022E3780
_022E37A4:
	mvn r0, #0
_022E37A8:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E37B0: .word 0x02353538
_022E37B4: .word 0x0001A226
	arm_func_end ov29_022E35E4

	arm_func_start EntityIsValid__022E37B8
EntityIsValid__022E37B8: ; 0x022E37B8
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end EntityIsValid__022E37B8

	arm_func_start ov29_022E37DC
ov29_022E37DC: ; 0x022E37DC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrsh ip, [r0]
	mov r3, #0x18
	smulbb ip, ip, r3
	add ip, ip, #0xc
	mov ip, ip, lsl #8
	str ip, [sp]
	ldrsh ip, [r0, #2]
	add r0, sp, #0
	smulbb r3, ip, r3
	add r3, r3, #0x10
	mov r3, r3, lsl #8
	str r3, [sp, #4]
	bl ov29_022E3820
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E37DC

	arm_func_start ov29_022E3820
ov29_022E3820: ; 0x022E3820
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	mov r5, r0
	add r0, sp, #0
	mov r6, r1
	mov r4, r2
	bl ov10_022BF274
	mov ip, #0
	sub r3, ip, #1
	str r6, [sp]
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r1, _022E38DC ; =0x0000FFFF
	mov r0, r0, asr #8
	strh r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, sp, #0x1c
	mov r2, r2, asr #8
	strh r2, [sp, #0xe]
	strb r3, [sp, #0x14]
	strh ip, [sp, #0x10]
	strh ip, [sp, #0x12]
	str r1, [sp, #0x18]
	bl sub_0201C000
	add r0, sp, #0
	mov r1, #0
	bl ov10_022BF2B4
	cmp r4, #0
	beq _022E38D4
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r5, r0, asr #0x10
	mov r4, #0x42
	b _022E38C8
_022E38AC:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E38D0
	mov r0, r4
	bl AdvanceFrame
	add r6, r6, #1
_022E38C8:
	cmp r6, #0x64
	blt _022E38AC
_022E38D0:
	mvn r0, #0
_022E38D4:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022E38DC: .word 0x0000FFFF
	arm_func_end ov29_022E3820

	arm_func_start ov29_022E38E0
ov29_022E38E0: ; 0x022E38E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022E3A38 ; =0x02353538
	mov r7, #0
	ldr r2, [r1]
	mov r1, r7
	add r2, r2, #0x1a000
	mov r8, r0
	str r7, [r2, #0x238]
	bl ov10_022BF9CC
	cmp r0, #0
	bne _022E3920
	mov r0, r8
	mov r1, #1
	bl ov10_022BF9CC
	cmp r0, #0
	beq _022E3980
_022E3920:
	mov r7, #0
	mov r5, #1
	mov r6, r7
	mov r4, #0x4a
	b _022E3968
_022E3934:
	mov r0, r8
	mov r1, r6
	bl ov10_022BF9CC
	cmp r0, #0
	bne _022E395C
	mov r0, r8
	mov r1, r5
	bl ov10_022BF9CC
	cmp r0, #0
	beq _022E3970
_022E395C:
	mov r0, r4
	bl AdvanceFrame
	add r7, r7, #1
_022E3968:
	cmp r7, #0x3e8
	blt _022E3934
_022E3970:
	mov r0, #0x4a
	bl AdvanceFrame
	mov r0, #0x4a
	bl AdvanceFrame
_022E3980:
	cmp r7, #0x3e8
	beq _022E3990
	cmp r8, #0
	beq _022E3994
_022E3990:
	bl ov10_022BDC68
_022E3994:
	mov r0, #1
	bl ov29_022DE5F0
	cmp r0, #0x100
	bge _022E3A0C
	mov r0, #1
	bl ov29_022DE5F0
	mov r6, r0
	mov r7, #0
	mov r5, #0x4a
	mov r4, #1
	b _022E39F8
_022E39C0:
	mov r0, r5
	bl AdvanceFrame
	cmp r6, #0x100
	movge r6, #0x100
	bge _022E3A00
	add r0, r6, #4
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	mov r0, r6
	mov r1, r4
	bl ov29_022DE5D8
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022E39F8:
	cmp r7, #0x3e8
	blt _022E39C0
_022E3A00:
	mov r0, r6
	mov r1, #1
	bl ov29_022DE5D8
_022E3A0C:
	ldr r0, _022E3A3C ; =0x0235354C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E3A30
	mov r0, #0x10
	bl ov29_022ED0F4
	ldr r0, _022E3A3C ; =0x0235354C
	mov r1, #0
	strb r1, [r0]
_022E3A30:
	bl ov29_022E6E40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E3A38: .word 0x02353538
_022E3A3C: .word 0x0235354C
	arm_func_end ov29_022E38E0

	arm_func_start ov29_022E3A40
ov29_022E3A40: ; 0x022E3A40
	ldr r1, [r1, #0xb4]
	ldr r2, [r1, #0x218]
	ldr r1, [r1, #0x21c]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	arm_func_end ov29_022E3A40

	arm_func_start ov29_022E3A58
ov29_022E3A58: ; 0x022E3A58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _022E3AB0 ; =0x02353538
	mov r5, r0
	mov r4, #0
	mov r7, #1
_022E3A6C:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__022E37B8
	cmp r0, #0
	beq _022E3AA0
	ldr r0, [r8, #0xb4]
	cmp r5, #0
	strneb r7, [r0, #0x156]
	mov r0, r8
	bl UpdateStatusIconFlags
_022E3AA0:
	add r4, r4, #1
	cmp r4, #0x14
	blt _022E3A6C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E3AB0: .word 0x02353538
	arm_func_end ov29_022E3A58

	arm_func_start UpdateStatusIconFlags
UpdateStatusIconFlags: ; 0x022E3AB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl EntityIsValid__022E37B8
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0xb4]
	mov r1, #0
	ldrsh r4, [r2, #2]
	mov r5, #1
	mov r0, r1
	cmp r4, #0xb9
	addne r3, r5, #0x310
	cmpne r4, r3
	bne _022E3AF8
	ldrb r3, [r2, #0xbe]
	cmp r3, #0x7f
	moveq r5, #0
_022E3AF8:
	cmp r5, #0
	beq _022E3B1C
	ldrb r5, [r2, #0xbd]
	ldr r4, _022E3D94 ; =0x0235130C
	add r3, r4, r5, lsl #3
	ldr r4, [r4, r5, lsl #3]
	ldr r3, [r3, #4]
	orr r1, r1, r4
	orr r0, r0, r3
_022E3B1C:
	ldrb r7, [r2, #0xbf]
	ldr r4, _022E3D98 ; =0x02351294
	ldrb r6, [r2, #0xc4]
	ldr r3, _022E3D9C ; =0x02351374
	add r5, r4, r7, lsl #3
	add ip, r3, r6, lsl #3
	ldr r4, [r4, r7, lsl #3]
	ldr lr, [r5, #4]
	ldrb sl, [r2, #0xd0]
	ldr r8, _022E3DA0 ; =0x023513B4
	ldrb r7, [r2, #0xd2]
	ldr r5, _022E3DA4 ; =0x023513F4
	add fp, r8, sl, lsl #3
	add sb, r5, r7, lsl #3
	orr r0, r0, lr
	ldr lr, [ip, #4]
	ldrb ip, [r2, #0xd5]
	orr r1, r1, r4
	ldr r4, _022E3DA8 ; =0x023514F4
	ldr r3, [r3, r6, lsl #3]
	add r6, r4, ip, lsl #3
	orr r0, r0, lr
	ldr lr, [fp, #4]
	ldrb fp, [r2, #0xd8]
	orr r1, r1, r3
	ldr r3, _022E3DAC ; =0x0235133C
	ldr r8, [r8, sl, lsl #3]
	add sl, r3, fp, lsl #3
	orr r0, r0, lr
	ldr lr, [sb, #4]
	ldrb sb, [r2, #0xe0]
	orr r1, r1, r8
	ldr r8, _022E3DB0 ; =0x023511FC
	ldr r5, [r5, r7, lsl #3]
	add r7, r8, sb, lsl #3
	orr r0, r0, lr
	ldr lr, [r6, #4]
	ldrb r6, [r2, #0xec]
	orr r1, r1, r5
	ldr r5, _022E3DB4 ; =0x023512BC
	ldr ip, [r4, ip, lsl #3]
	add r4, r5, r6, lsl #3
	orr r0, r0, lr
	ldr sl, [sl, #4]
	ldrb lr, [r2, #0xee]
	orr r1, r1, ip
	ldr ip, _022E3DB8 ; =0x02351214
	ldr fp, [r3, fp, lsl #3]
	add r3, ip, lr, lsl #3
	orr r0, r0, sl
	ldr sl, [r7, #4]
	ldrb r7, [r2, #0xef]
	orr fp, r1, fp
	ldr r1, _022E3DBC ; =0x023512E4
	ldr sb, [r8, sb, lsl #3]
	add r8, r1, r7, lsl #3
	orr r0, r0, sl
	ldr sl, [r4, #4]
	ldrb r4, [r2, #0xf1]
	orr fp, fp, sb
	ldr sb, _022E3DC0 ; =0x0235126C
	ldr r6, [r5, r6, lsl #3]
	add r5, sb, r4, lsl #3
	orr r0, r0, sl
	ldr sl, [r3, #4]
	ldrb r3, [r2, #0xf3]
	orr r6, fp, r6
	ldr fp, _022E3DC4 ; =0x023511BC
	ldr ip, [ip, lr, lsl #3]
	add lr, fp, r3, lsl #3
	orr sl, r0, sl
	ldr r0, [r8, #4]
	ldr r1, [r1, r7, lsl #3]
	orr r7, r6, ip
	ldr r6, [sb, r4, lsl #3]
	orr r8, r7, r1
	ldr r4, [r5, #4]
	orr r7, sl, r0
	ldr r1, [fp, r3, lsl #3]
	orr r5, r8, r6
	ldr r0, [lr, #4]
	orr r3, r7, r4
	orr r0, r3, r0
	orr r8, r5, r1
	ldrb r7, [r2, #0xf5]
	ldr r6, _022E3DC8 ; =0x023511EC
	ldrb r5, [r2, #0xf7]
	ldr r4, _022E3DCC ; =0x023511CC
	add r1, r6, r7, lsl #3
	add r3, r4, r5, lsl #3
	ldr r7, [r6, r7, lsl #3]
	ldr r6, [r1, #4]
	ldrb r1, [r2, #0xfd]
	ldr r4, [r4, r5, lsl #3]
	ldr r3, [r3, #4]
	orr r0, r0, r6
	orr r0, r0, r3
	cmp r1, #0
	orr r5, r8, r7
	orr r1, r5, r4
	ldrb r3, [r2, #0xfe]
	orrne r0, r0, #0
	orrne r1, r1, #0x1000000
	cmp r3, #0
	ldrb r3, [r2, #6]
	orrne r0, r0, #0
	orrne r1, r1, #0x2000000
	cmp r3, #0
	bne _022E3D00
	ldrsh r5, [r2, #0x12]
	ldrsh r4, [r2, #0x16]
	ldr r3, _022E3DD0 ; =0x000003E7
	add r5, r5, r4
	cmp r5, r3
	movgt r5, r3
	mov r3, r5, asr #1
	ldrsh r4, [r2, #0x10]
	add r3, r5, r3, lsr #30
	cmp r4, r3, asr #2
	orrlt r0, r0, #0
	orrlt r1, r1, #0x2000
_022E3D00:
	ldr r3, _022E3DD4 ; =0x02353538
	ldr r3, [r3]
	ldrb r3, [r3, #0x78d]
	cmp r3, #0
	beq _022E3D30
	ldrb r3, [r2, #0x62]
	tst r3, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	orrne r0, r0, #0
	orrne r1, r1, #0x2000
_022E3D30:
	ldr r3, [r2, #0x34]
	cmp r3, #0x100
	ldrge r3, [r2, #0x38]
	cmpge r3, #0x100
	ldrge r3, [r2, #0x3c]
	cmpge r3, #0x100
	ldrge r3, [r2, #0x40]
	cmpge r3, #0x100
	ldrgesh r3, [r2, #0x24]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x26]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x28]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2a]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2c]
	cmpge r3, #0xa
	ldrgesh r3, [r2, #0x2e]
	cmpge r3, #0xa
	orrlt r1, r1, #0x8000000
	orrlt r0, r0, #0
	str r1, [r2, #0x218]
	str r0, [r2, #0x21c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E3D94: .word 0x0235130C
_022E3D98: .word 0x02351294
_022E3D9C: .word 0x02351374
_022E3DA0: .word 0x023513B4
_022E3DA4: .word 0x023513F4
_022E3DA8: .word 0x023514F4
_022E3DAC: .word 0x0235133C
_022E3DB0: .word 0x023511FC
_022E3DB4: .word 0x023512BC
_022E3DB8: .word 0x02351214
_022E3DBC: .word 0x023512E4
_022E3DC0: .word 0x0235126C
_022E3DC4: .word 0x023511BC
_022E3DC8: .word 0x023511EC
_022E3DCC: .word 0x023511CC
_022E3DD0: .word 0x000003E7
_022E3DD4: .word 0x02353538
	arm_func_end UpdateStatusIconFlags

	arm_func_start ov29_022E3DD8
ov29_022E3DD8: ; 0x022E3DD8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x144
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x144
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E3DD8

	arm_func_start ov29_022E3E24
ov29_022E3E24: ; 0x022E3E24
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3E70 ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3E70 ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3E70: .word 0x00000143
	arm_func_end ov29_022E3E24

	arm_func_start ov29_022E3E74
ov29_022E3E74: ; 0x022E3E74
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x25
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x25
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	ldr r1, _022E3ECC ; =0x0000030E
	mov r0, r4
	bl ov29_022E56A0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3ECC: .word 0x0000030E
	arm_func_end ov29_022E3E74

	arm_func_start ov29_022E3ED0
ov29_022E3ED0: ; 0x022E3ED0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3F1C ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3F1C ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3F1C: .word 0x00000143
	arm_func_end ov29_022E3ED0

	arm_func_start ov29_022E3F20
ov29_022E3F20: ; 0x022E3F20
	bx lr
	arm_func_end ov29_022E3F20

	arm_func_start ov29_022E3F24
ov29_022E3F24: ; 0x022E3F24
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E3F70 ; =0x00000141
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E3F70 ; =0x00000141
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E3F70: .word 0x00000141
	arm_func_end ov29_022E3F24

	arm_func_start ov29_022E3F74
ov29_022E3F74: ; 0x022E3F74
	bx lr
	arm_func_end ov29_022E3F74

	arm_func_start ov29_022E3F78
ov29_022E3F78: ; 0x022E3F78
	bx lr
	arm_func_end ov29_022E3F78

	arm_func_start ov29_022E3F7C
ov29_022E3F7C: ; 0x022E3F7C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #7
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #7
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E3F7C

	arm_func_start ov29_022E3FC8
ov29_022E3FC8: ; 0x022E3FC8
	bx lr
	arm_func_end ov29_022E3FC8

	arm_func_start ov29_022E3FCC
ov29_022E3FCC: ; 0x022E3FCC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #4
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E3FCC

	arm_func_start ov29_022E4014
ov29_022E4014: ; 0x022E4014
	bx lr
	arm_func_end ov29_022E4014

	arm_func_start ov29_022E4018
ov29_022E4018: ; 0x022E4018
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4064 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4064 ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4064: .word 0x00000171
	arm_func_end ov29_022E4018

	arm_func_start ov29_022E4068
ov29_022E4068: ; 0x022E4068
	bx lr
	arm_func_end ov29_022E4068

	arm_func_start ov29_022E406C
ov29_022E406C: ; 0x022E406C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E40B4 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E40B4 ; =0x00000171
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E40B4: .word 0x00000171
	arm_func_end ov29_022E406C

	arm_func_start ov29_022E40B8
ov29_022E40B8: ; 0x022E40B8
	bx lr
	arm_func_end ov29_022E40B8

	arm_func_start ov29_022E40BC
ov29_022E40BC: ; 0x022E40BC
	bx lr
	arm_func_end ov29_022E40BC

	arm_func_start ov29_022E40C0
ov29_022E40C0: ; 0x022E40C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1ac
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1ac
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E40C0

	arm_func_start ov29_022E4108
ov29_022E4108: ; 0x022E4108
	bx lr
	arm_func_end ov29_022E4108

	arm_func_start ov29_022E410C
ov29_022E410C: ; 0x022E410C
	bx lr
	arm_func_end ov29_022E410C

	arm_func_start ov29_022E4110
ov29_022E4110: ; 0x022E4110
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4110

	arm_func_start ov29_022E415C
ov29_022E415C: ; 0x022E415C
	bx lr
	arm_func_end ov29_022E415C

	arm_func_start ov29_022E4160
ov29_022E4160: ; 0x022E4160
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4160

	arm_func_start ov29_022E41AC
ov29_022E41AC: ; 0x022E41AC
	bx lr
	arm_func_end ov29_022E41AC

	arm_func_start ov29_022E41B0
ov29_022E41B0: ; 0x022E41B0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022E41C8 ; =0x00000221
	bl ov29_022E56A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E41C8: .word 0x00000221
	arm_func_end ov29_022E41B0

	arm_func_start ov29_022E41CC
ov29_022E41CC: ; 0x022E41CC
	ldr ip, _022E41D8 ; =ov29_022E56A0
	mov r1, #0x310
	bx ip
	.align 2, 0
_022E41D8: .word ov29_022E56A0
	arm_func_end ov29_022E41CC

	arm_func_start ov29_022E41DC
ov29_022E41DC: ; 0x022E41DC
	ldr ip, _022E41EC ; =ov29_023049A8
	mov r1, #0xa
	mov r2, #8
	bx ip
	.align 2, 0
_022E41EC: .word ov29_023049A8
	arm_func_end ov29_022E41DC

	arm_func_start ov29_022E41F0
ov29_022E41F0: ; 0x022E41F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E423C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E423C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E423C: .word 0x000001A7
	arm_func_end ov29_022E41F0

	arm_func_start ov29_022E4240
ov29_022E4240: ; 0x022E4240
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E428C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E428C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E428C: .word 0x000001A7
	arm_func_end ov29_022E4240

	arm_func_start ov29_022E4290
ov29_022E4290: ; 0x022E4290
	bx lr
	arm_func_end ov29_022E4290

	arm_func_start ov29_022E4294
ov29_022E4294: ; 0x022E4294
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x4c
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x4c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4294

	arm_func_start ov29_022E42E0
ov29_022E42E0: ; 0x022E42E0
	bx lr
	arm_func_end ov29_022E42E0

	arm_func_start ov29_022E42E4
ov29_022E42E4: ; 0x022E42E4
	bx lr
	arm_func_end ov29_022E42E4

	arm_func_start ov29_022E42E8
ov29_022E42E8: ; 0x022E42E8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r5
	mov r1, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E42E8

	arm_func_start ov29_022E4338
ov29_022E4338: ; 0x022E4338
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4384 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4384 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4384: .word 0x000001A9
	arm_func_end ov29_022E4338

	arm_func_start ov29_022E4388
ov29_022E4388: ; 0x022E4388
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E43D4 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E43D4: .word 0x0000013A
	arm_func_end ov29_022E4388

	arm_func_start ov29_022E43D8
ov29_022E43D8: ; 0x022E43D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4424 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4424: .word 0x0000013A
	arm_func_end ov29_022E43D8

	arm_func_start ov29_022E4428
ov29_022E4428: ; 0x022E4428
	bx lr
	arm_func_end ov29_022E4428

	arm_func_start ov29_022E442C
ov29_022E442C: ; 0x022E442C
	bx lr
	arm_func_end ov29_022E442C

	arm_func_start ov29_022E4430
ov29_022E4430: ; 0x022E4430
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E447C ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E447C ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E447C: .word 0x00000171
	arm_func_end ov29_022E4430

	arm_func_start ov29_022E4480
ov29_022E4480: ; 0x022E4480
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #7
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #7
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4480

	arm_func_start ov29_022E44CC
ov29_022E44CC: ; 0x022E44CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4518 ; =0x0000018B
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4518 ; =0x0000018B
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4518: .word 0x0000018B
	arm_func_end ov29_022E44CC

	arm_func_start ov29_022E451C
ov29_022E451C: ; 0x022E451C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4568 ; =0x0000018A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x188
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4568: .word 0x0000018A
	arm_func_end ov29_022E451C

	arm_func_start ov29_022E456C
ov29_022E456C: ; 0x022E456C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #5
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #5
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E456C

	arm_func_start ov29_022E45B8
ov29_022E45B8: ; 0x022E45B8
	ldr ip, _022E45C4 ; =ov29_022E56A0
	ldr r1, _022E45C8 ; =0x00000227
	bx ip
	.align 2, 0
_022E45C4: .word ov29_022E56A0
_022E45C8: .word 0x00000227
	arm_func_end ov29_022E45B8

	arm_func_start ov29_022E45CC
ov29_022E45CC: ; 0x022E45CC
	bx lr
	arm_func_end ov29_022E45CC

	arm_func_start ov29_022E45D0
ov29_022E45D0: ; 0x022E45D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x2f
	mov r4, r1
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x2f
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	mov r0, #0x30
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	sub r1, r2, #1
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, r5
	mov r1, #0x30
	mov r2, #1
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E45D0

	arm_func_start ov29_022E465C
ov29_022E465C: ; 0x022E465C
	bx lr
	arm_func_end ov29_022E465C

	arm_func_start ov29_022E4660
ov29_022E4660: ; 0x022E4660
	bx lr
	arm_func_end ov29_022E4660

	arm_func_start ov29_022E4664
ov29_022E4664: ; 0x022E4664
	bx lr
	arm_func_end ov29_022E4664

	arm_func_start ov29_022E4668
ov29_022E4668: ; 0x022E4668
	bx lr
	arm_func_end ov29_022E4668

	arm_func_start ov29_022E466C
ov29_022E466C: ; 0x022E466C
	bx lr
	arm_func_end ov29_022E466C

	arm_func_start ov29_022E4670
ov29_022E4670: ; 0x022E4670
	bx lr
	arm_func_end ov29_022E4670

	arm_func_start ov29_022E4674
ov29_022E4674: ; 0x022E4674
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x21
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x21
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4674

	arm_func_start ov29_022E46C0
ov29_022E46C0: ; 0x022E46C0
	ldr ip, _022E46CC ; =ov29_022E56A0
	mov r1, #0x30c
	bx ip
	.align 2, 0
_022E46CC: .word ov29_022E56A0
	arm_func_end ov29_022E46C0

	arm_func_start ov29_022E46D0
ov29_022E46D0: ; 0x022E46D0
	bx lr
	arm_func_end ov29_022E46D0

	arm_func_start ov29_022E46D4
ov29_022E46D4: ; 0x022E46D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022E5ED0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	mov r1, r4
	ldrb r0, [r0, #0x11e]
	mov r2, #1
	mov r3, #0xb
	bl ov29_022EA718
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E46D4

	arm_func_start ov29_022E4704
ov29_022E4704: ; 0x022E4704
	ldr ip, _022E4710 ; =ov29_022E56A0
	mov r1, #0x21c
	bx ip
	.align 2, 0
_022E4710: .word ov29_022E56A0
	arm_func_end ov29_022E4704

	arm_func_start ov29_022E4714
ov29_022E4714: ; 0x022E4714
	bx lr
	arm_func_end ov29_022E4714

	arm_func_start ov29_022E4718
ov29_022E4718: ; 0x022E4718
	bx lr
	arm_func_end ov29_022E4718

	arm_func_start ov29_022E471C
ov29_022E471C: ; 0x022E471C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4768 ; =0x00000131
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4768 ; =0x00000131
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4768: .word 0x00000131
	arm_func_end ov29_022E471C

	arm_func_start ov29_022E476C
ov29_022E476C: ; 0x022E476C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x30
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x30
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E476C

	arm_func_start ov29_022E47B8
ov29_022E47B8: ; 0x022E47B8
	bx lr
	arm_func_end ov29_022E47B8

	arm_func_start ov29_022E47BC
ov29_022E47BC: ; 0x022E47BC
	bx lr
	arm_func_end ov29_022E47BC

	arm_func_start ov29_022E47C0
ov29_022E47C0: ; 0x022E47C0
	bx lr
	arm_func_end ov29_022E47C0

	arm_func_start ov29_022E47C4
ov29_022E47C4: ; 0x022E47C4
	bx lr
	arm_func_end ov29_022E47C4

	arm_func_start ov29_022E47C8
ov29_022E47C8: ; 0x022E47C8
	bx lr
	arm_func_end ov29_022E47C8

	arm_func_start ov29_022E47CC
ov29_022E47CC: ; 0x022E47CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r1, #0xe
	mov r4, r0
	bl MonsterIsType
	cmp r0, #0
	beq _022E4828
	mov r0, r5
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r5
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E4860
_022E4828:
	mov r0, #0xe
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E4860:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E47CC

	arm_func_start ov29_022E4868
ov29_022E4868: ; 0x022E4868
	bx lr
	arm_func_end ov29_022E4868

	arm_func_start ov29_022E486C
ov29_022E486C: ; 0x022E486C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x41
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x41
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E486C

	arm_func_start ov29_022E48B8
ov29_022E48B8: ; 0x022E48B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4910 ; =0x0000011E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x11c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	mov r0, r4
	mov r1, #0x20c
	bl ov29_022E56A0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4910: .word 0x0000011E
	arm_func_end ov29_022E48B8

	arm_func_start ov29_022E4914
ov29_022E4914: ; 0x022E4914
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4960 ; =0x000001AE
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x1ac
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4960: .word 0x000001AE
	arm_func_end ov29_022E4914

	arm_func_start ov29_022E4964
ov29_022E4964: ; 0x022E4964
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E49B0 ; =0x000001B1
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E49B0 ; =0x000001B1
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E49B0: .word 0x000001B1
	arm_func_end ov29_022E4964

	arm_func_start ov29_022E49B4
ov29_022E49B4: ; 0x022E49B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A00 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4A00 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A00: .word 0x000001A9
	arm_func_end ov29_022E49B4

	arm_func_start ov29_022E4A04
ov29_022E4A04: ; 0x022E4A04
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A50 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A50: .word 0x00000192
	arm_func_end ov29_022E4A04

	arm_func_start ov29_022E4A54
ov29_022E4A54: ; 0x022E4A54
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4AA0 ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4AA0: .word 0x0000018E
	arm_func_end ov29_022E4A54

	arm_func_start ov29_022E4AA4
ov29_022E4AA4: ; 0x022E4AA4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AA4

	arm_func_start ov29_022E4AF0
ov29_022E4AF0: ; 0x022E4AF0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AF0

	arm_func_start ov29_022E4B3C
ov29_022E4B3C: ; 0x022E4B3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4B88 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4B88 ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4B88: .word 0x00000171
	arm_func_end ov29_022E4B3C

	arm_func_start ov29_022E4B8C
ov29_022E4B8C: ; 0x022E4B8C
	ldr ip, _022E4B98 ; =ov29_022E56A0
	ldr r1, _022E4B9C ; =0x0000030E
	bx ip
	.align 2, 0
_022E4B98: .word ov29_022E56A0
_022E4B9C: .word 0x0000030E
	arm_func_end ov29_022E4B8C

	arm_func_start ov29_022E4BA0
ov29_022E4BA0: ; 0x022E4BA0
	ldr ip, _022E4BAC ; =ov29_022E56A0
	ldr r1, _022E4BB0 ; =0x0000030E
	bx ip
	.align 2, 0
_022E4BAC: .word ov29_022E56A0
_022E4BB0: .word 0x0000030E
	arm_func_end ov29_022E4BA0

	arm_func_start ov29_022E4BB4
ov29_022E4BB4: ; 0x022E4BB4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4BB4

	arm_func_start ov29_022E4C00
ov29_022E4C00: ; 0x022E4C00
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0xf
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4C00

	arm_func_start ov29_022E4C4C
ov29_022E4C4C: ; 0x022E4C4C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E4C4C

	arm_func_start ov29_022E4C84
ov29_022E4C84: ; 0x022E4C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4CD0 ; =0x000001F7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4CD0 ; =0x000001F7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4CD0: .word 0x000001F7
	arm_func_end ov29_022E4C84

	arm_func_start ov29_022E4CD4
ov29_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4D20 ; =0x000001F9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4D20 ; =0x000001F9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4D20: .word 0x000001F9
	arm_func_end ov29_022E4CD4

	arm_func_start ov29_022E4D24
ov29_022E4D24: ; 0x022E4D24
	bx lr
	arm_func_end ov29_022E4D24

	arm_func_start ov29_022E4D28
ov29_022E4D28: ; 0x022E4D28
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4D80
	mov r0, #0x194
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E4DB8
_022E4D80:
	ldr r0, _022E4DC8 ; =0x00000193
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4DC8 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E4DB8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4DC8: .word 0x00000193
	arm_func_end ov29_022E4D28

	arm_func_start ov29_022E4DCC
ov29_022E4DCC: ; 0x022E4DCC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4E24
	ldr r0, _022E4E6C ; =0x0000018F
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E6C ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E4E5C
_022E4E24:
	ldr r0, _022E4E70 ; =0x00000191
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E70 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E4E5C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4E6C: .word 0x0000018F
_022E4E70: .word 0x00000191
	arm_func_end ov29_022E4DCC

	arm_func_start ov29_022E4E74
ov29_022E4E74: ; 0x022E4E74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4ECC
	ldr r0, _022E4F14 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4F14 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E4F04
_022E4ECC:
	ldr r0, _022E4F18 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E4F04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4F14: .word 0x000001A9
_022E4F18: .word 0x00000192
	arm_func_end ov29_022E4E74

	arm_func_start ov29_022E4F1C
ov29_022E4F1C: ; 0x022E4F1C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4F74
	ldr r0, _022E4FBC ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E4FAC
_022E4F74:
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E4FAC:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4FBC: .word 0x0000018E
	arm_func_end ov29_022E4F1C

	arm_func_start ov29_022E4FC0
ov29_022E4FC0: ; 0x022E4FC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5018
	ldr r0, _022E5060 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5060 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E5050
_022E5018:
	ldr r0, _022E5064 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E5050:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5060: .word 0x000001A9
_022E5064: .word 0x00000192
	arm_func_end ov29_022E4FC0

	arm_func_start ov29_022E5068
ov29_022E5068: ; 0x022E5068
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E50C0
	mov r0, #0x194
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E50F8
_022E50C0:
	ldr r0, _022E5108 ; =0x00000193
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5108 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E50F8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5108: .word 0x00000193
	arm_func_end ov29_022E5068

	arm_func_start ov29_022E510C
ov29_022E510C: ; 0x022E510C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5164
	ldr r0, _022E51AC ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E519C
_022E5164:
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E519C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E51AC: .word 0x0000018E
	arm_func_end ov29_022E510C

	arm_func_start ov29_022E51B0
ov29_022E51B0: ; 0x022E51B0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5208
	ldr r0, _022E5250 ; =0x0000018F
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5250 ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E5240
_022E5208:
	ldr r0, _022E5254 ; =0x00000191
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5254 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E5240:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5250: .word 0x0000018F
_022E5254: .word 0x00000191
	arm_func_end ov29_022E51B0

	arm_func_start ov29_022E5258
ov29_022E5258: ; 0x022E5258
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E52B0
	mov r0, #0x18c
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E52E8
_022E52B0:
	mov r0, #0xd
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xd
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E52E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov29_022E5258

	arm_func_start ov29_022E52F8
ov29_022E52F8: ; 0x022E52F8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5350
	ldr r0, _022E5398 ; =0x0000018D
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5398 ; =0x0000018D
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E5388
_022E5350:
	mov r0, #0xe
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E5388:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5398: .word 0x0000018D
	arm_func_end ov29_022E52F8

	arm_func_start ov29_022E539C
ov29_022E539C: ; 0x022E539C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E53E8 ; =0x00000143
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E53E8 ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E53E8: .word 0x00000143
	arm_func_end ov29_022E539C

	arm_func_start ov29_022E53EC
ov29_022E53EC: ; 0x022E53EC
	bx lr
	arm_func_end ov29_022E53EC

	arm_func_start ov29_022E53F0
ov29_022E53F0: ; 0x022E53F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x19
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x19
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E53F0

	arm_func_start ov29_022E543C
ov29_022E543C: ; 0x022E543C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E543C

	arm_func_start ov29_022E5474
ov29_022E5474: ; 0x022E5474
	bx lr
	arm_func_end ov29_022E5474

	arm_func_start ov29_022E5478
ov29_022E5478: ; 0x022E5478
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022E5508 ; =0x02353538
	mov r4, r0
	ldr r2, [r2]
	ldr r0, [r1, #8]
	ldrb r1, [r2, #0x1c5]
	cmp r1, #0
	beq _022E54A0
	bl ov29_0230D618
_022E54A0:
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E54BC
_022E54AC: ; jump table
	b _022E54BC ; case 0
	b _022E54C4 ; case 1
	b _022E54CC ; case 2
	b _022E54D4 ; case 3
_022E54BC:
	mov r1, #8
	b _022E54D8
_022E54C4:
	mov r1, #9
	b _022E54D8
_022E54CC:
	mov r1, #0xa
	b _022E54D8
_022E54D4:
	mov r1, #0xb
_022E54D8:
	mov ip, #0
	mov r2, #1
	str ip, [sp]
	str r2, [sp, #4]
	sub r0, r2, #2
	str r0, [sp, #8]
	mov r0, r4
	mov r3, #3
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5508: .word 0x02353538
	arm_func_end ov29_022E5478

	arm_func_start ov29_022E550C
ov29_022E550C: ; 0x022E550C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E5558 ; =0x0000013E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x13c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5558: .word 0x0000013E
	arm_func_end ov29_022E550C

	arm_func_start ov29_022E555C
ov29_022E555C: ; 0x022E555C
	bx lr
	arm_func_end ov29_022E555C

	arm_func_start ov29_022E5560
ov29_022E5560: ; 0x022E5560
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r1
	cmp r2, #1
	bne _022E55B0
	mov r0, #0xf8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf8
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	b _022E55E8
_022E55B0:
	mov r0, #0xf9
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf9
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
_022E55E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E5560

	arm_func_start ov29_022E55F0
ov29_022E55F0: ; 0x022E55F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #0x2a
	mov r4, r1
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x2a
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E55F0

	arm_func_start ov29_022E563C
ov29_022E563C: ; 0x022E563C
	ldr ip, _022E564C ; =ov29_022E3820
	mov r1, #0x90
	mov r2, #1
	bx ip
	.align 2, 0
_022E564C: .word ov29_022E3820
	arm_func_end ov29_022E563C

	arm_func_start ov29_022E5650
ov29_022E5650: ; 0x022E5650
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r0, _022E569C ; =0x00000167
	mov r4, r1
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E569C ; =0x00000167
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E569C: .word 0x00000167
	arm_func_end ov29_022E5650

	arm_func_start ov29_022E56A0
ov29_022E56A0: ; 0x022E56A0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E56BC
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
_022E56BC:
	bl ov29_022E5ED0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56A0

	arm_func_start ov29_022E56D4
ov29_022E56D4: ; 0x022E56D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56D4

	arm_func_start ov29_022E56F4
ov29_022E56F4: ; 0x022E56F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _022E5710
	mov r0, r4
	bl ov29_022EACE4
	ldmia sp!, {r4, pc}
_022E5710:
	bl ov29_022E5ED0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E56F4

	arm_func_start ov29_022E5728
ov29_022E5728: ; 0x022E5728
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _022E5740
	ldr r0, _022E5760 ; =0x0000130E
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E5740:
	cmp r1, #1
	bne _022E5754
	ldr r0, _022E5764 ; =0x0000130D
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E5754:
	ldr r0, _022E5768 ; =0x0000130C
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5760: .word 0x0000130E
_022E5764: .word 0x0000130D
_022E5768: .word 0x0000130C
	arm_func_end ov29_022E5728

	arm_func_start ov29_022E576C
ov29_022E576C: ; 0x022E576C
	stmdb sp!, {r3, lr}
	ldr r0, [r1, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E578C
	ldr r0, _022E5798 ; =0x00001306
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E578C:
	ldr r0, _022E579C ; =0x00001307
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5798: .word 0x00001306
_022E579C: .word 0x00001307
	arm_func_end ov29_022E576C

	arm_func_start ov29_022E57A0
ov29_022E57A0: ; 0x022E57A0
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _022E57C0
	ldr r0, _022E57CC ; =0x00001306
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
_022E57C0:
	ldr r0, _022E57D0 ; =0x00001307
	bl ov29_022EACCC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E57CC: .word 0x00001306
_022E57D0: .word 0x00001307
	arm_func_end ov29_022E57A0

	arm_func_start ov29_022E57D4
ov29_022E57D4: ; 0x022E57D4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E585C ; =0x0000025A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x258
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	ldr r0, _022E5860 ; =0x0000025B
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	sub r1, r2, #1
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, _022E5860 ; =0x0000025B
	mov r0, r4
	mov r2, #1
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E585C: .word 0x0000025A
_022E5860: .word 0x0000025B
	arm_func_end ov29_022E57D4

	arm_func_start ov29_022E5864
ov29_022E5864: ; 0x022E5864
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x16
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x16
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E5864

	arm_func_start ov29_022E58B0
ov29_022E58B0: ; 0x022E58B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r2
	mov sl, r0
	mov r5, r1
	cmp r4, #0x11
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r5
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsh r0, [r5]
	mov r2, #0x18
	add r1, sp, #0
	smulbb r0, r0, r2
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	mov r0, r0, asr #8
	strh r0, [sp]
	ldrsh r3, [r5, #2]
	mov r0, r4
	smulbb r2, r3, r2
	add r2, r2, #0x10
	mov r2, r2, lsl #8
	mov r2, r2, asr #8
	strh r2, [sp, #2]
	bl ov10_022BEC08
	cmp r4, #4
	mov r6, r0
	cmpne r4, #0x18
	bne _022E5944
	mov r0, #0
	mov r1, #0x308
	bl ov29_022E56A0
	mov r0, #0x28
	mov r1, #0x33
	bl ov29_022EA370
	b _022E59C4
_022E5944:
	cmp r4, #8
	bne _022E59B8
	ldr sb, [sl, #0xb4]
	mov r7, #0
	mov r0, r6, lsl #0x10
	ldrb r8, [sb, #0x4c]
	mov r4, r0, asr #0x10
	mov r5, r7
	mov fp, #2
	b _022E59A4
_022E596C:
	sub r0, r8, #1
	and r8, r0, #7
	mov r0, sl
	mov r1, r5
	mov r2, r8
	bl ov29_023049A8
	mov r0, fp
	mov r1, #0x33
	bl ov29_022EA370
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E59AC
	add r7, r7, #2
_022E59A4:
	cmp r7, #0x3e8
	blt _022E596C
_022E59AC:
	and r0, r8, #7
	strb r0, [sb, #0x4c]
	b _022E59C4
_022E59B8:
	mov r0, #0x28
	mov r1, #0x33
	bl ov29_022EA370
_022E59C4:
	mov r0, r6, lsl #0x10
	mov r7, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E59F4
_022E59D8:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r7, r7, #1
_022E59F4:
	cmp r7, #0x3e8
	blt _022E59D8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_022E58B0

	arm_func_start ov29_022E5A00
ov29_022E5A00: ; 0x022E5A00
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r4, r1
	bl ov29_022E5ED0
	cmp r0, #0
	beq _022E5AD4
	ldrb r0, [r4]
	ldr r1, [r5, #0xc]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r4, #0
	ldreqsh r4, [r4, #4]
	mov r1, r1, asr #8
	ldr r0, _022E5ADC ; =0x02353538
	strh r1, [sp, #4]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #6]
	ldr r0, _022E5AE0 ; =0x0001A226
	ldrsh r3, [sp, #6]
	ldrsh r1, [r1, r0]
	add r0, sp, #8
	add r2, r5, #0x2c
	sub r1, r3, r1
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, #4
	add r5, r3, #1
	bl sub_0201D034
	add r1, sp, #4
	add r2, sp, #8
	mov r0, r4
	mov r3, #0
	str r5, [sp]
	bl ov10_022BEC94
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E5ACC
_022E5AB0:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E5AD4
	add r6, r6, #1
_022E5ACC:
	cmp r6, #0x3e8
	blt _022E5AB0
_022E5AD4:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5ADC: .word 0x02353538
_022E5AE0: .word 0x0001A226
	arm_func_end ov29_022E5A00

	arm_func_start ov29_022E5AE4
ov29_022E5AE4: ; 0x022E5AE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r4, r1
	bl ov29_022E5ED0
	cmp r0, #0
	beq _022E5BC8
	ldrb r0, [r4]
	ldr r1, [r5, #0xc]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r4, #0
	ldreqsh r4, [r4, #4]
	mov r1, r1, asr #8
	ldr r0, _022E5BD0 ; =0x02353538
	strh r1, [sp, #4]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #6]
	ldr r0, _022E5BD4 ; =0x0001A226
	ldrsh r3, [sp, #6]
	ldrsh r1, [r1, r0]
	add r0, sp, #8
	add r2, r5, #0x2c
	sub r1, r3, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #1
	mov r3, r1, lsl #0x10
	mov r1, #4
	mov r5, r3, asr #0x10
	bl sub_0201D034
	add r1, sp, #4
	add r2, sp, #8
	mov r0, r4
	mov r3, #1
	str r5, [sp]
	bl ov10_022BEC94
	mov r0, r0, lsl #0x10
	mov r6, #0
	mov r4, r0, asr #0x10
	mov r5, #0x42
	b _022E5BC0
_022E5B9C:
	mov r0, r5
	bl AdvanceFrame
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E5BC8
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E5BC0:
	cmp r6, #0x3e8
	blt _022E5B9C
_022E5BC8:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5BD0: .word 0x02353538
_022E5BD4: .word 0x0001A226
	arm_func_end ov29_022E5AE4

	arm_func_start ov29_022E5BD8
ov29_022E5BD8: ; 0x022E5BD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r5, r0
	bl ov29_022E272C
	cmp r0, #0
	beq _022E5D4C
	ldr r1, [r5, #0xb4]
	ldr r0, [r5, #0xc]
	ldrb r4, [r1, #0x4c]
	mov r1, r0, asr #8
	ldr r0, _022E5D58 ; =0x02353538
	strh r1, [sp, #0x10]
	ldr r2, [r5, #0x10]
	ldr r1, [r0]
	mov r0, r2, asr #8
	strh r0, [sp, #0x12]
	ldr r0, _022E5D5C ; =0x0001A226
	ldrsh r2, [sp, #0x12]
	ldrsh r1, [r1, r0]
	add r0, sp, #0x14
	sub r1, r2, r1
	add r1, r1, r1, lsr #31
	mov sl, r1, asr #1
	bl ov10_022BF274
	mov r5, #0
	ldrsh r3, [sp, #0x10]
	ldrsh r2, [sp, #0x12]
	ldr r6, _022E5D60 ; =0x00000165
	sub r1, r5, #1
	add r0, sp, #0x30
	str r6, [sp, #0x14]
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	strh r5, [sp, #0x24]
	strh r5, [sp, #0x26]
	strb r1, [sp, #0x28]
	str sl, [sp, #0x2c]
	bl sub_0201C000
	add r0, sp, #0x14
	mov r1, r5
	bl ov10_022BF2B4
	ldr r2, _022E5D64 ; =0x0235171C
	mov sb, r5
	add r1, r2, r4, lsl #2
	mov r3, r4, lsl #2
	ldrh r2, [r2, r3]
	ldrh r1, [r1, #2]
	mov r0, r0, lsl #0x10
	strh r2, [sp, #0xc]
	strh r1, [sp, #0xe]
	ldrsh r8, [sp, #0xc]
	ldrsh r7, [sp, #0xe]
	ldr r4, _022E5D58 ; =0x02353538
	ldr fp, _022E5D5C ; =0x0001A226
	mov r5, r0, asr #0x10
	mov r6, sb
_022E5CC0:
	mov r0, r5
	add r1, sp, #0x10
	mov r2, r6
	mov r3, sl
	str r6, [sp]
	bl ov10_022BF45C
	mov r0, #0x42
	bl AdvanceFrame
	ldrsh r0, [sp, #0x12]
	ldrsh r1, [sp, #0x10]
	add sb, sb, #1
	add r0, r0, r7, lsl #2
	add r1, r1, r8, lsl #2
	strh r0, [sp, #0x12]
	strh r1, [sp, #0x10]
	ldr r0, [r4]
	ldrsh r1, [sp, #0x12]
	ldrsh r0, [r0, fp]
	cmp sb, #6
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	mov sl, r0, asr #1
	blt _022E5CC0
	bl ov10_022BDC68
	ldrsh r2, [sp, #0x10]
	ldrsh r1, [sp, #0x12]
	add r0, sp, #4
	mov r4, r2, lsl #8
	mov r3, r1, lsl #8
	mov r1, #0x1a0
	mov r2, #1
	str r4, [sp, #4]
	str r3, [sp, #8]
	bl ov29_022E3820
	b _022E5D50
_022E5D4C:
	mvn r0, #0
_022E5D50:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E5D58: .word 0x02353538
_022E5D5C: .word 0x0001A226
_022E5D60: .word 0x00000165
_022E5D64: .word 0x0235171C
	arm_func_end ov29_022E5BD8

	arm_func_start ov29_022E5D68
ov29_022E5D68: ; 0x022E5D68
	stmdb sp!, {r4, lr}
	mov r4, #0x3f00
	bl GetFloorType
	cmp r0, #0
	beq _022E5D88
	cmp r0, #1
	cmpne r0, #2
	beq _022E5DA4
_022E5D88:
	ldr r0, _022E5DB0 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	ldrne r4, _022E5DB4 ; =0x0000130A
	ldreq r4, _022E5DB8 ; =0x00001309
_022E5DA4:
	mov r0, r4
	bl ov29_022EACCC
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5DB0: .word 0x02353538
_022E5DB4: .word 0x0000130A
_022E5DB8: .word 0x00001309
	arm_func_end ov29_022E5D68

	arm_func_start ov29_022E5DBC
ov29_022E5DBC: ; 0x022E5DBC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #3
	bne _022E5DD8
	mov r0, #0
	bl ov29_022EAE14
_022E5DD8:
	cmp r5, #4
	beq _022E5E10
	cmp r4, #3
	bne _022E5DFC
	ldr r0, _022E5E7C ; =0x0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACCC
	b _022E5E3C
_022E5DFC:
	ldr r0, _022E5E7C ; =0x0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACE4
	b _022E5E3C
_022E5E10:
	cmp r4, #3
	bne _022E5E2C
	ldr r0, _022E5E80 ; =0x02351194
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACCC
	b _022E5E3C
_022E5E2C:
	ldr r0, _022E5E7C ; =0x0235119C
	mov r1, r4, lsl #1
	ldrh r0, [r0, r1]
	bl ov29_022EACE4
_022E5E3C:
	mov r0, r5
	mov r1, r4
	mov r2, #0x80
	bl ov29_022E6A00
	mov r4, #0x46
	b _022E5E5C
_022E5E54:
	mov r0, r4
	bl AdvanceFrame
_022E5E5C:
	bl ov29_022E6C08
	cmp r0, #0
	bne _022E5E54
	bl ov29_022E6CE0
	bl ov29_02339148
	mov r0, #1
	bl ov29_0234B1A4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E5E7C: .word 0x0235119C
_022E5E80: .word 0x02351194
	arm_func_end ov29_022E5DBC

	arm_func_start ov29_022E5E84
ov29_022E5E84: ; 0x022E5E84
	stmdb sp!, {r4, r5, r6, lr}
	mov r1, #8
	mov r2, r1
	mov r6, r0
	bl ov29_023049A8
	mov r5, #0
	mov r4, #0x51
	b _022E5EC4
_022E5EA4:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6, #0x58]
	tst r0, #3
	ldreqb r0, [r6, #0xaf]
	cmpeq r0, #8
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E5EC4:
	cmp r5, #0x64
	blt _022E5EA4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022E5E84

	arm_func_start ov29_022E5ED0
ov29_022E5ED0: ; 0x022E5ED0
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x20]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022E5F1C ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldrb r2, [r1, #0x23e]
	cmp r2, #0
	beq _022E5F14
	ldr r1, [r1, #0x22c]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_022E5F14:
	bl ov29_022E272C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5F1C: .word 0x02353538
	arm_func_end ov29_022E5ED0

	arm_func_start ov29_022E5F20
ov29_022E5F20: ; 0x022E5F20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r0, _022E5FDC ; =0x00000199
	mov r8, #0
	ldr fp, _022E5FE0 ; =0x02353538
	rsb r4, r0, #0x198
	mov r7, r8
	mov r6, #2
	mov r5, r8
_022E5F44:
	ldr r0, [fp]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__022E37B8
	cmp r0, #0
	ldrne sl, [sb, #0xb4]
	ldrneb r0, [sl, #0xfc]
	cmpne r0, #0
	beq _022E5FC8
	ldr r0, _022E5FDC ; =0x00000199
	strb r7, [sl, #0xfc]
	bl GetEffectAnimationField0x19
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	and r3, r0, #0xff
	ldr r1, _022E5FDC ; =0x00000199
	str r5, [sp, #0xc]
	mov r0, sb
	mov r2, r5
	bl ov29_022E35E4
	ldrb r0, [sl, #6]
	cmp r0, #0
	bne _022E5FC8
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022E5FE4 ; =0x00000B92
	mov r0, sb
	bl LogMessageByIdWithPopup
_022E5FC8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022E5F44
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E5FDC: .word 0x00000199
_022E5FE0: .word 0x02353538
_022E5FE4: .word 0x00000B92
	arm_func_end ov29_022E5F20

	arm_func_start ov29_022E5FE8
ov29_022E5FE8: ; 0x022E5FE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r2, _022E60D4 ; =0x02353538
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	add r0, r0, #0x1a000
	ldr r4, [r0, #0x22c]
	cmp r4, #0
	bne _022E6018
	bl GetLeader
	mov r4, r0
_022E6018:
	ldr r0, _022E60D8 ; =0x023511DC
	mov r1, r6, lsl #1
	ldrh r1, [r0, r1]
	cmp r1, #0x3f00
	beq _022E6034
	mov r0, r4
	bl ov29_022E56A0
_022E6034:
	ldr r0, _022E60DC ; =0x0235122C
	ldr r7, [r0, r6, lsl #2]
	cmp r7, #0
	blt _022E60CC
	cmp r5, #0
	beq _022E6090
	bl ov29_022E0880
	cmp r0, #0
	bne _022E6090
	mov r0, r7
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r7
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	b _022E60CC
_022E6090:
	ldr r0, _022E60E0 ; =0x0235124C
	ldr r5, [r0, r6, lsl #2]
	mov r0, r5
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r5
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
_022E60CC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E60D4: .word 0x02353538
_022E60D8: .word 0x023511DC
_022E60DC: .word 0x0235122C
_022E60E0: .word 0x0235124C
	arm_func_end ov29_022E5FE8

	arm_func_start ov29_022E60E4
ov29_022E60E4: ; 0x022E60E4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x29
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x29
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E60E4

	arm_func_start ov29_022E6130
ov29_022E6130: ; 0x022E6130
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6178 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6178 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6178: .word 0x000001A9
	arm_func_end ov29_022E6130

	arm_func_start ov29_022E617C
ov29_022E617C: ; 0x022E617C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E61C4 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E61C4 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E61C4: .word 0x000001A9
	arm_func_end ov29_022E617C

	arm_func_start ov29_022E61C8
ov29_022E61C8: ; 0x022E61C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6210 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6210 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6210: .word 0x000001A9
	arm_func_end ov29_022E61C8

	arm_func_start ov29_022E6214
ov29_022E6214: ; 0x022E6214
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E625C ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E625C ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E625C: .word 0x000001A9
	arm_func_end ov29_022E6214

	arm_func_start ov29_022E6260
ov29_022E6260: ; 0x022E6260
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6260

	arm_func_start ov29_022E62A8
ov29_022E62A8: ; 0x022E62A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x29
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x29
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E62A8

	arm_func_start ov29_022E62F0
ov29_022E62F0: ; 0x022E62F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x48
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x48
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E62F0

	arm_func_start ov29_022E6338
ov29_022E6338: ; 0x022E6338
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6384 ; =0x000001A6
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x1a4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6384: .word 0x000001A6
	arm_func_end ov29_022E6338

	arm_func_start ov29_022E6388
ov29_022E6388: ; 0x022E6388
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E63D4 ; =0x00000297
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E63D4 ; =0x00000297
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E63D4: .word 0x00000297
	arm_func_end ov29_022E6388

	arm_func_start ov29_022E63D8
ov29_022E63D8: ; 0x022E63D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6420 ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r2, #0
	mov r1, #2
	stmia sp, {r1, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	add r1, r1, #0x18c
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6420: .word 0x0000018E
	arm_func_end ov29_022E63D8

	arm_func_start ov29_022E6424
ov29_022E6424: ; 0x022E6424
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1b0
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1b0
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	mov r0, #0xa
	mov r1, #0x42
	bl ov29_022EA370
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6424

	arm_func_start ov29_022E647C
ov29_022E647C: ; 0x022E647C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1a8
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1a8
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E647C

	arm_func_start ov29_022E64C4
ov29_022E64C4: ; 0x022E64C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E650C ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E650C ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E650C: .word 0x000001A9
	arm_func_end ov29_022E64C4

	arm_func_start ov29_022E6510
ov29_022E6510: ; 0x022E6510
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6558 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E6558 ; =0x000001A9
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6558: .word 0x000001A9
	arm_func_end ov29_022E6510

	arm_func_start ov29_022E655C
ov29_022E655C: ; 0x022E655C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E65A4 ; =0x000001AB
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	ldr r1, _022E65A4 ; =0x000001AB
	mov r0, r4
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E65A4: .word 0x000001AB
	arm_func_end ov29_022E655C

	arm_func_start ov29_022E65A8
ov29_022E65A8: ; 0x022E65A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E65A8

	arm_func_start ov29_022E65F4
ov29_022E65F4: ; 0x022E65F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6640 ; =0x0000011E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x11c
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6640: .word 0x0000011E
	arm_func_end ov29_022E65F4

	arm_func_start ov29_022E6644
ov29_022E6644: ; 0x022E6644
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E6690 ; =0x0000011D
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E6690 ; =0x0000011D
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6690: .word 0x0000011D
	arm_func_end ov29_022E6644

	arm_func_start ov29_022E6694
ov29_022E6694: ; 0x022E6694
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, _022E66C0 ; =0x0000019E
	mov r2, #1
	bl ov29_022E37DC
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, #9
	bl ov29_022E56F4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E66C0: .word 0x0000019E
	arm_func_end ov29_022E6694

	arm_func_start ov29_022E66C4
ov29_022E66C4: ; 0x022E66C4
	ldr ip, _022E66D4 ; =ov29_022E37DC
	mov r1, #0x36
	mov r2, #1
	bx ip
	.align 2, 0
_022E66D4: .word ov29_022E37DC
	arm_func_end ov29_022E66C4

	arm_func_start ov29_022E66D8
ov29_022E66D8: ; 0x022E66D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E66D8

	arm_func_start ov29_022E6724
ov29_022E6724: ; 0x022E6724
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1b4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1b4
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6724

	arm_func_start ov29_022E6770
ov29_022E6770: ; 0x022E6770
	ldr ip, _022E6780 ; =ov29_022E37DC
	mov r1, #0x37
	mov r2, #1
	bx ip
	.align 2, 0
_022E6780: .word ov29_022E37DC
	arm_func_end ov29_022E6770

	arm_func_start ov29_022E6784
ov29_022E6784: ; 0x022E6784
	ldr ip, _022E6794 ; =ov29_022E37DC
	mov r1, #0x29
	mov r2, #1
	bx ip
	.align 2, 0
_022E6794: .word ov29_022E37DC
	arm_func_end ov29_022E6784

	arm_func_start ov29_022E6798
ov29_022E6798: ; 0x022E6798
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x18
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18
	mov r2, #1
	str ip, [sp, #0xc]
	bl ov29_022E35E4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6798

	arm_func_start ov29_022E67E4
ov29_022E67E4: ; 0x022E67E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, r2
	mov r5, #0x200
	bl ov29_022E5ED0
	cmp r0, #0
	beq _022E68AC
	mov r0, r7
	bl GetEffectAnimationField0x19
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r7
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl ov29_022E35E4
	mov r0, r4
	mov r1, #0x42
	bl ov29_022EA370
	mov r4, #0x42
	ldr sb, _022E68B4 ; =0x02353538
	ldr r7, _022E68B8 ; =0x0001A226
	mvn r8, #7
	b _022E6894
_022E6860:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6, #0x1c]
	add r2, r0, r5
	str r2, [r6, #0x1c]
	ldr r0, [sb]
	ldr r1, [r6, #0x10]
	ldrsh r0, [r0, r7]
	sub r1, r1, r2
	add r5, r5, #0x100
	rsb r0, r0, r1, asr #8
	cmp r0, r8
	blt _022E68A0
_022E6894:
	ldr r0, [r6, #0x1c]
	cmp r0, #0xc800
	blt _022E6860
_022E68A0:
	mov r0, #0
	strb r0, [r6, #0x20]
	bl ov29_022E38E0
_022E68AC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E68B4: .word 0x02353538
_022E68B8: .word 0x0001A226
	arm_func_end ov29_022E67E4

	arm_func_start ov29_022E68BC
ov29_022E68BC: ; 0x022E68BC
	ldr ip, _022E68D0 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E68D4 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E68D0: .word ov29_022E67E4
_022E68D4: .word 0x0000013E
	arm_func_end ov29_022E68BC

	arm_func_start ov29_022E68D8
ov29_022E68D8: ; 0x022E68D8
	ldr ip, _022E68EC ; =ov29_022E67E4
	mov r1, r0
	mov r0, #0x1bc
	mov r2, #0xe
	bx ip
	.align 2, 0
_022E68EC: .word ov29_022E67E4
	arm_func_end ov29_022E68D8

	arm_func_start ov29_022E68F0
ov29_022E68F0: ; 0x022E68F0
	ldr ip, _022E6904 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E6908 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E6904: .word ov29_022E67E4
_022E6908: .word 0x0000013E
	arm_func_end ov29_022E68F0

	arm_func_start ov29_022E690C
ov29_022E690C: ; 0x022E690C
	ldr ip, _022E6920 ; =ov29_022E67E4
	mov r1, r0
	ldr r0, _022E6924 ; =0x0000013E
	mov r2, #5
	bx ip
	.align 2, 0
_022E6920: .word ov29_022E67E4
_022E6924: .word 0x0000013E
	arm_func_end ov29_022E690C

	arm_func_start ov29_022E6928
ov29_022E6928: ; 0x022E6928
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	ldr r3, _022E69F8 ; =0x023511B0
	mov r4, r1
	add r2, sp, #0x10
	mov r5, r0
	mov r1, #6
_022E6944:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6944
	ldr r0, _022E69FC ; =0x0000027A
	bl GetEffectAnimationField0x19
	mov r3, #2
	mov r1, r4, lsr #0x1f
	mov ip, r0
	rsb r0, r1, r4, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x10
	str r3, [sp]
	mov r2, #0
	add r1, r3, #0x278
	str r2, [sp, #4]
	mov r0, r0, asr #0x10
	str r0, [sp, #8]
	add r4, sp, #0x10
	mov r0, r5
	and r3, ip, #0xff
	str r4, [sp, #0xc]
	bl ov29_022E35E4
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r6, #0
	mov r4, #0x42
	b _022E69D8
_022E69B4:
	mov r0, r5
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E69E0
	mov r0, r4
	bl AdvanceFrame
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E69D8:
	cmp r6, #0x64
	blt _022E69B4
_022E69E0:
	cmp r5, #0
	blt _022E69F0
	mov r0, r5
	bl ov10_022BDE50
_022E69F0:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022E69F8: .word 0x023511B0
_022E69FC: .word 0x0000027A
	arm_func_end ov29_022E6928

	arm_func_start ov29_022E6A00
ov29_022E6A00: ; 0x022E6A00
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x38
	mov r8, r0
	mov r7, r1
	mov r4, r2
	mov r5, #0
	bl GetLeader
	mov r6, r0
	mov r0, #0xcc
	mov r1, #7
	bl MemAlloc
	ldr r1, _022E6BF8 ; =0x0235354C
	add r2, r7, #1
	str r0, [r1, #4]
	str r8, [r0]
	ldr r0, [r1, #4]
	mov r2, r2, lsl #2
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	ldr r3, _022E6BFC ; =0x023511A4
	str r4, [r0, #4]
	add r2, sp, #0
	mov r4, r5
	mov r1, #6
_022E6A60:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6A60
	b _022E6BDC
_022E6A74:
	add r0, sp, #0xc
	bl ov10_022BF274
	ldr r0, _022E6BF8 ; =0x0235354C
	ldr r2, _022E6C00 ; =0x02351464
	ldr r7, [r0, #4]
	mov r0, #0x18
	ldr r3, [r7]
	mov r1, #0
	mla r0, r3, r0, r2
	mov r2, r5, lsl #3
	ldrsh r0, [r2, r0]
	str r4, [sp, #0x10]
	str r1, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r1, [r6, #0xc]
	mov r0, #2
	mov r1, r1, asr #8
	strh r1, [sp, #0x18]
	ldr r1, [r6, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0x1a]
	bl RandIntSafe
	ldr r3, [r7]
	ldr r2, _022E6C00 ; =0x02351464
	mov r1, #0x18
	mla r1, r3, r1, r2
	add r1, r1, r5, lsl #3
	ldr r2, [r1, #4]
	add r1, r7, r4, lsl #2
	add r2, r0, r2, lsl #1
	mov r0, #0xff
	str r2, [r1, #0x4c]
	bl RandIntSafe
	ldr r1, _022E6BF8 ; =0x0235354C
	mov r2, r4, lsl #1
	ldr r1, [r1, #4]
	add r3, r0, #0x9f
	add r1, r1, r4, lsl #2
	add r0, r2, #8
	strh r3, [r1, #0x8c]
	bl RandIntSafe
	mov r2, r4, lsr #0x1f
	rsb r1, r2, r4, lsl #30
	add r2, r2, r1, ror #30
	mov r1, #0x28
	mul r7, r2, r1
	rsb r2, r7, #0x18
	ldr r3, _022E6BF8 ; =0x0235354C
	add r2, r2, r0
	ldr r1, [r3, #4]
	mov r7, #4
	add r0, r1, r4, lsl #2
	strh r2, [r0, #0x8e]
	ldr r1, [r3, #4]
	ldr r0, _022E6C04 ; =0x0000FFFF
	add r2, r1, r4, lsl #2
	ldrsh r1, [r2, #0x8c]
	add r3, sp, #0
	strh r1, [sp, #0x1c]
	ldrsh ip, [r2, #0x8e]
	add r2, sp, #0x28
	mov r1, #6
	strh ip, [sp, #0x1e]
	strb r7, [sp, #0x20]
	str r0, [sp, #0x24]
_022E6B78:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E6B78
	add r0, sp, #0xc
	mov r1, #0
	bl ov10_022BF2B4
	ldr r1, _022E6BF8 ; =0x0235354C
	add r5, r5, #1
	ldr r2, [r1, #4]
	cmp r5, #3
	add r2, r2, r4, lsl #2
	str r0, [r2, #0xc]
	bge _022E6BD4
	ldr r0, [r1, #4]
	ldr r1, _022E6C00 ; =0x02351464
	ldr r2, [r0]
	mov r0, #0x18
	mla r0, r2, r0, r1
	mov r1, r5, lsl #3
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bne _022E6BD8
_022E6BD4:
	mov r5, #0
_022E6BD8:
	add r4, r4, #1
_022E6BDC:
	ldr r0, _022E6BF8 ; =0x0235354C
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r4, r0
	blt _022E6A74
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E6BF8: .word 0x0235354C
_022E6BFC: .word 0x023511A4
_022E6C00: .word 0x02351464
_022E6C04: .word 0x0000FFFF
	arm_func_end ov29_022E6A00

	arm_func_start ov29_022E6C08
ov29_022E6C08: ; 0x022E6C08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r0, _022E6CDC ; =0x0235354C
	mov sl, #0
	ldr r1, [r0, #4]
	mov sb, #0
	ldr r0, [r1, #4]
	mov r6, #1
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r1, #4]
	movne sb, #1
	mvn r7, #0x9e
	mov r8, #0x9f
	mov r5, sl
	ldr r4, _022E6CDC ; =0x0235354C
	b _022E6CC0
_022E6C4C:
	ldr r0, [r4, #4]
	add r2, r0, sl, lsl #2
	ldrsh r1, [r2, #0x8c]
	ldr r0, [r2, #0x4c]
	sub r0, r1, r0
	strh r0, [r2, #0x8c]
	ldr r2, [r4, #4]
	add r1, r2, sl, lsl #2
	ldrsh r0, [r1, #0x8c]
	cmp r0, r7
	bgt _022E6C8C
	ldr r0, [r2, #4]
	cmp r0, #0
	strgth r8, [r1, #0x8c]
	strleh r7, [r1, #0x8c]
	b _022E6C90
_022E6C8C:
	mov sb, r6
_022E6C90:
	ldr r2, [r4, #4]
	mov r1, r5
	str r5, [sp]
	add r0, r2, sl, lsl #2
	ldr r0, [r0, #0xc]
	add r2, r2, #0x8c
	mov r0, r0, lsl #0x10
	mov r3, r5
	mov r0, r0, asr #0x10
	add r2, r2, sl, lsl #2
	bl ov10_022BF45C
	add sl, sl, #1
_022E6CC0:
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	cmp sl, r0
	blt _022E6C4C
	mov r0, sb
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E6CDC: .word 0x0235354C
	arm_func_end ov29_022E6C08

	arm_func_start ov29_022E6CE0
ov29_022E6CE0: ; 0x022E6CE0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _022E6D64 ; =0x0235354C
	ldr r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
	b _022E6D34
_022E6CFC:
	add r0, r1, r4, lsl #2
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl AnimationHasMoreFrames
	cmp r0, #0
	beq _022E6D30
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022E6D30:
	add r4, r4, #1
_022E6D34:
	ldr r1, [r5, #4]
	ldr r0, [r1, #8]
	cmp r4, r0
	blt _022E6CFC
	bl ov10_022BDC68
	ldr r0, _022E6D64 ; =0x0235354C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022E6D64 ; =0x0235354C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6D64: .word 0x0235354C
	arm_func_end ov29_022E6CE0

	arm_func_start ov29_022E6D68
ov29_022E6D68: ; 0x022E6D68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022E6DCC ; =0x02353538
	mov r4, #0
	ldr r3, [r3]
	add r3, r3, #0x218
	add lr, r3, #0x400
	mvn r3, #0
	b _022E6DC0
_022E6D88:
	ldr ip, [lr, r4, lsl #4]
	add r5, lr, r4, lsl #4
	cmp ip, r3
	bne _022E6DBC
	str r0, [r5]
	str r1, [r5, #0xc]
	str r2, [r5, #4]
	ldr r0, [r5]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BEFD8
	strb r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
_022E6DBC:
	add r4, r4, #1
_022E6DC0:
	cmp r4, #3
	blt _022E6D88
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6DCC: .word 0x02353538
	arm_func_end ov29_022E6D68

	arm_func_start ov29_022E6DD0
ov29_022E6DD0: ; 0x022E6DD0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, #0
	ldr r4, _022E6E3C ; =0x02353538
	mov r7, sb
	mov r8, #1
	mvn r6, #0
	mov r5, sb
_022E6DEC:
	ldr r0, [r4]
	add r0, r0, #0x218
	add r0, r0, #0x400
	ldr r1, [r0, sb, lsl #4]
	add sl, r0, sb, lsl #4
	cmp r1, #0
	movge r0, r8
	movlt r0, r7
	tst r0, #0xff
	beq _022E6E2C
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	bl AnimationHasMoreFrames
	cmp r0, #0
	streq r6, [sl]
	streq r5, [sl, #0xc]
_022E6E2C:
	add sb, sb, #1
	cmp sb, #3
	blt _022E6DEC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E6E3C: .word 0x02353538
	arm_func_end ov29_022E6DD0

	arm_func_start ov29_022E6E40
ov29_022E6E40: ; 0x022E6E40
	mov ip, #0
	ldr r1, _022E6E7C ; =0x02353538
	mvn r3, #0
	mov r2, ip
_022E6E50:
	ldr r0, [r1]
	add r0, r0, #0x218
	add r0, r0, #0x400
	str r3, [r0, ip, lsl #4]
	add r0, r0, ip, lsl #4
	str r2, [r0, #4]
	arm_func_end ov29_022E6E40

	arm_func_start ov29_022E6E68
ov29_022E6E68: ; 0x022E6E68
	add ip, ip, #1
	str r2, [r0, #0xc]
	cmp ip, #3
	blt _022E6E50
	bx lr
	.align 2, 0
_022E6E7C: .word 0x02353538
	arm_func_end ov29_022E6E68

	arm_func_start ov29_022E6E80
ov29_022E6E80: ; 0x022E6E80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r2, _022E6F8C ; =0x0235118C
	mov sl, r0
	ldrh r5, [r2, #4]
	ldrh r4, [r2, #6]
	ldrh r3, [r2]
	ldrh r0, [r2, #2]
	strh r5, [sp, #0x10]
	strh r4, [sp, #0x12]
	strh r0, [sp, #0xe]
	strh r3, [sp, #0xc]
	mvn r0, #0
	ldrh r6, [sp, #0x10]
	ldrh r5, [sp, #0x12]
	ldrh r4, [sp, #0xc]
	ldrh fp, [sp, #0xe]
	str r1, [sp, #4]
	mov r7, #0
	str r0, [sp, #8]
_022E6ED0:
	ldr r0, _022E6F90 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x218
	add r0, r0, #0x400
	add r8, r0, r7, lsl #4
	ldr r0, [r0, r7, lsl #4]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	tst r0, #0xff
	beq _022E6F78
	ldr r0, [r8, #0xc]
	cmp r0, sl
	bne _022E6F78
	strh r6, [sp, #0x18]
	strh r5, [sp, #0x1a]
	ldr r0, [sl, #0xc]
	mov r0, r0, asr #8
	strh r0, [sp, #0x18]
	ldr r0, [sl, #0x10]
	mov r0, r0, asr #8
	strh r0, [sp, #0x1a]
	strh r4, [sp, #0x14]
	strh fp, [sp, #0x16]
	ldrsb r1, [r8, #8]
	ldr r0, [sp, #8]
	ldr sb, [sl, #0xb4]
	cmp r1, r0
	beq _022E6F54
	and r2, r1, #0xff
	add r0, sp, #0x14
	add r1, sl, #0x2c
	bl sub_0201CF90
_022E6F54:
	ldrb r0, [sb, #0x4c]
	ldr r3, [sp, #4]
	add r1, sp, #0x18
	str r0, [sp]
	ldr r0, [r8]
	add r2, sp, #0x14
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BFB6C
_022E6F78:
	add r7, r7, #1
	cmp r7, #3
	blt _022E6ED0
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E6F8C: .word 0x0235118C
_022E6F90: .word 0x02353538
	arm_func_end ov29_022E6E80

	arm_func_start ov29_022E6F94
ov29_022E6F94: ; 0x022E6F94
	ldr r1, _022E6FB8 ; =0x02353538
	mov r2, #0xff
	ldr r0, [r1]
	add r0, r0, #0x28000
	strb r2, [r0, #0x6b0]
	ldr r0, [r1]
	add r0, r0, #0x28000
	strb r2, [r0, #0x6b1]
	bx lr
	.align 2, 0
_022E6FB8: .word 0x02353538
	arm_func_end ov29_022E6F94

	arm_func_start ov29_022E6FBC
ov29_022E6FBC: ; 0x022E6FBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	ldr r3, _022E79E4 ; =0x02353538
	ldr r4, _022E79E8 ; =0x02351584
	ldr r6, [r3]
	ldr r7, [r4, #0xc]
	ldr r8, [r4, #8]
	add r3, r6, #0x4a
	str r1, [sp]
	add r4, r6, #0x348
	mov r5, r0
	add r1, r4, #0x400
	add r0, r3, #0x700
	mov r4, r2
	str r8, [sp, #0x48]
	str r7, [sp, #0x4c]
	bl DungeonFloorToGroupFloor
	ldr r1, _022E79E4 ; =0x02353538
	ldr r3, [r1]
	ldrb r2, [r3, #0x74a]
	add r0, r3, #0x28000
	strb r2, [r0, #0x6b0]
	ldrb r2, [r3, #0x74b]
	strb r2, [r0, #0x6b1]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl GetNbPrecedingFloors
	ldr r1, _022E79E4 ; =0x02353538
	mov r6, #0
	ldr r2, [r1]
	strh r0, [r2, #0x20]
	ldr r0, [r1]
	strh r6, [r0, #0x1e]
	ldr r3, [r1]
	ldrsh r2, [r3, #0x20]
	ldrsh r0, [r3, #0x1e]
	add r0, r2, r0
	strh r0, [r3, #0x22]
	ldr r0, [r1]
	str r6, [sp, #0x28]
	ldr r0, [r0, #0x7cc]
	mov r2, #0xf
	cmp r0, #1
	bne _022E707C
	ldr r1, _022E79EC ; =0x02351594
	add r0, sp, #0x48
	bl LoadFileFromRom__02008C3C
	b _022E709C
_022E707C:
	cmp r0, #2
	add r0, sp, #0x48
	bne _022E7094
	ldr r1, _022E79F0 ; =0x023515B0
	bl LoadFileFromRom__02008C3C
	b _022E709C
_022E7094:
	ldr r1, _022E79F4 ; =0x023515CC
	bl LoadFileFromRom__02008C3C
_022E709C:
	mov r0, #0x65
	bl AdvanceFrame
	ldr r1, [sp, #0x48]
	add r0, sp, #0x28
	bl HandleSir0Translation
	mov r0, #0x65
	ldr sb, [sp, #0x28]
	bl AdvanceFrame
	ldr r0, _022E79E4 ; =0x02353538
	ldr r6, [sb]
	ldr r7, [r0]
	mov r1, #0x12
	add r0, r7, #0x28000
	ldrb r3, [r0, #0x6b0]
	ldrb r2, [r0, #0x6b1]
	ldrb r0, [r7, #0x748]
	ldr r3, [r6, r3, lsl #2]
	mla r6, r2, r1, r3
	bl GetNbFloorsPlusOne
	ldr r2, _022E79E4 ; =0x02353538
	ldr r1, [r2]
	add r1, r1, #0x2c000
	strb r0, [r1, #0xaf4]
	ldr r0, [r2]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xae
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _022E7138
	bl ov29_0234914C
	cmp r0, #0
	bne _022E7138
	ldr r0, _022E79E4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x2c000
	ldrb r1, [r0, #0xaf4]
	sub r1, r1, #1
	strb r1, [r0, #0xaf4]
_022E7138:
	ldr r0, _022E79E4 ; =0x02353538
	ldrsh r2, [r6]
	ldr r3, [sb, #4]
	ldr r1, [r0]
	add r7, r3, r2, lsl #5
	ldr r0, _022E79F8 ; =0x000286B2
	mov r2, #0x10
	add r3, r1, r0
_022E7158:
	ldrh r0, [r7], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _022E7158
	ldr r2, _022E79FC ; =0x000286CE
	ldr r3, _022E7A00 ; =0x0002CB08
	ldrsh r7, [r1, r2]
	mov r0, #0
	strh r7, [r1, r3]
	rsb r1, r2, #0x55000
	ldr r2, _022E79E4 ; =0x02353538
_022E7184:
	ldrsh r7, [r6, #4]
	ldr r8, [sb, #0x10]
	ldr r3, [r2]
	ldr r8, [r8, r7, lsl #2]
	mov r7, r0, lsl #1
	ldrh r7, [r8, r7]
	add r3, r3, r0, lsl #1
	add r0, r0, #1
	strh r7, [r3, r1]
	cmp r0, #0x19
	blt _022E7184
	cmp r4, #0
	beq _022E71C0
	mov r0, r5
	blx r4
_022E71C0:
	cmp r5, #0
	bne _022E7674
	ldr r0, _022E79E8 ; =0x02351584
	mov r4, #0
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	mov r0, r4
	mov r8, r4
	str r4, [sp, #0xc]
	str r4, [sp, #4]
	strh r2, [sp, #0x44]
	strh r1, [sp, #0x46]
	mov fp, #1
	bl DungeonRngSetSecondary
	bl IsDestinationFloorWithMonster
	str r0, [sp, #0x10]
	ldr r3, _022E7A04 ; =0x0000FFFF
	ldr r1, _022E79E4 ; =0x02353538
	ldr r0, _022E7A08 ; =0x0002C9EA
	mov r5, r4
_022E7210:
	ldr r2, [r1]
	add r2, r2, r5, lsl #1
	strh r3, [r2, r0]
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E7210
	bl IsItemForSpecialSpawnInBag
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #4]
	ldr r0, _022E79E4 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsDojoDungeon
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #4]
	ldr r0, _022E7A0C ; =0x00000906
	mov r1, #0xf
	bl MemAlloc
	str r0, [sp, #0x18]
	bl GetNbRecruited
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r7, r0
	ldr r0, _022E7A10 ; =0x00000229
	mov sl, #0
	sub r0, r0, #0xaa
	str r0, [sp, #0x20]
	ldr r0, _022E7A10 ; =0x00000229
	rsb r0, r0, #0x600
	str r0, [sp, #0x24]
_022E7294:
	mov r0, #0
	str r0, [sp, #8]
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	ldr r0, [r1, r0, lsl #2]
	add r0, r0, sl, lsl #3
	bl GetMonsterIdFromSpawnEntry
	movs r5, r0
	beq _022E73B0
	ldr r1, _022E7A10 ; =0x00000229
	cmp r5, r1
	streqh sl, [sp, #0x44]
	beq _022E7398
	ldr r1, [sp, #0x20]
	cmp r5, r1
	ldrne r1, [sp, #0x24]
	cmpne r5, r1
	streqh sl, [sp, #0x46]
	beq _022E7398
	bl CanMonsterSpawn
	cmp r0, #0
	addeq sl, sl, #1
	beq _022E7294
	ldr r0, _022E79E4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x28000
	ldrb r0, [r0, #0x6c4]
	bl ov29_022E0864
	cmp r0, #0
	bne _022E7398
	mov r0, r5
	bl ov29_022FB5EC
	cmp r0, #0
	beq _022E7398
	mov r0, r5
	bl NeedsItemToSpawn
	cmp r0, #0
	beq _022E7390
	ldr r0, _022E79E4 ; =0x02353538
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x7d0
	bl ov29_0231B3FC
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldreq r0, [sp, #0x18]
	moveq r1, r5, lsl #1
	ldreqsh r0, [r0, r1]
	cmpeq r0, #0
	bne _022E7398
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022E7398
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	mov r8, r5
	ldr r0, [r1, r0, lsl #2]
	add r0, r0, sl, lsl #3
	bl GetMonsterLevelFromSpawnEntry
	and r0, r0, #0xff
	str r0, [sp, #0xc]
	b _022E7398
_022E7390:
	mov r0, #1
	str r0, [sp, #8]
_022E7398:
	ldr r0, [sp, #8]
	cmp r0, #0
	strne sl, [r7, r4, lsl #2]
	addne r4, r4, #1
	add sl, sl, #1
	b _022E7294
_022E73B0:
	bl FloorNumberIsEven
	cmp r0, #0
	ldreq r0, _022E79E4 ; =0x02353538
	ldreq r0, [r0]
	addeq r0, r0, #0x700
	streqh r8, [r0, #0xa8]
	beq _022E73E4
	mov r0, r8
	bl GetSecondFormIfValid
	ldr r1, _022E79E4 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x700
	strh r0, [r1, #0xa8]
_022E73E4:
	ldr r1, _022E79E4 ; =0x02353538
	mov r0, #0x10
	ldr r2, [r1]
	ldr r1, [sp, #0xc]
	strb r1, [r2, #0x7aa]
	bl DungeonRandInt
	add r0, r0, #1
	str r0, [sp, #0x14]
	sub r0, r4, #1
	mov sl, #0
	str r0, [sp, #0x1c]
	b _022E7448
_022E7414:
	mov r5, #0
	b _022E7438
_022E741C:
	mov r0, r4
	bl DungeonRandInt
	ldr r2, [r7, r5, lsl #2]
	ldr r1, [r7, r0, lsl #2]
	str r1, [r7, r5, lsl #2]
	str r2, [r7, r0, lsl #2]
	add r5, r5, #1
_022E7438:
	ldr r0, [sp, #0x1c]
	cmp r5, r0
	blt _022E741C
	add sl, sl, #1
_022E7448:
	ldr r0, [sp, #0x14]
	cmp sl, r0
	blt _022E7414
	ldr r0, [sp]
	cmp r0, #0
	movne r4, #0
	bne _022E746C
	cmp r4, #0xe
	movge r4, #0xe
_022E746C:
	ldr r0, _022E7A10 ; =0x00000229
	bl GetSpriteFileSize
	add r5, r0, #0
	ldr r0, _022E7A14 ; =0x0000017F
	bl GetSpriteFileSize
	ldr r1, [sp, #0x10]
	add r5, r5, r0
	cmp r1, #0
	beq _022E749C
	bl ov29_02349378
	add r5, r5, r0
	b _022E74B0
_022E749C:
	cmp r8, #0
	beq _022E74B0
	mov r0, r8
	bl GetSpriteFileSize
	add r5, r5, r0
_022E74B0:
	mov r8, #0
	b _022E7528
_022E74B8:
	ldr r0, _022E79E4 ; =0x02353538
	ldr r2, [r7, r8, lsl #2]
	ldr r0, [r0]
	add r1, r0, r8, lsl #1
	ldr r0, _022E7A08 ; =0x0002C9EA
	strh r2, [r1, r0]
	ldrsh r1, [r6, #2]
	ldr r2, [sb, #0xc]
	ldr r0, [r7, r8, lsl #2]
	ldr r1, [r2, r1, lsl #2]
	add r2, sp, #0x3c
	add r3, r1, r0, lsl #3
	mov r1, #4
_022E74EC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E74EC
	add r0, sp, #0x3c
	bl GetMonsterIdFromSpawnEntry
	mov sl, r0
	add r0, sp, #0x3c
	bl GetMonsterLevelFromSpawnEntry
	cmp fp, r0
	movlt fp, r0
	mov r0, sl
	bl ov29_022F7068
	add r5, r5, r0
	add r8, r8, #1
_022E7528:
	cmp r8, r4
	blt _022E74B8
	ldr r0, _022E79E4 ; =0x02353538
	ldr r1, _022E7A18 ; =0x0002C9E6
	ldr r0, [r0]
	cmp r5, #0x58000
	strh fp, [r0, r1]
	bls _022E75C4
	sub sl, r4, #1
	mov r8, #0
	add fp, r1, #4
	b _022E75B8
_022E7558:
	ldrsh r1, [r6, #2]
	ldr r2, [sb, #0xc]
	ldr r0, [r7, sl, lsl #2]
	ldr r1, [r2, r1, lsl #2]
	add r2, sp, #0x34
	add r3, r1, r0, lsl #3
	mov r1, #4
_022E7574:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7574
	add r0, sp, #0x34
	bl GetMonsterIdFromSpawnEntry
	bl ov29_022F7068
	sub r5, r5, r0
	ldr r1, _022E79E4 ; =0x02353538
	ldr r0, _022E7A04 ; =0x0000FFFF
	ldr r1, [r1]
	cmp r5, #0x58000
	add r1, r1, sl, lsl #1
	strh r0, [r1, fp]
	add r8, r8, #1
	blo _022E75C0
	sub sl, sl, #1
_022E75B8:
	cmp sl, #0
	bge _022E7558
_022E75C0:
	sub r4, r4, r8
_022E75C4:
	ldrh r2, [sp, #0x44]
	ldr r0, _022E7A04 ; =0x0000FFFF
	cmp r2, r0
	beq _022E75EC
	ldr r1, _022E79E4 ; =0x02353538
	ldr r0, _022E7A08 ; =0x0002C9EA
	ldr r1, [r1]
	add r1, r1, r4, lsl #1
	strh r2, [r1, r0]
	add r4, r4, #1
_022E75EC:
	ldrh r2, [sp, #0x46]
	ldr r0, _022E7A04 ; =0x0000FFFF
	ldr r3, _022E79E4 ; =0x02353538
	cmp r2, r0
	ldrne r1, _022E79E4 ; =0x02353538
	ldrne r0, _022E7A08 ; =0x0002C9EA
	ldrne r1, [r1]
	addne r1, r1, r4, lsl #1
	strneh r2, [r1, r0]
	ldr r2, _022E7A08 ; =0x0002C9EA
	mov r1, #0
_022E7618:
	mov r0, r1
	b _022E764C
_022E7620:
	ldr r4, [r3]
	add r5, r4, r0, lsl #1
	add r4, r4, r1, lsl #1
	ldrh r8, [r5, r2]
	ldrh r5, [r4, r2]
	cmp r5, r8
	strhih r8, [r4, r2]
	ldrhi r4, [r3]
	addhi r4, r4, r0, lsl #1
	strhih r5, [r4, r2]
	add r0, r0, #1
_022E764C:
	cmp r0, #0x10
	blt _022E7620
	add r1, r1, #1
	cmp r1, #0xf
	blt _022E7618
	ldr r0, [sp, #0x18]
	bl MemFree
	mov r0, r7
	bl MemFree
	bl DungeonRngSetPrimary
_022E7674:
	mov r4, #0
	bl FloorNumberIsEven
	cmp r0, #0
	ldr r0, _022E79E4 ; =0x02353538
	mov r5, #0
	ldr r0, [r0]
	movne r4, #1
	ldrb r0, [r0, #0x748]
	mov r8, r5
	cmp r0, #0x3d
	moveq r4, #1
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	beq _022E76D0
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _022E76CC
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022E76D0
_022E76CC:
	mov r5, #1
_022E76D0:
	mov sl, #0
	b _022E77CC
_022E76D8:
	ldr r1, _022E79E4 ; =0x02353538
	ldr r0, _022E7A08 ; =0x0002C9EA
	ldr r2, [r1]
	ldr r1, _022E7A04 ; =0x0000FFFF
	add r2, r2, sl, lsl #1
	ldrh r3, [r2, r0]
	cmp r3, r1
	beq _022E77D4
	ldrsh r0, [r6, #2]
	ldr r1, [sb, #0xc]
	add r2, sp, #0x2c
	ldr r0, [r1, r0, lsl #2]
	mov r1, #4
	add r3, r0, r3, lsl #3
_022E7710:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7710
	add r0, sp, #0x2c
	bl GetMonsterIdFromSpawnEntry
	cmp r5, #0
	ldrne r2, _022E7A10 ; =0x00000229
	cmpne r0, r2
	subne r1, r2, #0xaa
	cmpne r0, r1
	rsbne r1, r2, #0x600
	cmpne r0, r1
	bne _022E77C8
	ldr r1, _022E79E4 ; =0x02353538
	add r7, sp, #0x2c
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, r8, lsl #3
	add r1, r1, #0x164
	add r3, r1, #0x2c800
_022E7764:
	ldrh r1, [r7], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022E7764
	cmp r4, #0
	ldrne r1, _022E7A10 ; =0x00000229
	cmpne r0, r1
	beq _022E77C4
	cmp r0, #0x258
	bge _022E77C4
	add r7, r0, #0x258
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGenderVeneer
	cmp r0, #2
	bne _022E77C4
	ldr r1, _022E79E4 ; =0x02353538
	mov r0, r7, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	add r0, r2, #0x164
	add r0, r0, #0x2c800
	add r0, r0, r8, lsl #3
	bl SetMonsterId
_022E77C4:
	add r8, r8, #1
_022E77C8:
	add sl, sl, #1
_022E77CC:
	cmp sl, #0x10
	blt _022E76D8
_022E77D4:
	bl ov29_023361D4
	cmp r0, #0
	beq _022E782C
	ldr r0, _022E79E4 ; =0x02353538
	ldr r3, _022E7A18 ; =0x0002C9E6
	ldr r4, [r0]
	rsb r1, r8, #0x10
	add r2, r4, #0x4000
	add r0, r4, #0x164
	add r0, r0, #0x2c800
	ldrb r2, [r2, #0xda]
	ldrsh r3, [r4, r3]
	add r0, r0, r8, lsl #3
	bl ov29_02343E20
	ldr r2, _022E79E4 ; =0x02353538
	ldr r1, [r2]
	add r1, r1, #0x12000
	str r0, [r1, #0xb20]
	ldr r0, [r2]
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb20]
	add r8, r8, r0
_022E782C:
	ldr r4, _022E79E4 ; =0x02353538
	ldr r0, _022E7A1C ; =0x0002C9E4
	ldr r1, [r4]
	mov r5, #0
	strh r8, [r1, r0]
	b _022E7860
_022E7844:
	ldr r0, [r4]
	mov r1, r5
	add r0, r0, #0x164
	add r0, r0, #0x2c800
	add r0, r0, r8, lsl #3
	bl SetMonsterId
	add r8, r8, #1
_022E7860:
	cmp r8, #0x10
	blt _022E7844
	mov r0, #0xb10
	mov r1, #0
	bl MemAlloc
	ldr r2, _022E79E4 ; =0x02353538
	ldr r1, _022E7A20 ; =0x0002C9E8
	ldr r2, [r2]
	mov r4, #0
	strh r4, [r2, r1]
_022E7888:
	add r1, r6, r4, lsl #1
	ldrsh r2, [r1, #6]
	ldr r5, [sb, #8]
	mov r1, #0
	ldr r2, [r5, r2, lsl #2]
	ldr r5, _022E7A24 ; =0xFFFF8AD0
	mov r3, r1
	mov sl, r1
	rsb r7, r5, #0
	b _022E7908
_022E78B0:
	mov r8, r1, lsl #1
	ldrh fp, [r2, r8]
	cmp fp, r5, lsr #16
	moveq r8, r3, lsl #1
	streqh fp, [r0, r8]
	addeq r3, r3, #1
	beq _022E7904
	cmp fp, r7
	blo _022E78F8
	add fp, fp, r5
	b _022E78EC
_022E78DC:
	mov r8, r3, lsl #1
	strh sl, [r0, r8]
	add r3, r3, #1
	sub fp, fp, #1
_022E78EC:
	cmp fp, #0
	bne _022E78DC
	b _022E7904
_022E78F8:
	mov r8, r3, lsl #1
	strh fp, [r0, r8]
	add r3, r3, #1
_022E7904:
	add r1, r1, #1
_022E7908:
	cmp r3, #0x17c
	blt _022E78B0
	mov r1, #0xb10
	mul r1, r4, r1
	mov r2, #0
	ldr r7, _022E79E4 ; =0x02353538
	ldr r5, _022E7A28 ; =0x000286D2
	mov r3, r2
_022E7928:
	mov sl, r2, lsl #1
	ldr r8, [r7]
	ldrh sl, [r0, sl]
	add r8, r1, r8
	add r8, r8, r2, lsl #1
	add r3, r3, #1
	strh sl, [r8, r5]
	cmp r3, #0x10
	add r2, r2, #1
	blt _022E7928
	ldr r7, _022E79E4 ; =0x02353538
	ldr r5, _022E7A2C ; =0x000286F2
	mov r3, #0
_022E795C:
	mov sl, r2, lsl #1
	ldr r8, [r7]
	ldrh sl, [r0, sl]
	add r8, r1, r8
	add r8, r8, r3, lsl #1
	add r3, r3, #1
	strh sl, [r8, r5]
	cmp r3, #0x16c
	add r2, r2, #1
	blt _022E795C
	add r4, r4, #1
	cmp r4, #6
	blt _022E7888
	mov r8, #0
	ldr r2, _022E7A2C ; =0x000286F2
	ldr r4, _022E79E4 ; =0x02353538
	ldr r1, _022E7A20 ; =0x0002C9E8
	ldr r3, _022E7A04 ; =0x0000FFFF
	mov r6, r8
_022E79A8:
	ldr r5, [r4]
	add r7, r5, r8, lsl #1
	ldrh r5, [r7, r2]
	cmp r5, r3
	streqh r6, [r7, r2]
	ldreq r5, [r4]
	streqh r8, [r5, r1]
	add r8, r8, #1
	cmp r8, #0x16c
	blt _022E79A8
	bl MemFree
	add r0, sp, #0x48
	bl UnloadFile
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E79E4: .word 0x02353538
_022E79E8: .word 0x02351584
_022E79EC: .word 0x02351594
_022E79F0: .word 0x023515B0
_022E79F4: .word 0x023515CC
_022E79F8: .word 0x000286B2
_022E79FC: .word 0x000286CE
_022E7A00: .word 0x0002CB08
_022E7A04: .word 0x0000FFFF
_022E7A08: .word 0x0002C9EA
_022E7A0C: .word 0x00000906
_022E7A10: .word 0x00000229
_022E7A14: .word 0x0000017F
_022E7A18: .word 0x0002C9E6
_022E7A1C: .word 0x0002C9E4
_022E7A20: .word 0x0002C9E8
_022E7A24: .word 0xFFFF8AD0
_022E7A28: .word 0x000286D2
_022E7A2C: .word 0x000286F2
	arm_func_end ov29_022E6FBC

	arm_func_start ov29_022E7A30
ov29_022E7A30: ; 0x022E7A30
	stmdb sp!, {r3, lr}
	ldr r0, _022E7A80 ; =0x00002710
	bl DungeonRandInt
	ldr r1, _022E7A84 ; =0x02353538
	mov r3, #0
	ldr ip, [r1]
	ldr r1, _022E7A88 ; =0x0002C932
	b _022E7A70
_022E7A50:
	add r2, ip, r3, lsl #1
	ldrh r2, [r2, r1]
	cmp r2, #0
	beq _022E7A6C
	cmp r2, r0
	andge r0, r3, #0xff
	ldmgeia sp!, {r3, pc}
_022E7A6C:
	add r3, r3, #1
_022E7A70:
	cmp r3, #0x19
	blt _022E7A50
	mov r0, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7A80: .word 0x00002710
_022E7A84: .word 0x02353538
_022E7A88: .word 0x0002C932
	arm_func_end ov29_022E7A30

	arm_func_start ov29_022E7A8C
ov29_022E7A8C: ; 0x022E7A8C
	stmdb sp!, {r4, lr}
	mov r4, #0
	b _022E7AB0
_022E7A98:
	bl ov29_022E7A30
	cmp r0, #0
	cmpne r0, #0x17
	cmpne r0, #0x11
	bne _022E7AB8
	add r4, r4, #1
_022E7AB0:
	cmp r4, #0x1e
	blt _022E7A98
_022E7AB8:
	cmp r4, #0x1e
	moveq r0, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E7A8C

	arm_func_start ov29_022E7AC4
ov29_022E7AC4: ; 0x022E7AC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	ldr r0, _022E7BA8 ; =0x00002710
	bl DungeonRandInt
	mov r1, #0xb10
	mul r5, r4, r1
	ldr r2, _022E7BAC ; =0x02353538
	mov r4, #0x10
	ldr r1, [r2]
	mov r3, #0
	add r6, r1, r5
	ldr r1, _022E7BB0 ; =0x000286D2
	b _022E7B18
_022E7AF8:
	add r2, r6, r3, lsl #1
	ldrsh r2, [r2, r1]
	cmp r2, #0
	beq _022E7B14
	cmp r2, r0
	andge r4, r3, #0xff
	bge _022E7B20
_022E7B14:
	add r3, r3, #1
_022E7B18:
	cmp r3, #0x10
	blt _022E7AF8
_022E7B20:
	cmp r4, #0x10
	moveq r0, #0xb7
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022E7BA8 ; =0x00002710
	bl DungeonRandInt
	mov r6, r0
	mov r7, #0
	ldr sb, _022E7BAC ; =0x02353538
	ldr r8, _022E7BB4 ; =0x000286F2
	b _022E7B98
_022E7B48:
	ldr r0, [sb]
	add r0, r5, r0
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, r8]
	cmp r0, #0
	beq _022E7B94
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemCategoryVeneer
	cmp r4, r0
	bne _022E7B94
	ldr r0, [sb]
	add r0, r5, r0
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, r8]
	cmp r0, r6
	movge r0, r7, lsl #0x10
	movge r0, r0, asr #0x10
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022E7B94:
	add r7, r7, #1
_022E7B98:
	cmp r7, #0x16c
	blt _022E7B48
	mov r0, #0xb7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E7BA8: .word 0x00002710
_022E7BAC: .word 0x02353538
_022E7BB0: .word 0x000286D2
_022E7BB4: .word 0x000286F2
	arm_func_end ov29_022E7AC4

	arm_func_start ov29_022E7BB8
ov29_022E7BB8: ; 0x022E7BB8
	stmdb sp!, {r3, lr}
	mov r0, #4
	bl ov29_022E7AC4
	cmp r0, #0xb7
	moveq r0, #0x46
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E7BB8

	arm_func_start ov29_022E7BD0
ov29_022E7BD0: ; 0x022E7BD0
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl ov29_022E7AC4
	cmp r0, #0xb7
	moveq r0, #0x46
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E7BD0

	arm_func_start ov29_022E7BE8
ov29_022E7BE8: ; 0x022E7BE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r7, _022E7C5C ; =0x02353538
	b _022E7C4C
_022E7C00:
	ldr r0, [r7]
	add r0, r0, #0x164
	add r0, r0, #0x2c800
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7C54
	ldr r0, [r7]
	add r2, r6, r5, lsl #3
	add r0, r0, r4, lsl #3
	add r0, r0, #0x164
	add r3, r0, #0x2c800
	mov r1, #4
_022E7C34:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7C34
	add r5, r5, #1
	add r4, r4, #1
_022E7C4C:
	cmp r4, #0x10
	blt _022E7C00
_022E7C54:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E7C5C: .word 0x02353538
	arm_func_end ov29_022E7BE8

	arm_func_start ov29_022E7C60
ov29_022E7C60: ; 0x022E7C60
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	b _022E7CE4
_022E7C74:
	ldr r0, _022E7CF4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x164
	add r0, r0, #0x2c800
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7CEC
	bl GetSpriteSize
	cmp r0, #6
	bhi _022E7CE0
	ldr r1, _022E7CF4 ; =0x02353538
	ldr r0, _022E7CF8 ; =0x0002C966
	ldr r1, [r1]
	add r1, r1, r4, lsl #3
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _022E7CE0
	add r0, r1, #0x164
	add r3, r0, #0x2c800
	add r2, r6, r5, lsl #3
	mov r1, #4
_022E7CCC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022E7CCC
	add r5, r5, #1
_022E7CE0:
	add r4, r4, #1
_022E7CE4:
	cmp r4, #0x10
	blt _022E7C74
_022E7CEC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7CF4: .word 0x02353538
_022E7CF8: .word 0x0002C966
	arm_func_end ov29_022E7C60

	arm_func_start ov29_022E7CFC
ov29_022E7CFC: ; 0x022E7CFC
	stmdb sp!, {r3, lr}
	ldr r1, _022E7D48 ; =0x02353538
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldrb r2, [r0, #0xe28]
	cmp r2, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	strb r2, [r0, #0xe28]
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, #0x174
	add r0, r0, #0x3800
	bl ov29_022E7BE8
	ldr r1, _022E7D48 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0xe20]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7D48: .word 0x02353538
	arm_func_end ov29_022E7CFC

	arm_func_start IsOnMonsterSpawnList
IsOnMonsterSpawnList: ; 0x022E7D4C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	ldr r4, _022E7D9C ; =0x02353538
	b _022E7D8C
_022E7D60:
	ldr r0, [r4]
	add r0, r0, #0x164
	add r0, r0, #0x2c800
	add r0, r0, r5, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _022E7D94
	cmp r0, r6
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E7D8C:
	cmp r5, #0x10
	blt _022E7D60
_022E7D94:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7D9C: .word 0x02353538
	arm_func_end IsOnMonsterSpawnList

	arm_func_start GetMonsterIdToSpawn
GetMonsterIdToSpawn: ; 0x022E7DA0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022E7E50 ; =0x00002710
	bl DungeonRandInt
	ldr r1, _022E7E54 ; =0x02353538
	mov ip, #0
	ldr r1, [r1]
	add r2, r1, #0x3000
	ldr lr, [r2, #0xe20]
	add r3, r1, r4, lsl #1
	b _022E7E00
_022E7DCC:
	add r2, r3, ip, lsl #3
	add r2, r2, #0x3900
	ldrsh r2, [r2, #0x76]
	cmp r2, #0
	beq _022E7DFC
	cmp r2, r0
	blt _022E7DFC
	add r0, r1, #0x174
	add r0, r0, #0x3800
	add r0, r0, ip, lsl #3
	bl GetMonsterIdFromSpawnEntry
	ldmia sp!, {r4, pc}
_022E7DFC:
	add ip, ip, #1
_022E7E00:
	cmp ip, lr
	blt _022E7DCC
	mov r3, #0
	add r2, r1, r4, lsl #1
	b _022E7E40
_022E7E14:
	add r0, r2, r3, lsl #3
	add r0, r0, #0x3900
	ldrsh r0, [r0, #0x76]
	cmp r0, #0
	beq _022E7E3C
	add r0, r1, #0x174
	add r0, r0, #0x3800
	add r0, r0, r3, lsl #3
	bl GetMonsterIdFromSpawnEntry
	ldmia sp!, {r4, pc}
_022E7E3C:
	add r3, r3, #1
_022E7E40:
	cmp r3, lr
	blt _022E7E14
	bl GetKecleonIdToSpawnByFloor
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E7E50: .word 0x00002710
_022E7E54: .word 0x02353538
	arm_func_end GetMonsterIdToSpawn

	arm_func_start GetMonsterLevelToSpawn
GetMonsterLevelToSpawn: ; 0x022E7E58
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, #0
	ldr r6, _022E7EC0 ; =0x02353538
	b _022E7EA4
_022E7E6C:
	add r0, r1, #0x174
	add r0, r0, #0x3800
	add r0, r0, r4, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r5, r0
	bne _022E7EA0
	ldr r0, _022E7EC0 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x174
	add r0, r0, #0x3800
	add r0, r0, r4, lsl #3
	bl GetMonsterLevelFromSpawnEntry
	ldmia sp!, {r4, r5, r6, pc}
_022E7EA0:
	add r4, r4, #1
_022E7EA4:
	ldr r1, [r6]
	add r0, r1, #0x3000
	ldr r0, [r0, #0xe20]
	cmp r4, r0
	blt _022E7E6C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E7EC0: .word 0x02353538
	arm_func_end GetMonsterLevelToSpawn

	arm_func_start ov29_022E7EC4
ov29_022E7EC4: ; 0x022E7EC4
	stmdb sp!, {r3, lr}
	mov r0, #0x230
	mov r1, #0
	bl MemAlloc
	ldr r2, _022E7F40 ; =0x02353554
	mov r1, #0x230
	str r0, [r2]
	bl MemZero
	ldr r0, _022E7F40 ; =0x02353554
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0x29]
	ldr r1, [r0]
	strb r2, [r1, #0x2c]
	ldr r1, [r0]
	strb r2, [r1, #0x2b]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #0x228]
	bl ov29_022E8708
	ldr r0, _022E7F40 ; =0x02353554
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x229]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F40: .word 0x02353554
	arm_func_end ov29_022E7EC4

	arm_func_start ov29_022E7F44
ov29_022E7F44: ; 0x022E7F44
	stmdb sp!, {r3, lr}
	ldr r0, _022E7F78 ; =0x02353554
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022E8C4C
	ldr r0, _022E7F78 ; =0x02353554
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7F78 ; =0x02353554
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F78: .word 0x02353554
	arm_func_end ov29_022E7F44

	arm_func_start ov29_022E7F7C
ov29_022E7F7C: ; 0x022E7F7C
	ldr r0, _022E7F90 ; =0x02353554
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E7F90: .word 0x02353554
	arm_func_end ov29_022E7F7C

	arm_func_start ov29_022E7F94
ov29_022E7F94: ; 0x022E7F94
	stmdb sp!, {r3, lr}
	ldr r0, _022E8014 ; =0x02353554
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x228]
	ldr r0, [r0]
	strb r1, [r0]
	bl ov29_02339138
	mov r0, #1
	mov r1, r0
	bl ov29_02339D7C
	bl ov29_02339CE8
	mov r0, #0
	bl SetMinimapDataE447
	ldr r1, _022E8014 ; =0x02353554
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	bl ov29_022E8104
	bl ov29_022F42D8
	cmp r0, #2
	ldr r0, _022E8014 ; =0x02353554
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC738
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8014: .word 0x02353554
	arm_func_end ov29_022E7F94

	arm_func_start ov29_022E8018
ov29_022E8018: ; 0x022E8018
	stmdb sp!, {r3, lr}
	ldr r0, _022E8050 ; =0x02353554
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E8048
	bl ov29_022DC76C
	bl ov29_022DC778
	ldr r0, _022E8050 ; =0x02353554
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E8048:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8050: .word 0x02353554
	arm_func_end ov29_022E8018

	arm_func_start ov29_022E8054
ov29_022E8054: ; 0x022E8054
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl sub_0204AEA0
	cmp r0, #3
	ldrne r0, _022E80CC ; =0x02353554
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0]
	ldmneia sp!, {r3, pc}
	ldr r0, _022E80CC ; =0x02353554
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov29_02339138
	mov r0, #0
	mov r1, #1
	bl ov29_0233A0E8
	mov r0, #1
	mov r1, #0
	bl ov29_02339D7C
	ldr r0, _022E80CC ; =0x02353554
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E80CC: .word 0x02353554
	arm_func_end ov29_022E8054

	arm_func_start ov29_022E80D0
ov29_022E80D0: ; 0x022E80D0
	stmdb sp!, {r3, lr}
	bl ov29_022DC77C
	ldr r1, _022E8100 ; =0x02353554
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1]
	bl SetMinimapDataE448
	mov r0, #1
	bl ov29_0233A1BC
	bl ov29_02339138
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8100: .word 0x02353554
	arm_func_end ov29_022E80D0

	arm_func_start ov29_022E8104
ov29_022E8104: ; 0x022E8104
	stmdb sp!, {r3, lr}
	ldr r0, _022E812C ; =0x02353554
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov10_022C1E50
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E812C: .word 0x02353554
	arm_func_end ov29_022E8104

	arm_func_start ov29_022E8130
ov29_022E8130: ; 0x022E8130
	stmdb sp!, {r3, lr}
	ldr r0, _022E818C ; =0x02353554
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x228]
	ldr r0, [r0]
	strb r2, [r0, #0x229]
	bl ov29_022E8104
	ldr r0, _022E818C ; =0x02353554
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x24]
	bl ov29_022F42D8
	cmp r0, #2
	ldr r0, _022E818C ; =0x02353554
	moveq r1, #1
	ldr r0, [r0]
	movne r1, #0
	and r1, r1, #0xff
	add r0, r0, #0xb8
	bl ov29_022DC694
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E818C: .word 0x02353554
	arm_func_end ov29_022E8130

	arm_func_start ov29_022E8190
ov29_022E8190: ; 0x022E8190
	stmdb sp!, {r3, lr}
	ldr r0, _022E81C4 ; =0x02353554
	ldr r0, [r0]
	ldrb r0, [r0, #0x228]
	cmp r0, #0
	beq _022E81BC
	bl ov29_022DC6D0
	ldr r0, _022E81C4 ; =0x02353554
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x228]
_022E81BC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E81C4: .word 0x02353554
	arm_func_end ov29_022E8190

	arm_func_start ov29_022E81C8
ov29_022E81C8: ; 0x022E81C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022DC6DC
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E81C8

	arm_func_start ov29_022E81E8
ov29_022E81E8: ; 0x022E81E8
	stmdb sp!, {r3, lr}
	bl ov29_022DC728
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E81E8

	arm_func_start ov29_022E81F8
ov29_022E81F8: ; 0x022E81F8
	stmdb sp!, {r3, lr}
	bl sub_0204AF58
	cmp r0, #0
	bne _022E8210
	bl ov29_022E8104
	ldmia sp!, {r3, pc}
_022E8210:
	bl sub_0204AEA0
	cmp r0, #1
	bne _022E8238
	ldr r0, _022E8240 ; =0x02353554
	ldr r0, [r0]
	ldrsh r0, [r0, #8]
	cmp r0, #1
	beq _022E8238
	mov r0, #1
	bl ov29_022E8CA8
_022E8238:
	bl ov29_022E8CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8240: .word 0x02353554
	arm_func_end ov29_022E81F8

	arm_func_start ov29_022E8244
ov29_022E8244: ; 0x022E8244
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	cmp r0, #4
	ldreq r0, _022E826C ; =0x02353554
	ldreq r0, [r0]
	ldreqsh r0, [r0, #8]
	cmpeq r0, #4
	ldmneia sp!, {r3, pc}
	bl ov29_022E9008
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E826C: .word 0x02353554
	arm_func_end ov29_022E8244

	arm_func_start ov29_022E8270
ov29_022E8270: ; 0x022E8270
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r3, _022E83FC ; =0x02353554
	mov sl, r0
	ldr r3, [r3]
	mov sb, r1
	mov fp, r2
	cmp r3, #0
	beq _022E83F4
	ldr r8, [sl, #0xb4]
	bl GetSleepAnimationId
	ldr r1, _022E8400 ; =0x02353538
	mov r4, r0
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x1a000
	ldr r0, [r1, #0x22c]
	mov r6, r5
	cmp r0, sl
	ldrsh r0, [sl, #0xa8]
	mov r7, r5
	str r0, [sp, #0x18]
	moveq r0, r5
	arm_func_end ov29_022E8270

	arm_func_start ov29_022E82CC
ov29_022E82CC: ; 0x022E82CC
	ldrneb r0, [r1, #0x245]
	cmp r0, #0
	bne _022E82E4
	ldrb r0, [r8, #0xd8]
	cmp r0, #2
	bne _022E82F0
_022E82E4:
	ldr r0, _022E8404 ; =0x00000229
	bl GetSpriteIndex__022F7388
	str r0, [sp, #0x18]
_022E82F0:
	ldrb r0, [r8, #0xc4]
	cmp r0, #1
	cmpne r0, #6
	beq _022E8364
	ldr r0, _022E8400 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x78b]
	cmp r0, #0
	beq _022E832C
	bl ov29_0234B4E0
	cmp r0, #0
	addeq r0, r5, #2
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
	beq _022E8354
_022E832C:
	ldrb r0, [sl, #0xaf]
	cmp r0, #0
	cmpne r0, #7
	bne _022E8354
	ldr r0, [sl, #0xb4]
	ldr r0, [r0, #0x110]
	cmp r0, #1
	addgt r0, r5, #1
	movgt r0, r0, lsl #0x10
	movgt r5, r0, asr #0x10
_022E8354:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	b _022E8368
_022E8364:
	mov r5, #0
_022E8368:
	ldrb r0, [r8, #0x10b]
	cmp r0, #2
	beq _022E83A4
	ldrb r1, [r8, #0xc4]
	cmp r1, #6
	ldrneb r0, [r8, #0xbf]
	cmpne r0, #4
	cmpne r1, #2
	bne _022E83A4
	ldr r0, _022E8408 ; =0x0237C850
	ldr r0, [r0]
	and r0, r0, #2
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E83A4:
	ldrb r0, [r8, #0xef]
	cmp r0, #1
	ldreq r0, _022E8400 ; =0x02353538
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
	ldreqb r0, [r0, #0x244]
	cmpeq r0, #0
	moveq r7, #1
	cmp r4, #0xff
	beq _022E83F4
	mov r0, #1
	stmia sp, {r0, sb, fp}
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r7, [sp, #0x14]
	ldrsh r1, [r8, #4]
	ldr r3, [r8, #0xb0]
	ldr r0, [sp, #0x18]
	mov r2, r4
	bl ov29_022DC6E8
_022E83F4:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E83FC: .word 0x02353554
_022E8400: .word 0x02353538
_022E8404: .word 0x00000229
_022E8408: .word 0x0237C850
	arm_func_end ov29_022E82CC

	arm_func_start ov29_022E840C
ov29_022E840C: ; 0x022E840C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _022E8478 ; =0x02353554
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	movne r0, #0
	bne _022E8470
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8478 ; =0x02353554
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	bl sub_02048400
	cmp r0, #0
	beq _022E8460
	bl sub_02048384
_022E8460:
	ldr r1, _022E8478 ; =0x02353554
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0x29]
_022E8470:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8478: .word 0x02353554
	arm_func_end ov29_022E840C

	arm_func_start ov29_022E847C
ov29_022E847C: ; 0x022E847C
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #0x10]
	bl sub_020483B8
	ldr r0, _022E84AC ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84AC: .word 0x02353554
	arm_func_end ov29_022E847C

	arm_func_start ov29_022E84B0
ov29_022E84B0: ; 0x022E84B0
	stmdb sp!, {r3, lr}
	ldr r0, _022E84FC ; =0x02353554
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x80
	bl ov10_022C2278
	bl sub_02048400
	cmp r0, #0
	beq _022E84E4
	bl sub_020483D8
_022E84E4:
	ldr r0, _022E84FC ; =0x02353554
	mov r2, #0
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0x29]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84FC: .word 0x02353554
	arm_func_end ov29_022E84B0

	arm_func_start ov29_022E8500
ov29_022E8500: ; 0x022E8500
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8548 ; =0x02353554
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8548 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8E94
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8548: .word 0x02353554
	arm_func_end ov29_022E8500

	arm_func_start ov29_022E854C
ov29_022E854C: ; 0x022E854C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E8F78
	ldr r0, _022E8584 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8584: .word 0x02353554
	arm_func_end ov29_022E854C

	arm_func_start ov29_022E8588
ov29_022E8588: ; 0x022E8588
	stmdb sp!, {r3, lr}
	ldr r0, _022E85A4 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8F28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E85A4: .word 0x02353554
	arm_func_end ov29_022E8588

	arm_func_start ov29_022E85A8
ov29_022E85A8: ; 0x022E85A8
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E85F0 ; =0x02353554
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E85F0 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	bl ov29_022E8FCC
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E85F0: .word 0x02353554
	arm_func_end ov29_022E85A8

	arm_func_start ov29_022E85F4
ov29_022E85F4: ; 0x022E85F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	bl ov29_022E9014
	ldr r0, _022E862C ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #0
	strb r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E862C: .word 0x02353554
	arm_func_end ov29_022E85F4

	arm_func_start ov29_022E8630
ov29_022E8630: ; 0x022E8630
	stmdb sp!, {r3, lr}
	ldr r0, _022E864C ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	bl ov29_022E8FF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E864C: .word 0x02353554
	arm_func_end ov29_022E8630

	arm_func_start ov29_022E8650
ov29_022E8650: ; 0x022E8650
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	add r0, sp, #0
	bl ov10_022C22A0
	ldr r0, _022E8698 ; =0x02353554
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x80
	mov r3, #1
	bl ov10_022C1E80
	ldr r0, _022E8698 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C21D8
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_022E8698: .word 0x02353554
	arm_func_end ov29_022E8650

	arm_func_start ov29_022E869C
ov29_022E869C: ; 0x022E869C
	mov r0, #1
	bx lr
	arm_func_end ov29_022E869C

	arm_func_start ov29_022E86A4
ov29_022E86A4: ; 0x022E86A4
	bx lr
	arm_func_end ov29_022E86A4

	arm_func_start ov29_022E86A8
ov29_022E86A8: ; 0x022E86A8
	stmdb sp!, {r3, lr}
	ldr r0, _022E86C4 ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0x80
	bl ov10_022C2278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86C4: .word 0x02353554
	arm_func_end ov29_022E86A8

	arm_func_start ov29_022E86C8
ov29_022E86C8: ; 0x022E86C8
	str r1, [r0]
	ldr r1, [sp]
	stmib r0, {r2, r3}
	str r1, [r0, #0xc]
	mov r1, #1
	strb r1, [r0, #0x10]
	bx lr
	arm_func_end ov29_022E86C8

	arm_func_start ov29_022E86E4
ov29_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8704 ; =0x02353554
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8704: .word 0x02353554
	arm_func_end ov29_022E86E4

	arm_func_start ov29_022E8708
ov29_022E8708: ; 0x022E8708
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	cmp r0, #3
	bne _022E8724
	mov r0, #3
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8724:
	cmp r0, #2
	bne _022E8738
	mov r0, #0
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8738:
	cmp r0, #0
	bne _022E874C
	mov r0, #2
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E874C:
	cmp r0, #4
	bne _022E8760
	mov r0, #4
	bl ov29_022E8CA8
	ldmia sp!, {r3, pc}
_022E8760:
	bl ov29_022E81F8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8708

	arm_func_start ov29_022E8768
ov29_022E8768: ; 0x022E8768
	ldr ip, _022E8774 ; =ov29_022E8CA8
	mov r0, #5
	bx ip
	.align 2, 0
_022E8774: .word ov29_022E8CA8
	arm_func_end ov29_022E8768

	arm_func_start ov29_022E8778
ov29_022E8778: ; 0x022E8778
	stmdb sp!, {r3, lr}
	ldr r0, _022E87B0 ; =0x02353554
	mov r3, #3
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0xc]
	ldr r0, [r0]
	strh r1, [r0, #0x10]
	bl ov29_022E8104
	ldr r0, _022E87B0 ; =0x02353554
	ldr r1, [r0]
	ldrsh r0, [r1, #0x10]
	strh r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87B0: .word 0x02353554
	arm_func_end ov29_022E8778

	arm_func_start ov29_022E87B4
ov29_022E87B4: ; 0x022E87B4
	ldr r1, _022E87D8 ; =0x02353554
	ldr r2, [r1]
	ldrsh r1, [r2, #8]
	cmp r1, r0
	ldreq r0, [r2, #4]
	cmpeq r0, #5
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022E87D8: .word 0x02353554
	arm_func_end ov29_022E87B4

	arm_func_start ov29_022E87DC
ov29_022E87DC: ; 0x022E87DC
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	ldr r1, _022E87F8 ; =0x023515E8
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bl ov29_022E87B4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E87F8: .word 0x023515E8
	arm_func_end ov29_022E87DC

	arm_func_start ov29_022E87FC
ov29_022E87FC: ; 0x022E87FC
	ldr r1, _022E880C ; =0x02353554
	ldr r1, [r1]
	strb r0, [r1, #0x2b]
	bx lr
	.align 2, 0
_022E880C: .word 0x02353554
	arm_func_end ov29_022E87FC

	arm_func_start ov29_022E8810
ov29_022E8810: ; 0x022E8810
	ldr r0, _022E8830 ; =0x02353554
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8830: .word 0x02353554
	arm_func_end ov29_022E8810

	arm_func_start ov29_022E8834
ov29_022E8834: ; 0x022E8834
	ldr r1, _022E8844 ; =0x02353554
	ldr r1, [r1]
	strb r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_022E8844: .word 0x02353554
	arm_func_end ov29_022E8834

	arm_func_start ov29_022E8848
ov29_022E8848: ; 0x022E8848
	ldr r0, _022E8868 ; =0x02353554
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E8868: .word 0x02353554
	arm_func_end ov29_022E8848

	arm_func_start ov29_022E886C
ov29_022E886C: ; 0x022E886C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8BA0 ; =0x02353554
	ldr r5, [r0]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_022E8890: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _022E88AC ; case 1
	b _022E88C0 ; case 2
	b _022E8A80 ; case 3
	b _022E8AC8 ; case 4
	b _022E8B00 ; case 5
	b _022E8B5C ; case 6
_022E88AC:
	ldrb r0, [r5, #0x2b]
	cmp r0, #0
	moveq r0, #2
	streq r0, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E88C0:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E88EC
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =0x02353554
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_022E88EC:
	bl ov29_022E8C4C
	ldr r0, _022E8BA0 ; =0x02353554
	ldr r4, [r0]
	ldrsh r0, [r4, #0x10]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022E89DC
_022E8908: ; jump table
	b _022E8920 ; case 0
	b _022E8940 ; case 1
	b _022E8960 ; case 2
	b _022E8980 ; case 3
	b _022E89A0 ; case 4
	b _022E89C0 ; case 5
_022E8920:
	ldr ip, _022E8BA4 ; =ov29_022E84B0
	ldr r1, _022E8BA8 ; =ov29_022E840C
	ldr r3, _022E8BAC ; =ov29_022E847C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl ov29_022E86C8
	b _022E89DC
_022E8940:
	ldr ip, _022E8BB0 ; =ov29_022E81E8
	ldr r1, _022E8BB4 ; =ov29_022E8130
	ldr r2, _022E8BB8 ; =ov29_022E8190
	ldr r3, _022E8BBC ; =ov29_022E81C8
	add r0, r4, #0x14
	str ip, [sp]
	bl ov29_022E86C8
	b _022E89DC
_022E8960:
	ldr ip, _022E8BC0 ; =ov29_022E8588
	ldr r1, _022E8BC4 ; =ov29_022E8500
	ldr r3, _022E8BC8 ; =ov29_022E854C
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl ov29_022E86C8
	b _022E89DC
_022E8980:
	ldr ip, _022E8BCC ; =ov29_022E80D0
	ldr r1, _022E8BD0 ; =ov29_022E7F94
	ldr r2, _022E8BD4 ; =ov29_022E8018
	ldr r3, _022E8BD8 ; =ov29_022E8054
	add r0, r4, #0x14
	str ip, [sp]
	bl ov29_022E86C8
	b _022E89DC
_022E89A0:
	ldr ip, _022E8BDC ; =ov29_022E8630
	ldr r1, _022E8BE0 ; =ov29_022E85A8
	ldr r3, _022E8BE4 ; =ov29_022E85F4
	add r0, r4, #0x14
	mov r2, #0
	str ip, [sp]
	bl ov29_022E86C8
	b _022E89DC
_022E89C0:
	ldr ip, _022E8BE8 ; =ov29_022E86A8
	ldr r1, _022E8BEC ; =ov29_022E8650
	ldr r2, _022E8BF0 ; =0x022E869C
	ldr r3, _022E8BF4 ; =0x022E86A4
	add r0, r4, #0x14
	str ip, [sp]
	bl ov29_022E86C8
_022E89DC:
	ldr r0, _022E8BA0 ; =0x02353554
	ldrsh r1, [r4, #0x10]
	ldr r0, [r0]
	strh r1, [r0, #8]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _022E8A20
	ldr r0, _022E8BF8 ; =0x0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B3D4
	ldr r0, _022E8BF8 ; =0x0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bl sub_0200B330
	ldr r0, [r4, #0x14]
	blx r0
_022E8A20:
	mov r1, #0
	ldr r0, _022E8BA0 ; =0x02353554
	str r1, [r5, #0xc]
	ldr r2, [r0]
	ldrb r1, [r2, #0x2c]
	cmp r1, #0
	movne r0, #3
	strne r0, [r2, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl ov29_0234C668
	ldr r0, _022E8BA0 ; =0x02353554
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8A80:
	ldrb r1, [r5, #0x2c]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #5
	str r1, [r5, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r2, r0
	mov r1, #0x4000
	bl ov29_0234C668
	ldr r0, _022E8BA0 ; =0x02353554
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8AC8:
	bl ov29_022E86E4
	ldr r0, _022E8BA0 ; =0x02353554
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldreq r0, _022E8BA0 ; =0x02353554
	moveq r1, #5
	ldreq r0, [r0]
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B00:
	bl ov29_022E86E4
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022E8BA0 ; =0x02353554
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	strb r1, [r2, #2]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [r1, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	mov r1, #0x4000
	mov r2, #1
	bl ov29_0234C668
	ldr r0, _022E8BA0 ; =0x02353554
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022E8B5C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _022E8B78
	mov r0, #1
	bl ov29_0234C70C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_022E8B78:
	bl ov29_022E8C4C
	ldr r0, _022E8BA0 ; =0x02353554
	ldr r1, [r0]
	ldrb r0, [r1, #0x2b]
	cmp r0, #0
	movne r0, #1
	strne r0, [r1, #4]
	moveq r0, #2
	streq r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8BA0: .word 0x02353554
_022E8BA4: .word ov29_022E84B0
_022E8BA8: .word ov29_022E840C
_022E8BAC: .word ov29_022E847C
_022E8BB0: .word ov29_022E81E8
_022E8BB4: .word ov29_022E8130
_022E8BB8: .word ov29_022E8190
_022E8BBC: .word ov29_022E81C8
_022E8BC0: .word ov29_022E8588
_022E8BC4: .word ov29_022E8500
_022E8BC8: .word ov29_022E854C
_022E8BCC: .word ov29_022E80D0
_022E8BD0: .word ov29_022E7F94
_022E8BD4: .word ov29_022E8018
_022E8BD8: .word ov29_022E8054
_022E8BDC: .word ov29_022E8630
_022E8BE0: .word ov29_022E85A8
_022E8BE4: .word ov29_022E85F4
_022E8BE8: .word ov29_022E86A8
_022E8BEC: .word ov29_022E8650
_022E8BF0: .word 0x022E869C
_022E8BF4: .word 0x022E86A4
_022E8BF8: .word 0x0235352C
	arm_func_end ov29_022E886C

	arm_func_start ov29_022E8BFC
ov29_022E8BFC: ; 0x022E8BFC
	ldr r1, _022E8C0C ; =0x02353554
	ldr r1, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E8C0C: .word 0x02353554
	arm_func_end ov29_022E8BFC

	arm_func_start ov29_022E8C10
ov29_022E8C10: ; 0x022E8C10
	stmdb sp!, {r3, lr}
	ldr r0, _022E8C48 ; =0x02353554
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r2, #0x2a]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x14
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8C48: .word 0x02353554
	arm_func_end ov29_022E8C10

	arm_func_start ov29_022E8C4C
ov29_022E8C4C: ; 0x022E8C4C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022E8CA4 ; =0x02353554
	ldr r4, [r0]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _022E8C98
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	blx r0
	movs r5, r0
	beq _022E8C9C
	mov r1, #0
	mov r2, r1
	mov r3, r1
	add r0, r4, #0x14
	str r1, [sp]
	bl ov29_022E86C8
	b _022E8C9C
_022E8C98:
	mov r5, #1
_022E8C9C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8CA4: .word 0x02353554
	arm_func_end ov29_022E8C4C

	arm_func_start ov29_022E8CA8
ov29_022E8CA8: ; 0x022E8CA8
	ldr r1, _022E8CE4 ; =0x02353554
	ldr r3, [r1]
	ldrsh r2, [r3, #8]
	cmp r2, r0
	ldrne r2, [r3, #0xc]
	cmpne r2, #1
	bxeq lr
	mov r2, #1
	str r2, [r3, #0xc]
	ldr r3, [r1]
	mov r2, #0
	strh r0, [r3, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x28]
	bx lr
	.align 2, 0
_022E8CE4: .word 0x02353554
	arm_func_end ov29_022E8CA8

	arm_func_start ov29_022E8CE8
ov29_022E8CE8: ; 0x022E8CE8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	mov sb, #0
	ldr fp, _022E8E54 ; =0x000003E7
	mov r8, sb
_022E8CFC:
	ldr r0, _022E8E58 ; =0x02353538
	ldr r1, [r0]
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	cmp r0, #0
	moveq r0, #0
	beq _022E8D30
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022E8D30:
	cmp r0, #0
	beq _022E8DE4
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	ldr r0, _022E8E5C ; =0x02353554
	ldr r7, [r6, #0xb4]
	ldr r0, [r0]
	add r5, r0, #0xb8
	mov r0, #0x5c
	smulbb r4, sb, r0
	ldrb r0, [r7, #0x165]
	cmp r0, #0
	bne _022E8DE4
	add r0, sp, #0x14
	mov r1, r7
	mov r2, #0
	bl ov29_0230027C
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	add sl, r1, r0
	cmp sl, fp
	mov r0, r6
	movgt sl, fp
	bl GetSleepAnimationId
	ldrb r3, [r7, #0xa]
	mov r1, sl, lsl #0x10
	mov r1, r1, asr #0x10
	str r3, [sp]
	ldrsh r3, [r7, #0x10]
	add r2, sp, #0x14
	str r3, [sp, #4]
	str r1, [sp, #8]
	ldrsh r1, [r6, #0xa8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, [r7, #0xb0]
	ldrsh r3, [r7, #4]
	mov r1, r1, lsl #0x10
	add r0, r5, r4
	mov r1, r1, asr #0x10
	bl ov10_022C1DE0
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022E8DE4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022E8CFC
	mov r0, #0x5c
	smulbb r4, sb, r0
	mov r3, #0
	ldr r1, _022E8E5C ; =0x02353554
	b _022E8E24
_022E8E0C:
	ldr r2, [r1]
	add r0, sb, #1
	add r2, r4, r2
	mov r0, r0, lsl #0x10
	strb r3, [r2, #0xb8]
	mov sb, r0, asr #0x10
_022E8E24:
	cmp sb, #4
	blt _022E8E0C
	ldr r0, _022E8E5C ; =0x02353554
	ldr r0, [r0]
	add r0, r0, #0xb8
	bl ov29_022DC684
	ldr r0, _022E8E5C ; =0x02353554
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x228]
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E8E54: .word 0x000003E7
_022E8E58: .word 0x02353538
_022E8E5C: .word 0x02353554
	arm_func_end ov29_022E8CE8

	arm_func_start ov29_022E8E60
ov29_022E8E60: ; 0x022E8E60
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022E8E90 ; =0x00003FCB
	bl StringFromMessageId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl sub_02026214
	mov r0, r4
	bl sub_02027AF0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8E90: .word 0x00003FCB
	arm_func_end ov29_022E8E60

	arm_func_start ov29_022E8E94
ov29_022E8E94: ; 0x022E8E94
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _022E8F1C ; =0x02353558
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _022E8F14
	mov r0, #0x54
	mov r1, #8
	bl MemAlloc
	ldr r2, _022E8F1C ; =0x02353558
	mov r1, #0x54
	str r0, [r2]
	bl MemZero
	ldr r0, _022E8F20 ; =0x023515F4
	add ip, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _022E8F24 ; =ov29_022E8E60
	mov r0, ip
	bl sub_0202F8C4
	ldr r1, _022E8F1C ; =0x02353558
	ldr r2, [r1]
	strb r0, [r2]
	ldr r0, [r1]
	add r0, r0, #4
	bl InitPreprocessorArgs
	ldr r0, _022E8F1C ; =0x02353558
	mov r2, #0x10000
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x50]
_022E8F14:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F1C: .word 0x02353558
_022E8F20: .word 0x023515F4
_022E8F24: .word ov29_022E8E60
	arm_func_end ov29_022E8E94

	arm_func_start ov29_022E8F28
ov29_022E8F28: ; 0x022E8F28
	stmdb sp!, {r3, lr}
	ldr r0, _022E8F74 ; =0x02353558
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202F918
	ldr r0, _022E8F74 ; =0x02353558
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E8F74 ; =0x02353558
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8F74: .word 0x02353558
	arm_func_end ov29_022E8F28

	arm_func_start ov29_022E8F78
ov29_022E8F78: ; 0x022E8F78
	stmdb sp!, {r4, lr}
	ldrb r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r0]
	ldr r1, _022E8FC4 ; =0x02353558
	ldr r0, _022E8FC8 ; =0x00003FCB
	ldr r1, [r1]
	ldrsb r4, [r1]
	bl StringFromMessageId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl sub_02026214
	mov r0, r4
	bl sub_02027AF0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E8FC4: .word 0x02353558
_022E8FC8: .word 0x00003FCB
	arm_func_end ov29_022E8F78

	arm_func_start ov29_022E8FCC
ov29_022E8FCC: ; 0x022E8FCC
	stmdb sp!, {r3, lr}
	ldr r0, _022E8FF4 ; =0x02353538
	ldr r1, [r0]
	add r0, r1, #0x700
	ldrsb r0, [r0, #0x98]
	ldrb r1, [r1, #0x748]
	bl ov29_0234F25C
	bl ov29_0234F278
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8FF4: .word 0x02353538
	arm_func_end ov29_022E8FCC

	arm_func_start ov29_022E8FF8
ov29_022E8FF8: ; 0x022E8FF8
	stmdb sp!, {r3, lr}
	bl ov29_0234F2B8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E8FF8

	arm_func_start ov29_022E9008
ov29_022E9008: ; 0x022E9008
	ldr ip, _022E9010 ; =ov29_0234F290
	bx ip
	.align 2, 0
_022E9010: .word ov29_0234F290
	arm_func_end ov29_022E9008

	arm_func_start ov29_022E9014
ov29_022E9014: ; 0x022E9014
	ldrb r0, [r0]
	cmp r0, #0
	bx lr
	arm_func_end ov29_022E9014

	arm_func_start GetDirectionTowardsPosition
GetDirectionTowardsPosition: ; 0x022E9020
	ldrsh r3, [r1]
	ldrsh r2, [r0]
	ldrsh r1, [r1, #2]
	ldrsh r0, [r0, #2]
	subs r3, r3, r2
	sub r2, r1, r0
	cmpeq r2, #0
	moveq r0, #0
	bxeq lr
	cmp r3, #1
	movge r3, #1
	cmp r2, #1
	mvn r0, #0
	movge r2, #1
	cmp r3, r0
	movle r3, r0
	mvn r0, #0
	cmp r2, r0
	movle r2, r0
	ldr r1, _022E9088 ; =0x02351604
	add r2, r2, #1
	mov r0, #0xc
	mla r0, r2, r0, r1
	add r1, r3, #1
	ldr r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_022E9088: .word 0x02351604
	arm_func_end GetDirectionTowardsPosition

	arm_func_start GetChebyshevDistance
GetChebyshevDistance: ; 0x022E908C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r1, [r5]
	ldrsh r0, [r4]
	sub r0, r1, r0
	bl Abs
	ldrsh r1, [r4, #2]
	ldrsh r2, [r5, #2]
	mov r4, r0
	sub r0, r2, r1
	bl Abs
	cmp r4, r0
	movle r4, r0
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetChebyshevDistance

	arm_func_start ov29_022E90CC
ov29_022E90CC: ; 0x022E90CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r4, r1
	mov r6, r2
	bl ov29_022E333C
	mov r5, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	bl GetTile
	cmp r6, #0
	ldrb ip, [r0, #7]
	bne _022E9104
	cmp ip, #0xff
	bne _022E913C
_022E9104:
	ldrsh r1, [r7]
	ldrsh r0, [r4]
	sub r0, r1, r0
	bl Abs
	cmp r0, r5
	bgt _022E9198
	ldrsh r1, [r7, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl Abs
	cmp r0, r5
	bgt _022E9198
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E913C:
	ldr r0, _022E91A0 ; =0x02353538
	mov r1, #0x1c
	ldr r0, [r0]
	ldrsh r2, [r4]
	add r0, r0, #0x2e8
	add r0, r0, #0xec00
	mla r3, ip, r1, r0
	ldrsh r0, [r3, #2]
	sub r0, r0, #1
	cmp r0, r2
	ldrlesh r0, [r3, #4]
	ldrlesh r1, [r4, #2]
	suble r0, r0, #1
	cmple r0, r1
	bgt _022E9198
	ldrsh r0, [r3, #6]
	add r0, r0, #1
	cmp r0, r2
	ldrgtsh r0, [r3, #8]
	addgt r0, r0, #1
	cmpgt r0, r1
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
_022E9198:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E91A0: .word 0x02353538
	arm_func_end ov29_022E90CC

	arm_func_start IsPositionInSight
IsPositionInSight: ; 0x022E91A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r7, r2
	bl GetTile
	ldrb r6, [r0, #7]
	cmp r6, #0xff
	beq _022E9230
	cmp r7, #0
	bne _022E9230
	ldr r0, _022E9294 ; =0x02353538
	mov r1, #0x1c
	ldr r0, [r0]
	ldrsh r2, [r4]
	add r0, r0, #0x2e8
	add r0, r0, #0xec00
	mla r3, r6, r1, r0
	ldrsh r0, [r3, #2]
	sub r0, r0, #1
	cmp r0, r2
	ldrlesh r0, [r3, #4]
	ldrlesh r1, [r4, #2]
	suble r0, r0, #1
	cmple r0, r1
	bgt _022E9230
	ldrsh r0, [r3, #6]
	add r0, r0, #1
	cmp r0, r2
	ldrgtsh r0, [r3, #8]
	addgt r0, r0, #1
	cmpgt r0, r1
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
_022E9230:
	ldrsh r1, [r5, #2]
	ldrsh r0, [r4, #2]
	sub r0, r1, r0
	bl Abs
	ldrsh r2, [r5]
	ldrsh r1, [r4]
	mov r6, r0
	sub r0, r2, r1
	bl Abs
	cmp r0, r6
	movle r0, r6
	cmp r0, #2
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	bne _022E928C
	mov r0, r5
	mov r1, r4
	bl ov29_022E935C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E928C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E9294: .word 0x02353538
	arm_func_end IsPositionInSight

	arm_func_start ov29_022E9298
ov29_022E9298: ; 0x022E9298
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r7, r2
	bl GetTile
	mov r6, r0
	bl ov29_022E333C
	cmp r7, #0
	ldrb r2, [r6, #7]
	bne _022E92D0
	cmp r2, #0xff
	bne _022E930C
_022E92D0:
	ldrsh r1, [r5]
	sub r1, r1, r0
	str r1, [r4]
	ldrsh r1, [r5]
	add r1, r1, r0
	add r1, r1, #1
	str r1, [r4, #8]
	ldrsh r1, [r5, #2]
	sub r1, r1, r0
	str r1, [r4, #4]
	ldrsh r1, [r5, #2]
	add r0, r1, r0
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022E930C:
	ldr r0, _022E9358 ; =0x02353538
	mov r1, #0x1c
	ldr r0, [r0]
	add r0, r0, #0x2e8
	add r0, r0, #0xec00
	mla r1, r2, r1, r0
	ldrsh r0, [r1, #2]
	sub r0, r0, #1
	str r0, [r4]
	ldrsh r0, [r1, #6]
	add r0, r0, #2
	str r0, [r4, #8]
	ldrsh r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	ldrsh r0, [r1, #8]
	add r0, r0, #2
	str r0, [r4, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E9358: .word 0x02353538
	arm_func_end ov29_022E9298

	arm_func_start ov29_022E935C
ov29_022E935C: ; 0x022E935C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldrsh r4, [r8]
	ldrsh r0, [r7]
	sub r0, r4, r0
	bl Abs
	mov r6, r0
	cmp r6, #1
	bgt _022E93A0
	ldrsh r1, [r8, #2]
	ldrsh r0, [r7, #2]
	sub r0, r1, r0
	bl Abs
	cmp r0, #1
	movle r0, #1
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
_022E93A0:
	ldrsh r5, [r8, #2]
	ldrsh r0, [r7, #2]
	sub r0, r5, r0
	bl Abs
	cmp r6, r0
	movle r6, r0
	cmp r6, #2
	bne _022E9480
	mov r6, #0
	b _022E9410
_022E93C8:
	ldrsh r0, [r7]
	cmp r4, r0
	addlt r4, r4, #1
	cmp r4, r0
	ldrsh r0, [r7, #2]
	subgt r4, r4, #1
	cmp r5, r0
	addlt r5, r5, #1
	cmp r5, r0
	subgt r5, r5, #1
	mov r0, r4
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r6, r6, #1
_022E9410:
	cmp r6, #2
	blt _022E93C8
	ldrsh r4, [r7]
	ldrsh r5, [r7, #2]
	mov r6, #0
	b _022E9470
_022E9428:
	ldrsh r0, [r8]
	cmp r4, r0
	addlt r4, r4, #1
	cmp r4, r0
	ldrsh r0, [r8, #2]
	subgt r4, r4, #1
	cmp r5, r0
	addlt r5, r5, #1
	cmp r5, r0
	subgt r5, r5, #1
	mov r0, r4
	mov r1, r5
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r6, r6, #1
_022E9470:
	cmp r6, #2
	blt _022E9428
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022E9480:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_022E935C

	arm_func_start ov29_022E9488
ov29_022E9488: ; 0x022E9488
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022E955C ; =0x02353538
	ldr r3, _022E9560 ; =0x0001A224
	ldr r4, [ip]
	add ip, r3, #2
	ldrsh r3, [r4, r3]
	ldrsh r4, [r4, ip]
	mvn lr, #0xf
	sub r3, r0, r3
	sub r0, r1, r4
	cmp r3, lr
	cmpge r0, lr
	blt _022E9554
	rsb r1, lr, #0xff
	cmp r3, r1
	cmplt r0, #0xd0
	bge _022E9554
	mov r1, #0xc
	mul ip, r2, r1
	ldr r4, _022E9564 ; =0x0237C88A
	ldr r5, _022E9568 ; =0x0237C890
	ldrh r2, [r4, ip]
	sub r1, r1, #0x20c
	ldrsh r5, [r5, ip]
	and r1, r2, r1
	strh r1, [r4, ip]
	add r1, r3, r5
	ldrh r2, [r4, ip]
	and r1, r1, lr, lsr #23
	ldr r3, _022E956C ; =0x0237C88E
	orr r1, r2, r1
	strh r1, [r4, ip]
	ldr r1, _022E9570 ; =0x0237C892
	ldrh r4, [r3, ip]
	ldrsh lr, [r1, ip]
	ldr r1, _022E9574 ; =0xFFFF000F
	ldr r2, _022E9578 ; =0x020AFC4C
	and r1, r4, r1
	strh r1, [r3, ip]
	add r0, r0, lr
	ldr r1, _022E957C ; =0x0237C888
	mov lr, r0, lsl #0x14
	ldrh r4, [r3, ip]
	ldr r0, [r2]
	add r1, r1, ip
	orr r4, r4, lr, lsr #16
	mov r2, #0
	strh r4, [r3, ip]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022E9554:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E955C: .word 0x02353538
_022E9560: .word 0x0001A224
_022E9564: .word 0x0237C88A
_022E9568: .word 0x0237C890
_022E956C: .word 0x0237C88E
_022E9570: .word 0x0237C892
_022E9574: .word 0xFFFF000F
_022E9578: .word 0x020AFC4C
_022E957C: .word 0x0237C888
	arm_func_end ov29_022E9488

	arm_func_start GetLeader
GetLeader: ; 0x022E9580
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022E95EC ; =0x0235355C
	ldr r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r5, #0
	ldr r4, _022E95F0 ; =0x02353538
	b _022E95DC
_022E95A0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, r6
	bl EntityIsValid__022E95F4
	cmp r0, #0
	ldrne r0, [r6, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	ldrne r1, _022E95EC ; =0x0235355C
	movne r0, r6
	strne r6, [r1]
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022E95DC:
	cmp r5, #4
	blt _022E95A0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E95EC: .word 0x0235355C
_022E95F0: .word 0x02353538
	arm_func_end GetLeader

	arm_func_start EntityIsValid__022E95F4
EntityIsValid__022E95F4: ; 0x022E95F4
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end EntityIsValid__022E95F4

	arm_func_start ov29_022E9618
ov29_022E9618: ; 0x022E9618
	stmdb sp!, {r3, lr}
	bl GetLeader
	ldr r0, [r0, #0xb4]
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E9618

	arm_func_start ov29_022E9628
ov29_022E9628: ; 0x022E9628
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe20
	mov sl, r0
	str r1, [sp]
	bl GetLeader
	mov r4, #0
	str r0, [sp, #0x14]
	mov r8, r4
	b _022E9830
_022E964C:
	mov r0, #0x38
	bl DungeonRandInt
	mov sb, r0
	mov r0, #0x20
	bl DungeonRandInt
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	mov r5, #0
	strh r2, [sp, #0x1c]
	ldrsh r0, [sp, #0x1c]
	strh r1, [sp, #0x1e]
	ldrsh fp, [sp, #0x1e]
	str r0, [sp, #8]
	b _022E97F4
_022E968C:
	cmp r4, #0x700
	ldr r7, [sp, #0x10]
	bge _022E97FC
	ldr r0, [sp, #8]
	mov r6, #0
	sub r0, r0, sb
	str r0, [sp, #4]
	and r0, sb, #0xff
	str r0, [sp, #0x18]
	b _022E97DC
_022E96B4:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, sb
	mov r1, r7
	bl GetTile
	cmp r4, #0x700
	bge _022E97E4
	ldr r1, [sp]
	cmp r1, #0
	beq _022E96E8
	ldrh r1, [r0]
	tst r1, #0x800
	arm_func_end ov29_022E9628

	arm_func_start ov29_022E96E4
ov29_022E96E4: ; 0x022E96E4
	bne _022E97D8
_022E96E8:
	cmp r8, #0
	bne _022E974C
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	bne _022E97A8
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _022E97A8
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _022E97A8
	ldr r0, [sp, #4]
	bl Abs
	cmp r0, #6
	bge _022E9740
	sub r0, fp, r7
	bl Abs
	cmp r0, #6
	blt _022E97A8
_022E9740:
	mov r0, #1
	str r0, [sp, #0xc]
	b _022E97A8
_022E974C:
	ldrh r1, [r0]
	cmp r8, #1
	and r1, r1, #3
	bne _022E978C
	cmp r1, #1
	bne _022E97A8
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _022E97A8
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	b _022E97A8
_022E978C:
	cmp r1, #1
	ldreq r1, [r0, #0x10]
	cmpeq r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_022E97A8:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _022E97CC
	ldr r1, [sp, #0x18]
	add r0, sp, #0x20
	strb r1, [r0, r4, lsl #1]
	add r0, r0, r4, lsl #1
	strb r7, [r0, #1]
	add r4, r4, #1
_022E97CC:
	add r7, r7, #1
	cmp r7, #0x20
	movge r7, #0
_022E97D8:
	add r6, r6, #1
_022E97DC:
	cmp r6, #0x20
	blt _022E96B4
_022E97E4:
	add sb, sb, #1
	cmp sb, #0x38
	movge sb, #0
	add r5, r5, #1
_022E97F4:
	cmp r5, #0x38
	blt _022E968C
_022E97FC:
	cmp r4, #0
	beq _022E982C
	mov r0, r4
	bl DungeonRandInt
	add r2, sp, #0x20
	ldrb r2, [r2, r0, lsl #1]
	add r1, sp, #0x21
	strh r2, [sl]
	ldrb r1, [r1, r0, lsl #1]
	mov r0, #1
	strh r1, [sl, #2]
	b _022E983C
_022E982C:
	add r8, r8, #1
_022E9830:
	cmp r8, #3
	blt _022E964C
	mov r0, #0
_022E983C:
	add sp, sp, #0xe20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_022E96E4

	arm_func_start ov29_022E9844
ov29_022E9844: ; 0x022E9844
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r8, r3
	mov sl, r0
	mov r0, #0
	str r0, [sp, #4]
	str r1, [sp]
	add r3, r8, #1
	mov r1, r0
	mov r0, r3, lsl #1
	mov sb, r2
	ldr r7, [sp, #0x30]
	bl MemAlloc
	mov r4, r0
	mov r1, #0
	b _022E9890
_022E9884:
	mov r0, r1, lsl #1
	strh r1, [r4, r0]
	add r1, r1, #1
_022E9890:
	cmp r1, r8
	blt _022E9884
	cmp r7, #0
	beq _022E9918
	mov r0, #4
	bl DungeonRandInt
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	str r0, [sp, #8]
	sub fp, r8, #1
	mov r6, #0
	b _022E990C
_022E98C0:
	mov r5, #0
	b _022E98F8
_022E98C8:
	mov r0, r8
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	mov r3, r5, lsl #1
	mov r1, r0, asr #0xf
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	add r5, r5, #1
	mov r5, r5, lsl #0x10
	strh r0, [r4, r3]
	strh r2, [r4, r1]
	mov r5, r5, asr #0x10
_022E98F8:
	cmp r5, fp
	blt _022E98C8
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022E990C:
	ldr r0, [sp, #8]
	cmp r6, r0, asr #16
	blt _022E98C0
_022E9918:
	mov r6, #0
	b _022E99D0
_022E9920:
	mov r0, r6, lsl #1
	ldrsh r0, [r4, r0]
	mov r0, r0, lsl #2
	ldrsh r5, [sb, r0]
	cmp r5, #0x63
	beq _022E99D8
	add r1, sb, r0
	ldr r0, [sp]
	ldrsh r1, [r1, #2]
	ldrsh r3, [r0]
	ldrsh r2, [r0, #2]
	add fp, r3, r5
	add r5, r2, r1
	mov r0, fp
	mov r1, r5
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x800
	bne _022E99CC
	cmp r7, #0
	beq _022E99A0
	ldrb r2, [r0, #7]
	cmp r2, #0xff
	beq _022E99CC
	ldr r2, _022E99EC ; =0x02353538
	ldr r2, [r2]
	add r2, r2, #0xcc00
	ldrsh r3, [r2, #0xe4]
	cmp r3, fp
	ldreqsh r2, [r2, #0xe6]
	cmpeq r2, r5
	beq _022E99CC
_022E99A0:
	and r1, r1, #3
	cmp r1, #1
	ldreq r1, [r0, #0x10]
	cmpeq r1, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	streqh fp, [sl]
	streqh r5, [sl, #2]
	moveq r0, #1
	streq r0, [sp, #4]
	beq _022E99D8
_022E99CC:
	add r6, r6, #1
_022E99D0:
	cmp r6, r8
	blt _022E9920
_022E99D8:
	mov r0, r4
	bl MemFree
	ldr r0, [sp, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E99EC: .word 0x02353538
	arm_func_end ov29_022E9844

	arm_func_start ov29_022E99F0
ov29_022E99F0: ; 0x022E99F0
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A08 ; =0x02351844
	mov r3, #0x19
	bl ov29_022E9844
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A08: .word 0x02351844
	arm_func_end ov29_022E99F0

	arm_func_start ov29_022E9A0C
ov29_022E9A0C: ; 0x022E9A0C
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A24 ; =0x023517DC
	mov r3, #0x19
	bl ov29_022E9844
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A24: .word 0x023517DC
	arm_func_end ov29_022E9A0C

	arm_func_start ov29_022E9A28
ov29_022E9A28: ; 0x022E9A28
	stmdb sp!, {r3, lr}
	str r2, [sp]
	ldr r2, _022E9A40 ; =0x023518AC
	mov r3, #0x31
	bl ov29_022E9844
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A40: .word 0x023518AC
	arm_func_end ov29_022E9A28

	arm_func_start TickStatusTurnCounter
TickStatusTurnCounter: ; 0x022E9A44
	ldrb r1, [r0]
	cmp r1, #0x7f
	moveq r0, r1
	bxeq lr
	cmp r1, #0
	moveq r0, r1
	subne r1, r1, #1
	strneb r1, [r0]
	andne r0, r1, #0xff
	bx lr
	arm_func_end TickStatusTurnCounter

	arm_func_start ov29_022E9A6C
ov29_022E9A6C: ; 0x022E9A6C
	ldrh r2, [r0]
	ldr r1, _022E9A98 ; =0x00007530
	cmp r2, r1
	moveq r0, r2
	bxeq lr
	cmp r2, #0
	moveq r0, r2
	subne r1, r2, #1
	strneh r1, [r0]
	ldrneh r0, [r0]
	bx lr
	.align 2, 0
_022E9A98: .word 0x00007530
	arm_func_end ov29_022E9A6C

	arm_func_start ov29_022E9A9C
ov29_022E9A9C: ; 0x022E9A9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r1
	ldr r8, [sb, #0xb4]
	mov sl, r0
	mov r0, sb
	mov r1, #1
	ldrb r4, [r8, #0x4c]
	bl ov29_02300818
	cmp r0, #0
	beq _022E9B00
	ldr r0, _022E9CA0 ; =0x0235171C
	mov r2, r4, lsl #2
	ldrsh r1, [r0, r2]
	ldrsh r3, [sb, #4]
	ldr r0, _022E9CA4 ; =0x0235171E
	add r1, r1, r1, lsl #1
	add r1, r3, r1
	strh r1, [sl]
	ldrsh r0, [r0, r2]
	ldrsh r1, [sb, #6]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	strh r0, [sl, #2]
	b _022E9C98
_022E9B00:
	ldrsh r2, [r8, #0x5a]
	mvn r0, #0
	cmp r2, r0
	ldreqsh r1, [r8, #0x5c]
	cmpeq r1, r0
	bne _022E9C8C
	ldr r0, _022E9CA8 ; =0x02353538
	ldrb r6, [r8, #0x4c]
	ldr r1, [r0]
	ldr r4, _022E9CAC ; =0x0235179C
	add r0, r1, #0x3000
	ldrb r0, [r0, #0xe38]
	ldr r3, _022E9CB0 ; =0x023517A0
	mov r5, r6, lsl #3
	cmp r0, #0
	ldrsh r0, [r3, r5]
	ldr r2, _022E9CB4 ; =0x023517A2
	ldr r4, [r4, r6, lsl #3]
	str r0, [sp, #0x14]
	ldrsh r0, [r2, r5]
	str r0, [sp, #0x10]
	ldrsh r0, [sb, #4]
	str r0, [sp, #0xc]
	ldrsh r0, [sb, #6]
	str r0, [sp, #8]
	beq _022E9B80
	add r0, r1, #0x378
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x14
	str r0, [sp]
	b _022E9C44
_022E9B80:
	ldrb r0, [r8, #6]
	cmp r0, #0
	bne _022E9BA4
	add r0, r1, #0x338
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	b _022E9C44
_022E9BA4:
	add r0, r1, #0x328
	add r0, r0, #0x12800
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp]
	b _022E9C44
_022E9BBC:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldrsh r2, [r4, #2]
	mla fp, r3, r1, r0
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r6, #0
	mla r5, r2, r1, r0
	b _022E9C34
_022E9BE0:
	ldr r0, [sp, #4]
	ldr r7, [r0, r6, lsl #2]
	mov r0, r7
	bl EntityIsValid__022E95F4
	cmp r0, #0
	beq _022E9C30
	ldrsh r0, [r7, #4]
	cmp r0, fp
	ldreqsh r0, [r7, #6]
	cmpeq r0, r5
	bne _022E9C30
	mov r2, #0
	mov r1, r7
	mov r0, sb
	mov r3, r2
	bl ov29_0230175C
	cmp r0, #1
	streqh fp, [sl]
	streqh r5, [sl, #2]
	beq _022E9C98
_022E9C30:
	add r6, r6, #1
_022E9C34:
	ldr r0, [sp]
	cmp r6, r0
	blt _022E9BE0
	add r4, r4, #4
_022E9C44:
	ldrsh r3, [r4]
	cmp r3, #0x63
	bne _022E9BBC
	ldrb r1, [r8, #0x4c]
	ldr r0, _022E9CA0 ; =0x0235171C
	ldrsh r2, [sb, #4]
	mov r1, r1, lsl #2
	ldrsh r1, [r0, r1]
	ldr r0, _022E9CA4 ; =0x0235171E
	add r1, r2, r1, lsl #1
	strh r1, [sl]
	ldrb r1, [r8, #0x4c]
	ldrsh r2, [sb, #6]
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	add r0, r2, r0, lsl #1
	strh r0, [sl, #2]
	b _022E9C98
_022E9C8C:
	strh r2, [sl]
	ldrsh r0, [r8, #0x5c]
	strh r0, [sl, #2]
_022E9C98:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E9CA0: .word 0x0235171C
_022E9CA4: .word 0x0235171E
_022E9CA8: .word 0x02353538
_022E9CAC: .word 0x0235179C
_022E9CB0: .word 0x023517A0
_022E9CB4: .word 0x023517A2
	arm_func_end ov29_022E9A9C

	arm_func_start ov29_022E9CB8
ov29_022E9CB8: ; 0x022E9CB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _022E9F04 ; =0x0237C850
	ldr r0, _022E9F08 ; =0xFFFF000F
	ldrh r2, [r1, #0x1a]
	mov lr, #0
	and r2, r2, r0
	strh r2, [r1, #0x1a]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x100
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x200
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc00
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x1000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	orr r2, r2, #0x2000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x14]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x14]
	ldrh r2, [r1, #0x16]
	and r2, r2, r0, asr #7
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0x3e00
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	bic r2, r2, #0xc000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x16]
	orr r2, r2, #0x4000
	strh r2, [r1, #0x16]
	ldrh r2, [r1, #0x18]
	and r0, r2, r0, asr #6
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xc00
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x18]
	bic r0, r0, #0xf000
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #1
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #2
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0x1a]
	bic r0, r0, #4
	strh r0, [r1, #0x1a]
_022E9DA0:
	mov r0, #0x48
	mul r5, lr, r0
	ldr r3, _022E9F0C ; =0x0237C888
	mov r8, #0x400
	ldr r2, _022E9F10 ; =0x02351628
	mov r1, #0x18
	mla r6, lr, r1, r2
	ldr r0, _022E9F14 ; =0x02351658
	add r4, r3, r5
	add r5, r0, r5
	mov ip, #0
	rsb r8, r8, #0
	mov r7, #0xc
_022E9DD4:
	mul r3, ip, r7
	ldrh r2, [r4, r3]
	add r1, r5, r3
	ldr r0, [r5, r3]
	bic r2, r2, #0x100
	strh r2, [r4, r3]
	ldrh r2, [r4, r3]
	ldr sl, [r1, #4]
	ldr sb, [r1, #8]
	bic r1, r2, #0x200
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov r0, r0, lsl #0x1e
	add r2, r4, r3
	bic r1, r1, #0xc00
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	mov sl, sl, lsl #0x1e
	and sb, sb, r8, lsr #22
	bic r1, r1, #0x1000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r1, r1, #0x2000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	bic r1, r1, #0xc000
	strh r1, [r4, r3]
	ldrh r1, [r4, r3]
	orr r0, r1, r0, lsr #16
	strh r0, [r4, r3]
	ldrh r0, [r2, #2]
	bic r0, r0, #0x3e00
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	bic r0, r0, #0xc000
	strh r0, [r2, #2]
	ldrh r0, [r2, #2]
	orr r0, r0, sl, lsr #16
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	and r0, r0, r8
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, sb
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	orr r0, r0, #0xc00
	strh r0, [r2, #4]
	ldrh r3, [r2, #4]
	mov r1, ip, lsl #2
	add r0, r6, ip, lsl #2
	bic r3, r3, #0xf000
	strh r3, [r2, #4]
	ldrh r3, [r2, #6]
	add ip, ip, #1
	ldrh r1, [r6, r1]
	bic r3, r3, #1
	strh r3, [r2, #6]
	ldrh r3, [r2, #6]
	ldrh r0, [r0, #2]
	cmp ip, #6
	bic r3, r3, #2
	strh r3, [r2, #6]
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	blt _022E9DD4
	add lr, lr, #1
	cmp lr, #2
	blt _022E9DA0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022E9F04: .word 0x0237C850
_022E9F08: .word 0xFFFF000F
_022E9F0C: .word 0x0237C888
_022E9F10: .word 0x02351628
_022E9F14: .word 0x02351658
	arm_func_end ov29_022E9CB8

	arm_func_start ov29_022E9F18
ov29_022E9F18: ; 0x022E9F18
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F70 ; =0x000003E7
	ldr r1, _022E9F74 ; =0x0237C850
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _022E9F78 ; =0x02353560
	str r2, [r1, #0x10]
	strb r2, [r0, #2]
	strh r2, [r1, #0x1c]
	bl ov29_022E9CB8
	ldr r2, _022E9F7C ; =0x02353538
	mov r3, #1
	ldr r0, [r2]
	ldr r1, _022E9F74 ; =0x0237C850
	add r0, r0, #0x1a000
	strb r3, [r0, #0x24c]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a000
	strb r3, [r0, #0x24d]
	str r2, [r1, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F70: .word 0x000003E7
_022E9F74: .word 0x0237C850
_022E9F78: .word 0x02353560
_022E9F7C: .word 0x02353538
	arm_func_end ov29_022E9F18

	arm_func_start ov29_022E9F80
ov29_022E9F80: ; 0x022E9F80
	ldr r2, _022E9F98 ; =0x02353560
	mov r3, #0
	strb r0, [r2]
	str r1, [r2, #8]
	str r3, [r2, #0xc]
	bx lr
	.align 2, 0
_022E9F98: .word 0x02353560
	arm_func_end ov29_022E9F80

	arm_func_start ov29_022E9F9C
ov29_022E9F9C: ; 0x022E9F9C
	ldr r0, _022E9FBC ; =0x02353560
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldrneb r2, [r0, #5]
	movne r1, #0
	strneb r2, [r0, #6]
	strneb r1, [r0, #1]
	bx lr
	.align 2, 0
_022E9FBC: .word 0x02353560
	arm_func_end ov29_022E9F9C

	arm_func_start ov29_022E9FC0
ov29_022E9FC0: ; 0x022E9FC0
	ldr r0, _022E9FCC ; =0x02353560
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_022E9FCC: .word 0x02353560
	arm_func_end ov29_022E9FC0

	arm_func_start ov29_022E9FD0
ov29_022E9FD0: ; 0x022E9FD0
	ldr r1, _022E9FDC ; =0x02353560
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_022E9FDC: .word 0x02353560
	arm_func_end ov29_022E9FD0

	arm_func_start AdvanceFrame
AdvanceFrame: ; 0x022E9FE0
	stmdb sp!, {r3, lr}
	ldr r1, _022EA004 ; =0x02353560
	ldrb r1, [r1, #3]
	cmp r1, #0
	beq _022E9FFC
	bl ov29_022EA2A4
	ldmia sp!, {r3, pc}
_022E9FFC:
	bl ov29_022EA324
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA004: .word 0x02353560
	arm_func_end AdvanceFrame

	arm_func_start ov29_022EA008
ov29_022EA008: ; 0x022EA008
	stmdb sp!, {r3, lr}
	ldr r0, _022EA290 ; =0x02353538
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022EA294 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA27C
	bl ov29_0234B854
	bl ov29_022E886C
	ldr r0, _022EA290 ; =0x02353538
	ldr r0, [r0]
	cmp r0, #0
	beq _022EA0F8
	mov r0, #1
	bl ov29_022E2EC4
	ldr r1, _022EA290 ; =0x02353538
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230]
	ldrsh r0, [ip, r0]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, #1
	mov r3, #0
	bl sub_02051E20
	ldr r1, _022EA290 ; =0x02353538
	ldr r0, [r1]
	add ip, r0, #0x1a000
	ldrb r0, [ip, #0x251]
	cmp r0, #0
	beq _022EA0DC
	mov r0, #2
	strb r0, [ip, #0x23c]
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230]
	mov r2, #0
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	ldrsh r0, [ip, r0]
	mov r3, r2
	mov r1, r1, asr #0x10
	bl sub_02051E20
	b _022EA0F8
_022EA0DC:
	mov r0, #0
	mov lr, #3
	mov r1, r0
	mov r2, r0
	mov r3, r0
	strb lr, [ip, #0x23c]
	bl sub_02051E20
_022EA0F8:
	bl ov29_0230473C
	bl ov29_022E1854
	bl ov29_022E335C
	ldr r0, _022EA290 ; =0x02353538
	ldr r1, [r0]
	ldrsh r0, [r1, #0x1c]
	cmp r0, #0x64
	addlt r0, r0, #1
	strlth r0, [r1, #0x1c]
	ldr r0, _022EA29C ; =0x0237C850
	ldr r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	bne _022EA140
	mov r0, #0
	bl ov29_02339A24
	b _022EA154
_022EA140:
	bl sub_0204AEA0
	cmp r0, #3
	bne _022EA154
	mov r0, #1
	bl ov29_02339A24
_022EA154:
	bl ov29_022EA64C
	bl ov29_022EA80C
	bl ov29_02335A10
	ldr r1, _022EA294 ; =0x02353560
	ldrb r0, [r1]
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r2, [r0, #0x24a]
	cmp r2, #0
	beq _022EA1B8
	bl ov29_022DE11C
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =0x02353538
	mov r2, #0
	ldr r0, [r0]
	ldr r1, _022EA294 ; =0x02353560
	add r0, r0, #0x1a000
	strb r2, [r0, #0x24a]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	b _022EA1D0
_022EA1B8:
	ldr r2, [r1, #0xc]
	sub r2, r2, #1
	str r2, [r1, #0xc]
	cmp r2, #0
	movle r1, #1
	strleb r1, [r0, #0x24a]
_022EA1D0:
	ldr r0, _022EA290 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x24a]
	cmp r0, #0
	beq _022EA214
	bl ov29_0234B4F4
	cmp r0, #3
	beq _022EA214
	ldr r1, _022EA290 ; =0x02353538
	ldr r0, _022EA294 ; =0x02353560
	ldr r1, [r1]
	ldrb r3, [r0, #2]
	add r2, r1, #0x1e0
	mov r0, #0xa0
	mov r1, #0x20
	bl ov29_022DE134
_022EA214:
	ldr r1, _022EA290 ; =0x02353538
	ldr r0, _022EA2A0 ; =0x0001A21C
	ldr r2, [r1]
	add r1, r0, #2
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bl GetTile
	cmp r0, #0
	beq _022EA260
	ldr r2, _022EA290 ; =0x02353538
	ldrb r1, [r0, #7]
	ldr r2, [r2]
	cmp r2, #0
	addne r0, r2, #0xc4
	addne r0, r0, #0x4000
	add r2, r2, #0x21c
	moveq r0, #0
	add r2, r2, #0x1a000
	bl ov29_022ED800
_022EA260:
	bl ov29_02338AC4
	bl ov29_022E8C10
	ldr r0, _022EA290 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x224
	add r0, r0, #0x1a000
	bl ov29_022DD8B4
_022EA27C:
	ldr r0, _022EA29C ; =0x0237C850
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA290: .word 0x02353538
_022EA294: .word 0x02353560
_022EA298: .word 0x0001A224
_022EA29C: .word 0x0237C850
_022EA2A0: .word 0x0001A21C
	arm_func_end ov29_022EA008

	arm_func_start ov29_022EA2A4
ov29_022EA2A4: ; 0x022EA2A4
	stmdb sp!, {r3, lr}
	ldr r0, _022EA318 ; =0x02353538
	ldr r0, [r0]
	cmp r0, #0
	bne _022EA2C0
	bl ov29_022DDEF8
	ldmia sp!, {r3, pc}
_022EA2C0:
	ldr r0, _022EA31C ; =0x02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =0x0237C850
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA318 ; =0x02353538
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x248]
	bl ov29_0233A290
	ldr r0, _022EA31C ; =0x02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =0x0237C850
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA318: .word 0x02353538
_022EA31C: .word 0x02353560
_022EA320: .word 0x0237C850
	arm_func_end ov29_022EA2A4

	arm_func_start ov29_022EA324
ov29_022EA324: ; 0x022EA324
	stmdb sp!, {r3, lr}
	ldr r0, _022EA368 ; =0x02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =0x0237C850
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA368 ; =0x02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =0x0237C850
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA368: .word 0x02353560
_022EA36C: .word 0x0237C850
	arm_func_end ov29_022EA324

	arm_func_start ov29_022EA370
ov29_022EA370: ; 0x022EA370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r4, _022EA3B0 ; =0x02353560
	b _022EA3A4
_022EA384:
	ldrb r0, [r4, #3]
	cmp r0, #0
	mov r0, r5
	beq _022EA39C
	bl ov29_022EA2A4
	b _022EA3A0
_022EA39C:
	bl ov29_022EA324
_022EA3A0:
	sub r6, r6, #1
_022EA3A4:
	cmp r6, #0
	bne _022EA384
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3B0: .word 0x02353560
	arm_func_end ov29_022EA370

	arm_func_start ov29_022EA3B4
ov29_022EA3B4: ; 0x022EA3B4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022EA3F0 ; =0x0237C694
	ldr r5, _022EA3F4 ; =0x02353560
	mov r6, r0
_022EA3C4:
	ldrb r0, [r5, #3]
	cmp r0, #0
	mov r0, r6
	beq _022EA3DC
	bl ov29_022EA2A4
	b _022EA3E0
_022EA3DC:
	bl ov29_022EA324
_022EA3E0:
	ldrh r0, [r4]
	tst r0, #0xf0
	bne _022EA3C4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3F0: .word 0x0237C694
_022EA3F4: .word 0x02353560
	arm_func_end ov29_022EA3B4

	arm_func_start ov29_022EA3F8
ov29_022EA3F8: ; 0x022EA3F8
	ldr ip, _022EA404 ; =ov29_022DE638
	mov r0, #0x100
	bx ip
	.align 2, 0
_022EA404: .word ov29_022DE638
	arm_func_end ov29_022EA3F8

	arm_func_start ov29_022EA408
ov29_022EA408: ; 0x022EA408
	ldr r0, _022EA414 ; =0x0237C850
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022EA414: .word 0x0237C850
	arm_func_end ov29_022EA408

	arm_func_start ov29_022EA418
ov29_022EA418: ; 0x022EA418
	ldr r1, _022EA424 ; =0x02353560
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_022EA424: .word 0x02353560
	arm_func_end ov29_022EA418

	arm_func_start ov29_022EA428
ov29_022EA428: ; 0x022EA428
	stmdb sp!, {r4, lr}
	ldr r1, _022EA620 ; =0x0237C850
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xd
	bgt _022EA48C
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _022EA614
_022EA454: ; jump table
	b _022EA4B4 ; case 0
	b _022EA498 ; case 1
	b _022EA540 ; case 2
	b _022EA4E0 ; case 3
	b _022EA540 ; case 4
	b _022EA570 ; case 5
	b _022EA508 ; case 6
	b _022EA524 ; case 7
	b _022EA5C4 ; case 8
	b _022EA5E0 ; case 9
	b _022EA614 ; case 10
	b _022EA5FC ; case 11
	b _022EA614 ; case 12
	b _022EA594 ; case 13
_022EA48C:
	ldr r0, _022EA624 ; =0x000003E7
	cmp r4, r0
	b _022EA614
_022EA498:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA4B4:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	bl ov29_02339CE8
	mov r0, #0
	bl ov29_02339FF4
	b _022EA614
_022EA4E0:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	mov r0, #1
	bl ov29_02339FF4
	b _022EA614
_022EA508:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA524:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA540:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	bl sub_0204AEC0
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA570:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA594:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA5BC
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA5BC
	bl ov29_02339CE8
	mov r0, #1
	bl ov29_02339FF4
_022EA5BC:
	mov r4, #0
	b _022EA614
_022EA5C4:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5E0:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5FC:
	ldr r0, _022EA628 ; =0x02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
_022EA614:
	ldr r0, _022EA620 ; =0x0237C850
	str r4, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA620: .word 0x0237C850
_022EA624: .word 0x000003E7
_022EA628: .word 0x02353560
	arm_func_end ov29_022EA428

	arm_func_start ov29_022EA62C
ov29_022EA62C: ; 0x022EA62C
	ldr r1, _022EA644 ; =0x0237C850
	mov r2, #0xa
	ldr ip, _022EA648 ; =ov29_0234B1A4
	mov r0, #0
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_022EA644: .word 0x0237C850
_022EA648: .word ov29_0234B1A4
	arm_func_end ov29_022EA62C

	arm_func_start ov29_022EA64C
ov29_022EA64C: ; 0x022EA64C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _022EA708 ; =0x0237C850
	mov r2, #0
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	movmi r1, #0
	strmi r1, [r0, #8]
	ldr r0, _022EA708 ; =0x0237C850
	ldr r1, [r0, #8]
	cmp r1, #0xc
	movge r1, #0
	strge r1, [r0, #8]
	ldr r0, _022EA708 ; =0x0237C850
	mov r1, #0xb
	ldr r3, [r0, #8]
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r0, r0, asr #2
	add ip, r0, r0, lsl #1
	str r2, [sp]
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =0x02353540
	ldr r1, _022EA710 ; =0x020AFC4C
	ldr r2, [r0]
	ldr r0, [r1]
	add r1, r2, ip, lsl #8
	mov r2, #0x1e8
	mov r3, #0x100
	mov r4, ip, lsl #8
	bl sub_0201BAC8
	mov r0, #0
	str r0, [sp]
	mov r1, #0xb
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =0x02353540
	ldr r1, _022EA710 ; =0x020AFC4C
	ldr ip, [r0]
	add r3, r4, #0x100
	ldr r0, [r1]
	add r1, ip, r3
	ldr r2, _022EA714 ; =0x000001EA
	mov r3, #0x200
	bl sub_0201BAC8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA708: .word 0x0237C850
_022EA70C: .word 0x02353540
_022EA710: .word 0x020AFC4C
_022EA714: .word 0x000001EA
	arm_func_end ov29_022EA64C

	arm_func_start ov29_022EA718
ov29_022EA718: ; 0x022EA718
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EA7FC ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x23e]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
	mov fp, #0x29
	ldr r5, _022EA800 ; =0x0237C850
	ldr r4, _022EA804 ; =0x02353560
	b _022EA78C
_022EA75C:
	ldrsh r0, [r5, #0x1c]
	cmp r0, #0
	beq _022EA794
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _022EA780
	mov r0, fp
	bl ov29_022EA2A4
	b _022EA788
_022EA780:
	mov r0, #0x29
	bl ov29_022EA324
_022EA788:
	add r6, r6, #1
_022EA78C:
	cmp r6, #0x14
	blt _022EA75C
_022EA794:
	ldr r1, _022EA800 ; =0x0237C850
	mov r0, #0x3c
	str sl, [r1, #0x20]
	strb r8, [r1, #0x24]
	strh r0, [r1, #0x1c]
	str sb, [r1, #0x28]
	ldrh r2, [sb, #0x26]
	mov r0, #0
	cmp r7, #0
	str r2, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r0, [r1, #0x34]
	bge _022EA7F4
	ldr r0, _022EA808 ; =0xFFFFFC19
	cmp sl, r0
	movlt r0, #6
	strlth r0, [r1, #0x1e]
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movge r0, #0xa
	strgeh r0, [r1, #0x1e]
	movlt r0, #3
	strlth r0, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022EA7F4:
	strh r7, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EA7FC: .word 0x02353538
_022EA800: .word 0x0237C850
_022EA804: .word 0x02353560
_022EA808: .word 0xFFFFFC19
	arm_func_end ov29_022EA718

	arm_func_start ov29_022EA80C
ov29_022EA80C: ; 0x022EA80C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r0, _022EA95C ; =0x0237C850
	ldrsh r1, [r0, #0x1c]
	cmp r1, #0
	beq _022EA954
	ldr r0, [r0, #0x28]
	cmp r0, #0
	moveq r0, #0
	beq _022EA848
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022EA848:
	cmp r0, #0
	ldreq r0, _022EA95C ; =0x0237C850
	moveq r1, #0
	streqh r1, [r0, #0x1c]
	beq _022EA954
	ldr r3, _022EA95C ; =0x0237C850
	ldr r5, [r3, #0x28]
	ldr r1, [r3, #0x2c]
	ldrh r0, [r5, #0x26]
	cmp r1, r0
	movne r0, #0
	strneh r0, [r3, #0x1c]
	bne _022EA954
	ldrsh r2, [r3, #0x1c]
	ldr r1, _022EA960 ; =0x02353538
	ldr r0, _022EA964 ; =0x0001A224
	sub r2, r2, #1
	strh r2, [r3, #0x1c]
	ldr r4, [r3, #0x34]
	add r2, r0, #2
	sub lr, r4, #0x2e
	str lr, [r3, #0x34]
	ldr r4, [r5, #0xb4]
	ldr ip, [r1]
	add r1, r4, #0x100
	ldrsh r5, [r1, #0x82]
	ldrsh r4, [r1, #0x84]
	ldr r1, [r3, #0x30]
	ldrsh r0, [ip, r0]
	add r5, r5, r1, asr #8
	ldrsh r1, [ip, r2]
	add r4, r4, lr, asr #8
	sub r2, r4, #0x18
	sub r4, r5, r0
	mvn r0, #0x1f
	cmp r4, r0
	sub r5, r2, r1
	addge r0, r0, #0x18
	cmpge r5, r0
	blt _022EA954
	cmp r4, #0xff
	cmplt r5, #0xc0
	bge _022EA954
	ldrsh r1, [r3, #0x1c]
	mov r0, #0xff
	cmp r1, #0x1f
	bge _022EA910
	rsb r0, r1, r1, lsl #8
	mov r1, #0x1f
	bl DivideInt
_022EA910:
	ldr ip, _022EA95C ; =0x0237C850
	mov r1, r4, lsl #0x10
	ldrh r4, [ip, #0x1e]
	mov r2, r5, lsl #0x10
	mov r3, r0, lsl #0x10
	str r4, [sp]
	ldr r4, [ip, #0x20]
	mov r0, r1, asr #0x10
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	str r1, [sp, #4]
	ldrb r4, [ip, #0x24]
	mov r1, r2, asr #0x10
	mov r3, r3, asr #0x10
	mov r2, #0xff
	str r4, [sp, #8]
	bl ov29_02335F40
_022EA954:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022EA95C: .word 0x0237C850
_022EA960: .word 0x02353538
_022EA964: .word 0x0001A224
	arm_func_end ov29_022EA80C

	arm_func_start ov29_022EA968
ov29_022EA968: ; 0x022EA968
	orr r1, r0, #1
	ldr r0, _022EA97C ; =0x02353570
	bic r1, r1, #0xff000000
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022EA97C: .word 0x02353570
	arm_func_end ov29_022EA968

	arm_func_start GenerateDungeonRngSeed
GenerateDungeonRngSeed: ; 0x022EA980
	ldr r2, _022EA9C4 ; =0x02353570
	mov r1, #0x10000
	ldr r3, [r2, #8]
	ldr r0, _022EA9C8 ; =0x5D588B65
	rsb r1, r1, #0
	mul ip, r3, r0
	add ip, ip, #1
	mul r0, ip, r0
	add r3, r0, #1
	mov r0, ip, lsr #0x10
	mov r0, r0, lsl #0x10
	and r1, r3, r1
	orr r0, r1, r0, lsr #16
	bic r0, r0, #0xff000000
	str r3, [r2, #8]
	orr r0, r0, #1
	bx lr
	.align 2, 0
_022EA9C4: .word 0x02353570
_022EA9C8: .word 0x5D588B65
	arm_func_end GenerateDungeonRngSeed

	arm_func_start GetDungeonRngPreseed
GetDungeonRngPreseed: ; 0x022EA9CC
	ldr r0, _022EA9D8 ; =0x02353570
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022EA9D8: .word 0x02353570
	arm_func_end GetDungeonRngPreseed

	arm_func_start SetDungeonRngPreseed
SetDungeonRngPreseed: ; 0x022EA9DC
	ldr r1, _022EA9E8 ; =0x02353570
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_022EA9E8: .word 0x02353570
	arm_func_end SetDungeonRngPreseed

	arm_func_start InitDungeonRng
InitDungeonRng: ; 0x022EA9EC
	ldr r1, _022EAA18 ; =0x02353570
	orr r2, r0, #1
	str r2, [r1, #0xc]
	mov r2, #0
	str r2, [r1, #4]
	ldr r1, _022EAA1C ; =0x02353584
_022EAA04:
	str r0, [r1, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #5
	blt _022EAA04
	bx lr
	.align 2, 0
_022EAA18: .word 0x02353570
_022EAA1C: .word 0x02353584
	arm_func_end InitDungeonRng

	arm_func_start DungeonRand16Bit
DungeonRand16Bit: ; 0x022EAA20
	stmdb sp!, {r3, lr}
	ldr r1, _022EAA88 ; =0x02353570
	ldrb r0, [r1]
	cmp r0, #0
	ldr r0, _022EAA8C ; =0x5D588B65
	beq _022EAA5C
	ldr lr, [r1, #0x10]
	ldr r3, _022EAA90 ; =0x02353584
	ldr r1, _022EAA94 ; =0x00269EC3
	ldr r2, [r3, lr, lsl #2]
	umull ip, r0, r2, r0
	adds r1, ip, r1
	mov r0, r1, lsl #0x10
	str r1, [r3, lr, lsl #2]
	b _022EAA80
_022EAA5C:
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	ldr r2, [r1, #0xc]
	mul r0, r2, r0
	add r2, r0, #1
	mov r0, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	str r2, [r1, #0xc]
_022EAA80:
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EAA88: .word 0x02353570
_022EAA8C: .word 0x5D588B65
_022EAA90: .word 0x02353584
_022EAA94: .word 0x00269EC3
	arm_func_end DungeonRand16Bit

	arm_func_start DungeonRandInt
DungeonRandInt: ; 0x022EAA98
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DungeonRand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mul r0, r1, r4
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end DungeonRandInt

	arm_func_start DungeonRandRange
DungeonRandRange: ; 0x022EAAC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	bge _022EAAFC
	bl DungeonRand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r4, r5
	mul r0, r1, r0
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	add r0, r5, r0, lsr #16
	ldmia sp!, {r3, r4, r5, pc}
_022EAAFC:
	bl DungeonRand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r5, r4
	mul r0, r1, r0
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	add r0, r4, r0, lsr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonRandRange
