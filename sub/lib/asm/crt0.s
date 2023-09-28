	.include "asm/macros.inc"
	.include "lib/asm/include/crt0.inc"

	.text

	arm_func_start _start
_start: ; 0x02380000
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _023800E4 ; =SDK_AUTOLOAD_START
	mov r0, #0x3800000
	cmp r0, r1
	bpl _0238001C
	b _02380020
_0238001C:
	mov r1, r0
_02380020:
	ldr r2, _023800E8 ; =0x0380FF00
	mov r0, #0
_02380028:
	cmp r1, r2
	blt _02380034
	b _02380038
_02380034:
	stmia r1!, {r0}
_02380038:
	blt _02380028
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _023800EC ; =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _023800F0 ; =0x0380FF80
	mov sp, r0
	ldr r1, _023800F4 ; =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _023800F8 ; =0x023FE940
	ldr r1, _023800FC ; =0x027FFA80
	add r2, r1, #0x160
_02380078:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380078
	ldr r0, _02380100 ; =0x023FE904
	add r2, r1, #0x20
_02380090:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02380090
	bl do_autoload
	ldr r0, _02380104 ; =_start_ModuleParams
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_023800B4:
	cmp r1, r2
	blo _023800C0
	b _023800C4
_023800C0:
	str r0, [r1], #4
_023800C4:
	blo _023800B4
	bl sub_0238018C
	ldr r1, _02380108 ; =0x0380FFFC
	ldr r0, _0238010C ; =sub_037FB488
	str r0, [r1]
	ldr r1, _02380110 ; =sub_037F8000
	ldr lr, _02380114 ; =0xFFFF0000
	bx r1
	.align 2, 0
_023800E4: .word SDK_AUTOLOAD_START
_023800E8: .word 0x0380FF00
_023800EC: .word 0x0380FFC0
_023800F0: .word 0x0380FF80
_023800F4: .word 0x00000400
_023800F8: .word 0x023FE940
_023800FC: .word 0x027FFA80
_02380100: .word 0x023FE904
_02380104: .word _start_ModuleParams
_02380108: .word 0x0380FFFC
_0238010C: .word sub_037FB488
_02380110: .word sub_037F8000
_02380114: .word 0xFFFF0000
	arm_func_end _start

	arm_func_start do_autoload
do_autoload: ; 0x02380118
	ldr r0, _02380184 ; =_start_ModuleParams
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02380128:
	cmp r1, r2
	beq _02380180
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_0238013C:
	cmp r4, r6
	bmi _02380148
	b _0238014C
_02380148:
	ldr r7, [r3], #4
_0238014C:
	bmi _02380154
	b _02380158
_02380154:
	str r7, [r4], #4
_02380158:
	bmi _0238013C
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_02380168:
	cmp r4, r6
	blo _02380174
	b _02380178
_02380174:
	str r7, [r4], #4
_02380178:
	blo _02380168
	beq _02380128
_02380180:
	b _start_AutoloadDoneCallback
	.align 2, 0
_02380184: .word _start_ModuleParams
	arm_func_end do_autoload

	arm_func_start _start_AutoloadDoneCallback
_start_AutoloadDoneCallback: ; 0x02380188
	bx lr
	arm_func_end _start_AutoloadDoneCallback

	arm_func_start sub_0238018C
sub_0238018C: ; 0x0238018C
	mov r0, #1
	mov r1, #0
	ldr r2, _023801CC ; =0x027FFFFA
	sub r3, r2, #0x400000
_0238019C:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	bne _023801B0
	b _023801B4
_023801B0:
	mov r0, #2
_023801B4:
	bne _023801C4
	add r1, r1, #1
	cmp r1, #2
	bne _0238019C
_023801C4:
	strh r0, [r2]
	bx lr
	.align 2, 0
_023801CC: .word 0x027FFFFA
	arm_func_end sub_0238018C
_start_ModuleParams:
	.word SDK_AUTOLOAD_LIST
	.word SDK_AUTOLOAD_LIST_END
	.word SDK_AUTOLOAD_START
	.word SDK_STATIC_BSS_START
	.word SDK_STATIC_BSS_END
