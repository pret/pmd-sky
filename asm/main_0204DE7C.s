	.include "asm/macros.inc"
	.include "main_0204DE7C.inc"

	.text

	arm_func_start MissionToWonderMailPassword
MissionToWonderMailPassword: ; 0x0204DE7C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x6c
	mov r2, #0
	mov r4, r0
	mov r5, r1
	mov r1, r2
	add r0, sp, #0x54
_0204DE98:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x16
	blt _0204DE98
	add r0, sp, #0
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_02050990
	add r0, sp, #0
	mov r1, r5
	mov r2, #1
	bl sub_0205FE80
	add r0, sp, #0
	bl sub_020509BC
	add r0, sp, #0x58
	mov r1, #0x11
	bl sub_02004F80
	mov r1, r0
	str r1, [sp, #0x54]
	ldrb r2, [sp, #0x54]
	ldr r0, _0204DF4C ; =_0209E264
	bl Debug_Print0
	ldrb r0, [sp, #0x54]
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_0204E02C
	add r0, sp, #0x32
	add r1, sp, #0x54
	mov r2, #0x22
	bl sub_0204DB08
	ldr r2, _0204DF50 ; =WONDER_MAIL_BITS_SWAP
	mov lr, #0
	add ip, sp, #0x32
	add r1, sp, #0x10
_0204DF20:
	ldrb r3, [ip, lr]
	ldrb r0, [r2, lr]
	add lr, lr, #1
	cmp lr, #0x22
	strb r3, [r1, r0]
	blt _0204DF20
	mov r0, r4
	mov r2, #0x22
	bl MemcpySimple
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0204DF4C: .word _0209E264
_0204DF50: .word WONDER_MAIL_BITS_SWAP
	arm_func_end MissionToWonderMailPassword

	arm_func_start sub_0204DF54
sub_0204DF54: ; 0x0204DF54
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	tst r2, #0x1f
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, #0
	ldr ip, _0204DFAC ; =ARM9_UNKNOWN_TABLE__NA_209E280
	mov r4, r5
	b _0204DF9C
_0204DF74:
	mov r6, r4
	add r7, r1, r5
	add r8, r0, r5
_0204DF80:
	ldrb lr, [r7, r6]
	ldrb r3, [ip, r6]
	add r6, r6, #1
	cmp r6, #0x20
	strb lr, [r8, r3]
	blt _0204DF80
	add r5, r5, #0x20
_0204DF9C:
	cmp r5, r2
	blo _0204DF74
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0204DFAC: .word ARM9_UNKNOWN_TABLE__NA_209E280
	arm_func_end sub_0204DF54

	arm_func_start sub_0204DFB0
sub_0204DFB0: ; 0x0204DFB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	tst r2, #0x1f
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	mov lr, r5
	ldr ip, _0204E028 ; =ARM9_UNKNOWN_TABLE__NA_209E280
	mov r4, r5
	b _0204E018
_0204DFD4:
	mov sb, r4
	add r7, r1, r5
	add r8, r0, r5
_0204DFE0:
	mov r6, lr
	ldrb r3, [ip, sb]
	b _0204DFF8
_0204DFEC:
	cmp r6, r3
	beq _0204E000
	add r6, r6, #1
_0204DFF8:
	cmp r6, #0x20
	blt _0204DFEC
_0204E000:
	ldrb r3, [r7, r6]
	strb r3, [r8, sb]
	add sb, sb, #1
	cmp sb, #0x20
	blt _0204DFE0
	add r5, r5, #0x20
_0204E018:
	cmp r5, r2
	blo _0204DFD4
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204E028: .word ARM9_UNKNOWN_TABLE__NA_209E280
	arm_func_end sub_0204DFB0

	arm_func_start sub_0204E02C
sub_0204E02C: ; 0x0204E02C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	and r0, sl, #0xf
	add r0, r0, sl, asr #4
	add r0, r0, #8
	tst sl, #1
	movne r7, #1
	mov r5, #0
	mov sb, r1
	mov r8, r2
	and r6, r0, #0xff
	mvneq r7, #0
	mov r1, r5
	ldr r4, _0204E09C ; =WONDER_MAIL_ENCRYPTION_TABLE
	b _0204E090
_0204E068:
	mla r0, r1, r7, sl
	and r0, r0, #0xff
	ldrb r3, [sb, r5]
	ldrb r2, [r4, r0]
	add r0, r1, #1
	mov r1, r6
	add r2, r3, r2
	strb r2, [sb, r5]
	bl _s32_div_f
	add r5, r5, #1
_0204E090:
	cmp r5, r8
	blo _0204E068
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204E09C: .word WONDER_MAIL_ENCRYPTION_TABLE
	arm_func_end sub_0204E02C

	arm_func_start sub_0204E0A0
sub_0204E0A0: ; 0x0204E0A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	and r0, sl, #0xf
	add r0, r0, sl, asr #4
	add r0, r0, #8
	tst sl, #1
	movne r7, #1
	mov r5, #0
	mov sb, r1
	mov r8, r2
	and r6, r0, #0xff
	mvneq r7, #0
	mov r1, r5
	ldr r4, _0204E110 ; =WONDER_MAIL_ENCRYPTION_TABLE
	b _0204E104
_0204E0DC:
	mla r0, r1, r7, sl
	and r0, r0, #0xff
	ldrb r3, [sb, r5]
	ldrb r2, [r4, r0]
	add r0, r1, #1
	mov r1, r6
	sub r2, r3, r2
	strb r2, [sb, r5]
	bl _s32_div_f
	add r5, r5, #1
_0204E104:
	cmp r5, r8
	blo _0204E0DC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204E110: .word WONDER_MAIL_ENCRYPTION_TABLE
	arm_func_end sub_0204E0A0

	arm_func_start sub_0204E114
sub_0204E114: ; 0x0204E114
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetDungeonModeSpecial
	cmp r0, #3
#ifdef JAPAN
	moveq r0, #0x37c
#else
	ldreq r0, _0204E14C ; =0x00000B2C
#endif
	beq _0204E144
	cmp r4, #0xd4
	ldreq r0, _0204E150 ; =0x00000B2D
#ifdef JAPAN
	addne r0, r4, #0x2c8
#else
	addne r0, r4, #0x278
	addne r0, r0, #0x800
#endif
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
_0204E144:
	bl StringFromId
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0204E150: .word 0x0000037D
#else
_0204E14C: .word 0x00000B2C
_0204E150: .word 0x00000B2D
#endif
	arm_func_end sub_0204E114

	arm_func_start sub_0204E154
sub_0204E154: ; 0x0204E154
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	add r0, sp, #0
	bl sub_0204ABB8
	add r0, sp, #0
	bl sub_0204F9F4
	add r0, sp, #0
	bl CopyLogTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E154

	arm_func_start sub_0204E19C
sub_0204E19C: ; 0x0204E19C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	add r0, sp, #0
	bl sub_0204ACDC
	add r0, sp, #0
	bl sub_0204FA0C
	add r0, sp, #0
	bl CopyLogFrom
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E19C

	arm_func_start sub_0204E1E4
sub_0204E1E4: ; 0x0204E1E4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0204E8EC
	ldr r1, _0204E208 ; =_022AB4F8
	mov r2, #0
	ldr r0, _0204E20C ; =_022AB5AC
	strb r2, [r1, #1]
	bl sub_0200C4CC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E208: .word _022AB4F8
_0204E20C: .word _022AB5AC
	arm_func_end sub_0204E1E4

	arm_func_start sub_0204E210
sub_0204E210: ; 0x0204E210
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #1
	mov r0, #0
	bhi _0204E2AC
	mov r2, r0
	mov r1, #0x32
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E258
	mov r2, r0
	mov r1, #0x2e
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E258:
	mov r1, #0x32
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E28C
	mov r1, #0x2e
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E28C:
	mov r1, #0x32
	mov r2, #2
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	bne _0204E2D4
	mov r0, #2
	ldmia sp!, {r3, pc}
_0204E2AC:
	mov r1, #0x2c
	bl LoadScriptVariableValue
	cmp r0, #6
	bne _0204E2D4
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E2D4:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E210

	arm_func_start sub_0204E2DC
sub_0204E2DC: ; 0x0204E2DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetGameMode
	strb r0, [r4]
	cmp r0, #1
	mov r0, #0
	bhi _0204E398
	mov r2, r0
	mov r1, #0x32
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E334
	mov r3, #2
	mov r2, r0
	mov r1, #0x2e
	strb r3, [r4]
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E334:
	mov r1, #0x32
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E370
	mov r3, #3
	mov r1, #0x2e
	mov r2, #1
	strb r3, [r4]
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E370:
	mov r1, #0x32
	mov r2, #2
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	bne _0204E3C0
	mov r0, #4
	strb r0, [r4]
	mov r0, #2
	ldmia sp!, {r4, pc}
_0204E398:
	mov r1, #0x2c
	bl LoadScriptVariableValue
	cmp r0, #6
	bne _0204E3C0
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E3C0:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204E2DC

	arm_func_start sub_0204E3C8
sub_0204E3C8: ; 0x0204E3C8
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E400
	bl sub_02048CB8
	ldr r1, _0204E408 ; =0x000F1207
	cmp r0, r1
	bne _0204E400
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E400:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E408: .word 0x000F1207
	arm_func_end sub_0204E3C8

	arm_func_start sub_0204E40C
sub_0204E40C: ; 0x0204E40C
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E458
	bl sub_02048CB8
	ldr r1, _0204E460 ; =0x000F1207
	cmp r0, r1
	bne _0204E458
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E458
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0204E458:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E460: .word 0x000F1207
	arm_func_end sub_0204E40C

	arm_func_start sub_0204E464
sub_0204E464: ; 0x0204E464
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E4B0
	bl sub_02048CB8
	ldr r1, _0204E4B8 ; =0x000F1207
	cmp r0, r1
	bne _0204E4B0
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	beq _0204E4B0
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E4B0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E4B8: .word 0x000F1207
	arm_func_end sub_0204E464

	arm_func_start sub_0204E4BC
sub_0204E4BC: ; 0x0204E4BC
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E4E0
	bl sub_02048CB8
	ldr r1, _0204E4E8 ; =0x000F1207
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0204E4E0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E4E8: .word 0x000F1207
	arm_func_end sub_0204E4BC

	arm_func_start sub_0204E4EC
sub_0204E4EC: ; 0x0204E4EC
	stmdb sp!, {r4, lr}
	bl sub_02048CB8
	mov r4, r0
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E524
	ldr r1, _0204E52C ; =0x000F1207
	cmp r4, r1
	addne r0, r1, #1
	cmpne r4, r0
	addne r0, r1, #3
	cmpne r4, r0
	movne r0, #1
	ldmneia sp!, {r4, pc}
_0204E524:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E52C: .word 0x000F1207
	arm_func_end sub_0204E4EC

	arm_func_start sub_0204E530
sub_0204E530: ; 0x0204E530
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E57C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E57C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E57C
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E57C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E530

	arm_func_start sub_0204E584
sub_0204E584: ; 0x0204E584
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E5DC
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E5DC
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E5DC
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _0204E5DC
	bl sub_0205633C
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E5DC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E584

	arm_func_start sub_0204E5E4
sub_0204E5E4: ; 0x0204E5E4
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E63C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E63C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E63C
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _0204E63C
	bl sub_02056360
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E63C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E5E4

	arm_func_start sub_0204E644
sub_0204E644: ; 0x0204E644
	stmdb sp!, {r3, lr}
	mov r0, #4
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0204E69C
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E69C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E69C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E69C
	bl sub_0205633C
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E69C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E644

	arm_func_start sub_0204E6A4
sub_0204E6A4: ; 0x0204E6A4
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E6F0
	bl sub_02048CB8
	ldr r1, _0204E6F8 ; =0x000F1207
	cmp r0, r1
	bne _0204E6F0
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	beq _0204E6F0
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E6F0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E6F8: .word 0x000F1207
	arm_func_end sub_0204E6A4

	arm_func_start sub_0204E6FC
sub_0204E6FC: ; 0x0204E6FC
	ldr r0, _0204E708 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_0204E708: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E6FC

	arm_func_start sub_0204E70C
sub_0204E70C: ; 0x0204E70C
	stmdb sp!, {r4, lr}
	ldr r0, _0204E75C ; =PENDING_DUNGEON_ID
	ldrsb r4, [r0, #0xd]
	and r1, r4, #0xff
	cmp r1, #1
	bhi _0204E754
	ldrsh r0, [r0, #2]
	bl GetDungeonModeSpecial
	cmp r0, #1
	beq _0204E744
	cmp r0, #2
	beq _0204E74C
	cmp r0, #3
	bne _0204E754
_0204E744:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0204E74C:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0204E754:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E75C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E70C

	arm_func_start sub_0204E760
sub_0204E760: ; 0x0204E760
	ldr r0, _0204E76C ; =PENDING_DUNGEON_ID
	ldrsh r0, [r0, #2]
	bx lr
	.align 2, 0
_0204E76C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E760

	arm_func_start sub_0204E770
sub_0204E770: ; 0x0204E770
	ldr r0, _0204E77C ; =PENDING_DUNGEON_ID
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0204E77C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E770

	arm_func_start sub_0204E780
sub_0204E780: ; 0x0204E780
	ldr r0, _0204E78C ; =PENDING_DUNGEON_ID
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0204E78C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E780

	arm_func_start sub_0204E790
sub_0204E790: ; 0x0204E790
	stmdb sp!, {r4, lr}
	ldr lr, _0204E7B4 ; =PENDING_DUNGEON_ID
	mov r4, r0
	mov ip, #0xb
_0204E7A0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204E7A0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E7B4: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E790

	arm_func_start sub_0204E7B8
sub_0204E7B8: ; 0x0204E7B8
	stmdb sp!, {r3, lr}
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsb r2, [r1, #0xd]
	mov r1, #0x28
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsh r2, [r1, #2]
	mov r1, #0x27
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsh r2, [r1, #2]
	mov r1, #0x29
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2c
	mov r2, #6
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2b
	mov r2, #6
	bl SaveScriptVariableValue
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0204E8D4
_0204E82C: ; jump table
	b _0204E8D4 ; case 0
	b _0204E83C ; case 1
	b _0204E8B0 ; case 2
	b _0204E8D4 ; case 3
_0204E83C:
	mov r0, #0
	mov r1, #0x27
	mov r2, #0xd7
	bl SaveScriptVariableValue
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldr r1, _0204E8E4 ; =_022AB518
	ldrb r0, [r0]
	bl sub_0205F00C
	cmp r0, #0
	beq _0204E8D4
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrb r1, [r1, #0x1d]
	cmp r1, #0
	beq _0204E8A0
	add r0, r0, #4
	bl sub_0204F7A8
	ldr r1, _0204E8E8 ; =CLIENT_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r1, [r1, r0]
	ldr r3, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov ip, #1
	ldr r0, _0204E8E4 ; =_022AB518
	mov r2, #0
	strb ip, [r3, #0x1d]
	bl ApplyLevelUpBoostsToGroundMonster
_0204E8A0:
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r1, #1
	strb r1, [r0, #0xf]
	b _0204E8D4
_0204E8B0:
	mov r0, #0
	mov r1, #0x27
	mov r2, #0xd6
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsb r2, [r1, #0x12]
	mov r1, #0x29
	bl SaveScriptVariableValue
_0204E8D4:
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E8E0: .word PENDING_DUNGEON_ID
_0204E8E4: .word _022AB518
_0204E8E8: .word CLIENT_LEVEL_TABLE
	arm_func_end sub_0204E7B8

	arm_func_start sub_0204E8EC
sub_0204E8EC: ; 0x0204E8EC
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0204E920
	ldr lr, _0204E944 ; =PENDING_DUNGEON_ID
	mov ip, #0xb
_0204E900:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204E900
	ldr r0, _0204E948 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r4, pc}
_0204E920:
	mov r3, #0
	ldr r0, _0204E944 ; =PENDING_DUNGEON_ID
	sub r2, r3, #1
	strb r2, [r0, #0xd]
	ldr r1, _0204E948 ; =_022AB4F8
	strb r2, [r0, #0xe]
	strb r3, [r1]
	strh r2, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E944: .word PENDING_DUNGEON_ID
_0204E948: .word _022AB4F8
	arm_func_end sub_0204E8EC

	arm_func_start SetEnterDungeon
SetEnterDungeon: ; 0x0204E94C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0204E96C ; =PENDING_DUNGEON_ID
	bl InitDungeonInit
	ldr r0, _0204E970 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E96C: .word PENDING_DUNGEON_ID
_0204E970: .word _022AB4F8
	arm_func_end SetEnterDungeon

	arm_func_start sub_0204E974
sub_0204E974: ; 0x0204E974
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0205B77C
	ldr r2, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r1, #2
	mov r4, r0
	strb r1, [r2, #0xd]
	sub r0, r1, #3
	strb r0, [r2, #0xe]
	mov r0, #0xd6
	strh r0, [r2, #2]
	ldr r0, _0204EA50 ; =_022AB510
	mov r1, r5
	strb r5, [r2, #0x12]
	bl sub_0205BB7C
	ldr r0, _0204EA54 ; =_022AB5A8
	mov r1, r5
	bl sub_0205BD14
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r2, [r1, #0xf]
	strb r2, [r1, #0x10]
	strb r2, [r1, #4]
	mov r0, #7
	strb r2, [r1, #0x11]
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r0, [r1, #5]
	mov r0, #6
	strb r2, [r1, #6]
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	strb r0, [r1, #8]
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r0, [r1, #9]
	strb r2, [r1, #0xa]
	strb r2, [r1, #0xb]
	strb r2, [r1, #7]
	strb r2, [r1, #0xc]
	ldrb r0, [r4, #4]
	add r0, r0, #0xda
	and r0, r0, #0xff
	cmp r0, #5
	strlsb r2, [r1, #5]
	movls r0, #1
	strlsb r0, [r1, #7]
	ldr r0, _0204EA58 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204EA4C: .word PENDING_DUNGEON_ID
_0204EA50: .word _022AB510
_0204EA54: .word _022AB5A8
_0204EA58: .word _022AB4F8
	arm_func_end sub_0204E974

	arm_func_start InitDungeonInit
InitDungeonInit: ; 0x0204EA5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl GetGameMode
	mov r4, r0
	mov r0, r6
	strh r6, [r7, #2]
	bl DungeonSwapIdxToId
	strb r0, [r7]
	mov r1, #1
	strb r1, [r7, #1]
	sub r1, r1, #2
	strb r1, [r7, #0x12]
	mov r0, #0
	str r0, [r7, #0xac]
	strb r0, [r7, #0xd]
	strb r1, [r7, #0xe]
	strb r0, [r7, #4]
	strb r0, [r7, #0xf]
	strb r0, [r7, #0x10]
	strb r0, [r7, #0x11]
	cmp r4, #2
	strneb r0, [r7, #5]
	strneb r0, [r7, #6]
	strneb r0, [r7, #8]
	bne _0204EAF0
	mov r0, #7
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #5]
	mov r0, #5
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #6]
	mov r0, #6
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #8]
	mov r0, #1
	bl GetPerformanceFlagWithChecks
_0204EAF0:
	strb r0, [r7, #9]
	mov r3, #0
	strb r3, [r7, #0xa]
	strb r3, [r7, #0xb]
	strb r3, [r7, #7]
	strb r3, [r7, #0xc]
	mov r1, r3
	mov r0, #0x44
_0204EB10:
	mla r2, r3, r0, r7
	strb r1, [r2, #0x1c]
	add r3, r3, #1
	strh r1, [r2, #0x20]
	cmp r3, #2
	blt _0204EB10
	cmp r4, #5
	bne _0204EB88
	mov r0, #1
	strb r0, [r7, #5]
	strb r1, [r7, #6]
	strb r1, [r7, #8]
	strb r1, [r7, #9]
	strb r1, [r7, #0xb]
	mov r0, #3
	strb r0, [r7, #0xd]
	strb r1, [r7, #4]
	sub r0, r6, #0x26
	strb r1, [r7, #0x11]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0204EB84
_0204EB68: ; jump table
	b _0204EB80 ; case 0
	b _0204EB80 ; case 1
	b _0204EB80 ; case 2
	b _0204EB80 ; case 3
	b _0204EB80 ; case 4
	b _0204EB80 ; case 5
_0204EB80:
	strb r1, [r7, #5]
_0204EB84:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204EB88:
	mov r0, r6
	bl GetDungeonModeSpecial
	cmp r0, #1
	beq _0204EBB0
	cmp r0, #2
	beq _0204EF50
	cmp r0, #3
	moveq r0, #0
	streqb r0, [r7, #0xd]
	b _0204EF88
_0204EBB0:
	mov r4, #0
	mov r0, r6
	strb r4, [r7, #0xd]
	mov r5, r4
	bl IsNoLossPenaltyDungeon
	strb r0, [r7, #0xc]
	cmp r6, #0x44
	bgt _0204ECA4
	bge _0204EE70
	cmp r6, #0x3e
	bgt _0204EC60
	bge _0204EE68
	cmp r6, #0x21
	bgt _0204EC1C
	bge _0204EDEC
	cmp r6, #0xb
	bgt _0204EC10
	subs r0, r6, #8
	addpl pc, pc, r0, lsl #2
	b _0204EF34
_0204EC00: ; jump table
	b _0204ED88 ; case 0
	b _0204ED9C ; case 1
	b _0204EDB0 ; case 2
	b _0204EDC4 ; case 3
_0204EC10:
	cmp r6, #0x20
	beq _0204EDD8
	b _0204EF34
_0204EC1C:
	cmp r6, #0x22
	bgt _0204EC2C
	beq _0204EE10
	b _0204EF34
_0204EC2C:
	sub r0, r6, #0x23
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0204EF34
_0204EC3C: ; jump table
	b _0204EE24 ; case 0
	b _0204EF34 ; case 1
	b _0204EF34 ; case 2
	b _0204EE48 ; case 3
	b _0204EE48 ; case 4
	b _0204EE48 ; case 5
	b _0204EE60 ; case 6
	b _0204EE60 ; case 7
	b _0204EE60 ; case 8
_0204EC60:
	cmp r6, #0x41
	bgt _0204EC88
	bge _0204EE68
	cmp r6, #0x3f
	bgt _0204EC7C
	beq _0204EE68
	b _0204EF34
_0204EC7C:
	cmp r6, #0x40
	beq _0204EE68
	b _0204EF34
_0204EC88:
	cmp r6, #0x42
	bgt _0204EC98
	beq _0204EE68
	b _0204EF34
_0204EC98:
	cmp r6, #0x43
	beq _0204EE70
	b _0204EF34
_0204ECA4:
	cmp r6, #0x73
	bgt _0204ECF4
	bge _0204EE88
	cmp r6, #0x70
	bgt _0204ECD8
	bge _0204EE88
	cmp r6, #0x45
	bgt _0204ECCC
	beq _0204EE70
	b _0204EF34
_0204ECCC:
	cmp r6, #0x6f
	beq _0204EE88
	b _0204EF34
_0204ECD8:
	cmp r6, #0x71
	bgt _0204ECE8
	beq _0204EE88
	b _0204EF34
_0204ECE8:
	cmp r6, #0x72
	beq _0204EE88
	b _0204EF34
_0204ECF4:
	cmp r6, #0x76
	bgt _0204ED1C
	bge _0204EE88
	cmp r6, #0x74
	bgt _0204ED10
	beq _0204EE88
	b _0204EF34
_0204ED10:
	cmp r6, #0x75
	beq _0204EE88
	b _0204EF34
_0204ED1C:
	cmp r6, #0x87
	bgt _0204ED7C
	subs r0, r6, #0x78
	addpl pc, pc, r0, lsl #2
	b _0204ED70
_0204ED30: ; jump table
	b _0204EE88 ; case 0
	b _0204EE88 ; case 1
	b _0204EE88 ; case 2
	b _0204EE9C ; case 3
	b _0204EEC4 ; case 4
	b _0204EF34 ; case 5
	b _0204EF34 ; case 6
	b _0204EF34 ; case 7
	b _0204EEEC ; case 8
	b _0204EF34 ; case 9
	b _0204EF34 ; case 10
	b _0204EF34 ; case 11
	b _0204EF34 ; case 12
	b _0204EF34 ; case 13
	b _0204EF34 ; case 14
	b _0204EF10 ; case 15
_0204ED70:
	cmp r6, #0x77
	beq _0204EE88
	b _0204EF34
_0204ED7C:
	cmp r6, #0xa4
	beq _0204EF24
	b _0204EF34
_0204ED88:
	ldr r2, _0204EF98 ; =_020A2904
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204ED9C:
	ldr r2, _0204EF9C ; =_020A2AD8
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDB0:
	ldr r2, _0204EFA0 ; =_020A2AB4
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDC4:
	ldr r2, _0204EFA4 ; =_020A294C
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDD8:
	ldr r2, _0204EFA8 ; =_020A2970
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	b _0204EF34
_0204EDEC:
	ldr r2, _0204EFAC ; =_020A2A48
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	ldr r2, _0204EFB0 ; =_020A2A24
	mov r0, r7
	mov r1, #1
	bl AddGuestMonster
	b _0204EF34
_0204EE10:
	ldr r2, _0204EFB4 ; =_020A29DC
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EE24:
	mov r0, #0x19
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFB8 ; =_020A2A00
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EE48:
	ldr r2, _0204EFBC ; =_020A2A6C
	mov r0, r7
	mov r1, r4
	mov r5, #1
	bl AddGuestMonster
	b _0204EF34
_0204EE60:
	mov r4, #1
	b _0204EF34
_0204EE68:
	mov r4, #1
	b _0204EF34
_0204EE70:
	ldr r2, _0204EFC0 ; =_020A2A90
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	mov r4, #1
	b _0204EF34
_0204EE88:
	ldr r2, _0204EFC4 ; =_020A2AFC
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	b _0204EF34
_0204EE9C:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFC8 ; =_020A2B20
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EEC4:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFCC ; =_020A2928
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EEEC:
	ldr r2, _0204EFD0 ; =GUEST_MONSTER_DATA
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	ldr r2, _0204EFD4 ; =_020A28E0
	mov r0, r7
	mov r1, #1
	bl AddGuestMonster
	b _0204EF34
_0204EF10:
	ldr r2, _0204EFD8 ; =_020A29B8
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EF24:
	ldr r2, _0204EFDC ; =_020A2994
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
_0204EF34:
	cmp r4, #0
	movne r0, #1
	strneb r0, [r7, #0xb]
	cmp r5, #0
	movne r0, #1
	strneb r0, [r7, #7]
	b _0204EF88
_0204EF50:
	sub r0, r6, #0x26
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0204EF80
_0204EF60: ; jump table
	b _0204EF78 ; case 0
	b _0204EF78 ; case 1
	b _0204EF78 ; case 2
	b _0204EF78 ; case 3
	b _0204EF78 ; case 4
	b _0204EF78 ; case 5
_0204EF78:
	mov r0, #1
	strb r0, [r7, #0xb]
_0204EF80:
	mov r0, #1
	strb r0, [r7, #0xd]
_0204EF88:
	mov r0, #0
	strb r0, [r7, #4]
	strb r0, [r7, #0x11]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0204EF98: .word _020A2904
_0204EF9C: .word _020A2AD8
_0204EFA0: .word _020A2AB4
_0204EFA4: .word _020A294C
_0204EFA8: .word _020A2970
_0204EFAC: .word _020A2A48
_0204EFB0: .word _020A2A24
_0204EFB4: .word _020A29DC
_0204EFB8: .word _020A2A00
_0204EFBC: .word _020A2A6C
_0204EFC0: .word _020A2A90
_0204EFC4: .word _020A2AFC
_0204EFC8: .word _020A2B20
_0204EFCC: .word _020A2928
_0204EFD0: .word GUEST_MONSTER_DATA
_0204EFD4: .word _020A28E0
_0204EFD8: .word _020A29B8
_0204EFDC: .word _020A2994
	arm_func_end InitDungeonInit

	arm_func_start IsNoLossPenaltyDungeon
IsNoLossPenaltyDungeon: ; 0x0204EFE0
	stmdb sp!, {r4, lr}
	cmp r0, #0x1a
	mov r4, #0
	cmpne r0, #0x79
	beq _0204F000
	cmp r0, #0x7d
	beq _0204F008
	b _0204F01C
_0204F000:
	mov r4, #1
	b _0204F01C
_0204F008:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	moveq r4, #1
_0204F01C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end IsNoLossPenaltyDungeon

	arm_func_start sub_0204F024
sub_0204F024: ; 0x0204F024
	ldr r1, _0204F030 ; =PENDING_DUNGEON_ID
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0204F030: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204F024

	arm_func_start sub_0204F034
sub_0204F034: ; 0x0204F034
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F034

	arm_func_start sub_0204F050
sub_0204F050: ; 0x0204F050
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mvn r1, #0
	cmp r0, r1
	cmpne r0, #0xd6
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd7
	cmpeq r0, #0xd9
	cmpeq r0, #0xd8
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F050

	arm_func_start sub_0204F0A0
sub_0204F0A0: ; 0x0204F0A0
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mvn r1, #0
	cmp r1, r0, asr #16
	mov r0, r0, asr #0x10
	moveq r0, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd6
	moveq r0, #0xd4
	ldmeqia sp!, {r3, pc}
	sub r1, r0, #0xd7
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	bhi _0204F104
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_0204F104:
	bl DungeonSwapIdxToId
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F0A0

	arm_func_start sub_0204F10C
sub_0204F10C: ; 0x0204F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mvn r0, #0
	cmp r1, r0
	cmpne r1, #0xd6
	cmpne r1, #0xd7
	cmpne r1, #0xd8
	cmpne r1, #0xd9
	movne r0, #1
	strneh r1, [r4]
	mvneq r0, #0
	streqh r0, [r4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F10C

	arm_func_start sub_0204F158
sub_0204F158: ; 0x0204F158
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd7
	bne _0204F1AC
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	cmp r0, #0xff
	beq _0204F1AC
	cmp r0, #0xb4
	strlob r0, [r4]
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_0204F1AC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F158

	arm_func_start sub_0204F1B4
sub_0204F1B4: ; 0x0204F1B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd6
	mov r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, #0x29
	bl LoadScriptVariableValue
	strb r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F1B4

	arm_func_start sub_0204F1F0
sub_0204F1F0: ; 0x0204F1F0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	beq _0204F22C
	ldr lr, _0204F23C ; =_022AB5AC
	mov ip, #0xe
_0204F208:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F208
	ldmia r5, {r0, r1}
	ldr r2, _0204F240 ; =_022AB4F8
	stmia lr, {r0, r1}
	strb r4, [r2, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F22C:
	ldr r0, _0204F240 ; =_022AB4F8
	mov r1, #0
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F23C: .word _022AB5AC
_0204F240: .word _022AB4F8
	arm_func_end sub_0204F1F0

	arm_func_start sub_0204F244
sub_0204F244: ; 0x0204F244
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0204F270
	ldr lr, _0204F27C ; =_022AB5AC
	mov ip, #0xe
_0204F258:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F258
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
_0204F270:
	ldr r0, _0204F280 ; =_022AB4F8
	ldrb r0, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204F27C: .word _022AB5AC
_0204F280: .word _022AB4F8
	arm_func_end sub_0204F244

	arm_func_start sub_0204F284
sub_0204F284: ; 0x0204F284
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	add r0, sp, #0
	mov sb, r1
	bl GetPartyMembers
	mov r6, r0
	mov r0, sl
	bl GetMaxMembersAllowed
	cmp r6, r0
	ble _0204F2C0
	cmp r0, #1
	ldreq r0, _0204F354 ; =0x00000301
	ldrne r0, _0204F358 ; =0x00000101
	b _0204F34C
_0204F2C0:
	cmp sb, #0
	beq _0204F2D8
	add r0, r6, #1
	cmp r0, #4
	ldrgt r0, _0204F358 ; =0x00000101
	bgt _0204F34C
_0204F2D8:
	mov r7, #0
	mov r8, r7
	add r5, sp, #0
	ldr r4, _0204F35C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, #0x44
	b _0204F310
_0204F2F0:
	mov r0, r8, lsl #1
	ldrsh r0, [r5, r0]
	ldr r1, [r4]
	smlabb r0, r0, fp, r1
	ldrsh r0, [r0, #4]
	bl GetBodySize
	add r7, r7, r0
	add r8, r8, #1
_0204F310:
	cmp r8, r6
	blt _0204F2F0
	cmp sb, #0
	beq _0204F32C
	mov r0, sb
	bl GetBodySize
	add r7, r7, r0
_0204F32C:
	cmp r7, #6
	movgt r0, #0x81
	bgt _0204F34C
	mov r0, sl
	bl IsLevelResetDungeon
	cmp r0, #0
	ldrne r0, _0204F360 ; =0x00002002
	moveq r0, #0
_0204F34C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204F354: .word 0x00000301
_0204F358: .word 0x00000101
_0204F35C: .word TEAM_MEMBER_TABLE_PTR
_0204F360: .word 0x00002002
	arm_func_end sub_0204F284

	arm_func_start sub_0204F364
sub_0204F364: ; 0x0204F364
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	bl GetMaxItemsAllowed
	mov r4, r0
	bl GetNbItemsInBag
	cmp r4, #0
	ble _0204F39C
	cmp r4, r0
	bge _0204F39C
	orr r5, r5, #2
	cmp r4, #0
	orreq r5, r5, #0x800
	orrne r5, r5, #0x400
_0204F39C:
	mov r0, r6
	bl IsMoneyAllowed
	cmp r0, #0
	bne _0204F3BC
	bl GetMoneyCarried
	cmp r0, #0
	orrgt r5, r5, #2
	orrgt r5, r5, #0x1000
_0204F3BC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0204F364

	arm_func_start CheckMissionRestrictions
CheckMissionRestrictions: ; 0x0204F3C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetGameMode
	cmp r0, #2
	bne _0204F424
	mov r0, r5
	bl DungeonSwapIdToIdx
	bl GetDungeonModeSpecial
	cmp r0, #2
	bne _0204F424
	add r1, sp, #2
	add r2, sp, #0
	mov r0, r5
	bl sub_0205EE40
	cmp r0, #0
	beq _0204F424
	ldrsh r0, [sp]
	cmp r0, #0
	movne r0, #0x21
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #2]
	cmp r0, #0
	movne r0, #0x41
	ldmneia sp!, {r3, r4, r5, pc}
_0204F424:
	cmp r5, #0x26
	cmpne r5, #0x29
	cmpne r5, #0x3f
	cmpne r5, #0x63
	cmpne r5, #0x64
	cmpne r5, #0x65
	cmpne r5, #0x66
	cmpne r5, #0x67
	cmpne r5, #0x68
	cmpne r5, #0x6b
	cmpne r5, #0x6c
	cmpne r5, #0x6d
	cmpne r5, #0x6e
	cmpne r5, #0xae
	ldreq r0, _0204F484 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0
	bl sub_0204F284
	mov r4, r0
	mov r0, r5
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F484: .word 0x00004001
	arm_func_end CheckMissionRestrictions

	arm_func_start sub_0204F488
sub_0204F488: ; 0x0204F488
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl DungeonSwapIdToIdx
	mov r5, r0
	mov r0, sb
	bl GetMaxReachedFloor
	mov r6, r0
	mov r0, r5
	bl GetDungeonMode
	mov r4, r0
	cmp r4, #1
	moveq r0, #0x11
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #1
	bge _0204F4EC
	mov r0, r5
	bl sub_0204CEE0
	cmp r0, #0
	bne _0204F4EC
	cmp r4, #3
	movne r0, #5
	moveq r0, #9
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0204F4EC:
	cmp r8, r6
	movgt r0, #9
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp sb, #0x26
	cmpne sb, #0x29
	cmpne sb, #0x3f
	cmpne sb, #0x63
	cmpne sb, #0x64
	cmpne sb, #0x65
	cmpne sb, #0x66
	cmpne sb, #0x67
	cmpne sb, #0x68
	cmpne sb, #0x6b
	cmpne sb, #0x6c
	cmpne sb, #0x6d
	cmpne sb, #0x6e
	cmpne sb, #0xae
	ldreq r0, _0204F558 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r7
	bl sub_0204F284
	mov r4, r0
	mov r0, sb
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204F558: .word 0x00004001
	arm_func_end sub_0204F488

	arm_func_start sub_0204F55C
sub_0204F55C: ; 0x0204F55C
	ldr r1, _0204F578 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r1, r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0204F578: .word SECONDARY_TERRAIN_TYPES
	arm_func_end sub_0204F55C

	arm_func_start GetNbFloors
GetNbFloors: ; 0x0204F57C
	cmp r0, #0xb4
	blo _0204F590
	cmp r0, #0xbd
	movls r0, #5
	bxls lr
_0204F590:
	cmp r0, #0xbe
	moveq r0, #1
	bxeq lr
	cmp r0, #0xbf
	ldrlo r1, _0204F5B0 ; =DUNGEON_DATA_LIST
	movhs r0, #0x30
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5B0: .word DUNGEON_DATA_LIST
	arm_func_end GetNbFloors

	arm_func_start GetNbFloorsPlusOne
GetNbFloorsPlusOne: ; 0x0204F5B4
	stmdb sp!, {r3, lr}
	bl GetNbFloors
	add r0, r0, #1
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end GetNbFloorsPlusOne

	arm_func_start GetDungeonGroup
GetDungeonGroup: ; 0x0204F5C8
	cmp r0, #0xb4
	ldrlo r1, _0204F5DC ; =_0209E3A1
	movhs r0, #0x35
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5DC: .word _0209E3A1
	arm_func_end GetDungeonGroup

	arm_func_start GetNbPrecedingFloors
GetNbPrecedingFloors: ; 0x0204F5E0
	cmp r0, #0xb4
	ldrlo r1, _0204F5F4 ; =_0209E3A2
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5F4: .word _0209E3A2
	arm_func_end GetNbPrecedingFloors

	arm_func_start GetNbFloorsDungeonGroup
GetNbFloorsDungeonGroup: ; 0x0204F5F8
	cmp r0, #0xb4
	ldrlo r1, _0204F60C ; =_0209E3A3
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F60C: .word _0209E3A3
	arm_func_end GetNbFloorsDungeonGroup

	arm_func_start sub_0204F610
sub_0204F610: ; 0x0204F610
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0xb4
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	bl GetMaxMembersAllowed
	cmp r0, #1
	bne _0204F644
	mov r0, r4
	bl IsRecruitingAllowed
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0204F644:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F610

	arm_func_start DungeonFloorToGroupFloor
DungeonFloorToGroupFloor: ; 0x0204F64C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r0
	ldrb r0, [r5]
	cmp r0, #0xb4
	blo _0204F690
	cmp r0, #0xbd
	bhi _0204F690
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	sub r0, r0, #0xb4
	add r0, r0, r0, lsl #2
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F690:
	cmp r0, #0xbe
	bne _0204F6B0
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x32
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6B0:
	cmp r0, #0xbf
	blo _0204F6D8
	cmp r0, #0xd3
	bhi _0204F6D8
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x33
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6D8:
	bl GetDungeonGroup
	strb r0, [r4]
	ldrb r0, [r5]
	bl GetNbPrecedingFloors
	ldrb r1, [r5, #1]
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonFloorToGroupFloor

	arm_func_start sub_0204F6F8
sub_0204F6F8: ; 0x0204F6F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r1, r2
	bl sub_0204F77C
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _0204F770
_0204F718: ; jump table
	b _0204F728 ; case 0
	b _0204F734 ; case 1
	b _0204F74C ; case 2
	b _0204F760 ; case 3
_0204F728:
	bl GetGroundNameId
	mov r4, r0
	b _0204F770
_0204F734:
	bl GetGroundNameId
#ifdef JAPAN
	add r0, r0, #3
	add r0, r0, #0x100
#else
	ldr r1, _0204F778 ; =0xFFFFFEFD
	add r0, r0, r1
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F74C:
#if defined(EUROPE)
	add r0, r0, #0xbe
	add r0, r0, #0x4300
#elif defined(JAPAN)
	add r0, r0, #0x26c
	add r0, r0, #0x400
#else
	add r0, r0, #0x3bc
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F760:
#if defined(EUROPE)
	add r0, r0, #0xbd
	add r0, r0, #0x4200
#elif defined(JAPAN)
	add r0, r0, #0x6f
	add r0, r0, #0x700
#else
	add r0, r0, #0xbb
	add r0, r0, #0x4200
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
_0204F770:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifndef JAPAN
_0204F778: .word 0xFFFFFEFD
#endif
	arm_func_end sub_0204F6F8

	arm_func_start sub_0204F77C
sub_0204F77C: ; 0x0204F77C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	beq _0204F7A0
	cmp r5, #0xae
	bne _0204F7A0
	bl GetNbFloorsDungeonGroup
	cmp r4, r0
	moveq r5, #0x7f
_0204F7A0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204F77C

	arm_func_start sub_0204F7A8
sub_0204F7A8: ; 0x0204F7A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F808
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F808
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	ldrlo r1, _0204F810 ; =MISSION_FLOOR_RANKS_PTRS
	ldrlob r0, [sp, #1]
	ldrlo r1, [r1, r2, lsl #2]
	ldrlob r0, [r1, r0]
_0204F808:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F810: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end sub_0204F7A8

	arm_func_start GetMissionRank
GetMissionRank: ; 0x0204F814
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F880
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F880
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	bhs _0204F880
	ldrb r1, [sp, #1]
	ldr r0, _0204F888 ; =MISSION_FLOOR_RANKS_PTRS
	cmp r1, #1
	ldr r0, [r0, r2, lsl #2]
	movle r1, #2
	ldrb r0, [r0, r1]
_0204F880:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F888: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end GetMissionRank

	arm_func_start GetOutlawLevel
GetOutlawLevel: ; 0x0204F88C
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8A4 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8A4: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLevel

	arm_func_start GetOutlawLeaderLevel
GetOutlawLeaderLevel: ; 0x0204F8A8
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8C0 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8C0: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLeaderLevel

	arm_func_start GetOutlawMinionLevel
GetOutlawMinionLevel: ; 0x0204F8C4
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8DC ; =OUTLAW_MINION_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8DC: .word OUTLAW_MINION_LEVEL_TABLE
	arm_func_end GetOutlawMinionLevel

	arm_func_start AddGuestMonster
AddGuestMonster: ; 0x0204F8E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	add lr, sp, #0x18
	mov r5, r0
	mov r4, r1
	mov r6, r2
	mov ip, #2
_0204F8FC:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F8FC
	ldr r1, [r6]
	mov r0, #1
	str r1, [lr]
	strb r0, [r5, #0xf]
	ldrsh r0, [sp, #0x1c]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
	mov r2, #0xa
	bl StrncpyName
	add r2, sp, #0
	add r1, r5, #0x1c
	mov r0, #0x44
	mla r0, r4, r0, r1
	add r1, sp, #0x18
	str r2, [sp, #0x18]
	bl GuestMonsterToGroundMonster
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end AddGuestMonster

	arm_func_start GetGroundNameId
GetGroundNameId: ; 0x0204F958
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #6
	bne _0204F980
	mov r0, #0x1b
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _0204F99C
	ldr r0, _0204F9B0 ; =0x000042B9
	ldmia sp!, {r4, pc}
_0204F980:
	cmp r4, #0x15
	bne _0204F99C
	mov r0, #0x1c
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
#ifdef JAPAN
	moveq r0, #0x1c4
#else
	ldreq r0, _0204F9B4 ; =0x000042BA
#endif
	ldmeqia sp!, {r4, pc}
_0204F99C:
#if defined(EUROPE)
	add r0, r4, #0xba
	add r0, r0, #0x4100
#elif defined(JAPAN)
	add r0, r4, #0xc2
#else
	add r0, r4, #0x1b8
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0204F9B0: .word 0x000042BB
_0204F9B4: .word 0x000042BC
#elif defined(JAPAN)
_0204F9B0: .word 0x000001C3
#else
_0204F9B0: .word 0x000042B9
_0204F9B4: .word 0x000042BA
#endif
	arm_func_end GetGroundNameId

	arm_func_start sub_0204F9B8
sub_0204F9B8: ; 0x0204F9B8
	ldr ip, _0204F9C4 ; =ResetPlayTimer
	ldr r0, _0204F9C8 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9C4: .word ResetPlayTimer
_0204F9C8: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9B8

	arm_func_start sub_0204F9CC
sub_0204F9CC: ; 0x0204F9CC
	ldr ip, _0204F9D8 ; =PlayTimerTick
	ldr r0, _0204F9DC ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9D8: .word PlayTimerTick
_0204F9DC: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9CC

	arm_func_start sub_0204F9E0
sub_0204F9E0: ; 0x0204F9E0
	ldr ip, _0204F9EC ; =GetPlayTimeSeconds
	ldr r0, _0204F9F0 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9EC: .word GetPlayTimeSeconds
_0204F9F0: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9E0

	arm_func_start sub_0204F9F4
sub_0204F9F4: ; 0x0204F9F4
	ldr ip, _0204FA04 ; =sub_02050E5C
	mov r1, r0
	ldr r0, _0204FA08 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA04: .word sub_02050E5C
_0204FA08: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9F4

	arm_func_start sub_0204FA0C
sub_0204FA0C: ; 0x0204FA0C
	ldr ip, _0204FA1C ; =sub_02050E8C
	mov r1, r0
	ldr r0, _0204FA20 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA1C: .word sub_02050E8C
_0204FA20: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204FA0C

	arm_func_start SetAdventureLogStructLocation
SetAdventureLogStructLocation: ; 0x0204FA24
	ldr r1, _0204FA34 ; =_022AB69C
	ldr r0, _0204FA38 ; =ADVENTURE_LOG_PTR
	str r1, [r0]
	bx lr
	.align 2, 0
_0204FA34: .word _022AB69C
_0204FA38: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogStructLocation

	arm_func_start SetAdventureLogDungeonFloor
SetAdventureLogDungeonFloor: ; 0x0204FA3C
	ldr r1, _0204FA58 ; =ADVENTURE_LOG_PTR
	ldrb r2, [r0]
	ldr r1, [r1]
	strb r2, [r1, #0x278]
	ldrb r0, [r0, #1]
	strb r0, [r1, #0x279]
	bx lr
	.align 2, 0
_0204FA58: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogDungeonFloor

	arm_func_start GetAdventureLogDungeonFloor
GetAdventureLogDungeonFloor: ; 0x0204FA5C
	ldr r0, _0204FA6C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	add r0, r0, #0x278
	bx lr
	.align 2, 0
_0204FA6C: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogDungeonFloor

	arm_func_start ClearAdventureLogStruct
ClearAdventureLogStruct: ; 0x0204FA70
	mov r3, #0
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r0, r3
_0204FA7C:
	ldr r2, [r1]
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _0204FA7C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r2, [r1]
	str r0, [r2, #0x30]
	ldr r2, [r1]
	str r0, [r2, #0x34]
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	str r0, [r2, #0x14]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x20]
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r2, [r1]
	str r0, [r2, #0x3c]
	ldr r2, [r1]
	str r0, [r2, #0x40]
_0204FB00:
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	str r3, [r2, #0x44]
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	add r0, r0, #1
	str r3, [r2, #0xd8]
	cmp r0, #0x25
	blt _0204FB00
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r2, #0
_0204FB2C:
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x16c]
	cmp r3, #0x11
	blt _0204FB2C
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov ip, #0
_0204FB4C:
	ldr r1, [r0]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str ip, [r1, #0x1b0]
	cmp r2, #0x2c
	blt _0204FB4C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	ldr r0, [r1]
	str ip, [r0, #0x260]
	mov r0, #0x3e8
_0204FB74:
	rsb r2, ip, #5
	mul r3, r2, r0
	ldr r2, [r1]
	add r2, r2, ip, lsl #2
	add ip, ip, #1
	str r3, [r2, #0x264]
	cmp ip, #5
	blt _0204FB74
	bx lr
	.align 2, 0
_0204FB98: .word ADVENTURE_LOG_PTR
	arm_func_end ClearAdventureLogStruct

	arm_func_start SetAdventureLogCompleted
SetAdventureLogCompleted: ; 0x0204FB9C
	ldr r1, _0204FBC0 ; =ADVENTURE_LOG_PTR
	mov r3, r0, asr #5
	ldr ip, [r1]
	and r0, r0, #0x1f
	ldr r2, [ip, r3, lsl #2]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [ip, r3, lsl #2]
	bx lr
	.align 2, 0
_0204FBC0: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogCompleted

	arm_func_start IsAdventureLogNotEmpty
IsAdventureLogNotEmpty: ; 0x0204FBC4
	ldr r0, _0204FBF8 ; =ADVENTURE_LOG_PTR
	mov r1, #0
	ldr r2, [r0]
	b _0204FBE8
_0204FBD4:
	ldr r0, [r2, r1, lsl #2]
	cmp r0, #0
	movne r0, #1
	bxne lr
	add r1, r1, #1
_0204FBE8:
	cmp r1, #4
	blt _0204FBD4
	mov r0, #0
	bx lr
	.align 2, 0
_0204FBF8: .word ADVENTURE_LOG_PTR
	arm_func_end IsAdventureLogNotEmpty

	arm_func_start GetAdventureLogCompleted
GetAdventureLogCompleted: ; 0x0204FBFC
	ldr r1, _0204FC24 ; =ADVENTURE_LOG_PTR
	mov r2, r0, asr #5
	ldr r1, [r1]
	and r3, r0, #0x1f
	ldr r0, [r1, r2, lsl #2]
	mov r1, #1
	tst r0, r1, lsl r3
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204FC24: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogCompleted

	arm_func_start IncrementNbDungeonsCleared
IncrementNbDungeonsCleared: ; 0x0204FC28
	ldr r0, _0204FC64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FC68 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x10]
	add r2, r2, #1
	str r2, [r3, #0x10]
	ldr r3, [r0]
	ldr r2, [r3]
	orr r2, r2, #0x10
	str r2, [r3]
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, r1
	strgt r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0204FC64: .word ADVENTURE_LOG_PTR
_0204FC68: .word 0x000F423F
	arm_func_end IncrementNbDungeonsCleared

	arm_func_start GetNbDungeonsCleared
GetNbDungeonsCleared: ; 0x0204FC6C
	ldr r0, _0204FC7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0204FC7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbDungeonsCleared

	arm_func_start IncrementNbFriendRescues
IncrementNbFriendRescues: ; 0x0204FC80
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FCC4 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x14]
	add r2, r2, #1
	str r2, [r3, #0x14]
	ldr r2, [r0]
	ldr r0, [r2, #0x14]
	cmp r0, r1
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x40
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FCC0: .word ADVENTURE_LOG_PTR
_0204FCC4: .word 0x000F423F
	arm_func_end IncrementNbFriendRescues

	arm_func_start GetNbFriendRescues
GetNbFriendRescues: ; 0x0204FCC8
	ldr r0, _0204FCD8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0204FCD8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFriendRescues

	arm_func_start IncrementNbEvolutions
IncrementNbEvolutions: ; 0x0204FCDC
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FD20 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	add r2, r2, #1
	str r2, [r3, #0x18]
	ldr r2, [r0]
	ldr r0, [r2, #0x18]
	cmp r0, r1
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x18]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x80
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD1C: .word ADVENTURE_LOG_PTR
_0204FD20: .word 0x000F423F
	arm_func_end IncrementNbEvolutions

	arm_func_start GetNbEvolutions
GetNbEvolutions: ; 0x0204FD24
	ldr r0, _0204FD34 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_0204FD34: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEvolutions

	arm_func_start IncrementNbSteals
IncrementNbSteals: ; 0x0204FD38
	bx lr
	arm_func_end IncrementNbSteals

	arm_func_start IncrementNbEggsHatched
IncrementNbEggsHatched: ; 0x0204FD3C
	ldr r1, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r0, _0204FD74 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x1c]
	ldr r0, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x100
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD70: .word ADVENTURE_LOG_PTR
_0204FD74: .word 0x000F423F
	arm_func_end IncrementNbEggsHatched

	arm_func_start GetNbEggsHatched
GetNbEggsHatched: ; 0x0204FD78
	ldr r0, _0204FD88 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
_0204FD88: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEggsHatched

	arm_func_start GetNbPokemonJoined
GetNbPokemonJoined: ; 0x0204FD8C
	ldr r0, _0204FD9C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_0204FD9C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonJoined

	arm_func_start GetNbMovesLearned
GetNbMovesLearned: ; 0x0204FDA0
	ldr r0, _0204FDB0 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bx lr
	.align 2, 0
_0204FDB0: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbMovesLearned

	arm_func_start SetVictoriesOnOneFloor
SetVictoriesOnOneFloor: ; 0x0204FDB4
	ldr r1, _0204FDE0 ; =0x000F423F
	cmp r0, r1
	movgt r0, r1
	ldr r1, _0204FDE4 ; =ADVENTURE_LOG_PTR
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r1, [r1]
	ldr r0, [r1]
	orr r0, r0, #0x200
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FDE0: .word 0x000F423F
_0204FDE4: .word ADVENTURE_LOG_PTR
	arm_func_end SetVictoriesOnOneFloor

	arm_func_start GetVictoriesOnOneFloor
GetVictoriesOnOneFloor: ; 0x0204FDE8
	ldr r0, _0204FDF8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_0204FDF8: .word ADVENTURE_LOG_PTR
	arm_func_end GetVictoriesOnOneFloor

	arm_func_start SetPokemonJoined
SetPokemonJoined: ; 0x0204FDFC
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FE54 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #1
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x44
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FE54: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonJoined

	arm_func_start SetPokemonBattled
SetPokemonBattled: ; 0x0204FE58
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FEB0 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #2
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0xd8
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FEB0: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonBattled

	arm_func_start GetNbPokemonBattled
GetNbPokemonBattled: ; 0x0204FEB4
	ldr r0, _0204FEC4 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0204FEC4: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonBattled

	arm_func_start IncrementNbBigTreasureWins
IncrementNbBigTreasureWins: ; 0x0204FEC8
	ldr r0, _0204FEE0 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FEE4 ; =SetNbBigTreasureWins
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FEE0: .word ADVENTURE_LOG_PTR
_0204FEE4: .word SetNbBigTreasureWins
	arm_func_end IncrementNbBigTreasureWins

	arm_func_start SetNbBigTreasureWins
SetNbBigTreasureWins: ; 0x0204FEE8
	ldr r2, _0204FF18 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF1C ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x400
	ldr r1, _0204FF18 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0204FF18: .word ADVENTURE_LOG_PTR
_0204FF1C: .word 0x000F423F
	arm_func_end SetNbBigTreasureWins

	arm_func_start GetNbBigTreasureWins
GetNbBigTreasureWins: ; 0x0204FF20
	ldr r0, _0204FF30 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bx lr
	.align 2, 0
_0204FF30: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbBigTreasureWins

	arm_func_start SetNbRecycled
SetNbRecycled: ; 0x0204FF34
	ldr r2, _0204FF64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF68 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x800
	ldr r1, _0204FF64 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0204FF64: .word ADVENTURE_LOG_PTR
_0204FF68: .word 0x000F423F
	arm_func_end SetNbRecycled

	arm_func_start GetNbRecycled
GetNbRecycled: ; 0x0204FF6C
	ldr r0, _0204FF7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bx lr
	.align 2, 0
_0204FF7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbRecycled

	arm_func_start IncrementNbSkyGiftsSent
IncrementNbSkyGiftsSent: ; 0x0204FF80
	ldr r0, _0204FF98 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FF9C ; =SetNbSkyGiftsSent
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FF98: .word ADVENTURE_LOG_PTR
_0204FF9C: .word SetNbSkyGiftsSent
	arm_func_end IncrementNbSkyGiftsSent

	arm_func_start SetNbSkyGiftsSent
SetNbSkyGiftsSent: ; 0x0204FFA0
	ldr r2, _0204FFD0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FFD4 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x1000
	ldr r1, _0204FFD0 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
_0204FFD0: .word ADVENTURE_LOG_PTR
_0204FFD4: .word 0x000F423F
	arm_func_end SetNbSkyGiftsSent

	arm_func_start GetNbSkyGiftsSent
GetNbSkyGiftsSent: ; 0x0204FFD8
	ldr r0, _0204FFE8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bx lr
	.align 2, 0
_0204FFE8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbSkyGiftsSent

	arm_func_start ComputeSpecialCounters
ComputeSpecialCounters: ; 0x0204FFEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r4
_0204FFF8:
	mov r0, #0x44
	mul sl, r8, r0
	ldr r0, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, sl]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205009C
	mov sb, #0
	mov r7, #1
	ldr r3, _02050230 ; =ADVENTURE_LOG_PTR
	ldr ip, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, sb
	mov lr, r7
	mov r2, #6
_0205003C:
	mul r1, sb, r2
	ldr r0, [ip]
	add r0, r0, sl
	add r5, r0, #0x22
	ldrb r0, [r5, r1]
	add r1, r5, r1
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	beq _02050090
	ldrh r0, [r1, #2]
	ldr r5, [r3]
	mov r1, r0, lsr #5
	add r6, r5, r1, lsl #2
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	ldr r5, [r6, #0x16c]
	add r0, r1, r0, ror #27
	orr r0, r5, lr, lsl r0
	str r0, [r6, #0x16c]
_02050090:
	add sb, sb, #1
	cmp sb, #4
	blt _0205003C
_0205009C:
	ldr r0, _02050234 ; =0x0000022B
	add r8, r8, #1
	cmp r8, r0
	blt _0204FFF8
	mov r6, #0
	add r5, r0, #0x258
_020500B4:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDexNumberVeneer
	add r6, r6, #1
	cmp r6, r5
	blt _020500B4
	mov r7, #0
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sb, _02050238 ; =0x0000021F
	mov r8, r7
	mov r6, #1
_020500E0:
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	bl IsRealMove
	cmp r0, #0
	beq _02050120
	mov r0, r8, asr #4
	add r0, r8, r0, lsr #27
	ldr r2, [r5]
	mov r0, r0, asr #5
	add r2, r2, r0, lsl #2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #27
	ldr r2, [r2, #0x16c]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	addne r7, r7, #1
_02050120:
	add r8, r8, #1
	cmp r8, sb
	blt _020500E0
	cmp r7, #0
	ble _02050150
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	str r7, [r1, #0x34]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
_02050150:
	mov sb, #1
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sl, _0205023C ; =0x00000483
	mov r8, #0
	mov r6, sb
_02050164:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetBaseFormCastformCherrimDeoxys
	mov r7, r0
	bl GetDexNumberVeneer
	cmp r0, #0
	beq _020501B4
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r5]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	ldr r2, [r2, #0x44]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	beq _020501B4
	mov r0, r7
	bl RecruitSpecialPokemonLog
_020501B4:
	add sb, sb, #1
	cmp sb, sl
	blt _02050164
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	mov r2, #1
	ldr r1, [r0]
	ldr r3, _02050240 ; =0x000001ED
	mov r0, r2
_020501D4:
	mov r5, r2, asr #4
	add r5, r2, r5, lsr #27
	mov sb, r5, asr #5
	mov r6, r2, lsr #0x1f
	rsb r5, r6, r2, lsl #27
	add r7, r1, sb, lsl #2
	add r6, r6, r5, ror #27
	add r5, r1, sb, lsl #2
	ldr r7, [r7, #0x44]
	ldr r5, [r5, #0xd8]
	tst r7, r0, lsl r6
	addne r8, r8, #1
	tst r5, r0, lsl r6
	add r2, r2, #1
	addne r4, r4, #1
	cmp r2, r3
	blt _020501D4
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	str r8, [r1, #0x2c]
	ldr r0, [r0]
	str r4, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205022C: .word TEAM_MEMBER_TABLE_PTR
_02050230: .word ADVENTURE_LOG_PTR
_02050234: .word 0x0000022B
_02050238: .word 0x0000021F
_0205023C: .word 0x00000483
_02050240: .word 0x000001ED
	arm_func_end ComputeSpecialCounters

	arm_func_start RecruitSpecialPokemonLog
RecruitSpecialPokemonLog: ; 0x02050244
	stmdb sp!, {r3, lr}
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	ldr r2, _020502AC ; =ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	mov r3, #0
	movge r0, r0, asr #0x10
_02050260:
	mov r1, r3, lsl #1
	ldrsh r1, [r2, r1]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r1, #0xc9
	bne _0205028C
	cmp r0, #0xc9
	blt _02050294
	cmp r0, #0xe4
	ble _0205029C
	b _02050294
_0205028C:
	cmp r1, r0
	beq _0205029C
_02050294:
	add r3, r3, #1
	b _02050260
_0205029C:
	add r0, r3, #0x24
	and r0, r0, #0xff
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, pc}
	.align 2, 0
_020502AC: .word ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	arm_func_end RecruitSpecialPokemonLog

	arm_func_start IncrementNbFainted
IncrementNbFainted: ; 0x020502B0
	ldr r1, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r0, _020502E8 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x24]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x24]
	ldr r0, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x20
	str r0, [r1]
	bx lr
	.align 2, 0
_020502E4: .word ADVENTURE_LOG_PTR
_020502E8: .word 0x000F423F
	arm_func_end IncrementNbFainted

	arm_func_start GetNbFainted
GetNbFainted: ; 0x020502EC
	ldr r0, _020502FC ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bx lr
	.align 2, 0
_020502FC: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFainted

	arm_func_start SetItemAcquired
SetItemAcquired: ; 0x02050300
	stmdb sp!, {r4, r5, r6, lr}
	ldrsh r0, [r0, #4]
	bl NormalizeTreasureBox
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsItemValidVeneer
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0x3b
	blt _02050380
	cmp r4, #0x41
	bgt _02050380
	sub r0, r4, #0x21
	and r0, r0, #0xff
	mov r5, #1
	bl SetAdventureLogCompleted
	mov r6, #0x1a
	b _02050364
_0205034C:
	and r0, r6, #0xff
	bl GetAdventureLogCompleted
	cmp r0, #0
	moveq r5, #0
	beq _0205036C
	add r6, r6, #1
_02050364:
	cmp r6, #0x20
	ble _0205034C
_0205036C:
	cmp r5, #0
	beq _02050380
	mov r0, #0x15
	mov r1, #1
	bl sub_0204CB2C
_02050380:
	ldr r3, _020503C8 ; =ADVENTURE_LOG_PTR
	mov r0, r4, asr #4
	ldr ip, [r3]
	add r0, r4, r0, lsr #27
	mov r2, r4, lsr #0x1f
	rsb r1, r2, r4, lsl #27
	add lr, ip, #0x1b0
	mov ip, r0, asr #5
	ldr r4, [lr, ip, lsl #2]
	add r0, r2, r1, ror #27
	mov r1, #1
	orr r0, r4, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldr r1, [r3]
	ldr r0, [r1]
	orr r0, r0, #8
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020503C8: .word ADVENTURE_LOG_PTR
	arm_func_end SetItemAcquired

	arm_func_start GetNbItemAcquired
GetNbItemAcquired: ; 0x020503CC
	stmdb sp!, {r4, lr}
	ldr r1, _0205041C ; =ADVENTURE_LOG_PTR
	mov r0, #0
	ldr r4, [r1]
	mov lr, r0
	mov ip, #1
_020503E4:
	mov r1, lr, asr #4
	add r1, lr, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, lr, lsr #0x1f
	rsb r1, r2, lr, lsl #27
	ldr r3, [r3, #0x1b0]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	add lr, lr, #1
	addne r0, r0, #1
	cmp lr, #0x580
	blt _020503E4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205041C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbItemAcquired

	arm_func_start SetChallengeLetterCleared
SetChallengeLetterCleared: ; 0x02050420
	stmdb sp!, {r4, lr}
	ldr r3, _020504A0 ; =ADVENTURE_LOG_PTR
	mov r2, r0, lsr #0x1f
	ldr ip, [r3]
	rsb r1, r2, r0, lsl #27
	mov lr, r0, lsr #5
	add r4, ip, #0x260
	ldr ip, [r4, lr, lsl #2]
	add r1, r2, r1, ror #27
	mov r0, #1
	orr r1, ip, r0, lsl r1
	str r1, [r4, lr, lsl #2]
	ldr r4, [r3]
	mov ip, r0
	b _02050488
_0205045C:
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, r0, lsr #0x1f
	rsb r1, r2, r0, lsl #27
	ldr r3, [r3, #0x260]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	ldmeqia sp!, {r4, pc}
	add r0, r0, #1
_02050488:
	cmp r0, #6
	blt _0205045C
	ldr r0, [r4, #4]
	orr r0, r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020504A0: .word ADVENTURE_LOG_PTR
	arm_func_end SetChallengeLetterCleared

	arm_func_start GetSentryDutyGamePoints
GetSentryDutyGamePoints: ; 0x020504A4
	ldr r1, _020504B8 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x264]
	bx lr
	.align 2, 0
_020504B8: .word ADVENTURE_LOG_PTR
	arm_func_end GetSentryDutyGamePoints

	arm_func_start SetSentryDutyGamePoints
SetSentryDutyGamePoints: ; 0x020504BC
	stmdb sp!, {r3, lr}
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	mov lr, #0
	ldr r2, [r1]
	b _020504EC
_020504D0:
	add r1, r2, lr, lsl #2
	ldr r1, [r1, #0x264]
	cmp r0, r1
	bhi _020504F4
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
_020504EC:
	cmp lr, #5
	blt _020504D0
_020504F4:
	cmp lr, #5
	mvnge r0, #0
	ldmgeia sp!, {r3, pc}
	mov ip, #4
	ldr r2, _02050548 ; =ADVENTURE_LOG_PTR
	b _02050528
_0205050C:
	ldr r3, [r2]
	sub r1, ip, #1
	add ip, r3, ip, lsl #2
	ldr r3, [ip, #0x260]
	mov r1, r1, lsl #0x10
	str r3, [ip, #0x264]
	mov ip, r1, asr #0x10
_02050528:
	cmp ip, lr
	bgt _0205050C
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r1, r1, lr, lsl #2
	str r0, [r1, #0x264]
	mov r0, lr
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050548: .word ADVENTURE_LOG_PTR
	arm_func_end SetSentryDutyGamePoints

	arm_func_start CopyLogTo
CopyLogTo: ; 0x0205054C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ComputeSpecialCounters
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x10
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x80
	ldr r1, [r1]
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl sub_020515C4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050734: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogTo

	arm_func_start CopyLogFrom
CopyLogFrom: ; 0x02050738
	stmdb sp!, {r4, lr}
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	mov r4, r0
	add r1, r1, #0x10
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x80
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x2c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl Copy16BitsFrom
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050918: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogFrom

	arm_func_start GetAbilityString
GetAbilityString: ; 0x0205091C
#if defined(EUROPE)
	add r1, r1, #0x5e0
	add r1, r1, #0x3000
#elif defined(JAPAN)
	add r1, r1, #0x81
	add r1, r1, #0x4800
#else
	add r1, r1, #0xde
	add r1, r1, #0x3500
#endif
	mov r1, r1, lsl #0x10
	ldr ip, _02050938 ; =CopyNStringFromId
	mov r1, r1, lsr #0x10
	mov r2, #0x50
	bx ip
	.align 2, 0
_02050938: .word CopyNStringFromId
	arm_func_end GetAbilityString

	arm_func_start GetAbilityDescStringId
GetAbilityDescStringId: ; 0x0205093C
#if defined(EUROPE)
	add r0, r0, #0x25c
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r0, #0xfd
	add r0, r0, #0x4800
#else
	add r0, r0, #0x5a
	add r0, r0, #0x3600
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetAbilityDescStringId

	arm_func_start GetTypeStringId
GetTypeStringId: ; 0x02050950
#if defined(EUROPE)
	add r0, r0, #0xcd
	add r0, r0, #0x3500
#elif defined(JAPAN)
	add r0, r0, #0x6e
	add r0, r0, #0x4800
#else
	add r0, r0, #0xcb
	add r0, r0, #0x3500
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetTypeStringId

	arm_func_start GetConversion2ConvertToType
GetConversion2ConvertToType: ; 0x02050964
	ldr r1, _02050970 ; =_020A192C
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02050970: .word _020A192C
	arm_func_end GetConversion2ConvertToType

	arm_func_start sub_02050974
sub_02050974: ; 0x02050974
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_02050974

	arm_func_start sub_02050990
sub_02050990: ; 0x02050990
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r3, r1, r2
	str r3, [r0, #4]
	mov r0, r1
	ldr ip, _020509B8 ; =MemZero
	mov r1, r2
	bx ip
	.align 2, 0
_020509B8: .word MemZero
	arm_func_end sub_02050990

	arm_func_start sub_020509BC
sub_020509BC: ; 0x020509BC
	bx lr
	arm_func_end sub_020509BC

	arm_func_start CopyBitsTo
CopyBitsTo: ; 0x020509C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0
	mov r3, #1
	mov r5, ip
	mov r4, ip
	b _02050A34
_020509D8:
	ldrb r6, [r1]
	sub r2, r2, #1
	tst r6, r3, lsl ip
	ldrne r7, [r0]
	ldrne lr, [r0, #8]
	ldrneb r6, [r7]
	add ip, ip, #1
	orrne r6, r6, r3, lsl lr
	strneb r6, [r7]
	ldr lr, [r0, #8]
	cmp ip, #8
	add lr, lr, #1
	moveq ip, r5
	addeq r1, r1, #1
	str lr, [r0, #8]
	cmp lr, #8
	ldreq lr, [r0]
	addeq lr, lr, #1
	streq lr, [r0]
	streq r4, [r0, #8]
	ldr lr, [r0, #0xc]
	add lr, lr, #1
	str lr, [r0, #0xc]
_02050A34:
	cmp r2, #0
	bne _020509D8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsTo

	arm_func_start CopyBitsFrom
CopyBitsFrom: ; 0x02050A40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov lr, #0
	mov ip, lr
	mov r3, #1
	mov r6, lr
	mov r5, lr
	b _02050AC0
_02050A5C:
	cmp lr, #0
	streqb ip, [r1]
	ldr r7, [r0]
	ldr r4, [r0, #8]
	ldrb r7, [r7]
	sub r2, r2, #1
	tst r7, r3, lsl r4
	ldrneb r4, [r1]
	orrne r4, r4, r3, lsl lr
	strneb r4, [r1]
	ldr r4, [r0, #8]
	add lr, lr, #1
	cmp lr, #8
	add r4, r4, #1
	moveq lr, r6
	addeq r1, r1, #1
	str r4, [r0, #8]
	cmp r4, #8
	ldreq r4, [r0]
	addeq r4, r4, #1
	streq r4, [r0]
	streq r5, [r0, #8]
	ldr r4, [r0, #0xc]
	add r4, r4, #1
	str r4, [r0, #0xc]
_02050AC0:
	cmp r2, #0
	bne _02050A5C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsFrom

	arm_func_start StoreDefaultTeamData
StoreDefaultTeamData: ; 0x02050ACC
	stmdb sp!, {lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	ldr r1, _02050E54 ; =0x000004C5
	add r0, sp, #0
#else
	add r0, sp, #0
	mov r1, #0x234
#endif
	bl GetStringFromFileVeneer
	ldr r0, _02050B08 ; =TEAM_NAME
	add r1, sp, #0
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
	ldr r0, _02050B0C ; =TEAM_NAME
	mov r1, #0
#ifdef JAPAN
	str r1, [r0, #8]
	strb r1, [r0, #0xc]
#else
	str r1, [r0, #0xc]
	strb r1, [r0, #0x10]
#endif
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
#ifdef JAPAN
_02050E54: .word 0x000004C5
#endif
_02050B08: .word TEAM_NAME
_02050B0C: .word TEAM_NAME
	arm_func_end StoreDefaultTeamData

	arm_func_start GetMainTeamNameWithCheck
GetMainTeamNameWithCheck: ; 0x02050B10
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	mov r4, r0
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldrne r0, _02050B70 ; =TEAM_NAME
	ldrneb r0, [r0]
	cmpne r0, #0
	beq _02050B4C
	ldr r1, _02050B74 ; =TEAM_NAME
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPad
	b _02050B68
_02050B4C:
	ldr r1, _02050B78 ; =0x00000237
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r1, sp, #0
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
_02050B68:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050B70: .word TEAM_NAME
_02050B74: .word TEAM_NAME
#ifdef JAPAN
_02050B78: .word 0x000004C8
#else
_02050B78: .word 0x00000237
#endif
	arm_func_end GetMainTeamNameWithCheck

	arm_func_start GetMainTeamName
GetMainTeamName: ; 0x02050B7C
	ldr ip, _02050B8C ; =StrncpySimpleNoPadSafe
	ldr r1, _02050B90 ; =TEAM_NAME
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bx ip
	.align 2, 0
_02050B8C: .word StrncpySimpleNoPadSafe
_02050B90: .word TEAM_NAME
	arm_func_end GetMainTeamName

	arm_func_start SetMainTeamName
SetMainTeamName: ; 0x02050B94
	ldr r1, _02050BB4 ; =TEAM_NAME
	mov r3, #0
_02050B9C:
	ldrb r2, [r0], #1
	strb r2, [r1, r3]
	add r3, r3, #1
#ifdef JAPAN
	cmp r3, #5
#else
	cmp r3, #0xa
#endif
	blt _02050B9C
	bx lr
	.align 2, 0
_02050BB4: .word TEAM_NAME
	arm_func_end SetMainTeamName

	arm_func_start GetRankupPoints
GetRankupPoints: ; 0x02050BB8
	stmdb sp!, {r4, lr}
	bl GetRank
	mov r4, r0
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02050BE4
	cmp r4, #0xc
	bne _02050BF0
	mov r0, #0
	ldmia sp!, {r4, pc}
_02050BE4:
	cmp r4, #8
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
_02050BF0:
	mov r0, r4
	bl GetRankUpEntry
	ldr r1, _02050C0C ; =TEAM_NAME
	ldr r2, [r0, #4]
#ifdef JAPAN
	ldr r0, [r1, #8]
#else
	ldr r0, [r1, #0xc]
#endif
	sub r0, r2, r0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050C0C: .word TEAM_NAME
	arm_func_end GetRankupPoints

	arm_func_start sub_02050C10
sub_02050C10: ; 0x02050C10
#ifdef JAPAN
#define SUB_02050C10_OFFSET #8
#else
#define SUB_02050C10_OFFSET #0xc
#endif
	stmdb sp!, {r3, lr}
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r1, SUB_02050C10_OFFSET]
	add r2, r2, r0
	mov r0, #0x16
	str r2, [r1, SUB_02050C10_OFFSET]
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02050C4C
	ldr r0, _02050C6C ; =TEAM_NAME
	ldr r1, _02050C70 ; =0x05F5E0FF
	ldr r2, [r0, SUB_02050C10_OFFSET]
	cmp r2, r1
	strgt r1, [r0, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
_02050C4C:
	mov r0, #7
	bl GetRankUpEntry
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r0, #4]
	ldr r0, [r1, SUB_02050C10_OFFSET]
	cmp r0, r2
	strgt r2, [r1, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050C6C: .word TEAM_NAME
_02050C70: .word 0x05F5E0FF
	arm_func_end sub_02050C10

	arm_func_start GetRank
GetRank: ; 0x02050C74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _02050CCC ; =TEAM_NAME
	b _02050CA4
_02050C84:
	mov r0, r5
	bl GetRankUpEntry
#ifdef JAPAN
	ldr r1, [r4, #8]
#else
	ldr r1, [r4, #0xc]
#endif
	ldr r0, [r0, #4]
	cmp r1, r0
	blt _02050CAC
	add r0, r5, #1
	and r5, r0, #0xff
_02050CA4:
	cmp r5, #0xc
	blo _02050C84
_02050CAC:
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02050CC4
	cmp r5, #8
	movhi r5, #8
_02050CC4:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02050CCC: .word TEAM_NAME
	arm_func_end GetRank

	arm_func_start sub_02050CD0
sub_02050CD0: ; 0x02050CD0
	stmdb sp!, {r3, lr}
	bl GetRank
	cmp r0, #8
	movhi r0, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02050CD0

	arm_func_start GetRankStorageSize
GetRankStorageSize: ; 0x02050CE4
	stmdb sp!, {r3, lr}
	bl GetRank
	bl GetRankUpEntry
	ldr r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end GetRankStorageSize

	arm_func_start sub_02050CF8
sub_02050CF8: ; 0x02050CF8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r1, _02050D70 ; =TEAM_NAME
	add r0, sp, #0
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsTo
	ldr r1, _02050D74 ; =_022AB924
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsTo
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	ldr r1, _02050D78 ; =TEAM_NAME
	tst r0, #0xff
#ifdef JAPAN
	strb r0, [r1, #0xc]
#else
	strb r0, [r1, #0x10]
#endif
	ldrne r1, _02050D7C ; =ARM9_UNKNOWN_DATA__NA_209E6BC
	add r0, sp, #0
	ldreq r1, _02050D80 ; =_0209E6BD
	mov r2, #1
	bl CopyBitsTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050D70: .word TEAM_NAME
_02050D74: .word _022AB924
_02050D78: .word TEAM_NAME
_02050D7C: .word ARM9_UNKNOWN_DATA__NA_209E6BC
_02050D80: .word _0209E6BD
	arm_func_end sub_02050CF8

	arm_func_start sub_02050D84
sub_02050D84: ; 0x02050D84
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl sub_02050974
	ldr r1, _02050DFC ; =TEAM_NAME
	add r0, sp, #4
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsFrom
	ldr r1, _02050E00 ; =_022AB924
	add r0, sp, #4
	mov r2, #0x20
	bl CopyBitsFrom
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _02050E04 ; =TEAM_NAME
	tst r0, #1
	movne r2, #1
	moveq r2, #0
	add r0, sp, #4
#ifdef JAPAN
	strb r2, [r1, #0xc]
#else
	strb r2, [r1, #0x10]
#endif
	bl sub_020509BC
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02050DFC: .word TEAM_NAME
_02050E00: .word _022AB924
_02050E04: .word TEAM_NAME
	arm_func_end sub_02050D84

	arm_func_start ResetPlayTimer
ResetPlayTimer: ; 0x02050E08
	mov r1, #0
	strb r1, [r0, #4]
	str r1, [r0]
	bx lr
	arm_func_end ResetPlayTimer

	arm_func_start PlayTimerTick
PlayTimerTick: ; 0x02050E18
	ldrb r1, [r0, #4]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #4]
	cmp r1, #0x3c
	bxlo lr
	mov r1, #0
	strb r1, [r0, #4]
	ldr r2, [r0]
	ldr r1, _02050E50 ; =0x022550FF
	cmp r2, r1
	addlo r1, r2, #1
	strlo r1, [r0]
	bx lr
	.align 2, 0
_02050E50: .word 0x022550FF
	arm_func_end PlayTimerTick

	arm_func_start GetPlayTimeSeconds
GetPlayTimeSeconds: ; 0x02050E54
	ldr r0, [r0]
	bx lr
	arm_func_end GetPlayTimeSeconds

	arm_func_start sub_02050E5C
sub_02050E5C: ; 0x02050E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsTo
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E5C

	arm_func_start sub_02050E8C
sub_02050E8C: ; 0x02050E8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsFrom
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E8C

	arm_func_start sub_02050EBC
sub_02050EBC: ; 0x02050EBC
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	add r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	add r1, r2, r1
	strh r1, [sp]
	cmp r0, #0x3e8
	subge r0, r0, #0x3e8
	ldrgesh r1, [sp]
	strgeh r0, [sp, #2]
	addge r0, r1, #1
	strgeh r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050EBC

	arm_func_start SubFixedPoint
SubFixedPoint: ; 0x02050F10
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	sub r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	sub r1, r2, r1
	strh r1, [sp]
	cmp r0, #0
	addlt r0, r0, #0x3e8
	ldrltsh r1, [sp]
	strlth r0, [sp, #2]
	sublt r0, r1, #1
	strlth r0, [sp]
	ldrsh r0, [sp]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [sp, #2]
	strlth r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end SubFixedPoint

	arm_func_start sub_02050F78
sub_02050F78: ; 0x02050F78
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldrsh r1, [sp, #8]
	ldrsh r0, [sp, #0xc]
	cmp r1, r0
	ldrgth r1, [sp, #0xe]
	ldrgth r0, [sp, #0xc]
	orrgt r0, r0, r1, lsl #16
	bgt _02050FE8
	ldrlth r1, [sp, #0xa]
	ldrlth r0, [sp, #8]
	orrlt r0, r0, r1, lsl #16
	blt _02050FE8
	ldrsh r1, [sp, #0xa]
	ldrsh r0, [sp, #0xe]
	cmp r1, r0
	ldrgth r1, [sp, #0xc]
	ldrgth r0, [sp, #0xe]
	strgth r1, [sp]
	strgth r0, [sp, #2]
	ldrleh r1, [sp, #8]
	ldrleh r0, [sp, #0xa]
	strleh r1, [sp]
	strleh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
_02050FE8:
	add sp, sp, #4
	ldmia sp!, {r3}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050F78

	arm_func_start sub_02050FF8
sub_02050FF8: ; 0x02050FF8
	stmdb sp!, {r3}
	sub sp, sp, #4
	strh r0, [sp]
	ldrh r0, [sp]
	mov r1, #0
	strh r1, [sp, #2]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end sub_02050FF8

	arm_func_start BinToDecFixedPoint
BinToDecFixedPoint: ; 0x02051020
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r2, [r0, #4]
	mov r1, #0x3e8
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mul r1, r0, r1
	mov r2, r2, lsr #0x10
	mov r0, r1, lsr #0x10
	strh r2, [sp]
	strh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end BinToDecFixedPoint
