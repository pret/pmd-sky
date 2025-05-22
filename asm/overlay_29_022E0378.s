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

	arm_func_start IsBossFight
IsBossFight: ; 0x022E0864
	cmp r0, #0
	beq _022E0878
	cmp r0, #0x51
	movlo r0, #1
	bxlo lr
_022E0878:
	mov r0, #0
	bx lr
	arm_func_end IsBossFight

	arm_func_start IsCurrentFixedRoomBossFight
IsCurrentFixedRoomBossFight: ; 0x022E0880
	ldr r0, _022E0898 ; =DUNGEON_PTR
	ldr ip, _022E089C ; =IsBossFight
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bx ip
	.align 2, 0
_022E0898: .word DUNGEON_PTR
_022E089C: .word IsBossFight
	arm_func_end IsCurrentFixedRoomBossFight

	arm_func_start IsMarowakTrainingMaze
IsMarowakTrainingMaze: ; 0x022E08A0
	ldr r0, _022E08C8 ; =DUNGEON_PTR
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
_022E08C8: .word DUNGEON_PTR
	arm_func_end IsMarowakTrainingMaze

	arm_func_start FixedRoomIsSubstituteRoom
FixedRoomIsSubstituteRoom: ; 0x022E08CC
	ldr r0, _022E08F0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0x6e
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E08F0: .word DUNGEON_PTR
	arm_func_end FixedRoomIsSubstituteRoom

	arm_func_start ov29_022E08F4
ov29_022E08F4: ; 0x022E08F4
	ldr r0, _022E0924 ; =DUNGEON_PTR
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
_022E0924: .word DUNGEON_PTR
	arm_func_end ov29_022E08F4

	arm_func_start StoryRestrictionsEnabled
StoryRestrictionsEnabled: ; 0x022E0928
	ldr r0, _022E0958 ; =DUNGEON_PTR
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
_022E0958: .word DUNGEON_PTR
	arm_func_end StoryRestrictionsEnabled

	arm_func_start GetScenarioBalanceVeneer
GetScenarioBalanceVeneer: ; 0x022E095C
	ldr ip, _022E0964 ; =GetScenarioBalance
	bx ip
	.align 2, 0
_022E0964: .word GetScenarioBalance
	arm_func_end GetScenarioBalanceVeneer

	arm_func_start FadeToBlack
FadeToBlack: ; 0x022E0968
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov29_0233A248
	bl ov29_022E0DFC
	mov r0, #2
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #2
	mov r1, #0x1000
	mov r2, #1
	bl StartFadeDungeonWrapper
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
	ldr r0, _022E09E4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a9]
