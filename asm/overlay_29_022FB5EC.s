	.include "asm/macros.inc"
	.include "overlay_29_022FB5EC.inc"

	.text

	arm_func_start CheckSpawnThreshold
CheckSpawnThreshold: ; 0x022FB5EC
	stmdb sp!, {r4, lr}
	bl GetSpawnThreshold
	mov r4, r0
	bl GetScenarioBalanceVeneer
	cmp r4, r0
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end CheckSpawnThreshold
