	.include "asm/macros.inc"
	.include "overlay_29_023496EC.inc"

	.text

	arm_func_start ClearMissionDestinationInfo
ClearMissionDestinationInfo: ; 0x023496EC
	mov ip, #0
	strb ip, [r0]
	strb ip, [r0, #0x18]
	strb ip, [r0, #0x17]
	strb ip, [r0, #0x1a]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	strb ip, [r0, #0x16]
	strh ip, [r0, #0xa]
	strb ip, [r0, #0x1b]
	strb ip, [r0, #0x1c]
	strh ip, [r0, #0xc]
	mov r3, ip
_02349724:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	add r2, r0, ip, lsl #1
	mov ip, r1, asr #0x10
	strh r3, [r2, #0xe]
	cmp ip, #3
	blt _02349724
	strh r3, [r0, #0x14]
	bx lr
	arm_func_end ClearMissionDestinationInfo

	arm_func_start FloorHasMissionMonster
FloorHasMissionMonster: ; 0x02349748
	ldrb r1, [r0]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrb r0, [r0, #1]
	cmp r0, #7
	cmpne r0, #0
	cmpne r0, #2
	cmpne r0, #1
	beq _02349780
	add r0, r0, #0xf8
	and r0, r0, #0xff
	cmp r0, #3
	bhi _02349788
_02349780:
	mov r0, #1
	bx lr
_02349788:
	mov r0, #0
	bx lr
	arm_func_end FloorHasMissionMonster

#ifndef JAPAN
	arm_func_start GetMissionIfActiveOnFloor
GetMissionIfActiveOnFloor: ; 0x02349790
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r4]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r2, [r4, #1]
	ldreqb r1, [r0, #5]
	cmpeq r2, r1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetMissionIfActiveOnFloor
#endif

	arm_func_start ov29_023497C8
ov29_023497C8: ; 0x023497C8
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r4, ip
	b _02349804
_023497D8:
	mov r3, r4, lsl #1
	ldrsh lr, [r1, r3]
	cmp lr, #0
	addne r3, ip, #1
	addne ip, r0, ip, lsl #1
	movne r3, r3, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r3, asr #0x10
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_02349804:
	cmp r4, #2
	cmplt ip, r2
	blt _023497D8
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_023497C8

	arm_func_start ov29_02349818
ov29_02349818: ; 0x02349818
	stmdb sp!, {r4, lr}
	mov r4, #0
	add ip, r4, #1
	mov ip, ip, lsl #0x10
	strh r1, [r0, #0xe]
	cmp r2, #0
	mov ip, ip, asr #0x10
	beq _02349874
	b _02349868
_0234983C:
	mov r1, r4, lsl #1
	ldrsh lr, [r2, r1]
	cmp lr, #0
	addne r1, ip, #1
	addne ip, r0, ip, lsl #1
	movne r1, r1, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r1, asr #0x10
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
_02349868:
	cmp r4, #2
	cmplt ip, r3
	blt _0234983C
_02349874:
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02349818
