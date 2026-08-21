	.include "asm/macros.inc"
	.include "overlay_11_022FE4AC.inc"

	.text

	arm_func_start SetPositionInitialLivePerformer
SetPositionInitialLivePerformer: ; 0x022FE4AC
	cmp r1, #0
	beq _022FE4F8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x130]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x138]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x13c]
	bx lr
_022FE4F8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x130]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x134]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x13c]
	str r2, [r0, #0x144]
	str r2, [r0, #0x140]
	ldrsb r2, [r1, #0x2c]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x148]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x12c]
	bx lr
	arm_func_end SetPositionInitialLivePerformer
