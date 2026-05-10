	.include "asm/macros.inc"
	.include "include/os_arena.inc"

	.text

    arm_func_start OS_InitArena
OS_InitArena: ; 0x0207A3B4
	stmdb sp!, {r3, lr}
	ldr r1, _0207A4B4 ; =_022B98C4
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	str r2, [r1]
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #0
	bl OS_SetArenaHi
	mov r0, #0
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #0
	bl OS_SetArenaLo
	mov r0, #2
	mov r1, #0
	bl OS_SetArenaLo
	mov r0, #2
	mov r1, #0
	bl OS_SetArenaHi
	mov r0, #3
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #3
	bl OS_SetArenaHi
	mov r0, #3
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #3
	bl OS_SetArenaLo
	mov r0, #4
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #4
	bl OS_SetArenaHi
	mov r0, #4
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #4
	bl OS_SetArenaLo
	mov r0, #5
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #5
	bl OS_SetArenaHi
	mov r0, #5
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #5
	bl OS_SetArenaLo
	mov r0, #6
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #6
	bl OS_SetArenaHi
	mov r0, #6
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #6
	bl OS_SetArenaLo
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A4B4: .word _022B98C4
	arm_func_end OS_InitArena

	arm_func_start OS_InitArenaEx
OS_InitArenaEx: ; 0x0207A4B8
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #2
	bl OS_SetArenaHi
	mov r0, #2
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #2
	bl OS_SetArenaLo
	ldr r0, _0207A518 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A504
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	ldmneia sp!, {r3, pc}
_0207A504:
	ldr r0, _0207A51C ; =_0200002B
	bl OS_SetProtectionRegion1
	ldr r0, _0207A520 ; =0x023E0021
	bl OS_SetProtectionRegion2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A518: .word _022B98C4
_0207A51C: .word _0200002B
_0207A520: .word 0x023E0021
	arm_func_end OS_InitArenaEx

	arm_func_start sub_0207A524
sub_0207A524: ; 0x0207A524
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end sub_0207A524

	arm_func_start sub_0207A538
sub_0207A538: ; 0x0207A538
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end sub_0207A538

	arm_func_start OS_GetInitArenaHi
OS_GetInitArenaHi: ; 0x0207A54C
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A608
_0207A55C: ; jump table
	b _0207A578 ; case 0
	b _0207A608 ; case 1
	b _0207A580 ; case 2
	b _0207A5B0 ; case 3
	b _0207A5B8 ; case 4
	b _0207A5F8 ; case 5
	b _0207A600 ; case 6
_0207A578:
	ldr r0, _0207A610 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A580:
	ldr r0, _0207A614 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A5A0
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A5A8
_0207A5A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A5A8:
	mov r0, #0x2700000
	ldmia sp!, {r3, pc}
_0207A5B0:
	mov r0, #0x2000000
	ldmia sp!, {r3, pc}
_0207A5B8:
	ldr r0, _0207A618 ; =OS_IRQTable
	ldr r1, _0207A61C ; =0x00000000
	ldr r2, _0207A620 ; =0x00000800
	add r3, r0, #0x3f80
	cmp r1, #0
	sub r2, r3, r2
	bne _0207A5E4
	ldr r1, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	cmp r0, r1
	movlo r0, r1
	ldmia sp!, {r3, pc}
_0207A5E4:
	cmp r1, #0
	ldrlt r0, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	sublt r0, r0, r1
	subge r0, r2, r1
	ldmia sp!, {r3, pc}
_0207A5F8:
	ldr r0, _0207A628 ; =0x027FF680
	ldmia sp!, {r3, pc}
_0207A600:
	ldr r0, _0207A62C ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A608:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A610: .word SDK_SECTION_ARENA_EX_START
_0207A614: .word _022B98C4
_0207A618: .word OS_IRQTable
_0207A61C: .word 0x00000000
_0207A620: .word 0x00000800
_0207A624: .word SDK_SECTION_ARENA_DTCM_START
_0207A628: .word 0x027FF680
_0207A62C: .word 0x037F8000
	arm_func_end OS_GetInitArenaHi

	arm_func_start OS_GetInitArenaLo
OS_GetInitArenaLo: ; 0x0207A630
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A6B4
_0207A640: ; jump table
	b _0207A65C ; case 0
	b _0207A6B4 ; case 1
	b _0207A664 ; case 2
	b _0207A694 ; case 3
	b _0207A69C ; case 4
	b _0207A6A4 ; case 5
	b _0207A6AC ; case 6
_0207A65C:
	ldr r0, _0207A6BC ; =SDK_MAIN_ARENA_LO
	ldmia sp!, {r3, pc}
_0207A664:
	ldr r0, _0207A6C0 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A684
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A68C
_0207A684:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A68C:
	ldr r0, _0207A6C4 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A694:
	ldr r0, _0207A6C8 ; =SDK_SECTION_ARENA_ITCM_START
	ldmia sp!, {r3, pc}
_0207A69C:
	ldr r0, _0207A6CC ; =SDK_SECTION_ARENA_DTCM_START
	ldmia sp!, {r3, pc}
_0207A6A4:
	ldr r0, _0207A6D0 ; =0x027FF000
	ldmia sp!, {r3, pc}
_0207A6AC:
	ldr r0, _0207A6D4 ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A6B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A6BC: .word SDK_MAIN_ARENA_LO
_0207A6C0: .word _022B98C4
_0207A6C4: .word SDK_SECTION_ARENA_EX_START
_0207A6C8: .word SDK_SECTION_ARENA_ITCM_START
_0207A6CC: .word SDK_SECTION_ARENA_DTCM_START
_0207A6D0: .word 0x027FF000
_0207A6D4: .word 0x037F8000
	arm_func_end OS_GetInitArenaLo

	arm_func_start OS_SetArenaHi
