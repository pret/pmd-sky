	.include "asm/macros.inc"
	.include "main_02017C90.inc"

	.text

	arm_func_start sub_02017C90
sub_02017C90: ; 0x02017C90
	ldr ip, _02017C98 ; =sub_0201831C
	bx ip
	.align 2, 0
_02017C98: .word sub_0201831C
	arm_func_end sub_02017C90

	arm_func_start sub_02017C9C
sub_02017C9C: ; 0x02017C9C
	ldr ip, _02017CA4 ; =sub_020183A0
	bx ip
	.align 2, 0
_02017CA4: .word sub_020183A0
	arm_func_end sub_02017C9C

	arm_func_start sub_02017CA8
sub_02017CA8: ; 0x02017CA8
	ldr ip, _02017CB0 ; =sub_020183E4
	bx ip
	.align 2, 0
_02017CB0: .word sub_020183E4
	arm_func_end sub_02017CA8

	arm_func_start sub_02017CB4
sub_02017CB4: ; 0x02017CB4
	ldr ip, _02017CBC ; =sub_02018428
	bx ip
	.align 2, 0
_02017CBC: .word sub_02018428
	arm_func_end sub_02017CB4

	arm_func_start sub_02017CC0
sub_02017CC0: ; 0x02017CC0
	ldr ip, _02017CC8 ; =sub_02018460
	bx ip
	.align 2, 0
_02017CC8: .word sub_02018460
	arm_func_end sub_02017CC0

	arm_func_start PlaySeVolumeWrapper
PlaySeVolumeWrapper: ; 0x02017CCC
	ldr r1, _02017CE4 ; =_0209915C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	ldr ip, _02017CE8 ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017CE4: .word _0209915C
_02017CE8: .word PlaySeByIdVolume
	arm_func_end PlaySeVolumeWrapper

	arm_func_start sub_02017CEC
sub_02017CEC: ; 0x02017CEC
	stmdb sp!, {r3, lr}
	ldr r2, _02017D18 ; =_022A4BE8
	ldrsh r0, [r2]
	cmp r0, #0
	ldmgtia sp!, {r3, pc}
	ldr r0, _02017D1C ; =0x00003F05
	mov r3, #3
	mov r1, #0x100
	strh r3, [r2]
	bl PlaySeByIdVolume
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D18: .word _022A4BE8
_02017D1C: .word 0x00003F05
	arm_func_end sub_02017CEC

	arm_func_start sub_02017D20
