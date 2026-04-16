	.include "asm/macros.inc"
	.include "main_0205CA40.inc"

	.text

; https://decomp.me/scratch/HJ1cK
	arm_func_start IsMissionValid
IsMissionValid: ; 0x0205CA40
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrb r1, [r4, #1]
	cmp r1, #0xd
	blo _0205CA6C
	cmp r1, #0xe
	beq _0205CA6C
	ldr r0, _0205CF10 ; =_020A3728
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CA6C:
	cmp r1, #7
	bne _0205CA94
	ldrb r0, [r4, #4]
	bl GetMaxItemsAllowed
	cmp r0, #0
	bne _0205CA94
	ldr r0, _0205CF14 ; =_020A373C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CA94:
	ldrb r2, [r4, #2]
	ldrb r1, [r4, #1]
	cmp r2, #0
	moveq r0, #1
	beq _0205CBC0
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	b _0205CBB0
_0205CAB4: ; jump table
	b _0205CBB0 ; case 0
	b _0205CAF0 ; case 1
	b _0205CB04 ; case 2
	b _0205CB18 ; case 3
	b _0205CB2C ; case 4
	b _0205CBB0 ; case 5
	b _0205CB40 ; case 6
	b _0205CBB0 ; case 7
	b _0205CBB0 ; case 8
	b _0205CB7C ; case 9
	b _0205CB54 ; case 10
	b _0205CB68 ; case 11
	b _0205CBB0 ; case 12
	b _0205CBB0 ; case 13
	b _0205CB90 ; case 14
_0205CAF0:
	cmp r2, #4
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB04:
	cmp r2, #2
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB18:
	cmp r2, #4
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB2C:
	cmp r2, #1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB40:
	cmp r2, #5
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB54:
	cmp r2, #8
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB68:
	cmp r2, #6
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB7C:
	cmp r2, #3
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB90:
	cmp r2, #2
	moveq r0, #0
	beq _0205CBC0
	cmp r2, #3
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CBB0:
	cmp r2, #1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
_0205CBC0:
	cmp r0, #0
	bne _0205CBD8
	ldr r0, _0205CF18 ; =_020A3764
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CBD8:
	mov r0, r1
	add r1, r4, #2
	add r2, r4, #4
	bl sub_0205CF58
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0xe]
	add r1, r4, #2
	mov r3, #1
	bl sub_0205D008
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0x10]
	add r1, r4, #2
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl sub_0205E1E8
	cmp r0, #0
	ldrnesh r2, [r4, #0xe]
	ldrnesh r1, [r4, #0x10]
	cmpne r1, r2
	beq _0205CC60
	ldr r0, _0205CF1C ; =_020A377C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CC60:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	ldreqb r1, [r4, #2]
	cmpeq r1, #0
	beq _0205CC84
	cmp r0, #0xa
	ldreqb r1, [r4, #2]
	cmpeq r1, #6
	bne _0205CCA4
_0205CC84:
	ldrsh r2, [r4, #0x12]
	add r1, r4, #2
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	bne _0205CCC0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCA4:
	ldrsh r1, [r4, #0x12]
	cmp r1, #0
	beq _0205CCC0
	ldr r0, _0205CF20 ; =_020A37A0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCC0:
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0x14]
	add r1, r4, #2
	bl sub_0205D11C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x16]
	cmp r1, #7
	bne _0205CCF8
	ldr r0, _0205CF24 ; =_020A37D0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCF8:
	cmp r1, #8
	blo _0205CD10
	ldr r0, _0205CF24 ; =_020A37D0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD10:
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0205CE1C
_0205CD1C: ; jump table
	b _0205CE24 ; case 0
	b _0205CD38 ; case 1
	b _0205CD38 ; case 2
	b _0205CD38 ; case 3
	b _0205CD38 ; case 4
	b _0205CE24 ; case 5
	b _0205CD9C ; case 6
_0205CD38:
	ldrsh r1, [r4, #0x18]
	cmp r1, #0
	bne _0205CD54
	ldr r0, _0205CF28 ; =_020A37E8
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD54:
	mov r0, r1
	bl IsItemValidVeneer
	cmp r0, #0
	bne _0205CD78
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF28 ; =_020A37E8
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD78:
	ldrsh r0, [r4, #0x18]
	bl IsStorableItem
	cmp r0, #0
	bne _0205CE24
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF2C ; =_020A3808
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD9C:
	ldrsh r1, [r4, #0xe]
	cmp r1, #0
	bne _0205CDB8
	ldr r0, _0205CF30 ; =_020A3830
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDB8:
	ldr r0, _0205CF34 ; =0x00000483
	cmp r1, r0
	blt _0205CDD4
	ldr r0, _0205CF38 ; =_020A3854
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDD4:
	ldrsh r0, [r4, #0x18]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0205CDF8
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF3C ; =_020A387C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDF8:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	beq _0205CE24
	ldrsh r0, [r4, #0x18]
	bl IsMonsterMissionAllowed
	cmp r0, #0
	bne _0205CE24
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE1C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE24:
	ldrb r1, [r4, #0x1a]
	cmp r1, #2
	blo _0205CE40
	ldr r0, _0205CF40 ; =_020A38B4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE40:
	cmp r1, #0
	bne _0205CE68
	ldrh r2, [r4, #0x1c]
	cmp r2, #0x12
	blo _0205CE68
	ldr r0, _0205CF44 ; =_020A38D0
	mov r1, r2
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE68:
	cmp r1, #1
	bne _0205CF08
	ldrsh r0, [r4, #0x1c]
	ldr r1, _0205CF34 ; =0x00000483
	cmp r0, r1
	blt _0205CE90
	ldr r0, _0205CF48 ; =_020A38F0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE90:
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0205CEB0
	ldrsh r1, [r4, #0x1c]
	ldr r0, _0205CF4C ; =_020A3918
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CEB0:
	ldrsh r5, [r4, #0x1c]
	mov r0, r5
	bl GetBaseForm
	cmp r5, r0
	beq _0205CED8
	ldr r0, _0205CF50 ; =_020A3954
	mov r1, r5
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CED8:
	ldrb r0, [r4, #1]
	cmp r0, #0xe
	beq _0205CF08
	mov r0, r5
	bl IsMonsterMissionAllowed
	cmp r0, #0
	bne _0205CF08
	ldrsh r1, [r4, #0x1c]
	ldr r0, _0205CF54 ; =_020A3984
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CF08:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205CF10: .word _020A3728
_0205CF14: .word _020A373C
_0205CF18: .word _020A3764
_0205CF1C: .word _020A377C
_0205CF20: .word _020A37A0
_0205CF24: .word _020A37D0
_0205CF28: .word _020A37E8
_0205CF2C: .word _020A3808
_0205CF30: .word _020A3830
_0205CF34: .word 0x00000483
_0205CF38: .word _020A3854
_0205CF3C: .word _020A387C
_0205CF40: .word _020A38B4
_0205CF44: .word _020A38D0
_0205CF48: .word _020A38F0
_0205CF4C: .word _020A3918
_0205CF50: .word _020A3954
_0205CF54: .word _020A3984
	arm_func_end IsMissionValid
