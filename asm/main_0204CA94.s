	.include "asm/macros.inc"
	.include "main_0204CA94.inc"

	.text

	arm_func_start GetPerformanceFlagWithChecks
GetPerformanceFlagWithChecks: ; 0x0204CA94
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #7
	addls pc, pc, r4, lsl #2
	b _0204CB10
_0204CAA8: ; jump table
	b _0204CAC8 ; case 0
	b _0204CB00 ; case 1
	b _0204CB00 ; case 2
	b _0204CAEC ; case 3
	b _0204CAEC ; case 4
	b _0204CAEC ; case 5
	b _0204CAEC ; case 6
	b _0204CAEC ; case 7
_0204CAC8:
	mov r0, #0
	mov r2, r0
	mov r1, #3
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0x35
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_0204CAEC:
	bl GetGameMode
	cmp r0, #3
	bne _0204CB10
	mov r0, #0
	ldmia sp!, {r4, pc}
_0204CB00:
	bl GetGameMode
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0204CB10:
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x4e
	bl LoadScriptVariableValueAtIndex
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end GetPerformanceFlagWithChecks

	arm_func_start sub_0204CB2C
sub_0204CB2C: ; 0x0204CB2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #7
	addls pc, pc, r5, lsl #2
	b _0204CB70
_0204CB44: ; jump table
	b _0204CB70 ; case 0
	b _0204CB64 ; case 1
	b _0204CB64 ; case 2
	b _0204CB64 ; case 3
	b _0204CB64 ; case 4
	b _0204CB64 ; case 5
	b _0204CB64 ; case 6
	b _0204CB64 ; case 7
_0204CB64:
	bl GetGameMode
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
_0204CB70:
	cmp r4, #0
	movne r3, #1
	mov r0, r5, lsl #0x10
	mov r2, r0, lsr #0x10
	moveq r3, #0
	mov r0, #0
	mov r1, #0x4e
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204CB2C

	arm_func_start GetScenarioBalance
GetScenarioBalance: ; 0x0204CB94
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x49
	bl LoadScriptVariableValue
	mvn r1, #0
	cmp r0, r1
	bne _0204CBD8
	mov r0, #0
	mov r1, #0x14
	bl LoadScriptVariableValue
	cmp r0, #0
	bge _0204CBD0
	mov r0, #0
	mov r1, #0x13
	bl LoadScriptVariableValue
_0204CBD0:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0204CBD8:
	cmp r0, #0
	moveq r0, #1
	movne r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end GetScenarioBalance

	arm_func_start sub_0204CBE8
sub_0204CBE8: ; 0x0204CBE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r4, r0, #2
	ldr r0, _0204CCB4 ; =_0209DFC8
	mov r1, r4
	bl Debug_Print0
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x1a
	bl LoadScriptVariableValueAtIndex
	mov r3, r0
	mov r0, #0
	mov r2, r0
	mov r1, #2
	bl SaveScriptVariableValueAtIndex
	add r2, r4, #4
	mov r2, r2, lsl #0x10
	mov r0, #0
	mov r1, #0x1a
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r3, r0
	mov r0, #0
	mov r1, #2
	mov r2, #1
	bl SaveScriptVariableValueAtIndex
	mov r8, #0
	mov sb, r4, lsl #7
	mov r7, r8
	mov r6, #0x1b
	mov r5, r8
	mov r4, #0x11
_0204CC74:
	mov r2, sb, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r8, lsl #0x10
	mov r3, r0
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r8, r8, #1
	cmp r8, #0x80
	add sb, sb, #1
	blt _0204CC74
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204CCB4: .word _0209DFC8
	arm_func_end sub_0204CBE8

	arm_func_start ScenarioFlagBackup
ScenarioFlagBackup: ; 0x0204CCB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r4, r0, #2
	ldr r0, _0204CD84 ; =_0209DFE8
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	mov r2, r0
	mov r1, #2
	bl LoadScriptVariableValueAtIndex
	mov r1, r4, lsl #0x10
	mov r3, r0
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x1a
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #2
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	add r2, r4, #4
	mov r2, r2, lsl #0x10
	mov r3, r0
	mov r0, #0
	mov r1, #0x1a
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r8, #0
	mov sb, r4, lsl #7
	mov r7, r8
	mov r6, #0x11
	mov r5, r8
	mov r4, #0x1b
_0204CD44:
	mov r2, r8, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, sb, lsl #0x10
	mov r3, r0
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r8, r8, #1
	cmp r8, #0x80
	add sb, sb, #1
	blt _0204CD44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204CD84: .word _0209DFE8
	arm_func_end ScenarioFlagBackup

	arm_func_start InitWorldMapScriptVars
