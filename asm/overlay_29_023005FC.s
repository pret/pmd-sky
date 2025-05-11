	.include "asm/macros.inc"
	.include "overlay_29_023005FC.inc"

	.text

	arm_func_start IsMonsterMuzzled
IsMonsterMuzzled: ; 0x023005FC
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterMuzzled

	arm_func_start MonsterHasMiracleEyeStatus
MonsterHasMiracleEyeStatus: ; 0x02300618
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xf5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterHasMiracleEyeStatus
