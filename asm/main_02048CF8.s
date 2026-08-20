	.include "asm/macros.inc"
	.include "main_02048CF8.inc"

	.text

	arm_func_start sub_02048CF8
sub_02048CF8: ; 0x02048CF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x100
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	ldr r3, _02048DB0 ; =0x000001EA
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x100
	str r3, [sp]
	bl ReadSaveFile
	movs r5, r0
	cmpne r5, #2
	bne _02048D54
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	moveq r5, #5
	beq _02048D54
	ldr r1, [r4, #0x24]
	ldr r0, _02048DB4 ; =0x09011416
	cmp r1, r0
	movne r5, #4
_02048D54:
	bl sub_02048C5C
	cmp r5, #0
	bne _02048D80
	ldr r1, [r4, #0x28]
	ldr r0, _02048DB8 ; =_022AAE74
	str r1, [r0, #0x28]
	ldrb r1, [r4, #0x2c]
	strb r1, [r0, #0x2c]
	ldrb r1, [r4, #0x2d]
	strb r1, [r0, #0x2d]
	b _02048DA0
_02048D80:
	sub r0, r5, #4
	cmp r0, #1
	ldrls r1, _02048DBC ; =0x000F1206
	ldrls r0, _02048DB8 ; =_022AAE74
	strls r1, [r0, #0x28]
	ldrhi r1, _02048DC0 ; =0x000F1209
	ldrhi r0, _02048DB8 ; =_022AAE74
	strhi r1, [r0, #0x28]
_02048DA0:
	mov r0, r4
	bl MemFree
	bl sub_02048CB8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02048DB0: .word 0x000001EA
_02048DB4: .word 0x09011416
_02048DB8: .word _022AAE74
_02048DBC: .word 0x000F1206
_02048DC0: .word 0x000F1209
	arm_func_end sub_02048CF8

	arm_func_start sub_02048DC4
sub_02048DC4: ; 0x02048DC4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, #0x100
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	bl sub_02048C5C
	ldr r5, _02048E68 ; =_022AAE74
	mov lr, r4
	mov ip, #3
_02048DF0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02048DF0
	str r6, [r4, #0x28]
	bl GetAdventureLogDungeonFloor
	ldrb r2, [r0]
	ldr r3, _02048E6C ; =0x000001EA
	mov r1, r4
	strb r2, [r4, #0x2c]
	ldrb ip, [r0, #1]
	add r0, sp, #0
	mov r2, #0x100
	strb ip, [r4, #0x2d]
	str r3, [sp]
	bl WriteSaveFile
	movs r5, r0
	bne _02048E54
	ldr r1, [r4, #0x28]
	ldr r0, _02048E70 ; =_022AAE74
	str r1, [r0, #0x28]
	ldrb r1, [r4, #0x2c]
	strb r1, [r0, #0x2c]
	ldrb r1, [r4, #0x2d]
	strb r1, [r0, #0x2d]
_02048E54:
	mov r0, r4
	bl MemFree
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02048E68: .word _022AAE74
_02048E6C: .word 0x000001EA
_02048E70: .word _022AAE74
	arm_func_end sub_02048DC4

	arm_func_start WriteSaveFile
WriteSaveFile: ; 0x02048E74
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r2
	add r3, r5, #0xff
	mov r2, r3, asr #7
	ldr r4, [r0]
	add r2, r3, r2, lsr #24
	mov r6, r1
	add r1, r4, r2, asr #8
	str r1, [r0]
	mov r0, r6
	mov r1, r5
	bl CalcChecksum
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0204A9C8
	cmp r0, #4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WriteSaveFile

	arm_func_start ReadSaveFile
ReadSaveFile: ; 0x02048ED0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	add ip, r4, #0xff
	mov r3, ip, asr #7
	ldr lr, [r0]
	add r3, ip, r3, lsr #24
	add r3, lr, r3, asr #8
	str r3, [r0]
	mov r0, lr
	mov r5, r1
	bl sub_0204A8E0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl CheckChecksumInvalid
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadSaveFile

	arm_func_start CalcChecksum
CalcChecksum: ; 0x02048F24
	mov r3, #0
	mov ip, #1
	b _02048F3C
_02048F30:
	ldr r2, [r0, ip, lsl #2]
	add ip, ip, #1
	add r3, r3, r2
_02048F3C:
	cmp ip, r1, lsr #2
	blt _02048F30
	str r3, [r0]
	bx lr
	arm_func_end CalcChecksum

	arm_func_start CheckChecksumInvalid
CheckChecksumInvalid: ; 0x02048F4C
	mov r3, #0
	mov ip, #1
	b _02048F64
_02048F58:
	ldr r2, [r0, ip, lsl #2]
	add ip, ip, #1
	add r3, r3, r2
_02048F64:
	cmp ip, r1, lsr #2
	blt _02048F58
	ldr r0, [r0]
	cmp r0, r3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end CheckChecksumInvalid

	arm_func_start NoteSaveBase
NoteSaveBase: ; 0x02048F84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r0, _02049218 ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	add r0, r4, #0x64
	add r5, r0, #0x400
	bl sub_02048BFC
	mov r2, r0
	ldr r0, _0204921C ; =_0209CD6C
	mov r1, sb
	bl Debug_Print0
	mov r0, #0
	bl SetNotifyNote
	bl GetTime
	mov r7, r0
	bl EventFlagBackupVeneer
	cmp sb, #3
	bne _02048FE0
	bl sub_02048BFC
	mov sb, r0
	b _02048FE8
_02048FE0:
	mov r0, sb
	bl sub_02048C0C
_02048FE8:
	str sb, [r4, #0x2c]
	bl sub_02048C3C
	str r0, [r4, #0x28]
	bl GetRngSeed
	str r0, [r4, #0x30]
	cmp sb, #0
	mvneq r0, #0
	beq _0204900C
	bl GetLanguageType
_0204900C:
	ldr r1, _02049220 ; =0x09011416
	strb r0, [r4, #0x34]
	add r0, r4, #4
	str r1, [r4, #0x24]
	bl ReadStringSave
	add r0, r4, #0x38
	bl DumpScriptVariableValues
	ldr r1, _02049224 ; =0x00007F6B
	mov r0, r5
	bl WriteMonsterInfoToSave
	str r0, [r4, #0x438]
	add r0, r5, #0x6b
	ldr r1, _02049228 ; =0x000005DC
	add r0, r0, #0x7f00
	bl sub_020597B0
	str r0, [r4, #0x43c]
	add r0, r5, #0x47
	ldr r1, _0204922C ; =0x000001F7
	add r0, r0, #0x8500
	bl CopyProgressInfoFromScratchTo
	str r0, [r4, #0x440]
	add r0, r5, #0x3e
	ldr r1, _02049230 ; =0x00000DAC
	add r0, r0, #0x8700
	bl WriteItemsToSave
	str r0, [r4, #0x444]
	add r0, r5, #0xea
	add r0, r0, #0x9400
	mov r1, #0x10
	bl sub_02050CF8
	str r0, [r4, #0x448]
	add r0, r5, #0xfa
	add r0, r0, #0x9400
	mov r1, #0x340
	bl sub_0204E154
	str r0, [r4, #0x450]
	add r0, r5, #0x3a
	ldr r1, _02049234 ; =0x000015A0
	add r0, r0, #0x9800
	bl sub_0205BFB0
	str r0, [r4, #0x454]
	add r0, r5, #0xda
	ldr r1, _02049238 ; =0x00000237
	add r0, r0, #0xad00
	bl sub_0205FC20
	str r0, [r4, #0x458]
	add r0, r5, #0x11
	add r0, r0, #0xb000
	mov r1, #0xb
	bl SaveCroagunkItems
	add r1, r5, #0x1c
	str r0, [r4, #0x45c]
	add r0, r1, #0xb000
#ifdef JAPAN
	mov r1, #0x18c
#else
	mov r1, #0x1dc
#endif
	bl sub_0204A3E4
	str r0, [r4, #0x460]
	bl GetTime
	mov r1, r7
	mov r7, r0
	bl _fsub
	bl _f2d
	mov r3, r0
	mov r2, r1
	ldr r0, _0204923C ; =_0209CD84
	mov r1, r3
	bl Debug_Print0
	cmp sb, #2
	moveq r5, #0
	beq _0204912C
	ldr r0, _02049240 ; =0x000F1206
	bl sub_02048DC4
	mov r5, r0
_0204912C:
	cmp r5, #0
	bne _020491C4
	bl sub_02049350
	cmp r0, #1
	add r0, sp, #0
	ldr r2, _02049218 ; =0x0000B65C
	bne _02049188
	mov r3, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	movs r6, r0
	bne _02049168
	mov r0, #0
	bl sub_02049360
_02049168:
	ldr r2, _02049218 ; =0x0000B65C
	mov r3, #0xc8
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	mov r8, r0
	b _020491C4
_02049188:
	mov r3, #0xc8
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	movs r8, r0
	bne _020491A8
	mov r0, #1
	bl sub_02049360
_020491A8:
	ldr r2, _02049218 ; =0x0000B65C
	mov r3, #0
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	mov r6, r0
_020491C4:
	bl GetTime
	mov r1, r7
	bl _fsub
	bl _f2d
	mov r3, r0
	mov r2, r1
	ldr r0, _02049244 ; =_0209CD94
	mov r1, r3
	bl Debug_Print0
	mov r0, r4
	bl MemFree
	cmp r5, #0
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	movne r0, r6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r8, #0
	moveq r8, #0
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02049218: .word 0x0000B60C
#else
_02049218: .word 0x0000B65C
#endif
_0204921C: .word _0209CD6C
_02049220: .word 0x09011416
_02049224: .word 0x00007F6B
_02049228: .word 0x000005DC
_0204922C: .word 0x000001F7
_02049230: .word 0x00000DAC
_02049234: .word 0x000015A0
_02049238: .word 0x00000237
_0204923C: .word _0209CD84
_02049240: .word 0x000F1206
_02049244: .word _0209CD94
	arm_func_end NoteSaveBase

	arm_func_start WriteQuickSaveInfo
WriteQuickSaveInfo: ; 0x02049248
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r2, r1
	mov r3, #0x190
	add r0, sp, #0
	mov r1, ip
	str r3, [sp]
	bl WriteSaveFile
	ldmia sp!, {r3, pc}
	arm_func_end WriteQuickSaveInfo

	arm_func_start ReadSaveHeader
ReadSaveHeader: ; 0x0204926C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0204932C ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	ldr r3, _02049330 ; =_020AFF40
	mov r0, #0
	mov r1, r4
	mov r2, #0x38
	str r0, [r3]
	bl sub_0204A8E0
	cmp r0, #0
	beq _020492B4
	mov r1, r4
	mov r0, #0xc8
	mov r2, #0x38
	bl sub_0204A8E0
_020492B4:
	cmp r0, #0
	ldrne r0, _02049330 ; =_020AFF40
	movne r1, #1
	strne r1, [r0, #4]
	bne _02049310
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	ldreq r0, _02049330 ; =_020AFF40
	moveq r1, #5
	streq r1, [r0, #4]
	beq _02049310
	ldr r1, [r4, #0x24]
	ldr r0, _02049334 ; =0x09011416
	cmp r1, r0
	ldrne r0, _02049330 ; =_020AFF40
	movne r1, #4
	strne r1, [r0, #4]
#ifdef EUROPE
	bne _02049310
	ldr r1, [r4, #0x2c]
	ldr r0, _02049330 ; =_020AFF40
	mov r2, #0
	stmia r0, {r1, r2}
	ldr r1, [r4, #0x28]
	sub r0, r2, #1
	cmp r1, r0
	beq _02049310
	ldrsb r0, [r4, #0x34]
	bl sub_020205C0
	bl sub_0202059C
#else
	ldreq r2, [r4, #0x2c]
	ldreq r0, _02049330 ; =_020AFF40
	moveq r1, #0
	streq r2, [r0]
	streq r1, [r0, #4]
#endif
_02049310:
	mov r0, r4
	bl MemFree
	ldr r0, _02049330 ; =_020AFF40
	ldr r1, [r0]
	str r1, [r5]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0204932C: .word 0x0000B60C
#else
_0204932C: .word 0x0000B65C
#endif
_02049330: .word _020AFF40
_02049334: .word 0x09011416
	arm_func_end ReadSaveHeader

	arm_func_start sub_02049338
sub_02049338: ; 0x02049338
	ldr r1, _0204934C ; =_020AFF40
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, [r1, #4]
	bx lr
	.align 2, 0
_0204934C: .word _020AFF40
	arm_func_end sub_02049338

	arm_func_start sub_02049350
sub_02049350: ; 0x02049350
	ldr r0, _0204935C ; =_020AFF40
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_0204935C: .word _020AFF40
	arm_func_end sub_02049350

	arm_func_start sub_02049360
sub_02049360: ; 0x02049360
	ldr r1, _0204936C ; =_020AFF40
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0204936C: .word _020AFF40
	arm_func_end sub_02049360

	arm_func_start NoteLoadBase
NoteLoadBase: ; 0x02049370
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r0, _020495FC ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	add r0, r4, #0x64
	add r6, r0, #0x400
	bl sub_02048BFC
	mov r1, r0
	ldr r0, _02049600 ; =_0209CDA4
	bl Debug_Print0
	mov r0, #0
	bl SetNotifyNote
	mov r0, #0
	str r0, [sp]
	ldr r2, _020495FC ; =0x0000B65C
	add r0, sp, #0
	mov r1, r4
	bl ReadSaveFile
	movs r5, r0
	beq _02049400
	ldr r2, _020495FC ; =0x0000B65C
	mov r3, #0xc8
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl ReadSaveFile
	movs r5, r0
	ldrne r0, _02049604 ; =_020AFF40
	mvnne r1, #0
	strne r1, [r0, #8]
	ldreq r0, _02049604 ; =_020AFF40
	moveq r1, #1
	streq r1, [r0, #8]
	b _0204940C
_02049400:
	ldr r0, _02049604 ; =_020AFF40
	mov r1, #0
	str r1, [r0, #8]
_0204940C:
	cmp r5, #0
	cmpne r5, #2
	bne _0204943C
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	moveq r5, #5
	beq _0204943C
	ldr r1, [r4, #0x24]
	ldr r0, _02049608 ; =0x09011416
	cmp r1, r0
	movne r5, #4
_0204943C:
	cmp r5, #0
	bne _020494A0
	ldr r1, [r4, #0x2c]
	ldr r0, _0204960C ; =_0209CDB8
	bl Debug_Print0
	ldr r0, [r4, #0x2c]
	bl sub_02048C0C
	ldr r0, [r4, #0x28]
	bl sub_02048C4C
	ldr r0, [r4, #0x30]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SetRngSeed
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [r4, #0x34]
	beq _020494A0
	ldr r1, [r4, #0x28]
	mvn r0, #0
	cmp r1, r0
	beq _020494A0
	ldrsb r0, [r4, #0x34]
	bl sub_020205C0
	bl sub_0202059C
_020494A0:
	cmp r5, #0
	bne _020494B8
	add r0, r4, #0x38
	bl RestoreScriptVariableValues
	cmp r0, #0
	moveq r5, #4
_020494B8:
	cmp r5, #0
	bne _020495D4
	ldr r1, _02049610 ; =0x00007F6B
	mov r0, r6
	bl ReadMonsterInfoFromSave
	ldr r1, [r4, #0x438]
	cmp r0, r1
	add r0, r6, #0x6b
	ldr r1, _02049614 ; =0x000005DC
	add r0, r0, #0x7f00
	movne r5, #3
	bl sub_02059A74
	ldr r1, [r4, #0x43c]
	cmp r0, r1
	add r0, r6, #0x47
	ldr r1, _02049618 ; =0x000001F7
	add r0, r0, #0x8500
	movne r5, #3
	bl CopyProgressInfoFromScratchFrom
	ldr r1, [r4, #0x440]
	cmp r0, r1
	add r0, r6, #0x3e
	ldr r1, _0204961C ; =0x00000DAC
	add r0, r0, #0x8700
	movne r5, #3
	bl ReadItemsFromSave
	ldr r1, [r4, #0x444]
	cmp r0, r1
	add r0, r6, #0xea
	add r0, r0, #0x9400
	mov r1, #0x10
	movne r5, #3
	bl sub_02050D84
	ldr r1, [r4, #0x448]
	cmp r0, r1
	add r0, r6, #0xfa
	add r0, r0, #0x9400
	mov r1, #0x340
	movne r5, #3
	bl sub_0204E19C
	ldr r1, [r4, #0x450]
	cmp r0, r1
	add r0, r6, #0x3a
	ldr r1, _02049620 ; =0x000015A0
	add r0, r0, #0x9800
	movne r5, #3
	bl sub_0205BD9C
	ldr r1, [r4, #0x454]
	cmp r0, r1
	add r0, r6, #0xda
	ldr r1, _02049624 ; =0x00000237
	add r0, r0, #0xad00
	movne r5, #3
	bl sub_0205FAB0
	ldr r1, [r4, #0x458]
	cmp r0, r1
	add r0, r6, #0x11
	add r0, r0, #0xb000
	mov r1, #0xb
	movne r5, #3
	bl LoadCroagunkItems
	ldr r1, [r4, #0x45c]
	cmp r0, r1
	add r0, r6, #0x1c
	add r0, r0, #0xb000
#ifdef JAPAN
	mov r1, #0x18c
#else
	mov r1, #0x1dc
#endif
	movne r5, #3
	bl sub_0204A1DC
	ldr r1, [r4, #0x460]
	cmp r0, r1
	movne r5, #3
_020495D4:
	cmp r5, #0
	bne _020495E4
	bl sub_02048CF8
	b _020495E8
_020495E4:
	bl sub_02048C5C
_020495E8:
	mov r0, r4
	bl MemFree
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_020495FC: .word 0x0000B60C
#else
_020495FC: .word 0x0000B65C
#endif
_02049600: .word _0209CDA4
_02049604: .word _020AFF40
_02049608: .word 0x09011416
_0204960C: .word _0209CDB8
_02049610: .word 0x00007F6B
_02049614: .word 0x000005DC
_02049618: .word 0x000001F7
_0204961C: .word 0x00000DAC
_02049620: .word 0x000015A0
_02049624: .word 0x00000237
	arm_func_end NoteLoadBase

	arm_func_start ReadQuickSaveInfo
ReadQuickSaveInfo: ; 0x02049628
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r2, r1
	mov r3, #0x190
	add r0, sp, #0
	mov r1, ip
	str r3, [sp]
	bl ReadSaveFile
	ldmia sp!, {r3, pc}
	arm_func_end ReadQuickSaveInfo

	arm_func_start sub_0204964C
sub_0204964C: ; 0x0204964C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02049678 ; =_0209CDD0
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r1, _0204967C ; =_022AAEA4
	ldrne r0, _02049680 ; =_020AFF4C
	movne r2, #0
	strne r4, [r1]
	strne r2, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02049678: .word _0209CDD0
_0204967C: .word _022AAEA4
_02049680: .word _020AFF4C
	arm_func_end sub_0204964C

	arm_func_start sub_02049684
sub_02049684: ; 0x02049684
	stmdb sp!, {r3, lr}
	mov r0, #0xb4
	mov r1, #8
	bl MemAlloc
	ldr r1, _020496EC ; =_020AFF4C
	str r0, [r1]
	add r0, r0, #0x1c
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _020496EC ; =_020AFF4C
	ldr r1, _020496F0 ; =_022AAEA4
	ldr r3, [r2]
	str r0, [r3, #0x18]
	ldr r3, [r1]
	ldr r1, [r2]
	mov r0, #0
	str r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _020496EC ; =_020AFF4C
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020496EC: .word _020AFF4C
_020496F0: .word _022AAEA4
	arm_func_end sub_02049684

	arm_func_start sub_020496F4
sub_020496F4: ; 0x020496F4
	stmdb sp!, {r3, lr}
	ldr r0, _0204972C ; =_020AFF4C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204972C ; =_020AFF4C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204972C ; =_020AFF4C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204972C: .word _020AFF4C
	arm_func_end sub_020496F4

	arm_func_start sub_02049730
sub_02049730: ; 0x02049730
	stmdb sp!, {r3, lr}
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r3, [r1]
	ldr r0, [r3, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02049A10
_0204974C: ; jump table
	b _02049770 ; case 0
	b _020497A4 ; case 1
	b _020497C4 ; case 2
	b _020497E8 ; case 3
	b _020498C8 ; case 4
	b _0204996C ; case 5
	b _020499A0 ; case 6
	b _020499CC ; case 7
	b _020499FC ; case 8
_02049770:
	ldr r0, [r3, #8]
	ldr r1, _02049A1C ; =_0209CDE0
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _02049A20 ; =0x00000408
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020497A4:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _02049A18 ; =_020AFF4C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02049A10
_020497C4:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020497E8:
	bl sub_02003B94
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r1, _02049A24 ; =_0209CE10
	ldr r3, [r0]
	ldr r2, [r3, #8]
	ldr r1, [r1, r2, lsl #2]
	str r1, [r3, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #4
	bne _02049834
	ldr r0, _02049A28 ; =0x000F120A
	bl sub_02048DC4
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r1, [r1]
	str r0, [r1, #0xc]
	b _020498B0
_02049834:
	cmp r0, #2
	bne _020498A0
	bl sub_02048CB8
	ldr r2, _02049A18 ; =_020AFF4C
	ldr r1, _02049A2C ; =0x000F1207
	ldr r3, [r2]
	str r0, [r3, #0x14]
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	cmp r0, r1
	bne _02049868
	add r0, r1, #1
	bl sub_02048DC4
_02049868:
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r2, [r1]
	str r0, [r2, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	ldreq r0, [r1, #0x14]
	ldreq r1, _02049A2C ; =0x000F1207
	cmpeq r0, r1
	bne _020498B0
	bl sub_02048DC4
	b _020498B0
_020498A0:
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r1, [r1]
	str r0, [r1, #0xc]
_020498B0:
	bl sub_02003BC8
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020498C8:
	bl sub_02029FBC
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r3, [r0]
	ldr r0, [r3, #0xc]
	cmp r0, #1
	bne _02049908
#ifdef JAPAN
	ldr r1, _02049A30 ; =0x0000040C
	ldrsb r0, [r3]
	add r2, r1, #0xbd
#else
	ldrsb r0, [r3]
	ldr r1, _02049A30 ; =0x0000040C
	mov r2, #0x238
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_02049908:
	cmp r0, #0
	bne _02049944
	ldr r0, [r3, #8]
	ldr r1, _02049A34 ; =_0209CDF8
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _02049A38 ; =0x0000061C
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_02049944:
	ldrsb r0, [r3]
	ldr r1, _02049A38 ; =0x0000061C
	ldr r2, _02049A3C ; =0x00000239
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_0204996C:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020499A0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #2
	str r1, [r0, #4]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #4]
	b _02049A10
_020499CC:
	mov r0, #9
	str r0, [r3, #4]
	ldr r2, [r1]
	ldr r0, [r2, #0x18]
	tst r0, #0x100
	beq _020499F4
	ldr r0, [r2, #0xa4]
	ldr r1, [r1, #4]
	ldr r2, [r2, #0xa0]
	blx r2
_020499F4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_020499FC:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	bl CardBackupError
_02049A10:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049A18: .word _020AFF4C
_02049A1C: .word _0209CDE0
_02049A20: .word 0x00000408
_02049A24: .word _0209CE10
_02049A28: .word 0x000F120A
_02049A2C: .word 0x000F1207
_02049A30: .word 0x0000040C
_02049A34: .word _0209CDF8
_02049A38: .word 0x0000061C
#ifdef JAPAN
_02049A3C: .word 0x000004CA
#else
_02049A3C: .word 0x00000239
#endif
	arm_func_end sub_02049730

	arm_func_start sub_02049A40
sub_02049A40: ; 0x02049A40
	stmdb sp!, {r3, lr}
	mov r3, r0
	mov r2, r1
	ldr r0, _02049A6C ; =_0209CE40
	mov r1, r3
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _02049A70 ; =_020AFF54
	movne r1, #0
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049A6C: .word _0209CE40
_02049A70: .word _020AFF54
	arm_func_end sub_02049A40

	arm_func_start sub_02049A74
sub_02049A74: ; 0x02049A74
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02049ACC ; =_020AFF54
	str r0, [r1]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r1, _02049ACC ; =_020AFF54
	ldr r1, [r1]
	str r0, [r1, #0xc]
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02049ACC ; =_020AFF54
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049ACC: .word _020AFF54
	arm_func_end sub_02049A74

	arm_func_start sub_02049AD0
sub_02049AD0: ; 0x02049AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02049B08 ; =_020AFF54
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02049B08 ; =_020AFF54
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02049B08 ; =_020AFF54
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049B08: .word _020AFF54
	arm_func_end sub_02049AD0

	arm_func_start sub_02049B0C
sub_02049B0C: ; 0x02049B0C
	stmdb sp!, {r3, lr}
	ldr r0, _02049D34 ; =_020AFF54
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02049D2C
_02049B28: ; jump table
	b _02049B4C ; case 0
	b _02049B74 ; case 1
	b _02049B94 ; case 2
	b _02049BB8 ; case 3
	b _02049BEC ; case 4
	b _02049C74 ; case 5
	b _02049CA8 ; case 6
	b _02049CD4 ; case 7
	b _02049D18 ; case 8
_02049B4C:
	ldrsb r0, [r2]
	ldr r1, _02049D38 ; =0x00000408
#ifdef JAPAN
	mov r2, #0x4e0
#else
	ldr r2, _02049D3C ; =0x0000024F
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049B74:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _02049D34 ; =_020AFF54
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02049D2C
_02049B94:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049BB8:
	bl sub_02003B94
	bl sub_02048454
	mov r0, #0
	bl NoteSaveBase
	ldr r1, _02049D34 ; =_020AFF54
	ldr r1, [r1]
	str r0, [r1, #8]
	bl sub_02003BC8
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049BEC:
	bl sub_02029FBC
	ldr r0, _02049D34 ; =_020AFF54
	mov r3, #0
#ifdef JAPAN
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #1
	bne _02049C2C
	ldr r1, _02049D40 ; =0x0000040C
	ldrsb r0, [r2]
	add r2, r1, #0xbd
#else
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	bne _02049C2C
	ldrsb r0, [r1]
	ldr r1, _02049D40 ; =0x0000040C
	mov r2, #0x238
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C2C:
	cmp r0, #0
#ifdef JAPAN
	ldrsb r0, [r2]
	ldr r1, _02049D44 ; =0x0000061C
	bne _02049C58
	ldr r2, _0204A0B0 ; =0x000004E1
#else
	ldrsb r0, [r1]
	ldr r1, _02049D44 ; =0x0000061C
	bne _02049C58
	mov r2, #0x250
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C58:
	ldr r2, _02049D48 ; =0x0000023A
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C74:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	ldr r0, _02049D34 ; =_020AFF54
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049CA8:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #2
	str r1, [r0, #4]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #4]
	b _02049D2C
_02049CD4:
	mov r1, #9
	add r0, sp, #0
	str r1, [r2, #4]
	bl CopyFrameTypeOption
	ldrb r0, [sp]
	bl sub_02027180
	ldr r0, _02049D34 ; =_020AFF54
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	tst r0, #0x100
	beq _02049D10
	ldr r0, [r1, #0x98]
	ldr r2, [r1, #0x94]
	mov r1, #8
	blx r2
_02049D10:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02049D18:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	bl CardBackupError
_02049D2C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049D34: .word _020AFF54
_02049D38: .word 0x00000408
#ifdef JAPAN
_02049D40: .word 0x0000040C
_02049D44: .word 0x0000061C
_0204A0B0: .word 0x000004E1
_02049D48: .word 0x000004CB
#else
_02049D3C: .word 0x0000024F
_02049D40: .word 0x0000040C
_02049D44: .word 0x0000061C
_02049D48: .word 0x0000023A
#endif
	arm_func_end sub_02049B0C

	arm_func_start sub_02049D4C
sub_02049D4C: ; 0x02049D4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02049D78 ; =_0209CE58
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r1, _02049D7C ; =_022AAEA8
	ldrne r0, _02049D80 ; =_020AFF5C
	movne r2, #0
	strne r4, [r1]
	strne r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02049D78: .word _0209CE58
_02049D7C: .word _022AAEA8
_02049D80: .word _020AFF5C
	arm_func_end sub_02049D4C

	arm_func_start sub_02049D84
sub_02049D84: ; 0x02049D84
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02049DEC ; =_020AFF5C
	str r0, [r1, #4]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _02049DEC ; =_020AFF5C
	ldr r1, _02049DF0 ; =_022AAEA8
	ldr r3, [r2, #4]
	str r0, [r3, #0xc]
	ldr r3, [r1]
	ldr r1, [r2, #4]
	mov r0, #0
	str r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02049DEC ; =_020AFF5C
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049DEC: .word _020AFF5C
_02049DF0: .word _022AAEA8
	arm_func_end sub_02049D84

	arm_func_start sub_02049DF4
sub_02049DF4: ; 0x02049DF4
	stmdb sp!, {r3, lr}
	ldr r0, _02049E2C ; =_020AFF5C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02049E2C ; =_020AFF5C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02049E2C ; =_020AFF5C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049E2C: .word _020AFF5C
	arm_func_end sub_02049DF4

	arm_func_start sub_02049E30
sub_02049E30: ; 0x02049E30
	stmdb sp!, {r3, lr}
	ldr r1, _0204A004 ; =_020AFF5C
	ldr r3, [r1, #4]
	ldr r0, [r3, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02049FFC
_02049E4C: ; jump table
	b _02049E6C ; case 0
	b _02049EA0 ; case 1
	b _02049EC0 ; case 2
	b _02049EE4 ; case 3
	b _02049F2C ; case 4
	b _02049F6C ; case 5
	b _02049FA0 ; case 6
	b _02049FCC ; case 7
_02049E6C:
	ldr r0, [r3, #8]
	ldr r1, _0204A008 ; =_0209CE54
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _0204A00C ; =0x00000408
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049EA0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _0204A004 ; =_020AFF5C
	moveq r1, #2
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _02049FFC
_02049EC0:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049EE4:
	bl sub_02003B94
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02049F08
	cmp r0, #1
	beq _02049F10
	b _02049F14
_02049F08:
	bl sub_0204A624
	b _02049F14
_02049F10:
	bl sub_0204A72C
_02049F14:
	bl sub_02003BC8
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049F2C:
	bl sub_02029FBC
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r2, _0204A010 ; =_0209CE50
	ldr r0, [r0, #4]
	ldr r1, _0204A014 ; =0x0000061C
	ldr r3, [r0, #8]
	ldrsb r0, [r0]
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049F6C:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049FFC
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049FA0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049FFC
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #2
	str r1, [r0]
	ldr r0, [r0, #4]
	mov r1, #7
	str r1, [r0, #4]
	b _02049FFC
_02049FCC:
	mov r0, #8
	str r0, [r3, #4]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0xc]
	tst r0, #0x100
	beq _02049FF4
	ldr r0, [r2, #0x98]
	ldr r1, [r1]
	ldr r2, [r2, #0x94]
	blx r2
_02049FF4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02049FFC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A004: .word _020AFF5C
_0204A008: .word _0209CE54
_0204A00C: .word 0x00000408
_0204A010: .word _0209CE50
_0204A014: .word 0x0000061C
	arm_func_end sub_02049E30

	arm_func_start sub_0204A018
sub_0204A018: ; 0x0204A018
	ldr ip, _0204A024 ; =InitMenu
	ldr r0, _0204A028 ; =_0209CE68
	bx ip
	.align 2, 0
_0204A024: .word InitMenu
_0204A028: .word _0209CE68
	arm_func_end sub_0204A018

	arm_func_start sub_0204A02C
sub_0204A02C: ; 0x0204A02C
	stmdb sp!, {r3, lr}
	mov r0, #1
	mov r1, #8
	bl MemAlloc
	ldr r1, _0204A078 ; =_020AFF64
	str r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _0204A078 ; =_020AFF64
	ldr r1, _0204A07C ; =0x00000408
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0xc1
#else
	mov r2, #0x238
#endif
	strb r0, [ip]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A078: .word _020AFF64
_0204A07C: .word 0x00000408
	arm_func_end sub_0204A02C

	arm_func_start sub_0204A080
sub_0204A080: ; 0x0204A080
	stmdb sp!, {r3, lr}
	ldr r0, _0204A0B8 ; =_020AFF64
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204A0B8 ; =_020AFF64
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204A0B8 ; =_020AFF64
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A0B8: .word _020AFF64
	arm_func_end sub_0204A080

	arm_func_start sub_0204A0BC
sub_0204A0BC: ; 0x0204A0BC
	stmdb sp!, {r3, lr}
	ldr r0, _0204A0E4 ; =_020AFF64
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204A0DC
	bl CardBackupError
_0204A0DC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A0E4: .word _020AFF64
	arm_func_end sub_0204A0BC

	arm_func_start sub_0204A0E8
sub_0204A0E8: ; 0x0204A0E8
	ldr ip, _0204A0F4 ; =InitMenu
	ldr r0, _0204A0F8 ; =_0209CE78
	bx ip
	.align 2, 0
_0204A0F4: .word InitMenu
_0204A0F8: .word _0209CE78
	arm_func_end sub_0204A0E8

	arm_func_start sub_0204A0FC
sub_0204A0FC: ; 0x0204A0FC
	stmdb sp!, {r3, lr}
	mov r0, #1
	mov r1, #8
	bl MemAlloc
	ldr r1, _0204A148 ; =_020AFF68
	str r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _0204A148 ; =_020AFF68
	ldr r1, _0204A14C ; =0x00000408
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0xd0
#else
	ldr r2, _0204A150 ; =0x00000247
#endif
	strb r0, [ip]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A148: .word _020AFF68
_0204A14C: .word 0x00000408
#ifndef JAPAN
_0204A150: .word 0x00000247
#endif
	arm_func_end sub_0204A0FC

	arm_func_start sub_0204A154
sub_0204A154: ; 0x0204A154
	stmdb sp!, {r3, lr}
	ldr r0, _0204A18C ; =_020AFF68
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204A18C ; =_020AFF68
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204A18C ; =_020AFF68
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A18C: .word _020AFF68
	arm_func_end sub_0204A154

	arm_func_start sub_0204A190
sub_0204A190: ; 0x0204A190
	mov r0, #1
	bx lr
	arm_func_end sub_0204A190

	arm_func_start sub_0204A198
sub_0204A198: ; 0x0204A198
	ldr ip, _0204A1A0 ; =OS_GetMacAddress
	bx ip
	.align 2, 0
_0204A1A0: .word OS_GetMacAddress
	arm_func_end sub_0204A198

	arm_func_start sub_0204A1A4
sub_0204A1A4: ; 0x0204A1A4
	stmdb sp!, {r3, lr}
	ldr r0, _0204A1C4 ; =_022AAEAC
#ifdef JAPAN
	mov r1, #0x1a0
#else
	mov r1, #0x1f0
#endif
	bl MemZero
	ldr r1, _0204A1C4 ; =_022AAEAC
	ldr r0, _0204A1C8 ; =_020AFF6C
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A1C4: .word _022AAEAC
_0204A1C8: .word _020AFF6C
	arm_func_end sub_0204A1A4

	arm_func_start sub_0204A1CC
sub_0204A1CC: ; 0x0204A1CC
	ldr r0, _0204A1D8 ; =_020AFF6C
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0204A1D8: .word _020AFF6C
	arm_func_end sub_0204A1CC

	arm_func_start sub_0204A1DC
sub_0204A1DC: ; 0x0204A1DC
#ifdef JAPAN
#define SUB_0204A1DC_OFFSET -0x50
#else
#define SUB_0204A1DC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl InitBitstreamForWrite
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x200
	bl CopyBitsFrom
#ifdef JAPAN
	ldr r4, _0204A3E0 ; =_020AFF6C
	mov r7, #0
	add r6, sp, #4
	mov r5, #0x28
_0204A220:
	ldr r0, [r4]
	add r1, r7, r7, lsl #2
	add r3, r0, #0x40
	mov r0, r6
	mov r2, r5
	add r1, r3, r1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x10
#else
	ldr r5, _0204A3E0 ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x50
	mov r4, #0xa
_0204A220:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0x40
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsFrom
	add r8, r8, #1
	cmp r8, #0x10
#endif
	blt _0204A220
	ldr r5, _0204A3E0 ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x60
	mov r4, #0xc
_0204A258:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0xe0 + SUB_0204A1DC_OFFSET
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsFrom
	add r8, r8, #1
	cmp r8, #0x10
	blt _0204A258
	mov sb, #0
	mov r5, #1
	ldr sl, _0204A3E0 ; =_020AFF6C
	mov r4, sb
	add r8, sp, #4
	add r7, sp, #0
	mov r6, r5
_0204A298:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	ldr r0, [sl]
	movne r1, r5
	add r0, r0, sb
	moveq r1, r4
	add sb, sb, #1
	strb r1, [r0, #0x1a0 + SUB_0204A1DC_OFFSET]
	cmp sb, #0x10
	blt _0204A298
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x1b0
	add r1, r1, #0x1b0 + SUB_0204A1DC_OFFSET
	bl CopyBitsFrom
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0xe6 + SUB_0204A1DC_OFFSET
	add r1, r1, #0x100
	bl CopyBitsFrom
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x1e8 + SUB_0204A1DC_OFFSET
	bl CopyBitsFrom
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1ea + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1eb + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1ec + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r2, #1
	ldr r1, [r1]
	moveq r2, #0
	add r0, sp, #4
	strb r2, [r1, #0x1ed + SUB_0204A1DC_OFFSET]
	bl BitstreamDebug
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204A3E0: .word _020AFF6C
	arm_func_end sub_0204A1DC

	arm_func_start sub_0204A3E4
sub_0204A3E4: ; 0x0204A3E4
#ifdef JAPAN
#define SUB_0204A3E4_OFFSET -0x50
#else
#define SUB_0204A3E4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r1
	mov r4, #0xff
	mov r3, #0
	add r0, sp, #4
	mov r1, r5
	strb r4, [sp, #1]
	strb r3, [sp]
	bl InitBitstreamForRead
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x200
	bl CopyBitsTo
#ifdef JAPAN
	ldr r4, _0204A5CC ; =_020AFF6C
	mov r7, #0
	add r6, sp, #4
	mov r5, #0x28
_0204A438:
	ldr r0, [r4]
	add r1, r7, r7, lsl #2
	add r3, r0, #0x40
	mov r0, r6
	mov r2, r5
	add r1, r3, r1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x10
#else
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x50
	mov r4, #0xa
_0204A438:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0x40
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, #0x10
#endif
	blt _0204A438
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x60
	mov r4, #0xc
_0204A470:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0xe0 + SUB_0204A3E4_OFFSET
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, #0x10
	blt _0204A470
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r4, #0
	add r8, sp, #0
	add sb, sp, #1
	add r7, sp, #4
	mov r6, #1
_0204A4AC:
	ldr r0, [r5]
	mov r2, r6
	add r0, r0, r4
	ldrb r0, [r0, #0x1a0 + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	movne r1, sb
	moveq r1, r8
	mov r0, r7
	bl CopyBitsTo
	add r4, r4, #1
	cmp r4, #0x10
	blt _0204A4AC
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x1b0
	add r1, r1, #0x1b0 + SUB_0204A3E4_OFFSET
	bl CopyBitsTo
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0xe6 + SUB_0204A3E4_OFFSET
	add r1, r1, #0x100
	bl CopyBitsTo
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x1e8 + SUB_0204A3E4_OFFSET
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ea + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1eb + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ec + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ed + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	add r0, sp, #4
	bl BitstreamDebug
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204A5CC: .word _020AFF6C
	arm_func_end sub_0204A3E4

	arm_func_start sub_0204A5D0
sub_0204A5D0: ; 0x0204A5D0
	stmdb sp!, {r4, lr}
	bl CARD_Init
	bl OS_GetLockID
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockBackup
	ldr r0, _0204A61C ; =0x00001101
	bl Card_IdentifyBackup
	bl Card_GetBackupTotalSize
	ldr r2, _0204A620 ; =_022AB09C
	mov r1, r4, lsl #0x10
	str r0, [r2]
	mov r0, r1, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204A61C: .word 0x00001101
_0204A620: .word _022AB09C
	arm_func_end sub_0204A5D0

	arm_func_start sub_0204A624
sub_0204A624: ; 0x0204A624
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	sub sp, sp, #0x400
	bl Card_GetCurrentBackupType
	and r0, r0, #0xff
	cmp r0, #1
	bne _0204A720
	mov r1, #0
	mov r0, #0xff
	add r8, sp, #0x14
_0204A64C:
	strb r0, [r8, r1]
	add r1, r1, #1
	cmp r1, #0x400
	blt _0204A64C
	mov r7, #0
	mov fp, r7
_0204A664:
	mov r6, #0
	mov sb, r7, lsl #8
	b _0204A70C
_0204A670:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r4, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockBackup
	mov r0, r4
	mov r1, #0x13
	bl sub_020027F8
	str fp, [sp]
	mov sl, r0
	str fp, [sp, #4]
	mov r1, #8
	str r1, [sp, #8]
	mov r1, #0xa
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r0, r8
	mov r1, sb
	mov r2, #0x400
	mov r3, fp
	bl Cardi_RequestStreamCommand
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	cmp sl, #0
	bne _0204A714
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204A70C:
	cmp r6, #4
	blt _0204A670
_0204A714:
	add r7, r7, #1
	cmp r7, #0x100
	blt _0204A664
_0204A720:
	add sp, sp, #0x14
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A624

	arm_func_start sub_0204A72C
sub_0204A72C: ; 0x0204A72C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	sub sp, sp, #0x400
	mov r0, #0x400
	bl RandInt
	str r0, [sp, #0x14]
	bl Card_GetCurrentBackupType
	and r0, r0, #0xff
	cmp r0, #1
	bne _0204A8D4
	mov r2, #0
	mov r1, #0xff
_0204A75C:
	add r0, sp, #0x18
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x400
	blt _0204A75C
	mov r5, #0
_0204A774:
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #22
	mov r8, r5, lsl #8
	add sb, r1, r0, ror #22
	mov r4, #0
	b _0204A8C0
_0204A78C:
	bl OS_GetLockID
	mov r6, r0
	bl sub_02002580
	mov r7, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockBackup
	mov r0, r7
	mov r1, #0x13
	bl sub_020027F8
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	mov fp, r0
	mov r0, r8
	add r1, sp, #0x18
	mov r2, #0x400
	mov r3, #0
	bl Cardi_RequestStreamCommand
	cmp r0, #0
	beq _0204A820
	mov r0, r7
	mov r1, fp
	bl sub_020027F8
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	b _0204A8C8
_0204A820:
	ldr r0, [sp, #0x14]
	cmp sb, r0
	bne _0204A84C
	mov sl, #0
_0204A830:
	mov r0, #0x100
	bl RandInt
	add r1, sp, #0x18
	strb r0, [r1, sl]
	add sl, sl, #1
	cmp sl, #0x400
	blt _0204A830
_0204A84C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, sp, #0x18
	mov r1, r8
	mov r2, #0x400
	mov r3, #0
	bl Cardi_RequestStreamCommand
	mov sl, r0
	mov r1, fp
	mov r0, r7
	bl sub_020027F8
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	cmp sl, #0
	bne _0204A8C8
	mov r0, #0
	bl CardPullOutWithStatus
	add r4, r4, #1
_0204A8C0:
	cmp r4, #4
	blt _0204A78C
_0204A8C8:
	add r5, r5, #1
	cmp r5, #0x100
	blt _0204A774
_0204A8D4:
	add sp, sp, #0x18
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A72C

	arm_func_start sub_0204A8E0
sub_0204A8E0: ; 0x0204A8E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl Card_GetCurrentBackupType
	and r0, r0, #0xff
	cmp r0, #1
	movne r0, #3
	bne _0204A9C0
	mov r6, #0
	mov r7, r4, lsl #8
	mov fp, r6
	b _0204A9B4
_0204A918:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r4, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockBackup
	mov r0, r4
	mov r1, #0x13
	bl sub_020027F8
	str fp, [sp]
	mov sl, r0
	str fp, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, fp
	str fp, [sp, #0x10]
	bl Cardi_RequestStreamCommand
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	cmp sl, #0
	movne r0, #0
	bne _0204A9C0
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204A9B4:
	cmp r6, #4
	blt _0204A918
	mov r0, #3
_0204A9C0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A8E0

	arm_func_start sub_0204A9C8
sub_0204A9C8: ; 0x0204A9C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x214
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl Card_GetCurrentBackupType
	and r0, r0, #0xff
	cmp r0, #1
	movne r0, #3
	bne _0204AB10
	mov r7, r4, lsl #8
	mov r6, #0
	mov fp, #6
	b _0204AB04
_0204AA00:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r1, #0x13
	mov r4, r0
	bl sub_020027F8
	mov sl, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockBackup
	mov r0, #0
	str r0, [sp]
	stmib sp, {r0, fp}
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, r7
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0
	bl Cardi_RequestStreamCommand
	cmp r0, #0
	bne _0204AA8C
	mov r0, r4
	mov r1, sl
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	mov r0, #4
	b _0204AB10
_0204AA8C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, sb
	mov r1, r7
	mov r2, r8
	mov r3, #0
	bl Cardi_RequestStreamCommand
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockBackup
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockId
	cmp sl, #0
	movne r0, #0
	bne _0204AB10
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204AB04:
	cmp r6, #4
	blt _0204AA00
	mov r0, #3
_0204AB10:
	add sp, sp, #0x214
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A9C8

