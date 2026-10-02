	.include "asm/macros.inc"
	.include "overlay_34.inc"

	.text

    .public ov34_022DCA70
    .public ov34_022DC9CC
    .public ov34_022DC9B8
    .public ov34_022DC98C
    .public ov34_022DC958
    .public ov34_022DC970
    .public ov34_022DC908
    .public ov34_022DC8B8
    .public ov34_022DC86C
    .public ov34_022DC810
    .public ov34_022DC798
    .public ov34_022DC778
    .public ov34_022DC748
    .public ov34_022DC738
    .public ov34_022DC5B0

	arm_func_start ExplorersOfSkyMain
ExplorersOfSkyMain: ; 0x022DC240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa0
	ldr r3, _022DC598 ; =ov34_022DC738
	ldr r1, _022DC59C ; =ov34_022DD0A0
	mov r2, #0
	str r3, [sp, #0x8c]
	str r2, [sp, #0x90]
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1]
	str r2, [r1, #4]
	bl sub_02028E2C
	bl sub_02017A68
	bl sub_02017B70
	ldr r0, _022DC59C ; =ov34_022DD0A0
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _022DC28C
	bl sub_020519D0
_022DC28C:
	bl sub_0201DC90
	bl ov34_022DC748
	ldr r1, _022DC5A0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD080
	mov r2, #1
	ldr r0, _022DC5A4 ; =ov34_022DC5B0
	strb r2, [r1]
	bl sub_0200383C
	ldr r0, _022DC59C ; =ov34_022DD0A0
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
#ifdef NORTH_AMERICA
	mov r8, #1
	mov fp, #2
	ldr r5, _022DC59C ; =ov34_022DD0A0
	ldr r4, _022DC5A0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD080
	mov r7, r8
	mov r6, r8
#else
	mov fp, #2
	mov r8, #1
	ldr r5, _022DC59C ; =ov34_022DD0A0
	ldr r4, _022DC5A0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD080
	mov r6, fp
	mov r7, r8
#endif
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
	ldr r0, _022DC5A8 ; =ov34_022DCFF4
#ifdef NORTH_AMERICA
	str r8, [sp, #4]
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	mov r1, #0
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022DC5AC ; =ov34_022DD004
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	mov r0, #0x1e
	bl ov34_022DC958
	mov r0, #0x1e
	bl ov34_022DC86C
	str r6, [r5, #0xc]
#else
	mov r2, r1
	mov r3, r1
	str r8, [sp, #4]
	bl sub_02052060
	mov r0, #0x1e
	bl ov34_022DC958
	str r7, [r5, #0xc]
#endif
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
#ifdef NORTH_AMERICA
	mov r0, #0x1e
	bl ov34_022DC908
	str fp, [r5, #0xc]
	b _022DC54C
_022DC53C:
	mov r0, #0
	bl ov34_022DC8B8
	mov r0, #2
	str r0, [r5, #0xc]
#else
	str r6, [r5, #0xc]
	b _022DC54C
_022DC53C:
	mov r0, #0
	bl ov34_022DC8B8
	str fp, [r5, #0xc]
#endif
_022DC54C:
	bl sub_02006E14
	bl sub_020039E4
	bl HandleMenus
	bl sub_02028848
	b _022DC424
_022DC560:
	bl ov34_022DC778
	mov r0, #0
	bl sub_0200383C
	bl sub_0201DCD0
	ldr r0, _022DC59C ; =ov34_022DD0A0
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _022DC584
	bl sub_02051B44
_022DC584:
	bl sub_02034710
	ldr r0, _022DC59C ; =ov34_022DD0A0
	ldr r0, [r0]
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DC598: .word ov34_022DC738
_022DC59C: .word ov34_022DD0A0
_022DC5A0: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD080
_022DC5A4: .word ov34_022DC5B0
_022DC5A8: .word ov34_022DCFF4
#ifdef NORTH_AMERICA
_022DC5AC: .word ov34_022DD004
#endif
	arm_func_end ExplorersOfSkyMain

