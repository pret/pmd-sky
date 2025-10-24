	.include "asm/macros.inc"
	.include "main_0200ED1C.inc"

	.text

	arm_func_start SetMoneyCarried
SetMoneyCarried: ; 0x0200ED1C
	ldr r1, _0200ED50 ; =0x0001869F
	cmp r0, r1
	movgt r0, r1
	bgt _0200ED34
	cmp r0, #0
	movlt r0, #0
_0200ED34:
	ldr r1, _0200ED54 ; =BAG_ITEMS_PTR_MIRROR
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x394]
	bx lr
	.align 2, 0
_0200ED50: .word 0x0001869F
_0200ED54: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetMoneyCarried

	arm_func_start AddMoneyCarried
AddMoneyCarried: ; 0x0200ED58
	ldr r1, _0200ED7C ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _0200ED80 ; =SetMoneyCarried
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x394]
	add r0, r0, r1
	bx ip
	.align 2, 0
_0200ED7C: .word BAG_ITEMS_PTR_MIRROR
_0200ED80: .word SetMoneyCarried
	arm_func_end AddMoneyCarried
