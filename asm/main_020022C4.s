	.include "asm/macros.inc"
	.include "main_020022C4.inc"

	.text

	arm_func_start sub_020022C4
sub_020022C4: ; 0x020022C4
	mov r1, #1
	str r1, [r0]
	bx lr
	arm_func_end sub_020022C4

	arm_func_start sub_020022D0
sub_020022D0: ; 0x020022D0
	ldr r3, [r0]
	ldr r2, _020022F4 ; =0x5D588B65
	mul r2, r3, r2
	add r3, r2, #1
	mov r2, r3, lsr #0x10
	mul r1, r2, r1
	str r3, [r0]
	mov r0, r1, lsr #0x10
	bx lr
	.align 2, 0
_020022F4: .word 0x5D588B65
	arm_func_end sub_020022D0

	arm_func_start RandIntSafe
RandIntSafe: ; 0x020022F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mul r0, r1, r4
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end RandIntSafe

	arm_func_start RandRangeSafe
RandRangeSafe: ; 0x02002318
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	bge _0200234C
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r4, r5
	mul r0, r1, r0
	add r0, r5, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
_0200234C:
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r5, r4
	mul r0, r1, r0
	add r0, r4, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RandRangeSafe

	arm_func_start sub_02002368
sub_02002368: ; 0x02002368
	b _02002378
_0200236C:
	cmp r2, r1
	bxeq lr
	add r0, r0, #1
	arm_func_end sub_02002368
_02002378:
	ldrsb r2, [r0]
	cmp r2, #0
	bne _0200236C
	mov r0, #0
	bx lr

	arm_func_start sub_0200238C
sub_0200238C: ; 0x0200238C
	cmp r0, #0x41
	bxlt lr
	cmp r0, #0x5a
	addle r0, r0, #0x20
	movle r0, r0, lsl #0x18
	movle r0, r0, asr #0x18
	bx lr
	arm_func_end sub_0200238C

	arm_func_start sub_020023A8
sub_020023A8: ; 0x020023A8
	mov ip, #0
	b _020023E4
_020023B0:
	ldrsb r3, [r1]
	cmp r3, #0
	bne _020023D8
	mov r1, #0x20
	b _020023CC
_020023C4:
	strb r1, [r0], #1
	add ip, ip, #1
_020023CC:
	cmp ip, r2
	blt _020023C4
	b _020023EC
_020023D8:
	add r1, r1, #1
	strb r3, [r0], #1
	add ip, ip, #1
_020023E4:
	cmp ip, r2
	blt _020023B0
_020023EC:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end sub_020023A8

	arm_func_start sub_020023F8
sub_020023F8: ; 0x020023F8
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02002428
_02002404:
	ldrsb ip, [r0], #1
	ldrsb r3, [r1], #1
	cmp r3, ip
	movne r0, #0
	ldmneia sp!, {r3, pc}
	cmp ip, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_02002428:
	cmp lr, r2
	blt _02002404
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020023F8

	arm_func_start WaitForever
WaitForever: ; 0x02002438
	stmdb sp!, {r3, lr}
	bl OS_DisableScheduler
_02002440:
	bl WaitForInterrupt
	b _02002440
	arm_func_end WaitForever

	arm_func_start sub_02002448
sub_02002448: ; 0x02002448
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AD0
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl OS_DisableScheduler
	bl GX_DispOff
	ldr r3, _02002498 ; =0x04001000
	ldr r0, _0200249C ; =_02092464
	ldr r2, [r3]
	mov r1, r4
	bic r2, r2, #0x10000
	str r2, [r3]
	bl Debug_Print0
	mov r0, r4
	bl OS_ResetSystem
	bl OS_DisableScheduler
_02002490:
	bl WaitForInterrupt
	b _02002490
	.align 2, 0
_02002498: .word 0x04001000
_0200249C: .word _02092464
	arm_func_end sub_02002448

	arm_func_start sub_020024A0
