	.include "asm/macros.inc"

	.text

    arm_func_start OS_SetDPermissionsForProtectionRegion
OS_SetDPermissionsForProtectionRegion: ; 0x0207AB00
	mrc p15, 0, r2, c5, c0, 2
	bic r2, r2, r0
	orr r2, r2, r1
	mcr p15, 0, r2, c5, c0, 2
	bx lr
	arm_func_end OS_SetDPermissionsForProtectionRegion

	arm_func_start OS_SetProtectionRegion1
OS_SetProtectionRegion1: ; 0x0207AB14
	mcr p15, 0, r0, c6, c1, 0
	bx lr
	arm_func_end OS_SetProtectionRegion1

	arm_func_start OS_SetProtectionRegion2
OS_SetProtectionRegion2: ; 0x0207AB1C
	mcr p15, 0, r0, c6, c2, 0
	bx lr
	arm_func_end OS_SetProtectionRegion2

