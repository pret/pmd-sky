	.include "asm/macros.inc"
	.include "main_02054CD8.inc"

	.text

	arm_func_start BaseFormsEqual
BaseFormsEqual: ; 0x02054CD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	bl FemaleToMaleForm
	mov r5, r0
	mov r0, r4
	bl FemaleToMaleForm
	mov r4, r0
	mov r0, r5
	bl GetBaseFormCastformDeoxysCherrim
	mov r5, r0
	mov r0, r4
	bl GetBaseFormCastformDeoxysCherrim
	mov r6, r0
	cmp r5, r6
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl IsUnown
	cmp r0, #0
	beq _02054D3C
	mov r0, r6
	bl IsUnown
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_02054D3C:
	mov r0, r5
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	mov r4, r0
	mov r0, r6
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	ldr r1, _02054DB8 ; =0x000001BF
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	ldr r1, _02054DBC ; =0x000001C2
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	ldr r1, _02054DC0 ; =0x000001CE
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	cmp r4, #0x1d0
	cmpeq r0, #0x1d0
	bne _02054D94
_02054D8C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02054D94:
	mov r0, r5
	bl GetDexNumber
	mov r4, r0
	mov r0, r6
	bl GetDexNumber
	cmp r4, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02054DB8: .word 0x000001BF
_02054DBC: .word 0x000001C2
_02054DC0: .word 0x000001CE
	arm_func_end BaseFormsEqual
