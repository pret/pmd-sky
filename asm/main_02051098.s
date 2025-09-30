	.include "asm/macros.inc"
	.include "main_02051098.inc"

	.text

	arm_func_start sub_02051098
sub_02051098: ; 0x02051098
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0x10
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0x10
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051098

	arm_func_start sub_020510C0
sub_020510C0: ; 0x020510C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0x10
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0x10
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020510C0

	arm_func_start sub_020510E8
sub_020510E8: ; 0x020510E8
	ldr r3, _02051128 ; =_020AFF88
	mov ip, #1
	str r0, [r3]
	ldr r0, _0205112C ; =0x6C078965
	b _02051114
_020510FC:
	add r1, r3, ip, lsl #2
	ldr r1, [r1, #-4]
	eor r1, r1, r1, lsr #30
	mla r2, r1, r0, ip
	str r2, [r3, ip, lsl #2]
	add ip, ip, #1
_02051114:
	cmp ip, #0x270
	blt _020510FC
	ldr r0, _02051130 ; =_020AFF7C
	str ip, [r0]
	bx lr
	.align 2, 0
_02051128: .word _020AFF88
_0205112C: .word 0x6C078965
_02051130: .word _020AFF7C
	arm_func_end sub_020510E8

	arm_func_start sub_02051134
sub_02051134: ; 0x02051134
	stmdb sp!, {r4, lr}
	ldr r0, _0205126C ; =_020AFF7C
	ldr r1, [r0]
	cmp r1, #0x270
	blt _02051230
	ldr r0, _02051270 ; =0x00000271
	cmp r1, r0
	bne _0205115C
	add r0, r0, #0x1300
	bl sub_020510E8
_0205115C:
	ldr ip, _02051274 ; =_020AFF88
	ldr r2, _02051278 ; =_020AFF80
	mov r0, #0
_02051168:
	add r3, ip, r0, lsl #2
	ldr r4, [ip, r0, lsl #2]
	ldr r1, [r3, #4]
	and r4, r4, #0x80000000
	bic r1, r1, #0x80000000
	orr r4, r4, r1
	and r1, r4, #1
	ldr r3, [r3, #0x634]
	ldr r1, [r2, r1, lsl #2]
	eor r3, r3, r4, lsr #1
	eor r1, r3, r1
	str r1, [ip, r0, lsl #2]
	add r0, r0, #1
	cmp r0, #0xe3
	blt _02051168
	ldr r4, _02051274 ; =_020AFF88
	ldr r3, _02051278 ; =_020AFF80
	ldr r1, _0205127C ; =0x0000026F
	b _020511E8
_020511B4:
	add ip, r4, r0, lsl #2
	ldr lr, [r4, r0, lsl #2]
	ldr r2, [ip, #4]
	and lr, lr, #0x80000000
	bic r2, r2, #0x80000000
	orr lr, lr, r2
	and r2, lr, #1
	ldr ip, [ip, #-0x38c]
	ldr r2, [r3, r2, lsl #2]
	eor ip, ip, lr, lsr #1
	eor r2, ip, r2
	str r2, [r4, r0, lsl #2]
	add r0, r0, #1
_020511E8:
	cmp r0, r1
	blt _020511B4
	ldr r1, _02051274 ; =_020AFF88
	ldr r0, _02051278 ; =_020AFF80
	ldr r3, [r1, #0x9bc]
	ldr r2, [r1]
	and r3, r3, #0x80000000
	bic r2, r2, #0x80000000
	orr ip, r3, r2
	and r2, ip, #1
	ldr r3, [r1, #0x630]
	ldr r0, [r0, r2, lsl #2]
	eor r2, r3, ip, lsr #1
	eor r2, r2, r0
	ldr r0, _0205126C ; =_020AFF7C
	str r2, [r1, #0x9bc]
	mov r1, #0
	str r1, [r0]
_02051230:
	ldr r1, _0205126C ; =_020AFF7C
	ldr r2, _02051274 ; =_020AFF88
	ldr r3, [r1]
	ldr r0, _02051280 ; =0x9D2C5680
	ldr r2, [r2, r3, lsl #2]
	add ip, r3, #1
	eor r3, r2, r2, lsr #11
	and r2, r0, r3, lsl #7
	ldr r0, _02051284 ; =0xEFC60000
	eor r2, r3, r2
	and r0, r0, r2, lsl #15
	eor r0, r2, r0
	str ip, [r1]
	eor r0, r0, r0, lsr #18
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205126C: .word _020AFF7C
_02051270: .word 0x00000271
_02051274: .word _020AFF88
_02051278: .word _020AFF80
_0205127C: .word 0x0000026F
_02051280: .word 0x9D2C5680
_02051284: .word 0xEFC60000
	arm_func_end sub_02051134

	arm_func_start DungeonGoesUp
DungeonGoesUp: ; 0x02051288
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512AC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020512AC: .word DUNGEON_RESTRICTIONS
	arm_func_end DungeonGoesUp

	arm_func_start GetTurnLimit
GetTurnLimit: ; 0x020512B0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512C4 ; =_020A0C6C
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_020512C4: .word _020A0C6C
	arm_func_end GetTurnLimit

	arm_func_start DoesNotSaveWhenEntering
DoesNotSaveWhenEntering: ; 0x020512C8
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512EC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020512EC: .word DUNGEON_RESTRICTIONS
	arm_func_end DoesNotSaveWhenEntering

	arm_func_start TreasureBoxDropsEnabled
TreasureBoxDropsEnabled: ; 0x020512F0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051314 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x400
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051314: .word DUNGEON_RESTRICTIONS
	arm_func_end TreasureBoxDropsEnabled

	arm_func_start IsLevelResetDungeon
IsLevelResetDungeon: ; 0x02051318
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205133C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205133C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsLevelResetDungeon

	arm_func_start GetMaxItemsAllowed
GetMaxItemsAllowed: ; 0x02051340
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051354 ; =_020A0C69
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051354: .word _020A0C69
	arm_func_end GetMaxItemsAllowed

	arm_func_start IsMoneyAllowed
IsMoneyAllowed: ; 0x02051358
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205137C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205137C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsMoneyAllowed

	arm_func_start GetMaxRescueAttempts
GetMaxRescueAttempts: ; 0x02051380
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051394 ; =_020A0C68
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051394: .word _020A0C68
	arm_func_end GetMaxRescueAttempts
