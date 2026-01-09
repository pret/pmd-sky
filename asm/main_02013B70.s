	.include "asm/macros.inc"
	.include "main_02013B70.inc"

	.text

; https://decomp.me/scratch/zfpDG 
	arm_func_start GetMoveActualAccuracy
GetMoveActualAccuracy: ; 0x02013B90
	stmdb sp!, {r3, lr}
	ldr r2, _02013BE4 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x63
	bne _02013BDC
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	cmp r2, #0x7d
	ldmeqia sp!, {r3, pc}
	mul r0, r2, r0
	mov r1, #0x64
	bl _s32_div_f
	ldmia sp!, {r3, pc}
_02013BDC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013BE4: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveActualAccuracy
