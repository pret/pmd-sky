	.include "asm/macros.inc"
	.include "overlay_00_0230D398.inc"

	.text

	arm_func_start Gti2BufferWriteByte
Gti2BufferWriteByte: ; 0x0230D398
	ldr r3, [r0, #8]
	add r2, r3, #1
	str r2, [r0, #8]
	ldr r0, [r0]
	strb r1, [r0, r3]
	bx lr
	arm_func_end Gti2BufferWriteByte

	arm_func_start Gti2BufferWriteUShort
Gti2BufferWriteUShort: ; 0x0230D3B0
	ldr ip, [r0, #8]
	mov r3, r1, asr #8
	add r2, ip, #1
	str r2, [r0, #8]
	ldr r2, [r0]
	strb r3, [r2, ip]
	ldr r3, [r0, #8]
	add r2, r3, #1
	str r2, [r0, #8]
	ldr r0, [r0]
	strb r1, [r0, r3]
	bx lr
	arm_func_end Gti2BufferWriteUShort

	arm_func_start Gti2BufferWriteData
Gti2BufferWriteData: ; 0x0230D3E0
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r1
	mov r5, r2
	mov r4, r0
	cmpne r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mvn r0, #0
	cmp r5, r0
	bne _0230D410
	mov r0, r6
	bl strlen
	mov r5, r0
_0230D410:
	ldr r3, [r4]
	ldr r0, [r4, #8]
	mov r1, r6
	mov r2, r5
	add r0, r3, r0
	bl memcpy
	ldr r0, [r4, #8]
	add r0, r0, r5
	str r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Gti2BufferWriteData

	arm_func_start Gti2BufferShorten
Gti2BufferShorten: ; 0x0230D438
	stmdb sp!, {r3, r4, r5, lr}
	mvn r3, #0
	mov r5, r0
	cmp r1, r3
	mov r4, r2
	ldreq r0, [r5, #8]
	ldr r2, [r5, #8]
	subeq r1, r0, r4
	ldr r0, [r5]
	sub r2, r2, r1
	add r0, r0, r1
	add r1, r0, r4
	sub r2, r2, r4
	bl memmove
	ldr r0, [r5, #8]
	sub r0, r0, r4
	str r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Gti2BufferShorten

	arm_func_start Gti2SocketErrorCallback
Gti2SocketErrorCallback: ; 0x0230D480
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0x24]
	cmp r1, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0x1c]
	add r1, r1, #1
	str r1, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	blx r1
	ldr r0, [r4, #0x1c]
	sub r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0230D4E8
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0230D4E8
	mov r0, r4
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D4E8:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Gti2SocketErrorCallback

	arm_func_start Gti2ConnectAttemptCallback
Gti2ConnectAttemptCallback: ; 0x0230D4F0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	movs r5, r0
	cmpne r4, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [r5, #0x20]
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, [r5, #0x1c]
	ldr r0, [sp, #0x20]
	add r1, r1, #1
	cmp r0, #0
	ldrne r0, [sp, #0x1c]
	str r1, [r5, #0x1c]
	ldr ip, [r4, #0x24]
	cmpne r0, #0
	moveq r0, #0
	streq r0, [sp, #0x1c]
	streq r0, [sp, #0x20]
	add ip, ip, #1
	ldr r0, [sp, #0x18]
	str ip, [r4, #0x24]
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr ip, [r5, #0x20]
	mov r0, r5
	mov r1, r4
	blx ip
	ldr r0, [r5, #0x1c]
	sub r0, r0, #1
	str r0, [r5, #0x1c]
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0230D5C4
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	bne _0230D5C4
	mov r0, r5
	bl Gti2CloseSocket
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0230D5C4:
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end Gti2ConnectAttemptCallback

	arm_func_start Gti2ConnectedCallback
Gti2ConnectedCallback: ; 0x0230D5D0
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	str r1, [r4, #0x18]
	ldr r0, [r4, #0x28]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr ip, [r4, #0x24]
	cmp r3, #0
	add ip, ip, #1
	str ip, [r4, #0x24]
	ldr lr, [r4, #8]
	cmpne r2, #0
	ldr ip, [lr, #0x1c]
	moveq r2, #0
	add ip, ip, #1
	str ip, [lr, #0x1c]
	ldr ip, [r4, #0x28]
	moveq r3, r2
	mov r0, r4
	blx ip
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r4, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D670
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D670
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D670:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Gti2ConnectedCallback

	arm_func_start Gti2ReceivedCallback
Gti2ReceivedCallback: ; 0x0230D678
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr ip, [r4, #0x24]
	cmp r2, #0
	add ip, ip, #1
	str ip, [r4, #0x24]
	ldr lr, [r4, #8]
	cmpne r1, #0
	ldr ip, [lr, #0x1c]
	moveq r1, #0
	add ip, ip, #1
	str ip, [lr, #0x1c]
	ldr ip, [r4, #0x2c]
	moveq r2, r1
	mov r0, r4
	blx ip
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r4, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D714
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D714
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D714:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Gti2ReceivedCallback

	arm_func_start Gti2ClosedCallback
Gti2ClosedCallback: ; 0x0230D71C
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x30]
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x24]
	add r2, r2, #1
	str r2, [r4, #0x24]
	ldr r3, [r4, #8]
	ldr r2, [r3, #0x1c]
	add r2, r2, #1
	str r2, [r3, #0x1c]
	ldr r2, [r4, #0x30]
	blx r2
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r4, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D7A4
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D7A4
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D7A4:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Gti2ClosedCallback

	arm_func_start Gti2PingCallback
Gti2PingCallback: ; 0x0230D7AC
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x34]
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x24]
	add r2, r2, #1
	str r2, [r4, #0x24]
	ldr r3, [r4, #8]
	ldr r2, [r3, #0x1c]
	add r2, r2, #1
	str r2, [r3, #0x1c]
	ldr r2, [r4, #0x34]
	blx r2
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r4, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D834
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D834
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D834:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Gti2PingCallback

	arm_func_start Gti2SendFilterCallback
Gti2SendFilterCallback: ; 0x0230D83C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x98]
	bl ArrayNth_Gsi
	movs lr, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x24]
	cmp r4, #0
	add r0, r0, #1
	str r0, [r7, #0x24]
	ldr ip, [r7, #8]
	cmpne r5, #0
	ldr r3, [ip, #0x1c]
	moveq r5, #0
	add r3, r3, #1
	ldr r2, [sp, #0x18]
	str r3, [ip, #0x1c]
	str r2, [sp]
	moveq r4, r5
	mov r1, r6
	ldr r6, [lr]
	mov r0, r7
	mov r2, r5
	mov r3, r4
	blx r6
	ldr r0, [r7, #0x24]
	sub r0, r0, #1
	str r0, [r7, #0x24]
	ldr r1, [r7, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D8FC
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D8FC
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0230D8FC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Gti2SendFilterCallback

	arm_func_start Gti2ReceiveFilterCallback
Gti2ReceiveFilterCallback: ; 0x0230D904
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x9c]
	bl ArrayNth_Gsi
	movs lr, r0
	arm_func_end Gti2ReceiveFilterCallback

	arm_func_start ov00_0230D92C
ov00_0230D92C: ; 0x0230D92C
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x24]
	cmp r4, #0
	add r0, r0, #1
	str r0, [r7, #0x24]
	ldr ip, [r7, #8]
	cmpne r5, #0
	ldr r3, [ip, #0x1c]
	moveq r5, #0
	add r3, r3, #1
	ldr r2, [sp, #0x18]
	str r3, [ip, #0x1c]
	str r2, [sp]
	moveq r4, r5
	mov r1, r6
	ldr r6, [lr]
	mov r0, r7
	mov r2, r5
	mov r3, r4
	blx r6
	ldr r0, [r7, #0x24]
	sub r0, r0, #1
	str r0, [r7, #0x24]
	ldr r1, [r7, #8]
	ldr r0, [r1, #0x1c]
	sub r0, r0, #1
	str r0, [r1, #0x1c]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0230D9C4
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _0230D9C4
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0230D9C4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov00_0230D92C

	arm_func_start Gti2DumpCallback
Gti2DumpCallback: ; 0x0230D9CC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	movs r5, r0
	mov r4, r1
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ldrne ip, [r5, #0x28]
	ldreq ip, [r5, #0x2c]
	cmp ip, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	cmp r0, #0
	ldrne r0, [sp, #0x1c]
	cmpne r0, #0
	moveq r0, #0
	streq r0, [sp, #0x20]
	streq r0, [sp, #0x1c]
	ldr r0, [r5, #0x1c]
	cmp r4, #0
	add r0, r0, #1
	str r0, [r5, #0x1c]
	ldrne r0, [r4, #0x24]
	ldr lr, [sp, #0x20]
	addne r0, r0, #1
	strne r0, [r4, #0x24]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, r4
	str r0, [sp, #4]
	mov r0, r5
	str lr, [sp, #8]
	blx ip
	ldr r0, [r5, #0x1c]
	cmp r4, #0
	sub r0, r0, #1
	str r0, [r5, #0x1c]
	ldrne r0, [r4, #0x24]
	subne r0, r0, #1
	strne r0, [r4, #0x24]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0230DAAC
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	bne _0230DAAC
	mov r0, r5
	bl Gti2CloseSocket
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0230DAAC:
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end Gti2DumpCallback

	arm_func_start Gti2UnrecognizedMessageCallback
Gti2UnrecognizedMessageCallback: ; 0x0230DAB8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x14]
	movs r5, r0
	mov r0, #0
	str r0, [r4]
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x30]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [sp, #0x10]
	ldr ip, [r5, #0x1c]
	cmp r0, #0
	cmpne r3, #0
	moveq r3, #0
	streq r3, [sp, #0x10]
	add ip, ip, #1
	ldr r0, [sp, #0x10]
	str ip, [r5, #0x1c]
	str r0, [sp]
	ldr ip, [r5, #0x30]
	mov r0, r5
	blx ip
	str r0, [r4]
	ldr r0, [r5, #0x1c]
	sub r0, r0, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0230DB50
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	bne _0230DB50
	mov r0, r5
	bl Gti2CloseSocket
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0230DB50:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Gti2UnrecognizedMessageCallback

	arm_func_start Gti2NewOutgoingConnection
Gti2NewOutgoingConnection: ; 0x0230DB58
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Gti2NewSocketConnection
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, [r4]
	mov r0, #0
	str r0, [r1, #0xc]
	ldr r1, [r4]
	mov r2, #1
	str r2, [r1, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end Gti2NewOutgoingConnection

	arm_func_start Gti2NewIncomingConnection
Gti2NewIncomingConnection: ; 0x0230DB88
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Gti2NewSocketConnection
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4]
	mov r1, #2
	str r1, [r0, #0xc]
	ldr r1, [r4]
	mov r0, #0
	str r0, [r1, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end Gti2NewIncomingConnection

	arm_func_start Gti2StartConnectionAttempt
Gti2StartConnectionAttempt: ; 0x0230DBB8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	add r0, sp, #0x34
	add r1, sp, #0x38
	mov r4, r3
	bl Gti2MessageCheck
	ldr r0, [sp, #0x38]
	cmp r0, #0
	ble _0230DC18
	bl gsimalloc
	cmp r0, #0
	str r0, [r5, #0x38]
	addeq sp, sp, #0x20
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	bl memcpy
	ldr r0, [sp, #0x38]
	str r0, [r5, #0x3c]
_0230DC18:
	cmp r4, #0
	addne ip, r5, #0x28
	ldmneia r4, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	add r0, sp, #0
	bl Gti2GetChallenge
	add r1, sp, #0
	add r0, r5, #0x68
	bl Gti2GetResponse
	add r1, sp, #0
	mov r0, r5
	bl Gti2SendClientChallenge
	mov r0, #0
	str r0, [r5, #0xc]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Gti2StartConnectionAttempt

	arm_func_start Gti2AcceptConnection
Gti2AcceptConnection: ; 0x0230DC60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r2, [r5, #0x14]
	mov r4, r1
	cmp r2, #0
	movne r0, #0
	strne r0, [r5, #0x14]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r2, #0
	str r2, [r5, #0x14]
	ldr r1, [r5, #0xc]
	cmp r1, #4
	movne r0, r2
	ldmneia sp!, {r3, r4, r5, pc}
	bl Gti2SendAccept
	mov r0, #5
	cmp r4, #0
	str r0, [r5, #0xc]
	addne ip, r5, #0x28
	ldmneia r4, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Gti2AcceptConnection

	arm_func_start Gti2RejectConnection
Gti2RejectConnection: ; 0x0230DCBC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	cmp r0, #4
	ldmneia sp!, {r4, lr}
	addne sp, sp, #0x10
	bxne lr
	add r0, sp, #0xc
	add r1, sp, #0x10
	bl Gti2MessageCheck
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	mov r0, r4
	bl Gti2SendReject
	mov r0, #6
	str r0, [r4, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Gti2RejectConnection

	arm_func_start Gti2ConnectionSendData
Gti2ConnectionSendData: ; 0x0230DD14
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	str r2, [sp]
	mov r3, r1
	ldrh r2, [r4, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4]
	bl Gti2SocketSend
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	bl current_time_gsi
	str r0, [r4, #0x88]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end Gti2ConnectionSendData

	arm_func_start Gti2CheckTimeout
Gti2CheckTimeout: ; 0x0230DD5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0xc]
	cmp r2, #5
	bge _0230DDF4
	ldr r0, [r4, #0x10]
	mov r3, #0
	cmp r0, #0
	beq _0230DDA0
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0230DDBC
	ldr r0, [r4, #0x1c]
	sub r0, r1, r0
	cmp r0, r2
	movhi r3, #1
	b _0230DDBC
_0230DDA0:
	cmp r2, #4
	bge _0230DDBC
	ldr r2, [r4, #0x1c]
	ldr r0, _0230DDFC ; =0x0000EA60
	sub r1, r1, r2
	cmp r1, r0
	movhi r3, #1
_0230DDBC:
	cmp r3, #0
	beq _0230DDF4
	mov r0, r4
	bl Gti2SendClosed
	mov r0, r4
	bl Gti2ConnectionClosed
	mov r2, #0
	mov r0, r4
	mov r3, r2
	mov r1, #6
	bl Gti2ConnectedCallback
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_0230DDF4:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230DDFC: .word 0x0000EA60
	arm_func_end Gti2CheckTimeout

	arm_func_start Gti2SendRetries
Gti2SendRetries: ; 0x0230DE00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0x60]
	mov r6, r1
	bl ArrayLength_Gsi
	mov r5, r0
	cmp r5, #0
	mov r4, #0
	ble _0230DE64
_0230DE24:
	ldr r0, [r7, #0x60]
	mov r1, r4
	bl ArrayNth_Gsi
	mov r1, r0
	ldr r0, [r1, #0xc]
	sub r0, r6, r0
	cmp r0, #0x3e8
	bls _0230DE58
	mov r0, r7
	bl Gti2ResendMessage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0230DE58:
	add r4, r4, #1
	cmp r4, r5
	blt _0230DE24
_0230DE64:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Gti2SendRetries

	arm_func_start Gti2CheckPendingAck
Gti2CheckPendingAck: ; 0x0230DE6C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x90]
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldr r2, [r0, #0x94]
	sub r1, r1, r2
	cmp r1, #0x64
	bls _0230DEA0
	bl Gti2SendAck
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0230DEA0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end Gti2CheckPendingAck

	arm_func_start Gti2CheckKeepAlive
Gti2CheckKeepAlive: ; 0x0230DEA8
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0x88]
	ldr r2, _0230DED8 ; =0x00007530
	sub r1, r1, r3
	cmp r1, r2
	bls _0230DED0
	bl Gti2SendKeepAlive
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0230DED0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DED8: .word 0x00007530
	arm_func_end Gti2CheckKeepAlive

	arm_func_start Gti2ConnectionThink
Gti2ConnectionThink: ; 0x0230DEDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Gti2CheckTimeout
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl Gti2CheckKeepAlive
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl Gti2SendRetries
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl Gti2CheckPendingAck
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Gti2ConnectionThink

	arm_func_start Gti2CloseConnection
Gti2CloseConnection: ; 0x0230DF44
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _0230DF84
	ldr r1, [r4, #0xc]
	cmp r1, #7
	ldmgeia sp!, {r4, pc}
	bl Gti2ConnectionClosed
	mov r0, r4
	bl Gti2SendClosed
	mov r0, r4
	mov r1, #0
	bl Gti2ClosedCallback
	mov r0, r4
	bl Gti2FreeSocketConnection
	ldmia sp!, {r4, pc}
_0230DF84:
	mov r1, #6
	str r1, [r4, #0xc]
	bl Gti2SendClose
	ldmia sp!, {r4, pc}
	arm_func_end Gti2CloseConnection

	arm_func_start Gti2ConnectionClosed
Gti2ConnectionClosed: ; 0x0230DF94
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	cmp r0, #7
	ldmeqia sp!, {r3, lr}
	addeq sp, sp, #0x10
	bxeq lr
	mov r0, #7
	str r0, [r1, #0xc]
	ldr r0, [sp, #8]
	add r1, sp, #8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0xc]
	bl TableRemove_Gsi
	ldr r0, [sp, #8]
	add r1, sp, #8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x10]
	bl ArrayAppend_Gsi
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Gti2ConnectionClosed

	arm_func_start Gti2ConnectionCleanup
Gti2ConnectionCleanup: ; 0x0230DFF0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0230E008
	bl gsifree
_0230E008:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0230E018
	bl gsifree
_0230E018:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _0230E028
	bl gsifree
_0230E028:
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _0230E038
	bl ArrayFree_Gsi
_0230E038:
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _0230E048
	bl ArrayFree_Gsi
_0230E048:
	ldr r0, [r4, #0x98]
	cmp r0, #0
	beq _0230E058
	bl ArrayFree_Gsi
_0230E058:
	ldr r0, [r4, #0x9c]
	cmp r0, #0
	beq _0230E068
	bl ArrayFree_Gsi
_0230E068:
	mov r0, r4
	bl gsifree
	ldmia sp!, {r4, pc}
	arm_func_end Gti2ConnectionCleanup

	arm_func_start Gt2CreateSocket
Gt2CreateSocket: ; 0x0230E074
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl Gti2CreateSocket
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end Gt2CreateSocket

	arm_func_start Gt2CloseSocket
Gt2CloseSocket: ; 0x0230E098
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Gt2CloseAllConnectionsHard
	mov r0, r4
	bl Gti2CloseSocket
	ldmia sp!, {r4, pc}
	arm_func_end Gt2CloseSocket

	arm_func_start Gt2Think
Gt2Think: ; 0x0230E0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Gti2ReceiveMessages
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl Gti2SocketConnectionsThink
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl Gti2FreeClosedConnections
	ldmia sp!, {r4, pc}
	arm_func_end Gt2Think

	arm_func_start Gt2Listen
Gt2Listen: ; 0x0230E0E0
	ldr ip, _0230E0E8 ; =Gti2Listen
	bx ip
	.align 2, 0
_0230E0E8: .word Gti2Listen
	arm_func_end Gt2Listen

	arm_func_start Gt2Accept
Gt2Accept: ; 0x0230E0EC
	ldr ip, _0230E0F4 ; =Gti2AcceptConnection
	bx ip
	.align 2, 0
_0230E0F4: .word Gti2AcceptConnection
	arm_func_end Gt2Accept

	arm_func_start Gt2Reject
Gt2Reject: ; 0x0230E0F8
	ldr ip, _0230E100 ; =Gti2RejectConnection
	bx ip
	.align 2, 0
_0230E100: .word Gti2RejectConnection
	arm_func_end Gt2Reject

	arm_func_start Gt2Connect
Gt2Connect: ; 0x0230E104
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r6, r0
	mov r5, r1
	mov r0, r2
	add r1, sp, #4
	add r2, sp, #0
	mov r4, r3
	bl Gt2StringToAddress
	cmp r0, #0
	ldrne r2, [sp, #4]
	cmpne r2, #0
	ldrneh r3, [sp]
	cmpne r3, #0
	addeq sp, sp, #0xc
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r1, r2, lsr #0x18
	mov r0, r2, lsr #8
	mov r7, r2, lsl #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	mov r8, r2, lsl #0x18
	orr r0, r1, r0
	and r7, r7, #0xff0000
	and r1, r8, #0xff000000
	orr r0, r7, r0
	orr r0, r1, r0
	and r0, r0, #0xe0000000
	cmp r0, #0xe0000000
	addeq sp, sp, #0xc
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r1, sp, #8
	mov r0, r6
	bl Gti2NewOutgoingConnection
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x28]
	str r1, [r0, #0x20]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0x30]
	mov r1, r4
	bl Gti2StartConnectionAttempt
	movs r4, r0
	beq _0230E1DC
	ldr r0, [sp, #8]
	bl Gti2FreeSocketConnection
	add sp, sp, #0xc
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0230E1DC:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bne _0230E200
	cmp r5, #0
	ldrne r0, [sp, #8]
	add sp, sp, #0xc
	strne r0, [r5]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0230E200:
	ldr r1, [sp, #8]
	mov r8, #1
	ldr r0, [r1, #0x24]
	mov r7, #0
	add r0, r0, #1
	str r0, [r1, #0x24]
	mov r4, r8
_0230E21C:
	mov r0, r6
	bl Gt2Think
	ldr r0, [sp, #8]
	ldr r0, [r0, #0xc]
	cmp r0, #5
	movge sb, r8
	movlt sb, r7
	cmp sb, #0
	bne _0230E248
	mov r0, r4
	bl msleep_gsi
_0230E248:
	cmp sb, #0
	beq _0230E21C
	ldr r1, [sp, #8]
	ldr r0, [r1, #0x24]
	sub r0, r0, #1
	str r0, [r1, #0x24]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	cmp r0, #5
	streq r1, [r5]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x18]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Gt2Connect

	arm_func_start Gt2Send
Gt2Send: ; 0x0230E280
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	ldr r0, [r5, #0xc]
	mov r4, r3
	cmp r0, #5
	addne sp, sp, #8
	movne r0, #8
	ldmneia sp!, {r3, r4, r5, lr}
	addne sp, sp, #0x10
	bxne lr
	add r0, sp, #0x1c
	add r1, sp, #0x20
	bl Gti2MessageCheck
	cmp r4, #0
	beq _0230E318
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x40]
	cmp r0, #2
	bne _0230E318
	ldr r0, [sp, #0x1c]
	add r3, sp, #4
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	ldr r2, [sp, #0x20]
	strb r1, [r3]
	strb r0, [r3, #1]
	ldr r0, [r5, #8]
	ldrh r1, [sp, #4]
	ldr r0, [r0, #0x44]
	add r0, r1, r0
	cmp r2, r0
	addne sp, sp, #8
	movne r0, #9
	ldmneia sp!, {r3, r4, r5, lr}
	addne sp, sp, #0x10
	bxne lr
_0230E318:
	ldr r0, [r5, #0x98]
	bl ArrayLength_Gsi
	cmp r0, #0
	beq _0230E354
	str r4, [sp]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	mov r0, r5
	mov r1, #0
	bl Gti2SendFilterCallback
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_0230E354:
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	mov r0, r5
	mov r3, r4
	bl Gti2Send
	cmp r0, #0
	movne r0, #0
	moveq r0, #0xa
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Gt2Send

	arm_func_start Gt2CloseConnectionHard
Gt2CloseConnectionHard: ; 0x0230E384
	ldr ip, _0230E390 ; =Gti2CloseConnection
	mov r1, #1
	bx ip
	.align 2, 0
_0230E390: .word Gti2CloseConnection
	arm_func_end Gt2CloseConnectionHard

	arm_func_start Gti2CloseAllConnectionsHardMap
Gti2CloseAllConnectionsHardMap: ; 0x0230E394
	ldr ip, _0230E3A0 ; =Gt2CloseConnectionHard
	ldr r0, [r0]
	bx ip
	.align 2, 0
_0230E3A0: .word Gt2CloseConnectionHard
	arm_func_end Gti2CloseAllConnectionsHardMap

	arm_func_start Gt2CloseAllConnectionsHard
Gt2CloseAllConnectionsHard: ; 0x0230E3A4
	stmdb sp!, {r3, lr}
	ldr r1, _0230E3E0 ; =ov00_02328E18
	ldr r2, [r1]
	cmp r2, #1
	ldmeqia sp!, {r3, pc}
	mov r2, #1
	str r2, [r1]
	ldr r0, [r0, #0xc]
	ldr r1, _0230E3E4 ; =Gti2CloseAllConnectionsHardMap
	mov r2, #0
	bl TableMap_Gsi
	ldr r0, _0230E3E0 ; =ov00_02328E18
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E3E0: .word ov00_02328E18
_0230E3E4: .word Gti2CloseAllConnectionsHardMap
	arm_func_end Gt2CloseAllConnectionsHard
