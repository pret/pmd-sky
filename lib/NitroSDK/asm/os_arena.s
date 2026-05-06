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

	arm_func_start OS_GetDTCMAddress
OS_GetDTCMAddress: ; 0x0207AACC
	mrc p15, 0, r0, c9, c1, 0
	ldr r1, _0207AADC ; =0xFFFFF000
	and r0, r0, r1
	bx lr
	.align 2, 0
_0207AADC: .word 0xFFFFF000
	arm_func_end OS_GetDTCMAddress

	arm_func_start OS_EnableProtectionUnit
OS_EnableProtectionUnit: ; 0x0207AAE0
	mrc p15, 0, r0, c1, c0, 0
	orr r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end OS_EnableProtectionUnit

	arm_func_start OS_DisableProtectionUnit
OS_DisableProtectionUnit: ; 0x0207AAF0
	mrc p15, 0, r0, c1, c0, 0
	bic r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end OS_DisableProtectionUnit

	arm_func_start OS_SetDPermissionsForProtectionRegion
OS_SetDPermissionsForProtectionRegion: ; 0x0207AB00
	mrc p15, 0, r2, c5, c0, 2
	bic r2, r2, r0
	orr r2, r2, r1
	mcr p15, 0, r2, c5, c0, 2
	bx lr
	arm_func_end OS_SetDPermissionsForProtectionRegion

	arm_func_start OS_SetProtectionRegion1
OS_SetProtectionRegion1: ; 0x0207AB14
	mcr p15, 0, r0, c6, c1, 0
	bx lr
	arm_func_end OS_SetProtectionRegion1

	arm_func_start OS_SetProtectionRegion2
OS_SetProtectionRegion2: ; 0x0207AB1C
	mcr p15, 0, r0, c6, c2, 0
	bx lr
	arm_func_end OS_SetProtectionRegion2

	arm_func_start OS_InitException
OS_InitException: ; 0x0207AB24
	ldr r0, _0207AB84 ; =0x027FFD9C
	ldr r1, [r0]
	cmp r1, #0x2600000
	blo _0207AB44
	cmp r1, #0x2800000
	ldrlo r0, _0207AB88 ; =_022B98F0
	strlo r1, [r0]
	blo _0207AB50
