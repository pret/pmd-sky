	.include "asm/macros.inc"
	.include "main_0200A124.inc"

	.text

	arm_func_start sub_0200A124
sub_0200A124: ; 0x0200A124
	stmdb sp!, {r4, lr}
	mov r4, r0
	stmia r4, {r1, r2}
	mov r0, #0
	strb r0, [r4, #8]
	ldr r1, [sp, #8]
	str r3, [r4, #0xc]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r4, #0x10]
	mov r0, r4
	bl sub_0200A274
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A124

	arm_func_start sub_0200A158
sub_0200A158: ; 0x0200A158
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A158

	arm_func_start sub_0200A174
sub_0200A174: ; 0x0200A174
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A174

	arm_func_start sub_0200A180
sub_0200A180: ; 0x0200A180
	bx lr
	arm_func_end sub_0200A180

	arm_func_start sub_0200A184
sub_0200A184: ; 0x0200A184
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x10]
	ldr r1, [r6, #4]
	mov r0, r4
	mov r1, r1, lsl #1
	ldr r5, [r6, #0xc]
	bl DC_FlushRange
	ldr r0, [r6]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0200A1D4
_0200A1C0: ; jump table
	b _0200A1D4 ; case 0
	b _0200A1EC ; case 1
	b _0200A20C ; case 2
	b _0200A22C ; case 3
	b _0200A24C ; case 4
_0200A1D4:
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	b _0200A268
_0200A1EC:
	bl GX_BeginLoadBGExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0200A268
_0200A20C:
	bl GX_BeginLoadOBJExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0200A268
_0200A22C:
	bl GXS_BeginLoadBGExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0200A268
_0200A24C:
	bl GXS_BeginLoadOBJExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0200A268:
	mov r0, #0
	strb r0, [r6, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A184

	arm_func_start sub_0200A274
sub_0200A274: ; 0x0200A274
	mov r3, #0
	ldr ip, [r0, #0x10]
	mov r2, r3
	b _0200A28C
_0200A284:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A28C:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A284
	bx lr
	arm_func_end sub_0200A274

	arm_func_start sub_0200A29C
sub_0200A29C: ; 0x0200A29C
	ldr r0, [r0, #0x10]
	ldr ip, _0200A2B0 ; =Rgb8ToRgb5
	add r0, r0, r1, lsl #1
	mov r1, r2
	bx ip
	.align 2, 0
_0200A2B0: .word Rgb8ToRgb5
	arm_func_end sub_0200A29C

	arm_func_start sub_0200A2B4
sub_0200A2B4: ; 0x0200A2B4
	ldr r3, [r0, #0x10]
	ldr ip, _0200A2C8 ; =sub_02004FF8
	mov r0, r1
	add r1, r3, r2, lsl #1
	bx ip
	.align 2, 0
_0200A2C8: .word sub_02004FF8
	arm_func_end sub_0200A2B4

	arm_func_start sub_0200A2CC
sub_0200A2CC: ; 0x0200A2CC
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A2CC

	arm_func_start sub_0200A2F4
sub_0200A2F4: ; 0x0200A2F4
	mov r1, #0
_0200A2F8:
	ldr r2, [r0, #0x24]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	cmp r2, #0
	movne r0, r2
	bne _0200A2F8
	bx lr
	arm_func_end sub_0200A2F4
_0200A314:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	beq _0200A330
	cmp r2, r1
	bxeq lr
	mov r0, r2
	b _0200A314
_0200A330:
	str r1, [r0, #0x24]
	str r0, [r1, #0x20]
	mov r0, #0
	str r0, [r1, #0x24]
	bx lr
_0200A344:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	bxeq lr
	cmp r2, r1
	movne r0, r2
	bne _0200A344
	ldr r2, [r1, #0x24]
	str r2, [r0, #0x24]
	cmp r2, #0
	strne r0, [r2, #0x20]
	mov r0, #0
	str r0, [r1, #0x20]
	str r0, [r1, #0x24]
	bx lr

	arm_func_start sub_0200A37C
sub_0200A37C: ; 0x0200A37C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r4, [r0, #0x24]
	b _0200A39C
_0200A38C:
	mov r0, r4
	mov r1, r5
	bl sub_0200A618
	ldr r4, [r4, #0x24]
_0200A39C:
	cmp r4, #0
	bne _0200A38C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A37C

	arm_func_start sub_0200A3A8
sub_0200A3A8: ; 0x0200A3A8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A3D0
_0200A3BC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A64C
	ldr r4, [r4, #0x24]
_0200A3D0:
	cmp r4, #0
	bne _0200A3BC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3A8

	arm_func_start sub_0200A3DC
sub_0200A3DC: ; 0x0200A3DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A404
_0200A3F0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A688
	ldr r4, [r4, #0x24]
_0200A404:
	cmp r4, #0
	bne _0200A3F0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3DC

	arm_func_start sub_0200A410
sub_0200A410: ; 0x0200A410
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A438
_0200A424:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A6C4
	ldr r4, [r4, #0x24]
_0200A438:
	cmp r4, #0
	bne _0200A424
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A410

	arm_func_start sub_0200A444
sub_0200A444: ; 0x0200A444
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A46C
_0200A458:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A700
	ldr r4, [r4, #0x24]
_0200A46C:
	cmp r4, #0
	bne _0200A458
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A444

	arm_func_start sub_0200A478
sub_0200A478: ; 0x0200A478
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	str r5, [r6]
	ldr r1, [sp, #0x10]
	str r3, [r6, #4]
	mov r0, r3, lsl #2
	mov r4, r2
	bl MemAlloc
	str r0, [r6, #0x18]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, r0, r4, lsl #1
	str r0, [r6, #0x1c]
	str r1, [r6, #0x20]
	mov r0, r6
	str r1, [r6, #0x24]
	bl sub_0200A544
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A478

	arm_func_start sub_0200A4C4
sub_0200A4C4: ; 0x0200A4C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	cmp r1, #0
	strne r2, [r1, #0x24]
	cmp r2, #0
	strne r1, [r2, #0x20]
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A4C4

	arm_func_start sub_0200A504
sub_0200A504: ; 0x0200A504
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A504

	arm_func_start sub_0200A510
sub_0200A510: ; 0x0200A510
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4, #8]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	strb r0, [r4, #8]
	ldr r0, [r4]
	mov r1, #1
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A510

	arm_func_start sub_0200A544
sub_0200A544: ; 0x0200A544
	mov ip, #0
	ldr r3, [r0, #0x18]
	mov r2, ip
	b _0200A56C
_0200A554:
	mov r1, r3
	strb r2, [r3], #4
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	add ip, ip, #1
_0200A56C:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200A554
	ldr r2, _0200A58C ; =sub_0200A73C
	mov r1, #1
	str r2, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A58C: .word sub_0200A73C
	arm_func_end sub_0200A544

	arm_func_start sub_0200A590
sub_0200A590: ; 0x0200A590
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r1, r0, r1, lsl #2
_0200A59C:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A59C
	bx lr
	arm_func_end sub_0200A590

	arm_func_start sub_0200A5B0
sub_0200A5B0: ; 0x0200A5B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x18]
	mov lr, #0
	add ip, r0, r1, lsl #2
	b _0200A5EC
_0200A5C4:
	mov r4, r2
	mov r5, ip
	add r2, r2, #4
	add ip, ip, #4
	mov r1, #4
_0200A5D8:
	ldrb r0, [r4], #1
	subs r1, r1, #1
	strb r0, [r5], #1
	bne _0200A5D8
	add lr, lr, #1
_0200A5EC:
	cmp lr, r3
	blt _0200A5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A5B0

	arm_func_start sub_0200A5F8
sub_0200A5F8: ; 0x0200A5F8
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r2, r0, r2, lsl #2
_0200A604:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A604
	bx lr
	arm_func_end sub_0200A5F8

	arm_func_start sub_0200A618
sub_0200A618: ; 0x0200A618
	strh r1, [r0, #0xa]
	mov r2, #0
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	ldr r1, _0200A648 ; =sub_0200A78C
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A648: .word sub_0200A78C
	arm_func_end sub_0200A618

	arm_func_start sub_0200A64C
sub_0200A64C: ; 0x0200A64C
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A658:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A658
	mov r2, #0
	ldr r1, _0200A684 ; =sub_0200A9E4
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A684: .word sub_0200A9E4
	arm_func_end sub_0200A64C

	arm_func_start sub_0200A688
sub_0200A688: ; 0x0200A688
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A694:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A694
	mov r2, #0
	ldr r1, _0200A6C0 ; =sub_0200ACB0
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6C0: .word sub_0200ACB0
	arm_func_end sub_0200A688

	arm_func_start sub_0200A6C4
sub_0200A6C4: ; 0x0200A6C4
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A6D0:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A6D0
	mov r2, #0
	ldr r1, _0200A6FC ; =TransformPaletteDataWithFlushDivideFade
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6FC: .word TransformPaletteDataWithFlushDivideFade
	arm_func_end sub_0200A6C4

	arm_func_start sub_0200A700
sub_0200A700: ; 0x0200A700
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A70C:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A70C
	mov r2, #0
	ldr r1, _0200A738 ; =sub_0200B0AC
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A738: .word sub_0200B0AC
	arm_func_end sub_0200A700

	arm_func_start sub_0200A73C
sub_0200A73C: ; 0x0200A73C
	stmdb sp!, {r4, lr}
	ldr ip, [r0, #0x18]
	ldr lr, [r0, #0x1c]
	mov r4, #0
	b _0200A77C
_0200A750:
	ldrb r1, [ip, #1]
	ldrb r2, [ip, #2]
	ldrb r3, [ip], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r3, r3, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r3, asr #3
	strh r1, [lr], #2
	add r4, r4, #1
_0200A77C:
	ldr r1, [r0, #4]
	cmp r4, r1
	blt _0200A750
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A73C

	arm_func_start sub_0200A78C
sub_0200A78C: ; 0x0200A78C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r2, [r0, #0xa]
	ldr r1, [r0]
	ldr r3, [r0, #0x18]
	cmp r2, #0x100
	ldr r1, [r1]
	ldr ip, [r0, #0x1c]
	blo _0200A7F0
	mov r5, #0
	b _0200A7E0
_0200A7B4:
	ldrb r1, [r3, #1]
	ldrb r2, [r3, #2]
	ldrb r4, [r3], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r4, r4, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add r5, r5, #1
_0200A7E0:
	ldr r1, [r0, #4]
	cmp r5, r1
	blt _0200A7B4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A7F0:
	cmp r2, #0
	bne _0200A898
	cmp r1, #2
	bne _0200A874
	mov lr, #0
	mov r1, lr
	mov r2, lr
	b _0200A864
_0200A810:
	mov r4, r2
_0200A814:
	add r4, r4, #1
	cmp r4, #0xf0
	strh r1, [ip], #2
	add lr, lr, #1
	blt _0200A814
	mov r4, r1
_0200A82C:
	ldrb r5, [r3, #1]
	ldrb r6, [r3, #2]
	ldrb r7, [r3], #4
	and r5, r5, #0xf8
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	add r4, r4, #1
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	cmp r4, #0x10
	strh r5, [ip], #2
	add lr, lr, #1
	blt _0200A82C
_0200A864:
	ldr r4, [r0, #4]
	cmp lr, r4
	blt _0200A810
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A874:
	mov r3, #0
	mov r2, r3
	b _0200A888
_0200A880:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A888:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A880
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A898:
	cmp r1, #2
	mov lr, #0
	bne _0200A9D4
	b _0200A95C
_0200A8A8:
	mov r4, #0
_0200A8AC:
	ldrb r1, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	mul r7, r1, r2
	mul r8, r5, r2
	mul r1, r6, r2
	mov r5, r7, asr #7
	add r7, r7, r5, lsr #24
	mov r6, r8, asr #7
	mov r5, r1, asr #7
	add r1, r1, r5, lsr #24
	add r6, r8, r6, lsr #24
	mov r1, r1, lsl #8
	add r4, r4, #1
	mov r7, r7, lsl #8
	mov r5, r6, lsl #8
	mov r6, r7, lsr #0x10
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r1, lsr #0x10
	mov r1, r5, lsl #2
	and r6, r7, #0xf8
	and r5, r8, #0xf8
	orr r1, r1, r6, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [ip], #2
	cmp r4, #0xf0
	add lr, lr, #1
	blt _0200A8AC
	mov r1, #0
_0200A924:
	ldrb r4, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	and r4, r4, #0xf8
	and r5, r5, #0xf8
	mov r4, r4, lsl #2
	add r1, r1, #1
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	cmp r1, #0x10
	strh r4, [ip], #2
	add lr, lr, #1
	blt _0200A924
_0200A95C:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A8A8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A96C:
	ldrb r1, [r3, #1]
	ldrb r4, [r3, #2]
	ldrb r5, [r3], #4
	mul r6, r1, r2
	mul r7, r4, r2
	mul r1, r5, r2
	mov r4, r6, asr #7
	add r6, r6, r4, lsr #24
	mov r5, r7, asr #7
	mov r4, r1, asr #7
	add r1, r1, r4, lsr #24
	add r5, r7, r5, lsr #24
	mov r1, r1, lsl #8
	mov r6, r6, lsl #8
	mov r4, r5, lsl #8
	mov r5, r6, lsr #0x10
	mov r6, r4, lsr #0x10
	and r4, r5, #0xf8
	mov r7, r1, lsr #0x10
	mov r1, r4, lsl #2
	and r5, r6, #0xf8
	and r4, r7, #0xf8
	orr r1, r1, r5, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add lr, lr, #1
_0200A9D4:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A96C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200A78C

	arm_func_start sub_0200A9E4
sub_0200A9E4: ; 0x0200A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, [r0]
	ldrh r5, [r0, #0xa]
	ldr r1, [r1]
	add r4, sp, #0
	add r6, r0, #0xc
	mov r3, #4
_0200AA00:
	ldrb r2, [r6], #1
	subs r3, r3, #1
	strb r2, [r4], #1
	bne _0200AA00
	cmp r5, #0x100
	ldr r2, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AA64
	mov r6, #0
	b _0200AA54
_0200AA28:
	ldrb r1, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r5, [r2], #4
	and r1, r1, #0xf8
	and r3, r3, #0xf8
	mov r1, r1, lsl #2
	and r5, r5, #0xf8
	orr r1, r1, r3, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [r4], #2
	add r6, r6, #1
_0200AA54:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AA28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AA64:
	cmp r5, #0
	bne _0200AB38
	ldrb r3, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r3, r3, #0xf8
	and r5, r5, #0xf8
	mov r3, r3, lsl #2
	and r6, r6, #0xf8
	orr r3, r3, r5, lsl #7
	orr r3, r3, r6, asr #3
	mov r3, r3, lsl #0x10
	cmp r1, #2
	mov r5, r3, lsr #0x10
	bne _0200AB18
	mov r6, #0
	mov r3, r6
	mov r1, r6
	b _0200AB08
_0200AAB0:
	mov r7, r3
_0200AAB4:
	add r7, r7, #1
	cmp r7, #0xf0
	strh r5, [r4], #2
	add r2, r2, #4
	add r6, r6, #1
	blt _0200AAB4
	mov r7, r1
_0200AAD0:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb sl, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	add r7, r7, #1
	and sl, sl, #0xf8
	orr r8, r8, sb, lsl #7
	orr r8, r8, sl, asr #3
	cmp r7, #0x10
	strh r8, [r4], #2
	add r6, r6, #1
	blt _0200AAD0
_0200AB08:
	ldr r7, [r0, #4]
	cmp r6, r7
	blt _0200AAB0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB18:
	mov r2, #0
	b _0200AB28
_0200AB20:
	strh r5, [r4], #2
	add r2, r2, #1
_0200AB28:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AB20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB38:
	rsb r3, r5, #0x100
	mov r3, r3, lsl #0x10
	ldrb r8, [sp]
	mov sb, r3, lsr #0x10
	ldrb r7, [sp, #1]
	ldrb r6, [sp, #2]
	mul r3, r8, sb
	mul ip, r7, sb
	mul lr, r6, sb
	cmp r1, #2
	bne _0200AC30
	mov r6, #0
	b _0200AC20
_0200AB6C:
	mov r7, #0
_0200AB70:
	ldrb r1, [r2, #1]
	ldrb fp, [r2, #2]
	ldrb sb, [r2], #4
	mla sl, r1, r5, ip
	mla r8, fp, r5, lr
	mla r1, sb, r5, r3
	mov sb, sl, asr #7
	add sb, sl, sb, lsr #24
	mov fp, r8, asr #7
	add r8, r8, fp, lsr #24
	mov sl, r1, asr #7
	mov sb, sb, lsl #8
	add r1, r1, sl, lsr #24
	mov r8, r8, lsl #8
	mov r1, r1, lsl #8
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	mov sb, sb, lsr #0x10
	mov sl, r8, lsr #0x10
	and r8, sb, #0xf8
	and sb, sl, #0xf8
	mov r8, r8, lsl #2
	and r1, r1, #0xf8
	orr r8, r8, sb, lsl #7
	orr r1, r8, r1, asr #3
	strh r1, [r4], #2
	cmp r7, #0xf0
	add r6, r6, #1
	blt _0200AB70
	mov r7, #0
_0200ABE8:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb r1, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	and sl, r1, #0xf8
	orr r1, r8, sb, lsl #7
	add r7, r7, #1
	orr r1, r1, sl, asr #3
	cmp r7, #0x10
	strh r1, [r4], #2
	add r6, r6, #1
	blt _0200ABE8
_0200AC20:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AB6C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AC30:
	mov r7, #0
	b _0200ACA0
_0200AC38:
	ldrb r1, [r2, #1]
	ldrb r6, [r2, #2]
	ldrb r8, [r2], #4
	mla sl, r1, r5, ip
	mla r1, r6, r5, lr
	mla r6, r8, r5, r3
	mov r8, sl, asr #7
	add sl, sl, r8, lsr #24
	mov sb, r1, asr #7
	mov r8, r6, asr #7
	add sb, r1, sb, lsr #24
	add r1, r6, r8, lsr #24
	mov sl, sl, lsl #8
	mov r6, sb, lsl #8
	mov r8, sl, lsr #0x10
	mov r1, r1, lsl #8
	mov sb, r6, lsr #0x10
	and r6, r8, #0xf8
	mov sl, r1, lsr #0x10
	mov r1, r6, lsl #2
	and r8, sb, #0xf8
	and r6, sl, #0xf8
	orr r1, r1, r8, lsl #7
	orr r1, r1, r6, asr #3
	strh r1, [r4], #2
	add r7, r7, #1
_0200ACA0:
	ldr r1, [r0, #4]
	cmp r7, r1
	blt _0200AC38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200A9E4

	arm_func_start sub_0200ACB0
sub_0200ACB0: ; 0x0200ACB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r1, [r0]
	ldrh r2, [r0, #0xa]
	ldr r1, [r1]
	add r5, sp, #0
	add r6, r0, #0xc
	mov r4, #4
_0200ACD0:
	ldrb r3, [r6], #1
	subs r4, r4, #1
	strb r3, [r5], #1
	bne _0200ACD0
	cmp r2, #0x100
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AD20
	ldrb r2, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r2, r2, #0xf8
	and r5, r5, #0xf8
	mov r2, r2, lsl #2
	and r6, r6, #0xf8
	orr r2, r2, r5, lsl #7
	orr r2, r2, r6, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	b _0200AD94
_0200AD20:
	cmp r2, #0
	moveq ip, #0
	beq _0200AD94
	ldrb r5, [sp, #1]
	ldrb r7, [sp, #2]
	ldrb ip, [sp]
	mul r6, r5, r2
	mul r8, r7, r2
	mul r7, ip, r2
	mov r2, r6, asr #7
	mov r5, r8, asr #7
	add ip, r6, r2, lsr #24
	mov r2, r7, asr #7
	add r5, r8, r5, lsr #24
	mov ip, ip, lsl #8
	add r2, r7, r2, lsr #24
	mov r5, r5, lsl #8
	mov r6, ip, lsr #0x10
	mov r2, r2, lsl #8
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r2, lsr #0x10
	and r6, r7, #0xf8
	mov r2, r5, lsl #2
	and r5, r8, #0xf8
	orr r2, r2, r6, lsl #7
	orr r2, r2, r5, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
_0200AD94:
	cmp r1, #2
	bne _0200AE14
	mov lr, #0
	mov r2, lr
	mov r1, lr
	b _0200AE04
_0200ADAC:
	mov r5, r2
_0200ADB0:
	add r5, r5, #1
	cmp r5, #0xf0
	strh ip, [r4], #2
	add r3, r3, #4
	add lr, lr, #1
	blt _0200ADB0
	mov r5, r1
_0200ADCC:
	ldrb r6, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r8, [r3], #4
	and r6, r6, #0xf8
	and r7, r7, #0xf8
	mov r6, r6, lsl #2
	add r5, r5, #1
	and r8, r8, #0xf8
	orr r6, r6, r7, lsl #7
	orr r6, r6, r8, asr #3
	cmp r5, #0x10
	strh r6, [r4], #2
	add lr, lr, #1
	blt _0200ADCC
_0200AE04:
	ldr r5, [r0, #4]
	cmp lr, r5
	blt _0200ADAC
	b _0200AE30
_0200AE14:
	mov r2, #0
	b _0200AE24
_0200AE1C:
	strh ip, [r4], #2
	add r2, r2, #1
_0200AE24:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AE1C
_0200AE30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200ACB0

; https://decomp.me/scratch/xdMiD
	arm_func_start TransformPaletteDataWithFlushDivideFade
TransformPaletteDataWithFlushDivideFade: ; 0x0200AE38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r1, [sl]
	ldrh r0, [sl, #0xa]
	ldr fp, [r1]
	add r3, sp, #0x14
	add r4, sl, #0xc
	mov r2, #4
_0200AE5C:
	ldrb r1, [r4], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _0200AE5C
	cmp r0, #0x100
	ldr r4, [sl, #0x18]
	ldr r5, [sl, #0x1c]
	blo _0200AEC0
	mov r3, #0
	b _0200AEB0
_0200AE84:
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r4], #4
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	and r2, r2, #0xf8
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [r5], #2
	add r3, r3, #1
_0200AEB0:
	ldr r0, [sl, #4]
	cmp r3, r0
	blt _0200AE84
	b _0200B0A4
_0200AEC0:
	ldrb sb, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	ldrb r3, [sp, #0x16]
	rsb r6, sb, #0xff
	mul r8, r6, r0
	rsb r2, r7, #0xff
	mov ip, r8, asr #7
	add r8, r8, ip, lsr #24
	add r8, sb, r8, asr #8
	rsb r1, r3, #0xff
	mul r6, r2, r0
	mul r2, r1, r0
	mov r0, r6, asr #7
	mov r1, r2, asr #7
	add r0, r6, r0, lsr #24
	add r1, r2, r1, lsr #24
	add r6, r7, r0, asr #8
	add r2, r3, r1, asr #8
	mov r0, r8, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r2, r2, lsl #0x10
	cmp fp, #2
	mov r8, r0, lsr #0x10
	mov r6, r1, lsr #0x10
	mov r7, r2, lsr #0x10
	mov sb, #0
	bne _0200B098
	b _0200B004
_0200AF30:
	mov fp, #0
_0200AF34:
	ldrb r2, [r4]
	str r5, [sp]
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r6
	bl _s32_div_f
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add sb, sb, #1
	blt _0200AF34
	mov r1, #0
_0200AFCC:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r5], #2
	add sb, sb, #1
	blt _0200AFCC
_0200B004:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200AF30
	b _0200B0A4
_0200B014:
	ldrb r2, [r4]
	mov fp, r5
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r6
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add sb, sb, #1
_0200B098:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200B014
_0200B0A4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end TransformPaletteDataWithFlushDivideFade

	arm_func_start sub_0200B0AC
sub_0200B0AC: ; 0x0200B0AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r0, [sl]
	ldrh r3, [sl, #0xa]
	ldr r2, [r0]
	add r4, sp, #0x14
	add r5, sl, #0xc
	mov r1, #4
_0200B0D0:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r4], #1
	bne _0200B0D0
	ldrb r0, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	cmp r3, #0x100
	movhs r3, #0x100
	ldrb r5, [sp, #0x16]
	mul r1, r0, r3
	mul r0, r7, r3
	mul r8, r5, r3
	mov r3, r1, asr #7
	mov r5, r0, asr #7
	add r1, r1, r3, lsr #24
	add r3, r0, r5, lsr #24
	mov r0, r1, lsl #8
	mov r7, r8, asr #7
	add r5, r8, r7, lsr #24
	mov r1, r3, lsl #8
	mov r3, r5, lsl #8
	ldr r4, [sl, #0x18]
	ldr r6, [sl, #0x1c]
	cmp r2, #2
	mov sb, r0, lsr #0x10
	mov r7, r1, lsr #0x10
	mov r8, r3, lsr #0x10
	mov r5, #0
	bne _0200B2B0
	b _0200B21C
_0200B148:
	mov fp, #0
_0200B14C:
	ldrb r2, [r4]
	str r6, [sp]
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r8
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add r5, r5, #1
	blt _0200B14C
	mov r1, #0
_0200B1E4:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r6], #2
	add r5, r5, #1
	blt _0200B1E4
_0200B21C:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B148
	b _0200B2BC
_0200B22C:
	ldrb r2, [r4]
	mov fp, r6
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r8
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add r5, r5, #1
_0200B2B0:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B22C
_0200B2BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200B0AC

	arm_func_start sub_0200B2C4
sub_0200B2C4: ; 0x0200B2C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	strb r1, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	str r3, [r4, #0x10]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r2, [r4, #0xc]
	ldrb r2, [r4]
	ldr r0, _0200B310 ; =_02092AD8
	ldr r1, [sp, #8]
	ldr r0, [r0, r2, lsl #2]
	str r0, [r4, #0x14]
	bl MemAlloc
	str r0, [r4, #0x18]
	mov r0, r4
	bl sub_0200B3D4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B310: .word _02092AD8
	arm_func_end sub_0200B2C4

	arm_func_start sub_0200B314
sub_0200B314: ; 0x0200B314
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B314

	arm_func_start sub_0200B330
sub_0200B330: ; 0x0200B330
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	arm_func_end sub_0200B330

	arm_func_start sub_0200B33C
sub_0200B33C: ; 0x0200B33C
	bx lr
	arm_func_end sub_0200B33C

	arm_func_start sub_0200B340
sub_0200B340: ; 0x0200B340
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _0200B3BC ; =0x000001FF
	ldmib r4, {r1, r2}
	and r1, r1, r0
	mov r2, r2, lsl #0x17
	ldr r0, [r4, #0xc]
	orr r1, r1, r2, lsr #7
	str r1, [r0]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200B3B4
	ldr r5, [r4, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	ldr r6, [r4, #0x10]
	bl DC_FlushRange
	ldr ip, [r4, #0x14]
	mov r2, r6
	mov r3, r5
	mov r0, #3
	mov r1, #1
	str ip, [sp]
	bl sub_02005E10
	mov r0, #3
	bl sub_02005D30
	mov r0, #0
	strb r0, [r4, #1]
_0200B3B4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200B3BC: .word 0x000001FF
	arm_func_end sub_0200B340

	arm_func_start sub_0200B3C0
sub_0200B3C0: ; 0x0200B3C0
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0200B3C0

	arm_func_start sub_0200B3D4
sub_0200B3D4: ; 0x0200B3D4
	mov r3, #0
	ldr ip, [r0, #0x18]
	mov r2, r3
	b _0200B3EC
_0200B3E4:
	strh r2, [ip], #2
	add r3, r3, #1
_0200B3EC:
	ldr r1, [r0, #0x14]
	cmp r3, r1, lsr #1
	blo _0200B3E4
	bx lr
	arm_func_end sub_0200B3D4

	arm_func_start sub_0200B3FC
sub_0200B3FC: ; 0x0200B3FC
	ldrb r3, [r0]
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	bx lr
_0200B40C: ; jump table
	b _0200B41C ; case 0
	b _0200B438 ; case 1
	b _0200B470 ; case 2
	b _0200B48C ; case 3
_0200B41C:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B438:
	ldr ip, [r1]
	ldr r3, [r0, #0x18]
	cmp ip, #0x20
	ldrlt r0, [r1, #4]
	movlt r1, ip, lsl #1
	addlt r0, r3, r0, lsl #6
	strlth r2, [r1, r0]
	bxlt lr
	ldr r0, [r1, #4]
	add r0, r3, r0, lsl #6
	add r0, r0, ip, lsl #1
	add r0, r0, #0x700
	strh r2, [r0, #0xc0]
	bx lr
_0200B470:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B48C:
	ldr ip, [r1, #4]
	cmp ip, #0x40
	bge _0200B4C4
	ldr r1, [r1]
	ldr r0, [r0, #0x18]
	cmp r1, #0x20
	movlt r1, r1, lsl #1
	addlt r0, r0, ip, lsl #6
	strlth r2, [r1, r0]
	addge r0, r0, ip, lsl #6
	addge r0, r0, r1, lsl #1
	addge r0, r0, #0x700
	strgeh r2, [r0, #0xc0]
	bx lr
_0200B4C4:
	ldr r3, [r1]
	ldr r1, [r0, #0x18]
	cmp r3, #0x20
	subge r0, ip, #0x20
	addge r0, r1, r0, lsl #6
	addge r0, r0, r3, lsl #1
	addge r0, r0, #0x1700
	strgeh r2, [r0, #0xc0]
	bxge lr
	sub r0, ip, #0x20
	add r0, r1, r0, lsl #6
	add r0, r0, r3, lsl #1
	add r0, r0, #0x1000
	strh r2, [r0]
	bx lr
	arm_func_end sub_0200B3FC

	arm_func_start sub_0200B500
sub_0200B500: ; 0x0200B500
	ldr r0, [r0, #0x18]
	bx lr
	arm_func_end sub_0200B500

	arm_func_start sub_0200B508
sub_0200B508: ; 0x0200B508
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	str r2, [r5, #4]
	mov r0, #0
	strb r0, [r5, #0x14]
	str r3, [r5, #0x18]
	cmp r2, #0
	strle r0, [r5, #0xc]
	ble _0200B550
	ldr r1, [sp, #0x10]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r5, #0xc]
	ldr r1, [sp, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
_0200B550:
	ldr r1, [sp, #0x10]
	str r0, [r5, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
	str r0, [r5, #0x1c]
	mov r0, r5
	bl sub_0200B67C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B508

	arm_func_start sub_0200B570
sub_0200B570: ; 0x0200B570
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
	arm_func_end sub_0200B570

	arm_func_start sub_0200B57C
sub_0200B57C: ; 0x0200B57C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0, #8]
	cmp ip, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr r3, [r0]
	ldr r2, [r0, #0x1c]
	sub r1, r3, #1
	add lr, r2, r1, lsl #3
	sub r3, r3, ip
	ldr r4, [r0, #0xc]
	mov r2, #0x200
	mov r1, #0
	b _0200B5C4
_0200B5B0:
	strh r2, [lr]
	strh r1, [lr, #2]
	strh r1, [lr, #4]
	sub lr, lr, #8
	sub r3, r3, #1
_0200B5C4:
	cmp r3, #0
	bgt _0200B5B0
	ldr r5, [r0, #4]
	mvn r3, #0
	b _0200B61C
_0200B5D8:
	ldrsh ip, [r4]
	strh r3, [r4], #2
	b _0200B610
_0200B5E4:
	ldr r2, [r0, #0x10]
	mov r1, ip, lsl #3
	ldrh r1, [r2, r1]
	add r2, r2, ip, lsl #3
	strh r1, [lr]
	ldrh r1, [r2, #2]
	strh r1, [lr, #2]
	ldrh r1, [r2, #4]
	strh r1, [lr, #4]
	ldrsh ip, [r2, #6]
	sub lr, lr, #8
_0200B610:
	cmp ip, #0
	bge _0200B5E4
	sub r5, r5, #1
_0200B61C:
	cmp r5, #0
	bgt _0200B5D8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B57C

	arm_func_start sub_0200B630
sub_0200B630: ; 0x0200B630
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x1c]
	ldr r1, [r6]
	mov r0, r4
	mov r1, r1, lsl #3
	ldr r5, [r6, #0x18]
	bl DC_FlushRange
	ldr r2, [r6]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #3
	bl Memcpy32
	mov r0, #0
	strb r0, [r6, #0x14]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200B630

	arm_func_start sub_0200B67C
sub_0200B67C: ; 0x0200B67C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x1c]
	mov lr, #0
	str lr, [r0, #8]
	mov r3, #0x200
	mov r2, lr
	b _0200B6B0
_0200B698:
	strh r3, [ip]
	strh r2, [ip, #2]
	strh r2, [ip, #4]
	strh r2, [ip, #6]
	add ip, ip, #8
	add lr, lr, #1
_0200B6B0:
	ldr r1, [r0]
	cmp lr, r1
	blt _0200B698
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmleia sp!, {r3, pc}
	ldr r3, [r0, #0xc]
	mov ip, #0
	mvn r2, #0
	b _0200B6E0
_0200B6D8:
	strh r2, [r3], #2
	add ip, ip, #1
_0200B6E0:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200B6D8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200B67C

	arm_func_start sub_0200B6F0
sub_0200B6F0: ; 0x0200B6F0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r3, [r0]
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
	cmp r2, #0
	movlt r2, #0
	blt _0200B71C
	ldr r3, [r0, #4]
	cmp r2, r3
	subge r2, r3, #1
_0200B71C:
	ldrh r3, [r1]
	ldr lr, [r0, #0x10]
	mov ip, r4, lsl #3
	strh r3, [lr, ip]
	ldrh ip, [r1, #2]
	add lr, lr, r4, lsl #3
	mov r3, r2, lsl #1
	strh ip, [lr, #2]
	ldrh r1, [r1, #4]
	strh r1, [lr, #4]
	ldr r1, [r0, #0xc]
	ldrsh r1, [r1, r3]
	strh r1, [lr, #6]
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	strh r2, [r0, r3]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B6F0

	arm_func_start sub_0200B768
sub_0200B768: ; 0x0200B768
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	bl GetLanguage
	ldr r1, _0200B7E4 ; =_020AFF38_EU
	mov r4, r0
	ldrsb r0, [r1]
	cmp r0, r4
	beq _0200B7DC
	ldr r1, _0200B7E8 ; =_020AFF3C_EU
	add r0, sp, #0
	ldr r1, [r1, r4, lsl #2]
	mov r2, #1
	bl LoadFileFromRom
	ldr r2, _0200B7EC ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	ldr r0, _0200B7F0 ; =CART_REMOVED_IMG_DATA
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl MemcpySimple
	ldr r2, _0200B7EC ; =0x04000208
	add r0, sp, #0
	ldrh r1, [r2]
	mov r1, #1
	strh r1, [r2]
	bl UnloadFile
	ldr r0, _0200B7E4 ; =_020AFF38_EU
	strb r4, [r0]
_0200B7DC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B7E4: .word _020AFF38_EU
_0200B7E8: .word _020AFF3C_EU
_0200B7EC: .word 0x04000208
_0200B7F0: .word CART_REMOVED_IMG_DATA
#else
	bx lr
#endif
	arm_func_end sub_0200B768

	arm_func_start sub_0200B76C
sub_0200B76C: ; 0x0200B76C
	stmdb sp!, {r4, lr}
	bl GX_DispOff
	ldr r2, _0200B874 ; =0x04001000
	mov r0, #3
	ldr r1, [r2]
	bic r1, r1, #0x10000
	str r1, [r2]
	bl MI_StopDma
	bl GX_DisableBankForBG
	bl GX_DisableBankForOBJ
	bl GX_DisableBankForBGExtPltt
	bl GX_DisableBankForOBJExtPltt
	bl GX_DisableBankForTex
	bl GX_DisableBankForTexPltt
	bl GX_DisableBankForSubBG
	bl GX_DisableBankForSubOBJ
	bl GX_DisableBankForSubBGExtPltt
	ldr r0, _0200B878 ; =0x000001FF
	bl GX_SetBankForLCDC
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl ArrayFill32Fast
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0xc0
	ldr r1, _0200B87C ; =0x07000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	ldr r1, _0200B880 ; =0x05000400
	mov r2, #0x400
	bl ArrayFill32Fast
	bl sub_02019304
	mov r4, r0
	ldr r1, _0200B884 ; =CART_REMOVED_IMG_DATA
	mov r2, #0xc000
	bl MemcpySimple
	mov r2, r4
	ldr r0, _0200B888 ; =0x06806000
	mov r1, #0xc000
	bl DecompressAtFromMemoryPointer
	mov r0, #2
	mov r1, #0
	mov r2, r1
	bl GX_SetGraphicsMode
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r0, _0200B88C ; =0x0400006C
	mov r1, #0
	bl GXx_SetMasterBrightness_
	ldr r0, _0200B890 ; =0x0400106C
	mov r1, #0
	bl GXx_SetMasterBrightness_
	bl GX_DispOn
	ldr r1, _0200B874 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B874: .word 0x04001000
_0200B878: .word 0x000001FF
_0200B87C: .word 0x07000400
_0200B880: .word 0x05000400
_0200B884: .word CART_REMOVED_IMG_DATA
_0200B888: .word 0x06806000
_0200B88C: .word 0x0400006C
_0200B890: .word 0x0400106C
	arm_func_end sub_0200B76C

	arm_func_start sub_0200B894
sub_0200B894: ; 0x0200B894
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x1c
	bl sub_0200A2CC
	mov r0, r5
	mov r1, r4
	bl sub_0200B8D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B894

	arm_func_start sub_0200B8B8
sub_0200B8B8: ; 0x0200B8B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	bl sub_0200B8D4
	add r0, r4, #0x1c
	bl sub_0200A2F4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B8B8

	arm_func_start sub_0200B8D4
sub_0200B8D4: ; 0x0200B8D4
	ldr r2, _0200B904 ; =_02094AE8
	mov r1, r1, lsl #1
	mov r3, #0
	ldrsh r1, [r2, r1]
	str r3, [r0]
	mov r2, #1
	str r2, [r0, #4]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x14]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	bx lr
	.align 2, 0
_0200B904: .word _02094AE8
	arm_func_end sub_0200B8D4

	arm_func_start sub_0200B908
sub_0200B908: ; 0x0200B908
	ldr ip, _0200B914 ; =_0200A314
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B914: .word _0200A314
	arm_func_end sub_0200B908

	arm_func_start sub_0200B918
sub_0200B918: ; 0x0200B918
	ldr ip, _0200B924 ; =_0200A344
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B924: .word _0200A344
	arm_func_end sub_0200B918

	arm_func_start sub_0200B928
sub_0200B928: ; 0x0200B928
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200B958
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200B958:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #2
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #3
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200B928

	arm_func_start UpdateFadeStatus
UpdateFadeStatus: ; 0x0200B990
	ldr r3, _0200BA00 ; =_02094AE8
	mov ip, r1, lsl #1
	ldrsh r3, [r3, ip]
	cmp r2, #0
	strh r3, [r0, #0x10]
	ldrnesh r3, [r0, #0x10]
	ldrnesh ip, [r0, #0x14]
	cmpne ip, r3
	bne _0200B9D4
	ldrsh r3, [r0, #0x10]
	mov r2, #1
	mov r1, #0
	strh r3, [r0, #0x14]
	str r2, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
_0200B9D4:
	cmp r2, #0
	movlt r2, #0x1e
	cmp r3, #0
	sublt r3, ip, r3
	subge r3, r3, ip
	strh r3, [r0, #0x12]
	ldr r3, _0200BA04 ; =_02094AF0
	ldr r1, [r3, r1, lsl #2]
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0200BA00: .word _02094AE8
_0200BA04: .word _02094AF0
	arm_func_end UpdateFadeStatus

	arm_func_start HandleFades
HandleFades: ; 0x0200BA08
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0200BB58
_0200BA20: ; jump table
	b _0200BB50 ; case 0
	b _0200BB40 ; case 1
	b _0200BA38 ; case 2
	b _0200BA80 ; case 3
	b _0200BAC8 ; case 4
	b _0200BB04 ; case 5
_0200BA38:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BA78
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
	strh r0, [r4, #0x14]
_0200BA78:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BA80:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BAC0
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
	strh r0, [r4, #0x14]
_0200BAC0:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BAC8:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BAF8
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
_0200BAF8:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB04:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BB34
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
_0200BB34:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB40:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB50:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0200BB58:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end HandleFades

	arm_func_start sub_0200BB60
sub_0200BB60: ; 0x0200BB60
	ldr ip, _0200BB70 ; =sub_0200B928
	mov r2, #1
	str r2, [r0]
	bx ip
	.align 2, 0
_0200BB70: .word sub_0200B928
	arm_func_end sub_0200BB60

	arm_func_start sub_0200BB74
sub_0200BB74: ; 0x0200BB74
	ldr ip, _0200BB84 ; =UpdateFadeStatus
	mov r3, #1
	str r3, [r0]
	bx ip
	.align 2, 0
_0200BB84: .word UpdateFadeStatus
	arm_func_end sub_0200BB74

	arm_func_start sub_0200BB88
sub_0200BB88: ; 0x0200BB88
	mov r2, #1
	str r2, [r0]
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200BBC0
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200BBC0:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #4
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #5
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200BB88

	arm_func_start sub_0200BBF8
sub_0200BBF8: ; 0x0200BBF8
	mov ip, #1
	cmp r1, #0
	movlt r1, #0x1e
	str ip, [r0]
	cmp r2, r3
	movgt ip, #3
	strgt ip, [r0, #4]
	subgt ip, r2, r3
	strgth ip, [r0, #0x12]
	bgt _0200BC40
	movlt ip, #2
	strlt ip, [r0, #4]
	sublt ip, r3, r2
	strlth ip, [r0, #0x12]
	movge ip, #1
	strge ip, [r0, #4]
	movge ip, #0
	strgeh ip, [r0, #0x12]
_0200BC40:
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strh r2, [r0, #0x14]
	strh r3, [r0, #0x10]
	bx lr
	arm_func_end sub_0200BBF8
