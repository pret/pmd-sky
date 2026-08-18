	.include "asm/macros.inc"
	.include "overlay_29_022ED888.inc"

	.text

	arm_func_start SpawnTraps
SpawnTraps: ; 0x022ED888
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _022ED96C ; =ov29_023526A0
	mov sl, #0
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	add r6, sp, #4
	strh r1, [sp]
	strh r0, [sp, #2]
	mov r4, #6
	mov fp, #2
	mov r7, sl
_022ED8B8:
	mov r0, sl, lsl #0x10
	mov r8, r7
	mov r5, r0, asr #0x10
_022ED8C4:
	mov r0, r8
	mov r1, sl
	bl GetTileSafe
	mov sb, r0
	ldrh r0, [sb, #2]
	tst r0, #4
	beq _022ED94C
	strh r8, [sp, #4]
	strh r5, [sp, #6]
	ldrh r0, [sb, #2]
	tst r0, #0x40
	movne r0, r4
	bne _022ED8FC
	bl GetRandomSpawnTrapId
_022ED8FC:
	cmp r0, #0x11
	mov r1, r6
	bne _022ED92C
	mov r2, fp
	mov r3, #0
	bl SpawnTrap
	movs r1, r0
	beq _022ED94C
	mov r0, sb
	mov r2, #1
	bl BindTrapToTile
	b _022ED94C
_022ED92C:
	mov r2, #0
	mov r3, r2
	bl SpawnTrap
	movs r1, r0
	beq _022ED94C
	mov r0, sb
	mov r2, #0
	bl BindTrapToTile
_022ED94C:
	add r8, r8, #1
	cmp r8, #0x38
	blt _022ED8C4
	add sl, sl, #1
	cmp sl, #0x20
	blt _022ED8B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED96C: .word ov29_023526A0
	arm_func_end SpawnTraps

	arm_func_start SpawnEnemyTrapAtPos
SpawnEnemyTrapAtPos: ; 0x022ED970
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r1
	mov r6, r2
	mov r8, r0
	mov r0, r7
	mov r1, r6
	mov r5, r3
	bl GetTileSafe
	mov r4, r0
	add r1, sp, #0
	mov r0, r8
	mov r3, r5
	mov r2, #0
	strh r7, [sp]
	strh r6, [sp, #2]
	bl SpawnTrap
	movs r1, r0
	beq _022ED9C8
	ldrb r2, [sp, #0x20]
	mov r0, r4
	bl BindTrapToTile
_022ED9C8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end SpawnEnemyTrapAtPos

	arm_func_start CreateTrapAndStairsHallucinations
CreateTrapAndStairsHallucinations: ; 0x022ED9D0
#ifdef JAPAN
#define OV29_022ED9D0_OFFSET -0xA4
#else
#define OV29_022ED9D0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r1, _022EDBBC ; =0x0001A21E
	ldr r0, [r0]
	ldrsh r2, [r0, r1]
	add r1, r0, #0x1a000
	ldrb r8, [r1, #0x244 + OV29_022ED9D0_OFFSET]
	sub sb, r2, #5
	b _022EDB9C
_022ED9F8:
	ldr r1, _022EDBC0 ; =0x0001A21C
	mov r2, #0x18
	ldrsh r0, [r0, r1]
	mul sl, sb, r2
	sub r7, r0, #6
	mov r0, r1
	add fp, r0, #8
	ldr r0, _022EDBC4 ; =0x0000013E
	ldr r6, _022EDBC8 ; =ov29_0237C864
	sub r0, r0, #0x1f
	str r0, [sp, #4]
	mov r0, r1
	add r5, r0, #0xa
	ldr r4, _022EDBCC ; =0xFFFF000F
	b _022EDB7C
_022EDA34:
	mov r0, #0
	str r0, [sp]
	mov r0, r7
	mov r1, sb
	bl GetTile
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _022EDA74
	ldr r1, [r2]
	cmp r1, #2
	bne _022EDA74
	ldrb r1, [r2, #0x20]
	cmp r1, #0
	cmpeq r8, #0
	movne r1, #1
	strne r1, [sp]
_022EDA74:
	ldrh r0, [r0]
	tst r0, #0x200
	movne r0, #1
	strne r0, [sp]
	ldr r0, [sp]
	cmp r0, #0
	beq _022EDB78
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r3, [r0]
	mov r0, #0x18
	mul r2, r7, r0
	ldrsh r1, [r3, fp]
	ldrsh r0, [r3, r5]
	sub r1, r2, r1
	sub r2, sl, r0
	cmp r1, r4, asr #11
	cmpge r2, r4, asr #11
	blt _022EDB78
	ldr r0, [sp, #4]
	cmp r1, r0
	cmple r2, #0xe0
	bgt _022EDB78
	ldrh ip, [r6]
	add r0, r2, #4
	add r1, r1, #4
	bic ip, ip, #0xc00
	strh ip, [r6]
	ldrh ip, [r6, #6]
	and r3, r1, r4, lsr #23
	mov r0, r0, lsl #0x14
	and ip, ip, r4
	strh ip, [r6, #6]
	ldrh ip, [r6, #6]
	mov r1, r6
	mov r2, #0
	orr r0, ip, r0, lsr #16
	strh r0, [r6, #6]
	ldrh r0, [r6, #2]
	and r0, r0, r4, asr #7
	strh r0, [r6, #2]
	ldrh r0, [r6, #2]
	orr r0, r0, r3
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	bic r0, r0, #0xc00
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	orr r0, r0, #0xc00
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	bic r0, r0, #0xf000
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	orr r0, r0, #0xa000
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	and r0, r0, r4, asr #6
	strh r0, [r6, #4]
	ldrh r3, [r6, #4]
	orr r0, r3, #0x3e
	orr r0, r0, #0x100
	strh r0, [r6, #4]
	ldr r0, _022EDBD0 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r0, [r0]
	bl AddSimpleObjToOam
_022EDB78:
	add r7, r7, #1
_022EDB7C:
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r1, _022EDBC0 ; =0x0001A21C
	ldr r0, [r0]
	ldrsh r1, [r0, r1]
	add r1, r1, #6
	cmp r7, r1
	blt _022EDA34
	add sb, sb, #1
_022EDB9C:
	ldr r1, _022EDBBC ; =0x0001A21E
	ldrsh r1, [r0, r1]
	add r1, r1, #5
	cmp sb, r1
	blt _022ED9F8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EDBB8: .word DUNGEON_PTR
_022EDBBC: .word 0x0001A21E + OV29_022ED9D0_OFFSET
_022EDBC0: .word 0x0001A21C + OV29_022ED9D0_OFFSET
_022EDBC4: .word 0x0000013E
_022EDBC8: .word ov29_0237C864
_022EDBCC: .word 0xFFFF000F
_022EDBD0: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end CreateTrapAndStairsHallucinations

	arm_func_start PrepareTrapperTrap
PrepareTrapperTrap: ; 0x022EDBD4
#ifdef JAPAN
#define PREPARE_TRAPPER_TRAP_OFFSET -0xA4
#else
#define PREPARE_TRAPPER_TRAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _022EDC28 ; =DUNGEON_PTR
	ldrsh r5, [r0]
	ldr r3, _022EDC2C ; =0x00012AAA
	ldr r4, [lr]
	add ip, r3, #2
	strh r5, [r4, r3]
	ldrsh r4, [r0, #2]
	ldr r0, [lr]
	mov r3, #1
	strh r4, [r0, ip]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r1, [r0, #0xaae + PREPARE_TRAPPER_TRAP_OFFSET]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r2, [r0, #0xaaf + PREPARE_TRAPPER_TRAP_OFFSET]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r3, [r0, #0xaa8 + PREPARE_TRAPPER_TRAP_OFFSET]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDC28: .word DUNGEON_PTR
_022EDC2C: .word 0x00012AAA + PREPARE_TRAPPER_TRAP_OFFSET
	arm_func_end PrepareTrapperTrap
