	.include "asm/macros.inc"
	.include "main_020527E0.inc"

	.text

	arm_func_start GetSpriteSize
GetSpriteSize: ; 0x020527E0
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	ldr r2, _02052818 ; =MONSTER_SPRITE_DATA
	mov r0, r0, asr #0x10
	ldrb r0, [r2, r0, lsl #1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #6
	movls r0, #6
	ldrhib r0, [r2, r1, lsl #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052818: .word MONSTER_SPRITE_DATA
	arm_func_end GetSpriteSize

	arm_func_start GetSpriteFileSize
GetSpriteFileSize: ; 0x0205281C
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
	ldr r0, _02052838 ; =_020A2D09
	ldrb r0, [r0, r1, lsl #1]
	mov r0, r0, lsl #9
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052838: .word _020A2D09
	arm_func_end GetSpriteFileSize
