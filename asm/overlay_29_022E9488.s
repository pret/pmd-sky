	.include "asm/macros.inc"
	.include "overlay_29_022E9488.inc"

	.text

	arm_func_start ov29_022E9488
ov29_022E9488: ; 0x022E9488
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022E955C ; =DUNGEON_PTR
	ldr r3, _022E9560 ; =0x0001A224
	ldr r4, [ip]
	add ip, r3, #2
	ldrsh r3, [r4, r3]
	ldrsh r4, [r4, ip]
	mvn lr, #0xf
	sub r3, r0, r3
	sub r0, r1, r4
	cmp r3, lr
	cmpge r0, lr
	blt _022E9554
	rsb r1, lr, #0xff
	cmp r3, r1
	cmplt r0, #0xd0
	bge _022E9554
	mov r1, #0xc
	mul ip, r2, r1
	ldr r4, _022E9564 ; =ov29_0237C88A
	ldr r5, _022E9568 ; =ov29_0237C890
	ldrh r2, [r4, ip]
	sub r1, r1, #0x20c
	ldrsh r5, [r5, ip]
	and r1, r2, r1
	strh r1, [r4, ip]
	add r1, r3, r5
	ldrh r2, [r4, ip]
	and r1, r1, lr, lsr #23
	ldr r3, _022E956C ; =ov29_0237C88E
	orr r1, r2, r1
	strh r1, [r4, ip]
	ldr r1, _022E9570 ; =ov29_0237C892
	ldrh r4, [r3, ip]
	ldrsh lr, [r1, ip]
	ldr r1, _022E9574 ; =0xFFFF000F
	ldr r2, _022E9578 ; =_020AFC4C
	and r1, r4, r1
	strh r1, [r3, ip]
	add r0, r0, lr
	ldr r1, _022E957C ; =ov29_0237C888
	mov lr, r0, lsl #0x14
	ldrh r4, [r3, ip]
	ldr r0, [r2]
	add r1, r1, ip
	orr r4, r4, lr, lsr #16
	mov r2, #0
	strh r4, [r3, ip]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022E9554:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E955C: .word DUNGEON_PTR
#ifdef JAPAN
_022E9560: .word 0x0001A180
#else
_022E9560: .word 0x0001A224
#endif
_022E9564: .word ov29_0237C88A
_022E9568: .word ov29_0237C890
_022E956C: .word ov29_0237C88E
_022E9570: .word ov29_0237C892
_022E9574: .word 0xFFFF000F
_022E9578: .word _020AFC4C
_022E957C: .word ov29_0237C888
	arm_func_end ov29_022E9488
