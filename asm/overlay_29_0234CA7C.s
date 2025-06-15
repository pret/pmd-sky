	.include "asm/macros.inc"
	.include "overlay_29_0234CA7C.inc"

	.text

	arm_func_start ov29_0234CA7C
ov29_0234CA7C: ; 0x0234CA7C
	mov r0, #0x5800
	bx lr
	arm_func_end ov29_0234CA7C

	arm_func_start ov29_0234CA84
ov29_0234CA84: ; 0x0234CA84
	stmdb sp!, {r3, lr}
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _0234CAC8 ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	mov r0, #0x21
	str r2, [r1, #4]
	bl LoadOverlay
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r1, #0x5800
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl WriteQuicksaveData
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAC4: .word ov29_023537E4
_0234CAC8: .word ov29_0237D000
	arm_func_end ov29_0234CA84

	arm_func_start ov29_0234CACC
ov29_0234CACC: ; 0x0234CACC
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CAE8
	mov r0, #0x21
	bl UnloadOverlay
_0234CAE8:
	ldr r0, _0234CAFC ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAFC: .word ov29_023537E4
	arm_func_end ov29_0234CACC

	arm_func_start ov29_0234CB00
ov29_0234CB00: ; 0x0234CB00
	ldr r0, _0234CB28 ; =ov29_023537E4
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0234CB2C ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	ldr ip, _0234CB30 ; =LoadOverlay
	mov r0, #0x21
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_0234CB28: .word ov29_023537E4
_0234CB2C: .word ov29_0237D000
_0234CB30: .word LoadOverlay
	arm_func_end ov29_0234CB00

	arm_func_start ov29_0234CB34
ov29_0234CB34: ; 0x0234CB34
	ldr r0, _0234CB4C ; =ov29_023537E4
	ldr ip, _0234CB50 ; =ov30_023842F4
	ldr r0, [r0]
	mov r1, #0x5800
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234CB4C: .word ov29_023537E4
_0234CB50: .word ov30_023842F4
	arm_func_end ov29_0234CB34

	arm_func_start ov29_0234CB54
ov29_0234CB54: ; 0x0234CB54
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CB70
	mov r0, #0x21
	bl UnloadOverlay
_0234CB70:
	ldr r0, _0234CB84 ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CB84: .word ov29_023537E4
	arm_func_end ov29_0234CB54

	arm_func_start DisplayFloorTip
DisplayFloorTip: ; 0x0234CB88
	stmdb sp!, {r3, lr}
	bl GetLeader
	ldr r2, _0234CC88 ; =DUNGEON_PTR
	mvn r3, #0
	ldr r1, [r2]
	ldr r0, _0234CC8C ; =ov29_023532C0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r2, [r2]
	mov r1, #1
	add r2, r2, #0x100
	strh r3, [r2, #0xda]
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC90 ; =ov29_023532B8
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC94 ; =ov29_023532B0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC98 ; =ov29_02353240
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldreq r0, _0234CC88 ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x748]
	cmpeq r0, #3
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC9C ; =ov29_023532A0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA0 ; =ov29_02353298
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA4 ; =ov29_02353290
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA8 ; =ov29_02353278
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCAC ; =ov29_02353238
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCB0 ; =ov29_023532E0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CC88: .word DUNGEON_PTR
_0234CC8C: .word ov29_023532C0
_0234CC90: .word ov29_023532B8
_0234CC94: .word ov29_023532B0
_0234CC98: .word ov29_02353240
_0234CC9C: .word ov29_023532A0
_0234CCA0: .word ov29_02353298
_0234CCA4: .word ov29_02353290
_0234CCA8: .word ov29_02353278
_0234CCAC: .word ov29_02353238
_0234CCB0: .word ov29_023532E0
	arm_func_end DisplayFloorTip

	arm_func_start DisplayItemTip
DisplayItemTip: ; 0x0234CCB4
	stmdb sp!, {r4, lr}
	ldr r2, _0234CEA4 ; =DUNGEON_PTR
	mvn r3, #0
	ldr r1, [r2]
	mov r4, r0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r1, [r2]
	add r1, r1, #0x100
	strh r3, [r1, #0xda]
	bl GetItemCategoryVeneer
	cmp r0, #3
	bne _0234CCF8
	ldr r0, _0234CEA8 ; =ov29_023532F0
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CCF8:
	cmp r4, #0x46
	bne _0234CD10
	ldr r0, _0234CEAC ; =ov29_023532F8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD10:
	cmp r4, #0x52
	bne _0234CD28
	ldr r0, _0234CEB0 ; =ov29_023532D8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD28:
	cmp r4, #0x57
	bne _0234CD40
	ldr r0, _0234CEB4 ; =ov29_023532C8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD40:
	cmp r4, #8
	bne _0234CD58
	ldr r0, _0234CEB8 ; =ov29_02353250
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD58:
	cmp r4, #0x51
	bne _0234CD70
	ldr r0, _0234CEBC ; =ov29_02353248
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD70:
	cmp r4, #0x54
	bne _0234CD88
	ldr r0, _0234CEC0 ; =ov29_02353270
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD88:
	cmp r4, #0xb7
	bne _0234CDA0
	ldr r0, _0234CEC4 ; =ov29_02353280
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDA0:
	cmp r4, #0x63
	bne _0234CDB8
	ldr r0, _0234CEC8 ; =ov29_023532A8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDB8:
	cmp r4, #0x45
	bne _0234CDD0
	ldr r0, _0234CECC ; =ov29_02353300
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDD0:
	cmp r4, #0x5b
	bne _0234CDE8
	ldr r0, _0234CED0 ; =ov29_02353258
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDE8:
	cmp r4, #0x56
	bne _0234CE00
	ldr r0, _0234CED4 ; =ov29_02353268
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE00:
	cmp r4, #0x5e
	bne _0234CE18
	ldr r0, _0234CED8 ; =ov29_02353288
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE18:
	cmp r4, #0x4c
	bne _0234CE30
	ldr r0, _0234CEDC ; =ov29_023532E8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE30:
	cmp r4, #0x60
	bne _0234CE48
	ldr r0, _0234CEE0 ; =ov29_02353260
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE48:
	cmp r4, #0x75
	bne _0234CE60
	ldr r0, _0234CEE4 ; =ov29_02353308
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE60:
	ldr r0, _0234CEA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
#ifdef JAPAN
	cmp r0, #0x7a
#else
	cmp r0, #0x7b
#endif
	ldmneia sp!, {r4, pc}
	ldr r0, _0234CEE8 ; =0xFFFFFED2
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	ldr r0, _0234CEEC ; =ov29_02353310
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234CEA4: .word DUNGEON_PTR
_0234CEA8: .word ov29_023532F0
_0234CEAC: .word ov29_023532F8
_0234CEB0: .word ov29_023532D8
_0234CEB4: .word ov29_023532C8
_0234CEB8: .word ov29_02353250
_0234CEBC: .word ov29_02353248
_0234CEC0: .word ov29_02353270
_0234CEC4: .word ov29_02353280
_0234CEC8: .word ov29_023532A8
_0234CECC: .word ov29_02353300
_0234CED0: .word ov29_02353258
_0234CED4: .word ov29_02353268
_0234CED8: .word ov29_02353288
_0234CEDC: .word ov29_023532E8
_0234CEE0: .word ov29_02353260
_0234CEE4: .word ov29_02353308
_0234CEE8: .word 0xFFFFFED2
_0234CEEC: .word ov29_02353310
	arm_func_end DisplayItemTip

	arm_func_start DisplayDungeonTip
DisplayDungeonTip: ; 0x0234CEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, r1
	bl GetDungeonTipShown
	cmp r0, #0
	bne _0234CF58
	ldrh r0, [r5, #4]
	bl StringFromId
	ldrb r0, [r0]
	cmp r0, #0
	beq _0234CF58
	ldr r0, [r5]
	bl SetDungeonTipShown
	bl ov29_022EACBC
	ldrh r1, [r5, #4]
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	cmp r4, #0
	beq _0234CF50
	bl GetLeader
	ldrh r1, [r5, #4]
	bl LogMessageByIdQuiet
_0234CF50:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0234CF58:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DisplayDungeonTip

	arm_func_start SetBothScreensWindowColorToDefault
SetBothScreensWindowColorToDefault: ; 0x0234CF60
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	bne _0234CF7C
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF7C:
	bl GetPlayerGender
	cmp r0, #1
	bne _0234CF94
	mov r0, #0
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF94:
	mov r0, #1
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
	arm_func_end SetBothScreensWindowColorToDefault

	arm_func_start ov29_0234CFA0
ov29_0234CFA0: ; 0x0234CFA0
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CFE8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsFutureDungeon
	cmp r0, #0
	bne _0234CFD8
	bl IsSecretFloor
	cmp r0, #0
	beq _0234CFE0
_0234CFD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0234CFE0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CFE8: .word DUNGEON_PTR
	arm_func_end ov29_0234CFA0

	arm_func_start GetPersonalityIndex
GetPersonalityIndex: ; 0x0234CFEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x48]
	cmp r0, #0xd8
	cmpne r0, #0xf9
	cmpne r0, #0xf7
	cmpne r0, #0xf8
	beq _0234D1D4
	cmp r0, #0xd6
	blo _0234D1D4
	cmp r0, #0xd7
	bne _0234D04C
	mov r0, #0
	mov r1, #0x43
	bl LoadScriptVariableValue
	cmp r0, #1
	moveq r4, #0x4b0
	beq _0234D1E0
	cmp r0, #2
	ldreq r4, _0234D1E8 ; =0x000004B1
	beq _0234D1E0
	cmp r0, #3
	ldreq r4, _0234D1EC ; =0x000004B2
	b _0234D1E0
_0234D04C:
	cmp r0, #0xd6
	bne _0234D0A0
	ldrsh r2, [r5, #2]
	ldr r1, _0234D1F0 ; =0x000001B2
	cmp r2, r1
	ldreq r4, _0234D1F4 ; =0x000004CD
	beq _0234D1E0
	cmp r2, #0xae
	addeq r4, r1, #0x31c
	beq _0234D1E0
	add r0, r1, #0x27c
	cmp r2, r0
	ldreq r4, _0234D1F8 ; =0x000004CF
	beq _0234D1E0
	sub r0, r1, #0x99
	cmp r2, r0
	moveq r4, #0x4d0
	beq _0234D1E0
	cmp r2, #0x318
	ldreq r4, _0234D1FC ; =0x000004D1
	b _0234D1E0
_0234D0A0:
	cmp r0, #0xda
#ifdef JAPAN
	bne _0234E334
	ldr r0, _0234D204 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsFutureDungeon
	cmp r0, #0
	ldrne r0, _0234E48C ; =0x000004BC
	ldreq r0, _0234D200 ; =0x000004B3
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	b _0234D1E0
_0234E334:
#else
	ldreq r4, _0234D200 ; =0x000004B3
	beq _0234D1E0
#endif
	cmp r0, #0xed
	bne _0234D148
	ldr r0, _0234D204 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r1, [r0, #0x748]
	add r0, r1, #0x7b
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D208 ; =0x000004C4
	bls _0234D1E0
	cmp r1, #0x88
	ldreq r4, _0234D20C ; =0x000004C6
	beq _0234D1E0
	add r0, r1, #0x77
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D210 ; =0x000004C7
	bls _0234D1E0
	add r0, r1, #0x75
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D214 ; =0x000004C8
	bls _0234D1E0
	cmp r1, #0x8d
	ldreq r4, _0234D218 ; =0x000004C9
	beq _0234D1E0
	add r0, r1, #0x72
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D21C ; =0x000004CA
	bls _0234D1E0
	cmp r1, #0x91
	ldreq r4, _0234D220 ; =0x000004CB
	beq _0234D1E0
	add r0, r1, #0x6e
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D224 ; =0x000004CC
	b _0234D1E0
_0234D148:
	cmp r0, #0xe2
	bne _0234D170
	mov r0, #0x1a
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0234D170
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D170:
	ldr r1, _0234D228 ; =ov29_023537E8
	b _0234D1C4
_0234D178:
	ldrb r0, [r5, #0x48]
	cmp r0, r2
	bne _0234D1C0
	ldrsh r4, [r1, #2]
	ldr r0, _0234D22C ; =0x000004B8
	cmp r4, r0
	bne _0234D1A8
	ldrsh r0, [r5, #2]
	cmp r0, #0x1f8
	cmpne r0, #0x51
	ldreq r4, _0234D230 ; =0x000004D3
	beq _0234D1E0
_0234D1A8:
	cmp r4, #0
	bne _0234D1E0
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D1C0:
	add r1, r1, #4
_0234D1C4:
	ldrb r2, [r1]
	cmp r2, #0xff
	bne _0234D178
	b _0234D1E0
_0234D1D4:
	ldrsh r0, [r5, #4]
	bl sub_02025784
	mov r4, r0
_0234D1E0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234D1E8: .word 0x000004B1
_0234D1EC: .word 0x000004B2
_0234D1F0: .word 0x000001B2
_0234D1F4: .word 0x000004CD
_0234D1F8: .word 0x000004CF
_0234D1FC: .word 0x000004D1
#ifdef JAPAN
_0234D204: .word DUNGEON_PTR
_0234E48C: .word 0x000004BC
_0234D200: .word 0x000004B3
#else
_0234D200: .word 0x000004B3
_0234D204: .word DUNGEON_PTR
#endif
_0234D208: .word 0x000004C4
_0234D20C: .word 0x000004C6
_0234D210: .word 0x000004C7
_0234D214: .word 0x000004C8
_0234D218: .word 0x000004C9
_0234D21C: .word 0x000004CA
_0234D220: .word 0x000004CB
_0234D224: .word 0x000004CC
_0234D228: .word ov29_023537E8
_0234D22C: .word 0x000004B8
_0234D230: .word 0x000004D3
	arm_func_end GetPersonalityIndex

	arm_func_start ov29_0234D234
ov29_0234D234: ; 0x0234D234
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrb ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl ov29_0234D5D0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234D234

	arm_func_start DisplayMessage
DisplayMessage: ; 0x0234D258
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #0
	str r3, [sp, #4]
	bl DisplayMessageInternal
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage

	arm_func_start DisplayMessage2
DisplayMessage2: ; 0x0234D2AC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #1
	str r3, [sp, #4]
	mov r3, #0
	bl DisplayMessageInternal
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage2

	arm_func_start ov29_0234D304
ov29_0234D304: ; 0x0234D304
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	ldr r4, _0234D454 ; =ov29_02353563
	mov r8, r0
	ldrb r0, [r4]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r0, #0
	beq _0234D334
	mov r0, #0xa
	bl ov29_0234BA54
_0234D334:
	bl ov29_0234D558
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D41C
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D3F8
	ldr r4, [r8, #0xb4]
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	beq _0234D3BC
	bl GetRandomExplorerMazeMonster
	cmp r0, #0
	moveq r1, #0
	beq _0234D38C
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_0234D38C:
	cmp r1, #0
	moveq r0, #0
	streq r0, [sp, #8]
	beq _0234D3D0
	ldr r1, [r0, #0xb4]
	ldr r0, _0234D458 ; =ov29_02353368
	ldrb r1, [r1, #0xbc]
	sub r1, r1, #0xb
	orr r1, r1, #0x90000
	str r1, [sp, #8]
	bl Debug_Print0
	b _0234D3D0
_0234D3BC:
	bl ov29_02337EE8
	mov r1, r0
	ldr r0, _0234D45C ; =ov29_02353380
	str r1, [sp, #8]
	bl Debug_Print0
_0234D3D0:
	ldrsh r0, [r4, #4]
	str r0, [sp, #0xc]
	bl ov29_0233804C
	str r0, [sp, #0x18]
	mov r0, r8
	bl ov29_0231ADA8
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #0xc]
	orr r0, r0, #0x30000
	str r0, [sp, #0x54]
_0234D3F8:
	add r3, sp, #8
	str r3, [sp]
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	str r3, [sp, #4]
	bl ov29_0234D5D0
	b _0234D440
_0234D41C:
	bl ov29_0234B034
	str r0, [sp]
	mov r4, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0
	str r4, [sp, #4]
	bl ov29_0234D5D0
_0234D440:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234D454: .word ov29_02353563
_0234D458: .word ov29_02353368
_0234D45C: .word ov29_02353380
	arm_func_end ov29_0234D304
