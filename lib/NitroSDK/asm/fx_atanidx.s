	.include "asm/macros.inc"
	.include "include/fx_vec.inc"

	.text

    arm_func_start FX_Atan2Idx
FX_Atan2Idx: ; 0x02075EC8
	stmdb sp!, {r4, lr}
	cmp r0, #0
	ble _02075F5C
	cmp r1, #0
	ble _02075F14
	cmp r1, r0
	ble _02075EF4
	mov r2, r0
	mov r4, #0
	mov r0, #1
	b _0207600C
_02075EF4:
	bge _02075F0C
	mov r2, r1
	mov r1, r0
	mov r4, #0x4000
	mov r0, #0
	b _0207600C
_02075F0C:
	mov r0, #0x2000
	ldmia sp!, {r4, pc}
_02075F14:
	bge _02075F54
	rsb r1, r1, #0
	cmp r1, r0
	bge _02075F38
	mov r2, r1
	mov r1, r0
	mov r4, #0x4000
	mov r0, #1
	b _0207600C
_02075F38:
	ble _02075F4C
	mov r2, r0
	mov r4, #0x8000
	mov r0, #0
	b _0207600C
_02075F4C:
	mov r0, #0x6000
	ldmia sp!, {r4, pc}
_02075F54:
	mov r0, #0x4000
	ldmia sp!, {r4, pc}
_02075F5C:
	bge _02075FFC
	cmp r1, #0
	rsb r0, r0, #0
	bge _02075FB0
	rsb r1, r1, #0
	cmp r1, r0
	ble _02075F8C
	mov r4, #0x8000
	mov r2, r0
	rsb r4, r4, #0
	mov r0, #1
	b _0207600C
_02075F8C:
	bge _02075FA8
	mov r4, #0x4000
	mov r2, r1
	mov r1, r0
	rsb r4, r4, #0
	mov r0, #0
	b _0207600C
_02075FA8:
	mov r0, #0xa000
	ldmia sp!, {r4, pc}
_02075FB0:
	cmp r1, #0
	ble _02075FF4
	cmp r1, r0
	bge _02075FD8
	mov r4, #0x4000
	mov r2, r1
	mov r1, r0
	rsb r4, r4, #0
	mov r0, #1
	b _0207600C
_02075FD8:
	ble _02075FEC
	mov r4, #0
	mov r2, r0
	mov r0, r4
	b _0207600C
_02075FEC:
	mov r0, #0xe000
	ldmia sp!, {r4, pc}
_02075FF4:
	mov r0, #0xc000
	ldmia sp!, {r4, pc}
_02075FFC:
	cmp r1, #0
	movge r0, #0
	movlt r0, #0x8000
	ldmia sp!, {r4, pc}
_0207600C:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r0, #0
	mov r0, r2
	beq _02076048
	bl FX_Div
	mov r1, r0, asr #5
	ldr r0, _0207606C ; =FX_AtanIdxTable_
	mov r1, r1, lsl #1
	ldrsh r0, [r0, r1]
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
_02076048:
	bl FX_Div
	mov r1, r0, asr #5
	ldr r0, _0207606C ; =FX_AtanIdxTable_
	mov r1, r1, lsl #1
	ldrsh r0, [r0, r1]
	sub r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207606C: .word FX_AtanIdxTable_
	arm_func_end FX_Atan2Idx


