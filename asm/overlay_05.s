	.include "asm/macros.inc"
	.include "overlay_05.inc"

	.text

	arm_func_start ov05_0233CA80
ov05_0233CA80: ; 0x0233CA80
	ldr ip, _0233CA90 ; =MemZero
	ldr r0, _0233CA94 ; =ov05_0233FCC0
	mov r1, #0xc
	bx ip
	.align 2, 0
_0233CA90: .word MemZero
_0233CA94: .word ov05_0233FCC0
	arm_func_end ov05_0233CA80

	arm_func_start ov05_0233CA98
ov05_0233CA98: ; 0x0233CA98
	ldr r1, _0233CAA4 ; =ov05_0233FCC0
	str r0, [r1]
	bx lr
	.align 2, 0
_0233CAA4: .word ov05_0233FCC0
	arm_func_end ov05_0233CA98

	arm_func_start ov05_0233CAA8
ov05_0233CAA8: ; 0x0233CAA8
	ldr r0, _0233CAB4 ; =ov05_0233FCC0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0233CAB4: .word ov05_0233FCC0
	arm_func_end ov05_0233CAA8

	arm_func_start ov05_0233CAB8
ov05_0233CAB8: ; 0x0233CAB8
	ldr r1, _0233CAC4 ; =ov05_0233FCC0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0233CAC4: .word ov05_0233FCC0
	arm_func_end ov05_0233CAB8

	arm_func_start ov05_0233CAC8
