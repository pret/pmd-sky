	.include "asm/macros.inc"
	.include "dtcm.inc"

	.bss
	.global DTCM_BSS
DTCM_BSS:
	.space 0x2020

	.section .dtcm,4,1,4
	.global OS_IRQTable
OS_IRQTable:
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078A40
	.word sub_02078A50
	.word sub_02078A60
	.word sub_02078A70
	.word sub_02078974
	.word sub_02078A00
	.word sub_02078A10
	.word sub_02078A20
	.word sub_02078A30
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
	.word sub_02078974
