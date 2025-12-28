	.include "asm/macros.inc"
	.include "main_02034974.inc"

	.text

	arm_func_start InitMenuWithWindowExtraInfo
InitMenuWithWindowExtraInfo: ; 0x02034974
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _02034A34 ; =_020AFDB8
	mov r5, r1
	ldr r1, [r3]
	mov r6, r0
	add r1, r1, #0xc4
	mov r4, r2
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _02034A2C
	ldr r0, _02034A34 ; =_020AFDB8
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _020349C8
	mov r0, r6
	add r1, r1, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_020349C8:
	ldr ip, _02034A34 ; =_020AFDB8
	mov r2, #1
	ldr r0, [ip]
	mov r1, #0
	strb r2, [r0, #0x10]
	ldr r0, [ip]
	cmp r4, #0
	strb r1, [r0, #0xc0]
	ldr lr, [ip]
	ldmia r6, {r0, r1, r2, r3}
	add r6, lr, #0x14
	stmia r6, {r0, r1, r2, r3}
	str r5, [lr, #0x24]
	beq _02034A24
	ldr r0, [ip]
	mov r5, #9
	add r6, r0, #0x28
_02034A0C:
	ldmia r4!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _02034A0C
	ldmia r4, {r0, r1}
	stmia r6, {r0, r1}
_02034A24:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02034A2C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02034A34: .word _020AFDB8
	arm_func_end InitMenuWithWindowExtraInfo

	arm_func_start CopyMenuControlWindowExtraInfo
CopyMenuControlWindowExtraInfo: ; 0x02034A38
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02034A7C ; =_020AFDB8
	mov r5, r0
	ldr r4, [r1]
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02034A74
	add lr, r4, #0x28
	mov ip, #9
_02034A5C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02034A5C
	ldmia lr, {r0, r1}
	stmia r5, {r0, r1}
_02034A74:
	ldr r0, [r4, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02034A7C: .word _020AFDB8
	arm_func_end CopyMenuControlWindowExtraInfo

	arm_func_start HandleMenus
HandleMenus: ; 0x02034A80
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r0, _02034C9C ; =_020AFDB8
	ldr ip, [r0]
	ldr r0, [ip, #0xd4]
	add r4, ip, #0xc4
	cmp r0, #1
	beq _02034AAC
	cmp r0, #2
	beq _02034B6C
	b _02034BE4
_02034AAC:
	ldrb r0, [ip, #0x10]
	cmp r0, #0
	beq _02034AD8
	add r6, ip, #0x14
	ldmia r6, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	mov r5, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	strb r5, [ip, #0x10]
_02034AD8:
	ldr ip, _02034C9C ; =_020AFDB8
	ldr r6, [ip]
	ldrb r0, [r6, #0xc0]
	cmp r0, #0
	beq _02034B0C
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	mov r5, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	strb r5, [r6, #0xc0]
	ldr r0, [ip]
	str r5, [r0, #0xd4]
	b _02034C94
_02034B0C:
	ldr r0, [r4]
	bl OverlayIsLoaded
	cmp r0, #0
	bne _02034B34
	ldr r0, [r4]
	bl LoadOverlay
	ldr r0, _02034C9C ; =_020AFDB8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
_02034B34:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02034B5C
	blx r0
	cmp r0, #0
	ldreq r0, _02034C9C ; =_020AFDB8
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #0xd4]
	beq _02034C94
_02034B5C:
	ldr r0, _02034C9C ; =_020AFDB8
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xd4]
_02034B6C:
	add r5, sp, #0
	ldmia r4, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r0, [r4, #0xc]
	blx r0
	mov r5, r0
	sub r0, r5, #3
	cmp r0, #1
	bhi _02034BE4
	add r1, sp, #0
	mov r0, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	beq _02034BE4
	ldr r0, _02034C9C ; =_020AFDB8
	mov r1, #3
	ldr r0, [r0]
	cmp r5, #4
	str r1, [r0, #0xd4]
	bne _02034BE4
	bl FreeActiveMenu
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr ip, _02034C9C ; =_020AFDB8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	mov r1, #0
	strb r1, [r0, #0xc0]
	ldr r0, [ip]
	str r1, [r0, #0xd4]
_02034BE4:
	ldr r0, _02034C9C ; =_020AFDB8
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _02034C4C
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	mov r1, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _02034C10
	bl FreeActiveMenu
_02034C10:
	ldr ip, _02034C9C ; =_020AFDB8
	mov r5, #0
	ldr r6, [ip]
	ldr lr, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	add r0, r6, #0x14
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	strb r5, [r6, #0x10]
	ldr ip, [ip]
	ldmia lr, {r0, r1, r2, r3}
	add r4, ip, #0x14
	stmia r4, {r0, r1, r2, r3}
	mov r0, #1
	str r0, [ip, #0xd4]
	b _02034C94
_02034C4C:
	ldrb r0, [r1, #0xc0]
	cmp r0, #0
	beq _02034C94
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	mov r1, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _02034C70
	bl FreeActiveMenu
_02034C70:
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr ip, _02034C9C ; =_020AFDB8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	mov r1, #0
	strb r1, [r0, #0xc0]
	ldr r0, [ip]
	str r1, [r0, #0xd4]
_02034C94:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02034C9C: .word _020AFDB8
_02034CA0: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end HandleMenus

	arm_func_start sub_02034CA4
sub_02034CA4: ; 0x02034CA4
	stmdb sp!, {r3, lr}
	ldr r0, _02034D08 ; =_020AFDBC
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02034CE4
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #0x480]
	cmp r0, #0
	bne _02034D00
	ldr r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #3
	streq r0, [r1, #0x10]
	beq _02034D00
	mov r0, #0
	ldmia sp!, {r3, pc}
_02034CE4:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02034D00
	bl MemFree
	ldr r0, _02034D08 ; =_020AFDBC
	mov r1, #0
	str r1, [r0, #0xc]
_02034D00:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02034D08: .word _020AFDBC
	arm_func_end sub_02034CA4

	arm_func_start sub_02034D0C
sub_02034D0C: ; 0x02034D0C
	stmdb sp!, {r3, lr}
	ldr r0, _02034D4C ; =_020AFDBC
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	cmp r1, #0
	movne r1, #1
	strneb r1, [r0, #0x480]
	bne _02034D44
	cmp r0, #0
	beq _02034D44
	bl MemFree
	ldr r0, _02034D4C ; =_020AFDBC
	mov r1, #0
	str r1, [r0, #0xc]
_02034D44:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02034D4C: .word _020AFDBC
	arm_func_end sub_02034D0C

	arm_func_start sub_02034D50
sub_02034D50: ; 0x02034D50
	stmdb sp!, {r3, lr}
	ldr r0, _02034DA0 ; =_020AFDBC
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02034DA4 ; =0x00000484
	mov r1, #8
	bl MemAlloc
	ldr r1, _02034DA0 ; =_020AFDBC
	str r0, [r1, #0xc]
	bl InitPortraitParams
	ldr r0, _02034DA0 ; =_020AFDBC
	mov r2, #0
	ldr r1, [r0, #0xc]
	str r2, [r1, #0x10]
	ldr r1, [r0, #0xc]
	str r2, [r1, #0x468]
	ldr r0, [r0, #0xc]
	strb r2, [r0, #0x480]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02034DA0: .word _020AFDBC
_02034DA4: .word 0x00000484
	arm_func_end sub_02034D50

	arm_func_start sub_02034DA8
sub_02034DA8: ; 0x02034DA8
	stmdb sp!, {r3, lr}
	ldr r0, _02034E20 ; =_020AFDBC
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02034DE4
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #0x480]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x10]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r2, #8]
	ldmia sp!, {r3, pc}
_02034DE4:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02034E04
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02034E18
	mov r0, #1
	ldmia sp!, {r3, pc}
_02034E04:
	ldr r0, _02034E24 ; =_0209B09C
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02034E18:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02034E20: .word _020AFDBC
_02034E24: .word _0209B09C
	arm_func_end sub_02034DA8

	arm_func_start sub_02034E28
sub_02034E28: ; 0x02034E28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02034D50
	cmp r4, #0
	ldrne ip, _02034E5C ; =_020AFDBC
	ldmneia r4, {r0, r1, r2, r3}
	ldrne ip, [ip, #0xc]
	stmneia ip, {r0, r1, r2, r3}
	ldmneia sp!, {r4, pc}
	ldr r0, _02034E5C ; =_020AFDBC
	ldr r0, [r0, #0xc]
	bl InitPortraitParams
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034E5C: .word _020AFDBC
	arm_func_end sub_02034E28

	arm_func_start sub_02034E60
sub_02034E60: ; 0x02034E60
	ldr r2, _02034E6C ; =_020AFDBC
	stmia r2, {r0, r1}
	bx lr
	.align 2, 0
_02034E6C: .word _020AFDBC
	arm_func_end sub_02034E60

	arm_func_start sub_02034E70
sub_02034E70: ; 0x02034E70
	ldr r0, _02034EB0 ; =_020AFDBC
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _02034EA8
	ldrb r0, [r1, #0x480]
	cmp r0, #0
	bne _02034EA8
	ldr r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1, #0x10]
	beq _02034EA8
	mov r0, #0
	bx lr
_02034EA8:
	mov r0, #1
	bx lr
	.align 2, 0
_02034EB0: .word _020AFDBC
	arm_func_end sub_02034E70

	arm_func_start sub_02034EB4
sub_02034EB4: ; 0x02034EB4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_02034D50
	ldr r0, _02034F18 ; =_020AFDBC
	mov r1, r4
	ldr r2, [r0, #0xc]
	strh r6, [r2, #0x14]
	ldr r2, [r0, #0xc]
	strh r5, [r2, #0x16]
	ldr r0, [r0, #0xc]
	add r0, r0, #0x18
	bl sub_020236FC
	ldr r1, _02034F18 ; =_020AFDBC
	ldr r0, _02034F1C ; =_0209B09C
	ldr r1, [r1, #0xc]
	mov r2, #1
	str r2, [r1, #0x10]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, _02034F1C ; =_0209B09C
	bl InitMenu
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02034F18: .word _020AFDBC
_02034F1C: .word _0209B09C
	arm_func_end sub_02034EB4

	arm_func_start sub_02034F20
sub_02034F20: ; 0x02034F20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_02034D50
	ldr r0, _02034F90 ; =_020AFDBC
	mov r1, r5
	ldr r2, [r0, #0xc]
	strh r6, [r2, #0x14]
	ldr r0, [r0, #0xc]
	add r0, r0, #0x68
	bl strcpy
	ldr r0, _02034F90 ; =_020AFDBC
	mov r1, r4
	ldr r0, [r0, #0xc]
	add r0, r0, #0x18
	bl sub_020236FC
	ldr r1, _02034F90 ; =_020AFDBC
	ldr r0, _02034F94 ; =_0209B09C
	ldr r1, [r1, #0xc]
	mov r2, #2
	str r2, [r1, #0x10]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, _02034F94 ; =_0209B09C
	bl InitMenu
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02034F90: .word _020AFDBC
_02034F94: .word _0209B09C
	arm_func_end sub_02034F20

	arm_func_start sub_02034F98
sub_02034F98: ; 0x02034F98
	stmdb sp!, {r3, lr}
	ldr r0, _0203501C ; =_020AFDBC
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02034FE8
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #0x480]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x468]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldrsb r1, [r2]
	mvn r0, #1
	cmp r1, r0
	moveq r0, #0
	ldrneb r0, [r2, #9]
	ldmia sp!, {r3, pc}
_02034FE8:
	ldr r0, _02035020 ; =_0209B09C
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _0203501C ; =_020AFDBC
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r0, #0x468]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203501C: .word _020AFDBC
_02035020: .word _0209B09C
	arm_func_end sub_02034F98

	arm_func_start sub_02035024
sub_02035024: ; 0x02035024
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_02034D50
	ldr r1, _02035090 ; =_020AFDBC
	mov r0, #0
	str r0, [r1, #0x10]
	ldr r0, [r1, #0xc]
	mov r3, #2
	str r7, [r0, #0x46c]
	ldr r2, [r1, #0xc]
	ldr r0, _02035094 ; =_0209B09C
	str r6, [r2, #0x474]
	ldr r2, [r1, #0xc]
	str r5, [r2, #0x478]
	ldr r2, [r1, #0xc]
	str r3, [r2, #0x468]
	ldr r1, [r1, #0xc]
	str r4, [r1, #0x47c]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02035094 ; =_0209B09C
	bl InitMenu
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02035090: .word _020AFDBC
_02035094: .word _0209B09C
	arm_func_end sub_02035024

	arm_func_start sub_02035098
sub_02035098: ; 0x02035098
	stmdb sp!, {r3, lr}
	ldr r0, _020350D0 ; =_020AFDBC
	ldr r0, [r0, #8]
	cmp r0, #0
	ldrnesb r0, [r0]
	mvnne r1, #1
	cmpne r0, r1
	beq _020350C4
	bl GetSimpleMenuResult__0202B870
	ldr r1, _020350D0 ; =_020AFDBC
	str r0, [r1, #0x10]
_020350C4:
	ldr r0, _020350D0 ; =_020AFDBC
	ldr r0, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020350D0: .word _020AFDBC
	arm_func_end sub_02035098
	arm_func_start sub_020350D4
sub_020350D4: ; 0x020350D4
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r2, _02035150 ; =_020AFDBC
	mov ip, #0
	str r0, [r2, #8]
	str ip, [r0, #4]
	ldr r1, [r2, #8]
	mov r0, ip
	strb ip, [r1, #8]
	ldr r3, [r2, #8]
	mov r1, #3
	strb ip, [r3, #9]
	ldr r3, [r2, #8]
	mov r2, #1
	strb ip, [r3, #0xa]
	bl CreatePortraitBox
	ldr r1, _02035150 ; =_020AFDBC
	ldr r1, [r1, #8]
	strb r0, [r1, #2]
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02035150 ; =_020AFDBC
	mvn r2, #1
	ldr r3, [r1, #8]
	strb r0, [r3, #1]
	ldr r1, [r1, #8]
	mov r0, #1
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02035150: .word _020AFDBC
	arm_func_end sub_020350D4

	arm_func_start sub_02035154
sub_02035154: ; 0x02035154
	stmdb sp!, {r3, lr}
	ldr r0, _020351D8 ; =_020AFDBC
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020351B4
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _0203517C
	bl CloseSimpleMenu
_0203517C:
	ldr r0, _020351D8 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _020351D8 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #2]
	bl ClosePortraitBox
	ldr r0, _020351D8 ; =_020AFDBC
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020351D8 ; =_020AFDBC
	mov r1, #0
	str r1, [r0, #8]
_020351B4:
	ldr r0, _020351D8 ; =_020AFDBC
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _020351D8 ; =_020AFDBC
	mov r1, #0
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020351D8: .word _020AFDBC
	arm_func_end sub_02035154

	arm_func_start sub_020351DC
sub_020351DC: ; 0x020351DC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x9c
	ldr r0, _02035598 ; =_020AFDBC
	ldr r2, [r0, #8]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02035204
	cmp r1, #1
	beq _02035574
	b _0203558C
_02035204:
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _020352E0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02035290
_02035220: ; jump table
	b _02035290 ; case 0
	b _02035234 ; case 1
	b _0203525C ; case 2
	b _02035290 ; case 3
	b _02035284 ; case 4
_02035234:
	ldrsb r0, [r2, #1]
	ldrh r1, [r3, #0x14]
	ldrh r2, [r3, #0x16]
	add r3, r3, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _02035598 ; =_020AFDBC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0xa]
	b _02035298
_0203525C:
	ldrsb r0, [r2, #1]
	ldrh r1, [r3, #0x14]
	add r2, r3, #0x68
	add r3, r3, #0x18
	bl ShowStringInDialogueBox
	ldr r0, _02035598 ; =_020AFDBC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0xa]
	b _02035298
_02035284:
	ldrsb r0, [r2, #1]
	bl sub_0202F3F8
	b _02035298
_02035290:
	ldrsb r0, [r2, #1]
	bl sub_0202F2C4
_02035298:
	ldr r2, _02035598 ; =_020AFDBC
	ldr r1, [r2, #8]
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	beq _020352C8
	ldr r0, [r2, #0xc]
	ldrh r0, [r0, #0x14]
	tst r0, #0x20
	beq _020352C8
	ldrsb r0, [r1, #1]
	ldmia r2, {r1, r2}
	bl sub_0202F190
_020352C8:
	ldr r0, _02035598 ; =_020AFDBC
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r4, #1
	str r1, [r0, #0x10]
	b _020352EC
_020352E0:
	ldrsb r0, [r2, #1]
	bl IsDialogueBoxActive
	mov r4, r0
_020352EC:
	ldr r0, _02035598 ; =_020AFDBC
	ldr r1, [r0, #8]
	strb r4, [r1, #8]
	ldr r2, [r0, #0xc]
	ldr r1, [r2, #0x468]
	cmp r1, #0
	beq _02035408
	ldr r1, [r2, #0x478]
	str r1, [sp, #4]
	ldr r1, [r2, #0x46c]
	orr r1, r1, #0x20
	str r1, [r2, #0x46c]
	ldr r1, [r0, #0xc]
	ldr r0, [r1, #0x46c]
	tst r0, #0x8000
	moveq r4, #8
	beq _02035350
	orr r0, r0, #0x1800
	orr r0, r0, #0x40000
	str r0, [r1, #0x46c]
	mov r1, #0
	mov r0, #0x10
	strh r1, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r4, #5
_02035350:
	ldr r0, _02035598 ; =_020AFDBC
	mvn r1, #1
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _0203536C
	bl CloseSimpleMenu
_0203536C:
	ldr r0, _02035598 ; =_020AFDBC
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0x468]
	str r4, [sp]
	cmp r0, #1
	mov r0, #0
	ldr r1, [r2, #0x46c]
	bne _020353A0
	ldr r3, [r2, #0x470]
	add r2, sp, #4
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02035598 ; =_020AFDBC
	b _020353B0
_020353A0:
	ldr r3, [r2, #0x474]
	add r2, sp, #4
	bl CreateSimpleMenu
	ldr r1, _02035598 ; =_020AFDBC
_020353B0:
	ldr r1, [r1, #8]
	strb r0, [r1]
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #1]
	bl ShowDialogueBox
	ldr r0, _02035598 ; =_020AFDBC
	ldr r1, [r0, #0xc]
	ldr r1, [r1, #0x47c]
	cmp r1, #0
	ble _020353E8
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl SetSimpleMenuField0x1AC
_020353E8:
	ldr r0, _02035598 ; =_020AFDBC
	mov r2, #0
	ldr r1, [r0, #0xc]
	mov r4, #1
	str r2, [r1, #0x468]
	ldr r0, [r0, #8]
	strb r4, [r0, #9]
	b _02035468
_02035408:
	ldr r0, [r0, #8]
	mvn r1, #1
	ldrsb r0, [r0]
	cmp r0, r1
	beq _02035468
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02035598 ; =_020AFDBC
	mov r4, #1
	str r0, [r1, #0x10]
	ldr r0, [r1, #8]
	strb r4, [r0, #9]
	ldr r0, [r1, #8]
	ldrsb r0, [r0]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02035468
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl CloseSimpleMenu
	ldr r0, _02035598 ; =_020AFDBC
	mvn r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0]
_02035468:
	ldr r0, _02035598 ; =_020AFDBC
	ldr r1, [r0, #0xc]
	ldrb r1, [r1, #0x480]
	cmp r1, #0
	beq _020354AC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #2]
	bl HidePortraitBox
	ldr r0, _02035598 ; =_020AFDBC
	mov r1, #1
	ldr r0, [r0, #8]
	str r1, [r0, #4]
	b _0203558C
_020354AC:
	cmp r4, #0
	bne _020354F8
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #1]
	bl sub_0202F16C
	cmp r0, #0x10
	cmpne r0, #0
	bne _0203558C
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #2]
	bl HidePortraitBox
	ldr r0, _02035598 ; =_020AFDBC
	mov r2, #1
	ldr r1, [r0, #8]
	str r2, [r1, #4]
	ldr r0, [r0, #8]
	strb r2, [r0, #8]
	b _0203558C
_020354F8:
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	beq _0203558C
	ldrsb r0, [r1, #1]
	bl sub_0202F16C
	cmp r0, #0xc
	beq _0203558C
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #0xc]
	bl IsValidPortrait
	cmp r0, #0
	beq _02035544
	ldr r0, _02035598 ; =_020AFDBC
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	ldrsb r0, [r2, #2]
	bl ShowPortraitInPortraitBox
	b _02035554
_02035544:
	ldr r0, _02035598 ; =_020AFDBC
	ldr r0, [r0, #8]
	ldrsb r0, [r0, #2]
	bl HidePortraitBox
_02035554:
	ldr r0, _02035598 ; =_020AFDBC
	mov r3, #1
	ldr r2, [r0, #8]
	mov r1, #0
	strb r3, [r2, #8]
	ldr r0, [r0, #8]
	strb r1, [r0, #0xa]
	b _0203558C
_02035574:
	ldrsb r0, [r2, #1]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	moveq r0, #4
	beq _02035590
_0203558C:
	mov r0, #1
_02035590:
	add sp, sp, #0x9c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02035598: .word _020AFDBC
	arm_func_end sub_020351DC

	arm_func_start sub_0203559C
sub_0203559C: ; 0x0203559C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov r2, r1
	ldr r3, _020355D4 ; =_020AFDD0
	mov ip, #0
	ldr r0, _020355D8 ; =_0209B0FC
	mov r1, lr
	strb ip, [r3]
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _020355D4 ; =_020AFDD0
	movne r1, #0
	strneb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020355D4: .word _020AFDD0
_020355D8: .word _0209B0FC
	arm_func_end sub_0203559C

	arm_func_start sub_020355DC
sub_020355DC: ; 0x020355DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02035638 ; =_020AFDD0
	mov r5, r0
	mov lr, r1
	mov ip, #0
	mov r4, r2
	ldr r0, _0203563C ; =_0209B10C
	mov r1, r5
	mov r2, lr
	strb ip, [r3]
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02035638 ; =_020AFDD0
	mov r1, #1
	strb r1, [r0]
	bl sub_02035640
	ldr r0, _02035638 ; =_020AFDD0
	mov r1, #0
	ldr r2, [r0, #4]
	str r4, [r2, #0xf8]
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02035638: .word _020AFDD0
_0203563C: .word _0209B10C
	arm_func_end sub_020355DC

	arm_func_start sub_02035640
sub_02035640: ; 0x02035640
	stmdb sp!, {r3, lr}
	ldr r0, _02035764 ; =_020AFDD0
	ldrb r0, [r0]
	cmp r0, #0
	movne r1, #0x300
	moveq r1, #8
	mov r0, #0xfc
	bl MemAlloc
	ldr r1, _02035764 ; =_020AFDD0
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl CopyMenuControlWindowExtraInfo
	ldr r1, _02035764 ; =_020AFDD0
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	mov r0, #0
	bl sub_02048078
	ldr r0, _02035764 ; =_020AFDD0
	ldr r0, [r0, #4]
	add r0, r0, #0xa4
	bl GetOptions
	ldr r1, _02035764 ; =_020AFDD0
	mov r0, #0
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa4]
	str r2, [r3, #0xb0]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa6]
	str r2, [r3, #0xb4]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa5]
	str r2, [r3, #0xb8]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa7]
	str r2, [r3, #0xbc]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa8]
	str r2, [r3, #0xc0]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xa9]
	str r2, [r3, #0xc4]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xaa]
	str r2, [r3, #0xc8]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xab]
	str r2, [r3, #0xcc]
	ldr r3, [r1, #4]
	ldrb r2, [r3, #0xac]
	str r2, [r3, #0xd0]
_02035708:
	ldr r2, [r1, #4]
	add r3, r2, r0, lsl #2
	ldr r2, [r3, #0xb0]
	add r0, r0, #1
	str r2, [r3, #0xd4]
	cmp r0, #9
	blt _02035708
	ldr r1, _02035764 ; =_020AFDD0
	mvn ip, #1
	ldr r0, [r1, #4]
	mov r3, #0
	strb ip, [r0]
	ldr r2, [r1, #4]
	mov r0, #1
	strb ip, [r2, #1]
	ldr r2, [r1, #4]
	strb ip, [r2, #2]
	ldr r2, [r1, #4]
	str r3, [r2, #4]
	ldr r2, [r1, #4]
	str r3, [r2, #0xf8]
	strb r3, [r1, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02035764: .word _020AFDD0
	arm_func_end sub_02035640

	arm_func_start sub_02035768
sub_02035768: ; 0x02035768
	stmdb sp!, {r3, lr}
	ldr r0, _020357EC ; =_020AFDD0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _02035790
	bl CloseOptionsMenu
_02035790:
	ldr r0, _020357EC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _020357AC
	bl CloseDialogueBox
_020357AC:
	ldr r0, _020357EC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _020357C8
	bl CloseParentMenu
_020357C8:
	mov r0, #1
	bl sub_02048078
	ldr r0, _020357EC ; =_020AFDD0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020357EC ; =_020AFDD0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020357EC: .word _020AFDD0
	arm_func_end sub_02035768

	arm_func_start sub_020357F0
sub_020357F0: ; 0x020357F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _02035CCC ; =_020AFDD0
	ldr r3, [r2, #4]
	ldr r0, [r3, #4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02035CC0
_02035810: ; jump table
	b _0203582C ; case 0
	b _02035920 ; case 1
	b _020359BC ; case 2
	b _02035A80 ; case 3
	b _02035AE8 ; case 4
	b _02035BC0 ; case 5
	b _02035C94 ; case 6
_0203582C:
	ldrsb r0, [r3, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0203586C
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
	b _02035CC0
_0203586C:
	ldrsb r0, [r3, #2]
	cmp r0, r1
	beq _020358A8
	bl IsParentMenuActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	b _02035CC0
_020358A8:
	ldrsb r0, [r3]
	cmp r0, r1
	bne _02035910
	mov r0, #0
	str r0, [r3, #0xc]
	ldr r0, [r2, #4]
#ifdef JAPAN
	mov r1, #0x38c
#else
	mov r1, #0x184
#endif
	strh r1, [r0, #0x14]
	ldr r0, [r2, #4]
	mov r1, #0x10
	str r1, [r0, #0x18]
	ldr r2, [r2, #4]
	mov r0, #9
	str r0, [sp]
	add r0, r2, #0xb0
	str r0, [sp, #4]
	ldr r1, [r2, #8]
	ldr r0, _02035CD0 ; =_0209B0EC
	orr r1, r1, #0x33
	ldr r3, _02035CD4 ; =_0209B134
	orr r1, r1, #0x1800
	add r2, r2, #0xc
	bl CreateOptionsMenu
	ldr r1, _02035CCC ; =_020AFDD0
	ldr r1, [r1, #4]
	strb r0, [r1]
_02035910:
	ldr r0, _02035CCC ; =_020AFDD0
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02035920:
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CheckOptionsMenuField0x1A4
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetOptionsMenuResult
	ldr r1, _02035CCC ; =_020AFDD0
	tst r0, #0xff
	strb r0, [r1, #1]
	beq _02035998
	mov r3, #0
	ldr ip, [r1, #4]
	mov r4, r3
	mov r0, #1
_02035968:
	add r1, ip, r4, lsl #2
	ldr r2, [r1, #0xd4]
	ldr r1, [r1, #0xb0]
	add r4, r4, #1
	cmp r2, r1
	movne r3, r0
	cmp r4, #9
	blt _02035968
	cmp r3, #0
	ldreq r0, _02035CCC ; =_020AFDD0
	moveq r1, #0
	streqb r1, [r0, #1]
_02035998:
	ldr r0, _02035CCC ; =_020AFDD0
	ldrb r1, [r0, #1]
	ldr r0, [r0, #4]
	cmp r1, #0
	moveq r1, #4
	streq r1, [r0, #4]
	movne r1, #2
	strne r1, [r0, #4]
	b _02035CC0
_020359BC:
	ldrsb r0, [r3]
	mvn r1, #1
	cmp r0, r1
	beq _020359FC
	bl IsOptionsMenuActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseOptionsMenu
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _02035CC0
_020359FC:
	ldrsb r0, [r3, #1]
	cmp r0, r1
	bne _02035A34
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _02035CCC ; =_020AFDD0
	ldr r1, _02035CD8 ; =0x00000408
	ldr r4, [r3, #4]
#ifdef JAPAN
	sub r2, r1, #0x5b
#else
	ldr r2, _02035CDC ; =0x000001A5
#endif
	strb r0, [r4, #1]
	ldr r0, [r3, #4]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowStringIdInDialogueBox
_02035A34:
	ldr r1, _02035CCC ; =_020AFDD0
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _02035A6C
	mov r0, #0
	ldr r3, _02035CE0 ; =_0209B11C
	mov r2, r0
	mov r1, #0x13
	bl CreateParentMenuFromStringIds
	ldr r1, _02035CCC ; =_020AFDD0
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
_02035A6C:
	ldr r0, _02035CCC ; =_020AFDD0
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02035CC0
_02035A80:
	ldrsb r0, [r3, #2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _02035CCC ; =_020AFDD0
	mov r4, r0
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	cmp r4, #1
	ldreq r0, _02035CCC ; =_020AFDD0
	moveq r1, #0
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	beq _02035CC0
	mov r0, #1
	bl SetNotifyNote
	ldr r0, _02035CCC ; =_020AFDD0
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02035CC0
_02035AE8:
	ldrsb r0, [r3]
	mvn r1, #1
	cmp r0, r1
	beq _02035B24
	bl IsOptionsMenuActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseOptionsMenu
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_02035B24:
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02035B68
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_02035B68:
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02035BAC
	bl IsParentMenuActive
	cmp r0, #0
	bne _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _02035CCC ; =_020AFDD0
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
_02035BAC:
	ldr r0, _02035CCC ; =_020AFDD0
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02035CC0
_02035BC0:
	mov r0, #7
	str r0, [r3, #4]
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _02035C4C
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xb0]
	strb r0, [r1, #0xa4]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xb4]
	strb r0, [r1, #0xa6]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xb8]
	strb r0, [r1, #0xa5]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xbc]
	strb r0, [r1, #0xa7]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xc0]
	strb r0, [r1, #0xa8]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xc4]
	strb r0, [r1, #0xa9]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xc8]
	strb r0, [r1, #0xaa]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xcc]
	strb r0, [r1, #0xab]
	ldr r1, [r2, #4]
	ldr r0, [r1, #0xd0]
	strb r0, [r1, #0xac]
	ldr r0, [r2, #4]
	add r0, r0, #0xa4
	bl SetOptions
_02035C4C:
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _02035C70
	ldrb r1, [r0, #1]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_02035C70:
	ldr r0, _02035CCC ; =_020AFDD0
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xf8]
	cmp r0, #0
	movne r0, #6
	strne r0, [r1, #4]
	bne _02035CC0
	mov r0, #4
	b _02035CC4
_02035C94:
	ldr r0, [r3, #0x94]
	ldr r1, [r3, #0xf8]
	blx r1
	cmp r0, #0
	beq _02035CC0
	ldr r0, _02035CCC ; =_020AFDD0
	mov r2, #7
	ldr r1, [r0, #4]
	mov r0, #4
	str r2, [r1, #4]
	b _02035CC4
_02035CC0:
	mov r0, #1
_02035CC4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02035CCC: .word _020AFDD0
_02035CD0: .word _0209B0EC
_02035CD4: .word _0209B134
_02035CD8: .word 0x00000408
#ifndef JAPAN
_02035CDC: .word 0x000001A5
#endif
_02035CE0: .word _0209B11C
	arm_func_end sub_020357F0

	arm_func_start sub_02035CE4
sub_02035CE4: ; 0x02035CE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02035DA8 ; =_0209B1B8
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _02035DAC ; =_020AFDD8
	mov r3, #0
	mov r0, #0xb8
	mov r1, #8
	strb r3, [r2]
	bl MemAlloc
	ldr r1, _02035DAC ; =_020AFDD8
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl CopyMenuControlWindowExtraInfo
	ldr r1, _02035DAC ; =_020AFDD8
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	mov r0, #0
	bl sub_02048078
	ldr r0, _02035DAC ; =_020AFDD8
	ldr r0, [r0, #4]
	add r0, r0, #0xa4
	bl CopyFrameTypeOption
	ldr r0, _02035DAC ; =_020AFDD8
	mvn r3, #1
	ldr ip, [r0, #4]
	mov r2, #0
	ldrb r1, [ip, #0xa4]
	str r1, [ip, #0xb0]
	ldr ip, [r0, #4]
	ldr r1, [ip, #0xb0]
	str r1, [ip, #0xb4]
	ldr ip, [r0, #4]
	ldr r1, [ip, #0xb0]
	str r1, [ip, #0xac]
	ldr r1, [r0, #4]
	strb r3, [r1]
	ldr r1, [r0, #4]
	strb r3, [r1, #1]
	ldr r1, [r0, #4]
	strb r3, [r1, #2]
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r1, [r0, #4]
	str r4, [r1, #0xa8]
	strb r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02035DA8: .word _0209B1B8
_02035DAC: .word _020AFDD8
	arm_func_end sub_02035CE4

	arm_func_start sub_02035DB0
sub_02035DB0: ; 0x02035DB0
	stmdb sp!, {r3, lr}
	ldr r0, _02035E34 ; =_020AFDD8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _02035DD8
	bl CloseOptionsMenu
_02035DD8:
	ldr r0, _02035E34 ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02035DF4
	bl CloseDialogueBox
_02035DF4:
	ldr r0, _02035E34 ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02035E10
	bl CloseParentMenu
_02035E10:
	mov r0, #1
	bl sub_02048078
	ldr r0, _02035E34 ; =_020AFDD8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02035E34 ; =_020AFDD8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02035E34: .word _020AFDD8
	arm_func_end sub_02035DB0

	arm_func_start sub_02035E38
sub_02035E38: ; 0x02035E38
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0203630C ; =_020AFDD8
	ldr r3, [r2, #4]
	ldr r0, [r3, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02036300
_02035E58: ; jump table
	b _02035E70 ; case 0
	b _02035F64 ; case 1
	b _0203604C ; case 2
	b _02036110 ; case 3
	b _02036178 ; case 4
	b _02036250 ; case 5
_02035E70:
	ldrsb r0, [r3, #1]
	mvn r1, #1
	cmp r0, r1
	beq _02035EB0
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
	b _02036300
_02035EB0:
	ldrsb r0, [r3, #2]
	cmp r0, r1
	beq _02035EEC
	bl IsParentMenuActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	b _02036300
_02035EEC:
	ldrsb r0, [r3]
	cmp r0, r1
	bne _02035F54
	mov r0, #0
	str r0, [r3, #0xc]
	ldr r0, [r2, #4]
#ifdef JAPAN
	mov r1, #0x3b0
#else
	mov r1, #0x1a8
#endif
	strh r1, [r0, #0x14]
	ldr r0, [r2, #4]
	mov r1, #0x10
	str r1, [r0, #0x18]
	ldr r2, [r2, #4]
	mov r0, #9
	str r0, [sp]
	add r0, r2, #0xb0
	str r0, [sp, #4]
	ldr r1, [r2, #8]
	ldr r0, _02036310 ; =_0209B1C8
	orr r1, r1, #0x33
	ldr r3, _02036314 ; =_0209B1F0
	orr r1, r1, #0x1800
	add r2, r2, #0xc
	bl CreateOptionsMenu
	ldr r1, _0203630C ; =_020AFDD8
	ldr r1, [r1, #4]
	strb r0, [r1]
_02035F54:
	ldr r0, _0203630C ; =_020AFDD8
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02035F64:
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CheckOptionsMenuField0x1A4
	cmp r0, #0
	bne _02035FE8
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetOptionsMenuResult
	ldr r1, _0203630C ; =_020AFDD8
	tst r0, #0xff
	strb r0, [r1]
	beq _02035FC4
	ldr r0, [r1, #4]
	mov r2, #0
	ldr r1, [r0, #0xb4]
	ldr r0, [r0, #0xb0]
	cmp r1, r0
	movne r2, #1
	cmp r2, #0
	ldreq r0, _0203630C ; =_020AFDD8
	moveq r1, #0
	streqb r1, [r0]
_02035FC4:
	ldr r0, _0203630C ; =_020AFDD8
	ldrb r1, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	moveq r1, #4
	streq r1, [r0, #4]
	movne r1, #2
	strne r1, [r0, #4]
	b _02036300
_02035FE8:
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202D59C
	movs r4, r0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r1, [r0, #4]
	ldrsb r0, [r1], #0xb0
	bl GetOptionsMenuStates
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r1, [r0, #0xb0]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _02036300
	and r0, r1, #0xff
	bl sub_02027180
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	add r1, r0, r4, lsl #2
	ldr r0, [r1, #0xb0]
	str r0, [r1, #0xac]
	b _02036300
_0203604C:
	ldrsb r0, [r3]
	mvn r1, #1
	cmp r0, r1
	beq _0203608C
	bl IsOptionsMenuActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseOptionsMenu
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _02036300
_0203608C:
	ldrsb r0, [r3, #1]
	cmp r0, r1
	bne _020360C4
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _0203630C ; =_020AFDD8
	ldr r1, _02036318 ; =0x00000408
	ldr r4, [r3, #4]
#ifdef JAPAN
	sub r2, r1, #0x5b
#else
	ldr r2, _0203631C ; =0x000001A5
#endif
	strb r0, [r4, #1]
	ldr r0, [r3, #4]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowStringIdInDialogueBox
_020360C4:
	ldr r1, _0203630C ; =_020AFDD8
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _020360FC
	mov r0, #0
	ldr r3, _02036320 ; =_0209B1D8
	mov r2, r0
	mov r1, #0x13
	bl CreateParentMenuFromStringIds
	ldr r1, _0203630C ; =_020AFDD8
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
_020360FC:
	ldr r0, _0203630C ; =_020AFDD8
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02036300
_02036110:
	ldrsb r0, [r3, #2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _0203630C ; =_020AFDD8
	mov r4, r0
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	cmp r4, #1
	ldreq r0, _0203630C ; =_020AFDD8
	moveq r1, #0
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	beq _02036300
	mov r0, #1
	bl SetNotifyNote
	ldr r0, _0203630C ; =_020AFDD8
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02036300
_02036178:
	ldrsb r0, [r3]
	mvn r1, #1
	cmp r0, r1
	beq _020361B4
	bl IsOptionsMenuActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseOptionsMenu
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_020361B4:
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _020361F8
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_020361F8:
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0203623C
	bl IsParentMenuActive
	cmp r0, #0
	bne _02036300
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl CloseParentMenu
	ldr r0, _0203630C ; =_020AFDD8
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
_0203623C:
	ldr r0, _0203630C ; =_020AFDD8
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02036300
_02036250:
	mov r0, #6
	str r0, [r3, #4]
	ldrb r0, [r2]
	mov r4, #0
	ldr r1, [r2, #4]
	cmp r0, #0
	beq _02036298
	ldr r0, [r1, #0xb0]
	strb r0, [r1, #0xa4]
	ldr r0, [r2, #4]
	add r0, r0, #0xa4
	bl SetFrameTypeOption
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa8]
	cmp r0, #1
	moveq r4, #1
	b _020362A0
_02036298:
	ldr r0, [r1, #0xb4]
	strb r0, [r1, #0xa4]
_020362A0:
	ldr r0, _0203630C ; =_020AFDD8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xa4]
	bl sub_02027180
	cmp r4, #0
	beq _020362D4
	ldr r1, _0203630C ; =_020AFDD8
	mov r0, #2
	ldr r2, [r1, #4]
	mov r1, #0x100
	add r2, r2, #0xc
	bl sub_0204964C
	b _020362F8
_020362D4:
	ldr r0, _0203630C ; =_020AFDD8
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _020362F8
	ldrb r1, [r0]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_020362F8:
	mov r0, #4
	b _02036304
_02036300:
	mov r0, #1
_02036304:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203630C: .word _020AFDD8
_02036310: .word _0209B1C8
_02036314: .word _0209B1F0
_02036318: .word 0x00000408
#ifndef JAPAN
_0203631C: .word 0x000001A5
#endif
_02036320: .word _0209B1D8
	arm_func_end sub_02035E38

	arm_func_start sub_02036324
sub_02036324: ; 0x02036324
	stmdb sp!, {r3, lr}
	mov r3, r0
	mov r2, r1
	ldr r0, _02036350 ; =_0209B218
	mov r1, r3
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _02036354 ; =_020AFDE0
	movne r1, #0
	strneb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02036350: .word _0209B218
_02036354: .word _020AFDE0
	arm_func_end sub_02036324

	arm_func_start sub_02036358
sub_02036358: ; 0x02036358
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r0, #0xb0
	mov r1, #8
	bl MemAlloc
	ldr r1, _0203642C ; =_020AFDE0
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl CopyMenuControlWindowExtraInfo
	ldr r4, _0203642C ; =_020AFDE0
	mov r5, #0
	ldr r1, [r4, #4]
	str r0, [r1, #8]
_0203638C:
	and r0, r5, #0xff
	bl Debug_GetDebugFlag
	ldr r1, [r4, #4]
	add r1, r1, r5
	add r5, r5, #1
	strb r0, [r1, #0xa4]
	cmp r5, #0xc
	blt _0203638C
	ldr r0, _0203642C ; =_020AFDE0
	mov r3, #0
	ldr r1, [r0, #4]
	ldr r2, _02036430 ; =0x00003C64
	str r3, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r3, #0x10
	strh r2, [r1, #0x14]
	ldr r2, [r0, #4]
	mov r1, #8
	str r3, [r2, #0x18]
	ldr r2, [r0, #4]
	ldr r0, _02036434 ; =_0209B208
	str r1, [sp]
	add r1, r2, #0xa4
	str r1, [sp, #4]
	ldr r1, [r2, #8]
	ldr r3, _02036438 ; =_0209B228
	orr r1, r1, #0x33
	orr r1, r1, #0x9800
	add r2, r2, #0xc
	bl CreateDebugMenu
	ldr r1, _0203642C ; =_020AFDE0
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	strb r3, [r1]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203642C: .word _020AFDE0
#if defined(EUROPE)
_02036430: .word 0x00003C66
#elif defined(JAPAN)
_02036430: .word 0x000003BB
#else
_02036430: .word 0x00003C64
#endif
_02036434: .word _0209B208
_02036438: .word _0209B228
	arm_func_end sub_02036358

	arm_func_start sub_0203643C
sub_0203643C: ; 0x0203643C
	stmdb sp!, {r3, lr}
	ldr r0, _02036474 ; =_020AFDE0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDebugMenu
	ldr r0, _02036474 ; =_020AFDE0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02036474 ; =_020AFDE0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02036474: .word _020AFDE0
	arm_func_end sub_0203643C

	arm_func_start sub_02036478
sub_02036478: ; 0x02036478
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02036568 ; =_020AFDE0
	ldr r1, [r4, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _020364A4
	cmp r0, #1
	beq _020364C4
	cmp r0, #2
	beq _020364FC
	b _02036560
_020364A4:
	ldrsb r0, [r1]
	bl CheckDebugMenuField0x1A4
	cmp r0, #0
	moveq r0, r4
	ldreq r0, [r0, #4]
	moveq r1, #1
	streq r1, [r0, #4]
	b _02036560
_020364C4:
	ldrsb r0, [r1]
	bl IsDebugMenuActive
	cmp r0, #0
	bne _02036560
	mov r0, r4
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202DF64
	mov r1, r4
	strb r0, [r1]
	ldr r0, [r1, #4]
	mov r2, #2
	str r2, [r0, #4]
	b _02036560
_020364FC:
	mov r0, #3
	str r0, [r1, #4]
	ldrb r0, [r4]
	cmp r0, #0
	beq _02036534
	mov r5, #0
_02036514:
	ldr r1, [r4, #4]
	and r0, r5, #0xff
	add r1, r1, r5
	ldrb r1, [r1, #0xa4]
	bl Debug_SetDebugFlag
	add r5, r5, #1
	cmp r5, #0xc
	blt _02036514
_02036534:
	ldr r0, _02036568 ; =_020AFDE0
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _02036558
	ldrb r1, [r0]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_02036558:
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_02036560:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02036568: .word _020AFDE0
	arm_func_end sub_02036478

	arm_func_start sub_0203656C
sub_0203656C: ; 0x0203656C
	stmdb sp!, {r3, lr}
	mov r3, r0
	mov r2, r1
	ldr r0, _02036598 ; =_0209B254
	mov r1, r3
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _0203659C ; =_020AFDE8
	movne r1, #0
	strneb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02036598: .word _0209B254
_0203659C: .word _020AFDE8
	arm_func_end sub_0203656C

	arm_func_start sub_020365A0
sub_020365A0: ; 0x020365A0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r0, #0xb4
	mov r1, #8
	bl MemAlloc
	ldr r1, _02036674 ; =_020AFDE8
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl CopyMenuControlWindowExtraInfo
	ldr r4, _02036674 ; =_020AFDE8
	mov r5, #0
	ldr r1, [r4, #4]
	str r0, [r1, #8]
_020365D4:
	and r0, r5, #0xff
	bl Debug_GetLogFlag
	ldr r1, [r4, #4]
	add r1, r1, r5
	add r5, r5, #1
	strb r0, [r1, #0xa4]
	cmp r5, #0x10
	blt _020365D4
	ldr r0, _02036674 ; =_020AFDE8
	mov r3, #0
	ldr r1, [r0, #4]
	ldr r2, _02036678 ; =0x00003C73
	str r3, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r3, #0x10
	strh r2, [r1, #0x14]
	ldr r2, [r0, #4]
	mov r1, #8
	str r3, [r2, #0x18]
	ldr r2, [r0, #4]
	ldr r0, _0203667C ; =_0209B244
	str r1, [sp]
	add r1, r2, #0xa4
	str r1, [sp, #4]
	ldr r1, [r2, #8]
	ldr r3, _02036680 ; =_0209B264
	orr r1, r1, #0x33
	orr r1, r1, #0x9800
	add r2, r2, #0xc
	bl CreateDebugMenu
	ldr r1, _02036674 ; =_020AFDE8
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	strb r3, [r1]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02036674: .word _020AFDE8
#if defined(EUROPE)
_02036678: .word 0x00003C75
#elif defined(JAPAN)
_02036678: .word 0x000003CA
#else
_02036678: .word 0x00003C73
#endif
_0203667C: .word _0209B244
_02036680: .word _0209B264
	arm_func_end sub_020365A0

	arm_func_start sub_02036684
sub_02036684: ; 0x02036684
	stmdb sp!, {r3, lr}
	ldr r0, _020366BC ; =_020AFDE8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDebugMenu
	ldr r0, _020366BC ; =_020AFDE8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020366BC ; =_020AFDE8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020366BC: .word _020AFDE8
	arm_func_end sub_02036684

	arm_func_start sub_020366C0
sub_020366C0: ; 0x020366C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020367B0 ; =_020AFDE8
	ldr r1, [r4, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _020366EC
	cmp r0, #1
	beq _0203670C
	cmp r0, #2
	beq _02036744
	b _020367A8
_020366EC:
	ldrsb r0, [r1]
	bl CheckDebugMenuField0x1A4
	cmp r0, #0
	moveq r0, r4
	ldreq r0, [r0, #4]
	moveq r1, #1
	streq r1, [r0, #4]
	b _020367A8
_0203670C:
	ldrsb r0, [r1]
	bl IsDebugMenuActive
	cmp r0, #0
	bne _020367A8
	mov r0, r4
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202DF64
	mov r1, r4
	strb r0, [r1]
	ldr r0, [r1, #4]
	mov r2, #2
	str r2, [r0, #4]
	b _020367A8
_02036744:
	mov r0, #3
	str r0, [r1, #4]
	ldrb r0, [r4]
	cmp r0, #0
	beq _0203677C
	mov r5, #0
_0203675C:
	ldr r1, [r4, #4]
	and r0, r5, #0xff
	add r1, r1, r5
	ldrb r1, [r1, #0xa4]
	bl Debug_SetLogFlag
	add r5, r5, #1
	cmp r5, #0x10
	blt _0203675C
_0203677C:
	ldr r0, _020367B0 ; =_020AFDE8
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _020367A0
	ldrb r1, [r0]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_020367A0:
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_020367A8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020367B0: .word _020AFDE8
	arm_func_end sub_020366C0

	arm_func_start SetupAndShowKeyboard
SetupAndShowKeyboard: ; 0x020367B4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, _020367EC ; =_0209B298
	mov r5, r1
	mov r4, r2
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020367EC: .word _0209B298
	arm_func_end SetupAndShowKeyboard

	arm_func_start ShowKeyboard
ShowKeyboard: ; 0x020367F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x1e8
	mov r1, #8
	mov r4, r2
	mov r7, r3
	bl MemAlloc
	ldr r2, _02036CB0 ; =_020AFDF0
	mov r1, #0x1e8
	str r0, [r2]
	bl MemZero
	cmp r7, #0
	ldreq r0, _02036CB0 ; =_020AFDF0
	moveq r1, #0
	ldreq r0, [r0]
	streqb r1, [r0, #0x16e]
	beq _02036850
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r1, r7
	ldr r0, [r0]
	add r0, r0, #0x6e
	add r0, r0, #0x100
	bl StrcpySimple
_02036850:
	ldr r0, _02036CB0 ; =_020AFDF0
#ifdef JAPAN
	cmp r4, #0
	ldr r1, [r0]
	mov r2, #0
#else
	mov r2, #0
	ldr r1, [r0]
	cmp r4, #0
#endif
	strb r2, [r1, #0x11]
	ldr r1, [r0]
	and r3, r6, #0xff
	strb r2, [r1, #0x12]
	ldrne r1, [r0]
	movne r2, #1
	strneb r2, [r1, #0x11]
	ldrne r0, [r0]
#ifdef JAPAN
	mov r4, #0
#endif
	strneb r2, [r0, #0x12]
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r2, #0
	ldr r1, [r0]
	str r3, [r1, #0xc]
	ldr r1, [r0]
#ifdef JAPAN
	ldr r3, _02036CB0 ; =_020AFDF0
#endif
	strb r2, [r1, #0x1d]
	ldr r1, [r0]
	strb r2, [r1, #0x1e]
#if defined(EUROPE)
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	cmp r1, #0xa
	addne r1, r1, #0x118
	addne r0, r2, #0x100
	bne _02036BC4
	mov r1, #1
	str r1, [r2, #0xc]
	ldr r0, [r0]
	mov r1, #0x120
	add r0, r0, #0x100
_02036BC4:
	strh r1, [r0, #0xa6]
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x16]
	ldr r1, [r0]
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	strh r2, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _02036A40
_02036C04: ; jump table
	b _02036A40 ; case 0
	b _02036CEC ; case 1
	b _02036A40 ; case 2
	b _02036A40 ; case 3
	b _02036A20 ; case 4
	b _02036C2C ; case 5
	b _02036C9C ; case 6
	b _02036CCC_EU ; case 7
	b _02036C5C ; case 8
	b _02036D04 ; case 9
_02036C2C:
	mov r1, #9
	strb r1, [r3, #0x18]
	ldr r1, [r0]
	mov r2, #1
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	mov r2, #0x36
	strb r2, [r1, #0x1b]
	ldr r0, [r0]
	mov r1, #2
	strb r1, [r0, #0x16]
	b _02036A58
_02036C5C:
	mov r1, #6
	strb r1, [r3, #0x18]
	ldr r1, [r0]
	mov r2, #3
	strb r2, [r1, #0x16]
	ldr r1, [r0]
	mov r2, #1
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	mov r2, #0x36
	strb r2, [r1, #0x1b]
	ldr r0, [r0]
	add r1, r2, #0xe9
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
	b _02036A58
_02036C9C:
	mov r1, #9
	strb r1, [r3, #0x18]
	ldr r1, [r0]
	mov r2, #1
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	mov r2, #0x22
	strb r2, [r1, #0x1b]
	ldr r0, [r0]
	mov r1, #2
	strb r1, [r0, #0x16]
	b _02036A58
_02036CCC_EU:
	strb r2, [r3, #0x16]
	ldr r1, [r0]
	mov r2, #6
	strb r2, [r1, #0x18]
	ldr r0, [r0]
	mov r1, #0x36
	strb r1, [r0, #0x1b]
	b _02036A58
_02036CEC:
	mov r1, #6
	strb r1, [r3, #0x18]
	ldr r0, [r0]
	mov r1, #0xa
	strb r1, [r0, #0x1b]
	b _02036A58
_02036D04:
	mov r1, #4
	strb r1, [r3, #0x16]
	ldr r0, [r0]
	mov r1, #0x11c
#elif defined(JAPAN)
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #0xa
	moveq r0, #1
	streq r0, [r1, #0xc]
	ldr r2, [r3]
	mov r0, #1
	ldr r1, [r2, #0xc]
	add r2, r2, #0x100
	add r1, r1, #0xca
	add r1, r1, #0x3100
	strh r1, [r2, #0xa6]
	ldr r1, [r3]
	strb r0, [r1, #0x16]
	ldr r1, [r3]
	strb r4, [r1, #0x15]
	ldr r1, [r3]
	strh r4, [r1, #8]
	ldr r1, [r3]
	strb r4, [r1, #0x10]
	ldr r1, [r3]
	ldr r2, [r1, #0xc]
	cmp r2, #9
	addls pc, pc, r2, lsl #2
	b _02036A40
_02036C28: ; jump table
	b _02036A40 ; case 0
	b _02036D04 ; case 1
	b _02036A40 ; case 2
	b _02036A40 ; case 3
	b _02036A20 ; case 4
	b _02036C50 ; case 5
	b _02036CB8_JP ; case 6
	b _02036CE4 ; case 7
	b _02036C7C ; case 8
	b _02036D1C ; case 9
_02036C50:
	mov r2, #9
	strb r2, [r1, #0x18]
	ldr r1, [r3]
	mov r2, #0x36
	strb r0, [r1, #0x10]
	ldr r0, [r3]
	mov r1, #3
	strb r2, [r0, #0x1b]
	ldr r0, [r3]
	strb r1, [r0, #0x16]
	b _02036A58
_02036C7C:
	mov r2, #6
	strb r2, [r1, #0x18]
	ldr r1, [r3]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r1, [r3]
	mov r2, #0x36
	strb r0, [r1, #0x10]
	ldr r0, [r3]
	ldr r1, _02036FC8 ; =0x000031D1
	strb r2, [r0, #0x1b]
	ldr r0, [r3]
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
	b _02036A58
_02036CB8_JP:
	mov r2, #9
	strb r2, [r1, #0x18]
	ldr r1, [r3]
	mov r2, #0x22
	strb r0, [r1, #0x10]
	ldr r0, [r3]
	mov r1, #3
	strb r2, [r0, #0x1b]
	ldr r0, [r3]
	strb r1, [r0, #0x16]
	b _02036A58
_02036CE4:
	strb r4, [r1, #0x16]
	ldr r0, [r3]
	mov r1, #6
	strb r1, [r0, #0x18]
	ldr r0, [r3]
	mov r1, #0x36
	strb r1, [r0, #0x1b]
	b _02036A58
_02036D04:
	mov r0, #6
	strb r0, [r1, #0x18]
	ldr r0, [r3]
	mov r1, #5
	strb r1, [r0, #0x1b]
	b _02036A58
_02036D1C:
	mov r0, #5
	strb r0, [r1, #0x16]
	ldr r0, [r3]
	ldr r1, _02036FCC ; =0x000031CE
#else
	ldr r1, [r0]
	mov r2, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0xa
	moveq r0, #1
	streq r0, [r1, #0xc]
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r0, [r1]
	ldr r3, [r0, #0xc]
	add r0, r0, #0x100
	add r3, r3, #0x118
	strh r3, [r0, #0xa6]
	ldr r0, [r1]
	strb r2, [r0, #0x16]
	ldr r0, [r1]
	strb r2, [r0, #0x15]
	ldr r0, [r1]
	strh r2, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r3, [r1]
	ldr r0, [r3, #0xc]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02036A40
_02036908: ; jump table
	b _02036A40 ; case 0
	b _020369F0 ; case 1
	b _02036A40 ; case 2
	b _02036A40 ; case 3
	b _02036A20 ; case 4
	b _02036930 ; case 5
	b _020369A0 ; case 6
	b _020369D0 ; case 7
	b _02036960 ; case 8
	b _02036A08 ; case 9
_02036930:
	mov r0, #9
	strb r0, [r3, #0x18]
	ldr r0, [r1]
	mov r2, #1
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	mov r2, #0x36
	strb r2, [r0, #0x1b]
	ldr r0, [r1]
	mov r1, #2
	strb r1, [r0, #0x16]
	b _02036A58
_02036960:
	mov r0, #6
	strb r0, [r3, #0x18]
	ldr r0, [r1]
	mov r2, #3
	strb r2, [r0, #0x16]
	ldr r0, [r1]
	mov r2, #1
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	mov r2, #0x36
	strb r2, [r0, #0x1b]
	ldr r0, [r1]
	add r1, r2, #0xe9
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
	b _02036A58
_020369A0:
	mov r0, #9
	strb r0, [r3, #0x18]
	ldr r0, [r1]
	mov r2, #1
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	mov r2, #0x22
	strb r2, [r0, #0x1b]
	ldr r0, [r1]
	mov r1, #2
	strb r1, [r0, #0x16]
	b _02036A58
_020369D0:
	strb r2, [r3, #0x16]
	ldr r0, [r1]
	mov r2, #6
	strb r2, [r0, #0x18]
	ldr r0, [r1]
	mov r1, #0x36
	strb r1, [r0, #0x1b]
	b _02036A58
_020369F0:
	mov r0, #6
	strb r0, [r3, #0x18]
	ldr r0, [r1]
	mov r1, #0xa
	strb r1, [r0, #0x1b]
	b _02036A58
_02036A08:
	mov r0, #4
	strb r0, [r3, #0x16]
	ldr r0, [r1]
	mov r1, #0x11c
#endif
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
_02036A20:
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r3, #6
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x18]
	ldr r0, [r0]
	strb r1, [r0, #0x1b]
	b _02036A58
_02036A40:
#ifdef JAPAN
	mov r2, #6
	ldr r0, _02036CB0 ; =_020AFDF0
	strb r2, [r1, #0x18]
	ldr r0, [r0]
	mov r1, #5
#else
	mov r1, #6
	ldr r0, _02036CB0 ; =_020AFDF0
	strb r1, [r3, #0x18]
	ldr r0, [r0]
	mov r1, #0xa
#endif
	strb r1, [r0, #0x1b]
_02036A58:
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r3, #0
	ldr r2, [r0]
	add r1, r2, #0xfc
	str r1, [r2, #0xf8]
	mov r2, r3
_02036A70:
	ldr r1, [r0]
	ldr r1, [r1, #0xf8]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #0x36
	blt _02036A70
	cmp r5, #0
	ldreq r0, _02036CB0 ; =_020AFDF0
	ldreq r1, [r0]
	addeq r0, r1, #0x138
	streq r0, [r1, #0x134]
	beq _02036AE4
	ldr r0, _02036CB0 ; =_020AFDF0
	ldr r1, [r0]
	str r5, [r1, #0x134]
	ldr r1, [r0]
	ldrb r2, [r1, #0x1b]
	ldr r0, [r1, #0xf8]
	ldr r1, [r1, #0x134]
	bl MemcpySimple
	ldr r0, _02036CB0 ; =_020AFDF0
	ldr r2, [r0]
	add r1, r2, #0x138
	str r1, [r2, #0x134]
	ldr r1, [r0]
	ldrb r2, [r1, #0x1b]
	ldr r0, [r1, #0x134]
	ldr r1, [r1, #0xf8]
	bl MemcpySimple
_02036AE4:
	ldr r0, _02036CB0 ; =_020AFDF0
	mov r4, #0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1b]
	b _02036B0C
_02036AF8:
	ldr r0, [r2, #0xf8]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _02036B14
	add r4, r4, #1
_02036B0C:
	cmp r4, r1
	blt _02036AF8
_02036B14:
	mov r2, #0
	ldr r0, _02036CB0 ; =_020AFDF0
	b _02036B2C
_02036B20:
	ldr r1, [r3, #0xf8]
	strb r2, [r1, r4]
	add r4, r4, #1
_02036B2C:
	ldr r3, [r0]
	ldrb r1, [r3, #0x1b]
	cmp r4, r1
	blt _02036B20
	bl sub_02038A54
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r2, [r1]
	strb r0, [r2, #0x1c]
	ldr r2, [r1]
	ldrb r1, [r2, #0x1c]
	ldrb r0, [r2, #0x1b]
	cmp r1, r0
	subeq r0, r1, #1
	streqb r0, [r2, #0x1c]
	ldr r0, _02036CB0 ; =_020AFDF0
	mvn r1, #1
	ldr r3, [r0]
	ldrb r2, [r3, #0x16]
	strb r2, [r3, #0x17]
	ldr r0, [r0]
	strb r1, [r0, #2]
	bl sub_02038ADC
	ldr r0, _02036CB0 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	sub r0, r0, #5
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02036C30
_02036BA0: ; jump table
	b _02036BB0 ; case 0
	b _02036BB0 ; case 1
	b _02036BB0 ; case 2
	b _02036BB0 ; case 3
_02036BB0:
	ldr r0, _02036CB4 ; =_0209B2FC
	ldr r1, _02036CB8 ; =sub_02037F58
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r1, [r1]
	ldrb r0, [r1, #0x12]
	cmp r0, #1
	mvneq r0, #1
	streqb r0, [r1, #2]
	beq _02036C84
	ldr r0, [r1, #0xc]
	cmp r0, #8
	beq _02036BF8
	sub r0, r0, #5
	cmp r0, #1
	bhi _02036C14
_02036BF8:
	ldr r0, _02036CBC ; =_0209B31C
	ldr r1, _02036CC0 ; =sub_02037CA8
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r1, [r1]
	strb r0, [r1, #2]
	b _02036C84
_02036C14:
	ldr r0, _02036CBC ; =_0209B31C
	ldr r1, _02036CC4 ; =sub_02037C78
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r1, [r1]
	strb r0, [r1, #2]
	b _02036C84
_02036C30:
	ldr r0, _02036CC8 ; =_0209B2EC
	ldr r1, _02036CB8 ; =sub_02037F58
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #4
	cmpne r0, #9
	ldrneb r0, [r1, #0x12]
	cmpne r0, #1
	mvneq r0, #1
	streqb r0, [r1, #2]
	beq _02036C84
	ldr r0, _02036CBC ; =_0209B31C
	ldr r1, _02036CC4 ; =sub_02037C78
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	ldr r1, [r1]
	strb r0, [r1, #2]
_02036C84:
	ldr r0, _02036CCC ; =_0209B2DC
	ldr r1, _02036CD0 ; =sub_02037CD8
	bl CreateTextBox
	ldr r1, _02036CB0 ; =_020AFDF0
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02036CB0: .word _020AFDF0
#ifdef JAPAN
_02036FC8: .word 0x000031D1
_02036FCC: .word 0x000031CE
#endif
_02036CB4: .word _0209B2FC
_02036CB8: .word sub_02037F58
_02036CBC: .word _0209B31C
_02036CC0: .word sub_02037CA8
_02036CC4: .word sub_02037C78
_02036CC8: .word _0209B2EC
_02036CCC: .word _0209B2DC
_02036CD0: .word sub_02037CD8
	arm_func_end ShowKeyboard

	arm_func_start GetKeyboardStatus
GetKeyboardStatus: ; 0x02036CD4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	ldr r0, _02037444 ; =_020AFDF0
	ldr r4, [r0]
	ldr r0, [r4, #0xc]
	sub r1, r0, #4
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02036DE8
_02036CF8: ; jump table
	b _02036DB8 ; case 0
	b _02036D10 ; case 1
	b _02036D40 ; case 2
	b _02036D70 ; case 3
	b _02036D10 ; case 4
	b _02036DB8 ; case 5
_02036D10:
	ldrb r2, [r4, #0x1c]
	ldr r1, _02037448 ; =_0209B3B4
	ldr r0, _0203744C ; =_0209B3B6
	mov r3, r2, lsl #2
	ldrsh r2, [r1, r3]
	ldrsh r1, [r0, r3]
	ldrsb r0, [r4, #1]
	add r2, r2, #0xc
	add r3, r1, #0x24
	mov r1, #5
	bl sub_020288FC
	b _02036E30
_02036D40:
	ldrb r2, [r4, #0x1c]
	ldr r1, _02037450 ; =_0209B32C
	ldr r0, _02037454 ; =_0209B32E
	mov r3, r2, lsl #2
	ldrsh r2, [r1, r3]
	ldrsh r1, [r0, r3]
	ldrsb r0, [r4, #1]
	add r2, r2, #0xc
	add r3, r1, #0x24
	mov r1, #5
	bl sub_020288FC
	b _02036E30
_02036D70:
	ldrb r5, [r4, #0x1c]
	mov r1, #0x12
	mov r0, r5
	bl _s32_div_f
	mov r1, #0x12
	mul r1, r0, r1
	ldr r0, _02037448 ; =_0209B3B4
	mov r2, r5, lsl #2
	ldrsh r2, [r0, r2]
	ldr r0, _0203744C ; =_0209B3B6
	mov r1, r1, lsl #2
	ldrsh r1, [r0, r1]
	ldrsb r0, [r4, #1]
	add r2, r2, #0xc
	add r3, r1, #0x24
	mov r1, #5
	bl sub_020288FC
	b _02036E30
_02036DB8:
	ldr r2, _02037458 ; =_0209B2C4
	ldr r1, _0203745C ; =_0209B2D0
	ldrsh r3, [r4, #0x20]
	ldrb r1, [r1, r0]
	ldrb r2, [r2, r0]
	add r3, r3, #0x25
	ldrsb r0, [r4, #1]
	add r2, r3, r2
	add r3, r1, #0x24
	mov r1, #5
	bl sub_020288FC
	b _02036E30
_02036DE8:
	ldr r1, _02037444 ; =_020AFDF0
	ldr r2, _02037458 ; =_0209B2C4
	ldr ip, [r1]
	ldr r1, _0203745C ; =_0209B2D0
	ldrb r5, [ip, #0x1c]
	ldrb r3, [r1, r0]
	ldrb r4, [r2, r0]
	add r0, ip, r5, lsl #1
	ldrsh r2, [r0, #0x20]
	ldrsh r1, [r0, #0x8c]
	ldrsb r0, [ip, #1]
	add r2, r2, #0x1f
	add r2, r4, r2
	add r1, r1, r1, lsr #31
	add r2, r2, r1, asr #1
	add r3, r3, #0x24
	mov r1, #5
	bl sub_020288FC
_02036E30:
	ldr r1, _02037444 ; =_020AFDF0
	add r0, sp, #0x38
	ldr r3, [r1]
	mov r1, #1
	ldrb r2, [r3, #0x14]
	add r2, r2, #1
	strb r2, [r3, #0x14]
	bl sub_02031914
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	mov r2, #0
	bl sub_02038B80
	cmp r0, #0x64
	blt _02036EB4
	ldr r1, _02037444 ; =_020AFDF0
	sub r0, r0, #0x64
	ldr r2, [r1]
	and r1, r0, #0xff
	ldrb r0, [r2, #0x1c]
	cmp r0, r1
	beq _02036EE0
	mov r0, #3
	strb r1, [r2, #0x1c]
	bl PlaySeVolumeWrapper
	ldr r0, _02037444 ; =_020AFDF0
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _02036EE0
_02036EB4:
	cmp r0, #0
	blt _02036EE0
	ldr r1, _02037444 ; =_020AFDF0
	and r0, r0, #0xff
	ldr r3, [r1]
	ldrb r2, [r3, #0x18]
	cmp r2, r0
	strneb r0, [r3, #0x18]
	ldrne r0, [r1]
	movne r1, #8
	strneb r1, [r0, #0x14]
_02036EE0:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r1, #0x1e]
	add r1, sp, #8
	mov r0, #0
	bl sub_020063F4
	add r1, sp, #0xa
	mov r0, #0
	bl GetHeldButtons
	ldrh r0, [sp, #0xa]
	tst r0, #0x100
	beq _02036F5C
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
	ldr r5, [r0]
#ifdef JAPAN
	ldr r3, [r0, #4]
#else
	ldr r3, [r0, #8]
#endif
	ldrb r1, [r5, #0x16]
	ldrb r4, [r5, #0x18]
	ldrsb r0, [r5]
	ldr r3, [r3, r1, lsl #2]
	mov r1, #3
	mla r3, r4, r2, r3
	ldrb r2, [r3, #4]
	ldrb r3, [r3, #5]
	add r2, r2, #2
	add r3, r3, #0x61
	bl sub_020288FC
	b _020370A4
_02036F5C:
	ldrh r0, [sp, #8]
	cmp r0, #0x20
	bgt _02036F78
	bge _02036FE4
	cmp r0, #0x10
	beq _0203700C
	b _02037034
_02036F78:
	cmp r0, #0x40
	bgt _02036F88
	beq _02036F94
	b _02037034
_02036F88:
	cmp r0, #0x80
	beq _02036FBC
	b _02037034
_02036F94:
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
#ifdef JAPAN
	ldmia r0, {r1, r4}
#else
	ldr r1, [r0]
	ldr r4, [r0, #8]
#endif
	ldrb r0, [r1, #0x18]
	ldrb r3, [r1, #0x16]
	smulbb r2, r0, r2
	ldr r3, [r4, r3, lsl #2]
	ldrb r2, [r3, r2]
	b _02037044
_02036FBC:
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
#ifdef JAPAN
	ldmia r0, {r1, r4}
#else
	ldr r1, [r0]
	ldr r4, [r0, #8]
#endif
	ldrb r3, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	ldr r3, [r4, r3, lsl #2]
	mla r2, r0, r2, r3
	ldrb r2, [r2, #1]
	b _02037044
_02036FE4:
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
#ifdef JAPAN
	ldmia r0, {r1, r4}
#else
	ldr r1, [r0]
	ldr r4, [r0, #8]
#endif
	ldrb r3, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	ldr r3, [r4, r3, lsl #2]
	mla r2, r0, r2, r3
	ldrb r2, [r2, #2]
	b _02037044
_0203700C:
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
#ifdef JAPAN
	ldmia r0, {r1, r4}
#else
	ldr r1, [r0]
	ldr r4, [r0, #8]
#endif
	ldrb r3, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	ldr r3, [r4, r3, lsl #2]
	mla r2, r0, r2, r3
	ldrb r2, [r2, #3]
	b _02037044
_02037034:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x18]
	mov r2, r0
_02037044:
	cmp r2, r0
	beq _02037068
	mov r0, #3
	strb r2, [r1, #0x18]
	bl PlaySeVolumeWrapper
	ldr r0, _02037444 ; =_020AFDF0
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0x14]
_02037068:
	ldr r0, _02037444 ; =_020AFDF0
	mov r2, #0xa
	ldr r5, [r0]
#ifdef JAPAN
	ldr r3, [r0, #4]
#else
	ldr r3, [r0, #8]
#endif
	ldrb r1, [r5, #0x16]
	ldrb r4, [r5, #0x18]
	ldrsb r0, [r5]
	ldr r3, [r3, r1, lsl #2]
	mov r1, #3
	mla r3, r4, r2, r3
	ldrb r2, [r3, #4]
	ldrb r3, [r3, #5]
	add r2, r2, #2
	add r3, r3, #0x61
	bl sub_020288FC
_020370A4:
	add r0, sp, #0x14
	mov r1, #1
	bl sub_02031914
	ldrh r0, [sp, #0x14]
	tst r0, #2
	beq _020371C0
	ldr r0, _02037444 ; =_020AFDF0
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _020371C0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	mov r2, #1
	bl sub_02038B80
	mov r4, r0
	cmp r4, #0x64
	bge _02037108
	mvn r0, #0
	cmp r4, r0
	bne _02037110
_02037108:
	mvn r4, #0
	b _020371C4
_02037110:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl GetWindow
	ldr r3, _02037444 ; =_020AFDF0
	mov r1, #0xa
	ldr ip, [r3]
	mul r5, r4, r1
	ldrb r1, [ip, #0x16]
#ifdef JAPAN
	ldr ip, [r3, #4]
#else
	ldr ip, [r3, #8]
#endif
	ldr r3, _02037460 ; =_0209B28C
	ldr ip, [ip, r1, lsl #2]
	mov r1, #0x40
	str r3, [sp]
	str r1, [sp, #4]
	add r1, ip, r5
	ldrb ip, [r1, #4]
	ldrb lr, [r0, #4]
	ldrb r3, [r0, #5]
	ldrb r1, [r1, #5]
	add r0, ip, lr, lsl #3
	mov r0, r0, lsl #0x10
	add r1, r1, r3, lsl #3
	mov r1, r1, lsl #0x10
	mov r2, #0xc
	cmp r4, #5
	movle r2, #0x24
	mov r2, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	mov r3, #0xc
	bl sub_0202A2A4
	ldr r0, _02037444 ; =_020AFDF0
	ldr r2, [r0]
#ifdef JAPAN
	ldr r1, [r0, #4]
#else
	ldr r1, [r0, #8]
#endif
	ldrb r0, [r2, #0x16]
	ldr r0, [r1, r0, lsl #2]
	add r0, r0, r5
	ldrh r0, [r0, #8]
	cmp r0, #0x108
	movne r0, #5
	strneb r0, [r2, #0x1e]
	b _020371C4
_020371C0:
	mvn r4, #0
_020371C4:
	mvn r0, #0
	cmp r4, r0
	beq _020371D8
	bl sub_020384B0
	b _0203743C
_020371D8:
	add r1, sp, #0x10
	mov r0, #0
	bl GetPressedButtons
	add r1, sp, #0xe
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0xc
	mov r0, #0
	bl sub_020063F4
	ldrh r0, [sp, #0xe]
	tst r0, #0x100
	beq _02037374
	ldrh r0, [sp, #0xc]
	cmp r0, #0x20
	bgt _02037224
	bge _02037240
	cmp r0, #0x10
	beq _02037274
	b _02037374
_02037224:
	cmp r0, #0x40
	bgt _02037234
	beq _020372C0
	b _02037374
_02037234:
	cmp r0, #0x80
	beq _02037308
	b _02037374
_02037240:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	cmp r0, #0
	beq _02037268
	sub r1, r0, #1
	mov r0, #3
	strb r1, [r2, #0x1c]
	bl PlaySeVolumeWrapper
	b _02037374
_02037268:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02037374
_02037274:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r4, [r0]
	ldrb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1c]
	sub r0, r0, #1
	cmp r1, r0
	beq _020372B4
	bl sub_02038A54
	ldrb r1, [r4, #0x1c]
	cmp r1, r0
	bge _020372B4
	add r1, r1, #1
	mov r0, #3
	strb r1, [r4, #0x1c]
	bl PlaySeVolumeWrapper
	b _02037374
_020372B4:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02037374
_020372C0:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r1, _02037464 ; =_0209B2B8
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	ldrsb r1, [r1, r0]
	cmp r1, #0
	beq _02037374
	ldrb r0, [r2, #0x1c]
	cmp r0, r1
	blt _020372FC
	sub r1, r0, r1
	mov r0, #3
	strb r1, [r2, #0x1c]
	bl PlaySeVolumeWrapper
	b _02037374
_020372FC:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02037374
_02037308:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r1, _02037464 ; =_0209B2B8
	ldr r4, [r0]
	ldr r0, [r4, #0xc]
	ldrsb r5, [r1, r0]
	cmp r5, #0
	beq _02037374
	ldrb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1c]
	sub r0, r0, #1
	cmp r1, r0
	beq _0203736C
	bl sub_02038A54
	ldrb r1, [r4, #0x1c]
	add r1, r1, r5
	cmp r1, r0
	bge _0203736C
	ldr r1, _02037444 ; =_020AFDF0
	mov r0, #3
	ldr r2, [r1]
	ldrb r1, [r2, #0x1c]
	add r1, r1, r5
	strb r1, [r2, #0x1c]
	bl PlaySeVolumeWrapper
	b _02037374
_0203736C:
	mov r0, #2
	bl PlaySeVolumeWrapper
_02037374:
	ldrh r0, [sp, #0x10]
	cmp r0, #8
#ifdef JAPAN
	bgt _020376BC
	cmp r0, #0
	addge pc, pc, r0, lsl #2
#else
	addls pc, pc, r0, lsl #2
#endif
	b _02037438
_02037384: ; jump table
	b _02037438 ; case 0
	b _020373A8 ; case 1
	b _020373B0 ; case 2
	b _02037438 ; case 3
	b _020373E0 ; case 4
	b _02037438 ; case 5
	b _02037438 ; case 6
	b _02037438 ; case 7
	b _020373C4 ; case 8
#ifdef JAPAN
_020376BC:
	cmp r0, #0x400
	beq _02037760
	b _02037438
#endif
_020373A8:
	bl sub_020384B0
	b _0203743C
_020373B0:
	bl sub_02038904
	cmp r0, #0
	beq _02037438
	mov r0, #2
	b _0203743C
_020373C4:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02037444 ; =_020AFDF0
	mov r1, #5
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	b _02037438
_020373E0:
	ldr r0, _02037444 ; =_020AFDF0
	ldr r2, [r0]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	bne _02037438
	ldrb r1, [r2, #0x16]
#ifdef JAPAN
	cmp r1, #3
#else
	cmp r1, #2
#endif
	bhi _02037438
	add r1, r1, #1
	strb r1, [r2, #0x16]
#ifdef JAPAN
	ldr r4, [r0]
	mov r1, #3
	ldrb r0, [r4, #0x16]
	bl _s32_div_f
	mov r0, #4
	strb r1, [r4, #0x16]
#else
	ldr r2, [r0]
	mov r0, #4
	ldrb r1, [r2, #0x16]
	and r1, r1, #1
	strb r1, [r2, #0x16]
#endif
	bl PlaySeVolumeWrapper
	ldr r0, _02037444 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_02037CD8
	mov r0, #1
	bl sub_020383FC
#ifdef JAPAN
	b _02037438
_02037760:
	mov r0, #2
	bl sub_0203935C
	ldr r0, _02037444 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
#endif
_02037438:
	mov r0, #0
_0203743C:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02037444: .word _020AFDF0
_02037448: .word _0209B3B4
_0203744C: .word _0209B3B6
_02037450: .word _0209B32C
_02037454: .word _0209B32E
_02037458: .word _0209B2C4
_0203745C: .word _0209B2D0
_02037460: .word _0209B28C
_02037464: .word _0209B2B8
	arm_func_end GetKeyboardStatus

	arm_func_start sub_02037468
sub_02037468: ; 0x02037468
	stmdb sp!, {r3, lr}
	ldr r0, _02037558 ; =_020AFDF0
	ldr r0, [r0]
	cmp r0, #0
	beq _02037550
	ldrsh r1, [r0, #8]
	cmp r1, #3
	beq _0203749C
	cmp r1, #4
	beq _020374D4
	cmp r1, #5
	beq _0203751C
	b _02037534
_0203749C:
	ldrsb r0, [r0]
	bl sub_0202F954
	ldr r0, _02037558 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_0202F954
	ldr r0, _02037558 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02037534
	bl sub_0202F954
	b _02037534
_020374D4:
	ldrsb r0, [r0]
	bl CloseTextBox
	ldr r0, _02037558 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseTextBox
	ldr r0, _02037558 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02037534
	bl CloseTextBox
	ldr r0, _02037558 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
	b _02037534
_0203751C:
	bl MemFree
	ldr r0, _02037558 ; =_020AFDF0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02037534:
	ldr r1, _02037558 ; =_020AFDF0
	mov r0, #0
	ldr r2, [r1]
	ldrsh r1, [r2, #8]
	add r1, r1, #1
	strh r1, [r2, #8]
	ldmia sp!, {r3, pc}
_02037550:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02037558: .word _020AFDF0
	arm_func_end sub_02037468

	arm_func_start GetKeyboardStringResult
GetKeyboardStringResult: ; 0x0203755C
	ldr r0, _0203756C ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xf8]
	bx lr
	.align 2, 0
_0203756C: .word _020AFDF0
	arm_func_end GetKeyboardStringResult

	arm_func_start sub_02037570
sub_02037570: ; 0x02037570
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x1e8
	mov r1, #8
	mov r4, r3
	bl MemAlloc
	ldr r2, _020376E0 ; =_020AFDF0
	mov r1, #0x1e8
	str r0, [r2]
	bl MemZero
	ldr r0, _020376E0 ; =_020AFDF0
	mov r2, #1
	ldr r1, [r0]
	cmp r5, #0
	strb r2, [r1, #0x1a4]
	bne _020375DC
	ldr r1, [r0]
	mov r2, #5
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x36
	strb r2, [r1, #0x1b]
	ldr r0, [r0]
	ldrh r1, [sp, #0x10]
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
	b _0203760C
_020375DC:
	cmp r5, #1
	bne _0203760C
	ldr r1, [r0]
	mov r2, #6
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x22
	strb r2, [r1, #0x1b]
	ldr r0, [r0]
	ldrh r1, [sp, #0x10]
	add r0, r0, #0x100
	strh r1, [r0, #0xa6]
_0203760C:
	ldr r0, _020376E0 ; =_020AFDF0
	mov r3, #0
	ldr r1, [r0]
	str r3, [r1, #0x134]
	ldr r2, [r0]
	add r1, r2, #0xfc
	str r1, [r2, #0xf8]
	mov r2, r3
_0203762C:
	ldr r1, [r0]
	ldr r1, [r1, #0xf8]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #0x36
	blt _0203762C
	ldr r0, _020376E0 ; =_020AFDF0
	mov r1, r4
	ldr r0, [r0]
	ldrb r2, [r0, #0x1b]
	ldr r0, [r0, #0xf8]
	bl MemcpySimple
	ldr r0, _020376E0 ; =_020AFDF0
	mov r4, #0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1b]
	b _02037684
_02037670:
	ldr r0, [r2, #0xf8]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _0203768C
	add r4, r4, #1
_02037684:
	cmp r4, r1
	blt _02037670
_0203768C:
	mov r2, #0
	ldr r0, _020376E0 ; =_020AFDF0
	b _020376A4
_02037698:
	ldr r1, [r3, #0xf8]
	strb r2, [r1, r4]
	add r4, r4, #1
_020376A4:
	ldr r3, [r0]
	ldrb r1, [r3, #0x1b]
	cmp r4, r1
	blt _02037698
	ldr r0, _020376E4 ; =_0209B30C
	ldr r1, _020376E8 ; =sub_02037F58
	bl CreateTextBox
	ldr r1, _020376E0 ; =_020AFDF0
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020376E0: .word _020AFDF0
_020376E4: .word _0209B30C
_020376E8: .word sub_02037F58
	arm_func_end sub_02037570

	arm_func_start sub_020376EC
sub_020376EC: ; 0x020376EC
	stmdb sp!, {r3, lr}
	ldr r0, _02037774 ; =_020AFDF0
	ldr r0, [r0]
	cmp r0, #0
	beq _0203776C
	ldrsh r1, [r0, #8]
	cmp r1, #0
	beq _02037720
	cmp r1, #1
	beq _0203772C
	cmp r1, #0xc
	beq _02037738
	b _02037750
_02037720:
	ldrsb r0, [r0]
	bl sub_0202F954
	b _02037750
_0203772C:
	ldrsb r0, [r0]
	bl CloseTextBox
	b _02037750
_02037738:
	bl MemFree
	ldr r0, _02037774 ; =_020AFDF0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02037750:
	ldr r1, _02037774 ; =_020AFDF0
	mov r0, #0
	ldr r2, [r1]
	ldrsh r1, [r2, #8]
	add r1, r1, #1
	strh r1, [r2, #8]
	ldmia sp!, {r3, pc}
_0203776C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02037774: .word _020AFDF0
	arm_func_end sub_020376EC

	arm_func_start sub_02037778
sub_02037778: ; 0x02037778
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r3, [r0]
#ifdef JAPAN
	ldr r1, [r0, #8]
#else
	ldr r1, [r0, #4]
#endif
	ldr r2, [r3, #4]
	cmp r2, r1
	beq _020377B0
	ldr r0, _02037C2C ; =_0209B48C
	bl Debug_Print0
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r3, [r0]
	ldr r1, [r3, #4]
#ifdef JAPAN
	str r1, [r0, #8]
#else
	str r1, [r0, #4]
#endif
_020377B0:
	ldr r0, [r3, #4]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02037C1C
_020377C0: ; jump table
	b _020377E8 ; case 0
	b _020377F4 ; case 1
	b _02037858 ; case 2
	b _0203799C ; case 3
	b _02037C1C ; case 4
	b _02037A5C ; case 5
	b _02037AA0 ; case 6
	b _02037C1C ; case 7
	b _02037AEC ; case 8
	b _02037B24 ; case 9
_020377E8:
	mov r0, #1
	str r0, [r3, #4]
	b _02037C1C
_020377F4:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02037C1C
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0203784C
_02037818: ; jump table
	b _02037840 ; case 0
	b _02037840 ; case 1
	b _02037840 ; case 2
	b _02037840 ; case 3
	b _02037840 ; case 4
	b _02037840 ; case 5
	b _02037840 ; case 6
	b _02037840 ; case 7
	b _0203784C ; case 8
	b _02037840 ; case 9
_02037840:
	mov r0, #2
	str r0, [r1, #4]
	b _02037C1C
_0203784C:
	mov r0, #2
	str r0, [r1, #4]
	b _02037C1C
_02037858:
	cmp r3, #0
	beq _02037924
	ldrsh r0, [r3, #8]
	cmp r0, #3
	beq _02037880
	cmp r0, #4
	beq _020378B8
	cmp r0, #5
	beq _02037900
	b _02037908
_02037880:
	ldrsb r0, [r3]
	bl sub_0202F954
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_0202F954
	ldr r0, _02037C28 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02037908
	bl sub_0202F954
	b _02037908
_020378B8:
	ldrsb r0, [r3]
	bl CloseTextBox
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseTextBox
	ldr r0, _02037C28 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02037908
	bl CloseTextBox
	ldr r0, _02037C28 ; =_020AFDF0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
	b _02037908
_02037900:
	mov r2, #1
	b _02037928
_02037908:
	ldr r0, _02037C28 ; =_020AFDF0
	mov r2, #0
	ldr r1, [r0]
	ldrsh r0, [r1, #8]
	add r0, r0, #1
	strh r0, [r1, #8]
	b _02037928
_02037924:
	mov r2, #1
_02037928:
	cmp r2, #0
	beq _02037C1C
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r2, [r0]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0203798C
_02037958: ; jump table
	b _02037980 ; case 0
	b _02037980 ; case 1
	b _02037980 ; case 2
	b _02037980 ; case 3
	b _02037980 ; case 4
	b _02037980 ; case 5
	b _02037980 ; case 6
	b _02037980 ; case 7
	b _0203798C ; case 8
	b _02037980 ; case 9
_02037980:
	mov r0, #5
	str r0, [r1, #4]
	b _02037C1C
_0203798C:
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	b _02037C1C
_0203799C:
	ldr r0, [r3, #0xc]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02037A54
_020379AC: ; jump table
	b _020379D4 ; case 0
	b _02037A40 ; case 1
	b _02037A54 ; case 2
	b _02037A54 ; case 3
	b _02037A54 ; case 4
	b _02037A54 ; case 5
	b _02037A54 ; case 6
	b _02037A54 ; case 7
	b _02037A54 ; case 8
	b _02037A54 ; case 9
_020379D4:
	bl GetMainCharacter1MemberIdx
	mov r5, r0
	bl GetActiveRosterIndex
	mov r4, r0
	mov r0, r5
	bl GetTeamMember
	mov r5, r0
	mov r0, r4
	bl GetActiveTeamMember
	ldr r1, _02037C28 ; =_020AFDF0
	mov r4, r0
	ldr r1, [r1]
	add r0, r5, #0x3a
	add r1, r1, #0xfc
	mov r2, #0xa
	bl StrncpySimple
	mov r0, #0x3f
	add r1, r5, #0x3a
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	cmp r4, #0
	beq _02037A54
	add r0, r4, #0x5e
	add r1, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	b _02037A54
_02037A40:
	bl ov11_0230D71C
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r0, [r0]
	add r0, r0, #0xfc
	bl SetMainTeamName
_02037A54:
	mov r0, #4
	b _02037C20
_02037A5C:
	add r0, sp, #0
	add r1, r3, #0xfc
	mov r2, #0x40
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0
	bl sub_0203909C
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _02037A8C
	bl sub_02039304
_02037A8C:
	ldr r0, _02037C28 ; =_020AFDF0
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02037C1C
_02037AA0:
	bl sub_0203931C
	cmp r0, #0
	beq _02037AB8
	cmp r0, #1
	beq _02037ACC
	b _02037C1C
_02037AB8:
	ldr r0, _02037C28 ; =_020AFDF0
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02037C1C
_02037ACC:
	ldr r0, _02037C28 ; =_020AFDF0
	mov r3, #9
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strh r1, [r0, #8]
	b _02037C1C
_02037AEC:
	bl sub_02039218
	cmp r0, #0
	beq _02037C1C
	ldr r0, _02037C28 ; =_020AFDF0
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _02037B10
	bl ov11_022E6E68
_02037B10:
	ldr r0, _02037C28 ; =_020AFDF0
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02037C1C
_02037B24:
	bl sub_02039218
	cmp r0, #0
	beq _02037C1C
	ldr r2, _02037C28 ; =_020AFDF0
	ldr r3, [r2]
	ldr r0, [r3, #0xc]
	cmp r0, #5
	cmpne r0, #6
	bne _02037B64
	ldr r0, _02037C30 ; =_0209B2FC
	ldr r1, _02037C34 ; =sub_02037F58
	bl CreateTextBox
	ldr r1, _02037C28 ; =_020AFDF0
	ldr r1, [r1]
	strb r0, [r1]
	b _02037BF8
_02037B64:
	ldrb r1, [r3, #0x17]
	mov ip, #6
	ldr r0, _02037C38 ; =_0209B2EC
	strb r1, [r3, #0x16]
	ldr r3, [r2]
	ldr r1, _02037C34 ; =sub_02037F58
	strb ip, [r3, #0x18]
	ldr r2, [r2]
	mov r3, #0
	strb r3, [r2, #0x15]
	bl CreateTextBox
	ldr r1, _02037C28 ; =_020AFDF0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #4
	cmpne r0, #9
	mvneq r0, #1
	streqb r0, [r1, #2]
	beq _02037BD0
	ldr r0, _02037C3C ; =_0209B31C
	ldr r1, _02037C40 ; =sub_02037C78
	bl CreateTextBox
	ldr r1, _02037C28 ; =_020AFDF0
	ldr r1, [r1]
	strb r0, [r1, #2]
_02037BD0:
	bl sub_02038A54
	ldr r1, _02037C28 ; =_020AFDF0
	ldr r2, [r1]
	strb r0, [r2, #0x1c]
	ldr r2, [r1]
	ldrb r1, [r2, #0x1c]
	ldrb r0, [r2, #0x1b]
	cmp r1, r0
	subeq r0, r1, #1
	streqb r0, [r2, #0x1c]
_02037BF8:
	ldr r0, _02037C44 ; =_0209B2DC
	ldr r1, _02037C48 ; =sub_02037CD8
	bl CreateTextBox
	ldr r1, _02037C28 ; =_020AFDF0
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #4]
_02037C1C:
	mov r0, #1
_02037C20:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02037C28: .word _020AFDF0
_02037C2C: .word _0209B48C
_02037C30: .word _0209B2FC
_02037C34: .word sub_02037F58
_02037C38: .word _0209B2EC
_02037C3C: .word _0209B31C
_02037C40: .word sub_02037C78
_02037C44: .word _0209B2DC
_02037C48: .word sub_02037CD8
	arm_func_end sub_02037778

	arm_func_start sub_02037C4C
sub_02037C4C: ; 0x02037C4C
	stmdb sp!, {r3, lr}
	ldr r0, _02037C74 ; =_020AFDF0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02037C74 ; =_020AFDF0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02037C74: .word _020AFDF0
	arm_func_end sub_02037C4C

	arm_func_start sub_02037C78
sub_02037C78: ; 0x02037C78
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02027B1C
	mov r1, #0
	ldr r3, _02037CA4 ; =0x00000122
	mov r0, r4
	mov r2, r1
	bl sub_02026268
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02037CA4: .word 0x000031D4
#else
_02037CA4: .word 0x00000122
#endif
	arm_func_end sub_02037C78

	arm_func_start sub_02037CA8
sub_02037CA8: ; 0x02037CA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02027B1C
	mov r1, #0
	ldr r3, _02037CD4 ; =0x00000123
	mov r0, r4
	mov r2, r1
	bl sub_02026268
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02037CD4: .word 0x000031D5
#else
_02037CD4: .word 0x00000123
#endif
	arm_func_end sub_02037CA8

	arm_func_start sub_02037CD8
sub_02037CD8: ; 0x02037CD8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x40
#ifdef JAPAN
	mov r7, r0
	bl sub_02027B1C
	mov r4, #0
#else
	ldr r1, _02037F10 ; =_020AFDF0
	mov r7, r0
	ldr r0, [r1]
	mov r4, #0
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	moveq r4, #1
	beq _02037D14
	cmp r0, #1
	moveq r4, #1
	beq _02037D14
	cmp r0, #2
	moveq r4, #3
_02037D14:
	mov r0, r7
	bl sub_02027B1C
	b _02037EF8
#endif
_02037D20:
	ldr r2, _02037F10 ; =_020AFDF0
	mov r0, #0xa
	ldr r1, [r2]
	mul r6, r4, r0
	ldrb r0, [r1, #0x16]
#ifdef JAPAN
	ldr r2, [r2, #4]
#else
	ldr r2, [r2, #8]
#endif
	ldr r3, _02037F14 ; =0x00000111
	ldr r2, [r2, r0, lsl #2]
	add r2, r2, r6
	ldrh r5, [r2, #8]
	cmp r5, r3
	cmpne r5, #0x110
	beq _02037EF4
	add r2, r5, #0xfe
	add r2, r2, #0xfe00
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #7
	bhi _02037E0C
#ifdef JAPAN
	cmp r0, #2
#else
	cmp r0, #0
#endif
	moveq ip, #0x104
	beq _02037D84
	cmp r0, #1
#ifdef JAPAN
	subeq ip, r3, #0xe
	beq _02037D84
	cmp r0, #0
	subeq ip, r3, #0xf
#else
	subeq ip, r3, #0xc
#endif
	movne ip, #0
_02037D84:
	cmp r5, #0x100
	blo _02037EA8
	ldr r0, _02037F18 ; =0x00000109
	cmp r5, r0
	bhi _02037EA8
	mov lr, #0
	ldr r3, _02037F1C ; =KEYBOARD_STRING_IDS
	mov r0, #6
	b _02037DF4
_02037DA8:
	cmp r5, r8
	bne _02037DE8
	ldr r0, _02037F18 ; =0x00000109
	cmp r5, r0
	bne _02037DD0
#ifdef JAPAN
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	ldrne r1, _020381EC ; =0x000031D8
	ldreq r1, _020381F0 ; =0x000031D9
#else
	ldrb r1, [r1, #0x15]
	cmp r1, #0
	addne r1, r0, #0x1d
	addeq r1, r0, #0x1e
#endif
	b _02037DDC
_02037DD0:
	cmp ip, r5
	ldreqh r1, [r2, #4]
	ldrneh r1, [r2, #2]
_02037DDC:
	add r0, sp, #0
	bl GetStringFromFileVeneer
	b _02037EA8
_02037DE8:
	add r2, lr, #1
	mov r2, r2, lsl #0x10
	mov lr, r2, asr #0x10
_02037DF4:
	smulbb r2, lr, r0
	ldrh r8, [r3, r2]
	add r2, r3, r2
	cmp r8, #0
	bne _02037DA8
	b _02037EA8
_02037E0C:
	ldr r1, [r1, #0xc]
	cmp r1, #8
	beq _02037E38
#ifdef JAPAN
	cmp r0, #3
#else
	cmp r0, #2
#endif
	bne _02037E38
	cmp r4, #5
	ble _02037E38
	and r0, r5, #0xff
	bl sub_0204DA1C
	cmp r0, #0xff
#ifdef JAPAN
	bne _02037E38
	ldr r1, _020381F4 ; =_020B12A0_JP
	add r0, sp, #0
	ldr r2, [r1, r5, lsl #2]
	ldr r1, _020381F8 ; =_0209B4A4
	bl SprintfStatic__02037F30
	b _02037EA8
_02037E38:
	ldr r1, _020381F4 ; =_020B12A0_JP
	add r0, sp, #0
	ldr r1, [r1, r5, lsl #2]
	bl strcpy
#else
	beq _02037E5C
_02037E38:
	ldr r0, _02037F10 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #9
	bne _02037E84
	cmp r5, #0x41
	blo _02037E5C
	cmp r5, #0x5a
	bls _02037E84
_02037E5C:
	cmp r5, #0x20
	add r0, sp, #0
	bne _02037E74
	ldr r1, _02037F20 ; =_0209B4A4
	bl SprintfStatic__02037F30
	b _02037EA8
_02037E74:
	ldr r1, _02037F24 ; =_0209B4AC
	mov r2, r5
	bl SprintfStatic__02037F30
	b _02037EA8
_02037E84:
	cmp r5, #0x20
	add r0, sp, #0
	bne _02037E9C
	ldr r1, _02037F28 ; =_0209B4B8
	bl SprintfStatic__02037F30
	b _02037EA8
_02037E9C:
	ldr r1, _02037F2C ; =_0209B4C0
	mov r2, r5
	bl SprintfStatic__02037F30
#endif
_02037EA8:
	add r0, sp, #0
	bl sub_020265A8
	cmp r0, #0xc
	rsble r0, r0, #0xc
	movgt r1, #0
	addle r0, r0, r0, lsr #31
	movle r1, r0, asr #1
	ldr r0, _02037F10 ; =_020AFDF0
	add r3, sp, #0
#ifdef JAPAN
	ldmia r0, {r2, r5}
#else
	ldr r2, [r0]
	ldr r5, [r0, #8]
#endif
	ldrb r2, [r2, #0x16]
	mov r0, r7
	ldr r2, [r5, r2, lsl #2]
	add r2, r2, r6
	ldrb r5, [r2, #4]
	ldrb r2, [r2, #5]
	add r1, r1, r5
	bl DrawTextInWindow
_02037EF4:
	add r4, r4, #1
_02037EF8:
	cmp r4, #0x54
#ifdef JAPAN
	blt _02037D20
#else
	bne _02037D20
#endif
	mov r0, r7
	bl UpdateWindow
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02037F10: .word _020AFDF0
_02037F14: .word 0x00000111
_02037F18: .word 0x00000109
_02037F1C: .word KEYBOARD_STRING_IDS
#ifdef JAPAN
_020381EC: .word 0x000031D8
_020381F0: .word 0x000031D9
_020381F4: .word _020B12A0_JP
_020381F8: .word _0209B4A4
#else
_02037F20: .word _0209B4A4
_02037F24: .word _0209B4AC
_02037F28: .word _0209B4B8
_02037F2C: .word _0209B4C0
#endif
	arm_func_end sub_02037CD8

	arm_func_start SprintfStatic__02037F30
SprintfStatic__02037F30: ; 0x02037F30
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02037F30

	arm_func_start sub_02037F58
sub_02037F58: ; 0x02037F58
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x108
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x114
#endif
	ldr r1, _020383DC ; =_0209B288
	mov sb, r0
	ldrb r2, [r1]
	ldrb r0, [r1, #1]
#ifdef JAPAN
	strb r2, [sp, #4]
	strb r0, [sp, #5]
#else
	mov sl, #0
	strb r2, [sp, #0x10]
	strb r0, [sp, #0x11]
#endif
	bl sub_02038ADC
	mov r0, sb
	bl sub_02027B1C
	ldr r0, _020383E0 ; =_020AFDF0
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #7
	addeq r0, r1, #0x100
#ifdef JAPAN
	moveq r1, #0
#else
	moveq r1, sl
#endif
	streqh r1, [r0, #0xa6]
	ldr r0, _020383E0 ; =_020AFDF0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrh r1, [r0, #0xa6]
	cmp r1, #0
	beq _02037FF8
#ifdef JAPAN
	add r0, sp, #6
#else
	add r0, sp, #0x12
#endif
	bl GetStringFromFileVeneer
	mov r0, sb
	bl GetWindow
	mov r4, r0
#ifdef JAPAN
	add r0, sp, #6
#else
	add r0, sp, #0x12
#endif
	bl sub_020265A8
	ldrb r1, [r4, #6]
	mov r2, #0
#ifdef JAPAN
	add r3, sp, #6
#else
	add r3, sp, #0x12
#endif
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	mov r0, sb
	bl DrawTextInWindow
_02037FF8:
	ldr r0, _020383E0 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #5
	moveq r8, #0x36
	movne r8, #0x22
	cmp r0, #7
	moveq r8, #0x36
	cmp r0, #8
	ldr r0, _020383E0 ; =_020AFDF0
	moveq r8, #0x36
	ldr r0, [r0]
	ldrb r5, [r0, #0x1b]
	ldr r4, [r0, #0xf8]
	bl sub_02038B5C
	cmp r0, #0
	beq _02038054
	mov r0, r4
	mov r1, r5
	bl sub_02038A8C
#ifdef JAPAN
_02038054:
#else
	cmp r0, #0x3c
	movgt r0, #1
	bgt _02038058
_02038054:
	mov r0, #0
_02038058:
	cmp r0, #0
	movne sl, #1
#endif
	mov r6, #0
	ldr r4, _020383E4 ; =_0209B3B4
	ldr fp, _020383E0 ; =_020AFDF0
	b _02038394
_02038070:
	ldr r1, [fp]
	add r0, r1, r6
	ldr r7, [r1, #0xc]
	ldrb r5, [r0, #0xfc]
	sub r0, r7, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _020382E8
_02038090: ; jump table
	b _0203825C ; case 0
	b _020380A8 ; case 1
	b _02038148 ; case 2
	b _020381FC ; case 3
	b _020380A8 ; case 4
	b _0203825C ; case 5
_020380A8:
	mov r0, r6
	mov r1, #0x12
	bl _s32_div_f
	cmp r1, #5
	ble _020380D0
	cmp r1, #0xc
#ifdef JAPAN
	movlt sl, #0x43
#else
	movlt r0, #0x43
	strlt r0, [sp, #8]
#endif
	movlt r7, #1
	blt _020380DC
_020380D0:
#ifdef JAPAN
	mov sl, #0x44
#else
	mov r0, #0x44
	str r0, [sp, #8]
#endif
	mov r7, #0
_020380DC:
	cmp r5, #0
	beq _02038114
	mov r0, r5
	bl sub_020251F0
#ifdef JAPAN
	and r1, sl, #0xff
	str r1, [sp]
	mov r3, r0
	mov r0, sb
	mov r1, r6, lsl #2
	ldrsh r1, [r4, r1]
	add r2, r4, r6, lsl #2
	ldrsh r2, [r2, #2]
	bl sub_020264F8
_02038114:
	add r0, sp, #4
#else
	ldr r1, [sp, #8]
	add r2, r4, r6, lsl #2
	and r1, r1, #0xff
	str r1, [sp]
	mov r1, r6, lsl #2
	mov r3, r0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r2, #2]
	mov r0, sb
	bl sub_020264F8
_02038114:
	add r0, sp, #0x10
#endif
	ldrsb r2, [r0, r7]
	mov r1, r6, lsl #2
	mov r0, sb
	str r2, [sp]
	ldrsh r3, [r4, r1]
	add r1, r4, r6, lsl #2
	ldrsh r2, [r1, #2]
	sub r1, r3, #1
	mov r3, #0xc
	add r2, r2, #0xc
	bl sub_02025D50
	b _02038390
_02038148:
	mov r0, r6
#ifdef JAPAN
	cmp r5, #2
#else
	cmp r5, #0x20
#endif
	mov r1, #0x11
	moveq r5, #0
	bl _s32_div_f
	cmp r1, #5
	blt _02038178
	cmp r1, #0xc
#ifdef JAPAN
	movlt sl, #0x43
#else
	movlt r0, #0x43
	strlt r0, [sp, #4]
#endif
	movlt r7, #1
	blt _02038184
_02038178:
#ifdef JAPAN
	mov sl, #0x44
#else
	mov r0, #0x44
	str r0, [sp, #4]
#endif
	mov r7, #0
_02038184:
	cmp r5, #0
	beq _020381C4
	mov r0, r5
	bl sub_020251F0
#ifdef JAPAN
	and r1, sl, #0xff
	str r1, [sp]
	ldr r1, _020383E8 ; =_0209B32C
	mov r2, r6, lsl #2
	ldrsh r1, [r1, r2]
	ldr r2, _020383E8 ; =_0209B32C
	mov r3, r0
	add r2, r2, r6, lsl #2
	ldrsh r2, [r2, #2]
	mov r0, sb
	bl sub_020264F8
_020381C4:
	add r0, sp, #4
#else
	ldr r1, [sp, #4]
	mov r2, r6, lsl #2
	and r1, r1, #0xff
	str r1, [sp]
	ldr r1, _020383E8 ; =_0209B32C
	mov r3, r0
	ldrsh r1, [r1, r2]
	ldr r2, _020383E8 ; =_0209B32C
	mov r0, sb
	add r2, r2, r6, lsl #2
	ldrsh r2, [r2, #2]
	bl sub_020264F8
_020381C4:
	add r0, sp, #0x10
#endif
	ldrsb r1, [r0, r7]
	mov r2, r6, lsl #2
	mov r0, sb
	str r1, [sp]
	ldr r1, _020383E8 ; =_0209B32C
	ldrsh r3, [r1, r2]
	add r1, r1, r6, lsl #2
	ldrsh r2, [r1, #2]
	sub r1, r3, #1
	mov r3, #0xc
	add r2, r2, #0xc
	bl sub_02025D50
	b _02038390
_020381FC:
	cmp r5, #0
#ifdef JAPAN
	moveq r5, #0xa
	cmp r5, #2
#else
	moveq r5, #0x2a
	cmp r5, #0x20
#endif
	moveq r5, #0
	cmp r5, #0
	beq _02038390
	mov r0, r5
	bl sub_020251F0
	mov r5, r0
	mov r0, r6
	mov r1, #0x12
	bl _s32_div_f
	mov r1, #0x44
	str r1, [sp]
	mov r1, #0x12
	mul r1, r0, r1
	add r0, r4, r1, lsl #2
	mov r1, r6, lsl #2
	ldrsh r2, [r0, #2]
	ldrsh r1, [r4, r1]
	mov r3, r5
	mov r0, sb
	bl sub_020264F8
	b _02038390
_0203825C:
#ifdef JAPAN
	cmp r5, #2
#else
	cmp r5, #0x20
#endif
	moveq r5, #0
	cmp r5, #0
	beq _020382AC
	ldr r1, _020383EC ; =_0209B2C4
	ldr r2, [fp]
#ifdef JAPAN
	mov r0, r5
	ldrb sl, [r1, r7]
	ldrsh r5, [r2, #0x20]
	bl sub_020251F0
	ldr r2, _020383F0 ; =_0209B2D0
#else
	ldrb r1, [r1, r7]
	mov r0, r5
	ldrsh r5, [r2, #0x20]
	str r1, [sp, #0xc]
	bl sub_020251F0
	ldr r2, _020383F0 ; =_0209B2D0
	ldr r1, [sp, #0xc]
#endif
	mov r3, #0x44
	str r3, [sp]
	mov r3, r0
	ldrb r2, [r2, r7]
#ifdef JAPAN
	add r1, sl, r5
#else
	add r1, r1, r5
#endif
	mov r0, sb
	bl sub_020264F8
_020382AC:
#ifdef JAPAN
	ldr r5, [fp]
	mov r2, #0x17
	ldr r1, [r5, #0xc]
	mov r0, sb
	str r2, [sp]
	ldr r2, _020383EC ; =_0209B2C4
	ldrsh r5, [r5, #0x20]
	ldrb r7, [r2, r1]
	ldr r2, _020383F0 ; =_0209B2D0
	mov r3, #0xc
	ldrb r2, [r2, r1]
	add r1, r7, r5
	add r2, r2, #0xc
	bl sub_02025D50
	b _02038390
_020382E8:
	ldr r1, [fp]
	ldr r0, _0203864C_JP ; =_020B12A0
	cmp r5, #2
	moveq r5, #0
	ldr r3, [r0, r5, lsl #2]
	add r1, r1, r6, lsl #1
	ldrsh r5, [r1, #0x20]
	ldr r1, _020383EC ; =_0209B2C4
	mov r0, sb
	ldrb sl, [r1, r7]
	ldr r1, _020383F0 ; =_0209B2D0
	ldrb r2, [r1, r7]
	add r1, sl, r5
	bl DrawTextInWindow
	ldr r5, [fp]
	mov r2, #0x17
	ldr r1, [r5, #0xc]
	mov r0, sb
	str r2, [sp]
	ldr r2, _020383EC ; =_0209B2C4
	ldrsh r5, [r5, #0x20]
	ldrb r7, [r2, r1]
	ldr r2, _020383F0 ; =_0209B2D0
	mov r3, #0x32
	ldrb r2, [r2, r1]
	add r1, r7, r5
	add r2, r2, #0xc
#else
	ldr r2, [fp]
	mov r1, #0x17
	ldr r5, [r2, #0xc]
	ldr r7, _020383F0 ; =_0209B2D0
	str r1, [sp]
	ldrsh r1, [r2, #0x20]
	ldr r2, _020383EC ; =_0209B2C4
	mov r0, sb
	ldrb r2, [r2, r5]
	ldrb r5, [r7, r5]
	mov r3, #0xc
	add r1, r2, r1
	add r2, r5, #0xc
	bl sub_02025D50
	b _02038390
_020382E8:
	cmp r5, #0x20
	moveq r5, #0
	cmp sl, #0
	mov r0, r5
	beq _02038314
	bl sub_020251F0
	mov r2, r0
	ldr r1, _020383F4 ; =_0209B4C4
	add r0, sp, #0x12
	bl SprintfStatic__02037F30
	b _02038328
_02038314:
	bl sub_020251F0
	mov r2, r0
	ldr r1, _020383F8 ; =_0209B4C0
	add r0, sp, #0x12
	bl sprintf
_02038328:
	ldr r1, [fp]
	ldr r3, _020383EC ; =_0209B2C4
	ldr r2, [r1, #0xc]
	add r1, r1, r6, lsl #1
	ldrb r5, [r3, r2]
	ldr r3, _020383F0 ; =_0209B2D0
	ldrsh r1, [r1, #0x20]
	ldrb r2, [r3, r2]
	mov r0, sb
	add r3, sp, #0x12
	add r1, r5, r1
	bl DrawTextInWindow
	ldr r2, [fp]
	mov r1, #0x17
	ldr r5, [r2, #0xc]
	ldr r7, _020383F0 ; =_0209B2D0
	str r1, [sp]
	ldrsh r1, [r2, #0x20]
	ldr r2, _020383EC ; =_0209B2C4
	mov r0, sb
	ldrb r2, [r2, r5]
	ldrb r5, [r7, r5]
	mov r3, #0x3c
	add r1, r2, r1
	add r2, r5, #0xc
#endif
	bl sub_02025D50
_02038390:
	add r6, r6, #1
_02038394:
	cmp r6, r8
	blt _02038070
	ldr r0, _020383E0 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #7
	bne _020383CC
#ifdef JAPAN
	ldrsb r4, [sp, #4]
#else
	ldrsb r4, [sp, #0x10]
#endif
	mov r0, sb
	mov r1, #3
	mov r2, #0x1d
	mov r3, #0xea
	str r4, [sp]
	bl sub_02025D50
_020383CC:
	mov r0, sb
	bl UpdateWindow
#ifdef JAPAN
	add sp, sp, #0x108
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	add sp, sp, #0x114
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_020383DC: .word _0209B288
_020383E0: .word _020AFDF0
_020383E4: .word _0209B3B4
_020383E8: .word _0209B32C
_020383EC: .word _0209B2C4
_020383F0: .word _0209B2D0
#ifdef JAPAN
_0203864C_JP: .word _020B12A0_JP
#else
_020383F4: .word _0209B4C4
_020383F8: .word _0209B4C0
#endif
	arm_func_end sub_02037F58

	arm_func_start sub_020383FC
sub_020383FC: ; 0x020383FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020384A8 ; =_020AFDF0
	mov r4, #0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	bne _02038444
	cmp r0, #0
	beq _02038444
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	beq _0203843C
	cmp r0, #1
#ifdef JAPAN
	beq _020386A0
	cmp r0, #2
#endif
	moveq r0, #2
	streqb r0, [r2, #0x18]
	b _02038444
_0203843C:
#ifdef JAPAN
	strb r4, [r2, #0x18]
	b _02038444
_020386A0:
#endif
	mov r0, #1
	strb r0, [r2, #0x18]
_02038444:
	ldr r7, _020384A8 ; =_020AFDF0
	mov r5, #0xa
	ldr r6, _020384AC ; =0x00000111
	b _02038484
_02038454:
	ldrb r0, [r0, #6]
	cmp r0, #1
	cmpne r0, #2
	cmpne r0, #3
	ldrneb r0, [r2, #0x10]
	cmpne r0, #0
	beq _02038480
	cmp r1, #0x100
	bge _02038480
	and r0, r1, #0xff
	bl sub_0204DA1C
_02038480:
	add r4, r4, #1
_02038484:
	ldr r2, [r7]
#ifdef JAPAN
	ldr r1, [r7, #4]
#else
	ldr r1, [r7, #8]
#endif
	ldrb r0, [r2, #0x16]
	ldr r0, [r1, r0, lsl #2]
	mla r0, r4, r5, r0
	ldrh r1, [r0, #8]
	cmp r1, r6
	bne _02038454
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020384A8: .word _020AFDF0
_020384AC: .word 0x00000111
	arm_func_end sub_020383FC

	arm_func_start sub_020384B0
sub_020384B0: ; 0x020384B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02038900 ; =_020AFDF0
	mov r0, #0xa
#ifdef JAPAN
	ldmia r2, {r1, r3}
#else
	ldr r1, [r2]
	ldr r3, [r2, #8]
#endif
	ldrb ip, [r1, #0x16]
	ldrb r2, [r1, #0x18]
	ldr r3, [r3, ip, lsl #2]
	mla r0, r2, r0, r3
	ldrh r4, [r0, #8]
#ifdef JAPAN
	sub r0, r4, #0x100
	cmp r0, #9
#else
	sub r0, r4, #0x104
	cmp r0, #5
#endif
	addls pc, pc, r0, lsl #2
	b _020387B4
_020384E8: ; jump table
#ifdef JAPAN
	b _02038770 ; case 0
	b _0203878C ; case 1
	b _02038500 ; case 2
	b _02038544 ; case 3
	b _02038830 ; case 4
	b _020387B4 ; case 5
	b _020387B4 ; case 6
	b _020385C0 ; case 7
	b _020385F0 ; case 8
	b _02038588 ; case 9
_02038770:
	mov r0, #0
	bl sub_0203935C
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
	b _020388F8
_0203878C:
	mov r0, #1
	bl sub_0203935C
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
	b _020388F8
#else
	b _02038500 ; case 0
	b _02038544 ; case 1
	b _020387B4 ; case 2
	b _020385C0 ; case 3
	b _020385F0 ; case 4
	b _02038588 ; case 5
#endif
_02038500:
	cmp ip, #0
	bne _02038514
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
_02038514:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02038900 ; =_020AFDF0
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x16]
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_02037CD8
	mov r0, #1
	bl sub_020383FC
	b _020388F8
_02038544:
	cmp ip, #1
	bne _02038558
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
_02038558:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02038900 ; =_020AFDF0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x16]
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_02037CD8
	mov r0, #1
	bl sub_020383FC
	b _020388F8
#ifdef JAPAN
_02038830:
	cmp ip, #2
	bne _02038844
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
_02038844:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02038900 ; =_020AFDF0
	mov r2, #2
	ldr r1, [r0]
	strb r2, [r1, #0x16]
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_02037CD8
	mov r0, #1
	bl sub_020383FC
	b _020388F8
#endif
_02038588:
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	moveq r2, #1
	movne r2, #0
	mov r0, #4
	strb r2, [r1, #0x15]
	bl PlaySeVolumeWrapper
	mov r0, #0
	bl sub_020383FC
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_02037CD8
	b _020388F8
_020385C0:
	ldrsb r0, [r1]
	bl sub_02037F58
	bl sub_02038904
	cmp r0, #0
	beq _020388F8
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #8
	bne _020388F8
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_020385F0:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r1, #0xc]
	cmp r0, #7
	bne _02038680
	bl sub_02038A54
	movs r4, r0
	beq _02038680
	cmp r4, #0x12
	bge _02038680
	mov r0, #2
	bl PlaySeVolumeWrapper
#ifdef JAPAN
	mov r1, #2
#else
	mov r1, #0x20
#endif
	ldr r0, _02038900 ; =_020AFDF0
	b _0203864C
_02038634:
	ldr r2, [r0]
	ldr r3, [r2, #0xf8]
	ldrb r2, [r3, r4]
	cmp r2, #0
	streqb r1, [r3, r4]
	add r4, r4, #1
_0203864C:
	cmp r4, #0x12
	bne _02038634
	ldr r0, _02038900 ; =_020AFDF0
	mov r1, #0x12
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	bl sub_02038ADC
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02038680:
	ldr r0, _02038900 ; =_020AFDF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x16e]
	ldrb r5, [r1, #0x10]
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	ldr r0, [r1, #0xc]
	and r4, r2, #0xff
	cmp r0, #8
	moveq r5, #0
	bl sub_02038A54
	cmp r0, #0
	beq _020386E8
	cmp r5, #1
	bne _020386E8
	bl sub_02038A54
	ldr r1, _02038900 ; =_020AFDF0
	ldr r1, [r1]
	ldrb r1, [r1, #0x1b]
	cmp r1, r0
	beq _020386E8
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_020386E8:
	cmp r4, #0
	bne _020386FC
	bl sub_02038A54
	cmp r0, #0
	beq _0203871C
_020386FC:
	cmp r5, #0
	beq _0203872C
	bl sub_02038A54
	ldr r1, _02038900 ; =_020AFDF0
	ldr r1, [r1]
	ldrb r1, [r1, #0x1b]
	cmp r1, r0
	beq _0203872C
_0203871C:
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0203872C:
	bl sub_02038B5C
	cmp r0, #0
	beq _02038760
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrb r1, [r0, #0x1b]
	ldr r0, [r0, #0xf8]
	bl sub_02038A8C
	cmp r0, #0x3c
	ble _02038760
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
_02038760:
	mov r0, #0
	bl PlaySeVolumeWrapper
	cmp r4, #0
	beq _02038794
	bl sub_02038A54
	cmp r0, #0
	bne _02038794
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	add r1, r0, #0x6e
	ldr r0, [r0, #0xf8]
	add r1, r1, #0x100
	bl StrcpySimple
_02038794:
	ldr r0, _02038900 ; =_020AFDF0
	ldr r1, [r0]
	ldrb r2, [r1, #0x1b]
	ldr r0, [r1, #0x134]
	ldr r1, [r1, #0xf8]
	bl MemcpySimple
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_020387B4:
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	ldrne r0, [r1, #0xc]
	cmpne r0, #8
	beq _020387E4
	and r0, r4, #0xff
	bl sub_0204DA1C
	cmp r0, #0xff
	bne _02038810
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
_020387E4:
#ifndef JAPAN
	ldr r0, [r1, #0xc]
	cmp r0, #9
	bne _02038810
	and r0, r4, #0xff
	cmp r0, #0x41
	blo _02038804
	cmp r0, #0x5a
	bls _02038810
_02038804:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020388F8
#endif
_02038810:
	ldr r0, _02038900 ; =_020AFDF0
	ldr r2, [r0]
	ldrb r1, [r2, #0x15]
	cmp r1, #1
	bne _020388A4
	ldr r1, [r2, #0xc]
	cmp r1, #7
	bne _02038870
	ldrb r1, [r2, #0x1c]
	cmp r1, #0x11
	bhi _02038870
	beq _020388A4
	mov r3, #0x10
	b _0203885C
_02038848:
	ldr r2, [r2, #0xf8]
	ldrb r1, [r2, r3]
	add r2, r2, r3
	sub r3, r3, #1
	strb r1, [r2, #1]
_0203885C:
	ldr r2, [r0]
	ldrb r1, [r2, #0x1c]
	cmp r3, r1
	bge _02038848
	b _020388A4
_02038870:
	ldrb r0, [r2, #0x1b]
	sub r3, r0, #2
	ldr r0, _02038900 ; =_020AFDF0
	b _02038894
_02038880:
	ldr r2, [r2, #0xf8]
	ldrb r1, [r2, r3]
	add r2, r2, r3
	sub r3, r3, #1
	strb r1, [r2, #1]
_02038894:
	ldr r2, [r0]
	ldrb r1, [r2, #0x1c]
	cmp r3, r1
	bge _02038880
_020388A4:
	ldr r0, _02038900 ; =_020AFDF0
	ldr r2, [r0]
	ldrb r1, [r2, #0x1c]
	ldr r2, [r2, #0xf8]
	strb r4, [r2, r1]
	ldr r2, [r0]
	ldrb r0, [r2, #0x1b]
	ldrb r1, [r2, #0x1c]
	sub r0, r0, #1
	cmp r1, r0
	addlt r0, r1, #1
	strltb r0, [r2, #0x1c]
	movge r0, #5
	strgeb r0, [r2, #0x18]
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_02038ADC
	ldr r0, _02038900 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
_020388F8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02038900: .word _020AFDF0
	arm_func_end sub_020384B0

	arm_func_start sub_02038904
sub_02038904: ; 0x02038904
	stmdb sp!, {r3, lr}
	ldr r0, _02038A50 ; =_020AFDF0
	ldr r3, [r0]
	ldrb r2, [r3, #0x1c]
	ldr r1, [r3, #0xf8]
	ldrb r1, [r1, r2]
	cmp r1, #0
	bne _02038978
	cmp r2, #0
	bne _0203893C
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
_0203893C:
	sub r1, r2, #1
	strb r1, [r3, #0x1c]
	ldr r0, [r0]
	mov r3, #0
	ldrb r1, [r0, #0x1c]
	ldr r2, [r0, #0xf8]
	mov r0, #1
	strb r3, [r2, r1]
	bl PlaySeVolumeWrapper
	ldr r0, _02038A50 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
	bl sub_02038ADC
	b _02038A48
_02038978:
	bl sub_02038A54
	ldr r1, _02038A50 ; =_020AFDF0
	sub r0, r0, #1
	ldr r2, [r1]
	mov ip, #0
	ldr r1, [r2, #0xc]
	cmp r1, #7
	bne _020389EC
	ldrb lr, [r2, #0x1c]
	cmp lr, #0x11
	bhi _020389EC
	cmp r0, #0x11
	movge r0, #0x11
#ifdef JAPAN
	movge ip, #2
#else
	movge ip, #0x20
#endif
	ldr r1, _02038A50 ; =_020AFDF0
	b _020389D0
_020389B8:
	ldr r2, [r1]
	ldr r3, [r2, #0xf8]
	add r2, r3, lr
	ldrb r2, [r2, #1]
	strb r2, [r3, lr]
	add lr, lr, #1
_020389D0:
	cmp lr, r0
	blt _020389B8
	ldr r1, _02038A50 ; =_020AFDF0
	ldr r1, [r1]
	ldr r1, [r1, #0xf8]
	strb ip, [r1, r0]
	b _02038A2C
_020389EC:
	ldrb ip, [r2, #0x1c]
	ldr r1, _02038A50 ; =_020AFDF0
	b _02038A10
_020389F8:
	ldr r2, [r1]
	ldr r3, [r2, #0xf8]
	add r2, r3, ip
	ldrb r2, [r2, #1]
	strb r2, [r3, ip]
	add ip, ip, #1
_02038A10:
	cmp ip, r0
	blt _020389F8
	ldr r1, _02038A50 ; =_020AFDF0
	mov r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0xf8]
	strb r2, [r1, r0]
_02038A2C:
	mov r0, #1
	bl PlaySeVolumeWrapper
	ldr r0, _02038A50 ; =_020AFDF0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02037F58
	bl sub_02038ADC
_02038A48:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02038A50: .word _020AFDF0
	arm_func_end sub_02038904

	arm_func_start sub_02038A54
sub_02038A54: ; 0x02038A54
	ldr r1, _02038A88 ; =_020AFDF0
	mov r0, #0
	ldr r2, [r1]
	ldrb r3, [r2, #0x1b]
	b _02038A7C
_02038A68:
	ldr r1, [r2, #0xf8]
	ldrb r1, [r1, r0]
	cmp r1, #0
	bxeq lr
	add r0, r0, #1
_02038A7C:
	cmp r0, r3
	blt _02038A68
	bx lr
	.align 2, 0
_02038A88: .word _020AFDF0
	arm_func_end sub_02038A54

	arm_func_start sub_02038A8C
sub_02038A8C: ; 0x02038A8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, r0
	mov r6, r1
	mov r5, r4
	b _02038ACC
_02038AA4:
	ldrb r0, [r7, r5]
	cmp r0, #0
	beq _02038AD4
	bl sub_020251F0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02025C7C
#ifdef JAPAN
	ldrsh r0, [r0, #6]
#else
	ldrb r0, [r0, #2]
#endif
	add r5, r5, #1
	add r4, r4, r0
_02038ACC:
	cmp r5, r6
	blt _02038AA4
_02038AD4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02038A8C

	arm_func_start sub_02038ADC
sub_02038ADC: ; 0x02038ADC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r4
	ldr r6, _02038B58 ; =_020AFDF0
	b _02038B44
_02038AF0:
	add r0, r1, r5, lsl #1
	strh r4, [r0, #0x20]
	ldr r1, [r6]
	ldr r0, [r1, #0xf8]
	ldrb r0, [r0, r5]
	cmp r0, #0
	addeq r0, r1, r5, lsl #1
	moveq r1, #8
	streqh r1, [r0, #0x8c]
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020251F0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02025C7C
	ldr r1, [r6]
#ifdef JAPAN
	ldrsh r2, [r0, #6]
#else
	ldrb r2, [r0, #2]
#endif
	add r1, r1, r5, lsl #1
	add r5, r5, #1
	strh r2, [r1, #0x8c]
#ifdef JAPAN
	ldrsh r0, [r0, #6]
#else
	ldrb r0, [r0, #2]
#endif
	add r4, r4, r0
_02038B44:
	ldr r1, [r6]
	ldrb r0, [r1, #0x1b]
	cmp r5, r0
	blt _02038AF0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02038B58: .word _020AFDF0
	arm_func_end sub_02038ADC

	arm_func_start sub_02038B5C
sub_02038B5C: ; 0x02038B5C
	ldr r0, _02038B7C ; =_020AFDF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #3
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02038B7C: .word _020AFDF0
	arm_func_end sub_02038B5C

	arm_func_start sub_02038B80
sub_02038B80: ; 0x02038B80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _02039068 ; =_020AFDF0
	mov sb, r0
	ldr r7, [r2]
	mov r8, r1
	ldrb r3, [r7, #0x10]
	ldr ip, [r7, #0xc]
	mov r2, #1
	cmp ip, #7
	moveq r3, r2
	cmp r3, #0
	ldr r4, _0203906C ; =_0209B2E0
	movne r2, #2
	ldr r1, _02039070 ; =_0209B2E1
	ldr r0, _02039074 ; =_0209B2E2
	ldrb r4, [r4, r2, lsl #4]
	ldr lr, _02039078 ; =0x0000FFFF
	ldr r5, _0203907C ; =_0209B2E3
	cmp sb, lr
	ldrb r1, [r1, r2, lsl #4]
	ldrb r0, [r0, r2, lsl #4]
	ldrb r2, [r5, r2, lsl #4]
	mov r4, r4, lsl #3
	mov r5, r1, lsl #3
	add r0, r4, r0, lsl #3
	cmpne r8, lr
	add r1, r5, r2, lsl #3
	mvneq r0, #0
	beq _02039060
	add r2, r1, #8
	cmp r8, r2
	bge _02038FA0
	cmp r3, #0
	beq _02038CEC
	add r1, r5, #8
	cmp r8, r1
	sublt r0, lr, #0x10000
	blt _02039060
	cmp r8, r2
	subgt r0, lr, #0x10000
	bgt _02039060
	sub r1, r4, #4
	cmp sb, r1
	sublt r0, lr, #0x10000
	blt _02039060
	add r0, r0, #4
	cmp sb, r0
	subgt r0, lr, #0x10000
	bgt _02039060
	cmp ip, #5
	beq _02038C5C
	sub r0, ip, #7
	cmp r0, #1
	bhi _02038CA0
_02038C5C:
	add r0, r4, #3
	sub sb, sb, r0
	cmp sb, #0
	movle sb, #1
	cmp sb, #0xea
	movge sb, #0xe9
	mov r0, sb
	mov r1, #0xd
	bl _s32_div_f
	add r1, r5, #0x1e
	mov r6, r0
	cmp r8, r1
	addgt r6, r6, #0x12
	add r0, r5, #0x2d
	cmp r8, r0
	addgt r6, r6, #0x12
	b _02038D88
_02038CA0:
	add r0, r4, #6
	sub sb, sb, r0
	cmp sb, #0
	movle sb, #1
	cmp sb, #0xe5
	movge sb, #0xe4
	cmp sb, #0xaa
	subgt sb, sb, #8
	bgt _02038CCC
	cmp sb, #0x4b
	subgt sb, sb, #4
_02038CCC:
	mov r0, sb
	mov r1, #0xd
	bl _s32_div_f
	add r1, r5, #0x24
	mov r6, r0
	cmp r8, r1
	addgt r6, r6, #0x11
	b _02038D88
_02038CEC:
	bl sub_02038A54
	ldr r1, _02039068 ; =_020AFDF0
	ldr r3, _02039080 ; =_0209B2C4
	ldr r1, [r1]
	ldr r7, [r1, #0xc]
	ldrb r2, [r1, #0x1b]
	ldrb r3, [r3, r7]
	cmp r0, r2
	subeq r0, r0, #1
	add r2, r5, #0x16
	cmp r8, r2
	add r2, r2, #0x20
	add r3, r4, r3
	mvnlt r0, #0
	blt _02039060
	cmp r8, r2
	mvngt r0, #0
	bgt _02039060
	sub r2, r3, #4
	cmp sb, r2
	mvnlt r0, #0
	blt _02039060
	add r2, r3, #0x68
	cmp sb, r2
	mvngt r0, #0
	bgt _02039060
	sub r5, sb, r3
	mov r4, #0
	b _02038D80
_02038D60:
	add r2, r1, r4, lsl #1
	ldrsh r3, [r2, #0x20]
	ldrsh r2, [r2, #0x8c]
	mov r6, r4
	add r2, r3, r2
	cmp r5, r2
	blt _02038D88
	add r4, r4, #1
_02038D80:
	cmp r4, r0
	ble _02038D60
_02038D88:
	bl sub_02038A54
	cmp r6, r0
	bgt _02038F98
	ldr r0, _02039068 ; =_020AFDF0
	ldr r1, [r0]
	strb r6, [r1, #0x1d]
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetWindow
	mov r4, r0
	bl sub_02038ADC
	ldr r0, _02039068 ; =_020AFDF0
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	sub r0, r1, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02038F30
_02038DD0: ; jump table
	b _02038ED8 ; case 0
	b _02038DE8 ; case 1
	b _02038E60 ; case 2
	b _02038DE8 ; case 3
	b _02038DE8 ; case 4
	b _02038ED8 ; case 5
_02038DE8:
	ldr r0, _02039084 ; =_0209B28C
	ldr r5, _02039088 ; =_0209B2D0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	ldr sb, _02039080 ; =_0209B2C4
	ldrb r2, [r4, #5]
	ldrb r0, [r4, #4]
	ldr r3, _0203908C ; =_0209B3B6
	mov r8, r6, lsl #2
	ldr r7, _02039090 ; =_0209B3B4
	ldrb r4, [r5, r1]
	ldrsh r3, [r3, r8]
	ldrb r1, [sb, r1]
	ldrsh r5, [r7, r8]
	add r3, r4, r3
	sub r2, r2, #1
	add r2, r3, r2, lsl #3
	sub r2, r2, #0xe
	mov r2, r2, lsl #0x10
	add r1, r1, r5
	sub r0, r0, #1
	add r0, r1, r0, lsl #3
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r2, asr #0x10
	mov r2, #0xc
	mov r3, #0xb
	bl sub_0202A2A4
	b _02038F90
_02038E60:
	ldr r0, _02039084 ; =_0209B28C
	ldr r5, _02039088 ; =_0209B2D0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	ldr sb, _02039080 ; =_0209B2C4
	ldrb r2, [r4, #5]
	ldrb r0, [r4, #4]
	ldr r3, _02039094 ; =_0209B32E
	mov r8, r6, lsl #2
	ldr r7, _02039098 ; =_0209B32C
	ldrb r4, [r5, r1]
	ldrsh r3, [r3, r8]
	ldrb r1, [sb, r1]
	ldrsh r5, [r7, r8]
	add r3, r4, r3
	sub r2, r2, #1
	add r2, r3, r2, lsl #3
	sub r2, r2, #0xe
	mov r2, r2, lsl #0x10
	add r1, r1, r5
	sub r0, r0, #1
	add r0, r1, r0, lsl #3
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r2, asr #0x10
	mov r2, #0xc
	mov r3, #0xb
	bl sub_0202A2A4
	b _02038F90
_02038ED8:
	ldr r0, _02039084 ; =_0209B28C
	ldr r2, _02039080 ; =_0209B2C4
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	ldr r0, _02039088 ; =_0209B2D0
	ldrb r5, [r2, r1]
	ldrsh r3, [r3, #0x20]
	ldrb r2, [r4, #4]
	ldrb r1, [r0, r1]
	ldrb r0, [r4, #5]
	add r3, r5, r3
	add r2, r3, r2, lsl #3
	add r1, r1, r0, lsl #3
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	mov r2, #0xc
	mov r3, #0xb
	bl sub_0202A2A4
	b _02038F90
_02038F30:
	ldr r0, _02039068 ; =_020AFDF0
	ldr r2, _02039080 ; =_0209B2C4
	ldr r5, [r0]
	ldr r3, _02039084 ; =_0209B28C
	mov r0, #0x40
	str r3, [sp]
	str r0, [sp, #4]
	add r5, r5, r6, lsl #1
	ldr r0, _02039088 ; =_0209B2D0
	ldrb r7, [r2, r1]
	ldrsh r3, [r5, #0x20]
	ldrb r2, [r4, #4]
	ldrb r1, [r0, r1]
	ldrb r0, [r4, #5]
	add r3, r7, r3
	add r2, r3, r2, lsl #3
	add r1, r1, r0, lsl #3
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	ldrsh r2, [r5, #0x8c]
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	mov r3, #0xb
	bl sub_0202A2A4
_02038F90:
	add r0, r6, #0x64
	b _02039060
_02038F98:
	mvn r0, #0
	b _02039060
_02038FA0:
	cmp r8, #0x60
	blt _02038FB0
	cmp r8, #0xb8
	ble _02038FB8
_02038FB0:
	mvn r0, #0
	b _02039060
_02038FB8:
	cmp r8, #8
	sublt r0, lr, #0x10000
	blt _02039060
	cmp r8, #0xf8
	subgt r0, lr, #0x10000
	bgt _02039060
	cmp sb, #8
	sublt r0, lr, #0x10000
	blt _02039060
	cmp sb, #0xf8
	subgt r0, lr, #0x10000
	bgt _02039060
	cmp sb, #0x23
	movle sb, #0x24
	cmp sb, #0xf5
	movge sb, #0xf4
	cmp r8, #0x63
	movle r8, #0x64
	cmp r8, #0xb1
	movge r8, #0xb0
	sub r0, r8, #0x63
	mov r1, #0xd
	bl _s32_div_f
	mov r4, r0
	sub r0, sb, #0x23
	mov r1, #0xf
	bl _s32_div_f
	mov r1, #6
	ldr r2, _02039068 ; =_020AFDF0
	mla r0, r1, r0, r4
	ldrb r3, [r7, #0x16]
#ifdef JAPAN
	ldr r2, [r2, #4]
#else
	ldr r2, [r2, #8]
#endif
	mov r1, #0xa
	ldr r2, [r2, r3, lsl #2]
	mla r2, r0, r1, r2
	ldrh r2, [r2, #8]
	cmp r2, #0x110
	subeq r0, r1, #0xb
	beq _02039060
	ldrb r2, [r7, #0x1e]
	cmp r2, #0
	subne r0, r1, #0xb
_02039060:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02039068: .word _020AFDF0
_0203906C: .word _0209B2E0
_02039070: .word _0209B2E1
_02039074: .word _0209B2E2
_02039078: .word 0x0000FFFF
_0203907C: .word _0209B2E3
_02039080: .word _0209B2C4
_02039084: .word _0209B28C
_02039088: .word _0209B2D0
_0203908C: .word _0209B3B6
_02039090: .word _0209B3B4
_02039094: .word _0209B32E
_02039098: .word _0209B32C
	arm_func_end sub_02038B80

#ifdef JAPAN
	arm_func_start sub_0203935C
sub_0203935C: ; 0x0203935C
	stmdb sp!, {r3, lr}
	ldr r1, _0203942C_JP ; =_020AFDF0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02039380
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
_02039380:
	ldrb r3, [r2, #0x1c]
	ldr r2, [r2, #0xf8]
	ldrb r1, [r2, r3]
	cmp r1, #0
	bne _020393F0
	cmp r3, #0
	bne _020393A8
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
_020393A8:
	add r1, r2, r3
	ldrb r1, [r1, #-1]
	bl sub_02039430
	ldr r1, _0203942C_JP ; =_020AFDF0
	ldr r2, [r1]
	ldr r1, [r2, #0xf8]
	ldrb r2, [r2, #0x1c]
	sub r3, r1, #1
	ldrb r1, [r3, r2]
	cmp r0, r1
	beq _020393E4
	strb r0, [r3, r2]
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
_020393E4:
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
_020393F0:
	bl sub_02039430
	ldr r1, _0203942C_JP ; =_020AFDF0
	ldr r1, [r1]
	ldrb r2, [r1, #0x1c]
	ldr r3, [r1, #0xf8]
	ldrb r1, [r3, r2]
	cmp r0, r1
	beq _02039420
	strb r0, [r3, r2]
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
_02039420:
	mov r0, #2
	bl PlaySeVolumeWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203942C_JP: .word _020AFDF0
	arm_func_end sub_0203935C

	arm_func_start sub_02039430
sub_02039430: ; 0x02039430
	cmp r0, #0
	beq _02039454
	cmp r0, #1
	beq _02039464
	cmp r0, #2
	ldreq r0, _02039474 ; =_0209C29E_JP
	addeq r1, r1, r1, lsl #1
	ldreqb r0, [r0, r1]
	bx lr
_02039454:
	ldr r0, _02039478 ; =_0209C29C_JP
	add r1, r1, r1, lsl #1
	ldrb r0, [r0, r1]
	bx lr
_02039464:
	ldr r0, _0203947C ; =_0209C29D_JP
	add r1, r1, r1, lsl #1
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02039474: .word _0209C29E_JP
_02039478: .word _0209C29C_JP
_0203947C: .word _0209C29D_JP
	arm_func_end sub_02039430
#endif

	arm_func_start sub_0203909C
sub_0203909C: ; 0x0203909C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x9c
	mov r6, r0
	mov r4, #0
	mov r0, #0x4c
	mov r1, #8
	mov r5, r4
	bl MemAlloc
#ifdef JAPAN
	ldr r2, _02039208 ; =_020AFE40
	mov r1, r4
	str r0, [r2]
	str r1, [r0, #8]
	ldr r0, [r2]
	sub r3, r1, #2
	strb r1, [r0, #0xc]
	ldr r0, [r2]
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #1]
	ldr r0, [r2]
	strb r3, [r0, #2]
	ldr r0, [r2]
	str r1, [r0, #0x10]
	ldr r0, _02039608 ; =0x00008140
	b _02039118
_020394E4:
	add r2, r6, r1
	ldrb r3, [r6, r1]
	ldrb r2, [r2, #1]
	cmp r3, #0
	orr r2, r2, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	beq _02039120
	cmp r2, r0
	addeq r4, r4, #1
	add r5, r5, #1
	add r1, r1, #2
_02039118:
	cmp r1, #0x36
	bne _020394E4
#else
	ldr r1, _02039208 ; =_020AFE40
	mov r3, r4
	str r0, [r1]
	str r3, [r0, #8]
	ldr r0, [r1]
	sub r2, r3, #2
	strb r3, [r0, #0xc]
	ldr r0, [r1]
	strb r2, [r0]
	ldr r0, [r1]
	strb r2, [r0, #1]
	ldr r0, [r1]
	strb r2, [r0, #2]
	ldr r0, [r1]
	str r3, [r0, #0x10]
	b _02039118
_020390FC:
	ldrb r0, [r6, r3]
	cmp r0, #0
	beq _02039120
	cmp r0, #0x20
	addeq r4, r4, #1
	add r5, r5, #1
	add r3, r3, #1
_02039118:
	cmp r3, #0x36
	blt _020390FC
#endif
_02039120:
	cmp r5, r4
	ldreq r0, _02039208 ; =_020AFE40
	moveq r1, #1
	ldreq r0, [r0]
	mov r3, #0
	streqb r1, [r0, #0xc]
	ldr r0, _02039208 ; =_020AFE40
_0203913C:
	ldr r1, [r0]
	ldrb r2, [r6, r3]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0x14]
	cmp r3, #0x36
	blt _0203913C
	ldr r0, _02039208 ; =_020AFE40
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _020391C0
	ldr r0, _0203920C ; =_0209B4D4
	mov r2, #1
	ldr r1, _02039210 ; =sub_0203939C
	str r2, [sp, #4]
	bl CreateTextBox
	ldr r1, _02039208 ; =_020AFE40
	ldr r3, _02039214 ; =_0209B4E4
	ldr r1, [r1]
	add r2, sp, #4
	strb r0, [r1]
	mov r0, #0
	mov r1, #0x31
	str r0, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02039208 ; =_020AFE40
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #4]
	b _020391FC
_020391C0:
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _02039208 ; =_020AFE40
#ifdef JAPAN
	ldr r2, _02039618 ; =0x000031D7
	ldr r4, [r3]
	mov r1, #0x218
#else
	mov r1, #0x218
	ldr r4, [r3]
	sub r2, r1, #0xf3
#endif
	strb r0, [r4, #2]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #2]
	bl ShowStringIdInDialogueBox
	ldr r0, _02039208 ; =_020AFE40
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
_020391FC:
	mov r0, #1
	add sp, sp, #0x9c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02039208: .word _020AFE40
#ifdef JAPAN
_02039608: .word 0x00008140
#endif
_0203920C: .word _0209B4D4
_02039210: .word sub_0203939C
_02039214: .word _0209B4E4
#ifdef JAPAN
_02039618: .word 0x000031D7
#endif
	arm_func_end sub_0203909C

	arm_func_start sub_02039218
sub_02039218: ; 0x02039218
	stmdb sp!, {r3, lr}
	ldr r0, _02039300 ; =_020AFE40
	ldr r0, [r0]
	cmp r0, #0
	beq _020392F8
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0203924C
	cmp r1, #1
	beq _02039290
	cmp r1, #0xb
	beq _020392C4
	b _020392DC
_0203924C:
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _02039270
	bl sub_0202F954
	ldr r0, _02039300 ; =_020AFE40
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202836C
_02039270:
	ldr r0, _02039300 ; =_020AFE40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _020392DC
	bl CloseSimpleMenu
	b _020392DC
_02039290:
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _020392A4
	bl CloseTextBox
_020392A4:
	ldr r0, _02039300 ; =_020AFE40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _020392DC
	bl CloseDialogueBox
	b _020392DC
_020392C4:
	bl MemFree
	ldr r0, _02039300 ; =_020AFE40
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020392DC:
	ldr r1, _02039300 ; =_020AFE40
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #8]
	add r1, r1, #1
	str r1, [r2, #8]
	ldmia sp!, {r3, pc}
_020392F8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02039300: .word _020AFE40
	arm_func_end sub_02039218

	arm_func_start sub_02039304
sub_02039304: ; 0x02039304
	ldr r0, _02039318 ; =_020AFE40
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_02039318: .word _020AFE40
	arm_func_end sub_02039304

	arm_func_start sub_0203931C
sub_0203931C: ; 0x0203931C
	stmdb sp!, {r3, lr}
	ldr r0, _02039398 ; =_020AFE40
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #1
	bne _0203934C
	ldrsb r0, [r1, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02039390
	mov r0, #1
	ldmia sp!, {r3, pc}
_0203934C:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _0203937C
	ldrsb r0, [r1, #1]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02039390
	ldr r0, _02039398 ; =_020AFE40
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl GetSimpleMenuResult__0202B870
	ldmia sp!, {r3, pc}
_0203937C:
	ldrsb r0, [r1, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_02039390:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02039398: .word _020AFE40
	arm_func_end sub_0203931C

	arm_func_start sub_0203939C
sub_0203939C: ; 0x0203939C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x254
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _02039428 ; =_020AFE40
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	add r0, sp, #0x54
	bne _020393D4
	ldr r1, _0203942C ; =_0209B4FC
	add r2, r2, #0x14
	bl SprintfStatic__02039438
	b _020393E0
_020393D4:
	ldr r1, _02039430 ; =_0209B50C
	add r2, r2, #0x14
	bl SprintfStatic__02039438
_020393E0:
	add r0, sp, #0x54
	str r0, [sp, #0x3c]
	add ip, sp, #4
#ifdef JAPAN
	ldr r2, _02039838 ; =0x000031D6
#endif
	ldr r3, _02039434 ; =0x0000C402
	add r0, sp, #0x154
	mov r1, #0x400
#ifndef JAPAN
	mov r2, #0x124
#endif
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x154
	mov r0, r4
	mov r1, #4
	mov r2, #3
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x254
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02039428: .word _020AFE40
_0203942C: .word _0209B4FC
_02039430: .word _0209B50C
#ifdef JAPAN
_02039838: .word 0x000031D6
#endif
_02039434: .word 0x0000C402
	arm_func_end sub_0203939C

	arm_func_start SprintfStatic__02039438
SprintfStatic__02039438: ; 0x02039438
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02039438

	arm_func_start sub_02039460
sub_02039460: ; 0x02039460
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r1, _02039514 ; =_020AFE58
	mov r4, r0
	str r4, [r1]
	ldr r0, [r4, #0x10]
	add ip, sp, #8
	cmp r0, #0x10
	blt _020394C8
	and r1, r0, #0xf
	ldr r0, _02039518 ; =_0209C5C0
	str r1, [r4, #0x10]
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, [r4, #0x18]
	mov r2, #0
	strb r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r1, _0203951C ; =0x00001007
	strb r0, [sp, #0xd]
	str r2, [sp]
	ldr r3, _02039520 ; =sub_02039C14
	mov r0, ip
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
	b _02039500
_020394C8:
	ldr r0, _02039524 ; =_0209C5D0
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, [r4, #0x18]
	mov r2, #0
	strb r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r1, _0203951C ; =0x00001007
	strb r0, [sp, #0xd]
	str r2, [sp]
	ldr r3, _02039520 ; =sub_02039C14
	mov r0, ip
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
_02039500:
	strb r0, [r4, #0x14]
	mov r0, r4
	bl sub_020395CC
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.align 2, 0
_02039514: .word _020AFE58
_02039518: .word _0209C5C0
_0203951C: .word 0x00001007
_02039520: .word sub_02039C14
_02039524: .word _0209C5D0
	arm_func_end sub_02039460

	arm_func_start sub_02039528
sub_02039528: ; 0x02039528
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	ldr r1, _020395C8 ; =_020AFE58
	str r5, [r1]
	bl sub_020396E4
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020395AC
_0203954C: ; jump table
	b _020395AC ; case 0
	b _020395AC ; case 1
	b _02039584 ; case 2
	b _0203955C ; case 3
_0203955C:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldrsb r0, [r5, #0x14]
	bl sub_0202836C
	ldrsb r0, [r5, #0x14]
	bl SetAdvancedTextBoxState5
	ldrsb r0, [r5, #0x14]
	bl CloseAdvancedTextBox
	ldr r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
_02039584:
	ldrsb r0, [r5, #0x14]
	bl sub_0202836C
	ldrsb r0, [r5, #0x14]
	bl SetAdvancedTextBoxState5
	ldrsb r0, [r5, #0x14]
	bl CloseAdvancedTextBox
	mov r0, #1
	bl PlaySeVolumeWrapper
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020395AC:
	ldr r0, [r5]
	cmp r4, r0
	beq _020395C0
	ldrsb r0, [r5, #0x14]
	bl SetAdvancedTextBoxField0x1C2
_020395C0:
	mvn r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020395C8: .word _020AFE58
	arm_func_end sub_02039528

	arm_func_start sub_020395CC
sub_020395CC: ; 0x020395CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	ldr r1, _0203967C ; =_020AFE58
	mov r4, r0
	str r4, [r1]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	add r0, sp, #0
	bl sub_02039680
	ldr r0, [r4, #0x10]
	add r1, sp, #0
	strb r0, [r4, #0x29]
	b _0203960C
_02039600:
	ldrb r0, [r4, #0x29]
	sub r0, r0, #1
	strb r0, [r4, #0x29]
_0203960C:
	ldrb r2, [r4, #0x29]
	add r0, r1, r2, lsl #2
	ldr r0, [r0, #-4]
	cmp r0, #0
	bne _02039628
	cmp r2, #1
	bhi _02039600
_02039628:
	ldr r1, [r4, #4]
	add r0, sp, #0
	str r1, [r4]
	ldr r2, [r4, #0x10]
	bl sub_02039680
	ldrb r0, [r4, #0x29]
	add r1, sp, #0
	sub r0, r0, #1
	strb r0, [r4, #0x28]
	b _0203965C
_02039650:
	ldrb r0, [r4, #0x28]
	sub r0, r0, #1
	strb r0, [r4, #0x28]
_0203965C:
	ldrb r2, [r4, #0x28]
	ldr r0, [r1, r2, lsl #2]
	cmp r0, #0
	bne _02039674
	cmp r2, #0
	bne _02039650
_02039674:
	add sp, sp, #0x28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203967C: .word _020AFE58
	arm_func_end sub_020395CC

	arm_func_start sub_02039680
sub_02039680: ; 0x02039680
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	cmp sb, #0
	movgt r6, #1
	mov r5, #0xa
	mov sl, r0
	mov r8, r2
	rsble sb, sb, #0
	mvnle r6, #0
	mov r7, #0
	mov r4, r5
	b _020396D4
_020396B0:
	mov r0, sb
	mov r1, r5
	bl _s32_div_f
	str r1, [sl, r7, lsl #2]
	mov r0, sb
	mov r1, r4
	bl _s32_div_f
	mov sb, r0
	add r7, r7, #1
_020396D4:
	cmp r7, r8
	blt _020396B0
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02039680

	arm_func_start sub_020396E4
sub_020396E4: ; 0x020396E4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r1, sp, #0xc
	mov r0, #0
	bl GetPressedButtons
	ldrsb r0, [r4, #0x14]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _02039730
	ldrsb r0, [r4, #0x14]
	bl sub_02030940
	mvn r1, #0
	cmp r0, r1
	bne _02039728
	mov r0, #2
	b _02039940
_02039728:
	mov r0, #3
	b _02039940
_02039730:
	add r1, sp, #0xa
	mov r0, #0
	ldrb r5, [r4, #0x28]
	bl sub_020063F4
	ldrh r0, [sp, #0xa]
	cmp r0, #0x10
	beq _02039774
	cmp r0, #0x20
	bne _02039788
	ldrb r0, [r4, #0x29]
	ldrb r1, [r4, #0x28]
	sub r0, r0, #1
	cmp r1, r0
	movge r0, #0
	addlt r0, r1, #1
	and r5, r0, #0xff
	b _02039788
_02039774:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	ldreqb r0, [r4, #0x29]
	sub r0, r0, #1
	and r5, r0, #0xff
_02039788:
	ldrb r0, [r4, #0x28]
	cmp r5, r0
	beq _020397A0
	mov r0, #3
	strb r5, [r4, #0x28]
	bl PlaySeVolumeWrapper
_020397A0:
	ldrb r1, [r4, #0x28]
	mov r0, #0xc
	ldr r3, [r4, #0x24]
	add r1, r1, #1
	mul r2, r1, r0
	ldr r1, [r4, #0x20]
	add r0, r3, #0xf
	sub r1, r1, r2
	add r2, r1, #3
	str r2, [sp]
	str r0, [sp, #4]
	ldrsb r0, [r4, #0x14]
	sub r3, r3, #1
	mov r1, #7
	bl sub_020309B8
	add r1, sp, #8
	mov r0, #0
	bl sub_020063F4
	mov r0, r4
	bl sub_0203994C
	cmp r0, #0
	ldreqh r0, [sp, #8]
	cmp r0, #0x40
	beq _0203980C
	cmp r0, #0x80
	beq _0203985C
	b _020398AC
_0203980C:
	ldr r3, [r4]
	ldr r0, [r4, #0xc]
	cmp r3, r0
	bne _0203982C
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #0
	b _020398B0
_0203982C:
	ldrb r2, [r4, #0x28]
	ldr r1, _02039948 ; =_0209C5E0
	mov r0, #3
	ldr r1, [r1, r2, lsl #2]
	add r5, r3, r1
	bl PlaySeVolumeWrapper
	ldr r0, [r4, #0xc]
	cmp r5, r0
	strgt r0, [r4]
	strle r5, [r4]
	mov r0, #1
	b _020398B0
_0203985C:
	ldr r3, [r4]
	ldr r0, [r4, #8]
	cmp r3, r0
	bne _0203987C
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r0, #0
	b _020398B0
_0203987C:
	ldrb r2, [r4, #0x28]
	ldr r1, _02039948 ; =_0209C5E0
	mov r0, #3
	ldr r1, [r1, r2, lsl #2]
	sub r5, r3, r1
	bl PlaySeVolumeWrapper
	ldr r0, [r4, #8]
	cmp r5, r0
	strlt r0, [r4]
	strge r5, [r4]
	mov r0, #1
	b _020398B0
_020398AC:
	mov r0, #0
_020398B0:
	cmp r0, #0
	movne r0, #1
	bne _02039940
	mov r0, r4
	bl sub_0203994C
	cmp r0, #0
	ldreqh r0, [sp, #0xc]
	cmp r0, #1
	beq _020398E4
	cmp r0, #2
	bne _020398EC
	mov r0, #2
	b _02039940
_020398E4:
	mov r0, #3
	b _02039940
_020398EC:
	add r0, sp, #0x10
	mov r1, #1
	bl sub_02031914
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl sub_020399FC
	cmp r0, #0
	blt _0203993C
	ldrb r1, [r4, #0x28]
	and r2, r0, #0xff
	cmp r2, r1
	beq _0203993C
	mov r0, #3
	strb r2, [r4, #0x28]
	bl PlaySeVolumeWrapper
_0203993C:
	mov r0, #0
_02039940:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02039948: .word _0209C5E0
	arm_func_end sub_020396E4

	arm_func_start sub_0203994C
sub_0203994C: ; 0x0203994C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	add r0, sp, #0
	mov r1, #1
	bl sub_02031914
	ldrh r0, [sp]
	tst r0, #2
	moveq r0, #0
	beq _020399F0
	ldr r2, [sp, #4]
	ldr r0, _020399F8 ; =0x0000FFFF
	cmp r2, r0
	ldreq r1, [sp, #8]
	cmpeq r1, r0
	moveq r0, #0
	beq _020399F0
	ldr r0, [sp, #8]
	mov r1, r2, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl sub_020399FC
	ldrb r1, [r4, #0x28]
	cmp r1, r0
	movne r0, #0
	bne _020399F0
	ldrsb r0, [r4, #0x14]
	bl GetWindow
	ldrb r1, [r0, #5]
	ldr r2, [r4, #0x24]
	ldr r0, [sp, #8]
	add r1, r2, r1, lsl #3
	cmp r0, r1
	add r1, r1, #0xc
	movlt r0, #0x40
	blt _020399F0
	cmp r0, r1
	movgt r0, #0x80
	movle r0, #0
_020399F0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020399F8: .word 0x0000FFFF
	arm_func_end sub_0203994C

	arm_func_start sub_020399FC
sub_020399FC: ; 0x020399FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	ldrsb r0, [r6, #0x14]
	mov r5, r1
	mov r4, r2
	bl GetWindow
	ldrb r1, [r0, #5]
	ldr r3, [r6, #0x24]
	ldr ip, _02039B08 ; =0x0000FFFF
	add r3, r3, r1, lsl #3
	cmp r5, ip
	ldrb r7, [r6, #0x29]
	ldr r8, [r6, #0x20]
	ldrb r2, [r0, #4]
	mov r6, #0xc
	ldrb sb, [r0, #6]
	sub lr, r3, #0xa
	ldrb r0, [r0, #7]
	smulbb r7, r7, r6
	add r8, r8, r2, lsl #3
	mov r3, r2, lsl #3
	mov r1, r1, lsl #3
	add r2, r3, sb, lsl #3
	add sb, r1, r0, lsl #3
	sub r7, r8, r7
	add r0, lr, #0x20
	cmpne r4, ip
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r3, r3, #6
	cmp r5, r3
	sublt r0, r6, #0xe
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r1, r1, #6
	cmp r4, r1
	sublt r0, r6, #0xe
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r1, r2, #6
	cmp r5, r1
	subgt r0, r6, #0xe
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r1, sb, #6
	cmp r4, r1
	subgt r0, r6, #0xe
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r4, lr
	sublt r0, ip, #0x10000
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r4, r0
	subgt r0, ip, #0x10000
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r0, r7, #4
	cmp r5, r0
	sublt r0, ip, #0x10000
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r8, #4
	cmp r5, r0
	subgt r0, ip, #0x10000
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r5, r7
	addle r5, r7, #1
	cmp r5, r8
	subge r5, r8, #1
	sub r0, r8, r5
	mov r1, #0xc
	bl _s32_div_f
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02039B08: .word 0x0000FFFF
	arm_func_end sub_020399FC

	arm_func_start sub_02039B0C
sub_02039B0C: ; 0x02039B0C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2c
	mov r8, r0
	ldr r1, [r8]
	ldr r2, [r8, #0x10]
	add r0, sp, #4
	bl sub_02039680
	ldr r0, [r8, #0x10]
	add r2, sp, #4
	sub r3, r0, #1
	mov r0, #0xff
	b _02039B50
_02039B3C:
	ldr r1, [r2, r3, lsl #2]
	cmp r1, #0
	bne _02039B58
	str r0, [r2, r3, lsl #2]
	sub r3, r3, #1
_02039B50:
	cmp r3, #0
	bgt _02039B3C
_02039B58:
	mov r7, #0
	add r6, sp, #4
#ifdef JAPAN
	mov r5, #0xa
#else
	mov r5, #0x2a
#endif
	mov r4, #0x44
	mov sb, #0xc
	b _02039BB0
_02039B70:
	ldr r0, [r6, r7, lsl #2]
	cmp r0, #0xff
	moveq r0, r5
#ifdef JAPAN
	addne r0, r0, #0x1e
#else
	addne r0, r0, #0x30
#endif
	andne r0, r0, #0xff
	bl sub_020251F0
	add r1, r7, #1
	mul r2, r1, sb
	str r4, [sp]
	ldr r1, [r8, #0x20]
	mov r3, r0
	sub r1, r1, r2
	ldrsb r0, [r8, #0x14]
	ldr r2, [r8, #0x24]
	bl sub_020264F8
	add r7, r7, #1
_02039BB0:
	ldr r0, [r8, #0x10]
	cmp r7, r0
	blt _02039B70
	mov r5, #0
	mov r4, #0x17
	mov r7, #0xb
	mov r6, #0xc
	b _02039C00
_02039BD0:
	add r0, r5, #1
	mul r1, r0, r6
	str r4, [sp]
	ldr r0, [r8, #0x20]
	ldr r2, [r8, #0x24]
	sub r1, r0, r1
	ldrsb r0, [r8, #0x14]
	mov r3, r7
	sub r1, r1, #1
	add r2, r2, #0xc
	bl sub_02025D50
	add r5, r5, #1
_02039C00:
	ldr r0, [r8, #0x10]
	cmp r5, r0
	blt _02039BD0
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02039B0C

	arm_func_start sub_02039C14
sub_02039C14: ; 0x02039C14
	ldr r0, _02039C24 ; =_020AFE58
	ldr ip, _02039C28 ; =sub_02039B0C
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02039C24: .word _020AFE58
_02039C28: .word sub_02039B0C
	arm_func_end sub_02039C14

	arm_func_start sub_02039C2C
sub_02039C2C: ; 0x02039C2C
	ldr ip, _02039C38 ; =sub_02039C64
	mov r2, #0
	bx ip
	.align 2, 0
_02039C38: .word sub_02039C64
	arm_func_end sub_02039C2C

	arm_func_start sub_02039C3C
sub_02039C3C: ; 0x02039C3C
	stmdb sp!, {r4, lr}
	mov r2, #2
	bl sub_02039C64
	ldr r1, _02039C60 ; =sub_0203BA80
	mov r2, #0
	mov r4, r0
	bl sub_0203189C
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02039C60: .word sub_0203BA80
	arm_func_end sub_02039C3C

	arm_func_start sub_02039C64
sub_02039C64: ; 0x02039C64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov r5, r0
	mov r4, r2
	bl sub_0203AD68
	cmp r0, #0
	mvnne r0, #1
	bne _0203A4CC
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02039CA8
	mov r0, #0x8a0
	mov r1, #8
	bl MemAlloc
	ldr r1, _0203A4D4 ; =_020AFE5C
	str r0, [r1, #0x10]
_02039CA8:
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r0, _0203A4D8 ; =_0209C764
	ldrsh r6, [r1, #2]
	mov r2, r5
	mov r3, r4
	str r6, [sp]
	ldr r1, [r1, #4]
	bl Debug_Print0
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r1, [r0, #4]
	cmp r1, r5
	beq _02039CF0
	mov r1, #1
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #8]
	str r5, [r0, #4]
	strh r1, [r0, #2]
_02039CF0:
	ldr r2, _0203A4D4 ; =_020AFE5C
	mov r0, #0
	ldrsh r1, [r2, #2]
	sub r3, r0, #2
	strh r1, [r2]
	ldr r1, [r2, #0x10]
	str r4, [r1]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #8]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #9]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xa]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xb]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xc]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xd]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xe]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0x10]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x468]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x469]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x505]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x506]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x507]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x50c]
	ldr r1, [r2, #0x10]
	strb r3, [r1, #0x5bc]
	ldr r1, [r2, #0x10]
	add r1, r1, #0x600
	strh r0, [r1, #0x70]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0x46a]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xf]
	ldr r1, [r2, #4]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _02039E94
_02039DB0: ; jump table
	b _02039E94 ; case 0
	b _02039DE4 ; case 1
	b _02039DF4 ; case 2
	b _02039E54 ; case 3
	b _02039E44 ; case 4
	b _02039E94 ; case 5
	b _02039E78 ; case 6
	b _02039E10 ; case 7
	b _02039E04 ; case 8
	b _02039E78 ; case 9
	b _02039E78 ; case 10
	b _02039E78 ; case 11
	b _02039E78 ; case 12
_02039DE4:
	ldr r0, [r2, #0x10]
	mov r1, #1
	strb r1, [r0, #0xe]
	b _02039E94
_02039DF4:
	ldr r0, [r2, #0x10]
	mov r1, #1
	strb r1, [r0, #8]
	b _02039E94
_02039E04:
	ldr r0, [r2, #0x10]
	mov r1, #1
	strb r1, [r0, #0x10]
_02039E10:
	ldr r0, _0203A4D4 ; =_020AFE5C
	mov r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0xd]
	bl sub_0204E210
	cmp r0, #2
	bne _02039E44
	bl sub_0204E3C8
	cmp r0, #0
	ldrne r0, _0203A4D4 ; =_020AFE5C
	movne r1, #1
	ldrne r0, [r0, #0x10]
	strneb r1, [r0, #0xf]
_02039E44:
	ldr r0, _0203A4D4 ; =_020AFE5C
	mov r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0xc]
_02039E54:
	ldr r0, _0203A4D4 ; =_020AFE5C
	mov r2, #1
	ldr r1, [r0, #0x10]
	strb r2, [r1, #0xb]
	ldr r1, [r0, #0x10]
	strb r2, [r1, #9]
	ldr r0, [r0, #0x10]
	strb r2, [r0, #0xa]
	b _02039E94
_02039E78:
	ldr r1, [r2, #0x10]
	mov r3, #1
	strb r3, [r1, #8]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #9]
	ldr r1, [r2, #0x10]
	strb r0, [r1, #0xa]
_02039E94:
	ldr r2, _0203A4D4 ; =_020AFE5C
	mvn r4, #0
	ldr r0, [r2, #0x10]
	mov r5, #0
	str r5, [r0, #4]
	add r1, r4, #0x22c
_02039EAC:
	ldr r3, [r2, #0x10]
	add r0, r5, #1
	add r3, r3, r5, lsl #1
	mov r0, r0, lsl #0x10
	strh r4, [r3, #0x12]
	cmp r1, r0, asr #16
	mov r5, r0, asr #0x10
	bgt _02039EAC
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r0, [r0, #4]
	sub r0, r0, #5
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0203A144
_02039EE4: ; jump table
	b _02039F04 ; case 0
	b _0203A034 ; case 1
	b _0203A144 ; case 2
	b _0203A144 ; case 3
	b _0203A034 ; case 4
	b _0203A034 ; case 5
	b _0203A034 ; case 6
	b _0203A034 ; case 7
_02039F04:
	bl sub_02059B08
	cmp r0, #0
	beq _02039FA8
	bl GetHero
	mov r5, r0
	bl GetPartner
	mov r4, r0
	cmp r5, #0
	beq _02039F64
	add r1, sp, #0x10
	mov r0, r5
	bl GetEvolutionPossibilities
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	beq _02039F64
	bl GetHeroMemberIdx
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r5, [r1, #0x10]
	ldr r3, [r5, #4]
	add r2, r3, #1
	str r2, [r5, #4]
	ldr r1, [r1, #0x10]
	add r1, r1, r3, lsl #1
	strh r0, [r1, #0x12]
_02039F64:
	cmp r4, #0
	beq _02039FA8
	add r1, sp, #0x10
	mov r0, r4
	bl GetEvolutionPossibilities
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	beq _02039FA8
	bl GetPartnerMemberIdx
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r4, [r1, #0x10]
	ldr r3, [r4, #4]
	add r2, r3, #1
	str r2, [r4, #4]
	ldr r1, [r1, #0x10]
	add r1, r1, r3, lsl #1
	strh r0, [r1, #0x12]
_02039FA8:
	ldr r6, _0203A4D4 ; =_020AFE5C
	ldr r4, _0203A4DC ; =0x0000022B
	ldr r7, _0203A4E0 ; =TEAM_MEMBER_TABLE_PTR
	mov sb, #5
	mov sl, #0
	mov r8, #1
	add fp, sp, #0x10
	mov r5, #0x44
_02039FC8:
	smulbb r2, sb, r5
	ldr r3, [r7]
	ldrb r0, [r3, r2]
	tst r0, #1
	movne r0, r8
	moveq r0, sl
	tst r0, #0xff
	beq _0203A01C
	mov r1, fp
	add r0, r3, r2
	bl GetEvolutionPossibilities
	ldrsh r0, [sp, #0x18]
	cmp r0, #0
	beq _0203A01C
	ldr r2, [r6, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #1
	str r0, [r2, #4]
	ldr r0, [r6, #0x10]
	add r0, r0, r1, lsl #1
	strh sb, [r0, #0x12]
_0203A01C:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov sb, r0, asr #0x10
	bgt _02039FC8
	b _0203A278
_0203A034:
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _0203A064
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r4, [r1, #0x10]
	ldr r3, [r4, #4]
	add r2, r3, #1
	str r2, [r4, #4]
	ldr r1, [r1, #0x10]
	add r1, r1, r3, lsl #1
	strh r0, [r1, #0x12]
_0203A064:
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _0203A094
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r4, [r1, #0x10]
	ldr r3, [r4, #4]
	add r2, r3, #1
	str r2, [r4, #4]
	ldr r1, [r1, #0x10]
	add r1, r1, r3, lsl #1
	strh r0, [r1, #0x12]
_0203A094:
	bl GetMainCharacter3MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _0203A0C4
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r4, [r1, #0x10]
	ldr r3, [r4, #4]
	add r2, r3, #1
	str r2, [r4, #4]
	ldr r1, [r1, #0x10]
	add r1, r1, r3, lsl #1
	strh r0, [r1, #0x12]
_0203A0C4:
	ldr r6, _0203A4D4 ; =_020AFE5C
	ldr r4, _0203A4DC ; =0x0000022B
	ldr r7, _0203A4E0 ; =TEAM_MEMBER_TABLE_PTR
	mov sb, #5
	mov sl, #0
	mov r8, #1
	mov r5, #0x44
_0203A0E0:
	smulbb r0, sb, r5
	ldr r1, [r7]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, r8
	moveq r0, sl
	tst r0, #0xff
	beq _0203A12C
	mov r0, sb
	bl sub_02056410
	cmp r0, #0
	beq _0203A12C
	ldr r2, [r6, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #1
	str r0, [r2, #4]
	ldr r0, [r6, #0x10]
	add r0, r0, r1, lsl #1
	strh sb, [r0, #0x12]
_0203A12C:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov sb, r0, asr #0x10
	bgt _0203A0E0
	b _0203A278
_0203A144:
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _0203A198
	bl GetMainCharacter1MemberIdx
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0203A198
	bl sub_0203AB3C
	cmp r0, #0
	beq _0203A198
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r3, [r0, #0x10]
	ldr r2, [r3, #4]
	add r1, r2, #1
	str r1, [r3, #4]
	ldr r0, [r0, #0x10]
	add r0, r0, r2, lsl #1
	strh r4, [r0, #0x12]
_0203A198:
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0203A22C
	bl GetMainCharacter2MemberIdx
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0203A1EC
	bl sub_0203AB3C
	cmp r0, #0
	beq _0203A1EC
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r3, [r0, #0x10]
	ldr r2, [r3, #4]
	add r1, r2, #1
	str r1, [r3, #4]
	ldr r0, [r0, #0x10]
	add r0, r0, r2, lsl #1
	strh r4, [r0, #0x12]
_0203A1EC:
	bl GetMainCharacter3MemberIdx
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0203A22C
	bl sub_0203AB3C
	cmp r0, #0
	beq _0203A22C
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r3, [r0, #0x10]
	ldr r2, [r3, #4]
	add r1, r2, #1
	str r1, [r3, #4]
	ldr r0, [r0, #0x10]
	add r0, r0, r2, lsl #1
	strh r4, [r0, #0x12]
_0203A22C:
	ldr r6, _0203A4D4 ; =_020AFE5C
	ldr r5, _0203A4DC ; =0x0000022B
	mov r4, #5
_0203A238:
	mov r0, r4
	bl sub_0203AB3C
	cmp r0, #0
	beq _0203A264
	ldr r2, [r6, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #1
	str r0, [r2, #4]
	ldr r0, [r6, #0x10]
	add r0, r0, r1, lsl #1
	strh r4, [r0, #0x12]
_0203A264:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	cmp r5, r0, asr #16
	mov r4, r0, asr #0x10
	bgt _0203A238
_0203A278:
	ldr r1, _0203A4E4 ; =_0209C604
	add r0, sp, #8
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r2, [sp, #0xc]
	str r1, [sp, #8]
	bl sub_020584F8
	bl sub_0203AF28
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldrsh r0, [r0, #2]
	bl sub_0203AAF8
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r2, [r1, #0x10]
	str r0, [r2, #0x46c]
	ldr r0, [r1, #4]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _0203A330
_0203A2C0: ; jump table
	b _0203A330 ; case 0
	b _0203A330 ; case 1
	b _0203A31C ; case 2
	b _0203A330 ; case 3
	b _0203A330 ; case 4
	b _0203A330 ; case 5
	b _0203A31C ; case 6
	b _0203A330 ; case 7
	b _0203A330 ; case 8
	b _0203A2F4 ; case 9
	b _0203A308 ; case 10
	b _0203A31C ; case 11
	b _0203A31C ; case 12
_0203A2F4:
	ldr r0, [r1, #0x10]
	ldr r1, _0203A4E8 ; =0x000002B7
	add r0, r0, #0x400
	strh r1, [r0, #0x74]
	b _0203A344
_0203A308:
	ldr r0, [r1, #0x10]
#ifdef JAPAN
	ldr r1, _0203A8F4 ; =0x00002FD8
#else
	mov r1, #0x2b8
#endif
	add r0, r0, #0x400
	strh r1, [r0, #0x74]
	b _0203A344
_0203A31C:
	ldr r0, [r1, #0x10]
	ldr r1, _0203A4EC ; =0x00000302
	add r0, r0, #0x400
	strh r1, [r0, #0x74]
	b _0203A344
_0203A330:
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r1, _0203A4F0 ; =0x00000303
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	strh r1, [r0, #0x74]
_0203A344:
	ldr r2, _0203A4D4 ; =_020AFE5C
	mov r3, #0x10
	ldr r0, [r2, #0x10]
	mov r1, #0xd
	str r3, [r0, #0x478]
	ldr r0, [r2, #0x10]
	str r1, [r0, #0x470]
	ldr r0, [r2, #4]
	sub r0, r0, #6
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0203A420
_0203A374: ; jump table
	b _0203A3E0 ; case 0
	b _0203A420 ; case 1
	b _0203A420 ; case 2
	b _0203A390 ; case 3
	b _0203A3E0 ; case 4
	b _0203A3E0 ; case 5
	b _0203A3E0 ; case 6
_0203A390:
	ldr r3, [r2, #0x10]
	ldr r0, _0203A4F4 ; =_0209C668
	add r1, r3, #0x72
	add r1, r1, #0x600
	str r1, [r3, #0x4cc]
	ldr r3, [r2, #0x10]
	ldr r1, _0203A4F8 ; =0x00401E33
	add r2, r3, #0x500
	ldrsh r4, [r2, #0xd4]
	add r2, r3, #0x6c
	ldr r3, _0203A4FC ; =TeamSelectionMenuGetItem
	str r4, [sp]
	mov r4, #6
	add r2, r2, #0x400
	str r4, [sp, #4]
	bl CreateTeamSelectionMenu
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strb r0, [r1, #0x468]
	b _0203A4BC
_0203A3E0:
	ldr r2, [r2, #0x10]
	ldr r0, _0203A4F4 ; =_0209C668
	add r1, r2, #0x500
	ldrsh r4, [r1, #0xd4]
	add r2, r2, #0x6c
	ldr r1, _0203A500 ; =0x00401C33
	ldr r3, _0203A4FC ; =TeamSelectionMenuGetItem
	str r4, [sp]
	mov r4, #6
	add r2, r2, #0x400
	str r4, [sp, #4]
	bl CreateTeamSelectionMenu
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strb r0, [r1, #0x468]
	b _0203A4BC
_0203A420:
	ldr r1, _0203A4D4 ; =_020AFE5C
	ldr r3, _0203A504 ; =sub_0203B91C
	ldr r0, [r1, #0x10]
	ldr r2, _0203A508 ; =_0203BA24
	str r3, [r0, #0x4e0]
	ldr r0, [r1, #0x10]
	mov r3, #0
	str r2, [r0, #0x4e8]
	ldr r2, [r1, #0x10]
	ldr r0, _0203A4F4 ; =_0209C668
	str r3, [r2, #0x508]
	ldr r3, [r1, #0x10]
	ldr r1, _0203A50C ; =0x00447C33
	add r2, r3, #0x500
	ldrsh r4, [r2, #0xd4]
	add r2, r3, #0x6c
	ldr r3, _0203A4FC ; =TeamSelectionMenuGetItem
	str r4, [sp]
	mov r4, #8
	add r2, r2, #0x400
	str r4, [sp, #4]
	bl CreateTeamSelectionMenu
	ldr r2, _0203A4D4 ; =_020AFE5C
	ldr r1, _0203A510 ; =_0203B884
	ldr r3, [r2, #0x10]
	strb r0, [r3, #0x468]
	ldr r0, [r2, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_02031888
	ldr r0, _0203A514 ; =_0209C638
	ldr r1, _0203A518 ; =sub_0203C784
	bl CreateTextBox
	ldr r1, _0203A4D4 ; =_020AFE5C
	mov r2, #1
	ldr r3, [r1, #0x10]
	strb r0, [r3, #0x469]
	ldr r0, [r1, #0x10]
	strb r2, [r0, #0x46a]
_0203A4BC:
	ldr r0, _0203A4D4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
_0203A4CC:
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0203A4D4: .word _020AFE5C
_0203A4D8: .word _0209C764
_0203A4DC: .word 0x0000022B
_0203A4E0: .word TEAM_MEMBER_TABLE_PTR
_0203A4E4: .word _0209C604
#ifdef JAPAN
_0203A4E8: .word 0x00002FD7
_0203A8F4: .word 0x00002FD8
_0203A4EC: .word 0x000023AA
_0203A4F0: .word 0x000023AB
#else
_0203A4E8: .word 0x000002B7
_0203A4EC: .word 0x00000302
_0203A4F0: .word 0x00000303
#endif
_0203A4F4: .word _0209C668
_0203A4F8: .word 0x00401E33
_0203A4FC: .word TeamSelectionMenuGetItem
_0203A500: .word 0x00401C33
_0203A504: .word sub_0203B91C
_0203A508: .word sub_0203BA24
_0203A50C: .word 0x00447C33
_0203A510: .word sub_0203B884
_0203A514: .word _0209C638
_0203A518: .word sub_0203C784
	arm_func_end sub_02039C64

	arm_func_start sub_0203A51C
sub_0203A51C: ; 0x0203A51C
	stmdb sp!, {r3, lr}
	ldr r0, _0203A5A4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203AA20
	ldr r1, _0203A5A4 ; =_020AFE5C
	strh r0, [r1]
	bl sub_0203AAB0
	ldr r1, _0203A5A4 ; =_020AFE5C
	strh r0, [r1, #2]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl CloseTeamSelectionMenu
	ldr r0, _0203A5A4 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	cmp r0, r1
	beq _0203A588
	bl CloseTextBox
	ldr r0, _0203A5A4 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x469]
_0203A588:
	ldr r0, _0203A5A4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _0203A5A4 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A5A4: .word _020AFE5C
	arm_func_end sub_0203A51C

	arm_func_start sub_0203A5A8
sub_0203A5A8: ; 0x0203A5A8
	stmdb sp!, {r3, lr}
	ldr r0, _0203A5EC ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203AA20
	ldr r1, _0203A5EC ; =_020AFE5C
	strh r0, [r1]
	bl sub_0203AAB0
	ldr r1, _0203A5EC ; =_020AFE5C
	strh r0, [r1, #2]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl IsTeamSelectionMenuActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A5EC: .word _020AFE5C
	arm_func_end sub_0203A5A8

	arm_func_start sub_0203A5F0
sub_0203A5F0: ; 0x0203A5F0
	stmdb sp!, {r3, lr}
	ldr r0, _0203A614 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_020318D0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A614: .word _020AFE5C
	arm_func_end sub_0203A5F0

	arm_func_start sub_0203A618
sub_0203A618: ; 0x0203A618
	stmdb sp!, {r3, lr}
	ldr r0, _0203A634 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203A658
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A634: .word _020AFE5C
	arm_func_end sub_0203A618

	arm_func_start sub_0203A638
sub_0203A638: ; 0x0203A638
	stmdb sp!, {r3, lr}
	ldr r0, _0203A654 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203A6BC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A654: .word _020AFE5C
	arm_func_end sub_0203A638

	arm_func_start sub_0203A658
sub_0203A658: ; 0x0203A658
	stmdb sp!, {r3, lr}
	bl sub_0203AA20
	ldr r1, _0203A6B8 ; =_020AFE5C
	strh r0, [r1]
	bl sub_0203AAB0
	ldr r1, _0203A6B8 ; =_020AFE5C
	strh r0, [r1, #2]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_0202812C
	ldr r0, _0203A6B8 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseTextBox
	ldr r0, _0203A6B8 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x469]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A6B8: .word _020AFE5C
	arm_func_end sub_0203A658

	arm_func_start sub_0203A6BC
sub_0203A6BC: ; 0x0203A6BC
	stmdb sp!, {r3, lr}
	ldr r0, _0203A750 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_02028354
	cmp r0, #3
	bne _0203A6F0
	ldr r0, _0203A750 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_0202810C
_0203A6F0:
	ldr r0, _0203A750 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_0203111C
	ldr r0, _0203A750 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	ldrb r0, [r1, #0x46a]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x400
	ldrsb r0, [r0, #0x69]
	mvn r1, #1
	cmp r0, r1
	bne _0203A748
	ldr r0, _0203A754 ; =_0209C638
	ldr r1, _0203A758 ; =sub_0203C784
	bl CreateTextBox
	ldr r1, _0203A750 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strb r0, [r1, #0x469]
	ldmia sp!, {r3, pc}
_0203A748:
	bl sub_0202F9B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A750: .word _020AFE5C
_0203A754: .word _0209C638
_0203A758: .word sub_0203C784
	arm_func_end sub_0203A6BC

	arm_func_start TeamSelectionMenuGetItem
TeamSelectionMenuGetItem: ; 0x0203A75C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	ldr r3, _0203A960 ; =_020AFE5C
	ldr r2, _0203A964 ; =TEAM_MEMBER_TABLE_PTR
	ldr r5, [r3, #0x10]
	mov r8, r1
	add r1, r5, r8, lsl #1
	ldrsh r6, [r1, #0x12]
	ldr r4, [r2]
	add r1, r5, r8
	mov r2, #0
	strb r2, [r1, #0x672]
	mov r7, #0x44
	ldr r1, [r3, #4]
	smlabb r4, r6, r7, r4
	mov sb, r0
	cmp r1, #9
	bne _0203A85C
	ldr r0, [r3, #0x10]
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x70]
	bl GetItemMoveId16
	mov r5, #0
	mov r3, r5
	mov ip, #1
	mov r2, #6
	b _0203A7FC
_0203A7C8:
	smlabb lr, r5, r2, r4
	ldrb r1, [lr, #0x22]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	beq _0203A7F0
	ldrh r1, [lr, #0x24]
	cmp r0, r1
	beq _0203A804
_0203A7F0:
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
_0203A7FC:
	cmp r5, #4
	blt _0203A7C8
_0203A804:
	ldrsh r1, [r4, #4]
	bl sub_02053D1C
	cmp r0, #0
	beq _0203A844
	cmp r5, #4
	blt _0203A844
	mov r0, r6
	bl sub_02056410
	cmp r0, #0
	beq _0203A8E4
	mov r0, r6
	bl sub_020564B0
	cmp r0, #0
	movne r7, #0x59
	moveq r7, #0x46
	b _0203A8E4
_0203A844:
	ldr r0, _0203A960 ; =_020AFE5C
	mov r1, #3
	ldr r0, [r0, #0x10]
	add r0, r0, r8
	strb r1, [r0, #0x672]
	b _0203A8E4
_0203A85C:
	mov r0, r6
	bl sub_02056410
	cmp r0, #0
	beq _0203A884
	mov r0, r6
	bl sub_020564B0
	cmp r0, #0
	movne r7, #0x59
	moveq r7, #0x46
	b _0203A8E4
_0203A884:
	ldr r0, _0203A960 ; =_020AFE5C
	ldr r0, [r0, #4]
#ifdef JAPAN
	sub r0, r0, #5
	cmp r0, #7
#else
	cmp r0, #0xc
#endif
	addls pc, pc, r0, lsl #2
	b _0203A8D0
_0203A898: ; jump table
#ifndef JAPAN
	b _0203A8D0 ; case 0
	b _0203A8D0 ; case 1
	b _0203A8D0 ; case 2
	b _0203A8CC ; case 3
	b _0203A8CC ; case 4
#endif
	b _0203A8CC ; case 5
	b _0203A8CC ; case 6
	b _0203A8CC ; case 7
	b _0203A8CC ; case 8
	b _0203A8CC ; case 9
	b _0203A8CC ; case 10
	b _0203A8CC ; case 11
	b _0203A8CC ; case 12
_0203A8CC:
	b _0203A8E4
_0203A8D0:
	mov r0, r6
	bl sub_02056F60
	cmp r0, #0
	movne r7, #0x44
	moveq r7, #0x57
_0203A8E4:
	add r0, sp, #0x14
	add r1, r4, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrsh r0, [r4, #4]
	bl GetDexNumber
	mov r1, r0
	add r0, sp, #4
	mov r2, #3
	bl sub_0202372C
	ldr r0, _0203A960 ; =_020AFE5C
	add r2, sp, #4
	ldr r0, [r0, #0x10]
	add r0, r0, r8
	ldrb r0, [r0, #0x672]
	cmp r0, #0
	bne _0203A944
	ldr r1, _0203A968 ; =_0209C798
	add r4, sp, #0x14
	mov r0, sb
	mov r3, r7
	str r4, [sp]
	bl SprintfStatic__0203A970
	b _0203A954
_0203A944:
	ldr r1, _0203A96C ; =_0209C7B8
	add r3, sp, #0x14
	mov r0, sb
	bl SprintfStatic__0203A970
_0203A954:
	mov r0, sb
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0203A960: .word _020AFE5C
_0203A964: .word TEAM_MEMBER_TABLE_PTR
_0203A968: .word _0209C798
_0203A96C: .word _0209C7B8
	arm_func_end TeamSelectionMenuGetItem

	arm_func_start SprintfStatic__0203A970
SprintfStatic__0203A970: ; 0x0203A970
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0203A970

	arm_func_start sub_0203A998
sub_0203A998: ; 0x0203A998
	ldr r0, _0203A9B4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0203A9B4: .word _020AFE5C
	arm_func_end sub_0203A998

	arm_func_start sub_0203A9B8
sub_0203A9B8: ; 0x0203A9B8
	stmdb sp!, {r3, lr}
	ldr r0, _0203A9E8 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addne r0, r0, #0x400
	ldrnesb r0, [r0, #0x68]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsTeamSelectionMenuActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203A9E8: .word _020AFE5C
	arm_func_end sub_0203A9B8

	arm_func_start sub_0203A9EC
sub_0203A9EC: ; 0x0203A9EC
	stmdb sp!, {r3, lr}
	ldr r0, _0203AA1C ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addne r0, r0, #0x400
	ldrnesb r0, [r0, #0x68]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsTeamSelectionMenuState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203AA1C: .word _020AFE5C
	arm_func_end sub_0203A9EC

	arm_func_start sub_0203AA20
sub_0203AA20: ; 0x0203AA20
	stmdb sp!, {r3, lr}
	ldr r0, _0203AAAC ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addne r0, r0, #0x400
	ldrnesb r0, [r0, #0x68]
	mvnne r1, #1
	cmpne r0, r1
	beq _0203AAA0
	bl IsTeamSelectionMenuActive
	cmp r0, #0
	beq _0203AA68
	ldr r0, _0203AAAC ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_020311D4
	b _0203AA7C
_0203AA68:
	ldr r0, _0203AAAC ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_020311E8
_0203AA7C:
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	cmp r1, #0
	mvnlt r0, #0
	ldrge r0, _0203AAAC ; =_020AFE5C
	ldrge r0, [r0, #0x10]
	addge r0, r0, r1, lsl #1
	ldrgesh r0, [r0, #0x12]
	ldmia sp!, {r3, pc}
_0203AAA0:
	ldr r0, _0203AAAC ; =_020AFE5C
	ldrsh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203AAAC: .word _020AFE5C
	arm_func_end sub_0203AA20

	arm_func_start sub_0203AAB0
sub_0203AAB0: ; 0x0203AAB0
	stmdb sp!, {r3, lr}
	ldr r0, _0203AAF4 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addne r0, r0, #0x400
	ldrnesb r0, [r0, #0x68]
	mvnne r1, #1
	cmpne r0, r1
	ldreq r0, _0203AAF4 ; =_020AFE5C
	ldreqsh r0, [r0, #2]
	ldmeqia sp!, {r3, pc}
	bl sub_020311D4
	ldr r1, _0203AAF4 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x12]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203AAF4: .word _020AFE5C
	arm_func_end sub_0203AAB0

	arm_func_start sub_0203AAF8
sub_0203AAF8: ; 0x0203AAF8
	ldr r1, _0203AB38 ; =_020AFE5C
	mov r2, #0
	ldr r3, [r1, #0x10]
	add r1, r3, #0x500
	ldrsh ip, [r1, #0xd4]
	b _0203AB28
_0203AB10:
	add r1, r3, r2, lsl #1
	ldrsh r1, [r1, #0x12]
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	add r2, r2, #1
_0203AB28:
	cmp r2, ip
	blt _0203AB10
	mvn r0, #0
	bx lr
	.align 2, 0
_0203AB38: .word _020AFE5C
	arm_func_end sub_0203AAF8

	arm_func_start sub_0203AB3C
sub_0203AB3C: ; 0x0203AB3C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0203AD60 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, r0
	mov r0, #0x44
	smulbb r2, r5, r0
	ldr r1, [r1]
	ldrb r0, [r1, r2]
	add r4, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0203AB98
	ldrsh r0, [r4, #4]
	cmp r0, #0x214
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0203AB98:
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _0203ABCC
	ldrsh r0, [r4, #4]
	bl sub_02054F18
	cmp r0, #0
	bne _0203ABC4
	add r0, r4, #0x22
	bl IsMovesetValidInTimeDarkness
	cmp r0, #0
	bne _0203ABCC
_0203ABC4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0203ABCC:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _0203AD10
	ldrsh r0, [r4, #4]
	bl IsShaymin
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0203AC20
	mov r0, r5
	mov r1, #0
	bl sub_02056460
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0203AC20:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0203AC4C
	mov r0, r5
	mov r1, #1
	bl sub_02056460
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0203AC4C:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	ldrb r0, [r1, #0xf]
	cmp r0, #0
	ldrneb r0, [r1, #0xb]
	cmpne r0, #0
	beq _0203AC80
	mov r0, r5
	mov r1, #2
	bl sub_02056460
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0203AC80:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0203ACAC
	mov r0, r5
	mov r1, #0
	bl sub_02056460
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0203ACAC:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0203ACD8
	mov r0, r5
	mov r1, #1
	bl sub_02056460
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0203ACD8:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	ldrb r0, [r1, #0xf]
	cmp r0, #0
	ldrneb r0, [r1, #8]
	cmpne r0, #0
	beq _0203AD58
	mov r0, r5
	mov r1, #2
	bl sub_02056460
	cmp r0, #0
	bne _0203AD58
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0203AD10:
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0203AD30
	mov r0, r5
	bl sub_02056410
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0203AD30:
	ldr r0, _0203AD64 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0203AD58
	mov r0, r5
	bl sub_02056410
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0203AD58:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203AD60: .word TEAM_MEMBER_TABLE_PTR
_0203AD64: .word _020AFE5C
	arm_func_end sub_0203AB3C

	arm_func_start sub_0203AD68
sub_0203AD68: ; 0x0203AD68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub sb, sl, #7
	mov r6, #0
	ldr r5, _0203AF04 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0x44
	ldr fp, _0203AF08 ; =0x0000022B
	b _0203AEF4
_0203AD88:
	ldr r1, [r5]
	mov r0, r6, lsl #0x10
	mla r7, r6, r4, r1
	mov r0, r0, asr #0x10
	bl IsValidTeamMember
	cmp r0, #0
	beq _0203AEF0
	cmp sl, #2
	bne _0203ADC4
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02056410
	cmp r0, #0
	beq _0203AEF0
	b _0203AEE8
_0203ADC4:
	cmp sl, #3
	bne _0203ADE4
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02056410
	cmp r0, #0
	bne _0203AEF0
	b _0203AEE8
_0203ADE4:
	cmp sl, #4
	bne _0203AE2C
	cmp r6, #5
	blt _0203AEF0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02056410
	cmp r0, #0
	bne _0203AEF0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	bne _0203AEF0
	ldrsh r0, [r7, #4]
	cmp r0, #0x214
	bne _0203AEE8
	b _0203AEF0
_0203AE2C:
	cmp sb, #1
	bhi _0203AEE8
	mov r8, #0
	bl sub_0204E210
	cmp r0, #2
	bne _0203AE50
	bl sub_0204E3C8
	cmp r0, #0
	movne r8, #1
_0203AE50:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl sub_02056460
	cmp r0, #0
	bne _0203AEF0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #1
	bl sub_02056460
	cmp r0, #0
	bne _0203AEF0
	cmp r8, #0
	beq _0203AEA0
	mov r0, r6, lsl #0x10
	mov r1, #2
	mov r0, r0, asr #0x10
	bl sub_02056460
	cmp r0, #0
	bne _0203AEF0
_0203AEA0:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	bne _0203AEF0
	ldrsh r0, [r7, #4]
	cmp r0, #0x214
	beq _0203AEF0
	cmp sl, #8
	bne _0203AED8
	ldrsh r0, [r7, #4]
	bl sub_02054F18
	cmp r0, #0
	bne _0203AEF0
_0203AED8:
	ldrsh r0, [r7, #4]
	bl IsShaymin
	cmp r0, #0
	bne _0203AEF0
_0203AEE8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0203AEF0:
	add r6, r6, #1
_0203AEF4:
	cmp r6, fp
	blt _0203AD88
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0203AF04: .word TEAM_MEMBER_TABLE_PTR
_0203AF08: .word 0x0000022B
	arm_func_end sub_0203AD68

#ifndef JAPAN
	arm_func_start sub_0203AF0C
sub_0203AF0C: ; 0x0203AF0C
	ldr r0, _0203AF24 ; =_020AFE5C
	mvn r1, #0
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_0203AF24: .word _020AFE5C
	arm_func_end sub_0203AF0C
#endif

	arm_func_start sub_0203AF28
sub_0203AF28: ; 0x0203AF28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0203B738 ; =_020AFE5C
	ldr r0, [r1, #0x10]
	ldr r2, [r0, #4]
	add r0, r0, #0x500
	strh r2, [r0, #0xd4]
	ldr r0, [r1, #8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0203B29C
_0203AF50: ; jump table
	b _0203B29C ; case 0
	b _0203AF64 ; case 1
	b _0203B050 ; case 2
	b _0203B114 ; case 3
	b _0203B1CC ; case 4
_0203AF64:
	ldr r0, _0203B73C ; =_022AADF8
	ldrb r8, [r0]
	mov r0, r8
	bl sub_0203BAEC
	cmp r0, #0
	mvneq r6, #0
	beq _0203B03C
	ldr r0, _0203B73C ; =_022AADF8
	mov r6, #0
	ldr r5, _0203B738 ; =_020AFE5C
	mov r1, #1
	mov sb, r6
	str r1, [r5, #8]
	strb r8, [r0]
	mov fp, r6
	mov sl, #0x44
	ldr r4, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	b _0203B02C
_0203AFAC:
	add r0, r1, sb, lsl #1
	ldrsh r2, [r0, #0x12]
	ldr r0, [r4]
	mov r1, fp
	smulbb r7, r2, sl
	add r0, r0, r7
	ldrsh r0, [r0, #4]
	bl GetType
	cmp r8, r0
	beq _0203AFF0
	ldr r0, [r4]
	mov r1, #1
	add r0, r0, r7
	ldrsh r0, [r0, #4]
	bl GetType
	cmp r8, r0
	bne _0203B020
_0203AFF0:
	ldr r0, [r5, #0x10]
	add r2, r6, #1
	add r1, r0, r6, lsl #1
	add r3, r0, sb, lsl #1
	ldrsh r0, [r1, #0x12]
	ldrsh r3, [r3, #0x12]
	mov r2, r2, lsl #0x10
	mov r6, r2, asr #0x10
	strh r3, [r1, #0x12]
	ldr r1, [r5, #0x10]
	add r1, r1, sb, lsl #1
	strh r0, [r1, #0x12]
_0203B020:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_0203B02C:
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #4]
	cmp sb, r0
	blt _0203AFAC
_0203B03C:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	strh r6, [r0, #0xd4]
	b _0203B29C
_0203B050:
	ldr r0, _0203B73C ; =_022AADF8
	ldrsh r6, [r0]
	mov r0, r6
	bl sub_0203BB80
	cmp r0, #0
	mvneq r5, #0
	beq _0203B100
	ldr r0, _0203B73C ; =_022AADF8
	mov r5, #0
	ldr sb, _0203B738 ; =_020AFE5C
	mov r1, #2
	mov r4, r5
	str r1, [sb, #8]
	strh r6, [r0]
	ldr r8, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0x44
	b _0203B0F0
_0203B094:
	add r0, r1, r4, lsl #1
	ldrsh r0, [r0, #0x12]
	ldr r1, [r8]
	smlabb r0, r0, r7, r1
	ldrsh r0, [r0, #4]
	bl GetDexNumber
	cmp r6, r0
	bne _0203B0E4
	ldr r0, [sb, #0x10]
	add r1, r5, #1
	add r3, r0, r5, lsl #1
	add r2, r0, r4, lsl #1
	ldrsh r0, [r3, #0x12]
	ldrsh r2, [r2, #0x12]
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	strh r2, [r3, #0x12]
	ldr r1, [sb, #0x10]
	add r1, r1, r4, lsl #1
	strh r0, [r1, #0x12]
_0203B0E4:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0203B0F0:
	ldr r1, [sb, #0x10]
	ldr r0, [r1, #4]
	cmp r4, r0
	blt _0203B094
_0203B100:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	strh r5, [r0, #0xd4]
	b _0203B29C
_0203B114:
	ldr r0, _0203B73C ; =_022AADF8
	ldrb r4, [r0]
	mov r0, r4
	bl sub_0203BBEC
	cmp r0, #0
	mvneq r2, #0
	beq _0203B1B8
	ldr r0, _0203B73C ; =_022AADF8
	mov r2, #0
	ldr r6, _0203B738 ; =_020AFE5C
	mov r3, #3
	str r3, [r6, #8]
	mov r1, r2
	strb r4, [r0]
	ldr r5, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0x44
	b _0203B1A8
_0203B158:
	add r0, r7, r1, lsl #1
	ldrsh r0, [r0, #0x12]
	ldr r7, [r5]
	smlabb r7, r0, r3, r7
	ldrb r7, [r7, #0x3a]
	cmp r4, r7
	bne _0203B19C
	ldr r8, [r6, #0x10]
	add r7, r2, #1
	add sb, r8, r2, lsl #1
	ldrsh r8, [sb, #0x12]
	mov r2, r7, lsl #0x10
	mov r2, r2, asr #0x10
	strh r0, [sb, #0x12]
	ldr r0, [r6, #0x10]
	add r0, r0, r1, lsl #1
	strh r8, [r0, #0x12]
_0203B19C:
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
_0203B1A8:
	ldr r7, [r6, #0x10]
	ldr r0, [r7, #4]
	cmp r1, r0
	blt _0203B158
_0203B1B8:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	strh r2, [r0, #0xd4]
	b _0203B29C
_0203B1CC:
	ldr r0, _0203B73C ; =_022AADF8
	ldrh sb, [r0]
	mov r0, sb
	bl sub_0203BC50
	cmp r0, #0
	mvneq r8, #0
	beq _0203B28C
	ldr r0, _0203B73C ; =_022AADF8
	mov r8, #0
	ldr r6, _0203B738 ; =_020AFE5C
	mov r1, #4
	mov r7, r8
	str r1, [r6, #8]
	strh sb, [r0]
	add sl, sp, #0
	ldr r5, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0x44
	b _0203B27C
_0203B214:
	add r0, r1, r7, lsl #1
	ldrsh r0, [r0, #0x12]
	ldr r1, [r5]
	smlabb r0, r0, r4, r1
	ldrsh r0, [r0, #4]
	bl GetNameString
	str r0, [sp]
	mov r0, sl
	bl sub_0202065C
	cmp sb, r0
	bne _0203B270
	ldr r0, [r6, #0x10]
	add r2, r8, #1
	add r1, r0, r8, lsl #1
	add r3, r0, r7, lsl #1
	ldrsh r0, [r1, #0x12]
	ldrsh r3, [r3, #0x12]
	mov r2, r2, lsl #0x10
	mov r8, r2, asr #0x10
	strh r3, [r1, #0x12]
	ldr r1, [r6, #0x10]
	add r1, r1, r7, lsl #1
	strh r0, [r1, #0x12]
_0203B270:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_0203B27C:
	ldr r1, [r6, #0x10]
	ldr r0, [r1, #4]
	cmp r7, r0
	blt _0203B214
_0203B28C:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	strh r8, [r0, #0xd4]
_0203B29C:
	ldr r0, _0203B738 ; =_020AFE5C
	mov r8, #0
	ldr r2, [r0, #0x10]
	add r0, r2, #0x500
	ldrsh r1, [r0, #0xd4]
	cmp r1, #0
	ldrle r1, [r2, #4]
	strleh r1, [r0, #0xd4]
	mov r1, r8
_0203B2C0:
	ldr r0, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	mov r3, r1, lsl #1
	ldr r0, [r0]
	mvn r2, #0
	add r0, r0, #0x9000
	ldr r0, [r0, #0x870]
	ldrsh r0, [r0, r3]
	cmp r0, r2
	beq _0203B35C
	ldr r2, _0203B738 ; =_020AFE5C
	mov r5, #0
	ldr r4, [r2, #0x10]
	add r2, r4, #0x500
	ldrsh r3, [r2, #0xd4]
	b _0203B354
_0203B2FC:
	add r2, r4, r5, lsl #1
	ldrsh r2, [r2, #0x12]
	cmp r0, r2
	bne _0203B350
	sub r5, r5, #1
	ldr r2, _0203B738 ; =_020AFE5C
	b _0203B32C
_0203B318:
	ldr r3, [r2, #0x10]
	add r4, r3, r5, lsl #1
	ldrsh r3, [r4, #0x12]
	sub r5, r5, #1
	strh r3, [r4, #0x14]
_0203B32C:
	cmp r5, r8
	bge _0203B318
	ldr r2, _0203B738 ; =_020AFE5C
	mov r3, r8, lsl #1
	ldr r2, [r2, #0x10]
	add r8, r8, #1
	add r2, r2, r3
	strh r0, [r2, #0x12]
	b _0203B35C
_0203B350:
	add r5, r5, #1
_0203B354:
	cmp r5, r3
	blt _0203B2FC
_0203B35C:
	add r1, r1, #1
	cmp r1, #4
	blt _0203B2C0
	bl sub_020568A4
	bl sub_0203B7AC
	cmp r0, r8
	addge r8, r8, #1
	bl GetMainCharacter3MemberIdx
	bl sub_0203B7AC
	cmp r0, r8
	addge r8, r8, #1
	bl GetMainCharacter2MemberIdx
	bl sub_0203B7AC
	cmp r0, r8
	addge r8, r8, #1
	bl GetMainCharacter1MemberIdx
	bl sub_0203B7AC
	cmp r0, r8
	ldr r0, _0203B738 ; =_020AFE5C
	addge r8, r8, #1
	ldr r1, [r0, #0xc]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _0203B714
_0203B3BC: ; jump table
	b _0203B714 ; case 0
	b _0203B578 ; case 1
	b _0203B648 ; case 2
	b _0203B3D0 ; case 3
	b _0203B4A8 ; case 4
_0203B3D0:
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsh sb, [r0, #0xd4]
	cmp r8, sb
	bge _0203B714
	mov r0, r8, lsl #0x10
	mov sl, r0, asr #0x10
	b _0203B49C
_0203B3F0:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r1, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0, #0x10]
	ldr r3, [r1]
	add r0, r0, sl, lsl #1
	ldrsh r2, [r0, #0x12]
	mov r0, #0x44
	mov r1, #0
	smlabb r0, r2, r0, r3
	ldrsh r0, [r0, #4]
	bl GetKeyM2NSwitch
	mov r1, r8, lsl #0x10
	mov r6, r0
	mov r7, r1, asr #0x10
	ldr r5, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r4, _0203B738 ; =_020AFE5C
	mov fp, #0x44
	b _0203B46C
_0203B438:
	ldr r0, [r4, #0x10]
	ldr r2, [r5]
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, #0x12]
	mov r1, #0
	smlabb r0, r0, fp, r2
	ldrsh r0, [r0, #4]
	bl GetKeyM2NSwitch
	cmp r6, r0
	blt _0203B474
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_0203B46C:
	cmp r7, sl
	blt _0203B438
_0203B474:
	ldr r0, _0203B738 ; =_020AFE5C
	mov r1, r7
	ldr r0, [r0, #0x10]
	mov r2, sl
	add r0, r0, sl, lsl #1
	ldrsh r0, [r0, #0x12]
	bl sub_0203B83C
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_0203B49C:
	cmp sl, sb
	blt _0203B3F0
	b _0203B714
_0203B4A8:
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsh r7, [r0, #0xd4]
	cmp r8, r7
	bge _0203B714
	mov r0, r8, lsl #0x10
	mov sb, r0, asr #0x10
	b _0203B56C
_0203B4C8:
	ldr r4, _0203B738 ; =_020AFE5C
	mov r0, r8, lsl #0x10
	ldr r1, [r4, #0x10]
	mov r5, r0, asr #0x10
	add r0, r1, sb, lsl #1
	ldrsh r6, [r0, #0x12]
	b _0203B50C
_0203B4E4:
	ldr r1, [r4, #0x10]
	mov r0, r6
	add r1, r1, r5, lsl #1
	ldrsh r1, [r1, #0x12]
	bl sub_02052FF8
	cmp r0, #0
	bne _0203B514
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0203B50C:
	cmp r5, sb
	blt _0203B4E4
_0203B514:
	ldr r2, _0203B738 ; =_020AFE5C
	mov r6, sb
	ldr r0, [r2, #0x10]
	add r0, r0, sb, lsl #1
	ldrsh r0, [r0, #0x12]
	b _0203B548
_0203B52C:
	ldr r3, [r2, #0x10]
	sub r1, r6, #1
	add r4, r3, r6, lsl #1
	ldrsh r3, [r4, #0x10]
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
	strh r3, [r4, #0x12]
_0203B548:
	cmp r6, r5
	bgt _0203B52C
	ldr r1, _0203B738 ; =_020AFE5C
	add r2, sb, #1
	ldr r3, [r1, #0x10]
	mov r1, r2, lsl #0x10
	add r2, r3, r5, lsl #1
	strh r0, [r2, #0x12]
	mov sb, r1, asr #0x10
_0203B56C:
	cmp sb, r7
	blt _0203B4C8
	b _0203B714
_0203B578:
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsh sb, [r0, #0xd4]
	cmp r8, sb
	bge _0203B714
	mov r0, r8, lsl #0x10
	mov sl, r0, asr #0x10
	b _0203B63C
_0203B598:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r1, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0, #0x10]
	ldr r2, [r1]
	add r0, r0, sl, lsl #1
	ldrsh r1, [r0, #0x12]
	mov r0, #0x44
	smlabb r0, r1, r0, r2
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	mov r1, r8, lsl #0x10
	mov r7, r0
	mov r6, r1, asr #0x10
	ldr r5, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r4, _0203B738 ; =_020AFE5C
	mov fp, #0x44
	b _0203B60C
_0203B5DC:
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	add r0, r0, r6, lsl #1
	ldrsh r0, [r0, #0x12]
	smlabb r0, r0, fp, r1
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r7, r0
	blt _0203B614
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0203B60C:
	cmp r6, sl
	blt _0203B5DC
_0203B614:
	ldr r0, _0203B738 ; =_020AFE5C
	mov r1, r6
	ldr r0, [r0, #0x10]
	mov r2, sl
	add r0, r0, sl, lsl #1
	ldrsh r0, [r0, #0x12]
	bl sub_0203B83C
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_0203B63C:
	cmp sl, sb
	blt _0203B598
	b _0203B714
_0203B648:
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsh sb, [r0, #0xd4]
	cmp r8, sb
	bge _0203B714
	mov r0, r8, lsl #0x10
	mov sl, r0, asr #0x10
	b _0203B70C
_0203B668:
	ldr r0, _0203B738 ; =_020AFE5C
	ldr r1, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0, #0x10]
	ldr r2, [r1]
	add r0, r0, sl, lsl #1
	ldrsh r1, [r0, #0x12]
	mov r0, #0x44
	smlabb r0, r1, r0, r2
	ldrb r0, [r0, #1]
	bl FemaleToMaleForm
	mov r1, r8, lsl #0x10
	mov r6, r0
	mov r7, r1, asr #0x10
	ldr r5, _0203B740 ; =TEAM_MEMBER_TABLE_PTR
	ldr r4, _0203B738 ; =_020AFE5C
	mov fp, #0x44
	b _0203B6DC
_0203B6AC:
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, #0x12]
	smlabb r0, r0, fp, r1
	ldrb r0, [r0, #1]
	bl FemaleToMaleForm
	cmp r6, r0
	bgt _0203B6E4
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_0203B6DC:
	cmp r7, sl
	blt _0203B6AC
_0203B6E4:
	ldr r0, _0203B738 ; =_020AFE5C
	mov r1, r7
	ldr r0, [r0, #0x10]
	mov r2, sl
	add r0, r0, sl, lsl #1
	ldrsh r0, [r0, #0x12]
	bl sub_0203B83C
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_0203B70C:
	cmp sl, sb
	blt _0203B668
_0203B714:
	ldr r0, _0203B738 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	cmp r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_0202F9B8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0203B738: .word _020AFE5C
_0203B73C: .word _022AADF8
_0203B740: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0203AF28

	arm_func_start sub_0203B744
sub_0203B744: ; 0x0203B744
	stmdb sp!, {r3, lr}
	bl sub_0203AA20
	ldr r1, _0203B7A8 ; =_020AFE5C
	strh r0, [r1]
	bl sub_0203AAB0
	ldr r1, _0203B7A8 ; =_020AFE5C
	strh r0, [r1, #2]
	bl sub_0203AF28
	ldr r0, _0203B7A8 ; =_020AFE5C
	ldr r1, [r0, #0x10]
	add r0, r1, #0x400
	add r1, r1, #0x500
	ldrsb r0, [r0, #0x68]
	ldrsh r1, [r1, #0xd4]
	bl sub_0203117C
	ldr r0, _0203B7A8 ; =_020AFE5C
	ldrsh r0, [r0, #2]
	bl sub_0203AAF8
	ldr r2, _0203B7A8 ; =_020AFE5C
	mov r1, r0
	ldr r0, [r2, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_02031220
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203B7A8: .word _020AFE5C
	arm_func_end sub_0203B744

	arm_func_start sub_0203B7AC
sub_0203B7AC: ; 0x0203B7AC
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	beq _0203B830
	ldr r1, _0203B838 ; =_020AFE5C
	mov ip, #0
	ldr r2, [r1, #0x10]
	add r1, r2, #0x500
	ldrsh r3, [r1, #0xd4]
	b _0203B828
_0203B7D4:
	add r1, r2, ip, lsl #1
	ldrsh r1, [r1, #0x12]
	cmp r0, r1
	bne _0203B824
	mov lr, ip
	sub ip, ip, #1
	ldr r1, _0203B838 ; =_020AFE5C
	b _0203B808
_0203B7F4:
	ldr r2, [r1, #0x10]
	add r3, r2, ip, lsl #1
	ldrsh r2, [r3, #0x12]
	sub ip, ip, #1
	strh r2, [r3, #0x14]
_0203B808:
	cmp ip, #0
	bge _0203B7F4
	ldr r1, _0203B838 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strh r0, [r1, #0x12]
	mov r0, lr
	ldmia sp!, {r3, pc}
_0203B824:
	add ip, ip, #1
_0203B828:
	cmp ip, r3
	blt _0203B7D4
_0203B830:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203B838: .word _020AFE5C
	arm_func_end sub_0203B7AC

	arm_func_start sub_0203B83C
sub_0203B83C: ; 0x0203B83C
	stmdb sp!, {r4, lr}
	ldr r3, _0203B880 ; =_020AFE5C
	b _0203B864
_0203B848:
	ldr r4, [r3, #0x10]
	sub ip, r2, #1
	add r4, r4, r2, lsl #1
	ldrsh lr, [r4, #0x10]
	mov r2, ip, lsl #0x10
	mov r2, r2, asr #0x10
	strh lr, [r4, #0x12]
_0203B864:
	cmp r2, r1
	bgt _0203B848
	ldr r2, _0203B880 ; =_020AFE5C
	ldr r2, [r2, #0x10]
	add r1, r2, r1, lsl #1
	strh r0, [r1, #0x12]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203B880: .word _020AFE5C
	arm_func_end sub_0203B83C

	arm_func_start sub_0203B884
sub_0203B884: ; 0x0203B884
	stmdb sp!, {r3, lr}
	ldr r0, _0203B918 ; =_020AFE5C
	ldr r1, [r0, #0xc]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _0203B8DC
_0203B89C: ; jump table
	b _0203B8D4 ; case 0
	b _0203B8B0 ; case 1
	b _0203B8BC ; case 2
	b _0203B8C8 ; case 3
	b _0203B8D4 ; case 4
_0203B8B0:
	mov r1, #2
	str r1, [r0, #0xc]
	b _0203B8DC
_0203B8BC:
	mov r1, #3
	str r1, [r0, #0xc]
	b _0203B8DC
_0203B8C8:
	mov r1, #4
	str r1, [r0, #0xc]
	b _0203B8DC
_0203B8D4:
	mov r1, #1
	str r1, [r0, #0xc]
_0203B8DC:
	bl sub_0203B744
	ldr r0, _0203B918 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	bl sub_0203115C
	ldr r0, _0203B918 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x69]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F9B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203B918: .word _020AFE5C
	arm_func_end sub_0203B884

	arm_func_start sub_0203B91C
sub_0203B91C: ; 0x0203B91C
	stmdb sp!, {r3, lr}
	ldr r0, _0203BA18 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #6]
	cmp r0, r1
	bne _0203B968
	ldr r0, _0203BA1C ; =_0209C658
	mov ip, #5
	ldr r3, _0203BA20 ; =_0209C688
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0203BA18 ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strb r0, [r1, #0x506]
	ldmia sp!, {r3, pc}
_0203B968:
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0203BA18 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0203B9E8
_0203B994: ; jump table
	b _0203B9AC ; case 0
	b _0203B9BC ; case 1
	b _0203B9E8 ; case 2
	b _0203B9CC ; case 3
	b _0203B9DC ; case 4
	b _0203B9E8 ; case 5
_0203B9AC:
	ldr r0, _0203BA18 ; =_020AFE5C
	mov r1, #1
	str r1, [r0, #0xc]
	b _0203B9E8
_0203B9BC:
	ldr r0, _0203BA18 ; =_020AFE5C
	mov r1, #2
	str r1, [r0, #0xc]
	b _0203B9E8
_0203B9CC:
	ldr r0, _0203BA18 ; =_020AFE5C
	mov r1, #3
	str r1, [r0, #0xc]
	b _0203B9E8
_0203B9DC:
	ldr r0, _0203BA18 ; =_020AFE5C
	mov r1, #4
	str r1, [r0, #0xc]
_0203B9E8:
	ldr r0, _0203BA18 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #6]
	bl CloseSimpleMenu
	ldr r0, _0203BA18 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x506]
	bl sub_0203B744
	bl sub_0203A6BC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203BA18: .word _020AFE5C
_0203BA1C: .word _0209C658
_0203BA20: .word _0209C688
	arm_func_end sub_0203B91C

	arm_func_start sub_0203BA24
sub_0203BA24: ; 0x0203BA24
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x58
	ldr r4, _0203BA78 ; =_0209C70C
	add lr, sp, #0
	mov ip, #5
_0203BA38:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0203BA38
	ldr r2, _0203BA7C ; =_020AFE5C
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, [r2, #0x10]
	ldr r1, [r0, #0x508]
	cmp r1, #0x16
	bge _0203BA70
	add r0, sp, #0
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0203BA70:
	add sp, sp, #0x58
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203BA78: .word _0209C70C
_0203BA7C: .word _020AFE5C
	arm_func_end sub_0203BA24

	arm_func_start sub_0203BA80
sub_0203BA80: ; 0x0203BA80
	stmdb sp!, {r3, lr}
	ldr r0, _0203BABC ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x400
	ldrsb r0, [r0, #0x68]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_020311D4
	ldr r1, _0203BABC ; =_020AFE5C
	ldr r1, [r1, #0x10]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x12]
	bl sub_0203C9A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203BABC: .word _020AFE5C
	arm_func_end sub_0203BA80

	arm_func_start sub_0203BAC0
sub_0203BAC0: ; 0x0203BAC0
	cmp r1, #0
	blt _0203BAD0
	cmp r1, #0x11
	blt _0203BAD8
_0203BAD0:
	mov r1, #0
	b _0203BADC
_0203BAD8:
	add r1, r1, #1
_0203BADC:
	ldr ip, _0203BAE8 ; =sub_02024B94
	and r1, r1, #0xff
	bx ip
	.align 2, 0
_0203BAE8: .word sub_02024B94
	arm_func_end sub_0203BAC0

	arm_func_start sub_0203BAEC
sub_0203BAEC: ; 0x0203BAEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	mov sl, r0
	mov r7, r8
	mov fp, #1
	mov r4, #0x44
	ldr r6, _0203BB78 ; =TEAM_MEMBER_TABLE_PTR
	ldr r5, _0203BB7C ; =_020AFE5C
	b _0203BB60
_0203BB10:
	add r0, r1, r8, lsl #1
	ldrsh r2, [r0, #0x12]
	ldr r0, [r6]
	mov r1, r7
	smulbb sb, r2, r4
	add r0, r0, sb
	ldrsh r0, [r0, #4]
	bl GetType
	cmp sl, r0
	beq _0203BB54
	ldr r0, [r6]
	mov r1, fp
	add r0, r0, sb
	ldrsh r0, [r0, #4]
	bl GetType
	cmp sl, r0
	bne _0203BB5C
_0203BB54:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0203BB5C:
	add r8, r8, #1
_0203BB60:
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #4]
	cmp r8, r0
	blt _0203BB10
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0203BB78: .word TEAM_MEMBER_TABLE_PTR
_0203BB7C: .word _020AFE5C
	arm_func_end sub_0203BAEC

	arm_func_start sub_0203BB80
sub_0203BB80: ; 0x0203BB80
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, #0
	ldr r8, _0203BBE4 ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #0x44
	ldr r7, _0203BBE8 ; =_020AFE5C
	b _0203BBCC
_0203BB9C:
	add r0, r1, r4, lsl #1
	ldrsh r0, [r0, #0x12]
	ldr r1, [r8]
	smlabb r0, r0, r6, r1
	ldrsh r0, [r0, #4]
	bl GetDexNumber
	cmp r5, r0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0203BBCC:
	ldr r1, [r7, #0x10]
	ldr r0, [r1, #4]
	cmp r4, r0
	blt _0203BB9C
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0203BBE4: .word TEAM_MEMBER_TABLE_PTR
_0203BBE8: .word _020AFE5C
	arm_func_end sub_0203BB80

	arm_func_start sub_0203BBEC
sub_0203BBEC: ; 0x0203BBEC
	stmdb sp!, {r4, lr}
	ldr r1, _0203BC48 ; =_020AFE5C
	ldr r2, _0203BC4C ; =TEAM_MEMBER_TABLE_PTR
	ldr lr, [r1, #0x10]
	ldr ip, [r2]
	ldr r4, [lr, #4]
	mov r3, #0
	mov r2, #0x44
	b _0203BC38
_0203BC10:
	add r1, lr, r3, lsl #1
	ldrsh r1, [r1, #0x12]
	smlabb r1, r1, r2, ip
	ldrb r1, [r1, #0x3a]
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_0203BC38:
	cmp r3, r4
	blt _0203BC10
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203BC48: .word _020AFE5C
_0203BC4C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0203BBEC

	arm_func_start sub_0203BC50
sub_0203BC50: ; 0x0203BC50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	mov r5, #0
	add r4, sp, #0
	ldr sb, _0203BCC4 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0x44
	ldr r8, _0203BCC8 ; =_020AFE5C
	b _0203BCAC
_0203BC70:
	add r0, r1, r5, lsl #1
	ldrsh r0, [r0, #0x12]
	ldr r1, [sb]
	smlabb r0, r0, r7, r1
	ldrsh r0, [r0, #4]
	bl GetNameString
	str r0, [sp]
	mov r0, r4
	bl sub_0202065C
	cmp r6, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0203BCAC:
	ldr r1, [r8, #0x10]
	ldr r0, [r1, #4]
	cmp r5, r0
	blt _0203BC70
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0203BCC4: .word TEAM_MEMBER_TABLE_PTR
_0203BCC8: .word _020AFE5C
	arm_func_end sub_0203BC50

	arm_func_start sub_0203BCCC
sub_0203BCCC: ; 0x0203BCCC
	ldr r0, _0203BCE4 ; =_020AFE5C
	ldr ip, _0203BCE8 ; =sub_02039B0C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x1a8
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_0203BCE4: .word _020AFE5C
_0203BCE8: .word sub_02039B0C
	arm_func_end sub_0203BCCC

	arm_func_start sub_0203BCEC
sub_0203BCEC: ; 0x0203BCEC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _0203BE0C ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #7]
	cmp r0, r1
	bne _0203BD3C
	ldr r0, _0203BE10 ; =_0209C678
	mov ip, #6
	ldr r3, _0203BE14 ; =_0209C6B8
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0203BE0C ; =_020AFE5C
	ldr r1, [r1, #0x10]
	strb r0, [r1, #0x507]
	b _0203BE04
_0203BD3C:
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0203BE04
	ldr r0, _0203BE0C ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #7]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _0203BE0C ; =_020AFE5C
	mov r0, r0, lsl #0x10
	ldr r1, [r1, #0x10]
	mov r4, r0, asr #0x10
	add r0, r1, #0x500
	ldrsb r0, [r0, #7]
	bl CloseSimpleMenu
	ldr r0, _0203BE0C ; =_020AFE5C
	mvn r2, #1
	ldr r1, [r0, #0x10]
	cmp r4, #6
	strb r2, [r1, #0x507]
	addls pc, pc, r4, lsl #2
	b _0203BE00
_0203BD94: ; jump table
	b _0203BDB0 ; case 0
	b _0203BE00 ; case 1
	b _0203BDC0 ; case 2
	b _0203BDD0 ; case 3
	b _0203BDE0 ; case 4
	b _0203BE00 ; case 5
	b _0203BDF0 ; case 6
_0203BDB0:
	ldr r0, [r0, #0x10]
	mov r1, #7
	str r1, [r0, #0x508]
	b _0203BE04
_0203BDC0:
	ldr r0, [r0, #0x10]
	mov r1, #1
	str r1, [r0, #0x508]
	b _0203BE04
_0203BDD0:
	ldr r0, [r0, #0x10]
	mov r1, #0xa
	str r1, [r0, #0x508]
	b _0203BE04
_0203BDE0:
	ldr r0, [r0, #0x10]
	mov r1, #0xf
	str r1, [r0, #0x508]
	b _0203BE04
_0203BDF0:
	ldr r0, [r0, #0x10]
	mov r1, #0x14
	str r1, [r0, #0x508]
	b _0203BE04
_0203BE00:
	bl sub_0203A6BC
_0203BE04:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0203BE0C: .word _020AFE5C
_0203BE10: .word _0209C678
_0203BE14: .word _0209C6B8
	arm_func_end sub_0203BCEC

	arm_func_start sub_0203BE18
sub_0203BE18: ; 0x0203BE18
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r3, _0203BECC ; =_020AFE5C
	mvn r2, #1
	ldr r0, [r3, #0x10]
	add r1, r0, #0x500
	ldrsb r0, [r1, #7]
	cmp r0, r2
	bne _0203BE94
#ifdef JAPAN
	ldr r0, _0203C2B0 ; =0x000023B0
	mov r2, #0x10
	strh r0, [r1, #0x18]
	ldr r1, [r3, #0x10]
	mov r0, #0x11
	str r2, [r1, #0x51c]
#else
	mov r0, #0x308
	strh r0, [r1, #0x18]
	ldr r0, [r3, #0x10]
	mov r1, #0x10
	str r1, [r0, #0x51c]
	mov r0, #0x11
#endif
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldr r2, [r3, #0x10]
	ldr r0, _0203BED0 ; =_0209C618
	ldr r1, _0203BED4 ; =0x00001833
	ldr r3, _0203BED8 ; =sub_0203BAC0
	add r2, r2, #0x510
	bl CreateAdvancedMenu
	ldr r1, _0203BECC ; =_020AFE5C
	mov r2, #2
	ldr r3, [r1, #0x10]
	strb r0, [r3, #0x50c]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	b _0203BEC4
_0203BE94:
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0203BEC4
	ldr r0, _0203BECC ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #7]
	bl CloseSimpleMenu
	ldr r0, _0203BECC ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x507]
_0203BEC4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203BECC: .word _020AFE5C
#ifdef JAPAN
_0203C2B0: .word 0x000023B0
#endif
_0203BED0: .word _0209C618
_0203BED4: .word 0x00001833
_0203BED8: .word sub_0203BAC0
	arm_func_end sub_0203BE18

	arm_func_start sub_0203BEDC
sub_0203BEDC: ; 0x0203BEDC
	stmdb sp!, {r3, lr}
	ldr r0, _0203BF0C ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xc]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	ldreq r0, _0203BF0C ; =_020AFE5C
	moveq r1, #3
	ldreq r0, [r0, #0x10]
	streq r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203BF0C: .word _020AFE5C
	arm_func_end sub_0203BEDC

	arm_func_start sub_0203BF10
sub_0203BF10: ; 0x0203BF10
	stmdb sp!, {r4, lr}
	ldr r0, _0203C028 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xc]
	cmp r0, r1
	bne _0203BF48
	bl sub_0203A6BC
	ldr r0, _0203C028 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r4, pc}
_0203BF48:
	bl IsAdvancedMenuActive2
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _0203C028 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xc]
	bl GetAdvancedMenuResult
	and r0, r0, #0xff
	add r0, r0, #1
	and r4, r0, #0xff
	cmp r4, #1
	blo _0203BFEC
	cmp r4, #0x12
	bhs _0203BFEC
	mov r0, r4
	bl sub_0203BAEC
	cmp r0, #0
	bne _0203BFBC
	ldr r0, _0203C028 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	bl sub_0203A658
	ldr r0, _0203C028 ; =_020AFE5C
	mov r1, #4
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	b _0203C000
_0203BFBC:
	ldr r0, _0203C02C ; =_022AADF8
	ldr r1, _0203C028 ; =_020AFE5C
	mov r2, #1
	str r2, [r1, #8]
	strb r4, [r0]
	bl sub_0203B744
	bl sub_0203A6BC
	ldr r0, _0203C028 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	b _0203C000
_0203BFEC:
	bl sub_0203A6BC
	ldr r0, _0203C028 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
_0203C000:
	ldr r0, _0203C028 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xc]
	bl CloseAdvancedMenu
	ldr r0, _0203C028 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x50c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203C028: .word _020AFE5C
_0203C02C: .word _022AADF8
	arm_func_end sub_0203BF10

	arm_func_start sub_0203C030
sub_0203C030: ; 0x0203C030
	stmdb sp!, {r3, lr}
	ldr r0, _0203C078 ; =_0209C648
	bl CreateDialogueBox
	ldr r3, _0203C07C ; =_020AFE5C
	ldr r1, _0203C080 ; =0x00000418
	ldr ip, [r3, #0x10]
	ldr r2, _0203C084 ; =0x0000030B
	strb r0, [ip, #0x505]
	ldr r0, [r3, #0x10]
	mov r3, #0
	add r0, r0, #0x500
	ldrsb r0, [r0, #5]
	bl ShowStringIdInDialogueBox
	ldr r0, _0203C07C ; =_020AFE5C
	mov r1, #5
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C078: .word _0209C648
_0203C07C: .word _020AFE5C
_0203C080: .word 0x00000418
#ifdef JAPAN
_0203C084: .word 0x000023B3
#else
_0203C084: .word 0x0000030B
#endif
	arm_func_end sub_0203C030

	arm_func_start sub_0203C088
sub_0203C088: ; 0x0203C088
	stmdb sp!, {r3, lr}
	ldr r0, _0203C0D0 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #5]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0203C0D0 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #5]
	bl sub_0202F2C4
	ldr r0, _0203C0D0 ; =_020AFE5C
	mov r1, #6
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C0D0: .word _020AFE5C
	arm_func_end sub_0203C088

	arm_func_start sub_0203C0D4
sub_0203C0D4: ; 0x0203C0D4
	stmdb sp!, {r3, lr}
	ldr r0, _0203C120 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #5]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseDialogueBox
	ldr r0, _0203C120 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x505]
	bl sub_0203A6BC
	ldr r0, _0203C120 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C120: .word _020AFE5C
	arm_func_end sub_0203C0D4

	arm_func_start sub_0203C124
sub_0203C124: ; 0x0203C124
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _0203C1E8 ; =_020AFE5C
#ifdef JAPAN
	mov r3, #0x1ec
	ldr r0, [r1, #0x10]
	mov lr, #1
	str lr, [r0, #0x5ac]
	ldr r0, [r1, #0x10]
	mov r2, #3
#else
	mov lr, #1
	ldr r0, [r1, #0x10]
	mov r2, #3
	str lr, [r0, #0x5ac]
	ldr r0, [r1, #0x10]
	mov r3, #0x1ec
#endif
	str r2, [r0, #0x5b8]
	ldr r0, [r1, #0x10]
	mov ip, #0x50
	str lr, [r0, #0x5b0]
	ldr r0, [r1, #0x10]
	mov r2, #0x16
	str r3, [r0, #0x5b4]
	ldr r0, [r1, #0x10]
#ifdef JAPAN
	add r3, r3, #0x21c0
#else
	mov r3, #0x304
#endif
	str ip, [r0, #0x5c8]
	ldr r0, [r1, #0x10]
	mov ip, #0x10
	str r2, [r0, #0x5cc]
	ldr r0, [r1, #0x10]
	mov r2, #0
	add r0, r0, #0x500
	strh r3, [r0, #0xe0]
	ldr r3, [r1, #0x10]
	ldr r0, _0203C1EC ; =_0209C628
	str ip, [r3, #0x5e4]
	str r2, [sp]
	str r2, [sp, #4]
	ldr r2, [r1, #0x10]
	ldr r1, _0203C1F0 ; =0x00401807
	add r2, r2, #0x1d8
	ldr r3, _0203C1F4 ; =sub_0203BCCC
	add r2, r2, #0x400
	bl CreateAdvancedTextBox
	ldr r1, _0203C1E8 ; =_020AFE5C
	mov r2, #8
	ldr r3, [r1, #0x10]
	strb r0, [r3, #0x5bc]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x1a8
	add r0, r0, #0x400
	bl sub_020395CC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C1E8: .word _020AFE5C
_0203C1EC: .word _0209C628
_0203C1F0: .word 0x00401807
_0203C1F4: .word sub_0203BCCC
	arm_func_end sub_0203C124

	arm_func_start sub_0203C1F8
sub_0203C1F8: ; 0x0203C1F8
	stmdb sp!, {r3, lr}
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x1a8
	add r0, r0, #0x400
	bl sub_020396E4
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0203C21C: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _0203C22C ; case 1
	b _0203C2F4 ; case 2
	b _0203C244 ; case 3
_0203C22C:
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xbc]
	bl SetAdvancedTextBoxField0x1C2
	ldmia sp!, {r3, pc}
_0203C244:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xbc]
	bl SetAdvancedTextBoxState5
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xbc]
	bl CloseAdvancedTextBox
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0x5a8]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0203BB80
	cmp r0, #0
	bne _0203C2BC
	ldr r0, _0203C324 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	bl sub_0203A658
	ldr r0, _0203C324 ; =_020AFE5C
	mov r1, #4
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
_0203C2BC:
	ldr r0, _0203C324 ; =_020AFE5C
	mov r1, #2
	str r1, [r0, #8]
	ldr r1, [r0, #0x10]
	ldr r0, _0203C328 ; =_022AADF8
	ldr r1, [r1, #0x5a8]
	strh r1, [r0]
	bl sub_0203B744
	bl sub_0203A6BC
	ldr r0, _0203C324 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
_0203C2F4:
	mov r0, #1
	bl PlaySeVolumeWrapper
	ldr r0, _0203C324 ; =_020AFE5C
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xbc]
	bl SetAdvancedTextBoxState5
	ldr r0, _0203C324 ; =_020AFE5C
	mov r1, #9
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C324: .word _020AFE5C
_0203C328: .word _022AADF8
	arm_func_end sub_0203C1F8

	arm_func_start sub_0203C32C
sub_0203C32C: ; 0x0203C32C
	stmdb sp!, {r3, lr}
	ldr r0, _0203C378 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	add r0, r0, #0x500
	ldrsb r0, [r0, #0xbc]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseAdvancedTextBox
	ldr r0, _0203C378 ; =_020AFE5C
	mvn r1, #1
	ldr r0, [r0, #0x10]
	strb r1, [r0, #0x5bc]
	bl sub_0203A6BC
	ldr r0, _0203C378 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C378: .word _020AFE5C
	arm_func_end sub_0203C32C

	arm_func_start sub_0203C37C
sub_0203C37C: ; 0x0203C37C
	stmdb sp!, {r3, lr}
	bl sub_0203A658
	ldr r1, _0203C3A8 ; =_020AFE5C
	mov r3, #0xa
	ldr r0, [r1, #0x10]
	mov r2, #0xb
	add r0, r0, #0x800
	strh r3, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C3A8: .word _020AFE5C
	arm_func_end sub_0203C37C

	arm_func_start sub_0203C3AC
sub_0203C3AC: ; 0x0203C3AC
	stmdb sp!, {r3, lr}
	ldr r1, _0203C404 ; =_020AFE5C
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r2, [r0, #0x9e]
	sub r2, r2, #1
	strh r2, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r0, [r0, #0x9e]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mov r3, r1
	mov r0, #9
	bl ShowKeyboard
	ldr r0, _0203C404 ; =_020AFE5C
	mov r1, #0xc
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C404: .word _020AFE5C
	arm_func_end sub_0203C3AC

	arm_func_start sub_0203C408
sub_0203C408: ; 0x0203C408
	stmdb sp!, {r4, lr}
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0203C484
	bl GetKeyboardStringResult
	ldrb r0, [r0]
	bl sub_020251F0
	mov r4, r0
	bl sub_0203BC50
	cmp r0, #0
	bne _0203C458
	ldr r0, _0203C4B0 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	ldr r0, _0203C4B0 ; =_020AFE5C
	mov r1, #0x15
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r4, pc}
_0203C458:
	ldr r0, _0203C4B4 ; =_022AADF8
	ldr r1, _0203C4B0 ; =_020AFE5C
	mov r2, #4
	str r2, [r1, #8]
	strh r4, [r0]
	bl sub_0203B744
	ldr r0, _0203C4B0 ; =_020AFE5C
	mov r1, #0xd
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r4, pc}
_0203C484:
	cmp r0, #2
	ldmneia sp!, {r4, pc}
	ldr r0, _0203C4B0 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	ldr r0, _0203C4B0 ; =_020AFE5C
	mov r1, #0xd
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203C4B0: .word _020AFE5C
_0203C4B4: .word _022AADF8
	arm_func_end sub_0203C408

	arm_func_start sub_0203C4B8
sub_0203C4B8: ; 0x0203C4B8
	stmdb sp!, {r3, lr}
	bl sub_02037468
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0203C4EC ; =_020AFE5C
	mov r3, #0xa
	ldr r0, [r1, #0x10]
	mov r2, #0xe
	add r0, r0, #0x800
	strh r3, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C4EC: .word _020AFE5C
	arm_func_end sub_0203C4B8

	arm_func_start sub_0203C4F0
sub_0203C4F0: ; 0x0203C4F0
	stmdb sp!, {r3, lr}
	ldr r1, _0203C538 ; =_020AFE5C
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r2, [r0, #0x9e]
	sub r2, r2, #1
	strh r2, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r0, [r0, #0x9e]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_0203A6BC
	ldr r0, _0203C538 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C538: .word _020AFE5C
	arm_func_end sub_0203C4F0

	arm_func_start sub_0203C53C
sub_0203C53C: ; 0x0203C53C
	stmdb sp!, {r3, lr}
	bl sub_0203A658
	ldr r1, _0203C568 ; =_020AFE5C
	mov r3, #0xa
	ldr r0, [r1, #0x10]
	mov r2, #0x10
	add r0, r0, #0x800
	strh r3, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C568: .word _020AFE5C
	arm_func_end sub_0203C53C

	arm_func_start sub_0203C56C
sub_0203C56C: ; 0x0203C56C
	stmdb sp!, {r3, lr}
	ldr r1, _0203C5C4 ; =_020AFE5C
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r2, [r0, #0x9e]
	sub r2, r2, #1
	strh r2, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r0, [r0, #0x9e]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mov r3, r1
	mov r0, #4
	bl ShowKeyboard
	ldr r0, _0203C5C4 ; =_020AFE5C
	mov r1, #0x11
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C5C4: .word _020AFE5C
	arm_func_end sub_0203C56C

	arm_func_start sub_0203C5C8
sub_0203C5C8: ; 0x0203C5C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x40
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0203C650
	bl GetKeyboardStringResult
	mov r1, r0
	add r0, sp, #0
	bl StrcpySimple
	ldrb r0, [sp]
	bl sub_0203BBEC
	cmp r0, #0
	bne _0203C620
	ldr r0, _0203C680 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	ldr r0, _0203C680 ; =_020AFE5C
	mov r1, #0x15
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	b _0203C678
_0203C620:
	ldrb r2, [sp]
	ldr r0, _0203C684 ; =_022AADF8
	ldr r1, _0203C680 ; =_020AFE5C
	mov r3, #3
	str r3, [r1, #8]
	strb r2, [r0]
	bl sub_0203B744
	ldr r0, _0203C680 ; =_020AFE5C
	mov r1, #0x12
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	b _0203C678
_0203C650:
	cmp r0, #2
	bne _0203C678
	ldr r0, _0203C680 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	ldr r0, _0203C680 ; =_020AFE5C
	mov r1, #0x12
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
_0203C678:
	add sp, sp, #0x40
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C680: .word _020AFE5C
_0203C684: .word _022AADF8
	arm_func_end sub_0203C5C8

	arm_func_start sub_0203C688
sub_0203C688: ; 0x0203C688
	stmdb sp!, {r3, lr}
	bl sub_02037468
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0203C6BC ; =_020AFE5C
	mov r3, #0xa
	ldr r0, [r1, #0x10]
	mov r2, #0x13
	add r0, r0, #0x800
	strh r3, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	str r2, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C6BC: .word _020AFE5C
	arm_func_end sub_0203C688

	arm_func_start sub_0203C6C0
sub_0203C6C0: ; 0x0203C6C0
	stmdb sp!, {r3, lr}
	ldr r1, _0203C708 ; =_020AFE5C
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r2, [r0, #0x9e]
	sub r2, r2, #1
	strh r2, [r0, #0x9e]
	ldr r0, [r1, #0x10]
	add r0, r0, #0x800
	ldrsh r0, [r0, #0x9e]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_0203A6BC
	ldr r0, _0203C708 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C708: .word _020AFE5C
	arm_func_end sub_0203C6C0

	arm_func_start sub_0203C70C
sub_0203C70C: ; 0x0203C70C
	stmdb sp!, {r3, lr}
	ldr r0, _0203C738 ; =_020AFE5C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0203B744
	bl sub_0203A6BC
	ldr r0, _0203C738 ; =_020AFE5C
	mov r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C738: .word _020AFE5C
	arm_func_end sub_0203C70C

	arm_func_start sub_0203C73C
sub_0203C73C: ; 0x0203C73C
	stmdb sp!, {r3, lr}
	bl sub_02037468
	cmp r0, #0
	ldrne r0, _0203C75C ; =_020AFE5C
	movne r1, #4
	ldrne r0, [r0, #0x10]
	strne r1, [r0, #0x508]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C75C: .word _020AFE5C
	arm_func_end sub_0203C73C
