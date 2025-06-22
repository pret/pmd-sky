	.include "asm/macros.inc"
	.include "overlay_29_02301E88.inc"

	.text

	arm_func_start IsTypeAffectedByGravity
IsTypeAffectedByGravity: ; 0x02301E88
	stmdb sp!, {r3, lr}
	cmp r1, #0xa
	bne _02301EA4
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02301EA4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsTypeAffectedByGravity

	arm_func_start HasTypeAffectedByGravity
HasTypeAffectedByGravity: ; 0x02301EAC
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r3, #0x5e]
	cmp r2, r1
	bne _02301ED4
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
_02301ED4:
	ldrb r2, [r3, #0x5f]
	cmp r2, r1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
	arm_func_end HasTypeAffectedByGravity
