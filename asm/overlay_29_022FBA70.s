	.include "asm/macros.inc"
	.include "overlay_29_022FBA70.inc"

	.text

	arm_func_start IsSpecialStoryAllyOrClient
IsSpecialStoryAllyOrClient: ; 0x022FBA70
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBAAC
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xfa
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #0xd9
	blo _022FBAAC
	cmp r0, #0xe4
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_022FBAAC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsSpecialStoryAllyOrClient

	arm_func_start ResetTriggerFlags
ResetTriggerFlags: ; 0x022FBAB4
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	addne r0, r2, #0x100
	movne r1, #0
#ifdef JAPAN
	strneh r1, [r0, #0x8e]
	strne r1, [r2, #0x188]
#else
	strneh r1, [r0, #0x92]
	strne r1, [r2, #0x18c]
#endif
	bx lr
	arm_func_end ResetTriggerFlags
