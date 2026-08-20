	.include "asm/macros.inc"
	.include "main_02017C50.inc"

	.text

	arm_func_start sub_02017C50
sub_02017C50: ; 0x02017C50
	ldr ip, _02017C58 ; =PlayMeById
	bx ip
	.align 2, 0
_02017C58: .word PlayMeById
	arm_func_end sub_02017C50

	arm_func_start sub_02017C5C
sub_02017C5C: ; 0x02017C5C
	ldr ip, _02017C64 ; =sub_02018278
	bx ip
	.align 2, 0
_02017C64: .word sub_02018278
	arm_func_end sub_02017C5C

	arm_func_start sub_02017C68
sub_02017C68: ; 0x02017C68
	ldr ip, _02017C70 ; =sub_020182AC
	bx ip
	.align 2, 0
_02017C70: .word sub_020182AC
	arm_func_end sub_02017C68

	arm_func_start sub_02017C74
sub_02017C74: ; 0x02017C74
	ldr ip, _02017C7C ; =PlaySeByIdVolume
	bx ip
	.align 2, 0
_02017C7C: .word PlaySeByIdVolume
	arm_func_end sub_02017C74