sub_020024A0: ; 0x020024A0
	ldr r0, _020024AC ; =0x027FFC20
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020024AC: .word 0x027FFC20
	arm_func_end sub_020024A0

	arm_func_start sub_020024B0
sub_020024B0: ; 0x020024B0
	ldr ip, _020024BC ; =Card_SetPulledOutCallback
	mov r0, #0
	bx ip
	.align 2, 0
_020024BC: .word Card_SetPulledOutCallback
	arm_func_end sub_020024B0

	arm_func_start sub_020024C0
sub_020024C0: ; 0x020024C0
	ldr ip, _020024CC ; =Card_SetPulledOutCallback
	ldr r0, _020024D0 ; =sub_020024D4
	bx ip
	.align 2, 0
_020024CC: .word Card_SetPulledOutCallback
_020024D0: .word sub_020024D4
	arm_func_end sub_020024C0

	arm_func_start sub_020024D4
sub_020024D4: ; 0x020024D4
	stmdb sp!, {r3, lr}
	bl CardPullOut
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020024D4

	arm_func_start sub_020024E4
sub_020024E4: ; 0x020024E4
	stmdb sp!, {r3, lr}
	ldr r0, _0200256C ; =_0229AFCC
	bl OS_InitMutex
	ldr r0, _0200256C ; =_0229AFCC
	bl OS_LockMutex
	mov r1, #0
	ldr r0, _02002570 ; =_0229AFE4
	mov r2, r1
