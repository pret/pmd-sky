	.include "asm/macros.inc"
	.include "main_02034974.inc"

	.text

	arm_func_start InitMenuWithWindowExtraInfo
InitMenuWithWindowExtraInfo: ; 0x02034974
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _02034A34 ; =MENU_CONTROL_PTR
	mov r5, r1
	ldr r1, [r3]
	mov r6, r0
	add r1, r1, #0xc4
	mov r4, r2
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _02034A2C
	ldr r0, _02034A34 ; =MENU_CONTROL_PTR
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
	ldr ip, _02034A34 ; =MENU_CONTROL_PTR
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
_02034A34: .word MENU_CONTROL_PTR
	arm_func_end InitMenuWithWindowExtraInfo

	arm_func_start CopyMenuControlWindowExtraInfo
CopyMenuControlWindowExtraInfo: ; 0x02034A38
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02034A7C ; =MENU_CONTROL_PTR
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
_02034A7C: .word MENU_CONTROL_PTR
	arm_func_end CopyMenuControlWindowExtraInfo

	arm_func_start HandleMenus
HandleMenus: ; 0x02034A80
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r0, _02034C9C ; =MENU_CONTROL_PTR
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
	ldr ip, _02034C9C ; =MENU_CONTROL_PTR
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
	ldr r0, _02034C9C ; =MENU_CONTROL_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
_02034B34:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02034B5C
	blx r0
	cmp r0, #0
	ldreq r0, _02034C9C ; =MENU_CONTROL_PTR
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #0xd4]
	beq _02034C94
_02034B5C:
	ldr r0, _02034C9C ; =MENU_CONTROL_PTR
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
	ldr r0, _02034C9C ; =MENU_CONTROL_PTR
	mov r1, #3
	ldr r0, [r0]
	cmp r5, #4
	str r1, [r0, #0xd4]
	bne _02034BE4
	bl FreeActiveMenu
	ldr r0, _02034CA0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr ip, _02034C9C ; =MENU_CONTROL_PTR
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	mov r1, #0
	strb r1, [r0, #0xc0]
	ldr r0, [ip]
	str r1, [r0, #0xd4]
_02034BE4:
	ldr r0, _02034C9C ; =MENU_CONTROL_PTR
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
	ldr ip, _02034C9C ; =MENU_CONTROL_PTR
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
	ldr ip, _02034C9C ; =MENU_CONTROL_PTR
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
_02034C9C: .word MENU_CONTROL_PTR
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
	bl CopyOrInitPreprocessorArgs
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
	bl CopyOrInitPreprocessorArgs
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
