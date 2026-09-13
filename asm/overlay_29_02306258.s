	.include "asm/macros.inc"
	.include "overlay_29_02306258.inc"

	.text

	arm_func_start EndFrozenClassStatus
EndFrozenClassStatus: ; 0x02306258
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r4, #0
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	ldr r5, [r7, #0xb4]
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xc4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02306398
_023062A0: ; jump table
	b _02306398 ; case 0
	b _023062C4 ; case 1
	b _02306300 ; case 2
	b _02306338 ; case 3
	b _0230635C ; case 4
#ifdef JAPAN
	b _02306300 ; case 5
#else
	b _0230631C ; case 5
#endif
	b _02306380 ; case 6
	b _023062E4 ; case 7
	b _02306398 ; case 8
_023062C4:
	cmp r6, #0
	beq _023062DC
	ldr r2, _023063BC ; =0x00000C9F
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_023062DC:
	mov r4, #1
	b _02306398
_023062E4:
	cmp r6, #0
	beq _02306398
	ldr r2, _023063C0 ; =0x00000C99
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02306398
_02306300:
	cmp r6, #0
	beq _02306398
	ldr r2, _023063C4 ; =0x00000C9A
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02306398
#ifndef JAPAN
_0230631C:
	cmp r6, #0
	beq _02306398
	ldr r2, _023063C8 ; =0x00000C9B
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02306398
#endif
_02306338:
	cmp r6, #0
	beq _02306350
	ldr r2, _023063CC ; =0x00000C98
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02306350:
	ldr r0, [r5, #0xb4]
	bl FreeOtherWrappedMonsters
	b _02306398
_0230635C:
	cmp r6, #0
	beq _02306374
	ldr r2, _023063CC ; =0x00000C98
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02306374:
	ldr r0, [r5, #0xb4]
	bl FreeOtherWrappedMonsters
	b _02306398
_02306380:
	cmp r6, #0
	beq _02306398
	ldr r2, _023063D0 ; =0x00000CBB
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02306398:
	mov r1, #0
	mov r0, r7
	strb r1, [r5, #0xc4]
	bl UpdateStatusIconFlags
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	bl ov29_022E6798
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define END_FROZEN_CLASS_STATUS_OFFSET -0x2C0
#else
#define END_FROZEN_CLASS_STATUS_OFFSET 0
#endif
_023063BC: .word 0x00000C9F + END_FROZEN_CLASS_STATUS_OFFSET
_023063C0: .word 0x00000C99 + END_FROZEN_CLASS_STATUS_OFFSET
_023063C4: .word 0x00000C9A + END_FROZEN_CLASS_STATUS_OFFSET
#ifndef JAPAN
_023063C8: .word 0x00000C9B
#endif
_023063CC: .word 0x00000C98 + END_FROZEN_CLASS_STATUS_OFFSET
_023063D0: .word 0x00000CBB + END_FROZEN_CLASS_STATUS_OFFSET
	arm_func_end EndFrozenClassStatus

	arm_func_start EndCringeClassStatus
EndCringeClassStatus: ; 0x023063D4
#ifdef JAPAN
#define END_CRINGE_CLASS_STATUS_OFFSET -0x2C0
#else
#define END_CRINGE_CLASS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _023064C0
_02306414: ; jump table
	b _023064C0 ; case 0
	b _023064B0 ; case 1
	b _02306438 ; case 2
	b _02306474 ; case 3
	b _0230644C ; case 4
	b _02306460 ; case 5
	b _0230649C ; case 6
	b _02306488 ; case 7
	b _023064C0 ; case 8
_02306438:
	ldr r2, _023064DC ; =0x00000C97
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_0230644C:
	ldr r2, _023064E0 ; =0x00000CA4
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_02306460:
	ldr r2, _023064E4 ; =0x00000CA7
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_02306474:
	ldr r2, _023064E8 ; =0x00000CBD
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_02306488:
	ldr r2, _023064EC ; =0x00000CB7
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_0230649C:
	mov r0, r6
	mov r1, r5
	mov r2, #0xcb0 + END_CRINGE_CLASS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023064C0
_023064B0:
	ldr r2, _023064F0 ; =0x00000CBC
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023064C0:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xd0]
	bl UpdateStatusIconFlags
	mov r0, r5
	bl CalcSpeedStageWrapper
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023064DC: .word 0x00000C97 + END_CRINGE_CLASS_STATUS_OFFSET
_023064E0: .word 0x00000CA4 + END_CRINGE_CLASS_STATUS_OFFSET
_023064E4: .word 0x00000CA7 + END_CRINGE_CLASS_STATUS_OFFSET
_023064E8: .word 0x00000CBD + END_CRINGE_CLASS_STATUS_OFFSET
_023064EC: .word 0x00000CB7 + END_CRINGE_CLASS_STATUS_OFFSET
_023064F0: .word 0x00000CBC + END_CRINGE_CLASS_STATUS_OFFSET
	arm_func_end EndCringeClassStatus

	arm_func_start EndReflectClassStatus
EndReflectClassStatus: ; 0x023064F4
#ifdef JAPAN
#define END_REFLECT_CLASS_STATUS_OFFSET -0x2C0
#else
#define END_REFLECT_CLASS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0x12
	addls pc, pc, r0, lsl #2
	b _02306688
_02306530: ; jump table
	b _02306688 ; case 0
	b _0230657C ; case 1
	b _0230658C ; case 2
	b _0230659C ; case 3
	b _023065AC ; case 4
	b _023065BC ; case 5
	b _023065CC ; case 6
	b _023065DC ; case 7
	b _023065EC ; case 8
	b _023065FC ; case 9
	b _023065AC ; case 10
	b _0230660C ; case 11
	b _0230661C ; case 12
	b _0230663C ; case 13
	b _0230664C ; case 14
	b _0230665C ; case 15
	b _0230666C ; case 16
	b _0230667C ; case 17
	b _02306688 ; case 18
_0230657C:
	ldr r1, _0230669C ; =0x00000C87
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230658C:
	ldr r1, _023066A0 ; =0x00000C8A
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230659C:
	ldr r1, _023066A4 ; =0x00000C88
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065AC:
	ldr r1, _023066A8 ; =0x00000C89
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065BC:
	ldr r1, _023066AC ; =0x00000C8B
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065CC:
	ldr r1, _023066B0 ; =0x00000C8C
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065DC:
	ldr r1, _023066B4 ; =0x00000CA6
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065EC:
	ldr r1, _023066B8 ; =0x00000CAE
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_023065FC:
	ldr r1, _023066BC ; =0x00000CB1
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230660C:
	ldr r1, _023066C0 ; =0x00000CB2
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230661C:
	ldr r1, _023066C4 ; =0x00000CB3
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	bl ov29_022E65F4
	mov r0, r5
	bl ResetTypeChanges
	b _02306688
_0230663C:
	ldr r1, _023066C8 ; =0x00000CB4
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230664C:
	ldr r1, _023066CC ; =0x00000CB5
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230665C:
	ldr r1, _023066D0 ; =0x00000CBE
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230666C:
	mov r0, r5
	mov r1, #0xcc0 + END_REFLECT_CLASS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUser
	b _02306688
_0230667C:
	ldr r1, _023066D4 ; =0x00000CC1
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02306688:
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xd5]
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230669C: .word 0x00000C87 + END_REFLECT_CLASS_STATUS_OFFSET
_023066A0: .word 0x00000C8A + END_REFLECT_CLASS_STATUS_OFFSET
_023066A4: .word 0x00000C88 + END_REFLECT_CLASS_STATUS_OFFSET
_023066A8: .word 0x00000C89 + END_REFLECT_CLASS_STATUS_OFFSET
_023066AC: .word 0x00000C8B + END_REFLECT_CLASS_STATUS_OFFSET
_023066B0: .word 0x00000C8C + END_REFLECT_CLASS_STATUS_OFFSET
_023066B4: .word 0x00000CA6 + END_REFLECT_CLASS_STATUS_OFFSET
_023066B8: .word 0x00000CAE + END_REFLECT_CLASS_STATUS_OFFSET
_023066BC: .word 0x00000CB1 + END_REFLECT_CLASS_STATUS_OFFSET
_023066C0: .word 0x00000CB2 + END_REFLECT_CLASS_STATUS_OFFSET
_023066C4: .word 0x00000CB3 + END_REFLECT_CLASS_STATUS_OFFSET
_023066C8: .word 0x00000CB4 + END_REFLECT_CLASS_STATUS_OFFSET
_023066CC: .word 0x00000CB5 + END_REFLECT_CLASS_STATUS_OFFSET
_023066D0: .word 0x00000CBE + END_REFLECT_CLASS_STATUS_OFFSET
_023066D4: .word 0x00000CC1 + END_REFLECT_CLASS_STATUS_OFFSET
	arm_func_end EndReflectClassStatus

	arm_func_start TryRemoveSnatchedMonsterFromDungeonStruct
TryRemoveSnatchedMonsterFromDungeonStruct: ; 0x023066D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r0, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	ldr r1, _02306724 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x19000
#ifdef JAPAN
	str r2, [r0, #0x860]
	ldr r0, [r1]
	add r0, r0, #0x19000
	str r2, [r0, #0x868]
#else
	str r2, [r0, #0x904]
	ldr r0, [r1]
	add r0, r0, #0x19000
	str r2, [r0, #0x90c]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_02306724: .word DUNGEON_PTR
	arm_func_end TryRemoveSnatchedMonsterFromDungeonStruct
