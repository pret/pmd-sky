	.include "asm/macros.inc"
	.include "main_020038D8.inc"

	.text

	arm_func_start sub_020038D8
sub_020038D8: ; 0x020038D8
	ldr r0, _020038E4 ; =_020AEF7C
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_020038E4: .word _020AEF7C
	arm_func_end sub_020038D8

	arm_func_start sub_020038E8
sub_020038E8: ; 0x020038E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _02003988 ; =_020AEF7C
	ldr r4, [r0, #0x18]
	bl sub_020026B8
	cmp r4, #0
	beq _02003944
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0]
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _02003938
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	bl OS_WakeupThreadDirect
_02003938:
	ldr r0, _0200398C ; =_020AF000
	bl sub_02002A44
	b _02003950
_02003944:
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #7]
_02003950:
	ldr r1, _02003988 ; =_020AEF7C
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	add r2, r2, #1
	str r2, [r1, #0x2c]
	bl sub_0200265C
	ldr r0, _02003988 ; =_020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _02003980
	mov r0, #0
	bl sub_020025F8
_02003980:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003988: .word _020AEF7C
_0200398C: .word _020AF000
	arm_func_end sub_020038E8

	arm_func_start sub_02003990
sub_02003990: ; 0x02003990
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020039DC ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _020039D4
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _020039DC ; =_020AEF7C
	mov r2, #0
	strb r2, [r1, #3]
	ldr r0, _020039E0 ; =_020AF000
	strb r2, [r1, #6]
	bl sub_020029A0
	add r0, sp, #0
	bl sub_0200265C
_020039D4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020039DC: .word _020AEF7C
_020039E0: .word _020AF000
	arm_func_end sub_02003990

	arm_func_start sub_020039E4
sub_020039E4: ; 0x020039E4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02003A34 ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02003A2C
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003A34 ; =_020AEF7C
	mov r2, #0
	ldr r0, _02003A38 ; =_020AF028
	strb r2, [r1, #6]
	bl sub_020029A0
	ldr r0, _02003A3C ; =_020AF000
	bl sub_02002A44
	add r0, sp, #0
	bl sub_0200265C
_02003A2C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003A34: .word _020AEF7C
_02003A38: .word _020AF028
_02003A3C: .word _020AF000
	arm_func_end sub_020039E4

	arm_func_start sub_02003A40
sub_02003A40: ; 0x02003A40
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003AAC ; =_020AEF7C
	mov r2, #1
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	mov r0, #0
	beq _02003A7C
	strb r0, [r1, #0xa]
	strb r2, [r1, #7]
	bl OS_SleepThread
	b _02003A90
_02003A7C:
	strb r2, [r1, #9]
	bl OS_SleepThread
	ldr r0, _02003AAC ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #9]
_02003A90:
	ldr r1, _02003AAC ; =_020AEF7C
	add r0, sp, #0
	ldrb r4, [r1]
	bl sub_0200265C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003AAC: .word _020AEF7C
	arm_func_end sub_02003A40

	arm_func_start sub_02003AB0
sub_02003AB0: ; 0x02003AB0
	stmdb sp!, {r3, lr}
	ldr r0, _02003AC8 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003ACC ; =_020AEF7C
	ldr r0, [r0, #0x28]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003AC8: .word _020AF050
_02003ACC: .word _020AEF7C
	arm_func_end sub_02003AB0

	arm_func_start sub_02003AD0
sub_02003AD0: ; 0x02003AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02003B50 ; =_020AEF7C
	ldrb r0, [r0, #5]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl sub_02002580
	bl sub_02002860
	cmp r0, #0
	beq _02003B10
	ldr r0, _02003B54 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003B50 ; =_020AEF7C
	ldr r0, [r0, #0x28]
_02003B10:
	ldr r0, _02003B50 ; =_020AEF7C
	mov r2, #1
	strb r2, [r0, #5]
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003B30
	strb r2, [r0, #0xf]
	bl sub_020081C8
_02003B30:
	bl DisableAllInterrupts
	ldr r0, _02003B58 ; =_0229B220
	bl sub_0207B584
	mov r0, #1
	mov r1, #0
	bl OS_SetIrqFunction
	bl EnableAllInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003B50: .word _020AEF7C
_02003B54: .word _020AF050
_02003B58: .word _0229B220
	arm_func_end sub_02003AD0

	arm_func_start sub_02003B5C
sub_02003B5C: ; 0x02003B5C
	ldr r0, _02003B8C ; =_020AEF7C
	mov r1, #1
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _02003B84
	ldr r0, _02003B90 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	moveq r1, #0
_02003B84:
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_02003B8C: .word _020AEF7C
_02003B90: .word 0x027FFFA8
	arm_func_end sub_02003B5C

	arm_func_start sub_02003B94
sub_02003B94: ; 0x02003B94
	ldr r0, _02003BA8 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BA8: .word _020AEF7C
	arm_func_end sub_02003B94

	arm_func_start sub_02003BAC
sub_02003BAC: ; 0x02003BAC
	ldr r0, _02003BC4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BC4: .word _020AEF7C
	arm_func_end sub_02003BAC

	arm_func_start sub_02003BC8
sub_02003BC8: ; 0x02003BC8
	stmdb sp!, {r3, lr}
	bl SoundResume
	ldr r0, _02003BE8 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003BE8: .word _020AEF7C
	arm_func_end sub_02003BC8

	arm_func_start sub_02003BEC
sub_02003BEC: ; 0x02003BEC
	ldr r0, _02003BF8 ; =_020AEF7C
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_02003BF8: .word _020AEF7C
	arm_func_end sub_02003BEC

	arm_func_start sub_02003BFC
sub_02003BFC: ; 0x02003BFC
	stmdb sp!, {r3, lr}
	ldr r0, _02003CB4 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003CAC
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003C5C
	bl sub_02003B5C
	cmp r0, #0
	bne _02003C54
	ldr r0, _02003CB8 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003CB4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
_02003C54:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003C5C:
	bl sub_02003B5C
	cmp r0, #0
	beq _02003CAC
	ldr r0, _02003CC0 ; =_020924F8
	bl Debug_Print0
	bl sub_02017DB4
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1, #2]
	bl sub_02017FF0
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1]
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldr r1, _02003CB4 ; =_020AEF7C
	mov r0, #1
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
_02003CAC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003CB4: .word _020AEF7C
_02003CB8: .word _020924E8
_02003CBC: .word _0229B21C
_02003CC0: .word _020924F8
	arm_func_end sub_02003BFC

	arm_func_start SoundResume
SoundResume: ; 0x02003CC4
	stmdb sp!, {r3, lr}
	ldr r0, _02003D20 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003D18
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003D18
	ldr r0, _02003D24 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003D20 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003D18:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003D20: .word _020AEF7C
_02003D24: .word _020924E8
_02003D28: .word _0229B21C
	arm_func_end SoundResume
