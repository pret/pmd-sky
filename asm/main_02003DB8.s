	.include "asm/macros.inc"
	.include "main_02003DB8.inc"

	.text

	arm_func_start HaltProcessDisp
HaltProcessDisp: ; 0x02003DB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_02002580
	ldr r1, _02003EBC ; =_020AF078
	cmp r0, r1
	moveq r1, #1
	movne r1, #0
	ldr r0, _02003EC0 ; =_020AEF7C
	and r2, r1, #0xff
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003E28
	mov r1, #1
	strb r1, [r0, #0xf]
	cmp r2, #0
	beq _02003E24
	mov r6, #0
	ldr r5, _02003EC4 ; =_020AF050
	b _02003E14
_02003E04:
	mov r0, r6
	bl OS_SleepThread
	mov r0, r5
	bl sub_020029B8
_02003E14:
	bl sub_020081F0
	cmp r0, #0
	beq _02003E04
	b _02003E28
_02003E24:
	bl sub_020081C8
_02003E28:
	mov r0, #1
	bl sub_02002824
	bl sub_020184A8
	ldr r0, _02003EC8 ; =_02092540
	mov r1, r4
	bl Debug_Print0
	cmp r4, #2
	bne _02003E9C
	mov r0, #1
	bl sub_0200B76C
	mov r7, #0
	mov r6, #1
	ldr r5, _02003EC0 ; =_020AEF7C
	b _02003E7C
_02003E60:
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _02003E84
	mov r0, r6
	mov r1, r6
	bl OS_WaitIrq
	add r7, r7, #1
_02003E7C:
	cmp r7, #0x12c
	blt _02003E60
_02003E84:
	ldr r0, _02003EC0 ; =_020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _02003E9C
	mov r0, #0
	bl sub_02002448
_02003E9C:
	cmp r4, #1
	beq _02003EAC
	mov r0, #0
	bl sub_0200B76C
_02003EAC:
	bl Card_TerminateForPulledOut
	mov r0, #0
	bl sub_020025F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02003EBC: .word _020AF078
_02003EC0: .word _020AEF7C
_02003EC4: .word _020AF050
_02003EC8: .word _02092540
	arm_func_end HaltProcessDisp

	arm_func_start sub_02003ECC
sub_02003ECC: ; 0x02003ECC
	bx lr
	arm_func_end sub_02003ECC

