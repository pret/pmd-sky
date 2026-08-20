	.include "asm/macros.inc"
	.include "overlay_29_0234B0CC.inc"

	.text

	arm_func_start SetMessageLogPreprocessorArgsStringToName
SetMessageLogPreprocessorArgsStringToName: ; 0x0234B0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl GetSize0x80Buffer
	mov r1, r4
	mov r2, #0x4e
	mov r4, r0
	bl GetName
	ldr r0, _0234B100 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, r5, lsl #2
	str r4, [r0, #0xcd4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234B100: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsStringToName
