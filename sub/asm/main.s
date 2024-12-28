	.include "asm/macros.inc"
	.include "asm/include/main.inc"

	.text

	arm_func_start sub_027E0000
sub_027E0000: ; 0x027E0000
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4]
	ldr r3, _027E018C ; =_027F8878
	mov r5, r0
	str r1, [r3, #0x540]
	ldr r1, [r5, #0x24]
	ldr r0, _027E0190 ; =_027F7878
	str r1, [r3, #0x544]
	ldr r2, [r5, #0x28]
	ldr r1, _027E0194 ; =_027F7898
	str r2, [r3, #0x548]
	mov ip, #0
	str ip, [r3, #0x54c]
	mov r2, #2
	str ip, [r3, #0x550]
	bl sub_037FC6AC
	ldr r0, _027E0198 ; =_027F78A0
	ldr r1, _027E019C ; =_027F78C0
	mov r2, #4
	bl sub_037FC6AC
	ldr r0, _027E01A0 ; =_027F78D0
	ldr r1, _027E01A4 ; =_027F78F0
	mov r2, #4
	bl sub_037FC6AC
	ldr r0, _027E01A8 ; =_027F7900
	ldr r1, _027E01AC ; =_027F7920
	mov r2, #0x20
	bl sub_037FC6AC
	ldr r1, _027E0190 ; =_027F7878
	ldr r0, _027E0198 ; =_027F78A0
	str r1, [r5, #0x10]
	str r0, [r5, #0x14]
	ldr r2, [r4, #8]
	ldr r1, _027E018C ; =_027F8878
	ldr r0, _027E01B0 ; =_027F8DA0
	str r2, [r1, #0x578]
	ldr r2, [r4, #0x18]
	str r2, [r1, #0x57c]
	ldr r2, [r4, #0x10]
	str r2, [r1, #0x580]
	ldr r2, [r4, #4]
	str r2, [r1, #0x584]
	ldr r2, [r4, #0x14]
	str r2, [r1, #0x588]
	ldr r2, [r4, #0xc]
	str r2, [r1, #0x58c]
	bl sub_037FC870
	mov r0, #0x400
	str r0, [sp]
	ldr r1, [r4, #4]
	ldr r0, _027E01B4 ; =_0380B364
	str r1, [sp, #4]
	ldr r1, _027E01B8 ; =sub_027E0898
	ldr r3, _027E01B0 ; =_027F8DA0
	mov r2, #0
	bl sub_037FC054
	ldr r0, _027E01B4 ; =_0380B364
	bl sub_037FC36C
	mov r0, #0x1000
	str r0, [sp]
	ldr r1, [r4, #0xc]
	ldr r0, _027E01BC ; =_0380B2C0
	str r1, [sp, #4]
	ldr r1, _027E01C0 ; =sub_027E1CC0
	ldr r3, _027E01C4 ; =_027F89A0
	mov r2, #0
	bl sub_037FC054
	ldr r0, _027E01BC ; =_0380B2C0
	bl sub_037FC36C
	mov r3, #0
	ldr r1, _027E0190 ; =_027F7878
	mov r2, r3
_027E0128:
	add r0, r1, r3
	add r0, r0, #0x1000
	add r3, r3, #1
	strb r2, [r0, #0x554]
	cmp r3, #0x20
	blt _027E0128
	ldr r0, _027E018C ; =_027F8878
	str r2, [r0, #0x574]
	bl sub_037FD798
	cmp r0, #0
	bne _027E0158
	bl sub_037FD74C
_027E0158:
	bl sub_037FE2B4
	ldr r1, _027E01C8 ; =sub_027E0244
	mov r0, #0xa
	bl sub_037FE39C
	mov r0, #2
	str r0, [r5, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	str r1, [r5, #0xc]
	bl sub_027E89E0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E018C: .word _027F8878
_027E0190: .word _027F7878
_027E0194: .word _027F7898
_027E0198: .word _027F78A0
_027E019C: .word _027F78C0
_027E01A0: .word _027F78D0
_027E01A4: .word _027F78F0
_027E01A8: .word _027F7900
_027E01AC: .word _027F7920
_027E01B0: .word _027F8DA0
_027E01B4: .word _0380B364
_027E01B8: .word sub_027E0898
_027E01BC: .word _0380B2C0
_027E01C0: .word sub_027E1CC0
_027E01C4: .word _027F89A0
_027E01C8: .word sub_027E0244
	arm_func_end sub_027E0000

	arm_func_start sub_027E01CC
sub_027E01CC: ; 0x027E01CC
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _027E023C ; =_027F7878
	mov r2, #1
	bl sub_037FC6D4
	ldr r0, _027E0240 ; =_027F78D0
	add r1, sp, #0
	mov r2, #1
	bl sub_037FC760
	ldr r1, [sp]
	ldrh r0, [r1, #0xe]
	add r0, r1, r0, lsl #1
	ldrh r0, [r0, #0x14]
	cmp r0, #0xe
	bne _027E0230
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0x13
	strh r1, [r0, #2]
	mov r1, #0x18
	strh r1, [r0, #4]
	bl sub_03807334
	bl sub_037FE708
	bl sub_037FDE70
_027E0230:
	ldr r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E023C: .word _027F7878
_027E0240: .word _027F78D0
	arm_func_end sub_027E01CC

	arm_func_start sub_027E0244
sub_027E0244: ; 0x027E0244
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r2, #0
	bne _027E029C
	ldr r0, _027E02A4 ; =_027F7900
	mov r2, #0
	bl sub_037FC6D4
	cmp r0, #0
	bne _027E029C
	ldr r0, _027E02A8 ; =_027F8878
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _027E029C
	bl sub_03807380
	ldrh r2, [r4]
	mov r1, #8
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bl sub_03807334
_027E029C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E02A4: .word _027F7900
_027E02A8: .word _027F8878
	arm_func_end sub_027E0244

	arm_func_start sub_027E02AC
sub_027E02AC: ; 0x027E02AC
	ldr r1, _027E0308 ; =_027F8878
	ldrb r2, [r0]
	ldr r3, [r1, #0x550]
	ldrb r1, [r3, #0xe0]
	cmp r2, r1
	ldreqb r2, [r0, #1]
	ldreqb r1, [r3, #0xe1]
	cmpeq r2, r1
	ldreqb r2, [r0, #2]
	ldreqb r1, [r3, #0xe2]
	cmpeq r2, r1
	ldreqb r2, [r0, #3]
	ldreqb r1, [r3, #0xe3]
	cmpeq r2, r1
	ldreqb r2, [r0, #4]
	ldreqb r1, [r3, #0xe4]
	cmpeq r2, r1
	ldreqb r1, [r0, #5]
	ldreqb r0, [r3, #0xe5]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_027E0308: .word _027F8878
	arm_func_end sub_027E02AC

	arm_func_start sub_027E030C
sub_027E030C: ; 0x027E030C
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #8]
	mov r2, r0
	str r3, [r2, #4]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #8]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	movne r3, #2
	ldrh r0, [r1, #0xe]
	moveq r3, #0
	cmp r0, #0
	movne ip, #1
	ldrh r0, [r1, #0x14]
	moveq ip, #0
	cmp r0, #0
	movne lr, #4
	moveq lr, #0
	orr r0, ip, r3
	orr r0, lr, r0
	strb r0, [r2, #0xb]
	ldrh r3, [r1, #4]
	mov r0, #1
	strb r3, [r2, #0xa]
	strh r0, [r2]
	strb r0, [r2, #2]
	mov r0, #0
	strb r0, [r2, #3]
	ldrh r0, [r1, #0x34]
	strh r0, [r2, #0xc]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	beq _027E03A0
	ldrh r0, [r1, #0x36]
	cmp r0, #8
	movhs r0, #8
	bhs _027E03A4
_027E03A0:
	ldrh r0, [r1, #0x36]
_027E03A4:
	strh r0, [r2, #0xe]
	ldrb r3, [r2, #0xa]
	cmp r3, #0
	beq _027E03C8
	ldr r0, [r1]
	add r3, r3, #1
	add r1, r2, #0x10
	bic r2, r3, #1
	bl sub_037FE12C
_027E03C8:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027E030C

	arm_func_start sub_027E03D0
sub_027E03D0: ; 0x027E03D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027E0518 ; =_027F8878
	mov r5, r1
	ldr r4, [r2, #0x550]
	mov r6, r0
	add r0, r4, #0xe0
	add r1, r5, #0x10
	mov r2, #6
	bl sub_037FE12C
	mov r0, #7
	strh r0, [r5, #0x16]
	add r0, r4, #0x100
	ldrh r1, [r0, #0xf4]
	strh r1, [r5, #0x18]
	ldrh r1, [r0, #0xec]
	strh r1, [r5, #0x1e]
	ldrh r1, [r4, #0xe6]
	strh r1, [r5, #0x1c]
	ldr r1, [r4, #0x198]
	cmp r1, #0
	bne _027E0444
	mov r0, #0
	strh r0, [r5, #0x20]
	add r1, r5, #0x24
	mov r2, #0x50
	strh r0, [r5, #0x22]
	bl sub_037FDF74
	mov r0, #0
	b _027E0468
_027E0444:
	ldrh r1, [r0, #0x96]
	add r0, r4, #0x19c
	strh r1, [r5, #0x20]
	ldrh r2, [r4, #0xc4]
	add r1, r5, #0x24
	strh r2, [r5, #0x22]
	mov r2, #0x50
	bl sub_037FE12C
	mov r0, #1
_027E0468:
	strh r0, [r5, #0x9e]
	mov r0, #1
	strh r0, [r5, #0x74]
	strh r0, [r5, #0x76]
	ldrh r0, [r4, #0xe6]
	add r1, r5, #0x7c
	cmp r0, #1
	moveq r0, #0
	movne r0, #0x10
	strh r0, [r5, #0x78]
	mov r0, #0xa
	strh r0, [r5, #0x7a]
	cmp r6, #0x26
	mov r0, #0
	bne _027E04B0
	mov r2, #0x20
	bl sub_037FDF74
	b _027E04C8
_027E04B0:
	mov r2, #8
	bl sub_037FDF74
	ldr r0, _027E051C ; =0x0000FFFF
	add r1, r5, #0x84
	mov r2, #0x18
	bl sub_037FDF74
_027E04C8:
	add r0, r4, #0x100
	ldrh r1, [r0, #0xee]
	mov r0, r5
	strh r1, [r5, #0x9c]
	bl sub_027E2404
	ldrh r4, [r0, #4]
	cmp r4, #0
	moveq r0, #1
	beq _027E0510
	bl sub_03807380
	strh r6, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x200
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	mov r0, #0
_027E0510:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E0518: .word _027F8878
_027E051C: .word 0x0000FFFF
	arm_func_end sub_027E03D0

	arm_func_start sub_027E0520
sub_027E0520: ; 0x027E0520
	ldr r1, _027E0558 ; =_027F8878
	ldr r3, _027E055C ; =_027F8DCC
	ldr ip, [r1, #0x574]
	ldr r2, _027E0560 ; =0x027FFF98
	strb r0, [r3, ip]
	ldr r3, [r1, #0x574]
	add r3, r3, #1
	and r3, r3, #0x1f
	str r3, [r1, #0x574]
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_027E0558: .word _027F8878
_027E055C: .word _027F8DCC
_027E0560: .word 0x027FFF98
	arm_func_end sub_027E0520

	arm_func_start sub_027E0564
sub_027E0564: ; 0x027E0564
	ldr r2, _027E0594 ; =_027F7878
	mov r3, #0
_027E056C:
	add r1, r2, r3
	add r1, r1, #0x1000
	add r3, r3, #1
	strb r0, [r1, #0x554]
	cmp r3, #0x20
	blt _027E056C
	ldr r0, _027E0598 ; =_027F8878
	mov r1, #0
	str r1, [r0, #0x574]
	bx lr
	.align 2, 0
_027E0594: .word _027F7878
_027E0598: .word _027F8878
	arm_func_end sub_027E0564

	arm_func_start sub_027E059C
sub_027E059C: ; 0x027E059C
	ldr r1, _027E05D0 ; =_027F7878
	mov r3, #0
	mov r2, r3
_027E05A8:
	add r0, r1, r2
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x554]
	add r2, r2, #1
	cmp r2, #0x20
	add r3, r3, r0
	blt _027E05A8
	ldr ip, _027E05D4 ; =sub_027E05D8
	mov r0, r3, lsr #5
	bx ip
	.align 2, 0
_027E05D0: .word _027F7878
_027E05D4: .word sub_027E05D8
	arm_func_end sub_027E059C

	arm_func_start sub_027E05D8
sub_027E05D8: ; 0x027E05D8
	ldr r1, _027E063C ; =_027F8878
	ldr r1, [r1, #0x54c]
	ldrb r1, [r1, #0x53]
	cmp r1, #8
	bne _027E0614
	cmp r0, #0x16
	movlo r0, #0
	bxlo lr
	cmp r0, #0x1c
	movlo r0, #1
	bxlo lr
	cmp r0, #0x22
	movlo r0, #2
	movhs r0, #3
	bx lr
_027E0614:
	cmp r0, #8
	movlo r0, #0
	bxlo lr
	cmp r0, #0xe
	movlo r0, #1
	bxlo lr
	cmp r0, #0x14
	movlo r0, #2
	movhs r0, #3
	bx lr
	.align 2, 0
_027E063C: .word _027F8878
	arm_func_end sub_027E05D8

	arm_func_start sub_027E0640
sub_027E0640: ; 0x027E0640
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl sub_037FC558
	ldr r1, _027E0694 ; =_027F8878
	ldr r0, _027E0698 ; =_0380B2C0
	ldr r1, [r1, #0x58c]
	bl sub_037FC3C0
	bl sub_027E8BB0
	ldr r1, _027E0694 ; =_027F8878
	ldr r1, [r1, #0x588]
	bl sub_037FC3C0
	ldr r1, _027E0694 ; =_027F8878
	ldr r0, _027E069C ; =_0380B364
	ldr r1, [r1, #0x584]
	bl sub_037FC3C0
	bl sub_037FC590
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E0694: .word _027F8878
_027E0698: .word _0380B2C0
_027E069C: .word _0380B364
	arm_func_end sub_027E0640

	arm_func_start sub_027E06A0
sub_027E06A0: ; 0x027E06A0
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl sub_037FC558
	ldr r1, _027E06F4 ; =_027F8878
	ldr r0, _027E06F8 ; =_0380B364
	ldr r1, [r1, #0x578]
	bl sub_037FC3C0
	bl sub_027E8BB0
	ldr r1, _027E06F4 ; =_027F8878
	ldr r1, [r1, #0x57c]
	bl sub_037FC3C0
	ldr r1, _027E06F4 ; =_027F8878
	ldr r0, _027E06FC ; =_0380B2C0
	ldr r1, [r1, #0x580]
	bl sub_037FC3C0
	bl sub_037FC590
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E06F4: .word _027F8878
_027E06F8: .word _0380B364
_027E06FC: .word _0380B2C0
	arm_func_end sub_027E06A0

	arm_func_start sub_027E0700
sub_027E0700: ; 0x027E0700
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl EnableIrqFlag
	ldr r1, _027E0768 ; =_027F8878
	ldr r2, [r1, #0x54c]
	cmp r2, #0
	beq _027E0758
	mov r3, r4
	b _027E0750
_027E0724:
	add r1, r2, r3, lsl #4
	ldr r1, [r1, #0xd0]
	tst r1, #0x8000
	beq _027E074C
	add r2, r2, #0xd0
	ldr r1, [r2, r3, lsl #4]
	add r4, r2, r3, lsl #4
	bic r1, r1, #0x8000
	str r1, [r2, r3, lsl #4]
	b _027E0758
_027E074C:
	add r3, r3, #1
_027E0750:
	cmp r3, #0x20
	blt _027E0724
_027E0758:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E0768: .word _027F8878
	arm_func_end sub_027E0700

	arm_func_start sub_027E076C
sub_027E076C: ; 0x027E076C
	ldr r0, _027E079C ; =_027F8878
	mov r1, #0
	ldr r0, [r0, #0x550]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	bx lr
	.align 2, 0
_027E079C: .word _027F8878
	arm_func_end sub_027E076C

	arm_func_start sub_027E07A0
sub_027E07A0: ; 0x027E07A0
	ldr r1, _027E07EC ; =_027F8878
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x34]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3c]
	streqh r0, [r2, #0x38]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3e]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_027E07EC: .word _027F8878
	arm_func_end sub_027E07A0

	arm_func_start sub_027E07F0
sub_027E07F0: ; 0x027E07F0
	ldr r1, _027E083C ; =_027F8878
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x36]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3e]
	streqh r0, [r2, #0x3a]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3c]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_027E083C: .word _027F8878
	arm_func_end sub_027E07F0

	arm_func_start sub_027E0840
sub_027E0840: ; 0x027E0840
	ldr r1, _027E0868 ; =_027F8878
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x30]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	streqh r0, [r2, #0x38]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_027E0868: .word _027F8878
	arm_func_end sub_027E0840

	arm_func_start sub_027E086C
sub_027E086C: ; 0x027E086C
	ldr r1, _027E0894 ; =_027F8878
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	streqh r0, [r2, #0x3a]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_027E0894: .word _027F8878
	arm_func_end sub_027E086C

	arm_func_start sub_027E0898
sub_027E0898: ; 0x027E0898
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
_027E08A0:
	ldr r0, _027E16F0 ; =_027F7878
	add r1, sp, #0x1c
	add r0, r0, #0x28
	mov r2, #1
	bl sub_037FC760
	ldr sb, [sp, #0x1c]
	cmp sb, #0
	bne _027E08C8
	bl sub_037FC15C
	b _027E19F0
_027E08C8:
	ldrh r1, [sb, #0xc]
	and r0, r1, #0xff00
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	and r1, r1, #0xff
	cmpne r0, #0x100
	bne _027E19D8
	tst r1, #0x80
	beq _027E19D8
	ldr r0, _027E16F4 ; =_027F8878
	ldr r1, [r0, #0x54c]
	cmp r1, #0
	ldrne r8, [r0, #0x550]
	ldrneh r3, [r8]
	cmpne r3, #1
	beq _027E08A0
	ldrh r2, [sb, #0xc]
	ldr r1, _027E16F8 ; =0x00000182
	cmp r2, r1
	bgt _027E0964
	bge _027E101C
	cmp r2, #0x8d
	bgt _027E0958
	subs r0, r2, #0x84
	addpl pc, pc, r0, lsl #2
	b _027E19CC
_027E0930: ; jump table
	b _027E0990 ; case 0
	b _027E09B4 ; case 1
	b _027E0C40 ; case 2
	b _027E0DA4 ; case 3
	b _027E0DC8 ; case 4
	b _027E19CC ; case 5
	b _027E19CC ; case 6
	b _027E0DEC ; case 7
	b _027E0E1C ; case 8
	b _027E0E4C ; case 9
_027E0958:
	cmp r2, #0x180
	beq _027E0F64
	b _027E19CC
_027E0964:
	add r0, r1, #3
	cmp r2, r0
	bgt _027E0980
	bge _027E1670
	cmp r2, #0x184
	beq _027E1318
	b _027E19CC
_027E0980:
	add r0, r1, #4
	cmp r2, r0
	beq _027E18D4
	b _027E19CC
_027E0990:
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x13
	strh r1, [r0, #4]
	bl sub_03807334
	b _027E19CC
_027E09B4:
	cmp r3, #7
	cmpne r3, #9
	bne _027E0B3C
	add r1, sp, #0x14
	add r0, sb, #0x10
	mov r2, #6
	bl sub_037FE12C
	mov r6, #0
	mov r5, r6
	add r4, r8, #0x100
	mov sl, #1
	b _027E0AB4
_027E09E4:
	bl EnableIrqFlag
	ldrh r2, [r4, #0x82]
	add r1, r5, #1
	mov r7, r0
	tst r2, sl, lsl r1
	beq _027E0AA8
	mov r0, #6
	mul r2, r5, r0
	add r0, r8, r2
	ldrb fp, [sp, #0x14]
	ldrb r3, [r0, #0x128]
	cmp fp, r3
	ldreqb fp, [sp, #0x15]
	ldreqb r3, [r0, #0x129]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x16]
	ldreqb r3, [r0, #0x12a]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x17]
	ldreqb r3, [r0, #0x12b]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x18]
	ldreqb r3, [r0, #0x12c]
	cmpeq fp, r3
	ldreqb r3, [sp, #0x19]
	ldreqb r0, [r0, #0x12d]
	cmpeq r3, r0
	bne _027E0AA8
	add r3, r8, #0x100
	mov r0, r1, lsl #0x10
	mov r6, r0, lsr #0x10
	ldrh r0, [r3, #0x82]
	mvn r1, sl, lsl r6
	and r0, r0, r1
	strh r0, [r3, #0x82]
	ldrh r0, [r8, #0x86]
	add r3, r8, r6, lsl #3
	and r1, r0, r1
	add r0, r8, #0x128
	strh r1, [r8, #0x86]
	mov r1, #0
	str r1, [r3, #0x738]
	add r0, r0, r2
	mov r2, #6
	str r1, [r3, #0x73c]
	bl sub_037FE070
	mov r0, r7
	bl SetIrqFlag
	b _027E0ABC
_027E0AA8:
	mov r0, r7
	bl SetIrqFlag
	add r5, r5, #1
_027E0AB4:
	cmp r5, #0xf
	blt _027E09E4
_027E0ABC:
	cmp r6, #0
	beq _027E19CC
	bl sub_03807380
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, sb, #0x10
	strh r1, [r4, #0x12]
	strh r6, [r4, #0x10]
	add r1, r4, #0xa
	mov r2, #6
	bl sub_037FE12C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03807334
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _027E19CC
	mov r0, #1
	mov r0, r0, lsl r6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E781C
	b _027E19CC
_027E0B3C:
	mov r5, #0
	bl EnableIrqFlag
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _027E0B60
	bl SetIrqFlag
	b _027E19CC
_027E0B60:
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _027E0B80
	mov r0, r5
	str r0, [r8, #0xc]
	mov r5, #1
	bl sub_027E5B8C
	bl sub_027E0640
_027E0B80:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	str r1, [r8, #0x198]
	strh r1, [r0, #0x96]
	add r0, r8, #0x19c
	mov r2, #0x50
	bl sub_037FE070
	bl sub_027E076C
	mov r0, #0
	strh r0, [r8, #0xc2]
	mov r1, #3
	mov r0, r4
	strh r1, [r8]
	bl SetIrqFlag
	bl sub_03807380
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, r8, #0x100
	strh r1, [r4, #0xc]
	ldrh r1, [r0, #0x88]
	add r0, r8, #0x8a
	strh r1, [r4, #0xa]
	add r0, r0, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_037FE12C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03807334
	cmp r5, #0
	beq _027E19CC
	mov r0, #1
	bl sub_027E781C
	b _027E19CC
_027E0C40:
	ldrh r5, [sb, #0x16]
	cmp r5, #0
	beq _027E19CC
	cmp r5, #0x10
	bhs _027E19CC
	ldrh r0, [r8, #0xf6]
	cmp r0, #0
	bne _027E0CCC
	bl sub_027E0700
	movs r4, r0
	moveq r0, #0
	beq _027E0C98
	mov r3, #0x22
	add r0, sb, #0x10
	add r1, r4, #4
	mov r2, #6
	str r3, [r4]
	bl sub_037FE12C
	ldr r0, _027E16FC ; =_027F7900
	mov r1, r4
	mov r2, #0
	bl sub_037FC6D4
_027E0C98:
	cmp r0, #0
	bne _027E19CC
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x22
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E19CC
_027E0CCC:
	bl EnableIrqFlag
	add r1, r8, #0x100
	mov r4, #1
	ldrh r3, [r1, #0x82]
	mvn r2, r4, lsl r5
	orr r3, r3, r4, lsl r5
	strh r3, [r1, #0x82]
	ldrh r1, [r8, #0x86]
	mov r4, r0
	and r0, r1, r2
	strh r0, [r8, #0x86]
	bl GetCurrentPlaybackTime
	orr r2, r0, #1
	add r0, r8, r5, lsl #3
	add r3, r8, #0x128
	str r2, [r0, #0x738]
	orr r1, r1, #0
	str r1, [r0, #0x73c]
	sub r0, r5, #1
	mov r2, #6
	mla r1, r0, r2, r3
	add r0, sb, #0x10
	bl sub_037FE12C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	add r1, r8, #0x1f8
	add r1, r1, r5, lsl #4
	mov r2, #0x10
	bl sub_037FDF74
	bl sub_03807380
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, sb, #0x10
	add r1, r4, #0xa
	mov r2, #6
	bl sub_037FE12C
	strh r5, [r4, #0x10]
	add r0, sb, #0x22
	add r1, r4, #0x14
	mov r2, #0x18
	bl sub_037FDF9C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03807334
	b _027E19CC
_027E0DA4:
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x12
	strh r1, [r0, #4]
	bl sub_03807334
	b _027E19CC
_027E0DC8:
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x11
	strh r1, [r0, #4]
	bl sub_03807334
	b _027E19CC
_027E0DEC:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _027E19CC
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #8
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E19CC
_027E0E1C:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _027E19CC
	bl sub_03807380
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #2
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E19CC
_027E0E4C:
	ldrb r0, [sb, #0x1f]
	bl sub_027E1A40
	ldr r2, _027E1700 ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	ldrh r0, [r8]
	cmp r0, #8
	cmpne r0, #0xa
	bne _027E19CC
	ldrh r1, [r8, #0xba]
	ldrh r0, [sb, #0x44]
	cmp r1, r0
	beq _027E0EF0
	bl sub_027E0700
	movs r1, r0
	moveq r0, #0
	beq _027E0EBC
	mov r0, #0x25
	str r0, [r1]
	mov r0, #1
	ldr r3, _027E1704 ; =0x00008002
	str r0, [r1, #4]
	ldr r0, _027E16FC ; =_027F7900
	mov r2, #0
	str r3, [r1, #8]
	bl sub_037FC6D4
_027E0EBC:
	cmp r0, #0
	bne _027E19CC
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E19CC
_027E0EF0:
	ldr r0, _027E16F4 ; =_027F8878
	ldr r0, [r0, #0x550]
	ldrh r0, [r0, #0xc2]
	cmp r0, #0
	beq _027E19CC
	bl sub_03807380
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #0x10
	strh r0, [r4, #4]
	ldrh r0, [sb, #0x44]
	strh r0, [r4, #6]
	ldrh r0, [r8]
	strh r0, [r4, #8]
	ldrh r0, [sb, #0x16]
	strh r0, [r4, #0xa]
	cmp r0, #0x80
	bhi _027E0F58
	add r2, r0, #1
	add r0, sb, #0x3c
	add r1, r4, #0xc
	bic r2, r2, #1
	bl sub_037FDF9C
_027E0F58:
	mov r0, r4
	bl sub_03807334
	b _027E19CC
_027E0F64:
	ldr r0, [r8, #0x10]
	cmp r0, #0
	beq _027E19CC
	ldrb r0, [sb, #0x1f]
	bl sub_027E1A40
	bl sub_027E0520
	bl sub_027E059C
	strh r0, [r8, #0xbc]
	add r0, sb, #0x2e
	bl sub_027E02AC
	cmp r0, #1
	beq _027E19CC
	ldrh r1, [sb, #0x16]
	ldr r0, _027E1708 ; =0x000005E4
	cmp r1, r0
	bhi _027E19CC
	ldrh r1, [r8, #0xae]
	add r0, sb, #0x10
	eor r1, r1, #1
	strh r1, [r8, #0xae]
	ldrh r2, [r8, #0xae]
	ldrh r1, [sb, #0x16]
	add r2, r8, r2, lsl #2
	ldr r4, [r2, #0xb0]
	add r2, r1, #0x2d
	mov r1, r4
	bic r2, r2, #1
	bl sub_037FE12C
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_037FE12C
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_037FE12C
	bl sub_03807380
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xf
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03807334
	b _027E19CC
_027E101C:
	ldrb r0, [sb, #0x1f]
	bl sub_027E1A40
	ldrh r1, [r8, #0xbe]
	cmp r1, r0
	strhih r0, [r8, #0xbe]
	ldr r0, [r8, #0xc]
	cmp r0, #0
	beq _027E19CC
	ldrh r0, [r8, #0x60]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r8, #0x60]
	ldrh r0, [r8, #0x70]
	ldrh sl, [r8, #0x8e]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	ldrh r0, [r8, #0x70]
	ldrh r1, [sb, #0x16]
	add r3, r8, r0, lsl #2
	ldrh r0, [r8, #0x72]
	add r2, r1, #0x30
	ldr r4, [r3, #0x74]
	cmp r0, r2
	movlo r2, r0
	mov r1, r4
	add r0, sb, #0x10
	bl sub_037FE12C
	bl EnableIrqFlag
	ldrh r1, [r8, #0x84]
	mov fp, r0
	cmp r1, #1
	mov r5, #0
	bne _027E10AC
	ldr r0, _027E170C ; =_0380B408
	mov r5, #1
	bl sub_037FD5C0
_027E10AC:
	mov r7, #1
	strh r7, [r8, #0x84]
	ldrh r0, [r4, #0xa]
	mov ip, #0
	strh r0, [r8, #0x82]
	ldrh r6, [sb, #0x18]
	ldr r0, _027E1710 ; =0x000082EA
	tst r6, #0x2000
	moveq r7, #0
	strh r7, [r8, #0x90]
	str ip, [sp]
	ldrh r2, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	sub r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	add r1, r1, #0x80
	mov r1, r1, lsl #4
	umull r3, r2, r1, r0
	mla r2, r1, ip, r2
	mov r1, r1, asr #0x1f
	mla r2, r1, r0, r2
	mov r0, r3, lsr #6
	orr r0, r0, r2, lsl #26
	mov r3, r2, lsr #6
	mov r1, r0, lsr #0xa
	ldr r0, _027E170C ; =_0380B408
	mov r2, r3, lsr #0xa
	orr r1, r1, r3, lsl #22
	ldr r3, _027E1714 ; =sub_027E1B68
	bl sub_037FD4DC
	and r0, r6, #0x2800
	cmp r0, #0x2800
	moveq r1, #1
	and r0, r6, #0x6000
	movne r1, #0
	cmp r0, #0x6000
	moveq r2, #1
	movne r2, #0
	cmp r2, #0
	movne r0, #0
	strneh r0, [r8, #0x8a]
	cmp r1, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8c]
	cmp r7, #0
	beq _027E11B8
	ldrh r0, [r4, #0x2c]
	sub r1, r0, #0x66
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	subs r1, r0, #0x20
	bmi _027E11B8
	ldrh r0, [r8, #0x32]
	cmp r1, #0x200
	movgt r1, #0x200
	cmp r1, r0
	beq _027E11B8
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E086C
_027E11B8:
	mov r0, fp
	bl SetIrqFlag
	cmp r5, #0
	beq _027E1204
	cmp sl, #1
	bne _027E11DC
	mov r0, r5
	mov r1, #0
	bl sub_027E74EC
_027E11DC:
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #9
	strh r1, [r0, #2]
	mov r1, #0xd
	strh r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	bl sub_03807334
_027E1204:
	cmp r7, #0
	bne _027E1230
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _027E19CC
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	b _027E19CC
_027E1230:
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_037FE12C
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_037FE12C
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _027E12C0
	sub r0, r0, #2
	strh r0, [r4, #6]
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03807334
	ldrh r3, [r4, #6]
	cmp r3, #0
	beq _027E12EC
	str r4, [sp]
	ldrh r1, [r4, #0x30]
	add r2, r4, #0x32
	mov r0, #0
	bl sub_027E7A10
	b _027E12EC
_027E12C0:
	mov r0, #0
	strh r0, [r4, #6]
	strh r0, [r8, #0x5e]
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03807334
_027E12EC:
	ldr r0, [r8, #0x7bc]
	ldr r1, [r8, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _027E19CC
	bl GetCurrentPlaybackTime
	orr r0, r0, #1
	str r0, [r8, #0x738]
	orr r0, r1, #0
	str r0, [r8, #0x73c]
	b _027E19CC
_027E1318:
	ldr r0, [r8, #0xc]
	mov fp, #0
	cmp r0, #0
	beq _027E19CC
	ldrh r0, [sb, #0x12]
	cmp r0, #0
	bne _027E134C
	ldrh r1, [r8, #0x66]
	cmp r1, #1
	bne _027E1354
	ldrh r0, [sb, #0x10]
	cmp r0, #0
	beq _027E1354
_027E134C:
	bl sub_027E1A54
	b _027E19CC
_027E1354:
	cmp r1, #0
	movne r0, #0
	strneh r0, [r8, #0x66]
	ldrh r1, [sb, #0x16]
	ldrh r0, [sb, #0x14]
	ldrh r3, [r8, #0x70]
	mul r2, r1, r0
	add r1, r8, r3, lsl #2
	ldr r4, [r1, #0x74]
	ldrh r0, [r8, #0x72]
	add r2, r2, #0xa
	cmp r0, r2
	movlo r2, r0
	mov r1, r4
	add r0, sb, #0x10
	bl sub_037FE12C
	ldr r0, _027E16F4 ; =_027F8878
	ldrh r1, [r4]
	ldr r7, [r0, #0x550]
	cmp r1, #0
	ldrh r5, [r7, #0xbe]
	bne _027E13F0
	ldrh r0, [sb, #0x14]
	cmp r0, #1
	blo _027E13F0
	add sl, sb, #0x1a
	mov r6, #0
	b _027E13E0
_027E13C4:
	ldrh r1, [sb, #0x16]
	mla r0, r1, r6, sl
	ldrb r0, [r0, #3]
	bl sub_027E1A40
	cmp r0, r5
	movlo r5, r0
	add r6, r6, #1
_027E13E0:
	ldrh r0, [sb, #0x14]
	cmp r6, r0
	blt _027E13C4
	strh r5, [r7, #0xbe]
_027E13F0:
	bl GetCurrentPlaybackTime
	orr r0, r0, #1
	str r0, [sp, #8]
	ldr r0, _027E1718 ; =0x00008001
	orr r1, r1, #0
	rsb r0, r0, #0x18000
	ldrh r6, [r4]
	str r1, [sp, #0xc]
	add r5, r4, #0xa
	mov sl, #0
	str r0, [sp, #0x10]
	b _027E1588
_027E1420:
	ldrh r7, [r5, #4]
	ldrh r1, [r5]
	cmp r7, #1
	blo _027E1574
	cmp r7, #0xf
	bhi _027E1574
	cmp r1, #2
	blo _027E149C
	ldr r0, [sp, #0x10]
	cmp r1, r0
	beq _027E149C
	sub r0, r1, #2
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	strh r3, [r5]
	ldrh r2, [r8, #0x86]
	mov r1, #1
	orr r1, r2, r1, lsl r7
	strh r1, [r8, #0x86]
	ldr r1, [sp, #8]
	add r0, r8, r7, lsl #3
	str r1, [r0, #0x738]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x73c]
	beq _027E1574
	mov r0, r7
	str r4, [sp]
	ldrh r1, [r5, #8]
	add r2, r5, #0xa
	bl sub_027E7A10
	b _027E1574
_027E149C:
	cmp r1, #0
	bne _027E1574
	add r0, r8, r7, lsl #3
	ldr r2, [r0, #0x738]
	ldr r1, [r0, #0x73c]
	mov r0, #1
	mov r0, r0, lsl r7
	str r0, [sp, #4]
	mov r0, #1
	orr r6, r6, r0, lsl r7
	ldr ip, [r8, #0x7bc]
	ldr r0, [r8, #0x7b8]
	cmp ip, #0
	mov r3, #0
	cmpeq r0, #0
	beq _027E1574
	cmp r1, r3
	cmpeq r2, r3
	beq _027E1574
	ldr r3, [sp, #8]
	subs r3, r3, r2
	ldr r2, [sp, #0xc]
	sbc r1, r2, r1
	cmp r1, ip
	cmpeq r3, r0
	bls _027E1574
	bl sub_027E0700
	movs r1, r0
	add r2, r8, r7, lsl #3
	mov r0, #0
	str r0, [r2, #0x738]
	str r0, [r2, #0x73c]
	beq _027E1544
	mov r0, #0x25
	str r0, [r1]
	ldr r0, [sp, #4]
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _027E1718 ; =0x00008001
	str r0, [r1, #8]
	ldr r0, _027E16FC ; =_027F7900
	bl sub_037FC6D4
_027E1544:
	cmp r0, #0
	bne _027E1574
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03807334
_027E1574:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
	ldrh r0, [r4, #6]
	add r5, r5, r0
_027E1588:
	ldrh r0, [r4, #4]
	cmp sl, r0
	blo _027E1420
	mov r0, r6, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0
	bl sub_027E74EC
	ldrh r0, [r4]
	cmp r0, #0
	movne fp, #1
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xb
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03807334
	ldrh r0, [r8, #0x70]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	bl EnableIrqFlag
	cmp fp, #0
	ldreqsh r1, [r8, #0x62]
	subeq r1, r1, #1
	streqh r1, [r8, #0x62]
	ldrsh r1, [r8, #0x64]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r8, #0x64]
	ldrsh r1, [r8, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r8, #0x64]
	cmpgt r1, #0
	movgt r4, #1
	movle r4, #0
	bl SetIrqFlag
	cmp r4, #0
	beq _027E19CC
	cmp fp, #1
	ldreqh r4, [sb, #0x10]
	ldrh r0, [r8, #0x44]
	ldrne r4, _027E171C ; =0x0000FFFF
	cmp r0, #0
	beq _027E1664
	ldr r0, _027E1720 ; =_0380B434
	bl sub_037FD5C0
	str r4, [sp]
	ldr r1, [r8, #0x48]
	ldr r2, [r8, #0x4c]
	ldr r0, _027E1720 ; =_0380B434
	ldr r3, _027E1724 ; =sub_027E1AD4
	bl sub_037FD4DC
	b _027E19CC
_027E1664:
	mov r0, r4
	bl sub_027E1AE8
	b _027E19CC
_027E1670:
	ldr r0, [r8, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _027E19CC
	ldrh r0, [sb, #0xe]
	cmp r0, #0
	bne _027E16D0
	ldr r1, _027E1728 ; =0x048080F8
	mov r4, #1
	ldrh r0, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1]
	cmp r0, r2
	ldrhih r3, [r1, #2]
	mov r0, r2, asr #4
	orr r0, r0, r3, lsl #12
	ldrh r1, [r8, #0x82]
	mov r0, r0, lsl #0x10
	rsb r0, r1, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	ble _027E19CC
	b _027E16D4
_027E16D0:
	mov r4, r5
_027E16D4:
	bl EnableIrqFlag
	ldrh r1, [r8, #0x84]
	mov r7, r0
	cmp r1, #0
	bne _027E172C
	bl SetIrqFlag
	b _027E19CC
	.align 2, 0
_027E16F0: .word _027F7878
_027E16F4: .word _027F8878
_027E16F8: .word 0x00000182
_027E16FC: .word _027F7900
_027E1700: .word 0x027FFF98
_027E1704: .word 0x00008002
_027E1708: .word 0x000005E4
_027E170C: .word _0380B408
_027E1710: .word 0x000082EA
_027E1714: .word sub_027E1B68
_027E1718: .word 0x00008001
_027E171C: .word 0x0000FFFF
_027E1720: .word _0380B434
_027E1724: .word sub_027E1AD4
_027E1728: .word 0x048080F8
_027E172C:
	ldr r0, _027E170C ; =_0380B408
	mov r1, #0
	strh r1, [r8, #0x84]
	ldrh r6, [r8, #0x90]
	bl sub_037FD5C0
	mov r0, r7
	bl SetIrqFlag
	ldrh r3, [r8, #0x8c]
	mov r2, #1
	cmp r3, #0
	beq _027E1778
	cmp r4, #0
	bne _027E1774
	add r0, r8, #0x100
	ldrh r1, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	tst r1, r2, lsl r0
	bne _027E1778
_027E1774:
	mov r2, #0
_027E1778:
	cmp r3, #0
	movne r0, #0
	strneh r0, [r8, #0x8c]
	ldrh r0, [r8, #0x8e]
	cmp r0, #0
	beq _027E17B4
	mov r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl sub_027E74EC
	mov r5, r0
_027E17B4:
	cmp r6, #0
	beq _027E19CC
	bl sub_03807380
	mov r7, r0
	mov r0, #0xe
	strh r0, [r7]
	cmp r4, #0
	movne r0, #9
	strneh r0, [r7, #2]
	bne _027E1800
	add r0, r8, #0x100
	ldrh r2, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	mov r1, #1
	tst r2, r1, lsl r0
	movne r0, #0xf
	strneh r0, [r7, #2]
	moveq r0, #0
	streqh r0, [r7, #2]
_027E1800:
	mov r0, #0xd
	strh r0, [r7, #4]
	mov r0, #0
	str r0, [r7, #8]
	cmp r4, #0
	bne _027E1860
	ldrh r1, [sb, #0x1c]
	add r0, sb, #0x28
	strh r1, [r7, #0xc]
	ldrh r2, [sb, #0x1e]
	add r1, r7, #0x10
	strh r2, [r7, #0xe]
	mov r2, #6
	bl sub_037FE12C
	add r0, sb, #0x2e
	add r1, r7, #0x16
	mov r2, #6
	bl sub_037FE12C
	ldrh r0, [sb, #0x3a]
	strh r0, [r7, #0x1c]
	ldrh r0, [sb, #0x3c]
	strh r0, [r7, #0x1e]
	ldrh r0, [sb, #0x3e]
	strh r0, [r7, #0x20]
_027E1860:
	mov r0, r7
	bl sub_03807334
	cmp r6, #0
	beq _027E19CC
	cmp r5, #1
	ldrneh r0, [r8, #0x5e]
	cmpne r0, #0
	bne _027E18BC
	ldrh r0, [r8, #0x46]
	cmp r0, #0
	beq _027E18B4
	ldr r0, _027E1720 ; =_0380B434
	bl sub_037FD5C0
	mov r0, #0
	str r0, [sp]
	ldr r1, [r8, #0x50]
	ldr r2, [r8, #0x54]
	ldr r0, _027E1720 ; =_0380B434
	ldr r3, _027E19FC ; =sub_027E1C00
	bl sub_037FD4DC
	b _027E19CC
_027E18B4:
	bl sub_027E1C0C
	b _027E19CC
_027E18BC:
	mov r1, #0
	strh r1, [r8, #0x5e]
	mov r0, #1
	strh r0, [r8, #0x60]
	strh r1, [r8, #0x88]
	b _027E19CC
_027E18D4:
	add r0, r8, #0x700
	ldrh r0, [r0, #0xcc]
	cmp r0, #1
	ldreqh r0, [sb, #0x10]
	cmpeq r0, #0x20
	bne _027E1948
	bl EnableIrqFlag
	mov r4, r0
	ldr r0, _027E170C ; =_0380B408
	bl sub_037FD5C0
	mov r1, #0
	mov r0, r4
	strh r1, [r8, #0x84]
	bl SetIrqFlag
	mov r1, #0
	strh r1, [r8, #0x8a]
	mov r0, #1
	bl sub_027E74EC
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x17
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E19CC
_027E1948:
	bl sub_027E0700
	movs r1, r0
	moveq r0, #0
	beq _027E199C
	ldr r0, _027E1A00 ; =0x00008003
	mov r2, #0x25
	str r2, [r1]
	str r0, [r1, #8]
	ldrh r0, [r8]
	cmp r0, #9
	cmpne r0, #7
	ldreq r0, _027E1A04 ; =0x00007FFE
	streq r0, [r1, #4]
	beq _027E1990
	cmp r0, #0xa
	cmpne r0, #8
	moveq r0, #1
	streq r0, [r1, #4]
_027E1990:
	ldr r0, _027E16FC ; =_027F7900
	mov r2, #0
	bl sub_037FC6D4
_027E199C:
	cmp r0, #0
	bne _027E19CC
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03807334
_027E19CC:
	mov r0, sb
	bl sub_027E1A08
	b _027E08A0
_027E19D8:
	ldr r0, _027E16F0 ; =_027F7878
	mov r1, sb
	add r0, r0, #0x58
	mov r2, #1
	bl sub_037FC6D4
	b _027E08A0
_027E19F0:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E19FC: .word sub_027E1C00
_027E1A00: .word 0x00008003
_027E1A04: .word 0x00007FFE
	arm_func_end sub_027E0898

	arm_func_start sub_027E1A08
sub_027E1A08: ; 0x027E1A08
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _027E1A3C ; =_027F8878
	mov r4, r0
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	mov r2, r5
	bl sub_037FCD84
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E1A3C: .word _027F8878
	arm_func_end sub_027E1A08

	arm_func_start sub_027E1A40
sub_027E1A40: ; 0x027E1A40
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_027E1A40

	arm_func_start sub_027E1A54
sub_027E1A54: ; 0x027E1A54
	stmdb sp!, {r4, lr}
	ldr r0, _027E1ACC ; =_027F8878
	ldr r4, [r0, #0x550]
	bl sub_027E0700
	movs r1, r0
	moveq r0, #0
	beq _027E1A8C
	mov r0, #0x2d
	str r0, [r1]
	ldrh r3, [r4, #0x68]
	ldr r0, _027E1AD0 ; =_027F7900
	mov r2, #0
	str r3, [r1, #4]
	bl sub_037FC6D4
_027E1A8C:
	cmp r0, #0
	movne r0, #1
	strneh r0, [r4, #0x66]
	bne _027E1AC4
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2d
	strh r1, [r0, #6]
	bl sub_03807334
_027E1AC4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E1ACC: .word _027F8878
_027E1AD0: .word _027F7900
	arm_func_end sub_027E1A54

	arm_func_start sub_027E1AD4
sub_027E1AD4: ; 0x027E1AD4
	ldr ip, _027E1AE4 ; =sub_027E1AE8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_027E1AE4: .word sub_027E1AE8
	arm_func_end sub_027E1AD4

	arm_func_start sub_027E1AE8
sub_027E1AE8: ; 0x027E1AE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_027E0700
	movs r1, r0
	ldr r4, _027E1B64 ; =_027F7878
	moveq r0, #0
	beq _027E1B1C
	mov r0, #0x2b
	str r0, [r1]
	add r0, r4, #0x88
	mov r2, #0
	str r5, [r1, #4]
	bl sub_037FC6D4
_027E1B1C:
	cmp r0, #0
	bne _027E1B5C
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _027E1B5C
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2b
	strh r1, [r0, #6]
	bl sub_03807334
_027E1B5C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E1B64: .word _027F7878
	arm_func_end sub_027E1AE8

	arm_func_start sub_027E1B68
sub_027E1B68: ; 0x027E1B68
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027E1BF0 ; =_027F8878
	mov r2, #0x40
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	ldr r5, _027E1BF4 ; =_027F7878
	bl sub_037FCC74
	mov r4, r0
	ldr r1, _027E1BF8 ; =0x00000185
	ldr r0, _027E1BFC ; =_027F78A0
	strh r1, [r4, #0xc]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #0xe]
	bl sub_037FC6D4
	cmp r0, #0
	bne _027E1BE8
	mov r0, r4
	bl sub_027E1A08
	add r0, r5, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _027E1BE8
	bl sub_03807380
	mov r2, #0x80
	strh r2, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bl sub_03807334
_027E1BE8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E1BF0: .word _027F8878
_027E1BF4: .word _027F7878
_027E1BF8: .word 0x00000185
_027E1BFC: .word _027F78A0
	arm_func_end sub_027E1B68

	arm_func_start sub_027E1C00
sub_027E1C00: ; 0x027E1C00
	ldr ip, _027E1C08 ; =sub_027E1C0C
	bx ip
	.align 2, 0
_027E1C08: .word sub_027E1C0C
	arm_func_end sub_027E1C00

	arm_func_start sub_027E1C0C
sub_027E1C0C: ; 0x027E1C0C
	stmdb sp!, {r4, lr}
	bl sub_027E0700
	ldr r2, _027E1C94 ; =_027F8878
	movs r1, r0
	ldr r0, [r2, #0x550]
	mov r2, #0
	strh r2, [r0, #0x5e]
	strh r2, [r0, #0x60]
	ldr r4, _027E1C98 ; =_027F7878
	strh r2, [r0, #0x88]
	beq _027E1C4C
	mov r3, #0x2c
	add r0, r4, #0x88
	str r3, [r1]
	bl sub_037FC6D4
	mov r2, r0
_027E1C4C:
	cmp r2, #0
	bne _027E1C8C
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _027E1C8C
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2c
	strh r1, [r0, #6]
	bl sub_03807334
_027E1C8C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E1C94: .word _027F8878
_027E1C98: .word _027F7878
	arm_func_end sub_027E1C0C

	arm_func_start sub_027E1C9C
sub_027E1C9C: ; 0x027E1C9C
	stmdb sp!, {r3, lr}
	ldr r0, _027E1CB8 ; =_0380B434
	bl sub_037FD3A0
	ldr r0, _027E1CBC ; =_0380B408
	bl sub_037FD3A0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E1CB8: .word _0380B434
_027E1CBC: .word _0380B408
	arm_func_end sub_027E1C9C

	arm_func_start sub_027E1CC0
sub_027E1CC0: ; 0x027E1CC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _027E1D58 ; =_027F8878
	mov r6, #1
	ldr r8, _027E1D5C ; =_027F7878
	ldr sb, [r0, #0x550]
	ldr r5, _027E1D60 ; =_027F7184
	add r7, sp, #0
	mov r4, #0
	mov fp, r6
_027E1CE4:
	mov r1, r7
	mov r2, fp
	add r0, r8, #0x88
	bl sub_037FC760
	ldr r0, [sp]
	cmp r0, #0
	bne _027E1D08
	bl sub_037FC15C
	b _027E1D50
_027E1D08:
	ldrh sl, [r0]
	tst sl, #0x8000
	bicne r0, sl, #0x8000
	movne r0, r0, lsl #0x10
	movne sl, r0, lsr #0x10
	cmp sl, #0x2e
	bhs _027E1D40
	str r6, [sb, #4]
	strh sl, [sb, #2]
	ldr r0, [sp]
	ldr r1, [r5, sl, lsl #2]
	mov lr, pc
	bx r1
_027E1D3C:
	str r4, [sb, #4]
_027E1D40:
	ldr r0, [sp]
	orr r1, sl, #0x8000
	strh r1, [r0]
	b _027E1CE4
_027E1D50:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E1D58: .word _027F8878
_027E1D5C: .word _027F7878
_027E1D60: .word _027F7184
	arm_func_end sub_027E1CC0

	arm_func_start sub_027E1D64
sub_027E1D64: ; 0x027E1D64
	bx lr
	arm_func_end sub_027E1D64

	arm_func_start sub_027E1D68
sub_027E1D68: ; 0x027E1D68
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E1D68

	arm_func_start sub_027E1DBC
sub_027E1DBC: ; 0x027E1DBC
	stmdb sp!, {r4, lr}
	mov r4, #0
	strh r4, [r0]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	mov ip, #1
	strh ip, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh ip, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E1DBC

	arm_func_start sub_027E1E1C
sub_027E1E1C: ; 0x027E1E1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, #2
	mov r7, r1
	mov r0, r2
	strh r5, [r4, #0xc]
	mov r5, #0x1f
	add r1, r4, #0x10
	mov r2, #6
	mov r6, r3
	strh r5, [r4, #0xe]
	bl sub_037FDF9C
	ldr r0, [sp, #0x18]
	add r1, r4, #0x18
	mov r2, #0x20
	strh r6, [r4, #0x16]
	bl sub_037FDF9C
	ldrh r2, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r1, r4, #0x3a
	strh r2, [r4, #0x38]
	mov r2, #0x10
	bl sub_037FDF9C
	ldrh r1, [sp, #0x24]
	mov r0, r7, lsr #1
	strh r1, [r4, #0x4a]
	mov r1, #0
	strh r1, [r4, #0x4c]
	ldrh r2, [r4, #0xe]
	ldrh r1, [r4, #0xc]
	add r5, r4, r2, lsl #1
	strh r1, [r5, #0x10]
	sub r1, r0, #0x2c
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_027E1E1C

	arm_func_start sub_027E1ED4
sub_027E1ED4: ; 0x027E1ED4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r3, #0
	strh r3, [r4]
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	strh r3, [r4, #6]
	strh r3, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #3
	strh r0, [r4, #0xc]
	mov r0, #0x22
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r0, r2
	strh r3, [r4, #0x12]
	add r1, r4, #0x14
	mov r2, #0x44
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #5
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E1ED4

	arm_func_start sub_027E1F4C
sub_027E1F4C: ; 0x027E1F4C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r5, #5
	mov r6, r2
	mov r0, r1
	strh r5, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	mov r5, r3
	bl sub_037FDF9C
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #6
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E1F4C

	arm_func_start sub_027E1FCC
sub_027E1FCC: ; 0x027E1FCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #5
	strh r0, [r4, #0xc]
	mov r3, #4
	mov r5, r2
	mov r0, r1
	strh r3, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	bl sub_037FDF9C
	strh r5, [r4, #0x16]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #4
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E1FCC

	arm_func_start sub_027E2044
sub_027E2044: ; 0x027E2044
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	mov r6, r2
	strh r0, [r4, #0xa]
	mov r2, #6
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r5, r3
	bl sub_037FDF9C
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #3
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E2044

	arm_func_start sub_027E20C0
sub_027E20C0: ; 0x027E20C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	ldrh r0, [sp, #0x20]
	strh ip, [r4, #8]
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	mov r0, r2
	strh ip, [r4, #0xa]
	mov r2, #9
	strh r2, [r4, #0xc]
	add r2, r5, #0x17
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	add r1, r4, #0x12
	mov r2, #0x20
	mov r5, r3
	bl sub_037FDF9C
	ldrh r1, [sp, #0x10]
	strh r5, [r4, #0x32]
	ldrh r0, [sp, #0x14]
	strh r1, [r4, #0x34]
	ldrh r1, [sp, #0x18]
	strh r0, [r4, #0x36]
	ldrh r0, [sp, #0x1c]
	strh r1, [r4, #0x38]
	ldrh r2, [sp, #0x20]
	strh r0, [r4, #0x3a]
	ldr r0, [sp, #0x24]
	strh r2, [r4, #0x3c]
	add r1, r4, #0x3e
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E20C0

	arm_func_start sub_027E2180
sub_027E2180: ; 0x027E2180
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, #0
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	mov r0, #0xa
	strh r0, [r4, #0xc]
	mov r0, #0xc
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r1, [r4, #0x12]
	strh r2, [r4, #0x14]
	ldr r0, [sp, #0x10]
	strh r3, [r4, #0x16]
	add r1, r4, #0x18
	mov r2, #0x10
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #0x12
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E2180

	arm_func_start sub_027E2200
sub_027E2200: ; 0x027E2200
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, r1
	mov r0, #0x100
	strh r0, [r4, #0xc]
	mov r1, #0x18
	mov r0, r5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x30
	bl sub_037FDF9C
	mov r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x16]
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	strh r0, [r5, #0x28]
	strh r0, [r5, #0x2a]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #2
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E2200

	arm_func_start sub_027E22AC
sub_027E22AC: ; 0x027E22AC
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _027E2310 ; =0x00000101
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E2310: .word 0x00000101
	arm_func_end sub_027E22AC

	arm_func_start sub_027E2314
sub_027E2314: ; 0x027E2314
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _027E23A8 ; =0x00000102
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #0xa
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r2, [sp, #8]
	strh r3, [r0, #0x14]
	ldrh r1, [sp, #0xc]
	strh r2, [r0, #0x16]
	ldrh r2, [sp, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [sp, #0x14]
	strh r2, [r0, #0x1a]
	ldrh r2, [sp, #0x18]
	strh r1, [r0, #0x1c]
	ldr r1, [sp, #0x1c]
	strh r2, [r0, #0x1e]
	str r1, [r0, #0x20]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E23A8: .word 0x00000102
	arm_func_end sub_027E2314

	arm_func_start sub_027E23AC
sub_027E23AC: ; 0x027E23AC
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	mov r2, #0x104
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E23AC

	arm_func_start sub_027E2404
sub_027E2404: ; 0x027E2404
	stmdb sp!, {r4, lr}
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r1, #0x200
	mov r2, #0x48
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E2404

	arm_func_start sub_027E2458
sub_027E2458: ; 0x027E2458
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E24B0 ; =0x00000207
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E24B0: .word 0x00000207
	arm_func_end sub_027E2458

	arm_func_start sub_027E24B4
sub_027E24B4: ; 0x027E24B4
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E250C ; =0x0000020B
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E250C: .word 0x0000020B
	arm_func_end sub_027E24B4

	arm_func_start sub_027E2510
sub_027E2510: ; 0x027E2510
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	ldr r2, _027E2580 ; =0x0000020D
	strh r0, [r4, #0xa]
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #0x10
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x20
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E2580: .word 0x0000020D
	arm_func_end sub_027E2510

	arm_func_start sub_027E2584
sub_027E2584: ; 0x027E2584
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E25DC ; =0x0000020E
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E25DC: .word 0x0000020E
	arm_func_end sub_027E2584

	arm_func_start sub_027E25E0
sub_027E25E0: ; 0x027E25E0
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _027E2644 ; =0x00000211
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E2644: .word 0x00000211
	arm_func_end sub_027E25E0

	arm_func_start sub_027E2648
sub_027E2648: ; 0x027E2648
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E26A0 ; =0x00000212
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E26A0: .word 0x00000212
	arm_func_end sub_027E2648

	arm_func_start sub_027E26A4
sub_027E26A4: ; 0x027E26A4
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E26FC ; =0x00000215
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E26FC: .word 0x00000215
	arm_func_end sub_027E26A4

	arm_func_start sub_027E2700
sub_027E2700: ; 0x027E2700
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E2758 ; =0x00000216
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E2758: .word 0x00000216
	arm_func_end sub_027E2700

	arm_func_start sub_027E275C
sub_027E275C: ; 0x027E275C
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _027E27B4 ; =0x00000242
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E27B4: .word 0x00000242
	arm_func_end sub_027E275C

	arm_func_start sub_027E27B8
sub_027E27B8: ; 0x027E27B8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	strh ip, [r4, #8]
	add r0, r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	mov r0, r2
	ldr r5, _027E2838 ; =0x00000245
	strh ip, [r4, #0xa]
	strh r5, [r4, #0xc]
	add r2, r3, #1
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r2, r1
	add r1, r4, #0x12
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_027E01CC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E2838: .word 0x00000245
	arm_func_end sub_027E27B8

	arm_func_start sub_027E283C
sub_027E283C: ; 0x027E283C
	ldr ip, _027E284C ; =sub_027E29A8
	ldr r1, _027E2850 ; =0x00000281
	mov r2, #4
	bx ip
	.align 2, 0
_027E284C: .word sub_027E29A8
_027E2850: .word 0x00000281
	arm_func_end sub_027E283C

	arm_func_start sub_027E2854
sub_027E2854: ; 0x027E2854
	ldr ip, _027E2864 ; =sub_027E29A8
	ldr r1, _027E2868 ; =0x00000283
	mov r2, #3
	bx ip
	.align 2, 0
_027E2864: .word sub_027E29A8
_027E2868: .word 0x00000283
	arm_func_end sub_027E2854

	arm_func_start sub_027E286C
sub_027E286C: ; 0x027E286C
	ldr ip, _027E287C ; =sub_027E29A8
	mov r1, #0x284
	mov r2, #2
	bx ip
	.align 2, 0
_027E287C: .word sub_027E29A8
	arm_func_end sub_027E286C

	arm_func_start sub_027E2880
sub_027E2880: ; 0x027E2880
	ldr ip, _027E2890 ; =sub_027E29A8
	ldr r1, _027E2894 ; =0x00000301
	mov r2, #1
	bx ip
	.align 2, 0
_027E2890: .word sub_027E29A8
_027E2894: .word 0x00000301
	arm_func_end sub_027E2880

	arm_func_start sub_027E2898
sub_027E2898: ; 0x027E2898
	ldr ip, _027E28A8 ; =sub_027E29A8
	ldr r1, _027E28AC ; =0x00000302
	mov r2, #1
	bx ip
	.align 2, 0
_027E28A8: .word sub_027E29A8
_027E28AC: .word 0x00000302
	arm_func_end sub_027E2898

	arm_func_start sub_027E28B0
sub_027E28B0: ; 0x027E28B0
	ldr ip, _027E28C0 ; =sub_027E29A8
	ldr r1, _027E28C4 ; =0x00000303
	mov r2, #1
	bx ip
	.align 2, 0
_027E28C0: .word sub_027E29A8
_027E28C4: .word 0x00000303
	arm_func_end sub_027E28B0

	arm_func_start sub_027E28C8
sub_027E28C8: ; 0x027E28C8
	ldr ip, _027E28D8 ; =sub_027E29A8
	mov r1, #0x304
	mov r2, #1
	bx ip
	.align 2, 0
_027E28D8: .word sub_027E29A8
	arm_func_end sub_027E28C8

	arm_func_start sub_027E28DC
sub_027E28DC: ; 0x027E28DC
	ldr ip, _027E28EC ; =sub_027E29A8
	ldr r1, _027E28F0 ; =0x00000305
	mov r2, #1
	bx ip
	.align 2, 0
_027E28EC: .word sub_027E29A8
_027E28F0: .word 0x00000305
	arm_func_end sub_027E28DC

	arm_func_start sub_027E28F4
sub_027E28F4: ; 0x027E28F4
	ldr ip, _027E2904 ; =sub_027E29A8
	ldr r1, _027E2908 ; =0x00000306
	mov r2, #9
	bx ip
	.align 2, 0
_027E2904: .word sub_027E29A8
_027E2908: .word 0x00000306
	arm_func_end sub_027E28F4

	arm_func_start sub_027E290C
sub_027E290C: ; 0x027E290C
	ldr ip, _027E291C ; =sub_027E29A8
	ldr r1, _027E2920 ; =0x00000307
	mov r2, #0x5c
	bx ip
	.align 2, 0
_027E291C: .word sub_027E29A8
_027E2920: .word 0x00000307
	arm_func_end sub_027E290C

	arm_func_start sub_027E2924
sub_027E2924: ; 0x027E2924
	ldr ip, _027E2934 ; =sub_027E29A8
	mov r1, #0x308
	mov r2, #2
	bx ip
	.align 2, 0
_027E2934: .word sub_027E29A8
	arm_func_end sub_027E2924

	arm_func_start sub_027E2938
sub_027E2938: ; 0x027E2938
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _027E29A4 ; =0x00000309
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r1, [sp, #8]
	strh r3, [r0, #0x14]
	strh r1, [r0, #0x16]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E29A4: .word 0x00000309
	arm_func_end sub_027E2938

	arm_func_start sub_027E29A8
sub_027E29A8: ; 0x027E29A8
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r3, lsl #1
	strh r1, [r4, #0x10]
	strh r2, [r4, #0x12]
	bl sub_027E01CC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E29A8

	arm_func_start sub_027E29F0
sub_027E29F0: ; 0x027E29F0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, [r0, #4]
	ldr r1, _027E2A8C ; =_027F8878
	str r4, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r4]
	ldr r1, [r0, #0xc]
	str r1, [r4, #8]
	ldr r0, [r0, #0x10]
	bl sub_027E7E48
	add r0, sp, #2
	add r1, sp, #0
	bl sub_027E8104
	cmp r0, #0
	bne _027E2A60
	bl sub_03807380
	mov r1, #0
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E2A80
_027E2A60:
	ldr r0, [r4]
	mov r1, #2
	strh r1, [r0]
	bl sub_03807380
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	bl sub_03807334
_027E2A80:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E2A8C: .word _027F8878
	arm_func_end sub_027E29F0

	arm_func_start sub_027E2A90
sub_027E2A90: ; 0x027E2A90
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	ldr r0, _027E2E5C ; =_027F8878
	mov r4, #0
	ldr r8, [r0, #0x550]
	bl EnableIrqFlag
	ldr r1, [r8, #0xc]
	mov r5, r0
	cmp r1, #1
	bne _027E2AEC
	mov r0, r4
	str r0, [r8, #0xc]
	mov r4, #1
	bl sub_027E5B8C
	bl sub_027E0640
	ldrh r0, [r8]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r8]
	beq _027E2AEC
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r8]
_027E2AEC:
	ldrh r1, [r8]
	add r0, r1, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _027E2B20
	add r0, r8, #0x100
	cmp r1, #7
	moveq sl, #1
	ldrh sb, [r0, #0x82]
	movne sl, #0
	b _027E2B24
_027E2B20:
	mov sb, #0
_027E2B24:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	mov r0, r5
	strh r1, [r8, #0xc2]
	bl SetIrqFlag
	cmp r4, #0
	beq _027E2B5C
	ldr r0, _027E2E60 ; =0x0000FFFF
	bl sub_027E781C
_027E2B5C:
	cmp sl, #0
	movne r0, #0
	strneh r0, [r8, #0xf6]
	cmp sb, #0
	beq _027E2BB8
	mov r7, #0
	add r5, r8, #0x128
	add r4, r8, #0x8a
	mov r6, #1
	mov fp, #6
_027E2B84:
	tst sb, r6, lsl r7
	beq _027E2BAC
	cmp r7, #0
	addeq r2, r4, #0x100
	subne r0, r7, #1
	mlane r2, r0, fp, r5
	mov r1, r7, lsl #0x10
	mov r0, sl
	mov r1, r1, lsr #0x10
	bl sub_027E4A88
_027E2BAC:
	add r7, r7, #1
	cmp r7, #0x10
	blt _027E2B84
_027E2BB8:
	add r0, r8, #0x128
	mov r1, #0
	mov r2, #0x5a
	bl sub_037FE070
	add r0, sp, #0x10
	bl sub_027E2924
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2BE8
	mov r0, #0x308
	bl sub_027E2E70
	b _027E2E50
_027E2BE8:
	ldrh r4, [r0, #6]
	add r0, sp, #0x10
	bl sub_027E286C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2C0C
	mov r0, #0x284
	bl sub_027E2E70
	b _027E2E50
_027E2C0C:
	ldrh r1, [r0, #6]
	cmp r4, #0x20
	bgt _027E2C50
	bge _027E2D24
	cmp r4, #0
	bgt _027E2C2C
	beq _027E2D48
	b _027E2E28
_027E2C2C:
	cmp r4, #0x12
	bgt _027E2E28
	cmp r4, #0x10
	blt _027E2E28
	beq _027E2D68
	cmp r4, #0x11
	cmpne r4, #0x12
	beq _027E2DC0
	b _027E2E28
_027E2C50:
	cmp r4, #0x30
	bgt _027E2C60
	beq _027E2C68
	b _027E2E28
_027E2C60:
	cmp r4, #0x40
	bne _027E2E28
_027E2C68:
	add r0, r1, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _027E2CEC
	add r0, r8, #0x8a
	add r1, sp, #0xa
	add r0, r0, #0x100
	mov r2, #6
	bl sub_037FE12C
	mov r6, #0
	add r5, sp, #0xa
	mov r4, #3
	b _027E2CE0
_027E2CA4:
	add r0, sp, #0x10
	mov r1, r5
	mov r2, r4
	bl sub_027E1FCC
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _027E2CD0
	cmp r0, #7
	cmpne r0, #0xc
	beq _027E2CDC
	b _027E2D24
_027E2CD0:
	mov r0, #3
	strh r0, [r8]
	b _027E2D24
_027E2CDC:
	add r6, r6, #1
_027E2CE0:
	cmp r6, #2
	blt _027E2CA4
	b _027E2D24
_027E2CEC:
	cmp r1, #1
	bne _027E2D24
	add r0, sp, #4
	mov r1, #0xff
	mov r2, #6
	bl sub_037FE070
	add r1, sp, #4
	add r0, sp, #0x10
	mov r2, #3
	bl sub_027E1FCC
	ldrh r0, [r0, #4]
	cmp r0, #0
	moveq r0, #3
	streqh r0, [r8]
_027E2D24:
	add r0, sp, #0x10
	mov r1, #1
	bl sub_027E1D68
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2D48
	mov r0, #0
	bl sub_027E2E70
	b _027E2E50
_027E2D48:
	add r0, sp, #0x10
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2D68
	ldr r0, _027E2E64 ; =0x00000302
	bl sub_027E2E70
	b _027E2E50
_027E2D68:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _027E2DA8
	add r0, sp, #0x10
	mov r1, #1
	bl sub_027E2584
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2D9C
	ldr r0, _027E2E68 ; =0x0000020E
	bl sub_027E2E70
	b _027E2E50
_027E2D9C:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_027E2DA8:
	mov r0, #2
	strh r0, [r8]
	mov r0, #0
	str r0, [r8, #0x198]
	bl sub_027E076C
	b _027E2E38
_027E2DC0:
	cmp r1, #0
	bne _027E2DFC
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	add r0, sp, #0x10
	mov r2, r1
	mov r3, #0x14
	bl sub_027E2938
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2DFC
	ldr r0, _027E2E6C ; =0x00000309
	bl sub_027E2E70
	b _027E2E50
_027E2DFC:
	add r0, sp, #0x10
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E2E1C
	ldr r0, _027E2E64 ; =0x00000302
	bl sub_027E2E70
	b _027E2E50
_027E2E1C:
	mov r0, #2
	strh r0, [r8]
	b _027E2E38
_027E2E28:
	mov r0, #0x308
	mov r1, #0
	bl sub_027E2E70
	b _027E2E50
_027E2E38:
	bl sub_03807380
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E2E50:
	add sp, sp, #0x210
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E2E5C: .word _027F8878
_027E2E60: .word 0x0000FFFF
_027E2E64: .word 0x00000302
_027E2E68: .word 0x0000020E
_027E2E6C: .word 0x00000309
	arm_func_end sub_027E2A90

	arm_func_start sub_027E2E70
sub_027E2E70: ; 0x027E2E70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E2E70

	arm_func_start sub_027E2EA0
sub_027E2EA0: ; 0x027E2EA0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _027E2F4C ; =_027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #2
	beq _027E2ED8
	bl sub_03807380
	mov r1, #2
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E2F40
_027E2ED8:
	add r0, sp, #0
	bl sub_027E2880
	ldrh r5, [r0, #4]
	cmp r5, #0
	beq _027E2F14
	bl sub_03807380
	mov r2, #2
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	strh r5, [r0, #6]
	bl sub_03807334
	b _027E2F40
_027E2F14:
	mov r0, #1
	strh r0, [r4]
	bl sub_0380521C
	mov r0, #0
	strh r0, [r4]
	bl sub_03807380
	mov r1, #2
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E2F40:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E2F4C: .word _027F8878
	arm_func_end sub_027E2EA0

	arm_func_start sub_027E2F50
sub_027E2F50: ; 0x027E2F50
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, _027E3008 ; =_027F8878
	ldr r0, [r0, #4]
	ldr r4, [r1, #0x550]
	mov r2, #0x40
	add r1, r4, #0xe8
	bl sub_037FE12C
	add r0, r4, #0x100
	ldrh r1, [r0, #0x1a]
	ldrh r0, [r0, #0xf4]
	mov r2, #1
	tst r0, r2, lsl r1
	bne _027E2FA4
	bl sub_03807380
	mov r1, #7
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E2FFC
_027E2FA4:
	ldrh r1, [r4, #0xf8]
	add r0, sp, #0
	bl sub_027E2648
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E2FE4
	bl sub_03807380
	mov r1, #7
	strh r1, [r0]
	mov r2, #1
	ldr r1, _027E300C ; =0x00000212
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E2FFC
_027E2FE4:
	bl sub_03807380
	mov r1, #7
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E2FFC:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E3008: .word _027F8878
_027E300C: .word 0x00000212
	arm_func_end sub_027E2F50

	arm_func_start sub_027E3010
sub_027E3010: ; 0x027E3010
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x2b8
	ldr r1, _027E3294 ; =_027F8878
	add r5, sp, #0xb8
	ldr r4, [r1, #0x550]
	ldrh r1, [r4]
	cmp r1, #2
	bne _027E303C
	ldr r1, [r4, #0xc8]
	tst r1, #1
	beq _027E3060
_027E303C:
	bl sub_03807380
	mov r1, #8
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3288
_027E3060:
	add r1, r4, #0x100
	ldrh r2, [r1, #0x1a]
	mov r3, #1
	ldrh ip, [r1, #0xf6]
	mov r2, r3, lsl r2
	ldr r6, [r0, #4]
	tst ip, r2, asr #1
	bne _027E30A4
	bl sub_03807380
	mov r1, #8
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3288
_027E30A4:
	strh r3, [r4, #0xe6]
	mov r0, #0
	strh r0, [r1, #0x88]
	bl EnableIrqFlag
	add r1, r4, #0x100
	mov r2, #0
	strh r2, [r1, #0x82]
	strh r2, [r4, #0x86]
	bl SetIrqFlag
	mov r1, r5
	add r2, r4, #0x100
	mov r3, #1
	mov r0, #8
	strh r3, [r2, #0xee]
	bl sub_027E03D0
	cmp r0, #0
	beq _027E3288
	mov r0, r5
	bl sub_027E28B0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3108
	ldr r0, _027E3298 ; =0x00000303
	bl sub_027E329C
	b _027E3288
_027E3108:
	cmp r6, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	mov r0, r5
	mov r1, r6
	mov r2, #0
	mov r3, #1
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3148
	mov r0, #1
	bl sub_027E329C
	b _027E3288
_027E3148:
	strh r6, [r4, #0xc6]
	add r1, sp, #0x38
	mov r0, #0
	mov r2, #0x80
	add r6, r4, #0xe8
	bl sub_037FDF74
	add r0, sp, #0x38
	mov r1, r6
	bl sub_027E030C
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x20
	bl sub_037FDF74
	ldr r1, [r6, #8]
	mov r0, r5
	strh r1, [sp, #0x18]
	ldr r2, [r6, #8]
	mov r3, #0
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh r5, [r6, #0xc]
	mov r2, #2
	strh r5, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	str r2, [sp]
	ldrh r3, [r6, #0x32]
	mov r2, #3
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldrh r2, [r6, #4]
	add r3, sp, #0x38
	add r2, r2, #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldrh r3, [r6, #0x18]
	mov r1, #0x20
	add r2, sp, #0x18
	bl sub_027E20C0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3204
	mov r0, #9
	bl sub_027E329C
	b _027E3288
_027E3204:
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	ldrh r0, [r6, #0x34]
	movne r1, #0x2a
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E07A0
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	movne r1, #6
	ldrh r0, [r6, #0x36]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E07F0
	bl sub_03807380
	mov r1, #7
	strh r1, [r4]
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	ldrh r1, [r4, #0x30]
	strh r1, [r0, #0x2c]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #0x2e]
	bl sub_03807334
	mov r0, #1
	strh r0, [r4, #0xc2]
_027E3288:
	add sp, sp, #0x2b8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E3294: .word _027F8878
_027E3298: .word 0x00000303
	arm_func_end sub_027E3010

	arm_func_start sub_027E329C
sub_027E329C: ; 0x027E329C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #8
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E329C

	arm_func_start sub_027E32D8
sub_027E32D8: ; 0x027E32D8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x208
	ldr r0, _027E3494 ; =_027F8878
	ldr sl, [r0, #0x550]
	ldrh r0, [sl]
	cmp r0, #7
	beq _027E3310
	bl sub_03807380
	mov r1, #9
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E3488
_027E3310:
	mov r0, #0
	strh r0, [sl, #0xf6]
	mov r8, #1
_027E331C:
	add r0, sl, #0x100
	ldrh r0, [r0, #0x82]
	mov r7, #1
	tst r0, r7, lsl r8
	beq _027E33EC
	add r0, sl, #0x128
	sub r1, r8, #1
	mov r2, #6
	mla r0, r1, r2, r0
	add r1, sp, #0
	bl sub_037FE12C
	mov sb, #0
	add r6, sp, #8
	add r5, sp, #0
	mov r4, #3
	b _027E3388
_027E335C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_027E1FCC
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _027E3390
	cmp r0, #7
	cmpne r0, #0xc
	bne _027E3390
	add sb, sb, #1
_027E3388:
	cmp sb, #2
	blt _027E335C
_027E3390:
	bl EnableIrqFlag
	add r1, sl, #0x100
	ldrh r2, [r1, #0x82]
	tst r2, r7, lsl r8
	beq _027E33E8
	mvn r3, r7, lsl r8
	and r2, r2, r3
	strh r2, [r1, #0x82]
	ldrh r2, [sl, #0x86]
	add r1, sl, r8, lsl #3
	and r2, r2, r3
	strh r2, [sl, #0x86]
	mov r2, #0
	str r2, [r1, #0x738]
	str r2, [r1, #0x73c]
	bl SetIrqFlag
	mov r0, r8, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0
	mov r0, #1
	bl sub_027E4A88
	b _027E33EC
_027E33E8:
	bl SetIrqFlag
_027E33EC:
	add r8, r8, #1
	cmp r8, #0x10
	blt _027E331C
	add r0, sp, #8
	mov r1, #1
	bl sub_027E1D68
	ldrh r1, [r0, #4]
	mov r0, #0
	cmp r1, #0
	beq _027E341C
	bl sub_027E349C
	b _027E3488
_027E341C:
	strh r0, [sl, #0xc2]
	mov r1, #3
	strh r1, [sl]
	add r0, sp, #8
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3448
	ldr r0, _027E3498 ; =0x00000302
	bl sub_027E349C
	b _027E3488
_027E3448:
	mov r0, #2
	strh r0, [sl]
	mov r1, #0
	str r1, [sl, #0x198]
	add r0, sl, #0x100
	strh r1, [r0, #0x96]
	add r0, sl, #0x19c
	mov r2, #0x50
	bl sub_037FE070
	bl sub_027E076C
	bl sub_03807380
	mov r1, #9
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E3488:
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027E3494: .word _027F8878
_027E3498: .word 0x00000302
	arm_func_end sub_027E32D8

	arm_func_start sub_027E349C
sub_027E349C: ; 0x027E349C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #9
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E349C

	arm_func_start sub_027E34D0
sub_027E34D0: ; 0x027E34D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x248
	ldr r1, _027E3820 ; =_027F8878
	add r4, sp, #0x48
	ldr r7, [r1, #0x550]
	ldrh r1, [r7]
	cmp r1, #2
	cmpne r1, #3
	cmpne r1, #5
	beq _027E351C
	bl sub_03807380
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3814
_027E351C:
	ldr r1, [r0, #4]
	add r2, r7, #0x100
	str r1, [r7, #0x184]
	ldrh r5, [r0, #2]
	add r1, sp, #0x10
	strh r5, [r2, #0x90]
	ldrh r6, [r0, #8]
	add r0, r0, #0xa
	mov r2, #6
	bl sub_037FE12C
	ldrh r1, [sp, #0x10]
	ldr r0, _027E3824 ; =0x0000FFFF
	cmp r1, r0
	beq _027E3560
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x10]
_027E3560:
	cmp r5, #0
	bne _027E358C
	bl sub_03807380
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3814
_027E358C:
	add r0, r7, #0x100
	ldrh r0, [r0, #0xf4]
	mov r1, #1
	tst r0, r1, lsl r5
	bne _027E35C4
	bl sub_03807380
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3814
_027E35C4:
	mov r0, #2
	strh r0, [r7, #0xe6]
	mov r0, r4
	bl sub_027E2924
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E35F0
	mov r0, #0x308
	mov r2, #0
	bl sub_027E3D74
	b _027E3814
_027E35F0:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _027E366C
	mov r1, r4
	mov r0, #0xa
	bl sub_027E03D0
	cmp r0, #0
	beq _027E3814
	mov r0, r4
	bl sub_027E28B0
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _027E3634
	ldr r0, _027E3828 ; =0x00000303
	bl sub_027E3D74
	b _027E3814
_027E3634:
	mov r0, #3
	mov r1, #1
	strh r0, [r7]
	mov r0, r4
	mov r3, r1
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _027E3668
	mov r2, #0
	bl sub_027E3D74
	b _027E3814
_027E3668:
	strh r0, [r7, #0xc6]
_027E366C:
	ldr r0, _027E3824 ; =0x0000FFFF
	mov r3, #5
	strh r3, [r7]
	add r1, sp, #0x26
	mov r2, #0x20
	bl sub_037FDF74
	add r0, sp, #0x17
	mov r1, #0
	mov r2, #0xf
	strb r5, [sp, #0x16]
	bl sub_037FE070
	add r1, sp, #0x26
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r0, sp, #0x16
	str r0, [sp, #8]
	ldr r1, _027E382C ; =0x0000011E
	add r2, sp, #0x10
	str r6, [sp, #0xc]
	mov r0, r4
	mov r3, #0
	bl sub_027E1E1C
	mov r4, r0
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _027E36E8
	mov r0, #2
	mov r2, #0
	bl sub_027E3D74
	b _027E3814
_027E36E8:
	bl sub_03807380
	ldrh r1, [r4, #8]
	mov r6, r0
	cmp r1, #0
	bne _027E3720
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _027E380C
_027E3720:
	ldr r1, [r7, #0x184]
	mov r0, #0
	add r1, r1, #0x40
	mov r2, #0x80
	bl sub_037FDF74
	ldrh r2, [r4, #0xa]
	ldr r1, [r7, #0x184]
	add r0, r4, #0xa
	mov r2, r2, lsl #1
	bl sub_037FE12C
	mov r0, #0xa
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r0, [r4, #0x40]
	strh r0, [r6, #0x10]
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl sub_027E3830
	mov r7, r0
	bl sub_027E05D8
	strh r0, [r6, #0x12]
	mov r0, r7
	bl sub_027E3844
	ldrh r1, [r4, #0x14]
	add r0, r4, #0xe
	strh r1, [r6, #0x14]
	add r1, r6, #0xa
	mov r2, #6
	bl sub_037FE12C
	add r0, r4, #0x16
	add r1, r6, #0x16
	mov r2, #0x20
	bl sub_037FDF9C
	ldrh r0, [r4, #0x46]
	strh r0, [r6, #0x36]
	cmp r0, #0x80
	bls _027E37E4
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _027E380C
_027E37E4:
	add r1, r6, #0x38
	mov r0, #0
	mov r2, #0x80
	bl sub_037FDF74
	ldrh r1, [r6, #0x36]
	add r0, r4, #0x4a
	add r2, r1, #1
	add r1, r6, #0x38
	bic r2, r2, #1
	bl sub_037FDF9C
_027E380C:
	mov r0, r6
	bl sub_03807334
_027E3814:
	add sp, sp, #0x248
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027E3820: .word _027F8878
_027E3824: .word 0x0000FFFF
_027E3828: .word 0x00000303
_027E382C: .word 0x0000011E
	arm_func_end sub_027E34D0

	arm_func_start sub_027E3830
sub_027E3830: ; 0x027E3830
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_027E3830

	arm_func_start sub_027E3844
sub_027E3844: ; 0x027E3844
	ldr r2, _027E385C ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_027E385C: .word 0x027FFF98
	arm_func_end sub_027E3844

	arm_func_start sub_027E3860
sub_027E3860: ; 0x027E3860
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	sub sp, sp, #0x400
	ldr r1, _027E3D60 ; =_027F8878
	mov sb, r0
	ldr r8, [r1, #0x550]
	ldrh r0, [r8]
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #5
	beq _027E38B0
	bl sub_03807380
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3D50
_027E38B0:
	ldr r0, [sb, #4]
	add r1, sp, #0x18
	str r0, [r8, #0x184]
	ldrh sl, [sb, #2]
	add r0, r8, #0x100
	strh sl, [r0, #0x90]
	ldrh r3, [sb, #0xa]
	add r0, sb, #0xc
	str r3, [sp, #0x10]
	mov r2, #6
	bl sub_037FE12C
	ldrh r5, [sb, #0x12]
	ldrh fp, [sb, #0x36]
	cmp r5, #2
	beq _027E38F8
	cmp r5, #3
	beq _027E3904
	b _027E3910
_027E38F8:
	mov r6, #1
	mov r5, #0
	b _027E3914
_027E3904:
	mov r6, #1
	mov r5, r6
	b _027E3914
_027E3910:
	mov r6, #0
_027E3914:
	add r1, sp, #0x4e
	add r0, sb, #0x16
	mov r2, #0x20
	ldrh r4, [sb, #0x14]
	bl sub_037FE12C
	ldrh r1, [sp, #0x18]
	ldr r0, _027E3D64 ; =0x0000FFFF
	ldrh r7, [sb, #8]
	cmp r1, r0
	beq _027E3948
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x18]
_027E3948:
	add r0, r8, #0x100
	ldrh r1, [r0, #0xf4]
	mov r0, sl, lsl #0x11
	ands sl, r1, r0, lsr #16
	beq _027E398C
	ldr r0, [r8, #0xc8]
	tst r0, #1
	cmpne r5, #1
	bne _027E398C
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _027E398C
	tst r0, #3
	bne _027E398C
	ldrh r0, [sb, #8]
	cmp r0, #0x40
	bhs _027E39B0
_027E398C:
	bl sub_03807380
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E3D50
_027E39B0:
	mov r0, #2
	strh r0, [r8, #0xe6]
	add r0, sp, #0x70
	bl sub_027E2924
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E39DC
	mov r0, #0x308
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E39DC:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _027E3A5C
	add r1, sp, #0x70
	mov r0, #0x26
	bl sub_027E03D0
	cmp r0, #0
	beq _027E3D50
	add r0, sp, #0x70
	bl sub_027E28B0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3A20
	ldr r0, _027E3D68 ; =0x00000303
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E3A20:
	mov r0, #3
	mov r1, #1
	strh r0, [r8]
	add r0, sp, #0x70
	mov r3, r1
	mov r2, #0
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _027E3A58
	mov r2, r0
	bl sub_027E3D74
	b _027E3D50
_027E3A58:
	strh r0, [r8, #0xc6]
_027E3A5C:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r5, #0
	bne _027E3AAC
	cmp r0, #1
	bne _027E3AE8
	add r0, sp, #0x70
	mov r1, #0
	bl sub_027E2584
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3A9C
	ldr r0, _027E3D6C ; =0x0000020E
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E3A9C:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0xee]
	b _027E3AE8
_027E3AAC:
	cmp r0, #0
	bne _027E3AE8
	add r0, sp, #0x70
	mov r1, #1
	bl sub_027E2584
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3ADC
	ldr r0, _027E3D6C ; =0x0000020E
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E3ADC:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_027E3AE8:
	cmp r6, #1
	bne _027E3B40
	add r0, sp, #0x2e
	mov r1, #0xff
	mov r2, #0x20
	bl sub_037FE070
	cmp fp, #0x20
	bhi _027E3B18
	add r0, sp, #0x2e
	mov r2, fp
	mov r1, #0
	bl sub_037FE070
_027E3B18:
	add r1, sp, #0x2e
	add r0, sp, #0x70
	bl sub_027E2510
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3B40
	ldr r0, _027E3D70 ; =0x0000020D
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E3B40:
	mov r6, #0
	mov r3, #5
	add r0, sp, #0x1e
	mov r1, r6
	mov r2, #0x10
	strh r3, [r8]
	bl sub_037FE070
	mov r3, #1
	add r1, sp, #0x1e
	mov r2, r3
_027E3B68:
	tst sl, r2, lsl r3
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	strneb r3, [r1, r6]
	movne r6, r0, lsr #0x10
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r3, #0xf
	blo _027E3B68
	sub r0, r7, #0x40
	mov r1, #0x42
	bl _u32_div_f
	add r2, sp, #0x4e
	stmia sp, {r2, r5}
	add r1, sp, #0x1e
	str r1, [sp, #8]
	ldr r1, [sp, #0x10]
	sub r5, r7, r0, lsl #1
	str r1, [sp, #0xc]
	add r2, sp, #0x18
	add r0, sp, #0x70
	mov r3, r4
	add r1, r5, #0x5e
	bl sub_027E1E1C
	mov r5, r0
	ldrh r1, [r5, #4]
	cmp r1, #0
	beq _027E3BEC
	mov r0, #2
	mov r2, #1
	bl sub_027E3D74
	b _027E3D50
_027E3BEC:
	bl sub_03807380
	ldrh r1, [r5, #8]
	mov r6, r0
	cmp r1, #0
	bne _027E3C28
	mov r0, #0x26
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r1, [r6, #0xe]
	mov r0, sl, asr #1
	strh r0, [r6, #0xa]
	b _027E3D48
_027E3C28:
	ldr sb, [r8, #0x184]
	mov r2, r7
	mov r1, sb
	mov r0, #0
	add r8, r5, #0xa
	bl sub_037FDF74
	mov r7, #0
	b _027E3D14
_027E3C48:
	ldrh r1, [r8]
	mov r0, r8
	mov r1, r1, lsl #0x11
	mov fp, r1, lsr #0x10
	mov r1, sb
	mov r2, fp
	bl sub_037FE12C
	cmp r4, #0
	beq _027E3CD0
	ldrh r2, [sb, #0xa]
	cmp r2, #0
	moveq r0, #0
	beq _027E3CB4
	cmp r2, #0x20
	movhi r0, #0
	bhi _027E3CB4
	mov r1, #0
	b _027E3CA8
_027E3C90:
	add r0, sb, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #1
	bne _027E3CB4
	add r1, r1, #1
_027E3CA8:
	cmp r1, r2
	blt _027E3C90
	mov r0, #0
_027E3CB4:
	cmp r0, #0
	bne _027E3CD0
	add r0, sp, #0x4e
	add r1, sb, #0xc
	mov r2, #0x20
	strh r4, [sb, #0xa]
	bl sub_037FE12C
_027E3CD0:
	add r0, r6, r7, lsl #2
	str sb, [r0, #0x10]
	ldrh r0, [r8, #2]
	and r0, r0, #0xff
	bl sub_027E3830
	str r0, [sp, #0x14]
	bl sub_027E05D8
	add r1, r6, r7, lsl #1
	strh r0, [r1, #0x50]
	ldr r0, [sp, #0x14]
	bl sub_027E3844
	add sb, sb, fp
	tst sb, #2
	addne r0, sb, #2
	add r8, r8, fp
	bicne sb, r0, #3
	add r7, r7, #1
_027E3D14:
	ldrh r0, [r5, #8]
	cmp r7, r0
	blt _027E3C48
	mov r0, #0x26
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r1, [r5, #8]
	mov r0, sl, asr #1
	strh r1, [r6, #0xe]
	strh r0, [r6, #0xa]
_027E3D48:
	mov r0, r6
	bl sub_03807334
_027E3D50:
	add sp, sp, #0xc8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E3D60: .word _027F8878
_027E3D64: .word 0x0000FFFF
_027E3D68: .word 0x00000303
_027E3D6C: .word 0x0000020E
_027E3D70: .word 0x0000020D
	arm_func_end sub_027E3860

	arm_func_start sub_027E3D74
sub_027E3D74: ; 0x027E3D74
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r5, r1
	bl sub_03807380
	cmp r4, #0
	movne r1, #0x26
	moveq r1, #0xa
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E3D74

	arm_func_start sub_027E3DBC
sub_027E3DBC: ; 0x027E3DBC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _027E3E84 ; =_027F8878
	add r4, sp, #0
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #5
	beq _027E3DF8
	bl sub_03807380
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E3E78
_027E3DF8:
	mov r0, r4
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3E18
	ldr r0, _027E3E88 ; =0x00000302
	bl sub_027E3E90
	b _027E3E78
_027E3E18:
	mov r0, #2
	strh r0, [r5]
	add r0, r5, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _027E3E60
	mov r0, r4
	mov r1, #1
	bl sub_027E2584
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E3E54
	ldr r0, _027E3E8C ; =0x0000020E
	bl sub_027E3E90
	b _027E3E78
_027E3E54:
	add r0, r5, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_027E3E60:
	bl sub_03807380
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E3E78:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E3E84: .word _027F8878
_027E3E88: .word 0x00000302
_027E3E8C: .word 0x0000020E
	arm_func_end sub_027E3DBC

	arm_func_start sub_027E3E90
sub_027E3E90: ; 0x027E3E90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E3E90

	arm_func_start sub_027E3EC4
sub_027E3EC4: ; 0x027E3EC4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x250
	ldr r1, _027E4454 ; =_027F8878
	add r4, sp, #0x50
	ldr r7, [r1, #0x550]
	ldr r5, [r1, #0x54c]
	ldrh r1, [r7]
	mov r6, r0
	cmp r1, #2
	bne _027E3EF8
	ldr r0, [r7, #0xc8]
	tst r0, #1
	beq _027E3F1C
_027E3EF8:
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E4448
_027E3F1C:
	ldr r0, [r6, #4]
	add r1, r5, #0x10
	mov r2, #0xc0
	bl sub_037FE12C
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	blo _027E3F68
	ldrb r0, [r5, #0x5b]
	tst r0, #1
	bne _027E3F68
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0xb
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E4448
_027E3F68:
	ldrh r1, [r5, #0x46]
	add r0, r7, #0x100
	mov r2, #1
	ldrh r0, [r0, #0xf4]
	mov r1, r2, lsl r1
	tst r1, r0
	beq _027E3F90
	rsb r0, r2, #0x2000
	tst r0, r1, asr #1
	bne _027E3FB0
_027E3F90:
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E4448
_027E3FB0:
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03807334
	add r0, r7, #0x100
	ldrh r1, [r0, #0xec]
	cmp r1, #1
	ldrh r1, [r5, #0x3e]
	bne _027E3FF8
	tst r1, #1
	movne r1, #1
	strneh r1, [r0, #0xec]
	moveq r1, #2
	b _027E4008
_027E3FF8:
	tst r1, #2
	movne r1, #2
	strneh r1, [r0, #0xec]
	moveq r1, #1
_027E4008:
	streqh r1, [r0, #0xec]
	ldrh r0, [r5, #0x3c]
	tst r0, #0x20
	movne r1, #1
	add r0, r7, #0x100
	moveq r1, #0
	strh r1, [r0, #0xee]
	ldrh r0, [r5, #0x4c]
	mov r1, r4
	cmp r0, #0
	moveq r0, #3
	movne r0, #2
	strh r0, [r7, #0xe6]
	mov r0, #0xc
	bl sub_027E03D0
	cmp r0, #0
	beq _027E4448
	mov r0, r4
	mov r1, #0
	bl sub_027E2700
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E4074
	ldr r0, _027E4458 ; =0x00000216
	mov r2, #0
	bl sub_027E4468
	b _027E4448
_027E4074:
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	bhs _027E40D0
	ldrh r1, [r5, #0x42]
	cmp r1, #0
	moveq r0, #1
	beq _027E409C
	ldr r0, _027E445C ; =0x00002710
	bl _s32_div_f
	add r0, r0, #1
_027E409C:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	cmp r1, #0xff
	movhi r1, #0xff
	mov r0, r4
	bl sub_027E24B4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E40D0
	ldr r0, _027E4460 ; =0x0000020B
	mov r2, #0
	bl sub_027E4468
	b _027E4448
_027E40D0:
	mov r0, r4
	bl sub_027E28B0
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _027E40F4
	ldr r0, _027E4464 ; =0x00000303
	bl sub_027E4468
	b _027E4448
_027E40F4:
	mov r0, #3
	strh r0, [r7]
	ldr r0, [r6, #0x20]
	mov r3, #1
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r4
	mov r1, r8
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E4140
	mov r0, #1
	mov r2, #0
	bl sub_027E4468
	b _027E4448
_027E4140:
	strh r8, [r7, #0xc6]
	add r1, sp, #0xc
	add r0, r5, #0x10
	mov r2, #0x40
	bl sub_037FE12C
	ldrh r0, [r7, #0xe6]
	cmp r0, #2
	bne _027E419C
	mov r0, #0x20
	strh r0, [sp, #0x16]
	ldr r0, [r5, #0x54]
	add r1, sp, #0x20
	strh r0, [sp, #0x18]
	ldr r2, [r5, #0x54]
	add r0, r6, #8
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh ip, [r5, #0x58]
	mov r3, #0
	mov r2, #0x18
	strh ip, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	bl sub_037FE12C
_027E419C:
	add r2, sp, #0xc
	mov r0, r4
	mov r1, #0x7d0
	bl sub_027E1ED4
	ldrh r1, [r0, #4]
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _027E41D0
	ldrh r2, [r0, #6]
	mov r0, #3
	bl sub_027E4468
	b _027E4448
_027E41D0:
	add r1, r7, #0x8a
	add r0, r0, #8
	add r1, r1, #0x100
	mov r2, #6
	bl sub_037FE12C
	add r0, r7, #0x8a
	add r1, sp, #6
	add r0, r0, #0x100
	mov r2, #6
	bl sub_037FE12C
	ldrh r2, [r6, #0x26]
	add r1, sp, #6
	mov r0, r4
	mov r3, #0x7d0
	bl sub_027E1F4C
	ldrh r1, [r0, #4]
	cmp r1, #0xc
	ldreqh r2, [r0, #6]
	cmpeq r2, #0x13
	bne _027E4240
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E4448
_027E4240:
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _027E4260
	ldrh r2, [r0, #6]
	mov r0, #4
	bl sub_027E4468
	b _027E4448
_027E4260:
	add r0, r7, #0x8a
	add r1, sp, #0
	add r0, r0, #0x100
	mov r2, #6
	bl sub_037FE12C
	add r1, sp, #0
	mov r0, r4
	mov r2, #1
	mov r3, #0x7d0
	bl sub_027E2044
	mov r4, r0
	bl EnableIrqFlag
	ldrh r2, [r4, #4]
	mov r6, r0
	cmp r2, #0xc
	ldreqh r1, [r4, #6]
	cmpeq r1, #0x13
	bne _027E42CC
	bl SetIrqFlag
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03807334
	b _027E4448
_027E42CC:
	cmp r2, #0
	ldreqh r0, [r4, #6]
	cmpeq r0, #0
	beq _027E42F8
	mov r0, r6
	bl SetIrqFlag
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #6]
	mov r0, #6
	bl sub_027E4468
	b _027E4448
_027E42F8:
	ldrh r1, [r4, #8]
	add r0, r7, #0x100
	strh r1, [r0, #0x88]
	ldrh r0, [r5, #0x58]
	add r1, r7, #0x1f8
	strh r0, [r7, #0xba]
	mov r0, #1
	mov r2, #0x10
	bl sub_037FDF74
	ldrh r0, [r5, #0x12]
	and r0, r0, #0xff
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r4, r0, #0xff
	mov r0, r4
	bl sub_027E05D8
	strh r0, [r7, #0xbc]
	mov r0, r4
	bl sub_027E0564
	bl EnableIrqFlag
	add r1, r7, #0x100
	mov r2, #1
	strh r2, [r1, #0x82]
	strh r2, [r7, #0x86]
	ldr r1, [r7, #0x7bc]
	ldr r2, [r7, #0x7b8]
	cmp r1, #0
	mov r4, r0
	cmpeq r2, #0
	beq _027E4388
	bl GetCurrentPlaybackTime
	orr r0, r0, #1
	str r0, [r7, #0x738]
	orr r0, r1, #0
	str r0, [r7, #0x73c]
_027E4388:
	mov r0, #8
	strh r0, [r7]
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #0x2a
	ldrh r0, [r5, #0x5c]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E07A0
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #6
	ldrh r0, [r5, #0x5e]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E07F0
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	strh r0, [r7, #0xc2]
	bl sub_03807380
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, r7, #0x100
	ldrh r2, [r0, #0x88]
	add r1, r7, #0x8a
	strh r2, [r4, #0xa]
	add r0, r1, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_037FE12C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03807334
	mov r0, r6
	bl SetIrqFlag
_027E4448:
	add sp, sp, #0x250
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027E4454: .word _027F8878
_027E4458: .word 0x00000216
_027E445C: .word 0x00002710
_027E4460: .word 0x0000020B
_027E4464: .word 0x00000303
	arm_func_end sub_027E3EC4

	arm_func_start sub_027E4468
sub_027E4468: ; 0x027E4468
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_03807380
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xe]
	bl sub_03807334
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E4468

	arm_func_start sub_027E44A4
sub_027E44A4: ; 0x027E44A4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	add r2, sp, #0
	mov r3, r1, lsl #0x10
	mov r1, #0
	mov r4, r3, lsr #0x10
	bl sub_027E44FC
	cmp r0, #1
	bne _027E44F0
	bl sub_03807380
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	ldrh r1, [sp]
	strh r1, [r0, #0xa]
	bl sub_03807334
_027E44F0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027E44A4

	arm_func_start sub_027E44FC
sub_027E44FC: ; 0x027E44FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x220
	ldr r3, _027E4A80 ; =_027F8878
	ldr r4, [r0, #4]
	movs sl, r1
	ldrne r0, [r0, #8]
	mov r1, r4, lsl #0x10
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov fp, #0
	ldr r7, [r3, #0x550]
	mov r8, r1, lsr #0x10
	ldrh r1, [r7]
	mov r0, r0, lsr #0x10
	cmp r1, #9
	str r2, [sp]
	mov r5, fp
	str r0, [sp, #8]
	cmpne r1, #7
	bne _027E455C
	ldr r0, [r7, #0xc]
	cmp r0, #1
	moveq r5, #1
	b _027E4654
_027E455C:
	cmp r1, #0xa
	cmpne r1, #8
	bne _027E4618
	bl EnableIrqFlag
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _027E45C0
	bl SetIrqFlag
	cmp sl, #0
	bne _027E45B8
	bl sub_03807380
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_03807334
_027E45B8:
	mov r0, #0
	b _027E4A74
_027E45C0:
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _027E45F0
	mov r0, #0
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_027E5B8C
	bl sub_027E0640
	ldrh r0, [r7]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r7]
_027E45F0:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	mov r0, r4
	str r1, [r7, #0x1c]
	bl SetIrqFlag
	b _027E4654
_027E4618:
	cmp sl, #0
	bne _027E464C
	bl sub_03807380
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, fp
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_03807334
_027E464C:
	mov r0, #0
	b _027E4A74
_027E4654:
	ldrh r0, [r7]
	cmp r0, #0xa
	cmpne r0, #8
	bne _027E487C
	add r0, r7, #0x8a
	add r1, sp, #0x1a
	add r0, r0, #0x100
	mov r2, #6
	bl sub_037FE12C
	mov sb, #0
	add r6, sp, #0x1a
	mov r4, #3
	b _027E470C
_027E4688:
	add r0, sp, #0x20
	mov r1, r6
	mov r2, r4
	bl sub_027E1FCC
	ldrh r1, [r0, #4]
	cmp r1, #7
	bgt _027E46C4
	bge _027E46CC
	cmp r1, #1
	bgt _027E46D4
	cmp r1, #0
	blt _027E46D4
	cmpne r1, #1
	beq _027E4714
	b _027E46D4
_027E46C4:
	cmp r1, #0xc
	bne _027E46D4
_027E46CC:
	add sb, sb, #1
	b _027E470C
_027E46D4:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, #0
	beq _027E46F0
	bl sub_027E4B90
	b _027E46F4
_027E46F0:
	bl sub_027E4B4C
_027E46F4:
	cmp r5, #0
	beq _027E4704
	mov r0, #1
	bl sub_027E781C
_027E4704:
	mov r0, #0
	b _027E4A74
_027E470C:
	cmp sb, #2
	blt _027E4688
_027E4714:
	mov r0, #0
	strh r0, [r7, #0xc2]
	mov r0, #3
	mov fp, #1
	strh r0, [r7]
	add r0, sp, #0x20
	mov r1, fp
	bl sub_027E1D68
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E4778
	cmp sl, #0
	mov r2, r8
	mov r0, #0
	mov r3, fp
	beq _027E475C
	bl sub_027E4B90
	b _027E4760
_027E475C:
	bl sub_027E4B4C
_027E4760:
	cmp r5, #0
	beq _027E4770
	mov r0, #1
	bl sub_027E781C
_027E4770:
	mov r0, #0
	b _027E4A74
_027E4778:
	add r0, sp, #0x20
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E47C8
	ldr r0, _027E4A84 ; =0x00000302
	cmp sl, #0
	mov r2, r8
	beq _027E47A8
	mov r3, fp
	bl sub_027E4B90
	b _027E47B0
_027E47A8:
	mov r3, fp
	bl sub_027E4B4C
_027E47B0:
	cmp r5, #0
	beq _027E47C0
	mov r0, #1
	bl sub_027E781C
_027E47C0:
	mov r0, #0
	b _027E4A74
_027E47C8:
	mov r0, #2
	strh r0, [r7]
	mov r1, #0
	str r1, [r7, #0x198]
	add r3, r7, #0x100
	add r0, r7, #0x19c
	mov r2, #0x50
	strh r1, [r3, #0x96]
	bl sub_037FE070
	bl sub_027E076C
	cmp sl, #1
	bne _027E4858
	bl sub_03807380
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	mov r2, #6
	strh r0, [r4, #0xc]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x88]
	add r0, sp, #0x1a
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_037FE12C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03807334
	b _027E4868
_027E4858:
	mov r0, #0
	add r2, sp, #0x1a
	mov r1, r0
	bl sub_027E4A88
_027E4868:
	cmp r5, #0
	beq _027E4A64
	mov r0, #1
	bl sub_027E781C
	b _027E4A64
_027E487C:
	mov r6, #1
	b _027E4A5C
_027E4884:
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	mov r1, #1
	mov sb, r1, lsl r6
	and r0, r0, r8
	tst sb, r0
	beq _027E4A58
	sub r1, r6, #1
	mov r2, #6
	mul r0, r1, r2
	str r0, [sp, #0x10]
	add r0, r7, #0x128
	str r0, [sp, #0xc]
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	add r1, sp, #0x14
	bl sub_037FE12C
	mov r4, #0
	b _027E4948
_027E48E0:
	add r0, sp, #0x20
	add r1, sp, #0x14
	mov r2, #3
	bl sub_027E1FCC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E4950
	cmp r1, #7
	cmpne r1, #0xc
	bne _027E4910
	add r4, r4, #1
	b _027E4948
_027E4910:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, fp
	beq _027E492C
	bl sub_027E4B90
	b _027E4930
_027E492C:
	bl sub_027E4B4C
_027E4930:
	cmp r5, #0
	beq _027E4940
	mov r0, #1
	bl sub_027E781C
_027E4940:
	mov r0, #0
	b _027E4A74
_027E4948:
	cmp r4, #2
	blt _027E48E0
_027E4950:
	bl EnableIrqFlag
	mov r4, r0
	add r1, r7, #0x100
	ldrh r3, [r1, #0x82]
	tst r3, sb
	beq _027E4A54
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov ip, #1
	add r0, r2, r0
	ldr r2, [sp, #4]
	orr r2, fp, ip, lsl r2
	mov r2, r2, lsl #0x10
	mov fp, r2, lsr #0x10
	mvn r2, sb
	and r3, r3, r2
	strh r3, [r1, #0x82]
	ldrh r3, [r7, #0x86]
	mov r1, #0
	and r2, r3, r2
	strh r2, [r7, #0x86]
	ldr r2, [sp, #4]
	add r2, r7, r2, lsl #3
	str r1, [r2, #0x738]
	str r1, [r2, #0x73c]
	mov r2, #6
	bl sub_037FE070
	mov r0, r4
	bl SetIrqFlag
	cmp sl, #1
	bne _027E4A28
	bl sub_03807380
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	ldr r0, [sp, #4]
	mov r2, #6
	strh r0, [r4, #0x10]
	add r0, sp, #0x14
	bl sub_037FE12C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03807334
	b _027E4A3C
_027E4A28:
	mov r0, r6, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0x14
	mov r0, #1
	bl sub_027E4A88
_027E4A3C:
	cmp r5, #0
	beq _027E4A58
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E781C
	b _027E4A58
_027E4A54:
	bl SetIrqFlag
_027E4A58:
	add r6, r6, #1
_027E4A5C:
	cmp r6, #0x10
	blt _027E4884
_027E4A64:
	ldr r0, [sp]
	cmp r0, #0
	strneh fp, [r0]
	mov r0, #1
_027E4A74:
	add sp, sp, #0x220
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E4A80: .word _027F8878
_027E4A84: .word 0x00000302
	arm_func_end sub_027E44FC

	arm_func_start sub_027E4A88
sub_027E4A88: ; 0x027E4A88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _027E4B44 ; =_027F8878
	mov r8, r0
	ldr r5, [r3, #0x550]
	mov r7, r1
	mov r6, r2
	bl sub_03807380
	mov r4, r0
	mov r0, #0
	strh r0, [r4, #2]
	cmp r8, #0
	mov r1, #0x1a
	mov r2, #6
	beq _027E4AF8
	mov r0, #8
	strh r0, [r4]
	strh r1, [r4, #8]
	ldr r0, _027E4B48 ; =0x0000F001
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	strh r7, [r4, #0x10]
	mov r0, r6
	bl sub_037FE12C
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x2c]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x2e]
	b _027E4B34
_027E4AF8:
	mov r0, #0xc
	strh r0, [r4]
	ldr r0, _027E4B48 ; =0x0000F001
	strh r1, [r4, #8]
	strh r0, [r4, #0xc]
	add r0, r5, #0x100
	ldrh r1, [r0, #0x88]
	mov r0, r6
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_037FE12C
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x16]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x18]
_027E4B34:
	mov r0, r4
	bl sub_03807334
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027E4B44: .word _027F8878
_027E4B48: .word 0x0000F001
	arm_func_end sub_027E4A88

	arm_func_start sub_027E4B4C
sub_027E4B4C: ; 0x027E4B4C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_03807380
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_027E4B4C

	arm_func_start sub_027E4B90
sub_027E4B90: ; 0x027E4B90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_03807380
	mov r1, #0x25
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_027E4B90

	arm_func_start sub_027E4BD4
sub_027E4BD4: ; 0x027E4BD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x204
	ldr r1, _027E4F5C ; =_027F8878
	mov sl, r0
	ldr r8, [r1, #0x550]
	ldr fp, [sl, #4]
	ldrh r1, [r8, #0x9c]
	ldr r4, [sl, #8]
	ldr r5, [sl, #0xc]
	ldr r6, [sl, #0x10]
	ldr r0, _027E4F60 ; =_027F7878
	cmp r1, #0
	mov r7, #0
	bne _027E4C58
	ldrh r1, [r8, #0x3c]
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	cmp r6, r1
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	movlo r7, #6
	cmp r1, #0
	ldrneh r1, [r8, #0x3e]
	addne r1, r1, #0x51
	bne _027E4C4C
	ldrh r2, [r8, #0x3e]
	ldrh r1, [r8, #0xf8]
	add r2, r2, #0xc
	mul r1, r2, r1
	add r1, r1, #0x29
_027E4C4C:
	bic r1, r1, #0x1f
	cmp r4, r1
	movlo r7, #6
_027E4C58:
	ldrh r1, [r8, #0xe6]
	cmp r1, #2
	bne _027E4C88
	add r0, r0, #0x1000
	ldr r1, [r0, #0x54c]
	add r0, r8, #0x100
	ldrh r1, [r1, #0x46]
	ldrh r3, [r0, #0xf6]
	mov r2, #1
	mov r0, r2, lsl r1
	tst r3, r0, asr #1
	moveq r7, #6
_027E4C88:
	cmp r7, #0
	beq _027E4CB0
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	strh r7, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03807334
	b _027E4F50
_027E4CB0:
	ldr r0, [r8, #0xc]
	mov r1, #0
	cmp r0, #0
	strne r1, [r8, #0xc]
	movne r1, #1
	cmp r1, #0
	beq _027E4CD4
	ldr r0, _027E4F64 ; =0x0000FFFF
	bl sub_027E781C
_027E4CD4:
	bl sub_027E6370
	bl EnableIrqFlag
	str r0, [sp]
	add r0, sl, #0x14
	mov r1, #0
	bl sub_027E841C
	ldr r0, _027E4F5C ; =_027F8878
	ldr r7, [sl, #0x30]
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	cmp r0, #9
	cmpne r0, #0xa
	beq _027E4DC8
	bl EnableIrqFlag
	tst r7, #4
	ldrneh r2, [sl, #0x38]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x5c]
	cmp r2, #0
	moveq r2, #0x10
	tst r7, #1
	ldrneh r3, [sl, #0x34]
	ldreqh r3, [sb, #0x58]
	cmp r3, #0
	moveq r3, #0x10
	cmp r3, r2
	movhi r3, r2
	tst r7, #2
	ldrneh ip, [sl, #0x36]
	ldreqh ip, [sb, #0x5a]
	strh r2, [r1, #0xc4]
	cmp ip, #0
	moveq ip, #0x10
	cmp ip, r2
	strh r3, [r1, #0xc0]
	movhi ip, r2
	strh ip, [r1, #0xc2]
	ldrsh r1, [sb, #0x62]
	cmp r1, r2
	strgth r2, [sb, #0x62]
	tst r7, #0x200
	ldrneh r2, [sl, #0x3a]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x98]
	tst r7, #0x400
	strh r2, [r1, #0xca]
	ldrneb r2, [sl, #0x3c]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x92]
	tst r7, #0x800
	strh r2, [r1, #0xc6]
	ldrneb r2, [sl, #0x3d]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x94]
	tst r7, #0x1000
	strh r2, [r1, #0xc8]
	ldrneb r2, [sl, #0x3e]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x9a]
	strh r2, [r1, #0xcc]
	bl SetIrqFlag
_027E4DC8:
	ldrh r0, [r8]
	add r0, r0, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _027E4F28
	mov r2, #0
	strh r2, [r8, #0x84]
	strh r2, [r8, #0x5e]
	mov r1, #1
	strh r1, [r8, #0x60]
	strh r2, [r8, #0x88]
	strh r2, [r8, #0x9e]
	mov r0, #0x3c
	strh r0, [r8, #0xa0]
	str r2, [r8, #0x734]
	strh r2, [r8, #0x8a]
	strh r2, [r8, #0x8c]
	strh r2, [r8, #0x8e]
	strh r2, [r8, #0x90]
	strh r2, [r8, #0x66]
	str fp, [r8, #0x74]
	strh r4, [r8, #0x72]
	add r0, fp, r4
	str r0, [r8, #0x78]
	strh r2, [r8, #0x70]
	str r5, [r8, #0x7c]
	strh r6, [r8, #0x80]
	strh r2, [r8, #0x62]
	strh r2, [r8, #0x64]
	strh r2, [r8, #0x68]
	strh r2, [r8, #0x6a]
	rsb r0, r1, #0x10000
	strh r0, [r8, #0xbe]
	strh r1, [r8, #0xc0]
	bl GetCurrentPlaybackTime
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_027E4E68:
	add r0, r8, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _027E4E68
	bl sub_027E06A0
	mov r0, #0
	strh r0, [r8, #0xce]
	bl sub_027E5BA0
	ldrh r0, [r8]
	cmp r0, #8
	moveq r0, #0xa
	streqh r0, [r8]
	beq _027E4EB0
	cmp r0, #7
	moveq r0, #9
	streqh r0, [r8]
_027E4EB0:
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03807334
	mov r1, #1
	ldr r0, [sp]
	str r1, [r8, #0xc]
	bl SetIrqFlag
	add r0, sp, #4
	mov r1, #1
	bl sub_027E2700
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _027E4F50
	bl sub_03807380
	mov r2, #0xe
	strh r2, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r2, #0x208
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E4F50
_027E4F28:
	ldr r0, [sp]
	bl SetIrqFlag
	bl sub_03807380
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03807334
_027E4F50:
	add sp, sp, #0x204
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E4F5C: .word _027F8878
_027E4F60: .word _027F7878
_027E4F64: .word 0x0000FFFF
	arm_func_end sub_027E4BD4

	arm_func_start sub_027E4F68
sub_027E4F68: ; 0x027E4F68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _027E509C ; =_027F8878
	ldr r2, [r0, #0x10]
	ldr sl, [r1, #0x550]
	ldr r5, [r0, #8]
	add r4, sl, #0x100
	ldr r3, [r0, #0x14]
	ldrh r8, [r4, #0x88]
	mov r1, r5, lsl #0x10
	ldrh sb, [r4, #0x82]
	ldr fp, [r0, #4]
	ldr r5, [r0, #0xc]
	cmp r8, #0
	ldr r6, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov r2, r2, lsl #0x10
	mov r0, r2, lsr #0x10
	str r0, [sp, #0x10]
	ldr r0, [sl, #0xc]
	movne r5, #1
	cmp r0, #0
	mov r3, r3, lsl #0x10
	mov r4, r1, lsr #0x10
	mov r1, r3, lsr #0x10
	moveq r8, #3
	beq _027E4FFC
	tst r5, sb
	moveq r8, #0
	beq _027E4FFC
	str fp, [sp]
	stmib sp, {r4, r6, r7}
	ldr r2, [sp, #0x10]
	mov r0, sb
	mov r3, r5
	bl sub_027E73B8
	mov r8, r0
_027E4FFC:
	cmp r8, #2
	beq _027E5090
	bl sub_03807380
	mov r1, #0x81
	strh r1, [r0]
	strh r8, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldr r1, [sp, #0x10]
	cmp r8, #0xa
	strh r1, [r0, #0xa]
	andeq r1, r5, sb
	strh r5, [r0, #0xc]
	movne r1, #0
	strh r1, [r0, #0xe]
	mov r1, #0
	strh r1, [r0, #0x10]
	strh r4, [r0, #0x18]
	str fp, [r0, #0x14]
	str r6, [r0, #0x1c]
	ldr r1, _027E50A0 ; =0x0000FFFF
	str r7, [r0, #0x20]
	strh r1, [r0, #0x1a]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	ldrh r2, [sl, #0x30]
	cmp r1, #0
	ldrh r3, [sl, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x24]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x26]
	bl sub_03807334
_027E5090:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E509C: .word _027F8878
_027E50A0: .word 0x0000FFFF
	arm_func_end sub_027E4F68

	arm_func_start sub_027E50A4
sub_027E50A4: ; 0x027E50A4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldr r0, _027E51B4 ; =_027F8878
	mov r4, #0
	ldr r6, [r0, #0x550]
	ldrh r0, [r6]
	cmp r0, #9
	cmpne r0, #0xa
	beq _027E50E4
	bl sub_03807380
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E51A8
_027E50E4:
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	mov r5, r0
	mov r0, #0
	cmp r1, #1
	str r0, [r6, #0xc]
	moveq r4, #1
	bl sub_027E5B8C
	bl sub_027E0640
	ldrh r0, [r6]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r6]
	beq _027E5128
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r6]
_027E5128:
	mov r0, r5
	bl SetIrqFlag
	add r0, sp, #0
	mov r1, #0
	bl sub_027E2700
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E5154
	ldr r0, _027E51B8 ; =0x00000216
	bl sub_027E51C0
	b _027E51A8
_027E5154:
	add r0, sp, #0
	mov r1, #7
	bl sub_027E23AC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E5178
	mov r0, #0x104
	bl sub_027E51C0
	b _027E51A8
_027E5178:
	mov r0, #0
	strh r0, [r6, #0x8a]
	cmp r4, #0
	beq _027E5190
	ldr r0, _027E51BC ; =0x0000FFFF
	bl sub_027E781C
_027E5190:
	bl sub_03807380
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E51A8:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E51B4: .word _027F8878
_027E51B8: .word 0x00000216
_027E51BC: .word 0x0000FFFF
	arm_func_end sub_027E50A4

	arm_func_start sub_027E51C0
sub_027E51C0: ; 0x027E51C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E51C0

	arm_func_start sub_027E51F4
sub_027E51F4: ; 0x027E51F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027E527C ; =_027F8878
	ldr r2, [r0, #8]
	ldr r4, [r1, #0x550]
	mov r5, r2, lsl #0x10
	ldr r6, [r0, #4]
	mov r7, r5, lsr #0x10
	bl EnableIrqFlag
	str r6, [r4, #0xb0]
	strh r7, [r4, #0xb8]
	add r1, r6, r5, lsr #16
	str r1, [r4, #0xb4]
	mov r1, #0
	strh r1, [r4, #0xae]
	str r1, [r4, #0xa8]
	strh r1, [r4, #0xac]
	str r1, [r4, #0x18]
	mov r1, #0xb
	strh r1, [r4]
	mov r5, r0
	bl sub_03807380
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xe
	strh r1, [r0, #4]
	bl sub_03807334
	mov r1, #1
	mov r0, r5
	str r1, [r4, #0x10]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027E527C: .word _027F8878
	arm_func_end sub_027E51F4

	arm_func_start sub_027E5280
sub_027E5280: ; 0x027E5280
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x230
	ldr r1, _027E5374 ; =_027F8878
	mov r5, r0
	ldr r4, [r1, #0x550]
	add r0, r5, #4
	add r1, r4, #0xa2
	mov r2, #6
	bl sub_037FE12C
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	str r0, [r4, #0xa8]
	ldr r2, [r5, #0x10]
	mov r0, #1
	strh r2, [r4, #0xac]
	str r0, [r4, #0x18]
	mov r0, #0
	mov r2, #0x30
	bl sub_037FDF74
	mov r0, #0
	strh r0, [sp]
	ldr r1, [r5, #0x10]
	add r0, r4, #0x100
	strh r1, [sp, #6]
	ldrh r0, [r0, #0xec]
	add r1, sp, #0x18
	cmp r0, #2
	moveq r3, #0x14
	movne r3, #0xa
	add r0, r5, #4
	mov r2, #6
	strb r3, [sp, #0xe]
	bl sub_037FE12C
	add r1, sp, #0x1e
	add r0, r4, #0xe0
	mov r2, #6
	bl sub_037FE12C
	ldr r2, [r5, #0xc]
	add r0, sp, #0x30
	add r1, sp, #0
	str r2, [sp, #0x2c]
	bl sub_027E2200
	mov r4, r0
	bl sub_03807380
	mov r1, #0x12
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	movne r1, #0x100
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_03807334
	add sp, sp, #0x230
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E5374: .word _027F8878
	arm_func_end sub_027E5280

	arm_func_start sub_027E5378
sub_027E5378: ; 0x027E5378
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r0, _027E5430 ; =_027F8878
	ldr r4, [r0, #0x550]
	bl EnableIrqFlag
	ldrh r1, [r4]
	cmp r1, #0xb
	beq _027E53B8
	bl SetIrqFlag
	bl sub_03807380
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E5424
_027E53B8:
	mov r1, #0
	str r1, [r4, #0x10]
	mov r1, #8
	strh r1, [r4]
	bl SetIrqFlag
	add r0, sp, #0
	mov r1, #7
	bl sub_027E23AC
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E540C
	bl sub_03807380
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x104
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E5424
_027E540C:
	bl sub_03807380
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E5424:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E5430: .word _027F8878
	arm_func_end sub_027E5378

	arm_func_start sub_027E5434
sub_027E5434: ; 0x027E5434
	stmdb sp!, {r3, lr}
	ldr r1, _027E54D8 ; =_027F8878
	ldr r2, [r0, #4]
	ldr r3, [r1, #0x550]
	add r1, r3, #0x100
	strh r2, [r1, #0x96]
	ldrh r1, [r1, #0x96]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _027E5484
_027E545C: ; jump table
	b _027E546C ; case 0
	b _027E5478 ; case 1
	b _027E5478 ; case 2
	b _027E5478 ; case 3
_027E546C:
	mov r1, #0
	str r1, [r3, #0x198]
	b _027E548C
_027E5478:
	mov r1, #1
	str r1, [r3, #0x198]
	b _027E548C
_027E5484:
	mov r1, #0
	str r1, [r3, #0x198]
_027E548C:
	ldr r1, [r3, #0x198]
	mov r2, #0x50
	cmp r1, #1
	bne _027E54AC
	ldr r0, [r0, #8]
	add r1, r3, #0x19c
	bl sub_037FE12C
	b _027E54B8
_027E54AC:
	add r0, r3, #0x19c
	mov r1, #0
	bl sub_037FE070
_027E54B8:
	bl sub_03807380
	mov r1, #0x14
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E54D8: .word _027F8878
	arm_func_end sub_027E5434

	arm_func_start sub_027E54DC
sub_027E54DC: ; 0x027E54DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r1, _027E55D0 ; =_027F8878
	mov r5, r0
	ldr r4, [r1, #0x550]
	ldr r1, [r5, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0x96]
	ldrh r0, [r0, #0x96]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _027E5534
_027E550C: ; jump table
	b _027E551C ; case 0
	b _027E5528 ; case 1
	b _027E5528 ; case 2
	b _027E5528 ; case 3
_027E551C:
	mov r0, #0
	str r0, [r4, #0x198]
	b _027E553C
_027E5528:
	mov r0, #1
	str r0, [r4, #0x198]
	b _027E553C
_027E5534:
	mov r0, #0
	str r0, [r4, #0x198]
_027E553C:
	ldr r0, [r4, #0x198]
	mov r2, #0x50
	cmp r0, #1
	bne _027E555C
	ldr r0, [r5, #8]
	add r1, r4, #0x19c
	bl sub_037FE12C
	b _027E5568
_027E555C:
	add r0, r4, #0x19c
	mov r1, #0
	bl sub_037FE070
_027E5568:
	ldr r1, [r5, #0xc]
	add r0, sp, #0
	strh r1, [r4, #0xc4]
	ldrh r1, [r4, #0xc4]
	bl sub_027E2458
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E55AC
	bl sub_03807380
	mov r2, #0x14
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x208
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
_027E55AC:
	bl sub_03807380
	mov r1, #0x27
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E55D0: .word _027F8878
	arm_func_end sub_027E54DC

	arm_func_start sub_027E55D4
sub_027E55D4: ; 0x027E55D4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _027E56C0 ; =_027F8878
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	str r2, [r4, #0xe8]
	ldr r1, [r0, #8]
	strh r1, [r4, #0xec]
	ldr r1, [r0, #0xc]
	str r1, [r4, #0xf0]
	ldr r1, [r0, #0x10]
	strh r1, [r4, #0xf4]
	ldr r0, [r0, #0x14]
	and r0, r0, #0xff
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xf6]
	tst r0, #2
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfa]
	tst r0, #4
	movne r1, #1
	moveq r1, #0
	tst r0, #8
	strh r1, [r4, #0xfc]
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfe]
	add r0, sp, #0
	add r1, r4, #0xe8
	bl sub_027E030C
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_027E27B8
	mov r4, r0
	bl sub_03807380
	mov r1, #0x18
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	ldrne r1, _027E56C4 ; =0x00000245
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_03807334
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E56C0: .word _027F8878
_027E56C4: .word 0x00000245
	arm_func_end sub_027E55D4

	arm_func_start sub_027E56C8
sub_027E56C8: ; 0x027E56C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_027E26A4
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E5718
	bl sub_03807380
	mov r2, #0x19
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x214
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E5730
_027E5718:
	bl sub_03807380
	mov r1, #0x19
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E5730:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E56C8

	arm_func_start sub_027E573C
sub_027E573C: ; 0x027E573C
	stmdb sp!, {r3, lr}
	bl sub_03807380
	mov r1, #0x1a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027E573C

	arm_func_start sub_027E5760
sub_027E5760: ; 0x027E5760
	stmdb sp!, {r3, lr}
	bl sub_03807380
	mov r1, #0x1b
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027E5760

	arm_func_start sub_027E5784
sub_027E5784: ; 0x027E5784
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldmib r0, {r1, r2, r3}
	ldr r0, [r0, #0x10]
	mov r1, r1, lsl #0x10
	mov r4, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	ldr ip, _027E58A4 ; =_027F8878
	mov r5, r4, lsr #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	ldr r4, [ip, #0x550]
	bl sub_027E25E0
	ldrh r6, [r0, #4]
	cmp r6, #0
	beq _027E57F8
	bl sub_03807380
	mov r2, #0x1d
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x210
	strh r1, [r0, #4]
	strh r6, [r0, #6]
	bl sub_03807334
	b _027E5898
_027E57F8:
	ldr r0, _027E58A8 ; =0x0000FFFF
	cmp r5, r0
	beq _027E584C
	cmp r5, #0
	moveq r1, #1
	moveq r0, #0
	beq _027E5840
	mov r0, #0x64
	mul r2, r5, r0
	ldr r0, _027E58AC ; =0x000082EA
	mov r1, #0
	umull ip, r3, r2, r0
	mla r3, r2, r1, r3
	mov r1, r2, asr #0x1f
	mla r3, r1, r0, r3
	mov r1, ip, lsr #6
	mov r0, r3, lsr #6
	orr r1, r1, r3, lsl #26
_027E5840:
	str r1, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
	b _027E5858
_027E584C:
	mov r0, #0
	str r0, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
_027E5858:
	bl GetCurrentPlaybackTime
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_027E5868:
	add r0, r4, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _027E5868
	bl sub_03807380
	mov r1, #0x1d
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E5898:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E58A4: .word _027F8878
_027E58A8: .word 0x0000FFFF
_027E58AC: .word 0x000082EA
	arm_func_end sub_027E5784

	arm_func_start sub_027E58B0
sub_027E58B0: ; 0x027E58B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x214
	ldr r1, _027E5A4C ; =_027F8878
	mov r7, r0
	ldr r6, [r1, #0x550]
	add r4, sp, #0x14
	ldrh r0, [r6]
	cmp r0, #2
	beq _027E58F0
	bl sub_03807380
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E5A40
_027E58F0:
	mov r0, r4
	bl sub_027E2924
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E5910
	mov r0, #0x308
	bl sub_027E5A58
	b _027E5A40
_027E5910:
	ldrh r1, [r0, #6]
	mov r0, #2
	strh r0, [r6, #0xe6]
	cmp r1, #0x10
	bne _027E5990
	mov r1, r4
	mov r0, #0xa
	bl sub_027E03D0
	cmp r0, #0
	beq _027E5A40
	mov r0, r4
	bl sub_027E28B0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E5958
	ldr r0, _027E5A50 ; =0x00000303
	bl sub_027E5A58
	b _027E5A40
_027E5958:
	mov r0, #3
	mov r1, #1
	strh r0, [r6]
	mov r0, r4
	mov r3, r1
	mov r2, #0
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _027E598C
	bl sub_027E5A58
	b _027E5A40
_027E598C:
	strh r0, [r6, #0xc6]
_027E5990:
	ldrh r8, [r7, #2]
	ldrh sb, [r7, #4]
	ldrh r5, [r7, #6]
	ldrh r7, [r7, #8]
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x10
	bl sub_037FE070
	strb r5, [sp, #4]
	add r0, sp, #4
	str r0, [sp]
	mov r0, r4
	mov r1, r8
	mov r2, sb
	mov r3, r7
	bl sub_027E2180
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E59E8
	mov r0, #0xa
	bl sub_027E5A58
	b _027E5A40
_027E59E8:
	ldrh r1, [r0, #8]
	mov r0, r4
	and r4, r1, #0xff
	mov r1, r1, lsl #8
	mov r5, r1, lsr #0x10
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E5A18
	ldr r0, _027E5A54 ; =0x00000302
	bl sub_027E5A58
	b _027E5A40
_027E5A18:
	mov r0, #2
	strh r0, [r6]
	bl sub_03807380
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_03807334
_027E5A40:
	add sp, sp, #0x214
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027E5A4C: .word _027F8878
_027E5A50: .word 0x00000303
_027E5A54: .word 0x00000302
	arm_func_end sub_027E58B0

	arm_func_start sub_027E5A58
sub_027E5A58: ; 0x027E5A58
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03807380
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E5A58

	arm_func_start sub_027E5A8C
sub_027E5A8C: ; 0x027E5A8C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_027E28DC
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E5AD0
	bl sub_03807380
	mov r2, #0x1f
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x304
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E5AE8
_027E5AD0:
	bl sub_03807380
	mov r1, #0x1f
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E5AE8:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E5A8C

	arm_func_start sub_027E5AF4
sub_027E5AF4: ; 0x027E5AF4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_027E290C
	mov r5, r0
	ldrh r4, [r5, #4]
	cmp r4, #0
	beq _027E5B3C
	bl sub_03807380
	mov r2, #0x20
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x308
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E5B6C
_027E5B3C:
	bl sub_03807380
	mov r4, r0
	mov r0, #0x20
	strh r0, [r4]
	mov r3, #0
	add r0, r5, #8
	add r1, r4, #8
	mov r2, #0xb4
	strh r3, [r4, #2]
	bl sub_037FDF9C
	mov r0, r4
	bl sub_03807334
_027E5B6C:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027E5AF4

	arm_func_start sub_027E5B78
sub_027E5B78: ; 0x027E5B78
	ldr ip, _027E5B84 ; =sub_037FD884
	ldr r0, _027E5B88 ; =_0380B460
	bx ip
	.align 2, 0
_027E5B84: .word sub_037FD884
_027E5B88: .word _0380B460
	arm_func_end sub_027E5B78

	arm_func_start sub_027E5B8C
sub_027E5B8C: ; 0x027E5B8C
	ldr ip, _027E5B98 ; =sub_037FDA38
	ldr r0, _027E5B9C ; =_0380B460
	bx ip
	.align 2, 0
_027E5B98: .word sub_037FDA38
_027E5B9C: .word _0380B460
	arm_func_end sub_027E5B8C

	arm_func_start sub_027E5BA0
sub_027E5BA0: ; 0x027E5BA0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _027E5C40 ; =_027F8878
	ldr r0, _027E5C44 ; =_0380B460
	ldr r4, [r1, #0x550]
	ldrh r1, [r4, #0xe6]
	cmp r1, #1
	bne _027E5BF0
	ldr r1, [r0]
	cmp r1, #0
	beq _027E5BD0
	bl sub_037FDA38
_027E5BD0:
	ldr r0, _027E5C44 ; =_0380B460
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _027E5C48 ; =sub_027E5F8C
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_037FD898
	b _027E5C34
_027E5BF0:
	cmp r1, #2
	bne _027E5C34
	mov r1, #0
	str r1, [r4, #0x1c]
	ldr r1, [r0]
	cmp r1, #0
	beq _027E5C10
	bl sub_037FDA38
_027E5C10:
	ldr r0, _027E5C44 ; =_0380B460
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _027E5C4C ; =sub_027E5C50
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_037FD898
	mov r0, #0
	str r0, [r4, #0xd8]
_027E5C34:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E5C40: .word _027F8878
_027E5C44: .word _0380B460
_027E5C48: .word sub_027E5F8C
_027E5C4C: .word sub_027E5C50
	arm_func_end sub_027E5BA0

	arm_func_start sub_027E5C50
sub_027E5C50: ; 0x027E5C50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _027E5D8C ; =_027F8878
	ldr r2, _027E5D90 ; =0x0380FFF0
	ldr r0, [r1, #0x550]
	ldrh r3, [r2]
	str r3, [r0, #0xd0]
	ldr r2, [r0, #0xd4]
	cmp r2, r3
	beq _027E5D30
	str r3, [r0, #0xd4]
	ldr r1, [r1, #0x550]
	ldr r3, _027E5D94 ; =0x048080F8
	ldr r2, [r1, #0xd0]
	mov r2, r2, lsl #6
	str r2, [r1, #0xd0]
	ldrh r2, [r3]
	ldrh lr, [r3, #2]
	ldrh r4, [r3]
	cmp r2, r4
	ldrhih lr, [r3, #2]
	ldr r3, _027E5D98 ; =0x04000006
	ldr r2, _027E5D9C ; =0x00000107
	ldrh ip, [r3]
	ldr r3, _027E5DA0 ; =0x003FFFC0
	sub ip, r2, ip
	orr lr, r4, lr, lsl #16
	ldr r2, [r1, #0xd0]
	and lr, lr, r3
	rsb ip, ip, ip, lsl #7
	add ip, ip, lr, lsl #1
	and lr, r3, ip, lsr #1
	cmp r2, lr
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	bhi _027E5D30
	mov ip, #1
	b _027E5D20
_027E5CE8:
	ldr r2, [r1, #0xd0]
	add r2, r2, #0x4b
	add r3, r2, #0x4100
	str r3, [r1, #0xd0]
	cmp r3, lr
	bls _027E5D1C
	ldr r2, _027E5DA4 ; =0x0000400E
	sub r3, r3, lr
	cmp r3, r2
	str r3, [r1, #0xd8]
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	b _027E5D30
_027E5D1C:
	add ip, ip, #1
_027E5D20:
	cmp ip, #0x1e
	blt _027E5CE8
	mov r2, #0
	str r2, [r1, #0xd8]
_027E5D30:
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	bls _027E5D5C
	ldr r0, _027E5DA8 ; =_0380B460
	mov r1, #0xd0
	mov ip, #2
	ldr r3, _027E5DAC ; =sub_027E5DB4
	add r2, r1, #0x37
	str ip, [sp]
	bl sub_037FD898
	b _027E5D80
_027E5D5C:
	mov r2, #1
	str r2, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _027E5DA8 ; =_0380B460
	ldr r3, _027E5DB0 ; =sub_027E5E74
	rsb r2, r2, #0x108
	bl sub_037FD898
_027E5D80:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E5D8C: .word _027F8878
_027E5D90: .word 0x0380FFF0
_027E5D94: .word 0x048080F8
_027E5D98: .word 0x04000006
_027E5D9C: .word 0x00000107
_027E5DA0: .word 0x003FFFC0
_027E5DA4: .word 0x0000400E
_027E5DA8: .word _0380B460
_027E5DAC: .word sub_027E5DB4
_027E5DB0: .word sub_027E5E74
	arm_func_end sub_027E5C50

	arm_func_start sub_027E5DB4
sub_027E5DB4: ; 0x027E5DB4
	stmdb sp!, {r3, lr}
	ldr r1, _027E5E60 ; =0x04000006
	ldr r0, _027E5E64 ; =_027F8878
	ldrh ip, [r1]
	ldr r0, [r0, #0x550]
	cmp ip, #0xd0
	blt _027E5E2C
	cmp ip, #0xd2
	bge _027E5E2C
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	blo _027E5E2C
	mov r3, #1
	b _027E5E04
_027E5DEC:
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	add r1, r1, #0x7f
	cmp r2, r1
	blo _027E5E0C
	add r3, r3, #1
_027E5E04:
	cmp r3, #7
	blt _027E5DEC
_027E5E0C:
	ldr r1, _027E5E60 ; =0x04000006
	rsb r2, r3, #1
	add r2, ip, r2
	strh r2, [r1]
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	sub r1, r2, r1
	str r1, [r0, #0xd8]
_027E5E2C:
	ldr r1, [r0, #0xd8]
	ldr r2, _027E5E68 ; =0x00000107
	cmp r1, #0x7f
	movhs r1, #0
	strhs r1, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _027E5E6C ; =_0380B460
	ldr r3, _027E5E70 ; =sub_027E5E74
	bl sub_037FD898
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E5E60: .word 0x04000006
_027E5E64: .word _027F8878
_027E5E68: .word 0x00000107
_027E5E6C: .word _0380B460
_027E5E70: .word sub_027E5E74
	arm_func_end sub_027E5DB4

	arm_func_start sub_027E5E74
sub_027E5E74: ; 0x027E5E74
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _027E5F78 ; =_027F8878
	ldr r4, [r0, #0x550]
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _027E5F6C
	ldr r0, _027E5F7C ; =_0380B460
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _027E5F80 ; =sub_027E5C50
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_037FD898
	ldr r0, [r4, #0x7bc]
	ldr r1, [r4, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _027E5F68
	bl GetCurrentPlaybackTime
	ldr r3, [r4, #0x73c]
	ldr ip, [r4, #0x738]
	cmp r3, #0
	cmpeq ip, #0
	orr lr, r1, #0
	orr r1, r0, #1
	mov r0, #0
	beq _027E5F68
	ldr r2, [r4, #0x7b8]
	subs ip, r1, ip
	ldr r1, [r4, #0x7bc]
	sbc r3, lr, r3
	cmp r3, r1
	cmpeq ip, r2
	bls _027E5F68
	str r0, [r4, #0x738]
	str r0, [r4, #0x73c]
	bl sub_027E0700
	movs r1, r0
	moveq r0, #0
	beq _027E5F34
	mov r0, #0x25
	str r0, [r1]
	ldr r3, _027E5F84 ; =0x00008001
	mov r2, #0
	ldr r0, _027E5F88 ; =_027F7900
	stmib r1, {r2, r3}
	bl sub_037FC6D4
_027E5F34:
	cmp r0, #0
	bne _027E5F6C
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E5F6C
_027E5F68:
	bl sub_027E6090
_027E5F6C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E5F78: .word _027F8878
_027E5F7C: .word _0380B460
_027E5F80: .word sub_027E5C50
_027E5F84: .word 0x00008001
_027E5F88: .word _027F7900
	arm_func_end sub_027E5E74

	arm_func_start sub_027E5F8C
sub_027E5F8C: ; 0x027E5F8C
	stmdb sp!, {r3, lr}
	ldr r0, _027E602C ; =_027F8878
	ldr r0, [r0, #0x550]
	ldrh r1, [r0, #0xdc]
	cmp r1, #0x3c
	blo _027E5FC8
	ldr r2, _027E6030 ; =0x04000006
	ldrh r1, [r2]
	cmp r1, #0xcb
	blt _027E5FD0
	cmp r1, #0xd2
	strlth r1, [r2]
	movlt r1, #0
	strlth r1, [r0, #0xdc]
	b _027E5FD0
_027E5FC8:
	add r1, r1, #1
	strh r1, [r0, #0xdc]
_027E5FD0:
	ldr r1, _027E6030 ; =0x04000006
	ldr r2, _027E6034 ; =0x048080F8
	ldrh lr, [r1]
	ldrh r1, [r2]
	ldrh r3, [r2, #2]
	ldrh ip, [r2]
	cmp r1, ip
	ldrhih r3, [r2, #2]
	ldr r1, _027E6038 ; =0x0380FFF0
	orr r3, ip, r3, lsl #16
	rsb r2, lr, lr, lsl #7
	rsb r2, r2, r3, lsl #1
	mov r3, r2, lsr #7
	strh r3, [r1]
	mov r2, #5
	str r2, [sp]
	ldrsh r1, [r0, #0x40]
	ldr r0, _027E603C ; =_0380B460
	ldr r3, _027E6040 ; =sub_027E6044
	rsb r2, r2, #0x10c
	bl sub_037FD898
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E602C: .word _027F8878
_027E6030: .word 0x04000006
_027E6034: .word 0x048080F8
_027E6038: .word 0x0380FFF0
_027E603C: .word _0380B460
_027E6040: .word sub_027E6044
	arm_func_end sub_027E5F8C

	arm_func_start sub_027E6044
sub_027E6044: ; 0x027E6044
	stmdb sp!, {r3, lr}
	ldr r0, _027E6084 ; =_027F8878
	ldr r0, [r0, #0x550]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _027E607C
	ldr r0, _027E6088 ; =_0380B460
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _027E608C ; =sub_027E5F8C
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_037FD898
	bl sub_027E6090
_027E607C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E6084: .word _027F8878
_027E6088: .word _0380B460
_027E608C: .word sub_027E5F8C
	arm_func_end sub_027E6044

	arm_func_start sub_027E6090
sub_027E6090: ; 0x027E6090
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027E6138 ; =_027F8878
	ldr r4, _027E613C ; =_027F7878
	ldr r5, [r0, #0x550]
	bl EnableIrqFlag
	ldrh r1, [r5, #0xce]
	cmp r1, #1
	bne _027E60B8
	bl SetIrqFlag
	b _027E6130
_027E60B8:
	mov r1, #1
	strh r1, [r5, #0xce]
	bl SetIrqFlag
	bl sub_027E0700
	movs r1, r0
	moveq r0, #0
	beq _027E60E8
	mov r3, #0x1c
	add r0, r4, #0x88
	mov r2, #0
	str r3, [r1]
	bl sub_037FC6D4
_027E60E8:
	cmp r0, #0
	bne _027E6130
	mov r0, #0
	strh r0, [r5, #0xce]
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _027E6130
	bl sub_03807380
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x1c
	strh r1, [r0, #6]
	bl sub_03807334
_027E6130:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E6138: .word _027F8878
_027E613C: .word _027F7878
	arm_func_end sub_027E6090

	arm_func_start sub_027E6140
sub_027E6140: ; 0x027E6140
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027E62D8 ; =_027F8878
	mov r1, #0
	ldr r4, [r0, #0x550]
	mov r2, #1
	strh r1, [r4, #0xce]
	strh r2, [r4, #0x88]
	ldrh r0, [r4, #0xc0]
	sub r0, r0, #1
	strh r0, [r4, #0xc0]
	ldrh r0, [r4, #0xc0]
	cmp r0, #0
	bne _027E61AC
	ldrh r1, [r4, #0xbe]
	rsb r0, r2, #0x10000
	cmp r1, r0
	moveq r0, #4
	streqh r0, [r4, #0xbe]
	ldrh r0, [r4, #0xbe]
	and r0, r0, #0xff
	bl sub_027E0520
	bl sub_027E059C
	strh r0, [r4, #0xbc]
	ldr r1, _027E62DC ; =0x0000FFFF
	mov r0, #1
	strh r1, [r4, #0xbe]
	strh r0, [r4, #0xc0]
_027E61AC:
	ldrh r0, [r4]
	cmp r0, #9
	bne _027E629C
	bl EnableIrqFlag
	add r1, r4, #0x100
	ldrh r1, [r1, #0x82]
	cmp r1, #0
	bne _027E61DC
	mov r1, #0
	strh r1, [r4, #0x62]
	bl SetIrqFlag
	b _027E62D0
_027E61DC:
	ldrsh r2, [r4, #0x62]
	mov r3, #1
	cmp r2, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r3, #0
	cmp r2, #0
	movlt r1, #0
	strlth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrsh r2, [r4, #0x62]
	ldrsh r1, [r1, #0xc2]
	add r1, r2, r1
	strh r1, [r4, #0x62]
	ldrsh r1, [r4, #0x62]
	cmp r1, #0x100
	movgt r1, #0x100
	strgth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrh r1, [r1, #0xc4]
	cmp r3, #0
	strh r1, [r4, #0x64]
	beq _027E6250
	ldrsh r1, [r4, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r5, #1
	bgt _027E6254
_027E6250:
	mov r5, #0
_027E6254:
	bl SetIrqFlag
	cmp r5, #0
	beq _027E6268
	ldr r0, _027E62DC ; =0x0000FFFF
	bl sub_027E6920
_027E6268:
	add r0, r4, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #1
	ldreqh r0, [r4, #0xa0]
	subeq r0, r0, #1
	streqh r0, [r4, #0xa0]
	ldreqh r0, [r4, #0xa0]
	cmpeq r0, #0
	moveq r0, #1
	streqh r0, [r4, #0x9e]
	moveq r0, #0x3c
	streqh r0, [r4, #0xa0]
	b _027E62D0
_027E629C:
	cmp r0, #0xa
	bne _027E62D0
	mov r5, #0
	bl EnableIrqFlag
	ldr r1, [r4, #0x734]
	cmp r1, #1
	movne r1, r5
	movne r5, #1
	strneh r1, [r4, #0x60]
	bl SetIrqFlag
	cmp r5, #1
	bne _027E62D0
	bl sub_027E6428
_027E62D0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E62D8: .word _027F8878
_027E62DC: .word 0x0000FFFF
	arm_func_end sub_027E6140

	arm_func_start sub_027E62E0
sub_027E62E0: ; 0x027E62E0
	stmdb sp!, {r3, lr}
	ldr r1, _027E6310 ; =_027F8878
	ldr r1, [r1, #0x550]
	ldrh r1, [r1]
	cmp r1, #9
	bne _027E6308
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E6920
_027E6308:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E6310: .word _027F8878
	arm_func_end sub_027E62E0

	arm_func_start sub_027E6314
sub_027E6314: ; 0x027E6314
	stmdb sp!, {r3, lr}
	ldr r0, _027E6338 ; =_027F8878
	ldr r0, [r0, #0x550]
	ldrh r0, [r0]
	cmp r0, #0xa
	bne _027E6330
	bl sub_027E6428
_027E6330:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E6338: .word _027F8878
	arm_func_end sub_027E6314

	arm_func_start sub_027E633C
sub_027E633C: ; 0x027E633C
	stmdb sp!, {r3, lr}
	ldr r1, _027E636C ; =_027F8878
	ldr r1, [r1, #0x550]
	ldrh r1, [r1]
	cmp r1, #9
	bne _027E6364
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E72C8
_027E6364:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E636C: .word _027F8878
	arm_func_end sub_027E633C

	arm_func_start sub_027E6370
sub_027E6370: ; 0x027E6370
	stmdb sp!, {r4, lr}
	ldr r0, _027E6420 ; =_027F8878
	ldr r4, [r0, #0x550]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_037FC888
	add r1, r4, #0x2f8
	mov r0, #0
	mov r2, #0x400
	bl sub_037FDF74
	mov r3, #0
_027E639C:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r4, r3, lsl #5
	mov r3, r0, lsr #0x10
	add r0, r1, #0x200
	strh r3, [r0, #0xf8]
	cmp r3, #0x1f
	blo _027E639C
	ldr r2, _027E6424 ; =0x0000FFFF
	add r0, r4, r3, lsl #5
	add r0, r0, #0x200
	strh r2, [r0, #0xf8]
	add r0, r4, #0x600
	mov ip, #0
	strh ip, [r0, #0xf8]
	strh r3, [r0, #0xfa]
_027E63DC:
	add r1, r4, ip, lsl #2
	add r0, r1, #0x700
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	add r0, r1, #0x600
	add r1, ip, #1
	strh r2, [r0, #0xfc]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	strh r2, [r0, #0xfe]
	cmp ip, #4
	blo _027E63DC
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E6420: .word _027F8878
_027E6424: .word 0x0000FFFF
	arm_func_end sub_027E6370

	arm_func_start sub_027E6428
sub_027E6428: ; 0x027E6428
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x260
	ldr r1, _027E6918 ; =_027F8878
	ldr fp, [r1, #0x550]
	add r0, fp, #0x100
	ldrh r0, [r0, #0x82]
	cmp r0, #0
	beq _027E690C
	mov r0, #1
	strh r0, [fp, #0x8a]
	str r0, [sp, #0x14]
	mov r0, #0
	strh r0, [sp, #0x5c]
	ldr r8, [r1, #0x550]
	add r1, sp, #0x5c
	ldrh sb, [r8, #0x38]
	str r1, [sp, #0x34]
	add r1, sb, #0x1f
	ldrh r2, [r8, #0x80]
	bic r1, r1, #0x1f
	ldr r7, [r8, #0x7c]
	cmp r2, r1
	blt _027E68B8
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0x10
	bhs _027E68B8
	ldrh r1, [r8]
	cmp r1, #9
	beq _027E64AC
	cmp r1, #0xa
	streq r0, [sp, #0x14]
	bne _027E68B8
_027E64AC:
	ldr r0, [sp, #0x34]
	mov r6, #0
	strh r6, [r0]
	mov r0, #1
	cmp sb, #0
	strlt r0, [sp, #0x14]
	blt _027E68B8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _027E64EC
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	strne r6, [sp, #0x18]
	b _027E64F0
_027E64EC:
	str r6, [sp, #0x18]
_027E64F0:
	add r0, r8, #0x31c
	mov r1, #0
	str r1, [sp, #0xc]
	mov r1, #1
	add r0, r0, #0x400
	str r1, [sp, #0x10]
	bl sub_037FC888
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _027E6530
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	mov r0, #1
	str r0, [sp, #0x14]
	b _027E68B8
_027E6530:
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x1c]
	mov r5, #0
	b _027E6894
_027E6548:
	add r0, r8, #0x30c
	add r0, r0, #0x400
	mov r1, r5, lsl #2
	ldrh sl, [r0, r1]
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x20]
	add r0, r8, #0x2fc
	add r0, r0, #0x400
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x28]
	ldr r0, _027E691C ; =0x0000FFFF
	str r0, [sp, #0x2c]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	add r0, r8, #0x100
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x2c]
	sub r0, r0, #0x8000
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x48]
	add r0, r8, #0x700
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	b _027E687C
_027E65C0:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #8]
	tst r2, r1, lsl r0
	bne _027E6840
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #8]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	and r1, r0, r1
	str r1, [sp, #0x30]
	beq _027E660C
	bics r1, r1, #1
	bne _027E6840
_027E660C:
	ldr r1, [sp, #8]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #4]
	moveq r1, #0
	streq r1, [sp, #4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x3c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp]
	moveq r0, #0
	streq r0, [sp]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _027E6840
	ldr r0, [sp, #0x10]
	cmp r0, #0
	streq r7, [sp, #0x34]
	moveq r0, #0
	streqh r0, [r7], #2
	ldr r0, [sp, #0x34]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x34]
	addeq r6, r6, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r7
	subeq sb, sb, #2
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #4]
	add r6, r6, r1
	cmp r0, #1
	bic r0, r1, #1
	add r7, r7, r0
	sub sb, sb, r1
	bne _027E6774
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _027E6760
	ldr r0, [sp, #0x40]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_027E6760:
	ldr r0, [sp, #0x44]
	add r6, r6, #2
	and r0, r2, r0
	strh r0, [r7], #2
	sub sb, sb, #2
_027E6774:
	ldr r0, [sp]
	cmp r0, #1
	bne _027E67A4
	ldr r0, [sp, #0x34]
	add r6, r6, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x34]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r7], #2
_027E67A4:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x2c]
	ldreq r0, [sp, #0x20]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x28]
	strh r1, [r0]
	ldr r0, [sp, #0x38]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x48]
	cmp r1, r0
	ldreq r0, [sp, #0x24]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x1c]
	strneh sl, [r0, r1]
	ldr r0, [sp, #8]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0xc]
	and r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x30]
	ldr sl, [sp, #0x2c]
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x4c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _027E68A4
_027E6840:
	ldr r0, [sp, #0x50]
	str sl, [sp, #0x2c]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x28]
	ldreq r0, [sp, #0x20]
	streq r0, [sp, #0x28]
	ldr r0, [sp, #0x54]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x20]
	ldreqh sl, [r0]
_027E687C:
	ldr r0, [sp, #0x58]
	cmp sl, r0
	beq _027E6890
	cmp sb, #2
	bgt _027E65C0
_027E6890:
	add r5, r5, #1
_027E6894:
	cmp r5, #4
	bhs _027E68A4
	cmp sb, #2
	bgt _027E6548
_027E68A4:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	mov r0, #0
	str r0, [sp, #0x14]
_027E68B8:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [fp, #0x8a]
	beq _027E690C
	ldr r0, [fp, #0x1c]
	mov r1, r6, lsl #0x10
	cmp r0, #1
	ldreqh r0, [sp, #0x5c]
	mov r1, r1, lsr #0x10
	orreq r0, r0, #0x8000
	streqh r0, [sp, #0x5c]
	ldrh r2, [sp, #0x5c]
	ldr r3, [fp, #0x7c]
	add r0, sp, #0x60
	bl sub_027E22AC
	ldrh r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #8
	movne r0, #0
	strneh r0, [fp, #0x8a]
_027E690C:
	add sp, sp, #0x260
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E6918: .word _027F8878
_027E691C: .word 0x0000FFFF
	arm_func_end sub_027E6428

	arm_func_start sub_027E6920
sub_027E6920: ; 0x027E6920
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c8
	ldr r1, _027E72B8 ; =_027F8878
	str r0, [sp, #0x18]
	ldr r7, [r1, #0x550]
	bl EnableIrqFlag
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	ldrh r4, [r7, #0x86]
	str r1, [sp, #0x74]
	bl SetIrqFlag
	mov r1, #0
	strh r1, [sp, #0xc4]
	ldrh r0, [r7, #0x88]
	cmp r0, #1
	ldreq r0, _027E72BC ; =0x0000FFFF
	streq r0, [sp, #0x18]
	streqh r1, [r7, #0x88]
	ldrh r0, [r7, #0x9e]
	cmp r0, #0
	bne _027E7208
	ldr r1, _027E72B8 ; =_027F8878
	ldrh r0, [r7, #0x3a]
	ldr r8, [r1, #0x550]
	str r0, [sp, #0x24]
	add r0, sp, #0xc4
	ldrh sb, [r8, #0x38]
	str r0, [sp, #0x70]
	add r0, sb, #0x1f
	ldrh r1, [r8, #0x80]
	bic r0, r0, #0x1f
	cmp r1, r0
	ldr r6, [r8, #0x7c]
	movlt r0, #1
	blt _027E6E48
	add r0, r8, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0x10
	movhs r0, #1
	bhs _027E6E48
	ldrh r0, [r8]
	cmp r0, #9
	moveq r0, #1
	streq r0, [sp, #0x48]
	beq _027E69EC
	cmp r0, #0xa
	moveq r0, #0
	streq r0, [sp, #0x48]
	beq _027E69EC
	mov r0, #1
	b _027E6E48
_027E69EC:
	ldr r0, [sp, #0x70]
	mov r5, #0
	mov sl, r5
	mov fp, r5
	strh r5, [r0]
	cmp sb, #0
	movlt r0, #1
	blt _027E6E48
	ldr r0, [sp, #0x48]
	str r4, [sp, #0x50]
	cmp r0, #0
	mov r0, #1
	str r0, [sp, #0x4c]
	beq _027E6A40
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	ldrne r0, [sp, #0x74]
	strne r5, [sp, #0x4c]
	strne r0, [sp, #0x50]
	b _027E6A44
_027E6A40:
	str r5, [sp, #0x4c]
_027E6A44:
	ldr r0, [sp, #0x18]
	and r4, r4, r0
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC888
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _027E6A88
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	mov r0, #1
	b _027E6E48
_027E6A88:
	mvn r0, r4
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x54]
	mov r0, #0
	str r0, [sp, #0x58]
	b _027E6E20
_027E6AAC:
	ldr r0, [sp, #0x58]
	mov r2, r0, lsl #2
	add r0, r8, #0x30c
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	ldrh sl, [r1, r2]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x5c]
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x64]
	ldr r0, _027E72BC ; =0x0000FFFF
	str r0, [sp, #0x68]
	str r0, [sp, #0x78]
	str r0, [sp, #0x8c]
	add r0, r8, #0x100
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x68]
	sub r0, r0, #0x8000
	str r0, [sp, #0x94]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0x98]
	add r0, r8, #0x700
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0xa0]
	str r0, [sp, #0xa4]
	str r0, [sp, #0xa8]
	b _027E6E00
_027E6B30:
	ldr r0, [sp, #0x54]
	ldr r2, [sp, #0x40]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #0x28]
	tst r2, r1, lsl r0
	bne _027E6DC4
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	ldr r0, [sp, #0x28]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0x40]
	ldrh r0, [r4, #6]
	ldr r1, [sp, #0x50]
	and r1, r0, r1
	str r1, [sp, #0x6c]
	beq _027E6B88
	mov r2, r1
	ldr r1, [sp, #0x2c]
	tst r2, r1
	bne _027E6DC4
_027E6B88:
	ldr r1, [sp, #0x28]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #0x20]
	moveq r1, #0
	streq r1, [sp, #0x20]
	ldr r1, [sp, #0x48]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x8c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp, #0x1c]
	moveq r0, #0
	streq r0, [sp, #0x1c]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x44]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp, #0x1c]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _027E6DC4
	ldr r0, [sp, #0x44]
	cmp r0, #0
	streq r6, [sp, #0x70]
	moveq r0, #0
	streqh r0, [r6], #2
	ldr r0, [sp, #0x70]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x70]
	addeq fp, fp, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r6
	subeq sb, sb, #2
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #0x20]
	add fp, fp, r1
	cmp r0, #1
	bic r0, r1, #1
	add r6, r6, r0
	sub sb, sb, r1
	bne _027E6CF0
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _027E6CDC
	ldr r0, [sp, #0x90]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_027E6CDC:
	ldr r0, [sp, #0x94]
	add fp, fp, #2
	and r0, r2, r0
	strh r0, [r6], #2
	sub sb, sb, #2
_027E6CF0:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _027E6D20
	ldr r0, [sp, #0x70]
	add fp, fp, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x70]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r6], #2
_027E6D20:
	ldr r0, [sp, #0x44]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x44]
	ldr r0, [sp, #0x5c]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x68]
	ldreq r0, [sp, #0x5c]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x64]
	strh r1, [r0]
	ldr r0, [sp, #0x78]
	strh r0, [r4]
	ldr r0, [sp, #0x60]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x98]
	cmp r1, r0
	ldreq r0, [sp, #0x60]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x54]
	strneh sl, [r0, r1]
	ldr r0, [sp, #0x28]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0x40]
	and r0, r0, r1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x60]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x6c]
	ldr sl, [sp, #0x68]
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #4]
	orr r5, r5, r0
	ldr r0, [sp, #0x9c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _027E6E34
_027E6DC4:
	ldr r0, [sp, #0xa0]
	str sl, [sp, #0x68]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x64]
	ldreq r0, [sp, #0x5c]
	streq r0, [sp, #0x64]
	ldr r0, [sp, #0xa4]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x5c]
	ldreqh sl, [r0]
_027E6E00:
	ldr r0, [sp, #0xa8]
	cmp sl, r0
	beq _027E6E14
	cmp sb, #2
	bgt _027E6B30
_027E6E14:
	ldr r0, [sp, #0x58]
	add r0, r0, #1
	str r0, [sp, #0x58]
_027E6E20:
	ldr r0, [sp, #0x58]
	cmp r0, #4
	bhs _027E6E34
	cmp sb, #2
	bgt _027E6AAC
_027E6E34:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	mov sl, fp
	bl sub_037FC90C
	mov r0, #0
_027E6E48:
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r7, #0x62]
	streqh r0, [r7, #0x64]
	beq _027E72AC
	add r0, r7, #0x700
	ldrh r1, [r0, #0xc6]
	ldr r0, [sp, #0x24]
	cmp r1, #1
	add r4, r0, #2
	ldrne r5, [sp, #0x18]
	ldr r0, [sp, #0x74]
	and r5, r5, r0
	mov r0, r5
	bl sub_03803830
	ldr r1, [sp, #0x24]
	add r1, r1, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _027E71C8
	ldr r0, _027E72B8 ; =_027F8878
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	add r8, sb, #0x2f8
	cmp r0, #9
	moveq r4, #1
	beq _027E6ECC
	cmp r0, #0xa
	bne _027E71B8
	mov r4, #0
_027E6ECC:
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_037FC888
	ldr r0, [sb, #0x734]
	cmp r0, #0
	bne _027E6EF4
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	b _027E71B8
_027E6EF4:
	cmp r4, #0
	moveq r0, #1
	streq r0, [sp, #0x3c]
	beq _027E6F18
	bl EnableIrqFlag
	add r1, sb, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x3c]
	bl SetIrqFlag
_027E6F18:
	mov r0, r5, lsl #0x10
	mvn r0, r0, lsr #16
	str r0, [sp, #0x30]
	mov sl, #0
_027E6F28:
	ldr r0, _027E72BC ; =0x0000FFFF
	add fp, sb, #0x600
	str r0, [sp, #0x38]
	add r0, sb, #0x2fc
	add r1, r0, #0x400
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	ldr r0, [sp, #0x38]
	add r6, r1, sl, lsl #2
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x7c]
	str r0, [sp, #0x80]
	str r0, [sp, #0x84]
	str r0, [sp, #0x88]
	str r0, [sp, #0xac]
	str r0, [sp, #0xb0]
	add r0, sb, #0x100
	str r0, [sp, #0xb4]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
	str r0, [sp, #0xc0]
	b _027E7144
_027E6F88:
	add r4, r8, r5, lsl #5
	ldrh r1, [r4, #0xa]
	ldr r0, [sp, #0x30]
	ldrh r2, [r4, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [sp, #0x3c]
	and r0, r1, r0
	strh r0, [r4, #6]
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _027E7058
	ldrh r0, [r4, #2]
	tst r0, #8
	ldreqh r0, [r4, #0x12]
	cmpeq r0, #0
	beq _027E7058
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r4, #0x12]
	ldrh r1, [r4]
	ldr r0, [sp, #0xac]
	cmp r1, r0
	ldreq r0, [sp, #0x7c]
	streqh r0, [r6, #2]
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0xb0]
	cmp r1, r0
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x80]
	strh r0, [r4]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #0x34]
	ldrne r0, [sp, #0x38]
	movne r0, r0, lsl #5
	strneh r5, [r8, r0]
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x38]
	b _027E7140
_027E7058:
	bl sub_03807380
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r4, #6]
	ldr r3, [sp, #0xb4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r4, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r4, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r4, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0xb4]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03807334
	ldrh r1, [r4]
	ldr r0, [sp, #0xb8]
	cmp r1, r0
	ldreq r0, [sp, #0x84]
	streqh r0, [r6, #2]
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x88]
	strh r0, [r4]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0xbc]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r8, r0]
	strh r5, [fp, #0xfa]
_027E7140:
	ldrh r5, [r6]
_027E7144:
	ldr r0, [sp, #0xc0]
	cmp r5, r0
	bne _027E6F88
	ldr r2, _027E72BC ; =0x0000FFFF
	ldr r0, [sp, #0x38]
	cmp r0, r2
	beq _027E7198
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x38]
	ldrh r3, [r1, #0xc]
	mov r0, r0, lsl #5
	strh r3, [r8, r0]
	ldrh r0, [r1, #0xe]
	cmp r0, r2
	ldreq r0, [sp, #0x38]
	streqh r0, [r1, #0xe]
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x34]
	strh r0, [r1, #0xc]
_027E7198:
	add sl, sl, #1
	cmp sl, #4
	blt _027E6F28
	add r0, sb, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [sb, #0x734]
	bl sub_037FC90C
_027E71B8:
	mov r0, #0
	strh r0, [r7, #0x62]
	strh r0, [r7, #0x64]
	b _027E72AC
_027E71C8:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	movne r6, #0
	bne _027E7248
	ldrh r3, [r7, #0x40]
	mov r0, sl
	mov r1, r4
	mov r2, r5
	bl sub_027E7C14
	ldrh r1, [sp, #0xc4]
	mov r6, r0
	orr r0, r1, #0x8000
	strh r0, [sp, #0xc4]
	b _027E7248
_027E7208:
	mov r6, #0
	strh r6, [r7, #0x9e]
	ldrh r0, [sp, #0xc4]
	ldr r5, [sp, #0x74]
	bic r0, r0, #0x8000
	strh r0, [sp, #0xc4]
	mov sl, r6
	ldr r4, _027E72C0 ; =0x000080D6
	bl EnableIrqFlag
	ldrsh r1, [r7, #0x62]
	add r1, r1, #1
	strh r1, [r7, #0x62]
	ldrsh r1, [r7, #0x64]
	add r1, r1, #1
	strh r1, [r7, #0x64]
	bl SetIrqFlag
_027E7248:
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp]
	ldr r0, _027E72C4 ; =0x048080F8
	str r6, [sp, #4]
	ldrh r1, [r0]
	mov r0, sl, lsl #0x10
	str r1, [sp, #8]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	ldrh r0, [sp, #0xc4]
	mov r3, r4, lsl #0x10
	str r0, [sp, #0x10]
	ldr r2, [r7, #0x7c]
	mov r1, #0
	str r2, [sp, #0x14]
	add r0, sp, #0xc8
	mov r2, r1
	mov r3, r3, lsr #0x10
	bl sub_027E2314
	strh r5, [r7, #0x68]
	ldrh r0, [sp, #0xc4]
	strh r0, [r7, #0x6a]
	strh r4, [r7, #0x6c]
	strh sl, [r7, #0x6e]
_027E72AC:
	add sp, sp, #0x2c8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E72B8: .word _027F8878
_027E72BC: .word 0x0000FFFF
_027E72C0: .word 0x000080D6
_027E72C4: .word 0x048080F8
	arm_func_end sub_027E6920

	arm_func_start sub_027E72C8
sub_027E72C8: ; 0x027E72C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x218
	ldr r1, _027E73AC ; =_027F8878
	mov r4, r0
	ldr r7, [r1, #0x550]
	bl EnableIrqFlag
	bl SetIrqFlag
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	ldr r1, _027E73B0 ; =0x048080F8
	and r4, r4, r0
	ldrh r8, [r7, #0x3a]
	mov r0, r4
	ldrh r5, [r1]
	ldrh r6, [r7, #0x6a]
	bl sub_03803830
	add r1, r8, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _027E7334
	mov r0, #2
	bl sub_037FC468
	bl sub_027E1A54
	b _027E73A0
_027E7334:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	bicne r6, r6, #0x8000
	movne r0, #0
	bne _027E7368
	ldrh r0, [r7, #0x6e]
	ldrh r1, [r7, #0x6c]
	ldrh r3, [r7, #0x40]
	mov r2, r4
	bl sub_027E7C14
	orr r6, r6, #0x8000
_027E7368:
	mov r1, r4, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r2, #0
	mov r0, r6, lsl #0x10
	str r2, [sp, #0xc]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x10]
	ldr r1, _027E73B4 ; =0x0000800C
	add r0, sp, #0x18
	mov r3, r2
	str r2, [sp, #0x14]
	bl sub_027E2314
_027E73A0:
	add sp, sp, #0x218
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027E73AC: .word _027F8878
_027E73B0: .word 0x048080F8
_027E73B4: .word 0x0000800C
	arm_func_end sub_027E72C8

	arm_func_start sub_027E73B8
sub_027E73B8: ; 0x027E73B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _027E74E4 ; =_027F8878
	ldrh r8, [sp, #0x24]
	ldr r4, [r4, #0x550]
	mov r7, r0
	add r0, r4, #0x30c
	add r0, r0, #0x400
	cmp r8, #0
	add sb, r0, r1, lsl #2
	mov r6, r2
	mov r5, r3
	add r8, r4, #0x2f8
	moveq r0, #6
	beq _027E74DC
	ldrh r0, [sp, #0x24]
	tst r6, #8
	movne r1, #2
	moveq r1, #0
	add r0, r0, r1
	cmp r0, #0x204
	movgt r0, #6
	bgt _027E74DC
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_037FC888
	add r2, r4, #0x600
	ldrh r1, [r2, #0xf8]
	ldr r3, _027E74E8 ; =0x0000FFFF
	cmp r1, r3
	bne _027E7444
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	mov r0, #0xa
	b _027E74DC
_027E7444:
	mov r0, r1, lsl #5
	ldrh ip, [r8, r0]
	add r0, r8, r1, lsl #5
	strh ip, [r2, #0xf8]
	ldrh ip, [r2, #0xfa]
	cmp ip, r1
	streqh r3, [r2, #0xfa]
	strh r6, [r0, #2]
	strh r5, [r0, #4]
	and r2, r5, r7
	strh r2, [r0, #6]
	mov r2, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r3, [sp, #0x20]
	ldrh r2, [sp, #0x24]
	str r3, [r0, #0x14]
	strh r2, [r0, #0xe]
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldr r3, _027E74E8 ; =0x0000FFFF
	add r2, r4, #0x700
	strh r3, [r0]
	strh r3, [r0, #0x10]
	ldrh r2, [r2, #0xca]
	strh r2, [r0, #0x12]
	ldrh r0, [sb, #2]
	cmp r0, r3
	streqh r1, [sb]
	movne r0, r0, lsl #5
	strneh r1, [r8, r0]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	strh r1, [sb, #2]
	bl sub_037FC90C
	mov r0, #2
_027E74DC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027E74E4: .word _027F8878
_027E74E8: .word 0x0000FFFF
	arm_func_end sub_027E73B8

	arm_func_start sub_027E74EC
sub_027E74EC: ; 0x027E74EC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	ldr r2, _027E7814 ; =_027F8878
	str r0, [sp]
	ldr r8, [r2, #0x550]
	mov r5, r1
	ldrh r1, [r8]
	mov r0, #0
	cmp r1, #9
	add r4, r8, #0x2f8
	str r0, [sp, #0xc]
	moveq r6, #1
	beq _027E752C
	cmp r1, #0xa
	moveq r6, r0
	bne _027E7808
_027E752C:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC888
	ldr r0, [r8, #0x734]
	cmp r0, #0
	bne _027E7558
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	mov r0, #0
	b _027E7808
_027E7558:
	cmp r6, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _027E757C
	bl EnableIrqFlag
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x10]
	bl SetIrqFlag
_027E757C:
	mvn r0, r5
	str r0, [sp, #4]
	mov sl, #0
_027E7588:
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr sb, _027E7818 ; =0x0000FFFF
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	add r0, r8, #0x100
	str sb, [sp, #8]
	add r6, r1, sl, lsl #2
	str sb, [sp, #0x14]
	str sb, [sp, #0x18]
	str sb, [sp, #0x1c]
	str sb, [sp, #0x20]
	str sb, [sp, #0x24]
	str sb, [sp, #0x28]
	str r0, [sp, #0x2c]
	str sb, [sp, #0x30]
	add fp, r8, #0x600
	str sb, [sp, #0x34]
	str sb, [sp, #0x38]
	b _027E779C
_027E75D8:
	ldr r0, [sp]
	add r7, r4, r5, lsl #5
	cmp r0, #0
	bne _027E7614
	ldrh r1, [r7, #0xa]
	ldr r0, [sp, #4]
	ldrh r2, [r7, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r7, #8]
	ldrh r0, [r7, #8]
	ldrh r1, [r7, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r7, #6]
_027E7614:
	ldrh r1, [r7, #6]
	ldr r0, [sp, #0x10]
	and r0, r1, r0
	strh r0, [r7, #6]
	mov r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	cmp r0, #0
	beq _027E76B0
	ldrh r0, [r7, #2]
	tst r0, #8
	ldreqh r0, [r7, #0x12]
	cmpeq r0, #0
	beq _027E76B0
	mov r0, #1
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r7, #0x12]
	ldrh r1, [r7]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	ldreq r0, [sp, #0x14]
	streqh r0, [r6, #2]
	ldr r0, [sp, #0x28]
	cmp sb, r0
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x18]
	strh r0, [r7]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #8]
	movne r0, sb, lsl #5
	strneh r5, [r4, r0]
	mov r0, r5, lsl #0x10
	mov sb, r0, lsr #0x10
	b _027E7798
_027E76B0:
	bl sub_03807380
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r7, #6]
	ldr r3, [sp, #0x2c]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r7, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r7, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r7, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r7, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r7, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r7, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r7, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [r8, #0x30]
	cmp r3, #0
	ldrh r2, [r8, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x2c]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03807334
	ldrh r1, [r7]
	ldr r0, [sp, #0x30]
	cmp r1, r0
	ldreq r0, [sp, #0x1c]
	streqh r0, [r6, #2]
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x20]
	strh r0, [r7]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0x34]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r4, r0]
	strh r5, [fp, #0xfa]
_027E7798:
	ldrh r5, [r6]
_027E779C:
	ldr r0, [sp, #0x38]
	cmp r5, r0
	bne _027E75D8
	ldr r1, _027E7818 ; =0x0000FFFF
	cmp sb, r1
	beq _027E77E4
	add r0, r8, sl, lsl #2
	add r0, r0, #0x700
	ldrh r3, [r0, #0xc]
	mov r2, sb, lsl #5
	strh r3, [r4, r2]
	ldrh r2, [r0, #0xe]
	cmp r2, r1
	streqh sb, [r0, #0xe]
	add r0, r8, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #8]
	strh r0, [r1, #0xc]
_027E77E4:
	add sl, sl, #1
	cmp sl, #4
	blt _027E7588
	add r0, r8, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [r8, #0x734]
	bl sub_037FC90C
	ldr r0, [sp, #0xc]
_027E7808:
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E7814: .word _027F8878
_027E7818: .word 0x0000FFFF
	arm_func_end sub_027E74EC

	arm_func_start sub_027E781C
sub_027E781C: ; 0x027E781C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _027E7A08 ; =_027F8878
	mvn r2, r0
	ldr sb, [r1, #0x550]
	add r0, sb, #0x100
	ldrh r1, [r0, #0x82]
	add r0, sb, #0x31c
	add r0, r0, #0x400
	add r5, sb, #0x2f8
	and fp, r2, r1
	bl sub_037FC888
	add r0, sb, #0x30c
	add r0, r0, #0x400
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
_027E7860:
	add r0, sb, #0x100
	str r0, [sp, #0x10]
	mov r6, #0
	add r4, sb, #0x600
_027E7870:
	ldr r0, [sp, #8]
	mov r1, r6, lsl #2
	add r7, r0, r6, lsl #2
	ldrh sl, [r0, r1]
	ldr r0, _027E7A0C ; =0x0000FFFF
	str r7, [sp, #4]
	str r0, [sp]
	b _027E79C4
_027E7890:
	add r8, r5, sl, lsl #5
	ldrh r0, [r8, #6]
	and r0, r0, fp
	strh r0, [r8, #6]
	ldrh r0, [r8, #0xa]
	and r0, r0, fp
	strh r0, [r8, #0xa]
	ldrh r0, [r8, #6]
	cmp r0, #0
	bne _027E7998
	bl sub_03807380
	mov r1, #0x81
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r8, #2]
	ldr r3, [sp, #0x10]
	strh r1, [r0, #0xa]
	ldrh r1, [r8, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r8, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r8, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r8, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r8, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r8, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r8, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r8, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03807334
	ldrh r1, [r8]
	ldr r0, _027E7A0C ; =0x0000FFFF
	cmp r1, r0
	ldreq r0, [sp]
	streqh r0, [r7, #2]
	ldrh r1, [r8]
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, _027E7A0C ; =0x0000FFFF
	strh r0, [r8]
	ldrh r1, [r4, #0xfa]
	cmp r1, r0
	streqh sl, [r4, #0xf8]
	movne r0, r1, lsl #5
	strneh sl, [r5, r0]
	strh sl, [r4, #0xfa]
	ldr sl, [sp]
_027E7998:
	ldr r0, _027E7A0C ; =0x0000FFFF
	str sl, [sp]
	cmp sl, r0
	addne r0, r5, sl, lsl #5
	strne r0, [sp, #4]
	ldr r0, _027E7A0C ; =0x0000FFFF
	streq r7, [sp, #4]
	cmp sl, r0
	movne r0, sl, lsl #5
	ldrneh sl, [r5, r0]
	ldreqh sl, [r7]
_027E79C4:
	ldr r0, _027E7A0C ; =0x0000FFFF
	cmp sl, r0
	bne _027E7890
	add r6, r6, #1
	cmp r6, #4
	blt _027E7870
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #2
	blt _027E7860
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_037FC90C
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E7A08: .word _027F8878
_027E7A0C: .word 0x0000FFFF
	arm_func_end sub_027E781C

	arm_func_start sub_027E7A10
sub_027E7A10: ; 0x027E7A10
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _027E7C0C ; =_027F8878
	ldr r1, [sp, #0x40]
	ldr r5, [r4, #0x550]
	movs sb, r3
	str r1, [sp, #0x40]
	mov sl, r0
	str r2, [sp]
	beq _027E7BFC
	cmp sb, #0x204
	bhi _027E7BFC
	add r4, r5, #0x100
	ldrh r0, [r4, #0x88]
	cmp sl, r0
	beq _027E7BFC
	cmp sl, #0x10
	bhs _027E7BFC
	tst sb, #1
	bne _027E7BFC
	add r0, r5, #0x1f8
	add r8, r0, sl, lsl #4
	mov r0, #1
	str r0, [sp, #8]
	b _027E7BF4
_027E7A78:
	ldr r0, [sp, #8]
	ldr r7, _027E7C10 ; =0x0000FFFF
	cmp r0, #1
	addeq r1, sp, #0x34
	moveq r0, #0
	ldrne r1, [sp]
	streq r0, [sp, #8]
	movne r0, r1
	addne r0, r0, #2
	ldrh r1, [r1]
	strne r0, [sp]
	mov r0, r1, lsl #0x18
	subne sb, sb, #2
	movs r6, r0, lsr #0x17
	moveq r6, #0x200
	tst r1, #0x1000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x800
	movne r3, #1
	moveq r3, #0
	cmp r2, #0
	movne fp, #2
	moveq fp, #0
	cmp r3, #0
	movne r0, #2
	moveq r0, #0
	add r0, r6, r0
	add r0, r0, fp
	subs sb, sb, r0
	bmi _027E7BFC
	and r1, r1, #0xf00
	cmp r3, #1
	mov r1, r1, lsl #8
	ldr r3, [sp]
	mov fp, r1, lsr #0x10
	ldr r1, [sp]
	add r0, r3, r0
	str r1, [sp, #4]
	add r1, r1, r6
	str r0, [sp]
	bne _027E7B5C
	mov r0, fp, lsl #0x1d
	mov r0, r0, lsr #0x1c
	ldrh r3, [r8, r0]
	ldrh r7, [r1], #2
	tst r3, #1
	movne r3, r7, lsl #1
	strneh r3, [r8, r0]
	bne _027E7B5C
	mov r7, r7, lsl #1
	sub r3, r3, r7
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x100
	blo _027E7BF4
	strh r7, [r8, r0]
_027E7B5C:
	cmp r2, #1
	bne _027E7B78
	ldrh r2, [r1]
	ldrh r1, [r4, #0x88]
	mov r0, #1
	tst r2, r0, lsl r1
	beq _027E7BF4
_027E7B78:
	cmp r6, #0
	ble _027E7BF4
	bl sub_03807380
	mov r1, #0x82
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x15
	strh r1, [r0, #4]
	ldr r1, [sp, #0x40]
	strh fp, [r0, #6]
	str r1, [r0, #8]
	ldr r1, [sp, #4]
	str r1, [r0, #0xc]
	strh r6, [r0, #0x10]
	strh sl, [r0, #0x12]
	ldrh r1, [r4, #0x88]
	strh r1, [r0, #0x20]
	strh r7, [r0, #0x1a]
	ldrh r1, [r4, #0x88]
	ldrh r2, [r5, #0x30]
	cmp r1, #0
	ldrh r3, [r5, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x40]
	ldrh r1, [r4, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x42]
	bl sub_03807334
_027E7BF4:
	cmp sb, #0
	bgt _027E7A78
_027E7BFC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_027E7C0C: .word _027F8878
_027E7C10: .word 0x0000FFFF
	arm_func_end sub_027E7A10

	arm_func_start sub_027E7C14
sub_027E7C14: ; 0x027E7C14
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r0
	tst r6, #0x8000
	ldrne r0, _027E7CB0 ; =0x00007FFF
	mov r4, r3
	andne r6, r6, r0
	addeq r0, r6, #0x1c
	moveq r0, r0, lsl #2
	addeq r6, r0, #0x66
	mov r0, r2
	bl sub_03803830
	mul r2, r6, r0
	ldr r1, _027E7CB4 ; =0x04000006
	add r0, r5, #0x22
	mov r3, r0, lsl #2
	ldrh r1, [r1]
	sub r0, r4, #2
	add r3, r3, #0x60
	add r2, r2, #0x388
	add r4, r3, r2
	subs r3, r0, r1
	bpl _027E7C7C
_027E7C70:
	add r0, r3, #7
	adds r3, r0, #0x100
	bmi _027E7C70
_027E7C7C:
	ldr r2, _027E7CB8 ; =0x66666667
	rsb r1, r3, r3, lsl #7
	mov r0, r1, lsr #0x1f
	smull r1, r3, r2, r1
	add r3, r0, r3, asr #3
	mov r0, #0xa
	mul r0, r3, r0
	cmp r0, r4
	movlo r3, #0
	mov r0, r3, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E7CB0: .word 0x00007FFF
_027E7CB4: .word 0x04000006
_027E7CB8: .word 0x66666667
	arm_func_end sub_027E7C14

	arm_func_start sub_027E7CBC
sub_027E7CBC: ; 0x027E7CBC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _027E7D48 ; =_027F8878
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	add r0, sp, #0
	strh r2, [r4, #0xf6]
	add r1, r4, #0xe8
	bl sub_027E030C
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_027E27B8
	mov r4, r0
	bl sub_03807380
	mov r1, #0x21
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _027E7D38
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r1, #0x244
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_027E7D38:
	bl sub_03807334
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E7D48: .word _027F8878
	arm_func_end sub_027E7CBC

	arm_func_start sub_027E7D4C
sub_027E7D4C: ; 0x027E7D4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x208
	add r1, sp, #0
	add r0, r0, #4
	mov r2, #6
	bl sub_037FE12C
	mov r8, #0
	add r7, sp, #8
	add r6, sp, #0
	mov r5, #0x13
	b _027E7DA8
_027E7D78:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_027E1FCC
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _027E7DB0
	cmp r0, #7
	cmpne r0, #0xc
	bne _027E7DB0
	add r8, r8, #1
_027E7DA8:
	cmp r8, #2
	blt _027E7D78
_027E7DB0:
	bl sub_03807380
	mov r1, #0x22
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _027E7DE8
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #5
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_027E7DE8:
	bl sub_03807334
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_027E7D4C

	arm_func_start sub_027E7DF8
sub_027E7DF8: ; 0x027E7DF8
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #4]
	ldr r1, _027E7E44 ; =_027F8878
	str r3, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r3]
	ldr r1, [r0, #0xc]
	str r1, [r3, #8]
	ldr r0, [r0, #0x10]
	bl sub_027E7E48
	bl sub_03807380
	mov r1, #3
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E7E44: .word _027F8878
	arm_func_end sub_027E7DF8

	arm_func_start sub_027E7E48
sub_027E7E48: ; 0x027E7E48
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _027E7FE8 ; =_027F8878
	mov r8, r0
	ldr r7, [r1, #0x550]
	ldr r4, [r1, #0x54c]
	mov r5, #0
	bl EnableIrqFlag
	ldr r1, [r7, #0xc]
	mov r6, r0
	cmp r1, #1
	bne _027E7E88
	mov r0, r5
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_027E5B8C
	bl sub_027E0640
_027E7E88:
	add ip, r7, #0x100
	mov r1, #0
	strh r1, [ip, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	str r1, [r7, #0x1c]
	strh r1, [r7, #0xce]
	strh r1, [r7, #0xc2]
	mov r0, #1
	strh r0, [r7, #0x58]
	strh r0, [r7, #0x5a]
	mov r0, #6
	strh r0, [r7, #0x5c]
	strh r1, [r7, #0x98]
	strh r1, [r7, #0x92]
	strh r1, [r7, #0x94]
	strh r1, [r7, #0x9a]
	strh r1, [r7, #0x9c]
	ldrh r0, [r7, #0x58]
	add r3, r7, #0x700
	strh r0, [r3, #0xc0]
	ldrh r2, [r7, #0x5a]
	add r0, r7, #0x19c
	strh r2, [r3, #0xc2]
	ldrh lr, [r7, #0x5c]
	mov r2, #0x50
	strh lr, [r3, #0xc4]
	ldrh lr, [r7, #0x98]
	strh lr, [r3, #0xca]
	ldrh lr, [r7, #0x92]
	strh lr, [r3, #0xc6]
	ldrh lr, [r7, #0x94]
	strh lr, [r3, #0xc8]
	ldrh lr, [r7, #0x9a]
	strh lr, [r3, #0xcc]
	str r1, [r7, #0x198]
	strh r1, [ip, #0x96]
	bl sub_037FE070
	bl sub_027E076C
	mov r0, #0x104
	strh r0, [r7, #0x40]
	mov r0, #0xf0
	strh r0, [r7, #0x42]
	mov r0, #0x3e8
	strh r0, [r7, #0x44]
	mov r1, #0
	ldr r0, _027E7FEC ; =0x0000020B
	strh r1, [r7, #0x46]
	str r0, [r7, #0x48]
	str r1, [r7, #0x4c]
	str r1, [r7, #0x50]
	str r1, [r7, #0x54]
	strh r1, [r7, #0xc6]
	add r0, r7, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
	mov r0, r6
	str r8, [r7, #0xc8]
	bl SetIrqFlag
	cmp r5, #0
	beq _027E7F88
	ldr r0, _027E7FF0 ; =0x0000FFFF
	bl sub_027E781C
_027E7F88:
	mov r2, #0
	mov r1, #0x8000
_027E7F90:
	add r0, r4, r2, lsl #4
	add r2, r2, #1
	str r1, [r0, #0xd0]
	cmp r2, #0x20
	blt _027E7F90
	add r1, r7, #0x1f8
	mov r0, #1
	mov r2, #0x100
	bl sub_037FDF74
	bl sub_027E1C9C
	add r0, r7, #0x31c
	add r0, r0, #0x400
	bl sub_037FC870
	bl sub_027E5B78
	tst r8, #2
	bne _027E7FD8
	mov r0, #0xf
	bl sub_0380521C
_027E7FD8:
	mov r0, #1
	strh r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027E7FE8: .word _027F8878
_027E7FEC: .word 0x0000020B
_027E7FF0: .word 0x0000FFFF
	arm_func_end sub_027E7E48

	arm_func_start sub_027E7FF4
sub_027E7FF4: ; 0x027E7FF4
	stmdb sp!, {r4, lr}
	ldr r0, _027E8058 ; =_027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _027E8028
	bl sub_03807380
	mov r1, #4
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E8050
_027E8028:
	mov r0, #1
	bl sub_0380521C
	mov r0, #0
	strh r0, [r4]
	bl sub_03807380
	mov r1, #4
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E8050:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E8058: .word _027F8878
	arm_func_end sub_027E7FF4

	arm_func_start sub_027E805C
sub_027E805C: ; 0x027E805C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _027E8100 ; =_027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _027E8094
	bl sub_03807380
	mov r1, #5
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E80F4
_027E8094:
	add r0, sp, #2
	add r1, sp, #0
	bl sub_027E8104
	cmp r0, #0
	bne _027E80D4
	bl sub_03807380
	mov r1, #5
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E80F4
_027E80D4:
	mov r0, #2
	strh r0, [r4]
	bl sub_03807380
	mov r1, #5
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E80F4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E8100: .word _027F8878
	arm_func_end sub_027E805C

	arm_func_start sub_027E8104
sub_027E8104: ; 0x027E8104
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x200
	ldr r2, _027E82EC ; =_027F8878
	mov r7, r0
	add r0, sp, #0
	mov r6, r1
	ldr r5, [r2, #0x550]
	bl sub_027E28C8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E8148
	mov r1, #0x304
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _027E82E0
_027E8148:
	add r0, sp, #0
	bl sub_027E2898
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E8174
	ldr r1, _027E82F0 ; =0x00000302
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _027E82E0
_027E8174:
	ldr r2, _027E82F4 ; =0x04808124
	mov r0, #0xc8
	strh r0, [r2]
	mov r0, #0x7d0
	strh r0, [r2, #4]
	ldr r1, _027E82F8 ; =0x00000202
	add r0, sp, #0
	strh r1, [r2, #0x2c]
	bl sub_027E2854
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E81BC
	ldr r1, _027E82FC ; =0x00000283
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _027E82E0
_027E81BC:
	ldrh r2, [r0, #6]
	add r0, r5, #0x100
	mov r1, r2, lsl #0xf
	strh r2, [r0, #0xf4]
	mov r0, r1, lsr #0x10
	bl sub_038073D4
	add r1, r5, #0x100
	strh r0, [r1, #0xf6]
	ldr r1, _027E8300 ; =0x0000FFFF
	add r0, sp, #0
	mov r2, #0x28
	mov r3, #5
	bl sub_027E25E0
	ldr r1, _027E8304 ; =0x001FF621
	mov r0, #0
	str r1, [r5, #0x7b8]
	str r0, [r5, #0x7bc]
	add r1, r5, #0x100
	mov r2, #2
	strh r2, [r1, #0xec]
	mov r2, #1
	add r0, sp, #0
	strh r2, [r1, #0xee]
	bl sub_027E28F4
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _027E8244
	ldr r1, _027E8308 ; =0x00000306
	mov r0, #0
	strh r1, [r7]
	ldrh r1, [r4, #4]
	strh r1, [r6]
	b _027E82E0
_027E8244:
	add r0, r4, #6
	add r1, r5, #0x20
	mov r2, #8
	bl sub_037FDF9C
	ldrh r1, [r4, #0xe]
	add r0, sp, #0
	strh r1, [r5, #0x28]
	ldrh r1, [r4, #0x10]
	strh r1, [r5, #0x2c]
	ldrh r1, [r4, #0x12]
	strh r1, [r5, #0x2e]
	ldrh r1, [r4, #0x14]
	strh r1, [r5, #0x2a]
	bl sub_027E283C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E82A0
	ldr r1, _027E830C ; =0x00000281
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _027E82E0
_027E82A0:
	add r0, r0, #6
	add r1, r5, #0xe0
	mov r2, #6
	bl sub_037FE12C
	add r0, sp, #0
	mov r1, #1
	bl sub_027E26A4
	ldrh r1, [r0, #4]
	cmp r1, #0
	moveq r0, #1
	beq _027E82E0
	ldr r1, _027E8310 ; =0x00000215
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
_027E82E0:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027E82EC: .word _027F8878
_027E82F0: .word 0x00000302
_027E82F4: .word 0x04808124
_027E82F8: .word 0x00000202
_027E82FC: .word 0x00000283
_027E8300: .word 0x0000FFFF
_027E8304: .word 0x001FF621
_027E8308: .word 0x00000306
_027E830C: .word 0x00000281
_027E8310: .word 0x00000215
	arm_func_end sub_027E8104

	arm_func_start sub_027E8314
sub_027E8314: ; 0x027E8314
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _027E83BC ; =_027F8878
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #2
	beq _027E834C
	bl sub_03807380
	mov r1, #6
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03807334
	b _027E83B0
_027E834C:
	add r0, sp, #0
	bl sub_027E2880
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _027E8390
	bl sub_03807380
	mov r2, #6
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_03807334
	b _027E83B0
_027E8390:
	mov r0, #1
	strh r0, [r5]
	bl sub_03807380
	mov r1, #6
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E83B0:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E83BC: .word _027F8878
	arm_func_end sub_027E8314

	arm_func_start sub_027E83C0
sub_027E83C0: ; 0x027E83C0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	add r1, sp, #0
	add r0, r6, #4
	bl sub_027E841C
	mov r5, r0
	bl sub_03807380
	mov r4, r0
	mov r0, #0x23
	strh r0, [r4]
	strh r5, [r4, #2]
	ldr r3, [r6, #4]
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0x1c
	str r3, [r4, #4]
	bl sub_037FE12C
	mov r0, r4
	bl sub_03807334
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E83C0

	arm_func_start sub_027E841C
sub_027E841C: ; 0x027E841C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _027E872C ; =_027F8878
	mov r4, r0
	ldr r8, [r2, #0x550]
	ldr r7, [r4]
	ldrh r0, [r8]
	mov sb, r1
	add r0, r0, #0xf7
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r6, #0
	bhi _027E8460
	tst r7, #0x2c00
	bicne r7, r7, #0x2c00
	movne r6, #3
_027E8460:
	bl EnableIrqFlag
	mov r5, r0
	cmp sb, #0
	beq _027E84E8
	ldr r0, _027E8730 ; =0x00003FFF
	str r0, [sb]
	ldrh r0, [r8, #0x58]
	strh r0, [sb, #4]
	ldrh r0, [r8, #0x5a]
	strh r0, [sb, #6]
	ldrh r0, [r8, #0x5c]
	strh r0, [sb, #8]
	ldrh r0, [r8, #0x30]
	strh r0, [sb, #0xa]
	ldrh r0, [r8, #0x32]
	strh r0, [sb, #0xc]
	ldrh r0, [r8, #0x44]
	strh r0, [sb, #0xe]
	ldrh r0, [r8, #0x46]
	strh r0, [sb, #0x10]
	ldrh r0, [r8, #0x40]
	strh r0, [sb, #0x12]
	ldrh r0, [r8, #0x42]
	strh r0, [sb, #0x14]
	ldrh r0, [r8, #0x98]
	strh r0, [sb, #0x16]
	ldrh r0, [r8, #0x92]
	strb r0, [sb, #0x18]
	ldrh r0, [r8, #0x94]
	strb r0, [sb, #0x19]
	ldrh r0, [r8, #0x9a]
	strb r0, [sb, #0x1a]
	ldrh r0, [r8, #0x9c]
	strb r0, [sb, #0x1b]
_027E84E8:
	tst r7, #1
	beq _027E8508
	ldrh r1, [r4, #4]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x58]
	strh r1, [r0, #0xc0]
_027E8508:
	tst r7, #2
	beq _027E8534
	ldrh r1, [r4, #6]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x5a]
	strh r1, [r0, #0xc2]
	ldrsh r0, [r8, #0x62]
	cmp r0, r1
	strgth r1, [r8, #0x62]
_027E8534:
	tst r7, #4
	beq _027E8560
	ldrh r1, [r4, #8]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x5c]
	strh r1, [r0, #0xc4]
	ldrsh r0, [r8, #0x62]
	cmp r0, r1
	strgth r1, [r8, #0x62]
_027E8560:
	tst r7, #8
	beq _027E858C
	ldrh r0, [r4, #0xa]
	ldrh r2, [r8, #0x34]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	cmp r2, r1, lsr #16
	movlo r6, #6
	blo _027E858C
	bl sub_027E0840
_027E858C:
	tst r7, #0x10
	beq _027E85B8
	ldrh r0, [r4, #0xc]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x200
	movhi r6, #6
	bhi _027E85B8
	bl sub_027E086C
_027E85B8:
	tst r7, #0x20
	beq _027E860C
	ldrh r0, [r4, #0xe]
	ldr r1, _027E8734 ; =0x00002710
	cmp r0, r1
	movhi r6, #6
	bhi _027E860C
	ldr r1, _027E8738 ; =0x000082EA
	mov r2, #0
	umull sb, r3, r0, r1
	mla r3, r0, r2, r3
	mla r3, r2, r1, r3
	mov r2, sb, lsr #6
	orr r2, r2, r3, lsl #26
	mov r1, r3, lsr #6
	mov r2, r2, lsr #0xa
	strh r0, [r8, #0x44]
	orr r2, r2, r1, lsl #22
	str r2, [r8, #0x48]
	mov r0, r1, lsr #0xa
	str r0, [r8, #0x4c]
_027E860C:
	tst r7, #0x40
	beq _027E8660
	ldrh r0, [r4, #0x10]
	ldr r1, _027E8734 ; =0x00002710
	cmp r0, r1
	movhi r6, #6
	bhi _027E8660
	ldr r1, _027E8738 ; =0x000082EA
	mov r2, #0
	umull sb, r3, r0, r1
	mla r3, r0, r2, r3
	mla r3, r2, r1, r3
	mov r2, sb, lsr #6
	orr r2, r2, r3, lsl #26
	mov r1, r3, lsr #6
	mov r2, r2, lsr #0xa
	strh r0, [r8, #0x46]
	orr r2, r2, r1, lsl #22
	str r2, [r8, #0x50]
	mov r0, r1, lsr #0xa
	str r0, [r8, #0x54]
_027E8660:
	tst r7, #0x80
	beq _027E8694
	ldrh r1, [r4, #0x12]
	cmp r1, #0xbe
	bls _027E8688
	cmp r1, #0xdc
	blo _027E8690
	ldr r0, _027E873C ; =0x00000106
	cmp r1, r0
	bhi _027E8690
_027E8688:
	strh r1, [r8, #0x40]
	b _027E8694
_027E8690:
	mov r6, #6
_027E8694:
	tst r7, #0x100
	beq _027E86C8
	ldrh r1, [r4, #0x14]
	cmp r1, #0xbe
	bls _027E86BC
	cmp r1, #0xdc
	blo _027E86C4
	ldr r0, _027E873C ; =0x00000106
	cmp r1, r0
	bhi _027E86C4
_027E86BC:
	strh r1, [r8, #0x42]
	b _027E86C8
_027E86C4:
	mov r6, #6
_027E86C8:
	tst r7, #0x200
	ldrneh r1, [r4, #0x16]
	addne r0, r8, #0x700
	strneh r1, [r8, #0x98]
	strneh r1, [r0, #0xca]
	tst r7, #0x400
	ldrneb r0, [r4, #0x18]
	strneh r0, [r8, #0x92]
	tst r7, #0x800
	ldrneb r0, [r4, #0x19]
	strneh r0, [r8, #0x94]
	tst r7, #0x1000
	ldrneb r1, [r4, #0x1a]
	addne r0, r8, #0x700
	strneh r1, [r8, #0x9a]
	ldrneh r1, [r8, #0x9a]
	strneh r1, [r0, #0xcc]
	tst r7, #0x2000
	ldrneb r0, [r4, #0x1b]
	strneh r0, [r8, #0x9c]
	mov r0, r5
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027E872C: .word _027F8878
_027E8730: .word 0x00003FFF
_027E8734: .word 0x00002710
_027E8738: .word 0x000082EA
_027E873C: .word 0x00000106
	arm_func_end sub_027E841C

	arm_func_start sub_027E8740
sub_027E8740: ; 0x027E8740
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_027E275C
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _027E8790
	bl sub_03807380
	mov r1, #0x24
	strh r1, [r0]
	mov r2, #1
	ldr r1, _027E87B4 ; =0x00000242
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03807334
	b _027E87A8
_027E8790:
	bl sub_03807380
	mov r1, #0x24
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03807334
_027E87A8:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E87B4: .word 0x00000242
	arm_func_end sub_027E8740

	arm_func_start sub_027E87B8
sub_027E87B8: ; 0x027E87B8
	ldr ip, _027E87C8 ; =sub_027E44FC
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_027E87C8: .word sub_027E44FC
	arm_func_end sub_027E87B8

	arm_func_start sub_027E87CC
sub_027E87CC: ; 0x027E87CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x230
	ldr r1, _027E8948 ; =_027F8878
	mov r7, r0
	ldr r6, [r1, #0x550]
	add r5, sp, #0x30
	bl sub_03807380
	mov r4, r0
	mov r1, #0x28
	strh r1, [r4]
	ldrh r1, [r6]
	cmp r1, #0xb
	beq _027E8810
	mov r1, #3
	strh r1, [r4, #2]
	bl sub_03807334
	b _027E893C
_027E8810:
	ldr r0, [r7, #4]
	mov r2, #0
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r1, r1, lsr #0x10
	mov r3, #1
	bl sub_027E1DBC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E8864
	mov r1, #1
	strh r1, [r4, #2]
	strh r1, [r4, #4]
	ldrh r1, [r0, #4]
	mov r0, r4
	strh r1, [r4, #6]
	bl sub_03807334
	b _027E893C
_027E8864:
	ldr r0, _027E8948 ; =_027F8878
	mov r2, #6
	ldr r5, [r0, #0x550]
	add r0, r5, #0x8a
	add r0, r0, #0x100
	add r1, r5, #0xa2
	bl sub_037FE12C
	add r1, sp, #0x30
	str r1, [r5, #0xa8]
	mov r0, #0
	strh r0, [r5, #0xac]
	mov r2, #1
	str r2, [r5, #0x18]
	add r1, sp, #0
	mov r2, #0x30
	bl sub_037FDF74
	mov r0, #0
	strh r0, [sp]
	strh r0, [sp, #6]
	add r0, r5, #0x100
	ldrh r0, [r0, #0xec]
	add r1, sp, #0x18
	cmp r0, #2
	moveq r3, #0x14
	add r0, r5, #0x8a
	movne r3, #0xa
	add r0, r0, #0x100
	mov r2, #6
	strb r3, [sp, #0xe]
	bl sub_037FE12C
	add r1, sp, #0x1e
	add r0, r5, #0xe0
	mov r2, #6
	bl sub_037FE12C
	add r0, sp, #0x30
	str r0, [sp, #0x2c]
	add r1, sp, #0
	bl sub_027E2200
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027E892C
	mov r1, #1
	strh r1, [r4, #2]
	mov r1, #0x100
	strh r1, [r4, #4]
	ldrh r1, [r0, #4]
	mov r0, r4
	strh r1, [r4, #6]
	bl sub_03807334
	b _027E893C
_027E892C:
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #2]
	bl sub_03807334
_027E893C:
	add sp, sp, #0x230
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027E8948: .word _027F8878
	arm_func_end sub_027E87CC

	arm_func_start sub_027E894C
sub_027E894C: ; 0x027E894C
	stmdb sp!, {r3, lr}
	bl sub_03807380
	mov r1, #0x29
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027E894C

	arm_func_start sub_027E8970
sub_027E8970: ; 0x027E8970
	stmdb sp!, {r3, lr}
	bl sub_03807380
	mov r1, #0x2a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03807334
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027E8970

	arm_func_start sub_027E8994
sub_027E8994: ; 0x027E8994
	stmdb sp!, {r3, lr}
	bl sub_027EABE0
	bl sub_027E9CF4
	bl sub_027EA720
	bl sub_027E8D44
	bl sub_027E8BC4
	ldr r0, _027E89DC ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldr r0, [r0, #0x31c]
	ldrh r1, [r1, #0x20]
	bl sub_027E8DDC
	bl sub_027EC6E4
	bl sub_027EE0B0
	bl sub_027EC474
	bl sub_027E97B0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E89DC: .word 0x0380FFF4
	arm_func_end sub_027E8994

	arm_func_start sub_027E89E0
sub_027E89E0: ; 0x027E89E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldr r1, [r4]
	ldr r3, _027E8BA0 ; =0x0380FFF4
	ldr r2, _027E8BA4 ; =0x00000694
	mov r0, #0
	str r1, [r3]
	bl sub_037FE014
	bl sub_037FBBFC
	ldr r2, _027E8BA0 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x314]
	ldr r1, [r4, #0x18]
	ldr r0, [r2]
	str r1, [r0, #0x30c]
	ldr r1, [r4, #0x1c]
	ldr r0, [r2]
	mov r1, r1, lsr #1
	str r1, [r0, #0x310]
	ldr r1, [r2]
	ldr r0, [r1, #0x310]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r1, #0x310]
	add r0, r4, #0x20
	bl sub_027E8C6C
	bl sub_027F4EC0
	ldr r3, _027E8BA8 ; =0x04000304
	ldr r1, _027E8BA0 ; =0x0380FFF4
	ldrh r2, [r3]
	mov r0, #0x30
	orr r2, r2, #2
	strh r2, [r3]
	strh r0, [r3, #-0xfe]
	ldr r0, [r1]
	mov r2, #3
	str r2, [r0, #0x68c]
	ldr r1, [r1]
	mov r0, #0x3c
	add r1, r1, #0x92
	add r2, r1, #0x600
	mov r1, #2
	bl sub_027F4E10
	ldr r1, _027E8BA0 ; =0x0380FFF4
	mov r0, #0x3e
	ldr r2, [r1]
	mov r1, #2
	add r2, r2, #0x690
	bl sub_027F4E10
	ldr r2, _027E8BA0 ; =0x0380FFF4
	ldr r3, [r4, #0x10]
	ldr r0, [r2]
	mov r1, #0x1c
	str r3, [r0, #0x308]
	ldr r0, [r2]
	ldr r2, [r4, #0x14]
	str r2, [r0, #0x304]
	ldr r0, [r4, #0x30]
	bl _u32_div_f
	mov r1, r0
	ldr r0, [r4, #0x2c]
	bl sub_027E8DDC
	bl sub_027E8BC4
	bl sub_027EC6E4
	bl sub_027EE0B0
	bl sub_027EC474
	bl sub_027EA948
	add r0, sp, #8
	bl sub_027F4D2C
	cmp r0, #0
	beq _027E8B1C
	ldr r0, _027E8BA0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x80
	strh r1, [r0, #0x3e]
	b _027E8B44
_027E8B1C:
	bl sub_027EA6B0
	bl sub_027EB220
	bl sub_027E9D7C
	bl sub_027EA720
	bl sub_027EA7C0
	bl sub_027EB3C4
	bl sub_027EB550
	bl sub_027EA758
	bl sub_027E97B0
	bl sub_027E9CF4
_027E8B44:
	ldr r1, [r4, #8]
	ldr r0, _027E8BA0 ; =0x0380FFF4
	str r1, [sp]
	ldr r2, [r4, #0xc]
	ldr r1, _027E8BAC ; =sub_037F84E0
	str r2, [sp, #4]
	ldr r0, [r0]
	ldr r3, [r4, #4]
	add r0, r0, #0x18
	mov r2, #0
	bl sub_037FC054
	ldr r0, _027E8BA0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bl sub_037FC36C
	bl sub_027EB8BC
	ldr r0, _027E8BA0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3e]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027E8BA0: .word 0x0380FFF4
_027E8BA4: .word 0x00000694
_027E8BA8: .word 0x04000304
_027E8BAC: .word sub_037F84E0
	arm_func_end sub_027E89E0

	arm_func_start sub_027E8BB0
sub_027E8BB0: ; 0x027E8BB0
	ldr r0, _027E8BC0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bx lr
	.align 2, 0
_027E8BC0: .word 0x0380FFF4
	arm_func_end sub_027E8BB0

	arm_func_start sub_027E8BC4
sub_027E8BC4: ; 0x027E8BC4
	stmdb sp!, {r4, lr}
	ldr r0, _027E8C44 ; =0x0380FFF4
	mov r3, #0
	ldr lr, [r0]
	ldr r2, _027E8C48 ; =0x0000FFFF
	strh r3, [lr, #0x10]
	strh r3, [lr, #0x12]
_027E8BE0:
	add r0, lr, r3, lsl #1
	strh r2, [r0, #8]
	ldrh r0, [r0, #8]
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r0, [lr, r1]
	cmp r3, #4
	blo _027E8BE0
	ldr ip, _027E8C48 ; =0x0000FFFF
	mov r4, #0
	ldr r1, _027E8C4C ; =_027F723C
	mov r2, r4
_027E8C10:
	add r3, lr, r4, lsl #3
	strh ip, [r3, #0xbc]
	ldr r0, [r1, r4, lsl #2]
	strh r2, [r3, #0xbe]
	add r4, r4, #1
	str r0, [r3, #0xc0]
	cmp r4, #0x18
	blo _027E8C10
	mov r0, #3
	mov r1, #0xc
	bl sub_037F8598
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E8C44: .word 0x0380FFF4
_027E8C48: .word 0x0000FFFF
_027E8C4C: .word _027F723C
	arm_func_end sub_027E8BC4

	arm_func_start sub_027E8C50
sub_027E8C50: ; 0x027E8C50
	mvn r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	mov r2, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_027E8C50

	arm_func_start sub_027E8C6C
sub_027E8C6C: ; 0x027E8C6C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027E8D40 ; =0x0380FFF4
	ldr r2, [r0]
	ldr r4, [r1]
	mov r1, #2
	str r2, [r4, #0x17c]
	ldr r2, [r0, #4]
	add r5, r4, #0x344
	str r2, [r4, #0x180]
	ldr r2, [r0, #8]
	add r0, r4, #0x188
	str r2, [r4, #0x184]
	bl sub_027E8C50
	add r0, r4, #0x194
	mov r1, #3
	bl sub_027E8C50
	add r0, r4, #0x1a0
	mov r1, #4
	bl sub_027E8C50
	add r0, r4, #0x1ac
	mov r1, #5
	bl sub_027E8C50
	add r0, r4, #0x1b8
	mov r1, #6
	bl sub_027E8C50
	add r0, r4, #0x1c4
	mov r1, #7
	bl sub_027E8C50
	add r0, r4, #0x1d0
	mov r1, #8
	bl sub_027E8C50
	add r0, r4, #0x1dc
	mov r1, #9
	bl sub_027E8C50
	add r0, r4, #0x1e8
	mov r1, #0xa
	bl sub_027E8C50
	add r0, r4, #0x1f4
	mov r1, #0xb
	bl sub_027E8C50
	add r0, r4, #0x200
	mov r1, #0xc
	bl sub_027E8C50
	add r0, r4, #0x188
	mov r1, #0x81
	bl sub_037F886C
	add r0, r0, #0xc
	str r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0xa0]
	strh r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E8D40: .word 0x0380FFF4
	arm_func_end sub_027E8C6C

	arm_func_start sub_027E8D44
sub_027E8D44: ; 0x027E8D44
	stmdb sp!, {r4, lr}
	ldr r0, _027E8D98 ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0x194
	bl sub_027E8D9C
	add r0, r4, #0x1a0
	bl sub_027E8D9C
	add r0, r4, #0x1ac
	bl sub_027E8D9C
	add r0, r4, #0x1b8
	bl sub_027E8D9C
	add r0, r4, #0x1c4
	bl sub_027E8D9C
	add r0, r4, #0x1d0
	bl sub_027E8D9C
	add r0, r4, #0x1dc
	bl sub_027E8D9C
	add r0, r4, #0x1e8
	bl sub_027E8D9C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E8D98: .word 0x0380FFF4
	arm_func_end sub_027E8D44

	arm_func_start sub_027E8D9C
sub_027E8D9C: ; 0x027E8D9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh r0, [r6, #8]
	ldr r1, [r6]
	cmp r0, #0
	beq _027E8DD4
	mvn r4, #0
	b _027E8DCC
_027E8DBC:
	ldr r5, [r1, #4]
	mov r0, r6
	bl sub_037F8908
	mov r1, r5
_027E8DCC:
	cmp r1, r4
	bne _027E8DBC
_027E8DD4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027E8D9C

	arm_func_start sub_027E8DDC
sub_027E8DDC: ; 0x027E8DDC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027E8E58 ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r6, r1
	add r1, r3, #0x31c
	mov r0, #0
	mov r2, #0x28
	ldr r4, [r3, #0x3e0]
	bl sub_037FDF74
	ldr r1, _027E8E58 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x344
	bl sub_037FDF74
	ldr r3, _027E8E58 ; =0x0380FFF4
	mov r0, r6, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	str r5, [r2, #0x31c]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x20]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x22]
	ldr r0, [r3]
	str r4, [r0, #0x3e0]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E8E58: .word 0x0380FFF4
	arm_func_end sub_027E8DDC

	arm_func_start sub_027E8E5C
sub_027E8E5C: ; 0x027E8E5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #1
	movne r0, #5
	bne _027E8EAC
	ldr r0, _027E8EB4 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x324
	bl sub_027EA0E0
	ldr r0, _027E8EB8 ; =0x04808018
	mov r1, r4
	bl sub_027EA0E0
	ldr r1, _027E8EB4 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #2
	str r1, [r2, #0x340]
_027E8EAC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E8EB4: .word 0x0380FFF4
_027E8EB8: .word 0x04808018
	arm_func_end sub_027E8E5C

	arm_func_start sub_027E8EBC
sub_027E8EBC: ; 0x027E8EBC
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r1, _027E8EE8 ; =0x0380FFF4
	ldr r2, _027E8EEC ; =0x0480802C
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x2a]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_027E8EE8: .word 0x0380FFF4
_027E8EEC: .word 0x0480802C
	arm_func_end sub_027E8EBC

	arm_func_start sub_027E8EF0
sub_027E8EF0: ; 0x027E8EF0
	ldr r1, _027E8F28 ; =0x00007FFE
	tst r0, r1
	moveq r0, #5
	bxeq lr
	ldr r2, _027E8F2C ; =0x0380FFF4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x2c]
	ldr r2, [r2]
	mov r0, #0
	ldr r1, [r2, #0x340]
	orr r1, r1, #4
	str r1, [r2, #0x340]
	bx lr
	.align 2, 0
_027E8F28: .word 0x00007FFE
_027E8F2C: .word 0x0380FFF4
	arm_func_end sub_027E8EF0

	arm_func_start sub_027E8F30
sub_027E8F30: ; 0x027E8F30
	stmdb sp!, {r3, lr}
	cmp r0, #3
	movhi r0, #5
	bhi _027E8F9C
	ldr ip, _027E8FA4 ; =0x0380FFF4
	ldr r3, _027E8FA8 ; =0x04808006
	ldr r1, [ip]
	ldr r2, _027E8FAC ; =0x0000FFF8
	add r1, r1, #0x300
	strh r0, [r1, #0x2e]
	ldr r1, [ip]
	add r1, r1, #0x300
	strh r0, [r1, #0x50]
	ldrh r1, [r3]
	and r1, r1, r2
	orr r0, r1, r0
	strh r0, [r3]
	ldr r0, [ip]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x52]
	bl sub_027E9C4C
	ldr r1, _027E8FA4 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #8
	str r1, [r2, #0x340]
_027E8F9C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E8FA4: .word 0x0380FFF4
_027E8FA8: .word 0x04808006
_027E8FAC: .word 0x0000FFF8
	arm_func_end sub_027E8F30

	arm_func_start sub_027E8FB0
sub_027E8FB0: ; 0x027E8FB0
	stmdb sp!, {r3, lr}
	cmp r0, #2
	movhi r0, #5
	bhi _027E8FD8
	ldr r1, _027E8FE0 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x30]
	bl sub_027E9BCC
	mov r0, #0
_027E8FD8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E8FE0: .word 0x0380FFF4
	arm_func_end sub_027E8FB0

	arm_func_start sub_027E8FE4
sub_027E8FE4: ; 0x027E8FE4
	ldr r1, _027E9078 ; =0x0380FFF4
	cmp r0, #3
	ldr r1, [r1]
	movhi r0, #5
	add r2, r1, #0x344
	bxhi lr
	add r1, r1, #0x300
	strh r0, [r1, #0x34]
	ldrh r1, [r2, #0x7c]
	cmp r0, #0
	biceq r1, r1, #0x10
	streqh r1, [r2, #0x7c]
	ldreqh r1, [r2, #0x8a]
	ldr r3, _027E907C ; =0x04808006
	biceq r1, r1, #0x4000
	orrne r1, r1, #0x10
	strneh r1, [r2, #0x7c]
	ldrneh r1, [r2, #0x8a]
	orrne r1, r1, #0x4000
	strh r1, [r2, #0x8a]
	ldrh r1, [r2, #8]
	cmp r1, #0x40
	cmpeq r0, #1
	ldreq r1, _027E9078 ; =0x0380FFF4
	ldreqh r2, [r2, #0x7c]
	ldreq r1, [r1]
	ldreq r1, [r1, #0x4ac]
	streqh r2, [r1, #0x2e]
	cmp r0, #0
	ldr r1, _027E9080 ; =0x0000FFC7
	ldrh r2, [r3]
	moveq r0, #1
	and r1, r2, r1
	orr r0, r1, r0, lsl #3
	strh r0, [r3]
	mov r0, #0
	bx lr
	.align 2, 0
_027E9078: .word 0x0380FFF4
_027E907C: .word 0x04808006
_027E9080: .word 0x0000FFC7
	arm_func_end sub_027E8FE4

	arm_func_start sub_027E9084
sub_027E9084: ; 0x027E9084
	cmp r0, #3
	ldrls r1, _027E90A4 ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x36]
	movls r0, #0
	bx lr
	.align 2, 0
_027E90A4: .word 0x0380FFF4
	arm_func_end sub_027E9084

	arm_func_start sub_027E90A8
sub_027E90A8: ; 0x027E90A8
	stmdb sp!, {r4, lr}
	ldr r1, _027E90F8 ; =0x04805F80
	mov r2, #0x14
	mov r4, r0
	bl sub_037FDF9C
	ldr r1, _027E90FC ; =0x04805FA0
	add r0, r4, #0x14
	mov r2, #0x14
	bl sub_037FDF9C
	ldr r1, _027E9100 ; =0x04805FC0
	add r0, r4, #0x28
	mov r2, #0x14
	bl sub_037FDF9C
	ldr r1, _027E9104 ; =0x04805FE0
	add r0, r4, #0x3c
	mov r2, #0x14
	bl sub_037FDF9C
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E90F8: .word 0x04805F80
_027E90FC: .word 0x04805FA0
_027E9100: .word 0x04805FC0
_027E9104: .word 0x04805FE0
	arm_func_end sub_027E90A8

	arm_func_start sub_027E9108
sub_027E9108: ; 0x027E9108
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _027E913C ; =0x0380FFF4
	and r2, r0, #1
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #1
	orr r2, r3, r2
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_027E913C: .word 0x0380FFF4
	arm_func_end sub_027E9108

	arm_func_start sub_027E9140
sub_027E9140: ; 0x027E9140
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _027E9174 ; =0x0380FFF4
	mov r2, r0, lsl #0x1f
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #2
	orr r2, r3, r2, lsr #30
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_027E9174: .word 0x0380FFF4
	arm_func_end sub_027E9140

	arm_func_start sub_027E9178
sub_027E9178: ; 0x027E9178
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r2, _027E91AC ; =0x0380FFF4
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r3, [r1, #0xc4]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0xc2]
	mov r0, r3
	bx lr
	.align 2, 0
_027E91AC: .word 0x0380FFF4
	arm_func_end sub_027E9178

	arm_func_start sub_027E91B0
sub_027E91B0: ; 0x027E91B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	cmp r4, #0xa
	movlo r0, #5
	blo _027E9250
	ldr r0, _027E9258 ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r4, [r0, #0x3c]
	ldrne r0, _027E925C ; =0x04808134
	strneh r4, [r0]
	ldr r0, _027E9258 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x400
	ldrh r0, [r0, #0xa4]
	cmp r0, #0
	beq _027E924C
	ldr r2, [r1, #0x4ac]
	add r0, r1, #0x300
	ldrh r1, [r0, #0x52]
	ldrh r0, [r0, #0xda]
	add r2, r2, #0x24
	add r5, r2, r0
	cmp r1, #1
	add r0, r5, #6
	bne _027E9238
	and r1, r4, #0xff
	bl sub_027EAD24
	mov r1, r4, asr #8
	add r0, r5, #7
	and r1, r1, #0xff
	bl sub_027EAD24
	b _027E924C
_027E9238:
	mov r1, #0xff
	bl sub_027EAD24
	add r0, r5, #7
	mov r1, #0xff
	bl sub_027EAD24
_027E924C:
	mov r0, #0
_027E9250:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E9258: .word 0x0380FFF4
_027E925C: .word 0x04808134
	arm_func_end sub_027E91B0

	arm_func_start sub_027E9260
sub_027E9260: ; 0x027E9260
	ldr r1, _027E928C ; =0x0380FFF4
	mov r2, #0
	ldr r1, [r1]
	add r3, r1, #0x384
_027E9270:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r2, #0x10
	strh r1, [r3], #2
	blo _027E9270
	mov r0, #0
	bx lr
	.align 2, 0
_027E928C: .word 0x0380FFF4
	arm_func_end sub_027E9260

	arm_func_start sub_027E9290
sub_027E9290: ; 0x027E9290
	stmdb sp!, {r3, lr}
	ldr r1, _027E9330 ; =0x0380FFF4
	cmp r0, #1
	ldr r2, [r1]
	movhi r0, #5
	add r1, r2, #0x344
	bhi _027E9328
	add r2, r2, #0x300
	ldrh ip, [r2, #0x3a]
	mov r3, r0, lsl #0x1f
	bic ip, ip, #4
	orr r3, ip, r3, lsr #29
	strh r3, [r2, #0x3a]
	ldrh r2, [r1, #0x7c]
	cmp r0, #0
	biceq r2, r2, #0x20
	orrne r2, r2, #0x20
	strh r2, [r1, #0x7c]
	ldrh r2, [r1, #8]
	cmp r2, #0x40
	ldreq r2, _027E9330 ; =0x0380FFF4
	ldreq r3, [r2]
	addeq r2, r3, #0x300
	ldreqh r2, [r2, #0x2e]
	cmpeq r2, #1
	ldreqh r2, [r1, #0x7c]
	ldreq r1, [r3, #0x4ac]
	streqh r2, [r1, #0x2e]
	ldr r1, _027E9334 ; =0x048080BC
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #6
	streqh r0, [r1]
	ldrneh r0, [r1]
	orrne r0, r0, #6
	strneh r0, [r1]
	bl sub_027E9BCC
	mov r0, #0
_027E9328:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9330: .word 0x0380FFF4
_027E9334: .word 0x048080BC
	arm_func_end sub_027E9290

	arm_func_start sub_027E9338
sub_027E9338: ; 0x027E9338
	cmp r0, #1
	ldrls r1, _027E9358 ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x32]
	movls r0, #0
	bx lr
	.align 2, 0
_027E9358: .word 0x0380FFF4
	arm_func_end sub_027E9338

	arm_func_start sub_027E935C
sub_027E935C: ; 0x027E935C
	stmdb sp!, {r4, lr}
	cmp r0, #3
	mov r4, r1
	movhi r0, #5
	bhi _027E9398
	cmp r4, #0x3f
	movhi r0, #5
	bhi _027E9398
	mov r1, r0
	mov r0, #0x13
	bl sub_027EA5F0
	mov r1, r4
	mov r0, #0x35
	bl sub_027EA5F0
	mov r0, #0
_027E9398:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027E935C

	arm_func_start sub_027E93A0
sub_027E93A0: ; 0x027E93A0
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r3, _027E9400 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _027E9404 ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_027E9400: .word 0x0380FFF4
_027E9404: .word 0x04808290
	arm_func_end sub_027E93A0

	arm_func_start sub_027E9408
sub_027E9408: ; 0x027E9408
	cmp r0, #1
	cmpls r1, #1
	movhi r0, #5
	bxhi lr
	cmp r0, #0
	beq _027E942C
	cmp r0, #1
	beq _027E9458
	b _027E9480
_027E942C:
	ldr r2, _027E94D4 ; =0x0380FFF4
	mov r1, r1, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x20
	orr r2, r3, r2, lsr #26
	strh r2, [r1, #0x3a]
	b _027E9480
_027E9458:
	ldr r1, _027E94D4 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x2e]
	cmp r2, #1
	movne r0, #0xb
	bxne lr
	ldrh r2, [r1, #0x3a]
	bic r2, r2, #0x20
	strh r2, [r1, #0x3a]
_027E9480:
	ldr r3, _027E94D4 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x10
	orr r1, r2, r1, lsr #27
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _027E94D8 ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_027E94D4: .word 0x0380FFF4
_027E94D8: .word 0x04808290
	arm_func_end sub_027E9408

	arm_func_start sub_027E94DC
sub_027E94DC: ; 0x027E94DC
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _027E9518 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x40
	orr r1, r2, r1, lsr #25
	strh r1, [r0, #0x3a]
	mov r0, #0
	bx lr
	.align 2, 0
_027E9518: .word 0x0380FFF4
	arm_func_end sub_027E94DC

	arm_func_start sub_027E951C
sub_027E951C: ; 0x027E951C
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r2, _027E9564 ; =0x0380FFF4
	mov r1, r0, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x80
	orr r2, r3, r2, lsr #24
	strh r2, [r1, #0x3a]
	ldreq r1, _027E9568 ; =0x0480802A
	ldreqh r0, [r1]
	streqh r0, [r1, #-2]
	mov r0, #0
	bx lr
	.align 2, 0
_027E9564: .word 0x0380FFF4
_027E9568: .word 0x0480802A
	arm_func_end sub_027E951C

	arm_func_start sub_027E956C
sub_027E956C: ; 0x027E956C
	stmdb sp!, {r4, lr}
	ldr r1, _027E95C4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x3a8
	bl sub_027EA0E0
	ldr r0, _027E95C8 ; =0x04808020
	mov r1, r4
	bl sub_027EA0E0
	ldrh r0, [r4]
	ldr r1, _027E95CC ; =0x048080D0
	tst r0, #1
	ldrneh r0, [r1]
	bicne r0, r0, #0x400
	strneh r0, [r1]
	ldreqh r0, [r1]
	orreq r0, r0, #0x400
	streqh r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E95C4: .word 0x0380FFF4
_027E95C8: .word 0x04808020
_027E95CC: .word 0x048080D0
	arm_func_end sub_027E956C

	arm_func_start sub_027E95D0
sub_027E95D0: ; 0x027E95D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _027E96DC ; =0x0380FFF4
	mov r8, r0
	ldr r2, [r2]
	cmp r8, #0x20
	mov r7, r1
	add r4, r2, #0x344
	mov r6, #0
	movhi r0, #5
	bhi _027E96D4
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	addeq r0, r2, #0x300
	ldreqh r0, [r0, #0x2e]
	cmpeq r0, #1
	bne _027E962C
	ldrh r0, [r4, #0x1e]
	cmp r0, r8
	movne r0, #6
	bne _027E96D4
	ldrh r0, [r4, #0x92]
	cmp r0, #0
	movne r6, #1
_027E962C:
	mov r5, #0
	add sb, r4, #0x20
	b _027E9654
_027E9638:
	mov r0, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, sb, r5
	bl sub_027EAD24
	add r7, r7, #1
	add r5, r5, #1
_027E9654:
	cmp r5, r8
	blo _027E9638
	add sb, r4, #0x20
	mov r7, #0
	b _027E9678
_027E9668:
	mov r1, r7
	add r0, sb, r5
	bl sub_027EAD24
	add r5, r5, #1
_027E9678:
	cmp r5, #0x20
	blo _027E9668
	strh r8, [r4, #0x1e]
	cmp r6, #0
	beq _027E96D0
	ldr r1, _027E96DC ; =0x0380FFF4
	ldrh r0, [r4, #0x92]
	ldr r1, [r1]
	mov r5, #0
	ldr r1, [r1, #0x4ac]
	add r4, r4, #0x20
	add r1, r1, #0x26
	add r6, r1, r0
	b _027E96C8
_027E96B0:
	add r0, r4, r5
	bl sub_027EAD50
	mov r1, r0
	add r0, r6, r5
	bl sub_027EAD24
	add r5, r5, #1
_027E96C8:
	cmp r5, r8
	blo _027E96B0
_027E96D0:
	mov r0, #0
_027E96D4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027E96DC: .word 0x0380FFF4
	arm_func_end sub_027E95D0

	arm_func_start sub_027E96E0
sub_027E96E0: ; 0x027E96E0
	stmdb sp!, {r3, lr}
	cmp r0, #0xa
	blo _027E96F4
	cmp r0, #0x3e8
	bls _027E96FC
_027E96F4:
	mov r0, #5
	b _027E9728
_027E96FC:
	ldr r3, _027E9730 ; =0x0380FFF4
	ldr r2, _027E9734 ; =0x0480808C
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xb2]
	strh r0, [r2]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x38]
	bl sub_027E9E30
	mov r0, #0
_027E9728:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9730: .word 0x0380FFF4
_027E9734: .word 0x0480808C
	arm_func_end sub_027E96E0

	arm_func_start sub_027E9738
sub_027E9738: ; 0x027E9738
	cmp r0, #1
	blo _027E9748
	cmp r0, #0xff
	bls _027E9750
_027E9748:
	mov r0, #5
	bx lr
_027E9750:
	ldr r1, _027E9774 ; =0x0380FFF4
	ldr r2, _027E9778 ; =0x0480808E
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xb8]
	strh r0, [r2]
	mov r0, #0
	strh r0, [r2, #-6]
	bx lr
	.align 2, 0
_027E9774: .word 0x0380FFF4
_027E9778: .word 0x0480808E
	arm_func_end sub_027E9738

	arm_func_start sub_027E977C
sub_027E977C: ; 0x027E977C
	cmp r0, #1
	blo _027E978C
	cmp r0, #0xff
	bls _027E9794
_027E978C:
	mov r0, #5
	bx lr
_027E9794:
	ldr r1, _027E97AC ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xb4]
	mov r0, #0
	bx lr
	.align 2, 0
_027E97AC: .word 0x0380FFF4
	arm_func_end sub_027E977C

	arm_func_start sub_027E97B0
sub_027E97B0: ; 0x027E97B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r2, sp, #2
	mov r0, #0x36
	mov r1, #6
	bl sub_027F4E10
	add r2, sp, #0
	mov r0, #0x3c
	mov r1, #2
	bl sub_027F4E10
	add r0, sp, #2
	bl sub_027E8E5C
	mov r0, #7
	bl sub_027E8EBC
	ldrh r1, [sp]
	ldr r0, _027E98E4 ; =0x00007FFE
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027E8EF0
	mov r0, #2
	bl sub_027E8F30
	mov r0, #0
	bl sub_027E8FB0
	mov r0, #0
	bl sub_027E8FE4
	mov r0, #0
	bl sub_027E9084
	ldr r0, _027E98E8 ; =_027F7300
	bl sub_027E90A8
	mov r0, #0x1f4
	bl sub_027E96E0
	mov r0, #0
	bl sub_027E9108
	mov r0, #0
	bl sub_027E9140
	mov r0, #0x10
	bl sub_027E9178
	ldr r0, _027E98EC ; =0x0000FFFF
	mov r1, #0
	bl sub_027E91B0
	ldr r0, _027E98F0 ; =_027F72A0
	bl sub_027E9260
	mov r0, #1
	bl sub_027E9290
	mov r0, #0
	bl sub_027E9338
	ldr r0, _027E98F4 ; =_027F729C
	bl sub_027E9B8C
	mov r0, #0
	mov r1, #0x1f
	bl sub_027E935C
	mov r0, #5
	bl sub_027E9E30
	mov r0, #0
	mov r1, r0
	bl sub_027E9408
	mov r0, #0
	bl sub_027E93A0
	mov r0, #0
	bl sub_027E94DC
	mov r0, #0
	bl sub_027E951C
	ldr r1, _027E98F8 ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_027EAD6C
	ldr r0, _027E98FC ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	add sp, sp, #8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E98E4: .word 0x00007FFE
_027E98E8: .word _027F7300
_027E98EC: .word 0x0000FFFF
_027E98F0: .word _027F72A0
_027E98F4: .word _027F729C
_027E98F8: .word 0x04808044
_027E98FC: .word 0x0380FFF4
	arm_func_end sub_027E97B0

	arm_func_start sub_027E9900
sub_027E9900: ; 0x027E9900
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r0, _027E9B7C ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	ldrne sb, _027E9B80 ; =sub_027F4E70
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2c]
	ldreq sb, _027E9B84 ; =sub_027F4E10
	mov r2, #1
	tst r0, r2, lsl sl
	moveq r0, #5
	beq _027E9B70
	ldr r1, _027E9B88 ; =0x04808040
	add r0, r2, #0x8000
	ldrh r6, [r1]
	strh r0, [r1]
	sub r3, r1, #4
	add r1, r1, #0x1d4
_027E9950:
	ldrh r2, [r3]
	ldrh r0, [r1]
	mov r2, r2, asr #8
	cmp r2, #2
	bne _027E9950
	cmp r0, #0
	cmpne r0, #9
	bne _027E9950
	ldr r5, _027E9B7C ; =0x0380FFF4
	ldr r0, [r5]
	add r0, r0, #0x300
	strh sl, [r0, #0xbe]
	ldr r0, [r5]
	add r0, r0, #0x500
	ldrh r1, [r0, #0xf8]
	cmp r1, #2
	beq _027E99A4
	cmp r1, #3
	beq _027E9A74
	cmp r1, #5
	bne _027E9B5C
_027E99A4:
	sub r4, sl, #1
	mov r0, #6
	mul r5, r4, r0
	mov r0, #0
	str r0, [sp, #4]
	add r2, sp, #4
	add r0, r5, #0xf2
	mov r1, #3
	mov lr, pc
	bx sb
_027E99CC:
	ldr r0, [sp, #4]
	bl sub_027EA620
	add r2, sp, #4
	add r0, r5, #0xf5
	mov r1, #3
	mov lr, pc
	bx sb
_027E99E8:
	ldr r0, [sp, #4]
	bl sub_027EA620
	mov r1, #0
	ldr r0, _027E9B7C ; =0x0380FFF4
	str r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #0x604]
	tst r0, #0x10000
	beq _027E9A4C
	tst r0, #0x8000
	bne _027E9B5C
	add r2, sp, #4
	add r0, r4, #0x154
	mov r1, #1
	mov lr, pc
	bx sb
sub_027E9A28: ; 0x027E9A28
	ldr r1, _027E9B7C ; =0x0380FFF4
	ldr r0, [sp, #4]
	ldr r1, [r1]
	mov r0, r0, lsl #0x1b
	ldr r1, [r1, #0x604]
	orr r0, r1, r0, lsr #17
	str r0, [sp, #4]
	bl sub_027EA620
	b _027E9B5C
_027E9A4C:
	add r0, r4, #0x46
	add r2, sp, #4
	add r0, r0, #0x100
	mov r1, #1
	mov lr, pc
	bx sb
_027E9A64:
	ldr r1, [sp, #4]
	mov r0, #0x1e
	bl sub_027EA5F0
	b _027E9B5C
_027E9A74:
	ldrh r0, [r0, #0xfc]
	mov r8, #0
	add r7, r0, #0xcf
	mov r4, r8
	mov fp, #1
	b _027E9AD0
_027E9A8C:
	mov r0, r7
	mov r1, fp
	add r2, sp, #0
	str r4, [sp, #4]
	str r4, [sp]
	mov lr, pc
	bx sb
_027E9AA8:
	add r0, r7, sl
	mov r1, #1
	add r2, sp, #4
	mov lr, pc
	bx sb
_027E9ABC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_027EA5F0
	add r7, r7, #0xf
	add r8, r8, #1
_027E9AD0:
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrh r0, [r0]
	cmp r8, r0
	blo _027E9A8C
	mov r8, #0
	ldr r4, _027E9B7C ; =0x0380FFF4
	mov r5, r8
	mov fp, #1
	b _027E9B48
_027E9AF8:
	str r5, [sp, #4]
	mov r0, r7
	mov r1, fp
	add r2, sp, #4
	mov lr, pc
	bx sb
_027E9B10:
	ldr r1, [sp, #4]
	add r0, r7, sl
	mov r1, r1, lsl #8
	str r1, [sp, #4]
	mov r1, #1
	add r2, sp, #4
	mov lr, pc
	bx sb
_027E9B30:
	ldr r0, [sp, #4]
	orr r0, r0, #0x50000
	str r0, [sp, #4]
	bl sub_027EA620
	add r7, r7, #0xf
	add r8, r8, #1
_027E9B48:
	ldr r0, [r4]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xfe]
	cmp r8, r0
	blo _027E9AF8
_027E9B5C:
	ldr r1, _027E9B88 ; =0x04808040
	mov r0, #3
	strh r6, [r1]
	strh r0, [r1, #8]
	mov r0, #0
_027E9B70:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027E9B7C: .word 0x0380FFF4
_027E9B80: .word sub_027F4E70
_027E9B84: .word sub_027F4E10
_027E9B88: .word 0x04808040
	arm_func_end sub_027E9900

	arm_func_start sub_027E9B8C
sub_027E9B8C: ; 0x027E9B8C
	stmdb sp!, {r3, lr}
	ldr r1, _027E9BC8 ; =0x0380FFF4
	ldrh r2, [r0]
	ldr r3, [r1]
	add r1, r3, #0x300
	strh r2, [r1, #0xa4]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	add r2, r3, #0x3a4
	orr r0, r1, r0
	strh r0, [r2, #2]
	bl sub_027E9BCC
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9BC8: .word 0x0380FFF4
	arm_func_end sub_027E9B8C

	arm_func_start sub_027E9BCC
sub_027E9BCC: ; 0x027E9BCC
	stmdb sp!, {r3, lr}
	ldr r0, _027E9C40 ; =0x0000E2E2
	add r2, sp, #0
	str r0, [sp]
	mov r0, #0x58
	mov r1, #2
	bl sub_027F4E10
	ldr r0, [sp]
	add r0, r0, #2
	add r0, r0, #0x200
	str r0, [sp]
	bl sub_027EA578
	cmp r0, #0x14
	bne _027E9C2C
	ldr r1, [sp]
	ldr r0, _027E9C44 ; =0x048080BC
	sub r1, r1, #0x61
	sub r1, r1, #0x6100
	str r1, [sp]
	ldrh r0, [r0]
	tst r0, #2
	subne r0, r1, #0x60
	subne r0, r0, #0x6000
	strne r0, [sp]
_027E9C2C:
	ldr r1, [sp]
	ldr r0, _027E9C48 ; =0x04808140
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9C40: .word 0x0000E2E2
_027E9C44: .word 0x048080BC
_027E9C48: .word 0x04808140
	arm_func_end sub_027E9BCC

	arm_func_start sub_027E9C4C
sub_027E9C4C: ; 0x027E9C4C
	stmdb sp!, {r3, lr}
	ldr r1, _027E9CAC ; =0x0380FFF4
	cmp r0, #0
	ldr r2, [r1]
	add r1, r2, #0x300
	add r3, r2, #0x31c
	strh r0, [r1, #0x52]
	ldrneh r0, [r3, #0x12]
	cmpne r0, #1
	ldrne r1, _027E9CB0 ; =0x04808006
	ldrneh r0, [r1]
	orrne r0, r0, #0x40
	strneh r0, [r1]
	bne _027E9CA0
	ldr r2, _027E9CB0 ; =0x04808006
	mov r1, #0
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	ldrh r0, [r3, #0x20]
	bl sub_027E91B0
_027E9CA0:
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9CAC: .word 0x0380FFF4
_027E9CB0: .word 0x04808006
	arm_func_end sub_027E9C4C

	arm_func_start sub_027E9CB4
sub_027E9CB4: ; 0x027E9CB4
	ldr r1, _027E9CD8 ; =0x0380FFF4
	ldr r2, _027E9CDC ; =0x0480803C
	ldr r1, [r1]
	mov r3, r0, lsr #1
	add r1, r1, #0x300
	strh r3, [r1, #0x54]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_027E9CD8: .word 0x0380FFF4
_027E9CDC: .word 0x0480803C
	arm_func_end sub_027E9CB4

	arm_func_start sub_027E9CE0
sub_027E9CE0: ; 0x027E9CE0
	ldr r1, _027E9CF0 ; =0x04808040
	strh r0, [r1]
	mov r0, #0
	bx lr
	.align 2, 0
_027E9CF0: .word 0x04808040
	arm_func_end sub_027E9CE0

	arm_func_start sub_027E9CF4
sub_027E9CF4: ; 0x027E9CF4
	stmdb sp!, {r3, lr}
	ldr r0, _027E9D5C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	bne _027E9D18
	ldr r0, _027E9D60 ; =0x0000C008
	bl sub_027EA620
_027E9D18:
	ldr r1, _027E9D64 ; =0x0000601E
	ldr r0, _027E9D68 ; =0x04808158
	strh r1, [r0]
	bl sub_037FB420
	ldr r1, _027E9D6C ; =0x0480815C
	mov r0, #0x1e
	ldrh r1, [r1]
	orr r1, r1, #0x3f
	bl sub_027EA5F0
	ldr r2, _027E9D70 ; =0x0000800D
	ldr r1, _027E9D74 ; =0x04808168
	ldr r0, _027E9D78 ; =0x04808036
	strh r2, [r1]
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027E9D5C: .word 0x0380FFF4
_027E9D60: .word 0x0000C008
_027E9D64: .word 0x0000601E
_027E9D68: .word 0x04808158
_027E9D6C: .word 0x0480815C
_027E9D70: .word 0x0000800D
_027E9D74: .word 0x04808168
_027E9D78: .word 0x04808036
	arm_func_end sub_027E9CF4

	arm_func_start sub_027E9D7C
sub_027E9D7C: ; 0x027E9D7C
	stmdb sp!, {r4, lr}
	ldr r2, _027E9E14 ; =0x04808036
	mov r3, #0
	ldr r1, _027E9E18 ; =sub_027EA99C
	mov r0, #0x1f40
	strh r3, [r2]
	bl sub_037FB32C
	ldr r1, _027E9E1C ; =0x04808168
	mov r2, #0
	ldr r0, _027E9E20 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	beq _027E9DC8
	cmp r0, #3
	beq _027E9E08
	b _027E9E0C
_027E9DC8:
	ldr r0, _027E9E24 ; =0x00006001
	strh r0, [r1, #-0x10]
	bl sub_037FB420
	ldr r1, _027E9E28 ; =0x0480815C
	mov r0, #1
	ldrh r4, [r1]
	and r1, r4, #0x7f
	bl sub_027EA5F0
	mov r1, r4
	mov r0, #1
	bl sub_027EA5F0
	ldr r0, _027E9E2C ; =0x00009C40
	ldr r1, _027E9E18 ; =sub_027EA99C
	bl sub_037FB32C
	bl sub_027EA7C0
	b _027E9E0C
_027E9E08:
	bl sub_027EA7C0
_027E9E0C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027E9E14: .word 0x04808036
_027E9E18: .word sub_027EA99C
_027E9E1C: .word 0x04808168
_027E9E20: .word 0x0380FFF4
_027E9E24: .word 0x00006001
_027E9E28: .word 0x0480815C
_027E9E2C: .word 0x00009C40
	arm_func_end sub_027E9D7C

	arm_func_start sub_027E9E30
sub_027E9E30: ; 0x027E9E30
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027E9E8C ; =0x0380FFF4
	ldr r1, _027E9E90 ; =0x0000FFFF
	ldr r2, [r2]
	mov r6, r0
	add r5, r2, #0x31c
	cmp r6, r1
	streqh r1, [r5, #0x1c]
	add r4, r2, #0x344
	streqh r1, [r4, #0x8c]
	beq _027E9E80
	ldrh r0, [r4, #0x6e]
	mov r1, #0x64
	mul r0, r6, r0
	bl _u32_div_f
	cmp r0, #0x10000
	movhi r0, #5
	bhi _027E9E84
	strh r6, [r5, #0x1c]
	strh r0, [r4, #0x8c]
_027E9E80:
	mov r0, #0
_027E9E84:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027E9E8C: .word 0x0380FFF4
_027E9E90: .word 0x0000FFFF
	arm_func_end sub_027E9E30

	arm_func_start sub_027E9E94
sub_027E9E94: ; 0x027E9E94
	ldr r1, _027E9ED8 ; =0x0380FFF4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldr r0, [r1]
	add r0, r0, #0x400
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bxne lr
	ldr r2, _027E9EDC ; =0x04808038
	mov r0, #0
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	strh r0, [r2, #0x10]
	bx lr
	.align 2, 0
_027E9ED8: .word 0x0380FFF4
_027E9EDC: .word 0x04808038
	arm_func_end sub_027E9E94

	arm_func_start sub_027E9EE0
sub_027E9EE0: ; 0x027E9EE0
	ldr r0, _027E9F08 ; =0x0380FFF4
	ldr r1, _027E9F0C ; =0x04808038
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldrh r0, [r1]
	orr r0, r0, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_027E9F08: .word 0x0380FFF4
_027E9F0C: .word 0x04808038
	arm_func_end sub_027E9EE0

	arm_func_start sub_027E9F10
sub_027E9F10: ; 0x027E9F10
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _027E9F50 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	cmp r5, #0x80
	add r4, r0, #0x344
	movhi r0, #4
	bhi _027E9F48
	mov r0, r1
	ldr r1, [r4, #0x9c]
	add r2, r5, #1
	bl sub_037FDF9C
	strh r5, [r4, #0xa0]
	mov r0, #0
_027E9F48:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027E9F50: .word 0x0380FFF4
	arm_func_end sub_027E9F10

	arm_func_start sub_027E9F54
sub_027E9F54: ; 0x027E9F54
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _027E9FFC ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r2]
	mov r8, r1
	cmp r4, #0x80
	add r5, r0, #0x344
	movhi r0, #4
	bhi _027E9FF4
	cmp r4, #0
	beq _027E9FE4
	ldrh r0, [r5, #0xa2]
	tst r0, #1
	beq _027E9FD4
	ldr r6, [r5, #0x9c]
	mov r1, #0xff
	mov r0, r6
	bl sub_027EAD24
	add r6, r6, #1
	mov r7, #0
	b _027E9FC8
_027E9FA8:
	mov r0, r8
	bl sub_027EAD50
	mov r1, r0
	mov r0, r6
	bl sub_027EAD24
	add r6, r6, #1
	add r8, r8, #1
	add r7, r7, #1
_027E9FC8:
	cmp r7, r4
	blo _027E9FA8
	b _027E9FE4
_027E9FD4:
	ldr r1, [r5, #0x9c]
	mov r0, r8
	add r2, r4, #1
	bl sub_037FDF9C
_027E9FE4:
	strh r4, [r5, #0xa0]
	mov r0, #1
	strh r0, [r5, #0xa4]
	mov r0, #0
_027E9FF4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027E9FFC: .word 0x0380FFF4
	arm_func_end sub_027E9F54

	arm_func_start sub_027EA000
sub_027EA000: ; 0x027EA000
	ldr r3, _027EA034 ; =0x0380FFF4
	ldr r2, _027EA038 ; =0x0480802A
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xae]
	strh r0, [r2]
	ldr r1, [r3]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	strneh r0, [r2, #-2]
	bx lr
	.align 2, 0
_027EA034: .word 0x0380FFF4
_027EA038: .word 0x0480802A
	arm_func_end sub_027EA000

	arm_func_start sub_027EA03C
sub_027EA03C: ; 0x027EA03C
	stmdb sp!, {r4, lr}
	ldr r1, _027EA090 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	add r4, r1, #0x344
	strh r0, [r4, #0x6a]
	bl sub_037FB3B4
	ldr r0, _027EA094 ; =0x0480802A
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r4, #0x88]
	cmp r0, #0
	beq _027EA088
	bl sub_027F0D60
	ldrh r0, [r4, #0x88]
	mov r1, #0x20
	bl sub_027EBC44
	mov r0, #0
	strh r0, [r4, #0x88]
_027EA088:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EA090: .word 0x0380FFF4
_027EA094: .word 0x0480802A
	arm_func_end sub_027EA03C

	arm_func_start sub_027EA098
sub_027EA098: ; 0x027EA098
	ldr r0, _027EA0B4 ; =0x0380FFF4
	ldr r1, _027EA0B8 ; =0x04808028
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xae]
	strh r0, [r1]
	bx lr
	.align 2, 0
_027EA0B4: .word 0x0380FFF4
_027EA0B8: .word 0x04808028
	arm_func_end sub_027EA098

	arm_func_start sub_027EA0BC
sub_027EA0BC: ; 0x027EA0BC
	stmdb sp!, {r3, lr}
	ldr r0, _027EA0DC ; =0x04808094
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _027EA0D4
	bl sub_037FB3B4
_027EA0D4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EA0DC: .word 0x04808094
	arm_func_end sub_027EA0BC

	arm_func_start sub_027EA0E0
sub_027EA0E0: ; 0x027EA0E0
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	bx lr
	arm_func_end sub_027EA0E0

	arm_func_start sub_027EA0FC
sub_027EA0FC: ; 0x027EA0FC
	ldrh r3, [r1]
	strh r3, [r0]
	ldrh r3, [r1, #2]
	strh r3, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_027EA0FC

	arm_func_start sub_027EA130
sub_027EA130: ; 0x027EA130
	ldrh ip, [r1]
	strh ip, [r0]
	ldrh ip, [r1, #2]
	strh ip, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	ldrh r1, [r3]
	strh r1, [r0, #0xc]
	ldrh r1, [r3, #2]
	strh r1, [r0, #0xe]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0x10]
	bx lr
	arm_func_end sub_027EA130

	arm_func_start sub_027EA17C
sub_027EA17C: ; 0x027EA17C
	stmdb sp!, {r3, lr}
	bl sub_027EA1AC
	ldr r1, _027EA1A8 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xb4
	add r1, r1, #0x13c
	add r1, r1, #0x400
	bl sub_037FDFD0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EA1A8: .word 0x0380FFF4
	arm_func_end sub_027EA17C

	arm_func_start sub_027EA1AC
sub_027EA1AC: ; 0x027EA1AC
	ldr r1, _027EA39C ; =0x0380FFF4
	ldr r0, _027EA3A0 ; =0x048081B0
	ldr r1, [r1]
	ldrh r2, [r0]
	ldr r3, [r1, #0x58c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x58c]
	ldrh ip, [r0, #2]
	ldr r3, [r1, #0x588]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x588]
	ldr r3, [r1, #0x598]
	add r2, r3, r2
	str r2, [r1, #0x598]
	ldrh ip, [r0, #4]
	ldr r3, [r1, #0x594]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x594]
	ldr r3, [r1, #0x590]
	add r2, r3, r2
	str r2, [r1, #0x590]
	ldrh ip, [r0, #6]
	ldr r3, [r1, #0x59c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x59c]
	ldr r3, [r1, #0x574]
	add r2, r3, r2
	str r2, [r1, #0x574]
	ldrh r2, [r0, #8]
	ldr r3, [r1, #0x584]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x584]
	ldrh r2, [r0, #0xa]
	ldr r3, [r1, #0x55c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x55c]
	ldrh ip, [r0, #0xc]
	ldr r3, [r1, #0x56c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x56c]
	ldr r3, [r1, #0x580]
	add r2, r3, r2
	str r2, [r1, #0x580]
	ldrh ip, [r0, #0xe]
	ldr r3, [r1, #0x578]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x578]
	ldr r2, [r1, #0x57c]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x57c]
	ldrh r2, [r0, #0x10]
	ldr r3, [r1, #0x548]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x548]
	ldrh r3, [r0, #0x20]
	ldr r2, [r1, #0x5b4]
	add r2, r2, r3, asr #8
	str r2, [r1, #0x5b4]
	ldrh ip, [r0, #0x22]
	ldr r3, [r1, #0x5b8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5b8]
	ldr r2, [r1, #0x5bc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5bc]
	ldrh ip, [r0, #0x24]
	ldr r3, [r1, #0x5c0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c0]
	ldr r2, [r1, #0x5c4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5c4]
	ldrh ip, [r0, #0x26]
	ldr r3, [r1, #0x5c8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c8]
	ldr r2, [r1, #0x5cc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5cc]
	ldrh ip, [r0, #0x28]
	ldr r3, [r1, #0x5d0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d0]
	ldr r2, [r1, #0x5d4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5d4]
	ldrh ip, [r0, #0x2a]
	ldr r3, [r1, #0x5d8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d8]
	ldr r2, [r1, #0x5dc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5dc]
	ldrh ip, [r0, #0x2c]
	ldr r3, [r1, #0x5e0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5e0]
	ldr r2, [r1, #0x5e4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5e4]
	ldrh r3, [r0, #0x2e]
	ldr r2, [r1, #0x5e8]
	and r0, r3, #0xff
	add r0, r2, r0
	str r0, [r1, #0x5e8]
	ldr r0, [r1, #0x5ec]
	add r0, r0, r3, asr #8
	str r0, [r1, #0x5ec]
	bx lr
	.align 2, 0
_027EA39C: .word 0x0380FFF4
_027EA3A0: .word 0x048081B0
	arm_func_end sub_027EA1AC

	arm_func_start sub_027EA3A4
sub_027EA3A4: ; 0x027EA3A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _027EA470 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r2]
	mov r8, r1
	cmp sb, #0x20
	add r2, r0, #0x344
	movhi r0, #0
	bhi _027EA468
	ldrh r1, [r2, #0x1e]
	cmp r1, #0
	moveq r0, #1
	beq _027EA468
	add r0, r0, #0x400
	ldrh r0, [r0, #4]
	cmp r0, #0x13
	bne _027EA3FC
	cmp sb, r1
	movlo r0, #0
	blo _027EA468
	mov sb, r1
	b _027EA408
_027EA3FC:
	cmp sb, r1
	movne r0, #0
	bne _027EA468
_027EA408:
	add r5, r2, #0x20
	add r6, r2, #0x40
	mov r7, #0
	b _027EA45C
_027EA418:
	mov r0, r6
	bl sub_027EAD50
	mov r4, r0
	mov r0, r8
	add r6, r6, #1
	bl sub_027EAD50
	mov sl, r0
	mov r0, r5
	add r8, r8, #1
	bl sub_027EAD50
	orr r1, sl, r4
	orr r0, r0, r4
	cmp r1, r0
	add r5, r5, #1
	movne r0, #0
	bne _027EA468
	add r7, r7, #1
_027EA45C:
	cmp r7, sb
	blo _027EA418
	mov r0, #1
_027EA468:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027EA470: .word 0x0380FFF4
	arm_func_end sub_027EA3A4

	arm_func_start sub_027EA474
sub_027EA474: ; 0x027EA474
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	ldreqh r3, [r0, #2]
	ldreqh r2, [r1, #2]
	cmpeq r3, r2
	ldreqh r2, [r0]
	ldreqh r0, [r1]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_027EA474

	arm_func_start sub_027EA4A4
sub_027EA4A4: ; 0x027EA4A4
	ldr r1, _027EA4C0 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2c]
	and r0, r1, r2, lsl r0
	bx lr
	.align 2, 0
_027EA4C0: .word 0x0380FFF4
	arm_func_end sub_027EA4A4

	arm_func_start sub_027EA4C4
sub_027EA4C4: ; 0x027EA4C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r1, #0
	mov r4, r0
	strh r1, [sb]
	add r0, r4, #1
	strh r1, [sb, #2]
	bl sub_027EAD50
	add r6, r4, #2
	ldr r5, _027EA574 ; =_027F73B4
	mov r8, r0
	mov r7, #0
	mov r4, #1
	b _027EA564
_027EA4FC:
	add r0, r6, r7
	bl sub_027EAD50
	and r1, r0, #0x7f
	sub r1, r1, #1
	cmp r1, #0x78
	bhs _027EA544
	mov r1, r1, lsl #1
	ldrh r2, [r5, r1]
	cmp r2, #0xff
	beq _027EA544
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, r4, lsl r2
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, r4, lsl r2
	strneh r0, [sb]
	b _027EA560
_027EA544:
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, #0x8000
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, #0x8000
	strneh r0, [sb]
_027EA560:
	add r7, r7, #1
_027EA564:
	cmp r7, r8
	blo _027EA4FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027EA574: .word _027F73B4
	arm_func_end sub_027EA4C4

	arm_func_start sub_027EA578
sub_027EA578: ; 0x027EA578
	ldr r0, _027EA5C0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _027EA59C
	cmp r1, #1
	beq _027EA5B0
	b _027EA5B8
_027EA59C:
	ldrh r0, [r0, #0xa4]
	tst r0, #1
	beq _027EA5B8
	mov r0, #0xa
	bx lr
_027EA5B0:
	mov r0, #0xa
	bx lr
_027EA5B8:
	mov r0, #0x14
	bx lr
	.align 2, 0
_027EA5C0: .word 0x0380FFF4
	arm_func_end sub_027EA578

	arm_func_start sub_027EA5C4
sub_027EA5C4: ; 0x027EA5C4
	stmdb sp!, {r3, lr}
	ldr r1, _027EA5E8 ; =0x04808158
	orr r0, r0, #0x6000
	strh r0, [r1]
	bl sub_037FB420
	ldr r0, _027EA5EC ; =0x0480815C
	ldrh r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EA5E8: .word 0x04808158
_027EA5EC: .word 0x0480815C
	arm_func_end sub_027EA5C4

	arm_func_start sub_027EA5F0
sub_027EA5F0: ; 0x027EA5F0
	stmdb sp!, {r3, lr}
	ldr r2, _027EA61C ; =0x0480815A
	orr r0, r0, #0x5000
	strh r1, [r2]
	strh r0, [r2, #-2]
	bl sub_037FB420
	cmp r0, #0
	mvnne r0, #0
	moveq r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EA61C: .word 0x0480815A
	arm_func_end sub_027EA5F0

	arm_func_start sub_027EA620
sub_027EA620: ; 0x027EA620
	ldr r2, _027EA638 ; =0x0480817E
	ldr ip, _027EA63C ; =sub_037FB454
	strh r0, [r2]
	mov r1, r0, lsr #0x10
	strh r1, [r2, #-2]
	bx ip
	.align 2, 0
_027EA638: .word 0x0480817E
_027EA63C: .word sub_037FB454
	arm_func_end sub_027EA620

	arm_func_start sub_027EA640
sub_027EA640: ; 0x027EA640
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, #0
	str r8, [sp]
	mov r7, r8
	mov r6, #0x64
	add r4, sp, #0
	mov r5, #1
_027EA660:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_027F4E10
	cmp r7, #1
	ldreq r0, [sp]
	mov r1, r8
	andeq r0, r0, #0x80
	streq r0, [sp]
	ldr r0, [sp]
	and r0, r0, #0xff
	bl sub_027EADE8
	add r7, r7, #1
	mov r8, r0
	cmp r7, #0x69
	add r6, r6, #1
	blo _027EA660
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_027EA640

	arm_func_start sub_027EA6B0
sub_027EA6B0: ; 0x027EA6B0
	stmdb sp!, {r4, lr}
	ldr r1, _027EA71C ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x1f8
	add r4, r1, #0x400
	mov r1, r4
	bl sub_037FDF74
	mov r2, r4
	mov r0, #0x40
	mov r1, #1
	bl sub_027F4E10
	add r2, r4, #2
	mov r0, #0x41
	mov r1, #1
	bl sub_027F4E10
	add r2, r4, #4
	mov r0, #0x42
	mov r1, #1
	bl sub_027F4E10
	add r2, r4, #6
	mov r0, #0x43
	mov r1, #1
	bl sub_027F4E10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EA71C: .word 0x0380FFF4
	arm_func_end sub_027EA6B0

	arm_func_start sub_027EA720
sub_027EA720: ; 0x027EA720
	ldr r2, _027EA754 ; =_027F7350
	mov r3, #0
_027EA728:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r1, r2, r3, lsl #2
	add r0, r0, #0x4800000
	add r3, r3, #1
	ldrh r1, [r1, #2]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r3, #0x19
	blo _027EA728
	bx lr
	.align 2, 0
_027EA754: .word _027F7350
	arm_func_end sub_027EA720

	arm_func_start sub_027EA758
sub_027EA758: ; 0x027EA758
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _027EA7BC ; =0x04808160
	mov r1, #0x100
	strh r1, [r0]
	mov r6, #0
	str r6, [sp]
	mov r7, #0x64
	add r4, sp, #0
	mov r5, #1
_027EA77C:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_027F4E10
	ldr r1, [sp]
	mov r0, r6
	bl sub_027EA5F0
	add r6, r6, #1
	cmp r6, #0x69
	add r7, r7, #1
	blo _027EA77C
	mov r0, #0x5a
	mov r1, #2
	bl sub_027EA5F0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EA7BC: .word 0x04808160
	arm_func_end sub_027EA758

	arm_func_start sub_027EA7C0
sub_027EA7C0: ; 0x027EA7C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r0, _027EA93C ; =0x0380FFF4
	ldr r5, _027EA940 ; =_027F72E0
	ldr r0, [r0]
	mov r8, #0
	add r0, r0, #0x1f8
	str r8, [sp]
	add r4, r0, #0x400
	add r6, sp, #0
	mov r7, #2
_027EA7EC:
	mov r0, r8, lsl #1
	mov r1, r7
	mov r2, r6
	add r0, r0, #0x44
	bl sub_027F4E10
	mov r0, r8, lsl #1
	ldrh r0, [r5, r0]
	add r8, r8, #1
	add r0, r0, #0x4800000
	ldr r1, [sp]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r8, #0x10
	blo _027EA7EC
	ldrh r1, [r4, #2]
	ldr r0, _027EA944 ; =0x04808184
	mov r2, r1, lsr #7
	mov r1, r2, lsl #8
	str r1, [sp, #4]
	ldrh r1, [r4, #2]
	mov r7, #0xce
	and r1, r1, #0x7f
	orr r1, r1, r2, lsl #8
	str r1, [sp, #4]
	strh r1, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4]
	and r0, r0, #0x7f
	add r2, r0, #7
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	ldrh r8, [r4, #4]
	cmp r1, #3
	mov r6, r0, asr #3
	bne _027EA8DC
	add r0, r8, #0xce
	add r2, r4, #8
	mov r1, #1
	bl sub_027F4E10
	mov sb, #0
	add r4, sp, #4
	mov r6, sb
	mov r5, #1
	b _027EA8D0
_027EA89C:
	str r6, [sp, #4]
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_027F4E10
	mov r0, sb, lsl #8
	ldr r1, [sp, #4]
	add r0, r0, #0x50000
	orr r0, r1, r0
	str r0, [sp, #4]
	bl sub_027EA620
	add sb, sb, #1
	add r7, r7, #1
_027EA8D0:
	cmp sb, r8
	blo _027EA89C
	b _027EA930
_027EA8DC:
	mov r0, #0
	str r0, [sp, #4]
	add r5, sp, #4
	b _027EA928
_027EA8EC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_027F4E10
	ldr r0, [sp, #4]
	bl sub_027EA620
	ldrh r0, [r4]
	sub r8, r8, #1
	cmp r0, #2
	ldreq r1, [sp, #4]
	add r7, r7, r6
	moveq r0, r1, lsr #0x12
	cmpeq r0, #9
	biceq r0, r1, #0x7c00
	streq r0, [r4, #0xc]
_027EA928:
	cmp r8, #0
	bne _027EA8EC
_027EA930:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027EA93C: .word 0x0380FFF4
_027EA940: .word _027F72E0
_027EA944: .word 0x04808184
	arm_func_end sub_027EA7C0

	arm_func_start sub_027EA948
sub_027EA948: ; 0x027EA948
	stmdb sp!, {r4, lr}
	ldr r0, _027EA998 ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_037FD390
	cmp r0, #0
	addeq r0, r4, #0x300
	ldreqh r1, [r0, #0x3e]
	orreq r1, r1, #0x40
	streqh r1, [r0, #0x3e]
	beq _027EA990
	add r0, r4, #0x208
	add r0, r0, #0x400
	bl sub_037FD3A0
	add r0, r4, #0x234
	add r0, r0, #0x400
	bl sub_037FD3A0
	add r0, r4, #0x660
	bl sub_037FD3A0
_027EA990:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EA998: .word 0x0380FFF4
	arm_func_end sub_027EA948

	arm_func_start sub_027EA99C
sub_027EA99C: ; 0x027EA99C
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_027EA99C

	arm_func_start sub_027EA9A8
sub_027EA9A8: ; 0x027EA9A8
	ldr ip, _027EA9B4 ; =sub_037FB32C
	ldr r1, _027EA9B8 ; =sub_027EA99C
	bx ip
	.align 2, 0
_027EA9B4: .word sub_037FB32C
_027EA9B8: .word sub_027EA99C
	arm_func_end sub_027EA9A8

	arm_func_start sub_027EA9BC
sub_027EA9BC: ; 0x027EA9BC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r2, _027EAA44 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x208
	add r0, r0, #0x400
	bl sub_037FD5C0
	ldr r0, _027EAA48 ; =0x000082EA
	mov r1, #0
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	mov r5, r1
	mla r2, r5, r0, r2
	mov r6, r3, lsr #6
	orr r6, r6, r2, lsl #26
	bl GetCurrentPlaybackTime
	adds r0, r6, r0
	adc r2, r1, #0
	mov r1, r0
	str r4, [sp, #4]
	mov r0, r5
	str r0, [sp, #8]
	ldr r0, _027EAA44 ; =0x0380FFF4
	str r5, [sp]
	ldr r0, [r0]
	mov r3, r6
	add r0, r0, #0x208
	add r0, r0, #0x400
	bl sub_037FD54C
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EAA44: .word 0x0380FFF4
_027EAA48: .word 0x000082EA
	arm_func_end sub_027EA9BC

	arm_func_start sub_027EAA4C
sub_027EAA4C: ; 0x027EAA4C
	ldr r0, _027EAA64 ; =0x0380FFF4
	ldr ip, _027EAA68 ; =sub_037FD5C0
	ldr r0, [r0]
	add r0, r0, #0x208
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_027EAA64: .word 0x0380FFF4
_027EAA68: .word sub_037FD5C0
	arm_func_end sub_027EAA4C

	arm_func_start sub_027EAA6C
sub_027EAA6C: ; 0x027EAA6C
	stmdb sp!, {r4, lr}
	ldr r1, _027EAAE8 ; =0x0380FFF4
	mov r0, #1
	ldr r4, [r1]
	mov r1, #0xa
	ldr r2, [r4, #0x3ec]
	add r2, r2, #1
	str r2, [r4, #0x3ec]
	bl sub_037F8598
	mov r0, #2
	mov r1, #0x12
	bl sub_037F8598
	mov r0, #1
	mov r1, #0x11
	bl sub_037F8598
	add r0, r4, #0x100
	ldrh r0, [r0, #0xfc]
	cmp r0, #0
	beq _027EAAC4
	mov r0, #2
	mov r1, #0x13
	bl sub_037F8598
_027EAAC4:
	add r0, r4, #0x300
	ldrh r0, [r0, #0xf4]
	cmp r0, #0
	beq _027EAAE0
	mov r0, #2
	mov r1, #0x15
	bl sub_037F8598
_027EAAE0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EAAE8: .word 0x0380FFF4
	arm_func_end sub_027EAA6C

	arm_func_start sub_027EAAEC
sub_027EAAEC: ; 0x027EAAEC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _027EAB54 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_037FD5C0
	mov r3, #0
	ldr r0, _027EAB58 ; =0x000082EA
	mov r1, r3
	umull r2, ip, r5, r0
	mla ip, r5, r3, ip
	mla ip, r1, r0, ip
	mov r1, r2, lsr #6
	str r3, [sp]
	ldr r0, _027EAB54 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	mov r2, ip, lsr #6
	add r0, r0, #0x234
	add r0, r0, #0x400
	orr r1, r1, ip, lsl #26
	bl sub_037FD4DC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EAB54: .word 0x0380FFF4
_027EAB58: .word 0x000082EA
	arm_func_end sub_027EAAEC

	arm_func_start sub_027EAB5C
sub_027EAB5C: ; 0x027EAB5C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _027EABD8 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_037FD5C0
	ldr r0, _027EABDC ; =0x000082EA
	mov r3, #0
	umull ip, r2, r5, r0
	mla r2, r5, r3, r2
	mov r1, r3
	mla r2, r1, r0, r2
	mov r0, ip, lsr #6
	mov r1, r2, lsr #6
	orr r0, r0, r2, lsl #26
	mov r2, #0x3e8
	bl sub_03806B80
	mov r2, r1
	mov r1, r0
	mov r0, #0
	str r0, [sp]
	ldr r0, _027EABD8 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_037FD4DC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EABD8: .word 0x0380FFF4
_027EABDC: .word 0x000082EA
	arm_func_end sub_027EAB5C

	arm_func_start sub_027EABE0
sub_027EABE0: ; 0x027EABE0
	ldr r0, _027EABF8 ; =0x0380FFF4
	ldr ip, _027EABFC ; =sub_037FD5C0
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_027EABF8: .word 0x0380FFF4
_027EABFC: .word sub_037FD5C0
	arm_func_end sub_027EABE0

	arm_func_start sub_027EAC00
sub_027EAC00: ; 0x027EAC00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _027EAC74 ; =0x04805F60
	add r2, r2, #1
	mov r5, r1
	bic r2, r2, #1
	add r1, r5, r2
	cmp r1, r3
	mov r6, r0
	subhi r4, r3, r5
	subhi r7, r2, r4
	movls r4, r2
	movls r7, #0
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FDF9C
	cmp r7, #0
	beq _027EAC6C
	ldr r0, _027EAC78 ; =0x0380FFF4
	add r3, r5, r4
	ldr r0, [r0]
	mov r2, r7
	add r0, r0, #0x300
	ldrh r0, [r0, #0xde]
	add r1, r6, r4
	sub r0, r3, r0
	bl sub_037FDF9C
_027EAC6C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EAC74: .word 0x04805F60
_027EAC78: .word 0x0380FFF4
	arm_func_end sub_027EAC00

	arm_func_start sub_027EAC7C
sub_027EAC7C: ; 0x027EAC7C
	ldr ip, _027EAC98 ; =sub_037FDF9C
	mov r3, r0
	add r2, r2, #1
	mov r0, r1
	mov r1, r3
	bic r2, r2, #1
	bx ip
	.align 2, 0
_027EAC98: .word sub_037FDF9C
	arm_func_end sub_027EAC7C

	arm_func_start sub_027EAC9C
sub_027EAC9C: ; 0x027EAC9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_037FDF9C
	cmp r4, #0
	beq _027EACD8
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x24
	bic r2, r2, #1
	bl sub_037FDF9C
_027EACD8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027EAC9C

	arm_func_start sub_027EACE0
sub_027EACE0: ; 0x027EACE0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_037FDF9C
	cmp r4, #0
	beq _027EAD1C
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x28
	bic r2, r2, #1
	bl sub_037FDF9C
_027EAD1C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027EACE0

	arm_func_start sub_027EAD24
sub_027EAD24: ; 0x027EAD24
	tst r0, #1
	ldrneh r2, [r0, #-1]
	andne r2, r2, #0xff
	orrne r1, r2, r1, lsl #8
	strneh r1, [r0, #-1]
	ldreqh r2, [r0]
	andeq r1, r1, #0xff
	andeq r2, r2, #0xff00
	orreq r1, r2, r1
	streqh r1, [r0]
	bx lr
	arm_func_end sub_027EAD24

	arm_func_start sub_027EAD50
sub_027EAD50: ; 0x027EAD50
	tst r0, #1
	ldrneh r0, [r0, #-1]
	movne r0, r0, asr #8
	ldreqh r0, [r0]
	and r0, r0, #0xff
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_027EAD50

	arm_func_start sub_027EAD6C
sub_027EAD6C: ; 0x027EAD6C
	ldr r3, _027EAD98 ; =0x0380FFF4
	ldr r2, _027EAD9C ; =0x0000FFF8
	ldr r3, [r3]
	and r0, r0, r2
	add r2, r0, #5
	add r0, r3, #0x500
	strh r2, [r0, #0xf0]
	add r2, r3, #0x5f0
	orr r0, r1, #1
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_027EAD98: .word 0x0380FFF4
_027EAD9C: .word 0x0000FFF8
	arm_func_end sub_027EAD6C

	arm_func_start sub_027EADA0
sub_027EADA0: ; 0x027EADA0
	ldr r1, _027EADB4 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	strh r0, [r1, #0xf4]
	bx lr
	.align 2, 0
_027EADB4: .word 0x0380FFF4
	arm_func_end sub_027EADA0

	arm_func_start sub_027EADB8
sub_027EADB8: ; 0x027EADB8
	ldr r0, _027EADE4 ; =0x0380FFF4
	ldr r0, [r0]
	add r3, r0, #0x5f0
	add r0, r0, #0x500
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	ldrh r0, [r0, #0xf0]
	mla r0, r1, r0, r2
	strh r0, [r3, #4]
	ldrh r0, [r3, #4]
	bx lr
	.align 2, 0
_027EADE4: .word 0x0380FFF4
	arm_func_end sub_027EADB8

	arm_func_start sub_027EADE8
sub_027EADE8: ; 0x027EADE8
	stmdb sp!, {r4, lr}
	ldr r2, _027EAE60 ; =_027F72C0
	mov r4, r1, lsl #0x1c
	ldr r3, _027EAE64 ; =0x00000FFF
	mov r4, r4, lsr #0x1b
	mov ip, r0, lsl #0x1c
	mov lr, ip, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r4, [r2, r4]
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #4
	mov r0, r0, lsl #0x1c
	mov ip, r0, lsr #0x1b
	ldrh r0, [r2, lr]
	eor r1, r4, r1, lsr #16
	eor r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #0x1c
	mov r0, r0, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r3, [r2, r0]
	mov r0, r1, lsl #0x10
	ldrh r1, [r2, ip]
	eor r0, r3, r0, lsr #16
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EAE60: .word _027F72C0
_027EAE64: .word 0x00000FFF
	arm_func_end sub_027EADE8

	arm_func_start sub_027EAE68
sub_027EAE68: ; 0x027EAE68
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r1, _027EAEDC ; =0x0000B6B8
	ldrh r2, [r4, #-4]
	sub lr, r4, #4
	cmp r2, r1
	ldreqh r2, [lr, #2]
	ldreq r1, _027EAEE0 ; =0x00001D46
	cmpeq r2, r1
	moveq r0, #0
	beq _027EAED4
	ldr r3, _027EAEDC ; =0x0000B6B8
	mov ip, #1
	strh ip, [r4, #0xa]
	ldr r2, _027EAEE0 ; =0x00001D46
	strh r3, [lr]
	strh r2, [lr, #2]
	ldr r1, [r0, #8]
	ldr r0, _027EAEE4 ; =0x0380FFF4
	strh r3, [r1, #0xc]
	strh r2, [r1, #0xe]
	ldr r1, [r0]
	mov r0, ip
	add r1, r1, #0x300
	ldrh r2, [r1, #0xfa]
	add r2, r2, #1
	strh r2, [r1, #0xfa]
_027EAED4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EAEDC: .word 0x0000B6B8
_027EAEE0: .word 0x00001D46
_027EAEE4: .word 0x0380FFF4
	arm_func_end sub_027EAE68

	arm_func_start sub_027EAEE8
sub_027EAEE8: ; 0x027EAEE8
	ldr r0, _027EAF20 ; =0x04808004
	mov r1, #0
	strh r1, [r0]
	mov r2, #0x10
	add r1, r0, #0x210
	b _027EAF14
_027EAF00:
	ldrh r0, [r1]
	cmp r0, #0
	cmpne r0, #9
	bxeq lr
	sub r2, r2, #1
_027EAF14:
	cmp r2, #0
	bne _027EAF00
	bx lr
	.align 2, 0
_027EAF20: .word 0x04808004
	arm_func_end sub_027EAEE8

	arm_func_start sub_027EAF24
sub_027EAF24: ; 0x027EAF24
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _027EAF64
	bl sub_027EAEE8
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	sub r1, r1, #0x10
	bl sub_027F0114
	ldr r0, _027EAF6C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0xfc]
	add r1, r1, #1
	strh r1, [r0, #0xfc]
_027EAF64:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EAF6C: .word 0x0380FFF4
	arm_func_end sub_027EAF24

	arm_func_start sub_027EAF70
sub_027EAF70: ; 0x027EAF70
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027EB064 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x300
	ldrh r1, [r0, #0x50]
	add r0, r2, #0x2c
	cmp r1, #1
	add r4, r2, #0x344
	add r5, r0, #0x400
	beq _027EAFA8
	cmp r1, #2
	beq _027EAFDC
	cmp r1, #3
	b _027EB018
_027EAFA8:
	add r0, r5, #0x78
	bl sub_027EAE68
	cmp r0, #0
	beq _027EAFC0
	bl sub_027EAEE8
	bl sub_027F1204
_027EAFC0:
	add r0, r5, #0x28
	bl sub_027EAE68
	cmp r0, #0
	beq _027EB018
	add r0, r5, #0x28
	bl sub_027EAF24
	b _027EB018
_027EAFDC:
	add r0, r5, #0x64
	bl sub_027EAE68
	add r0, r5, #0x28
	bl sub_027EAE68
	cmp r0, #0
	beq _027EB018
	ldrh r0, [r5, #0x28]
	cmp r0, #0
	beq _027EB004
	bl sub_027EAEE8
_027EB004:
	ldrh r0, [r4, #0x6a]
	bl sub_027F1F50
	ldrh r0, [r4, #0xb8]
	add r0, r0, #1
	strh r0, [r4, #0xb8]
_027EB018:
	add r0, r5, #0x14
	bl sub_027EAE68
	cmp r0, #0
	beq _027EB030
	add r0, r5, #0x14
	bl sub_027EAF24
_027EB030:
	mov r0, r5
	bl sub_027EAE68
	cmp r0, #0
	beq _027EB048
	mov r0, r5
	bl sub_027EAF24
_027EB048:
	ldr r1, _027EB068 ; =0x04808004
	ldrh r0, [r1]
	cmp r0, #0
	moveq r0, #1
	streqh r0, [r1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EB064: .word 0x0380FFF4
_027EB068: .word 0x04808004
	arm_func_end sub_027EAF70

	arm_func_start sub_027EB06C
sub_027EB06C: ; 0x027EB06C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x1000000
	bl ClearIeFlag
	ldr r1, _027EB0AC ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0xf4]
	orr r2, r2, r4
	strh r2, [r1, #0xf4]
	bl sub_037FB8F0
	mov r0, #2
	mov r1, #0x15
	bl sub_037F8598
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EB0AC: .word 0x0380FFF4
	arm_func_end sub_027EB06C

	arm_func_start sub_027EB0B0
sub_027EB0B0: ; 0x027EB0B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027EB128 ; =0x0380FFF4
	ldr r1, [r0]
	add r4, r1, #0x344
	ldrh r0, [r4, #0xb0]
	cmp r0, #0
	beq _027EB120
	add r0, r1, #0x188
	mov r1, #0x12
	bl sub_037F886C
	movs r5, r0
	beq _027EB120
	ldr r1, _027EB12C ; =0x00000186
	mov r0, #1
	strh r1, [r5, #0xc]
	strh r0, [r5, #0xe]
	mov r0, #0x1000000
	bl ClearIeFlag
	ldrh r2, [r4, #0xb0]
	mov r1, #0
	strh r2, [r5, #0x10]
	strh r1, [r4, #0xb0]
	bl sub_037FB8F0
	ldr r0, _027EB128 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
_027EB120:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EB128: .word 0x0380FFF4
_027EB12C: .word 0x00000186
	arm_func_end sub_027EB0B0

	arm_func_start sub_027EB130
sub_027EB130: ; 0x027EB130
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _027EB1C8 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x8000
	strh r1, [r0, #0x3e]
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	beq _027EB19C
	bl sub_037F9198
	ldr r2, _027EB1C8 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x400
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _027EB198
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r2]
	mov r1, #6
	ldr r0, [r0, #0x420]
	strh r1, [r0, #4]
	bl sub_027EDB14
_027EB198:
	bl sub_027E9CF4
_027EB19C:
	ldr r4, _027EB1CC ; =0x0000FFFF
	mov r5, #3
_027EB1A4:
	mov r0, r5
	bl sub_037F8650
	cmp r0, r4
	bne _027EB1A4
	mov r0, #3
	mov r1, #0x17
	bl sub_037F8598
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EB1C8: .word 0x0380FFF4
_027EB1CC: .word 0x0000FFFF
	arm_func_end sub_027EB130

	arm_func_start sub_027EB1D0
sub_027EB1D0: ; 0x027EB1D0
	stmdb sp!, {r4, lr}
	ldr r0, _027EB21C ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_027EB8E0
	ldr r1, _027EB21C ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x318]
	sub r1, r1, #0xc
	bl sub_037F8908
	ldr r1, _027EB21C ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x3e0]
	sub r1, r1, #0xc
	bl sub_037F8908
	bl sub_037FC15C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EB21C: .word 0x0380FFF4
	arm_func_end sub_027EB1D0

	arm_func_start sub_027EB220
sub_027EB220: ; 0x027EB220
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r0, _027EB3B4 ; =_027F7554
	ldr r6, _027EB3B8 ; =_027F74E4
	mov r3, ip
	mov r1, ip
	b _027EB294
_027EB23C:
	mov r4, r3, lsl #1
	ldrh r5, [r6, r4]
	mov r2, r1
	b _027EB288
_027EB24C:
	mov lr, r2, lsl #2
	add r4, r0, r2, lsl #2
	ldrh lr, [r0, lr]
	ldrh r4, [r4, #2]
	add lr, lr, #0x4800000
	and r4, r5, r4
	add lr, lr, #0x8000
	strh r4, [lr]
	ldrh lr, [lr]
	cmp lr, r4
	beq _027EB284
	cmp ip, #0x20
	add ip, ip, #1
	bhi _027EB38C
_027EB284:
	add r2, r2, #1
_027EB288:
	cmp r2, #0x1b
	blo _027EB24C
	add r3, r3, #1
_027EB294:
	cmp r3, #3
	blo _027EB23C
	ldr r4, _027EB3BC ; =0x00001234
	ldr r3, _027EB3B4 ; =_027F7554
	mov r5, #0
_027EB2A8:
	mov r0, r5, lsl #2
	add r1, r3, r5, lsl #2
	ldrh r0, [r3, r0]
	ldrh r2, [r1, #2]
	add r1, r4, #0x234
	add r0, r0, #0x4800000
	add r1, r1, #0x1000
	add r5, r5, #1
	and r2, r4, r2
	add r0, r0, #0x8000
	mov r1, r1, lsl #0x10
	strh r2, [r0]
	cmp r5, #0x1b
	mov r4, r1, lsr #0x10
	blo _027EB2A8
	ldr r5, _027EB3BC ; =0x00001234
	ldr r3, _027EB3B4 ; =_027F7554
	mov r4, #0
	b _027EB33C
_027EB2F4:
	mov r0, r4, lsl #2
	ldrh r0, [r3, r0]
	add r1, r3, r4, lsl #2
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	ldrh r1, [r1, #2]
	ldrh r2, [r0]
	and r0, r5, r1
	cmp r2, r0
	beq _027EB328
	cmp ip, #0x20
	add ip, ip, #1
	bhi _027EB38C
_027EB328:
	add r0, r5, #0x234
	add r0, r0, #0x1000
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	add r4, r4, #1
_027EB33C:
	cmp r4, #0x1b
	blo _027EB2F4
	mov r3, #0
	ldr r2, _027EB3B4 ; =_027F7554
	mov r1, r3
	b _027EB384
_027EB354:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _027EB380
	cmp ip, #0x20
	add ip, ip, #1
	bhi _027EB38C
_027EB380:
	add r3, r3, #1
_027EB384:
	cmp r3, #0x1b
	blo _027EB354
_027EB38C:
	cmp ip, #0
	beq _027EB3AC
	ldr r0, _027EB3C0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #1
	strh r1, [r0, #0x3e]
_027EB3AC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EB3B4: .word _027F7554
_027EB3B8: .word _027F74E4
_027EB3BC: .word 0x00001234
_027EB3C0: .word 0x0380FFF4
	arm_func_end sub_027EB220

	arm_func_start sub_027EB3C4
sub_027EB3C4: ; 0x027EB3C4
	stmdb sp!, {r3, lr}
	ldr lr, _027EB53C ; =0x04804000
	mov r0, #0
	ldr r3, _027EB540 ; =0x0000FFFF
	mov r2, r0
_027EB3D8:
	sub r1, r3, #1
	mov ip, r3
	mov r1, r1, lsl #0x10
	add r2, r2, #2
	cmp r2, #0x2000
	mov r3, r1, lsr #0x10
	strh ip, [lr], #2
	blo _027EB3D8
	ldr r2, _027EB53C ; =0x04804000
	ldr r3, _027EB540 ; =0x0000FFFF
	mov ip, #0
	b _027EB434
_027EB408:
	ldrh r1, [r2]
	cmp r1, r3
	beq _027EB420
	cmp r0, #0x20
	add r0, r0, #1
	bhi _027EB514
_027EB420:
	sub r1, r3, #1
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_027EB434:
	cmp ip, #0x2000
	blo _027EB408
	ldr r2, _027EB53C ; =0x04804000
	ldr r3, _027EB544 ; =0x00005A5A
	mov ip, #0
_027EB448:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _027EB448
	ldr r2, _027EB53C ; =0x04804000
	ldr r3, _027EB544 ; =0x00005A5A
	mov ip, #0
	b _027EB4A0
_027EB474:
	ldrh r1, [r2]
	cmp r1, r3
	beq _027EB48C
	cmp r0, #0x20
	add r0, r0, #1
	bhi _027EB514
_027EB48C:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_027EB4A0:
	cmp ip, #0x2000
	blo _027EB474
	ldr r2, _027EB53C ; =0x04804000
	ldr r3, _027EB548 ; =0x0000A5A5
	mov ip, #0
_027EB4B4:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _027EB4B4
	ldr r2, _027EB53C ; =0x04804000
	ldr r3, _027EB548 ; =0x0000A5A5
	mov ip, #0
	b _027EB50C
_027EB4E0:
	ldrh r1, [r2]
	cmp r1, r3
	beq _027EB4F8
	cmp r0, #0x20
	add r0, r0, #1
	bhi _027EB514
_027EB4F8:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_027EB50C:
	cmp ip, #0x2000
	blo _027EB4E0
_027EB514:
	cmp r0, #0
	beq _027EB534
	ldr r0, _027EB54C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #2
	strh r1, [r0, #0x3e]
_027EB534:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EB53C: .word 0x04804000
_027EB540: .word 0x0000FFFF
_027EB544: .word 0x00005A5A
_027EB548: .word 0x0000A5A5
_027EB54C: .word 0x0380FFF4
	arm_func_end sub_027EB3C4

	arm_func_start sub_027EB550
sub_027EB550: ; 0x027EB550
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _027EB824 ; =0x0380FFF4
	mov r7, #0
	ldr r0, [r0]
	mov r6, #0
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	mov r5, #0xff
	cmp r0, #5
	ldreq sl, _027EB828 ; =_027F74EA
	mvn r4, #0
	ldrne sl, _027EB82C ; =_027F751C
	b _027EB5A0
_027EB584:
	mov r0, r6
	mov r1, r5
	bl sub_027EA5F0
	cmp r0, r4
	moveq r7, #1
	beq _027EB7FC
	add r6, r6, #1
_027EB5A0:
	cmp r6, #0x69
	blo _027EB584
	mov r5, #0
	mov r4, r5
	b _027EB5F0
_027EB5B4:
	mov r0, r4, lsl #1
	ldrh r0, [sl, r0]
	cmp r5, r0
	addeq r4, r4, #1
	beq _027EB5EC
	mov r0, r5
	bl sub_027EA5C4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xff
	beq _027EB5EC
	cmp r7, #0x20
	add r7, r7, #1
	bhi _027EB7FC
_027EB5EC:
	add r5, r5, #1
_027EB5F0:
	cmp r5, #0x69
	blo _027EB5B4
	mov r5, #0
	mov r4, r5
_027EB600:
	mov r0, r5
	mov r1, r4
	bl sub_027EA5F0
	add r5, r5, #1
	cmp r5, #0x69
	blo _027EB600
	mov r4, #0
	mov r5, r4
	b _027EB65C
_027EB624:
	mov r0, r5, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r5, r5, #1
	beq _027EB658
	mov r0, r4
	bl sub_027EA5C4
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	beq _027EB658
	cmp r7, #0x20
	add r7, r7, #1
	bhi _027EB7FC
_027EB658:
	add r4, r4, #1
_027EB65C:
	cmp r4, #0x69
	blo _027EB624
	mov r4, #0x55
	mov r5, #0
_027EB66C:
	mov r0, r5
	mov r1, r4
	bl sub_027EA5F0
	mvn r0, r4
	add r5, r5, #1
	mov r0, r0, lsl #0x10
	cmp r5, #0x69
	mov r4, r0, lsr #0x10
	blo _027EB66C
	mov r4, #0
	mov r6, r4
	mov r5, #0x55
	b _027EB6E4
_027EB6A0:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _027EB6D8
	mov r0, r4
	bl sub_027EA5C4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _027EB6D8
	cmp r7, #0x20
	add r7, r7, #1
	bhi _027EB7FC
_027EB6D8:
	mvn r0, r5
	and r5, r0, #0xff
	add r4, r4, #1
_027EB6E4:
	cmp r4, #0x69
	blo _027EB6A0
	mov r5, #0xff
	mov r4, #0
_027EB6F4:
	mov r0, r4
	mov r1, r5
	bl sub_027EA5F0
	sub r0, r5, #1
	add r4, r4, #1
	mov r0, r0, lsl #0x10
	cmp r4, #0x69
	mov r5, r0, lsr #0x10
	blo _027EB6F4
	mov r4, #0
	mov r6, r4
	mov r5, #0xff
	b _027EB770
_027EB728:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _027EB760
	mov r0, r4
	bl sub_027EA5C4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _027EB760
	cmp r7, #0x20
	add r7, r7, #1
	bhi _027EB7FC
_027EB760:
	sub r0, r5, #1
	mov r0, r0, lsl #0x10
	add r4, r4, #1
	mov r5, r0, lsr #0x10
_027EB770:
	cmp r4, #0x69
	blo _027EB728
	mov r8, #0
	mov sb, r8
	mov r4, #1
	mov fp, r8
	b _027EB7F4
_027EB78C:
	mov r0, sb, lsl #1
	ldrh r0, [sl, r0]
	cmp r8, r0
	addeq sb, sb, #1
	beq _027EB7F0
	mov r6, r4
	mov r5, fp
	b _027EB7E8
_027EB7AC:
	mov r0, r8
	mov r1, r6
	bl sub_027EA5F0
	mov r0, r8
	bl sub_027EA5C4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r6
	beq _027EB7DC
	cmp r7, #0x20
	add r7, r7, #1
	bhi _027EB7FC
_027EB7DC:
	mov r0, r6, lsl #1
	and r6, r0, #0xff
	add r5, r5, #1
_027EB7E8:
	cmp r5, #9
	blo _027EB7AC
_027EB7F0:
	add r8, r8, #1
_027EB7F4:
	cmp r8, #0x69
	blo _027EB78C
_027EB7FC:
	cmp r7, #0
	beq _027EB81C
	ldr r0, _027EB824 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #8
	strh r1, [r0, #0x3e]
_027EB81C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027EB824: .word 0x0380FFF4
_027EB828: .word _027F74EA
_027EB82C: .word _027F751C
	arm_func_end sub_027EB550

	arm_func_start sub_027EB830
sub_027EB830: ; 0x027EB830
	ldr r0, _027EB840 ; =0x04808010
	mov r1, #0x800
	strh r1, [r0]
	bx lr
	.align 2, 0
_027EB840: .word 0x04808010
	arm_func_end sub_027EB830

	arm_func_start sub_027EB844
sub_027EB844: ; 0x027EB844
	stmdb sp!, {r4, lr}
	ldrh r1, [r0]
	mov r4, #0
	cmp r1, #2
	bne _027EB884
	ldr r2, _027EB8B4 ; =0x04808094
	ldr r3, [r0, #8]
	ldr r1, _027EB8B8 ; =0x00003FFF
	ldrh r2, [r2]
	and r1, r3, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	cmp r1, r2
	movne r1, #1
	strneh r1, [r0]
	orrne r4, r4, #1
_027EB884:
	ldrh r1, [r0]
	cmp r1, #1
	bne _027EB8A8
	ldr r1, [r0, #8]
	ldrh r1, [r1]
	tst r1, #1
	beq _027EB8A8
	bl sub_027F0AB8
	orr r4, r4, #2
_027EB8A8:
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EB8B4: .word 0x04808094
_027EB8B8: .word 0x00003FFF
	arm_func_end sub_027EB844

	arm_func_start sub_027EB8BC
sub_027EB8BC: ; 0x027EB8BC
	stmdb sp!, {r3, lr}
	ldr r1, _027EB8DC ; =sub_037F92DC
	mov r0, #0x1000000
	bl sub_037FB7BC
	mov r0, #0x1000000
	bl sub_037FB8F0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EB8DC: .word sub_037F92DC
	arm_func_end sub_027EB8BC

	arm_func_start sub_027EB8E0
sub_027EB8E0: ; 0x027EB8E0
	stmdb sp!, {r3, lr}
	mov r0, #0x1000000
	bl ClearIeFlag
	mov r0, #0x1000000
	mov r1, #0
	bl sub_037FB7BC
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027EB8E0

	arm_func_start sub_027EB900
sub_027EB900: ; 0x027EB900
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #1
	movne r0, #0
	bne _027EB99C
	ldr r4, _027EB9A4 ; =0x0380FFF4
	ldr r0, [r4]
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r1, #1
	bls _027EB998
	ldr r1, [r0, #0x31c]
	mov r7, #0
	add r5, r1, #0x1c
	mov r6, #1
	b _027EB988
_027EB944:
	ldrh r1, [r5]
	cmp r1, #0
	beq _027EB980
	mov r1, r8
	add r0, r5, #4
	bl sub_027EA474
	cmp r0, #0
	movne r0, r6
	bne _027EB99C
	ldr r0, [r4]
	add r7, r7, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r7, r1
	bhs _027EB998
_027EB980:
	add r6, r6, #1
	add r5, r5, #0x1c
_027EB988:
	add r1, r0, #0x300
	ldrh r1, [r1, #0x22]
	cmp r6, r1
	blo _027EB944
_027EB998:
	mov r0, #0xff
_027EB99C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027EB9A4: .word 0x0380FFF4
	arm_func_end sub_027EB900

	arm_func_start sub_027EB9A8
sub_027EB9A8: ; 0x027EB9A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r5, _027EBAE4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r5]
	ldrh r1, [r4]
	add r6, r0, #0x31c
	tst r1, #1
	movne r0, #0
	bne _027EBADC
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	mov r8, #1
	cmp r1, #1
	bls _027EBA58
	ldr r1, [r6]
	mov sl, #0
	mov sb, sl
	add r7, r1, #0x1c
	b _027EBA44
_027EB9F4:
	ldrh r1, [r7]
	cmp r1, #0
	beq _027EBA34
	mov r1, r4
	add r0, r7, #4
	bl sub_027EA474
	cmp r0, #0
	movne r0, r8
	bne _027EBADC
	ldr r0, [r5]
	add sb, sb, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp sb, r1
	bhs _027EBA50
	b _027EBA3C
_027EBA34:
	cmp sl, #0
	moveq sl, r8
_027EBA3C:
	add r8, r8, #1
	add r7, r7, #0x1c
_027EBA44:
	ldrh r1, [r6, #6]
	cmp r8, r1
	blo _027EB9F4
_027EBA50:
	cmp sl, #0
	movne r8, sl
_027EBA58:
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _027EBACC
	ldr r7, [r6]
	ldrh r5, [r6, #6]
	mov r3, #0x10000
	mov r6, #1
	mov r8, #0
	mov r0, #0x1c
	b _027EBAB8
_027EBA84:
	mul r2, r6, r0
	ldrh r1, [r7, r2]
	add r2, r7, r2
	cmp r1, #0x30
	bhs _027EBAB4
	ldrh r1, [r2, #0x16]
	cmp r1, #0
	bne _027EBAB4
	ldrh r1, [r2, #0x18]
	cmp r3, r1
	movhi r3, r1
	movhi r8, r6
_027EBAB4:
	add r6, r6, #1
_027EBAB8:
	cmp r6, r5
	blo _027EBA84
	cmp r8, #0
	moveq r0, #0xff
	beq _027EBADC
_027EBACC:
	mov r0, r8
	mov r1, r4
	bl sub_027EC598
	mov r0, r8
_027EBADC:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027EBAE4: .word 0x0380FFF4
	arm_func_end sub_027EB9A8

	arm_func_start sub_027EBAE8
sub_027EBAE8: ; 0x027EBAE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _027EBB40 ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov r0, #0x1000000
	add r4, r2, #0x1ac
	mov r6, r1
	bl ClearIeFlag
	ldrh r1, [r4, #8]
	mov r5, r0
	cmp r1, #0
	bne _027EBB20
	mov r0, #0
	bl sub_027EC10C
_027EBB20:
	mov r0, r7
	mov r1, r4
	mov r2, r6
	bl sub_037F8988
	mov r0, r5
	bl sub_037FB8F0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EBB40: .word 0x0380FFF4
	arm_func_end sub_027EBAE8

	arm_func_start sub_027EBB44
sub_027EBB44: ; 0x027EBB44
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _027EBBD0 ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl ClearIeFlag
	ldr r1, _027EBBD0 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #0
	bne _027EBB94
	mov r0, r5
	bl sub_027EC10C
_027EBB94:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	add r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_037FB8F0
	ldr r0, _027EBBD0 ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	ldreqh r0, [r6, #0x1a]
	streqh r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EBBD0: .word 0x0380FFF4
	arm_func_end sub_027EBB44

	arm_func_start sub_027EBBD4
sub_027EBBD4: ; 0x027EBBD4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _027EBC40 ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl ClearIeFlag
	ldr r1, _027EBC40 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #1
	bne _027EBC24
	mov r0, r5
	bl sub_027EC1C8
_027EBC24:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	sub r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_037FB8F0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EBC40: .word 0x0380FFF4
	arm_func_end sub_027EBBD4

	arm_func_start sub_027EBC44
sub_027EBC44: ; 0x027EBC44
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #0x1000000
	mov r5, r1
	bl ClearIeFlag
	ldr r3, _027EBD28 ; =0x0380FFF4
	mov r4, r0
	cmp r5, #0x40
	bhs _027EBCC4
	ldr r0, [r3]
	mov r2, #1
	add r0, r0, #0x500
	ldrh r1, [r0, #0x30]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x30]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _027EBD00
	mov r0, r6
	bl sub_027EC0CC
	cmp r0, #0
	beq _027EBD00
	mov r0, r6
	bl sub_027EBF60
	b _027EBD00
_027EBCC4:
	ldr r2, [r3]
	mov r0, #1
	mvn r1, r0, lsl r6
	add r0, r2, #0x500
	ldrh r2, [r0, #0x32]
	and r1, r2, r1
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x2e]
	mov r0, r0, asr r6
	tst r0, #1
	beq _027EBD00
	mov r0, r6
	bl sub_027EBDA8
_027EBD00:
	ldr r1, _027EBD28 ; =0x0380FFF4
	mov r0, #0x1c
	ldr r2, [r1]
	mul r1, r6, r0
	ldr r2, [r2, #0x31c]
	mov r0, r4
	strh r5, [r2, r1]
	bl sub_037FB8F0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EBD28: .word 0x0380FFF4
	arm_func_end sub_027EBC44

	arm_func_start sub_027EBD2C
sub_027EBD2C: ; 0x027EBD2C
	ldr r3, _027EBD48 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xa]
	bx lr
	.align 2, 0
_027EBD48: .word 0x0380FFF4
	arm_func_end sub_027EBD2C

	arm_func_start sub_027EBD4C
sub_027EBD4C: ; 0x027EBD4C
	ldr r3, _027EBD9C ; =0x0380FFF4
	mov r2, #1
	ldr ip, [r3]
	mvn r3, r2, lsl r0
	add r2, ip, #0x12c
	add ip, r2, #0x400
	ldrh r2, [ip, #2]
	and r2, r2, r3
	orr r0, r2, r1, lsl r0
	strh r0, [ip, #2]
	ldrh r0, [ip, #6]
	ldrh r1, [ip, #2]
	mvn r0, r0
	tst r1, r0
	ldrne r0, _027EBDA0 ; =0x048080AC
	mov r1, #8
	strneh r1, [r0]
	ldreq r0, _027EBDA4 ; =0x048080AE
	streqh r1, [r0]
	bx lr
	.align 2, 0
_027EBD9C: .word 0x0380FFF4
_027EBDA0: .word 0x048080AC
_027EBDA4: .word 0x048080AE
	arm_func_end sub_027EBD4C

	arm_func_start sub_027EBDA8
sub_027EBDA8: ; 0x027EBDA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027EBDDC
	ldr r1, _027EBDE4 ; =0x0380FFF4
	mov r0, #1
	ldr r2, [r1]
	mvn r1, r0, lsl r4
	add r0, r2, #0x500
	ldrh r2, [r0, #0x30]
	and r1, r2, r1
	strh r1, [r0, #0x30]
_027EBDDC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EBDE4: .word 0x0380FFF4
	arm_func_end sub_027EBDA8

	arm_func_start sub_027EBDE8
sub_027EBDE8: ; 0x027EBDE8
	ldr r1, _027EBE08 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r3, [r1, #0x30]
	orr r0, r3, r2, lsl r0
	strh r0, [r1, #0x30]
	bx lr
	.align 2, 0
_027EBE08: .word 0x0380FFF4
	arm_func_end sub_027EBDE8

	arm_func_start sub_027EBE0C
sub_027EBE0C: ; 0x027EBE0C
	ldr r3, _027EBE28 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xc]
	bx lr
	.align 2, 0
_027EBE28: .word 0x0380FFF4
	arm_func_end sub_027EBE0C

	arm_func_start sub_027EBE2C
sub_027EBE2C: ; 0x027EBE2C
	ldr r3, _027EBE48 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x10]
	bx lr
	.align 2, 0
_027EBE48: .word 0x0380FFF4
	arm_func_end sub_027EBE2C

	arm_func_start sub_027EBE4C
sub_027EBE4C: ; 0x027EBE4C
	ldr r3, _027EBE68 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x14]
	bx lr
	.align 2, 0
_027EBE68: .word 0x0380FFF4
	arm_func_end sub_027EBE4C

	arm_func_start sub_027EBE6C
sub_027EBE6C: ; 0x027EBE6C
	ldr r3, _027EBE88 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xe]
	bx lr
	.align 2, 0
_027EBE88: .word 0x0380FFF4
	arm_func_end sub_027EBE6C

	arm_func_start sub_027EBE8C
sub_027EBE8C: ; 0x027EBE8C
	ldr r2, _027EBEAC ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x1a]
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_027EBEAC: .word 0x0380FFF4
	arm_func_end sub_027EBE8C

	arm_func_start sub_027EBEB0
sub_027EBEB0: ; 0x027EBEB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027EBF5C ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x1000000
	add r1, r1, #0x12c
	add r4, r1, #0x400
	bl ClearIeFlag
	mov r6, r0
	mov r5, #1
	mov r1, #2
	b _027EBF40
_027EBEE0:
	ldrh r0, [r4, #0xe]
	tst r0, r1
	bne _027EBF38
	orr r0, r0, r1
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _027EBF10
	bl sub_027E9EE0
_027EBF10:
	ldr r0, _027EBF5C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r0]
	mov r0, r6
	ldr r2, [r2, #0x31c]
	mla r1, r7, r1, r2
	strh r5, [r1, #2]
	bl sub_037FB8F0
	mov r0, r5
	b _027EBF54
_027EBF38:
	add r5, r5, #1
	mov r1, r1, lsl #1
_027EBF40:
	cmp r5, #0x10
	blo _027EBEE0
	mov r0, r6
	bl sub_037FB8F0
	mov r0, #0
_027EBF54:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EBF5C: .word 0x0380FFF4
	arm_func_end sub_027EBEB0

	arm_func_start sub_027EBF60
sub_027EBF60: ; 0x027EBF60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027EBFDC ; =0x0380FFF4
	mov r5, r0
	ldr r4, [r1]
	bl sub_027EC1C8
	mov r0, r5
	bl sub_027EC0CC
	cmp r0, #0
	beq _027EBFD4
	ldr r1, _027EBFDC ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r1]
	mov r1, #0x1c
	ldr r3, [r3, #0x31c]
	mov ip, #0
	mla r1, r5, r1, r3
	strh ip, [r1, #2]
	add r1, r4, #0x500
	ldrh r3, [r1, #0x3a]
	mvn r0, r2, lsl r0
	and r0, r3, r0
	strh r0, [r1, #0x3a]
	ldrh r0, [r1, #0x38]
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _027EBFD4
	bl sub_027E9E94
_027EBFD4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EBFDC: .word 0x0380FFF4
	arm_func_end sub_027EBF60

	arm_func_start sub_027EBFE0
sub_027EBFE0: ; 0x027EBFE0
	ldr r2, _027EBFFC ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	mul r1, r0, r1
	ldr r0, [r2, #0x31c]
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
_027EBFFC: .word 0x0380FFF4
	arm_func_end sub_027EBFE0

	arm_func_start sub_027EC000
sub_027EC000: ; 0x027EC000
	ldr r1, _027EC01C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x30]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_027EC01C: .word 0x0380FFF4
	arm_func_end sub_027EC000

	arm_func_start sub_027EC020
sub_027EC020: ; 0x027EC020
	ldr r1, _027EC03C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x2e]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_027EC03C: .word 0x0380FFF4
	arm_func_end sub_027EC020

	arm_func_start sub_027EC040
sub_027EC040: ; 0x027EC040
	ldr r2, _027EC05C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	add r0, r1, #4
	bx lr
	.align 2, 0
_027EC05C: .word 0x0380FFF4
	arm_func_end sub_027EC040

	arm_func_start sub_027EC060
sub_027EC060: ; 0x027EC060
	ldr r2, _027EC07C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_027EC07C: .word 0x0380FFF4
	arm_func_end sub_027EC060

	arm_func_start sub_027EC080
sub_027EC080: ; 0x027EC080
	ldr r2, _027EC09C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x14]
	bx lr
	.align 2, 0
_027EC09C: .word 0x0380FFF4
	arm_func_end sub_027EC080

	arm_func_start sub_027EC0A0
sub_027EC0A0: ; 0x027EC0A0
	ldr r2, _027EC0C8 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x10]
	tst r0, #2
	movne r0, #0x14
	moveq r0, #0xa
	bx lr
	.align 2, 0
_027EC0C8: .word 0x0380FFF4
	arm_func_end sub_027EC0A0

	arm_func_start sub_027EC0CC
sub_027EC0CC: ; 0x027EC0CC
	ldr r2, _027EC0E8 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_027EC0E8: .word 0x0380FFF4
	arm_func_end sub_027EC0CC

	arm_func_start sub_027EC0EC
sub_027EC0EC: ; 0x027EC0EC
	ldr r2, _027EC108 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_027EC108: .word 0x0380FFF4
	arm_func_end sub_027EC0EC

	arm_func_start sub_027EC10C
sub_027EC10C: ; 0x027EC10C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027EC1B8
	ldr r0, _027EC1C0 ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r0]
	add r0, r2, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	bne _027EC1B8
	add r0, r2, #0x300
	ldrh r2, [r0, #0xd8]
	ldr r1, _027EC1C4 ; =0x0480425C
	mov r0, #0x1000000
	add r6, r2, r1
	bl ClearIeFlag
	mov r4, r0
	cmp r5, #0
	bne _027EC17C
	add r0, r6, #4
	bl sub_027EAD50
	orr r1, r0, #1
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_027EAD24
	b _027EC1B0
_027EC17C:
	mov r0, r5
	bl sub_027EC0CC
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_027EAD50
	and r1, r5, #7
	mov r2, #1
	orr r1, r0, r2, lsl r1
	mov r0, r6
	and r1, r1, #0xff
	bl sub_027EAD24
_027EC1B0:
	mov r0, r4
	bl sub_037FB8F0
_027EC1B8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EC1C0: .word 0x0380FFF4
_027EC1C4: .word 0x0480425C
	arm_func_end sub_027EC10C

	arm_func_start sub_027EC1C8
sub_027EC1C8: ; 0x027EC1C8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027EC264
	ldr r0, _027EC26C ; =0x0380FFF4
	ldr r2, _027EC270 ; =0x0480425C
	ldr r1, [r0]
	mov r0, #0x1000000
	add r1, r1, #0x300
	ldrh r1, [r1, #0xd8]
	add r6, r1, r2
	bl ClearIeFlag
	mov r4, r0
	cmp r5, #0
	bne _027EC224
	add r0, r6, #4
	bl sub_027EAD50
	and r1, r0, #0xfe
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_027EAD24
	b _027EC25C
_027EC224:
	mov r0, r5
	bl sub_027EC0CC
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_027EAD50
	and r1, r5, #7
	mov r2, #1
	mvn r1, r2, lsl r1
	and r1, r1, r0
	mov r0, r6
	and r1, r1, #0xff
	bl sub_027EAD24
_027EC25C:
	mov r0, r4
	bl sub_037FB8F0
_027EC264:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EC26C: .word 0x0380FFF4
_027EC270: .word 0x0480425C
	arm_func_end sub_027EC1C8

	arm_func_start sub_027EC274
sub_027EC274: ; 0x027EC274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr fp, _027EC424 ; =0x0380FFF4
	mov sb, #0
	ldr r2, [fp]
	mov r8, #1
	ldr r1, [r2, #0x31c]
	add r0, r2, #0x500
	ldrh sl, [r0, #0x2c]
	add r0, r2, #0x12c
	add r7, r1, #0x1c
	add r5, r0, #0x400
	add r4, r2, #0x300
	b _027EC410
_027EC2A8:
	ldrh r0, [r7]
	cmp r0, #0
	beq _027EC400
	ldrh r1, [r7, #0x18]
	cmp r1, #0
	ldrne r0, _027EC428 ; =0x0000FFFF
	cmpne r1, r0
	beq _027EC3FC
	sub r0, r1, #1
	strh r0, [r7, #0x18]
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	bne _027EC3FC
	ldrh r0, [r7]
	cmp r0, #0x20
	blo _027EC3E8
	mov r0, r8
	bl sub_027EBFE0
	mov r6, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	mov r0, r8
	bl sub_027F0D60
	ldrh r0, [r4, #0x50]
	cmp r0, #1
	bne _027EC398
	cmp r6, #0x20
	bls _027EC3E8
	ldr r1, [fp]
	mov r0, r8, lsl #0x10
	add r3, r1, #0x500
	ldrh r6, [r3, #0x34]
	mov r2, #1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x34]
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_027EBD4C
	ldr r1, [fp]
	add r0, r7, #4
	add r3, r1, #0x500
	mov r1, #1
	ldrh r6, [r3, #0x30]
	mov r2, r1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x30]
	mov r2, #0
	bl sub_027F1EBC
	cmp r0, #0
	mov r1, #1
	beq _027EC38C
	strh r1, [r0]
	bl sub_027F107C
	add sb, sb, #1
	b _027EC408
_027EC38C:
	add r0, r7, #4
	bl sub_027EDBE4
	b _027EC3E8
_027EC398:
	ldrh r0, [r4, #0xcc]
	cmp r8, r0
	bne _027EC3E8
	add r0, r7, #4
	mov r1, #1
	mov r2, #0
	bl sub_027F1EBC
	cmp r0, #0
	beq _027EC3D0
	mov r1, #1
	strh r1, [r0]
	bl sub_027F107C
	add sb, sb, #1
	b _027EC408
_027EC3D0:
	mov r0, #0x20
	bl sub_037F9238
	bl sub_027EA03C
	add r0, r7, #4
	mov r1, #1
	bl sub_027EDBE4
_027EC3E8:
	mov r0, #0
	strh r0, [r7]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
_027EC3FC:
	add sb, sb, #1
_027EC400:
	cmp sb, sl
	bhs _027EC41C
_027EC408:
	add r8, r8, #1
	add r7, r7, #0x1c
_027EC410:
	ldrh r0, [r4, #0x22]
	cmp r8, r0
	blo _027EC2A8
_027EC41C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027EC424: .word 0x0380FFF4
_027EC428: .word 0x0000FFFF
	arm_func_end sub_027EC274

	arm_func_start sub_027EC42C
sub_027EC42C: ; 0x027EC42C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_027F0D60
	ldr r2, _027EC470 ; =0x0380FFF4
	mov r0, #0x1c
	ldr r1, [r2]
	mul r0, r4, r0
	ldr r1, [r1, #0x31c]
	mov r3, #0
	strh r3, [r1, r0]
	ldr r0, [r2]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x2c]
	sub r1, r1, #1
	strh r1, [r0, #0x2c]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EC470: .word 0x0380FFF4
	arm_func_end sub_027EC42C

	arm_func_start sub_027EC474
sub_027EC474: ; 0x027EC474
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027EC504 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r0]
	mov r0, #0
	add r1, r3, #0x300
	ldrh r5, [r1, #0x22]
	ldr r4, [r3, #0x31c]
	mul r2, r5, r2
	mov r1, r4
	bl sub_037FDF74
	ldr r1, _027EC504 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x12c
	add r1, r1, #0x400
	bl sub_037FDF74
	ldr r2, _027EC508 ; =0x0000FFFF
	mov r3, #1
	strh r2, [r4, #0x1a]
	mov r0, #0x1c
	b _027EC4DC
_027EC4D0:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x1a]
	add r3, r3, #1
_027EC4DC:
	cmp r3, r5
	blo _027EC4D0
	ldr r1, _027EC50C ; =_027F74A4
	mov r0, #0
	bl sub_027EC598
	mov r0, #0
	mov r1, #0x40
	bl sub_027EBC44
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EC504: .word 0x0380FFF4
_027EC508: .word 0x0000FFFF
_027EC50C: .word _027F74A4
	arm_func_end sub_027EC474

	arm_func_start sub_027EC510
sub_027EC510: ; 0x027EC510
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _027EC590 ; =0x0380FFF4
	mov r6, #1
	ldr r2, [r0]
	mov sl, #0
	add r1, r2, #0x300
	add r0, r2, #0x12c
	ldr r4, [r2, #0x31c]
	ldrh r7, [r1, #0x22]
	add r5, r0, #0x400
	mov sb, #0x1a
	mov r8, #0x1c
	b _027EC558
_027EC544:
	mla r1, r6, r8, r4
	mov r0, sl
	mov r2, sb
	bl sub_037FDF74
	add r6, r6, #1
_027EC558:
	cmp r6, r7
	blo _027EC544
	mov r2, #1
	strh r2, [r5]
	mov r1, #0
	strh r1, [r5, #2]
	ldr r0, _027EC594 ; =0x0000FFFE
	strh r2, [r5, #4]
	strh r0, [r5, #6]
	strh r1, [r5, #0xc]
	strh r1, [r5, #8]
	strh r2, [r5, #0xe]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027EC590: .word 0x0380FFF4
_027EC594: .word 0x0000FFFE
	arm_func_end sub_027EC510

	arm_func_start sub_027EC598
sub_027EC598: ; 0x027EC598
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _027EC674 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	mov r0, #0x1c
	mul r2, r7, r0
	ldr r3, [r4, #0x31c]
	mov r6, r1
	ldrh r0, [r3, r2]
	add r5, r3, r2
	cmp r0, #0
	addeq r0, r4, #0x500
	ldreqh r1, [r0, #0x2c]
	mov r2, #0x1a
	addeq r1, r1, #1
	streqh r1, [r0, #0x2c]
	mov r1, r5
	mov r0, #0
	bl sub_037FDF74
	ldr r0, _027EC674 ; =0x0380FFF4
	mov r4, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r2, r1, #0x500
	ldrh r3, [r2, #0x34]
	mvn r1, r4, lsl r7
	and r3, r3, r1
	mov r0, r0, lsr #0x10
	mov r1, #0
	strh r3, [r2, #0x34]
	bl sub_027EBD4C
	ldr r0, _027EC674 ; =0x0380FFF4
	mov r1, r6
	ldr r2, [r0]
	add r0, r5, #4
	add r2, r2, #0x500
	ldrh r3, [r2, #0x30]
	orr r3, r3, r4, lsl r7
	strh r3, [r2, #0x30]
	bl sub_027EA0E0
	ldr r2, _027EC678 ; =0x0000FFFF
	mov r0, r7, lsl #0x10
	ldr r1, _027EC674 ; =0x0380FFF4
	strh r2, [r5, #0x14]
	ldr r1, [r1]
	mov r0, r0, lsr #0x10
	add r1, r1, #0x300
	ldrh r2, [r1, #0xa6]
	mov r1, #0x20
	strh r2, [r5, #0x10]
	ldrh r2, [r5, #0x1a]
	strh r2, [r5, #0x18]
	bl sub_027EBC44
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EC674: .word 0x0380FFF4
_027EC678: .word 0x0000FFFF
	arm_func_end sub_027EC598

	arm_func_start sub_027EC67C
sub_027EC67C: ; 0x027EC67C
	mov r0, #3
	bx lr
	arm_func_end sub_027EC67C

	arm_func_start sub_027EC684
sub_027EC684: ; 0x027EC684
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _027EC6E0 ; =0x0380FFF4
	mov r5, #0
	ldr r0, [r6]
	mvn r4, #0
	ldr r7, [r0, #0x1f4]
	b _027EC6D0
_027EC6A0:
	ldr r0, [r0, #0x304]
	mov r1, r7
	mov r2, r5
	bl sub_037FC6D4
	cmp r0, #0
	beq _027EC6D8
	ldr r0, [r6]
	mov r1, r7
	add r0, r0, #0x1f4
	bl sub_037F87AC
	ldr r0, [r6]
	ldr r7, [r0, #0x1f4]
_027EC6D0:
	cmp r7, r4
	bne _027EC6A0
_027EC6D8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EC6E0: .word 0x0380FFF4
	arm_func_end sub_027EC684

	arm_func_start sub_027EC6E4
sub_027EC6E4: ; 0x027EC6E4
	ldr r0, _027EC6FC ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x28]
	bx lr
	.align 2, 0
_027EC6FC: .word 0x0380FFF4
	arm_func_end sub_027EC6E4

	arm_func_start sub_027EC700
sub_027EC700: ; 0x027EC700
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _027EC738
	bl sub_037F9198
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _027EC734
	bl sub_027EA17C
_027EC734:
	mov r0, #0
_027EC738:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027EC700

	arm_func_start sub_027EC740
sub_027EC740: ; 0x027EC740
	stmdb sp!, {r4, lr}
	mov r2, #9
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _027EC7DC
	ldrh r1, [r4, #0x12]
	cmp r1, #1
	movhi r0, #5
	bhi _027EC7DC
	ldrh r1, [r4, #0x14]
	cmp r1, #1
	movhi r0, #5
	bhi _027EC7DC
	bl sub_027E9C4C
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _027EC7C8
	ldrh r0, [r4, #0x12]
	cmp r0, #1
	bne _027EC7A8
	ldr r0, _027EC7E4 ; =0x00008001
	bl sub_027E9CE0
	b _027EC7B0
_027EC7A8:
	mov r0, #0
	bl sub_027E9CE0
_027EC7B0:
	ldr r0, _027EC7E8 ; =0x0380FFF4
	ldrh r1, [r4, #0x14]
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	b _027EC7D8
_027EC7C8:
	mov r0, #0x8000
	bl sub_027E9CE0
	mov r0, #2
	bl sub_027E9CB4
_027EC7D8:
	mov r0, #0
_027EC7DC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EC7E4: .word 0x00008001
_027EC7E8: .word 0x0380FFF4
	arm_func_end sub_027EC740

	arm_func_start sub_027EC7EC
sub_027EC7EC: ; 0x027EC7EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _027EC928 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	ldrh r2, [r5, #2]
	add r1, r3, #4
	add r4, r1, #0x400
	sub r1, r2, #3
	strh r1, [r4, #4]
	mov r1, #3
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r1, [r1, #0x2e]
	mov r6, r0
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #2
	movne r0, #0xb
	bne _027EC920
	ldr r0, _027EC928 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x20
	movlo r0, #1
	blo _027EC920
	ldrh r0, [r6, #0x16]
	cmp r0, #0x20
	movhi r0, #5
	bhi _027EC920
	ldrh r0, [r6, #0x38]
	cmp r0, #1
	movhi r0, #5
	bhi _027EC920
	add r0, r6, #0x3a
	bl sub_027EAD50
	cmp r0, #0
	moveq r0, #5
	beq _027EC920
	ldrh r0, [r6, #0x4a]
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _027EC920
	cmp r0, #0xa
	movlo r0, #5
	blo _027EC920
	ldrh r0, [r6, #0x4c]
	cmp r0, #0x10
	movhi r0, #5
	bhi _027EC920
	mov r8, #0
	add r7, r6, #0x3a
	b _027EC8E4
_027EC8C0:
	add r0, r7, r8
	bl sub_027EAD50
	cmp r0, #0
	beq _027EC8EC
	bl sub_027EA4A4
	cmp r0, #0
	moveq r0, #5
	beq _027EC920
	add r8, r8, #1
_027EC8E4:
	cmp r8, #0x10
	blo _027EC8C0
_027EC8EC:
	add r0, r6, #0x10
	bl sub_027E956C
	ldrh r0, [r6, #0x16]
	add r1, r6, #0x18
	bl sub_027E95D0
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x10
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_037F8598
	mov r0, #0x80
_027EC920:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027EC928: .word 0x0380FFF4
	arm_func_end sub_027EC7EC

	arm_func_start sub_027EC92C
sub_027EC92C: ; 0x027EC92C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027ECADC ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #5
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _027ECAD4
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _027ECAD4
	mov r0, #0x20
	bl sub_037F9238
	ldrh r0, [r6, #0x18]
	tst r0, #1
	movne r0, #5
	bne _027ECAD4
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	moveq r0, #5
	beq _027ECAD4
	cmp r0, #0x20
	movhi r0, #5
	bhi _027ECAD4
	ldrh r0, [r6, #0x46]
	cmp r0, #0xa
	movlo r0, #5
	blo _027ECAD4
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _027ECAD4
	ldrh r0, [r6, #0x48]
	cmp r0, #0xff
	movhi r0, #5
	bhi _027ECAD4
	ldrh r0, [r6, #0x4a]
	ldr r1, _027ECAE0 ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _027ECAD4
	bl sub_027EA4A4
	cmp r0, #0
	moveq r0, #5
	beq _027ECAD4
	ldrh r2, [r6, #0x42]
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r2, r0
	movne r0, #5
	bne _027ECAD4
	ldrh r1, [r6, #0x44]
	tst r1, r0
	movne r0, #5
	bne _027ECAD4
	cmp r2, #0
	moveq r0, #5
	beq _027ECAD4
	orrs r0, r1, r2
	moveq r0, #5
	beq _027ECAD4
	ldrh r0, [r6, #0x10]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _027ECAD4
	mov r0, #0
	bl sub_027F4D2C
	cmp r0, #0
	movne r0, #0xe
	bne _027ECAD4
	ldrh r0, [r6, #0x40]
	tst r0, #0x20
	beq _027ECA7C
	mov r0, #1
	bl sub_027E9290
	b _027ECA84
_027ECA7C:
	mov r0, #0
	bl sub_027E9290
_027ECA84:
	add r0, r6, #0x18
	bl sub_027E956C
	ldrh r0, [r6, #0x1e]
	add r1, r6, #0x20
	bl sub_027E95D0
	ldrh r0, [r6, #0x46]
	bl sub_027E96E0
	ldrh r0, [r6, #0x4a]
	mov r1, #0
	bl sub_027E9900
	add r0, r6, #0x42
	bl sub_027E9B8C
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x20
	mov r0, #2
	mov r1, #1
	strh r2, [r4]
	bl sub_037F8598
	mov r0, #0x80
_027ECAD4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027ECADC: .word 0x0380FFF4
_027ECAE0: .word 0x0000FFF0
	arm_func_end sub_027EC92C

	arm_func_start sub_027ECAE4
sub_027ECAE4: ; 0x027ECAE4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027ECBB4 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #6
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _027ECBAC
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _027ECBAC
	ldrh r0, [r6, #0x10]
	tst r0, #1
	movne r0, #5
	bne _027ECBAC
	ldrh r0, [r6, #0x16]
	cmp r0, #1
	movhi r0, #5
	bhi _027ECBAC
	ldrh r0, [r6, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _027ECBAC
	cmp r0, #0xa
	movlo r0, #5
	blo _027ECBAC
	mov r0, #0x20
	bl sub_037F9238
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x30
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	add r0, r5, #8
	ldrh r1, [r1, #0x16]
	strh r1, [r5, #0xe]
	ldr r1, [r4, #0x18]
	add r1, r1, #0x10
	bl sub_027EA0E0
	bl sub_027ED544
	mov r0, #0x80
_027ECBAC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027ECBB4: .word 0x0380FFF4
	arm_func_end sub_027ECAE4

	arm_func_start sub_027ECBB8
sub_027ECBB8: ; 0x027ECBB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _027ECCE8 ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #4
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #3
	cmpne r2, #2
	cmpne r2, #1
	add r5, r1, #0x400
	movne r0, #0xb
	bne _027ECCE0
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x30
	movlo r0, #1
	blo _027ECCE0
	add r0, r2, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _027ECC38
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _027ECCE0
_027ECC38:
	add r0, r6, #6
	add r1, r7, #0x10
	bl sub_027EA0E0
	ldrh r1, [r7, #0x16]
	add r0, r6, #6
	mov r2, #0
	bl sub_027F1EBC
	movs r4, r0
	moveq r0, #8
	beq _027ECCE0
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x41
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _027ECCCC
	ldr r2, _027ECCE8 ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_027EBAE8
	ldr r0, _027ECCE8 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _027ECCDC
	mov r0, #2
	bl sub_027EFEF4
	b _027ECCDC
_027ECCCC:
	add r0, r7, #0x10
	bl sub_027F0E58
	mov r0, r4
	bl sub_027F107C
_027ECCDC:
	mov r0, #0x80
_027ECCE0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027ECCE8: .word 0x0380FFF4
	arm_func_end sub_027ECBB8

	arm_func_start sub_027ECCEC
sub_027ECCEC: ; 0x027ECCEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _027ECDC0 ; =0x0380FFF4
	mov r6, r1
	ldr r3, [r2]
	mov r1, #3
	strh r1, [r6, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	cmp r2, #3
	mov r7, r0
	cmpne r2, #2
	add r4, r3, #0x344
	add r5, r1, #0x400
	movne r0, #0xb
	bne _027ECDB8
	ldrh r0, [r4, #8]
	cmp r0, #0x30
	movlo r0, #1
	blo _027ECDB8
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _027ECDB8
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _027ECDB8
	cmp r0, #0xff
	movhi r0, #5
	bhi _027ECDB8
	ldrh r0, [r7, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _027ECDB8
	cmp r0, #0xa
	movlo r0, #5
	blo _027ECDB8
	mov r0, #0x30
	bl sub_037F9238
	bl sub_027EA03C
	ldrh r1, [r7, #0x16]
	mov r0, #0x50
	strh r1, [r4, #0x70]
	ldrh r1, [r7, #0x16]
	strh r1, [r4, #0x72]
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	strh r0, [r5]
	bl sub_027ED668
	mov r0, #0x80
_027ECDB8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027ECDC0: .word 0x0380FFF4
	arm_func_end sub_027ECCEC

	arm_func_start sub_027ECDC4
sub_027ECDC4: ; 0x027ECDC4
	stmdb sp!, {r3, lr}
	ldr r3, _027ECE80 ; =0x0380FFF4
	mov r2, #3
	ldr ip, [r3]
	strh r2, [r1, #2]
	add r2, ip, #0x300
	ldrh r3, [r2, #0x2e]
	add r2, ip, #4
	cmp r3, #3
	cmpne r3, #2
	add ip, ip, #0x344
	add lr, r2, #0x400
	movne r0, #0xb
	bne _027ECE78
	ldrh r2, [ip, #8]
	cmp r2, #0x30
	movlo r0, #1
	blo _027ECE78
	ldrh r2, [r0, #0x10]
	tst r2, #1
	movne r0, #5
	bne _027ECE78
	ldrh r3, [r0, #0x16]
	cmp r3, #1
	movlo r0, #5
	blo _027ECE78
	cmp r3, #0xff
	movhi r0, #5
	bhi _027ECE78
	ldrh r2, [r0, #0x18]
	cmp r2, #0x7d0
	movhi r0, #5
	bhi _027ECE78
	cmp r2, #0xa
	movlo r0, #5
	blo _027ECE78
	strh r3, [ip, #0x70]
	ldrh r3, [r0, #0x16]
	mov r2, #0x60
	strh r3, [ip, #0x72]
	str r0, [lr, #0x18]
	str r1, [lr, #0x1c]
	strh r2, [lr]
	bl sub_027ED764
	mov r0, #0x80
_027ECE78:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027ECE80: .word 0x0380FFF4
	arm_func_end sub_027ECDC4

	arm_func_start sub_027ECE84
sub_027ECE84: ; 0x027ECE84
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _027ECF8C ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #1
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #0
	add r5, r1, #0x400
	moveq r0, #0xb
	beq _027ECF84
	cmp r2, #1
	beq _027ECED8
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _027ECF84
_027ECED8:
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	movne r0, #1
	bne _027ECF84
	ldrh r1, [r7, #0x16]
	add r0, r7, #0x10
	bl sub_027F16A4
	movs r4, r0
	moveq r0, #8
	beq _027ECF84
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x71
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _027ECF70
	ldr r2, _027ECF8C ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_027EBAE8
	ldr r0, _027ECF8C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _027ECF80
	mov r0, #2
	bl sub_027EFEF4
	b _027ECF80
_027ECF70:
	add r0, r7, #0x10
	bl sub_027F0E58
	mov r0, r4
	bl sub_027F107C
_027ECF80:
	mov r0, #0x80
_027ECF84:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027ECF8C: .word 0x0380FFF4
	arm_func_end sub_027ECE84

	arm_func_start sub_027ECF90
sub_027ECF90: ; 0x027ECF90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _027ED124 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r3]
	mov r6, r0
	strh r2, [r1, #2]
	add r5, r3, #0x31c
	ldrh r0, [r5, #0x12]
	add r4, r3, #0x344
	cmp r0, #1
	cmpne r0, #0
	movne r0, #0xb
	bne _027ED11C
	ldrh r0, [r4, #8]
	cmp r0, #0x20
	movne r0, #1
	bne _027ED11C
	ldrh r0, [r6, #0x10]
	cmp r0, #0x20
	movhi r0, #5
	bhi _027ED11C
	cmp r0, #0
	moveq r0, #5
	beq _027ED11C
	ldrh r0, [r6, #0x32]
	cmp r0, #0xa
	movlo r0, #5
	blo _027ED11C
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _027ED11C
	ldrh r0, [r6, #0x34]
	cmp r0, #0
	moveq r0, #5
	beq _027ED11C
	cmp r0, #0xff
	movhi r0, #5
	bhi _027ED11C
	ldrh r0, [r6, #0x36]
	ldr r1, _027ED128 ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _027ED11C
	bl sub_027EA4A4
	cmp r0, #0
	moveq r0, #5
	beq _027ED11C
	ldrh r1, [r6, #0x38]
	cmp r1, #0
	moveq r0, #5
	beq _027ED11C
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r1, r0
	movne r0, #5
	bne _027ED11C
	ldrh r1, [r6, #0x3a]
	cmp r1, #0
	moveq r0, #5
	beq _027ED11C
	tst r1, r0
	movne r0, #5
	bne _027ED11C
	ldrh r0, [r6, #0x3c]
	cmp r0, #0x80
	movhi r0, #5
	bhi _027ED11C
	mov r0, #0
	bl sub_027F4D2C
	cmp r0, #0
	movne r0, #0xe
	bne _027ED11C
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	bne _027ED0C8
	ldr r0, _027ED12C ; =_027F74A4
	bl sub_027E956C
	b _027ED0D0
_027ED0C8:
	add r0, r5, #8
	bl sub_027E956C
_027ED0D0:
	ldrh r0, [r6, #0x10]
	add r1, r6, #0x12
	bl sub_027E95D0
	ldrh r0, [r6, #0x32]
	bl sub_027E96E0
	ldrh r0, [r6, #0x34]
	bl sub_027E9738
	ldrh r0, [r6, #0x36]
	mov r1, #0
	bl sub_027E9900
	add r0, r6, #0x38
	bl sub_027E9B8C
	ldrh r0, [r6, #0x3c]
	add r1, r6, #0x3e
	bl sub_027E9F10
	mov r0, #0
	strh r0, [r4, #0xa4]
	bl sub_037F8DE0
	mov r0, #0
_027ED11C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027ED124: .word 0x0380FFF4
_027ED128: .word 0x0000FFF0
_027ED12C: .word _027F74A4
	arm_func_end sub_027ECF90

	arm_func_start sub_027ED130
sub_027ED130: ; 0x027ED130
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _027ED210 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #0x12
	strh r1, [r5, #2]
	ldr r2, [r2]
	add r1, r3, #4
	add r2, r2, #0x300
	ldrh r2, [r2, #0x4c]
	mov r6, r0
	cmp r2, #0x20
	add r4, r1, #0x400
	movne r0, #1
	bne _027ED208
	ldrh r0, [r6, #0x12]
	cmp r0, #3
	movhi r0, #5
	bhi _027ED208
	ldrh r0, [r6, #0x14]
	cmp r0, #0x3f
	movhi r0, #5
	bhi _027ED208
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _027ED208
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _027ED208
	mov r8, #0
	add r7, r6, #0x18
	b _027ED1D8
_027ED1B4:
	add r0, r7, r8
	bl sub_027EAD50
	cmp r0, #0
	beq _027ED1E0
	bl sub_027EA4A4
	cmp r0, #0
	moveq r0, #5
	beq _027ED208
	add r8, r8, #1
_027ED1D8:
	cmp r8, #0x10
	blo _027ED1B4
_027ED1E0:
	cmp r8, #0
	moveq r0, #5
	beq _027ED208
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x80
	strh r0, [r4]
	strh r0, [r5, #4]
	bl sub_027ED858
	mov r0, #0x80
_027ED208:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027ED210: .word 0x0380FFF4
	arm_func_end sub_027ED130

	arm_func_start sub_027ED214
sub_027ED214: ; 0x027ED214
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _027ED3FC ; =0x0380FFF4
	mov r6, #0
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x10
	cmp r1, #5
	add r4, r0, #0x400
	add r5, r2, #0x344
	addls pc, pc, r1, lsl #2
	b _027ED3E0
_027ED248: ; jump table
	b _027ED260 ; case 0
	b _027ED2D8 ; case 1
	b _027ED368 ; case 2
	b _027ED368 ; case 3
	b _027ED3E0 ; case 4
	b _027ED3C0 ; case 5
_027ED260:
	mov r0, #0x20
	bl sub_037F9238
	mov r0, #2
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x1c]
	mov r1, r6
	strh r1, [r0, #8]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #6]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	ldrh r0, [r1, #0x4a]
	bne _027ED2C8
	add r1, r0, #3
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	movlo r0, #0xa
	strloh r0, [r4, #0xc]
	b _027ED2CC
_027ED2C8:
	strh r0, [r4, #0xc]
_027ED2CC:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_027ED2D8:
	ldr r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	add r1, r1, #0x3a
	add r0, r1, r0
	bl sub_027EAD50
	movs r5, r0
	moveq r0, #0x15
	streqh r0, [r4]
	moveq r6, #1
	beq _027ED3E0
	ldrh r1, [r4, #6]
	mov r0, #0
	add r1, r1, #1
	strh r1, [r4, #6]
	strh r0, [r4, #0xa]
	bl sub_027F4D2C
	cmp r0, #0
	beq _027ED33C
	ldr r0, [r4, #0x1c]
	mov r1, #0xe
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _027ED3E0
_027ED33C:
	ldrh r0, [r4]
	mov r1, #0
	cmp r0, #0x10
	mov r0, r5
	bne _027ED35C
	bl sub_027E9900
	bl sub_037F8DE0
	b _027ED360
_027ED35C:
	bl sub_027E9900
_027ED360:
	mov r0, #0x12
	strh r0, [r4]
_027ED368:
	mov r0, #0x13
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _027ED3B0
	add r0, r1, #0x10
	bl sub_027F1B50
	cmp r0, #0
	bne _027ED3AC
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _027ED3E0
_027ED3AC:
	bl sub_027F107C
_027ED3B0:
	ldrh r0, [r4, #0xc]
	ldr r1, _027ED400 ; =sub_027ED404
	bl sub_027EAAEC
	b _027ED3E0
_027ED3C0:
	strh r6, [r4]
	bl sub_037F9198
	ldr r0, _027ED3FC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	strh r0, [r5, #0xc]
	bl sub_027EDB14
_027ED3E0:
	cmp r6, #0
	beq _027ED3F4
	mov r0, #2
	mov r1, #0
	bl sub_037F8598
_027ED3F4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027ED3FC: .word 0x0380FFF4
_027ED400: .word sub_027ED404
	arm_func_end sub_027ED214

	arm_func_start sub_027ED404
sub_027ED404: ; 0x027ED404
	ldr r0, _027ED460 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #4
	add r2, r0, #0x400
	ldrh r1, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	add r0, r1, r0
	strh r0, [r2, #0xa]
	ldr r0, [r2, #0x18]
	ldrh r1, [r2, #0xa]
	ldrh r0, [r0, #0x4a]
	cmp r1, r0
	blo _027ED450
	ldrh r0, [r2, #6]
	cmp r0, #0x10
	movlo r0, #0x11
	strloh r0, [r2]
	movhs r0, #0x15
	strhsh r0, [r2]
_027ED450:
	ldr ip, _027ED464 ; =sub_037F8598
	mov r0, #2
	mov r1, #0
	bx ip
	.align 2, 0
_027ED460: .word 0x0380FFF4
_027ED464: .word sub_037F8598
	arm_func_end sub_027ED404

	arm_func_start sub_027ED468
sub_027ED468: ; 0x027ED468
	stmdb sp!, {r4, lr}
	ldr r0, _027ED500 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x20
	add r4, r0, #0x400
	beq _027ED498
	cmp r1, #0x25
	beq _027ED4C4
	b _027ED4F8
_027ED498:
	bl sub_037F8DE0
	mov r0, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	mov r0, #0x21
	strh r0, [r4]
	ldr r0, [r4, #0x18]
	ldr r1, _027ED504 ; =sub_027ED508
	ldrh r0, [r0, #0x10]
	bl sub_027EAAEC
	b _027ED4F8
_027ED4C4:
	ldrh r1, [r4, #4]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #4]
	ldrh r1, [r4, #6]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #6]
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _027ED4EC
	bl sub_037F9198
_027ED4EC:
	mov r0, #0
	strh r0, [r4]
	bl sub_027EDB14
_027ED4F8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027ED500: .word 0x0380FFF4
_027ED504: .word sub_027ED508
	arm_func_end sub_027ED468

	arm_func_start sub_027ED508
sub_027ED508: ; 0x027ED508
	ldr r0, _027ED53C ; =0x0380FFF4
	ldr ip, _027ED540 ; =sub_037F8598
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	add r0, r0, #0x400
	strh r1, [r0, #4]
	mov r3, #0x25
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #1
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_027ED53C: .word 0x0380FFF4
_027ED540: .word sub_037F8598
	arm_func_end sub_027ED508

	arm_func_start sub_027ED544
sub_027ED544: ; 0x027ED544
	stmdb sp!, {r4, lr}
	ldr r0, _027ED620 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x30
	add r4, r0, #0x400
	beq _027ED574
	cmp r1, #0x35
	beq _027ED5F0
	b _027ED618
_027ED574:
	ldr r0, [r4, #0x18]
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x10
	bl sub_027F1DFC
	cmp r0, #0
	bne _027ED5B4
	ldr r1, [r4, #0x1c]
	mov r2, #8
	mov r0, #2
	strh r2, [r1, #4]
	mov r2, #0x35
	mov r1, r0
	strh r2, [r4]
	bl sub_037F8598
	b _027ED618
_027ED5B4:
	ldr r1, [r4, #0x18]
	mov r2, #1
	ldrh r3, [r1, #0x16]
	mov r1, #0
	strh r3, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r1, [r0, #0x30]
	mov r1, #0x31
	strh r1, [r4]
	bl sub_027F107C
	ldr r0, [r4, #0x18]
	ldr r1, _027ED624 ; =sub_027ED628
	ldrh r0, [r0, #0x18]
	bl sub_027EAAEC
	b _027ED618
_027ED5F0:
	mov r0, #1
	bl sub_027F0CD4
	mov r0, #1
	bl sub_027F0C70
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #0
	strh r0, [r4]
	bl sub_027EDB14
_027ED618:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027ED620: .word 0x0380FFF4
_027ED624: .word sub_027ED628
	arm_func_end sub_027ED544

	arm_func_start sub_027ED628
sub_027ED628: ; 0x027ED628
	stmdb sp!, {r3, lr}
	ldr r1, _027ED664 ; =0x0380FFF4
	mov r0, #2
	ldr ip, [r1]
	mov r3, #7
	add r1, ip, #4
	ldr r2, [r1, #0x41c]
	mov r1, r0
	strh r3, [r2, #4]
	add r2, ip, #0x400
	mov r3, #0x35
	strh r3, [r2, #4]
	bl sub_037F8598
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027ED664: .word 0x0380FFF4
	arm_func_end sub_027ED628

	arm_func_start sub_027ED668
sub_027ED668: ; 0x027ED668
	stmdb sp!, {r4, lr}
	ldr r0, _027ED720 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x50
	add r4, r0, #0x400
	beq _027ED698
	cmp r1, #0x53
	beq _027ED6F0
	b _027ED718
_027ED698:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_027F1720
	cmp r0, #0
	bne _027ED6D0
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x53
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_037F8598
	b _027ED718
_027ED6D0:
	mov r1, #0x51
	strh r1, [r4]
	bl sub_027F107C
	ldr r0, [r4, #0x18]
	ldr r1, _027ED724 ; =sub_027ED728
	ldrh r0, [r0, #0x18]
	bl sub_027EAAEC
	b _027ED718
_027ED6F0:
	mov r0, #1
	bl sub_027F0CD4
	mov r0, #1
	bl sub_027F0C70
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #0
	strh r0, [r4]
	bl sub_027EDB14
_027ED718:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027ED720: .word 0x0380FFF4
_027ED724: .word sub_027ED728
	arm_func_end sub_027ED668

	arm_func_start sub_027ED728
sub_027ED728: ; 0x027ED728
	ldr r0, _027ED75C ; =0x0380FFF4
	ldr ip, _027ED760 ; =sub_037F8598
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	ldr r0, [r0, #0x41c]
	mov r3, #0x53
	strh r1, [r0, #4]
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #3
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_027ED75C: .word 0x0380FFF4
_027ED760: .word sub_037F8598
	arm_func_end sub_027ED728

	arm_func_start sub_027ED764
sub_027ED764: ; 0x027ED764
	stmdb sp!, {r4, lr}
	ldr r0, _027ED814 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x60
	add r4, r0, #0x400
	beq _027ED794
	cmp r1, #0x63
	beq _027ED7EC
	b _027ED80C
_027ED794:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_027F17C8
	cmp r0, #0
	bne _027ED7CC
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x63
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_037F8598
	b _027ED80C
_027ED7CC:
	mov r1, #0x61
	strh r1, [r4]
	bl sub_027F107C
	ldr r0, [r4, #0x18]
	ldr r1, _027ED818 ; =sub_027ED81C
	ldrh r0, [r0, #0x18]
	bl sub_027EAAEC
	b _027ED80C
_027ED7EC:
	mov r0, #1
	bl sub_027F0C70
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #0
	strh r0, [r4]
	bl sub_027EDB14
_027ED80C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027ED814: .word 0x0380FFF4
_027ED818: .word sub_027ED81C
	arm_func_end sub_027ED764

	arm_func_start sub_027ED81C
sub_027ED81C: ; 0x027ED81C
	ldr r0, _027ED850 ; =0x0380FFF4
	ldr ip, _027ED854 ; =sub_037F8598
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	ldr r0, [r0, #0x41c]
	mov r3, #0x63
	strh r1, [r0, #4]
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #4
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_027ED850: .word 0x0380FFF4
_027ED854: .word sub_037F8598
	arm_func_end sub_027ED81C

	arm_func_start sub_027ED858
sub_027ED858: ; 0x027ED858
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027EDAB8 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x80
	cmp r1, #4
	add r4, r2, #0x344
	add r5, r0, #0x400
	addls pc, pc, r1, lsl #2
	b _027EDA98
_027ED888: ; jump table
	b _027ED89C ; case 0
	b _027ED8DC ; case 1
	b _027ED990 ; case 2
	b _027ED9B8 ; case 3
	b _027EDA24 ; case 4
_027ED89C:
	mov r0, #0
	strh r0, [r5, #0x14]
	mov r0, #0x13
	bl sub_027EA5C4
	strh r0, [r5, #0xe]
	mov r0, #0x35
	bl sub_027EA5C4
	strh r0, [r5, #0x10]
	ldr r1, [r5, #0x18]
	ldrh r0, [r1, #0x12]
	ldrh r1, [r1, #0x14]
	bl sub_027E935C
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r5, #0x16]
_027ED8DC:
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #8]
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_027EAD50
	movs r4, r0
	beq _027ED910
	ldrh r0, [r5, #0x14]
	cmp r0, #0x10
	blo _027ED91C
_027ED910:
	mov r0, #0x84
	strh r0, [r5]
	b _027EDA98
_027ED91C:
	mov r0, #0
	bl sub_027F4D2C
	cmp r0, #0
	movne r0, #0xe
	strneh r0, [r5, #0x16]
	movne r0, #0x84
	strneh r0, [r5]
	bne _027EDA98
	ldrh r0, [r5]
	mov r1, #0
	cmp r0, #0x80
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bne _027ED974
	bl sub_027E9900
	bl sub_037F8DE0
	ldr r1, _027EDABC ; =0x04808040
	mov r0, #0x8000
	ldrh r1, [r1]
	strh r1, [r5, #0xc]
	bl sub_027E9CE0
	b _027ED978
_027ED974:
	bl sub_027E9900
_027ED978:
	mov r0, #0x82
	strh r0, [r5]
	ldr r0, [r5, #0x18]
	ldr r1, _027EDAC0 ; =sub_027EDAC8
	ldrh r0, [r0, #0x16]
	bl sub_027EAAEC
_027ED990:
	ldr r1, [r5, #4]
	ldr r0, _027EDAC4 ; =0x0480819C
	add r1, r1, #1
	str r1, [r5, #4]
	ldrh r0, [r0]
	tst r0, #1
	ldrne r0, [r5, #8]
	addne r0, r0, #0x64
	strne r0, [r5, #8]
	b _027EDA98
_027ED9B8:
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_027EAD50
	ldr r1, [r5, #4]
	mov r4, r0
	cmp r1, #0
	ldrne r0, [r5, #8]
	mov r2, #0
	cmpne r0, #0
	beq _027ED9F8
	bl _u32_div_f
	add r2, r0, #1
	cmp r2, #0x64
	movhi r2, #0x64
_027ED9F8:
	ldr r1, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	orr r2, r4, r2, lsl #8
	add r0, r1, r0, lsl #1
	strh r2, [r0, #8]
	ldrh r1, [r5, #0x14]
	mov r0, #0x81
	add r1, r1, #1
	strh r1, [r5, #0x14]
	strh r0, [r5]
	b _027EDA98
_027EDA24:
	bl sub_037F9198
	ldr r1, _027EDAB8 ; =0x0380FFF4
	mov r0, #0x13
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	strh r1, [r4, #0xc]
	ldrh r1, [r5, #0xe]
	bl sub_027EA5F0
	ldrh r1, [r5, #0x10]
	mov r0, #0x35
	bl sub_027EA5F0
	ldrh r0, [r5, #0xc]
	bl sub_027E9CE0
	ldrh r2, [r5, #0x16]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strh r2, [r1, #4]
	strh r0, [r5]
	ldrh r2, [r5, #0x14]
	mov r1, r0
	b _027EDA8C
_027EDA7C:
	ldr r0, [r5, #0x1c]
	add r0, r0, r2, lsl #1
	strh r1, [r0, #8]
	add r2, r2, #1
_027EDA8C:
	cmp r2, #0x10
	blo _027EDA7C
	bl sub_027EDB14
_027EDA98:
	ldrh r0, [r5]
	cmp r0, #0
	beq _027EDAB0
	mov r0, #2
	mov r1, #5
	bl sub_037F8598
_027EDAB0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EDAB8: .word 0x0380FFF4
_027EDABC: .word 0x04808040
_027EDAC0: .word sub_027EDAC8
_027EDAC4: .word 0x0480819C
	arm_func_end sub_027ED858

	arm_func_start sub_027EDAC8
sub_027EDAC8: ; 0x027EDAC8
	ldr r0, _027EDAEC ; =0x0380FFF4
	ldr ip, _027EDAF0 ; =sub_037F8598
	ldr r1, [r0]
	mov r3, #0x83
	add r2, r1, #0x400
	mov r0, #2
	mov r1, #5
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_027EDAEC: .word 0x0380FFF4
_027EDAF0: .word sub_037F8598
	arm_func_end sub_027EDAC8

	arm_func_start sub_027EDAF4
sub_027EDAF4: ; 0x027EDAF4
	ldr r0, _027EDB0C ; =0x0380FFF4
	ldr ip, _027EDB10 ; =sub_027EDEC0
	ldr r0, [r0]
	add r0, r0, #0xc6
	add r0, r0, #0x300
	bx ip
	.align 2, 0
_027EDB0C: .word 0x0380FFF4
_027EDB10: .word sub_027EDEC0
	arm_func_end sub_027EDAF4

	arm_func_start sub_027EDB14
sub_027EDB14: ; 0x027EDB14
	stmdb sp!, {r4, lr}
	ldr r0, _027EDB64 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x24
	add r1, r0, #0x400
	ldrh r0, [r1, #4]
	add r4, r2, #0x17c
	bic r0, r0, #1
	strh r0, [r1, #4]
	ldr r1, [r2, #0x424]
	add r0, r4, #0x84
	bl sub_037F8D58
	ldrh r0, [r4, #0x8c]
	cmp r0, #0
	beq _027EDB5C
	mov r0, #2
	mov r1, #0xb
	bl sub_037F8598
_027EDB5C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EDB64: .word 0x0380FFF4
	arm_func_end sub_027EDB14

	arm_func_start sub_027EDB68
sub_027EDB68: ; 0x027EDB68
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027EDBE0 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_037F886C
	movs r4, r0
	bne _027EDBA0
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDBD8
_027EDBA0:
	mov r0, #0x84
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_027EA0E0
	ldr r0, _027EDBE0 ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDBD8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EDBE0: .word 0x0380FFF4
	arm_func_end sub_027EDB68

	arm_func_start sub_027EDBE4
sub_027EDBE4: ; 0x027EDBE4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027EDC5C ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_037F886C
	movs r4, r0
	bne _027EDC1C
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDC54
_027EDC1C:
	mov r0, #0x85
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_027EA0E0
	ldr r0, _027EDC5C ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDC54:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EDC5C: .word 0x0380FFF4
	arm_func_end sub_027EDBE4

	arm_func_start sub_027EDC60
sub_027EDC60: ; 0x027EDC60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _027EDD50 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r6, r2
	bl sub_037F886C
	movs r4, r0
	bne _027EDC9C
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDD48
_027EDC9C:
	mov r0, #0x86
	strh r0, [r4, #0xc]
	mov r2, #0x15
	mov r1, r7
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_027EA0E0
	ldr r1, _027EDD54 ; =0x00000FFF
	add r0, r6, #1
	and r1, r5, r1
	strh r1, [r4, #0x16]
	bl sub_027EAD50
	add r7, r6, #2
	strh r0, [r4, #0x18]
	mov r5, #0
	add r6, r4, #0x1a
	b _027EDD00
_027EDCE0:
	cmp r5, #0x20
	bhs _027EDD0C
	add r0, r7, r5
	bl sub_027EAD50
	mov r1, r0
	add r0, r6, r5
	bl sub_027EAD24
	add r5, r5, #1
_027EDD00:
	ldrh r0, [r4, #0x18]
	cmp r5, r0
	blo _027EDCE0
_027EDD0C:
	add r7, r4, #0x1a
	mov r6, #0
	b _027EDD28
_027EDD18:
	mov r1, r6
	add r0, r7, r5
	bl sub_027EAD24
	add r5, r5, #1
_027EDD28:
	cmp r5, #0x20
	blo _027EDD18
	ldr r0, _027EDD50 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDD48:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EDD50: .word 0x0380FFF4
_027EDD54: .word 0x00000FFF
	arm_func_end sub_027EDC60

	arm_func_start sub_027EDD58
sub_027EDD58: ; 0x027EDD58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _027EDE40 ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r5, r2
	bl sub_037F886C
	movs r4, r0
	bne _027EDD94
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDE38
_027EDD94:
	mov r0, #0x87
	strh r0, [r4, #0xc]
	mov r0, #0x15
	strh r0, [r4, #0xe]
	mov r1, r7
	add r0, r4, #0x10
	bl sub_027EA0E0
	strh r6, [r4, #0x16]
	add r0, r5, #1
	bl sub_027EAD50
	add r6, r5, #2
	strh r0, [r4, #0x18]
	mov r7, #0
	add r5, r4, #0x1a
	b _027EDDF0
_027EDDD0:
	cmp r7, #0x20
	bhs _027EDDFC
	add r0, r6, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, r5, r7
	bl sub_027EAD24
	add r7, r7, #1
_027EDDF0:
	ldrh r0, [r4, #0x18]
	cmp r7, r0
	blo _027EDDD0
_027EDDFC:
	add r6, r4, #0x1a
	mov r5, #0
	b _027EDE18
_027EDE08:
	mov r1, r5
	add r0, r6, r7
	bl sub_027EAD24
	add r7, r7, #1
_027EDE18:
	cmp r7, #0x20
	blo _027EDE08
	ldr r0, _027EDE40 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDE38:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EDE40: .word 0x0380FFF4
	arm_func_end sub_027EDD58

	arm_func_start sub_027EDE44
sub_027EDE44: ; 0x027EDE44
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027EDEBC ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_037F886C
	movs r4, r0
	bne _027EDE7C
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDEB4
_027EDE7C:
	mov r0, #0x88
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_027EA0E0
	ldr r0, _027EDEBC ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDEB4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EDEBC: .word 0x0380FFF4
	arm_func_end sub_027EDE44

	arm_func_start sub_027EDEC0
sub_027EDEC0: ; 0x027EDEC0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027EDF30 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0x16
	add r0, r0, #0x188
	bl sub_037F886C
	movs r4, r0
	bne _027EDEF4
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDF28
_027EDEF4:
	mov r0, #0x8b
	strh r0, [r4, #0xc]
	mov r2, #3
	mov r1, r5
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_027EA0E0
	ldr r0, _027EDF30 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDF28:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EDF30: .word 0x0380FFF4
	arm_func_end sub_027EDEC0

	arm_func_start sub_027EDF34
sub_027EDF34: ; 0x027EDF34
	stmdb sp!, {r3, lr}
	ldr r0, _027EDF90 ; =0x0380FFF4
	mov r1, #0x10
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F886C
	movs r1, r0
	bne _027EDF64
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EDF88
_027EDF64:
	mov r0, #0x8c
	strh r0, [r1, #0xc]
	mov r2, #0
	ldr r0, _027EDF90 ; =0x0380FFF4
	strh r2, [r1, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EDF88:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EDF90: .word 0x0380FFF4
	arm_func_end sub_027EDF34

	arm_func_start sub_027EDF94
sub_027EDF94: ; 0x027EDF94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027EE0AC ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	add r0, r2, #0x300
	ldrh r1, [r0, #0xe4]
	add r0, r2, #0x188
	add r1, r1, #0x3e
	add r4, r2, #0x344
	bl sub_037F886C
	movs r5, r0
	bne _027EDFD4
	mov r0, #1
	bl sub_027EB06C
	mov r0, #0
	b _027EE0A4
_027EDFD4:
	mov r0, #0x8d
	strh r0, [r5, #0xc]
	ldrh r1, [r4, #0xa0]
	add r0, r5, #0x1f
	add r1, r1, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #0x16
	strh r1, [r5, #0xe]
	ldrh r1, [r6, #0x12]
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r1, [r6, #0xe]
	add r0, r5, #0x1e
	and r1, r1, #0xff
	bl sub_027EAD24
	add r0, r5, #0x2e
	add r1, r6, #0x1e
	bl sub_027EA0E0
	ldrh r2, [r4, #0xa0]
	strh r2, [r5, #0x16]
	cmp r2, #0
	beq _027EE08C
	ldrh r0, [r4, #0xa2]
	tst r0, #1
	ldr r0, [r4, #0x9c]
	beq _027EE080
	add r7, r5, #0x3c
	add r6, r0, #1
	mov r4, #0
	b _027EE070
_027EE050:
	mov r0, r6
	bl sub_027EAD50
	mov r1, r0
	mov r0, r7
	bl sub_027EAD24
	add r6, r6, #1
	add r7, r7, #1
	add r4, r4, #1
_027EE070:
	ldrh r0, [r5, #0x16]
	cmp r4, r0
	blo _027EE050
	b _027EE08C
_027EE080:
	add r1, r5, #0x3c
	add r2, r2, #1
	bl sub_037FDF9C
_027EE08C:
	ldr r0, _027EE0AC ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #1
_027EE0A4:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EE0AC: .word 0x0380FFF4
	arm_func_end sub_027EDF94

	arm_func_start sub_027EE0B0
sub_027EE0B0: ; 0x027EE0B0
	ldr r1, _027EE0D0 ; =0x0380FFF4
	ldr ip, _027EE0D4 ; =sub_037FDF74
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #4
	mov r2, #0x20
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_027EE0D0: .word 0x0380FFF4
_027EE0D4: .word sub_037FDF74
	arm_func_end sub_027EE0B0

	arm_func_start sub_027EE0D8
sub_027EE0D8: ; 0x027EE0D8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _027EE1C0 ; =0x0380FFF4
	mov r5, r0
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _027EE1B8
	add r0, r5, #0x10
	bl sub_027E8E5C
	mov r4, r0
	ldrh r0, [r5, #0x16]
	bl sub_027E8EBC
	orr r4, r4, r0
	ldrh r0, [r5, #0x18]
	bl sub_027E8EF0
	orr r4, r4, r0
	ldrh r0, [r5, #0x1c]
	bl sub_027E8F30
	orr r4, r4, r0
	ldrh r0, [r5, #0x1e]
	bl sub_027E8FB0
	orr r4, r4, r0
	ldrh r0, [r5, #0x20]
	bl sub_027E8FE4
	orr r4, r4, r0
	ldrh r0, [r5, #0x22]
	bl sub_027E9084
	orr r4, r4, r0
	add r0, r5, #0x24
	bl sub_027E90A8
	orr r4, r4, r0
	ldrh r0, [r5, #0x74]
	bl sub_027E9108
	orr r4, r4, r0
	ldrh r0, [r5, #0x76]
	bl sub_027E9140
	orr r4, r4, r0
	ldrh r0, [r5, #0x78]
	bl sub_027E9178
	orr r4, r4, r0
	ldrh r0, [r5, #0x7a]
	mov r1, #0
	bl sub_027E91B0
	orr r4, r4, r0
	add r0, r5, #0x7c
	bl sub_027E9260
	orr r4, r4, r0
	ldrh r0, [r5, #0x9c]
	bl sub_027E9290
	orr r4, r4, r0
	ldrh r0, [r5, #0x9e]
	bl sub_027E9338
	orr r0, r4, r0
_027EE1B8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027EE1C0: .word 0x0380FFF4
	arm_func_end sub_027EE0D8

	arm_func_start sub_027EE1C4
sub_027EE1C4: ; 0x027EE1C4
	stmdb sp!, {r3, lr}
	ldr r2, _027EE200 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _027EE1F4
	add r0, r0, #0x10
	bl sub_027E8E5C
	mov r3, r0
_027EE1F4:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE200: .word 0x0380FFF4
	arm_func_end sub_027EE1C4

	arm_func_start sub_027EE204
sub_027EE204: ; 0x027EE204
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE218 ; =sub_027E8EBC
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE218: .word sub_027E8EBC
	arm_func_end sub_027EE204

	arm_func_start sub_027EE21C
sub_027EE21C: ; 0x027EE21C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE258 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _027EE24C
	ldrh r0, [r0, #0x10]
	bl sub_027E8EF0
	mov r3, r0
_027EE24C:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE258: .word 0x0380FFF4
	arm_func_end sub_027EE21C

	arm_func_start sub_027EE25C
sub_027EE25C: ; 0x027EE25C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE2A8 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x4c]
	cmp r2, #0x20
	movhi r0, r3
	bhi _027EE2A0
	bne _027EE298
	ldrh r1, [r1, #0x56]
	cmp r1, #0
	movne r0, r3
	bne _027EE2A0
_027EE298:
	ldrh r0, [r0, #0x10]
	bl sub_027E8F30
_027EE2A0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE2A8: .word 0x0380FFF4
	arm_func_end sub_027EE25C

	arm_func_start sub_027EE2AC
sub_027EE2AC: ; 0x027EE2AC
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE2C0 ; =sub_027E8FB0
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE2C0: .word sub_027E8FB0
	arm_func_end sub_027EE2AC

	arm_func_start sub_027EE2C4
sub_027EE2C4: ; 0x027EE2C4
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE2D8 ; =sub_027E8FE4
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE2D8: .word sub_027E8FE4
	arm_func_end sub_027EE2C4

	arm_func_start sub_027EE2DC
sub_027EE2DC: ; 0x027EE2DC
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE2F0 ; =sub_027E9084
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE2F0: .word sub_027E9084
	arm_func_end sub_027EE2DC

	arm_func_start sub_027EE2F4
sub_027EE2F4: ; 0x027EE2F4
	ldr ip, _027EE308 ; =sub_027E90A8
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_027EE308: .word sub_027E90A8
	arm_func_end sub_027EE2F4

	arm_func_start sub_027EE30C
sub_027EE30C: ; 0x027EE30C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE348 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x20
	bhi _027EE33C
	ldrh r0, [r0, #0x10]
	bl sub_027E9108
	mov r3, r0
_027EE33C:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE348: .word 0x0380FFF4
	arm_func_end sub_027EE30C

	arm_func_start sub_027EE34C
sub_027EE34C: ; 0x027EE34C
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE360 ; =sub_027E9140
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE360: .word sub_027E9140
	arm_func_end sub_027EE34C

	arm_func_start sub_027EE364
sub_027EE364: ; 0x027EE364
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE378 ; =sub_027E9178
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE378: .word sub_027E9178
	arm_func_end sub_027EE364

	arm_func_start sub_027EE37C
sub_027EE37C: ; 0x027EE37C
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE394 ; =sub_027E91B0
	ldrh r0, [r0, #0x10]
	mov r1, #0
	bx ip
	.align 2, 0
_027EE394: .word sub_027E91B0
	arm_func_end sub_027EE37C

	arm_func_start sub_027EE398
sub_027EE398: ; 0x027EE398
	ldr ip, _027EE3AC ; =sub_027E9260
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_027EE3AC: .word sub_027E9260
	arm_func_end sub_027EE398

	arm_func_start sub_027EE3B0
sub_027EE3B0: ; 0x027EE3B0
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE3C4 ; =sub_027E9290
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE3C4: .word sub_027E9290
	arm_func_end sub_027EE3B0

	arm_func_start sub_027EE3C8
sub_027EE3C8: ; 0x027EE3C8
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _027EE3DC ; =sub_027E9338
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_027EE3DC: .word sub_027E9338
	arm_func_end sub_027EE3C8

	arm_func_start sub_027EE3E0
sub_027EE3E0: ; 0x027EE3E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r5, r0
	ldrh r0, [r5, #0x14]
	cmp r0, #0x3f
	movhi r0, #5
	bhi _027EE424
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	bl sub_027E935C
	movs r4, r0
	bne _027EE420
	ldrh r1, [r5, #0x14]
	mov r0, #0x2e
	bl sub_027EA5F0
_027EE420:
	mov r0, r4
_027EE424:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027EE3E0

	arm_func_start sub_027EE42C
sub_027EE42C: ; 0x027EE42C
	stmdb sp!, {r4, lr}
	ldr ip, _027EE52C ; =0x0380FFF4
	mov r3, #1
	ldr r2, [ip]
	ldr r2, [r2, #0x31c]
	strh r3, [r1, #2]
	ldr r1, [ip]
	ldrh r4, [r0, #0x10]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _027EE46C
	rsb r1, r3, #0x10000
	cmp r4, r1
	movne r0, #5
	bne _027EE524
_027EE46C:
	ldrh r3, [r0, #0x14]
	cmp r3, #0x3f
	bls _027EE488
	ldr r1, _027EE530 ; =0x0000FFFF
	cmp r3, r1
	movne r0, #5
	bne _027EE524
_027EE488:
	ldr r1, _027EE530 ; =0x0000FFFF
	cmp r4, r1
	bne _027EE4DC
	ldr ip, _027EE52C ; =0x0380FFF4
	mov r4, #1
	mov r3, #0x1c
	b _027EE4C4
_027EE4A4:
	mla lr, r4, r3, r2
	ldrh r1, [r0, #0x12]
	add r4, r4, #1
	strh r1, [lr, #0x1a]
	ldrh r1, [lr, #0x18]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [lr, #0x18]
_027EE4C4:
	ldr r1, [ip]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _027EE4A4
	b _027EE510
_027EE4DC:
	cmp r4, #0
	beq _027EE510
	mov r1, #0x1c
	mla r3, r4, r1, r2
	ldrh lr, [r0, #0x12]
	add ip, r2, #0x18
	strh lr, [r3, #0x1a]
	ldrh r2, [r0, #0x10]
	mul r3, r2, r1
	ldrh r1, [ip, r3]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [ip, r3]
_027EE510:
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _027EE520
	bl sub_027E9E30
_027EE520:
	mov r0, #0
_027EE524:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EE52C: .word 0x0380FFF4
_027EE530: .word 0x0000FFFF
	arm_func_end sub_027EE42C

	arm_func_start sub_027EE534
sub_027EE534: ; 0x027EE534
	ldr r2, _027EE588 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x20
	movhi r0, r3
	bxhi lr
	ldrh r1, [r0, #0x10]
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldr r1, [r2]
	ldrh r2, [r0, #0x10]
	add r0, r1, #0x300
	ldrh r1, [r0, #0x20]
	cmp r2, r1
	movhi r0, #5
	strlsh r2, [r0, #0x22]
	movls r0, #0
	bx lr
	.align 2, 0
_027EE588: .word 0x0380FFF4
	arm_func_end sub_027EE534

	arm_func_start sub_027EE58C
sub_027EE58C: ; 0x027EE58C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE5C8 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _027EE5BC
	ldrh r0, [r0, #0x10]
	bl sub_027E93A0
	mov r3, r0
_027EE5BC:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE5C8: .word 0x0380FFF4
	arm_func_end sub_027EE58C

	arm_func_start sub_027EE5CC
sub_027EE5CC: ; 0x027EE5CC
	stmdb sp!, {r3, lr}
	ldr r2, _027EE608 ; =0x0380FFF4
	mov r3, r0
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _027EE600
	ldrh r0, [r3, #0x10]
	ldrh r1, [r3, #0x12]
	bl sub_027E9408
_027EE600:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE608: .word 0x0380FFF4
	arm_func_end sub_027EE5CC

	arm_func_start sub_027EE60C
sub_027EE60C: ; 0x027EE60C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE648 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _027EE63C
	ldrh r0, [r0, #0x10]
	bl sub_027E94DC
	mov r3, r0
_027EE63C:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE648: .word 0x0380FFF4
	arm_func_end sub_027EE60C

	arm_func_start sub_027EE64C
sub_027EE64C: ; 0x027EE64C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE688 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _027EE67C
	ldrh r0, [r0, #0x10]
	bl sub_027E951C
	mov r3, r0
_027EE67C:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE688: .word 0x0380FFF4
	arm_func_end sub_027EE64C

	arm_func_start sub_027EE68C
sub_027EE68C: ; 0x027EE68C
	ldr ip, _027EE6A0 ; =sub_027E956C
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_027EE6A0: .word sub_027E956C
	arm_func_end sub_027EE68C

	arm_func_start sub_027EE6A4
sub_027EE6A4: ; 0x027EE6A4
	mov r2, #1
	strh r2, [r1, #2]
	mov r1, r0
	ldrh r0, [r1, #0x10]
	ldr ip, _027EE6C0 ; =sub_027E95D0
	add r1, r1, #0x12
	bx ip
	.align 2, 0
_027EE6C0: .word sub_027E95D0
	arm_func_end sub_027EE6A4

	arm_func_start sub_027EE6C4
sub_027EE6C4: ; 0x027EE6C4
	stmdb sp!, {r3, lr}
	ldr r2, _027EE6FC ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #1
	movne r0, #0xb
	bne _027EE6F4
	ldrh r0, [r0, #0x10]
	bl sub_027E96E0
_027EE6F4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE6FC: .word 0x0380FFF4
	arm_func_end sub_027EE6C4

	arm_func_start sub_027EE700
sub_027EE700: ; 0x027EE700
	stmdb sp!, {r3, lr}
	ldr r2, _027EE738 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #1
	movne r0, #0xb
	bne _027EE730
	ldrh r0, [r0, #0x10]
	bl sub_027E9738
_027EE730:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE738: .word 0x0380FFF4
	arm_func_end sub_027EE700

	arm_func_start sub_027EE73C
sub_027EE73C: ; 0x027EE73C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE778 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #2
	cmpne r1, #3
	movne r0, #0xb
	bne _027EE770
	ldrh r0, [r0, #0x10]
	bl sub_027E977C
_027EE770:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE778: .word 0x0380FFF4
	arm_func_end sub_027EE73C

	arm_func_start sub_027EE77C
sub_027EE77C: ; 0x027EE77C
	stmdb sp!, {r3, lr}
	ldr r2, _027EE7DC ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	mov r3, r0
	add r0, r1, #0x300
	ldrh r0, [r0, #0x2e]
	cmp r0, #1
	movne r0, #0xb
	bne _027EE7D4
	ldrh r0, [r3, #0x10]
	ldrh r2, [r3, #0xe]
	add r1, r0, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #1
	cmp r2, r1
	movlt r0, #4
	blt _027EE7D4
	add r1, r3, #0x12
	bl sub_027E9F54
_027EE7D4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE7DC: .word 0x0380FFF4
	arm_func_end sub_027EE77C

	arm_func_start sub_027EE7E0
sub_027EE7E0: ; 0x027EE7E0
	stmdb sp!, {r4, lr}
	ldr r0, _027EE914 ; =0x0380FFF4
	mov r4, r1
	mov r1, #0x21
	strh r1, [r4, #2]
	ldr r1, [r0]
	add r0, r4, #6
	add r1, r1, #0x324
	bl sub_027EA0E0
	ldr r0, _027EE914 ; =0x0380FFF4
	add r1, r4, #0x22
	ldr r3, [r0]
	mov r2, #0x20
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2a]
	strh r3, [r4, #0xc]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2c]
	strh r3, [r4, #0xe]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0xbe]
	strh r3, [r4, #0x10]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2e]
	strh r3, [r4, #0x12]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x30]
	strh r3, [r4, #0x14]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x34]
	strh r3, [r4, #0x16]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x36]
	strh r3, [r4, #0x18]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1f
	mov r3, r3, lsr #0x1f
	strh r3, [r4, #0x1a]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1e
	mov r3, r3, lsr #0x1f
	strh r3, [r4, #0x1c]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0xc2]
	strh r3, [r4, #0x1e]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3c]
	strh r3, [r4, #0x20]
	ldr r0, [r0]
	add r0, r0, #0x384
	bl sub_037FDF9C
	ldr r2, _027EE914 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x3a]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1f
	strh r1, [r4, #0x42]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x32]
	strh r1, [r4, #0x44]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EE914: .word 0x0380FFF4
	arm_func_end sub_027EE7E0

	arm_func_start sub_027EE918
sub_027EE918: ; 0x027EE918
	stmdb sp!, {r3, lr}
	ldr r0, _027EE944 ; =0x0380FFF4
	mov r2, #4
	strh r2, [r1, #2]
	ldr r2, [r0]
	add r0, r1, #6
	add r1, r2, #0x324
	bl sub_027EA0E0
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EE944: .word 0x0380FFF4
	arm_func_end sub_027EE918

	arm_func_start sub_027EE948
sub_027EE948: ; 0x027EE948
	ldr r0, _027EE96C ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2a]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EE96C: .word 0x0380FFF4
	arm_func_end sub_027EE948

	arm_func_start sub_027EE970
sub_027EE970: ; 0x027EE970
	ldr r3, _027EE9A4 ; =0x0380FFF4
	mov r0, #3
	strh r0, [r1, #2]
	ldr r2, [r3]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2c]
	strh r2, [r1, #6]
	ldr r2, [r3]
	add r2, r2, #0x300
	ldrh r2, [r2, #0xbe]
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_027EE9A4: .word 0x0380FFF4
	arm_func_end sub_027EE970

	arm_func_start sub_027EE9A8
sub_027EE9A8: ; 0x027EE9A8
	ldr r0, _027EE9CC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2e]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EE9CC: .word 0x0380FFF4
	arm_func_end sub_027EE9A8

	arm_func_start sub_027EE9D0
sub_027EE9D0: ; 0x027EE9D0
	ldr r0, _027EE9F4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x30]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EE9F4: .word 0x0380FFF4
	arm_func_end sub_027EE9D0

	arm_func_start sub_027EE9F8
sub_027EE9F8: ; 0x027EE9F8
	ldr r0, _027EEA1C ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x34]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEA1C: .word 0x0380FFF4
	arm_func_end sub_027EE9F8

	arm_func_start sub_027EEA20
sub_027EEA20: ; 0x027EEA20
	ldr r0, _027EEA44 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x36]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEA44: .word 0x0380FFF4
	arm_func_end sub_027EEA20

	arm_func_start sub_027EEA48
sub_027EEA48: ; 0x027EEA48
	ldr r0, _027EEA74 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1f
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEA74: .word 0x0380FFF4
	arm_func_end sub_027EEA48

	arm_func_start sub_027EEA78
sub_027EEA78: ; 0x027EEA78
	ldr r0, _027EEAA4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1e
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEAA4: .word 0x0380FFF4
	arm_func_end sub_027EEA78

	arm_func_start sub_027EEAA8
sub_027EEAA8: ; 0x027EEAA8
	ldr r0, _027EEACC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xc2]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEACC: .word 0x0380FFF4
	arm_func_end sub_027EEAA8

	arm_func_start sub_027EEAD0
sub_027EEAD0: ; 0x027EEAD0
	ldr r0, _027EEAF4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3c]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEAF4: .word 0x0380FFF4
	arm_func_end sub_027EEAD0

	arm_func_start sub_027EEAF8
sub_027EEAF8: ; 0x027EEAF8
	ldr r0, _027EEB30 ; =0x0380FFF4
	mov r2, #0x11
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r3, r1, #6
	add r2, r0, #0x384
	mov r1, #0
_027EEB14:
	ldrh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r3], #2
	blo _027EEB14
	mov r0, #0
	bx lr
	.align 2, 0
_027EEB30: .word 0x0380FFF4
	arm_func_end sub_027EEAF8

	arm_func_start sub_027EEB34
sub_027EEB34: ; 0x027EEB34
	ldr r0, _027EEB60 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEB60: .word 0x0380FFF4
	arm_func_end sub_027EEB34

	arm_func_start sub_027EEB64
sub_027EEB64: ; 0x027EEB64
	ldr r0, _027EEB88 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x32]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEB88: .word 0x0380FFF4
	arm_func_end sub_027EEB64

	arm_func_start sub_027EEB8C
sub_027EEB8C: ; 0x027EEB8C
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r0, #4
	strh r0, [r4, #2]
	mov r0, #0x13
	bl sub_027EA5C4
	strh r0, [r4, #6]
	mov r0, #0x35
	bl sub_027EA5C4
	strh r0, [r4, #8]
	mov r0, #0x2e
	bl sub_027EA5C4
	strh r0, [r4, #0xa]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027EEB8C

	arm_func_start sub_027EEBCC
sub_027EEBCC: ; 0x027EEBCC
	ldr r0, _027EEBF4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x22]
	sub r2, r2, #1
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEBF4: .word 0x0380FFF4
	arm_func_end sub_027EEBCC

	arm_func_start sub_027EEBF8
sub_027EEBF8: ; 0x027EEBF8
	ldr r0, _027EEC30 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x1c
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEC30: .word 0x0380FFF4
	arm_func_end sub_027EEBF8

	arm_func_start sub_027EEC34
sub_027EEC34: ; 0x027EEC34
	ldr r3, _027EEC90 ; =0x0380FFF4
	mov r0, #3
	strh r0, [r1, #2]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	bxlo lr
	ldrh r2, [r0, #0x3a]
	mov r0, #0
	mov r2, r2, lsl #0x1b
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	ldr r2, [r3]
	add r2, r2, #0x300
	ldrh r3, [r2, #0x3a]
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_027EEC90: .word 0x0380FFF4
	arm_func_end sub_027EEC34

	arm_func_start sub_027EEC94
sub_027EEC94: ; 0x027EEC94
	ldr r0, _027EECCC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x19
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EECCC: .word 0x0380FFF4
	arm_func_end sub_027EEC94

	arm_func_start sub_027EECD0
sub_027EECD0: ; 0x027EECD0
	ldr r0, _027EED08 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x18
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EED08: .word 0x0380FFF4
	arm_func_end sub_027EECD0

	arm_func_start sub_027EED0C
sub_027EED0C: ; 0x027EED0C
	stmdb sp!, {r3, lr}
	ldr r0, _027EED38 ; =0x0380FFF4
	mov r2, #4
	strh r2, [r1, #2]
	ldr r2, [r0]
	add r0, r1, #6
	add r1, r2, #0x3a8
	bl sub_027EA0E0
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EED38: .word 0x0380FFF4
	arm_func_end sub_027EED0C

	arm_func_start sub_027EED3C
sub_027EED3C: ; 0x027EED3C
	ldr r2, _027EED84 ; =0x0380FFF4
	mov r0, #0x12
	strh r0, [r1, #2]
	ldr r0, [r2]
	add ip, r1, #8
	add r0, r0, #0x300
	ldrh r0, [r0, #0x62]
	mov r3, #0
	strh r0, [r1, #6]
	ldr r0, [r2]
	add r1, r0, #0x364
_027EED68:
	ldrh r0, [r1], #2
	add r3, r3, #2
	cmp r3, #0x20
	strh r0, [ip], #2
	blo _027EED68
	mov r0, #0
	bx lr
	.align 2, 0
_027EED84: .word 0x0380FFF4
	arm_func_end sub_027EED3C

	arm_func_start sub_027EED88
sub_027EED88: ; 0x027EED88
	ldr r0, _027EEDAC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb2]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEDAC: .word 0x0380FFF4
	arm_func_end sub_027EED88

	arm_func_start sub_027EEDB0
sub_027EEDB0: ; 0x027EEDB0
	ldr r0, _027EEDD4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb8]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEDD4: .word 0x0380FFF4
	arm_func_end sub_027EEDB0

	arm_func_start sub_027EEDD8
sub_027EEDD8: ; 0x027EEDD8
	ldr r0, _027EEDFC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb4]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EEDFC: .word 0x0380FFF4
	arm_func_end sub_027EEDD8

	arm_func_start sub_027EEE00
sub_027EEE00: ; 0x027EEE00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	ldrh r0, [r4, #2]
	ldr r1, _027EEED4 ; =0x0380FFF4
	cmp r0, #1
	ldrhi r0, _027EEED4 ; =0x0380FFF4
	ldrhi r0, [r0]
	addhi r0, r0, #0x300
	ldrhih r0, [r0, #0xe4]
	strhih r0, [r4, #6]
	ldrh r0, [r4, #2]
	ldr r3, [r1]
	sub r1, r0, #2
	add r0, r3, #0x300
	ldrh r2, [r0, #0xe4]
	cmp r2, r1, lsl #1
	movgt r0, #4
	bgt _027EEECC
	ldrh r2, [r4, #6]
	cmp r2, #0
	beq _027EEEB0
	ldrh r0, [r0, #0xe6]
	tst r0, #1
	ldr r0, [r3, #0x3e0]
	beq _027EEEA4
	add r6, r4, #8
	add r5, r0, #1
	mov r7, #0
	b _027EEE94
_027EEE74:
	mov r0, r5
	bl sub_027EAD50
	mov r1, r0
	mov r0, r6
	bl sub_027EAD24
	add r6, r6, #1
	add r5, r5, #1
	add r7, r7, #1
_027EEE94:
	ldrh r0, [r4, #6]
	cmp r7, r0
	blo _027EEE74
	b _027EEEB0
_027EEEA4:
	add r1, r4, #8
	add r2, r2, #1
	bl sub_037FDF9C
_027EEEB0:
	ldrh r1, [r4, #6]
	mov r0, #0
	add r1, r1, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #2
	strh r1, [r4, #2]
_027EEECC:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027EEED4: .word 0x0380FFF4
	arm_func_end sub_027EEE00

	arm_func_start sub_027EEED8
sub_027EEED8: ; 0x027EEED8
	stmdb sp!, {r3, lr}
	ldr r2, _027EEF14 ; =0x0380FFF4
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0
	cmpne r1, #0x10
	bne _027EEF0C
	mov r0, #0
	bl sub_037F9238
	mov r0, #0
_027EEF0C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EEF14: .word 0x0380FFF4
	arm_func_end sub_027EEED8

	arm_func_start sub_027EEF18
sub_027EEF18: ; 0x027EEF18
	stmdb sp!, {r3, lr}
	ldr r2, _027EEF70 ; =0x0380FFF4
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x4c]
	cmp r2, #0x20
	bhi _027EEF68
	ldrh r1, [r1, #0x56]
	cmp r1, #0
	bne _027EEF68
	mov r0, #0
	bl sub_027F4D2C
	cmp r0, #0
	movne r0, #0xe
	bne _027EEF68
	mov r0, #0x10
	bl sub_037F9238
	mov r0, #0
_027EEF68:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EEF70: .word 0x0380FFF4
	arm_func_end sub_027EEF18

	arm_func_start sub_027EEF74
sub_027EEF74: ; 0x027EEF74
	stmdb sp!, {r3, lr}
	ldr r0, _027EEFC4 ; =0x0380FFF4
	mov r2, #1
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x4c]
	cmp r1, #0x10
	beq _027EEFA8
	cmp r1, #0x20
	ldreqh r0, [r0, #0x56]
	cmpeq r0, #0
	bne _027EEFB8
_027EEFA8:
	mov r0, #0x20
	bl sub_037F9238
	mov r0, #0
	b _027EEFBC
_027EEFB8:
	mov r0, #1
_027EEFBC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EEFC4: .word 0x0380FFF4
	arm_func_end sub_027EEF74

	arm_func_start sub_027EEFC8
sub_027EEFC8: ; 0x027EEFC8
	stmdb sp!, {r3, lr}
	ldr r0, _027EF000 ; =0x0380FFF4
	mov r2, #1
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x20
	blo _027EEFF0
	bl sub_037F9198
_027EEFF0:
	bl sub_027E8994
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EF000: .word 0x0380FFF4
	arm_func_end sub_027EEFC8

	arm_func_start sub_027EF004
sub_027EF004: ; 0x027EF004
	stmdb sp!, {r3, lr}
	ldr r0, _027EF038 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	mov r0, #1
	beq _027EF030
	strh r0, [r1, #2]
	bl sub_027EA17C
	mov r0, #0
_027EF030:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027EF038: .word 0x0380FFF4
	arm_func_end sub_027EF004

	arm_func_start sub_027EF03C
sub_027EF03C: ; 0x027EF03C
	stmdb sp!, {r4, lr}
	ldr r0, _027EF0D0 ; =_027F7868
	mov r4, r1
	mov r3, #9
	add r1, r4, #6
	mov r2, #8
	strh r3, [r4, #2]
	bl sub_037FDF9C
	ldr r1, _027EF0D4 ; =0x04808000
	ldr r0, _027EF0D8 ; =0x0380FFF4
	ldrh r1, [r1]
	strh r1, [r4, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x8000
	moveq r1, #0x6d
	ldreq r0, _027EF0DC ; =0x0000933D
	streqh r1, [r4, #0x10]
	beq _027EF09C
	mov r0, #0
	bl sub_027EA5C4
	strh r0, [r4, #0x10]
	bl sub_027EA640
_027EF09C:
	strh r0, [r4, #0x12]
	ldr r0, _027EF0D8 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x4000
	addne r0, r1, #0x500
	ldrneh r0, [r0, #0xf8]
	moveq r0, #2
	strh r0, [r4, #0x14]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EF0D0: .word _027F7868
_027EF0D4: .word 0x04808000
_027EF0D8: .word 0x0380FFF4
_027EF0DC: .word 0x0000933D
	arm_func_end sub_027EF03C

	arm_func_start sub_027EF0E0
sub_027EF0E0: ; 0x027EF0E0
	stmdb sp!, {r4, lr}
	ldr r0, _027EF138 ; =0x0380FFF4
	mov r4, r1
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	moveq r0, #1
	beq _027EF130
	mov r0, #0x5c
	strh r0, [r4, #2]
	bl sub_027EA1AC
	ldr r0, _027EF138 ; =0x0380FFF4
	add r1, r4, #8
	ldr r0, [r0]
	mov r2, #0xb4
	add r0, r0, #0x13c
	add r0, r0, #0x400
	bl sub_037FDFEC
	mov r0, #0
_027EF130:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EF138: .word 0x0380FFF4
	arm_func_end sub_027EF0E0

	arm_func_start sub_027EF13C
sub_027EF13C: ; 0x027EF13C
	ldr r0, _027EF160 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x4c]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_027EF160: .word 0x0380FFF4
	arm_func_end sub_027EF13C

	arm_func_start sub_027EF164
sub_027EF164: ; 0x027EF164
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _027EF48C ; =0x0380FFF4
	mov r5, r0
	ldr r2, [r2]
	mov r0, #1
	strh r0, [r1, #2]
	add r4, r2, #0x344
	ldrh r1, [r4, #8]
	and r1, r1, #0xf0
	cmp r1, #0x10
	bne _027EF480
	ldrh r0, [r5, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _027EF480
	ldrh r0, [r5, #0x14]
	cmp r0, #0xa
	cmpne r0, #0x14
	movne r0, #5
	bne _027EF480
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	movhi r0, #5
	bhi _027EF480
	mov r0, #0
	bl sub_027F4D2C
	cmp r0, #0
	movne r0, #0xe
	bne _027EF480
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	beq _027EF3F4
	cmp r0, #1
	bne _027EF47C
	ldrh r0, [r4, #8]
	cmp r0, #0x10
	movne r0, #1
	bne _027EF480
	mov r0, #0
	str r0, [sp]
	add r2, sp, #0
	mov r0, #0x65
	mov r1, #1
	bl sub_027F4E70
	ldr r6, [sp]
	mov r0, #1
	bl sub_027EA5C4
	cmp r6, r0
	beq _027EF240
	mov r1, r6
	mov r0, #1
	bl sub_027EA5F0
	ldr r0, _027EF490 ; =0x00001388
	bl sub_027EA9A8
_027EF240:
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _027EF47C
_027EF250: ; jump table
	b _027EF264 ; case 0
	b _027EF264 ; case 1
	b _027EF264 ; case 2
	b _027EF2FC ; case 3
	b _027EF2FC ; case 4
_027EF264:
	mov r0, #0x11
	strh r0, [r4, #8]
	ldrh r0, [r5, #0x16]
	mov r1, #1
	bl sub_027E9900
	ldr r1, _027EF494 ; =0x04808040
	mov r2, #0x8000
	ldr r0, _027EF498 ; =0x000005DC
	strh r2, [r1]
	bl sub_027EA9A8
	ldrh r1, [r5, #0x14]
	mov r0, #2
	strh r1, [r4, #0x16]
	bl sub_027EA5C4
	str r0, [sp]
	ldrh r1, [r5, #0x12]
	ldr r2, _027EF49C ; =0x048081A4
	cmp r1, #1
	orrls r0, r0, #0x10
	strls r0, [sp]
	ldrh r0, [r5, #0x14]
	strh r0, [r2]
	ldrh r0, [r5, #0x12]
	cmp r0, #1
	strneh r0, [r2, #-2]
	bne _027EF2E0
	ldr r1, [sp]
	mov r0, #3
	orr r1, r1, #0x20
	str r1, [sp]
	strh r0, [r2, #-2]
_027EF2E0:
	ldr r1, [sp]
	mov r0, #2
	bl sub_027EA5F0
	ldr r1, _027EF4A0 ; =0x00000823
	ldr r0, _027EF4A4 ; =0x048081A0
	strh r1, [r0]
	b _027EF47C
_027EF2FC:
	ldr r0, _027EF48C ; =0x0380FFF4
	ldr r0, [r0]
	add r4, r0, #0x344
	bl sub_037F8DE0
	bl sub_037F9198
	mov r0, #6
	bl sub_027EA5C4
	strh r0, [r4, #0xac]
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	bne _027EF334
	mov r0, #6
	mov r1, #0
	bl sub_027EA5F0
_027EF334:
	ldr r1, _027EF4A8 ; =0x04804000
	mov r0, #0
	mov r2, #0xc
	bl sub_037FDF74
	ldr r1, _027EF4A8 ; =0x04804000
	mov r0, #0x14
	strh r0, [r1, #8]
	mov r0, #0x7d0
	strh r0, [r1, #0xa]
	add r3, r1, #0xc
	ldr r1, _027EF4AC ; =0x00005555
	ldr r0, _027EF4B0 ; =0x000007EC
	mov r2, #0
_027EF368:
	add r2, r2, #2
	cmp r2, r0
	strh r1, [r3], #2
	blo _027EF368
	ldr r1, _027EF4A8 ; =0x04804000
	mov r2, #8
	ldr r0, _027EF4B4 ; =0x04808194
	strh r2, [r1, #0xc]
	mov r1, #6
	strh r1, [r0]
	mov r0, #0x12
	strh r0, [r4, #8]
	mov r1, #1
	strh r1, [r4, #0x18]
	ldrh r0, [r5, #0x16]
	bl sub_027E9900
	ldr r1, _027EF494 ; =0x04808040
	mov r2, #0x8000
	ldr r0, _027EF498 ; =0x000005DC
	strh r2, [r1]
	bl sub_027EA9A8
	mov r2, #1
	ldr r3, _027EF4B8 ; =0x04808012
	mov r0, #2
	strh r0, [r3]
	strh r2, [r3, #-0xe]
	ldr r1, _027EF4A8 ; =0x04804000
	rsb r0, r2, #0x4000
	and r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	strh r2, [r3, #0x9c]
	orr r0, r0, #0x8000
	strh r0, [r3, #0x8e]
	b _027EF47C
_027EF3F4:
	ldrh r0, [r4, #8]
	cmp r0, #0x11
	bne _027EF43C
	bl sub_027EAA4C
	ldr r1, _027EF4A4 ; =0x048081A0
	mov r2, #0
	strh r2, [r1]
	mov r0, #1
	strh r0, [r1, #2]
	sub r0, r1, #0x160
	strh r2, [r0]
	mov r0, #2
	bl sub_027EA5C4
	bic r1, r0, #0x30
	mov r0, #2
	str r1, [sp]
	bl sub_027EA5F0
	b _027EF474
_027EF43C:
	cmp r0, #0x12
	bne _027EF46C
	ldr r1, _027EF4BC ; =0x04808004
	mov r0, #0
	strh r0, [r4, #0x18]
_027EF450:
	ldrh r0, [r1]
	cmp r0, #0
	bne _027EF450
	ldrh r1, [r4, #0xac]
	mov r0, #6
	bl sub_027EA5F0
	b _027EF474
_027EF46C:
	mov r0, #1
	b _027EF480
_027EF474:
	mov r0, #0x10
	strh r0, [r4, #8]
_027EF47C:
	mov r0, #0
_027EF480:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027EF48C: .word 0x0380FFF4
_027EF490: .word 0x00001388
_027EF494: .word 0x04808040
_027EF498: .word 0x000005DC
_027EF49C: .word 0x048081A4
_027EF4A0: .word 0x00000823
_027EF4A4: .word 0x048081A0
_027EF4A8: .word 0x04804000
_027EF4AC: .word 0x00005555
_027EF4B0: .word 0x000007EC
_027EF4B4: .word 0x04808194
_027EF4B8: .word 0x04808012
_027EF4BC: .word 0x04808004
	arm_func_end sub_027EF164

	arm_func_start sub_027EF4C0
sub_027EF4C0: ; 0x027EF4C0
	ldr r0, _027EF52C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x5c]
	cmp r0, #0
	beq _027EF4FC
	ldr r0, _027EF530 ; =0x04804000
	mov r2, #0
	strh r2, [r0]
	ldr r1, _027EF534 ; =0x048080A0
	strh r2, [r0, #4]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	bx lr
_027EF4FC:
	ldr r2, _027EF538 ; =0x048080AC
	mov r3, #1
	strh r3, [r2]
	mov r1, #0
	strh r1, [r2, #-0xa8]
	mov r0, #2
	strh r0, [r2, #-0x9a]
	rsb r0, r3, #0x10000
	strh r0, [r2, #-0x9c]
	strh r1, [r2, #0xe8]
	strh r1, [r2, #-0x6c]
	bx lr
	.align 2, 0
_027EF52C: .word 0x0380FFF4
_027EF530: .word 0x04804000
_027EF534: .word 0x048080A0
_027EF538: .word 0x048080AC
	arm_func_end sub_027EF4C0

	arm_func_start sub_027EF53C
sub_027EF53C: ; 0x027EF53C
	stmdb sp!, {r4, lr}
	ldr r2, _027EF5E8 ; =0x0380FFF4
	mov r3, #1
	ldr r2, [r2]
	strh r3, [r1, #2]
	add r4, r2, #0x344
	ldrh r2, [r4, #8]
	and r1, r2, #0xf0
	cmp r1, #0x10
	movne r0, r3
	bne _027EF5E0
	ldrh r1, [r0, #0x10]
	cmp r1, #0
	beq _027EF5B4
	cmp r1, #1
	bne _027EF5DC
	cmp r2, #0x10
	movne r0, r3
	bne _027EF5E0
	ldrh r0, [r0, #0x12]
	mov r1, r3
	bl sub_027E9900
	mov r0, #0
	strh r0, [r4, #0xc]
	bl sub_037F8DE0
	mov r0, #0x8000
	bl sub_027E9CE0
	mov r0, #0x11
	strh r0, [r4, #8]
	b _027EF5DC
_027EF5B4:
	cmp r2, #0x11
	bne _027EF5CC
	mov r0, #0
	bl sub_027E9CE0
	bl sub_037F9198
	b _027EF5D4
_027EF5CC:
	mov r0, r3
	b _027EF5E0
_027EF5D4:
	mov r0, #0x10
	strh r0, [r4, #8]
_027EF5DC:
	mov r0, #0
_027EF5E0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EF5E8: .word 0x0380FFF4
	arm_func_end sub_027EF53C

	arm_func_start sub_027EF5EC
sub_027EF5EC: ; 0x027EF5EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _027EF7B0 ; =0x0380FFF4
	mov r8, r0
	ldr r4, [r1]
	ldrh r1, [r8, #0x16]
	ldr r0, _027EF7B4 ; =0x000005E4
	add r5, r4, #0x344
	cmp r1, r0
	add r6, r4, #0x31c
	movhi r0, #5
	bhi _027EF7A8
	ldrh r0, [r6, #0x12]
	cmp r0, #1
	bne _027EF64C
	add r0, r8, #0x28
	bl sub_027EB900
	mov r7, r0
	cmp r7, #0xff
	beq _027EF644
	bl sub_027EBFE0
	cmp r0, #0x40
	beq _027EF650
_027EF644:
	mov r0, #0xa
	b _027EF7A8
_027EF64C:
	ldrh r7, [r5, #0x88]
_027EF650:
	ldr r0, _027EF7B0 ; =0x0380FFF4
	strh r7, [r8, #0x12]
	ldr r0, [r0]
	ldr r0, [r0, #0x3ec]
	strh r0, [r8, #0x14]
	ldrh r0, [r8, #0x1e]
	tst r0, #0xff
	strneh r0, [r8, #0x20]
	movne r0, #0
	strneh r0, [r8, #0x1e]
	bne _027EF688
	mov r0, r7
	bl sub_027EC0A0
	strh r0, [r8, #0x20]
_027EF688:
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	bne _027EF6B0
	ldrh r1, [r5, #0x8a]
	mov r0, #0x1c
	orr r1, r1, #0x40
	bic r1, r1, #0x4000
	strh r1, [r8, #0x24]
	strh r0, [r8, #0x22]
	b _027EF6D4
_027EF6B0:
	ldrh r0, [r5, #0x8a]
	strh r0, [r8, #0x24]
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	ldrh r0, [r8, #0x16]
	addeq r0, r0, #0x1c
	streqh r0, [r8, #0x22]
	addne r0, r0, #0x24
	strneh r0, [r8, #0x22]
_027EF6D4:
	ldrh r0, [r6, #0x12]
	cmp r0, #1
	beq _027EF6F0
	cmp r0, #2
	cmpne r0, #3
	beq _027EF76C
	b _027EF7A4
_027EF6F0:
	add r0, r8, #0x34
	add r1, r8, #0x2e
	bl sub_027EA0E0
	add r0, r8, #0x2e
	add r1, r5, #0x64
	bl sub_027EA0E0
	cmp r7, #0
	bne _027EF748
	mov r1, r8
	add r0, r4, #0x200
	bl sub_027EBAE8
	ldr r0, _027EF7B0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _027EF7A4
	mov r0, #2
	bl sub_027EFEF4
	b _027EF7A4
_027EF748:
	add r0, r8, #0x10
	bl sub_027EBB44
	mov r2, r8
	add r0, r4, #0x200
	add r1, r4, #0x194
	bl sub_037F8988
	mov r0, #0
	bl sub_027EFEF4
	b _027EF7A4
_027EF76C:
	add r0, r8, #0x34
	add r1, r8, #0x28
	bl sub_027EA0E0
	add r0, r8, #0x28
	add r1, r5, #0x64
	bl sub_027EA0E0
	add r0, r8, #0x10
	bl sub_027EBB44
	mov r2, r8
	add r0, r4, #0x200
	add r1, r4, #0x194
	bl sub_037F8988
	mov r0, #0
	bl sub_027EFEF4
_027EF7A4:
	mov r0, #0x81
_027EF7A8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027EF7B0: .word 0x0380FFF4
_027EF7B4: .word 0x000005E4
	arm_func_end sub_027EF5EC

	arm_func_start sub_027EF7B8
sub_027EF7B8: ; 0x027EF7B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _027EF944 ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r2]
	mov sb, #1
	add r0, r2, #0x600
	ldrh r6, [r0, #0x90]
	add r4, r2, #0x31c
	strh sb, [r1, #2]
	ldrh r1, [r4, #0x12]
	add r0, r2, #0x2c
	add r5, r0, #0x400
	cmp r1, #2
	movne r0, #0xb
	bne _027EF93C
	ldrh r0, [sl, #0x10]
	cmp r0, #0x204
	movhi r0, #5
	bhi _027EF93C
	ldrh r0, [r5, #0x50]
	add fp, r5, #0x50
	cmp r0, #0
	moveq sb, #0
	mov r0, #0x14
	mul r8, sb, r0
	ldrh r1, [fp, r8]
	cmp r1, #0
	movne r0, #8
	bne _027EF93C
	ldr r1, _027EF948 ; =0x04808094
	ldrh r1, [r1]
	tst r1, #0x8000
	movne r0, #8
	bne _027EF93C
	add r1, r5, r8
	ldr r7, [r1, #0x58]
	mov r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	strh r0, [r7, #8]
	ldrh r0, [sl, #0x10]
	ldr r3, _027EF94C ; =_027F74AC
	add r0, r0, #0x1e
	strh r0, [r7, #0xa]
	mov r0, #0x118
	strh r0, [r7, #0xc]
	add r0, r7, #0x10
	add r1, r2, #0x3a8
	add r2, r4, #8
	bl sub_027EA130
	ldrh r0, [sl, #0x12]
	strh r0, [r7, #0x24]
	ldrh r0, [sl, #0x10]
	cmp r0, #0
	beq _027EF8B0
	cmp sb, #0
	bne _027EF8A0
	bl sub_027EA1AC
_027EF8A0:
	ldr r1, [sl, #0x14]
	ldrh r2, [sl, #0x10]
	add r0, r7, #0x26
	bl sub_027EAC7C
_027EF8B0:
	tst r6, #4
	beq _027EF8E0
	ldrh r0, [sl, #0x10]
	add r1, r7, #0x24
	add r0, r0, #2
	add r0, r1, r0
	add r0, r0, #3
	ldr r1, _027EF950 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _027EF954 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_027EF8E0:
	mov r0, #0x1000000
	bl ClearIeFlag
	mov r2, #2
	ldr r1, _027EF958 ; =0x00003FFF
	strh r2, [fp, r8]
	add r5, r5, #0x52
	ldrh r2, [r5, r8]
	and r1, r7, r1
	add r3, r2, #1
	mov r2, r1, lsr #1
	ldr r1, _027EF948 ; =0x04808094
	strh r3, [r5, r8]
	orr r2, r2, #0x8000
	strh r2, [r1]
	ldrh r1, [r4, #0x1e]
	mov r4, r0
	mov r0, r1, lsl #0x18
	movs r0, r0, lsr #0x1f
	bne _027EF930
	bl sub_027EA098
_027EF930:
	mov r0, r4
	bl sub_037FB8F0
	mov r0, #0
_027EF93C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027EF944: .word 0x0380FFF4
_027EF948: .word 0x04808094
_027EF94C: .word _027F74AC
_027EF950: .word 0x0000B6B8
_027EF954: .word 0x00001D46
_027EF958: .word 0x00003FFF
	arm_func_end sub_027EF7B8

	arm_func_start sub_027EF95C
sub_027EF95C: ; 0x027EF95C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r2, _027EFDE8 ; =0x0380FFF4
	mov sl, r0
	ldr r4, [r2]
	mov sb, #1
	add r0, r4, #0x600
	ldrh r0, [r0, #0x90]
	add r7, r4, #0x31c
	strh sb, [r1, #2]
	ldrh r1, [r7, #0x12]
	str r0, [sp, #4]
	add r0, r4, #0x2c
	add r6, r0, #0x400
	cmp r1, #1
	movne r0, #0xb
	bne _027EFDDC
	ldrh r0, [r6, #0x3c]
	cmp r0, #0
	movne r0, #8
	bne _027EFDDC
	ldrh r0, [sl, #0x10]
	ldr r5, [r6, #0x44]
	tst r0, #0x8000
	beq _027EFA00
	tst r0, #2
	ldreqh r0, [r6, #0x94]
	streqh r0, [sl, #0x14]
	ldrh r0, [sl, #0x10]
	tst r0, #4
	ldreqh r0, [r6, #0xa0]
	streqh r0, [sl, #0x16]
	ldrh r0, [sl, #0x10]
	tst r0, #8
	ldreqh r0, [r6, #0x96]
	streqh r0, [sl, #0x18]
	ldrh r0, [sl, #0x10]
	tst r0, #0x10
	ldreqh r0, [r6, #0x9c]
	moveq sb, #0
	streqh r0, [sl, #0x1c]
_027EFA00:
	ldrh r0, [sl, #0x1c]
	cmp r0, #0x204
	movhi r0, #5
	bhi _027EFDDC
	mov r1, #2
	mov r8, #0
	b _027EFA30
_027EFA1C:
	ldrh r0, [sl, #0x16]
	tst r0, r1
	mov r0, r1, lsl #0x11
	addne r8, r8, #1
	mov r1, r0, lsr #0x10
_027EFA30:
	cmp r1, #0
	bne _027EFA1C
	ldrh r0, [sl, #0x14]
	strh r0, [r6, #0x94]
	ldrh r0, [sl, #0x14]
	tst r0, #0x8000
	beq _027EFA7C
	ldr r1, _027EFDEC ; =0x00007FFF
	mov r2, #0xea
	and r0, r0, r1
	strh r0, [sl, #0x14]
	ldrh r0, [sl, #0x14]
	sub r0, r0, #0xd0
	mov r0, r0, lsr #2
	strh r2, [r5, #0xe]
	cmp r0, #0x10000
	bls _027EFACC
	mov r0, #5
	b _027EFDDC
_027EFA7C:
	ldr r1, [sp, #4]
	tst r1, #2
	movne fp, #1
	moveq fp, #0
	add r3, fp, #6
	movne r1, #2
	movne r2, #6
	add r0, r0, fp
	add r3, r3, #0x200
	moveq r1, fp
	moveq r2, fp
	cmp r0, r3
	movhi r0, #5
	bhi _027EFDDC
	mov r3, r0, lsl #2
	add r3, r3, #0xd0
	add r1, r1, r3
	strh r1, [sl, #0x14]
	add r1, r2, #0xea
	strh r1, [r5, #0xe]
_027EFACC:
	add r0, r0, #9
	bic fp, r0, #1
	mul r0, fp, r8
	str r0, [sp]
	ldr r1, [sp]
	add r0, r4, #0x188
	add r1, r1, #0x1a
	bl sub_037F886C
	str r0, [r6, #0x90]
	cmp r0, #0
	moveq r0, #8
	beq _027EFDDC
	mov r0, #1
	strh r0, [r6, #0x3c]
	ldrh r0, [r6, #0x3e]
	mov r2, #0
	add r0, r0, #1
	strh r0, [r6, #0x3e]
	ldrh r0, [sl, #0x18]
	add r3, r7, #8
	strh r0, [r6, #0x96]
	ldrh r0, [sl, #0x16]
	mov ip, #0x14
	strh r0, [r6, #0x98]
	strh r2, [r6, #0x9a]
	ldrh r0, [sl, #0x1c]
	mov lr, #0x228
	strh r0, [r6, #0x9c]
	ldrh r1, [sl, #0x12]
	add r0, r5, #0x10
	strh r1, [r6, #0x9e]
	strh r2, [r5]
	ldrh r7, [sl, #0x16]
	ldr r1, _027EFDF0 ; =_027F74BC
	strh r7, [r5, #2]
	strh r2, [r5, #4]
	strh ip, [r5, #8]
	ldrh r7, [sl, #0x1c]
	add r2, r4, #0x3a8
	add r7, r7, #0x22
	strh r7, [r5, #0xa]
	strh lr, [r5, #0xc]
	ldrh ip, [sl, #0x14]
	ldrh r7, [r5, #0xe]
	add ip, ip, #0xa
	mla r7, ip, r8, r7
	strh r7, [r5, #0xe]
	bl sub_027EA130
	ldrh r0, [sl, #0x10]
	tst r0, #0x8000
	ldrneh r1, [r5, #0x22]
	ldrne r0, _027EFDF4 ; =0x0000FFFF
	cmpne r1, r0
	ldreq r0, _027EFDF4 ; =0x0000FFFF
	movne r7, #0x4000
	streqh r0, [r5, #0x22]
	ldrh r0, [sl, #0x14]
	moveq r7, #0
	strh r0, [r5, #0x24]
	ldrh r0, [sl, #0x16]
	cmp sb, #0
	strh r0, [r5, #0x26]
	ldrh r0, [sl, #0x1e]
	strh r0, [r5, #0x28]
	ldrneh r0, [sl, #0x1c]
	cmpne r0, #0
	beq _027EFBEC
	bl sub_027EA1AC
	ldr r1, [sl, #0x20]
	ldrh r2, [sl, #0x1c]
	add r0, r5, #0x2a
	bl sub_027EAC7C
_027EFBEC:
	ldr r0, [sp, #4]
	tst r0, #4
	beq _027EFC20
	ldrh r0, [sl, #0x1c]
	add r1, r5, #0x28
	add r0, r0, #2
	add r0, r1, r0
	add r0, r0, #3
	ldr r1, _027EFDF8 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _027EFDFC ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_027EFC20:
	ldr r0, [r6, #0x90]
	mov r1, #0x184
	strh r1, [r0, #0xc]
	ldr r0, [sp]
	ldr r1, [r6, #0x90]
	add r0, r0, #0xb
	mov r0, r0, lsr #1
	strh r0, [r1, #0xe]
	ldrh r1, [sl, #0x16]
	ldr r0, [r6, #0x90]
	mov r3, #0
	strh r1, [r0, #0x10]
	ldr r0, [r6, #0x90]
	ldr sb, _027EFDF4 ; =0x0000FFFF
	strh r8, [r0, #0x14]
	ldr r0, [r6, #0x90]
	mov r1, #1
	strh fp, [r0, #0x16]
	ldr r0, [r6, #0x90]
	mov r2, #2
	strh r3, [r0, #0x18]
	ldr r0, [r6, #0x90]
	add r0, r0, #0x1a
	b _027EFCA8
_027EFC80:
	ldrh ip, [sl, #0x16]
	tst ip, r2
	strneh sb, [r0]
	strneh r3, [r0, #2]
	strneh r3, [r0, #6]
	strneh r1, [r0, #4]
	mov r2, r2, lsl #0x11
	addne r0, r0, fp
	mov r2, r2, lsr #0x10
	add r1, r1, #1
_027EFCA8:
	cmp r2, #0
	bne _027EFC80
	ldrh r0, [sl, #0x14]
	ldr r2, _027EFE00 ; =0x048080C4
	strh r0, [r2]
	ldrh r0, [r5, #0xe]
	strh r0, [r2, #-4]
	ldrh r1, [sl, #0x1a]
	ldrh r0, [sl, #0x18]
	rsb sb, r1, #0x10000
	cmp r0, #0
	bne _027EFD40
	ldrh r0, [r2, #-0xc4]
	ldrh r1, [sl, #0x1c]
	cmp r0, #0x1440
	ldrh r0, [sl, #0x14]
	add r1, r1, #0x22
	mul r2, r0, r8
	mov r1, r1, lsl #2
	add r3, r1, #0x60
	addne r3, r3, #0x3e8
	add r0, r2, #0x388
	add r0, r3, r0
	mov r1, #0xa
	add r0, r0, #0x32
	bl _u32_div_f
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _027EFE04 ; =0x00003FFF
	ldr r2, _027EFE08 ; =0x04808118
	and r1, r5, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	strh r4, [r2]
	orr r1, r1, r7
	strh r1, [r2, #-0x88]
	bl SetIrqFlag
	b _027EFDD8
_027EFD40:
	bl EnableIrqFlag
	ldr r1, _027EFE0C ; =0x048080F8
	mov r8, r0
	ldrh r0, [r1]
	mov r1, #0xa
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl _u32_div_f
	ldrh r3, [sl, #0x18]
	add r1, r0, #3
	cmp r1, r3
	bhs _027EFDA8
	ldr r1, _027EFE04 ; =0x00003FFF
	ldr r2, _027EFE08 ; =0x04808118
	sub r3, r3, r0
	and r0, r5, r1
	sub r1, r3, #1
	mov r0, r0, lsr #1
	orr r0, r0, #0x8000
	strh r1, [r2]
	orr r1, r0, r7
	mov r0, r8
	strh r1, [r2, #-0x88]
	bl SetIrqFlag
	b _027EFDD8
_027EFDA8:
	mov r0, r8
	bl SetIrqFlag
	ldr r1, [r6, #0x90]
	add r0, r4, #0x188
	bl sub_037F8908
	mov r0, #0
	strh r0, [r6, #0x3c]
	ldrh r1, [r6, #0x3e]
	mov r0, #5
	sub r1, r1, #1
	strh r1, [r6, #0x3e]
	b _027EFDDC
_027EFDD8:
	mov r0, #0
_027EFDDC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027EFDE8: .word 0x0380FFF4
_027EFDEC: .word 0x00007FFF
_027EFDF0: .word _027F74BC
_027EFDF4: .word 0x0000FFFF
_027EFDF8: .word 0x0000B6B8
_027EFDFC: .word 0x00001D46
_027EFE00: .word 0x048080C4
_027EFE04: .word 0x00003FFF
_027EFE08: .word 0x04808118
_027EFE0C: .word 0x048080F8
	arm_func_end sub_027EF95C

	arm_func_start sub_027EFE10
sub_027EFE10: ; 0x027EFE10
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	rsb r0, r2, #0x10000
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x16]
	add r0, r4, #0x10
	strh r1, [r4, #0x22]
	bl sub_027EBB44
	ldr r0, _027EFE6C ; =0x0380FFF4
	mov r2, r4
	ldr r1, [r0]
	add r0, r1, #0x200
	add r1, r1, #0x194
	bl sub_037F8988
	mov r0, #0
	bl sub_027EFEF4
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027EFE6C: .word 0x0380FFF4
	arm_func_end sub_027EFE10

	arm_func_start sub_027EFE70
sub_027EFE70: ; 0x027EFE70
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	tst r0, #1
	beq _027EFE90
	bl sub_027F0B00
_027EFE90:
	ldrh r0, [r4, #0x10]
	tst r0, #2
	beq _027EFEA0
	bl sub_027F0B74
_027EFEA0:
	ldrh r0, [r4, #0x10]
	tst r0, #4
	beq _027EFEB0
	bl sub_027F0BC8
_027EFEB0:
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027EFE70

	arm_func_start sub_027EFEBC
sub_027EFEBC: ; 0x027EFEBC
	stmdb sp!, {r3, lr}
	ldrh r2, [r1, #0xe]
	mov r3, #2
	add lr, r1, r2, lsl #1
	ldrh ip, [lr, #0x10]
	mov r2, #0
	strh ip, [r1, #0xc]
	strh r3, [lr, #0x12]
	strh r2, [lr, #0x14]
	ldrh r2, [r1, #0x18]
	strh r2, [lr, #0x16]
	bl sub_037F8D58
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027EFEBC

	arm_func_start sub_027EFEF4
sub_027EFEF4: ; 0x027EFEF4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _027F0108 ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	mov r0, #0xc
	add r1, r2, #0x194
	mla fp, sl, r0, r1
	add r0, r2, #0x2c
	ldrh r1, [fp, #8]
	add r5, r0, #0x400
	mov r0, #0x14
	mla r6, sl, r0, r5
	cmp r1, #0
	add r4, r2, #0x344
	beq _027F00FC
	mov r0, #0x1000000
	bl ClearIeFlag
	ldrh r1, [r6]
	str r0, [sp]
	cmp r1, #0
	beq _027EFF54
	bl sub_037FB8F0
	b _027F00FC
_027EFF54:
	ldr r7, [fp]
	mvn r0, #0
	str r0, [sp, #8]
_027EFF60:
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _027EFF78
	ldr r0, [sp]
	bl sub_037FB8F0
	b _027F00FC
_027EFF78:
	mov r0, r7
	str r7, [sp, #4]
	bl sub_037F8A80
	mov r1, r7
	add r8, r1, #0x10
	mov r7, r0
	ldrh sb, [r8, #2]
	mov r0, r8
	bl sub_027F027C
	cmp r0, #0
	beq _027EFFDC
	ldrh r1, [r5, #0xae]
	mov r0, r8
	add r1, r1, #1
	strh r1, [r5, #0xae]
	mov r1, #2
	strh r1, [r8, #8]
	ldrh r2, [r6, #4]
	mov r1, #0
	add r2, r2, #1
	strh r2, [r6, #4]
	ldr r2, [r6, #0x10]
	mov lr, pc
	bx r2
_027EFFD8:
	b _027EFF60
_027EFFDC:
	cmp sl, #0
	beq _027EFFFC
	cmp sl, #1
	bne _027F003C
	mov r0, sb
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027F003C
_027EFFFC:
	mov r0, sb
	bl sub_027EC000
	cmp r0, #0
	beq _027EFF60
	mov r0, sb
	bl sub_027EBFE0
	cmp r0, #0x40
	beq _027F003C
	mov r2, #2
	mov r0, fp
	sub r1, r8, #0x10
	strh r2, [r8, #8]
	bl sub_027EFEBC
	mov r0, r8
	bl sub_027EBBD4
	b _027EFF60
_027F003C:
	mov r0, #1
	strh r0, [r6]
	ldrh r0, [r6, #2]
	add r0, r0, #1
	strh r0, [r6, #2]
	str r8, [r6, #0xc]
	ldrh r0, [r4, #0x10]
	ldr r5, [r6, #8]
	cmp r0, #0
	bne _027F006C
	mov r0, #2
	bl sub_027E9CB4
_027F006C:
	ldr r1, [sp, #4]
	mov r0, r5
	bl sub_027F0114
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _027F009C
	mov r0, sb
	bl sub_027EC0EC
	cmp r0, #1
	ldrhih r0, [r5, #0xc]
	orrhi r0, r0, #0x2000
	strhih r0, [r5, #0xc]
_027F009C:
	ldr r1, _027F010C ; =0x00003FFF
	ldr r0, _027F0110 ; =0x048080A0
	ldrh r4, [r8, #0x14]
	and r2, r5, r1
	and r1, r4, #0xc
	cmp r1, #4
	mov r1, r2, lsr #1
	add r3, r0, sl, lsl #2
	moveq r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0xa000
	streqh r0, [r3]
	beq _027F00F4
	and r0, r4, #0xfc
	cmp r0, #0x50
	mov r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0x9000
	streqh r0, [r3]
	movne r0, r0, lsr #0x10
	orrne r0, r0, #0x8000
	strneh r0, [r3]
_027F00F4:
	ldr r0, [sp]
	bl sub_037FB8F0
_027F00FC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F0108: .word 0x0380FFF4
_027F010C: .word 0x00003FFF
_027F0110: .word 0x048080A0
	arm_func_end sub_027EFEF4

	arm_func_start sub_027F0114
sub_027F0114: ; 0x027F0114
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4, #0x24]
	mov r5, r0
	tst r1, #0x4000
	beq _027F01F0
	ldr r0, _027F0268 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	bne _027F0148
	bl sub_027EA1AC
_027F0148:
	ldrh r1, [r4, #0xc]
	ldr r0, _027F026C ; =0x0000FFFF
	cmp r1, r0
	bne _027F0170
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	add r2, r4, #0x3c
	bl sub_027EACE0
	b _027F0184
_027F0170:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	bl sub_027EACE0
_027F0184:
	ldr r3, _027F0270 ; =0x04808044
	ldr r1, _027F0268 ; =0x0380FFF4
	ldrh r2, [r3]
	ldrh r0, [r3]
	add r0, r2, r0, lsl #8
	strh r0, [r5, #0x24]
	ldr r0, [r1]
	ldrh r2, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x36]
	and r2, r2, #0xff
	orr r0, r2, r0, lsl #14
	strh r0, [r5, #0x26]
	ldr r0, [r1]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _027F0224
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #7
	bic r1, r0, #1
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	b _027F0224
_027F01F0:
	ldrh r2, [r4, #0xc]
	ldr r1, _027F026C ; =0x0000FFFF
	cmp r2, r1
	bne _027F0214
	ldrh r2, [r4, #0x16]
	add r1, r4, #0x18
	add r2, r2, #0x24
	bl sub_027EAC7C
	b _027F0224
_027F0214:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	add r1, r4, #0x18
	bl sub_027EAC9C
_027F0224:
	ldr r0, _027F0268 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _027F0260
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #1
	ldr r1, _027F0274 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _027F0278 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_027F0260:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F0268: .word 0x0380FFF4
_027F026C: .word 0x0000FFFF
_027F0270: .word 0x04808044
_027F0274: .word 0x0000B6B8
_027F0278: .word 0x00001D46
	arm_func_end sub_027F0114

	arm_func_start sub_027F027C
sub_027F027C: ; 0x027F027C
	ldr r1, _027F02F8 ; =0x0380FFF4
	ldrh r2, [r0, #0x14]
	ldr r3, [r1]
	mov r1, r2, lsl #0x1c
	add ip, r3, #0x344
	ldrh r3, [ip, #0x8c]
	movs r1, r1, lsr #0x1e
	mov r1, r3, lsl #0x13
	mov r3, r1, lsr #0x10
	bne _027F02D0
	ldrh r1, [ip, #0xc]
	cmp r1, #1
	bne _027F02D8
	mov r1, r2, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #0xb
	moveq r1, r3, lsl #0xd
	moveq r3, r1, lsr #0x10
	b _027F02D8
_027F02D0:
	mov r1, r3, lsl #0xd
	mov r3, r1, lsr #0x10
_027F02D8:
	ldr r1, [ip, #0xa8]
	ldrh r0, [r0, #4]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	movlo r0, #1
	movhs r0, #0
	bx lr
	.align 2, 0
_027F02F8: .word 0x0380FFF4
	arm_func_end sub_027F027C

	arm_func_start sub_027F02FC
sub_027F02FC: ; 0x027F02FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _027F0474 ; =0x0380FFF4
	mov sb, r0
	ldr r4, [r2]
	mov r8, r1
	add r5, r4, #0x194
	add r6, r4, #0x344
	sub r7, sb, #0x10
	bl sub_027EBBD4
	ldrh r0, [sb, #8]
	tst r0, #2
	bne _027F0390
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sb, #0x14]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _027F036C
	ldrh r0, [sb, #0x24]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _027F039C
_027F036C:
	ldrh r0, [sb, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _027F039C
_027F0390:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_027F039C:
	ldrh r0, [sb, #0x14]
	mov r1, r7
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	mov r0, r5
	bl sub_027EFEBC
	ldr r0, _027F0474 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x2c]
	ldrh r0, [sb, #2]
	bl sub_027EC020
	cmp r0, #0
	beq _027F03F8
	ldrh r0, [sb, #0x14]
	tst r0, #0x2000
	bne _027F03F8
	ldrh r0, [sb, #2]
	bl sub_027EBDA8
_027F03F8:
	cmp r8, #0
	beq _027F046C
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _027F0418
	mov r0, #0
	bl sub_027EFEF4
	b _027F046C
_027F0418:
	ldrh r0, [r6, #0xc]
	add r0, r0, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _027F046C
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	bne _027F046C
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _027F046C
	ldrh r0, [r6, #0x88]
	bl sub_027EC0EC
	cmp r0, #0
	ldreqh r0, [r6, #0x8e]
	cmpeq r0, #0
	bne _027F046C
	mov r0, #1
	bl sub_027E9CB4
_027F046C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027F0474: .word 0x0380FFF4
	arm_func_end sub_027F02FC

	arm_func_start sub_027F0478
sub_027F0478: ; 0x027F0478
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _027F0940 ; =0x0380FFF4
	mov sl, r0
	ldr r4, [r2]
	ldrh r2, [sl, #8]
	add r0, r4, #4
	ldrh r7, [sl, #2]
	mov sb, r1
	tst r2, #2
	add r8, r4, #0x344
	add r5, r0, #0x400
	add r6, r4, #0x1a0
	bne _027F0500
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sl, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	mov r0, r7
	bl sub_027EC020
	cmp r0, #0
	beq _027F050C
	ldrh r0, [sl, #0x14]
	tst r0, #0x2000
	bne _027F050C
	mov r0, r7
	bl sub_027EBDA8
	b _027F050C
_027F0500:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_027F050C:
	ldrh r0, [sl, #0x14]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	ldrh r0, [sl, #0xc]
	ldr r1, [r4, #0x544]
	and r0, r0, #0xff
	add r0, r1, r0
	str r0, [r4, #0x544]
	ldrh r0, [sl, #0x14]
	and r4, r0, #0xfc
	cmp r4, #0xa0
	bhi _027F0568
	bhs _027F06D0
	cmp r4, #0x10
	bhi _027F055C
	beq _027F060C
	b _027F08F8
_027F055C:
	cmp r4, #0x30
	beq _027F060C
	b _027F08F8
_027F0568:
	cmp r4, #0xb0
	bhi _027F0578
	beq _027F0584
	b _027F08F8
_027F0578:
	cmp r4, #0xc0
	beq _027F07B4
	b _027F08F8
_027F0584:
	cmp r7, #0
	beq _027F08F8
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _027F08F8
	ldrh r1, [sl, #0x2c]
	cmp r1, #0
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #2
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _027F05D4
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_027EBC44
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_027EDB68
	b _027F08F8
_027F05D4:
	cmp r1, #1
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #4
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _027F08F8
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_027EBC44
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_027EDB68
	b _027F08F8
_027F060C:
	cmp r7, #0
	beq _027F08F8
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _027F0684
	ldrh r0, [sl, #0x2e]
	cmp r0, #0
	bne _027F08F8
	mov r0, r7
	bl sub_027EBFE0
	cmp r0, #0x30
	bne _027F08F8
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x40
	bl sub_027EBC44
	ldrh r2, [sl, #0x12]
	cmp r4, #0x10
	add r3, sl, #0x14
	bne _027F0670
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_027EDC60
	b _027F08F8
_027F0670:
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_027EDD58
	b _027F08F8
_027F0684:
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027EBF60
	add r0, sl, #0x18
	mov r1, #1
	mov r2, #0
	bl sub_027F1EBC
	cmp r0, #0
	beq _027F08F8
	mov r1, #2
	strh r1, [r0]
	cmp sb, #0
	beq _027F06C8
	bl sub_027F1094
	mov r0, #1
	bl sub_027EFEF4
	b _027F08F8
_027F06C8:
	bl sub_027F1094
	b _027F08F8
_027F06D0:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _027F0760
	cmp r7, #0
	beq _027F0708
	mov r0, r7
	bl sub_027EBFE0
	cmp r0, #0x30
	bls _027F0778
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_027EBC44
	b _027F0778
_027F0708:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _027F0778
	ldr r4, _027F0940 ; =0x0380FFF4
	mov r8, #1
	mov r7, #0x30
	b _027F0748
_027F0724:
	mov r0, r8
	bl sub_027EBFE0
	cmp r0, #0x30
	bls _027F0744
	mov r0, r8, lsl #0x10
	mov r1, r7
	mov r0, r0, lsr #0x10
	bl sub_027EBC44
_027F0744:
	add r8, r8, #1
_027F0748:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _027F0724
	b _027F0778
_027F0760:
	ldrh r0, [r8, #8]
	cmp r0, #0x30
	bls _027F0778
	mov r0, #0x30
	bl sub_037F9238
	bl sub_027EA03C
_027F0778:
	ldrh r0, [r5]
	cmp r0, #0x71
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _027F08F8
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_027EDB14
	b _027F08F8
_027F07B4:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _027F0844
	cmp r7, #0
	beq _027F07EC
	mov r0, r7
	bl sub_027EBFE0
	cmp r0, #0x20
	bls _027F085C
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	b _027F085C
_027F07EC:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _027F085C
	ldr r4, _027F0940 ; =0x0380FFF4
	mov r8, #1
	mov fp, #0x20
	b _027F082C
_027F0808:
	mov r0, r8
	bl sub_027EBFE0
	cmp r0, #0x20
	bls _027F0828
	mov r0, r8, lsl #0x10
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl sub_027EBC44
_027F0828:
	add r8, r8, #1
_027F082C:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _027F0808
	b _027F085C
_027F0844:
	ldrh r0, [r8, #8]
	cmp r0, #0x20
	bls _027F085C
	mov r0, #0x20
	bl sub_037F9238
	bl sub_027EA03C
_027F085C:
	ldrh r0, [r5]
	cmp r0, #0x41
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _027F0894
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_027EDB14
_027F0894:
	ldrh r0, [sl]
	cmp r0, #1
	bne _027F08E4
	cmp r7, #0
	beq _027F08D4
	ldr r0, _027F0940 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r1, r1, #0x500
	ldrh r3, [r1, #0x34]
	mvn r2, r2, lsl r7
	and r2, r3, r2
	mov r0, r0, lsr #0x10
	strh r2, [r1, #0x34]
	bl sub_027EC42C
_027F08D4:
	add r0, sl, #0x18
	mov r1, #1
	bl sub_027EDBE4
	b _027F08F8
_027F08E4:
	cmp r0, #2
	bne _027F08F8
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_027EDBE4
_027F08F8:
	mov r0, sl
	bl sub_027EBBD4
	mov r0, r6
	sub r1, sl, #0x10
	bl sub_037F8908
	ldr r0, _027F0940 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	cmp sb, #0
	add r0, r0, #0x400
	strh r1, [r0, #0x40]
	ldrneh r0, [r6, #8]
	cmpne r0, #0
	beq _027F0938
	mov r0, #1
	bl sub_027EFEF4
_027F0938:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F0940: .word 0x0380FFF4
	arm_func_end sub_027F0478

	arm_func_start sub_027F0944
sub_027F0944: ; 0x027F0944
	ldr r2, _027F09A8 ; =0x0380FFF4
	ldrh r1, [r0, #4]
	ldr r3, [r2]
	and r1, r1, #0xff
	ldr r2, [r3, #0x544]
	add r1, r2, r1
	str r1, [r3, #0x544]
	ldrh r0, [r0]
	tst r0, #2
	ldrne r0, [r3, #0x540]
	addne r0, r0, #1
	strne r0, [r3, #0x540]
	bne _027F0990
	ldr r0, [r3, #0x53c]
	add r0, r0, #1
	str r0, [r3, #0x53c]
	ldr r0, [r3, #0x54c]
	add r0, r0, #1
	str r0, [r3, #0x54c]
_027F0990:
	ldr r0, _027F09A8 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x54]
	bx lr
	.align 2, 0
_027F09A8: .word 0x0380FFF4
	arm_func_end sub_027F0944

	arm_func_start sub_027F09AC
sub_027F09AC: ; 0x027F09AC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027F0AB0 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r2]
	mov r5, r1
	ldr r1, [r2, #0x550]
	add r4, r2, #0x17c
	add r1, r1, #1
	str r1, [r2, #0x550]
	ldrh r1, [r6, #0x14]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1e
	bne _027F0A04
	bl sub_027EBB44
	add r0, r4, #0x30
	add r1, r4, #0x24
	sub r2, r6, #0x10
	bl sub_037F8988
	mov r0, r6
	mov r1, #0
	bl sub_027F0478
	b _027F0A10
_027F0A04:
	add r0, r4, #0x30
	sub r1, r6, #0x10
	bl sub_027EFEBC
_027F0A10:
	ldr r1, _027F0AB0 ; =0x0380FFF4
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r2, [r0, #0x54]
	ldr r0, [r1]
	ldr r0, [r0, #0x45c]
	ldrh r0, [r0, #0xc]
	mov r0, r0, lsl #0x12
	movs r0, r0, lsr #0x1f
	bne _027F0A80
	ldr r1, _027F0AB4 ; =0x048080AC
	mov r0, #8
	strh r0, [r1]
	mov r0, #5
	strh r0, [r1, #2]
	cmp r5, #0
	beq _027F0A80
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _027F0A6C
	mov r0, #1
	bl sub_027EFEF4
_027F0A6C:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _027F0A80
	mov r0, #0
	bl sub_027EFEF4
_027F0A80:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _027F0AA0
	cmp r5, #0
	beq _027F0AA8
	mov r0, #2
	bl sub_027EFEF4
	b _027F0AA8
_027F0AA0:
	mov r0, #0
	bl sub_027EC1C8
_027F0AA8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F0AB0: .word 0x0380FFF4
_027F0AB4: .word 0x048080AC
	arm_func_end sub_027F09AC

	arm_func_start sub_027F0AB8
sub_027F0AB8: ; 0x027F0AB8
	ldr r2, [r0, #8]
	ldr r1, _027F0AFC ; =0x0380FFF4
	ldrh r3, [r2, #4]
	ldr r2, [r1]
	ands r3, r3, #0xff
	ldreq r1, [r2, #0x5a8]
	addeq r1, r1, #1
	streq r1, [r2, #0x5a8]
	ldrne r1, [r2, #0x5a4]
	addne r1, r1, r3
	strne r1, [r2, #0x5a4]
	ldrh r2, [r0, #4]
	mov r1, #0
	add r2, r2, #1
	strh r2, [r0, #4]
	strh r1, [r0]
	bx lr
	.align 2, 0
_027F0AFC: .word 0x0380FFF4
	arm_func_end sub_027F0AB8

	arm_func_start sub_027F0B00
sub_027F0B00: ; 0x027F0B00
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F0B6C ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl ClearIeFlag
	ldr r1, _027F0B6C ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	bne _027F0B44
	mov r0, #0
	bl sub_027EA0BC
_027F0B44:
	ldr r0, _027F0B70 ; =0x048080B4
	mov r1, #0xc0
	strh r1, [r0]
	mov r1, #0
	strh r1, [r4, #0x50]
	mov r0, r5
	strh r1, [r4, #0x64]
	bl sub_037FB8F0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F0B6C: .word 0x0380FFF4
_027F0B70: .word 0x048080B4
	arm_func_end sub_027F0B00

	arm_func_start sub_027F0B74
sub_027F0B74: ; 0x027F0B74
	stmdb sp!, {r4, lr}
	ldr r1, _027F0BC0 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl ClearIeFlag
	ldr r1, _027F0BC4 ; =0x048080B4
	mov r2, #2
	strh r2, [r1]
	ldrh r1, [r4, #0x3c]
	mov r4, r0
	cmp r1, #0
	beq _027F0BB0
	bl sub_037FACB4
_027F0BB0:
	mov r0, r4
	bl sub_037FB8F0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F0BC0: .word 0x0380FFF4
_027F0BC4: .word 0x048080B4
	arm_func_end sub_027F0B74

	arm_func_start sub_027F0BC8
sub_027F0BC8: ; 0x027F0BC8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F0C68 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl ClearIeFlag
	ldr r1, _027F0C68 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldr r0, _027F0C6C ; =0x048080B4
	bne _027F0C30
	mov r1, #9
	strh r1, [r0]
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _027F0C20
	mov r0, #2
	bl sub_027F0C70
_027F0C20:
	mov r0, #2
	mov r1, #1
	bl sub_027F0FF0
	b _027F0C38
_027F0C30:
	mov r1, #1
	strh r1, [r0]
_027F0C38:
	ldrh r0, [r4]
	cmp r0, #0
	beq _027F0C4C
	mov r0, #0
	bl sub_027F0C70
_027F0C4C:
	mov r0, #0
	mov r1, #1
	bl sub_027F0FF0
	mov r0, r5
	bl sub_037FB8F0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F0C68: .word 0x0380FFF4
_027F0C6C: .word 0x048080B4
	arm_func_end sub_027F0BC8

	arm_func_start sub_027F0C70
sub_027F0C70: ; 0x027F0C70
	stmdb sp!, {r3, lr}
	ldr r2, _027F0CD0 ; =0x0380FFF4
	mov r1, #0x14
	ldr r2, [r2]
	mul r1, r0, r1
	add r0, r2, #0x2c
	add r2, r0, #0x400
	ldrh r0, [r2, r1]
	add r2, r2, r1
	cmp r0, #0
	beq _027F0CC8
	ldr r0, [r2, #8]
	ldrh r1, [r0]
	ldr r0, [r2, #0xc]
	cmp r1, #0
	moveq r1, #2
	strh r1, [r0, #8]
	ldr r0, [r2, #0xc]
	ldr r2, [r2, #0x10]
	mov r1, #0
	mov lr, pc
	bx r2
_027F0CC8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027F0CD0: .word 0x0380FFF4
	arm_func_end sub_027F0C70

	arm_func_start sub_027F0CD4
sub_027F0CD4: ; 0x027F0CD4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027F0D54 ; =0x0380FFF4
	mov r7, r0
	mov r0, #0x14
	ldr r1, [r1]
	mul r4, r7, r0
	add r0, r1, #0x2c
	add r5, r0, #0x400
	mov r0, #0x1000000
	add r6, r5, r4
	bl ClearIeFlag
	ldr r1, _027F0D58 ; =_027F7870
	mov r2, r7, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _027F0D5C ; =0x048080B4
	strh r2, [r1]
	ldrh r1, [r5, r4]
	cmp r1, #0
	beq _027F0D48
	ldr r2, [r6, #0xc]
	ldrh r1, [r2, #0x14]
	tst r1, #0x4000
	ldreq r1, [r6, #8]
	ldreqh r1, [r1, #4]
	streqh r1, [r2, #0xc]
	ldr r2, [r6, #8]
	ldr r1, [r6, #0xc]
	ldrh r2, [r2, #0x22]
	strh r2, [r1, #0x2a]
_027F0D48:
	bl sub_037FB8F0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F0D54: .word 0x0380FFF4
_027F0D58: .word _027F7870
_027F0D5C: .word 0x048080B4
	arm_func_end sub_027F0CD4

	arm_func_start sub_027F0D60
sub_027F0D60: ; 0x027F0D60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r7, #0
	bl sub_027EC0EC
	cmp r0, #0
	beq _027F0E4C
	mov r8, r7
_027F0D7C:
	ldr r0, _027F0E54 ; =0x0380FFF4
	mov r1, #0xc
	ldr r2, [r0]
	mul sl, r8, r1
	sub r0, r1, #0xd
	add r1, r2, sl
	ldr r5, [r1, #0x194]
	cmp r5, r0
	beq _027F0E40
	mov r0, #0x14
	mul sb, r8, r0
	mvn r4, #0
_027F0DAC:
	mov r0, r5
	bl sub_037F8A80
	add r6, r5, #0x10
	ldrh r1, [r6, #2]
	str r0, [sp]
	cmp r1, fp
	bne _027F0E30
	cmp r8, #1
	ldrne r0, _027F0E54 ; =0x0380FFF4
	ldrne r0, [r0]
	addne r0, sb, r0
	ldrne r0, [r0, #0x438]
	cmpne r6, r0
	bne _027F0E00
	mov r0, r6
	bl sub_027EBBD4
	mov r1, #0
	mov r0, r6
	strh r1, [r6, #2]
	bl sub_027EBB44
	b _027F0E30
_027F0E00:
	mov r0, #2
	strh r0, [r6, #8]
	mov r0, r6
	bl sub_027EBBD4
	ldr r0, _027F0E54 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x194
	add r0, r0, sl
	bl sub_027EFEBC
	cmp r7, #0
	moveq r7, #1
_027F0E30:
	ldr r5, [sp]
	mov r0, r5
	cmp r0, r4
	bne _027F0DAC
_027F0E40:
	add r8, r8, #1
	cmp r8, #3
	blo _027F0D7C
_027F0E4C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F0E54: .word 0x0380FFF4
	arm_func_end sub_027F0D60

	arm_func_start sub_027F0E58
sub_027F0E58: ; 0x027F0E58
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _027F0F04 ; =0x0380FFF4
	ldrh r1, [r0]
	ldr r2, [r4]
	tst r1, #1
	beq _027F0EAC
	add r0, r2, #0x300
	ldrh r0, [r0, #0x22]
	mov r5, #1
	cmp r0, #1
	bls _027F0EFC
	b _027F0E94
_027F0E88:
	mov r0, r5
	bl sub_027F0D60
	add r5, r5, #1
_027F0E94:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r5, r0
	blo _027F0E88
	b _027F0EFC
_027F0EAC:
	bl sub_027EB900
	mov r4, r0
	cmp r4, #0xff
	beq _027F0EC0
	bl sub_027F0D60
_027F0EC0:
	ldr r0, _027F0F04 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	cmp r0, #1
	bne _027F0EFC
	mov r0, r4
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027F0EFC
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	bl sub_027F0B00
_027F0EFC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F0F04: .word 0x0380FFF4
	arm_func_end sub_027F0E58

	arm_func_start sub_027F0F08
sub_027F0F08: ; 0x027F0F08
	stmdb sp!, {r4, lr}
	ldr r0, _027F0FEC ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x300
	ldrh r1, [r0, #0x50]
	add r0, r2, #0x2c
	cmp r1, #1
	add r4, r0, #0x400
	beq _027F0F3C
	cmp r1, #2
	cmpne r1, #3
	beq _027F0F98
	b _027F0FC0
_027F0F3C:
	mov r0, #0
	mov r1, #1
	bl sub_027F0FF0
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #2
	mov r1, #1
	bl sub_027F0FF0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _027F0FE4
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldrh r1, [r4, #0x3e]
	ldr r0, _027F0FEC ; =0x0380FFF4
	sub r1, r1, #1
	strh r1, [r4, #0x3e]
	ldr r0, [r0]
	ldr r1, [r4, #0x90]
	add r0, r0, #0x188
	bl sub_037F8908
	b _027F0FE4
_027F0F98:
	mov r0, #0
	mov r1, #1
	bl sub_027F0FF0
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #2
	mov r1, #0
	bl sub_027F0FF0
	b _027F0FE4
_027F0FC0:
	mov r0, #0
	mov r1, r0
	bl sub_027F0FF0
	mov r0, #1
	mov r1, #0
	bl sub_027F0FF0
	mov r0, #2
	mov r1, #0
	bl sub_027F0FF0
_027F0FE4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F0FEC: .word 0x0380FFF4
	arm_func_end sub_027F0F08

	arm_func_start sub_027F0FF0
sub_027F0FF0: ; 0x027F0FF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, _027F1078 ; =0x0380FFF4
	mov r2, #0xc
	mov sl, r0
	mul r8, sl, r2
	ldr r3, [r5]
	sub r0, r2, #0xd
	add r2, r3, r8
	ldr r6, [r2, #0x194]
	mov sb, r1
	cmp r6, r0
	beq _027F1070
	mov fp, #2
	mvn r4, #0
_027F1028:
	mov r0, r6
	bl sub_037F8A80
	mov r7, r0
	cmp sl, #2
	beq _027F1044
	add r0, r6, #0x10
	bl sub_027EBBD4
_027F1044:
	strh fp, [r6, #0x18]
	cmp sb, #0
	beq _027F1064
	ldr r0, [r5]
	mov r1, r6
	add r0, r0, #0x194
	add r0, r0, r8
	bl sub_027EFEBC
_027F1064:
	mov r6, r7
	cmp r7, r4
	bne _027F1028
_027F1070:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F1078: .word 0x0380FFF4
	arm_func_end sub_027F0FF0

	arm_func_start sub_027F107C
sub_027F107C: ; 0x027F107C
	stmdb sp!, {r3, lr}
	bl sub_027F1094
	mov r0, #1
	bl sub_027EFEF4
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027F107C

	arm_func_start sub_027F1094
sub_027F1094: ; 0x027F1094
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x18
	bl sub_027EB900
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0xff
	moveq r0, #0
	streqh r0, [r4, #2]
	ldr r0, _027F1104 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0x14]
	tst r0, #0x4000
	ldrneh r0, [r4, #0x12]
	addne r0, r0, #8
	strneh r0, [r4, #0x12]
	mov r0, r4
	bl sub_027EBB44
	ldr r0, _027F1104 ; =0x0380FFF4
	sub r2, r4, #0x10
	ldr r1, [r0]
	add r0, r1, #0x188
	add r1, r1, #0x1a0
	bl sub_037F8988
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F1104: .word 0x0380FFF4
	arm_func_end sub_027F1094

	arm_func_start sub_027F1108
sub_027F1108: ; 0x027F1108
	stmdb sp!, {r4, lr}
	ldr r0, _027F1190 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x54
	add r4, r0, #0x400
	ldrh r1, [r4, #2]
	add r0, r2, #0x400
	add r1, r1, #1
	strh r1, [r4, #2]
	ldrh r0, [r0, #0x54]
	mov r1, #0
	cmp r0, #0
	ldrne r0, [r4, #8]
	strneh r1, [r0, #4]
	bne _027F1188
	mov r0, #1
	strh r0, [r4]
	ldr r0, [r4, #8]
	strh r1, [r0]
	ldr r0, [r4, #8]
	strh r1, [r0, #4]
	bl sub_027EA578
	ldr r2, [r4, #8]
	ldr r1, _027F1194 ; =0x00003FFF
	strh r0, [r2, #8]
	ldr r0, [r4, #8]
	ldr r2, _027F1198 ; =0x048080A8
	and r0, r0, r1
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	orr r0, r0, #0x8000
	strh r0, [r2]
_027F1188:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F1190: .word 0x0380FFF4
_027F1194: .word 0x00003FFF
_027F1198: .word 0x048080A8
	arm_func_end sub_027F1108

	arm_func_start sub_027F119C
sub_027F119C: ; 0x027F119C
	ldr r0, _027F11D4 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r0]
	rsb r1, r2, #0x4000
	add r0, r3, #0x400
	strh r2, [r0, #0xa4]
	add r0, r3, #0xa4
	ldr r2, [r0, #0x408]
	ldr r0, _027F11D8 ; =0x04808080
	and r1, r2, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	strh r1, [r0]
	bx lr
	.align 2, 0
_027F11D4: .word 0x0380FFF4
_027F11D8: .word 0x04808080
	arm_func_end sub_027F119C

	arm_func_start sub_027F11DC
sub_027F11DC: ; 0x027F11DC
	ldr r1, _027F11FC ; =0x0380FFF4
	ldr r0, _027F1200 ; =0x04808080
	ldr r2, [r1]
	mov r1, #0
	strh r1, [r0]
	add r0, r2, #0x400
	strh r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_027F11FC: .word 0x0380FFF4
_027F1200: .word 0x04808080
	arm_func_end sub_027F11DC

	arm_func_start sub_027F1204
sub_027F1204: ; 0x027F1204
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _027F1560 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	ldr r8, [r1, #0x4ac]
	add r5, r1, #0x31c
	strh r0, [r8]
	strh r0, [r8, #2]
	strh r0, [r8, #4]
	strh r0, [r8, #6]
	add r6, r1, #0x344
	bl sub_027EA578
	strh r0, [r8, #8]
	mov r0, #0x80
	strh r0, [r8, #0xc]
	mov r0, #0
	add r2, r5, #8
	strh r0, [r8, #0xe]
	ldr r1, _027F1564 ; =_027F74A4
	add r0, r8, #0x10
	mov r3, r2
	bl sub_027EA130
	mov r1, #0
	strh r1, [r8, #0x22]
	add sl, r8, #0x24
	str r1, [r8, #0x24]
	str r1, [sl, #4]
	ldrh r0, [r6, #0x6e]
	add sb, sl, #0xc
	strh r0, [sl, #8]
	ldrh r0, [r6, #0x7c]
	strh r0, [sl, #0xa]
	ldrh r0, [r5, #0x1e]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _027F1304
	sub r0, sb, sl
	strh r0, [r6, #0x92]
	mov r0, sb
	bl sub_027EAD24
	ldrh r1, [r6, #0x1e]
	add r0, sb, #1
	and r1, r1, #0xff
	add sb, sb, #2
	bl sub_027EAD24
	mov r7, #0
	add r4, r6, #0x20
	b _027F12E0
_027F12C4:
	add r0, r4, r7
	bl sub_027EAD50
	mov r1, r0
	mov r0, sb
	bl sub_027EAD24
	add sb, sb, #1
	add r7, r7, #1
_027F12E0:
	ldrh r0, [r6, #0x1e]
	cmp r7, r0
	blo _027F12C4
	mvn r0, #0
	sub r0, r0, r7
	add r0, sb, r0
	and r1, r7, #0xff
	bl sub_027EAD24
	b _027F1308
_027F1304:
	strh r1, [r6, #0x92]
_027F1308:
	mov r0, sb
	bl sub_027F20D0
	add sb, sb, r0
	mov r0, sb
	mov r1, #3
	bl sub_027EAD24
	add r0, sb, #1
	mov r1, #1
	bl sub_027EAD24
	ldrh r1, [r6, #0x7a]
	add r0, sb, #2
	and r1, r1, #0xff
	bl sub_027EAD24
	add r0, sb, #3
	sub r1, r0, sl
	strh r1, [r6, #0x94]
	ldrh r2, [r6, #0x94]
	ldr r1, _027F1568 ; =0x04808084
	add r2, r2, #2
	strh r2, [r1]
	mov r1, #5
	bl sub_027EAD24
	add r0, sb, #4
	mov r1, #5
	bl sub_027EAD24
	add r0, sb, #5
	mov r1, #0
	bl sub_027EAD24
	add r0, sb, #6
	ldrh r1, [r6, #0x74]
	and r1, r1, #0xff
	bl sub_027EAD24
	add r0, sb, #7
	mov r1, #0
	bl sub_027EAD24
	add r0, sb, #8
	mov r1, #0
	bl sub_027EAD24
	add r0, sb, #9
	mov r1, #0
	bl sub_027EAD24
	add r0, sb, #0xa
	sub r1, r0, sl
	strh r1, [r6, #0x96]
	ldrh r2, [r6, #0x96]
	mov r1, #0xdd
	and r2, r2, #1
	strh r2, [r6, #0xa2]
	bl sub_027EAD24
	add r0, sb, #0xb
	ldrh r1, [r6, #0xa0]
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_027EAD24
	add r0, sb, #0xc
	mov r1, #0
	bl sub_027EAD24
	add r0, sb, #0xd
	mov r1, #9
	bl sub_027EAD24
	add r0, sb, #0xe
	mov r1, #0xbf
	bl sub_027EAD24
	add r0, sb, #0xf
	mov r1, #0
	bl sub_027EAD24
	ldrh r0, [r6, #0xe]
	cmp r0, #1
	bne _027F1448
	ldrh r1, [r5, #0x20]
	add r0, sb, #0x10
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r1, [r5, #0x20]
	add r0, sb, #0x11
	mov r1, r1, asr #8
	and r1, r1, #0xff
	add sb, sb, #0x12
	bl sub_027EAD24
	b _027F1464
_027F1448:
	add r0, sb, #0x10
	mov r1, #0xff
	bl sub_027EAD24
	add r0, sb, #0x11
	mov r1, #0xff
	add sb, sb, #0x12
	bl sub_027EAD24
_027F1464:
	ldr r1, _027F156C ; =0x0380FFF0
	mov r0, sb
	ldrh r4, [r1]
	and r1, r4, #0xff
	bl sub_027EAD24
	mov r1, r4, lsr #8
	add r0, sb, #1
	and r1, r1, #0xff
	add sb, sb, #2
	bl sub_027EAD24
	ldr r4, [r6, #0x9c]
	mov r5, #0
	b _027F14B8
_027F1498:
	mov r0, r4
	bl sub_027EAD50
	mov r1, r0
	mov r0, sb
	bl sub_027EAD24
	add sb, sb, #1
	add r4, r4, #1
	add r5, r5, #1
_027F14B8:
	ldrh r1, [r6, #0xa0]
	cmp r5, r1
	blo _027F1498
	ldrh r0, [r6, #0xa2]
	cmp r0, #0
	beq _027F1514
	ldr r0, [r6, #0x9c]
	cmp r1, #0
	add r0, r0, r1
	sub r5, r0, #1
	mov r4, #0
	bls _027F1514
	b _027F1508
_027F14EC:
	mov r0, r5
	bl sub_027EAD50
	mov r1, r0
	add r0, r5, #1
	bl sub_027EAD24
	add r4, r4, #1
	sub r5, r5, #1
_027F1508:
	ldrh r0, [r6, #0xa0]
	cmp r4, r0
	blo _027F14EC
_027F1514:
	ldr r0, _027F1560 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _027F1544
	ldr r1, _027F1570 ; =0x0000B6B8
	add r0, sb, #3
	bic r2, r0, #3
	ldr r0, _027F1574 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_027F1544:
	mov r1, #0
	add r0, sb, #0x1c
	strh r1, [r6, #0xa4]
	sub r0, r0, sl
	strh r0, [r8, #0xa]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027F1560: .word 0x0380FFF4
_027F1564: .word _027F74A4
_027F1568: .word 0x04808084
_027F156C: .word 0x0380FFF0
_027F1570: .word 0x0000B6B8
_027F1574: .word 0x00001D46
	arm_func_end sub_027F1204

	arm_func_start sub_027F1578
sub_027F1578: ; 0x027F1578
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _027F1664 ; =0x0380FFF4
	ldr r0, [r0]
	add r4, r0, #0x344
	ldr r1, [r0, #0x4ac]
	ldrh r2, [r4, #0xa0]
	ldrh r0, [r4, #0x96]
	add r1, r1, #0x24
	cmp r2, #0
	add r5, r1, r0
	beq _027F15E8
	ldrh r0, [r4, #0xa2]
	ldr r1, [r4, #0x9c]
	tst r0, #1
	add r0, r5, #0xa
	beq _027F15E0
	sub r0, r0, #1
	add r2, r2, #2
	bl sub_027EAC7C
	ldr r1, _027F1668 ; =0x0380FFF0
	add r0, r5, #9
	ldrh r1, [r1]
	mov r1, r1, asr #8
	and r1, r1, #0xff
	bl sub_027EAD24
	b _027F15E8
_027F15E0:
	add r2, r2, #1
	bl sub_027EAC7C
_027F15E8:
	ldr r0, _027F1664 ; =0x0380FFF4
	ldrh r2, [r4, #0x96]
	ldr r0, [r0]
	ldrh r1, [r4, #0xa0]
	add r2, r2, #0x26
	ldr r0, [r0, #0x4ac]
	add r1, r2, r1
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #0xa0]
	add r0, r5, #1
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_027EAD24
	ldr r0, _027F1664 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _027F1654
	ldrh r0, [r4, #0xa0]
	add r1, r5, #0xd
	add r0, r1, r0
	ldr r1, _027F166C ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _027F1670 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_027F1654:
	mov r0, #0
	strh r0, [r4, #0xa4]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F1664: .word 0x0380FFF4
_027F1668: .word 0x0380FFF0
_027F166C: .word 0x0000B6B8
_027F1670: .word 0x00001D46
	arm_func_end sub_027F1578

	arm_func_start sub_027F1674
sub_027F1674: ; 0x027F1674
	ldr r0, _027F16A0 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x500
	add r0, r0, #0x100
	ldrh r1, [r1, #0x38]
	ldrh r2, [r0, #0xa8]
	rsb r0, r1, #0x18
	cmp r2, r0
	movlt r0, #1
	movge r0, #0
	bx lr
	.align 2, 0
_027F16A0: .word 0x0380FFF4
	arm_func_end sub_027F1674

	arm_func_start sub_027F16A4
sub_027F16A4: ; 0x027F16A4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _027F1718 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x36
	bl sub_037F886C
	movs r4, r0
	bne _027F16DC
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F1710
_027F16DC:
	ldr r0, _027F171C ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_027F1FA8
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xa0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_027F1710:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F1718: .word 0x0380FFF4
_027F171C: .word 0x0000FFFF
	arm_func_end sub_027F16A4

	arm_func_start sub_027F1720
sub_027F1720: ; 0x027F1720
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _027F17C0 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x5e
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_037F886C
	movs r4, r0
	bne _027F1758
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F17B8
_027F1758:
	ldr r0, _027F17C4 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_027F1FA8
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r1, [r5, #0x70]
	strh r1, [r4, #0x3e]
	bl sub_027F205C
	mov r5, r0
	add r0, r4, #0x40
	add r0, r0, r5
	bl sub_027F20D0
	add r0, r5, r0
	add r0, r0, #4
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_027F17B8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F17C0: .word 0x0380FFF4
_027F17C4: .word 0x0000FFFF
	arm_func_end sub_027F1720

	arm_func_start sub_027F17C8
sub_027F17C8: ; 0x027F17C8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _027F1874 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x64
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_037F886C
	movs r4, r0
	bne _027F1800
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F186C
_027F1800:
	ldr r0, _027F1878 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_027F1FA8
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r2, [r5, #0x70]
	add r1, r5, #0x82
	strh r2, [r4, #0x3e]
	bl sub_027EA0E0
	add r0, r4, #0x46
	bl sub_027F205C
	mov r5, r0
	add r0, r4, #0x46
	add r0, r0, r5
	bl sub_027F20D0
	add r0, r5, r0
	add r0, r0, #0xa
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x20
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_027F186C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F1874: .word 0x0380FFF4
_027F1878: .word 0x0000FFFF
	arm_func_end sub_027F17C8

	arm_func_start sub_027F187C
sub_027F187C: ; 0x027F187C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _027F19E8 ; =0x0380FFF4
	mov r7, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r6, r2
	bl sub_037F886C
	movs r4, r0
	bne _027F18B8
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F19E0
_027F18B8:
	ldr r0, _027F19EC ; =0x0000FFFF
	cmp r7, #0
	strh r0, [r4, #0xc]
	bne _027F18DC
	mov r0, r8
	bl sub_027EBEB0
	movs r5, r0
	moveq r7, #0x13
	b _027F18E0
_027F18DC:
	mov r5, #0
_027F18E0:
	mov r0, r8
	bl sub_027EC040
	mov r1, r0
	add r0, r4, #0x10
	bl sub_027F1FA8
	ldr r0, _027F19E8 ; =0x0380FFF4
	cmp r5, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xc0]
	strh r0, [r4, #0x3c]
	strh r7, [r4, #0x3e]
	strh r5, [r4, #0x40]
	ldrneh r0, [r4, #0x40]
	orrne r0, r0, #0xc000
	strneh r0, [r4, #0x40]
	add r0, r4, #0x42
	bl sub_027F20D0
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x10
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r6, #0
	add r8, r1, r0
	beq _027F19C4
	add r0, r6, #1
	bl sub_027EAD50
	mov sb, r0
	mov r0, r6
	bl sub_027EAD50
	mov r1, r0
	mov r0, r8
	bl sub_027EAD24
	add r0, r8, #1
	and r1, sb, #0xff
	add r8, r8, #2
	bl sub_027EAD24
	cmp sb, #0
	mov r7, #0
	bls _027F19DC
	add r5, r6, #2
	b _027F19B8
_027F199C:
	add r0, r5, r7
	bl sub_027EAD50
	mov r1, r0
	mov r0, r8
	bl sub_027EAD24
	add r7, r7, #1
	add r8, r8, #1
_027F19B8:
	cmp r7, sb
	blo _027F199C
	b _027F19DC
_027F19C4:
	mov r0, r8
	mov r1, #0
	bl sub_027EAD24
	add r0, r8, #1
	mov r1, #0
	bl sub_027EAD24
_027F19DC:
	add r0, r4, #0x10
_027F19E0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027F19E8: .word 0x0380FFF4
_027F19EC: .word 0x0000FFFF
	arm_func_end sub_027F187C

	arm_func_start sub_027F19F0
sub_027F19F0: ; 0x027F19F0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _027F1B48 ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r5, r2
	bl sub_037F886C
	movs r4, r0
	bne _027F1A2C
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F1B40
_027F1A2C:
	ldr r0, _027F1B4C ; =0x0000FFFF
	cmp r6, #0
	strh r0, [r4, #0xc]
	bne _027F1A50
	mov r0, r8
	bl sub_027EBEB0
	movs r7, r0
	moveq r6, #0x13
	b _027F1A54
_027F1A50:
	mov r7, #0
_027F1A54:
	mov r0, r8
	bl sub_027EC040
	mov r1, r0
	add r0, r4, #0x10
	bl sub_027F1FA8
	ldr r0, _027F1B48 ; =0x0380FFF4
	orr r2, r7, #0xc000
	ldr r1, [r0]
	add r0, r4, #0x42
	add r1, r1, #0x300
	ldrh r1, [r1, #0xc0]
	strh r1, [r4, #0x3c]
	strh r6, [r4, #0x3e]
	strh r2, [r4, #0x40]
	bl sub_027F20D0
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x30
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r5, #0
	add r7, r1, r0
	beq _027F1B24
	add r0, r5, #1
	bl sub_027EAD50
	mov r8, r0
	mov r0, r5
	bl sub_027EAD50
	mov r1, r0
	mov r0, r7
	bl sub_027EAD24
	add r0, r7, #1
	and r1, r8, #0xff
	bl sub_027EAD24
	add r7, r7, #2
	mov r6, #0
	add r5, r5, #2
	b _027F1B18
_027F1AFC:
	add r0, r5, r6
	bl sub_027EAD50
	mov r1, r0
	mov r0, r7
	bl sub_027EAD24
	add r7, r7, #1
	add r6, r6, #1
_027F1B18:
	cmp r6, r8
	blo _027F1AFC
	b _027F1B3C
_027F1B24:
	mov r0, r7
	mov r1, #0
	bl sub_027EAD24
	add r0, r7, #1
	mov r1, #0
	bl sub_027EAD24
_027F1B3C:
	add r0, r4, #0x10
_027F1B40:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027F1B48: .word 0x0380FFF4
_027F1B4C: .word 0x0000FFFF
	arm_func_end sub_027F19F0

	arm_func_start sub_027F1B50
sub_027F1B50: ; 0x027F1B50
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F1BD4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x5a
	add r0, r0, #0x188
	bl sub_037F886C
	movs r5, r0
	bne _027F1B84
	mov r0, #2
	bl sub_027EB06C
	mov r0, r5
	b _027F1BCC
_027F1B84:
	ldr r2, _027F1BD8 ; =0x0000FFFF
	mov r1, r4
	add r0, r5, #0x10
	strh r2, [r5, #0xc]
	bl sub_027F1FA8
	add r0, r5, #0x3c
	bl sub_027F205C
	mov r4, r0
	add r0, r5, #0x3c
	add r0, r0, r4
	bl sub_027F20D0
	add r0, r4, r0
	strh r0, [r5, #0x16]
	add r0, r0, #0x1c
	strh r0, [r5, #0x22]
	mov r0, #0x40
	strh r0, [r5, #0x24]
	add r0, r5, #0x10
_027F1BCC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F1BD4: .word 0x0380FFF4
_027F1BD8: .word 0x0000FFFF
	arm_func_end sub_027F1B50

	arm_func_start sub_027F1BDC
sub_027F1BDC: ; 0x027F1BDC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _027F1DF0 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	bl sub_027F1674
	cmp r0, #0
	moveq r0, #0
	beq _027F1DE8
	ldr r1, _027F1DF0 ; =0x0380FFF4
	ldrh r0, [r4, #0xa0]
	ldr r2, [r1]
	add r1, r0, #0x78
	add r0, r2, #0x188
	bl sub_037F886C
	movs r6, r0
	bne _027F1C30
	mov r0, #2
	bl sub_027EB06C
	mov r0, r6
	b _027F1DE8
_027F1C30:
	ldr r0, _027F1DF4 ; =0x0000FFFF
	mov r1, r5
	strh r0, [r6, #0xc]
	add r0, r6, #0x10
	bl sub_027F1FA8
	ldrh r1, [r4, #0x6e]
	add r0, r6, #0x48
	strh r1, [r6, #0x44]
	ldrh r1, [r4, #0x7c]
	strh r1, [r6, #0x46]
	bl sub_027F205C
	mov r4, r0
	add r0, r6, #0x48
	add r0, r0, r4
	bl sub_027F20D0
	add r7, r4, r0
	add r0, r6, #0x48
	add r4, r0, r7
	mov r0, r4
	mov r1, #3
	bl sub_027EAD24
	add r0, r4, #1
	mov r1, #1
	bl sub_027EAD24
	ldr r1, _027F1DF0 ; =0x0380FFF4
	add r0, r4, #2
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xbe]
	and r1, r1, #0xff
	bl sub_027EAD24
	ldr r0, _027F1DF0 ; =0x0380FFF4
	add r7, r7, #3
	ldr r1, [r0]
	add r0, r6, #0x48
	add r5, r0, r7
	add r4, r1, #0x344
	add r8, r1, #0x31c
	mov r0, r5
	mov r1, #0xdd
	mov sl, #0
	bl sub_027EAD24
	ldr r1, _027F1DF0 ; =0x0380FFF4
	add r0, r5, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xe4]
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_027EAD24
	add r0, r5, #2
	mov r1, sl
	bl sub_027EAD24
	add r0, r5, #3
	mov r1, #9
	bl sub_027EAD24
	add r0, r5, #4
	mov r1, #0xbf
	bl sub_027EAD24
	add r0, r5, #5
	mov r1, sl
	bl sub_027EAD24
	ldrh r1, [r8, #0x20]
	add r0, r5, #6
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r1, [r8, #0x20]
	add r0, r5, #7
	mov r1, r1, asr #8
	and r1, r1, #0xff
	bl sub_027EAD24
	ldr r1, _027F1DF8 ; =0x0380FFF0
	add r0, r5, #8
	ldrh r8, [r1]
	and r1, r8, #0xff
	bl sub_027EAD24
	mov r1, r8, lsr #8
	add r0, r5, #9
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r0, [r4, #0xa0]
	add sl, sl, #0xa
	cmp r0, #0
	beq _027F1DC4
	ldrh r0, [r4, #0xa2]
	ldr r8, [r4, #0x9c]
	tst r0, #1
	addne r8, r8, #1
	mov sb, #0
	b _027F1DB8
_027F1D98:
	mov r0, r8
	bl sub_027EAD50
	mov r1, r0
	add r0, r5, sl
	bl sub_027EAD24
	add sl, sl, #1
	add r8, r8, #1
	add sb, sb, #1
_027F1DB8:
	ldrh r0, [r4, #0xa0]
	cmp sb, r0
	blo _027F1D98
_027F1DC4:
	add r0, r7, sl
	add r0, r0, #0xc
	strh r0, [r6, #0x16]
	ldrh r1, [r6, #0x16]
	mov r0, #0x50
	add r1, r1, #0x1c
	strh r1, [r6, #0x22]
	strh r0, [r6, #0x24]
	add r0, r6, #0x10
_027F1DE8:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027F1DF0: .word 0x0380FFF4
_027F1DF4: .word 0x0000FFFF
_027F1DF8: .word 0x0380FFF0
	arm_func_end sub_027F1BDC

	arm_func_start sub_027F1DFC
sub_027F1DFC: ; 0x027F1DFC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _027F1E20
	bl sub_027F1674
	cmp r0, #0
	moveq r0, #0
	beq _027F1EAC
_027F1E20:
	ldr r0, _027F1EB4 ; =0x0380FFF4
	add r1, r5, #0x3d
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F886C
	movs r4, r0
	bne _027F1E4C
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F1EAC
_027F1E4C:
	ldr r2, _027F1EB8 ; =0x0000FFFF
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xc]
	bl sub_027F1FA8
	cmp r5, #0
	beq _027F1E8C
	add r0, r4, #0x42
	mov r1, #0x10
	bl sub_027EAD24
	add r0, r4, #0x43
	and r1, r5, #0xff
	bl sub_027EAD24
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
_027F1E8C:
	add r0, r5, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0xb0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_027F1EAC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F1EB4: .word 0x0380FFF4
_027F1EB8: .word 0x0000FFFF
	arm_func_end sub_027F1DFC

	arm_func_start sub_027F1EBC
sub_027F1EBC: ; 0x027F1EBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _027F1EE0
	bl sub_027F1674
	cmp r0, #0
	moveq r0, #0
	beq _027F1F40
_027F1EE0:
	ldr r0, _027F1F48 ; =0x0380FFF4
	mov r1, #0x36
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F886C
	movs r4, r0
	bne _027F1F0C
	mov r0, #2
	bl sub_027EB06C
	mov r0, r4
	b _027F1F40
_027F1F0C:
	ldr r0, _027F1F4C ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_027F1FA8
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xc0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_027F1F40:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F1F48: .word 0x0380FFF4
_027F1F4C: .word 0x0000FFFF
	arm_func_end sub_027F1EBC

	arm_func_start sub_027F1F50
sub_027F1F50: ; 0x027F1F50
	stmdb sp!, {r3, lr}
	ldr ip, _027F1FA4 ; =0x0380FFF4
	mov r2, #0
	ldr r3, [ip]
	mov r1, #0x14
	ldr r3, [r3, #0x45c]
	orr r0, r0, #0xc000
	strh r2, [r3]
	strh r2, [r3, #2]
	strh r2, [r3, #4]
	strh r1, [r3, #0xa]
	mov r1, #0xa4
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	ldr r2, [ip]
	add r0, r3, #0x10
	add r1, r2, #0x3a8
	add r2, r2, #0x324
	bl sub_027EA0FC
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027F1FA4: .word 0x0380FFF4
	arm_func_end sub_027F1F50

	arm_func_start sub_027F1FA8
sub_027F1FA8: ; 0x027F1FA8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDF74
	bl sub_027EA578
	strh r0, [r5, #0x10]
	ldr r0, _027F1FF0 ; =0x0380FFF4
	mov r1, r4
	ldr r3, [r0]
	add r0, r5, #0x18
	add r2, r3, #0x324
	add r3, r3, #0x3a8
	bl sub_027EA130
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F1FF0: .word 0x0380FFF4
	arm_func_end sub_027F1FA8

	arm_func_start sub_027F1FF4
sub_027F1FF4: ; 0x027F1FF4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _027F2058 ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	ldr r5, [r0, #0x1a0]
	mvn r4, #0
	b _027F2044
_027F2014:
	ldrh r0, [r5, #0x24]
	cmp r0, r6
	bne _027F2038
	mov r1, r7
	add r0, r5, #0x28
	bl sub_027EA474
	cmp r0, #0
	movne r0, #1
	bne _027F2050
_027F2038:
	mov r0, r5
	bl sub_037F8A80
	mov r5, r0
_027F2044:
	cmp r5, r4
	bne _027F2014
	mov r0, #0
_027F2050:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F2058: .word 0x0380FFF4
	arm_func_end sub_027F1FF4

	arm_func_start sub_027F205C
sub_027F205C: ; 0x027F205C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _027F20CC ; =0x0380FFF4
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	add r4, r1, #0x344
	ldrh r6, [r4, #0x1e]
	mov r1, r5
	bl sub_027EAD24
	add r0, r8, #1
	and r1, r6, #0xff
	bl sub_027EAD24
	add r5, r5, #2
	mov r7, #0
	add r4, r4, #0x20
	b _027F20B8
_027F209C:
	add r0, r4, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, r8, r5
	bl sub_027EAD24
	add r5, r5, #1
	add r7, r7, #1
_027F20B8:
	cmp r7, r6
	blo _027F209C
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027F20CC: .word 0x0380FFF4
	arm_func_end sub_027F205C

	arm_func_start sub_027F20D0
sub_027F20D0: ; 0x027F20D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _027F216C ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r2]
	mov sb, r0
	add r6, r2, #0x344
	mov r7, #0
	bl sub_027EAD24
	ldr r4, _027F2170 ; =_027F74C4
	add r7, r7, #2
	mov r8, #0
	mov r5, #1
_027F2100:
	ldrh r0, [r6, #0x62]
	tst r0, r5, lsl r8
	beq _027F2144
	ldrh r0, [r6, #0x60]
	tst r0, r5, lsl r8
	mov r0, r8, lsl #1
	ldrh r1, [r4, r0]
	beq _027F2134
	orr r1, r1, #0x80
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_027EAD24
	b _027F2140
_027F2134:
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_027EAD24
_027F2140:
	add r7, r7, #1
_027F2144:
	add r8, r8, #1
	cmp r8, #0x10
	blo _027F2100
	sub r1, r7, #2
	add r0, sb, #1
	and r1, r1, #0xff
	bl sub_027EAD24
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027F216C: .word 0x0380FFF4
_027F2170: .word _027F74C4
	arm_func_end sub_027F20D0

	arm_func_start sub_027F2174
sub_027F2174: ; 0x027F2174
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _027F2440 ; =0x0380FFF4
	mvn r0, #0
	ldr r4, [r1]
	add r7, r4, #0x17c
	ldr r5, [r7, #0x48]
	add r6, r4, #0x344
	cmp r5, r0
	beq _027F2438
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	beq _027F21B4
	mov r1, r5
	add r0, r7, #0x48
	bl sub_037F8908
	b _027F2438
_027F21B4:
	ldrh r0, [r5, #0x24]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _027F21CC
	ldrh r0, [r5, #0x34]
	b _027F21D0
_027F21CC:
	ldrh r0, [r5, #0x28]
_027F21D0:
	tst r0, #1
	ldrne r0, [r4, #0x568]
	mov sb, #1
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r5, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r2, [r6, #0xc]
	cmp r2, #1
	beq _027F2230
	cmp r2, #2
	cmpne r2, #3
	beq _027F230C
	b _027F23AC
_027F2230:
	ldrh r0, [r5, #0x24]
	tst r0, #1
	bne _027F23AC
	add r0, r5, #0x2e
	bl sub_027EB900
	mov r8, r0
	cmp r8, #0xff
	beq _027F225C
	bl sub_027EBFE0
	cmp r0, #0x40
	beq _027F22C0
_027F225C:
	mov r0, r8
	bl sub_027EBFE0
	cmp r0, #0x30
	add r0, r5, #0x2e
	bne _027F2290
	mov r1, #0xa0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F23AC
	add r0, r5, #0x2e
	mov r1, #7
	bl sub_027F16A4
	b _027F22B0
_027F2290:
	mov r1, #0xc0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F23AC
	add r0, r5, #0x2e
	mov r1, #7
	mov r2, #1
	bl sub_027F1EBC
_027F22B0:
	cmp r0, #0
	beq _027F23AC
	bl sub_027F107C
	b _027F23AC
_027F22C0:
	ldrh r1, [r5, #0x24]
	mov r0, r8, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_027EBD4C
	mov r0, r8
	bl sub_027EC080
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _027F23AC
	add r0, r5, #0x28
	add r1, r5, #0x34
	bl sub_027EA0E0
	mov sb, #0
	b _027F23AC
_027F230C:
	ldrh r1, [r5, #0x24]
	tst r1, #1
	bne _027F23AC
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _027F2378
	tst r1, #0x2000
	bne _027F2378
	ldrh r0, [r5, #0x28]
	tst r0, #1
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #1
	strneh r0, [r6, #0x8e]
	bne _027F2354
	cmp r2, #3
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #2
	strneh r0, [r6, #0x8e]
_027F2354:
	ldrh r0, [r6, #0x8e]
	cmp r0, #0
	ldreqh r0, [r7, #0x20]
	cmpeq r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	bne _027F2378
	mov r0, #1
	bl sub_027E9CB4
_027F2378:
	ldrh r8, [r6, #0x88]
	mov r0, r8
	bl sub_027EC080
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _027F23AC
	add r0, r5, #0x2e
	add r1, r5, #0x34
	bl sub_027EA0E0
	mov sb, #0
_027F23AC:
	cmp sb, #0
	bne _027F2414
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r5, #0x12]
	ldrh r1, [r5, #0x22]
	and r1, r1, #0xff
	bl sub_027EBD2C
	ldrh r1, [r5, #0x3a]
	mov r0, r8
	bl sub_027EBE4C
	mov r0, r8
	bl sub_027EBE8C
	ldrh r1, [r5, #0x20]
	mov r0, #0x180
	sub r1, r1, #0x18
	strh r1, [r5, #0x16]
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #0x16]
	mov r1, r5
	add r0, r0, #0x2d
	mov r2, r0, lsr #1
	add r0, r7, #0x48
	strh r2, [r5, #0xe]
	bl sub_037F8D58
	b _027F2420
_027F2414:
	mov r1, r5
	add r0, r7, #0x48
	bl sub_037F8908
_027F2420:
	ldrh r0, [r7, #0x50]
	cmp r0, #0
	beq _027F2438
	mov r0, #2
	mov r1, #6
	bl sub_037F8598
_027F2438:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_027F2440: .word 0x0380FFF4
	arm_func_end sub_027F2174

	arm_func_start sub_027F2444
sub_027F2444: ; 0x027F2444
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _027F25B0 ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	ldrh r1, [r4, #8]
	add r0, r0, #0xdc
	cmp r1, #0x40
	add r5, r0, #0x400
	movne r0, #1
	bne _027F25A8
	add r0, r6, #0x1e
	add r1, r4, #0x64
	bl sub_027EA474
	cmp r0, #0
	beq _027F2498
	add r0, r6, #0x24
	add r1, r4, #0x82
	bl sub_027EA474
	cmp r0, #0
	bne _027F24A0
_027F2498:
	mov r0, #1
	b _027F25A8
_027F24A0:
	ldrh r0, [r4, #0x6a]
	mov r1, #1
	mov r0, r1, lsl r0
	ldrh r1, [r6, #0x2e]
	mov r0, r0, lsl #0x10
	tst r1, r0, lsr #16
	moveq r0, #0
	movne r0, #0x2000
	strh r0, [r5, #6]
	ldr r0, _027F25B4 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	beq _027F24F8
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x10
	add r0, r0, #0x4800000
	add r0, r0, #0x4000
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldrneh r0, [r5, #6]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #6]
_027F24F8:
	ldrh r0, [r4, #0x88]
	bl sub_027EBE8C
	ldrh r1, [r6, #0x10]
	ldr r0, _027F25B8 ; =0x00000182
	sub r1, r1, #0x1c
	strh r1, [r6, #6]
	sub r1, r6, #0x10
	strh r0, [r1, #0xc]
	ldrh r2, [r6, #6]
	mov r0, #0
	add r2, r2, #0x31
	mov r2, r2, lsr #1
	strh r2, [r1, #0xe]
	ldrh r2, [r1, #0x3e]
	b _027F2544
_027F2534:
	tst r2, #1
	mov r2, r2, lsl #0xf
	addne r0, r0, #1
	mov r2, r2, lsr #0x10
_027F2544:
	cmp r2, #0
	bne _027F2534
	ldr r2, _027F25BC ; =0x04808094
	ldrh r3, [r5, #6]
	ldrh r4, [r2]
	ldrh r2, [r2, #4]
	ldrh r5, [r1, #0x18]
	and r2, r2, #0x8000
	and r4, r4, #0x8000
	orr r2, r3, r2, asr #4
	orr r2, r2, r4, asr #3
	orr r2, r5, r2
	strh r2, [r1, #0x18]
	ldrh r2, [r1, #0x3c]
	ldrh r3, [r1, #0x1c]
	add r2, r2, #0xa
	mul r2, r0, r2
	add r0, r2, #0xfc
	add r2, r3, r0, lsr #4
	ldr r0, _027F25B0 ; =0x0380FFF4
	strh r2, [r1, #0x1a]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #0
_027F25A8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F25B0: .word 0x0380FFF4
_027F25B4: .word 0x04808098
_027F25B8: .word 0x00000182
_027F25BC: .word 0x04808094
	arm_func_end sub_027F2444

	arm_func_start sub_027F25C0
sub_027F25C0: ; 0x027F25C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027F2768 ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	add r0, r1, #0x2c
	add r5, r0, #0x400
	ldrh r0, [r5, #0x3c]
	ldr r4, [r5, #0x90]
	cmp r0, #0
	beq _027F2760
	add r0, r7, #0x18
	add r1, r1, #0x3a8
	bl sub_027EA474
	cmp r0, #0
	beq _027F2760
	ldrh r1, [r7, #0x10]
	ldrh r0, [r4, #0x16]
	sub r1, r1, #0x18
	sub r0, r0, #8
	cmp r1, r0
	bgt _027F2760
	add r0, r7, #0x1e
	bl sub_027EB900
	mov r6, r0
	cmp r6, #0xff
	beq _027F263C
	cmp r6, #0
	beq _027F2678
	bl sub_027EBFE0
	cmp r0, #0x40
	beq _027F2678
_027F263C:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F2760
	add r0, r7, #0x1e
	mov r1, #7
	mov r2, #0
	bl sub_027F1EBC
	cmp r0, #0
	beq _027F2760
	mov r1, #2
	strh r1, [r0]
	bl sub_027F107C
	b _027F2760
_027F2678:
	cmp r6, #0
	beq _027F2760
	ldrh r1, [r7, #0x14]
	mov r0, r6, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_027EBD4C
	mov r0, r6
	bl sub_027EBE8C
	mov r0, r6
	bl sub_027EC0CC
	mov r1, #1
	mov r0, r1, lsl r0
	mov r0, r0, lsl #0x10
	ldrh r1, [r5, #0x9a]
	mov r2, r0, lsr #0x10
	tst r2, r1
	bne _027F2760
	ldrh r0, [r5, #0x98]
	tst r2, r0
	beq _027F2760
	orr r0, r1, r2
	strh r0, [r5, #0x9a]
	ldrh r1, [r4, #0x10]
	mvn r0, r2
	and r1, r1, r0
	mov r0, r2, lsl #0xf
	strh r1, [r4, #0x10]
	add r6, r4, #0x1a
	mov r1, r0, lsr #0x10
	b _027F2710
_027F26F8:
	ldrh r0, [r5, #0x98]
	tst r1, r0
	ldrneh r0, [r4, #0x16]
	addne r6, r6, r0
	mov r0, r1, lsl #0xf
	mov r1, r0, lsr #0x10
_027F2710:
	cmp r1, #1
	bne _027F26F8
	ldrh r1, [r7, #0x10]
	add r0, r6, #3
	sub r1, r1, #0x18
	strh r1, [r6]
	ldrh r1, [r7, #0x12]
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r1, [r7, #0xe]
	add r0, r6, #2
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r2, [r6]
	cmp r2, #0
	beq _027F2760
	add r0, r7, #0x2c
	add r1, r6, #8
	add r2, r2, #1
	bl sub_037FDF9C
_027F2760:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F2768: .word 0x0380FFF4
	arm_func_end sub_027F25C0

	arm_func_start sub_027F276C
sub_027F276C: ; 0x027F276C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F2834 ; =0x0380FFF4
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x300
	ldrh r0, [r0, #0x4c]
	add r5, r1, #0x344
	cmp r0, #0x40
	movne r0, #1
	bne _027F282C
	add r0, r4, #0x1e
	add r1, r5, #0x64
	bl sub_027EA474
	cmp r0, #0
	beq _027F27BC
	add r0, r4, #0x24
	add r1, r5, #0x82
	bl sub_027EA474
	cmp r0, #0
	bne _027F27C4
_027F27BC:
	mov r0, #1
	b _027F282C
_027F27C4:
	ldrh r1, [r4, #0x10]
	ldr r0, _027F2838 ; =0x00000185
	sub r1, r1, #0x1c
	strh r1, [r4, #6]
	sub r1, r4, #0x10
	strh r0, [r1, #0xc]
	mov r0, #0x18
	strh r0, [r1, #0xe]
	ldr r4, _027F2834 ; =0x0380FFF4
	ldr r2, _027F283C ; =0x04808094
	ldr r0, [r4]
	ldrh ip, [r2]
	add r0, r0, #0x400
	ldrh r2, [r2, #4]
	ldrh r3, [r0, #0xe2]
	and r0, r2, #0x8000
	ldrh lr, [r1, #0x18]
	and r2, ip, #0x8000
	orr r0, r3, r0, asr #4
	orr r0, r0, r2, asr #3
	orr r0, lr, r0
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	add r0, r0, #0x188
	bl sub_037F8D58
	mov r0, #0
_027F282C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F2834: .word 0x0380FFF4
_027F2838: .word 0x00000185
_027F283C: .word 0x04808094
	arm_func_end sub_027F276C

	arm_func_start sub_027F2840
sub_027F2840: ; 0x027F2840
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r1, _027F2E68 ; =0x0380FFF4
	mov sl, r0
	ldr r3, [r1]
	add r0, sl, #0x1e
	ldr r2, [r3, #0x570]
	add r1, r3, #4
	add r2, r2, #1
	str r2, [r3, #0x570]
	add r4, r3, #0x344
	add r5, r1, #0x400
	add r6, r3, #0x31c
	add r7, r3, #0x17c
	bl sub_027EB9A8
	mov r8, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [sl, #2]
	cmp r8, #0xff
	beq _027F2E5C
	ldrh r1, [sl, #0x12]
	bl sub_027EBD2C
	ldrh sb, [sl, #6]
	cmp sb, #0xc
	bls _027F2E5C
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDFD0
	add r2, sl, #0x38
	sub r1, sb, #0xc
	mov r0, #2
	str r2, [sp, #0x18]
	strh r1, [sp, #0x20]
	strh r0, [sp, #0x22]
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	ldreqh r0, [sp, #0x22]
	orreq r0, r0, #1
	streqh r0, [sp, #0x22]
	mov r0, #0x38
	strh r0, [sp, #0x24]
	ldrh r1, [sl, #8]
	add r0, sp, #0x18
	strh r1, [sp, #0x1c]
	ldrh r1, [sl, #0x36]
	strh r1, [sp, #0x1e]
	bl sub_027F3C10
	ldr sb, [sp, #0x38]
	cmp sb, #0
	beq _027F293C
	ldrh r0, [sl, #0x16]
	tst r0, #0x8000
	beq _027F293C
	add r0, sb, #6
	bl sub_027EAD50
	mov fp, r0
	add r0, sb, #7
	bl sub_027EAD50
	ldr r1, _027F2E6C ; =0x0480810C
	add r0, fp, r0, lsl #8
	strh r0, [r1]
_027F293C:
	ldrh r1, [r5]
	cmp r1, #0x13
	ldreq r0, [r5, #0x18]
	ldreqh r0, [r0, #0x38]
	cmpeq r0, #1
	bne _027F2974
	ldrh r0, [sp, #0x22]
	and r0, r0, #9
	cmp r0, #9
	bne _027F2E44
	add r1, sp, #0x18
	mov r0, sl
	bl sub_027F31F0
	b _027F2E44
_027F2974:
	ldrh r0, [sp, #0x22]
	tst r0, #8
	beq _027F2E44
	cmp r1, #0x21
	bne _027F2AFC
	bl sub_027EABE0
	ldrh r0, [sp, #0x22]
	and r0, r0, #0x30
	cmp r0, #0x30
	movne r0, #0xc
	strneh r0, [r5, #4]
	movne r0, #0xa
	strneh r0, [r5, #6]
	bne _027F2AD8
	ldrh r0, [sl, #0x34]
	cmp r0, #0x3e8
	movhi r0, #0xc
	strhih r0, [r5, #4]
	movhi r0, #1
	strhih r0, [r5, #6]
	bhi _027F2AD8
	mov r1, #0
	strh r1, [r5, #4]
	ldrh r0, [sp, #0x24]
	tst r0, #2
	beq _027F29F0
	ldrh r0, [sp, #0x22]
	tst r0, #2
	bne _027F29F0
	ldrh r0, [sp, #0x2a]
	bl sub_027E9900
_027F29F0:
	ldrh r1, [sp, #0x2e]
	mov r0, r8
	bl sub_027EBE2C
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _027F2A80
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _027F2A68
	add r0, sb, #6
	bl sub_027EAD50
	mov fp, r0
	add r0, sb, #7
	bl sub_027EAD50
	add r0, fp, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_027E91B0
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_027EAD50
	ldr r1, [sp, #0x40]
	mov sb, r0
	add r0, r1, #9
	bl sub_027EAD50
	add r1, sb, r0, lsl #8
	ldr r0, _027F2E70 ; =0x0380FFF0
	strh r1, [r0]
	b _027F2A80
_027F2A68:
	ldr r0, _027F2E74 ; =0x0000FFFF
	mov r1, #1
	bl sub_027E91B0
	ldr r0, _027F2E70 ; =0x0380FFF0
	mov r1, #0
	strh r1, [r0]
_027F2A80:
	ldr r0, [sp, #0x3c]
	add r0, r0, #3
	bl sub_027EAD50
	bl sub_027E9738
	ldr r0, [sp, #0x3c]
	add r0, r0, #2
	bl sub_027EAD50
	strh r0, [r4, #0x76]
	ldrh r0, [sl, #0x34]
	bl sub_027E96E0
	mov r0, #1
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	ldreq r0, _027F2E78 ; =0x04808048
	moveq r1, #3
	streqh r1, [r0]
	ldr r1, _027F2E7C ; =0x04808038
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
_027F2AD8:
	ldr r0, [r5, #0x1c]
	add r1, sl, #0x1e
	add r0, r0, #8
	bl sub_027EA0E0
	mov r2, #0x25
	mov r0, #2
	mov r1, #1
	strh r2, [r5]
	bl sub_037F8598
_027F2AFC:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq _027F2B14
	cmp r0, #3
	beq _027F2BCC
	b _027F2E2C
_027F2B14:
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _027F2BCC
	add r0, sb, #6
	bl sub_027EAD50
	mov r5, r0
	add r0, sb, #7
	bl sub_027EAD50
	add r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_027E91B0
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_027EAD50
	ldr r1, [sp, #0x40]
	mov r5, r0
	add r0, r1, #9
	bl sub_027EAD50
	ldr r1, _027F2E70 ; =0x0380FFF0
	add r0, r5, r0, lsl #8
	strh r0, [r1]
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	bl sub_027EAD50
	sub r0, r0, #8
	strh r0, [r4, #0xa0]
	ldrh r2, [r4, #0xa0]
	cmp r2, #0
	beq _027F2BCC
	ldr r0, [sp, #0x40]
	ldr r1, [r4, #0x9c]
	tst r0, #1
	beq _027F2BB8
	add r0, r0, #9
	add r2, r2, #2
	bl sub_037FDF9C
	mov r0, #1
	strh r0, [r4, #0xa2]
	b _027F2BCC
_027F2BB8:
	add r0, r0, #0xa
	add r2, r2, #1
	bl sub_037FDF9C
	mov r0, #0
	strh r0, [r4, #0xa2]
_027F2BCC:
	mov r1, #0
	mov r0, r8
	strh r1, [r4, #0x80]
	bl sub_027EBE8C
	add r1, sl, #0x2c
	add r0, sp, #0x10
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldrh r0, [r4, #0x6e]
	mov r5, #0
	mov r8, r0, lsl #0xa
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, r8
	mov r3, r5
	bl sub_03806B80
	adds fp, r0, #1
	umull r3, r0, fp, r8
	adc sb, r1, #0
	mla r0, fp, r5, r0
	mla r0, sb, r8, r0
	add r2, sp, #0x10
	str r0, [sp, #0x14]
	ldr r1, _027F2E80 ; =0x048080F6
	ldrh r0, [r2, #6]
	str r3, [sp, #0x10]
	strh r0, [r1]
	ldrh r0, [r2, #4]
	strh r0, [r1, #-2]
	ldrh r0, [r2, #2]
	strh r0, [r1, #-4]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r1, #-6]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _027F2D34
	ldrh r0, [r4, #0x1a]
	cmp r0, #0
	beq _027F2D34
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r1, r1, r8
	sbc r0, r0, r5
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl EnableIrqFlag
	ldr r1, _027F2E84 ; =0x048080F8
	ldrh ip, [r1]
	ldrh fp, [r1, #2]
	ldrh sb, [r1, #4]
	ldrh r8, [r1, #6]
	ldrh r5, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh ip, [sp, #8]
	strh r5, [sp]
	strh fp, [sp, #0xa]
	strh sb, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r3, [sp, #2]
	strh r2, [sp, #4]
	strh r1, [sp, #6]
	bl SetIrqFlag
	ldrh r1, [sp, #8]
	ldrh r0, [sp]
	cmp r1, r0
	bhs _027F2CF8
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
	b _027F2D0C
_027F2CF8:
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
_027F2D0C:
	sbc r0, r1, r0
	mov r2, r2, lsr #0xa
	orr r2, r2, r0, lsl #22
	ldrh r1, [r6, #0x20]
	ldr r0, _027F2E88 ; =0x04808134
	cmp r2, r1
	sublo r1, r1, r2
	strloh r1, [r0]
	movhs r1, #0
	strhsh r1, [r0]
_027F2D34:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _027F2E2C
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	beq _027F2E2C
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _027F2E2C
	add r0, r1, #2
	bl sub_027EAD50
	ldrh r1, [r4, #0x76]
	cmp r1, r0
	strneh r0, [r4, #0x76]
	mov r1, #0
	strh r1, [r4, #0x8e]
	cmp r0, #0
	bne _027F2D98
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_027EAD50
	tst r0, #1
	ldrneh r0, [r4, #0x8e]
	orrne r0, r0, #1
	strneh r0, [r4, #0x8e]
_027F2D98:
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_027EAD50
	ldr r1, [sp, #0x3c]
	and r8, r0, #0xfe
	add r0, r1, #1
	mov r5, r8, lsl #3
	bl sub_027EAD50
	ldrh r1, [r4, #0x6a]
	add r0, r8, r0
	cmp r1, r8, lsl #3
	sub r0, r0, #3
	blo _027F2E08
	cmp r1, r0, lsl #3
	bhi _027F2E08
	ldr r0, [sp, #0x3c]
	sub r5, r1, r5
	add r0, r0, #5
	add r0, r0, r5, lsr #3
	bl sub_027EAD50
	and r1, r5, #7
	mov r2, #1
	tst r0, r2, lsl r1
	beq _027F2E08
	ldrh r0, [r4, #0x8e]
	orr r0, r0, #2
	strh r0, [r4, #0x8e]
	bl sub_027F1108
_027F2E08:
	ldrh r0, [r7, #0x20]
	cmp r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	ldreqh r0, [r4, #0x8e]
	cmpeq r0, #0
	bne _027F2E2C
	mov r0, #1
	bl sub_027E9CB4
_027F2E2C:
	ldrh r0, [r6, #0x1e]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _027F2E44
	mov r0, sl
	bl sub_027EDF94
_027F2E44:
	ldr r2, [sp, #0x34]
	cmp r2, #0
	beq _027F2E5C
	ldrh r0, [sp, #0x2a]
	mov r1, sl
	bl sub_027F4B7C
_027F2E5C:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F2E68: .word 0x0380FFF4
_027F2E6C: .word 0x0480810C
_027F2E70: .word 0x0380FFF0
_027F2E74: .word 0x0000FFFF
_027F2E78: .word 0x04808048
_027F2E7C: .word 0x04808038
_027F2E80: .word 0x048080F6
_027F2E84: .word 0x048080F8
_027F2E88: .word 0x04808134
	arm_func_end sub_027F2840

	arm_func_start sub_027F2E8C
sub_027F2E8C: ; 0x027F2E8C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F2F68 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _027F2EC0
	cmp r0, #2
	cmpne r0, #3
	beq _027F2F28
	b _027F2F60
_027F2EC0:
	mov r0, r5
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027F2EF8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_027EBC44
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_027EDE44
	mov r0, r5
	bl sub_027F0D60
	b _027F2F60
_027F2EF8:
	cmp r0, #0x30
	add r0, r4, #0x1e
	mov r1, #7
	bne _027F2F10
	bl sub_027F16A4
	b _027F2F18
_027F2F10:
	mov r2, #1
	bl sub_027F1EBC
_027F2F18:
	cmp r0, #0
	beq _027F2F60
	bl sub_027F107C
	b _027F2F60
_027F2F28:
	ldrh r0, [r1, #8]
	cmp r0, #0x40
	bne _027F2F60
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_027EA474
	cmp r0, #0
	beq _027F2F60
	mov r0, #0x30
	bl sub_037F9238
	bl sub_027EA03C
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_027EDE44
_027F2F60:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F2F68: .word 0x0380FFF4
	arm_func_end sub_027F2E8C

	arm_func_start sub_027F2F6C
sub_027F2F6C: ; 0x027F2F6C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	ldr r1, _027F3134 ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r1]
	ldrh r5, [r7, #6]
	add r4, r0, #0x31c
	cmp r5, #4
	bls _027F3128
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _027F3128
	add r0, r7, #0x1e
	mov r1, #0x10
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F3128
	ldrh r6, [r7, #2]
	cmp r6, #0
	beq _027F2FD0
	mov r0, r6
	bl sub_027EBFE0
	cmp r0, #0x30
	bhs _027F3004
_027F2FD0:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F3128
	add r0, r7, #0x1e
	mov r1, #6
	mov r2, #1
	bl sub_027F1EBC
	cmp r0, #0
	beq _027F3128
	bl sub_027F107C
	b _027F3128
_027F3004:
	mov r0, r6
	bl sub_027EBFE0
	cmp r0, #0x40
	mov r0, r6
	bne _027F3030
	mov r1, #0x30
	bl sub_027EBC44
	add r0, r7, #0x1e
	mov r1, #1
	bl sub_027EDE44
	b _027F303C
_027F3030:
	bl sub_027EC0CC
	cmp r0, #0
	bne _027F3128
_027F303C:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDFD0
	add r2, r7, #0x30
	sub r1, r5, #4
	str r2, [sp]
	strh r1, [sp, #8]
	add r0, sp, #0
	bl sub_027F3C10
	ldrh r1, [r7, #0x2c]
	ldr r0, _027F3138 ; =0x0000FFC2
	tst r1, r0
	bne _027F30D4
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _027F30D4
	ldrh r2, [r4, #0x18]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _027F30D4
	cmp r2, #0
	beq _027F30B0
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _027F30D4
_027F30B0:
	ldrh r0, [r4, #0x1e]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	bne _027F30DC
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _027F30DC
_027F30D4:
	mov r1, #0xa
	b _027F3110
_027F30DC:
	mov r0, r6
	bl sub_027EBE0C
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _027F3110
	tst r0, #4
	moveq r1, #0x12
	beq _027F3110
	ldrh r1, [sp, #0x16]
	mov r0, r6
	bl sub_027EBE2C
	mov r1, #0
_027F3110:
	ldr r2, [sp, #0x1c]
	mov r0, r6
	bl sub_027F187C
	cmp r0, #0
	beq _027F3128
	bl sub_027F107C
_027F3128:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F3134: .word 0x0380FFF4
_027F3138: .word 0x0000FFC2
	arm_func_end sub_027F2F6C

	arm_func_start sub_027F313C
sub_027F313C: ; 0x027F313C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, r4, #0x1e
	mov r1, #0x50
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F31E0
	ldrh r0, [r4, #0x24]
	tst r0, #1
	bne _027F3174
	ldrh r0, [r4, #8]
	tst r0, #0x8000
	beq _027F31E0
_027F3174:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDFD0
	add r0, r4, #0x2c
	str r0, [sp]
	ldrh r1, [r4, #6]
	ldr r0, _027F31EC ; =0x0380FFF4
	strh r1, [sp, #8]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	moveq r0, #0x800
	streqh r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_027F3C10
	ldrh r0, [sp, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _027F31E0
	add r0, r4, #0x1e
	bl sub_027F1BDC
	cmp r0, #0
	beq _027F31E0
	bl sub_027F107C
_027F31E0:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_027F31EC: .word 0x0380FFF4
	arm_func_end sub_027F313C

	arm_func_start sub_027F31F0
sub_027F31F0: ; 0x027F31F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r2, _027F35B8 ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov sl, r1
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x13
	add r4, r0, #0x400
	bne _027F35AC
	ldr r0, [r4, #0x18]
	ldr r5, [r4, #0x1c]
	add r8, r0, #0x4e
	mov r6, #0
	b _027F3260
_027F3234:
	mov r0, r8
	add r1, r7, #0x24
	bl sub_027EA474
	cmp r0, #0
	ldrneh r1, [r5, #6]
	movne r0, #1
	orrne r0, r1, r0, lsl r6
	strneh r0, [r5, #6]
	bne _027F35AC
	add r8, r8, #6
	add r6, r6, #1
_027F3260:
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #0x4c]
	cmp r6, r0
	blo _027F3234
	add r6, r5, #0xa
	mov r8, #0
	b _027F329C
_027F327C:
	add r0, r7, #0x24
	add r1, r6, #4
	bl sub_027EA474
	cmp r0, #0
	bne _027F35AC
	ldrh r0, [r6]
	add r8, r8, #1
	add r6, r6, r0, lsl #1
_027F329C:
	ldrh r0, [r5, #8]
	cmp r8, r0
	blo _027F327C
	mov r1, r6
	mov r0, #0
	mov r2, #0x40
	bl sub_037FDF74
	ldrh r8, [r7, #6]
	cmp r8, #0xc
	bls _027F35AC
	cmp sl, #0
	bne _027F3318
	add r1, sp, #4
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDFD0
	add r3, r7, #0x38
	sub r2, r8, #0xc
	mov r0, #0x38
	strh r0, [sp, #0x10]
	mov r1, #3
	str r3, [sp, #4]
	strh r2, [sp, #0xc]
	strh r1, [sp, #0xe]
	ldrh r1, [r7, #8]
	add r0, sp, #4
	strh r1, [sp, #8]
	ldrh r1, [r7, #0x36]
	strh r1, [sp, #0xa]
	bl sub_027F3C10
	add sl, sp, #4
_027F3318:
	ldr r0, [sl, #0x28]
	cmp r0, #0
	ldreqh r0, [sl, #0x1a]
	beq _027F333C
	add r0, r0, #1
	bl sub_027EAD50
	sub r0, r0, #8
	strh r0, [r6, #0x3c]
	ldrh r0, [r6, #0x3c]
_027F333C:
	add r0, r0, #0x41
	mov r0, r0, lsr #1
	strh r0, [r6]
	ldrh r0, [sl, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _027F35A0
	ldr r0, _027F35B8 ; =0x0380FFF4
	ldrh r1, [r6]
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r0, [r0, #8]
	cmp r0, r1
	blo _027F35A0
	ldrh r1, [r7, #0x36]
	add r0, r6, #4
	strh r1, [r6, #0x2c]
	add r1, r7, #0x24
	bl sub_027EA0E0
	ldrh r0, [r7, #0x34]
	strh r0, [r6, #0x32]
	ldrh r0, [r7, #0x12]
	and r0, r0, #0xff
	strh r0, [r6, #2]
	ldr r0, [sl, #0x28]
	cmp r0, #0
	beq _027F33E4
	mov r7, #0
	add r8, r6, #0x40
	b _027F33D4
_027F33B4:
	ldr r0, [sl, #0x28]
	add r0, r0, #0xa
	add r0, r0, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, r8, r7
	bl sub_027EAD24
	add r7, r7, #1
_027F33D4:
	ldrh r0, [r6, #0x3c]
	cmp r7, r0
	blo _027F33B4
	b _027F3488
_027F33E4:
	ldrh r0, [sl, #0x18]
	strh r0, [r6, #0x3e]
	ldrh r0, [sl, #0x18]
	cmp r0, #0
	beq _027F3488
	add r7, r7, #0x38
	add fp, r6, #0x40
	mov r8, #0
	b _027F347C
_027F3408:
	mov r0, r7
	bl sub_027EAD50
	mov sb, r0
	add r0, r7, #1
	bl sub_027EAD50
	cmp sb, #6
	bls _027F3474
	ldr r1, [sl, #0x28]
	cmp r7, r1
	beq _027F3474
	add r0, r0, #2
	mov sb, #0
	str r0, [sp]
	b _027F3460
_027F3440:
	mov r0, r7
	bl sub_027EAD50
	mov r1, r0
	mov r0, fp
	bl sub_027EAD24
	add fp, fp, #1
	add r7, r7, #1
	add sb, sb, #1
_027F3460:
	ldr r0, [sp]
	cmp sb, r0
	blo _027F3440
	add r8, r8, #1
	b _027F347C
_027F3474:
	add r0, r0, #2
	add r7, r7, r0
_027F347C:
	ldrh r0, [sl, #0x18]
	cmp r8, r0
	blo _027F3408
_027F3488:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _027F34DC
	add r0, r0, #1
	bl sub_027EAD50
	strh r0, [r6, #0xa]
	mov r7, #0
	add r8, r6, #0xc
	b _027F34CC
_027F34AC:
	ldr r0, [sl, #0x1c]
	add r0, r0, #2
	add r0, r0, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, r8, r7
	bl sub_027EAD24
	add r7, r7, #1
_027F34CC:
	ldrh r0, [r6, #0xa]
	cmp r7, r0
	blo _027F34AC
	b _027F3504
_027F34DC:
	mov sb, #0
	strh sb, [r6, #0xa]
	add r8, r6, #0xc
	mov r7, sb
_027F34EC:
	mov r1, r7
	add r0, r8, sb
	bl sub_027EAD24
	add sb, sb, #1
	cmp sb, #0x20
	blo _027F34EC
_027F3504:
	ldrh r0, [sl, #0x14]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x16]
	strh r0, [r6, #0x30]
	ldrh r0, [sl, #0x12]
	strh r0, [r6, #0x36]
	ldr r0, [sl, #0x20]
	cmp r0, #0
	beq _027F3534
	add r0, r0, #3
	bl sub_027EAD50
	strh r0, [r6, #0x38]
_027F3534:
	ldr r0, [sl, #0x24]
	cmp r0, #0
	beq _027F354C
	add r0, r0, #3
	bl sub_027EAD50
	strh r0, [r6, #0x34]
_027F354C:
	ldrh r1, [r5, #2]
	ldrh r0, [r6]
	add r0, r1, r0
	strh r0, [r5, #2]
	ldrh r0, [r5, #8]
	add r0, r0, #1
	strh r0, [r5, #8]
	ldrh r1, [r4, #4]
	ldrh r0, [r6]
	sub r0, r1, r0
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #0x20
	bhs _027F35AC
	bl sub_027EABE0
	mov r2, #0x15
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_037F8598
	b _027F35AC
_027F35A0:
	ldr r1, _027F35BC ; =_027F74B4
	add r0, r6, #4
	bl sub_027EA0E0
_027F35AC:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F35B8: .word 0x0380FFF4
_027F35BC: .word _027F74B4
	arm_func_end sub_027F31F0

	arm_func_start sub_027F35C0
sub_027F35C0: ; 0x027F35C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _027F3B4C ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x90]
	add r0, r2, #4
	tst r1, #8
	add r4, r2, #0x344
	add sb, r0, #0x400
	beq _027F3660
	ldr r1, _027F3B50 ; =0x048080B0
	add r0, r2, #0x2c
	ldrh r2, [r1]
	add r1, r0, #0x400
	tst r2, #1
	ldrneh r0, [r1]
	cmpne r0, #0
	bne _027F3660
	tst r2, #4
	ldrneh r0, [r1, #0x14]
	cmpne r0, #0
	bne _027F3660
	tst r2, #8
	ldrneh r0, [r1, #0x28]
	cmpne r0, #0
	bne _027F3660
	ldr r0, _027F3B54 ; =0x0480819C
	ldrh r0, [r0]
	tst r0, #1
	bne _027F3660
	ldr r2, _027F3B58 ; =0x04808032
	mov r3, #0
	strh r3, [r2]
	mov r1, #0x8000
	ldr r0, _027F3B4C ; =0x0380FFF4
	strh r1, [r2]
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r3, [r0, #0xde]
_027F3660:
	add r0, sl, #0x1e
	mov r1, #0xb0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F3B44
	ldrh r0, [sl, #0x2e]
	ldrh r8, [sl, #2]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	cmp r8, #0
	mov r5, #0
	mov r6, r0, lsr #0x10
	moveq r7, #0x13
	moveq r5, #1
	beq _027F3B08
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _027F3710
	mov r0, r8
	bl sub_027EBFE0
	cmp r0, #0x20
	bls _027F36D4
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	add r0, sl, #0x1e
	mov r1, #1
	bl sub_027EDBE4
_027F36D4:
	ldrh r0, [sl, #8]
	tst r0, #0x400
	beq _027F3710
	mov r0, r8
	bl sub_027EC060
	cmp r0, #0
	beq _027F3710
	mov r5, #1
	mov r0, r8
	mov r1, #0
	strh r5, [sl, #0x2c]
	mov r7, #0xf
	mov r6, #4
	bl sub_027EBE6C
	b _027F3B08
_027F3710:
	ldrh r0, [sl, #0x2c]
	cmp r0, #0
	beq _027F3728
	cmp r0, #1
	beq _027F3804
	b _027F3AF8
_027F3728:
	ldrh r1, [r4, #0xc]
	cmp r1, #1
	ldreq r0, _027F3B4C ; =0x0380FFF4
	ldreq r0, [r0]
	addeq r0, r0, #0x300
	ldreqh r0, [r0, #0x32]
	cmpeq r0, #1
	moveq r7, #0xd
	moveq r5, #1
	beq _027F3B08
	cmp r1, #1
	bne _027F3774
	ldrh r0, [sl, #0x2e]
	mov r5, #1
	cmp r0, #1
	moveq r7, #0
	movne r7, #0xe
	movne r6, #2
	b _027F3B08
_027F3774:
	beq _027F3B08
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	ldreq r1, [sb, #0x18]
	ldreqh r0, [r1, #0x16]
	cmpeq r0, #0
	bne _027F3B08
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_027EA474
	cmp r0, #0
	beq _027F3B08
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _027F3B08
	bl sub_027EABE0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _027F37E4
	mov r0, #0x30
	bl sub_037F9238
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_027F37E4:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_037F8598
	b _027F3B08
_027F3804:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _027F39A4
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	ldrh r0, [sl, #0x2e]
	cmp r0, #1
	bne _027F38C0
	add r0, sl, #0x1e
	mov r1, #0x80
	mov r2, #1
	bl sub_027F1DFC
	movs r4, r0
	beq _027F3B08
	ldrh r1, [sl, #0x2c]
	ldr r0, _027F3B5C ; =0x04808044
	strh r1, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	mov r1, #0
	strh r1, [r4, #0x30]
	ldrh r1, [r0]
	ldrh r0, [r0]
	add r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	movs sb, r0, lsr #0x10
	moveq sb, #1
	mov r0, sb
	bl sub_027EADA0
	mov r0, r8
	mov r1, sb
	bl sub_027EBE6C
	add r0, r4, #0x33
	add sb, r4, #0x34
	bl sub_027EAD50
	mov fp, r0
	mov r8, #0
	b _027F38AC
_027F38A0:
	bl sub_027EADB8
	strh r0, [sb], #2
	add r8, r8, #2
_027F38AC:
	cmp r8, fp
	blo _027F38A0
	mov r0, r4
	bl sub_027F107C
	b _027F3B08
_027F38C0:
	cmp r0, #3
	mov r0, r8
	bne _027F398C
	bl sub_027EBFE0
	cmp r0, #0x20
	bne _027F38E8
	mov r0, r8
	bl sub_027EC060
	cmp r0, #0
	bne _027F38F4
_027F38E8:
	mov r7, #1
	mov r5, r7
	b _027F3B08
_027F38F4:
	ldrh r0, [sl, #2]
	bl sub_027EC060
	bl sub_027EADA0
	add r0, sl, #0x33
	add r7, sl, #0x34
	bl sub_027EAD50
	mov r4, r0
	mov r5, #0
	b _027F3930
_027F3918:
	bl sub_027EADB8
	ldrh r1, [r7], #2
	cmp r1, r0
	movne r0, #0
	bne _027F3960
	add r5, r5, #1
_027F3930:
	cmp r5, r4, lsr #1
	blo _027F3918
	tst r4, #1
	beq _027F395C
	bl sub_027EADB8
	ldrh r1, [r7]
	and r0, r0, #0xff
	and r1, r1, #0xff
	cmp r1, r0
	movne r0, #0
	bne _027F3960
_027F395C:
	mov r0, #1
_027F3960:
	cmp r0, #0
	mov r0, r8
	mov r1, #0
	mov r5, #1
	bne _027F3980
	mov r7, #0xf
	bl sub_027EBE6C
	b _027F3B08
_027F3980:
	bl sub_027EBE6C
	mov r7, #0
	b _027F3B08
_027F398C:
	mov r1, #0
	bl sub_027EBE6C
	mov r7, #0xe
	mov r6, #2
	mov r5, #1
	b _027F3B08
_027F39A4:
	ldr r1, [sb, #0x18]
	ldrh r0, [r1, #0x16]
	cmp r0, #1
	bne _027F3B08
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_027EA474
	cmp r0, #0
	beq _027F3B08
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	bne _027F3A94
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _027F3B08
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	beq _027F3A28
	bl sub_027EABE0
	mov r0, #0x35
	strh r0, [sb]
	ldr r0, [sb, #0x1c]
	mov r1, #0xc
	strh r1, [r0, #4]
	mov r0, #2
	ldrh r3, [sl, #0x30]
	ldr r2, [sb, #0x1c]
	mov r1, r0
	strh r3, [r2, #6]
	bl sub_037F8598
	mov r0, #0x20
	bl sub_037F9238
	b _027F3B08
_027F3A28:
	mov r1, #0x33
	add r0, sl, #0x33
	strh r1, [sb]
	bl sub_027EAD50
	mov r1, r0
	add r0, sl, #0x1e
	mov r2, #1
	bl sub_027F1DFC
	movs r4, r0
	beq _027F3B08
	ldrh r1, [r4, #0x14]
	add r0, sl, #0x2c
	orr r1, r1, #0x4000
	strh r1, [r4, #0x14]
	ldrh r2, [sl, #6]
	add r1, r4, #0x2c
	add r2, r2, #1
	bl sub_037FDF9C
	ldrh r1, [sl, #0x2c]
	mov r0, #3
	strh r1, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #0x30]
	bl sub_027F107C
	b _027F3B08
_027F3A94:
	cmp r0, #4
	ldreqh r0, [sb]
	cmpeq r0, #0x33
	bne _027F3B08
	bl sub_027EABE0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _027F3AD8
	mov r0, #0x30
	bl sub_037F9238
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_027F3AD8:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_037F8598
	b _027F3B08
_027F3AF8:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	moveq r7, #0xd
	moveq r5, #1
_027F3B08:
	cmp r5, #0
	beq _027F3B44
	cmp r7, #0
	movne r2, #1
	moveq r2, #0
	add r0, sl, #0x1e
	mov r1, #0
	bl sub_027F1DFC
	cmp r0, #0
	beq _027F3B44
	ldrh r1, [sl, #0x2c]
	strh r1, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	strh r7, [r0, #0x30]
	bl sub_027F107C
_027F3B44:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F3B4C: .word 0x0380FFF4
_027F3B50: .word 0x048080B0
_027F3B54: .word 0x0480819C
_027F3B58: .word 0x04808032
_027F3B5C: .word 0x04808044
	arm_func_end sub_027F35C0

	arm_func_start sub_027F3B60
sub_027F3B60: ; 0x027F3B60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _027F3C0C ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _027F3B94
	cmp r0, #2
	cmpne r0, #3
	beq _027F3BCC
	b _027F3C04
_027F3B94:
	mov r0, r5
	bl sub_027EBFE0
	cmp r0, #0x20
	bls _027F3C04
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_027EBC44
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_027EDBE4
	mov r0, r5
	bl sub_027F0D60
	b _027F3C04
_027F3BCC:
	ldrh r0, [r1, #8]
	cmp r0, #0x20
	bls _027F3C04
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_027EA474
	cmp r0, #0
	beq _027F3C04
	mov r0, #0x20
	bl sub_037F9238
	bl sub_027EA03C
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_027EDBE4
_027F3C04:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F3C0C: .word 0x0380FFF4
	arm_func_end sub_027F3B60

	arm_func_start sub_027F3C10
sub_027F3C10: ; 0x027F3C10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _027F3F30 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r1]
	ldr r5, [sb]
	add r4, r0, #0x344
	ldrh r0, [r4, #0x7a]
	ldr sl, _027F3F30 ; =0x0380FFF4
	strh r0, [sb, #0x12]
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	ldrh r6, [sb, #8]
	b _027F3EA4
_027F3C50:
	mov r0, r5
	bl sub_027EAD50
	mov r8, r0
	add r0, r5, #1
	add r5, r5, #2
	bl sub_027EAD50
	mov r7, r0
	cmp r8, #6
	addls pc, pc, r8, lsl #2
	b _027F3C94
_027F3C78: ; jump table
	b _027F3CA0 ; case 0
	b _027F3D0C ; case 1
	b _027F3E98 ; case 2
	b _027F3D70 ; case 3
	b _027F3DDC ; case 4
	b _027F3DBC ; case 5
	b _027F3E98 ; case 6
_027F3C94:
	cmp r8, #0xdd
	beq _027F3DFC
	b _027F3E7C
_027F3CA0:
	cmp r7, #0x20
	bhi _027F3E98
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #1
	strh r1, [sb, #0xc]
	str r0, [sb, #0x1c]
	cmp r7, #0
	bne _027F3CDC
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	bne _027F3E98
_027F3CDC:
	ldrh r1, [sb, #0xa]
	mov r0, r7, lsl #0x10
	bic r2, r1, #1
	strh r2, [sb, #0xa]
	mov r1, r5
	mov r0, r0, lsr #0x10
	bl sub_027EA3A4
	cmp r0, #0
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	b _027F3E98
_027F3D0C:
	cmp r7, #1
	blo _027F3E98
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #4
	strh r1, [sb, #0xc]
	add r1, sb, #0x14
	bl sub_027EA4C4
	ldrh r0, [r4, #0x60]
	ldrh r1, [r4, #0x62]
	ldrh r2, [sb, #0x14]
	orr r1, r0, r1
	mvn r1, r1
	tst r2, r1
	ldreqh r1, [sb, #0x16]
	orreq r1, r2, r1
	andeq r1, r0, r1
	cmpeq r0, r1
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #4
	streqh r0, [sb, #0xa]
	ldrneh r0, [sb, #0xa]
	bicne r0, r0, #4
	strneh r0, [sb, #0xa]
	b _027F3E98
_027F3D70:
	cmp r7, #1
	blo _027F3E98
	ldrh r1, [sb, #0xc]
	mov r0, r5
	orr r1, r1, #2
	strh r1, [sb, #0xc]
	bl sub_027EAD50
	strh r0, [sb, #0x12]
	ldr r0, [sl]
	ldrh r1, [sb, #0x12]
	ldr r0, [r0, #0x41c]
	ldrh r0, [r0, #0x4a]
	cmp r1, r0
	ldrh r0, [sb, #0xa]
	orreq r0, r0, #2
	streqh r0, [sb, #0xa]
	bicne r0, r0, #2
	strneh r0, [sb, #0xa]
	b _027F3E98
_027F3DBC:
	cmp r7, #3
	blo _027F3E98
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x100
	strh r1, [sb, #0xc]
	str r0, [sb, #0x24]
	b _027F3E98
_027F3DDC:
	cmp r7, #6
	blo _027F3E98
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x200
	strh r1, [sb, #0xc]
	str r0, [sb, #0x20]
	b _027F3E98
_027F3DFC:
	cmp r7, #8
	blo _027F3E44
	mov r0, r5
	bl sub_027EAD50
	cmp r0, #0
	bne _027F3E44
	add r0, r5, #1
	bl sub_027EAD50
	cmp r0, #9
	bne _027F3E44
	add r0, r5, #2
	bl sub_027EAD50
	cmp r0, #0xbf
	bne _027F3E44
	add r0, r5, #3
	bl sub_027EAD50
	cmp r0, #0
	beq _027F3E64
_027F3E44:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
	b _027F3E98
_027F3E64:
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x400
	strh r1, [sb, #0xc]
	str r0, [sb, #0x28]
	b _027F3E98
_027F3E7C:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
_027F3E98:
	add r0, r7, #2
	add r5, r5, r7
	sub r6, r6, r0
_027F3EA4:
	cmp r6, #0
	bgt _027F3C50
	ldrh r0, [sb, #0xc]
	tst r0, #8
	beq _027F3EDC
	ldrh r0, [r4, #0x64]
	tst r0, #1
	bne _027F3ED0
	ldrh r0, [sb, #4]
	tst r0, #0x8000
	beq _027F3EDC
_027F3ED0:
	ldrh r0, [sb, #0xa]
	orr r0, r0, #8
	strh r0, [sb, #0xa]
_027F3EDC:
	ldrh r0, [sb, #0xc]
	tst r0, #0x30
	beq _027F3F28
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #3
	and r0, r0, #3
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x10
	streqh r0, [sb, #0xa]
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #0x10
	and r0, r0, #0x10
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x20
	streqh r0, [sb, #0xa]
_027F3F28:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_027F3F30: .word 0x0380FFF4
	arm_func_end sub_027F3C10

	arm_func_start sub_027F3F34
sub_027F3F34: ; 0x027F3F34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r0, _027F45DC ; =0x0380FFF4
	mvn r1, #0
	ldr r4, [r0]
	add sl, r4, #0x17c
	ldr r6, [sl, #0x60]
	add r0, r4, #0x300
	ldrh r5, [r0, #0x50]
	cmp r6, r1
	beq _027F45D0
	ldrh r0, [r6, #0x28]
	tst r0, #1
	ldrne r0, [r4, #0x568]
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r6, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r1, [r6, #0x24]
	add r0, r6, #0x2e
	mov r2, r1, lsl #0x1c
	mov r1, r1, lsl #0x18
	mov r8, r2, lsr #0x1e
	mov sb, r1, lsr #0x1c
	bl sub_027EB9A8
	mov r7, r0
	strh r7, [r6, #0x12]
	cmp r7, #0xff
	bne _027F4024
	mov r0, #0
	strh r0, [r6, #0x12]
	cmp r5, #1
	bne _027F45AC
	cmp r8, #0
	bne _027F45AC
	cmp sb, #0
	beq _027F4018
	cmp sb, #4
	beq _027F400C
	cmp sb, #0xb
	bne _027F45AC
	add r0, r6, #0x10
	bl sub_027F35C0
	b _027F45AC
_027F400C:
	add r0, r6, #0x10
	bl sub_027F313C
	b _027F45AC
_027F4018:
	add r0, r6, #0x10
	bl sub_027F2F6C
	b _027F45AC
_027F4024:
	bl sub_027EBE8C
	ldrh r1, [r6, #0x22]
	mov r0, r7, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_027EBD2C
	cmp r8, #0
	bne _027F4070
	ldrh fp, [r6, #0x3a]
	mov r0, r7
	bl sub_027EC080
	cmp fp, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _027F45AC
	mov r0, r7
	mov r1, fp
	bl sub_027EBE4C
_027F4070:
	cmp r5, #1
	beq _027F4088
	cmp r5, #2
	cmpne r5, #3
	beq _027F4328
	b _027F45AC
_027F4088:
	ldrh r1, [r6, #0x24]
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_027EBD4C
	cmp r8, #0
	bne _027F42C4
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _027F45AC
_027F40B4: ; jump table
	b _027F40F4 ; case 0
	b _027F45AC ; case 1
	b _027F4100 ; case 2
	b _027F45AC ; case 3
	b _027F4284 ; case 4
	b _027F4290 ; case 5
	b _027F45AC ; case 6
	b _027F45AC ; case 7
	b _027F40E8 ; case 8
	b _027F45AC ; case 9
	b _027F42A0 ; case 10
	b _027F42AC ; case 11
	b _027F42B8 ; case 12
_027F40E8:
	add r0, r6, #0x10
	bl sub_027F2840
	b _027F45AC
_027F40F4:
	add r0, r6, #0x10
	bl sub_027F2F6C
	b _027F45AC
_027F4100:
	ldr r0, _027F45DC ; =0x0380FFF4
	ldrh r4, [r6, #0x16]
	ldr r5, [r0]
	cmp r4, #0xa
	bls _027F45AC
	add r0, r5, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _027F45AC
	add r0, r6, #0x2e
	mov r1, #0x30
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F45AC
	ldrh r7, [r6, #0x12]
	mov r0, r7
	bl sub_027EBFE0
	cmp r0, #0x30
	bhs _027F4180
	add r0, r6, #0x2e
	mov r1, #0xc0
	bl sub_027F1FF4
	cmp r0, #0
	bne _027F45AC
	add r0, r6, #0x2e
	mov r1, #6
	mov r2, #1
	bl sub_027F1EBC
	cmp r0, #0
	beq _027F45AC
	bl sub_027F107C
	b _027F45AC
_027F4180:
	mov r0, r7
	bl sub_027EBFE0
	cmp r0, #0x40
	mov r0, r7
	bne _027F41AC
	mov r1, #0x30
	bl sub_027EBC44
	add r0, r6, #0x2e
	mov r1, #1
	bl sub_027EDE44
	b _027F41B8
_027F41AC:
	bl sub_027EC0CC
	cmp r0, #0
	bne _027F45AC
_027F41B8:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_037FDFD0
	add r3, r6, #0x46
	sub r2, r4, #0xa
	mov r1, #0x800
	str r3, [sp]
	strh r2, [sp, #8]
	strh r1, [sp, #0xc]
	add r0, sp, #0
	bl sub_027F3C10
	ldrh r1, [r6, #0x3c]
	ldr r0, _027F45E0 ; =0x0000FFC2
	tst r1, r0
	bne _027F422C
	add r0, r5, #0x300
	ldrh r2, [r0, #0x34]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _027F422C
	cmp r2, #0
	beq _027F4234
	ldrh r0, [r6, #0x3c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	bne _027F4234
_027F422C:
	mov r1, #0xa
	b _027F4268
_027F4234:
	mov r0, r7
	bl sub_027EBE0C
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _027F4268
	tst r0, #4
	moveq r1, #0x12
	beq _027F4268
	ldrh r1, [sp, #0x16]
	mov r0, r7
	bl sub_027EBE2C
	mov r1, #0
_027F4268:
	ldr r2, [sp, #0x1c]
	mov r0, r7
	bl sub_027F19F0
	cmp r0, #0
	beq _027F45AC
	bl sub_027F107C
	b _027F45AC
_027F4284:
	add r0, r6, #0x10
	bl sub_027F313C
	b _027F45AC
_027F4290:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_027F31F0
	b _027F45AC
_027F42A0:
	add r0, r6, #0x10
	bl sub_027F2E8C
	b _027F45AC
_027F42AC:
	add r0, r6, #0x10
	bl sub_027F35C0
	b _027F45AC
_027F42B8:
	add r0, r6, #0x10
	bl sub_027F3B60
	b _027F45AC
_027F42C4:
	cmp r8, #1
	bne _027F45AC
	cmp sb, #0xa
	bne _027F45AC
	ldr r0, _027F45DC ; =0x0380FFF4
	ldrh r4, [r6, #0x12]
	ldr r1, [r0]
	mov r0, r4
	add r5, r1, #0x17c
	bl sub_027EBFE0
	cmp r0, #0x40
	bne _027F45AC
	mov r0, r4
	bl sub_027EBDE8
	ldrh r0, [r5, #0x2c]
	cmp r0, #0
	beq _027F4310
	mov r0, #1
	bl sub_027EFEF4
_027F4310:
	ldrh r0, [r5, #0x20]
	cmp r0, #0
	beq _027F45AC
	mov r0, #0
	bl sub_027EFEF4
	b _027F45AC
_027F4328:
	cmp r8, #0
	bne _027F45AC
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _027F45AC
_027F433C: ; jump table
	b _027F45AC ; case 0
	b _027F437C ; case 1
	b _027F45AC ; case 2
	b _027F4478 ; case 3
	b _027F45AC ; case 4
	b _027F457C ; case 5
	b _027F45AC ; case 6
	b _027F45AC ; case 7
	b _027F4370 ; case 8
	b _027F45AC ; case 9
	b _027F458C ; case 10
	b _027F4598 ; case 11
	b _027F45A4 ; case 12
_027F4370:
	add r0, r6, #0x10
	bl sub_027F2840
	b _027F45AC
_027F437C:
	ldr r0, _027F45DC ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _027F45AC
	ldrh r0, [r4]
	cmp r0, #0x51
	bne _027F45AC
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_027EA474
	cmp r0, #0
	beq _027F45AC
	bl sub_027EABE0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _027F4418
	ldrh r1, [r6, #0x40]
	ldr r0, _027F45E4 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027EA000
	ldrh r0, [r5, #0x6a]
	bl sub_027F1F50
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_027EA0E0
	add r0, r6, #0x2e
	bl sub_027EB900
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_027EBC44
_027F4418:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _027F4454
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_037F9238
_027F4454:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x53
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_037F8598
	b _027F45AC
_027F4478:
	ldr r0, _027F45DC ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _027F45AC
	ldrh r0, [r4]
	cmp r0, #0x61
	bne _027F45AC
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_027EA474
	cmp r0, #0
	beq _027F45AC
	bl sub_027EABE0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _027F451C
	ldrh r1, [r6, #0x40]
	ldr r0, _027F45E4 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_027EA000
	ldrh r0, [r5, #0x6a]
	bl sub_027F1F50
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_027EA0E0
	add r0, r6, #0x2e
	bl sub_027EB900
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_027EBC44
	mov r0, #0x40
	bl sub_037F9238
_027F451C:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _027F4558
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_037F9238
_027F4558:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x63
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_037F8598
	b _027F45AC
_027F457C:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_027F31F0
	b _027F45AC
_027F458C:
	add r0, r6, #0x10
	bl sub_027F2E8C
	b _027F45AC
_027F4598:
	add r0, r6, #0x10
	bl sub_027F35C0
	b _027F45AC
_027F45A4:
	add r0, r6, #0x10
	bl sub_027F3B60
_027F45AC:
	mov r1, r6
	add r0, sl, #0x60
	bl sub_037F8908
	ldrh r0, [sl, #0x68]
	cmp r0, #0
	beq _027F45D0
	mov r0, #1
	mov r1, #7
	bl sub_037F8598
_027F45D0:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F45DC: .word 0x0380FFF4
_027F45E0: .word 0x0000FFC2
_027F45E4: .word 0x00000FFF
	arm_func_end sub_027F3F34

	arm_func_start sub_027F45E8
sub_027F45E8: ; 0x027F45E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r0, _027F4B00 ; =0x0380FFF4
	mvn r1, #0
	ldr r2, [r0]
	add r0, r2, #0x17c
	ldr r5, [r0, #0x6c]
	str r0, [sp, #4]
	cmp r5, r1
	beq _027F4AF4
	add r0, r2, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	bne _027F4AC8
	ldrh r1, [r5, #0x20]
	ldr r0, _027F4B04 ; =0x000005FC
	cmp r1, r0
	bhi _027F4AC8
	ldrh r4, [r5, #0x24]
	add r0, sp, #8
	tst r4, #0x100
	beq _027F4660
	add r1, r5, #0x34
	bl sub_027EA0E0
	tst r4, #0x200
	bne _027F4AC8
	add r0, sp, #0xe
	add r1, r5, #0x2e
	bl sub_027EA0E0
	b _027F4688
_027F4660:
	add r1, r5, #0x28
	bl sub_027EA0E0
	tst r4, #0x200
	add r0, sp, #0xe
	beq _027F4680
	add r1, r5, #0x34
	bl sub_027EA0E0
	b _027F4688
_027F4680:
	add r1, r5, #0x2e
	bl sub_027EA0E0
_027F4688:
	ldrh r0, [r5, #0x3a]
	tst r4, #0x400
	strh r0, [sp, #0x14]
	beq _027F48C0
	ldrh r0, [r5, #0x3a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	bne _027F48C0
	ldr r0, _027F4B00 ; =0x0380FFF4
	mvn r6, #0
	ldr r0, [r0]
	mov r7, #0
	add r0, r0, #0xe4
	add r8, r0, #0x400
	add fp, sp, #8
	mov r4, #0x18
	b _027F47D0
_027F46CC:
	mul sb, r7, r4
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _027F47C8
	mov r1, fp
	add r0, sl, #4
	bl sub_027EA474
	cmp r0, #0
	beq _027F47CC
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_027EA474
	cmp r0, #0
	beq _027F47CC
	ldrh r0, [sp, #0x14]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x14
	mov r0, r1, lsl #0x10
	cmp r2, r0, lsr #20
	bne _027F47CC
	ldrh r0, [r5, #0x18]
	mov r1, r1, lsl #0x1c
	and r2, r0, #0xf0
	mov r0, r2, asr #3
	add r0, r2, r0, lsr #28
	mov r7, r0, asr #4
	subs r0, r7, r1, lsr #28
	beq _027F4AC8
	tst r0, #0x80000000
	bne _027F4AC8
	mov r0, sl
	ldr r4, [r0, #0x14]
	ldrh r0, [r5, #0x20]
	ldrh r3, [r4, #0x20]
	sub r0, r0, r3
	subs r6, r0, #0x18
	beq _027F4AC8
	tst r6, #0x80000000
	bne _027F4AC8
	add r0, r5, #0x3c
	add r1, r4, #0x3c
	mov r2, r6
	add r0, r0, r3
	add r1, r1, r3
	bl sub_037FDF9C
	ldrh r1, [r4, #0x20]
	mov r0, r7, lsl #0x10
	add r1, r1, r6
	strh r1, [r4, #0x20]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf
	and r0, r0, #0xf
	orr r1, r1, r0
	ldr r0, _027F4B00 ; =0x0380FFF4
	strh r1, [sl, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x560]
	add r0, r0, r7
	str r0, [r1, #0x560]
	b _027F4AC8
_027F47C8:
	mov r6, r7
_027F47CC:
	add r7, r7, #1
_027F47D0:
	cmp r7, #3
	blo _027F46CC
	mvn r0, #0
	cmp r6, r0
	beq _027F4AC8
	ldr r0, _027F4B00 ; =0x0380FFF4
	ldr r1, _027F4B08 ; =0x00000622
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F886C
	movs r4, r0
	beq _027F48B4
	mov r0, #0x18
	mul r7, r6, r0
	add r6, r8, r7
	add r0, sp, #8
	add r1, r6, #4
	mov r2, #0x10
	bl sub_037FDF9C
	mov r0, #5
	strh r0, [r8, r7]
	mov r0, r6
	str r4, [r0, #0x14]
	ldrh r2, [r5, #0x20]
	add r0, r5, #0x18
	add r1, r4, #0x18
	add r2, r2, #0xc
	bl sub_037FDF9C
	ldr r0, _027F4B00 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x30c]
	bl sub_037FDE88
	ldrh r1, [r4, #0x18]
	ldrh r0, [r6, #0x10]
	and r1, r1, #0xf0
	bic r3, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r1, r0, asr #4
	mov r2, r1, lsl #0x10
	mov r2, r2, lsr #0x10
	and r2, r2, #0xf
	orr r2, r3, r2
	strh r2, [r6, #0x10]
	ldr r2, _027F4B00 ; =0x0380FFF4
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r0, r2, r0, asr #4
	str r0, [r3, #0x560]
	ldrh r0, [r5, #0x20]
	sub r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x20]
	bl _u32_div_f
	mov r1, r6
	strh r0, [r1, #2]
	b _027F4AC8
_027F48B4:
	mov r0, #4
	bl sub_027EB06C
	b _027F4AC8
_027F48C0:
	ldr r1, _027F4B00 ; =0x0380FFF4
	ldrh r0, [r5, #0x20]
	ldr r4, [r1]
	sub r1, r0, #0x18
	add r0, r4, #0xe4
	strh r1, [r5, #0x20]
	add r8, r0, #0x400
	mov r7, #0
	b _027F497C
_027F48E4:
	mov r0, #0x18
	mul sb, r7, r0
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _027F4978
	add r1, sp, #8
	add r0, sl, #4
	bl sub_027EA474
	cmp r0, #0
	beq _027F4978
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_027EA474
	cmp r0, #0
	beq _027F4978
	ldrh r2, [sp, #0x14]
	ldrh r0, [sl, #0x10]
	mov r1, r2, lsl #0x10
	mov r1, r1, lsr #0x14
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #20
	bne _027F4978
	mov r1, sl
	ldrh r0, [r1, #0x10]
	sub fp, r0, r2
	tst fp, #0x80000000
	bne _027F4AC8
	ldrh r0, [r1, #2]
	ldrh r1, [r5, #0x20]
	mul r0, fp, r0
	str r0, [sp]
	subs r6, r1, r0
	beq _027F4AC8
	tst r6, #0x80000000
	beq _027F4984
	b _027F4AC8
_027F4978:
	add r7, r7, #1
_027F497C:
	cmp r7, #3
	blo _027F48E4
_027F4984:
	cmp r7, #3
	beq _027F4AC8
	mov r0, #0x18
	mul sb, r7, r0
	add r0, r8, sb
	ldr r1, [r0, #0x14]
	ldr r0, _027F4B0C ; =0x000005E4
	add r7, r1, #0x10
	ldrh r1, [r7, #0x10]
	add sl, r1, r6
	cmp sl, r0
	bls _027F49CC
	add r0, r4, #0x188
	sub r1, r7, #0x10
	bl sub_037F8908
	mov r0, #0
	strh r0, [r8, sb]
	b _027F4AC8
_027F49CC:
	ldr r0, [sp]
	add r3, r5, #0x3c
	add r2, r7, #0x2c
	add r1, r2, r1
	add r0, r3, r0
	add r2, r6, #1
	bl sub_037FDF9C
	strh sl, [r7, #0x10]
	ldrh r1, [r5, #0x18]
	add r0, r8, sb
	ldrh r6, [r0, #0x10]
	and r2, r1, #0xf0
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r3, r6, lsl #0x1c
	rsb r2, fp, r1, asr #4
	add r2, r2, r3, lsr #28
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bic r3, r6, #0xf
	and r2, r2, #0xf
	orr r3, r3, r2
	ldr r2, _027F4B00 ; =0x0380FFF4
	strh r3, [r0, #0x10]
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r1, r2, r1, asr #4
	str r1, [r3, #0x560]
	ldrh r1, [r5, #0x18]
	tst r1, #0x100
	bne _027F4AC8
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r7, #8]
	bic r0, r0, #0xf0
	add r0, r0, #0x10
	strh r0, [r7, #8]
	ldrh r0, [r7, #0x10]
	add r0, r0, #0x18
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #8]
	ands r0, r0, #0xf
	beq _027F4AA0
	cmp r0, #8
	add r0, r4, #0x188
	bne _027F4AC0
	add r1, r4, #0x1c4
	sub r2, r7, #0x10
	bl sub_037F8988
	mov r0, #2
	mov r1, #6
	bl sub_037F8598
	b _027F4AC8
_027F4AA0:
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r7, #0x10
	bl sub_037F8988
	mov r0, #1
	mov r1, #7
	bl sub_037F8598
	b _027F4AC8
_027F4AC0:
	sub r1, r7, #0x10
	bl sub_037F8908
_027F4AC8:
	ldr r0, [sp, #4]
	mov r1, r5
	add r0, r0, #0x6c
	bl sub_037F8908
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x74]
	cmp r0, #0
	beq _027F4AF4
	mov r0, #2
	mov r1, #9
	bl sub_037F8598
_027F4AF4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F4B00: .word 0x0380FFF4
_027F4B04: .word 0x000005FC
_027F4B08: .word 0x00000622
_027F4B0C: .word 0x000005E4
	arm_func_end sub_027F45E8

	arm_func_start sub_027F4B10
sub_027F4B10: ; 0x027F4B10
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _027F4B78 ; =0x0380FFF4
	mov r6, #0
	ldr r0, [r4]
	mov r7, #0x18
	add r0, r0, #0xe4
	add r5, r0, #0x400
_027F4B2C:
	mul r1, r6, r7
	ldrh r0, [r5, r1]
	add r1, r5, r1
	cmp r0, #0
	beq _027F4B64
	sub r0, r0, #1
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _027F4B64
	ldr r0, [r4]
	ldr r1, [r1, #0x14]
	add r0, r0, #0x188
	bl sub_037F8908
_027F4B64:
	add r6, r6, #1
	cmp r6, #3
	blo _027F4B2C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F4B78: .word 0x0380FFF4
	arm_func_end sub_027F4B10

	arm_func_start sub_027F4B7C
sub_027F4B7C: ; 0x027F4B7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _027F4CBC ; =0x0380FFF4
	mov sb, r2
	ldr r2, [r3]
	mov fp, r0
	add r0, sb, #1
	mov sl, r1
	add r4, r2, #0x23c
	bl sub_027EAD50
	cmp r0, #0x20
	bhi _027F4CB4
	mov r6, #4
	mov r7, r6
	mov r8, #0x400
	mov r5, #0
	b _027F4BFC
_027F4BBC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _027F4BF0
	add r0, r4, #6
	add r1, sl, #0x24
	bl sub_027EA474
	cmp r0, #0
	bne _027F4C1C
	ldrh r0, [r4, #0x30]
	cmp r0, r8
	movlo r8, r0
	movlo r7, r5
	b _027F4BF4
_027F4BF0:
	mov r6, r5
_027F4BF4:
	add r5, r5, #1
	add r4, r4, #0x32
_027F4BFC:
	cmp r5, #4
	blo _027F4BBC
	cmp r6, #4
	movne r5, r6
	bne _027F4C1C
	cmp r7, #4
	movne r5, r7
	beq _027F4CB4
_027F4C1C:
	ldr r0, _027F4CBC ; =0x0380FFF4
	mov r2, #0x32
	mul r4, r5, r2
	ldr r0, [r0]
	add r5, r0, #0x23c
	add r6, r5, r4
	mov r1, r6
	mov r0, #0
	bl sub_037FDF74
	mov r0, #0x400
	strh r0, [r6, #0x30]
	ldrh r1, [sl, #0x12]
	add r0, r6, #6
	and r1, r1, #0xff
	strh r1, [r5, r4]
	strh fp, [r6, #2]
	add r1, sl, #0x24
	bl sub_027EA0E0
	add r0, sb, #1
	bl sub_027EAD50
	strh r0, [r6, #0xc]
	mov r7, #0
	add r5, sb, #2
	add r4, r6, #0xe
	b _027F4C98
_027F4C80:
	add r0, r5, r7
	bl sub_027EAD50
	mov r1, r0
	add r0, r4, r7
	bl sub_027EAD24
	add r7, r7, #1
_027F4C98:
	ldrh r0, [r6, #0xc]
	cmp r7, r0
	blo _027F4C80
	ldrh r0, [sl, #0x34]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x36]
	strh r0, [r6, #4]
_027F4CB4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_027F4CBC: .word 0x0380FFF4
	arm_func_end sub_027F4B7C

	arm_func_start sub_027F4CC0
sub_027F4CC0: ; 0x027F4CC0
	ldr r1, _027F4CDC ; =0x0380FFF4
	ldr ip, _027F4CE0 ; =sub_037FDF74
	ldr r1, [r1]
	mov r0, #0
	mov r2, #0xc8
	add r1, r1, #0x23c
	bx ip
	.align 2, 0
_027F4CDC: .word 0x0380FFF4
_027F4CE0: .word sub_037FDF74
	arm_func_end sub_027F4CC0

	arm_func_start sub_027F4CE4
sub_027F4CE4: ; 0x027F4CE4
	ldr r0, _027F4D28 ; =0x0380FFF4
	mov r3, #0
	ldr r0, [r0]
	add r2, r0, #0x23c
	mov r0, r3
_027F4CF8:
	ldrh r1, [r2, #0x30]
	cmp r1, #0
	beq _027F4D18
	sub r1, r1, #1
	strh r1, [r2, #0x30]
	ldrh r1, [r2, #0x30]
	cmp r1, #0
	streqh r0, [r2]
_027F4D18:
	add r3, r3, #1
	cmp r3, #4
	blo _027F4CF8
	bx lr
	.align 2, 0
_027F4D28: .word 0x0380FFF4
	arm_func_end sub_027F4CE4

	arm_func_start sub_027F4D2C
sub_027F4D2C: ; 0x027F4D2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _027F4DC8 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldr r1, [r0, #0x318]
	ldrh r6, [r1, #2]
	cmp r6, #0xa4
	blo _027F4D58
	ldr r0, _027F4DCC ; =0x000001D6
	cmp r6, r0
	bls _027F4D60
_027F4D58:
	mov r0, #2
	b _027F4DC0
_027F4D60:
	add r7, r1, #2
	mov r5, #0
	b _027F4D90
_027F4D6C:
	mov r0, r7
	bl sub_027EAD50
	mov r1, r5, lsl #0x10
	and r0, r0, #0xff
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	bl sub_027EADE8
	mov r5, r0
	sub r6, r6, #1
_027F4D90:
	cmp r6, #0
	bne _027F4D6C
	ldr r0, _027F4DC8 ; =0x0380FFF4
	cmp r4, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x318]
	ldrh r1, [r0]
	orrne r0, r1, r5, lsl #16
	strne r0, [r4]
	cmp r5, r1
	movne r0, #1
	moveq r0, #0
_027F4DC0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_027F4DC8: .word 0x0380FFF4
_027F4DCC: .word 0x000001D6
	arm_func_end sub_027F4D2C

	arm_func_start sub_027F4DD0
sub_027F4DD0: ; 0x027F4DD0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r4, sp, #0
_027F4DDC:
	mov r0, r4
	bl sub_027F5548
	ldr r0, [sp]
	tst r0, #0x20
	beq _027F4DF8
	bl sub_027F5C84
	b _027F4DDC
_027F4DF8:
	ldr r0, [sp]
	tst r0, #1
	bne _027F4DDC
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F4DD0

	arm_func_start sub_027F4E10
sub_027F4E10: ; 0x027F4E10
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _027F4E6C ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r5, r2
	ldr r1, [r1, #0x318]
	cmp r1, #0
	beq _027F4E64
	add r0, r1, r0
	sub r4, r0, #0x2a
	b _027F4E5C
_027F4E3C:
	mov r0, r4
	bl sub_027EAD50
	mov r1, r0
	mov r0, r5
	add r4, r4, #1
	bl sub_027EAD24
	add r5, r5, #1
	sub r6, r6, #1
_027F4E5C:
	cmp r6, #0
	bne _027F4E3C
_027F4E64:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F4E6C: .word 0x0380FFF4
	arm_func_end sub_027F4E10

	arm_func_start sub_027F4E70
sub_027F4E70: ; 0x027F4E70
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _027F4EBC ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x314]
	mov r4, r2
	bl sub_0380398C
	bl sub_027F4DD0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_027F55B8
	ldr r0, _027F4EBC ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_038039E8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_027F4EBC: .word 0x0380FFF4
	arm_func_end sub_027F4E70

	arm_func_start sub_027F4EC0
sub_027F4EC0: ; 0x027F4EC0
	stmdb sp!, {r3, lr}
	ldr r0, _027F4FA4 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_0380398C
	bl sub_027F4DD0
	mov r3, #0
	add r2, sp, #0
	mov r0, #0x2c
	mov r1, #2
	str r3, [sp]
	bl sub_027F55B8
	ldr r0, _027F4FA4 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_038039E8
	ldr r1, [sp]
	cmp r1, #0xa4
	blo _027F4F18
	ldr r0, _027F4FA8 ; =0x000001D6
	cmp r1, r0
	bls _027F4F20
_027F4F18:
	mov r0, #0
	b _027F4F9C
_027F4F20:
	ldr r0, _027F4FA4 ; =0x0380FFF4
	add r1, r1, #2
	str r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F886C
	ldr r2, _027F4FA4 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x318]
	ldr r1, [r2]
	ldr r0, [r1, #0x318]
	cmp r0, #0
	moveq r0, #0
	beq _027F4F9C
	add r0, r0, #0xc
	str r0, [r1, #0x318]
	ldr r0, [r2]
	ldr r0, [r0, #0x314]
	bl sub_0380398C
	bl sub_027F4DD0
	ldr r0, _027F4FA4 ; =0x0380FFF4
	ldr r1, [sp]
	ldr r2, [r0]
	mov r0, #0x2a
	ldr r2, [r2, #0x318]
	bl sub_027F55B8
	ldr r0, _027F4FA4 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_038039E8
	mov r0, #1
_027F4F9C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027F4FA4: .word 0x0380FFF4
_027F4FA8: .word 0x000001D6
	arm_func_end sub_027F4EC0

	arm_func_start sub_027F4FAC
sub_027F4FAC: ; 0x027F4FAC
	ldr r0, _027F4FD0 ; =_027F8E08
	mov r3, #0
	mov r2, r3
_027F4FB8:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _027F4FB8
	bx lr
	.align 2, 0
_027F4FD0: .word _027F8E08
	arm_func_end sub_027F4FAC

	arm_func_start sub_027F4FD4
sub_027F4FD4: ; 0x027F4FD4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	tst r0, #0x2000000
	beq _027F5004
	ldr r2, _027F5174 ; =_027F8E08
	mov r5, #0
	mov lr, r5
_027F4FF0:
	mov r4, r5, lsl #1
	add r5, r5, #1
	strh lr, [r2, r4]
	cmp r5, #0x10
	blt _027F4FF0
_027F5004:
	ldr r2, _027F5174 ; =_027F8E08
	and r4, r0, #0xf0000
	mov r4, r4, lsr #0x10
	mov r4, r4, lsl #1
	strh r0, [r2, r4]
	tst r0, #0x1000000
	beq _027F5168
	ldr lr, _027F5178 ; =_027F8E08
	ldrh r0, [lr]
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	mov r4, r2, lsr #0x10
	sub r2, r4, #0x22
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _027F513C
_027F5044: ; jump table
	b _027F5070 ; case 0
	b _027F50A8 ; case 1
	b _027F50A8 ; case 2
	b _027F50F0 ; case 3
	b _027F50F0 ; case 4
	b _027F5130 ; case 5
	b _027F5130 ; case 6
	b _027F513C ; case 7
	b _027F513C ; case 8
	b _027F513C ; case 9
	b _027F5070 ; case 10
_027F5070:
	ldrh ip, [lr, #4]
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	and ip, ip, #0xff00
	orr r0, r0, r2, lsl #8
	orr ip, r0, ip, lsr #8
	cmp ip, #0x2000000
	blo _027F5098
	cmp ip, #0x2800000
	blo _027F513C
_027F5098:
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _027F5168
_027F50A8:
	ldrh r2, [lr, #8]
	ldrh r1, [lr, #0xa]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _027F50C4
	cmp ip, #0x2800000
	blo _027F50D4
_027F50C4:
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _027F5168
_027F50D4:
	ldrh r2, [lr, #2]
	mov r3, r0, lsl #0x18
	ldrh r1, [lr, #4]
	ldrh r0, [lr, #6]
	orr r3, r2, r3, lsr #8
	orr r1, r0, r1, lsl #16
	b _027F513C
_027F50F0:
	ldrh r2, [lr, #6]
	ldrh r1, [lr, #8]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _027F510C
	cmp ip, #0x2800000
	blo _027F511C
_027F510C:
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _027F5168
_027F511C:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	ldrh r1, [lr, #4]
	orr r3, r2, r0, lsr #8
	b _027F513C
_027F5130:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	orr r3, r2, r0, lsr #8
_027F513C:
	str r1, [sp]
	mov r1, r4
	mov r0, #1
	mov r2, #3
	str ip, [sp, #4]
	bl sub_03803B7C
	cmp r0, #0
	bne _027F5168
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
_027F5168:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F5174: .word _027F8E08
_027F5178: .word _027F8E08
	arm_func_end sub_027F4FD4

	arm_func_start sub_027F517C
sub_027F517C: ; 0x027F517C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl EnableIrqFlag
	mov r5, r0
	mov r0, #1
	bl sub_03803B0C
	cmp r0, #0
	bne _027F51BC
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	b _027F5448
_027F51BC:
	mov r0, #1
	bl sub_03803B28
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #4]
	sub r0, r0, #0x20
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _027F540C
_027F51E0: ; jump table
	b _027F5218 ; case 0
	b _027F5220 ; case 1
	b _027F5228 ; case 2
	b _027F5234 ; case 3
	b _027F5274 ; case 4
	b _027F52B4 ; case 5
	b _027F52FC ; case 6
	b _027F5344 ; case 7
	b _027F537C ; case 8
	b _027F53B4 ; case 9
	b _027F53BC ; case 10
	b _027F53C4 ; case 11
	b _027F53F8 ; case 12
	b _027F5404 ; case 13
_027F5218:
	bl sub_027F54A4
	b _027F542C
_027F5220:
	bl sub_027F5508
	b _027F542C
_027F5228:
	ldr r0, [r4, #0x10]
	bl sub_027F5548
	b _027F542C
_027F5234:
	bl sub_027F5450
	cmp r0, #0
	bne _027F5260
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F5260:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl sub_027F55B8
	b _027F542C
_027F5274:
	bl sub_027F5450
	cmp r0, #0
	bne _027F52A0
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F52A0:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl sub_027F56E0
	b _027F542C
_027F52B4:
	bl sub_027F5474
	cmp r0, #0
	bne _027F52E0
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F52E0:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl sub_027F5800
	b _027F542C
_027F52FC:
	bl sub_027F5474
	cmp r0, #0
	bne _027F5328
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F5328:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl sub_027F590C
	b _027F542C
_027F5344:
	bl sub_027F5474
	cmp r0, #0
	bne _027F5370
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F5370:
	ldr r0, [r4, #8]
	bl sub_027F5A18
	b _027F542C
_027F537C:
	bl sub_027F5474
	cmp r0, #0
	bne _027F53A8
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F53A8:
	ldr r0, [r4, #8]
	bl sub_027F5AA0
	b _027F542C
_027F53B4:
	bl sub_027F5B28
	b _027F542C
_027F53BC:
	bl sub_027F5B68
	b _027F542C
_027F53C4:
	bl sub_027F5474
	cmp r0, #0
	bne _027F53F0
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
	b _027F5448
_027F53F0:
	bl sub_027F5BA8
	b _027F542C
_027F53F8:
	ldr r0, [r4, #0x10]
	bl sub_027F5BE8
	b _027F542C
_027F5404:
	bl sub_027F5C84
	b _027F542C
_027F540C:
	mov r0, #1
	bl sub_03803B40
	ldr r0, [r4, #4]
	mov r1, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	b _027F5448
_027F542C:
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #1
	bl sub_03803B40
_027F5448:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_027F517C

	arm_func_start sub_027F5450
sub_027F5450: ; 0x027F5450
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_027F5548
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027F5450

	arm_func_start sub_027F5474
sub_027F5474: ; 0x027F5474
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_027F5548
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _027F549C
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_027F549C:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027F5474

	arm_func_start sub_027F54A4
sub_027F54A4: ; 0x027F54A4
	ldr r2, _027F54DC ; =0x040001C0
_027F54A8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F54A8
	ldr r0, _027F54E0 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #6
	strh r1, [r0]
	sub r1, r0, #2
_027F54CC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F54CC
	bx lr
	.align 2, 0
_027F54DC: .word 0x040001C0
_027F54E0: .word 0x040001C2
	arm_func_end sub_027F54A4

	arm_func_start sub_027F54E4
sub_027F54E4: ; 0x027F54E4
	ldr r1, _027F5504 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_027F54F4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F54F4
	bx lr
	.align 2, 0
_027F5504: .word 0x040001C2
	arm_func_end sub_027F54E4

	arm_func_start sub_027F5508
sub_027F5508: ; 0x027F5508
	ldr r2, _027F5540 ; =0x040001C0
_027F550C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F550C
	ldr r0, _027F5544 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #4
	strh r1, [r0]
	sub r1, r0, #2
_027F5530:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F5530
	bx lr
	.align 2, 0
_027F5540: .word 0x040001C0
_027F5544: .word 0x040001C2
	arm_func_end sub_027F5508

	arm_func_start sub_027F5548
sub_027F5548: ; 0x027F5548
	ldr r3, _027F55B0 ; =0x040001C0
_027F554C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _027F554C
	ldr r1, _027F55B4 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_027F5570:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _027F5570
	ldr r1, _027F55B4 ; =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_027F5594:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F5594
	ldr r1, _027F55B4 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_027F55B0: .word 0x040001C0
_027F55B4: .word 0x040001C2
	arm_func_end sub_027F5548

	arm_func_start sub_027F55B8
sub_027F55B8: ; 0x027F55B8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _027F56A8
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _027F56B4 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_027F55F0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F55F0
	ldr r4, _027F56B8 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_027F561C:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _027F561C
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _027F561C
	ldr r2, _027F56B4 ; =0x040001C0
_027F5648:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5648
	mov r4, #0
	ldr r2, _027F56B4 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _027F5684
_027F5668:
	strh r3, [r2, #2]
_027F566C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F566C
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_027F5684:
	cmp r4, r0
	blo _027F5668
	ldr r0, _027F56B4 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_027F56BC
	ldr r0, _027F56B8 ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_027F56A8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F56B4: .word 0x040001C0
_027F56B8: .word 0x040001C2
	arm_func_end sub_027F55B8

	arm_func_start sub_027F56BC
sub_027F56BC: ; 0x027F56BC
	ldr r0, _027F56DC ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_027F56CC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F56CC
	bx lr
	.align 2, 0
_027F56DC: .word 0x040001C2
	arm_func_end sub_027F56BC

	arm_func_start sub_027F56E0
sub_027F56E0: ; 0x027F56E0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _027F57EC
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _027F57F8 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_027F5718:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5718
	ldr r4, _027F57FC ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_027F5744:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _027F5744
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _027F5744
	ldr r2, _027F57F8 ; =0x040001C0
_027F5770:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5770
	ldr r0, _027F57FC ; =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_027F578C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F578C
	mov r4, #0
	ldr r2, _027F57F8 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _027F57C8
_027F57AC:
	strh r3, [r2, #2]
_027F57B0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F57B0
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_027F57C8:
	cmp r4, r0
	blo _027F57AC
	ldr r0, _027F57F8 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_027F56BC
	ldr r0, _027F57FC ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_027F57EC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F57F8: .word 0x040001C0
_027F57FC: .word 0x040001C2
	arm_func_end sub_027F56E0

	arm_func_start sub_027F5800
sub_027F5800: ; 0x027F5800
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _027F58F8
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _027F5904 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_027F5854:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _027F5854
	ldr lr, _027F5908 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_027F5880:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _027F5880
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _027F5880
	sub r3, r1, #1
	ldr r1, _027F5904 ; =0x040001C0
	mov r4, #0
	b _027F58D0
_027F58B8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F58B8
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_027F58D0:
	cmp r4, r3
	blt _027F58B8
	ldr r1, _027F5904 ; =0x040001C0
_027F58DC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F58DC
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_027F54E4
_027F58F8:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F5904: .word 0x040001C0
_027F5908: .word 0x040001C2
	arm_func_end sub_027F5800

	arm_func_start sub_027F590C
sub_027F590C: ; 0x027F590C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _027F5A04
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _027F5A10 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_027F5960:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _027F5960
	ldr lr, _027F5A14 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_027F598C:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _027F598C
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _027F598C
	sub r3, r1, #1
	ldr r1, _027F5A10 ; =0x040001C0
	mov r4, #0
	b _027F59DC
_027F59C4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F59C4
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_027F59DC:
	cmp r4, r3
	blt _027F59C4
	ldr r1, _027F5A10 ; =0x040001C0
_027F59E8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F59E8
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_027F54E4
_027F5A04:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F5A10: .word 0x040001C0
_027F5A14: .word 0x040001C2
	arm_func_end sub_027F590C

	arm_func_start sub_027F5A18
sub_027F5A18: ; 0x027F5A18
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _027F5A98 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_027F5A40:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _027F5A40
	ldr r1, _027F5A9C ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_027F5A64:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F5A64
	bl sub_027F54E4
	mov r0, r4
	bl sub_027F54E4
	ldr r1, _027F5A98 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_027F54E4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F5A98: .word 0x040001C0
_027F5A9C: .word 0x040001C2
	arm_func_end sub_027F5A18

	arm_func_start sub_027F5AA0
sub_027F5AA0: ; 0x027F5AA0
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _027F5B20 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_027F5AC8:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _027F5AC8
	ldr r1, _027F5B24 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_027F5AEC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F5AEC
	bl sub_027F54E4
	mov r0, r4
	bl sub_027F54E4
	ldr r1, _027F5B20 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_027F54E4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_027F5B20: .word 0x040001C0
_027F5B24: .word 0x040001C2
	arm_func_end sub_027F5AA0

	arm_func_start sub_027F5B28
sub_027F5B28: ; 0x027F5B28
	ldr r2, _027F5B60 ; =0x040001C0
_027F5B2C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5B2C
	ldr r0, _027F5B64 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xb9
	strh r1, [r0]
	sub r1, r0, #2
_027F5B50:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F5B50
	bx lr
	.align 2, 0
_027F5B60: .word 0x040001C0
_027F5B64: .word 0x040001C2
	arm_func_end sub_027F5B28

	arm_func_start sub_027F5B68
sub_027F5B68: ; 0x027F5B68
	ldr r2, _027F5BA0 ; =0x040001C0
_027F5B6C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5B6C
	ldr r0, _027F5BA4 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xab
	strh r1, [r0]
	sub r1, r0, #2
_027F5B90:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F5B90
	bx lr
	.align 2, 0
_027F5BA0: .word 0x040001C0
_027F5BA4: .word 0x040001C2
	arm_func_end sub_027F5B68

	arm_func_start sub_027F5BA8
sub_027F5BA8: ; 0x027F5BA8
	ldr r2, _027F5BE0 ; =0x040001C0
_027F5BAC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5BAC
	ldr r0, _027F5BE4 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xc7
	strh r1, [r0]
	sub r1, r0, #2
_027F5BD0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F5BD0
	bx lr
	.align 2, 0
_027F5BE0: .word 0x040001C0
_027F5BE4: .word 0x040001C2
	arm_func_end sub_027F5BA8

	arm_func_start sub_027F5BE8
sub_027F5BE8: ; 0x027F5BE8
	stmdb sp!, {r3, lr}
	ldr r3, _027F5C7C ; =0x040001C0
_027F5BF0:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _027F5BF0
	ldr r1, _027F5C80 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0x9f
	strh r2, [r1]
	sub r2, r1, #2
_027F5C14:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F5C14
	ldr r1, _027F5C80 ; =0x040001C2
	mov r2, #0
	strh r2, [r1]
	sub lr, r1, #2
_027F5C30:
	ldrh r1, [lr]
	tst r1, #0x80
	bne _027F5C30
	ldr ip, _027F5C80 ; =0x040001C2
	mov r2, #0x8100
	ldrh r3, [ip]
	mov r1, #0
	strb r3, [r0]
	strh r2, [lr]
	strh r1, [ip]
	sub r2, ip, #2
_027F5C5C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _027F5C5C
	ldr r1, _027F5C80 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0, #1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_027F5C7C: .word 0x040001C0
_027F5C80: .word 0x040001C2
	arm_func_end sub_027F5BE8

	arm_func_start sub_027F5C84
sub_027F5C84: ; 0x027F5C84
	ldr r2, _027F5CBC ; =0x040001C0
_027F5C88:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _027F5C88
	ldr r0, _027F5CC0 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_027F5CAC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _027F5CAC
	bx lr
	.align 2, 0
_027F5CBC: .word 0x040001C0
_027F5CC0: .word 0x040001C2
	arm_func_end sub_027F5C84

	arm_func_start sub_027F5CC4
sub_027F5CC4: ; 0x027F5CC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r1, _027F5F00 ; =_027F8E28
	mov r8, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _027F5EF4
	mov r2, #1
	strh r2, [r1]
	add r0, sp, #8
	str r2, [r1, #0x1d8]
	bl sub_027F6B04
	add r0, sp, #0xa
	bl sub_027F6B68
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x18
	movs r1, r1, lsr #0x1f
	bne _027F5D28
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _027F5D28
	ldrh r0, [sp, #0xa]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	beq _027F5D40
_027F5D28:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl sub_027F6B30
_027F5D40:
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _027F5D5C
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _027F5D7C
_027F5D5C:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl sub_027F6B94
_027F5D7C:
	ldr r0, _027F5F04 ; =0x027FFDE8
	bl sub_027F6794
	ldr r0, _027F5F04 ; =0x027FFDE8
	ldr r0, [r0]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl sub_027F65BC
	ldr r1, _027F5F04 ; =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl sub_027F65BC
	ldr r1, _027F5F04 ; =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl sub_027F65BC
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl _u32_div_f
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl _u32_div_f
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl _u32_div_f
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl _u32_div_f
	ldr r0, _027F5F04 ; =0x027FFDE8
	ldr r2, [r0]
	mov r3, r2, lsl #5
	mov r3, r3, lsr #0x1d
	cmp r3, r1
	beq _027F5E58
	bic r2, r2, #0x7000000
	mov r1, r1, lsl #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl sub_027F67C0
_027F5E58:
	mov r0, #1
	bl sub_027F6670
	ldr r0, _027F5F00 ; =_027F8E28
	mov r1, #0
	str r1, [r0, #0x1d8]
	bl sub_037FE2B4
	ldr r1, _027F5F08 ; =sub_027F5F24
	mov r0, #5
	bl sub_037FE39C
	ldr r0, _027F5F0C ; =_027F8E2C
	ldr r1, _027F5F10 ; =_027F8E4C
	mov r2, #4
	bl sub_037FC6AC
	mov r0, #0x100
	stmia sp, {r0, r8}
	ldr r0, _027F5F14 ; =_027F8E5C
	ldr r1, _027F5F18 ; =sub_027F60A8
	ldr r3, _027F5F1C ; =_027F9000
	mov r2, #0
	bl sub_037FC054
	ldr r0, _027F5F14 ; =_027F8E5C
	bl sub_037FC36C
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r0, #0x40
	mov r1, #0
	bl sub_037FE588
	mov r0, #0x100
	mov r1, r0
	bl sub_037FE588
	bl EnableIrqFlag
	mov r4, r0
	ldr r1, _027F5F20 ; =sub_027F652C
	mov r0, #0x80
	bl sub_037FB7BC
	mov r0, #0x80
	bl sub_037FB8F0
	mov r0, r4
	bl SetIrqFlag
_027F5EF4:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_027F5F00: .word _027F8E28
_027F5F04: .word 0x027FFDE8
_027F5F08: .word sub_027F5F24
_027F5F0C: .word _027F8E2C
_027F5F10: .word _027F8E4C
_027F5F14: .word _027F8E5C
_027F5F18: .word sub_027F60A8
_027F5F1C: .word _027F9000
_027F5F20: .word sub_027F652C
	arm_func_end sub_027F5CC4

	arm_func_start sub_027F5F24
sub_027F5F24: ; 0x027F5F24
	stmdb sp!, {r4, lr}
	cmp r2, #0
	bne _027F6054
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #0x29
	addls pc, pc, r4, lsl #2
	b _027F6048
_027F5F48: ; jump table
	b _027F5FF0 ; case 0
	b _027F5FF0 ; case 1
	b _027F6048 ; case 2
	b _027F6048 ; case 3
	b _027F6048 ; case 4
	b _027F6048 ; case 5
	b _027F6048 ; case 6
	b _027F6048 ; case 7
	b _027F6048 ; case 8
	b _027F6048 ; case 9
	b _027F6048 ; case 10
	b _027F6048 ; case 11
	b _027F6048 ; case 12
	b _027F6048 ; case 13
	b _027F6048 ; case 14
	b _027F6048 ; case 15
	b _027F5FF0 ; case 16
	b _027F5FF0 ; case 17
	b _027F5FF0 ; case 18
	b _027F5FF0 ; case 19
	b _027F5FF0 ; case 20
	b _027F5FF0 ; case 21
	b _027F5FF0 ; case 22
	b _027F5FF0 ; case 23
	b _027F5FF0 ; case 24
	b _027F5FF0 ; case 25
	b _027F6048 ; case 26
	b _027F6048 ; case 27
	b _027F6048 ; case 28
	b _027F6048 ; case 29
	b _027F6048 ; case 30
	b _027F6048 ; case 31
	b _027F6048 ; case 32
	b _027F6048 ; case 33
	b _027F6048 ; case 34
	b _027F5FF0 ; case 35
	b _027F5FF0 ; case 36
	b _027F5FF0 ; case 37
	b _027F5FF0 ; case 38
	b _027F5FF0 ; case 39
	b _027F5FF0 ; case 40
	b _027F5FF0 ; case 41
_027F5FF0:
	ldr r0, _027F605C ; =_027F8E28
	ldr r1, [r0, #0x1d8]
	cmp r1, #0
	beq _027F6010
	mov r0, r4
	mov r1, #3
	bl sub_027F6068
	b _027F6054
_027F6010:
	ldr r3, _027F6060 ; =_027F8F28
	mov r1, #1
	str r1, [r0, #0x1d8]
	mov r1, #0
	ldr r0, _027F6064 ; =_027F8E2C
	mov r2, r1
	strh r4, [r3, #0xdc]
	bl sub_037FC6D4
	cmp r0, #0
	bne _027F6054
	mov r0, r4
	mov r1, #4
	bl sub_027F6068
	b _027F6054
_027F6048:
	mov r0, r4
	mov r1, #1
	bl sub_027F6068
_027F6054:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_027F605C: .word _027F8E28
_027F6060: .word _027F8F28
_027F6064: .word _027F8E2C
	arm_func_end sub_027F5F24

	arm_func_start sub_027F6068
sub_027F6068: ; 0x027F6068
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, r0, lsl #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_027F6088:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	blt _027F6088
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_027F6068

	arm_func_start sub_027F60A8
sub_027F60A8: ; 0x027F60A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr sb, _027F651C ; =0x027FFDE8
	mov r8, #0
	ldr r4, _027F6520 ; =_027F8E28
	mov r7, r8
	mov r6, r8
	mov r5, r8
	mov sl, r8
	mov fp, r8
_027F60CC:
	ldr r0, _027F6524 ; =_027F8E2C
	add r1, sp, #0
	mov r2, #1
	bl sub_037FC760
	ldr r0, _027F6528 ; =_027F8F28
	ldrh r0, [r0, #0xdc]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _027F6508
_027F60F0: ; jump table
	b _027F6198 ; case 0
	b _027F61B0 ; case 1
	b _027F6508 ; case 2
	b _027F6508 ; case 3
	b _027F6508 ; case 4
	b _027F6508 ; case 5
	b _027F6508 ; case 6
	b _027F6508 ; case 7
	b _027F6508 ; case 8
	b _027F6508 ; case 9
	b _027F6508 ; case 10
	b _027F6508 ; case 11
	b _027F6508 ; case 12
	b _027F6508 ; case 13
	b _027F6508 ; case 14
	b _027F6508 ; case 15
	b _027F61D8 ; case 16
	b _027F61F8 ; case 17
	b _027F6218 ; case 18
	b _027F6238 ; case 19
	b _027F6274 ; case 20
	b _027F62B0 ; case 21
	b _027F62EC ; case 22
	b _027F630C ; case 23
	b _027F632C ; case 24
	b _027F634C ; case 25
	b _027F6508 ; case 26
	b _027F6508 ; case 27
	b _027F6508 ; case 28
	b _027F6508 ; case 29
	b _027F6508 ; case 30
	b _027F6508 ; case 31
	b _027F636C ; case 32
	b _027F638C ; case 33
	b _027F63B4 ; case 34
	b _027F63D4 ; case 35
	b _027F6410 ; case 36
	b _027F644C ; case 37
	b _027F6488 ; case 38
	b _027F64A8 ; case 39
	b _027F64C8 ; case 40
	b _027F64E8 ; case 41
_027F6198:
	bl sub_027F662C
	mov r0, #0
	mov r1, r0
	str r0, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F61B0:
	ldrh r0, [sb]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	bl sub_027F6670
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #1
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F61D8:
	mov r0, sb
	bl sub_027F6794
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x10
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F61F8:
	mov r0, sb
	bl sub_027F67F8
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x11
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6218:
	add r0, sb, #4
	bl sub_027F6824
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x12
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6238:
	add r0, sb, #4
	bl sub_027F6888
	cmp r0, #0
	bne _027F625C
	mov r0, #0x13
	mov r1, #2
	str r8, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F625C:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x13
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6274:
	add r0, sb, #4
	bl sub_027F6964
	cmp r0, #0
	bne _027F6298
	mov r0, #0x14
	mov r1, #2
	str r7, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F6298:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x14
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F62B0:
	add r0, sb, #4
	bl sub_027F6A38
	cmp r0, #0
	bne _027F62D4
	mov r0, #0x15
	mov r1, #2
	str r6, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F62D4:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x15
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F62EC:
	mov r0, sb
	bl sub_027F6B04
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x16
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F630C:
	add r0, sb, #2
	bl sub_027F6B68
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x17
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F632C:
	add r0, sb, #4
	bl sub_027F6BCC
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x18
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F634C:
	add r0, sb, #4
	bl sub_027F6C30
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x19
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F636C:
	mov r0, sb
	bl sub_027F67C0
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x20
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F638C:
	add r0, sb, #4
	bl sub_027F6824
	mov r0, sb
	bl sub_027F67C0
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x21
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F63B4:
	add r0, sb, #4
	bl sub_027F6850
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x22
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F63D4:
	add r0, sb, #4
	bl sub_027F68F0
	cmp r0, #0
	bne _027F63F8
	mov r0, #0x23
	mov r1, #2
	str r5, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F63F8:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x23
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6410:
	add r0, sb, #4
	bl sub_027F69C8
	cmp r0, #0
	bne _027F6434
	mov r0, #0x24
	mov r1, #2
	str sl, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F6434:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x24
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F644C:
	add r0, sb, #4
	bl sub_027F6A98
	cmp r0, #0
	bne _027F6470
	mov r0, #0x25
	mov r1, #2
	str fp, [r4, #0x1d8]
	bl sub_027F6068
	b _027F60CC
_027F6470:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x25
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6488:
	mov r0, sb
	bl sub_027F6B30
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x26
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F64A8:
	add r0, sb, #2
	bl sub_027F6B94
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x27
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F64C8:
	add r0, sb, #4
	bl sub_027F6BF8
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x28
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F64E8:
	add r0, sb, #4
	bl sub_027F6C5C
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x29
	mov r1, #0
	bl sub_027F6068
	b _027F60CC
_027F6508:
	mov r1, #0
	str r1, [r4, #0x1d8]
	mov r1, #1
	bl sub_027F6068
	b _027F60CC
	.align 2, 0
_027F651C: .word 0x027FFDE8
_027F6520: .word _027F8E28
_027F6524: .word _027F8E2C
_027F6528: .word _027F8F28
	arm_func_end sub_027F60A8

	arm_func_start sub_027F652C
sub_027F652C: ; 0x027F652C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl sub_027F6B04
	ldrh r0, [sp, #2]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _027F6558
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _027F65B0
_027F6558:
	add r0, sp, #0
	bl sub_027F6B68
	ldrh r0, [sp, #2]
	mov r4, #0
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #1
	bicne r0, r0, #0xf
	strneh r0, [sp]
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #2
	bicne r0, r0, #0x40
	strneh r0, [sp]
	add r0, sp, #0
	bl sub_027F6B94
	mov r1, r4
	mov r0, #0x30
	bl sub_027F6068
_027F65B0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F652C

	arm_func_start sub_027F65BC
sub_027F65BC: ; 0x027F65BC
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r2, ip
	b _027F65E8
_027F65CC:
	mov r1, r2, lsl #2
	mov r1, r0, lsr r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _027F6624
	add r2, r2, #1
_027F65E8:
	cmp r2, #8
	blt _027F65CC
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_027F65FC:
	mov r1, r4, lsl #2
	mov r1, r0, lsr r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _027F65FC
	mov r0, ip
_027F6624:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F65BC

	arm_func_start sub_027F662C
sub_027F662C: ; 0x027F662C
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_037FE5A8
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0
	bl sub_027F6F84
	add r0, sp, #0
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_027F662C

	arm_func_start sub_027F6670
sub_027F6670: ; 0x027F6670
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _027F6788
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r1, r0, lsl #0x1e
	mov r1, r1, lsr #0x1f
	cmp r1, r4
	beq _027F6788
	bic r1, r0, #2
	mov r0, r4, lsl #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0
	bl sub_027F6F84
	add r0, sp, #0
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl sub_027F6EB4
	cmp r4, #0
	add r0, sp, #4
	bne _027F6718
	bl sub_027F6C94
	b _027F671C
_027F6718:
	bl sub_027F6DA4
_027F671C:
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x10
	bl sub_027F6F84
	add r0, sp, #4
	mov r1, #3
	bl sub_027F7004
	bl sub_027F6F50
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl sub_027F6EB4
	cmp r4, #0
	add r0, sp, #4
	bne _027F6764
	bl sub_027F6C94
	b _027F6768
_027F6764:
	bl sub_027F6DA4
_027F6768:
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x50
	bl sub_027F6F84
	add r0, sp, #4
	mov r1, #3
	bl sub_027F7004
	bl sub_027F6F50
_027F6788:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6670

	arm_func_start sub_027F6794
sub_027F6794: ; 0x027F6794
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6794

	arm_func_start sub_027F67C0
sub_027F67C0: ; 0x027F67C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x20
	bl sub_027F6F84
	mov r0, r4
	mov r1, #7
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F67C0

	arm_func_start sub_027F67F8
sub_027F67F8: ; 0x027F67F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F67F8

	arm_func_start sub_027F6824
sub_027F6824: ; 0x027F6824
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6824

	arm_func_start sub_027F6850
sub_027F6850: ; 0x027F6850
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x60
	bl sub_027F6F84
	mov r0, r4
	mov r1, #3
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6850

	arm_func_start sub_027F6888
sub_027F6888: ; 0x027F6888
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _027F68E4
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl sub_027F6EB4
	mov r0, #1
_027F68E4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F6888

	arm_func_start sub_027F68F0
sub_027F68F0: ; 0x027F68F0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _027F6958
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x10
	bl sub_027F6F84
	mov r0, r4
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	mov r0, #1
_027F6958:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F68F0

	arm_func_start sub_027F6964
sub_027F6964: ; 0x027F6964
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _027F69BC
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl sub_027F6EB4
	mov r0, #1
_027F69BC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F6964

	arm_func_start sub_027F69C8
sub_027F69C8: ; 0x027F69C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _027F6A2C
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x10
	bl sub_027F6F84
	mov r0, r4
	mov r1, #3
	bl sub_027F7004
	bl sub_027F6F50
	mov r0, #1
_027F6A2C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F69C8

	arm_func_start sub_027F6A38
sub_027F6A38: ; 0x027F6A38
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _027F6A8C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl sub_027F6EB4
	mov r0, #1
_027F6A8C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F6A38

	arm_func_start sub_027F6A98
sub_027F6A98: ; 0x027F6A98
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _027F6AF8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x50
	bl sub_027F6F84
	mov r0, r4
	mov r1, #3
	bl sub_027F7004
	bl sub_027F6F50
	mov r0, #1
_027F6AF8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_027F6A98

	arm_func_start sub_027F6B04
sub_027F6B04: ; 0x027F6B04
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6B04

	arm_func_start sub_027F6B30
sub_027F6B30: ; 0x027F6B30
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0
	bl sub_027F6F84
	mov r0, r4
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6B30

	arm_func_start sub_027F6B68
sub_027F6B68: ; 0x027F6B68
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6B68

	arm_func_start sub_027F6B94
sub_027F6B94: ; 0x027F6B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x40
	bl sub_027F6F84
	mov r0, r4
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6B94

	arm_func_start sub_027F6BCC
sub_027F6BCC: ; 0x027F6BCC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6BCC

	arm_func_start sub_027F6BF8
sub_027F6BF8: ; 0x027F6BF8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x30
	bl sub_027F6F84
	mov r0, r4
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6BF8

	arm_func_start sub_027F6C30
sub_027F6C30: ; 0x027F6C30
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl sub_027F6EB4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6C30

	arm_func_start sub_027F6C5C
sub_027F6C5C: ; 0x027F6C5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FE5A8
	bl sub_027F6F10
	mov r0, #6
	mov r1, #0x70
	bl sub_027F6F84
	mov r0, r4
	mov r1, #1
	bl sub_027F7004
	bl sub_027F6F50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_027F6C5C

	arm_func_start sub_027F6C94
sub_027F6C94: ; 0x027F6C94
	ldr r1, [r0]
	mov r2, r1, lsl #0x12
	mov r2, r2, lsr #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _027F6D90
_027F6CAC: ; jump table
	b _027F6D3C ; case 0
	b _027F6D3C ; case 1
	b _027F6D3C ; case 2
	b _027F6D3C ; case 3
	b _027F6D3C ; case 4
	b _027F6D3C ; case 5
	b _027F6D3C ; case 6
	b _027F6D3C ; case 7
	b _027F6D3C ; case 8
	b _027F6D3C ; case 9
	b _027F6D90 ; case 10
	b _027F6D90 ; case 11
	b _027F6D90 ; case 12
	b _027F6D90 ; case 13
	b _027F6D90 ; case 14
	b _027F6D90 ; case 15
	b _027F6D3C ; case 16
	b _027F6D3C ; case 17
	b _027F6D48 ; case 18
	b _027F6D48 ; case 19
	b _027F6D48 ; case 20
	b _027F6D48 ; case 21
	b _027F6D48 ; case 22
	b _027F6D48 ; case 23
	b _027F6D48 ; case 24
	b _027F6D48 ; case 25
	b _027F6D90 ; case 26
	b _027F6D90 ; case 27
	b _027F6D90 ; case 28
	b _027F6D90 ; case 29
	b _027F6D90 ; case 30
	b _027F6D90 ; case 31
	b _027F6D6C ; case 32
	b _027F6D6C ; case 33
	b _027F6D48 ; case 34
	b _027F6D48 ; case 35
_027F6D3C:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_027F6D48:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_027F6D6C:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_027F6D90:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_027F6C94

	arm_func_start sub_027F6DA4
sub_027F6DA4: ; 0x027F6DA4
	ldr r2, [r0]
	mov r1, r2, lsl #0x12
	mov r3, r1, lsr #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _027F6EA0
_027F6DBC: ; jump table
	b _027F6E4C ; case 0
	b _027F6E4C ; case 1
	b _027F6E4C ; case 2
	b _027F6E4C ; case 3
	b _027F6E4C ; case 4
	b _027F6E4C ; case 5
	b _027F6E4C ; case 6
	b _027F6E4C ; case 7
	b _027F6E70 ; case 8
	b _027F6E70 ; case 9
	b _027F6EA0 ; case 10
	b _027F6EA0 ; case 11
	b _027F6EA0 ; case 12
	b _027F6EA0 ; case 13
	b _027F6EA0 ; case 14
	b _027F6EA0 ; case 15
	b _027F6E4C ; case 16
	b _027F6E4C ; case 17
	b _027F6E94 ; case 18
	b _027F6E94 ; case 19
	b _027F6E94 ; case 20
	b _027F6E94 ; case 21
	b _027F6E94 ; case 22
	b _027F6E94 ; case 23
	b _027F6E94 ; case 24
	b _027F6E94 ; case 25
	b _027F6EA0 ; case 26
	b _027F6EA0 ; case 27
	b _027F6EA0 ; case 28
	b _027F6EA0 ; case 29
	b _027F6EA0 ; case 30
	b _027F6EA0 ; case 31
	b _027F6E94 ; case 32
	b _027F6E94 ; case 33
	b _027F6E94 ; case 34
	b _027F6E94 ; case 35
_027F6E4C:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_027F6E70:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_027F6E94:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_027F6EA0:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_027F6DA4

	arm_func_start sub_027F6EB4
sub_027F6EB4: ; 0x027F6EB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_027F6F10
	mov r0, r7
	mov r1, r6
	bl sub_027F6F84
	cmp r7, #6
	beq _027F6EF8
	cmp r7, #0x86
	bne _027F6F04
	mov r0, r5
	mov r1, r4
	bl sub_027F70BC
	b _027F6F04
_027F6EF8:
	mov r0, r5
	mov r1, r4
	bl sub_027F7004
_027F6F04:
	bl sub_027F6F50
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_027F6EB4

	arm_func_start sub_027F6F10
sub_027F6F10: ; 0x027F6F10
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_027F6F2C:
	subs r3, r3, #1
	bne _027F6F2C
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_027F6F44:
	subs r3, r3, #1
	bne _027F6F44
	bx lr
	arm_func_end sub_027F6F10

	arm_func_start sub_027F6F50
sub_027F6F50: ; 0x027F6F50
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_027F6F5C:
	subs r3, r3, #1
	bne _027F6F5C
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_027F6F78:
	subs r3, r3, #1
	bne _027F6F78
	bx lr
	arm_func_end sub_027F6F50

	arm_func_start sub_027F6F84
sub_027F6F84: ; 0x027F6F84
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_027F6FA0:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	bne _027F6FB8
	b _027F6FBC
_027F6FB8:
	mov r3, #1
_027F6FBC:
	beq _027F6FC4
	b _027F6FC8
_027F6FC4:
	mov r3, #0
_027F6FC8:
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_027F6FD4:
	subs r3, r3, #1
	bne _027F6FD4
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_027F6FEC:
	subs r3, r3, #1
	bne _027F6FEC
	add r2, r2, #1
	cmp r2, #8
	bne _027F6FA0
	bx lr
	arm_func_end sub_027F6F84

	arm_func_start sub_027F7004
sub_027F7004: ; 0x027F7004
	mov ip, #0x4000000
	add ip, ip, #0x138
_027F700C:
	stmdb sp!, {r0, r1}
	tst r0, #1
	beq _027F701C
	b _027F7020
_027F701C:
	ldrh r1, [r0]
_027F7020:
	bne _027F7028
	b _027F702C
_027F7028:
	ldrh r1, [r0, #-1]
_027F702C:
	bne _027F7034
	b _027F7038
_027F7034:
	mov r1, r1, lsr #8
_027F7038:
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_027F7048:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	bne _027F7060
	b _027F7064
_027F7060:
	mov r3, #1
_027F7064:
	beq _027F706C
	b _027F7070
_027F706C:
	mov r3, #0
_027F7070:
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_027F707C:
	subs r3, r3, #1
	bne _027F707C
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_027F7094:
	subs r3, r3, #1
	bne _027F7094
	add r2, r2, #1
	cmp r2, #8
	bne _027F7048
	ldmia sp!, {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _027F700C
	bx lr
	arm_func_end sub_027F7004

	arm_func_start sub_027F70BC
sub_027F70BC: ; 0x027F70BC
	mov ip, #0x4000000
	add ip, ip, #0x138
_027F70C4:
	stmdb sp!, {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_027F70DC:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_027F70EC:
	subs r3, r3, #1
	bne _027F70EC
	ldrh r0, [ip]
	and r3, r0, #1
	cmp r3, #1
	beq _027F7108
	b _027F710C
_027F7108:
	mov r3, #0x80
_027F710C:
	bne _027F7114
	b _027F7118
_027F7114:
	mov r3, #0
_027F7118:
	orr r2, r3, r2, lsr #1
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_027F712C:
	subs r3, r3, #1
	bne _027F712C
	add r1, r1, #1
	cmp r1, #8
	bne _027F70DC
	ldmia sp!, {r0, r1}
	tst r0, #1
	beq _027F7164
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	mov r2, r2, lsl #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _027F7174
_027F7164:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_027F7174:
	add r0, r0, #1
	subs r1, r1, #1
	bne _027F70C4
	bx lr
	arm_func_end sub_027F70BC
	; 0x027F7184

	.rodata
	.global _027F7184
_027F7184:
	.word sub_027E29F0
	.word sub_027E2A90
	.word sub_027E2EA0
	.word sub_027E7DF8
	.word sub_027E7FF4
	.word sub_027E805C
	.word sub_027E8314
	.word sub_027E2F50
	.word sub_027E3010
	.word sub_027E32D8
	.word sub_027E34D0
	.word sub_027E3DBC
	.word sub_027E3EC4
	.word sub_027E44A4
	.word sub_027E4BD4
	.word sub_027E4F68
	.word sub_027E50A4
	.word sub_027E51F4
	.word sub_027E5280
	.word sub_027E5378
	.word sub_027E5434
	.word sub_027E1D64
	.word sub_027E1D64
	.word sub_027E1D64
	.word sub_027E55D4
	.word sub_027E56C8
	.word sub_027E573C
	.word sub_027E5760
	.word sub_027E6140
	.word sub_027E5784
	.word sub_027E58B0
	.word sub_027E5A8C
	.word sub_027E5AF4
	.word sub_027E7CBC
	.word sub_027E7D4C
	.word sub_027E83C0
	.word sub_027E8740
	.word sub_027E87B8
	.word sub_027E3860
	.word sub_027E54DC
	.word sub_027E87CC
	.word sub_027E894C
	.word sub_027E8970
	.word sub_027E62E0
	.word sub_027E6314
	.word sub_027E633C
	.global _027F723C
_027F723C:
	.word sub_027ED214
	.word sub_027ED468
	.word sub_027ED544
	.word sub_027ED668
	.word sub_027ED764
	.word sub_027ED858
	.word sub_027F2174
	.word sub_027F3F34
	.word sub_037FA728
	.word sub_027F45E8
	.word sub_027EC274
	.word sub_037F8A88
	.word sub_037F86C8
	.word sub_027EDAF4
	.word sub_037FA774
	.word sub_037FA948
	.word sub_037FACB4
	.word sub_027F4B10
	.word sub_027F4CE4
	.word sub_027EC684
	.word sub_037FAD90
	.word sub_027EB0B0
	.word sub_027EB130
	.word sub_027EB1D0
	.global _027F729C
_027F729C:
	.byte 0x03, 0x00, 0x03, 0x00
	.global _027F72A0
_027F72A0:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _027F72C0
_027F72C0:
	.byte 0x00, 0x00, 0x01, 0xCC
	.byte 0x01, 0xD8, 0x00, 0x14, 0x01, 0xF0, 0x00, 0x3C, 0x00, 0x28, 0x01, 0xE4, 0x01, 0xA0, 0x00, 0x6C
	.byte 0x00, 0x78, 0x01, 0xB4, 0x00, 0x50, 0x01, 0x9C, 0x01, 0x88, 0x00, 0x44
	.global _027F72E0
_027F72E0:
	.byte 0x46, 0x01, 0x48, 0x01
	.byte 0x4A, 0x01, 0x4C, 0x01, 0x20, 0x01, 0x22, 0x01, 0x54, 0x01, 0x44, 0x01, 0x32, 0x01, 0x32, 0x01
	.byte 0x40, 0x01, 0x42, 0x01, 0x38, 0x00, 0x24, 0x01, 0x28, 0x01, 0x50, 0x01
	.global _027F7300
_027F7300:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _027F7350
_027F7350:
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x10, 0x00, 0xFF, 0xFF
	.byte 0x54, 0x02, 0x00, 0x00, 0xB4, 0x00, 0xFF, 0xFF, 0x80, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x01, 0x00
	.byte 0x88, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x00, 0x00
	.byte 0xEA, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x01, 0x00, 0xEC, 0x00, 0x03, 0x3F, 0xA2, 0x01, 0x01, 0x00
	.byte 0xA0, 0x01, 0x00, 0x00, 0x10, 0x01, 0x00, 0x08, 0xBC, 0x00, 0x01, 0x00, 0xD4, 0x00, 0x03, 0x00
	.byte 0xD8, 0x00, 0x04, 0x00, 0xDA, 0x00, 0x02, 0x06, 0x76, 0x00, 0x00, 0x00, 0x30, 0x01, 0x46, 0x01
	.global _027F73B4
_027F73B4:
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x01, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0x02, 0x00, 0x03, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0x04, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x05, 0x00, 0xFF, 0x00, 0x06, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x07, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x08, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x09, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0A, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0B, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.global _027F74A4
_027F74A4:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.global _027F74AC
_027F74AC:
	.byte 0x03, 0x09, 0xBF, 0x00, 0x00, 0x10, 0x00, 0x00
	.global _027F74B4
_027F74B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _027F74BC
_027F74BC:
	.byte 0x03, 0x09, 0xBF, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _027F74C4
_027F74C4:
	.byte 0x02, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x12, 0x00, 0x16, 0x00, 0x18, 0x00, 0x24, 0x00
	.byte 0x30, 0x00, 0x48, 0x00, 0x60, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _027F74E4
_027F74E4:
	.byte 0xFF, 0xFF, 0x5A, 0x5A, 0xA5, 0xA5
	.global _027F74EA
_027F74EA:
	.byte 0x02, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00, 0x26, 0x00, 0x29, 0x00
	.byte 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00
	.byte 0x36, 0x00, 0x37, 0x00, 0x65, 0x00, 0x00, 0x00
	.global _027F751C
_027F751C:
	.byte 0x00, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x14, 0x00
	.byte 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x27, 0x00, 0x4D, 0x00
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x64, 0x00, 0x66, 0x00, 0x00, 0x00
	.global _027F7554
_027F7554:
	.byte 0x06, 0x00, 0x3F, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0x1A, 0x00, 0xFF, 0xFF, 0x1C, 0x00, 0xFF, 0xFF
	.byte 0x20, 0x00, 0xFF, 0xFF, 0x22, 0x00, 0xFF, 0xFF, 0x24, 0x00, 0xFF, 0xFF, 0x2A, 0x00, 0xFF, 0x07
	.byte 0x50, 0x00, 0xFF, 0xFF, 0x52, 0x00, 0xFF, 0xFF, 0x56, 0x00, 0xFE, 0x0F, 0x58, 0x00, 0xFE, 0x1F
	.byte 0x5A, 0x00, 0xFE, 0x0F, 0x5C, 0x00, 0xFF, 0x0F, 0x62, 0x00, 0xFE, 0x1F, 0x64, 0x00, 0xFF, 0x0F
	.byte 0x68, 0x00, 0xFE, 0x1F, 0x6C, 0x00, 0xFF, 0x0F, 0x74, 0x00, 0xFE, 0x1F, 0x22, 0x01, 0xFF, 0xFF
	.byte 0x24, 0x01, 0xFF, 0xFF, 0x28, 0x01, 0xFF, 0xFF, 0x30, 0x01, 0xFF, 0x0F, 0x32, 0x01, 0xFF, 0x8F
	.byte 0x34, 0x01, 0xFF, 0xFF, 0x40, 0x01, 0xFF, 0xFF, 0x42, 0x01, 0xFF, 0xFF
	.global _027F75C0
_027F75C0:
	.byte 0x18, 0x00, 0x02, 0x00
	.word sub_027EF5EC
	.byte 0x04, 0x00, 0x01, 0x00
	.word sub_027EF7B8
	.byte 0x0A, 0x00, 0x01, 0x00
	.word sub_027EF95C
	.byte 0x0C, 0x00, 0x01, 0x00
	.word sub_027EFE10
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EFE70
	.global _027F75E8
_027F75E8:
	.byte 0x00, 0x00, 0x04, 0x00
	.word sub_027EED0C
	.byte 0x00, 0x00, 0x12, 0x00
	.word sub_027EED3C
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EED88
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEDB0
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEDD8
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EEE00
	.global _027F7618
_027F7618:
	.byte 0x03, 0x00, 0x01, 0x00
	.word sub_027EE68C
	.byte 0x11, 0x00, 0x01, 0x00
	.word sub_027EE6A4
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE6C4
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE700
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE73C
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EE77C
	.global _027F7648
_027F7648:
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EC700
	.byte 0x03, 0x00, 0x01, 0x00
	.word sub_027EC740
	.byte 0x1F, 0x00, 0x23, 0x00
	.word sub_027EC7EC
	.byte 0x22, 0x00, 0x05, 0x00
	.word sub_027EC92C
	.byte 0x05, 0x00, 0x06, 0x00
	.word sub_027ECAE4
	.byte 0x04, 0x00, 0x04, 0x00
	.word sub_027ECBB8
	.byte 0x05, 0x00, 0x03, 0x00
	.word sub_027ECCEC
	.byte 0x05, 0x00, 0x03, 0x00
	.word sub_027ECDC4
	.byte 0x04, 0x00, 0x01, 0x00
	.word sub_027ECE84
	.byte 0x17, 0x00, 0x01, 0x00
	.word sub_027ECF90
	.byte 0x0C, 0x00, 0x12, 0x00
	.word sub_027ED130
	.global _027F76A0
_027F76A0:
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EC67C
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EEED8
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EEF18
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EEF74
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EEFC8
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EF004
	.byte 0x00, 0x00, 0x09, 0x00
	.word sub_027EF03C
	.byte 0x00, 0x00, 0x5C, 0x00
	.word sub_027EF0E0
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EF13C
	.byte 0x04, 0x00, 0x01, 0x00
	.word sub_027EF164
	.byte 0x02, 0x00, 0x01, 0x00
	.word sub_027EF53C
	.global _027F76F8
_027F76F8:
	.byte 0x00, 0x00, 0x21, 0x00
	.word sub_027EE7E0
	.byte 0x00, 0x00, 0x04, 0x00
	.word sub_027EE918
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EE948
	.byte 0x00, 0x00, 0x03, 0x00
	.word sub_027EE970
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EE9A8
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EE9D0
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EE9F8
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEA20
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EC67C
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEA48
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEA78
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEAA8
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEAD0
	.byte 0x00, 0x00, 0x11, 0x00
	.word sub_027EEAF8
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEB34
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEB64
	.byte 0x00, 0x00, 0x04, 0x00
	.word sub_027EEB8C
	.byte 0x00, 0x00, 0x01, 0x00
	.word sub_027EC67C
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEBCC
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEBF8
	.byte 0x00, 0x00, 0x03, 0x00
	.word sub_027EEC34
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EEC94
	.byte 0x00, 0x00, 0x02, 0x00
	.word sub_027EECD0
	.global _027F77B0
_027F77B0:
	.byte 0x48, 0x00, 0x01, 0x00
	.word sub_027EE0D8
	.byte 0x03, 0x00, 0x01, 0x00
	.word sub_027EE1C4
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE204
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE21C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE25C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE2AC
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE2C4
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE2DC
	.byte 0x28, 0x00, 0x01, 0x00
	.word sub_027EE2F4
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE30C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE34C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE364
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE37C
	.byte 0x10, 0x00, 0x01, 0x00
	.word sub_027EE398
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE3B0
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE3C8
	.byte 0x03, 0x00, 0x01, 0x00
	.word sub_027EE3E0
	.byte 0x03, 0x00, 0x01, 0x00
	.word sub_027EE42C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE534
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE58C
	.byte 0x02, 0x00, 0x01, 0x00
	.word sub_027EE5CC
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE60C
	.byte 0x01, 0x00, 0x01, 0x00
	.word sub_027EE64C
	.global _027F7868
_027F7868:
	.byte 0x32, 0x2E, 0x38, 0x33, 0x2E, 0x30, 0x30, 0x00
	.global _027F7870
_027F7870:
	.byte 0x01, 0x00, 0x04, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

	.bss
	.global _027F7878
_027F7878:
	.space 0x20
	.global _027F7898
_027F7898:
	.space 0x8
	.global _027F78A0
_027F78A0:
	.space 0x20
	.global _027F78C0
_027F78C0:
	.space 0x10
	.global _027F78D0
_027F78D0:
	.space 0x20
	.global _027F78F0
_027F78F0:
	.space 0x10
	.global _027F7900
_027F7900:
	.space 0x20
	.global _027F7920
_027F7920:
	.space 0xF58
	.global _027F8878
_027F8878:
	.space 0x128
	.global _027F89A0
_027F89A0:
	.space 0x400
	.global _027F8DA0
_027F8DA0:
	.space 0x2C
	.global _027F8DCC
_027F8DCC:
	.space 0x3C
	.global _027F8E08
_027F8E08:
	.space 0x20
	.global _027F8E28
_027F8E28:
	.space 0x4
	.global _027F8E2C
_027F8E2C:
	.space 0x20
	.global _027F8E4C
_027F8E4C:
	.space 0x10
	.global _027F8E5C
_027F8E5C:
	.space 0xCC
	.global _027F8F28
_027F8F28:
	.space 0xD8
	.global _027F9000
_027F9000:
	.space 0x1E0
