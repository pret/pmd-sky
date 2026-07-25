	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

	arm_func_start MATHi_CRC8InitTable
MATHi_CRC8InitTable: ; 0x02084FB8
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_02084FC4:
	mov r3, ip
	mov lr, r2
_02084FCC:
	tst r3, #0x80
	eorne r3, r1, r3, lsl #1
	add lr, lr, #1
	moveq r3, r3, lsl #1
	cmp lr, #8
	blo _02084FCC
	strb r3, [r0, ip]
	add ip, ip, #1
	cmp ip, #0x100
	blo _02084FC4
	ldmia sp!, {r3, pc}
	arm_func_end MATHi_CRC8InitTable

	arm_func_start MATHi_CRC8Update
MATHi_CRC8Update: ; 0x02084FF8
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrb lr, [r1]
	mov r4, #0
	bls _02085028
_0208500C:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldrb lr, [r0, ip]
	blo _0208500C
_02085028:
	strb lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end MATHi_CRC8Update

	arm_func_start MATHi_CRC16InitTable
MATHi_CRC16InitTable: ; 0x02085030
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r3, lr
_0208503C:
	mov ip, lr
	mov r2, r3
_02085044:
	tst ip, #1
	eorne ip, r1, ip, lsr #1
	add r2, r2, #1
	moveq ip, ip, lsr #1
	cmp r2, #8
	blo _02085044
	mov r2, lr, lsl #1
	add lr, lr, #1
	strh ip, [r0, r2]
	cmp lr, #0x100
	blo _0208503C
	ldmia sp!, {r3, pc}
	arm_func_end MATHi_CRC16InitTable

	arm_func_start MATHi_CRC16Update
MATHi_CRC16Update: ; 0x02085074
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrh lr, [r1]
	mov r4, #0
	bls _020850AC
_02085088:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	mov ip, ip, lsl #0x18
	mov ip, ip, lsr #0x17
	ldrh ip, [r0, ip]
	eor lr, ip, lr, lsr #8
	blo _02085088
_020850AC:
	strh lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end MATHi_CRC16Update

	arm_func_start MATHi_CRC32InitTable
MATHi_CRC32InitTable: ; 0x020850B4
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_020850C0:
	mov r3, ip
	mov lr, r2
_020850C8:
	tst r3, #1
	eorne r3, r1, r3, lsr #1
	add lr, lr, #1
	moveq r3, r3, lsr #1
	cmp lr, #8
	blo _020850C8
	str r3, [r0, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #0x100
	blo _020850C0
	ldmia sp!, {r3, pc}
	arm_func_end MATHi_CRC32InitTable

	arm_func_start MATHi_CRC32Update
MATHi_CRC32Update: ; 0x020850F4
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldr lr, [r1]
	mov r4, #0
	bls _02085128
_02085108:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldr ip, [r0, ip, lsl #2]
	eor lr, ip, lr, lsr #8
	blo _02085108
_02085128:
	str lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end MATHi_CRC32Update

	arm_func_start MATH_CalcCRC8
MATH_CalcCRC8: ; 0x02085130
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strb ip, [sp]
	bl MATHi_CRC8Update
	ldrb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end MATH_CalcCRC8

	arm_func_start MATH_CalcCRC16
MATH_CalcCRC16: ; 0x02085158
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strh ip, [sp]
	bl MATHi_CRC16Update
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end MATH_CalcCRC16

	arm_func_start MATH_CalcCRC32
MATH_CalcCRC32: ; 0x02085180
	stmdb sp!, {r3, lr}
	mov lr, r1
	mvn ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	str ip, [sp]
	bl MATHi_CRC32Update
	ldr r0, [sp]
	mvn r0, r0
	ldmia sp!, {r3, pc}
	arm_func_end MATH_CalcCRC32

	arm_func_start sub_020851AC
sub_020851AC: ; 0x020851AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	movs r4, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, sp, #0
	add r0, r4, #0x50
	mov r2, #8
	bl MI_CpuCopy8
	add r0, sp, #0
	mov r1, #8
	bl DC_StoreRange
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _02085230
	ldrh r1, [sp]
	ldr r0, _0208523C ; =0x00002348
	cmp r1, r0
	ldrneh r1, [sp]
	ldrne r0, _02085240 ; =0x0000BD8A
	cmpne r1, r0
	bne _02085230
	ldrh r0, [sp, #6]
	cmp r0, #4
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02085230:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0208523C: .word 0x00002348
_02085240: .word 0x0000BD8A
	arm_func_end sub_020851AC

