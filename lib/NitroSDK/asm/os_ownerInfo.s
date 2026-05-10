	.include "asm/macros.inc"

	.text

    .public MI_CpuCopy8
    .public MTi_CpuCopy16

    arm_func_start OS_GetMacAddress
OS_GetMacAddress: ; 0x0207B9EC
	ldr ip, _0207BA00 ; =MI_CpuCopy8
	mov r1, r0
	ldr r0, _0207BA04 ; =0x027FFCF4
	mov r2, #6
	bx ip
	.align 2, 0
_0207BA00: .word MI_CpuCopy8
_0207BA04: .word 0x027FFCF4
	arm_func_end OS_GetMacAddress

	arm_func_start GetDsFirmwareUserSettings ; OS_GetOwnerInfo
GetDsFirmwareUserSettings: ; 0x0207BA08
	stmdb sp!, {r4, lr}
	ldr ip, _0207BA88 ; =0x027FFC80
	mov r4, r0
	ldrh r2, [ip, #0x64]
	add r0, ip, #6
	add r1, r4, #4
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1d
	strb r2, [r4]
	ldrb r3, [ip, #2]
	mov r2, #0x14
	mov r3, r3, lsl #0x1c
	mov r3, r3, lsr #0x1c
	strb r3, [r4, #1]
	ldrb r3, [ip, #3]
	strb r3, [r4, #2]
	ldrb r3, [ip, #4]
	strb r3, [r4, #3]
	ldrb r3, [ip, #0x1a]
	strh r3, [r4, #0x1a]
	ldrb r3, [ip, #0x50]
	strh r3, [r4, #0x52]
	bl MTi_CpuCopy16
	ldr r0, _0207BA88 ; =0x027FFC80
	add r1, r4, #0x1c
	add r0, r0, #0x1c
	mov r2, #0x34
	bl MTi_CpuCopy16
	mov r0, #0
	strh r0, [r4, #0x18]
	strh r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207BA88: .word 0x027FFC80
	arm_func_end GetDsFirmwareUserSettings

