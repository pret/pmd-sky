	.include "asm/macros.inc"
	.include "overlay_29_022E4BB4.inc"

	.text

	arm_func_start ov29_022E4BB4
ov29_022E4BB4: ; 0x022E4BB4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4BB4

	arm_func_start ov29_022E4C00
ov29_022E4C00: ; 0x022E4C00
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0xf
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4C00

	arm_func_start ov29_022E4C4C
ov29_022E4C4C: ; 0x022E4C4C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E4C4C

	arm_func_start ov29_022E4C84
ov29_022E4C84: ; 0x022E4C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4CD0 ; =0x000001F7
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4CD0 ; =0x000001F7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4CD0: .word 0x000001F7
	arm_func_end ov29_022E4C84

	arm_func_start ov29_022E4CD4
ov29_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4D20 ; =0x000001F9
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4D20 ; =0x000001F9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4D20: .word 0x000001F9
	arm_func_end ov29_022E4CD4

	arm_func_start ov29_022E4D24
ov29_022E4D24: ; 0x022E4D24
	bx lr
	arm_func_end ov29_022E4D24

	arm_func_start PlayOffensiveStatDownEffect
PlayOffensiveStatDownEffect: ; 0x022E4D28
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4D80
	mov r0, #0x194
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4DB8
_022E4D80:
	ldr r0, _022E4DC8 ; =0x00000193
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4DC8 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4DB8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4DC8: .word 0x00000193
	arm_func_end PlayOffensiveStatDownEffect

	arm_func_start PlayDefensiveStatDownEffect
PlayDefensiveStatDownEffect: ; 0x022E4DCC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4E24
	ldr r0, _022E4E6C ; =0x0000018F
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E6C ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4E5C
_022E4E24:
	ldr r0, _022E4E70 ; =0x00000191
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4E70 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4E5C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4E6C: .word 0x0000018F
_022E4E70: .word 0x00000191
	arm_func_end PlayDefensiveStatDownEffect

	arm_func_start PlayOffensiveStatUpEffect
PlayOffensiveStatUpEffect: ; 0x022E4E74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4ECC
	ldr r0, _022E4F14 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4F14 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4F04
_022E4ECC:
	ldr r0, _022E4F18 ; =0x00000192
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4F04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4F14: .word 0x000001A9
_022E4F18: .word 0x00000192
	arm_func_end PlayOffensiveStatUpEffect

	arm_func_start PlayDefensiveStatUpEffect
PlayDefensiveStatUpEffect: ; 0x022E4F1C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E4F74
	ldr r0, _022E4FBC ; =0x0000018E
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4FAC
_022E4F74:
	mov r0, #0x190
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4FAC:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E4FBC: .word 0x0000018E
	arm_func_end PlayDefensiveStatUpEffect

	arm_func_start PlayOffensiveStatMultiplierUpEffect
PlayOffensiveStatMultiplierUpEffect: ; 0x022E4FC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5018
	ldr r0, _022E5060 ; =0x000001A9
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5060 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5050
_022E5018:
	ldr r0, _022E5064 ; =0x00000192
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5050:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5060: .word 0x000001A9
_022E5064: .word 0x00000192
	arm_func_end PlayOffensiveStatMultiplierUpEffect

	arm_func_start PlayOffensiveStatMultiplierDownEffect
PlayOffensiveStatMultiplierDownEffect: ; 0x022E5068
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E50C0
	mov r0, #0x194
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x194
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E50F8
_022E50C0:
	ldr r0, _022E5108 ; =0x00000193
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5108 ; =0x00000193
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E50F8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5108: .word 0x00000193
	arm_func_end PlayOffensiveStatMultiplierDownEffect

	arm_func_start PlayDefensiveStatMultiplierUpEffect
PlayDefensiveStatMultiplierUpEffect: ; 0x022E510C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5164
	ldr r0, _022E51AC ; =0x0000018E
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E519C
_022E5164:
	mov r0, #0x190
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E519C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E51AC: .word 0x0000018E
	arm_func_end PlayDefensiveStatMultiplierUpEffect

	arm_func_start PlayDefensiveStatMultiplierDownEffect
