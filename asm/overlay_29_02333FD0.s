	.include "asm/macros.inc"
	.include "overlay_29_02333FD0.inc"

	.text

	arm_func_start StatusCheckerCheckOnTarget
StatusCheckerCheckOnTarget: ; 0x02333FD0
#ifdef JAPAN
#define OV29_02333FD0_OFFSET -4
#else
#define OV29_02333FD0_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	ldr r5, [r6, #0xb4]
	mov r7, r0
	ldrb r0, [r5, #0xc4]
	mov r8, r2
	ldr r4, [r7, #0xb4]
	cmp r0, #1
	bne _02334008
	mov r0, r8
	bl IsThawingMove
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02334008:
	ldrh r1, [r8, #4]
	ldr r0, _02334CA4 ; =0x0000010A
	cmp r1, r0
	bgt _0233429C
	bge _023349A4
	cmp r1, #0x8a
	bgt _023341C8
	bge _023349F4
	cmp r1, #0x56
	bgt _02334164
	bge _023347B0
	cmp r1, #0x4f
	bgt _02334140
	bge _023344D0
	cmp r1, #0x3b
	bgt _02334134
	bge _0233473C
	cmp r1, #0x36
	addls pc, pc, r1, lsl #2
	b _02334C9C
_02334058: ; jump table
	b _02334C9C ; case 0
	b _02334C9C ; case 1
	b _02334C9C ; case 2
	b _023344E8 ; case 3
	b _023344D0 ; case 4
	b _02334510 ; case 5
	b _02334C9C ; case 6
	b _02334C9C ; case 7
	b _02334C9C ; case 8
	b _02334C9C ; case 9
	b _02334524 ; case 10
	b _02334538 ; case 11
	b _02334C9C ; case 12
	b _02334A74 ; case 13
	b _02334C9C ; case 14
	b _02334C9C ; case 15
	b _02334C9C ; case 16
	b _0233454C ; case 17
	b _02334C9C ; case 18
	b _02334C9C ; case 19
	b _02334574 ; case 20
	b _02334588 ; case 21
	b _023345A0 ; case 22
	b _02334618 ; case 23
	b _02334A74 ; case 24
	b _02334C9C ; case 25
	b _02334C9C ; case 26
	b _02334630 ; case 27
	b _02334C9C ; case 28
	b _02334C9C ; case 29
	b _02334C9C ; case 30
	b _02334C9C ; case 31
	b _02334C9C ; case 32
	b _02334644 ; case 33
	b _023344D0 ; case 34
	b _02334658 ; case 35
	b _02334C9C ; case 36
	b _023346C0 ; case 37
	b _02334C9C ; case 38
	b _02334C9C ; case 39
	b _02334C9C ; case 40
	b _02334C9C ; case 41
	b _02334C9C ; case 42
	b _023346D4 ; case 43
	b _02334C9C ; case 44
	b _02334A74 ; case 45
	b _02334C9C ; case 46
	b _023346F0 ; case 47
	b _02334C9C ; case 48
	b _02334C9C ; case 49
	b _02334C9C ; case 50
	b _02334C9C ; case 51
	b _02334C9C ; case 52
	b _02334C9C ; case 53
	b _02334704 ; case 54
_02334134:
	cmp r1, #0x42
	beq _02334750
	b _02334C9C
_02334140:
	cmp r1, #0x54
	bgt _02334158
	bge _023344D0
	cmp r1, #0x53
	beq _02334780
	b _02334C9C
_02334158:
	cmp r1, #0x55
	beq _02334794
	b _02334C9C
_02334164:
	cmp r1, #0x6f
	bgt _02334194
	bge _023344D0
	cmp r1, #0x59
	bgt _02334188
	bge _023347B0
	cmp r1, #0x58
	beq _023347C4
	b _02334C9C
_02334188:
	cmp r1, #0x6a
	beq _02334618
	b _02334C9C
_02334194:
	cmp r1, #0x73
	bgt _023341AC
	bge _02334830
	cmp r1, #0x70
	beq _0233481C
	b _02334C9C
_023341AC:
	cmp r1, #0x7a
	bgt _023341BC
	beq _0233476C
	b _02334C9C
_023341BC:
	cmp r1, #0x7c
	beq _0233473C
	b _02334C9C
_023341C8:
	cmp r1, #0xc5
	bgt _02334238
	bge _02334A40
	cmp r1, #0xac
	bgt _02334204
	bge _023348B8
	cmp r1, #0x92
	bgt _023341F8
	bge _023348A4
	cmp r1, #0x8e
	beq _023348A4
	b _02334C9C
_023341F8:
	cmp r1, #0xab
	beq _02334A74
	b _02334C9C
_02334204:
	cmp r1, #0xc0
	bgt _0233421C
	bge _0233473C
	cmp r1, #0xbf
	beq _02334A74
	b _02334C9C
_0233421C:
	cmp r1, #0xc2
	bgt _0233422C
	beq _023347B0
	b _02334C9C
_0233422C:
	cmp r1, #0xc4
	beq _02334A54
	b _02334C9C
_02334238:
	cmp r1, #0xdc
	bgt _02334268
	bge _0233493C
	cmp r1, #0xd1
	bgt _0233425C
	bge _023348CC
	cmp r1, #0xc7
	beq _02334A54
	b _02334C9C
_0233425C:
	cmp r1, #0xd9
	beq _02334928
	b _02334C9C
_02334268:
	cmp r1, #0xe7
	bgt _02334280
	bge _023344D0
	cmp r1, #0xe0
	beq _0233476C
	b _02334C9C
_02334280:
	cmp r1, #0xed
	bgt _02334290
	beq _02334960
	b _02334C9C
_02334290:
	cmp r1, #0xf9
	beq _02334908
	b _02334C9C
_0233429C:
	add r2, r0, #0xb5
	cmp r1, r2
	bgt _023343B8
	bge _02334AB0
	add r2, r0, #0x31
	cmp r1, r2
	bgt _0233432C
	bge _02334704
	add r2, r0, #0xf
	cmp r1, r2
	bgt _023342FC
	bge _0233473C
	add r2, r0, #7
	cmp r1, r2
	bgt _023342EC
	bge _023348A4
	add r0, r0, #1
	cmp r1, r0
	beq _02334928
	b _02334C9C
_023342EC:
	add r0, r0, #8
	cmp r1, r0
	beq _02334A74
	b _02334C9C
_023342FC:
	add r2, r0, #0x1c
	cmp r1, r2
	bgt _0233431C
	bge _02334A20
	add r0, r0, #0x1b
	cmp r1, r0
	beq _023349E0
	b _02334C9C
_0233431C:
	add r0, r0, #0x30
	cmp r1, r0
	beq _023349B8
	b _02334C9C
_0233432C:
	add r2, r0, #0x55
	cmp r1, r2
	bgt _0233436C
	bge _02334618
	add r2, r0, #0x3d
	cmp r1, r2
	bgt _0233435C
	bge _023349F4
	add r0, r0, #0x3c
	cmp r1, r0
	beq _02334A0C
	b _02334C9C
_0233435C:
	add r0, r0, #0x3f
	cmp r1, r0
	beq _023349CC
	b _02334C9C
_0233436C:
	add r2, r0, #0x74
	cmp r1, r2
	bgt _0233438C
	bge _02334A74
	add r0, r0, #0x71
	cmp r1, r0
	beq _023349A4
	b _02334C9C
_0233438C:
	add r2, r0, #0xac
	cmp r1, r2
	bgt _023343A8
	add r0, r0, #0xac
	cmp r1, r0
	beq _02334A88
	b _02334C9C
_023343A8:
	add r0, r0, #0xad
	cmp r1, r0
	beq _02334A9C
	b _02334C9C
_023343B8:
	add r2, r0, #0xe3
	cmp r1, r2
	bgt _02334450
	bge _02334B64
	add r2, r0, #0xc8
	cmp r1, r2
	bgt _02334408
	bge _02334B00
	add r2, r0, #0xb8
	cmp r1, r2
	bgt _023343FC
	add r0, r0, #0xb8
	cmp r1, r0
	bge _02334AEC
	cmp r1, #0x1c0
	beq _02334AC4
	b _02334C9C
_023343FC:
	cmp r1, #0x1c8
	beq _02334524
	b _02334C9C
_02334408:
	add r2, r0, #0xd8
	cmp r1, r2
	bgt _02334428
	bge _023348CC
	add r0, r0, #0xd4
	cmp r1, r0
	beq _02334B14
	b _02334C9C
_02334428:
	add r2, r0, #0xd9
	cmp r1, r2
	bgt _02334444
	add r0, r0, #0xd9
	cmp r1, r0
	beq _023344D0
	b _02334C9C
_02334444:
	cmp r1, #0x1ec
	beq _02334B28
	b _02334C9C
_02334450:
	add r2, r0, #0xf8
	cmp r1, r2
	bgt _02334494
	bge _02334C00
	add r2, r0, #0xf0
	cmp r1, r2
	bgt _02334484
	add r0, r0, #0xf0
	cmp r1, r0
	bge _02334B78
	cmp r1, #0x1f8
	beq _0233481C
	b _02334C9C
_02334484:
	add r0, r0, #0xf7
	cmp r1, r0
	beq _02334BD8
	b _02334C9C
_02334494:
	cmp r1, #0x210
	bgt _023344B0
	bge _02334C18
	ldr r0, _02334CA8 ; =0x0000020D
	cmp r1, r0
	beq _023349F4
	b _02334C9C
_023344B0:
	cmp r1, #0x214
	bgt _023344C0
	beq _02334C60
	b _02334C9C
_023344C0:
	add r0, r0, #0x10c
	cmp r1, r0
	beq _02334C74
	b _02334C9C
_023344D0:
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023344E8:
	ldrb r0, [r5, #0xbd]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334510:
	ldrb r0, [r5, #0xbd]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334524:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334538:
	ldr r0, [r5, #0x34]
	cmp r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233454C:
	ldrb r0, [r5, #0xd0]
	cmp r0, #6
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334574:
	ldrsh r0, [r5, #0x10]
	cmp r0, #2
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334588:
	ldrsh r1, [r5, #0x10]
	ldrsh r0, [r4, #0x10]
	cmp r1, r0
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023345A0:
	mov r3, #0
	mov r0, r3
	mov r1, #1
	b _023345DC
_023345B0:
	add r2, r5, r3, lsl #3
	ldrb r2, [r2, #0x124 + OV29_02333FD0_OFFSET]
	tst r2, #1
	movne r4, r1
	moveq r4, r0
	tst r4, #0xff
	beq _023345D8
	tst r2, #0x20
	movne r0, #1
	bne _023345F4
_023345D8:
	add r3, r3, #1
_023345DC:
	cmp r3, #4
	blt _023345B0
	ldrb r0, [r5, #0x144 + OV29_02333FD0_OFFSET]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
_023345F4:
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334618:
	ldr r0, [r6, #0xb4]
	ldr r0, [r0, #0x110 + OV29_02333FD0_OFFSET]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334630:
	ldr r0, [r5, #0x3c]
	cmp r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334644:
	ldrsh r0, [r5, #0x2a]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334658:
	mov r4, #0
	add r3, r5, #0x124 + OV29_02333FD0_OFFSET
	mov r1, r4
	mov r2, #1
	b _023346A4
_0233466C:
	ldrb r5, [r3, r4, lsl #3]
	add r0, r3, r4, lsl #3
	tst r5, #1
	movne r6, r2
	moveq r6, r1
	tst r6, #0xff
	beq _023346A0
	tst r5, #0x10
	beq _023346A0
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	beq _023346B0
_023346A0:
	add r4, r4, #1
_023346A4:
	cmp r4, #4
	blt _0233466C
	mov r0, #0
_023346B0:
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346C0:
	ldrb r0, [r5, #0xec]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346D4:
	ldr r0, [r5, #0x34]
	cmp r0, #0x3f
	ldrlt r0, [r5, #0x38]
	cmplt r0, #0x3f
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023346F0:
	ldrb r0, [r5, #0xbf]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334704:
	ldrb r0, [r5, #0x5e]
	cmp r0, #0xe
	ldrneb r0, [r5, #0x5f]
	cmpne r0, #0xe
	bne _02334728
	ldrb r0, [r5, #0xfe]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02334728:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233473C:
	ldrb r0, [r5, #0xbf]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334750:
	ldrsh r1, [r5, #0x10]
	ldrsh r0, [r4, #0x10]
	sub r0, r1, r0
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233476C:
	ldrsh r0, [r5, #0x28]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334780:
	ldrsh r0, [r5, #0x2a]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334794:
	ldrsh r0, [r5, #0x24]
	cmp r0, #1
	ldrltsh r0, [r5, #0x28]
	cmplt r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023347B0:
	ldrb r0, [r5, #0xc4]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023347C4:
	mov r2, #0
	b _02334804
_023347CC:
	add r1, r5, r2, lsl #1
	ldrsh r0, [r1, #0x24]
	cmp r0, #0xa
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0xa
	ldrgesh r0, [r1, #0x2c]
	cmpge r0, #0xa
	addge r1, r5, r2, lsl #2
	ldrge r0, [r1, #0x34]
	cmpge r0, #0x100
	ldrge r0, [r1, #0x3c]
	cmpge r0, #0x100
	blt _0233480C
	add r2, r2, #1
_02334804:
	cmp r2, #2
	blt _023347CC
_0233480C:
	cmp r2, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233481C:
	ldrb r0, [r5, #0xbd]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334830:
	mov r0, #0
	b _0233488C
_02334838:
	add r6, r4, r0, lsl #1
	add r3, r5, r0, lsl #1
	ldrsh r2, [r6, #0x24]
	ldrsh r1, [r3, #0x24]
	cmp r2, r1
	ldrgesh r2, [r6, #0x28]
	ldrgesh r1, [r3, #0x28]
	cmpge r2, r1
	ldrgesh r2, [r6, #0x2c]
	ldrgesh r1, [r3, #0x2c]
	cmpge r2, r1
	addge r6, r4, r0, lsl #2
	addge r3, r5, r0, lsl #2
	ldrge r2, [r6, #0x34]
	ldrge r1, [r3, #0x34]
	cmpge r2, r1
	ldrge r2, [r6, #0x3c]
	ldrge r1, [r3, #0x3c]
	cmpge r2, r1
	blt _02334894
	add r0, r0, #1
_0233488C:
	cmp r0, #2
	blt _02334838
_02334894:
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348A4:
	ldrsh r0, [r5, #0x2c]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348B8:
	ldrb r0, [r5, #0xd0]
	cmp r0, #5
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023348CC:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334908:
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334928:
	ldrsh r0, [r5, #0x24]
	cmp r0, #1
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0233493C:
	ldrb r1, [r4, #0x60]
	ldrb r0, [r5, #0x60]
	cmp r1, r0
	ldreqb r1, [r4, #0x61]
	ldreqb r0, [r5, #0x61]
	cmpeq r1, r0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334960:
	mov r0, r7
	mov r1, #0xe
	bl MonsterIsType
	cmp r0, #0
	beq _02334988
	ldrb r0, [r5, #0xd8]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334988:
	ldrsh r0, [r4, #0x24]
	cmp r0, #0x13
	ldrgtsh r0, [r4, #0x28]
	cmpgt r0, #0x13
	ble _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349A4:
	ldrb r0, [r5, #0xd0]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349B8:
	ldrsh r0, [r5, #0x10]
	cmp r0, #2
	bge _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349CC:
	ldrb r0, [r5, #0xe0]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349E0:
#ifdef JAPAN
	ldrb r0, [r5, #0x105]
#else
	ldrb r0, [r5, #0x106]
#endif
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023349F4:
	add r0, r5, #0x124 + OV29_02333FD0_OFFSET
	bl HasLastUsedMove
	cmp r0, #0
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A0C:
	ldrb r0, [r5, #0xd0]
	cmp r0, #7
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A20:
	ldrb r0, [r5, #0xc4]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A40:
	ldrb r0, [r5, #0xbf]
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A54:
	ldrb r0, [r5, #0xbf]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #3
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A74:
	ldrb r0, [r5, #0xd0]
	cmp r0, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A88:
	ldrb r0, [r5, #0xd8]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334A9C:
	ldrb r0, [r5, #0xd8]
	cmp r0, #4
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AB0:
	ldrb r0, [r5, #0xd5]
	cmp r0, #0x11
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AC4:
	ldrsh r3, [r4, #0x28]
	ldrsh r2, [r4, #0x2a]
	ldrsh r1, [r5, #0x28]
	ldrsh r0, [r5, #0x2a]
	add r2, r3, r2
	add r0, r1, r0
	cmp r2, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334AEC:
	ldrb r0, [r5, #0xd8]
	cmp r0, #5
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B00:
	ldrb r0, [r5, #0xd8]
	cmp r0, #6
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B14:
	bl GravityIsActive
	cmp r0, #0
	beq _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B28:
	mov r2, #0
	b _02334B4C
_02334B30:
	add r1, r5, r2, lsl #1
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	blt _02334B54
	add r2, r2, #1
_02334B4C:
	cmp r2, #2
	blt _02334B30
_02334B54:
	cmp r2, #2
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B64:
	ldrb r0, [r5, #0xf7]
	cmp r0, #1
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334B78:
	ldrsh r3, [r4, #0x28]
	ldrsh r1, [r4, #0x2a]
	ldrsh r2, [r5, #0x28]
	ldrsh r0, [r5, #0x2a]
	add r1, r3, r1
	mov r1, r1, lsl #0x10
	add r0, r2, r0
	mov r2, r0, lsl #0x10
	ldrsh r6, [r4, #0x24]
	ldrsh r0, [r4, #0x26]
	ldrsh r4, [r5, #0x24]
	ldrsh r3, [r5, #0x26]
	add r0, r6, r0
	mov r0, r0, lsl #0x10
	add r3, r4, r3
	mov r4, r1, asr #0x10
	mov r1, r3, lsl #0x10
	mov r2, r2, asr #0x10
	add r3, r4, r0, asr #16
	add r0, r2, r1, asr #16
	cmp r3, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334BD8:
	ldrsh r3, [r4, #0x24]
	ldrsh r2, [r4, #0x26]
	ldrsh r1, [r5, #0x24]
	ldrsh r0, [r5, #0x26]
	add r2, r3, r2
	add r0, r1, r0
	cmp r2, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C00:
	ldrsh r1, [r4, #0x24]
	ldrsh r0, [r4, #0x28]
	cmp r1, r0
	blt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C18:
	ldrb r0, [r5, #0x5e]
	cmp r0, #0x10
	ldrneb r0, [r5, #0x5f]
	cmpne r0, #0x10
	bne _02334C4C
	ldrb r0, [r5, #0xf5]
	cmp r0, #1
	bne _02334C9C
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C4C:
	ldrsh r0, [r5, #0x2e]
	cmp r0, #0xa
	bgt _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C60:
	ldrb r0, [r5, #0xd5]
	cmp r0, #0xf
	bne _02334C9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02334C74:
	ldrsh r0, [r5, #0x26]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsh r0, [r4, #2]
	ldrsh r1, [r5, #2]
	bl GendersEqualNotGenderless
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02334C9C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02334CA4: .word 0x0000010A
_02334CA8: .word 0x0000020D
	arm_func_end StatusCheckerCheckOnTarget

	arm_func_start HasLastUsedMove
HasLastUsedMove: ; 0x02334CAC
	stmdb sp!, {r3, lr}
	mov r3, #0
	mov r1, r3
	mov r2, #1
	b _02334CE8
_02334CC0:
	ldrb ip, [r0, r3, lsl #3]
	tst ip, #1
	movne lr, r2
	moveq lr, r1
	tst lr, #0xff
	beq _02334CE4
	tst ip, #0x10
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02334CE4:
	add r3, r3, #1
_02334CE8:
	cmp r3, #4
	blt _02334CC0
	ldrb r0, [r0, #0x20]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasLastUsedMove
