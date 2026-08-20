	.include "asm/macros.inc"
	.include "main_0200F26C.inc"

	.text

	arm_func_start GetFirstUnequippedItemOfType
GetFirstUnequippedItemOfType: ; 0x0200F26C
	stmdb sp!, {r3, lr}
	ldr r1, _0200F2DC ; =BAG_ITEMS_PTR_MIRROR
	mvn ip, #0
	ldr r1, [r1]
	cmp r0, #0
	ldr r3, [r1, #0x384]
	moveq r0, ip
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	mov r2, ip
	b _0200F2CC
_0200F298:
	ldrsh r1, [r3, #4]
	cmp r1, r0
	bne _0200F2C4
	ldrb r1, [r3, #1]
	cmp r1, #0
	moveq r0, lr, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	cmp ip, r2
	moveq r1, lr, lsl #0x10
	moveq ip, r1, asr #0x10
_0200F2C4:
	add lr, lr, #1
	add r3, r3, #6
_0200F2CC:
	cmp lr, #0x32
	blt _0200F298
	mov r0, ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F2DC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetFirstUnequippedItemOfType

	arm_func_start CopyItemAtIdx
CopyItemAtIdx: ; 0x0200F2E0
	stmdb sp!, {r3, lr}
	ldr r3, _0200F344 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #6
	ldr r3, [r3]
	smulbb r2, r0, r2
	ldr r3, [r3, #0x384]
	ldrb r0, [r3, r2]
	add r3, r3, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F334
	ldrh r2, [r3]
	mov r0, #1
	strh r2, [r1]
	ldrh r2, [r3, #2]
	strh r2, [r1, #2]
	ldrh r2, [r3, #4]
	strh r2, [r1, #4]
	ldmia sp!, {r3, pc}
_0200F334:
	mov r0, r1
	bl ItemZInit
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F344: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CopyItemAtIdx
