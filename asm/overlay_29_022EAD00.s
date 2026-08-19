	.include "asm/macros.inc"
	.include "overlay_29_022EAD00.inc"

	.text

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
