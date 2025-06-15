	.include "asm/macros.inc"
	.include "overlay_29_022DC314.inc"

	.text

	arm_func_start ov29_022DC314
ov29_022DC314: ; 0x022DC314
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022DC338 ; =ov29_0234FD14
	mov r4, r1
	bl Debug_Print0
	mov r0, r5
	mov r1, r4
	bl sub_02008BF4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DC338: .word ov29_0234FD14
	arm_func_end ov29_022DC314

	arm_func_start ov29_022DC33C
ov29_022DC33C: ; 0x022DC33C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _022DC52C ; =0x00019628
	mov r6, r0
	ldrh r0, [r6, r1]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, _022DC530 ; =ov29_02353880
	mov r1, #0
	ldrh r4, [r2, #0x14]
	ldrh r3, [sp]
	mov r0, #0x1000
	bic r4, r4, #0x700
	bic r3, r3, #0x700
	orr r4, r4, #0x200
	orr r3, r3, #0x200
	strh r4, [r2, #0x14]
	strh r3, [sp]
	ldrh r5, [r2, #0x14]
	ldrh r4, [sp]
	ldr r3, _022DC534 ; =_020AFC70
	bic r5, r5, #7
	bic r4, r4, #7
	orr r5, r5, #5
	orr r4, r4, #5
	strh r5, [r2, #0x14]
	ldrh r5, [r2, #0x14]
	strh r4, [sp]
	ldrh r4, [sp]
	ldr r7, _022DC538 ; =0x00007FFF
	bic r5, r5, #0x38
	orr r8, r5, #0x28
	bic r4, r4, #0x38
	mov r5, #0x1f
	orr r4, r4, #0x28
	ldr r3, [r3]
	strh r1, [r2, #0x16]
	strh r1, [r2, #0x18]
	strh r1, [r2, #0x1a]
	strh r1, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	strh r1, [r2, #0x24]
	str r1, [r2, #4]
	str r1, [r2, #8]
	strb r1, [r2, #0x26]
	strh r1, [r2, #2]
	strh r8, [r2, #0x14]
	strh r7, [r2, #0x22]
	strb r5, [r2, #0x27]
	strh r4, [sp]
	ldr r4, [r3, #0xe0]
	add r0, sp, #0
	mov r1, #0x1b000
	bl Render3dSetTextureParams
	add r0, sp, #0
	add r1, r4, #0x3c00
	bl Render3dSetPaletteBase
	ldr r0, _022DC53C ; =0x00018304
	mov r5, #0
	ldr r4, _022DC530 ; =ov29_02353880
	add fp, r0, #2
	add r7, r0, #4
	add r8, r0, #6
	add sb, r0, #8
	add sl, r0, #0xa
	b _022DC518
_022DC454:
	mov r0, #0xe
	smlabb r3, r5, r0, r6
	add r0, r3, #0x18000
	ldrb r1, [r0, #0x311]
	cmp r1, #0
	beq _022DC50C
	ldrb r2, [r0, #0x310]
	ldr r0, _022DC53C ; =0x00018304
	ldrsh r1, [r3, r0]
	ldrh r0, [r4, #0x14]
	and ip, r2, #3
	strh r1, [r4, #0x16]
	bic r0, r0, #0x700
	orr r1, r0, #0x200
	ldr r0, _022DC540 ; =ov29_0234FD04
	ldrsh lr, [r3, fp]
	ldrb r2, [r0, ip, lsl #2]
	add ip, r0, ip, lsl #2
	strh lr, [r4, #0x18]
	and r0, r2, #0xf8
	ldrsh r2, [r3, r7]
	ldrb lr, [ip, #2]
	ldrb ip, [ip, #1]
	strh r2, [r4, #0xc]
	and r2, lr, #0xf8
	and ip, ip, #0xf8
	mov r2, r2, lsl #0x17
	mov ip, ip, lsl #2
	orr r2, ip, r2, lsr #16
	ldrsh ip, [r3, r8]
	orr r2, r2, r0, asr #3
	mov r0, r4
	strh ip, [r4, #0xe]
	ldrsh ip, [r3, sb]
	strh ip, [r4, #0x10]
	ldrsh r3, [r3, sl]
	strh r1, [r4, #0x14]
	mov r1, #0
	strh r1, [r4, #2]
	mov r1, #0x1f
	strb r1, [r4, #0x27]
	mov r1, #3
	strh r3, [r4, #0x12]
	strh r2, [r4, #0x22]
	strh r1, [r4]
	bl Render3dTextureNoSetup
_022DC50C:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022DC518:
	ldr r0, _022DC52C ; =0x00019628
	ldrh r0, [r6, r0]
	cmp r5, r0
	blt _022DC454
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DC52C: .word 0x00019628
_022DC530: .word ov29_02353880
_022DC534: .word _020AFC70
_022DC538: .word 0x00007FFF
_022DC53C: .word 0x00018304
_022DC540: .word ov29_0234FD04
	arm_func_end ov29_022DC33C

	arm_func_start ov29_022DC544
ov29_022DC544: ; 0x022DC544
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022DC604 ; =ov29_023534E8
	mov r2, #0x300
	ldr r1, [r1, r0, lsl #2]
	add r0, sp, #0
	bl LoadFileFromRom
	ldr r4, [sp]
	ldr r2, [sp, #4]
	mov r0, r4
	mov r1, #0x1b000
	mov r3, #0
	bl sub_0201E050
	mov r1, #0
	mov r0, r4
	mov r2, r1
	mov r3, #2
	bl sub_0201E050
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC60C ; =ov29_0234FD48
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #0
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC610 ; =ov29_0234FD4C
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #1
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC614 ; =ov29_0234FD50
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #2
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC618 ; =ov29_0234FD54
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #3
	bl sub_0201E380
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DC604: .word ov29_023534E8
_022DC608: .word _020AFC70
_022DC60C: .word ov29_0234FD48
_022DC610: .word ov29_0234FD4C
_022DC614: .word ov29_0234FD50
_022DC618: .word ov29_0234FD54
	arm_func_end ov29_022DC544
