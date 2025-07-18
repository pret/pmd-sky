	.include "asm/macros.inc"
	.include "overlay_31_02382FBC.inc"

	.text

; https://decomp.me/scratch/jiDJb
	arm_func_start HandleStairsMenu
HandleStairsMenu: ; 0x02382FBC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x138
	ldr r0, _02383218 ; =ov31_0238A2A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0238320C
_02382FDC: ; jump table
	b _02382FF4 ; case 0
	b _0238308C ; case 1
	b _0238320C ; case 2
	b _02383170 ; case 3
	b _023831DC ; case 4
	b _0238320C ; case 5
_02382FF4:
	ldr r2, [r1, #0x14]
	ldr r3, _0238321C ; =DUNGEON_SUBMENU_ITEMS_1
	ldr r0, _02383220 ; =DUNGEON_WINDOW_PARAMS_7
	add r3, r3, r2, lsl #5
	ldr r1, _02383224 ; =0x00400013
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02383218 ; =ov31_0238A2A0
	ldr r3, _02383228 ; =ov31_02389E22
	ldr r4, [r1, #4]
	mov r2, #0x10
	strb r0, [r4, #1]
	ldr r0, [r1, #4]
	mov r4, #0
	ldr r1, [r0, #0x14]
	ldr r0, _0238322C ; =DUNGEON_WINDOW_PARAMS_6
	mov r1, r1, lsl #2
	ldrh r3, [r3, r1]
	str r2, [sp, #0xac]
	ldr r1, _02383230 ; =0x80000813
	strh r3, [sp, #0xa8]
	str r4, [sp]
	ldr r3, _02383234 ; =StairsSubheadingCallback
	add r2, sp, #0xa0
	str r4, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r2, _02383218 ; =ov31_0238A2A0
	mov r1, r4
	ldr r3, [r2, #4]
	strb r0, [r3]
	ldr r0, [r2, #4]
	ldrsb r0, [r0]
	bl SetAdvancedTextBoxField0x1C4
	ldr r0, _02383218 ; =ov31_0238A2A0
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0238320C
_0238308C:
	ldrsb r0, [r1, #1]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0238320C
	ldr r0, _02383218 ; =ov31_0238A2A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202ABB0
	ldr r1, _02383218 ; =ov31_0238A2A0
	ldr r1, [r1, #4]
	str r0, [r1, #4]
	bl ov31_0238328C
	ldr r0, _02383218 ; =ov31_0238A2A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	add r0, r0, #1
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238320C
_023830D8: ; jump table
	b _02383168 ; case 0
	b _0238320C ; case 1
	b _023830F4 ; case 2
	b _023830F4 ; case 3
	b _023830F4 ; case 4
	b _023830F4 ; case 5
	b _02383144 ; case 6
_023830F4:
	ldr r1, [r1, #8]
	ldr r0, _02383238 ; =ov29_0237C91C
	ldr r4, [r1, #0xb4]
	ldrh r1, [r0]
	add r0, r4, #0x4a
	bl SetMonsterActionFields
	mov r0, #0
	strb r0, [r4, #0x4e]
	strh r0, [r4, #0x50]
	strh r0, [r4, #0x52]
	strb r0, [r4, #0x54]
	strh r0, [r4, #0x56]
	strh r0, [r4, #0x58]
	bl GetLeader
	ldr r0, [r0, #0xb4]
	mov r1, #0x26
	add r0, r0, #0x4a
	bl SetMonsterActionFields
	mov r0, #4
	b _02383210
_02383144:
	bl ov31_0238328C
	ldr r0, _02383218 ; =ov31_0238A2A0
	mov r3, #2
	ldr r2, [r0, #4]
	mov r1, #3
	str r3, [r2, #0x10]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0238320C
_02383168:
	mov r0, #4
	b _02383210
_02383170:
	ldr r0, [r1, #0x10]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r1, #0x10]
	bne _0238320C
	mov r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, [r1, #0x14]
	ldr r0, _02383228 ; =ov31_02389E22
	mov r1, r1, lsl #2
	ldrh r1, [r0, r1]
	mov ip, #1
	ldr r0, _0238323C ; =DUNGEON_WINDOW_PARAMS_5
	strh r1, [sp, #0x10]
	str ip, [sp]
	ldr r1, _02383240 ; =0x00001812
	ldr r3, _02383244 ; =ov31_02383248
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02383218 ; =ov31_0238A2A0
	mov r2, #4
	ldr r3, [r1, #4]
	strb r0, [r3, #2]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	b _0238320C
_023831DC:
	ldrsb r0, [r1, #2]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _0238320C
	ldr r0, _02383218 ; =ov31_0238A2A0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseAdvancedTextBox
	ldr r0, _02383218 ; =ov31_0238A2A0
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
_0238320C:
	mov r0, #1
_02383210:
	add sp, sp, #0x138
	ldmia sp!, {r4, pc}
	.align 2, 0
_02383218: .word ov31_0238A2A0
_0238321C: .word DUNGEON_SUBMENU_ITEMS_1
_02383220: .word DUNGEON_WINDOW_PARAMS_7
_02383224: .word 0x00400013
_02383228: .word ov31_02389E22
_0238322C: .word DUNGEON_WINDOW_PARAMS_6
_02383230: .word 0x80000813
_02383234: .word StairsSubheadingCallback
_02383238: .word ov29_0237C91C
_0238323C: .word DUNGEON_WINDOW_PARAMS_5
_02383240: .word 0x00001812
_02383244: .word ov31_02383248
	arm_func_end HandleStairsMenu

; https://decomp.me/scratch/VPa2L
	arm_func_start ov31_02383248
ov31_02383248: ; 0x02383248
	stmdb sp!, {r4, lr}
	ldr r1, _02383284 ; =ov31_0238A2A0
	ldr r2, _02383288 ; =OVERLAY31_UNKNOWN_STRING_IDS
	ldr r1, [r1, #4]
	mov r4, r0
	ldr r0, [r1, #0x14]
	mov r0, r0, lsl #2
	ldrh r0, [r2, r0]
	bl StringFromId
	mov r3, r0
	mov r0, r4
	mov r1, #4
	mov r2, #0x14
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_02383284: .word ov31_0238A2A0
_02383288: .word OVERLAY31_UNKNOWN_STRING_IDS
	arm_func_end ov31_02383248

; https://decomp.me/scratch/oWQ5d
	arm_func_start ov31_0238328C
ov31_0238328C: ; 0x0238328C
	stmdb sp!, {r3, lr}
	ldr r0, _023832EC ; =ov31_0238A2A0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _023832BC
	bl CloseAdvancedTextBox
	ldr r0, _023832EC ; =ov31_0238A2A0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_023832BC:
	ldr r0, _023832EC ; =ov31_0238A2A0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseParentMenu
	ldr r0, _023832EC ; =ov31_0238A2A0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023832EC: .word ov31_0238A2A0
	arm_func_end ov31_0238328C

; https://decomp.me/scratch/MmxLF
	arm_func_start ov31_023832F0
ov31_023832F0: ; 0x023832F0
	stmdb sp!, {r3, lr}
	ldr r0, _02383324 ; =ov31_0238A2A0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov31_0238328C
	ldr r0, _02383324 ; =ov31_0238A2A0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02383324 ; =ov31_0238A2A0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383324: .word ov31_0238A2A0
	arm_func_end ov31_023832F0
