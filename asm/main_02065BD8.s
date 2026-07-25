	.include "asm/macros.inc"
	.include "main_02065BD8.inc"

	.text

	arm_func_start sub_02065BD8
sub_02065BD8: ; 0x02065BD8
	ldr ip, _02065BE8 ; =StrncpySimple
	mov r2, r1
	ldr r1, _02065BEC ; =_022B7310
	bx ip
	.align 2, 0
_02065BE8: .word StrncpySimple
_02065BEC: .word _022B7310
	arm_func_end sub_02065BD8

	arm_func_start sub_02065BF0
sub_02065BF0: ; 0x02065BF0
	ldr ip, _02065C00 ; =StrncpySimpleNoPadSafe
	ldr r1, _02065C04 ; =_022B7310
	mov r2, #0xa
	bx ip
	.align 2, 0
_02065C00: .word StrncpySimpleNoPadSafe
_02065C04: .word _022B7310
	arm_func_end sub_02065BF0

	arm_func_start sub_02065C08
sub_02065C08: ; 0x02065C08
	ldr ip, _02065C44 ; =_022B7310
	mov r3, #0
	b _02065C20
_02065C14:
	ldrb r2, [r0], #1
	add r3, r3, #1
	strb r2, [ip], #1
_02065C20:
	cmp r3, r1
	blt _02065C14
	mov r0, #0
	b _02065C38
_02065C30:
	strb r0, [ip], #1
	add r3, r3, #1
_02065C38:
	cmp r3, #0x10
	blt _02065C30
	bx lr
	.align 2, 0
_02065C44: .word _022B7310
	arm_func_end sub_02065C08

	arm_func_start RandomizeDemoActors
