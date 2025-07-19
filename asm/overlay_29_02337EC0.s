	.include "asm/macros.inc"
	.include "overlay_29_02337EC0.inc"

	.text

	arm_func_start ov29_02337EC0
ov29_02337EC0: ; 0x02337EC0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	bl GetTileSafe
	ldr r1, [r0, #0xc]
	cmp r1, r4
	moveq r1, #0
	streq r1, [r0, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02337EC0

	arm_func_start ov29_02337EE8
ov29_02337EE8: ; 0x02337EE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r0, _02337F8C ; =DUNGEON_PTR
	ldr r4, _02337F90 ; =0x0000022A
	ldr r0, [r0]
	ldr r6, _02337F94 ; =0x000003D7
#ifdef JAPAN
	add r0, r0, #0x20c
	add r0, r0, #0x28400
#else
	add r0, r0, #0x6b0
	add r0, r0, #0x28000
#endif
	mov sl, #0
	add r0, r0, #0x2b4
	mov sb, sl
	add r8, r0, #0x4000
	sub r5, r4, #1
	sub r7, r6, #0x258
	add fp, sp, #0
	b _02337F68
_02337F28:
	add r0, r8, sb, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _02337F70
	cmp r0, r7
	cmpne r0, r6
	cmpne r0, r5
	cmpne r0, r4
	movne r2, sl, lsl #1
	addne r1, sl, #1
	strneh r0, [fp, r2]
	add r0, sb, #1
	movne r1, r1, lsl #0x10
	mov r0, r0, lsl #0x10
	movne sl, r1, asr #0x10
	mov sb, r0, asr #0x10
_02337F68:
	cmp sb, #0x10
	blt _02337F28
_02337F70:
	mov r0, sl
	bl RandInt
	add r1, sp, #0
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337F8C: .word DUNGEON_PTR
_02337F90: .word 0x0000022A
_02337F94: .word 0x000003D7
	arm_func_end ov29_02337EE8

	arm_func_start GetRandomSpawnMonsterID
GetRandomSpawnMonsterID: ; 0x02337F98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r0, _02338040 ; =DUNGEON_PTR
	ldr r4, _02338044 ; =0x0000022A
	ldr r0, [r0]
	ldr r6, _02338048 ; =0x000003D7
#ifdef JAPAN
	add r0, r0, #0x20c
	add r0, r0, #0x28400
#else
	add r0, r0, #0x6b0
	add r0, r0, #0x28000
#endif
	mov sl, #0
	add r0, r0, #0x2b4
	mov sb, sl
	add r8, r0, #0x4000
	sub r5, r4, #1
	sub r7, r6, #0x258
	add fp, sp, #0
	b _0233801C
_02337FD8:
	add r0, r8, sb, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r0, #0
	beq _02338024
	cmp r0, r7
	cmpne r0, r6
	cmpne r0, r5
	cmpne r0, r4
	cmpne r0, #0x84
	movne r2, sl, lsl #1
	addne r1, sl, #1
	strneh r0, [fp, r2]
	add r0, sb, #1
	movne r1, r1, lsl #0x10
	mov r0, r0, lsl #0x10
	movne sl, r1, asr #0x10
	mov sb, r0, asr #0x10
_0233801C:
	cmp sb, #0x10
	blt _02337FD8
_02338024:
	mov r0, sl
	bl DungeonRandInt
	add r1, sp, #0
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338040: .word DUNGEON_PTR
_02338044: .word 0x0000022A
_02338048: .word 0x000003D7
	arm_func_end GetRandomSpawnMonsterID

	arm_func_start ov29_0233804C
ov29_0233804C: ; 0x0233804C
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x2d8
	mov r1, #0x10
	bl MemAlloc
	mov r4, r0
	mov r0, #1
	mov r1, #0x16c
	bl DungeonRandRange
	mov r1, r0, lsl #0x10
	mov r0, #0
	mov r3, r1, asr #0x10
	ldr r5, _023380F4 ; =DUNGEON_PTR
	ldr lr, _023380F8 ; =0x000286F2
	mov r2, r0
	mov r1, r0
_02338088:
	ldr ip, [r5]
	cmp r3, #0x16c
	movge r3, r1
	add ip, ip, r3, lsl #1
	ldrsh ip, [ip, lr]
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	cmp ip, #0
	addne ip, r0, #1
	movne r0, r0, lsl #1
	strneh r3, [r4, r0]
	add r3, r3, #1
	movne ip, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, asr #0x10
	movne r0, ip, asr #0x10
	cmp r2, #0x16c
	mov r3, r3, asr #0x10
	blt _02338088
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0xf
	mov r0, r4
	ldrsh r4, [r4, r1]
	bl MemFree
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023380F4: .word DUNGEON_PTR
#ifdef JAPAN
_023380F8: .word 0x0002864E
#else
_023380F8: .word 0x000286F2
#endif
	arm_func_end ov29_0233804C

	arm_func_start ov29_023380FC
ov29_023380FC: ; 0x023380FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r0, [sb, #0xb4]
	mov r6, #0
	ldrb r0, [r0, #6]
	ldr r4, _023381BC ; =DIRECTIONS_XY
	mov r8, r1
	mov r7, r6
	cmp r0, #0
	movne r6, #1
	mov r5, #0
_02338128:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh ip, [sb, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [sb, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _023381A0
	ldr r1, [r0]
	cmp r1, #1
	bne _023381A0
	ldr r1, [r0, #0xb4]
	cmp r6, #0
	ldrb r1, [r1, #6]
	beq _0233818C
	cmp r1, #0
	addeq r1, r7, #1
	moveq r1, r1, lsl #0x10
	streq r0, [r8, r7, lsl #2]
	moveq r7, r1, asr #0x10
	b _023381A0
_0233818C:
	cmp r1, #0
	addne r1, r7, #1
	movne r1, r1, lsl #0x10
	strne r0, [r8, r7, lsl #2]
	movne r7, r1, asr #0x10
_023381A0:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #8
	blt _02338128
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023381BC: .word DIRECTIONS_XY
	arm_func_end ov29_023380FC

	arm_func_start ov29_023381C0
ov29_023381C0: ; 0x023381C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	ldr r4, _02338284 ; =DIRECTIONS_XY
	b _02338274
_023381DC:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh ip, [r8, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r8, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr sb, [r0, #0xc]
	cmp sb, #0
	beq _02338268
	ldr r0, [sb]
	cmp r0, #1
	bne _02338268
	mov r0, sb
	mov r1, r7
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02338268
	cmp r6, #0
	beq _02338250
	mov r0, sb
	mov r1, r8
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02338268
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02338250:
	mov r0, r8
	mov r1, sb
	bl ov29_022FAFD4
	cmp r0, #0
	movne r0, sb
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02338268:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02338274:
	cmp r5, #8
	blt _023381DC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02338284: .word DIRECTIONS_XY
	arm_func_end ov29_023381C0

	arm_func_start NearbyAllyIqSkillIsEnabled
NearbyAllyIqSkillIsEnabled: ; 0x02338288
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl ov29_023381C0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end NearbyAllyIqSkillIsEnabled

	arm_func_start ov29_023382A8
ov29_023382A8: ; 0x023382A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, #0
	ldrb r0, [r0, #6]
	mov r5, #0
	ldr r4, _0233834C ; =DIRECTIONS_XY
	cmp r0, #0
	movne r6, #1
	b _0233833C
_023382D0:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh ip, [r7, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r7, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02338330
	ldr r1, [r0]
	cmp r1, #1
	bne _02338330
	ldr r1, [r0, #0xb4]
	cmp r6, #0
	ldrb r1, [r1, #6]
	beq _02338328
	cmp r1, #0
	bne _02338330
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02338328:
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02338330:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0233833C:
	cmp r5, #8
	blt _023382D0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233834C: .word DIRECTIONS_XY
	arm_func_end ov29_023382A8

	arm_func_start ov29_02338350
ov29_02338350: ; 0x02338350
	stmdb sp!, {r3, lr}
	bl ov29_023382A8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02338350

	arm_func_start ResetGravity
ResetGravity: ; 0x0233836C
	ldr r0, _02338388 ; =DUNGEON_PTR
	ldr ip, _0233838C ; =MemZero
	ldr r0, [r0]
	mov r1, #2
#ifdef JAPAN
	add r0, r0, #0x258
#else
	add r0, r0, #0x2fc
#endif
	add r0, r0, #0x12800
	bx ip
	.align 2, 0
_02338388: .word DUNGEON_PTR
_0233838C: .word MemZero
	arm_func_end ResetGravity
