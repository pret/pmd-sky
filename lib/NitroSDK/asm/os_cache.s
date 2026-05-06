	.include "asm/macros.inc"

	.text

    arm_func_start sub_0207A238
sub_0207A238: ; 0x0207A238
	mov r0, #0
	mcr p15, 0, r0, c7, c6, 0
	bx lr
	arm_func_end sub_0207A238

	arm_func_start sub_0207A244
sub_0207A244: ; 0x0207A244
	mov r1, #0
_0207A248:
	mov r0, #0
_0207A24C:
	orr r2, r1, r0
	mcr p15, 0, r2, c7, c10, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A24C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A248
	bx lr
	arm_func_end sub_0207A244

	arm_func_start DC_FlushAll
DC_FlushAll: ; 0x0207A270
	mov ip, #0
	mov r1, #0
_0207A278:
	mov r0, #0
_0207A27C:
	orr r2, r1, r0
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r2, c7, c14, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A27C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A278
	bx lr
	arm_func_end DC_FlushAll

	arm_func_start DC_InvalidateRange
DC_InvalidateRange: ; 0x0207A2A4
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2AC:
	mcr p15, 0, r0, c7, c6, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2AC
	bx lr
	arm_func_end DC_InvalidateRange

	arm_func_start sub_0207A2C0
sub_0207A2C0: ; 0x0207A2C0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2C8:
	mcr p15, 0, r0, c7, c10, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2C8
	bx lr
	arm_func_end sub_0207A2C0

	arm_func_start DC_FlushRange
DC_FlushRange: ; 0x0207A2DC
	mov ip, #0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2E8:
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r0, c7, c14, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2E8
	bx lr
	arm_func_end DC_FlushRange

	arm_func_start sub_0207A300
sub_0207A300: ; 0x0207A300
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4
	bx lr
	arm_func_end sub_0207A300

	arm_func_start sub_0207A30C
sub_0207A30C: ; 0x0207A30C
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #0x1000
	mov r0, r0, lsr #0xc
	orr r1, r1, #0x1000
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end sub_0207A30C

	arm_func_start sub_0207A324
sub_0207A324: ; 0x0207A324
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0
	bx lr
	arm_func_end sub_0207A324

	arm_func_start sub_0207A330
sub_0207A330: ; 0x0207A330
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A338:
	mcr p15, 0, r0, c7, c5, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A338
	bx lr
	arm_func_end sub_0207A330

