	.include "asm/macros.inc"
	.include "overlay_29_023197CC.inc"

	.text

	arm_func_start MistIsActive
MistIsActive: ; 0x023197CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	beq _0231980C
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xe
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x26
	bl ExclusiveItemEffectIsActive__023197A8
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r4, pc}
_0231980C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end MistIsActive

	arm_func_start Conversion2IsActive
Conversion2IsActive: ; 0x02319814
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	beq _02319854
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x27
	bl ExclusiveItemEffectIsActive__023197A8
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r4, pc}
_02319854:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end Conversion2IsActive