PlayDefensiveStatMultiplierDownEffect: ; 0x022E51B0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5208
	ldr r0, _022E5250 ; =0x0000018F
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5250 ; =0x0000018F
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5240
_022E5208:
	ldr r0, _022E5254 ; =0x00000191
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5254 ; =0x00000191
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5240:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5250: .word 0x0000018F
_022E5254: .word 0x00000191
	arm_func_end PlayDefensiveStatMultiplierDownEffect

	arm_func_start PlayHitChanceUpEffect
PlayHitChanceUpEffect: ; 0x022E5258
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E52B0
	mov r0, #0x18c
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E52E8
_022E52B0:
	mov r0, #0xd
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xd
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E52E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end PlayHitChanceUpEffect

	arm_func_start PlayHitChanceDownEffect
PlayHitChanceDownEffect: ; 0x022E52F8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _022E5350
	ldr r0, _022E5398 ; =0x0000018D
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E5398 ; =0x0000018D
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E5388
_022E5350:
	mov r0, #0xe
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E5388:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022E5398: .word 0x0000018D
	arm_func_end PlayHitChanceDownEffect

	arm_func_start PlayExclamationPointEffect__022E5D4C
PlayExclamationPointEffect__022E5D4C: ; 0x022E539C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E53E8 ; =0x00000143
	bl GetEffectAnimationWanOffset
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E53E8 ; =0x00000143
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E53E8: .word 0x00000143
	arm_func_end PlayExclamationPointEffect__022E5D4C

	arm_func_start ov29_022E53EC
ov29_022E53EC: ; 0x022E53EC
	bx lr
	arm_func_end ov29_022E53EC

	arm_func_start ov29_022E53F0
ov29_022E53F0: ; 0x022E53F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x19
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x19
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E53F0

	arm_func_start ov29_022E543C
ov29_022E543C: ; 0x022E543C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r1, #2
	mov ip, #0
	stmia sp, {r1, ip}
	sub r1, ip, #1
	str r1, [sp, #8]
	mov r1, #0x15
	mov r2, #1
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022E543C

	arm_func_start ov29_022E5474
ov29_022E5474: ; 0x022E5474
	bx lr
	arm_func_end ov29_022E5474

	arm_func_start ov29_022E5478
ov29_022E5478: ; 0x022E5478
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022E5508 ; =DUNGEON_PTR
	mov r4, r0
	ldr r2, [r2]
	ldr r0, [r1, #8]
	ldrb r1, [r2, #0x1c5]
	cmp r1, #0
	beq _022E54A0
	bl ov29_0230D618
_022E54A0:
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E54BC
_022E54AC: ; jump table
	b _022E54BC ; case 0
	b _022E54C4 ; case 1
	b _022E54CC ; case 2
	b _022E54D4 ; case 3
_022E54BC:
	mov r1, #8
	b _022E54D8
_022E54C4:
	mov r1, #9
	b _022E54D8
_022E54CC:
	mov r1, #0xa
	b _022E54D8
_022E54D4:
	mov r1, #0xb
_022E54D8:
	mov ip, #0
	mov r2, #1
	str ip, [sp]
	str r2, [sp, #4]
	sub r0, r2, #2
	str r0, [sp, #8]
	mov r0, r4
	mov r3, #3
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5508: .word DUNGEON_PTR
	arm_func_end ov29_022E5478

	arm_func_start ov29_022E550C
ov29_022E550C: ; 0x022E550C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E5558 ; =0x0000013E
	bl GetEffectAnimationWanOffset
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x13c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5558: .word 0x0000013E
	arm_func_end ov29_022E550C

	arm_func_start ov29_022E555C
ov29_022E555C: ; 0x022E555C
	bx lr
	arm_func_end ov29_022E555C

	arm_func_start ov29_022E5560
ov29_022E5560: ; 0x022E5560
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r1
	cmp r2, #1
	bne _022E55B0
	mov r0, #0xf8
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf8
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E55E8
_022E55B0:
	mov r0, #0xf9
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xf9
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E55E8:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E5560

	arm_func_start ov29_022E55F0
ov29_022E55F0: ; 0x022E55F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #0x2a
	mov r4, r1
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x2a
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E55F0
