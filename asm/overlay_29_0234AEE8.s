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
	bl ov29_022EAF34
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
	bl ov29_02348A18
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
	bl ov29_0234B768
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
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

	arm_func_start LogMessageQuiet
LogMessageQuiet: ; 0x0234B340
	ldr ip, _0234B34C ; =LogMessage
	mov r2, #0
	bx ip
	.align 2, 0
_0234B34C: .word LogMessage
	arm_func_end LogMessageQuiet

	arm_func_start LogMessageByIdWithPopupCheckUserTarget
LogMessageByIdWithPopupCheckUserTarget: ; 0x0234B350
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserTarget

	arm_func_start LogMessageWithPopupCheckUserTarget
LogMessageWithPopupCheckUserTarget: ; 0x0234B3A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageWithPopupCheckUserTarget

	arm_func_start LogMessageByIdQuietCheckUserTarget
LogMessageByIdQuietCheckUserTarget: ; 0x0234B3F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdQuietCheckUserTarget

	arm_func_start LogMessageByIdWithPopupCheckUserUnknown
LogMessageByIdWithPopupCheckUserUnknown: ; 0x0234B444
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ov29_022E2CA0
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserUnknown

	arm_func_start LogMessageByIdWithPopup
LogMessageByIdWithPopup: ; 0x0234B498
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdWithPopup

	arm_func_start LogMessageWithPopup
LogMessageWithPopup: ; 0x0234B4BC
	ldr ip, _0234B4C8 ; =LogMessage
	mov r2, #1
	bx ip
	.align 2, 0
_0234B4C8: .word LogMessage
	arm_func_end LogMessageWithPopup

	arm_func_start ov29_0234B4CC
ov29_0234B4CC: ; 0x0234B4CC
	ldr r1, _0234B4DC ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	strb r0, [r1, #0xc8a]
	bx lr
	.align 2, 0
_0234B4DC: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B4CC

	arm_func_start ov29_0234B4E0
ov29_0234B4E0: ; 0x0234B4E0
	ldr r0, _0234B4F0 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xc8b]
	bx lr
	.align 2, 0
_0234B4F0: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B4E0

	arm_func_start ov29_0234B4F4
ov29_0234B4F4: ; 0x0234B4F4
	ldr r0, _0234B504 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc98]
	bx lr
	.align 2, 0
_0234B504: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B4F4

	arm_func_start LogMessage
