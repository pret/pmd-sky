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
	arm_func_end sub_0200A2F4

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
