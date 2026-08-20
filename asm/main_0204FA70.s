	.include "asm/macros.inc"
	.include "main_0204FA70.inc"

	.text

	arm_func_start ClearAdventureLogStruct
ClearAdventureLogStruct: ; 0x0204FA70
	mov r3, #0
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r0, r3
_0204FA7C:
	ldr r2, [r1]
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _0204FA7C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r2, [r1]
	str r0, [r2, #0x30]
	ldr r2, [r1]
	str r0, [r2, #0x34]
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	str r0, [r2, #0x14]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x20]
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r2, [r1]
	str r0, [r2, #0x3c]
	ldr r2, [r1]
	str r0, [r2, #0x40]
_0204FB00:
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	str r3, [r2, #0x44]
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	add r0, r0, #1
	str r3, [r2, #0xd8]
	cmp r0, #0x25
	blt _0204FB00
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r2, #0
_0204FB2C:
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x16c]
	cmp r3, #0x11
	blt _0204FB2C
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov ip, #0
_0204FB4C:
	ldr r1, [r0]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str ip, [r1, #0x1b0]
	cmp r2, #0x2c
	blt _0204FB4C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	ldr r0, [r1]
	str ip, [r0, #0x260]
	mov r0, #0x3e8
_0204FB74:
	rsb r2, ip, #5
	mul r3, r2, r0
	ldr r2, [r1]
	add r2, r2, ip, lsl #2
	add ip, ip, #1
	str r3, [r2, #0x264]
	cmp ip, #5
	blt _0204FB74
	bx lr
	.align 2, 0
_0204FB98: .word ADVENTURE_LOG_PTR
	arm_func_end ClearAdventureLogStruct
