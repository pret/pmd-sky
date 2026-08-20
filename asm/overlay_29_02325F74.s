	.include "asm/macros.inc"
	.include "overlay_29_02325F74.inc"

	.text

	arm_func_start DoMoveMorningSun
DoMoveMorningSun: ; 0x02325F74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02325FB0 ; =MORNING_SUN_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325FB0: .word MORNING_SUN_HP_RESTORATION_TABLE
	arm_func_end DoMoveMorningSun
