	.include "asm/macros.inc"
	.include "overlay_29_022EDCBC.inc"

	.text

	arm_func_start TrySpawnTrap
TrySpawnTrap: ; 0x022EDCBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	mov r6, r2
	mov r5, r3
	bl GetTileSafe
	mov r4, r0
	cmp r7, #0x19
	blo _022EDD14
	mov sb, #0
	b _022EDD04
_022EDCF0:
	bl ov29_022E7A30
	mov r7, r0
	cmp r7, #0x11
	bne _022EDD0C
	add sb, sb, #1
_022EDD04:
	cmp sb, #0x1e
	blt _022EDCF0
_022EDD0C:
	cmp sb, #0x1e
	moveq r7, #0x10
_022EDD14:
	ldrh r1, [r4]
	tst r1, #0x200
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r1, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r1, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022EDDA0
	ldr r1, [r0]
	cmp r1, #2
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetTrapInfo
	strb r7, [r0]
	ldr r0, [r4, #0x10]
	bl GetTrapInfo
	strb r6, [r0, #1]
	ldr r1, [r4, #0x10]
	mov r0, #1
	strb r5, [r1, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022EDDA0:
	mov r0, r7
	mov r1, r8
	mov r2, r6
	mov r3, #0
	bl SpawnTrap
	movs r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	mov r2, r5
	bl BindTrapToTile
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end TrySpawnTrap

	arm_func_start TrySpawnTrapperTrap
TrySpawnTrapperTrap: ; 0x022EDDD4
#ifdef JAPAN
#define TRY_SPAWN_TRAPPER_TRAP_OFFSET -0xA4
#else
#define TRY_SPAWN_TRAPPER_TRAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022EDE6C ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x12000
	ldrb r2, [r0, #0xaa8 + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, #0
	strb r2, [r0, #0xaa8 + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	ldr r3, [r1]
	ldr r0, _022EDE70 ; =0x00012AAA
	add r2, r3, #0x12000
	ldrb r1, [r2, #0xaae + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	ldrb r2, [r2, #0xaaf + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	add r0, r3, r0
	mov r3, #1
	bl TrySpawnTrap
	movs r4, r0
	ldr r1, _022EDE70 ; =0x00012AAA
	beq _022EDE48
	ldr r0, _022EDE6C ; =DUNGEON_PTR
	ldr r2, _022EDE74 ; =0x00000E57
	ldr r3, [r0]
	mov r0, r5
	add r1, r3, r1
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _022EDE60
_022EDE48:
	ldr r0, _022EDE6C ; =DUNGEON_PTR
	ldr r2, _022EDE78 ; =0x00000E58
	ldr r3, [r0]
	mov r0, r5
	add r1, r3, r1
	bl LogMessageByIdWithPopupCheckUserUnknown
_022EDE60:
	bl UpdateTrapsVisibility
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDE6C: .word DUNGEON_PTR
_022EDE70: .word 0x00012AAA + TRY_SPAWN_TRAPPER_TRAP_OFFSET
#ifdef JAPAN
_022EDE74: .word 0x00000B99
_022EDE78: .word 0x00000B9A
#else
_022EDE74: .word 0x00000E57
_022EDE78: .word 0x00000E58
#endif
	arm_func_end TrySpawnTrapperTrap

	arm_func_start TryRemoveTrap
TryRemoveTrap: ; 0x022EDE7C
	stmdb sp!, {r4, lr}
	mov r2, r0
	mov r4, r1
	ldrsh r0, [r2]
	ldrsh r1, [r2, #2]
	bl GetTileSafe
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _022EDED4
	ldr r1, [r2]
	cmp r1, #2
	bne _022EDECC
	mov r1, #0
	str r1, [r2]
	str r1, [r0, #0x10]
	cmp r4, #0
	beq _022EDEC4
	bl UpdateTrapsVisibility
_022EDEC4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_022EDECC:
	mov r0, #0
	ldmia sp!, {r4, pc}
_022EDED4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end TryRemoveTrap

	arm_func_start TryRevealAttackedTrap
TryRevealAttackedTrap: ; 0x022EDEDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTile
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _022EDF50
	ldr r0, [r1]
	cmp r0, #2
	bne _022EDF48
	ldr r0, _022EDF58 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _022EDF34
	mov r0, #1
	strb r0, [r1, #0x20]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl DrawMinimapTile
_022EDF34:
	cmp r4, #0
	beq _022EDF40
	bl UpdateTrapsVisibility
_022EDF40:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022EDF48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022EDF50:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDF58: .word DUNGEON_PTR
	arm_func_end TryRevealAttackedTrap

	arm_func_start SubstitutePlaceholderTrapTags2
SubstitutePlaceholderTrapTags2: ; 0x022EDF5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetSize0x80Buffer2
	bl GetMessageLogPreprocessorArgs
	add r0, r0, r5, lsl #2
	str r4, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SubstitutePlaceholderTrapTags2

	arm_func_start SubstitutePlaceholderTrapTags
SubstitutePlaceholderTrapTags: ; 0x022EDF7C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetSize0x80Buffer2
	add r0, r6, r5, lsl #2
	str r4, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SubstitutePlaceholderTrapTags

	arm_func_start TryTriggerTrap
TryTriggerTrap: ; 0x022EDFA0
#ifdef JAPAN
#define TRY_TRIGGER_TRAP_OFFSET -4
#else
#define TRY_TRIGGER_TRAP_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x14 + TRY_TRIGGER_TRAP_OFFSET
	mov sb, r1
	mov sl, r0
	ldrsh r0, [sb]
	ldrsh r1, [sb, #2]
	mov fp, r2
	mov r7, r3
	bl GetTileSafe
	ldr r4, [r0, #0x10]
	str r0, [sp, #0x10 + TRY_TRIGGER_TRAP_OFFSET]
	cmp r4, #0
	beq _022EE2F4
	ldr r0, [r4]
	cmp r0, #2
	bne _022EE2F4
	mov r0, r4
	bl GetTrapInfo
	mov r6, r0
	ldrb r1, [r6]
	mov r0, #0
	bl SubstitutePlaceholderTrapTags2
	ldr r0, [sp, #0x10 + TRY_TRIGGER_TRAP_OFFSET]
	ldr r5, [r0, #0xc]
	cmp r5, #0
	ldrne r0, [r5]
	cmpne r0, #1
	ldrb r0, [r4, #0x20]
	movne r5, #0
	cmp r5, #0
	str r0, [sp, #0xc + TRY_TRIGGER_TRAP_OFFSET]
	mov r0, #1
	strb r0, [r4, #0x20]
	beq _022EE1D8
	mov r0, r5
	bl ov29_022F9840
	cmp r7, #0
	ldrneb r0, [r6]
	cmpne r0, #0x11
	beq _022EE148
	cmp r0, #0x17
	mov r8, #0
	moveq r7, #0x64
	beq _022EE05C
	mov r0, #0x64
	bl DungeonRandInt
	mov r7, r0
_022EE05C:
	mov r0, r5
	mov r1, #0x23
	bl ItemIsActive__022EE318
	cmp r0, #0
	ldrne r8, _022EE2FC ; =0x00000E59
	bne _022EE0C8
	mov r0, r5
	mov r1, #0x26
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022EE0C8
	mov r0, #0x32
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _022EE0C8
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldrne r8, _022EE300 ; =0x00000E5B
	bne _022EE0C8
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
	ldr r8, _022EE304 ; =0x00000E5A
_022EE0C8:
	ldr r0, [sp, #0xc + TRY_TRIGGER_TRAP_OFFSET]
	cmp r0, #1
	beq _022EE0EC
	ldr r0, _022EE308 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a0]
#else
	ldrb r0, [r0, #0x244]
#endif
	cmp r0, #0
	beq _022EE100
_022EE0EC:
	cmp r7, #0
	bge _022EE110
	cmp r8, #0
	ldreq r8, _022EE30C ; =0x00000E5C
	b _022EE110
_022EE100:
	cmp r7, #0xf
	bge _022EE110
	cmp r8, #0
	ldreq r8, _022EE30C ; =0x00000E5C
_022EE110:
	cmp r8, #0
	beq _022EE1D8
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE12C
	bl UpdateTrapsVisibility
_022EE12C:
	mov r0, sl
	mov r1, r5
	mov r2, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp fp, #0
	bne _022EE1D8
	b _022EE2F4
_022EE148:
	mov r0, r5
	mov r1, #0x26
	mov r7, #0
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022EE1D8
	ldr r0, _022EE310 ; =TRAP_BUSTER_ACTIVATION_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _022EE1A4
	mov r1, sl
	mov r0, #1
	mov r2, r7
	bl SubstitutePlaceholderStringTags
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldrne r7, _022EE300 ; =0x00000E5B
	bne _022EE1A4
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
	ldr r7, _022EE304 ; =0x00000E5A
_022EE1A4:
	cmp r7, #0
	beq _022EE1D8
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE1C0
	bl UpdateTrapsVisibility
_022EE1C0:
	mov r0, sl
	mov r1, r5
	mov r2, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp fp, #0
	beq _022EE2F4
_022EE1D8:
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE264
	mov r0, #0
	mov r1, #0x11c
	bl PlaySeByIdIfShouldDisplayEntity
	bl UpdateTrapsVisibility
	ldrb r2, [r6]
	mov r0, sl
	mov r1, sb
	bl ov29_022E58B0
	mov r0, r4
	bl GetTrapInfo
	mov r6, r0
	mov r0, #0
	ldrb r1, [r6]
	bl SubstitutePlaceholderTrapTags2
	ldr r0, _022EE308 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	beq _022EE248
	ldr r1, _022EE314 ; =0x00000E5D
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022EE264
_022EE248:
	ldrb r1, [r6]
	mov r0, sl
#ifdef JAPAN
	add r1, r1, #0x53
	add r1, r1, #0x600
#else
	add r1, r1, #0x51
	add r1, r1, #0xb00
#endif
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl LogMessageByIdWithPopupCheckUser
_022EE264:
	cmp r5, #0
	beq _022EE29C
	ldrb r0, [r6, #1]
	cmp r0, #2
	bne _022EE288
	mov r0, r5
	mov r1, #1
	bl UpdateShopkeeperModeAfterTrap
	b _022EE29C
_022EE288:
	cmp r0, #1
	bne _022EE29C
	mov r0, r5
	mov r1, #0
	bl UpdateShopkeeperModeAfterTrap
_022EE29C:
	str sb, [sp]
	ldrb r6, [r6]
#ifdef JAPAN
	ldr r3, [sp, #0xc]
	mov r0, r4
#else
	mov r0, r4
	ldr r3, [sp, #0x10]
#endif
	mov r1, sl
	mov r2, r5
	str r6, [sp, #4]
#ifndef JAPAN
	mov r4, #0
	str r4, [sp, #8]
#endif
	bl ApplyTrapEffect
	mov r4, r0
	mov r0, r5
	bl EntityIsValid__022EE348
	cmp r0, #0
	beq _022EE2E0
	mov r0, r5
	bl EnemyEvolution
_022EE2E0:
	cmp r4, #0
	beq _022EE2F4
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
_022EE2F4:
	add sp, sp, #0x14 + TRY_TRIGGER_TRAP_OFFSET
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
#ifdef JAPAN
#define TRY_TRIGGER_TRAP_DATA_OFFSET -0x2BE
#else
#define TRY_TRIGGER_TRAP_DATA_OFFSET 0
#endif
_022EE2FC: .word 0x00000E59 + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE300: .word 0x00000E5B + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE304: .word 0x00000E5A + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE308: .word DUNGEON_PTR
_022EE30C: .word 0x00000E5C + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE310: .word TRAP_BUSTER_ACTIVATION_CHANCE
_022EE314: .word 0x00000E5D + TRY_TRIGGER_TRAP_DATA_OFFSET
	arm_func_end TryTriggerTrap
