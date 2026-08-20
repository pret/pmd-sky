	.include "asm/macros.inc"
	.include "overlay_29_0234AEE8.inc"

	.text

	arm_func_start ov29_0234AEE8
ov29_0234AEE8: ; 0x0234AEE8
	stmdb sp!, {r3, lr}
	ldr r0, _0234AF30 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	bne _0234AF24
	bl ov29_022EAEFC
	cmp r0, #0
	beq _0234AF24
	ldr r0, _0234AF30 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x32]
#else
	ldrsh r0, [r0, #0xd6]
#endif
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
_0234AF24:
	mov r0, #0
	bl SetUnkMusicFlag
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AF30: .word DUNGEON_PTR
	arm_func_end ov29_0234AEE8

	arm_func_start ov29_0234AF34
ov29_0234AF34: ; 0x0234AF34
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb ip, [r2]
	ldr r2, [r6, #0xb4]
	mov r5, r1
	mov r4, r3
	strb ip, [r2, #0x48]
	bl ov29_022E68F0
	cmp r5, #0
	beq _0234AF64
	mov r0, r5
	bl ov29_022E68F0
_0234AF64:
	ldr r1, _0234AFA0 ; =0x0000025B
	mov r0, r6
	mov r2, #0
	bl HandleFaint
	cmp r5, #0
	beq _0234AF8C
	ldr r1, _0234AFA0 ; =0x0000025B
	mov r0, r5
	mov r2, #0
	bl HandleFaint
_0234AF8C:
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, r4
	bl MissionExitPrompt
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234AFA0: .word 0x0000025B
	arm_func_end ov29_0234AF34

	arm_func_start InitAlertBoxInfo
InitAlertBoxInfo: ; 0x0234AFA4
	stmdb sp!, {r3, lr}
	mov r0, #0xcf0
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234AFCC ; =MESSAGE_LOG_INFO
	mov r1, #0xcf0
	str r0, [r2, #4]
	bl MemZero
	bl ov29_0234B130
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AFCC: .word MESSAGE_LOG_INFO
	arm_func_end InitAlertBoxInfo

	arm_func_start FreeAlertBoxInfo
FreeAlertBoxInfo: ; 0x0234AFD0
	stmdb sp!, {r3, lr}
	ldr r0, _0234AFF8 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0234AFF8 ; =MESSAGE_LOG_INFO
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AFF8: .word MESSAGE_LOG_INFO
	arm_func_end FreeAlertBoxInfo

	arm_func_start ov29_0234AFFC
ov29_0234AFFC: ; 0x0234AFFC
	ldr r1, _0234B00C ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	strb r0, [r1, #0xced]
	bx lr
	.align 2, 0
_0234B00C: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234AFFC

	arm_func_start ov29_0234B010
ov29_0234B010: ; 0x0234B010
	ldr r1, _0234B020 ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	strb r0, [r1, #0xcee]
	bx lr
	.align 2, 0
_0234B020: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B010

	arm_func_start SetMessageLogGroupStartFlag
SetMessageLogGroupStartFlag: ; 0x0234B024
	ldr r1, _0234B030 ; =MESSAGE_LOG_INFO
	strb r0, [r1]
	bx lr
	.align 2, 0
_0234B030: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogGroupStartFlag

	arm_func_start GetMessageLogPreprocessorArgs
GetMessageLogPreprocessorArgs: ; 0x0234B034
	ldr r0, _0234B048 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bx lr
	.align 2, 0
_0234B048: .word MESSAGE_LOG_INFO
	arm_func_end GetMessageLogPreprocessorArgs

	arm_func_start InitMessageLogPreprocessorArgs
InitMessageLogPreprocessorArgs: ; 0x0234B04C
	ldr r0, _0234B064 ; =MESSAGE_LOG_INFO
	ldr ip, _0234B068 ; =InitPreprocessorArgs
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bx ip
	.align 2, 0
_0234B064: .word MESSAGE_LOG_INFO
_0234B068: .word InitPreprocessorArgs
	arm_func_end InitMessageLogPreprocessorArgs

	arm_func_start SetMessageLogPreprocessorArgsFlagVal
SetMessageLogPreprocessorArgsFlagVal: ; 0x0234B06C
	ldr r2, _0234B080 ; =MESSAGE_LOG_INFO
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xc9c]
	bx lr
	.align 2, 0
_0234B080: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsFlagVal

	arm_func_start SetPreprocessorArgsIdVal
SetPreprocessorArgsIdVal: ; 0x0234B084
	ldr r2, _0234B098 ; =MESSAGE_LOG_INFO
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcac]
	bx lr
	.align 2, 0
_0234B098: .word MESSAGE_LOG_INFO
	arm_func_end SetPreprocessorArgsIdVal

	arm_func_start SetMessageLogPreprocessorArgsNumberVal
SetMessageLogPreprocessorArgsNumberVal: ; 0x0234B09C
	ldr r2, _0234B0B0 ; =MESSAGE_LOG_INFO
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcc0]
	bx lr
	.align 2, 0
_0234B0B0: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsNumberVal

	arm_func_start SetMessageLogPreprocessorArgsString
SetMessageLogPreprocessorArgsString: ; 0x0234B0B4
	ldr r2, _0234B0C8 ; =MESSAGE_LOG_INFO
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcd4]
	bx lr
	.align 2, 0
_0234B0C8: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsString

	arm_func_start SetMessageLogPreprocessorArgsStringToName
SetMessageLogPreprocessorArgsStringToName: ; 0x0234B0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl GetSize0x80Buffer
	mov r1, r4
	mov r2, #0x4e
	mov r4, r0
	bl GetName
	ldr r0, _0234B100 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, r5, lsl #2
	str r4, [r0, #0xcd4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234B100: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsStringToName

	arm_func_start SetMessageLogPreprocessorArgsSpeakerId
SetMessageLogPreprocessorArgsSpeakerId: ; 0x0234B104
	ldr r1, _0234B114 ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	str r0, [r1, #0xce8]
	bx lr
	.align 2, 0
_0234B114: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsSpeakerId

	arm_func_start SetMessageLogPreprocessorArgsSpeakerId0x30000
SetMessageLogPreprocessorArgsSpeakerId0x30000: ; 0x0234B118
	ldr r1, _0234B12C ; =MESSAGE_LOG_INFO
	orr r2, r0, #0x30000
	ldr r0, [r1, #4]
	str r2, [r0, #0xce8]
	bx lr
	.align 2, 0
_0234B12C: .word MESSAGE_LOG_INFO
	arm_func_end SetMessageLogPreprocessorArgsSpeakerId0x30000

	arm_func_start ov29_0234B130
ov29_0234B130: ; 0x0234B130
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr r1, _0234B1A0 ; =MESSAGE_LOG_INFO
	mov r0, r3
_0234B140:
	ldr r2, [r1, #4]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0xc80]
	cmp r3, #0xa
	blt _0234B140
	ldr r1, _0234B1A0 ; =MESSAGE_LOG_INFO
	mvn ip, #1
	ldr r3, [r1, #4]
	mov r2, #1
	strb ip, [r3, #0xcec]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xcee]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xced]
	str r0, [r1, #8]
	strb r2, [r1]
	bl ov29_0234B1A4
	ldr r0, _0234B1A0 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B1A0: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B130

	arm_func_start ov29_0234B1A4
ov29_0234B1A4: ; 0x0234B1A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022E9FC0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov ip, #0
	ldr r2, _0234B24C ; =MESSAGE_LOG_INFO
	mov r0, ip
_0234B1C4:
	ldr r3, [r2, #4]
	add r1, ip, ip, lsl #2
	add ip, ip, #1
	strb r0, [r3, r1, lsl #6]
	cmp ip, #0xa
	blt _0234B1C4
	ldr r2, _0234B24C ; =MESSAGE_LOG_INFO
	mov r3, #4
	ldr r1, [r2, #4]
	strb r0, [r1, #0xc8b]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8c]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8e]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x90]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r3, [r1, #0x92]
	ldr r1, [r2, #4]
	str r0, [r1, #0xc98]
	bl FullyCloseAlertBox
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, r0
	bl UnkMapRelatedFunc
	mov r0, #0xb
	bl AdvanceFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234B24C: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B1A4

	arm_func_start LogMessageByIdWithPopupCheckParticipants
LogMessageByIdWithPopupCheckParticipants: ; 0x0234B250
	stmdb sp!, {r3, lr}
	ldr ip, _0234B290 ; =MESSAGE_LOG_INFO
	cmp r1, #0
	ldr ip, [ip, #4]
	ldrsh lr, [sp, #8]
	add r3, ip, r3, lsl #2
	cmpne r0, #0
	str lr, [r3, #0xcac]
	beq _0234B27C
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, pc}
_0234B27C:
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B290: .word MESSAGE_LOG_INFO
	arm_func_end LogMessageByIdWithPopupCheckParticipants

	arm_func_start WaitUntilAlertBoxTextIsLoadedWrapper
WaitUntilAlertBoxTextIsLoadedWrapper: ; 0x0234B294
	ldr ip, _0234B2A0 ; =WaitUntilAlertBoxTextIsLoaded
	mov r0, #0x50
	bx ip
	.align 2, 0
_0234B2A0: .word WaitUntilAlertBoxTextIsLoaded
	arm_func_end WaitUntilAlertBoxTextIsLoadedWrapper

	arm_func_start LogMessageByIdWithPopupCheckUser
LogMessageByIdWithPopupCheckUser: ; 0x0234B2A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r6
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageByIdWithPopupCheckUser

	arm_func_start LogMessageWithPopupCheckUser
LogMessageWithPopupCheckUser: ; 0x0234B2E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageWithPopupCheckUser

	arm_func_start LogMessageByIdQuiet
LogMessageByIdQuiet: ; 0x0234B31C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdQuiet
