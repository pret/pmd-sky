	.include "asm/macros.inc"
	.include "overlay_34.inc"
	.include "global.inc"

	.text

	arm_func_start ExplorersOfSkyMain
ExplorersOfSkyMain: ; 0x022DC240
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa0
	ldr r3, _022DC598 ; =0x022DC738
	ldr r1, _022DC59C ; =0x022DD0A0
	mov r2, #0
	str r3, [sp, #0x8c]
	str r2, [sp, #0x90]
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1]
	str r2, [r1, #4]
	bl sub_02028E2C
	bl sub_02017A68
	bl sub_02017EE8
	ldr r0, _022DC59C ; =0x022DD0A0
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _022DC28C
	bl sub_020519D0
_022DC28C:
	bl sub_0201DC90
	bl ov34_022DC748
	ldr r1, _022DC5A0 ; =0x022DD080
	mov r2, #1
	ldr r0, _022DC5A4 ; =ov34_022DC5B0
	strb r2, [r1]
	bl sub_0200383C
	ldr r0, _022DC59C ; =0x022DD0A0
	ldr r1, [r0, #8]
	cmp r1, #0xd
	addls pc, pc, r1, lsl #2
	b _022DC404
_022DC2BC: ; jump table
	b _022DC404 ; case 0
	b _022DC2F4 ; case 1
	b _022DC2F4 ; case 2
	b _022DC300 ; case 3
	b _022DC314 ; case 4
	b _022DC324 ; case 5
	b _022DC340 ; case 6
	b _022DC35C ; case 7
	b _022DC378 ; case 8
	b _022DC394 ; case 9
	b _022DC3B0 ; case 10
	b _022DC3CC ; case 11
	b _022DC3DC ; case 12
	b _022DC3F8 ; case 13
_022DC2F4:
	mov r1, #1
	str r1, [r0]
	b _022DC404
_022DC300:
	mov r1, #1
	str r1, [r0]
	mov r1, #0x78
	str r1, [r0, #4]
	b _022DC404
_022DC314:
	mov r0, #0
	bl ov34_022DC86C
	bl sub_0204A0E8
	b _022DC404
_022DC324:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #1
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC340:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #0
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC35C:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #8
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC378:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #9
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC394:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #0xa
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC3B0:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #0xb
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC3CC:
	mov r0, #0
	bl ov34_022DC86C
	bl ov34_022DCBCC
	b _022DC404
_022DC3DC:
	mov r0, #0
	bl ov34_022DC86C
	add r2, sp, #8
	mov r0, #1
	mov r1, #0x100
	bl sub_0204964C
	b _022DC404
_022DC3F8:
	mov r0, #0
	bl ov34_022DC86C
	bl ov34_022DCDCC
_022DC404:
	mov r8, #1
	mov fp, #2
	ldr r5, _022DC59C ; =0x022DD0A0
	ldr r4, _022DC5A0 ; =0x022DD080
	mov r7, r8
	mov r6, r8
	mov sb, fp
	mov sl, #0
_022DC424:
	bl sub_020038E8
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _022DC478
	ldr r0, [r5, #8]
	cmp r0, #1
	beq _022DC560
	bl ov34_022DC98C
	cmp r0, #0
	bne _022DC54C
	bl ov34_022DC9B8
	cmp r0, #0
	bne _022DC54C
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _022DC560
	ldr r0, [r5, #8]
	cmp r0, #2
	beq _022DC560
	str sl, [r5, #0xc]
	b _022DC54C
_022DC478:
	ldr r0, [r5]
	cmp r0, #0
	beq _022DC54C
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _022DC4A0
	ldrb r0, [r4]
	cmp r0, #0
	streq sb, [r5, #0xc]
	b _022DC54C
_022DC4A0:
	cmp r0, #2
	bne _022DC508
	ldrb r0, [r4]
	cmp r0, #0
	bne _022DC54C
	mov r1, #0
	str r8, [sp]
	ldr r0, _022DC5A8 ; =0x022DCFF4
	str r8, [sp, #4]
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	mov r1, #0
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022DC5AC ; =0x022DD004
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	mov r0, #0x1e
	bl ov34_022DC958
	mov r0, #0x1e
	bl ov34_022DC86C
	str r6, [r5, #0xc]
	b _022DC54C
_022DC508:
	cmp r0, #3
	bne _022DC53C
	ldr r0, [r5, #4]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r5, #4]
	bgt _022DC54C
	mov r0, #0x1e
	bl ov34_022DC970
	mov r0, #0x1e
	bl ov34_022DC908
	str fp, [r5, #0xc]
	b _022DC54C
_022DC53C:
	mov r0, #0
	bl ov34_022DC8B8
	mov r0, #2
	str r0, [r5, #0xc]
_022DC54C:
	bl sub_02006E14
	bl sub_020039E4
	bl sub_02034A80
	bl sub_02028848
	b _022DC424
_022DC560:
	bl ov34_022DC778
	mov r0, #0
	bl sub_0200383C
	bl sub_0201DCD0
	ldr r0, _022DC59C ; =0x022DD0A0
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _022DC584
	bl sub_02051B44
_022DC584:
	bl sub_02034710
	ldr r0, _022DC59C ; =0x022DD0A0
	ldr r0, [r0]
	add sp, sp, #0xa0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DC598: .4byte 0x022DC738
_022DC59C: .4byte 0x022DD0A0
_022DC5A0: .4byte 0x022DD080
_022DC5A4: .4byte ov34_022DC5B0
_022DC5A8: .4byte 0x022DCFF4
_022DC5AC: .4byte 0x022DD004
	arm_func_end ExplorersOfSkyMain

	arm_func_start ov34_022DC5B0
ov34_022DC5B0: ; 0x022DC5B0
	push {r4, lr}
	bl sub_0201BF64
	bl sub_02028E40
	bl sub_020038D8
	cmp r0, #0
	beq _022DC5D0
	bl ov34_022DC9CC
	bl sub_02003990
_022DC5D0:
	bl ov34_022DCA70
	bl sub_0201DD48
	bl sub_0201F464
	ldr r0, _022DC710 ; =0x022DD080
	ldrb r0, [r0]
	cmp r0, #0
	bne _022DC5F0
	bl sub_0201DDFC
_022DC5F0:
	bl sub_02008F84
	bl sub_0201BE28
	bl sub_02017A80
	bl sub_02003A40
	ldr r1, _022DC710 ; =0x022DD080
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	ldrne r0, _022DC714 ; =0x022DD0A0
	ldrne r0, [r0, #8]
	cmpne r0, #1
	beq _022DC6C4
	cmp r0, #2
	bne _022DC64C
	mov r0, #0
	mov r1, #0x100
	bl sub_02008F3C
	mov r0, #1
	mov r1, #0x100
	bl sub_02008F3C
	mov r0, #0
	bl sub_02008ED0
	b _022DC6C4
_022DC64C:
	cmp r0, #3
	mov r0, #0
	bne _022DC678
	mov r1, r0
	bl sub_02008F3C
	mov r0, #1
	mov r1, #0
	bl sub_02008F3C
	mov r0, #0
	bl sub_02008ED0
	b _022DC6C4
_022DC678:
	sub r1, r0, #0x100
	bl sub_02008F3C
	mov r0, #1
	mvn r1, #0xff
	bl sub_02008F3C
	mov r0, #0
	bl sub_02008ED0
	mov r0, #0
	mov r1, #2
	bl sub_02008F64
	mov r0, #0
	mov r1, #3
	bl sub_02008F64
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
_022DC6C4:
	bl sub_02008F88
	mov r0, r4
	bl sub_02028A64
	bl sub_0201BE5C
	bl sub_0201BE84
	bl sub_020778D0
	bl sub_0201DE10
	bl sub_02028E88
	ldr r0, _022DC714 ; =0x022DD0A0
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _022DC6F8
	bl sub_02051C24
_022DC6F8:
	bl sub_0201BF4C
	ldr r1, _022DC710 ; =0x022DD080
	mov r2, #0
	mov r0, r4
	strb r2, [r1]
	pop {r4, pc}
	.align 2, 0
_022DC710: .4byte 0x022DD080
_022DC714: .4byte 0x022DD0A0
	arm_func_end ov34_022DC5B0

	arm_func_start ov34_022DC718
ov34_022DC718: ; 0x022DC718
	ldr r1, _022DC734 ; =0x022DD0A0
	ldr r2, [r1]
	cmp r2, #0
	streq r0, [r1]
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022DC734: .4byte 0x022DD0A0
	arm_func_end ov34_022DC718
_022DC738:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0x18, 0xC7, 0x2D, 0x02

	arm_func_start ov34_022DC748
ov34_022DC748: ; 0x022DC748
	push {r3, lr}
	ldr r0, _022DC770 ; =0x022DD104
	mov r1, #1
	bl sub_0200B894
	ldr r0, _022DC774 ; =0x022DD0C0
	mov r1, #1
	bl sub_0200B894
	bl ov34_022DC798
	bl ov34_022DC810
	pop {r3, pc}
	.align 2, 0
_022DC770: .4byte 0x022DD104
_022DC774: .4byte 0x022DD0C0
	arm_func_end ov34_022DC748

	arm_func_start ov34_022DC778
ov34_022DC778: ; 0x022DC778
	push {r3, lr}
	ldr r0, _022DC790 ; =0x022DD104
	bl sub_0200B8B8
	ldr r0, _022DC794 ; =0x022DD0C0
	bl sub_0200B8B8
	pop {r3, pc}
	.align 2, 0
_022DC790: .4byte 0x022DD104
_022DC794: .4byte 0x022DD0C0
	arm_func_end ov34_022DC778

	arm_func_start ov34_022DC798
ov34_022DC798: ; 0x022DC798
	push {r3, lr}
	ldr r1, _022DC808 ; =0x022DD0B0
	mov r0, #0
	strb r0, [r1]
	str r0, [r1, #0xc]
	str r0, [r1, #8]
	mov r2, #1
	strb r2, [r1, #1]
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022DC7D4
	ldr r0, _022DC80C ; =0x022DD104
	mov r1, #2
	bl sub_0200B8D4
	pop {r3, pc}
_022DC7D4:
	mov r0, #0
	bl sub_02008F4C
	mvn r1, #0xff
	cmp r0, r1
	bne _022DC7F8
	ldr r0, _022DC80C ; =0x022DD104
	mov r1, #1
	bl sub_0200B8D4
	pop {r3, pc}
_022DC7F8:
	ldr r0, _022DC80C ; =0x022DD104
	mov r1, #0
	bl sub_0200B8D4
	pop {r3, pc}
	.align 2, 0
_022DC808: .4byte 0x022DD0B0
_022DC80C: .4byte 0x022DD104
	arm_func_end ov34_022DC798

	arm_func_start ov34_022DC810
ov34_022DC810: ; 0x022DC810
	push {r3, lr}
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022DC834
	ldr r0, _022DC868 ; =0x022DD0C0
	mov r1, #2
	bl sub_0200B8D4
	pop {r3, pc}
_022DC834:
	mov r0, #1
	bl sub_02008F4C
	mvn r1, #0xff
	cmp r0, r1
	bne _022DC858
	ldr r0, _022DC868 ; =0x022DD0C0
	mov r1, #1
	bl sub_0200B8D4
	pop {r3, pc}
_022DC858:
	ldr r0, _022DC868 ; =0x022DD0C0
	mov r1, #0
	bl sub_0200B8D4
	pop {r3, pc}
	.align 2, 0
_022DC868: .4byte 0x022DD0C0
	arm_func_end ov34_022DC810

	arm_func_start ov34_022DC86C
ov34_022DC86C: ; 0x022DC86C
	push {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022DC8B0 ; =0x022DD0B0
	moveq r1, #1
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022DC8A8
	ldr r0, _022DC8B4 ; =0x022DD104
	mov r1, r4
	bl sub_0200BB60
	ldr r0, _022DC8B0 ; =0x022DD0B0
	mov r1, #1
_022DC8A8:
	strb r1, [r0, #1]
	pop {r4, pc}
	.align 2, 0
_022DC8B0: .4byte 0x022DD0B0
_022DC8B4: .4byte 0x022DD104
	arm_func_end ov34_022DC86C

	arm_func_start ov34_022DC8B8
ov34_022DC8B8: ; 0x022DC8B8
	push {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022DC900 ; =0x022DD0B0
	moveq r1, #2
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022DC8F4
	ldr r0, _022DC904 ; =0x022DD104
	mov r2, r4
	mov r1, #1
	bl sub_0200BB74
	ldr r0, _022DC900 ; =0x022DD0B0
_022DC8F4:
	mov r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
	.align 2, 0
_022DC900: .4byte 0x022DD0B0
_022DC904: .4byte 0x022DD104
	arm_func_end ov34_022DC8B8

	arm_func_start ov34_022DC908
ov34_022DC908: ; 0x022DC908
	push {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022DC950 ; =0x022DD0B0
	moveq r1, #3
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022DC944
	ldr r0, _022DC954 ; =0x022DD104
	mov r2, r4
	mov r1, #2
	bl sub_0200BB74
	ldr r0, _022DC950 ; =0x022DD0B0
_022DC944:
	mov r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
	.align 2, 0
_022DC950: .4byte 0x022DD0B0
_022DC954: .4byte 0x022DD104
	arm_func_end ov34_022DC908

	arm_func_start ov34_022DC958
ov34_022DC958: ; 0x022DC958
	ldr ip, _022DC968 ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022DC96C ; =0x022DD0C0
	bx ip
	.align 2, 0
_022DC968: .4byte sub_0200BB60
_022DC96C: .4byte 0x022DD0C0
	arm_func_end ov34_022DC958

	arm_func_start ov34_022DC970
ov34_022DC970: ; 0x022DC970
	ldr ip, _022DC984 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022DC988 ; =0x022DD0C0
	mov r1, #2
	bx ip
	.align 2, 0
_022DC984: .4byte sub_0200BB74
_022DC988: .4byte 0x022DD0C0
	arm_func_end ov34_022DC970

	arm_func_start ov34_022DC98C
ov34_022DC98C: ; 0x022DC98C
	push {r3, lr}
	ldr r0, _022DC9B0 ; =0x022DD0B0
	ldrb r0, [r0]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!,  {r3, pc}
	ldr r0, _022DC9B4 ; =0x022DD104
	bl sub_0200BD14
	pop {r3, pc}
	.align 2, 0
_022DC9B0: .4byte 0x022DD0B0
_022DC9B4: .4byte 0x022DD104
	arm_func_end ov34_022DC98C

	arm_func_start ov34_022DC9B8
ov34_022DC9B8: ; 0x022DC9B8
	ldr ip, _022DC9C4 ; =sub_0200BD14
	ldr r0, _022DC9C8 ; =0x022DD0C0
	bx ip
	.align 2, 0
_022DC9C4: .4byte sub_0200BD14
_022DC9C8: .4byte 0x022DD0C0
	arm_func_end ov34_022DC9B8

	arm_func_start ov34_022DC9CC
ov34_022DC9CC: ; 0x022DC9CC
	push {r3, lr}
	ldr r0, _022DCA68 ; =0x022DD0B0
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022DCA48
	cmp r1, #1
	beq _022DC9FC
	cmp r1, #2
	beq _022DCA0C
	cmp r1, #3
	beq _022DCA20
	b _022DCA30
_022DC9FC:
	ldr r1, [r0, #4]
	ldr r0, _022DCA6C ; =0x022DD104
	bl sub_0200BB60
	b _022DCA30
_022DCA0C:
	ldr r2, [r0, #4]
	ldr r0, _022DCA6C ; =0x022DD104
	mov r1, #1
	bl sub_0200BB74
	b _022DCA30
_022DCA20:
	ldr r2, [r0, #4]
	ldr r0, _022DCA6C ; =0x022DD104
	mov r1, #2
	bl sub_0200BB74
_022DCA30:
	ldr r0, _022DCA68 ; =0x022DD0B0
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	pop {r3, pc}
_022DCA48:
	ldr r0, _022DCA6C ; =0x022DD104
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r1, #1
	ldr r0, _022DCA68 ; =0x022DD0B0
	moveq r1, #0
	strb r1, [r0, #1]
	pop {r3, pc}
	.align 2, 0
_022DCA68: .4byte 0x022DD0B0
_022DCA6C: .4byte 0x022DD104
	arm_func_end ov34_022DC9CC

	arm_func_start ov34_022DCA70
ov34_022DCA70: ; 0x022DCA70
	push {r4, lr}
	ldr r0, _022DCB58 ; =0x022DD0B0
	mov r4, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _022DCB2C
	ldr r0, _022DCB5C ; =0x022DD104
	bl sub_0200BD2C
	cmp r0, #0
	bne _022DCAB4
	ldr r1, _022DCB58 ; =0x022DD0B0
	ldr r0, _022DCB5C ; =0x022DD104
	ldr r2, [r1, #0xc]
	mov r1, r4
	bl sub_0200BB74
	mov r4, #0
	b _022DCAC4
_022DCAB4:
	ldr r0, _022DCB5C ; =0x022DD104
	bl sub_0200BA08
	cmp r0, #0
	movne r4, #0
_022DCAC4:
	ldr r0, _022DCB5C ; =0x022DD104
	ldrsh r0, [r0, #0x14]
	bl ov34_022DCB64
	ldr r0, _022DCB60 ; =0x022DD0C0
	bl sub_0200BD2C
	cmp r0, #0
	bne _022DCAFC
	ldr r1, _022DCB58 ; =0x022DD0B0
	ldr r0, _022DCB60 ; =0x022DD0C0
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022DCB0C
_022DCAFC:
	ldr r0, _022DCB60 ; =0x022DD0C0
	bl sub_0200BA08
	cmp r0, #0
	movne r4, #0
_022DCB0C:
	ldr r0, _022DCB60 ; =0x022DD0C0
	ldrsh r0, [r0, #0x14]
	bl ov34_022DCB98
	cmp r4, #0
	ldrne r0, _022DCB58 ; =0x022DD0B0
	movne r1, #0
	strbne r1, [r0]
	pop {r4, pc}
_022DCB2C:
	ldr r0, _022DCB5C ; =0x022DD104
	bl sub_0200BA08
	ldr r0, _022DCB5C ; =0x022DD104
	ldrsh r0, [r0, #0x14]
	bl ov34_022DCB64
	ldr r0, _022DCB60 ; =0x022DD0C0
	bl sub_0200BA08
	ldr r0, _022DCB60 ; =0x022DD0C0
	ldrsh r0, [r0, #0x14]
	bl ov34_022DCB98
	pop {r4, pc}
	.align 2, 0
_022DCB58: .4byte 0x022DD0B0
_022DCB5C: .4byte 0x022DD104
_022DCB60: .4byte 0x022DD0C0
	arm_func_end ov34_022DCA70

	arm_func_start ov34_022DCB64
ov34_022DCB64: ; 0x022DCB64
	push {r4, lr}
	mov r4, r0
	mov r0, #1
	bl GetDebugFlag1
	cmp r0, #0
	mov r0, #0
	beq _022DCB8C
	mov r1, r0
	bl sub_02008F3C
	pop {r4, pc}
_022DCB8C:
	mov r1, r4
	bl sub_02008F3C
	pop {r4, pc}
	arm_func_end ov34_022DCB64

	arm_func_start ov34_022DCB98
ov34_022DCB98: ; 0x022DCB98
	push {r4, lr}
	mov r4, r0
	mov r0, #1
	bl GetDebugFlag1
	cmp r0, #0
	mov r0, #1
	beq _022DCBC0
	mov r1, #0
	bl sub_02008F3C
	pop {r4, pc}
_022DCBC0:
	mov r1, r4
	bl sub_02008F3C
	pop {r4, pc}
	arm_func_end ov34_022DCB98

	arm_func_start ov34_022DCBCC
ov34_022DCBCC: ; 0x022DCBCC
	push {r3, lr}
	ldr r0, _022DCBEC ; =0x022DD014
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _022DCBF0 ; =0x022DD084
	movne r1, #0
	strne r1, [r0, #4]
	pop {r3, pc}
	.align 2, 0
_022DCBEC: .4byte 0x022DD014
_022DCBF0: .4byte 0x022DD084
	arm_func_end ov34_022DCBCC

	arm_func_start ov34_022DCBF4
ov34_022DCBF4: ; 0x022DCBF4
	push {r3, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _022DCC84 ; =0x022DD084
	mov ip, #1
	str r0, [r1]
	ldr r3, _022DCC88 ; =0x022DD024
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x31
	str ip, [sp]
	bl sub_0202A5CC
	ldr r1, _022DCC84 ; =0x022DD084
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #0
	bl CreateDBox
	ldr r3, _022DCC84 ; =0x022DD084
	ldr r1, _022DCC8C ; =0x00000408
	ldr ip, [r3]
	ldr r2, _022DCC90 ; =0x00000255
	strb r0, [ip, #1]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowMessageInDBox
	ldr r1, _022DCC84 ; =0x022DD084
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	add sp, sp, #0x98
	pop {r3, pc}
	.align 2, 0
_022DCC84: .4byte 0x022DD084
_022DCC88: .4byte 0x022DD024
_022DCC8C: .4byte 0x00000408
_022DCC90: .4byte 0x00000255
	arm_func_end ov34_022DCBF4

	arm_func_start ov34_022DCC94
ov34_022DCC94: ; 0x022DCC94
	push {r3, lr}
	ldr r0, _022DCCDC ; =0x022DD084
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202AABC
	ldr r0, _022DCCDC ; =0x022DD084
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl FreeDBox
	ldr r0, _022DCCDC ; =0x022DD084
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DCCDC ; =0x022DD084
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_022DCCDC: .4byte 0x022DD084
	arm_func_end ov34_022DCC94

	arm_func_start ov34_022DCCE0
ov34_022DCCE0: ; 0x022DCCE0
	push {r3, lr}
	ldr r0, _022DCDC8 ; =0x022DD084
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _022DCD0C
	cmp r1, #1
	beq _022DCD54
	cmp r1, #2
	beq _022DCD8C
	b _022DCDC0
_022DCD0C:
	ldrsb r0, [r2]
	bl sub_0202AB60
	cmp r0, #0
	bne _022DCDC0
	ldr r0, _022DCDC8 ; =0x022DD084
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _022DCDC8 ; =0x022DD084
	str r0, [r1, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _022DCDC8 ; =0x022DD084
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _022DCDC0
_022DCD54:
	ldrsb r0, [r2]
	bl sub_0202AB40
	cmp r0, #0
	bne _022DCDC0
	ldr r0, _022DCDC8 ; =0x022DD084
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsDBoxActive
	cmp r0, #0
	ldreq r0, _022DCDC8 ; =0x022DD084
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _022DCDC0
_022DCD8C:
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0, #4]
	cmp r0, #2
	bne _022DCDA8
	mov r0, #2
	b _022DCDAC
_022DCDA8:
	mov r0, #1
_022DCDAC:
	cmp r0, #0
	beq _022DCDB8
	bl ov34_022DC718
_022DCDB8:
	mov r0, #4
	pop {r3, pc}
_022DCDC0:
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_022DCDC8: .4byte 0x022DD084
	arm_func_end ov34_022DCCE0

	arm_func_start ov34_022DCDCC
ov34_022DCDCC: ; 0x022DCDCC
	push {r3, lr}
	ldr r0, _022DCDEC ; =0x022DD03C
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _022DCDF0 ; =0x022DD08C
	movne r1, #0
	strne r1, [r0, #4]
	pop {r3, pc}
	.align 2, 0
_022DCDEC: .4byte 0x022DD03C
_022DCDF0: .4byte 0x022DD08C
	arm_func_end ov34_022DCDCC

	arm_func_start ov34_022DCDF4
ov34_022DCDF4: ; 0x022DCDF4
	push {r3, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _022DCE7C ; =0x022DD08C
	ldr r3, _022DCE80 ; =0x022DD04C
	str r0, [r1]
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x11
	bl sub_0202A5CC
	ldr r1, _022DCE7C ; =0x022DD08C
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #0
	bl CreateDBox
	ldr r3, _022DCE7C ; =0x022DD08C
	ldr r1, _022DCE84 ; =0x00000408
	ldr ip, [r3]
	ldr r2, _022DCE88 ; =0x00003D1C
	strb r0, [ip, #1]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowMessageInDBox
	ldr r1, _022DCE7C ; =0x022DD08C
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	add sp, sp, #0x98
	pop {r3, pc}
	.align 2, 0
_022DCE7C: .4byte 0x022DD08C
_022DCE80: .4byte 0x022DD04C
_022DCE84: .4byte 0x00000408
_022DCE88: .4byte 0x00003D1C
	arm_func_end ov34_022DCDF4

	arm_func_start ov34_022DCE8C
ov34_022DCE8C: ; 0x022DCE8C
	push {r3, lr}
	ldr r0, _022DCED4 ; =0x022DD08C
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202AABC
	ldr r0, _022DCED4 ; =0x022DD08C
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl FreeDBox
	ldr r0, _022DCED4 ; =0x022DD08C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DCED4 ; =0x022DD08C
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_022DCED4: .4byte 0x022DD08C
	arm_func_end ov34_022DCE8C

	arm_func_start ov34_022DCED8
ov34_022DCED8: ; 0x022DCED8
	push {r3, lr}
	ldr r0, _022DCFF0 ; =0x022DD08C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _022DCF04
	cmp r1, #1
	beq _022DCF4C
	cmp r1, #2
	beq _022DCF84
	b _022DCFE8
_022DCF04:
	ldrsb r0, [r3]
	bl sub_0202AB60
	cmp r0, #0
	bne _022DCFE8
	ldr r0, _022DCFF0 ; =0x022DD08C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _022DCFF0 ; =0x022DD08C
	str r0, [r1, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _022DCFF0 ; =0x022DD08C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _022DCFE8
_022DCF4C:
	ldrsb r0, [r3]
	bl sub_0202AB40
	cmp r0, #0
	bne _022DCFE8
	ldr r0, _022DCFF0 ; =0x022DD08C
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsDBoxActive
	cmp r0, #0
	ldreq r0, _022DCFF0 ; =0x022DD08C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _022DCFE8
_022DCF84:
	mov r2, #3
	str r2, [r3, #4]
	ldr r1, [r0, #4]
	mov r0, #0
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _022DCFD4
_022DCFA0: ; jump table
	b _022DCFD4 ; case 0
	b _022DCFD4 ; case 1
	b _022DCFB8 ; case 2
	b _022DCFC0 ; case 3
	b _022DCFC8 ; case 4
	b _022DCFD0 ; case 5
_022DCFB8:
	mov r0, r2
	b _022DCFD4
_022DCFC0:
	mov r0, #4
	b _022DCFD4
_022DCFC8:
	mov r0, #5
	b _022DCFD4
_022DCFD0:
	mov r0, #6
_022DCFD4:
	cmp r0, #0
	beq _022DCFE0
	bl ov34_022DC718
_022DCFE0:
	mov r0, #4
	pop {r3, pc}
_022DCFE8:
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_022DCFF0: .4byte 0x022DD08C
	arm_func_end ov34_022DCED8
	; 0x022DCFF4
