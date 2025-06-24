	.include "asm/macros.inc"
	.include "overlay_29_0230F8D0.inc"

	.text

	arm_func_start ov29_0230F8D0
ov29_0230F8D0: ; 0x0230F8D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	bl EntityIsValid__0230F008
	cmp r0, #0
	moveq r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r8, #0xb4]
	mov r5, #0
	ldrb r6, [r0, #0x4c]
	ldr r4, _0230F97C ; =DIRECTIONS_XY
	b _0230F96C
_0230F900:
	mov r1, r6, lsl #2
	add r0, r4, r6, lsl #2
	ldrsh ip, [r8, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r8, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr sb, [r0, #0xc]
	cmp sb, #0
	beq _0230F958
	mov r0, sb
	bl IsMonster__0230F980
	cmp r0, #0
	beq _0230F958
	mov r0, sb
	mov r1, r7
	bl ItemIsActive__0230F810
	cmp r0, #0
	movne r0, r6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230F958:
	add r0, r6, #1
	and r0, r0, #0xff
	add r1, r5, #1
	and r6, r0, #7
	and r5, r1, #0xff
_0230F96C:
	cmp r5, #8
	blo _0230F900
	mov r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230F97C: .word DIRECTIONS_XY
	arm_func_end ov29_0230F8D0
