	.include "asm/macros.inc"
	.include "include/os_exception.inc"

	.text

    arm_func_start OS_InitException
OS_InitException: ; 0x0207AB24
	ldr r0, _0207AB84 ; =0x027FFD9C
	ldr r1, [r0]
	cmp r1, #0x2600000
	blo _0207AB44
	cmp r1, #0x2800000
	ldrlo r0, _0207AB88 ; =_022B98F0
	strlo r1, [r0]
	blo _0207AB50
_0207AB44:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0]
_0207AB50:
	ldr r0, _0207AB88 ; =_022B98F0
	ldr r0, [r0]
	cmp r0, #0
	bne _0207AB74
	ldr r2, _0207AB8C ; =OSi_ExceptionHandler
	ldr r1, _0207AB84 ; =0x027FFD9C
	ldr r0, _0207AB90 ; =0x027E3000
	str r2, [r1]
	str r2, [r0, #0xfdc]
_0207AB74:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0207AB84: .word 0x027FFD9C
_0207AB88: .word _022B98F0
_0207AB8C: .word OSi_ExceptionHandler
_0207AB90: .word 0x027E3000
	arm_func_end OS_InitException

	arm_func_start OSi_ExceptionHandler
OSi_ExceptionHandler: ; 0x0207AB94
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
	bne _0207ABA8
	b _0207ABAC
_0207ABA8:
	mov lr, pc
_0207ABAC:
	bne _0207ABB4
	b _0207ABB8
_0207ABB4:
	bx ip
_0207ABB8:
	ldr ip, _0207AC14 ; =_02000000
	stmdb ip!, {r0, r1, r2, r3, sp, lr}
	and r0, sp, #1
	mov sp, ip
	mrs r1, cpsr
	and r1, r1, #0x1f
	teq r1, #0x17
	bne _0207ABE0
	bl OSi_GetAndDisplayContext
	b _0207ABEC
_0207ABE0:
	teq r1, #0x1b
	bne _0207ABEC
	bl OSi_GetAndDisplayContext
_0207ABEC:
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
_0207ABF8:
	beq _0207ABF8
_0207ABFC:
	mov r0, r0
	b _0207ABFC
_0207AC04:
	ldmia sp!, {r0, r1, r2, r3, ip, lr}
	mov sp, ip
	bx lr
	.align 2, 0
_0207AC10: .word _022B98F0
_0207AC14: .word _secure
	arm_func_end OSi_ExceptionHandler

	arm_func_start OSi_GetAndDisplayContext
OSi_GetAndDisplayContext: ; 0x0207AC18
	stmdb sp!, {r0, lr}
	bl OSi_SetExContext
	bl OSi_DisplayExContent
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end OSi_GetAndDisplayContext

	arm_func_start OSi_SetExContext
OSi_SetExContext: ; 0x0207AC2C
	ldr r1, _0207ACB8 ; =_022B991C
	mrs r2, cpsr
	str r2, [r1, #0x74]
	str r0, [r1, #0x6c]
	ldr r0, [ip]
	str r0, [r1, #4]
	ldr r0, [ip, #4]
	str r0, [r1, #8]
	ldr r0, [ip, #8]
	str r0, [r1, #0xc]
	ldr r0, [ip, #0xc]
	str r0, [r1, #0x10]
	ldr r2, [ip, #0x10]
	bic r2, r2, #1
	add r0, r1, #0x14
	stmia r0, {r4, r5, r6, r7, r8, sb, sl, fp}
	str ip, [r1, #0x70]
	ldr r0, [r2]
	str r0, [r1, #0x64]
	ldr r3, [r2, #4]
	str r3, [r1]
	ldr r0, [r2, #8]
	str r0, [r1, #0x34]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x40]
	mrs r0, cpsr
	orr r3, r3, #0x80
	bic r3, r3, #0x20
	msr cpsr_fsxc, r3
	str sp, [r1, #0x38]
	str lr, [r1, #0x3c]
	mrs r2, spsr
	str r2, [r1, #0x7c]
	msr cpsr_fsxc, r0
	bx lr
	.align 2, 0
_0207ACB8: .word _022B991C
	arm_func_end OSi_SetExContext

	arm_func_start OSi_DisplayExContent
OSi_DisplayExContent: ; 0x0207ACBC
	stmdb sp!, {r3, lr}
	ldr r0, _0207AD20 ; =_022B98F0
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mrs r2, cpsr
	mov r0, sp
	ldr r1, _0207AD24 ; =0x0000009F
	msr cpsr_fsxc, r1
	mov r1, sp
	mov sp, r0
	stmdb sp!, {r1, r2}
	bl OS_EnableProtectionUnit
	ldr r0, _0207AD28 ; =_022B991C
	ldr r1, _0207AD2C ; =_022B98F4
	ldr r1, [r1]
	ldr ip, _0207AD30 ; =_022B98F8
	ldr ip, [ip]
	ldr lr, _0207AD34 ; =OSi_DisplayExContext_Helper
	bx ip
OSi_DisplayExContext_Helper:
	bl OS_DisableProtectionUnit
	ldmia sp!, {r1, r2}
	mov sp, r1
	msr cpsr_fsxc, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207AD20: .word _022B98F0
_0207AD24: .word 0x0000009F
_0207AD28: .word _022B991C
_0207AD2C: .word _022B98F4
_0207AD30: .word _022B98F8
_0207AD34: .word OSi_DisplayExContext_Helper
	arm_func_end OSi_DisplayExContent