ov05_0233CAC8: ; 0x0233CAC8
	stmdb sp!, {r3, lr}
	ldrsb ip, [sp, #8]
	str ip, [sp]
	bl sub_02046A9C
	arm_func_end ov05_0233CAC8

	arm_func_start ov05_0233CAD8
ov05_0233CAD8: ; 0x0233CAD8
	ldmia sp!, {r3, pc}
	arm_func_end ov05_0233CAD8

	arm_func_start ov05_0233CADC
ov05_0233CADC: ; 0x0233CADC
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	mov ip, #0
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov05_0233CADC

	arm_func_start ov05_0233CB08
ov05_0233CB08: ; 0x0233CB08
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	arm_func_end ov05_0233CB08

	arm_func_start ov05_0233CB10
ov05_0233CB10: ; 0x0233CB10
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	ldr ip, [sp, #0x18]
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov05_0233CB10

	arm_func_start ov05_0233CB34
ov05_0233CB34: ; 0x0233CB34
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	arm_func_end ov05_0233CB34

	arm_func_start ov05_0233CB3C
ov05_0233CB3C: ; 0x0233CB3C
	mvn r1, #1
	cmp r0, r1
	moveq r0, #0xd
	ldmeqia sp!, {r3, pc}
	add r1, r1, #1
	cmp r0, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov05_0233CB3C

	arm_func_start ov05_02046BA0
ov05_02046BA0: ; 0x0233CB5C
	ldr ip, _0233CB64 ; =sub_02046BA0
	bx ip
	.align 2, 0
_0233CB64: .word sub_02046BA0
	arm_func_end ov05_02046BA0

	arm_func_start ov05_0233CB68
ov05_0233CB68: ; 0x0233CB68
	ldr ip, _0233CB74 ; =sub_02046BE8
	mov r2, #0
	bx ip
	.align 2, 0
_0233CB74: .word sub_02046BE8
	arm_func_end ov05_0233CB68

	arm_func_start ov05_02046BE8
ov05_02046BE8: ; 0x0233CB78
	ldr ip, _0233CB80 ; =sub_02046BE8
	bx ip
	.align 2, 0
_0233CB80: .word sub_02046BE8
	arm_func_end ov05_02046BE8

	arm_func_start ov05_0233CB84
ov05_0233CB84: ; 0x0233CB84
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xd
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov05_0233CB84

	arm_func_start ov05_0233CB9C
ov05_0233CB9C: ; 0x0233CB9C
	stmdb sp!, {r3, lr}
	mov r0, #0xb4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233CC08 ; =ov05_0233FCCC
	mov r1, #0xb4
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0233CC08 ; =ov05_0233FCCC
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #0xc
	str r3, [r2, #0xc]
	ldr r3, [r0, #4]
	add r2, r3, #0x10
	str r2, [r3, #0x74]
	ldr r0, [r0, #4]
	bl MemZero
	ldr r0, _0233CC08 ; =ov05_0233FCCC
	mov r1, #0
	str r1, [r0]
	bl sub_02046D20
	ldr r0, _0233CC0C ; =ov05_0233FCA0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CC08: .word ov05_0233FCCC
_0233CC0C: .word ov05_0233FCA0
	arm_func_end ov05_0233CB9C

	arm_func_start ov05_0233CC10
ov05_0233CC10: ; 0x0233CC10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18c
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D348 ; =0x00002001
	ldr r0, [r0, #4]
	ldr r2, [r0, #0xc]
	cmp r2, r1
	bgt _0233CC98
	bge _0233D10C
	sub r0, r1, #0x1000
	cmp r2, r0
	bgt _0233CC78
	bge _0233CF98
	cmp r2, #2
	bgt _0233CC6C
	cmp r2, #0
	blt _0233D338
	beq _0233CCE8
	cmp r2, #1
	beq _0233CDA0
	cmp r2, #2
	beq _0233CE2C
	b _0233D338
_0233CC6C:
	cmp r2, #0x1000
	beq _0233CE48
	b _0233D338
_0233CC78:
	ldr r0, _0233D34C ; =0x00001002
	cmp r2, r0
	bgt _0233CC8C
	beq _0233D018
	b _0233D338
_0233CC8C:
	cmp r2, #0x2000
	beq _0233D034
	b _0233D338
_0233CC98:
	add r0, r1, #0x1000
	cmp r2, r0
	bgt _0233CCC8
	bge _0233D220
	add r0, r1, #1
	cmp r2, r0
	bgt _0233CCBC
	beq _0233D18C
	b _0233D338
_0233CCBC:
	cmp r2, #0x3000
	beq _0233D20C
	b _0233D338
_0233CCC8:
	cmp r2, #0x4000
	bgt _0233CCD8
	beq _0233D2A4
	b _0233D338
_0233CCD8:
	add r0, r1, #0x2000
	cmp r2, r0
	beq _0233D2B8
	b _0233D338
_0233CCE8:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D338
	bl ov01_0232F3F4
	bl ov05_0233CA80
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #3
	ldr r0, [r0, #4]
	add r0, r0, #0x10
	bl MemZero
	bl sub_0204E210
	cmp r0, #0
	bne _0233CD3C
	bl GetAdventureLogDungeonFloor
	ldrb r0, [r0]
	cmp r0, #0xbe
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #3
	ldreq r0, [r0, #4]
	streqb r1, [r0, #0x11]
	beq _0233CD4C
_0233CD3C:
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x11]
_0233CD4C:
	mov r0, #0
	bl ov01_0233767C
	ldr r2, _0233D350 ; =ov05_0233FBD8
	ldr r1, _0233D344 ; =ov05_0233FCCC
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1, #4]
	ldr r3, _0233D354 ; =ov05_0233FBD4
	str r2, [r0, #0x14]
	mov r0, #0
	ldr r2, _0233D358 ; =0x000037E1
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1, #4]
	ldr r2, _0233D35C ; =0x00000233
	mov r1, r0
	add r3, r3, #0x14
	bl ov05_0233CADC
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
_0233CDA0:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0
	bl ov01_0233768C
	cmp r4, #1
	bne _0233CDE0
	mov r0, #0
	arm_func_end ov05_0233CC10

	arm_func_start ov05_0233CDC8
ov05_0233CDC8: ; 0x0233CDC8
	bl ov05_0233CA98
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0x1000
	ldr r0, [r0, #4]
	arm_func_end ov05_0233CDC8

	arm_func_start ov05_0233CDD8
ov05_0233CDD8: ; 0x0233CDD8
	str r1, [r0, #0xc]
	b _0233D338
_0233CDE0:
	cmp r4, #2
	arm_func_end ov05_0233CDD8

	arm_func_start ov05_0233CDE4
ov05_0233CDE4: ; 0x0233CDE4
	bne _0233CE10
	mov r0, #1
	bl ov05_0233CA98
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #0x2000
	strb r3, [r2, #0xb1]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CE10:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233D344 ; =ov05_0233FCCC
	movls r1, #2
	ldrls r0, [r0, #4]
	strls r1, [r0, #0xc]
	b _0233D338
_0233CE2C:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D338
	mov r0, #0x13
	bl ov01_023310B8
	mov r0, #3
	b _0233D33C
_0233CE48:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D338
	bl sub_0204E5E4
	cmp r0, #0
	bne _0233CE80
	ldr r1, _0233D360 ; =0x000037E3
	mov r0, #0x1c
	bl ov05_0233CB68
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D34C ; =0x00001002
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CE80:
	add r0, sp, #0x13c
	mov r7, #0
	bl InitPreprocessorArgs
	add r0, sp, #0xc
	bl sub_02057010
	mov r6, r0
	mov r5, r7
	add r4, sp, #0xc
	mov sb, #6
	mvn sl, #0
	b _0233CF20
_0233CEAC:
	mov r0, r5, lsl #1
	ldrsh r0, [r4, r0]
	bl GetTeamMember
	mov r8, r0
	ldrsh r0, [r8, #4]
	cmp r0, #0x218
	beq _0233CEE4
	ldrsh r0, [r8, #4]
	bl sub_02054F18
	cmp r0, #0
	ldrnesh r0, [r8, #4]
	movne r7, #1
	strne r0, [sp, #0x13c]
	bne _0233CF28
_0233CEE4:
	add r0, r8, #0x22
	bl GetFirstNotRealMoveInTimeDarkness
	cmp r0, sl
	beq _0233CF1C
	mla r1, r0, sb, r8
	ldrh r0, [r1, #0x24]
	cmp r0, #0x1d4
	bne _0233CF1C
	ldrsh r0, [r8, #4]
	mov r7, #2
	str r0, [sp, #0x13c]
	ldrh r0, [r1, #0x24]
	str r0, [sp, #0x14c]
	b _0233CF28
_0233CF1C:
	add r5, r5, #1
_0233CF20:
	cmp r5, r6
	blt _0233CEAC
_0233CF28:
	cmp r7, #0
	bne _0233CF64
	mov r0, #1
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233D364 ; =ov05_0233FB94
	ldr r3, _0233D368 ; =0x000037E2
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D36C ; =0x00001001
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CF64:
	cmp r7, #2
	ldreq r0, _0233D370 ; =0x000037E5
	add r2, sp, #0x13c
	ldrne r0, _0233D374 ; =0x000037E4
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x1c
	bl ov05_02046BE8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D34C ; =0x00001002
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CF98:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #1
	bl ov01_0233768C
	cmp r4, #3
	bne _0233CFD8
	mov r0, #0
	bl ov05_0233CAB8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0x3000
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CFD8:
	cmp r4, #4
	bne _0233CFFC
	mov r0, #1
	bl ov05_0233CAB8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0x4000
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233CFFC:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233D344 ; =ov05_0233FCCC
	movls r1, #0
	ldrls r0, [r0, #4]
	strls r1, [r0, #0xc]
	b _0233D338
_0233D018:
	bl ov05_0233CB84
	cmp r0, #0xd
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #0
	ldreq r0, [r0, #4]
	streq r1, [r0, #0xc]
	b _0233D338
_0233D034:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D338
	bl sub_02058FA4
	cmp r0, #0
	beq _0233D0D8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xb1]
	cmp r0, #0
	bne _0233D0D8
	add r0, sp, #0xec
	bl InitPreprocessorArgs
	add r0, sp, #0x14
	bl GetExplorerMazeTeamName
	add r2, sp, #0x14
	add r0, sp, #0x54
	mov r1, #0x98
	str r2, [sp, #0x124]
	bl MemZero
	mov r0, #3
	bl ov01_0233767C
	ldr r2, _0233D378 ; =ov05_0233FB68
	ldr r1, _0233D37C ; =ov05_0233FB64
	ldr r2, [r2, r0, lsl #3]
	ldr r0, _0233D380 ; =0x000037EC
	str r2, [sp, #0x54]
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0xec
	str r1, [sp, #8]
	mov r0, #0
	mov r1, #8
	mov r2, #0x33
	add r3, sp, #0x54
	bl ov05_0233CB08
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D384 ; =0x00002002
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233D0D8:
	mov r0, #2
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233D388 ; =ov05_0233FBB4
	ldr r3, _0233D38C ; =0x000037E9
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D348 ; =0x00002001
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233D10C:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #2
	bl ov01_0233768C
	cmp r4, #3
	bne _0233D14C
	mov r0, #0
	bl ov05_0233CAB8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0x3000
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233D14C:
	cmp r4, #4
	bne _0233D170
	mov r0, #1
	bl ov05_0233CAB8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r1, #0x4000
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233D170:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233D344 ; =ov05_0233FCCC
	movls r1, #0
	ldrls r0, [r0, #4]
	strls r1, [r0, #0xc]
	b _0233D338
_0233D18C:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #3
	bl ov01_0233768C
	cmp r4, #0xb
	bne _0233D1F0
	mov r0, #2
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233D388 ; =ov05_0233FBB4
	ldr r3, _0233D38C ; =0x000037E9
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233D344 ; =ov05_0233FCCC
	mov r3, #1
	ldr r2, [r0, #4]
	add r1, r3, #0x2000
	strb r3, [r2, #0xb1]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0233D338
_0233D1F0:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233D344 ; =ov05_0233FCCC
	movls r1, #0
	ldrls r0, [r0, #4]
	strls r1, [r0, #0xc]
	b _0233D338
_0233D20C:
	bl ov05_0233D3D0
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D390 ; =0x00003001
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
_0233D220:
	bl ov05_0233D450
	mov r4, r0
	bl sub_02003BFC
	cmp r4, #1
	bne _0233D270
	bl ov05_0233D424
	bl ov05_0233CAA8
	cmp r0, #1
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #0x2000
	ldreq r0, [r0, #4]
	streq r1, [r0, #0xc]
	beq _0233D338
	bl ov05_0233CAA8
	cmp r0, #0
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #0x1000
	ldreq r0, [r0, #4]
	streq r1, [r0, #0xc]
	b _0233D338
_0233D270:
	cmp r4, #3
	bne _0233D288
	bl ov05_0233D424
	bl sub_0204A018
	mov r0, #3
	b _0233D33C
_0233D288:
	cmp r4, #2
	bne _0233D338
	bl ov05_0233D424
	mov r0, #0x13
	bl ov01_023310B8
	mov r0, #3
	b _0233D33C
_0233D2A4:
	bl ov05_0233DB1C
	ldr r0, _0233D344 ; =ov05_0233FCCC
	ldr r1, _0233D394 ; =0x00004001
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
_0233D2B8:
	bl sub_02003BFC
	bl ov05_0233DBDC
	cmp r0, #1
	bne _0233D304
	bl ov05_0233DBA0
	bl ov05_0233CAA8
	cmp r0, #1
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #0x2000
	ldreq r0, [r0, #4]
	streq r1, [r0, #0xc]
	beq _0233D338
	bl ov05_0233CAA8
	cmp r0, #0
	ldreq r0, _0233D344 ; =ov05_0233FCCC
	moveq r1, #0x1000
	ldreq r0, [r0, #4]
	streq r1, [r0, #0xc]
	b _0233D338
_0233D304:
	cmp r0, #3
	bne _0233D31C
	bl ov05_0233DBA0
	bl sub_0204A018
	mov r0, #3
	b _0233D33C
_0233D31C:
	cmp r0, #2
	bne _0233D338
	bl ov05_0233DBA0
	mov r0, #0x13
	bl ov01_023310B8
	mov r0, #3
	b _0233D33C
_0233D338:
	mov r0, #1
_0233D33C:
	add sp, sp, #0x18c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV05_0233CDE4_OFFSET 2
#elif defined(JAPAN)
#define OV05_0233CDE4_OFFSET 0x164
#else
#define OV05_0233CDE4_OFFSET 0
#endif
_0233D344: .word ov05_0233FCCC
_0233D348: .word 0x00002001
_0233D34C: .word 0x00001002
_0233D350: .word ov05_0233FBD8
_0233D354: .word ov05_0233FBD4
_0233D358: .word 0x000037E1 + OV05_0233CDE4_OFFSET
_0233D35C: .word 0x00000233
_0233D360: .word 0x000037E3 + OV05_0233CDE4_OFFSET
_0233D364: .word ov05_0233FB94
_0233D368: .word 0x000037E2 + OV05_0233CDE4_OFFSET
_0233D36C: .word 0x00001001
_0233D370: .word 0x000037E5 + OV05_0233CDE4_OFFSET
_0233D374: .word 0x000037E4 + OV05_0233CDE4_OFFSET
_0233D378: .word ov05_0233FB68
_0233D37C: .word ov05_0233FB64
_0233D380: .word 0x000037EC + OV05_0233CDE4_OFFSET
_0233D384: .word 0x00002002
_0233D388: .word ov05_0233FBB4
_0233D38C: .word 0x000037E9 + OV05_0233CDE4_OFFSET
_0233D390: .word 0x00003001
_0233D394: .word 0x00004001
	arm_func_end ov05_0233CDE4

	arm_func_start ov05_0233D398
ov05_0233D398: ; 0x0233D398
	stmdb sp!, {r3, lr}
	ldr r0, _0233D3CC ; =ov05_0233FCCC
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02046D20
	ldr r0, _0233D3CC ; =ov05_0233FCCC
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0233D3CC ; =ov05_0233FCCC
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D3CC: .word ov05_0233FCCC
	arm_func_end ov05_0233D398

	arm_func_start ov05_0233D3D0
ov05_0233D3D0: ; 0x0233D3D0
	stmdb sp!, {r3, lr}
	mov r0, #0x1dc
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233D420 ; =ov05_0233FCA4
	mov r1, #0x1dc
	str r0, [r2]
	bl MemZero
	ldr r0, _0233D420 ; =ov05_0233FCA4
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #2
	str r3, [r1]
	ldr r1, [r0]
	strb r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x33
	bic r0, r0, #0x1f
	str r0, [r1, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D420: .word ov05_0233FCA4
	arm_func_end ov05_0233D3D0

	arm_func_start ov05_0233D424
ov05_0233D424: ; 0x0233D424
	stmdb sp!, {r3, lr}
	ldr r0, _0233D44C ; =ov05_0233FCA4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233D44C ; =ov05_0233FCA4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D44C: .word ov05_0233FCA4
	arm_func_end ov05_0233D424

	arm_func_start ov05_0233D450
ov05_0233D450: ; 0x0233D450
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x17c
	ldr r0, _0233D9FC ; =ov05_0233FCA4
	ldr r4, [r0]
	ldr r2, [r4]
	cmp r2, #0x4000
	bgt _0233D4A4
	bge _0233D884
	cmp r2, #0
	bgt _0233D480
	beq _0233D4E8
	b _0233D9F0
_0233D480:
	ldr r0, _0233DA00 ; =0x00001001
	cmp r2, r0
	bgt _0233D9F0
	cmp r2, #0x1000
	blt _0233D9F0
	beq _0233D688
	cmp r2, r0
	beq _0233D730
	b _0233D9F0
_0233D4A4:
	cmp r2, #0x5000
	bgt _0233D4B4
	beq _0233D898
	b _0233D9F0
_0233D4B4:
	ldr r1, _0233DA04 ; =0x00005005
	cmp r2, r1
	bgt _0233D9F0
	sub r0, r1, #2
	cmp r2, r0
	blt _0233D9F0
	beq _0233D8AC
	sub r0, r1, #1
	cmp r2, r0
	beq _0233D8C0
	cmp r2, r1
	beq _0233D9E0
	b _0233D9F0
_0233D4E8:
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233D56C
	ldr r0, _0233D9FC ; =ov05_0233FCA4
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strne r0, [r1, #4]
	add r0, r4, #0x54
	mov r1, #0x150
	bl MemZero
	add r0, r4, #0x1bc
	mov r1, #0x18
	bl MemZero
	mov r0, #0x18
	str r0, [r4, #0x1a4]
	add r0, r4, #0x1bc
	str r0, [r4, #0x1a8]
	mov r0, #0x150
	str r0, [r4, #0x1ac]
	add r0, r4, #0x54
	str r0, [r4, #0x1b0]
	mov r1, #0
	strb r1, [r4, #0x1b8]
	ldr r0, _0233DA08 ; =ov05_0233DA2C
	mov r1, #1
	str r0, [r4, #0x1b4]
	add r0, r4, #0x1c0
	strb r1, [r4, #0x1d4]
	bl GetMainTeamNameWithCheck
	mov r0, #0x1000
	str r0, [r4]
	b _0233D9F0
_0233D56C:
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233D9F0
	ldr r0, _0233D9FC ; =ov05_0233FCA4
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #4]
	add r0, r4, #0x54
	mov r1, #0x150
	bl MemZero
	add r0, r4, #0x1bc
	mov r1, #0x18
	bl MemZero
	mov r0, #0x150
	str r0, [r4, #0x1a4]
	add r0, r4, #0x54
	str r0, [r4, #0x1a8]
	mov r0, #0x18
	str r0, [r4, #0x1ac]
	add r0, r4, #0x1bc
	str r0, [r4, #0x1b0]
	mov r1, #0
	ldr r0, _0233DA0C ; =ov01_02337B68
	strb r1, [r4, #0x1b8]
	str r0, [r4, #0x1b4]
	add r0, r4, #0x5a
	strb r1, [r4, #0x1d4]
	bl GetMainTeamNameWithCheck
	add r0, sp, #0
	mov r1, #0
	bl sub_02057030
	mov sb, r0
	mov r8, #0
	add r6, r4, #0x70
	mov r5, #0xf8
	add r7, sp, #0
	mov fp, #0x4c
	b _0233D63C
_0233D608:
	mul sl, r8, fp
	mov r0, r8, lsl #1
	ldrsh r0, [r7, r0]
	bl GetTeamMember
	mov r1, r0
	add r0, r6, sl
	bl sub_02055E14
	add sl, r4, sl
	ldrb r0, [sl, #0x75]
	bl sub_02051798
	cmp r0, #0xff
	streqb r5, [sl, #0x75]
	add r8, r8, #1
_0233D63C:
	cmp r8, sb
	blt _0233D608
	mov r3, sb
	mov r2, #0
	mov r0, #0x4c
	b _0233D660
_0233D654:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x78]
	add r3, r3, #1
_0233D660:
	cmp r3, #4
	blt _0233D654
	bl GetLanguageType
	strb r0, [r4, #0x58]
	bl sub_02050CD0
	strb r0, [r4, #0x59]
	str sb, [r4, #0x1a0]
	mov r0, #0x1000
	str r0, [r4]
	b _0233D9F0
_0233D688:
	ldr r1, [r4, #0x10]
	mov r0, #6
	strb r0, [r1]
	mov r0, #0
	strb r0, [r1, #1]
	mov r0, #0x10
	strb r0, [r4, #0x54]
	mov r0, #0x11
	strb r0, [r4, #0x1bc]
	add r5, r4, #0x1bc
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r2, [r5, #2]
	add r0, r4, #0x58
	mov r1, #0x14c
	strb r2, [r4, #0x56]
	bl ov01_02337B3C
	strb r0, [r4, #0x57]
	add r0, r5, #4
	mov r1, #0x14
	bl ov01_02337B3C
	strb r0, [r5, #3]
	add r0, r4, #0x1a4
	mov r1, #1
	str r0, [sp, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #4]
	add r0, sp, #8
	str r1, [sp, #0x18]
	ldrb r3, [r4, #0x1d4]
	mov r2, #0x20
	mov r1, #0
	strb r3, [sp, #0x1c]
	ldr r3, [r4, #0x10]
	str r3, [sp, #0x20]
	strh r2, [sp, #0x24]
	strb r1, [sp, #0x26]
	str r1, [sp, #0x28]
	bl ov01_02337BA0
	ldr r0, _0233DA00 ; =0x00001001
	str r0, [r4]
	b _0233D9F0
_0233D730:
	bl ov01_02337E0C
	movs r6, r0
	beq _0233D9F0
	add r0, sp, #0x2c
	add r5, r4, #0x54
	add r7, r4, #0x1bc
	bl InitPreprocessorArgs
	bl ov01_02337C54
	cmp r6, #0xe
	addls pc, pc, r6, lsl #2
	b _0233D9F0
_0233D75C: ; jump table
	b _0233D9F0 ; case 0
	b _0233D87C ; case 1
	b _0233D9F0 ; case 2
	b _0233D9F0 ; case 3
	b _0233D798 ; case 4
	b _0233D87C ; case 5
	b _0233D87C ; case 6
	b _0233D87C ; case 7
	b _0233D87C ; case 8
	b _0233D87C ; case 9
	b _0233D87C ; case 10
	b _0233D87C ; case 11
	b _0233D87C ; case 12
	b _0233D87C ; case 13
	b _0233D87C ; case 14
_0233D798:
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233D7F4
	bl GetLanguageType
	ldrsb r1, [r7, #2]
	cmp r1, r0
	add r0, sp, #0x7c
	bne _0233D7C8
	add r1, r7, #4
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233D7D0
_0233D7C8:
	ldr r1, _0233DA10 ; =0x000038C9
	bl GetStringFromFileVeneer
_0233D7D0:
	ldr r1, _0233DA14 ; =0x000037ED
	add r3, sp, #0x7c
	add r2, sp, #0x2c
	mov r0, #0x1c
	str r3, [sp, #0x64]
	bl ov05_02046BE8
	mov r0, #0x4000
	str r0, [r4]
	b _0233D9F0
_0233D7F4:
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233D9F0
	bl GetLanguageType
	ldrsb r1, [r5, #2]
	cmp r1, r0
	add r0, sp, #0x7c
	bne _0233D824
	add r1, r5, #6
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233D82C
_0233D824:
	ldr r1, _0233DA10 ; =0x000038C9
	bl GetStringFromFileVeneer
_0233D82C:
	add r0, sp, #0x7c
	str r0, [sp, #0x64]
	mov r3, #0
	mov r0, #0x4c
_0233D83C:
	mla r2, r3, r0, r5
	ldrh r1, [r2, #0x1c]
	add r3, r3, #1
	cmp r3, #4
	and r1, r1, #1
	strh r1, [r2, #0x1c]
	blt _0233D83C
	add r0, r5, #4
	bl sub_02058FCC
	ldr r1, _0233DA18 ; =0x000037EE
	add r2, sp, #0x2c
	mov r0, #0x1c
	bl ov05_02046BE8
	mov r0, #0x5000
	str r0, [r4]
	b _0233D9F0
_0233D87C:
	mov r0, #1
	b _0233D9F4
_0233D884:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233D9F0
	mov r0, #2
	b _0233D9F4
_0233D898:
	bl ov05_0233CB84
	cmp r0, #0xd
	ldreq r0, _0233DA1C ; =0x00005004
	streq r0, [r4]
	b _0233D9F0
_0233D8AC:
	mov r0, #0
	str r0, [r4, #0x1d8]
	sub r0, r1, #1
	str r0, [r4]
	b _0233D9F0
_0233D8C0:
	ldr r0, [r4, #0x1d8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0233D9A0
_0233D8D0: ; jump table
	b _0233D8E4 ; case 0
	b _0233D8F8 ; case 1
	b _0233D924 ; case 2
	b _0233D97C ; case 3
	b _0233D990 ; case 4
_0233D8E4:
	ldr r1, _0233DA20 ; =0x0000023B
	mov r0, #0
	bl ov05_0233CB68
	mov r0, #1
	str r0, [r4, #0x1d8]
_0233D8F8:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233D9A0
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	mov r0, #2
	str r0, [r4, #0x1d8]
	bl sub_02003B94
	b _0233D9A0
_0233D924:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r5, #0
	bne _0233D958
#ifdef JAPAN
	ldr r1, _0233F2A4 ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov05_0233CB68
	mov r0, #3
	str r0, [r4, #0x1d8]
	b _0233D9A0
_0233D958:
	cmp r5, #1
	moveq r0, #3
	beq _0233D9A4
	ldr r1, _0233DA24 ; =0x00000239
	mov r0, #0x1c
	bl ov05_0233CB68
	mov r0, #4
	str r0, [r4, #0x1d8]
	b _0233D9A0
_0233D97C:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233D9A0
	mov r0, #1
	b _0233D9A4
_0233D990:
	bl ov05_0233CB84
	cmp r0, #0xd
	moveq r0, #2
	beq _0233D9A4
_0233D9A0:
	mov r0, #0
_0233D9A4:
	cmp r0, #1
	bne _0233D9C4
	ldr r1, _0233DA28 ; =0x000037EF
	mov r0, #0x1c
	bl ov05_0233CB68
	ldr r0, _0233DA04 ; =0x00005005
	str r0, [r4]
	b _0233D9F0
_0233D9C4:
	cmp r0, #3
	moveq r0, #3
	beq _0233D9F4
	cmp r0, #2
	bne _0233D9F0
	mov r0, #2
	b _0233D9F4
_0233D9E0:
	bl ov05_0233CB84
	cmp r0, #0xd
	moveq r0, #2
	beq _0233D9F4
_0233D9F0:
	mov r0, #0
_0233D9F4:
	add sp, sp, #0x17c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV05_0233D450_OFFSET 2
#elif defined(JAPAN)
#define OV05_0233D450_OFFSET 0x164
#else
#define OV05_0233D450_OFFSET 0
#endif
_0233D9FC: .word ov05_0233FCA4
_0233DA00: .word 0x00001001
_0233DA04: .word 0x00005005
_0233DA08: .word ov05_0233DA2C
_0233DA0C: .word ov01_02337B68
#ifdef JAPAN
_0233DA10: .word 0x00003507
#else
_0233DA10: .word 0x000038C9 + OV05_0233D450_OFFSET
#endif
_0233DA14: .word 0x000037ED + OV05_0233D450_OFFSET
_0233DA18: .word 0x000037EE + OV05_0233D450_OFFSET
_0233DA1C: .word 0x00005004
#ifdef JAPAN
_0233DA20: .word 0x000004CC
_0233F2A4: .word 0x000004CD
_0233DA24: .word 0x000004CA
#else
_0233DA20: .word 0x0000023B
_0233DA24: .word 0x00000239
#endif
_0233DA28: .word 0x000037EF + OV05_0233D450_OFFSET
	arm_func_end ov05_0233D450

	arm_func_start ov05_0233DA2C
ov05_0233DA2C: ; 0x0233DA2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	add r5, r8, #4
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233DB14
	mov r0, r5
	mov r1, #0x14c
	bl ov01_02337B3C
	ldrb r1, [r8, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!,  {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r0, [r8]
	cmp r0, #0x10
	movne r0, #2
	ldmneia sp!,  {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r8, #0x14c]
	cmp r0, #0
	beq _0233DA84
	cmp r0, #4
	bls _0233DA8C
_0233DA84:
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0233DA8C:
	mov r6, #0
	add r4, r5, #0x42
	mov sb, #0x4c
	b _0233DB00
_0233DA9C:
	mul sl, r6, sb
	add r7, r5, sl
	ldrsh r0, [r7, #0x20]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	bne _0233DAF4
	ldrsh r0, [r7, #0x20]
	bl sub_02054F18
	cmp r0, #0
	bne _0233DAF4
	add r0, r4, sl
	bl IsMovesetValid
	cmp r0, #0
	beq _0233DAF4
	ldrb r0, [r7, #0x1c]
	cmp r0, #1
	blo _0233DAF4
	cmp r0, #0x64
	bhi _0233DAF4
	ldrb r0, [r7, #0x3c]
	cmp r0, #0xb
	blo _0233DAFC
_0233DAF4:
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0233DAFC:
	add r6, r6, #1
_0233DB00:
	ldr r0, [r8, #0x14c]
	cmp r6, r0
	blo _0233DA9C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0233DB14:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov05_0233DA2C

	arm_func_start ov05_0233DB1C
ov05_0233DB1C: ; 0x0233DB1C
	stmdb sp!, {r3, lr}
	ldr r0, _0233DB98 ; =0x0000188C
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233DB9C ; =ov05_0233FCA8
	ldr r1, _0233DB98 ; =0x0000188C
	str r0, [r2]
	bl MemZero
	mov r0, #0
	ldr r2, _0233DB9C ; =ov05_0233FCA8
	sub ip, r0, #2
	ldr r1, [r2]
	sub r3, r0, #1
	str r0, [r1]
	ldr lr, [r2]
	add r1, lr, #0xc1
	bic r1, r1, #0x1f
	str r1, [lr, #0x2c4]
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb ip, [r1, #0x7dc]
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r3, [r1, #0x7d8]
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x880]
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x888]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233DB98: .word 0x0000188C
_0233DB9C: .word ov05_0233FCA8
	arm_func_end ov05_0233DB1C

	arm_func_start ov05_0233DBA0
ov05_0233DBA0: ; 0x0233DBA0
	stmdb sp!, {r3, lr}
	ldr r0, _0233DBD8 ; =ov05_0233FCA8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov00_022BCBAC
	ldr r0, _0233DBD8 ; =ov05_0233FCA8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233DBD8 ; =ov05_0233FCA8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233DBD8: .word ov05_0233FCA8
	arm_func_end ov05_0233DBA0

	arm_func_start ov05_0233DBDC
ov05_0233DBDC: ; 0x0233DBDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x348
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r0, _0233EB04 ; =0x00003023
	ldr r4, [r1]
	ldr r1, [r4]
	cmp r1, r0
	bgt _0233DD20
	bge _0233E888
	ldr r2, _0233EB08 ; =0x00002001
	cmp r1, r2
	bgt _0233DC74
	bge _0233E2E4
	sub r0, r2, #0x1000
	cmp r1, r0
	bgt _0233DC54
	bge _0233E18C
	cmp r1, #2
	bgt _0233DC48
	cmp r1, #0
	blt _0233F854
	beq _0233DE0C
	cmp r1, #1
	beq _0233DE44
	cmp r1, #2
	beq _0233DE60
	b _0233F854
_0233DC48:
	cmp r1, #0x1000
	beq _0233E09C
	b _0233F854
_0233DC54:
	ldr r0, _0233EB0C ; =0x00001002
	cmp r1, r0
	bgt _0233DC68
	beq _0233E1C0
	b _0233F854
_0233DC68:
	cmp r1, #0x2000
	beq _0233E218
	b _0233F854
_0233DC74:
	sub r2, r0, #0x12
	cmp r1, r2
	bgt _0233DCF0
	sub r0, r0, #0x21
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _0233DCD0
_0233DC90: ; jump table
	b _0233E424 ; case 0
	b _0233E4EC ; case 1
	b _0233E64C ; case 2
	b _0233F854 ; case 3
	b _0233F13C ; case 4
	b _0233F248 ; case 5
	b _0233F854 ; case 6
	b _0233F854 ; case 7
	b _0233F854 ; case 8
	b _0233F854 ; case 9
	b _0233F854 ; case 10
	b _0233F854 ; case 11
	b _0233F854 ; case 12
	b _0233F224 ; case 13
	b _0233EEB8 ; case 14
	b _0233EFC0 ; case 15
_0233DCD0:
	cmp r1, #0x3000
	bgt _0233DCE0
	beq _0233E364
	b _0233F854
_0233DCE0:
	ldr r0, _0233EB10 ; =0x00003001
	cmp r1, r0
	beq _0233E37C
	b _0233F854
_0233DCF0:
	sub r2, r0, #2
	cmp r1, r2
	bgt _0233DD10
	bge _0233E7A4
	sub r0, r0, #3
	cmp r1, r0
	beq _0233E6B8
	b _0233F854
_0233DD10:
	sub r0, r0, #1
	cmp r1, r0
	beq _0233E7F4
	b _0233F854
_0233DD20:
	ldr r3, _0233EB14 ; =0x00004002
	cmp r1, r3
	bgt _0233DDB4
	bge _0233F4A4
	add r2, r0, #5
	cmp r1, r2
	bgt _0233DD94
	add r2, r0, #3
	cmp r1, r2
	blt _0233DD68
	beq _0233EBB4
	add r2, r0, #4
	cmp r1, r2
	beq _0233ED24
	add r0, r0, #5
	cmp r1, r0
	beq _0233EE0C
	b _0233F854
_0233DD68:
	add r2, r0, #1
	cmp r1, r2
	bgt _0233DD84
	add r0, r0, #1
	cmp r1, r0
	beq _0233E9A4
	b _0233F854
_0233DD84:
	add r0, r0, #2
	cmp r1, r0
	beq _0233EA78
	b _0233F854
_0233DD94:
	cmp r1, #0x4000
	bgt _0233DDA4
	beq _0233F40C
	b _0233F854
_0233DDA4:
	sub r0, r3, #1
	cmp r1, r0
	beq _0233F440
	b _0233F854
_0233DDB4:
	cmp r1, #0x9000
	bgt _0233DDE0
	bge _0233F760
	cmp r1, #0x8000
	bgt _0233DDD0
	beq _0233F508
	b _0233F854
_0233DDD0:
	add r0, r3, #0x4000
	cmp r1, r0
	beq _0233F534
	b _0233F854
_0233DDE0:
	ldr r0, _0233EB18 ; =0x00009011
	cmp r1, r0
	bgt _0233DE00
	bge _0233F7E8
	sub r0, r0, #1
	cmp r1, r0
	beq _0233F7D4
	b _0233F854
_0233DE00:
	cmp r1, #0xf000
	beq _0233F74C
	b _0233F854
_0233DE0C:
	bl sub_0204A1CC
	bl ov00_022BCA80
	cmp r0, #3
	ldrne r0, _0233EB00 ; =ov05_0233FCA8
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0233F854
	bl ov01_02339888
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233DE44:
	bl ov01_023398A4
	cmp r0, #0
	ldrne r0, _0233EB00 ; =ov05_0233FCA8
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0]
	b _0233F854
_0233DE60:
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233DEF0
	bl ov05_0233F93C
	bl ov00_022BD338
	cmp r0, #0
	beq _0233DE88
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233DE98
_0233DE88:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x9c]
_0233DE98:
	mov r0, #4
	bl ov01_0233767C
	ldr r2, _0233EB1C ; =ov05_0233FC18
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233EB20 ; =ov05_0233FC14
	str r2, [r0, #4]
	mov r0, #0
	ldr r2, _0233EB24 ; =0x000037F0
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233EB28 ; =0x00000233
	mov r1, r0
	add r3, r3, #4
	bl ov05_0233CADC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233DEF0:
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233F854
	bl ov00_022BCCF4
	cmp r0, #0
	beq _0233E018
	bl sub_020590C0
	cmp r1, #0
	cmpeq r0, #2
	bls _0233E018
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x880]
	cmp r0, #0
	bne _0233E018
	bl sub_020590C0
	mov r4, r0
	add r0, sp, #0x2f8
	mov r5, r1
	bl InitPreprocessorArgs
	bl ov05_0233F93C
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0xc
	ldr r2, [r1]
	mov r0, r4
	str r3, [r2, #4]
	ldr r2, _0233EB2C ; =0x00002710
	mov r1, r5
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x324]
	ldr r2, _0233EB2C ; =0x00002710
	mov r0, r4
	mov r1, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233EB2C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x320]
	ldr r2, _0233EB30 ; =0x05F5E100
	mov r1, r5
	mov r0, r4
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233EB2C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x31c]
	mov r0, #5
	bl ov01_0233767C
	ldr r2, _0233EB34 ; =ov05_0233FB80
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r3, [r2, r0, lsl #3]
	ldr r2, [r1]
	ldr r0, _0233EB38 ; =ov05_0233FB7C
	str r3, [r2, #4]
	str r0, [sp]
	ldr r2, _0233EB3C ; =0x00003801
	add r0, sp, #0x2f8
	str r2, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [r1]
	mov r0, #0
	add r3, r1, #4
	mov r1, r0
	mov r2, #0x33
	bl ov05_0233CB08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E018:
	bl ov05_0233F93C
	bl ov00_022BD338
	cmp r0, #0
	beq _0233E034
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233E044
_0233E034:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x9c]
_0233E044:
	mov r0, #6
	bl ov01_0233767C
	ldr r2, _0233EB40 ; =ov05_0233FBF8
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233EB44 ; =ov05_0233FBF4
	str r2, [r0, #4]
	mov r0, #0
	ldr r2, _0233EB48 ; =0x00003802
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233EB28 ; =0x00000233
	mov r1, r0
	add r3, r3, #4
	bl ov05_0233CADC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB08 ; =0x00002001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E09C:
	add r0, r4, #0x1000
	mov r1, #0
	str r1, [r0, #0x888]
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #4
	bl ov01_0233768C
	cmp r4, #6
	bne _0233E0EC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x3000
	str r3, [r2, #0x2cc]
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E0EC:
	cmp r4, #7
	bne _0233E114
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #1
	ldr r2, [r0]
	mov r1, #0x3000
	str r3, [r2, #0x2cc]
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E114:
	cmp r4, #8
	bne _0233E13C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0x3000
	str r3, [r2, #0x2cc]
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E13C:
	cmp r4, #9
	bne _0233E178
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mvn r3, #0
	ldr r2, [r0]
	ldr r1, _0233EB4C ; =0xD4A51000
	str r3, [r2, #0x2cc]
	ldr r2, [r0]
	mov r0, #0xe8
	str r1, [r2, #0x2d0]
	str r0, [r2, #0x2d4]
	rsb r0, r3, #0x1000
	str r0, [r2]
	bl sub_02046D20
	b _0233F854
_0233E178:
	sub r0, r4, #0xc
	cmp r0, #1
	bhi _0233F854
	mov r0, #1
	b _0233F858
_0233E18C:
	ldr r1, [r4, #0x2d0]
	ldr r2, [r4, #0x2d4]
	mov r0, #2
	bl ov01_0233580C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r3, _0233EB0C ; =0x00001002
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2]
	ldr r0, [r0]
	add r0, r0, #0x1000
	str r1, [r0, #0x888]
	b _0233F854
_0233E1C0:
	bl ov01_02336014
	cmp r0, #2
	bne _0233E1F8
	bl ov01_023370AC
	ldr r2, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r2]
	str r0, [r2, #0x2d0]
	str r1, [r2, #0x2d4]
	bl ov01_02335FA8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E1F8:
	cmp r0, #1
	bne _0233F854
	bl ov01_02335FA8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E218:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #5
	bl ov01_0233768C
	cmp r4, #0xb
	bne _0233E2D0
	bl ov05_0233F93C
	bl ov00_022BD338
	cmp r0, #0
	beq _0233E258
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233E268
_0233E258:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x9c]
_0233E268:
	mov r0, #6
	bl ov01_0233767C
	ldr r2, _0233EB40 ; =ov05_0233FBF8
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233EB44 ; =ov05_0233FBF4
	str r2, [r0, #4]
	mov r0, #0
	ldr r2, _0233EB48 ; =0x00003802
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233EB28 ; =0x00000233
	mov r1, r0
	add r3, r3, #4
	bl ov05_0233CADC
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r3, #1
	ldr r0, [r1]
	add r2, r3, #0x2000
	add r0, r0, #0x1000
	strb r3, [r0, #0x880]
	ldr r0, [r1]
	str r2, [r0]
	b _0233F854
_0233E2D0:
	sub r0, r4, #0xc
	cmp r0, #1
	bhi _0233F854
	mov r0, #1
	b _0233F858
_0233E2E4:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #6
	bl ov01_0233768C
	cmp r4, #6
	bne _0233E328
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #1
	ldr r2, [r0]
	mov r1, #0x3000
	strb r3, [r2, #0x2c8]
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E328:
	cmp r4, #0xa
	bne _0233E350
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x3000
	strb r3, [r2, #0x2c8]
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E350:
	sub r0, r4, #0xc
	cmp r0, #1
	bhi _0233F854
	mov r0, #1
	b _0233F858
_0233E364:
	bl ov01_02338A24
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB10 ; =0x00003001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E37C:
	bl ov01_02338EC4
	cmp r0, #1
	beq _0233E3F4
	cmp r0, #4
	beq _0233E39C
	cmp r0, #8
	beq _0233E40C
	b _0233F854
_0233E39C:
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233E3C8
	ldr r1, _0233EB50 ; =0x000037F6
	mov r0, #0
	bl ov05_0233CB68
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB54 ; =0x00003002
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E3C8:
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233F854
	ldr r1, _0233EB58 ; =0x00003806
	mov r0, #0
	bl ov05_0233CB68
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB54 ; =0x00003002
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E3F4:
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E40C:
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E424:
	bl ov05_0233CB84
	mov r4, r0
	bl ov01_02338EC4
	cmp r0, #5
	bne _0233E454
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E454:
	cmp r4, #0xd
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	ldrb r0, [r0, #0x2c8]
	cmp r0, #0
	beq _0233E4A8
	bl ov00_022BD338
	cmp r0, #0
	beq _0233E488
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233E4A8
_0233E488:
	mov r0, #0x14
	mov r1, #6
	bl ov01_023398B0
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E4A8:
	bl sub_0205BD78
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r2, r0
	ldr r0, [r1]
	mov r1, #1
	ldr r0, [r0, #0x2c4]
	bl ov01_0232C5C8
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB60 ; =0x00003003
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E4EC:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233E628
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233E568
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	ldrb r1, [r0, #0x2c8]
	ldr r0, [r0, #0x2c4]
	bl ov01_0232DA1C
	cmp r0, #0
	beq _0233E548
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #9
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB64 ; =0x00003004
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E548:
	mov r0, #2
	mov r1, #6
	bl ov01_023398B0
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E568:
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r0]
	ldr r3, [r2, #0x2cc]
	cmp r3, #0
	bge _0233E5C0
	ldr r0, [r2, #0x2c4]
	ldr r1, [r2, #0x2d0]
	ldr r2, [r2, #0x2d4]
	bl ov01_0232DE74
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #0xb
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB68 ; =0x00003010
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E5C0:
	cmp r3, #2
	movne r1, #0
	movne r2, #8
	bne _0233E5E0
	bl sub_02050CD0
	mov r2, r0
	mov r1, r2
	mov r3, #1
_0233E5E0:
	mov r0, #0x10
	str r0, [sp]
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	str r3, [sp, #4]
	ldr r0, [r0]
	mov r3, #0
	ldr r0, [r0, #0x2c4]
	bl ov01_0232DBAC
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #0xa
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB6C ; =0x00003020
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E628:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E64C:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233E694
	mov r0, #0
	bl ov01_02338E1C
	bl ov01_0232DB94
	ldr r2, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r2]
	str r0, [r2, #0x2d0]
	str r1, [r2, #0x2d4]
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E694:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E6B8:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233E780
	mov r0, #0
	bl ov01_02338E1C
	mov r4, r0
	bl ov01_0232DCCC
	ldr r2, _0233EB00 ; =ov05_0233FCA8
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x7d4]
	ldr r2, [r2]
	add r0, r2, #0x1000
	ldr r0, [r0, #0x7d4]
	cmp r0, #0
	bne _0233E718
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E718:
	add r1, r2, #0x350
	mov r0, r4
	add r2, r2, #0x2d0
	mov r3, #0x10
	bl ov01_0232DD00
	add r0, sp, #0x2a8
	bl InitPreprocessorArgs
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB74 ; =ov05_0233FC44
	ldr r2, [r0]
	add r0, sp, #0x1a8
	ldr r2, [r2, #0x2cc]
	mov r2, r2, lsl #1
	ldrh r1, [r1, r2]
	bl GetStringFromFileVeneer
	add r3, sp, #0x1a8
	ldr r1, _0233EB78 ; =0x000037F9
	add r2, sp, #0x2a8
	mov r0, #0x1c
	str r3, [sp, #0x2e0]
	bl ov05_02046BE8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB7C ; =0x00003021
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E780:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E7A4:
	bl ov01_02338EC4
	mov r4, r0
	bl ov05_0233CB84
	cmp r4, #5
	bne _0233E7D4
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E7D4:
	cmp r0, #0xd
	bne _0233F854
	bl sub_02046D20
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB80 ; =0x00003022
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E7F4:
	add r0, r4, #0x1700
	ldrsb r0, [r0, #0xdc]
	mvn r1, #1
	cmp r0, r1
	bne _0233E874
	add r0, r4, #0x1000
	ldr r0, [r0, #0x7d8]
	add r1, r4, #0x1000
	cmp r0, #0
	movlt r0, #0
	str r0, [r1, #0x7e0]
	mov r3, #0x10
	ldr r2, _0233EB84 ; =0x000037FA
	str r3, [r1, #0x7ec]
	add r0, r4, #0x1700
	strh r2, [r0, #0xe8]
	str r3, [r1, #0x7ec]
	mov r0, #0xd
	str r0, [r1, #0x7e4]
	ldr r5, [r1, #0x7d4]
	add r2, r4, #0x7e0
	str r5, [sp]
	mov r5, #8
	ldr r0, _0233EB88 ; =ov05_0233FC4C
	ldr r1, _0233EB8C ; =0x00441C33
	ldr r3, _0233EB90 ; =ov05_0233F9C4
	add r2, r2, #0x1000
	str r5, [sp, #4]
	bl CreateAdvancedMenu
	add r1, r4, #0x1000
	strb r0, [r1, #0x7dc]
	b _0233E878
_0233E874:
	bl ResumeAdvancedMenu
_0233E878:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB04 ; =0x00003023
	ldr r0, [r0]
	str r1, [r0]
_0233E888:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1700
	ldrsb r0, [r0, #0xdc]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x7d8]
	bl ov01_02338EC4
	cmp r0, #5
	bne _0233E8D4
	bl ov05_0233F980
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E8D4:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1700
	ldrsb r0, [r0, #0xdc]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1700
	ldrsb r0, [r0, #0xdc]
	bl GetAdvancedMenuResult
	mov r4, r0
	bl ov05_0233F980
	cmp r4, #0
	bge _0233E948
	mov r0, #7
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233EB38 ; =ov05_0233FB7C
	ldr r3, _0233EB94 ; =0x000037FC
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB98 ; =0x00003028
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E948:
	ldr r3, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB9C ; =ov05_0233FC5C
	ldr r0, [r3]
	ldr r2, _0233EBA0 ; =ov05_0233FA74
	add r0, r0, #0x1000
	str r4, [r0, #0x7d8]
	ldr r0, [r3]
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_0204707C
	mov r0, #8
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233EB38 ; =ov05_0233FB7C
	ldr r3, _0233EBA4 ; =0x000037FB
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EBA8 ; =0x00003024
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233E9A4:
	bl ov01_02338EC4
	mov r5, r0
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #8
	bl ov01_0233768C
	cmp r5, #5
	bne _0233EA04
	bl sub_02046BB4
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_02047150
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EA04:
	cmp r4, #0xb
	bne _0233EA40
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_02047150
	ldr r1, _0233EB50 ; =0x000037F6
	mov r0, #0
	bl ov05_0233CB68
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EBAC ; =0x00003025
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EA40:
	sub r0, r4, #0xc
	cmp r0, #1
	bhi _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_02047150
	bl sub_02046D20
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB80 ; =0x00003022
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EA78:
	bl ov01_02338EC4
	mov r4, r0
	bl ov05_0233CB84
	cmp r4, #5
	bne _0233EAAC
	bl sub_02046BB4
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EAAC:
	cmp r0, #0xd
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r0]
	add r0, r2, #0x1000
	ldr r1, [r0, #0x7d8]
	ldr r0, [r2, #0x2c4]
	add r2, r2, r1, lsl #3
	ldr r1, [r2, #0x2d0]
	ldr r2, [r2, #0x2d4]
	bl ov01_0232E038
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EBB0 ; =0x00003026
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
	.align 2, 0
#if defined(EUROPE)
#define OV05_0233DBA0_OFFSET 2
#elif defined(JAPAN)
#define OV05_0233DBA0_OFFSET 0x164
#else
#define OV05_0233DBA0_OFFSET 0
#endif
_0233EB00: .word ov05_0233FCA8
_0233EB04: .word 0x00003023
_0233EB08: .word 0x00002001
_0233EB0C: .word 0x00001002
_0233EB10: .word 0x00003001
_0233EB14: .word 0x00004002
_0233EB18: .word 0x00009011
_0233EB1C: .word ov05_0233FC18
_0233EB20: .word ov05_0233FC14
_0233EB24: .word 0x000037F0 + OV05_0233DBA0_OFFSET
_0233EB28: .word 0x00000233
_0233EB2C: .word 0x00002710
_0233EB30: .word 0x05F5E100
_0233EB34: .word ov05_0233FB80
_0233EB38: .word ov05_0233FB7C
_0233EB3C: .word 0x00003801 + OV05_0233DBA0_OFFSET
_0233EB40: .word ov05_0233FBF8
_0233EB44: .word ov05_0233FBF4
_0233EB48: .word 0x00003802 + OV05_0233DBA0_OFFSET
_0233EB4C: .word 0xD4A51000
_0233EB50: .word 0x000037F6 + OV05_0233DBA0_OFFSET
_0233EB54: .word 0x00003002
_0233EB58: .word 0x00003806 + OV05_0233DBA0_OFFSET
_0233EB5C: .word 0x0000300F
_0233EB60: .word 0x00003003
_0233EB64: .word 0x00003004
_0233EB68: .word 0x00003010
_0233EB6C: .word 0x00003020
_0233EB70: .word 0x00003007
_0233EB74: .word ov05_0233FC44
_0233EB78: .word 0x000037F9 + OV05_0233DBA0_OFFSET
_0233EB7C: .word 0x00003021
_0233EB80: .word 0x00003022
_0233EB84: .word 0x000037FA + OV05_0233DBA0_OFFSET
_0233EB88: .word ov05_0233FC4C
_0233EB8C: .word 0x00441C33
_0233EB90: .word ov05_0233F9C4
_0233EB94: .word 0x000037FC + OV05_0233DBA0_OFFSET
_0233EB98: .word 0x00003028
_0233EB9C: .word ov05_0233FC5C
_0233EBA0: .word ov05_0233FA74
_0233EBA4: .word 0x000037FB + OV05_0233DBA0_OFFSET
_0233EBA8: .word 0x00003024
_0233EBAC: .word 0x00003025
_0233EBB0: .word 0x00003026
_0233EBB4:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233ED00
	mov r0, #0
	bl ov01_02338E1C
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r2, #0x148
	ldr r3, [r1]
	mov r4, r0
	add r1, r3, #0x1000
	ldr r1, [r1, #0x7d8]
	add r3, r3, #0x350
	mla r5, r1, r2, r3
	mov r7, #0
	bl ov01_0232E06C
	cmp r0, #0
	beq _0233EC04
	mov r0, r4
	mov r1, r5
	bl ov01_0232E0A4
_0233EC04:
	mov r8, #0
	mov r6, r8
	add r4, r5, #0x42
	mov fp, #0x4c
_0233EC14:
	mul sb, r6, fp
	add sl, r5, sb
	ldrh r0, [sl, #0x18]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0233EC8C
	ldrsh r0, [sl, #0x20]
	add r8, r8, #1
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	bne _0233EC88
	ldrsh r0, [sl, #0x20]
	bl sub_02054F18
	cmp r0, #0
	bne _0233EC88
	add r0, r4, sb
	bl IsMovesetValid
	cmp r0, #0
	beq _0233EC88
	ldrb r0, [sl, #0x1c]
	cmp r0, #1
	blo _0233EC88
	cmp r0, #0x64
	bhi _0233EC88
	ldrb r0, [sl, #0x3c]
	cmp r0, #0xb
	blo _0233EC8C
_0233EC88:
	mov r7, #1
_0233EC8C:
	add r6, r6, #1
	cmp r6, #4
	blt _0233EC14
	cmp r8, #0
	moveq r7, #1
	cmp r7, #0
	bne _0233ECE0
	mov r0, r5
	bl sub_02058FCC
	ldr r1, _0233F860 ; =0x000037FD
	mov r0, #0x1c
	bl ov05_0233CB68
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r3, _0233F864 ; =0x00002A30
	ldr r0, [r1]
	ldr r2, _0233F868 ; =0x00003027
	add r0, r0, #0x1000
	str r3, [r0, #0x884]
	ldr r0, [r1]
	str r2, [r0]
	b _0233F854
_0233ECE0:
	mov r0, #2
	mov r1, #6
	bl ov01_023398B0
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233ED00:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233ED24:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r4, r0
	bl ov05_0233CB84
	mov r5, r0
	add r1, sp, #0xe
	mov r0, #0
	bl GetHeldButtons
	bl sub_0204AE60
	cmp r0, #0
	moveq r0, #0
	beq _0233ED6C
	add r0, sp, #0x34
	bl GetReleasedStylus
	add r0, sp, #0x34
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_0233ED6C:
	ldrh r1, [sp, #0xe]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r0, _0233EB00 ; =ov05_0233FCA8
	ldrne r1, _0233F864 ; =0x00002A30
	ldrne r0, [r0]
	addne r0, r0, #0x1000
	strne r1, [r0, #0x884]
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r1, [r0, #0x884]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x884]
	cmp r4, #5
	bne _0233EDCC
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EDCC:
	cmp r5, #0xd
	beq _0233EDEC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x884]
	cmp r0, #0
	bgt _0233F854
_0233EDEC:
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EE0C:
	bl ov01_02338EC4
	mov r5, r0
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #7
	bl ov01_0233768C
	cmp r5, #5
	bne _0233EE58
	bl sub_02046BB4
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EE58:
	cmp r4, #0xb
	bne _0233EE94
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mvn r3, #0
	ldr r1, [r0]
	mov r0, #1
	add r2, r1, #0x1000
	mov r1, #0
	str r3, [r2, #0x7d8]
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EE94:
	sub r0, r4, #0xc
	cmp r0, #1
	bhi _0233F854
	bl sub_02046D20
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB80 ; =0x00003022
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EEB8:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233EF9C
	mov r0, #0
	bl ov01_02338E1C
	mov r5, r0
	bl ov01_0232DEA8
	mov r4, r0
	mov r0, r5
	bl ov01_0232DEE0
	cmp r4, #0
	bne _0233EF40
	mov r4, #0
	ldr r3, _0233EB00 ; =ov05_0233FCA8
	mov r1, r4
	mov r0, #0x4c
_0233EEF8:
	ldr r2, [r3]
	mla r2, r4, r0, r2
	add r2, r2, #0x300
	add r4, r4, #1
	strh r1, [r2, #0x70]
	cmp r4, #4
	blt _0233EEF8
	ldr r2, _0233EB00 ; =ov05_0233FCA8
	mov r0, #1
	ldr r2, [r2]
	add r2, r2, #0x1000
	str r0, [r2, #0x7d0]
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EF40:
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r1]
	strb r0, [r2, #0x2c8]
	ldr r1, [r1]
	mov r0, r5
	add r1, r1, #0x350
	bl ov01_0232DF18
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r0]
	ldr r0, [r2, #0x2c4]
	ldr r1, [r2, #0x2d0]
	ldr r2, [r2, #0x2d4]
	bl ov01_0232E038
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x2c4]
	bl ov01_02338C4C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F86C ; =0x00003011
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EF9C:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233EFC0:
	bl ov01_02338EC4
	cmp r0, #4
	bne _0233F118
	mov r0, #0
	bl ov01_02338E1C
	mov r4, r0
	mov r5, #0
	bl ov01_0232E06C
	cmp r0, #0
	beq _0233F0AC
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r0, r4
	ldr r1, [r1]
	mov r3, r5
	add r8, r1, #0x350
	add r2, r1, #0x1000
	mov r1, r8
	str r3, [r2, #0x7d0]
	bl ov01_0232E0A4
	mov r7, r5
	mov r6, r7
	add r4, r8, #0x42
	mov fp, #0x4c
_0233F01C:
	mul sb, r6, fp
	add sl, r8, sb
	ldrh r0, [sl, #0x18]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0233F094
	ldrsh r0, [sl, #0x20]
	add r7, r7, #1
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	bne _0233F090
	ldrsh r0, [sl, #0x20]
	bl sub_02054F18
	cmp r0, #0
	bne _0233F090
	add r0, r4, sb
	bl IsMovesetValid
	cmp r0, #0
	beq _0233F090
	ldrb r0, [sl, #0x1c]
	cmp r0, #1
	blo _0233F090
	cmp r0, #0x64
	bhi _0233F090
	ldrb r0, [sl, #0x3c]
	cmp r0, #0xb
	blo _0233F094
_0233F090:
	mov r5, #1
_0233F094:
	add r6, r6, #1
	cmp r6, #4
	blt _0233F01C
	cmp r7, #0
	moveq r5, #1
	b _0233F0D0
_0233F0AC:
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, [r0]
	ldrb r0, [r1, #0x2c8]
	cmp r0, #0
	add r0, r1, #0x1000
	movne r1, #2
	strne r1, [r0, #0x7d0]
	moveq r1, #3
	streq r1, [r0, #0x7d0]
_0233F0D0:
	cmp r5, #0
	bne _0233F0F8
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F0F8:
	mov r0, #2
	mov r1, #6
	bl ov01_023398B0
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F118:
	cmp r0, #8
	cmpne r0, #6
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F13C:
	bl ov01_02339988
	bl ov01_02338EC4
	mov r4, r0
	bl ov05_0233CB84
	mov r5, r0
	add r1, sp, #0xc
	mov r0, #0
	bl GetHeldButtons
	bl sub_0204AE60
	cmp r0, #0
	moveq r0, #0
	beq _0233F184
	add r0, sp, #0x10
	bl GetReleasedStylus
	add r0, sp, #0x10
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_0233F184:
	ldrh r1, [sp, #0xc]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r0, _0233EB00 ; =ov05_0233FCA8
	ldrne r1, _0233F864 ; =0x00002A30
	ldrne r0, [r0]
	addne r0, r0, #0x1000
	strne r1, [r0, #0x884]
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r1, [r0, #0x884]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x884]
	cmp r4, #5
	bne _0233F1E4
	bl sub_02046D20
	bl ov01_02338C34
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB5C ; =0x0000300F
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F1E4:
	cmp r5, #0xd
	beq _0233F204
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x884]
	cmp r0, #0
	bgt _0233F854
_0233F204:
	mov r0, #1
	mov r1, #0
	bl ov01_02338C28
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB70 ; =0x00003007
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F224:
	bl ov01_02338EC4
	cmp r0, #0
	beq _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F248:
	bl ov01_02338EC4
	cmp r0, #6
	bne _0233F3EC
	bl ov01_02338B08
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233F3B8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r2, [r0]
	ldr r0, [r2, #0x2cc]
	cmp r0, #0
	add r0, r2, #0x1000
	bge _0233F35C
	ldr r0, [r0, #0x7d0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233F854
_0233F28C: ; jump table
	b _0233F29C ; case 0
	b _0233F2F4 ; case 1
	b _0233F328 ; case 2
	b _0233F2F4 ; case 3
_0233F29C:
	add r0, r2, #0x350
	bl sub_02058FCC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F870 ; =0x000037FF
	ldr r0, [r0]
	mov r3, #0
	add r2, r0, #0x1000
	mov r0, #0x1c
	str r3, [r2, #0x7d8]
	bl ov05_0233CB68
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB9C ; =ov05_0233FC5C
	ldr r0, [r0]
	ldr r2, _0233EBA0 ; =ov05_0233FA74
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_0204707C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x4000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F2F4:
	mov r0, #9
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233F874 ; =ov05_0233FB4C
	ldr r3, _0233F878 ; =0x000037F7
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F87C ; =0x00004001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F328:
	mov r0, #9
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233F874 ; =ov05_0233FB4C
	ldr r3, _0233F880 ; =0x000037F8
	mov r1, r0
	bl ov05_0233CAC8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F87C ; =0x00004001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F35C:
	ldr r1, [r0, #0x7d4]
	cmp r1, #0
	bne _0233F39C
	mov r0, #0xa
	bl ov01_0233767C
	str r0, [sp]
	mov r0, #0
	ldr r2, _0233F874 ; =ov05_0233FB4C
#ifdef EUROPE
	mov r1, r0
	mov r3, #0x3800
#else
	ldr r3, _0233F884 ; =0x000037FE
	mov r1, r0
#endif
	bl ov05_0233CAC8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB14 ; =0x00004002
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F39C:
	ldr r0, [r0, #0x7d8]
	cmp r0, #0
	movlt r0, #0x9000
	strlt r0, [r2]
	movge r0, #0x8000
	strge r0, [r2]
	b _0233F854
_0233F3B8:
	bl ov05_0233CAA8
	cmp r0, #0
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, [r0]
	ldr r0, [r1, #0x2d0]
	ldr r1, [r1, #0x2d4]
	bl sub_020590DC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F3EC:
	cmp r0, #8
	bne _0233F854
	bl ov01_02338B08
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x9000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F40C:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x78
	add r0, r0, #0x1800
	bl sub_02047150
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F440:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #9
	bl ov01_0233768C
	cmp r4, #0xb
	bne _0233F488
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0x9000
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2]
	ldr r0, [r0]
	add r0, r0, #0x1000
	str r1, [r0, #0x888]
	b _0233F854
_0233F488:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233EB00 ; =ov05_0233FCA8
	movls r1, #0x9000
	ldrls r0, [r0]
	strls r1, [r0]
	b _0233F854
_0233F4A4:
	bl ov05_0233CB34
	mov r4, r0
	bl ov05_02046BA0
	mov r0, r0, lsl #0x18
	mov r1, r0, asr #0x18
	mov r0, #0xa
	bl ov01_0233768C
	cmp r4, #0xb
	bne _0233F4EC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0x9000
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	add r0, r0, #0x1000
	str r1, [r0, #0x888]
	b _0233F854
_0233F4EC:
	sub r0, r4, #0xc
	cmp r0, #1
	ldrls r0, _0233EB00 ; =ov05_0233FCA8
	movls r1, #0x9000
	ldrls r0, [r0]
	strls r1, [r0]
	b _0233F854
_0233F508:
	mov r0, #0
	bl ov00_022BD264
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	mov r3, #0
	ldr r0, [r1]
	ldr r2, _0233F888 ; =0x00008002
	add r0, r0, #0x1000
	str r3, [r0, #0x87c]
	ldr r0, [r1]
	str r2, [r0]
	b _0233F854
_0233F534:
	add r0, r4, #0x1000
	ldr r0, [r0, #0x87c]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0233F62C
_0233F548: ; jump table
	b _0233F55C ; case 0
	b _0233F578 ; case 1
	b _0233F5A8 ; case 2
	b _0233F608 ; case 3
	b _0233F61C ; case 4
_0233F55C:
	bl ov00_022BD780
	ldr r1, _0233F88C ; =0x0000023B
	mov r0, #0
	bl ov05_0233CB68
	add r0, r4, #0x1000
	mov r1, #1
	str r1, [r0, #0x87c]
_0233F578:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233F62C
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	add r0, r4, #0x1000
	mov r1, #2
	str r1, [r0, #0x87c]
	bl sub_02003B94
	b _0233F62C
_0233F5A8:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r5, #0
	bne _0233F5E0
#ifdef JAPAN
	ldr r1, _02341114 ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	bl ov05_0233CB68
	add r0, r4, #0x1000
	mov r1, #3
	str r1, [r0, #0x87c]
	b _0233F62C
_0233F5E0:
	cmp r5, #1
	moveq r0, #3
	beq _0233F630
	ldr r1, _0233F890 ; =0x00000239
	mov r0, #0x1c
	bl ov05_0233CB68
	add r0, r4, #0x1000
	mov r1, #4
	str r1, [r0, #0x87c]
	b _0233F62C
_0233F608:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233F62C
	mov r0, #1
	b _0233F630
_0233F61C:
	bl ov05_0233CB84
	cmp r0, #0xd
	moveq r0, #2
	beq _0233F630
_0233F62C:
	mov r0, #0
_0233F630:
	cmp r0, #1
	bne _0233F730
	bl ov05_0233CAA8
	cmp r0, #1
	bne _0233F664
#if defined(EUROPE)
	ldr r1, _02340010 ; =0x00003802
	mov r0, #0x1c
#elif defined(JAPAN)
	mov r0, #0x1c
	rsb r1, r0, #0x3980
#else
	mov r0, #0x1c
	mov r1, #0x3800
#endif
	bl ov05_0233CB68
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F664:
	ldr r1, _0233EB00 ; =ov05_0233FCA8
	add r0, sp, #0x158
	ldr r1, [r1]
	ldr r5, [r1, #0x2d0]
	ldr r4, [r1, #0x2d4]
	bl InitPreprocessorArgs
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	ldrb r0, [r0, #0x2c8]
	cmp r0, #0
	ldrne r0, _0233F894 ; =0x00003803
	ldreq r0, _0233F898 ; =0x00003804
	mov r1, r0, lsl #0x10
	add r0, sp, #0x58
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	ldr r2, _0233EB2C ; =0x00002710
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x184]
	ldr r2, _0233EB2C ; =0x00002710
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233EB2C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x180]
	ldr r2, _0233EB30 ; =0x05F5E100
	mov r1, r4
	mov r0, r5
	mov r3, #0
	bl _ll_udiv
	ldr r2, _0233EB2C ; =0x00002710
	mov r3, #0
	bl _ull_mod
	add r1, sp, #0x58
	str r1, [sp, #0x190]
	str r0, [sp, #0x17c]
	ldr r1, _0233F89C ; =0x00003807
	mov r0, #0x1c
	add r2, sp, #0x158
	bl ov05_02046BE8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0xf000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F730:
	cmp r0, #3
	moveq r0, #3
	beq _0233F858
	cmp r0, #2
	bne _0233F854
	mov r0, #1
	b _0233F858
_0233F74C:
	bl ov05_0233CB84
	cmp r0, #0xd
	bne _0233F854
	mov r0, #2
	b _0233F858
_0233F760:
	bl ov00_022BD274
	cmp r0, #0
	ldrne r0, _0233EB00 ; =ov05_0233FCA8
	ldrne r1, _0233F8A0 ; =0x00009010
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0233F854
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x888]
	cmp r0, #1
	bne _0233F7AC
	bl ov05_0233F8A8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F7AC:
	cmp r0, #2
	bne _0233F7CC
	bl sub_02046D20
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F8A4 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F7CC:
	mov r0, #1
	b _0233F858
_0233F7D4:
	bl ov01_0233769C
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233EB18 ; =0x00009011
	ldr r0, [r0]
	str r1, [r0]
_0233F7E8:
	bl ov01_02337718
	cmp r0, #1
	cmpne r0, #3
	bne _0233F854
	bl ov01_023376DC
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x888]
	cmp r0, #1
	bne _0233F82C
	bl ov05_0233F8A8
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F82C:
	cmp r0, #2
	bne _0233F84C
	bl sub_02046D20
	ldr r0, _0233EB00 ; =ov05_0233FCA8
	ldr r1, _0233F8A4 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
	b _0233F854
_0233F84C:
	mov r0, #1
	b _0233F858
_0233F854:
	mov r0, #0
_0233F858:
	add sp, sp, #0x348
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV05_0233DBDC_OFFSET 2
#elif defined(JAPAN)
#define OV05_0233DBDC_OFFSET 0x164
#else
#define OV05_0233DBDC_OFFSET 0
#endif
_0233F860: .word 0x000037FD + OV05_0233DBDC_OFFSET
_0233F864: .word 0x00002A30
_0233F868: .word 0x00003027
_0233F86C: .word 0x00003011
_0233F870: .word 0x000037FF + OV05_0233DBDC_OFFSET
_0233F874: .word ov05_0233FB4C
_0233F878: .word 0x000037F7 + OV05_0233DBDC_OFFSET
_0233F87C: .word 0x00004001
_0233F880: .word 0x000037F8 + OV05_0233DBDC_OFFSET
#ifndef EUROPE
_0233F884: .word 0x000037FE + OV05_0233DBDC_OFFSET
#endif
_0233F888: .word 0x00008002
#ifdef JAPAN
_0233F88C: .word 0x000004CC
_02341114: .word 0x000004CD
_0233F890: .word 0x000004CA
#else
_0233F88C: .word 0x0000023B
_0233F890: .word 0x00000239
#endif
#ifdef EUROPE
_02340010: .word 0x00003802
#endif
_0233F894: .word 0x00003803 + OV05_0233DBDC_OFFSET
_0233F898: .word 0x00003804 + OV05_0233DBDC_OFFSET
_0233F89C: .word 0x00003807 + OV05_0233DBDC_OFFSET
_0233F8A0: .word 0x00009010
_0233F8A4: .word 0x00001001
	arm_func_end ov05_0233DBDC

	arm_func_start ov05_0233F8A8
ov05_0233F8A8: ; 0x0233F8A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	bl ov05_0233F93C
	bl ov00_022BD338
	cmp r0, #0
	beq _0233F8CC
	bl ov00_022BCCF4
	cmp r0, #0
	bne _0233F8DC
_0233F8CC:
	ldr r0, _0233F928 ; =ov05_0233FCA8
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x9c]
_0233F8DC:
	mov r0, #4
	bl ov01_0233767C
	ldr r2, _0233F92C ; =ov05_0233FC18
	ldr r1, _0233F928 ; =ov05_0233FCA8
	ldr r2, [r2, r0, lsl #3]
	ldr r0, [r1]
	ldr r3, _0233F930 ; =ov05_0233FC14
	str r2, [r0, #4]
	mov r0, #0
	ldr r2, _0233F934 ; =0x000037F0
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, _0233F938 ; =0x00000233
	mov r1, r0
	add r3, r3, #4
	bl ov05_0233CADC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233F928: .word ov05_0233FCA8
_0233F92C: .word ov05_0233FC18
_0233F930: .word ov05_0233FC14
#if defined(EUROPE)
_0233F934: .word 0x000037F2
#elif defined(JAPAN)
_0233F934: .word 0x00003954
#else
_0233F934: .word 0x000037F0
#endif
_0233F938: .word 0x00000233
	arm_func_end ov05_0233F8A8

	arm_func_start ov05_0233F93C
ov05_0233F93C: ; 0x0233F93C
	stmdb sp!, {r3, lr}
	ldr r0, _0233F97C ; =ov05_0233FCA8
	mov r1, #0x98
	ldr r0, [r0]
	add r0, r0, #4
	bl MemZero
	ldr r0, _0233F97C ; =ov05_0233FCA8
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x9c
	bl MemZero
	ldr r0, _0233F97C ; =ov05_0233FCA8
	ldr r1, [r0]
	add r0, r1, #0x9c
	str r0, [r1, #0x64]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233F97C: .word ov05_0233FCA8
	arm_func_end ov05_0233F93C

	arm_func_start ov05_0233F980
ov05_0233F980: ; 0x0233F980
	stmdb sp!, {r4, lr}
	ldr r0, _0233F9C0 ; =ov05_0233FCA8
	mvn r1, #1
	ldr r4, [r0]
	add r0, r4, #0x1700
	ldrsb r0, [r0, #0xdc]
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl sub_0202836C
	add r0, r4, #0x1700
	ldrsb r0, [r0, #0xdc]
	bl CloseAdvancedMenu
	add r0, r4, #0x1000
	mvn r1, #1
	strb r1, [r0, #0x7dc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233F9C0: .word ov05_0233FCA8
	arm_func_end ov05_0233F980

	arm_func_start ov05_0233F9C4
ov05_0233F9C4: ; 0x0233F9C4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x94
	ldr r2, _0233FA68 ; =ov05_0233FCA8
	mov r6, r0
	add r0, sp, #0x44
	mov r7, r1
	ldr r4, [r2]
	bl InitPreprocessorArgs
	mov r0, #0x148
	mul r5, r7, r0
	bl GetLanguageType
	add r1, r4, r5
	add r1, r1, #0x300
	ldrsb r1, [r1, #0x50]
	cmp r1, r0
	bne _0233FA20
	add r0, r4, #0x52
	add r1, r0, #0x300
	add r0, sp, #4
	add r1, r1, r5
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233FA2C
_0233FA20:
	ldr r1, _0233FA6C ; =0x00000235
	add r0, sp, #4
	bl GetStringFromFileVeneer
_0233FA2C:
	add r1, sp, #4
	add r0, r4, r5
	str r1, [sp, #0x7c]
	ldrb r0, [r0, #0x351]
	ldr r2, _0233FA70 ; =ov05_0233FC6C
	add r4, sp, #0x44
	str r0, [sp, #0x54]
	mov r0, r6
	mov r1, #0x100
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	mov r0, r6
	add sp, sp, #0x94
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0233FA68: .word ov05_0233FCA8
#ifdef JAPAN
_0233FA6C: .word 0x000004C6
#else
_0233FA6C: .word 0x00000235
#endif
_0233FA70: .word ov05_0233FC6C
	arm_func_end ov05_0233F9C4

	arm_func_start ov05_0233FA74
ov05_0233FA74: ; 0x0233FA74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x194
	ldr r1, _0233FB40 ; =ov05_0233FCA8
	mov r6, r0
	ldr r4, [r1]
	add r0, sp, #0x144
	bl InitPreprocessorArgs
	add r0, r4, #0x1000
	ldr r1, [r0, #0x7d8]
	mov r0, #0x148
	mul r5, r1, r0
	bl GetLanguageType
	add r1, r4, r5
	add r1, r1, #0x300
	ldrsb r1, [r1, #0x50]
	cmp r1, r0
	bne _0233FAD4
	add r0, r4, #0x52
	add r1, r0, #0x300
	add r0, sp, #4
	add r1, r1, r5
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0233FAE0
_0233FAD4:
	ldr r1, _0233FB44 ; =0x00000235
	add r0, sp, #4
	bl GetStringFromFileVeneer
_0233FAE0:
	add r1, sp, #4
	add r0, r4, #0x1000
	str r1, [sp, #0x17c]
	ldr r1, [r0, #0x7d8]
	mov r0, #0x148
	mla r0, r1, r0, r4
	ldrb r1, [r0, #0x351]
	ldr r2, _0233FB48 ; =ov05_0233FC6C
	add r4, sp, #0x144
	str r1, [sp, #0x154]
	add r0, sp, #0x44
	mov r1, #0x100
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	add r3, sp, #0x44
	mov r0, r6
	mov r1, #4
	mov r2, #2
	bl DrawTextInWindow
	mov r0, r6
	bl UpdateWindow
	add sp, sp, #0x194
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0233FB40: .word ov05_0233FCA8
#ifdef JAPAN
_0233FB44: .word 0x000004C6
#else
_0233FB44: .word 0x00000235
#endif
_0233FB48: .word ov05_0233FC6C
	arm_func_end ov05_0233FA74
	; 0x0233FB4C

	.rodata
	.global ov05_0233FB4C
ov05_0233FB4C:
#if defined(EUROPE)
#define OV05_DATA_OFFSET 2
#elif defined(JAPAN)
#define OV05_DATA_OFFSET 0x164
#else
#define OV05_DATA_OFFSET 0
#endif
	.word 0x37DB + OV05_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x37DD + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FB64
ov05_0233FB64:
	.word 0x37DB + OV05_DATA_OFFSET
	.global ov05_0233FB68
ov05_0233FB68:
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x37DC + OV05_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FB7C
ov05_0233FB7C:
	.word 0x37DB + OV05_DATA_OFFSET
	.global ov05_0233FB80
ov05_0233FB80:
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x37DC + OV05_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FB94
ov05_0233FB94:
	.word 0x37E7 + OV05_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x37E8 + OV05_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x37E0 + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FBB4
ov05_0233FBB4:
	.word 0x37EA + OV05_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x37EB + OV05_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x37E0 + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FBD4
ov05_0233FBD4:
	.word 0x37DE + OV05_DATA_OFFSET
	.global ov05_0233FBD8
ov05_0233FBD8:
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x37DF + OV05_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x37E0 + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FBF4
ov05_0233FBF4:
	.word 0x3803 + OV05_DATA_OFFSET
	.global ov05_0233FBF8
ov05_0233FBF8:
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3804 + OV05_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3805 + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FC14
ov05_0233FC14:
	.word 0x37F1 + OV05_DATA_OFFSET
	.global ov05_0233FC18
ov05_0233FC18:
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x37F2 + OV05_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x37F3 + OV05_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x37F4 + OV05_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x37F5 + OV05_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov05_0233FC44
ov05_0233FC44:
	.hword 0x37F1 + OV05_DATA_OFFSET, 0x37F2 + OV05_DATA_OFFSET, 0x37F3 + OV05_DATA_OFFSET, 0x37F3 + OV05_DATA_OFFSET
	.global ov05_0233FC4C
ov05_0233FC4C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x02, 0x18, 0x11, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov05_0233FC5C
ov05_0233FC5C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x03, 0x18, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov05_0233FC6C
ov05_0233FC6C:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x58, 0x5D, 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x30, 0x5D
	.byte 0x5B, 0x43, 0x52, 0x5D, 0x5B, 0x43, 0x4C, 0x55, 0x4D, 0x5F, 0x53, 0x45, 0x54, 0x3A, 0x38, 0x38
	.byte 0x5D, 0x5B, 0x72, 0x61, 0x6E, 0x6B, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00

	.data
	.global ov05_0233FCA0
ov05_0233FCA0:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov05_0233FCA4
ov05_0233FCA4:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov05_0233FCA8
ov05_0233FCA8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov05_0233FCC0
ov05_0233FCC0:
	.space 0xC
	.global ov05_0233FCCC
ov05_0233FCCC:
	.space 0x14
