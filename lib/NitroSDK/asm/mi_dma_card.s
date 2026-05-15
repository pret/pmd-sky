	.include "asm/macros.inc"

	.text

    .public MIi_CheckAnotherAutoDma
    .public MIi_CheckDma0SourceAddress
    .public InitDmaTransfer_Standard

    arm_func_start MTi_CardDmaCopy32 ;
MTi_CardDmaCopy32: ; 0x0207C750
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r6, r0
	mov r7, r3
	mvn r1, #0
	mov r4, r2
	bl MIi_CheckAnotherAutoDma
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0x1000000
	bl MIi_CheckDma0SourceAddress
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, r6, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r1, r0, #0x4000000
_0207C79C:
	ldr r0, [r1]
	tst r0, #0x80000000
	bne _0207C79C
	ldr r3, _0207C7C0 ; =0xAF000001
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl InitDmaTransfer_Standard
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207C7C0: .word 0xAF000001
	arm_func_end MTi_CardDmaCopy32