_0207AB44:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0]
_0207AB50:
	ldr r0, _0207AB88 ; =_022B98F0
	ldr r0, [r0]
	cmp r0, #0
	bne _0207AB74
	ldr r2, _0207AB8C ; =OSi_ExceptionHandler
	ldr r1, _0207AB84 ; =0x027FFD9C
	ldr r0, _0207AB90 ; =0x027E3000
	str r2, [r1]
	str r2, [r0, #0xfdc]
_0207AB74:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0207AB84: .word 0x027FFD9C
_0207AB88: .word _022B98F0
_0207AB8C: .word OSi_ExceptionHandler
_0207AB90: .word 0x027E3000
	arm_func_end OS_InitException

	arm_func_start OSi_ExceptionHandler
OSi_ExceptionHandler: ; 0x0207AB94
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
	bne _0207ABA8
	b _0207ABAC
_0207ABA8:
	mov lr, pc
_0207ABAC:
	bne _0207ABB4
	b _0207ABB8
_0207ABB4:
	bx ip
_0207ABB8:
	ldr ip, _0207AC14 ; =_02000000
	stmdb ip!, {r0, r1, r2, r3, sp, lr}
	and r0, sp, #1
	mov sp, ip
	mrs r1, cpsr
	and r1, r1, #0x1f
	teq r1, #0x17
	bne _0207ABE0
	bl OSi_GetAndDisplayContext
	b _0207ABEC
_0207ABE0:
	teq r1, #0x1b
	bne _0207ABEC
	bl OSi_GetAndDisplayContext
_0207ABEC:
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
_0207ABF8:
	beq _0207ABF8
_0207ABFC:
	mov r0, r0
	b _0207ABFC
_0207AC04:
	ldmia sp!, {r0, r1, r2, r3, ip, lr}
	mov sp, ip
	bx lr
	.align 2, 0
_0207AC10: .word _022B98F0
_0207AC14: .word _secure
	arm_func_end OSi_ExceptionHandler

	arm_func_start OSi_GetAndDisplayContext
OSi_GetAndDisplayContext: ; 0x0207AC18
	stmdb sp!, {r0, lr}
	bl OSi_SetExContext
	bl OSi_DisplayExContent
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end OSi_GetAndDisplayContext

	arm_func_start OSi_SetExContext
OSi_SetExContext: ; 0x0207AC2C
	ldr r1, _0207ACB8 ; =_022B991C
	mrs r2, cpsr
	str r2, [r1, #0x74]
	str r0, [r1, #0x6c]
	ldr r0, [ip]
	str r0, [r1, #4]
	ldr r0, [ip, #4]
	str r0, [r1, #8]
	ldr r0, [ip, #8]
	str r0, [r1, #0xc]
	ldr r0, [ip, #0xc]
	str r0, [r1, #0x10]
	ldr r2, [ip, #0x10]
	bic r2, r2, #1
	add r0, r1, #0x14
	stmia r0, {r4, r5, r6, r7, r8, sb, sl, fp}
	str ip, [r1, #0x70]
	ldr r0, [r2]
	str r0, [r1, #0x64]
	ldr r3, [r2, #4]
	str r3, [r1]
	ldr r0, [r2, #8]
	str r0, [r1, #0x34]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x40]
	mrs r0, cpsr
	orr r3, r3, #0x80
	bic r3, r3, #0x20
	msr cpsr_fsxc, r3
	str sp, [r1, #0x38]
	str lr, [r1, #0x3c]
	mrs r2, spsr
	str r2, [r1, #0x7c]
	msr cpsr_fsxc, r0
	bx lr
	.align 2, 0
_0207ACB8: .word _022B991C
	arm_func_end OSi_SetExContext

	arm_func_start OSi_DisplayExContent
OSi_DisplayExContent: ; 0x0207ACBC
	stmdb sp!, {r3, lr}
	ldr r0, _0207AD20 ; =_022B98F0
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mrs r2, cpsr
	mov r0, sp
	ldr r1, _0207AD24 ; =0x0000009F
	msr cpsr_fsxc, r1
	mov r1, sp
	mov sp, r0
	stmdb sp!, {r1, r2}
	bl OS_EnableProtectionUnit
	ldr r0, _0207AD28 ; =_022B991C
	ldr r1, _0207AD2C ; =_022B98F4
	ldr r1, [r1]
	ldr ip, _0207AD30 ; =_022B98F8
	ldr ip, [ip]
	ldr lr, _0207AD34 ; =_0207AD0C
	bx ip
_0207AD0C:
	bl OS_DisableProtectionUnit
	ldmia sp!, {r1, r2}
	mov sp, r1
	msr cpsr_fsxc, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207AD20: .word _022B98F0
_0207AD24: .word 0x0000009F
_0207AD28: .word _022B991C
_0207AD2C: .word _022B98F4
_0207AD30: .word _022B98F8
_0207AD34: .word _0207AD0C
	arm_func_end OSi_DisplayExContent

	arm_func_start sub_0207AD38
sub_0207AD38: ; 0x0207AD38
	ldr r1, _0207AD50 ; =_022B999C
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0207AD50: .word _022B999C
	arm_func_end sub_0207AD38

	arm_func_start sub_0207AD54
sub_0207AD54: ; 0x0207AD54
	stmdb sp!, {r3, lr}
	ldr r1, _0207ADC0 ; =_022B99A0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_0207AD38
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _0207ADC4 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _0207ADC8 ; =sub_0207ADDC
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl OS_SetIrqFunction
	mov r0, #8
	bl OS_EnableIrqMask
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207ADC0: .word _022B99A0
_0207ADC4: .word 0x04000102
_0207ADC8: .word sub_0207ADDC
	arm_func_end sub_0207AD54

	arm_func_start sub_0207ADCC
sub_0207ADCC: ; 0x0207ADCC
	ldr r0, _0207ADD8 ; =_022B99A0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207ADD8: .word _022B99A0
	arm_func_end sub_0207ADCC

	arm_func_start sub_0207ADDC
sub_0207ADDC: ; 0x0207ADDC
	ldr r0, _0207AE34 ; =_022B99A0
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207AE20
	ldr r2, _0207AE38 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_0207AE20:
	ldr ip, _0207AE3C ; =sub_02078BF4
	mov r0, #0
	ldr r1, _0207AE40 ; =sub_0207ADDC
	mov r2, r0
	bx ip
	.align 2, 0
_0207AE34: .word _022B99A0
_0207AE38: .word 0x04000102
_0207AE3C: .word sub_02078BF4
_0207AE40: .word sub_0207ADDC
	arm_func_end sub_0207ADDC

	arm_func_start sub_0207AE44
sub_0207AE44: ; 0x0207AE44
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl EnableIrqFlag
	ldr lr, _0207AED8 ; =0x04000100
	ldr r2, _0207AEDC ; =0x0000FFFF
	ldrh ip, [lr]
	ldr r3, _0207AEE0 ; =_022B99A0
	sub r1, r2, #0x10000
	strh ip, [sp]
	ldr ip, [r3, #8]
	ldr r3, [r3, #0xc]
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _0207AEB0
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _0207AEB0
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_0207AEB0:
	bl SetIrqFlag
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0207AED8: .word 0x04000100
_0207AEDC: .word 0x0000FFFF
_0207AEE0: .word _022B99A0
	arm_func_end sub_0207AE44

	arm_func_start GetTimer0Control
GetTimer0Control: ; 0x0207AEE4
	ldr r0, _0207AEF0 ; =0x04000100
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207AEF0: .word 0x04000100
	arm_func_end GetTimer0Control

	arm_func_start sub_0207AEF4
sub_0207AEF4: ; 0x0207AEF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	mov r3, r5, lsr #0x10
	mov ip, #1
	rsb r1, ip, #0x10000
	ldr lr, _0207AF58 ; =0x04000214
	mov r6, #8
	ldr r2, _0207AF5C ; =_022B99A0
	str r6, [lr]
	str ip, [r2, #4]
	orr r3, r3, r4, lsl #16
	str r3, [r2, #8]
	mov r4, r4, lsr #0x10
	ldr r3, _0207AF60 ; =0x04000102
	str r4, [r2, #0xc]
	mov r2, #0
	strh r2, [r3]
	and r1, r5, r1
	strh r1, [r3, #-2]
	mov r1, #0xc1
	strh r1, [r3]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AF58: .word 0x04000214
_0207AF5C: .word _022B99A0
_0207AF60: .word 0x04000102
	arm_func_end sub_0207AEF4

	arm_func_start sub_0207AF64
sub_0207AF64: ; 0x0207AF64
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_0207AE44
	ldr r3, _0207AFE0 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _0207AFE4 ; =sub_0207B270
	mov r0, #1
	bl sub_02078BF4
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _0207AFE8 ; =0x0000FFFE
	blt _0207AFC4
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	bge _0207AFC4
	mvn r0, r5
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
_0207AFC4:
	ldr r2, _0207AFEC ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207AFE0: .word 0x04000106
_0207AFE4: .word sub_0207B270
_0207AFE8: .word 0x0000FFFE
_0207AFEC: .word 0x04000104
	arm_func_end sub_0207AF64

	arm_func_start sub_0207AFF0
sub_0207AFF0: ; 0x0207AFF0
	stmdb sp!, {r3, lr}
	ldr r1, _0207B02C ; =_022B99B0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	bl sub_0207AD38
	ldr r1, _0207B02C ; =_022B99B0
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl OS_DisableIrqMask
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B02C: .word _022B99B0
	arm_func_end sub_0207AFF0

	arm_func_start sub_0207B030
sub_0207B030: ; 0x0207B030
	ldr r0, _0207B03C ; =_022B99B0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207B03C: .word _022B99B0
	arm_func_end sub_0207B030

	arm_func_start sub_0207B040
sub_0207B040: ; 0x0207B040
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0207B040

	arm_func_start sub_0207B050
sub_0207B050: ; 0x0207B050
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _0207B0C4
	bl sub_0207AE44
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _0207B0C4
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl _ll_udiv
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_0207B0C4:
	str r7, [r8, #0xc]
	ldr r0, _0207B178 ; =_022B99B0
	str r6, [r8, #0x10]
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0207B140
	mov r2, #0
	mov r1, r2
_0207B0E4:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _0207B134
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207B134:
	ldr r5, [r5, #0x18]
	cmp r5, #0
	bne _0207B0E4
_0207B140:
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207B178: .word _022B99B0
	arm_func_end sub_0207B050

	arm_func_start sub_0207B17C
sub_0207B17C: ; 0x0207B17C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _0207B1A0
	ldr r0, [r6]
	cmp r0, #0
	beq _0207B1A4
_0207B1A0:
	bl WaitForever2
_0207B1A4:
	bl EnableIrqFlag
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_0207AE44
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_0207B050
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207B17C

	arm_func_start sub_0207B1E8
sub_0207B1E8: ; 0x0207B1E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B20C
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B20C:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	bne _0207B22C
	ldr r2, [r5, #0x14]
	ldr r1, _0207B26C ; =_022B99B0
	str r2, [r1, #8]
_0207B22C:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _0207B250
	ldr r1, _0207B26C ; =_022B99B0
	cmp r0, #0
	str r0, [r1, #4]
	beq _0207B250
	bl sub_0207AF64
_0207B250:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B26C: .word _022B99B0
	arm_func_end sub_0207B1E8

	arm_func_start sub_0207B270
sub_0207B270: ; 0x0207B270
	stmdb sp!, {r0, lr}
	bl sub_0207B280
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_0207B270

	arm_func_start sub_0207B280
sub_0207B280: ; 0x0207B280
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0207B364 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl OS_DisableIrqMask
	ldr r0, _0207B368 ; =OS_IRQTable
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #0x10
	str r1, [r0, #0xff8]
	bl sub_0207AE44
	ldr r2, _0207B36C ; =_022B99B0
	ldr r4, [r2, #4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _0207B2E0
	mov r0, r4
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
_0207B2E0:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _0207B324
	ldr r0, [r4, #4]
	blx r5
_0207B324:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _0207B34C
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl sub_0207B050
_0207B34C:
	ldr r0, _0207B36C ; =_022B99B0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B364: .word 0x04000106
_0207B368: .word OS_IRQTable
_0207B36C: .word _022B99B0
	arm_func_end sub_0207B280

	arm_func_start OS_InitVAlarm
OS_InitVAlarm: ; 0x0207B370
	stmdb sp!, {r3, lr}
	ldr r1, _0207B3B4 ; =_022B99BC
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl OS_DisableIrqMask
	ldr r0, _0207B3B4 ; =_022B99BC
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B3B4: .word _022B99BC
	arm_func_end OS_InitVAlarm

	arm_func_start sub_0207B3B8
sub_0207B3B8: ; 0x0207B3B8
	stmdb sp!, {r3, lr}
	ldr r1, _0207B430 ; =_022B99BC
	ldr r3, [r1, #0xc]
	cmp r3, #0
	beq _0207B428
	ldr ip, [r0, #0xc]
_0207B3D0:
	ldr r1, [r3, #0xc]
	cmp r1, ip
	blo _0207B41C
	bne _0207B3F0
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _0207B41C
_0207B3F0:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	ldmneia sp!, {r3, pc}
	ldr r1, _0207B430 ; =_022B99BC
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
_0207B41C:
	ldr r3, [r3, #0x18]
	cmp r3, #0
	bne _0207B3D0
_0207B428:
	bl sub_0207B434
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B430: .word _022B99BC
	arm_func_end sub_0207B3B8

	arm_func_start sub_0207B434
sub_0207B434: ; 0x0207B434
	stmdb sp!, {r3, lr}
	ldr r1, _0207B468 ; =_022B99BC
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	ldmneia sp!, {r3, pc}
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B468: .word _022B99BC
	arm_func_end sub_0207B434

	arm_func_start sub_0207B46C
sub_0207B46C: ; 0x0207B46C
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0207B4A0: .word _022B99BC
	arm_func_end sub_0207B46C

	arm_func_start sub_0207B4A4
sub_0207B4A4: ; 0x0207B4A4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_0207B4A4

	arm_func_start sub_0207B4B8
sub_0207B4B8: ; 0x0207B4B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _0207B4E8
	ldr r0, [r8]
	cmp r0, #0
	beq _0207B4EC
_0207B4E8:
	bl WaitForever2
_0207B4EC:
	ldr r0, _0207B540 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_0207B790
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r1, [sp, #0x20]
	str r5, [r8]
	str r1, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_0207B3B8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0207B540: .word 0x04000006
	arm_func_end sub_0207B4B8

	arm_func_start sub_0207B544
sub_0207B544: ; 0x0207B544
	stmdb sp!, {r4, lr}
	ldr r1, _0207B57C ; =sub_0207B5CC
	mov r4, r0
	mov r0, #4
	bl OS_SetIrqFunction
	ldrsh r0, [r4, #0x10]
	bl GX_HBlankIntr
	ldr r2, _0207B580 ; =0x04000004
	mov r0, #4
	ldrh r1, [r2]
	orr r1, r1, #0x20
	strh r1, [r2]
	bl OS_EnableIrqMask
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B57C: .word sub_0207B5CC
_0207B580: .word 0x04000004
	arm_func_end sub_0207B544

	arm_func_start sub_0207B584
sub_0207B584: ; 0x0207B584
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B5B0
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B5B0:
	mov r0, r5
	bl sub_0207B46C
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207B584

	arm_func_start sub_0207B5CC
sub_0207B5CC: ; 0x0207B5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl OS_DisableIrqMask
	ldr r2, _0207B734 ; =0x04000004
	ldr r0, _0207B738 ; =OS_IRQTable
	ldrh r1, [r2]
	add r0, r0, #0x3000
	bic r1, r1, #0x20
	strh r1, [r2]
	ldr r1, [r0, #0xff8]
	orr r1, r1, #4
	str r1, [r0, #0xff8]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_0207B790
	ldr r4, _0207B73C ; =_022B99BC
	ldr sl, [r4, #0xc]
	cmp sl, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, _0207B740 ; =0x04000006
	mov fp, #4
	sub r6, sb, #2
	mov r5, #0
_0207B63C:
	ldrh r8, [sb]
	mov r0, r8
	bl sub_0207B790
	mov r7, r0
	mov r0, sl
	mov r1, r7
	mov r2, r8
	bl sub_0207B744
	cmp r0, #0
	beq _0207B678
	cmp r0, #1
	beq _0207B6B4
	cmp r0, #2
	beq _0207B708
	b _0207B724
_0207B678:
	mov r0, sl
	bl sub_0207B544
	ldrh r1, [sb]
	ldrsh r0, [sl, #0x10]
	cmp r0, r1
	ldreq r0, [sl, #0xc]
	cmpeq r0, r7
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, fp
	bl OS_DisableIrqMask
	ldrh r1, [r6]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r6]
	bl OS_ResetRequestIrqMask
_0207B6B4:
	ldr r7, [sl]
	mov r0, sl
	bl sub_0207B46C
	str r5, [sl]
	cmp r7, #0
	beq _0207B6D4
	ldr r0, [sl, #4]
	blx r7
_0207B6D4:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _0207B724
	ldr r0, [sl, #0x24]
	cmp r0, #0
	bne _0207B724
	str r7, [sl]
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
	b _0207B724
_0207B708:
	mov r0, sl
	bl sub_0207B46C
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
_0207B724:
	ldr sl, [r4, #0xc]
	cmp sl, #0
	bne _0207B63C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207B734: .word 0x04000004
_0207B738: .word OS_IRQTable
_0207B73C: .word _022B99BC
_0207B740: .word 0x04000006
	arm_func_end sub_0207B5CC

	arm_func_start sub_0207B744
sub_0207B744: ; 0x0207B744
	ldrsh r3, [r0, #0x10]
	ldr ip, [r0, #0xc]
	subs r1, r1, ip
	sub r2, r2, r3
	bmi _0207B768
	cmp r1, #0
	bne _0207B770
	cmp r2, #0
	bge _0207B770
_0207B768:
	mov r0, #0
	bx lr
_0207B770:
	ldrsh r0, [r0, #0x12]
	cmp r2, #0
	addlt r1, r2, #7
	addlt r2, r1, #0x100
	cmp r2, r0
	movle r0, #1
	movgt r0, #2
	bx lr
	arm_func_end sub_0207B744

	arm_func_start sub_0207B790
sub_0207B790: ; 0x0207B790
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207B7CC ; =_022B99BC
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _0207B7CC ; =_022B99BC
	str r4, [r1, #4]
	bl SetIrqFlag
	ldr r0, _0207B7CC ; =_022B99BC
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B7CC: .word _022B99BC
	arm_func_end sub_0207B790

