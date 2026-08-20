	.include "asm/macros.inc"
	.include "main_0201D1B0.inc"

	.text

	arm_func_start sub_0201D1B0
sub_0201D1B0: ; 0x0201D1B0
	ldrh r0, [r0]
	tst r0, #0x2000
	movne r0, #0
	bxne lr
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0201D1B0

	arm_func_start sub_0201D1D4
sub_0201D1D4: ; 0x0201D1D4
	ldr r0, [r0, #0x2c]
	bx lr
	arm_func_end sub_0201D1D4

	arm_func_start DeleteWanTableEntry
DeleteWanTableEntry: ; 0x0201D1DC
	stmdb sp!, {r4, lr}
	mov r2, #0x38
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	beq _0201D204
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0201D204:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	ldrnesh r0, [r4, #0x2c]
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #1
	strh r0, [r4, #0x2c]
	ldrsh r0, [r4, #0x2c]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x34]
	bl MemFree
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end DeleteWanTableEntry

	arm_func_start AllocateWanTableEntry
AllocateWanTableEntry: ; 0x0201D244
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x1500
	mov lr, #1
	ldrsh r4, [r1, #0xa]
	ldrsh r5, [r1, #8]
	mov ip, lr
	mov r3, #0x38
	b _0201D2C4
_0201D264:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0201D2AC
	add r2, r4, #1
	add r1, r0, #0x1500
	strh r2, [r1, #0xa]
	ldrsh r3, [r1, #0xa]
	ldrsh r2, [r1, #8]
	cmp r3, r2
	movge r2, #1
	strgeh r2, [r1, #0xa]
	mov r1, #0x38
	bl MemZero
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_0201D2AC:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_0201D2C4:
	cmp lr, r5
	blt _0201D264
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AllocateWanTableEntry

	arm_func_start FindWanTableEntry
FindWanTableEntry: ; 0x0201D2D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	add r0, r6, #0x1500
	mov r5, r1
	ldrsh r4, [r0, #8]
	mov r8, #1
	mov r7, #0x38
	b _0201D324
_0201D2F4:
	smlabb r0, r8, r7, r6
	ldrb r1, [r0, #0x21]
	cmp r1, #1
	bne _0201D318
	mov r1, r5
	bl strcmp
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0201D318:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_0201D324:
	cmp r8, r4
	blt _0201D2F4
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FindWanTableEntry

	arm_func_start GetLoadedWanTableEntry
GetLoadedWanTableEntry: ; 0x0201D334
	stmdb sp!, {r3, r4, r5, lr}
	add r3, r0, #0x1500
	ldrsh r5, [r3, #8]
	mov r4, #1
	mov ip, #0x38
	b _0201D37C
_0201D34C:
	smlabb lr, r4, ip, r0
	ldrb r3, [lr, #0x21]
	cmp r3, #2
	ldreqh r3, [lr, #0x22]
	cmpeq r1, r3
	ldreqh r3, [lr, #0x24]
	cmpeq r2, r3
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_0201D37C:
	cmp r4, r5
	blt _0201D34C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetLoadedWanTableEntry

	arm_func_start sub_0201D38C
sub_0201D38C: ; 0x0201D38C
	stmdb sp!, {r4, lr}
	ldr r1, _0201D3B8 ; =0x00001510
	mov r4, r0
	bl MemZero
	add r1, r4, #0x1500
	mov r2, #1
	strh r2, [r1, #0xa]
	add r0, r4, #0x1000
	strb r2, [r0, #0x50c]
	strh r2, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201D3B8: .word 0x00001510
	arm_func_end sub_0201D38C

	arm_func_start InitWanTable
InitWanTable: ; 0x0201D3BC
	stmdb sp!, {r4, lr}
	mov r1, #0x1500
	mov r4, r0
	bl MemZero
	add r0, r4, #0x1500
	mov r1, #0x60
	strh r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end InitWanTable

	arm_func_start LoadWanTableEntry
LoadWanTableEntry: ; 0x0201D3DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	mov r7, r2
	bl FindWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D418
	mov r1, #0x38
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	b _0201D47C
_0201D418:
	mov r0, r5
	bl AllocateWanTableEntry
	mov r4, r0
	mov r0, #0x38
	smlabb r5, r4, r0, r5
	mov r3, #1
	add r0, sp, #0
	mov r1, r6
	mov r2, r7
	strb r3, [r5, #0x21]
	bl LoadFileFromRom
	ldr r1, [sp]
	mov r0, r5
	str r1, [r5, #0x34]
	ldr r2, [sp, #4]
	mov r1, r6
	str r2, [r5, #0x28]
	bl strcpy
	ldrsh r1, [r5, #0x2c]
	add r0, r5, #0x30
	add r1, r1, #1
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r4
_0201D47C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LoadWanTableEntry

	arm_func_start LoadWanTableEntryFromPack
LoadWanTableEntryFromPack: ; 0x0201D484
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D4C0
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D4C0:
	mov r0, sb
	bl AllocateWanTableEntry
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	ldrb r0, [sp, #0x20]
	mov r1, #2
	strb r1, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	cmp r0, #0
	beq _0201D53C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r7, r0
	mov r1, r6
	bl MemAlloc
	mov r1, r7
	mov r2, sb
	mov r6, r0
	bl DecompressAtNormalVeneer
	b _0201D56C
_0201D53C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r1, r6
	mov sb, r0
	bl MemAlloc
	mov r6, r0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
	str sb, [r4, #0x28]
_0201D56C:
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPack

	arm_func_start LoadWanTableEntryFromPackUseProvidedMemory
LoadWanTableEntryFromPackUseProvidedMemory: ; 0x0201D590
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D5CC
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D5CC:
	mov r0, sb
	bl AllocateWanTableEntry
	ldrb r1, [sp, #0x20]
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	cmp r1, #0
	beq _0201D62C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r2, sb
	mov r1, r0
	mov r0, r6
	bl DecompressAtNormalVeneer
	b _0201D648
_0201D62C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D648:
	mov r0, #2
	strb r0, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPackUseProvidedMemory

	arm_func_start ReplaceWanFromBinFile
ReplaceWanFromBinFile: ; 0x0201D684
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb ip, [sp, #0x18]
	mov r4, #0x38
	smlabb r6, r1, r4, r0
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	beq _0201D6E8
	add r0, r0, #0x1000
	ldr r7, [r0, #0x500]
	mov r0, r5
	mov r1, r4
	ldr r8, [r6, #0x34]
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, r7
	bl GetAtSize
	mov r2, r7
	mov r1, r0
	mov r0, r8
	bl DecompressAtNormalVeneer
	b _0201D708
_0201D6E8:
	ldr r7, [r6, #0x34]
	mov r0, r5
	mov r1, r4
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D708:
	ldr r1, [r6, #0x34]
	add r0, r6, #0x30
	bl HandleSir0TranslationVeneer
	mov r0, #2
	strb r0, [r6, #0x21]
	strh r5, [r6, #0x22]
	strh r4, [r6, #0x24]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ReplaceWanFromBinFile
