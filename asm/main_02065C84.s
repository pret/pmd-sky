	.include "asm/macros.inc"
	.include "main_02065C84.inc"

	.text

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