InitWorldMapScriptVars: ; 0x0204CD88
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x55
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x56
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x57
	mov r2, #1
	bl SaveScriptVariableValue
	ldmia sp!, {r3, pc}
	arm_func_end InitWorldMapScriptVars

	arm_func_start sub_0204CDB8
sub_0204CDB8: ; 0x0204CDB8
	ldr ip, _0204CDC8 ; =ZinitScriptVariable
	mov r0, #0
	mov r1, #0x56
	bx ip
	.align 2, 0
_0204CDC8: .word ZinitScriptVariable
	arm_func_end sub_0204CDB8

	arm_func_start sub_0204CDCC
sub_0204CDCC: ; 0x0204CDCC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x57
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CDCC

	arm_func_start sub_0204CDE8
sub_0204CDE8: ; 0x0204CDE8
	ldr ip, _0204CDFC ; =SaveScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x57
	bx ip
	.align 2, 0
_0204CDFC: .word SaveScriptVariableValue
	arm_func_end sub_0204CDE8

	arm_func_start sub_0204CE00
sub_0204CE00: ; 0x0204CE00
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetGameMode
	cmp r0, #3
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	bne _0204CE2C
	mov r1, #0x56
	bl LoadScriptVariableValueAtIndex
	b _0204CE34
_0204CE2C:
	mov r1, #0x55
	bl LoadScriptVariableValueAtIndex
_0204CE34:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204CE00

	arm_func_start sub_0204CE48
sub_0204CE48: ; 0x0204CE48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetGameMode
	cmp r0, #3
	mov r0, r5, lsl #0x10
	mov r3, r4
	bne _0204CE7C
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x56
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
_0204CE7C:
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x55
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204CE48

	arm_func_start InitDungeonListScriptVars
InitDungeonListScriptVars: ; 0x0204CE90
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x4f
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x54
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x50
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x51
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x52
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x53
	bl ZinitScriptVariable
	ldmia sp!, {r3, pc}
	arm_func_end InitDungeonListScriptVars

	arm_func_start sub_0204CEE0
sub_0204CEE0: ; 0x0204CEE0
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x50
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CEE0

	arm_func_start sub_0204CF0C
sub_0204CF0C: ; 0x0204CF0C
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x52
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CF0C

	arm_func_start SetDungeonConquest
SetDungeonConquest: ; 0x0204CF38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r0, r0, lsl #0x10
	mov r3, r1
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x52
	bl SaveScriptVariableValueAtIndex
	mov r7, #0
	ldr r6, _0204CF98 ; =_0209E008
	mov r5, r7
	mov r4, #0x52
_0204CF64:
	ldrb r2, [r6, r7]
	add r7, r7, #1
	cmp r2, #0xff
	bne _0204CF80
	mov r0, #0x23
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204CF80:
	mov r0, r5
	mov r1, r4
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	bne _0204CF64
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0204CF98: .word _0209E008
	arm_func_end SetDungeonConquest

	arm_func_start GetDungeonMode
GetDungeonMode: ; 0x0204CF9C
	stmdb sp!, {r4, lr}
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	beq _0204CFF8
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #3
	moveq r0, #1
	ldmia sp!, {r4, pc}
_0204CFF8:
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetDungeonMode

	arm_func_start sub_0204D018
sub_0204D018: ; 0x0204D018
	stmdb sp!, {r4, lr}
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r4, pc}
_0204D028: ; jump table
	b _0204D038 ; case 0
	b _0204D06C ; case 1
	b _0204D0A0 ; case 2
	b _0204D0D4 ; case 3
_0204D038:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x4f
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x54
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D06C:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x54
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D0A0:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x4f
	bl SaveScriptVariableValueAtIndex
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D0D4:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204D018

	arm_func_start GlobalProgressAlloc
GlobalProgressAlloc: ; 0x0204D108
	stmdb sp!, {r3, lr}
	mov r0, #0x20c
	mov r1, #0
	bl MemAlloc
	ldr r2, _0204D12C ; =GLOBAL_PROGRESS_PTR
	mov r1, #0x20c
	str r0, [r2]
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D12C: .word GLOBAL_PROGRESS_PTR
	arm_func_end GlobalProgressAlloc

	arm_func_start ResetGlobalProgress
ResetGlobalProgress: ; 0x0204D130
	ldr r0, _0204D144 ; =GLOBAL_PROGRESS_PTR
	ldr ip, _0204D148 ; =MemZero
	mov r1, #0x20c
	ldr r0, [r0]
	bx ip
	.align 2, 0
