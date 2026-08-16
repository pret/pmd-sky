	.include "asm/macros.inc"
	.include "include/main_0207296C.inc"

	.text

	arm_func_start DseTrackEvent_Signal
DseTrackEvent_Signal: ; 0x0207296C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	mov ip, r1
	mov r1, #8
	strb r2, [ip, #0x16]
	ldr r0, [ip, #0x28]
	ldr r3, [ip, #0xa0]
	ldr ip, [ip, #0x9c]
	blx ip
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_Signal
