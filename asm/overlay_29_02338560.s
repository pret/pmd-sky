	.include "asm/macros.inc"
	.include "overlay_29_02338560.inc"

	.text

; https://decomp.me/scratch/5EgdA
	arm_func_start TrySpawnDoughSeedPoke
TrySpawnDoughSeedPoke: ; 0x02338560
	stmdb sp!, {r3, lr}
	ldr r0, _023385BC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x24]
#else
	ldrb r0, [r0, #0xc8]
#endif
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	bne _023385A4
	ldr r1, _023385C0 ; =ov29_02352B5C
	add r0, sp, #0
	ldrh r2, [r1]
	strh r2, [sp]
	ldrh r1, [r1, #2]
	strh r1, [sp, #2]
	bl ov29_02344E88
_023385A4:
	ldr r0, _023385BC ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	strb r1, [r0, #0x24]
#else
	strb r1, [r0, #0xc8]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_023385BC: .word DUNGEON_PTR
_023385C0: .word ov29_02352B5C
	arm_func_end TrySpawnDoughSeedPoke
