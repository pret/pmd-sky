	.include "asm/macros.inc"
	.include "main_020257FC.inc"

	.text

	arm_func_start sub_020257FC
sub_020257FC: ; 0x020257FC
	stmdb sp!, {r3, lr}
	ldr r0, _02025814 ; =_022A59B8
	mov r1, #8
	bl MemZero
	bl LoadStringFile
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025814: .word _022A59B8
	arm_func_end sub_020257FC

	arm_func_start LoadStringFile
LoadStringFile: ; 0x02025818
	stmdb sp!, {r4, lr}
	bl GetLanguage
	ldr r1, _0202587C ; =_020AFCEC
	mov r4, r0
	ldrsb r0, [r1]
	cmp r0, r4
	ldmeqia sp!, {r4, pc}
	bl FileRom_InitDataTransfer
	ldr r1, _0202587C ; =_020AFCEC
	mvn r0, #0
	ldrsb r1, [r1]
	cmp r1, r0
	beq _02025854
	ldr r0, _02025880 ; =_022A59C0
	bl FileClose
_02025854:
	ldr r1, _0202587C ; =_020AFCEC
	ldr r0, _02025880 ; =_022A59C0
	strb r4, [r1]
	bl FileRom_Veneer_FileInit
	ldr r1, _02025884 ; =_020AFCF0
	ldr r0, _02025880 ; =_022A59C0
	ldr r1, [r1, r4, lsl #2]
	bl FileRom_HandleOpen
	bl FileRom_StopDataTransfer
	ldmia sp!, {r4, pc}
	.align 2, 0
_0202587C: .word _020AFCEC
_02025880: .word _022A59C0
_02025884: .word _020AFCF0
	arm_func_end LoadStringFile
