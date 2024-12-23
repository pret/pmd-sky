	.include "asm/macros.inc"
	.include "main_0207B854.inc"

	.text

	arm_func_start sub_0207B854
sub_0207B854: ; 0x0207B854
	subs r0, r0, #4
	bhs sub_0207B854
	bx lr
	arm_func_end sub_0207B854

	arm_func_start sub_0207B860
sub_0207B860: ; 0x0207B860
	stmdb sp!, {r3, lr}
	mov r0, #1
	blx SVC_WaitByLoop
	mov r0, #1
	mov r1, r0
	bl sub_02078900
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207B860

	arm_func_start sub_0207B87C
sub_0207B87C: ; 0x0207B87C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0207B8C8 ; =_022B99D0
	ldrh r1, [r0, #2]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0, #2]
	bl sub_0207D9A4
	mov r5, #0xc
	mov r4, #1
_0207B8A4:
	mov r0, r5
	mov r1, r4
	bl sub_0207DAFC
	cmp r0, #0
	beq _0207B8A4
	ldr r1, _0207B8CC ; =sub_0207B8D0
	mov r0, #0xc
	bl sub_0207DAB0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B8C8: .word _022B99D0
_0207B8CC: .word sub_0207B8D0
	arm_func_end sub_0207B87C

	arm_func_start sub_0207B8D0
sub_0207B8D0: ; 0x0207B8D0
	stmdb sp!, {r3, lr}
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	cmp r0, #0x10
	bne _0207B8F8
	ldr r0, _0207B900 ; =_022B99D0
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, pc}
_0207B8F8:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B900: .word _022B99D0
	arm_func_end sub_0207B8D0

	arm_func_start sub_0207B904
sub_0207B904: ; 0x0207B904
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0, lsl #8
	mov r5, #0xc
	mov r4, #0
_0207B914:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_0207DB20
	cmp r0, #0
	bne _0207B914
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207B904

	arm_func_start sub_0207B930
sub_0207B930: ; 0x0207B930
	stmdb sp!, {r4, lr}
	ldr r1, _0207B9C0 ; =0x027FFC40
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _0207B958
	bl WaitForever2
_0207B958:
	bl OS_GetLockID
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02083434
	ldr r0, _0207B9C4 ; =0x00000000
	bl sub_0207C164
	ldr r0, _0207B9C8 ; =0x00000001
	bl sub_0207C164
	ldr r0, _0207B9CC ; =0x00000002
	bl sub_0207C164
	ldr r0, _0207B9D0 ; =0x00000003
	bl sub_0207C164
	ldr r0, _0207B9D4 ; =0x00040000
	bl sub_02078C3C
	ldr r0, _0207B9D8 ; =0xFFFBFFFF
	bl sub_02078CC8
	ldr r1, _0207B9DC ; =0x027FFC20
	ldr r0, _0207B9E0 ; =0x00000010
	str r4, [r1]
	bl sub_0207B904
	ldr r0, _0207B9E4 ; =0x027E3F80
	ldr r1, _0207B9E8 ; =0x00000800
	sub r0, r0, r1
	mov sp, r0
	bl sub_01FF97CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B9C0: .word 0x027FFC40
_0207B9C4: .word 0x00000000
_0207B9C8: .word 0x00000001
_0207B9CC: .word 0x00000002
_0207B9D0: .word 0x00000003
_0207B9D4: .word 0x00040000
_0207B9D8: .word 0xFFFBFFFF
_0207B9DC: .word 0x027FFC20
_0207B9E0: .word 0x00000010
_0207B9E4: .word 0x027E3F80
_0207B9E8: .word 0x00000800
	arm_func_end sub_0207B930

	arm_func_start sub_0207B9EC
sub_0207B9EC: ; 0x0207B9EC
	ldr ip, _0207BA00 ; =MemcpyFast
	mov r1, r0
	ldr r0, _0207BA04 ; =0x027FFCF4
	mov r2, #6
	bx ip
	.align 2, 0
_0207BA00: .word MemcpyFast
_0207BA04: .word 0x027FFCF4
	arm_func_end sub_0207B9EC

	arm_func_start GetDsFirmwareUserSettings
