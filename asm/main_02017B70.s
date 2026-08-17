	.include "asm/macros.inc"
	.include "main_02017B70.inc"

	.text

	arm_func_start sub_02017B70
sub_02017B70: ; 0x02017B70
	ldr ip, _02017B78 ; =StopBgmCommand
	bx ip
	.align 2, 0
_02017B78: .word StopBgmCommand
	arm_func_end sub_02017B70

	arm_func_start sub_02017B7C
sub_02017B7C: ; 0x02017B7C
	ldr ip, _02017B84 ; =sub_02017F28
	bx ip
	.align 2, 0
_02017B84: .word sub_02017F28
	arm_func_end sub_02017B7C

	arm_func_start sub_02017B88
sub_02017B88: ; 0x02017B88
	ldr ip, _02017B90 ; =sub_02017F64
	bx ip
	.align 2, 0
_02017B90: .word sub_02017F64
	arm_func_end sub_02017B88

	arm_func_start sub_02017B94
sub_02017B94: ; 0x02017B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017FBC
	ldr r1, _02017BD0 ; =0x000003E7
	cmp r4, r1
	bne _02017BBC
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017BC8
_02017BBC:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017BC8:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017BD0: .word 0x000003E7
	arm_func_end sub_02017B94

	arm_func_start sub_02017BD4
sub_02017BD4: ; 0x02017BD4
	ldr ip, _02017BDC ; =sub_02018024
	bx ip
	.align 2, 0
_02017BDC: .word sub_02018024
	arm_func_end sub_02017BD4

	arm_func_start sub_02017BE0
sub_02017BE0: ; 0x02017BE0
	ldr ip, _02017BE8 ; =sub_020180A0
	bx ip
	.align 2, 0
_02017BE8: .word sub_020180A0
	arm_func_end sub_02017BE0

	arm_func_start sub_02017BEC
sub_02017BEC: ; 0x02017BEC
	ldr ip, _02017BF4 ; =sub_02018118
	bx ip
	.align 2, 0
_02017BF4: .word sub_02018118
	arm_func_end sub_02017BEC

	arm_func_start sub_02017BF8
sub_02017BF8: ; 0x02017BF8
	ldr ip, _02017C00 ; =sub_02018158
	bx ip
	.align 2, 0
_02017C00: .word sub_02018158
	arm_func_end sub_02017BF8

	arm_func_start sub_02017C04
sub_02017C04: ; 0x02017C04
	ldr ip, _02017C0C ; =sub_02018194
	bx ip
	.align 2, 0
_02017C0C: .word sub_02018194
	arm_func_end sub_02017C04

	arm_func_start IsMePlaying
IsMePlaying: ; 0x02017C10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020181E0
	ldr r1, _02017C4C ; =0x000003E6
	cmp r4, r1
	bne _02017C38
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017C44
_02017C38:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017C44:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017C4C: .word 0x000003E6
	arm_func_end IsMePlaying

	arm_func_start sub_02017C50
sub_02017C50: ; 0x02017C50
	ldr ip, _02017C58 ; =PlayMeById
	bx ip
	.align 2, 0
_02017C58: .word PlayMeById
	arm_func_end sub_02017C50

	arm_func_start sub_02017C5C
sub_02017C5C: ; 0x02017C5C
	ldr ip, _02017C64 ; =sub_02018278
	bx ip
	.align 2, 0
_02017C64: .word sub_02018278
	arm_func_end sub_02017C5C

	arm_func_start sub_02017C68
sub_02017C68: ; 0x02017C68
	ldr ip, _02017C70 ; =sub_020182AC
	bx ip
	.align 2, 0
_02017C70: .word sub_020182AC
	arm_func_end sub_02017C68

	arm_func_start sub_02017C74
sub_02017C74: ; 0x02017C74
	ldr ip, _02017C7C ; =PlaySeByIdVolume
	bx ip
	.align 2, 0
_02017C7C: .word PlaySeByIdVolume
	arm_func_end sub_02017C74