#else
	strb r1, [r0, #0x24d]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E09E4: .word DUNGEON_PTR
	arm_func_end FadeToBlack

	arm_func_start ov29_022E09E8
ov29_022E09E8: ; 0x022E09E8
	ldr r2, _022E0A00 ; =DUNGEON_PTR
	ldr r3, [r2]
	str r0, [r3, #0x18]
	ldr r0, [r2]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_022E0A00: .word DUNGEON_PTR
	arm_func_end ov29_022E09E8

	arm_func_start ov29_022E0A04
ov29_022E0A04: ; 0x022E0A04
	ldr r0, _022E0A14 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_022E0A14: .word DUNGEON_PTR
	arm_func_end ov29_022E0A04

	arm_func_start ov29_022E0A18
ov29_022E0A18: ; 0x022E0A18
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl AnimationDelayOrSomething
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_022E8BFC
	mov r0, #0
	bl SetMinimapDataE447
	ldr r0, _022E0A60 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a9]
#else
	strb r1, [r0, #0x24d]
#endif
	bl FadeToBlack
	mov r0, #0
	bl ov29_022E9FD0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0A60: .word DUNGEON_PTR
	arm_func_end ov29_022E0A18

	arm_func_start ov29_022E0A64
ov29_022E0A64: ; 0x022E0A64
	stmdb sp!, {r3, lr}
	ldr r1, _022E0B34 ; =ov29_0237C694
	mov r0, #0
	bl GetHeldButtons
	ldr r1, _022E0B38 ; =ov29_0237C696
	mov r0, #0
	bl GetPressedButtons
	ldr r1, _022E0B3C ; =ov29_0237C698
	mov r0, #0
	bl sub_020063F4
	ldr r0, _022E0B40 ; =ov29_0237C694
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
	ldr r0, _022E0B40 ; =ov29_0237C694
	mov r1, #0
	strh r1, [r0, #0xa]
_022E0ADC:
	ldr r0, _022E0B40 ; =ov29_0237C694
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
	ldr r0, _022E0B40 ; =ov29_0237C694
	mov r1, #0
	strh r1, [r0, #0xc]
_022E0B24:
	ldr r0, _022E0B40 ; =ov29_0237C694
	ldrh r1, [r0, #8]
	strh r1, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0B34: .word ov29_0237C694
_022E0B38: .word ov29_0237C696
_022E0B3C: .word ov29_0237C698
_022E0B40: .word ov29_0237C694
	arm_func_end ov29_022E0A64

	arm_func_start ov29_022E0B44
ov29_022E0B44: ; 0x022E0B44
	ldr r1, _022E0B58 ; =0x000003E7
	ldr r0, _022E0B5C ; =ov29_0237C694
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	bx lr
	.align 2, 0
_022E0B58: .word 0x000003E7
_022E0B5C: .word ov29_0237C694
	arm_func_end ov29_022E0B44

	arm_func_start ov29_022E0B60
ov29_022E0B60: ; 0x022E0B60
	stmdb sp!, {r3, lr}
	bl sub_0204AE80
	cmp r0, #0
	beq _022E0C18
	ldr r0, _022E0C24 ; =ov29_0237C6A4
	bl GetReleasedStylus
	ldr r0, _022E0C28 ; =ov29_0237C6A4
	ldrb r1, [r0, #0x2c]
	cmp r1, #0
	beq _022E0B98
	ldrh r1, [r0]
	tst r1, #0x40
	moveq r1, #0
	streqb r1, [r0, #0x2c]
_022E0B98:
	ldr r0, _022E0C28 ; =ov29_0237C6A4
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
	ldr r0, _022E0C24 ; =ov29_0237C6A4
	bl sub_02006BFC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0C24: .word ov29_0237C6A4
_022E0C28: .word ov29_0237C6A4
	arm_func_end ov29_022E0B60

	arm_func_start ov29_022E0C2C
ov29_022E0C2C: ; 0x022E0C2C
	ldr r1, _022E0C38 ; =ov29_0237C6A4
	strb r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_022E0C38: .word ov29_0237C6A4
	arm_func_end ov29_022E0C2C

	arm_func_start ov29_022E0C3C
ov29_022E0C3C: ; 0x022E0C3C
	ldr r0, _022E0C48 ; =ov29_0237C6A4
	ldrb r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_022E0C48: .word ov29_0237C6A4
	arm_func_end ov29_022E0C3C

	arm_func_start ov29_022E0C4C
ov29_022E0C4C: ; 0x022E0C4C
	stmdb sp!, {r3, lr}
	bl sub_02006564
	ldr r0, _022E0C60 ; =ov29_0237C6A4
	bl sub_02006BFC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E0C60: .word ov29_0237C6A4
	arm_func_end ov29_022E0C4C

	arm_func_start ov29_022E0C64
ov29_022E0C64: ; 0x022E0C64
	ldr r1, _022E0C7C ; =ov29_0237C6A4
	ldr r2, [r1, #4]
	ldr r1, [r1, #8]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0C7C: .word ov29_0237C6A4
	arm_func_end ov29_022E0C64

	arm_func_start ov29_022E0C80
ov29_022E0C80: ; 0x022E0C80
	ldr r1, _022E0C98 ; =ov29_0237C6A4
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #0x10]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0C98: .word ov29_0237C6A4
	arm_func_end ov29_022E0C80

	arm_func_start ov29_022E0C9C
ov29_022E0C9C: ; 0x022E0C9C
	ldr r1, _022E0CB4 ; =ov29_0237C6A4
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022E0CB4: .word ov29_0237C6A4
	arm_func_end ov29_022E0C9C

	arm_func_start CheckTouchscreenArea
CheckTouchscreenArea: ; 0x022E0CB8
	stmdb sp!, {r3, lr}
	ldr lr, _022E0CF8 ; =ov29_0237C6B8
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
_022E0CF8: .word ov29_0237C6B8
	arm_func_end CheckTouchscreenArea

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
	ldr r3, _022E0F64 ; =_020AFC4C
	mov r2, #0x70
	ldr ip, [r3]
	ldr r3, _022E0F68 ; =_020AFC28
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
_022E0F64: .word _020AFC4C
_022E0F68: .word _020AFC28
	arm_func_end ov29_022E0F2C

	arm_func_start ov29_022E0F6C
ov29_022E0F6C: ; 0x022E0F6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x74
	ldr r3, _022E11D0 ; =ov29_023510E0
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
	bl DirectoryFileMngr_OpenDirectoryFile
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
	ldr r0, _022E11D8 ; =_020AFC4C
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
	bl DirectoryFileMngr_OpenDirectoryFile
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
	bl CopyAndInterleaveWrapper
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
	bl DirectoryFileMngr_OpenDirectoryFile
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
	ldr r0, _022E11D8 ; =_020AFC4C
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
	bl DirectoryFileMngr_OpenDirectoryFile
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
	ldr r2, _022E11E8 ; =ov29_02353544
	mov r0, #4
	mov r1, #0x3e4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, _022E11EC ; =ov29_02353540
	ldr r0, _022E11F0 ; =ov29_02353540
	ldr r1, [r1, #4]
	bl HandleSir0Translation
	add r0, sp, #0x20
	mov r1, #4
#ifdef JAPAN
	mov r2, #0x3f4
#else
	mov r2, #0x400
#endif
	mov r3, #0
	bl LoadWteFromFileDirectory
	mov r6, #0
	mov r5, r6
	ldr r4, _022E11F4 ; =_020AFC70
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
	bl LoadTextureUi
	bl ov29_02335774
	add sp, sp, #0x74
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E11D0: .word ov29_023510E0
_022E11D4: .word 0x000003E5
_022E11D8: .word _020AFC4C
_022E11DC: .word 0x000003E3
_022E11E0: .word 0x000003E7
_022E11E4: .word 0x000003E6
_022E11E8: .word ov29_02353544
_022E11EC: .word ov29_02353540
_022E11F0: .word ov29_02353540
_022E11F4: .word _020AFC70
	arm_func_end ov29_022E0F6C

	arm_func_start ov29_022E11F8
ov29_022E11F8: ; 0x022E11F8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022E12EC ; =0x00000409
	add r2, sp, #4
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr lr, [sp]
	mov r4, #0
	ldr ip, _022E12F0 ; =ov29_0237C6D4
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
	bl IsCurrentTilesetBackground
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
#ifdef JAPAN
_022E12EC: .word 0x000003FD
#else
_022E12EC: .word 0x00000409
#endif
_022E12F0: .word ov29_0237C6D4
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
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #8]
	add r0, sp, #0x10
	bl HandleSir0Translation
	ldr sb, [sp, #0x10]
	ldr r4, _022E14F0 ; =_020AFC4C
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
	bl CopyAndInterleaveWrapper
	add r0, sp, #8
	bl UnloadFile
	bl ov29_022E11F8
	mov r5, #0
	ldr r2, _022E14F4 ; =ov10_022C4D54
	ldr fp, _022E14F8 ; =DUNGEON_PTR
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
	ldr r1, _022E14F8 ; =DUNGEON_PTR
	ldr r0, _022E1500 ; =0x00012A92
	mov r4, #0
_022E142C:
	ldr r2, [r1]
	add r2, r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r2, r0]
	cmp r4, #9
	blt _022E142C
#ifdef JAPAN
	ldr r2, _022E1504 ; =0x0000F2F0
	ldr r1, _022E14F8 ; =DUNGEON_PTR
	mov r7, #0x2f0
	mov r3, #0
_022E2AE4:
	ldr r0, [r1]
	add r0, r0, r3, lsl #1
	add r0, r0, #0x12000
	add r3, r3, #1
	strh r2, [r0, #0x88]
	cmp r3, #9
	blt _022E2AE4
	ldr r2, _022E14F4 ; =ov10_022C4D54
	ldr lr, _022E14F8 ; =DUNGEON_PTR
	add r7, r7, #1
	mov r8, #1
	mov r4, #0x1a
	mov r5, #0x19
	mov r3, #0
	mov ip, #0x12
_022E1490:
	cmp r8, #1
	moveq sl, r5
	beq _022E2B34
	cmp r8, #2
	moveq sl, r4
_022E2B34:
	mul r6, r8, ip
	mov r0, sl, lsl #1
	ldrsh r1, [r2, r0]
	mov sb, r3
_022E2B44:
	ldr fp, [lr]
	orr r0, r7, r1, lsl #12
	add fp, r6, fp
	add fp, fp, sb, lsl #1
	add fp, fp, #0x12000
	strh r0, [fp, #0x88]
	add sb, sb, #1
	cmp sb, #9
	add r7, r7, #1
	blt _022E2B44
	add r8, r8, #1
	cmp r8, #3
#else
	ldr r3, _022E1504 ; =0x0000F2F0
	ldr r1, _022E14F8 ; =DUNGEON_PTR
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
	ldr r2, _022E14F4 ; =ov10_022C4D54
	ldr ip, _022E14F8 ; =DUNGEON_PTR
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
#endif
	blt _022E1490
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022E14EC: .word 0x000003F2
#else
_022E14EC: .word 0x000003FE
#endif
_022E14F0: .word _020AFC4C
_022E14F4: .word ov10_022C4D54
_022E14F8: .word DUNGEON_PTR
#ifdef JAPAN
_022E14FC: .word 0x00011E24
_022E1500: .word 0x000129EE
_022E1504: .word 0x0000F2F0
#else
_022E14FC: .word 0x00011EC8
_022E1500: .word 0x00012A92
_022E1504: .word 0x0000F2F0
_022E1508: .word 0x0001212C
#endif
	arm_func_end ov29_022E1304

	arm_func_start ov29_022E150C
ov29_022E150C: ; 0x022E150C
	ldr r0, _022E154C ; =DUNGEON_PTR
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
_022E154C: .word DUNGEON_PTR
	arm_func_end ov29_022E150C

	arm_func_start ov29_022E1550
ov29_022E1550: ; 0x022E1550
#ifdef JAPAN
#define OV29_022E1550_OFFSET -0xA4
#else
#define OV29_022E1550_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	bl GetFloorType
	cmp r0, #0
	bne _022E1590
	ldr r0, _022E15C4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, _022E15C4 ; =DUNGEON_PTR
	movne r1, #0x1c
	ldr r0, [r0]
	moveq r1, #0x1b
	add r0, r0, #0x4000
	strh r1, [r0, #0xd8 + OV29_022E1550_OFFSET]
	ldmia sp!, {r3, pc}
_022E1590:
	cmp r0, #1
	ldrne r0, _022E15C4 ; =DUNGEON_PTR
	movne r1, #0x1d
	ldrne r0, [r0]
	addne r0, r0, #0x4000
	strneh r1, [r0, #0xd8 + OV29_022E1550_OFFSET]
	ldmneia sp!, {r3, pc}
	ldr r0, _022E15C4 ; =DUNGEON_PTR
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd8 + OV29_022E1550_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E15C4: .word DUNGEON_PTR
	arm_func_end ov29_022E1550

	arm_func_start ov29_022E15C8
ov29_022E15C8: ; 0x022E15C8
	stmdb sp!, {r3, lr}
	ldr r0, _022E15FC ; =ov29_02353540
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022E15E4
	ldr r0, _022E1600 ; =ov29_02353544
	bl UnloadFile
_022E15E4:
	bl ov29_02335760
	bl ov29_02335804
	ldr r0, _022E15FC ; =ov29_02353540
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E15FC: .word ov29_02353540
_022E1600: .word ov29_02353544
	arm_func_end ov29_022E15C8

	arm_func_start ov29_022E1604
ov29_022E1604: ; 0x022E1604
	bx lr
	arm_func_end ov29_022E1604

	arm_func_start GetTrapInfo
GetTrapInfo: ; 0x022E1608
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end GetTrapInfo
