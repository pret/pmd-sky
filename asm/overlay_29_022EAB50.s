	.include "asm/macros.inc"
	.include "overlay_29_022EAB50.inc"

	.text

	arm_func_start CalcStatusDuration
CalcStatusDuration: ; 0x022EAB80
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrsh r0, [r1]
	ldrsh r1, [r1, #2]
	mov r6, r2
	bl DungeonRandRange
	mov r5, r0
	cmp r4, #0
	moveq r0, #0
	beq _022EABBC
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022EABBC:
	cmp r0, #0
	beq _022EAC24
	ldr r0, [r4]
	cmp r0, #1
	bne _022EAC24
	cmp r6, #0
	beq _022EAC24
	mov r0, r4
	mov r1, #0x12
	bl IqSkillIsEnabled
	cmp r0, #0
	cmpne r5, #0x7f
	beq _022EAC04
	mov r0, r5, lsl #8
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	bl RoundUpDiv256
	mov r5, r0
_022EAC04:
	mov r0, r4
	mov r1, #0x14
	bl AbilityIsActiveVeneer
	cmp r0, #0
	cmpne r5, #0x7f
	beq _022EAC24
	cmp r5, #5
	movge r5, #5
_022EAC24:
	cmp r5, #1
	movlt r5, #1
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end CalcStatusDuration

	arm_func_start DungeonRngUnsetSecondary
DungeonRngUnsetSecondary: ; 0x022EAC34
	ldr r0, _022EAC48 ; =DUNGEON_PRNG_STATE
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_022EAC48: .word DUNGEON_PRNG_STATE
	arm_func_end DungeonRngUnsetSecondary

	arm_func_start DungeonRngSetSecondary
DungeonRngSetSecondary: ; 0x022EAC4C
	ldr r1, _022EAC60 ; =DUNGEON_PRNG_STATE
	mov r2, #1
	strb r2, [r1]
	str r0, [r1, #0x10]
	bx lr
	.align 2, 0
_022EAC60: .word DUNGEON_PRNG_STATE
	arm_func_end DungeonRngSetSecondary

	arm_func_start DungeonRngSetPrimary
DungeonRngSetPrimary: ; 0x022EAC64
	ldr r0, _022EAC74 ; =DUNGEON_PRNG_STATE
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_022EAC74: .word DUNGEON_PRNG_STATE
	arm_func_end DungeonRngSetPrimary

	arm_func_start ov29_022EAC78
ov29_022EAC78: ; 0x022EAC78
	bx lr
	arm_func_end ov29_022EAC78

	arm_func_start ov29_022EAC7C
ov29_022EAC7C: ; 0x022EAC7C
	ldr ip, _022EAC88 ; =sub_02017C50
	mov r0, #1
	bx ip
	.align 2, 0
_022EAC88: .word sub_02017C50
	arm_func_end ov29_022EAC7C

	arm_func_start ov29_022EAC8C
ov29_022EAC8C: ; 0x022EAC8C
	ldr ip, _022EAC98 ; =sub_02017C50
	mov r0, #7
	bx ip
	.align 2, 0
_022EAC98: .word sub_02017C50
	arm_func_end ov29_022EAC8C

	arm_func_start ov29_022EAC9C
ov29_022EAC9C: ; 0x022EAC9C
	ldr ip, _022EACA8 ; =sub_02017C50
	mov r0, #0
	bx ip
	.align 2, 0
_022EACA8: .word sub_02017C50
	arm_func_end ov29_022EAC9C

	arm_func_start ov29_022EACAC
ov29_022EACAC: ; 0x022EACAC
	ldr ip, _022EACB8 ; =sub_02017C50
	mov r0, #5
	bx ip
	.align 2, 0
_022EACB8: .word sub_02017C50
	arm_func_end ov29_022EACAC

	arm_func_start ov29_022EACBC
ov29_022EACBC: ; 0x022EACBC
	ldr ip, _022EACC8 ; =sub_02017C50
	mov r0, #7
	bx ip
	.align 2, 0
_022EACC8: .word sub_02017C50
	arm_func_end ov29_022EACBC

	arm_func_start ov29_022EACCC
ov29_022EACCC: ; 0x022EACCC
	stmdb sp!, {r3, lr}
	cmp r0, #0x3f00
	ldmeqia sp!, {r3, pc}
	mov r1, #0x100
	bl sub_02017C74
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022EACCC

	arm_func_start ov29_022EACE4
ov29_022EACE4: ; 0x022EACE4
	stmdb sp!, {r3, lr}
	ldr r1, _022EACFC ; =0x000003E6
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_02017C50
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EACFC: .word 0x000003E6
	arm_func_end ov29_022EACE4

	arm_func_start MusicTableIdxToMusicId
MusicTableIdxToMusicId: ; 0x022EAD00
	stmdb sp!, {r4, lr}
	mov r1, #0xaa
	bl _s32_div_f
	ldr r0, _022EAD5C ; =MUSIC_ID_TABLE
	mov r1, r1, lsl #1
	ldrh r4, [r0, r1]
	tst r4, #0x8000
	ldreq r0, _022EAD60 ; =0x00007FFF
	andeq r0, r4, r0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	ldmeqia sp!, {r4, pc}
	mov r0, #4
	bl DungeonRandInt
	ldr r1, _022EAD60 ; =0x00007FFF
	mov r0, r0, lsl #0x10
	and r1, r4, r1
	ldr r3, _022EAD64 ; =RANDOM_MUSIC_ID_TABLE
	mov r1, r1, lsl #0x10
	mov r2, r0, asr #0xf
	add r0, r3, r1, lsr #13
	ldrh r0, [r2, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EAD5C: .word MUSIC_ID_TABLE
_022EAD60: .word 0x00007FFF
_022EAD64: .word RANDOM_MUSIC_ID_TABLE
	arm_func_end MusicTableIdxToMusicId

	arm_func_start ov29_022EAD68
ov29_022EAD68: ; 0x022EAD68
#ifdef JAPAN
#define OV29_022EAD68_OFFSET -0xA4
#else
#define OV29_022EAD68_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _022EADAC
	mov r6, #0
	ldr r5, _022EAE08 ; =0x00001410
	mov r4, #0x66
	b _022EADA4
_022EAD88:
	mov r0, r5
	bl sub_02017C68
	cmp r0, #0
	beq _022EADAC
	mov r0, r4
	bl AdvanceFrame
	add r6, r6, #1
_022EADA4:
	cmp r6, #0x1f4
	blt _022EAD88
_022EADAC:
	ldr r0, _022EAE0C ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _022EAE10 ; =FIXED_ROOM_PROPERTIES_TABLE
	add r0, r0, #0x4000
	ldrb r3, [r0, #0xda + OV29_022EAD68_OFFSET]
	smulbb r1, r3, r1
	ldr r1, [r2, r1]
	cmp r1, #0
	ldreqsh r1, [r0, #0xd6 + OV29_022EAD68_OFFSET]
	strneh r1, [r0, #0xd6 + OV29_022EAD68_OFFSET]
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	bl MusicTableIdxToMusicId
	mov r4, r0
	bl sub_02017B18
	cmp r0, #0
	mov r0, r4
	bne _022EAE00
	bl ChangeDungeonMusic
	ldmia sp!, {r4, r5, r6, pc}
_022EAE00:
	bl ov29_022EAE40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EAE08: .word 0x00001410
_022EAE0C: .word DUNGEON_PTR
_022EAE10: .word FIXED_ROOM_PROPERTIES_TABLE
	arm_func_end ov29_022EAD68

	arm_func_start ChangeDungeonMusic
ChangeDungeonMusic: ; 0x022EAE14
	ldr r3, _022EAE38 ; =DUNGEON_PTR
	ldr r1, _022EAE3C ; =0x0002CB06
	ldr ip, [r3]
	sub r2, r1, #6
	strh r0, [ip, r1]
	ldr r0, [r3]
	mov r1, #0
	strh r1, [r0, r2]
	bx lr
	.align 2, 0
_022EAE38: .word DUNGEON_PTR
#ifdef JAPAN
_022EAE3C: .word 0x0002CA62
#else
_022EAE3C: .word 0x0002CB06
#endif
	arm_func_end ChangeDungeonMusic

	arm_func_start ov29_022EAE40
ov29_022EAE40: ; 0x022EAE40
	stmdb sp!, {r4, lr}
	ldr lr, _022EAEA0 ; =DUNGEON_PTR
	ldr r2, _022EAEA4 ; =0x0002CB02
	ldr r4, [lr]
	ldr r1, _022EAEA8 ; =0x000003E7
	add r3, r2, #4
	strh r1, [r4, r2]
	ldr r4, [lr]
	add ip, r2, #2
	strh r0, [r4, r3]
	ldr r4, [lr]
	mov r3, #4
	strh r0, [r4, ip]
	ldr r0, [lr]
	sub r2, r2, #2
	add r0, r0, #0x2c000
#ifdef JAPAN
	str r3, [r0, #0xa54]
#else
	str r3, [r0, #0xaf8]
#endif
	ldr r0, [lr]
	mov r3, #0
	strh r3, [r0, r2]
	ldr r0, [lr]
	add r0, r0, #0x700
	strh r1, [r0, #0x96]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EAEA0: .word DUNGEON_PTR
#ifdef JAPAN
_022EAEA4: .word 0x0002CA5E
#else
_022EAEA4: .word 0x0002CB02
#endif
_022EAEA8: .word 0x000003E7
	arm_func_end ov29_022EAE40

	arm_func_start ov29_022EAEAC
ov29_022EAEAC: ; 0x022EAEAC
	stmdb sp!, {r3, lr}
	bl sub_02017ACC
	ldr r0, _022EAEE4 ; =0x0002CB02
	ldr r2, _022EAEE8 ; =DUNGEON_PTR
	ldr ip, _022EAEEC ; =0x000003E7
	ldr r3, [r2]
	add r1, r0, #2
	strh ip, [r3, r0]
	ldr r3, [r2]
	add r0, r0, #4
	strh ip, [r3, r1]
	ldr r1, [r2]
	strh ip, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_022EAEE4: .word 0x0002CA5E
#else
_022EAEE4: .word 0x0002CB02
#endif
_022EAEE8: .word DUNGEON_PTR
_022EAEEC: .word 0x000003E7
	arm_func_end ov29_022EAEAC

	arm_func_start ov29_022EAEF0
ov29_022EAEF0: ; 0x022EAEF0
	ldr ip, _022EAEF8 ; =sub_02017D80
	bx ip
	.align 2, 0
_022EAEF8: .word sub_02017D80
	arm_func_end ov29_022EAEF0

	arm_func_start ov29_022EAEFC
ov29_022EAEFC: ; 0x022EAEFC
	ldr r0, _022EAF1C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x792]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022EAF1C: .word DUNGEON_PTR
	arm_func_end ov29_022EAEFC

	arm_func_start ov29_022EAF20
ov29_022EAF20: ; 0x022EAF20
	ldr r0, _022EAF30 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x792]
	bx lr
	.align 2, 0
_022EAF30: .word DUNGEON_PTR
	arm_func_end ov29_022EAF20

	arm_func_start ov29_022EAF34
ov29_022EAF34: ; 0x022EAF34
	ldr r1, _022EAF44 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x792]
	bx lr
	.align 2, 0
_022EAF44: .word DUNGEON_PTR
	arm_func_end ov29_022EAF34

	arm_func_start ov29_022EAF48
ov29_022EAF48: ; 0x022EAF48
	stmdb sp!, {r4, lr}
	ldr ip, _022EAFA8 ; =DUNGEON_PTR
	mov r4, #0
	ldr r3, [ip]
	ldr lr, _022EAFAC ; =0x000003E7
#ifdef JAPAN
	add r2, r3, #0x254
	add r3, r3, #0x2c000
	str r4, [r3, #0xa54]
#else
	add r2, r3, #0x2f8
	add r3, r3, #0x2c000
	str r4, [r3, #0xaf8]
#endif
	add r3, r2, #0x2c800
	str r4, [r3, #4]
	ldr r2, [ip]
	cmp r1, #0
	add r1, r2, #0x700
	strh lr, [r1, #0x96]
	bne _022EAF8C
	cmp r0, lr
	bne _022EAFA0
_022EAF8C:
	ldr r0, _022EAFAC ; =0x000003E7
	strh r0, [r3, #0xa]
	strh r0, [r3, #0xc]
	strh r0, [r3, #0xe]
	ldmia sp!, {r4, pc}
_022EAFA0:
	bl ov29_022EAE40
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EAFA8: .word DUNGEON_PTR
_022EAFAC: .word 0x000003E7
	arm_func_end ov29_022EAF48

	arm_func_start ov29_022EAFB0
ov29_022EAFB0: ; 0x022EAFB0
	stmdb sp!, {r4, lr}
	ldr r0, _022EB168 ; =DUNGEON_PTR
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	add r0, r3, #0x700
	ldrh r0, [r0, #0x96]
	ldr r2, _022EB16C ; =0x000003E7
#ifdef JAPAN
	add r1, r3, #0x254
#else
	add r1, r3, #0x2f8
#endif
	cmp r0, r2
	add r4, r1, #0x2c800
	bne _022EB034
	ldrb r1, [r3, #0x792]
	cmp r1, #0
	beq _022EB004
	ldr r0, _022EB170 ; =ov29_023516E8
	ldr r0, [r0, r1, lsl #2]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl MusicTableIdxToMusicId
	b _022EB034
_022EB004:
	ldrb r0, [r3, #0x791]
	cmp r0, #0
	movne r0, #0xd
	bne _022EB034
	ldrb r0, [r3, #0x794]
	cmp r0, #0
	movne r0, #0xb
	bne _022EB034
	ldrb r0, [r3, #0x7c9]
	cmp r0, #0
	movne r0, #0xc
	ldreqh r0, [r4, #0xe]
_022EB034:
	ldr r1, [r4]
	cmp r1, #4
	bne _022EB058
	ldrh r1, [r4, #0xc]
	cmp r0, r1
	movne r1, #2
	strne r1, [r4]
	strneh r0, [r4, #0xa]
	b _022EB078
_022EB058:
	ldr r1, _022EB16C ; =0x000003E7
	cmp r0, r1
	beq _022EB078
	ldrh r2, [r4, #0xa]
	cmp r2, r1
	moveq r1, #1
	streq r1, [r4]
	streqh r0, [r4, #0xa]
_022EB078:
	ldr r0, [r4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_022EB088: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	b _022EB09C ; case 1
	b _022EB108 ; case 2
	b _022EB124 ; case 3
	ldmia sp!, {r4, pc} ; case 4
_022EB09C:
	ldrh r2, [r4, #0xa]
	ldr r0, _022EB16C ; =0x000003E7
	cmp r2, r0
	moveq r0, #0
	streq r0, [r4]
	beq _022EB0FC
	tst r2, #0x8000
	ldr r0, _022EB174 ; =0x00007FFF
	beq _022EB0D4
	and r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl PlayBgmByIdVeneer
	b _022EB0EC
_022EB0D4:
	and r0, r2, r0
	mov r0, r0, lsl #0x10
	ldrh r1, [r4, #8]
	mov r0, r0, lsr #0x10
	mov r2, #0x100
	bl PlayBgmByIdVolumeVeneer
_022EB0EC:
	ldrh r1, [r4, #0xa]
	mov r0, #4
	strh r1, [r4, #0xc]
	str r0, [r4]
_022EB0FC:
	ldr r0, _022EB16C ; =0x000003E7
	strh r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
_022EB108:
	mov r0, #0x1e
	bl sub_02017B7C
	mov r0, #0x1e
	str r0, [r4, #4]
	mov r0, #3
	str r0, [r4]
	ldmia sp!, {r4, pc}
_022EB124:
	ldr r0, [r4, #4]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r4, #4]
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xa]
	ldr r0, _022EB16C ; =0x000003E7
	cmp r1, r0
	movne r0, #1
	strne r0, [r4]
	ldmneia sp!, {r4, pc}
	bl sub_02017B70
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EB168: .word DUNGEON_PTR
_022EB16C: .word 0x000003E7
_022EB170: .word ov29_023516E8
_022EB174: .word 0x00007FFF
	arm_func_end ov29_022EAFB0

	arm_func_start TrySwitchPlace
TrySwitchPlace: ; 0x022EB178
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r1, #0xe
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022EB1BC
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _022EB2C4 ; =0x00000B76
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EB2BC
_022EB1BC:
	cmp r5, r4
	beq _022EB204
	cmp r5, #0
	moveq r0, #0
	beq _022EB1E4
	ldr r0, [r5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_022EB1E4:
	cmp r0, #0
	beq _022EB204
	mov r0, r5
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _022EB210
_022EB204:
	mov r0, r4
	mov r1, #0xe
	bl AbilityIsActiveVeneer
_022EB210:
	cmp r0, #0
	beq _022EB23C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _022EB2C4 ; =0x00000B76
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EB2BC
_022EB23C:
	ldrsh r1, [r5, #4]
	add r0, sp, #4
	strh r1, [sp, #4]
	ldrsh r1, [r5, #6]
	strh r1, [sp, #6]
	ldrsh r1, [r4, #4]
	strh r1, [sp]
	ldrsh r1, [r4, #6]
	strh r1, [sp, #2]
	bl ov29_022E555C
	add r0, sp, #0
	bl ov29_022E555C
	ldrsh r1, [sp]
	ldrsh r2, [sp, #2]
	mov r0, r5
	mov r3, #1
	bl MoveMonsterToPos
	ldrsh r1, [sp, #4]
	ldrsh r2, [sp, #6]
	mov r0, r4
	mov r3, #1
	bl MoveMonsterToPos
	mov r0, r5
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, r4
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, r5
	bl ov29_02321260
	mov r0, r4
	bl ov29_02321260
_022EB2BC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_022EB2C4: .word 0x00000887
#else
_022EB2C4: .word 0x00000B76
#endif
	arm_func_end TrySwitchPlace

	arm_func_start ov29_022EB2C8
ov29_022EB2C8: ; 0x022EB2C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r0, _022EB360 ; =ov29_0237C91C
	mov r2, r5, lsl #3
	ldrh r6, [r0, r2]
	mov r4, r1
	cmp r6, #0x26
	bne _022EB2F8
	bl GetFloorType
	cmp r0, #2
	ldreq r0, _022EB364 ; =0x000009C9
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022EB2F8:
#ifdef JAPAN
	add r0, r6, #0x57
	add r0, r0, #0x2300
#else
	add r0, r6, #0x87
	add r0, r0, #0x900
#endif
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r0, r7
	bl StringFromId
	ldr r1, _022EB368 ; =ov29_02352070
	bl strcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _022EB34C
	ldr r0, _022EB36C ; =ov29_0237C91E
	mov r1, r5, lsl #3
	ldrsh r0, [r0, r1]
	bl sub_0200D208
	ldr r1, _022EB370 ; =ov29_02352032
	mov r0, r0, lsl #2
	ldrh r0, [r1, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022EB34C:
	cmp r4, #1
	cmpeq r6, #0x1a
	ldreq r0, _022EB374 ; =0x000009CA
	movne r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022EB360: .word ov29_0237C91C
#ifdef JAPAN
_022EB364: .word 0x00002399
#else
_022EB364: .word 0x000009C9
#endif
_022EB368: .word ov29_02352070
_022EB36C: .word ov29_0237C91E
_022EB370: .word ov29_02352032
#ifdef JAPAN
_022EB374: .word 0x0000239A
#else
_022EB374: .word 0x000009CA
#endif
	arm_func_end ov29_022EB2C8

	arm_func_start ov29_022EB378
ov29_022EB378: ; 0x022EB378
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #4]
	bl sub_0200D208
	ldr r1, _022EB394 ; =ov29_02352030
	mov r0, r0, lsl #2
	ldrh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB394: .word ov29_02352030
	arm_func_end ov29_022EB378

	arm_func_start ov29_022EB398
ov29_022EB398: ; 0x022EB398
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeaderMonster
	mov r1, #0
	strh r1, [r0, #0x4a]
	cmp r4, #0
	strneb r1, [r0, #0x4e]
	strneb r1, [r0, #0x54]
	subne r1, r1, #1
	strneh r1, [r0, #0x5a]
	strneh r1, [r0, #0x5c]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022EB398

	arm_func_start SetLeaderActionFields
SetLeaderActionFields: ; 0x022EB3C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeaderMonster
	mov r1, #0
	strh r4, [r0, #0x4a]
	strb r1, [r0, #0x4e]
	strb r1, [r0, #0x54]
	sub r1, r1, #1
	strh r1, [r0, #0x5a]
	strh r1, [r0, #0x5c]
	ldmia sp!, {r4, pc}
	arm_func_end SetLeaderActionFields
