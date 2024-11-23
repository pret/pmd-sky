	.include "asm/macros.inc"
	.include "overlay_29_0231F594.inc"

	.text

	arm_func_start TryDrought
TryDrought: ; 0x0231F594
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0231F6D4 ; =DUNGEON_PTR
	mov r8, r0
	ldr r0, [r1]
	mov r6, #0
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreOrbsAllowedVeneer
	cmp r0, #0
	bne _0231F5CC
	ldr r1, _0231F6D8 ; =0x00000C08
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231F5CC:
	bl IsWaterTileset
	cmp r0, #0
	beq _0231F5E8
	ldr r1, _0231F6DC ; =0x00000C09
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231F5E8:
	mov r7, r6
	mov sb, #1
	mov r4, r6
_0231F5F4:
	mov r5, r4
_0231F5F8:
	mov r0, r5
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #2
	bne _0231F63C
	ldrh r2, [r0]
	mov r1, r7
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl ov29_02336694
	mov r6, sb
_0231F63C:
	add r5, r5, #1
	cmp r5, #0x38
	blt _0231F5F8
	add r7, r7, #1
	cmp r7, #0x20
	blt _0231F5F4
	mov r5, #0
	mov r4, r5
_0231F65C:
	mov r7, r4
_0231F660:
	mov r0, r7
	mov r1, r5
	bl DetermineTileWalkableNeighbors
	add r7, r7, #1
	cmp r7, #0x38
	blt _0231F660
	add r5, r5, #1
	cmp r5, #0x20
	blt _0231F65C
	cmp r6, #0
	beq _0231F6A8
	mov r0, r8
	mov r1, #0x210
	bl ov29_022E56A0
	ldr r1, _0231F6E0 ; =0x00000C07
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _0231F6B4
_0231F6A8:
	ldr r1, _0231F6D8 ; =0x00000C08
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
_0231F6B4:
	ldr r0, _0231F6D4 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x78f]
	bl DetermineAllMonsterShadow
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231F6D4: .word DUNGEON_PTR
#ifdef JAPAN
_0231F6D8: .word 0x00000947
_0231F6DC: .word 0x00000948
_0231F6E0: .word 0x00000946
#else
_0231F6D8: .word 0x00000C08
_0231F6DC: .word 0x00000C09
_0231F6E0: .word 0x00000C07
#endif
	arm_func_end TryDrought

	arm_func_start ov29_0231F6E4
ov29_0231F6E4: ; 0x0231F6E4
#ifdef JAPAN
#define OV29_0231F6E4_OFFSET -0xA4
#else
#define OV29_0231F6E4_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r1, _0231FBE4 ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r1]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + OV29_0231F6E4_OFFSET]
	bl AreTrawlOrbsAllowed
	cmp r0, #0
	bne _0231F71C
