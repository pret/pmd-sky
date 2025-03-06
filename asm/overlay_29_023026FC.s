	.include "asm/macros.inc"
	.include "overlay_29_023026FC.inc"

	.text

	arm_func_start EnemyEvolution
EnemyEvolution: ; 0x023026FC
#ifdef JAPAN
#define ENEMY_EVOLUTION_OFFSET -4
#else
#define ENEMY_EVOLUTION_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x168
	mov sl, r0
	bl AllocateTemp1024ByteBufferFromPool
	ldr r0, _02302A28 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #0xf]
	ldrb r0, [r2, #0x748]
	cmp r1, #0
	str r0, [sp, #8]
	beq _02302A20
	mov r0, #0
	strb r0, [r2, #0xf]
	bl GetForcedLossReason
	cmp r0, #0
	bne _02302A20
	mov r0, sl
	bl EntityIsValid__02302A38
	cmp r0, #0
	bne _02302758
	add r0, sp, #0xb0
	bl ov29_022E2470
	add sl, sp, #0xb0
_02302758:
	ldr r0, _02302A2C ; =ov29_023527F8
	mov r4, #0
	ldr r3, [r0]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
_02302780:
	ldr r0, _02302A28 ; =DUNGEON_PTR
	ldr r3, [sp, #0x14]
	ldr r0, [r0]
	ldr r2, [sp, #0x18]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xad4]
#else
	ldr r5, [r0, #0xb78]
#endif
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r6, #0
	str r6, [sp, #4]
	str r3, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	cmp r5, #0
	beq _02302A14
	mov r0, r5
	bl EntityIsValid__02302A38
	cmp r0, #0
	ldrne sb, [r5, #0xb4]
	ldrnesh r0, [sb, #0x10]
	cmpne r0, #0
	beq _02302A14
	ldrb r0, [sb, #0x102]
	cmp r0, #0
	movne r0, r6
	strneb r0, [sb, #0x102]
	bne _02302A08
	ldr fp, [sb, #0x214 + ENEMY_EVOLUTION_OFFSET]
	cmp fp, #0
	beq _023028C4
	ldrb r0, [sb, #7]
	cmp r0, #0
	beq _02302818
	ldrb r1, [sb, #0xa]
	add r0, sp, #0x54
	bl GetUnlockedTacticFlags
_02302818:
	ldrsh r2, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	ldrb r7, [sb, #0x1a]
	ldr r1, _02302A30 ; =0x000003E7
	add r0, r2, r0
	ldrb r3, [sb, #0x1b]
	ldrb r2, [sb, #0x1c]
	str r0, [sp, #4]
	cmp r0, r1
	strgt r1, [sp, #4]
	ldrb r1, [sb, #0x1d]
	ldrb r0, [sb, #0xa]
	str r7, [sp, #0x24]
	str r3, [sp, #0x28]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x20]
	cmp r0, #0x64
	beq _023028C4
	ldr r0, [sp, #8]
	bl IsExpEnabledInDungeon
	cmp r0, #0
	beq _023028C4
	ldr r0, [sb, #0x20]
	mov r1, fp
	add r2, r0, fp
	mov r0, #0
	str r2, [sb, #0x20]
	bl ov29_0234B09C
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	mov r2, sb
	mov r3, r1
	bl ov29_0230040C
	mov r0, sl
	ldr r1, _02302A34 ; =0x00000F1F
	bl LogMessageByIdWithPopup
	mov r0, sl
	mov r1, r5
	mov r2, #1
	mov r3, r2
	bl LevelUp
	orr r6, r6, r0
_023028C4:
	ldrb r0, [sb, #0x153 + ENEMY_EVOLUTION_OFFSET]
	cmp r0, #0
	beq _02302968
	ldrsh r0, [sb, #2]
	mov r2, #0
	add r1, sp, #0x2c
	mov r3, r2
	bl GetEvolutions
	movs r6, r0
	beq _02302964
	bl DungeonRandInt
	mov r8, r0
	mov r7, #0
	b _0230293C
_023028FC:
	mov r1, r8, lsl #1
	add r0, sp, #0x2c
	ldrsh r0, [r0, r1]
	bl IsOnMonsterSpawnList
	cmp r0, #0
	beq _0230292C
	mov r1, r8, lsl #1
	add r0, sp, #0x2c
	ldrsh r0, [r0, r1]
	bl DungeonGetSpriteIndex
	cmp r0, #0
	bne _02302944
_0230292C:
	add r8, r8, #1
	cmp r8, r6
	movge r8, #0
	add r7, r7, #1
_0230293C:
	cmp r7, r6
	blt _023028FC
_02302944:
	cmp r7, r6
	bge _02302964
	add r0, sp, #0x2c
	mov r1, r8, lsl #1
	ldrsh r2, [r0, r1]
	mov r0, sl
	mov r1, r5
	bl EvolveMonster
_02302964:
	mov r6, #0
_02302968:
	cmp r6, #0
	beq _023029EC
	ldrb r0, [sb, #6]
	cmp r0, #0
	bne _023029EC
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _02302A30 ; =0x000003E7
	ldr r3, [sp, #0x28]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [sp, #0x84]
	ldrb r2, [sb, #0x1a]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	sub r1, r2, r1
	str r1, [sp, #0x88]
	ldrb r1, [sb, #0x1c]
	ldr r2, [sp, #0x20]
	sub r0, r1, r0
	str r0, [sp, #0x8c]
	ldrb r6, [sb, #0x1b]
	add r1, sp, #0x60
	mov r0, r5
	sub r3, r6, r3
	str r3, [sp, #0x90]
	ldrb r3, [sb, #0x1d]
	sub r2, r3, r2
	str r2, [sp, #0x94]
	bl ov29_02302CC8
_023029EC:
	cmp fp, #0
	beq _02302A08
	add r2, sp, #0x54
	mov r0, sl
	mov r1, r5
	mov r3, #1
	bl ov29_02302C04
_02302A08:
	mov r0, #0
	str r0, [sb, #0x214 + ENEMY_EVOLUTION_OFFSET]
	strb r0, [sb, #0x153 + ENEMY_EVOLUTION_OFFSET]
_02302A14:
	add r4, r4, #1
	cmp r4, #0x14
	blt _02302780
_02302A20:
	add sp, sp, #0x168
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02302A28: .word DUNGEON_PTR
_02302A2C: .word ov29_023527F8
_02302A30: .word 0x000003E7
#ifdef JAPAN
_02302A34: .word 0x00002486
#else
_02302A34: .word 0x00000F1F
#endif
	arm_func_end EnemyEvolution
