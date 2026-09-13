	.include "asm/macros.inc"
	.include "overlay_29_022EAD68.inc"

	.text

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
