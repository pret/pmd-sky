	.include "asm/macros.inc"
	.include "main_0204EFE0.inc"

	.text

	arm_func_start sub_0204F024
sub_0204F024: ; 0x0204F024
	ldr r1, _0204F030 ; =PENDING_DUNGEON_ID
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0204F030: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204F024

	arm_func_start sub_0204F034
sub_0204F034: ; 0x0204F034
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F034
