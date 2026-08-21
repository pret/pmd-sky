	.include "asm/macros.inc"
	.include "main_02032960.inc"

	.text

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