sub_02017D20: ; 0x02017D20
	stmdb sp!, {r3, lr}
	bl sub_020184CC
	bl sub_02018B50
	ldr r2, _02017D74 ; =0x000003E7
	ldr r0, _02017D78 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	sub r1, r2, #1
	strh r1, [r0, #0xc]
	mov r1, #0x3f00
	strh r1, [r0, #0x10]
	bl sub_02018C0C
	ldr r0, _02017D7C ; =_020AF77C
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D74: .word 0x000003E7
_02017D78: .word _022A4BEC
_02017D7C: .word _020AF77C
	arm_func_end sub_02017D20

	arm_func_start sub_02017D80
sub_02017D80: ; 0x02017D80
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DAC ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DB0 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DB0 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DAC: .word 0x000003E7
_02017DB0: .word _022A4BEC
	arm_func_end sub_02017D80

	arm_func_start sub_02017DB4
sub_02017DB4: ; 0x02017DB4
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DE0 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DE4 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DE4 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DE0: .word 0x000003E7
_02017DE4: .word _022A4BEC
	arm_func_end sub_02017DB4

	arm_func_start sub_02017DE8
sub_02017DE8: ; 0x02017DE8
	ldr ip, _02017DF0 ; =IsSongOver
	bx ip
	.align 2, 0
_02017DF0: .word IsSongOver
	arm_func_end sub_02017DE8

	arm_func_start PlayBgmById
PlayBgmById: ; 0x02017DF4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02017E68 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _02017E6C ; =_022A4BEC
	ldrneh r0, [r0, #2]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017E6C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1]
	strh r5, [r1, #2]
	mov r0, #3
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017E68: .word 0x000003E7
_02017E6C: .word _022A4BEC
	arm_func_end PlayBgmById

	arm_func_start PlayBgmByIdVolume
PlayBgmByIdVolume: ; 0x02017E70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02017EE0 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02017EE4 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #2]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02017EE4 ; =_022A4BEC
	mov r0, #3
	strh r6, [r1]
	strh r6, [r1, #2]
	strh r4, [r1, #4]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02017EE0: .word 0x000003E7
_02017EE4: .word _022A4BEC
	arm_func_end PlayBgmByIdVolume

	arm_func_start StopBgmCommand
StopBgmCommand: ; 0x02017EE8
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02017F20 ; =0x000003E7
	ldr r1, _02017F24 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	mov r0, #5
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017F20: .word 0x000003E7
_02017F24: .word _022A4BEC
	arm_func_end StopBgmCommand

	arm_func_start sub_02017F28
sub_02017F28: ; 0x02017F28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _02017F5C ; =0x000003E7
	ldr r0, _02017F60 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	mov r0, #5
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017F5C: .word 0x000003E7
_02017F60: .word _022A4BEC
	arm_func_end sub_02017F28

	arm_func_start sub_02017F64
sub_02017F64: ; 0x02017F64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02017FA8 ; =_022A4BEC
	ldr r2, _02017FAC ; =0x000003E7
	ldrh r3, [r3, #2]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017FA8 ; =_022A4BEC
	mov r0, #6
	strh r4, [r1, #4]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017FA8: .word _022A4BEC
_02017FAC: .word 0x000003E7
	arm_func_end sub_02017F64

	arm_func_start sub_02017FB0
sub_02017FB0: ; 0x02017FB0
	ldr ip, _02017FB8 ; =sub_02019D04
	bx ip
	.align 2, 0
_02017FB8: .word sub_02019D04
	arm_func_end sub_02017FB0

	arm_func_start sub_02017FBC
sub_02017FBC: ; 0x02017FBC
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _02017FE8 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017FEC ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02017FEC ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017FE8: .word 0x000003E7
_02017FEC: .word _022A4BEC
	arm_func_end sub_02017FBC

	arm_func_start sub_02017FF0
sub_02017FF0: ; 0x02017FF0
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _0201801C ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02018020 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02018020 ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201801C: .word 0x000003E7
_02018020: .word _022A4BEC
	arm_func_end sub_02017FF0

	arm_func_start sub_02018024
sub_02018024: ; 0x02018024
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018098 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _0201809C ; =_022A4BEC
	ldrneh r0, [r0, #8]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _0201809C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1, #6]
	strh r5, [r1, #8]
	mov r0, #7
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018098: .word 0x000003E7
_0201809C: .word _022A4BEC
	arm_func_end sub_02018024

	arm_func_start sub_020180A0
sub_020180A0: ; 0x020180A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02018110 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02018114 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #8]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02018114 ; =_022A4BEC
	mov r0, #7
	strh r6, [r1, #6]
	strh r6, [r1, #8]
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02018110: .word 0x000003E7
_02018114: .word _022A4BEC
	arm_func_end sub_020180A0

	arm_func_start sub_02018118
sub_02018118: ; 0x02018118
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02018150 ; =0x000003E7
	ldr r1, _02018154 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	mov r0, #9
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018150: .word 0x000003E7
_02018154: .word _022A4BEC
	arm_func_end sub_02018118

	arm_func_start sub_02018158
sub_02018158: ; 0x02018158
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _0201818C ; =0x000003E7
	ldr r0, _02018190 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #9
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201818C: .word 0x000003E7
_02018190: .word _022A4BEC
	arm_func_end sub_02018158

	arm_func_start sub_02018194
sub_02018194: ; 0x02018194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020181D8 ; =_022A4BEC
	ldr r2, _020181DC ; =0x000003E7
	ldrh r3, [r3, #8]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _020181D8 ; =_022A4BEC
	mov r0, #0xa
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020181D8: .word _022A4BEC
_020181DC: .word 0x000003E7
	arm_func_end sub_02018194

	arm_func_start sub_020181E0
sub_020181E0: ; 0x020181E0
	stmdb sp!, {r3, lr}
	bl sub_0201A19C
	ldr r1, _02018204 ; =0x000003E6
	cmp r0, r1
	ldreq r0, _02018208 ; =_022A4BEC
	streqh r1, [r0, #0xc]
	ldrne r0, _02018208 ; =_022A4BEC
	ldrh r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018204: .word 0x000003E6
_02018208: .word _022A4BEC
	arm_func_end sub_020181E0

	arm_func_start PlayMeById
PlayMeById: ; 0x0201820C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018270 ; =0x000003E6
	mov r5, r0
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0xd
	ldmhiia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02018274 ; =_022A4BEC
	mov r0, #0xb
	strh r5, [r1, #0xc]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018270: .word 0x000003E6
_02018274: .word _022A4BEC
	arm_func_end PlayMeById

	arm_func_start sub_02018278
sub_02018278: ; 0x02018278
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r2, _020182A4 ; =0x000003E6
	ldr r1, _020182A8 ; =_022A4BEC
	mov r0, #0xc
	strh r2, [r1, #0xc]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_020182A4: .word 0x000003E6
_020182A8: .word _022A4BEC
	arm_func_end sub_02018278

	arm_func_start sub_020182AC
sub_020182AC: ; 0x020182AC
	ldr ip, _020182B4 ; =sub_0201A480
	bx ip
	.align 2, 0
_020182B4: .word sub_0201A480
	arm_func_end sub_020182AC

	arm_func_start PlaySeByIdVolume
PlaySeByIdVolume: ; 0x020182B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r1, _02018318 ; =_0209916C
	mov r2, r6
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r6, #0x3f00
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0xd
	cmp r5, #0x100
	movhi r5, #0x100
	bl sub_02018A78
	mov r4, r0
	mov r0, #4
	strh r6, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r5, #0
	mov r0, r4
	strh r5, [r4, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018318: .word _0209916C
	arm_func_end PlaySeByIdVolume

	arm_func_start sub_0201831C
sub_0201831C: ; 0x0201831C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r6, r2
	mov r7, r1
	mov r5, r3
	str r6, [sp]
	ldr r1, _0201839C ; =_0209918C
	mov r2, r8
	mov r3, r7
	mov r0, #8
	str r5, [sp, #4]
	bl Debug_Print
	cmp r8, #0x3f00
	beq _02018394
	mov r0, #0xe
	cmp r6, #0x100
	movhi r6, #0x100
	bl sub_02018A78
	mov r4, r0
	strh r8, [r4, #4]
	mov r0, #4
	strh r7, [r4, #6]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r6, #0
	strh r6, [r4, #8]
	mov r0, r4
	strh r5, [r4, #0xa]
	bl SendAudioCommand2
_02018394:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201839C: .word _0209918C
	arm_func_end sub_0201831C

	arm_func_start sub_020183A0
sub_020183A0: ; 0x020183A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _020183E0 ; =_020991C8
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x10
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020183E0: .word _020991C8
	arm_func_end sub_020183A0

	arm_func_start sub_020183E4
sub_020183E4: ; 0x020183E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _02018424 ; =_020991F0
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x11
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xa]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018424: .word _020991F0
	arm_func_end sub_020183E4

	arm_func_start sub_02018428
sub_02018428: ; 0x02018428
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _0201845C ; =_02099210
	mov r2, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r4, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201845C: .word _02099210
	arm_func_end sub_02018428

	arm_func_start sub_02018460
sub_02018460: ; 0x02018460
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02018498 ; =_02099224
	mov r2, r5
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018498: .word _02099224
	arm_func_end sub_02018460

	arm_func_start sub_0201849C
sub_0201849C: ; 0x0201849C
	ldr ip, _020184A4 ; =sub_0201906C
	bx ip
	.align 2, 0
_020184A4: .word sub_0201906C
	arm_func_end sub_0201849C

	arm_func_start sub_020184A8
sub_020184A8: ; 0x020184A8
	ldr ip, _020184B0 ; =sub_02019260
	bx ip
	.align 2, 0
_020184B0: .word sub_02019260
	arm_func_end sub_020184A8

	arm_func_start sub_020184B4
sub_020184B4: ; 0x020184B4
	ldr ip, _020184BC ; =sub_0201929C
	bx ip
	.align 2, 0
_020184BC: .word sub_0201929C
	arm_func_end sub_020184B4

	arm_func_start sub_020184C0
sub_020184C0: ; 0x020184C0
	ldr ip, _020184C8 ; =sub_020192D0
	bx ip
	.align 2, 0
_020184C8: .word sub_020192D0
	arm_func_end sub_020184C0

	arm_func_start sub_020184CC
sub_020184CC: ; 0x020184CC
	stmdb sp!, {r3, lr}
	bl InitSoundSystem
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002C40
	ldr r0, _020185D0 ; =_022A4C00
	mov r1, #0x11
	bl sub_02002F34
	ldr r0, _020185D4 ; =_022A4C28
	mov r1, #0x11
	bl sub_02002F34
	mov r1, #0x10
	ldr r0, _020185D8 ; =_020AF7E4
	mov r2, r1
	bl sub_02002A9C
	mov r2, #0
	ldr r1, _020185DC ; =AUDIO_COMMANDS_BUFFER
	mov r0, r2
_02018510:
	add r2, r2, #1
	cmp r2, #0x10
	str r0, [r1], #0x20
	blt _02018510
	ldr r0, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	ldr r0, [r0, #0x34]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #0x30]
	ldr r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #8]
	ldr r0, [r2, #0x20]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E8 ; =_020AF7AC
	str r0, [r2, #0x1c]
	ldr r0, _020185EC ; =_020AF96C
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F0 ; =_020AFA48
	ldr r1, _020185F4 ; =_020AF784
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F8 ; =_020AF890
	ldr r1, _020185FC ; =_020AF798
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	ldr r0, _020185EC ; =_020AF96C
	bl sub_020027E8
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002CB4
	ldr r0, _020185CC ; =_020AF7C0
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	mov r1, #1
	ldr r0, _020185E0 ; =_020AF780
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020185CC: .word _020AF7C0
_020185D0: .word _022A4C00
_020185D4: .word _022A4C28
_020185D8: .word _020AF7E4
_020185DC: .word AUDIO_COMMANDS_BUFFER
_020185E0: .word _020AF780
_020185E4: .word 0x00000701
_020185E8: .word _020AF7AC
_020185EC: .word _020AF96C
_020185F0: .word _020AFA48
_020185F4: .word _020AF784
_020185F8: .word _020AF890
_020185FC: .word _020AF798
	arm_func_end sub_020184CC

	arm_func_start sub_02018600
sub_02018600: ; 0x02018600
	stmdb sp!, {r3, lr}
	bl ManipBgmPlayback
	ldr r0, _02018624 ; =_020AFA48
	bl sub_020027E8
	ldr r0, _02018628 ; =_020AF890
	bl sub_020027E8
_02018618:
	bl sub_02003AB0
	bl ManipBgmPlayback
	b _02018618
	.align 2, 0
_02018624: .word _020AFA48
_02018628: .word _020AF890
	arm_func_end sub_02018600

	arm_func_start sub_0201862C
sub_0201862C: ; 0x0201862C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #1
	ldr sl, _020187F0 ; =_022A4C28
	ldr sb, _020187F4 ; =_022A4C00
	ldr r4, _020187F8 ; =_020AF780
	mov r6, #2
	mov r5, #0
	add r8, sp, #0
	mov r7, fp
_02018650:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl sub_02002F98
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #1
	ldreqb r0, [r4, #1]
	beq _02018650
	mov r0, r6
	bl Debug_GetDebugFlag
	cmp r0, #0
	bne _020187D0
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _020187D0
_02018698: ; jump table
	b _020187D0 ; case 0
	b _020187D0 ; case 1
	b _020186E0 ; case 2
	b _020186E0 ; case 3
	b _020186E0 ; case 4
	b _020186E0 ; case 5
	b _020186E0 ; case 6
	b _020186E0 ; case 7
	b _020186E0 ; case 8
	b _020186E0 ; case 9
	b _020186E0 ; case 10
	b _020186E0 ; case 11
	b _020186E0 ; case 12
	b _020186F0 ; case 13
	b _020186F0 ; case 14
	b _02018790 ; case 15
	b _020186F0 ; case 16
	b _020186F0 ; case 17
_020186E0:
	mov r0, sl
	mov r2, fp
	bl sub_02002F7C
	b _02018650
_020186F0:
	ldrh r0, [r1, #4]
	bl sub_0201AAA0
	cmp r0, #0
	bne _02018714
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_02018714:
	ldr r3, [sp]
	ldr r0, [r3]
	sub r0, r0, #0xd
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020187D0
_0201872C: ; jump table
	b _02018740 ; case 0
	b _02018750 ; case 1
	b _020187D0 ; case 2
	b _02018768 ; case 3
	b _0201877C ; case 4
_02018740:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	b _020187D0
_02018750:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	b _020187D0
_02018768:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _020187D0
_0201877C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
	b _020187D0
_02018790:
	ldrh r0, [r1, #4]
	cmp r0, #0x3f00
	beq _020187BC
	bl sub_0201AAA0
	cmp r0, #0
	beq _020187BC
	ldr r1, [sp]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl StopSe
	b _020187D0
_020187BC:
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_020187D0:
	ldr r0, _020187FC ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, [sp]
	ldr r0, _020187FC ; =_020AF7C0
	str r5, [r1]
	ldr r1, _02018800 ; =_020AF7E4
	bl sub_02002ECC
	b _02018650
	.align 2, 0
_020187F0: .word _022A4C28
_020187F4: .word _022A4C00
_020187F8: .word _020AF780
_020187FC: .word _020AF7C0
_02018800: .word _020AF7E4
	arm_func_end sub_0201862C

	arm_func_start sub_02018804
sub_02018804: ; 0x02018804
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
_0201880C:
	ldr r0, _02018A64 ; =_022A4C28
	add r1, sp, #0
	mov r2, #1
	bl sub_02002F98
	ldr r3, [sp]
	ldr r0, [r3]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _02018A40
_02018830: ; jump table
	b _02018A40 ; case 0
	b _02018A40 ; case 1
	b _02018878 ; case 2
	b _02018880 ; case 3
	b _020188B4 ; case 4
	b _02018900 ; case 5
	b _0201890C ; case 6
	b _0201891C ; case 7
	b _02018950 ; case 8
	b _0201899C ; case 9
	b _020189A8 ; case 10
	b _020189B8 ; case 11
	b _020189D0 ; case 12
	b _020189DC ; case 13
	b _020189F0 ; case 14
	b _02018A0C ; case 15
	b _02018A1C ; case 16
	b _02018A30 ; case 17
_02018878:
	bl SoundDriverReset
	b _02018A40
_02018880:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201888C
_02018888:
	bl sub_02003AB0
_0201888C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018888
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_020188B4:
	ldr r4, _02018A68 ; =0x000003E6
	b _020188C0
_020188BC:
	bl sub_02003AB0
_020188C0:
	bl sub_0201A19C
	cmp r0, r4
	bne _020188BC
	ldr r4, _02018A6C ; =0x000003E7
	b _020188D8
_020188D4:
	bl sub_02003AB0
_020188D8:
	bl sub_02019824
	cmp r0, r4
	bne _020188D4
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_02018900:
	ldrh r0, [r3, #8]
	bl StopBgm
	b _02018A40
_0201890C:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm
	b _02018A40
_0201891C:
	ldr r4, _02018A68 ; =0x000003E6
	b _02018928
_02018924:
	bl sub_02003AB0
_02018928:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018924
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_02018950:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201895C
_02018958:
	bl sub_02003AB0
_0201895C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018958
	ldr r4, _02018A6C ; =0x000003E7
	b _02018974
_02018970:
	bl sub_02003AB0
_02018974:
	bl sub_02019D58
	cmp r0, r4
	bne _02018970
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_0201899C:
	ldrh r0, [r3, #8]
	bl StopBgm2
	b _02018A40
_020189A8:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm2
	b _02018A40
_020189B8:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	ldrh r2, [r3, #6]
	bl PlayME
	bl sub_02003AB0
	b _02018A40
_020189D0:
	ldrh r0, [r3, #8]
	bl StopME
	b _02018A40
_020189DC:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	bl sub_02003AB0
	b _02018A40
_020189F0:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	bl sub_02003AB0
	b _02018A40
_02018A0C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	bl StopSe
	b _02018A40
_02018A1C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _02018A40
_02018A30:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
_02018A40:
	ldr r0, _02018A70 ; =_020AF7C0
	bl sub_02002CB4
	ldr r2, [sp]
	mov r3, #0
	ldr r0, _02018A70 ; =_020AF7C0
	ldr r1, _02018A74 ; =_020AF7E4
	str r3, [r2]
	bl sub_02002ECC
	b _0201880C
	.align 2, 0
_02018A64: .word _022A4C28
_02018A68: .word 0x000003E6
_02018A6C: .word 0x000003E7
_02018A70: .word _020AF7C0
_02018A74: .word _020AF7E4
	arm_func_end sub_02018804

	arm_func_start sub_02018A78
sub_02018A78: ; 0x02018A78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02018AD8 ; =_020AF7C0
	ldr r1, _02018ADC ; =_020AF7E4
	bl sub_02002D14
	mov r1, #0
	ldr r4, _02018AE0 ; =AUDIO_COMMANDS_BUFFER
	b _02018AC0
_02018A98:
	ldr r0, [r4]
	cmp r0, #0
	bne _02018AB8
	ldr r0, _02018AD8 ; =_020AF7C0
	str r5, [r4]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02018AB8:
	add r1, r1, #1
	add r4, r4, #0x20
_02018AC0:
	cmp r1, #0x10
	blt _02018A98
	ldr r0, _02018AD8 ; =_020AF7C0
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018AD8: .word _020AF7C0
_02018ADC: .word _020AF7E4
_02018AE0: .word AUDIO_COMMANDS_BUFFER
	arm_func_end sub_02018A78

	arm_func_start SendAudioCommand2
SendAudioCommand2: ; 0x02018AE4
	stmdb sp!, {r4, lr}
	ldr r1, _02018B3C ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018B0C
	ldr r0, _02018B40 ; =_022A4C00
	ldr r1, _02018B44 ; =_02099240
	bl sub_02002FB4
_02018B0C:
	ldr r0, _02018B48 ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, _02018B4C ; =_020AF780
	mov r2, #1
	ldr r0, _02018B48 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018B40 ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018B3C: .word _022A4C00
_02018B40: .word _022A4C00
_02018B44: .word _02099240
_02018B48: .word _020AF7C0
_02018B4C: .word _020AF780
	arm_func_end SendAudioCommand2

	arm_func_start sub_02018B50
sub_02018B50: ; 0x02018B50
	ldr ip, _02018B60 ; =sub_02002D14
	ldr r0, _02018B64 ; =_020AF7C0
	ldr r1, _02018B68 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018B60: .word sub_02002D14
_02018B64: .word _020AF7C0
_02018B68: .word _020AF7E4
	arm_func_end sub_02018B50

	arm_func_start AllocAudioCommand
AllocAudioCommand: ; 0x02018B6C
	mov r3, #0
	ldr r2, _02018BA4 ; =AUDIO_COMMANDS_BUFFER
	b _02018B94
_02018B78:
	ldr r1, [r2]
	cmp r1, #0
	streq r0, [r2]
	moveq r0, r2
	bxeq lr
	add r3, r3, #1
	add r2, r2, #0x20
_02018B94:
	cmp r3, #0x10
	blt _02018B78
	mov r0, #0
	bx lr
	.align 2, 0
_02018BA4: .word AUDIO_COMMANDS_BUFFER
	arm_func_end AllocAudioCommand

	arm_func_start SendAudioCommand
SendAudioCommand: ; 0x02018BA8
	stmdb sp!, {r4, lr}
	ldr r1, _02018BF8 ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018BD0
	ldr r0, _02018BFC ; =_022A4C00
	ldr r1, _02018C00 ; =_02099240
	bl sub_02002FB4
_02018BD0:
	ldr r1, _02018C04 ; =_020AF780
	mov r2, #1
	ldr r0, _02018C08 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018BFC ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018BF8: .word _022A4C00
_02018BFC: .word _022A4C00
_02018C00: .word _02099240
_02018C04: .word _020AF780
_02018C08: .word _020AF7C0
	arm_func_end SendAudioCommand

	arm_func_start sub_02018C0C
sub_02018C0C: ; 0x02018C0C
	ldr ip, _02018C1C ; =sub_02002ECC
	ldr r0, _02018C20 ; =_020AF7C0
	ldr r1, _02018C24 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018C1C: .word sub_02002ECC
_02018C20: .word _020AF7C0
_02018C24: .word _020AF7E4
	arm_func_end sub_02018C0C

	arm_func_start InitSoundSystem
InitSoundSystem: ; 0x02018C28
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002C40
	ldr r0, _02018E44 ; =_020AFB28
	mov r1, #4
	bl sub_02002CAC
	bl SND_Init
	ldr r0, _02018E48 ; =0x0000FFFF
	mov r1, #0
	bl Snd_LockChannel
	add r0, sp, #0x10
	bl DseDriver_LoadDefaultSettings
	mov r0, #0x10000
	mov r1, #2
	bl MemAlloc
	ldr r2, _02018E4C ; =_022A4E50
	mov r1, #0x3c000
	str r0, [r2]
	mov r0, #0
	mov r2, #0x14
	mov r3, #2
	bl MemArenaAlloc
	ldr r1, _02018E4C ; =_022A4E50
	mov r2, #0x10000
	str r0, [r1, #4]
	ldr r1, [r1]
	add r0, sp, #0x10
	bl DseDriver_ConfigureHeap
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #4
	bl sub_0206C36C
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0xf
	bl sub_0206C39C
	add r0, sp, #0x10
	bl DseDriver_Init
	ldr r1, _02018E50 ; =_0209939C
	add r0, sp, #8
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp, #8]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E58 ; =_020993B4
	str r1, [r2, #0x80]
	bl Debug_Print0
	ldr r1, _02018E5C ; =_020993D0
	add r0, sp, #8
	bl sub_02019314
	ldr r0, [sp, #8]
	bl DseSe_Load
	mov r1, r0
	ldr r0, _02018E54 ; =_022A4E58
	str r1, [r0, #0x7c]
	ldr r0, _02018E60 ; =_020993E8
	bl Debug_Print0
	ldr r1, _02018E64 ; =_02099404
	add r0, sp, #0
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E68 ; =_02099418
	str r1, [r2, #0x8c]
	bl Debug_Print0
	ldr r1, _02018E6C ; =_02099434
	add r0, sp, #0
	bl sub_02019314
	ldr r0, [sp]
	bl DseSe_Load
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E70 ; =_02099448
	str r1, [r2, #0x88]
	bl Debug_Print0
	ldr r0, _02018E54 ; =_022A4E58
	mov r2, #0
	str r2, [r0, #0xc4]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r2, [r0, #0x44]
	ldr r1, _02018E74 ; =0x000003E7
	str r2, [r0, #0x64]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x48]
	sub r1, r1, #1
	strh r1, [r0, #0x68]
	str r2, [r0, #0x94]
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	strh r1, [r0, #0x9a]
	ldr r0, _02018E78 ; =_022A4E7C
	bl ZInit8
	ldr r0, _02018E7C ; =_022A4E84
	bl ZInit8
	ldr r0, _02018E80 ; =_022A4E8C
	bl ZInit8
	ldr r0, _02018E84 ; =_022A4EA4
	bl ZInit8
	ldr r0, _02018E88 ; =_022A4EAC
	bl ZInit8
	ldr r0, _02018E8C ; =_022A4EB4
	bl ZInit8
	ldr r0, _02018E90 ; =_022A4EC4
	bl ZInit8
	ldr r0, _02018E94 ; =_022A4ECC
	bl ZInit8
	ldr r0, _02018E98 ; =_022A4EF4
	bl ZInit8
	ldr r4, _02018E9C ; =_022A4EFC
	mov r5, #0
_02018E04:
	add r0, r4, r5, lsl #3
	bl ZInit8
	add r5, r5, #1
	cmp r5, #4
	blt _02018E04
	mov r1, #0
	ldr r0, _02018EA0 ; =_020AFB4C
	mov r2, r1
	mov r3, r1
	bl DseSwd_LoadMainBank
	ldr r1, _02018E54 ; =_022A4E58
	str r0, [r1, #4]
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018E44: .word _020AFB28
_02018E48: .word 0x0000FFFF
_02018E4C: .word _022A4E50
_02018E50: .word _0209939C
_02018E54: .word _022A4E58
_02018E58: .word _020993B4
_02018E5C: .word _020993D0
_02018E60: .word _020993E8
_02018E64: .word _02099404
_02018E68: .word _02099418
_02018E6C: .word _02099434
_02018E70: .word _02099448
_02018E74: .word 0x000003E7
_02018E78: .word _022A4E7C
_02018E7C: .word _022A4E84
_02018E80: .word _022A4E8C
_02018E84: .word _022A4EA4
_02018E88: .word _022A4EAC
_02018E8C: .word _022A4EB4
_02018E90: .word _022A4EC4
_02018E94: .word _022A4ECC
_02018E98: .word _022A4EF4
_02018E9C: .word _022A4EFC
_02018EA0: .word _020AFB4C
	arm_func_end InitSoundSystem

	arm_func_start ManipBgmPlayback
ManipBgmPlayback: ; 0x02018EA4
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _02018F5C
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018F0C
	ldr r0, [r0]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02018F0C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _02019054 ; =_02099464
	ldrh r2, [r0, #0x20]
	mov r0, #7
	bl Debug_Print
	bl sub_02019408
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02018F0C:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _0201903C
	ldr r0, [r0, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _0201905C ; =_02099470
	ldrh r2, [r0, #0x48]
	mov r0, #7
	bl Debug_Print
	bl sub_02019488
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
	b _0201903C
_02018F5C:
	cmp r1, #1
	ldreq r1, [r0, #0x64]
	cmpeq r1, #2
	bne _0201903C
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	bl sub_02019508
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019060 ; =0x000003E6
	str r2, [r0, #0x64]
	strh r1, [r0, #0x68]
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018FE0
	ldrh r2, [r0, #0x20]
	ldr r1, _02019064 ; =_0209947C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x22]
	ldr r0, [r0]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02018FE0:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _02019030
	ldrh r2, [r0, #0x48]
	ldr r1, _02019068 ; =_0209948C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x4a]
	ldr r0, [r0, #8]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02019030:
	ldr r0, _02019050 ; =_022A4E58
	mov r1, #0
	str r1, [r0, #0x18]
_0201903C:
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_0201904C: .word _020AFB28
_02019050: .word _022A4E58
_02019054: .word _02099464
_02019058: .word 0x000003E7
_0201905C: .word _02099470
_02019060: .word 0x000003E6
_02019064: .word _0209947C
_02019068: .word _0209948C
	arm_func_end ManipBgmPlayback

	arm_func_start sub_0201906C
sub_0201906C: ; 0x0201906C
	stmdb sp!, {r3, lr}
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _020190C4 ; =_022A4E58
	ldr r1, [r0, #0x94]
	cmp r1, #2
	bne _020190B4
	ldr r0, [r0, #0xdc]
	mov r1, #0
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bne _020190B4
	bl sub_02019790
	ldr r0, _020190C4 ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	mov r1, #0
	str r1, [r0, #0x94]
_020190B4:
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020190C0: .word _020AFB28
_020190C4: .word _022A4E58
	arm_func_end sub_0201906C

	arm_func_start SoundDriverReset
SoundDriverReset: ; 0x020190C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019250 ; =_0209949C
	mov r0, #6
	bl Debug_Print
	ldr r4, _02019254 ; =_022A4E58
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02019184
	ldr r5, _0201924C ; =_020AFB28
	b _0201910C
_020190F8:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201910C:
	ldr r0, [r4, #0x64]
	cmp r0, #1
	beq _020190F8
	cmp r0, #2
	bne _02019174
	ldr r0, _02019254 ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	ble _02019174
	ldr r0, _02019254 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x10]
	bl DseBgm_Stop
	ldr r5, _0201924C ; =_020AFB28
	ldr r4, _02019254 ; =_022A4E58
	b _02019164
_02019150:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019164:
	ldr r0, [r4, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019150
_02019174:
	bl sub_02019508
	ldr r1, _02019258 ; =0x000003E6
	ldr r0, _02019254 ; =_022A4E58
	strh r1, [r0, #0x68]
_02019184:
	mov r7, #0
	ldr r6, _0201925C ; =0x000003E7
	ldr sl, _0201924C ; =_020AFB28
	ldr sb, _02019254 ; =_022A4E58
	mov r8, r7
	mov r4, r7
	mov r5, r7
_020191A0:
	ldr r0, [sb, #0x1c]
	cmp r0, #2
	bne _020191D4
	ldr r0, [sb]
	mov r1, r8
	bl DseBgm_Stop
	ldr r0, [sb]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _020191D4
	bl sub_02019408
	str r7, [sb, #0x1c]
	strh r6, [sb, #0x20]
_020191D4:
	ldr r0, [sb, #0x44]
	cmp r0, #2
	bne _02019208
	ldr r0, [sb, #8]
	mov r1, r5
	bl DseBgm_Stop
	ldr r0, [sb, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019208
	bl sub_02019488
	str r4, [sb, #0x44]
	strh r6, [sb, #0x48]
_02019208:
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	ldrne r0, [sb, #0x44]
	cmpne r0, #0
	beq _02019234
	mov r0, sl
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, sl
	bl sub_02002CB4
	b _020191A0
_02019234:
	mov r0, #0x3f00
	mov r1, #0
	bl StopSe
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0201924C: .word _020AFB28
_02019250: .word _0209949C
_02019254: .word _022A4E58
_02019258: .word 0x000003E6
_0201925C: .word 0x000003E7
	arm_func_end SoundDriverReset

	arm_func_start sub_02019260
sub_02019260: ; 0x02019260
	stmdb sp!, {r3, lr}
	ldr r0, _02019294 ; =_020AFB24
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019298 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #1
	bl sub_0206C620
	ldr r0, _02019294 ; =_020AFB24
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019294: .word _020AFB24
_02019298: .word _020AFB28
	arm_func_end sub_02019260

	arm_func_start sub_0201929C
sub_0201929C: ; 0x0201929C
	stmdb sp!, {r3, lr}
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #0
	bl sub_0206C6BC
	ldr r0, _020192CC ; =0x0000FFFF
	mov r1, #0
	bl Snd_UnlockChannel
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192C8: .word _020AFB28
_020192CC: .word 0x0000FFFF
	arm_func_end sub_0201929C

	arm_func_start sub_020192D0
sub_020192D0: ; 0x020192D0
	stmdb sp!, {r3, lr}
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019300 ; =0x0000FFFF
	mov r1, #0
	bl Snd_LockChannel
	mov r0, #0
	bl sub_0206C754
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192FC: .word _020AFB28
_02019300: .word 0x0000FFFF
	arm_func_end sub_020192D0

	arm_func_start sub_02019304
sub_02019304: ; 0x02019304
	ldr r0, _02019310 ; =_022A4E50
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02019310: .word _022A4E50
	arm_func_end sub_02019304

	arm_func_start sub_02019314
sub_02019314: ; 0x02019314
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019388 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #2
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019388: .word _022A4E50
	arm_func_end sub_02019314

	arm_func_start LoadDseFile
LoadDseFile: ; 0x0201938C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019400 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02019404 ; =0x00000302
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019400: .word _022A4E50
_02019404: .word 0x00000302
	arm_func_end LoadDseFile

	arm_func_start sub_02019408
sub_02019408: ; 0x02019408
	stmdb sp!, {r3, lr}
	ldr r0, _0201947C ; =_022A4E8C
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0]
	bl DseBgm_Unload
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x34]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x24]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x2c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201947C: .word _022A4E8C
_02019480: .word _022A4E58
_02019484: .word _022A4E50
	arm_func_end sub_02019408

	arm_func_start sub_02019488
sub_02019488: ; 0x02019488
	stmdb sp!, {r3, lr}
	ldr r0, _020194FC ; =_022A4EB4
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #8]
	bl DseBgm_Unload
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x5c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x4c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x54]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_020194FC: .word _022A4EB4
_02019500: .word _022A4E58
_02019504: .word _022A4E50
	arm_func_end sub_02019488

	arm_func_start sub_02019508
sub_02019508: ; 0x02019508
	stmdb sp!, {r3, lr}
	ldr r0, _02019568 ; =_022A4ECC
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_Unload
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x14]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x74]
	bl MemLocateUnset
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x6c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019568: .word _022A4ECC
_0201956C: .word _022A4E58
_02019570: .word _022A4E50
	arm_func_end sub_02019508

	arm_func_start PlaySeLoad
PlaySeLoad: ; 0x02019574
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10c
	mov r6, r0
	mov r1, r6, asr #8
	and r4, r1, #0xff
	and r5, r6, #0xff
	bl sub_0201AAA0
	cmp r0, #0
	movne r0, #0
	bne _02019758
	cmp r5, #0
	moveq r0, #0
	beq _02019758
	ldr r0, _02019760 ; =_022A4E58
	ldrh r0, [r0, #0x9a]
	cmp r0, r6
	moveq r0, #1
	beq _02019758
	cmp r0, #0x3f00
	beq _020195C8
	bl sub_02019790
_020195C8:
	ldr r0, _02019760 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x94]
	ldr r1, _02019764 ; =_020AFB6C
	strh r6, [r0, #0x9a]
	mov r2, #0
	str r2, [r0, #0xc4]
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02019768 ; =_020994B0
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _0201976C ; =_020994C0
	add r3, sp, #0xc
	mov r2, r6
	mov r0, #8
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	ldr r0, _02019774 ; =_022A4EF4
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019760 ; =_022A4E58
	ldr r0, [r0, #0x9c]
	bl DseSe_Load
	ldr r2, _02019760 ; =_022A4E58
	add r1, sp, #4
	str r0, [r2, #0xc8]
	add r0, r0, r5, lsl #16
	str r0, [r2, #0xdc]
	mov r2, #4
	bl DseSe_GetUsedBankIDs
	mov r7, r0
	ldr r1, _02019778 ; =_020994D8
	mov r2, r6
	mov r3, r5
	mov r8, #0
	mov r0, #8
	str r7, [sp]
	bl Debug_Print
	mov sb, r8
	add r6, sp, #4
	mov fp, #8
	ldr r5, _0201977C ; =_022A4EFC
	ldr r4, _02019760 ; =_022A4E58
	b _0201970C
_02019684:
	mov r0, sb, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, _02019780 ; =_02099500
	mov r0, fp
	and sl, r2, #0xff
	str r2, [sp]
	mov r2, sb
	mov r3, sl
	bl Debug_Print
	ldr r1, _02019784 ; =_02099514
	mov r2, sl
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _02019788 ; =_02099528
	mov r0, #8
	mov r2, r8
	add r3, sp, #0xc
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	add r0, r5, r8, lsl #3
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	add r0, r4, r8, lsl #3
	mov r1, #0
	ldr r0, [r0, #0xa4]
	mov r2, r1
	bl DseSwd_LoadBank
	add r1, r4, r8, lsl #2
	str r0, [r1, #0xcc]
	add r8, r8, #1
	add sb, sb, #1
_0201970C:
	cmp sb, r7
	blt _02019684
	ldr r0, _02019760 ; =_022A4E58
	cmp r8, #0
	str r8, [r0, #0xc4]
	movne r0, #1
	bne _02019758
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _0201978C ; =_022A4E50
	ldr r1, _02019760 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	mov r0, #0
_02019758:
	add sp, sp, #0x10c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02019760: .word _022A4E58
_02019764: .word _020AFB6C
_02019768: .word _020994B0
_0201976C: .word _020994C0
_02019770: .word _020AFB28
_02019774: .word _022A4EF4
_02019778: .word _020994D8
_0201977C: .word _022A4EFC
_02019780: .word _02099500
_02019784: .word _02099514
_02019788: .word _02099528
_0201978C: .word _022A4E50
	arm_func_end PlaySeLoad

	arm_func_start sub_02019790
sub_02019790: ; 0x02019790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0201981C ; =_022A4E58
	ldr r5, [r4, #0xc4]
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	str r6, [r4, #0xc4]
	ldr r7, _02019820 ; =_022A4E50
	b _020197DC
_020197B4:
	add r0, r4, r6, lsl #2
	ldr r0, [r0, #0xcc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	add r1, r4, r6, lsl #3
	ldr r0, [r7, #4]
	ldr r1, [r1, #0xa4]
	bl MemLocateUnset
	add r6, r6, #1
_020197DC:
	cmp r6, r5
	blt _020197B4
	ldr r0, _0201981C ; =_022A4E58
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _02019820 ; =_022A4E50
	ldr r1, _0201981C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	ldr r0, _0201981C ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201981C: .word _022A4E58
_02019820: .word _022A4E50
	arm_func_end sub_02019790

	arm_func_start sub_02019824
sub_02019824: ; 0x02019824
	stmdb sp!, {r4, lr}
	ldr r0, _02019848 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201984C ; =_022A4E58
	ldr r0, _02019848 ; =_020AFB28
	ldrh r4, [r1, #0x20]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019848: .word _020AFB28
_0201984C: .word _022A4E58
	arm_func_end sub_02019824

	arm_func_start IsSongOver
IsSongOver: ; 0x02019850
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020198B0 ; =_020AFB28
	mov r4, #0
	bl sub_02002CB4
	ldr r0, _020198B4 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _0201989C
	ldr r0, [r0]
	add r2, sp, #0
	mov r1, #0xa
	bl DseSequence_GetParameter
	ldr r0, _020198B4 ; =_022A4E58
	ldr r2, [sp]
	ldr r1, [r0, #0x40]
	cmp r2, r1
	strgt r2, [r0, #0x40]
	movgt r4, #1
_0201989C:
	ldr r0, _020198B0 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020198B0: .word _020AFB28
_020198B4: .word _022A4E58
	arm_func_end IsSongOver

	arm_func_start PlayBgm
PlayBgm: ; 0x020198B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019B00 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019B04 ; =_0209953C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019B08 ; =_022A4E58
	ldrh r0, [r0, #0x48]
	cmp r6, r0
	bne _02019914
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019914:
	ldr r1, _02019B08 ; =_022A4E58
	ldr r0, _02019B0C ; =0x000003E7
	ldrh r1, [r1, #0x20]
	cmp r1, r0
	beq _02019940
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019940:
	cmp r6, #1
	blo _02019950
	cmp r6, #0xc9
	bls _02019970
_02019950:
	ldr r1, _02019B08 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019B0C ; =0x000003E7
	str r0, [r1, #0x1c]
	ldr r0, _02019B00 ; =_020AFB28
	strh r2, [r1, #0x20]
	bl sub_02002E98
	b _02019AF8
_02019970:
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x1c]
	strh r6, [r0, #0x20]
	strh r4, [r0, #0x22]
	mov r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019AE4
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019B10 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B14 ; =_022A4E8C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _02019B18 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B1C ; =_022A4E7C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x24]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019B08 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #4]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019B20 ; =_022A4E50
	ldr r2, _02019B08 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x30]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019B08 ; =_022A4E58
	str r0, [r1, #0x2c]
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019B08 ; =_022A4E58
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x2c]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019A5C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019A5C
	bl FileRom_StopDataTransfer
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	ldr r0, [r0, #0x34]
	bl DseBgm_Load
	ldr r3, _02019B08 ; =_022A4E58
	ldr r1, _02019B24 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019B08 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0]
	mov r2, #1
	bl ResumeBgm
_02019AE4:
	ldr r1, _02019B08 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019B00 ; =_020AFB28
	str r2, [r1, #0x1c]
	bl sub_02002E98
_02019AF8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019B00: .word _020AFB28
_02019B04: .word _0209953C
_02019B08: .word _022A4E58
_02019B0C: .word 0x000003E7
_02019B10: .word _02099554
_02019B14: .word _022A4E8C
_02019B18: .word _0209956C
_02019B1C: .word _022A4E7C
_02019B20: .word _022A4E50
_02019B24: .word sub_0201AABC
	arm_func_end PlayBgm

	arm_func_start StopBgm
StopBgm: ; 0x02019B28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019C40 ; =_02099584
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _02019C44 ; =_022A4E58
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02019C2C
	ldr r6, _02019C3C ; =_020AFB28
	b _02019B78
_02019B64:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_02019B78:
	ldr r0, [r5, #0x1c]
	cmp r0, #1
	beq _02019B64
	cmp r0, #2
	bne _02019C2C
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _02019C44 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2]
	bl DseBgm_Stop
	ldr r0, _02019C44 ; =_022A4E58
	str r4, [sp]
	ldrh r3, [r0, #0x20]
	ldr r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	ldr r0, _02019C48 ; =_02099594
	bl Debug_Print0
	cmp r4, #0
	beq _02019BE4
	ldr r0, _02019C44 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02019C2C
_02019BE4:
	ldr r5, _02019C3C ; =_020AFB28
	ldr r4, _02019C44 ; =_022A4E58
	b _02019C04
_02019BF0:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019C04:
	ldr r0, [r4]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019BF0
	bl sub_02019408
	ldr r0, _02019C44 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019C4C ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02019C2C:
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02019C3C: .word _020AFB28
_02019C40: .word _02099584
_02019C44: .word _022A4E58
_02019C48: .word _02099594
_02019C4C: .word 0x000003E7
	arm_func_end StopBgm

	arm_func_start ChangeBgm
ChangeBgm: ; 0x02019C50
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _02019CF8 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _02019CFC ; =_020995BC
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019D00 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019CE8
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019CE0
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _02019D00 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_02019CE0:
	ldr r0, _02019D00 ; =_022A4E58
	strh r4, [r0, #0x22]
_02019CE8:
	ldr r0, _02019CF8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02019CF8: .word _020AFB28
_02019CFC: .word _020995BC
_02019D00: .word _022A4E58
	arm_func_end ChangeBgm

	arm_func_start sub_02019D04
sub_02019D04: ; 0x02019D04
	stmdb sp!, {r4, lr}
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019D54 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019D3C
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	subgt r1, r1, #1
	movgt r4, #1
	strgt r1, [r0, #0x3c]
	movle r4, #0
	b _02019D40
_02019D3C:
	mov r4, #1
_02019D40:
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D50: .word _020AFB28
_02019D54: .word _022A4E58
	arm_func_end sub_02019D04

	arm_func_start sub_02019D58
sub_02019D58: ; 0x02019D58
	stmdb sp!, {r4, lr}
	ldr r0, _02019D7C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019D80 ; =_022A4E58
	ldr r0, _02019D7C ; =_020AFB28
	ldrh r4, [r1, #0x48]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D7C: .word _020AFB28
_02019D80: .word _022A4E58
	arm_func_end sub_02019D58

	arm_func_start PlayBgm2
PlayBgm2: ; 0x02019D84
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019FC0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019FC4 ; =_020995D0
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019FC8 ; =_022A4E58
	ldrh r0, [r0, #0x20]
	cmp r6, r0
	bne _02019DE0
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019DE0:
	ldr r1, _02019FC8 ; =_022A4E58
	ldr r0, _02019FCC ; =0x000003E7
	ldrh r1, [r1, #0x48]
	cmp r1, r0
	beq _02019E0C
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019E0C:
	cmp r6, #1
	blo _02019E1C
	cmp r6, #0xc9
	bls _02019E3C
_02019E1C:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019FCC ; =0x000003E7
	str r0, [r1, #0x44]
	ldr r0, _02019FC0 ; =_020AFB28
	strh r2, [r1, #0x48]
	bl sub_02002E98
	b _02019FB8
_02019E3C:
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x44]
	strh r6, [r0, #0x48]
	strh r4, [r0, #0x4a]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019FA4
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019FD0 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FD4 ; =_022A4EB4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r1, _02019FD8 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FDC ; =_022A4EA4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x4c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019FC8 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #0xc]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019FE0 ; =_022A4E50
	ldr r2, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x58]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019FC8 ; =_022A4E58
	str r0, [r1, #0x54]
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r2, [r0, #0xc]
	ldr r1, [r0, #0x54]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019F1C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019F1C
	bl FileRom_StopDataTransfer
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #0x5c]
	bl DseBgm_Load
	ldr r3, _02019FC8 ; =_022A4E58
	ldr r1, _02019FE4 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3, #8]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019FC8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #8]
	mov r2, #1
	bl ResumeBgm
_02019FA4:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019FC0 ; =_020AFB28
	str r2, [r1, #0x44]
	bl sub_02002E98
_02019FB8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019FC0: .word _020AFB28
_02019FC4: .word _020995D0
_02019FC8: .word _022A4E58
_02019FCC: .word 0x000003E7
_02019FD0: .word _02099554
_02019FD4: .word _022A4EB4
_02019FD8: .word _0209956C
_02019FDC: .word _022A4EA4
_02019FE0: .word _022A4E50
_02019FE4: .word sub_0201AABC
	arm_func_end PlayBgm2

	arm_func_start StopBgm2
StopBgm2: ; 0x02019FE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A0DC ; =_020995E8
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _0201A0E0 ; =_022A4E58
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0201A0CC
	ldr r6, _0201A0D8 ; =_020AFB28
	b _0201A034
_0201A020:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_0201A034:
	ldr r0, [r5, #0x44]
	cmp r0, #1
	beq _0201A020
	cmp r0, #2
	bne _0201A0CC
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A0E0 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #8]
	bl DseBgm_Stop
	cmp r4, #0
	beq _0201A084
	ldr r0, _0201A0E0 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0201A0CC
_0201A084:
	ldr r5, _0201A0D8 ; =_020AFB28
	ldr r4, _0201A0E0 ; =_022A4E58
	b _0201A0A4
_0201A090:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201A0A4:
	ldr r0, [r4, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A090
	bl sub_02019488
	ldr r0, _0201A0E0 ; =_022A4E58
	mov r2, #0
	ldr r1, _0201A0E4 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
_0201A0CC:
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201A0D8: .word _020AFB28
_0201A0DC: .word _020995E8
_0201A0E0: .word _022A4E58
_0201A0E4: .word 0x000003E7
	arm_func_end StopBgm2

	arm_func_start ChangeBgm2
ChangeBgm2: ; 0x0201A0E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _0201A190 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _0201A194 ; =_020995F8
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A198 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _0201A180
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0201A178
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _0201A198 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1, #8]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_0201A178:
	ldr r0, _0201A198 ; =_022A4E58
	strh r4, [r0, #0x4a]
_0201A180:
	ldr r0, _0201A190 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0201A190: .word _020AFB28
_0201A194: .word _020995F8
_0201A198: .word _022A4E58
	arm_func_end ChangeBgm2

	arm_func_start sub_0201A19C
sub_0201A19C: ; 0x0201A19C
	stmdb sp!, {r4, lr}
	ldr r0, _0201A1C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A1C4 ; =_022A4E58
	ldr r0, _0201A1C0 ; =_020AFB28
	ldrh r4, [r1, #0x68]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A1C0: .word _020AFB28
_0201A1C4: .word _022A4E58
	arm_func_end sub_0201A19C

	arm_func_start PlayME
PlayME: ; 0x0201A1C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _0201A3F0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _0201A3F4 ; =_0209960C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r7, _0201A3F8 ; =_022A4E58
	cmp r6, #0xd
	ldr r0, [r7, #0x18]
	movhi r6, #0
	cmp r0, #0
	bne _0201A2B0
	mov r0, #1
	str r0, [r7, #0x18]
	str r0, [r7, #0x64]
	ldr r8, _0201A3F0 ; =_020AFB28
	strh r6, [r7, #0x68]
_0201A228:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _0201A268
	cmp r0, #2
	bne _0201A250
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0]
	bl DseBgm_Stop
	b _0201A268
_0201A250:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A228
_0201A268:
	ldr r8, _0201A3F0 ; =_020AFB28
	ldr r7, _0201A3F8 ; =_022A4E58
_0201A270:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _0201A304
	cmp r0, #2
	bne _0201A298
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #8]
	bl DseBgm_Stop
	b _0201A304
_0201A298:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A270
_0201A2B0:
	ldr r0, [r7, #0x64]
	cmp r0, #2
	bne _0201A304
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopME
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r8, _0201A3F0 ; =_020AFB28
	b _0201A2F0
_0201A2DC:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A2F0:
	ldr r0, [r7, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A2DC
	bl sub_02019508
_0201A304:
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r0, #1
	str r0, [r1, #0x18]
	str r0, [r1, #0x64]
	ldr r0, _0201A3F0 ; =_020AFB28
	strh r6, [r1, #0x68]
	bl sub_02002E98
	ldr r1, _0201A3FC ; =_02099620
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _0201A400 ; =_022A4ECC
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _0201A404 ; =_02099634
	add r0, sp, #0x18
	bl sprintf
	ldr r0, _0201A408 ; =_022A4EC4
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x6c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r1, _0201A3F8 ; =_022A4E58
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x74]
	bl DseBgm_Load
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #4
	str r0, [r1, #0x10]
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	str r2, [sp, #4]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0201A3F8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #0x10]
	mov r2, #1
	bl ResumeBgm
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #2
	ldr r0, _0201A3F0 ; =_020AFB28
	str r2, [r1, #0x64]
	bl sub_02002E98
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A3F0: .word _020AFB28
_0201A3F4: .word _0209960C
_0201A3F8: .word _022A4E58
_0201A3FC: .word _02099620
_0201A400: .word _022A4ECC
_0201A404: .word _02099634
_0201A408: .word _022A4EC4
	arm_func_end PlayME

	arm_func_start StopME
StopME: ; 0x0201A40C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A478 ; =_02099644
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A47C ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #1
	ldreq r0, [r0, #0x64]
	cmpeq r0, #2
	bne _0201A468
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A47C ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x10]
	bl DseBgm_Stop
_0201A468:
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A474: .word _020AFB28
_0201A478: .word _02099644
_0201A47C: .word _022A4E58
	arm_func_end StopME

	arm_func_start sub_0201A480
sub_0201A480: ; 0x0201A480
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7, asr #8
	ldr r0, _0201A4F4 ; =_020AFB28
	and r5, r7, #0xff
	and r4, r1, #0xff
	mov r6, #0
	bl sub_02002CB4
	cmp r5, #0
	cmpne r4, #0x3f
	beq _0201A4E4
	cmp r4, #1
	bne _0201A4D4
	ldr r0, _0201A4F8 ; =_022A4E58
	mov r1, r5, lsl #0x10
	ldr r0, [r0, #0x88]
	mov r1, r1, lsr #0x10
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	movgt r6, #1
	b _0201A4E4
_0201A4D4:
	ldr r0, _0201A4F8 ; =_022A4E58
	ldrh r0, [r0, #0x98]
	cmp r0, r7
	moveq r6, #1
_0201A4E4:
	ldr r0, _0201A4F4 ; =_020AFB28
	bl sub_02002E98
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201A4F4: .word _020AFB28
_0201A4F8: .word _022A4E58
	arm_func_end sub_0201A480

	arm_func_start PlaySe
PlaySe: ; 0x0201A4FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r5, asr #8
	ldr r0, _0201A660 ; =_020AFB28
	mov r7, r1
	and r6, r2, #0xff
	and r4, r5, #0xff
	bl sub_02002CB4
	ldr r1, _0201A664 ; =_02099650
	mov r2, r5
	mov r3, r7
	mov r0, #8
	bl Debug_Print
	rsb r0, r7, r7, lsl #7
	mov r0, r0, asr #8
	mov r1, #4
	str r0, [sp, #0xc]
	str r1, [sp]
	cmp r4, #0
	beq _0201A650
	cmp r6, #0x3f
	bne _0201A578
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A650
_0201A578:
	cmp r6, #1
	bne _0201A5A0
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A650
_0201A5A0:
	ldr r0, _0201A668 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh r5, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A60C
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r8, _0201A660 ; =_020AFB28
	mov r7, #0
	ldr r6, _0201A668 ; =_022A4E58
	b _0201A5F8
_0201A5E4:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A5F8:
	ldr r0, [r6, #0xdc]
	mov r1, r7
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A5E4
_0201A60C:
	mov r0, r5
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A668 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A650
	ldr r3, _0201A668 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A650:
	ldr r0, _0201A660 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A660: .word _020AFB28
_0201A664: .word _02099650
_0201A668: .word _022A4E58
	arm_func_end PlaySe

	arm_func_start PlaySeFullSpec
PlaySeFullSpec: ; 0x0201A66C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	mov sb, r0
	mov r4, sb, asr #8
	ldr r0, _0201A81C ; =_020AFB28
	mov r8, r1
	mov r7, r2
	mov r6, r3
	and r4, r4, #0xff
	and r5, sb, #0xff
	bl sub_02002CB4
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #8
	ldr r1, _0201A820 ; =_02099660
	mov r2, sb
	mov r3, r8
	bl Debug_Print
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3e8
	mul r0, r8, r0
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r7, r7, lsl #7
	rsb r1, r6, r6, lsl #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x14]
	cmp r5, #0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	add r0, r0, #0x40
	str r0, [sp, #0x18]
	mov r0, #0xc
	str r0, [sp, #8]
	beq _0201A80C
	cmp r4, #0x3f
	bne _0201A734
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A80C
_0201A734:
	cmp r4, #1
	bne _0201A75C
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A80C
_0201A75C:
	ldr r0, _0201A824 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh sb, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A7C8
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r7, _0201A81C ; =_020AFB28
	mov r6, #0
	ldr r4, _0201A824 ; =_022A4E58
	b _0201A7B4
_0201A7A0:
	mov r0, r7
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r7
	bl sub_02002CB4
_0201A7B4:
	ldr r0, [r4, #0xdc]
	mov r1, r6
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A7A0
_0201A7C8:
	mov r0, sb
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A824 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A80C
	ldr r3, _0201A824 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #8
	add r0, r0, r5, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A80C:
	ldr r0, _0201A81C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0201A81C: .word _020AFB28
_0201A820: .word _02099660
_0201A824: .word _022A4E58
	arm_func_end PlaySeFullSpec

	arm_func_start SeChangeVolume
SeChangeVolume: ; 0x0201A828
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A8F4 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A8F8 ; =_02099684
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #4
	rsb r2, r6, r6, lsl #7
	str r0, [sp, #4]
	mov r0, r1, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x10]
	cmp r5, #0
	beq _0201A8E4
	cmp r4, #0x3f
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A8D8
	cmp r4, #1
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A8FC ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A8D8:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A8E4:
	ldr r0, _0201A8F4 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A8F4: .word _020AFB28
_0201A8F8: .word _02099684
_0201A8FC: .word _022A4E58
	arm_func_end SeChangeVolume

	arm_func_start SeChangePan
SeChangePan: ; 0x0201A900
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A9D8 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A9DC ; =_020996A4
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r6, r6, lsl #6
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r2, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r1, #8
	str r1, [sp, #4]
	add r1, r2, #0x40
	mov r0, r0, lsr #0x10
	add r0, r1, r0, lsl #16
	str r0, [sp, #0x14]
	cmp r5, #0
	beq _0201A9C8
	cmp r4, #0x3f
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A9BC
	cmp r4, #1
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A9E0 ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A9BC:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A9C8:
	ldr r0, _0201A9D8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A9D8: .word _020AFB28
_0201A9DC: .word _020996A4
_0201A9E0: .word _022A4E58
	arm_func_end SeChangePan

	arm_func_start StopSe
StopSe: ; 0x0201A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r2, r7, asr #8
	ldr r0, _0201AA94 ; =_020AFB28
	mov r5, r1
	and r6, r2, #0xff
	and r4, r7, #0xff
	bl sub_02002CB4
	ldr r1, _0201AA98 ; =_020996C0
	mov r2, r7
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r7, #0x3f00
	bne _0201AA2C
	mov r0, #0
	bl DseSe_StopAll
	b _0201AA88
_0201AA2C:
	cmp r4, #0
	beq _0201AA88
	cmp r6, #0x3f
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r4, r0, r4, lsl #16
	beq _0201AA64
	cmp r6, #1
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r4, r0, r4, lsl #16
	ldrne r0, _0201AA9C ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r4, r0, r4, lsl #16
_0201AA64:
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl DseSe_Stop
_0201AA88:
	ldr r0, _0201AA94 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201AA94: .word _020AFB28
_0201AA98: .word _020996C0
_0201AA9C: .word _022A4E58
	arm_func_end StopSe

	arm_func_start sub_0201AAA0
sub_0201AAA0: ; 0x0201AAA0
	mov r0, r0, asr #8
	and r0, r0, #0xff
	cmp r0, #0x3f
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0201AAA0

	arm_func_start sub_0201AABC
sub_0201AABC: ; 0x0201AABC
	ldr r1, _0201AAD4 ; =_022A4E58
	mov r0, #0
	ldr r2, [r1, #0x3c]
	add r2, r2, #1
	str r2, [r1, #0x3c]
	bx lr
	.align 2, 0
_0201AAD4: .word _022A4E58
	arm_func_end sub_0201AABC

	arm_func_start FillCopyToFlatVramCommand
FillCopyToFlatVramCommand: ; 0x0201AAD8
	ldrb ip, [sp]
	cmp ip, #1
	cmpne ip, #2
	moveq r3, r3, lsl #1
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldrb r2, [sp]
	ldrh r1, [sp, #4]
	strb r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	mov r0, r3
	bx lr
	arm_func_end FillCopyToFlatVramCommand

	arm_func_start ExecuteCopyToFlatVramCommand
ExecuteCopyToFlatVramCommand: ; 0x0201AB0C
	stmdb sp!, {r3, lr}
	mov ip, r0
	ldr r1, [ip, #4]
	cmp r1, #0
	beq _0201AB7C
	ldrb r0, [ip, #0xe]
	cmp r0, #0
	bne _0201AB40
	mov r0, r1
	ldr r1, [ip, #8]
	ldr r2, [ip]
	bl MTi_CpuCopy32
	ldmia sp!, {r3, pc}
_0201AB40:
	cmp r0, #1
	bne _0201AB60
	ldr r2, [ip]
	ldrh r3, [ip, #0xc]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave
	ldmia sp!, {r3, pc}
_0201AB60:
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [ip]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl CopyAndInterleave0
	ldmia sp!, {r3, pc}
_0201AB7C:
	ldr r1, [ip, #8]
	ldr r2, [ip]
	mov r0, #0
	bl MTi_CpuClear32
	ldmia sp!, {r3, pc}
	arm_func_end ExecuteCopyToFlatVramCommand

	arm_func_start sub_0201AB90
sub_0201AB90: ; 0x0201AB90
	ldr ip, _0201ABA8 ; =MemZero
	add r2, r0, #0xe00
	mov r3, #0
	mov r1, #0xe00
	strh r3, [r2]
	bx ip
	.align 2, 0
_0201ABA8: .word MemZero
	arm_func_end sub_0201AB90

	arm_func_start DecodeFragmentByteAssemblyTable
DecodeFragmentByteAssemblyTable: ; 0x0201ABAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r7, #0
	mov sb, r0
	mov r8, r1
	mov r6, r7
	add r5, sp, #8
	b _0201ABF8
_0201ABCC:
	str r6, [sp]
	str r6, [sp, #4]
	ldr r2, [sb], #0xc
	mov r0, r5
	mov r1, r8
	bl FillCopyToFlatVramCommand
	mov r4, r0
	mov r0, r5
	bl ExecuteCopyToFlatVramCommand
	add r8, r8, r4
	add r7, r7, r4
_0201ABF8:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201ABCC
	mov r0, r7
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DecodeFragmentByteAssemblyTable

	arm_func_start sub_0201AC10
sub_0201AC10: ; 0x0201AC10
	add r0, r0, #0xe00
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201AC10

	arm_func_start sub_0201AC20
sub_0201AC20: ; 0x0201AC20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x10]
	ldrh ip, [sp, #0x14]
	mov r4, r0
	str lr, [sp]
	str ip, [sp, #4]
	add r0, r4, #0xe00
	ldrsh r0, [r0]
	add r0, r4, r0, lsl #4
	bl FillCopyToFlatVramCommand
	add r0, r4, #0xe00
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AC20

	arm_func_start sub_0201AC64
sub_0201AC64: ; 0x0201AC64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	add r4, sl, #0xe00
	mov fp, #1
	mov r5, #0
	b _0201AD30
_0201AC90:
	ldrsh r0, [r4]
	cmp r0, #0xe0
	bge _0201AD3C
	cmp r7, #0
	beq _0201ACB8
	cmp r7, #1
	beq _0201ACD8
	cmp r7, #2
	beq _0201ACF8
	b _0201AD1C
_0201ACB8:
	str r5, [sp]
	str r5, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
	b _0201AD1C
_0201ACD8:
	str fp, [sp]
	str r6, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
	b _0201AD1C
_0201ACF8:
	mov r1, #2
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl FillCopyToFlatVramCommand
	mov r3, r0
_0201AD1C:
	ldrsh r0, [r4]
	add r8, r8, r3
	add sb, sb, #0xc
	add r0, r0, #1
	strh r0, [r4]
_0201AD30:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201AC90
_0201AD3C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0201AC64

	arm_func_start sub_0201AD44
sub_0201AD44: ; 0x0201AD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r0, r6, #0xe00
	ldrsh r5, [r0]
	mov r4, #0
	b _0201AD70
_0201AD5C:
	add r0, r6, r4, lsl #4
	bl ExecuteCopyToFlatVramCommand
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201AD70:
	cmp r4, r5
	blt _0201AD5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AD44

	arm_func_start sub_0201AD7C
sub_0201AD7C: ; 0x0201AD7C
	add r0, r0, #0x14
	bx lr
	arm_func_end sub_0201AD7C

	arm_func_start sub_0201AD84
sub_0201AD84: ; 0x0201AD84
	add r0, r0, #0x50
	bx lr
	arm_func_end sub_0201AD84

	arm_func_start sub_0201AD8C
sub_0201AD8C: ; 0x0201AD8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, r2
	mov r5, #0
	mov ip, #1
	b _0201ADC0
_0201ADA4:
	add r2, r1, r5
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	add r5, r5, #0x10
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADC0:
	cmp r5, r0
	blt _0201ADA4
	mov ip, r0, lsr #0x1f
	rsb r2, ip, r0, lsl #28
	adds r2, ip, r2, ror #28
	beq _0201ADF8
	add r2, r1, r0
	sub r2, r2, #1
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	mov ip, #1
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADF8:
	mov r1, r1, lsl #0x10
	mov r2, r3
	mov r3, r0
	add r0, r4, #0x14
	mov r1, r1, lsr #0x10
	bl FillPaletteDataRgba
	add r0, r4, #0x14
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AD8C

	arm_func_start sub_0201AE1C
sub_0201AE1C: ; 0x0201AE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov lr, #0
	add ip, r4, r1, lsl #1
	mov r5, #1
	b _0201AE50
_0201AE34:
	add r0, r2, lr
	and r0, r0, #0xff
	ldrh r6, [ip, #0x7c]
	mov r0, r0, asr #4
	add lr, lr, #0x10
	orr r0, r6, r5, lsl r0
	strh r0, [ip, #0x7c]
_0201AE50:
	cmp lr, r3
	blt _0201AE34
	mov ip, r3, lsr #0x1f
	rsb r0, ip, r3, lsl #28
	adds r0, ip, r0, ror #28
	beq _0201AE90
	add r0, r2, r3
	sub r0, r0, #1
	and r0, r0, #0xff
	add r6, r4, #0x7c
	mov r5, r1, lsl #1
	ldrh lr, [r6, r5]
	mov r0, r0, asr #4
	mov ip, #1
	orr r0, lr, ip, lsl r0
	strh r0, [r6, r5]
_0201AE90:
	add r0, r2, r1, lsl #8
	mov r1, r0, lsl #0x10
	ldr r2, [sp, #0x10]
	add r0, r4, #0x50
	mov r1, r1, lsr #0x10
	bl FillPaletteDataRgba
	add r0, r4, #0x50
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AE1C

	arm_func_start sub_0201AEB4
sub_0201AEB4: ; 0x0201AEB4
	ldrh r3, [r0, #0x7a]
	mov r1, r1, asr #4
	mov r2, #1
	orr r1, r3, r2, lsl r1
	strh r1, [r0, #0x7a]
	bx lr
	arm_func_end sub_0201AEB4

	arm_func_start sub_0201AECC
sub_0201AECC: ; 0x0201AECC
	stmdb sp!, {r3, lr}
	add lr, r0, #0x7c
	mov ip, r1, lsl #1
	ldrh r3, [lr, ip]
	mov r0, r2, asr #4
	mov r1, #1
	orr r0, r3, r1, lsl r0
	strh r0, [lr, ip]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201AECC

	arm_func_start sub_0201AEF0
sub_0201AEF0: ; 0x0201AEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	strb r4, [r5, #0x79]
	ldrb r0, [r5, #0x78]
	orr r0, r0, #2
	strb r0, [r5, #0x78]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AEF0

	arm_func_start sub_0201AF18
sub_0201AF18: ; 0x0201AF18
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r1, #0
	mov r2, #0x100
	mov r4, r0
	str r1, [sp]
	bl sub_0200A124
	mov r2, #0
	mov r1, r4
	str r2, [sp]
	add r0, r4, #0x14
	mov r3, #0x100
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #4
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF18

	arm_func_start sub_0201AF64
sub_0201AF64: ; 0x0201AF64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r1
	mov ip, #0
	add r0, r4, #0x3c
	mov r1, #2
	mov r2, #0x1000
	str ip, [sp]
	bl sub_0200A124
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0x50
	add r1, r4, #0x3c
	mov r3, #0x1000
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #8
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF64

	arm_func_start sub_0201AFB8
sub_0201AFB8: ; 0x0201AFB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _0201AFE0
	add r0, r4, #0x14
	bl sub_0200A510
	mov r0, r4
	bl sub_0200A180
_0201AFE0:
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x50
	bl sub_0200A510
	add r0, r4, #0x3c
	bl sub_0200A180
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AFB8

	arm_func_start sub_0201B004
sub_0201B004: ; 0x0201B004
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrb r1, [r7, #0x78]
	mov r2, r1, lsl #0x1d
	movs r2, r2, lsr #0x1f
	beq _0201B158
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _0201B14C
	ldrb r0, [r7, #8]
	cmp r0, #0
	beq _0201B150
	mov r4, #0
_0201B038:
	mov r2, r4, lsl #4
	and r0, r2, #0xff
	ldrh r1, [r7, #0x7a]
	mov r0, r0, asr #4
	mov r3, #1
	tst r1, r3, lsl r0
	moveq r3, #0
	tst r3, #0xff
	beq _0201B12C
	mov r0, r2, lsl #0x10
	ldr r1, [r7, #0x10]
	mov r3, r0, asr #0x10
	add r5, r1, r3, lsl #1
	ldr r2, [r7, #0xc]
	mov r0, r5
	mov r1, #0x20
	add r6, r2, r3, lsl #1
	bl DC_FlushRange
	ldr r0, [r7]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0201B0A4
_0201B090: ; jump table
	b _0201B0A4 ; case 0
	b _0201B0C0 ; case 1
	b _0201B0DC ; case 2
	b _0201B0F8 ; case 3
	b _0201B114 ; case 4
_0201B0A4:
	mov r1, #0
_0201B0A8:
	ldrh r0, [r5], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r6], #2
	blt _0201B0A8
	b _0201B12C
_0201B0C0:
	bl GX_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0201B12C
_0201B0DC:
	bl GX_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0201B12C
_0201B0F8:
	bl GXS_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0201B12C
_0201B114:
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0201B12C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	blt _0201B038
	mov r0, #0
	strb r0, [r7, #8]
	b _0201B150
_0201B14C:
	bl sub_0200A184
_0201B150:
	mov r0, #0
	strh r0, [r7, #0x7a]
_0201B158:
	ldrb r0, [r7, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #0x3c
	bl sub_0200A184
	mov r3, #0
	mov r2, r3
_0201B178:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r7, r3, lsl #1
	mov r3, r0, asr #0x10
	strh r2, [r1, #0x7c]
	cmp r3, #0x10
	blt _0201B178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201B004

	arm_func_start sub_0201B198
sub_0201B198: ; 0x0201B198
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r8, r1
	mov r4, r0
	mov r1, #0x70
	mov r7, r2
	mov r6, r3
	bl MemZero
	strb r5, [r4, #0xe]
	strb r6, [r4]
	stmib r4, {r7, r8}
	ldr r0, [r4, #4]
	bl sub_0201AC10
	mov r0, #2
	strh r0, [r4, #0xc]
	cmp r6, #0
	moveq r0, #0x6400000
	movne r0, #0x6600000
	str r0, [r4, #0x64]
	cmp r5, #0
	bne _0201B210
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	mov r3, #0x7000000
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B210:
	cmp r5, #1
	bne _0201B238
	ldr r3, _0201B294 ; =0x07000400
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B238:
	cmp r5, #2
	bne _0201B260
	ldr r3, _0201B298 ; =0x07000380
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
	b _0201B284
_0201B260:
	cmp r5, #3
	bne _0201B284
	ldr r3, _0201B29C ; =0x07000780
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl InitOamInfo
_0201B284:
	mov r0, r4
	bl sub_0201B2A0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201B294: .word 0x07000400
_0201B298: .word 0x07000380
_0201B29C: .word 0x07000780
	arm_func_end sub_0201B198

	arm_func_start sub_0201B2A0
sub_0201B2A0: ; 0x0201B2A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x40]
	add r0, r4, #0x20
	bl ClearGroupedOamObjsAndGroups
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	mov r1, #0xc
	bl MemZero
	mov r0, #0
	strb r0, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201B2A0

	arm_func_start sub_0201B2DC
sub_0201B2DC: ; 0x0201B2DC
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r6, [r0, #0xc]
	ldrh r4, [r3, #4]
	ldr r5, _0201B384 ; =_020AFC28
	mov lr, r6, lsr #0x1f
	rsb r3, lr, r6, lsl #30
	add r3, lr, r3, ror #30
	mov r3, r3, lsl #1
	ldrsh r3, [r5, r3]
	cmp r4, #0
	ldr lr, [r0, #0x64]
	mul r5, r2, r3
	bne _0201B35C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	cmp r3, #0x10
	bhs _0201B344
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B344:
	mov r3, ip
	add r1, r5, lr
	mov r2, #2
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
	b _0201B37C
_0201B35C:
	cmp r4, #1
	bne _0201B37C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	mov r2, ip
	add r1, r5, lr
	bl DecodeFragmentByteAssemblyTable
	mov ip, r0
_0201B37C:
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201B384: .word _020AFC28
	arm_func_end sub_0201B2DC

	arm_func_start sub_0201B388
sub_0201B388: ; 0x0201B388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r0, #0xc]
	ldrb ip, [r3, #0xa]
	ldr r5, _0201B438 ; =_020AFC28
	mov r4, lr, lsr #0x1f
	rsb lr, r4, lr, lsl #30
	add r4, r4, lr, ror #30
	mov r4, r4, lsl #1
	ldrsh lr, [r5, r4]
	cmp ip, #0xff
	ldr r4, [r0, #0x64]
	mul r5, r2, lr
	ldreqh r2, [sp, #0x10]
	andeq ip, r2, #0xff
	ldrh r2, [r3, #4]
	cmp r2, #0
	bne _0201B414
	cmp ip, #0x10
	bhs _0201B3F8
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
	b _0201B430
_0201B3F8:
	mov r2, #0
	str r2, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	mov r3, #2
	bl sub_0201AC64
	b _0201B430
_0201B414:
	cmp r2, #1
	bne _0201B430
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
_0201B430:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201B438: .word _020AFC28
	arm_func_end sub_0201B388

	arm_func_start LoadObjPalette
LoadObjPalette: ; 0x0201B43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	ldrb r1, [r6, #0xa]
	mov r7, r0
	ldrh r0, [r6, #4]
	mov r5, r2
	cmp r1, #0xff
	movne r5, r1
	cmp r0, #0
	bne _0201B4B8
	cmp r5, #0x10
	bhs _0201B48C
	ldrsh r2, [r6, #6]
	mov r1, r5, lsl #4
	ldr r0, [r7, #8]
	ldr r3, [r6]
	and r1, r1, #0xff
	and r2, r2, #0xff
	bl sub_0201AD8C
	b _0201B534
_0201B48C:
	ldr r1, [r6]
	sub r0, r5, #0x10
	str r1, [sp]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, [r7, #8]
	and r1, r1, #0xff
	mov r2, #0
	mov r3, #0x10
	bl sub_0201AE1C
	b _0201B534
_0201B4B8:
	cmp r0, #1
	bne _0201B534
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _0201B518
	ldrsh r1, [r6, #6]
	mov r4, #0
	mov sb, #0x10
	mov r0, r1, asr #3
	add r8, r1, r0, lsr #28
	b _0201B50C
_0201B4E4:
	ldr r0, [r6]
	add r1, r5, r4
	add r0, r0, r4, lsl #6
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldr r0, [r7, #8]
	mov r3, sb
	and r1, r1, #0xff
	bl sub_0201AE1C
	add r4, r4, #1
_0201B50C:
	cmp r4, r8, asr #4
	blt _0201B4E4
	b _0201B534
_0201B518:
	ldr r0, [r6]
	and r1, r5, #0xff
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #6]
	ldr r0, [r7, #8]
	bl sub_0201AE1C
_0201B534:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadObjPalette

	arm_func_start sub_0201B53C
sub_0201B53C: ; 0x0201B53C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	mov r5, r3
	ldrh ip, [r4, #4]
	ldr r3, _0201B5F4 ; =_020AFC30
	mov r6, r0
	mov r0, ip, lsl #1
	ldrh r7, [r3, r0]
	mov r3, #0
	cmp r7, #0
	bne _0201B57C
	ldrh r0, [sp, #0x1c]
	cmp r0, #0x10
	movhs r0, #1
	movlo r0, r7
	b _0201B580
_0201B57C:
	mov r0, r7
_0201B580:
	mov ip, r2, lsl #0x10
	ldrsh r2, [r6, #0xc]
	cmp r7, #0
	cmpeq r0, #1
	mov r0, r1
	moveq r3, #1
	mov r1, ip, asr #0x10
	bl sub_0201B5F8
	ldrb r1, [sp, #0x24]
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r1, #0
	bne _0201B5D0
	ldrh ip, [sp, #0x1c]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, r4
	str ip, [sp]
	bl sub_0201B388
_0201B5D0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	bne _0201B5EC
	ldrh r2, [sp, #0x1c]
	mov r0, r6
	mov r1, r4
	bl LoadObjPalette
_0201B5EC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201B5F4: .word _020AFC30
	arm_func_end sub_0201B53C

	arm_func_start sub_0201B5F8
sub_0201B5F8: ; 0x0201B5F8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r5, r1
	mov r1, r4
	add r0, sp, #0
	mov r6, r2
	mov r4, r3
	bl sub_0201B678
	ldrh r3, [sp, #8]
	ldr r0, _0201B670 ; =0x000003FF
	ldr r1, _0201B674 ; =_020996D8
	mov r2, r6, lsl #1
	and r0, r3, r0
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, r2]
	mov r0, r0, asr #0x10
	cmp r4, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	movne r1, #1
	mov r0, r0, asr #0x10
	moveq r1, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	add r0, r5, r0, asr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201B670: .word 0x000003FF
_0201B674: .word _020996D8
	arm_func_end sub_0201B5F8

	arm_func_start sub_0201B678
sub_0201B678: ; 0x0201B678
	ldrh r3, [r1]
	ldr r2, _0201B6D0 ; =0x0000FCFF
	strh r3, [r0]
	ldrh ip, [r1, #2]
	sub r3, r2, #0xb00
	strh ip, [r0, #2]
	ldrh ip, [r1, #4]
	and r2, ip, r2
	strh r2, [r0, #4]
	ldrh r2, [r1, #6]
	and r2, r2, r3
	strh r2, [r0, #6]
	ldrh r2, [r1, #8]
	strh r2, [r0, #8]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	mov r1, r2, lsl #0x16
	and r2, r3, #0xe00
	mov r1, r1, lsr #0x12
	orr r1, r1, r2, asr #9
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201B6D0: .word 0x0000FCFF
	arm_func_end sub_0201B678

	arm_func_start AddWanFragmentToOam
AddWanFragmentToOam: ; 0x0201B6D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, r2
	mov r7, r1
	mov r4, r3
	ldrsh r1, [r6, #4]
	ldrsh r2, [r5, #0xc]
	ldrb r3, [r6, #0xe]
	mov r0, r7
	bl sub_0201B5F8
	ldr r1, [r5, #0x40]
	str r0, [sp, #4]
	cmp r1, #0x80
	mvnge r0, #0
	bge _0201B9A4
	ldrh r2, [r6, #0xa]
	ldrh r3, [r6, #8]
	ldrb sl, [r6, #0xf]
	and r8, r2, #0xff
	ldrh r2, [r6, #0xc]
	add r0, sp, #0x16
	mov r1, r7
	str r2, [sp]
	and sb, r3, #0xff
	ldrh r7, [r6, #6]
	ldrsh fp, [r6, #2]
	ldrsh r6, [r6]
	bl sub_0201B678
	ldrsb r0, [sp, #0x19]
	adds r7, r7, r0
	movmi r7, #0
	cmp r7, #0x140
	ldrge r7, _0201B9AC ; =0x0000013F
	cmp r4, #0
	bne _0201B790
	add r3, sp, #0x1a
	ldrh r0, [r3]
	add r4, sp, #0xe
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	strh r0, [r4]
	ldrh r0, [r3, #6]
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	b _0201B7E8
_0201B790:
	add lr, sp, #0x1a
	ldrh r1, [r4]
	ldrh r2, [lr]
	ldrh r0, [r4, #6]
	add ip, sp, #0xe
	and r1, r2, r1
	orr r0, r0, r1
	strh r0, [ip]
	ldrh r2, [lr, #2]
	ldrh r1, [r4, #2]
	ldrh r3, [r4, #8]
	ldrh r0, [lr, #4]
	and r1, r2, r1
	orr r1, r3, r1
	strh r1, [ip, #2]
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	ldrh r3, [lr, #6]
	and r0, r0, r1
	orr r0, r2, r0
	strh r0, [ip, #4]
	strh r3, [ip, #6]
_0201B7E8:
	ldrh r1, [sp, #0x12]
	mov r2, #0x400
	rsb r2, r2, #0
	and r1, r1, r2
	ldrh r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	and r1, r0, r2, lsr #23
	sub r0, r6, #0x100
	add r4, r1, r0
	ldr r1, [sp, #4]
	ldrh r0, [sp, #0x12]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsr #0x16
	and r1, r2, r1, lsr #16
	orr r1, r0, r1
	mov r3, r4, lsl #0x10
	mov r0, r3, asr #0x10
	strh r1, [sp, #0x12]
	bl sub_0201B9B0
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0x10]
	mov r0, #0x200
	rsb r0, r0, #0
	and r1, r1, r0
	strh r1, [sp, #0x10]
	ldrh r3, [sp, #0x14]
	mov r1, r0, lsr #0x14
	sub r2, fp, #0x200
	and r1, r1, r3, asr #4
	add r6, r1, r2
	ldrh r3, [sp, #0x10]
	mov r1, r6, lsl #0x10
	and r2, r4, r0, lsr #23
	mov r0, r1, asr #0x10
	orr r1, r3, r2
	strh r1, [sp, #0x10]
	bl sub_0201B9D4
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0xe]
	ldrh r0, [sp, #0x14]
	and r2, r6, #0xff
	bic r1, r1, #0xff
	strh r1, [sp, #0xe]
	ldrh r3, [sp, #0xe]
	mov r1, r0, asr #1
	ldr r0, [sp]
	orr r2, r3, r2
	bic r2, r2, #0x2000
	strh r2, [sp, #0xe]
	ldrh r2, [sp, #0xe]
	mov r0, r0, lsl #0x1f
	tst r1, #1
	orr r0, r2, r0, lsr #18
	strh r0, [sp, #0xe]
	bne _0201B928
	cmp sl, #0
	beq _0201B8FC
	ldrh r1, [sp, #0x12]
	mov r0, sb, lsl #0x1c
	bic r1, r1, #0xf000
	strh r1, [sp, #0x12]
	ldrh r1, [sp, #0x12]
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
	b _0201B928
_0201B8FC:
	ldrh r2, [sp, #0x12]
	and r1, sb, #0xf
	bic r0, r2, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r2, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r1
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B928:
	ldrh r1, [sp, #0x12]
	bic r0, r1, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r1, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r8
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B950:
	cmp r7, #0
	mvnlt r0, #1
	blt _0201B9A4
	ldr r1, [r5, #0x40]
	ldr r0, [r5, #0x20]
	cmp r1, r0
	bge _0201B9A0
	ldrh r4, [sp, #0xe]
	ldrh r3, [sp, #0x10]
	ldrh r0, [sp, #0x12]
	add r1, sp, #8
	mov r2, r7
	strh r0, [sp, #0xc]
	strh r4, [sp, #8]
	strh r3, [sp, #0xa]
	add r0, r5, #0x20
	bl AddObjToUngroupedOamObjs
	ldr r0, [r5, #0x40]
	add r0, r0, #1
	str r0, [r5, #0x40]
_0201B9A0:
	mov r0, #0
_0201B9A4:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201B9AC: .word 0x0000013F
	arm_func_end AddWanFragmentToOam

	arm_func_start sub_0201B9B0
sub_0201B9B0: ; 0x0201B9B0
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9C4
	cmp r0, #0x100
	blt _0201B9CC
_0201B9C4:
	mov r0, #1
	bx lr
_0201B9CC:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9B0

	arm_func_start sub_0201B9D4
sub_0201B9D4: ; 0x0201B9D4
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9E8
	cmp r0, #0xc0
	blt _0201B9F0
_0201B9E8:
	mov r0, #1
	bx lr
_0201B9F0:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9D4

	arm_func_start AddSimpleObjToOam
AddSimpleObjToOam: ; 0x0201B9F8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #0x40]
	cmp r3, #0x80
	mvnge r0, #0
	bge _0201BA90
	cmp r2, #0
	blt _0201BA24
	cmp r2, #0x140
	blt _0201BA2C
_0201BA24:
	mvn r0, #1
	b _0201BA90
_0201BA2C:
	ldr r0, [r4, #0x20]
	cmp r3, r0
	bge _0201BA8C
	ldrh lr, [r1]
	ldr r3, _0201BA98 ; =0x00000FFF
	add r0, r4, #0x20
	strh lr, [sp]
	ldrh ip, [r1, #2]
	and lr, lr, #0xff00
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	strh ip, [sp, #4]
	ldrh ip, [r1, #6]
	add r1, sp, #0
	and r3, r3, ip, asr #4
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	and r3, r3, #0xff
	orr r3, lr, r3
	strh r3, [sp]
	bl AddObjToUngroupedOamObjs
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0201BA8C:
	mov r0, #0
_0201BA90:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201BA98: .word 0x00000FFF
	arm_func_end AddSimpleObjToOam
