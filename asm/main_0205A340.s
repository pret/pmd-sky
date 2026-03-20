	.include "asm/macros.inc"
	.include "main_0205A340.inc"

	.text

	arm_func_start sub_0205A340
sub_0205A340: ; 0x0205A340
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x90
	add ip, sp, #0x4c
	mov r6, r0
	mov lr, r1
	mov r5, r2
	mov r4, #4
_0205A35C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0205A35C
	ldr r1, [lr]
	add r0, sp, #0x40
	str r1, [ip]
	ldrb r2, [sp, #0x4d]
	mov r1, r5
	ldrsh r4, [sp, #0x50]
	bl GetLvlUpEntry
	ldrb r0, [sp, #0x52]
	ldr r1, [sp, #0x40]
	strh r5, [sp, #0x50]
	cmp r0, #0
	ldreqb r0, [sp, #0x4d]
	str r1, [sp, #0x5c]
	streqb r0, [sp, #0x52]
	beq _0205A3B8
	ldrb r0, [sp, #0x53]
	cmp r0, #0
	ldreqb r0, [sp, #0x4d]
	streqb r0, [sp, #0x53]
_0205A3B8:
	mov r0, r4
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	add r0, sp, #0
	add r1, sp, #0x86
	mov r2, #0xa
	bl StrncmpSimple
	cmp r0, #0
	bne _0205A3FC
	mov r0, r5
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x86
	mov r2, #0xa
	bl StrncpyName
_0205A3FC:
	ldrsh r0, [r6]
	mvn r1, #0
	cmp r0, r1
	beq _0205A418
	add r1, sp, #0x4c
	bl sub_02055D7C
	b _0205A424
_0205A418:
	add r0, sp, #0x4c
	bl sub_02055CCC
	strh r0, [r6]
_0205A424:
	ldrsh r0, [r6]
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0205A340
