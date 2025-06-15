	.include "asm/macros.inc"
	.include "overlay_29_0234BEE0.inc"

	.text

	arm_func_start ov29_0234BEE0
ov29_0234BEE0: ; 0x0234BEE0
	ldr r2, _0234BEFC ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _0234BF00 ; =sub_0200B3D4
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_0234BEFC: .word ov29_0235352C
_0234BF00: .word sub_0200B3D4
	arm_func_end ov29_0234BEE0

	arm_func_start ov29_0234BF04
ov29_0234BF04: ; 0x0234BF04
	ldr r2, _0234BF20 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _0234BF24 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_0234BF20: .word ov29_0235352C
_0234BF24: .word sub_0200B330
	arm_func_end ov29_0234BF04

	arm_func_start RunDungeonMode
RunDungeonMode: ; 0x0234BF28
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_02017BEC
	bl sub_02028E2C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	bl ov29_022E0E8C
	bl sub_02027148
	mov r0, #0xf000
	mov r1, #0
	bl sub_0201D7E0
	mov r0, #0x1c0
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234C1C8 ; =ov29_023537D8
	mov r1, #0x1c0
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r2, #0
	ldr r1, [r0, #4]
	strb r2, [r1, #0x1bc]
	ldr r1, [r0, #4]
	str r4, [r1, #8]
	ldr r0, [r0, #4]
	str r4, [r0, #0xc]
	bl DungeonAlloc
	ldr r1, _0234C1C8 ; =ov29_023537D8
	ldr r1, [r1, #4]
	str r0, [r1, #4]
	bl DungeonZInit
	bl ov29_022DDFF0
	bl ov29_022DDFFC
	bl ov29_022DE300
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov ip, r5
	ldr r0, [r0, #4]
	mov r4, #0x1a
	add r6, r0, #0x10
_0234BFE8:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0234BFE8
	ldmia ip, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	bl ov29_0234C9FC
	ldr r0, _0234C1CC ; =ov29_0234BBDC
	bl sub_02006EC4
	bl sub_02017A68
	bl ov29_022E0CFC
	bl ov29_0234C4F8
	cmp r5, #0
	beq _0234C04C
	ldrsb r0, [r5, #0xe]
	cmp r0, #1
	mov r0, #0
	bne _0234C040
	bl ov29_0234C5EC
	mov r0, #1
	bl ov29_0234C584
	b _0234C04C
_0234C040:
	bl ov29_0234C584
	mov r0, #1
	bl ov29_0234C584
_0234C04C:
	bl ov29_022DDC00
	ldr r1, _0234C1C8 ; =ov29_023537D8
	mov r2, #1
	ldr r0, _0234C1D0 ; =ov29_0234C1D8
	strb r2, [r1]
	bl sub_0200383C
	mov r1, #0
	ldr r0, _0234C1D4 ; =ov29_0234BBE8
	mov r2, r1
	bl ov29_022DDD50
	ldr r4, _0234C1C8 ; =ov29_023537D8
	mov r6, #0
_0234C07C:
	bl sub_020038E8
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1bd]
	cmp r0, #0
	bne _0234C0C0
	bl sub_020039E4
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1bc]
	cmp r0, #0
	beq _0234C07C
_0234C0A4:
	bl ov30_02382A34
	cmp r0, #2
	cmpne r0, #3
	bne _0234C0A4
	ldr r0, [r4, #4]
	strb r6, [r0, #0x1bc]
	b _0234C07C
_0234C0C0:
	ldr r0, _0234C1D4 ; =ov29_0234BBE8
	bl ov29_022DDDA4
	mov r0, #0
	bl sub_0200383C
	bl sub_02034710
	bl ov29_0234CA2C
	cmp r5, #0
	beq _0234C108
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r4, #0x1a
	ldr r0, [r0, #4]
	add ip, r0, #0x10
_0234C0F0:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0234C0F0
	ldmia ip, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
_0234C108:
	bl ov29_022DE498
	bl ov29_022DE0A0
	bl ov29_0234C544
	mov r0, #0
	bl sub_02006EC4
	ldr r0, _0234C1C8 ; =ov29_023537D8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0234C154
	bl DungeonFree
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r1, #0
	str r1, [r0, #4]
_0234C154:
	bl sub_0201D804
	bl sub_0202715C
	bl ov29_022DDCA0
	bl sub_02017B70
	bl sub_02017BEC
	mov r0, #0
	sub r1, r0, #0x100
	bl sub_02008F3C
	mov r0, #1
	mvn r1, #0xff
	bl sub_02008F3C
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_020093BC
	mov r0, #1
	bl sub_020093BC
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234C1C8: .word ov29_023537D8
_0234C1CC: .word ov29_0234BBDC
_0234C1D0: .word ov29_0234C1D8
_0234C1D4: .word ov29_0234BBE8
	arm_func_end RunDungeonMode

	arm_func_start ov29_0234C1D8
ov29_0234C1D8: ; 0x0234C1D8
	stmdb sp!, {r4, lr}
	bl sub_0201BF64
	bl sub_02028E40
	bl sub_020038D8
	cmp r0, #0
	beq _0234C1F4
	bl sub_02003990
_0234C1F4:
	bl ov29_022E0A64
	bl ov29_022DDE24
	bl ov29_022E9F9C
	bl HandleFadesDungeonBothScreens
	bl sub_02034A80
	bl ov29_022EA008
	ldr r0, _0234C2EC ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	beq _0234C230
#ifdef JAPAN
	add r0, r0, #0x2180
	add r0, r0, #0x18000
#else
	add r0, r0, #0x224
	add r0, r0, #0x1a000
#endif
	bl ov10_022BF764
	bl ov29_022E6DD0
	b _0234C238
_0234C230:
	mov r0, #0
	bl ov10_022BF764
_0234C238:
	bl sub_02028848
	bl ov29_022DE868
	ldr r0, _0234C2F0 ; =ov29_023537D8
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _0234C258
	blx r0
_0234C258:
	bl ov29_022DC670
	bl sub_0201F464
	ldr r0, _0234C2F0 ; =ov29_023537D8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0234C274
	bl sub_0201DDFC
_0234C274:
	bl sub_02008F84
	bl ov29_022EAFB0
	bl sub_02017A80
	mov r0, #1
	bl sub_02028A64
	bl sub_0201BE28
	bl sub_0201BE5C
	bl sub_0201BE84
	bl sub_0204F9CC
	bl sub_02003A40
	ldr r1, _0234C2F0 ; =ov29_023537D8
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0234C2B8
	mov r0, #0
	bl sub_02008ED0
_0234C2B8:
	bl G3X_Reset
	bl sub_02008F88
	bl sub_0201DE10
	bl ov10_022BF7D4
	bl ov29_0233992C
	bl sub_02028E88
	bl ov29_022DE0CC
	bl sub_0201BF4C
	ldr r1, _0234C2F0 ; =ov29_023537D8
	mov r2, #0
	mov r0, r4
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234C2EC: .word DUNGEON_PTR
_0234C2F0: .word ov29_023537D8
	arm_func_end ov29_0234C1D8

	arm_func_start ov29_0234C2F4
ov29_0234C2F4: ; 0x0234C2F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	add r0, r5, #0x48
	strb r4, [r5, #0x88]
	bl InitRender3dElement64
	mov r0, #0x100
	strh r0, [r5, #0x4c]
	mov r0, #0xc0
	strh r0, [r5, #0x4e]
	mov r0, #1
	strh r0, [r5, #0x72]
	strb r0, [r5, #0x86]
	mov r0, #2
	strb r0, [r5, #0x84]
	mov r0, #0
	strb r0, [r5, #0x77]
	strb r0, [r5, #0x74]
	strb r0, [r5, #0x75]
	strb r0, [r5, #0x76]
	strb r0, [r5, #0x99]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234C2F4

	arm_func_start ov29_0234C354
ov29_0234C354: ; 0x0234C354
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [r0, #0x90]
	str r3, [r0, #0x8c]
	str r3, [r0, #0x94]
	strb r3, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C384
	ldr r0, [r0, #0x90]
	bl ov29_022E0F14
	ldmia sp!, {r3, pc}
_0234C384:
	ldrb r2, [r0, #0x99]
	cmp r2, #0
	strneb r3, [r0, #0x77]
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #0x90]
	bl ov29_022E0F14
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234C354

	arm_func_start ov29_0234C3A0
ov29_0234C3A0: ; 0x0234C3A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4, #0x88]
	cmp r1, #1
	bne _0234C3C8
	ldr r0, [r4, #0x90]
	mov r0, r0, asr #0xc
	bl ov29_022E0F14
	ldr r0, [r4, #0x90]
	ldmia sp!, {r4, pc}
_0234C3C8:
	ldrb r0, [r4, #0x99]
	cmp r0, #0
	ldr r0, [r4, #0x90]
	beq _0234C3F8
	cmp r0, #0
	rsblt r0, r0, #0
	mov r0, r0, asr #0xc
	mov r0, r0, lsl #4
	cmp r0, #0x100
	moveq r0, #0xff
	strb r0, [r4, #0x77]
	ldmia sp!, {r4, pc}
_0234C3F8:
	mov r0, r0, asr #0xc
	bl ov29_022E0F14
	ldr r0, [r4, #0x90]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234C3A0

	arm_func_start StartFadeDungeon
StartFadeDungeon: ; 0x0234C408
	stmdb sp!, {r3, lr}
	str r2, [r0, #0x8c]
	str r1, [r0, #0x94]
	mov r1, #1
	strb r1, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C464
	cmp r2, #5
	cmpne r2, #3
	moveq r1, #0
	streq r1, [r0, #0x90]
	beq _0234C45C
	cmp r2, #4
	moveq r1, #0x10000
	streq r1, [r0, #0x90]
	beq _0234C45C
	cmp r2, #2
	moveq r1, #0x10000
	rsbeq r1, r1, #0
	streq r1, [r0, #0x90]
_0234C45C:
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C464:
	cmp r2, #5
	bne _0234C488
	mov r1, #0
	str r1, [r0, #0x90]
	mov r1, #0xff
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C488:
	cmp r2, #3
	bne _0234C4A8
	mov r1, #0
	str r1, [r0, #0x90]
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C4A8:
	cmp r2, #4
	bne _0234C4CC
	mov r1, #0x10000
	str r1, [r0, #0x90]
	mov r1, #0xff
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C4CC:
	cmp r2, #2
	bne _0234C4F0
	mov r1, #0x10000
	rsb r1, r1, #0
	str r1, [r0, #0x90]
	mov r1, #0
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
_0234C4F0:
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	arm_func_end StartFadeDungeon

	arm_func_start ov29_0234C4F8
ov29_0234C4F8: ; 0x0234C4F8
	stmdb sp!, {r3, lr}
	mov r0, #0x144
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234C540 ; =DUNGEON_FADES_PTR
	mov r1, #0x144
	str r0, [r2]
	bl MemZero
	ldr r0, _0234C540 ; =DUNGEON_FADES_PTR
	mov r1, #0
	ldr r0, [r0]
	bl ov29_0234C2F4
	ldr r0, _0234C540 ; =DUNGEON_FADES_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x9c
	bl ov29_0234C2F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C540: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C4F8

	arm_func_start ov29_0234C544
ov29_0234C544: ; 0x0234C544
	stmdb sp!, {r3, lr}
	ldr r0, _0234C580 ; =DUNGEON_FADES_PTR
	ldr r0, [r0]
	bl ov29_0234C354
	ldr r0, _0234C580 ; =DUNGEON_FADES_PTR
	ldr r0, [r0]
	add r0, r0, #0x9c
	bl ov29_0234C354
	ldr r0, _0234C580 ; =DUNGEON_FADES_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234C580 ; =DUNGEON_FADES_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C580: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C544

	arm_func_start ov29_0234C584
ov29_0234C584: ; 0x0234C584
	stmdb sp!, {r3, lr}
	ldr r1, _0234C5E8 ; =DUNGEON_FADES_PTR
	mov r2, #0x10000
	ldr r3, [r1]
	mov r1, #0x9c
	mla r0, r1, r0, r3
	rsb r2, r2, #0
	str r2, [r0, #0x90]
	mov r1, #1
	str r1, [r0, #0x8c]
	mov r2, #0
	str r2, [r0, #0x94]
	strb r1, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C5CC
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C5CC:
	ldrb r1, [r0, #0x99]
	cmp r1, #0
	strneb r2, [r0, #0x74]
	strneb r2, [r0, #0x75]
	strneb r2, [r0, #0x76]
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C5E8: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C584

	arm_func_start ov29_0234C5EC
ov29_0234C5EC: ; 0x0234C5EC
	stmdb sp!, {r3, lr}
	ldr r2, _0234C650 ; =DUNGEON_FADES_PTR
	mov r1, #0x9c
	ldr r3, [r2]
	mov r2, #0x10000
	mla r0, r1, r0, r3
	str r2, [r0, #0x90]
	mov r2, #1
	str r2, [r0, #0x8c]
	mov r1, #0
	str r1, [r0, #0x94]
	strb r2, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C630
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C630:
	ldrb r1, [r0, #0x99]
	cmp r1, #0
	movne r1, #0xff
	strneb r1, [r0, #0x74]
	strneb r1, [r0, #0x75]
	strneb r1, [r0, #0x76]
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C650: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C5EC

	arm_func_start ov29_0234C654
ov29_0234C654: ; 0x0234C654
	ldr r1, _0234C664 ; =DUNGEON_FADES_PTR
	ldr r1, [r1]
	strh r0, [r1, #0x72]
	bx lr
	.align 2, 0
_0234C664: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C654

	arm_func_start StartFadeDungeonWrapper
StartFadeDungeonWrapper: ; 0x0234C668
	stmdb sp!, {r3, lr}
	ldr r3, _0234C708 ; =DUNGEON_FADES_PTR
	mov ip, #0
	ldr lr, [r3]
	add lr, lr, r2, lsl #2
	str r0, [lr, #0x138]
	ldr r0, [r3]
	add r0, r0, r2
	strb ip, [r0, #0x140]
	ldr ip, [r3]
	add r0, ip, r2, lsl #2
	ldr r0, [r0, #0x138]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0234C6E0
_0234C6A4: ; jump table
	b _0234C6E0 ; case 0
	b _0234C6C0 ; case 1
	b _0234C6C8 ; case 2
	b _0234C6C8 ; case 3
	b _0234C6D0 ; case 4
	b _0234C6D8 ; case 5
	b _0234C6D8 ; case 6
_0234C6C0:
	mov r3, #2
	b _0234C6E4
_0234C6C8:
	mov r3, #3
	b _0234C6E4
_0234C6D0:
	mov r3, #4
	b _0234C6E4
_0234C6D8:
	mov r3, #5
	b _0234C6E4
_0234C6E0:
	mov r3, #0
_0234C6E4:
	mov r0, #0x9c
	mla r0, r2, r0, ip
	cmp r3, #0
	bne _0234C6FC
	bl ov29_0234C354
	ldmia sp!, {r3, pc}
_0234C6FC:
	mov r2, r3
	bl StartFadeDungeon
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C708: .word DUNGEON_FADES_PTR
	arm_func_end StartFadeDungeonWrapper

	arm_func_start ov29_0234C70C
ov29_0234C70C: ; 0x0234C70C
	ldr r2, _0234C734 ; =DUNGEON_FADES_PTR
	mov r1, #0x9c
	ldr r2, [r2]
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_0234C734: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C70C

	arm_func_start ov29_0234C738
ov29_0234C738: ; 0x0234C738
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #0x9c
	mul r4, r5, r0
	ldr r6, _0234C7D0 ; =DUNGEON_FADES_PTR
	mov r7, #5
_0234C750:
	ldr r1, [r6]
	add r0, r1, r5, lsl #2
	ldr r0, [r0, #0x138]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0234C7C0
_0234C768: ; jump table
	b _0234C7C0 ; case 0
	b _0234C784 ; case 1
	b _0234C784 ; case 2
	b _0234C79C ; case 3
	b _0234C784 ; case 4
	b _0234C784 ; case 5
	b _0234C79C ; case 6
_0234C784:
	add r0, r4, r1
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	bne _0234C7C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0234C79C:
	add r0, r5, r1
	ldrb r0, [r0, #0x140]
	cmp r0, #1
	bne _0234C7C0
	add r0, r4, r1
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0234C7C0:
	mov r0, r7
	bl AdvanceFrame
	b _0234C750
_0234C7CC:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234C7D0: .word DUNGEON_FADES_PTR
	arm_func_end ov29_0234C738

	arm_func_start HandleFadesDungeon
HandleFadesDungeon: ; 0x0234C7D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0234C9E0 ; =DUNGEON_FADES_PTR
	mov r5, r0
	ldr r4, [r1]
	add r0, r4, r5, lsl #2
	ldr r2, [r0, #0x138]
	cmp r2, #6
	addls pc, pc, r2, lsl #2
	b _0234C8B8
_0234C7F8: ; jump table
	b _0234C8B8 ; case 0
	b _0234C814 ; case 1
	b _0234C8B8 ; case 2
	b _0234C830 ; case 3
	b _0234C814 ; case 4
	b _0234C8B8 ; case 5
	b _0234C830 ; case 6
_0234C814:
	mov r0, #0x9c
	mla r0, r5, r0, r4
	ldr r1, [r0, #0x8c]
	cmp r1, #1
	bne _0234C8B8
	bl ov29_0234C354
	ldmia sp!, {r3, r4, r5, pc}
_0234C830:
	adds r0, r4, #0x140
	mov r0, #0x9c
	bne _0234C888
	mla r0, r5, r0, r4
	ldr r1, [r0, #0x8c]
	cmp r1, #1
	bne _0234C8B8
	cmp r2, #3
	ldr r1, [r0, #0x94]
	bne _0234C864
	mov r2, #2
	bl StartFadeDungeon
	b _0234C86C
_0234C864:
	mov r2, #4
	bl StartFadeDungeon
_0234C86C:
	ldr r0, _0234C9E0 ; =DUNGEON_FADES_PTR
	ldr r0, [r0]
	add r1, r0, #0x140
	ldrb r0, [r1, r5]
	add r0, r0, #1
	strb r0, [r1, r5]
	b _0234C8B8
_0234C888:
	mul r3, r5, r0
	add r0, r4, r3
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	bne _0234C8B8
	add r0, r4, r5
	mov r2, #0
	strb r2, [r0, #0x140]
	ldr r0, [r1]
	add r0, r0, r3
	bl ov29_0234C354
	ldmia sp!, {r3, r4, r5, pc}
_0234C8B8:
	ldr r1, _0234C9E0 ; =DUNGEON_FADES_PTR
	mov r0, #0x9c
	ldr r1, [r1]
	mla r4, r5, r0, r1
	ldrb r0, [r4, #0x98]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x88]
	cmp r0, #1
	bne _0234C8EC
	mov r0, r4
	bl ov29_0234C3A0
	b _0234C918
_0234C8EC:
	ldrb r0, [r4, #0x99]
	cmp r0, #0
	mov r0, r4
	beq _0234C914
	bl ov29_0234C3A0
	cmp r0, #0
	beq _0234C918
	add r0, r4, #0x48
	bl sub_0201F2A0
	b _0234C918
_0234C914:
	bl ov29_0234C3A0
_0234C918:
	ldr r0, [r4, #0x8c]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0234C928: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	ldmia sp!, {r3, r4, r5, pc} ; case 1
	b _0234C9BC ; case 2
	b _0234C968 ; case 3
	b _0234C994 ; case 4
	b _0234C940 ; case 5
_0234C940:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	add r0, r1, r0
	str r0, [r4, #0x90]
	cmp r0, #0x10000
	movge r0, #0x10000
	strge r0, [r4, #0x90]
	movge r0, #1
	strge r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C968:
	ldr r2, [r4, #0x90]
	ldr r1, [r4, #0x94]
	mov r0, #0x10000
	sub r1, r2, r1
	rsb r0, r0, #0
	str r1, [r4, #0x90]
	cmp r1, r0
	strle r0, [r4, #0x90]
	movle r0, #1
	strle r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C994:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	sub r0, r1, r0
	str r0, [r4, #0x90]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4, #0x90]
	movle r0, #1
	strle r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C9BC:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	adds r0, r1, r0
	str r0, [r4, #0x90]
	movpl r0, #0
	strpl r0, [r4, #0x90]
	movpl r0, #1
	strpl r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234C9E0: .word DUNGEON_FADES_PTR
	arm_func_end HandleFadesDungeon

	arm_func_start HandleFadesDungeonBothScreens
HandleFadesDungeonBothScreens: ; 0x0234C9E4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl HandleFadesDungeon
	mov r0, #1
	bl HandleFadesDungeon
	ldmia sp!, {r3, pc}
	arm_func_end HandleFadesDungeonBothScreens

	arm_func_start ov29_0234C9FC
ov29_0234C9FC: ; 0x0234C9FC
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, #0
	bl MemAlloc
	ldr r1, _0234CA28 ; =ov29_023537E4
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CA28: .word ov29_023537E4
	arm_func_end ov29_0234C9FC

	arm_func_start ov29_0234CA2C
ov29_0234CA2C: ; 0x0234CA2C
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CA48
	mov r0, #0x21
	bl UnloadOverlay
_0234CA48:
	ldr r0, _0234CA64 ; =ov29_023537E4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234CA64 ; =ov29_023537E4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CA64: .word ov29_023537E4
	arm_func_end ov29_0234CA2C

	arm_func_start ov29_0234CA68
ov29_0234CA68: ; 0x0234CA68
	ldr r0, _0234CA78 ; =ov29_023537E4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0234CA78: .word ov29_023537E4
	arm_func_end ov29_0234CA68

	arm_func_start ov29_0234CA7C
ov29_0234CA7C: ; 0x0234CA7C
	mov r0, #0x5800
	bx lr
	arm_func_end ov29_0234CA7C

	arm_func_start ov29_0234CA84
ov29_0234CA84: ; 0x0234CA84
	stmdb sp!, {r3, lr}
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _0234CAC8 ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	mov r0, #0x21
	str r2, [r1, #4]
	bl LoadOverlay
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r1, #0x5800
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl WriteQuicksaveData
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAC4: .word ov29_023537E4
_0234CAC8: .word ov29_0237D000
	arm_func_end ov29_0234CA84

	arm_func_start ov29_0234CACC
ov29_0234CACC: ; 0x0234CACC
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CAE8
	mov r0, #0x21
	bl UnloadOverlay
_0234CAE8:
	ldr r0, _0234CAFC ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAFC: .word ov29_023537E4
	arm_func_end ov29_0234CACC

	arm_func_start ov29_0234CB00
ov29_0234CB00: ; 0x0234CB00
	ldr r0, _0234CB28 ; =ov29_023537E4
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0234CB2C ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	ldr ip, _0234CB30 ; =LoadOverlay
	mov r0, #0x21
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_0234CB28: .word ov29_023537E4
_0234CB2C: .word ov29_0237D000
_0234CB30: .word LoadOverlay
	arm_func_end ov29_0234CB00

	arm_func_start ov29_0234CB34
ov29_0234CB34: ; 0x0234CB34
	ldr r0, _0234CB4C ; =ov29_023537E4
	ldr ip, _0234CB50 ; =ov30_023842F4
	ldr r0, [r0]
	mov r1, #0x5800
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234CB4C: .word ov29_023537E4
_0234CB50: .word ov30_023842F4
	arm_func_end ov29_0234CB34

	arm_func_start ov29_0234CB54
ov29_0234CB54: ; 0x0234CB54
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CB70
	mov r0, #0x21
	bl UnloadOverlay
_0234CB70:
	ldr r0, _0234CB84 ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CB84: .word ov29_023537E4
	arm_func_end ov29_0234CB54

	arm_func_start DisplayFloorTip
DisplayFloorTip: ; 0x0234CB88
	stmdb sp!, {r3, lr}
	bl GetLeader
	ldr r2, _0234CC88 ; =DUNGEON_PTR
	mvn r3, #0
	ldr r1, [r2]
	ldr r0, _0234CC8C ; =ov29_023532C0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r2, [r2]
	mov r1, #1
	add r2, r2, #0x100
	strh r3, [r2, #0xda]
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC90 ; =ov29_023532B8
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC94 ; =ov29_023532B0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC98 ; =ov29_02353240
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldreq r0, _0234CC88 ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x748]
	cmpeq r0, #3
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC9C ; =ov29_023532A0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA0 ; =ov29_02353298
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA4 ; =ov29_02353290
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA8 ; =ov29_02353278
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCAC ; =ov29_02353238
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCB0 ; =ov29_023532E0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CC88: .word DUNGEON_PTR
_0234CC8C: .word ov29_023532C0
_0234CC90: .word ov29_023532B8
_0234CC94: .word ov29_023532B0
_0234CC98: .word ov29_02353240
_0234CC9C: .word ov29_023532A0
_0234CCA0: .word ov29_02353298
_0234CCA4: .word ov29_02353290
_0234CCA8: .word ov29_02353278
_0234CCAC: .word ov29_02353238
_0234CCB0: .word ov29_023532E0
	arm_func_end DisplayFloorTip

	arm_func_start DisplayItemTip
DisplayItemTip: ; 0x0234CCB4
	stmdb sp!, {r4, lr}
	ldr r2, _0234CEA4 ; =DUNGEON_PTR
	mvn r3, #0
	ldr r1, [r2]
	mov r4, r0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r1, [r2]
	add r1, r1, #0x100
	strh r3, [r1, #0xda]
	bl GetItemCategoryVeneer
	cmp r0, #3
	bne _0234CCF8
	ldr r0, _0234CEA8 ; =ov29_023532F0
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CCF8:
	cmp r4, #0x46
	bne _0234CD10
	ldr r0, _0234CEAC ; =ov29_023532F8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD10:
	cmp r4, #0x52
	bne _0234CD28
	ldr r0, _0234CEB0 ; =ov29_023532D8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD28:
	cmp r4, #0x57
	bne _0234CD40
	ldr r0, _0234CEB4 ; =ov29_023532C8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD40:
	cmp r4, #8
	bne _0234CD58
	ldr r0, _0234CEB8 ; =ov29_02353250
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD58:
	cmp r4, #0x51
	bne _0234CD70
	ldr r0, _0234CEBC ; =ov29_02353248
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD70:
	cmp r4, #0x54
	bne _0234CD88
	ldr r0, _0234CEC0 ; =ov29_02353270
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD88:
	cmp r4, #0xb7
	bne _0234CDA0
	ldr r0, _0234CEC4 ; =ov29_02353280
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDA0:
	cmp r4, #0x63
	bne _0234CDB8
	ldr r0, _0234CEC8 ; =ov29_023532A8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDB8:
	cmp r4, #0x45
	bne _0234CDD0
	ldr r0, _0234CECC ; =ov29_02353300
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDD0:
	cmp r4, #0x5b
	bne _0234CDE8
	ldr r0, _0234CED0 ; =ov29_02353258
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDE8:
	cmp r4, #0x56
	bne _0234CE00
	ldr r0, _0234CED4 ; =ov29_02353268
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE00:
	cmp r4, #0x5e
	bne _0234CE18
	ldr r0, _0234CED8 ; =ov29_02353288
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE18:
	cmp r4, #0x4c
	bne _0234CE30
	ldr r0, _0234CEDC ; =ov29_023532E8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE30:
	cmp r4, #0x60
	bne _0234CE48
	ldr r0, _0234CEE0 ; =ov29_02353260
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE48:
	cmp r4, #0x75
	bne _0234CE60
	ldr r0, _0234CEE4 ; =ov29_02353308
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE60:
	ldr r0, _0234CEA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
#ifdef JAPAN
	cmp r0, #0x7a
#else
	cmp r0, #0x7b
#endif
	ldmneia sp!, {r4, pc}
	ldr r0, _0234CEE8 ; =0xFFFFFED2
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	ldr r0, _0234CEEC ; =ov29_02353310
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234CEA4: .word DUNGEON_PTR
_0234CEA8: .word ov29_023532F0
_0234CEAC: .word ov29_023532F8
_0234CEB0: .word ov29_023532D8
_0234CEB4: .word ov29_023532C8
_0234CEB8: .word ov29_02353250
_0234CEBC: .word ov29_02353248
_0234CEC0: .word ov29_02353270
_0234CEC4: .word ov29_02353280
_0234CEC8: .word ov29_023532A8
_0234CECC: .word ov29_02353300
_0234CED0: .word ov29_02353258
_0234CED4: .word ov29_02353268
_0234CED8: .word ov29_02353288
_0234CEDC: .word ov29_023532E8
_0234CEE0: .word ov29_02353260
_0234CEE4: .word ov29_02353308
_0234CEE8: .word 0xFFFFFED2
_0234CEEC: .word ov29_02353310
	arm_func_end DisplayItemTip

	arm_func_start DisplayDungeonTip
DisplayDungeonTip: ; 0x0234CEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, r1
	bl GetDungeonTipShown
	cmp r0, #0
	bne _0234CF58
	ldrh r0, [r5, #4]
	bl StringFromId
	ldrb r0, [r0]
	cmp r0, #0
	beq _0234CF58
	ldr r0, [r5]
	bl SetDungeonTipShown
	bl ov29_022EACBC
	ldrh r1, [r5, #4]
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	cmp r4, #0
	beq _0234CF50
	bl GetLeader
	ldrh r1, [r5, #4]
	bl LogMessageByIdQuiet
_0234CF50:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0234CF58:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DisplayDungeonTip

	arm_func_start SetBothScreensWindowColorToDefault
SetBothScreensWindowColorToDefault: ; 0x0234CF60
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	bne _0234CF7C
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF7C:
	bl GetPlayerGender
	cmp r0, #1
	bne _0234CF94
	mov r0, #0
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF94:
	mov r0, #1
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
	arm_func_end SetBothScreensWindowColorToDefault

	arm_func_start ov29_0234CFA0
ov29_0234CFA0: ; 0x0234CFA0
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CFE8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsFutureDungeon
	cmp r0, #0
	bne _0234CFD8
	bl IsSecretFloor
	cmp r0, #0
	beq _0234CFE0
_0234CFD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0234CFE0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CFE8: .word DUNGEON_PTR
	arm_func_end ov29_0234CFA0

	arm_func_start GetPersonalityIndex
GetPersonalityIndex: ; 0x0234CFEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x48]
	cmp r0, #0xd8
	cmpne r0, #0xf9
	cmpne r0, #0xf7
	cmpne r0, #0xf8
	beq _0234D1D4
	cmp r0, #0xd6
	blo _0234D1D4
	cmp r0, #0xd7
	bne _0234D04C
	mov r0, #0
	mov r1, #0x43
	bl LoadScriptVariableValue
	cmp r0, #1
	moveq r4, #0x4b0
	beq _0234D1E0
	cmp r0, #2
	ldreq r4, _0234D1E8 ; =0x000004B1
	beq _0234D1E0
	cmp r0, #3
	ldreq r4, _0234D1EC ; =0x000004B2
	b _0234D1E0
_0234D04C:
	cmp r0, #0xd6
	bne _0234D0A0
	ldrsh r2, [r5, #2]
	ldr r1, _0234D1F0 ; =0x000001B2
	cmp r2, r1
	ldreq r4, _0234D1F4 ; =0x000004CD
	beq _0234D1E0
	cmp r2, #0xae
	addeq r4, r1, #0x31c
	beq _0234D1E0
	add r0, r1, #0x27c
	cmp r2, r0
	ldreq r4, _0234D1F8 ; =0x000004CF
	beq _0234D1E0
	sub r0, r1, #0x99
	cmp r2, r0
	moveq r4, #0x4d0
	beq _0234D1E0
	cmp r2, #0x318
	ldreq r4, _0234D1FC ; =0x000004D1
	b _0234D1E0
_0234D0A0:
	cmp r0, #0xda
#ifdef JAPAN
	bne _0234E334
	ldr r0, _0234D204 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsFutureDungeon
	cmp r0, #0
	ldrne r0, _0234E48C ; =0x000004BC
	ldreq r0, _0234D200 ; =0x000004B3
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	b _0234D1E0
_0234E334:
#else
	ldreq r4, _0234D200 ; =0x000004B3
	beq _0234D1E0
#endif
	cmp r0, #0xed
	bne _0234D148
	ldr r0, _0234D204 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r1, [r0, #0x748]
	add r0, r1, #0x7b
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D208 ; =0x000004C4
	bls _0234D1E0
	cmp r1, #0x88
	ldreq r4, _0234D20C ; =0x000004C6
	beq _0234D1E0
	add r0, r1, #0x77
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D210 ; =0x000004C7
	bls _0234D1E0
	add r0, r1, #0x75
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D214 ; =0x000004C8
	bls _0234D1E0
	cmp r1, #0x8d
	ldreq r4, _0234D218 ; =0x000004C9
	beq _0234D1E0
	add r0, r1, #0x72
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D21C ; =0x000004CA
	bls _0234D1E0
	cmp r1, #0x91
	ldreq r4, _0234D220 ; =0x000004CB
	beq _0234D1E0
	add r0, r1, #0x6e
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D224 ; =0x000004CC
	b _0234D1E0
_0234D148:
	cmp r0, #0xe2
	bne _0234D170
	mov r0, #0x1a
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0234D170
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D170:
	ldr r1, _0234D228 ; =ov29_023537E8
	b _0234D1C4
_0234D178:
	ldrb r0, [r5, #0x48]
	cmp r0, r2
	bne _0234D1C0
	ldrsh r4, [r1, #2]
	ldr r0, _0234D22C ; =0x000004B8
	cmp r4, r0
	bne _0234D1A8
	ldrsh r0, [r5, #2]
	cmp r0, #0x1f8
	cmpne r0, #0x51
	ldreq r4, _0234D230 ; =0x000004D3
	beq _0234D1E0
_0234D1A8:
	cmp r4, #0
	bne _0234D1E0
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D1C0:
	add r1, r1, #4
_0234D1C4:
	ldrb r2, [r1]
	cmp r2, #0xff
	bne _0234D178
	b _0234D1E0
_0234D1D4:
	ldrsh r0, [r5, #4]
	bl sub_02025784
	mov r4, r0
_0234D1E0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234D1E8: .word 0x000004B1
_0234D1EC: .word 0x000004B2
_0234D1F0: .word 0x000001B2
_0234D1F4: .word 0x000004CD
_0234D1F8: .word 0x000004CF
_0234D1FC: .word 0x000004D1
#ifdef JAPAN
_0234D204: .word DUNGEON_PTR
_0234E48C: .word 0x000004BC
_0234D200: .word 0x000004B3
#else
_0234D200: .word 0x000004B3
_0234D204: .word DUNGEON_PTR
#endif
_0234D208: .word 0x000004C4
_0234D20C: .word 0x000004C6
_0234D210: .word 0x000004C7
_0234D214: .word 0x000004C8
_0234D218: .word 0x000004C9
_0234D21C: .word 0x000004CA
_0234D220: .word 0x000004CB
_0234D224: .word 0x000004CC
_0234D228: .word ov29_023537E8
_0234D22C: .word 0x000004B8
_0234D230: .word 0x000004D3
	arm_func_end GetPersonalityIndex

	arm_func_start ov29_0234D234
ov29_0234D234: ; 0x0234D234
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrb ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl ov29_0234D5D0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234D234

	arm_func_start DisplayMessage
DisplayMessage: ; 0x0234D258
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #0
	str r3, [sp, #4]
	bl DisplayMessageInternal
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage

	arm_func_start DisplayMessage2
DisplayMessage2: ; 0x0234D2AC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #1
	str r3, [sp, #4]
	mov r3, #0
	bl DisplayMessageInternal
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage2

	arm_func_start ov29_0234D304
ov29_0234D304: ; 0x0234D304
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	ldr r4, _0234D454 ; =ov29_02353563
	mov r8, r0
	ldrb r0, [r4]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r0, #0
	beq _0234D334
	mov r0, #0xa
	bl ov29_0234BA54
_0234D334:
	bl ov29_0234D558
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D41C
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D3F8
	ldr r4, [r8, #0xb4]
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	beq _0234D3BC
	bl GetRandomExplorerMazeMonster
	cmp r0, #0
	moveq r1, #0
	beq _0234D38C
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_0234D38C:
	cmp r1, #0
	moveq r0, #0
	streq r0, [sp, #8]
	beq _0234D3D0
	ldr r1, [r0, #0xb4]
	ldr r0, _0234D458 ; =ov29_02353368
	ldrb r1, [r1, #0xbc]
	sub r1, r1, #0xb
	orr r1, r1, #0x90000
	str r1, [sp, #8]
	bl Debug_Print0
	b _0234D3D0
_0234D3BC:
	bl ov29_02337EE8
	mov r1, r0
	ldr r0, _0234D45C ; =ov29_02353380
	str r1, [sp, #8]
	bl Debug_Print0
_0234D3D0:
	ldrsh r0, [r4, #4]
	str r0, [sp, #0xc]
	bl ov29_0233804C
	str r0, [sp, #0x18]
	mov r0, r8
	bl ov29_0231ADA8
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #0xc]
	orr r0, r0, #0x30000
	str r0, [sp, #0x54]
_0234D3F8:
	add r3, sp, #8
	str r3, [sp]
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	str r3, [sp, #4]
	bl ov29_0234D5D0
	b _0234D440
_0234D41C:
	bl ov29_0234B034
	str r0, [sp]
	mov r4, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0
	str r4, [sp, #4]
	bl ov29_0234D5D0
_0234D440:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234D454: .word ov29_02353563
_0234D458: .word ov29_02353368
_0234D45C: .word ov29_02353380
	arm_func_end ov29_0234D304
