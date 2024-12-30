	.include "asm/macros.inc"
	.include "main_02003DB8.inc"

	.text

	arm_func_start HaltProcessDisp
HaltProcessDisp: ; 0x02003DB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_02002580
	ldr r1, _02003EBC ; =_020AF078
	cmp r0, r1
	moveq r1, #1
	movne r1, #0
	ldr r0, _02003EC0 ; =_020AEF7C
	and r2, r1, #0xff
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003E28
	mov r1, #1
	strb r1, [r0, #0xf]
	cmp r2, #0
	beq _02003E24
	mov r6, #0
	ldr r5, _02003EC4 ; =_020AF050
	b _02003E14
_02003E04:
	mov r0, r6
	bl sub_02079888
	mov r0, r5
	bl sub_020029B8
_02003E14:
	bl sub_020081F0
	cmp r0, #0
	beq _02003E04
	b _02003E28
_02003E24:
	bl sub_020081C8
_02003E28:
	mov r0, #1
	bl sub_02002824
	bl sub_020184A8
	ldr r0, _02003EC8 ; =_02092540
	mov r1, r4
	bl Debug_Print0
	cmp r4, #2
	bne _02003E9C
	mov r0, #1
	bl sub_0200B76C
	mov r7, #0
	mov r6, #1
	ldr r5, _02003EC0 ; =_020AEF7C
	b _02003E7C
_02003E60:
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _02003E84
	mov r0, r6
	mov r1, r6
	bl sub_02078900
	add r7, r7, #1
_02003E7C:
	cmp r7, #0x12c
	blt _02003E60
_02003E84:
	ldr r0, _02003EC0 ; =_020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _02003E9C
	mov r0, #0
	bl sub_02002448
_02003E9C:
	cmp r4, #1
	beq _02003EAC
	mov r0, #0
	bl sub_0200B76C
_02003EAC:
	bl sub_020845F8
	mov r0, #0
	bl sub_020025F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02003EBC: .word _020AF078
_02003EC0: .word _020AEF7C
_02003EC4: .word _020AF050
_02003EC8: .word _02092540
	arm_func_end HaltProcessDisp

	arm_func_start sub_02003ECC
sub_02003ECC: ; 0x02003ECC
	bx lr
	arm_func_end sub_02003ECC

; https://decomp.me/scratch/uxxU8
	arm_func_start OverlayIsLoaded
OverlayIsLoaded: ; 0x02003ED0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	cmp r0, #0x24
	addls pc, pc, r0, lsl #2
	b _02004078
_02003EE4: ; jump table
	b _02003F78 ; case 0
	b _02003F80 ; case 1
	b _02003F80 ; case 2
	b _02003F80 ; case 3
	b _02003F9C ; case 4
	b _02003F9C ; case 5
	b _02003FC8 ; case 6
	b _02003FC8 ; case 7
	b _02003FC8 ; case 8
	b _02003FC8 ; case 9
	b _02003FC8 ; case 10
	b _02003FC8 ; case 11
	b _02003FC8 ; case 12
	b _02003FF4 ; case 13
	b _02003FF4 ; case 14
	b _02003FF4 ; case 15
	b _02004020 ; case 16
	b _02004020 ; case 17
	b _02004020 ; case 18
	b _02004020 ; case 19
	b _02004020 ; case 20
	b _02004020 ; case 21
	b _02004020 ; case 22
	b _02004020 ; case 23
	b _02004020 ; case 24
	b _02004020 ; case 25
	b _02004020 ; case 26
	b _02004020 ; case 27
	b _02004020 ; case 28
	b _02004020 ; case 29
	b _02004020 ; case 30
	b _02004020 ; case 31
	b _02004020 ; case 32
	b _0200404C ; case 33
	b _0200404C ; case 34
	b _0200404C ; case 35
	b _0200404C ; case 36
_02003F78:
	mov r0, #1
	b _02004098
_02003F80:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r1, [r1, #8]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003F9C:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r2, [r1, #8]
	cmp r2, #1
	movne r0, #0
	bne _02004098
	ldr r1, [r1, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003FC8:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r2, [r1, #4]
	cmp r2, #4
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003FF4:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r2, [r1, #8]
	cmp r2, #2
	movne r0, #0
	bne _02004098
	ldr r1, [r1, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02004020:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r2, [r1, #4]
	cmp r2, #0xd
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_0200404C:
	ldr r1, _020040A0 ; =LOADED_OVERLAY_GROUP_0
	ldr r2, [r1, #4]
	cmp r2, #0xe
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02004078:
	ldr r1, _020040A4 ; =_02092558
	add r0, sp, #0
	ldr r2, [r1, #0x14]
	ldr r3, [r1, #0x10]
	ldr r1, _020040A8 ; =_0209258C
	str r3, [sp]
	str r2, [sp, #4]
	bl Debug_FatalError
_02004098:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020040A0: .word LOADED_OVERLAY_GROUP_0
_020040A4: .word _02092558
_020040A8: .word _0209258C
	arm_func_end OverlayIsLoaded

	arm_func_start LoadOverlay
LoadOverlay: ; 0x020040AC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	mov r4, r0
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _020041A4
_020040C4: ; jump table
	b _02004158 ; case 0
	b _0200415C ; case 1
	b _0200415C ; case 2
	b _0200415C ; case 3
	b _02004168 ; case 4
	b _02004168 ; case 5
	b _02004174 ; case 6
	b _02004174 ; case 7
	b _02004174 ; case 8
	b _02004174 ; case 9
	b _02004174 ; case 10
	b _02004174 ; case 11
	b _02004174 ; case 12
	b _02004180 ; case 13
	b _02004180 ; case 14
	b _02004180 ; case 15
	b _0200418C ; case 16
	b _0200418C ; case 17
	b _0200418C ; case 18
	b _0200418C ; case 19
	b _0200418C ; case 20
	b _0200418C ; case 21
	b _0200418C ; case 22
	b _0200418C ; case 23
	b _0200418C ; case 24
	b _0200418C ; case 25
	b _0200418C ; case 26
	b _0200418C ; case 27
	b _0200418C ; case 28
	b _0200418C ; case 29
	b _0200418C ; case 30
	b _0200418C ; case 31
	b _0200418C ; case 32
	b _02004198 ; case 33
	b _02004198 ; case 34
	b _02004198 ; case 35
	b _02004198 ; case 36
_02004158:
	b _020047C4
_0200415C:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0, #8]
	b _020041C4
_02004168:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0, #4]
	b _020041C4
_02004174:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0]
	b _020041C4
_02004180:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0, #4]
	b _020041C4
_0200418C:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0]
	b _020041C4
_02004198:
	ldr r0, _020047CC ; =LOADED_OVERLAY_GROUP_0
	str r4, [r0]
	b _020041C4
_020041A4:
	ldr r1, _020047D0 ; =_02092558
	add r0, sp, #8
	ldr r2, [r1, #0x1c]
	ldr r3, [r1, #0x18]
	ldr r1, _020047D4 ; =_020925A0
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl Debug_FatalError
_020041C4:
	bl FileRom_InitDataTransfer
	bl sub_0207A324
	bl sub_0207A270
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004780
_020041DC: ; jump table
	b _02004780 ; case 0
	b _02004270 ; case 1
	b _02004294 ; case 2
	b _020042B8 ; case 3
	b _020042DC ; case 4
	b _02004300 ; case 5
	b _02004324 ; case 6
	b _02004348 ; case 7
	b _0200436C ; case 8
	b _02004390 ; case 9
	b _020043B4 ; case 10
	b _020043D8 ; case 11
	b _020043FC ; case 12
	b _02004420 ; case 13
	b _02004444 ; case 14
	b _02004468 ; case 15
	b _0200448C ; case 16
	b _020044B0 ; case 17
	b _020044D4 ; case 18
	b _020044F8 ; case 19
	b _0200451C ; case 20
	b _02004540 ; case 21
	b _02004564 ; case 22
	b _02004588 ; case 23
	b _020045AC ; case 24
	b _020045D0 ; case 25
	b _020045F4 ; case 26
	b _02004618 ; case 27
	b _0200463C ; case 28
	b _02004660 ; case 29
	b _02004684 ; case 30
	b _020046A8 ; case 31
	b _020046CC ; case 32
	b _020046F0 ; case 33
	b _02004714 ; case 34
	b _02004738 ; case 35
	b _0200475C ; case 36
_02004270:
	ldr r2, _020047D8 ; =0x00000000
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004294:
	ldr r2, _020047DC ; =0x0000000A
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042B8:
	ldr r2, _020047E0 ; =0x00000023
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042DC:
	ldr r2, _020047E4 ; =0x00000001
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004300:
	ldr r2, _020047E8 ; =0x00000002
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004324:
	ldr r2, _020047EC ; =0x00000003
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004348:
	ldr r2, _020047F0 ; =0x00000006
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200436C:
	ldr r2, _020047F4 ; =0x00000004
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004390:
	ldr r2, _020047F8 ; =0x00000005
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043B4:
	ldr r2, _020047FC ; =0x00000007
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043D8:
	ldr r2, _02004800 ; =0x00000008
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043FC:
	ldr r2, _02004804 ; =0x00000009
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004420:
	ldr r2, _02004808 ; =0x0000000B
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004444:
	ldr r2, _0200480C ; =0x0000001D
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004468:
	ldr r2, _02004810 ; =0x00000022
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200448C:
	ldr r2, _02004814 ; =0x0000000C
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044B0:
	ldr r2, _02004818 ; =0x0000000D
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044D4:
	ldr r2, _0200481C ; =0x0000000E
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044F8:
	ldr r2, _02004820 ; =0x0000000F
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200451C:
	ldr r2, _02004824 ; =0x00000010
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004540:
	ldr r2, _02004828 ; =0x00000011
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004564:
	ldr r2, _0200482C ; =0x00000012
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004588:
	ldr r2, _02004830 ; =0x00000013
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045AC:
	ldr r2, _02004834 ; =0x00000014
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045D0:
	ldr r2, _02004838 ; =0x00000015
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045F4:
	ldr r2, _0200483C ; =0x00000016
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004618:
	ldr r2, _02004840 ; =0x00000017
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200463C:
	ldr r2, _02004844 ; =0x00000018
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004660:
	ldr r2, _02004848 ; =0x00000019
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004684:
	ldr r2, _0200484C ; =0x0000001A
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046A8:
	ldr r2, _02004850 ; =0x0000001B
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046CC:
	ldr r2, _02004854 ; =0x0000001C
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046F0:
	ldr r2, _02004858 ; =0x0000001E
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004714:
	ldr r2, _0200485C ; =0x0000001F
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004738:
	ldr r2, _02004860 ; =0x00000020
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200475C:
	ldr r2, _02004864 ; =0x00000021
	add r0, sp, #0x10
	mov r1, #0
	bl GetOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004780:
	ldr r1, _020047D0 ; =_02092558
	add r0, sp, #0
	ldr r2, [r1, #0xc]
	ldr r3, [r1, #8]
	ldr r1, _020047D4 ; =_020925A0
	str r3, [sp]
	str r2, [sp, #4]
	bl Debug_FatalError
_020047A0:
	add r0, sp, #0x10
	bl LoadOverlayInternal
	cmp r0, #0
	bne _020047B8
	mov r0, #1
	bl CardPullOutWithStatus
_020047B8:
	add r0, sp, #0x10
	bl InitOverlay
	bl FileRom_StopDataTransfer
_020047C4:
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020047CC: .word LOADED_OVERLAY_GROUP_0
_020047D0: .word _02092558
_020047D4: .word _020925A0
_020047D8: .word 0x00000000
_020047DC: .word 0x0000000A
_020047E0: .word 0x00000023
_020047E4: .word 0x00000001
_020047E8: .word 0x00000002
_020047EC: .word 0x00000003
_020047F0: .word 0x00000006
_020047F4: .word 0x00000004
_020047F8: .word 0x00000005
_020047FC: .word 0x00000007
_02004800: .word 0x00000008
_02004804: .word 0x00000009
_02004808: .word 0x0000000B
_0200480C: .word 0x0000001D
_02004810: .word 0x00000022
_02004814: .word 0x0000000C
_02004818: .word 0x0000000D
_0200481C: .word 0x0000000E
_02004820: .word 0x0000000F
_02004824: .word 0x00000010
_02004828: .word 0x00000011
_0200482C: .word 0x00000012
_02004830: .word 0x00000013
_02004834: .word 0x00000014
_02004838: .word 0x00000015
_0200483C: .word 0x00000016
_02004840: .word 0x00000017
_02004844: .word 0x00000018
_02004848: .word 0x00000019
_0200484C: .word 0x0000001A
_02004850: .word 0x0000001B
_02004854: .word 0x0000001C
_02004858: .word 0x0000001E
_0200485C: .word 0x0000001F
_02004860: .word 0x00000020
_02004864: .word 0x00000021
	arm_func_end LoadOverlay

	arm_func_start UnloadOverlay
UnloadOverlay: ; 0x02004868
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004968
_02004880: ; jump table
	b _02004914 ; case 0
	b _02004918 ; case 1
	b _02004918 ; case 2
	b _02004918 ; case 3
	b _02004928 ; case 4
	b _02004928 ; case 5
	b _02004938 ; case 6
	b _02004938 ; case 7
	b _02004938 ; case 8
	b _02004938 ; case 9
	b _02004938 ; case 10
	b _02004938 ; case 11
	b _02004938 ; case 12
	b _02004928 ; case 13
	b _02004928 ; case 14
	b _02004928 ; case 15
	b _02004948 ; case 16
	b _02004948 ; case 17
	b _02004948 ; case 18
	b _02004948 ; case 19
	b _02004948 ; case 20
	b _02004948 ; case 21
	b _02004948 ; case 22
	b _02004948 ; case 23
	b _02004948 ; case 24
	b _02004948 ; case 25
	b _02004948 ; case 26
	b _02004948 ; case 27
	b _02004948 ; case 28
	b _02004948 ; case 29
	b _02004948 ; case 30
	b _02004948 ; case 31
	b _02004948 ; case 32
	b _02004958 ; case 33
	b _02004958 ; case 34
	b _02004958 ; case 35
	b _02004958 ; case 36
_02004914:
	b _02004ED0
_02004918:
	ldr r0, _02004ED8 ; =LOADED_OVERLAY_GROUP_0
	mov r1, #0
	str r1, [r0, #8]
	b _02004988
_02004928:
	ldr r0, _02004ED8 ; =LOADED_OVERLAY_GROUP_0
	mov r1, #0
	str r1, [r0, #4]
	b _02004988
_02004938:
	ldr r0, _02004ED8 ; =LOADED_OVERLAY_GROUP_0
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004948:
	ldr r0, _02004ED8 ; =LOADED_OVERLAY_GROUP_0
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004958:
	ldr r0, _02004ED8 ; =LOADED_OVERLAY_GROUP_0
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004968:
	ldr r1, _02004EDC ; =_02092558
	add r0, sp, #8
	ldr r2, [r1, #0x24]
	ldr r3, [r1, #0x20]
	ldr r1, _02004EE0 ; =_020925B4
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl Debug_FatalError
_02004988:
	bl FileRom_InitDataTransfer
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004EAC
_02004998: ; jump table
	b _02004EAC ; case 0
	b _02004A2C ; case 1
	b _02004A4C ; case 2
	b _02004A6C ; case 3
	b _02004A8C ; case 4
	b _02004AAC ; case 5
	b _02004ACC ; case 6
	b _02004AEC ; case 7
	b _02004B0C ; case 8
	b _02004B2C ; case 9
	b _02004B4C ; case 10
	b _02004B6C ; case 11
	b _02004B8C ; case 12
	b _02004BAC ; case 13
	b _02004BCC ; case 14
	b _02004BEC ; case 15
	b _02004C0C ; case 16
	b _02004C2C ; case 17
	b _02004C4C ; case 18
	b _02004C6C ; case 19
	b _02004C8C ; case 20
	b _02004CAC ; case 21
	b _02004CCC ; case 22
	b _02004CEC ; case 23
	b _02004D0C ; case 24
	b _02004D2C ; case 25
	b _02004D4C ; case 26
	b _02004D6C ; case 27
	b _02004D8C ; case 28
	b _02004DAC ; case 29
	b _02004DCC ; case 30
	b _02004DEC ; case 31
	b _02004E0C ; case 32
	b _02004E2C ; case 33
	b _02004E4C ; case 34
	b _02004E6C ; case 35
	b _02004E8C ; case 36
_02004A2C:
	ldr r1, _02004EE4 ; =0x00000000
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A4C:
	ldr r1, _02004EE8 ; =0x0000000A
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A6C:
	ldr r1, _02004EEC ; =0x00000023
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A8C:
	ldr r1, _02004EF0 ; =0x00000001
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AAC:
	ldr r1, _02004EF4 ; =0x00000002
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004ACC:
	ldr r1, _02004EF8 ; =0x00000003
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AEC:
	ldr r1, _02004EFC ; =0x00000006
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B0C:
	ldr r1, _02004F00 ; =0x00000004
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B2C:
	ldr r1, _02004F04 ; =0x00000005
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B4C:
	ldr r1, _02004F08 ; =0x00000007
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B6C:
	ldr r1, _02004F0C ; =0x00000008
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B8C:
	ldr r1, _02004F10 ; =0x00000009
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BAC:
	ldr r1, _02004F14 ; =0x0000000B
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BCC:
	ldr r1, _02004F18 ; =0x0000001D
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BEC:
	ldr r1, _02004F1C ; =0x00000022
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C0C:
	ldr r1, _02004F20 ; =0x0000000C
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C2C:
	ldr r1, _02004F24 ; =0x0000000D
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C4C:
	ldr r1, _02004F28 ; =0x0000000E
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C6C:
	ldr r1, _02004F2C ; =0x0000000F
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C8C:
	ldr r1, _02004F30 ; =0x00000010
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CAC:
	ldr r1, _02004F34 ; =0x00000011
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CCC:
	ldr r1, _02004F38 ; =0x00000012
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CEC:
	ldr r1, _02004F3C ; =0x00000013
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D0C:
	ldr r1, _02004F40 ; =0x00000014
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D2C:
	ldr r1, _02004F44 ; =0x00000015
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D4C:
	ldr r1, _02004F48 ; =0x00000016
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D6C:
	ldr r1, _02004F4C ; =0x00000017
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D8C:
	ldr r1, _02004F50 ; =0x00000018
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DAC:
	ldr r1, _02004F54 ; =0x00000019
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DCC:
	ldr r1, _02004F58 ; =0x0000001A
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DEC:
	ldr r1, _02004F5C ; =0x0000001B
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E0C:
	ldr r1, _02004F60 ; =0x0000001C
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E2C:
	ldr r1, _02004F64 ; =0x0000001E
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E4C:
	ldr r1, _02004F68 ; =0x0000001F
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E6C:
	ldr r1, _02004F6C ; =0x00000020
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E8C:
	ldr r1, _02004F70 ; =0x00000021
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004EAC:
	ldr r1, _02004EDC ; =_02092558
	add r0, sp, #0
	ldr r2, [r1, #4]
	ldr r3, [r1]
	ldr r1, _02004EE0 ; =_020925B4
	str r3, [sp]
	str r2, [sp, #4]
	bl Debug_FatalError
_02004ECC:
	bl FileRom_StopDataTransfer
_02004ED0:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02004ED8: .word LOADED_OVERLAY_GROUP_0
_02004EDC: .word _02092558
_02004EE0: .word _020925B4
_02004EE4: .word 0x00000000
_02004EE8: .word 0x0000000A
_02004EEC: .word 0x00000023
_02004EF0: .word 0x00000001
_02004EF4: .word 0x00000002
_02004EF8: .word 0x00000003
_02004EFC: .word 0x00000006
_02004F00: .word 0x00000004
_02004F04: .word 0x00000005
_02004F08: .word 0x00000007
_02004F0C: .word 0x00000008
_02004F10: .word 0x00000009
_02004F14: .word 0x0000000B
_02004F18: .word 0x0000001D
_02004F1C: .word 0x00000022
_02004F20: .word 0x0000000C
_02004F24: .word 0x0000000D
_02004F28: .word 0x0000000E
_02004F2C: .word 0x0000000F
_02004F30: .word 0x00000010
_02004F34: .word 0x00000011
_02004F38: .word 0x00000012
_02004F3C: .word 0x00000013
_02004F40: .word 0x00000014
_02004F44: .word 0x00000015
_02004F48: .word 0x00000016
_02004F4C: .word 0x00000017
_02004F50: .word 0x00000018
_02004F54: .word 0x00000019
_02004F58: .word 0x0000001A
_02004F5C: .word 0x0000001B
_02004F60: .word 0x0000001C
_02004F64: .word 0x0000001E
_02004F68: .word 0x0000001F
_02004F6C: .word 0x00000020
_02004F70: .word 0x00000021
	arm_func_end UnloadOverlay

	arm_func_start GetDsFirmwareUserSettingsVeneer
GetDsFirmwareUserSettingsVeneer: ; 0x02004F74
	ldr ip, _02004F7C ; =GetDsFirmwareUserSettings
	bx ip
	.align 2, 0
_02004F7C: .word GetDsFirmwareUserSettings
	arm_func_end GetDsFirmwareUserSettingsVeneer

	arm_func_start sub_02004F80
sub_02004F80: ; 0x02004F80
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02004FC8 ; =0xEDB88320
	mov r5, r0
	bl sub_020850B4
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_02085180
	mov r4, r0
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02004FC8: .word 0xEDB88320
	arm_func_end sub_02004F80

	arm_func_start Rgb8ToRgb5
Rgb8ToRgb5: ; 0x02004FCC
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	ldrb ip, [r1]
	and r1, r2, #0xf8
	and r2, r3, #0xf8
	mov r1, r1, lsl #2
	and r3, ip, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r3, asr #3
	strh r1, [r0]
	bx lr
	arm_func_end Rgb8ToRgb5

	arm_func_start sub_02004FF8
sub_02004FF8: ; 0x02004FF8
	ldrh r2, [r1]
	tst r2, #1
	movne r3, #7
	moveq r3, #0
	mov r1, r2, lsl #0x1b
	orr r1, r3, r1, lsr #24
	tst r2, #0x20
	movne r3, #7
	strb r1, [r0]
	moveq r3, #0
	and r1, r2, #0x3e0
	orr r1, r3, r1, asr #2
	tst r2, #0x400
	movne r3, #7
	strb r1, [r0, #1]
	moveq r3, #0
	and r1, r2, #0x7c00
	orr r1, r3, r1, asr #7
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #3]
	bx lr
	arm_func_end sub_02004FF8

	arm_func_start EuclideanNorm__02005050
EuclideanNorm__02005050: ; 0x02005050
	stmdb sp!, {r4, r5, r6, lr}
	ldmia r0, {r5, r6}
	mov r0, r5
	bl _fflt
	mov r4, r0
	mov r0, r5
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fmul
	mov r5, r0
	mov r0, r6
	bl _fflt
	mov r4, r0
	mov r0, r6
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fmul
	mov r1, r0
	mov r0, r5
	bl _fadd
	bl sqrtf
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EuclideanNorm__02005050

	arm_func_start EuclideanNorm__020050B0
EuclideanNorm__020050B0: ; 0x020050B0
	stmdb sp!, {r4, r5, r6, lr}
	ldmia r0, {r5, r6}
	mov r0, r5
	bl _fflt
	mov r4, r0
	mov r0, r5
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fmul
	mov r5, r0
	mov r0, r6
	bl _fflt
	mov r4, r0
	mov r0, r6
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fmul
	mov r1, r0
	mov r0, r5
	bl _fadd
	bl sqrtf
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EuclideanNorm__020050B0

	arm_func_start ClampComponentAbs
ClampComponentAbs: ; 0x02005110
	ldr r3, [r0]
	cmp r3, r1
	strgt r1, [r0]
	bgt _0200512C
	rsb r2, r1, #0
	cmp r3, r2
	strlt r2, [r0]
_0200512C:
	ldr r2, [r0, #4]
	cmp r2, r1
	strgt r1, [r0, #4]
	bxgt lr
	rsb r1, r1, #0
	cmp r2, r1
	strlt r1, [r0, #4]
	bx lr
	arm_func_end ClampComponentAbs

	arm_func_start sub_0200514C
sub_0200514C: ; 0x0200514C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r2
	ldr r4, [sp, #0x18]
	ldr r2, [r6]
	mov r7, r1
	mul r1, r2, r4
	mov r5, r3
	ldr r2, [r7]
	mov r8, r0
	mla r0, r2, r5, r1
	add r1, r5, r4
	bl _s32_div_f
	str r0, [r8]
	ldr r0, [r6, #4]
	ldr r2, [r7, #4]
	mul r1, r0, r4
	mla r0, r2, r5, r1
	add r1, r5, r4
	bl _s32_div_f
	str r0, [r8, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200514C

	arm_func_start sub_020051A0
sub_020051A0: ; 0x020051A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _0200533C
_020051B4: ; jump table
	b _0200533C ; case 0
	b _02005204 ; case 1
	b _0200521C ; case 2
	b _02005234 ; case 3
	b _0200524C ; case 4
	b _02005264 ; case 5
	b _0200527C ; case 6
	b _020052DC ; case 7
	b _02005304 ; case 8
	b _0200531C ; case 9
	b _0200533C ; case 10
	b _0200533C ; case 11
	b _02005330 ; case 12
	b _02005330 ; case 13
	b _02005330 ; case 14
	b _02005330 ; case 15
	b _02005330 ; case 16
	b _02005330 ; case 17
	b _02005330 ; case 18
	b _02005330 ; case 19
_02005204:
	cmp r4, #0
	addge r0, r4, #7
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200521C:
	cmp r4, #0
	addge r0, r4, #1
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_02005234:
	cmp r4, #0
	addge r0, r4, #6
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200524C:
	cmp r4, #0
	addge r0, r4, #2
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_02005264:
	cmp r4, #0
	addge r0, r4, #4
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200527C:
	tst r4, #1
	beq _020052B0
	mov r0, #2
	bl RandInt
	mov r0, r0, lsl #1
	add r0, r0, #7
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_020052B0:
	mov r0, #3
	bl RandInt
	mov r0, r0, lsl #1
	add r0, r0, #6
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_020052DC:
	mov r0, #3
	bl RandInt
	add r0, r0, #7
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_02005304:
	mov r0, #8
	bl RandInt
	bic r0, r0, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_0200531C:
	mov r0, #8
	bl RandInt
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_02005330:
	sub r0, r1, #0xc
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
_0200533C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020051A0

	arm_func_start sub_02005344
sub_02005344: ; 0x02005344
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, r4
	ldmeqia sp!, {r4, pc}
	cmp r2, #0x13
	addls pc, pc, r2, lsl #2
	ldmia sp!, {r4, pc}
_02005360: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	b _020053B0 ; case 1
	b _020053C8 ; case 2
	b _020053E0 ; case 3
	b _020053F8 ; case 4
	ldmia sp!, {r4, pc} ; case 5
	ldmia sp!, {r4, pc} ; case 6
	ldmia sp!, {r4, pc} ; case 7
	ldmia sp!, {r4, pc} ; case 8
	ldmia sp!, {r4, pc} ; case 9
	b _02005414 ; case 10
	b _02005410 ; case 11
	b _02005420 ; case 12
	b _02005420 ; case 13
	b _02005420 ; case 14
	b _02005420 ; case 15
	b _02005420 ; case 16
	b _02005420 ; case 17
	b _02005420 ; case 18
	b _02005420 ; case 19
_020053B0:
	cmp r0, #0
	addge r0, r0, #7
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053C8:
	cmp r0, #0
	addge r0, r0, #1
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053E0:
	cmp r0, #0
	addge r0, r0, #6
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053F8:
	cmp r0, #0
	addge r0, r0, #2
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_02005410:
	bl sub_02005430
_02005414:
	mov r1, r4
	bl sub_02005430
	ldmia sp!, {r4, pc}
_02005420:
	sub r0, r2, #0xc
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
	arm_func_end sub_02005344

	arm_func_start sub_02005430
sub_02005430: ; 0x02005430
	mvn r2, #0
	cmp r1, r2
	bxeq lr
	add r1, r1, #8
	sub r1, r1, r0
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	adds r1, r2, r1, ror #29
	bxeq lr
	cmp r1, #4
	bge _02005478
	add r0, r0, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_02005478:
	add r0, r0, #7
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	arm_func_end sub_02005430

	arm_func_start sub_02005494
sub_02005494: ; 0x02005494
	ldr ip, _020054BC ; =_020925F8
	add r3, r0, #1
	ldr r0, [ip, r3, lsl #3]
	add ip, ip, r3, lsl #3
	mul r3, r0, r2
	str r3, [r1]
	ldr r0, [ip, #4]
	mul r2, r0, r2
	str r2, [r1, #4]
	bx lr
	.align 2, 0
_020054BC: .word _020925F8
	arm_func_end sub_02005494

	arm_func_start sub_020054C0
sub_020054C0: ; 0x020054C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020055C4 ; =_020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x20]
	ldr r1, [r1, #0x24]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005550
	cmp r5, #0
	bge _02005530
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #5
	b _020055BC
_02005530:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #7
	b _020055BC
_02005550:
	ble _0200559C
	cmp r5, #0
	bge _0200557C
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #3
	b _020055BC
_0200557C:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #1
	b _020055BC
_0200559C:
	cmp r5, #0
	movlt r0, #4
	blt _020055BC
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_020055BC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020055C4: .word _020925C8
	arm_func_end sub_020054C0

	arm_func_start sub_020055C8
sub_020055C8: ; 0x020055C8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020056CC ; =_020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x18]
	ldr r1, [r1, #0x1c]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005658
	cmp r5, #0
	bge _02005638
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #5
	b _020056C4
_02005638:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #7
	b _020056C4
_02005658:
	ble _020056A4
	cmp r5, #0
	bge _02005684
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #3
	b _020056C4
_02005684:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #1
	b _020056C4
_020056A4:
	cmp r5, #0
	movlt r0, #4
	blt _020056C4
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_020056C4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020056CC: .word _020925C8
	arm_func_end sub_020055C8

	arm_func_start sub_020056D0
sub_020056D0: ; 0x020056D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020057A4 ; =_020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x28]
	ldr r1, [r1, #0x2c]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005748
	cmp r5, #0
	bge _02005734
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #4
	movle r0, #6
	b _0200579C
_02005734:
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #0
	movle r0, #6
	b _0200579C
_02005748:
	ble _0200577C
	cmp r5, #0
	bge _02005768
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #4
	movle r0, #2
	b _0200579C
_02005768:
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #0
	movle r0, #2
	b _0200579C
_0200577C:
	cmp r5, #0
	movlt r0, #4
	blt _0200579C
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_0200579C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020057A4: .word _020925C8
	arm_func_end sub_020056D0

	arm_func_start sub_020057A8
sub_020057A8: ; 0x020057A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _020058A4 ; =_020925C8
	ldr lr, [ip, #4]
	ldr ip, [ip]
	str lr, [sp, #4]
	str ip, [sp]
	ldr lr, [r2]
	ldr ip, [r0]
	subs ip, lr, ip
	str ip, [sp]
	ldr r2, [r2, #4]
	ldr r0, [r0, #4]
	sub r0, r2, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	ldr r0, [r3]
	bmi _02005814
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	subs r0, ip, r0
	str r0, [sp]
	movmi r0, #0
	strmi r0, [sp]
	b _02005838
_02005814:
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	add r0, ip, r0
	str r0, [sp]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp]
_02005838:
	ldr r0, [sp, #4]
	ldr r2, [r1, #4]
	cmp r0, #0
	ldr r1, [r3, #4]
	blt _02005870
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #4]
	movmi r0, #0
	strmi r0, [sp, #4]
	b _02005894
_02005870:
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	add r0, r0, r1
	str r0, [sp, #4]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp, #4]
_02005894:
	add r0, sp, #0
	bl sub_020056D0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020058A4: .word _020925C8
	arm_func_end sub_020057A8

	arm_func_start sub_020058A8
sub_020058A8: ; 0x020058A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _020059A4 ; =_020925C8
	ldr lr, [ip, #0xc]
	ldr ip, [ip, #8]
	str lr, [sp, #4]
	str ip, [sp]
	ldr lr, [r2]
	ldr ip, [r0]
	subs ip, lr, ip
	str ip, [sp]
	ldr r2, [r2, #4]
	ldr r0, [r0, #4]
	sub r0, r2, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	ldr r0, [r3]
	bmi _02005914
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	subs r0, ip, r0
	str r0, [sp]
	movmi r0, #0
	strmi r0, [sp]
	b _02005938
_02005914:
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	add r0, ip, r0
	str r0, [sp]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp]
_02005938:
	ldr r0, [sp, #4]
	ldr r2, [r1, #4]
	cmp r0, #0
	ldr r1, [r3, #4]
	blt _02005970
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #4]
	movmi r0, #0
	strmi r0, [sp, #4]
	b _02005994
_02005970:
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	add r0, r0, r1
	str r0, [sp, #4]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp, #4]
_02005994:
	add r0, sp, #0
	bl sub_020055C8
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020059A4: .word _020925C8
	arm_func_end sub_020058A8

	arm_func_start sub_020059A8
sub_020059A8: ; 0x020059A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xac
	ldr r0, _02005A8C ; =_020AF240
	bl sub_02002C40
	ldr r0, _02005A8C ; =_020AF240
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02005A8C ; =_020AF240
	bl sub_02002E98
	ldr r8, _02005A90 ; =_022A3248
	ldr r7, _02005A94 ; =_02092670
	ldr r6, _02005A98 ; =_020926C0
	add r5, sp, #0
	mov sb, #0
	mov r4, #0xa
_020059E4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _020059E4
	ldmia r6, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	mov r5, #0
	mov r6, #1
	mov r4, r5
_02005A08:
	ldrb r0, [r7, #8]
	strh sb, [r8]
	cmp r0, #0
	beq _02005A2C
	mov r1, r6
	mov r2, r5
	add r0, r8, #4
	bl sub_02002A9C
	b _02005A50
_02005A2C:
	add sl, sp, #0
	add lr, r8, #4
	mov ip, #0xa
_02005A38:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02005A38
	ldmia sl, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
_02005A50:
	strh r4, [r8, #0xb0]
	str r4, [r8, #0xb8]
	ldr r1, [r7, #0x10]
	mov r0, sb
	str r4, [r8, #0xb4]
	bl sub_02005A9C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	add r8, r8, #0xbc
	add r7, r7, #0x14
	blt _02005A08
	add sp, sp, #0xac
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02005A8C: .word _020AF240
_02005A90: .word _022A3248
_02005A94: .word _02092670
_02005A98: .word _020926C0
	arm_func_end sub_020059A8

	arm_func_start sub_02005A9C
sub_02005A9C: ; 0x02005A9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02005B0C ; =_02092670
	mov r4, r0
	mov r0, #0x14
	mla r0, r4, r0, r2
	ldrh r0, [r0, #4]
	ldr r3, _02005B10 ; =_022A3248
	mov r2, #0xbc
	mla r6, r4, r2, r3
	mov r8, r1
	cmp r0, #0
	mov r7, #0
	beq _02005B04
	bl sub_020031C0
	mov r5, r0
	bl sub_0200302C
	mov r0, r4
	bl sub_02005D30
	ldr r0, _02005B14 ; =_020AF240
	bl sub_02002CB4
	ldr r7, [r6, #0xb8]
	ldr r0, _02005B14 ; =_020AF240
	str r8, [r6, #0xb8]
	bl sub_02002E98
	mov r0, r5
	bl sub_020030FC
_02005B04:
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02005B0C: .word _02092670
_02005B10: .word _022A3248
_02005B14: .word _020AF240
	arm_func_end sub_02005A9C

	arm_func_start sub_02005B18
sub_02005B18: ; 0x02005B18
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	ldrsh ip, [r6]
	ldrh r5, [r6, #2]
	ldr r3, _02005D04 ; =_022A3248
	mov r0, #0xbc
	ldr r2, _02005D08 ; =_02092670
	mov r1, #0x14
	mla r4, ip, r0, r3
	tst r5, #0x400
	orrne r0, r5, #0x200
	movne r0, r0, lsl #0x10
	mla r1, ip, r1, r2
	movne r5, r0, lsr #0x10
	bne _02005B6C
	tst r5, #0x800
	ldreq r0, [r1, #0xc]
	orreq r0, r5, r0
	moveq r0, r0, lsl #0x10
	moveq r5, r0, lsr #0x10
_02005B6C:
	ldrh r0, [r1, #6]
	bl sub_020031C0
	ldrsh r0, [r6]
	bl sub_02005D30
	ldr r0, _02005D0C ; =_020AF240
	bl sub_02002CB4
	ldr r0, _02005D10 ; =_020AF23C
	ldr r1, [r0]
	add r2, r1, #1
	str r2, [r4, #0xb4]
	strh r5, [r4, #0xb0]
	ldrh r1, [r4, #0xb0]
	str r2, [r0]
	and r0, r1, #0xff
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02005CE0
_02005BB0: ; jump table
	b _02005BD0 ; case 0
	b _02005BF4 ; case 1
	b _02005C18 ; case 2
	b _02005C3C ; case 3
	b _02005C60 ; case 4
	b _02005C8C ; case 5
	b _02005CB8 ; case 6
	b _02005CE0 ; case 7
_02005BD0:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BFA4
	b _02005CE0
_02005BF4:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	b _02005CE0
_02005C18:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207C03C
	b _02005CE0
_02005C3C:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BF04
	b _02005CE0
_02005C60:
	bl GX_BeginLoadBGExtPltt
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl GX_EndLoadBGExtPltt
	b _02005CE0
_02005C8C:
	bl GX_BeginLoadOBJExtPltt
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl GX_EndLoadOBJExtPltt
	b _02005CE0
_02005CB8:
	bl GXS_BeginLoadBGExtPltt
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl GXS_EndLoadBGExtPltt
_02005CE0:
	ldr r0, _02005D0C ; =_020AF240
	bl sub_02002E98
	ldrh r0, [r4, #0xb0]
	tst r0, #0x100
	beq _02005CFC
	ldrsh r0, [r4]
	bl sub_02005D30
_02005CFC:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02005D04: .word _022A3248
_02005D08: .word _02092670
_02005D0C: .word _020AF240
_02005D10: .word _020AF23C
	arm_func_end sub_02005B18

	arm_func_start sub_02005D14
sub_02005D14: ; 0x02005D14
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #0xb0]
	tst r1, #0x200
	ldmeqia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02002B38
	ldmia sp!, {r3, pc}
	arm_func_end sub_02005D14

	arm_func_start sub_02005D30
sub_02005D30: ; 0x02005D30
	stmdb sp!, {r4, lr}
	ldr r1, _02005D88 ; =_02092670
	mov r4, r0
	mov r0, #0x14
	mla r0, r4, r0, r1
	ldrh r0, [r0, #6]
	bl sub_020031C0
	ldr r1, _02005D8C ; =_022A3248
	mov r0, #0xbc
	mla r0, r4, r0, r1
	ldr r0, [r0, #0xb8]
	cmp r0, #0
	beq _02005D74
	ldr r1, [r0, #8]
	mov r0, r4
	blx r1
	ldmia sp!, {r4, pc}
_02005D74:
	mov r0, r4
	bl sub_0207C0DC
	cmp r0, #0
	bne _02005D74
	ldmia sp!, {r4, pc}
	.align 2, 0
_02005D88: .word _02092670
_02005D8C: .word _022A3248
	arm_func_end sub_02005D30

	arm_func_start sub_02005D90
sub_02005D90: ; 0x02005D90
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02005DDC ; =_022A3248
	mov r5, r0
	mov r0, #0xbc
	smlabb r4, r5, r0, r1
	ldrh r0, [r4, #0xb0]
	tst r0, #0x200
	beq _02005DC8
	add r0, r4, #4
	bl sub_02002B7C
	ldrh r0, [r4, #0xb0]
	bic r0, r0, #0x200
	strh r0, [r4, #0xb0]
	ldmia sp!, {r3, r4, r5, pc}
_02005DC8:
	mov r0, r5
	bl sub_0207C0DC
	cmp r0, #0
	bne _02005DC8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02005DDC: .word _022A3248
	arm_func_end sub_02005D90

	arm_func_start sub_02005DE0
sub_02005DE0: ; 0x02005DE0
	stmdb sp!, {r3, lr}
	ldr r2, _02005E0C ; =_022A3248
	mov r1, #0xbc
	smlabb r1, r0, r1, r2
	ldrh r1, [r1, #0xb0]
	tst r1, #0x200
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl sub_0207C0DC
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02005E0C: .word _022A3248
	arm_func_end sub_02005DE0

	arm_func_start sub_02005E10
sub_02005E10: ; 0x02005E10
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr ip, [sp, #0x18]
	strh r0, [sp]
	add r0, sp, #0
	strh r1, [sp, #2]
	str ip, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl sub_02005B18
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_02005E10

	arm_func_start sub_02005E40
sub_02005E40: ; 0x02005E40
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02005EA4 ; =_020AF264
	bl sub_02002C40
	ldr r0, _02005EA4 ; =_020AF264
	mov r1, #8
	bl sub_02002CAC
	mov r8, #0
	ldr r7, _02005EA8 ; =_022A353C
	mov r6, r8
	mov r5, r8
	mov r4, #0xc
	b _02005E8C
_02005E70:
	mla r0, r8, r4, r7
	mov r1, r6
	bl sub_02005F14
	mov r0, r8
	mov r1, r5
	bl sub_02005F30
	add r8, r8, #1
_02005E8C:
	cmp r8, #2
	blt _02005E70
	ldr r0, _02005EA4 ; =_020AF264
	bl sub_02002E98
	bl sub_02006030
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02005EA4: .word _020AF264
_02005EA8: .word _022A353C
	arm_func_end sub_02005E40

	arm_func_start sub_02005EAC
sub_02005EAC: ; 0x02005EAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _02005F10 ; =_022A3554
	mov r7, #0
	cmp r7, #2
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, r7
	mov r4, r7
	b _02005F04
_02005ECC:
	strh r5, [r6, #0x1e]
	ldrh r1, [r6, #0x1e]
	mov r0, r7
	strh r1, [r6, #0x12]
	bl sub_02006220
	strh r4, [r6, #0x3c]
	ldrh r1, [r6, #0x3c]
	mov r0, r7
	strh r1, [r6, #0x2c]
	bl sub_020062C8
	mov r0, r7
	bl sub_020063A0
	add r7, r7, #1
	add r6, r6, #0x44
_02005F04:
	cmp r7, #2
	blt _02005ECC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02005F10: .word _022A3554
	arm_func_end sub_02005EAC

	arm_func_start sub_02005F14
sub_02005F14: ; 0x02005F14
	mov r2, #0
	stmia r0, {r1, r2}
	ldr r1, _02005F2C ; =0x00002FFF
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_02005F2C: .word 0x00002FFF
	arm_func_end sub_02005F14

	arm_func_start sub_02005F30
sub_02005F30: ; 0x02005F30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02005F80 ; =_022A3554
	mov r5, r0
	mov r0, #0x44
	mla r4, r5, r0, r2
	mov r0, r4
	bl sub_02005F14
	mov r1, #0
	strh r1, [r4, #0x1e]
	mov r0, r5
	strh r1, [r4, #0x12]
	bl sub_02006220
	mov r1, #0
	strh r1, [r4, #0x3c]
	mov r0, r5
	strh r1, [r4, #0x2c]
	bl sub_020062C8
	mov r0, r5
	bl sub_020063A0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02005F80: .word _022A3554
	arm_func_end sub_02005F30

	arm_func_start sub_02005F84
sub_02005F84: ; 0x02005F84
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200601C ; =_022A353C
	movs r5, r0
	mov r0, #0xc
	mla r4, r5, r0, r1
	movne r6, #0
	bne _02005FCC
	ldr r1, _02006020 ; =0x04000130
	ldr r0, _02006024 ; =0x027FFFA8
	ldrh r3, [r1]
	ldrh r2, [r0]
	ldr r0, _02006028 ; =0x00002FFF
	ldr r1, _0200602C ; =_022A3538
	orr r2, r3, r2
	eor r2, r2, r0
	and r0, r2, r0
	strh r0, [r1]
	mov r6, #2
_02005FCC:
	ldr r0, [r4]
	cmp r6, r0
	beq _02005FF0
	mov r0, r4
	mov r1, r6
	bl sub_02005F14
	mov r0, r5
	mov r1, r6
	bl sub_02005F30
_02005FF0:
	ldr r1, _0200602C ; =_022A3538
	mov r0, r6
	ldrh r2, [r1]
	strh r2, [r4, #8]
	ldrh r1, [r4, #0xa]
	and r1, r1, r2
	strh r1, [r4, #0xa]
	ldr r1, [r4, #4]
	add r1, r1, #1
	str r1, [r4, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200601C: .word _022A353C
_02006020: .word 0x04000130
_02006024: .word 0x027FFFA8
_02006028: .word 0x00002FFF
_0200602C: .word _022A3538
	arm_func_end sub_02005F84

	arm_func_start sub_02006030
sub_02006030: ; 0x02006030
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200608C ; =_020AF264
	bl sub_02002CB4
	mov r7, #0
	ldr r5, _02006090 ; =_022A353C
	ldr r6, _02006094 ; =_022A3554
	mov r4, r7
_0200604C:
	mov r0, r7
	bl sub_02005F84
	cmp r0, #0
	streq r4, [r6]
	beq _0200606C
	cmp r0, #1
	ldmneia r5, {r0, r1, r2}
	stmneia r6, {r0, r1, r2}
_0200606C:
	add r7, r7, #1
	cmp r7, #2
	add r5, r5, #0xc
	add r6, r6, #0x44
	blt _0200604C
	ldr r0, _0200608C ; =_020AF264
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200608C: .word _020AF264
_02006090: .word _022A353C
_02006094: .word _022A3554
	arm_func_end sub_02006030

	arm_func_start sub_02006098
sub_02006098: ; 0x02006098
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020061D8 ; =_020AF264
	bl sub_02002CB4
	mov r6, #0
	ldr r4, _020061DC ; =_022A353C
	ldr r5, _020061E0 ; =_022A3554
	ldr sb, _020061E4 ; =0x00002FFF
	ldr r7, _020061E8 ; =0x00000F0F
	mov lr, #1
	mov ip, r6
	mov r3, r6
	mov r8, r6
_020060C8:
	ldmia r4, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	ldr r0, [r4]
	cmp r0, #0
	beq _020061B8
	ldrh r1, [r5, #0x14]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #8]
	strh r0, [r5, #0x12]
	strb lr, [r5, #0x10]
	ldrh r0, [r5, #0xa]
	ldrh r1, [r5, #0x20]
	orr r0, r0, #0xf0
	and r0, r1, r0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #8]
	strh r0, [r5, #0x1e]
	strb lr, [r5, #0x1c]
	ldrh r1, [r5, #0x2e]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #8]
	and r0, r0, r7
	strh r0, [r5, #0x2c]
	strb lr, [r5, #0x24]
	ldrh r1, [r5, #0x3e]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x3e]
	ldrh r0, [r5, #8]
	and r0, r0, #0xf0
	strh r0, [r5, #0x3c]
	strb lr, [r5, #0x34]
	ldrh r0, [r5, #0x2c]
	cmp r0, #0
	streqb ip, [r5, #0x25]
	streq ip, [r5, #0x28]
	beq _02006184
	ldrb r0, [r5, #0x25]
	cmp r0, #0
	ldreq r1, [r5, #0x28]
	ldreq r0, [r4, #4]
	subeq r0, r1, r0
	streq r0, [r5, #0x28]
_02006184:
	ldrh r0, [r5, #0x3c]
	cmp r0, #0
	streqb r3, [r5, #0x35]
	streq r3, [r5, #0x38]
	beq _020061B0
	ldrb r0, [r5, #0x35]
	cmp r0, #0
	ldreq r1, [r5, #0x38]
	ldreq r0, [r4, #4]
	subeq r0, r1, r0
	streq r0, [r5, #0x38]
_020061B0:
	strh sb, [r4, #0xa]
	str r8, [r4, #4]
_020061B8:
	add r6, r6, #1
	cmp r6, #2
	add r4, r4, #0xc
	add r5, r5, #0x44
	blt _020060C8
	ldr r0, _020061D8 ; =_020AF264
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020061D8: .word _020AF264
_020061DC: .word _022A353C
_020061E0: .word _022A3554
_020061E4: .word 0x00002FFF
_020061E8: .word 0x00000F0F
	arm_func_end sub_02006098

	arm_func_start GetHeldButtons
GetHeldButtons: ; 0x020061EC
	mov r2, #0x44
	mul r2, r0, r2
	ldr r3, _0200621C ; =_022A3554
	add r0, r3, r2
	ldrh r0, [r0, #8]
	strh r0, [r1]
	ldr r0, [r3, r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200621C: .word _022A3554
	arm_func_end GetHeldButtons

	arm_func_start sub_02006220
sub_02006220: ; 0x02006220
	ldr r2, _02006258 ; =_022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	str r0, [r2, #0xc]
	strb r1, [r2, #0x1c]
	strb r1, [r2, #0x10]
	strh r1, [r2, #0x22]
	strh r1, [r2, #0x16]
	ldrh r0, [r2, #0x12]
	strh r0, [r2, #0x14]
	ldrh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	bx lr
	.align 2, 0
_02006258: .word _022A3554
	arm_func_end sub_02006220

	arm_func_start GetPressedButtons
GetPressedButtons: ; 0x0200625C
	ldr r3, _020062C0 ; =_022A3554
	mov r2, #0x44
	mla ip, r0, r2, r3
	ldrb r0, [ip, #0x10]
	cmp r0, #0
	beq _020062A0
	mov r0, #0
	strb r0, [ip, #0x10]
	ldrh r3, [ip, #0x12]
	ldrh r2, [ip, #0x14]
	ldr r0, _020062C4 ; =0x00002FFF
	and r2, r3, r2
	eor r0, r2, r0
	and r0, r3, r0
	strh r0, [ip, #0x16]
	ldrh r0, [ip, #0x12]
	strh r0, [ip, #0x14]
_020062A0:
	ldrh r0, [ip, #0x16]
	strh r0, [r1]
	ldr r0, [ip]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020062C0: .word _022A3554
_020062C4: .word 0x00002FFF
	arm_func_end GetPressedButtons

	arm_func_start sub_020062C8
sub_020062C8: ; 0x020062C8
	ldr r2, _020062F8 ; =_022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	strb r1, [r2, #0x24]
	mov r0, #1
	strb r0, [r2, #0x25]
	str r0, [r2, #0x28]
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	strh r1, [r2, #0x30]
	bx lr
	.align 2, 0
_020062F8: .word _022A3554
	arm_func_end sub_020062C8

	arm_func_start sub_020062FC
sub_020062FC: ; 0x020062FC
	stmdb sp!, {r3, lr}
	ldr r3, _02006398 ; =_022A3554
	mov r2, #0x44
	mla r2, r0, r2, r3
	ldrb r0, [r2, #0x24]
	cmp r0, #0
	beq _02006378
	mov lr, #0
	strb lr, [r2, #0x24]
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x30]
	ldrh ip, [r2, #0x2e]
	cmp ip, #0
	beq _02006368
	ldr r0, _0200639C ; =0x00002FFF
	ldrh r3, [r2, #0x2c]
	eor r0, ip, r0
	tst r0, r3
	movne r0, #0x1e
	strne r0, [r2, #0x28]
	bne _02006370
	ldr r0, [r2, #0x28]
	cmp r0, #0
	movle r0, #6
	strle r0, [r2, #0x28]
	strgth lr, [r2, #0x30]
	b _02006370
_02006368:
	mov r0, #0x1e
	str r0, [r2, #0x28]
_02006370:
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
_02006378:
	ldrh r0, [r2, #0x30]
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006398: .word _022A3554
_0200639C: .word 0x00002FFF
	arm_func_end sub_020062FC

	arm_func_start sub_020063A0
sub_020063A0: ; 0x020063A0
	ldr r2, _020063D0 ; =_022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	strb r1, [r2, #0x34]
	mov r0, #1
	strb r0, [r2, #0x35]
	str r0, [r2, #0x38]
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	strh r1, [r2, #0x40]
	bx lr
	.align 2, 0
_020063D0: .word _022A3554
	arm_func_end sub_020063A0

	arm_func_start sub_020063D4
sub_020063D4: ; 0x020063D4
	ldr r2, _020063F0 ; =_022A3554
	mov r1, #0x44
	mla r1, r0, r1, r2
	mov r0, #1
	strb r0, [r1, #0x35]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020063F0: .word _022A3554
	arm_func_end sub_020063D4

	arm_func_start sub_020063F4
sub_020063F4: ; 0x020063F4
	stmdb sp!, {r3, lr}
	ldr r3, _02006490 ; =_022A3554
	mov r2, #0x44
	mla r2, r0, r2, r3
	ldrb r0, [r2, #0x34]
	cmp r0, #0
	beq _02006470
	mov lr, #0
	strb lr, [r2, #0x34]
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x40]
	ldrh ip, [r2, #0x3e]
	cmp ip, #0
	beq _02006460
	ldr r0, _02006494 ; =0x00002FFF
	ldrh r3, [r2, #0x3c]
	eor r0, ip, r0
	tst r0, r3
	movne r0, #6
	strne r0, [r2, #0x38]
	bne _02006468
	ldr r0, [r2, #0x38]
	cmp r0, #0
	movle r0, #6
	strle r0, [r2, #0x38]
	strgth lr, [r2, #0x40]
	b _02006468
_02006460:
	mov r0, #0x1e
	str r0, [r2, #0x38]
_02006468:
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
_02006470:
	ldrh r0, [r2, #0x40]
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006490: .word _022A3554
_02006494: .word 0x00002FFF
	arm_func_end sub_020063F4

	arm_func_start sub_02006498
sub_02006498: ; 0x02006498
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r6, r0
	bl GetPressedButtons
	ldrh r2, [r5]
	ldr r1, _02006500 ; =0x00000F0F
	mov r4, r0
	and r0, r2, r1
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #0
	beq _020064D8
	mov r0, r6
	bl sub_020063A0
	b _020064F4
_020064D8:
	add r1, sp, #0
	mov r0, r6
	bl sub_020063F4
	ldrh r1, [r5]
	ldrh r0, [sp]
	orr r0, r1, r0
	strh r0, [r5]
_020064F4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02006500: .word 0x00000F0F
	arm_func_end sub_02006498

	arm_func_start sub_02006504
sub_02006504: ; 0x02006504
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	bl sub_020811EC
	add r0, sp, #0
	bl sub_02081264
	cmp r0, #0
	beq _02006528
	add r0, sp, #0
	bl sub_020812F8
_02006528:
	ldr r0, _0200655C ; =_020AF288
	bl sub_02002C40
	ldr r0, _0200655C ; =_020AF288
	mov r1, #8
	bl sub_02002CAC
	bl sub_02006564
	ldr r0, _02006560 ; =_022A35E8
	bl sub_02006B54
	ldr r0, _0200655C ; =_020AF288
	bl sub_02002E98
	bl sub_020065AC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200655C: .word _020AF288
_02006560: .word _022A35E8
	arm_func_end sub_02006504

	arm_func_start sub_02006564
sub_02006564: ; 0x02006564
	ldr r0, _020065A4 ; =TOUCHSCREEN_STATUS
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r2, #0
	strb r2, [r0, #8]
	ldr r3, _020065A8 ; =_022A3614
	mov r0, r2
_02006584:
	str r1, [r3]
	str r1, [r3, #4]
	add r2, r2, #1
	strb r0, [r3, #8]
	cmp r2, #4
	add r3, r3, #0xc
	blt _02006584
	bx lr
	.align 2, 0
_020065A4: .word TOUCHSCREEN_STATUS
_020065A8: .word _022A3614
	arm_func_end sub_02006564

	arm_func_start sub_020065AC
sub_020065AC: ; 0x020065AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	bl sub_02081420
	add r0, sp, #0x20
	bl sub_02081500
	cmp r0, #0
	bne _02006B34
	ldr r0, _02006B3C ; =_020AF288
	bl sub_02002CB4
	ldr ip, _02006B40 ; =_022A362C
	mov lr, #2
_020065D8:
	add r3, ip, #0xc
	ldmia ip, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	subs lr, lr, #1
	sub ip, ip, #0xc
	bpl _020065D8
	ldrh r1, [sp, #0x26]
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	tst r1, #1
	mvnne r2, #0
	ldreqh r2, [sp, #0x20]
	tst r1, #2
	ldrh r1, [sp, #0x24]
	str r2, [r0, #0x38]
	mvnne r2, #0
	ldreqh r2, [sp, #0x22]
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	cmp r1, #1
	str r2, [r0, #0x3c]
	moveq r1, #1
	movne r1, #0
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	tst r1, #0xff
	strb r1, [r0, #0x40]
	ldreqb r1, [r0, #0x4c]
	cmpeq r1, #0
	beq _020066FC
	ldr r0, _02006B48 ; =_022A3614
	add r3, sp, #0x34
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r4, #1
	ldr lr, _02006B4C ; =_022A3620
	mov r2, r4
	mov r3, #0
	mov r0, r4
	b _020066B4
_0200666C:
	ldrb r1, [lr, #8]
	cmp r1, #0
	beq _020066AC
	ldr r1, [sp, #0x34]
	mov ip, r3
	cmp r1, #0
	ldrlt r1, [lr]
	movlt ip, r2
	strlt r1, [sp, #0x34]
	ldr r1, [sp, #0x38]
	cmp r1, #0
	ldrlt r1, [lr, #4]
	movlt ip, r0
	strlt r1, [sp, #0x38]
	cmp ip, #0
	beq _020066BC
_020066AC:
	add r4, r4, #1
	add lr, lr, #0xc
_020066B4:
	cmp r4, #4
	blt _0200666C
_020066BC:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ldrge r0, [sp, #0x38]
	cmpge r0, #0
	addge r0, sp, #0x34
	ldrge r3, _02006B50 ; =TOUCHSCREEN_STATUS
	ldmgeia r0, {r0, r1, r2}
	stmgeia r3, {r0, r1, r2}
	bge _02006710
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r1, #0
	strb r1, [r0, #8]
	b _02006710
_020066FC:
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r1, #0
	strb r1, [r0, #8]
_02006710:
	ldr r0, _02006B50 ; =TOUCHSCREEN_STATUS
	add r3, sp, #0x28
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r3, [sp, #0x28]
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	ldr r2, [sp, #0x2c]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldrh r1, [r0, #0xe]
	tst r1, #1
	beq _02006760
	ldrb r1, [sp, #0x30]
	cmp r1, #0
	strne r3, [r0, #0x20]
	strne r2, [r0, #0x24]
	movne r1, #1
	strneh r1, [r0, #0xe]
	moveq r1, #4
	b _0200677C
_02006760:
	ldrb r1, [sp, #0x30]
	cmp r1, #0
	strne r3, [r0, #0x20]
	strne r2, [r0, #0x24]
	movne r1, #3
	strneh r1, [r0, #0xe]
	moveq r1, #0
_0200677C:
	streqh r1, [r0, #0xe]
	ldr r1, _02006B44 ; =TOUCHSCREEN_STATUS
	ldrh ip, [r1, #0xc]
	cmp ip, #6
	addls pc, pc, ip, lsl #2
	b _02006B2C
_02006794: ; jump table
	b _020067B0 ; case 0
	b _020067FC ; case 1
	b _020068B0 ; case 2
	b _02006988 ; case 3
	b _02006A84 ; case 4
	b _02006A84 ; case 5
	b _02006AF8 ; case 6
_020067B0:
	ldrh lr, [r1, #0xe]
	mov r0, #0
	tst lr, #1
	streq r0, [r1, #0x10]
	ldreq r0, [r1, #0x14]
	addeq r0, r0, #1
	streq r0, [r1, #0x14]
	beq _02006B2C
	mov ip, #1
	str ip, [r1, #0x10]
	str r0, [r1, #0x14]
	ldr r3, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	orr r0, lr, #0x40
	str r3, [r1, #0x28]
	str r2, [r1, #0x2c]
	strh r0, [r1, #0xe]
	strh ip, [r1, #0xc]
	b _02006B2C
_020067FC:
	ldrh r3, [r1, #0xe]
	mov r0, #0
	tst r3, #1
	beq _02006890
	ldr r2, [r1, #0x10]
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	orr r0, r3, #0x40
	strh r0, [r1, #0xe]
	cmp r2, #0xc
	ble _02006B2C
	ldr r3, [sp, #0x28]
	ldr r0, [r1, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r1, [r1, #0x2c]
	sub r0, r3, r0
	sub r1, r2, r1
	str r0, [sp]
	str r1, [sp, #4]
	bl abs
	cmp r0, #8
	bge _02006874
	ldr r0, [sp, #4]
	bl abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =TOUCHSCREEN_STATUS
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x400
	strlth r1, [r0, #0xe]
_02006874:
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mov r1, #4
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x2000
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006890:
	str r0, [r1, #0x10]
	mov r0, #1
	str r0, [r1, #0x14]
	orr r0, r3, #8
	strh r0, [r1, #0xe]
	mov r0, #2
	strh r0, [r1, #0xc]
	b _02006B2C
_020068B0:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006960
	ldr lr, [sp, #0x28]
	ldr r0, [r1, #0x28]
	ldr ip, [sp, #0x2c]
	ldr r3, [r1, #0x2c]
	mov r2, #1
	sub r0, lr, r0
	sub r3, ip, r3
	str r2, [r1, #0x10]
	mov r2, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r2, [r1, #0x14]
	bl abs
	cmp r0, #8
	bge _02006934
	ldr r0, [sp, #0xc]
	bl abs
	cmp r0, #8
	bge _02006934
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mov r1, #3
	ldr r3, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	str r3, [r0, #0x30]
	str r2, [r0, #0x34]
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x80
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006934:
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mov r1, #1
	str r3, [r0, #0x28]
	str r2, [r0, #0x2c]
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x40
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006960:
	mov r2, #0
	str r2, [r1, #0x10]
	ldr r0, [r1, #0x14]
	add r0, r0, #1
	str r0, [r1, #0x14]
	cmp r0, #0xc
	orrgt r0, r3, #0x10
	strgth r0, [r1, #0xe]
	strgth r2, [r1, #0xc]
	b _02006B2C
_02006988:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006A1C
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	orr r0, r3, #0x80
	strh r0, [r1, #0xe]
	cmp r2, #0xc
	ble _02006B2C
	ldr r3, [sp, #0x28]
	ldr r0, [r1, #0x30]
	ldr r2, [sp, #0x2c]
	ldr r1, [r1, #0x34]
	sub r0, r3, r0
	sub r1, r2, r1
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	bl abs
	cmp r0, #8
	bge _02006A00
	ldr r0, [sp, #0x14]
	bl abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =TOUCHSCREEN_STATUS
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x800
	strlth r1, [r0, #0xe]
_02006A00:
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mov r1, #5
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x4000
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006A1C:
	ldr lr, [r1, #0x20]
	ldr r0, [r1, #0x28]
	ldr ip, [r1, #0x24]
	ldr r3, [r1, #0x2c]
	mov r2, #0
	sub r0, lr, r0
	sub r3, ip, r3
	str r2, [r1, #0x10]
	mov r2, #1
	str r0, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r2, [r1, #0x14]
	bl abs
	cmp r0, #8
	bge _02006A74
	ldr r0, [sp, #0x1c]
	bl abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =TOUCHSCREEN_STATUS
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x20
	strlth r1, [r0, #0xe]
_02006A74:
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	mov r1, #0
	strh r1, [r0, #0xc]
	b _02006B2C
_02006A84:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006AE0
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	cmp ip, #4
	orreq r0, r3, #0x140
	orrne r0, r3, #0x280
	strh r0, [r1, #0xe]
	ldr r0, _02006B44 ; =TOUCHSCREEN_STATUS
	ldr r1, [r0, #0x10]
	cmp r1, #0x3c
	ldrgth r1, [r0, #0xe]
	orrgt r1, r1, #0x1000
	strgth r1, [r0, #0xe]
	bgt _02006B2C
	ldreqh r1, [r0, #0xe]
	orreq r1, r1, #0x9000
	streqh r1, [r0, #0xe]
	b _02006B2C
_02006AE0:
	mov r2, #0
	str r2, [r1, #0x10]
	mov r0, #1
	str r0, [r1, #0x14]
	strh r2, [r1, #0xc]
	b _02006B2C
_02006AF8:
	ldrh r0, [r1, #0xe]
	tst r0, #1
	moveq r2, #0
	streq r2, [r1, #0x10]
	moveq r0, #1
	streq r0, [r1, #0x14]
	streqh r2, [r1, #0xc]
	beq _02006B2C
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
_02006B2C:
	ldr r0, _02006B3C ; =_020AF288
	bl sub_02002E98
_02006B34:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02006B3C: .word _020AF288
_02006B40: .word _022A362C
_02006B44: .word TOUCHSCREEN_STATUS
_02006B48: .word _022A3614
_02006B4C: .word _022A3620
_02006B50: .word TOUCHSCREEN_STATUS
	arm_func_end sub_020065AC

	arm_func_start sub_02006B54
sub_02006B54: ; 0x02006B54
	mov r1, #6
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_02006B54

	arm_func_start sub_02006B70
sub_02006B70: ; 0x02006B70
	stmdb sp!, {r3, lr}
	ldr r0, _02006B90 ; =_020AF288
	bl sub_02002CB4
	ldr r0, _02006B94 ; =_022A35E8
	bl sub_02006B54
	ldr r0, _02006B90 ; =_020AF288
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006B90: .word _020AF288
_02006B94: .word _022A35E8
	arm_func_end sub_02006B70

	arm_func_start sub_02006B98
sub_02006B98: ; 0x02006B98
	stmdb sp!, {r3, lr}
	ldr r0, _02006BEC ; =_020AF288
	bl sub_02002CB4
	ldr r0, _02006BF0 ; =TOUCHSCREEN_STATUS
	ldrb r1, [r0, #8]
	cmp r1, #0
	beq _02006BD8
	mov r2, #4
	ldr r1, _02006BF4 ; =0x00001101
	strh r2, [r0, #0xc]
	strh r1, [r0, #0xe]
	mov r1, #0x3d
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0x14]
	b _02006BE0
_02006BD8:
	ldr r0, _02006BF8 ; =_022A35E8
	bl sub_02006B54
_02006BE0:
	ldr r0, _02006BEC ; =_020AF288
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006BEC: .word _020AF288
_02006BF0: .word TOUCHSCREEN_STATUS
_02006BF4: .word 0x00001101
_02006BF8: .word _022A35E8
	arm_func_end sub_02006B98

	arm_func_start sub_02006BFC
sub_02006BFC: ; 0x02006BFC
	mov r1, #0
	strh r1, [r0]
	sub r1, r1, #1
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02006BFC

	arm_func_start GetReleasedStylus
GetReleasedStylus: ; 0x02006C1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02006C84 ; =_020AF288
	bl sub_02002CB4
	ldr r1, _02006C88 ; =TOUCHSCREEN_STATUS
	ldr r0, _02006C84 ; =_020AF288
	ldrh r2, [r1, #0xe]
	strh r2, [r4]
	ldr r3, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	str r3, [r4, #4]
	str r2, [r4, #8]
	ldr r3, [r1, #0x20]
	ldr r2, [r1, #0x24]
	str r3, [r4, #0xc]
	str r2, [r4, #0x10]
	ldr r3, [r1, #0x28]
	ldr r2, [r1, #0x2c]
	str r3, [r4, #0x14]
	str r2, [r4, #0x18]
	ldr r2, [r1, #0x30]
	ldr r1, [r1, #0x34]
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02006C84: .word _020AF288
_02006C88: .word TOUCHSCREEN_STATUS
	arm_func_end GetReleasedStylus

	arm_func_start sub_02006C8C
sub_02006C8C: ; 0x02006C8C
	ldrh ip, [r0]
	ldr r3, _02006D44 ; =0x00001CFA
	and ip, r1, ip
	tst ip, r3
	beq _02006CE8
	cmp r2, #0
	moveq r0, #1
	bxeq lr
	ldr r3, [r0, #0x14]
	ldr r1, [r2, #8]
	cmp r3, r1
	blt _02006CE8
	ldr r1, [r2, #0xc]
	cmp r3, r1
	bgt _02006CE8
	ldr r3, [r0, #0x18]
	ldr r1, [r2]
	cmp r3, r1
	blt _02006CE8
	ldr r1, [r2, #4]
	cmp r3, r1
	movle r0, #1
	bxle lr
_02006CE8:
	ldr r1, _02006D48 ; =0x00000301
	tst ip, r1
	beq _02006D3C
	cmp r2, #0
	moveq r0, #1
	bxeq lr
	ldr r3, [r0, #0xc]
	ldr r1, [r2, #8]
	cmp r3, r1
	blt _02006D3C
	ldr r1, [r2, #0xc]
	cmp r3, r1
	bgt _02006D3C
	ldr r1, [r0, #0x10]
	ldr r0, [r2]
	cmp r1, r0
	blt _02006D3C
	ldr r0, [r2, #4]
	cmp r1, r0
	movle r0, #1
	bxle lr
_02006D3C:
	mov r0, #0
	bx lr
	.align 2, 0
_02006D44: .word 0x00001CFA
_02006D48: .word 0x00000301
	arm_func_end sub_02006C8C

	arm_func_start sub_02006D4C
sub_02006D4C: ; 0x02006D4C
	stmdb sp!, {r3, lr}
	ldr r0, _02006D9C ; =_022A3644
	mov r3, #0
	strb r3, [r0, #2]
	strb r3, [r0, #1]
	strb r3, [r0]
	str r3, [r0, #0x10]
	str r3, [r0, #0xc]
	mov r1, #1
	strb r1, [r0, #9]
	ldr r1, _02006DA0 ; =_022A3644
	mov r2, r3
_02006D7C:
	add r0, r1, r3
	add r3, r3, #1
	strb r2, [r0, #3]
	cmp r3, #6
	blt _02006D7C
	bl sub_02005E40
	bl sub_02006504
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006D9C: .word _022A3644
_02006DA0: .word _022A3644
	arm_func_end sub_02006D4C

	arm_func_start KeyWaitInit
KeyWaitInit: ; 0x02006DA4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	bl sub_02006B70
	ldmia sp!, {r3, pc}
	arm_func_end KeyWaitInit

	arm_func_start sub_02006DC8
sub_02006DC8: ; 0x02006DC8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	bl sub_02006B98
	ldmia sp!, {r3, pc}
	arm_func_end sub_02006DC8

	arm_func_start sub_02006DEC
sub_02006DEC: ; 0x02006DEC
	stmdb sp!, {r3, lr}
	bl sub_02006030
	bl sub_020065AC
	ldr r0, _02006E10 ; =_020AF2AC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006E10: .word _020AF2AC
	arm_func_end sub_02006DEC

	arm_func_start sub_02006E14
sub_02006E14: ; 0x02006E14
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	movs r3, #0
	mov r4, r3
	bne _02006E8C
	mov r2, #4
	ldr r1, _02006EBC ; =_022A3644
	b _02006E6C
_02006E40:
	add r0, r1, r2
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02006E68
	ldr r0, _02006EC0 ; =_022A3644
	mov r4, r2
	ldr r0, [r0, #0x10]
	cmp r0, r2
	movne r3, #1
	b _02006E74
_02006E68:
	add r2, r2, #1
_02006E6C:
	cmp r2, #5
	ble _02006E40
_02006E74:
	cmp r4, #0
	bne _02006E8C
	ldr r0, _02006EC0 ; =_022A3644
	ldr r0, [r0, #0x10]
	cmp r0, #0
	movne r3, #1
_02006E8C:
	cmp r3, #0
	beq _02006EAC
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020062C8
	mov r0, #0
	bl sub_020063A0
_02006EAC:
	ldr r0, _02006EC0 ; =_022A3644
	str r4, [r0, #0x10]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02006EBC: .word _022A3644
_02006EC0: .word _022A3644
	arm_func_end sub_02006E14

	arm_func_start sub_02006EC4
sub_02006EC4: ; 0x02006EC4
	ldr r1, _02006ED0 ; =_020AF2AC
	str r0, [r1]
	bx lr
	.align 2, 0
_02006ED0: .word _020AF2AC
	arm_func_end sub_02006EC4

	arm_func_start sub_02006ED4
sub_02006ED4: ; 0x02006ED4
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	stmib r0, {r1, r2}
	strb r2, [r0, #0xc]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
	bx lr
	arm_func_end sub_02006ED4

	arm_func_start DebugPrintSystemClock
DebugPrintSystemClock: ; 0x02006EF8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	bl sub_0208266C
	add r0, sp, #0x20
	bl GetSystemClock
	add r0, sp, #0x20
	add r1, sp, #0
	ldr r4, _02006F34 ; =_0209277C
	bl SprintfSystemClock
	ldr r0, _02006F38 ; =_0209278C
	add r2, sp, #0
	mov r1, r4
	bl Debug_Print0
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02006F34: .word _0209277C
_02006F38: .word _0209278C
	arm_func_end DebugPrintSystemClock

	arm_func_start sub_02006F3C
sub_02006F3C: ; 0x02006F3C
	str r1, [r0, #0x18]
	str r2, [r0, #0x14]
	ldr r1, [sp]
	str r3, [r0, #0x10]
	str r1, [r0, #0xc]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	stmib r0, {r1, r2}
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_02006F3C

	arm_func_start GetSystemClock
GetSystemClock: ; 0x02006F68
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	mov r4, r0
	add r0, sp, #0x18
	add r1, sp, #0xc
	bl sub_020828A8
	ldr r1, [sp, #0xc]
	mov r0, r4
	str r1, [sp]
	ldr r1, [sp, #0x10]
	str r1, [sp, #4]
	ldr r1, [sp, #0x14]
	str r1, [sp, #8]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r1, r1, #0x7d0
	bl sub_02006F3C
	add sp, sp, #0x28
	ldmia sp!, {r4, pc}
	arm_func_end GetSystemClock

	arm_func_start SprintfSystemClock
SprintfSystemClock: ; 0x02006FB8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	ldr r2, [r3, #0x10]
	mov r0, r1
	str r2, [sp]
	ldr r2, [r3, #0xc]
	ldr r1, _02007000 ; =_02092798
	str r2, [sp, #4]
	ldr r2, [r3, #8]
	str r2, [sp, #8]
	ldr r2, [r3, #4]
	str r2, [sp, #0xc]
	ldr r2, [r3, #0x18]
	ldr r3, [r3, #0x14]
	bl sprintf
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02007000: .word _02092798
	arm_func_end SprintfSystemClock

	arm_func_start sub_02007004
sub_02007004: ; 0x02007004
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	beq _02007060
	mov r1, #0x3a
	bl sub_02002368
	movs r4, r0
	beq _02007044
	sub r5, r4, r6
	ldr r0, _02007074 ; =_020AF2B8
	mov r1, r6
	mov r2, r5
	bl strncpy
	ldr r0, _02007074 ; =_020AF2B8
	mov r1, #0
	strb r1, [r0, r5]
	add r6, r4, #1
_02007044:
	ldrsb r0, [r6]
	cmp r0, #0
	beq _02007060
	ldr r0, _02007078 ; =_020AF2C4
	ldr r1, _0200707C ; =_020927B8
	mov r2, r6
	bl sprintf
_02007060:
	ldr r0, _02007080 ; =_020927BC
	ldr r1, _02007074 ; =_020AF2B8
	ldr r2, _02007078 ; =_020AF2C4
	bl Debug_Print0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02007074: .word _020AF2B8
_02007078: .word _020AF2C4
_0200707C: .word _020927B8
_02007080: .word _020927BC
	arm_func_end sub_02007004

	arm_func_start sub_02007084
sub_02007084: ; 0x02007084
	ldr r0, _0200708C ; =_020AF2B8
	bx lr
	.align 2, 0
_0200708C: .word _020AF2B8
	arm_func_end sub_02007084

	arm_func_start sub_02007090
sub_02007090: ; 0x02007090
	ldr r0, _02007098 ; =_020AF2C4
	bx lr
	.align 2, 0
_02007098: .word _020AF2C4
	arm_func_end sub_02007090

	arm_func_start sub_0200709C
sub_0200709C: ; 0x0200709C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r2
	mov r8, r0
	mov r7, r1
	mov r0, r6
	mov r1, #0x3a
	bl sub_02002368
	cmp r0, #0
	addne r4, r0, #1
	subne r5, r0, r6
	bne _020070D8
	mov r0, r6
	bl strlen
	mov r5, r0
	add r4, r6, r5
_020070D8:
	sub r0, r5, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0x30
	blt _020070FC
	cmp r0, #0x39
	suble r0, r0, #0x30
	strle r0, [r7]
	suble r5, r5, #1
	ble _02007104
_020070FC:
	mov r0, #0
	str r0, [r7]
_02007104:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl strncpy
	mov r1, #0
	mov r0, r4
	strb r1, [r8, r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200709C

	arm_func_start sub_02007124
sub_02007124: ; 0x02007124
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x100
	mov r4, r1
	mov sl, r0
	mov r0, r4
	mov r1, #0x3a
	bl sub_02002368
	cmp r0, #0
	add r0, sp, #0x80
	bne _02007160
	ldr r1, _0200724C ; =_020927E4
	ldr r2, _02007250 ; =_020AF2B8
	mov r3, r4
	bl sprintf
	b _02007168
_02007160:
	mov r1, r4
	bl strcpy
_02007168:
	add r0, sp, #0x80
	mov r1, #0x3a
	bl sub_02002368
	add r0, sp, #0x80
	bl sub_02007544
	add r2, sp, #0x80
	add r0, sl, #0xc
	add r1, sl, #4
	bl sub_0200709C
	mov r8, r0
	add r0, sl, #0xc
	bl sub_0200746C
	ldr r0, [r0]
	mov r1, r8
	str r0, [sl]
	add r0, sl, #0x6c
	bl strcpy
	mov sb, #0
	strb sb, [sl, #0x5c]
	add r4, sl, #0x1c
	mov r6, sb
	add r7, sp, #0
	mov r5, #0xa
_020071C4:
	mov r1, r7
_020071C8:
	ldrsb r0, [r8]
	cmp r0, #0
	cmpne r0, #0x2f
	cmpne r0, #0x2e
	addne r8, r8, #1
	strneb r0, [r1], #1
	bne _020071C8
	strb r6, [r1]
	ldrsb r0, [r8]
	cmp r0, #0
	bne _02007204
	add r1, sp, #0
	add r0, sl, #0x5c
	bl strcat
	b _02007240
_02007204:
	cmp r0, #0x2e
	bne _02007220
	mov r1, r7
	mov r2, r5
	add r0, sl, #0x5c
	bl sub_020023A8
	b _02007238
_02007220:
	cmp r0, #0x2f
	bne _02007238
	add r0, r4, sb, lsl #4
	mov r1, r7
	add sb, sb, #1
	bl strcpy
_02007238:
	add r8, r8, #1
	b _020071C4
_02007240:
	str sb, [sl, #8]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0200724C: .word _020927E4
_02007250: .word _020AF2B8
	arm_func_end sub_02007124

	arm_func_start sub_02007254
sub_02007254: ; 0x02007254
	add r3, r0, #0x5c
	mov ip, #0
	b _02007278
_02007260:
	ldrsb r2, [r3]
	cmp r2, #0x20
	beq _02007280
	add r3, r3, #1
	strb r2, [r1], #1
	add ip, ip, #1
_02007278:
	cmp ip, #0xa
	blt _02007260
_02007280:
	ldrsb r2, [r0, #0x66]
	add r3, r0, #0x66
	cmp r2, #0
	beq _020072C0
	mov r0, #0x2e
	strb r0, [r1], #1
	mov r2, #0
	b _020072B8
_020072A0:
	ldrsb r0, [r3]
	cmp r0, #0x20
	beq _020072C0
	add r3, r3, #1
	strb r0, [r1], #1
	add r2, r2, #1
_020072B8:
	cmp r2, #5
	blt _020072A0
_020072C0:
	mov r0, #0
	strb r0, [r1]
	bx lr
	arm_func_end sub_02007254

	arm_func_start sub_020072CC
sub_020072CC: ; 0x020072CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #8]
	mov r7, r1
	cmp r0, #0
	ble _0200732C
	mov r0, r7
	add r1, r8, #0x1c
	bl strcpy
	mov r6, #1
	add r4, r8, #0x1c
	ldr r5, _02007338 ; =_020927EC
	b _0200731C
_02007300:
	mov r0, r7
	mov r1, r5
	bl strcat
	mov r0, r7
	add r1, r4, r6, lsl #4
	bl strcat
	add r6, r6, #1
_0200731C:
	ldr r0, [r8, #8]
	cmp r6, r0
	blt _02007300
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200732C:
	mov r0, #0
	strb r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007338: .word _020927EC
	arm_func_end sub_020072CC

	arm_func_start sub_0200733C
sub_0200733C: ; 0x0200733C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl sub_020072CC
	mov r0, r4
	bl strlen
	mov r1, r0
	cmp r0, #0
	movgt r1, #0x2f
	strgtb r1, [r4, r0]
	addgt r1, r0, #1
	movgt r0, #0
	strgtb r0, [r4, r1]
	mov r0, r5
	add r1, r4, r1
	bl sub_02007254
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200733C

	arm_func_start sub_02007380
sub_02007380: ; 0x02007380
	bx lr
	arm_func_end sub_02007380

	arm_func_start sub_02007384
sub_02007384: ; 0x02007384
	stmdb sp!, {r3, lr}
	ldr r1, _020073A8 ; =_020AF344
	mov r2, #0
	ldr r0, _020073AC ; =_022A3670
	str r2, [r1]
	bl sub_0200844C
	ldr r0, _020073B0 ; =_022A3658
	bl sub_0200846C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020073A8: .word _020AF344
_020073AC: .word _022A3670
_020073B0: .word _022A3658
	arm_func_end sub_02007384

	arm_func_start sub_020073B4
sub_020073B4: ; 0x020073B4
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	str r1, [r0, #0x14]
	sub r1, r1, #1
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_020073B4

	arm_func_start sub_020073D8
sub_020073D8: ; 0x020073D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r6, _02007464 ; =_020AF354
	bl sub_02007084
	mov r1, r0
	add r0, sp, #0
	bl sub_020074DC
	mov r7, r0
	mov r5, #0xa
	ldr r4, _02007468 ; =_02092844
	mov r8, #0
	b _02007450
_02007408:
	ldr r2, [r0, #4]
	mov r0, r5
	mov r1, r4
	bl Debug_Print
	ldr r2, [r6]
	ldr r0, [r7]
	ldr r1, [r2]
	cmp r1, r0
	bne _02007440
	bl sub_02007090
	ldr r1, [r6]
	ldr r1, [r1, #0xc]
	blx r1
	b _0200744C
_02007440:
	ldr r1, [r2, #0xc]
	mov r0, r8
	blx r1
_0200744C:
	add r6, r6, #4
_02007450:
	ldr r0, [r6]
	cmp r0, #0
	bne _02007408
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007464: .word _020AF354
_02007468: .word _02092844
	arm_func_end sub_020073D8

	arm_func_start sub_0200746C
sub_0200746C: ; 0x0200746C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, _020074B0 ; =_020AF354
	b _02007498
_0200747C:
	ldr r1, [r5, #8]
	mov r0, r6
	bl strcmp
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, pc}
	add r4, r4, #4
_02007498:
	ldr r5, [r4]
	cmp r5, #0
	bne _0200747C
	ldr r0, _020074B4 ; =_020AF354
	ldr r0, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020074B0: .word _020AF354
_020074B4: .word _020AF354
	arm_func_end sub_0200746C

	arm_func_start sub_020074B8
sub_020074B8: ; 0x020074B8
	cmp r0, #0
	ldreq r0, _020074D4 ; =_020AF354
	ldreq r0, [r0]
	ldrne r1, [r0]
	ldrne r0, _020074D8 ; =_020AF354
	ldrne r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_020074D4: .word _020AF354
_020074D8: .word _020AF354
	arm_func_end sub_020074B8

	arm_func_start sub_020074DC
sub_020074DC: ; 0x020074DC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_0200709C
	ldr r5, _0200753C ; =_020AF354
	add r4, sp, #0
	b _02007520
_02007504:
	ldr r1, [r6, #8]
	mov r0, r4
	bl strcmp
	cmp r0, #0
	moveq r0, r6
	beq _02007534
	add r5, r5, #4
_02007520:
	ldr r6, [r5]
	cmp r6, #0
	bne _02007504
	ldr r0, _02007540 ; =_020AF354
	ldr r0, [r0]
_02007534:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200753C: .word _020AF354
_02007540: .word _020AF354
	arm_func_end sub_020074DC

	arm_func_start sub_02007544
sub_02007544: ; 0x02007544
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02007570
	mov r0, r4
	blx r1
_02007570:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_02007544

	arm_func_start sub_02007578
sub_02007578: ; 0x02007578
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x90
	mov r4, r0
	add r0, sp, #4
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r2, [r0, #0x14]
	add r0, sp, #4
	mov r1, r4
	blx r2
	add sp, sp, #0x90
	ldmia sp!, {r4, pc}
	arm_func_end sub_02007578

	arm_func_start sub_020075B0
sub_020075B0: ; 0x020075B0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x90
	mov r4, r0
	add r0, sp, #4
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r2, [r0, #0x3c]
	add r0, sp, #4
	mov r1, r4
	blx r2
	add sp, sp, #0x90
	ldmia sp!, {r4, pc}
	arm_func_end sub_020075B0

	arm_func_start sub_020075E8
sub_020075E8: ; 0x020075E8
	ldr ip, _020075F0 ; =sub_02006ED4
	bx ip
	.align 2, 0
_020075F0: .word sub_02006ED4
	arm_func_end sub_020075E8

	arm_func_start sub_020075F4
sub_020075F4: ; 0x020075F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	mov r0, #2
	str r0, [r5]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020075F4

	arm_func_start sub_02007624
sub_02007624: ; 0x02007624
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov r0, #0
	mov ip, r1
	str r0, [lr]
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	bl FileRom_StopDataTransfer
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02007624

	arm_func_start sub_02007654
sub_02007654: ; 0x02007654
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r6, r2
	mov r5, r0
	mov r4, r1
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r6
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x18]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02007654

	arm_func_start sub_020076E4
sub_020076E4: ; 0x020076E4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r6, r2
	mov r5, r0
	mov r4, r1
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r6
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x1c]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020076E4

	arm_func_start sub_02007774
sub_02007774: ; 0x02007774
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	ldr r1, [r0, #0x20]
	mov r0, r5
	blx r1
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	str r0, [r5]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02007774

	arm_func_start sub_020077B8
sub_020077B8: ; 0x020077B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	mov r1, #0
	str r1, [r5, #0x14]
	mov r1, #1
	mov lr, r5
	mov ip, r4
	str r1, [r5, #0x18]
	mov r6, r0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r1, [r6, #0x24]
	mov r0, r5
	blx r1
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020077B8

	arm_func_start sub_0200781C
sub_0200781C: ; 0x0200781C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	mov r1, #0
	mov lr, r5
	mov ip, r4
	str r1, [r5, #0x18]
	mov r6, r0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r1, [r6, #0x28]
	mov r0, r5
	blx r1
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200781C

	arm_func_start sub_02007878
sub_02007878: ; 0x02007878
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	bl sub_020074B8
	add r1, r7, #3
	bic r1, r1, #3
	mov r4, r0
	cmp r7, r1
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r5, #0
	mov fp, #0x40000
	b _0200792C
_020078B4:
	ldrb r0, [sb, #0xc]
	cmp r0, #0
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r6, #0x40000
	movlt sl, r6
	movge sl, fp
	bl sub_0207A270
	ldr r3, [r4, #0x2c]
	mov r0, sb
	mov r1, r7
	mov r2, sl
	blx r3
	movs sl, r0
	mvnmi r0, #0
	ldmmiia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sb, #0x14]
	mov lr, sb
	add r0, r0, sl
	str r0, [sb, #0x14]
	mov ip, r8
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	cmp sl, #0x40000
	add r5, r5, sl
	sub r6, r6, sl
	add r7, r7, sl
	blt _02007934
_0200792C:
	cmp r6, #0
	bgt _020078B4
_02007934:
	ldrb r0, [sb, #0xc]
	cmp r0, #0
	mvnne r0, #0
	moveq r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02007878

	arm_func_start sub_02007948
sub_02007948: ; 0x02007948
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov lr, r7
	mov ip, r6
	str r0, [r7, #0x14]
	mov r5, r2
	mov r4, r3
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr sb, [sp, #0x20]
	ldr r8, [sp, #0x24]
	b _020079C8
_02007988:
	cmp r4, r8
	movlt r3, r4
	movge r3, r8
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_02007878
	cmp r0, #0
	mvnlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp sb, #0
	add r5, r5, r0
	sub r4, r4, r0
	beq _020079C8
	mov r0, sb
	bl sub_02002B50
_020079C8:
	cmp r4, #0
	bgt _02007988
	ldr r0, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02007948

	arm_func_start sub_020079D8
sub_020079D8: ; 0x020079D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r3, _02007A6C ; =_020927FC
	mov r6, r2
	ldr r4, [r3, #0x2c]
	ldr ip, [r3, #0x28]
	ldr r2, [sp, #0x20]
	add r3, sp, #0
	mov r8, r0
	mov r7, r1
	str ip, [sp]
	str r4, [sp, #4]
	bl sub_020076E4
	cmp r0, #0
	beq _02007A60
	ldr r5, [r8, #0x10]
	mov r0, r8
	mov r1, r7
	bl sub_020077B8
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl sub_02007878
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl sub_0200781C
	mov r0, r8
	mov r1, r7
	bl sub_02007774
	cmp r5, r4
	moveq r0, r4
	beq _02007A64
_02007A60:
	mvn r0, #0
_02007A64:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007A6C: .word _020927FC
	arm_func_end sub_020079D8

	arm_func_start sub_02007A70
sub_02007A70: ; 0x02007A70
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r6, _02007B10 ; =_020927FC
	mov r5, r2
	ldr ip, [r6, #0x24]
	ldr lr, [r6, #0x20]
	mov r4, r3
	ldr r2, [sp, #0x20]
	add r3, sp, #0
	mov r7, r0
	mov r6, r1
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_020076E4
	cmp r0, #0
	beq _02007B04
	ldr r8, [r7, #0x10]
	mov r0, r7
	cmp r4, r8
	movle r8, r4
	mov r1, r6
	bl sub_020077B8
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r8
	bl sub_02007878
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_0200781C
	mov r0, r7
	mov r1, r6
	bl sub_02007774
	cmp r8, r4
	moveq r0, r4
	beq _02007B08
_02007B04:
	mvn r0, #0
_02007B08:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007B10: .word _020927FC
	arm_func_end sub_02007A70

	arm_func_start sub_02007B14
sub_02007B14: ; 0x02007B14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r3, _02007BC8 ; =_020927FC
	mov r4, r2
	ldr ip, [r3, #0x1c]
	ldr lr, [r3, #0x18]
	ldr r2, [sp, #0x28]
	add r3, sp, #8
	mov r6, r0
	mov r5, r1
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	bl sub_020076E4
	cmp r0, #0
	beq _02007BBC
	ldr r0, [sp, #0x2c]
	ldr r7, [r6, #0x10]
	cmp r0, #0
	beq _02007B64
	bl sub_02002B50
_02007B64:
	mov r0, r6
	mov r1, r5
	bl sub_020077B8
	ldr r0, [sp, #0x2c]
	ldr ip, [sp, #0x30]
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, r7
	str ip, [sp, #4]
	bl sub_02007948
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_0200781C
	mov r0, r6
	mov r1, r5
	bl sub_02007774
	cmp r7, r4
	moveq r0, r4
	beq _02007BC0
_02007BBC:
	mvn r0, #0
_02007BC0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02007BC8: .word _020927FC
	arm_func_end sub_02007B14

	arm_func_start sub_02007BCC
sub_02007BCC: ; 0x02007BCC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r4, _02007C9C ; =_020927FC
	mov r5, r2
	ldr r8, [r4, #0x34]
	ldr r4, [r4, #0x30]
	add r6, sp, #0
	mov r2, r3
	mov r3, r6
	str r4, [sp]
	mov r7, r0
	mov r6, r1
	str r8, [sp, #4]
	mov r4, #0
	bl sub_020076E4
	cmp r0, #0
	beq _02007C90
	ldr sl, [r7, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r1, sl
	str sl, [r5, #4]
	bl MemLocateSet
	mov sb, r0
	mov r0, r7
	mov r1, r6
	str sb, [r5]
	bl sub_020077B8
	ldr r2, [r5]
	mov r0, r7
	mov r1, r6
	mov r3, sl
	bl sub_02007878
	mov r8, r0
	mov r0, r7
	mov r1, r6
	bl sub_0200781C
	mov r0, r7
	mov r1, r6
	bl sub_02007774
	cmp sl, r8
	moveq r4, #1
	beq _02007C90
	mov r0, sb
	bl MemFree
	mov r0, r4
	str r0, [r5]
	sub r0, r0, #1
	str r0, [r5, #4]
_02007C90:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02007C9C: .word _020927FC
	arm_func_end sub_02007BCC

	arm_func_start sub_02007CA0
sub_02007CA0: ; 0x02007CA0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	ldr r4, _02007D90 ; =_020927FC
	mov r7, r2
	ldr r6, [r4, #4]
	ldr r4, [r4]
	add r5, sp, #8
	mov r2, r3
	str r4, [sp, #8]
	mov r3, r5
	mov sb, r0
	mov r8, r1
	str r6, [sp, #0xc]
	mov r4, #0
	bl sub_020076E4
	cmp r0, #0
	beq _02007D84
	ldr r5, [sb, #0x10]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	mov r1, r5
	str r5, [r7, #4]
	bl MemLocateSet
	mov r6, r0
	ldr r0, [sp, #0x38]
	str r6, [r7]
	cmp r0, #0
	beq _02007D14
	bl sub_02002B50
_02007D14:
	mov r0, sb
	mov r1, r8
	bl sub_020077B8
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [r7]
	mov r0, sb
	mov r1, r8
	mov r3, r5
	bl sub_02007948
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl sub_0200781C
	mov r0, sb
	mov r1, r8
	bl sub_02007774
	cmp r5, sl
	moveq r4, #1
	beq _02007D84
	mov r0, r6
	bl MemFree
	mov r0, #0
	str r0, [r7]
	sub r0, r0, #1
	str r0, [r7, #4]
_02007D84:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02007D90: .word _020927FC
	arm_func_end sub_02007CA0

	arm_func_start sub_02007D94
sub_02007D94: ; 0x02007D94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xec
	mov r7, r0
	mov r6, r1
	add r0, sp, #0
	mov r1, r2
	mov r5, r3
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r4, r0
	ldr r1, [r4]
	mov r0, #0
	str r1, [r7]
	ldr r1, [sp, #4]
	mov lr, r7
	str r1, [r7, #4]
	str r0, [r7, #8]
	mov ip, r6
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	bl sub_0207A270
	ldr r4, [r4, #0x34]
	ldr r3, [sp, #0x100]
	mov r2, r5
	mov r0, r7
	add r1, sp, #0
	blx r4
	mov r4, r0
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r7, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	mov r0, r4
	add sp, sp, #0xec
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_02007D94

	arm_func_start sub_02007E2C
sub_02007E2C: ; 0x02007E2C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r5, r0
	mov r4, r1
	add r0, sp, #0
	mov r1, r2
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x38]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02007E2C

	arm_func_start sub_02007EB4
sub_02007EB4: ; 0x02007EB4
	bx lr
	arm_func_end sub_02007EB4

	arm_func_start sub_02007EB8
sub_02007EB8: ; 0x02007EB8
	mov r0, #1
	bx lr
	arm_func_end sub_02007EB8

	arm_func_start sub_02007EC0
sub_02007EC0: ; 0x02007EC0
	stmdb sp!, {r3, lr}
	ldr r0, _02007ED8 ; =_020AF368
	bl sub_02002C40
	ldr r0, _02007ED8 ; =_020AF368
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02007ED8: .word _020AF368
	arm_func_end sub_02007EC0

	arm_func_start sub_02007EDC
sub_02007EDC: ; 0x02007EDC
	stmdb sp!, {r4, lr}
	ldr r0, _02007F08 ; =_020AF368
	bl sub_02002CB4
	bl sub_020845E8
	and r4, r0, #0xff
	ldr r0, _02007F08 ; =_020AF368
	bl sub_02002E98
	cmp r4, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02007F08: .word _020AF368
	arm_func_end sub_02007EDC

	arm_func_start sub_02007F0C
sub_02007F0C: ; 0x02007F0C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, _02007FC8 ; =_020AF368
	mov r4, r1
	bl sub_02002CB4
	add r0, r5, #0x40
	bl FileInit
	add r1, sp, #0
	mov r0, r4
	bl sub_0200733C
	add r1, sp, #0
	add r0, r5, #0x40
	bl sub_0207F6C4
	cmp r0, #0
	bne _02007F64
	mov r0, #1
	bl CardPullOutWithStatus
	ldr r0, _02007FC8 ; =_020AF368
	bl sub_02002E98
	mov r0, #0
	b _02007FC0
_02007F64:
	add r0, r5, #0x1c
	bl sub_020073B4
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r2, [r5, #0x68]
	ldr r1, [r5, #0x64]
	add r0, r5, #0x20
	sub r1, r2, r1
	str r1, [r5, #0x30]
	ldr r3, [r5, #0x6c]
	ldr r2, [r5, #0x64]
	add r1, r4, #0x5c
	sub r2, r3, r2
	str r2, [r5, #0x34]
	bl strcpy
	mov r2, #0
	str r2, [r5, #0x88]
	ldr r1, [r5, #0x30]
	ldr r0, _02007FC8 ; =_020AF368
	str r1, [r5, #0x10]
	str r2, [r5, #0x14]
	bl sub_02002E98
	mov r0, #1
_02007FC0:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02007FC8: .word _020AF368
	arm_func_end sub_02007F0C

	arm_func_start sub_02007FCC
sub_02007FCC: ; 0x02007FCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, _0200807C ; =_020AF368
	mov r4, r1
	bl sub_02002CB4
	add r0, r5, #0x40
	bl FileInit
	add r1, sp, #0
	mov r0, r4
	bl sub_0200733C
	mov r6, #1
	add r7, sp, #0
_02008000:
	mov r1, r7
	add r0, r5, #0x40
	bl sub_0207F6C4
	cmp r0, #0
	bne _02008020
	mov r0, r6
	bl CardPullOutWithStatus
	b _02008000
_02008020:
	add r0, r5, #0x1c
	bl sub_020073B4
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r2, [r5, #0x68]
	ldr r1, [r5, #0x64]
	add r0, r5, #0x20
	sub r1, r2, r1
	str r1, [r5, #0x30]
	ldr r3, [r5, #0x6c]
	ldr r2, [r5, #0x64]
	add r1, r4, #0x5c
	sub r2, r3, r2
	str r2, [r5, #0x34]
	bl strcpy
	mov r2, #0
	str r2, [r5, #0x88]
	ldr r1, [r5, #0x30]
	mov r0, #1
	str r1, [r5, #0x10]
	str r2, [r5, #0x14]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200807C: .word _020AF368
	arm_func_end sub_02007FCC

	arm_func_start sub_02008080
sub_02008080: ; 0x02008080
	stmdb sp!, {r3, lr}
	add r0, r0, #0x40
	bl sub_0207F70C
	cmp r0, #0
	bne _0200809C
	mov r0, #1
	bl CardPullOutWithStatus
_0200809C:
	ldr r0, _020080AC ; =_020AF368
	bl sub_02002E98
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020080AC: .word _020AF368
	arm_func_end sub_02008080

	arm_func_start sub_020080B0
sub_020080B0: ; 0x020080B0
	mov r0, #1
	bx lr
	arm_func_end sub_020080B0

	arm_func_start sub_020080B8
sub_020080B8: ; 0x020080B8
	mov r0, #1
	bx lr
	arm_func_end sub_020080B8

	arm_func_start sub_020080C0
sub_020080C0: ; 0x020080C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldr r3, [r4, #0x30]
	ldr r0, [r4, #0x88]
	mov r7, r2
	sub r0, r3, r0, lsl #11
	cmp r7, r0
	mov r8, r1
	movgt r7, r0
	mov r6, #0
	mov r5, #1
	b _02008114
_020080F0:
	add r0, r4, #0x40
	add r1, r8, r6
	sub r2, r7, r6
	bl sub_0207F818
	cmp r0, #0
	addge r6, r6, r0
	bge _02008114
	mov r0, r5
	bl CardPullOutWithStatus
_02008114:
	cmp r7, r6
	bgt _020080F0
	mov r0, r6, asr #0xa
	ldr r1, [r4, #0x88]
	add r0, r6, r0, lsr #21
	add r1, r1, r0, asr #11
	mov r0, r6
	str r1, [r4, #0x88]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020080C0

	arm_func_start sub_02008138
sub_02008138: ; 0x02008138
	stmdb sp!, {r3, lr}
	str r1, [r0, #0x88]
	add r0, r0, #0x40
	mov r1, r1, lsl #0xb
	mov r2, #0
	bl sub_0207F828
	cmp r0, #0
	bne _02008160
	mov r0, #1
	bl CardPullOutWithStatus
_02008160:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008138

; https://decomp.me/scratch/w0Zq6
	arm_func_start FileRom_InitDataTransfer
FileRom_InitDataTransfer: ; 0x02008168
	stmdb sp!, {r3, lr}
	ldr r0, _0200818C ; =_020AF368
	bl sub_02002CB4
	bl sub_02002580
	mov r1, #0x13
	bl sub_020027F8
	ldr r1, _02008190 ; =_020AF360
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200818C: .word _020AF368
_02008190: .word _020AF360
	arm_func_end FileRom_InitDataTransfer

	arm_func_start FileRom_StopDataTransfer
FileRom_StopDataTransfer: ; 0x02008194
	stmdb sp!, {r4, lr}
	ldr r1, _020081C0 ; =_020AF360
	ldr r0, _020081C4 ; =_020AF368
	ldr r4, [r1, #4]
	mov r2, #0
	str r2, [r1, #4]
	bl sub_02002E98
	bl sub_02002580
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020081C0: .word _020AF360
_020081C4: .word _020AF368
	arm_func_end FileRom_StopDataTransfer

	arm_func_start sub_020081C8
sub_020081C8: ; 0x020081C8
	ldr ip, _020081D4 ; =sub_02002CB4
	ldr r0, _020081D8 ; =_020AF368
	bx ip
	.align 2, 0
_020081D4: .word sub_02002CB4
_020081D8: .word _020AF368
	arm_func_end sub_020081C8

	arm_func_start sub_020081DC
sub_020081DC: ; 0x020081DC
	ldr ip, _020081E8 ; =sub_02002E98
	ldr r0, _020081EC ; =_020AF368
	bx ip
	.align 2, 0
_020081E8: .word sub_02002E98
_020081EC: .word _020AF368
	arm_func_end sub_020081DC

	arm_func_start sub_020081F0
sub_020081F0: ; 0x020081F0
	ldr ip, _020081FC ; =sub_02002E10
	ldr r0, _02008200 ; =_020AF368
	bx ip
	.align 2, 0
_020081FC: .word sub_02002E10
_02008200: .word _020AF368
	arm_func_end sub_020081F0

	arm_func_start FileRom_Veneer_FileInit
FileRom_Veneer_FileInit: ; 0x02008204
	ldr ip, _0200820C ; =FileInit
	bx ip
	.align 2, 0
_0200820C: .word FileInit
	arm_func_end FileRom_Veneer_FileInit
