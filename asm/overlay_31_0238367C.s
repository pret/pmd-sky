	.include "asm/macros.inc"
	.include "overlay_31_0238367C.inc"

	.text

	arm_func_start ov31_0238367C
ov31_0238367C: ; 0x0238367C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	bl GetLeader
	mov r1, #0
	mov r2, #0xb
	bl GetItemToUse
	ldrsh r1, [r0, #4]
	mov r2, #0
	add lr, sp, #0xc
	str r1, [sp, #0x1c]
	ldrh r4, [r0, #2]
	ldr r1, _02383720 ; =0x00001013
	ldr r3, _02383724 ; =0x000008E4
	str r4, [sp, #0x30]
	ldrh r4, [r0, #2]
	add r4, r4, #0xbc
	str r4, [sp, #0x24]
	str r2, [sp, #0x38]
	str lr, [sp]
	ldrsh r4, [r0, #4]
	ldr r0, _02383728 ; =DUNGEON_WINDOW_PARAMS_8
#if defined(EUROPE)
	add ip, r4, #0xd3
	add r4, ip, #0x2900
#elif defined(JAPAN)
	add ip, r4, #0xce
	add r4, ip, #0x4100
#else
	add ip, r4, #0xd1
	add r4, ip, #0x2900
#endif
	mov ip, r4, lsl #0x10
	mov r4, ip, lsr #0x10
	stmib sp, {r4, lr}
	bl CreateScrollBoxSingle
	mov r5, r0
	mov r4, #0x16
_023836F0:
	mov r0, r4
	bl AdvanceFrame
	mov r0, r5
	bl IsScrollBoxActive
	cmp r0, #0
	bne _023836F0
	mov r0, r5
	bl CloseScrollBox
	mov r0, #0x16
	bl AdvanceFrame
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02383720: .word 0x00001013
#ifdef JAPAN
_02383724: .word 0x00001D3C
#else
_02383724: .word 0x000008E4
#endif
_02383728: .word DUNGEON_WINDOW_PARAMS_8
	arm_func_end ov31_0238367C
