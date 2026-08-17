	.include "asm/macros.inc"
	.include "main_0201D738.inc"

	.text

	arm_func_start sub_0201D738
sub_0201D738: ; 0x0201D738
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r3, r6, #0x1000
	ldr r3, [r3, #0x500]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	beq _0201D75C
	bl sub_0201D778
_0201D75C:
	mov r0, r5
	mov r1, r4
	bl MemAlloc
	add r1, r6, #0x1000
	str r0, [r1, #0x500]
	str r5, [r1, #0x504]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D738

	arm_func_start sub_0201D778
sub_0201D778: ; 0x0201D778
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x1000
	ldr r0, [r0, #0x500]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	add r0, r4, #0x1000
	mov r1, #0
	str r1, [r0, #0x500]
	str r1, [r0, #0x504]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201D778

	arm_func_start sub_0201D7A8
sub_0201D7A8: ; 0x0201D7A8
	stmdb sp!, {r3, lr}
	ldr r0, _0201D7D8 ; =0x00001510
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201D7DC ; =_020AFC64
	ldr r1, _0201D7D8 ; =0x00001510
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0201D7DC ; =_020AFC64
	ldr r0, [r0, #4]
	bl sub_0201D38C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D7D8: .word 0x00001510
_0201D7DC: .word _020AFC64
	arm_func_end sub_0201D7A8

	arm_func_start sub_0201D7E0
sub_0201D7E0: ; 0x0201D7E0
	ldr r2, _0201D7FC ; =_020AFC64
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _0201D800 ; =sub_0201D738
	mov r1, r3
	bx ip
	.align 2, 0
_0201D7FC: .word _020AFC64
_0201D800: .word sub_0201D738
	arm_func_end sub_0201D7E0

	arm_func_start sub_0201D804
sub_0201D804: ; 0x0201D804
	ldr r0, _0201D814 ; =_020AFC64
	ldr ip, _0201D818 ; =sub_0201D778
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201D814: .word _020AFC64
_0201D818: .word sub_0201D778
	arm_func_end sub_0201D804

	arm_func_start sub_0201D81C
sub_0201D81C: ; 0x0201D81C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r4, [sp, #0x2c]
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r4, #0
	ldrh r7, [r5, #0xe]
	beq _0201D848
	cmp r4, #1
	beq _0201D8E4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D848:
	cmp r3, #0
	beq _0201D8C0
	mov r8, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201D8B8
_0201D860:
	ldr r0, [r5]
	mov r2, sl
	ldr r6, [r0, r8, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r6
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0xc]
	ldr r0, [r6, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201D8B8:
	cmp r8, r7
	blo _0201D860
_0201D8C0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	bl LoadObjPalette
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D8E4:
	cmp r3, #0
	beq _0201D960
	mov r6, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201D958
_0201D8FC:
	ldr r0, [r5]
	mov r2, sl
	ldr r8, [r0, r6, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r8
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0x7c]
	ldr r0, [r8, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r6, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r6, r1, lsr #0x10
_0201D958:
	cmp r6, r7
	blo _0201D8FC
_0201D960:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	add r0, r0, #0x70
	bl LoadObjPalette
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201D988: .word _020AFC30
_0201D98C: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201D81C

	arm_func_start sub_0201D990
sub_0201D990: ; 0x0201D990
	stmdb sp!, {r3, lr}
	ldr r1, _0201D9C4 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9C4: .word _020AFC3C
	arm_func_end sub_0201D990

	arm_func_start sub_0201D9C8
sub_0201D9C8: ; 0x0201D9C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x14]
	ldr ip, _0201D9FC ; =_020AFC64
	mov r3, #1
	stmia sp, {r3, lr}
	ldr lr, [ip, #4]
	mov ip, #0x38
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201D81C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9FC: .word _020AFC64
	arm_func_end sub_0201D9C8

	arm_func_start sub_0201DA00
sub_0201DA00: ; 0x0201DA00
	ldrb r1, [r0, #8]
	ldr r0, [r0]
	cmp r1, #0
	cmpne r1, #2
	ldreq r0, [r0, #8]
	ldreqsh r0, [r0, #4]
	ldrnesh r0, [r0, #0xc]
	bx lr
	arm_func_end sub_0201DA00

	arm_func_start sub_0201DA20
sub_0201DA20: ; 0x0201DA20
	ldr r2, _0201DA3C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DA40 ; =sub_0201DA00
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA3C: .word _020AFC64
_0201DA40: .word sub_0201DA00
	arm_func_end sub_0201DA20

	arm_func_start WanHasAnimationGroup
WanHasAnimationGroup: ; 0x0201DA44
	ldr r2, [r0]
	ldrsh r0, [r2, #0xc]
	cmp r1, r0
	bge _0201DA70
	cmp r1, #0
	blt _0201DA70
	ldr r0, [r2, #8]
	add r0, r0, r1, lsl #3
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0201DA78
_0201DA70:
	mov r0, #0
	bx lr
_0201DA78:
	mov r0, #1
	bx lr
	arm_func_end WanHasAnimationGroup

	arm_func_start WanTableSpriteHasAnimationGroup
WanTableSpriteHasAnimationGroup: ; 0x0201DA80
	ldr r3, _0201DA9C ; =_020AFC64
	mov r2, #0x38
	ldr r3, [r3, #4]
	ldr ip, _0201DAA0 ; =WanHasAnimationGroup
	smlabb r0, r0, r2, r3
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA9C: .word _020AFC64
_0201DAA0: .word WanHasAnimationGroup
	arm_func_end WanTableSpriteHasAnimationGroup

	arm_func_start sub_0201DAA4
sub_0201DAA4: ; 0x0201DAA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r3, #0
	ldrh r7, [r5, #0xe]
	beq _0201DACC
	cmp r3, #1
	beq _0201DB38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DACC:
	mov r8, #0
	mov r6, r8
	ldr r4, _0201DBB0 ; =_020AFC30
	ldr fp, _0201DBB4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	b _0201DB2C
_0201DAE0:
	str r6, [sp]
	ldmia r5, {r0, r2}
	ldr r0, [r0, r8, lsl #2]
	mov r1, sl
	mov r3, sb
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r1, [fp]
	ldrh r3, [r2, #4]
	ldrh r2, [r1, #0xc]
	mov r1, r3, lsl #1
	ldrh r1, [r4, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DB2C:
	cmp r8, r7
	blo _0201DAE0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DB38:
	mov r8, #0
	mov r4, #1
	ldr fp, _0201DBB0 ; =_020AFC30
	b _0201DBA4
_0201DB48:
	ldr r0, [r5]
	mov r1, sl
	ldr r6, [r0, r8, lsl #2]
	mov r3, sb
	str r4, [sp]
	ldr r2, [r5, #4]
	mov r0, r6
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r0, _0201DBB4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r3, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r6, #4]
	ldrh r2, [r1, #0x7c]
	mov r1, r3, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DBA4:
	cmp r8, r7
	blo _0201DB48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201DBB0: .word _020AFC30
_0201DBB4: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end sub_0201DAA4

	arm_func_start sub_0201DBB8
sub_0201DBB8: ; 0x0201DBB8
	stmdb sp!, {r3, lr}
	ldr lr, _0201DBD8 ; =_020AFC64
	mov ip, #0x38
	ldr lr, [lr, #4]
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201DAA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DBD8: .word _020AFC64
	arm_func_end sub_0201DBB8

	arm_func_start sub_0201DBDC
sub_0201DBDC: ; 0x0201DBDC
	ldr r0, [r0, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _0201DC30
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldrsh r0, [r1, #6]
	addne r1, r0, #0xf
	movne r0, r1, asr #3
	addne r0, r1, r0, lsr #28
	movne r0, r0, lsl #0xc
	addeq r1, r0, #0xff
	moveq r0, r1, asr #7
	addeq r0, r1, r0, lsr #24
	moveq r0, r0, lsl #8
	mov r0, r0, asr #0x10
	bx lr
_0201DC30:
	ldrsh r0, [r1, #6]
	add r1, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, lsl #0xc
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201DBDC

	arm_func_start sub_0201DC4C
sub_0201DC4C: ; 0x0201DC4C
	ldr r2, _0201DC68 ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DC6C ; =sub_0201DBDC
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DC68: .word _020AFC64
_0201DC6C: .word sub_0201DBDC
	arm_func_end sub_0201DC4C

	arm_func_start SpriteTypeInWanTable
SpriteTypeInWanTable: ; 0x0201DC70
	ldr r2, _0201DC8C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0201DC8C: .word _020AFC64
	arm_func_end SpriteTypeInWanTable

	arm_func_start sub_0201DC90
sub_0201DC90: ; 0x0201DC90
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCC8 ; =0x000007C4
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201DCCC ; =_020AFC6C
	ldr r1, _0201DCC8 ; =0x000007C4
	str r0, [r2]
	bl MemZero
	ldr r0, _0201DCCC ; =_020AFC6C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCC8: .word 0x000007C4
_0201DCCC: .word _020AFC6C
	arm_func_end sub_0201DC90

	arm_func_start sub_0201DCD0
sub_0201DCD0: ; 0x0201DCD0
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCF0 ; =_020AFC6C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201DCF0 ; =_020AFC6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCF0: .word _020AFC6C
	arm_func_end sub_0201DCD0

	arm_func_start sub_0201DCF4
sub_0201DCF4: ; 0x0201DCF4
	ldr r0, _0201DD44 ; =_020AFC6C
	mov r2, #0
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x7c2]
	ldr r2, [r0]
	mov r1, #0x7c
	b _0201DD30
_0201DD14:
	smlabb r0, r3, r1, r2
	ldrh r0, [r0, #2]
	tst r0, #1
	bxeq lr
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_0201DD30:
	cmp r3, #0x10
	blt _0201DD14
	mov r0, #1
	strb r0, [r2, #0x7c2]
	bx lr
	.align 2, 0
_0201DD44: .word _020AFC6C
	arm_func_end sub_0201DCF4

	arm_func_start sub_0201DD48
sub_0201DD48: ; 0x0201DD48
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0201DD8C ; =_020AFC6C
	mov r6, #1
	mov r4, #0x7c
_0201DD58:
	ldr r0, [r5]
	smlabb r0, r6, r4, r0
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _0201DD70
	bl DisplayAndSwitchAnimationControlCurrentFrame
_0201DD70:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	blt _0201DD58
	bl sub_0201DCF4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DD8C: .word _020AFC6C
	arm_func_end sub_0201DD48

	arm_func_start sub_0201DD90
sub_0201DD90: ; 0x0201DD90
	stmdb sp!, {r3, lr}
	mov r0, #0x2ec
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201DDF0 ; =_020AFC70
	str r0, [r1]
	bl sub_0201E614
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r1, _0201DDF4 ; =0x06860000
	ldr r0, [r0]
	add r2, r1, #0x30000
	add r0, r0, #0xbc
	mov r3, #0x80
	bl sub_0201E190
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r2, _0201DDF8 ; =0x06890000
	ldr r1, [r0]
	mov r0, #0x2000
	str r0, [sp]
	add r0, r1, #0xcc
	add r1, r1, #0xbc
	mov r3, #0
	bl sub_0201E314
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DDF0: .word _020AFC70
_0201DDF4: .word 0x06860000
_0201DDF8: .word 0x06890000
	arm_func_end sub_0201DD90

	arm_func_start sub_0201DDFC
sub_0201DDFC: ; 0x0201DDFC
	stmdb sp!, {r3, lr}
	bl sub_0201E5B0
	bl GeomSwapBuffers
	bl sub_0201E544
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201DDFC

	arm_func_start sub_0201DE10
sub_0201DE10: ; 0x0201DE10
	stmdb sp!, {r3, lr}
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xcc
	bl sub_0201E424
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl PerformPlannedTextureVramTransfer
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl ResetPlannedVramTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DE48: .word _020AFC70
	arm_func_end sub_0201DE10

	arm_func_start LoadWteFromRom
LoadWteFromRom: ; 0x0201DE4C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x10c
	mov r5, r1
	mov r6, r0
	ldr r1, _0201DEBC ; =_02099714
	add r0, sp, #0xc
	mov r4, r2
	bl strcpy
	add r0, sp, #0xc
	mov r1, r5
	bl strcat
	add r0, sp, #4
	add r1, sp, #0xc
	mov r2, r4
	bl LoadFileFromRom
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	ldr r1, _0201DEC0 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp]
	str r0, [r6, #4]
	add sp, sp, #0x10c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201DEBC: .word _02099714
_0201DEC0: .word _0209971C
	arm_func_end LoadWteFromRom

	arm_func_start LoadWteFromFileDirectory
LoadWteFromFileDirectory: ; 0x0201DEC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, r1
	mov r1, r2
	add r2, sp, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp]
	add r0, sp, #8
	bl HandleSir0Translation
	ldr r0, [sp, #8]
	ldr r1, _0201DF14 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201DF14: .word _0209971C
	arm_func_end LoadWteFromFileDirectory

	arm_func_start UnloadWte
UnloadWte: ; 0x0201DF18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadWte

	arm_func_start sub_0201DF38
sub_0201DF38: ; 0x0201DF38
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x108
	mov r6, r0
	mov r0, #8
	mov r5, r1
	bl MemAlloc
	mov r4, r0
	ldr r1, _0201DFAC ; =_02099714
	add r0, sp, #8
	bl strcpy
	add r0, sp, #8
	mov r1, r6
	bl strcat
	add r0, sp, #0
	add r1, sp, #8
	mov r2, r5
	bl LoadFileFromRom
	ldr r5, [sp]
	ldr r1, _0201DFB0 ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DFAC: .word _02099714
_0201DFB0: .word _02099720
	arm_func_end sub_0201DF38

	arm_func_start LoadWtuFromBin
LoadWtuFromBin: ; 0x0201DFB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r6, r1
	mov r1, r5
	mov r0, #8
	bl MemAlloc
	mov r4, r0
	add r2, sp, #0
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r5, [sp]
	ldr r1, _0201E01C ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201E01C: .word _02099720
	arm_func_end LoadWtuFromBin

	arm_func_start sub_0201E020
sub_0201E020: ; 0x0201E020
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E020

	arm_func_start sub_0201E050
sub_0201E050: ; 0x0201E050
	stmdb sp!, {r3, lr}
	ldr ip, _0201E07C ; =_020AFC70
	str r3, [sp]
	ldr ip, [ip]
	mov lr, r1
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E07C: .word _020AFC70
	arm_func_end sub_0201E050

	arm_func_start sub_0201E080
sub_0201E080: ; 0x0201E080
	stmdb sp!, {r3, lr}
	mov r2, #2
	ldr r1, _0201E0AC ; =_020AFC70
	str r2, [sp]
	mov r2, #0
	ldr ip, [r1]
	mov r1, r0
	mov r3, r2
	add r0, ip, #0xbc
	bl PlanCopyTextureToTextureVram
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E0AC: .word _020AFC70
	arm_func_end sub_0201E080

	arm_func_start ProcessWte
ProcessWte: ; 0x0201E0B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov ip, r1
	ldr r1, [r6, #4]
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _0201E0F4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0201E128 ; =_020AFC70
	ldr r3, [r6, #8]
	ldr r0, [r0]
	mov r2, ip
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
_0201E0F4:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _0201E120
	ldr r0, _0201E128 ; =_020AFC70
	str r4, [sp]
	ldr r0, [r0]
	ldrsh r2, [r6, #0x1c]
	ldr r1, [r6, #0x18]
	mov r3, r5
	add r0, r0, #0xcc
	bl sub_0201E3AC
_0201E120:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201E128: .word _020AFC70
	arm_func_end ProcessWte

	arm_func_start sub_0201E12C
sub_0201E12C: ; 0x0201E12C
	ldr ip, _0201E138 ; =ProcessWte
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201E138: .word ProcessWte
	arm_func_end sub_0201E12C

	arm_func_start DelayWteFree
DelayWteFree: ; 0x0201E13C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r2, #2
	ldr r1, _0201E180 ; =_020AFC70
	str r2, [sp]
	mov r4, r0
	ldr r0, [r1]
	mov r2, #0
	ldr r1, [r4]
	mov r3, r2
	add r0, r0, #0xbc
	bl PlanCopyTextureToTextureVram
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E180: .word _020AFC70
	arm_func_end DelayWteFree

	arm_func_start sub_0201E184
sub_0201E184: ; 0x0201E184
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201E184

	arm_func_start sub_0201E190
sub_0201E190: ; 0x0201E190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0x1c
	mul r4, r3, ip
	mov r7, r0
	mov r6, r1
	mov r0, r4
	mov r1, #0
	mov r5, r2
	bl MemAlloc
	mov r1, r4
	str r0, [r7]
	bl MemZero
	mov r0, #0
	strh r0, [r7, #0xc]
	str r6, [r7, #4]
	str r5, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201E190

	arm_func_start ResetPlannedVramTransfer
ResetPlannedVramTransfer: ; 0x0201E1D4
	mov r1, #0
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end ResetPlannedVramTransfer

	arm_func_start PlanCopyTextureToTextureVram
PlanCopyTextureToTextureVram: ; 0x0201E1E0
	stmdb sp!, {r4, lr}
	ldrsh r4, [r0, #0xc]
	cmp r4, #0x80
	mvnge r0, #0
	ldmgeia sp!, {r4, pc}
	ldr lr, [r0]
	mov ip, #0x1c
	smlabb ip, r4, ip, lr
	str r3, [ip, #4]
	str r1, [ip, #8]
	ldrb r3, [sp, #8]
	str r2, [ip, #0xc]
	mov r1, #0
	str r3, [ip, #0x10]
	strb r1, [ip, #0x14]
	ldrsh r1, [r0, #0xc]
	add r1, r1, #1
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end PlanCopyTextureToTextureVram

	arm_func_start PerformPlannedTextureVramTransfer
PerformPlannedTextureVramTransfer: ; 0x0201E230
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r7, [r4, #0xc]
	mov r6, #0
	ldr fp, _0201E310 ; =_022A4F38
	mov r5, #0x1c
	b _0201E304
_0201E24C:
	ldr r0, [r4]
	smlabb r1, r6, r5, r0
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0201E274
	cmp r0, #1
	beq _0201E2C8
	cmp r0, #2
	beq _0201E2F0
	b _0201E2F8
_0201E274:
	ldr sl, [r1, #8]
	cmp sl, #0
	beq _0201E2A4
	ldr sb, [r1, #4]
	ldr r8, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2A4:
	ldr r8, [r1, #4]
	ldr sb, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, fp
	mov r1, sb
	mov r2, r8
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2C8:
	ldr sl, [r1, #4]
	ldr sb, [r1, #0xc]
	ldr r8, [r1, #8]
	bl GX_BeginLoadTexPltt
	mov r0, r8
	mov r1, sb
	mov r2, sl
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	b _0201E2F8
_0201E2F0:
	ldr r0, [r1, #8]
	bl MemFree
_0201E2F8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0201E304:
	cmp r6, r7
	blt _0201E24C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201E310: .word _022A4F38
	arm_func_end PerformPlannedTextureVramTransfer

	arm_func_start sub_0201E314
sub_0201E314: ; 0x0201E314
	stmdb sp!, {r4, lr}
	ldr ip, [sp, #8]
	mov r4, r0
	mov r0, ip, asr #7
	add r0, ip, r0, lsr #24
	stmia r4, {r1, ip}
	mov r0, r0, asr #8
	str r0, [r4, #8]
	mov r1, #0
	strb r1, [r4, #0xc]
	str r2, [r4, #0x10]
	str r3, [r4, #0x14]
	mov r0, ip, lsl #1
	bl MemAlloc
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	mov r1, #0
	bl MemAlloc
	str r0, [r4, #0x1c]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x18]
	mov r1, r1, lsl #1
	bl MemZero
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #8]
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E314
