	.include "asm/macros.inc"
	.include "overlay_29_0233836C.inc"

	.text

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
