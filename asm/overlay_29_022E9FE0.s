	.include "asm/macros.inc"
	.include "overlay_29_022E9FE0.inc"

	.text

	arm_func_start AdvanceFrame
AdvanceFrame: ; 0x022E9FE0
	stmdb sp!, {r3, lr}
	ldr r1, _022EA004 ; =ov29_02353560
	ldrb r1, [r1, #3]
	cmp r1, #0
	beq _022E9FFC
	bl ov29_022EA2A4
	ldmia sp!, {r3, pc}
_022E9FFC:
	bl ov29_022EA324
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA004: .word ov29_02353560
	arm_func_end AdvanceFrame

	arm_func_start ov29_022EA008
ov29_022EA008: ; 0x022EA008
#ifdef JAPAN
#define OV29_022EA008_OFFSET -0xA4
#else
#define OV29_022EA008_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022EA294 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA27C
	bl ov29_0234B854
	bl HandleTopScreenFades
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	beq _022EA0F8
	mov r0, #1
	bl UpdateCamera
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230 + OV29_022EA008_OFFSET]
	ldrsh r0, [ip, r0]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, #1
	mov r3, #0
	bl sub_02051E20
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r1]
	add ip, r0, #0x1a000
	ldrb r0, [ip, #0x251 + OV29_022EA008_OFFSET]
	cmp r0, #0
	beq _022EA0DC
	mov r0, #2
	strb r0, [ip, #0x23c + OV29_022EA008_OFFSET]
	ldr r0, _022EA298 ; =0x0001A224
	ldr ip, [r1]
	add r1, r0, #2
	add r2, ip, #0x1a000
	ldrsh r3, [ip, r1]
	ldr r1, [r2, #0x230 + OV29_022EA008_OFFSET]
	mov r2, #0
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	ldrsh r0, [ip, r0]
	mov r3, r2
	mov r1, r1, asr #0x10
	bl sub_02051E20
	b _022EA0F8
_022EA0DC:
	mov r0, #0
	mov lr, #3
	mov r1, r0
	mov r2, r0
	mov r3, r0
	strb lr, [ip, #0x23c + OV29_022EA008_OFFSET]
	bl sub_02051E20
_022EA0F8:
	bl ov29_0230473C
	bl DisplayMonstersAndItems
	bl ov29_022E335C
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrsh r0, [r1, #0x1c]
	cmp r0, #0x64
	addlt r0, r0, #1
	strlth r0, [r1, #0x1c]
	ldr r0, _022EA29C ; =DUNGEON_FRAMES_PASSED
	ldr r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	bne _022EA140
	mov r0, #0
	bl FlashLeaderIcon
	b _022EA154
_022EA140:
	bl GetTopScreenOption
	cmp r0, #3
	bne _022EA154
	mov r0, #1
	bl FlashLeaderIcon
_022EA154:
	bl AnimateWaterShadows
	bl ov29_022EA80C
	bl DisplayUi
	ldr r1, _022EA294 ; =ov29_02353560
	ldrb r0, [r1]
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r2, [r0, #0x24a + OV29_022EA008_OFFSET]
	cmp r2, #0
	beq _022EA1B8
	bl ov29_022DE11C
	cmp r0, #0
	beq _022EA1D0
	ldr r0, _022EA290 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r0]
	ldr r1, _022EA294 ; =ov29_02353560
	add r0, r0, #0x1a000
	strb r2, [r0, #0x24a + OV29_022EA008_OFFSET]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	b _022EA1D0
_022EA1B8:
	ldr r2, [r1, #0xc]
	sub r2, r2, #1
	str r2, [r1, #0xc]
	cmp r2, #0
	movle r1, #1
	strleb r1, [r0, #0x24a + OV29_022EA008_OFFSET]
_022EA1D0:
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x24a + OV29_022EA008_OFFSET]
	cmp r0, #0
	beq _022EA214
	bl GetAlertBoxLoadingStatus
	cmp r0, #3
	beq _022EA214
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA294 ; =ov29_02353560
	ldr r1, [r1]
	ldrb r3, [r0, #2]
	add r2, r1, #0x1e0
	mov r0, #0xa0
	mov r1, #0x20
	bl ov29_022DE134
_022EA214:
	ldr r1, _022EA290 ; =DUNGEON_PTR
	ldr r0, _022EA2A0 ; =0x0001A21C
	ldr r2, [r1]
	add r1, r0, #2
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	bl GetTile
	cmp r0, #0
	beq _022EA260
	ldr r2, _022EA290 ; =DUNGEON_PTR
	ldrb r1, [r0, #7]
	ldr r2, [r2]
	cmp r2, #0
	addne r0, r2, #0xc4 + OV29_022EA008_OFFSET
	addne r0, r0, #0x4000
	add r2, r2, #0x21c + OV29_022EA008_OFFSET
	moveq r0, #0
	add r2, r2, #0x1a000
	bl ov29_022ED800
_022EA260:
	bl RenderWeather3D
	bl ov29_022E8C10
	ldr r0, _022EA290 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x2180
	add r0, r0, #0x18000
#else
	add r0, r0, #0x224
	add r0, r0, #0x1a000
#endif
	bl ov29_022DD8B4
_022EA27C:
	ldr r0, _022EA29C ; =DUNGEON_FRAMES_PASSED
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA290: .word DUNGEON_PTR
_022EA294: .word ov29_02353560
_022EA298: .word 0x0001A224 + OV29_022EA008_OFFSET
_022EA29C: .word DUNGEON_FRAMES_PASSED
_022EA2A0: .word 0x0001A21C + OV29_022EA008_OFFSET
	arm_func_end ov29_022EA008

	arm_func_start ov29_022EA2A4
ov29_022EA2A4: ; 0x022EA2A4
	stmdb sp!, {r3, lr}
	ldr r0, _022EA318 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	bne _022EA2C0
	bl ov29_022DDEF8
	ldmia sp!, {r3, pc}
_022EA2C0:
	ldr r0, _022EA31C ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =DUNGEON_FRAMES_PASSED
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA318 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a4]
#else
	strb r1, [r0, #0x248]
#endif
	bl InitWeirdMinimapMatrix
	ldr r0, _022EA31C ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA320 ; =DUNGEON_FRAMES_PASSED
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA318: .word DUNGEON_PTR
_022EA31C: .word ov29_02353560
_022EA320: .word DUNGEON_FRAMES_PASSED
	arm_func_end ov29_022EA2A4

	arm_func_start ov29_022EA324
ov29_022EA324: ; 0x022EA324
	stmdb sp!, {r3, lr}
	ldr r0, _022EA368 ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =DUNGEON_FRAMES_PASSED
	ldrne r1, [r0, #0x10]
	addne r1, r1, #1
	strne r1, [r0, #0x10]
	bl ov29_022DDEF8
	ldr r0, _022EA368 ; =ov29_02353560
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldrne r0, _022EA36C ; =DUNGEON_FRAMES_PASSED
	ldrne r1, [r0, #0x10]
	subne r1, r1, #1
	strne r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA368: .word ov29_02353560
_022EA36C: .word DUNGEON_FRAMES_PASSED
	arm_func_end ov29_022EA324

	arm_func_start ov29_022EA370
ov29_022EA370: ; 0x022EA370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r4, _022EA3B0 ; =ov29_02353560
	b _022EA3A4
_022EA384:
	ldrb r0, [r4, #3]
	cmp r0, #0
	mov r0, r5
	beq _022EA39C
	bl ov29_022EA2A4
	b _022EA3A0
_022EA39C:
	bl ov29_022EA324
_022EA3A0:
	sub r6, r6, #1
_022EA3A4:
	cmp r6, #0
	bne _022EA384
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3B0: .word ov29_02353560
	arm_func_end ov29_022EA370

	arm_func_start ov29_022EA3B4
ov29_022EA3B4: ; 0x022EA3B4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022EA3F0 ; =DUNGEON_BUTTON_INPUT
	ldr r5, _022EA3F4 ; =ov29_02353560
	mov r6, r0
_022EA3C4:
	ldrb r0, [r5, #3]
	cmp r0, #0
	mov r0, r6
	beq _022EA3DC
	bl ov29_022EA2A4
	b _022EA3E0
_022EA3DC:
	bl ov29_022EA324
_022EA3E0:
	ldrh r0, [r4]
	tst r0, #0xf0
	bne _022EA3C4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EA3F0: .word DUNGEON_BUTTON_INPUT
_022EA3F4: .word ov29_02353560
	arm_func_end ov29_022EA3B4

	arm_func_start ov29_022EA3F8
ov29_022EA3F8: ; 0x022EA3F8
	ldr ip, _022EA404 ; =ov29_022DE638
	mov r0, #0x100
	bx ip
	.align 2, 0
_022EA404: .word ov29_022DE638
	arm_func_end ov29_022EA3F8

	arm_func_start ov29_022EA408
ov29_022EA408: ; 0x022EA408
	ldr r0, _022EA414 ; =DUNGEON_FRAMES_PASSED
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022EA414: .word DUNGEON_FRAMES_PASSED
	arm_func_end ov29_022EA408

	arm_func_start ov29_022EA418
ov29_022EA418: ; 0x022EA418
	ldr r1, _022EA424 ; =ov29_02353560
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_022EA424: .word ov29_02353560
	arm_func_end ov29_022EA418

	arm_func_start UnkMapRelatedFunc
UnkMapRelatedFunc: ; 0x022EA428
	stmdb sp!, {r4, lr}
	ldr r1, _022EA620 ; =DUNGEON_FRAMES_PASSED
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xd
	bgt _022EA48C
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _022EA614
_022EA454: ; jump table
	b _022EA4B4 ; case 0
	b _022EA498 ; case 1
	b _022EA540 ; case 2
	b _022EA4E0 ; case 3
	b _022EA540 ; case 4
	b _022EA570 ; case 5
	b _022EA508 ; case 6
	b _022EA524 ; case 7
	b _022EA5C4 ; case 8
	b _022EA5E0 ; case 9
	b _022EA614 ; case 10
	b _022EA5FC ; case 11
	b _022EA614 ; case 12
	b _022EA594 ; case 13
_022EA48C:
	ldr r0, _022EA624 ; =0x000003E7
	cmp r4, r0
	b _022EA614
_022EA498:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA4B4:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	bl UpdateMinimap
	mov r0, #0
	bl ov29_02339FF4
	b _022EA614
_022EA4E0:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA614
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA614
	mov r0, #1
	bl ov29_02339FF4
	b _022EA614
_022EA508:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA524:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA540:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	bl GetBottomScreenOption
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA570:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_0233A248
	b _022EA614
_022EA594:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022EA5BC
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022EA5BC
	bl UpdateMinimap
	mov r0, #1
	bl ov29_02339FF4
_022EA5BC:
	mov r4, #0
	b _022EA614
_022EA5C4:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5E0:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
	b _022EA614
_022EA5FC:
	ldr r0, _022EA628 ; =ov29_02353560
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA614
	mov r0, #0
	bl ov29_0234B1A4
_022EA614:
	ldr r0, _022EA620 ; =DUNGEON_FRAMES_PASSED
	str r4, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA620: .word DUNGEON_FRAMES_PASSED
_022EA624: .word 0x000003E7
_022EA628: .word ov29_02353560
	arm_func_end UnkMapRelatedFunc

	arm_func_start ov29_022EA62C
ov29_022EA62C: ; 0x022EA62C
	ldr r1, _022EA644 ; =DUNGEON_FRAMES_PASSED
	mov r2, #0xa
	ldr ip, _022EA648 ; =ov29_0234B1A4
	mov r0, #0
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_022EA644: .word DUNGEON_FRAMES_PASSED
_022EA648: .word ov29_0234B1A4
	arm_func_end ov29_022EA62C

	arm_func_start AnimateWaterShadows
AnimateWaterShadows: ; 0x022EA64C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _022EA708 ; =DUNGEON_FRAMES_PASSED
	mov r2, #0
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	movmi r1, #0
	strmi r1, [r0, #8]
	ldr r0, _022EA708 ; =DUNGEON_FRAMES_PASSED
	ldr r1, [r0, #8]
	cmp r1, #0xc
	movge r1, #0
	strge r1, [r0, #8]
	ldr r0, _022EA708 ; =DUNGEON_FRAMES_PASSED
	mov r1, #0xb
	ldr r3, [r0, #8]
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r0, r0, asr #2
	add ip, r0, r0, lsl #1
	str r2, [sp]
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =ov29_02353540
	ldr r1, _022EA710 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r2, [r0]
	ldr r0, [r1]
	add r1, r2, ip, lsl #8
	mov r2, #0x1e8
	mov r3, #0x100
	mov r4, ip, lsl #8
	bl ChangeSimpleObjTexture
	mov r0, #0
	str r0, [sp]
	mov r1, #0xb
	str r1, [sp, #4]
	ldr r0, _022EA70C ; =ov29_02353540
	ldr r1, _022EA710 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr ip, [r0]
	add r3, r4, #0x100
	ldr r0, [r1]
	add r1, ip, r3
	ldr r2, _022EA714 ; =0x000001EA
	mov r3, #0x200
	bl ChangeSimpleObjTexture
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA708: .word DUNGEON_FRAMES_PASSED
_022EA70C: .word ov29_02353540
_022EA710: .word OBJ_GRAPHICS_CONTROLS_PTR
_022EA714: .word 0x000001EA
	arm_func_end AnimateWaterShadows

	arm_func_start DisplayAnimatedNumbers
DisplayAnimatedNumbers: ; 0x022EA718
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EA7FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
	mov fp, #0x29
	ldr r5, _022EA800 ; =DUNGEON_FRAMES_PASSED
	ldr r4, _022EA804 ; =ov29_02353560
	b _022EA78C
_022EA75C:
	ldrsh r0, [r5, #0x1c]
	cmp r0, #0
	beq _022EA794
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _022EA780
	mov r0, fp
	bl ov29_022EA2A4
	b _022EA788
_022EA780:
	mov r0, #0x29
	bl ov29_022EA324
_022EA788:
	add r6, r6, #1
_022EA78C:
	cmp r6, #0x14
	blt _022EA75C
_022EA794:
	ldr r1, _022EA800 ; =DUNGEON_FRAMES_PASSED
	mov r0, #0x3c
	str sl, [r1, #0x20]
	strb r8, [r1, #0x24]
	strh r0, [r1, #0x1c]
	str sb, [r1, #0x28]
	ldrh r2, [sb, #0x26]
	mov r0, #0
	cmp r7, #0
	str r2, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r0, [r1, #0x34]
	bge _022EA7F4
	ldr r0, _022EA808 ; =0xFFFFFC19
	cmp sl, r0
	movlt r0, #6
	strlth r0, [r1, #0x1e]
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movge r0, #0xa
	strgeh r0, [r1, #0x1e]
	movlt r0, #3
	strlth r0, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022EA7F4:
	strh r7, [r1, #0x1e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EA7FC: .word DUNGEON_PTR
_022EA800: .word DUNGEON_FRAMES_PASSED
_022EA804: .word ov29_02353560
_022EA808: .word 0xFFFFFC19
	arm_func_end DisplayAnimatedNumbers

	arm_func_start ov29_022EA80C
ov29_022EA80C: ; 0x022EA80C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r0, _022EA95C ; =DUNGEON_FRAMES_PASSED
	ldrsh r1, [r0, #0x1c]
	cmp r1, #0
	beq _022EA954
	ldr r0, [r0, #0x28]
	cmp r0, #0
	moveq r0, #0
	beq _022EA848
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022EA848:
	cmp r0, #0
	ldreq r0, _022EA95C ; =DUNGEON_FRAMES_PASSED
	moveq r1, #0
	streqh r1, [r0, #0x1c]
	beq _022EA954
	ldr r3, _022EA95C ; =DUNGEON_FRAMES_PASSED
	ldr r5, [r3, #0x28]
	ldr r1, [r3, #0x2c]
	ldrh r0, [r5, #0x26]
	cmp r1, r0
	movne r0, #0
	strneh r0, [r3, #0x1c]
	bne _022EA954
	ldrsh r2, [r3, #0x1c]
	ldr r1, _022EA960 ; =DUNGEON_PTR
	ldr r0, _022EA964 ; =0x0001A224
	sub r2, r2, #1
	strh r2, [r3, #0x1c]
	ldr r4, [r3, #0x34]
	add r2, r0, #2
	sub lr, r4, #0x2e
	str lr, [r3, #0x34]
	ldr r4, [r5, #0xb4]
	ldr ip, [r1]
	add r1, r4, #0x100
#ifdef JAPAN
	ldrsh r5, [r1, #0x7e]
	ldrsh r4, [r1, #0x80]
#else
	ldrsh r5, [r1, #0x82]
	ldrsh r4, [r1, #0x84]
#endif
	ldr r1, [r3, #0x30]
	ldrsh r0, [ip, r0]
	add r5, r5, r1, asr #8
	ldrsh r1, [ip, r2]
	add r4, r4, lr, asr #8
	sub r2, r4, #0x18
	sub r4, r5, r0
	mvn r0, #0x1f
	cmp r4, r0
	sub r5, r2, r1
	addge r0, r0, #0x18
	cmpge r5, r0
	blt _022EA954
	cmp r4, #0xff
	cmplt r5, #0xc0
	bge _022EA954
	ldrsh r1, [r3, #0x1c]
	mov r0, #0xff
	cmp r1, #0x1f
	bge _022EA910
	rsb r0, r1, r1, lsl #8
	mov r1, #0x1f
	bl _s32_div_f
_022EA910:
	ldr ip, _022EA95C ; =DUNGEON_FRAMES_PASSED
	mov r1, r4, lsl #0x10
	ldrh r4, [ip, #0x1e]
	mov r2, r5, lsl #0x10
	mov r3, r0, lsl #0x10
	str r4, [sp]
	ldr r4, [ip, #0x20]
	mov r0, r1, asr #0x10
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	str r1, [sp, #4]
	ldrb r4, [ip, #0x24]
	mov r1, r2, asr #0x10
	mov r3, r3, asr #0x10
	mov r2, #0xff
	str r4, [sp, #8]
	bl ov29_02335F40
_022EA954:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022EA95C: .word DUNGEON_FRAMES_PASSED
_022EA960: .word DUNGEON_PTR
#ifdef JAPAN
_022EA964: .word 0x0001A180
#else
_022EA964: .word 0x0001A224
#endif
	arm_func_end ov29_022EA80C