LogMessage: ; 0x0234B508
#ifdef EUROPE
#define LOG_MESSAGE_STACK_OFFSET 0xC0
#else
#define LOG_MESSAGE_STACK_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x284 + LOG_MESSAGE_STACK_OFFSET
	ldr r4, _0234B708 ; =MESSAGE_LOG_INFO
	mov fp, r2
	ldr r3, [r4, #4]
	ldrb r2, [r3, #0xced]
	cmp r2, #0
	ldreqb r2, [r3, #0xcee]
	cmpeq r2, #0
	bne _0234B700
	ldr r3, _0234B70C ; =DUNGEON_PTR
	mov r7, #0
	ldr r2, [r3]
	mvn r5, #0
	add r2, r2, #0x100
	strh r5, [r2, #0xd8]
	ldr r2, [r3]
	mov r3, #0x400
	add r2, r2, #0x100
	strh r5, [r2, #0xda]
	ldr r2, [r4, #8]
	mov r8, r7
	cmp r2, r0
	movne sl, #1
	ldreqb sl, [r4]
	ldr r2, _0234B708 ; =MESSAGE_LOG_INFO
	mov r6, #1
	str r0, [r2, #8]
	strb r7, [r2]
	ldr r2, [r2, #4]
	add r0, sp, #0x144
	add r2, r2, #0x9c
	add r4, r2, #0xc00
	mov r2, r1
	mov r1, #0x140 + LOG_MESSAGE_STACK_OFFSET
	str r4, [sp]
	bl PreprocessString
	ldr r4, _0234B708 ; =MESSAGE_LOG_INFO
	add r5, sp, #0x144
_0234B5A4:
	ldr r0, [r4, #4]
	add r1, r0, #0xc00
	ldrsh sb, [r1, #0x8c]
	add r1, r0, #0xc00
	ldrsh r2, [r1, #0x8e]
	add r3, sb, #1
	cmp r3, #0xa
	moveq r3, #0
	cmp r3, r2
	bne _0234B5D8
	mov r0, #0
	bl AdvanceFrame
	b _0234B5A4
_0234B5D8:
	ldrb r2, [r5, r8]
	cmp r2, #0
	beq _0234B6D4
	add r0, r0, sb
	strb sl, [r0, #0xc80]
	ldr r1, [r4, #4]
	add r0, sp, #4
	add r1, r1, #0x9c
	add r1, r1, #0xc00
	str r1, [sp]
	mov r1, #0x140
	add r2, r5, r8
	mov r3, #0x440
	bl PreprocessString
	add r8, r8, r0
	ldrb sb, [r5, r8]
	mov r2, #0
	add r1, sp, #4
	strb r2, [r1, r0]
	cmp sb, #0
	beq _0234B660
	ldr r1, _0234B710 ; =ov29_02353214
	add r0, r5, r8
	mov r2, #3
	bl strncmp
	cmp r0, #0
	bne _0234B654
	ldr r0, _0234B710 ; =ov29_02353214
	bl strlen
	add r8, r8, r0
	b _0234B660
_0234B654:
	cmp sb, #0xd
	cmpne sb, #0xa
	addeq r8, r8, #1
_0234B660:
	add r0, sp, #4
	mov r1, sl
	mov r2, r6
	bl ov29_0234BB44
	mov sl, #0
	cmp fp, #0
	mov r6, sl
	beq _0234B5A4
	ldr sb, [r4, #4]
	mov r2, #0x140
	add r0, sb, #0xc00
	ldrsh r3, [r0, #0x8c]
	mov r0, r2
	add r1, sp, #4
	smlabb r0, r3, r0, sb
	mov r7, #1
	bl strncpy
	ldr r0, [r4, #4]
	add r0, r0, #0xc00
	ldrsh r1, [r0, #0x8c]
	add r1, r1, #1
	strh r1, [r0, #0x8c]
	ldr r0, [r4, #4]
	add r1, r0, #0xc00
	ldrsh r0, [r1, #0x8c]
	cmp r0, #0xa
	moveq r0, sl
	streqh r0, [r1, #0x8c]
	b _0234B5A4
_0234B6D4:
	cmp r7, #0
	beq _0234B700
	ldr r0, _0234B708 ; =MESSAGE_LOG_INFO
	mov r2, #0xf0
	strh r2, [r1, #0x90]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc98]
	cmp r0, #0
	moveq r0, #1
	streq r0, [r1, #0xc98]
	bl ov29_022F2FE4
_0234B700:
	add sp, sp, #0x284 + LOG_MESSAGE_STACK_OFFSET
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234B708: .word MESSAGE_LOG_INFO
_0234B70C: .word DUNGEON_PTR
_0234B710: .word ov29_02353214
	arm_func_end LogMessage

	arm_func_start LogMessageById
LogMessageById: ; 0x0234B714
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	mov r0, r1
	bl StringFromId
	mov r1, r0
	mov r0, r5
	mov r2, r4
	bl LogMessage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end LogMessageById

	arm_func_start ov29_0234B73C
ov29_0234B73C: ; 0x0234B73C
	ldr r0, _0234B764 ; =MESSAGE_LOG_INFO
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0234B764: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B73C

	arm_func_start ov29_0234B768
ov29_0234B768: ; 0x0234B768
	stmdb sp!, {r3, lr}
	ldr r0, _0234B7E8 ; =MESSAGE_LOG_INFO
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0234B7E8 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	bl sub_02030214
	ldr r0, _0234B7E8 ; =MESSAGE_LOG_INFO
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	bl CloseAlertBox
	ldr r0, _0234B7E8 ; =MESSAGE_LOG_INFO
	mvn r3, #1
	ldr r1, [r0, #4]
	mov r2, #0
	strb r3, [r1, #0xcec]
	ldr r1, [r0, #4]
	mov r0, #1
	str r2, [r1, #0xc98]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B7E8: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B768

	arm_func_start AlertBoxIsScrolling
AlertBoxIsScrolling: ; 0x0234B7EC
	stmdb sp!, {r3, lr}
	ldr r0, _0234B850 ; =MESSAGE_LOG_INFO
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0234B850 ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	add r1, r1, #0xc00
	ldrsh r2, [r1, #0x8c]
	ldrsh r1, [r1, #0x8e]
	cmp r2, r1
	bne _0234B848
	bl IsAlertBoxActive
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0234B848:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B850: .word MESSAGE_LOG_INFO
	arm_func_end AlertBoxIsScrolling

	arm_func_start ov29_0234B854
ov29_0234B854: ; 0x0234B854
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0234BA14 ; =MESSAGE_LOG_INFO
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #0xced]
	cmp r0, #0
	movne r0, #0
	strne r0, [r1, #0xc98]
	ldr r0, _0234BA14 ; =MESSAGE_LOG_INFO
	ldr r4, [r0, #4]
	ldr r0, [r4, #0xc98]
	cmp r0, #0
	beq _0234B9C8
	cmp r0, #1
	beq _0234B8A0
	cmp r0, #2
	beq _0234B908
	b _0234B9C8
_0234B8A0:
	bl ov10_022BFD20
	cmp r0, #0
	bne _0234B9C8
#ifndef JAPAN
	bl sub_02001808
	cmp r0, #0x3000
	blt _0234B9C8
#endif
	ldr r0, _0234BA14 ; =MESSAGE_LOG_INFO
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0234B900
	mov r0, #0
	bl CreateAlertBox
	ldr r1, _0234BA14 ; =MESSAGE_LOG_INFO
	mov r2, #0
	ldr r3, [r1, #4]
	strb r0, [r3, #0xcec]
	ldr r0, [r1, #4]
	str r2, [r0, #0xce8]
_0234B900:
	mov r0, #2
	str r0, [r4, #0xc98]
_0234B908:
	ldr r0, _0234BA14 ; =MESSAGE_LOG_INFO
	mvn r2, #1
	ldr r1, [r0, #4]
	add r0, r1, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r2
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	moveq r0, #1
	beq _0234B9BC
	ldr r3, _0234BA14 ; =MESSAGE_LOG_INFO
	mov r2, #0x140
	ldr r5, [r3, #4]
	add r3, r5, #0xc00
	ldrsh ip, [r3, #0x8e]
	ldrsh r3, [r3, #0x8c]
	smulbb lr, ip, r2
	cmp r3, ip
	bne _0234B96C
	bl AlertBoxIsScrolling
	cmp r0, #0
	bne _0234B9B8
	mov r0, #1
	b _0234B9BC
_0234B96C:
	add r2, r5, ip
	ldrb ip, [r2, #0xc80]
	add r1, r1, #0x9c
	add r3, r1, #0xc00
	add r2, r5, lr
	mov r1, #0x400
	str ip, [sp]
	bl AddMessageToAlertBox
	cmp r0, #0
	moveq r0, #0
	beq _0234B9BC
	add r0, r5, #0xc00
	ldrsh r1, [r0, #0x8e]
	add r1, r1, #1
	strh r1, [r0, #0x8e]
	ldrsh r1, [r0, #0x8e]
	cmp r1, #0xa
	moveq r1, #0
	streqh r1, [r0, #0x8e]
_0234B9B8:
	mov r0, #0
_0234B9BC:
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xc98]
_0234B9C8:
	ldrb r0, [r4, #0xc8a]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc00
	ldrsh r1, [r0, #0x90]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r1, r1, #1
	strh r1, [r0, #0x90]
	ldrsh r0, [r0, #0x90]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	str r0, [r4, #0xc98]
	bl ov29_0234B768
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234BA14: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B854

	arm_func_start WaitUntilAlertBoxTextIsLoaded
WaitUntilAlertBoxTextIsLoaded: ; 0x0234BA18
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0234BA50 ; =MESSAGE_LOG_INFO
	mov r5, r0
	ldr r4, [r1, #4]
_0234BA28:
	ldr r0, [r4, #0xc98]
	cmp r0, #0
	bne _0234BA40
	bl AlertBoxIsScrolling
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0234BA40:
	mov r0, r5
	bl AdvanceFrame
	b _0234BA28
_0234BA4C:
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234BA50: .word MESSAGE_LOG_INFO
	arm_func_end WaitUntilAlertBoxTextIsLoaded

	arm_func_start ov29_0234BA54
ov29_0234BA54: ; 0x0234BA54
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0234BAB8 ; =MESSAGE_LOG_INFO
	mov r5, r0
	ldr r6, [r1, #4]
	bl WaitUntilAlertBoxTextIsLoaded
	mov r4, #0
	add r6, r6, #0xc00
	ldr r7, _0234BABC ; =ov29_0237C694
	b _0234BAAC
_0234BA78:
	ldrsh r0, [r6, #0x90]
	cmp r0, #0xb4
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7]
	and r0, r0, #3
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7, #2]
	tst r0, #0xf0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl AdvanceFrame
	add r4, r4, #1
_0234BAAC:
	cmp r4, #0xf0
	blt _0234BA78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234BAB8: .word MESSAGE_LOG_INFO
_0234BABC: .word ov29_0237C694
	arm_func_end ov29_0234BA54

	arm_func_start InitPortraitDungeon
InitPortraitDungeon: ; 0x0234BAC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl InitPortraitParams
	strh r5, [r6]
	strb r4, [r6, #2]
	mov r2, #0
	strb r2, [r6, #3]
	mov r0, #2
	str r0, [r6, #4]
	mov r0, #9
	str r0, [r6, #8]
	strb r2, [r6, #0xc]
	strb r2, [r6, #0xd]
	mov r0, r6
	mov r1, #1
	strb r2, [r6, #0xe]
	bl AllowPortraitDefault
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end InitPortraitDungeon

	arm_func_start ov29_0234BB10
ov29_0234BB10: ; 0x0234BB10
	ldr ip, _0234BB1C ; =sub_02047FFC
	mov r0, #0
	bx ip
	.align 2, 0
_0234BB1C: .word sub_02047FFC
	arm_func_end ov29_0234BB10

	arm_func_start ov29_0234BB20
ov29_0234BB20: ; 0x0234BB20
	ldr ip, _0234BB28 ; =sub_0204804C
	bx ip
	.align 2, 0
_0234BB28: .word sub_0204804C
	arm_func_end ov29_0234BB20

	arm_func_start ov29_0234BB2C
ov29_0234BB2C: ; 0x0234BB2C
	ldr ip, _0234BB34 ; =sub_020480CC
	bx ip
	.align 2, 0
_0234BB34: .word sub_020480CC
	arm_func_end ov29_0234BB2C

	arm_func_start ov29_0234BB38
ov29_0234BB38: ; 0x0234BB38
	ldr ip, _0234BB40 ; =sub_02048134
	bx ip
	.align 2, 0
_0234BB40: .word sub_02048134
	arm_func_end ov29_0234BB38

	arm_func_start ov29_0234BB44
ov29_0234BB44: ; 0x0234BB44
	ldr ip, _0234BB4C ; =sub_02048150
	bx ip
	.align 2, 0
_0234BB4C: .word sub_02048150
	arm_func_end ov29_0234BB44

	arm_func_start ov29_0234BB50
ov29_0234BB50: ; 0x0234BB50
	ldr ip, _0234BB58 ; =sub_02048240
	bx ip
	.align 2, 0
_0234BB58: .word sub_02048240
	arm_func_end ov29_0234BB50

	arm_func_start OpenMessageLog
OpenMessageLog: ; 0x0234BB5C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r0, #6
	mov r1, #0
	bl ov29_022EA428
	cmp r4, #0
	bne _0234BB84
	mov r0, #0
	bl ov29_0233A248
_0234BB84:
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #0x62
	bl AdvanceFrame
	bl sub_0204833C
	mov r4, #0x62
_0234BB9C:
	mov r0, r4
	bl AdvanceFrame
	bl sub_02048360
	movs r5, r0
	beq _0234BB9C
	mov r0, #0x62
	bl AdvanceFrame
	cmp r6, #0
	beq _0234BBCC
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234BBCC:
	cmp r5, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end OpenMessageLog

	arm_func_start ov29_0234BBDC
ov29_0234BBDC: ; 0x0234BBDC
	ldr ip, _0234BBE4 ; =ov29_022E0B60
	bx ip
	.align 2, 0
_0234BBE4: .word ov29_022E0B60
	arm_func_end ov29_0234BBDC