#ifdef JAPAN
	ldr r1, _02321094 ; =0x0000090F
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xbd0
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _0231FBDC
_0231F71C:
	ldr r0, _0231FBE8 ; =0x000013BC
	mov r2, #0
	mov r1, #0xf
	str r2, [sp, #0xc]
	bl MemAlloc
	mov r4, r0
	mov r6, #0
	add r0, r4, #0x1f8
	mov r5, r4
	mov r8, r6
	add fp, r0, #0x1000
	b _0231F86C
_0231F74C:
	add r0, r1, r8, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xbc8 + OV29_0231F6E4_OFFSET]
	mov r0, r7
	bl EntityIsValid__0231FBFC
	cmp r0, #0
	beq _0231F868
	cmp r6, #0x19
	bge _0231F884
	ldrsh sb, [r7, #4]
	ldrsh r0, [sl, #4]
	sub r0, sb, r0
	bl abs
	cmp r0, #2
	bgt _0231F7A0
	ldrsh r1, [r7, #6]
	ldrsh r0, [sl, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #2
	ble _0231F868
_0231F7A0:
	mov r0, sb
	ldrsh r1, [r7, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	beq _0231F868
	mov r0, #3
	str r0, [r5]
	mov r0, #6
	mul sb, r6, r0
	add r0, fp, sb
	str r0, [r5, #0xb4]
	ldrh r1, [r7, #4]
	mov r0, r5
	strh r1, [r5, #4]
	ldrh r1, [r7, #6]
	strh r1, [r5, #6]
	ldrsh r2, [r7, #4]
	mov r1, #0x18
	ldrsh r3, [r7, #6]
	smulbb r1, r2, r1
	mov r2, #0x18
	smulbb r2, r3, r2
	add r1, r1, #4
	add r2, r2, #4
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r1, #0
	strh r1, [r5, #0x26]
	mov r1, #1
	strb r1, [r5, #0x20]
	mov r1, #0
	strb r1, [r5, #0x22]
	str r1, [r5, #0x1c]
	ldr r1, _0231FBE4 ; =DUNGEON_PTR
	add r0, r4, sb
	ldr r2, [r1]
	mov r1, #6
	mla r1, r8, r1, r2
#ifdef JAPAN
	add r1, r1, #0x3d00
	ldrh r2, [r1, #0x9c]
#else
	add r1, r1, #0x3e00
	ldrh r2, [r1, #0x40]
#endif
	add r0, r0, #0x1100
	add r5, r5, #0xb8
	strh r2, [r0, #0xf8]
#ifdef JAPAN
	ldrh r2, [r1, #0x9e]
	add r6, r6, #1
	strh r2, [r0, #0xfa]
	ldrh r1, [r1, #0xa0]
#else
	ldrh r2, [r1, #0x42]
	add r6, r6, #1
	strh r2, [r0, #0xfa]
	ldrh r1, [r1, #0x44]
#endif
	strh r1, [r0, #0xfc]
_0231F868:
	add r8, r8, #1
_0231F86C:
	ldr r0, _0231FBE4 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x3f00
	ldrsh r0, [r0, #0xc0 + OV29_0231F6E4_OFFSET]
	cmp r8, r0
	blt _0231F74C
_0231F884:
	cmp r6, #0
	bne _0231F89C
	ldr r1, _0231FBEC ; =0x00000BCF
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _0231FBD4
_0231F89C:
	mov r1, #0
	mov sb, r1
	add r0, sp, #0x18
_0231F8A8:
	strb sb, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x1e
	blt _0231F8A8
	b _0231F9A8
_0231F8BC:
	ldrsh r1, [sl, #4]
	ldrsh r0, [sl, #6]
	mov r7, #0
	ldr r5, _0231FBF0 ; =DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	mov r8, r7
	strh r1, [sp, #0x14]
	strh r0, [sp, #0x16]
	add fp, sp, #0x18
_0231F8DC:
	cmp r8, #0x1e
	bge _0231F978
	mov r2, r8, lsl #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x63
	beq _0231F978
	ldrb r1, [fp, r8]
	cmp r1, #0
	bne _0231F970
	add r1, r5, r2
	ldrsh r3, [sl, #4]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, #2]
	add r0, r3, r0
	strh r0, [sp, #0x14]
	add r0, r2, r1
	strh r0, [sp, #0x16]
	ldrsh r0, [sp, #0x14]
	ldrsh r1, [sp, #0x16]
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _0231F970
	tst r2, #0x200
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	bne _0231F970
	ldrh r2, [sp, #0x14]
	add r0, r4, sb, lsl #2
	add r0, r0, #0x1200
	ldrh r1, [sp, #0x16]
	strh r2, [r0, #0x8e]
	mov r7, #1
	strh r1, [r0, #0x90]
	strb r7, [fp, r8]
	b _0231F978
_0231F970:
	add r8, r8, #1
	b _0231F8DC
_0231F978:
	cmp r7, #0
	bne _0231F9A4
	mov r0, #0xb8
	mul r2, sb, r0
	add r1, r4, sb, lsl #2
	mov r3, #0
	str r3, [r4, r2]
	sub r2, r0, #0xb9
	add r0, r1, #0x1200
	strh r2, [r0, #0x8e]
	strh r2, [r0, #0x90]
_0231F9A4:
	add sb, sb, #1
_0231F9A8:
	cmp sb, r6
	blt _0231F8BC
	mov fp, #0x18
	mov sb, #0
	mov r5, fp
	mov r7, #0xb8
	b _0231FA58
_0231F9C4:
	mla r0, sb, r7, r4
	bl EntityIsValid__0231FBFC
	cmp r0, #0
	beq _0231FA54
	mov r0, #0xb8
	mla r8, sb, r0, r4
	mov r1, #1
	add r0, r8, #4
	bl RemoveGroundItem
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl DrawMinimapTile
	add r0, r4, sb, lsl #2
	add r0, r0, #0x1200
	ldrsh r2, [r0, #0x8e]
	ldr r0, [r8, #0xc]
	mov r1, #0x3c
	smulbb r2, r2, fp
	add r2, r2, #4
	rsb r0, r0, r2, lsl #8
	bl _s32_div_f
	add r1, r4, sb, lsl #3
	add r1, r1, #0x1000
	str r0, [r1, #0x2f4]
	add r0, r4, sb, lsl #2
	add r0, r0, #0x1200
	ldrsh r0, [r0, #0x90]
	ldr r2, [r8, #0x10]
	mov r1, #0x3c
	smulbb r0, r0, r5
	add r0, r0, #4
	rsb r0, r2, r0, lsl #8
	bl _s32_div_f
	add r1, r4, sb, lsl #3
	add r1, r1, #0x1000
	str r0, [r1, #0x2f8]
_0231FA54:
	add sb, sb, #1
_0231FA58:
	cmp sb, r6
	blt _0231F9C4
	ldr r1, _0231FBF4 ; =0x00000222
	mov r0, sl
	bl ov29_022E56A0
	ldr r0, _0231FBE4 ; =DUNGEON_PTR
	mov r7, #0
	ldr r0, [r0]
	mov r8, r7
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x245 + OV29_0231F6E4_OFFSET]
	mov r5, r7
	str r0, [sp, #8]
_0231FA8C:
	and r0, r7, #0xff
	mov sb, #0
	str r0, [sp, #0x10]
	b _0231FB0C
_0231FA9C:
	mov r0, #0xb8
	mul fp, sb, r0
	add r0, r4, fp
	bl EntityIsValid__0231FBFC
	cmp r0, #0
	beq _0231FB08
	mov r0, #0xb8
	mla r0, sb, r0, r4
	add r1, r4, sb, lsl #3
	add r2, r1, #0x1000
	ldr r1, [r2, #0x2f4]
	ldr r2, [r2, #0x2f8]
	str r0, [sp, #4]
	bl IncrementEntityPixelPosXY
	mov r0, r8
	bl sub_020018D0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x10]
	str r1, [r0, #0x1c]
	mov r1, #0
	str r1, [sp]
	ldr r1, [sp, #8]
	add r0, r4, fp
	mov r2, #0
	bl ov29_023457C8
_0231FB08:
	add sb, sb, #1
_0231FB0C:
	cmp sb, r6
	blt _0231FA9C
	mov r0, #0x13
	bl AdvanceFrame
	tst r5, #3
	addeq r7, r7, #1
	add r5, r5, #1
	add r8, r8, #0x22
	cmp r5, #0x3c
	and r7, r7, #7
	blt _0231FA8C
	add r0, r4, #0x8e
	mov fp, #1
	mov sb, #0
	add r8, r0, #0x1200
	mov r7, fp
	mov r5, #0xb8
	b _0231FB9C
_0231FB54:
	add r0, r4, sb, lsl #2
	add r0, r0, #0x1200
	ldrsh r0, [r0, #0x8e]
	cmp r0, #0
	blt _0231FB98
	mla r0, sb, r5, r4
	bl GetItemInfo
	mov r1, r0
	mov r2, fp
	add r0, r8, sb, lsl #2
	bl SpawnItem
	add r0, r4, sb, lsl #2
	add r1, r0, #0x1200
	ldrsh r0, [r1, #0x8e]
	ldrsh r1, [r1, #0x90]
	bl DrawMinimapTile
	str r7, [sp, #0xc]
_0231FB98:
	add sb, sb, #1
_0231FB9C:
	cmp sb, r6
	blt _0231FB54
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0231FBC0
#ifdef JAPAN
	mov r0, sl
	mov r1, #0x910
#else
	ldr r1, _0231FBF8 ; =0x00000BD1
	mov r0, sl
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _0231FBCC
_0231FBC0:
	ldr r1, _0231FBEC ; =0x00000BCF
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_0231FBCC:
	mov r0, #1
	bl ov29_022F62CC
_0231FBD4:
	mov r0, r4
	bl MemFree
_0231FBDC:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231FBE4: .word DUNGEON_PTR
#ifdef JAPAN
_02321094: .word 0x0000090F
_0231FBE8: .word 0x000013BC
_0231FBEC: .word 0x0000090E
#else
_0231FBE8: .word 0x000013BC
_0231FBEC: .word 0x00000BCF
#endif
_0231FBF0: .word DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
_0231FBF4: .word 0x00000222
#ifndef JAPAN
_0231FBF8: .word 0x00000BD1
#endif
	arm_func_end ov29_0231F6E4