_0204D144: .word GLOBAL_PROGRESS_PTR
_0204D148: .word MemZero
	arm_func_end ResetGlobalProgress

	arm_func_start SetMonsterFlag1
SetMonsterFlag1: ; 0x0204D14C
	stmdb sp!, {r3, lr}
	ldr r3, _0204D184 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	ldr lr, [r3]
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D184: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMonsterFlag1

	arm_func_start GetMonsterFlag1
GetMonsterFlag1: ; 0x0204D188
	ldr r3, _0204D1C0 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r2, r0, r1, lsr #27
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r3, [r3]
	mov r2, r2, asr #5
	ldr r2, [r3, r2, lsl #2]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204D1C0: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetMonsterFlag1

	arm_func_start SetMonsterFlag2
SetMonsterFlag2: ; 0x0204D1C4
	stmdb sp!, {r3, lr}
	bl FemaleToMaleForm
	ldr r2, _0204D204 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	ldr r3, [r2]
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x98
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D204: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMonsterFlag2

	arm_func_start HasMonsterBeenAttackedInDungeons
HasMonsterBeenAttackedInDungeons: ; 0x0204D208
	stmdb sp!, {r3, lr}
	bl FemaleToMaleForm
	ldr r3, _0204D24C ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r2, r0, r1, lsr #27
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r3, [r3]
	mov r2, r2, asr #5
	add r2, r3, r2, lsl #2
	ldr r2, [r2, #0x98]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D24C: .word GLOBAL_PROGRESS_PTR
	arm_func_end HasMonsterBeenAttackedInDungeons

	arm_func_start SetDungeonTipShown
SetDungeonTipShown: ; 0x0204D250
	stmdb sp!, {r3, lr}
	ldr r2, _0204D28C ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	ldr r3, [r2]
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x94
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D28C: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetDungeonTipShown

	arm_func_start GetDungeonTipShown
GetDungeonTipShown: ; 0x0204D290
	cmp r0, #0x1f
	movge r0, #0
	bxge lr
	ldr r2, _0204D2D8 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r2]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r2, [r2, #0x94]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204D2D8: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetDungeonTipShown

	arm_func_start SetMaxReachedFloor
SetMaxReachedFloor: ; 0x0204D2DC
	cmp r0, #0xb4
	ldrlo r2, _0204D2F4 ; =GLOBAL_PROGRESS_PTR
	ldrlo r2, [r2]
	addlo r0, r2, r0
	strlob r1, [r0, #0x143]
	bx lr
	.align 2, 0
_0204D2F4: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMaxReachedFloor

	arm_func_start GetMaxReachedFloor
GetMaxReachedFloor: ; 0x0204D2F8
	cmp r0, #0xb4
	ldrlo r1, _0204D314 ; =GLOBAL_PROGRESS_PTR
	movhs r0, #0
	ldrlo r1, [r1]
	addlo r0, r1, r0
	ldrlob r0, [r0, #0x143]
	bx lr
	.align 2, 0
_0204D314: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetMaxReachedFloor

	arm_func_start IncrementNbAdventures
IncrementNbAdventures: ; 0x0204D318
	ldr r0, _0204D344 ; =GLOBAL_PROGRESS_PTR
	ldr r1, _0204D348 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x1f8]
	add r2, r2, #1
	str r2, [r3, #0x1f8]
	ldr r2, [r0]
	ldr r0, [r2, #0x1f8]
	cmp r0, r1
	strhi r1, [r2, #0x1f8]
	bx lr
	.align 2, 0
_0204D344: .word GLOBAL_PROGRESS_PTR
_0204D348: .word 0x000F423F
	arm_func_end IncrementNbAdventures

	arm_func_start GetNbAdventures
GetNbAdventures: ; 0x0204D34C
	ldr r0, _0204D35C ; =GLOBAL_PROGRESS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1f8]
	bx lr
	.align 2, 0
_0204D35C: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetNbAdventures

	arm_func_start CanMonsterSpawn
CanMonsterSpawn: ; 0x0204D360
	mov r0, #1
	bx lr
	arm_func_end CanMonsterSpawn

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
	bl sub_02050990
	add r0, sp, #0
	bl CopyProgressInfoTo
	add r0, sp, #0
	bl sub_020509BC
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
	bl sub_02050974
	add r0, sp, #0
	bl CopyProgressInfoFrom
	add r0, sp, #0
	bl sub_020509BC
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
