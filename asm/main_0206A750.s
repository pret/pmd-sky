	.include "asm/macros.inc"
	.include "main_0206A750.inc"

	.text

	arm_func_start sub_0206A7CC
sub_0206A7CC: ; 0x0206A7CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x3e8
	bne _0206A7F4
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	b _0206A82C
_0206A7F4:
	ldr r0, _0206A848 ; =0x000003E9
	cmp r4, r0
	bne _0206A82C
	bl sub_0204E6FC
	cmp r0, #2
	bne _0206A814
	bl sub_0204E780
	b _0206A818
_0206A814:
	bl sub_0204E770
_0206A818:
	cmp r0, #0xff
	addne r0, r0, #1
	mvneq r4, #0
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
_0206A82C:
	cmp r4, #0xd1
	bne _0206A840
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	moveq r4, #0xd2
_0206A840:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206A848: .word 0x000003E9
	arm_func_end sub_0206A7CC
