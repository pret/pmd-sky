	.include "asm/macros.inc"
	.include "overlay_29_0234DDF4.inc"

	.text

	arm_func_start OpenMenu
OpenMenu: ; 0x0234DDF4
#ifdef JAPAN
#define OPEN_MENU_OFFSET -0xA4
#else
#define OPEN_MENU_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r0, #0x22
	mov sl, r2
	bl LoadOverlay
	ldr r0, _0234E8E8 ; =DUNGEON_PTR
	mov r6, #0
	ldr r1, [r0]
	mov r4, #0xa
	ldr r5, [r1, #0x614]
	sub r0, r4, #0xb
	cmp r5, #4
	moveq r2, #1
	movne r2, r6
	cmp r5, #0
	movge r4, r5
	str r0, [r1, #0x614]
	and fp, r2, #0xff
	cmp sl, #0
	beq _0234DE74
	mov r5, #1
	mov r0, r5
	mov r4, r5
	bl ov29_0234B1A4
	mov r0, #0x1d
	bl AdvanceFrame
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	mov r0, #2
	mov r1, #0x1d
	bl ov29_022EA370
_0234DE74:
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
_0234DE78:
	mvn r0, #0
	cmp r5, r0
	bne _0234DEE8
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_022EB398
	ldr r0, _0234E8EC ; =ov29_02382804
	mvn r1, #0
	str r1, [r0, #4]
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	cmp sl, #0
	mvnne r4, #0
	bne _0234DEE8
	bl EntryOverlay31
	mov r5, #0x1d
_0234DED0:
	mov r0, r5
	bl AdvanceFrame
	bl ov31_02382E08
	mov r4, r0
	cmp r4, #0xa
	beq _0234DED0
_0234DEE8:
	mov r5, r4
	mvn r7, #0
	mov r8, #0
	mov sb, #1
_0234DEF8:
	cmp r4, #1
	bne _0234E150
	mov r0, #1
	bl ov29_022EB398
	strb r8, [sp, #0x14]
	strb sb, [sp, #0x15]
	strb r8, [sp, #0x16]
	strb r8, [sp, #0x17]
	str r8, [sp, #0x18]
	bl GetLeader
	add r1, sp, #0x14
	bl ov31_023838E4
	cmp r0, #0
	add r0, sp, #0x14
	movne r5, r7
	bl ov29_0234E934
	cmp r0, #0
	beq _0234DF5C
	bl GetLeader
	add r1, sp, #0x14
	bl ov31_023838E4
	cmp r0, #0
	beq _0234DF5C
	mov r0, #1
	bl ov29_022EB398
_0234DF5C:
	bl ov29_022F0B9C
	cmp r0, #0xc
	bne _0234DF9C
	bl GetLeader
	mov r1, #0
	mov r2, #0xc
	bl GetItemToUse
	ldrb r1, [r0]
	orr r1, r1, #4
	strb r1, [r0]
	bl GetLeaderAction
	bl ov31_0238367C
	mov r0, #1
	bl ov29_022EB398
	mov r4, #1
	b _0234DEF8
_0234DF9C:
	cmp r0, #0x35
	bne _0234DFD8
	bl GetLeader
	mov r1, #0
	mov r2, #0xd
	bl GetItemToUse
	mov r7, r0
	bl GetLeader
	mov r1, r7
	bl ov29_0231DBF0
	cmp r0, #0
	bne _0234E140
	mov r0, #1
	bl ov29_022EB398
	b _0234E140
_0234DFD8:
	cmp r0, #0x10
	bne _0234E014
	bl GetLeader
	mov r1, #0
	mov r2, #0xe
	bl GetItemToUse
	mov r7, r0
	bl GetLeader
	mov r1, r7
	bl ov29_0231DA80
	cmp r0, #0
	bne _0234E140
	mov r0, #1
	bl ov29_022EB398
	b _0234E140
_0234E014:
	cmp r0, #0x2c
	bne _0234E050
	bl GetLeader
	mov r1, #0
	mov r2, #0xf
	bl GetItemToUse
	mov r7, r0
	bl GetLeader
	mov r1, r7
	bl ov29_0231DD60
	cmp r0, #0
	bne _0234E140
	mov r0, #1
	bl ov29_022EB398
	b _0234E140
_0234E050:
	cmp r0, #0x3c
	bne _0234E084
	bl GetLeader
	mov r1, #1
	bl ov29_022F4370
	mov r0, #1
	bl ov29_022EB398
	mov r0, #0x78
	mov r1, #0x4d
	bl ov29_022EA370
	mov r0, #0
	bl ov29_0234B1A4
	b _0234E890
_0234E084:
	cmp r0, #0x3d
	bne _0234E0B8
	bl GetLeader
	mov r1, #1
	bl ov29_022F44F0
	mov r0, #1
	bl ov29_022EB398
	mov r0, #0x78
	mov r1, #0x4d
	bl ov29_022EA370
	mov r0, #0
	bl ov29_0234B1A4
	b _0234E890
_0234E0B8:
	cmp r0, #0xb
	cmpne r0, #0x27
	cmpne r0, #0x41
	bne _0234E0EC
	bl sub_0204AF20
	cmp r0, #0
	beq _0234E140
	bl GetLeaderAction
	bl GetLeader
	bl ov29_022F0C1C
	cmp r0, #0
	beq _0234DE78
	b _0234E140
_0234E0EC:
	cmp r0, #0x31
	bne _0234E140
	bl sub_0204AF20
	cmp r0, #0
	beq _0234E140
	bl GetLeaderAction
	bl GetLeader
	mov r1, #0
	mov r2, #0x15
	mov r7, r0
	bl GetItemToUse
	ldrsh r0, [r0, #4]
	bl GetItemMoveId16
	mov r1, r0
	add r0, sp, #0x1c
	bl InitMove
	mov r0, r7
	add r1, sp, #0x1c
	bl ov29_022F0C3C
	cmp r0, #0
	beq _0234DE78
_0234E140:
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	b _0234E86C
_0234E150:
	cmp r4, #2
	bne _0234E2C4
	mvn r0, #0
	mov sb, #1
	str r0, [sp, #0x10]
	b _0234E2AC
_0234E168:
	mov r0, #1
	bl ov29_022EB398
	bl GetLeader
	bl TeamMenu
	cmp r0, #0
	ldrne r5, [sp, #0x10]
	bl ov29_022F0B9C
	cmp r0, #0x30
	bgt _0234E1B0
	bge _0234E1F0
	sub r1, r0, #0x19
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0234E288
_0234E1A0: ; jump table
	b _0234E200 ; case 0
	b _0234E1E4 ; case 1
	b _0234E1BC ; case 2
	b _0234E1CC ; case 3
_0234E1B0:
	cmp r0, #0x34
	beq _0234E1D8
	b _0234E288
_0234E1BC:
	bl GetLeaderAction
	mov r1, #0
	bl ov31_02387688
	b _0234E28C
_0234E1CC:
	bl GetLeaderAction
	bl ov29_022F5A0C
	b _0234E28C
_0234E1D8:
	bl GetLeaderAction
	bl ov29_022F5DC0
	b _0234E28C
_0234E1E4:
	bl GetLeaderAction
	bl ov31_02387660
	b _0234E28C
_0234E1F0:
	bl GetLeaderAction
	mov r1, #1
	bl ov31_02387688
	b _0234E28C
_0234E200:
	bl GetLeaderAction
	bl MovesMenu
	mov r7, #0
	mov r8, r7
	b _0234E27C
_0234E214:
	ldr r0, _0234E8E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OPEN_MENU_OFFSET]
	str r0, [sp, #4]
	bl EntityIsValid__0234DDD0
	cmp r0, #0
	beq _0234E278
	bl GetLeaderAction
	ldrb r0, [r0, #4]
	cmp r8, r0
	bne _0234E274
	ldr r0, _0234E8EC ; =ov29_02382804
	str r7, [r0, #4]
	bl ov29_022F0B9C
	cmp r0, #0
	beq _0234E28C
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov sb, #0
	b _0234E28C
_0234E274:
	add r7, r7, #1
_0234E278:
	add r8, r8, #1
_0234E27C:
	cmp r8, #4
	blt _0234E214
	b _0234E28C
_0234E288:
	mov sb, #0
_0234E28C:
	ldr r0, _0234E8F0 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl sub_0200B3D4
	ldr r0, _0234E8F0 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl sub_0200B330
_0234E2AC:
	cmp sb, #0
	bne _0234E168
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	b _0234E86C
_0234E2C4:
	cmp r4, #0
	bne _0234E4F0
	mov r0, #1
	mov r8, #0
	bl ov29_022EB398
	mov r7, r8
	b _0234E318
_0234E2E0:
	ldr r0, _0234E8E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb28 + OPEN_MENU_OFFSET]
	mov r0, sb
	bl EntityIsValid__0234DDD0
	cmp r0, #0
	ldrne r0, [sb, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	movne r8, r7
	bne _0234E320
	add r7, r7, #1
_0234E318:
	cmp r7, #4
	blt _0234E2E0
_0234E320:
	mov r7, #0
	mov r0, r7
	str r7, [sp, #8]
	mov sb, r7
	str r0, [sp, #0x24]
_0234E334:
	ldr r0, _0234E8E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OPEN_MENU_OFFSET]
	str r0, [sp, #0xc]
	bl ov29_02302388
	cmp r0, #0
	beq _0234E36C
	cmp sb, r8
	ldreq r0, [sp, #0xc]
	streq r7, [sp, #8]
	streq r0, [sp, #0x24]
	add r7, r7, #1
_0234E36C:
	add sb, sb, #1
	cmp sb, #4
	blt _0234E334
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0234E38C
	bl GetLeader
	str r0, [sp, #0x24]
_0234E38C:
	ldr r0, [sp, #0x24]
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	ldr r0, [sp, #0x24]
	mov r2, #1
	add r0, r0, #4
	mov r1, #0
	mov r3, r2
	bl DrawTileGrid
	bl GetLeaderMonster
	strb r8, [r0, #0x4e]
	mov r0, #0
	bl ov29_022EB398
	ldr sb, _0234E8E8 ; =DUNGEON_PTR
	mvn r8, #0
_0234E3CC:
	mov r0, #0
	bl ov29_022EB398
	ldr r3, [sp, #8]
	add r0, sp, #0x24
	mov r1, #0
	mov r2, #1
	str r7, [sp]
	bl HandleMovesMenuWrapper0
	cmp r0, #0
	movne r5, r8
	bl ov29_022F0B9C
	cmp r0, #0x1d
	bne _0234E40C
	bl GetLeaderAction
	bl ov31_02385FE0
	b _0234E3CC
_0234E40C:
	bl ov29_022F0B9C
	cmp r0, #0x1e
	bne _0234E428
	bl GetLeaderAction
	mov r1, #0
	bl ov31_023860A4
	b _0234E3CC
_0234E428:
	bl ov29_022F0B9C
	cmp r0, #0x33
	bne _0234E444
	bl GetLeaderAction
	mov r1, #0
	bl ov31_023860A4
	b _0234E3CC
_0234E444:
	bl ov29_022F0B9C
	cmp r0, #0x1f
	bne _0234E45C
	bl GetLeaderAction
	bl ov31_0238619C
	b _0234E3CC
_0234E45C:
	bl ov29_022F0B9C
	cmp r0, #0x20
	beq _0234E3CC
	bl ov29_022F0B9C
	cmp r0, #0x21
	beq _0234E3CC
	bl ov29_022F0B9C
	cmp r0, #0x14
	beq _0234E48C
	bl ov29_022F0B9C
	cmp r0, #0x15
	bne _0234E4CC
_0234E48C:
	bl sub_0204AF20
	cmp r0, #0
	beq _0234E4CC
	bl GetLeaderAction
	ldrb r2, [r0, #4]
	ldr r3, [sb]
	ldrb r1, [r0, #0xa]
	add r0, r3, r2, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OPEN_MENU_OFFSET]
	ldr r2, [r0, #0xb4]
#ifdef JAPAN
	add r2, r2, #0x120
#else
	add r2, r2, #0x124
#endif
	add r1, r2, r1, lsl #3
	bl ov29_022F0C3C
	cmp r0, #0
	beq _0234E3CC
_0234E4CC:
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	bl HideTileGrid
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	b _0234E86C
_0234E4F0:
	cmp r4, #4
	bne _0234E800
	bl GetLeader
	mov r1, r0
	ldrsh r0, [r1, #4]
	ldrsh r1, [r1, #6]
	bl GetTile
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0234E78C
	ldr r0, [r1]
	cmp r0, #3
	bne _0234E734
	mov r0, #1
	bl ov29_0234B1A4
	mov r0, #0x1d
	bl AdvanceFrame
	mov r0, #0x1d
	bl AdvanceFrame
	mov r0, #1
	bl ov29_022EB398
	mov r0, #0
	strb r0, [sp, #0x28]
	mov r0, #1
	strb r0, [sp, #0x29]
	strb r0, [sp, #0x2a]
	strb r0, [sp, #0x2b]
	mov r0, #0
	str r0, [sp, #0x2c]
	bl GetLeader
	add r1, sp, #0x28
	bl ov31_023838E4
	cmp r0, #0
	add r0, sp, #0x28
	movne r5, r7
	bl ov29_0234E934
	cmp r0, #0
	beq _0234E5A4
	bl GetLeader
	add r1, sp, #0x28
	bl ov31_023838E4
	cmp r0, #0
	beq _0234E5A4
	mov r0, #1
	bl ov29_022EB398
_0234E5A4:
	bl ov29_022F0B9C
	cmp r0, #0xc
	bne _0234E5E4
	bl GetLeader
	mov r1, #0
	mov r2, #0x10
	bl GetItemToUse
	ldrb r1, [r0]
	orr r1, r1, #4
	strb r1, [r0]
	bl GetLeaderAction
	bl ov31_0238367C
	mov r0, #1
	bl ov29_022EB398
	mov r4, #4
	b _0234DEF8
_0234E5E4:
	cmp r0, #0x35
	bne _0234E620
	bl GetLeader
	mov r1, #0
	mov r2, #0x11
	bl GetItemToUse
	mov r5, r0
	bl GetLeader
	mov r1, r5
	bl ov29_0231DBF0
	cmp r0, #0
	bne _0234E720
	mov r0, #1
	bl ov29_022EB398
	b _0234E720
_0234E620:
	cmp r0, #0x10
	bne _0234E65C
	bl GetLeader
	mov r1, #0
	mov r2, #0x12
	bl GetItemToUse
	mov r5, r0
	bl GetLeader
	mov r1, r5
	bl ov29_0231DA80
	cmp r0, #0
	bne _0234E720
	mov r0, #1
	bl ov29_022EB398
	b _0234E720
_0234E65C:
	cmp r0, #0x2c
	bne _0234E698
	bl GetLeader
	mov r1, #0
	mov r2, #0x13
	bl GetItemToUse
	mov r5, r0
	bl GetLeader
	mov r1, r5
	bl ov29_0231DD60
	cmp r0, #0
	bne _0234E720
	mov r0, #1
	bl ov29_022EB398
	b _0234E720
_0234E698:
	cmp r0, #0xb
	cmpne r0, #0x27
	cmpne r0, #0x41
	bne _0234E6CC
	bl sub_0204AF20
	cmp r0, #0
	beq _0234E720
	bl GetLeaderAction
	bl GetLeader
	bl ov29_022F0C1C
	cmp r0, #0
	beq _0234DE78
	b _0234E720
_0234E6CC:
	cmp r0, #0x31
	bne _0234E720
	bl sub_0204AF20
	cmp r0, #0
	beq _0234E720
	bl GetLeaderAction
	bl GetLeader
	mov r1, #0
	mov r2, #0x15
	mov r7, r0
	bl GetItemToUse
	ldrsh r0, [r0, #4]
	bl GetItemMoveId16
	mov r1, r0
	add r0, sp, #0x30
	bl InitMove
	mov r0, r7
	add r1, sp, #0x30
	bl ov29_022F0C3C
	cmp r0, #0
	beq _0234DE78
_0234E720:
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	b _0234E7F8
_0234E734:
	cmp r0, #2
	bne _0234E75C
	mov r0, #1
	bl ov29_022EB398
	bl GetLeader
	bl ov31_02386C6C
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	b _0234E7F8
_0234E75C:
	cmp r0, #5
	bne _0234E7F8
	mov r0, #1
	bl ov29_022EB398
	bl GetLeader
	mov r1, #1
	bl ov31_02382E18
	bl ov29_022F0B9C
	cmp r0, #0
	beq _0234E7F8
	mov r6, #1
	b _0234E890
_0234E78C:
	ldrh r0, [r0]
	tst r0, #0x200
	beq _0234E7C0
	mov r0, #1
	bl ov29_022EB398
	bl GetLeader
	mov r1, #1
	bl ov31_02382E18
	bl ov29_022F0B9C
	cmp r0, #0
	beq _0234E7F8
	mov r6, #1
	b _0234E890
_0234E7C0:
	bl GetLeader
	mov r7, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	bl ov29_0234B034
	mov r1, r7
	str r5, [r0, #0x38]
	mov r0, r5
	mov r2, #0
	bl ov29_022E2A78
	mov r0, #0
#ifdef JAPAN
	mov r1, #0x870
#else
	ldr r1, _0234E8F4 ; =0x00000B6A
#endif
	mov r2, #1
	bl DisplayMessage
_0234E7F8:
	mvn r5, #0
	b _0234E86C
_0234E800:
	cmp r4, #3
	bne _0234E834
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	bl OthersMenu
	cmp r0, #0
	bne _0234E890
	bl ov29_022F0B9C
	cmp r0, #0
	bne _0234E890
	mvn r5, #0
	b _0234E86C
_0234E834:
	cmp r4, #5
	bne _0234E86C
	bl RestMenu
	ldr r0, _0234E8E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r6, #1
	bne _0234E890
	bl ov29_022F0B9C
	cmp r0, #0
	movne r6, #1
	bne _0234E890
	mvn r5, #0
_0234E86C:
	cmp sl, #0
	mvnne r0, #0
	cmpne r4, r0
	bne _0234DE78
	cmp fp, #0
	bne _0234E890
	mvn r0, #0
	cmp r4, r0
	bne _0234DE78
_0234E890:
	cmp r6, #0
	mov r0, #0x64
	beq _0234E8B0
	bl AdvanceFrame
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	b _0234E8C0
_0234E8B0:
	bl AdvanceFrame
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234E8C0:
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	bl ov29_022E0B44
	mov r0, #0x22
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234E8E0
	mov r0, #0x22
	bl UnloadOverlay
_0234E8E0:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234E8E8: .word DUNGEON_PTR
_0234E8EC: .word ov29_02382804
_0234E8F0: .word ov29_0235352C
#ifndef JAPAN
_0234E8F4: .word 0x00000B6A
#endif
	arm_func_end OpenMenu

	arm_func_start ov29_0234E8F8
ov29_0234E8F8: ; 0x0234E8F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x22
	bl LoadOverlay
	mov r0, r5
	mov r1, r4
	bl ov31_02382E18
	mov r0, #0x22
	bl OverlayIsLoaded
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x22
	bl UnloadOverlay
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234E8F8

	arm_func_start ov29_0234E934
ov29_0234E934: ; 0x0234E934
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022F0B9C
	mov r2, #0
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	cmp r0, #0xa
	strb r2, [r4, #3]
	moveq r1, #1
	streqb r1, [r4]
	streqb r2, [r4, #1]
	streqb r1, [r4, #3]
	cmp r0, #0x3e
	moveq r1, #1
	streqb r1, [r4]
	moveq r0, #0
	streqb r0, [r4, #1]
	streqb r1, [r4, #3]
	ldrb r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234E934

	arm_func_start ov29_0234E988
ov29_0234E988: ; 0x0234E988
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb r0, [r7]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_0202AAE8
	cmp r0, #0
	beq _0234E9D4
	mvn r4, #3
	sub r5, r4, #1
	mov r6, #0x62
_0234E9B8:
	mov r0, r6
	bl AdvanceFrame
	ldrsb r0, [r7]
	bl sub_020282F4
	cmp r0, r5
	cmpne r0, r4
	bne _0234E9B8
_0234E9D4:
	ldrsb r0, [r7]
	bl CloseParentMenu
	mvn r0, #1
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234E988

	arm_func_start ov29_0234E9E8
ov29_0234E9E8: ; 0x0234E9E8
	str r1, [r0]
	mov ip, #0
	str ip, [r0, #0x88]
	mov r3, ip
	mov r1, #0x44
_0234E9FC:
	add r2, r0, ip, lsl #5
	strb r3, [r2, #0x14]
	add ip, ip, #1
	strb r1, [r2, #0x1e]
	cmp ip, #4
	blt _0234E9FC
	bx lr
	arm_func_end ov29_0234E9E8

	arm_func_start ov29_0234EA18
ov29_0234EA18: ; 0x0234EA18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	bl ov29_0234E9E8
	cmp sb, #1
	moveq r5, #4
	beq _0234EA50
	cmp sb, #0
	moveq r5, #4
	bne _0234EB1C
_0234EA50:
	mov r4, #0
	ldr fp, _0234EB24 ; =DUNGEON_PTR
	b _0234EAE4
_0234EA5C:
	cmp sb, #1
	bne _0234EA98
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, [fp]
	mov r0, sl
	add r1, r1, r4, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	mov r2, r4
	mov r3, r8
	bl ov29_0234EC38
	cmp r0, #0
	beq _0234EAE0
	b _0234EACC
_0234EA98:
	cmp sb, #0
	bne _0234EACC
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov r1, r0
	mov r0, sl
	str r6, [sp]
	mov r2, r4
	mov r3, r7
	bl ov29_0234ED30
	cmp r0, #0
	beq _0234EAE0
_0234EACC:
	ldr r0, [sl, #0x88]
	add r0, r0, #1
	str r0, [sl, #0x88]
	cmp r0, #4
	bge _0234EAEC
_0234EAE0:
	add r4, r4, #1
_0234EAE4:
	cmp r4, r5
	blt _0234EA5C
_0234EAEC:
	ldr r4, [sl, #0x88]
	mvn r3, #0
	mov r1, #0
	b _0234EB14
_0234EAFC:
	add r2, sl, r4, lsl #5
	str r3, [r2, #4]
	add r0, sl, r4
	str r1, [r2, #0x20]
	strb r1, [r0, #0x84]
	add r4, r4, #1
_0234EB14:
	cmp r4, #4
	blt _0234EAFC
_0234EB1C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234EB24: .word DUNGEON_PTR
	arm_func_end ov29_0234EA18

	arm_func_start ov29_0234EB28
ov29_0234EB28: ; 0x0234EB28
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr ip, [r4, #0x88]
	cmp ip, #4
	mvnge r0, #0
	bge _0234EBA4
	ldr ip, [r4]
	cmp ip, #1
	bne _0234EB74
	ldrb lr, [sp, #0x10]
	ldrb ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl ov29_0234EC38
	cmp r0, #0
	bne _0234EB98
	mvn r0, #0
	b _0234EBA4
_0234EB74:
	cmp ip, #0
	bne _0234EB98
	ldrb ip, [sp, #0x14]
	ldrb r3, [sp, #0x10]
	str ip, [sp]
	bl ov29_0234ED30
	cmp r0, #0
	mvneq r0, #0
	beq _0234EBA4
_0234EB98:
	ldr r0, [r4, #0x88]
	add r1, r0, #1
	str r1, [r4, #0x88]
_0234EBA4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234EB28

	arm_func_start ov29_0234EBAC
ov29_0234EBAC: ; 0x0234EBAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
#ifdef JAPAN
	add r0, r5, #0x10
	mov r4, r2
	bl StrcpySimple
#else
	mov r4, r2
	add r0, r5, #0x10
	mov r2, #0xa
	bl StrncpySimple
#endif
	strb r4, [r5, #0x1a]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234EBAC

	arm_func_start ov29_0234EBCC
ov29_0234EBCC: ; 0x0234EBCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0234EC10 ; =DUNGEON_PTR
	mov r6, #0
	mov r5, #1
_0234EBDC:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValid__0234EC14
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	add r6, r6, #1
#ifdef JAPAN
	strneb r5, [r0, #0x15d]
#else
	strneb r5, [r0, #0x161]
#endif
	cmp r6, #4
	blt _0234EBDC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234EC10: .word DUNGEON_PTR
	arm_func_end ov29_0234EBCC
