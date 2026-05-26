	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start Snd_AlarmInit
Snd_AlarmInit: ; 0x0207D380
	mov r1, #0
	ldr r2, _0207D3AC ; =_022BB500
	mov r0, r1
_0207D38C:
	str r0, [r2]
	str r0, [r2, #4]
	add r1, r1, #1
	strb r0, [r2, #8]
	cmp r1, #8
	add r2, r2, #0xc
	blt _0207D38C
	bx lr
	.align 2, 0
_0207D3AC: .word _022BB500
	arm_func_end Snd_AlarmInit

	arm_func_start Sndi_IncAlarmId
Sndi_IncAlarmId: ; 0x0207D3B0
	ldr r2, _0207D3CC ; =_022BB500
	mov r1, #0xc
	mla r1, r0, r1, r2
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_0207D3CC: .word _022BB500
	arm_func_end Sndi_IncAlarmId

	arm_func_start Sndi_SetAlarmHandler
Sndi_SetAlarmHandler: ; 0x0207D3D0
	mov r3, #0xc
	mul r3, r0, r3
	ldr r0, _0207D3FC ; =_022BB500
	str r1, [r0, r3]
	add r1, r0, r3
	str r2, [r1, #4]
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0207D3FC: .word _022BB500
	arm_func_end Sndi_SetAlarmHandler

	arm_func_start Sndi_CallAlarmHandler
Sndi_CallAlarmHandler: ; 0x0207D400
	stmdb sp!, {r3, lr}
	ldr r3, _0207D440 ; =_022BB500
	and r2, r0, #0xff
	mov r1, #0xc
	mla r3, r2, r1, r3
	mov r1, r0, asr #8
	ldrb r0, [r3, #8]
	and r1, r1, #0xff
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	ldr r1, [r3]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r3, #4]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D440: .word _022BB500
	arm_func_end Sndi_CallAlarmHandler

