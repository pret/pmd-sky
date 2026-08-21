	.include "asm/macros.inc"
	.include "main_0206C1BC.inc"

	.text

	arm_func_start sub_0206C1BC
sub_0206C1BC: ; 0x0206C1BC
	bx lr
	arm_func_end sub_0206C1BC

	arm_func_start DseDriver_LoadDefaultSettings
DseDriver_LoadDefaultSettings: ; 0x0206C1C0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C248 ; =DRIVER_WORK
	mov r2, #1
	movs r4, r0
	strb r2, [r1, #0x3d]
	subeq r0, r2, #0x100
	ldmeqia sp!, {r4, pc}
	mov r1, #0x40
	bl DseMem_Clear
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r1, #8
	strb r1, [r4, #0x10]
	strb r0, [r4, #0x11]
	strh r0, [r4, #0x14]
	mov r1, #0xf
	strh r1, [r4, #0x16]
	mov r1, #0x14
	strb r1, [r4, #0x12]
	mov r1, #4
	strh r1, [r4, #0x18]
	ldr r2, _0206C24C ; =_0206C184
	strh r1, [r4, #0x1a]
	ldr r1, _0206C250 ; =_0206C19C
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	ldr r1, _0206C254 ; =sub_0206C1BC
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	str r1, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C248: .word DRIVER_WORK
_0206C24C: .word sub_0206C184
_0206C250: .word sub_0206C19C
_0206C254: .word sub_0206C1BC
	arm_func_end DseDriver_LoadDefaultSettings

	arm_func_start DseDriver_IsSettingsValid
DseDriver_IsSettingsValid: ; 0x0206C258
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	bne _0206C27C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C27C:
	tst r4, #3
	beq _0206C29C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C29C:
	ldr r0, [r4, #8]
	mov r5, #0
	cmp r0, #0
	beq _0206C2B4
	tst r0, #0xf
	beq _0206C2B8
_0206C2B4:
	orr r5, r5, #4
_0206C2B8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0206C2CC
	tst r0, #0xf
	beq _0206C2D0
_0206C2CC:
	orr r5, r5, #8
_0206C2D0:
	ldrb r0, [r4, #0x11]
	ldrb r1, [r4, #0x10]
	cmp r0, #0
	cmpne r0, #1
	orrne r5, r5, #0x100
	cmp r1, #4
	ldrb r0, [r4, #0x12]
	orrlo r5, r5, #0x200
	cmp r0, r1
	ldrsh r1, [r4, #0x14]
	orrls r5, r5, #0x400
	ldrsh r0, [r4, #0x16]
	cmp r1, #0
	orrne r5, r5, #0x4000
	cmp r0, #0x10
	orrge r5, r5, #0x8000
	cmp r1, r0
	orrgt r5, r5, #0xc000
	cmp r5, #0
	beq _0206C330
	mov r1, r5
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
_0206C330:
	mov r0, r5
	str r5, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseDriver_IsSettingsValid

	arm_func_start DseDriver_ConfigureHeap
DseDriver_ConfigureHeap: ; 0x0206C33C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strne r1, [r0, #8]
	strne r2, [r0, #0xc]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end DseDriver_ConfigureHeap

	arm_func_start sub_0206C36C
sub_0206C36C: ; 0x0206C36C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strneb r1, [r0, #0x11]
	strneb r2, [r0, #0x10]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C36C

	arm_func_start sub_0206C39C
sub_0206C39C: ; 0x0206C39C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0206C3C0
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
_0206C3C0:
	cmp r1, #0
	movlt r1, #0
	cmp r2, #0
	strh r1, [r0, #0x14]
	movlt r2, #0xf
	strh r2, [r0, #0x16]
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C39C

	arm_func_start DseDriver_Init
DseDriver_Init: ; 0x0206C3E0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r1, [r1]
	cmp r1, #1
	bne _0206C410
	mov r1, #0
	mov r2, r1
	mvn r0, #0xbf
	bl Dse_SetError
	mvn r0, #0xbf
	ldmia sp!, {r4, pc}
_0206C410:
	bl DseDriver_IsSettingsValid
	movs r1, r0
	beq _0206C430
	mvn r0, #0x1d
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x1d
	ldmia sp!, {r4, pc}
_0206C430:
	bl OS_InitTick
	mov r0, #0
	mov r1, r0
	bl OS_SetTick
	bl OS_InitAlarm
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r3, #0
	strh r3, [r0, #2]
	str r3, [r0, #4]
	str r3, [r0, #0x10]
	mov r2, #0xff
	mov r1, #1
	strb r2, [r0, #0x3c]
	strb r1, [r0, #0x3d]
	rsb r1, r1, #0x1000
	strh r1, [r0, #0x3e]
	str r3, [r0, #0x2c]
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	ldreq r2, _0206C5FC ; =0x00002710
	moveq r1, #0x64
	ldrne r2, _0206C600 ; =0x0000414B
	movne r1, #0x3c
	strh r2, [r0, #0x28]
	str r1, [r0, #0x30]
	ldr r2, _0206C604 ; =0x00BC614E
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	ldr r0, _0206C608 ; =_022B8330
	str r2, [r1, #0x34]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #0xdd8]
	bl sub_0206C814
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r0, #1
	strb r0, [r1, #0x38]
	mov r3, #2
	ldr r2, _0206C60C ; =_020B1290
	ldr r0, _0206C608 ; =_022B8330
	strb r3, [r1, #0x39]
	str r2, [r0, #0xed4]
	mov r2, #0
	str r2, [r1, #0x71c]
	str r2, [r1, #0x720]
	str r2, [r1, #0x724]
	str r2, [r1, #0x728]
	ldrb r1, [r4, #0x10]
	ldr ip, _0206C610 ; =DRIVER_WORK
	mov r3, r2
	strb r1, [r0, #0xd10]
_0206C4F4:
	add r2, r2, #1
	strb r3, [ip, #0x674]
	cmp r2, #0x80
	add ip, ip, #1
	blt _0206C4F4
	ldr ip, _0206C5F8 ; =DRIVER_WORK
	mov r0, #0x64
	strb r0, [ip, #0x67b]
	mov r0, #0x7f
	strb r0, [ip, #0x67f]
	mov r0, #0x40
	strb r0, [ip, #0x67e]
	add r0, r4, #0x28
	ldr lr, _0206C614 ; =_022B734C
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldrsh ip, [ip, #0x28]
	ldr r1, _0206C608 ; =_022B8330
	mov r2, #1
	str r3, [r1, #0xec8]
	str r2, [r1, #0xecc]
	str r3, [r1, #0xebc]
	ldr r0, _0206C618 ; =_022B9130
	str r3, [r1, #0xec0]
	sub r2, r2, #2
	strh r2, [r0, #0xc4]
	strh ip, [r0, #0xc6]
	strb r3, [r1, #0xed0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r4, #0x1c
	bl DseMem_Init
	ldrsh r0, [r4, #0x16]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DseVoice_ResetHW
	bl DseVoice_ResetAll
	bl sub_02070124
	bl sub_02075600
	bl sub_020729A4
	ldr r1, _0206C61C ; =_022B7331
	mov r2, #1
	mov r0, #0x7f
_0206C5A4:
	add r2, r2, #1
	strb r0, [r1, #0x40]
	cmp r2, #0x10
	add r1, r1, #1
	blt _0206C5A4
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #0x40]
	bl DseDriver_StartMainThread
	ldrb r0, [r4, #0x12]
	bl DseSwd_SysInit
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #1
	strb r1, [r0]
	mov r1, #0
	strb r1, [r0, #1]
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	bl DseSe_SysReset
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C5F8: .word DRIVER_WORK
_0206C5FC: .word 0x00002710
_0206C600: .word 0x0000414B
_0206C604: .word 0x00BC614E
_0206C608: .word _022B8330
_0206C60C: .word _020B1290
_0206C610: .word DRIVER_WORK
_0206C614: .word _022B734C
_0206C618: .word _022B9130
_0206C61C: .word _022B7331
	arm_func_end DseDriver_Init

	arm_func_start sub_0206C620
sub_0206C620: ; 0x0206C620
	stmdb sp!, {r3, lr}
	ldr r0, _0206C684 ; =DRIVER_WORK
	ldrsb r0, [r0]
	cmp r0, #0
	mvneq r0, #0xc0
	ldmeqia sp!, {r3, pc}
	bl DseSwd_SysQuit
	mov r0, #0
	bl sub_0206C7F4
	bl sub_020756E8
	bl sub_02070158
	bl sub_02070148
	bl sub_02070EA0
	bl DseVoice_ResetAll
	bl DseMem_Quit
	bl sub_0206C814
	ldr r1, _0206C684 ; =DRIVER_WORK
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	str r0, [r1, #0x2c]
	str r0, [r1, #4]
	str r0, [r1, #0x10]
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C684: .word DRIVER_WORK
	arm_func_end sub_0206C620

	arm_func_start sub_0206C688
sub_0206C688: ; 0x0206C688
	stmdb sp!, {r3, lr}
	ldr r0, _0206C6B8 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	ldrnesb r0, [r0, #1]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C6B8: .word DRIVER_WORK
	arm_func_end sub_0206C688

	arm_func_start sub_0206C6BC
sub_0206C6BC: ; 0x0206C6BC
	stmdb sp!, {r3, lr}
	ldr r0, _0206C750 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	bne _0206C6E8
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
_0206C6E8:
	ldrsb r1, [r0, #1]
	cmp r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r0, #1]
	bl sub_02070F4C
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x664]
	bl DseSequence_PauseList
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x668]
	bl DseSequence_PauseList
	mov r0, #0
	bl sub_0206F6FC
	mov r0, #0
	bl sub_02070188
	mov r0, #0
	bl DseVoice_ResetHW
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #2
	strb r1, [r0, #0x38]
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C750: .word DRIVER_WORK
	arm_func_end sub_0206C6BC

	arm_func_start sub_0206C754
sub_0206C754: ; 0x0206C754
	stmdb sp!, {r4, lr}
	ldr r1, _0206C7F0 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r0, [r1, #1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r1, #0x38]
	ldrh r0, [r1, #0x3e]
	mov r1, r4
	tst r0, #0xf
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r2, #0
	mov r2, r2, lsl #0x18
	ldr r0, [r0, #0x664]
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	ldrh r0, [r0, #0x3e]
	tst r0, #0xf0
	movne r1, #1
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r1, #0
	mov r2, r1, lsl #0x18
	ldr r0, [r0, #0x668]
	mov r1, r4
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	mov r0, r4
	bl sub_0206F774
	mov r0, r4
	bl sub_020701B0
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #1]
	bl DseDriver_StartTickTimer
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C7F0: .word DRIVER_WORK
	arm_func_end sub_0206C754

	arm_func_start sub_0206C7F4
sub_0206C7F4: ; 0x0206C7F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DseBgm_StopAll
	mov r0, r4
	bl DseSe_StopAll
	mov r0, r4
	bl sub_0206F9A4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206C7F4

	arm_func_start sub_0206C814
sub_0206C814: ; 0x0206C814
	ldr r1, _0206C848 ; =DRIVER_WORK
	mov r2, #0
	str r2, [r1, #0x654]
	str r2, [r1, #0x658]
	ldr r0, _0206C84C ; =_022B8330
	str r2, [r1, #0x65c]
	str r2, [r0, #0xddc]
	str r2, [r1, #0x660]
	str r2, [r1, #0x664]
	str r2, [r1, #0x668]
	ldr ip, _0206C850 ; =DseBgm_SysSetupNoteList
	str r2, [r1, #0x66c]
	bx ip
	.align 2, 0
_0206C848: .word DRIVER_WORK
_0206C84C: .word _022B8330
_0206C850: .word DseBgm_SysSetupNoteList
	arm_func_end sub_0206C814

	arm_func_start Dse_SetError
Dse_SetError: ; 0x0206C854
	stmdb sp!, {r3, lr}
	ldr r3, _0206C880 ; =DRIVER_WORK
	stmib r3, {r0, r1, r2}
	ldr ip, [r3, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C884 ; =_022B7334
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C880: .word DRIVER_WORK
_0206C884: .word _022B7334
	arm_func_end Dse_SetError

	arm_func_start Dse_SetError2
Dse_SetError2: ; 0x0206C888
	stmdb sp!, {r3, lr}
	ldr r3, _0206C8BC ; =DRIVER_WORK
	str r0, [r3, #0x10]
	str r1, [r3, #0x14]
	str r2, [r3, #0x18]
	ldr ip, [r3, #0x20]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C8C0 ; =_022B7340
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C8BC: .word DRIVER_WORK
_0206C8C0: .word _022B7340
	arm_func_end Dse_SetError2

; https://decomp.me/scratch/C4osO
	arm_func_start DseUtil_ByteSwap32
DseUtil_ByteSwap32: ; 0x0206C8C4
	mov r3, r0, lsr #0x18
	mov r2, r0, lsr #8
	mov r1, r0, lsl #8
	mov r0, r0, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	and r1, r1, #0xff0000
	orr r1, r2, r1
	and r0, r0, #0xff000000
	orr r0, r1, r0
	bx lr
	arm_func_end DseUtil_ByteSwap32

	arm_func_start DseUtil_GetRandomNumber
DseUtil_GetRandomNumber: ; 0x0206C8F4
	ldr r1, _0206C914 ; =DRIVER_WORK
	ldr r0, _0206C918 ; =0x00007FFF
	ldr r2, [r1, #0x34]
	eor r2, r2, r2, lsl #17
	eor r2, r2, r2, asr #15
	str r2, [r1, #0x34]
	and r0, r2, r0
	bx lr
	.align 2, 0
_0206C914: .word DRIVER_WORK
_0206C918: .word 0x00007FFF
	arm_func_end DseUtil_GetRandomNumber

; https://decomp.me/scratch/KrgBG
	arm_func_start DseMem_Init
DseMem_Init: ; 0x0206C91C
	mov ip, r1
	tst r0, #0xf
	bicne r0, r0, #0xf
	ldr r1, _0206C980 ; =DRIVER_WORK
	addne r0, r0, #0x10
	subne ip, ip, #0x10
	add r3, r0, ip
	str r0, [r1, #0x6f4]
	str r3, [r1, #0x6f8]
	str ip, [r1, #0x6fc]
	ldr r3, _0206C984 ; =0x74647373
	mov r1, #0x82
	str r3, [r0]
	strb r1, [r0, #4]
	mov r3, #0
	strb r3, [r0, #5]
	add r1, r0, #0x10
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	strb r3, [r0, #6]
	ldr r3, _0206C988 ; =_022B7A30
	ldmia r2, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, ip
	bx lr
	.align 2, 0
_0206C980: .word DRIVER_WORK
_0206C984: .word 0x74647373
_0206C988: .word _022B7A30
	arm_func_end DseMem_Init
