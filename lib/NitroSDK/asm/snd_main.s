	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start SND_Init
SND_Init: ; 0x0207CC10
	stmdb sp!, {r3, lr}
	ldr r1, _0207CC40 ; =_022B99EC
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0207CC44 ; =_022B99F0
	mov r2, #1
	str r2, [r1]
	bl OS_InitMutex
	bl SND_CommandInit
	bl Snd_AlarmInit
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207CC40: .word _022B99EC
_0207CC44: .word _022B99F0
	arm_func_end SND_Init

	arm_func_start Sndi_LockMutex
Sndi_LockMutex: ; 0x0207CC48
	ldr ip, _0207CC54 ; =OS_LockMutex
	ldr r0, _0207CC58 ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC54: .word OS_LockMutex
_0207CC58: .word _022B99F0
	arm_func_end Sndi_LockMutex

	arm_func_start Sndi_UnlockMutex
Sndi_UnlockMutex: ; 0x0207CC5C
	ldr ip, _0207CC68 ; =OS_UnlockMutex
	ldr r0, _0207CC6C ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC68: .word OS_UnlockMutex
_0207CC6C: .word _022B99F0
	arm_func_end Sndi_UnlockMutex

