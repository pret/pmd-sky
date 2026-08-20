	.include "asm/macros.inc"
	.include "main_020040AC.inc"

	.text

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
	bl IC_InvalidateAll
	bl DC_FlushAll
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
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004294:
	ldr r2, _020047DC ; =0x0000000A
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042B8:
	ldr r2, _020047E0 ; =0x00000023
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042DC:
	ldr r2, _020047E4 ; =0x00000001
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004300:
	ldr r2, _020047E8 ; =0x00000002
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004324:
	ldr r2, _020047EC ; =0x00000003
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004348:
	ldr r2, _020047F0 ; =0x00000006
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200436C:
	ldr r2, _020047F4 ; =0x00000004
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004390:
	ldr r2, _020047F8 ; =0x00000005
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043B4:
	ldr r2, _020047FC ; =0x00000007
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043D8:
	ldr r2, _02004800 ; =0x00000008
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043FC:
	ldr r2, _02004804 ; =0x00000009
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004420:
	ldr r2, _02004808 ; =0x0000000B
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004444:
	ldr r2, _0200480C ; =0x0000001D
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004468:
	ldr r2, _02004810 ; =0x00000022
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200448C:
	ldr r2, _02004814 ; =0x0000000C
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044B0:
	ldr r2, _02004818 ; =0x0000000D
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044D4:
	ldr r2, _0200481C ; =0x0000000E
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044F8:
	ldr r2, _02004820 ; =0x0000000F
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200451C:
	ldr r2, _02004824 ; =0x00000010
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004540:
	ldr r2, _02004828 ; =0x00000011
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004564:
	ldr r2, _0200482C ; =0x00000012
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004588:
	ldr r2, _02004830 ; =0x00000013
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045AC:
	ldr r2, _02004834 ; =0x00000014
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045D0:
	ldr r2, _02004838 ; =0x00000015
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045F4:
	ldr r2, _0200483C ; =0x00000016
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004618:
	ldr r2, _02004840 ; =0x00000017
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200463C:
	ldr r2, _02004844 ; =0x00000018
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004660:
	ldr r2, _02004848 ; =0x00000019
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004684:
	ldr r2, _0200484C ; =0x0000001A
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046A8:
	ldr r2, _02004850 ; =0x0000001B
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046CC:
	ldr r2, _02004854 ; =0x0000001C
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046F0:
	ldr r2, _02004858 ; =0x0000001E
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004714:
	ldr r2, _0200485C ; =0x0000001F
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004738:
	ldr r2, _02004860 ; =0x00000020
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200475C:
	ldr r2, _02004864 ; =0x00000021
	add r0, sp, #0x10
	mov r1, #0
	bl FS_LoadOverlayInfo
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
	bl FS_LoadOverlayImage
	cmp r0, #0
	bne _020047B8
	mov r0, #1
	bl CardPullOutWithStatus
_020047B8:
	add r0, sp, #0x10
	bl FS_StartOverlay
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
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A4C:
	ldr r1, _02004EE8 ; =0x0000000A
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A6C:
	ldr r1, _02004EEC ; =0x00000023
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A8C:
	ldr r1, _02004EF0 ; =0x00000001
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AAC:
	ldr r1, _02004EF4 ; =0x00000002
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004ACC:
	ldr r1, _02004EF8 ; =0x00000003
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AEC:
	ldr r1, _02004EFC ; =0x00000006
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B0C:
	ldr r1, _02004F00 ; =0x00000004
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B2C:
	ldr r1, _02004F04 ; =0x00000005
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B4C:
	ldr r1, _02004F08 ; =0x00000007
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B6C:
	ldr r1, _02004F0C ; =0x00000008
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B8C:
	ldr r1, _02004F10 ; =0x00000009
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BAC:
	ldr r1, _02004F14 ; =0x0000000B
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BCC:
	ldr r1, _02004F18 ; =0x0000001D
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BEC:
	ldr r1, _02004F1C ; =0x00000022
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C0C:
	ldr r1, _02004F20 ; =0x0000000C
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C2C:
	ldr r1, _02004F24 ; =0x0000000D
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C4C:
	ldr r1, _02004F28 ; =0x0000000E
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C6C:
	ldr r1, _02004F2C ; =0x0000000F
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C8C:
	ldr r1, _02004F30 ; =0x00000010
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CAC:
	ldr r1, _02004F34 ; =0x00000011
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CCC:
	ldr r1, _02004F38 ; =0x00000012
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CEC:
	ldr r1, _02004F3C ; =0x00000013
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D0C:
	ldr r1, _02004F40 ; =0x00000014
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D2C:
	ldr r1, _02004F44 ; =0x00000015
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D4C:
	ldr r1, _02004F48 ; =0x00000016
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D6C:
	ldr r1, _02004F4C ; =0x00000017
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D8C:
	ldr r1, _02004F50 ; =0x00000018
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DAC:
	ldr r1, _02004F54 ; =0x00000019
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DCC:
	ldr r1, _02004F58 ; =0x0000001A
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DEC:
	ldr r1, _02004F5C ; =0x0000001B
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E0C:
	ldr r1, _02004F60 ; =0x0000001C
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E2C:
	ldr r1, _02004F64 ; =0x0000001E
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E4C:
	ldr r1, _02004F68 ; =0x0000001F
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E6C:
	ldr r1, _02004F6C ; =0x00000020
	mov r0, #0
	bl FS_UnloadOverlay
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E8C:
	ldr r1, _02004F70 ; =0x00000021
	mov r0, #0
	bl FS_UnloadOverlay
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
	bl MATHi_CRC32InitTable
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl MATH_CalcCRC32
	mov r4, r0
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02004FC8: .word 0xEDB88320
	arm_func_end sub_02004F80
