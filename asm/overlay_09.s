	.include "asm/macros.inc"
	.include "overlay_09.inc"

	.text

	arm_func_start ov09_0233CA80
ov09_0233CA80: ; 0x0233CA80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl sub_02003BAC
	bl sub_02017B70
	mov r0, #0x314
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233CBB8 ; =ov09_0233F7E0
	mov r1, #0
	str r0, [r2]
	str r1, [r0, #0x3c]
	ldr r0, [r2]
	sub r3, r1, #2
	strb r3, [r0]
	ldr r0, [r2]
	ldr r7, _0233CBBC ; =ov09_0233F61C
	strb r3, [r0, #1]
	ldr r0, [r2]
	strb r3, [r0, #2]
	ldr r0, [r2]
	strb r3, [r0, #3]
	ldr r0, [r2]
	strb r3, [r0, #4]
	ldr r0, [r2]
	ldr r3, _0233CBC0 ; =ov09_0233F664
	add r6, r0, #0x4c
	add r8, r0, #0x284
	mov r2, r1
_0233CAEC:
	mov r4, r1, lsl #1
#ifdef JAPAN
	add r0, r1, #0x148
#else
	add r0, r1, #0xfe
#endif
	add r5, r0, #0x400
	ldrh r0, [r3, r4]
	strh r5, [r6]
	add r1, r1, #1
	strh r0, [r6, #2]
	cmp r1, #0x8d
	strb r2, [r8], #1
	add r6, r6, #4
	blt _0233CAEC
	strh r2, [r6]
	strh r2, [r6, #2]
	ldr r6, _0233CBC4 ; =0x000004FD
	mov r5, #0
	mov r4, #1
	ldr sb, _0233CBB8 ; =ov09_0233F7E0
	mvn r8, #0
	b _0233CB90
_0233CB38:
	ldr r0, [r7]
	bl sub_0204CA1C
	cmp r0, #0
	bne _0233CB8C
	ldr r2, [sb]
	ldmib r7, {r0, r1}
	add r3, r2, #0x4c
	add r2, r2, #0x284
	cmp r0, r1
	add r3, r3, r0, lsl #2
	add r2, r2, r0
	bgt _0233CB8C
	b _0233CB80
_0233CB6C:
	strh r6, [r3]
	strh r5, [r3, #2]
	strb r4, [r2], #1
	add r0, r0, #1
	add r3, r3, #4
_0233CB80:
	ldr r1, [r7, #8]
	cmp r0, r1
	ble _0233CB6C
_0233CB8C:
	add r7, r7, #0xc
_0233CB90:
	ldr r0, [r7]
	cmp r0, r8
	bne _0233CB38
	ldr r0, _0233CBB8 ; =ov09_0233F7E0
	ldr r1, [r0]
	add r0, r1, #8
	add r1, r1, #0x4c
	bl ov09_0233D964
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233CBB8: .word ov09_0233F7E0
_0233CBBC: .word ov09_0233F61C
_0233CBC0: .word ov09_0233F664
#ifdef JAPAN
_0233CBC4: .word 0x00000547
#else
_0233CBC4: .word 0x000004FD
#endif
	arm_func_end ov09_0233CA80

	arm_func_start ov09_0233CBC8
ov09_0233CBC8: ; 0x0233CBC8
	stmdb sp!, {r3, lr}
	ldr r0, _0233CBF4 ; =ov09_0233F7E0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233CBF4 ; =ov09_0233F7E0
	mov r1, #0
	str r1, [r0]
	bl sub_02003BC8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CBF4: .word ov09_0233F7E0
	arm_func_end ov09_0233CBC8

	arm_func_start ov09_0233CBF8
ov09_0233CBF8: ; 0x0233CBF8
#ifdef JAPAN
#define OV09_0233CBF8_OFFSET 0x4A
#else
#define OV09_0233CBF8_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	sub sp, sp, #0x1000
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r3, [r0]
	ldr r0, [r3, #0x3c]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _0233D918
_0233CC1C: ; jump table
	b _0233CC54 ; case 0
	b _0233CC98 ; case 1
	b _0233CCFC ; case 2
	b _0233CD34 ; case 3
	b _0233CE78 ; case 4
	b _0233CFA8 ; case 5
	b _0233CFF8 ; case 6
	b _0233D0C8 ; case 7
	b _0233D280 ; case 8
	b _0233D56C ; case 9
	b _0233D5BC ; case 10
	b _0233D770 ; case 11
	b _0233D7AC ; case 12
	b _0233D8F4 ; case 13
_0233CC54:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D918
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	mov r0, #0x1e
	bl ov00_022BE5C8
	bl ov01_02330E00
	cmp r0, #0
	bne _0233CC84
	bl ov01_0232EDAC
_0233CC84:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	b _0233D918
_0233CC98:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D918
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	mov r1, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _0233D92C ; =ov09_0233F780
	mov r2, r1
	mov r3, r1
	str r1, [sp, #4]
	bl sub_02052060
	mov r0, #0x1e
	bl ov00_022BE57C
	bl ov01_02330E00
	cmp r0, #0
	bne _0233CCE8
	bl ov01_02330210
_0233CCE8:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	b _0233D918
_0233CCFC:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D918
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x48]
	b _0233D918
_0233CD34:
	ldrsb r0, [r3, #2]
	mvn r1, #1
	cmp r0, r1
	beq _0233CD70
	bl IsPlaybackControlsMenuActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ClosePlaybackControlsMenu
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
_0233CD70:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0233CDB4
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #3]
_0233CDB4:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r5, [r0]
	ldr r0, [r5, #0x48]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r5, #0x48]
	bgt _0233D918
	add r3, sp, #0xf00
	ldr r4, _0233D930 ; =0x000004EF
	add r3, r3, #8
	strh r4, [r3, #0x80]
	add ip, r5, #0x284
	mov lr, #0x10
	str ip, [sp, #0xfe0]
	ldr r0, _0233D934 ; =ov09_0233F58C
	ldr r1, _0233D938 ; =0x00401A13
	add r2, sp, #0xf80
	str lr, [sp, #0xf8c]
	mov ip, #6
	add r3, r5, #8
	str ip, [sp]
	bl CreateJukeboxTrackMenu
	ldr r1, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r1, [r1]
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r1, #0x14]
	ldr r0, _0233D93C ; =ov09_0233F59C
	bl CreateDialogueBox
	ldr r3, _0233D928 ; =ov09_0233F7E0
	ldr r1, _0233D940 ; =0x00000404
	ldr ip, [r3]
#ifdef JAPAN
	ldr r2, _0233F164 ; =0x0000053B
#else
	add r2, r1, #0xed
#endif
	strb r0, [ip, #1]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #0
	ldr r2, [r0]
	mov r1, #4
	strb r3, [r2, #0x44]
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	b _0233D918
_0233CE78:
	ldrb r0, [r3, #0x44]
	cmp r0, #0
	ldr r0, [r3, #0x30]
	beq _0233CEB8
	cmp r0, #0
	bgt _0233CEE4
#ifdef JAPAN
	ldrsb r0, [r3, #1]
	ldr r1, _0233D940 ; =0x00000404
	ldr r2, _0233F164 ; =0x0000053B
#else
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r3, #1]
	add r2, r1, #0xed
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x44]
	b _0233CEE4
_0233CEB8:
	cmp r0, #0
	ble _0233CEE4
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r3, #1]
	add r2, r1, #0xee + OV09_0233CBF8_OFFSET
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x44]
_0233CEE4:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsJukeboxTrackMenuActive
	cmp r0, #0
	bne _0233CF6C
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ov09_0233E3A4
	cmp r0, #0
	blt _0233CF5C
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r3, [r0]
	ldr r2, [r3, #0x10]
	ldr r1, [r3, #0x14]
	cmp r1, r2
	beq _0233CF3C
	str r2, [r3, #0x14]
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233D9F8
_0233CF3C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #7
	ldr r2, [r0]
	mov r1, #0xa
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x48]
	b _0233CF6C
_0233CF5C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x3c]
_0233CF6C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r1, [r0]
	ldrb r0, [r1, #0x1d]
	cmp r0, #0
	beq _0233D918
	ldrsb r0, [r1]
	bl ov09_0233E308
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #5
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x48]
	b _0233D918
_0233CFA8:
	ldr r0, [r3, #0x48]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r3, #0x48]
	bgt _0233D918
	ldr ip, _0233D944 ; =0x000004FC
	add r2, sp, #0xe00
	ldr r0, _0233D948 ; =ov09_0233F56C
	add r2, r2, #0xe8
	add r3, r3, #8
	mov r1, #0x13
	str ip, [sp]
	bl CreateInputLockBox
	ldr r1, _0233D928 ; =ov09_0233F7E0
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0, #0x3c]
	b _0233D918
_0233CFF8:
	ldrsb r0, [r3, #4]
	bl IsInputLockBoxActive
	cmp r0, #0
	bne _0233D050
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #0
	ldr r1, [r0]
	mov r2, #4
	strb r3, [r1, #0x1d]
	ldr r1, [r0]
	str r2, [r1, #0x3c]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseInputLockBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ov09_0233E2D4
	b _0233D918
_0233D050:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r0]
	ldrb r0, [r2, #0x44]
	cmp r0, #0
	ldr r0, [r2, #0x30]
	beq _0233D098
	cmp r0, #0
	bgt _0233D918
#ifdef JAPAN
	ldrsb r0, [r2, #1]
	ldr r1, _0233D940 ; =0x00000404
	ldr r2, _0233F164 ; =0x0000053B
#else
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r2, #1]
	add r2, r1, #0xed
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x44]
	b _0233D918
_0233D098:
	cmp r0, #0
	ble _0233D918
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r2, #1]
	add r2, r1, #0xee + OV09_0233CBF8_OFFSET
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x44]
	b _0233D918
_0233D0C8:
	ldrsb r0, [r3]
	mvn r1, #1
	cmp r0, r1
	beq _0233D104
	bl IsJukeboxTrackMenuActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseJukeboxTrackMenu
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_0233D104:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _0233D148
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #1]
_0233D148:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r3, [r0]
	ldr r0, [r3, #0x48]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r3, #0x48]
	bgt _0233D918
	mov r0, #0
	ldr r1, _0233D94C ; =ov09_0233F5AC
	str r0, [sp, #0xe50]
	str r1, [sp]
	ldr ip, _0233D950 ; =ov09_0233F5E4
	ldr r1, _0233D954 ; =0x00400033
	add r2, sp, #0xe50
	add r3, r3, #8
	str ip, [sp, #4]
	bl CreatePlaybackControlsMenu
	ldr r1, _0233D928 ; =ov09_0233F7E0
	ldr r1, [r1]
	strb r0, [r1, #2]
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r1]
	strb r0, [r2, #3]
	ldr r3, [r1]
	add r0, sp, #0x88
	ldr r2, [r3, #0x14]
	str r2, [r3, #0x40]
	ldr r2, [r1]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #2
	ldrh r1, [r1, #0x4c]
	bl GetStringFromFileVeneer
	add r0, sp, #0xe00
	bl InitPreprocessorArgs
	ldr r0, _0233D928 ; =ov09_0233F7E0
	add r3, sp, #0x88
	ldr lr, [r0]
	mov r2, #0
	ldr ip, [lr, #0x40]
	ldr r1, _0233D940 ; =0x00000404
	str r3, [sp, #0xe38]
	add r3, ip, #1
	str r3, [sp, #0xe24]
	str r2, [lr, #0x38]
	ldr r0, [r0]
	add r2, r1, #0xf6 + OV09_0233CBF8_OFFSET
	ldrsb r0, [r0, #3]
	add r3, sp, #0xe00
	bl ShowStringIdInDialogueBox
	add r1, sp, #0xe00
	str r1, [sp]
	ldr r2, _0233D958 ; =0x000004FA
	ldr r3, _0233D95C ; =0x0000C402
	add r0, sp, #0xa00
	mov r1, #0x100
	bl PreprocessStringFromId
	add r0, sp, #0xa00
#ifndef JAPAN
	b _0233D248
_0233D238:
	cmp r1, #0x5d
	addeq r0, r0, #1
	beq _0233D254
	add r0, r0, #1
_0233D248:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0233D238
_0233D254:
#endif
	bl sub_020265A8
	ldr r1, _0233D928 ; =ov09_0233F7E0
	mov r3, #0
	ldr ip, [r1]
	mov r2, #8
	str r0, [ip, #0x38]
	ldr r0, [r1]
	strb r3, [r0, #0x44]
	ldr r0, [r1]
	str r2, [r0, #0x3c]
	b _0233D918
_0233D280:
	ldrsb r0, [r3, #2]
	bl IsPlaybackControlsMenuActive
	cmp r0, #0
	bne _0233D3E8
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233ED1C
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0233D3C8
_0233D2AC: ; jump table
	b _0233D3C8 ; case 0
	b _0233D3C8 ; case 1
	b _0233D2CC ; case 2
	b _0233D2F0 ; case 3
	b _0233D314 ; case 4
	b _0233D338 ; case 5
	b _0233D35C ; case 6
	b _0233D3A4 ; case 7
_0233D2CC:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233D9F8
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D2F0:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233DA4C
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D314:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233DA70
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D338:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233DAD0
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D35C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233DB54
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1d]
	cmp r1, #0
	beq _0233D398
	mov r1, #9
	str r1, [r2, #0x3c]
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0, #0x48]
	b _0233D918
_0233D398:
	ldrsb r0, [r2, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D3A4:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov09_0233DB6C
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D3C8:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0xa
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x48]
	b _0233D918
_0233D3E8:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1d]
	cmp r1, #0
	beq _0233D424
	ldrsb r0, [r2, #2]
	bl ov09_0233EC98
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #9
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x3c]
	ldr r0, [r0]
	str r1, [r0, #0x48]
	b _0233D918
_0233D424:
	ldrb r1, [r2, #0x44]
	cmp r1, #0
	ldr r1, [r2, #0x30]
	beq _0233D454
	cmp r1, #0
	bgt _0233D494
	mvn r1, #0
	str r1, [r2, #0x40]
	ldr r0, [r0]
	mov r1, #0
	strb r1, [r0, #0x44]
	b _0233D494
_0233D454:
	cmp r1, #0
	ble _0233D494
	mov r3, #0
	str r3, [r2, #0x38]
	ldr r0, [r0]
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r0, #3]
#ifdef JAPAN
	ldr r2, _0233F184 ; =0x00000545
#else
	add r2, r1, #0xf7
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0x40]
	ldr r0, [r0]
	strb r1, [r0, #0x44]
_0233D494:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r3, [r0]
	ldrb r1, [r3, #0x44]
	cmp r1, #0
	bne _0233D918
	ldr r2, [r3, #0x14]
	ldr r1, [r3, #0x40]
	cmp r1, r2
	beq _0233D918
	str r2, [r3, #0x40]
	ldr r2, [r0]
	add r0, sp, #0x48
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #2
	ldrh r1, [r1, #0x4c]
	bl GetStringFromFileVeneer
	add r0, sp, #0x9b0
	bl InitPreprocessorArgs
	ldr r0, _0233D928 ; =ov09_0233F7E0
	add r3, sp, #0x48
	ldr lr, [r0]
	mov r2, #0
	ldr ip, [lr, #0x40]
	ldr r1, _0233D940 ; =0x00000404
	str r3, [sp, #0x9e8]
	add r3, ip, #1
	str r3, [sp, #0x9d4]
	str r2, [lr, #0x38]
	ldr r0, [r0]
	add r3, sp, #0x9b0
	ldrsb r0, [r0, #3]
	add r2, r1, #0xf6 + OV09_0233CBF8_OFFSET
	bl ShowStringIdInDialogueBox
	add r1, sp, #0x9b0
	str r1, [sp]
	ldr r2, _0233D958 ; =0x000004FA
	ldr r3, _0233D95C ; =0x0000C402
	add r0, sp, #0x5b0
	mov r1, #0x100
	bl PreprocessStringFromId
	add r0, sp, #0x5b0
#ifndef JAPAN
	b _0233D54C
_0233D53C:
	cmp r1, #0x5d
	addeq r0, r0, #1
	beq _0233D558
	add r0, r0, #1
_0233D54C:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0233D53C
_0233D558:
#endif
	bl sub_020265A8
	ldr r1, _0233D928 ; =ov09_0233F7E0
	ldr r1, [r1]
	str r0, [r1, #0x38]
	b _0233D918
_0233D56C:
	ldr r0, [r3, #0x48]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r3, #0x48]
	bgt _0233D918
	ldr ip, _0233D944 ; =0x000004FC
	add r2, sp, #0x500
	ldr r0, _0233D960 ; =ov09_0233F57C
	add r2, r2, #0x18
	add r3, r3, #8
	mov r1, #0x13
	str ip, [sp]
	bl CreateInputLockBox
	ldr r1, _0233D928 ; =ov09_0233F7E0
	mov r2, #0xa
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0, #0x3c]
	b _0233D918
_0233D5BC:
	ldrsb r0, [r3, #4]
	bl IsInputLockBoxActive
	cmp r0, #0
	bne _0233D614
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r3, #0
	ldr r1, [r0]
	mov r2, #8
	strb r3, [r1, #0x1d]
	ldr r1, [r0]
	str r2, [r1, #0x3c]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseInputLockBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov09_0233EC20
	b _0233D918
_0233D614:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r2, [r0]
	ldrb r1, [r2, #0x44]
	cmp r1, #0
	ldr r1, [r2, #0x30]
	beq _0233D64C
	cmp r1, #0
	bgt _0233D68C
	mvn r1, #0
	str r1, [r2, #0x40]
	ldr r0, [r0]
	mov r1, #0
	strb r1, [r0, #0x44]
	b _0233D68C
_0233D64C:
	cmp r1, #0
	ble _0233D68C
	mov r3, #0
	str r3, [r2, #0x38]
	ldr r0, [r0]
	ldr r1, _0233D940 ; =0x00000404
	ldrsb r0, [r0, #3]
#ifdef JAPAN
	ldr r2, _0233F184 ; =0x00000545
#else
	add r2, r1, #0xf7
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0x40]
	ldr r0, [r0]
	strb r1, [r0, #0x44]
_0233D68C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r3, [r0]
	ldrb r1, [r3, #0x44]
	cmp r1, #0
	bne _0233D918
	ldr r2, [r3, #0x14]
	ldr r1, [r3, #0x40]
	cmp r1, r2
	beq _0233D918
	str r2, [r3, #0x40]
	ldr r2, [r0]
	add r0, sp, #8
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #2
	ldrh r1, [r1, #0x4c]
	bl GetStringFromFileVeneer
	add r0, sp, #0x400
	add r0, r0, #0xc8
	bl InitPreprocessorArgs
	ldr r0, _0233D928 ; =ov09_0233F7E0
	add r3, sp, #8
	ldr lr, [r0]
	mov r2, #0
	ldr ip, [lr, #0x40]
	ldr r1, _0233D940 ; =0x00000404
	str r3, [sp, #0x500]
	add r3, ip, #1
	str r3, [sp, #0x4ec]
	str r2, [lr, #0x38]
	ldr r0, [r0]
	add r3, sp, #0x400
	ldrsb r0, [r0, #3]
	add r3, r3, #0xc8
	add r2, r1, #0xf6 + OV09_0233CBF8_OFFSET
	bl ShowStringIdInDialogueBox
	add r1, sp, #0x400
	add r1, r1, #0xc8
	str r1, [sp]
	ldr r2, _0233D958 ; =0x000004FA
	ldr r3, _0233D95C ; =0x0000C402
	add r0, sp, #0xc8
	mov r1, #0x100
	bl PreprocessStringFromId
	add r0, sp, #0xc8
#ifndef JAPAN
	b _0233D750
_0233D740:
	cmp r1, #0x5d
	addeq r0, r0, #1
	beq _0233D75C
	add r0, r0, #1
_0233D750:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0233D740
_0233D75C:
#endif
	bl sub_020265A8
	ldr r1, _0233D928 ; =ov09_0233F7E0
	ldr r1, [r1]
	str r0, [r1, #0x38]
	b _0233D918
_0233D770:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D918
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	mov r0, #0x1e
	bl ov00_022BE5C8
	bl ov01_0232EDAC
	bl sub_02017B70
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	b _0233D918
_0233D7AC:
	bl ov01_0232E94C
	cmp r0, #0
	bne _0233D918
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _0233D808
	bl IsJukeboxTrackMenuActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseJukeboxTrackMenu
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_0233D808:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _0233D84C
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #1]
_0233D84C:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0233D890
	bl IsPlaybackControlsMenuActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ClosePlaybackControlsMenu
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
_0233D890:
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0233D8D4
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0233D918
	ldr r0, _0233D928 ; =ov09_0233F7E0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseDialogueBox
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #3]
_0233D8D4:
	bl ov00_022BE8D0
	mov r0, #0x1e
	bl ov00_022BE57C
	ldr r0, _0233D928 ; =ov09_0233F7E0
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	b _0233D918
_0233D8F4:
	bl ov00_022BE680
	cmp r0, #0
	bne _0233D918
	mov r0, #2
	bl PlayBgmByIdVeneer
	mov r0, #0x14
	bl ov01_023310B8
	mov r0, #4
	b _0233D91C
_0233D918:
	mov r0, #1
_0233D91C:
	add sp, sp, #0x18
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233D928: .word ov09_0233F7E0
	arm_func_end ov09_0233CBF8
_0233D92C: .word ov09_0233F780
_0233D930: .word 0x000004EF + OV09_0233CBF8_OFFSET
_0233D934: .word ov09_0233F58C
_0233D938: .word 0x00401A13
_0233D93C: .word ov09_0233F59C
_0233D940: .word 0x00000404
#ifdef JAPAN
_0233F164: .word 0x0000053B
#endif
_0233D944: .word 0x000004FC + OV09_0233CBF8_OFFSET
_0233D948: .word ov09_0233F56C
_0233D94C: .word ov09_0233F5AC
_0233D950: .word ov09_0233F5E4
_0233D954: .word 0x00400033
#ifdef JAPAN
_0233D958: .word 0x0000053A
_0233D95C: .word 0x0000C402
_0233F184: .word 0x00000545
#else
_0233D958: .word 0x000004FA
_0233D95C: .word 0x0000C402
#endif
_0233D960: .word ov09_0233F57C

	arm_func_start ov09_0233D964
ov09_0233D964: ; 0x0233D964
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	mvn r2, #0
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	mov r1, #0
	strh r1, [r5, #0x10]
	strh r1, [r5, #0x12]
	strb r1, [r5, #0x14]
	strb r1, [r5, #0x15]
	strb r1, [r5, #0x16]
	str r2, [r5, #0x20]
	str r2, [r5, #0x24]
	bl ov09_0233D9DC
	cmp r4, #0
	beq _0233D9D0
	mov r1, #0
	b _0233D9BC
_0233D9B4:
	add r4, r4, #4
	add r1, r1, #1
_0233D9BC:
	ldrh r0, [r4]
	cmp r0, #0
	bne _0233D9B4
	str r1, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0233D9D0:
	mov r0, #0
	str r0, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov09_0233D964

	arm_func_start ov09_0233D9DC
ov09_0233D9DC: ; 0x0233D9DC
	mov r1, #0
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	str r1, [r0, #0x30]
	bx lr
	arm_func_end ov09_0233D9DC

	arm_func_start ov09_0233D9F8
ov09_0233D9F8: ; 0x0233D9F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0xc]
	mvn r0, #0
	cmp r1, r0
	ldreq r0, [r4, #8]
	streq r0, [r4, #0xc]
	ldr r1, [r4]
	ldr r0, [r4, #0xc]
	add r0, r1, r0, lsl #2
	ldrh r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl PlayBgmByIdVeneer
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x14]
	str r0, [r4, #0x20]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end ov09_0233D9F8

	arm_func_start ov09_0233DA4C
ov09_0233DA4C: ; 0x0233DA4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017B70
	mov r0, #0
	strb r0, [r4, #0x14]
	sub r0, r0, #1
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end ov09_0233DA4C

	arm_func_start ov09_0233DA70
ov09_0233DA70: ; 0x0233DA70
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xc]
	mvn r1, #0
	cmp r3, r1
	ldmeqia sp!, {r3, pc}
	mov r2, #0
_0233DA88:
	ldr r1, [r0, #4]
	sub r1, r1, #1
	cmp r3, r1
	strge r2, [r0, #0xc]
	ldrlt r1, [r0, #0xc]
	addlt r1, r1, #1
	strlt r1, [r0, #0xc]
	ldr r3, [r0, #0xc]
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	ldrh r1, [r1, #2]
	cmp r1, #0
	beq _0233DA88
	ldrb r1, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	bl ov09_0233D9F8
	ldmia sp!, {r3, pc}
	arm_func_end ov09_0233DA70

	arm_func_start ov09_0233DAD0
ov09_0233DAD0: ; 0x0233DAD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0xc]
	mvn r1, #0
	cmp r2, r1
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r4, #0x14]
	cmp r1, #0
	beq _0233DB10
	ldr r1, [r4, #0x20]
	cmp r1, #0xb4
	ble _0233DB10
	bl ov09_0233DA4C
	mov r0, r4
	bl ov09_0233D9F8
	ldmia sp!, {r4, pc}
_0233DB10:
	cmp r2, #0
	ldrle r0, [r4, #4]
	ldrgt r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	ldr r2, [r4, #0xc]
	ldr r0, [r4]
	add r0, r0, r2, lsl #2
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0233DB10
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov09_0233D9F8
	ldmia sp!, {r4, pc}
	arm_func_end ov09_0233DAD0

	arm_func_start ov09_0233DB54
ov09_0233DB54: ; 0x0233DB54
	ldrb r1, [r0, #0x15]
	cmp r1, #0
	moveq r1, #1
	movne r1, #0
	strb r1, [r0, #0x15]
	bx lr
	arm_func_end ov09_0233DB54

	arm_func_start ov09_0233DB6C
ov09_0233DB6C: ; 0x0233DB6C
	ldrb r1, [r0, #0x16]
	cmp r1, #0
	moveq r1, #1
	movne r1, #0
	strb r1, [r0, #0x16]
	bx lr
	arm_func_end ov09_0233DB6C

	arm_func_start ov09_0233DB84
ov09_0233DB84: ; 0x0233DB84
	mov r1, #0x78
	str r1, [r0, #0x28]
	bx lr
	arm_func_end ov09_0233DB84

	arm_func_start ov09_0233DB90
ov09_0233DB90: ; 0x0233DB90
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	movs r6, r3
	ldrneb r4, [r6]
	mov r8, r0
	movne r0, #0
	strneb r0, [r6]
	ldr r5, [sp, #0x20]
	mov r0, #0
	strb r0, [r5]
	ldr r0, [r8, #0x18]
	moveq r4, #1
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x18]
	ldr r0, [r8, #0x1c]
	mov r7, r1
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x1c]
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	bl sub_02003B5C
	cmp r0, #0
	ldrneh r0, [sp]
	andne r0, r0, #0x300
	strneh r0, [sp]
	ldrb r0, [r8, #0x14]
	cmp r0, #0
	beq _0233DCF0
	ldr r0, [r8, #0x20]
	ldr r2, [r8]
	ldr r1, [r8, #0xc]
	add r0, r0, #1
	str r0, [r8, #0x20]
	ldr r0, [r8, #0x24]
	add r1, r2, r1, lsl #2
	cmp r0, #0
	blt _0233DCBC
	sub r0, r0, #1
	str r0, [r8, #0x24]
	ldrb r0, [r8, #0x16]
	cmp r0, #0
	beq _0233DC74
	ldrh r0, [r1, #2]
	bl sub_02017B18
	cmp r0, #0
	movne r0, #0
	strne r0, [r8, #0x24]
	bne _0233DCF0
	ldr r0, [r8, #0x24]
	cmp r0, #0
	bgt _0233DCF0
	mov r0, r8
	bl ov09_0233D9F8
	b _0233DCF0
_0233DC74:
	ldr r0, [r8, #0x24]
	cmp r0, #0x12c
	bgt _0233DCF0
	bne _0233DC90
	mov r0, #0x12c
	bl sub_02017B7C
	b _0233DCF0
_0233DC90:
	cmp r0, #0
	bgt _0233DCF0
	mov r0, r8
	bl ov09_0233DA4C
	mov r0, r8
	bl ov09_0233DA70
	mov r0, r8
	bl ov09_0233D9F8
	mov r0, #1
	strb r0, [r5]
	b _0233DCF0
_0233DCBC:
	ldrh r0, [r1, #2]
	bl sub_02017B18
	cmp r0, #0
	moveq r0, #0x3c
	streq r0, [r8, #0x24]
	beq _0233DCF0
	bl sub_02017B0C
	cmp r0, #0
	beq _0233DCF0
	ldrb r0, [r8, #0x16]
	cmp r0, #0
	moveq r0, #0x258
	streq r0, [r8, #0x24]
_0233DCF0:
	ldrh r0, [sp]
	tst r0, #8
	beq _0233DD1C
	mov r0, r7
	mov r1, #0
	bl PlayWindowInputSound
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r8, #0x15]
_0233DD1C:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	beq _0233DD70
	ldr r0, [r8, #0x28]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x28]
	ldrh r1, [sp]
	ldr r0, _0233DEE8 ; =0x00000F04
	tst r1, r0
	beq _0233DD68
	bl sub_02003B5C
	cmp r0, #0
	bne _0233DD60
	mov r0, r7
	mov r1, #2
	bl PlayWindowInputSound
_0233DD60:
	mov r0, #0x78
	str r0, [r8, #0x28]
_0233DD68:
	mov r0, #0
	b _0233DEE0
_0233DD70:
	mov r1, #0
	str r1, [r8, #0x28]
	ldrh r0, [sp]
	tst r0, #4
	beq _0233DDA0
	mov r0, r7
	bl PlayWindowInputSound
	ldrb r0, [r8, #0x16]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r8, #0x16]
_0233DDA0:
	ldr r0, [r8, #0x2c]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x2c]
	bgt _0233DEDC
	ldrh r0, [sp]
	tst r0, #0x400
	beq _0233DE0C
	cmp r4, #0
	mov r0, r7
	beq _0233DDF0
	mov r1, #0
	bl PlayWindowInputSound
	cmp r6, #0
	movne r0, #1
	strneb r0, [r6]
	bne _0233DDF8
	mov r0, r8
	bl ov09_0233D9F8
	b _0233DDF8
_0233DDF0:
	mov r1, #2
	bl PlayWindowInputSound
_0233DDF8:
	mov r0, #4
	str r0, [r8, #0x2c]
	mov r0, #1
	strb r0, [r5]
	b _0233DEDC
_0233DE0C:
	tst r0, #0x800
	beq _0233DE48
	mov r0, r7
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #4
	mov r0, r8
	str r1, [r8, #0x2c]
	bl ov09_0233DA4C
	cmp r6, #0
	mvnne r0, #0
	strne r0, [r8, #0xc]
	mov r0, #1
	strb r0, [r5]
	b _0233DEDC
_0233DE48:
	tst r0, #0x200
	beq _0233DE94
	mov r0, #4
	str r0, [r8, #0x2c]
	ldr r1, [r8, #0xc]
	sub r0, r0, #5
	cmp r1, r0
	mov r0, r7
	bne _0233DE78
	mov r1, #2
	bl PlayWindowInputSound
	b _0233DEDC
_0233DE78:
	mov r1, #0
	bl PlayWindowInputSound
	mov r0, r8
	bl ov09_0233DAD0
	mov r0, #1
	strb r0, [r5]
	b _0233DEDC
_0233DE94:
	tst r0, #0x100
	beq _0233DEDC
	mov r0, #4
	str r0, [r8, #0x2c]
	ldr r1, [r8, #0xc]
	sub r0, r0, #5
	cmp r1, r0
	mov r0, r7
	bne _0233DEC4
	mov r1, #2
	bl PlayWindowInputSound
	b _0233DEDC
_0233DEC4:
	mov r1, #0
	bl PlayWindowInputSound
	mov r0, r8
	bl ov09_0233DA70
	mov r0, #1
	strb r0, [r5]
_0233DEDC:
	mov r0, #0
_0233DEE0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233DEE8: .word 0x00000F04
	arm_func_end ov09_0233DB90

	arm_func_start ov09_0233DEEC
ov09_0233DEEC: ; 0x0233DEEC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_02003B5C
	cmp r0, #0
	movne r0, r4
	bne _0233E028
	ldr r1, [r7, #8]
	ldr r0, [r7]
	add lr, r1, #0x8a
	str r0, [sp]
	ldr r0, [r7]
	add r3, lr, #0x10
	add ip, r0, #0xe
	add r2, sp, #0
	mov r0, r5
	mov r1, #2
	str ip, [sp, #4]
	str lr, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0233DF84
	mov r1, #4
	str r1, [r8, #0x18]
	mov r1, r4
	mov r0, r7
	mov r4, #1
	bl PlayWindowInputSound
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	moveq r0, r4
	movne r0, #0
	strb r0, [r8, #0x15]
_0233DF84:
	ldr r0, [r7]
	ldr r1, [r7, #8]
	add r0, r0, #1
	str r0, [sp]
	add lr, r1, #0x9e
	ldr r0, [r7]
	add r3, lr, #0x10
	add ip, r0, #0xf
	add r2, sp, #0
	mov r0, r5
	mov r1, #2
	str ip, [sp, #4]
	str lr, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0233E00C
	mov r0, #4
	str r0, [r8, #0x1c]
	ldrb r0, [r8, #0x15]
	mov r4, #1
	cmp r0, #0
	mov r0, r7
	beq _0233DFF0
	mov r1, #2
	bl PlayWindowInputSound
	b _0233E00C
_0233DFF0:
	mov r1, #0
	bl PlayWindowInputSound
	ldrb r0, [r8, #0x16]
	cmp r0, #0
	moveq r0, r4
	movne r0, #0
	strb r0, [r8, #0x16]
_0233E00C:
	cmp r6, #0
	beq _0233E024
	mov r0, r7
	mov r1, r6
	bl sub_020320C8
	mov r4, #1
_0233E024:
	mov r0, r4
_0233E028:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov09_0233DEEC

	arm_func_start CreateJukeboxTrackMenu
CreateJukeboxTrackMenu: ; 0x0233E030
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sl, r3
	ldr r6, [sl]
	str r1, [sp, #8]
	mov r8, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0233E060
_0233E058:
	add r1, r1, #4
	add r2, r2, #1
_0233E060:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0233E058
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov fp, r0
	mov r5, fp
	mov r4, #0
	mov r7, #0x100
	b _0233E0B8
_0233E094:
	ldr r3, _0233E2C8 ; =0x0000C402
	mov r0, r5
	mov r1, r7
	str r4, [sp]
	bl PreprocessStringFromId
	ldrh r0, [r6, #2]
	add r6, r6, #4
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0233E0B8:
	ldrh r2, [r6]
	cmp r2, #0
	bne _0233E094
	mov r0, #0
	strb r0, [r5]
	ldrh r2, [r6, #2]
	ldr r1, [sp, #0x58]
	mov r0, #0x1ac
	str r2, [r5, #0x100]
	str r1, [sp, #0x10]
	mov r1, #8
	bl MemAlloc
	mov r7, r0
	ldr r5, [sl, #0xc]
	mov r4, #0
	str r4, [sp, #0xc]
	mov r0, sl
	mov r6, fp
	str sl, [r7, #4]
	bl ov09_0233D9DC
	ldr r0, [sp, #8]
	cmp sb, #0
	orr sl, r0, #0x20
	addne ip, sp, #0x14
	ldmneia sb, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0233E2CC ; =UpdateJukeboxTrackMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x14]
	bne _0233E144
	ldr r0, _0233E2D0 ; =JUKEBOX_TRACK_MENU_DEFAULT_WINDOW_PARAMS
	add sb, sp, #0x14
	ldmia r0, {r0, r1, r2, r3}
	stmia sb, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0233E144:
	ldrb r0, [sp, #0x1a]
	str r7, [sp, #0x20]
	cmp r0, #0
	bne _0233E194
	mov sb, #0
	b _0233E170
_0233E15C:
	mov r0, r6
	bl sub_020265A8
	cmp r0, sb
	movgt sb, r0
	add r6, r6, #0x104
_0233E170:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0233E15C
	mov r0, sl
	mov r1, r8
	add r2, sb, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1a]
_0233E194:
	mov r6, fp
	b _0233E1B8
_0233E19C:
	ldr r0, [sp, #0xc]
	add r6, r6, #0x104
	cmp r0, r5
	moveq r4, r0
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_0233E1B8:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0233E19C
	ldr r0, [sp, #0x10]
	add r2, sp, #0xc
	cmp r0, #0
	ldrle r0, [sp, #0xc]
	add r3, sp, #0x10
	strle r0, [sp, #0x10]
	ldrb r0, [sp, #0x1b]
	cmp r0, #0
	mov r0, sl
	bne _0233E200
	mov r1, r8
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1b]
	b _0233E208
_0233E200:
	mov r1, r8
	bl CalcMenuHeightDiv8__02031AA4
_0233E208:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x18]
	ldrneb r0, [sp, #0x1a]
	subne r0, r1, r0
	strneb r0, [sp, #0x18]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x19]
	ldrneb r0, [sp, #0x1b]
	subne r0, r1, r0
	strneb r0, [sp, #0x19]
	ldr r0, _0233E2CC ; =UpdateJukeboxTrackMenu
	cmp r8, #0
	str r0, [r7]
	str sl, [r7, #0x100]
	beq _0233E264
	add r6, r7, #0x104
	mov r5, #9
_0233E24C:
	ldmia r8!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0233E24C
	ldmia r8, {r0, r1}
	stmia r6, {r0, r1}
_0233E264:
	str r4, [r7, #0x104]
	str fp, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
	strb r2, [r7, #0x1a5]
	add r0, sp, #0x14
	mov r1, #3
	strb r2, [sp, #0x1c]
	bl NewWindowScreenCheck
	add r1, sp, #0x24
	mov r5, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0xc]
	add r3, sp, #0x24
	str r0, [sp]
	ldr r4, [sp, #0x10]
	mov r1, sl
	add r0, r7, #8
	add r2, r7, #0x104
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r5
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E2C8: .word 0x0000C402
_0233E2CC: .word UpdateJukeboxTrackMenu
_0233E2D0: .word JUKEBOX_TRACK_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateJukeboxTrackMenu

	arm_func_start ov09_0233E2D4
ov09_0233E2D4: ; 0x0233E2D4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1a0]
	mov r1, #0
	strb r1, [r0, #0x1a4]
	strb r1, [r0, #0x1a5]
	ldr r1, [r0, #0x100]
	bic r1, r1, #0x800000
	str r1, [r0, #0x100]
	add r0, r0, #8
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ov09_0233E2D4

	arm_func_start ov09_0233E308
ov09_0233E308: ; 0x0233E308
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1a4]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1a5]
	bl sub_0202830C
	mov r0, r5
	add r1, r4, #8
	bl sub_02028948
	mov r0, #5
	str r0, [r4, #0x1a0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov09_0233E308

	arm_func_start CloseJukeboxTrackMenu
CloseJukeboxTrackMenu: ; 0x0233E34C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl ov01_02330E38
	ldr r0, [r4, #0x19c]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseJukeboxTrackMenu

	arm_func_start IsJukeboxTrackMenuActive
IsJukeboxTrackMenuActive: ; 0x0233E384
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsJukeboxTrackMenuActive

	arm_func_start ov09_0233E3A4
ov09_0233E3A4: ; 0x0233E3A4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0233E3D4
	ldrb r1, [r0, #0x1a5]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!,  {r3, pc}
	add r0, r0, #8
	bl sub_02032578
	ldmia sp!, {r3, pc}
_0233E3D4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov09_0233E3A4

	arm_func_start UpdateJukeboxTrackMenu
UpdateJukeboxTrackMenu: ; 0x0233E3DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x34
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0233E7E8
_0233E3FC: ; jump table
	b _0233E418 ; case 0
	b _0233E430 ; case 1
	b _0233E444 ; case 2
	b _0233E44C ; case 3
	b _0233E4AC ; case 4
	b _0233E76C ; case 5
	b _0233E7B0 ; case 6
_0233E418:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0233E7E8
	mov r0, #2
	str r0, [r4, #0x1a0]
_0233E430:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	moveq r0, #2
	streq r0, [r4, #0x1a0]
	beq _0233E7E8
_0233E444:
	mov r0, #3
	str r0, [r4, #0x1a0]
_0233E44C:
	mov r0, r6
	bl ov09_0233E7F4
	ldr r0, [r4, #0x100]
	tst r0, #0x800000
	beq _0233E488
	mov r0, #8
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	str r0, [r4, #0x1a8]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0233E7E8
_0233E488:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	str r0, [r4, #0x1a8]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0233E7E8
_0233E4AC:
	bl sub_02003B5C
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	add r1, sp, #0xc
	add r2, sp, #0x10
	add r0, r4, #8
	and r3, r3, #0xff
	bl sub_02031C98
	ldr r1, [sp, #0xc]
	mov r5, r0
	cmp r1, #0
	bne _0233E52C
	ldr r0, [r4, #0x100]
	tst r0, #1
	beq _0233E52C
	mov r3, #0
	ldr r2, _0233E7F0 ; =0x00000408
	add r1, sp, #0x10
	str r3, [sp]
	mov ip, #1
	add r0, r4, #8
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0233E52C
	add r0, r4, #8
	bl sub_02032684
	ldr r0, [sp, #0xc]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #0xc]
_0233E52C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0233E54C
	add r1, sp, #0xc
	add r2, sp, #0x10
	add r0, r4, #8
	bl sub_02033758
	orr r5, r5, r0
_0233E54C:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _0233E56C
	ldr r0, [r4, #4]
	add r3, sp, #0x10
	add r1, r4, #8
	bl ov09_0233DEEC
	orr r5, r5, r0
_0233E56C:
	add r0, r4, #8
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #0xc]
	add r0, r4, #8
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0233E598
	mov r0, r6
	bl ov09_0233E7F4
_0233E598:
	add r0, r4, #8
	bl sub_02032578
	ldr r1, [r4, #4]
	str r0, [r1, #8]
	ldr r0, [sp, #0xc]
	tst r0, #1
	beq _0233E63C
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x15]
	cmp r1, #0
	beq _0233E5D8
	bl ov09_0233DB84
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233E750
_0233E5D8:
	add r0, r4, #8
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0233E62C
	ldr r0, [r4, #0x100]
	tst r0, #0x80000000
	bne _0233E600
	add r0, r4, #8
	mov r1, #0
	bl PlayWindowInputSound
_0233E600:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	ldr r1, [sp, #0xc]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x1a0]
	b _0233E750
_0233E62C:
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233E750
_0233E63C:
	tst r0, #2
	beq _0233E69C
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x15]
	cmp r1, #0
	beq _0233E668
	bl ov09_0233DB84
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233E750
_0233E668:
	add r0, r4, #8
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	ldr r1, [sp, #0xc]
	sub r0, r0, #6
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x1a0]
	b _0233E750
_0233E69C:
	add r0, r4, #8
	bl IsMenuOptionActive
	add r1, sp, #8
	strb r0, [sp, #9]
	str r1, [sp]
	ldr r0, [r4, #4]
	ldr r2, [sp, #0xc]
	add r3, sp, #9
	add r1, r4, #8
	bl ov09_0233DB90
	cmp r0, #0
	beq _0233E6F8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	ldr r1, [sp, #0xc]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x1a0]
	b _0233E73C
_0233E6F8:
	ldrb r0, [sp, #9]
	cmp r0, #0
	beq _0233E73C
	ldr r1, [r4, #4]
	add r0, r4, #8
	ldr r1, [r1, #8]
	bl sub_02032684
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	ldr r1, [sp, #0xc]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x1a0]
_0233E73C:
	ldrb r0, [sp, #8]
	cmp r0, #0
	beq _0233E750
	mov r0, r6
	bl ov09_0233E7F4
_0233E750:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #8
	bl sub_02028948
	ldr r1, [r4, #4]
	mov r0, #2
	bl ov01_02330E38
	b _0233E7E8
_0233E76C:
	add r0, r4, #8
	bl sub_02032070
	cmp r0, #0
	bne _0233E7E8
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0233E7A8
	ldr r0, [r4, #0x100]
	tst r0, #0x400000
	beq _0233E7A8
	mov r0, r6
	bl ov09_0233E7F4
	mov r0, #8
	str r0, [r4, #0x1a0]
	b _0233E7E8
_0233E7A8:
	mov r0, #6
	str r0, [r4, #0x1a0]
_0233E7B0:
	mov r0, #0
	mov r1, r0
	bl ov01_02330E38
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0233E7E8
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x1a0]
_0233E7E8:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0233E7F0: .word 0x00000408
	arm_func_end UpdateJukeboxTrackMenu

	arm_func_start ov09_0233E7F4
ov09_0233E7F4: ; 0x0233E7F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x154
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #8
	bl sub_02032568
	mov r5, r0
	add r0, r4, #8
	bl sub_02032594
	ldr r2, [r4, #0x100]
	mov fp, r0
	tst r2, #0x200
	ldrne r0, [r4, #0x164]
	ldr r3, [r4, #0x19c]
	addne sb, r0, r5
	add r1, r5, r5, lsl #6
	ldrsb r0, [sl, #0x10]
	add r6, r3, r1, lsl #2
	moveq sb, #0
	bl sub_02027B1C
	add r0, sp, #0x104
	bl InitPreprocessorArgs
	cmp fp, #0
	mov r7, #0
	ble _0233E8EC
	b _0233E8E4
_0233E85C:
	ldr r0, [r4, #4]
	mov r8, #0x44
	ldr r0, [r0, #0xc]
	cmp r0, r5
	moveq r8, #0x45
	beq _0233E88C
	cmp sb, #0
	beq _0233E88C
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r8, #0x42
_0233E88C:
	add r0, r5, #1
	str r0, [sp, #0x128]
	str r6, [sp, #0x13c]
	add r0, sp, #0x104
	str r0, [sp]
#ifdef JAPAN
	ldr r2, _0234013C ; =0x0000053A
	ldr r3, _0233E914 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
#else
	ldr r3, _0233E914 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	mov r2, #0x4f0
#endif
	bl PreprocessStringFromId
	add r0, r4, #8
	mov r1, r7
	bl sub_020328D8
	str r8, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	add r3, sp, #4
	bl sub_020263C8
	add r7, r7, #1
	add r5, r5, #1
	add r6, r6, #0x104
_0233E8E4:
	cmp r7, fp
	blt _0233E85C
_0233E8EC:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #8
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldr r1, [r4, #4]
	mov r0, #2
	bl ov01_02330E38
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_0234013C: .word 0x0000053A
#endif
_0233E914: .word 0x0000C402
	arm_func_end ov09_0233E7F4

	arm_func_start CreatePlaybackControlsMenu
CreatePlaybackControlsMenu: ; 0x0233E918
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov sl, r1
	mov sb, r2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [sp, #0x60]
	mov r2, #0
	b _0233E944
_0233E93C:
	add r1, r1, #8
	add r2, r2, #1
_0233E944:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0233E93C
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r4, r0, lsl #2
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	str r0, [sp, #0x14]
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	str r0, [sp, #0x10]
	ldr r5, [sp, #0x14]
	mov r6, r0
	ldr r7, [sp, #0x60]
	ldr r4, [sp, #0x64]
	b _0233E9C4
_0233E990:
	mov r0, r5
	bl GetStringFromFileVeneer
	ldr r1, [r7, #4]
	mov r0, r6
	str r1, [r5, #0x100]
	ldrh r1, [r4]
	add r7, r7, #8
	add r5, r5, #0x104
	bl GetStringFromFileVeneer
	ldr r0, [r4, #4]
	add r4, r4, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0233E9C4:
	ldrh r1, [r7]
	cmp r1, #0
	bne _0233E990
	mov r0, #0
	strb r0, [r5]
	strb r0, [r6]
	ldr r1, [r7, #4]
	mov r0, #0x1b4
	str r1, [r5, #0x100]
	ldr r2, [r4, #4]
	mov r1, #8
	str r2, [r6, #0x100]
	bl MemAlloc
	mov r7, r0
	tst sl, #0x20
	ldrne r8, [sb]
	ldr r0, [sp, #0xc]
	mov fp, #0
	str fp, [sp, #0x18]
	mov r1, r0
	ldr r6, [sp, #0x14]
	ldr r5, [sp, #0x10]
	moveq r8, #0
	str r1, [r7, #4]
	bl ov09_0233D9DC
	ldr r0, [sp, #8]
	add r4, sp, #0x1c
	cmp r0, #0
	ldreq r0, _0233EC18 ; =PLAYBACK_CONTROLS_MENU_DEFAULT_WINDOW_PARAMS
	orreq sl, sl, #0x300000
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r0, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _0233EC1C ; =UpdatePlaybackControlsMenu
	str r7, [sp, #0x28]
	strne r0, [sp, #0x1c]
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	bne _0233EACC
	mov r4, #0
	b _0233EA80
_0233EA6C:
	mov r0, r6
	bl sub_020265A8
	cmp r0, r4
	movgt r4, r0
	add r6, r6, #0x104
_0233EA80:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0233EA6C
	b _0233EAA8
_0233EA94:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r4
	movgt r4, r0
	add r5, r5, #0x104
_0233EAA8:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0233EA94
	mov r0, sl
	mov r1, sb
	add r2, r4, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0233EACC:
	ldr r4, [sp, #0x14]
	ldr r5, [sp, #0x10]
	and r6, sl, #0x20
	b _0233EB14
_0233EADC:
	cmp r6, #0
	beq _0233EB00
	ldr r0, [r4, #0x100]
	cmp r0, r8
	ldreq fp, [sp, #0x18]
	beq _0233EB00
	ldr r0, [r5, #0x100]
	cmp r0, r8
	ldreq fp, [sp, #0x18]
_0233EB00:
	ldr r0, [sp, #0x18]
	add r4, r4, #0x104
	add r0, r0, #1
	str r0, [sp, #0x18]
	add r5, r5, #0x104
_0233EB14:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0233EADC
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	bne _0233EB48
	add r2, sp, #0x18
	mov r0, sl
	mov r1, sb
	mov r3, r2
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
_0233EB48:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0233EC1C ; =UpdatePlaybackControlsMenu
	cmp sb, #0
	str r0, [r7]
	str sl, [r7, #0x100]
	beq _0233EBA4
	add r5, r7, #0x104
	mov r4, #9
_0233EB8C:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0233EB8C
	ldmia sb, {r0, r1}
	stmia r5, {r0, r1}
_0233EBA4:
	ldr r0, [sp, #0x14]
	str fp, [r7, #0x104]
	str r0, [r7, #0x19c]
	ldr r0, [sp, #0x10]
	mov r2, #0
	str r0, [r7, #0x1a0]
	str r2, [r7, #0x1a4]
	strb r2, [r7, #0x1a8]
	strb r2, [r7, #0x1a9]
	str r2, [r7, #0x1ac]
	strb r2, [r7, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0x2c
	mov r5, r0
	bl GetWindowRectangle
	ldr r4, [sp, #0x18]
	add r3, sp, #0x2c
	str r4, [sp]
	mov r1, sl
	add r0, r7, #8
	add r2, r7, #0x104
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r5
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233EC18: .word PLAYBACK_CONTROLS_MENU_DEFAULT_WINDOW_PARAMS
_0233EC1C: .word UpdatePlaybackControlsMenu
	arm_func_end CreatePlaybackControlsMenu

	arm_func_start ov09_0233EC20
ov09_0233EC20: ; 0x0233EC20
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1a4]
	mov r1, #0
	strb r1, [r0, #0x1a8]
	strb r1, [r0, #0x1a9]
	str r1, [r0, #0x1ac]
	ldr r1, [r0, #0x100]
	bic r1, r1, #0x800000
	str r1, [r0, #0x100]
	add r0, r0, #8
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ov09_0233EC20

	arm_func_start ClosePlaybackControlsMenu
ClosePlaybackControlsMenu: ; 0x0233EC58
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl ov01_02330E38
	ldr r0, [r4, #0x19c]
	bl MemFree
	ldr r0, [r4, #0x1a0]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ClosePlaybackControlsMenu

	arm_func_start ov09_0233EC98
ov09_0233EC98: ; 0x0233EC98
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x1a4]
	cmp r0, #3
	cmpne r0, #4
	cmpne r0, #8
	movne r0, #0
	ldmneia sp!,  {r3, r4, r5, pc}
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1a8]
	strb r2, [r4, #0x1a9]
	mov r0, r5
	sub r1, r2, #4
	str r2, [r4, #0x1ac]
	bl sub_0202830C
	mov r0, r5
	add r1, r4, #8
	bl sub_02028948
	mov r0, #5
	str r0, [r4, #0x1a4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov09_0233EC98

	arm_func_start IsPlaybackControlsMenuActive
IsPlaybackControlsMenuActive: ; 0x0233ECFC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a4]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsPlaybackControlsMenuActive

	arm_func_start ov09_0233ED1C
ov09_0233ED1C: ; 0x0233ED1C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a8]
	cmp r1, #0
	beq _0233ED7C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x14]
	cmp r1, #0
	ldrne r4, [r0, #0x1a0]
	ldrb r1, [r0, #0x1a9]
	ldreq r4, [r0, #0x19c]
	add r0, r0, #8
	cmp r1, #0
	beq _0233ED68
	bl sub_0203258C
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0233ED68:
	bl sub_02032578
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0233ED7C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov09_0233ED1C

	arm_func_start UpdatePlaybackControlsMenu
UpdatePlaybackControlsMenu: ; 0x0233ED84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x34
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x1a4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0233F12C
_0233EDA4: ; jump table
	b _0233EDC0 ; case 0
	b _0233EDD8 ; case 1
	b _0233EDEC ; case 2
	b _0233EE4C ; case 3
	b _0233F094 ; case 4
	b _0233F0A4 ; case 5
	b _0233F0F4 ; case 6
_0233EDC0:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0233F12C
	mov r0, #2
	str r0, [r4, #0x1a4]
_0233EDD8:
	ldr r0, [r4, #0x1a4]
	cmp r0, #1
	moveq r0, #2
	streq r0, [r4, #0x1a4]
	beq _0233F12C
_0233EDEC:
	mov r0, r6
	bl ov09_0233F138
	ldr r0, [r4, #0x100]
	tst r0, #0x800000
	beq _0233EE28
	mov r0, #8
	str r0, [r4, #0x1a4]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a8]
	strb r0, [r4, #0x1a9]
	str r0, [r4, #0x1ac]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0233F12C
_0233EE28:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a8]
	strb r0, [r4, #0x1a9]
	str r0, [r4, #0x1ac]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0233F12C
_0233EE4C:
	bl sub_02003B5C
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	add r1, sp, #0xc
	add r2, sp, #0x10
	add r0, r4, #8
	and r3, r3, #0xff
	bl sub_02031C98
	ldr r1, [sp, #0xc]
	mov r5, r0
	cmp r1, #0
	bne _0233EECC
	ldr r0, [r4, #0x100]
	tst r0, #1
	beq _0233EECC
	mov r3, #0
	ldr r2, _0233F134 ; =0x00000408
	add r1, sp, #0x10
	str r3, [sp]
	mov ip, #1
	add r0, r4, #8
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0233EECC
	add r0, r4, #8
	bl sub_02032684
	ldr r0, [sp, #0xc]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #0xc]
_0233EECC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0233EEEC
	add r1, sp, #0xc
	add r2, sp, #0x10
	add r0, r4, #8
	bl sub_02033758
	orr r5, r5, r0
_0233EEEC:
	add r0, r4, #8
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #0xc]
	add r0, r4, #8
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0233EF18
	mov r0, r6
	bl ov09_0233F138
_0233EF18:
	ldr r2, [sp, #0xc]
	tst r2, #1
	beq _0233EFBC
	add r0, r4, #8
	bl sub_02032578
	ldr r2, [r4, #4]
	ldrb r1, [r2, #0x15]
	cmp r1, #0
	cmpne r0, #3
	beq _0233EF58
	mov r0, r2
	bl ov09_0233DB84
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233F078
_0233EF58:
	add r0, r4, #8
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0233EFAC
	ldr r0, [r4, #0x100]
	tst r0, #0x80000000
	bne _0233EF80
	add r0, r4, #8
	mov r1, #0
	bl PlayWindowInputSound
_0233EF80:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a8]
	strb r0, [r4, #0x1a9]
	ldr r1, [sp, #0xc]
	sub r0, r0, #4
	str r1, [r4, #0x1ac]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a4]
	b _0233F078
_0233EFAC:
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233F078
_0233EFBC:
	tst r2, #2
	beq _0233F01C
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x15]
	cmp r1, #0
	beq _0233EFE8
	bl ov09_0233DB84
	add r0, r4, #8
	mov r1, #2
	bl PlayWindowInputSound
	b _0233F078
_0233EFE8:
	add r0, r4, #8
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a8]
	strb r0, [r4, #0x1a9]
	ldr r1, [sp, #0xc]
	sub r0, r0, #6
	str r1, [r4, #0x1ac]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a4]
	b _0233F078
_0233F01C:
	add r0, sp, #8
	str r0, [sp]
	ldr r0, [r4, #4]
	add r1, r4, #8
	mov r3, #0
	bl ov09_0233DB90
	cmp r0, #0
	beq _0233F064
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a8]
	strb r0, [r4, #0x1a9]
	ldr r1, [sp, #0xc]
	sub r0, r0, #4
	str r1, [r4, #0x1ac]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a4]
_0233F064:
	ldrb r0, [sp, #8]
	cmp r0, #0
	beq _0233F078
	mov r0, r6
	bl ov09_0233F138
_0233F078:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #8
	bl sub_02028948
	ldr r1, [r4, #4]
	mov r0, #3
	bl ov01_02330E38
	b _0233F12C
_0233F094:
	add r0, r4, #8
	bl sub_02032070
	cmp r0, #0
	bne _0233F12C
_0233F0A4:
	ldrb r0, [r4, #0x1a9]
	cmp r0, #0
	bne _0233F0D8
	ldr r0, [r4, #0x100]
	tst r0, #0x400000
	beq _0233F0EC
	mov r0, r6
	bl ov09_0233F138
	mvn r0, #3
	str r0, [r6, #0xb8]
	mov r0, #8
	str r0, [r4, #0x1a4]
	b _0233F12C
_0233F0D8:
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	movne r0, #8
	strne r0, [r4, #0x1a4]
	bne _0233F12C
_0233F0EC:
	mov r0, #6
	str r0, [r4, #0x1a4]
_0233F0F4:
	mov r0, #0
	mov r1, r0
	bl ov01_02330E38
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0233F12C
	ldrb r0, [r4, #0x1a9]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x1a4]
_0233F12C:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0233F134: .word 0x00000408
	arm_func_end UpdatePlaybackControlsMenu

	arm_func_start ov09_0233F138
ov09_0233F138: ; 0x0233F138
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r4, [sl, #0xc]
	mov r7, #0
	ldr r0, [r4, #0x100]
	ldr r5, [r4, #0x19c]
	tst r0, #0x200
	ldrne r8, [r4, #0x164]
	ldrsb r0, [sl, #0x10]
	ldr r6, [r4, #0x1a0]
	moveq r8, #0
	bl sub_02027B1C
	b _0233F1DC
_0233F16C:
	mov r1, #0
	cmp r8, #0
	beq _0233F188
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0233F188:
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	movne fp, r6
	moveq fp, r5
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r4, #8
	bl sub_020328D8
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r3, fp
	mov r1, #0xd
	bl sub_020263C8
	add r7, r7, #1
	add r5, r5, #0x104
	add r6, r6, #0x104
_0233F1DC:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0233F16C
	ldrsb r1, [sl, #0x10]
	add r0, r4, #8
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldr r1, [r4, #4]
	mov r0, #3
	bl ov01_02330E38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov09_0233F138

	arm_func_start CreateInputLockBox
CreateInputLockBox: ; 0x0233F210
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r7, r0
	mov r6, r1
	mov r0, #0x2b0
	mov r1, #8
	mov r5, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	ldrh r1, [sp, #0x40]
	str r8, [r4, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0xa0]
	mov r1, #0
	str r1, [sp]
	ldrh r2, [r0, #0xa0]
	ldr r3, _0233F3B4 ; =0x0000C402
	add r0, r4, #0x1a8
	mov r1, #0x100
	bl PreprocessStringFromId
	add r0, r4, #0x1a8
	bl sub_020265A8
	cmp r7, #0
	mov ip, r0
	ldreq r0, _0233F3B8 ; =INPUT_LOCK_BOX_DEFAULT_WINDOW_PARAMS
	str ip, [r4, #0x1a4]
	addeq r7, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r7, {r0, r1, r2, r3}
	addne lr, sp, #0x18
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0233F3BC ; =UpdateInputLockBox
	str r4, [sp, #0x24]
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	cmp r0, #0
	addeq r1, ip, #7
	moveq r0, r1, asr #2
	addeq r0, r1, r0, lsr #29
	moveq r0, r0, asr #3
	streqb r0, [sp, #0x1e]
	ldrb r0, [sp, #0x1f]
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sp, #0x1f]
	tst r6, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r6, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldrb r1, [sp, #0x1e]
	ldr r0, [r4, #0x1a4]
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x2ac]
	ldrb r0, [sp, #0x1f]
	mov r0, r0, lsl #3
	sub r0, r0, #0xc
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x2a8]
	ldr r0, [r4, #0x2ac]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r4, #0x2ac]
	ldr r0, _0233F3BC ; =UpdateInputLockBox
	cmp r5, #0
	str r0, [r4]
	str r6, [r4, #0x100]
	beq _0233F368
	add ip, r4, #0x104
	mov r7, #9
_0233F350:
	ldmia r5!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _0233F350
	ldmia r5, {r0, r1}
	stmia ip, {r0, r1}
_0233F368:
	mov r2, #0
	add r0, sp, #0x18
	mov r1, #3
	str r2, [r4, #0x19c]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r7, r0
	bl GetWindowRectangle
	mov r5, #1
	str r5, [sp]
	add r3, sp, #8
	mov r1, r6
	add r0, r4, #8
	add r2, r4, #0x104
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r7
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233F3B4: .word 0x0000C402
_0233F3B8: .word INPUT_LOCK_BOX_DEFAULT_WINDOW_PARAMS
_0233F3BC: .word UpdateInputLockBox
	arm_func_end CreateInputLockBox

	arm_func_start CloseInputLockBox
CloseInputLockBox: ; 0x0233F3C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseInputLockBox

	arm_func_start IsInputLockBoxActive
IsInputLockBoxActive: ; 0x0233F3DC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #4
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsInputLockBoxActive

	arm_func_start UpdateInputLockBox
UpdateInputLockBox: ; 0x0233F3FC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233F564
_0233F41C: ; jump table
	b _0233F42C ; case 0
	b _0233F444 ; case 1
	b _0233F48C ; case 2
	b _0233F548 ; case 3
_0233F42C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0233F564
	mov r0, #1
	str r0, [r4, #0x19c]
_0233F444:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x2ac]
	ldr r2, [r6, #0x2a8]
	add r3, r6, #0x1a8
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	ldr r1, [r6, #4]
	mov r0, #1
	bl ov01_02330E38
	mov r0, #2
	str r0, [r4, #0x19c]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	b _0233F564
_0233F48C:
	bl sub_02003B5C
	cmp r0, #0
#ifdef EUROPE
	add r0, sp, #8
	beq _0233FC28
	mov r5, #0
	bl sub_02006BFC
	b _0233F4AC
_0233FC28:
	ldr r1, [r4, #0x100]
#else
	movne r5, #0
	bne _0233F4AC
	ldr r1, [r4, #0x100]
	add r0, sp, #8
#endif
	bl sub_02031914
	mov r5, r0
_0233F4AC:
	tst r5, #0xf3
	beq _0233F4CC
	ldr r0, [r4, #4]
	bl ov09_0233DB84
	ldr r0, [r4, #0x100]
	mov r1, #2
	bl sub_02031A3C
	b _0233F538
_0233F4CC:
	tst r5, #0x100
	beq _0233F4EC
	ldr r0, [r4, #0x100]
	mov r1, #0
	bl sub_02031A3C
	mov r0, #3
	str r0, [r4, #0x19c]
	b _0233F538
_0233F4EC:
	add r0, sp, #8
	mov r1, #2
	mov r2, #0
	bl sub_02006C8C
	cmp r0, #0
	beq _0233F51C
	ldr r0, [r4, #0x100]
	mov r1, #2
	bl sub_02031A3C
	ldr r0, [r4, #4]
	bl ov09_0233DB84
	b _0233F538
_0233F51C:
	add r0, sp, #4
	str r0, [sp]
	ldr r0, [r4, #4]
	mov r2, r5
	add r1, r4, #8
	mov r3, #0
	bl ov09_0233DB90
_0233F538:
	ldr r1, [r4, #4]
	mov r0, #1
	bl ov01_02330E38
	b _0233F564
_0233F548:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0x19c]
_0233F564:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end UpdateInputLockBox
	; 0x0233F56C

	.rodata
	.global ov09_0233F56C
ov09_0233F56C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x0C, 0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov09_0233F57C
ov09_0233F57C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x08, 0x0C, 0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov09_0233F58C
ov09_0233F58C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov09_0233F59C
ov09_0233F59C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x1C, 0x02, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov09_0233F5AC
ov09_0233F5AC:
#ifdef JAPAN
#define OV09_DATA_OFFSET 0x4A
#else
#define OV09_DATA_OFFSET 0
#endif
	.word 0x4F3 + OV09_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x4F5 + OV09_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x4F6 + OV09_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x4F7 + OV09_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x4F8 + OV09_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x4F9 + OV09_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global ov09_0233F5E4
ov09_0233F5E4:
	.word 0x4F4 + OV09_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x4F5 + OV09_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x4F6 + OV09_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x4F7 + OV09_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x4F8 + OV09_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x4F9 + OV09_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global ov09_0233F61C
ov09_0233F61C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00
	.byte 0x75, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov09_0233F664
ov09_0233F664:
	.byte 0x01, 0x00, 0x02, 0x00, 0x06, 0x00, 0x45, 0x00
	.byte 0x15, 0x00, 0x0E, 0x00, 0x82, 0x00, 0x07, 0x00, 0x49, 0x00, 0x46, 0x00, 0x08, 0x00, 0x16, 0x00
	.byte 0x05, 0x00, 0x09, 0x00, 0x83, 0x00, 0x4A, 0x00, 0x4C, 0x00, 0x17, 0x00, 0x0F, 0x00, 0x4E, 0x00
	.byte 0x04, 0x00, 0x0D, 0x00, 0x4F, 0x00, 0x18, 0x00, 0x0C, 0x00, 0x86, 0x00, 0x9F, 0x00, 0xA0, 0x00
	.byte 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00
	.byte 0x21, 0x00, 0x0B, 0x00, 0x85, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00
	.byte 0x48, 0x00, 0x50, 0x00, 0x51, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x2A, 0x00, 0x2B, 0x00
	.byte 0x2C, 0x00, 0x4B, 0x00, 0x3D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x11, 0x00
	.byte 0x4D, 0x00, 0x52, 0x00, 0x53, 0x00, 0x32, 0x00, 0x33, 0x00, 0x6C, 0x00, 0x84, 0x00, 0x10, 0x00
	.byte 0x54, 0x00, 0x55, 0x00, 0x79, 0x00, 0x7A, 0x00, 0x56, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00
	.byte 0x5B, 0x00, 0x34, 0x00, 0x0A, 0x00, 0xB1, 0x00, 0x9B, 0x00, 0x5F, 0x00, 0x9C, 0x00, 0x61, 0x00
	.byte 0x9D, 0x00, 0x9E, 0x00, 0x35, 0x00, 0x36, 0x00, 0x3C, 0x00, 0x38, 0x00, 0x12, 0x00, 0x39, 0x00
	.byte 0x3A, 0x00, 0x3B, 0x00, 0x7B, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x37, 0x00, 0x2D, 0x00, 0x91, 0x00
	.byte 0x03, 0x00, 0x81, 0x00, 0x87, 0x00, 0x88, 0x00, 0x89, 0x00, 0x8D, 0x00, 0x8E, 0x00, 0x8A, 0x00
	.byte 0x5E, 0x00, 0xB0, 0x00, 0x92, 0x00, 0x93, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0x62, 0x00
	.byte 0x63, 0x00, 0x8C, 0x00, 0xA6, 0x00, 0x60, 0x00, 0x8B, 0x00, 0xA1, 0x00, 0x8F, 0x00, 0x90, 0x00
	.byte 0xA5, 0x00, 0xA7, 0x00, 0x94, 0x00, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0xA8, 0x00, 0x98, 0x00
	.byte 0xA9, 0x00, 0x99, 0x00, 0x9A, 0x00, 0xAA, 0x00, 0xAB, 0x00, 0xAE, 0x00, 0xAC, 0x00, 0xAF, 0x00
	.byte 0xAD, 0x00, 0x00, 0x00
	.global ov09_0233F780
ov09_0233F780:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30, 0x32, 0x61
	.byte 0x2E, 0x62, 0x67, 0x70, 0x00, 0x00, 0x00, 0x00
	.global JUKEBOX_TRACK_MENU_DEFAULT_WINDOW_PARAMS
JUKEBOX_TRACK_MENU_DEFAULT_WINDOW_PARAMS:
	.word UpdateJukeboxTrackMenu
	.byte 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global PLAYBACK_CONTROLS_MENU_DEFAULT_WINDOW_PARAMS
PLAYBACK_CONTROLS_MENU_DEFAULT_WINDOW_PARAMS:
	.word UpdatePlaybackControlsMenu
	.byte 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global INPUT_LOCK_BOX_DEFAULT_WINDOW_PARAMS
INPUT_LOCK_BOX_DEFAULT_WINDOW_PARAMS:
	.word UpdateInputLockBox
	.byte 0x0A, 0x08, 0x0C, 0x02
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data
	.global ov09_0233F7E0
ov09_0233F7E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
