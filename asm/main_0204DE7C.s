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
	bl SaveOptionsToCtx
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
	bl LoadOptionsFromCtx
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
	bl GetResolvedPerformanceProgressFlag
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
