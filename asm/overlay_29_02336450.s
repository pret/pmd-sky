	.include "asm/macros.inc"
	.include "overlay_29_02336450.inc"

	.text

	arm_func_start GetDefaultTileTextureId
GetDefaultTileTextureId: ; 0x02336450
	ldr r0, _0233645C ; =DEFAULT_TILE
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0233645C: .word DEFAULT_TILE
	arm_func_end GetDefaultTileTextureId

	arm_func_start ov29_02336460
ov29_02336460: ; 0x02336460
#ifdef JAPAN
#define OV29_02336460_OFFSET -0xA4
#else
#define OV29_02336460_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	ldr r1, _02336598 ; =DUNGEON_PTR
	ldr r0, _0233659C ; =ov29_0237CAAC
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x4000
	ldrsh r4, [r1, #0xd4 + OV29_02336460_OFFSET]
	mov r1, r4
	bl ov10_022C25EC
	ldr r1, _023365A0 ; =ov29_0237CAA0
	mov r0, #0
	ldr ip, [r1, #0x14]
	ldr r3, _023365A4 ; =DEFAULT_TILE
	mov r2, r0
	mov r1, #1
	str ip, [r3, #4]
	bl GetBgRegionArea
	mov r1, r4
	mov r2, #0
	bl ov10_022C2588
	ldr r0, _02336598 ; =DUNGEON_PTR
	mov r1, r4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x2a8 + OV29_02336460_OFFSET
	add r0, r0, #0x10000
	bl InitTilesetBuffer
#ifdef JAPAN
	ldr r0, _02336598 ; =DUNGEON_PTR
	mov r1, r4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0xbe
	add r0, r0, #0x12000
#else
	ldr r1, _02336598 ; =DUNGEON_PTR
	ldr r0, _023365A8 ; =0x00012162
	ldr r2, [r1]
	mov r1, r4
	add r0, r2, r0
	mov r2, #0
#endif
	bl ov10_022C2720
	mov r0, #0
	mov r1, r0
	bl ov29_022E9F80
	ldr r0, _023365AC ; =ov29_0237CAA0
	mov r1, r4
	mov r2, #0
	bl ov10_022C2654
	ldr r0, _023365A0 ; =ov29_0237CAA0
	mov r1, #0x20
	ldr r0, [r0, #8]
	bl ov29_022DE0EC
	ldr r1, _023365B0 ; =MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE
	mov r4, #0
	mov r3, #1
	strb r4, [r1]
	strb r3, [r1, #1]
	mov r0, #2
	strb r0, [r1, #2]
	mov r0, #3
	strb r0, [r1, #3]
	ldr r0, _02336598 ; =DUNGEON_PTR
	ldr r2, _023365B4 ; =SECONDARY_TERRAIN_TYPES
	ldr ip, [r0]
	add r0, ip, #0x4000
	ldrsh r0, [r0, #0xd4 + OV29_02336460_OFFSET]
	ldrb r0, [r2, r0]
	cmp r0, #1
	streqb r3, [r1, #4]
	streqb r4, [r1, #5]
	strneb r4, [r1, #4]
	strneb r3, [r1, #5]
	add r0, ip, #0x4000
	ldrsh r0, [r0, #0xd4 + OV29_02336460_OFFSET]
	sub r0, r0, #0x1a
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldrls r0, _023365B0 ; =MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE
	movls r1, #0
	strlsb r1, [r0, #4]
	strlsb r1, [r0, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02336598: .word DUNGEON_PTR
_0233659C: .word ov29_0237CAAC
_023365A0: .word ov29_0237CAA0
_023365A4: .word DEFAULT_TILE
#ifndef JAPAN
_023365A8: .word 0x00012162
#endif
_023365AC: .word ov29_0237CAA0
_023365B0: .word MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE
_023365B4: .word SECONDARY_TERRAIN_TYPES
	arm_func_end ov29_02336460

	arm_func_start ov29_023365B8
ov29_023365B8: ; 0x023365B8
	stmdb sp!, {r3, lr}
	ldr r0, _023365DC ; =ov29_0237CAAC
	bl ov10_022C2638
	ldr r0, _023365E0 ; =ov29_0237CAA0
	bl ov10_022C26A0
	ldr r0, _023365E4 ; =DEFAULT_TILE
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023365DC: .word ov29_0237CAAC
_023365E0: .word ov29_0237CAA0
_023365E4: .word DEFAULT_TILE
	arm_func_end ov29_023365B8

	arm_func_start ov29_023365E8
ov29_023365E8: ; 0x023365E8
	stmdb sp!, {r3, lr}
	ldr r0, _02336648 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	sub r1, r0, #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	ldrls r1, _0233664C ; =ov29_02352B60
	ldrls r0, _02336650 ; =DEFAULT_TILE
	strls r1, [r0]
	ldmlsia sp!, {r3, pc}
	bl FloorSecondaryTerrainIsChasm
	cmp r0, #0
	ldrne r1, _02336654 ; =ov29_02352B88
	ldrne r0, _02336650 ; =DEFAULT_TILE
	strne r1, [r0]
	ldreq r1, _02336658 ; =ov29_02352B74
	ldreq r0, _02336650 ; =DEFAULT_TILE
	streq r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02336648: .word DUNGEON_PTR
_0233664C: .word ov29_02352B60
_02336650: .word DEFAULT_TILE
_02336654: .word ov29_02352B88
_02336658: .word ov29_02352B74
	arm_func_end ov29_023365E8

	arm_func_start ov29_0233665C
ov29_0233665C: ; 0x0233665C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02336668:
	mov r5, r4
_0233666C:
	mov r0, r5
	mov r1, r6
	bl ov29_02336694
	add r5, r5, #1
	cmp r5, #0x38
	blt _0233666C
	add r6, r6, #1
	cmp r6, #0x20
	blt _02336668
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0233665C

	arm_func_start ov29_02336694
ov29_02336694: ; 0x02336694
#ifdef JAPAN
#define OV29_02336694_OFFSET -0xA4
#else
#define OV29_02336694_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	movs sb, r0
	mov r8, r1
	bmi _023369E8
	cmp r8, #0
	blt _023369E8
	cmp sb, #0x38
	cmplt r8, #0x20
	bge _023369E8
	bl GetTile
	ldr r1, _023369F0 ; =DUNGEON_PTR
	ldrh r2, [r0]
	ldr r4, [r1]
	add r0, r4, #0x4000
	ldrsh r1, [r0, #0xd4 + OV29_02336694_OFFSET]
	and r0, r2, #3
	str r0, [sp, #4]
	cmp r1, #0xaa
	blt _02336728
	cmp sb, #0x20
	cmplt r8, #0x20
	mov r0, sb
	bge _02336714
	mov r1, r8
	bl GetTileSafe
#ifdef JAPAN
	add r1, r4, r8, lsl #6
	add r1, r1, sb, lsl #1
	add r1, r1, #0x12000
	ldrh r1, [r1, #0xbe]
#else
	add r2, r4, r8, lsl #6
	ldr r1, _023369F4 ; =0x00012162
	add r2, r2, sb, lsl #1
	ldrh r1, [r2, r1]
#endif
	strh r1, [r0, #4]
	b _023369E8
_02336714:
	mov r1, r8
	bl GetTileSafe
	mov r1, #0
	strh r1, [r0, #4]
	b _023369E8
_02336728:
	mov r0, sb
	add r1, r8, #1
	bl GetTile
	ldrh r2, [r0]
	add r0, sb, #1
	add r1, r8, #1
	and sl, r2, #3
	bl GetTile
	ldrh r2, [r0]
	mov r1, r8
	add r0, sb, #1
	and r2, r2, #3
	str r2, [sp]
	bl GetTile
	ldrh r2, [r0]
	add r0, sb, #1
	sub r1, r8, #1
	and fp, r2, #3
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	sub r1, r8, #1
	and r4, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	sub r1, r8, #1
	and r5, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	mov r1, r8
	and r6, r2, #3
	bl GetTile
	ldrh r2, [r0]
	sub r0, sb, #1
	add r1, r8, #1
	and r7, r2, #3
	bl GetTile
	ldrh r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, #1
	and r0, r1, #3
	bne _02336828
	cmp sl, #0
	mov sl, #0xff
	ldr r1, [sp]
	biceq sl, sl, #1
	cmp r1, #0
	biceq sl, sl, #2
	cmp fp, #0
	biceq sl, sl, #4
	cmp r4, #0
	biceq sl, sl, #8
	cmp r5, #0
	biceq sl, sl, #0x10
	cmp r6, #0
	biceq sl, sl, #0x20
	cmp r7, #0
	biceq sl, sl, #0x40
	cmp r0, #0
	biceq sl, sl, #0x80
	orr sl, sl, #0x200
	b _0233699C
_02336828:
	ldr r1, [sp, #4]
	cmp r1, #2
	bne _02336884
	cmp sl, #2
	mov sl, #0xff
	ldr r1, [sp]
	bicne sl, sl, #1
	cmp r1, #2
	bicne sl, sl, #2
	cmp fp, #2
	bicne sl, sl, #4
	cmp r4, #2
	bicne sl, sl, #8
	cmp r5, #2
	bicne sl, sl, #0x10
	cmp r6, #2
	bicne sl, sl, #0x20
	cmp r7, #2
	bicne sl, sl, #0x40
	cmp r0, #2
	bicne sl, sl, #0x80
	orr sl, sl, #0x100
	b _0233699C
_02336884:
	cmp r1, #3
	bne _02336954
	ldr r1, _023369F0 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd4 + OV29_02336694_OFFSET]
	sub r1, r1, #0x1a
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _02336904
	cmp sl, #3
	mov sl, #0
	ldr r1, [sp]
	orreq sl, sl, #1
	cmp r1, #3
	orreq sl, sl, #2
	cmp fp, #3
	orreq sl, sl, #4
	cmp r4, #3
	orreq sl, sl, #8
	cmp r5, #3
	orreq sl, sl, #0x10
	cmp r6, #3
	orreq sl, sl, #0x20
	cmp r7, #3
	orreq sl, sl, #0x40
	cmp r0, #3
	orreq sl, sl, #0x80
	b _0233699C
_02336904:
	cmp sl, #3
	mov sl, #0xff
	ldr r1, [sp]
	bicne sl, sl, #1
	cmp r1, #3
	bicne sl, sl, #2
	cmp fp, #3
	bicne sl, sl, #4
	cmp r4, #3
	bicne sl, sl, #8
	cmp r5, #3
	bicne sl, sl, #0x10
	cmp r6, #3
	bicne sl, sl, #0x20
	cmp r7, #3
	bicne sl, sl, #0x40
	cmp r0, #3
	bicne sl, sl, #0x80
	orr sl, sl, #0x100
	b _0233699C
_02336954:
	cmp sl, #0
	mov sl, #0
	ldr r1, [sp]
	orreq sl, sl, #1
	cmp r1, #0
	orreq sl, sl, #2
	cmp fp, #0
	orreq sl, sl, #4
	cmp r4, #0
	orreq sl, sl, #8
	cmp r5, #0
	orreq sl, sl, #0x10
	cmp r6, #0
	orreq sl, sl, #0x20
	cmp r7, #0
	orreq sl, sl, #0x40
	cmp r0, #0
	orreq sl, sl, #0x80
_0233699C:
	mov r0, #4
	bl RandIntSafe
	mov r4, r0
	cmp r4, #3
	moveq r4, #0
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	mov r0, sb
	mov r1, r8
	movne r4, #0
	bl GetTileSafe
	ldr r1, _023369F0 ; =DUNGEON_PTR
	add r2, sl, sl, lsl #1
	ldr r1, [r1]
	add r1, r1, r2
	add r1, r1, r4
	add r1, r1, #0x12000
	ldrb r1, [r1, #0x162 + OV29_02336694_OFFSET]
	strh r1, [r0, #4]
_023369E8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023369F0: .word DUNGEON_PTR
#ifndef JAPAN
_023369F4: .word 0x00012162
#endif
	arm_func_end ov29_02336694

	arm_func_start ov29_023369F8
ov29_023369F8: ; 0x023369F8
#ifdef JAPAN
#define OV29_023369F8_OFFSET -0xA4
#else
#define OV29_023369F8_OFFSET 0
#endif
	ldr r1, _02336A48 ; =DUNGEON_PTR
	mov ip, #0
	mvn r3, #0
	mov r2, #0xff
_02336A08:
	ldr r0, [r1]
	add r0, r0, ip, lsl #2
	add r0, r0, #0xcc00
	strh r3, [r0, #0xec + OV29_023369F8_OFFSET]
	ldr r0, [r1]
	add r0, r0, ip, lsl #2
	add r0, r0, #0xcc00
	strh r3, [r0, #0xee + OV29_023369F8_OFFSET]
	ldr r0, [r1]
	add r0, r0, ip
	add r0, r0, #0xc000
	add ip, ip, #1
	strb r2, [r0, #0xd0c + OV29_023369F8_OFFSET]
	cmp ip, #8
	blt _02336A08
	bx lr
	.align 2, 0
_02336A48: .word DUNGEON_PTR
	arm_func_end ov29_023369F8

	arm_func_start DetermineAllTilesWalkableNeighbors
DetermineAllTilesWalkableNeighbors: ; 0x02336A4C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, #0
	mov r4, r6
_02336A58:
	mov r5, r4
_02336A5C:
	mov r0, r5
	mov r1, r6
	bl DetermineTileWalkableNeighbors
	add r5, r5, #1
	cmp r5, #0x38
	blt _02336A5C
	add r6, r6, #1
	cmp r6, #0x20
	blt _02336A58
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DetermineAllTilesWalkableNeighbors

	arm_func_start DetermineTileWalkableNeighbors
DetermineTileWalkableNeighbors: ; 0x02336A84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r4, r1
	mov r6, #0
	add r1, r4, #1
	mov r5, r0
	mov r7, r6
	mov r8, r6
	bl GetTile
	ldrh r2, [r0]
	add r0, r5, #1
	add r1, r4, #1
	and r2, r2, #3
	str r2, [sp, #8]
	bl GetTile
	ldrh r2, [r0]
	mov r1, r4
	add r0, r5, #1
	and r2, r2, #3
	str r2, [sp, #0xc]
	bl GetTile
	ldrh r1, [r0]
	sub sb, r4, #1
	add r0, r5, #1
	and r1, r1, #3
	str r1, [sp, #0x10]
	mov r1, sb
	bl GetTile
	ldrh r2, [r0]
	mov r0, r5
	mov r1, sb
	and r2, r2, #3
	str r2, [sp, #0x14]
	bl GetTile
	ldrh r2, [r0]
	mov r1, sb
	sub sb, r5, #1
	and r2, r2, #3
	mov r0, sb
	str r2, [sp, #0x18]
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	mov r1, r4
	and r2, r2, #3
	str r2, [sp, #0x1c]
	bl GetTile
	ldrh r2, [r0]
	mov r0, sb
	add r1, r4, #1
	and r2, r2, #3
	str r2, [sp, #0x20]
	bl GetTile
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	cmp r0, #1
	and r0, r1, #3
	orreq r6, r6, #1
	str r0, [sp, #0x24]
	cmp r2, #1
	ldr r3, [sp, #0x18]
	orreq r6, r6, #4
	cmp r3, #1
	ldr ip, [sp, #0x20]
	orreq r6, r6, #0x10
	cmp ip, #1
	ldr r0, [sp, #8]
	orreq r6, r6, #0x40
	cmp r0, #0
	beq _02336BB4
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02336BB4
	cmp r2, #0
	orrne r6, r6, #2
_02336BB4:
	cmp r2, #0
	beq _02336BD0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02336BD0
	cmp r3, #0
	orrne r6, r6, #8
_02336BD0:
	cmp r3, #0
	beq _02336BEC
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _02336BEC
	cmp ip, #0
	orrne r6, r6, #0x20
_02336BEC:
	cmp ip, #0
	beq _02336C0C
	ldr r0, [sp, #0x24]
	cmp r0, #1
	bne _02336C0C
	ldr r0, [sp, #8]
	cmp r0, #0
	orrne r6, r6, #0x80
_02336C0C:
	mov r1, #0
	mov fp, r1
	add lr, sp, #0
	mov sb, #1
	add r0, sp, #8
_02336C20:
	ldr sl, [r0, r1, lsl #2]
	sub sl, sl, #1
	cmp sl, #1
	strlsb sb, [lr, r1]
	strhib fp, [lr, r1]
	add r1, r1, #1
	cmp r1, #8
	blt _02336C20
	ldrb r0, [sp]
	mov sb, #0xff
	mov r1, r4
	cmp r0, #0
	ldrb r0, [sp, #2]
	orrne r7, r7, #1
	cmp r0, #0
	ldrb r0, [sp, #4]
	orrne r7, r7, #4
	cmp r0, #0
	ldrb r0, [sp, #6]
	orrne r7, r7, #0x10
	cmp r0, #0
	ldr r0, [sp, #8]
	orrne r7, r7, #0x40
	cmp r0, #0
	ldrneb r0, [sp, #1]
	cmpne r0, #0
	cmpne r2, #0
	orrne r7, r7, #2
	cmp r2, #0
	ldrneb r0, [sp, #3]
	cmpne r0, #0
	cmpne r3, #0
	orrne r7, r7, #8
	cmp r3, #0
	ldrneb r0, [sp, #5]
	cmpne r0, #0
	cmpne ip, #0
	orrne r7, r7, #0x20
	cmp ip, #0
	ldrneb r0, [sp, #7]
	cmpne r0, #0
	ldrne r0, [sp, #8]
	cmpne r0, #0
	ldr r0, [sp, #8]
	orrne r7, r7, #0x80
	cmp r0, #0
	orrne r8, r8, #1
	cmp r2, #0
	orrne r8, r8, #4
	cmp r3, #0
	orrne r8, r8, #0x10
	cmp ip, #0
	ldr r0, [sp, #8]
	orrne r8, r8, #0x40
	cmp r0, #0
	ldrne r0, [sp, #0xc]
	cmpne r0, #0
	cmpne r2, #0
	orrne r8, r8, #2
	cmp r2, #0
	ldrne r0, [sp, #0x14]
	cmpne r0, #0
	cmpne r3, #0
	orrne r8, r8, #8
	cmp r3, #0
	ldrne r0, [sp, #0x1c]
	cmpne r0, #0
	cmpne ip, #0
	orrne r8, r8, #0x20
	cmp ip, #0
	ldrne r0, [sp, #0x24]
	cmpne r0, #0
	ldrne r0, [sp, #8]
	cmpne r0, #0
	orrne r8, r8, #0x80
	cmp r5, #1
	bicle sb, sb, #0xe0
	cmp r4, #1
	bicle sb, sb, #0x38
	cmp r5, #0x36
	bicge sb, sb, #0xe
	cmp r4, #0x1e
	mov r0, r5
	bicge sb, sb, #0x83
	bl GetTileSafe
	strb r6, [r0, #8]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb r7, [r0, #9]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb r8, [r0, #0xa]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	strb sb, [r0, #0xb]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DetermineTileWalkableNeighbors

	arm_func_start ov29_02336DB0
ov29_02336DB0: ; 0x02336DB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	mov r1, r2
	mov r5, r3
	bl GetTile
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #0x200
	beq _02336DE0
	ldr r0, _02336F48 ; =ov29_02352F14
	bl Debug_Print0
_02336DE0:
	ldrh r1, [r4]
	tst r1, #0x1000
	bne _02336DF4
	tst r1, #0x2000
	beq _02336E04
_02336DF4:
	add r0, r6, #0x32
	add r0, r0, #0xe000
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336E04:
	tst r1, #0x20
	addne r0, r6, #0x20
	addne r0, r0, #0xe000
	addne r0, r0, r5, lsl #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [sp, #0x14]
	cmp r0, #0
	beq _02336E40
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336E40:
	ldrh r0, [r4, #2]
	tst r0, #4
	addne r0, r6, #0x44
	addne r0, r0, #0xe000
	addne r0, r0, r5, lsl #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r2, [r4, #0x10]
	cmp r2, #0
	beq _02336EFC
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	ldreqb r0, [sp, #0x10]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	ands r1, r0, #0xff
	beq _02336EB0
	ldr r0, [r2]
	cmp r0, #2
	bne _02336EB0
	ldr r1, [r2, #0xb4]
	add r0, r6, #0x204
	ldrb r1, [r1]
	add r2, r0, #0xdc00
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EB0:
	cmp r1, #0
	beq _02336EE0
	ldr r0, [r2]
	cmp r0, #5
	bne _02336EE0
	ldrsh r1, [r6, #0x14]
	add r0, r6, #0x204
	add r2, r0, #0xdc00
	mov r0, #0x12
	smlabb r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EE0:
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336EFC:
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	bne _02336F2C
	tst r1, #0x200
	beq _02336F2C
	ldrsh r1, [r6, #0x14]
	add r0, r6, #0x204
	add r2, r0, #0xdc00
	mov r0, #0x12
	smlabb r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
_02336F2C:
	ldrh r1, [r4, #4]
	add r0, r6, #0x1e4
	add r2, r0, #0xc000
	mov r0, #0x12
	mla r0, r1, r0, r2
	add r0, r0, r5, lsl #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02336F48: .word ov29_02352F14
	arm_func_end ov29_02336DB0
