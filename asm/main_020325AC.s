	.include "asm/macros.inc"
	.include "main_020325AC.inc"

	.text

	arm_func_start sub_020325AC
sub_020325AC: ; 0x020325AC
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325AC

	arm_func_start sub_020325E8
sub_020325E8: ; 0x020325E8
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r2, [r0, #0xbc]
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0, #0xbc]
	subge r1, r1, #1
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325E8

	arm_func_start sub_0203261C
sub_0203261C: ; 0x0203261C
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_0203261C

	arm_func_start sub_02032654
sub_02032654: ; 0x02032654
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	movmi r1, #0
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032654

	arm_func_start sub_02032684
sub_02032684: ; 0x02032684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	strb r0, [r5, #0xd4]
	movs r4, r1
	ldr r0, [r5, #0x10]
	movmi r4, #0
	tst r0, #0x8000
	beq _020326E0
	ldr r0, [r5, #0xd0]
	ldr r1, [r5, #0xc4]
	cmp r4, r0
	subge r4, r0, #1
	mov r0, r4
	bl _s32_div_f
	str r0, [r5, #0xc8]
	ldr r1, [r5, #0xc4]
	mov r0, r4
	bl _s32_div_f
	mov r0, r5
	str r1, [r5, #0xbc]
	bl sub_02032754
	ldmia sp!, {r3, r4, r5, pc}
_020326E0:
	ldr r0, [r5, #0xc0]
	cmp r4, r0
	subge r0, r0, #1
	strge r0, [r5, #0xbc]
	strlt r4, [r5, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02032684

	arm_func_start sub_020326F8
sub_020326F8: ; 0x020326F8
	mov r3, #1
	cmp r1, #0
	movlt r1, #0
	strb r3, [r0, #0xd4]
	cmp r1, r2
	ldrge r1, [r0, #0xc0]
	subge r1, r1, #1
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020326F8

	arm_func_start sub_0203271C
sub_0203271C: ; 0x0203271C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_02032754
	ldr r0, [r4, #0xcc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	orrge r0, r0, #0x10000
	biclt r0, r0, #0x10000
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203271C

	arm_func_start sub_02032754
sub_02032754: ; 0x02032754
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldr r1, [r4, #0xc8]
	sub r0, r0, #1
	cmp r1, r0
	strge r0, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032754

	arm_func_start sub_020327CC
sub_020327CC: ; 0x020327CC
	str r1, [r0, #0xd0]
	str r2, [r0, #0xc4]
	mov r1, #0
	str r1, [r0, #0xbc]
	str r1, [r0, #0xc8]
	bx lr
	arm_func_end sub_020327CC

	arm_func_start sub_020327E4
sub_020327E4: ; 0x020327E4
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _02032808 ; =sub_02032754
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032808: .word sub_02032754
	arm_func_end sub_020327E4

	arm_func_start sub_0203280C
sub_0203280C: ; 0x0203280C
	ldr r1, [r0, #0xc8]
	ldr ip, _02032828 ; =sub_02032754
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032828: .word sub_02032754
	arm_func_end sub_0203280C

	arm_func_start sub_0203282C
sub_0203282C: ; 0x0203282C
	ldr r2, [r0, #0xcc]
	ldr r1, [r0, #0xc8]
	sub r2, r2, #1
	cmp r1, r2
	movge r1, #0
	strge r1, [r0, #0xc8]
	bge _02032858
	add r1, r1, #0xa
	cmp r1, r2
	movle r2, r1
	str r2, [r0, #0xc8]
_02032858:
	ldr ip, _02032860 ; =sub_02032754
	bx ip
	.align 2, 0
_02032860: .word sub_02032754
	arm_func_end sub_0203282C

	arm_func_start sub_02032864
sub_02032864: ; 0x02032864
	ldr r1, [r0, #0xc8]
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	suble r1, r1, #1
	strle r1, [r0, #0xc8]
	ble _02032888
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
_02032888:
	ldr ip, _02032890 ; =sub_02032754
	bx ip
	.align 2, 0
_02032890: .word sub_02032754
	arm_func_end sub_02032864

	arm_func_start sub_02032894
sub_02032894: ; 0x02032894
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _020328B4
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _020328D0
_020328B4:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_020328D0:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032894

	arm_func_start GetPageItemYOffset
GetPageItemYOffset: ; 0x020328D8
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end GetPageItemYOffset

	arm_func_start sub_020328F4
sub_020328F4: ; 0x020328F4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032910
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032910:
	mov r0, #0
	bx lr
	arm_func_end sub_020328F4

	arm_func_start sub_02032918
sub_02032918: ; 0x02032918
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032934
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032934:
	mov r0, #0
	bx lr
	arm_func_end sub_02032918

	arm_func_start sub_0203293C
sub_0203293C: ; 0x0203293C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032958
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032958:
	mov r0, #0
	bx lr
	arm_func_end sub_0203293C

	arm_func_start PlayWindowInputSound
PlayWindowInputSound: ; 0x02032960
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end PlayWindowInputSound

	arm_func_start sub_02032984
sub_02032984: ; 0x02032984
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_02032984

	arm_func_start sub_0203299C
sub_0203299C: ; 0x0203299C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203299C

	arm_func_start CalcMenuHeightDiv8__020329E4
CalcMenuHeightDiv8__020329E4: ; 0x020329E4
	tst r0, #0x40000
	bne _020329FC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_020329FC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__020329E4

	arm_func_start InitInventoryMenuInput
InitInventoryMenuInput: ; 0x02032A38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02032A68:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02032A68
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	ldrb r0, [sp, #0x28]
	str r1, [r7, #0xd0]
	strb r0, [r7, #0xd5]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02032AD8
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02032AE0
_02032AD8:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02032AE0:
	mov r0, r7
	bl sub_020331D4
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02032B74
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02032B68
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02032B68:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02032B7C
_02032B74:
	mov r0, r7
	bl sub_0203330C
_02032B7C:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02032B94
	ldr r1, [r6]
	mov r0, r7
	bl sub_020330EC
_02032B94:
	bl sub_02031908
	mov r1, #0
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_020333FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitInventoryMenuInput

	arm_func_start sub_02032BB8
sub_02032BB8: ; 0x02032BB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x24
	mov sb, r0
	mov r6, r3
	mov r8, r1
	mov r7, r2
	ldr r4, [sb, #0xc8]
	ldr r5, [sb, #0xbc]
	bl sub_02033414
	mov sl, r0
	cmp r6, #0
	add r0, sp, #0
	beq _02032D04
	ldr r1, [sb, #0x10]
	bl sub_02031914
	ldr r1, [sb, #0x10]
	mov r6, r0
	tst r1, #0x8000
	beq _02032C44
	tst r1, #0x20000
	beq _02032C44
	tst r1, #0x2000000
	bne _02032C44
	tst r6, #8
	beq _02032C44
	tst r6, #0x10
	beq _02032C30
	mov r0, sb
	bl InventoryMenuPreviousPage
	b _02032C74
_02032C30:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl InventoryMenuNextPage
	b _02032C74
_02032C44:
	tst r1, #0x1000000
	cmpeq sl, #0
	bne _02032C74
	tst r6, #0x10
	beq _02032C64
	mov r0, sb
	bl sub_020330B4
	b _02032C74
_02032C64:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033078
_02032C74:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _02032CEC
	tst r0, #0x20000
	bne _02032CEC
	tst r0, #0x2000000
	bne _02032CEC
	tst r0, #0x10000
	beq _02032CC8
	tst r6, #8
	beq _02032CC8
	tst r6, #0x40
	beq _02032CB4
	mov r0, sb
	bl InventoryMenuPrevious10Pages
	b _02032CEC
_02032CB4:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl InventoryMenuNext10Pages
	b _02032CEC
_02032CC8:
	tst r6, #0x40
	beq _02032CDC
	mov r0, sb
	bl InventoryMenuPreviousPage
	b _02032CEC
_02032CDC:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl InventoryMenuNextPage
_02032CEC:
	ldr r0, [sb, #0x10]
	tst r0, #1
	biceq r6, r6, #1
	tst r0, #2
	biceq r6, r6, #2
	b _02032D0C
_02032D04:
	mov r6, #0
	bl sub_02006BFC
_02032D0C:
	cmp r8, #0
	strne r6, [r8]
	cmp r7, #0
	beq _02032D3C
	add r8, sp, #0
	mov r6, #2
_02032D24:
	ldmia r8!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02032D24
	ldr r0, [r8]
	str r0, [r7]
_02032D3C:
	ldr r0, [sb, #0xc8]
	cmp r4, r0
	beq _02032D5C
	mov r0, sb
	mov r1, #4
	bl sub_020333D8
	mov r0, #1
	b _02032DA8
_02032D5C:
	ldr r0, [sb, #0xbc]
	cmp r5, r0
	beq _02032D74
	mov r0, sb
	mov r1, #3
	bl sub_020333D8
_02032D74:
	ldr r0, [sb, #0xd8]
	cmp r0, #0
	ble _02032DA4
	subs r0, r0, #1
	str r0, [sb, #0xd8]
	bne _02032DA4
	mvn r0, #0
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	mov r0, #1
	b _02032DA8
_02032DA4:
	mov r0, #0
_02032DA8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02032BB8

	arm_func_start sub_02032DB0
sub_02032DB0: ; 0x02032DB0
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _02032DE0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _02032DE0
	mov r0, #1
	bx lr
_02032DE0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032DB0

	arm_func_start sub_02032DE8
sub_02032DE8: ; 0x02032DE8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_02032DE8

	arm_func_start sub_02032E0C
sub_02032E0C: ; 0x02032E0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _02032F50
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _02032F48
_02032E68:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032F44
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032F34
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032F34:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _02032F54
_02032F44:
	add r6, r6, #1
_02032F48:
	cmp r6, r5
	blt _02032E68
_02032F50:
	mvn r0, #0
_02032F54:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032E0C

	arm_func_start sub_02032F5C
sub_02032F5C: ; 0x02032F5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032FA4
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032FA4
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032FA4:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02032F5C

	arm_func_start sub_02032FD8
sub_02032FD8: ; 0x02032FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _0203304C
	tst r1, #0x8000000
	bne _0203304C
	tst r1, #0x200
	beq _02033044
	bl sub_02033414
	cmp r0, #0
	bne _02033028
	mov r0, r4
	bl sub_02033064
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _0203304C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02033028:
	ldr r0, [r4, #0xac]
	ldrb r0, [r0, #0x7f]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_02033044:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203304C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032FD8

	arm_func_start sub_02033054
sub_02033054: ; 0x02033054
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02033054

	arm_func_start sub_02033064
sub_02033064: ; 0x02033064
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02033064

	arm_func_start sub_02033078
sub_02033078: ; 0x02033078
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02033078

	arm_func_start sub_020330B4
sub_020330B4: ; 0x020330B4
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020330B4

	arm_func_start sub_020330EC
sub_020330EC: ; 0x020330EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #1
	strb r0, [r4, #0xd4]
	movs r5, r1
	ldr r0, [r4, #0x10]
	movmi r5, #0
	tst r0, #0x8000
	beq _02033194
	ldr r1, [r4, #0xd0]
	cmp r5, r1
	blt _02033168
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	beq _02033140
	ldr r1, [r4, #0xcc]
	mov r0, #0
	sub r1, r1, #1
	str r1, [r4, #0xc8]
	str r0, [r4, #0xbc]
	b _02033188
_02033140:
	sub r5, r1, #1
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
	b _02033188
_02033168:
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
_02033188:
	mov r0, r4
	bl sub_020331D4
	ldmia sp!, {r3, r4, r5, pc}
_02033194:
	ldr r0, [r4, #0xc0]
	cmp r5, r0
	subge r0, r0, #1
	strge r0, [r4, #0xbc]
	strlt r5, [r4, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020330EC

	arm_func_start sub_020331AC
sub_020331AC: ; 0x020331AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_020331D4
	mov r0, r4
	bl sub_02033064
	mov r1, r0
	mov r0, r4
	bl sub_020330EC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331AC

	arm_func_start sub_020331D4
sub_020331D4: ; 0x020331D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	ldrne r0, [r4, #0xcc]
	addne r0, r0, #1
	strne r0, [r4, #0xcc]
	ldr r1, [r4, #0xcc]
	ldr r0, [r4, #0xc8]
	sub r1, r1, #1
	cmp r0, r1
	strge r1, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	mov r0, r4
	bl sub_02033414
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xbc]
	movne r0, #1
	strne r0, [r4, #0xc0]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331D4

	arm_func_start InventoryMenuNextPage
InventoryMenuNextPage: ; 0x02033284
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _020332A8 ; =sub_020331D4
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332A8: .word sub_020331D4
	arm_func_end InventoryMenuNextPage

	arm_func_start InventoryMenuPreviousPage
InventoryMenuPreviousPage: ; 0x020332AC
	ldr r1, [r0, #0xc8]
	ldr ip, _020332C8 ; =sub_020331D4
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332C8: .word sub_020331D4
	arm_func_end InventoryMenuPreviousPage

	arm_func_start InventoryMenuNext10Pages
InventoryMenuNext10Pages: ; 0x020332CC
	ldr r2, [r0, #0xc8]
	ldr r1, [r0, #0xcc]
	add r2, r2, #0xa
	cmp r2, r1
	subge r2, r1, #1
	ldr ip, _020332EC ; =sub_020331D4
	str r2, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332EC: .word sub_020331D4
	arm_func_end InventoryMenuNext10Pages

	arm_func_start InventoryMenuPrevious10Pages
InventoryMenuPrevious10Pages: ; 0x020332F0
	ldr r1, [r0, #0xc8]
	ldr ip, _02033308 ; =sub_020331D4
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02033308: .word sub_020331D4
	arm_func_end InventoryMenuPrevious10Pages

	arm_func_start sub_0203330C
sub_0203330C: ; 0x0203330C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _0203332C
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _02033348
_0203332C:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_02033348:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203330C

	arm_func_start sub_02033350
sub_02033350: ; 0x02033350
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_02033350

	arm_func_start sub_0203336C
sub_0203336C: ; 0x0203336C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02033388
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02033388:
	mov r0, #0
	bx lr
	arm_func_end sub_0203336C

	arm_func_start sub_02033390
sub_02033390: ; 0x02033390
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333AC
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333AC:
	mov r0, #0
	bx lr
	arm_func_end sub_02033390

	arm_func_start sub_020333B4
sub_020333B4: ; 0x020333B4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333D0
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333D0:
	mov r0, #0
	bx lr
	arm_func_end sub_020333B4

	arm_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020333D8

	arm_func_start sub_020333FC
sub_020333FC: ; 0x020333FC
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_020333FC

	arm_func_start sub_02033414
sub_02033414: ; 0x02033414
	ldrb r1, [r0, #0xd5]
	cmp r1, #0
	beq _02033438
	ldr r1, [r0, #0xc8]
	ldr r2, [r0, #0xcc]
	add r0, r1, #1
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_02033438:
	mov r0, #0
	bx lr
	arm_func_end sub_02033414

	arm_func_start sub_02033440
sub_02033440: ; 0x02033440
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r5, r0
	tst r5, #0x800
	mov r4, #0
	beq _02033498
	ldrh r2, [r1, #8]
	cmp r2, #0
	moveq r0, r4
	beq _02033488
	ldr r3, _020334A4 ; =0x0000C402
	add ip, r1, #0x10
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #4
	bl sub_020265A8
_02033488:
	tst r5, #0x8000
	addne r0, r0, #0x40
	cmp r0, #0
	movgt r4, r0
_02033498:
	mov r0, r4
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020334A4: .word 0x0000C402
	arm_func_end sub_02033440

	arm_func_start sub_020334A8
sub_020334A8: ; 0x020334A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r0, [r5, #0x10]
	mov r4, r1
	tst r0, #0x800
	beq _02033598
	ldrh r2, [r5, #0x1c]
	cmp r2, #0
	beq _020334FC
	ldr r3, _020335A0 ; =0x0000C402
	add ip, r5, #0x24
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
_020334FC:
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_020328F4
	cmp r0, #0
	beq _02033598
	mov r0, r5
	bl GetCurrentPage
	add r1, r0, #1
	mov r0, r5
	str r1, [sp, #0x28]
	bl GetTotalNumPages
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _020335A4 ; =_0209AFC4
	ldr r3, _020335A0 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov ip, r0
	ldr r3, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r3, r1
	mov r2, #0
	sub r1, r1, ip
	add r3, sp, #0x54
	bl DrawTextInWindow
_02033598:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020335A0: .word 0x0000C402
_020335A4: .word _0209AFC4
	arm_func_end sub_020334A8

	arm_func_start sub_020335A8
sub_020335A8: ; 0x020335A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r2, [r5, #0x10]
	mov r4, r1
	tst r2, #0x800
	beq _020336E8
	bl sub_02033414
	cmp r0, #0
	beq _02033610
	ldr r3, _020336F0 ; =0x000008E3
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl AppendStandardStringToMission
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	b _020336E8
_02033610:
	add r0, r5, #0x24
	str r0, [sp]
	ldrh r2, [r5, #0x1c]
	ldr r3, _020336F4 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_0203336C
	cmp r0, #0
	beq _020336E8
	ldr r0, [r5, #0xc8]
	ldr r2, _020336F8 ; =_0209AFC4
	add r0, r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r5, #0xd5]
	ldr r3, _020336F4 ; =0x0000C402
	add ip, sp, #4
	cmp r0, #0
	movne r1, #1
	ldr r0, [r5, #0xcc]
	moveq r1, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov r2, r0
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	add r3, sp, #0x54
	sub r1, r1, r0
	sub r1, r1, r2
	mov r0, r4
	mov r2, #0
	bl DrawTextInWindow
_020336E8:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_020336F0: .word 0x00001D3B
#else
_020336F0: .word 0x000008E3
#endif
_020336F4: .word 0x0000C402
_020336F8: .word _0209AFC4
	arm_func_end sub_020335A8

	arm_func_start sub_020336FC
sub_020336FC: ; 0x020336FC
	tst r0, #0x1000
	mov r1, #0
	beq _02033750
	mov r2, #4
	tst r0, #0x2000
	addne r2, r2, #0x12
	tst r0, #0x4000
	addne r2, r2, #0x14
	tst r0, #0x20000
	addne r2, r2, #0x1f
	bne _02033738
	tst r0, #0x8000
	addne r2, r2, #0x3e
	tst r0, #8
	addne r2, r2, #0x1f
_02033738:
	tst r0, #4
	addne r2, r2, #0x12
	tst r0, #2
	addne r2, r2, #0x12
	cmp r2, #0
	movgt r1, r2
_02033750:
	mov r0, r1
	bx lr
	arm_func_end sub_020336FC

	arm_func_start sub_02033758
sub_02033758: ; 0x02033758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	ldrb r0, [sb, #0xf4]
	mov r8, r1
	ldr r1, [sb, #0x10]
	cmp r0, #0
	ldrne r0, _02033BBC ; =0x00001002
	mov r7, r2
	moveq r0, #2
	mov r0, r0, lsl #0x10
	mov r4, #0
	tst r1, #0x1000
	mov r5, r0, lsr #0x10
	beq _02033B98
	ldrh r0, [r7]
	tst r0, r5
	beq _02033B98
	ldmib sb, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [sb, #4]
	add r6, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sb, #0x10]
	tst r0, #0x2000
	beq _0203380C
	mov r0, #0x12
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r8]
	add r6, r6, #0x12
_0203380C:
	ldr r0, [sb, #0x10]
	tst r0, #0x4000
	beq _0203385C
	mov r0, #0x13
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r8]
	add r6, r6, #0x14
_0203385C:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _020339C8
	tst r0, #0x20000
	bne _020339C8
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _020339C4
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _020338D4
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _020338D4
	mov r0, sb
	bl sub_02032864
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r8]
_020338D4:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _0203392C
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _0203392C
	mov r0, sb
	bl sub_0203282C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r8]
_0203392C:
	add ip, r6, #0x1f
	add r3, r6, #0x2a
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033978
	mov r0, sb
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r8]
_02033978:
	add ip, r6, #0x2d
	add r3, r6, #0x38
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _020339C4
	mov r0, sb
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r8]
_020339C4:
	add r6, r6, #0x3e
_020339C8:
	ldr r0, [sb, #0x10]
	tst r0, #8
	bne _020339EC
	tst r0, #0x20000
	beq _02033AE0
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _02033AE0
_020339EC:
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000000
	bne _02033A64
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033A64
	ldr r0, [r8]
	orr r0, r0, #0x40000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033A58
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x4000
	str r0, [r8]
	b _02033A60
_02033A58:
	mov r1, #0
	bl PlayWindowInputSound
_02033A60:
	mov r4, #1
_02033A64:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x40000000
	bne _02033AE0
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033AE0
	ldr r0, [r8]
	orr r0, r0, #0x80000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033AD4
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x8000
	str r0, [r8]
	b _02033ADC
_02033AD4:
	mov r1, #0
	bl PlayWindowInputSound
_02033ADC:
	mov r4, #1
_02033AE0:
	ldr r1, [sb, #0xc]
	ldr r0, [sb, #0x10]
	add r6, r1, #4
	tst r0, #2
	beq _02033B2C
	sub r6, r6, #0x12
	add r3, r6, #0xb
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r8]
_02033B2C:
	ldr r0, [sb, #0x10]
	tst r0, #4
	beq _02033B98
	sub ip, r6, #0x12
	sub r3, r6, #7
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033B98
	ldr r0, [sb, #0x10]
	tst r0, #0x18000000
	ldreq r0, [r8]
	orreq r0, r0, #1
	orreq r0, r0, #0x10000
	streq r0, [r8]
	beq _02033B94
	ldr r1, [r8]
	mov r0, sb
	orr r2, r1, #0x10000
	mov r1, #2
	str r2, [r8]
	bl PlayWindowInputSound
_02033B94:
	mov r4, #1
_02033B98:
	ldr r1, [r8]
	cmp r1, #0
	beq _02033BB0
	mov r0, sb
	bl sub_020320C8
	mov r4, #1
_02033BB0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02033BBC: .word 0x00001002
	arm_func_end sub_02033758

	arm_func_start sub_02033BC0
sub_02033BC0: ; 0x02033BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02033ECC
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033C44
	tst r4, #0x1000000
	ldrne r3, _02033ED4 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _02033ED8 ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
	add r6, r6, #0x12
_02033C44:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02033C70
	tst r4, #0x2000000
	ldrne r3, _02033EDC ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02033EE0 ; =_0209AFF4
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	add r6, r6, #0x14
_02033C70:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02033D74
	tst r0, #0x20000
	bne _02033D74
	mov r0, r8
	bl sub_020328F4
	cmp r0, #0
	beq _02033D70
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02033D08
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033CB8
	tst r4, #0x400000
	beq _02033CD4
_02033CB8:
	tst r4, #0x400000
	ldrne r3, _02033EE4 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _02033EE8 ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033CD4:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033CEC
	tst r4, #0x800000
	beq _02033D08
_02033CEC:
	tst r4, #0x800000
	ldrne r3, _02033EEC ; =_0209B00C
	mov r0, r7
	ldreq r3, _02033EF0 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033D08:
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033D20
	tst r4, #0x100000
	beq _02033D3C
_02033D20:
	tst r4, #0x100000
	ldrne r3, _02033EF4 ; =_0209B01C
	mov r0, r7
	ldreq r3, _02033EF8 ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_02033D3C:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033D54
	tst r4, #0x200000
	beq _02033D70
_02033D54:
	tst r4, #0x200000
	ldrne r3, _02033EFC ; =_0209B02C
	mov r0, r7
	ldreq r3, _02033F00 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_02033D70:
	add r6, r6, #0x3e
_02033D74:
	ldr r1, [r8, #0x10]
	ldr r0, _02033F04 ; =0x00020008
	tst r1, r0
	beq _02033E40
	tst r4, #0x40000
	beq _02033DA4
	ldr r3, _02033F08 ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033DE0
_02033DA4:
	tst r1, #0x20000000
	bne _02033DE0
	tst r1, #8
	bne _02033DCC
	tst r1, #0x20000
	beq _02033DE0
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	beq _02033DE0
_02033DCC:
	ldr r3, _02033F0C ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033DE0:
	tst r4, #0x80000
	beq _02033E00
	ldr r3, _02033F10 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033E40
_02033E00:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02033E40
	tst r0, #8
	bne _02033E2C
	tst r0, #0x20000
	beq _02033E40
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	beq _02033E40
_02033E2C:
	ldr r3, _02033F14 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033E40:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02033E7C
	tst r4, #0x20000
	ldrne r3, _02033F18 ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _02033F1C ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033E7C:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02033ECC
	tst r0, #0x18000000
	beq _02033EB0
	tst r4, #0x10000
	ldrne r3, _02033F20 ; =_0209B06C
	mov r0, r7
	ldreq r3, _02033F24 ; =_0209B074
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033ECC
_02033EB0:
	tst r4, #0x10000
	ldrne r3, _02033F28 ; =_0209B07C
	mov r0, r7
	ldreq r3, _02033F2C ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02033ECC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02033ED4: .word _0209AFDC
_02033ED8: .word _0209AFE4
_02033EDC: .word _0209AFEC
_02033EE0: .word _0209AFF4
_02033EE4: .word _0209AFFC
_02033EE8: .word _0209B004
_02033EEC: .word _0209B00C
_02033EF0: .word _0209B014
_02033EF4: .word _0209B01C
_02033EF8: .word _0209B024
_02033EFC: .word _0209B02C
_02033F00: .word _0209B034
_02033F04: .word 0x00020008
_02033F08: .word _0209B03C
_02033F0C: .word _0209B044
_02033F10: .word _0209B04C
_02033F14: .word _0209B054
_02033F18: .word _0209B05C
_02033F1C: .word _0209B064
_02033F20: .word _0209B06C
_02033F24: .word _0209B074
_02033F28: .word _0209B07C
_02033F2C: .word _0209B084
	arm_func_end sub_02033BC0

	arm_func_start sub_02033F30
sub_02033F30: ; 0x02033F30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	mov r6, r2
	tst r0, #0x1000
	mov r4, #0
	beq _0203433C
	ldrh r0, [r6]
	tst r0, #2
	beq _0203433C
	ldmib r8, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [r8, #4]
	add r5, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033FC8
	mov r0, #0x12
	str r5, [sp, #8]
	bl sub_02026594
	add r0, r5, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r7]
_02033FC8:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _0203401C
	add r1, r5, #0x12
	mov r0, #0x13
	str r1, [sp, #8]
	bl sub_02026594
	add r1, r5, #0x12
	add r0, r1, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r7]
_0203401C:
	ldr r0, [r8, #0x10]
	add r5, r5, #0x26
	tst r0, #0x8000
	beq _0203418C
	tst r0, #0x20000
	bne _0203418C
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _02034188
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02034098
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034098
	mov r0, r8
	bl InventoryMenuPrevious10Pages
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r7]
_02034098:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020340F0
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020340F0
	mov r0, r8
	bl InventoryMenuNext10Pages
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r7]
_020340F0:
	add ip, r5, #0x1f
	add r3, r5, #0x2a
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0203413C
	mov r0, r8
	bl InventoryMenuPreviousPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r7]
_0203413C:
	add ip, r5, #0x2d
	add r3, r5, #0x38
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02034188
	mov r0, r8
	bl InventoryMenuNextPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r7]
_02034188:
	add r5, r5, #0x3e
_0203418C:
	ldr r1, [r8, #0x10]
	ands r0, r1, #8
	beq _020342AC
	cmp r0, #0
	bne _020341B8
	tst r1, #0x20000
	beq _020342AC
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _020342AC
_020341B8:
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02034230
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034230
	ldr r0, [r7]
	orr r0, r0, #0x40000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _02034224
	bl InventoryMenuPreviousPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x4000
	str r0, [r7]
	b _0203422C
_02034224:
	mov r1, #0
	bl sub_020333D8
_0203422C:
	mov r4, #1
_02034230:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000000
	bne _020342AC
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020342AC
	ldr r0, [r7]
	orr r0, r0, #0x80000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _020342A0
	bl InventoryMenuNextPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x8000
	str r0, [r7]
	b _020342A8
_020342A0:
	mov r1, #0
	bl sub_020333D8
_020342A8:
	mov r4, #1
_020342AC:
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #0x10]
	add r5, r1, #4
	tst r0, #2
	beq _020342F8
	sub r5, r5, #0x12
	add r3, r5, #0xb
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r7]
_020342F8:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _0203433C
	sub ip, r5, #0x12
	sub r3, r5, #7
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #1
	orrne r0, r0, #0x10000
	strne r0, [r7]
_0203433C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02034354
	mov r0, r8
	bl sub_02032DE8
	mov r4, #1
_02034354:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02033F30

	arm_func_start sub_02034360
sub_02034360: ; 0x02034360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02034660
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _020343E0
	tst r4, #0x1000000
	ldrne r3, _02034668 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _0203466C ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
_020343E0:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02034408
	tst r4, #0x2000000
	ldrne r3, _02034670 ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02034674 ; =_0209AFF4
	add r2, r5, #3
	mov r1, #0x16
	bl DrawTextInWindow
_02034408:
	ldr r0, [r8, #0x10]
	add r6, r6, #0x26
	tst r0, #0x8000
	beq _02034510
	tst r0, #0x20000
	bne _02034510
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _0203450C
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020344A4
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _02034454
	tst r4, #0x400000
	beq _02034470
_02034454:
	tst r4, #0x400000
	ldrne r3, _02034678 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _0203467C ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034470:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _02034488
	tst r4, #0x800000
	beq _020344A4
_02034488:
	tst r4, #0x800000
	ldrne r3, _02034680 ; =_0209B00C
	mov r0, r7
	ldreq r3, _02034684 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020344A4:
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _020344BC
	tst r4, #0x100000
	beq _020344D8
_020344BC:
	tst r4, #0x100000
	ldrne r3, _02034688 ; =_0209B01C
	mov r0, r7
	ldreq r3, _0203468C ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_020344D8:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _020344F0
	tst r4, #0x200000
	beq _0203450C
_020344F0:
	tst r4, #0x200000
	ldrne r3, _02034690 ; =_0209B02C
	mov r0, r7
	ldreq r3, _02034694 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_0203450C:
	add r6, r6, #0x3e
_02034510:
	ldr r1, [r8, #0x10]
	ldr r0, _02034698 ; =0x00020008
	tst r1, r0
	beq _020345DC
	tst r4, #0x40000
	beq _02034540
	ldr r3, _0203469C ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _0203457C
_02034540:
	tst r1, #0x20000000
	bne _0203457C
	tst r1, #8
	bne _02034568
	tst r1, #0x20000
	beq _0203457C
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	beq _0203457C
_02034568:
	ldr r3, _020346A0 ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_0203457C:
	tst r4, #0x80000
	beq _0203459C
	ldr r3, _020346A4 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _020345DC
_0203459C:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _020345DC
	tst r0, #8
	bne _020345C8
	tst r0, #0x20000
	beq _020345DC
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	beq _020345DC
_020345C8:
	ldr r3, _020346A8 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020345DC:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02034618
	tst r4, #0x20000
	ldrne r3, _020346AC ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _020346B0 ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034618:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02034660
	tst r0, #0x18000000
	beq _02034644
	ldr r3, _020346B4 ; =_0209B074
	mov r0, r7
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02034660
_02034644:
	tst r4, #0x10000
	ldrne r3, _020346B8 ; =_0209B07C
	mov r0, r7
	ldreq r3, _020346BC ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02034660:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02034668: .word _0209AFDC
_0203466C: .word _0209AFE4
_02034670: .word _0209AFEC
_02034674: .word _0209AFF4
_02034678: .word _0209AFFC
_0203467C: .word _0209B004
_02034680: .word _0209B00C
_02034684: .word _0209B014
_02034688: .word _0209B01C
_0203468C: .word _0209B024
_02034690: .word _0209B02C
_02034694: .word _0209B034
_02034698: .word 0x00020008
_0203469C: .word _0209B03C
_020346A0: .word _0209B044
_020346A4: .word _0209B04C
_020346A8: .word _0209B054
_020346AC: .word _0209B05C
_020346B0: .word _0209B064
_020346B4: .word _0209B074
_020346B8: .word _0209B07C
_020346BC: .word _0209B084
	arm_func_end sub_02034360

	arm_func_start sub_020346C0
sub_020346C0: ; 0x020346C0
	stmdb sp!, {r4, lr}
	mov r0, #0xdc
	mov r1, #1
	bl MemAlloc
	mov r4, r0
	ldr ip, _02034708 ; =MENU_CONTROL_PTR
	ldr r0, _0203470C ; =NULL_OVERLAY_LOAD_ENTRY
	str r4, [ip]
	add lr, r4, #0xc4
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r1, #0
	str r1, [r4, #0xd4]
	ldr r0, [ip]
	strb r1, [r0, #0xd8]
	bl sub_02034710
	bl sub_020469BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034708: .word MENU_CONTROL_PTR
_0203470C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_020346C0

	arm_func_start sub_02034710
sub_02034710: ; 0x02034710
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r1, _02034798 ; =MENU_CONTROL_PTR
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r4, r1, #0xc4
	mov r1, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _0203473C
	bl FreeActiveMenu
_0203473C:
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	add r7, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr ip, _02034798 ; =MENU_CONTROL_PTR
	ldmia r7, {r0, r1, r2, r3}
	ldr r5, [ip]
	mov r6, #0
	stmia r5, {r0, r1, r2, r3}
	strb r6, [r5, #0x10]
	ldr r5, [ip]
	ldmia r7, {r0, r1, r2, r3}
	add lr, r5, #0x14
	stmia lr, {r0, r1, r2, r3}
	str r6, [r5, #0x24]
	ldr r0, [ip]
	strb r6, [r0, #0xc0]
	ldmia r7, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	str r6, [r0, #0xd4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02034798: .word MENU_CONTROL_PTR
_0203479C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034710

	arm_func_start OverlayLoadEntriesEqual
OverlayLoadEntriesEqual: ; 0x020347A0
	cmp r0, #0
	ldreq r0, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	cmp r1, #0
	ldreq r1, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r2, [r0, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020347EC: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end OverlayLoadEntriesEqual

	arm_func_start FreeActiveMenu
FreeActiveMenu: ; 0x020347F0
	stmdb sp!, {r4, lr}
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	ldr r4, [r0]
	ldr r0, [r4, #0xcc]
	cmp r0, #0
	beq _0203480C
	blx r0
_0203480C:
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc4]
	bl UnloadOverlay
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203483C: .word MENU_CONTROL_PTR
	arm_func_end FreeActiveMenu

	arm_func_start sub_02034840
sub_02034840: ; 0x02034840
	stmdb sp!, {r4, lr}
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02034894
	cmp r4, #0
	beq _0203487C
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	beq _02034894
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203487C:
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02034894:
	cmp r4, #0
	beq _020348B4
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0xc4
	bl OverlayLoadEntriesEqual
	ldmia sp!, {r4, pc}
_020348B4:
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r1, r1, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_020348DC: .word MENU_CONTROL_PTR
_020348E0: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034840
