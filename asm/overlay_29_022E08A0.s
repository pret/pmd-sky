	.include "asm/macros.inc"
	.include "overlay_29_022E08A0.inc"

	.text

	arm_func_start IsMarowakTrainingMaze
IsMarowakTrainingMaze: ; 0x022E08A0
	ldr r0, _022E08C8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xb4
	blo _022E08C0
	cmp r0, #0xbe
	movls r0, #1
	bxls lr
_022E08C0:
	mov r0, #0
	bx lr
	.align 2, 0
_022E08C8: .word DUNGEON_PTR
	arm_func_end IsMarowakTrainingMaze

	arm_func_start FixedRoomIsSubstituteRoom
FixedRoomIsSubstituteRoom: ; 0x022E08CC
	ldr r0, _022E08F0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0x6e
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E08F0: .word DUNGEON_PTR
	arm_func_end FixedRoomIsSubstituteRoom

	arm_func_start ov29_022E08F4
ov29_022E08F4: ; 0x022E08F4
	ldr r0, _022E0924 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E0924: .word DUNGEON_PTR
	arm_func_end ov29_022E08F4

	arm_func_start StoryRestrictionsEnabled
StoryRestrictionsEnabled: ; 0x022E0928
	ldr r0, _022E0958 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x75c]
	cmp r0, #0
	beq _022E0948
	ldrb r0, [r1, #0x75e]
	cmp r0, #0
	beq _022E0950
_022E0948:
	mov r0, #1
	bx lr
_022E0950:
	mov r0, #0
	bx lr
	.align 2, 0
_022E0958: .word DUNGEON_PTR
	arm_func_end StoryRestrictionsEnabled

	arm_func_start GetScenarioBalanceVeneer
GetScenarioBalanceVeneer: ; 0x022E095C
	ldr ip, _022E0964 ; =GetScenarioBalance
	bx ip
	.align 2, 0
_022E0964: .word GetScenarioBalance
	arm_func_end GetScenarioBalanceVeneer

	arm_func_start FadeToBlack
FadeToBlack: ; 0x022E0968
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov29_0233A248
	bl ov29_022E0DFC
	mov r0, #2
	mov r1, #0x1000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #2
	mov r1, #0x1000
	mov r2, #1
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl WaitUntilFadeIsFinished
	bl ov29_022E0E44
	mov r0, #1
	bl ov29_0233A248
	bl ov29_022DE854
	bl ov29_022DE15C
	bl ov29_022E8778
	mov r0, #2
	mov r1, #0x4f
	bl ov29_022EA370
	mov r0, #1
	bl ov29_022E34B0
	mov r1, #1
	ldr r0, _022E09E4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a9]
#else
	strb r1, [r0, #0x24d]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E09E4: .word DUNGEON_PTR
	arm_func_end FadeToBlack
