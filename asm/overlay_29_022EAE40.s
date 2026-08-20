	.include "asm/macros.inc"
	.include "overlay_29_022EAE40.inc"

	.text

	arm_func_start ov29_022EAE40
ov29_022EAE40: ; 0x022EAE40
	stmdb sp!, {r4, lr}
	ldr lr, _022EAEA0 ; =DUNGEON_PTR
	ldr r2, _022EAEA4 ; =0x0002CB02
	ldr r4, [lr]
	ldr r1, _022EAEA8 ; =0x000003E7
	add r3, r2, #4
	strh r1, [r4, r2]
	ldr r4, [lr]
	add ip, r2, #2
	strh r0, [r4, r3]
	ldr r4, [lr]
	mov r3, #4
	strh r0, [r4, ip]
	ldr r0, [lr]
	sub r2, r2, #2
	add r0, r0, #0x2c000
#ifdef JAPAN
	str r3, [r0, #0xa54]
#else
	str r3, [r0, #0xaf8]
#endif
	ldr r0, [lr]
	mov r3, #0
	strh r3, [r0, r2]
	ldr r0, [lr]
	add r0, r0, #0x700
	strh r1, [r0, #0x96]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EAEA0: .word DUNGEON_PTR
#ifdef JAPAN
_022EAEA4: .word 0x0002CA5E
#else
_022EAEA4: .word 0x0002CB02
#endif
_022EAEA8: .word 0x000003E7
	arm_func_end ov29_022EAE40

	arm_func_start ov29_022EAEAC
ov29_022EAEAC: ; 0x022EAEAC
	stmdb sp!, {r3, lr}
	bl sub_02017ACC
	ldr r0, _022EAEE4 ; =0x0002CB02
	ldr r2, _022EAEE8 ; =DUNGEON_PTR
	ldr ip, _022EAEEC ; =0x000003E7
	ldr r3, [r2]
	add r1, r0, #2
	strh ip, [r3, r0]
	ldr r3, [r2]
	add r0, r0, #4
	strh ip, [r3, r1]
	ldr r1, [r2]
	strh ip, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_022EAEE4: .word 0x0002CA5E
#else
_022EAEE4: .word 0x0002CB02
#endif
_022EAEE8: .word DUNGEON_PTR
_022EAEEC: .word 0x000003E7
	arm_func_end ov29_022EAEAC

	arm_func_start ov29_022EAEF0
ov29_022EAEF0: ; 0x022EAEF0
	ldr ip, _022EAEF8 ; =sub_02017D80
	bx ip
	.align 2, 0
_022EAEF8: .word sub_02017D80
	arm_func_end ov29_022EAEF0