OS_SetArenaHi: ; 0x0207A6D8
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xdc4]
	bx lr
	arm_func_end OS_SetArenaHi

	arm_func_start OS_SetArenaLo
OS_SetArenaLo: ; 0x0207A6EC
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end OS_SetArenaLo

	arm_func_start sub_0207A700
sub_0207A700: ; 0x0207A700
	str r0, [r1, #4]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	strne r1, [r0]
	mov r0, r1
	bx lr
	arm_func_end sub_0207A700

	arm_func_start sub_0207A71C
sub_0207A71C: ; 0x0207A71C
	ldr r3, [r1, #4]
	cmp r3, #0
	ldrne r2, [r1]
	strne r2, [r3]
	ldr r2, [r1]
	cmp r2, #0
	ldreq r0, [r1, #4]
	ldrne r1, [r1, #4]
	strne r1, [r2, #4]
	bx lr
	arm_func_end sub_0207A71C

	arm_func_start sub_0207A744
sub_0207A744: ; 0x0207A744
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r0, #0
	mov ip, #0
	beq _0207A770
_0207A758:
	cmp r1, lr
	bls _0207A770
	mov ip, lr
	ldr lr, [lr, #4]
	cmp lr, #0
	bne _0207A758
_0207A770:
	stmia r1, {ip, lr}
	cmp lr, #0
	beq _0207A7AC
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _0207A7AC
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_0207A7AC:
	cmp ip, #0
	beq _0207A7E4
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	ldmia sp!, {r3, pc}
_0207A7E4:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207A744

	arm_func_start sub_0207A7EC
sub_0207A7EC: ; 0x0207A7EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, _0207A8F0 ; =_022B98CC
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _0207A820
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A820:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	cmp r0, #0
	bic r7, r1, #0x1f
	beq _0207A864
_0207A84C:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _0207A864
	ldr r5, [r5, #4]
	cmp r5, #0
	bne _0207A84C
_0207A864:
	cmp r5, #0
	bne _0207A87C
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A87C:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _0207A89C
	mov r1, r5
	bl sub_0207A71C
	str r0, [r4, #4]
	b _0207A8D0
_0207A89C:
	str r7, [r5, #8]
	add r2, r5, r7
	str r1, [r2, #8]
	ldr r0, [r5]
	str r0, [r5, r7]
	ldr r0, [r5, #4]
	str r0, [r2, #4]
	cmp r0, #0
	strne r2, [r0]
	ldr r0, [r2]
	cmp r0, #0
	strne r2, [r0, #4]
	streq r2, [r4, #4]
_0207A8D0:
	ldr r0, [r4, #8]
	mov r1, r5
	bl sub_0207A700
	str r0, [r4, #8]
	mov r0, r6
	bl SetIrqFlag
	add r0, r5, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A8F0: .word _022B98CC
	arm_func_end sub_0207A7EC

	arm_func_start sub_0207A8F4
sub_0207A8F4: ; 0x0207A8F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r1, _0207A958 ; =_022B98CC
	mov r4, r0
	ldr r0, [r1, r7, lsl #2]
	cmp r6, #0
	ldrlt r6, [r0]
	ldr r1, [r0, #0x10]
	mov r0, #0xc
	mla r7, r6, r0, r1
	sub r5, r5, #0x20
	ldr r0, [r7, #8]
	mov r1, r5
	bl sub_0207A71C
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl sub_0207A744
	str r0, [r7, #4]
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A958: .word _022B98CC
	arm_func_end sub_0207A8F4

	arm_func_start sub_0207A95C
sub_0207A95C: ; 0x0207A95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _0207A988 ; =_022B98CC
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A988: .word _022B98CC
	arm_func_end sub_0207A95C

	arm_func_start sub_0207A98C
sub_0207A98C: ; 0x0207A98C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r2, _0207AA30 ; =_022B98CC
	mov r1, #0xc
	str r5, [r2, r7, lsl #2]
	add r2, r5, #0x14
	str r2, [r5, #0x10]
	mul r1, r6, r1
	str r6, [r5, #4]
	cmp r6, #0
	mov lr, #0
	ble _0207AA00
	mov r6, lr
	mvn ip, #0
	mov r3, lr
_0207A9D8:
	ldr r2, [r5, #0x10]
	add lr, lr, #1
	str ip, [r2, r6]
	add r2, r2, r6
	str r3, [r2, #8]
	str r3, [r2, #4]
	ldr r2, [r5, #4]
	add r6, r6, #0xc
	cmp lr, r2
	blt _0207A9D8
_0207AA00:
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl SetIrqFlag
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207AA30: .word _022B98CC
	arm_func_end sub_0207A98C

	arm_func_start sub_0207AA34
sub_0207AA34: ; 0x0207AA34
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r2, _0207AAC8 ; =_022B98CC
	add r1, r6, #0x1f
	ldr r2, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr ip, [r2, #4]
	bic r5, r5, #0x1f
	cmp ip, #0
	mov r4, #0
	ble _0207AABC
	ldr r3, [r2, #0x10]
_0207AA70:
	ldr r1, [r3]
	cmp r1, #0
	bge _0207AAAC
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_0207AAAC:
	add r4, r4, #1
	cmp r4, ip
	add r3, r3, #0xc
	blt _0207AA70
_0207AABC:
	bl SetIrqFlag
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AAC8: .word _022B98CC
	arm_func_end sub_0207AA34

