	.include "asm/macros.inc"
	.include "overlay_10_022C2588.inc"

	.text

	arm_func_start ov10_022C2588
ov10_022C2588: ; 0x022C2588
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	cmp r1, #0xaa
	addlt r0, r1, #0xfe
	addlt r0, r0, #0x100
	addge r0, r1, #0xe2
	addge r0, r0, #0x200
	mov r0, r0, lsl #0x10
	mov r3, r2
	mov r1, r0, lsr #0x10
	add r2, sp, #4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r2, [sp]
	mov r0, r4
	mov r1, #0
	bl DecompressAtFromMemoryPointerVeneer
	add r0, sp, #4
	bl UnloadFile
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov10_022C2588

	arm_func_start ov10_022C25EC
ov10_022C25EC: ; 0x022C25EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	cmp r1, #0xaa
	addlt r0, r1, #0x2a8
	addge r0, r1, #0x31c
	mov r0, r0, lsl #0x10
	mov r3, r2
	mov r1, r0, lsr #0x10
	mov r2, r4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [r4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	str r0, [r4, #8]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov10_022C25EC

	arm_func_start ov10_022C2638
ov10_022C2638: ; 0x022C2638
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl UnloadFile
	mov r0, r4
	mov r1, #0xc
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022C2638

	arm_func_start ov10_022C2654
ov10_022C2654: ; 0x022C2654
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	cmp r1, #0xaa
	movlt r0, r1, lsl #0x10
	addge r0, r1, #0x2a8
	movge r0, r0, lsl #0x10
	mov r3, r2
	mov r1, r0, lsr #0x10
	mov r2, r4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [r4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	str r0, [r4, #8]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov10_022C2654

	arm_func_start ov10_022C26A0
ov10_022C26A0: ; 0x022C26A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl UnloadFile
	mov r0, r4
	mov r1, #0xc
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022C26A0

	arm_func_start InitTilesetBuffer
InitTilesetBuffer: ; 0x022C26BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	cmp r1, #0xaa
	addlt r0, r1, #0x154
	addge r0, r1, #0xc5
	addge r0, r0, #0x200
	mov r0, r0, lsl #0x10
	mov r3, r2
	mov r1, r0, lsr #0x10
	add r2, sp, #4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r2, [sp]
	ldr r1, _022C271C ; =0x00001C20
	mov r0, r4
	bl DecompressAtNormalVeneer
	add r0, sp, #4
	bl UnloadFile
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022C271C: .word 0x00001C20
	arm_func_end InitTilesetBuffer

	arm_func_start ov10_022C2720
ov10_022C2720: ; 0x022C2720
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl IsBackgroundTileset
	cmp r0, #0
	mov r0, r5
	bne _022C2788
	bl ov10_022C27CC
	mov r1, r0
	add r2, sp, #4
	mov r3, r4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r2, [sp]
	mov r0, r6
	mov r1, #0x930
	bl DecompressAtNormalVeneer
	add r0, sp, #4
	bl UnloadFile
	b _022C27C4
_022C2788:
	bl ov10_022C27CC
	mov r1, r0
	add r2, sp, #4
	mov r3, r4
	mov r0, #4
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r2, [sp]
	mov r0, r6
	mov r1, #0x800
	bl DecompressAtNormalVeneer
	add r0, sp, #4
	bl UnloadFile
_022C27C4:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov10_022C2720

	arm_func_start ov10_022C27CC
ov10_022C27CC: ; 0x022C27CC
	cmp r0, #0xaa
	addlt r0, r0, #0xaa
	addge r0, r0, #0xff
	addge r0, r0, #0x200
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end ov10_022C27CC

	arm_func_start ov10_022C27E8
ov10_022C27E8: ; 0x022C27E8
	stmdb sp!, {r3, lr}
	ldr lr, [r2, r3, lsl #2]
	ldr ip, _022C2834 ; =ov10_022DC224
	ldrh lr, [lr]
	str lr, [r0]
	ldr r0, [r2, r3, lsl #2]
	ldrh r0, [r0, #2]
	str r0, [r1]
	ldr r0, [r2, r3, lsl #2]
	add r0, r0, #6
	str r0, [ip, #4]
	ldr r0, [r1]
	cmp r0, #0x3e
	movgt r0, #0x3e
	strgt r0, [r1]
	ldr r0, _022C2834 ; =ov10_022DC224
	mov r1, #0
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C2834: .word ov10_022DC224
	arm_func_end ov10_022C27E8

	arm_func_start ov10_022C2838
ov10_022C2838: ; 0x022C2838
	ldr r0, _022C2884 ; =ov10_022DC224
	ldrh r1, [r0, #2]
	cmp r1, #0
	subne r1, r1, #1
	bne _022C2868
	ldr r3, [r0, #4]
	ldrh r2, [r3]
	add r1, r3, #2
	add r1, r1, #2
	strh r2, [r0]
	str r1, [r0, #4]
	ldrh r1, [r3, #2]
_022C2868:
	strh r1, [r0, #2]
	ldrh r1, [r0]
	ldr r0, _022C2888 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_022C2884: .word ov10_022DC224
_022C2888: .word 0x00000FFF
	arm_func_end ov10_022C2838

	arm_func_start MainGame
MainGame: ; 0x022C288C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x29c
	mov r4, r0
	mov r0, #0
	mov r1, #0x2c
	bl LoadScriptVariableValue
	mov sb, r0
	mov r6, #0
	bl sub_02017A68
	mov r0, #0x10
	bl sub_02017ACC
	bl sub_0204E1E4
	cmp r4, #0
	bne _022C28D0
	bl InitEventFlagScriptVars
	mov sb, r6
	b _022C2984
_022C28D0:
	cmp sb, #6
	bne _022C2978
	cmp r4, #2
	bne _022C2938
	mov r0, #7
	bl sub_0205BA70
	mov r4, r0
	mov r2, #0xa
	mov r0, r6
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B7C8
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #9
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r2, #6
	mov r0, r6
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov sb, #7
	b _022C2984
_022C2938:
	cmp r4, #3
	bne _022C2984
	mov sb, #0xa
	mov r2, sb
	mov r0, r6
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov r0, r6
	bl sub_0205B7C8
	mov r0, #0xf
	bl LoadOverlay
	mov r0, sb
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	b _022C2984
_022C2978:
	cmp sb, #0
	cmpne sb, #0xa
	movne sb, #1
_022C2984:
	cmp sb, #0xf
	bne _022C29C8
	bl GetGameMode
	mov r4, r0
	bl sub_0204E760
	bl GetDungeonModeSpecial
	cmp r4, #5
	cmpne r0, #3
	beq _022C29C0
	mov r0, #0xd
	bl LoadOverlay
	mov r0, #0xf
	bl GroundMainLoop
	mov r0, #0xd
	bl UnloadOverlay
_022C29C0:
	mov sb, #0x10
	b _022C2984
_022C29C8:
	cmp sb, #7
	moveq r5, #0
	beq _022C2CF8
	cmp sb, #6
	moveq r5, #2
	beq _022C2CF8
	cmp sb, #0xa
	bne _022C2B0C
	bl sub_020587C8
	bl sub_02057CE8
	bl CleanStickyItemsInBag
	mov r8, #0
	ldr r5, _022C3118 ; =BAG_ITEMS_PTR_MIRROR
	mov fp, r8
	mov sl, #1
	mov r4, #6
_022C2A08:
	mul r1, r8, r4
	ldr r0, [r5]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r7, r2, r1
	tst r0, #1
	movne r0, sl
	moveq r0, fp
	tst r0, #0xff
	beq _022C2A5C
	mov r0, r7
	bl IsLosableItem
	cmp r0, #0
	beq _022C2A54
	ldrb r0, [r7, #1]
	bl sub_020582E0
	mov r0, r7
	bl ItemZInit
	b _022C2A5C
_022C2A54:
	mov r0, r7
	bl RemoveHolderForItemInBag
_022C2A5C:
	add r8, r8, #1
	cmp r8, #0x32
	blt _022C2A08
	bl RemoveEmptyItemsInBag
	mov r8, #0
	mov r7, #1
	ldr r5, _022C311C ; =TEAM_MEMBER_TABLE_PTR
	mov sl, r8
	mov fp, r7
	mov r4, #0x68
_022C2A84:
	mul r1, r8, r4
	ldr r0, [r5]
	add r0, r0, #0x9000
	ldr r0, [r0, #0x84c]
	ldrb r2, [r0, r1]
	add r1, r0, r1
	tst r2, #1
	movne r0, r7
	moveq r0, sl
	tst r0, #0xff
	beq _022C2AE4
	tst r2, #2
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _022C2AE4
	ldrb r0, [r1, #0x3e]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022C2AE4
	add r0, r1, #0x3e
	bl ItemZInit
_022C2AE4:
	add r8, r8, #1
	cmp r8, #4
	blt _022C2A84
	mov r0, #0
	bl SetMoneyCarried
	bl sub_0204AFD0
	cmp r0, #0
	beq _022C2C64
	bl sub_0205F504
	b _022C2C64
_022C2B0C:
	cmp sb, #0xb
	bne _022C2C64
	add r0, sp, #8
	mov r7, #0
	bl sub_0204F244
	bl GetGameMode
	cmp r0, #2
	beq _022C2B38
	bl GetGameMode
	cmp r0, #3
	bne _022C2B60
_022C2B38:
	bl sub_0204F050
	mov r5, r0
	bl GetDungeonMode
	mov r4, r0
	mov r0, r5
	bl IsNoLossPenaltyDungeon
	cmp r0, #0
	cmpne r4, #2
	cmpne r4, #3
	movne r7, #1
_022C2B60:
	cmp r7, #0
	bne _022C2C54
	ldrb r0, [sp, #0x64]
	cmp r0, #0xb4
	blo _022C2B7C
	cmp r0, #0xbe
	bls _022C2C54
_022C2B7C:
	ldrsh r1, [sp, #0x62]
	ldr r0, _022C3120 ; =0x00000265
	cmp r1, r0
	beq _022C2C54
	mov r7, #0
	ldr r5, _022C3118 ; =BAG_ITEMS_PTR_MIRROR
	mov fp, r7
	mov sl, #1
	mov r4, #6
_022C2BA0:
	mul r8, r7, r4
	ldr r0, [r5]
	ldr r1, [r0, #0x384]
	ldrb r0, [r1, r8]
	add r2, r1, r8
	tst r0, #1
	movne r0, sl
	moveq r0, fp
	tst r0, #0xff
	beq _022C2C34
	ldrsh r0, [r2, #4]
	cmp r0, #0xb7
	bne _022C2BF0
	ldrb r0, [r2, #1]
	bl sub_020582E0
	ldr r0, [r5]
	ldr r0, [r0, #0x384]
	add r0, r0, r8
	bl ItemZInit
	b _022C2C34
_022C2BF0:
	add r0, r1, r8
	bl IsLosableItem
	cmp r0, #0
	beq _022C2C34
	mov r0, #0x64
	bl RandInt
	cmp r0, #0x32
	bge _022C2C34
	ldr r0, [r5]
	ldr r0, [r0, #0x384]
	add r0, r0, r8
	ldrb r0, [r0, #1]
	bl sub_020582E0
	ldr r0, [r5]
	ldr r0, [r0, #0x384]
	add r0, r0, r8
	bl ItemZInit
_022C2C34:
	add r7, r7, #1
	cmp r7, #0x32
	blt _022C2BA0
	bl RemoveEmptyItemsInBag
	bl GetMoneyCarried
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	bl SetMoneyCarried
_022C2C54:
	bl sub_0204AFD0
	cmp r0, #0
	beq _022C2C64
	bl sub_0205F504
_022C2C64:
	mov r0, #0xd
	bl LoadOverlay
	mov r0, sb
	bl GroundMainLoop
	mov r5, r0
	mov r0, #0xd
	bl UnloadOverlay
	cmp r5, #9
	bne _022C2CB8
	mov r8, #0xd
	mov r7, #2
	mov r4, r8
_022C2C94:
	mov r0, r8
	bl LoadOverlay
	mov r0, r7
	bl GroundMainLoop
	mov r5, r0
	mov r0, r4
	bl UnloadOverlay
	cmp r5, #9
	beq _022C2C94
_022C2CB8:
	cmp r5, #0xa
	bne _022C2CD0
	mov r0, #0x10
	bl sub_02017ACC
	mov r6, #1
	b _022C310C
_022C2CD0:
	cmp r5, #0xb
	bne _022C2CEC
	mov r0, #1
	bl sub_02048C0C
	mov r0, #0x10
	bl sub_02017ACC
	b _022C310C
_022C2CEC:
	cmp r5, #4
	moveq sb, #0xf
	beq _022C2984
_022C2CF8:
	add r0, sp, #0xf0
	mov r1, #0x1ac
	bl MemZero
	mov r7, #0
	strb r7, [sp, #0x101]
	strb r7, [sp, #0xff]
	add sl, sp, #0x10c
	add fp, sp, #0xf0
	mov r4, r7
_022C2D1C:
	mov r0, #0x44
	mul r8, r7, r0
	mov r2, r0
	mov r1, #0
	add r0, sl, r8
	bl MemsetSimple
	add r0, fp, r8
	strb r4, [r0, #0x1c]
	add r7, r7, #1
	strh r4, [r0, #0x20]
	cmp r7, #2
	blt _022C2D1C
	cmp r5, #5
	bne _022C2D74
	bl sub_0204E7B8
	add r0, sp, #0xf0
	bl sub_0204E790
	ldrsb r1, [sp, #0xfd]
	ldrsh r2, [sp, #0xf2]
	ldr r0, _022C3124 ; =ov10_022DC094
	bl Debug_Print0
	b _022C2EF0
_022C2D74:
	cmp r5, #0
	bne _022C2E48
	bl sub_02048CB8
	ldr r1, _022C3128 ; =0x000F1207
	cmp r0, r1
	bne _022C2E18
	ldr r0, _022C312C ; =_020B0A5C
	mov r2, #1
	mov r1, #0
	ldr r0, [r0]
	strb r2, [sp, #0x101]
	strb r2, [sp, #0xf4]
	strb r1, [sp, #0xfd]
	ldrsh r0, [r0, #4]
	cmp r0, #0
	streqb r1, [sp, #0xff]
	beq _022C2DC4
	add r0, sp, #0x10c
	strb r2, [sp, #0xff]
	bl sub_0205BBFC
_022C2DC4:
	add r0, sp, #2
	bl sub_0205BC94
	ldrsh r0, [sp, #6]
	cmp r0, #0
	bne _022C2DEC
	mov r1, #0
	add r0, sp, #0x194
	strb r1, [sp, #0x100]
	bl ItemZInit
	b _022C2E20
_022C2DEC:
	ldrh r3, [sp, #2]
	add r0, sp, #0x100
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	mov r4, #1
	strh r3, [r0, #0x94]
	strb r4, [sp, #0x100]
	strh r2, [r0, #0x96]
	strh r1, [r0, #0x98]
	strb r4, [sp, #0x194]
	b _022C2E20
_022C2E18:
	mov r5, #1
	mov sb, #0xa
_022C2E20:
	ldr r0, _022C312C ; =_020B0A5C
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x44
	bl MemsetSimple
	ldr r0, _022C312C ; =_020B0A5C
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #4]
	b _022C2EF0
_022C2E48:
	cmp r5, #2
	bne _022C2EF0
	bl sub_02048BFC
	cmp r0, #2
	bne _022C2E88
	mov r1, #1
	mov r0, #0
	strb r1, [sp, #0xf4]
	strb r0, [sp, #0x101]
	bl sub_02048CB8
	ldr r1, _022C3128 ; =0x000F1207
	cmp r0, r1
	moveq r5, #2
	movne r5, #1
	movne sb, #0xa
	b _022C2E8C
_022C2E88:
	mov r5, #3
_022C2E8C:
	cmp r5, #3
	bne _022C2EE4
	bl sub_0204E6FC
	and r0, r0, #0xff
	cmp r0, #1
	mov r5, #1
	mov sb, #0xa
	bhi _022C2EF0
	bl sub_0204E770
	cmp r0, #0xff
	beq _022C2EF0
	bl DoesNotSaveWhenEntering
	cmp r0, #0
	beq _022C2ED8
	bl sub_02048BFC
	cmp r0, #2
	moveq r5, #3
	moveq sb, #6
	b _022C2EF0
_022C2ED8:
	mov r5, #7
	mov sb, #9
	b _022C2EF0
_022C2EE4:
	cmp r5, #1
	moveq r5, #1
	moveq sb, #0xa
_022C2EF0:
	cmp r5, #5
	cmpne r5, #0
	beq _022C2F08
	sub r0, r5, #2
	cmp r0, #1
	bhi _022C3100
_022C2F08:
	cmp r5, #5
	mov r4, #1
	bne _022C3014
	add r0, sp, #0
	bl sub_0204F1B4
	cmp r0, #0
	beq _022C2F5C
	ldrsb r0, [sp]
	bl sub_0205B77C
	ldrsb r1, [r0, #0xac]
	cmp r1, #1
	subgt r1, r1, #1
	movle r1, #0
	strb r1, [r0, #0xac]
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #8
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	b _022C2F84
_022C2F5C:
	bl sub_0204E770
	bl DoesNotSaveWhenEntering
	cmp r0, #0
	bne _022C2F84
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #7
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
_022C2F84:
	mov r0, #0xb
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _022C3014
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #0xd
	bl ExplorersOfSkyMain
	mov r5, r0
	mov r0, #0xf
	bl UnloadOverlay
	cmp r5, #6
	mov r4, #0
	addls pc, pc, r5, lsl #2
	b _022C2FFC
_022C2FC0: ; jump table
	b _022C2FFC ; case 0
	b _022C2FFC ; case 1
	b _022C2FFC ; case 2
	b _022C2FDC ; case 3
	b _022C2FFC ; case 4
	b _022C2FE4 ; case 5
	b _022C2FF0 ; case 6
_022C2FDC:
	mov r4, #1
	b _022C3004
_022C2FE4:
	mov r0, #2
	str r0, [sp, #0x1a0]
	b _022C3004
_022C2FF0:
	mov r0, #1
	str r0, [sp, #0x1a0]
	b _022C3004
_022C2FFC:
	mvn r0, #0
	str r0, [sp, #0x1a0]
_022C3004:
	cmp r4, #0
	bne _022C3014
	add r0, sp, #0x1b0
	bl sub_0200C4CC
_022C3014:
	cmp r4, #0
	beq _022C304C
	ldrsb r1, [sp, #0xfe]
	ldr r0, _022C3130 ; =ov10_022DC0B8
	bl Debug_Print0
	mov r0, #0xe
	bl LoadOverlay
	add r0, sp, #0xf0
	mov r1, #1
	bl RunDungeonMode
	mov r0, #0xe
	bl UnloadOverlay
	mov r0, #0
	bl sub_0204E8EC
_022C304C:
	ldr r1, [sp, #0x1a0]
	ldr r0, _022C3134 ; =ov10_022DC0D4
	bl Debug_Print0
	ldr r1, [sp, #0x1a0]
	cmp r1, #3
	moveq r6, #1
	beq _022C310C
	mvn r0, #1
	cmp r1, r0
	moveq r6, #1
	beq _022C310C
	add r0, r1, #1
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022C30D0
_022C3088: ; jump table
	b _022C30C0 ; case 0
	b _022C30D0 ; case 1
	b _022C30A4 ; case 2
	b _022C30B8 ; case 3
	b _022C30D0 ; case 4
	b _022C30AC ; case 5
	b _022C30C8 ; case 6
_022C30A4:
	mov sb, #8
	b _022C30D4
_022C30AC:
	mov sb, #8
	bl IncrementNbFriendRescues
	b _022C30D4
_022C30B8:
	mov sb, #9
	b _022C30D4
_022C30C0:
	mov sb, #0xb
	b _022C30D4
_022C30C8:
	mov sb, #0xa
	b _022C30D4
_022C30D0:
	mov sb, #0xa
_022C30D4:
	cmp sb, #8
	cmpne sb, #9
	cmpne sb, #0xb
	bne _022C30F4
	add r0, sp, #0x1b0
	mov r1, #1
	bl sub_0204F1F0
	b _022C3100
_022C30F4:
	mov r0, #0
	mov r1, r0
	bl sub_0204F1F0
_022C3100:
	mov r0, #0
	bl sub_0204E8EC
	b _022C2984
_022C310C:
	mov r0, r6
	add sp, sp, #0x29c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C3118: .word BAG_ITEMS_PTR_MIRROR
_022C311C: .word TEAM_MEMBER_TABLE_PTR
_022C3120: .word 0x00000265
_022C3124: .word ov10_022DC094
_022C3128: .word 0x000F1207
_022C312C: .word _020B0A5C
_022C3130: .word ov10_022DC0B8
_022C3134: .word ov10_022DC0D4
	arm_func_end MainGame

	arm_func_start ov10_022C3138
ov10_022C3138: ; 0x022C3138
	stmdb sp!, {r3, lr}
	mov r0, #0x44
	mov r1, #6
	bl MemAlloc
	ldr r2, _022C31A0 ; =ov10_022DC218
	mov r1, #0x44
	str r0, [r2]
	bl MemZero
	ldr r0, _022C31A0 ; =ov10_022DC218
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0
	strb r2, [r1, #0x38]
	ldr r1, [r0]
	mov r2, #0x14000
	str r3, [r1, #0x40]
	ldr r1, [r0]
	str r3, [r1, #0x3c]
	ldr r1, [r0]
	str r2, [r1, #0x2c]
	ldr r2, [r0]
	ldr r1, [r2, #0x2c]
	str r1, [r2, #0x30]
	ldr r0, [r0]
	str r3, [r0, #0x34]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C31A0: .word ov10_022DC218
	arm_func_end ov10_022C3138

	arm_func_start ov10_022C31A4
ov10_022C31A4: ; 0x022C31A4
	stmdb sp!, {r3, lr}
	ldr r0, _022C3200 ; =ov10_022DC218
	ldr r0, [r0]
	cmp r0, #0
	ldrneb r1, [r0, #0x38]
	cmpne r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _022C3204 ; =0x00000401
	mov r1, #4
	mov r3, #0xf
	bl LoadWteFromFileDirectory
	ldr r0, _022C3200 ; =ov10_022DC218
	mov r1, #0
	ldr r0, [r0]
	mov r3, r1
	ldr r0, [r0, #4]
	mov r2, #0x1d
	bl ProcessWte
	ldr r0, _022C3200 ; =ov10_022DC218
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x38]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C3200: .word ov10_022DC218
#ifdef JAPAN
_022C3204: .word 0x000003F5
#else
_022C3204: .word 0x00000401
#endif
	arm_func_end ov10_022C31A4

	arm_func_start ov10_022C3208
ov10_022C3208: ; 0x022C3208
	stmdb sp!, {r4, lr}
	ldr ip, _022C3288 ; =ov10_022DC218
	ldr lr, [sp, #8]
	ldr r4, [ip]
	mov lr, lr, lsl #8
	str lr, [r4, #8]
	ldr r4, [ip]
	mov lr, #0
	str lr, [r4, #0xc]
	ldr lr, [r1]
	ldr r4, [ip]
	ldr r1, [r1, #4]
	str lr, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r4, #0x20]
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x18]
	str r1, [r4, #0x1c]
	str r3, [r4, #0x28]
	ldr r0, [ip]
	str r2, [r0, #0x2c]
	ldr r1, [ip]
	ldr r0, [r1, #0x2c]
	str r0, [r1, #0x30]
	ldr r1, [ip]
	ldr r0, [r1, #0x34]
	add r0, r0, #1
	str r0, [r1, #0x34]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C3288: .word ov10_022DC218
	arm_func_end ov10_022C3208

	arm_func_start ov10_022C328C
ov10_022C328C: ; 0x022C328C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _022C331C ; =ov10_022DC0F0
	ldr r3, _022C3320 ; =ov10_022DC218
	ldr lr, [ip, #8]
	ldr ip, [ip, #4]
	str lr, [sp, #8]
	str ip, [sp, #4]
	ldr ip, [r0]
	ldr r3, [r3]
	mov ip, ip, lsl #8
	str ip, [sp, #4]
	ldr r0, [r0, #4]
	mov lr, r1
	mov r1, r0, lsl #8
	str r1, [sp, #8]
	ldr r0, [r3, #0x34]
	cmp r0, #0
	streq ip, [r3, #0x20]
	streq r1, [r3, #0x24]
	ldr r0, _022C3320 ; =ov10_022DC218
	add r1, sp, #4
	ldr r0, [r0]
	mov r3, lr, lsl #8
	str r2, [sp]
	ldr r2, [r0, #0x30]
	add r0, r0, #0x20
	bl ov10_022C3208
	ldr r0, _022C3320 ; =ov10_022DC218
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #0x40]
	ldr r0, [r0]
	str r2, [r0, #0x3c]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_022C331C: .word ov10_022DC0F0
_022C3320: .word ov10_022DC218
	arm_func_end ov10_022C328C

	arm_func_start ov10_022C3324
ov10_022C3324: ; 0x022C3324
	stmdb sp!, {r3, lr}
	ldr r1, _022C3374 ; =ov10_022DC218
	mov r3, #0x14000
	ldr r1, [r1]
	str r0, [sp]
	ldr r2, [r1, #0x30]
	add r0, r1, #0x20
	add r1, r1, #0x20
	bl ov10_022C3208
	ldr r0, _022C3374 ; =ov10_022DC218
	mov r2, #2
	ldr r1, [r0]
	mov r3, #1
	str r2, [r1, #0x40]
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x34]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C3374: .word ov10_022DC218
	arm_func_end ov10_022C3324

	arm_func_start ov10_022C3378
ov10_022C3378: ; 0x022C3378
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _022C34EC ; =ov10_022DC218
	ldr r6, [r0]
	ldr r0, [r6, #0x3c]
	cmp r0, #0
	moveq r0, #0
	beq _022C34E4
	ldr r0, [r6, #8]
	ldr r7, [r6, #0xc]
	mov r4, #1
	cmp r0, r7
	bne _022C33EC
	ldr r0, [r6, #0x40]
	cmp r0, #2
	moveq r0, #0
	streq r0, [r6, #0x3c]
	moveq r4, #3
	beq _022C33CC
	cmp r0, #1
	moveq r4, #2
_022C33CC:
	ldr r0, _022C34EC ; =ov10_022DC218
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	ldr r0, [r2, #0x14]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r2, #0x28]
	b _022C34C4
_022C33EC:
	sub r5, r0, r7
	ldr r1, [r6, #0x18]
	mov r0, r5
	bl MultiplyByFixedPoint
	mov r8, r0
	ldr r1, [r6, #0x10]
	mov r0, r7
	bl MultiplyByFixedPoint
	ldr r1, _022C34EC ; =ov10_022DC218
	add r0, r8, r0
	ldr r1, [r1]
	str r0, [sp]
	ldr r1, [r1, #8]
	bl sub_02001AB0
	ldr r1, _022C34EC ; =ov10_022DC218
	str r0, [sp]
	ldr r1, [r1]
	mov r0, r5
	ldr r1, [r1, #0x1c]
	bl MultiplyByFixedPoint
	ldr r1, _022C34EC ; =ov10_022DC218
	mov r6, r0
	ldr r1, [r1]
	mov r0, r7
	ldr r1, [r1, #0x14]
	bl MultiplyByFixedPoint
	add r0, r6, r0
	str r0, [sp, #4]
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl sub_02001AB0
	str r0, [sp, #4]
	mov r0, r5
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r1, [r1]
	ldr r1, [r1, #0x2c]
	bl MultiplyByFixedPoint
	mov r5, r0
	mov r0, r7
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r1, [r1]
	ldr r1, [r1, #0x28]
	bl MultiplyByFixedPoint
	add r0, r5, r0
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl sub_02001AB0
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r2, [r1]
	ldr r1, [r2, #0xc]
	add r1, r1, #0x100
	str r1, [r2, #0xc]
_022C34C4:
	ldr r1, _022C34EC ; =ov10_022DC218
	ldr r2, [sp]
	ldr r3, [r1]
	ldr r1, [sp, #4]
	str r2, [r3, #0x20]
	str r1, [r3, #0x24]
	str r0, [r3, #0x30]
	mov r0, r4
_022C34E4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C34EC: .word ov10_022DC218
	arm_func_end ov10_022C3378

	arm_func_start ov10_022C34F0
ov10_022C34F0: ; 0x022C34F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x80
	ldr r0, _022C388C ; =ov10_022DC218
	ldr r1, [r0]
	cmp r1, #0
	beq _022C3884
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq _022C3520
	ldr r0, [r1, #0x40]
	cmp r0, #2
	beq _022C352C
_022C3520:
	ldr r0, [r1, #0x40]
	cmp r0, #1
	bne _022C3884
_022C352C:
	ldr r0, _022C388C ; =ov10_022DC218
	mov r1, #0x3000
	ldr r4, [r0]
	ldr r2, [r4, #0x20]
	ldr r0, [r4, #0x24]
	mov r3, r2, asr #8
	mov r2, r0, asr #8
	ldr r0, [r4, #0x30]
	mov r4, r3, lsl #0x10
	mov r5, r2, lsl #0x10
	bl sub_02001AB0
	mov r1, r0
	mov r0, #0x3000
	bl MultiplyByFixedPoint
	mov r2, #0x140
	mov r1, r0, asr #7
	add r0, r0, r1, lsr #24
	mov r1, r0, asr #8
	rsb r0, r1, #0
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r2
	rsb r0, r0, #0
	strh r0, [sp, #0x10]
	strh r0, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r0, [sp, #0x16]
	strh r0, [sp, #0x18]
	strh r2, [sp, #0x1a]
	strh r2, [sp, #0x1c]
	strh r2, [sp, #0x1e]
	strh r0, [sp, #0x60]
	strh r0, [sp, #0x68]
	strh r3, [sp, #0x62]
	strh r3, [sp, #0x64]
	strh r3, [sp, #0x66]
	strh r1, [sp, #0x6a]
	strh r3, [sp, #0x6c]
	strh r1, [sp, #0x6e]
	strh r1, [sp, #0x70]
	strh r3, [sp, #0x72]
	strh r2, [sp, #0x74]
	strh r2, [sp, #0x7c]
	strh r3, [sp, #0x76]
	strh r1, [sp, #0x78]
	strh r1, [sp, #0x7a]
	strh r1, [sp, #0x7e]
	mov r2, #0
	add r0, sp, #0x10
	add r6, sp, #0x18
_022C35FC:
	mov r8, r2, lsl #2
	ldrsh r7, [r0, r8]
	ldrsh r3, [r6, r8]
	add r1, r0, r2, lsl #2
	add r7, r7, r4, asr #16
	add r3, r3, r4, asr #16
	strh r7, [r0, r8]
	add r7, r6, r2, lsl #2
	strh r3, [r6, r8]
	ldrsh r8, [r1, #2]
	ldrsh r3, [r7, #2]
	add r2, r2, #1
	add r8, r8, r5, asr #16
	add r3, r3, r5, asr #16
	strh r8, [r1, #2]
	strh r3, [r7, #2]
	cmp r2, #2
	blt _022C35FC
	mov r2, #0
	add r0, sp, #0x60
	add r6, sp, #0x70
_022C3650:
	mov r8, r2, lsl #2
	ldrsh r7, [r0, r8]
	ldrsh r3, [r6, r8]
	add r1, r0, r2, lsl #2
	add r7, r7, r4, asr #16
	add r3, r3, r4, asr #16
	strh r7, [r0, r8]
	add r7, r6, r2, lsl #2
	strh r3, [r6, r8]
	ldrsh r8, [r1, #2]
	ldrsh r3, [r7, #2]
	add r2, r2, #1
	add r8, r8, r5, asr #16
	add r3, r3, r5, asr #16
	strh r8, [r1, #2]
	strh r3, [r7, #2]
	cmp r2, #4
	blt _022C3650
	add r0, sp, #0x20
	bl InitRender3dElement64
	mov r0, #5
	strb r0, [sp, #0x5c]
	mov r2, #0
	ldr r0, _022C388C ; =ov10_022DC218
	str r2, [sp]
	ldr r1, [r0]
	add r0, sp, #0x20
	ldr r1, [r1, #4]
	mov r3, #0x1d
	bl sub_0201E774
	mov r7, #0
	mov r6, #4
	ldrsh r0, [sp, #0x12]
	ldrsh r4, [sp, #0x10]
	ldrsh r3, [sp, #0x14]
	strh r0, [sp, #0x22]
	mov r0, #0xff
	ldrsh r2, [sp, #0x16]
	ldrsh r1, [sp, #0x60]
	ldrsh r5, [sp, #0x62]
	ldrsh fp, [sp, #0x74]
	strh r4, [sp, #0x20]
	ldrsh r4, [sp, #0x76]
	strb r0, [sp, #0x4f]
	mov r0, #0x30
	strh r0, [sp, #0x4a]
	mov r0, #0x22
	strb r0, [sp, #0x5e]
	add r0, sp, #0x20
	strh r3, [sp, #0x24]
	strh r7, [sp, #0x36]
	strh r7, [sp, #0x38]
	strh r6, [sp, #0x3a]
	strh r6, [sp, #0x3c]
	strh r2, [sp, #0x26]
	strh r1, [sp, #0x28]
	strh r5, [sp, #0x2a]
	strh fp, [sp, #0x2c]
	strh r4, [sp, #0x2e]
	bl ov10_022C38D4
	add r0, sp, #0x20
	bl sub_0201F2A0
	ldrsh r6, [sp, #0x68]
	ldrsh r7, [sp, #0x6a]
	ldrsh r0, [sp, #0x7c]
	str r0, [sp, #0xc]
	ldrsh r0, [sp, #0x7e]
	str r0, [sp, #8]
	strh r6, [sp, #0x20]
	strh r7, [sp, #0x22]
	ldr r0, [sp, #0xc]
	ldrsh r1, [sp, #0x1a]
	strh r0, [sp, #0x24]
	ldr r0, [sp, #8]
	ldrsh r2, [sp, #0x18]
	strh r0, [sp, #0x26]
	ldrsh r0, [sp, #0x1c]
	strh r1, [sp, #0x2a]
	ldrsh r1, [sp, #0x1e]
	strh r0, [sp, #0x2c]
	add r0, sp, #0x20
	strh r2, [sp, #0x28]
	strh r1, [sp, #0x2e]
	bl ov10_022C38D4
	add r0, sp, #0x20
	bl sub_0201F2A0
	ldrsh r0, [sp, #0x60]
	strh r5, [sp, #0x22]
	strh r6, [sp, #0x28]
	ldrsh r5, [sp, #0x64]
	ldrsh r6, [sp, #0x66]
	strh r0, [sp, #0x20]
	ldrsh r0, [sp, #0x6c]
	strh r7, [sp, #0x2a]
	strh r5, [sp, #0x24]
	strh r6, [sp, #0x26]
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	ldrsh r8, [sp, #0x6e]
	add r0, sp, #0x20
	strh r1, [sp, #0x2c]
	strh r8, [sp, #0x2e]
	bl ov10_022C38D4
	add r0, sp, #0x20
	bl sub_0201F2A0
	ldrsh r7, [sp, #0x72]
	ldrsh sb, [sp, #0x78]
	ldrsh sl, [sp, #0x7a]
	ldrsh r1, [sp, #0x70]
	strh r7, [sp, #0x22]
	strh fp, [sp, #0x24]
	strh r4, [sp, #0x26]
	strh sb, [sp, #0x28]
	strh sl, [sp, #0x2a]
	strh r1, [sp, #0x20]
	ldr r1, [sp, #0xc]
	add r0, sp, #0x20
	strh r1, [sp, #0x2c]
	ldr r1, [sp, #8]
	strh r1, [sp, #0x2e]
	bl ov10_022C38D4
	add r0, sp, #0x20
	bl sub_0201F2A0
	ldrsh r1, [sp, #0x70]
	strh r5, [sp, #0x20]
	strh r6, [sp, #0x22]
	strh r7, [sp, #0x26]
	strh r1, [sp, #0x24]
	ldr r1, [sp, #4]
	mov r3, #0
	mov r2, #0x60
	add r0, sp, #0x20
	strh r1, [sp, #0x28]
	strh r8, [sp, #0x2a]
	strh sb, [sp, #0x2c]
	strh sl, [sp, #0x2e]
	strh r3, [sp, #0x36]
	strh r3, [sp, #0x38]
	strh r2, [sp, #0x3a]
	strh r2, [sp, #0x3c]
	bl sub_0201F2A0
_022C3884:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C388C: .word ov10_022DC218
	arm_func_end ov10_022C34F0

	arm_func_start ov10_022C3890
ov10_022C3890: ; 0x022C3890
	stmdb sp!, {r3, lr}
	ldr r0, _022C38D0 ; =ov10_022DC218
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0]
	cmp r1, #0
	beq _022C38B4
	bl UnloadWte
_022C38B4:
	ldr r0, _022C38D0 ; =ov10_022DC218
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022C38D0 ; =ov10_022DC218
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C38D0: .word ov10_022DC218
	arm_func_end ov10_022C3890

	arm_func_start ov10_022C38D4
ov10_022C38D4: ; 0x022C38D4
	stmdb sp!, {r4, lr}
	mov r4, #0
	mvn lr, #0xf
	mov ip, #0x110
	mov r1, #0xd0
_022C38E8:
	mov r3, r4, lsl #2
	ldrsh r2, [r0, r3]
	cmp r2, lr
	strlth lr, [r0, r3]
	mov r3, r4, lsl #2
	ldrsh r2, [r0, r3]
	cmp r2, #0x110
	strgth ip, [r0, r3]
	add r3, r0, r4, lsl #2
	ldrsh r2, [r3, #2]
	cmp r2, lr
	strlth lr, [r3, #2]
	add r3, r0, r4, lsl #2
	ldrsh r2, [r3, #2]
	add r4, r4, #1
	cmp r2, #0xd0
	strgth r1, [r3, #2]
	cmp r4, #4
	blt _022C38E8
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022C38D4

	arm_func_start ov10_022C3938
ov10_022C3938: ; 0x022C3938
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	ldr r4, _022C3E80 ; =ov10_022DC0FC
	str r1, [sp, #0x10]
	ldr r5, [r4, #0xc]
	ldr r6, [r4, #8]
	str r3, [sp, #0x18]
	ldr r3, [sp, #0x90]
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	mov r4, #0
	str r4, [sp, #0x60]
	ldr r1, _022C3E84 ; =ov10_022DC114
	add r0, sp, #0x64
	str r6, [sp, #0x64]
	mov r2, #6
	str r5, [sp, #0x68]
	str r3, [sp, #0x90]
	ldr r4, [sp, #0x94]
	ldr sl, [sp, #0x9c]
	ldr sb, [sp, #0xa0]
	ldr r8, [sp, #0xa4]
	bl LoadFileFromRom
	ldr r1, [sp, #0x64]
	add r0, sp, #0x60
	bl HandleSir0Translation
	ldrb r5, [r4]
	ldr r6, [sp, #0x60]
	cmp r5, #0xb4
	movhs r5, #0
	mov r0, r5
	bl GetDungeonGroup
	ldrb r3, [r4, #1]
	mov r4, r0
	add r0, sp, #0x5d
	add r1, sp, #0x5c
	mov r2, r5
	bl ov10_022C42F4
	ldrb r2, [sp, #0x5d]
	mov r1, r5
	ldmia r6, {r0, r3}
	ldr r5, [r0, r4, lsl #2]
	mov r0, r2, lsl #2
	ldrsh r0, [r5, r0]
	add r7, r5, r2, lsl #2
	ldrb fp, [sp, #0x5c]
	ldrb r5, [r3, r0, lsl #2]
	ldr r0, _022C3E88 ; =ov10_022DC130
	mov r3, r4
	str fp, [sp]
	str r7, [sp, #4]
	str r5, [sp, #8]
	bl Debug_Print0
	ldrb r0, [sp, #0x5c]
	cmp r0, #1
	bls _022C3A64
	ldrb r0, [sp, #0x5d]
	b _022C3A48
_022C3A20:
	and r0, r0, #0xff
	sub r0, r0, #1
	strb r0, [sp, #0x5d]
	ldr r2, [r6]
	and r1, r0, #0xff
	ldr r2, [r2, r4, lsl #2]
	mov r1, r1, lsl #2
	ldrsh r1, [r2, r1]
	ldr r2, [r6, #4]
	ldrb r5, [r2, r1, lsl #2]
_022C3A48:
	and r1, r0, #0xff
	cmp r1, #1
	bls _022C3A64
	cmp r5, #0xaa
	blt _022C3A64
	cmp r5, #0xc7
	blt _022C3A20
_022C3A64:
	add r0, sp, #0x64
	bl UnloadFile
	mov r0, #0x930
	mov r1, #0x10
	bl MemAlloc
	str r0, [sp, #0x38]
	mov r1, r5, lsl #0x10
	ldr r0, [sp, #0x14]
	mov r1, r1, asr #0x10
	mov r2, #0x10
	bl ov10_022C2588
	mov r1, r5, lsl #0x10
	ldr r0, [sp, #0xc]
	mov r1, r1, asr #0x10
	mov r2, #0x10
	bl ov10_022C25EC
	mov r1, r5, lsl #0x10
	ldr r0, [sp, #0x18]
	mov r1, r1, asr #0x10
	mov r2, #0x10
	bl InitTilesetBuffer
	mov r1, r5, lsl #0x10
	ldr r0, [sp, #0x38]
	mov r1, r1, asr #0x10
	mov r2, #0x10
	bl ov10_022C2720
	mov r6, #0
	b _022C3E54
_022C3AD4:
	mov r0, r5
	bl sub_0204F55C
	cmp r0, #0
	sub r0, r6, #1
	str r0, [sp, #0x20]
	mul r1, r6, sl
	ldr r0, [sp, #0x90]
	movne r7, #3
	add r0, r0, r1, lsl #1
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x38]
	mov r4, #0
	add r0, r0, r6, lsl #6
	str r0, [sp, #0x40]
	mov r0, #0xff
	bic r0, r0, #1
	str r0, [sp, #0x48]
	mov r0, #0xff
	bic r0, r0, #1
	str r0, [sp, #0x4c]
	mov r0, #0xff
	bic r0, r0, #1
	str r0, [sp, #0x50]
	mov r0, r4
	orr r0, r0, #1
	moveq r7, #0
	str r0, [sp, #0x54]
	b _022C3E48
_022C3B44:
	str r8, [sp]
	mov r0, r4
	mov r1, r6
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	str r0, [sp, #0x3c]
	cmp r5, #0xaa
	blt _022C3B88
	cmp r4, #0x20
	cmplt r6, #0x20
	ldrlt r0, [sp, #0x40]
	movlt r1, r4, lsl #1
	ldrlth r2, [r1, r0]
	movge r2, r7
	b _022C3E38
_022C3B88:
	str r8, [sp]
	str r7, [sp, #4]
	mov r0, r4
	add r1, r6, #1
	mov r2, sl
	mov r3, sb
	bl ov10_022C434C
	str r8, [sp]
	str r0, [sp, #0x44]
	str r7, [sp, #4]
	add r0, r4, #1
	add r1, r6, #1
	mov r2, sl
	mov r3, sb
	bl ov10_022C434C
	str r8, [sp]
	str r0, [sp, #0x34]
	add r0, r4, #1
	mov r1, r6
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	str r8, [sp]
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x20]
	add r0, r4, #1
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	str r8, [sp]
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	mov r0, r4
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	str r0, [sp, #0x28]
	sub r0, r4, #1
	str r8, [sp]
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x1c]
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	str r0, [sp, #0x24]
	str r8, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, r6
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	mov fp, r0
	str r8, [sp]
	ldr r0, [sp, #0x1c]
	add r1, r6, #1
	mov r2, sl
	mov r3, sb
	str r7, [sp, #4]
	bl ov10_022C434C
	ldr r1, [sp, #0x3c]
	cmp r1, #1
	bne _022C3CF8
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	cmp r1, #0
	mov r1, #0xff
	ldreq r1, [sp, #0x48]
	cmp r2, #0
	ldr r2, [sp, #0x30]
	biceq r1, r1, #2
	cmp r2, #0
	ldr r2, [sp, #0x2c]
	biceq r1, r1, #4
	cmp r2, #0
	ldr r2, [sp, #0x28]
	biceq r1, r1, #8
	cmp r2, #0
	ldr r2, [sp, #0x24]
	biceq r1, r1, #0x10
	cmp r2, #0
	biceq r1, r1, #0x20
	cmp fp, #0
	biceq r1, r1, #0x40
	cmp r0, #0
	biceq r1, r1, #0x80
	orr r1, r1, #0x200
	b _022C3E2C
_022C3CF8:
	cmp r1, #2
	bne _022C3D64
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	cmp r1, #2
	mov r1, #0xff
	ldrne r1, [sp, #0x4c]
	cmp r2, #2
	ldr r2, [sp, #0x30]
	bicne r1, r1, #2
	cmp r2, #2
	ldr r2, [sp, #0x2c]
	bicne r1, r1, #4
	cmp r2, #2
	ldr r2, [sp, #0x28]
	bicne r1, r1, #8
	cmp r2, #2
	ldr r2, [sp, #0x24]
	bicne r1, r1, #0x10
	cmp r2, #2
	bicne r1, r1, #0x20
	cmp fp, #2
	bicne r1, r1, #0x40
	cmp r0, #2
	bicne r1, r1, #0x80
	orr r1, r1, #0x100
	b _022C3E2C
_022C3D64:
	cmp r1, #3
	bne _022C3DD0
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	cmp r1, #3
	mov r1, #0xff
	ldrne r1, [sp, #0x50]
	cmp r2, #3
	ldr r2, [sp, #0x30]
	bicne r1, r1, #2
	cmp r2, #3
	ldr r2, [sp, #0x2c]
	bicne r1, r1, #4
	cmp r2, #3
	ldr r2, [sp, #0x28]
	bicne r1, r1, #8
	cmp r2, #3
	ldr r2, [sp, #0x24]
	bicne r1, r1, #0x10
	cmp r2, #3
	bicne r1, r1, #0x20
	cmp fp, #3
	bicne r1, r1, #0x40
	cmp r0, #3
	bicne r1, r1, #0x80
	orr r1, r1, #0x100
	b _022C3E2C
_022C3DD0:
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	cmp r1, #0
	mov r1, #0
	ldreq r1, [sp, #0x54]
	cmp r2, #0
	ldr r2, [sp, #0x30]
	orreq r1, r1, #2
	cmp r2, #0
	ldr r2, [sp, #0x2c]
	orreq r1, r1, #4
	cmp r2, #0
	ldr r2, [sp, #0x28]
	orreq r1, r1, #8
	cmp r2, #0
	ldr r2, [sp, #0x24]
	orreq r1, r1, #0x10
	cmp r2, #0
	orreq r1, r1, #0x20
	cmp fp, #0
	orreq r1, r1, #0x40
	cmp r0, #0
	orreq r1, r1, #0x80
_022C3E2C:
	ldr r0, [sp, #0x38]
	add r1, r1, r1, lsl #1
	ldrb r2, [r0, r1]
_022C3E38:
	ldr r0, [sp, #0x58]
	mov r1, r4, lsl #1
	strh r2, [r1, r0]
	add r4, r4, #1
_022C3E48:
	cmp r4, sl
	blt _022C3B44
	add r6, r6, #1
_022C3E54:
	cmp r6, sb
	blt _022C3AD4
	ldr r0, [sp, #0x38]
	bl MemFree
	mov r1, r5, lsl #0x10
	ldr r0, [sp, #0x10]
	mov r1, r1, asr #0x10
	mov r2, #0x10
	bl ov10_022C2654
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C3E80: .word ov10_022DC0FC
_022C3E84: .word ov10_022DC114
_022C3E88: .word ov10_022DC130
	arm_func_end ov10_022C3938

	arm_func_start ov10_022C3E8C
ov10_022C3E8C: ; 0x022C3E8C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	ldr r4, _022C42E8 ; =ov10_022DC0FC
	mov r8, r1
	ldr r5, [r4, #4]
	ldr r6, [r4]
	mov sb, r0
	mov sl, r2
	mov r4, #0
	str r5, [sp, #0x24]
	ldr r1, _022C42EC ; =ov10_022DC114
	add r0, sp, #0x20
	str r6, [sp, #0x20]
	mov r2, #6
	mov fp, r3
	str r4, [sp, #0x10]
	ldr r5, [sp, #0x50]
	bl LoadFileFromRom
	ldr r1, [sp, #0x20]
	add r0, sp, #0x10
	bl HandleSir0Translation
	ldrb r0, [r5]
	ldr r6, [sp, #0x10]
	bl GetDungeonGroup
	mov r7, r0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	add r0, sp, #0xd
	add r1, sp, #0xc
	bl ov10_022C42F4
	ldr r2, [r6]
	ldrb r1, [sp, #0xd]
	ldr r2, [r2, r7, lsl #2]
	ldr r0, [r6, #4]
	mov r1, r1, lsl #2
	ldrsh r1, [r2, r1]
	add r0, r0, r1, lsl #2
	ldrb r5, [r0, #1]
	cmp r5, #0
	beq _022C42D4
	ldr r1, _022C42E8 ; =ov10_022DC0FC
	add r0, sp, #0x18
	ldr r3, [r1, #0x14]
	ldr r2, [r1, #0x10]
	ldr r1, _022C42F0 ; =ov10_022DC190
	str r2, [sp, #0x18]
	mov r2, #0xf
	str r3, [sp, #0x1c]
	bl LoadFileFromRom
	ldr r1, [sp, #0x18]
	add r0, sp, #0x14
	bl HandleSir0Translation
	ldr r2, [sp, #0x14]
	mov r3, r5
	mov r0, sl
	mov r1, fp
	bl ov10_022C27E8
	ldr r0, [fp]
	mov r3, #0
	str r0, [sp, #4]
	add r5, r0, #0xa
	ldr r4, [sl]
	mov r0, r3
	mov r1, r3
	b _022C3FB8
_022C3F90:
	mul r6, r3, r8
	mov r2, r1
	b _022C3FAC
_022C3F9C:
	add r7, r2, r6
	mov r7, r7, lsl #1
	strh r0, [sb, r7]
	add r2, r2, #1
_022C3FAC:
	cmp r2, r8
	blt _022C3F9C
	add r3, r3, #1
_022C3FB8:
	cmp r3, r5
	blt _022C3F90
	mov r6, #5
	b _022C4238
_022C3FC8:
	mul r0, r6, r8
	str r0, [sp]
	add r0, r4, #5
	mov r7, #5
	str r0, [sp, #8]
	b _022C4228
_022C3FE0:
	bl ov10_022C2838
	ldr r1, [sp]
	cmp r7, #0
	add r1, r7, r1
	and r0, r0, #0xff
	add r1, sb, r1, lsl #1
	cmpge r6, #0
	blt _022C4224
	cmp r7, r8
	cmplt r6, r5
	bge _022C4224
	cmp r0, #0x10
	blo _022C402C
	ldrh r2, [r1]
	bic r2, r2, #3
	strh r2, [r1]
	ldrh r2, [r1]
	orr r2, r2, #1
	strh r2, [r1]
_022C402C:
	cmp r0, #0x43
	bgt _022C4084
	bge _022C4144
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _022C4224
_022C4044: ; jump table
	b _022C409C ; case 0
	b _022C40B8 ; case 1
	b _022C40D4 ; case 2
	b _022C4224 ; case 3
	b _022C409C ; case 4
	b _022C40F0 ; case 5
	b _022C410C ; case 6
	b _022C4224 ; case 7
	b _022C4144 ; case 8
	b _022C409C ; case 9
	b _022C4128 ; case 10
	b _022C4188 ; case 11
	b _022C41A8 ; case 12
	b _022C41D4 ; case 13
	b _022C420C ; case 14
	b _022C4224 ; case 15
_022C4084:
	cmp r0, #0x44
	bgt _022C4094
	beq _022C4160
	b _022C4224
_022C4094:
	cmp r0, #0x45
	b _022C4224
_022C409C:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
	b _022C4224
_022C40B8:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	bic r0, r0, #0x100
	strh r0, [r1]
	b _022C4224
_022C40D4:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x10
	strh r0, [r1]
	b _022C4224
_022C40F0:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #2
	strh r0, [r1]
	b _022C4224
_022C410C:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #3
	strh r0, [r1]
	b _022C4224
_022C4128:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x13
	strh r0, [r1]
	b _022C4224
_022C4144:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
	b _022C4224
_022C4160:
	ldrh r0, [r1]
	orr r0, r0, #0x800
	strh r0, [r1]
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
	b _022C4224
_022C4188:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	orr r0, r0, #0x800
	strh r0, [r1]
	b _022C4224
_022C41A8:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	orr r0, r0, #0x1000
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x810
	strh r0, [r1]
	b _022C4224
_022C41D4:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #1
	orr r0, r0, #0x1000
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x810
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x2000
	strh r0, [r1]
	b _022C4224
_022C420C:
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x10
	strh r0, [r1]
_022C4224:
	add r7, r7, #1
_022C4228:
	ldr r0, [sp, #8]
	cmp r7, r0
	blt _022C3FE0
	add r6, r6, #1
_022C4238:
	ldr r0, [sp, #4]
	add r2, r0, #5
	cmp r6, r2
	blt _022C3FC8
	mov r6, #0
	add r1, r4, #5
	mov lr, #0x100
	b _022C42AC
_022C4258:
	mul r3, r6, r8
	mov r7, #0
	b _022C42A0
_022C4264:
	cmp r7, #5
	add r0, r7, r3
	blt _022C4288
	cmp r7, r1
	bge _022C4288
	cmp r6, #5
	blt _022C4288
	cmp r6, r2
	blt _022C429C
_022C4288:
	mov r0, r0, lsl #1
	strh lr, [sb, r0]
	ldrh ip, [sb, r0]
	orr ip, ip, #0x10
	strh ip, [sb, r0]
_022C429C:
	add r7, r7, #1
_022C42A0:
	cmp r7, r8
	blt _022C4264
	add r6, r6, #1
_022C42AC:
	cmp r6, r5
	blt _022C4258
	add r0, sp, #0x18
	bl UnloadFile
	add r0, r4, #0xa
	str r0, [sl]
	ldr r0, [sp, #4]
	mov r4, #1
	add r0, r0, #0xa
	str r0, [fp]
_022C42D4:
	add r0, sp, #0x20
	bl UnloadFile
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C42E8: .word ov10_022DC0FC
_022C42EC: .word ov10_022DC114
_022C42F0: .word ov10_022DC190
	arm_func_end ov10_022C3E8C

	arm_func_start ov10_022C42F4
ov10_022C42F4: ; 0x022C42F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r7, r0
	mov r4, r3
	mov r0, r5
	mov r6, r1
	bl GetNbFloors
	cmp r4, r0
	movgt r4, r0
	mov r0, r5
	bl GetNbPrecedingFloors
	add r4, r4, r0
	mov r0, r5
	bl GetNbFloorsDungeonGroup
	cmp r4, #1
	movlt r4, #1
	blt _022C4340
	cmp r4, r0
	movgt r4, r0
_022C4340:
	strb r4, [r7]
	strb r0, [r6]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov10_022C42F4

	arm_func_start ov10_022C434C
ov10_022C434C: ; 0x022C434C
	ldr ip, [sp, #4]
	cmp r0, #0
	movlt r0, ip
	bxlt lr
	cmp r1, #0
	movlt r0, ip
	bxlt lr
	cmp r0, r2
	movge r0, ip
	bxge lr
	cmp r1, r3
	mlalt r0, r1, r2, r0
	ldrlt r1, [sp]
	movlt r0, r0, lsl #1
	ldrlth r0, [r1, r0]
	andlt ip, r0, #3
	mov r0, ip
	bx lr
	arm_func_end ov10_022C434C
	; 0x022C4394

	.rodata
	.global INVENTORY_MENU_DEFAULT_WINDOW_PARAMS
INVENTORY_MENU_DEFAULT_WINDOW_PARAMS:
	.word UpdateInventoryMenu
	.byte 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43A4
ov10_022C43A4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x00, 0x00
	.global ov10_022C43B0
ov10_022C43B0:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x11, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43C0
ov10_022C43C0:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x02, 0x12, 0x06, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43D0
ov10_022C43D0:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x06, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43E0
ov10_022C43E0:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x02, 0x12, 0x11, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43F0
ov10_022C43F0:
	.byte 0x25, 0x64, 0x25, 0x73
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov10_022C43F8
ov10_022C43F8:
	.byte 0x5B, 0x4D, 0x53, 0x3A, 0x31, 0x5D, 0x25, 0x73, 0x00, 0x00, 0x00, 0x00
	.global ov10_022C4404
ov10_022C4404:
	.byte 0x20, 0x20, 0x3F, 0x3F, 0x3F, 0x00, 0x00, 0x00
	.global FIRST_DUNGEON_WITH_MONSTER_HOUSE_TRAPS
FIRST_DUNGEON_WITH_MONSTER_HOUSE_TRAPS:
	.byte 0x1C, 0x00, 0x00, 0x00
	.global ov10_022C4410
ov10_022C4410:
	.byte 0xC8, 0x00, 0x00, 0x00
	.global BAD_POISON_DAMAGE_COOLDOWN
BAD_POISON_DAMAGE_COOLDOWN:
	.byte 0x05, 0x00, 0x00, 0x00
	.global ov10_022C4418
ov10_022C4418:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C441C
ov10_022C441C:
	.byte 0xC8, 0x00, 0x00, 0x00
	.global PROTEIN_STAT_BOOST
PROTEIN_STAT_BOOST:
	.byte 0x03, 0x00, 0x00, 0x00
	.global WATERFALL_CRINGE_CHANCE
WATERFALL_CRINGE_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global AURORA_BEAM_LOWER_ATTACK_CHANCE
AURORA_BEAM_LOWER_ATTACK_CHANCE:
	.byte 0x3C, 0x00, 0x00, 0x00
	.global ov10_022C442C
ov10_022C442C:
	.byte 0x21, 0x00, 0x00, 0x00
	.global SPAWN_CAP_NO_MONSTER_HOUSE
SPAWN_CAP_NO_MONSTER_HOUSE:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global ov10_022C4434
ov10_022C4434:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global OREN_BERRY_DAMAGE
OREN_BERRY_DAMAGE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov10_022C443C
ov10_022C443C:
	.byte 0xC9, 0x00, 0x00, 0x00
	.global IRON_TAIL_LOWER_DEFENSE_CHANCE
IRON_TAIL_LOWER_DEFENSE_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global TWINEEDLE_POISON_CHANCE
TWINEEDLE_POISON_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global EXTRASENSORY_CRINGE_CHANCE
EXTRASENSORY_CRINGE_CHANCE:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global ROCK_SLIDE_CRINGE_CHANCE
ROCK_SLIDE_CRINGE_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global CRUNCH_LOWER_DEFENSE_CHANCE
CRUNCH_LOWER_DEFENSE_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C4454
ov10_022C4454:
	.byte 0x02, 0x00, 0x00, 0x00
	.global ov10_022C4458
ov10_022C4458:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global TRAP_BUSTER_ACTIVATION_CHANCE
TRAP_BUSTER_ACTIVATION_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global ov10_022C4460
ov10_022C4460:
	.byte 0x0C, 0x00, 0x00, 0x00
	.global ov10_022C4464
ov10_022C4464:
	.byte 0x18, 0x00, 0x00, 0x00
	.global FOREWARN_FORCED_MISS_CHANCE
FOREWARN_FORCED_MISS_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C446C
ov10_022C446C:
	.byte 0x05, 0x00, 0x00, 0x00
	.global ov10_022C4470
ov10_022C4470:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global UNOWN_STONE_DROP_CHANCE
UNOWN_STONE_DROP_CHANCE:
	.byte 0x21, 0x00, 0x00, 0x00
	.global SITRUS_BERRY_HP_RESTORATION
SITRUS_BERRY_HP_RESTORATION:
	.byte 0x64, 0x00, 0x00, 0x00
	.global ov10_022C447C
ov10_022C447C:
	.byte 0x96, 0x00, 0x00, 0x00
	.global ov10_022C4480
ov10_022C4480:
	.byte 0x14, 0x00, 0x00, 0x00
	.global MUDDY_WATER_LOWER_ACCURACY_CHANCE
MUDDY_WATER_LOWER_ACCURACY_CHANCE:
	.byte 0x28, 0x00, 0x00, 0x00
	.global SILVER_WIND_BOOST_CHANCE
SILVER_WIND_BOOST_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global POISON_TAIL_POISON_CHANCE
POISON_TAIL_POISON_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global THUNDERSHOCK_PARALYZE_CHANCE
THUNDERSHOCK_PARALYZE_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global BOUNCE_PARALYZE_CHANCE
BOUNCE_PARALYZE_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global HEADBUTT_CRINGE_CHANCE
HEADBUTT_CRINGE_CHANCE:
	.byte 0x19, 0x00, 0x00, 0x00
	.global FIRE_FANG_CRINGE_CHANCE
FIRE_FANG_CRINGE_CHANCE:
	.byte 0x19, 0x00, 0x00, 0x00
	.global SACRED_FIRE_BURN_CHANCE
SACRED_FIRE_BURN_CHANCE:
	.byte 0x32, 0x00, 0x00, 0x00
	.global WHIRLPOOL_CONSTRICTION_CHANCE
WHIRLPOOL_CONSTRICTION_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global EXP_ELITE_EXP_BOOST
EXP_ELITE_EXP_BOOST:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global MONSTER_HOUSE_MAX_NON_MONSTER_SPAWNS
MONSTER_HOUSE_MAX_NON_MONSTER_SPAWNS:
	.byte 0x07, 0x00, 0x00, 0x00
	.global ov10_022C44B0
ov10_022C44B0:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov10_022C44B4
ov10_022C44B4:
	.byte 0x05, 0x00, 0x00, 0x00
	.global HEAL_ORDER_HP_RESTORATION
HEAL_ORDER_HP_RESTORATION:
	.byte 0x28, 0x00, 0x00, 0x00
	.global ov10_022C44BC
ov10_022C44BC:
	.byte 0x03, 0x00, 0x00, 0x00
	.global ov10_022C44C0
ov10_022C44C0:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global STEEL_WING_BOOST_DEFENSE_CHANCE
STEEL_WING_BOOST_DEFENSE_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C44C8
ov10_022C44C8:
	.byte 0x19, 0x00, 0x00, 0x00
	.global ov10_022C44CC
ov10_022C44CC:
	.byte 0x19, 0x00, 0x00, 0x00
	.global GOLD_THORN_POWER
GOLD_THORN_POWER:
	.byte 0x14, 0x00, 0x00, 0x00
	.global BURN_DAMAGE
BURN_DAMAGE:
	.byte 0x06, 0x00, 0x00, 0x00
	.global POISON_DAMAGE
POISON_DAMAGE:
	.byte 0x02, 0x00, 0x00, 0x00
	.global SPAWN_COOLDOWN
SPAWN_COOLDOWN:
	.byte 0x24, 0x00, 0x00, 0x00
	.global MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE
MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE:
	.byte 0x32, 0x00, 0x00, 0x00
	.global ov10_022C44E4
ov10_022C44E4:
	.byte 0x05, 0x00, 0x00, 0x00
	.global ov10_022C44E8
ov10_022C44E8:
	.byte 0x23, 0x00, 0x00, 0x00
	.global ov10_022C44EC
ov10_022C44EC:
	.byte 0x3C, 0x00, 0x00, 0x00
	.global CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE
CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE:
	.byte 0x28, 0x00, 0x00, 0x00
	.global ORAN_BERRY_FULL_HP_BOOST
ORAN_BERRY_FULL_HP_BOOST:
	.byte 0x00, 0x00, 0x00, 0x00
	.global LIFE_SEED_HP_BOOST
LIFE_SEED_HP_BOOST:
	.byte 0x03, 0x00, 0x00, 0x00
	.global ov10_022C44FC
ov10_022C44FC:
	.byte 0x32, 0x00, 0x00, 0x00
	.global OCTAZOOKA_LOWER_ACCURACY_CHANCE
OCTAZOOKA_LOWER_ACCURACY_CHANCE:
	.byte 0x3C, 0x00, 0x00, 0x00
	.global ov10_022C4504
ov10_022C4504:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C4508
ov10_022C4508:
	.byte 0x14, 0x00, 0x00, 0x00
	.global LUSTER_PURGE_LOWER_SPECIAL_DEFENSE_CHANCE
LUSTER_PURGE_LOWER_SPECIAL_DEFENSE_CHANCE:
	.byte 0x32, 0x00, 0x00, 0x00
	.global SUPER_LUCK_CRIT_RATE_BOOST
SUPER_LUCK_CRIT_RATE_BOOST:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global CONSTRICT_LOWER_SPEED_CHANCE
CONSTRICT_LOWER_SPEED_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ICE_FANG_FREEZE_CHANCE
ICE_FANG_FREEZE_CHANCE:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global SMOG_POISON_CHANCE
SMOG_POISON_CHANCE:
	.byte 0x28, 0x00, 0x00, 0x00
	.global ov10_022C4520
ov10_022C4520:
	.byte 0x19, 0x00, 0x00, 0x00
	.global ov10_022C4524
ov10_022C4524:
	.byte 0x0C, 0x00, 0x00, 0x00
	.global LICK_PARALYZE_CHANCE
LICK_PARALYZE_CHANCE:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global THUNDER_FANG_PARALYZE_CHANCE
THUNDER_FANG_PARALYZE_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov10_022C4530
ov10_022C4530:
	.byte 0x0F, 0x00, 0x00, 0x00
	.global BITE_CRINGE_CHANCE
BITE_CRINGE_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global SKY_ATTACK_CRINGE_CHANCE
SKY_ATTACK_CRINGE_CHANCE:
	.byte 0x19, 0x00, 0x00, 0x00
	.global ICE_FANG_CRINGE_CHANCE
ICE_FANG_CRINGE_CHANCE:
	.byte 0x19, 0x00, 0x00, 0x00
	.global BLAZE_KICK_BURN_CHANCE
BLAZE_KICK_BURN_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global FLAMETHROWER_BURN_CHANCE
FLAMETHROWER_BURN_CHANCE:
	.byte 0x0A, 0x00, 0x00, 0x00
	.global DIZZY_PUNCH_CONFUSE_CHANCE
DIZZY_PUNCH_CONFUSE_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global SECRET_POWER_EFFECT_CHANCE
SECRET_POWER_EFFECT_CHANCE:
	.byte 0x1E, 0x00, 0x00, 0x00
	.global ov10_022C4550
ov10_022C4550:
	.byte 0x0C, 0x00, 0x00, 0x00
	.global METAL_CLAW_BOOST_ATTACK_CHANCE
METAL_CLAW_BOOST_ATTACK_CHANCE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C4558
ov10_022C4558:
	.byte 0x01, 0x00, 0x00, 0x00
	.global TECHNICIAN_MOVE_POWER_THRESHOLD
TECHNICIAN_MOVE_POWER_THRESHOLD:
	.byte 0x04, 0x00, 0x00, 0x00
	.global ov10_022C4560
ov10_022C4560:
	.byte 0x08, 0x00, 0x00, 0x00
	.global ov10_022C4564
ov10_022C4564:
	.byte 0x0C, 0x00, 0x00, 0x00
	.global SONICBOOM_FIXED_DAMAGE
SONICBOOM_FIXED_DAMAGE:
	.byte 0x14, 0x00, 0x00, 0x00
	.global ov10_022C456C
ov10_022C456C:
	.byte 0x12, 0x00, 0x00, 0x00
	.global ov10_022C4570
ov10_022C4570:
	.byte 0x05, 0x00, 0x00, 0x00
	.global ov10_022C4574
ov10_022C4574:
	.byte 0x02, 0x00, 0x00, 0x00
	.global RAIN_ABILITY_BONUS_REGEN
RAIN_ABILITY_BONUS_REGEN:
	.byte 0x6A, 0xFF, 0x00, 0x00
	.global ov10_022C457C
ov10_022C457C:
	.byte 0x03, 0x00, 0x00, 0x00
