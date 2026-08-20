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
