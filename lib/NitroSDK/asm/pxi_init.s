	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

	arm_func_start PXI_Init
PXI_Init: ; 0x0207D9A4
	ldr ip, _0207D9AC ; =PXI_InitFifo
	bx ip
	.align 2, 0
_0207D9AC: .word PXI_InitFifo
	arm_func_end PXI_Init

