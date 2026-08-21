	.include "asm/macros.inc"
	.include "overlay_01.inc"

	.text

	arm_func_start ov01_02329520
ov01_02329520: ; 0x02329520
	ldr r0, _0232952C ; =ov01_0233C0C0
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_0232952C: .word ov01_0233C0C0
	arm_func_end ov01_02329520

	arm_func_start ov01_02329530
ov01_02329530: ; 0x02329530
	ldr r0, _02329540 ; =ov01_0233C0C0
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_02329540: .word ov01_0233C0C0
	arm_func_end ov01_02329530

	arm_func_start ov01_02329544
ov01_02329544: ; 0x02329544
	stmdb sp!, {r3, lr}
	ldr r0, _02329568 ; =ov01_0233C240
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	bl ov01_02329A38
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329568: .word ov01_0233C240
	arm_func_end ov01_02329544

	arm_func_start ov01_0232956C
ov01_0232956C: ; 0x0232956C
	ldr r0, _02329578 ; =ov01_0233C0C0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02329578: .word ov01_0233C0C0
	arm_func_end ov01_0232956C

	arm_func_start ov01_0232957C
ov01_0232957C: ; 0x0232957C
	ldr r0, _0232958C ; =ov01_0233C0C0
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0232958C: .word ov01_0233C0C0
	arm_func_end ov01_0232957C

	arm_func_start ov01_02329590
ov01_02329590: ; 0x02329590
	stmdb sp!, {r3, lr}
	mov r3, r0
	mov ip, #0x1e
	ldr r0, _023295C0 ; =ov01_023295C4
	mov r1, #3
	mov r2, #0x11
	str ip, [sp]
	bl WM_MeasureChannel
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023295C0: .word ov01_023295C4
	arm_func_end ov01_02329590

	arm_func_start ov01_023295C4
ov01_023295C4: ; 0x023295C4
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _023295DC
	bl ov01_0232AB88
	ldmia sp!, {r3, pc}
_023295DC:
	ldr r1, _02329618 ; =ov01_0233C240
	ldrh r3, [r0, #0xa]
	ldrh r2, [r1]
	cmp r2, r3
	strhih r3, [r1]
	ldrhih r2, [r0, #8]
	strhih r2, [r1, #6]
	ldrh r0, [r0, #8]
	bl ov01_0232961C
	cmp r0, #0
	beq _02329610
	bl ov01_02329590
	ldmia sp!, {r3, pc}
_02329610:
	bl ov01_0232AB88
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329618: .word ov01_0233C240
	arm_func_end ov01_023295C4

	arm_func_start ov01_0232961C
ov01_0232961C: ; 0x0232961C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl WM_GetAllowedChannel
	mov r2, #1
	b _02329640
_02329630:
	sub r1, r4, #1
	tst r0, r2, lsl r1
	movne r0, r4
	ldmneia sp!, {r4, pc}
_02329640:
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, lsr #0x10
	cmp r4, #0xe
	bls _02329630
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov01_0232961C

	arm_func_start ov01_0232965C
ov01_0232965C: ; 0x0232965C
	stmdb sp!, {r4, lr}
	ldr r4, _02329828 ; =ov01_0233C0C0
	mov lr, #0
	str lr, [r4, #8]
	ldr ip, _0232982C ; =ov01_0233C240
	str lr, [r4, #4]
	str lr, [ip, #0x7c]
	strh lr, [ip, #8]
	strh r3, [ip, #4]
	str r1, [ip, #0x30]
	str lr, [ip, #0x14]
	mov r4, r0
	str r2, [ip, #0xc]
	str r4, [ip, #0x4c]
	str lr, [ip, #0x74]
	str lr, [ip, #0x2c]
	mov r0, #0xf20
	mov r1, #8
	str lr, [ip, #0x18]
	bl MemAlloc
	ldr r2, _0232982C ; =ov01_0233C240
	mov r1, #8
	str r0, [r2, #0x10]
	mov r0, #0x60
	bl MemAlloc
	ldr r2, _0232982C ; =ov01_0233C240
	add r1, r0, #0x1f
	str r0, [r2, #0x24]
	bic r3, r1, #0x1f
	mov r0, #0x40
	mov r1, #8
	str r3, [r2, #0x20]
	bl MemAlloc
	ldr r2, _0232982C ; =ov01_0233C240
	add r1, r0, #0x1f
	str r0, [r2, #0x70]
	bic r3, r1, #0x1f
	mov r0, #0xe0
	mov r1, #8
	str r3, [r2, #0x28]
	bl MemAlloc
	ldr r1, _0232982C ; =ov01_0233C240
	add r2, r0, #0x1f
	str r0, [r1, #0x38]
	bic r0, r2, #0x1f
	str r0, [r1, #0x6c]
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _02329760
	mov r0, #0x840
	mov r1, #8
	bl MemAlloc
	ldr r2, _0232982C ; =ov01_0233C240
	add r1, r0, #0x1f
	str r0, [r2, #0x54]
	bic r3, r1, #0x1f
	mov r0, #0x220
	mov r1, #8
	str r3, [r2, #0x50]
	bl MemAlloc
	ldr r1, _0232982C ; =ov01_0233C240
	add r2, r0, #0x1f
	str r0, [r1, #0x5c]
	bic r0, r2, #0x1f
	str r0, [r1, #0x58]
_02329760:
	ldr r0, _0232982C ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x60]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	ldr r2, _0232982C ; =ov01_0233C240
	add r1, r1, #0x23
	add r0, r0, #0x21
	bic r3, r1, #0x1f
	bic r0, r0, #0x1f
	cmp r3, r0
	movle r3, r0
	add r0, r3, #0x20
	mov r1, #8
	str r3, [r2, #0x34]
	bl MemAlloc
	ldr r1, _0232982C ; =ov01_0233C240
	add r2, r0, #0x1f
	str r0, [r1, #0x40]
	bic r0, r2, #0x1f
	str r0, [r1, #0x3c]
	ldrh r2, [r4, #0x36]
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x10]
	add r2, r2, #0xe
	add r0, r0, #0x55
	mul r1, r2, r1
	add r1, r1, #0x29
	bic r1, r1, #0x1f
	mov r3, r1, lsl #1
	bic r0, r0, #0x1f
	cmp r3, r0, lsl #1
	mov r0, r0, lsl #1
	movle r3, r0
	ldr r2, _0232982C ; =ov01_0233C240
	add r0, r3, #0x20
	mov r1, #8
	str r3, [r2, #0x44]
	bl MemAlloc
	ldr r1, _0232982C ; =ov01_0233C240
	add r2, r0, #0x1f
	str r0, [r1, #0x1c]
	bic r0, r2, #0x1f
	str r0, [r1, #0x48]
	ldr r0, [r1, #0x10]
	mov r1, #2
	add r0, r0, #0x1f
	bic r0, r0, #0x1f
	bl WM_Init
	ldmia sp!, {r4, pc}
	.align 2, 0
_02329828: .word ov01_0233C0C0
_0232982C: .word ov01_0233C240
	arm_func_end ov01_0232965C

	arm_func_start ov01_02329830
ov01_02329830: ; 0x02329830
	stmdb sp!, {r3, lr}
	mov r1, #0
	mov r2, r1
	mov r0, #0xd
	bl WM_SetPortCallback
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	cmpne r0, #2
	ldmneia sp!, {r3, pc}
	bl WM_Finish
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x1c]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x40]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r1, [r0, #0x30]
	cmp r1, #0
	beq _023298A0
	ldr r0, [r0, #0x5c]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x54]
	bl MemFree
_023298A0:
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x38]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x70]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x24]
	bl MemFree
	ldr r0, _023298E0 ; =ov01_0233C240
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _023298E4 ; =ov01_0233C0C0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023298E0: .word ov01_0233C240
_023298E4: .word ov01_0233C0C0
	arm_func_end ov01_02329830

	arm_func_start ov01_023298E8
ov01_023298E8: ; 0x023298E8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02329994 ; =ov01_0233C0C0
	mov r3, #0
	mov r5, r0
	mov r4, r1
	str r3, [r2, #0x10]
	bl WM_GetNextTgid
	ldr r2, _02329998 ; =ov01_0233C240
	ldr r1, _02329994 ; =ov01_0233C0C0
	strh r0, [r2, #2]
	str r5, [r1, #0x14]
	strh r4, [r1]
	ldr r0, [r2, #0x7c]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_02329928: ; jump table
	b _02329940 ; case 0
	b _02329958 ; case 1
	ldmia sp!, {r3, r4, r5, pc} ; case 2
	b _02329970 ; case 3
	ldmia sp!, {r3, r4, r5, pc} ; case 4
	b _0232997C ; case 5
_02329940:
	mov r0, #3
	str r0, [r2, #0x7c]
	mov r0, #4
	str r0, [r2, #0x78]
	bl ov01_0232AA8C
	ldmia sp!, {r3, r4, r5, pc}
_02329958:
	mov r0, #3
	str r0, [r2, #0x7c]
	mov r0, #4
	str r0, [r2, #0x78]
	bl ov01_0232AAEC
	ldmia sp!, {r3, r4, r5, pc}
_02329970:
	mov r0, #4
	str r0, [r2, #0x78]
	ldmia sp!, {r3, r4, r5, pc}
_0232997C:
	mov r0, #3
	str r0, [r2, #0x7c]
	mov r0, #4
	str r0, [r2, #0x78]
	bl ov01_0232AB88
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02329994: .word ov01_0233C0C0
_02329998: .word ov01_0233C240
	arm_func_end ov01_023298E8

	arm_func_start ov01_0232999C
ov01_0232999C: ; 0x0232999C
	stmdb sp!, {r3, lr}
	ldr r1, _02329A30 ; =ov01_0233C0C0
	mov r2, #0
	str r0, [r1, #0xc]
	ldr r0, _02329A34 ; =ov01_0233C240
	str r2, [r1, #0x10]
	ldr r1, [r0, #0x7c]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_023299C4: ; jump table
	b _023299DC ; case 0
	b _023299F4 ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02329A0C ; case 3
	b _02329A18 ; case 4
	ldmia sp!, {r3, pc} ; case 5
_023299DC:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #5
	str r1, [r0, #0x78]
	bl ov01_0232AA8C
	ldmia sp!, {r3, pc}
_023299F4:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #5
	str r1, [r0, #0x78]
	bl ov01_0232AAEC
	ldmia sp!, {r3, pc}
_02329A0C:
	mov r1, #5
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
_02329A18:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #5
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329A30: .word ov01_0233C0C0
_02329A34: .word ov01_0233C240
	arm_func_end ov01_0232999C

	arm_func_start ov01_02329A38
ov01_02329A38: ; 0x02329A38
	stmdb sp!, {r3, lr}
	ldr r0, _02329AA4 ; =ov01_0233C240
	ldr r1, [r0, #0x7c]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_02329A50: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02329A68 ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02329A80 ; case 3
	b _02329A8C ; case 4
	b _02329A8C ; case 5
_02329A68:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AABC
	ldmia sp!, {r3, pc}
_02329A80:
	mov r1, #0
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
_02329A8C:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329AA4: .word ov01_0233C240
	arm_func_end ov01_02329A38

	arm_func_start ov01_02329AA8
ov01_02329AA8: ; 0x02329AA8
	stmdb sp!, {r3, lr}
	ldr r0, _02329B14 ; =ov01_0233C240
	ldr r1, [r0, #0x7c]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_02329AC0: ; jump table
	b _02329AD8 ; case 0
	ldmia sp!, {r3, pc} ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02329AF0 ; case 3
	b _02329AFC ; case 4
	b _02329AFC ; case 5
_02329AD8:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #1
	str r1, [r0, #0x78]
	bl ov01_0232AA8C
	ldmia sp!, {r3, pc}
_02329AF0:
	mov r1, #1
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
_02329AFC:
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #1
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329B14: .word ov01_0233C240
	arm_func_end ov01_02329AA8

	arm_func_start ov01_02329B18
ov01_02329B18: ; 0x02329B18
	ldr r0, _02329B24 ; =ov01_0233C240
	ldr r0, [r0, #0x7c]
	bx lr
	.align 2, 0
_02329B24: .word ov01_0233C240
	arm_func_end ov01_02329B18

	arm_func_start ov01_02329B28
ov01_02329B28: ; 0x02329B28
	ldr r0, _02329B34 ; =ov01_0233C240
	ldrh r0, [r0, #8]
	bx lr
	.align 2, 0
_02329B34: .word ov01_0233C240
	arm_func_end ov01_02329B28

	arm_func_start ov01_02329B38
ov01_02329B38: ; 0x02329B38
	stmdb sp!, {r3, lr}
	ldr r2, _02329B6C ; =ov01_0233C240
	ldr r3, [r2, #0x20]
	ldrh r3, [r3, #0x34]
	cmp r1, r3
	ldmhiia sp!, {r3, pc}
	ldr r3, [r2, #0x74]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	mov r3, #0
	str r3, [r2, #0x74]
	bl ov01_0232AD60
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329B6C: .word ov01_0233C240
	arm_func_end ov01_02329B38

	arm_func_start ov01_02329B70
ov01_02329B70: ; 0x02329B70
	stmdb sp!, {r3, lr}
	ldr r2, _02329BA4 ; =ov01_0233C240
	ldr r3, [r2, #0x4c]
	ldrh r3, [r3, #0x36]
	cmp r1, r3
	ldmhiia sp!, {r3, pc}
	ldr r3, [r2, #0x74]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	mov r3, #0
	str r3, [r2, #0x74]
	bl ov01_0232AD60
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329BA4: .word ov01_0233C240
	arm_func_end ov01_02329B70

	arm_func_start ov01_02329BA8
ov01_02329BA8: ; 0x02329BA8
	ldr r1, _02329BB4 ; =ov01_0233C240
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_02329BB4: .word ov01_0233C240
	arm_func_end ov01_02329BA8

	arm_func_start ov01_02329BB8
ov01_02329BB8: ; 0x02329BB8
	ldr r1, _02329BC4 ; =ov01_0233C240
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_02329BC4: .word ov01_0233C240
	arm_func_end ov01_02329BB8

	arm_func_start ov01_02329BC8
ov01_02329BC8: ; 0x02329BC8
	stmdb sp!, {r3, lr}
	ldr r1, _02329C2C ; =ov01_0233C240
	mov r2, #0x40
	ldr r0, [r1, #0x4c]
	ldr r1, [r1, #0x20]
	bl MTi_CpuCopy32
	ldr r0, _02329C2C ; =ov01_0233C240
	ldrh r1, [r0, #6]
	ldr r0, [r0, #0x20]
	strh r1, [r0, #0x32]
	bl WM_GetDispersionBeaconPeriod
	ldr r2, _02329C2C ; =ov01_0233C240
	ldr r1, _02329C30 ; =ov01_0233C0C0
	ldr r3, [r2, #0x20]
	strh r0, [r3, #0x18]
	ldrh r3, [r2, #2]
	ldr r0, [r2, #0x20]
	strh r3, [r0, #0xc]
	ldr r3, [r1, #0x14]
	ldr r0, [r2, #0x20]
	str r3, [r0]
	ldrh r1, [r1]
	ldr r0, [r2, #0x20]
	strh r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329C2C: .word ov01_0233C240
_02329C30: .word ov01_0233C0C0
	arm_func_end ov01_02329BC8

	arm_func_start ov01_02329C34
ov01_02329C34: ; 0x02329C34
	stmdb sp!, {r3, lr}
	ldr r0, _02329CA4 ; =ov01_0233C240
	ldr r2, [r0, #0x6c]
	ldr r1, [r0, #0x28]
	str r2, [r1]
	ldr r1, [r0, #0x4c]
	ldr r0, [r0, #0x28]
	ldrh r1, [r1, #0x32]
	strh r1, [r0, #4]
	bl WM_GetDispersionScanPeriod
	ldr r1, _02329CA4 ; =ov01_0233C240
	mov r2, #0xff
	ldr r3, [r1, #0x28]
	strh r0, [r3, #6]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #8]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #9]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #0xa]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #0xb]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #0xc]
	ldr r0, [r1, #0x28]
	strb r2, [r0, #0xd]
	bl ov01_02329CA8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329CA4: .word ov01_0233C240
	arm_func_end ov01_02329C34

	arm_func_start ov01_02329CA8
ov01_02329CA8: ; 0x02329CA8
	stmdb sp!, {r3, lr}
	bl WM_GetAllowedChannel
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _02329D28 ; =ov01_0233C240
	mov ip, #0
	ldr lr, [r1, #0x28]
	mov r3, #1
	b _02329D18
_02329CD0:
	ldrh r1, [lr, #4]
	add r1, r1, ip
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #28
	add r1, r2, r1, ror #28
	tst r0, r3, lsl r1
	beq _02329D14
	ldr r0, _02329D28 ; =ov01_0233C240
	ldr r2, [r0, #0x28]
	ldrh r0, [r2, #4]
	add r0, r0, ip
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r0, r1, r0, ror #28
	add r0, r0, #1
	strh r0, [r2, #4]
	b _02329D20
_02329D14:
	add ip, ip, #1
_02329D18:
	cmp ip, #0x10
	blt _02329CD0
_02329D20:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329D28: .word ov01_0233C240
	arm_func_end ov01_02329CA8

	arm_func_start ov01_02329D2C
ov01_02329D2C: ; 0x02329D2C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	mov r4, r0
	cmp r1, #0
	bne _02329D90
	ldr r0, _02329DA8 ; =ov01_0233C240
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02329D9C
_02329D5C: ; jump table
	b _02329D74 ; case 0
	b _02329D7C ; case 1
	b _02329D9C ; case 2
	b _02329D9C ; case 3
	b _02329D88 ; case 4
	b _02329D88 ; case 5
_02329D74:
	bl ov01_0232AABC
	b _02329D9C
_02329D7C:
	mov r1, #1
	str r1, [r0, #0x7c]
	b _02329D9C
_02329D88:
	bl ov01_0232AAEC
	b _02329D9C
_02329D90:
	ldr r0, _02329DA8 ; =ov01_0233C240
	mov r1, #2
	str r1, [r0, #0x7c]
_02329D9C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_02329DA8: .word ov01_0233C240
	arm_func_end ov01_02329D2C

	arm_func_start ov01_02329DAC
ov01_02329DAC: ; 0x02329DAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	mov r4, r0
	cmp r1, #0
	bne _02329E44
	ldr r1, _02329E5C ; =ov01_0233C240
	ldr r0, [r1, #0x78]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02329E50
_02329DDC: ; jump table
	b _02329DF4 ; case 0
	b _02329E00 ; case 1
	b _02329E50 ; case 2
	b _02329E50 ; case 3
	b _02329E10 ; case 4
	b _02329E2C ; case 5
_02329DF4:
	mov r0, #0
	str r0, [r1, #0x7c]
	b _02329E50
_02329E00:
	mov r0, #3
	str r0, [r1, #0x7c]
	bl ov01_0232AA8C
	b _02329E50
_02329E10:
	mov r2, #0
	ldr r0, _02329E60 ; =ov01_0233C0C0
	str r2, [r1, #0x7c]
	ldrh r1, [r0]
	ldr r0, [r0, #0x14]
	bl ov01_023298E8
	b _02329E50
_02329E2C:
	mov r2, #0
	ldr r0, _02329E60 ; =ov01_0233C0C0
	str r2, [r1, #0x7c]
	ldr r0, [r0, #0xc]
	bl ov01_0232999C
	b _02329E50
_02329E44:
	ldr r0, _02329E5C ; =ov01_0233C240
	mov r1, #2
	str r1, [r0, #0x7c]
_02329E50:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_02329E5C: .word ov01_0233C240
_02329E60: .word ov01_0233C0C0
	arm_func_end ov01_02329DAC

	arm_func_start ov01_02329E64
ov01_02329E64: ; 0x02329E64
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	mov r4, r0
	cmp r1, #0
	bne _02329FA8
	ldr r0, _02329FC0 ; =ov01_0233C240
	ldr r0, [r0, #0x78]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02329FB4
_02329E94: ; jump table
	b _02329EAC ; case 0
	b _02329EAC ; case 1
	b _02329FB4 ; case 2
	b _02329FB4 ; case 3
	b _02329EB4 ; case 4
	b _02329F34 ; case 5
_02329EAC:
	bl ov01_0232AB28
	b _02329FB4
_02329EB4:
	bl ov01_0232AB58
	cmp r0, #0
	beq _02329FB4
	ldr r1, _02329FC0 ; =ov01_0233C240
	ldr r0, [r1, #0x68]
	cmp r0, #1
	mov r0, #0
	bne _02329F08
	str r0, [r1, #0x68]
	strh r0, [r1, #6]
	mov r2, #0x65
	strh r2, [r1]
	bl ov01_0232961C
	cmp r0, #0
	bne _02329EF8
	mov r0, #0
	bl ov01_0232961C
_02329EF8:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov01_02329590
	mov r0, #1
_02329F08:
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	bl ov01_02329BC8
	bl ov01_0232AC00
	cmp r0, #0
	bne _02329FB4
	ldr r0, _02329FC0 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _02329FB4
_02329F34:
	bl ov01_0232AB58
	cmp r0, #1
	bne _02329FB4
	ldr r0, _02329FC4 ; =ov01_0233C0C0
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02329F88
	bl ov01_02329C34
	cmp r0, #0
	ldreq r0, _02329FC0 ; =ov01_0233C240
	moveq r1, #2
	streq r1, [r0, #0x7c]
	beq _02329FB4
	bl ov01_0232AC2C
	cmp r0, #0
	bne _02329FB4
	ldr r0, _02329FC0 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _02329FB4
_02329F88:
	bl ov01_0232AC78
	cmp r0, #0
	bne _02329FB4
	ldr r0, _02329FC0 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _02329FB4
_02329FA8:
	ldr r0, _02329FC0 ; =ov01_0233C240
	mov r1, #2
	str r1, [r0, #0x7c]
_02329FB4:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_02329FC0: .word ov01_0233C240
_02329FC4: .word ov01_0233C0C0
	arm_func_end ov01_02329E64

	arm_func_start ov01_02329FC8
ov01_02329FC8: ; 0x02329FC8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A02C
	ldr r0, _0232A044 ; =ov01_0233C240
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0232A038
_02329FF8: ; jump table
	b _0232A010 ; case 0
	b _0232A018 ; case 1
	b _0232A038 ; case 2
	b _0232A038 ; case 3
	b _0232A024 ; case 4
	b _0232A024 ; case 5
_0232A010:
	bl ov01_0232AABC
	b _0232A038
_0232A018:
	mov r1, #1
	str r1, [r0, #0x7c]
	b _0232A038
_0232A024:
	bl ov01_0232AAEC
	b _0232A038
_0232A02C:
	ldr r0, _0232A044 ; =ov01_0233C240
	mov r1, #2
	str r1, [r0, #0x7c]
_0232A038:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232A044: .word ov01_0233C240
	arm_func_end ov01_02329FC8

	arm_func_start ov01_0232A048
ov01_0232A048: ; 0x0232A048
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	cmp r1, #8
	ldreq r1, _0232A074 ; =ov01_0233C240
	moveq r2, #2
	streq r2, [r1, #0x78]
	streq r2, [r1, #0x7c]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232A074: .word ov01_0233C240
	arm_func_end ov01_0232A048

	arm_func_start sub_0232A078
sub_0232A078: ; 0x0232A078
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A174
	ldr r0, _0232A18C ; =ov01_0233C240
	mov r1, #0
	strh r1, [r0, #8]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0232A0B4
	mov r0, r5
	blx r1
_0232A0B4:
	ldr r0, _0232A18C ; =ov01_0233C240
	ldr r0, [r0, #0x78]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0232A180
_0232A0C8: ; jump table
	b _0232A0E0 ; case 0
	b _0232A0E0 ; case 1
	b _0232A180 ; case 2
	b _0232A180 ; case 3
	b _0232A0E8 ; case 4
	b _0232A10C ; case 5
_0232A0E0:
	bl ov01_0232AB28
	b _0232A180
_0232A0E8:
	bl ov01_02329BC8
	bl ov01_0232AC00
	cmp r0, #0
	bne _0232A180
	ldr r0, _0232A18C ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A180
_0232A10C:
	ldr r0, _0232A190 ; =ov01_0233C0C0
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _0232A154
	bl ov01_02329C34
	cmp r0, #0
	ldreq r0, _0232A18C ; =ov01_0233C240
	moveq r1, #2
	streq r1, [r0, #0x7c]
	beq _0232A180
	bl ov01_0232AC2C
	cmp r0, #0
	bne _0232A180
	ldr r0, _0232A18C ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A180
_0232A154:
	bl ov01_0232AC78
	cmp r0, #0
	bne _0232A180
	ldr r0, _0232A18C ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A180
_0232A174:
	ldr r0, _0232A18C ; =ov01_0233C240
	mov r1, #2
	str r1, [r0, #0x7c]
_0232A180:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A18C: .word ov01_0233C240
_0232A190: .word ov01_0233C0C0
	arm_func_end sub_0232A078

	arm_func_start ov01_0232A194
ov01_0232A194: ; 0x0232A194
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A218
	ldr r0, _0232A240 ; =ov01_0233C240
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0232A234
_0232A1C4: ; jump table
	b _0232A1DC ; case 0
	b _0232A1DC ; case 1
	b _0232A234 ; case 2
	b _0232A234 ; case 3
	b _0232A1E4 ; case 4
	b _0232A208 ; case 5
_0232A1DC:
	bl ov01_0232AB88
	b _0232A234
_0232A1E4:
	ldr r0, _0232A244 ; =ov01_0232A24C
	bl WM_StartParent
	cmp r0, #2
	beq _0232A234
	ldr r0, _0232A240 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A234
_0232A208:
	mov r1, #5
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A234
_0232A218:
	ldr r0, _0232A240 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	ldrh r1, [r5, #2]
	ldr r0, _0232A248 ; =ov01_0233C0C0
	str r1, [r0, #4]
	bl ov01_0232AB88
_0232A234:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A240: .word ov01_0233C240
_0232A244: .word ov01_0232A24C
_0232A248: .word ov01_0233C0C0
	arm_func_end ov01_0232A194

	arm_func_start ov01_0232A24C
ov01_0232A24C: ; 0x0232A24C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A35C
	ldrh r0, [r5, #8]
	cmp r0, #7
	bgt _0232A294
	bge _0232A318
	cmp r0, #2
	bgt _0232A36C
	cmp r0, #0
	blt _0232A36C
	beq _0232A2AC
	cmp r0, #2
	b _0232A36C
_0232A294:
	cmp r0, #9
	bgt _0232A2A4
	beq _0232A334
	b _0232A36C
_0232A2A4:
	cmp r0, #0x1a
	b _0232A36C
_0232A2AC:
	ldr r0, _0232A378 ; =ov01_0233C240
	mov r1, #0
	strh r1, [r0, #8]
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0232A36C
_0232A2C8: ; jump table
	b _0232A2E0 ; case 0
	b _0232A2E0 ; case 1
	b _0232A36C ; case 2
	b _0232A36C ; case 3
	b _0232A2E8 ; case 4
	b _0232A308 ; case 5
_0232A2E0:
	bl ov01_0232AB88
	b _0232A36C
_0232A2E8:
	bl ov01_0232ACD8
	cmp r0, #0
	bne _0232A36C
	ldr r0, _0232A378 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A36C
_0232A308:
	mov r1, #5
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A36C
_0232A318:
	ldr r0, _0232A378 ; =ov01_0233C240
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0232A36C
	mov r0, r5
	blx r1
	b _0232A36C
_0232A334:
	ldr r0, _0232A378 ; =ov01_0233C240
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0232A34C
	mov r0, r5
	blx r1
_0232A34C:
	ldr r0, _0232A37C ; =ov01_0233C0C0
	mov r1, #1
	str r1, [r0, #8]
	b _0232A36C
_0232A35C:
	ldr r0, _0232A378 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
_0232A36C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A378: .word ov01_0233C240
_0232A37C: .word ov01_0233C0C0
	arm_func_end ov01_0232A24C

	arm_func_start ov01_0232A380
ov01_0232A380: ; 0x0232A380
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A508
	ldr r1, _0232A524 ; =ov01_0233C240
	ldr r0, [r1, #0x78]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0232A518
_0232A3B0: ; jump table
	b _0232A3C8 ; case 0
	b _0232A3C8 ; case 1
	b _0232A518 ; case 2
	b _0232A518 ; case 3
	b _0232A3D0 ; case 4
	b _0232A3F0 ; case 5
_0232A3C8:
	bl ov01_0232AB88
	b _0232A518
_0232A3D0:
	bl ov01_0232AC58
	cmp r0, #0
	bne _0232A518
	ldr r0, _0232A524 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A518
_0232A3F0:
	ldr r0, _0232A528 ; =ov01_0233C0C0
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _0232A518
	ldrh r0, [r5, #8]
	cmp r0, #4
	beq _0232A4C4
	cmp r0, #5
	bne _0232A4F0
	ldr r0, [r1, #0x6c]
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r1, _0232A524 ; =ov01_0233C240
	ldr r0, [r1, #0x60]
	cmp r0, #0
	ldr r0, [r1, #0x6c]
	beq _0232A458
	bl sub_020851AC
	cmp r0, #0
	ldrne r0, _0232A524 ; =ov01_0233C240
	ldrne r1, [r0, #0x64]
	cmpne r1, #0
	beq _0232A4C4
	ldr r0, [r0, #0x6c]
	blx r1
	b _0232A4C4
_0232A458:
	ldrh r2, [r0, #0x3c]
	cmp r2, #0x10
	blo _0232A4C4
	ldrh r2, [r0, #0x40]
	cmp r2, #1
	ldreq r1, [r1, #0x4c]
	ldreq r2, [r0, #0x44]
	ldreq r1, [r1, #8]
	cmpeq r2, r1
	bne _0232A4C4
	ldrb r1, [r0, #0x4b]
	tst r1, #1
	ldrne r1, _0232A528 ; =ov01_0233C0C0
	ldrne r1, [r1, #0xc]
	cmpne r1, #0
	beq _0232A4C4
	blx r1
	cmp r0, #0
	beq _0232A4C4
	bl ov01_0232AC58
	cmp r0, #0
	bne _0232A518
	ldr r0, _0232A524 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A518
_0232A4C4:
	bl ov01_02329CA8
	cmp r0, #0
	beq _0232A518
	bl ov01_0232AC2C
	cmp r0, #0
	bne _0232A518
	ldr r0, _0232A524 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A518
_0232A4F0:
	mov r0, #3
	str r0, [r1, #0x7c]
	mov r0, #0
	str r0, [r1, #0x78]
	bl ov01_0232AB88
	b _0232A518
_0232A508:
	ldr r0, _0232A524 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
_0232A518:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A524: .word ov01_0233C240
_0232A528: .word ov01_0233C0C0
	arm_func_end ov01_0232A380

	arm_func_start ov01_0232A52C
ov01_0232A52C: ; 0x0232A52C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldrh r1, [r4, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A5C0
	ldr r0, _0232A5DC ; =ov01_0233C240
	ldr r0, [r0, #0x78]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0232A5D0
_0232A55C: ; jump table
	b _0232A574 ; case 0
	b _0232A574 ; case 1
	b _0232A5D0 ; case 2
	b _0232A5D0 ; case 3
	b _0232A57C ; case 4
	b _0232A5A0 ; case 5
_0232A574:
	bl ov01_0232AB28
	b _0232A5D0
_0232A57C:
	bl ov01_02329BC8
	bl ov01_0232AC00
	cmp r0, #0
	bne _0232A5D0
	ldr r0, _0232A5DC ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A5D0
_0232A5A0:
	bl ov01_0232AC78
	cmp r0, #0
	bne _0232A5D0
	ldr r0, _0232A5DC ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A5D0
_0232A5C0:
	ldr r0, _0232A5DC ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
_0232A5D0:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232A5DC: .word ov01_0233C240
	arm_func_end ov01_0232A52C

	arm_func_start ov01_0232A5E0
ov01_0232A5E0: ; 0x0232A5E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A6E8
	ldr r0, _0232A748 ; =ov01_0233C240
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0232A73C
_0232A610: ; jump table
	b _0232A628 ; case 0
	b _0232A628 ; case 1
	b _0232A73C ; case 2
	b _0232A73C ; case 3
	b _0232A628 ; case 4
	b _0232A63C ; case 5
_0232A628:
	ldr r0, [r0, #0x7c]
	cmp r0, #3
	beq _0232A73C
	bl ov01_0232AB88
	b _0232A73C
_0232A63C:
	ldrh r2, [r5, #8]
	cmp r2, #9
	bgt _0232A664
	subs r1, r2, #6
	addpl pc, pc, r1, lsl #2
	b _0232A6CC
_0232A654: ; jump table
	b _0232A73C ; case 0
	b _0232A670 ; case 1
	b _0232A73C ; case 2
	b _0232A6A4 ; case 3
_0232A664:
	cmp r2, #0x1a
	beq _0232A73C
	b _0232A6CC
_0232A670:
	ldrh r1, [r5, #0xa]
	strh r1, [r0, #8]
	ldr r0, [r0, #0x7c]
	cmp r0, #5
	beq _0232A73C
	bl ov01_0232ACD8
	cmp r0, #0
	bne _0232A73C
	ldr r0, _0232A748 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A73C
_0232A6A4:
	mov r1, #0
	str r1, [r0, #0x78]
	ldr r0, [r0, #0x7c]
	cmp r0, #3
	beq _0232A6BC
	bl ov01_0232AB88
_0232A6BC:
	ldr r0, _0232A74C ; =ov01_0233C0C0
	mov r1, #1
	str r1, [r0, #8]
	b _0232A73C
_0232A6CC:
	ldr r0, _0232A748 ; =ov01_0233C240
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A73C
_0232A6E8:
	cmp r1, #0xb
	bne _0232A708
	ldr r0, _0232A748 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	ldrh r1, [r5, #2]
	ldr r0, _0232A74C ; =ov01_0233C0C0
	str r1, [r0, #4]
_0232A708:
	ldrh r0, [r5, #2]
	cmp r0, #0xc
	ldreq r0, _0232A748 ; =ov01_0233C240
	moveq r1, #5
	streq r1, [r0, #0x78]
	beq _0232A738
	ldr r0, _0232A748 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	ldrh r1, [r5, #2]
	ldr r0, _0232A74C ; =ov01_0233C0C0
	str r1, [r0, #4]
_0232A738:
	bl ov01_0232AB88
_0232A73C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A748: .word ov01_0233C240
_0232A74C: .word ov01_0233C0C0
	arm_func_end ov01_0232A5E0

	arm_func_start ov01_0232A750
ov01_0232A750: ; 0x0232A750
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	bl EnableIrqFlag
	ldrh r1, [r6, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A87C
	ldrh r0, [r6, #4]
	mov r5, #0
	cmp r0, #0xa
	beq _0232A78C
	cmp r0, #0xb
	cmpne r0, #0xc
	b _0232A8A4
_0232A78C:
	ldr r0, _0232A8B4 ; =ov01_0233C240
	ldr r1, [r0, #0x78]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0232A8A4
_0232A7A0: ; jump table
	b _0232A7B8 ; case 0
	b _0232A7B8 ; case 1
	b _0232A8A4 ; case 2
	b _0232A8A4 ; case 3
	b _0232A7C0 ; case 4
	b _0232A7C0 ; case 5
_0232A7B8:
	bl ov01_0232AB88
	b _0232A8A4
_0232A7C0:
	ldr r1, [r0, #0x30]
	cmp r1, #0
	beq _0232A844
	ldr r3, [r0, #0x4c]
	ldrh r0, [r0, #4]
	ldrh r1, [r3, #0x10]
	mov ip, #1
	cmp r0, #1
	add r0, r1, #1
	mov r0, ip, lsl r0
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	movhi ip, r5
	mov r2, r0, lsr #0x10
	str ip, [sp]
	ldr r0, _0232A8B4 ; =ov01_0233C240
	ldrh r3, [r3, #0x36]
	ldr r0, [r0, #0x50]
	mov r1, #0xc
	bl WM_StartDataSharing
	cmp r0, #0
	movne r1, #0
	ldreq r0, _0232A8B4 ; =ov01_0233C240
	moveq r1, #1
	streq r1, [r0, #0x14]
	cmp r1, #0
	movne r5, #1
	bne _0232A848
	ldr r0, _0232A8B4 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
	b _0232A848
_0232A844:
	mov r5, #1
_0232A848:
	cmp r5, #0
	beq _0232A8A4
	ldr r0, _0232A8B4 ; =ov01_0233C240
	mov r1, #1
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x78]
	str r1, [r0, #0x7c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0232A8A4
	mov r0, r6
	blx r1
	b _0232A8A4
_0232A87C:
	cmp r1, #9
	cmpne r1, #0xd
	cmpne r1, #0xf
	beq _0232A8A4
	ldr r0, _0232A8B4 ; =ov01_0233C240
	mov r1, #3
	str r1, [r0, #0x7c]
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
_0232A8A4:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232A8B4: .word ov01_0233C240
	arm_func_end ov01_0232A750

	arm_func_start ov01_0232A8B8
ov01_0232A8B8: ; 0x0232A8B8
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0232A8D8 ; =ov01_0232A8DC
	bl WM_SetEntry
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A8D8: .word ov01_0232A8DC
	arm_func_end ov01_0232A8B8

	arm_func_start ov01_0232A8DC
ov01_0232A8DC: ; 0x0232A8DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232A914
	ldr r0, _0232A930 ; =ov01_0233C240
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0232A924
	mov r0, r5
	blx r1
	b _0232A924
_0232A914:
	ldr r0, _0232A930 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x78]
	bl ov01_0232AB88
_0232A924:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A930: .word ov01_0233C240
	arm_func_end ov01_0232A8DC

	arm_func_start ov01_0232A934
ov01_0232A934: ; 0x0232A934
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0232A970 ; =ov01_0233C240
	mov r2, #1
	str r2, [r1, #0x74]
	ldr r1, [r1, #0x18]
	mov r4, r0
	cmp r1, #0
	beq _0232A964
	mov r0, r5
	blx r1
_0232A964:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A970: .word ov01_0233C240
	arm_func_end ov01_0232A934

	arm_func_start ov01_0232A974
ov01_0232A974: ; 0x0232A974
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldrh r1, [r5, #2]
	mov r4, r0
	cmp r1, #0
	bne _0232AA7C
	ldrh r0, [r5, #4]
	cmp r0, #0x15
	bgt _0232A9C0
	bge _0232A9C8
	cmp r0, #9
	bgt _0232AA7C
	cmp r0, #7
	blt _0232AA7C
	beq _0232AA7C
	cmp r0, #9
	beq _0232AA24
	b _0232AA7C
_0232A9C0:
	cmp r0, #0x1a
	b _0232AA7C
_0232A9C8:
	ldr r0, _0232AA88 ; =ov01_0233C240
	ldr r1, [r0, #0x7c]
	cmp r1, #4
	beq _0232A9E4
	cmp r1, #5
	beq _0232AA04
	b _0232AA7C
_0232A9E4:
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0232AA7C
	ldrh r0, [r5, #0x12]
	ldrh r2, [r5, #0x10]
	ldr r1, [r5, #0xc]
	blx r3
	b _0232AA7C
_0232AA04:
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0232AA7C
	ldrh r2, [r5, #0x10]
	ldr r1, [r5, #0xc]
	mov r0, #0
	blx r3
	b _0232AA7C
_0232AA24:
	ldr r0, _0232AA88 ; =ov01_0233C240
	ldr r1, [r0, #0x7c]
	cmp r1, #4
	beq _0232AA40
	cmp r1, #5
	beq _0232AA60
	b _0232AA7C
_0232AA40:
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0232AA7C
	ldrh r0, [r5, #0x12]
	mov r1, #0
	mov r2, r1
	blx r3
	b _0232AA7C
_0232AA60:
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0232AA7C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
_0232AA7C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232AA88: .word ov01_0233C240
	arm_func_end ov01_0232A974

	arm_func_start ov01_0232AA8C
ov01_0232AA8C: ; 0x0232AA8C
	stmdb sp!, {r3, lr}
	ldr r0, _0232AAB4 ; =ov01_02329D2C
	bl WM_Enable
	cmp r0, #2
	ldrne r0, _0232AAB8 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AAB4: .word ov01_02329D2C
_0232AAB8: .word ov01_0233C240
	arm_func_end ov01_0232AA8C

	arm_func_start ov01_0232AABC
ov01_0232AABC: ; 0x0232AABC
	stmdb sp!, {r3, lr}
	ldr r0, _0232AAE4 ; =ov01_02329DAC
	bl WM_Disable
	cmp r0, #2
	ldrne r0, _0232AAE8 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AAE4: .word ov01_02329DAC
_0232AAE8: .word ov01_0233C240
	arm_func_end ov01_0232AABC

	arm_func_start ov01_0232AAEC
ov01_0232AAEC: ; 0x0232AAEC
	stmdb sp!, {r3, lr}
	ldr r1, _0232AB20 ; =ov01_0233C240
	mov r2, #1
	ldr r0, _0232AB24 ; =ov01_02329E64
	str r2, [r1, #0x68]
	bl WM_PowerOn
	cmp r0, #2
	ldrne r0, _0232AB20 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AB20: .word ov01_0233C240
_0232AB24: .word ov01_02329E64
	arm_func_end ov01_0232AAEC

	arm_func_start ov01_0232AB28
ov01_0232AB28: ; 0x0232AB28
	stmdb sp!, {r3, lr}
	ldr r0, _0232AB50 ; =ov01_02329FC8
	bl WM_PowerOff
	cmp r0, #2
	ldrne r0, _0232AB54 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AB50: .word ov01_02329FC8
_0232AB54: .word ov01_0233C240
	arm_func_end ov01_0232AB28

	arm_func_start ov01_0232AB58
ov01_0232AB58: ; 0x0232AB58
	stmdb sp!, {r3, lr}
	ldr r0, _0232AB80 ; =ov01_0232A048
	bl WM_SetIndCallback
	cmp r0, #0
	ldrne r0, _0232AB84 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AB80: .word ov01_0232A048
_0232AB84: .word ov01_0233C240
	arm_func_end ov01_0232AB58

	arm_func_start ov01_0232AB88
ov01_0232AB88: ; 0x0232AB88
	stmdb sp!, {r3, lr}
	ldr r0, _0232ABF8 ; =ov01_0233C240
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0232ABBC
	ldr r0, [r0, #0x50]
	bl WM_EndDataSharing__022C1278
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0232ABF8 ; =ov01_0233C240
	mov r1, #0
	str r1, [r0, #0x14]
_0232ABBC:
	ldr r0, _0232ABF8 ; =ov01_0233C240
	ldr r1, [r0, #0x7c]
	cmp r1, #3
	cmpne r1, #2
	movne r1, #3
	strne r1, [r0, #0x7c]
	ldr r0, _0232ABFC ; =sub_0232A078
	bl WM_Reset
	cmp r0, #2
	ldrne r0, _0232ABF8 ; =ov01_0233C240
	movne r1, #2
	strne r1, [r0, #0x7c]
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232ABF8: .word ov01_0233C240
_0232ABFC: .word sub_0232A078
	arm_func_end ov01_0232AB88

	arm_func_start ov01_0232AC00
ov01_0232AC00: ; 0x0232AC00
	stmdb sp!, {r3, lr}
	ldr r1, _0232AC24 ; =ov01_0233C240
	ldr r0, _0232AC28 ; =ov01_0232A194
	ldr r1, [r1, #0x20]
	bl WM_SetParentParameter
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AC24: .word ov01_0233C240
_0232AC28: .word ov01_0232A194
	arm_func_end ov01_0232AC00

	arm_func_start ov01_0232AC2C
ov01_0232AC2C: ; 0x0232AC2C
	stmdb sp!, {r3, lr}
	ldr r1, _0232AC50 ; =ov01_0233C240
	ldr r0, _0232AC54 ; =ov01_0232A380
	ldr r1, [r1, #0x28]
	bl WM_StartScan
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AC50: .word ov01_0233C240
_0232AC54: .word ov01_0232A380
	arm_func_end ov01_0232AC2C

	arm_func_start ov01_0232AC58
ov01_0232AC58: ; 0x0232AC58
	stmdb sp!, {r3, lr}
	ldr r0, _0232AC74 ; =ov01_0232A52C
	bl WM_EndScan
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AC74: .word ov01_0232A52C
	arm_func_end ov01_0232AC58

	arm_func_start ov01_0232AC78
ov01_0232AC78: ; 0x0232AC78
	stmdb sp!, {r3, lr}
	ldr r0, _0232ACCC ; =ov01_0233C0C0
	mov r2, #0
	ldr r1, [r0, #0x10]
	mov r3, #1
	cmp r1, #0
	bne _0232ACAC
	ldr r0, _0232ACD0 ; =ov01_0233C240
	str r2, [sp]
	ldr r1, [r0, #0x6c]
	ldr r0, _0232ACD4 ; =ov01_0232A5E0
	bl WM_StartConnectEx
	b _0232ACBC
_0232ACAC:
	str r2, [sp]
	ldr r1, [r0, #0x10]
	ldr r0, _0232ACD4 ; =ov01_0232A5E0
	bl WM_StartConnectEx
_0232ACBC:
	cmp r0, #2
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232ACCC: .word ov01_0233C0C0
_0232ACD0: .word ov01_0233C240
_0232ACD4: .word ov01_0232A5E0
	arm_func_end ov01_0232AC78

	arm_func_start ov01_0232ACD8
ov01_0232ACD8: ; 0x0232ACD8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _0232AD54 ; =ov01_0233C240
	ldr r0, [r0, #0x30]
	cmp r0, #0
	bne _0232AD0C
	ldr r1, _0232AD58 ; =ov01_0232A974
	mov r0, #0xd
	mov r2, #0
	bl WM_SetPortCallback
	cmp r0, #0
	movne r0, #0
	bne _0232AD4C
_0232AD0C:
	ldr r3, _0232AD54 ; =ov01_0233C240
	mov r2, #1
	ldr r1, [r3, #0x34]
	ldr r0, _0232AD5C ; =ov01_0232A750
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	stmia sp, {r1, r2}
	ldr r2, [r3, #0x44]
	ldr r1, [r3, #0x48]
	mov r2, r2, lsl #0x10
	ldr r3, [r3, #0x3c]
	mov r2, r2, lsr #0x10
	bl WM_StartMP
	cmp r0, #2
	movne r0, #0
	moveq r0, #1
_0232AD4C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232AD54: .word ov01_0233C240
_0232AD58: .word ov01_0232A974
_0232AD5C: .word ov01_0232A750
	arm_func_end ov01_0232ACD8

	arm_func_start ov01_0232AD60
ov01_0232AD60: ; 0x0232AD60
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r3, _0232ADB4 ; =0x0000FFFF
	mov r2, r0
	str r3, [sp]
	mov ip, #0xd
	mov r3, r1
	str ip, [sp, #4]
	mov ip, #2
	ldr r0, _0232ADB8 ; =ov01_0232A934
	mov r1, #0
	str ip, [sp, #8]
	bl WM_SetMpDataToPortEx
	cmp r0, #2
	ldrne r0, _0232ADBC ; =ov01_0233C240
	movne r1, #1
	strne r1, [r0, #0x74]
	movne r0, #0
	moveq r0, #1
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0232ADB4: .word 0x0000FFFF
_0232ADB8: .word ov01_0232A934
_0232ADBC: .word ov01_0233C240
	arm_func_end ov01_0232AD60

	arm_func_start ov01_0232ADC0
ov01_0232ADC0: ; 0x0232ADC0
#ifdef EUROPE
#define OV01_0232ADC0_LOAD_OFFSET #4
#else
#define OV01_0232ADC0_LOAD_OFFSET #0
#endif
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x160
	mov r1, #0
	bl MemAlloc
	ldr r2, _0232AEC0 ; =ov01_0233C0D8
	mov r1, #0x160
	str r0, [r2, OV01_0232ADC0_LOAD_OFFSET]
	bl MemZero
	ldr r0, _0232AEC4 ; =ov01_0233C580
	mov r1, #0x200
	bl MemZero
	ldr r0, _0232AEC8 ; =ov01_0233C380
	mov r1, #0x200
	bl MemZero
	ldr r2, _0232AEC0 ; =ov01_0233C0D8
	mov r3, #1
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	mov r0, #0
	add r1, r1, #0x100
	strh r3, [r1, #0x10]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	mov lr, #0x10
	str r0, [r1, #0x50]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	mov ip, #0x1e0
	str r0, [r1, #0x90]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	ldr r3, _0232AECC ; =0x00000708
	str r0, [r1, #0xd0]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str r0, [r1, #0x14c]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str lr, [r1, #0x150]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str r0, [r1, #0x138]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str r0, [r1, #0x148]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str ip, [r1, #0x13c]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	str r3, [r1, #0x140]
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	mov r3, r0
	str r0, [r1, #0x158]
	b _0232AE88
_0232AE78:
	ldr r1, [r2, OV01_0232ADC0_LOAD_OFFSET]
	add r1, r1, r0, lsl #2
	str r3, [r1, #0x114]
	add r0, r0, #1
_0232AE88:
	cmp r0, #4
	blt _0232AE78
	bl ov01_0232C0CC
	bl ov01_0232C2E4
	mov r0, r4
	bl ov01_0232C0A0
	ldr r2, _0232AED0 ; =ov01_0233C100
	mov r1, #0
	str r0, [r2, #8]
	mov r0, r2
	mov r2, r1
	mov r3, #1
	bl ov01_0232965C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232AEC0: .word ov01_0233C0D8
_0232AEC4: .word ov01_0233C580
_0232AEC8: .word ov01_0233C380
_0232AECC: .word 0x00000708
_0232AED0: .word ov01_0233C100
	arm_func_end ov01_0232ADC0

	arm_func_start ov01_0232AED4
ov01_0232AED4: ; 0x0232AED4
	stmdb sp!, {r4, lr}
	ldr r1, _0232AF38 ; =ov01_0233C0D8
	mov r4, r0
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	ldr r0, _0232AF3C ; =ov01_0232B600
	str r4, [r1, #0x18]
	bl ov01_02329BB8
	cmp r4, #0
	bne _0232AF14
	ldr r2, _0232AF40 ; =ov01_0232B9E8
	mov r0, #0x100
	mov r1, #0x20
	bl Wbt_InitParent
	ldr r0, _0232AF44 ; =ov01_0232B8D0
	bl ov01_02329BA8
	b _0232AF24
_0232AF14:
	ldr r0, _0232AF40 ; =ov01_0232B9E8
	bl Wbt_InitChild
	ldr r0, _0232AF48 ; =ov01_0232B960
	bl ov01_02329BA8
_0232AF24:
	ldr r0, _0232AF38 ; =ov01_0233C0D8
	mov r1, #1
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	strb r1, [r0, #0x15e]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232AF38: .word ov01_0233C0D8
_0232AF3C: .word ov01_0232B600
_0232AF40: .word ov01_0232B9E8
_0232AF44: .word ov01_0232B8D0
_0232AF48: .word ov01_0232B960
	arm_func_end ov01_0232AED4

	arm_func_start ov01_0232AF4C
ov01_0232AF4C: ; 0x0232AF4C
	stmdb sp!, {r3, lr}
	bl ov01_02329B18
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0232AFA8
_0232AF60: ; jump table
	b _0232AF78 ; case 0
	b _0232AF80 ; case 1
	b _0232AF88 ; case 2
	b _0232AF90 ; case 3
	b _0232AF98 ; case 4
	b _0232AFA0 ; case 5
_0232AF78:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0232AF80:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0232AF88:
	mov r0, #2
	ldmia sp!, {r3, pc}
_0232AF90:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0232AF98:
	mov r0, #4
	ldmia sp!, {r3, pc}
_0232AFA0:
	mov r0, #5
	ldmia sp!, {r3, pc}
_0232AFA8:
	mov r0, #2
	ldmia sp!, {r3, pc}
	arm_func_end ov01_0232AF4C

	arm_func_start ov01_0232AFB0
ov01_0232AFB0: ; 0x0232AFB0
	ldr r0, _0232AFC0 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_0232AFC0: .word ov01_0233C0D8
	arm_func_end ov01_0232AFB0

	arm_func_start ov01_0232AFC4
ov01_0232AFC4: ; 0x0232AFC4
#ifdef EUROPE
#define OV01_0232AFC4_LOAD_OFFSET #4
#else
#define OV01_0232AFC4_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232B008 ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232AFC4_LOAD_OFFSET]
	ldr r0, [r0, #0x18]
	cmp r0, #1
	bne _0232AFF8
	bl ov01_02329520
	cmp r0, #0
	ldrne r1, _0232B008 ; =ov01_0233C0D8
	movne r0, #1
	ldrne r1, [r1, OV01_0232AFC4_LOAD_OFFSET]
	strneb r0, [r1, #0x11]
	ldmneia sp!, {r3, pc}
_0232AFF8:
	ldr r0, _0232B008 ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232AFC4_LOAD_OFFSET]
	ldrb r0, [r0, #0x11]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B008: .word ov01_0233C0D8
	arm_func_end ov01_0232AFC4

	arm_func_start ov01_0232B00C
ov01_0232B00C: ; 0x0232B00C
	ldr r0, _0232B01C ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	ldrb r0, [r0, #0x13]
	bx lr
	.align 2, 0
_0232B01C: .word ov01_0233C0D8
	arm_func_end ov01_0232B00C

	arm_func_start ov01_0232B020
ov01_0232B020: ; 0x0232B020
	ldr r1, _0232B03C ; =ov01_0233C0D8
	mov r3, #0
#ifdef EUROPE
	ldr r2, [r1, #4]
	strb r3, [r2, #0xe]
	ldr r1, [r1, #4]
#else
	ldr r2, [r1]
	strb r3, [r2, #0xe]
	ldr r1, [r1]
#endif
	str r0, [r1, #0x13c]
	bx lr
	.align 2, 0
_0232B03C: .word ov01_0233C0D8
	arm_func_end ov01_0232B020

	arm_func_start ov01_0232B040
ov01_0232B040: ; 0x0232B040
	stmdb sp!, {r3, lr}
	ldr r1, _0232B064 ; =ov01_0233C0D8
	mov r2, #0
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	cmp r0, #0
	strb r2, [r1, #0x11]
	ldmeqia sp!, {r3, pc}
	bl ov01_02329530
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B064: .word ov01_0233C0D8
	arm_func_end ov01_0232B040

	arm_func_start ov01_0232B068
ov01_0232B068: ; 0x0232B068
	ldr r0, _0232B07C ; =ov01_0233C0D8
	mov r1, #0
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	strb r1, [r0, #0x13]
	bx lr
	.align 2, 0
_0232B07C: .word ov01_0233C0D8
	arm_func_end ov01_0232B068

	arm_func_start ov01_0232B080
ov01_0232B080: ; 0x0232B080
#ifdef EUROPE
#define OV01_0232B080_LOAD_OFFSET #4
#else
#define OV01_0232B080_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232B120 ; =ov01_0233C0D8
	mov r2, #0
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #8]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #9]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xa]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xb]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xc]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xd]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xe]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0xf]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0x10]
	ldr r0, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r0, #0x11]
	bl ov01_02329530
	ldr r0, _0232B120 ; =ov01_0233C0D8
	mov r2, #0
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0x12]
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0x13]
	ldr r0, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r0, #0x14]
	bl ov01_0232957C
	ldr r0, _0232B120 ; =ov01_0233C0D8
	mov r2, #0
	ldr r1, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r1, #0x15]
	ldr r0, [r0, OV01_0232B080_LOAD_OFFSET]
	strb r2, [r0, #0x16]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B120: .word ov01_0233C0D8
	arm_func_end ov01_0232B080

	arm_func_start ov01_0232B124
ov01_0232B124: ; 0x0232B124
#ifdef EUROPE
#define OV01_0232B124_LOAD_OFFSET #4
#else
#define OV01_0232B124_LOAD_OFFSET #0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #2
	mov r5, r1
	mov r4, r2
	bl ov01_0232C1D8
	ldr r0, _0232B188 ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232B124_LOAD_OFFSET]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0232B160
	mov r0, r6
	mov r1, r5
	bl ov01_023298E8
	b _0232B168
_0232B160:
	mov r0, r4
	bl ov01_0232999C
_0232B168:
	ldr r0, _0232B188 ; =ov01_0233C0D8
	mov r3, #1
	ldr r2, [r0, OV01_0232B124_LOAD_OFFSET]
	mov r1, #0x3c
	strb r3, [r2, #0x10]
	ldr r0, [r0, OV01_0232B124_LOAD_OFFSET]
	str r1, [r0, #0x144]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B188: .word ov01_0233C0D8
	arm_func_end ov01_0232B124

	arm_func_start ov01_0232B18C
ov01_0232B18C: ; 0x0232B18C
	stmdb sp!, {r3, lr}
	ldr r0, _0232B200 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r0, #4]
#else
	ldr r1, [r0]
#endif
	ldrb r0, [r1, #0x15e]
	cmp r0, #0
	beq _0232B1E8
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _0232B1C8
	ldr r0, _0232B204 ; =ov01_0233C380
	mov r1, #0x100
	bl Wbt_MpParentSendHook
	ldr r0, _0232B208 ; =0x0000FFFF
	bl Wbt_CancelCurrentCommand
	b _0232B1DC
_0232B1C8:
	ldr r0, _0232B204 ; =ov01_0233C380
	mov r1, #0x20
	bl Wbt_MpChildSendHook
	mov r0, #1
	bl Wbt_CancelCurrentCommand
_0232B1DC:
	ldr r0, _0232B20C ; =0x0000044C
	bl Wbt_UnregisterBlock
	bl Wbt_End
_0232B1E8:
	ldr r0, _0232B200 ; =ov01_0233C0D8
	mov r1, #0
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	strb r1, [r0, #0x15e]
	bl ov01_02329AA8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B200: .word ov01_0233C0D8
_0232B204: .word ov01_0233C380
_0232B208: .word 0x0000FFFF
_0232B20C: .word 0x0000044C
	arm_func_end ov01_0232B18C

	arm_func_start ov01_0232B210
ov01_0232B210: ; 0x0232B210
	stmdb sp!, {r4, lr}
	ldr r1, _0232B264 ; =ov01_0233C0D8
	mov r4, r0
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	ldrb r0, [r1, #0x15e]
	cmp r0, #0
	beq _0232B24C
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _0232B244
	ldr r0, _0232B268 ; =0x0000FFFF
	bl Wbt_CancelCurrentCommand
	b _0232B24C
_0232B244:
	mov r0, #1
	bl Wbt_CancelCurrentCommand
_0232B24C:
	cmp r4, #0
	beq _0232B25C
	bl ov01_02329544
	ldmia sp!, {r4, pc}
_0232B25C:
	bl ov01_02329A38
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232B264: .word ov01_0233C0D8
_0232B268: .word 0x0000FFFF
	arm_func_end ov01_0232B210

	arm_func_start ov01_0232B26C
ov01_0232B26C: ; 0x0232B26C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x7d0
	add r0, sp, #0
	bl WM_ReadStatus
	ldr r0, _0232B2C8 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldreqh r0, [sp]
	cmpeq r0, #9
	beq _0232B2B4
	ldr r0, _0232B2C8 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	ldr r0, [r0, #0x18]
	cmp r0, #1
	ldreqh r0, [sp]
	cmpeq r0, #5
	bne _0232B2BC
_0232B2B4:
	mov r0, #1
	b _0232B2C0
_0232B2BC:
	mov r0, #0
_0232B2C0:
	add sp, sp, #0x7d0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B2C8: .word ov01_0233C0D8
	arm_func_end ov01_0232B26C

	arm_func_start ov01_0232B2CC
ov01_0232B2CC: ; 0x0232B2CC
#ifdef EUROPE
#define OV01_0232B2CC_LOAD_OFFSET #4
#else
#define OV01_0232B2CC_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232B370 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B2CC_LOAD_OFFSET]
	ldrb r0, [r1, #0x15e]
	cmp r0, #0
	beq _0232B30C
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _0232B300
	ldr r0, _0232B374 ; =ov01_0233C380
	mov r1, #0x100
	bl Wbt_MpParentSendHook
	b _0232B30C
_0232B300:
	ldr r0, _0232B374 ; =ov01_0233C380
	mov r1, #0x20
	bl Wbt_MpChildSendHook
_0232B30C:
	bl ov01_02329544
	ldr r0, _0232B370 ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232B2CC_LOAD_OFFSET]
	ldrb r0, [r0, #0x15e]
	cmp r0, #0
	beq _0232B338
	ldr r0, _0232B378 ; =0x0000FFFF
	bl Wbt_CancelCurrentCommand
	ldr r0, _0232B37C ; =0x0000044C
	bl Wbt_UnregisterBlock
	bl Wbt_End
_0232B338:
	ldr r0, _0232B370 ; =ov01_0233C0D8
	mov r1, #0
	ldr r0, [r0, OV01_0232B2CC_LOAD_OFFSET]
	strb r1, [r0, #0x15e]
	bl ov01_02329830
	bl ov01_0232C370
	bl ov01_0232C10C
	ldr r0, _0232B370 ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232B2CC_LOAD_OFFSET]
	bl MemFree
	ldr r0, _0232B370 ; =ov01_0233C0D8
	mov r1, #0
	str r1, [r0, OV01_0232B2CC_LOAD_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B370: .word ov01_0233C0D8
_0232B374: .word ov01_0233C380
_0232B378: .word 0x0000FFFF
_0232B37C: .word 0x0000044C
	arm_func_end ov01_0232B2CC

	arm_func_start ov01_0232B380
ov01_0232B380: ; 0x0232B380
	stmdb sp!, {r3, lr}
	bl WM_GetLinkLevel
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0232B3C4
_0232B394: ; jump table
	b _0232B3A4 ; case 0
	b _0232B3AC ; case 1
	b _0232B3B4 ; case 2
	b _0232B3BC ; case 3
_0232B3A4:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0232B3AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0232B3B4:
	mov r0, #2
	ldmia sp!, {r3, pc}
_0232B3BC:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0232B3C4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov01_0232B380

	arm_func_start ov01_0232B3CC
ov01_0232B3CC: ; 0x0232B3CC
#ifdef EUROPE
#define OV01_0232B3CC_LOAD_OFFSET #4
#else
#define OV01_0232B3CC_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232B41C ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232B3CC_LOAD_OFFSET]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_0232B380
	ldr r1, _0232B41C ; =ov01_0233C0D8
	ldr r2, [r1, OV01_0232B3CC_LOAD_OFFSET]
	str r0, [r2, #0x14c]
	ldr r0, [r1, OV01_0232B3CC_LOAD_OFFSET]
	ldr r0, [r0, #0x14c]
	add r0, r0, #2
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov01_0232C1D8
	mov r0, #0
	mov r1, r0
	bl ov01_0232C454
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B41C: .word ov01_0233C0D8
	arm_func_end ov01_0232B3CC

	arm_func_start ov01_0232B420
ov01_0232B420: ; 0x0232B420
#ifdef EUROPE
#define OV01_0232B420_LOAD_OFFSET #4
#else
#define OV01_0232B420_LOAD_OFFSET #0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	movs r5, r2
	cmpeq r0, #0
	mov r4, r3
	moveq r0, #0
	beq _0232B528
	cmp r4, #0
	cmple r1, #0
	movle r0, #0
	ble _0232B528
	cmp r1, #0
	ble _0232B498
	ldr ip, _0232B530 ; =ov01_0233C0D8
	mov lr, #0
	ldr r3, [ip, OV01_0232B420_LOAD_OFFSET]
	ldr r2, _0232B534 ; =ov01_0233AE78
	str r0, [r3]
	ldr r6, [ip, OV01_0232B420_LOAD_OFFSET]
	mov r3, r0
	add r0, r6, #0x100
	strh r1, [r0, #0x30]
	stmia sp, {r1, lr}
	ldr r0, [ip, OV01_0232B420_LOAD_OFFSET]
	ldr r1, _0232B538 ; =0x0000044C
	add r0, r0, #0x1c
	bl Wbt_RegisterBlock
	tst r0, #0xff
	moveq r0, #0
	beq _0232B528
_0232B498:
	cmp r4, #0
	ble _0232B4B8
	ldr r0, _0232B530 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B420_LOAD_OFFSET]
	str r5, [r1, #4]
	ldr r0, [r0, OV01_0232B420_LOAD_OFFSET]
	add r0, r0, #0x100
	strh r4, [r0, #0x32]
_0232B4B8:
	ldr r0, _0232B530 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B420_LOAD_OFFSET]
	ldr r0, [r1, #0x18]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0xb]
	beq _0232B528
	bl ov01_02329B28
	bl Wbt_SetOwnAid
	ldr r0, _0232B530 ; =ov01_0233C0D8
	ldr r1, _0232B53C ; =ov01_0232B9E8
	ldr r0, [r0, OV01_0232B420_LOAD_OFFSET]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x10]
	bl Wbt_RequestSync
	cmp r0, #0
	beq _0232B518
	ldr r0, _0232B530 ; =ov01_0233C0D8
	mov r1, #1
	ldr r0, [r0, OV01_0232B420_LOAD_OFFSET]
	strb r1, [r0, #0xb]
	bl ov01_0232BD98
	mov r0, #1
	b _0232B528
_0232B518:
	mov r0, #1
	bl Wbt_CancelCurrentCommand
	bl Wbt_PrintBtList
	mov r0, #0
_0232B528:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B530: .word ov01_0233C0D8
_0232B534: .word ov01_0233AE78
_0232B538: .word 0x0000044C
_0232B53C: .word ov01_0232B9E8
	arm_func_end ov01_0232B420

	arm_func_start ov01_0232B540
ov01_0232B540: ; 0x0232B540
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	cmp r5, #4
	mov r0, #0
	bhs _0232B5C0
	ldr r1, _0232B5C8 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r3, [r1, #4]
#else
	ldr r3, [r1]
#endif
	ldrb r1, [r3, #0xb]
	cmp r1, #0
	beq _0232B5C0
	ldrb r1, [r3, #0x13]
	cmp r1, #0
	bne _0232B5C0
	cmp r4, #8
	bhi _0232B5C0
	mov r1, r2
	add r0, sp, #1
	mov r2, r4
	bl MemcpySimple
	ldr r0, _0232B5C8 ; =ov01_0233C0D8
	add r1, r5, #1
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	strb r1, [sp]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x10]
	ldr r3, _0232B5CC ; =ov01_0232B8A8
	add r1, sp, #0
	add r2, r4, #1
	bl Wbt_PutUserData
	and r0, r0, #0xff
_0232B5C0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0232B5C8: .word ov01_0233C0D8
_0232B5CC: .word ov01_0232B8A8
	arm_func_end ov01_0232B540

	arm_func_start ov01_0232B5D0
ov01_0232B5D0: ; 0x0232B5D0
	ldr r2, _0232B5FC ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r2, [r2, #4]
#else
	ldr r2, [r2]
#endif
	cmp r2, #0
	beq _0232B5F4
	cmp r0, #4
	addlo r0, r2, r0, lsl #2
	strlo r1, [r0, #0x114]
	movlo r0, #1
	bxlo lr
_0232B5F4:
	mov r0, #0
	bx lr
	.align 2, 0
_0232B5FC: .word ov01_0233C0D8
	arm_func_end ov01_0232B5D0

	arm_func_start ov01_0232B600
ov01_0232B600: ; 0x0232B600
#ifdef EUROPE
#define OV01_0232B600_LOAD_OFFSET #4
#else
#define OV01_0232B600_LOAD_OFFSET #0
#endif
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov01_02329B18
	ldr r1, _0232B8A0 ; =ov01_0233C0D8
	ldr r3, [r1, OV01_0232B600_LOAD_OFFSET]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	ldrh r2, [r4]
	cmp r2, #0xf
	bgt _0232B64C
	cmp r2, #0xe
	blt _0232B640
	beq _0232B658
	cmp r2, #0xf
	beq _0232B6A8
	b _0232B884
_0232B640:
	cmp r2, #8
	beq _0232B7B0
	b _0232B884
_0232B64C:
	cmp r2, #0x21
	beq _0232B828
	b _0232B884
_0232B658:
	ldrh r1, [r4, #4]
	cmp r1, #7
	cmpne r1, #0xa
	bne _0232B884
	cmp r0, #5
	bne _0232B884
	ldr r0, _0232B8A0 ; =ov01_0233C0D8
	mov r3, #1
	ldr r1, [r0, OV01_0232B600_LOAD_OFFSET]
	mov r2, #0
	strb r3, [r1, #8]
	ldr r1, [r0, OV01_0232B600_LOAD_OFFSET]
	strb r3, [r1, #9]
	ldr r1, [r0, OV01_0232B600_LOAD_OFFSET]
	strb r3, [r1, #0xf]
	ldr r1, [r0, OV01_0232B600_LOAD_OFFSET]
	strb r2, [r1, #0x15c]
	ldr r0, [r0, OV01_0232B600_LOAD_OFFSET]
	strb r2, [r0, #0x15d]
	b _0232B884
_0232B6A8:
	ldrh r2, [r4, #2]
	cmp r2, #0
	beq _0232B6C8
	cmp r2, #9
	beq _0232B788
	cmp r2, #0xf
	beq _0232B730
	b _0232B79C
_0232B6C8:
	mov r2, #1
	strb r2, [r3, #0x15]
	ldr r2, [r1, OV01_0232B600_LOAD_OFFSET]
	mov r3, #0
	strb r3, [r2, #0xd]
	ldr r2, [r1, OV01_0232B600_LOAD_OFFSET]
	strb r3, [r2, #0x15c]
	ldr r2, [r1, OV01_0232B600_LOAD_OFFSET]
	ldrb r1, [r2, #0xb]
	cmp r1, #1
	bne _0232B884
	ldrb r1, [r2, #0x15d]
	cmp r1, #0
	beq _0232B884
	cmp r0, #4
	bne _0232B710
	bl ov01_0232BD54
	b _0232B71C
_0232B710:
	cmp r0, #5
	bne _0232B71C
	bl ov01_0232BD98
_0232B71C:
	ldr r0, _0232B8A0 ; =ov01_0233C0D8
	mov r1, #0
	ldr r0, [r0, OV01_0232B600_LOAD_OFFSET]
	strb r1, [r0, #0x15d]
	b _0232B884
_0232B730:
	ldrb r1, [r3, #0xb]
	cmp r1, #1
	bne _0232B75C
	cmp r0, #4
	bne _0232B74C
	bl ov01_0232BD54
	b _0232B884
_0232B74C:
	cmp r0, #5
	bne _0232B884
	bl ov01_0232BD98
	b _0232B884
_0232B75C:
	ldr r0, [r3, #0x18]
	cmp r0, #0
	add r0, r3, #0x100
	ldrh r1, [r0, #0x2c]
	bne _0232B77C
	ldr r0, _0232B8A4 ; =ov01_0233C380
	bl ov01_02329B38
	b _0232B884
_0232B77C:
	ldr r0, _0232B8A4 ; =ov01_0233C380
	bl ov01_02329B70
	b _0232B884
_0232B788:
	str r2, [r3, #0x154]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	mov r1, #1
	strb r1, [r0, #0x14]
	b _0232B884
_0232B79C:
	str r2, [r3, #0x154]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	mov r1, #1
	strb r1, [r0, #0x14]
	b _0232B884
_0232B7B0:
	cmp r0, #4
	bne _0232B884
	ldrh r0, [r4, #8]
	cmp r0, #7
	beq _0232B7D0
	cmp r0, #9
	beq _0232B7F0
	b _0232B884
_0232B7D0:
	mov r0, #0
	bl ov01_0232A8B8
	cmp r0, #0
	ldreq r0, _0232B8A0 ; =ov01_0233C0D8
	moveq r1, #0xc
	ldreq r0, [r0, OV01_0232B600_LOAD_OFFSET]
	streq r1, [r0, #0x158]
	b _0232B884
_0232B7F0:
	mov ip, #1
	strb ip, [r3, #0x11]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	ldrh r2, [r4, #0x10]
	add r0, r0, #0x100
	ldrh r3, [r0, #0x24]
	mvn r2, ip, lsl r2
	and r2, r3, r2
	strh r2, [r0, #0x24]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	add r0, r0, #0x100
	ldrh r1, [r0, #0x24]
	strh r1, [r0, #0x10]
	b _0232B884
_0232B828:
	cmp r0, #4
	bne _0232B884
	mov lr, #1
	strb lr, [r3, #8]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	mov r2, #0
	strb lr, [r0, #9]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	strb lr, [r0, #0xf]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	ldrh r3, [r4, #0x10]
	add r0, r0, #0x100
	ldrh ip, [r0, #0x24]
	orr r3, ip, lr, lsl r3
	strh r3, [r0, #0x24]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	add r0, r0, #0x100
	ldrh r3, [r0, #0x24]
	strh r3, [r0, #0x10]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	strb r2, [r0, #0x15c]
	ldr r0, [r1, OV01_0232B600_LOAD_OFFSET]
	strb r2, [r0, #0x15d]
_0232B884:
	ldrh r0, [r4, #8]
	cmp r0, #9
	ldreq r0, _0232B8A0 ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B600_LOAD_OFFSET]
	streqb r1, [r0, #0x11]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232B8A0: .word ov01_0233C0D8
_0232B8A4: .word ov01_0233C380
	arm_func_end ov01_0232B600

	arm_func_start ov01_0232B8A8
ov01_0232B8A8: ; 0x0232B8A8
	ldr r0, _0232B8CC ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r2, [r0, #4]
#else
	ldr r2, [r0]
#endif
	cmp r2, #0
	movne r1, #1
	strneb r1, [r2, #0x15]
#ifdef EUROPE
	ldrne r0, [r0, #4]
#else
	ldrne r0, [r0]
#endif
	movne r1, #0
	strneb r1, [r0, #0xd]
	bx lr
	.align 2, 0
_0232B8CC: .word ov01_0233C0D8
	arm_func_end ov01_0232B8A8

	arm_func_start ov01_0232B8D0
ov01_0232B8D0: ; 0x0232B8D0
#ifdef EUROPE
#define OV01_0232B8D0_LOAD_OFFSET #4
#else
#define OV01_0232B8D0_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r3, _0232B958 ; =ov01_0233C0D8
	mov ip, r0
	ldr r3, [r3, OV01_0232B8D0_LOAD_OFFSET]
	cmp r3, #0
	cmpne r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0232B92C
	mov r0, r1
	mov r1, r2
	mov r2, ip
	bl Wbt_MpParentRecvHook
	ldr r0, _0232B958 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B8D0_LOAD_OFFSET]
	ldrb r0, [r1, #0x15c]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r1, #0x15d]
	ldmneia sp!, {r3, pc}
	bl ov01_0232BD54
	ldmia sp!, {r3, pc}
_0232B92C:
	mov r0, #1
	strb r0, [r3, #0x12]
	ldr r3, _0232B958 ; =ov01_0233C0D8
	cmp r2, #0x200
	ldr r3, [r3, OV01_0232B8D0_LOAD_OFFSET]
	ldr r0, _0232B95C ; =ov01_0233C580
	movhi r2, #0x200
	add r3, r3, #0x100
	strh r2, [r3, #0x2e]
	bl MemcpySimple
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B958: .word ov01_0233C0D8
_0232B95C: .word ov01_0233C580
	arm_func_end ov01_0232B8D0

	arm_func_start ov01_0232B960
ov01_0232B960: ; 0x0232B960
#ifdef EUROPE
#define OV01_0232B960_LOAD_OFFSET #4
#else
#define OV01_0232B960_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232B9E0 ; =ov01_0233C0D8
	ldr r3, [r0, OV01_0232B960_LOAD_OFFSET]
	cmp r3, #0
	cmpne r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0232B9B4
	mov r0, r1
	mov r1, r2
	bl Wbt_MpChildRecvHook
	ldr r0, _0232B9E0 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B960_LOAD_OFFSET]
	ldrb r0, [r1, #0x15c]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r1, #0x15d]
	ldmneia sp!, {r3, pc}
	bl ov01_0232BD98
	ldmia sp!, {r3, pc}
_0232B9B4:
	mov r0, #1
	strb r0, [r3, #0x12]
	ldr r3, _0232B9E0 ; =ov01_0233C0D8
	cmp r2, #0x200
	ldr r3, [r3, OV01_0232B960_LOAD_OFFSET]
	ldr r0, _0232B9E4 ; =ov01_0233C580
	movhi r2, #0x200
	add r3, r3, #0x100
	strh r2, [r3, #0x2e]
	bl MemcpySimple
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B9E0: .word ov01_0233C0D8
_0232B9E4: .word ov01_0233C580
	arm_func_end ov01_0232B960

	arm_func_start ov01_0232B9E8
ov01_0232B9E8: ; 0x0232B9E8
#ifdef EUROPE
#define OV01_0232B9E8_LOAD_OFFSET #4
#else
#define OV01_0232B9E8_LOAD_OFFSET #0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldrh r0, [r5, #0xa]
	mov r4, #0
	bl Wbt_AidbitmapToAid
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	cmp r0, #0
	beq _0232BD34
	mov r3, r4
	add r0, r0, #0x100
	mov r1, #1
	b _0232BA34
_0232BA20:
	ldrh r2, [r0, #0x10]
	tst r2, r1, lsl r3
	movne r4, r3
	bne _0232BA3C
	add r3, r3, #1
_0232BA34:
	cmp r3, #0x10
	blt _0232BA20
_0232BA3C:
	ldr r0, [r5, #4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0232BD34
_0232BA4C: ; jump table
	b _0232BD34 ; case 0
	b _0232BD34 ; case 1
	b _0232BD34 ; case 2
	b _0232BA7C ; case 3
	b _0232BD34 ; case 4
	b _0232BBE4 ; case 5
	b _0232BD34 ; case 6
	b _0232BB68 ; case 7
	b _0232BC8C ; case 8
	b _0232BD34 ; case 9
	b _0232BCB0 ; case 10
	b _0232BD34 ; case 11
_0232BA7C:
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r3, [r0, OV01_0232B9E8_LOAD_OFFSET]
	ldr r1, [r3, #0x18]
	cmp r1, #1
	bne _0232BB28
	ldrsh r1, [r5, #0x14]
	cmp r1, #0
	ble _0232BADC
	ldr r2, _0232BD40 ; =ov01_0233C2C0
	add r1, r3, r4, lsl #2
	str r2, [r1, #0x50]
	ldr r1, [r0, OV01_0232B9E8_LOAD_OFFSET]
	ldr r3, _0232BD44 ; =ov01_0232B9E8
	add r0, r1, #0x100
	ldrh r0, [r0, #0x10]
	add r2, r1, #0x50
	mov r1, #0
	bl Wbt_GetBlockInfo
	cmp r0, #0
	ldreq r0, _0232BD3C ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	streqb r1, [r0, #0x14]
	b _0232BD34
_0232BADC:
	add r0, r3, #0x100
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _0232BD34
	mov r2, #0
	mov r1, #1
	strb r2, [sp, #0xa]
	strb r1, [sp, #0xb]
	ldrh r0, [r0, #0x10]
	ldr r3, _0232BD48 ; =ov01_0232B8A8
	add r1, sp, #0xa
	mov r2, #2
	bl Wbt_PutUserData
	cmp r0, #0
	ldreq r0, _0232BD3C ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	streqb r1, [r0, #0x14]
	b _0232BD34
_0232BB28:
	ldr r2, _0232BD40 ; =ov01_0233C2C0
	add r1, r3, r4, lsl #2
	str r2, [r1, #0x50]
	ldr r1, [r0, OV01_0232B9E8_LOAD_OFFSET]
	ldr r3, _0232BD44 ; =ov01_0232B9E8
	add r0, r1, #0x100
	ldrh r0, [r0, #0x10]
	add r2, r1, #0x50
	mov r1, #0
	bl Wbt_GetBlockInfo
	cmp r0, #0
	ldreq r0, _0232BD3C ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	streqb r1, [r0, #0x14]
	b _0232BD34
_0232BB68:
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r3, _0232BD4C ; =ov01_0233C300
	ldr r2, [r0, OV01_0232B9E8_LOAD_OFFSET]
	ldr r1, _0232BD44 ; =ov01_0232B9E8
	ldr r5, [r2, #4]
	add r2, r2, r4, lsl #2
	str r5, [r2, #0x90]
	ldr r2, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r2, r2, r4, lsl #2
	str r3, [r2, #0xd0]
	ldr r2, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r2, r2, #0xd0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r5, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r0, r5, r4, lsl #2
	ldr r2, [r0, #0x50]
	add r0, r5, #0x100
	ldmia r2, {r1, r3}
	ldrh r0, [r0, #0x10]
	add r2, r5, #0x90
	bl Wbt_GetBlock
	cmp r0, #0
	bne _0232BD34
	ldr r1, _0232BD3C ; =ov01_0233C0D8
	ldr r0, _0232BD50 ; =0x0000044C
	ldr r1, [r1, OV01_0232B9E8_LOAD_OFFSET]
	mov r2, #1
	strb r2, [r1, #0x14]
	bl Wbt_UnregisterBlock
	b _0232BD34
_0232BBE4:
	ldr r1, _0232BD3C ; =ov01_0233C0D8
	ldr r3, [r1, OV01_0232B9E8_LOAD_OFFSET]
	add r0, r3, r4, lsl #2
	ldr r2, [r0, #0x50]
	add r0, r3, #0x100
	ldr r2, [r2, #4]
	strh r2, [r0, #0x34]
	ldr r1, [r1, OV01_0232B9E8_LOAD_OFFSET]
	ldr r0, [r1, #0x18]
	cmp r0, #1
	bne _0232BC80
	mov r2, #0
	add r0, r1, #0x100
	strb r2, [sp, #8]
	ldrh r0, [r0, #0x30]
	ldr r3, _0232BD48 ; =ov01_0232B8A8
	add r1, sp, #8
	cmp r0, #0
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	movne r2, #1
	ldr r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	strb r2, [sp, #9]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x10]
	mov r2, #2
	bl Wbt_PutUserData
	cmp r0, #0
	ldreq r0, _0232BD3C ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	streqb r1, [r0, #0x14]
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x30]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x13]
	b _0232BD34
_0232BC80:
	mov r0, #1
	strb r0, [r1, #0x13]
	b _0232BD34
_0232BC8C:
	ldr r0, [r5, #0x14]
	bl Wbt_UnregisterBlock
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232B9E8_LOAD_OFFSET]
	ldr r0, [r1, #0x18]
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0x13]
	b _0232BD34
_0232BCB0:
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _0232BCF4
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	ldreq r0, _0232BD3C ; =ov01_0233C0D8
	moveq r1, #1
	ldreq r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	streqb r1, [r0, #0x13]
	beq _0232BD34
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	ldr r1, _0232BD44 ; =ov01_0232B9E8
	ldr r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x10]
	bl Wbt_RequestSync
	b _0232BD34
_0232BCF4:
	cmp r1, #1
	blo _0232BD34
	cmp r1, #5
	bhs _0232BD34
	ldr r0, _0232BD3C ; =ov01_0233C0D8
	sub r1, r1, #1
	ldr r0, [r0, OV01_0232B9E8_LOAD_OFFSET]
	add r0, r0, r1, lsl #2
	ldr r2, [r0, #0x114]
	cmp r2, #0
	beq _0232BD34
	ldrb r0, [r5, #0x1d]
	add r1, r5, #0x15
	sub r0, r0, #1
	and r0, r0, #0xff
	blx r2
_0232BD34:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0232BD3C: .word ov01_0233C0D8
_0232BD40: .word ov01_0233C2C0
_0232BD44: .word ov01_0232B9E8
_0232BD48: .word ov01_0232B8A8
_0232BD4C: .word ov01_0233C300
_0232BD50: .word 0x0000044C
	arm_func_end ov01_0232B9E8

	arm_func_start ov01_0232BD54
ov01_0232BD54: ; 0x0232BD54
	stmdb sp!, {r3, lr}
	ldr r0, _0232BD90 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r3, [r0, #4]
#else
	ldr r3, [r0]
#endif
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0232BD94 ; =ov01_0233C380
	mov r2, #1
	mov r1, #0x100
	strb r2, [r3, #0x15c]
	bl Wbt_MpParentSendHook
	mov r1, r0, lsl #0x10
	ldr r0, _0232BD94 ; =ov01_0233C380
	mov r1, r1, lsr #0x10
	bl ov01_02329B38
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232BD90: .word ov01_0233C0D8
_0232BD94: .word ov01_0233C380
	arm_func_end ov01_0232BD54

	arm_func_start ov01_0232BD98
ov01_0232BD98: ; 0x0232BD98
	stmdb sp!, {r3, lr}
	ldr r0, _0232BDD4 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r3, [r0, #4]
#else
	ldr r3, [r0]
#endif
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0232BDD8 ; =ov01_0233C380
	mov r2, #1
	mov r1, #0x20
	strb r2, [r3, #0x15c]
	bl Wbt_MpChildSendHook
	mov r1, r0, lsl #0x10
	ldr r0, _0232BDD8 ; =ov01_0233C380
	mov r1, r1, lsr #0x10
	bl ov01_02329B70
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232BDD4: .word ov01_0233C0D8
_0232BDD8: .word ov01_0233C380
	arm_func_end ov01_0232BD98

	arm_func_start ov01_0232BDDC
ov01_0232BDDC: ; 0x0232BDDC
	ldr r0, _0232BDEC ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0232BDEC: .word ov01_0233C0D8
	arm_func_end ov01_0232BDDC

	arm_func_start ov01_0232BDF0
ov01_0232BDF0: ; 0x0232BDF0
	ldr r0, _0232BE04 ; =ov01_0233C0D8
	mov r1, #0
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0232BE04: .word ov01_0233C0D8
	arm_func_end ov01_0232BDF0

	arm_func_start ov01_0232BE08
ov01_0232BE08: ; 0x0232BE08
	stmdb sp!, {r3, lr}
	ldr r0, _0232BE48 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r0, #4]
#else
	ldr r1, [r0]
#endif
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x148]
	cmp r0, #0
	ldmgtia sp!, {r3, pc}
	bl ov01_0232B26C
	cmp r0, #0
	ldrne r0, _0232BE48 ; =ov01_0233C0D8
	movne r1, #0x1e
#ifdef EUROPE
	ldrne r0, [r0, #4]
#else
	ldrne r0, [r0]
#endif
	strne r1, [r0, #0x148]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232BE48: .word ov01_0233C0D8
	arm_func_end ov01_0232BE08

	arm_func_start ov01_0232BE4C
ov01_0232BE4C: ; 0x0232BE4C
	stmdb sp!, {r3, lr}
	ldr r0, _0232BE94 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r0, #4]
#else
	ldr r1, [r0]
#endif
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x148]
	cmp r0, #0
	ble _0232BE8C
	cmp r0, #0x1e
	bgt _0232BE8C
	bl ov01_0232B26C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0232BE8C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232BE94: .word ov01_0233C0D8
	arm_func_end ov01_0232BE4C

	arm_func_start ov01_0232BE98
ov01_0232BE98: ; 0x0232BE98
#ifdef EUROPE
#define OV01_0232BE98_LOAD_OFFSET #4
#else
#define OV01_0232BE98_LOAD_OFFSET #0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _0232C004 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232BE98_LOAD_OFFSET]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r1, #0x158]
	cmp r0, #0xa
	ldmgeia sp!, {r3, pc}
	ldr r0, [r1, #0x144]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #0x144]
	ldr r0, _0232C004 ; =ov01_0233C0D8
	ldr r3, [r0, OV01_0232BE98_LOAD_OFFSET]
	ldr r2, [r3, #0x148]
	cmp r2, #0
	ble _0232BF24
	ldrb r1, [r3, #8]
	cmp r1, #0
	bne _0232BF24
	sub r1, r2, #1
	str r1, [r3, #0x148]
	ldr r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	ldr r0, [r0, #0x148]
	cmp r0, #0
	bgt _0232BF24
	bl ov01_0232B26C
	cmp r0, #0
	beq _0232BF24
	ldr r0, _0232C004 ; =ov01_0233C0D8
	mov r2, #1
	ldr r1, [r0, OV01_0232BE98_LOAD_OFFSET]
	strb r2, [r1, #0xc]
	ldr r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	str r2, [r0, #0x158]
_0232BF24:
	ldr r0, _0232C004 ; =ov01_0233C0D8
	ldr r3, [r0, OV01_0232BE98_LOAD_OFFSET]
	ldr r1, [r3, #0x158]
	cmp r1, #2
	beq _0232BFF8
	ldrb r1, [r3, #9]
	cmp r1, #0
	beq _0232BF80
	ldr r1, [r3, #0x138]
	add r1, r1, #1
	str r1, [r3, #0x138]
	ldr r3, [r0, OV01_0232BE98_LOAD_OFFSET]
	ldrb r1, [r3, #0xe]
	cmp r1, #0
	bne _0232BFA8
	ldr r2, [r3, #0x13c]
	sub r1, r2, #1
	str r1, [r3, #0x13c]
	cmp r2, #0
	ldrlt r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	movlt r1, #0xa
	strlt r1, [r0, #0x158]
	b _0232BFA8
_0232BF80:
	ldrb r1, [r3, #8]
	cmp r1, #0
	bne _0232BFA8
	ldr r2, [r3, #0x140]
	sub r1, r2, #1
	str r1, [r3, #0x140]
	cmp r2, #0
	ldrlt r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	movlt r1, #5
	strlt r1, [r0, #0x158]
_0232BFA8:
	bl ov01_0232AFC4
	cmp r0, #0
	ldrne r0, _0232C004 ; =ov01_0233C0D8
	movne r1, #0xc
	ldrne r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	strne r1, [r0, #0x158]
	bne _0232BFF8
	ldr r0, _0232C004 ; =ov01_0233C0D8
	ldr r1, [r0, OV01_0232BE98_LOAD_OFFSET]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	movne r0, #0xc
	strne r0, [r1, #0x158]
	bne _0232BFF8
	bl ov01_0232956C
	cmp r0, #0
	ldrne r0, _0232C004 ; =ov01_0233C0D8
	movne r1, #0xc
	ldrne r0, [r0, OV01_0232BE98_LOAD_OFFSET]
	strne r1, [r0, #0x158]
_0232BFF8:
	bl ov01_0232B3CC
	bl ov01_0232C07C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C004: .word ov01_0233C0D8
	arm_func_end ov01_0232BE98

	arm_func_start ov01_0232C008
ov01_0232C008: ; 0x0232C008
	ldr r0, _0232C020 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	cmp r0, #0
	moveq r0, #0
	ldrne r0, [r0, #0x158]
	bx lr
	.align 2, 0
_0232C020: .word ov01_0233C0D8
	arm_func_end ov01_0232C008

	arm_func_start ov01_0232C024
ov01_0232C024: ; 0x0232C024
	ldr r0, _0232C03C ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r0, #4]
#else
	ldr r1, [r0]
#endif
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x158]
	bx lr
	.align 2, 0
_0232C03C: .word ov01_0233C0D8
	arm_func_end ov01_0232C024

	arm_func_start ov01_0232C040
ov01_0232C040: ; 0x0232C040
	ldr r1, _0232C078 ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	cmp r1, #0
	bxeq lr
	cmp r0, #0
	bne _0232C064
	ldr r0, [r1, #0x158]
	cmp r0, #0xa
	bxge lr
_0232C064:
	ldr r0, _0232C078 ; =ov01_0233C0D8
	mov r1, #2
#ifdef EUROPE
	ldr r0, [r0, #4]
#else
	ldr r0, [r0]
#endif
	str r1, [r0, #0x158]
	bx lr
	.align 2, 0
_0232C078: .word ov01_0233C0D8
	arm_func_end ov01_0232C040

	arm_func_start ov01_0232C07C
ov01_0232C07C: ; 0x0232C07C
	ldr r0, _0232C09C ; =ov01_0233C0D8
#ifdef EUROPE
	ldr r1, [r0, #4]
#else
	ldr r1, [r0]
#endif
	cmp r1, #0
	bxeq lr
	ldr r1, [r1, #0x158]
	cmp r1, #0xa
#ifdef EUROPE
	strge r1, [r0]
#else
	strge r1, [r0, #4]
#endif
	bx lr
	.align 2, 0
_0232C09C: .word ov01_0233C0D8
	arm_func_end ov01_0232C07C

	arm_func_start ov01_0232C0A0
ov01_0232C0A0: ; 0x0232C0A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLanguage
#ifdef EUROPE
	ldr r2, _0232C0C8 ; =ov01_0233C0E0
	mov r1, #0x14
	mla r1, r4, r1, r2
#else
	mvn r1, #0
	cmp r0, r1
	ldr r1, _0232C0C8 ; =ov01_0233C0E0
	movne r0, #0
	add r1, r1, r4, lsl #3
#endif
	ldr r0, [r1, r0, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232C0C8: .word ov01_0233C0E0
	arm_func_end ov01_0232C0A0

	arm_func_start ov01_0232C0CC
ov01_0232C0CC: ; 0x0232C0CC
	stmdb sp!, {r3, lr}
	ldr r1, _0232C0FC ; =ov01_0233C140
	mov r2, #0
	strb r2, [r1, #1]
	ldr r0, _0232C100 ; =WAN_TABLE
	strb r2, [r1]
	ldr r0, [r0]
	ldr r1, _0232C104 ; =ov01_0233AEF8
	bl LoadWanTableEntry
	ldr r1, _0232C108 ; =ov01_0233C780
	strh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C0FC: .word ov01_0233C140
_0232C100: .word WAN_TABLE
_0232C104: .word ov01_0233AEF8
_0232C108: .word ov01_0233C780
	arm_func_end ov01_0232C0CC

	arm_func_start ov01_0232C10C
ov01_0232C10C: ; 0x0232C10C
	stmdb sp!, {r3, lr}
	bl ov01_0232C2AC
	ldr r0, _0232C13C ; =ov01_0233C780
	ldr r2, _0232C140 ; =WAN_TABLE
	ldrsh r1, [r0]
	ldr r0, [r2]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0232C144 ; =ov01_0233C140
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C13C: .word ov01_0233C780
_0232C140: .word WAN_TABLE
_0232C144: .word ov01_0233C140
	arm_func_end ov01_0232C10C

	arm_func_start ov01_0232C148
ov01_0232C148: ; 0x0232C148
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r0, _0232C1CC ; =ov01_0233C800
	mov r4, r1
	mov r6, r2
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _0232C1D0 ; =ov01_0233C780
	ldr r0, _0232C1CC ; =ov01_0233C800
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r1, r6
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, _0232C1CC ; =ov01_0233C800
	mov r3, r2
	bl SetAnimationForAnimationControl
	ldr r1, _0232C1CC ; =ov01_0233C800
	mov r0, #0
	strh r0, [r1, #0x38]
	strh r5, [r1, #0x1c]
	ldr r0, _0232C1D4 ; =ov01_0233C140
	strh r4, [r1, #0x1e]
	mov r1, #1
	strb r1, [r0]
	strb r1, [r0, #1]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232C1CC: .word ov01_0233C800
_0232C1D0: .word ov01_0233C780
_0232C1D4: .word ov01_0233C140
	arm_func_end ov01_0232C148

	arm_func_start ov01_0232C1D8
ov01_0232C1D8: ; 0x0232C1D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r2, _0232C23C ; =ov01_0233C140
	mov r1, r0
	ldrb r0, [r2, #1]
	cmp r0, #0
	ldrne r0, _0232C240 ; =ov01_0233C800
	movne r2, r1, lsl #0x10
	ldrnesh r3, [r0, #0x78]
	cmpne r3, r2, asr #16
	beq _0232C234
	mov r3, #0xc
	mov r2, #0
	str r3, [sp]
	str r2, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r3, r2
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _0232C23C ; =ov01_0233C140
	mov r1, #1
	strb r1, [r0]
_0232C234:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C23C: .word ov01_0233C140
_0232C240: .word ov01_0233C800
	arm_func_end ov01_0232C1D8

	arm_func_start ov01_0232C244
ov01_0232C244: ; 0x0232C244
	stmdb sp!, {r4, lr}
	ldr r0, _0232C2A0 ; =ov01_0233C140
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r0]
	cmp r0, #0
	beq _0232C294
	ldr r4, _0232C2A4 ; =ov01_0233C800
	ldr lr, _0232C2A8 ; =ov01_0233C784
	mov ip, #7
_0232C270:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232C270
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r0, _0232C2A0 ; =ov01_0233C140
	mov r1, #0
	strb r1, [r0]
_0232C294:
	ldr r0, _0232C2A8 ; =ov01_0233C784
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232C2A0: .word ov01_0233C140
_0232C2A4: .word ov01_0233C800
_0232C2A8: .word ov01_0233C784
	arm_func_end ov01_0232C244

	arm_func_start ov01_0232C2AC
ov01_0232C2AC: ; 0x0232C2AC
	stmdb sp!, {r3, lr}
	ldr r0, _0232C2DC ; =ov01_0233C140
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0232C2E0 ; =ov01_0233C800
	bl sub_0201C138
	ldr r0, _0232C2DC ; =ov01_0233C140
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C2DC: .word ov01_0233C140
_0232C2E0: .word ov01_0233C800
	arm_func_end ov01_0232C2AC

	arm_func_start ov01_0232C2E4
ov01_0232C2E4: ; 0x0232C2E4
	stmdb sp!, {r3, lr}
	bl GetHero
	ldr r1, _0232C360 ; =ov01_0233C144
	mov r2, #0
	strb r2, [r1, #1]
	strb r2, [r1]
	cmp r0, #0
	beq _0232C330
	ldrsh r0, [r0, #4]
	bl GetSpriteIndex__020526EC
	mov r3, #0
	ldr r1, _0232C364 ; =WAN_TABLE
	str r3, [sp]
	mov r2, r0
	ldr r0, [r1]
	mov r1, #2
	bl LoadWanTableEntryFromPack
	ldr r1, _0232C368 ; =ov01_0233C87C
	b _0232C358
_0232C330:
	ldr r0, _0232C36C ; =0x00000229
	bl GetSpriteIndex__020526EC
	mov r3, #0
	ldr r1, _0232C364 ; =WAN_TABLE
	str r3, [sp]
	mov r2, r0
	ldr r0, [r1]
	mov r1, #2
	bl LoadWanTableEntryFromPack
	ldr r1, _0232C368 ; =ov01_0233C87C
_0232C358:
	strh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C360: .word ov01_0233C144
_0232C364: .word WAN_TABLE
_0232C368: .word ov01_0233C87C
_0232C36C: .word 0x00000229
	arm_func_end ov01_0232C2E4

	arm_func_start ov01_0232C370
ov01_0232C370: ; 0x0232C370
	stmdb sp!, {r3, lr}
	bl ov01_0232C540
	ldr r0, _0232C3A0 ; =ov01_0233C87C
	ldr r2, _0232C3A4 ; =WAN_TABLE
	ldrsh r1, [r0]
	ldr r0, [r2]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0232C3A8 ; =ov01_0233C144
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C3A0: .word ov01_0233C87C
_0232C3A4: .word WAN_TABLE
_0232C3A8: .word ov01_0233C144
	arm_func_end ov01_0232C370

	arm_func_start ov01_0232C3AC
ov01_0232C3AC: ; 0x0232C3AC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r0, _0232C448 ; =ov01_0233C8FC
	mov r4, r1
	mov r6, r3
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _0232C44C ; =ov01_0233C87C
	ldr r0, _0232C448 ; =ov01_0233C8FC
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xd
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0232C448 ; =ov01_0233C8FC
	mov r3, r6, lsr #0x1f
	rsb r2, r3, r6, lsl #29
	add r2, r3, r2, ror #29
	mov r3, #0x20
	bl SetAnimationForAnimationControl
	mov r1, #0
	ldr r0, _0232C448 ; =ov01_0233C8FC
	strh r1, [r0, #0x38]
	strh r5, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D12C
	ldr r0, _0232C450 ; =ov01_0233C144
	mov r1, #1
	strb r1, [r0]
	strb r1, [r0, #1]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232C448: .word ov01_0233C8FC
_0232C44C: .word ov01_0233C87C
_0232C450: .word ov01_0233C144
	arm_func_end ov01_0232C3AC

	arm_func_start ov01_0232C454
ov01_0232C454: ; 0x0232C454
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r2, _0232C4D0 ; =ov01_0233C144
	mov lr, r0
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _0232C4C8
	ldr r0, _0232C4D4 ; =ov01_0233C8FC
	ldrsh r2, [r0, #0x76]
	cmp r2, lr
	ldreqsh r2, [r0, #0x78]
	cmpeq r2, r1
	beq _0232C4C8
	mov ip, #0xd
	mov r3, r1, lsr #0x1f
	rsb r2, r3, r1, lsl #29
	str ip, [sp]
	mov ip, #0
	str ip, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, lr
	add r2, r3, r2, ror #29
	mov r3, #0x20
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _0232C4D0 ; =ov01_0233C144
	mov r1, #1
	strb r1, [r0]
_0232C4C8:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C4D0: .word ov01_0233C144
_0232C4D4: .word ov01_0233C8FC
	arm_func_end ov01_0232C454

	arm_func_start ov01_0232C4D8
ov01_0232C4D8: ; 0x0232C4D8
	stmdb sp!, {r4, lr}
	ldr r0, _0232C534 ; =ov01_0233C144
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r0]
	cmp r0, #0
	beq _0232C528
	ldr r4, _0232C538 ; =ov01_0233C8FC
	ldr lr, _0232C53C ; =ov01_0233C880
	mov ip, #7
_0232C504:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232C504
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r0, _0232C534 ; =ov01_0233C144
	mov r1, #0
	strb r1, [r0]
_0232C528:
	ldr r0, _0232C53C ; =ov01_0233C880
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232C534: .word ov01_0233C144
_0232C538: .word ov01_0233C8FC
_0232C53C: .word ov01_0233C880
	arm_func_end ov01_0232C4D8

	arm_func_start ov01_0232C540
ov01_0232C540: ; 0x0232C540
	stmdb sp!, {r3, lr}
	ldr r0, _0232C570 ; =ov01_0233C144
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0232C574 ; =ov01_0233C8FC
	bl sub_0201C138
	ldr r0, _0232C570 ; =ov01_0233C144
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232C570: .word ov01_0233C144
_0232C574: .word ov01_0233C8FC
	arm_func_end ov01_0232C540

	arm_func_start ov01_0232C578
ov01_0232C578: ; 0x0232C578
	ldr r3, [r0]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232C578

	arm_func_start ov01_0232C5AC
ov01_0232C5AC: ; 0x0232C5AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov01_0232C578
	cmp r0, #0
	addne r0, r4, #4
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov01_0232C5AC

	arm_func_start ov01_0232C5C8
ov01_0232C5C8: ; 0x0232C5C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	mov r0, #0x3e8
	mov r6, r1
	mov r4, r2
	bl RandInt
	mov r2, r0, lsl #0x10
	mov r0, sl
	mov r1, #0xa4
	mov sb, r2, lsr #0x10
	bl MemZero
	bl ov01_0232E22C
	mov r2, r4, lsl #0x18
	mov r1, r4, lsl #8
	and r2, r2, #0xff000000
	and r1, r1, #0xff0000
	str r0, [sl]
	orr r0, r2, r1
	str r0, [sl, #4]
	bl GetLanguageType
	mov r5, r0
	bl GetLanguageType
	mov r4, r0
	bl GetLanguageType
	mov r7, r0
	bl GetLanguageType
	mov r1, r7, lsl #8
	and r3, r1, #0xff0000
	mov r1, r4, lsr #0x18
	and r2, r1, #0xff
	mov r1, r5, lsr #8
	and r1, r1, #0xff00
	orr r1, r2, r1
	mov r0, r0, lsl #0x18
	orr r1, r3, r1
	and r0, r0, #0xff000000
	orr r0, r0, r1
	str r0, [sl, #8]
	mov r0, sb, asr #8
	and r1, r0, #0xff
	mov r0, sb, lsl #8
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sl, #0x5c]
	add r0, sl, #0x48
	mov r1, #0x14
	bl MemZero
	add r0, sp, #4
	bl GetMainTeamNameWithCheck
	cmp r6, #0
	add r1, sp, #4
	add r0, sl, #0x48
	beq _0232C6AC
#ifdef JAPAN
	mov r2, #5
	bl StrcpyName
#else
	mov r2, #0xa
	bl sub_02025404
#endif
	b _0232C6B0
_0232C6AC:
	bl StrcpySimple
_0232C6B0:
	bl ov00_022BD5C8
	cmp r0, #0
	beq _0232C7A8
	bl ov00_022BD5EC
	mov r1, r0
	add r0, sl, #0xc
	mov r2, #0x36
	bl MemcpySimple
	bl ov00_022BD71C
	mov r8, r0
	bl ov00_022BD708
	mov r7, r0
	bl ov00_022BD6E0
	mov r6, r0
	bl ov00_022BD6F4
	mov r5, r0
	bl ov00_022BD71C
	mov r4, r0
	bl ov00_022BD708
	mov fp, r0
	bl ov00_022BD6E0
	str r0, [sp]
	bl ov00_022BD6F4
	mov r1, r5, lsl #2
	mov r2, r0, lsl #2
	ldr r0, [sp]
	orr r1, r1, r6, lsl #1
	orr r1, r1, r7, lsl #3
	orr r0, r2, r0, lsl #1
	orr r1, r8, r1
	orr r0, r0, fp, lsl #3
	mov r1, r1, lsl #0x10
	orr r0, r4, r0
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	mov r0, r0, lsr #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sl, #0x44]
	bl ov00_022BD660
	cmp r0, #0
	ldreq r4, _0232C8B0 ; =0x0000FFFF
	beq _0232C76C
	bl ov00_022BD690
	mov r4, r0
_0232C76C:
	bl ov00_022BD660
	cmp r0, #0
	ldreq r0, _0232C8B0 ; =0x0000FFFF
	beq _0232C780
	bl ov00_022BD690
_0232C780:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4, lsl #0x10
	mov r1, r1, asr #8
	mov r0, r0, lsr #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sl, #0x5e]
	b _0232C7B4
_0232C7A8:
	mov r0, #0
	strh r0, [sl, #0x44]
	strh r0, [sl, #0x5e]
_0232C7B4:
	mov r6, #0
	mov r4, r6
	mov r5, r6
	mov r7, #1
_0232C7C4:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD13C
	mov r8, r0
	cmp r8, #0
	ble _0232C850
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD2C0
	cmp r0, #0
	beq _0232C850
	mov r2, r8, lsr #0x18
	mov r1, r8, lsr #8
	mov r3, r8, lsl #8
	mov r0, r8, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, r0, #0xff000000
	orr r0, r3, r1
	orr r1, r2, r0
	add r0, sl, r5, lsl #2
	str r1, [r0, #0x64]
	bl ov00_022BD5C8
	cmp r0, #0
	beq _0232C84C
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD284
	cmp r0, #0
	orrne r0, r6, r7, lsl r5
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
_0232C84C:
	add r5, r5, #1
_0232C850:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0232C7C4
	mov r1, r5, lsr #0x18
	mov r0, r5, lsr #8
	mov r7, r6, asr #8
	mov r4, r6, lsl #8
	mov r2, r5, lsl #8
	mov r3, r5, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r5, r7, #0xff
	and r4, r4, #0xff00
	orr r4, r5, r4
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	strh r4, [sl, #0x46]
	orr r1, r1, r0
	mov r0, sb
	str r1, [sl, #0x60]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232C8B0: .word 0x0000FFFF
	arm_func_end ov01_0232C5C8

#ifndef EUROPE
	arm_func_start ov01_0232C8B4
ov01_0232C8B4: ; 0x0232C8B4
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232C8B4
#endif

	arm_func_start ov01_0232C8E8
ov01_0232C8E8: ; 0x0232C8E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x98
	bl MemZero
	bl ov01_0232E22C
	str r0, [r5]
	ldr r6, [r4, #0x14]
	add r0, r5, #0x2c
	mov r2, r6, lsr #0x18
	mov r1, r6, lsr #8
	mov r3, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r6, r6, #0xff000000
	and r3, r3, #0xff0000
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	orr r1, r3, r1
	orr r1, r6, r1
	str r1, [r5, #4]
	ldr r6, [r4, #0x18]
	add r1, r4, #0x32
	mov r3, r6, lsr #0x18
	mov r2, r6, lsr #8
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	mov r3, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r6, r6, #0xff000000
	and r3, r3, #0xff0000
	orr r2, r3, r2
	orr r2, r6, r2
	str r2, [r5, #8]
	ldrb r7, [r4, #4]
	mov r2, #0x12
	mov r3, r7, lsl #0x18
	and r6, r3, #0xff000000
	mov r3, r7, lsl #8
	and r3, r3, #0xff0000
	orr r3, r6, r3
	str r3, [r5, #0x1c]
	ldrb r7, [r4, #5]
	mov r3, r7, lsl #0x18
	and r6, r3, #0xff000000
	mov r3, r7, lsl #8
	and r3, r3, #0xff0000
	orr r3, r6, r3
	str r3, [r5, #0x20]
	ldr r7, [r4, #8]
	mov r3, r7, lsr #0x18
	and ip, r3, #0xff
	mov r3, r7, lsl #0x18
	and r6, r3, #0xff000000
	mov r3, r7, lsl #8
	and lr, r3, #0xff0000
	mov r3, r7, lsr #8
	and r3, r3, #0xff00
	orr r3, ip, r3
	orr r3, lr, r3
	orr r3, r6, r3
	str r3, [r5, #0x24]
	ldrb lr, [r4, #0xad]
	mov r3, lr, lsl #0x18
	and ip, r3, #0xff000000
	mov r3, lr, lsl #8
	and r3, r3, #0xff0000
	orr r3, ip, r3
	str r3, [r5, #0x28]
	bl ov01_0232E27C
	add r0, r5, #0x50
	add r1, r4, #0x56
	mov r2, #0x24
	bl ov01_0232E27C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov01_0232C8E8

	arm_func_start ov01_0232CA18
ov01_0232CA18: ; 0x0232CA18
	ldr r2, [r0, #4]
	ldr ip, _0232CA2C ; =ov01_0232E1C4
	ldr r1, [r0, #8]
	mov r0, r2
	bx ip
	.align 2, 0
_0232CA2C: .word ov01_0232E1C4
	arm_func_end ov01_0232CA18

	arm_func_start ov01_0232CA30
ov01_0232CA30: ; 0x0232CA30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r1, #0x98
	mov fp, r3
	ldr r7, [sp, #0x28]
	ldr r6, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r4, [sp, #0x34]
	bl MemZero
	bl ov01_0232E22C
	str r0, [sl]
	mov r0, sb
	mov r1, r8
	bl ov01_0232E1C4
	stmib sl, {r0, r1}
	mov r0, fp
	mov r1, r7
	bl ov01_0232E1C4
	str r0, [sl, #0xc]
	mov r0, r6, lsr #8
	str r1, [sl, #0x10]
	mov r2, r6, lsr #0x18
	mov r1, r6, lsl #8
	mov r3, r6, lsl #0x18
	and r6, r3, #0xff000000
	and r3, r1, #0xff0000
	and r1, r2, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	orr r1, r3, r0
	mov r2, r5, lsr #0x18
	mov r0, r5, lsr #8
	mov r3, r5, lsl #8
	orr r1, r6, r1
	str r1, [sl, #0x14]
	mov r1, r4, lsr #0x18
	mov r5, r5, lsl #0x18
	and r2, r2, #0xff
	and r0, r0, #0xff00
	orr r2, r2, r0
	and r3, r3, #0xff0000
	mov r0, r4, lsr #8
	orr r3, r3, r2
	and r5, r5, #0xff000000
	orr r5, r5, r3
	mov r2, r4, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	mov r3, r4, lsl #0x18
	orr r0, r1, r0
	and r2, r2, #0xff0000
	and r1, r3, #0xff000000
	orr r0, r2, r0
	str r5, [sl, #0x18]
	orr r0, r1, r0
	str r0, [sl, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov01_0232CA30

	arm_func_start ov01_0232CB1C
ov01_0232CB1C: ; 0x0232CB1C
	ldr r3, [r0, #8]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232CB1C

	arm_func_start ov01_0232CB50
ov01_0232CB50: ; 0x0232CB50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x128
	str r2, [sp, #8]
	str r0, [sp]
	str r1, [sp, #4]
	str r3, [sp, #0xc]
	mov r4, #0
	bl ov01_0232CB1C
	ldr r1, [sp, #8]
	mov r5, #0
	cmp r1, r0
	strhs r0, [sp, #8]
	str r5, [sp, #0x124]
	b _0232CE88
_0232CB88:
	ldr r0, [sp]
	add r1, r0, #0xc
	mov r0, #0xb4
	mla r7, r5, r0, r1
	ldr r1, [r7, #0x34]
	ldr r8, [r7, #0x38]
	mov sb, r1, lsr #0x18
	mov r6, r1, lsr #8
	mov r0, r1, lsl #8
	mov r3, r8, lsr #0x18
	mov r2, r8, lsr #8
	mov r1, r1, lsl #0x18
	and sb, sb, #0xff
	and r6, r6, #0xff00
	orr sb, sb, r6
	mov r6, r8, lsl #8
	and r0, r0, #0xff0000
	mov r8, r8, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and r6, r6, #0xff0000
	orr r2, r3, r2
	orr r3, r6, r2
	ldr r2, [sp, #0xc]
	and r8, r8, #0xff000000
	and r1, r1, #0xff000000
	orr r0, r0, sb
	orr fp, r1, r0
	mov r0, #0
	cmp r2, #0
	orr r8, r8, r3
	str r0, [sp, #0x18]
	bne _0232CC1C
	and r0, fp, #0xff
	bl GetMaxReachedFloor
	cmp r0, r8
	blo _0232CE84
_0232CC1C:
	ldmia r7, {r0, r1}
	bl ov01_0232E1C4
	ldr r2, [r7, #8]
	str r1, [sp, #0x14]
	mov r1, r2, lsl #8
	mov sl, r0
	mov r0, r2, lsr #0x18
	and r6, r1, #0xff0000
	mov r1, r2, lsr #8
	and r3, r0, #0xff
	and r1, r1, #0xff00
	mov r0, r2, lsl #0x18
	orr r1, r3, r1
	orr r1, r6, r1
	and r0, r0, #0xff000000
	orr r0, r0, r1
	str r0, [sp, #0x1c]
	ldr r2, [r7, #0xc]
	mov sb, #0
	mov r0, r2, lsl #0x18
	and r1, r0, #0xff000000
	mov r0, r2, lsl #8
	mov r3, r2, lsr #0x18
	mov r2, r2, lsr #8
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and r0, r0, #0xff0000
	orr r2, r3, r2
	orr r0, r0, r2
	orr r0, r1, r0
	str r0, [sp, #0x20]
	add r6, sp, #0x24
	b _0232CCCC
_0232CCA0:
	add r0, r6, sb, lsl #3
	add r1, sp, #0x1c
	bl sub_0205B554
	cmp r0, #0
	beq _0232CCC8
	ldr r1, [sp, #0x20]
	ldr r0, _0232CEA0 ; =ov01_0233AF14
	ldr r2, [sp, #0x1c]
	bl Debug_Print0
	b _0232CCDC
_0232CCC8:
	add sb, sb, #1
_0232CCCC:
	ldr r0, [sp, #0x124]
	cmp sb, r0
	blt _0232CCA0
	mvn sb, #0
_0232CCDC:
	mvn r0, #0
	cmp sb, r0
	mov r1, #0xb0
	beq _0232CD18
	ldr r0, [sp, #4]
	mla r6, sb, r1, r0
	ldr r1, [r6, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r6, #0xc]
	cmp r1, r0
	cmpeq r2, sl
	bhs _0232CE84
	mov r0, #1
	str r0, [sp, #0x18]
	b _0232CD20
_0232CD18:
	ldr r0, [sp, #4]
	mla r6, r4, r1, r0
_0232CD20:
	ldr r0, [sp, #0x14]
	str sl, [r6, #0xc]
	str r0, [r6, #0x10]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	str r1, [r6, #0x14]
	str r0, [r6, #0x18]
	ldr r0, [sp, #0x124]
	cmp r0, #0x20
	beq _0232CD80
	ldr r1, [r6, #0x18]
	ldr r2, [r6, #0x14]
	ldr r0, _0232CEA4 ; =ov01_0233AF3C
	bl Debug_Print0
	ldr sb, [sp, #0x124]
	add r3, sp, #0x24
	ldr r2, [r6, #0x14]
	ldr r1, [r6, #0x18]
	add r0, r3, sb, lsl #3
	str r2, [r3, sb, lsl #3]
	str r1, [r0, #4]
	ldr r0, [sp, #0x124]
	add r0, r0, #1
	str r0, [sp, #0x124]
_0232CD80:
	add r0, r6, #0x1d
	mov r1, #0x14
	bl MemZero
	add r0, r6, #0x1d
	add r1, r7, #0x20
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	strb fp, [r6, #4]
	strb r8, [r6, #5]
	ldr sb, [r7, #0x3c]
	add r0, r6, #0x32
	mov r2, sb, lsl #8
	and r8, r2, #0xff0000
	mov r2, sb, lsr #0x18
	and r3, r2, #0xff
	mov r2, sb, lsr #8
	and r2, r2, #0xff00
	mov r1, sb, lsl #0x18
	orr r2, r3, r2
	and r1, r1, #0xff000000
	orr r2, r8, r2
	orr r1, r1, r2
	str r1, [r6, #8]
	ldr sl, [r7, #0x44]
	mov r1, #0x24
	mov r3, sl, lsl #8
	and sb, r3, #0xff0000
	mov r3, sl, lsr #0x18
	and r8, r3, #0xff
	mov r3, sl, lsr #8
	and r3, r3, #0xff00
	mov r2, sl, lsl #0x18
	orr r3, r8, r3
	and r2, r2, #0xff000000
	orr r3, sb, r3
	orr r2, r2, r3
	strb r2, [r6, #0x1c]
	ldr sl, [r7, #0x40]
	mov r3, sl, lsl #8
	and sb, r3, #0xff0000
	mov r3, sl, lsr #0x18
	and r8, r3, #0xff
	mov r3, sl, lsr #8
	and r3, r3, #0xff00
	mov r2, sl, lsl #0x18
	orr r3, r8, r3
	and r2, r2, #0xff000000
	orr r3, sb, r3
	orr r2, r2, r3
	strb r2, [r6, #0xae]
	bl MemZero
	add r0, r6, #0x56
	mov r1, #0x48
	bl MemZero
	add r0, r6, #0x32
	add r1, r7, #0x48
	mov r2, #0x12
	bl ov01_0232E2D8
	add r0, r6, #0x56
	add r1, r7, #0x6c
	mov r2, #0x24
	bl ov01_0232E2D8
	ldr r0, [sp, #0x18]
	cmp r0, #0
	addeq r4, r4, #1
_0232CE84:
	add r5, r5, #1
_0232CE88:
	ldr r0, [sp, #8]
	cmp r5, r0
	blt _0232CB88
	mov r0, r4
	add sp, sp, #0x128
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232CEA0: .word ov01_0233AF14
_0232CEA4: .word ov01_0233AF3C
	arm_func_end ov01_0232CB50

	arm_func_start ov01_0232CEA8
ov01_0232CEA8: ; 0x0232CEA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232CEA8

	arm_func_start ov01_0232CEDC
ov01_0232CEDC: ; 0x0232CEDC
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232CEDC

	arm_func_start ov01_0232CF14
ov01_0232CF14: ; 0x0232CF14
	ldr r3, [r0, #0xb4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232CF14

	arm_func_start ov01_0232CF4C
ov01_0232CF4C: ; 0x0232CF4C
	ldr r3, [r0, #0xb8]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232CF4C

	arm_func_start ov01_0232CF84
ov01_0232CF84: ; 0x0232CF84
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #0x14]
	ldr ip, [r5, #0xc]
	add r0, r4, #0x1d
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x14
	str r2, [r4, #0x18]
	bl MemZero
	add r0, r4, #0x1d
	add r1, r5, #0x20
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	ldr r3, [r5, #0x34]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #4]
	ldr r3, [r5, #0x38]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #5]
	ldr r3, [r5, #0x3c]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #8]
	ldr r3, [r5, #0x44]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #0x1c]
	ldr ip, [r5, #0xb4]
	add r0, r4, #0x32
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	strb r1, [r4, #0xad]
	ldr lr, [r5, #0x40]
	mov r1, #0x24
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	strb r2, [r4, #0xae]
	bl MemZero
	add r0, r4, #0x56
	mov r1, #0x48
	bl MemZero
	add r0, r4, #0x32
	add r1, r5, #0x48
	mov r2, #0x12
	bl ov01_0232E2D8
	add r0, r4, #0x56
	add r1, r5, #0x6c
	mov r2, #0x24
	bl ov01_0232E2D8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov01_0232CF84

	arm_func_start ov01_0232D188
ov01_0232D188: ; 0x0232D188
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232D188

	arm_func_start ov01_0232D1BC
ov01_0232D1BC: ; 0x0232D1BC
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232D1BC

	arm_func_start ov01_0232D1F4
ov01_0232D1F4: ; 0x0232D1F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #0x14]
	ldr ip, [r5, #0xc]
	add r0, r4, #0x1d
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x14
	str r2, [r4, #0x18]
	bl MemZero
	add r0, r4, #0x1d
	add r1, r5, #0x20
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	ldr r3, [r5, #0x34]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #4]
	ldr r3, [r5, #0x38]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #5]
	ldr r3, [r5, #0x3c]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #8]
	ldr r3, [r5, #0x44]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #0x1c]
	ldr ip, [r5, #0x40]
	add r0, r4, #0x32
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x24
	strb r2, [r4, #0xae]
	bl MemZero
	add r0, r4, #0x56
	mov r1, #0x48
	bl MemZero
	add r0, r4, #0x32
	add r1, r5, #0x48
	mov r2, #0x12
	bl ov01_0232E2D8
	add r0, r4, #0x56
	add r1, r5, #0x6c
	mov r2, #0x24
	bl ov01_0232E2D8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov01_0232D1F4

	arm_func_start ov01_0232D3C4
ov01_0232D3C4: ; 0x0232D3C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r5, r1
	mov r6, r0
	mov r1, #0xd4
	mov r4, r2
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldr r8, [r5, #0xa4]
	add r0, sp, #4
	mov r1, r8, lsl #0x18
	and r7, r1, #0xff000000
	mov r1, r8, lsl #8
	and r3, r1, #0xff0000
	mov r1, r8, lsr #0x18
	and r2, r1, #0xff
	mov r1, r8, lsr #8
	and r1, r1, #0xff00
	orr r1, r2, r1
	orr r1, r3, r1
	orr r1, r7, r1
	str r1, [r6, #0xc]
	ldr ip, [r5, #0xa8]
	add r1, r6, #0x28
	mov r3, ip, lsl #8
	and r8, r3, #0xff0000
	mov r3, ip, lsr #0x18
	and r7, r3, #0xff
	mov r3, ip, lsr #8
	and r3, r3, #0xff00
	mov r2, ip, lsl #0x18
	orr r3, r7, r3
	and r2, r2, #0xff000000
	orr r3, r8, r3
	orr r2, r2, r3
	str r2, [r6, #0x10]
	ldrsh r7, [r5, #0xa2]
	ldrh r3, [r5, #0xa0]
	mov r2, #0x40
	orr r8, r3, r7, lsl #16
	mov ip, r8, lsl #8
	and r7, ip, #0xff0000
	mov ip, r8, lsr #0x18
	and lr, ip, #0xff
	mov ip, r8, lsr #8
	and ip, ip, #0xff00
	mov r3, r8, lsl #0x18
	orr ip, lr, ip
	and r3, r3, #0xff000000
	orr r7, r7, ip
	orr r3, r3, r7
	str r3, [r6, #0x24]
	bl InitBitstreamForRead
	cmp r4, #0
	add r0, sp, #4
	beq _0232D4E0
	mov r2, #0xff
	strb r2, [sp, #1]
	add r1, sp, #1
	mov r2, #1
	bl CopyBitsTo
	ldrb r2, [r5, #0xad]
	add r0, sp, #4
	mov r1, r4
	bl ov01_0232E334
	b _0232D4F4
_0232D4E0:
	mov r3, #0
	add r1, sp, #0
	mov r2, #1
	strb r3, [sp]
	bl CopyBitsTo
_0232D4F4:
	add r0, sp, #4
	bl BitstreamDebug
	add r0, r6, #0x68
	add r1, r5, #0x32
	mov r2, #0x12
	bl ov01_0232E27C
	add r0, r6, #0x8c
	add r1, r5, #0x56
	mov r2, #0x24
	bl ov01_0232E27C
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov01_0232D3C4

	arm_func_start ov01_0232D524
ov01_0232D524: ; 0x0232D524
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232D524

	arm_func_start ov01_0232D55C
ov01_0232D55C: ; 0x0232D55C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232D55C

	arm_func_start ov01_0232D590
ov01_0232D590: ; 0x0232D590
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232D590

	arm_func_start ov01_0232D5C4
ov01_0232D5C4: ; 0x0232D5C4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r6, r0
	mov r5, r1
	add r0, sp, #4
	add r1, r6, #0x50
	mov r2, #0x40
	bl InitBitstreamForWrite
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ands r4, r0, #0xff
	beq _0232D650
	ldr ip, [r6, #0x94]
	add r0, sp, #4
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	mov ip, ip, lsl #0x18
	orr r1, r2, r1
	and r3, r3, #0xff0000
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	mov r2, r1, lsl #0x18
	mov r1, r5
	mov r2, r2, asr #0x18
	bl ov01_0232E58C
_0232D650:
	add r0, sp, #4
	bl BitstreamDebug
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov01_0232D5C4

	arm_func_start ov01_0232D664
ov01_0232D664: ; 0x0232D664
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #0xa4]
	ldr ip, [r5, #0xc]
	add r0, r4, #0x1d
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	str r1, [r4, #0xa8]
	ldr lr, [r5, #0x20]
	mov r1, #0x14
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	str r2, [r4, #0x14]
	ldr lr, [r5, #0x24]
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	str r2, [r4, #0x18]
	bl MemZero
	add r0, r4, #0x1d
	add r1, r5, #0x38
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	ldr r3, [r5, #0x4c]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r1, r1, r0
	mov r0, r1, lsr #0x10
	strh r0, [r4, #0xa2]
	strh r1, [r4, #0xa0]
	ldr r3, [r5, #0x94]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4, #0x1c]
	ldr ip, [r5, #0x90]
	add r0, r4, #0x32
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x24
	strb r2, [r4, #0xae]
	bl MemZero
	add r0, r4, #0x56
	mov r1, #0x48
	bl MemZero
	add r0, r4, #0x32
	add r1, r5, #0x98
	mov r2, #0x12
	bl ov01_0232E2D8
	add r0, r4, #0x56
	add r1, r5, #0xbc
	mov r2, #0x24
	bl ov01_0232E2D8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov01_0232D664

	arm_func_start ov01_0232D83C
ov01_0232D83C: ; 0x0232D83C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x7c
	bl MemZero
	bl ov01_0232E22C
	str r0, [r5]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl ov01_0232E1C4
	stmib r5, {r0, r1}
	ldrsh r3, [r4, #0xa2]
	ldrh r2, [r4, #0xa0]
	add r0, r5, #0x10
	add r1, r4, #0x32
	orr r6, r2, r3, lsl #16
	mov r2, r6, lsl #0x18
	and lr, r2, #0xff000000
	mov r2, r6, lsl #8
	and ip, r2, #0xff0000
	mov r2, r6, lsr #0x18
	and r3, r2, #0xff
	mov r2, r6, lsr #8
	and r2, r2, #0xff00
	orr r2, r3, r2
	orr r2, ip, r2
	orr r2, lr, r2
	str r2, [r5, #0xc]
	mov r2, #0x12
	bl ov01_0232E27C
	add r0, r5, #0x34
	add r1, r4, #0x56
	mov r2, #0x24
	bl ov01_0232E27C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232D83C

	arm_func_start ov01_0232D8C8
ov01_0232D8C8: ; 0x0232D8C8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232D8C8

	arm_func_start ov01_0232D8FC
ov01_0232D8FC: ; 0x0232D8FC
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232D8FC

	arm_func_start ov01_0232D930
ov01_0232D930: ; 0x0232D930
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	str r0, [r4, #0x14]
	ldr ip, [r5, #0xc]
	add r0, r4, #0x32
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	str r1, [r4, #0x18]
	ldr lr, [r5, #0x20]
	mov r1, #0x24
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r3, r3, r2
	mov r2, r3, lsr #0x10
	strh r2, [r4, #0xa2]
	strh r3, [r4, #0xa0]
	bl MemZero
	add r0, r4, #0x56
	mov r1, #0x48
	bl MemZero
	add r0, r4, #0x32
	add r1, r5, #0x24
	mov r2, #0x12
	bl ov01_0232E2D8
	add r0, r4, #0x56
	add r1, r5, #0x48
	mov r2, #0x24
	bl ov01_0232E2D8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov01_0232D930

	arm_func_start ov01_0232DA1C
ov01_0232DA1C: ; 0x0232DA1C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x68
	mov r5, r1
	mov r7, r0
	mov r1, #0x10c
	mov r4, #1
	bl MemZero
	bl ov01_0232E22C
	str r0, [r7]
	bl sub_02050CD0
	mov sb, r0
	bl sub_02050CD0
	mov r8, r0
	bl sub_02050CD0
	mov r6, r0
	bl sub_02050CD0
	mov r2, r8, lsl #8
	and r3, r2, #0xff0000
	mov r2, r6, lsr #0x18
	mov r0, r0, lsr #8
	mov r1, sb, lsl #0x18
	and r2, r2, #0xff
	and r0, r0, #0xff00
	orr r0, r2, r0
	and r1, r1, #0xff000000
	orr r0, r3, r0
	orr r0, r1, r0
	str r0, [r7, #4]
	mov r0, r5, lsl #0x18
	and r1, r0, #0xff000000
	mov r0, r5, lsl #8
	and r0, r0, #0xff0000
	orr r0, r1, r0
	str r0, [r7, #8]
	add r1, r7, #0xc
	add r0, sp, #0xc
	mov r2, #0x100
	bl InitBitstreamForRead
	add r0, sp, #2
	mov r1, #0
	bl sub_02057030
	strb r0, [sp]
	tst r0, #0xff
	add r0, sp, #0xc
	bne _0232DADC
	bl BitstreamDebug
	mov r0, #0
	b _0232DB8C
_0232DADC:
	add r1, sp, #0
	mov r2, #3
	bl CopyBitsTo
	mov sl, #0
	add sb, sp, #2
	add r7, sp, #0x1c
	add r6, sp, #0xc
	b _0232DB74
_0232DAFC:
	mov r0, sl, lsl #1
	ldrsh r0, [sb, r0]
	bl GetTeamMember
	mov r8, r0
	mov r0, r7
	mov r1, r8
	bl sub_02055E14
	mov r0, r6
	mov r1, r7
	mov r2, r5
	bl ov01_0232E334
	ldrsh r0, [r8, #4]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	bne _0232DB68
	add r0, r8, #0x22
	bl IsMovesetValid
	cmp r0, #0
	beq _0232DB68
	ldrb r0, [r8, #1]
	cmp r0, #1
	blo _0232DB68
	cmp r0, #0x64
	bhi _0232DB68
	ldrb r0, [r8, #0x20]
	cmp r0, #0xb
	blo _0232DB70
_0232DB68:
	mov r4, #0
	b _0232DB80
_0232DB70:
	add sl, sl, #1
_0232DB74:
	ldrb r0, [sp]
	cmp sl, r0
	blt _0232DAFC
_0232DB80:
	add r0, sp, #0xc
	bl BitstreamDebug
	mov r0, r4
_0232DB8C:
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov01_0232DA1C

	arm_func_start ov01_0232DB94
ov01_0232DB94: ; 0x0232DB94
	ldr r2, [r0, #4]
	ldr ip, _0232DBA8 ; =ov01_0232E1C4
	ldr r1, [r0, #8]
	mov r0, r2
	bx ip
	.align 2, 0
_0232DBA8: .word ov01_0232E1C4
	arm_func_end ov01_0232DB94

	arm_func_start ov01_0232DBAC
ov01_0232DBAC: ; 0x0232DBAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r1
	mov r1, #0x18
	mov sb, r0
	mov r7, r2
	mov r6, r3
	ldr r5, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	bl MemZero
	bl ov01_0232E22C
	mov sl, r8, lsr #0x18
	mov ip, r8, lsr #8
	mov fp, r8, lsl #8
	mov r2, r7, lsr #0x18
	mov r1, r7, lsr #8
	str r0, [sb]
	mov r0, r8, lsl #0x18
	mov lr, r7, lsl #8
	and r3, r0, #0xff000000
	and r0, fp, #0xff0000
	and sl, sl, #0xff
	and r8, ip, #0xff00
	orr r8, sl, r8
	mov ip, r6, lsr #0x18
	orr r0, r0, r8
	mov r8, r6, lsr #8
	orr r3, r3, r0
	mov r0, r7, lsl #0x18
	mov r7, r6, lsl #8
	str r3, [sb, #4]
	mov r3, r5, lsr #0x18
	and r0, r0, #0xff000000
	and lr, lr, #0xff0000
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	mov r2, r5, lsr #8
	orr r1, lr, r1
	mov lr, r6, lsl #0x18
	mov r6, r5, lsl #8
	orr r0, r0, r1
	mov r1, r4, lsr #0x18
	str r0, [sb, #8]
	mov r0, r4, lsr #8
	and lr, lr, #0xff000000
	and r7, r7, #0xff0000
	and ip, ip, #0xff
	and r8, r8, #0xff00
	orr r8, ip, r8
	orr r7, r7, r8
	mov r5, r5, lsl #0x18
	mov r8, r4, lsl #8
	orr r7, lr, r7
	mov r4, r4, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and r6, r6, #0xff0000
	orr r2, r3, r2
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r5, r5, #0xff000000
	orr r3, r6, r2
	and r2, r8, #0xff0000
	orr r0, r1, r0
	str r7, [sb, #0xc]
	orr r3, r5, r3
	and r1, r4, #0xff000000
	orr r0, r2, r0
	str r3, [sb, #0x10]
	orr r0, r1, r0
	str r0, [sb, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov01_0232DBAC

	arm_func_start ov01_0232DCCC
ov01_0232DCCC: ; 0x0232DCCC
	ldr r3, [r0, #8]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ov01_0232DCCC

	arm_func_start ov01_0232DD00
ov01_0232DD00: ; 0x0232DD00
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r5, r3
	mov fp, r0
	mov r7, r1
	mov r6, r2
	bl ov01_0232DCCC
	cmp r5, r0
	movhs r5, r0
	mov sb, #0
	b _0232DE64
_0232DD2C:
	mov r0, #0x124
	mul r1, sb, r0
	mov r0, #0x148
	mul r8, sb, r0
	add r2, fp, #0xc
	mov r0, #0
	add sl, r2, r1
	str r0, [sp]
	ldmia sl, {r0, r1}
	add r4, r7, r8
	bl ov01_0232E1C4
	str r0, [r6, sb, lsl #3]
	add r0, r6, sb, lsl #3
	str r1, [r0, #4]
	ldr ip, [sl, #0x20]
	add r0, r4, #2
	mov r2, ip, lsl #0x18
	mov r1, ip, lsr #0x18
	and r3, r2, #0xff000000
	mov r2, ip, lsl #8
	mov ip, ip, lsr #8
	and r1, r1, #0xff
	and ip, ip, #0xff00
	and r2, r2, #0xff0000
	orr r1, r1, ip
	orr r1, r2, r1
	orr r1, r3, r1
	strb r1, [r7, r8]
	ldr ip, [sl, #0x1c]
	mov r1, #0x14
	mov r3, ip, lsl #0x18
	mov r2, ip, lsr #0x18
	and r8, r3, #0xff000000
	mov r3, ip, lsl #8
	mov ip, ip, lsr #8
	and r2, r2, #0xff
	and ip, ip, #0xff00
	and r3, r3, #0xff0000
	orr r2, r2, ip
	orr r2, r3, r2
	orr r2, r8, r2
	strb r2, [r4, #1]
	bl MemZero
	add r0, r4, #2
	add r1, sl, #8
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	add r1, sl, #0x24
	add r0, sp, #4
	mov r2, #0x100
	bl InitBitstreamForWrite
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #3
	bl CopyBitsFrom
	mov sl, #0
	add r8, r4, #0x18
	b _0232DE2C
_0232DE14:
	mov r0, #0x4c
	mla r1, sl, r0, r8
	ldrsb r2, [r4]
	add r0, sp, #4
	bl ov01_0232E58C
	add sl, sl, #1
_0232DE2C:
	ldr r3, [sp]
	cmp sl, r3
	blt _0232DE14
	mov r2, #0
	mov r0, #0x4c
	b _0232DE50
_0232DE44:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x20]
	add r3, r3, #1
_0232DE50:
	cmp r3, #4
	blt _0232DE44
	add r0, sp, #4
	bl BitstreamDebug
	add sb, sb, #1
_0232DE64:
	cmp sb, r5
	blt _0232DD2C
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov01_0232DD00

	arm_func_start ov01_0232DE74
ov01_0232DE74: ; 0x0232DE74
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232DE74

	arm_func_start ov01_0232DEA8
ov01_0232DEA8: ; 0x0232DEA8
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232DEA8

	arm_func_start ov01_0232DEE0
ov01_0232DEE0: ; 0x0232DEE0
	ldr r3, [r0, #0x124]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232DEE0

	arm_func_start ov01_0232DF18
ov01_0232DF18: ; 0x0232DF18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r2, #0
	mov r5, r0
	str r2, [sp]
	ldr r3, [r5, #0x20]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	mov r3, r3, lsl #0x18
	orr r0, r1, r0
	and r2, r2, #0xff0000
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4]
	ldr r6, [r5, #0x1c]
	add r0, r4, #2
	mov r2, r6, lsr #0x18
	mov r1, r6, lsr #8
	mov r3, r6, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	mov r6, r6, lsl #0x18
	orr r1, r2, r1
	and r3, r3, #0xff0000
	and r2, r6, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x14
	strb r2, [r4, #1]
	bl MemZero
	add r0, r4, #2
	add r1, r5, #8
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	add r0, sp, #4
	add r1, r5, #0x24
	mov r2, #0x100
	bl InitBitstreamForWrite
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #3
	bl CopyBitsFrom
	mov r8, #0
	add r6, r4, #0x18
	add r7, sp, #4
	mov r5, #0x4c
	b _0232DFFC
_0232DFE8:
	mla r1, r8, r5, r6
	ldrsb r2, [r4]
	mov r0, r7
	bl ov01_0232E58C
	add r8, r8, #1
_0232DFFC:
	ldr r3, [sp]
	cmp r8, r3
	blt _0232DFE8
	mov r2, #0
	mov r0, #0x4c
	b _0232E020
_0232E014:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x20]
	add r3, r3, #1
_0232E020:
	cmp r3, #4
	blt _0232E014
	add r0, sp, #4
	bl BitstreamDebug
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov01_0232DF18

	arm_func_start ov01_0232E038
ov01_0232E038: ; 0x0232E038
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r4, r2
	mov r1, #0xc
	bl MemZero
	bl ov01_0232E22C
	str r0, [r6]
	mov r0, r5
	mov r1, r4
	bl ov01_0232E1C4
	stmib r6, {r0, r1}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232E038

	arm_func_start ov01_0232E06C
ov01_0232E06C: ; 0x0232E06C
	ldr r3, [r0, #4]
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov01_0232E06C

	arm_func_start ov01_0232E0A4
ov01_0232E0A4: ; 0x0232E0A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r2, #0
	mov r5, r0
	str r2, [sp]
	ldr r3, [r5, #0x20]
	mov r4, r1
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	mov r3, r3, lsl #0x18
	orr r0, r1, r0
	and r2, r2, #0xff0000
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	strb r0, [r4]
	ldr r6, [r5, #0x1c]
	add r0, r4, #2
	mov r2, r6, lsr #0x18
	mov r1, r6, lsr #8
	mov r3, r6, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	mov r6, r6, lsl #0x18
	orr r1, r2, r1
	and r3, r3, #0xff0000
	and r2, r6, #0xff000000
	orr r1, r3, r1
	orr r2, r2, r1
	mov r1, #0x14
	strb r2, [r4, #1]
	bl MemZero
	add r0, r4, #2
	add r1, r5, #8
	mov r2, #0x14
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	add r0, sp, #4
	add r1, r5, #0x24
	mov r2, #0x100
	bl InitBitstreamForWrite
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #3
	bl CopyBitsFrom
	mov r8, #0
	add r6, r4, #0x18
	add r7, sp, #4
	mov r5, #0x4c
	b _0232E188
_0232E174:
	mla r1, r8, r5, r6
	ldrsb r2, [r4]
	mov r0, r7
	bl ov01_0232E58C
	add r8, r8, #1
_0232E188:
	ldr r3, [sp]
	cmp r8, r3
	blt _0232E174
	mov r2, #0
	mov r0, #0x4c
	b _0232E1AC
_0232E1A0:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x20]
	add r3, r3, #1
_0232E1AC:
	cmp r3, #4
	blt _0232E1A0
	add r0, sp, #4
	bl BitstreamDebug
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov01_0232E0A4

	arm_func_start ov01_0232E1C4
ov01_0232E1C4: ; 0x0232E1C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0, lsr #0x18
	mov r4, r0, lsr #8
	mov r3, r1, lsr #0x18
	mov r2, r1, lsr #8
	mov r6, r0, lsl #8
	mov ip, r1, lsl #8
	mov r0, r0, lsl #0x18
	mov lr, r1, lsl #0x18
	and r5, r5, #0xff
	and r4, r4, #0xff00
	and r3, r3, #0xff
	and r1, r2, #0xff00
	and r6, r6, #0xff0000
	orr r4, r5, r4
	and r2, ip, #0xff0000
	orr r1, r3, r1
	and r3, r0, #0xff000000
	orr r0, r6, r4
	orr r4, r3, r0
	and r3, lr, #0xff000000
	orr r0, r2, r1
	orr r0, r3, r0
	orr r1, r4, #0
	orr r0, r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232E1C4

	arm_func_start ov01_0232E22C
ov01_0232E22C: ; 0x0232E22C
	stmdb sp!, {r4, r5, r6, lr}
	bl ov00_022BCCC8
	mov r6, r0
	bl ov00_022BCCC8
	mov r5, r0
	bl ov00_022BCCC8
	mov r4, r0
	bl ov00_022BCCC8
	mov r1, r4, lsr #0x18
	mov r0, r0, lsr #8
	mov r2, r5, lsl #8
	mov r3, r6, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov01_0232E22C

	arm_func_start ov01_0232E27C
ov01_0232E27C: ; 0x0232E27C
	stmdb sp!, {r4, lr}
	mov r4, #0
	b _0232E2AC
_0232E288:
	mov lr, r4, lsl #1
	ldrh r3, [r1, lr]
	add r4, r4, #1
	mov ip, r3, asr #8
	mov r3, r3, lsl #8
	and ip, ip, #0xff
	and r3, r3, #0xff00
	orr r3, ip, r3
	strh r3, [r0, lr]
_0232E2AC:
	mov r3, r4, lsl #1
	ldrh r3, [r1, r3]
	cmp r3, #0
	beq _0232E2C4
	cmp r4, r2
	blt _0232E288
_0232E2C4:
	cmp r4, r2
	movlt r1, r4, lsl #1
	movlt r2, #0
	strlth r2, [r0, r1]
	ldmia sp!, {r4, pc}
	arm_func_end ov01_0232E27C

	arm_func_start ov01_0232E2D8
ov01_0232E2D8: ; 0x0232E2D8
	stmdb sp!, {r4, lr}
	mov r4, #0
	b _0232E308
_0232E2E4:
	mov lr, r4, lsl #1
	ldrh r3, [r1, lr]
	add r4, r4, #1
	mov ip, r3, asr #8
	mov r3, r3, lsl #8
	and ip, ip, #0xff
	and r3, r3, #0xff00
	orr r3, ip, r3
	strh r3, [r0, lr]
_0232E308:
	mov r3, r4, lsl #1
	ldrh r3, [r1, r3]
	cmp r3, #0
	beq _0232E320
	cmp r4, r2
	blt _0232E2E4
_0232E320:
	cmp r4, r2
	movlt r1, r4, lsl #1
	movlt r2, #0
	strlth r2, [r0, r1]
	ldmia sp!, {r4, pc}
	arm_func_end ov01_0232E2D8

	arm_func_start ov01_0232E334
ov01_0232E334: ; 0x0232E334
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	ldr r3, _0232E588 ; =ov01_0233AF10
	mov r5, r2
	ldrh r2, [r3]
	mov r7, r0
	mov r6, r1
	strh r2, [sp, #8]
	ldrh r4, [r3, #2]
	mov r3, #0
	mov r2, #4
	strh r4, [sp, #0xa]
	str r3, [sp, #4]
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #4
	mov r2, #7
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #5
	bl Copy16BitsTo
	mov r0, r7
	add r1, r6, #8
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0xa
	bl sub_02059AF8
	mov r0, r7
	add r1, r6, #0xb
	bl sub_02059AF8
	mov r0, r7
	add r1, r6, #0xc
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0xe
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x10
	mov r2, #8
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x11
	mov r2, #8
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x12
	mov r2, #8
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x13
	mov r2, #8
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x14
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x18
	mov r2, #0x45
	bl CopyBitsTo
	mov r0, r7
	add r1, r6, #0x24
	mov r2, #4
	bl CopyBitsTo
	mov r0, r7
	add r1, sp, #4
	mov r2, #3
	bl CopyBitsTo
	mov r0, r7
	add r1, sp, #8
	bl sub_0200DFE4
	mov r0, r7
	add r1, r6, #0x2a
	bl CopyMovesetToStream
	add r0, sp, #0xc
	mov r1, #0x18
	bl MemZero
	cmp r5, #0
	mov r5, #0
	beq _0232E4FC
	mov r0, #0x14
	mov r1, #0
	bl MemAlloc
	add r1, r6, #0x42
	mov r2, #0xa
	mov r4, r0
#ifdef JAPAN
	bl StrcpyName
#else
	bl sub_02025404
#endif
	add r1, sp, #0xc
	b _0232E4D4
_0232E4A4:
	mov r3, r5, lsl #1
	ldrh r0, [r4, r3]
	mov r2, r0, asr #8
	mov r0, r0, lsl #8
	and r2, r2, #0xff
	and r0, r0, #0xff00
	orr r0, r2, r0
	strh r0, [r1, r3]
	ldrh r0, [r1, r3]
	cmp r0, #0
	beq _0232E4DC
	add r5, r5, #1
_0232E4D4:
	cmp r5, #0xa
	blt _0232E4A4
_0232E4DC:
	cmp r5, #0xa
	addne r0, sp, #0xc
	movne r1, r5, lsl #1
	movne r2, #0
	strneh r2, [r0, r1]
	mov r0, r4
	bl MemFree
	b _0232E570
_0232E4FC:
	ldrsh r0, [r6, #8]
	bl GetNameString
	str r0, [sp]
	add r6, sp, #0xc
	add r4, sp, #0
	b _0232E54C
_0232E514:
	mov r0, r4
	bl sub_0202065C
	mov sb, r0
	bl sub_02025480
	mov r8, r0
	mov r0, sb
	bl sub_02025480
	mov r1, r0, asr #8
	mov r0, r8, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [r6], #2
	add r5, r5, #1
_0232E54C:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0232E564
	cmp r5, #0xa
	blt _0232E514
_0232E564:
	cmp r5, #0xa
	movlt r0, #0
	strlth r0, [r6]
_0232E570:
	add r1, sp, #0xc
	mov r0, r7
	mov r2, #0xa0
	bl CopyBitsTo
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232E588: .word ov01_0233AF10
	arm_func_end ov01_0232E334

	arm_func_start ov01_0232E58C
ov01_0232E58C: ; 0x0232E58C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	mov r4, r2
	mov r5, r1
	mov r2, #4
	mov r6, r0
	bl CopyBitsFrom
	ldrh r2, [r5]
	mov r0, r6
	add r1, r5, #4
	and r3, r2, #1
	mov r2, #7
	strh r3, [r5]
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #5
	bl Copy16BitsFrom
	mov r0, r6
	add r1, r5, #8
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0xa
	bl sub_02059AE8
	mov r0, r6
	add r1, r5, #0xb
	bl sub_02059AE8
	mov r0, r6
	add r1, r5, #0xc
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0xe
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x10
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x11
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x12
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x13
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x14
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x18
	mov r2, #0x45
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x24
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x25
	mov r2, #3
	bl CopyBitsFrom
	mov r0, r6
	add r1, r5, #0x26
	bl sub_0200DFBC
	mov r2, #0
	strh r2, [r5, #0x26]
	mov r0, r6
	add r1, r5, #0x2a
	strh r2, [r5, #0x28]
	bl CopyMovesetFromStream
	add r1, sp, #0
	mov r0, r6
	mov r2, #0xa0
	bl CopyBitsFrom
	bl GetLanguageType
	cmp r4, r0
	bne _0232E748
	mov r0, #0x14
	mov r1, #0
	bl MemAlloc
	mov r4, r0
	mov ip, #0
	add r2, sp, #0
	b _0232E724
_0232E6F4:
	mov r3, ip, lsl #1
	ldrh r0, [r2, r3]
	mov r1, r0, asr #8
	mov r0, r0, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [r4, r3]
	ldrh r0, [r4, r3]
	cmp r0, #0
	beq _0232E72C
	add ip, ip, #1
_0232E724:
	cmp ip, #0xa
	blt _0232E6F4
_0232E72C:
	mov r1, r4
	add r0, r5, #0x42
	mov r2, #0xa
#ifdef JAPAN
	bl sub_020253E0_JP
#else
	bl sub_0202544C
#endif
	mov r0, r4
	bl MemFree
	b _0232E760
_0232E748:
	ldrsh r0, [r5, #8]
	bl GetNameString
	mov r1, r0
	add r0, r5, #0x42
	mov r2, #0xa
	bl StrncpyName
_0232E760:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov01_0232E58C

	arm_func_start ov01_0232E768
ov01_0232E768: ; 0x0232E768
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x54
	mov r1, #1
	bl MemAlloc
	mov r5, r0
	ldr r0, _0232E7B8 ; =ov01_0233C148
	ldr r4, _0232E7BC ; =ov01_0233AF64
	str r5, [r0]
	add lr, r5, #0x2c
	mov ip, #2
_0232E790:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232E790
	ldr r1, [r4]
	mov r0, #0
	str r1, [lr]
	str r0, [r5, #0x50]
	bl ov01_0232E7E8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232E7B8: .word ov01_0233C148
_0232E7BC: .word ov01_0233AF64
	arm_func_end ov01_0232E768

	arm_func_start ov01_0232E7C0
ov01_0232E7C0: ; 0x0232E7C0
	stmdb sp!, {r3, lr}
	bl ov01_0232E7E8
	ldr r0, _0232E7E4 ; =ov01_0233C148
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232E7E4 ; =ov01_0233C148
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232E7E4: .word ov01_0233C148
	arm_func_end ov01_0232E7C0

	arm_func_start ov01_0232E7E8
ov01_0232E7E8: ; 0x0232E7E8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	ldr r0, _0232E8D0 ; =ov01_0233C148
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #2
	bne _0232E830
	ldr r0, _0232E8D4 ; =ov01_0233AF64
	mov r1, r4
	bl ov01_0232E8D8
	cmp r0, #0
	bne _0232E830
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0232E830
	mov r0, #1
	blx r1
_0232E830:
	ldr r0, _0232E8D0 ; =ov01_0233C148
	mov r1, #0
	ldr r0, [r0]
	ldr lr, _0232E8D4 ; =ov01_0233AF64
	add ip, sp, #0
	strb r1, [r0]
	mov r5, #2
_0232E84C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0232E84C
	ldr r0, _0232E8D0 ; =ov01_0233C148
	ldr r1, [lr]
	ldr r6, [r0]
	str r1, [ip]
	add r5, sp, #0
	add lr, r6, #4
	mov ip, #2
_0232E878:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232E878
	ldr r1, [r5]
	mov r0, #0
	str r1, [lr]
	add lr, sp, #0
	strb r0, [r6, #0x28]
	mov ip, #2
_0232E8A0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232E8A0
	ldr r1, [lr]
	ldr r0, _0232E8D0 ; =ov01_0233C148
	str r1, [r4]
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0, #0x50]
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232E8D0: .word ov01_0233C148
_0232E8D4: .word ov01_0233AF64
	arm_func_end ov01_0232E7E8

	arm_func_start ov01_0232E8D8
ov01_0232E8D8: ; 0x0232E8D8
	cmp r0, #0
	ldreq r0, _0232E948 ; =ov01_0233AF64
	cmp r1, #0
	ldreq r1, _0232E948 ; =ov01_0233AF64
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r3, [r0, #0x18]
	ldreq r2, [r1, #0x18]
	cmpeq r3, r2
	ldreq r3, [r0, #0x14]
	ldreq r2, [r1, #0x14]
	cmpeq r3, r2
	ldreq r3, [r0, #0x1c]
	ldreq r2, [r1, #0x1c]
	cmpeq r3, r2
	ldreq r2, [r0, #0x20]
	ldreq r0, [r1, #0x20]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0232E948: .word ov01_0233AF64
	arm_func_end ov01_0232E8D8

	arm_func_start ov01_0232E94C
ov01_0232E94C: ; 0x0232E94C
	stmdb sp!, {r3, lr}
	ldr r0, _0232E998 ; =ov01_0233C148
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	ldreqb r0, [r1, #0x28]
	cmpeq r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x50]
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x38]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232E998: .word ov01_0233C148
	arm_func_end ov01_0232E94C

	arm_func_start ov01_0232E99C
ov01_0232E99C: ; 0x0232E99C
	stmdb sp!, {r4, lr}
	ldr r1, _0232EA2C ; =ov01_0233C148
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl ov01_0232E8D8
	cmp r0, #0
	bne _0232EA24
	ldr r0, _0232EA2C ; =ov01_0233C148
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0232E9E4
	mov r0, r4
	add r1, r2, #4
	bl ov01_0232E8D8
	mov r0, #0
	ldmia sp!, {r4, pc}
_0232E9E4:
	mov r1, #1
	strb r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov ip, #2
	add lr, r0, #4
_0232EA04:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232EA04
	ldr r1, [r4]
	mov r0, #1
	str r1, [lr]
	ldmia sp!, {r4, pc}
_0232EA24:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232EA2C: .word ov01_0233C148
	arm_func_end ov01_0232E99C

	arm_func_start ov01_0232EA30
ov01_0232EA30: ; 0x0232EA30
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	ldr r0, _0232EC28 ; =ov01_0233C148
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #1
	beq _0232EC20
	cmp r0, #2
	bne _0232EB00
	add ip, sp, #0
	mov lr, r4
	mov r5, #2
_0232EA64:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0232EA64
	ldr r0, [lr]
	str r0, [ip]
	ldr r0, [r4, #0x14]
	blx r0
	cmp r0, #1
	bne _0232EB00
	add r1, sp, #0
	mov r0, r4
	bl ov01_0232E8D8
	cmp r0, #0
	beq _0232EB00
	ldr r0, _0232EC28 ; =ov01_0233C148
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x50]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0232EAC4
	mov r0, #1
	blx r1
_0232EAC4:
	ldr r5, _0232EC2C ; =ov01_0233AF64
	mov lr, r4
	mov ip, #2
_0232EAD0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232EAD0
	ldr r1, [r5]
	ldr r0, _0232EC28 ; =ov01_0233C148
	str r1, [lr]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0232EB00:
	ldr r0, _0232EC28 ; =ov01_0233C148
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0232EBAC
	ldr r0, _0232EC2C ; =ov01_0233AF64
	mov r1, r4
	bl ov01_0232E8D8
	cmp r0, #0
	bne _0232EB44
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0232EB44
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0232EC20
_0232EB44:
	ldr r0, _0232EC28 ; =ov01_0233C148
	mov ip, #2
	ldr r5, [r0]
	add lr, r5, #4
_0232EB54:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232EB54
	ldr r0, [lr]
	mov r1, #0
	str r0, [r4]
	ldr r0, _0232EC28 ; =ov01_0233C148
	strb r1, [r5]
	ldr r5, [r0]
	ldr lr, _0232EC2C ; =ov01_0233AF64
	add ip, r5, #4
	mov r4, #2
_0232EB88:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0232EB88
	ldr r1, [lr]
	mov r0, #1
	str r1, [ip]
	str r0, [r5, #0x50]
	b _0232EC20
_0232EBAC:
	ldrb r0, [r1, #0x28]
	cmp r0, #0
	beq _0232EC20
	ldr r0, _0232EC2C ; =ov01_0233AF64
	mov r1, r4
	bl ov01_0232E8D8
	cmp r0, #0
	bne _0232EBE8
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0232EBE8
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0232EC20
_0232EBE8:
	ldr lr, _0232EC2C ; =ov01_0233AF64
	mov ip, #2
_0232EBF0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0232EBF0
	ldr r1, [lr]
	ldr r0, _0232EC28 ; =ov01_0233C148
	str r1, [r4]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0232EC20:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0232EC28: .word ov01_0233C148
_0232EC2C: .word ov01_0233AF64
	arm_func_end ov01_0232EA30

	arm_func_start ov01_0232EC30
ov01_0232EC30: ; 0x0232EC30
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0232ED54 ; =ov01_0233C148
	ldr lr, [r0]
	ldr r0, [lr, #0x50]
	add ip, lr, #0x2c
	cmp r0, #2
	bne _0232EC60
	ldr r0, [ip, #0x18]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	blx r0
	ldmia sp!, {r4, r5, r6, pc}
_0232EC60:
	cmp r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [lr]
	cmp r0, #0
	beq _0232ECC4
	mov r5, ip
	add r6, lr, #4
	mov r4, #2
_0232EC80:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0232EC80
	ldr r0, [r6]
	ldr r6, _0232ED58 ; =ov01_0233AF64
	str r0, [r5]
	add r5, lr, #4
	mov r4, #2
_0232ECA4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0232ECA4
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	strb r0, [lr]
_0232ECC4:
	ldr r0, _0232ED54 ; =ov01_0233C148
	ldr lr, [r0]
	ldrb r0, [lr, #0x28]
	cmp r0, #0
	beq _0232ED10
	ldr r5, _0232ED58 ; =ov01_0233AF64
	mov r4, #2
_0232ECE0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0232ECE0
	ldr r0, [r5]
	mov r1, #0
	str r0, [ip]
	ldr r0, _0232ED54 ; =ov01_0233C148
	strb r1, [lr, #0x28]
	ldr r0, [r0]
	str r1, [r0, #0x50]
	ldmia sp!, {r4, r5, r6, pc}
_0232ED10:
	ldr r0, [ip, #4]
	cmp r0, #0
	beq _0232ED48
	blx r0
	cmp r0, #0
	ldreq r0, _0232ED54 ; =ov01_0233C148
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	ldrne r0, _0232ED54 ; =ov01_0233C148
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x50]
	ldmia sp!, {r4, r5, r6, pc}
_0232ED48:
	mov r0, #2
	str r0, [lr, #0x50]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232ED54: .word ov01_0233C148
_0232ED58: .word ov01_0233AF64
	arm_func_end ov01_0232EC30

	arm_func_start ov01_0232ED5C
ov01_0232ED5C: ; 0x0232ED5C
	stmdb sp!, {r3, lr}
	ldr r0, _0232ED80 ; =ov01_0233C148
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x48]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232ED80: .word ov01_0233C148
	arm_func_end ov01_0232ED5C

	arm_func_start ov01_0232ED84
ov01_0232ED84: ; 0x0232ED84
	stmdb sp!, {r3, lr}
	ldr r0, _0232EDA8 ; =ov01_0233C148
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x4c]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232EDA8: .word ov01_0233C148
	arm_func_end ov01_0232ED84

	arm_func_start ov01_0232EDAC
ov01_0232EDAC: ; 0x0232EDAC
	ldr ip, _0232EDB8 ; =ov01_0232E99C
	ldr r0, _0232EDBC ; =ov01_0233AF88
	bx ip
	.align 2, 0
_0232EDB8: .word ov01_0232E99C
_0232EDBC: .word ov01_0233AF88
	arm_func_end ov01_0232EDAC

	arm_func_start ov01_0232EDC0
ov01_0232EDC0: ; 0x0232EDC0
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0232EDE8 ; =ov01_0233C14C
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232EDE8: .word ov01_0233C14C
	arm_func_end ov01_0232EDC0

	arm_func_start ov01_0232EDEC
ov01_0232EDEC: ; 0x0232EDEC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0232EE10
	ldr r0, _0232EE30 ; =ov01_0233C14C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0232EE10:
	ldr r0, _0232EE30 ; =ov01_0233C14C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232EE30 ; =ov01_0233C14C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232EE30: .word ov01_0233C14C
	arm_func_end ov01_0232EDEC

	arm_func_start ov01_0232EE34
ov01_0232EE34: ; 0x0232EE34
	ldr r0, _0232EE54 ; =ov01_0233C14C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0232EE54: .word ov01_0233C14C
	arm_func_end ov01_0232EE34

	arm_func_start ov01_0232EE58
ov01_0232EE58: ; 0x0232EE58
	stmdb sp!, {r3, lr}
	ldr r0, _0232EF24 ; =ov01_0233C14C
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0232EF1C
_0232EE74: ; jump table
	b _0232EE8C ; case 0
	b _0232EEF0 ; case 1
	b _0232EF1C ; case 2
	b _0232EF0C ; case 3
	b _0232EF1C ; case 4
	b _0232EF0C ; case 5
_0232EE8C:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _0232EF1C
	bl ov00_022BE6C0
	cmp r0, #0x100
	ldreq r0, _0232EF24 ; =ov01_0233C14C
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0232EF1C
	bl ov00_022BE6C0
	mvn r1, #0xff
	cmp r0, r1
	ldreq r0, _0232EF24 ; =ov01_0233C14C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0232EF1C
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232EF24 ; =ov01_0233C14C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0232EF1C
_0232EEF0:
	bl ov00_022BE6AC
	cmp r0, #0
	ldreq r0, _0232EF24 ; =ov01_0233C14C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0232EF1C
_0232EF0C:
	mov r0, #6
	str r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
_0232EF1C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232EF24: .word ov01_0233C14C
	arm_func_end ov01_0232EE58

	arm_func_start ov01_0232EF28
ov01_0232EF28: ; 0x0232EF28
	ldr r0, _0232EF48 ; =ov01_0233C14C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0232EF48: .word ov01_0233C14C
	arm_func_end ov01_0232EF28

	arm_func_start ov01_0232EF4C
ov01_0232EF4C: ; 0x0232EF4C
	stmdb sp!, {r3, lr}
	ldr r0, _0232EFA4 ; =ov01_0233C14C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	ldmneia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
	ldr r0, _0232EFA4 ; =ov01_0233C14C
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #2
	moveq r0, #3
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232EFA4: .word ov01_0233C14C
	arm_func_end ov01_0232EF4C

	arm_func_start ov01_0232EFA8
ov01_0232EFA8: ; 0x0232EFA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0232EFE0 ; =ov01_0233AFAC
	bl ov01_0232E99C
	cmp r0, #0
	ldrne r0, _0232EFE4 ; =ov01_0233C150
	strne r4, [r0, #4]
	ldmneia sp!, {r4, pc}
	ldr r0, _0232EFE4 ; =ov01_0233C150
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, r4
	strne r4, [r1, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232EFE0: .word ov01_0233AFAC
_0232EFE4: .word ov01_0233C150
	arm_func_end ov01_0232EFA8

	arm_func_start ov01_0232EFE8
ov01_0232EFE8: ; 0x0232EFE8
	stmdb sp!, {r3, lr}
	mov r0, #0x18
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0232F034 ; =ov01_0233C150
	str r0, [r1]
	bl ov01_0232F08C
	mov r0, #0x10
	bl ov00_022BE64C
	ldr r1, _0232F034 ; =ov01_0233C150
	mov r3, #0
	ldmia r1, {r2, ip}
	str ip, [r2, #0x10]
	ldr r2, [r1]
	mov r0, #1
	strb r3, [r2, #0x14]
	ldr r1, [r1]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F034: .word ov01_0233C150
	arm_func_end ov01_0232EFE8

	arm_func_start ov01_0232F038
ov01_0232F038: ; 0x0232F038
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0232F064
	ldr r0, _0232F088 ; =ov01_0233C150
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0x14]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0232F064:
	bl ov01_0232F08C
	ldr r0, _0232F088 ; =ov01_0233C150
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232F088 ; =ov01_0233C150
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F088: .word ov01_0233C150
	arm_func_end ov01_0232F038

	arm_func_start ov01_0232F08C
ov01_0232F08C: ; 0x0232F08C
	ldr r0, _0232F0BC ; =ov01_0233C150
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #0xc]
	ldr r0, [r0]
	str r3, [r0, #0x10]
	bx lr
	.align 2, 0
_0232F0BC: .word ov01_0233C150
	arm_func_end ov01_0232F08C

	arm_func_start ov01_0232F0C0
ov01_0232F0C0: ; 0x0232F0C0
	ldr r0, _0232F0DC ; =ov01_0233C150
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0232F0DC: .word ov01_0233C150
	arm_func_end ov01_0232F0C0

	arm_func_start ov01_0232F0E0
ov01_0232F0E0: ; 0x0232F0E0
	stmdb sp!, {r3, lr}
	ldr r0, _0232F288 ; =ov01_0233C150
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0232F280
_0232F0FC: ; jump table
	b _0232F11C ; case 0
	b _0232F144 ; case 1
	b _0232F280 ; case 2
	b _0232F280 ; case 3
	b _0232F1DC ; case 4
	b _0232F208 ; case 5
	b _0232F254 ; case 6
	b _0232F270 ; case 7
_0232F11C:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F288 ; =ov01_0233C150
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0xc]
	bne _0232F280
	ldr r0, _0232F288 ; =ov01_0233C150
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F144:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F288 ; =ov01_0233C150
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0xc]
	bne _0232F280
	ldr r0, _0232F288 ; =ov01_0233C150
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _0232F19C
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232F288 ; =ov01_0233C150
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	strb r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0232F280
_0232F19C:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _0232F280
	str r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #1
	strb r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _0232F280
_0232F1DC:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F288 ; =ov01_0233C150
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0xc]
	bne _0232F280
	ldr r0, _0232F288 ; =ov01_0233C150
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F208:
	ldr r0, _0232F288 ; =ov01_0233C150
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldreq r0, [r1, #0x10]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0xc]
	beq _0232F280
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232F288 ; =ov01_0233C150
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0xc]
	b _0232F280
_0232F254:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _0232F280
	ldr r0, _0232F288 ; =ov01_0233C150
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F270:
	ldr r0, _0232F288 ; =ov01_0233C150
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xc]
_0232F280:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F288: .word ov01_0233C150
	arm_func_end ov01_0232F0E0

	arm_func_start ov01_0232F28C
ov01_0232F28C: ; 0x0232F28C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _0232F334 ; =ov01_0233C150
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _0232F32C
	mov r0, #1
	strb r0, [r1, #0xc]
	bl ov01_0232F08C
	ldr r0, _0232F334 ; =ov01_0233C150
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0232F2E8
	mov r1, #0
	mov r2, r1
	mov r3, r1
	str r1, [sp]
	mov ip, #1
	str ip, [sp, #4]
	bl sub_02052060
_0232F2E8:
	ldr r0, _0232F334 ; =ov01_0233C150
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r0, [r0]
	cmp r0, #0
	beq _0232F31C
	mov r1, #0
	mov ip, #1
	str ip, [sp]
	mov r2, r1
	mov r3, r1
	str ip, [sp, #4]
	bl sub_02052060
_0232F31C:
	ldr r0, _0232F334 ; =ov01_0233C150
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F32C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F334: .word ov01_0233C150
	arm_func_end ov01_0232F28C

	arm_func_start ov01_0232F338
ov01_0232F338: ; 0x0232F338
	stmdb sp!, {r3, lr}
	ldr r0, _0232F380 ; =ov01_0233C150
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #3
	bne _0232F378
	mov r2, #1
	strb r2, [r3, #0xc]
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1]
	bl ov00_022BE618
	ldr r0, _0232F380 ; =ov01_0233C150
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F378:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F380: .word ov01_0233C150
	arm_func_end ov01_0232F338

	arm_func_start ov01_0232F384
ov01_0232F384: ; 0x0232F384
	stmdb sp!, {r3, lr}
	ldr r0, _0232F3F0 ; =ov01_0233C150
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0232F3B8
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
_0232F3B8:
	ldr r0, _0232F3F0 ; =ov01_0233C150
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r0, [r0]
	cmp r0, #0
	bne _0232F3DC
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
_0232F3DC:
	ldr r0, _0232F3F0 ; =ov01_0233C150
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F3F0: .word ov01_0233C150
	arm_func_end ov01_0232F384

	arm_func_start ov01_0232F3F4
ov01_0232F3F4: ; 0x0232F3F4
	ldr ip, _0232F400 ; =ov01_0232EFA8
	ldr r0, _0232F404 ; =ov01_0233AFD0
	bx ip
	.align 2, 0
_0232F400: .word ov01_0232EFA8
_0232F404: .word ov01_0233AFD0
	arm_func_end ov01_0232F3F4

	arm_func_start ov01_0232F408
ov01_0232F408: ; 0x0232F408
	ldr ip, _0232F414 ; =ov01_0232E99C
	ldr r0, _0232F418 ; =ov01_0233AFFC
	bx ip
	.align 2, 0
_0232F414: .word ov01_0232E99C
_0232F418: .word ov01_0233AFFC
	arm_func_end ov01_0232F408

	arm_func_start ov01_0232F41C
ov01_0232F41C: ; 0x0232F41C
	stmdb sp!, {r3, lr}
	mov r0, #0x14
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0232F474 ; =ov01_0233C158
	str r0, [r1]
	bl ov01_0232F504
	mov r0, #0x10
	bl ov00_022BE64C
	ldr r1, _0232F474 ; =ov01_0233C158
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1]
	mov r3, #0
	strb r0, [r2, #0x11]
	ldr r2, [r1]
	strb r3, [r2, #0x12]
	ldr r1, [r1]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F474: .word ov01_0233C158
	arm_func_end ov01_0232F41C

	arm_func_start ov01_0232F478
ov01_0232F478: ; 0x0232F478
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0232F4A4
	ldr r0, _0232F500 ; =ov01_0233C158
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0x12]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0232F4A4:
	bl ov01_0232F504
	ldr r1, _0232F500 ; =ov01_0233C158
	mov r3, #7
	ldr r2, [r1]
	sub r0, r3, #9
	str r3, [r2, #4]
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	beq _0232F4E0
	bl ov01_02330FFC
	ldr r0, _0232F500 ; =ov01_0233C158
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl CloseTextBox
_0232F4E0:
	ldr r0, _0232F500 ; =ov01_0233C158
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232F500 ; =ov01_0233C158
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F500: .word ov01_0233C158
	arm_func_end ov01_0232F478

	arm_func_start ov01_0232F504
ov01_0232F504: ; 0x0232F504
	ldr r0, _0232F534 ; =ov01_0233C158
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r0, [r0]
	strb r3, [r0, #0x11]
	bx lr
	.align 2, 0
_0232F534: .word ov01_0233C158
	arm_func_end ov01_0232F504

	arm_func_start ov01_0232F538
ov01_0232F538: ; 0x0232F538
	ldr r0, _0232F554 ; =ov01_0233C158
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0232F554: .word ov01_0233C158
	arm_func_end ov01_0232F538

	arm_func_start ov01_0232F558
ov01_0232F558: ; 0x0232F558
	bx lr
	arm_func_end ov01_0232F558

	arm_func_start ov01_0232F55C
ov01_0232F55C: ; 0x0232F55C
	stmdb sp!, {r3, lr}
	ldr r0, _0232F730 ; =ov01_0233C158
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0232F728
_0232F578: ; jump table
	b _0232F598 ; case 0
	b _0232F5C0 ; case 1
	b _0232F728 ; case 2
	b _0232F728 ; case 3
	b _0232F684 ; case 4
	b _0232F6B0 ; case 5
	b _0232F6FC ; case 6
	b _0232F718 ; case 7
_0232F598:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F730 ; =ov01_0233C158
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x10]
	bne _0232F728
	ldr r0, _0232F730 ; =ov01_0233C158
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F5C0:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F730 ; =ov01_0233C158
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x10]
	bne _0232F728
	ldr r0, _0232F730 ; =ov01_0233C158
	ldr r2, [r0]
	ldrb r1, [r2, #0x12]
	cmp r1, #0
	beq _0232F618
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0232F728
_0232F618:
	ldrb r1, [r2, #0x11]
	cmp r1, #0
	beq _0232F678
	mov r1, #1
	strb r1, [r2, #0x10]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x11]
	ldr r1, [r0]
	sub r0, r2, #2
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _0232F664
	ldr r0, _0232F734 ; =ov01_0233AFEC
	ldr r1, _0232F738 ; =ov01_0232F830
	bl CreateTextBox
	ldr r1, _0232F730 ; =ov01_0233C158
	ldr r1, [r1]
	strb r0, [r1, #8]
_0232F664:
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0232F728
_0232F678:
	mov r0, #0
	strb r0, [r2, #0x10]
	b _0232F728
_0232F684:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232F730 ; =ov01_0233C158
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x10]
	bne _0232F728
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F6B0:
	ldr r0, _0232F730 ; =ov01_0233C158
	ldr r1, [r0]
	ldrb r0, [r1, #0x12]
	cmp r0, #0
	ldreqb r0, [r1, #0x11]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0x10]
	beq _0232F728
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	b _0232F728
_0232F6FC:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _0232F728
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F718:
	ldr r0, _0232F730 ; =ov01_0233C158
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
_0232F728:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F730: .word ov01_0233C158
_0232F734: .word ov01_0233AFEC
_0232F738: .word ov01_0232F830
	arm_func_end ov01_0232F55C

	arm_func_start ov01_0232F73C
ov01_0232F73C: ; 0x0232F73C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	bl GetHero
	ldr r1, _0232F7B4 ; =ov01_0233C158
	mov r4, r0
	ldr r1, [r1]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _0232F7AC
	mov r0, #1
	strb r0, [r1, #0x10]
	bl ov01_0232F504
	ldrsh r0, [r4, #4]
	mov r1, #0x80
	mov r2, #0x60
	bl ov01_02330EB8
	mov r1, #0
	mov ip, #1
	str ip, [sp]
	ldr r0, _0232F7B8 ; =ov01_0233B020
	mov r2, r1
	mov r3, r1
	str ip, [sp, #4]
	bl sub_02052060
	ldr r0, _0232F7B4 ; =ov01_0233C158
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_0232F7AC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232F7B4: .word ov01_0233C158
_0232F7B8: .word ov01_0233B020
	arm_func_end ov01_0232F73C

	arm_func_start ov01_0232F7BC
ov01_0232F7BC: ; 0x0232F7BC
	ldr r0, _0232F7E8 ; =ov01_0233C158
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #3
	moveq r1, #1
	streqb r1, [r2]
	ldreq r0, [r0]
	moveq r1, #4
	streq r1, [r0, #4]
	mov r0, #0
	bx lr
	.align 2, 0
_0232F7E8: .word ov01_0233C158
	arm_func_end ov01_0232F7BC

	arm_func_start ov01_0232F7EC
ov01_0232F7EC: ; 0x0232F7EC
	stmdb sp!, {r3, lr}
	ldr r0, _0232F82C ; =ov01_0233C158
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _0232F82C ; =ov01_0233C158
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1]
	bl ov00_022BE618
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F82C: .word ov01_0233C158
	arm_func_end ov01_0232F7EC

	arm_func_start ov01_0232F830
ov01_0232F830: ; 0x0232F830
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r5, r0
	bl sub_02048C3C
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r1, _0232F904 ; =0x00002710
	mov r0, r4
	bl _u32_div_f
	ldr r1, _0232F904 ; =0x00002710
	bl _u32_div_f
	str r1, [sp, #0x28]
	ldr r1, _0232F904 ; =0x00002710
	mov r0, r4
	bl _u32_div_f
	mov r0, r5
	str r1, [sp, #0x2c]
	bl sub_02027B1C
	add r1, sp, #4
	str r1, [sp]
#ifdef JAPAN
	ldr r2, _023310A8 ; =0x00002436
#endif
	ldr r3, _0232F908 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x400
#ifndef JAPAN
	mov r2, #0x20c
#endif
	bl PreprocessStringFromId
	mov r0, r5
	mov r1, #0x1e
	mov r2, #0x14
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0232F8F0
	ldr r2, _0232F90C ; =0x00000226
	add ip, sp, #4
	ldr r3, _0232F908 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r5
	mov r1, #0x5a
	mov r2, #0
	bl DrawTextInWindow
_0232F8F0:
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0232F904: .word 0x00002710
#ifdef JAPAN
_023310A8: .word 0x00002436
_0232F908: .word 0x0000C402
_0232F90C: .word 0x0000042D
#else
_0232F908: .word 0x0000C402
_0232F90C: .word 0x00000226
#endif
	arm_func_end ov01_0232F830

	arm_func_start ov01_0232F910
ov01_0232F910: ; 0x0232F910
	ldr ip, _0232F91C ; =ov01_0232E99C
	ldr r0, _0232F920 ; =ov01_0233B034
	bx ip
	.align 2, 0
_0232F91C: .word ov01_0232E99C
_0232F920: .word ov01_0233B034
	arm_func_end ov01_0232F910

	arm_func_start ov01_0232F924
ov01_0232F924: ; 0x0232F924
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0232F97C ; =ov01_0233C15C
	str r0, [r1]
	bl ov01_0232F9FC
	mov r0, #0x10
	bl ov00_022BE64C
	ldr r1, _0232F97C ; =ov01_0233C15C
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1]
	mov r3, #0
	strb r0, [r2, #0xa]
	ldr r2, [r1]
	strb r3, [r2, #0xb]
	ldr r1, [r1]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F97C: .word ov01_0233C15C
	arm_func_end ov01_0232F924

	arm_func_start ov01_0232F980
ov01_0232F980: ; 0x0232F980
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0232F9AC
	ldr r0, _0232F9F8 ; =ov01_0233C15C
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0232F9AC:
	bl ov01_0232F9FC
	ldr r0, _0232F9F8 ; =ov01_0233C15C
	mov r3, #8
	ldr r2, [r0]
	sub r1, r3, #0xa
	str r3, [r2, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0232F9D8
	bl CloseControlsChart
_0232F9D8:
	ldr r0, _0232F9F8 ; =ov01_0233C15C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232F9F8 ; =ov01_0233C15C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232F9F8: .word ov01_0233C15C
	arm_func_end ov01_0232F980

	arm_func_start ov01_0232F9FC
ov01_0232F9FC: ; 0x0232F9FC
	ldr r0, _0232FA2C ; =ov01_0233C15C
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #9]
	ldr r0, [r0]
	strb r3, [r0, #0xa]
	bx lr
	.align 2, 0
_0232FA2C: .word ov01_0233C15C
	arm_func_end ov01_0232F9FC

	arm_func_start ov01_0232FA30
ov01_0232FA30: ; 0x0232FA30
	ldr r0, _0232FA4C ; =ov01_0233C15C
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0232FA4C: .word ov01_0233C15C
	arm_func_end ov01_0232FA30

	arm_func_start ov01_0232FA50
ov01_0232FA50: ; 0x0232FA50
	bx lr
	arm_func_end ov01_0232FA50

	arm_func_start ov01_0232FA54
ov01_0232FA54: ; 0x0232FA54
	stmdb sp!, {r3, lr}
	ldr r0, _0232FC24 ; =ov01_0233C15C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0232FC1C
_0232FA70: ; jump table
	b _0232FA94 ; case 0
	b _0232FABC ; case 1
	b _0232FC1C ; case 2
	b _0232FC1C ; case 3
	b _0232FC1C ; case 4
	b _0232FB4C ; case 5
	b _0232FB78 ; case 6
	b _0232FBC4 ; case 7
	b _0232FC0C ; case 8
_0232FA94:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232FC24 ; =ov01_0233C15C
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _0232FC1C
	ldr r0, _0232FC24 ; =ov01_0233C15C
	ldr r0, [r0]
	str r1, [r0, #4]
_0232FABC:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232FC24 ; =ov01_0233C15C
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _0232FC1C
	ldr r0, _0232FC24 ; =ov01_0233C15C
	ldr r2, [r0]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0232FB14
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0232FC1C
_0232FB14:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _0232FC1C
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _0232FC1C
_0232FB4C:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _0232FC24 ; =ov01_0233C15C
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _0232FC1C
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
_0232FB78:
	ldr r0, _0232FC24 ; =ov01_0233C15C
	ldr r1, [r0]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _0232FC1C
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _0232FC1C
_0232FBC4:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _0232FC1C
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0232FBFC
	bl CloseControlsChart
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
_0232FBFC:
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
_0232FC0C:
	ldr r0, _0232FC24 ; =ov01_0233C15C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_0232FC1C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232FC24: .word ov01_0233C15C
	arm_func_end ov01_0232FA54

	arm_func_start ov01_0232FC28
ov01_0232FC28: ; 0x0232FC28
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _0232FCF4 ; =ov01_0233C15C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #2
	bne _0232FC94
	mov r2, #1
	strb r2, [r3, #9]
	ldr r1, [r0]
	sub r0, r2, #3
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _0232FC80
	mov r0, #0
	ldr r3, _0232FCF8 ; =0x00003FC9
	mov r1, r0
	mov r2, r0
	bl CreateControlsChart
	ldr r1, _0232FCF4 ; =ov01_0233C15C
	ldr r1, [r1]
	strb r0, [r1, #8]
_0232FC80:
	ldr r0, _0232FCF4 ; =ov01_0233C15C
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0232FCEC
_0232FC94:
	cmp r1, #3
	bne _0232FCEC
	mov r1, #1
	strb r1, [r3, #9]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl IsControlsChartActive
	cmp r0, #0
	bne _0232FCEC
	bl ov01_0232F9FC
	mov r1, #0
	mov ip, #1
	str ip, [sp]
	ldr r0, _0232FCFC ; =ov01_0233B058
	mov r2, r1
	mov r3, r1
	str ip, [sp, #4]
	bl sub_02052060
	ldr r0, _0232FCF4 ; =ov01_0233C15C
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
_0232FCEC:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232FCF4: .word ov01_0233C15C
#if defined(EUROPE)
_0232FCF8: .word 0x00003FCB
#elif defined(JAPAN)
_0232FCF8: .word 0x000049CC
#else
_0232FCF8: .word 0x00003FC9
#endif
_0232FCFC: .word ov01_0233B058
	arm_func_end ov01_0232FC28

	arm_func_start ov01_0232FD00
ov01_0232FD00: ; 0x0232FD00
	ldr r0, _0232FD2C ; =ov01_0233C15C
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	moveq r1, #1
	streqb r1, [r2]
	ldreq r0, [r0]
	moveq r1, #5
	streq r1, [r0, #4]
	mov r0, #0
	bx lr
	.align 2, 0
_0232FD2C: .word ov01_0233C15C
	arm_func_end ov01_0232FD00

	arm_func_start ov01_0232FD30
ov01_0232FD30: ; 0x0232FD30
	stmdb sp!, {r3, lr}
	ldr r0, _0232FD70 ; =ov01_0233C15C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _0232FD70 ; =ov01_0233C15C
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1]
	bl ov00_022BE618
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232FD70: .word ov01_0233C15C
	arm_func_end ov01_0232FD30

	arm_func_start ov01_0232FD74
ov01_0232FD74: ; 0x0232FD74
	ldr r0, _0232FDA8 ; =ov01_0233C15C
	ldr r1, [r0]
	cmp r1, #0
	ldrne r0, [r1, #4]
	cmpne r0, #7
	cmpne r0, #8
	beq _0232FDA0
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
_0232FDA0:
	mov r0, #0
	bx lr
	.align 2, 0
_0232FDA8: .word ov01_0233C15C
	arm_func_end ov01_0232FD74

	arm_func_start ov01_0232FDAC
ov01_0232FDAC: ; 0x0232FDAC
	ldr ip, _0232FDB8 ; =ov01_0232E99C
	ldr r0, _0232FDBC ; =ov01_0233B06C
	bx ip
	.align 2, 0
_0232FDB8: .word ov01_0232E99C
_0232FDBC: .word ov01_0233B06C
	arm_func_end ov01_0232FDAC

	arm_func_start ov01_0232FDC0
ov01_0232FDC0: ; 0x0232FDC0
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0232FE18 ; =ov01_0233C160
	str r0, [r1]
	bl ov01_0232FE98
	mov r0, #0x10
	bl ov00_022BE64C
	ldr r1, _0232FE18 ; =ov01_0233C160
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1]
	mov r3, #0
	strb r0, [r2, #0xa]
	ldr r2, [r1]
	strb r3, [r2, #0xb]
	ldr r1, [r1]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232FE18: .word ov01_0233C160
	arm_func_end ov01_0232FDC0

	arm_func_start ov01_0232FE1C
ov01_0232FE1C: ; 0x0232FE1C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0232FE48
	ldr r0, _0232FE94 ; =ov01_0233C160
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0232FE48:
	bl ov01_0232FE98
	ldr r0, _0232FE94 ; =ov01_0233C160
	mov r3, #8
	ldr r2, [r0]
	sub r1, r3, #0xa
	str r3, [r2, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0232FE74
	bl CloseControlsChart
_0232FE74:
	ldr r0, _0232FE94 ; =ov01_0233C160
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0232FE94 ; =ov01_0233C160
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232FE94: .word ov01_0233C160
	arm_func_end ov01_0232FE1C

	arm_func_start ov01_0232FE98
ov01_0232FE98: ; 0x0232FE98
	ldr r0, _0232FEC8 ; =ov01_0233C160
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #9]
	ldr r0, [r0]
	strb r3, [r0, #0xa]
	bx lr
	.align 2, 0
_0232FEC8: .word ov01_0233C160
	arm_func_end ov01_0232FE98

	arm_func_start ov01_0232FECC
ov01_0232FECC: ; 0x0232FECC
	ldr r0, _0232FEE8 ; =ov01_0233C160
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0232FEE8: .word ov01_0233C160
	arm_func_end ov01_0232FECC

	arm_func_start ov01_0232FEEC
ov01_0232FEEC: ; 0x0232FEEC
	bx lr
	arm_func_end ov01_0232FEEC

	arm_func_start ov01_0232FEF0
ov01_0232FEF0: ; 0x0232FEF0
	stmdb sp!, {r3, lr}
	ldr r0, _023300C0 ; =ov01_0233C160
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _023300B8
_0232FF0C: ; jump table
	b _0232FF30 ; case 0
	b _0232FF58 ; case 1
	b _023300B8 ; case 2
	b _023300B8 ; case 3
	b _023300B8 ; case 4
	b _0232FFE8 ; case 5
	b _02330014 ; case 6
	b _02330060 ; case 7
	b _023300A8 ; case 8
_0232FF30:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023300C0 ; =ov01_0233C160
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _023300B8
	ldr r0, _023300C0 ; =ov01_0233C160
	ldr r0, [r0]
	str r1, [r0, #4]
_0232FF58:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023300C0 ; =ov01_0233C160
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _023300B8
	ldr r0, _023300C0 ; =ov01_0233C160
	ldr r2, [r0]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0232FFB0
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _023300C0 ; =ov01_0233C160
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _023300B8
_0232FFB0:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _023300B8
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _023300B8
_0232FFE8:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023300C0 ; =ov01_0233C160
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _023300B8
	ldr r0, _023300C0 ; =ov01_0233C160
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
_02330014:
	ldr r0, _023300C0 ; =ov01_0233C160
	ldr r1, [r0]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _023300B8
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _023300C0 ; =ov01_0233C160
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _023300B8
_02330060:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _023300B8
	ldr r0, _023300C0 ; =ov01_0233C160
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _02330098
	bl CloseControlsChart
	ldr r0, _023300C0 ; =ov01_0233C160
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
_02330098:
	ldr r0, _023300C0 ; =ov01_0233C160
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
_023300A8:
	ldr r0, _023300C0 ; =ov01_0233C160
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_023300B8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023300C0: .word ov01_0233C160
	arm_func_end ov01_0232FEF0

	arm_func_start ov01_023300C4
ov01_023300C4: ; 0x023300C4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02330190 ; =ov01_0233C160
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #2
	bne _02330130
	mov r2, #1
	strb r2, [r3, #9]
	ldr r1, [r0]
	sub r0, r2, #3
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _0233011C
	mov r0, #0
	ldr r3, _02330194 ; =0x00000122
	mov r1, r0
	mov r2, r0
	bl CreateControlsChart
	ldr r1, _02330190 ; =ov01_0233C160
	ldr r1, [r1]
	strb r0, [r1, #8]
_0233011C:
	ldr r0, _02330190 ; =ov01_0233C160
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02330188
_02330130:
	cmp r1, #3
	bne _02330188
	mov r1, #1
	strb r1, [r3, #9]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl IsControlsChartActive
	cmp r0, #0
	bne _02330188
	bl ov01_0232FE98
	mov r1, #0
	mov ip, #1
	str ip, [sp]
	ldr r0, _02330198 ; =ov01_0233B090
	mov r2, r1
	mov r3, r1
	str ip, [sp, #4]
	bl sub_02052060
	ldr r0, _02330190 ; =ov01_0233C160
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
_02330188:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02330190: .word ov01_0233C160
#ifdef JAPAN
_02330194: .word 0x000031D4
#else
_02330194: .word 0x00000122
#endif
_02330198: .word ov01_0233B090
	arm_func_end ov01_023300C4

	arm_func_start ov01_0233019C
ov01_0233019C: ; 0x0233019C
	ldr r0, _023301C8 ; =ov01_0233C160
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	moveq r1, #1
	streqb r1, [r2]
	ldreq r0, [r0]
	moveq r1, #5
	streq r1, [r0, #4]
	mov r0, #0
	bx lr
	.align 2, 0
_023301C8: .word ov01_0233C160
	arm_func_end ov01_0233019C

	arm_func_start ov01_023301CC
ov01_023301CC: ; 0x023301CC
	stmdb sp!, {r3, lr}
	ldr r0, _0233020C ; =ov01_0233C160
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _0233020C ; =ov01_0233C160
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1]
	bl ov00_022BE618
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233020C: .word ov01_0233C160
	arm_func_end ov01_023301CC

	arm_func_start ov01_02330210
ov01_02330210: ; 0x02330210
	ldr ip, _0233021C ; =ov01_0232E99C
	ldr r0, _02330220 ; =ov01_0233B0E0
	bx ip
	.align 2, 0
_0233021C: .word ov01_0232E99C
_02330220: .word ov01_0233B0E0
	arm_func_end ov01_02330210

	arm_func_start ov01_02330224
ov01_02330224: ; 0x02330224
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #0x288
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02330584 ; =ov01_0233C164
	str r0, [r1]
	bl ov01_02330644
	mov r0, #0x10
	bl ov00_022BE64C
	ldr r1, _02330584 ; =ov01_0233C164
	mvn r3, #1
	ldr r0, [r1]
	mov r2, #1
	strb r3, [r0, #8]
	ldr r0, [r1]
	mov r3, #0
	strb r2, [r0, #0x285]
	ldr r2, [r1]
	mov r0, #3
	strb r3, [r2, #0x286]
	ldr r1, [r1]
	str r3, [r1, #4]
	bl RandInt
	mov r4, r0
	ldr r0, _02330588 ; =WAN_TABLE
	ldr r1, _0233058C ; =ov01_0233B104
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02330584 ; =ov01_0233C164
	ldr r2, _02330588 ; =WAN_TABLE
	ldr r3, [r1]
	ldr r1, _02330590 ; =ov01_0233C168
	strh r0, [r3, #0x90]
	ldr r1, [r1, r4, lsl #2]
	ldr r0, [r2]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02330584 ; =ov01_0233C164
	ldr r2, [r1]
	strh r0, [r2, #0x92]
	ldr r0, [r1]
	add r0, r0, #0x84
	bl InitOamAdjustmentInfo
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r2, [r0]
	ldrh r1, [r2, #0x88]
	bic r1, r1, #0xc00
	strh r1, [r2, #0x88]
	ldr r2, [r0]
	ldrh r1, [r2, #0x8e]
	bic r1, r1, #0xc00
	strh r1, [r2, #0x8e]
	ldr r0, [r0]
	add r0, r0, #0x94
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r2, [r0]
	ldrh r1, [r2, #0x96]
	orr r1, r1, #0x20
	strh r1, [r2, #0x96]
	ldr r1, [r0]
	add r0, r1, #0x94
	add r1, r1, #0x84
	bl FillOamAttributeInfo
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r1, [r0]
	add r0, r1, #0x94
	ldrsh r1, [r1, #0x90]
	bl SetSpriteIdForAnimationControl
	mov r1, #4
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, _02330584 ; =ov01_0233C164
	mov r3, r2
	ldr r0, [r0]
	add r0, r0, #0x94
	bl SetAnimationForAnimationControl
	ldr r0, _02330584 ; =ov01_0233C164
	mov r2, #0x78
	ldr r1, [r0]
	mov r3, #0x50
	strh r2, [r1, #0xb0]
	ldr r1, [r0]
	mov r2, #0
	strh r3, [r1, #0xb2]
	ldr r1, [r0]
	strh r2, [r1, #0xcc]
	ldr r0, [r0]
	add r0, r0, #0x110
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02330584 ; =ov01_0233C164
	ldr r0, [r1]
	add r0, r0, #0x100
	ldrh r2, [r0, #0x12]
	orr r2, r2, #0x20
	strh r2, [r0, #0x12]
	ldr r1, [r1]
	add r0, r1, #0x110
	add r1, r1, #0x84
	bl FillOamAttributeInfo
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r0, [r0]
	ldrsh r1, [r0, #0x90]
	add r0, r0, #0x110
	bl SetSpriteIdForAnimationControl
	mov r0, #5
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _02330584 ; =ov01_0233C164
	str r2, [sp, #0xc]
	ldr r0, [r0]
	mov r1, #8
	add r0, r0, #0x110
	mov r3, #0x100
	bl SetAnimationForAnimationControl
	mov ip, #0x78
	ldr r1, _02330584 ; =ov01_0233C164
	mov r3, #0x64
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x100
	strh ip, [r0, #0x2c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r3, [r0, #0x2e]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0x48]
	ldr r0, [r1]
	add r0, r0, #0x18c
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02330584 ; =ov01_0233C164
	ldr r0, [r1]
	add r0, r0, #0x100
	ldrh r2, [r0, #0x8e]
	orr r2, r2, #0x20
	strh r2, [r0, #0x8e]
	ldr r1, [r1]
	add r0, r1, #0x18c
	add r1, r1, #0x84
	bl FillOamAttributeInfo
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r1, [r0]
	add r0, r1, #0x18c
	ldrsh r1, [r1, #0x90]
	bl SetSpriteIdForAnimationControl
	mov r0, #6
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, _02330584 ; =ov01_0233C164
	mov r1, #8
	ldr r0, [r0]
	mov r3, #0x200
	add r0, r0, #0x18c
	bl SetAnimationForAnimationControl
	ldr r1, _02330584 ; =ov01_0233C164
	mov r3, #0x78
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x100
	strh r3, [r0, #0xa8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r3, [r0, #0xaa]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xc4]
	ldr r0, [r1]
	add r0, r0, #0x208
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _02330584 ; =ov01_0233C164
	ldr r0, [r0]
	ldrsh r1, [r0, #0x92]
	add r0, r0, #0x208
	bl SetSpriteIdForAnimationControl
	mov r0, #7
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _02330584 ; =ov01_0233C164
	str r2, [sp, #0xc]
	ldr r0, [r0]
	mov r3, #0x300
	add r0, r0, #0x208
	bl SetAnimationForAnimationControl
	ldr r1, _02330584 ; =ov01_0233C164
	mov r2, #0x50
	ldr r0, [r1]
	mov r3, #0x48
	add r0, r0, #0x200
	strh r2, [r0, #0x24]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x200
	strh r3, [r0, #0x26]
	ldr r1, [r1]
	mov r0, #1
	add r1, r1, #0x200
	strh r2, [r1, #0x40]
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02330584: .word ov01_0233C164
_02330588: .word WAN_TABLE
_0233058C: .word ov01_0233B104
_02330590: .word ov01_0233C168
	arm_func_end ov01_02330224

	arm_func_start ov01_02330594
ov01_02330594: ; 0x02330594
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _023305C0
	ldr r0, _0233063C ; =ov01_0233C164
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0x286]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_023305C0:
	bl ov01_02330644
	ldr r0, _0233063C ; =ov01_0233C164
	mov r3, #8
	ldr r2, [r0]
	sub r1, r3, #0xa
	str r3, [r2, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _023305EC
	bl CloseControlsChart
_023305EC:
	ldr r0, _0233063C ; =ov01_0233C164
	ldr r1, _02330640 ; =WAN_TABLE
	ldr r2, [r0]
	ldr r0, [r1]
	ldrsh r1, [r2, #0x90]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0233063C ; =ov01_0233C164
	ldr r1, _02330640 ; =WAN_TABLE
	ldr r2, [r0]
	ldr r0, [r1]
	ldrsh r1, [r2, #0x92]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0233063C ; =ov01_0233C164
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233063C ; =ov01_0233C164
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233063C: .word ov01_0233C164
_02330640: .word WAN_TABLE
	arm_func_end ov01_02330594

	arm_func_start ov01_02330644
ov01_02330644: ; 0x02330644
	stmdb sp!, {r3, lr}
	ldr r0, _023306D8 ; =ov01_0233C164
	mov r1, #0
	ldr r2, [r0]
	mov r3, #1
	strb r1, [r2]
	ldr r2, [r0]
	str r3, [r2, #4]
	ldr r2, [r0]
	strb r3, [r2, #0x284]
	ldr r2, [r0]
	strb r1, [r2, #0x285]
	ldr r2, [r0]
	str r1, [r2, #0xc]
	ldr r2, [r0]
	str r1, [r2, #0x48]
	ldr r0, [r0]
	add r0, r0, #0x10
	bl ov09_0233D964
	ldr r0, _023306D8 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x4c
	bl ov09_0233D964
	ldr r0, _023306D8 ; =ov01_0233C164
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x44]
	ldr r1, [r0]
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	strb r2, [r1, #0x81]
	ldr r1, [r0]
	strb r2, [r1, #0x82]
	ldr r0, [r0]
	strb r2, [r0, #0x83]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023306D8: .word ov01_0233C164
	arm_func_end ov01_02330644

	arm_func_start ov01_023306DC
ov01_023306DC: ; 0x023306DC
	ldr r0, _023306F8 ; =ov01_0233C164
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0x284]
	bx lr
	.align 2, 0
_023306F8: .word ov01_0233C164
	arm_func_end ov01_023306DC

	arm_func_start ov01_023306FC
ov01_023306FC: ; 0x023306FC
	bx lr
	arm_func_end ov01_023306FC

	arm_func_start ov01_02330700
ov01_02330700: ; 0x02330700
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _023309E8
_0233071C: ; jump table
	b _02330740 ; case 0
	b _02330768 ; case 1
	b _023309E8 ; case 2
	b _023309E8 ; case 3
	b _023309E8 ; case 4
	b _023307F8 ; case 5
	b _02330824 ; case 6
	b _02330990 ; case 7
	b _023309D8 ; case 8
_02330740:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023309F0 ; =ov01_0233C164
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x284]
	bne _023309E8
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r0, [r0]
	str r1, [r0, #4]
_02330768:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023309F0 ; =ov01_0233C164
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x284]
	bne _023309E8
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldrb r1, [r2, #0x286]
	cmp r1, #0
	beq _023307C0
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _023309F0 ; =ov01_0233C164
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #0x284]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _023309E8
_023307C0:
	ldrb r1, [r2, #0x285]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0x284]
	beq _023309E8
	mov r1, #1
	strb r1, [r2, #0x284]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x285]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _023309E8
_023307F8:
	bl ov00_022BE6AC
	cmp r0, #0
	ldrne r0, _023309F0 ; =ov01_0233C164
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x284]
	bne _023309E8
	ldr r0, _023309F0 ; =ov01_0233C164
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
_02330824:
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldrb r0, [r2, #0x286]
	cmp r0, #0
	ldreqb r0, [r2, #0x285]
	cmpeq r0, #0
	beq _02330868
	mov r0, #0x10
	bl ov00_022BE630
	ldr r0, _023309F0 ; =ov01_0233C164
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x284]
	b _023309E8
_02330868:
	ldrb r0, [r2, #0x44]
	cmp r0, #0
	beq _02330984
	ldr r1, [r2, #0x48]
	ldr r0, [r2, #0xc]
	mov ip, #3
	cmp r1, r0
	ldreqb r1, [r2, #0x61]
	ldreqb r0, [r2, #0x25]
	cmpeq r1, r0
	ldreq r1, [r2, #0x64]
	ldreq r0, [r2, #0x28]
	cmpeq r1, r0
	movne r0, #1
	strneb r0, [r2, #0x80]
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #0x48]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	ldreqb r1, [r2, #0x62]
	ldreqb r0, [r2, #0x26]
	cmpeq r1, r0
	ldreq r1, [r2, #0x68]
	ldreq r0, [r2, #0x2c]
	cmpeq r1, r0
	movne r0, #1
	strneb r0, [r2, #0x81]
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #0x48]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	ldreqb r1, [r2, #0x60]
	ldreqb r0, [r2, #0x24]
	cmpeq r1, r0
	ldreq r1, [r2, #0x7c]
	ldreq r0, [r2, #0x40]
	cmpeq r1, r0
	movne r0, #1
	strneb r0, [r2, #0x82]
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #0x48]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	ldreqb r1, [r2, #0x60]
	ldreqb r0, [r2, #0x24]
	cmpeq r1, r0
	movne r0, #1
	strneb r0, [r2, #0x83]
	ldr r0, _023309F0 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	str r1, [r2, #0x48]
	ldr r5, [r0]
	add r4, r5, #0x10
	add lr, r5, #0x4c
_02330950:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02330950
	ldr r0, [r4]
	mov r1, #0
	str r0, [lr]
	ldr r0, _023309F0 ; =ov01_0233C164
	strb r1, [r5, #0x44]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x284]
	b _023309E8
_02330984:
	mov r0, #0
	strb r0, [r2, #0x284]
	b _023309E8
_02330990:
	bl ov00_022BE6AC
	cmp r0, #0
	bne _023309E8
	ldr r0, _023309F0 ; =ov01_0233C164
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _023309C8
	bl CloseControlsChart
	ldr r0, _023309F0 ; =ov01_0233C164
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
_023309C8:
	ldr r0, _023309F0 ; =ov01_0233C164
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
_023309D8:
	ldr r0, _023309F0 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x284]
_023309E8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023309F0: .word ov01_0233C164
	arm_func_end ov01_02330700

	arm_func_start ov01_023309F4
ov01_023309F4: ; 0x023309F4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02330AC0 ; =ov01_0233C164
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #2
	bne _02330A60
	mov r2, #1
	strb r2, [r3, #0x284]
	ldr r1, [r0]
	sub r0, r2, #3
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _02330A4C
	mov r0, #0
	ldr r3, _02330AC4 ; =0x000004EE
	mov r1, r0
	mov r2, r0
	bl CreateControlsChart
	ldr r1, _02330AC0 ; =ov01_0233C164
	ldr r1, [r1]
	strb r0, [r1, #8]
_02330A4C:
	ldr r0, _02330AC0 ; =ov01_0233C164
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02330AB8
_02330A60:
	cmp r1, #3
	bne _02330AB8
	mov r1, #1
	strb r1, [r3, #0x284]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl IsControlsChartActive
	cmp r0, #0
	bne _02330AB8
	bl ov01_02330644
	mov r1, #0
	mov ip, #1
	str ip, [sp]
	ldr r0, _02330AC8 ; =ov01_0233B118
	mov r2, r1
	mov r3, r1
	str ip, [sp, #4]
	bl sub_02052060
	ldr r0, _02330AC0 ; =ov01_0233C164
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
_02330AB8:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02330AC0: .word ov01_0233C164
#ifdef JAPAN
_02330AC4: .word 0x00000538
#else
_02330AC4: .word 0x000004EE
#endif
_02330AC8: .word ov01_0233B118
	arm_func_end ov01_023309F4

	arm_func_start ov01_02330ACC
ov01_02330ACC: ; 0x02330ACC
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	moveq r1, #1
	streqb r1, [r2]
	ldreq r0, [r0]
	moveq r1, #5
	streq r1, [r0, #4]
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr ip, [r0]
	ldrb r0, [ip, #0x80]
	cmp r0, #0
	beq _02330BA8
	ldrb r0, [ip, #0x61]
	cmp r0, #0
	ldr r0, [ip, #0x64]
	beq _02330B2C
	cmp r0, #0
	movgt r1, #3
	movle r1, #4
	b _02330B38
_02330B2C:
	cmp r0, #0
	movgt r1, #5
	movle r1, #2
_02330B38:
	mov r2, #0
	mov r0, #4
	stmia sp, {r0, r2}
	mov r0, #1
	str r0, [sp, #8]
	mov r3, r2
	add r0, ip, #0x94
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr r2, [r0]
	ldr r1, [r2, #0x48]
	cmp r1, #2
	bne _02330B84
	mov r1, #0xa0
	strh r1, [r2, #0xb0]
	ldr r0, [r0]
	mov r1, #0x16
	b _02330B94
_02330B84:
	mov r1, #0xe4
	strh r1, [r2, #0xb0]
	ldr r0, [r0]
	mov r1, #0x52
_02330B94:
	strh r1, [r0, #0xb2]
	ldr r0, _02330D54 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x80]
_02330BA8:
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr r3, [r0]
	ldrb r0, [r3, #0x81]
	cmp r0, #0
	beq _02330C64
	ldrb r0, [r3, #0x62]
	cmp r0, #0
	ldr r0, [r3, #0x68]
	beq _02330BDC
	cmp r0, #0
	movgt r1, #7
	movle r1, #8
	b _02330BE8
_02330BDC:
	cmp r0, #0
	movgt r1, #9
	movle r1, #6
_02330BE8:
	mov r0, #5
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r3, #0x110
	mov r3, #0x100
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r1, _02330D54 ; =ov01_0233C164
	ldr r2, [r1]
	ldr r0, [r2, #0x48]
	cmp r0, #2
	add r0, r2, #0x100
	bne _02330C3C
	mov r2, #0xb4
	strh r2, [r0, #0x2c]
	ldr r0, [r1]
	mov r1, #0x16
	b _02330C4C
_02330C3C:
	mov r2, #0xe4
	strh r2, [r0, #0x2c]
	ldr r0, [r1]
	mov r1, #0x60
_02330C4C:
	add r0, r0, #0x100
	strh r1, [r0, #0x2e]
	ldr r0, _02330D54 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x81]
_02330C64:
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr r3, [r0]
	ldrb r0, [r3, #0x82]
	cmp r0, #0
	beq _02330CEC
	ldrb r0, [r3, #0x24]
	mov r2, #0
	cmp r0, #0
	mov r0, #6
	str r0, [sp]
	movne r1, #1
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r3, #0x18c
	moveq r1, #0
	mov r3, #0x200
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r2, _02330D54 ; =ov01_0233C164
	mov ip, #0x9c
	ldr r1, [r2]
	mov r3, #0
	ldr r0, [r1, #0x7c]
	add r1, r1, #0x100
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r0, r0, #0x88
	strh r0, [r1, #0xa8]
	ldr r0, [r2]
	add r0, r0, #0x100
	strh ip, [r0, #0xaa]
	ldr r0, [r2]
	strb r3, [r0, #0x82]
_02330CEC:
	ldr r0, _02330D54 ; =ov01_0233C164
	ldr r3, [r0]
	ldrb r0, [r3, #0x83]
	cmp r0, #0
	beq _02330D48
	ldrb r0, [r3, #0x24]
	mov r2, #0
	cmp r0, #0
	mov r0, #7
	str r0, [sp]
	moveq r1, #1
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r3, #0x208
	movne r1, #0
	mov r3, #0x300
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _02330D54 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x83]
_02330D48:
	mov r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02330D54: .word ov01_0233C164
	arm_func_end ov01_02330ACC

	arm_func_start ov01_02330D58
ov01_02330D58: ; 0x02330D58
	stmdb sp!, {r3, lr}
	ldr r0, _02330DFC ; =ov01_0233C164
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _02330D94
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _02330DFC ; =ov01_0233C164
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1]
	bl ov00_022BE618
_02330D94:
	ldr r0, _02330DFC ; =ov01_0233C164
	ldr r1, [r0]
	ldr r0, [r1, #0x48]
	cmp r0, #0
	beq _02330DC0
	add r0, r1, #0x94
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02330DFC ; =ov01_0233C164
	ldr r0, [r0]
	add r0, r0, #0x110
	bl DisplayAndSwitchAnimationControlCurrentFrame
_02330DC0:
	ldr r0, _02330DFC ; =ov01_0233C164
	ldr r1, [r0]
	ldr r0, [r1, #0x48]
	cmp r0, #3
	ldmneia sp!, {r3, pc}
	add r0, r1, #0x208
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldr r0, _02330DFC ; =ov01_0233C164
	ldr r1, [r0]
	ldr r0, [r1, #0x7c]
	cmp r0, #0
	ldmleia sp!, {r3, pc}
	add r0, r1, #0x18c
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldmia sp!, {r3, pc}
	.align 2, 0
_02330DFC: .word ov01_0233C164
	arm_func_end ov01_02330D58

	arm_func_start ov01_02330E00
ov01_02330E00: ; 0x02330E00
	ldr r0, _02330E34 ; =ov01_0233C164
	ldr r1, [r0]
	cmp r1, #0
	ldrne r0, [r1, #4]
	cmpne r0, #7
	cmpne r0, #8
	beq _02330E2C
	ldrb r0, [r1, #0x286]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
_02330E2C:
	mov r0, #0
	bx lr
	.align 2, 0
_02330E34: .word ov01_0233C164
	arm_func_end ov01_02330E00

	arm_func_start ov01_02330E38
ov01_02330E38: ; 0x02330E38
	stmdb sp!, {r4, lr}
	ldr r2, _02330EB4 ; =ov01_0233C164
	mov r4, r1
	ldr r1, [r2]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	cmp r0, #1
	strne r0, [r1, #0xc]
	cmp r4, #0
	beq _02330E8C
	ldr r0, _02330EB4 ; =ov01_0233C164
	mov ip, #3
	ldr r0, [r0]
	add lr, r0, #0x10
_02330E70:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02330E70
	ldr r0, [r4]
	str r0, [lr]
	b _02330EA0
_02330E8C:
	ldr r0, _02330EB4 ; =ov01_0233C164
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x10
	bl ov09_0233D964
_02330EA0:
	ldr r0, _02330EB4 ; =ov01_0233C164
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x44]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02330EB4: .word ov01_0233C164
	arm_func_end ov01_02330E38

	arm_func_start ov01_02330EB8
ov01_02330EB8: ; 0x02330EB8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x110
	ldr r3, _02330FE4 ; =ov01_0233C174
	mov ip, #0
	strb ip, [r3]
	mov r5, r1
	mov r4, r2
	strb ip, [r3, #1]
	bl FemaleToMaleForm
	mov r3, #0
	ldr r2, _02330FE8 ; =PRINTS_STRUCT
	b _02330F04
_02330EE8:
	cmp r0, r1
	addne r1, r1, #0x258
	cmpne r0, r1
	beq _02330F18
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02330F04:
	mov r1, r3, lsl #3
	ldrsh r1, [r2, r1]
	cmp r1, #0
	bne _02330EE8
	mvn r3, #0
_02330F18:
	cmp r3, #0
	ldrlt r1, _02330FE4 ; =ov01_0233C174
	movlt r0, #0
	strlth r0, [r1, #2]
	blt _02330FDC
	ldr r1, _02330FEC ; =ov01_0233B318
	add r0, sp, #0x10
	ldr r2, [r1, r3, lsl #3]
	ldr r1, _02330FF0 ; =ov01_0233B504
	bl sprintf
	ldr r0, _02330FF4 ; =WAN_TABLE
	add r1, sp, #0x10
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02330FE4 ; =ov01_0233C174
	strh r0, [r1, #2]
	ldrsh r0, [r1, #2]
	cmp r0, #0
	moveq r0, #0
	beq _02330FDC
	ldr r0, _02330FF8 ; =ov01_0233C978
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02330FE4 ; =ov01_0233C174
	ldr r0, _02330FF8 ; =ov01_0233C978
	ldrsh r1, [r1, #2]
	bl SetSpriteIdForAnimationControl
	mov r3, #0xa
	mov r1, #0
	str r3, [sp]
	str r1, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _02330FF8 ; =ov01_0233C978
	str r2, [sp, #0xc]
	mov r2, r1
	bl SetAnimationForAnimationControl
	ldr r2, _02330FF8 ; =ov01_0233C978
	mov r0, #0
	strh r0, [r2, #0x38]
	strh r5, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	ldrh r3, [r2, #2]
	ldr r1, _02330FE4 ; =ov01_0233C174
	mov r0, #1
	bic r3, r3, #2
	strh r3, [r2, #2]
	strb r0, [r1]
	strb r0, [r1, #1]
_02330FDC:
	add sp, sp, #0x110
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02330FE4: .word ov01_0233C174
_02330FE8: .word PRINTS_STRUCT
_02330FEC: .word ov01_0233B318
_02330FF0: .word ov01_0233B504
_02330FF4: .word WAN_TABLE
_02330FF8: .word ov01_0233C978
	arm_func_end ov01_02330EB8

	arm_func_start ov01_02330FFC
ov01_02330FFC: ; 0x02330FFC
	stmdb sp!, {r3, lr}
	ldr r0, _02331034 ; =ov01_0233C174
	ldrsh r1, [r0, #2]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _02331038 ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _02331034 ; =ov01_0233C174
	mov r1, #0
	strh r1, [r0, #2]
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02331034: .word ov01_0233C174
_02331038: .word WAN_TABLE
	arm_func_end ov01_02330FFC

	arm_func_start ov01_0233103C
ov01_0233103C: ; 0x0233103C
	stmdb sp!, {r4, lr}
	ldr r0, _023310AC ; =ov01_0233C174
	ldrsh r1, [r0, #2]
	cmp r1, #0
	ldrneb r1, [r0]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _02331094
	ldr r4, _023310B0 ; =ov01_0233C978
	ldr lr, _023310B4 ; =ov01_0233C9F4
	mov ip, #7
_02331070:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02331070
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r0, _023310AC ; =ov01_0233C174
	mov r1, #0
	strb r1, [r0, #1]
_02331094:
	ldr r0, _023310B4 ; =ov01_0233C9F4
	ldrh r1, [r0, #2]
	tst r1, #2
	ldmneia sp!, {r4, pc}
	bl DisplayAndSwitchAnimationControlCurrentFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_023310AC: .word ov01_0233C174
_023310B0: .word ov01_0233C978
_023310B4: .word ov01_0233C9F4
	arm_func_end ov01_0233103C

	arm_func_start ov01_023310B8
ov01_023310B8: ; 0x023310B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023310DC ; =ov01_0233B558
	bl InitMenu
	cmp r0, #0
	ldrne r0, _023310E0 ; =ov01_0233C178
	movne r1, #0
	stmneib r0, {r1, r4}
	ldmia sp!, {r4, pc}
	.align 2, 0
_023310DC: .word ov01_0233B558
_023310E0: .word ov01_0233C178
	arm_func_end ov01_023310B8

	arm_func_start CreateMainMenus
CreateMainMenus: ; 0x023310E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r0, #0x184
	mov r1, #8
	bl MemAlloc
	ldr r7, _0233154C ; =ov01_0233C178
	mov r6, #0
	str r0, [r7]
	str r6, [r0, #0x18]
	ldr r0, [r7]
	mov r4, #1
	str r6, [r0, #0x94]
	ldr r0, [r7]
	mov r5, r6
	str r6, [r0, #0x114]
_0233111C:
	mov r0, r6
	bl IsSpecialEpisodeOpen
	cmp r0, #0
	beq _02331180
	ldr r2, [r7]
#ifdef JAPAN
	add r0, r6, #0x3b
#else
	add r0, r6, #0x72
#endif
	ldr r1, [r2, #0x114]
	add r2, r2, #0x11c
	add r3, r2, r1, lsl #3
	str r6, [r3, #4]
	mov r1, r1, lsl #3
#ifndef JAPAN
	add r0, r0, #0x100
#endif
	strh r0, [r2, r1]
	bl GetSpecialEpisodeType
	cmp r6, r0
	ldr r1, [r7]
	movne r2, r5
	ldr r0, [r1, #0x114]
	moveq r2, r4
	add r0, r1, r0
	strb r2, [r0, #0x174]
	ldr r1, [r7]
	ldr r0, [r1, #0x114]
	add r0, r0, #1
	str r0, [r1, #0x114]
_02331180:
	add r6, r6, #1
	cmp r6, #5
	blt _0233111C
	ldr r0, _0233154C ; =ov01_0233C178
	mvn r2, #0
	ldr r4, [r0]
	ldr r1, _02331550 ; =0x000001E6
	ldr r3, [r4, #0x114]
	add r4, r4, #0x11c
	add r5, r4, r3, lsl #3
	str r2, [r5, #4]
	mov r2, r3, lsl #3
	strh r1, [r4, r2]
	ldr r3, [r0]
	mov r2, #0
	ldr r1, [r3, #0x114]
	add r1, r3, r1
	strb r2, [r1, #0x174]
	ldr r2, [r0]
	ldr r1, [r2, #0x114]
	add r1, r1, #1
	str r1, [r2, #0x114]
	ldr r0, [r0, #8]
	cmp r0, #0x20
	bne _023311EC
	bl GetDebugSpecialEpisodeNumber
	b _023311F0
_023311EC:
	bl GetSpecialEpisodeType
_023311F0:
	ldr r2, _0233154C ; =ov01_0233C178
	mov r4, #0
	ldr r3, [r2]
	sub r1, r4, #1
	str r4, [r3, #0x118]
	cmp r0, r1
	ldreq r0, [r2]
	moveq r1, #1
	streqb r1, [r0, #0x10e]
	beq _0233124C
	ldr r1, [r2]
	strb r4, [r1, #0x10e]
	ldr r3, [r2]
	ldr r2, [r3, #0x114]
	b _02331244
_0233122C:
	add r1, r3, r4, lsl #3
	ldr r1, [r1, #0x120]
	cmp r0, r1
	streq r4, [r3, #0x118]
	beq _0233124C
	add r4, r4, #1
_02331244:
	cmp r4, r2
	blt _0233122C
_0233124C:
	mov r4, #0
	bl IsAdventureLogNotEmpty
	cmp r0, #0
	beq _02331268
	mov r0, #2
	mov r1, #1
	bl AddSubMenuOption
_02331268:
	bl sub_02048480
	cmp r0, #0
	beq _023313E4
	mov r4, #1
	bl sub_0204E6A4
	cmp r0, #0
	bne _02331304
	bl sub_0204E40C
	cmp r0, #0
	beq _023312A0
	mov r0, #0xa
	mov r1, r4
	bl AddMainMenuOption
	b _0233131C
_023312A0:
	bl sub_0204E210
	cmp r0, #2
	bne _023312BC
	mov r0, #0xd
	mov r1, r4
	bl AddMainMenuOption
	b _0233131C
_023312BC:
	mvn r1, #0
	cmp r0, r1
	beq _023312D8
	mov r0, #0x1b
	mov r1, r4
	bl AddMainMenuOption
	b _0233131C
_023312D8:
	mov r1, r4
	mov r0, #0x1a
	mov r4, #0
	bl AddMainMenuOption
	bl sub_0204E644
	cmp r0, #0
	beq _0233131C
	mov r0, #0xc
	mov r1, #1
	bl AddMainMenuOption
	b _0233131C
_02331304:
	mov r1, r4
	mov r0, #0xb
	bl AddMainMenuOption
	mov r0, #0xe
	mov r1, r4
	bl AddMainMenuOption
_0233131C:
	mov r0, #4
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02331338
	mov r0, #0xf
	mov r1, #1
	bl AddMainMenuOption
_02331338:
	mov r0, #3
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02331354
	mov r0, #0x12
	mov r1, #1
	bl AddMainMenuOption
_02331354:
	mov r0, #4
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02331370
	mov r0, #0x11
	mov r1, #1
	bl AddMainMenuOption
_02331370:
	mov r0, #8
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0233138C
	mov r0, #0x13
	mov r1, #1
	bl AddMainMenuOption
_0233138C:
	mov r0, #0x1a
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _023313A8
	mov r0, #0x14
	mov r1, #1
	bl AddSubMenuOption
_023313A8:
	mov r0, #1
	bl GetResolvedPerformanceProgressFlag
	mov r1, r0
	mov r0, #8
	bl AddSubMenuOption
	mov r0, #9
	mov r1, #1
	bl AddSubMenuOption
	mov r0, #0x18
	mov r1, #1
	bl AddSubMenuOption
	mov r0, #7
	mov r1, #1
	bl AddSubMenuOption
	b _023313FC
_023313E4:
	mov r0, #0x18
	mov r1, #1
	bl AddSubMenuOption
	mov r0, #3
	mov r1, #1
	bl AddMainMenuOption
_023313FC:
	mov r0, #0x19
	mov r1, #1
	bl AddMainMenuOption
	mov r0, #0x10
	mov r1, #1
	bl AddSubMenuOption
	ldr r0, _0233154C ; =ov01_0233C178
	ldr r0, [r0]
	ldr r0, [r0, #0x114]
	cmp r0, #1
	ble _02331480
	bl IsSpecialEpisodeOpenMismatch
	cmp r0, #0
	beq _0233145C
	cmp r4, #0
	beq _0233144C
	mov r0, #0x1f
	mov r1, #0
	bl AddMainMenuOption
	b _02331480
_0233144C:
	mov r0, #0x1d
	mov r1, #1
	bl AddMainMenuOption
	b _02331480
_0233145C:
	cmp r4, #0
	beq _02331474
	mov r0, #0x1e
	mov r1, #0
	bl AddMainMenuOption
	b _02331480
_02331474:
	mov r0, #0x1c
	mov r1, #1
	bl AddMainMenuOption
_02331480:
	mov r0, #0x21
	mov r1, #1
	bl AddSubMenuOption
	ldr r2, _0233154C ; =ov01_0233C178
	mov r1, #0
	ldr r4, [r2]
	mov r0, #1
	ldr r3, [r4, #0x18]
	add r4, r4, #0x1c
	add r5, r4, r3, lsl #3
	str r0, [r5, #4]
	mov r3, r3, lsl #3
	strh r1, [r4, r3]
	ldr r5, [r2]
	ldr r4, _02331554 ; =0x000001EA
	ldr r3, [r5, #0x94]
	add r5, r5, #0x98
	add r6, r5, r3, lsl #3
	str r0, [r6, #4]
	mov r3, r3, lsl #3
	strh r1, [r5, r3]
	ldr r6, [r2]
	sub r5, r1, #1
	ldr r3, [r6, #0x114]
	add r6, r6, #0x11c
	add r7, r6, r3, lsl #3
	str r5, [r7, #4]
	mov r3, r3, lsl #3
	strh r4, [r6, r3]
	str r5, [r7, #0xc]
	strh r1, [r7, #8]
	ldr r3, [r2]
#ifdef JAPAN
	rsb r4, r4, #0x410
#else
	sub r4, r4, #0x1ec
#endif
	strb r4, [r3]
	ldr r3, [r2]
	strb r4, [r3, #1]
	ldr r3, [r2]
	strb r4, [r3, #2]
	ldr r3, [r2]
	strb r4, [r3, #3]
	ldr r3, [r2]
	strb r4, [r3, #4]
	ldr r3, [r2]
	str r5, [r3, #0x10]
	ldr r3, [r2]
	str r1, [r3, #8]
	ldr r4, [r2, #8]
	ldr r3, [r2]
	str r4, [r3, #0xc]
	str r1, [r2, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233154C: .word ov01_0233C178
#ifdef JAPAN
_02331550: .word 0x0000040E
_02331554: .word 0x00000412
#else
_02331550: .word 0x000001E6
_02331554: .word 0x000001EA
#endif
	arm_func_end CreateMainMenus

	arm_func_start AddMainMenuOption
AddMainMenuOption: ; 0x02331558
	ldr r2, _023315EC ; =MAIN_MENU
	b _023315DC
_02331560:
	ldr ip, [r2]
	cmp ip, r0
	bne _023315D8
	ldr r0, _023315F0 ; =ov01_0233C178
	cmp r1, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x18]
	add r3, r0, #0x1c
	add r0, r3, r1, lsl #3
	str ip, [r0, #4]
	ldrh r0, [r2, #4]
	mov r1, r1, lsl #3
	movne ip, #0
	strh r0, [r3, r1]
	ldr r0, _023315F0 ; =ov01_0233C178
	moveq ip, #3
	ldr r3, [r0]
	ldr r1, [r3, #0x18]
	add r1, r3, r1
	strb ip, [r1, #0x74]
	ldr r3, [r0]
	ldrh r2, [r2, #6]
	ldr r1, [r3, #0x18]
	add r1, r3, r1, lsl #1
	strh r2, [r1, #0x7e]
	ldr r1, [r0]
	ldr r0, [r1, #0x18]
	add r0, r0, #1
	str r0, [r1, #0x18]
	bx lr
_023315D8:
	add r2, r2, #8
_023315DC:
	ldrh r3, [r2, #4]
	cmp r3, #0
	bne _02331560
	bx lr
	.align 2, 0
_023315EC: .word MAIN_MENU
_023315F0: .word ov01_0233C178
	arm_func_end AddMainMenuOption

	arm_func_start ov01_023315F4
ov01_023315F4: ; 0x023315F4
	ldr r1, _0233162C ; =ov01_0233C178
	mov r2, #0
	ldr r3, [r1]
	ldr ip, [r3, #0x18]
	b _0233161C
_02331608:
	add r1, r3, r2, lsl #3
	ldr r1, [r1, #0x20]
	cmp r1, r0
	bxeq lr
	add r2, r2, #1
_0233161C:
	cmp r2, ip
	blt _02331608
	mov r0, #2
	bx lr
	.align 2, 0
_0233162C: .word ov01_0233C178
	arm_func_end ov01_023315F4

	arm_func_start AddSubMenuOption
AddSubMenuOption: ; 0x02331630
	ldr r2, _023316C4 ; =SUBMENU
	b _023316B4
_02331638:
	ldr ip, [r2]
	cmp ip, r0
	bne _023316B0
	ldr r0, _023316C8 ; =ov01_0233C178
	cmp r1, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x94]
	add r3, r0, #0x98
	add r0, r3, r1, lsl #3
	str ip, [r0, #4]
	ldrh r0, [r2, #4]
	mov r1, r1, lsl #3
	movne ip, #0
	strh r0, [r3, r1]
	ldr r0, _023316C8 ; =ov01_0233C178
	moveq ip, #3
	ldr r3, [r0]
	ldr r1, [r3, #0x94]
	add r1, r3, r1
	strb ip, [r1, #0xf0]
	ldr r3, [r0]
	ldrh r2, [r2, #6]
	ldr r1, [r3, #0x94]
	add r1, r3, r1, lsl #1
	strh r2, [r1, #0xfa]
	ldr r1, [r0]
	ldr r0, [r1, #0x94]
	add r0, r0, #1
	str r0, [r1, #0x94]
	bx lr
_023316B0:
	add r2, r2, #8
_023316B4:
	ldrh r3, [r2, #4]
	cmp r3, #0
	bne _02331638
	bx lr
	.align 2, 0
_023316C4: .word SUBMENU
_023316C8: .word ov01_0233C178
	arm_func_end AddSubMenuOption

	arm_func_start ov01_023316CC
ov01_023316CC: ; 0x023316CC
	stmdb sp!, {r3, lr}
	ldr r0, _02331780 ; =ov01_0233C178
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _023316F4
	bl CloseParentMenu
_023316F4:
	ldr r0, _02331780 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02331710
	bl CloseParentMenu
_02331710:
	ldr r0, _02331780 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0233172C
	bl CloseParentMenu
_0233172C:
	ldr r0, _02331780 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _02331748
	bl CloseAdvancedMenu
_02331748:
	ldr r0, _02331780 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _02331764
	bl CloseDialogueBox
_02331764:
	ldr r0, _02331780 ; =ov01_0233C178
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02331780 ; =ov01_0233C178
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02331780: .word ov01_0233C178
	arm_func_end ov01_023316CC

	arm_func_start ov01_02331784
ov01_02331784: ; 0x02331784
#ifdef JAPAN
#define OV01_02331784_OFFSET 0x228
#else
#define OV01_02331784_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x304
_0233178C:
	ldr r0, _02332508 ; =ov01_0233C178
	mov r4, #0
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _023324F4
_023317A8: ; jump table
	b _023317E0 ; case 0
	b _02331810 ; case 1
	b _0233184C ; case 2
	b _02331AB4 ; case 3
	b _02331CA8 ; case 4
	b _02331D4C ; case 5
	b _02331E08 ; case 6
	b _02331EC0 ; case 7
	b _02331F3C ; case 8
	b _02332040 ; case 9
	b _02332128 ; case 10
	b _023322CC ; case 11
	b _0233234C ; case 12
	b _02332340 ; case 13
_023317E0:
	bl ov01_0232E94C
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov01_0232FD74
	cmp r0, #0
	bne _02331810
	bl ov01_0232EDAC
	b _023324F4
_02331810:
	bl ov01_0232E94C
	cmp r0, #0
	bne _023324F4
	bl ov01_0232F910
	ldr r0, _0233250C ; =MAIN_MENU_WINDOW_PARAMS_3
	bl CreateDialogueBox
	ldr r1, _02332508 ; =ov01_0233C178
	mov r3, #2
	ldr r5, [r1]
	mov r2, #0
	strb r0, [r5, #4]
	ldr r0, [r1]
	str r3, [r0, #8]
	ldr r0, [r1]
	str r2, [r0, #0x180]
_0233184C:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02331890
	bl IsParentMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #1]
_02331890:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _023318D4
	bl IsParentMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
_023318D4:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _02331918
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseAdvancedMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #3]
_02331918:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r1, [r0]
	ldr r0, [r1, #0x180]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #0x180]
	bgt _023324F4
	ldrsb r0, [r1]
	mvn r2, #1
	cmp r0, r2
	bne _02331A9C
	ldr ip, [r1, #0xc]
	cmp ip, #0
	beq _023319E4
	cmp ip, #0x1c
	cmpne ip, #0x1d
	cmpne ip, #0x20
	bne _02331998
	mov r0, #0x1c
	bl ov01_023315F4
	cmp r0, #0x1c
	moveq r0, #0x1c
	streq r0, [sp, #0x26c]
	movne r0, #0x1d
	strne r0, [sp, #0x26c]
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #0x20
	movne r0, #0
	strne r0, [r1, #0xc]
	b _02331A1C
_02331998:
	mov r2, ip
	ldr r5, [r1, #0x94]
	mov r3, #0
	b _023319BC
_023319A8:
	add r0, r1, r3, lsl #3
	ldr r0, [r0, #0x9c]
	cmp r0, r2
	beq _023319C8
	add r3, r3, #1
_023319BC:
	cmp r3, r5
	blt _023319A8
	mov r2, #0
_023319C8:
	cmp r2, #0
	streq ip, [sp, #0x26c]
	moveq r0, #0
	streq r0, [r1, #0xc]
	movne r0, #0x19
	strne r0, [sp, #0x26c]
	b _02331A1C
_023319E4:
	mov r0, #0x16
	str r0, [sp, #0x26c]
	bl ov01_023375A0
	cmp r0, #1
	bne _02331A08
	mov r0, #0xc
	bl ov01_023315F4
	str r0, [sp, #0x26c]
	b _02331A1C
_02331A08:
	cmp r0, #2
	bne _02331A1C
	mov r0, #0xa
	bl ov01_023315F4
	str r0, [sp, #0x26c]
_02331A1C:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r3, [r0]
	add r1, r3, #0x74
	str r1, [sp, #0x2cc]
	ldr r1, [r3, #0xc]
	cmp r1, #0x20
	bne _02331A54
	mov r1, #8
	str r1, [r3, #8]
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0, #0x180]
	mov r4, #1
	b _023324F4
_02331A54:
	cmp r1, #0
	beq _02331A78
	mov r1, #4
	str r1, [r3, #8]
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0, #0x180]
	mov r4, #1
	b _023324F4
_02331A78:
	ldr r0, _02332510 ; =MAIN_MENU_WINDOW_PARAMS_1
	ldr r1, _02332514 ; =0x00400231
	add r2, sp, #0x26c
	add r3, r3, #0x1c
	bl CreateParentMenuFromStringIds
	ldr r1, _02332508 ; =ov01_0233C178
	ldr r1, [r1]
	strb r0, [r1]
	b _02331AA0
_02331A9C:
	bl ResumeParentMenu
_02331AA0:
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_02331AB4:
	ldrsb r0, [r1]
	bl GetWindowIdSelectedItemOnPage
	ldr r1, _02332508 ; =ov01_0233C178
	ldr r3, [r1]
	ldr r2, [r3, #0x10]
	cmp r2, r0
	beq _02331AF0
	str r0, [r3, #0x10]
	ldr r3, [r1]
	ldr r1, _02332518 ; =0x00000404
	add r2, r3, r0, lsl #1
	ldrsb r0, [r3, #4]
	ldrh r2, [r2, #0x7e]
	mov r3, r4
	bl ShowStringIdInDialogueBox
_02331AF0:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02331C20
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	cmp r0, #0x19
	bne _02331B44
	ldr r0, _02332508 ; =ov01_0233C178
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0xa
	str r3, [r2, #8]
	ldr r0, [r0]
	mov r4, #1
	str r1, [r0, #0x180]
	b _023324F4
_02331B44:
	cmp r0, #0x1a
	bne _02331B98
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r2, [r0]
	ldrb r1, [r2, #0x10e]
	cmp r1, #0
	movne r1, #5
	strne r1, [r0, #4]
	movne r0, #0xa
	strne r0, [r2, #8]
	bne _023324F4
	mov r1, #6
	str r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #5
	str r2, [r1, #0x110]
	ldr r0, [r0]
	mov r1, #0xa
	str r1, [r0, #0x180]
	mov r4, #1
	b _023324F4
_02331B98:
	cmp r0, #0x1b
	bne _02331BD8
	add r0, sp, #8
	bl sub_0204E2DC
	ldrb r0, [sp, #8]
	cmp r0, #3
	ldreq r0, _02332508 ; =ov01_0233C178
	moveq r1, #6
	ldrne r0, _02332508 ; =ov01_0233C178
	movne r1, #5
	str r1, [r0, #4]
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_02331BD8:
	sub r1, r0, #0x1c
	cmp r1, #1
	bhi _02331C08
	ldr r0, _02332508 ; =ov01_0233C178
	mov r3, #8
	ldr r2, [r0]
	mov r1, #0xa
	str r3, [r2, #8]
	ldr r0, [r0]
	mov r4, #1
	str r1, [r0, #0x180]
	b _023324F4
_02331C08:
	ldr r1, _02332508 ; =ov01_0233C178
	mov r2, #0xa
	str r0, [r1, #4]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023324F4
_02331C20:
	add r1, sp, #0xa
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #0xa]
	tst r0, #0x200
	mov r0, #0
	mov r1, r0
	beq _02331C74
	bl sub_02009194
	mov r0, #1
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_02009194
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202B0A4
	b _023324F4
_02331C74:
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202B0A4
	b _023324F4
_02331CA8:
	ldrsb r0, [r1]
	sub r1, r4, #2
	cmp r0, r1
	beq _02331CE4
	bl IsParentMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02331CE4:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r3, [r0]
	ldr r1, [r3, #0x180]
	cmp r1, #0
	subgt r0, r1, #1
	strgt r0, [r3, #0x180]
	bgt _023324F4
	ldr r2, [r3, #0xc]
	mov r1, #0
	str r2, [sp, #0x1d4]
	str r1, [r3, #0xc]
	ldr r3, [r0]
	ldr r0, _0233251C ; =MAIN_MENU_WINDOW_PARAMS_2
	add r5, r3, #0xf0
	ldr r1, _02332520 ; =0x00400233
	add r2, sp, #0x1d4
	add r3, r3, #0x98
	str r5, [sp, #0x234]
	bl CreateParentMenuFromStringIds
	ldr r1, _02332508 ; =ov01_0233C178
	mov r2, #5
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023324F4
_02331D4C:
	ldrsb r0, [r1, #1]
	bl GetWindowIdSelectedItemOnPage
	ldr r1, _02332508 ; =ov01_0233C178
	add r3, r0, #0x64
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	cmp r0, r3
	beq _02331D8C
	str r3, [r2, #0x10]
	ldr r0, [r1]
	ldr r1, _02332518 ; =0x00000404
	add r2, r0, r3, lsl #1
	ldrsb r0, [r0, #4]
	ldrh r2, [r2, #0x32]
	mov r3, r4
	bl ShowStringIdInDialogueBox
_02331D8C:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl GetSimpleMenuResult__0202AEA4
	cmp r0, #0x21
	cmpne r0, #1
	bne _02331DF0
	ldr r0, _02332508 ; =ov01_0233C178
	mov r2, #2
	ldr r1, [r0]
	mov r3, #0xa
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #0x180]
	ldr r0, [r0]
	mov r4, #1
	str r1, [r0, #0xc]
	b _023324F4
_02331DF0:
	ldr r1, _02332508 ; =ov01_0233C178
	mov r2, #0xa
	str r0, [r1, #4]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023324F4
_02331E08:
	ldrsb r0, [r1]
	sub r1, r4, #2
	cmp r0, r1
	beq _02331E44
	bl IsParentMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02331E44:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r1, [r0]
	ldr r0, [r1, #0x180]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #0x180]
	bgt _023324F4
	ldr r5, [r1, #0x110]
	ldr r1, _02332524 ; =0x00400033
	ldr r3, _02332528 ; =CONTINUE_CHOICE
	add r2, sp, #0x13c
	mov r0, #0
	str r5, [sp, #0x13c]
	bl CreateParentMenuFromStringIds
	ldr r3, _02332508 ; =ov01_0233C178
	ldr r1, _02332518 ; =0x00000404
	ldr r5, [r3]
#ifdef JAPAN
	add r2, r1, #3
#else
	ldr r2, _0233252C ; =0x000001DF
#endif
	strb r0, [r5, #2]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #4]
	bl ShowStringIdInDialogueBox
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_02331EC0:
	ldrsb r0, [r1, #2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl GetSimpleMenuResult__0202AEA4
	cmp r0, #0x21
	cmpne r0, #1
	bne _02331F1C
	ldr r0, _02332508 ; =ov01_0233C178
	mov r2, #2
	ldr r1, [r0]
	mov r3, #0xa
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #0x1a
	str r3, [r2, #0x180]
	ldr r0, [r0]
	mov r4, #1
	str r1, [r0, #0xc]
	b _023324F4
_02331F1C:
	ldr r1, _02332508 ; =ov01_0233C178
	mov r2, #0xa
	ldr r3, [r1]
	str r0, [r3, #0x110]
	str r0, [r1, #4]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023324F4
_02331F3C:
	ldrsb r0, [r1]
	sub r1, r4, #2
	cmp r0, r1
	beq _02331F78
	bl IsParentMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02331F78:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r5, [r0]
	ldr r0, [r5, #0x180]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r5, #0x180]
	bgt _023324F4
	ldr r3, [r5, #0x118]
	ldr r2, _02332530 ; =0x000001E1
	add r0, r5, #0x174
	mov r1, #0x10
	str r3, [sp, #0xa4]
	strh r2, [sp, #0xac]
	str r1, [sp, #0xb0]
	str r0, [sp, #0x104]
	ldr r5, [r5, #0x114]
	ldr r0, _02332534 ; =MAIN_MENU_WINDOW_PARAMS_4
	str r5, [sp]
	mov r5, #0xa
	ldr r1, _02332538 ; =0x00400A33
	ldr r3, _0233253C ; =ov01_02332580
	add r2, sp, #0xa4
	str r5, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02332508 ; =ov01_0233C178
	ldr r1, [r1]
	strb r0, [r1, #3]
	bl ov01_02332648
	ldr r1, _02332508 ; =ov01_0233C178
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2, #0x14]
	ldr r1, [r1]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrne r2, _02332540 ; =0x000001E9
	ldrsb r0, [r1, #4]
	moveq r2, #0x1e8 + OV01_02331784_OFFSET
	mov r2, r2, lsl #0x10
	ldr r1, _02332518 ; =0x00000404
	mov r2, r2, lsr #0x10
	bl ShowStringIdInDialogueBox
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #9
	str r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_02332040:
	bl ov01_02332648
	ldr r1, _02332508 ; =ov01_0233C178
	ldr r3, [r1]
	ldrb r2, [r3, #0x14]
	cmp r2, r0
	beq _02332088
	strb r0, [r3, #0x14]
	ldr r1, [r1]
	mov r3, #0
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrne r2, _02332540 ; =0x000001E9
	ldrsb r0, [r1, #4]
	moveq r2, #0x1e8 + OV01_02331784_OFFSET
	mov r2, r2, lsl #0x10
	ldr r1, _02332518 ; =0x00000404
	mov r2, r2, lsr #0x10
	bl ShowStringIdInDialogueBox
_02332088:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetAdvancedMenuResult
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _02332508 ; =ov01_0233C178
	ldrne r1, [r1]
	addne r0, r1, r0, lsl #3
	ldrne r1, [r0, #0x120]
	mvn r0, #0
	cmp r1, r0
	bne _02332104
	ldr r0, _02332508 ; =ov01_0233C178
	mov r2, #2
	ldr r1, [r0]
	mov r3, #0xa
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0x180]
	ldr r0, [r0]
	mov r4, #1
	str r1, [r0, #0xc]
	b _023324F4
_02332104:
	mov r0, r1
	bl SetDebugSpecialEpisodeNumber
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #4
	str r1, [r0, #4]
	ldr r0, [r0]
	mov r1, #0xa
	str r1, [r0, #8]
	b _023324F4
_02332128:
	ldrsb r0, [r1, #4]
	mov r5, #1
	sub r1, r5, #3
	cmp r0, r1
	beq _02332148
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023324F4
_02332148:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _02332190
	bl IsParentMenuActive
	cmp r0, #0
	movne r5, #0
	bne _02332190
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02332190:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023321D8
	bl IsParentMenuActive
	cmp r0, #0
	movne r5, #0
	bne _023321D8
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #1]
_023321D8:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02332220
	bl IsParentMenuActive
	cmp r0, #0
	movne r5, #0
	bne _02332220
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
_02332220:
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _02332268
	bl IsAdvancedMenuActive2
	cmp r0, #0
	movne r5, #0
	bne _02332268
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseAdvancedMenu
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #3]
_02332268:
	cmp r5, #0
	ldrne r0, _02332508 ; =ov01_0233C178
	mvnne r1, #1
	ldrne r0, [r0]
	ldrnesb r0, [r0, #4]
	cmpne r0, r1
	beq _023322B4
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r5, #0
	bne _023322B4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseDialogueBox
	ldr r0, _02332508 ; =ov01_0233C178
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_023322B4:
	cmp r5, #0
	ldrne r0, _02332508 ; =ov01_0233C178
	movne r1, #0xb
	ldrne r0, [r0]
	strne r1, [r0, #8]
	b _023324F4
_023322CC:
	bl ov01_0232E94C
	cmp r0, #0
	bne _023324F4
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r0, [r0, #4]
	sub r0, r0, #0xf
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0233232C
_023322F0: ; jump table
	b _02332314 ; case 0
	b _02332314 ; case 1
	b _02332314 ; case 2
	b _02332314 ; case 3
	b _02332314 ; case 4
	b _0233232C ; case 5
	b _0233232C ; case 6
	b _0233232C ; case 7
	b _02332314 ; case 8
_02332314:
	bl ov01_0232EDAC
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_0233232C:
	ldr r0, _02332508 ; =ov01_0233C178
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023324F4
_02332340:
	bl ov01_0232E94C
	cmp r0, #0
	bne _023324F4
_0233234C:
	ldr r0, _02332508 ; =ov01_0233C178
	ldr r2, _02332544 ; =ov01_0233254C
	mov r4, #0
	str r2, [sp, #0x90]
	ldr r1, [r0]
	str r4, [sp, #0x94]
	mov r2, #0xe
	str r2, [r1, #8]
	ldr r0, [r0, #4]
	cmp r0, #0x18
	addls pc, pc, r0, lsl #2
	b _023324D8
_0233237C: ; jump table
	b _023324D8 ; case 0
	b _023324D8 ; case 1
	b _02332480 ; case 2
	b _023323E0 ; case 3
	b _023323E8 ; case 4
	b _02332414 ; case 5
	b _02332420 ; case 6
	b _02332408 ; case 7
	b _02332490 ; case 8
	b _0233249C ; case 9
	b _0233242C ; case 10
	b _02332444 ; case 11
	b _02332450 ; case 12
	b _02332438 ; case 13
	b _02332458 ; case 14
	b _02332468 ; case 15
	b _02332478 ; case 16
	b _02332460 ; case 17
	b _02332488 ; case 18
	b _02332470 ; case 19
	b _023324B8 ; case 20
	b _023324D8 ; case 21
	b _023324C8 ; case 22
	b _023324C0 ; case 23
	b _023324D0 ; case 24
_023323E0:
	mov r4, #4
	b _023324DC
_023323E8:
	bl GetSpecialEpisodeType
	mvn r1, #0
	cmp r0, r1
	moveq r4, #5
	beq _023324DC
	mov r0, #4
	bl ov01_02332698
	b _023324DC
_02332408:
	mov r0, #3
	bl ov01_02332698
	b _023324DC
_02332414:
	mov r0, r4
	bl ov01_02332698
	b _023324DC
_02332420:
	mov r0, #1
	bl ov01_02332698
	b _023324DC
_0233242C:
	mov r0, r4
	bl ov01_02332698
	b _023324DC
_02332438:
	mov r0, #2
	bl ov01_02332698
	b _023324DC
_02332444:
	mov r0, #5
	bl ov01_02332698
	b _023324DC
_02332450:
	mov r4, #0xb
	b _023324DC
_02332458:
	mov r4, #0xd
	b _023324DC
_02332460:
	bl ov01_02337634
	b _023324DC
_02332468:
	bl ov01_0233758C
	b _023324DC
_02332470:
	bl ov01_02337668
	b _023324DC
_02332478:
	bl ov01_02337914
	b _023324DC
_02332480:
	bl ov01_02333678
	b _023324DC
_02332488:
	bl ov01_023375E0
	b _023324DC
_02332490:
	mov r0, r4
	bl ov01_023371B4
	b _023324DC
_0233249C:
	ldr r3, _02332548 ; =ov01_02332570
	add r2, sp, #0xc
	mov r0, #1
	mov r1, #0x100
	str r3, [sp, #0x90]
	bl sub_02035CE4
	b _023324DC
_023324B8:
	bl ov00_022BE0B4
	b _023324DC
_023324C0:
	bl ov01_023375F4
	b _023324DC
_023324C8:
	bl ov01_0233396C
	b _023324DC
_023324D0:
	bl ov00_022BE094
	b _023324DC
_023324D8:
	bl ov01_0233396C
_023324DC:
	cmp r4, #0
	beq _023324EC
	mov r0, r4
	bl ov00_022BE4A8
_023324EC:
	mov r0, #4
	b _02332500
_023324F4:
	cmp r4, #0
	bne _0233178C
	mov r0, #1
_02332500:
	add sp, sp, #0x304
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02332508: .word ov01_0233C178
_0233250C: .word MAIN_MENU_WINDOW_PARAMS_3
_02332510: .word MAIN_MENU_WINDOW_PARAMS_1
_02332514: .word 0x00400231
_02332518: .word 0x00000404
_0233251C: .word MAIN_MENU_WINDOW_PARAMS_2
_02332520: .word 0x00400233
_02332524: .word 0x00400033
_02332528: .word CONTINUE_CHOICE
#ifndef JAPAN
_0233252C: .word 0x000001DF
#endif
_02332530: .word 0x000001E1 + OV01_02331784_OFFSET
_02332534: .word MAIN_MENU_WINDOW_PARAMS_4
_02332538: .word 0x00400A33
_0233253C: .word ov01_02332580
_02332540: .word 0x000001E9 + OV01_02331784_OFFSET
_02332544: .word ov01_0233254C
_02332548: .word ov01_02332570
	arm_func_end ov01_02331784

	arm_func_start ov01_0233254C
ov01_0233254C: ; 0x0233254C
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _02332564
	mov r0, #0
	bl ov01_023310B8
	ldmia sp!, {r3, pc}
_02332564:
	mov r0, r1
	bl ov00_022BE4A8
	ldmia sp!, {r3, pc}
	arm_func_end ov01_0233254C

	arm_func_start ov01_02332570
ov01_02332570: ; 0x02332570
	ldr ip, _0233257C ; =ov01_023310B8
	mov r0, #9
	bx ip
	.align 2, 0
_0233257C: .word ov01_023310B8
	arm_func_end ov01_02332570

	arm_func_start ov01_02332580
ov01_02332580: ; 0x02332580
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r2, _0233262C ; =ov01_0233C178
	mov r5, r1
	ldr r2, [r2]
	mvn r1, #0
	add r2, r2, r5, lsl #3
	ldr r7, [r2, #0x120]
	mov r6, r0
	cmp r7, r1
	ldr r8, _02332630 ; =ov01_0233B670
	ldr r4, _02332634 ; =ov01_0233B678
	beq _023325E4
	mov r0, r7
	bl IsSpecialEpisodeBeaten
	cmp r0, #0
	ldrne r8, _02332638 ; =ov01_0233B6A4
	bne _023325D8
	mov r0, r7
	bl IsSpecialEpisodeOpenOld
	cmp r0, #0
	ldreq r8, _0233263C ; =ov01_0233B6B0
_023325D8:
	bl GetSpecialEpisodeType
	cmp r7, r0
	ldreq r4, _02332640 ; =ov01_0233B6BC
_023325E4:
	ldr r0, _0233262C ; =ov01_0233C178
	str r8, [sp, #0x3c]
	ldr r0, [r0]
	add r0, r0, r5, lsl #3
	add r0, r0, #0x100
	ldrh r0, [r0, #0x1c]
	bl StringFromId
	str r0, [sp, #0x40]
	add r5, sp, #4
	ldr r3, _02332644 ; =0x0000C402
	mov r0, r6
	mov r2, r4
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessString
	mov r0, r6
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233262C: .word ov01_0233C178
_02332630: .word ov01_0233B670
_02332634: .word ov01_0233B678
_02332638: .word ov01_0233B6A4
_0233263C: .word ov01_0233B6B0
_02332640: .word ov01_0233B6BC
_02332644: .word 0x0000C402
	arm_func_end ov01_02332580

	arm_func_start ov01_02332648
ov01_02332648: ; 0x02332648
	stmdb sp!, {r4, lr}
	ldr r0, _02332694 ; =ov01_0233C178
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetAdvancedMenuCurrentOption
	ldr r2, _02332694 ; =ov01_0233C178
	mvn r1, #0
	ldr r2, [r2]
	add r0, r2, r0, lsl #3
	ldr r4, [r0, #0x120]
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl GetSpecialEpisodeType
	cmp r4, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02332694: .word ov01_0233C178
	arm_func_end ov01_02332648

	arm_func_start ov01_02332698
ov01_02332698: ; 0x02332698
#ifdef JAPAN
#define OV01_02332698_OFFSET 0x222A
#else
#define OV01_02332698_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xa4
	mov r5, r0
	mov r1, #0
	ldr r0, _023329C4 ; =ov01_0233B70C
	str r1, [sp, #0xc]
	bl InitMenu
	cmp r0, #0
	beq _023329BC
	ldr r0, _023329C8 ; =ov01_0233C184
	ldr r0, [r0]
	cmp r0, #0
	bne _023326EC
	mov r0, #0x630
	mov r1, #8
	bl MemAlloc
	ldr r3, _023329C8 ; =ov01_0233C184
	mov r1, #0
	mov r2, #0x630
	str r0, [r3]
	bl MemsetSimple
_023326EC:
	ldr r0, _023329C8 ; =ov01_0233C184
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x624]
	bl sub_0204E3C8
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x61c]
	bl sub_0204E40C
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x61d]
	bl sub_0204E464
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x61e]
	bl sub_0204E4BC
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x61f]
	bl sub_0204E4EC
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x620]
	bl sub_0204E530
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r2, [r1]
	strb r0, [r2, #0x621]
	ldr r3, [r1]
	ldr r0, _023329CC ; =ov01_0233B798
	ldrb r1, [r3, #0x61f]
	str r1, [sp]
	ldrb r1, [r3, #0x620]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x621]
	str r1, [sp, #8]
	ldrb r1, [r3, #0x61c]
	ldrb r2, [r3, #0x61d]
	ldrb r3, [r3, #0x61e]
	bl Debug_Print0
	ldr r0, _023329C8 ; =ov01_0233C184
	mov r3, #0
	mvn r2, #1
_02332798:
	ldr r1, [r0]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0x60f]
	cmp r3, #0xd
	blt _02332798
	bl sub_0204A1CC
	bl ov00_022BCA80
	bl ov00_022BCCF4
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x622]
	mov r0, #1
	bl ov00_022BCBAC
	ldr r0, _023329C8 ; =ov01_0233C184
	ldr r1, [r0]
	str r5, [r1]
	ldr r1, [r0]
	str r5, [r1, #8]
	ldr r0, [r0]
	mov r1, #0x32
	ldr r0, [r0]
	cmp r0, #1
	cmpne r0, #4
	mov r0, #0
	beq _02332810
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	ldr r1, _023329C8 ; =ov01_0233C184
	b _0233281C
_02332810:
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	ldr r1, _023329C8 ; =ov01_0233C184
_0233281C:
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, _023329D0 ; =MAIN_MENU_WINDOW_PARAMS_5
	ldr r1, _023329D4 ; =ProcessContinueScreenContents
	bl CreateTextBox
	ldr r2, _023329C8 ; =ov01_0233C184
	mov r1, #0
	ldr r2, [r2]
	strb r0, [r2, #0x60c]
	ldr r0, _023329D8 ; =MAIN_MENU_WINDOW_PARAMS_6
	bl CreateTextBox
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r2, [r1]
	strb r0, [r2, #0x60d]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02332950
_02332868: ; jump table
	b _02332898 ; case 0
	b _02332898 ; case 1
	b _023328CC ; case 2
	b _023328F0 ; case 3
	b _02332910 ; case 4
	b _023328E0 ; case 5
	b _02332950 ; case 6
	b _02332950 ; case 7
	b _02332950 ; case 8
	b _02332950 ; case 9
	b _02332900 ; case 10
	b _02332944 ; case 11
_02332898:
	ldrb r0, [r1, #0x61d]
	cmp r0, #0
	ldrne r4, _023329DC ; =0x00000203
	bne _02332950
	ldr r0, [r1, #4]
	cmp r0, #0xa
#ifdef JAPAN
	ldreq r4, _0233417C ; =0x0000242A
#else
	moveq r4, #0x200
#endif
	beq _02332950
	ldrb r0, [r1, #0x61c]
	cmp r0, #0
	ldrne r4, _023329E0 ; =0x00000201
#ifdef JAPAN
	ldreq r4, _0233417C ; =0x0000242A
#else
	moveq r4, #0x200
#endif
	b _02332950
_023328CC:
	ldrb r0, [r1, #0x61c]
	cmp r0, #0
	ldrne r4, _023329E4 ; =0x00000202
#ifdef JAPAN
	ldreq r4, _0233417C ; =0x0000242A
#else
	moveq r4, #0x200
#endif
	b _02332950
_023328E0:
	mov r0, #1
	str r0, [sp, #0xc]
#ifdef JAPAN
	ldr r4, _02334188 ; =0x0000242E
#else
	mov r4, #0x204
#endif
	b _02332950
_023328F0:
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r4, _023329E8 ; =0x00000206
	b _02332950
_02332900:
	mov r0, #1
	str r0, [sp, #0xc]
#ifdef JAPAN
	ldr r4, _02334190 ; =0x00002431
#else
	rsb r4, r0, #0x208
#endif
	b _02332950
_02332910:
	bl GetSpecialEpisodeType
	mov r5, r0
	bl GetDebugSpecialEpisodeNumber
	mvn r1, #0
	cmp r5, r1
	beq _02332950
	cmp r5, r0
	mov r0, #1
#ifdef JAPAN
	ldreq r4, _02334194 ; =0x00002432
	streq r0, [sp, #0xc]
	strne r0, [sp, #0xc]
	ldrne r4, _02334198 ; =0x00002433
#else
	streq r0, [sp, #0xc]
	moveq r4, #0x208
	strne r0, [sp, #0xc]
	addne r4, r0, #0x208
#endif
	b _02332950
_02332944:
	mov r0, #1
	ldr r4, _023329EC ; =0x0000020A
	str r0, [sp, #0xc]
_02332950:
	ldr r0, _023329C8 ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl sub_02027B1C
	ldr r0, _023329C8 ; =ov01_0233C184
	mov r1, #4
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	mov r3, r4
	bl AppendStandardStringToMission
	ldr r0, _023329C8 ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl UpdateWindow
	ldr r0, _023329F0 ; =MAIN_MENU_WINDOW_PARAMS_7
	ldr r3, _023329F4 ; =MAIN_MENU_ITEMS_CONFIRM
	add r2, sp, #0xc
	mov r1, #0x33
	bl CreateParentMenuFromStringIds
	ldr r1, _023329C8 ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x60e]
	bl ov01_0232F408
_023329BC:
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_023329C4: .word ov01_0233B70C
_023329C8: .word ov01_0233C184
_023329CC: .word ov01_0233B798
_023329D0: .word MAIN_MENU_WINDOW_PARAMS_5
_023329D4: .word ProcessContinueScreenContents
_023329D8: .word MAIN_MENU_WINDOW_PARAMS_6
_023329DC: .word 0x00000203 + OV01_02332698_OFFSET
#ifdef JAPAN
_0233417C: .word 0x0000242A
#endif
_023329E0: .word 0x00000201 + OV01_02332698_OFFSET
_023329E4: .word 0x00000202 + OV01_02332698_OFFSET
#ifdef JAPAN
_02334188: .word 0x0000242E
#endif
_023329E8: .word 0x00000206 + OV01_02332698_OFFSET
#ifdef JAPAN
_02334190: .word 0x00002431
_02334194: .word 0x00002432
_02334198: .word 0x00002433
#endif
_023329EC: .word 0x0000020A + OV01_02332698_OFFSET
_023329F0: .word MAIN_MENU_WINDOW_PARAMS_7
_023329F4: .word MAIN_MENU_ITEMS_CONFIRM
	arm_func_end ov01_02332698

	arm_func_start ov01_023329F8
ov01_023329F8: ; 0x023329F8
	stmdb sp!, {r3, lr}
	ldr r0, _02332A7C ; =ov01_0233C184
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_02332A80
	bl sub_0202737C
	ldr r0, _02332A7C ; =ov01_0233C184
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r2, [r0, #0xc]
	cmp r2, r1
	beq _02332A60
	ldrsb r0, [r0, #0xe]
	bl CloseParentMenu
	ldr r0, _02332A7C ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl CloseTextBox
	ldr r0, _02332A7C ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xc]
	bl CloseTextBox
_02332A60:
	ldr r0, _02332A7C ; =ov01_0233C184
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02332A7C ; =ov01_0233C184
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02332A7C: .word ov01_0233C184
	arm_func_end ov01_023329F8

	arm_func_start ov01_02332A80
ov01_02332A80: ; 0x02332A80
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _02332AC8 ; =ov01_0233C184
	mov r4, #0
	mvn r6, #1
_02332A90:
	ldr r0, [r5]
	add r0, r0, r4
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xf]
	cmp r0, r6
	beq _02332AB8
	bl CloseTextBox
	ldr r0, [r5]
	add r0, r0, r4
	strb r6, [r0, #0x60f]
_02332AB8:
	add r4, r4, #1
	cmp r4, #0xd
	blt _02332A90
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02332AC8: .word ov01_0233C184
	arm_func_end ov01_02332A80

	arm_func_start ov01_02332ACC
ov01_02332ACC: ; 0x02332ACC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r3, [r0]
	ldr r1, [r3, #0x624]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02332ED0
_02332AEC: ; jump table
	b _02332B0C ; case 0
	b _02332B50 ; case 1
	b _02332C10 ; case 2
	b _02332C30 ; case 3
	b _02332ED0 ; case 4
	b _02332E10 ; case 5
	b _02332E10 ; case 6
	b _02332E10 ; case 7
_02332B0C:
	add r0, r3, #0x600
	ldrsb r0, [r0, #0xe]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02332ED0
	ldr r0, _02332EDC ; =ov01_0233C184
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #0x624]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #3
	cmpne r0, #5
	cmpne r0, #4
	beq _02332ED0
	bl ov01_0232EDAC
	b _02332ED0
_02332B50:
	add r0, r3, #0x600
	ldrsb r0, [r0, #0xe]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02332ED0
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xe]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _02332EDC ; =ov01_0233C184
	ldr r2, [r1]
	str r0, [r2, #0x62c]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	cmp r0, #3
	cmpne r0, #5
	cmpne r0, #4
	moveq r0, #3
	streq r0, [r1, #0x624]
	beq _02332ED0
	bl ov01_02332A80
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xe]
	bl CloseParentMenu
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl CloseTextBox
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xc]
	bl CloseTextBox
	ldr r0, _02332EDC ; =ov01_0233C184
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x60c]
	ldr r2, [r0]
	mov r1, #4
	str r3, [r2, #0x624]
	ldr r0, [r0]
	str r1, [r0, #0x628]
	b _02332ED0
_02332C10:
	ldr r2, [r3, #0x628]
	sub r1, r2, #1
	str r1, [r3, #0x628]
	cmp r2, #0
	ldreq r0, [r0]
	moveq r1, #3
	streq r1, [r0, #0x624]
	b _02332ED0
_02332C30:
	mov r1, #4
	str r1, [r3, #0x624]
	ldr r2, [r0]
	ldr r1, [r2, #0x62c]
	cmp r1, #2
	bne _02332DCC
	ldr r1, [r2, #8]
	cmp r1, #0xb
	addls pc, pc, r1, lsl #2
	b _02332ED0
_02332C58: ; jump table
	b _02332C88 ; case 0
	b _02332CAC ; case 1
	b _02332CD0 ; case 2
	b _02332D1C ; case 3
	b _02332D5C ; case 4
	b _02332CDC ; case 5
	b _02332ED0 ; case 6
	b _02332ED0 ; case 7
	b _02332ED0 ; case 8
	b _02332D10 ; case 9
	b _02332D4C ; case 10
	b _02332DBC ; case 11
_02332C88:
	ldrb r0, [r2, #0x61d]
	cmp r0, #0
	beq _02332CA0
	mov r0, #9
	bl ov00_022BE4A8
	b _02332ED0
_02332CA0:
	mov r0, #6
	bl ov00_022BE4A8
	b _02332ED0
_02332CAC:
	ldrb r0, [r2, #0x61d]
	cmp r0, #0
	beq _02332CC4
	mov r0, #9
	bl ov00_022BE4A8
	b _02332ED0
_02332CC4:
	mov r0, #7
	bl ov00_022BE4A8
	b _02332ED0
_02332CD0:
	mov r0, #0xc
	bl ov00_022BE4A8
	b _02332ED0
_02332CDC:
	mov r1, #9
	str r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #6
	str r2, [r1, #0x624]
	ldr r1, [r0]
	mov r2, #0xa
	str r2, [r1, #0x628]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xe]
	bl CloseParentMenu
	b _02332ED0
_02332D10:
	mov r0, #0xa
	bl ov00_022BE4A8
	b _02332ED0
_02332D1C:
	mov r3, #0xa
	str r3, [r2, #8]
	ldr r1, [r0]
	mov r2, #5
	str r2, [r1, #0x624]
	ldr r1, [r0]
	str r3, [r1, #0x628]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xe]
	bl CloseParentMenu
	b _02332ED0
_02332D4C:
	mov r0, #8
	bl ov00_022BE4A8
	mov r0, #4
	b _02332ED4
_02332D5C:
	bl GetDebugSpecialEpisodeNumber
	bl IsSpecialEpisodeBeaten
	cmp r0, #0
	beq _02332DAC
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xe]
	bl CloseParentMenu
	ldr r0, _02332EDC ; =ov01_0233C184
	mov r2, #0xb
	ldr r1, [r0]
	mov r3, #7
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #0xa
	str r3, [r2, #0x624]
	ldr r0, [r0]
	str r1, [r0, #0x628]
	b _02332ED0
_02332DAC:
	mov r0, #5
	bl ov00_022BE4A8
	mov r0, #4
	b _02332ED4
_02332DBC:
	mov r0, #5
	bl ov00_022BE4A8
	mov r0, #4
	b _02332ED4
_02332DCC:
	ldr r0, [r2, #8]
	cmp r0, #4
	cmpne r0, #0xb
	bne _02332DE8
	mov r0, #0x20
	bl ov01_023310B8
	b _02332E08
_02332DE8:
	cmp r0, #3
	cmpne r0, #0xa
	bne _02332E00
	mov r0, #7
	bl ov01_023310B8
	b _02332E08
_02332E00:
	mov r0, #0
	bl ov01_023310B8
_02332E08:
	mov r0, #4
	b _02332ED4
_02332E10:
	ldr r2, [r3, #0x628]
	sub r1, r2, #1
	str r1, [r3, #0x628]
	cmp r2, #0
	bne _02332ED0
	ldr r2, [r0]
	ldr r0, [r2, #0x624]
	cmp r0, #5
	beq _02332E44
	cmp r0, #6
	beq _02332E4C
	cmp r0, #7
	beq _02332E54
_02332E44:
	ldr r4, _02332EE0 ; =0x00000207
	b _02332E58
_02332E4C:
	ldr r4, _02332EE4 ; =0x00000205
	b _02332E58
_02332E54:
	ldr r4, _02332EE8 ; =0x0000020A
_02332E58:
	mov r1, #0
	str r1, [r2, #0x624]
	ldr r0, _02332EDC ; =ov01_0233C184
	mov r1, #1
	ldr r0, [r0]
	str r1, [sp]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl sub_02027B1C
	ldr r0, _02332EDC ; =ov01_0233C184
	mov r1, #4
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	mov r3, r4
	bl AppendStandardStringToMission
	ldr r0, _02332EDC ; =ov01_0233C184
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0xd]
	bl UpdateWindow
	ldr r0, _02332EEC ; =MAIN_MENU_WINDOW_PARAMS_7
	ldr r3, _02332EF0 ; =MAIN_MENU_ITEMS_CONFIRM
	add r2, sp, #0
	mov r1, #0x33
	bl CreateParentMenuFromStringIds
	ldr r1, _02332EDC ; =ov01_0233C184
	ldr r1, [r1]
	strb r0, [r1, #0x60e]
_02332ED0:
	mov r0, #1
_02332ED4:
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV01_02332ACC_OFFSET 0x222A
#else
#define OV01_02332ACC_OFFSET 0
#endif
_02332EDC: .word ov01_0233C184
_02332EE0: .word 0x00000207 + OV01_02332ACC_OFFSET
_02332EE4: .word 0x00000205 + OV01_02332ACC_OFFSET
_02332EE8: .word 0x0000020A + OV01_02332ACC_OFFSET
_02332EEC: .word MAIN_MENU_WINDOW_PARAMS_7
_02332EF0: .word MAIN_MENU_ITEMS_CONFIRM
	arm_func_end ov01_02332ACC

	arm_func_start ProcessContinueScreenContents
ProcessContinueScreenContents: ; 0x02332EF4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x94
	sub sp, sp, #0x800
	ldr r3, _0233361C ; =0x0000020B
	mov r1, #8
	mov r2, #0
	mov r4, r0
	bl AppendStandardStringToMission
	ldr r3, _02333620 ; =ov01_0233B7BC
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	ldr r3, _02333624 ; =0x0000020F
	mov r0, r4
	mov r1, #8
	mov r2, #0x1c
	bl AppendStandardStringToMission
#ifdef JAPAN
	ldr r3, _02334DCC ; =0x0000243A
#endif
	mov r0, r4
	mov r1, #8
	mov r2, #0x36
#ifndef JAPAN
	mov r3, #0x210
#endif
	bl AppendStandardStringToMission
	mov r0, r4
	mov r1, #8
	mov r2, #0x43
#ifdef JAPAN
	ldr r3, _02334DD0 ; =0x0000243B
#else
	rsb r3, r2, #0x254
#endif
	bl AppendStandardStringToMission
	ldr r0, _02333628 ; =ov01_0233C184
	ldr r1, [r0]
	ldrb r0, [r1, #0x61d]
	cmp r0, #0
	beq _02332FC8
	ldr r0, _0233362C ; =_020B0A5C
	ldr r1, [r0]
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _02332FA4
	ldr r3, _02333630 ; =0x00000212
	mov r0, r4
	mov r1, #8
	mov r2, #0x50
	bl AppendStandardStringToMission
	b _02333000
_02332FA4:
	ldrsh r0, [r1, #0x48]
	cmp r0, #0
	beq _02333000
	ldr r3, _02333634 ; =0x00000213
	mov r0, r4
	mov r1, #8
	mov r2, #0x50
	bl AppendStandardStringToMission
	b _02333000
_02332FC8:
	ldrb r0, [r1, #0x61e]
	cmp r0, #0
	ldrneb r0, [r1, #0x622]
	cmpne r0, #0
	beq _02333000
	mov r0, #0
	bl sub_0205BBA4
	cmp r0, #0
	beq _02333000
#ifndef JAPAN
	ldr r3, _02333638 ; =0x00000216
#endif
	mov r0, r4
	mov r1, #8
	mov r2, #0x50
#ifdef JAPAN
	mov r3, #0x2440
#endif
	bl AppendStandardStringToMission
_02333000:
	ldr r0, _02333628 ; =ov01_0233C184
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	cmpne r0, #4
	beq _02333110
#ifdef JAPAN
	ldr r3, _02334DE4 ; =0x00002437
	mov r0, r4
	mov r1, #8
	mov r2, #0xf
#else
	mov r2, #0xf
	mov r0, r4
	rsb r3, r2, #0x21c
	mov r1, #8
#endif
	bl AppendStandardStringToMission
	add r0, sp, #0x400
	ldr r1, _0233363C ; =0x000001F9
	add r0, r0, #0x94
	bl GetStringFromFileVeneer
	mov r3, #0
	add r2, sp, #0x400
	ldr r0, _02333628 ; =ov01_0233C184
	str r3, [sp]
	ldr r0, [r0]
	add r2, r2, #0x94
	add r0, r0, #0xc
	mov r1, #0x100
	bl PreprocessString
	ldr r1, _02333628 ; =ov01_0233C184
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0x90
	add r3, r2, #0xc
	mov r2, #0xf
	bl DrawTextInWindow
	bl GetHero
	movs r5, r0
	add r0, sp, #0x400
	add r0, r0, #0x94
	bne _023330A4
	ldr r1, _02333640 ; =0x000001FA
	bl GetStringFromFileVeneer
#ifdef JAPAN
	b _02334854
#else
	mov r0, #0
	strb r0, [sp, #0x21]
	b _023330BC
#endif
_023330A4:
	ldr r1, _02333644 ; =0x000001FB
	bl GetStringFromFileVeneer
_02334854:
	add r0, sp, #0x21
	add r1, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
_023330BC:
	add r0, sp, #0x21
	add r1, sp, #0x400
	str r0, [sp, #0x47c]
	add r1, r1, #0x44
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r0, [r0]
	add r2, r2, #0x94
	add r0, r0, #0x10c
	mov r1, #0x100
	mov r3, #0
	bl PreprocessString
	ldr r1, _02333628 ; =ov01_0233C184
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0x50
	add r3, r2, #0x10c
	mov r2, #0xf
	bl DrawTextInWindow
	b _02333158
_02333110:
	bl GetSpecialEpisodeType
#ifdef JAPAN
	mov r1, #8
	mov r5, r0
	mov r0, r4
	rsb r3, r1, #0x2440
#else
	mov r5, r0
	ldr r3, _02333648 ; =0x0000020E
	mov r0, r4
	mov r1, #8
#endif
	mov r2, #0xf
	bl AppendStandardStringToMission
	mvn r0, #0
	cmp r5, r0
	beq _02333158
#ifdef JAPAN
	add r0, r5, #0x3b
#else
	add r0, r5, #0x72
	add r0, r0, #0x100
#endif
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r3, r1, lsr #0x10
	mov r1, #0x50
	mov r2, #0xf
	bl AppendStandardStringToMission
_02333158:
	ldr r0, _02333628 ; =ov01_0233C184
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #0xa
	bne _0233317C
	ldr r1, _0233364C ; =0x000001FE
	add r0, r2, #0x20c
	bl GetStringFromFileVeneer
	b _02333260
_0233317C:
	ldrb r0, [r2, #0x621]
	cmp r0, #0
	beq _023331F8
	cmp r1, #6
	bne _023331A0
	ldr r1, _02333650 ; =0x000001FD
	add r0, r2, #0x20c
	bl GetStringFromFileVeneer
	b _02333260
_023331A0:
	add r0, sp, #0x400
#ifdef JAPAN
	ldr r1, _02334DFC ; =0x00002426
	add r0, r0, #0x94
#else
	add r0, r0, #0x94
	mov r1, #0x1fc
#endif
	bl GetStringFromFileVeneer
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r1, [r0]
	add r5, sp, #0x3f4
	ldr r0, [r1]
	add r2, r2, #0x94
	cmp r0, #1
	cmpne r0, #4
	movne r0, #0x40000
	strne r0, [sp, #0x404]
	moveq r0, #0x50000
	streq r0, [sp, #0x404]
	add r0, r1, #0x20c
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	b _02333260
_023331F8:
	ldrb r0, [r2, #0x61c]
	cmp r0, #0
	ldreqb r0, [r2, #0x61d]
	cmpeq r0, #0
	ldreqb r0, [r2, #0x61e]
	cmpeq r0, #0
	beq _02333238
	bl GetAdventureLogDungeonFloor
	ldr r1, _02333628 ; =ov01_0233C184
	ldrb r3, [r0]
	ldr r1, [r1]
	ldrb r2, [r0, #1]
	add r0, r1, #0x20c
	orr r1, r3, #0x10000
	bl sub_020245D0
	b _02333260
_02333238:
	ldrb r0, [r2, #0x620]
	cmp r0, #0
	beq _02333254
	ldr r1, _02333650 ; =0x000001FD
	add r0, r2, #0x20c
	bl GetStringFromFileVeneer
	b _02333260
_02333254:
	ldr r1, _0233364C ; =0x000001FE
	add r0, r2, #0x20c
	bl GetStringFromFileVeneer
_02333260:
	ldr r1, _02333628 ; =ov01_0233C184
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0x50
	add r3, r2, #0x20c
	mov r2, #0x1c
	bl DrawTextInWindow
	bl sub_0204F9E0
	str r0, [sp, #0x3c8]
	add r1, sp, #0x3a4
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	ldr r2, _02333654 ; =ov01_0233B7C4
	ldr r0, [r0]
	ldr r3, _02333658 ; =0x0000C402
	add r0, r0, #0x30c
	mov r1, #0x100
	bl PreprocessString
	ldr r1, _02333628 ; =ov01_0233C184
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0x50
	add r3, r2, #0x30c
	mov r2, #0x36
	bl DrawTextInWindow
	bl GetNbAdventures
	cmp r0, #0
	beq _02333334
	bl GetNbAdventures
	str r0, [sp, #0x378]
	add r0, sp, #0x400
	ldr r1, _0233365C ; =0x000001FF
	add r0, r0, #0x94
	bl GetStringFromFileVeneer
	add r1, sp, #0x354
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r0, [r0]
	add r2, r2, #0x94
	add r0, r0, #0xc
	add r0, r0, #0x400
	mov r1, #0x100
	mov r3, #0
	bl PreprocessString
	ldr r1, _02333628 ; =ov01_0233C184
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0x50
	add r2, r2, #0xc
	add r3, r2, #0x400
	mov r2, #0x43
	bl DrawTextInWindow
_02333334:
	ldr r0, _02333628 ; =ov01_0233C184
	mov r1, #0
	ldr r2, [r0]
	strb r1, [r2, #0x50c]
	ldr r2, [r0]
	ldrb r0, [r2, #0x61d]
	cmp r0, #0
	beq _02333464
	mov r0, #7
	bl GetSosMailCount
	cmp r0, #0
	beq _02333534
	ldr r0, _0233362C ; =_020B0A5C
	ldr r5, [r0]
	ldrsh r0, [r5, #4]
	cmp r0, #0
	beq _023333E4
	ldrsh r1, [r5, #4]
	add r0, sp, #0x204
	bl GetSpeciesString
	add r0, sp, #0xc
	add r1, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0x400
	add r3, sp, #0x204
	add r2, sp, #0xc
#ifdef JAPAN
	ldr r1, _02334E0C ; =0x0000243E
	add r0, r0, #0x94
#else
	add r0, r0, #0x94
	mov r1, #0x214
#endif
	str r3, [sp, #0x33c]
	str r2, [sp, #0x340]
	bl GetStringFromFileVeneer
	add r1, sp, #0x304
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r0, [r0]
	mov r1, #0x100
	add r0, r0, #0x10c
	add r0, r0, #0x400
	add r2, r2, #0x94
	mov r3, #0
	bl PreprocessString
	b _02333534
_023333E4:
	ldrsh r0, [r5, #0x48]
	cmp r0, #0
	beq _02333534
	add r0, sp, #0x1b4
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _0233362C ; =_020B0A5C
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _02333660 ; =ov01_0233B700
	add r0, sp, #0xb4
	add r1, r1, #0x44
	mov r3, #1
	bl MaybeGetFormattedItemName
	add r0, sp, #0x400
	add r2, sp, #0xb4
	ldr r1, _02333664 ; =0x00000215
	add r0, r0, #0x94
	str r2, [sp, #0x1ec]
	bl GetStringFromFileVeneer
	add r1, sp, #0x1b4
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r0, [r0]
	mov r1, #0x100
	add r0, r0, #0x10c
	add r0, r0, #0x400
	add r2, r2, #0x94
	mov r3, #0
	bl PreprocessString
	b _02333534
_02333464:
	ldrb r0, [r2, #0x61e]
	cmp r0, #0
	ldrneb r0, [r2, #0x622]
	cmpne r0, #0
	beq _02333534
	add r0, sp, #4
	bl sub_0205BBA4
	cmp r0, #0
	beq _02333534
	add r0, sp, #0x64
	bl InitPreprocessorArgs
	ldr r6, [sp, #4]
	ldr r5, [sp, #8]
	ldr r2, _02333668 ; =0x00002710
	mov r0, r6
	mov r1, r5
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x90]
	ldr r2, _02333668 ; =0x00002710
	mov r0, r6
	mov r1, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _02333668 ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x8c]
	ldr r2, _0233366C ; =0x05F5E100
	mov r1, r5
	mov r0, r6
	mov r3, #0
	bl _ll_udiv
	ldr r2, _02333668 ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x88]
	add r0, sp, #0x400
	ldr r1, _02333670 ; =0x00000217
	add r0, r0, #0x94
	bl GetStringFromFileVeneer
	add r1, sp, #0x64
	str r1, [sp]
	ldr r0, _02333628 ; =ov01_0233C184
	add r2, sp, #0x400
	ldr r0, [r0]
	mov r1, #0x100
	add r0, r0, #0x10c
	add r0, r0, #0x400
	add r2, r2, #0x94
	mov r3, #0
	bl PreprocessString
_02333534:
	ldr r0, _02333628 ; =ov01_0233C184
	mov r1, #0x50
	ldr r2, [r0]
	mov r0, r4
	add r3, r2, #0x10c
	mov r2, r1
	add r3, r3, #0x400
	bl DrawTextInWindow
	ldr sb, _02333628 ; =ov01_0233C184
	mov r8, #3
	ldr r0, [sb]
	mov r7, #0
	ldr r0, [r0]
	cmp r0, #1
	cmpne r0, #4
	beq _023335C4
	ldr r6, _02333674 ; =CLEAR_MARK_PERFORMANCE_PROGRESS_FLAGS
	mov r5, #0xe
	mvn r4, #1
_02333580:
	ldr r0, [r6, r7, lsl #2]
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _023335B4
	mov r0, r7
	mov r1, r8
	mov r2, r5
	mov r3, r4
	bl PrintClearMark
	ldr r1, [sb]
	add r8, r8, #2
	add r1, r1, r7
	strb r0, [r1, #0x60f]
_023335B4:
	add r7, r7, #1
	cmp r7, #0xd
	blt _02333580
	b _02333610
_023335C4:
	ldr r4, _02333628 ; =ov01_0233C184
	mov r6, #0xe
	mvn r5, #1
_023335D0:
	mov r0, r7
	bl IsSpecialEpisodeBeaten
	cmp r0, #0
	beq _02333604
	mov r0, r7
	mov r1, r8
	mov r2, r6
	mov r3, r5
	bl PrintSpecialEpisodeClearMark
	ldr r1, [r4]
	add r8, r8, #2
	add r1, r1, r7
	strb r0, [r1, #0x60f]
_02333604:
	add r7, r7, #1
	cmp r7, #5
	blt _023335D0
_02333610:
	add sp, sp, #0x94
	add sp, sp, #0x800
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET 0x222A
#else
#define PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET 0
#endif
_0233361C: .word 0x0000020B + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333620: .word ov01_0233B7BC
_02333624: .word 0x0000020F + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
#ifdef JAPAN
_02334DCC: .word 0x0000243A
_02334DD0: .word 0x0000243B
#endif
_02333628: .word ov01_0233C184
_0233362C: .word _020B0A5C
_02333630: .word 0x00000212 + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333634: .word 0x00000213 + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
#ifdef JAPAN
_02334DE4: .word 0x00002437
#else
_02333638: .word 0x00000216
#endif
_0233363C: .word 0x000001F9 + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333640: .word 0x000001FA + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333644: .word 0x000001FB + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
#ifndef JAPAN
_02333648: .word 0x0000020E
#endif
_0233364C: .word 0x000001FE + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333650: .word 0x000001FD + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
#ifdef JAPAN
_02334DFC: .word 0x00002426
#endif
_02333654: .word ov01_0233B7C4
_02333658: .word 0x0000C402
_0233365C: .word 0x000001FF + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
#ifdef JAPAN
_02334E0C: .word 0x0000243E
#endif
_02333660: .word ov01_0233B700
_02333664: .word 0x00000215 + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333668: .word 0x00002710
_0233366C: .word 0x05F5E100
_02333670: .word 0x00000217 + PROCESS_CONTINUE_SCREEN_CONTENTS_OFFSET
_02333674: .word CLEAR_MARK_PERFORMANCE_PROGRESS_FLAGS
	arm_func_end ProcessContinueScreenContents

	arm_func_start ov01_02333678
ov01_02333678: ; 0x02333678
	stmdb sp!, {r3, lr}
	ldr r0, _02333698 ; =ov01_0233B7E0
	bl InitMenu
	cmp r0, #0
	ldrne r0, _0233369C ; =ov01_0233C188
	movne r1, #0
	strneb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333698: .word ov01_0233B7E0
_0233369C: .word ov01_0233C188
	arm_func_end ov01_02333678

	arm_func_start ov01_023336A0
ov01_023336A0: ; 0x023336A0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	mov r0, #0x24c
	mov r1, #8
	bl MemAlloc
	ldr r1, _02333754 ; =ov01_0233C188
	str r0, [r1, #4]
	bl ComputeSpecialCounters
	mov r3, #0
	ldr r0, _02333754 ; =ov01_0233C188
	mov r2, r3
_023336CC:
	ldr r1, [r0, #4]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x12c]
	cmp r3, #0x48
	blt _023336CC
	ldr r0, _02333754 ; =ov01_0233C188
	ldr r2, _02333758 ; =0x00003FE9
	ldr r0, [r0, #4]
	mov r1, #0x10
	add r0, r0, #0xdc
	strh r2, [sp, #0x10]
	str r1, [sp, #0x14]
	bl InitPreprocessorArgs
	ldr r0, _02333754 ; =ov01_0233C188
	mov r2, #0
	ldr r1, [r0, #4]
	mov ip, #0x48
	str r2, [r1, #4]
	strb r2, [r0]
	str ip, [sp]
	mov ip, #8
	ldr r0, _0233375C ; =MAIN_MENU_WINDOW_PARAMS_8
	ldr r1, _02333760 ; =0x05001812
	ldr r3, _02333764 ; =ov01_0233382C
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02333754 ; =ov01_0233C188
	ldr r1, [r1, #4]
	strb r0, [r1]
	mov r0, #1
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333754: .word ov01_0233C188
#if defined(EUROPE)
_02333758: .word 0x00003FEB
#elif defined(JAPAN)
_02333758: .word 0x000049EC
#else
_02333758: .word 0x00003FE9
#endif
_0233375C: .word MAIN_MENU_WINDOW_PARAMS_8
_02333760: .word 0x05001812
_02333764: .word ov01_0233382C
	arm_func_end ov01_023336A0

	arm_func_start ov01_02333768
ov01_02333768: ; 0x02333768
	stmdb sp!, {r3, lr}
	ldr r0, _02333790 ; =ov01_0233C188
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02333790 ; =ov01_0233C188
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333790: .word ov01_0233C188
	arm_func_end ov01_02333768

	arm_func_start ov01_02333794
ov01_02333794: ; 0x02333794
	stmdb sp!, {r3, lr}
	ldr r0, _02333828 ; =ov01_0233C188
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023337C0
	cmp r0, #1
	beq _02333820
	cmp r0, #2
	beq _023337F8
	b _02333820
_023337C0:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02333820
	ldr r0, _02333828 ; =ov01_0233C188
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	ldr r1, _02333828 ; =ov01_0233C188
	mov r2, #2
	strb r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02333820
_023337F8:
	ldrsb r0, [r1]
	bl CloseAdvancedMenu
	ldr r0, _02333828 ; =ov01_0233C188
	mov r2, #3
	ldr r1, [r0, #4]
	mov r0, #2
	str r2, [r1, #4]
	bl ov01_023310B8
	mov r0, #4
	ldmia sp!, {r3, pc}
_02333820:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333828: .word ov01_0233C188
	arm_func_end ov01_02333794

	arm_func_start ov01_0233382C
ov01_0233382C: ; 0x0233382C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	mov r4, r1
	mov r5, r0
	mov r1, #0
	and r0, r4, #0xff
	str r1, [sp, #0x28]
	bl GetAdventureLogCompleted
	cmp r0, #0
#if defined(EUROPE)
	addne r0, r4, #0xed
	addne r0, r0, #0x3f00
#elif defined(JAPAN)
	addne r0, r4, #0xee
	addne r0, r0, #0x4900
#else
	addne r0, r4, #0xeb
	addne r0, r0, #0x3f00
#endif
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	ldreq r6, _02333964 ; =0x00003FEA
	cmp r4, #0xc
	addls pc, pc, r4, lsl #2
	b _0233393C
_02333870: ; jump table
	b _023338A4 ; case 0
	b _023338B0 ; case 1
	b _023338BC ; case 2
	b _023338C8 ; case 3
	b _023338D4 ; case 4
	b _023338E0 ; case 5
	b _023338EC ; case 6
	b _023338F8 ; case 7
	b _02333904 ; case 8
	b _02333910 ; case 9
	b _0233391C ; case 10
	b _02333928 ; case 11
	b _02333934 ; case 12
_023338A4:
	bl GetNbPokemonJoined
	str r0, [sp, #0x28]
	b _0233393C
_023338B0:
	bl GetNbPokemonBattled
	str r0, [sp, #0x28]
	b _0233393C
_023338BC:
	bl GetNbMovesLearned
	str r0, [sp, #0x28]
	b _0233393C
_023338C8:
	bl GetNbItemAcquired
	str r0, [sp, #0x28]
	b _0233393C
_023338D4:
	bl GetNbDungeonsCleared
	str r0, [sp, #0x28]
	b _0233393C
_023338E0:
	bl GetNbFainted
	str r0, [sp, #0x28]
	b _0233393C
_023338EC:
	bl GetNbFriendRescues
	str r0, [sp, #0x28]
	b _0233393C
_023338F8:
	bl GetNbEvolutions
	str r0, [sp, #0x28]
	b _0233393C
_02333904:
	bl GetNbEggsHatched
	str r0, [sp, #0x28]
	b _0233393C
_02333910:
	bl GetVictoriesOnOneFloor
	str r0, [sp, #0x28]
	b _0233393C
_0233391C:
	bl GetNbBigTreasureWins
	str r0, [sp, #0x28]
	b _0233393C
_02333928:
	bl GetNbRecycled
	str r0, [sp, #0x28]
	b _0233393C
_02333934:
	bl GetNbSkyGiftsSent
	str r0, [sp, #0x28]
_0233393C:
	ldr r3, _02333968 ; =0x0000C402
	add r4, sp, #4
	mov r0, r5
	mov r2, r6
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, r5
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#if defined(EUROPE)
_02333964: .word 0x00003FEC
#elif defined(JAPAN)
_02333964: .word 0x000049ED
#else
_02333964: .word 0x00003FEA
#endif
_02333968: .word 0x0000C402
	arm_func_end ov01_0233382C

	arm_func_start ov01_0233396C
ov01_0233396C: ; 0x0233396C
	stmdb sp!, {r3, lr}
	ldr r0, _0233398C ; =ov01_0233B800
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02333990 ; =ov01_0233C190
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233398C: .word ov01_0233B800
_02333990: .word ov01_0233C190
	arm_func_end ov01_0233396C

	arm_func_start ov01_02333994
ov01_02333994: ; 0x02333994
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _023339EC ; =ov01_0233C190
	ldr r3, _023339F0 ; =MAIN_DEBUG_MENU_ITEMS_1
	str r0, [r1, #4]
	mov ip, #0xb
	ldr r0, _023339F4 ; =MAIN_MENU_WINDOW_PARAMS_9
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _023339EC ; =ov01_0233C190
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023339EC: .word ov01_0233C190
_023339F0: .word MAIN_DEBUG_MENU_ITEMS_1
_023339F4: .word MAIN_MENU_WINDOW_PARAMS_9
	arm_func_end ov01_02333994

	arm_func_start ov01_023339F8
ov01_023339F8: ; 0x023339F8
	stmdb sp!, {r3, lr}
	ldr r0, _02333A30 ; =ov01_0233C190
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseSimpleMenu
	ldr r0, _02333A30 ; =ov01_0233C190
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02333A30 ; =ov01_0233C190
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333A30: .word ov01_0233C190
	arm_func_end ov01_023339F8

	arm_func_start ov01_02333A34
ov01_02333A34: ; 0x02333A34
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	ldr r0, _02333BC8 ; =ov01_0233C190
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02333A64
	cmp r1, #1
	beq _02333A84
	cmp r1, #2
	beq _02333ABC
	b _02333BBC
_02333A64:
	ldrsb r0, [r2]
	bl CheckSimpleMenuField0x1A0
	cmp r0, #0
	ldreq r0, _02333BC8 ; =ov01_0233C190
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _02333BBC
_02333A84:
	ldrsb r0, [r2]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02333BBC
	ldr r0, _02333BC8 ; =ov01_0233C190
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02333BC8 ; =ov01_0233C190
	mov r2, #2
	str r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02333BBC
_02333ABC:
	ldr r1, _02333BCC ; =ov01_02333BD0
	mov r4, #0
	str r1, [sp, #0x84]
	str r4, [sp, #0x88]
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _02333BA4
_02333AE4: ; jump table
	b _02333BA4 ; case 0
	b _02333B1C ; case 1
	b _02333B2C ; case 2
	b _02333B34 ; case 3
	b _02333B3C ; case 4
	b _02333B44 ; case 5
	b _02333B4C ; case 6
	b _02333B54 ; case 7
	b _02333B5C ; case 8
	b _02333B68 ; case 9
	b _02333B70 ; case 10
	b _02333B78 ; case 11
	b _02333B8C ; case 12
	b _02333BA0 ; case 13
_02333B1C:
	mov r0, #0x16
	bl ov01_023310B8
	mov r0, #4
	b _02333BC0
_02333B2C:
	mov r4, #0xf
	b _02333BA4
_02333B34:
	mov r4, #0xe
	b _02333BA4
_02333B3C:
	mov r4, #0x11
	b _02333BA4
_02333B44:
	mov r4, #0x10
	b _02333BA4
_02333B4C:
	mov r4, #0x12
	b _02333BA4
_02333B54:
	mov r4, #0x13
	b _02333BA4
_02333B5C:
	bl ov01_02333BF8
	mov r0, #4
	b _02333BC0
_02333B68:
	mov r4, r1
	b _02333BA4
_02333B70:
	bl ov00_022BE0B4
	b _02333BA4
_02333B78:
	add r1, sp, #0
	mov r0, #0x100
	bl sub_02036324
	mov r0, #4
	b _02333BC0
_02333B8C:
	add r1, sp, #0
	mov r0, #0x100
	bl sub_0203656C
	mov r0, #4
	b _02333BC0
_02333BA0:
	mov r4, #0x14
_02333BA4:
	cmp r4, #0
	beq _02333BB4
	mov r0, r4
	bl ov00_022BE4A8
_02333BB4:
	mov r0, #4
	b _02333BC0
_02333BBC:
	mov r0, #1
_02333BC0:
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02333BC8: .word ov01_0233C190
_02333BCC: .word ov01_02333BD0
	arm_func_end ov01_02333A34

	arm_func_start ov01_02333BD0
ov01_02333BD0: ; 0x02333BD0
	stmdb sp!, {r3, lr}
	ldr r0, _02333BF0 ; =ov01_0233B800
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02333BF4 ; =ov01_0233C190
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333BF0: .word ov01_0233B800
_02333BF4: .word ov01_0233C190
	arm_func_end ov01_02333BD0

	arm_func_start ov01_02333BF8
ov01_02333BF8: ; 0x02333BF8
	stmdb sp!, {r3, lr}
	ldr r0, _02333C18 ; =ov01_0233B880
	bl InitMenu
	cmp r0, #0
	ldrne r0, _02333C1C ; =ov01_0233C198
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333C18: .word ov01_0233B880
_02333C1C: .word ov01_0233C198
	arm_func_end ov01_02333BF8

	arm_func_start ov01_02333C20
ov01_02333C20: ; 0x02333C20
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02333C70 ; =ov01_0233C198
	ldr r3, _02333C74 ; =MAIN_DEBUG_MENU_ITEMS_2
	str r0, [r1, #4]
	ldr r0, _02333C78 ; =MAIN_MENU_WINDOW_PARAMS_10
	mov r1, #0x13
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02333C70 ; =ov01_0233C198
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333C70: .word ov01_0233C198
_02333C74: .word MAIN_DEBUG_MENU_ITEMS_2
_02333C78: .word MAIN_MENU_WINDOW_PARAMS_10
	arm_func_end ov01_02333C20

	arm_func_start ov01_02333C7C
ov01_02333C7C: ; 0x02333C7C
	stmdb sp!, {r3, lr}
	ldr r0, _02333CB4 ; =ov01_0233C198
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02333CB4 ; =ov01_0233C198
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02333CB4 ; =ov01_0233C198
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333CB4: .word ov01_0233C198
	arm_func_end ov01_02333C7C

	arm_func_start ov01_02333CB8
ov01_02333CB8: ; 0x02333CB8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x98
	ldr r1, _02333E48 ; =ov01_0233C198
	ldr r3, [r1, #4]
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _02333CE8
	cmp r0, #1
	beq _02333D08
	cmp r0, #2
	beq _02333D40
	b _02333E3C
_02333CE8:
	ldrsb r0, [r3]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	ldreq r0, _02333E48 ; =ov01_0233C198
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _02333E3C
_02333D08:
	ldrsb r0, [r3]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02333E3C
	ldr r0, _02333E48 ; =ov01_0233C198
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _02333E48 ; =ov01_0233C198
	mov r2, #2
	str r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02333E3C
_02333D40:
	mov r0, #3
	str r0, [r3, #4]
	ldr r2, _02333E4C ; =ov01_02333E50
	mov r0, #0
	str r2, [sp, #0x84]
	str r0, [sp, #0x88]
	ldr r1, [r1]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02333E24
_02333D68: ; jump table
	b _02333E24 ; case 0
	b _02333D94 ; case 1
	b _02333D9C ; case 2
	b _02333DA4 ; case 3
	b _02333E24 ; case 4
	b _02333DF8 ; case 5
	b _02333E0C ; case 6
	b _02333D88 ; case 7
_02333D88:
	bl ov01_023310B8
	mov r0, #4
	b _02333E40
_02333D94:
	bl sub_02048454
	b _02333E24
_02333D9C:
	bl sub_020484C0
	b _02333E24
_02333DA4:
	bl sub_020485EC
	mov r0, #3
	mov r1, #0x1c
	mov r2, #0
	bl SetScenarioProgressScriptVar
	mov r0, #2
	mov r1, #6
	mov r2, #1
	mov r3, #0xa
	bl sub_0205B5A8
	mov r0, #2
	mov r1, #6
	mov r2, #1
	mov r3, #0xa
	bl sub_0205B5A8
	mov r0, #2
	mov r1, #6
	mov r2, #1
	mov r3, #0xa
	bl sub_0205B5A8
	b _02333E24
_02333DF8:
	add r2, sp, #0
	mov r1, #0x100
	bl sub_02049D4C
	mov r0, #4
	b _02333E40
_02333E0C:
	add r2, sp, #0
	mov r0, #1
	mov r1, #0x100
	bl sub_02049D4C
	mov r0, #4
	b _02333E40
_02333E24:
	add r2, sp, #0
	mov r0, #3
	mov r1, #0x100
	bl sub_0204964C
	mov r0, #4
	b _02333E40
_02333E3C:
	mov r0, #1
_02333E40:
	add sp, sp, #0x98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02333E48: .word ov01_0233C198
_02333E4C: .word ov01_02333E50
	arm_func_end ov01_02333CB8

	arm_func_start ov01_02333E50
ov01_02333E50: ; 0x02333E50
	ldr ip, _02333E5C ; =sub_02002448
	mov r0, #1
	bx ip
	.align 2, 0
_02333E5C: .word sub_02002448
	arm_func_end ov01_02333E50

	arm_func_start ov01_02333E60
ov01_02333E60: ; 0x02333E60
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
	mov r4, r0
	ldr r0, _02334600 ; =0x00000998
	mov r1, #8
	bl MemAlloc
	ldr r1, _02334604 ; =ov01_0233C1A0
	mov r2, #0
	str r0, [r1, #4]
	str r4, [r0, #0x1b4]
	ldr r0, [r1, #4]
	str r2, [r0, #0x1b8]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r1, [r1, #4]
	str r2, [r1, #0xc]
	add r0, r1, #0x1ac
	str r2, [r1, #0x10]
	bl sub_020547C8
	ldr r0, _02334604 ; =ov01_0233C1A0
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x1ac
	bl sub_02054824
	ldr r0, _02334604 ; =ov01_0233C1A0
	mov r8, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x900
	strh r8, [r0, #0x8c]
	b _023344E4
_02333ED8:
	ldr r0, _02334608 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r0]
	add r0, r1, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _023344EC
	cmp r0, #0xbb
	mov r4, #1
	bgt _02333F0C
	cmp r0, #0xbb
	beq _02333F8C
	b _02333F90
_02333F0C:
	sub r0, r0, #0x190
	cmp r0, #0x1b
	addls pc, pc, r0, lsl #2
	b _02333F90
_02333F1C: ; jump table
	b _02333F8C ; case 0
	b _02333F8C ; case 1
	b _02333F8C ; case 2
	b _02333F8C ; case 3
	b _02333F8C ; case 4
	b _02333F8C ; case 5
	b _02333F8C ; case 6
	b _02333F8C ; case 7
	b _02333F8C ; case 8
	b _02333F8C ; case 9
	b _02333F8C ; case 10
	b _02333F8C ; case 11
	b _02333F8C ; case 12
	b _02333F8C ; case 13
	b _02333F8C ; case 14
	b _02333F8C ; case 15
	b _02333F8C ; case 16
	b _02333F8C ; case 17
	b _02333F8C ; case 18
	b _02333F8C ; case 19
	b _02333F8C ; case 20
	b _02333F8C ; case 21
	b _02333F8C ; case 22
	b _02333F8C ; case 23
	b _02333F8C ; case 24
	b _02333F8C ; case 25
	b _02333F8C ; case 26
	b _02333F8C ; case 27
_02333F8C:
	mov r4, #0
_02333F90:
	add r0, r1, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bl IsItemInTimeDarkness
	cmp r0, #0
	moveq r4, #0
	cmp r4, #0
	beq _023344D8
	ldr r2, _02334604 ; =ov01_0233C1A0
	ldr r1, [r2, #4]
	add r0, r1, #0x900
	ldrsh r0, [r0, #0x8c]
	cmp r0, #0
	bne _02333FFC
	ldr r0, _02334608 ; =BAG_ITEMS_PTR_MIRROR
	add r1, r1, #0x100
	ldr r0, [r0]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	strh r0, [r1, #0xbc]
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	ldrsh r1, [r0, #0x8c]
	add r1, r1, #1
	strh r1, [r0, #0x8c]
	b _023344D8
_02333FFC:
	ldr r0, _02334608 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bl sub_0200EB64
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	ldr r0, _0233460C ; =0x0000016E
	mov sb, #1
	sub r4, r0, #1
	add fp, r0, #3
	add sl, r0, #1
	add r0, r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0233460C ; =0x0000016E
	mov r6, #0
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, _0233460C ; =0x0000016E
	ldr r5, _02334604 ; =ov01_0233C1A0
	add r0, r0, #9
	str r0, [sp, #0x18]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #8
	str r0, [sp, #0x14]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #7
	str r0, [sp, #0x10]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0xb
	str r0, [sp, #0x1c]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0xf
	str r0, [sp, #0x28]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0xd
	str r0, [sp, #0x24]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x11
	str r0, [sp, #0x30]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x15
	str r0, [sp, #0x3c]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x14
	str r0, [sp, #0x38]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x13
	str r0, [sp, #0x34]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x18
	str r0, [sp, #0x44]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x17
	str r0, [sp, #0x40]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x1b
	str r0, [sp, #0x4c]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x19
	str r0, [sp, #0x48]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x1d
	str r0, [sp, #0x54]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x1c
	str r0, [sp, #0x50]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x21
	str r0, [sp, #0x60]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x20
	str r0, [sp, #0x5c]
	ldr r0, _0233460C ; =0x0000016E
	add r0, r0, #0x1f
	str r0, [sp, #0x58]
	b _02334444
_0233414C:
	add r0, r1, r6, lsl #1
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xbc]
	bl sub_0200EB64
	ldr r1, _02334608 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, r0, lsl #0x10
	ldr r1, [r1]
	add r1, r1, r8, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	sub r1, r1, #0x16c
	cmp r1, #0x23
	addls pc, pc, r1, lsl #2
	b _02334420
_02334184: ; jump table
	b _02334214 ; case 0
	b _02334214 ; case 1
	b _02334214 ; case 2
	b _0233423C ; case 3
	b _0233423C ; case 4
	b _0233423C ; case 5
	b _02334260 ; case 6
	b _02334260 ; case 7
	b _02334260 ; case 8
	b _0233428C ; case 9
	b _0233428C ; case 10
	b _0233428C ; case 11
	b _023342BC ; case 12
	b _023342BC ; case 13
	b _023342BC ; case 14
	b _023342E8 ; case 15
	b _023342E8 ; case 16
	b _023342E8 ; case 17
	b _02334314 ; case 18
	b _02334314 ; case 19
	b _02334314 ; case 20
	b _02334340 ; case 21
	b _02334340 ; case 22
	b _02334340 ; case 23
	b _02334370 ; case 24
	b _02334370 ; case 25
	b _02334370 ; case 26
	b _0233439C ; case 27
	b _0233439C ; case 28
	b _0233439C ; case 29
	b _023343C8 ; case 30
	b _023343C8 ; case 31
	b _023343C8 ; case 32
	b _023343F4 ; case 33
	b _023343F4 ; case 34
	b _023343F4 ; case 35
_02334214:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	cmp r2, #0x16c
	cmpne r2, r4
	ldrne r1, _0233460C ; =0x0000016E
	cmpne r2, r1
	moveq sb, #0
	b _02334420
_0233423C:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r1, [r1, #0xbc]
	cmp r1, sl
	cmpne r1, #0x170
	cmpne r1, fp
	moveq sb, #0
	b _02334420
_02334260:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	ldr r1, [sp, #8]
	cmp r2, r1
	ldrne r1, [sp, #0xc]
	cmpne r2, r1
	cmpne r2, #0x174
	moveq sb, #0
	b _02334420
_0233428C:
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x10]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r1, [r1, #0xbc]
	cmp r1, r2
	ldrne r2, [sp, #0x14]
	cmpne r1, r2
	ldrne r2, [sp, #0x18]
	cmpne r1, r2
	moveq sb, #0
	b _02334420
_023342BC:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	cmp r2, #0x178
	ldrne r1, [sp, #0x1c]
	cmpne r2, r1
	ldrne r1, [sp, #0x20]
	cmpne r2, r1
	moveq sb, #0
	b _02334420
_023342E8:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	ldr r1, [sp, #0x24]
	cmp r2, r1
	cmpne r2, #0x17c
	ldrne r1, [sp, #0x28]
	cmpne r2, r1
	moveq sb, #0
	b _02334420
_02334314:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	ldr r1, [sp, #0x2c]
	cmp r2, r1
	ldrne r1, [sp, #0x30]
	cmpne r2, r1
	cmpne r2, #0x180
	moveq sb, #0
	b _02334420
_02334340:
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x34]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r1, [r1, #0xbc]
	cmp r1, r2
	ldrne r2, [sp, #0x38]
	cmpne r1, r2
	ldrne r2, [sp, #0x3c]
	cmpne r1, r2
	moveq sb, #0
	b _02334420
_02334370:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	cmp r2, #0x184
	ldrne r1, [sp, #0x40]
	cmpne r2, r1
	ldrne r1, [sp, #0x44]
	cmpne r2, r1
	moveq sb, #0
	b _02334420
_0233439C:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	ldr r1, [sp, #0x48]
	cmp r2, r1
	cmpne r2, #0x188
	ldrne r1, [sp, #0x4c]
	cmpne r2, r1
	moveq sb, #0
	b _02334420
_023343C8:
	ldr r1, [r5, #4]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r2, [r1, #0xbc]
	ldr r1, [sp, #0x50]
	cmp r2, r1
	ldrne r1, [sp, #0x54]
	cmpne r2, r1
	cmpne r2, #0x18c
	moveq sb, #0
	b _02334420
_023343F4:
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x58]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x100
	ldrsh r1, [r1, #0xbc]
	cmp r1, r2
	ldrne r2, [sp, #0x5c]
	cmpne r1, r2
	ldrne r2, [sp, #0x60]
	cmpne r1, r2
	moveq sb, #0
_02334420:
	cmp sb, #0
	beq _02334458
	cmp r7, r0, asr #16
	moveq sb, #0
	beq _02334458
	blt _02334458
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02334444:
	ldr r1, [r5, #4]
	add r0, r1, #0x900
	ldrsh r0, [r0, #0x8c]
	cmp r6, r0
	blt _0233414C
_02334458:
	cmp sb, #0
	beq _023344D8
	ldr r2, _02334604 ; =ov01_0233C1A0
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	ldrsh r4, [r0, #0x8c]
	b _02334494
_02334474:
	ldr r0, [r2, #4]
	sub r1, r4, #1
	add r0, r0, r4, lsl #1
	add r0, r0, #0x100
	ldrsh r3, [r0, #0xba]
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	strh r3, [r0, #0xbc]
_02334494:
	cmp r4, r6
	bgt _02334474
	ldr r0, _02334608 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, _02334604 ; =ov01_0233C1A0
	ldr r0, [r0]
	ldr r2, [r1, #4]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r3, [r0, #0x8a]
	add r0, r2, r6, lsl #1
	add r0, r0, #0x100
	strh r3, [r0, #0xbc]
	ldr r0, [r1, #4]
	add r0, r0, #0x900
	ldrsh r1, [r0, #0x8c]
	add r1, r1, #1
	strh r1, [r0, #0x8c]
_023344D8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_023344E4:
	cmp r8, #0x3e8
	blt _02333ED8
_023344EC:
	ldr r0, _02334610 ; =ov01_0233B8E8
	bl CreateDialogueBox
	ldr r2, _02334604 ; =ov01_0233C1A0
#ifdef JAPAN
	ldr r1, _02335DC4_JP ; =0x00003CDA
#else
	mov r1, #0xff
#endif
	ldr r3, [r2, #4]
	strb r0, [r3, #1]
	ldr r0, [r2, #4]
	add r0, r0, #0xac
	bl GetStringFromFileVeneer
	ldr r0, _02334604 ; =ov01_0233C1A0
	ldr r1, _02334614 ; =0x00000404
	ldr r2, [r0, #4]
	mov r3, #0
	ldrsb r0, [r2, #1]
	add r2, r2, #0xac
	bl ShowStringInDialogueBox
	ldr r0, _02334618 ; =ov01_0233B8C8
	ldr r1, _0233461C ; =ov01_02334F2C
	bl CreateTextBox
	ldr r1, _02334604 ; =ov01_0233C1A0
	mov r4, #0
	ldr r2, [r1, #4]
#ifdef JAPAN
	ldr r3, _02335DD4 ; =0x00003CD9
#else
	mov r3, #0xfe
#endif
	strb r0, [r2, #2]
	ldr r0, [r1, #4]
	mov r2, #0x10
	str r4, [r0, #0x14]
	ldr r0, [r1, #4]
	strh r3, [r0, #0x1c]
	ldr r0, [r1, #4]
	str r2, [r0, #0x20]
	ldr r0, [r1, #4]
	str r4, [r0, #0x78]
	ldr r0, [r1, #4]
	str r4, [r0, #0x7c]
	bl ov01_02335280
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldr r2, _02334604 ; =ov01_0233C1A0
	ldr r0, _02334620 ; =ov01_0233B8D8
	ldr r2, [r2, #4]
	ldr r1, _02334624 ; =0x80401859
	ldr r3, _02334628 ; =ov01_023355DC
	add r2, r2, #0x14
	bl CreateAdvancedMenu
	ldr r1, _02334604 ; =ov01_0233C1A0
	mov r2, r4
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r3, [r1, #4]
	mov r0, #0x12
	str r2, [r3, #0xc]
	str r2, [r3, #0x10]
	str r2, [r3, #4]
	ldr r1, [r1, #4]
	str r2, [r1, #0x1b8]
	bl ov01_02335728
	ldr r1, _02334604 ; =ov01_0233C1A0
	ldr r1, [r1, #4]
	str r0, [r1, #0x990]
	mov r0, #0x24
	bl ov01_02335728
	ldr r1, _02334604 ; =ov01_0233C1A0
	ldr r1, [r1, #4]
	str r0, [r1, #0x994]
	mov r0, #1
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02334600: .word 0x00000998
_02334604: .word ov01_0233C1A0
_02334608: .word BAG_ITEMS_PTR_MIRROR
_0233460C: .word 0x0000016E
_02334610: .word ov01_0233B8E8
#ifdef JAPAN
_02335DC4_JP: .word 0x00003CDA
#endif
_02334614: .word 0x00000404
_02334618: .word ov01_0233B8C8
_0233461C: .word ov01_02334F2C
#ifdef JAPAN
_02335DD4: .word 0x00003CD9
#endif
_02334620: .word ov01_0233B8D8
_02334624: .word 0x80401859
_02334628: .word ov01_023355DC
	arm_func_end ov01_02333E60

	arm_func_start ov01_0233462C
ov01_0233462C: ; 0x0233462C
	stmdb sp!, {r3, lr}
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x194
	add r0, r0, #0x800
	bl ov01_023357C4
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	add r0, r0, #0x990
	bl ov01_023357C4
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseTextBox
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	add r0, r0, #0x1ac
	bl sub_020547D8
	ldr r0, _023346B8 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _023346B8 ; =ov01_0233C1A0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023346B8: .word ov01_0233C1A0
	arm_func_end ov01_0233462C

	arm_func_start ov01_023346BC
ov01_023346BC: ; 0x023346BC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xb0
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02334B84
_023346DC: ; jump table
	b _023346EC ; case 0
	b _02334B0C ; case 1
	b _02334B70 ; case 2
	b _02334B7C ; case 3
_023346EC:
	add r0, sp, #0xc
	mov r1, #8
	bl sub_02031914
	mov r0, #0
	add r1, sp, #0
	strh r0, [sp]
	strh r0, [sp, #2]
	bl GetPressedButtons
	add r1, sp, #2
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #2]
	tst r0, #0x800
	beq _02334764
	ldrh r0, [sp]
	tst r0, #0xc0
	beq _02334764
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl ov01_02334E20
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BC28
	mov r0, #0
	b _02334B88
_02334764:
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202C38C
	tst r0, #0x40000
	bne _02334784
	tst r0, #0x80000
	beq _023347B0
_02334784:
	bl ov01_02334E20
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BC28
	mov r0, #0
	b _02334B88
_023347B0:
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _023349BC
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r4, [r0, #4]
	ldrsb r0, [r4]
	bl GetAdvancedMenuResult
	mov r2, r0, asr #0x1f
	str r0, [r4, #0xc]
	str r2, [r4, #0x10]
	mvn r1, #0
	ldr r0, [r4, #0xc]
	cmp r2, r1
	cmpeq r0, r1
	bne _02334804
	mov r0, #1
	bl PlaySeVolumeWrapper
	b _023349B4
_02334804:
	bl ov01_02334B94
	cmp r0, #0
	beq _02334824
	cmp r0, #1
	beq _0233491C
	cmp r0, #2
	beq _02334954
	b _023349B4
_02334824:
	ldr r0, _02334B90 ; =ov01_0233C1A0
#ifdef JAPAN
	ldr r3, [r0, #4]
	ldr r0, [r3, #8]
#else
	ldr r2, [r0, #4]
	ldr r0, [r2, #8]
#endif
	cmp r0, #0
	beq _02334844
	cmp r0, #1
	beq _023348A0
	b _023348F8
_02334844:
#ifdef JAPAN
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
#else
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0xc]
#endif
	cmp r0, #0
	cmpeq r1, #0
	mov r0, #0
	bne _0233487C
#ifdef JAPAN
	mov r2, #0x81
	mov r1, #0x40
	strb r1, [sp, #0x31]
	strb r2, [sp, #0x30]
	strb r0, [sp, #0x32]
	ldr r0, [r3, #0x990]
#else
	mov r1, #0x20
	strb r1, [sp, #0x30]
	strb r0, [sp, #0x31]
	strb r0, [sp, #0x32]
	ldr r0, [r2, #0x990]
#endif
	add r1, sp, #0x30
	bl ov01_02334C34
	b _023348F8
_0233487C:
#ifdef JAPAN
	ldr r2, [r3, #0x990]
#else
	ldr r2, [r2, #0x990]
#endif
	add r0, sp, #0x30
	bl ov01_02335324
	ldr r2, _02334B90 ; =ov01_0233C1A0
	mov r1, r0
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x990]
	bl ov01_02334C34
	b _023348F8
_023348A0:
#ifdef JAPAN
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
#else
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0xc]
#endif
	cmp r0, #0
	cmpeq r1, #0
	mov r0, #0
	bne _023348D8
#ifdef JAPAN
	mov r2, #0x81
	mov r1, #0x40
	strb r1, [sp, #0x31]
	strb r2, [sp, #0x30]
	strb r0, [sp, #0x32]
	ldr r0, [r3, #0x994]
#else
	mov r1, #0x20
	strb r1, [sp, #0x30]
	strb r0, [sp, #0x31]
	strb r0, [sp, #0x32]
	ldr r0, [r2, #0x994]
#endif
	add r1, sp, #0x30
	bl ov01_02334C34
	b _023348F8
_023348D8:
#ifdef JAPAN
	ldr r2, [r3, #0x994]
#else
	ldr r2, [r2, #0x994]
#endif
	add r0, sp, #0x30
	bl ov01_02335324
	ldr r2, _02334B90 ; =ov01_0233C1A0
	mov r1, r0
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x994]
	bl ov01_02334C34
_023348F8:
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	b _023349B4
_0233491C:
	mov r0, #1
	bl PlaySeVolumeWrapper
	bl ov01_02334D04
	cmp r0, #0
	blt _023349B4
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	b _023349B4
_02334954:
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x990]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r1, #0x994]
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	bne _023349A8
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl ov01_02334E20
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	b _023349B4
_023349A8:
	mov r0, #4
	bl PlaySeVolumeWrapper
	bl ov01_02335208
_023349B4:
	mov r0, #0
	b _02334B88
_023349BC:
	mov r0, #0
	add r1, sp, #8
	strh r0, [sp, #8]
	strh r0, [sp, #6]
	strh r0, [sp, #4]
	bl GetPressedButtons
	add r1, sp, #6
	mov r0, #0
	bl sub_020063F4
	add r1, sp, #4
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #4]
	tst r0, #0x800
	beq _02334A34
	ldrh r0, [sp, #8]
	tst r0, #0x10
	beq _02334A18
	mov r0, #3
	bl PlaySeVolumeWrapper
	mov r0, #1
	bl ov01_02335154
	b _02334AD8
_02334A18:
	tst r0, #0x20
	beq _02334AD8
	mov r0, #3
	bl PlaySeVolumeWrapper
	mvn r0, #0
	bl ov01_02335154
	b _02334AD8
_02334A34:
	ldrh r0, [sp, #8]
	cmp r0, #2
	beq _02334A4C
	cmp r0, #8
	beq _02334A5C
	b _02334AD0
_02334A4C:
	mov r0, #1
	bl PlaySeVolumeWrapper
	bl ov01_02334D04
	b _02334AD8
_02334A5C:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuCurrentOption
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	add r0, r0, #1
	mov r0, r0, lsl #3
	sub r0, r0, #1
	mov r4, r0, lsl #0x10
	mov r5, r4, asr #0x10
	bl ov01_02335280
	cmp r0, r4, asr #16
	bgt _02334AB8
	bl ov01_02335280
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02334AB8:
	ldr r0, _02334B90 ; =ov01_0233C1A0
	mov r1, r5
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BD48
	b _02334AD8
_02334AD0:
	mov r0, #0
	b _02334ADC
_02334AD8:
	mov r0, #1
_02334ADC:
	cmp r0, #0
	beq _02334B04
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02334F2C
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BC28
_02334B04:
	mov r0, #0
	b _02334B88
_02334B0C:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	movne r0, #0
	bne _02334B58
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _02334B58
	ldr r0, _02334B90 ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl IsTextBoxActive
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
_02334B58:
	cmp r0, #0
	ldrne r0, _02334B90 ; =ov01_0233C1A0
	movne r1, #2
	ldrne r0, [r0, #4]
	strne r1, [r0, #4]
	b _02334B84
_02334B70:
	mov r0, #3
	str r0, [r1, #4]
	b _02334B84
_02334B7C:
	ldr r0, [r1, #0x1b8]
	b _02334B88
_02334B84:
	mov r0, #0
_02334B88:
	add sp, sp, #0xb0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02334B90: .word ov01_0233C1A0
	arm_func_end ov01_023346BC

	arm_func_start ov01_02334B94
ov01_02334B94: ; 0x02334B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov01_02335280
	sub r1, r0, #1
	cmp r4, r1
	movne r2, r4, lsr #0x1f
	rsbne r1, r2, r4, lsl #29
	addne r1, r2, r1, ror #29
	cmpne r1, #7
	moveq r0, #2
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #2
	cmp r4, r0
	cmpne r1, #6
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov01_02334B94

	arm_func_start ov01_02334BD8
ov01_02334BD8: ; 0x02334BD8
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r5, r6
	mov r4, r6
	b _023353F0
_023353D8:
	ldr r1, [r8, #4]
	mov r0, r4
	ldr r1, [r1, r5, lsl #2]
	bl ov01_02335654
	add r6, r6, r0
	add r5, r5, #1
_023353F0:
	ldr r0, [r8, #0xc]
	cmp r5, r0
	blt _023353D8
	mov r1, r7
	mov r0, #0
	bl ov01_02335654
	ldr r1, [r8, #0x1c]
	add r0, r6, r0
	cmp r0, r1
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	mov r7, r0
	mov r6, r1
	mov r4, r5
	b _02334C04
_02334BF0:
	ldr r0, [r7, #4]
	ldr r0, [r0, r4, lsl #2]
	bl ov01_02335654
	add r5, r5, r0
	add r4, r4, #1
_02334C04:
	ldr r0, [r7, #0xc]
	cmp r4, r0
	blt _02334BF0
	mov r0, r6
	bl ov01_02335654
	ldr r1, [r7, #0x1c]
	add r0, r5, r0
	cmp r0, r1
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end ov01_02334BD8

	arm_func_start ov01_02334C34
ov01_02334C34: ; 0x02334C34
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r4, r1
	bl ov01_02334BD8
	cmp r0, #0
	bne _0233641C
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldr r0, [sl, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233641C:
	ldr r5, [sl, #0x10]
	ldr r0, [sl, #0xc]
	ldr r7, [sl, #0x14]
	cmp r0, r5
	beq _0233645C
	mov r3, #0
	b _02336454
_02336438:
	ldr r2, [sl]
	mov r1, r3, lsl #8
	ldrb r0, [r2, r3, lsl #8]
	cmp r0, #0
	addeq r8, r2, r1
	beq _02336460
	add r3, r3, #1
_02336454:
	cmp r3, r5
	blt _02336438
_0233645C:
	mov r8, #0
_02336460:
	str r4, [sp]
	mov sb, r8
	mov r4, #0x82
	mov fp, #0x4f
	mov r6, #0x81
	mov r5, #0x40
	b _023364E4
_0233647C:
	add r0, sp, #0
	bl sub_0202065C
	tst r0, #0xff00
	bne _023364D4
	cmp r0, #0x20
	streqb r6, [sb]
	streqb r5, [sb, #1]
	addeq sb, sb, #2
	beq _023364E4
	cmp r0, #0x30
	streqb r4, [sb]
	streqb fp, [sb, #1]
	addeq sb, sb, #2
	beq _023364E4
	cmp r0, #0x31
	bne _023364E4
	mov r0, #0x82
	strb r0, [sb]
	mov r0, #0x50
	strb r0, [sb, #1]
	add sb, sb, #2
	b _023364E4
_023364D4:
	mov r1, r0, asr #8
	strb r1, [sb]
	strb r0, [sb, #1]
	add sb, sb, #2
_023364E4:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233647C
	mov r0, #0
	strb r0, [sb]
	ldr r2, [sl, #0xc]
	cmp r2, r7
	beq _02336528_JP
	b _02336520_JP
_0233650C:
	ldr r1, [sl, #4]
	add r0, r1, r2, lsl #2
	ldr r0, [r0, #-4]
	str r0, [r1, r2, lsl #2]
	sub r2, r2, #1
_02336520_JP:
	cmp r2, r7
	bgt _0233650C
_02336528_JP:
	ldr r1, [sl, #0xc]
	mov r0, #0
	add r1, r1, #1
	str r1, [sl, #0xc]
	ldr r1, [sl, #4]
	str r8, [r1, r7, lsl #2]
	bl PlaySeVolumeWrapper
	mov r0, #1
	bl ov01_02335154
	ldr r0, [sl, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl ov01_02334BD8
	cmp r0, #0
	bne _02334C5C
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldr r0, [r7, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02334C5C:
	ldr r5, [r7, #0x10]
	ldr r0, [r7, #0xc]
	ldr r4, [r7, #0x14]
	cmp r0, r5
	beq _02334C9C
	mov r3, #0
	b _02334C94
_02334C78:
	ldr r2, [r7]
	mov r1, r3, lsl #8
	ldrb r0, [r2, r3, lsl #8]
	cmp r0, #0
	addeq r5, r2, r1
	beq _02334CA0
	add r3, r3, #1
_02334C94:
	cmp r3, r5
	blt _02334C78
_02334C9C:
	mov r5, #0
_02334CA0:
#ifdef EUROPE
	mov r3, #0
	mov r0, r5
	mov r2, r6
	str r3, [sp]
	mov r1, #0x100
#else
	mov r0, r5
	mov r1, r6
#endif
#ifdef EUROPE
	bl PreprocessString
#else
	bl strcpy
#endif
	ldr r2, [r7, #0xc]
	cmp r2, r4
	beq _02334CD8
	b _02334CD0
_02334CBC:
	ldr r1, [r7, #4]
	add r0, r1, r2, lsl #2
	ldr r0, [r0, #-4]
	str r0, [r1, r2, lsl #2]
	sub r2, r2, #1
_02334CD0:
	cmp r2, r4
	bgt _02334CBC
_02334CD8:
	ldr r1, [r7, #0xc]
	mov r0, #0
	add r1, r1, #1
	str r1, [r7, #0xc]
	ldr r1, [r7, #4]
	str r5, [r1, r4, lsl #2]
	bl PlaySeVolumeWrapper
	mov r0, #1
	bl ov01_02335154
	ldr r0, [r7, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end ov01_02334C34

	arm_func_start ov01_02334D04
ov01_02334D04: ; 0x02334D04
	stmdb sp!, {r3, lr}
	ldr r0, _02334D6C ; =ov01_0233C1A0
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x990]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldreq r1, [r2, #0x994]
	ldreq r1, [r1, #0xc]
	cmpeq r1, #0
	bne _02334D38
	bl ov01_02335208
	mvn r0, #0
	ldmia sp!, {r3, pc}
_02334D38:
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _02334D50
	cmp r1, #1
	beq _02334D58
	b _02334D64
_02334D50:
	bl ov01_02334D70
	ldmia sp!, {r3, pc}
_02334D58:
	ldr r0, [r2, #0x994]
	bl ov01_02334D70
	ldmia sp!, {r3, pc}
_02334D64:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02334D6C: .word ov01_0233C1A0
	arm_func_end ov01_02334D04

	arm_func_start ov01_02334D70
ov01_02334D70: ; 0x02334D70
	stmdb sp!, {r4, lr}
	ldr r3, [r0, #0xc]
	mov r1, #0
	cmp r3, #0
	moveq r0, r1
	ldmeqia sp!, {r4, pc}
	ldr r2, [r0, #0x14]
	mov ip, #0
	cmp r2, r3
	ldr r3, [r0, #4]
	subeq r2, r2, #1
	ldr r3, [r3, r2, lsl #2]
	moveq r1, #1
	strb ip, [r3]
	ldr r3, [r0, #0xc]
	cmp r3, r2
	beq _02334DF0
	sub r3, r3, #1
	str r3, [r0, #0xc]
	b _02334DD4
_02334DC0:
	ldr ip, [r0, #4]
	add r3, ip, r2, lsl #2
	ldr r3, [r3, #4]
	str r3, [ip, r2, lsl #2]
	add r2, r2, #1
_02334DD4:
	ldr r3, [r0, #0xc]
	cmp r2, r3
	blt _02334DC0
	ldr r3, [r0, #4]
	mov ip, #0
	str ip, [r3, r2, lsl #2]
	b _02334E04
_02334DF0:
	ldr r3, [r0, #4]
	str ip, [r3, r2, lsl #2]
	ldr r2, [r0, #0xc]
	sub r2, r2, #1
	str r2, [r0, #0xc]
_02334E04:
	cmp r1, #0
	ldr r4, [r0, #0xc]
	beq _02334E18
	mvn r0, #0
	bl ov01_02335154
_02334E18:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov01_02334D70

	arm_func_start ov01_02334E20
ov01_02334E20: ; 0x02334E20
	ldr r0, _02334E4C ; =ov01_0233C1A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #8]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r1, #8]
	ldr r0, _02334E4C ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_02334E4C: .word ov01_0233C1A0
	arm_func_end ov01_02334E20

	arm_func_start ov01_02334E50
ov01_02334E50: ; 0x02334E50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov r8, r7
	mov r6, r7
	mov r5, #0x100
	mov r4, #0x400
	b _02334E9C
_02334E78:
	str r6, [sp]
	ldr r0, [sb, #4]
	mov r1, r5
	ldr r2, [r0, r8, lsl #2]
	mov r3, r4
	add r0, sl, r7
	bl PreprocessString
	add r7, r7, r0
	add r8, r8, #1
_02334E9C:
	ldr r0, [sb, #0xc]
	cmp r8, r0
	blt _02334E78
	mov r0, r7
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov01_02334E50

	arm_func_start ov01_02334EB4
ov01_02334EB4: ; 0x02334EB4
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x100
	ldr r2, [r1, #0xc]
	mov r4, r0
	cmp r2, #0
	movle r0, #0
	strleb r0, [sp]
	ble _023356D8_EU
	add r0, sp, #0
	bl ov01_02334E50
_023356D8_EU:
	add r1, sp, #0
	mov r0, r4
	bl ov01_02335654
	add sp, sp, #0x100
	ldmia sp!, {r4, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x104
	ldr r2, [r1, #0xc]
	mov r5, r0
	cmp r2, #0
	movle r0, #0
	strleb r0, [sp, #4]
	ble _02334EDC
	add r0, sp, #4
	bl ov01_02334E50
_02334EDC:
	add r0, sp, #4
	mov r4, #0
	str r0, [sp]
	add r6, sp, #0
	b _02334F04
_02334EF0:
	mov r0, r6
	bl sub_0202065C
	mov r1, r4, lsl #1
	strh r0, [r5, r1]
	add r4, r4, #1
_02334F04:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	bne _02334EF0
	mov r1, r4, lsl #1
	mov r2, #0
	mov r0, r4
	strh r2, [r5, r1]
	add sp, sp, #0x104
	ldmia sp!, {r3, r4, r5, r6, pc}
#endif
	arm_func_end ov01_02334EB4

	arm_func_start ov01_02334F2C
ov01_02334F2C: ; 0x02334F2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x204
	mov sl, r0
	bl sub_02027B1C
	ldr r1, _02335084 ; =ov01_0233C1A0
	add r0, sp, #4
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x990]
	bl ov01_02334EB4
	mov sb, r0
	cmp sb, #0
	add r7, sp, #4
	mov r8, #0
	ble _02334FA4
	mov r6, #0x17
#ifdef JAPAN
	mov fp, r8
	mov r4, #0xc
	ldr r5, _023368E0 ; =0x00008140
#else
	mov r5, r8
	mov r4, #0xc
#endif
	b _02334F9C
_02334F74:
	ldrh r3, [r7]
#ifdef JAPAN
	cmp r3, r5
#else
	cmp r3, #0x20
#endif
	beq _02334F94
	mul r1, r8, r4
	mov r0, sl
#ifdef JAPAN
	mov r2, fp
#else
	mov r2, r5
#endif
	str r6, [sp]
	bl DrawChar
_02334F94:
	add r8, r8, #1
	add r7, r7, #2
_02334F9C:
	cmp r8, sb
	blt _02334F74
_02334FA4:
	mov r4, #0x17
	mov r0, sl
	mov r1, #0
	mov r2, #0xc
	mov r3, #0xd8
	str r4, [sp]
	bl sub_02025D50
	ldr r1, _02335084 ; =ov01_0233C1A0
	add r0, sp, #4
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x994]
	bl ov01_02334EB4
	mov r6, #0
	add sb, sp, #4
	mov r5, r6
	mov fp, sb
	b _02335064
_02334FE8:
	mov r7, #0
	mov r8, r7
	mov r4, r5, lsl #4
	b _02335048
_02334FF8:
	ldrh r3, [sb]
	cmp r3, #0
	moveq r7, #1
	beq _02335050
	mov r0, r6, lsl #1
#ifdef JAPAN
	ldrh r1, [fp, r0]
	ldr r0, _023368E0 ; =0x00008140
	cmp r1, r0
	beq _02335034
	mov r1, #0xc
	mul r1, r8, r1
#else
	ldrh r0, [fp, r0]
	cmp r0, #0x20
	beq _02335034
	mov r0, #0xc
	mul r1, r8, r0
#endif
	mov r0, #0x17
	str r0, [sp]
	mov r0, sl
	add r2, r4, #0x14
	bl DrawChar
_02335034:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r8, r8, #1
	add sb, sb, #2
_02335048:
	cmp r8, #0x12
	blt _02334FF8
_02335050:
	cmp r7, #0
	bne _0233506C
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02335064:
	cmp r5, #2
	blt _02334FE8
_0233506C:
	mov r0, sl
	bl ov01_02335088
	mov r0, sl
	bl UpdateWindow
	add sp, sp, #0x204
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335084: .word ov01_0233C1A0
#ifdef JAPAN
_023368E0: .word 0x00008140
#endif
	arm_func_end ov01_02334F2C

	arm_func_start ov01_02335088
ov01_02335088: ; 0x02335088
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02335150 ; =ov01_0233C1A0
	mov r4, r0
	ldr r2, [r1, #4]
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _023350B0
	cmp r1, #1
	beq _023350EC
	ldmia sp!, {r4, r5, r6, pc}
_023350B0:
	ldr r1, [r2, #0x990]
	mov r3, #0x74
	ldr r2, [r1, #0x18]
	cmp r2, #0x12
	bge _023350DC
	mov r1, #0xc
	mul r1, r2, r1
	add r2, r1, #0x14
	mov r1, #5
	bl sub_020288FC
	ldmia sp!, {r4, r5, r6, pc}
_023350DC:
	mov r1, #5
	mov r2, #0xe0
	bl sub_020288FC
	ldmia sp!, {r4, r5, r6, pc}
_023350EC:
	ldr r1, [r2, #0x994]
	ldr r5, [r1, #0x18]
	cmp r5, #0x24
	bge _0233513C
	mov r0, r5
	mov r1, #0x12
	bl _s32_div_f
	mov r6, r1
	mov r0, r5
	mov r1, #0x12
	bl _s32_div_f
	mov r1, #0xc
	mul r2, r6, r1
	mov r1, r0, lsl #4
	add r3, r1, #0x84
	mov r0, r4
	add r2, r2, #0x14
	mov r1, #5
	bl sub_020288FC
	ldmia sp!, {r4, r5, r6, pc}
_0233513C:
	mov r1, #5
	mov r2, #0xe0
	mov r3, #0x94
	bl sub_020288FC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02335150: .word ov01_0233C1A0
	arm_func_end ov01_02335088

	arm_func_start ov01_02335154
ov01_02335154: ; 0x02335154
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#endif
	ldr r1, _02335204 ; =ov01_0233C1A0
	ldr r2, [r1, #4]
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _02335178
	cmp r1, #1
	beq _02335184
#ifdef EUROPE
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
_02335178:
	ldr r4, [r2, #0x990]
	ldr r2, [r4, #0xc]
	b _0233518C
_02335184:
	ldr r4, [r2, #0x994]
	ldr r2, [r4, #0xc]
_0233518C:
	ldr r1, [r4, #0x14]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	movmi r0, #0
	strmi r0, [r4, #0x14]
	bmi _023351AC
	cmp r0, r2
	strgt r2, [r4, #0x14]
_023351AC:
#ifdef EUROPE
	ldr r7, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r8, #0
	cmp r7, r0
	mov r5, #0
	movgt r7, r0
	mov r6, r8
	b _023359AC
_0233598C:
	ldr r0, [r4, #4]
	ldr r1, [r0, r8, lsl #2]
	cmp r1, #0
	beq _023359B4
	mov r0, r6
	bl ov01_02335654
	add r5, r5, r0
	add r8, r8, #1
_023359AC:
	cmp r8, r7
	blt _0233598C
_023359B4:
	ldr r0, _02335204 ; =ov01_0233C1A0
	str r5, [r4, #0x18]
#else
	ldr r5, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r7, #0
	cmp r5, r0
	movgt r5, r0
	mov r6, #0
	b _023351E4
_023351C8:
	ldr r0, [r4, #4]
	ldr r0, [r0, r6, lsl #2]
	cmp r0, #0
	beq _023351EC
	bl ov01_02335654
	add r7, r7, r0
	add r6, r6, #1
_023351E4:
	cmp r6, r5
	blt _023351C8
_023351EC:
	ldr r0, _02335204 ; =ov01_0233C1A0
	str r7, [r4, #0x18]
#endif
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl ov01_02335088
#ifdef EUROPE
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02335204: .word ov01_0233C1A0
	arm_func_end ov01_02335154

	arm_func_start ov01_02335208
ov01_02335208: ; 0x02335208
	stmdb sp!, {r3, lr}
	ldr r0, _0233527C ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BC60
	ldr r0, _0233527C ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl sub_0202F954
	ldr r0, _0233527C ; =ov01_0233C1A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _0233527C ; =ov01_0233C1A0
	mov r2, #1
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x990]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r1, #0x994]
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	movne r0, #2
	strne r0, [r1, #0x1b8]
	moveq r0, #1
	streq r0, [r1, #0x1b8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233527C: .word ov01_0233C1A0
	arm_func_end ov01_02335208

	arm_func_start ov01_02335280
ov01_02335280: ; 0x02335280
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _023352E8 ; =ov01_0233C1A0
	mov r1, #6
	ldr r2, [r0, #4]
	add r0, r2, #0x100
	ldrsh r3, [r0, #0xac]
	add r0, r2, #0x900
	ldrsh r2, [r0, #0x8c]
	add r0, r3, #0xfc
	mov r0, r0, lsl #0x10
	add r0, r2, r0, asr #16
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	mov r0, r4
	bl _s32_div_f
	movs r6, r1
	movne r5, #2
	mov r0, r4
	mov r1, #6
	moveq r5, #0
	bl _s32_div_f
	add r0, r6, r0, lsl #3
	add r0, r0, r5
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023352E8: .word ov01_0233C1A0
	arm_func_end ov01_02335280

	arm_func_start ov01_023352EC
ov01_023352EC: ; 0x023352EC
	ldr r1, _02335300 ; =ov01_0233C1A0
	ldr ip, _02335304 ; =ov01_02334E50
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x990]
	bx ip
	.align 2, 0
_02335300: .word ov01_0233C1A0
_02335304: .word ov01_02334E50
	arm_func_end ov01_023352EC

	arm_func_start ov01_02335308
ov01_02335308: ; 0x02335308
	ldr r1, _0233531C ; =ov01_0233C1A0
	ldr ip, _02335320 ; =ov01_02334E50
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x994]
	bx ip
	.align 2, 0
_0233531C: .word ov01_0233C1A0
_02335320: .word ov01_02334E50
	arm_func_end ov01_02335308

	arm_func_start ov01_02335324
ov01_02335324: ; 0x02335324
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r4, r1
	mov r7, r0
	mov r0, r4
	mov r6, r2
	bl ov01_02334B94
	cmp r0, #0
	beq _0233535C
	cmp r0, #1
	beq _0233554C
	cmp r0, #2
	beq _0233555C
	b _023355B8
_0233535C:
	mov r0, r4, asr #2
	mov r2, r4, lsr #0x1f
	add r0, r4, r0, lsr #29
	rsb r1, r2, r4, lsl #29
	mov r3, r0, asr #3
	add r1, r2, r1, ror #29
	mov r0, #6
	mla r5, r3, r0, r1
	cmp r5, #0xfc
	bge _0233540C
	ldr r0, _023355C4 ; =ov01_0233C1A0
	mov r1, r5, lsl #1
	ldr r0, [r0]
	ldrh r0, [r0, r1]
	bl StringFromId
	mov r4, r0
	mov r0, r6
	mov r1, r4
	bl ov01_02334BD8
	cmp r0, #0
	bne _023353F8
	ldr r0, _023355C4 ; =ov01_0233C1A0
	mov r1, r5, lsl #1
#ifdef JAPAN
	ldr r2, [r0]
	ldr r0, _02336E28 ; =0x00003BDC
	ldrh r1, [r2, r1]
	cmp r1, r0
	bne _023353E4
	add r0, r0, #0xfc
#else
	ldr r0, [r0]
	ldrh r0, [r0, r1]
	cmp r0, #1
	bne _023353E4
	mov r0, #0xfd
#endif
	bl StringFromId
	mov r2, r0
	ldr r1, _023355C8 ; =ov01_0233BAF0
	mov r0, r7
	bl ov01_0233562C
	b _023355B8
_023353E4:
	ldr r1, _023355CC ; =ov01_0233BAF4
	mov r0, r7
	mov r2, r4
	bl ov01_0233562C
	b _023355B8
_023353F8:
	ldr r1, _023355C8 ; =ov01_0233BAF0
	mov r0, r7
	mov r2, r4
	bl ov01_0233562C
	b _023355B8
_0233540C:
	ldr r0, _023355C4 ; =ov01_0233C1A0
	ldr r2, [r0, #4]
	add r0, r2, #0x100
	ldrsh r0, [r0, #0xac]
	add r1, r0, #0xfc
	cmp r5, r1
	bge _02335488
	bl AllocateTemp1024ByteBufferFromPool
	ldr r1, _023355C4 ; =ov01_0233C1A0
	sub r2, r5, #0xfc
	ldr r3, [r1, #4]
	mov r1, r2, lsl #1
	ldr r2, [r3, #0x1b0]
	mov r4, r0
	ldrsh r1, [r2, r1]
	bl GetNameRaw
	mov r0, r6
	mov r1, r4
	bl ov01_02334BD8
	cmp r0, #0
	bne _02335474
	ldr r1, _023355CC ; =ov01_0233BAF4
	mov r0, r7
	mov r2, r4
	bl ov01_0233562C
	b _023355B8
_02335474:
	ldr r1, _023355C8 ; =ov01_0233BAF0
	mov r0, r7
	mov r2, r4
	bl ov01_0233562C
	b _023355B8
_02335488:
	add r0, r2, #0x900
	ldrsh r0, [r0, #0x8c]
	add r0, r1, r0
	cmp r5, r0
	bge _023355B8
	sub r0, r5, r1
	add r0, r2, r0, lsl #1
	add r0, r0, #0x100
	ldrsh r1, [r0, #0xbc]
	add r0, sp, #0
	mov r2, #0
	bl sub_0200D214
	ldrb r0, [sp]
	mov r4, #0
	cmp r0, #0x5b
	bne _02335508
	mov r2, r4
	add r1, sp, #0
	b _02335500
_023354D4:
	ldrb r0, [r1, r2]
	cmp r0, #0
	beq _02335508
	cmp r0, #0x5d
	addeq r0, r2, #1
	moveq r0, r0, lsl #0x10
	moveq r4, r0, asr #0x10
	beq _02335508
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_02335500:
	cmp r2, #0x51
	blt _023354D4
_02335508:
	add r1, sp, #0
	mov r0, r6
	add r1, r1, r4
	bl ov01_02334BD8
	cmp r0, #0
	add r2, sp, #0
	bne _02335538
	ldr r1, _023355CC ; =ov01_0233BAF4
	mov r0, r7
	add r2, r2, r4
	bl ov01_0233562C
	b _023355B8
_02335538:
	ldr r1, _023355C8 ; =ov01_0233BAF0
	mov r0, r7
	add r2, r2, r4
	bl ov01_0233562C
	b _023355B8
_0233554C:
	ldr r1, _023355D0 ; =0x00000102
	mov r0, r7
	bl GetStringFromFileVeneer
	b _023355B8
_0233555C:
	ldr r0, _023355C4 ; =ov01_0233C1A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x990]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrgt r0, [r1, #0x994]
	ldrgt r0, [r0, #0xc]
	cmpgt r0, #0
	ble _02335590
	ldr r1, _023355D4 ; =0x00000103
	mov r0, r7
	bl GetStringFromFileVeneer
	b _023355B8
_02335590:
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _023355AC
	ldr r1, _023355D8 ; =0x00000101
	mov r0, r7
	bl GetStringFromFileVeneer
	b _023355B8
_023355AC:
#ifdef JAPAN
	ldr r1, _02336E40 ; =0x00003CDB
	mov r0, r7
#else
	mov r0, r7
	mov r1, #0x100
#endif
	bl GetStringFromFileVeneer
_023355B8:
	mov r0, r7
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_023355C4: .word ov01_0233C1A0
#ifdef JAPAN
_02336E28: .word 0x00003BDC
#endif
_023355C8: .word ov01_0233BAF0
_023355CC: .word ov01_0233BAF4
#ifdef JAPAN
_023355D0: .word 0x00003CDD
_023355D4: .word 0x00003CDE
_023355D8: .word 0x00003CDC
_02336E40: .word 0x00003CDB
#else
_023355D0: .word 0x00000102
_023355D4: .word 0x00000103
_023355D8: .word 0x00000101
#endif
	arm_func_end ov01_02335324

	arm_func_start ov01_023355DC
ov01_023355DC: ; 0x023355DC
	stmdb sp!, {r4, lr}
	ldr r2, _02335628 ; =ov01_0233C1A0
	mov r4, r0
	ldr r3, [r2, #4]
	ldr r2, [r3, #8]
	cmp r2, #0
	bne _02335604
	ldr r2, [r3, #0x990]
	bl ov01_02335324
	b _02335620
_02335604:
	cmp r2, #1
	bne _02335618
	ldr r2, [r3, #0x994]
	bl ov01_02335324
	b _02335620
_02335618:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02335620:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02335628: .word ov01_0233C1A0
	arm_func_end ov01_023355DC

	arm_func_start ov01_0233562C
ov01_0233562C: ; 0x0233562C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov01_0233562C

	arm_func_start ov01_02335654
ov01_02335654: ; 0x02335654
#ifdef EUROPE
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
#else
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
#endif
	str r4, [sp]
	ldrb r1, [r4]
#ifdef EUROPE
	mov r6, r0
#endif
	mov r5, #0
	cmp r1, #0x5b
	bne _0233569C
	ldr r1, _02335720 ; =ov01_0233BB04
#ifdef EUROPE
	mov r0, r4
#endif
	bl strcmp
	cmp r0, #0
	beq _02335694
	ldr r1, _02335724 ; =ov01_0233BB0C
	mov r0, r4
	bl strcmp
	cmp r0, #0
	bne _0233569C
_02335694:
	mov r0, #1
#ifdef EUROPE
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#else
	ldmia sp!, {r3, r4, r5, pc}
#endif
_0233569C:
	add r4, sp, #0
	b _02335708
_023356A4:
	mov r0, r4
	bl sub_0202065C
	cmp r0, #0x5b
	bne _02335704
	ldr r1, [sp]
	ldrb r0, [r1]
	cmp r0, #0x46
	ldreqb r0, [r1, #1]
	cmpeq r0, #0x3a
	bne _023356E8
#ifdef EUROPE
	add r7, r1, #2
	mov r0, r7
	b _023356D8
_023356D4:
	add r7, r7, #1
_023356D8:
	ldrb r1, [r7]
	cmp r1, #0x5d
	bne _023356D4
	bl sub_0202380C_EU
	add r1, r7, #1
	str r1, [sp]
	b _02335704
#else
	add r1, r1, #3
	b _023356D8
_023356D4:
	add r1, r1, #1
_023356D8:
	ldrb r0, [r1]
	cmp r0, #0x5d
	bne _023356D4
	b _02335704
#endif
_023356E8:
	mov r0, r4
	bl sub_0202065C
	cmp r0, #0
	beq _02335708
	cmp r0, #0x5d
	bne _023356E8
	b _02335708
_02335704:
#ifdef EUROPE
	cmp r6, #0
	movne r1, r5, lsl #1
	strneh r0, [r6, r1]
#endif
	add r5, r5, #1
_02335708:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	bne _023356A4
#ifdef EUROPE
	cmp r6, #0
	movne r0, r5, lsl #1
	movne r1, #0
	strneh r1, [r6, r0]
#endif
	mov r0, r5
#ifdef EUROPE
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#else
	ldmia sp!, {r3, r4, r5, pc}
#endif
	.align 2, 0
_02335720: .word ov01_0233BB04
_02335724: .word ov01_0233BB0C
	arm_func_end ov01_02335654

	arm_func_start ov01_02335728
ov01_02335728: ; 0x02335728
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x20
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r0, r5, lsl #8
	mov r1, #8
	bl MemAlloc
	str r0, [r4]
	mov r0, r5, lsl #1
	mov r1, #8
	bl MemAlloc
	str r0, [r4, #8]
	mov r0, r5, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r3, #0
	str r0, [r4, #4]
	mov r2, r3
	b _0233579C
_0233577C:
	ldr r1, [r4]
	mov r0, r3, lsl #1
	strb r2, [r1, r3, lsl #8]
	ldr r1, [r4, #8]
	strh r2, [r1, r0]
	ldr r0, [r4, #4]
	str r2, [r0, r3, lsl #2]
	add r3, r3, #1
_0233579C:
	cmp r3, r5
	blt _0233577C
	mov r1, #0
	str r1, [r4, #0xc]
	str r5, [r4, #0x10]
	str r1, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, r4
	str r1, [r4, #0x14]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov01_02335728

	arm_func_start ov01_023357C4
ov01_023357C4: ; 0x023357C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end ov01_023357C4

	arm_func_start ov01_0233580C
ov01_0233580C: ; 0x0233580C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0xe8
	mov r1, #8
	mov r4, r2
	bl MemAlloc
	ldr r2, _02335844 ; =ov01_0233C1A8
	mov r1, r4
	str r0, [r2]
	str r6, [r0, #0xd8]
	mov r0, r5
	bl ov01_02335930
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02335844: .word ov01_0233C1A8
	arm_func_end ov01_0233580C

#ifndef EUROPE
	arm_func_start ov01_02335848
ov01_02335848: ; 0x02335848
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r0
	mov sl, r1
	mov r0, #0xe8
	mov r1, #8
	mov fp, r2
	mov r4, r3
	bl MemAlloc
	mov r5, #0
	ldr r1, _0233592C ; =ov01_0233C1A8
	mov r2, #0x3e8
	str r0, [r1]
	str r7, [r0, #0xd8]
	mov r0, r4
	mov r1, r4, asr #0x1f
	mov r3, r5
	mov r6, #0x64
	mov sb, r5
	bl _ull_mod
	mov r7, r0
	mov r8, r1
	mov r4, r5
	b _0233590C
_023358A4:
	mov r0, r7
	mov r1, r8
	mov r2, r6
	mov r3, sb
	bl _ll_udiv
	ldr r1, _0233592C ; =ov01_0233C1A8
	mov r3, sb
	ldr r2, [r1]
	mov r1, r8
	add r2, r2, r5
	strb r0, [r2, #0xe0]
	mov r0, r7
	mov r2, r6
	bl _ull_mod
	mov r7, r0
	mov r8, r1
	mov r0, r6
	mov r1, sb
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r6, r0
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov sb, r1
	mov r5, r0, asr #0x10
_0233590C:
	mov r0, #0
	cmp sb, r0
	cmpeq r6, r4
	bne _023358A4
	mov r0, sl
	mov r1, fp
	bl ov01_02335930
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233592C: .word ov01_0233C1A8
	arm_func_end ov01_02335848
#endif

	arm_func_start ov01_02335930
ov01_02335930: ; 0x02335930
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x208
	ldr r7, _02335F58 ; =ov01_0233C1A8
	ldr r2, [r7]
	ldr r2, [r2, #0xd8]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02335AE8
_02335950: ; jump table
	b _02335AE8 ; case 0
	b _02335AE8 ; case 1
	b _02335AE8 ; case 2
	b _02335964 ; case 3
	b _02335A24 ; case 4
_02335964:
	mov r4, #0xc
	ldr r8, _02335F5C ; =ov01_0233BC14
	mov sb, #0
	mov r2, #4
	mov r3, #0xe
	mov sl, r4
_0233597C:
	smulbb r5, sb, sl
	ldr r6, [r8, sb, lsl #2]
	ldr fp, [r7]
	add r5, r5, #6
	add fp, fp, r6, lsl #3
	strh r5, [fp, #0x16]
	ldr fp, [r7]
	add r5, sb, #1
	add sb, fp, r6, lsl #3
	strh r2, [sb, #0x18]
	ldr sb, [r7]
	mov r5, r5, lsl #0x10
	add sb, sb, r6, lsl #3
	strh r4, [sb, #0x1a]
	ldr fp, [r7]
	mov sb, r5, asr #0x10
	add r5, fp, r6, lsl #3
	strh r3, [r5, #0x1c]
	cmp sb, #4
	blt _0233597C
	ldr r5, _02335F5C ; =ov01_0233BC14
	ldr r6, _02335F58 ; =ov01_0233C1A8
	mov r3, #0
_023359D8:
	ldr r4, [r5, r2, lsl #2]
	ldr r7, [r6]
	add r2, r2, #1
	add r7, r7, r4, lsl #3
	strh r3, [r7, #0x16]
	ldr r7, [r6]
	mov r2, r2, lsl #0x10
	add r7, r7, r4, lsl #3
	strh r3, [r7, #0x18]
	ldr r7, [r6]
	mov r2, r2, asr #0x10
	add r7, r7, r4, lsl #3
	strh r3, [r7, #0x1a]
	ldr r7, [r6]
	cmp r2, #0xc
	add r4, r7, r4, lsl #3
	strh r3, [r4, #0x1c]
	blt _023359D8
	b _02335B60
_02335A24:
	mov sb, #0xc
	ldr r3, _02335F5C ; =ov01_0233BC14
	mov r5, #0
	mov r4, #4
	mov r8, #0xe
	mov r6, sb
_02335A3C:
	add r2, r5, #5
	mul fp, r2, r6
	ldr r2, [r3, r5, lsl #2]
	ldr sl, [r7]
	add fp, fp, #0x1e
	add sl, sl, r2, lsl #3
	strh fp, [sl, #0x16]
	ldr sl, [r7]
	add r5, r5, #1
	add sl, sl, r2, lsl #3
	strh r4, [sl, #0x18]
	ldr sl, [r7]
	mov r5, r5, lsl #0x10
	add sl, sl, r2, lsl #3
	strh sb, [sl, #0x1a]
	ldr sl, [r7]
	mov r5, r5, asr #0x10
	add r2, sl, r2, lsl #3
	strh r8, [r2, #0x1c]
	cmp r5, #4
	blt _02335A3C
	ldr r5, _02335F5C ; =ov01_0233BC14
	ldr r6, _02335F58 ; =ov01_0233C1A8
	mov r2, #0
_02335A9C:
	ldr r3, [r5, r4, lsl #2]
	ldr r7, [r6]
	add r4, r4, #1
	add r7, r7, r3, lsl #3
	strh r2, [r7, #0x16]
	ldr r7, [r6]
	mov r4, r4, lsl #0x10
	add r7, r7, r3, lsl #3
	strh r2, [r7, #0x18]
	ldr r7, [r6]
	mov r4, r4, asr #0x10
	add r7, r7, r3, lsl #3
	strh r2, [r7, #0x1a]
	ldr r7, [r6]
	cmp r4, #0xc
	add r3, r7, r3, lsl #3
	strh r2, [r3, #0x1c]
	blt _02335A9C
	b _02335B60
_02335AE8:
	mov r8, #0xc
	ldr r3, _02335F5C ; =ov01_0233BC14
	ldr r6, _02335F58 ; =ov01_0233C1A8
	mov r4, #0
	mov sb, #4
	mov r7, #0xe
	mov r5, r8
_02335B04:
	mov r2, r4, asr #1
	add r2, r4, r2, lsr #30
	add r2, r4, r2, asr #2
	mul fp, r2, r5
	ldr r2, [r3, r4, lsl #2]
	ldr sl, [r6]
	add fp, fp, #6
	add sl, sl, r2, lsl #3
	strh fp, [sl, #0x16]
	ldr sl, [r6]
	add r4, r4, #1
	add sl, sl, r2, lsl #3
	strh sb, [sl, #0x18]
	ldr sl, [r6]
	mov r4, r4, lsl #0x10
	add sl, sl, r2, lsl #3
	strh r8, [sl, #0x1a]
	ldr sl, [r6]
	mov r4, r4, asr #0x10
	add r2, sl, r2, lsl #3
	strh r7, [r2, #0x1c]
	cmp r4, #0xc
	blt _02335B04
_02335B60:
	ldr r4, _02335F60 ; =ov01_0233BC44
	ldr r6, _02335F58 ; =ov01_0233C1A8
	mov r5, #0
	mov r2, #0xc
	mov r8, #0xe
_02335B74:
	ldr r3, [r4, r5, lsl #2]
	ldr r7, [r6]
	mov sb, r5, lsl #4
	add sb, sb, #0x10
	add r7, r7, r3, lsl #3
	strh sb, [r7, #0x16]
	ldr r7, [r6]
	add r5, r5, #1
	add r7, r7, r3, lsl #3
	strh r2, [r7, #0x18]
	ldr r7, [r6]
	mov r5, r5, lsl #0x10
	add r7, r7, r3, lsl #3
	strh r2, [r7, #0x1a]
	ldr r7, [r6]
	mov r5, r5, asr #0x10
	add r3, r7, r3, lsl #3
	strh r8, [r3, #0x1c]
	cmp r5, #0xb
	blt _02335B74
	ldr r4, _02335F58 ; =ov01_0233C1A8
	mov r5, #0x24
	ldr r3, [r4]
	mov r2, #0
	strh r5, [r3, #0xca]
	ldr r5, [r4]
	mov r6, #0xa
	ldrsh r3, [r5, #0xc8]
	sub r3, r3, #9
	strh r3, [r5, #0xc8]
	ldr r5, [r4]
	ldrsh r3, [r5, #0xc6]
	strh r3, [r5, #0xce]
	ldr r5, [r4]
	ldrsh r3, [r5, #0xc8]
	add r3, r3, #0x10
	strh r3, [r5, #0xd0]
	ldr r5, [r4]
	ldrsh r3, [r5, #0xca]
	strh r3, [r5, #0xd2]
	ldr r5, [r4]
	ldrsh r3, [r5, #0xcc]
	strh r3, [r5, #0xd4]
_02335C20:
	add r3, r2, #1
	ldr r5, [r4]
	mov r3, r3, lsl #0x10
	add r5, r5, r2
	mov r2, r3, asr #0x10
	strb r6, [r5, #8]
	cmp r2, #0xc
	blt _02335C20
	ldr r2, _02335F64 ; =0xD4A51000
	cmp r1, #0xe8
	cmpeq r0, r2
	beq _02335D2C
	ldr r2, _02335F58 ; =ov01_0233C1A8
	ldr r2, [r2]
	ldr r2, [r2, #0xd8]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02335C88
_02335C68: ; jump table
	b _02335C88 ; case 0
	b _02335C88 ; case 1
	b _02335C88 ; case 2
	b _02335C7C ; case 3
	b _02335C7C ; case 4
_02335C7C:
	mov r5, #0x3e8
	mov sb, #0
	b _02335C90
_02335C88:
	ldr r5, _02335F68 ; =0x4876E800
	mov sb, #0x17
_02335C90:
	mov r4, #0xa
	umull r2, r3, r5, r4
	mla r3, sb, r4, r3
	mov r7, #0
	bl _ull_mod
	mov r6, r0
	mov r8, r1
	ldr sl, _02335F58 ; =ov01_0233C1A8
	mov fp, r7
	mov r4, r7
	b _02335D20
_02335CBC:
	mov r0, r6
	mov r1, r8
	mov r2, r5
	mov r3, sb
	bl _ll_udiv
	ldr r2, [sl]
	mov r1, r8
	add r2, r2, r7
	strb r0, [r2, #8]
	mov r0, r6
	mov r2, r5
	mov r3, sb
	bl _ull_mod
	mov r6, r0
	mov r8, r1
	mov r0, r5
	mov r1, sb
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r5, r0
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov sb, r1
	mov r7, r0, asr #0x10
_02335D20:
	cmp sb, fp
	cmpeq r5, r4
	bne _02335CBC
_02335D2C:
	ldr r0, _02335F58 ; =ov01_0233C1A8
	mov r4, #0
	ldr r2, [r0]
	ldr r1, _02335F6C ; =ov01_0233CA70
	strb r4, [r2, #0x15]
	ldr r3, [r0]
	sub r2, r4, #1
	strb r4, [r3, #0x14]
	ldr r3, [r0]
	ldr r0, _02335F70 ; =ov01_0233BB58
	str r4, [r3, #0xdc]
	str r2, [r1]
	str r2, [r1, #4]
	bl CreateDialogueBox
	ldr r2, _02335F58 ; =ov01_0233C1A8
#ifdef JAPAN
	ldr r1, _023377DC ; =0x00003CDF
#else
	mov r1, #0x104
#endif
	ldr r2, [r2]
	strb r0, [r2]
	add r0, sp, #8
	bl GetStringFromFileVeneer
	ldr r0, _02335F58 ; =ov01_0233C1A8
	ldr r1, _02335F74 ; =0x00000404
	ldr r0, [r0]
	add r2, sp, #8
	ldrsb r0, [r0]
	mov r3, r4
	bl ShowStringInDialogueBox
	ldr r0, _02335F58 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldr r0, [r0, #0xd8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02335E1C
_02335DB0: ; jump table
	b _02335E1C ; case 0
	b _02335E1C ; case 1
	b _02335E1C ; case 2
	b _02335DC4 ; case 3
	b _02335DF0 ; case 4
_02335DC4:
	mov r2, r4
	str r2, [sp]
	ldr r0, _02335F78 ; =ov01_0233BB48
	ldr r3, _02335F7C ; =ov01_02336664
	mov r1, #0x400000
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	ldr r1, [r1]
	strb r0, [r1, #1]
	b _02335E44
_02335DF0:
	mov r2, r4
	str r2, [sp]
	ldr r0, _02335F80 ; =ov01_0233BB18
	ldr r3, _02335F84 ; =ov01_02336730
	mov r1, #0x400000
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	ldr r1, [r1]
	strb r0, [r1, #1]
	b _02335E44
_02335E1C:
	mov r2, #0
	str r2, [sp]
	ldr r0, _02335F80 ; =ov01_0233BB18
	ldr r3, _02335F88 ; =ov01_02336540
	mov r1, #0x400000
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	ldr r1, [r1]
	strb r0, [r1, #1]
_02335E44:
	mov r2, #0
	str r2, [sp]
	ldr r0, _02335F8C ; =ov01_0233BB68
	ldr r3, _02335F90 ; =ov01_02336890
	mov r1, #0x400000
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	ldr r1, [r1]
	strb r0, [r1, #2]
	ldr r0, _02335F94 ; =ov01_0233BB78
	bl CreateDialogueBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	ldr r2, [r1]
	strb r0, [r2, #3]
	ldr r3, [r1]
	ldr r0, [r3, #0xd8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02335EF8
_02335E94: ; jump table
	b _02335EA8 ; case 0
	b _02335EB8 ; case 1
	b _02335EC8 ; case 2
	b _02335ED8 ; case 3
	b _02335EE8 ; case 4
_02335EA8:
	ldr r1, _02335F98 ; =0x00000105
	add r0, sp, #8
	bl GetStringFromFileVeneer
	b _02335F0C
_02335EB8:
	ldr r1, _02335F9C ; =0x00000106
	add r0, sp, #8
	bl GetStringFromFileVeneer
	b _02335F0C
_02335EC8:
	ldr r1, _02335FA0 ; =0x00000109
	add r0, sp, #8
	bl GetStringFromFileVeneer
	b _02335F0C
_02335ED8:
	ldr r1, _02335FA4 ; =0x00000107
	add r0, sp, #8
	bl GetStringFromFileVeneer
	b _02335F0C
_02335EE8:
#ifdef JAPAN
	ldr r1, _02337814 ; =0x00003CE3
	add r0, sp, #8
#else
	add r0, sp, #8
	mov r1, #0x108
#endif
	bl GetStringFromFileVeneer
	b _02335F0C
_02335EF8:
	ldr r1, _02335F98 ; =0x00000105
	mov r2, #0
	add r0, sp, #8
	str r2, [r3, #0xd8]
	bl GetStringFromFileVeneer
_02335F0C:
	ldr r0, _02335F58 ; =ov01_0233C1A8
	ldr r1, _02335F74 ; =0x00000404
	ldr r0, [r0]
	add r2, sp, #8
	ldrsb r0, [r0, #3]
	mov r3, #0
	bl ShowStringInDialogueBox
	ldr r1, _02335F58 ; =ov01_0233C1A8
	mov r4, #0
	ldr r0, [r1]
	sub r2, r4, #1
	str r4, [r0, #4]
	ldr r3, [r1]
	mov r0, #1
	str r4, [r3, #0xdc]
	ldr r1, [r1]
	strh r2, [r1, #0xe4]
	add sp, sp, #0x208
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335F58: .word ov01_0233C1A8
_02335F5C: .word ov01_0233BC14
_02335F60: .word ov01_0233BC44
_02335F64: .word 0xD4A51000
_02335F68: .word 0x4876E800
_02335F6C: .word ov01_0233CA70
_02335F70: .word ov01_0233BB58
#ifdef JAPAN
_023377DC: .word 0x00003CDF
#endif
_02335F74: .word 0x00000404
_02335F78: .word ov01_0233BB48
_02335F7C: .word ov01_02336664
_02335F80: .word ov01_0233BB18
_02335F84: .word ov01_02336730
_02335F88: .word ov01_02336540
_02335F8C: .word ov01_0233BB68
_02335F90: .word ov01_02336890
_02335F94: .word ov01_0233BB78
#ifdef JAPAN
_02335F98: .word 0x00003CE0
_02335F9C: .word 0x00003CE1
_02335FA0: .word 0x00003CE4
_02335FA4: .word 0x00003CE2
_02337814: .word 0x00003CE3
#else
_02335F98: .word 0x00000105
_02335F9C: .word 0x00000106
_02335FA0: .word 0x00000109
_02335FA4: .word 0x00000107
#endif
	arm_func_end ov01_02335930

	arm_func_start ov01_02335FA8
ov01_02335FA8: ; 0x02335FA8
	stmdb sp!, {r3, lr}
	ldr r0, _02336010 ; =ov01_0233C1A8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02336010 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAdvancedTextBox
	ldr r0, _02336010 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseAdvancedTextBox
	ldr r0, _02336010 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseDialogueBox
	ldr r0, _02336010 ; =ov01_0233C1A8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02336010 ; =ov01_0233C1A8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02336010: .word ov01_0233C1A8
	arm_func_end ov01_02335FA8

	arm_func_start ov01_02336014
ov01_02336014: ; 0x02336014
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02336528
_02336034: ; jump table
	b _02336048 ; case 0
	b _02336314 ; case 1
	b _02336494 ; case 2
	b _02336514 ; case 3
	b _02336520 ; case 4
_02336048:
	ldr r0, [r2, #0xd8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _023360E4
_02336058: ; jump table
	b _023360E4 ; case 0
	b _023360E4 ; case 1
	b _023360E4 ; case 2
	b _023360A8 ; case 3
	b _0233606C ; case 4
_0233606C:
	bl ov01_02336944
	cmp r0, #0
	bne _02336084
	bl ov01_02336B50
	cmp r0, #0
	beq _02336528
_02336084:
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ov01_02336730
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov01_02336890
	b _02336528
_023360A8:
	bl ov01_02336944
	cmp r0, #0
	bne _023360C0
	bl ov01_02336B50
	cmp r0, #0
	beq _02336528
_023360C0:
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ov01_02336664
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov01_02336890
	b _02336528
_023360E4:
	mov r0, #0
	add r1, sp, #6
	strh r0, [sp, #6]
	strh r0, [sp, #4]
	strh r0, [sp, #2]
	strh r0, [sp]
	bl GetPressedButtons
	add r1, sp, #4
	mov r0, #0
	bl sub_020063F4
	add r1, sp, #2
	mov r0, #0
	bl sub_020062FC
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #6]
	tst r0, #2
	beq _0233613C
	bl ov01_023370BC
	mov r2, #1
	b _023362DC
_0233613C:
	tst r0, #1
	beq _02336150
	bl ov01_02337014
	mov r2, #1
	b _023362DC
_02336150:
	tst r0, #8
	beq _02336178
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02336534 ; =ov01_0233C1A8
	mov r1, #0xb
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0x14]
	b _023362DC
_02336178:
	ldrh r0, [sp, #4]
	tst r0, #0x20
	bne _0233618C
	tst r0, #0x40
	beq _02336228
_0233618C:
	ldrh r0, [sp]
	tst r0, #0x100
	beq _023361F0
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	sub r0, r0, #1
	mov r0, r0, lsl #0x18
	movs r4, r0, asr #0x18
	movmi r4, #0xb
	mov r0, r4
	bl ov01_02337174
	cmp r0, #0
	bne _023361D4
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r2, #0
	b _023362DC
_023361D4:
	ldr r1, _02336534 ; =ov01_0233C1A8
	mov r0, #3
	ldr r1, [r1]
	strb r4, [r1, #0x15]
	bl PlaySeVolumeWrapper
	mov r2, #1
	b _023362DC
_023361F0:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsb r1, [r2, #0x14]
	sub r1, r1, #1
	strb r1, [r2, #0x14]
	ldr r1, [r0]
	mov r2, #1
	ldrsb r0, [r1, #0x14]
	cmp r0, #0
	movlt r0, #0xb
	strltb r0, [r1, #0x14]
	b _023362DC
_02336228:
	tst r0, #0x10
	bne _02336238
	tst r0, #0x80
	beq _023362D8
_02336238:
	ldrh r0, [sp]
	tst r0, #0x100
	beq _023362A0
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	add r0, r0, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	cmp r4, #0xc
	movge r4, #0
	mov r0, r4
	bl ov01_02337174
	cmp r0, #0
	bne _02336284
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r2, #0
	b _023362DC
_02336284:
	ldr r1, _02336534 ; =ov01_0233C1A8
	mov r0, #3
	ldr r1, [r1]
	strb r4, [r1, #0x15]
	bl PlaySeVolumeWrapper
	mov r2, #1
	b _023362DC
_023362A0:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsb r1, [r2, #0x14]
	add r1, r1, #1
	strb r1, [r2, #0x14]
	ldr r1, [r0]
	mov r2, #1
	ldrsb r0, [r1, #0x14]
	cmp r0, #0xc
	movge r0, #0
	strgeb r0, [r1, #0x14]
	b _023362DC
_023362D8:
	mov r2, #0
_023362DC:
	cmp r2, #0
	bne _023362F0
	bl ov01_02336B50
	cmp r0, #0
	beq _02336528
_023362F0:
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ov01_02336540
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov01_02336890
	b _02336528
_02336314:
	ldrsh r1, [r2, #0xe4]
	cmp r1, #0
	blt _02336338
	add r1, r1, #1
	strh r1, [r2, #0xe4]
	ldr r2, [r0]
	ldrsh r0, [r2, #0xe4]
	cmp r0, #6
	blt _02336528
_02336338:
	ldrsb r0, [r2]
	bl sub_0202F334
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl sub_0202F334
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl SetAdvancedTextBoxState5
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl SetAdvancedTextBoxState5
	ldr r0, _02336534 ; =ov01_0233C1A8
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _02336538 ; =ov01_0233BCA4
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r4, #0
	ldr r3, [r1, #0xd8]
	ldrsb r2, [r2, r3]
	b _023363B4
_02336398:
	add r0, r1, r4
	ldrb r0, [r0, #8]
	cmp r0, #0xa
	bhs _023363BC
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_023363B4:
	cmp r4, r2
	blt _02336398
_023363BC:
	ldr r6, _02336538 ; =ov01_0233BCA4
	ldrsb r0, [r6, r3]
	cmp r4, r0
	blt _02336474
	mov r0, #2
	mov r7, #0
	str r0, [r1, #0xdc]
	ldr r3, _0233653C ; =ov01_0233CA70
	ldr r0, _02336534 ; =ov01_0233C1A8
	str r7, [r3]
	str r7, [r3, #4]
	mov sl, r7
	ldr sb, [r0]
	mov r8, #1
	mov fp, r7
	mov r2, #0xa
	b _02336458
_02336400:
	sub r0, r0, #1
	sub r0, r0, sl
	add r0, sb, r0
	ldrb lr, [r0, #8]
	umull r0, r1, r8, r2
	mla r1, r8, fp, r1
	mov ip, lr, asr #0x1f
	umull r5, r4, r8, lr
	mla r4, r8, ip, r4
	mla r4, r7, lr, r4
	mov r8, r0
	ldr ip, [r3]
	ldr r0, [r3, #4]
	adds r5, ip, r5
	adc r0, r0, r4
	str r5, [r3]
	str r0, [r3, #4]
	mla r1, r7, r2, r1
	mov r7, r1
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_02336458:
	ldr r0, [sb, #0xd8]
	ldrsb r0, [r6, r0]
	cmp sl, r0
	blt _02336400
	mov r0, #0
	bl PlaySeVolumeWrapper
	b _02336528
_02336474:
	mov r0, #1
	str r0, [r1, #0xdc]
	bl PlaySeVolumeWrapper
	ldr r0, _0233653C ; =ov01_0233CA70
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	b _02336528
_02336494:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _023364FC
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	movne r0, #0
	bne _023364FC
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _023364FC
	ldr r0, _02336534 ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
_023364FC:
	cmp r0, #0
	ldrne r0, _02336534 ; =ov01_0233C1A8
	movne r1, #3
	ldrne r0, [r0]
	strne r1, [r0, #4]
	b _02336528
_02336514:
	mov r0, #4
	str r0, [r2, #4]
	b _02336528
_02336520:
	ldr r0, [r2, #0xdc]
	b _0233652C
_02336528:
	mov r0, #0
_0233652C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02336534: .word ov01_0233C1A8
_02336538: .word ov01_0233BCA4
_0233653C: .word ov01_0233CA70
	arm_func_end ov01_02336014

	arm_func_start ov01_02336540
ov01_02336540: ; 0x02336540
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r0
	bl sub_02027B1C
	ldr r5, _02336654 ; =ov01_0233BBB4
	ldr r4, _02336658 ; =ov01_0233BC74
	ldr sb, _0233665C ; =ov01_0233C1A8
	mov r7, #0
	add r6, sp, #0
_02336564:
	ldr r1, [sb]
	mov r0, r6
	add r1, r1, r7
	ldrb r1, [r1, #8]
	mov r1, r1, lsl #1
	ldrh r1, [r5, r1]
	bl GetStringFromFileVeneer
	ldr r2, [r4, r7, lsl #2]
	ldr r1, [sb]
	mov r0, r8
	add r2, r1, r2, lsl #3
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	mov r3, r6
	bl DrawTextInWindow
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0xc
	blt _02336564
	ldr r1, _02336660 ; =0x00000117
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _0233665C ; =ov01_0233C1A8
	add r3, sp, #0
	ldr r2, [r0]
	mov r0, r8
	ldrsh r1, [r2, #0x2e]
	ldrsh r2, [r2, #0x30]
	add r1, r1, #0xc
	bl DrawTextInWindow
	ldr r0, _0233665C ; =ov01_0233C1A8
	add r3, sp, #0
	ldr r2, [r0]
	mov r0, r8
	ldrsh r1, [r2, #0x4e]
	ldrsh r2, [r2, #0x50]
	add r1, r1, #0xc
	bl DrawTextInWindow
	ldr r0, _0233665C ; =ov01_0233C1A8
	ldr r1, _02336658 ; =ov01_0233BC74
	ldr r0, [r0]
	ldrsb r2, [r0, #0x15]
	ldr r0, _0233665C ; =ov01_0233C1A8
	cmp r2, #0
	movlt r2, #0
	ldr r2, [r1, r2, lsl #2]
	ldr r1, [r0]
	mov r0, r8
	add r1, r1, r2, lsl #3
	ldrsh r2, [r1, #0x16]
	ldrsh r3, [r1, #0x18]
	mov r1, #5
	add r2, r2, #2
	add r3, r3, #0x12
	bl sub_02030978
	mov r0, r8
	bl UpdateWindow
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02336654: .word ov01_0233BBB4
_02336658: .word ov01_0233BC74
_0233665C: .word ov01_0233C1A8
#ifdef JAPAN
_02336660: .word 0x00003CF2
#else
_02336660: .word 0x00000117
#endif
	arm_func_end ov01_02336540

	arm_func_start ov01_02336664
ov01_02336664: ; 0x02336664
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	bl sub_02027B1C
	ldr r5, _02336724 ; =ov01_0233BB88
	ldr r4, _02336728 ; =ov01_0233BB28
	ldr sb, _0233672C ; =ov01_0233C1A8
	mov r7, #0
	add r6, sp, #0
_02336684:
	ldr r1, [sb]
	mov r0, r6
	add r1, r1, r7
	ldrb r1, [r1, #8]
	mov r1, r1, lsl #1
	ldrh r1, [r5, r1]
	bl GetStringFromFileVeneer
	ldr r2, [r4, r7, lsl #2]
	ldr r1, [sb]
	mov r0, r8
	add r2, r1, r2, lsl #3
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	mov r3, r6
	bl DrawTextInWindow
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _02336684
	ldr r0, _0233672C ; =ov01_0233C1A8
	ldr r1, _02336728 ; =ov01_0233BB28
	ldr r0, [r0]
	ldrsb r2, [r0, #0x15]
	ldr r0, _0233672C ; =ov01_0233C1A8
	cmp r2, #0
	movlt r2, #0
	ldr r2, [r1, r2, lsl #2]
	ldr r1, [r0]
	mov r0, r8
	add r1, r1, r2, lsl #3
	ldrsh r2, [r1, #0x16]
	ldrsh r3, [r1, #0x18]
	mov r1, #5
	add r2, r2, #2
	add r3, r3, #0x12
	bl sub_02030978
	mov r0, r8
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02336724: .word ov01_0233BB88
_02336728: .word ov01_0233BB28
_0233672C: .word ov01_0233C1A8
	arm_func_end ov01_02336664

	arm_func_start ov01_02336730
ov01_02336730: ; 0x02336730
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	bl sub_02027B1C
	ldr r6, _02336880 ; =ov01_0233BB9E
	ldr r5, _02336884 ; =ov01_0233BB38
	ldr sb, _02336888 ; =ov01_0233C1A8
	mov r8, #0
	add r7, sp, #0
_02336750:
	ldr r1, [sb]
	mov r0, r7
	add r1, r1, r8
	ldrb r1, [r1, #8]
	mov r1, r1, lsl #1
	ldrh r1, [r6, r1]
	bl GetStringFromFileVeneer
	ldr r2, [r5, r8, lsl #2]
	ldr r1, [sb]
	mov r0, r4
	add r2, r1, r2, lsl #3
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	mov r3, r7
	bl DrawTextInWindow
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02336750
	ldr r0, _02336888 ; =ov01_0233C1A8
	ldr r1, _02336884 ; =ov01_0233BB38
	ldr r0, [r0]
	ldrsb r2, [r0, #0x15]
	ldr r0, _02336888 ; =ov01_0233C1A8
	cmp r2, #0
	movlt r2, #0
	ldr r2, [r1, r2, lsl #2]
	ldr r1, [r0]
	mov r0, r4
	add r1, r1, r2, lsl #3
	ldrsh r2, [r1, #0x16]
	ldrsh r3, [r1, #0x18]
	mov r1, #5
	add r2, r2, #2
	add r3, r3, #0x12
	bl sub_02030978
	ldr r1, _0233688C ; =0x00000117
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _02336888 ; =ov01_0233C1A8
	add r3, sp, #0
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	sub r1, r1, #0xc
	bl DrawTextInWindow
	ldr r5, _02336880 ; =ov01_0233BB9E
	ldr sb, _02336888 ; =ov01_0233C1A8
	mov r7, #0
	add r6, sp, #0
	mov r8, #0xc
_02336824:
	ldr r1, [sb]
	mov r0, r6
	add r1, r1, r7
	ldrb r1, [r1, #0xe0]
	mov r1, r1, lsl #1
	ldrh r1, [r5, r1]
	bl GetStringFromFileVeneer
	ldr r2, [sb]
	mov r0, r4
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	mov r3, r6
	sub r1, r1, #0x30
	smlabb r1, r7, r8, r1
	bl DrawTextInWindow
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #3
	blt _02336824
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02336880: .word ov01_0233BB9E
_02336884: .word ov01_0233BB38
_02336888: .word ov01_0233C1A8
#ifdef JAPAN
_0233688C: .word 0x00003CF2
#else
_0233688C: .word 0x00000117
#endif
	arm_func_end ov01_02336730

	arm_func_start ov01_02336890
ov01_02336890: ; 0x02336890
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r0
	bl sub_02027B1C
	ldr r5, _02336938 ; =ov01_0233BBCA
	ldr r4, _0233693C ; =ov01_0233BBE4
	ldr sb, _02336940 ; =ov01_0233C1A8
	mov r7, #0
	add r6, sp, #0
_023368B4:
	mov r0, r7, lsl #1
	ldrh r1, [r5, r0]
	mov r0, r6
	bl GetStringFromFileVeneer
	ldr r2, [r4, r7, lsl #2]
	ldr r1, [sb]
	mov r0, r8
	add r2, r1, r2, lsl #3
	ldrsh r1, [r2, #0x16]
	ldrsh r2, [r2, #0x18]
	mov r3, r6
	bl DrawTextInWindow
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0xc
	blt _023368B4
	ldr r0, _02336940 ; =ov01_0233C1A8
	ldr r2, _0233693C ; =ov01_0233BBE4
	ldr r4, [r0]
	mov r0, r8
	ldrsb r3, [r4, #0x14]
	mov r1, #3
	ldr r2, [r2, r3, lsl #2]
	add r3, r4, r2, lsl #3
	ldrsh r2, [r3, #0x16]
	ldrsh r3, [r3, #0x18]
	sub r2, r2, #8
	bl sub_02030978
	mov r0, r8
	bl UpdateWindow
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02336938: .word ov01_0233BBCA
_0233693C: .word ov01_0233BBE4
_02336940: .word ov01_0233C1A8
	arm_func_end ov01_02336890

	arm_func_start ov01_02336944
ov01_02336944: ; 0x02336944
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r0, #0
	add r1, sp, #6
	strh r0, [sp, #6]
	strh r0, [sp, #4]
	strh r0, [sp, #2]
	strh r0, [sp]
	bl GetPressedButtons
	add r1, sp, #4
	mov r0, #0
	bl sub_020063F4
	add r1, sp, #2
	mov r0, #0
	bl sub_020062FC
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #6]
	tst r0, #2
	beq _023369A4
	bl ov01_023370BC
	mov r0, #1
	b _02336B44
_023369A4:
	tst r0, #1
	beq _023369B8
	bl ov01_02337014
	mov r0, #1
	b _02336B44
_023369B8:
	tst r0, #8
	beq _023369E0
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02336B4C ; =ov01_0233C1A8
	mov r2, #0xb
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0x14]
	b _02336B44
_023369E0:
	ldrh r0, [sp, #4]
	tst r0, #0x20
	bne _023369F4
	tst r0, #0x40
	beq _02336A90
_023369F4:
	ldrh r0, [sp]
	tst r0, #0x100
	beq _02336A58
	ldr r0, _02336B4C ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	sub r0, r0, #1
	mov r0, r0, lsl #0x18
	movs r4, r0, asr #0x18
	movmi r4, #3
	mov r0, r4
	bl ov01_02337174
	cmp r0, #0
	bne _02336A3C
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #0
	b _02336B44
_02336A3C:
	ldr r1, _02336B4C ; =ov01_0233C1A8
	mov r0, #3
	ldr r1, [r1]
	strb r4, [r1, #0x15]
	bl PlaySeVolumeWrapper
	mov r0, #1
	b _02336B44
_02336A58:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02336B4C ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsb r1, [r2, #0x14]
	sub r1, r1, #1
	strb r1, [r2, #0x14]
	ldr r1, [r0]
	ldrsb r0, [r1, #0x14]
	cmp r0, #0
	movlt r0, #0xb
	strltb r0, [r1, #0x14]
	mov r0, #1
	b _02336B44
_02336A90:
	tst r0, #0x10
	bne _02336AA0
	tst r0, #0x80
	beq _02336B40
_02336AA0:
	ldrh r0, [sp]
	tst r0, #0x100
	beq _02336B08
	ldr r0, _02336B4C ; =ov01_0233C1A8
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	add r0, r0, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	cmp r4, #4
	movge r4, #0
	mov r0, r4
	bl ov01_02337174
	cmp r0, #0
	bne _02336AEC
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #0
	b _02336B44
_02336AEC:
	ldr r1, _02336B4C ; =ov01_0233C1A8
	mov r0, #3
	ldr r1, [r1]
	strb r4, [r1, #0x15]
	bl PlaySeVolumeWrapper
	mov r0, #1
	b _02336B44
_02336B08:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02336B4C ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsb r1, [r2, #0x14]
	add r1, r1, #1
	strb r1, [r2, #0x14]
	ldr r1, [r0]
	ldrsb r0, [r1, #0x14]
	cmp r0, #0xc
	movge r0, #0
	strgeb r0, [r1, #0x14]
	mov r0, #1
	b _02336B44
_02336B40:
	mov r0, #0
_02336B44:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02336B4C: .word ov01_0233C1A8
	arm_func_end ov01_02336944

	arm_func_start ov01_02336B50
ov01_02336B50: ; 0x02336B50
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r0, _02337008 ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsh r1, [r2, #0xe4]
	cmp r1, #0
	addge r1, r1, #1
	strgeh r1, [r2, #0xe4]
	ldrge r1, [r0]
	ldrgesh r0, [r1, #0xe4]
	cmpge r0, #6
	mvnge r0, #0
	strgeh r0, [r1, #0xe4]
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _02337000
	add r0, sp, #8
	bl GetReleasedStylus
	ldrh r1, [sp, #8]
	ldr r0, _0233700C ; =0x00000408
	tst r1, r0
	moveq r0, #0
	beq _02337000
	ldr r0, _02337008 ; =ov01_0233C1A8
	ldr sb, [r0]
	ldrsh r0, [sb, #0xe4]
	cmp r0, #0
	movge r0, #0
	bge _02337000
	mov fp, #0x16
	ldr lr, [sp, #0xc]
	ldr r8, [sp, #0x10]
	mov r4, #0
	mov sl, #0x27
	mov ip, #0x5f
	mov r3, fp
	b _02336D30
_02336BE8:
	ldr r1, [sb, #0xd8]
	sub r0, r1, #3
	cmp r0, #1
	bhi _02336C1C
	cmp r4, #4
	cmpne r4, #5
	cmpne r4, #6
	cmpne r4, #7
	cmpne r4, #8
	cmpne r4, #9
	cmpne r4, #0xa
	cmpne r4, #0xb
	beq _02336D24
_02336C1C:
	cmp r4, #0x17
	addls pc, pc, r4, lsl #2
	b _02336CD8
_02336C28: ; jump table
	b _02336C88 ; case 0
	b _02336C88 ; case 1
	b _02336C88 ; case 2
	b _02336C88 ; case 3
	b _02336C88 ; case 4
	b _02336C88 ; case 5
	b _02336C88 ; case 6
	b _02336C88 ; case 7
	b _02336C88 ; case 8
	b _02336C88 ; case 9
	b _02336C88 ; case 10
	b _02336C88 ; case 11
	b _02336CCC ; case 12
	b _02336CCC ; case 13
	b _02336CCC ; case 14
	b _02336CCC ; case 15
	b _02336CCC ; case 16
	b _02336CCC ; case 17
	b _02336CCC ; case 18
	b _02336CCC ; case 19
	b _02336CCC ; case 20
	b _02336CCC ; case 21
	b _02336CCC ; case 22
	b _02336CCC ; case 23
_02336C88:
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02336CC0
_02336C94: ; jump table
	b _02336CC0 ; case 0
	b _02336CC0 ; case 1
	b _02336CC0 ; case 2
	b _02336CA8 ; case 3
	b _02336CB4 ; case 4
_02336CA8:
	mov r5, ip
	mov r6, r3
	b _02336CE0
_02336CB4:
	mov r5, sl
	mov r6, fp
	b _02336CE0
_02336CC0:
	mov r5, #0x27
	mov r6, #0x16
	b _02336CE0
_02336CCC:
	mov r5, #0xf
	mov r6, #0x4e
	b _02336CE0
_02336CD8:
	mov r5, #0
	mov r6, r5
_02336CE0:
	add r1, sb, r4, lsl #3
	ldrsh r0, [r1, #0x16]
	add r2, r5, r0
	cmp lr, r2
	blt _02336D24
	ldrsh r0, [r1, #0x1a]
	add r0, r2, r0
	cmp lr, r0
	bgt _02336D24
	ldrsh r0, [r1, #0x18]
	add r0, r6, r0
	cmp r8, r0
	blt _02336D24
	ldrsh r1, [r1, #0x1c]
	add r0, r0, r1
	cmp r8, r0
	ble _02336D38
_02336D24:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02336D30:
	cmp r4, #0x18
	blt _02336BE8
_02336D38:
	cmp r4, #0x18
	movge r0, #0
	bge _02337000
	mov r1, #0
	strh r1, [sb, #0xe4]
	ldr r0, _02337008 ; =ov01_0233C1A8
	ldr r1, _02337010 ; =ov01_0233BB14
	ldr r2, [r0]
	mov r0, #0x40
	str r1, [sp]
	str r0, [sp, #4]
	add r3, r2, r4, lsl #3
	ldrsh r1, [r3, #0x16]
	ldrsh r0, [r3, #0x18]
	ldrsh r2, [r3, #0x1a]
	add r5, r5, r1
	add r1, r6, r0
	mov r0, r5, lsl #0x10
	mov r1, r1, lsl #0x10
	ldrsh r3, [r3, #0x1c]
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl sub_0202A2A4
	cmp r4, #0x17
	addls pc, pc, r4, lsl #2
	b _02336FFC
_02336DA0: ; jump table
	b _02336E00 ; case 0
	b _02336E00 ; case 1
	b _02336E00 ; case 2
	b _02336E00 ; case 3
	b _02336E00 ; case 4
	b _02336E00 ; case 5
	b _02336E00 ; case 6
	b _02336E00 ; case 7
	b _02336E00 ; case 8
	b _02336E00 ; case 9
	b _02336E00 ; case 10
	b _02336E00 ; case 11
	b _02336ECC ; case 12
	b _02336ECC ; case 13
	b _02336ECC ; case 14
	b _02336ECC ; case 15
	b _02336ECC ; case 16
	b _02336ECC ; case 17
	b _02336ECC ; case 18
	b _02336ECC ; case 19
	b _02336ECC ; case 20
	b _02336ECC ; case 21
	b _02336ECC ; case 22
	b _02336ECC ; case 23
_02336E00:
	cmp r4, #0xb
	addls pc, pc, r4, lsl #2
	b _02336E98
_02336E0C: ; jump table
	b _02336E3C ; case 0
	b _02336E44 ; case 1
	b _02336E4C ; case 2
	b _02336E54 ; case 3
	b _02336E5C ; case 4
	b _02336E64 ; case 5
	b _02336E6C ; case 6
	b _02336E74 ; case 7
	b _02336E7C ; case 8
	b _02336E84 ; case 9
	b _02336E8C ; case 10
	b _02336E94 ; case 11
_02336E3C:
	mov r7, #0
	b _02336E98
_02336E44:
	mov r7, #1
	b _02336E98
_02336E4C:
	mov r7, #2
	b _02336E98
_02336E54:
	mov r7, #3
	b _02336E98
_02336E5C:
	mov r7, #4
	b _02336E98
_02336E64:
	mov r7, #5
	b _02336E98
_02336E6C:
	mov r7, #6
	b _02336E98
_02336E74:
	mov r7, #7
	b _02336E98
_02336E7C:
	mov r7, #8
	b _02336E98
_02336E84:
	mov r7, #9
	b _02336E98
_02336E8C:
	mov r7, #0xa
	b _02336E98
_02336E94:
	mov r7, #0xb
_02336E98:
	mov r0, r7
	bl ov01_02337174
	cmp r0, #0
	beq _02336EC0
	ldr r1, _02337008 ; =ov01_0233C1A8
	mov r0, #7
	ldr r1, [r1]
	strb r7, [r1, #0x15]
	bl PlaySeVolumeWrapper
	b _02336FFC
_02336EC0:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02336FFC
_02336ECC:
	sub r0, r4, #0xc
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02336FF8
_02336EDC: ; jump table
	b _02336F0C ; case 0
	b _02336F20 ; case 1
	b _02336F34 ; case 2
	b _02336F48 ; case 3
	b _02336F5C ; case 4
	b _02336F70 ; case 5
	b _02336F84 ; case 6
	b _02336F98 ; case 7
	b _02336FAC ; case 8
	b _02336FC0 ; case 9
	b _02336FD4 ; case 10
	b _02336FE8 ; case 11
_02336F0C:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F20:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F34:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #2
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F48:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F5C:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #4
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F70:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #5
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F84:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #6
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336F98:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #7
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336FAC:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336FC0:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #9
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336FD4:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #0xa
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02336FF8
_02336FE8:
	ldr r0, _02337008 ; =ov01_0233C1A8
	mov r1, #0xb
	ldr r0, [r0]
	strb r1, [r0, #0x14]
_02336FF8:
	bl ov01_02337014
_02336FFC:
	mov r0, #1
_02337000:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02337008: .word ov01_0233C1A8
_0233700C: .word 0x00000408
_02337010: .word ov01_0233BB14
	arm_func_end ov01_02336B50

	arm_func_start ov01_02337014
ov01_02337014: ; 0x02337014
	stmdb sp!, {r3, lr}
	ldr r0, _023370A4 ; =ov01_0233C1A8
	ldr r1, [r0]
	ldrsb r0, [r1, #0x14]
	cmp r0, #0xa
	bge _02337090
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _023370A4 ; =ov01_0233C1A8
	ldr r2, _023370A8 ; =ov01_0233BCA4
	ldr ip, [r0]
	ldrsb r1, [ip, #0x15]
	ldrsb r3, [ip, #0x14]
	add r1, ip, r1
	strb r3, [r1, #8]
	ldr r3, [r0]
	ldrsb r1, [r3, #0x15]
	add r1, r1, #1
	strb r1, [r3, #0x15]
	ldr ip, [r0]
	ldr r3, [ip, #0xd8]
	ldrsb r1, [ip, #0x15]
	ldrsb r2, [r2, r3]
	cmp r1, r2
	ldmltia sp!, {r3, pc}
	sub r1, r2, #1
	strb r1, [ip, #0x15]
	ldr r0, [r0]
	mov r1, #0xb
	strb r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
_02337090:
	movne r0, #1
	strne r0, [r1, #4]
	ldmneia sp!, {r3, pc}
	bl ov01_023370BC
	ldmia sp!, {r3, pc}
	.align 2, 0
_023370A4: .word ov01_0233C1A8
_023370A8: .word ov01_0233BCA4
	arm_func_end ov01_02337014

	arm_func_start ov01_023370AC
ov01_023370AC: ; 0x023370AC
	ldr r1, _023370B8 ; =ov01_0233CA70
	ldmia r1, {r0, r1}
	bx lr
	.align 2, 0
_023370B8: .word ov01_0233CA70
	arm_func_end ov01_023370AC

	arm_func_start ov01_023370BC
ov01_023370BC: ; 0x023370BC
	stmdb sp!, {r3, lr}
	ldr r0, _02337170 ; =ov01_0233C1A8
	ldr r2, [r0]
	ldrsb r1, [r2, #0x15]
	add r0, r2, r1
	ldrb r0, [r0, #8]
	cmp r0, #0xa
	subeq r0, r1, #1
	streqb r0, [r2, #0x15]
	ldr r0, _02337170 ; =ov01_0233C1A8
	ldr r3, [r0]
	ldrsb r0, [r3, #0x15]
	cmp r0, #0
	bge _0233714C
	mov r2, #0
	mov r1, r2
	b _02337118
_02337100:
	add r0, r3, r1
	ldrb r0, [r0, #8]
	cmp r0, #0xa
	movne r2, #1
	bne _02337120
	add r1, r1, #1
_02337118:
	cmp r1, #0xc
	blt _02337100
_02337120:
	cmp r2, #0
	moveq r0, #1
	streq r0, [r3, #4]
	ldmeqia sp!, {r3, pc}
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldr r0, _02337170 ; =ov01_0233C1A8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x15]
	ldmia sp!, {r3, pc}
_0233714C:
	mov r0, #1
	bl PlaySeVolumeWrapper
	ldr r0, _02337170 ; =ov01_0233C1A8
	mov r1, #0xa
	ldr r2, [r0]
	ldrsb r0, [r2, #0x15]
	add r0, r2, r0
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02337170: .word ov01_0233C1A8
	arm_func_end ov01_023370BC

	arm_func_start ov01_02337174
ov01_02337174: ; 0x02337174
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldr r1, _023371B0 ; =ov01_0233C1A8
	sub r2, r0, #1
	ldr r3, [r1]
	add r1, r3, r2
	ldrb r1, [r1, #8]
	cmp r1, #0xa
	addeq r0, r3, r0
	ldreqb r0, [r0, #8]
	cmpeq r0, #0xa
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_023371B0: .word ov01_0233C1A8
	arm_func_end ov01_02337174

	arm_func_start ov01_023371B4
ov01_023371B4: ; 0x023371B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023371D4 ; =ov01_0233BCAC
	bl InitMenu
	cmp r0, #0
	ldrne r0, _023371D8 ; =ov01_0233CA78
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023371D4: .word ov01_0233BCAC
_023371D8: .word ov01_0233CA78
	arm_func_end ov01_023371B4

	arm_func_start ov01_023371DC
ov01_023371DC: ; 0x023371DC
	stmdb sp!, {r3, lr}
	mov r0, #0x4c
	mov r1, #8
	bl MemAlloc
	ldr r1, _0233720C ; =ov01_0233C1AC
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #8]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233720C: .word ov01_0233C1AC
	arm_func_end ov01_023371DC

	arm_func_start ov01_02337210
ov01_02337210: ; 0x02337210
	stmdb sp!, {r3, lr}
	ldr r0, _02337238 ; =ov01_0233C1AC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02337238 ; =ov01_0233C1AC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02337238: .word ov01_0233C1AC
	arm_func_end ov01_02337210

	arm_func_start ov01_0233723C
ov01_0233723C: ; 0x0233723C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	ldr r0, _02337550 ; =ov01_0233C1AC
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02337544
_0233725C: ; jump table
	b _0233728C ; case 0
	b _023372B4 ; case 1
	b _02337358 ; case 2
	b _02337440 ; case 3
	b _02337544 ; case 4
	b _02337544 ; case 5
	b _02337324 ; case 6
	b _0233752C ; case 7
	b _02337544 ; case 8
	b _0233745C ; case 9
	b _0233747C ; case 10
	b _023374D0 ; case 11
_0233728C:
	ldr r0, _02337554 ; =ov01_0233CA78
	ldr r0, [r0]
	cmp r0, #0
	bne _023372A0
	bl ov01_0232FDAC
_023372A0:
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02337544
_023372B4:
	bl ov01_0232E94C
	cmp r0, #0
	bne _02337544
	ldr r0, _02337554 ; =ov01_0233CA78
	ldr r0, [r0]
	cmp r0, #0
	bne _02337310
	ldr r0, _02337550 ; =ov01_0233C1AC
	ldr r0, [r0]
	add r0, r0, #9
	bl GetMainTeamNameWithCheck
	ldr r0, _02337550 ; =ov01_0233C1AC
	ldr r1, [r0]
	add r0, r1, #0x39
	add r1, r1, #9
	bl StrcpySimple
	ldr r1, _02337550 ; =ov01_0233C1AC
	mov r0, #1
	ldr r3, [r1]
	mov r2, r0
	add r1, r3, #9
	add r3, r3, #0x39
	bl ShowKeyboard
_02337310:
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02337544
_02337324:
	bl ov01_0232FDAC
	ldr r1, _02337550 ; =ov01_0233C1AC
	mov r0, #1
	ldr r3, [r1]
	mov r2, r0
	add r1, r3, #0x19
	add r3, r3, #0x39
	bl ShowKeyboard
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02337544
_02337358:
	bl ov01_0232E94C
	cmp r0, #0
	bne _02337544
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02337544
	ldr r0, _02337554 ; =ov01_0233CA78
	ldr r0, [r0]
	cmp r0, #0
	bne _023373F8
	bl ov01_0232F3F4
	bl GetKeyboardStringResult
	ldr r1, _02337550 ; =ov01_0233C1AC
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	ldr r1, [r1]
	add r1, r1, #9
	bl StrncmpSimple
	cmp r0, #0
	beq _023373BC
	bl GetKeyboardStringResult
	bl SetMainTeamName
	ldr r0, _02337550 ; =ov01_0233C1AC
	ldr r0, [r0]
	add r0, r0, #9
	bl GetMainTeamNameWithCheck
_023373BC:
	ldr r0, _02337550 ; =ov01_0233C1AC
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	ldr r1, [r0]
	add r0, r1, #0x39
	add r1, r1, #9
	bl StrncmpSimple
	cmp r0, #0
	ldrne r0, _02337550 ; =ov01_0233C1AC
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #8]
	ldreq r0, _02337550 ; =ov01_0233C1AC
	moveq r1, #0
	ldreq r0, [r0]
	streqb r1, [r0, #8]
_023373F8:
	bl GetKeyboardStringResult
	ldr r1, _02337550 ; =ov01_0233C1AC
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x29
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x19
	bl StrcpySimple
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02337544
_02337440:
	bl sub_02037468
	cmp r0, #0
	ldrne r0, _02337550 ; =ov01_0233C1AC
	movne r1, #9
	ldrne r0, [r0]
	strne r1, [r0]
	b _02337544
_0233745C:
	add r0, r1, #0x29
	bl sub_0203909C
	bl sub_02039304
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02337544
_0233747C:
	bl sub_0203931C
	cmp r0, #0
	bne _023374A8
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r3, #7
	ldr r2, [r0]
	mov r1, #0xb
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02337544
_023374A8:
	cmp r0, #1
	bne _02337544
	ldr r0, _02337550 ; =ov01_0233C1AC
	mov r3, #7
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02337544
_023374D0:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _02337500
	ldr ip, _02337558 ; =ov01_0233755C
	mov r3, #0
	add r2, sp, #0
	mov r0, #2
	mov r1, #0x100
	str ip, [sp, #0x84]
	str r3, [sp, #0x88]
	bl sub_0204964C
	b _02337524
_02337500:
	ldr r0, _02337554 ; =ov01_0233CA78
	ldr r0, [r0]
	cmp r0, #0
	bne _0233751C
	mov r0, #8
	bl ov01_023310B8
	b _02337524
_0233751C:
	mov r0, #0
	bl ov01_023310B8
_02337524:
	mov r0, #4
	b _02337548
_0233752C:
	bl sub_02039218
	cmp r0, #0
	ldrne r0, _02337550 ; =ov01_0233C1AC
	ldrne r1, [r0]
	ldrne r0, [r1, #4]
	strne r0, [r1]
_02337544:
	mov r0, #1
_02337548:
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02337550: .word ov01_0233C1AC
_02337554: .word ov01_0233CA78
_02337558: .word ov01_0233755C
	arm_func_end ov01_0233723C
