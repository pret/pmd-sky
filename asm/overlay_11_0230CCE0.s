	.include "asm/macros.inc"
	.include "overlay_11_0230CCE0.inc"

	.text

	arm_func_start IsRecycleShopOverlaySuspended
IsRecycleShopOverlaySuspended: ; 0x0230CCE0
	ldr r0, _0230CCEC ; =RECYCLE_SHOP_OVERLAY_STATUS
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0230CCEC: .word RECYCLE_SHOP_OVERLAY_STATUS
	arm_func_end IsRecycleShopOverlaySuspended

	arm_func_start ov11_0230CCF0
ov11_0230CCF0: ; 0x0230CCF0
	stmdb sp!, {r4, lr}
	ldr r1, _0230CD3C ; =RECYCLE_SHOP_OVERLAY_STATUS
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230CD34
	ldr lr, _0230CD40 ; =ov11_0238A098
	mov ip, #9
_0230CD10:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230CD10
	ldr r2, _0230CD44 ; =ov11_0238A094
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldr r0, [r2]
	ldmia sp!, {r4, pc}
_0230CD34:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CD3C: .word RECYCLE_SHOP_OVERLAY_STATUS
_0230CD40: .word ov11_0238A098
_0230CD44: .word ov11_0238A094
	arm_func_end ov11_0230CCF0