_02002504:
	add r1, r1, #1
	cmp r1, #8
	str r2, [r0], #4
	blt _02002504
	ldr r1, _02002574 ; =_0229AFC0
	ldr r0, _0200256C ; =_0229AFCC
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl OS_UnlockMutex
	ldr r1, _02002578 ; =OSi_ThreadInfo
	ldr r0, _0200257C ; =_0229B004
	ldr r1, [r1, #4]
	mov r2, #0
	stmia r0, {r1, r2}
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	mov r1, #7
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	bl sub_020026E4
	ldr r0, _02002578 ; =OSi_ThreadInfo
	mov r1, #7
	ldr r0, [r0, #4]
	bl OS_SetThreadPriority
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200256C: .word _0229AFCC
_02002570: .word _0229AFE4
_02002574: .word _0229AFC0
_02002578: .word OSi_ThreadInfo
_0200257C: .word _0229B004
	arm_func_end sub_020024E4

	arm_func_start sub_02002580
sub_02002580: ; 0x02002580
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020025E8 ; =OSi_ThreadInfo
	ldr r0, _020025EC ; =_0229AFCC
	ldr r4, [r1, #4]
	bl OS_LockMutex
	ldr r0, _020025F0 ; =_0229AFC0
	mov r1, #0
	ldr r3, [r0]
	ldr r2, _020025F4 ; =_0229AFE4
	b _020025CC
_020025A8:
	ldr r5, [r2]
	ldr r0, [r5]
	cmp r0, r4
	bne _020025C4
	ldr r0, _020025EC ; =_0229AFCC
	bl OS_UnlockMutex
	b _020025E0
_020025C4:
	add r1, r1, #1
	add r2, r2, #4
_020025CC:
	cmp r1, r3
	blt _020025A8
	ldr r0, _020025EC ; =_0229AFCC
	bl OS_UnlockMutex
	mov r5, #0
_020025E0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020025E8: .word OSi_ThreadInfo
_020025EC: .word _0229AFCC
_020025F0: .word _0229AFC0
_020025F4: .word _0229AFE4
	arm_func_end sub_02002580

; https://decomp.me/scratch/Gairr
	arm_func_start sub_020025F8
sub_020025F8: ; 0x020025F8
	stmdb sp!, {r4, lr}
	cmp r0, #0
	beq _02002614
	ldr r0, [r0]
	mov r1, #0
	bl OS_SleepThreadDirect
	ldmia sp!, {r4, pc}
_02002614:
	mov r4, #0
_02002618:
	mov r0, r4
	bl OS_SleepThread
	b _02002618
	arm_func_end sub_020025F8

	arm_func_start sub_02002624
sub_02002624: ; 0x02002624
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002624

	arm_func_start sub_02002628
sub_02002628: ; 0x02002628
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02002658 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r0, [r2, #4]
	mov r4, r1
	str r0, [r5]
	bl OS_GetThreadPriority
	str r0, [r5, #4]
	ldr r0, [r5]
	mov r1, r4
	bl OS_SetThreadPriority
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002658: .word OSi_ThreadInfo
	arm_func_end sub_02002628

	arm_func_start sub_0200265C
sub_0200265C: ; 0x0200265C
	ldr ip, _0200266C ; =OS_SetThreadPriority
	mov r1, r0
	ldmia r1, {r0, r1}
	bx ip
	.align 2, 0
_0200266C: .word OS_SetThreadPriority
	arm_func_end sub_0200265C

	arm_func_start sub_02002670
sub_02002670: ; 0x02002670
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020026AC ; =OSi_ThreadInfo
	ldr r5, [r0, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl OS_SetThreadPriority
	ldr r0, _020026B0 ; =_0229AFCC
	bl OS_LockMutex
	ldr r0, _020026B4 ; =_020AEF30
	str r5, [r0]
	str r4, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026AC: .word OSi_ThreadInfo
_020026B0: .word _0229AFCC
_020026B4: .word _020AEF30
	arm_func_end sub_02002670

	arm_func_start sub_020026B8
sub_020026B8: ; 0x020026B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020026DC ; =_020AEF30
	ldr r0, _020026E0 ; =_0229AFCC
	ldmia r1, {r4, r5}
	bl OS_UnlockMutex
	mov r0, r4
	mov r1, r5
	bl OS_SetThreadPriority
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026DC: .word _020AEF30
_020026E0: .word _0229AFCC
	arm_func_end sub_020026B8

	arm_func_start sub_020026E4
sub_020026E4: ; 0x020026E4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002768 ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl OS_SetThreadPriority
	ldr r0, _0200276C ; =_0229AFCC
	bl OS_LockMutex
	ldr r0, _02002770 ; =_0229AFC0
	ldr r3, [r0]
	cmp r3, #8
	bge _02002750
	add r1, r3, #1
	ldr r2, _02002774 ; =_0229AFE4
	str r1, [r0]
	ldr r1, [r0]
	str r6, [r2, r3, lsl #2]
	str r1, [r0, #4]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	cmp r2, r1
	ldrgt r1, [r0, #4]
	strgt r1, [r0, #8]
_02002750:
	ldr r0, _0200276C ; =_0229AFCC
	bl OS_UnlockMutex
	mov r0, r5
	mov r1, r4
	bl OS_SetThreadPriority
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002768: .word OSi_ThreadInfo
_0200276C: .word _0229AFCC
_02002770: .word _0229AFC0
_02002774: .word _0229AFE4
	arm_func_end sub_020026E4

	arm_func_start sub_02002778
sub_02002778: ; 0x02002778
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r0
	mov ip, r1
	add r0, r4, #0x1c
	mov r5, ip
	str r0, [r4]
	mov r6, r2
	ldmia r5!, {r0, r1, r2, r3}
	add lr, r4, #4
	stmia lr!, {r0, r1, r2, r3}
	ldr r0, [r5]
	mov r2, r6
	str r0, [lr]
	str r6, [r4, #0x18]
	ldr r1, [ip, #8]
	str r1, [sp]
	ldr r0, [ip, #0xc]
	bic r3, r1, #7
	str r0, [sp, #4]
	ldmia ip, {r1, lr}
	ldr r0, [r4]
	add r3, lr, r3
	bl OS_CreateThread
	mov r0, r4
	bl sub_020026E4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02002778
