	.include "asm/macros.inc"
	.include "overlay_29_022EFA6C.inc"

	.text

	arm_func_start DebugRecruitingEnabled
DebugRecruitingEnabled: ; 0x022EFA6C
	mov r0, #1
	bx lr
	arm_func_end DebugRecruitingEnabled

	arm_func_start TryActivateIqBooster
TryActivateIqBooster: ; 0x022EFA74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r1, _022EFAE0 ; =DUNGEON_PTR
	ldr r0, _022EFAE4 ; =0x000286D0
	ldr r1, [r1]
	ldrsh r6, [r1, r0]
	cmp r6, #0
	ble _022EFAD8
	add r0, sp, #0
	mov r1, #0x44
	bl TeamMemberHasItemActive
	mov r7, r0
	cmp r7, #0
	ble _022EFAD8
	mov r8, #0
	add r5, sp, #0
	mov r4, r8
	b _022EFAD0
_022EFABC:
	ldr r0, [r5, r8, lsl #2]
	mov r1, r6
	mov r2, r4
	bl BoostIQ
	add r8, r8, #1
_022EFAD0:
	cmp r8, r7
	blt _022EFABC
_022EFAD8:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022EFAE0: .word DUNGEON_PTR
#ifdef JAPAN
_022EFAE4: .word 0x0002862C
#else
_022EFAE4: .word 0x000286D0
#endif
	arm_func_end TryActivateIqBooster
