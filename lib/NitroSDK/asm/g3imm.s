	.include "asm/macros.inc"
	.include "include/g3imm.inc"

	.text

    arm_func_start G3_LoadMtx44
G3_LoadMtx44: ; 0x02077770
	ldr r1, _02077784 ; =0x04000400
	mov r2, #0x16
	ldr ip, _02077788 ; =GX_SendFifo64B
	str r2, [r1]
	bx ip
	.align 2, 0
_02077784: .word 0x04000400
_02077788: .word GX_SendFifo64B
	arm_func_end G3_LoadMtx44

	arm_func_start G3_LoadMtx43
G3_LoadMtx43: ; 0x0207778C
	ldr r1, _020777A0 ; =0x04000400
	mov r2, #0x17
	ldr ip, _020777A4 ; =GX_SendFifo48B
	str r2, [r1]
	bx ip
	.align 2, 0
_020777A0: .word 0x04000400
_020777A4: .word GX_SendFifo48B
	arm_func_end G3_LoadMtx43

	arm_func_start G3_MultMtx43
G3_MultMtx43: ; 0x020777A8
	ldr r1, _020777BC ; =0x04000400
	mov r2, #0x19
	ldr ip, _020777C0 ; =GX_SendFifo48B
	str r2, [r1]
	bx ip
	.align 2, 0
_020777BC: .word 0x04000400
_020777C0: .word GX_SendFifo48B
	arm_func_end G3_MultMtx43


