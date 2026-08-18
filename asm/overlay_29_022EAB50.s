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

	arm_func_start PlayLevelUpSound
PlayLevelUpSound: ; 0x022EAC7C
	ldr ip, _022EAC88 ; =sub_02017C50
	mov r0, #1
	bx ip
	.align 2, 0
_022EAC88: .word sub_02017C50
	arm_func_end PlayLevelUpSound

	arm_func_start PlayDungeonTipSound__022EB63C
PlayDungeonTipSound__022EB63C: ; 0x022EAC8C
	ldr ip, _022EAC98 ; =sub_02017C50
	mov r0, #7
	bx ip
	.align 2, 0
_022EAC98: .word sub_02017C50
	arm_func_end PlayDungeonTipSound__022EB63C

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

	arm_func_start PlayDungeonTipSound__022EB66C
PlayDungeonTipSound__022EB66C: ; 0x022EACBC
	ldr ip, _022EACC8 ; =sub_02017C50
	mov r0, #7
	bx ip
	.align 2, 0
_022EACC8: .word sub_02017C50
	arm_func_end PlayDungeonTipSound__022EB66C

	arm_func_start PlaySeByIdIfNotSilence
PlaySeByIdIfNotSilence: ; 0x022EACCC
	stmdb sp!, {r3, lr}
	cmp r0, #0x3f00
	ldmeqia sp!, {r3, pc}
	mov r1, #0x100
	bl sub_02017C74
	ldmia sp!, {r3, pc}
	arm_func_end PlaySeByIdIfNotSilence

	arm_func_start PlayMeByIdIfNot998
PlayMeByIdIfNot998: ; 0x022EACE4
	stmdb sp!, {r3, lr}
	ldr r1, _022EACFC ; =0x000003E6
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_02017C50
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EACFC: .word 0x000003E6
	arm_func_end PlayMeByIdIfNot998

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
