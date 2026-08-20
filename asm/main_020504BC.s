	.include "asm/macros.inc"
	.include "main_020504BC.inc"

	.text

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
	bl Copy16BitsTo
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
	ldr r1, _02050970 ; =CONVERSION2_TYPE_TABLE
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02050970: .word CONVERSION2_TYPE_TABLE
	arm_func_end GetConversion2ConvertToType

	arm_func_start InitBitstreamForWrite
InitBitstreamForWrite: ; 0x02050974
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end InitBitstreamForWrite

	arm_func_start InitBitstreamForRead
InitBitstreamForRead: ; 0x02050990
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
	arm_func_end InitBitstreamForRead

	arm_func_start BitstreamDebug
BitstreamDebug: ; 0x020509BC
	bx lr
	arm_func_end BitstreamDebug

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
	bl GetResolvedPerformanceProgressFlag
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
	bl GetResolvedPerformanceProgressFlag
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
	bl GetResolvedPerformanceProgressFlag
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
	bl GetResolvedPerformanceProgressFlag
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
	bl InitBitstreamForRead
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
	bl GetResolvedPerformanceProgressFlag
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
	bl BitstreamDebug
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
	bl InitBitstreamForWrite
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
	bl BitstreamDebug
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
