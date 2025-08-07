	.include "asm/macros.inc"
	.include "main_02054C24.inc"

	.text

	arm_func_start GetBaseFormCastformDeoxysCherrim
GetBaseFormCastformDeoxysCherrim: ; 0x02054C24
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsDeoxys
	cmp r0, #0
	ldrne r0, _02054CCC ; =0x000001A2
	ldmneia sp!, {r4, pc}
	ldr r1, _02054CD0 ; =0xFFFFFE85
	add r0, r4, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	rsbls r0, r1, #0
	ldmlsia sp!, {r4, pc}
	sub r0, r1, #0x258
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	rsbls r0, r1, #0x258
	ldmlsia sp!, {r4, pc}
	sub r0, r4, #0x1cc
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	movls r0, #0x1cc
	ldmlsia sp!, {r4, pc}
	ldr r0, _02054CD4 ; =0xFFFFFBDC
	add r1, r4, r0
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	rsbls r4, r0, #0
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02054CCC: .word 0x000001A2
_02054CD0: .word 0xFFFFFE85
_02054CD4: .word 0xFFFFFBDC
	arm_func_end GetBaseFormCastformDeoxysCherrim

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
