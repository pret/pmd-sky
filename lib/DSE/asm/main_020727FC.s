	.include "asm/macros.inc"
	.include "include/main_020727FC.inc"

	.text

	arm_func_start DseTrackEvent_SetLfoParameter
DseTrackEvent_SetLfoParameter: ; 0x020727FC
	ldrb r1, [r3, #0x61]
	ldrb ip, [r0]
	add r2, r3, #0x74
	add r1, r2, r1, lsl #4
	ldrb r2, [r0, #1]
	cmp ip, #0xa
	addls pc, pc, ip, lsl #2
	b _02072930
_0207281C: ; jump table
	b _02072930 ; case 0
	b _02072848 ; case 1
	b _02072850 ; case 2
	b _02072858 ; case 3
	b _02072860 ; case 4
	b _02072868 ; case 5
	b _020728E0 ; case 6
	b _020728EC ; case 7
	b _020728FC ; case 8
	b _02072910 ; case 9
	b _02072924 ; case 10
_02072848:
	strb r2, [r3, #0x61]
	b _02072930
_02072850:
	strb r2, [r1, #1]
	b _02072930
_02072858:
	strb r2, [r1, #2]
	b _02072930
_02072860:
	strb r2, [r1, #3]
	b _02072930
_02072868:
	ldrb r3, [r1, #2]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _020728CC
_02072878: ; jump table
	b _020728CC ; case 0
	b _0207288C ; case 1
	b _0207289C ; case 2
	b _020728AC ; case 3
	b _020728BC ; case 4
_0207288C:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_0207289C:
	mvn r3, #0x13
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728AC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728BC:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728CC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
_020728D8:
	str r2, [r1, #4]
	b _02072930
_020728E0:
	add r2, r2, r2, lsl #2
	strh r2, [r1, #8]
	b _02072930
_020728EC:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xa]
	b _02072930
_020728FC:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #0xa]
	b _02072930
_02072910:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff
	orr r2, r3, r2, lsl #8
	strh r2, [r1, #0xa]
	b _02072930
_02072924:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xc]
_02072930:
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_SetLfoParameter