RandomizeDemoActors: ; 0x02065C48
	stmdb sp!, {r3, lr}
	mov r0, #0x12
	bl RandInt
	ldr r2, _02065C78 ; =DEMO_TEAMS
	mov r3, r0, lsl #2
	ldr r1, _02065C7C ; =_020A68CA
	ldrsh r2, [r2, r3]
	ldr r0, _02065C80 ; =SPECIAL_ACTORS
	ldrsh r1, [r1, r3]
	strh r2, [r0, #0xa]
	strh r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02065C78: .word DEMO_TEAMS
_02065C7C: .word _020A68CA
_02065C80: .word SPECIAL_ACTORS
	arm_func_end RandomizeDemoActors

	arm_func_start sub_02065C84
sub_02065C84: ; 0x02065C84
	mov r2, #0
	ldr r1, _02065CAC ; =_022B7320
	mov r0, r2
_02065C90:
	strh r0, [r1]
	add r2, r2, #1
	strh r0, [r1, #2]
	cmp r2, #4
	add r1, r1, #4
	blt _02065C90
	bx lr
	.align 2, 0
_02065CAC: .word _022B7320
	arm_func_end sub_02065C84

	arm_func_start sub_02065CB0
sub_02065CB0: ; 0x02065CB0
	bx lr
	arm_func_end sub_02065CB0

	arm_func_start sub_02065CB4
sub_02065CB4: ; 0x02065CB4
	ldrh r2, [r1]
	ldr r3, _02065CD4 ; =_022B7320
	mov ip, r0, lsl #2
	strh r2, [r3, ip]
	ldrh r1, [r1, #2]
	add r0, r3, r0, lsl #2
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02065CD4: .word _022B7320
	arm_func_end sub_02065CB4

	arm_func_start sub_02065CD8
sub_02065CD8: ; 0x02065CD8
	ldr r2, _02065CF0 ; =_022B7320
	mov r3, r0
	mov r0, r1
	ldr ip, _02065CF4 ; =BulkItemToItem
	add r1, r2, r3, lsl #2
	bx ip
	.align 2, 0
_02065CF0: .word _022B7320
_02065CF4: .word BulkItemToItem
	arm_func_end sub_02065CD8

	arm_func_start ItemAtTableIdx
ItemAtTableIdx: ; 0x02065CF8
	ldr r3, _02065D18 ; =_022B7320
	mov r2, r0, lsl #2
	ldrh r2, [r3, r2]
	add r0, r3, r0, lsl #2
	strh r2, [r1]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_02065D18: .word _022B7320
	arm_func_end ItemAtTableIdx

	arm_func_start MainLoop
MainLoop: ; 0x02065D1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	bl sub_020024A0
	mov r7, r0
	mov r8, #1
	bl sub_02065C84
	bl sub_020205E4
	bl LoadTblTalk
	bl sub_0201DD90
	bl InitObjGraphicsControls
	bl sub_0201D7A8
	ldr r0, _02066374 ; =WAN_TABLE
	mov r1, #0x80
	ldr r0, [r0]
	bl InitWanTable
	bl sub_0201F208
	bl DirectoryFileMngr_ExtractAllDirectoryFiles
	bl InitOptionsVeneer
	bl InitKaomadoStream
	bl sub_02025AD8
	bl sub_02026E78
	bl sub_020346C0
	mov r0, #0
	bl SetGameMode
	mov r0, #2
	bl SetBothScreensWindowsColor
	bl sub_0204A1A4
	bl sub_02048420
	bl KeyWaitInit
	add r0, sp, #4
	bl ReadSaveHeader
#ifdef EUROPE
	mov r4, r0
	bl sub_020205F8
	cmp r4, #1
#else
	cmp r0, #1
#endif
	bne _02065DF0
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, r8
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #4
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065DF0:
	cmp r7, #0
	cmpne r7, #5
	mov r0, #2
	bne _02065E2C
	mov r4, #1
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #2
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	b _02065E54
_02065E2C:
	mov r4, #0
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #1
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065E54:
	bl SetAdventureLogStructLocation
	bl sub_0204F9B8
	bl GlobalProgressAlloc
	bl sub_02052C3C
	bl LoadWazaP
	bl sub_0200CA8C
	bl sub_0205C73C
	bl sub_0205B44C
	bl KeyWaitInit
	bl InitScriptVariableValues
	cmp r4, #0
	beq _02065EE0
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #3
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	mov r0, #0
	mov r1, #0x5c
	bl ZeroInitScriptVariable
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xd
	bl LoadOverlay
	mov r0, #0
	bl ov11_022E82CC
	mov r0, #0xd
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065EE0:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #4
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	bl sub_02048430
	mov r4, #0xf
	mov r5, #2
	mov sl, #4
	mov fp, r4
	mov r6, #0
_02065F20:
	mov r0, r6
	bl SetGameMode
	bl sub_02048624
	cmp r8, #0
	beq _02065FE0
	bl NoteLoadBase
	movs sb, r0
	beq _02065FCC
	cmp sb, #1
	bne _02065F70
	mov r0, r5
	bl LoadOverlay
	mov r0, r4
	bl LoadOverlay
	mov r0, sl
	bl ExplorersOfSkyMain
	mov r0, fp
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065F70:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #3
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	bl sub_02048454
	cmp sb, #5
	beq _02065FCC
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #6
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065FCC:
	add r0, sp, #0
	bl CopyFrameTypeOption
	ldrb r0, [sp]
	bl sub_02027180
	bl sub_020205F8
_02065FE0:
	sub r0, r7, #6
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _020660B0
_02065FF0: ; jump table
	b _02066030 ; case 0
	b _02066040 ; case 1
	b _02066038 ; case 2
	b _02066048 ; case 3
	b _02066050 ; case 4
	b _02066058 ; case 5
	b _02066060 ; case 6
	b _02066068 ; case 7
	b _02066070 ; case 8
	b _02066078 ; case 9
	b _02066080 ; case 10
	b _02066088 ; case 11
	b _02066090 ; case 12
	b _02066098 ; case 13
	b _020660A0 ; case 14
	b _020660A8 ; case 15
_02066030:
	mov sb, #4
	b _020660FC
_02066038:
	mov sb, #6
	b _020660FC
_02066040:
	mov sb, #5
	b _020660FC
_02066048:
	mov sb, #7
	b _020660FC
_02066050:
	mov sb, #9
	b _020660FC
_02066058:
	mov sb, #0xa
	b _020660FC
_02066060:
	mov sb, #0xb
	b _020660FC
_02066068:
	mov sb, #0xc
	b _020660FC
_02066070:
	mov sb, #0xd
	b _020660FC
_02066078:
	mov sb, #0xe
	b _020660FC
_02066080:
	mov sb, #0xf
	b _020660FC
_02066088:
	mov sb, #0x10
	b _020660FC
_02066090:
	mov sb, #0x10
	b _020660FC
_02066098:
	mov sb, #0x12
	b _020660FC
_020660A0:
	mov sb, #0x13
	b _020660FC
_020660A8:
	mov sb, #0x14
	b _020660FC
_020660B0:
	cmp r7, #2
	moveq r7, #1
	beq _020660C8
	cmp r7, #3
	moveq r7, #2
	movne r7, #0
_020660C8:
	mov r0, #0
	bl SetGameMode
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, r7
	bl ov00_022BE0C8
	mov sb, r0
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
_020660FC:
	cmp sb, #6
	mov r7, #1
	bne _02066134
	mov r0, r7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne sb, #0xa
	bne _02066134
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne sb, #9
_02066134:
	bl GetSpecialEpisodeType
	mov r1, r0
	ldr r0, _02066378 ; =_020A9208
	bl Debug_Print0
	sub r0, sb, #4
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02065F20
_02066154: ; jump table
	b _0206617C ; case 0
	b _020661B0 ; case 1
	b _020661FC ; case 2
	b _0206622C ; case 3
	b _02065F20 ; case 4
	b _0206625C ; case 5
	b _0206628C ; case 6
	b _020662BC ; case 7
	b _02066300 ; case 8
	b _02066330 ; case 9
_0206617C:
	mov r0, #2
	bl SetGameMode
	bl sub_020484C0
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #0
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020661B0:
	bl GetDebugSpecialEpisodeNumber
	bl SetSpecialEpisodeType
	mov r0, #3
	bl SetGameMode
	bl sub_02048644
	bl InitSpecialEpisodeHero
	mov r0, #2
	mov r1, #0x36
	mov r2, #0
	bl SetScenarioProgressScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #0
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020661FC:
	mov r0, #2
	bl SetGameMode
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206622C:
	mov r0, #3
	bl SetGameMode
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206625C:
	mov r0, #2
	bl SetGameMode
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #2
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206628C:
	mov r0, #2
	bl SetGameMode
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #3
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020662BC:
	mov r0, #4
	bl SetGameMode
	bl sub_02048644
	bl sub_020485C4
	mov r0, #2
	mov r1, #0x33
	mov r2, #0
	bl SetScenarioProgressScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_02066300:
	mov r0, #4
	bl SetGameMode
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_02066330:
	mov r0, #5
	bl SetGameMode
	bl sub_02048644
	bl sub_020485D8
	mov r0, #2
	mov r1, #0x34
	mov r2, #0
	bl SetScenarioProgressScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
	.align 2, 0
_02066374: .word WAN_TABLE
_02066378: .word _020A9208
	arm_func_end MainLoop

	arm_func_start sub_0206637C
sub_0206637C: ; 0x0206637C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0206639C
	mov r0, #3
	bl ov00_022BE0C8
	ldmia sp!, {r3, pc}
_0206639C:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #3
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206637C

	arm_func_start sub_020663C8
sub_020663C8: ; 0x020663C8
	stmdb sp!, {r3, lr}
	ldrsb ip, [sp, #8]
	str ip, [sp]
	bl sub_02046A9C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020663C8

	arm_func_start sub_020663DC
sub_020663DC: ; 0x020663DC
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	mov ip, #0
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end sub_020663DC

	arm_func_start sub_02066408
sub_02066408: ; 0x02066408
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	ldr ip, [sp, #0x18]
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end sub_02066408

	arm_func_start sub_02066434
sub_02066434: ; 0x02066434
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r1, #1
	cmp r0, r1
	moveq r0, #0x1f
	ldmeqia sp!, {r3, pc}
	add r1, r1, #1
	cmp r0, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02066434

	arm_func_start sub_0206645C
sub_0206645C: ; 0x0206645C
	ldr ip, _02066464 ; =sub_02046BA0
	bx ip
	.align 2, 0
_02066464: .word sub_02046BA0
	arm_func_end sub_0206645C

	arm_func_start sub_02066468
sub_02066468: ; 0x02066468
	ldr ip, _02066474 ; =sub_02046BE8
	mov r2, #0
	bx ip
	.align 2, 0
_02066474: .word sub_02046BE8
	arm_func_end sub_02066468

	arm_func_start sub_02066478
sub_02066478: ; 0x02066478
	ldr ip, _02066484 ; =sub_02046C30
	mov r2, #0
	bx ip
	.align 2, 0
_02066484: .word sub_02046C30
	arm_func_end sub_02066478

	arm_func_start sub_02066488
sub_02066488: ; 0x02066488
	ldr ip, _02066490 ; =sub_02046BE8
	bx ip
	.align 2, 0
_02066490: .word sub_02046BE8
	arm_func_end sub_02066488

	arm_func_start sub_02066494
sub_02066494: ; 0x02066494
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x1f
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02066494

	arm_func_start sub_020664AC
sub_020664AC: ; 0x020664AC
	ldr ip, _020664B4 ; =sub_02046D20
	bx ip
	.align 2, 0
_020664B4: .word sub_02046D20
	arm_func_end sub_020664AC

	arm_func_start sub_020664B8
sub_020664B8: ; 0x020664B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020676AC
	ldr r2, _0206650C ; =_020B0B24
	mov r3, #0
	mov r0, #0xa8
	mov r1, #8
	strb r3, [r2]
	bl MemAlloc
	ldr r2, _0206650C ; =_020B0B24
	mov r1, #0xa8
	str r0, [r2, #4]
	bl MemZero
	ldr r1, _0206650C ; =_020B0B24
	mov r2, #0
	ldr r3, [r1, #4]
	mov r0, #1
	str r4, [r3, #8]
	ldr r1, [r1, #4]
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206650C: .word _020B0B24
	arm_func_end sub_020664B8

	arm_func_start sub_02066510
sub_02066510: ; 0x02066510
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r0, _02066874 ; =_020B0B24
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02066868
_02066530: ; jump table
	b _02066544 ; case 0
	b _02066640 ; case 1
	b _02066700 ; case 2
	b _02066708 ; case 3
	b _02066724 ; case 4
_02066544:
	mov r2, #0
	add r1, r1, #0xa4
	mov r0, r2
_02066550:
	strb r0, [r1, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _02066550
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0x98
	ldr r0, [r0, #4]
	add r0, r0, #0xc
	bl MemZero
	ldr r0, _02066874 ; =_020B0B24
	ldr r2, [r0, #4]
	add r1, r2, #0xa4
	str r1, [r2, #0x6c]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020665B4
	ldr r4, _02066878 ; =JOB_MENU_ITEMS_1
	bl sub_0205E954
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	streqb r1, [r0, #0xa4]
	b _020665D8
_020665B4:
	cmp r0, #1
	bne _020665D8
	ldr r4, _0206687C ; =JOB_MENU_ITEMS_2
	bl sub_0205EAC8
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	streqb r1, [r0, #0xa4]
_020665D8:
	bl CountJobListMissions
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	ldr r3, _02066874 ; =_020B0B24
	streqb r1, [r0, #0xa5]
	ldrsb r2, [r3]
	ldr ip, [r3, #4]
	mov r1, #0
	add r2, r4, r2, lsl #3
	ldr lr, [r2, #4]
	ldr r0, _02066880 ; =JOB_WINDOW_PARAMS_1
	str lr, [ip, #0xc]
	str r4, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r3, #4]
	ldr r2, _02066884 ; =0x00000233
	add r3, r3, #0xc
	bl sub_02046A20
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_02066640:
	bl sub_02046B04
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	moveq r4, #4
	beq _02066674
	sub r0, r1, #1
	cmp r4, r0
	moveq r4, #4
	beq _02066674
	add r0, r1, #1
	cmp r4, r0
	moveq r4, #0
_02066674:
	bl sub_02046BA0
	ldr r1, _02066874 ; =_020B0B24
	cmp r4, #1
	strb r0, [r1]
	bne _020666A4
	ldr r0, [r1, #4]
	mov r2, #0xa
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666A4:
	cmp r4, #2
	bne _020666C8
	ldr r0, [r1, #4]
	mov r2, #0xb
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666C8:
	cmp r4, #3
	bne _020666EC
	ldr r0, [r1, #4]
	mov r2, #0xe
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666EC:
	cmp r4, #4
	ldreq r0, [r1, #4]
	moveq r1, #2
	streq r1, [r0]
	b _02066868
_02066700:
	mov r0, #1
	b _0206686C
_02066708:
	ldr r0, [r1, #4]
	bl sub_020668B4
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_02066724:
	bl sub_02066A44
	movs r4, r0
	beq _02066868
	bl sub_02067664
	add r0, r4, #1
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _02066868
_02066744: ; jump table
	b _02066858 ; case 0
	b _02066868 ; case 1
	b _020667A4 ; case 2
	b _02066868 ; case 3
	b _020667B8 ; case 4
	b _020667C0 ; case 5
	b _020667C8 ; case 6
	b _020667D0 ; case 7
	b _020667D8 ; case 8
	b _020667E0 ; case 9
	b _020667E8 ; case 10
	b _020667F0 ; case 11
	b _020667F8 ; case 12
	b _02066800 ; case 13
	b _02066808 ; case 14
	b _02066810 ; case 15
	b _02066818 ; case 16
	b _02066820 ; case 17
	b _02066828 ; case 18
	b _02066830 ; case 19
	b _02066838 ; case 20
	b _02066840 ; case 21
	b _02066848 ; case 22
	b _02066850 ; case 23
_020667A4:
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_020667B8:
	mov r0, #2
	b _0206686C
_020667C0:
	mov r0, #3
	b _0206686C
_020667C8:
	mov r0, #4
	b _0206686C
_020667D0:
	mov r0, #5
	b _0206686C
_020667D8:
	mov r0, #6
	b _0206686C
_020667E0:
	mov r0, #7
	b _0206686C
_020667E8:
	mov r0, #8
	b _0206686C
_020667F0:
	mov r0, #9
	b _0206686C
_020667F8:
	mov r0, #0xa
	b _0206686C
_02066800:
	mov r0, #0xb
	b _0206686C
_02066808:
	mov r0, #0xc
	b _0206686C
_02066810:
	mov r0, #0xd
	b _0206686C
_02066818:
	mov r0, #0xe
	b _0206686C
_02066820:
	mov r0, #0xf
	b _0206686C
_02066828:
	mov r0, #0x10
	b _0206686C
_02066830:
	mov r0, #0x11
	b _0206686C
_02066838:
	mov r0, #0x12
	b _0206686C
_02066840:
	mov r0, #0x13
	b _0206686C
_02066848:
	mov r0, #0x14
	b _0206686C
_02066850:
	mov r0, #0x15
	b _0206686C
_02066858:
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0]
_02066868:
	mov r0, #0
_0206686C:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02066874: .word _020B0B24
_02066878: .word JOB_MENU_ITEMS_1
_0206687C: .word JOB_MENU_ITEMS_2
_02066880: .word JOB_WINDOW_PARAMS_1
_02066884: .word 0x00000233
	arm_func_end sub_02066510

	arm_func_start sub_02066888
sub_02066888: ; 0x02066888
	stmdb sp!, {r3, lr}
	ldr r0, _020668B0 ; =_020B0B24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _020668B0 ; =_020B0B24
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020668B0: .word _020B0B24
	arm_func_end sub_02066888

	arm_func_start sub_020668B4
sub_020668B4: ; 0x020668B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	sub r0, r5, #0x13
	cmp r0, #2
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
	ldr r0, _02066988 ; =0x00000EF8
	mov r1, #8
	bl MemAlloc
	ldr r2, _0206698C ; =_020B0B2C
	ldr r1, _02066988 ; =0x00000EF8
	str r0, [r2, #0x14]
	bl MemZero
	ldr r0, _0206698C ; =_020B0B2C
	mov r2, #0
	ldr r4, [r0, #0x14]
	mov r1, r2
_020668F8:
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #0x4c]
	cmp r2, #0x20
	blt _020668F8
	ldr r0, _0206698C ; =_020B0B2C
	ldr r0, [r0, #0x14]
	str r5, [r0, #4]
	str r1, [r4, #8]
	str r1, [r4, #0xef0]
	bl sub_020686F4
	mov r2, #0
	str r2, [r4, #0x74]
	sub r1, r2, #1
	str r1, [r4, #0x78]
	cmp r0, #0
	bne _0206695C
	bl sub_020692B4
	ldr r0, _0206698C ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r1, _0206698C ; =_020B0B2C
	mov r0, #0
	str r0, [r1, #0x14]
	ldmia sp!, {r3, r4, r5, pc}
_0206695C:
	sub r0, r2, #2
	strb r0, [r4, #0x7d]
	bl sub_020692FC
	mvn r1, #1
	ldr r0, _0206698C ; =_020B0B2C
	strb r1, [r4, #0xd85]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02066988: .word 0x00000EF8
_0206698C: .word _020B0B2C
	arm_func_end sub_020668B4

	arm_func_start sub_02066990
sub_02066990: ; 0x02066990
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r0, _02066A3C ; =0x00000EF8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	ldr r2, _02066A40 ; =_020B0B2C
	ldr r1, _02066A3C ; =0x00000EF8
	str r0, [r2, #0x14]
	bl MemZero
	ldr r0, _02066A40 ; =_020B0B2C
	mov r1, #0
	ldr r4, [r0, #0x14]
	str r8, [r4, #4]
	str r7, [r4, #0x74]
	str r6, [r4, #0x6c]
	str r5, [r4, #0x78]
	str r1, [r4, #8]
	str r1, [r4, #0xef0]
	bl sub_020686F4
	cmp r0, #0
	bne _02066A10
	bl sub_020692B4
	ldr r0, _02066A40 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r1, _02066A40 ; =_020B0B2C
	mov r0, #0
	str r0, [r1, #0x14]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02066A10:
	mvn r0, #1
	strb r0, [r4, #0x7d]
	bl sub_020692FC
	mvn r1, #1
	ldr r0, _02066A40 ; =_020B0B2C
	strb r1, [r4, #0xd85]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02066A3C: .word 0x00000EF8
_02066A40: .word _020B0B2C
	arm_func_end sub_02066990

	arm_func_start sub_02066A44
sub_02066A44: ; 0x02066A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r6, [r0, #0x14]
	ldr r0, [r6]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02067494
_02066A64: ; jump table
	b _02066A80 ; case 0
	b _02066B08 ; case 1
	b _02066DA4 ; case 2
	b _02066DAC ; case 3
	b _020672F4 ; case 4
	b _02067374 ; case 5
	b _02067474 ; case 6
_02066A80:
	bl sub_020691B8
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #1
	ldr r1, [r0, #0x14]
	str r2, [r1]
	ldr r1, [r6, #0xee4]
	cmp r1, #0
	bne _02066AF4
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	sub r0, r0, #0xa
	cmp r0, #3
	bhi _02066AC8
	add r0, r1, #0x2e4
	ldr r1, _020674A4 ; =_020A92A8
	ldr r2, _020674A8 ; =sub_020696E8
	add r0, r0, #0xc00
	bl sub_0204707C
_02066AC8:
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	cmp r0, #0xe
	bne _02067494
	add r0, r1, #0x2e4
	ldr r1, _020674A4 ; =_020A92A8
	ldr r2, _020674AC ; =sub_02069750
	add r0, r0, #0xc00
	bl sub_0204707C
	b _02067494
_02066AF4:
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047188
	b _02067494
_02066B08:
	ldrsb r0, [r6, #0x7d]
	bl GetWindowIdSelectedMenuItemIdx
	ldr r1, [r6, #0xef0]
	mov r4, r0
	cmp r1, #0
	strneb r4, [r1]
	ldrsb r0, [r6, #0x7d]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _02066D68
	ldrsb r0, [r6, #0x7d]
	bl sub_0202C75C
	movs r5, r0
	bpl _02066BAC
	mov r2, #0
	mov r1, r2
	b _02066B58
_02066B4C:
	add r0, r6, r2
	strb r1, [r0, #0x4c]
	add r2, r2, #1
_02066B58:
	ldr r0, [r6, #0x6c]
	cmp r2, r0
	blt _02066B4C
	mvn r0, #0
	str r0, [r6, #8]
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	sub r0, r0, #0xa
	cmp r0, #3
	bhi _02066BA4
	bl sub_0205F5A8
	bl sub_0205F710
_02066BA4:
	mvn r0, #0
	b _02067498
_02066BAC:
	bl sub_020674E8
	cmp r0, #0
	beq _02066BE8
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	sub r0, r0, #0x12
	cmp r0, #1
	bhi _02066D68
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02066D68
_02066BE8:
	ldr r3, [r6, #8]
	cmp r3, r5
	bne _02066D64
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r2, [r1, #4]
	cmp r2, #0xe
	cmpne r2, #0xf
	cmpne r2, #0x11
	moveq r0, #2
	streq r0, [r1]
	beq _02066D68
	sub r1, r2, #0xa
	cmp r1, #3
	bhi _02066CF4
	bl CountJobListMissions
	cmp r0, #8
	bge _02066CEC
	ldr r1, _020674A0 ; =_020B0B2C
	mov r0, #0
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #4]
	sub r1, r1, #0xa
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02066CCC
_02066C50: ; jump table
	b _02066C60 ; case 0
	b _02066C7C ; case 1
	b _02066C98 ; case 2
	b _02066CB4 ; case 3
_02066C60:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	b _02066CCC
_02066C7C:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	b _02066CCC
_02066C98:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	b _02066CCC
_02066CB4:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
_02066CCC:
	bl AddMissionToJobList
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047188
_02066CEC:
	bl sub_020691B8
	b _02066D68
_02066CF4:
	cmp r2, #0x10
	bne _02066D04
	bl sub_020691B8
	b _02066D68
_02066D04:
	sub r1, r2, #0x12
	cmp r1, #1
	bhi _02066D30
	add r1, r6, r3
	mov r2, #1
	strb r2, [r1, #0x4c]
	ldr r0, [r0, #0x14]
	mov r1, #2
	str r1, [r0]
	bl sub_020692B4
	b _02066D68
_02066D30:
	cmp r2, #9
	cmpne r2, #0x14
	cmpne r2, #4
	bne _02066D58
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02066D68
_02066D58:
	bl sub_020692B4
	mov r0, #1
	b _02067498
_02066D64:
	bl sub_020691B8
_02066D68:
	bl sub_020698B8
	cmp r0, #0
	beq _02066D90
	cmp r4, #0
	blt _02066D90
	ldr r0, [r6, #8]
	cmp r0, r4
	beq _02066D90
	str r4, [r6, #8]
	bl sub_0206937C
_02066D90:
	ldr r0, [r6, #0xee4]
	cmp r0, #0
	beq _02067494
	bl sub_020470D0
	b _02067494
_02066DA4:
	bl sub_02067708
	b _02067494
_02066DAC:
	bl sub_02046B04
	bl sub_02068308
	ldr r1, [r6, #0xef4]
	mov r4, r0
	cmp r1, #0
	beq _02066DD0
	bl sub_02046BA0
	ldr r1, [r6, #0xef4]
	strb r0, [r1]
_02066DD0:
	cmp r4, #1
	bne _02066E00
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #9
	bne _02066DF4
	bl sub_0206955C
	bl sub_02046D20
_02066DF4:
	bl sub_020692B4
	mov r0, #1
	b _02067498
_02066E00:
	cmp r4, #2
	bne _02066EDC
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #0xa
	bne _02066E3C
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	bl AddMissionToJobList
	b _02066EC0
_02066E3C:
	cmp r0, #0xb
	bne _02066E64
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	bl AddMissionToJobList
	b _02066EC0
_02066E64:
	cmp r0, #0xc
	bne _02066E8C
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	bl AddMissionToJobList
	b _02066EC0
_02066E8C:
	cmp r0, #0xd
	bne _02066EB4
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	bl AddMissionToJobList
	b _02066EC0
_02066EB4:
	cmp r0, #0x14
	moveq r0, #1
	beq _02067498
_02066EC0:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066EDC:
	cmp r4, #3
	bne _02066EF4
	bl sub_02067C8C
	cmp r0, #0
	beq _02067494
	b _02067498
_02066EF4:
	cmp r4, #4
	bne _02066F44
	bl sub_02046BB4
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, #4
	strb r1, [r0]
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066F44:
	cmp r4, #5
	bne _02067020
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #0x11
	bne _02066F84
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	mov r0, #1
	b _02067498
_02066F84:
	cmp r0, #0x12
	moveq r0, #1
	beq _02067498
	cmp r0, #0xe
	bne _02066FB4
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #4
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066FB4:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	bl CountJobListMissions
	cmp r0, #0
	bne _02066FFC
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	mvn r0, #0
	b _02067498
_02066FFC:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #0
	ldr r1, [r0, #0x14]
	mov r0, #1
	str r2, [r1]
	strb r0, [r6, #0xd84]
	b _02067494
_02067020:
	cmp r4, #6
	bne _020670F4
	ldr r3, [r6, #0x70]
	mov r1, #1
	add r0, r6, r3
	strb r1, [r0, #0x4c]
	add r2, r3, #1
	ldr r1, [r6, #0x6c]
	b _0206705C
_02067044:
	add r0, r6, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r6, #0x70]
	bne _02067064
	add r2, r2, #1
_0206705C:
	cmp r2, r1
	blt _02067044
_02067064:
	ldr r0, [r6, #0x70]
	cmp r0, r3
	bne _020670A0
	bl sub_020674E8
	cmp r0, #0
	bne _02067098
	bl sub_02046D20
	mov r1, #0
	ldr r0, _020674A0 ; =_020B0B2C
	str r1, [r6, #8]
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067098:
	mov r0, #2
	b _02067498
_020670A0:
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, _020674B0 ; =_020A937C
	ldrsb r3, [r0, #0xd]
	ldr r0, _020674B4 ; =_020B0B39
	ldr r2, _020674B8 ; =JOB_MENU_ITEMS_11
	ldr r1, [r1, r3, lsl #3]
	add r3, r6, #0x248
	str r1, [r6, #0xe48]
	str r0, [r6, #0xef4]
	mov r0, #0
	ldr r1, _020674BC ; =0x00003878
	str r2, [sp]
	str r1, [sp, #4]
	ldr r2, _020674C0 ; =0x00000233
	mov r1, r0
	add r3, r3, #0xc00
	str r0, [sp, #8]
	bl sub_02046A20
	b _02067494
_020670F4:
	sub r0, r4, #7
	cmp r0, #1
	bhi _02067494
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	cmp r0, #0x11
	bne _02067134
	bl sub_02046D20
	ldr r1, [r6, #8]
	ldr r0, _020674A0 ; =_020B0B2C
	str r1, [r6, #0xd88]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	b _02067494
_02067134:
	cmp r0, #0x13
	bne _02067210
	ldr r3, [r6, #0x70]
	mov r1, #0
	add r0, r6, r3
	strb r1, [r0, #0x4c]
	mov r2, r3
	ldr r1, [r6, #0x6c]
	b _02067170
_02067158:
	add r0, r6, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r6, #0x70]
	bne _02067178
	add r2, r2, #1
_02067170:
	cmp r2, r1
	blt _02067158
_02067178:
	ldr r0, [r6, #0x70]
	cmp r0, r3
	bne _020671BC
	bl sub_020674E8
	cmp r0, #0
	bne _020671B4
	bl sub_02046D20
	mov r0, #0
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020671B4:
	mov r0, #2
	b _02067498
_020671BC:
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, _020674B0 ; =_020A937C
	ldrsb r3, [r0, #0xd]
	ldr r0, _020674B4 ; =_020B0B39
	ldr r2, _020674B8 ; =JOB_MENU_ITEMS_11
	ldr r1, [r1, r3, lsl #3]
	add r3, r6, #0x248
	str r1, [r6, #0xe48]
	str r0, [r6, #0xef4]
	mov r0, #0
	ldr r1, _020674BC ; =0x00003878
	str r2, [sp]
	str r1, [sp, #4]
	ldr r2, _020674C0 ; =0x00000233
	mov r1, r0
	add r3, r3, #0xc00
	str r0, [sp, #8]
	bl sub_02046A20
	b _02067494
_02067210:
	cmp r0, #9
	bne _02067234
	bl sub_0206955C
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067234:
	cmp r0, #4
	bne _02067254
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067254:
	cmp r0, #0x12
	bne _02067298
	mov r2, #0
	mov r1, r2
	b _02067274
_02067268:
	add r0, r6, r2
	strb r1, [r0, #0x4c]
	add r2, r2, #1
_02067274:
	ldr r0, [r6, #0x6c]
	cmp r2, r0
	blt _02067268
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067298:
	cmp r0, #0x14
	bne _020672B8
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020672B8:
	cmp r0, #0xe
	bne _020672E8
	bl sub_02046BB4
	cmp r4, #7
	bne _020672D4
	mov r0, #0
	bl PlaySeVolumeWrapper
_020672D4:
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020672E8:
	mov r0, #0
	str r0, [r1]
	b _02067494
_020672F4:
	mov r0, #0
	ldr r5, _020674C4 ; =_020A9268
	bl sub_02046D2C
	str r0, [r6, #0xee8]
	mov r0, #0
	bl sub_020474A0
	str r0, [r6, #0xeec]
	bl sub_020469BC
	bl sub_02068338
	ldr r0, _020674A0 ; =_020B0B2C
	add r3, r6, #0x248
	ldr r0, [r0, #0x14]
	mov r1, #0
	ldr r0, [r0, #4]
	ldr r2, _020674C0 ; =0x00000233
	cmp r0, #0xe
	moveq r0, #7
	streq r0, [r6, #0xe48]
	moveq r0, #0
	streq r0, [r6, #0xef4]
	ldreq r4, _020674C8 ; =JOB_MENU_ITEMS_4
	mov r0, r5
	str r4, [sp]
	str r1, [sp, #4]
	add r3, r3, #0xc00
	str r1, [sp, #8]
	bl sub_02046A20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #5
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067374:
	bl sub_02046B04
	bl sub_02068308
	ldr r1, [r6, #0xef4]
	mov r4, r0
	cmp r1, #0
	beq _02067398
	bl sub_02046BA0
	ldr r1, [r6, #0xef4]
	strb r0, [r1]
_02067398:
	cmp r4, #5
	bne _02067430
	bl sub_020469E8
	ldr r0, [r6, #0xee8]
	bl sub_02046D2C
	ldr r0, [r6, #0xeec]
	bl sub_020474A0
	mov r0, #0
	str r0, [r6, #0xee8]
	str r0, [r6, #0xeec]
	bl sub_02046BB4
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	bl CountJobListMissions
	cmp r0, #0
	bne _0206740C
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	mvn r0, #0
	b _02067498
_0206740C:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #0
	ldr r1, [r0, #0x14]
	mov r0, #1
	str r2, [r1]
	strb r0, [r6, #0xd84]
	b _02067494
_02067430:
	sub r0, r4, #7
	cmp r0, #1
	bhi _02067494
	bl sub_020469E8
	ldr r0, [r6, #0xee8]
	bl sub_02046D2C
	ldr r0, [r6, #0xeec]
	bl sub_020474A0
	mov r0, #0
	str r0, [r6, #0xee8]
	str r0, [r6, #0xeec]
	bl sub_02046BB4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067474:
	bl sub_02046C78
	cmp r0, #0
	beq _02067494
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
_02067494:
	mov r0, #0
_02067498:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020674A0: .word _020B0B2C
_020674A4: .word _020A92A8
_020674A8: .word sub_020696E8
_020674AC: .word sub_02069750
_020674B0: .word _020A937C
_020674B4: .word _020B0B39
_020674B8: .word JOB_MENU_ITEMS_11
#if defined(EUROPE)
_020674BC: .word 0x0000387A
#elif defined(JAPAN)
_020674BC: .word 0x000034B6
#else
_020674BC: .word 0x00003878
#endif
_020674C0: .word 0x00000233
_020674C4: .word _020A9268
_020674C8: .word JOB_MENU_ITEMS_4
	arm_func_end sub_02066A44

	arm_func_start sub_020674CC
sub_020674CC: ; 0x020674CC
	ldr r0, _020674E4 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #8]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	bx lr
	.align 2, 0
_020674E4: .word _020B0B2C
	arm_func_end sub_020674CC

	arm_func_start sub_020674E8
sub_020674E8: ; 0x020674E8
	ldr r0, _02067520 ; =_020B0B2C
	mov ip, #0
	ldr r2, [r0, #0x14]
	mov r0, ip
	ldr r3, [r2, #0x6c]
	b _02067514
_02067500:
	add r1, r2, ip
	ldrb r1, [r1, #0x4c]
	add ip, ip, #1
	cmp r1, #0
	addne r0, r0, #1
_02067514:
	cmp ip, r3
	blt _02067500
	bx lr
	.align 2, 0
_02067520: .word _020B0B2C
	arm_func_end sub_020674E8

	arm_func_start sub_02067524
sub_02067524: ; 0x02067524
	stmdb sp!, {r4, lr}
	mov lr, #0
	mov r4, lr
	ldr r2, _02067580 ; =_020B0B2C
	b _02067568
_02067538:
	cmp lr, r1
	movge r0, #0
	ldmgeia sp!, {r4, pc}
	add r3, ip, r4
	ldrb r3, [r3, #0x4c]
	cmp r3, #0
	addne r3, ip, r4, lsl #1
	ldrnesh ip, [r3, #0xc]
	movne r3, lr, lsl #1
	addne lr, lr, #1
	strneh ip, [r0, r3]
	add r4, r4, #1
_02067568:
	ldr ip, [r2, #0x14]
	ldr r3, [ip, #0x6c]
	cmp r4, r3
	blt _02067538
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02067580: .word _020B0B2C
	arm_func_end sub_02067524

	arm_func_start sub_02067584
sub_02067584: ; 0x02067584
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _02067658
_02067598: ; jump table
	b _020675E8 ; case 0
	b _020675E8 ; case 1
	b _020675E8 ; case 2
	b _020675E8 ; case 3
	b _020675E8 ; case 4
	b _020675E8 ; case 5
	b _020675E8 ; case 6
	b _020675E8 ; case 7
	b _02067658 ; case 8
	b _020675E8 ; case 9
	b _020675E8 ; case 10
	b _020675E8 ; case 11
	b _020675E8 ; case 12
	b _020675E8 ; case 13
	b _02067638 ; case 14
	b _02067638 ; case 15
	b _02067638 ; case 16
	b _02067604 ; case 17
	b _020675E8 ; case 18
	b _02067650 ; case 19
_020675E8:
	add r1, sp, #0
	bl sub_02068390
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067604:
	bl sub_0204E210
	cmp r0, #1
	bne _02067638
	bl CountJobListMissions
	mov r4, r0
	bl GetAdventureLogDungeonFloor
	ldrb r0, [r0]
	bl DungeonRequestsDoneWrapper
	subs r0, r4, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067638:
	bl CountJobListMissions
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067650:
	mov r0, #0
	b _0206765C
_02067658:
	mov r0, #1
_0206765C:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	arm_func_end sub_02067584

	arm_func_start sub_02067664
sub_02067664: ; 0x02067664
	stmdb sp!, {r3, lr}
	ldr r0, _020676A8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	bl sub_02069904
	bl sub_020692B4
	ldr r0, _020676A8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r0, _020676A8 ; =_020B0B2C
	mov r1, #0
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020676A8: .word _020B0B2C
	arm_func_end sub_02067664

	arm_func_start sub_020676AC
sub_020676AC: ; 0x020676AC
	ldr r0, _02067704 ; =_020B0B2C
	mov r1, #0
	strb r1, [r0, #0x10]
	strb r1, [r0, #0xe]
	strb r1, [r0, #9]
	strb r1, [r0, #8]
	strb r1, [r0, #6]
	strb r1, [r0, #0xb]
	strb r1, [r0, #4]
	strb r1, [r0, #0xd]
	strb r1, [r0, #7]
	strb r1, [r0, #3]
	strb r1, [r0, #2]
	strb r1, [r0, #5]
	strb r1, [r0, #1]
	strb r1, [r0]
	strb r1, [r0, #0x13]
	strb r1, [r0, #0x12]
	strb r1, [r0, #0x11]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xf]
	bx lr
	.align 2, 0
_02067704: .word _020B0B2C
	arm_func_end sub_020676AC

	arm_func_start sub_02067708
sub_02067708: ; 0x02067708
#if defined(EUROPE)
#define SUB_02067708_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02067708_WORD_OFFSET -0x3C2
#else
#define SUB_02067708_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x5c
	ldr r1, _02067C00 ; =_020B0B2C
	mov r6, #0
	add r0, sp, #0xc
	mov sb, r6
	ldr r4, [r1, #0x14]
	ldr r7, _02067C04 ; =_020A9298
	ldr r8, _02067C08 ; =0x00000233
	bl InitPreprocessorArgs
	bl sub_02068338
	ldr r1, _02067C00 ; =_020B0B2C
	ldr r0, [r1, #0x14]
	ldr r2, [r0, #4]
	sub r2, r2, #4
	cmp r2, #0x10
	addls pc, pc, r2, lsl #2
	b _02067BC4
_02067750: ; jump table
	b _02067AF8 ; case 0
	b _02067BC4 ; case 1
	b _02067BC4 ; case 2
	b _02067BC4 ; case 3
	b _02067BC4 ; case 4
	b _02067A80 ; case 5
	b _02067794 ; case 6
	b _020677F0 ; case 7
	b _0206784C ; case 8
	b _020678A8 ; case 9
	b _02067904 ; case 10
	b _020679E0 ; case 11
	b _02067BC4 ; case 12
	b _02067A50 ; case 13
	b _02067B20 ; case 14
	b _02067B3C ; case 15
	b _02067BA0 ; case 16
_02067794:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020677C4
	bl CountJobListMissions
	cmp r0, #8
	blt _020677CC
_020677C4:
	mov r0, #3
	strb r0, [r4, #0xee0]
_020677CC:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #0x10]
	ldr r0, _02067C10 ; =_020B0B3C
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020677F0:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	bl AlreadyHaveMission
	cmp r0, #0
	bne _02067820
	bl CountJobListMissions
	cmp r0, #8
	blt _02067828
_02067820:
	mov r0, #3
	strb r0, [r4, #0xee0]
_02067828:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #0xe]
	ldr r0, _02067C18 ; =_020B0B3A
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_0206784C:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	bl AlreadyHaveMission
	cmp r0, #0
	bne _0206787C
	bl CountJobListMissions
	cmp r0, #8
	blt _02067884
_0206787C:
	mov r0, #3
	strb r0, [r4, #0xee0]
_02067884:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #9]
	ldr r0, _02067C1C ; =_020B0B35
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020678A8:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020678D8
	bl CountJobListMissions
	cmp r0, #8
	blt _020678E0
_020678D8:
	mov r0, #3
	strb r0, [r4, #0xee0]
_020678E0:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #8]
	ldr r0, _02067C20 ; =_020B0B34
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067904:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r5, r0
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	ldrb r0, [r5]
	orr r8, r8, #0x400000
	orr r8, r8, #0x80000000
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0206798C
_02067940: ; jump table
	b _0206798C ; case 0
	b _02067954 ; case 1
	b _02067954 ; case 2
	b _02067954 ; case 3
	b _02067954 ; case 4
_02067954:
	mov r0, r5
	bl sub_0205ECF4
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4, #0xee0]
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C24 ; =_020A9394
	ldrsb r2, [r0, #6]
	ldr r0, _02067C28 ; =_020B0B32
	ldr r5, _02067C2C ; =JOB_MENU_ITEMS_12
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_0206798C:
	ldrb r1, [r5, #1]
	cmp r1, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	moveq r0, #3
	streqb r0, [r4, #0xee0]
	beq _020679BC
	cmp r1, #6
	ldreqb r0, [r5, #2]
	cmpeq r0, #4
	moveq r0, #3
	streqb r0, [r4, #0xee0]
_020679BC:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C30 ; =_020A93B4
	ldrsb r2, [r0, #6]
	ldr r0, _02067C28 ; =_020B0B32
	ldr r5, _02067C34 ; =JOB_MENU_ITEMS_13
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020679E0:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r0, [r0]
	cmp r0, #4
	beq _02067A2C
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r0, [r0]
	cmp r0, #1
	movne r0, #3
	strneb r0, [r4, #0xee0]
_02067A2C:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C38 ; =_020A92EC
	ldrsb r2, [r0, #0xb]
	ldr r0, _02067C3C ; =_020B0B37
	ldr r5, _02067C40 ; =JOB_MENU_ITEMS_5
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067A50:
	ldr r5, _02067C44 ; =JOB_MENU_ITEMS_7
	ldr r6, _02067C48 ; =0x000037B0
	mov r7, sb
	bl sub_020692B4
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C4C ; =_020A931C
	ldrsb r2, [r0, #4]
	ldr r0, _02067C50 ; =_020B0B30
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067A80:
	sub r1, r8, #0x100
	str r1, [sp, #0xc]
	add r1, r0, #0xd00
	mov r7, r6
	ldrsb r2, [r1, #0x85]
	sub r1, r7, #2
	ldr r5, _02067C54 ; =JOB_MENU_ITEMS_3
	cmp r2, r1
	ldreq r0, [r0, #4]
	ldr r6, _02067C58 ; =0x0000380C
	mov sb, #0x1000
	cmpeq r0, #9
	bne _02067AE4
	mov r0, r7
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _02067C00 ; =_020B0B2C
	ldr r1, _02067C5C ; =_020A9278
	ldr r3, [r2, #0x14]
	strb r0, [r3, #0xd85]
	ldr r0, [r2, #0x14]
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0x85]
	bl ShowPortraitInPortraitBox
_02067AE4:
	ldr r1, [r5, #0xc]
	mov r0, #0
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067AF8:
	ldrsb r2, [r1, #0xc]
	ldr r1, _02067C60 ; =_020A9304
	ldr r0, _02067C64 ; =_020B0B38
	ldr r1, [r1, r2, lsl #3]
	ldr r5, _02067C68 ; =JOB_MENU_ITEMS_6
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
#ifdef NORTH_AMERICA
	rsb r6, r8, #0x3a40
#else
	ldr r6, _02067FF0 ; =0x0000380F
#endif
	mov r7, sb
	b _02067BC4
_02067B20:
	mov r0, #7
	mov r7, r6
	str r0, [r4, #0xe48]
	str r7, [r4, #0xef4]
	ldr r5, _02067C6C ; =JOB_MENU_ITEMS_9
	ldr r6, _02067C70 ; =0x000038BF
	b _02067BC4
_02067B3C:
	ldr r1, [r4, #0x6c]
	ldr r5, _02067C74 ; =JOB_MENU_ITEMS_11
	ldr r6, _02067C78 ; =0x00003878
	mov r2, sb
	b _02067B68
_02067B50:
	add r0, r4, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r4, #0x70]
	bne _02067B70
	add r2, r2, #1
_02067B68:
	cmp r2, r1
	blt _02067B50
_02067B70:
	ldr r0, [r4, #0x70]
	mov r7, #0
	str r0, [r4, #8]
	bl sub_0206937C
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C7C ; =_020B0B39
	ldrsb r0, [r0, #0xd]
	add r0, r5, r0, lsl #3
	ldr r0, [r0, #4]
	str r0, [r4, #0xe48]
	str r1, [r4, #0xef4]
	b _02067BC4
_02067BA0:
	ldrsb r2, [r1, #7]
	ldr r1, _02067C80 ; =_020A9334
	ldr r0, _02067C84 ; =_020B0B33
	ldr r1, [r1, r2, lsl #3]
	ldr r5, _02067C88 ; =JOB_MENU_ITEMS_8
	str r1, [r4, #0xe48]
#ifdef NORTH_AMERICA
	add r6, r8, #0x3580
#else
	ldr r6, _02068014 ; =0x000037B5
#endif
	str r0, [r4, #0xef4]
	mov r7, sb
_02067BC4:
	add r3, r4, #0x248
	stmia sp, {r5, r6}
	add r4, sp, #0xc
	mov r0, r7
	mov r1, sb
	mov r2, r8
	add r3, r3, #0xc00
	str r4, [sp, #8]
	bl sub_02046A20
	ldr r0, _02067C00 ; =_020B0B2C
	mov r1, #3
	ldr r0, [r0, #0x14]
	str r1, [r0]
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02067C00: .word _020B0B2C
_02067C04: .word _020A9298
_02067C08: .word 0x00000233
_02067C0C: .word _020A9364
_02067C10: .word _020B0B3C
_02067C14: .word JOB_MENU_ITEMS_10
_02067C18: .word _020B0B3A
_02067C1C: .word _020B0B35
_02067C20: .word _020B0B34
_02067C24: .word _020A9394
_02067C28: .word _020B0B32
_02067C2C: .word JOB_MENU_ITEMS_12
_02067C30: .word _020A93B4
_02067C34: .word JOB_MENU_ITEMS_13
_02067C38: .word _020A92EC
_02067C3C: .word _020B0B37
_02067C40: .word JOB_MENU_ITEMS_5
_02067C44: .word JOB_MENU_ITEMS_7
#ifdef JAPAN
_02067C48: .word 0x00003432
#else
_02067C48: .word 0x000037B0 + SUB_02067708_WORD_OFFSET
#endif
_02067C4C: .word _020A931C
_02067C50: .word _020B0B30
_02067C54: .word JOB_MENU_ITEMS_3
_02067C58: .word 0x0000380C + SUB_02067708_WORD_OFFSET
_02067C5C: .word _020A9278
_02067C60: .word _020A9304
_02067C64: .word _020B0B38
_02067C68: .word JOB_MENU_ITEMS_6
#if defined(EUROPE)
_02067FF0: .word 0x0000380F
#elif defined(JAPAN)
_02067FF0: .word 0x0000344B
#endif
_02067C6C: .word JOB_MENU_ITEMS_9
_02067C70: .word 0x000038BF + SUB_02067708_WORD_OFFSET
_02067C74: .word JOB_MENU_ITEMS_11
_02067C78: .word 0x00003878 + SUB_02067708_WORD_OFFSET
_02067C7C: .word _020B0B39
_02067C80: .word _020A9334
_02067C84: .word _020B0B33
_02067C88: .word JOB_MENU_ITEMS_8
#ifdef EUROPE
_02068014: .word 0x000037B5
#elif defined(JAPAN)
_02068014: .word 0x00003435
#endif
	arm_func_end sub_02067708

	arm_func_start sub_02067C8C
sub_02067C8C: ; 0x02067C8C
#if defined(EUROPE)
#define SUB_02067C8C_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02067C8C_WORD_OFFSET -0x3C2
#else
#define SUB_02067C8C_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x60
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r6, [r0, #0x14]
	bl sub_02046BB4
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r4, r0
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	mov r5, r0
	add r0, sp, #8
	str r0, [sp]
	ldrb r0, [r4, #1]
	add r1, r4, #2
	add r2, sp, #4
	add r3, sp, #0xc
	bl sub_0206276C
	ldrb r1, [r4, #1]
	cmp r1, #0xe
	ldreqb r0, [r4, #2]
	cmpeq r0, #1
	bne _02067E70
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _02067D3C
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _02067D3C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02067D7C
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02067D7C
_02067D3C:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682E4 ; =0x0000381F
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067D7C:
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #3
	bne _02067DCC
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682E8 ; =0x00003820
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067DCC:
	ldrb r0, [r4, #4]
	mov r4, #0
	sub r0, r0, #0x49
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02067E4C
_02067DE4: ; jump table
	b _02067E30 ; case 0
	b _02067E4C ; case 1
	b _02067E28 ; case 2
	b _02067E4C ; case 3
	b _02067E18 ; case 4
	b _02067E4C ; case 5
	b _02067E20 ; case 6
	b _02067E4C ; case 7
	b _02067E38 ; case 8
	b _02067E4C ; case 9
	b _02067E48 ; case 10
	b _02067E4C ; case 11
	b _02067E40 ; case 12
_02067E18:
	mov r4, #3
	b _02067E4C
_02067E20:
	mov r4, #4
	b _02067E4C
_02067E28:
	mov r4, #5
	b _02067E4C
_02067E30:
	mov r4, #6
	b _02067E4C
_02067E38:
	mov r4, #7
	b _02067E4C
_02067E40:
	mov r4, #8
	b _02067E4C
_02067E48:
	mov r4, #9
_02067E4C:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	mov r0, r4
	b _020682D8
_02067E70:
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	bne _02067FE0
	ldrb r0, [r4, #4]
	bl CheckDungeonMissionUnlockConditions
	cmp r0, #1
	bne _02067ED0
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef NORTH_AMERICA
	mov r0, #0x1c
	rsb r1, r0, #0x3840
#else
	ldr r1, _02068678 ; =0x00003826
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067ED0:
	cmp r0, #0
	beq _02067F28
	add r0, sp, #0x10
	bl InitPreprocessorArgs
	ldrb r0, [r4, #4]
	str r0, [sp, #0x20]
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682EC ; =0x00003825
	add r2, sp, #0x10
	mov r0, #0x1c
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067F28:
	mov r0, r5
	mov r1, #3
	bl sub_0204D018
	mov r0, #5
	strb r0, [r4]
	ldrb r0, [r4, #4]
	sub r0, r0, #0x57
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02067FE0
_02067F50: ; jump table
	b _02067F80 ; case 0
	b _02067F88 ; case 1
	b _02067F90 ; case 2
	b _02067F98 ; case 3
	b _02067FA0 ; case 4
	b _02067FA8 ; case 5
	b _02067FB0 ; case 6
	b _02067FB8 ; case 7
	b _02067FC0 ; case 8
	b _02067FC8 ; case 9
	b _02067FD0 ; case 10
	b _02067FD8 ; case 11
_02067F80:
	mov r0, #0xa
	b _020682D8
_02067F88:
	mov r0, #0xb
	b _020682D8
_02067F90:
	mov r0, #0xc
	b _020682D8
_02067F98:
	mov r0, #0xd
	b _020682D8
_02067FA0:
	mov r0, #0xe
	b _020682D8
_02067FA8:
	mov r0, #0xf
	b _020682D8
_02067FB0:
	mov r0, #0x10
	b _020682D8
_02067FB8:
	mov r0, #0x11
	b _020682D8
_02067FC0:
	mov r0, #0x12
	b _020682D8
_02067FC8:
	mov r0, #0x13
	b _020682D8
_02067FD0:
	mov r0, #0x14
	b _020682D8
_02067FD8:
	mov r0, #0x15
	b _020682D8
_02067FE0:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	bne _02068158
	ldrb r1, [r4, #2]
	cmp r1, #1
	blo _02068158
	cmp r1, #5
	bhi _02068158
	add r1, r4, #2
	mov r2, #0xff
	bl CheckAcceptedMissionByTypeAndDungeon
	cmp r0, #0
	beq _02068054
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682F0 ; =0x00003821
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02068054:
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _02068090
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _02068090
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _020680D0
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _020680D0
_02068090:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef EUROPE
	mov r0, #0x1c
	rsb r1, r0, #0x3840
#else
	ldr r1, _020682F4 ; =0x00003822
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020680D0:
	ldrb r0, [r4, #2]
	cmp r0, #5
	bne _02068158
	mov r0, #0
	bl IsSpecialEpisodeBeaten
	cmp r0, #0
	bne _0206812C
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682F8 ; =0x00003823
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_0206812C:
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #3
	beq _02068158
	mov r0, r5
	mov r1, #3
	bl sub_0204D018
	mov r0, #5
	strb r0, [r4]
	mov r0, #0x16
	b _020682D8
_02068158:
	ldrb r1, [r4, #1]
	cmp r1, #6
	ldreqb r0, [r4, #2]
	cmpeq r0, #4
	bne _02068260
	ldrb r0, [r4, #4]
	bl CheckDungeonMissionUnlockConditions
	mov r6, r0
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _020681BC
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _020681BC
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _020681B4
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _020681BC
_020681B4:
	cmp r6, #1
	bne _020681FC
_020681BC:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef JAPAN
	mov r0, #0x1c
	rsb r1, r0, #0x3480
#else
	ldr r1, _020682FC ; =0x00003826
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020681FC:
	cmp r6, #0
	beq _02068244
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _02068300 ; =0x00003827
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02068244:
	mov r2, #5
	mov r0, r5
	mov r1, #3
	strb r2, [r4]
	bl sub_0204D018
	mov r0, #0xe
	b _020682D8
_02068260:
	cmp r1, #0xc
	beq _020682B8
	ldrb r0, [r4, #4]
	bl CanDungeonBeUsedForMission
	cmp r0, #0
	bne _020682B8
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _02068304 ; =0x00003828
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020682B8:
	mov r0, #5
	strb r0, [r4]
	bl sub_020686F4
	bl sub_0206937C
	ldr r1, _020682E0 ; =_020B0B2C
	mov r0, #0
	ldr r1, [r1, #0x14]
	str r0, [r1]
_020682D8:
	add sp, sp, #0x60
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020682E0: .word _020B0B2C
_020682E4: .word 0x0000381F + SUB_02067C8C_WORD_OFFSET
_020682E8: .word 0x00003820 + SUB_02067C8C_WORD_OFFSET
#if defined(EUROPE)
_02068678: .word 0x00003826
#elif defined(JAPAN)
_02068678: .word 0x00003462
#endif
_020682EC: .word 0x00003825 + SUB_02067C8C_WORD_OFFSET
_020682F0: .word 0x00003821 + SUB_02067C8C_WORD_OFFSET
#ifndef EUROPE
_020682F4: .word 0x00003822 + SUB_02067C8C_WORD_OFFSET
#endif
_020682F8: .word 0x00003823 + SUB_02067C8C_WORD_OFFSET
#ifndef JAPAN
_020682FC: .word 0x00003826 + SUB_02067C8C_WORD_OFFSET
#endif
_02068300: .word 0x00003827 + SUB_02067C8C_WORD_OFFSET
_02068304: .word 0x00003828 + SUB_02067C8C_WORD_OFFSET
	arm_func_end sub_02067C8C

	arm_func_start sub_02068308
sub_02068308: ; 0x02068308
	mvn r2, #1
	cmp r0, r2
	moveq r0, #8
	bxeq lr
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #8
	bxeq lr
	add r1, r2, #1
	cmp r0, r1
	moveq r0, #0
	bx lr
	arm_func_end sub_02068308

	arm_func_start sub_02068338
sub_02068338: ; 0x02068338
	stmdb sp!, {r3, lr}
	ldr r0, _0206838C ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	add r2, r0, #0xee0
	mov r0, r1
_02068350:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _02068350
	ldr r0, _0206838C ; =_020B0B2C
	mov r1, #0x98
	ldr r0, [r0, #0x14]
	add r0, r0, #0x248
	add r0, r0, #0xc00
	bl MemZero
	ldr r0, _0206838C ; =_020B0B2C
	ldr r1, [r0, #0x14]
	add r0, r1, #0xee0
	str r0, [r1, #0xea8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206838C: .word _020B0B2C
	arm_func_end sub_02068338

	arm_func_start sub_02068390
sub_02068390: ; 0x02068390
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	cmp r0, #0x12
	mov r4, #0
	addls pc, pc, r0, lsl #2
	b _020686E4
_020683AC: ; jump table
	b _020683F8 ; case 0
	b _02068468 ; case 1
	b _020684A0 ; case 2
	b _02068510 ; case 3
	b _020684D8 ; case 4
	b _02068548 ; case 5
	b _02068430 ; case 6
	b _02068580 ; case 7
	b _020686E4 ; case 8
	b _020684A0 ; case 9
	b _020685B8 ; case 10
	b _020685E8 ; case 11
	b _02068618 ; case 12
	b _02068634 ; case 13
	b _02068650 ; case 14
	b _020686E4 ; case 15
	b _020686E4 ; case 16
	b _020686E4 ; case 17
	b _02068680 ; case 18
_020683F8:
	ldr r1, _020686F0 ; =_020B0A54
	mov ip, r4
	mov r0, #0xb0
_02068404:
	mul r2, ip, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #0
	movne r2, r4, lsl #1
	strneh ip, [r5, r2]
	add ip, ip, #1
	addne r4, r4, #1
	cmp ip, #0x20
	blt _02068404
	b _020686E4
_02068430:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206843C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #6
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206843C
	b _020686E4
_02068468:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_02068474:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #1
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _02068474
	b _020686E4
_020684A0:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_020684AC:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #2
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _020684AC
	b _020686E4
_020684D8:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_020684E4:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #4
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _020684E4
	b _020686E4
_02068510:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206851C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #3
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206851C
	b _020686E4
_02068548:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_02068554:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #5
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _02068554
	b _020686E4
_02068580:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206858C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #7
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206858C
	b _020686E4
_020685B8:
	mov r6, r4
_020685BC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E984
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020685BC
	b _020686E4
_020685E8:
	mov r6, r4
_020685EC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EB00
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020685EC
	b _020686E4
_02068618:
	mov r0, r4
	bl sub_0205EBF0
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r5]
	addeq r4, r4, #1
	b _020686E4
_02068634:
	mov r0, r4
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r5]
	addeq r4, r4, #1
	b _020686E4
_02068650:
	mov r6, r4
_02068654:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl IsAcceptedMissionSlotEmpty
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _02068654
	b _020686E4
_02068680:
	sub r0, r4, #1
	strb r0, [sp]
	bl sub_0204E210
	cmp r0, #2
	bne _020686A8
	add r0, sp, #0
	bl sub_0204F1B4
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [sp]
_020686A8:
	ldrsb ip, [sp]
	ldr r1, _020686F0 ; =_020B0A54
	mov lr, #2
	mov r0, #0xb0
_020686B8:
	cmp ip, lr
	mulne r2, lr, r0
	ldrne r3, [r1]
	ldrneb r2, [r3, r2]
	cmpne r2, #0
	movne r2, r4, lsl #1
	strneh lr, [r5, r2]
	add lr, lr, #1
	addne r4, r4, #1
	cmp lr, #0x20
	blt _020686B8
_020686E4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020686F0: .word _020B0A54
	arm_func_end sub_02068390

	arm_func_start sub_020686F4
sub_020686F4: ; 0x020686F4
#if defined(EUROPE)
#define SUB_020686F4_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_020686F4_WORD_OFFSET -0x3C2
#else
#define SUB_020686F4_WORD_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	ldr r0, _02068E14 ; =_020B0B2C
	mov r4, #0
	ldr r7, [r0, #0x14]
	ldr r5, [r7, #4]
	cmp r5, #0x15
	addls pc, pc, r5, lsl #2
	b _02068E08
_02068718: ; jump table
	b _02068770 ; case 0
	b _02068770 ; case 1
	b _02068770 ; case 2
	b _02068770 ; case 3
	b _02068770 ; case 4
	b _02068770 ; case 5
	b _02068770 ; case 6
	b _02068770 ; case 7
	b _02068770 ; case 8
	b _02068770 ; case 9
	b _020688D0 ; case 10
	b _02068960 ; case 11
	b _020689F0 ; case 12
	b _02068A6C ; case 13
	b _02068AE8 ; case 14
	b _02068AE8 ; case 15
	b _02068AE8 ; case 16
	b _02068AE8 ; case 17
	b _02068770 ; case 18
	b _02068C48 ; case 19
	b _02068CA4 ; case 20
	b _02068D00 ; case 21
_02068770:
	add r1, r7, #0x188
	mov r0, r5
	add r4, r1, #0xc00
	bl sub_02067584
	cmp r0, #0
	movne r4, #0
	bne _02068E08
	ldr r0, _02068E14 ; =_020B0B2C
	add r1, r7, #0xc
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	bl sub_02068390
	str r0, [r7, #0x6c]
	mov r0, #0
	bl sub_0205B77C
	bl sub_02068E7C
	mov r1, #0
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	cmp r5, #9
	bgt _02068800
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020688C0
_020687D8: ; jump table
	b _020688C0 ; case 0
	b _020688C0 ; case 1
	b _02068838 ; case 2
	b _0206880C ; case 3
	b _0206880C ; case 4
	b _0206882C ; case 5
	b _020688C0 ; case 6
	b _020688C0 ; case 7
	b _020688C0 ; case 8
	b _02068838 ; case 9
_02068800:
	cmp r5, #0x12
	beq _02068858
	b _020688C0
_0206880C:
	ldr r0, _02068E14 ; =_020B0B2C
	ldr r1, _02068E1C ; =_020B0B2E
	ldrsb r2, [r0, #2]
	ldr r0, _02068E20 ; =0x00003815
	str r2, [r7, #8]
	str r1, [r7, #0xef0]
	strh r0, [r4, #8]
	b _020688C8
_0206882C:
	ldr r0, _02068E24 ; =0x00003817
	strh r0, [r4, #8]
	b _020688C8
_02068838:
	ldr r1, _02068E28 ; =0x00003816
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r4, #8]
	ldrsb r1, [r0, #5]
	ldr r0, _02068E2C ; =_020B0B31
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
	b _020688C8
_02068858:
	ldr r1, _02068E30 ; =0x00003818
	ldr r0, _02068E34 ; =sub_02069598
	strh r1, [r4, #8]
	str r0, [r7, #0xe40]
	mov r1, #1
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r7, #0x7c]
	ldrsb r1, [r0, #1]
	ldr r0, _02068E38 ; =_020B0B2D
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
	b _020688A4
_02068888:
	bl sub_020693EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _020688B0
	ldr r0, [r7, #8]
	sub r0, r0, #1
	str r0, [r7, #8]
_020688A4:
	ldr r0, [r7, #8]
	cmp r0, #0
	bgt _02068888
_020688B0:
	ldr r1, [r7, #8]
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r0, #1]
	b _020688C8
_020688C0:
	ldr r0, _02068E3C ; =0x00003F1E
	strh r0, [r4, #8]
_020688C8:
	mov r4, #1
	b _02068E08
_020688D0:
	add r0, r7, #0x188
	mov r6, r4
	add r5, r0, #0xc00
_020688DC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E984
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r6, [r0, #0xc]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020688DC
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205E970
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E44 ; =0x00003819
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0x12]
	ldr r0, _02068E48 ; =_020B0B3E
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068960:
	add r0, r7, #0x188
	mov r6, r4
	add r5, r0, #0xc00
_0206896C:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EB00
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r6, [r0, #0xc]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _0206896C
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EAE8
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E4C ; =0x0000381A
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0x11]
	ldr r0, _02068E50 ; =_020B0B3D
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_020689F0:
	add r1, r7, #0x188
	mov r0, r4
	add r5, r1, #0xc00
	bl sub_0205EBF0
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r7, #0xc]
	addeq r4, r4, #1
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EBD8
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E54 ; =0x0000381B
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0xa]
	ldr r0, _02068E58 ; =_020B0B36
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068A6C:
	add r1, r7, #0x188
	mov r0, r4
	add r5, r1, #0xc00
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r7, #0xc]
	addeq r4, r4, #1
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EC38
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E5C ; =0x0000381C
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0xf]
	ldr r0, _02068E60 ; =_020B0B3B
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068AE8:
	add r0, r7, #0x188
	cmp r5, #0x11
	add r8, r0, #0xc00
	bne _02068B74
	bl sub_0204E210
	cmp r0, #1
	bne _02068B74
	mov r6, r4
_02068B08:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r6, lsl #0x18
	mov r5, r0
	mov r0, r1, asr #0x18
	bl IsAcceptedMissionSlotEmpty
	cmp r0, #0
	bne _02068B64
	bl GetAdventureLogDungeonFloor
	ldrb r1, [r5, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _02068B58
	ldrb r0, [r5]
	cmp r0, #5
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	beq _02068B64
_02068B58:
	add r0, r7, r4, lsl #1
	strh r6, [r0, #0xc]
	add r4, r4, #1
_02068B64:
	add r6, r6, #1
	cmp r6, #8
	blt _02068B08
	b _02068BA0
_02068B74:
	mov r5, #0
_02068B78:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl IsAcceptedMissionSlotEmpty
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r5, [r0, #0xc]
	add r5, r5, #1
	addeq r4, r4, #1
	cmp r5, #8
	blt _02068B78
_02068BA0:
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl GetAcceptedMission
	mov r1, #0
	mov r2, #1
	bl sub_020690D8
	ldr r0, _02068E14 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #4]
	cmp r1, #0xe
	bne _02068BF4
	ldr r2, _02068E64 ; =0x0000381D
	ldr r1, _02068E68 ; =_020B0B2C
	strh r2, [r8, #8]
	ldrsb r0, [r0]
	str r0, [r7, #8]
	str r1, [r7, #0xef0]
	b _02068C18
_02068BF4:
#ifdef EUROPE
	sub r0, r1, #0xf
	cmp r0, #2
	bhi _02068C18
	cmp r1, #0x11
	ldreq r1, _02068E64 ; =0x0000381F
	ldr r0, _02068E14 ; =_020B0B2C
	ldrne r1, _02068E6C ; =0x00003820
	strh r1, [r8, #8]
	ldrsb r1, [r0, #0x13]
	ldr r0, _02068E70 ; =_020B0B3F
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
#else
	sub r1, r1, #0xf
	cmp r1, #2
	bhi _02068C18
	ldr r2, _02068E6C ; =0x0000381E
	ldr r1, _02068E70 ; =_020B0B3F
	strh r2, [r8, #8]
	ldrsb r0, [r0, #0x13]
	str r0, [r7, #8]
	str r1, [r7, #0xef0]
#endif
_02068C18:
	ldr r1, [r7, #0x6c]
	ldr r0, [r7, #8]
	mov r4, #1
	cmp r0, r1
	subge r0, r1, #1
	strge r0, [r7, #8]
	mov r1, #0
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	b _02068E08
_02068C48:
	add r0, r7, #0x188
	add r5, r0, #0xc00
	ldr r0, [r7, #0x74]
	mov r2, r4
	b _02068C70
_02068C5C:
	add r1, r7, r4, lsl #1
	strh r4, [r1, #0xc]
	add r1, r7, r4
	strb r2, [r1, #0x4c]
	add r4, r4, #1
_02068C70:
	ldr r1, [r7, #0x6c]
	cmp r4, r1
	blt _02068C5C
	bl sub_02068E7C
	ldr r0, _02068E28 ; =0x00003816
	ldr r1, _02068E34 ; =sub_02069598
	strh r0, [r5, #8]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	mov r4, #1
	strb r4, [r7, #0x7c]
	b _02068E08
_02068CA4:
	add r0, r7, #0x188
	add r5, r0, #0xc00
	b _02068CBC
_02068CB0:
	add r0, r7, r4, lsl #1
	strh r4, [r0, #0xc]
	add r4, r4, #1
_02068CBC:
	ldr r0, [r7, #0x6c]
	cmp r4, r0
	blt _02068CB0
	bl sub_0206901C
	ldr r0, [r7, #0x74]
	ldr r1, _02068E74 ; =sub_020690A4
	mov r2, #0
	bl sub_020690D8
	ldr r0, _02068E6C ; =0x0000381E
	mov r1, #0
	strh r0, [r5, #8]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068D00:
	add r0, r7, #0x188
	add r6, r0, #0xc00
	b _02068D18
_02068D0C:
	add r0, r7, r4, lsl #1
	strh r4, [r0, #0xc]
	add r4, r4, #1
_02068D18:
	ldr r0, [r7, #0x6c]
	cmp r4, r0
	blt _02068D0C
	mov r8, #0
	str r8, [r7, #0x80]
	add r5, sp, #0
	add r4, sp, #0x47
	add fp, sp, #0x48
	mov sb, #0x68
	b _02068DB0
_02068D40:
	add r0, r7, r8, lsl #1
	ldrsh r0, [r0, #0xc]
	ldr r2, [r7, #0x74]
	mov r1, r5
	add sl, r2, r0, lsl #5
	mov r0, sl
	bl GenerateMissionDetailsStruct
	mov r0, sl
	mov r1, r4
	mov r2, fp
	mov r3, #0
	bl sub_02069958
	str sl, [sp, #0x5c]
	ldr r1, [r7, #0x80]
	add sl, sp, #0
	mla r0, r1, sb, r7
	add lr, r0, #0x84
	mov ip, #6
_02068D88:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02068D88
	ldmia sl, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, [r7, #0x80]
	add r8, r8, #1
	add r0, r0, #1
	str r0, [r7, #0x80]
_02068DB0:
	ldr r0, [r7, #0x6c]
	cmp r8, r0
	blt _02068D40
	bl sub_0206901C
	mov r1, #0
	ldr r0, _02068E6C ; =0x0000381E
	str r1, [r6]
	strh r0, [r6, #8]
	mov r0, #0x10
	str r0, [r6, #0xc]
	mov r0, #0x1a
	str r0, [r6, #4]
	ldr r0, _02068E18 ; =ChooseMissionTitle
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r7, #0x7c]
	ldrsb r1, [r0, #3]
	ldr r0, _02068E78 ; =_020B0B2F
	mov r4, #1
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
_02068E08:
	mov r0, r4
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02068E14: .word _020B0B2C
_02068E18: .word ChooseMissionTitle
_02068E1C: .word _020B0B2E
_02068E20: .word 0x00003815 + SUB_020686F4_WORD_OFFSET
_02068E24: .word 0x00003817 + SUB_020686F4_WORD_OFFSET
_02068E28: .word 0x00003816 + SUB_020686F4_WORD_OFFSET
_02068E2C: .word _020B0B31
_02068E30: .word 0x00003818 + SUB_020686F4_WORD_OFFSET
_02068E34: .word sub_02069598
_02068E38: .word _020B0B2D
#ifdef JAPAN
_02068E3C: .word 0x000038A2
#else
_02068E3C: .word 0x00003F1E + SUB_020686F4_WORD_OFFSET
#endif
_02068E40: .word sub_02069074
_02068E44: .word 0x00003819 + SUB_020686F4_WORD_OFFSET
_02068E48: .word _020B0B3E
_02068E4C: .word 0x0000381A + SUB_020686F4_WORD_OFFSET
_02068E50: .word _020B0B3D
_02068E54: .word 0x0000381B + SUB_020686F4_WORD_OFFSET
_02068E58: .word _020B0B36
_02068E5C: .word 0x0000381C + SUB_020686F4_WORD_OFFSET
_02068E60: .word _020B0B3B
_02068E64: .word 0x0000381D + SUB_020686F4_WORD_OFFSET
_02068E68: .word _020B0B2C
_02068E6C: .word 0x0000381E + SUB_020686F4_WORD_OFFSET
_02068E70: .word _020B0B3F
_02068E74: .word sub_020690A4
_02068E78: .word _020B0B2F
	arm_func_end sub_020686F4

	arm_func_start sub_02068E7C
sub_02068E7C: ; 0x02068E7C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x68
	ldr r1, _02069018 ; =_020B0B2C
	mov r8, r0
	ldr r7, [r1, #0x14]
	add r4, r7, #0x188
	bl sub_0206901C
	mov r5, #0
	str r5, [r7, #0xd88]
	mov r0, #0x10
	str r0, [r4, #0xc0c]
	str r5, [r7, #0x80]
	b _02068FF4
_02068EB0:
	add r0, r7, r5, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r2, #0
	mov r1, #7
	mov r0, r0, lsl #0x18
	mov r3, r0, asr #0x18
	mov r0, #0xb0
	mla r6, r3, r0, r8
	add r0, r6, #4
	strb r2, [sp, #0x46]
	strb r2, [sp, #0x48]
	str r0, [sp, #8]
	strh r2, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r2, [sp, #0x16]
	strb r1, [sp, #0x1a]
	str r2, [sp, #0x5c]
	str r6, [sp, #0x64]
	bl GetLanguageType
	ldrsb r1, [r6, #0x1c]
	cmp r1, r0
	movne r0, #0
	strne r0, [sp, #0xc]
	strne r0, [sp, #0x54]
	strne r0, [sp, #0x58]
	bne _02068F34
	add r2, r6, #0x1d
	add r1, r6, #0x32
	add r0, r6, #0x56
	str r2, [sp, #0xc]
	str r1, [sp, #0x54]
	str r0, [sp, #0x58]
_02068F34:
	ldr r0, [sp, #0x54]
	mov r1, #1
	cmp r0, #0
	ldrneh r0, [r0]
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r1, #0
	moveq r1, #6
	ldrb r0, [r6]
	strb r1, [sp, #0x44]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02068FAC
_02068F6C: ; jump table
	b _02068FAC ; case 0
	b _02068FA0 ; case 1
	b _02068FA0 ; case 2
	b _02068FAC ; case 3
	b _02068F88 ; case 4
	b _02068F94 ; case 5
	b _02068F94 ; case 6
_02068F88:
	mov r0, #3
	strb r0, [sp, #0x47]
	b _02068FB4
_02068F94:
	mov r0, #4
	strb r0, [sp, #0x47]
	b _02068FB4
_02068FA0:
	mov r0, #1
	strb r0, [sp, #0x47]
	b _02068FB4
_02068FAC:
	mov r0, #2
	strb r0, [sp, #0x47]
_02068FB4:
	ldr r1, [r7, #0x80]
	mov r0, #0x68
	mla r0, r1, r0, r7
	add lr, sp, #0
	add ip, r0, #0x84
	mov r6, #6
_02068FCC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02068FCC
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	ldr r0, [r7, #0x80]
	add r5, r5, #1
	add r0, r0, #1
	str r0, [r7, #0x80]
_02068FF4:
	ldr r0, [r7, #0x6c]
	cmp r5, r0
	blt _02068EB0
	mov r0, #0x10
	str r0, [r4, #0xc0c]
	mov r0, #0x1a
	str r0, [r4, #0xc04]
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02069018: .word _020B0B2C
	arm_func_end sub_02068E7C

	arm_func_start sub_0206901C
sub_0206901C: ; 0x0206901C
	stmdb sp!, {r3, lr}
	ldr r0, _02069070 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	add r2, r0, #0xe20
	mov r0, r1
_02069034:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #0x20
	blt _02069034
	ldr r0, _02069070 ; =_020B0B2C
	mov r1, #0x98
	ldr r0, [r0, #0x14]
	add r0, r0, #0x188
	add r0, r0, #0xc00
	bl MemZero
	ldr r0, _02069070 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	add r0, r1, #0xe20
	str r0, [r1, #0xde8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069070: .word _020B0B2C
	arm_func_end sub_0206901C

	arm_func_start sub_02069074
sub_02069074: ; 0x02069074
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl AlreadyHaveMission
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4]
	bl CountJobListMissions
	cmp r0, #8
	ldrgeb r0, [r4]
	orrge r0, r0, #1
	strgeb r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02069074

	arm_func_start sub_020690A4
sub_020690A4: ; 0x020690A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020690CC
	mov r0, r5
	bl sub_0205FA38
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020690CC:
	mov r0, #3
	strb r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020690A4

	arm_func_start sub_020690D8
sub_020690D8: ; 0x020690D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	ldr r3, _020691B4 ; =_020B0B2C
	mov sb, r0
	ldr r6, [r3, #0x14]
	mov r8, r1
	mov r7, r2
	bl sub_0206901C
	mov r5, #0
	str r5, [r6, #0x80]
	add r4, r6, #0xe20
	mov fp, #0x68
	b _02069188
_0206910C:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xc]
	add r1, sp, #0
	add sl, sb, r0, lsl #5
	mov r0, sl
	bl GenerateMissionDetailsStruct
	mov r0, sl
	add r1, sp, #0x47
	add r2, sp, #0x48
	mov r3, r7
	bl sub_02069958
	cmp r8, #0
	beq _0206914C
	mov r0, sl
	add r1, r4, r5
	blx r8
_0206914C:
	ldr r1, [r6, #0x80]
	add sl, sp, #0
	mla r0, r1, fp, r6
	add lr, r0, #0x84
	mov ip, #6
_02069160:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02069160
	ldmia sl, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, [r6, #0x80]
	add r5, r5, #1
	add r0, r0, #1
	str r0, [r6, #0x80]
_02069188:
	ldr r0, [r6, #0x6c]
	cmp r5, r0
	blt _0206910C
	mov r0, #0
	str r0, [r6, #0xd88]
	mov r0, #0x10
	str r0, [r6, #0xd94]
	mov r0, #0x1a
	str r0, [r6, #0xd8c]
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020691B4: .word _020B0B2C
	arm_func_end sub_020690D8

	arm_func_start sub_020691B8
sub_020691B8: ; 0x020691B8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r2, _020692A8 ; =_020B0B2C
	mvn r1, #1
	ldr ip, [r2, #0x14]
	ldrsb r0, [ip, #0x7d]
	cmp r0, r1
	bne _0206926C
	ldr r0, [ip, #8]
	mov r3, #4
	str r0, [ip, #0xd88]
	ldr lr, [r2, #0x14]
	ldr r0, _020692AC ; =_020A9288
	ldr r1, [lr, #0xe40]
	add r2, lr, #0x188
	str r1, [sp]
	ldr ip, [lr, #0x80]
	ldr r1, _020692B0 ; =0x00441E33
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r3, [lr, #0xe44]
	add r2, r2, #0xc00
	bl CreateCollectionMenu
	ldr r3, _020692A8 ; =_020B0B2C
	mov r1, #0
	ldr ip, [r3, #0x14]
	mov r2, #0xc
	strb r0, [ip, #0x7d]
	ldr r0, [r3, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl sub_0202C6F0
	ldr r0, _020692A8 ; =_020B0B2C
	mov r1, #1
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl SetCollectionMenuField0x1B2
	ldr r0, _020692A8 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #0x7c]
	cmp r0, #0
	bne _02069290
	ldrsb r0, [r1, #0x7d]
	mov r1, #1
	bl sub_0202D07C
	b _02069290
_0206926C:
	ldrb r1, [ip, #0xd84]
	cmp r1, #0
	beq _0206928C
	ldr r1, [ip, #0x80]
	mov r2, #4
	mov r3, #0
	bl sub_0202C654
	b _02069290
_0206928C:
	bl sub_0202C620
_02069290:
	ldr r0, _020692A8 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0xd84]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020692A8: .word _020B0B2C
_020692AC: .word _020A9288
_020692B0: .word 0x00441E33
	arm_func_end sub_020691B8

	arm_func_start sub_020692B4
sub_020692B4: ; 0x020692B4
	stmdb sp!, {r3, lr}
	ldr r0, _020692F8 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _020692F8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl CloseCollectionMenu
	ldr r0, _020692F8 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0x7d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020692F8: .word _020B0B2C
	arm_func_end sub_020692B4

	arm_func_start sub_020692FC
sub_020692FC: ; 0x020692FC
	stmdb sp!, {r3, lr}
	ldr r0, _02069378 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #4]
	sub r0, r1, #0xe
	cmp r0, #3
	bhi _02069328
	bl sub_02069444
	mov r1, #1
	bl CreateJobSummary
	ldmia sp!, {r3, pc}
_02069328:
	cmp r1, #0xa
	cmpne r1, #0xb
	cmpne r1, #0xc
	cmpne r1, #0xd
	beq _02069348
	sub r0, r1, #0x14
	cmp r0, #1
	bhi _02069358
_02069348:
	bl sub_02069444
	mov r1, #0
	bl CreateJobSummary
	ldmia sp!, {r3, pc}
_02069358:
	cmp r1, #0x13
	bne _0206936C
	bl sub_0206941C
	bl sub_02069790
	ldmia sp!, {r3, pc}
_0206936C:
	bl sub_020693EC
	bl sub_02069790
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069378: .word _020B0B2C
	arm_func_end sub_020692FC

	arm_func_start sub_0206937C
sub_0206937C: ; 0x0206937C
	stmdb sp!, {r3, lr}
	ldr r0, _020693E8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #4]
	cmp r1, #0xa
	cmpne r1, #0xb
	cmpne r1, #0xc
	cmpne r1, #0xd
	cmpne r1, #0xe
	cmpne r1, #0xf
	cmpne r1, #0x10
	cmpne r1, #0x11
	beq _020693BC
	sub r0, r1, #0x14
	cmp r0, #1
	bhi _020693C8
_020693BC:
	bl sub_02069444
	bl sub_02069894
	ldmia sp!, {r3, pc}
_020693C8:
	cmp r1, #0x13
	bne _020693DC
	bl sub_0206941C
	bl sub_02069870
	ldmia sp!, {r3, pc}
_020693DC:
	bl sub_020693EC
	bl sub_02069870
	ldmia sp!, {r3, pc}
	.align 2, 0
_020693E8: .word _020B0B2C
	arm_func_end sub_0206937C

	arm_func_start sub_020693EC
sub_020693EC: ; 0x020693EC
	ldr r1, _02069414 ; =_020B0B2C
	ldr r0, _02069418 ; =_020B0A54
	ldr r3, [r1, #0x14]
	ldr r2, [r0]
	ldr r1, [r3, #8]
	mov r0, #0xb0
	add r1, r3, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	smlabb r0, r1, r0, r2
	bx lr
	.align 2, 0
_02069414: .word _020B0B2C
_02069418: .word _020B0A54
	arm_func_end sub_020693EC

	arm_func_start sub_0206941C
sub_0206941C: ; 0x0206941C
	ldr r1, _02069440 ; =_020B0B2C
	mov r0, #0xb0
	ldr r3, [r1, #0x14]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0x74]
	add r1, r3, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	smlabb r0, r1, r0, r2
	bx lr
	.align 2, 0
_02069440: .word _020B0B2C
	arm_func_end sub_0206941C

	arm_func_start sub_02069444
sub_02069444: ; 0x02069444
	stmdb sp!, {r3, lr}
	ldr r0, _02069558 ; =_020B0B2C
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #4]
	sub r0, r0, #0xa
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02069550
_02069464: ; jump table
	b _02069494 ; case 0
	b _020694B0 ; case 1
	b _020694CC ; case 2
	b _020694E8 ; case 3
	b _02069504 ; case 4
	b _02069504 ; case 5
	b _02069504 ; case 6
	b _02069504 ; case 7
	b _02069550 ; case 8
	b _02069550 ; case 9
	b _02069520 ; case 10
	b _02069538 ; case 11
_02069494:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	ldmia sp!, {r3, pc}
_020694B0:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	ldmia sp!, {r3, pc}
_020694CC:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	ldmia sp!, {r3, pc}
_020694E8:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	ldmia sp!, {r3, pc}
_02069504:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldmia sp!, {r3, pc}
_02069520:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0x74]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0, lsl #5
	ldmia sp!, {r3, pc}
_02069538:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0x74]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0, lsl #5
	ldmia sp!, {r3, pc}
_02069550:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069558: .word _020B0B2C
	arm_func_end sub_02069444

	arm_func_start sub_0206955C
sub_0206955C: ; 0x0206955C
	stmdb sp!, {r3, lr}
	ldr r0, _02069594 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0x85]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClosePortraitBox
	ldr r0, _02069594 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0xd85]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069594: .word _020B0B2C
	arm_func_end sub_0206955C

	arm_func_start sub_02069598
sub_02069598: ; 0x02069598
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0206965C ; =_020B0B2C
	tst r0, #0x400
	ldr r5, [r1, #0x14]
	beq _02069654
	ldrsb r0, [r5, #0x7d]
	ldr r6, [r5, #8]
	bl GetWindowIdSelectedMenuItemIdx
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0206964C
	add r4, r5, #0x4c
	ldrb r0, [r4, r6]
	cmp r0, #0
	beq _02069600
	mov r0, #6
	bl PlaySeVolumeWrapper
	mov r0, #0
	strb r0, [r4, r6]
	bl sub_020674E8
	cmp r0, #0
	bne _02069644
	ldrsb r0, [r5, #0x7d]
	mov r1, #0
	bl sub_0202D07C
	b _02069644
_02069600:
	ldr r0, [r5, #0x78]
	cmp r0, #0
	blt _0206961C
	bl sub_020674E8
	ldr r1, [r5, #0x78]
	cmp r0, r1
	bhs _0206963C
_0206961C:
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldrsb r0, [r5, #0x7d]
	mov r1, #1
	bl sub_0202D07C
	mov r0, #1
	strb r0, [r4, r6]
	b _02069644
_0206963C:
	mov r0, #2
	bl PlaySeVolumeWrapper
_02069644:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_0206964C:
	mov r0, #3
	bl PlaySeVolumeWrapper
_02069654:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206965C: .word _020B0B2C
	arm_func_end sub_02069598

	arm_func_start ChooseMissionTitle
ChooseMissionTitle: ; 0x02069660
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020696E4 ; =_020B0B2C
	mov r5, r0
	ldr r0, [r3, #0x14]
	add r0, r0, r1
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r2]
	mov r0, #0x68
	mul r4, r1, r0
	ldr r0, _020696E4 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, r4
	ldr r0, [r0, #0xe0]
	cmp r0, #0
	beq _020696C4
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _020696C4
	mov r0, r5
	bl FormatSpecialEpisodeMissionHeader
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020696C4:
	ldr r1, _020696E4 ; =_020B0B2C
	mov r0, r5
	ldr r1, [r1, #0x14]
	add r1, r1, #0x84
	add r1, r1, r4
	bl FormatMissionHeader
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020696E4: .word _020B0B2C
	arm_func_end ChooseMissionTitle

	arm_func_start sub_020696E8
sub_020696E8: ; 0x020696E8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x154
	mov r4, r0
	add r0, sp, #0x104
	bl InitPreprocessorArgs
	bl CountJobListMissions
	str r0, [sp, #0x128]
	mov r0, #8
	str r0, [sp, #0x12c]
	add r3, sp, #0x104
	str r3, [sp]
	ldr r2, _0206974C ; =0x00003813
	add r0, sp, #4
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #0
	mov r2, #3
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0206974C: .word 0x00003815
#elif defined(JAPAN)
_0206974C: .word 0x00003451
#else
_0206974C: .word 0x00003813
#endif
	arm_func_end sub_020696E8

	arm_func_start sub_02069750
sub_02069750: ; 0x02069750
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x100
	ldr r1, _0206978C ; =0x00003814
	mov r4, r0
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r3, sp, #0
	mov r0, r4
	mov r1, #0
	mov r2, #3
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x100
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0206978C: .word 0x00003816
#elif defined(JAPAN)
_0206978C: .word 0x00003452
#else
_0206978C: .word 0x00003814
#endif
	arm_func_end sub_02069750

	arm_func_start sub_02069790
sub_02069790: ; 0x02069790
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _020697F4 ; =_020B0B44
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r0, _020697F4 ; =_020B0B44
	mov ip, #0
	ldr r2, [r0]
	ldr r1, _020697F8 ; =JOB_WINDOW_PARAMS_2
	str r4, [r2]
	ldr r3, [r0]
	ldr r2, _020697FC ; =sub_02069AEC
	strh ip, [r3, #8]
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0204707C
	ldr r0, _020697F4 ; =_020B0B44
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020697F4: .word _020B0B44
_020697F8: .word JOB_WINDOW_PARAMS_2
_020697FC: .word sub_02069AEC
	arm_func_end sub_02069790

	arm_func_start CreateJobSummary
CreateJobSummary: ; 0x02069800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _02069864 ; =_020B0B44
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r0, _02069864 ; =_020B0B44
	mov ip, #0
	ldr r2, [r0]
	ldr r1, _02069868 ; =JOB_WINDOW_PARAMS_2
	str r5, [r2, #4]
	ldr r3, [r0]
	ldr r2, _0206986C ; =sub_02069CC0
	strh ip, [r3, #8]
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0204707C
	ldr r0, _02069864 ; =_020B0B44
	ldr r0, [r0]
	strb r4, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02069864: .word _020B0B44
_02069868: .word JOB_WINDOW_PARAMS_2
_0206986C: .word sub_02069CC0
	arm_func_end CreateJobSummary

	arm_func_start sub_02069870
sub_02069870: ; 0x02069870
	ldr r1, _0206988C ; =_020B0B44
	ldr ip, _02069890 ; =sub_02047188
	ldr r2, [r1]
	str r0, [r2]
	ldr r0, [r1]
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_0206988C: .word _020B0B44
_02069890: .word sub_02047188
	arm_func_end sub_02069870

	arm_func_start sub_02069894
sub_02069894: ; 0x02069894
	ldr r1, _020698B0 ; =_020B0B44
	ldr ip, _020698B4 ; =sub_02047188
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_020698B0: .word _020B0B44
_020698B4: .word sub_02047188
	arm_func_end sub_02069894

	arm_func_start sub_020698B8
sub_020698B8: ; 0x020698B8
	stmdb sp!, {r3, lr}
	ldr r0, _02069900 ; =_020B0B44
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	beq _020698F8
	bl sub_020470D0
	ldr r0, _02069900 ; =_020B0B44
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02047148
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_020698F8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069900: .word _020B0B44
	arm_func_end sub_020698B8

	arm_func_start sub_02069904
sub_02069904: ; 0x02069904
	stmdb sp!, {r3, lr}
	ldr r0, _0206993C ; =_020B0B44
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0xc
	bl sub_02047150
	ldr r0, _0206993C ; =_020B0B44
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0206993C ; =_020B0B44
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206993C: .word _020B0B44
	arm_func_end sub_02069904

	arm_func_start sub_02069940
sub_02069940: ; 0x02069940
	ldr r1, _02069954 ; =_020B0B44
	ldr r1, [r1]
	cmp r1, #0
	strneh r0, [r1, #8]
	bx lr
	.align 2, 0
_02069954: .word _020B0B44
	arm_func_end sub_02069940

	arm_func_start sub_02069958
sub_02069958: ; 0x02069958
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0
	b _02069AD0
_02069974:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02069ACC
	ldrb r1, [sb, #1]
	ldrb r0, [r4, #1]
	cmp r1, r0
	ldreqb r1, [sb, #2]
	ldreqb r0, [r4, #2]
	cmpeq r1, r0
	ldreqb r1, [sb, #4]
	ldreqb r0, [r4, #4]
	cmpeq r1, r0
	ldreqb r1, [sb, #5]
	ldreqb r0, [r4, #5]
	cmpeq r1, r0
	ldreq r1, [sb, #8]
	ldreq r0, [r4, #8]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0xe]
	ldreqsh r0, [r4, #0xe]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x10]
	ldreqsh r0, [r4, #0x10]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x12]
	ldreqsh r0, [r4, #0x12]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x14]
	ldreqsh r0, [r4, #0x14]
	cmpeq r1, r0
	ldreqb r0, [sb, #0x16]
	ldreqb r1, [r4, #0x16]
	cmpeq r0, r1
	bne _02069ACC
	add r1, sb, #0x18
	add r2, r4, #0x18
	bl sub_0205C870
	cmp r0, #0
	beq _02069ACC
	add r0, sb, #0x1a
	add r1, r4, #0x1a
	bl sub_0205C8E0
	cmp r0, #0
	beq _02069ACC
	ldrb r0, [r4]
	sub r0, r0, #4
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02069AA4
_02069A48: ; jump table
	b _02069A5C ; case 0
	b _02069A6C ; case 1
	b _02069A88 ; case 2
	b _02069A6C ; case 3
	b _02069A6C ; case 4
_02069A5C:
	mov r0, #1
	strb r0, [r8]
	strb r0, [r7]
	b _02069ABC
_02069A6C:
	cmp r6, #0
	movne r0, #3
	moveq r0, #1
	strb r0, [r8]
	mov r0, #2
	strb r0, [r7]
	b _02069ABC
_02069A88:
	cmp r6, #0
	movne r0, #0
	moveq r0, #1
	strb r0, [r8]
	mov r0, #3
	strb r0, [r7]
	b _02069ABC
_02069AA4:
	cmp r6, #0
	movne r0, #0
	moveq r0, #1
	strb r0, [r8]
	mov r0, #0
	strb r0, [r7]
_02069ABC:
	cmp r6, #0
	moveq r0, #0
	streqb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02069ACC:
	add r5, r5, #1
_02069AD0:
	cmp r5, #8
	blt _02069974
	mov r0, #2
	strb r0, [r8]
	mov r0, #0
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02069958

	arm_func_start sub_02069AEC
sub_02069AEC: ; 0x02069AEC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x68
	ldr r1, _02069CBC ; =_020B0B44
	mov r2, #0
	ldr r1, [r1]
	mov r5, r0
	ldr r4, [r1]
	add r0, r4, #4
	strb r2, [sp, #0x46]
	strh r2, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r2, [sp, #0x16]
	str r2, [sp, #0x5c]
	str r4, [sp, #0x64]
	str r0, [sp, #8]
	ldrsh r0, [r4, #0xa2]
	cmp r0, #0
	moveq r0, #7
	streqb r0, [sp, #0x1a]
	beq _02069B60
	mov r0, #2
	strb r0, [sp, #0x1a]
	ldrh r0, [r4, #0x9e]
	strh r0, [sp, #0x28]
	ldrh r0, [r4, #0xa0]
	strh r0, [sp, #0x2a]
	ldrh r0, [r4, #0xa2]
	strh r0, [sp, #0x2c]
_02069B60:
	bl GetLanguageType
	ldrsb r1, [r4, #0x1c]
	cmp r1, r0
	movne r0, #0
	strne r0, [sp, #0xc]
	strne r0, [sp, #0x54]
	strne r0, [sp, #0x58]
	bne _02069B98
	add r2, r4, #0x1d
	add r1, r4, #0x32
	add r0, r4, #0x56
	str r2, [sp, #0xc]
	str r1, [sp, #0x54]
	str r0, [sp, #0x58]
_02069B98:
	ldrb r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02069C00
_02069BA8: ; jump table
	b _02069C00 ; case 0
	b _02069C00 ; case 1
	b _02069C00 ; case 2
	b _02069C00 ; case 3
	b _02069C00 ; case 4
	b _02069BC8 ; case 5
	b _02069BF4 ; case 6
	b _02069BC8 ; case 7
_02069BC8:
	ldr r0, _02069CBC ; =_020B0B44
	ldr r1, [r0]
	ldrsh r0, [r1, #8]
	cmp r0, #0
	movne r0, #6
	strneb r0, [sp, #0x1a]
	ldrnesh r0, [r1, #8]
	strneh r0, [sp, #0x3c]
	mov r0, #0
	strb r0, [sp, #0x48]
	b _02069C50
_02069BF4:
	mov r0, #0
	strb r0, [sp, #0x48]
	b _02069C50
_02069C00:
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	beq _02069C24
	cmp r0, #1
	beq _02069C30
	cmp r0, #2
	beq _02069C3C
	b _02069C48
_02069C24:
	mov r0, #6
	strb r0, [sp, #0x48]
	b _02069C50
_02069C30:
	mov r0, #4
	strb r0, [sp, #0x48]
	b _02069C50
_02069C3C:
	mov r0, #5
	strb r0, [sp, #0x48]
	b _02069C50
_02069C48:
	mov r0, #0
	strb r0, [sp, #0x48]
_02069C50:
	ldr r0, [sp, #0x54]
	mov r1, #1
	cmp r0, #0
	ldrneh r0, [r0]
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r1, #0
	moveq r1, #6
	ldr r0, [sp, #0x58]
	strb r1, [sp, #0x44]
	cmp r0, #0
	ldrneh r0, [r0]
	mov r1, #1
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r2, #0
	moveq r2, #9
	add r0, sp, #0
	mov r1, r5
	strb r2, [sp, #0x45]
	bl MakeMissionDetails
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02069CBC: .word _020B0B44
	arm_func_end sub_02069AEC

	arm_func_start sub_02069CC0
sub_02069CC0: ; 0x02069CC0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	ldr r1, _02069D3C ; =_020B0B44
	mov r6, r0
	ldr r0, [r1]
	ldr r4, [r0, #4]
	ldrb r5, [r0, #0x10]
	mov r0, r4
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _02069CFC
	mov r0, r6
	mov r1, r4
	bl MakeSpecialEpisodeMissionDetails
	b _02069D2C
_02069CFC:
	add r1, sp, #0
	mov r0, r4
	bl GenerateMissionDetailsStruct
	add r1, sp, #0x47
	add r2, sp, #0x48
	mov r0, r4
	mov r3, r5
	bl sub_02069958
	add r0, sp, #0
	mov r1, r6
	str r4, [sp, #0x5c]
	bl MakeMissionDetails
_02069D2C:
	mov r0, r6
	bl UpdateWindow
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02069D3C: .word _020B0B44
	arm_func_end sub_02069CC0

	arm_func_start sub_02069D40
sub_02069D40: ; 0x02069D40
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xc4
	mov r1, #8
	bl MemAlloc
	ldr r2, _02069D90 ; =_020B0B48
	mov r1, #0xc4
	str r0, [r2]
	bl MemZero
	ldr r0, _02069D90 ; =_020B0B48
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	strh r4, [r1, #0xc0]
	ldr r1, [r0]
	add r0, r1, #0x37
	bic r0, r0, #0x1f
	str r0, [r1, #0x14]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02069D90: .word _020B0B48
	arm_func_end sub_02069D40

	arm_func_start sub_02069D94
sub_02069D94: ; 0x02069D94
	stmdb sp!, {r3, lr}
	ldr r0, _02069DBC ; =_020B0B48
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02069DBC ; =_020B0B48
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069DBC: .word _020B0B48
	arm_func_end sub_02069D94

	arm_func_start sub_02069DC0
sub_02069DC0: ; 0x02069DC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20c
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r5, [r0]
	ldr r1, [r5]
	cmp r1, #0x3000
	bgt _02069E30
	bge _0206A388
	ldr r0, _0206A5E4 ; =0x00001001
	cmp r1, r0
	bgt _02069E10
	cmp r1, #0x1000
	blt _02069E04
	beq _0206A0AC
	cmp r1, r0
	beq _0206A104
	b _0206A5D4
_02069E04:
	cmp r1, #0
	beq _02069E84
	b _0206A5D4
_02069E10:
	cmp r1, #0x2000
	bgt _02069E20
	beq _0206A464
	b _0206A5D4
_02069E20:
	add r0, r0, #0x1000
	cmp r1, r0
	beq _0206A490
	b _0206A5D4
_02069E30:
	cmp r1, #0x4000
	bgt _02069E4C
	bge _0206A4A4
	ldr r0, _0206A5E8 ; =0x00003001
	cmp r1, r0
	beq _0206A3A0
	b _0206A5D4
_02069E4C:
	ldr r0, _0206A5EC ; =0x00004004
	cmp r1, r0
	bgt _02069E78
	sub r0, r0, #3
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _0206A5D4
_02069E68: ; jump table
	b _0206A4F8 ; case 0
	b _0206A4C4 ; case 1
	b _0206A584 ; case 2
	b _0206A5B0 ; case 3
_02069E78:
	cmp r1, #0x8000
	beq _0206A5C4
	b _0206A5D4
_02069E84:
	add r4, r5, #0x58
	add r5, r5, #0x90
	bl ov03_0233CAA8
	cmp r0, #1
	bne _02069F90
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strne r0, [r1, #0xc]
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	mov r0, r5
	mov r1, #0x18
	bl MemZero
	ldr r1, _0206A5E0 ; =_020B0B48
	mov r2, #0x18
	ldr r0, [r1]
	mov r6, #0x38
	str r2, [r0, #0xa8]
	ldr r0, [r1]
	ldr r3, _0206A5F0 ; =sub_0206A628
	str r5, [r0, #0xac]
	ldr r2, [r1]
	mov r0, #0
	str r6, [r2, #0xb0]
	ldr r2, [r1]
	mov r8, #1
	str r4, [r2, #0xb4]
	ldr r2, [r1]
	mov r7, #9
	str r3, [r2, #0xb8]
	ldr r2, [r1]
	mov r3, #0x12
	strb r0, [r2, #0xbc]
	ldr r6, [r1]
	mov r2, #0x11
	strb r8, [r6, #0x10]
	ldr r6, [r1]
	ldr r6, [r6, #0x14]
	strb r7, [r6]
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	strb r0, [r1, #1]
	strb r3, [r4]
	strb r2, [r5]
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r1, [r5, #2]
	add r0, r5, #4
	strb r1, [r4, #2]
	bl GetMainTeamNameWithCheck
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _02069F6C
	add r0, r5, #4
	bl SetQuestionMarks
_02069F6C:
	add r0, r5, #4
	mov r1, #0x14
	bl ov01_02337B3C
	ldr r1, _0206A5E0 ; =_020B0B48
	strb r0, [r5, #3]
	ldr r0, [r1]
	mov r1, #0x1000
	str r1, [r0]
	b _0206A5D4
_02069F90:
	bl ov03_0233CAA8
	cmp r0, #0
	bne _0206A5D4
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0xc]
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	mov r0, r5
	mov r1, #0x18
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sl, r0
	add sb, r4, #0x18
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1, r2, r3}
	ldr ip, _0206A5E0 ; =_020B0B48
	stmia sb, {r0, r1, r2, r3}
	ldr r0, [ip]
	mov r8, #0x38
	str r8, [r0, #0xa8]
	ldr r0, [ip]
	mov r7, #0x18
	str r4, [r0, #0xac]
	ldr r0, [ip]
	ldr r6, _0206A5F4 ; =_02337B68
	str r7, [r0, #0xb0]
	ldr r0, [ip]
	mov lr, #0
	str r5, [r0, #0xb4]
	ldr r0, [ip]
	mov fp, #9
	str r6, [r0, #0xb8]
	ldr r0, [ip]
	strb lr, [r0, #0xbc]
	ldr r0, [ip]
	strb lr, [r0, #0x10]
	ldr r0, [ip]
	ldr r0, [r0, #0x14]
	strb fp, [r0]
	ldr r0, [ip]
	ldr r0, [r0, #0x14]
	strb lr, [r0, #1]
	mov r0, #0x12
	strb r0, [r4]
	mov r0, #0x11
	strb r0, [r5]
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r1, [r5, #2]
	add r0, r4, #4
	strb r1, [r4, #2]
	bl GetMainTeamNameWithCheck
	add r0, r4, #4
	mov r1, #0x34
	bl ov01_02337B3C
	strb r0, [r4, #3]
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A0AC:
	add r0, r5, #0xa8
	mov r4, #1
	str r0, [sp, #0xac]
	str r4, [sp, #0xa8]
	ldr r1, [r5, #0xc]
	add r0, sp, #0xa8
	str r1, [sp, #0xb8]
	ldrb r3, [r5, #0x10]
	mov r2, #0x20
	mov r1, #0
	strb r3, [sp, #0xbc]
	ldr r3, [r5, #0x14]
	str r3, [sp, #0xc0]
	strh r2, [sp, #0xc4]
	strb r1, [sp, #0xc6]
	str r4, [sp, #0xc8]
	bl ov01_02337BA0
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5E4 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A104:
	bl ov01_02337E0C
	movs r4, r0
	beq _0206A5D4
	bl ov01_02337C54
	cmp r4, #0xe
	addls pc, pc, r4, lsl #2
	b _0206A5D4
_0206A120: ; jump table
	b _0206A5D4 ; case 0
	b _0206A380 ; case 1
	b _0206A5D4 ; case 2
	b _0206A5D4 ; case 3
	b _0206A15C ; case 4
	b _0206A380 ; case 5
	b _0206A380 ; case 6
	b _0206A380 ; case 7
	b _0206A380 ; case 8
	b _0206A380 ; case 9
	b _0206A380 ; case 10
	b _0206A380 ; case 11
	b _0206A380 ; case 12
	b _0206A380 ; case 13
	b _0206A380 ; case 14
_0206A15C:
	bl ov03_0233CAA8
	cmp r0, #1
	bne _0206A300
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _0206A244
	mov r0, #2
	bl IsSpecialEpisodeOpen
	cmp r0, #0
	beq _0206A1B0
	ldr r1, _0206A5F8 ; =0x000037A8
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5FC ; =0x00002001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A1B0:
	add r0, sp, #0x1bc
	bl InitPreprocessorArgs
	mov r0, #2
	mov r1, #1
	bl SetSpecialEpisodeOpen
	add r0, sp, #0x7e
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0x7e
	bne _0206A1FC
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A204
_0206A1FC:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A204:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0x7e
	add r2, sp, #0x1bc
	mov r0, #0x1c
	str r3, [sp, #0x1f4]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A244:
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl AddMissionToJobList
	cmp r0, #0
	bne _0206A2EC
	bl sub_0205F5A8
	bl sub_0205F710
	add r0, sp, #0x16c
	bl InitPreprocessorArgs
	add r0, sp, #0x54
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0x54
	bne _0206A2A4
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A2AC
_0206A2A4:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A2AC:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0x54
	add r2, sp, #0x16c
	mov r0, #0x1c
	str r3, [sp, #0x1a4]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A2EC:
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A300:
	bl ov03_0233CAA8
	cmp r0, #0
	bne _0206A5D4
	add r0, sp, #0x11c
	bl InitPreprocessorArgs
	add r0, sp, #0x2a
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x92]
	cmp r1, r0
	add r0, sp, #0x2a
	bne _0206A34C
	add r1, r4, #0x94
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A354
_0206A34C:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A354:
	ldr r1, _0206A608 ; =0x00003793
	add r3, sp, #0x2a
	add r2, sp, #0x11c
	mov r0, #0x1c
	str r3, [sp, #0x154]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A380:
	mov r0, #1
	b _0206A5D8
_0206A388:
	bl ov03_0233CAD8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5E8 ; =0x00003001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A3A0:
	bl ov03_0233CB3C
	cmp r0, #2
	bne _0206A450
	bl ov03_0233CB10
	add r0, sp, #0xcc
	bl InitPreprocessorArgs
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl AddMissionToJobList
	bl sub_0205F5A8
	bl sub_0205F710
	add r0, sp, #0
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0
	bne _0206A408
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A410
_0206A408:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A410:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0
	add r2, sp, #0xcc
	mov r0, #0x1c
	str r3, [sp, #0x104]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A450:
	cmp r0, #1
	bne _0206A5D4
	bl ov03_0233CB10
	mov r0, #1
	b _0206A5D8
_0206A464:
	bl ov03_0233CDE4
	mov r4, r0
	bl sub_020698B8
	cmp r4, #0x12
	bne _0206A5D4
	bl sub_02069904
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x4000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A490:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #1
	b _0206A5D8
_0206A4A4:
	ldr r1, _0206A60C ; =0x0000023B
	mov r0, #0
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A610 ; =0x00004002
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A4C4:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	bl sub_02003B94
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A614 ; =0x00004001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A4F8:
	mov r0, #3
	bl NoteSaveBase
	mov r4, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r4, #0
	bne _0206A558
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	mov r0, #0x1c
	beq _0206A53C
	ldr r1, _0206A618 ; =0x0000379E
	bl ov03_0233CDC8
	b _0206A544
_0206A53C:
#ifdef JAPAN
	ldr r1, _0206A90C ; =0x000004CD
#else
	mov r1, #0x23c
#endif
	bl ov03_0233CDC8
_0206A544:
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A61C ; =0x00004003
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A558:
	cmp r4, #1
	moveq r0, #3
	beq _0206A5D8
	ldr r1, _0206A620 ; =0x00000239
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5EC ; =0x00004004
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A584:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	ldr r1, _0206A624 ; =0x000037A0
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A5B0:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #1
	b _0206A5D8
_0206A5C4:
	bl ov03_0233CDE4
	cmp r0, #0x12
	moveq r0, #2
	beq _0206A5D8
_0206A5D4:
	mov r0, #0
_0206A5D8:
	add sp, sp, #0x20c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02069DC0_OFFSET 2
#elif defined(JAPAN)
#define SUB_02069DC0_OFFSET -0x37E
#else
#define SUB_02069DC0_OFFSET 0
#endif
_0206A5E0: .word _020B0B48
_0206A5E4: .word 0x00001001
_0206A5E8: .word 0x00003001
_0206A5EC: .word 0x00004004
_0206A5F0: .word sub_0206A628
_0206A5F4: .word ov01_02337B68
_0206A5F8: .word 0x000037A8 + SUB_02069DC0_OFFSET
_0206A5FC: .word 0x00002001
#ifdef JAPAN
_0206A600: .word 0x00003507
#else
_0206A600: .word 0x000038C9 + SUB_02069DC0_OFFSET
#endif
_0206A604: .word 0x0000379F + SUB_02069DC0_OFFSET
_0206A608: .word 0x00003793 + SUB_02069DC0_OFFSET
#ifdef JAPAN
_0206A60C: .word 0x000004CC
#else
_0206A60C: .word 0x0000023B
#endif
_0206A610: .word 0x00004002
_0206A614: .word 0x00004001
_0206A618: .word 0x0000379E + SUB_02069DC0_OFFSET
#ifdef JAPAN
_0206A90C: .word 0x000004CD
_0206A61C: .word 0x00004003
_0206A620: .word 0x000004CA
#else
_0206A61C: .word 0x00004003
_0206A620: .word 0x00000239
#endif
_0206A624: .word 0x000037A0 + SUB_02069DC0_OFFSET
	arm_func_end sub_02069DC0

	arm_func_start sub_0206A628
sub_0206A628: ; 0x0206A628
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov03_0233CAA8
	cmp r0, #1
	bne _0206A70C
	add r0, r4, #4
	mov r1, #0x34
	bl ov01_02337B3C
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4]
	cmp r0, #0x12
	movne r0, #2
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl sub_0205D1F4
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x2c]
	mov r1, #1
	bl CanSendItem
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #0x2e]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0206A6E4
_0206A6B8: ; jump table
	b _0206A6E4 ; case 0
	b _0206A6CC ; case 1
	b _0206A6CC ; case 2
	b _0206A6CC ; case 3
	b _0206A6CC ; case 4
_0206A6CC:
	ldrsh r0, [r4, #0x30]
	mov r1, #1
	bl CanSendItem
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
_0206A6E4:
	add r0, r4, #0x18
	bl AlreadyHaveMission
	cmp r0, #0
	movne r0, #4
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl sub_0205FA38
	cmp r0, #0
	movne r0, #4
	ldmneia sp!, {r4, pc}
_0206A70C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206A628
