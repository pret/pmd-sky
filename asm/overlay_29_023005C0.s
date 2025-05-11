	.include "asm/macros.inc"
	.include "overlay_29_023005C0.inc"

	.text

	arm_func_start IsMonsterVisuallyImpaired
IsMonsterVisuallyImpaired: ; 0x023005C0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsMonsterVisuallyImpaired

	arm_func_start IsMonsterMuzzled
IsMonsterMuzzled: ; 0x023005FC
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterMuzzled

	arm_func_start MonsterHasMiracleEyeStatus
MonsterHasMiracleEyeStatus: ; 0x02300618
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasMiracleEyeStatus
