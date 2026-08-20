	.include "asm/macros.inc"
	.include "overlay_29_022ECDE4.inc"

	.text

	arm_func_start CreateMonsterSummaryFromEntityOuter
CreateMonsterSummaryFromEntityOuter: ; 0x022ECDE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022ECF34 ; =DUNGEON_PTR
	mov r6, r1
	ldr r1, [r4]
	mov sb, r0
#ifdef JAPAN
	add r1, r1, #0x168
#else
	add r1, r1, #0x20c
#endif
	mov r0, r6
	mov r8, r2
	mov r7, r3
	add r4, r1, #0x2c800
	mov r5, #0
	bl EntityIsValid__022ECDC0
	cmp r0, #0
	beq _022ECE28
	ldr r0, [r6]
	cmp r0, #1
	ldreq r5, [r6, #0xb4]
_022ECE28:
	cmp r5, #0
	ldr r6, [r8, #0xb4]
	beq _022ECE44
	mov r0, r4
	mov r1, r5
	bl GetMonsterName
	b _022ECE6C
_022ECE44:
	ldr r1, _022ECF38 ; =ov29_0237C974
	ldrb r0, [r1]
	cmp r0, #0
	beq _022ECE60
	mov r0, r4
	bl strcpy
	b _022ECE6C
_022ECE60:
	ldr r1, _022ECF3C ; =0x00000A41
	mov r0, r4
	bl GetStringFromFileVeneer
_022ECE6C:
	mov r1, r6
	add r0, r4, #0x1e
	bl GetMonsterName
	cmp r7, #0
	moveq r0, #0
	streqb r0, [r4, #0x3c]
	beq _022ECE94
	mov r1, r7
	add r0, r4, #0x3c
	bl strcpy
_022ECE94:
	mov r1, r8
	add r0, r4, #0x70
	bl CreateMonsterSummaryFromMonster
	strh sb, [r4, #0x5a]
	ldrh r1, [r6, #0x62]
	ldr r0, _022ECF40 ; =0x000003E7
	ldr r3, _022ECF34 ; =DUNGEON_PTR
	strh r1, [r4, #0x5e]
	ldrh r1, [r6, #0x64]
	strh r1, [r4, #0x60]
	ldrh r1, [r6, #0x66]
	strh r1, [r4, #0x62]
	ldr r1, [r6, #0x20]
	str r1, [r4, #0x64]
	ldrb r1, [r6, #0xa]
	strb r1, [r4, #0x6e]
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x68]
	ldrb r1, [r6, #0x1a]
	ldr r0, _022ECF38 ; =ov29_0237C974
	mov r2, #0x28
	strb r1, [r4, #0x6a]
	ldrb r5, [r6, #0x1b]
	mov r1, #0
	strb r5, [r4, #0x6b]
	ldrb r5, [r6, #0x1c]
	strb r5, [r4, #0x6c]
	ldrb r5, [r6, #0x1d]
	strb r5, [r4, #0x6d]
	ldr r5, [r3]
	ldrb r3, [r5, #0x748]
	strb r3, [r4, #0x5c]
	ldrb r3, [r5, #0x749]
	strb r3, [r4, #0x5d]
	bl memset
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022ECF34: .word DUNGEON_PTR
_022ECF38: .word ov29_0237C974
#ifdef JAPAN
_022ECF3C: .word 0x00000889
#else
_022ECF3C: .word 0x00000A41
#endif
_022ECF40: .word 0x000003E7
	arm_func_end CreateMonsterSummaryFromEntityOuter
