	.include "asm/macros.inc"
	.include "main_0204D368.inc"

	.text

	arm_func_start IncrementExclusiveMonsterCounts
IncrementExclusiveMonsterCounts: ; 0x0204D368
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0204D3B8 ; =VERSION_EXCLUSIVE_MONSTERS
	ldr r7, _0204D3BC ; =GLOBAL_PROGRESS_PTR
	mov r6, r0
	mov r5, #0
	mov r8, #1
_0204D380:
	mov r0, r5, lsl #2
	ldrsh r0, [r4, r0]
	bl GetDexNumber
	mov sb, r0
	mov r0, r6
	bl GetDexNumber
	cmp sb, r0
	ldreq r0, [r7]
	addeq r0, r0, r5
	add r5, r5, #1
	streqb r8, [r0, #0x12c]
	cmp r5, #0x17
	blt _0204D380
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204D3B8: .word VERSION_EXCLUSIVE_MONSTERS
_0204D3BC: .word GLOBAL_PROGRESS_PTR
	arm_func_end IncrementExclusiveMonsterCounts

	arm_func_start CopyProgressInfoTo
CopyProgressInfoTo: ; 0x0204D3C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0204D538 ; =0x00000483
	mov r5, r0
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D3D8:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterFlag1
	strb r0, [sp]
	mov r0, r5
	mov r1, r7
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, r4
	blt _0204D3D8
	mov r7, #0
	add r6, sp, #0
	mov r4, #1
_0204D410:
	mov r0, r7
	bl GetDungeonTipShown
	strb r0, [sp]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x1f
	blt _0204D410
	ldr r4, _0204D538 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D448:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl HasMonsterBeenAttackedInDungeons
	strb r0, [sp]
	mov r0, r5
	mov r1, r7
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, r4
	blt _0204D448
	ldr r8, _0204D53C ; =_0209E011
	ldr sb, _0204D540 ; =_0209E010
	ldr r6, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r4, #0
	mov r7, #1
_0204D488:
	ldr r0, [r6]
	mov r2, r7
	add r0, r0, r4
	ldrb r0, [r0, #0x12c]
	cmp r0, #0
	movne r1, sb
	moveq r1, r8
	mov r0, r5
	bl CopyBitsTo
	add r4, r4, #1
	cmp r4, #0x17
	blt _0204D488
	ldr r4, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #7
_0204D4C4:
	ldr r1, [r4]
	mov r0, r5
	add r1, r1, #0x43
	add r1, r1, #0x100
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0xb4
	blt _0204D4C4
	ldr r1, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x1f8
	bl CopyBitsTo
	ldr r4, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #8
_0204D510:
	ldr r1, [r4]
	mov r0, r5
	add r1, r1, #0x1fc
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x10
	blt _0204D510
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204D538: .word 0x00000483
_0204D53C: .word _0209E011
_0204D540: .word _0209E010
_0204D544: .word GLOBAL_PROGRESS_PTR
	arm_func_end CopyProgressInfoTo

	arm_func_start CopyProgressInfoFromScratchTo
CopyProgressInfoFromScratchTo: ; 0x0204D548
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForRead
	add r0, sp, #0
	bl CopyProgressInfoTo
	add r0, sp, #0
	bl BitstreamDebug
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end CopyProgressInfoFromScratchTo

	arm_func_start CopyProgressInfoFrom
CopyProgressInfoFrom: ; 0x0204D580
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r1, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x20c
	bl MemZero
	ldr r5, _0204D744 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D5AC:
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D5D4
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetMonsterFlag1
_0204D5D4:
	add r8, r8, #1
	cmp r8, r5
	blt _0204D5AC
	mov r7, #0
	add r6, sp, #0
	mov r5, #1
_0204D5EC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D610
	mov r0, r7
	bl SetDungeonTipShown
_0204D610:
	add r7, r7, #1
	cmp r7, #0x1f
	blt _0204D5EC
	ldr r5, _0204D744 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D62C:
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D654
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetMonsterFlag2
_0204D654:
	add r8, r8, #1
	cmp r8, r5
	blt _0204D62C
	mov sb, #0
	mov r6, #1
	ldr sl, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r5, sb
	add r8, sp, #1
	mov r7, r6
_0204D678:
	mov r0, r4
	mov r1, r8
	mov r2, r7
	bl CopyBitsFrom
	ldrb r0, [sp, #1]
	tst r0, #1
	ldr r0, [sl]
	movne r1, r6
	add r0, r0, sb
	moveq r1, r5
	add sb, sb, #1
	strb r1, [r0, #0x12c]
	cmp sb, #0x17
	blt _0204D678
	ldr r8, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	add r6, sp, #1
	mov r5, #7
_0204D6C0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl CopyBitsFrom
	ldrb r1, [sp, #1]
	ldr r0, [r8]
	add r0, r0, r7
	and r1, r1, #0x7f
	add r7, r7, #1
	strb r1, [r0, #0x143]
	cmp r7, #0xb4
	blt _0204D6C0
	ldr r1, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x1f8
	bl CopyBitsFrom
	ldr r5, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #8
_0204D714:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, #0x1fc
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x10
	blt _0204D714
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204D740: .word GLOBAL_PROGRESS_PTR
_0204D744: .word 0x00000483
	arm_func_end CopyProgressInfoFrom

	arm_func_start CopyProgressInfoFromScratchFrom
CopyProgressInfoFromScratchFrom: ; 0x0204D748
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForWrite
	add r0, sp, #0
	bl CopyProgressInfoFrom
	add r0, sp, #0
	bl BitstreamDebug
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end CopyProgressInfoFromScratchFrom

	arm_func_start InitKaomadoStream
InitKaomadoStream: ; 0x0204D780
	stmdb sp!, {r3, lr}
	bl FileRom_InitDataTransfer
	ldr r0, _0204D798 ; =KAOMADO_STREAM
	bl FileRom_Veneer_FileInit
	bl FileRom_StopDataTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D798: .word KAOMADO_STREAM
	arm_func_end InitKaomadoStream

	arm_func_start InitPortraitParams
InitPortraitParams: ; 0x0204D79C
	mov r2, #0
	strh r2, [r0]
	sub r1, r2, #2
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	mov r1, #2
	str r1, [r0, #4]
	mov r1, #9
	str r1, [r0, #8]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	bx lr
	arm_func_end InitPortraitParams

	arm_func_start InitPortraitParamsWithMonsterId
InitPortraitParamsWithMonsterId: ; 0x0204D7D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl InitPortraitParams
	strh r4, [r5]
	mov r0, #0
	strb r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitPortraitParamsWithMonsterId

	arm_func_start SetPortraitEmotion
SetPortraitEmotion: ; 0x0204D7F4
	ldrsh r2, [r0]
	cmp r2, #0
	strneb r1, [r0, #2]
	bx lr
	arm_func_end SetPortraitEmotion

	arm_func_start SetPortraitLayout
SetPortraitLayout: ; 0x0204D804
	ldrsh r2, [r0]
	cmp r2, #0
	cmpne r1, #0x20
	bxeq lr
	mov r2, #6
	mul r2, r1, r2
	ldr r3, _0204D844 ; =PORTRAIT_LAYOUTS
	strb r1, [r0, #3]
	ldrsh r1, [r3, r2]
	add r2, r3, r2
	str r1, [r0, #4]
	ldrsh r1, [r2, #2]
	str r1, [r0, #8]
	ldrb r1, [r2, #4]
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0204D844: .word PORTRAIT_LAYOUTS
	arm_func_end SetPortraitLayout

	arm_func_start SetPortraitOffset
SetPortraitOffset: ; 0x0204D848
	stmdb sp!, {r3, lr}
	ldrsh r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r3, [r0, #3]
	mov r2, #6
	ldr lr, _0204D890 ; =PORTRAIT_LAYOUTS
	smulbb ip, r3, r2
	ldrsh r3, [lr, ip]
	ldr r2, [r1]
	add ip, lr, ip
	add r2, r3, r2
	str r2, [r0, #4]
	ldrsh r2, [ip, #2]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D890: .word PORTRAIT_LAYOUTS
	arm_func_end SetPortraitOffset

	arm_func_start AllowPortraitDefault
AllowPortraitDefault: ; 0x0204D894
	strb r1, [r0, #0xf]
	bx lr
	arm_func_end AllowPortraitDefault

	arm_func_start IsValidPortrait
IsValidPortrait: ; 0x0204D89C
	ldrsh r1, [r0]
	cmp r1, #0
	ldrnesb r1, [r0, #2]
	mvnne r0, #1
	cmpne r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end IsValidPortrait

	arm_func_start LoadPortrait
LoadPortrait: ; 0x0204D8BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	ldrsh r7, [sl]
	ldrsb r8, [sl, #2]
	bl FileRom_InitDataTransfer
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	ldr r1, _0204DA18 ; =KAOMADO_FILEPATH
	bl FileRom_HandleOpen
	mov fp, #0
	mov r4, fp
	mov r5, #1
	b _0204D9DC
_0204D8F4:
	mov r0, #0x28
	mul r0, r7, r0
	add r0, r0, r8, lsl #1
	mov r1, r0, lsl #2
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r2, #0
	sub r7, r7, #0x258
	bl FileRom_HandleSeek
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	add r1, sp, #0
	mov r2, #0xc
	bl FileRom_HandleRead
	ldr r0, [sp, #4]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	strb r0, [sl, #0xd]
	ldrb r0, [sl, #0xc]
	cmp r0, #0
	beq _0204D984
	ldr r0, [sp, #4]
	cmp r0, #0
	mov r1, r0
	bge _0204D96C
	ldr r1, [sp]
	cmp r0, #0
	rsblt r0, r0, #0
	sub r6, r0, r1
	strb r5, [sl, #0xe]
	b _0204D99C
_0204D96C:
	ldr r2, [sp, #8]
	cmp r2, #0
	rsblt r2, r2, #0
	sub r6, r2, r0
	strb r4, [sl, #0xe]
	b _0204D99C
_0204D984:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	rsblt r0, r0, #0
	sub r6, r0, r1
	strb fp, [sl, #0xe]
_0204D99C:
	cmp r1, #0
	ble _0204D9DC
	cmp sb, #0
	beq _0204D9C8
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r1, sb
	mov r2, r6
	bl FileRom_HandleRead
_0204D9C8:
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #1
	b _0204DA0C
_0204D9DC:
	cmp r7, #0
	bgt _0204D8F4
	ldrb r0, [sl, #0xf]
	cmp r0, #0
	cmpne r8, #0
	movne r8, #0
	ldrnesh r7, [sl]
	bne _0204D9DC
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #0
_0204DA0C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204DA14: .word KAOMADO_STREAM
_0204DA18: .word KAOMADO_FILEPATH
	arm_func_end LoadPortrait

	arm_func_start sub_0204DA1C
sub_0204DA1C: ; 0x0204DA1C
	ldr r1, _0204DA28 ; =ARM9_UNKNOWN_TABLE__NA_209E164
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_0204DA28: .word ARM9_UNKNOWN_TABLE__NA_209E164
	arm_func_end sub_0204DA1C
