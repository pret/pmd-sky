	.include "asm/macros.inc"
	.include "overlay_29_022F73EC.inc"

	.text

	arm_func_start GetKecleonIdToSpawnByFloor
GetKecleonIdToSpawnByFloor: ; 0x022F73EC
	stmdb sp!, {r3, lr}
	bl FloorNumberIsEven
	cmp r0, #0
	ldrne r0, _022F7404 ; =0x000003D7
	ldreq r0, _022F7408 ; =0x0000017F
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7404: .word 0x000003D7
_022F7408: .word 0x0000017F
	arm_func_end GetKecleonIdToSpawnByFloor

	arm_func_start StoreSpriteFileIndexBothGenders
StoreSpriteFileIndexBothGenders: ; 0x022F740C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022F74D0 ; =DUNGEON_PTR
	mov r7, r0
	ldr r2, [r2]
	mov r6, r1
#ifdef JAPAN
	add r1, r2, #0x870
	add r5, r1, #0x19000
#else
	add r1, r2, #0x114
	add r5, r1, #0x19800
#endif
	bl GetSpriteIndex__020526EC
	mov r4, r0
	mov r1, r7, lsl #1
	mov r0, r7
	strh r6, [r5, r1]
	bl GetMonsterGender
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0x258
	bge _022F7490
	add r6, r7, #0x258
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpriteIndex__020526EC
	cmp r4, r0
	moveq r0, r7, lsl #1
	ldreqsh r1, [r5, r0]
	moveq r0, r6, lsl #1
	streqh r1, [r5, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022F7490:
	sub r6, r7, #0x258
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpriteIndex__020526EC
	cmp r4, r0
	moveq r0, r7, lsl #1
	ldreqsh r1, [r5, r0]
	moveq r0, r6, lsl #1
	streqh r1, [r5, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F74D0: .word DUNGEON_PTR
	arm_func_end StoreSpriteFileIndexBothGenders

	arm_func_start LoadMonsterSpriteInner
LoadMonsterSpriteInner: ; 0x022F74D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _022F75C4 ; =DUNGEON_PTR
	mov r6, r0
#ifdef JAPAN
	ldr r1, [r1]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x19800
	ldrsh r1, [r1, #0x70]
#else
	ldr r2, [r1]
	ldr r1, _022F75C8 ; =0x00019914
	add r2, r2, r6, lsl #1
	ldrsh r1, [r2, r1]
#endif
	cmp r1, #0
	bne _022F75BC
	bl GetSpriteIndex__020526EC
	mov r4, r0
	mov r0, r6
	bl IsShaymin
	cmp r0, #0
	beq _022F756C
	mov r0, r6
	bl IsShaymin
	cmp r0, #0
	mov r0, r6
	movne r5, #0
	bl GetSpriteFileSize
	mov r1, #0
	bl MemAlloc
	ldr r2, _022F75CC ; =ov29_0237C9B0
	mov r1, #1
	str r0, [r2, r5, lsl #2]
	str r1, [sp]
	ldr r0, _022F75D0 ; =WAN_TABLE
	ldr r3, [r2, r5, lsl #2]
	ldr r0, [r0]
	mov r2, r4
	mov r1, #0
	bl LoadWanTableEntryFromPackUseProvidedMemory
	mov r1, r0
	mov r0, r6
	bl StoreSpriteFileIndexBothGenders
	b _022F7598
_022F756C:
	mov r1, #1
	ldr r0, _022F75D0 ; =WAN_TABLE
	str r1, [sp]
	mov r1, #0
	ldr r0, [r0]
	mov r2, r4
	mov r3, r1
	bl LoadWanTableEntryFromPack
	mov r1, r0
	mov r0, r6
	bl StoreSpriteFileIndexBothGenders
_022F7598:
	mov r1, r4
	mov r0, #0
	bl DirectoryFileMngr_GetDirectoryFileSize
	ldr r1, _022F75C4 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x2c000
#ifdef JAPAN
	ldr r2, [r1, #0xa68]
	add r0, r2, r0
	str r0, [r1, #0xa68]
#else
	ldr r2, [r1, #0xb0c]
	add r0, r2, r0
	str r0, [r1, #0xb0c]
#endif
_022F75BC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F75C4: .word DUNGEON_PTR
#ifndef JAPAN
_022F75C8: .word 0x00019914
#endif
_022F75CC: .word ov29_0237C9B0
_022F75D0: .word WAN_TABLE
	arm_func_end LoadMonsterSpriteInner

	arm_func_start SwapMonsterWanFileIndex
SwapMonsterWanFileIndex: ; 0x022F75D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _022F764C ; =DUNGEON_PTR
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
#ifdef JAPAN
	add r1, r1, #0x870
	mov r0, r5
	add r4, r1, #0x19000
#else
	add r1, r1, #0x114
	mov r0, r5
	add r4, r1, #0x19800
#endif
	bl GetSpriteIndex__020526EC
	mov r1, #1
	str r1, [sp]
	mov r1, r6, lsl #1
	ldr r2, _022F7650 ; =WAN_TABLE
	mov r3, r0
	ldrsh r1, [r4, r1]
	ldr r0, [r2]
	mov r2, #0
	bl ReplaceWanFromBinFile
	mov r1, r0
	mov r0, r5
	bl StoreSpriteFileIndexBothGenders
	mov r3, r6, lsl #1
	ldrsh r2, [r4, r3]
	mov r1, r5, lsl #1
	mov r0, #0
	strh r2, [r4, r1]
	strh r0, [r4, r3]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F764C: .word DUNGEON_PTR
_022F7650: .word WAN_TABLE
	arm_func_end SwapMonsterWanFileIndex