GetDsFirmwareUserSettings: ; 0x0207BA08
	stmdb sp!, {r4, lr}
	ldr ip, _0207BA88 ; =0x027FFC80
	mov r4, r0
	ldrh r2, [ip, #0x64]
	add r0, ip, #6
	add r1, r4, #4
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1d
	strb r2, [r4]
	ldrb r3, [ip, #2]
	mov r2, #0x14
	mov r3, r3, lsl #0x1c
	mov r3, r3, lsr #0x1c
	strb r3, [r4, #1]
	ldrb r3, [ip, #3]
	strb r3, [r4, #2]
	ldrb r3, [ip, #4]
	strb r3, [r4, #3]
	ldrb r3, [ip, #0x1a]
	strh r3, [r4, #0x1a]
	ldrb r3, [ip, #0x50]
	strh r3, [r4, #0x52]
	bl ArrayCopy16
	ldr r0, _0207BA88 ; =0x027FFC80
	add r1, r4, #0x1c
	add r0, r0, #0x1c
	mov r2, #0x34
	bl ArrayCopy16
	mov r0, #0
	strh r0, [r4, #0x18]
	strh r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207BA88: .word 0x027FFC80
	arm_func_end GetDsFirmwareUserSettings

	arm_func_start CountLeadingZeros
CountLeadingZeros: ; 0x0207BA8C
	clz r0, r0
	bx lr
	arm_func_end CountLeadingZeros

	arm_func_start sub_0207BA94
sub_0207BA94: ; 0x0207BA94
	ldr r0, _0207BAC0 ; =_022B99D4
	mov r3, #0
	str r3, [r0]
	ldr r0, _0207BAC4 ; =_022B99D8
	mov r2, r3
_0207BAA8:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #9
	blt _0207BAA8
	bx lr
	.align 2, 0
_0207BAC0: .word _022B99D4
_0207BAC4: .word _022B99D8
	arm_func_end sub_0207BA94

	arm_func_start sub_0207BAC8
sub_0207BAC8: ; 0x0207BAC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov sl, r1
	bl EnableIrqFlag
	ldr r4, _0207BB44 ; =_022B99D4
	ldr r1, _0207BB48 ; =0x000001FF
	ldr r2, [r4]
	mov sb, r0
	and r0, r5, r2
	ldr r6, _0207BB4C ; =_022B99D8
	and r8, r0, r1
	mov r7, #1
	mov r5, #0
_0207BAFC:
	mov r0, r8
	bl CountLeadingZeros
	rsbs r2, r0, #0x1f
	bmi _0207BB38
	mov r1, r2, lsl #1
	ldrh r0, [r6, r1]
	mvn r2, r7, lsl r2
	cmp sl, r0
	and r8, r8, r2
	bne _0207BAFC
	ldr r0, [r4]
	strh r5, [r6, r1]
	and r0, r0, r2
	str r0, [r4]
	b _0207BAFC
_0207BB38:
	mov r0, sb
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0207BB44: .word _022B99D4
_0207BB48: .word 0x000001FF
_0207BB4C: .word _022B99D8
	arm_func_end sub_0207BAC8

	arm_func_start sub_0207BB50
sub_0207BB50: ; 0x0207BB50
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0207BC10 ; =0x04000006
	mov r5, r0
	ldrh r6, [r1]
	ldr r4, _0207BC14 ; =0x027FFC00
	bl GetTimer0Control
	orr r0, r0, r6, lsl #16
	str r0, [r5]
	ldr r1, _0207BC18 ; =_022B99A8
	ldrh ip, [r4, #0xf8]
	ldr r3, [r1]
	ldr r2, [r1, #4]
	mov r0, r4
	eor r2, r3, ip, lsl #16
	str r2, [r5, #4]
	ldr r2, [r1]
	ldr r3, [r0, #0x3c]
	ldr r2, [r1, #4]
	ldr r1, [r4, #0xf4]
	ldr ip, _0207BC1C ; =0x04000600
	eor r1, r2, r1
	eor r2, r3, r1
	str r2, [r5, #8]
	ldr r1, [ip]
	eor r1, r2, r1
	str r1, [r5, #8]
	ldr r2, [r0, #0x1e8]
	add r1, r0, #0x300
	str r2, [r5, #0xc]
	ldr r3, [r0, #0x1ec]
	sub r2, ip, #0x4d0
	str r3, [r5, #0x10]
	ldr r3, [r0, #0x390]
	ldrh r4, [r1, #0x94]
	add r0, r0, #0x3a8
	eor r3, r3, r4, lsl #16
	str r3, [r5, #0x14]
	ldrh r4, [r1, #0xaa]
	ldrh r3, [r1, #0xac]
	orr r3, r3, r4, lsl #16
	str r3, [r5, #0x18]
	ldrh r2, [r2]
	ldrh r0, [r0]
	ldrh r1, [r1, #0x98]
	orr r0, r2, r0
	orr r0, r0, r1, lsl #16
	str r0, [r5, #0x1c]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207BC10: .word 0x04000006
_0207BC14: .word 0x027FFC00
_0207BC18: .word _022B99A8
_0207BC1C: .word 0x04000600
	arm_func_end sub_0207BB50
