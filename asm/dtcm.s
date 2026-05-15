	.include "asm/macros.inc"
	.include "dtcm.inc"

	.bss
	.global DTCM_BSS
DTCM_BSS:
	.space 0x2020

	.section .dtcm,4,1,4
	.global OS_IRQTable
OS_IRQTable:
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OSi_IrqTimer0
	.word OSi_IrqTimer1
	.word OSi_IrqTimer2
	.word OSi_IrqTimer3
	.word OS_IrqDummy
	.word OSi_IrqDma0
	.word OSi_IrqDma1
	.word OSi_IrqDma2
	.word OSi_IrqDma3
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
