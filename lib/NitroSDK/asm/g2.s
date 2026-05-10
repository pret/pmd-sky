	.include "asm/macros.inc"
	.include "include/g2.inc"

	.text

    arm_func_start G2x_SetBlendAlpha_
G2x_SetBlendAlpha_: ; 0x020776E8
	ldr ip, [sp]
	orr r1, r1, #0x40
	orr r2, r1, r2, lsl #8
	orr r1, r3, ip, lsl #8
	orr r1, r2, r1, lsl #16
	str r1, [r0]
	bx lr
	arm_func_end G2x_SetBlendAlpha_

	arm_func_start G2x_SetBlendBrightness_
G2x_SetBlendBrightness_: ; 0x02077704
	cmp r2, #0
	orrge r1, r1, #0x80
	strgeh r1, [r0]
	strgeh r2, [r0, #4]
	bxge lr
	orr r1, r1, #0xc0
	strh r1, [r0]
	rsb r1, r2, #0
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_SetBlendBrightness_

	arm_func_start G2x_ChangeBlendBrightness_
G2x_ChangeBlendBrightness_: ; 0x0207772C
	ldrh r3, [r0]
	cmp r1, #0
	and r2, r3, #0xc0
	bge _02077758
	cmp r2, #0x80
	biceq r2, r3, #0xc0
	orreq r2, r2, #0xc0
	streqh r2, [r0]
	rsb r1, r1, #0
	strh r1, [r0, #4]
	bx lr
_02077758:
	cmp r2, #0xc0
	biceq r2, r3, #0xc0
	orreq r2, r2, #0x80
	streqh r2, [r0]
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_ChangeBlendBrightness_


