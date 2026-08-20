	.include "asm/macros.inc"
	.include "overlay_00.inc"

	.text

; https://decomp.me/scratch/rqTSp
	arm_func_start ov00_022BCA80
ov00_022BCA80: ; 0x022BCA80
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022BCB9C ; =ov00_023187A0
	mov r5, r0
	ldr r0, [r1, #8]
	cmp r0, #0
	addgt r0, r0, #1
	strgt r0, [r1, #8]
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, pc}
	bl OS_InitAlarm
	mov r0, #0x720
	mov r1, #8
	bl MemAlloc
	mov r6, r0
	add r0, r6, #0x1f
	bic r0, r0, #0x1f
	bl Dwc_Init
	mov r4, r0
	mov r0, r6
	bl MemFree
	mov r0, #0x40000
	mov r1, #8
	bl MemAlloc
	ldr r3, _022BCB9C ; =ov00_023187A0
	add r1, r0, #0x1f
	str r0, [r3, #0x10]
	bic r1, r1, #0x1f
	str r1, [r3, #0x20]
	mov r2, #0
	str r2, [r1]
	ldr ip, [r3, #0x20]
	ldr r1, [r3, #0x10]
	ldr r0, _022BCBA0 ; =0x0003FFE0
	sub r1, ip, r1
	sub r0, r0, r1
	mov r0, r0, lsr #5
	str r0, [ip, #4]
	ldr r1, [r3, #0x20]
	sub ip, r2, #1
	str ip, [r1, #8]
	ldr lr, [r3, #0x20]
	ldr r0, _022BCBA4 ; =ov00_022BDE30
	ldr ip, [lr, #4]
	ldr r1, _022BCBA8 ; =ov00_022BDF1C
	add ip, lr, ip, lsl #5
	add ip, ip, #0x20
	str ip, [r3, #0x18]
	str r2, [r3, #0x14]
	bl Dwc_SetMemFunc
	ldr r0, _022BCB9C ; =ov00_023187A0
	cmp r4, #3
	str r5, [r0, #0xc]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	addls pc, pc, r4, lsl #2
	b _022BCB94
_022BCB64: ; jump table
	b _022BCB74 ; case 0
	b _022BCB7C ; case 1
	b _022BCB84 ; case 2
	b _022BCB8C ; case 3
_022BCB74:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022BCB7C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022BCB84:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_022BCB8C:
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
_022BCB94:
	mov r0, #4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BCB9C: .word ov00_023187A0
_022BCBA0: .word 0x0003FFE0
_022BCBA4: .word ov00_022BDE30
_022BCBA8: .word ov00_022BDF1C
	arm_func_end ov00_022BCA80

	arm_func_start ov00_022BCBAC
ov00_022BCBAC: ; 0x022BCBAC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _022BCBF0
	ldr r0, _022BCC2C ; =ov00_023187A0
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022BCBE0
	bl MemFree
	ldr r0, _022BCC2C ; =ov00_023187A0
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x20]
	str r1, [r0, #0x18]
_022BCBE0:
	ldr r0, _022BCC2C ; =ov00_023187A0
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
_022BCBF0:
	ldr r0, _022BCC2C ; =ov00_023187A0
	ldr r1, [r0, #8]
	cmp r1, #0
	ldmleia sp!, {r3, pc}
	subs r1, r1, #1
	str r1, [r0, #8]
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _022BCC2C ; =ov00_023187A0
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x20]
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BCC2C: .word ov00_023187A0
	arm_func_end ov00_022BCBAC

	arm_func_start ov00_022BCC30
ov00_022BCC30: ; 0x022BCC30
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _022BCC64
	ldr r0, _022BCC88 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_CheckUserData
	cmp r0, #0
	beq _022BCC64
	ldr r0, _022BCC88 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_ReportUserData
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BCC64:
#ifdef EUROPE
	bl GetLanguage
	ldr r1, _022BCC88 ; =ov00_023187A0
	mov r3, r0
	ldr r2, _022BD5D8 ; =ov00_02318758_EU
	ldr r0, [r1, #0xc]
	ldr r1, [r2, r3, lsl #2]
#else
	ldr r0, _022BCC88 ; =ov00_023187A0
	ldr r1, _022BCC8C ; =0x59465945
	ldr r0, [r0, #0xc]
#endif
	bl Dwc_CreateUserData
	ldr r0, _022BCC88 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_ReportUserData
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BCC88: .word ov00_023187A0
#if defined(EUROPE)
_022BD5D8: .word ov00_02318758_EU
#elif defined(JAPAN)
_022BCC8C: .word 0x5946594A
#else
_022BCC8C: .word 0x59465945
#endif
	arm_func_end ov00_022BCC30

	arm_func_start ov00_022BCC90
ov00_022BCC90: ; 0x022BCC90
	stmdb sp!, {r3, lr}
	ldr r0, _022BCCA8 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_CheckDirtyFlag
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BCCA8: .word ov00_023187A0
	arm_func_end ov00_022BCC90

	arm_func_start ov00_022BCCAC
ov00_022BCCAC: ; 0x022BCCAC
	stmdb sp!, {r3, lr}
	ldr r0, _022BCCC4 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_CheckHasProfile
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BCCC4: .word ov00_023187A0
	arm_func_end ov00_022BCCAC

	arm_func_start ov00_022BCCC8
ov00_022BCCC8: ; 0x022BCCC8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	add r0, sp, #0
	bl ov00_022BCD4C
	ldr r0, _022BCCF0 ; =ov00_023187A0
	add r1, sp, #0
	ldr r0, [r0, #0xc]
	bl Dwc_GetGsProfileId
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_022BCCF0: .word ov00_023187A0
	arm_func_end ov00_022BCCC8

	arm_func_start ov00_022BCCF4
ov00_022BCCF4: ; 0x022BCCF4
	stmdb sp!, {r3, lr}
	ldr r0, _022BCD0C ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_CheckValidConsole
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BCD0C: .word ov00_023187A0
	arm_func_end ov00_022BCCF4

	arm_func_start ov00_022BCD10
ov00_022BCD10: ; 0x022BCD10
	ldr r1, _022BCD24 ; =ov00_023187A0
	ldr ip, _022BCD28 ; =MemcpySimple
	mov r2, #0x40
	ldr r1, [r1, #0xc]
	bx ip
	.align 2, 0
_022BCD24: .word ov00_023187A0
_022BCD28: .word MemcpySimple
	arm_func_end ov00_022BCD10

	arm_func_start ov00_022BCD2C
ov00_022BCD2C: ; 0x022BCD2C
	ldr r2, _022BCD44 ; =ov00_023187A0
	ldr ip, _022BCD48 ; =MemcpySimple
	mov r1, r0
	ldr r0, [r2, #0xc]
	mov r2, #0x40
	bx ip
	.align 2, 0
_022BCD44: .word ov00_023187A0
_022BCD48: .word MemcpySimple
	arm_func_end ov00_022BCD2C

	arm_func_start ov00_022BCD4C
ov00_022BCD4C: ; 0x022BCD4C
	stmdb sp!, {r4, lr}
	ldr r1, _022BCDA0 ; =ov00_023187A0
	mov r4, r0
	ldr r0, [r1, #0xc]
	bl Dwc_CheckHasProfile
	tst r0, #0xff
	bne _022BCD7C
	ldr r0, _022BCDA0 ; =ov00_023187A0
	mov r1, r4
	ldr r0, [r0, #0xc]
	bl Dwc_CreateExchangeToken
	ldmia sp!, {r4, pc}
_022BCD7C:
	ldr r0, _022BCDA0 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	bl Dwc_CreateFriendKey
	mov r3, r0
	mov r2, r1
	mov r0, r4
	mov r1, r3
	bl Dwc_CreateFriendKeyToken
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BCDA0: .word ov00_023187A0
	arm_func_end ov00_022BCD4C

	arm_func_start ov00_022BCDA4
ov00_022BCDA4: ; 0x022BCDA4
	ldr r0, _022BCDB4 ; =ov00_023187A0
	ldr ip, _022BCDB8 ; =Dwc_CreateFriendKey
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_022BCDB4: .word ov00_023187A0
_022BCDB8: .word Dwc_CreateFriendKey
	arm_func_end ov00_022BCDA4

	arm_func_start ov00_022BCDBC
ov00_022BCDBC: ; 0x022BCDBC
#ifdef JAPAN
#define OV00_022BCDBC_OFFSET -0x50
#else
#define OV00_022BCDBC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov sb, r1
	str r2, [sp]
	moveq r0, #4
	beq _022BCF08
	bl Dwc_IsValidFriendData
	cmp r0, #0
	moveq r0, #4
	beq _022BCF08
	add r0, sp, #4
	bl ov00_022BCD4C
	add r1, sp, #4
	mov r0, sl
	bl Dwc_IsEqualFriendData
	cmp r0, #0
	movne r0, #1
	bne _022BCF08
	ldr r0, _022BCF10 ; =ov00_023187A0
	mov r1, sl
	ldr r0, [r0, #0xc]
	bl Dwc_GetGsProfileId
	mov r5, #0
	mov r7, r0
	sub r6, r5, #1
	mvn fp, #0
	b _022BCEB0
_022BCE2C:
	mov r0, #0xc
	mul r8, r5, r0
	ldr r0, _022BCF10 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	add r0, r0, #0xe0 + OV00_022BCDBC_OFFSET
	add r0, r0, r8
	bl Dwc_IsValidFriendData
	cmp r0, #0
	beq _022BCEA4
	ldr r0, _022BCF10 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	add r1, r0, #0xe0 + OV00_022BCDBC_OFFSET
	add r1, r1, r8
	bl Dwc_GetGsProfileId
	ldr r1, _022BCF10 ; =ov00_023187A0
	mov r4, r0
	ldr r1, [r1, #0xc]
	add r0, r1, #0xe0 + OV00_022BCDBC_OFFSET
	add r1, r0, r8
	mov r0, sl
	bl Dwc_IsEqualFriendData
	cmp r0, #0
	bne _022BCE9C
	cmp r4, #0
	cmpgt r7, #0
	ble _022BCEAC
	cmp r4, r7
	bne _022BCEAC
_022BCE9C:
	mov r0, #2
	b _022BCF08
_022BCEA4:
	cmp r6, fp
	moveq r6, r5
_022BCEAC:
	add r5, r5, #1
_022BCEB0:
	cmp r5, #0x10
	blt _022BCE2C
	cmp r6, #0
	blt _022BCF04
	ldr r0, [sp]
	cmp r0, #0
	beq _022BCEFC
	cmp sb, #0
	moveq r0, #4
	beq _022BCF08
	mov r0, r6, lsl #0x10
	mov r1, sl
	mov r2, sb
	mov r0, r0, lsr #0x10
	bl ov00_022BCF6C
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov00_022BD2A4
_022BCEFC:
	mov r0, #0
	b _022BCF08
_022BCF04:
	mov r0, #3
_022BCF08:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BCF10: .word ov00_023187A0
	arm_func_end ov00_022BCDBC

	arm_func_start ov00_022BCF14
ov00_022BCF14: ; 0x022BCF14
	stmdb sp!, {r4, lr}
#ifdef JAPAN
	mov r4, r1
	cmp r0, #0x10
	mov lr, r2
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	ldr r2, _022BCF68 ; =ov00_023187A0
	mov r1, #0xc
	ldr ip, [r2, #0xc]
	add r3, r0, r0, lsl #2
	mla r1, r0, r1, ip
	add r0, r1, #0x90
	ldmia r0, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	add r1, ip, #0x40
	mov r0, lr
	add r1, r1, r3
	mov r2, #5
#else
	mov r4, r0
	cmp r4, #0x10
	mov lr, r1
	mov ip, r2
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	ldr r1, _022BCF68 ; =ov00_023187A0
	mov r0, #0xc
	ldr r3, [r1, #0xc]
	mla r0, r4, r0, r3
	add r0, r0, #0xe0
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	add r0, r3, #0x40
	mov r2, #0xa
	mla r1, r4, r2, r0
	mov r0, ip
#endif
	bl MemcpySimple
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BCF68: .word ov00_023187A0
	arm_func_end ov00_022BCF14

	arm_func_start ov00_022BCF6C
ov00_022BCF6C: ; 0x022BCF6C
	stmdb sp!, {r4, lr}
#ifdef JAPAN
	mov r4, r2
	cmp r0, #0x10
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp r4, #0
	cmpne r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _022BCFCC ; =ov00_023187A0
	mov r2, #0xc
	ldr lr, [r3, #0xc]
	add r3, r0, r0, lsl #2
	mla r2, r0, r2, lr
	add ip, r2, #0x90
	ldmia r1, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	add r0, lr, #0x40
	mov r1, r4
	add r0, r0, r3
	mov r2, #5
#else
	mov r4, r0
	cmp r4, #0x10
	mov lr, r2
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp lr, #0
	cmpne r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022BCFCC ; =ov00_023187A0
	mov r3, #0xc
	ldr ip, [r0, #0xc]
	ldmia r1, {r0, r1, r2}
	mla r3, r4, r3, ip
	add r3, r3, #0xe0
	stmia r3, {r0, r1, r2}
	add r0, ip, #0x40
	mov r2, #0xa
	mla r0, r4, r2, r0
	mov r1, lr
#endif
	bl MemcpySimple
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BCFCC: .word ov00_023187A0
	arm_func_end ov00_022BCF6C

	arm_func_start ov00_022BCFD0
ov00_022BCFD0: ; 0x022BCFD0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	cmp r5, #0x10
	mov r4, r1
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	beq _022BCFFC
	bl ov00_022BD0A0
	cmp r0, #0
	bne _022BD004
_022BCFFC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022BD004:
	ldr r0, _022BD028 ; =ov00_023187A0
#ifdef JAPAN
	add r2, r5, r5, lsl #2
#else
	mov r2, #0xa
#endif
	ldr r0, [r0, #0xc]
	mov r1, r4
	add r0, r0, #0x40
#ifdef JAPAN
	add r0, r0, r2
	mov r2, #5
#else
	mla r0, r5, r2, r0
#endif
	bl MemcpySimple
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022BD028: .word ov00_023187A0
	arm_func_end ov00_022BCFD0

	arm_func_start ov00_022BD02C
ov00_022BD02C: ; 0x022BD02C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r4, #0
	ldr r8, _022BD09C ; =ov00_023187A0
	mov r7, #0xc
	b _022BD08C
_022BD044:
	ldr r0, [r8, #0xc]
	smulbb r5, r4, r7
#ifdef JAPAN
	add r0, r0, #0x90
#else
	add r0, r0, #0xe0
#endif
	add r0, r0, r5
	bl Dwc_IsValidFriendData
	cmp r0, #0
	beq _022BD080
	ldr r1, [r8, #0xc]
	mov r0, r6
#ifdef JAPAN
	add r1, r1, #0x90
#else
	add r1, r1, #0xe0
#endif
	add r1, r1, r5
	bl Dwc_IsEqualFriendData
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_022BD080:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_022BD08C:
	cmp r4, #0x10
	blt _022BD044
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022BD09C: .word ov00_023187A0
	arm_func_end ov00_022BD02C

	arm_func_start ov00_022BD0A0
ov00_022BD0A0: ; 0x022BD0A0
	stmdb sp!, {r3, lr}
	cmp r0, #0x10
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr r2, _022BD0D0 ; =ov00_023187A0
	mov r1, #0xc
	ldr r2, [r2, #0xc]
#ifdef JAPAN
	add r2, r2, #0x90
#else
	add r2, r2, #0xe0
#endif
	mla r0, r1, r0, r2
	bl Dwc_IsValidFriendData
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD0D0: .word ov00_023187A0
	arm_func_end ov00_022BD0A0

	arm_func_start ov00_022BD0D4
ov00_022BD0D4: ; 0x022BD0D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov00_022BD0A0
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
#ifdef JAPAN
	ldr r0, _022BD104 ; =ov00_023187A0
	add r1, r4, r4, lsl #2
	ldr r0, [r0, #0xc]
	add r0, r0, #0x40
	add r0, r0, r1
#else
	ldr r1, _022BD104 ; =ov00_023187A0
	mov r0, #0xa
	ldr r1, [r1, #0xc]
	add r1, r1, #0x40
	mla r0, r4, r0, r1
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BD104: .word ov00_023187A0
	arm_func_end ov00_022BD0D4

	arm_func_start ov00_022BD108
ov00_022BD108: ; 0x022BD108
	stmdb sp!, {r3, lr}
	cmp r0, #0x10
	movhs r0, #0
	movhs r1, r0
	ldmhsia sp!, {r3, pc}
	ldr r2, _022BD138 ; =ov00_023187A0
	mov r1, #0xc
	ldr r2, [r2, #0xc]
#ifdef JAPAN
	add r2, r2, #0x90
#else
	add r2, r2, #0xe0
#endif
	mla r0, r1, r0, r2
	bl Dwc_GetFriendKey
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD138: .word ov00_023187A0
	arm_func_end ov00_022BD108

	arm_func_start ov00_022BD13C
ov00_022BD13C: ; 0x022BD13C
	stmdb sp!, {r3, lr}
	mov r3, r0
	cmp r3, #0x10
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr r0, _022BD16C ; =ov00_023187A0
	mov r1, #0xc
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	add r2, r0, #0x90
#else
	add r2, r0, #0xe0
#endif
	mla r1, r3, r1, r2
	bl Dwc_GetGsProfileId
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD16C: .word ov00_023187A0
	arm_func_end ov00_022BD13C

	arm_func_start ov00_022BD170
ov00_022BD170: ; 0x022BD170
	stmdb sp!, {r3, lr}
	cmp r0, #0x10
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr r2, _022BD19C ; =ov00_023187A0
	mov r1, #0xc
	ldr r2, [r2, #0xc]
#ifdef JAPAN
	add r2, r2, #0x90
#else
	add r2, r2, #0xe0
#endif
	mla r0, r1, r0, r2
	bl Dwc_GetFriendDataType
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD19C: .word ov00_023187A0
	arm_func_end ov00_022BD170

	arm_func_start ov00_022BD1A0
ov00_022BD1A0: ; 0x022BD1A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	b _022BD1C8
_022BD1B4:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD170
	str r0, [r6, r4, lsl #2]
	add r4, r4, #1
_022BD1C8:
	cmp r4, r5
	blt _022BD1B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov00_022BD1A0

	arm_func_start ov00_022BD1D4
ov00_022BD1D4: ; 0x022BD1D4
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movlt r2, #0
	blt _022BD1EC
	cmp r2, #0x10
	movgt r2, #0x10
_022BD1EC:
	mov lr, #0
	b _022BD20C
_022BD1F4:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	cmp ip, r3
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
_022BD20C:
	cmp lr, r2
	blt _022BD1F4
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD1D4

	arm_func_start ov00_022BD21C
ov00_022BD21C: ; 0x022BD21C
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movlt r2, #0
	blt _022BD234
	cmp r2, #0x10
	movgt r2, #0x10
_022BD234:
	mov lr, #0
	b _022BD254
_022BD23C:
	ldr ip, [r0, lr, lsl #2]
	ldr r3, [r1, lr, lsl #2]
	cmp ip, r3
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
_022BD254:
	cmp lr, r2
	blt _022BD23C
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD21C

	arm_func_start ov00_022BD264
ov00_022BD264: ; 0x022BD264
	ldr r1, _022BD270 ; =ov00_023187A0
	strb r0, [r1]
	bx lr
	.align 2, 0
_022BD270: .word ov00_023187A0
	arm_func_end ov00_022BD264

	arm_func_start ov00_022BD274
ov00_022BD274: ; 0x022BD274
	ldr r0, _022BD280 ; =ov00_023187A0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_022BD280: .word ov00_023187A0
	arm_func_end ov00_022BD274

	arm_func_start ov00_022BD284
ov00_022BD284: ; 0x022BD284
	cmp r0, #0x10
	ldrlo r1, _022BD2A0 ; =ov00_023187A0
	movhs r0, #0
	ldrlo r1, [r1, #0xc]
	addlo r0, r1, r0
#ifdef JAPAN
	ldrlob r0, [r0, #0x150]
#else
	ldrlob r0, [r0, #0x1a0]
#endif
	bx lr
	.align 2, 0
_022BD2A0: .word ov00_023187A0
	arm_func_end ov00_022BD284

	arm_func_start ov00_022BD2A4
ov00_022BD2A4: ; 0x022BD2A4
	cmp r0, #0x10
	ldrlo r2, _022BD2BC ; =ov00_023187A0
	ldrlo r2, [r2, #0xc]
	addlo r0, r2, r0
#ifdef JAPAN
	strlob r1, [r0, #0x150]
#else
	strlob r1, [r0, #0x1a0]
#endif
	bx lr
	.align 2, 0
_022BD2BC: .word ov00_023187A0
	arm_func_end ov00_022BD2A4

	arm_func_start ov00_022BD2C0
ov00_022BD2C0: ; 0x022BD2C0
	stmdb sp!, {r3, lr}
	cmp r0, #0x10
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr r2, _022BD2F0 ; =ov00_023187A0
	mov r1, #0xc
	ldr r2, [r2, #0xc]
#ifdef JAPAN
	add r2, r2, #0x90
#else
	add r2, r2, #0xe0
#endif
	mla r0, r1, r0, r2
	bl Dwc_IsBuddyFriendData
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD2F0: .word ov00_023187A0
	arm_func_end ov00_022BD2C0

	arm_func_start ov00_022BD2F4
ov00_022BD2F4: ; 0x022BD2F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r5, _022BD334 ; =ov00_023187A0
	mov r6, r7
	mov r4, #0xc
_022BD308:
	ldr r0, [r5, #0xc]
#ifdef JAPAN
	add r0, r0, #0x90
#else
	add r0, r0, #0xe0
#endif
	mla r0, r6, r4, r0
	bl Dwc_IsValidFriendData
	cmp r0, #0
	add r6, r6, #1
	addne r7, r7, #1
	cmp r6, #0x10
	blt _022BD308
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BD334: .word ov00_023187A0
	arm_func_end ov00_022BD2F4

	arm_func_start ov00_022BD338
ov00_022BD338: ; 0x022BD338
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	ldr r8, _022BD394 ; =ov00_023187A0
	mov r4, r5
	mov r7, #0xc
_022BD34C:
	mul r6, r4, r7
	ldr r0, [r8, #0xc]
#ifdef JAPAN
	add r0, r0, #0x90
#else
	add r0, r0, #0xe0
#endif
	add r0, r0, r6
	bl Dwc_IsValidFriendData
	cmp r0, #0
	beq _022BD380
	ldr r0, [r8, #0xc]
#ifdef JAPAN
	add r0, r0, #0x90
#else
	add r0, r0, #0xe0
#endif
	add r0, r0, r6
	bl Dwc_IsBuddyFriendData
	cmp r0, #0
	addne r5, r5, #1
_022BD380:
	add r4, r4, #1
	cmp r4, #0x10
	blt _022BD34C
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022BD394: .word ov00_023187A0
	arm_func_end ov00_022BD338

	arm_func_start ov00_022BD398
ov00_022BD398: ; 0x022BD398
	stmdb sp!, {r3, lr}
	bl ov00_022BD2F4
	cmp r0, #0x10
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD398

	arm_func_start ov00_022BD3B4
ov00_022BD3B4: ; 0x022BD3B4
	stmdb sp!, {r4, lr}
	ldr r1, _022BD3F0 ; =ov00_023187A0
	mov r4, r0
#ifdef JAPAN
	ldr r1, [r1, #0xc]
	add r0, r4, r4, lsl #2
	add r1, r1, #0x40
	add r0, r1, r0
	mov r1, #5
#else
	ldr r0, [r1, #0xc]
	mov r1, #0xa
	add r0, r0, #0x40
	mla r0, r4, r1, r0
#endif
	bl MemZero
	ldr r1, _022BD3F0 ; =ov00_023187A0
	mov r0, #0xc
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	add r1, r1, #0x90
#else
	add r1, r1, #0xe0
#endif
	mla r0, r4, r0, r1
	bl Dwc_DeleteBuddyFriendData
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BD3F0: .word ov00_023187A0
	arm_func_end ov00_022BD3B4

	arm_func_start ov00_022BD3F4
ov00_022BD3F4: ; 0x022BD3F4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _022BD438 ; =ov00_023187A0
	mov r6, #0
	mov r4, #0xc
_022BD404:
	ldr r0, [r5, #0xc]
#ifdef JAPAN
	add r0, r0, #0x90
#else
	add r0, r0, #0xe0
#endif
	mla r0, r6, r4, r0
	bl Dwc_IsValidFriendData
	cmp r0, #0
	beq _022BD428
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD3B4
_022BD428:
	add r6, r6, #1
	cmp r6, #0x10
	blt _022BD404
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BD438: .word ov00_023187A0
	arm_func_end ov00_022BD3F4

	arm_func_start ov00_022BD43C
ov00_022BD43C: ; 0x022BD43C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _022BD47C ; =ov00_023187A0
	mov r6, r0
	ldr r0, [r3, #0xc]
	mov r5, r1
	mov r4, r2
	bl Dwc_CheckFriendKey
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl Dwc_CreateFriendKeyToken
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BD47C: .word ov00_023187A0
	arm_func_end ov00_022BD43C

	arm_func_start ov00_022BD480
ov00_022BD480: ; 0x022BD480
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r2, _022BD4CC ; =ov00_0231D420
	mov r1, #0
	strb r1, [r2, #2]
	ldr r0, _022BD4D0 ; =ov00_022BE058
	strb r1, [r2]
	bl Dwc_SetBuddyFriendCallback
	mov r0, #0
	ldr r1, _022BD4D4 ; =ov00_022BE044
	mov r2, r0
	stmia sp, {r0, r1}
	ldr r1, _022BD4D8 ; =ov00_022BE020
	mov r3, r0
	str r0, [sp, #8]
	bl Dwc_UpdateServersAsync
	and r0, r0, #0xff
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_022BD4CC: .word ov00_0231D420
_022BD4D0: .word ov00_022BE058
_022BD4D4: .word ov00_022BE044
_022BD4D8: .word ov00_022BE020
	arm_func_end ov00_022BD480

	arm_func_start ov00_022BD4DC
ov00_022BD4DC: ; 0x022BD4DC
	ldr r0, _022BD4E8 ; =ov00_0231D420
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_022BD4E8: .word ov00_0231D420
	arm_func_end ov00_022BD4DC

	arm_func_start ov00_022BD4EC
ov00_022BD4EC: ; 0x022BD4EC
#ifdef JAPAN
#define OV00_022BD4EC_OFFSET -0x50
#else
#define OV00_022BD4EC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022BD570 ; =ov00_023187A0
	mov r1, #0x36
	ldr r0, [r0, #0xc]
	add r0, r0, #0x1b0 + OV00_022BD4EC_OFFSET
	bl MemZero
	ldr r1, _022BD570 ; =ov00_023187A0
	ldr r3, _022BD574 ; =0x00003FFF
	ldr r0, [r1, #0xc]
	mov r4, #0
	add r0, r0, #0x100
	strh r3, [r0, #0xe6 + OV00_022BD4EC_OFFSET]
	ldr r0, [r1, #0xc]
	mov r2, #1
	add r0, r0, #0x100
	strh r3, [r0, #0xe8 + OV00_022BD4EC_OFFSET]
	ldr r0, [r1, #0xc]
	mov r5, r4
	strb r2, [r0, #0x1ea + OV00_022BD4EC_OFFSET]
	ldr r0, [r1, #0xc]
	strb r2, [r0, #0x1eb + OV00_022BD4EC_OFFSET]
	ldr r0, [r1, #0xc]
	strb r2, [r0, #0x1ec + OV00_022BD4EC_OFFSET]
	ldr r0, [r1, #0xc]
	strb r4, [r0, #0x1ed + OV00_022BD4EC_OFFSET]
_022BD550:
	mov r0, r4, lsl #0x10
	mov r1, r5
	mov r0, r0, lsr #0x10
	bl ov00_022BD2A4
	add r4, r4, #1
	cmp r4, #0x10
	blt _022BD550
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022BD570: .word ov00_023187A0
_022BD574: .word 0x00003FFF
	arm_func_end ov00_022BD4EC

#ifndef EUROPE
	arm_func_start ov00_022BD578
ov00_022BD578: ; 0x022BD578
	ldr r1, _022BD59C ; =ov00_023187A0
	mov r2, #0x27
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	add r3, r1, #0x150
#else
	add r3, r1, #0x1a0
#endif
_022BD588:
	ldrh r1, [r3], #2
	subs r2, r2, #1
	strh r1, [r0], #2
	bne _022BD588
	bx lr
	.align 2, 0
_022BD59C: .word ov00_023187A0
	arm_func_end ov00_022BD578

	arm_func_start ov00_022BD5A0
ov00_022BD5A0: ; 0x022BD5A0
	ldr r1, _022BD5C4 ; =ov00_023187A0
	mov r2, #0x27
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	add r3, r1, #0x150
#else
	add r3, r1, #0x1a0
#endif
_022BD5B0:
	ldrh r1, [r0], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022BD5B0
	bx lr
	.align 2, 0
_022BD5C4: .word ov00_023187A0
	arm_func_end ov00_022BD5A0
#endif

	arm_func_start ov00_022BD5C8
ov00_022BD5C8: ; 0x022BD5C8
	ldr r0, _022BD5E8 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	ldrb r0, [r0, #0x160]
#else
	ldrb r0, [r0, #0x1b0]
#endif
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022BD5E8: .word ov00_023187A0
	arm_func_end ov00_022BD5C8

	arm_func_start ov00_022BD5EC
ov00_022BD5EC: ; 0x022BD5EC
	ldr r0, _022BD5FC ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	add r0, r0, #0x160
#else
	add r0, r0, #0x1b0
#endif
	bx lr
	.align 2, 0
_022BD5FC: .word ov00_023187A0
	arm_func_end ov00_022BD5EC

#ifndef EUROPE
	arm_func_start ov00_022BD600
ov00_022BD600: ; 0x022BD600
	ldr r0, _022BD628 ; =ov00_023187A0
	ldr r1, _022BD62C ; =0x00002710
	ldr r0, [r0, #0xc]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x96]
#else
	ldrh r0, [r0, #0xe6]
#endif
	cmp r0, r1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022BD628: .word ov00_023187A0
_022BD62C: .word 0x00002710
	arm_func_end ov00_022BD600

	arm_func_start ov00_022BD630
ov00_022BD630: ; 0x022BD630
	ldr r0, _022BD644 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x96]
#else
	ldrh r0, [r0, #0xe6]
#endif
	bx lr
	.align 2, 0
_022BD644: .word ov00_023187A0
	arm_func_end ov00_022BD630

	arm_func_start ov00_022BD648
ov00_022BD648: ; 0x022BD648
	ldr r1, _022BD65C ; =ov00_023187A0
	ldr r1, [r1, #0xc]
	add r1, r1, #0x100
#ifdef JAPAN
	strh r0, [r1, #0x96]
#else
	strh r0, [r1, #0xe6]
#endif
	bx lr
	.align 2, 0
_022BD65C: .word ov00_023187A0
	arm_func_end ov00_022BD648
#endif

	arm_func_start ov00_022BD660
ov00_022BD660: ; 0x022BD660
	ldr r0, _022BD688 ; =ov00_023187A0
	ldr r1, _022BD68C ; =0x00002710
	ldr r0, [r0, #0xc]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x98]
#else
	ldrh r0, [r0, #0xe8]
#endif
	cmp r0, r1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022BD688: .word ov00_023187A0
_022BD68C: .word 0x00002710
	arm_func_end ov00_022BD660

	arm_func_start ov00_022BD690
ov00_022BD690: ; 0x022BD690
	ldr r0, _022BD6A4 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x98]
#else
	ldrh r0, [r0, #0xe8]
#endif
	bx lr
	.align 2, 0
_022BD6A4: .word ov00_023187A0
	arm_func_end ov00_022BD690

#ifndef EUROPE
	arm_func_start ov00_022BD6A8
ov00_022BD6A8: ; 0x022BD6A8
	ldr r1, _022BD6BC ; =ov00_023187A0
	ldr r1, [r1, #0xc]
	add r1, r1, #0x100
#ifdef JAPAN
	strh r0, [r1, #0x98]
#else
	strh r0, [r1, #0xe8]
#endif
	bx lr
	.align 2, 0
_022BD6BC: .word ov00_023187A0
	arm_func_end ov00_022BD6A8

	arm_func_start ov00_022BD6C0
ov00_022BD6C0: ; 0x022BD6C0
	ldr r0, _022BD6D8 ; =ov00_023187A0
	ldr r1, _022BD6DC ; =0x00003FFF
	ldr r0, [r0, #0xc]
	add r0, r0, #0x100
#ifdef JAPAN
	strh r1, [r0, #0x98]
#else
	strh r1, [r0, #0xe8]
#endif
	bx lr
	.align 2, 0
_022BD6D8: .word ov00_023187A0
_022BD6DC: .word 0x00003FFF
	arm_func_end ov00_022BD6C0
#endif

	arm_func_start ov00_022BD6E0
ov00_022BD6E0: ; 0x022BD6E0
	ldr r0, _022BD6F0 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x1ea]
#endif
	bx lr
	.align 2, 0
_022BD6F0: .word ov00_023187A0
	arm_func_end ov00_022BD6E0

	arm_func_start ov00_022BD6F4
ov00_022BD6F4: ; 0x022BD6F4
	ldr r0, _022BD704 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	ldrb r0, [r0, #0x19b]
#else
	ldrb r0, [r0, #0x1eb]
#endif
	bx lr
	.align 2, 0
_022BD704: .word ov00_023187A0
	arm_func_end ov00_022BD6F4

	arm_func_start ov00_022BD708
ov00_022BD708: ; 0x022BD708
	ldr r0, _022BD718 ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	ldrb r0, [r0, #0x19c]
#else
	ldrb r0, [r0, #0x1ec]
#endif
	bx lr
	.align 2, 0
_022BD718: .word ov00_023187A0
	arm_func_end ov00_022BD708

	arm_func_start ov00_022BD71C
ov00_022BD71C: ; 0x022BD71C
	ldr r0, _022BD72C ; =ov00_023187A0
	ldr r0, [r0, #0xc]
#ifdef JAPAN
	ldrb r0, [r0, #0x19d]
#else
	ldrb r0, [r0, #0x1ed]
#endif
	bx lr
	.align 2, 0
_022BD72C: .word ov00_023187A0
	arm_func_end ov00_022BD71C

#ifndef EUROPE
	arm_func_start ov00_022BD730
ov00_022BD730: ; 0x022BD730
	ldr r1, _022BD740 ; =ov00_023187A0
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	strb r0, [r1, #0x19a]
#else
	strb r0, [r1, #0x1ea]
#endif
	bx lr
	.align 2, 0
_022BD740: .word ov00_023187A0
	arm_func_end ov00_022BD730

	arm_func_start ov00_022BD744
ov00_022BD744: ; 0x022BD744
	ldr r1, _022BD754 ; =ov00_023187A0
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	strb r0, [r1, #0x19b]
#else
	strb r0, [r1, #0x1eb]
#endif
	bx lr
	.align 2, 0
_022BD754: .word ov00_023187A0
	arm_func_end ov00_022BD744

	arm_func_start ov00_022BD758
ov00_022BD758: ; 0x022BD758
	ldr r1, _022BD768 ; =ov00_023187A0
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	strb r0, [r1, #0x19c]
#else
	strb r0, [r1, #0x1ec]
#endif
	bx lr
	.align 2, 0
_022BD768: .word ov00_023187A0
	arm_func_end ov00_022BD758

	arm_func_start ov00_022BD76C
ov00_022BD76C: ; 0x022BD76C
	ldr r1, _022BD77C ; =ov00_023187A0
	ldr r1, [r1, #0xc]
#ifdef JAPAN
	strb r0, [r1, #0x19d]
#else
	strb r0, [r1, #0x1ed]
#endif
	bx lr
	.align 2, 0
_022BD77C: .word ov00_023187A0
	arm_func_end ov00_022BD76C
#endif

	arm_func_start ov00_022BD780
ov00_022BD780: ; 0x022BD780
	ldr r0, _022BD790 ; =ov00_023187A0
	ldr ip, _022BD794 ; =Dwc_ClearDirtyFlag
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_022BD790: .word ov00_023187A0
_022BD794: .word Dwc_ClearDirtyFlag
	arm_func_end ov00_022BD780

	arm_func_start ov00_022BD798
ov00_022BD798: ; 0x022BD798
	stmdb sp!, {r3, lr}
	ldr r0, _022BD7B4 ; =ov00_0231D42C
	bl Dwc_InitInet
	mov r0, #2
	bl Dwc_SetAuthServer
	bl Dwc_ConnectInetAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD7B4: .word ov00_0231D42C
	arm_func_end ov00_022BD798

	arm_func_start ov00_022BD7B8
ov00_022BD7B8: ; 0x022BD7B8
	stmdb sp!, {r3, lr}
	bl Dwc_ProcessInet
	bl Dwc_CheckInet
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD7B8

	arm_func_start ov00_022BD7D8
ov00_022BD7D8: ; 0x022BD7D8
	stmdb sp!, {r3, lr}
	bl Dwc_CleanupInetAsync
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD7D8

	arm_func_start ov00_022BD7E8
ov00_022BD7E8: ; 0x022BD7E8
	stmdb sp!, {r3, lr}
	bl Dwc_GetInetStatus
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022BD868
_022BD7FC: ; jump table
	b _022BD820 ; case 0
	b _022BD828 ; case 1
	b _022BD830 ; case 2
	b _022BD838 ; case 3
	b _022BD840 ; case 4
	b _022BD848 ; case 5
	b _022BD850 ; case 6
	b _022BD858 ; case 7
	b _022BD860 ; case 8
_022BD820:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022BD828:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BD830:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BD838:
	mov r0, #3
	ldmia sp!, {r3, pc}
_022BD840:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022BD848:
	mov r0, #5
	ldmia sp!, {r3, pc}
_022BD850:
	mov r0, #6
	ldmia sp!, {r3, pc}
_022BD858:
	mov r0, #7
	ldmia sp!, {r3, pc}
_022BD860:
	mov r0, #8
	ldmia sp!, {r3, pc}
_022BD868:
	mov r0, #9
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD7E8

	arm_func_start ov00_022BD870
ov00_022BD870: ; 0x022BD870
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	ldr r1, _022BD8E0 ; =ov00_023187A0
	mov r4, r0
	ldr r1, [r1, #0xc]
	ldr r2, _022BD8E4 ; =ov00_02317F54
	mov r0, #0
	str r2, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
#ifdef JAPAN
	add ip, r1, #0x90
#else
	add ip, r1, #0xe0
#endif
	ldr r0, _022BD8E8 ; =ov00_0231D490
	ldr r2, _022BD8EC ; =0x00002B1A
	ldr r3, _022BD8F0 ; =ov00_02317F44
	str ip, [sp, #0xc]
	mov ip, #0x10
	str ip, [sp, #0x10]
	bl Dwc_InitFriendsMatch
	mov r1, #0
	ldr ip, _022BD8F4 ; =ov00_0231D420
	ldr r2, _022BD8F8 ; =ov00_022BE008
	mov r0, r4
	mov r3, r1
	strb r1, [ip, #1]
	bl Dwc_LoginAsync
	and r0, r0, #0xff
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022BD8E0: .word ov00_023187A0
_022BD8E4: .word ov00_02317F54
_022BD8E8: .word ov00_0231D490
_022BD8EC: .word 0x00002B1A
_022BD8F0: .word ov00_02317F44
_022BD8F4: .word ov00_0231D420
_022BD8F8: .word ov00_022BE008
	arm_func_end ov00_022BD870

	arm_func_start ov00_022BD8FC
ov00_022BD8FC: ; 0x022BD8FC
	ldr ip, _022BD904 ; =Dwc_ProcessFriendsMatch
	bx ip
	.align 2, 0
_022BD904: .word Dwc_ProcessFriendsMatch
	arm_func_end ov00_022BD8FC

	arm_func_start ov00_022BD908
ov00_022BD908: ; 0x022BD908
	ldr r0, _022BD914 ; =ov00_0231D420
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_022BD914: .word ov00_0231D420
	arm_func_end ov00_022BD908

	arm_func_start ov00_022BD918
ov00_022BD918: ; 0x022BD918
	stmdb sp!, {r3, lr}
	bl Dwc_GetIngamesnCheckResult
	cmp r0, #0
	beq _022BD93C
	cmp r0, #1
	beq _022BD944
	cmp r0, #2
	beq _022BD94C
	b _022BD954
_022BD93C:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022BD944:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BD94C:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BD954:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD918

	arm_func_start ov00_022BD95C
ov00_022BD95C: ; 0x022BD95C
	ldr ip, _022BD964 ; =Dwc_ShutdownFriendsMatch
	bx ip
	.align 2, 0
_022BD964: .word Dwc_ShutdownFriendsMatch
	arm_func_end ov00_022BD95C

	arm_func_start ov00_022BD968
ov00_022BD968: ; 0x022BD968
	ldr ip, _022BD978 ; =Dwci_RankingSessionInitialize
	ldr r1, _022BD97C ; =ov00_02317F5C
	mov r0, #0
	bx ip
	.align 2, 0
_022BD978: .word Dwci_RankingSessionInitialize
_022BD97C: .word ov00_02317F5C
	arm_func_end ov00_022BD968

	arm_func_start ov00_022BD980
ov00_022BD980: ; 0x022BD980
	stmdb sp!, {r3, lr}
	bl Dwci_RankingSessionShutdown
	ldr r0, _022BD998 ; =ov00_023187A0
	mov r1, #0
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD998: .word ov00_023187A0
	arm_func_end ov00_022BD980

	arm_func_start ov00_022BD99C
ov00_022BD99C: ; 0x022BD99C
	stmdb sp!, {r3, lr}
	ldr ip, [sp, #8]
	str ip, [sp]
	bl Dwci_RankingSessionGetAsync
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022BD9E0
_022BD9B8: ; jump table
	b _022BD9E0 ; case 0
	b _022BD9C8 ; case 1
	b _022BD9D0 ; case 2
	b _022BD9D8 ; case 3
_022BD9C8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BD9D0:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BD9D8:
	mov r0, #3
	ldmia sp!, {r3, pc}
_022BD9E0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD99C

	arm_func_start ov00_022BD9E8
ov00_022BD9E8: ; 0x022BD9E8
	stmdb sp!, {r3, lr}
	bl Dwci_RankingSessionProcess
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022BDA60
_022BD9FC: ; jump table
	b _022BDA20 ; case 0
	b _022BDA28 ; case 1
	b _022BDA30 ; case 2
	b _022BDA38 ; case 3
	b _022BDA40 ; case 4
	b _022BDA48 ; case 5
	b _022BDA50 ; case 6
	b _022BDA58 ; case 7
	b _022BDA60 ; case 8
_022BDA20:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022BDA28:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BDA30:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BDA38:
	mov r0, #3
	ldmia sp!, {r3, pc}
_022BDA40:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022BDA48:
	mov r0, #5
	ldmia sp!, {r3, pc}
_022BDA50:
	mov r0, #6
	ldmia sp!, {r3, pc}
_022BDA58:
	mov r0, #7
	ldmia sp!, {r3, pc}
_022BDA60:
	mov r0, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BD9E8

	arm_func_start ov00_022BDA68
ov00_022BDA68: ; 0x022BDA68
	ldr ip, _022BDA70 ; =Dwci_RankingSessionGetResponse
	bx ip
	.align 2, 0
_022BDA70: .word Dwci_RankingSessionGetResponse
	arm_func_end ov00_022BDA68

	arm_func_start ov00_022BDA74
ov00_022BDA74: ; 0x022BDA74
	stmdb sp!, {r3, lr}
	ldr r0, _022BDA90 ; =ov00_023187A0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl Dwci_RankingSessionCancel
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDA90: .word ov00_023187A0
	arm_func_end ov00_022BDA74

	arm_func_start ov00_022BDA94
ov00_022BDA94: ; 0x022BDA94
	stmdb sp!, {r3, lr}
	ldr r0, _022BDABC ; =ov00_022BE06C
	ldr r1, _022BDAC0 ; =ov00_023187D0
	ldr r2, _022BDAC4 ; =ov00_023187D8
	bl Dwc_NdInitAsync
	ldr r0, _022BDAC8 ; =ov00_0231D420
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDABC: .word ov00_022BE06C
_022BDAC0: .word ov00_023187D0
_022BDAC4: .word ov00_023187D8
_022BDAC8: .word ov00_0231D420
	arm_func_end ov00_022BDA94

	arm_func_start ov00_022BDACC
ov00_022BDACC: ; 0x022BDACC
	ldr r0, _022BDAD8 ; =ov00_0231D420
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022BDAD8: .word ov00_0231D420
	arm_func_end ov00_022BDACC

	arm_func_start ov00_022BDADC
ov00_022BDADC: ; 0x022BDADC
	stmdb sp!, {r3, lr}
	movs r2, r0
	ldreq r2, _022BDB00 ; =ov00_023187C4
	ldmia r2, {r0, r1, r2}
	bl Dwc_NdSetAttr
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDB00: .word ov00_023187C4
	arm_func_end ov00_022BDADC

	arm_func_start ov00_022BDB04
ov00_022BDB04: ; 0x022BDB04
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl Dwc_NdGetFileListNumAsync
	cmp r0, #0
	ldrne r0, _022BDB34 ; =ov00_0231D420
	movne r1, #0
	strne r1, [r0, #8]
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDB34: .word ov00_0231D420
	arm_func_end ov00_022BDB04

	arm_func_start ov00_022BDB38
ov00_022BDB38: ; 0x022BDB38
	stmdb sp!, {r3, lr}
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl Dwc_NdGetFileListAsync
	cmp r0, #0
	ldrne r0, _022BDB68 ; =ov00_0231D420
	movne r1, #0
	strne r1, [r0, #8]
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDB68: .word ov00_0231D420
	arm_func_end ov00_022BDB38

	arm_func_start ov00_022BDB6C
ov00_022BDB6C: ; 0x022BDB6C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	cmpne r1, #0
	cmpne r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl Dwc_NdGetFileAsync
	cmp r0, #0
	ldrne r0, _022BDBA4 ; =ov00_0231D420
	movne r1, #0
	strne r1, [r0, #8]
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDBA4: .word ov00_0231D420
	arm_func_end ov00_022BDB6C

	arm_func_start ov00_022BDBA8
ov00_022BDBA8: ; 0x022BDBA8
	stmdb sp!, {r3, lr}
	ldr r0, _022BDBE0 ; =ov00_0231D420
	ldr r0, [r0, #8]
	cmp r0, #1
	beq _022BDBD8
	bl Dwc_NdCancelAsync
	cmp r0, #0
	ldrne r1, _022BDBE0 ; =ov00_0231D420
	movne r0, #1
	strne r0, [r1, #8]
	moveq r0, #0
	ldmia sp!, {r3, pc}
_022BDBD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDBE0: .word ov00_0231D420
	arm_func_end ov00_022BDBA8

	arm_func_start ov00_022BDBE4
ov00_022BDBE4: ; 0x022BDBE4
	stmdb sp!, {r3, lr}
	ldr r0, _022BDC54 ; =ov00_0231D420
	ldr r1, [r0, #8]
	cmp r1, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022BDC1C
	cmp r0, #1
	beq _022BDC4C
	cmp r0, #2
	beq _022BDC44
	b _022BDC4C
_022BDC1C:
	ldr r0, _022BDC58 ; =ov00_022BE080
	bl Dwc_NdCleanupAsync
	cmp r0, #0
	beq _022BDC4C
	ldr r0, _022BDC54 ; =ov00_0231D420
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r1, #1
	streq r1, [r0, #4]
	b _022BDC4C
_022BDC44:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BDC4C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDC54: .word ov00_0231D420
_022BDC58: .word ov00_022BE080
	arm_func_end ov00_022BDBE4

	arm_func_start ov00_022BDC5C
ov00_022BDC5C: ; 0x022BDC5C
	ldr ip, _022BDC68 ; =Dwc_SetAuthServer
	mov r0, #2
	bx ip
	.align 2, 0
_022BDC68: .word Dwc_SetAuthServer
	arm_func_end ov00_022BDC5C

	arm_func_start ov00_022BDC6C
ov00_022BDC6C: ; 0x022BDC6C
	stmdb sp!, {r3, lr}
	bl Dwc_GetLinkLevel
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022BDCB0
_022BDC80: ; jump table
	b _022BDC90 ; case 0
	b _022BDC98 ; case 1
	b _022BDCA0 ; case 2
	b _022BDCA8 ; case 3
_022BDC90:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022BDC98:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BDCA0:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BDCA8:
	mov r0, #3
	ldmia sp!, {r3, pc}
_022BDCB0:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov00_022BDC6C

	arm_func_start ov00_022BDCB8
ov00_022BDCB8: ; 0x022BDCB8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r1
	add r1, sp, #0
	bl Dwc_GetLastErrorEx
	ldr r1, [sp]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _022BDD34
_022BDCDC: ; jump table
	b _022BDD34 ; case 0
	b _022BDCFC ; case 1
	b _022BDD04 ; case 2
	b _022BDD0C ; case 3
	b _022BDD14 ; case 4
	b _022BDD1C ; case 5
	b _022BDD24 ; case 6
	b _022BDD2C ; case 7
_022BDCFC:
	mov r1, #1
	b _022BDD38
_022BDD04:
	mov r1, #2
	b _022BDD38
_022BDD0C:
	mov r1, #3
	b _022BDD38
_022BDD14:
	mov r1, #4
	b _022BDD38
_022BDD1C:
	mov r1, #5
	b _022BDD38
_022BDD24:
	mov r1, #6
	b _022BDD38
_022BDD2C:
	mov r1, #7
	b _022BDD38
_022BDD34:
	mov r1, #0
_022BDD38:
	str r1, [r4]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _022BDE18
_022BDD48: ; jump table
	b _022BDE18 ; case 0
	b _022BDD90 ; case 1
	b _022BDD98 ; case 2
	b _022BDDA0 ; case 3
	b _022BDDA8 ; case 4
	b _022BDDB0 ; case 5
	b _022BDDB8 ; case 6
	b _022BDDC0 ; case 7
	b _022BDDC8 ; case 8
	b _022BDDD0 ; case 9
	b _022BDDD8 ; case 10
	b _022BDDE0 ; case 11
	b _022BDDE8 ; case 12
	b _022BDDF0 ; case 13
	b _022BDDF8 ; case 14
	b _022BDE00 ; case 15
	b _022BDE08 ; case 16
	b _022BDE10 ; case 17
_022BDD90:
	mov r0, #1
	b _022BDE1C
_022BDD98:
	mov r0, #2
	b _022BDE1C
_022BDDA0:
	mov r0, #3
	b _022BDE1C
_022BDDA8:
	mov r0, #4
	b _022BDE1C
_022BDDB0:
	mov r0, #5
	b _022BDE1C
_022BDDB8:
	mov r0, #6
	b _022BDE1C
_022BDDC0:
	mov r0, #7
	b _022BDE1C
_022BDDC8:
	mov r0, #8
	b _022BDE1C
_022BDDD0:
	mov r0, #9
	b _022BDE1C
_022BDDD8:
	mov r0, #0xa
	b _022BDE1C
_022BDDE0:
	mov r0, #0xb
	b _022BDE1C
_022BDDE8:
	mov r0, #0xc
	b _022BDE1C
_022BDDF0:
	mov r0, #0xd
	b _022BDE1C
_022BDDF8:
	mov r0, #0xe
	b _022BDE1C
_022BDE00:
	mov r0, #0xf
	b _022BDE1C
_022BDE08:
	mov r0, #0x10
	b _022BDE1C
_022BDE10:
	mov r0, #0x11
	b _022BDE1C
_022BDE18:
	mov r0, #0
_022BDE1C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov00_022BDCB8

	arm_func_start ov00_022BDE24
ov00_022BDE24: ; 0x022BDE24
	ldr ip, _022BDE2C ; =Dwc_ClearError
	bx ip
	.align 2, 0
_022BDE2C: .word Dwc_ClearError
	arm_func_end ov00_022BDE24

	arm_func_start ov00_022BDE30
ov00_022BDE30: ; 0x022BDE30
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022BDF18 ; =ov00_023187A0
	add r2, r1, #0x1f
	ldr r5, [r0, #0x20]
	mov r6, r2, lsr #5
	mov r4, #0
	cmp r1, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, pc}
	bl EnableIrqFlag
	ldr r1, _022BDF18 ; =ov00_023187A0
	ldr r1, [r1, #0x18]
	b _022BDEE4
_022BDE64:
	ldr r2, [r5]
	cmp r2, #0
	bne _022BDED8
	ldr r2, [r5, #4]
	cmp r6, r2
	bhs _022BDEC8
	add r2, r5, r6, lsl #5
	mov r1, #0
	str r1, [r2, #0x20]
	ldr r1, [r5, #4]
	add r3, r2, #0x20
	sub r1, r1, r6
	sub r1, r1, #1
	stmib r3, {r1, r6}
	ldr r2, [r3, #4]
	ldr r1, _022BDF18 ; =ov00_023187A0
	add r3, r3, r2, lsl #5
	ldr r1, [r1, #0x18]
	add r3, r3, #0x20
	cmp r3, r1
	strlo r2, [r3, #8]
	mov r1, #1
	stmia r5, {r1, r6}
	add r4, r5, #0x20
	b _022BDEEC
_022BDEC8:
	moveq r1, #1
	streq r1, [r5]
	addeq r4, r5, #0x20
	beq _022BDEEC
_022BDED8:
	ldr r2, [r5, #4]
	add r2, r5, r2, lsl #5
	add r5, r2, #0x20
_022BDEE4:
	cmp r5, r1
	blo _022BDE64
_022BDEEC:
	bl SetIrqFlag
	ldr r0, _022BDF18 ; =ov00_023187A0
	add r1, r6, #1
	ldr r2, [r0, #0x14]
	add r2, r2, r1
	str r2, [r0, #0x14]
	ldr r1, [r0, #4]
	cmp r2, r1
	strgt r2, [r0, #4]
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BDF18: .word ov00_023187A0
	arm_func_end ov00_022BDE30

	arm_func_start ov00_022BDF1C
ov00_022BDF1C: ; 0x022BDF1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	movs r6, r1
	mov r5, r4
	ldmeqia sp!, {r4, r5, r6, pc}
	bl EnableIrqFlag
	sub r1, r6, #0x20
	ldr r2, _022BE004 ; =ov00_023187A0
	ldr r3, [r1, #4]
	ldr ip, [r2, #0x14]
	add r3, r3, #1
	sub r3, ip, r3
	str r3, [r2, #0x14]
	mov r2, r4
	str r2, [r6, #-0x20]
	ldr r2, [r1, #8]
	ldr r3, [r1, #4]
	cmp r2, #0
	subge r2, r1, r2, lsl #5
	subge r5, r2, #0x20
	ldr r2, _022BE004 ; =ov00_023187A0
	add r3, r1, r3, lsl #5
	ldr r2, [r2, #0x18]
	add r3, r3, #0x20
	cmp r3, r2
	movlo r4, r3
	cmp r5, #0
	beq _022BDFBC
	ldr r2, [r5]
	cmp r2, #0
	bne _022BDFBC
	ldr r1, [r1, #4]
	ldr r2, [r5, #4]
	add r1, r1, #1
	add r1, r2, r1
	str r1, [r5, #4]
	cmp r4, #0
	ldrne r1, [r5, #4]
	strne r1, [r4, #8]
	mov r1, r5
_022BDFBC:
	cmp r4, #0
	beq _022BDFFC
	ldr r2, [r4]
	cmp r2, #0
	bne _022BDFFC
	ldr r2, [r4, #4]
	ldr r3, [r1, #4]
	add r2, r2, #1
	add r4, r3, r2
	ldr r2, _022BE004 ; =ov00_023187A0
	add r3, r1, r4, lsl #5
	str r4, [r1, #4]
	ldr r1, [r2, #0x18]
	add r2, r3, #0x20
	cmp r2, r1
	strlo r4, [r2, #8]
_022BDFFC:
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BE004: .word ov00_023187A0
	arm_func_end ov00_022BDF1C

	arm_func_start ov00_022BE008
ov00_022BE008: ; 0x022BE008
	cmp r0, #0
	ldreq r0, _022BE01C ; =ov00_0231D420
	moveq r1, #1
	streqb r1, [r0, #1]
	bx lr
	.align 2, 0
_022BE01C: .word ov00_0231D420
	arm_func_end ov00_022BE008

	arm_func_start ov00_022BE020
ov00_022BE020: ; 0x022BE020
	cmp r0, #0
	bxne lr
	ldr r0, _022BE040 ; =ov00_0231D420
	mov r2, #1
	strb r2, [r0, #2]
	cmp r1, #0
	strneb r2, [r0]
	bx lr
	.align 2, 0
_022BE040: .word ov00_0231D420
	arm_func_end ov00_022BE020

	arm_func_start ov00_022BE044
ov00_022BE044: ; 0x022BE044
	ldr r0, _022BE054 ; =ov00_0231D420
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022BE054: .word ov00_0231D420
	arm_func_end ov00_022BE044

	arm_func_start ov00_022BE058
ov00_022BE058: ; 0x022BE058
	ldr r0, _022BE068 ; =ov00_0231D420
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022BE068: .word ov00_0231D420
	arm_func_end ov00_022BE058

	arm_func_start ov00_022BE06C
ov00_022BE06C: ; 0x022BE06C
	ldr r0, _022BE07C ; =ov00_0231D420
	mov r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022BE07C: .word ov00_0231D420
	arm_func_end ov00_022BE06C

	arm_func_start ov00_022BE080
ov00_022BE080: ; 0x022BE080
	ldr r0, _022BE090 ; =ov00_0231D420
	mov r1, #2
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_022BE090: .word ov00_0231D420
	arm_func_end ov00_022BE080

	arm_func_start ov00_022BE094
ov00_022BE094: ; 0x022BE094
	stmdb sp!, {r3, lr}
	ldr r0, _022BE0B0 ; =ov00_02317FA0
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_0232F3F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE0B0: .word ov00_02317FA0
	arm_func_end ov00_022BE094

	arm_func_start ov00_022BE0B4
ov00_022BE0B4: ; 0x022BE0B4
	ldr ip, _022BE0C0 ; =InitMenu
	ldr r0, _022BE0C4 ; =ov00_02317FB0
	bx ip
	.align 2, 0
_022BE0C0: .word InitMenu
_022BE0C4: .word ov00_02317FB0
	arm_func_end ov00_022BE0B4

	arm_func_start ov00_022BE0C8
ov00_022BE0C8: ; 0x022BE0C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x130
	mov sl, r0
	cmp sl, #3
	bne _022BE108
	bl sub_0204A1CC
	bl ov00_022BCA80
	mov r0, #1
	bl ov00_022BCC30
	bl ov00_022BD3F4
	bl ov00_022BD4EC
	bl ov00_022BD780
	mov r0, #1
	bl ov00_022BCBAC
	mov r0, #2
	b _022BE3B0
_022BE108:
	cmp sl, #4
	bne _022BE134
	bl sub_0204A1CC
	bl ov00_022BCA80
	mov r4, r0
	mov r0, #1
	bl ov00_022BCBAC
	cmp r4, #3
	beq _022BE184
	mov r0, #0x16
	b _022BE3B0
_022BE134:
	bl sub_0204A1CC
	bl ov00_022BCA80
	mov r0, #0
	bl ov00_022BCC30
	cmp r0, #0
	bne _022BE17C
	bl ov00_022BD3F4
	bl sub_0205B80C
	mov r0, #0
	bl sub_0205B77C
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r0, r1
	bl sub_020590DC
	bl ov00_022BD4EC
	cmp sl, #0
	moveq sl, #5
_022BE17C:
	mov r0, #1
	bl ov00_022BCBAC
_022BE184:
	ldr r0, _022BE3B8 ; =ov00_0231E2A0
	mov r1, #1
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0]
	bl sub_02028E2C
	bl sub_02017A68
	mov r0, #2
	bl PlayBgmByIdVeneer
	bl sub_020519D0
	bl sub_0201DC90
	bl ov00_022BE4D8
	bl ov01_0232E768
	ldr r1, _022BE3BC ; =ov00_023187EC
	mov r2, #1
	ldr r0, _022BE3C0 ; =ov00_022BE3CC
	strb r2, [r1]
	bl sub_0200383C
	mov r6, #0
	ldr r7, _022BE3C4 ; =ov00_022BE4C8
	ldr r4, _022BE3B8 ; =ov00_0231E2A0
	mov fp, r6
	mov r5, r6
	mov r8, #3
	mov sb, #2
_022BE1E8:
	bl sub_020038E8
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022BE2AC
	cmp r0, #1
	streq sb, [r4, #4]
	beq _022BE304
	cmp r0, #2
	bne _022BE234
	bl SelectRandomBackground
	cmp sl, #1
	bne _022BE224
	mov r0, #0
	bl ov00_022BE57C
	b _022BE22C
_022BE224:
	mov r0, #0x1e
	bl ov00_022BE57C
_022BE22C:
	str r8, [r4, #4]
	b _022BE304
_022BE234:
	bl ov00_022BE680
	cmp r0, #0
	bne _022BE304
	bl ov00_022BE6AC
	cmp r0, #0
	bne _022BE304
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _022BE320
	cmp sl, #4
	bne _022BE268
	bl ov01_0233AE64
	b _022BE2A4
_022BE268:
	cmp sl, #2
	bne _022BE278
	bl ov01_02337914
	b _022BE2A4
_022BE278:
	cmp sl, #5
	bne _022BE29C
#ifdef JAPAN
	ldr r0, _022BFB70 ; =0x000004D9
#else
	mov r0, #0x248
#endif
	mov r1, #0x100
	add r2, sp, #0x98
	str r7, [sp, #0x11c]
	str r6, [sp, #0x120]
	bl sub_02046804
	b _022BE2A4
_022BE29C:
	mov r0, #0
	bl ov01_023310B8
_022BE2A4:
	str r5, [r4, #4]
	b _022BE304
_022BE2AC:
	ldr r0, [r4]
	cmp r0, #0
	beq _022BE304
	cmp r0, #0x14
	beq _022BE320
	cmp r0, #8
	bne _022BE2E4
	str r7, [sp, #0x84]
	str fp, [sp, #0x88]
	mov r0, #0x100
	add r1, sp, #0
	str fp, [r4]
	bl sub_02049A40
	b _022BE304
_022BE2E4:
	mov r0, #0x1e
	bl sub_02017ACC
	mov r0, #0x1e
	bl ov00_022BE5C8
	mov r0, #0x1e
	bl ov00_022BE630
	mov r0, #4
	str r0, [r4, #4]
_022BE304:
	bl sub_02006E14
	bl ov01_0232EA30
	bl sub_020039E4
	bl ov01_0232EC30
	bl HandleMenus
	bl sub_02028848
	b _022BE1E8
_022BE320:
	mov r0, #0
	bl sub_0200383C
	bl ov01_0232E7E8
	bl sub_02034710
	bl ov01_0232E7C0
	bl ov00_022BE51C
	bl sub_0201DCD0
	bl sub_02051B44
	ldr r0, _022BE3B8 ; =ov00_0231E2A0
	ldr r0, [r0]
	cmp r0, #0x15
	bne _022BE398
	mov r0, #4
	bl UnloadOverlay
	mov r0, #5
	bl LoadOverlay
	bl sub_020184B4
	bl sub_020024B0
	bl InitWfcSettingsOverlay
	ldr r2, _022BE3C8 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_020024C0
	bl sub_020184C0
	mov r0, #3
	bl sub_02002448
	mov r0, #3
	bl sub_02002448
	b _022BE3A8
_022BE398:
	cmp r0, #3
	bne _022BE3A8
	mov r0, #5
	bl sub_02002448
_022BE3A8:
	ldr r0, _022BE3B8 ; =ov00_0231E2A0
	ldr r0, [r0]
_022BE3B0:
	add sp, sp, #0x130
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BE3B8: .word ov00_0231E2A0
_022BE3BC: .word ov00_023187EC
_022BE3C0: .word ov00_022BE3CC
_022BE3C4: .word ov00_022BE4C8
#ifdef JAPAN
_022BFB70: .word 0x000004D9
#endif
_022BE3C8: .word 0x04000208
	arm_func_end ov00_022BE0C8

	arm_func_start ov00_022BE3CC
ov00_022BE3CC: ; 0x022BE3CC
	stmdb sp!, {r4, lr}
	bl sub_0201BF64
	bl sub_02028E40
	bl sub_020038D8
	cmp r0, #0
	beq _022BE3EC
	bl ov00_022BE6D0
	bl sub_02003990
_022BE3EC:
	bl ov01_0232BE98
	bl ov01_0233103C
	bl ov01_0232ED5C
	bl ov00_022BE774
	bl ov01_0232C244
	bl ov01_0232C4D8
	bl sub_0201DD48
	bl sub_0201F464
	ldr r0, _022BE4A4 ; =ov00_023187EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _022BE420
	bl sub_0201DDFC
_022BE420:
	bl sub_02008F84
	bl sub_0201BE28
	bl sub_02017A80
	bl sub_02003A40
	ldr r1, _022BE4A4 ; =ov00_023187EC
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _022BE464
	mov r0, #0
	bl sub_02008ED0
	mov r0, #0
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
_022BE464:
	bl ov01_0232ED84
	mov r0, r4
	bl sub_02028A64
	bl GroupOamAttributesBothScreens
	bl sub_0201BE84
	bl G3X_Reset
	bl sub_0201DE10
	bl sub_02028E88
	bl sub_02051C24
	bl sub_0201BF4C
	bl sub_02008F88
	ldr r1, _022BE4A4 ; =ov00_023187EC
	mov r2, #0
	mov r0, r4
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BE4A4: .word ov00_023187EC
	arm_func_end ov00_022BE3CC

	arm_func_start ov00_022BE4A8
ov00_022BE4A8: ; 0x022BE4A8
	ldr r1, _022BE4C4 ; =ov00_0231E2A0
	ldr r2, [r1]
	cmp r2, #0
	streq r0, [r1]
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022BE4C4: .word ov00_0231E2A0
	arm_func_end ov00_022BE4A8

	arm_func_start ov00_022BE4C8
ov00_022BE4C8: ; 0x022BE4C8
	ldr ip, _022BE4D4 ; =ov01_023310B8
	mov r0, #0
	bx ip
	.align 2, 0
_022BE4D4: .word ov01_023310B8
	arm_func_end ov00_022BE4C8

	arm_func_start ov00_022BE4D8
ov00_022BE4D8: ; 0x022BE4D8
	stmdb sp!, {r3, lr}
	ldr r0, _022BE514 ; =ov00_0231E2FC
	mov r1, #1
	bl sub_0200B894
	ldr r0, _022BE518 ; =ov00_0231E2B8
	mov r1, #1
	bl sub_0200B894
	bl ov00_022BE53C
	ldr r0, _022BE518 ; =ov00_0231E2B8
	mov r1, #1
	bl sub_0200B8D4
	ldr r0, _022BE518 ; =ov00_0231E2B8
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE868
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE514: .word ov00_0231E2FC
_022BE518: .word ov00_0231E2B8
	arm_func_end ov00_022BE4D8

	arm_func_start ov00_022BE51C
ov00_022BE51C: ; 0x022BE51C
	stmdb sp!, {r3, lr}
	ldr r0, _022BE534 ; =ov00_0231E2FC
	bl sub_0200B8B8
	ldr r0, _022BE538 ; =ov00_0231E2B8
	bl sub_0200B8B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE534: .word ov00_0231E2FC
_022BE538: .word ov00_0231E2B8
	arm_func_end ov00_022BE51C

	arm_func_start ov00_022BE53C
ov00_022BE53C: ; 0x022BE53C
	stmdb sp!, {r3, lr}
	ldr r2, _022BE574 ; =ov00_0231E2A8
	mov r1, #0
	strb r1, [r2]
	str r1, [r2, #0xc]
	ldr r0, _022BE578 ; =ov00_0231E2FC
	str r1, [r2, #8]
	mov r1, #1
	strb r1, [r2, #1]
	bl sub_0200B8D4
	ldr r0, _022BE578 ; =ov00_0231E2FC
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE868
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE574: .word ov00_0231E2A8
_022BE578: .word ov00_0231E2FC
	arm_func_end ov00_022BE53C

	arm_func_start ov00_022BE57C
ov00_022BE57C: ; 0x022BE57C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022BE5C0 ; =ov00_0231E2A8
	moveq r1, #1
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022BE5B8
	ldr r0, _022BE5C4 ; =ov00_0231E2FC
	mov r1, r4
	bl sub_0200BB60
	ldr r0, _022BE5C0 ; =ov00_0231E2A8
	mov r1, #1
_022BE5B8:
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BE5C0: .word ov00_0231E2A8
_022BE5C4: .word ov00_0231E2FC
	arm_func_end ov00_022BE57C

	arm_func_start ov00_022BE5C8
ov00_022BE5C8: ; 0x022BE5C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022BE610 ; =ov00_0231E2A8
	moveq r1, #2
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022BE604
	ldr r0, _022BE614 ; =ov00_0231E2FC
	mov r2, r4
	mov r1, #1
	bl sub_0200BB74
	ldr r0, _022BE610 ; =ov00_0231E2A8
_022BE604:
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BE610: .word ov00_0231E2A8
_022BE614: .word ov00_0231E2FC
	arm_func_end ov00_022BE5C8

	arm_func_start ov00_022BE618
ov00_022BE618: ; 0x022BE618
	ldr ip, _022BE628 ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022BE62C ; =ov00_0231E2B8
	bx ip
	.align 2, 0
_022BE628: .word sub_0200BB60
_022BE62C: .word ov00_0231E2B8
	arm_func_end ov00_022BE618

	arm_func_start ov00_022BE630
ov00_022BE630: ; 0x022BE630
	ldr ip, _022BE644 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022BE648 ; =ov00_0231E2B8
	mov r1, #1
	bx ip
	.align 2, 0
_022BE644: .word sub_0200BB74
_022BE648: .word ov00_0231E2B8
	arm_func_end ov00_022BE630

	arm_func_start ov00_022BE64C
ov00_022BE64C: ; 0x022BE64C
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _022BE67C ; =ov00_0231E2B8
	ldrsh r1, [r0, #0x14]
	cmp r1, #0
	ble _022BE670
	mov r1, #2
	bl sub_0200BB74
	ldmia sp!, {r3, pc}
_022BE670:
	mov r1, #1
	bl sub_0200BB74
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE67C: .word ov00_0231E2B8
	arm_func_end ov00_022BE64C

	arm_func_start ov00_022BE680
ov00_022BE680: ; 0x022BE680
	stmdb sp!, {r3, lr}
	ldr r0, _022BE6A4 ; =ov00_0231E2A8
	ldrb r0, [r0]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022BE6A8 ; =ov00_0231E2FC
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE6A4: .word ov00_0231E2A8
_022BE6A8: .word ov00_0231E2FC
	arm_func_end ov00_022BE680

	arm_func_start ov00_022BE6AC
ov00_022BE6AC: ; 0x022BE6AC
	ldr ip, _022BE6B8 ; =sub_0200BD14
	ldr r0, _022BE6BC ; =ov00_0231E2B8
	bx ip
	.align 2, 0
_022BE6B8: .word sub_0200BD14
_022BE6BC: .word ov00_0231E2B8
	arm_func_end ov00_022BE6AC

	arm_func_start ov00_022BE6C0
ov00_022BE6C0: ; 0x022BE6C0
	ldr r0, _022BE6CC ; =ov00_0231E2B8
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022BE6CC: .word ov00_0231E2B8
	arm_func_end ov00_022BE6C0

	arm_func_start ov00_022BE6D0
ov00_022BE6D0: ; 0x022BE6D0
	stmdb sp!, {r3, lr}
	ldr r0, _022BE76C ; =ov00_0231E2A8
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022BE74C
	cmp r1, #1
	beq _022BE700
	cmp r1, #2
	beq _022BE710
	cmp r1, #3
	beq _022BE724
	b _022BE734
_022BE700:
	ldr r1, [r0, #4]
	ldr r0, _022BE770 ; =ov00_0231E2FC
	bl sub_0200BB60
	b _022BE734
_022BE710:
	ldr r2, [r0, #4]
	ldr r0, _022BE770 ; =ov00_0231E2FC
	mov r1, #1
	bl sub_0200BB74
	b _022BE734
_022BE724:
	ldr r2, [r0, #4]
	ldr r0, _022BE770 ; =ov00_0231E2FC
	mov r1, #2
	bl sub_0200BB74
_022BE734:
	ldr r0, _022BE76C ; =ov00_0231E2A8
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
_022BE74C:
	ldr r0, _022BE770 ; =ov00_0231E2FC
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r1, #1
	ldr r0, _022BE76C ; =ov00_0231E2A8
	moveq r1, #0
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE76C: .word ov00_0231E2A8
_022BE770: .word ov00_0231E2FC
	arm_func_end ov00_022BE6D0

	arm_func_start ov00_022BE774
ov00_022BE774: ; 0x022BE774
	stmdb sp!, {r4, lr}
	ldr r0, _022BE85C ; =ov00_0231E2A8
	mov r4, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _022BE830
	ldr r0, _022BE860 ; =ov00_0231E2FC
	bl GetFadeStatus
	cmp r0, #0
	bne _022BE7B8
	ldr r1, _022BE85C ; =ov00_0231E2A8
	ldr r0, _022BE860 ; =ov00_0231E2FC
	ldr r2, [r1, #0xc]
	mov r1, r4
	bl sub_0200BB74
	mov r4, #0
	b _022BE7C8
_022BE7B8:
	ldr r0, _022BE860 ; =ov00_0231E2FC
	bl HandleFadesVeneer
	cmp r0, #0
	movne r4, #0
_022BE7C8:
	ldr r0, _022BE860 ; =ov00_0231E2FC
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE868
	ldr r0, _022BE864 ; =ov00_0231E2B8
	bl GetFadeStatus
	cmp r0, #0
	bne _022BE800
	ldr r1, _022BE85C ; =ov00_0231E2A8
	ldr r0, _022BE864 ; =ov00_0231E2B8
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022BE810
_022BE800:
	ldr r0, _022BE864 ; =ov00_0231E2B8
	bl HandleFadesVeneer
	cmp r0, #0
	movne r4, #0
_022BE810:
	ldr r0, _022BE864 ; =ov00_0231E2B8
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE89C
	cmp r4, #0
	ldrne r0, _022BE85C ; =ov00_0231E2A8
	movne r1, #0
	strneb r1, [r0]
	ldmia sp!, {r4, pc}
_022BE830:
	ldr r0, _022BE860 ; =ov00_0231E2FC
	bl HandleFadesVeneer
	ldr r0, _022BE860 ; =ov00_0231E2FC
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE868
	ldr r0, _022BE864 ; =ov00_0231E2B8
	bl HandleFadesVeneer
	ldr r0, _022BE864 ; =ov00_0231E2B8
	ldrsh r0, [r0, #0x14]
	bl ov00_022BE89C
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BE85C: .word ov00_0231E2A8
_022BE860: .word ov00_0231E2FC
_022BE864: .word ov00_0231E2B8
	arm_func_end ov00_022BE774

	arm_func_start ov00_022BE868
ov00_022BE868: ; 0x022BE868
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl Debug_GetDebugFlag
	cmp r0, #0
	mov r0, #0
	beq _022BE890
	mov r1, r0
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
_022BE890:
	mov r1, r4
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
	arm_func_end ov00_022BE868

	arm_func_start ov00_022BE89C
ov00_022BE89C: ; 0x022BE89C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl Debug_GetDebugFlag
	cmp r0, #0
	mov r0, #1
	beq _022BE8C4
	mov r1, #0
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
_022BE8C4:
	mov r1, r4
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
	arm_func_end ov00_022BE89C

	arm_func_start ov00_022BE8D0
ov00_022BE8D0: ; 0x022BE8D0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022BE910 ; =ov00_023187F0
	mov r1, #0
	ldr r3, [r0]
	mov r2, #1
	str r3, [r0]
	str r2, [sp]
	ldr r0, _022BE914 ; =ov00_023187F4
	str r1, [sp, #4]
	ldr r0, [r0, r3, lsl #2]
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE910: .word ov00_023187F0
_022BE914: .word ov00_023187F4
	arm_func_end ov00_022BE8D0

	arm_func_start SelectRandomBackground
SelectRandomBackground: ; 0x022BE918
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r0, #7
	bl RandInt
	mov r1, #0
	ldr r2, _022BE95C ; =ov00_023187F0
	mov r3, #1
	str r0, [r2]
	str r3, [sp]
	ldr r2, _022BE960 ; =ov00_023187F4
	str r1, [sp, #4]
	ldr r0, [r2, r0, lsl #2]
	mov r2, r1
	mov r3, r1
	bl sub_02052060
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE95C: .word ov00_023187F0
_022BE960: .word ov00_023187F4
	arm_func_end SelectRandomBackground

	arm_func_start WM_Init
WM_Init: ; 0x022BE964
	stmdb sp!, {r3, lr}
	mov r2, #0xf00
	bl WmInitCore
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, _022BE98C ; =ov00_0231E340
	mov r2, #0
	ldr r1, [r1, #4]
	strh r2, [r1, #0x16]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BE98C: .word ov00_0231E340
	arm_func_end WM_Init

	arm_func_start WmInitCore
WmInitCore: ; 0x022BE990
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, r0
	mov r4, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, _022BEB60 ; =ov00_0231E340
	mov r5, r0
	ldrh r1, [r1]
	cmp r1, #0
	beq _022BE9C4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022BE9C4:
	cmp r6, #0
	bne _022BE9D8
	bl SetIrqFlag
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022BE9D8:
	cmp r4, #3
	bls _022BE9EC
	bl SetIrqFlag
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022BE9EC:
	tst r6, #0x1f
	beq _022BEA00
	bl SetIrqFlag
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022BEA00:
	bl PXI_Init
	mov r0, #0xa
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _022BEA28
	mov r0, r5
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022BEA28:
	mov r0, r6
	mov r1, r7
	bl DC_InvalidateRange
	mov r0, r4
	mov r1, r6
	mov r3, r7
	mov r2, #0
	bl MI_DmaFill32
	ldr r0, _022BEB60 ; =ov00_0231E340
	add r1, r6, #0x200
	str r6, [r0, #4]
	str r1, [r6]
	ldr r2, [r0, #4]
	ldr r1, [r2]
	add r1, r1, #0x300
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	add r1, r1, #0x800
	str r1, [r2, #0xc]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc]
	add r0, r0, #0x100
	str r0, [r1, #0x10]
	bl WmClearFifoRecvFlag
	ldr r1, _022BEB60 ; =ov00_0231E340
	mov r3, #0
	ldr r0, [r1, #4]
	mov r2, r3
	strh r4, [r0, #0x14]
	ldr r0, [r1, #4]
	str r3, [r0, #0x14c]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r3, [r0, #0x50]
	b _022BEAD4
_022BEAB8:
	ldr r0, [r1, #4]
	add r0, r0, r3, lsl #2
	str r2, [r0, #0xcc]
	ldr r0, [r1, #4]
	add r0, r0, r3, lsl #2
	str r2, [r0, #0x10c]
	add r3, r3, #1
_022BEAD4:
	cmp r3, #0x10
	blt _022BEAB8
	ldr r0, _022BEB64 ; =ov00_0231E348
	ldr r1, _022BEB68 ; =ov00_0231E368
	mov r2, #0xa
	bl OS_InitMessageQueue
	mov r6, #0
	mov r4, #0x8000
	ldr sl, _022BEB6C ; =ov00_0231E3E0
	mov sb, #2
	ldr r8, _022BEB64 ; =ov00_0231E348
	mov r7, #1
	b _022BEB30
_022BEB08:
	mov r2, r6, lsl #8
	mov r1, sb
	add r0, sl, r6, lsl #8
	strh r4, [sl, r2]
	bl DC_StoreRange
	mov r0, r8
	mov r2, r7
	add r1, sl, r6, lsl #8
	bl OS_SendMessage
	add r6, r6, #1
_022BEB30:
	cmp r6, #0xa
	blt _022BEB08
	ldr r1, _022BEB70 ; =WmReceiveFifo
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	ldr r1, _022BEB60 ; =ov00_0231E340
	mov r2, #1
	mov r0, r5
	strh r2, [r1]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022BEB60: .word ov00_0231E340
_022BEB64: .word ov00_0231E348
_022BEB68: .word ov00_0231E368
_022BEB6C: .word ov00_0231E3E0
_022BEB70: .word WmReceiveFifo
	arm_func_end WmInitCore

	arm_func_start WM_Finish
WM_Finish: ; 0x022BEB74
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl WMi_CheckInitialized
	cmp r0, #0
	beq _022BEB9C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, pc}
_022BEB9C:
	mov r0, #1
	mov r1, #0
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	bl WmClearFifoRecvFlag
	mov r0, #0xa
	mov r1, #0
	bl PXI_SetFifoRecvCallback
	ldr r1, _022BEBE0 ; =ov00_0231E340
	mov r2, #0
	str r2, [r1, #4]
	mov r0, r4
	strh r2, [r1]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BEBE0: .word ov00_0231E340
	arm_func_end WM_Finish

	arm_func_start WMi_SetCallbackTable
WMi_SetCallbackTable: ; 0x022BEBE4
	ldr r2, _022BEBF8 ; =ov00_0231E340
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0x18]
	bx lr
	.align 2, 0
_022BEBF8: .word ov00_0231E340
	arm_func_end WMi_SetCallbackTable

	arm_func_start WmGetCommandBuffer4Arm7
WmGetCommandBuffer4Arm7: ; 0x022BEBFC
	stmdb sp!, {r3, lr}
	ldr r0, _022BEC50 ; =ov00_0231E348
	add r1, sp, #0
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [sp]
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [sp]
	ldrh r0, [r1]
	tst r0, #0x8000
	movne r0, r1
	ldmneia sp!, {r3, pc}
	ldr r0, _022BEC50 ; =ov00_0231E348
	mov r2, #1
	bl OS_JamMessage
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BEC50: .word ov00_0231E348
	arm_func_end WmGetCommandBuffer4Arm7

	arm_func_start WMi_SendCommand
WMi_SendCommand: ; 0x022BEC54
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WmGetCommandBuffer4Arm7
	movs r4, r0
	moveq r0, #8
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	strh r5, [r4]
	ldrh r5, [sp, #0x14]
	add r0, sp, #0x14
	bic r0, r0, #3
	mov r3, #0
	cmp r5, #0
	add r2, r0, #4
	ble _022BECB4
_022BEC98:
	add r2, r2, #4
	ldr r1, [r2, #-4]
	add r0, r4, r3, lsl #2
	add r3, r3, #1
	str r1, [r0, #4]
	cmp r3, r5
	blt _022BEC98
_022BECB4:
	mov r0, r4
	mov r1, #0x100
	bl DC_StoreRange
	mov r1, r4
	mov r0, #0xa
	mov r2, #0
	bl PXI_SendWordByFifo
	mov r5, r0
	ldr r0, _022BECFC ; =ov00_0231E348
	mov r1, r4
	mov r2, #1
	bl OS_SendMessage
	cmp r5, #0
	movlt r0, #8
	movge r0, #2
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022BECFC: .word ov00_0231E348
	arm_func_end WMi_SendCommand

	arm_func_start WMi_SendCommandDirect
WMi_SendCommandDirect: ; 0x022BED00
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl WmGetCommandBuffer4Arm7
	movs r5, r0
	moveq r0, #8
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MI_CpuCopy8
	mov r0, r5
	mov r1, r4
	bl DC_StoreRange
	mov r1, r5
	mov r0, #0xa
	mov r2, #0
	bl PXI_SendWordByFifo
	mov r4, r0
	ldr r0, _022BED6C ; =ov00_0231E348
	mov r1, r5
	mov r2, #1
	bl OS_SendMessage
	cmp r4, #0
	movlt r0, #8
	movge r0, #2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BED6C: .word ov00_0231E348
	arm_func_end WMi_SendCommandDirect

	arm_func_start WMi_GetSystemWork
WMi_GetSystemWork: ; 0x022BED70
	ldr r0, _022BED7C ; =ov00_0231E340
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022BED7C: .word ov00_0231E340
	arm_func_end WMi_GetSystemWork

	arm_func_start WMi_CheckInitialized
WMi_CheckInitialized: ; 0x022BED80
	ldr r0, _022BED98 ; =ov00_0231E340
	ldrh r0, [r0]
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	bx lr
	.align 2, 0
_022BED98: .word ov00_0231E340
	arm_func_end WMi_CheckInitialized

	arm_func_start WMi_CheckIdle
WMi_CheckIdle: ; 0x022BED9C
	stmdb sp!, {r3, lr}
	bl WMi_CheckInitialized
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _022BEDE0 ; =ov00_0231E340
	mov r1, #2
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl DC_InvalidateRange
	ldr r0, _022BEDE0 ; =ov00_0231E340
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	cmp r0, #1
	movls r0, #3
	movhi r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BEDE0: .word ov00_0231E340
	arm_func_end WMi_CheckIdle

	arm_func_start WMi_CheckState
WMi_CheckState: ; 0x022BEDE4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	bl WMi_CheckInitialized
	cmp r0, #0
	ldmneia sp!, {r3, lr}
	addne sp, sp, #0x10
	bxne lr
	ldr r0, _022BEE74 ; =ov00_0231E340
	mov r1, #2
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl DC_InvalidateRange
	ldr r0, _022BEE74 ; =ov00_0231E340
	ldr r3, [sp, #8]
	ldr r0, [r0, #4]
	add r1, sp, #8
	ldr r2, [r0, #4]
	bic r0, r1, #3
	add ip, r0, #4
	ldrh lr, [r2]
	cmp r3, #0
	mov r0, #3
	ldmeqia sp!, {r3, lr}
	addeq sp, sp, #0x10
	bxeq lr
	mov r1, #0
_022BEE4C:
	add ip, ip, #4
	ldr r2, [ip, #-4]
	cmp r2, lr
	moveq r0, r1
	subs r3, r3, #1
	str r3, [sp, #8]
	bne _022BEE4C
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022BEE74: .word ov00_0231E340
	arm_func_end WMi_CheckState

	arm_func_start WmReceiveFifo
WmReceiveFifo: ; 0x022BEE78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _022BF210 ; =ov00_0231E340
	cmp r2, #0
	ldr r4, [r0, #4]
	mov sl, r1
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x10]
	mov r1, #0x100
	bl DC_InvalidateRange
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _022BEEBC
	ldr r0, [r4, #4]
	mov r1, #0x800
	bl DC_InvalidateRange
_022BEEBC:
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _022BEED4
	mov r0, sl
	mov r1, #0x100
	bl DC_InvalidateRange
_022BEED4:
	ldrh r0, [sl]
	cmp r0, #0x2c
	blo _022BEF8C
	cmp r0, #0x80
	bne _022BEF10
	ldrh r0, [sl, #2]
	cmp r0, #0x13
	bne _022BEEF8
	bl WaitForever2
_022BEEF8:
	ldr r1, [r4, #0xc8]
	cmp r1, #0
	beq _022BF1D0
	mov r0, sl
	blx r1
	b _022BF1D0
_022BEF10:
	cmp r0, #0x82
	bne _022BEF64
	ldrh r0, [sl, #6]
	add r1, r4, r0, lsl #2
	ldr r0, [r1, #0xcc]
	cmp r0, #0
	beq _022BF1D0
	ldr r0, [r1, #0x10c]
	str r0, [sl, #0x1c]
	ldr r0, [r4, #0x14c]
	strh r0, [sl, #0x22]
	ldr r1, [r4, #4]
	ldr r0, [sl, #8]
	ldrh r1, [r1, #0x72]
	bl DC_InvalidateRange
	ldrh r1, [sl, #6]
	mov r0, sl
	add r1, r4, r1, lsl #2
	ldr r1, [r1, #0xcc]
	blx r1
	b _022BF1D0
_022BEF64:
	cmp r0, #0x81
	bne _022BF1D0
	mov r0, #0xf
	strh r0, [sl]
	ldr r1, [sl, #0x1c]
	cmp r1, #0
	beq _022BF1D0
	mov r0, sl
	blx r1
	b _022BF1D0
_022BEF8C:
	cmp r0, #0xe
	bne _022BEFCC
	ldrh r0, [sl, #4]
	add r0, r0, #0xf5
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022BEFCC
	ldrh r0, [sl, #2]
	cmp r0, #0
	bne _022BEFCC
	ldr r1, [r4, #4]
	ldr r0, [sl, #8]
	ldrh r1, [r1, #0x72]
	bl DC_InvalidateRange
_022BEFCC:
	ldrh r1, [sl]
	cmp r1, #2
	ldreqh r0, [sl, #2]
	cmpeq r0, #0
	add r0, r4, r1, lsl #2
	bne _022BF008
	ldr r4, [r0, #0x18]
	bl WM_Finish
	cmp r4, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	blx r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022BF008:
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _022BF030
	mov r0, sl
	blx r1
	ldr r0, _022BF210 ; =ov00_0231E340
	ldrh r0, [r0]
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022BF030:
	ldrh r0, [sl]
	cmp r0, #8
	cmpne r0, #0xc
	bne _022BF1D0
	cmp r0, #8
	bne _022BF074
	add r0, sl, #0xa
	str r0, [sp]
	ldrh r5, [sl, #8]
	ldrh r6, [sl, #0x10]
	ldrh r0, [sl, #0x12]
	add fp, sl, #0x14
	mov r7, #0
	str r0, [sp, #4]
	ldrh r8, [sl, #0x2c]
	ldrh sb, [sl, #0x2e]
	b _022BF0A4
_022BF074:
	cmp r0, #0xc
	bne _022BF0A4
	ldrh r5, [sl, #8]
	ldrh r7, [sl, #0xa]
	ldrh r0, [sl, #0xc]
	mov r6, #0
	mov fp, r6
	str r0, [sp, #4]
	add r0, sl, #0x10
	ldrh r8, [sl, #0x16]
	ldrh sb, [sl, #0x18]
	str r0, [sp]
_022BF0A4:
	cmp r5, #7
	cmpne r5, #9
	cmpne r5, #0x1a
	bne _022BF1D0
	cmp r5, #7
	ldreq r1, [r4, #0x14c]
	mov r0, #1
	orreq r0, r1, r0, lsl r6
	mvnne r0, r0, lsl r6
	ldrne r1, [r4, #0x14c]
	add r3, r4, #0x100
	andne r0, r1, r0
	str r0, [r4, #0x14c]
	ldr r0, _022BF214 ; =ov00_0231E390
	mov r1, #0
	mov r2, #0x44
	strh r7, [r3, #0x50]
	bl MI_CpuFill8
	ldr ip, _022BF210 ; =ov00_0231E340
	mov r1, #0x82
	strh r1, [ip, #0x50]
	mov r1, #0
	strh r1, [ip, #0x52]
	strh r5, [ip, #0x54]
	str r1, [ip, #0x58]
	str r1, [ip, #0x5c]
	strh r1, [ip, #0x60]
	strh r6, [ip, #0x62]
	strh r7, [ip, #0x70]
	ldr r2, [r4, #0x14c]
	ldr r1, _022BF218 ; =0x0000FFFF
	strh r2, [ip, #0x72]
	strh r1, [ip, #0x6a]
	ldr r3, [sp, #4]
	ldr r0, [sp]
	ldr r1, _022BF21C ; =ov00_0231E3A4
	mov r2, #6
	strh r3, [ip, #0x8c]
	bl MI_CpuCopy8
	cmp fp, #0
	mov r2, #0x18
	beq _022BF15C
	ldr r1, _022BF220 ; =ov00_0231E3B4
	mov r0, fp
	bl MTi_CpuCopy16
	b _022BF168
_022BF15C:
	ldr r1, _022BF220 ; =ov00_0231E3B4
	mov r0, #0
	bl MTi_CpuClear16
_022BF168:
	cmp r7, #0
	moveq r1, r8
	movne r1, sb
	cmp r7, #0
	ldr r0, _022BF210 ; =ov00_0231E340
	ldr r7, _022BF210 ; =ov00_0231E340
	strh r1, [r0, #0x90]
	movne sb, r8
	ldr r5, _022BF214 ; =ov00_0231E390
	mov r6, #0
	strh sb, [r7, #0x92]
_022BF194:
	strh r6, [r7, #0x56]
	add r2, r4, r6, lsl #2
	ldr r0, [r2, #0xcc]
	cmp r0, #0
	beq _022BF1BC
	ldr r1, [r2, #0x10c]
	mov r0, r5
	str r1, [r7, #0x6c]
	ldr r1, [r2, #0xcc]
	blx r1
_022BF1BC:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	cmp r6, #0x10
	blo _022BF194
_022BF1D0:
	ldr r0, [r4, #0x10]
	mov r1, #0x100
	bl DC_InvalidateRange
	bl WmClearFifoRecvFlag
	ldr r0, [r4, #0x10]
	cmp sl, r0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r2, [sl]
	mov r0, sl
	mov r1, #0x100
	orr r2, r2, #0x8000
	strh r2, [sl]
	bl DC_StoreRange
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BF210: .word ov00_0231E340
_022BF214: .word ov00_0231E390
_022BF218: .word 0x0000FFFF
_022BF21C: .word ov00_0231E3A4
_022BF220: .word ov00_0231E3B4
	arm_func_end WmReceiveFifo

	arm_func_start WmClearFifoRecvFlag
WmClearFifoRecvFlag: ; 0x022BF224
	ldr r1, _022BF23C ; =0x027FFF96
	ldrh r0, [r1]
	tst r0, #1
	bicne r0, r0, #1
	strneh r0, [r1]
	bx lr
	.align 2, 0
_022BF23C: .word 0x027FFF96
	arm_func_end WmClearFifoRecvFlag

	arm_func_start WMi_GetStatusAddress
WMi_GetStatusAddress: ; 0x022BF240
	stmdb sp!, {r3, lr}
	bl WMi_CheckInitialized
	cmp r0, #0
	movne r0, #0
	ldreq r0, _022BF260 ; =ov00_0231E340
	ldreq r0, [r0, #4]
	ldreq r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF260: .word ov00_0231E340
	arm_func_end WMi_GetStatusAddress

	arm_func_start WM_GetAid
WM_GetAid: ; 0x022BF264
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022BF290 ; =ov00_0231E340
	ldr r1, [r1, #4]
	cmp r1, #0
	addne r1, r1, #0x100
	ldrneh r4, [r1, #0x50]
	moveq r4, #0
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BF290: .word ov00_0231E340
	arm_func_end WM_GetAid

	arm_func_start WM_GetConnectedAids
WM_GetConnectedAids: ; 0x022BF294
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022BF2C0 ; =ov00_0231E340
	ldr r1, [r1, #4]
	cmp r1, #0
	ldrne r4, [r1, #0x14c]
	moveq r4, #0
	bl SetIrqFlag
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BF2C0: .word ov00_0231E340
	arm_func_end WM_GetConnectedAids

	arm_func_start WM_SetIndCallback
WM_SetIndCallback: ; 0x022BF2C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl EnableIrqFlag
	mov r5, r0
	bl WMi_CheckInitialized
	movs r4, r0
	beq _022BF2F0
	mov r0, r5
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_022BF2F0:
	bl WMi_GetSystemWork
	str r6, [r0, #0xc8]
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WM_SetIndCallback

	arm_func_start WM_SetPortCallback
WM_SetPortCallback: ; 0x022BF308
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x44
	movs r5, r1
	mov r6, r0
	mov r4, r2
	beq _022BF370
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x44
	bl MI_CpuFill8
	mov r3, #0
	ldr r1, _022BF3DC ; =0x0000FFFF
	mov r7, #0x82
	mov r2, #0x19
	add r0, sp, #0x14
	strh r7, [sp]
	strh r3, [sp, #2]
	strh r2, [sp, #4]
	strh r6, [sp, #6]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	strh r3, [sp, #0x10]
	strh r1, [sp, #0x1a]
	str r4, [sp, #0x1c]
	strh r3, [sp, #0x12]
	bl OS_GetMacAddress
_022BF370:
	bl EnableIrqFlag
	mov r8, r0
	bl WMi_CheckInitialized
	movs r7, r0
	beq _022BF398
	mov r0, r8
	bl SetIrqFlag
	add sp, sp, #0x44
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022BF398:
	bl WMi_GetSystemWork
	add r0, r0, r6, lsl #2
	str r5, [r0, #0xcc]
	str r4, [r0, #0x10c]
	cmp r5, #0
	beq _022BF3C8
	bl WM_GetConnectedAids
	strh r0, [sp, #0x22]
	bl WM_GetAid
	strh r0, [sp, #0x20]
	add r0, sp, #0
	blx r5
_022BF3C8:
	mov r0, r8
	bl SetIrqFlag
	mov r0, #0
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022BF3DC: .word 0x0000FFFF
	arm_func_end WM_SetPortCallback

	arm_func_start WM_ReadStatus
WM_ReadStatus: ; 0x022BF3E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WMi_GetSystemWork
	mov r4, r0
	bl WMi_CheckInitialized
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #0x7d0
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	mov r1, r5
	mov r2, #0x7d0
	bl MTi_CpuCopy32Fast
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_ReadStatus

	arm_func_start WM_GetMpSendBufferSize
WM_GetMpSendBufferSize: ; 0x022BF42C
	stmdb sp!, {r4, lr}
	bl WMi_GetSystemWork
	mov r4, r0
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl WMi_CheckState
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r1, #0x3c
	mov r1, #4
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x3c]
	add r0, r0, #0x1f
	bic r0, r0, #0x1f
	ldmia sp!, {r4, pc}
	arm_func_end WM_GetMpSendBufferSize

	arm_func_start WM_GetMpReceiveBufferSize
WM_GetMpReceiveBufferSize: ; 0x022BF498
	stmdb sp!, {r3, r4, r5, lr}
	bl WMi_GetSystemWork
	mov r4, r0
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl WMi_CheckState
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r1, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	moveq r5, #1
	add r0, r1, #0x3e
	mov r1, #2
	movne r5, #0
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	cmp r5, #1
	ldrh r5, [r0, #0x3e]
	addne r0, r5, #0x51
	bicne r0, r0, #0x1f
	movne r0, r0, lsl #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r0, #0xf8
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	add r1, r5, #0xc
	ldrh r0, [r0, #0xf8]
	mul r0, r1, r0
	add r0, r0, #0x29
	bic r0, r0, #0x1f
	mov r0, r0, lsl #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_GetMpReceiveBufferSize

	arm_func_start WM_ReadMpData
WM_ReadMpData: ; 0x022BF55C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	mov r5, r0
	mov r4, r1
	bl WMi_GetSystemWork
	mov r6, r0
	bl WMi_CheckInitialized
	cmp r0, #0
	addne sp, sp, #0x3c
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r4, #1
	blo _022BF598
	cmp r4, #0xf
	bls _022BF5A4
_022BF598:
	add sp, sp, #0x3c
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, pc}
_022BF5A4:
	ldr r0, [r6, #4]
	mov r1, #2
	add r0, r0, #0x82
	add r0, r0, #0x100
	bl DC_InvalidateRange
	ldr r0, [r6, #4]
	mov r1, #1
	add r0, r0, #0x100
	ldrh r0, [r0, #0x82]
	tst r0, r1, lsl r4
	addeq sp, sp, #0x3c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldrh r0, [r5, #4]
	cmp r0, #0
	addeq sp, sp, #0x3c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r0, r5, #0xa
	str r0, [sp]
	mov r3, #0
	add r2, sp, #0
_022BF5FC:
	ldr r0, [r2, r3, lsl #2]
	ldrh r1, [r0, #4]
	cmp r4, r1
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r3, r3, #1
	add r0, r2, r3, lsl #2
	ldrh r1, [r5, #6]
	ldr r0, [r0, #-4]
	add r0, r1, r0
	str r0, [r2, r3, lsl #2]
	ldrh r0, [r5, #4]
	cmp r3, r0
	blt _022BF5FC
	mov r0, #0
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end WM_ReadMpData

	arm_func_start WM_GetAllowedChannel
WM_GetAllowedChannel: ; 0x022BF640
	stmdb sp!, {r3, lr}
	bl WMi_CheckInitialized
	cmp r0, #0
	movne r0, #0x8000
	ldreq r0, _022BF65C ; =0x027FFCFA
	ldreqh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF65C: .word 0x027FFCFA
	arm_func_end WM_GetAllowedChannel

	arm_func_start WM_GetLinkLevel
WM_GetLinkLevel: ; 0x022BF660
	stmdb sp!, {r4, lr}
	bl WMi_GetSystemWork
	mov r4, r0
	bl WMi_CheckInitialized
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	cmp r0, #9
	beq _022BF6A8
	cmp r0, #0xa
	cmpne r0, #0xb
	beq _022BF6D0
	b _022BF6E8
_022BF6A8:
	add r0, r1, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x82]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_022BF6D0:
	add r0, r1, #0xbc
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0xbc]
	ldmia sp!, {r4, pc}
_022BF6E8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end WM_GetLinkLevel

	arm_func_start WM_GetDispersionBeaconPeriod
WM_GetDispersionBeaconPeriod: ; 0x022BF6F0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r2, #0
	add r3, sp, #0
	mov r1, r2
_022BF70C:
	ldrb r0, [r3], #1
	add r2, r2, #1
	cmp r2, #6
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	blt _022BF70C
	ldr r0, _022BF778 ; =0x027FFC3C
	ldr ip, _022BF77C ; =0x66666667
	ldr r0, [r0]
	mov r3, #0x14
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r0, r0, r0, lsl #3
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r2, lsr #0x1f
	smull r2, lr, ip, r2
	add lr, r1, lr, asr #3
	smull r1, r2, r3, lr
	rsb lr, r1, r0, lsr #16
	add r0, lr, #0xc8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF778: .word 0x027FFC3C
_022BF77C: .word 0x66666667
	arm_func_end WM_GetDispersionBeaconPeriod

	arm_func_start WM_GetDispersionScanPeriod
WM_GetDispersionScanPeriod: ; 0x022BF780
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r1, #0
	add r3, sp, #0
	mov r2, r1
_022BF79C:
	ldrb r0, [r3], #1
	add r1, r1, #1
	cmp r1, #6
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	blt _022BF79C
	ldr r0, _022BF80C ; =0x027FFC3C
	mov r1, #0xd
	ldr r0, [r0]
	ldr r3, _022BF810 ; =0x66666667
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mul r0, r2, r1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r2, lsr #0x1f
	smull r2, ip, r3, r2
	add ip, r1, ip, asr #2
	mov r3, #0xa
	smull r1, r2, r3, ip
	rsb ip, r1, r0, lsr #16
	add r0, ip, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF80C: .word 0x027FFC3C
_022BF810: .word 0x66666667
	arm_func_end WM_GetDispersionScanPeriod

	arm_func_start WM_GetOtherElements
WM_GetOtherElements: ; 0x022BF814
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x84
	ldrh r2, [r1, #0x3c]
	mov lr, r0
	cmp r2, #0
	beq _022BF85C
	mov r0, #0
	add r5, sp, #0
	strb r0, [sp]
	mov r4, #8
_022BF83C:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BF83C
	ldr r0, [r5]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022BF85C:
	ldrh r0, [r1, #0x3e]
	strb r0, [sp]
	ands r0, r0, #0xff
	bne _022BF894
	add r5, sp, #0
	mov r4, #8
_022BF874:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BF874
	ldr r0, [r5]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022BF894:
	cmp r0, #0x10
	movhi r0, #0x10
	strhib r0, [sp]
	ldrh r2, [r1]
	ldrb r0, [sp]
	mov r3, #0
	mov r2, r2, lsl #1
	sub r4, r2, #0x40
	cmp r0, #0
	add r0, r1, #0x40
	mov r2, r3
	and r1, r4, #0xff
	ble _022BF944
	add ip, sp, #0
_022BF8CC:
	ldrb r5, [r0]
	add r6, ip, r2, lsl #3
	add r4, r0, #2
	strb r5, [r6, #4]
	ldrb r5, [r0, #1]
	strb r5, [r6, #5]
	str r4, [r6, #8]
	ldrb r4, [r6, #5]
	add r4, r4, #2
	and r5, r4, #0xff
	add r3, r3, r5
	and r3, r3, #0xff
	cmp r3, r1
	bls _022BF930
	mov r0, #0
	strb r0, [sp]
	mov r4, #8
_022BF910:
	ldmia ip!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BF910
	ldr r0, [ip]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022BF930:
	ldrb r4, [sp]
	add r2, r2, #1
	add r0, r0, r5
	cmp r2, r4
	blt _022BF8CC
_022BF944:
	add r4, sp, #0
	mov ip, #8
_022BF94C:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022BF94C
	ldr r0, [r4]
	str r0, [lr]
	add sp, sp, #0x84
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end WM_GetOtherElements

	arm_func_start WM_GetNextTgid
WM_GetNextTgid: ; 0x022BF96C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _022BF9DC ; =ov00_02318810
	ldr r0, [r0]
	cmp r0, #0x10000
	bne _022BF9B4
	bl Rtc_Init
	add r0, sp, #0
	bl Rtc_GetTime
	cmp r0, #0
	bne _022BF9B4
	ldr r2, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, _022BF9DC ; =ov00_02318810
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
_022BF9B4:
	ldr r1, _022BF9DC ; =ov00_02318810
	ldr r0, [r1]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r2, lsl #0x10
	str r2, [r1]
	mov r0, r0, lsr #0x10
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_022BF9DC: .word ov00_02318810
	arm_func_end WM_GetNextTgid

	arm_func_start WM_Enable
WM_Enable: ; 0x022BF9E0
	ldr ip, _022BF9EC ; =WMi_EnableEx
	mov r1, #0
	bx ip
	.align 2, 0
_022BF9EC: .word WMi_EnableEx
	arm_func_end WM_Enable

	arm_func_start WMi_EnableEx
WMi_EnableEx: ; 0x022BF9F0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #0
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #3
	bl WMi_SetCallbackTable
	bl WMi_GetSystemWork
	mov r3, r0
	ldr r1, [r3, #0x10]
	mov r0, #3
	stmia sp, {r1, r4}
	mov r1, #4
	ldmia r3, {r2, r3}
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WMi_EnableEx

	arm_func_start WM_Disable
WM_Disable: ; 0x022BFA54
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, r0
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #4
	bl WMi_SetCallbackTable
	mov r0, #4
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_Disable

	arm_func_start WM_PowerOn
WM_PowerOn: ; 0x022BFA94
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, r0
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #5
	bl WMi_SetCallbackTable
	mov r0, #5
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_PowerOn

	arm_func_start WM_PowerOff
WM_PowerOff: ; 0x022BFAD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #2
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #6
	bl WMi_SetCallbackTable
	mov r0, #6
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_PowerOff

	arm_func_start WM_InitializeEx
WM_InitializeEx: ; 0x022BFB14
	ldr ip, _022BFB20 ; =WMi_InitializeEx
	mov r3, #0
	bx ip
	.align 2, 0
_022BFB20: .word WMi_InitializeEx
	arm_func_end WM_InitializeEx

	arm_func_start WM_InitializeForListening
WM_InitializeForListening: ; 0x022BFB24
	ldr ip, _022BFB38 ; =WMi_InitializeEx
	cmp r3, #0
	mov r3, #1
	orreq r3, r3, #2
	bx ip
	.align 2, 0
_022BFB38: .word WMi_InitializeEx
	arm_func_end WM_InitializeForListening

	arm_func_start WMi_InitializeEx
WMi_InitializeEx: ; 0x022BFB3C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r1, r2
	mov r4, r3
	bl WM_Init
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0
	bl WMi_SetCallbackTable
	bl WMi_GetSystemWork
	mov r3, r0
	ldr r1, [r3, #0x10]
	mov r0, #0
	stmia sp, {r1, r4}
	mov r1, #4
	ldmia r3, {r2, r3}
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WMi_InitializeEx

	arm_func_start WM_Reset
WM_Reset: ; 0x022BFB9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl WMi_CheckIdle
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl WMi_SetCallbackTable
	mov r0, #1
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_Reset

	arm_func_start WM_End
WM_End: ; 0x022BFBD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #2
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #2
	bl WMi_SetCallbackTable
	mov r0, #2
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_End

	arm_func_start WM_SetParentParameter
WM_SetParentParameter: ; 0x022BFC14
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #2
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _022BFC5C
	ldr r0, [r4]
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
_022BFC5C:
	ldrh r1, [r4, #0x14]
	ldrh r0, [r4, #0x34]
	cmp r1, #0
	movne r2, #0x2a
	moveq r2, #0
	add r0, r0, r2
	cmp r0, #0x200
	bgt _022BFC98
	ldrh r0, [r4, #0x36]
	cmp r1, #0
	movne r1, #6
	moveq r1, #0
	add r0, r0, r1
	cmp r0, #0x200
	ble _022BFCA0
_022BFC98:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, pc}
_022BFCA0:
	mov r0, r4
	bl WmCheckParentParameter
	mov r1, r5
	mov r0, #7
	bl WMi_SetCallbackTable
	mov r0, r4
	mov r1, #0x40
	bl DC_StoreRange
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _022BFCD4
	ldr r0, [r4]
	bl DC_StoreRange
_022BFCD4:
	mov r2, r4
	mov r0, #7
	mov r1, #1
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_SetParentParameter

	arm_func_start WmCheckParentParameter
WmCheckParentParameter: ; 0x022BFCF0
	ldrh r1, [r0, #4]
	cmp r1, #0x70
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #0x18]
	cmp r1, #0xa
	blo _022BFD14
	cmp r1, #0x3e8
	bls _022BFD1C
_022BFD14:
	mov r0, #0
	bx lr
_022BFD1C:
	ldrh r0, [r0, #0x32]
	cmp r0, #1
	blo _022BFD30
	cmp r0, #0xe
	bls _022BFD38
_022BFD30:
	mov r0, #0
	bx lr
_022BFD38:
	mov r0, #1
	bx lr
	arm_func_end WmCheckParentParameter

	arm_func_start WMi_StartParentEx
WMi_StartParentEx: ; 0x022BFD40
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #2
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl WMi_GetSystemWork
	add r1, r0, #0x100
	mov r2, #0
	strh r2, [r1, #0x50]
	str r2, [r0, #0x14c]
	mov r1, r5
	mov r0, #8
	bl WMi_SetCallbackTable
	mov r2, r4
	mov r0, #8
	mov r1, #1
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WMi_StartParentEx

	arm_func_start WM_StartParent
WM_StartParent: ; 0x022BFD9C
	ldr ip, _022BFDA8 ; =WMi_StartParentEx
	mov r1, #1
	bx ip
	.align 2, 0
_022BFDA8: .word WMi_StartParentEx
	arm_func_end WM_StartParent

	arm_func_start WM_EndParent
WM_EndParent: ; 0x022BFDAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #7
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #9
	bl WMi_SetCallbackTable
	mov r0, #9
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_EndParent

	arm_func_start WM_StartScan
WM_StartScan: ; 0x022BFDEC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #3
	mov r4, r1
	mov r2, r0
	mov r1, #2
	mov r3, #5
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	addeq sp, sp, #0x10
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #1
	blo _022BFE54
	cmp r0, #0xe
	bls _022BFE60
_022BFE54:
	add sp, sp, #0x10
	mov r0, #6
	ldmia sp!, {r3, r4, r5, pc}
_022BFE60:
	mov r1, r5
	mov r0, #0xa
	bl WMi_SetCallbackTable
	mov r0, #0xa
	strh r0, [sp]
	ldrh r2, [r4, #4]
	add r0, sp, #0
	mov r1, #0x10
	strh r2, [sp, #2]
	ldr r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #6]
	strh r2, [sp, #8]
	ldrb r2, [r4, #8]
	strb r2, [sp, #0xa]
	ldrb r2, [r4, #9]
	strb r2, [sp, #0xb]
	ldrb r2, [r4, #0xa]
	strb r2, [sp, #0xc]
	ldrb r2, [r4, #0xb]
	strb r2, [sp, #0xd]
	ldrb r2, [r4, #0xc]
	strb r2, [sp, #0xe]
	ldrb r2, [r4, #0xd]
	strb r2, [sp, #0xf]
	bl WMi_SendCommandDirect
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_StartScan

	arm_func_start WM_StartScanEx
WM_StartScanEx: ; 0x022BFED8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x3c
	mov r5, r0
	mov r0, #3
	mov r4, r1
	mov r2, r0
	mov r1, #2
	mov r3, #5
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x3c
	ldmneia sp!, {r4, r5, pc}
	cmp r4, #0
	addeq sp, sp, #0x3c
	moveq r0, #6
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #0
	addeq sp, sp, #0x3c
	moveq r0, #6
	ldmeqia sp!, {r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #0x400
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
	ldrh r0, [r4, #0x12]
	cmp r0, #0x20
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #2
	cmpne r0, #3
	addne sp, sp, #0x3c
	movne r0, #6
	ldmneia sp!, {r4, r5, pc}
	add r0, r0, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022BFFA0
	ldrh r0, [r4, #0x34]
	cmp r0, #0x20
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
_022BFFA0:
	mov r1, r5
	mov r0, #0x26
	bl WMi_SetCallbackTable
	mov r0, #0x26
	strh r0, [sp]
	ldrh r2, [r4, #6]
	add r1, sp, #0xc
	add r0, r4, #0xa
	strh r2, [sp, #2]
	ldr r3, [r4]
	mov r2, #6
	str r3, [sp, #4]
	ldrh r3, [r4, #4]
	strh r3, [sp, #8]
	ldrh r3, [r4, #8]
	strh r3, [sp, #0xa]
	bl MI_CpuCopy8
	ldrh r2, [r4, #0x10]
	add r1, sp, #0x16
	add r0, r4, #0x14
	strh r2, [sp, #0x12]
	ldrh r3, [r4, #0x34]
	mov r2, #0x20
	strh r3, [sp, #0x36]
	ldrh r3, [r4, #0x12]
	strh r3, [sp, #0x14]
	bl MI_CpuCopy8
	add r0, sp, #0
	mov r1, #0x3c
	bl WMi_SendCommandDirect
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, pc}
	arm_func_end WM_StartScanEx

	arm_func_start WM_EndScan
WM_EndScan: ; 0x022C0028
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #5
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #0xb
	bl WMi_SetCallbackTable
	mov r0, #0xb
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end WM_EndScan

	arm_func_start WM_StartConnectEx
WM_StartConnectEx: ; 0x022C0068
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x28
	mov r7, r0
	mov r6, r1
	mov r0, #1
	mov r1, #2
	mov r5, r2
	mov r4, r3
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x28
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	addeq sp, sp, #0x28
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6]
	mov r0, r6
	mov r1, r1, lsl #1
	bl DC_StoreRange
	bl WMi_GetSystemWork
	add r1, r0, #0x100
	mov r2, #0
	strh r2, [r1, #0x50]
	str r2, [r0, #0x14c]
	mov r1, r7
	mov r0, #0xc
	bl WMi_SetCallbackTable
	mov r0, #0xc
	strh r0, [sp]
	str r6, [sp, #4]
	cmp r5, #0
	mov r2, #0x18
	beq _022C0100
	add r1, sp, #8
	mov r0, r5
	bl MI_CpuCopy8
	b _022C010C
_022C0100:
	add r0, sp, #8
	mov r1, #0
	bl MI_CpuFill8
_022C010C:
	ldrh r2, [sp, #0x40]
	add r0, sp, #0
	mov r1, #0x28
	str r4, [sp, #0x20]
	strh r2, [sp, #0x26]
	bl WMi_SendCommandDirect
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WM_StartConnectEx

	arm_func_start WM_Disconnect
WM_Disconnect: ; 0x022C0134
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl WMi_GetSystemWork
	mov r1, #0xa
	mov r6, r0
	str r1, [sp]
	mov ip, #0xb
	mov r0, #5
	mov r1, #7
	mov r2, #9
	mov r3, #8
	str ip, [sp, #4]
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	cmp r0, #7
	cmpne r0, #9
	bne _022C01E0
	cmp r4, #1
	blo _022C01A0
	cmp r4, #0xf
	bls _022C01AC
_022C01A0:
	add sp, sp, #8
	mov r0, #6
	ldmia sp!, {r4, r5, r6, pc}
_022C01AC:
	add r0, r1, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r6, #4]
	mov r1, #1
	add r0, r0, #0x100
	ldrh r0, [r0, #0x82]
	tst r0, r1, lsl r4
	bne _022C01F0
	add sp, sp, #8
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022C01E0:
	cmp r4, #0
	addne sp, sp, #8
	movne r0, #6
	ldmneia sp!, {r4, r5, r6, pc}
_022C01F0:
	mov r1, r5
	mov r0, #0xd
	bl WMi_SetCallbackTable
	mov r1, #1
	mov r2, r1, lsl r4
	mov r0, #0xd
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WM_Disconnect

	arm_func_start WMi_StartMP
WMi_StartMP: ; 0x022C021C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x40
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl WMi_GetSystemWork
	ldr r4, [r0, #4]
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x40
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r4, #0xc6
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r4, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	ldrneh r0, [r4, #0xc6]
	cmpne r0, #1
	addne sp, sp, #0x40
	movne r0, #3
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0xc
	mov r1, #4
	bl DC_InvalidateRange
	ldr r0, [r4, #0xc]
	cmp r0, #1
	addeq sp, sp, #0x40
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r6, #0x3f
	addne sp, sp, #0x40
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrh sb, [sp, #0x60]
	tst sb, #0x1f
	addne sp, sp, #0x40
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0x9c
	mov r1, #2
	bl DC_InvalidateRange
	ldrh r0, [r4, #0x9c]
	cmp r0, #0
	bne _022C0314
	bl WM_GetMpReceiveBufferSize
	cmp r6, r0
	addlt sp, sp, #0x40
	movlt r0, #6
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl WM_GetMpSendBufferSize
	cmp sb, r0
	addlt sp, sp, #0x40
	movlt r0, #6
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C0314:
	mov r1, r8
	mov r0, #0xe
	bl WMi_SetCallbackTable
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x40
	bl MTi_CpuClear32
	mov r4, r6, lsr #1
	ldrh r3, [sp, #0x60]
	mov r6, #0xe
	add r1, sp, #0x14
	mov r0, #0
	mov r2, #0x1c
	strh r6, [sp]
	str r7, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r3, [sp, #0x10]
	bl MTi_CpuClear32
	ldr r0, [sp, #0x64]
	add r1, sp, #0x30
	mov r2, #0x10
	bl MTi_CpuCopy32
	add r0, sp, #0
	mov r1, #0x40
	bl WMi_SendCommandDirect
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end WMi_StartMP

	arm_func_start WM_StartMpEx
WM_StartMpEx: ; 0x022C038C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r7, r1
	mov r8, r0
	mov r6, r2
	add r1, sp, #8
	mov r0, #0
	mov r2, #0x10
	mov r5, r3
	ldr r4, [sp, #0x34]
	bl MTi_CpuClear32
	ldr r1, [sp, #0x48]
	ldrh ip, [sp, #0x38]
	ldr r0, [sp, #0x44]
	ldr lr, _022C042C ; =0x00001E03
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	strb r1, [sp, #0x16]
	cmp r0, #0
	cmpne r4, #0
	strb r3, [sp, #0x14]
	strb r2, [sp, #0x15]
	ldrh r1, [sp, #0x30]
	str lr, [sp, #8]
	orrne r0, lr, #4
	strne r0, [sp, #8]
	strh ip, [sp, #0x12]
	strh r4, [sp, #0xc]
	strh r4, [sp, #0xe]
	strneh r4, [sp, #0x10]
	str r1, [sp]
	add r4, sp, #8
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r4, [sp, #4]
	bl WMi_StartMP
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C042C: .word 0x00001E03
	arm_func_end WM_StartMpEx

	arm_func_start WM_StartMP
WM_StartMP: ; 0x022C0430
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r6, r1
	mov r7, r0
	mov r5, r2
	add r1, sp, #8
	mov r0, #0
	mov r2, #0x10
	mov r4, r3
	bl MTi_CpuClear32
	ldrh ip, [sp, #0x34]
	mov r0, #3
	str r0, [sp, #8]
	ldrh lr, [sp, #0x30]
	strh ip, [sp, #0xc]
	strh ip, [sp, #0xe]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	add ip, sp, #8
	str lr, [sp]
	str ip, [sp, #4]
	bl WMi_StartMP
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WM_StartMP

	arm_func_start WM_SetMpDataToPortEx
WM_SetMpDataToPortEx: ; 0x022C0498
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r4, #1
	bl WMi_GetSystemWork
	ldr r5, [r0, #4]
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, r5, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r5, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	bne _022C0518
	add r0, r5, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	add r2, r5, #0x100
	add r0, r5, #0x86
	mov r1, #2
	ldrh r4, [r2, #0x82]
	bl DC_InvalidateRange
_022C0518:
	cmp r7, #0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r4, #0
	addeq sp, sp, #0x14
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, r5, #0x7c
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r5, #0x7c]
	cmp r7, r0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0x200
	addhi sp, sp, #0x14
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	mov r1, r6
	bl DC_StoreRange
	ldrh r2, [sp, #0x30]
	ldrh r1, [sp, #0x34]
	ldrh r0, [sp, #0x38]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str sb, [sp, #0xc]
	mov r2, r7
	mov r3, r6
	mov r0, #0xf
	mov r1, #7
	str r8, [sp, #0x10]
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end WM_SetMpDataToPortEx

	arm_func_start WM_EndMP
WM_EndMP: ; 0x022C05C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WMi_GetSystemWork
	mov r4, r0
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x10
	bl WMi_SetCallbackTable
	mov r0, #0x10
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_EndMP

	arm_func_start WM_StartDcf
WM_StartDcf: ; 0x022C0638
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl WMi_GetSystemWork
	mov r4, r0
	mov r0, #1
	mov r1, #8
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #1
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0x10
	movlo r0, #6
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x11
	bl WMi_SetCallbackTable
	mov r2, r6
	mov r3, r5
	mov r0, #0x11
	mov r1, #2
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WM_StartDcf

	arm_func_start WM_SetDcfData
WM_SetDcfData: ; 0x022C06D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl WMi_GetSystemWork
	mov r8, r0
	mov r0, #1
	mov r1, #0xb
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r8, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r8, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #3
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _022C07A0 ; =0x000005E4
	cmp r4, r0
	addhi sp, sp, #0x10
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r5
	mov r1, r4
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x12
	bl WMi_SetCallbackTable
	add r1, sp, #8
	mov r0, r6
	mov r2, #6
	bl MI_CpuCopy8
	str r5, [sp]
	str r4, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r0, #0x12
	mov r1, #4
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C07A0: .word 0x000005E4
	arm_func_end WM_SetDcfData

	arm_func_start WM_EndDcf
WM_EndDcf: ; 0x022C07A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WMi_GetSystemWork
	mov r4, r0
	mov r0, #1
	mov r1, #0xb
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x13
	bl WMi_SetCallbackTable
	mov r0, #0x13
	mov r1, #0
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_EndDcf

	arm_func_start WM_StartDataSharing
WM_StartDataSharing: ; 0x022C0810
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov r7, r1
	mov r6, r2
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	mov r5, r3
	mov r8, #1
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0x10
	addhs sp, sp, #0xc
	movhs r0, #6
	ldmhsia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r6, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl WM_GetAid
	movs r4, r0
	bne _022C088C
	bl WM_GetConnectedAids
	mov r8, r0
_022C088C:
	mov r1, sl
	mov r0, #0
	mov r2, #0x820
	bl MTi_CpuClearFast
	add r0, sl, #0x800
	mov r2, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r5, [r0, #0x10]
	strh r7, [r0, #0x16]
	strh r2, [r0, #0xe]
	mov r0, #1
	ldr r1, [sp, #0x30]
	orr r0, r6, r0, lsl r4
	cmp r1, #0
	mov r0, r0, lsl #0x10
	movne r2, #1
	add r1, sl, #0x800
	strh r2, [r1, #0x18]
	mov r0, r0, lsr #0x10
	strh r0, [r1, #0xe]
	bl Math_CountPopulation
	add r3, sl, #0x800
	mul r1, r5, r0
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	ldrh r0, [r3, #0x14]
	cmp r0, #0x1fc
	bls _022C0918
	mov r0, #0
	strh r0, [r3, #0xe]
	add sp, sp, #0xc
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C0918:
	add r0, r0, #4
	strh r0, [r3, #0x14]
	mov r0, #1
	strh r0, [r3, #0x1c]
	cmp r4, #0
	bne _022C0A30
	orr r4, r8, #1
	mov r2, #0
_022C0938:
	ldrh r1, [r3, #0xe]
	mov r0, r2, lsl #9
	add r2, r2, #1
	and r1, r1, r4
	strh r1, [sl, r0]
	cmp r2, #4
	blt _022C0938
	ldr r1, _022C0A54 ; =WmDataSharingReceiveCallback_Parent
	mov r0, r7
	mov r2, sl
	bl WM_SetPortCallback
	mov r7, sl
	mov sb, #0
	add r4, sl, #0x800
	mov r6, #1
	ldr fp, _022C0A58 ; =WmDataSharingSetDataCallback
	ldr r5, _022C0A5C ; =0x0000FFFF
	b _022C0A14
_022C0980:
	ldrh r2, [r4, #8]
	mov r0, fp
	mov r1, sl
	add r2, r2, #1
	and r2, r2, #3
	strh r2, [r4, #8]
	ldrh r3, [r4, #0xe]
	mov r2, r7
	and r3, r3, r8
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	str r3, [sp]
	ldrh r3, [r4, #0x16]
	stmib sp, {r3, r6}
	ldrh r3, [r4, #0x14]
	bl WM_SetMpDataToPortEx
	cmp r0, #7
	bne _022C09E8
	add r0, sl, sb, lsl #1
	add r0, r0, #0x800
	strh r5, [r0]
	ldrh r0, [r4, #0xa]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r4, #0xa]
	b _022C0A0C
_022C09E8:
	cmp r0, #0
	cmpne r0, #2
	beq _022C0A0C
	add r0, sl, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C0A0C:
	add r7, r7, #0x200
	add sb, sb, #1
_022C0A14:
	ldrh r0, [r4, #0x18]
	cmp r0, #1
	movne r0, #1
	moveq r0, #2
	cmp sb, r0
	blt _022C0980
	b _022C0A48
_022C0A30:
	ldr r1, _022C0A60 ; =WmDataSharingReceiveCallback_Child
	mov r4, #3
	mov r0, r7
	mov r2, sl
	strh r4, [r3, #0xa]
	bl WM_SetPortCallback
_022C0A48:
	mov r0, #0
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C0A54: .word WmDataSharingReceiveCallback_Parent
_022C0A58: .word WmDataSharingSetDataCallback
_022C0A5C: .word 0x0000FFFF
_022C0A60: .word WmDataSharingReceiveCallback_Child
	arm_func_end WM_StartDataSharing

	arm_func_start WM_EndDataSharing__022C1278
WM_EndDataSharing__022C1278: ; 0x022C0A64
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x800
	ldrh r1, [r0, #0xe]
	cmp r1, #0
	moveq r0, #3
	ldmeqia sp!, {r4, pc}
	ldrh r0, [r0, #0x16]
	mov r1, #0
	mov r2, r1
	bl WM_SetPortCallback
	add r1, r4, #0x800
	mov r0, #0
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end WM_EndDataSharing__022C1278

	arm_func_start WM_StepDataSharing
WM_StepDataSharing: ; 0x022C0AAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl WM_GetAid
	movs r5, r0
	bne _022C0B20
	bl WM_GetConnectedAids
	mov r4, r0
_022C0B20:
	add r0, sl, #0x800
	ldrh r0, [r0, #0x1c]
	cmp r0, #5
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #1
	cmpne r0, #4
	addne sp, sp, #0xc
	movne r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r5, #0
	mov r7, #5
	bne _022C0CE4
	mov r5, #0
	mov fp, r5
	cmp r0, #4
	bne _022C0C08
	add ip, sl, #0x800
	mov r2, #1
	strh r2, [ip, #0x1c]
	ldrh r3, [ip, #0xe]
	ldrh r1, [ip, #8]
	ldr r0, _022C0DEC ; =WmDataSharingSetDataCallback
	and r3, r3, r4
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	str r3, [sp]
	ldrh r3, [ip, #0x16]
	add r1, r1, #3
	and r6, r1, #3
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrh r3, [ip, #0x14]
	mov r1, sl
	add r2, sl, r6, lsl #9
	bl WM_SetMpDataToPortEx
	cmp r0, #7
	bne _022C0BE4
	add r0, sl, r6, lsl #1
	ldr r1, _022C0DF0 ; =0x0000FFFF
	add r0, r0, #0x800
	strh r1, [r0]
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r0, #0xa]
	b _022C0C08
_022C0BE4:
	cmp r0, #0
	cmpne r0, #2
	beq _022C0C08
	add r0, sl, #0x800
	mov r1, r7
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C0C08:
	add r0, sl, #0x800
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #0xa]
	cmp r2, r1
	beq _022C0CA0
	mov r5, r2, lsl #9
	ldrh r3, [sl, r5]
	mov r1, r8
	mov r2, #0x200
	orr r3, r3, #1
	strh r3, [sl, r5]
	ldrh r0, [r0, #0xc]
	add r0, sl, r0, lsl #9
	bl MTi_CpuCopy16
	add r1, sl, #0x800
	ldrh r0, [r1, #0xc]
	mov r5, #1
	mov r7, #0
	add r0, sl, r0, lsl #1
	add r0, r0, #0x800
	ldrh r0, [r0]
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0xc]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x18]
	cmp r0, #0
	bne _022C0C9C
	cmp r4, #0
	beq _022C0C9C
	ldrh r0, [r1, #8]
	mov r0, r0, lsl #9
	ldrh r0, [sl, r0]
	cmp r0, #1
	moveq fp, r5
	beq _022C0CA0
_022C0C9C:
	mov fp, #0
_022C0CA0:
	mov r0, sl
	mov r1, #0
	bl WmDataSharingSendDataSet
	cmp r5, #0
	beq _022C0DE0
	mov r0, sl
	mov r2, sb
	mov r1, #0
	bl WmDataSharingReceiveData
	add r0, sl, #0x800
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _022C0DE0
	mov r0, sl
	mov r1, fp
	bl WmDataSharingSendDataSet
	b _022C0DE0
_022C0CE4:
	cmp r0, #4
	mov r0, #0
	add r1, sl, #0x800
	moveq r0, #1
	streqh r0, [r1, #0x1c]
	beq _022C0D64
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #8]
	cmp r2, r1
	beq _022C0D64
	mov r2, r2, lsl #9
	ldrh r1, [sl, r2]
	tst r1, #1
	orreq r1, r1, #1
	streqh r1, [sl, r2]
	beq _022C0D64
	mov r1, r8
	add r0, sl, r2
	mov r2, #0x200
	bl MTi_CpuCopy16
	add r2, sl, #0x800
	ldrh r1, [r2, #0xc]
	mov r0, #1
	mov r7, #0
	add r1, sl, r1, lsl #1
	add r1, r1, #0x800
	ldrh r1, [r1]
	strh r1, [r2, #0x1a]
	ldrh r1, [r2, #0xc]
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r2, #0xc]
_022C0D64:
	cmp r0, #0
	beq _022C0DE0
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	ldrh r2, [r0, #0x10]
	mov r0, sb
	add r6, sl, r1, lsl #9
	add r1, r6, #0x20
	bl MTi_CpuCopy16
	add r3, sl, #0x800
	ldrh r1, [r3, #0xe]
	mov r4, #1
	ldr r0, _022C0DEC ; =WmDataSharingSetDataCallback
	str r1, [sp]
	ldrh r5, [r3, #0x16]
	mov r1, sl
	add r2, r6, #0x20
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldrh r3, [r3, #0x10]
	bl WM_SetMpDataToPortEx
	add r1, sl, #0x800
	ldrh r2, [r1, #0xa]
	cmp r0, #2
	cmpne r0, #0
	add r2, r2, #1
	and r2, r2, #3
	strh r2, [r1, #0xa]
	movne r0, #5
	strneh r0, [r1, #0x1c]
	movne r7, r4
_022C0DE0:
	mov r0, r7
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C0DEC: .word WmDataSharingSetDataCallback
_022C0DF0: .word 0x0000FFFF
	arm_func_end WM_StepDataSharing

	arm_func_start WmDataSharingSetDataCallback
WmDataSharingSetDataCallback: ; 0x022C0DF4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WMi_GetSystemWork
	ldrh r2, [r5, #0xa]
	ldr r1, _022C0EC4 ; =WmDataSharingReceiveCallback_Parent
	add r0, r0, r2, lsl #2
	ldr r2, [r0, #0xcc]
	ldr r4, [r0, #0x10c]
	cmp r2, r1
	ldrne r0, _022C0EC8 ; =WmDataSharingReceiveCallback_Child
	cmpne r2, r0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	cmp r4, r0
	ldmneia sp!, {r3, r4, r5, pc}
	bl WM_GetAid
	ldrh r1, [r5, #2]
	cmp r1, #0
	bne _022C0E80
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r1, r4, #0x800
	ldrh r0, [r1, #0xa]
	ldrh r2, [r5, #0x1a]
	add r0, r4, r0, lsl #1
	mov r2, r2, asr #1
	add r0, r0, #0x800
	strh r2, [r0]
	ldrh r0, [r1, #0xa]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #0xa]
	ldmia sp!, {r3, r4, r5, pc}
_022C0E80:
	cmp r1, #0xa
	bne _022C0EB4
	cmp r0, #0
	beq _022C0EA4
	add r0, r4, #0x800
	ldrh r1, [r0, #0xa]
	add r1, r1, #3
	and r1, r1, #3
	strh r1, [r0, #0xa]
_022C0EA4:
	add r0, r4, #0x800
	mov r1, #4
	strh r1, [r0, #0x1c]
	ldmia sp!, {r3, r4, r5, pc}
_022C0EB4:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C0EC4: .word WmDataSharingReceiveCallback_Parent
_022C0EC8: .word WmDataSharingReceiveCallback_Child
	arm_func_end WmDataSharingSetDataCallback

	arm_func_start WmDataSharingReceiveCallback_Parent
WmDataSharingReceiveCallback_Parent: ; 0x022C0ECC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _022C0FE8
	ldrh r1, [r0, #4]
	cmp r1, #0x15
	bgt _022C0F18
	bge _022C0F38
	cmp r1, #9
	ldmgtia sp!, {r4, r5, r6, pc}
	cmp r1, #7
	ldmltia sp!, {r4, r5, r6, pc}
	beq _022C0F58
	cmp r1, #9
	beq _022C0F68
	ldmia sp!, {r4, r5, r6, pc}
_022C0F18:
	cmp r1, #0x1a
	ldmgtia sp!, {r4, r5, r6, pc}
	cmp r1, #0x19
	ldmltia sp!, {r4, r5, r6, pc}
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r1, #0x1a
	beq _022C0F68
	ldmia sp!, {r4, r5, r6, pc}
_022C0F38:
	ldrh r1, [r0, #0x12]
	ldr r2, [r0, #0xc]
	mov r0, r4
	bl WmDataSharingReceiveData
	mov r0, r4
	mov r1, #0
	bl WmDataSharingSendDataSet
	ldmia sp!, {r4, r5, r6, pc}
_022C0F58:
	mov r0, r4
	mov r1, #0
	bl WmDataSharingSendDataSet
	ldmia sp!, {r4, r5, r6, pc}
_022C0F68:
	ldrh r5, [r0, #0x12]
	mov r6, #1
	bl EnableIrqFlag
	add r1, r4, #0x800
	ldrh lr, [r1, #8]
	mvn ip, r6, lsl r5
	mov r3, lr, lsl #9
	ldrh r2, [r4, r3]
	and r2, r2, ip
	strh r2, [r4, r3]
	ldrh r1, [r1, #0x18]
	cmp r1, #1
	bne _022C0FB8
	add r1, lr, #1
	and r1, r1, #3
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #7
	ldrh r1, [r4, r2]
	and r1, r1, ip
	strh r1, [r4, r2]
_022C0FB8:
	bl SetIrqFlag
	mov r0, r4
	mov r1, #0
	bl WmDataSharingSendDataSet
	add r0, r4, #0x800
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r4
	mov r1, #0
	bl WmDataSharingSendDataSet
	ldmia sp!, {r4, r5, r6, pc}
_022C0FE8:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WmDataSharingReceiveCallback_Parent

	arm_func_start WmDataSharingReceiveCallback_Child
WmDataSharingReceiveCallback_Child: ; 0x022C0FF8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r4, [r8, #0x1c]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r8, #2]
	cmp r0, #0
	bne _022C10DC
	ldrh r0, [r8, #4]
	cmp r0, #0x15
	bgt _022C1040
	bge _022C1058
	cmp r0, #9
	ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #7
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	cmpne r0, #9
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C1040:
	cmp r0, #0x1a
	ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #0x19
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	cmpne r0, #0x1a
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C1058:
	ldr r7, [r8, #0xc]
	ldrh r5, [r8, #0x10]
	ldrh r6, [r7]
	bl WM_GetAid
	add r1, r4, #0x800
	ldrh r1, [r1, #0x14]
	cmp r5, r1
	beq _022C1080
	cmp r5, #0x200
	movhi r5, #0x200
_022C1080:
	cmp r5, #4
	ldmloia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, #1
	tst r6, r1, lsl r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r4, #0x800
	ldrh r1, [r0, #8]
	mov r0, r7
	mov r2, r5
	add r1, r4, r1, lsl #9
	bl MTi_CpuCopy16
	add r1, r4, #0x800
	ldrh r0, [r1, #8]
	ldrh r2, [r8, #0x1a]
	add r0, r4, r0, lsl #1
	mov r2, r2, asr #1
	add r0, r0, #0x800
	strh r2, [r0]
	ldrh r0, [r1, #8]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C10DC:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end WmDataSharingReceiveCallback_Child

	arm_func_start WmDataSharingReceiveData
WmDataSharingReceiveData: ; 0x022C10EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r3, r1
	mov r1, #1
	mov r4, r1, lsl r3
	add r0, r6, #0x800
	ldrh r1, [r0, #0xe]
	mov r7, r4, lsl #0x10
	mov r5, r2
	tst r1, r7, lsr #16
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r4, [r0, #8]
	mov r2, r4, lsl #9
	ldrh r2, [r6, r2]
	tst r2, r7, lsr #16
	bne _022C1150
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r4, #1
	and r4, r0, #3
	mov r0, r4, lsl #9
	ldrh r0, [r6, r0]
	tst r0, r7, lsr #16
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022C1150:
	add r2, r6, r4, lsl #9
	mov r0, r6
	add r2, r2, #4
	bl WmGetSharedDataAddress
	mov r1, r0
	add r0, r6, #0x800
	cmp r5, #0
	ldrh r2, [r0, #0x10]
	beq _022C1180
	mov r0, r5
	bl MTi_CpuCopy16
	b _022C1188
_022C1180:
	mov r0, #0
	bl MTi_CpuClear16
_022C1188:
	bl EnableIrqFlag
	mov r4, r4, lsl #9
	ldrh r3, [r6, r4]
	mvn r1, r7, lsr #16
	add r2, r6, #2
	and r1, r3, r1
	strh r1, [r6, r4]
	ldrh r1, [r2, r4]
	orr r1, r1, r7, lsr #16
	strh r1, [r2, r4]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WmDataSharingReceiveData

	arm_func_start WmDataSharingSendDataSet
WmDataSharingSendDataSet: ; 0x022C11B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	bl EnableIrqFlag
	add r1, sl, #0x800
	ldrh r1, [r1, #8]
	mov r4, r0
	mov r1, r1, lsl #9
	ldrh r1, [sl, r1]
	cmp r1, #0
	bne _022C12F8
	bl WM_GetConnectedAids
	add r1, sl, #0x800
	ldrh r6, [r1, #8]
	ldrh r1, [r1, #0x18]
	mov r7, r0
	add r0, r6, #1
	and r5, r0, #3
	cmp r1, #1
	addeq r0, r5, #1
	andeq r8, r0, #3
	movne r8, r5
	add r1, sl, r8, lsl #9
	mov r0, #0
	mov r2, #0x200
	bl MTi_CpuClear16
	add r0, sl, #0x800
	ldrh r3, [r0, #0xe]
	orr r2, r7, #1
	mov r1, r8, lsl #9
	and r2, r3, r2
	strh r2, [sl, r1]
	strh r5, [r0, #8]
	ldrh r0, [r0, #0xe]
	mov r1, r6, lsl #9
	cmp sb, #1
	strh r0, [sl, r1]
	ldreqh r0, [sl, r1]
	biceq r0, r0, #1
	streqh r0, [sl, r1]
	mov r0, r4
	bl SetIrqFlag
	add r3, sl, #0x800
	ldrh r1, [r3, #0xe]
	mov r4, #1
	ldr r0, _022C1304 ; =WmDataSharingSetDataCallback
	and r1, r1, r7
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldrh r5, [r3, #0x16]
	mov r1, sl
	add r2, sl, r6, lsl #9
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldrh r3, [r3, #0x14]
	bl WM_SetMpDataToPortEx
	cmp r0, #7
	bne _022C12D4
	add r0, sl, r6, lsl #1
	ldr r1, _022C1308 ; =0x0000FFFF
	add r0, r0, #0x800
	strh r1, [r0]
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	add sp, sp, #0xc
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r0, #0xa]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_022C12D4:
	cmp r0, #0
	cmpne r0, #2
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r0, sl, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_022C12F8:
	bl SetIrqFlag
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022C1304: .word WmDataSharingSetDataCallback
_022C1308: .word 0x0000FFFF
	arm_func_end WmDataSharingSendDataSet

	arm_func_start WM_GetSharedDataAddress
WM_GetSharedDataAddress: ; 0x022C130C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	cmp r0, #0
	ldrh r1, [lr]
	ldrh ip, [lr, #2]
	mov r2, #1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst r1, r2, lsl r3
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst ip, r2, lsl r3
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, lr, #4
	bl WmGetSharedDataAddress
	ldmia sp!, {r3, pc}
	arm_func_end WM_GetSharedDataAddress

	arm_func_start WmGetSharedDataAddress
WmGetSharedDataAddress: ; 0x022C1360
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #1
	mov r3, ip, lsl r3
	sub r3, r3, #1
	mov r5, r0
	and r0, r1, r3
	mov r4, r2
	bl Math_CountPopulation
	add r1, r5, #0x800
	ldrh r1, [r1, #0x10]
	mla r0, r1, r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WmGetSharedDataAddress

	arm_func_start WM_StartKeySharing
WM_StartKeySharing: ; 0x022C1390
	stmdb sp!, {r3, lr}
	mov ip, #1
	rsb r2, ip, #0x10000
	mov r3, #2
	str ip, [sp]
	bl WM_StartDataSharing
	ldmia sp!, {r3, pc}
	arm_func_end WM_StartKeySharing

	arm_func_start WM_EndDataSharing__022C1BC0
WM_EndDataSharing__022C1BC0: ; 0x022C13AC
	ldr ip, _022C13B4 ; =WM_EndDataSharing__022C1278
	bx ip
	.align 2, 0
_022C13B4: .word WM_EndDataSharing__022C1278
	arm_func_end WM_EndDataSharing__022C1BC0

	arm_func_start WM_SetWepKey
WM_SetWepKey: ; 0x022C13B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl WMi_CheckIdle
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r5, #3
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	beq _022C1400
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r4
	mov r1, #0x50
	bl DC_StoreRange
_022C1400:
	mov r1, r6
	mov r0, #0x14
	bl WMi_SetCallbackTable
	mov r2, r5
	mov r3, r4
	mov r0, #0x14
	mov r1, #2
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WM_SetWepKey

	arm_func_start WM_SetWepKeyEx
WM_SetWepKeyEx: ; 0x022C142C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl WMi_CheckIdle
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #3
	movhi r0, #6
	ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	beq _022C1478
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	mov r1, #0x50
	bl DC_StoreRange
_022C1478:
	mov r1, r7
	mov r0, #0x27
	bl WMi_SetCallbackTable
	mov r2, r6
	mov r3, r4
	mov r0, #0x27
	mov r1, #3
	str r5, [sp]
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WM_SetWepKeyEx

	arm_func_start WM_SetGameInfo
WM_SetGameInfo: ; 0x022C14A8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r0, #2
	mov r1, #7
	mov r2, #9
	mov r4, r3
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, pc}
	cmp r6, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	cmp r5, #0x70
	addhi sp, sp, #0xc
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, pc}
	ldr r1, _022C155C ; =ov00_0231EDE0
	mov r0, r6
	mov r2, r5
	bl MTi_CpuCopy16
	ldr r0, _022C155C ; =ov00_0231EDE0
	mov r1, r5
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x18
	bl WMi_SetCallbackTable
	ldrh r0, [sp, #0x20]
	str r4, [sp]
	ldrb r1, [sp, #0x24]
	str r0, [sp, #4]
	ldr r2, _022C155C ; =ov00_0231EDE0
	str r1, [sp, #8]
	mov r3, r5
	mov r0, #0x18
	mov r1, #5
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022C155C: .word ov00_0231EDE0
	arm_func_end WM_SetGameInfo

	arm_func_start WM_SetBeaconIndication
WM_SetBeaconIndication: ; 0x022C1560
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl WMi_CheckIdle
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	cmpne r4, #1
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x19
	bl WMi_SetCallbackTable
	mov r2, r4
	mov r0, #0x19
	mov r1, #1
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_SetBeaconIndication

	arm_func_start WM_SetLifeTime
WM_SetLifeTime: ; 0x022C15B0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl WMi_CheckIdle
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r7
	mov r0, #0x1d
	bl WMi_SetCallbackTable
	ldrh ip, [sp, #0x20]
	mov r2, r6
	mov r3, r5
	mov r0, #0x1d
	mov r1, #4
	stmia sp, {r4, ip}
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WM_SetLifeTime

	arm_func_start WM_MeasureChannel
WM_MeasureChannel: ; 0x022C1610
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl WMi_GetSystemWork
	mov r0, #1
	mov r1, #2
	bl WMi_CheckState
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, pc}
	mov r1, r7
	mov r0, #0x1e
	bl WMi_SetCallbackTable
	ldrh r2, [sp, #0x20]
	mov r3, #0x1e
	add r0, sp, #0
	mov r1, #0xa
	strh r3, [sp]
	strh r6, [sp, #2]
	strh r5, [sp, #4]
	strh r4, [sp, #6]
	strh r2, [sp, #8]
	bl WMi_SendCommandDirect
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end WM_MeasureChannel

	arm_func_start WM_SetEntry
WM_SetEntry: ; 0x022C1688
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	mov r1, #7
	mov r2, #9
	bl WMi_CheckState
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x21
	bl WMi_SetCallbackTable
	mov r2, r4
	mov r0, #0x21
	mov r1, #1
	bl WMi_SendCommand
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WM_SetEntry

	arm_func_start Wbti_InitBitmap
Wbti_InitBitmap: ; 0x022C16D4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r1, [sp, #0x1c]
	mov r5, r2
	ldr ip, [sp, #0x18]
	add r2, r5, r1
	mov r7, r0
	stmia r6, {r5, ip}
	sub r0, r2, #1
	mov r4, r3
	bl _s32_div_f
	str r0, [r6, #0xc]
	mov r0, #0
	str r0, [r6, #8]
	mov r0, r7
	mov r1, r5
	str r4, [r6, #0x10]
	bl Wbt_GetBitmapLength
	mov r2, r0
	mov r0, r4
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Wbti_InitBitmap

	arm_func_start Wbti_MergeBitmapIndex
Wbti_MergeBitmapIndex: ; 0x022C1730
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1, asr #5
	ldr r0, [r0, r6, lsl #2]
	and r4, r1, #0x1f
	mov r5, #1
	tst r0, r5, lsl r4
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mul ip, r1, r2
	ldmia r7, {r0, r1}
	sub r0, r0, ip
	cmp r2, r0
	movhi r2, r0
	mov r0, r3
	add r1, r1, ip
	bl MI_CpuCopy8
	ldr r2, [r7, #0x10]
	mov r0, #1
	ldr r1, [r2, r6, lsl #2]
	orr r1, r1, r5, lsl r4
	str r1, [r2, r6, lsl #2]
	ldr r1, [r7, #8]
	add r1, r1, #1
	str r1, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Wbti_MergeBitmapIndex

	arm_func_start Wbti_FindBitmapIndex
Wbti_FindBitmapIndex: ; 0x022C179C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x14]
	ldr r6, [r0, #0xc]
	add r5, r1, #1
	cmp r5, r6
	movge r5, #0
	ldr r7, [r0, #0x10]
	mov r0, r5, asr #5
	add r4, r7, r0, lsl #2
	mov r0, #0
	mov ip, r5
	and lr, r5, #0x1f
	mov r1, r0
	mov r2, #1
_022C17D4:
	ldr r3, [r4]
	tst r3, r2, lsl lr
	beq _022C1818
	add r5, r5, #1
	cmp r5, r6
	blt _022C17FC
	mov r5, r1
	mov lr, r1
	mov r4, r7
	b _022C180C
_022C17FC:
	add lr, lr, #1
	cmp lr, #0x20
	movge lr, r0
	addge r4, r4, #4
_022C180C:
	cmp r5, ip
	bne _022C17D4
	mvn r5, #0
_022C1818:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Wbti_FindBitmapIndex

	arm_func_start Wbti_GetPacketBuffer
Wbti_GetPacketBuffer: ; 0x022C1820
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0x2f4]
	mov lr, #0
	mov r5, r2
	mov r2, lr
	cmp r4, #0
	beq _022C18A0
_022C1840:
	cmp r1, #0x3e8
	bhs _022C1880
	cmp r1, r2
	bne _022C1890
	ldr ip, _022C18B8 ; =ov00_0231EE60
	ldmia r4!, {r0, r1, r2, r3}
	mov lr, ip
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia ip, {r0, r1}
	ldr r0, _022C18BC ; =ov00_0231EE60
	ldr r1, [r0, #4]
	str r1, [r0, #4]
	b _022C18A0
_022C1880:
	ldr r0, [r4]
	cmp r1, r0
	ldreq lr, [r4, #0x2c]
	beq _022C18A0
_022C1890:
	ldr r4, [r4, #0x28]
	add r2, r2, #1
	cmp r4, #0
	bne _022C1840
_022C18A0:
	cmp lr, #0
	addne r0, r6, #0x200
	ldrnesh r0, [r0, #0xf2]
	mlane lr, r5, r0, lr
	mov r0, lr
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C18B8: .word ov00_0231EE60
_022C18BC: .word ov00_0231EE60
	arm_func_end Wbti_GetPacketBuffer

	arm_func_start Wbti_SwitchNextCommand
Wbti_SwitchNextCommand: ; 0x022C18C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r0, [r8]
	cmp r0, #0
	addne r7, r0, #4
	moveq r7, #0
	cmp r7, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r0, [r8, #0x2f8]
	add r0, r0, #1
	strb r0, [r8, #0x2f8]
	tst r0, #0xff
	ldreqb r0, [r8, #0x2f8]
	addeq r0, r0, #1
	streqb r0, [r8, #0x2f8]
	ldrb r0, [r8, #0x2f8]
	strb r0, [r7, #0xc]
	ldr r0, [r7]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _022C19AC
_022C191C: ; jump table
	b _022C19AC ; case 0
	b _022C19AC ; case 1
	b _022C19B4 ; case 2
	b _022C19AC ; case 3
	b _022C1948 ; case 4
	b _022C19AC ; case 5
	b _022C1948 ; case 6
	b _022C19AC ; case 7
	b _022C19AC ; case 8
	b _022C19AC ; case 9
	b _022C19B4 ; case 10
_022C1948:
	mov r5, #0
	add r6, r8, #0xb8
	add sb, r8, #0x200
	mov sl, r5
	mov r4, #1
_022C195C:
	ldrh r0, [r7, #8]
	tst r0, r4, lsl r5
	beq _022C1994
	add r3, r7, r5, lsl #2
	ldr r1, [r3, #0x1c]
	mov r0, r8
	str r1, [sp]
	ldrsh r2, [sb, #0xf0]
	mov r1, r6
	str r2, [sp, #4]
	ldr r2, [r7, #0x18]
	ldr r3, [r3, #0x5c]
	bl Wbti_InitBitmap
	str sl, [r6, #0x14]
_022C1994:
	add r5, r5, #1
	cmp r5, #0x10
	add r6, r6, #0x24
	blt _022C195C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022C19AC:
	mov r0, #0
	str r0, [r7]
_022C19B4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end Wbti_SwitchNextCommand

	arm_func_start Wbti_NotifySystemCallback
Wbti_NotifySystemCallback: ; 0x022C19BC
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r0
	add lr, ip, #0xac
	mov r0, #0x24
	mla r5, r2, r0, lr
	cmp r1, #0xd
	mov r4, #1
	beq _022C19F0
	ldrb lr, [r5, #1]
	ldrb r0, [r5, #2]
	cmp lr, r0
	moveq r4, #0
	beq _022C1A04
_022C19F0:
	cmp r1, #8
	bne _022C1A04
	ldr r0, [r5, #4]
	cmp r0, #0x3e8
	movlo r4, #0
_022C1A04:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb lr, [r5, #1]
	mov r0, #1
	mov r0, r0, lsl r2
	strb lr, [r5, #2]
	ldrb lr, [r5, #1]
	mov r2, #0xc
	strb lr, [ip, #0x1d]
	strh r3, [ip, #0x1e]
	str r1, [ip, #0x14]
	str r2, [ip, #0x10]
	strh r0, [ip, #0x1a]
	ldr r2, [ip, #0xc]
	cmp r2, #0
	beq _022C1A54
	ldr r0, [ip, #8]
	add r1, ip, #0x10
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
_022C1A54:
	ldr r1, [ip, #0x20]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, ip, #0x10
	blx r1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wbti_NotifySystemCallback

	arm_func_start Wbti_TryCreateResponse
Wbti_TryCreateResponse: ; 0x022C1A6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	mov fp, r1
	add r4, sl, #0xac
	mov r3, #0x24
	mov r1, #0
	ldr r5, [sp, #0x38]
	mla r4, fp, r3, r4
	str r1, [sp, #0xc]
	mov sb, r2
	str r1, [sp, #8]
	cmp r5, #2
	bne _022C1B20
	mov r1, #1
	mov r1, r1, lsl fp
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldrb r4, [r4, #1]
	mov r3, #3
	mov r1, r2, asr #8
	strb r3, [sb]
	strb r2, [sb, #1]
	strb r1, [sb, #2]
	strb r4, [sb, #3]
	bl Wbt_GetRegisteredCount
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	strb r0, [sb, #4]
	mov r0, r0, asr #8
	strb r0, [sb, #5]
	add r1, sl, #0x200
	ldrh r2, [r1, #0xf2]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #8]
	strb r2, [sb, #6]
	mov r0, r2, asr #8
	strb r0, [sb, #7]
	ldrh r0, [r1, #0xf0]
	strb r0, [sb, #8]
	mov r0, r0, asr #8
	strb r0, [sb, #9]
	b _022C1EA0
_022C1B20:
	cmp r5, #8
	bne _022C1B84
	mov r0, #1
	str r0, [sp, #8]
	mov r0, r0, lsl fp
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldrb r3, [r4, #1]
	ldr r5, [r4, #4]
	mov r2, #9
	strb r2, [sb]
	mov r0, r1, asr #8
	strb r1, [sb, #1]
	strb r0, [sb, #2]
	strb r3, [sb, #3]
	strb r5, [sb, #4]
	mov r0, r5, lsr #8
	strb r0, [sb, #5]
	mov r0, r5, lsr #0x10
	strb r0, [sb, #6]
	mov r0, r5, lsr #0x18
	strb r0, [sb, #7]
	mov r0, #8
	str r0, [sp, #0xc]
	b _022C1EA0
_022C1B84:
	cmp r5, #0xa
	bne _022C1BC8
	mov r0, #1
	str r0, [sp, #8]
	mov r0, r0, lsl fp
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldrb r3, [r4, #1]
	mov r2, #0xb
	mov r0, r1, asr #8
	strb r2, [sb]
	strb r1, [sb, #1]
	strb r0, [sb, #2]
	mov r0, #4
	strb r3, [sb, #3]
	str r0, [sp, #0xc]
	b _022C1EA0
_022C1BC8:
	cmp r5, #4
	bne _022C1DC8
	ldr r6, [sl, #0x2f4]
	ldr r5, [r4, #4]
	cmp r6, #0
	beq _022C1BF4
_022C1BE0:
	ldr r0, [r6]
	cmp r0, r5
	ldrne r6, [r6, #0x28]
	cmpne r6, #0
	bne _022C1BE0
_022C1BF4:
	cmp r6, #0
	beq _022C1EA0
	cmp r5, #0x3e8
	ldr r7, [r4, #8]
	blo _022C1C74
	ldr r0, [sl, #0x300]
	cmp r5, r0
	bne _022C1C64
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xf2]
	ldr r0, [r6, #4]
	mov r8, #0
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	mov r2, r8
	b _022C1C48
_022C1C38:
	add r7, r7, #1
	cmp r7, r0
	movge r7, r2
	add r8, r8, #1
_022C1C48:
	cmp r8, #3
	bge _022C1C64
	ldr r1, [sl, #0x304]
	cmp r7, r1
	ldrne r1, [sl, #0x308]
	cmpne r7, r1
	beq _022C1C38
_022C1C64:
	str r5, [sl, #0x300]
	ldr r0, [sl, #0x304]
	str r0, [sl, #0x308]
	str r7, [sl, #0x304]
_022C1C74:
	ldr r2, [r6, #0x2c]
	mov r0, #0
	add r1, sl, #0x200
	str r0, [sp, #4]
	str r0, [sp]
	cmp r2, #0
	ldrsh r8, [r1, #0xf2]
	beq _022C1CB4
	mov r0, sl
	mov r1, r5
	mov r2, r7
	bl Wbti_GetPacketBuffer
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp]
	b _022C1D0C
_022C1CB4:
	ldrh r0, [r6, #0x32]
	cmp r0, #1
	bne _022C1D0C
	str r5, [sl, #0x24]
	ldr r3, [sp, #4]
	str r7, [sl, #0x28]
	strh r8, [sl, #0x30]
	mov r1, r3
	str r1, [sl, #0x2c]
	mov r0, sl
	mov r2, fp
	mov r1, #0xd
	bl Wbti_NotifySystemCallback
	ldr r0, [sl, #0x2c]
	cmp r0, #0
	beq _022C1D0C
	ldrsh r8, [sl, #0x30]
	str r0, [sp, #4]
	mov r0, #1
	ldr r5, [sl, #0x24]
	ldr r7, [sl, #0x28]
	str r0, [sp]
_022C1D0C:
	ldr r0, [sp]
	cmp r0, #0
	beq _022C1EA0
	ldr r0, [sl, #0x2ec]
	ldrb r3, [r4, #1]
	cmp r0, #0
	ldreq r0, _022C1ECC ; =0x0000FFFE
	mov r2, #5
	movne r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	strb r2, [sb]
	mov r0, r1, asr #8
	strb r1, [sb, #1]
	strb r0, [sb, #2]
	strb r3, [sb, #3]
	strb r5, [sb, #4]
	mov r0, r5, lsr #8
	strb r0, [sb, #5]
	mov r0, r5, lsr #0x10
	strb r0, [sb, #6]
	mov r0, r5, lsr #0x18
	strb r0, [sb, #7]
	strb r7, [sb, #8]
	mov r0, r7, lsr #8
	strb r0, [sb, #9]
	mov r0, r7, lsr #0x10
	strb r0, [sb, #0xa]
	mov r0, r7, lsr #0x18
	strb r0, [sb, #0xb]
	ldr r0, [sp, #4]
	mov r2, r8
	cmp r0, #0
	bne _022C1DAC
	add r0, sb, #0xc
	mov r1, #0
	bl MI_CpuFill8
	b _022C1DB4
_022C1DAC:
	add r1, sb, #0xc
	bl MI_CpuCopy8
_022C1DB4:
	add r0, r8, #0xc
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #8]
	b _022C1EA0
_022C1DC8:
	cmp r5, #6
	bne _022C1EA0
	ldmib r4, {r5, r6}
	add r3, sl, #0x200
	mov r1, r5
	mov r2, r6
	ldrsh r7, [r3, #0xf2]
	bl Wbti_GetPacketBuffer
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	cmpeq r0, #0
	beq _022C1EA0
	ldr r1, [sl, #0x2ec]
	ldrb r4, [r4, #1]
	cmp r1, #0
	ldreq r1, _022C1ED0 ; =0x0000FFFF
	mov r3, #7
	movne r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	strb r3, [sb]
	mov r1, r2, asr #8
	strb r2, [sb, #1]
	strb r1, [sb, #2]
	strb r4, [sb, #3]
	strb r5, [sb, #4]
	mov r1, r5, lsr #8
	strb r1, [sb, #5]
	mov r1, r5, lsr #0x10
	strb r1, [sb, #6]
	mov r1, r5, lsr #0x18
	strb r1, [sb, #7]
	strb r6, [sb, #8]
	mov r1, r6, lsr #8
	strb r1, [sb, #9]
	mov r1, r6, lsr #0x10
	strb r1, [sb, #0xa]
	mov r1, r6, lsr #0x18
	strb r1, [sb, #0xb]
	cmp r0, #0
	mov r2, r7
	bne _022C1E88
	add r0, sb, #0xc
	mov r1, #0
	bl MI_CpuFill8
	b _022C1E90
_022C1E88:
	add r1, sb, #0xc
	bl MI_CpuCopy8
_022C1E90:
	add r0, r7, #0xc
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #8]
_022C1EA0:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022C1EC0
	mov r0, #1
	mvn r0, r0, lsl fp
	ldr r1, [sl, #0x30c]
	and r0, r1, r0
	str r0, [sl, #0x30c]
_022C1EC0:
	ldr r0, [sp, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C1ECC: .word 0x0000FFFE
_022C1ED0: .word 0x0000FFFF
	arm_func_end Wbti_TryCreateResponse

	arm_func_start Wbti_CheckRequest
Wbti_CheckRequest: ; 0x022C1ED4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, [r0]
	mov r5, r1
	cmp r2, #0
	mov r1, #0
	addne r4, r2, #4
	moveq r4, r1
	cmp r4, #0
	beq _022C20B4
	ldr r2, [r4]
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _022C20B4
_022C1F08: ; jump table
	b _022C20B4 ; case 0
	b _022C20B4 ; case 1
	b _022C1F34 ; case 2
	b _022C20B4 ; case 3
	b _022C1F80 ; case 4
	b _022C20B4 ; case 5
	b _022C1F80 ; case 6
	b _022C20B4 ; case 7
	b _022C20B4 ; case 8
	b _022C20B4 ; case 9
	b _022C2078 ; case 10
_022C1F34:
	ldrh r3, [r4, #8]
	ldrb r4, [r4, #0xc]
	mov r2, #2
	mov r1, r3, asr #8
	strb r2, [r5]
	strb r3, [r5, #1]
	strb r1, [r5, #2]
	strb r4, [r5, #3]
	add r0, r0, #0x200
	ldrh r2, [r0, #0xf2]
	mov r1, #8
	strb r2, [r5, #4]
	mov r2, r2, asr #8
	strb r2, [r5, #5]
	ldrh r0, [r0, #0xf0]
	strb r0, [r5, #6]
	mov r0, r0, asr #8
	strb r0, [r5, #7]
	b _022C20B4
_022C1F80:
	add sb, r0, #0xb8
	mov r8, #0
	mov r7, #8
	mov fp, #1
	mvn r6, #0
_022C1F94:
	ldrh r0, [r4, #8]
	mov sl, fp, lsl r8
	tst r0, fp, lsl r8
	beq _022C2064
	mov r0, sb
	bl Wbti_FindBitmapIndex
	cmp r0, r6
	bne _022C1FFC
	ldrb r1, [r4, #0xc]
	mov r0, sl, lsl #0x10
	mov r0, r0, lsr #0x10
	strb r7, [r5]
	strb r0, [r5, #1]
	mov r0, r0, asr #8
	strb r0, [r5, #2]
	strb r1, [r5, #3]
	ldr r2, [r4, #0x14]
	mov r1, r7
	strb r2, [r5, #4]
	mov r0, r2, lsr #8
	strb r0, [r5, #5]
	mov r0, r2, lsr #0x10
	strb r0, [r5, #6]
	mov r0, r2, lsr #0x18
	strb r0, [r5, #7]
	b _022C205C
_022C1FFC:
	ldrh r3, [r4, #8]
	ldrb sl, [r4, #0xc]
	ldr r2, [r4]
	mov r1, r3, asr #8
	strb r2, [r5]
	strb r3, [r5, #1]
	strb r1, [r5, #2]
	strb sl, [r5, #3]
	ldr r3, [r4, #0x14]
	mov r1, r0, lsr #8
	strb r3, [r5, #4]
	mov r2, r3, lsr #8
	strb r2, [r5, #5]
	mov r2, r3, lsr #0x10
	strb r2, [r5, #6]
	mov r2, r3, lsr #0x18
	strb r2, [r5, #7]
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	mov r1, r0, lsr #0x10
	strb r1, [r5, #0xa]
	mov r0, r0, lsr #0x18
	mov r1, #0xc
	strb r0, [r5, #0xb]
_022C205C:
	cmp r1, #0
	bne _022C20B4
_022C2064:
	add r8, r8, #1
	cmp r8, #0x10
	add sb, sb, #0x24
	blt _022C1F94
	b _022C20B4
_022C2078:
	ldrh r2, [r4, #8]
	ldrb r3, [r4, #0xc]
	mov r1, #0xa
	mov r0, r2, asr #8
	strb r1, [r5]
	strb r2, [r5, #1]
	strb r0, [r5, #2]
	strb r3, [r5, #3]
	ldrb r3, [r4, #0x1d]
	add r0, r4, #0x14
	add r1, r5, #5
	mov r2, #9
	strb r3, [r5, #4]
	bl MI_CpuCopy8
	mov r1, #0xe
_022C20B4:
	mov r0, r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Wbti_CheckRequest

	arm_func_start Wbti_CheckBlockResponse
Wbti_CheckBlockResponse: ; 0x022C20BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	ldr r6, [sl, #0x30c]
	movs r0, #0
	bne _022C2188
	cmp r6, #0
	beq _022C2188
	ldr r1, [sl, #0x2fc]
	mov r2, #1
	mov r3, r6
	tst r6, r2, lsl r1
	clzeq r3, r3
	rsbeq r1, r3, #0x1f
	streq r1, [sl, #0x2fc]
	ldr r7, [sl, #0x2fc]
	mvn r2, r6
	sub r1, r6, #1
	add r4, sl, #0xac
	and r5, r2, r1
	mov fp, #1
_022C2118:
	add r7, r7, #1
	cmp r6, fp, lsl r7
	movlt r1, r5
	clzlt r1, r1
	rsblt r7, r1, #0x20
	ldr r2, [sl, #0x30c]
	mov r1, #1
	tst r2, r1, lsl r7
	beq _022C217C
	mov r1, #0x24
	mul r1, r7, r1
	ldrb r1, [r4, r1]
	cmp r1, #4
	bne _022C2174
	mov r0, #4
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r0, sl
	mov r1, r7
	mov r2, sb
	mov r3, r8
	bl Wbti_TryCreateResponse
_022C2174:
	cmp r0, #0
	strne r7, [sl, #0x2fc]
_022C217C:
	ldr r1, [sl, #0x2fc]
	cmp r7, r1
	bne _022C2118
_022C2188:
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r6, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [sl, #0x30c]
	ldr r1, [sl, #0x2fc]
	mov r2, #1
	tst r3, r2, lsl r1
	clzeq r3, r3
	rsbeq r1, r3, #0x1f
	streq r1, [sl, #0x2fc]
	ldr r7, [sl, #0x2fc]
	mvn r2, r6
	sub r1, r6, #1
	add r4, sl, #0xac
	and r5, r2, r1
	mov fp, #1
_022C21D4:
	add r7, r7, #1
	mov r1, #1
	cmp r6, r1, lsl r7
	movlt r1, r5
	clzlt r1, r1
	rsblt r7, r1, #0x20
	ldr r1, [sl, #0x30c]
	tst r1, fp, lsl r7
	beq _022C2234
	mov r1, #0x24
	mul r1, r7, r1
	ldrb r1, [r4, r1]
	cmp r1, #6
	bne _022C222C
	mov r0, #6
	str r0, [sp]
	mov r0, sl
	mov r1, r7
	mov r2, sb
	mov r3, r8
	str fp, [sp, #4]
	bl Wbti_TryCreateResponse
_022C222C:
	cmp r0, #0
	strne r7, [sl, #0x2fc]
_022C2234:
	ldr r1, [sl, #0x2fc]
	cmp r7, r1
	bne _022C21D4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Wbti_CheckBlockResponse

	arm_func_start Wbt_CallPacketSendHook
Wbt_CallPacketSendHook: ; 0x022C2248
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	mov r0, #0
	ldr r5, [sl, #0x2fc]
	sub r4, r0, #1
	mov sb, r1
	mov r8, r2
	str r3, [sp, #8]
	cmp r5, r4
	bne _022C2284
	movs r1, r3
	movne r1, #1
	moveq r1, r0
	str r1, [sl, #0x2fc]
_022C2284:
	cmp sb, #0
	beq _022C2294
	cmp r8, #0
	bgt _022C22A0
_022C2294:
	add sp, sp, #0x14
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C22A0:
	ldr r1, [sl, #0x30c]
	str r1, [sp, #0xc]
	cmp r1, #0
	beq _022C2384
	ldr r2, [sl, #0x2fc]
	mov r3, #1
	mov r4, r1
	tst r1, r3, lsl r2
	clzeq r4, r4
	rsbeq r1, r4, #0x1f
	streq r1, [sl, #0x2fc]
	ldr r1, [sp, #0xc]
	ldr r7, [sl, #0x2fc]
	mvn r2, r1
	sub r1, r1, #1
	and r1, r2, r1
	ldr fp, _022C243C ; =ov00_0231804C
	add r5, sl, #0xac
	str r1, [sp, #0x10]
_022C22EC:
	ldr r2, [sp, #0xc]
	add r7, r7, #1
	mov r1, #1
	cmp r2, r1, lsl r7
	ldrlt r1, [sp, #0x10]
	clzlt r1, r1
	rsblt r7, r1, #0x20
	ldr r2, [sp, #0xc]
	mov r1, #1
	tst r2, r1, lsl r7
	beq _022C2378
	mov r1, #0x24
	mul r4, r7, r1
	mov r6, #0
	b _022C235C
_022C2328:
	ldrb r2, [r5, r4]
	ldr r1, [fp, r6, lsl #2]
	cmp r2, r1
	bne _022C2358
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, sl
	mov r1, r7
	mov r2, sb
	mov r3, r8
	bl Wbti_TryCreateResponse
_022C2358:
	add r6, r6, #1
_022C235C:
	cmp r0, #0
	bne _022C2370
	ldr r1, [fp, r6, lsl #2]
	cmp r1, #0
	bne _022C2328
_022C2370:
	cmp r0, #0
	strne r7, [sl, #0x2fc]
_022C2378:
	ldr r1, [sl, #0x2fc]
	cmp r7, r1
	bne _022C22EC
_022C2384:
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #8]
	mov r1, sb
	cmp r0, #0
	mov r0, sl
	beq _022C23C8
	mov r2, r8
	bl Wbti_CheckRequest
	cmp r0, #0
	bne _022C23E8
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl Wbti_CheckBlockResponse
	b _022C23E8
_022C23C8:
	mov r2, r8
	bl Wbti_CheckBlockResponse
	cmp r0, #0
	bne _022C23E8
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl Wbti_CheckRequest
_022C23E8:
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #8]
	mov r1, #1
	cmp r0, #0
	ldrne r0, _022C2440 ; =0x0000FFFE
	strb r1, [sb]
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	strb r0, [sb, #1]
	mov r0, r0, asr #8
	strb r0, [sb, #2]
	mov r0, #0
	strb r0, [sb, #3]
	mov r0, #4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C243C: .word ov00_0231804C
_022C2440: .word 0x0000FFFE
	arm_func_end Wbt_CallPacketSendHook

	arm_func_start Wbti_NotifyCompletionCallback
Wbti_NotifyCompletionCallback: ; 0x022C2444
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r3, #0x24
	mla r3, r2, r3, r5
	ldr r0, [r5]
	ldrb r6, [r3, #0xad]
	cmp r0, #0
	addne r4, r0, #4
	moveq r4, #0
	ldrb r3, [r4, #0xc]
	cmp r3, r6
	ldmneia sp!, {r4, r5, r6, pc}
	mov ip, #1
	mov lr, ip, lsl r2
	strb r6, [r4, #0xd]
	strh lr, [r4, #0xa]
	ldrh r3, [r4, #8]
	tst r3, ip, lsl r2
	beq _022C24D8
	mvn r2, lr
	and r2, r3, r2
	strh r2, [r4, #8]
	str r1, [r4, #4]
	mov r1, #0
	strh r1, [r4, #0xe]
	ldr r2, [r0, #0xa0]
	cmp r2, #0
	beq _022C24C4
	ldr r0, [r5, #8]
	mov r1, r4
	blx r2
	b _022C24D8
_022C24C4:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _022C24D8
	mov r0, r4
	blx r1
_022C24D8:
	ldrh r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r3, [r5]
	mov r0, #1
	ldr r1, [r3]
	sub r2, r0, #1
	str r1, [r5]
_022C24F8:
	ldr r0, [r5, #4]
	subs r2, r2, #1
	str r0, [r3]
	str r3, [r5, #4]
	add r3, r3, #0xa4
	bpl _022C24F8
	mov r0, r5
	bl Wbti_SwitchNextCommand
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Wbti_NotifyCompletionCallback

	arm_func_start Wbt_CallPacketRecvHook
Wbt_CallPacketRecvHook: ; 0x022C251C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r1
	mov r1, #0x24
	mul r1, r4, r1
	mov r5, r0
	mov r6, #1
	movs ip, r2
	mvn r2, r6, lsl r4
	ldr r7, [r5, #0x30c]
	add r8, r5, #0xac
	and r2, r7, r2
	str r2, [r5, #0x30c]
	add r2, r8, r1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r3, #4
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r8, [ip]
	ldrb sl, [ip, #1]
	ldrb lr, [ip, #2]
	ldrb r7, [ip, #3]
	sub sb, r6, #2
	orr sl, sl, lr, lsl #8
	strb r7, [r2, #1]
	strb r8, [r2]
	ldr lr, [r5, #0x2ec]
	mov r7, sl, lsl #0x10
	cmp lr, sb
	beq _022C2914
	mov sb, r6, lsl lr
	tst sb, r7, lsr #16
	beq _022C2914
	cmp r8, #0x11
	bhs _022C2914
	mov r7, #0xc
	mul sb, r8, r7
	ldr r7, _022C2940 ; =ov00_02318064
	ldr r7, [r7, sb]
	cmp r3, r7
	blo _022C2914
	ldr r3, _022C2944 ; =ov00_02318060
	add r3, r3, sb
	ldr r3, [r3, #8]
	mov r7, r3, lsl #0x1f
	movs r7, r7, lsr #0x1f
	beq _022C2728
	cmp r8, #1
	beq _022C2914
	cmp r8, #2
	bne _022C2638
	ldrb r2, [ip, #4]
	ldrb r1, [ip, #5]
	mov r0, #0
	orr r1, r2, r1, lsl #8
	strh r1, [r5, #0x26]
	ldrb r2, [ip, #6]
	ldrb r1, [ip, #7]
	orr r1, r2, r1, lsl #8
	strh r1, [r5, #0x28]
	strh r0, [r5, #0x24]
	ldr r0, [r5, #0x2ec]
	cmp r0, #0
	beq _022C2628
	ldrsh r1, [r5, #0x28]
	add r0, r5, #0x200
	strh r1, [r0, #0xf2]
	ldrsh r1, [r5, #0x26]
	strh r1, [r0, #0xf0]
_022C2628:
	ldr r0, [r5, #0x30c]
	orr r0, r0, r6, lsl r4
	str r0, [r5, #0x30c]
	b _022C2914
_022C2638:
	cmp r8, #0xa
	bne _022C2674
	ldrb r0, [ip, #4]
	add r1, r5, #0x24
	strb r0, [r5, #0x2d]
	cmp r0, #9
	movhi r0, #0
	strhib r0, [r5, #0x2d]
	ldrb r2, [r5, #0x2d]
	add r0, ip, #5
	bl MI_CpuCopy8
	ldr r0, [r5, #0x30c]
	orr r0, r0, r6, lsl r4
	str r0, [r5, #0x30c]
	b _022C2914
_022C2674:
	cmp r8, #4
	cmpne r8, #6
	bne _022C26D0
	ldrb r1, [ip, #4]
	ldrb r0, [ip, #5]
	ldrb r3, [ip, #6]
	ldrb r7, [ip, #7]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r0, r0, r7, lsl #24
	str r0, [r2, #4]
	ldrb r1, [ip, #8]
	ldrb r0, [ip, #9]
	ldrb r3, [ip, #0xa]
	ldrb r7, [ip, #0xb]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r0, r0, r7, lsl #24
	str r0, [r2, #8]
	ldr r0, [r5, #0x30c]
	orr r0, r0, r6, lsl r4
	str r0, [r5, #0x30c]
	b _022C2914
_022C26D0:
	cmp r8, #8
	bne _022C2914
	ldrb r1, [ip, #4]
	ldrb r0, [ip, #5]
	ldrb r3, [ip, #6]
	ldrb r7, [ip, #7]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r0, r0, r7, lsl #24
	str r0, [r5, #0x24]
	ldrb r1, [ip, #4]
	ldrb r0, [ip, #5]
	ldrb r3, [ip, #6]
	ldrb r7, [ip, #7]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r0, r0, r7, lsl #24
	str r0, [r2, #4]
	ldr r0, [r5, #0x30c]
	orr r0, r0, r6, lsl r4
	str r0, [r5, #0x30c]
	b _022C2914
_022C2728:
	mov r2, r3, lsl #0x1e
	movs r2, r2, lsr #0x1f
	beq _022C2904
	ldr r0, [r5]
	cmp r0, #0
	addne r2, r0, #4
	moveq r2, #0
	cmp r2, #0
	beq _022C2914
	cmp r8, #3
	bne _022C27C4
	ldr r0, [r2]
	cmp r0, #2
	bne _022C2914
	ldrb r1, [ip, #4]
	ldrb r0, [ip, #5]
	orr r0, r1, r0, lsl #8
	strh r0, [r2, #0x14]
	ldrb r1, [ip, #6]
	ldrb r0, [ip, #7]
	orr r0, r1, r0, lsl #8
	strh r0, [r2, #0x16]
	ldrb r1, [ip, #8]
	ldrb r0, [ip, #9]
	orr r0, r1, r0, lsl #8
	strh r0, [r2, #0x18]
	ldr r0, [r5, #0x2ec]
	cmp r0, #0
	beq _022C27B0
	ldrsh r1, [r2, #0x18]
	add r0, r5, #0x200
	strh r1, [r0, #0xf2]
	ldrsh r1, [r2, #0x16]
	strh r1, [r0, #0xf0]
_022C27B0:
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl Wbti_NotifyCompletionCallback
	b _022C2914
_022C27C4:
	cmp r8, #0xb
	bne _022C27EC
	ldr r0, [r2]
	cmp r0, #0xa
	bne _022C2914
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl Wbti_NotifyCompletionCallback
	b _022C2914
_022C27EC:
	cmp r8, #5
	cmpne r8, #7
	bne _022C28A8
	ldr r0, [r2]
	cmp r0, #4
	cmpne r0, #6
	bne _022C2914
	ldrb r3, [ip, #4]
	ldrb r0, [ip, #5]
	ldrb sb, [ip, #8]
	ldrb lr, [ip, #9]
	ldrb r7, [ip, #6]
	orr r3, r3, r0, lsl #8
	ldrb r0, [ip, #0xa]
	orr sb, sb, lr, lsl #8
	ldrb lr, [ip, #7]
	orr r7, r3, r7, lsl #16
	ldrb r3, [ip, #0xb]
	orr sb, sb, r0, lsl #16
	ldr r0, [r2, #0x14]
	orr r7, r7, lr, lsl #24
	cmp r7, r0
	orr r7, sb, r3, lsl #24
	bne _022C2914
	ldrh r0, [r2, #8]
	tst r0, r6, lsl r4
	beq _022C2914
	add r0, r5, #0xb8
	add sb, r0, r1
	ldr r0, [sb, #0xc]
	cmp r7, r0
	blt _022C2884
	mov r0, r5
	mov r2, r4
	mov r1, #0xf
	mov r3, #6
	bl Wbti_NotifySystemCallback
	b _022C2914
_022C2884:
	add r0, r5, #0x200
	ldrsh r2, [r0, #0xf0]
	mov r0, sb
	mov r1, r7
	add r3, ip, #0xc
	bl Wbti_MergeBitmapIndex
	cmp r0, #0
	strne r7, [sb, #0x14]
	b _022C2914
_022C28A8:
	cmp r8, #9
	bne _022C2914
	ldr r0, [r2]
	cmp r0, #4
	cmpne r0, #6
	bne _022C2914
	ldrb r3, [ip, #4]
	ldrb r1, [ip, #5]
	ldrb r7, [ip, #6]
	ldrb sb, [ip, #7]
	orr r1, r3, r1, lsl #8
	orr r1, r1, r7, lsl #16
	ldr r2, [r2, #0x14]
	orr r1, r1, sb, lsl #24
	cmp r2, r1
	bne _022C2914
	cmp r0, #4
	moveq r1, #5
	movne r1, #7
	mov r0, r5
	mov r2, r4
	bl Wbti_NotifyCompletionCallback
	b _022C2914
_022C2904:
	mov r2, r4
	mov r1, #0xf
	mov r3, #3
	bl Wbti_NotifySystemCallback
_022C2914:
	ldr r0, [r5, #0x30c]
	tst r0, r6, lsl r4
	cmpne r8, #4
	cmpne r8, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r5
	mov r1, r8
	mov r2, r4
	mov r3, #0
	bl Wbti_NotifySystemCallback
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022C2940: .word ov00_02318064
_022C2944: .word ov00_02318060
	arm_func_end Wbt_CallPacketRecvHook

	arm_func_start Wbt_InitContext
Wbt_InitContext: ; 0x022C2948
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	str r1, [r5, #8]
	str r4, [r5, #0xc]
	mvn r0, #0
	str r0, [r5, #0x300]
	str r0, [r5, #0x304]
	str r0, [r5, #0x308]
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #4]
	strb r1, [r5, #0x2f8]
	str r0, [r5, #0x2fc]
	add r0, r5, #0x10
	mov r2, #0x9c
	str r1, [r5, #0x30c]
	bl MI_CpuFill8
	add r0, r5, #0xac
	mov r1, #0
	mov r2, #0x240
	bl MI_CpuFill8
	mov r0, r5
	mov r1, r4
	bl Wbt_ResetContext
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wbt_InitContext

	arm_func_start Wbt_ResetContext
Wbt_ResetContext: ; 0x022C29B0
	mvn r2, #0
	str r2, [r0, #0x2ec]
	add r2, r0, #0x200
	mov r3, #0
	strh r3, [r2, #0xf0]
	strh r3, [r2, #0xf2]
	str r3, [r0, #0x2f4]
	str r1, [r0, #0xc]
	ldr r3, [r0]
	cmp r3, #0
	beq _022C29F8
	mov r1, #0
_022C29E0:
	ldr r2, [r3]
	str r2, [r0]
	str r1, [r3, #4]
	ldr r3, [r0]
	cmp r3, #0
	bne _022C29E0
_022C29F8:
	mov r2, #0
	str r2, [r0, #0x10]
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	mov r1, r2
_022C2A0C:
	add r2, r2, #1
	strb r1, [r0, #0xae]
	cmp r2, #0x10
	add r0, r0, #0x24
	blt _022C2A0C
	bx lr
	arm_func_end Wbt_ResetContext

	arm_func_start Wbt_PostCommand
Wbt_PostCommand: ; 0x022C2A24
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r7, #0
	beq _022C2A90
	ldr r0, [r8]
	mov r1, r8
	cmp r0, #0
	beq _022C2A68
_022C2A58:
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0
	bne _022C2A58
_022C2A68:
	str r7, [r1]
	mov r0, #0
	str r0, [r7]
	strh r6, [r7, #0xc]
	str r5, [r7, #0xa0]
	ldr r0, [r8]
	cmp r0, r7
	bne _022C2A90
	mov r0, r8
	bl Wbti_SwitchNextCommand
_022C2A90:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Wbt_PostCommand

	arm_func_start Wbt_CancelCommand
Wbt_CancelCommand: ; 0x022C2A9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	bl EnableIrqFlag
	ldr r6, [sl]
	str r0, [sp]
	cmp r6, #0
	addne r8, r6, #4
	moveq r8, #0
	cmp r8, #0
	beq _022C2BA8
	ldrh r0, [r8, #8]
	mov fp, #0x10
	mov r7, #0
	and sb, sb, r0
	mov r4, fp
	mov r5, #1
_022C2AE0:
	cmp sb, r5, lsl r7
	mov r2, r5, lsl r7
	blt _022C2B6C
	tst r2, sb
	mvneq r0, r2
	andeq sb, sb, r0
	beq _022C2B64
	ldr r0, [r6, #0xa0]
	cmp r0, #0
	beq _022C2B34
	str r4, [r8, #4]
	ldrh r3, [r8, #8]
	mvn r0, r2
	mov r1, r8
	and r0, r3, r0
	strh r0, [r8, #8]
	strh r2, [r8, #0xa]
	ldr r0, [sl, #8]
	ldr r2, [r6, #0xa0]
	blx r2
	b _022C2B64
_022C2B34:
	ldr r0, [r8, #0x10]
	cmp r0, #0
	beq _022C2B64
	str fp, [r8, #4]
	ldrh r3, [r8, #8]
	mvn r1, r2
	mov r0, r8
	and r1, r3, r1
	strh r1, [r8, #8]
	strh r2, [r8, #0xa]
	ldr r1, [r8, #0x10]
	blx r1
_022C2B64:
	add r7, r7, #1
	b _022C2AE0
_022C2B6C:
	ldrh r0, [r8, #8]
	cmp r0, #0
	bne _022C2BA8
	ldr r2, [sl]
	sub r1, r5, #1
	ldr r0, [r2]
	str r0, [sl]
_022C2B88:
	ldr r0, [sl, #4]
	subs r1, r1, #1
	str r0, [r2]
	str r2, [sl, #4]
	add r2, r2, #0xa4
	bpl _022C2B88
	mov r0, sl
	bl Wbti_SwitchNextCommand
_022C2BA8:
	ldr r0, [sp]
	bl SetIrqFlag
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Wbt_CancelCommand

	arm_func_start Wbt_GetBitmapLength
Wbt_GetBitmapLength: ; 0x022C2BB8
	stmdb sp!, {r3, lr}
	add r0, r0, #0x200
	ldrsh r2, [r0, #0xf0]
	add r0, r1, r2
	mov r1, r2
	sub r0, r0, #1
	bl _s32_div_f
	add r0, r0, #0x1f
	bic r0, r0, #0x1f
	mov r0, r0, lsl #2
	ldmia sp!, {r3, pc}
	arm_func_end Wbt_GetBitmapLength

	arm_func_start Wbt_RegisterBlockInfo
Wbt_RegisterBlockInfo: ; 0x022C2BE4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r1, [r8, #0x2f4]
	mov r5, r0
	cmp r1, #0
	add r0, r8, #0x2f4
	beq _022C2C20
_022C2C10:
	add r0, r1, #0x28
	ldr r1, [r1, #0x28]
	cmp r1, #0
	bne _022C2C10
_022C2C20:
	str r4, [r0]
	mov r1, #0
	str r1, [r4, #0x28]
	ldr r0, [sp, #0x1c]
	str r7, [r4]
	str r0, [r4, #4]
	cmp r6, #0
	mov r2, #0x20
	bne _022C2C50
	add r0, r4, #8
	bl MI_CpuFill8
	b _022C2C5C
_022C2C50:
	mov r0, r6
	add r1, r4, #8
	bl MI_CpuCopy8
_022C2C5C:
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r0, [r4, #0x2c]
	cmp r0, #0
	strh r1, [r4, #0x30]
	moveq r1, #1
	mov r0, r5
	strh r1, [r4, #0x32]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Wbt_RegisterBlockInfo

	arm_func_start Wbt_UnregisterBlockInfo
Wbt_UnregisterBlockInfo: ; 0x022C2C84
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl EnableIrqFlag
	ldr r3, [r6, #0x2f4]
	add r2, r6, #0x2f4
	cmp r3, #0
	beq _022C2CD4
_022C2CA8:
	ldr r1, [r3]
	cmp r1, r5
	bne _022C2CC4
	ldr r1, [r3, #0x28]
	mov r4, r3
	str r1, [r2]
	b _022C2CD4
_022C2CC4:
	add r2, r3, #0x28
	ldr r3, [r3, #0x28]
	cmp r3, #0
	bne _022C2CA8
_022C2CD4:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Wbt_UnregisterBlockInfo

	arm_func_start Wbt_GetRegisteredCount
Wbt_GetRegisteredCount: ; 0x022C2CE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl EnableIrqFlag
	ldr r1, [r5, #0x2f4]
	cmp r1, #0
	beq _022C2D0C
_022C2CFC:
	ldr r1, [r1, #0x28]
	add r4, r4, #1
	cmp r1, #0
	bne _022C2CFC
_022C2D0C:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wbt_GetRegisteredCount

	arm_func_start Wbt_PrintBtList
Wbt_PrintBtList: ; 0x022C2D18
	ldr r0, _022C2D38 ; =ov00_0231EE88
	ldr r0, [r0, #0x440]
	cmp r0, #0
	bxeq lr
_022C2D28:
	ldr r0, [r0, #0x28]
	cmp r0, #0
	bne _022C2D28
	bx lr
	.align 2, 0
_022C2D38: .word ov00_0231EE88
	arm_func_end Wbt_PrintBtList

	arm_func_start Wbt_AidbitmapToAid
Wbt_AidbitmapToAid: ; 0x022C2D3C
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	mvn r1, r0
	sub r0, r0, #1
	and r0, r1, r0
	clz r0, r0
	rsb r0, r0, #0x20
	bx lr
	arm_func_end Wbt_AidbitmapToAid

	arm_func_start Wbt_InitParent
Wbt_InitParent: ; 0x022C2D60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r3, _022C2E0C ; =ov00_0231EE88
	mov r4, r0
	ldr r0, [r3]
	cmp r0, #0
	bne _022C2E00
	mov r1, #0
	mov ip, #1
	ldr r0, _022C2E10 ; =ov00_0231EFD4
	mov r2, r1
	str ip, [r3]
	bl Wbt_InitContext
	ldr r3, _022C2E0C ; =ov00_0231EE88
	ldr r0, _022C2E14 ; =ov00_0231EE8C
	mov r1, #0
	mov r2, #0x148
	str r5, [r3, #0x16c]
	bl MI_CpuFill8
	mov r0, #2
	sub r2, r0, #1
	ldr r3, _022C2E14 ; =ov00_0231EE8C
	ldr r0, _022C2E0C ; =ov00_0231EE88
_022C2DC8:
	ldr r1, [r0, #0x150]
	subs r2, r2, #1
	str r1, [r3]
	str r3, [r0, #0x150]
	add r3, r3, #0xa4
	bpl _022C2DC8
	ldr r1, _022C2E0C ; =ov00_0231EE88
	mov r2, #0
	ldr r0, _022C2E18 ; =ov00_0231F288
	str r2, [r1, #0x438]
	sub r1, r7, #0xe
	strh r1, [r0, #0x3e]
	sub r1, r6, #0xe
	strh r1, [r0, #0x3c]
_022C2E00:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C2E0C: .word ov00_0231EE88
_022C2E10: .word ov00_0231EFD4
_022C2E14: .word ov00_0231EE8C
_022C2E18: .word ov00_0231F288
	arm_func_end Wbt_InitParent

	arm_func_start Wbt_InitChild
Wbt_InitChild: ; 0x022C2E1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r3, _022C2EA0 ; =ov00_0231EE88
	mov r4, r0
	ldr r0, [r3]
	cmp r0, #0
	bne _022C2E94
	mov r1, #0
	mov ip, #1
	ldr r0, _022C2EA4 ; =ov00_0231EFD4
	mov r2, r1
	str ip, [r3]
	bl Wbt_InitContext
	ldr r3, _022C2EA0 ; =ov00_0231EE88
	ldr r0, _022C2EA8 ; =ov00_0231EE8C
	mov r1, #0
	mov r2, #0x148
	str r5, [r3, #0x16c]
	bl MI_CpuFill8
	mov r0, #2
	sub r2, r0, #1
	ldr r3, _022C2EA8 ; =ov00_0231EE8C
	ldr r0, _022C2EA0 ; =ov00_0231EE88
_022C2E7C:
	ldr r1, [r0, #0x150]
	subs r2, r2, #1
	str r1, [r3]
	str r3, [r0, #0x150]
	add r3, r3, #0xa4
	bpl _022C2E7C
_022C2E94:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C2EA0: .word ov00_0231EE88
_022C2EA4: .word ov00_0231EFD4
_022C2EA8: .word ov00_0231EE8C
	arm_func_end Wbt_InitChild

	arm_func_start Wbt_End
Wbt_End: ; 0x022C2EAC
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r2, _022C2EE8 ; =ov00_0231EE88
	mov r4, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _022C2EDC
	mov r1, #0
	str r1, [r2]
	ldr r0, _022C2EEC ; =ov00_0231EFD4
	str r1, [r2, #0x16c]
	bl Wbt_ResetContext
_022C2EDC:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C2EE8: .word ov00_0231EE88
_022C2EEC: .word ov00_0231EFD4
	arm_func_end Wbt_End

	arm_func_start Wbt_SetOwnAid
Wbt_SetOwnAid: ; 0x022C2EF0
	ldr r3, _022C2F1C ; =ov00_0231EFD4
	mvn r1, #0
	ldr r2, [r3, #0x2ec]
	cmp r2, r1
	bxne lr
	add r1, r3, #0x200
	mov r2, #0
	strh r2, [r1, #0xf2]
	strh r2, [r1, #0xf0]
	str r0, [r3, #0x2ec]
	bx lr
	.align 2, 0
_022C2F1C: .word ov00_0231EFD4
	arm_func_end Wbt_SetOwnAid

	arm_func_start Wbt_MpParentSendHook
Wbt_MpParentSendHook: ; 0x022C2F20
	ldr ip, _022C2F3C ; =Wbt_CallPacketSendHook
	mov r3, r0
	mov r2, r1
	mov r1, r3
	ldr r0, _022C2F40 ; =ov00_0231EFD4
	mov r3, #1
	bx ip
	.align 2, 0
_022C2F3C: .word Wbt_CallPacketSendHook
_022C2F40: .word ov00_0231EFD4
	arm_func_end Wbt_MpParentSendHook

	arm_func_start Wbt_MpChildSendHook
Wbt_MpChildSendHook: ; 0x022C2F44
	ldr ip, _022C2F60 ; =Wbt_CallPacketSendHook
	mov r3, r0
	mov r2, r1
	mov r1, r3
	ldr r0, _022C2F64 ; =ov00_0231EFD4
	mov r3, #0
	bx ip
	.align 2, 0
_022C2F60: .word Wbt_CallPacketSendHook
_022C2F64: .word ov00_0231EFD4
	arm_func_end Wbt_MpChildSendHook

	arm_func_start Wbt_MpParentRecvHook
Wbt_MpParentRecvHook: ; 0x022C2F68
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r3, r1
	mov r1, r2
	ldr r0, _022C2F88 ; =ov00_0231EFD4
	mov r2, ip
	bl Wbt_CallPacketRecvHook
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C2F88: .word ov00_0231EFD4
	arm_func_end Wbt_MpParentRecvHook

	arm_func_start Wbt_MpChildRecvHook
Wbt_MpChildRecvHook: ; 0x022C2F8C
	ldr ip, _022C2FA4 ; =Wbt_CallPacketRecvHook
	mov r2, r0
	mov r3, r1
	ldr r0, _022C2FA8 ; =ov00_0231EFD4
	mov r1, #0
	bx ip
	.align 2, 0
_022C2FA4: .word Wbt_CallPacketRecvHook
_022C2FA8: .word ov00_0231EFD4
	arm_func_end Wbt_MpChildRecvHook

	arm_func_start Wbt_RegisterBlock
Wbt_RegisterBlock: ; 0x022C2FAC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	ldr ip, [sp, #0x18]
	ldr r0, _022C2FEC ; =ov00_0231EFD4
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl Wbt_RegisterBlockInfo
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C2FEC: .word ov00_0231EFD4
	arm_func_end Wbt_RegisterBlock

	arm_func_start Wbt_UnregisterBlock
Wbt_UnregisterBlock: ; 0x022C2FF0
	ldr ip, _022C3000 ; =Wbt_UnregisterBlockInfo
	mov r1, r0
	ldr r0, _022C3004 ; =ov00_0231EFD4
	bx ip
	.align 2, 0
_022C3000: .word Wbt_UnregisterBlockInfo
_022C3004: .word ov00_0231EFD4
	arm_func_end Wbt_UnregisterBlock

	arm_func_start Wbt_RequestSync
Wbt_RequestSync: ; 0x022C3008
	stmdb sp!, {r4, lr}
	ldr r3, _022C3064 ; =ov00_0231EE88
	mov r2, r0
	ldr r4, [r3, #0x150]
	cmp r4, #0
	beq _022C3030
	ldr ip, [r4]
	mov r0, #0
	str ip, [r3, #0x150]
	str r0, [r4]
_022C3030:
	cmp r4, #0
	beq _022C3054
	ldr r0, _022C3068 ; =ov00_0231EFD4
	str r1, [r4, #0x14]
	mov ip, #2
	mov r1, r4
	mov r3, #0
	str ip, [r4, #4]
	bl Wbt_PostCommand
_022C3054:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C3064: .word ov00_0231EE88
_022C3068: .word ov00_0231EFD4
	arm_func_end Wbt_RequestSync

	arm_func_start Wbt_GetBlockInfo
Wbt_GetBlockInfo: ; 0x022C306C
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _022C3104 ; =ov00_0231EE88
	mov ip, r0
	ldr r4, [lr, #0x150]
	cmp r4, #0
	beq _022C3094
	ldr r5, [r4]
	mov r0, #0
	str r5, [lr, #0x150]
	str r0, [r4]
_022C3094:
	cmp r4, #0
	beq _022C30F4
	str r3, [r4, #0x14]
	str r1, [r4, #0x18]
	add r5, r4, #0x18
	mov r0, #0x28
	ldr lr, _022C3108 ; =ov00_0231F2E4
	str r0, [r5, #4]
	mov r3, #0
_022C30B8:
	add r1, r5, r3, lsl #2
	str lr, [r1, #0x48]
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	str r0, [r1, #8]
	cmp r3, #0x10
	add lr, lr, #0x28
	blt _022C30B8
	ldr r0, _022C310C ; =ov00_0231EFD4
	mov lr, #6
	mov r1, r4
	mov r2, ip
	mov r3, #0
	str lr, [r4, #4]
	bl Wbt_PostCommand
_022C30F4:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C3104: .word ov00_0231EE88
_022C3108: .word ov00_0231F2E4
_022C310C: .word ov00_0231EFD4
	arm_func_end Wbt_GetBlockInfo

	arm_func_start Wbt_GetBlock
Wbt_GetBlock: ; 0x022C3110
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _022C31CC ; =ov00_0231EE88
	mov lr, r0
	ldr r4, [r5, #0x150]
	mov ip, r2
	cmp r4, #0
	beq _022C313C
	ldr r2, [r4]
	mov r0, #0
	str r2, [r5, #0x150]
	str r0, [r4]
_022C313C:
	cmp r4, #0
	beq _022C31BC
	ldr r0, [sp, #0x1c]
	add r8, r4, #0x20
	str r0, [r4, #0x14]
	str r1, [r4, #0x18]
	str r3, [r4, #0x1c]
	ldmia ip!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	ldmia ip!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	ldr r7, [sp, #0x18]
	add r6, r4, #0x60
	mov r5, #4
	ldmia ip!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	ldmia ip, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r7, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	str r5, [r4, #4]
	mov r2, lr
	ldr r0, _022C31D0 ; =ov00_0231EFD4
	mov r1, r4
	mov r3, #0
	bl Wbt_PostCommand
_022C31BC:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C31CC: .word ov00_0231EE88
_022C31D0: .word ov00_0231EFD4
	arm_func_end Wbt_GetBlock

	arm_func_start Wbt_PutUserData
Wbt_PutUserData: ; 0x022C31D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022C3244 ; =ov00_0231EE88
	mov r5, r0
	ldr r4, [ip, #0x150]
	cmp r4, #0
	beq _022C31FC
	ldr lr, [r4]
	mov r0, #0
	str lr, [ip, #0x150]
	str r0, [r4]
_022C31FC:
	cmp r4, #0
	beq _022C3234
	mov r0, r1
	str r3, [r4, #0x14]
	add r1, r4, #0x18
	strb r2, [r4, #0x21]
	bl MI_CpuCopy8
	mov ip, #0xa
	ldr r0, _022C3248 ; =ov00_0231EFD4
	mov r1, r4
	mov r2, r5
	mov r3, #0
	str ip, [r4, #4]
	bl Wbt_PostCommand
_022C3234:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C3244: .word ov00_0231EE88
_022C3248: .word ov00_0231EFD4
	arm_func_end Wbt_PutUserData

	arm_func_start Wbt_CancelCurrentCommand
Wbt_CancelCurrentCommand: ; 0x022C324C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _022C326C ; =ov00_0231EFD4
	bl Wbt_CancelCommand
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C326C: .word ov00_0231EFD4
	arm_func_end Wbt_CancelCurrentCommand

	arm_func_start MB_CommSetParentStateCallback
MB_CommSetParentStateCallback: ; 0x022C3270
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _022C3294 ; =ov00_0232502C
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r4, [r1, #0x4e4]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C3294: .word ov00_0232502C
	arm_func_end MB_CommSetParentStateCallback

	arm_func_start MB_CommGetParentState
MB_CommGetParentState: ; 0x022C3298
	stmdb sp!, {r4, lr}
	ldr r1, _022C32E0 ; =ov00_0232502C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _022C32D8
	bl IsChildAidValid
	cmp r0, #0
	beq _022C32D8
	ldr r0, _022C32E0 ; =ov00_0232502C
	sub r1, r4, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	ldmia sp!, {r4, pc}
_022C32D8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C32E0: .word ov00_0232502C
	arm_func_end MB_CommGetParentState

	arm_func_start MB_CommGetChildUser
MB_CommGetChildUser: ; 0x022C32E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _022C3364 ; =ov00_0232502C
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _022C3354
	mov r0, r5
	bl IsChildAidValid
	cmp r0, #0
	beq _022C3354
	ldr r0, _022C3364 ; =ov00_0232502C
	sub r1, r5, #1
	ldr r3, [r0]
	mov r2, #0x16
	add r0, r3, #0x1340
	mla r0, r1, r2, r0
	add r1, r3, #0x72
	add r1, r1, #0x1700
	bl MI_CpuCopy8
	mov r0, r4
	bl SetIrqFlag
	ldr r0, _022C3364 ; =ov00_0232502C
	ldr r0, [r0]
	add r0, r0, #0x72
	add r0, r0, #0x1700
	ldmia sp!, {r3, r4, r5, pc}
_022C3354:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C3364: .word ov00_0232502C
	arm_func_end MB_CommGetChildUser

	arm_func_start MB_CommIsBootable
MB_CommIsBootable: ; 0x022C3368
	stmdb sp!, {r4, lr}
	ldr r1, _022C33B8 ; =ov00_0232502C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _022C33B0
	bl IsChildAidValid
	cmp r0, #0
	beq _022C33B0
	ldr r0, _022C33B8 ; =ov00_0232502C
	sub r1, r4, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r0, #7
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_022C33B0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C33B8: .word ov00_0232502C
	arm_func_end MB_CommIsBootable

	arm_func_start MB_CommResponseRequest
MB_CommResponseRequest: ; 0x022C33BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl EnableIrqFlag
	mov r6, r0
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _022C341C
_022C33DC: ; jump table
	b _022C33EC ; case 0
	b _022C33F8 ; case 1
	b _022C3404 ; case 2
	b _022C3410 ; case 3
_022C33EC:
	mov r5, #0xa
	mov r4, #4
	b _022C342C
_022C33F8:
	mov r5, #0xa
	mov r4, #3
	b _022C342C
_022C3404:
	mov r5, #0xe
	mov r4, #2
	b _022C342C
_022C3410:
	mov r5, #7
	mov r4, #5
	b _022C342C
_022C341C:
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C342C:
	ldr r0, _022C3498 ; =ov00_0232502C
	ldr r0, [r0]
	cmp r0, #0
	beq _022C3488
	mov r0, r7
	bl IsChildAidValid
	cmp r0, #0
	beq _022C3488
	ldr r0, _022C3498 ; =ov00_0232502C
	sub r2, r7, #1
	ldr r1, [r0]
	add r0, r1, r2, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r5, r0
	bne _022C3488
	add r0, r1, r2, lsl #1
	add r1, r0, #0x1700
	mov r0, r6
	strh r4, [r1, #0x54]
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C3488:
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C3498: .word ov00_0232502C
	arm_func_end MB_CommResponseRequest

	arm_func_start MBi_CommChangeParentState
MBi_CommChangeParentState: ; 0x022C349C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsChildAidValid
	cmp r0, #0
	beq _022C34D0
	ldr r0, _022C34E4 ; =ov00_0232502C
	sub r1, r6, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	str r5, [r0, #0x4e8]
_022C34D0:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MBi_CommChangeParentStateCallbackOnly
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C34E4: .word ov00_0232502C
	arm_func_end MBi_CommChangeParentState

	arm_func_start MBi_CommChangeParentStateCallbackOnly
MBi_CommChangeParentStateCallbackOnly: ; 0x022C34E8
	stmdb sp!, {r3, lr}
	ldr r3, _022C350C ; =ov00_0232502C
	ldr r3, [r3]
	add r3, r3, #0x1000
	ldr r3, [r3, #0x4e4]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C350C: .word ov00_0232502C
	arm_func_end MBi_CommChangeParentStateCallbackOnly

	arm_func_start MBi_CommParentCallback
MBi_CommParentCallback: ; 0x022C3510
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #0x19
	bgt _022C3568
	bge _022C37AC
	cmp r5, #0x11
	bgt _022C355C
	bge _022C3960
	cmp r5, #3
	bgt _022C3960
	cmp r5, #0
	blt _022C3960
	beq _022C35A0
	cmp r5, #1
	beq _022C35C4
	cmp r5, #3
	beq _022C37A0
	b _022C3960
_022C355C:
	cmp r5, #0x15
	beq _022C358C
	b _022C3960
_022C3568:
	cmp r5, #0xff
	bgt _022C3580
	bge _022C384C
	cmp r5, #0x1c
	beq _022C37B4
	b _022C3960
_022C3580:
	cmp r5, #0x100
	beq _022C38BC
	b _022C3960
_022C358C:
	mov r2, r4
	mov r0, #0
	mov r1, #1
	bl MBi_CommChangeParentState
	b _022C3960
_022C35A0:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _022C3960
	cmp r0, #0x10
	bhs _022C3960
	mov r2, r4
	mov r1, #2
	bl MBi_CommChangeParentState
	b _022C3960
_022C35C4:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _022C3960
	cmp r0, #0x10
	bhs _022C3960
	ldr r2, _022C39A8 ; =ov00_0232502C
	sub r0, r0, #1
	ldr r3, [r2]
	mov r1, #0
	add r0, r3, r0, lsl #1
	add r0, r0, #0x1400
	strh r1, [r0, #0x8a]
	ldr r0, [r2]
	ldrh r2, [r4, #0x10]
	add r0, r0, #0xa8
	add r3, r0, #0x1400
	sub r0, r2, #1
	add r0, r3, r0, lsl #2
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, _022C39A8 ; =ov00_0232502C
	ldrh r1, [r4, #0x10]
	ldr r0, [r0]
	mov r2, #0x16
	add r0, r0, #0x1340
	sub r1, r1, #1
	mla r0, r1, r2, r0
	mov r1, #0
	bl MI_CpuFill8
	ldrh r0, [r4, #0x10]
	bl MBi_ClearParentPieceBuffer
	ldrh r1, [r4, #0x10]
	ldr r0, _022C39A8 ; =ov00_0232502C
	mov r3, #0
	ldr r2, [r0]
	sub r1, r1, #1
	add r1, r2, r1, lsl #1
	add r1, r1, #0x1700
	strh r3, [r1, #0x54]
	ldrh r7, [r4, #0x10]
	ldr r8, [r0]
	sub r2, r3, #1
	sub r6, r7, #1
	add r1, r8, r6
	add r1, r1, #0x1500
	ldrsb r3, [r1, #0x26]
	cmp r3, r2
	beq _022C36F0
	ldr r1, _022C39AC ; =0x000005D4
	and r2, r3, #0xff
	mul r1, r2, r1
	add r2, r8, r1
	add r8, r2, #0x1d00
	mov r3, #1
	ldrh sb, [r8, #0x4e]
	mvn r2, r3, lsl r7
	and sb, sb, r2
	strh sb, [r8, #0x4e]
	ldr r8, [r0]
	sub sb, r3, #2
	add r8, r8, r1
	add r8, r8, #0x1d00
	ldrh ip, [r8, #0x50]
	orr r3, ip, r3, lsl r7
	strh r3, [r8, #0x50]
	ldr r3, [r0]
	add r3, r3, r6
	add r3, r3, #0x1000
	strb sb, [r3, #0x526]
	ldr r0, [r0]
	add r0, r0, r1
	add r0, r0, #0x1d00
	ldrh r1, [r0, #0x4c]
	and r1, r1, r2
	strh r1, [r0, #0x4c]
_022C36F0:
	ldr r1, _022C39A8 ; =ov00_0232502C
	ldrh r2, [r4, #0x10]
	ldr r6, [r1]
	mov r3, #1
	add r0, r6, #0x1500
	ldrh r0, [r0, #0x36]
	tst r0, r3, lsl r2
	beq _022C373C
	add r0, r6, #0x1000
	ldrb r2, [r0, #0x535]
	sub r2, r2, #1
	strb r2, [r0, #0x535]
	ldr r0, [r1]
	ldrh r1, [r4, #0x10]
	add r0, r0, #0x1500
	ldrh r2, [r0, #0x36]
	mvn r1, r3, lsl r1
	and r1, r2, r1
	strh r1, [r0, #0x36]
_022C373C:
	ldrh r0, [r4, #0x10]
	ldr r1, _022C39A8 ; =ov00_0232502C
	ldr r2, [r1]
	sub r1, r0, #1
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x4e8]
	cmp r1, #8
	bne _022C376C
	mov r1, #9
	mov r2, #0
	bl MBi_CommChangeParentState
_022C376C:
	ldrh r0, [r4, #0x10]
	mov r2, r4
	mov r1, #3
	bl MBi_CommChangeParentState
	ldrh r1, [r4, #0x10]
	ldr r0, _022C39A8 ; =ov00_0232502C
	mov r3, #0
	ldr r2, [r0]
	sub r0, r1, #1
	add r0, r2, r0, lsl #2
	add r0, r0, #0x1000
	str r3, [r0, #0x4e8]
	b _022C3960
_022C37A0:
	mov r0, r4
	bl MBi_CommParentRecvData
	b _022C3960
_022C37AC:
	bl MBi_CommParentSendData
	b _022C3960
_022C37B4:
	mov r8, #0
	ldr r6, _022C39A8 ; =ov00_0232502C
	ldr r4, _022C39AC ; =0x000005D4
	mov r7, r8
_022C37C4:
	mul sb, r8, r4
	ldr r1, [r6]
	add r2, r1, sb
	add r0, r2, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r2, r2, #0x1d00
	ldrneh r3, [r2, #0x50]
	cmpne r3, #0
	beq _022C3814
	add r0, r1, #0x6c
	add r0, r0, #0x1800
	ldrh r2, [r2, #0x4e]
	add r0, r0, sb
	add r1, r1, #0x1340
	bl MB_UpdateGameInfoMember
	ldr r0, [r6]
	add r0, r0, sb
	add r0, r0, #0x1d00
	strh r7, [r0, #0x50]
_022C3814:
	add r0, r8, #1
	and r8, r0, #0xff
	cmp r8, #0x10
	blo _022C37C4
	bl MBi_GetGgid
	mov r6, r0
	bl MBi_GetTgid
	mov r4, r0
	bl MBi_GetAttribute
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl MB_SendGameInfoBeacon
	b _022C3960
_022C384C:
	ldrh r0, [r4, #2]
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _022C38AC
_022C385C: ; jump table
	b _022C38AC ; case 0
	b _022C389C ; case 1
	b _022C38AC ; case 2
	b _022C38AC ; case 3
	b _022C389C ; case 4
	b _022C389C ; case 5
	b _022C389C ; case 6
	b _022C38AC ; case 7
	b _022C389C ; case 8
	b _022C389C ; case 9
	b _022C38AC ; case 10
	b _022C38AC ; case 11
	b _022C38AC ; case 12
	b _022C38AC ; case 13
	b _022C38AC ; case 14
	b _022C38AC ; case 15
_022C389C:
	mov r0, #0
	mov r1, #9
	bl MBi_CommCallParentError
	b _022C3960
_022C38AC:
	mov r0, #0
	mov r1, #8
	bl MBi_CommCallParentError
	b _022C3960
_022C38BC:
	ldrh r0, [r4]
	cmp r0, #0x1d
	addls pc, pc, r0, lsl #2
	b _022C3954
_022C38CC: ; jump table
	b _022C3944 ; case 0
	b _022C3954 ; case 1
	b _022C3954 ; case 2
	b _022C3954 ; case 3
	b _022C3954 ; case 4
	b _022C3954 ; case 5
	b _022C3954 ; case 6
	b _022C3944 ; case 7
	b _022C3944 ; case 8
	b _022C3954 ; case 9
	b _022C3954 ; case 10
	b _022C3954 ; case 11
	b _022C3954 ; case 12
	b _022C3944 ; case 13
	b _022C3944 ; case 14
	b _022C3944 ; case 15
	b _022C3954 ; case 16
	b _022C3944 ; case 17
	b _022C3944 ; case 18
	b _022C3954 ; case 19
	b _022C3954 ; case 20
	b _022C3944 ; case 21
	b _022C3954 ; case 22
	b _022C3954 ; case 23
	b _022C3954 ; case 24
	b _022C3944 ; case 25
	b _022C3954 ; case 26
	b _022C3954 ; case 27
	b _022C3954 ; case 28
	b _022C3944 ; case 29
_022C3944:
	mov r0, #0
	mov r1, #9
	bl MBi_CommCallParentError
	b _022C3960
_022C3954:
	mov r0, #0
	mov r1, #8
	bl MBi_CommCallParentError
_022C3960:
	cmp r5, #0x11
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022C39A8 ; =ov00_0232502C
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x7d00
	add r3, r1, #0x1000
	ldr r4, [r3, #0x4e4]
	bl MTi_CpuClearFast
	ldr r1, _022C39A8 ; =ov00_0232502C
	mov r0, #0
	str r0, [r1]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r2, r0
	mov r1, #0xc
	blx r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C39A8: .word ov00_0232502C
_022C39AC: .word 0x000005D4
	arm_func_end MBi_CommParentCallback

	arm_func_start MBi_CommParentRecvDataPerChild
MBi_CommParentRecvDataPerChild: ; 0x022C39B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x34
	movs r6, r1
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r6, #0xf
	addhi sp, sp, #0x34
	ldmhiia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, sp, #0x20
	mov r2, r6
	add r0, r0, #0xa
	bl MBi_SetRecvBufferFromChild
	ldr r1, _022C3E88 ; =ov00_0232502C
	ldrb r7, [sp, #0x20]
	ldr r2, [r1]
	sub r3, r6, #1
	add r4, r2, r3, lsl #2
	add r4, r4, #0x1000
	ldr r4, [r4, #0x4e8]
	mov r5, r0
	cmp r7, #0xb
	addls pc, pc, r7, lsl #2
	b _022C3E80
_022C3A0C: ; jump table
	b _022C3E80 ; case 0
	b _022C3E80 ; case 1
	b _022C3E80 ; case 2
	b _022C3E80 ; case 3
	b _022C3E80 ; case 4
	b _022C3E80 ; case 5
	b _022C3E80 ; case 6
	b _022C3A3C ; case 7
	b _022C3CD4 ; case 8
	b _022C3D7C ; case 9
	b _022C3DEC ; case 10
	b _022C3E80 ; case 11
_022C3A3C:
	cmp r4, #2
	bne _022C3AE4
	cmp r5, #0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, sp, #0
	mov r2, #0x1d
	bl MI_CpuCopy8
	ldr r2, _022C3E88 ; =ov00_0232502C
	sub r0, r6, #1
	ldr r1, [r2]
	ldr r3, [sp]
	add r1, r1, r0, lsl #2
	add r1, r1, #0x1000
	str r3, [r1, #0x4a8]
	ldr r1, [r2]
	ldrh r3, [sp, #0x1a]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x1400
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	mov r2, #0x16
	add r1, r1, #0x1340
	mla r1, r0, r2, r1
	add r0, sp, #4
	bl MI_CpuCopy8
	ldr r0, _022C3E88 ; =ov00_0232502C
	sub r2, r6, #1
	ldr r3, [r0]
	mov r0, #0x16
	mul r7, r2, r0
	add r8, r3, #0x1340
	and r1, r6, #0xff
	ldrb r3, [r8, r7]
	mov r0, r1, lsl #0x1c
	add r2, sp, #4
	bic r1, r3, #0xf0
	orr r1, r1, r0, lsr #24
	strb r1, [r8, r7]
	mov r0, r6
	mov r1, #0xa
	bl MBi_CommChangeParentState
_022C3AE4:
	cmp r4, #0xa
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldrb lr, [r5, #0x1c]
	mov r0, #0
	cmp lr, #0x10
	bhs _022C3B40
	ldr r2, _022C3E88 ; =ov00_0232502C
	ldr r1, _022C3E8C ; =0x000005D4
	ldr r3, [r2]
	mla r4, lr, r1, r3
	add r1, r4, #0x1000
	ldrb r2, [r1, #0xd52]
	cmp r2, #0
	beq _022C3B40
	sub r2, r6, #1
	add r3, r3, r2, lsl #2
	ldr r2, [r1, #0xd40]
	add r1, r3, #0x1000
	ldr r3, [r1, #0x4a8]
	ldr r1, [r2, #0x14]
	cmp r3, r1
	beq _022C3B60
_022C3B40:
	ldr r0, _022C3E88 ; =ov00_0232502C
	sub r1, r6, #1
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, r1, lsl #1
	add r0, r0, #0x1700
	strh r2, [r0, #0x54]
	b _022C3BDC
_022C3B60:
	mov r5, r0
	add r1, r4, #0x1d00
	mov r3, #1
	b _022C3B88
_022C3B70:
	ldrh r2, [r1, #0x4e]
	tst r2, r3, lsl r5
	addne r0, r0, #1
	add r2, r5, #1
	andne r0, r0, #0xff
	and r5, r2, #0xff
_022C3B88:
	cmp r5, #0x10
	blo _022C3B70
	ldr r2, _022C3E88 ; =ov00_0232502C
	ldr r1, _022C3E8C ; =0x000005D4
	ldr r2, [r2]
	mla r1, lr, r1, r2
	add r1, r1, #0x1000
	ldr r1, [r1, #0xd40]
	ldrb r1, [r1, #0x18]
	cmp r0, r1
	blo _022C3BDC
	sub r0, r6, #1
	add r1, r2, r0, lsl #1
	add r3, r1, #0x1700
	mov r2, #0
	mov r0, r6
	mov r1, #0xb
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3BDC:
	ldr r3, _022C3E88 ; =ov00_0232502C
	sub ip, r6, #1
	ldr r1, [r3]
	add r0, r1, ip, lsl #1
	add r4, r0, #0x1700
	ldrh r0, [r4, #0x54]
	cmp r0, #3
	beq _022C3C0C
	cmp r0, #4
	beq _022C3CB8
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3C0C:
	add r0, r1, #0x1500
	ldrh r0, [r0, #0x36]
	mov r5, #1
	tst r0, r5, lsl r6
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, r1, #0x1000
	ldrb r4, [r1, #0x535]
	ldr r2, _022C3E8C ; =0x000005D4
	mov r0, r6
	add r4, r4, #1
	strb r4, [r1, #0x535]
	ldr r1, [r3]
	mul r4, lr, r2
	add r7, r1, #0x1500
	ldrh r8, [r7, #0x36]
	mov r2, #0
	mov r1, #5
	orr r8, r8, r5, lsl r6
	strh r8, [r7, #0x36]
	ldr r7, [r3]
	add r7, r7, ip
	add r7, r7, #0x1000
	strb lr, [r7, #0x526]
	ldr r7, [r3]
	add r7, r7, #0x4e
	add lr, r7, #0x1d00
	ldrh r7, [lr, r4]
	orr r7, r7, r5, lsl r6
	strh r7, [lr, r4]
	ldr r7, [r3]
	add r7, r7, #0xd50
	add lr, r7, #0x1000
	ldrh r7, [lr, r4]
	orr r5, r7, r5, lsl r6
	strh r5, [lr, r4]
	ldr r3, [r3]
	add r3, r3, ip, lsl #1
	add r3, r3, #0x1700
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3CB8:
	mov r2, #0
	mov r0, r6
	mov r1, #4
	strh r2, [r4, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3CD4:
	cmp r4, #5
	bne _022C3CF4
	mov r0, r6
	mov r1, #0xe
	mov r2, #0
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3CF4:
	cmp r4, #0xe
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3, lsl #1
	add r0, r0, #0x1700
	ldrh r0, [r0, #0x54]
	cmp r0, #2
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r7, [r0, #0x526]
	ldr r4, _022C3E8C ; =0x000005D4
	add r0, r2, #0x14c
	mul r5, r7, r4
	add r7, r0, #0x1c00
	ldrh r4, [r7, r5]
	mov r0, #1
	mov r2, #0
	orr r0, r4, r0, lsl r6
	strh r0, [r7, r5]
	ldr r4, [r1]
	mov r0, r6
	add r4, r4, r5
	add r4, r4, #0x1d00
	strh r2, [r4, #0x48]
	ldr r4, [r1]
	mov r1, #6
	add r3, r4, r3, lsl #1
	add r3, r3, #0x1700
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3D7C:
	cmp r4, #6
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x526]
	cmp r4, #0xff
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _022C3E8C ; =0x000005D4
	ldrh r1, [sp, #0x22]
	mla r0, r4, r0, r2
	add r0, r0, #0x1d00
	ldrh r0, [r0, #0x4a]
	bl MBi_Calc_NextSendBlock
	ldr r2, _022C3E88 ; =ov00_0232502C
	ldr r1, _022C3E8C ; =0x000005D4
	ldr r3, [r2]
	ldr r2, _022C3E90 ; =ov00_0231F564
	mla r1, r4, r1, r3
	add r1, r1, #0x1d00
	strh r0, [r1, #0x4a]
	ldr r1, [r2]
	mov r0, #1
	orr r0, r1, r0, lsl r4
	str r0, [r2]
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3DEC:
	cmp r4, #6
	bne _022C3E48
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r3, [r0, #0x526]
	cmp r3, #0xff
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, _022C3E8C ; =0x000005D4
	add r0, r2, #0x14c
	mul r4, r3, r1
	add r5, r0, #0x1c00
	mov r0, #1
	ldrh r1, [r5, r4]
	mvn r0, r0, lsl r6
	and r3, r1, r0
	mov r0, r6
	mov r1, #7
	mov r2, #0
	strh r3, [r5, r4]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022C3E48:
	cmp r4, #7
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3, lsl #1
	add r3, r0, #0x1700
	ldrh r0, [r3, #0x54]
	cmp r0, #5
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r2, #0
	mov r0, r6
	mov r1, #8
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
_022C3E80:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C3E88: .word ov00_0232502C
_022C3E8C: .word 0x000005D4
_022C3E90: .word ov00_0231F564
	arm_func_end MBi_CommParentRecvDataPerChild

	arm_func_start MBi_CommParentRecvData
MBi_CommParentRecvData: ; 0x022C3E94
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r2, _022C3F30 ; =ov00_0232502C
	ldr r1, _022C3F34 ; =0x000005D4
	mov r4, r0
	mov r3, ip
_022C3EAC:
	ldr r0, [r2]
	mla r5, ip, r1, r0
	add r0, r5, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r0, r5, #0x1d00
	strneh r3, [r0, #0x4a]
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	cmp ip, #0x10
	blo _022C3EAC
	ldr r0, _022C3F38 ; =ov00_0231F564
	mov r1, #0
	ldr r5, _022C3F3C ; =0x0000FFFF
	str r1, [r0]
	mov r6, #1
_022C3EF0:
	mov r0, r4
	mov r1, r6
	bl WM_ReadMpData
	cmp r0, #0
	ldrneh r1, [r0]
	cmpne r1, r5
	cmpne r1, #0
	beq _022C3F18
	mov r1, r6
	bl MBi_CommParentRecvDataPerChild
_022C3F18:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	cmp r6, #0xf
	bls _022C3EF0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C3F30: .word ov00_0232502C
_022C3F34: .word 0x000005D4
_022C3F38: .word ov00_0231F564
_022C3F3C: .word 0x0000FFFF
	arm_func_end MBi_CommParentRecvData

	arm_func_start MBi_CommParentSendMsg
MBi_CommParentSendMsg: ; 0x022C3F40
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022C3F7C ; =ov00_0232502C
	mov r4, r1
	ldr r1, [r2]
	strb r0, [sp]
	add r0, sp, #0
	bl MBi_MakeParentSendBuffer__022C86C8
	ldr r0, _022C3F7C ; =ov00_0232502C
	mov r1, r4
	ldr r2, [r0]
	mov r0, #6
	bl MBi_BlockHeaderEnd
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C3F7C: .word ov00_0232502C
	arm_func_end MBi_CommParentSendMsg

	arm_func_start MBi_CommParentSendDlFileInfo
MBi_CommParentSendDlFileInfo: ; 0x022C3F80
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, #0
	add r0, sp, #6
	mov r1, r5
	mov r2, #0x10
	mvn r4, #0
	bl MI_CpuFill8
	ldr r1, _022C410C ; =ov00_0232502C
	mov r0, #1
	ldr r1, [r1]
	add ip, sp, #6
_022C3FB0:
	add r2, r1, r0, lsl #2
	add r2, r2, #0x1000
	ldr r2, [r2, #0x4e4]
	cmp r2, #5
	bne _022C3FDC
	add r2, r1, r0
	add r2, r2, #0x1500
	ldrsb r3, [r2, #0x25]
	ldrb r2, [ip, r3]
	add r2, r2, #1
	strb r2, [ip, r3]
_022C3FDC:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xf
	bls _022C3FB0
	ldr r2, _022C4110 ; =ov00_02318814
	ldr ip, _022C4114 ; =0x000005D4
	ldrb r3, [r2]
	mov r0, #0
	add lr, sp, #6
_022C4004:
	add r2, r3, #1
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #28
	add r2, r3, r2, ror #28
	and r3, r2, #0xff
	mla r2, r3, ip, r1
	add r2, r2, #0x1000
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	ldrneb r2, [lr, r3]
	cmpne r2, #0
	movne r0, r3, lsl #0x18
	movne r4, r0, asr #0x18
	bne _022C404C
	add r0, r0, #1
	and r0, r0, #0xff
	cmp r0, #0x10
	blo _022C4004
_022C404C:
	mvn r0, #0
	cmp r4, r0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _022C4110 ; =ov00_02318814
	mov r0, #1
	strb r4, [r2]
	mov r3, r0
_022C4070:
	add r2, r1, r0, lsl #2
	add r2, r2, #0x1000
	ldr r2, [r2, #0x4e4]
	cmp r2, #5
	bne _022C40A0
	add r2, r1, r0
	add r2, r2, #0x1500
	ldrsb r2, [r2, #0x25]
	cmp r4, r2
	orreq r2, r5, r3, lsl r0
	moveq r2, r2, lsl #0x10
	moveq r5, r2, lsr #0x10
_022C40A0:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xf
	bls _022C4070
	mov r2, #3
	add r0, sp, #0
	strb r2, [sp]
	strh r4, [sp, #2]
	bl MBi_MakeParentSendBuffer__022C86C8
	movs r1, r0
	beq _022C40F0
	ldr r0, _022C410C ; =ov00_0232502C
	ldr r3, _022C4114 ; =0x000005D4
	ldr r0, [r0]
	mov r2, #0xe4
	add r0, r0, #0x388
	add r0, r0, #0x1400
	mla r0, r4, r3, r0
	bl MI_CpuCopy8
_022C40F0:
	ldr r0, _022C410C ; =ov00_0232502C
	mov r1, r5
	ldr r2, [r0]
	mov r0, #0xea
	bl MBi_BlockHeaderEnd
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C410C: .word ov00_0232502C
_022C4110: .word ov00_02318814
_022C4114: .word 0x000005D4
	arm_func_end MBi_CommParentSendDlFileInfo

	arm_func_start MBi_ReloadCache
MBi_ReloadCache: ; 0x022C4118
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x4c
	ldr r5, [r0, #0x14]
	ldr r4, [r0, #0x10]
	ldr r1, [r5, #0x14]
	add r0, r5, #0x10
	bl FS_FindArchive
	movs r6, r0
	add r0, sp, #4
	ldreq r6, [r5, #0x18]
	bl FS_InitFile
	ldr r2, [r4]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r4, #4]
	add r0, sp, #4
	mov r1, r6
	add r3, r2, r3
	bl FS_OpenFileDirect
	cmp r0, #0
	beq _022C4194
	ldr r1, [r4, #8]
	ldr r2, [r4, #4]
	add r0, sp, #4
	bl FS_ReadFile
	ldr r1, [r4, #4]
	cmp r1, r0
	moveq r0, #2
	streq r0, [r4, #0xc]
	add r0, sp, #4
	bl FS_CloseFile
_022C4194:
	ldr r0, [r4, #0xc]
	cmp r0, #2
	addeq sp, sp, #0x4c
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r0, #0
	str r0, [r4]
	mov r0, #2
	str r0, [r4, #0xc]
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end MBi_ReloadCache

	arm_func_start MBi_CommParentSendBlock
MBi_CommParentSendBlock: ; 0x022C41BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	ldr r5, _022C444C ; =ov00_0232502C
	ldr r0, [r5]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x524]
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, _022C4450 ; =0x000005D4
	mov r1, #0
_022C41EC:
	ldr r0, [r5]
	add r3, r0, #0x1000
	ldrb r0, [r3, #0x525]
	add r0, r0, #1
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #28
	add r0, r2, r0, ror #28
	strb r0, [r3, #0x525]
	ldr r2, [r5]
	add r0, r2, #0x1000
	ldrb r0, [r0, #0x525]
	mla r3, r0, r4, r2
	add r2, r3, #0x1000
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	addne r2, r3, #0x1d00
	ldrneh r2, [r2, #0x4c]
	cmpne r2, #0
	bne _022C4248
	add r1, r1, #1
	and r1, r1, #0xff
	cmp r1, #0x10
	blo _022C41EC
_022C4248:
	cmp r1, #0x10
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl MBi_Calc_SendBlock
	ldr r0, _022C444C ; =ov00_0232502C
	ldr r2, _022C4450 ; =0x000005D4
	ldr r6, [r0]
	add r0, sp, #8
	add r1, r6, #0x1000
	ldrb r4, [r1, #0x525]
	add r1, r6, #0x12c
	add r3, r6, #0x388
	mul r5, r4, r2
	add r2, r6, r5
	add r2, r2, #0x1d00
	add r1, r1, #0x1c00
	add r3, r3, #0x1400
	ldrh r2, [r2, #0x48]
	add r1, r1, r5
	add r3, r3, r5
	bl MBi_Get_BlockInfo
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022C444C ; =ov00_0232502C
	mov r3, #4
	ldr r1, [r0]
	strb r3, [sp]
	add r2, r1, #0x1000
	ldrb r4, [r2, #0x525]
	add r3, r3, #0x5d0
	add r0, sp, #0
	strh r4, [sp, #2]
	ldrb r4, [r2, #0x525]
	mla r2, r4, r3, r1
	add r2, r2, #0x1d00
	ldrh r2, [r2, #0x48]
	strh r2, [sp, #4]
	bl MBi_MakeParentSendBuffer__022C86C8
	ldr r1, _022C444C ; =ov00_0232502C
	ldr r4, _022C4450 ; =0x000005D4
	ldr r5, [r1]
	ldrb r1, [sp, #0x14]
	add r2, r5, #0x1000
	ldrb r2, [r2, #0x525]
	ldr r6, [sp, #0x10]
	ldr r3, [sp, #0xc]
	mla r4, r2, r4, r5
	add r2, r4, r1, lsl #2
	add r5, r4, #0x1000
	ldr r4, [r5, #0xd58]
	add r2, r2, #0x1000
	ldr r2, [r2, #0xd2c]
	ldr r1, [r4, r1, lsl #2]
	sub r2, r6, r2
	add r4, r2, r1
	ldr r5, [r5, #0xd54]
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl MBi_MakeParentSendBuffer__022C8210
	cmp r0, #0
	bne _022C4418
	ldr r0, _022C444C ; =ov00_0232502C
	ldr r0, [r0]
	add r0, r0, #0xce0
	add r6, r0, #0x7000
	mov r0, r6
	bl MBi_ReadFromCache
	cmp r0, #0
	bne _022C440C
	ldr r0, [r5]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r5]
	bne _022C440C
	add r2, r5, #0x30
	mov r7, #0
	mov r3, r7
	mov ip, r2
_022C4390:
	add r0, r2, r3, lsl #4
	ldr r0, [r0, #0xc]
	cmp r0, #2
	bne _022C43BC
	cmp r7, #0
	beq _022C43B8
	ldr r1, [r7]
	ldr r0, [r2, r3, lsl #4]
	cmp r1, r0
	bls _022C43BC
_022C43B8:
	mov r7, ip
_022C43BC:
	add r3, r3, #1
	cmp r3, #4
	add ip, ip, #0x10
	blt _022C4390
	cmp r7, #0
	bne _022C43D8
	bl WaitForever2
_022C43D8:
	mov r0, #2
	str r0, [r5]
	mov r0, #1
	str r0, [r7, #0xc]
	bic r0, r4, #0x1f
	str r0, [r7]
	str r7, [r6, #0x10]
	ldr r1, _022C4454 ; =MBi_ReloadCache
	mov r0, r6
	mov r2, #0
	mov r3, #4
	str r5, [r6, #0x14]
	bl MBi_SetTask
_022C440C:
	add sp, sp, #0x18
	mov r0, #0x15
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C4418:
	ldr r0, _022C444C ; =ov00_0232502C
	ldr r4, [sp, #0xc]
	ldr r2, [r0]
	ldr r1, _022C4450 ; =0x000005D4
	add r0, r2, #0x1000
	ldrb r3, [r0, #0x525]
	add r0, r4, #6
	mla r1, r3, r1, r2
	add r1, r1, #0x1d00
	ldrh r1, [r1, #0x4c]
	bl MBi_BlockHeaderEnd
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C444C: .word ov00_0232502C
_022C4450: .word 0x000005D4
_022C4454: .word MBi_ReloadCache
	arm_func_end MBi_CommParentSendBlock

	arm_func_start MBi_CommParentSendData
MBi_CommParentSendData: ; 0x022C4458
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	add r1, sp, #0
	mov r0, #0
	mov r2, #0xa
	bl MTi_CpuClear16
	mov r3, #1
	ldr r0, _022C45D0 ; =ov00_0232502C
	mov r4, r3
	ldr ip, [r0]
	mov r5, r3
	mov r0, r3
	mov r1, r3
	mov r2, r3
_022C4490:
	add lr, ip, r3, lsl #2
	add lr, lr, #0x1000
	ldr lr, [lr, #0x4e4]
	cmp lr, #0xb
	addls pc, pc, lr, lsl #2
	b _022C4524
_022C44A8: ; jump table
	b _022C4524 ; case 0
	b _022C4524 ; case 1
	b _022C44D8 ; case 2
	b _022C4524 ; case 3
	b _022C44F8 ; case 4
	b _022C44E8 ; case 5
	b _022C4524 ; case 6
	b _022C4524 ; case 7
	b _022C4508 ; case 8
	b _022C4524 ; case 9
	b _022C4524 ; case 10
	b _022C4518 ; case 11
_022C44D8:
	ldrh lr, [sp]
	orr lr, lr, r2, lsl r3
	strh lr, [sp]
	b _022C4524
_022C44E8:
	ldrh lr, [sp, #2]
	orr lr, lr, r1, lsl r3
	strh lr, [sp, #2]
	b _022C4524
_022C44F8:
	ldrh lr, [sp, #4]
	orr lr, lr, r0, lsl r3
	strh lr, [sp, #4]
	b _022C4524
_022C4508:
	ldrh lr, [sp, #6]
	orr lr, lr, r5, lsl r3
	strh lr, [sp, #6]
	b _022C4524
_022C4518:
	ldrh lr, [sp, #8]
	orr lr, lr, r4, lsl r3
	strh lr, [sp, #8]
_022C4524:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0xf
	bls _022C4490
	ldrh r1, [sp, #6]
	cmp r1, #0
	beq _022C4550
	mov r0, #5
	bl MBi_CommParentSendMsg
	b _022C45B0
_022C4550:
	ldrh r1, [sp]
	cmp r1, #0
	beq _022C4568
	mov r0, #1
	bl MBi_CommParentSendMsg
	b _022C45B0
_022C4568:
	ldrh r1, [sp, #8]
	cmp r1, #0
	beq _022C4580
	mov r0, #6
	bl MBi_CommParentSendMsg
	b _022C45B0
_022C4580:
	ldrh r1, [sp, #4]
	cmp r1, #0
	beq _022C4598
	mov r0, #2
	bl MBi_CommParentSendMsg
	b _022C45B0
_022C4598:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022C45AC
	bl MBi_CommParentSendDlFileInfo
	b _022C45B0
_022C45AC:
	bl MBi_CommParentSendBlock
_022C45B0:
	cmp r0, #0x15
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, _022C45D4 ; =0x0000FFFF
	mov r0, #0
	bl MBi_CommParentSendMsg
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022C45D0: .word ov00_0232502C
_022C45D4: .word 0x0000FFFF
	arm_func_end MBi_CommParentSendData

	arm_func_start MBi_Calc_SendBlock
MBi_Calc_SendBlock: ; 0x022C45D8
	ldr r1, _022C4648 ; =ov00_0231F564
	mov r2, #1
	ldr r1, [r1]
	tst r1, r2, lsl r0
	bxeq lr
	ldr r2, _022C464C ; =ov00_0232502C
	ldr r1, _022C4650 ; =0x000005D4
	ldr r2, [r2]
	mla ip, r0, r1, r2
	add r0, ip, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r0, ip, #0x1d00
	ldrneh r1, [r0, #0x4c]
	cmpne r1, #0
	bxeq lr
	ldrh r2, [r0, #0x48]
	ldrh r3, [r0, #0x4a]
	cmp r3, r2
	bhi _022C463C
	add r1, r3, #2
	cmp r2, r1
	addle r1, r2, #1
	strleh r1, [r0, #0x48]
	bxle lr
_022C463C:
	add r0, ip, #0x1d00
	strh r3, [r0, #0x48]
	bx lr
	.align 2, 0
_022C4648: .word ov00_0231F564
_022C464C: .word ov00_0232502C
_022C4650: .word 0x000005D4
	arm_func_end MBi_Calc_SendBlock

	arm_func_start MBi_Calc_NextSendBlock
MBi_Calc_NextSendBlock: ; 0x022C4654
	cmp r1, r0
	movls r1, r0
	mov r0, r1
	bx lr
	arm_func_end MBi_Calc_NextSendBlock

	arm_func_start IsChildAidValid
IsChildAidValid: ; 0x022C4664
	cmp r0, #1
	blo _022C4678
	cmp r0, #0xf
	movls r0, #1
	bxls lr
_022C4678:
	mov r0, #0
	bx lr
	arm_func_end IsChildAidValid

	arm_func_start MBi_CommCallParentError
MBi_CommCallParentError: ; 0x022C4680
	stmdb sp!, {r3, lr}
	strh r1, [sp]
	add r2, sp, #0
	mov r1, #0xd
	bl MBi_CommChangeParentStateCallbackOnly
	ldmia sp!, {r3, pc}
	arm_func_end MBi_CommCallParentError

	arm_func_start MB_GetSegmentLength
MB_GetSegmentLength: ; 0x022C4698
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x60
	mov r4, #0
	movs r7, r0
	mov r5, r4
	beq _022C46E4
	ldr ip, [r7, #0x2c]
	ldr r3, [r7, #0x24]
	add r1, sp, #0
	mov r2, #0x60
	sub r6, ip, r3
	bl FS_ReadFile
	cmp r0, #0x60
	mov r0, r7
	mov r1, r6
	mov r2, #0
	addhs r4, sp, #0
	bl FS_SeekFile
	b _022C46E8
_022C46E4:
	ldr r4, _022C4714 ; =0x027FFE00
_022C46E8:
	cmp r4, #0
	beq _022C4708
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	add r1, r1, #0x268
	add r5, r1, r0
	cmp r5, #0x10000
	movlo r5, #0x10000
_022C4708:
	mov r0, r5
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C4714: .word 0x027FFE00
	arm_func_end MB_GetSegmentLength

	arm_func_start MB_ReadSegment
MB_ReadSegment: ; 0x022C4718
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	str r2, [sp, #4]
	cmp r2, #0x164
	mov r2, #0
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	blo _022C4B70
	ldr r4, [sp, #4]
	mov r5, sb
	str r2, [sp, #0xc]
	mov r6, r2
	mov fp, r2
	cmp sl, #0
	add r5, r5, #0x160
	sub r4, r4, #0x160
	beq _022C4790
	ldr r7, [sl, #0x2c]
	ldr r3, [sl, #0x24]
	mov r2, #0x160
	sub r3, r7, r3
	str r3, [sp, #8]
	bl FS_ReadFile
	cmp r0, #0x160
	ldr r7, [sb, #0x80]
	movlt r4, fp
	cmp r7, #0
	moveq r7, #0x1000000
	b _022C480C
_022C4790:
	ldr r0, _022C4B7C ; =0x027FFE00
	mov r1, #1
	ldr r7, [r0, #0x80]
	add r0, sp, #0x24
	cmp r7, #0
	moveq r7, #0x1000000
	str r1, [sp, #0xc]
	bl FS_InitFile
	ldr r0, _022C4B80 ; =ov00_0231881C
	mov r1, #3
	bl FS_FindArchive
	mov r1, r0
	mvn r0, #0
	str r0, [sp]
	add r0, sp, #0x24
	mov r2, #0
	add r3, r7, #0x88
	bl FS_OpenFileDirect
	ldr r2, [sp, #0x50]
	ldr r1, [sp, #0x48]
	ldr r0, _022C4B7C ; =0x027FFE00
	sub r1, r2, r1
	str r1, [sp, #8]
	mov r1, sb
	mov r2, #0x160
	add sl, sp, #0x24
	bl MI_CpuCopy8
	ldr r0, [sb, #0x60]
	orr r0, r0, #0x6000
	orr r0, r0, #0x400000
	str r0, [sb, #0x60]
_022C480C:
	cmp r4, #0x88
	movlo r4, #0
	blo _022C4844
	ldr r1, [sp, #8]
	mov r0, sl
	add r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	mov r1, r5
	mov r2, #0x88
	bl FS_ReadFile
	add r5, r5, #0x88
	sub r4, r4, #0x88
_022C4844:
	cmp r4, #0x70
	blo _022C48BC
	mov r0, r5
	mov r6, r5
	bl MBi_InitCache
	mov r0, #3
	str r0, [sp]
	mov r0, r6
	mov r1, #0
	mov r2, #0x160
	mov r3, sb
	add r5, r5, #0x70
	sub r4, r4, #0x70
	bl MBi_AttachCacheBuffer
	ldr r8, [sl, #8]
	mov r7, #0
	b _022C488C
_022C4888:
	add r7, r7, #1
_022C488C:
	cmp r7, #3
	bge _022C48A0
	ldrsb r0, [r8, r7]
	cmp r0, #0
	bne _022C4888
_022C48A0:
	mov r0, r8
	mov r2, r7
	add r1, r6, #0x10
	bl MI_CpuCopy8
	str r7, [r6, #0x14]
	str r8, [r6, #0x18]
	b _022C48C0
_022C48BC:
	mov r4, #0
_022C48C0:
	cmp r4, #0x10
	movlo r4, #0
	blo _022C4910
	mov r0, #0
	str r0, [r5]
	ldr r1, [sl, #0x24]
	ldr r0, [sp, #8]
	ldr r2, [sb, #0x20]
	add r0, r0, r1
	add r0, r2, r0
	str r0, [r5, #4]
	ldr r1, [sl, #0x24]
	ldr r0, [sp, #8]
	ldr r2, [sb, #0x30]
	add r0, r0, r1
	add r0, r2, r0
	mov fp, r5
	str r0, [r5, #8]
	add r5, r5, #0x10
	sub r4, r4, #0x10
_022C4910:
	ldr r1, [sb, #0x2c]
	ldr r0, [sb, #0x3c]
	add r0, r1, r0
	cmp r4, r0
	blo _022C49B8
	ldr r7, [sl, #0x24]
	ldr r1, [fp, #4]
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	ldr r2, [sb, #0x2c]
	mov r0, sl
	mov r1, r5
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	ldr r1, [fp, #4]
	ldr r2, [sb, #0x2c]
	mov r0, r6
	mov r3, r5
	bl MBi_AttachCacheBuffer
	ldr r1, [fp, #8]
	ldr r4, [sb, #0x2c]
	mov r0, sl
	mov r2, #0
	sub r1, r1, r7
	bl FS_SeekFile
	ldr r2, [sb, #0x3c]
	mov r0, sl
	add r1, r5, r4
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	ldr r1, [fp, #8]
	ldr r2, [sb, #0x3c]
	add r3, r5, r4
	mov r0, r6
	bl MBi_AttachCacheBuffer
	mov r0, #1
	str r0, [sp, #0x10]
	b _022C4A8C
_022C49B8:
	cmp r4, #0xcc00
	blo _022C4A8C
	ldr r7, [sl, #0x24]
	ldr r4, [fp, #4]
	mov r0, sl
	sub r1, r4, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	mov r1, r5
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	mov r0, r6
	mov r1, r4
	mov r2, #0x4400
	mov r3, r5
	bl MBi_AttachCacheBuffer
	add r1, r4, #0x4400
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	add r1, r5, #0x4400
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #2
	str r0, [sp]
	mov r0, r6
	add r1, r4, #0x4400
	mov r2, #0x4400
	add r3, r5, #0x4400
	bl MBi_AttachCacheBuffer
	add r1, r4, #0x8800
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	add r1, r5, #0x8800
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #2
	str r0, [sp]
	add r1, r4, #0x8800
	add r3, r5, #0x8800
	mov r0, r6
	mov r2, #0x4400
	bl MBi_AttachCacheBuffer
	mov r0, #1
	str r0, [sp, #0x10]
_022C4A8C:
	ldr r1, [sp, #8]
	mov r0, sl
	mov r2, #0
	bl FS_SeekFile
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _022C4B58
	add r0, sp, #0x24
	bl FS_CloseFile
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022C4B58
	ldr r1, [sb, #0x20]
	ldr r0, _022C4B84 ; =ov00_02318818
	str r1, [sp, #0x14]
	ldr r2, [sb, #0x28]
	ldr r1, [sb, #0x20]
	ldr r4, [r0]
	sub r0, r2, r1
	str r0, [sp, #0x18]
	ldr r2, [r6, #0x48]
	ldr r1, [sb, #0x20]
	add r0, sp, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x1c]
	ldr r1, [sp, #4]
	mov r2, #0x8000
	str r1, [sp, #0x20]
	mov r1, #0x4000
	mov r3, #1
	bl MBi_ReadSegmentHeader
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022C4B40
	add r7, sp, #0x14
	mov r5, #0
_022C4B1C:
	ldmia r4, {r1, r2}
	mov r0, r7
	mov r3, r5
	add r2, r1, r2
	bl MBi_ReadSegmentHeader
	add r4, r4, #8
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _022C4B1C
_022C4B40:
	ldr r1, [sb, #0x28]
	ldr r2, _022C4B88 ; =_02000AAC
	ldr r3, [r6, #0x48]
	ldr r0, _022C4B8C ; =0xE12FFF1E
	sub r1, r2, r1
	str r0, [r3, r1]
_022C4B58:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022C4B70
	ldr r1, [sp, #4]
	mov r0, sb
	bl DC_FlushRange
_022C4B70:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C4B7C: .word 0x027FFE00
_022C4B80: .word ov00_0231881C
_022C4B84: .word ov00_02318818
_022C4B88: .word _start_AutoloadDoneCallback
_022C4B8C: .word 0xE12FFF1E
	arm_func_end MB_ReadSegment

	arm_func_start MBi_ReadSegmentHeader
MBi_ReadSegmentHeader: ; 0x022C4B90
	stmdb sp!, {r3, lr}
	mov lr, r1
	ldr ip, [r0]
	ldr r1, [r0, #0xc]
	cmp lr, #0x4000
	movlo lr, #0x4000
	cmp r2, #0x8000
	movhi r2, #0x8000
	cmp lr, ip
	add r1, ip, r1
	movlo lr, ip
	cmp r2, r1
	movhi r2, r1
	cmp lr, r2
	ldmhsia sp!, {r3, pc}
	cmp r3, #0
	beq _022C4BEC
	ldr r0, [r0, #8]
	sub r2, r2, lr
	add r0, r0, lr
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, pc}
_022C4BEC:
	ldr r3, [r0, #4]
	ldr r1, [r0, #8]
	add r0, r3, lr
	add r1, r1, lr
	sub r2, r2, lr
	bl MI_CpuCopy8
	ldmia sp!, {r3, pc}
	arm_func_end MBi_ReadSegmentHeader

	arm_func_start MB_RegisterFile
MB_RegisterFile: ; 0x022C4C08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r4, #0xff
	bl EnableIrqFlag
	mov r5, r0
	bl MBi_IsStarted
	cmp r0, #0
	bne _022C4C3C
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C4C3C:
	ldr r0, _022C4E8C ; =ov00_0232502C
	ldr r0, [r0]
	add r1, r0, #0x1000
	ldrb r1, [r1, #0x524]
	add r1, r1, #1
	cmp r1, #0x10
	ble _022C4C68
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C4C68:
	ldr r1, _022C4E90 ; =0x000005D4
	mov r6, #0
_022C4C70:
	mla r2, r6, r1, r0
	add r2, r2, #0x1000
	ldr r3, [r2, #0xd40]
	cmp r3, r8
	bne _022C4C94
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C4C94:
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	moveq r4, r6
	beq _022C4CB4
	add r2, r6, #1
	and r6, r2, #0xff
	cmp r6, #0x10
	blo _022C4C70
_022C4CB4:
	cmp r6, #0x10
	bne _022C4CCC
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C4CCC:
	ldr r1, _022C4E90 ; =0x000005D4
	ldr r2, _022C4E8C ; =ov00_0232502C
	mul r6, r4, r1
	add r0, r0, r6
	add r0, r0, #0x1000
	str r8, [r0, #0xd40]
	ldr r0, [r2]
	mov r1, r7
	add r0, r0, #0x388
	add r0, r0, #0x1400
	add sb, r0, r6
	mov r0, sb
	bl MBi_MakeDownloadFileInfo
	add r0, r8, #0x1c
	add r1, sb, #0xc4
	mov r2, #0x20
	bl MI_CpuCopy8
	ldr r0, _022C4E8C ; =ov00_0232502C
	mov r1, sb
	ldr r0, [r0]
	add r0, r0, #0x12c
	add r0, r0, #0x1c00
	add r0, r0, r6
	bl MBi_MakeBlockInfoTable
	cmp r0, #0
	bne _022C4D44
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022C4D44:
	ldr r0, _022C4E8C ; =ov00_0232502C
	mov r1, r8
	ldr r2, [r0]
	add r0, r2, #0x6c
	add r0, r0, #0x1800
	add r0, r0, r6
	add r2, r2, #0x1300
	bl MBi_MakeGameInfo
	ldr r1, _022C4E8C ; =ov00_0232502C
	ldr r0, [r1]
	add r0, r0, r6
	add r0, r0, #0x1000
	strb r4, [r0, #0xd21]
	ldr r0, [r1]
	add r0, r0, #0x6c
	add r0, r0, #0x1800
	add r0, r0, r6
	bl MB_AddGameInfo
	ldr r2, _022C4E8C ; =ov00_0232502C
	ldr r3, _022C4E94 ; =ov00_0231F568
	ldr r1, [r2]
	ldrb r0, [r3]
	add r1, r1, r6
	add r1, r1, #0x1000
	strb r0, [r1, #0xd1f]
	ldr r1, [r2]
	mov r4, #1
	add r1, r1, r6
	add r1, r1, #0x1d00
	strh r4, [r1, #0x4e]
	ldr r1, [r2]
	add r8, r7, #0x1e8
	add r1, r1, r6
	add r1, r1, #0x1000
	str r7, [r1, #0xd44]
	ldr r1, [r2]
	add r4, r7, #0x258
	add r1, r1, r6
	add r1, r1, #0x1000
	str r8, [r1, #0xd54]
	ldr r1, [r2]
	add r7, r0, #1
	add r0, r1, r6
	add r0, r0, #0x1000
	str r4, [r0, #0xd58]
	ldr r0, [r2]
	strb r7, [r3]
	add r0, r0, r6
	add r0, r0, #0x1000
	ldr r0, [r0, #0xd54]
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	beq _022C4E50
	bl MBi_IsTaskAvailable
	cmp r0, #0
	bne _022C4E50
	ldr r0, _022C4E8C ; =ov00_0232502C
	ldr r0, [r0]
	add r0, r0, #0xce0
	add r0, r0, #0x7000
	bl MBi_InitTaskInfo
	ldr r0, _022C4E8C ; =ov00_0232502C
	mov r1, #0x800
	ldr r0, [r0]
	add r0, r0, #0x4e0
	add r0, r0, #0x7000
	bl MBi_InitTaskThread
_022C4E50:
	ldr r2, _022C4E8C ; =ov00_0232502C
	mov r3, #1
	ldr r1, [r2]
	mov r0, r5
	add r1, r1, r6
	add r1, r1, #0x1000
	strb r3, [r1, #0xd52]
	ldr r1, [r2]
	add r1, r1, #0x1000
	ldrb r2, [r1, #0x524]
	add r2, r2, #1
	strb r2, [r1, #0x524]
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C4E8C: .word ov00_0232502C
_022C4E90: .word 0x000005D4
_022C4E94: .word ov00_0231F568
	arm_func_end MB_RegisterFile

	arm_func_start MBi_MakeDownloadFileInfo
MBi_MakeDownloadFileInfo: ; 0x022C4E98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r2, #0x22c0000
	mov r4, r1
	mov r5, r0
	str r2, [sp]
	ldr r0, [r4, #0x24]
	ldr r7, _022C4F08 ; =ov00_0231812C
	str r0, [r5]
	ldr r0, [r4, #0x34]
	add r8, r5, #0xc
	str r0, [r5, #4]
	mov sb, #0
	add r6, sp, #0
_022C4ECC:
	mov r0, r4
	mov r1, r7
	mov r2, r8
	mov r3, r6
	bl MBi_SetSegmentInfo
	add sb, sb, #1
	cmp sb, #3
	add r8, r8, #0x10
	add r7, r7, #4
	blt _022C4ECC
	add r0, r4, #0x160
	add r1, r5, #0x3c
	mov r2, #0x88
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C4F08: .word ov00_0231812C
	arm_func_end MBi_MakeDownloadFileInfo

	arm_func_start MBi_SetSegmentInfo
MBi_SetSegmentInfo: ; 0x022C4F0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, [r1]
	mov r7, r0
	mov r6, r2
	mov r5, r3
	cmp r1, #0
	beq _022C4F3C
	cmp r1, #1
	beq _022C4F88
	cmp r1, #2
	beq _022C5058
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C4F3C:
	ldr r0, [r7, #0x28]
	cmp r0, #0x2000000
	blo _022C4F80
	cmp r0, #0x22c0000
	bhs _022C4F80
	ldr r1, [r7, #0x2c]
	add r0, r0, r1
	cmp r0, #0x22c0000
	bhi _022C4F80
	str r1, [r6, #8]
	ldr r0, [r7, #0x28]
	str r0, [r6, #4]
	str r0, [r6]
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C4F80:
	bl WaitForever2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C4F88:
	ldr ip, [r7, #0x38]
	ldr r1, [r7, #0x3c]
	mov r2, #0
	mov r4, r2
	cmp ip, #0x2000000
	add r3, ip, r1
	blo _022C4FD4
	ldr r0, _022C5078 ; =0x023FE800
	cmp ip, r0
	bhs _022C4FD4
	cmp r3, #0x2300000
	bls _022C5000
	cmp r3, r0
	bhs _022C4FCC
	cmp r1, #0x40000
	movls r4, #1
	bls _022C5000
_022C4FCC:
	mov r2, #1
	b _022C5000
_022C4FD4:
	ldr r1, _022C507C ; =0x037F8000
	cmp ip, r1
	blo _022C4FFC
	add r0, r1, #0x17000
	cmp ip, r0
	bhs _022C4FFC
	cmp r3, r0
	movls r4, #1
	movhi r2, #1
	b _022C5000
_022C4FFC:
	mov r2, #1
_022C5000:
	cmp r2, #1
	bne _022C500C
	bl WaitForever2
_022C500C:
	ldr r0, [r7, #0x3c]
	cmp r4, #0
	str r0, [r6, #8]
	ldr r0, [r7, #0x38]
	str r0, [r6, #4]
	ldreq r0, [r6, #4]
	streq r0, [r6]
	beq _022C5044
	ldr r0, [r5]
	str r0, [r6]
	ldr r1, [r5]
	ldr r0, [r6, #8]
	add r0, r1, r0
	str r0, [r5]
_022C5044:
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C5058:
	ldr r0, _022C5080 ; =0x027FFE00
	mov r1, #0x160
	stmib r6, {r0, r1}
	str r0, [r6]
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C5078: .word 0x023FE800
_022C507C: .word 0x037F8000
_022C5080: .word 0x027FFE00
	arm_func_end MBi_SetSegmentInfo

	arm_func_start MBi_MakeBlockInfoTable
MBi_MakeBlockInfoTable: ; 0x022C5084
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	add r6, sl, #0xc
	cmp r1, #0
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r2, r0
_022C50A0:
	str r0, [sl, r2, lsl #2]
	add r3, r1, r2, lsl #4
	add r2, r2, #1
	ldr r3, [r3, #0x14]
	and r2, r2, #0xff
	cmp r2, #3
	add r0, r0, r3
	blo _022C50A0
	mov sb, #0
	ldr r4, _022C514C ; =ov00_0232502C
	strh sb, [r6]
	add r5, r1, #0xc
_022C50D0:
	ldr r0, [r4]
	add r7, r5, sb, lsl #4
	add r0, r0, #0x1000
	ldr r1, [r0, #0x318]
	ldr r8, [r7, #8]
	add r0, r8, r1
	sub r0, r0, #1
	bl _u32_div_f
	mov r1, sb, lsl #1
	ldrh r3, [r6, r1]
	mov r2, r0, lsl #0x10
	ldr r1, [r7, #4]
	add r2, r3, r2, lsr #16
	mov r3, r2, lsl #0x10
	mov r0, sb
	mov r2, r8
	mov r7, r3, lsr #0x10
	bl IsAbleToLoad
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp sb, #2
	addlo r0, r6, sb, lsl #1
	strloh r7, [r0, #2]
	add r0, sb, #1
	and sb, r0, #0xff
	strhsh r7, [sl, #0x12]
	cmp sb, #3
	blo _022C50D0
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022C514C: .word ov00_0232502C
	arm_func_end MBi_MakeBlockInfoTable

	arm_func_start MBi_Get_BlockInfo
MBi_Get_BlockInfo: ; 0x022C5150
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r4, [r1, #0x12]
	cmp r2, r4
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	mov ip, #2
_022C5168:
	add r4, r1, ip, lsl #1
	ldrh r4, [r4, #0xc]
	cmp r2, r4
	bhs _022C5188
	sub r4, ip, #1
	mov ip, r4, lsl #0x18
	movs ip, ip, asr #0x18
	bpl _022C5168
_022C5188:
	cmp ip, #0
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r4, _022C5200 ; =ov00_0232502C
	add r5, r1, ip, lsl #1
	ldr lr, [r4]
	ldrh r5, [r5, #0xc]
	add lr, lr, #0x1000
	ldr lr, [lr, #0x318]
	sub r5, r2, r5
	mul r2, r5, lr
	add r3, r3, #0xc
	add r5, r3, ip, lsl #4
	ldr r3, [r5, #8]
	sub lr, r3, r2
	str lr, [r0, #4]
	ldr r3, [r4]
	add r3, r3, #0x1000
	ldr r3, [r3, #0x318]
	cmp lr, r3
	strhi r3, [r0, #4]
	ldr r1, [r1, ip, lsl #2]
	add r1, r2, r1
	str r1, [r0, #8]
	ldr r1, [r5]
	add r1, r2, r1
	str r1, [r0]
	strb ip, [r0, #0xc]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C5200: .word ov00_0232502C
	arm_func_end MBi_Get_BlockInfo

	arm_func_start MBi_IsAbleToRecv
MBi_IsAbleToRecv: ; 0x022C5204
	ldr r3, _022C52A8 ; =ov00_0231812C
	ldr r0, [r3, r0, lsl #2]
	cmp r0, #0
	beq _022C5248
	cmp r0, #1
	beq _022C5264
	cmp r0, #2
	bne _022C5298
	ldr r0, _022C52AC ; =0x027FFE00
	cmp r1, r0
	blo _022C52A0
	add r1, r1, r2
	add r0, r0, #0x160
	cmp r1, r0
	bhi _022C52A0
	mov r0, #1
	bx lr
_022C5248:
	cmp r1, #0x2000000
	blo _022C52A0
	add r0, r1, r2
	cmp r0, #0x22c0000
	bhi _022C52A0
	mov r0, #1
	bx lr
_022C5264:
	cmp r1, #0x22c0000
	blo _022C527C
	add r0, r1, r2
	cmp r0, #0x2300000
	movls r0, #1
	bxls lr
_022C527C:
	cmp r1, #0x2000000
	blo _022C52A0
	add r0, r1, r2
	cmp r0, #0x2300000
	bhi _022C52A0
	mov r0, #1
	bx lr
_022C5298:
	mov r0, #0
	bx lr
_022C52A0:
	mov r0, #0
	bx lr
	.align 2, 0
_022C52A8: .word ov00_0231812C
_022C52AC: .word 0x027FFE00
	arm_func_end MBi_IsAbleToRecv

	arm_func_start IsAbleToLoad
IsAbleToLoad: ; 0x022C52B0
	stmdb sp!, {r3, lr}
	ldr r3, _022C5370 ; =ov00_0231812C
	ldr r3, [r3, r0, lsl #2]
	cmp r3, #0
	beq _022C52D4
	cmp r3, #1
	beq _022C52DC
	cmp r3, #2
	bne _022C5360
_022C52D4:
	bl MBi_IsAbleToRecv
	ldmia sp!, {r3, pc}
_022C52DC:
	cmp r1, #0x2000000
	blo _022C5334
	ldr r0, _022C5374 ; =0x023FE800
	cmp r1, r0
	bhs _022C5334
	cmp r1, #0x2300000
	add r1, r1, r2
	bhs _022C5308
	cmp r1, #0x2300000
	movhi r0, #0
	ldmhiia sp!, {r3, pc}
_022C5308:
	cmp r1, #0x2300000
	movls r0, #1
	ldmlsia sp!, {r3, pc}
	ldr r0, _022C5374 ; =0x023FE800
	cmp r1, r0
	bhs _022C532C
	cmp r2, #0x40000
	movls r0, #1
	ldmlsia sp!, {r3, pc}
_022C532C:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022C5334:
	ldr r3, _022C5378 ; =0x037F8000
	cmp r1, r3
	blo _022C5368
	add r0, r3, #0x17000
	cmp r1, r0
	bhs _022C5368
	add r1, r1, r2
	cmp r1, r0
	movls r0, #1
	movhi r0, #0
	ldmia sp!, {r3, pc}
_022C5360:
	mov r0, #0
	ldmia sp!, {r3, pc}
_022C5368:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C5370: .word ov00_0231812C
_022C5374: .word 0x023FE800
_022C5378: .word 0x037F8000
	arm_func_end IsAbleToLoad

	arm_func_start MBi_BlockHeaderEnd
MBi_BlockHeaderEnd: ; 0x022C537C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	add r2, r6, #0x1f
	mov r5, r1
	mov r0, r4
	bic r1, r2, #0x1f
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl MBi_SendMP
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MBi_BlockHeaderEnd

	arm_func_start MBi_Calc_Cksum
MBi_Calc_Cksum: ; 0x022C53B4
	mov r3, r1, asr #1
	cmp r3, #0
	mov r2, #0
	ble _022C53D8
_022C53C4:
	ldrh r1, [r0], #2
	sub r3, r3, #1
	cmp r3, #0
	add r2, r2, r1
	bgt _022C53C4
_022C53D8:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	add r1, r0, r2, lsr #16
	ldr r0, _022C53FC ; =0x0000FFFF
	add r1, r1, r1, lsr #16
	eor r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_022C53FC: .word 0x0000FFFF
	arm_func_end MBi_Calc_Cksum

	arm_func_start MBi_MakeGameInfo
MBi_MakeGameInfo: ; 0x022C5400
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r1, r6
	mov r0, #0
	mov r2, #0x4c0
	bl MTi_CpuClear16
	mov r0, #0
	strb r0, [r6, #0x4b2]
	ldr r0, [r5, #0xc]
	mov r1, r6
	mov r2, #1
	bl MBi_ReadIconInfo
	cmp r0, #0
	moveq r7, #1
	ldr r0, [r5, #0x10]
	mov r1, r6
	mov r2, #0
	movne r7, #0
	bl MBi_ReadIconInfo
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	orrs r0, r7, r0
	beq _022C5480
	mov r3, #1
	mov r1, r6
	mov r0, #0
	mov r2, #0x220
	strb r3, [r6, #0x4b2]
	bl MTi_CpuClearFast
_022C5480:
	ldr r0, [r5, #0x14]
	cmp r4, #0
	str r0, [r6, #0x4b8]
	beq _022C54A0
	mov r0, r4
	add r1, r6, #0x220
	mov r2, #0x16
	bl MTi_CpuCopy16
_022C54A0:
	ldrb r0, [r5, #0x18]
	strb r0, [r6, #0x236]
	ldr r0, [r5, #4]
	bl Mystrlen_MB
	mov r2, r0, lsl #0x11
	ldr r0, [r5, #4]
	add r1, r6, #0x238
	mov r2, r2, lsr #0x10
	bl MTi_CpuCopy16
	ldr r0, [r5, #8]
	add r1, r6, #0x298
	mov r2, #0xc0
	bl MTi_CpuCopy16
	mov r1, #1
	strb r1, [r6, #0x358]
	add r0, r6, #0x300
	strh r1, [r0, #0x5a]
	add r0, r6, #0x400
	strh r1, [r0, #0xb0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MBi_MakeGameInfo

	arm_func_start MBi_ReadIconInfo
MBi_ReadIconInfo: ; 0x022C54F0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	cmp r2, #0
	movne r4, #0x200
	moveq r4, #0x20
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	addne r5, r5, #0x20
	cmp r6, #0
	addeq sp, sp, #0x48
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, sp, #0
	bl FS_InitFile
	add r0, sp, #0
	mov r1, r6
	bl FS_OpenFile
	cmp r0, #0
	addeq sp, sp, #0x48
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r0, r1, r0
	cmp r4, r0
	add r0, sp, #0
	beq _022C5570
	bl FS_CloseFile
	add sp, sp, #0x48
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022C5570:
	mov r1, r5
	mov r2, r4
	bl FS_ReadFile
	add r0, sp, #0
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MBi_ReadIconInfo

	arm_func_start MB_UpdateGameInfoMember
MB_UpdateGameInfoMember: ; 0x022C5590
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r2
	add r4, r6, #0x5e
	mov r0, r1
	add r1, r4, #0x300
	ldr r2, _022C55FC ; =0x0000014A
	mov r4, r3
	mov r7, #1
	bl MTi_CpuCopy16
	mov r2, #0
	mov r1, #2
_022C55C0:
	tst r5, r1, lsl r2
	addne r0, r7, #1
	add r2, r2, #1
	andne r7, r0, #0xff
	cmp r2, #0xf
	blt _022C55C0
	strb r7, [r6, #0x358]
	orr r1, r5, #1
	add r0, r6, #0x300
	strh r1, [r0, #0x5a]
	strh r4, [r0, #0x5c]
	ldrb r0, [r6, #0x4b4]
	add r0, r0, #1
	strb r0, [r6, #0x4b4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C55FC: .word 0x0000014A
	arm_func_end MB_UpdateGameInfoMember

	arm_func_start Mystrlen_MB
Mystrlen_MB: ; 0x022C5600
	ldrh r1, [r0], #2
	mov r2, #0
	cmp r1, #0
	beq _022C5620
_022C5610:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r1, #0
	bne _022C5610
_022C5620:
	mov r0, r2
	bx lr
	arm_func_end Mystrlen_MB

	arm_func_start MB_AddGameInfo
MB_AddGameInfo: ; 0x022C5628
	ldr r1, _022C5668 ; =ov00_0231F580
	ldr r2, [r1, #0x18]
	cmp r2, #0
	streq r0, [r1, #0x18]
	beq _022C565C
	ldr r1, [r2, #0x4bc]
	cmp r1, #0
	beq _022C5658
_022C5648:
	mov r2, r1
	ldr r1, [r1, #0x4bc]
	cmp r1, #0
	bne _022C5648
_022C5658:
	str r0, [r2, #0x4bc]
_022C565C:
	mov r1, #0
	str r1, [r0, #0x4bc]
	bx lr
	.align 2, 0
_022C5668: .word ov00_0231F580
	arm_func_end MB_AddGameInfo

	arm_func_start MB_InitSendGameInfoStatus
MB_InitSendGameInfoStatus: ; 0x022C566C
	ldr r0, _022C5690 ; =ov00_0231F580
	mov r2, #0
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	mov r1, #1
	strb r1, [r0, #0x24]
	ldr ip, _022C5694 ; =MBi_ClearSendStatus
	str r2, [r0, #0x14]
	bx ip
	.align 2, 0
_022C5690: .word ov00_0231F580
_022C5694: .word MBi_ClearSendStatus
	arm_func_end MB_InitSendGameInfoStatus

	arm_func_start MBi_ClearSendStatus
MBi_ClearSendStatus: ; 0x022C5698
	ldr r0, _022C56B8 ; =ov00_0231F580
	mov r1, #0
	strb r1, [r0, #0x25]
	strb r1, [r0, #0x26]
	strb r1, [r0, #0x27]
	strb r1, [r0, #0x28]
	strb r1, [r0, #0x29]
	bx lr
	.align 2, 0
_022C56B8: .word ov00_0231F580
	arm_func_end MBi_ClearSendStatus

	arm_func_start MB_SendGameInfoBeacon
MB_SendGameInfoBeacon: ; 0x022C56BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _022C5744 ; =ov00_0231F580
	mov r7, r0
	mov r6, r1
	mov r5, r2
_022C56D0:
	ldrb r0, [r4, #0x24]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022C56D0
_022C56E0: ; jump table
	b _022C56FC ; case 0
	b _022C56FC ; case 1
	b _022C570C ; case 2
	b _022C5714 ; case 3
	b _022C5728 ; case 4
	b _022C5730 ; case 5
	b _022C56D0 ; case 6
_022C56FC:
	bl MBi_ReadyBeaconSendStatus
	cmp r0, #0
	bne _022C56D0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C570C:
	bl MBi_InitSendFixedBeacon
	b _022C56D0
_022C5714:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl MBi_SendFixedBeacon
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C5728:
	bl MBi_InitSendVolatBeacon
	b _022C56D0
_022C5730:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl MBi_SendVolatBeacon
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C5744: .word ov00_0231F580
	arm_func_end MB_SendGameInfoBeacon

	arm_func_start MBi_ReadyBeaconSendStatus
MBi_ReadyBeaconSendStatus: ; 0x022C5748
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _022C57E0 ; =ov00_0231F580
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _022C5798
	bl MBi_GetGgid
	mov r4, r0
	bl MBi_GetTgid
	str r0, [sp]
	mov ip, #8
	ldr r1, _022C57E4 ; =ov00_0231F5C0
	mov r3, r4
	mov r0, #0
	mov r2, #0x70
	str ip, [sp, #4]
	bl WM_SetGameInfo
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_022C5798:
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldrne r1, [r0, #0x4bc]
	cmpne r1, #0
	ldreq r0, _022C57E0 ; =ov00_0231F580
	ldreq r1, [r0, #0x18]
	ldr r0, _022C57E0 ; =ov00_0231F580
	str r1, [r0, #0x1c]
	bl MBi_ClearSendStatus
	ldr r1, _022C57E0 ; =ov00_0231F580
	mov r2, #2
	ldr r3, [r1, #0x1c]
	mov r0, #1
	ldrb r3, [r3, #0x4b4]
	strb r3, [r1, #0x26]
	strb r2, [r1, #0x24]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C57E0: .word ov00_0231F580
_022C57E4: .word ov00_0231F5C0
	arm_func_end MBi_ReadyBeaconSendStatus

	arm_func_start MBi_InitSendFixedBeacon
MBi_InitSendFixedBeacon: ; 0x022C57E8
	ldr r0, _022C5838 ; =ov00_0231F580
	ldrb r1, [r0, #0x24]
	cmp r1, #2
	bxne lr
	ldr r2, [r0, #0x1c]
	ldrb r1, [r2, #0x4b2]
	cmp r1, #0
	bne _022C5818
	mov r1, #9
	strb r1, [r0, #0x28]
	str r2, [r0, #0x20]
	b _022C5828
_022C5818:
	mov r1, #4
	strb r1, [r0, #0x28]
	add r1, r2, #0x220
	str r1, [r0, #0x20]
_022C5828:
	ldr r0, _022C5838 ; =ov00_0231F580
	mov r1, #3
	strb r1, [r0, #0x24]
	bx lr
	.align 2, 0
_022C5838: .word ov00_0231F580
	arm_func_end MBi_InitSendFixedBeacon

	arm_func_start MBi_SendFixedBeacon
MBi_SendFixedBeacon: ; 0x022C583C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _022C5990 ; =ov00_0231F580
	mov r6, r0
	ldr r4, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	add ip, r4, #0x358
	add r7, r0, #0x62
	cmp r7, ip
	movls r0, #0x62
	mov r5, r1
	mov r4, r2
	strlsb r0, [r3, #0x4c]
	bls _022C5894
	sub r7, ip, r0
	and r1, r7, #0xff
	ldr r0, _022C5994 ; =ov00_0231F5CE
	rsb r2, r1, #0x62
	add r1, r0, r1
	mov r0, #0
	strb r7, [r3, #0x4c]
	bl MTi_CpuClear16
_022C5894:
	ldr r0, _022C5990 ; =ov00_0231F580
	ldr r1, _022C5994 ; =ov00_0231F5CE
	ldrb r2, [r0, #0x4c]
	ldr r0, [r0, #0x20]
	bl MTi_CpuCopy16
	ldr r2, _022C5990 ; =ov00_0231F580
	ldr r0, _022C5998 ; =ov00_0231F5C8
	ldrb r7, [r2, #0x27]
	mov r3, #0
	mov r1, #0x68
	strb r7, [r2, #0x4a]
	ldrb r7, [r2, #0x28]
	strb r7, [r2, #0x4b]
	ldr r7, [r2, #0x1c]
	ldrb lr, [r2, #0x44]
	ldrb ip, [r7, #0x4b2]
	bic lr, lr, #3
	and ip, ip, #3
	orr ip, lr, ip
	strb ip, [r2, #0x44]
	ldrb ip, [r7, #0x4b3]
	strb ip, [r2, #0x45]
	ldrb ip, [r2, #0x26]
	strb ip, [r2, #0x46]
	ldr ip, [r7, #0x4b8]
	str ip, [r2, #0x40]
	ldrb lr, [r2, #0x44]
	ldrb ip, [r7, #0x4b5]
	bic lr, lr, #0xfc
	mov ip, ip, lsl #0x1a
	orr ip, lr, ip, lsr #24
	strb ip, [r2, #0x44]
	ldrb lr, [r2, #0x29]
	add ip, lr, #1
	strb ip, [r2, #0x29]
	strb lr, [r2, #0x47]
	strh r3, [r2, #0x48]
	bl MBi_Calc_Cksum
	ldr r1, _022C5990 ; =ov00_0231F580
	strh r0, [r1, #0x48]
	ldrb r0, [r1, #0x27]
	add r2, r0, #1
	strb r2, [r1, #0x27]
	ldrb r0, [r1, #0x28]
	and r2, r2, #0xff
	cmp r2, r0
	movhs r0, #4
	strhsb r0, [r1, #0x24]
	bhs _022C5964
	ldr r0, [r1, #0x20]
	add r0, r0, #0x62
	str r0, [r1, #0x20]
_022C5964:
	orr r0, r4, #3
	ldr r1, _022C599C ; =ov00_0231F5C0
	mov r3, r6
	str r5, [sp]
	and r4, r0, #0xff
	mov r0, #0
	mov r2, #0x70
	str r4, [sp, #4]
	bl WM_SetGameInfo
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C5990: .word ov00_0231F580
_022C5994: .word ov00_0231F5CE
_022C5998: .word ov00_0231F5C8
_022C599C: .word ov00_0231F5C0
	arm_func_end MBi_SendFixedBeacon

	arm_func_start MBi_InitSendVolatBeacon
MBi_InitSendVolatBeacon: ; 0x022C59A0
	ldr r1, _022C59CC ; =ov00_0231F580
	mov r3, #1
	ldr r0, [r1, #0x1c]
	mov r2, #5
	add r0, r0, #0x400
	strh r3, [r0, #0xb0]
	ldr r0, [r1, #0x1c]
	ldrb r0, [r0, #0x4b4]
	strb r0, [r1, #0x26]
	strb r2, [r1, #0x24]
	bx lr
	.align 2, 0
_022C59CC: .word ov00_0231F580
	arm_func_end MBi_InitSendVolatBeacon

	arm_func_start MBi_SendVolatBeacon
MBi_SendVolatBeacon: ; 0x022C59D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r3, _022C5C28 ; =ov00_0231F580
	str r0, [sp, #8]
	ldr r0, [r3, #0x1c]
	ldrb r3, [r3, #0x26]
	ldrb r0, [r0, #0x4b4]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	cmp r3, r0
	beq _022C5A00
	bl MBi_InitSendVolatBeacon
_022C5A00:
	ldr r2, _022C5C28 ; =ov00_0231F580
	ldrb r0, [r2, #0x44]
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r2, #0x44]
	ldr r0, [r2, #0x1c]
	ldrb r3, [r0, #0x4b3]
	add r1, r0, #0x300
	strb r3, [r2, #0x45]
	ldrb r3, [r2, #0x26]
	strb r3, [r2, #0x46]
	ldr r3, [r0, #0x4b8]
	str r3, [r2, #0x40]
	ldrb r4, [r2, #0x44]
	ldrb r3, [r0, #0x4b5]
	bic r4, r4, #0xfc
	mov r3, r3, lsl #0x1a
	orr r3, r4, r3, lsr #24
	strb r3, [r2, #0x44]
	ldrb r4, [r2, #0x29]
	add r3, r4, #1
	strb r3, [r2, #0x29]
	strb r4, [r2, #0x47]
	ldrb r3, [r0, #0x358]
	strb r3, [r2, #0x4a]
	ldrh r3, [r1, #0x5a]
	strh r3, [r2, #0x4c]
	ldrh r1, [r1, #0x5c]
	strh r1, [r2, #0x4e]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	bne _022C5A94
	ldr r1, [r2, #0x14]
	cmp r1, #0
	beq _022C5A94
	ldr r0, [r0, #0x4b8]
	blx r1
_022C5A94:
	ldr r0, _022C5C28 ; =ov00_0231F580
	mov sb, #0
	ldr r1, _022C5C2C ; =ov00_0231F628
	ldr r2, [r0, #0x1c]
	b _022C5AB8
_022C5AA8:
	add r0, r2, sb
	ldrb r0, [r0, #0x4a8]
	strb r0, [r1, sb]
	add sb, sb, #1
_022C5AB8:
	cmp sb, #8
	blt _022C5AA8
	ldr r1, _022C5C30 ; =ov00_0231F5D0
	mov r0, #0
	mov r2, #0x58
	bl MTi_CpuClear16
	ldr r5, _022C5C28 ; =ov00_0231F580
	mov sl, #0
	ldr r1, [r5, #0x1c]
	mov r6, #2
	add r0, r1, #0x400
	add r1, r1, #0x300
	ldrh r2, [r0, #0xb0]
	ldrh r0, [r1, #0x5a]
	mov sb, sl
	ldr r7, _022C5C30 ; =ov00_0231F5D0
	eor r0, r2, r0
	mov r4, r0, lsl #0x10
	mov r8, r6
	mov fp, #0x16
	b _022C5B5C
_022C5B0C:
	mov r0, r8, lsl sb
	tst r0, r4, lsr #16
	beq _022C5B58
	ldr r0, [r5, #0x1c]
	mla r1, sl, fp, r7
	add r0, r0, #0x5e
	add r2, r0, #0x300
	mov r0, #0x16
	mla r0, sb, r0, r2
	mov r2, #0x16
	bl MTi_CpuCopy16
	ldr r0, [r5, #0x1c]
	add sl, sl, #1
	add r0, r0, #0x400
	ldrh r1, [r0, #0xb0]
	cmp sl, #4
	orr r1, r1, r6, lsl sb
	strh r1, [r0, #0xb0]
	beq _022C5B64
_022C5B58:
	add sb, sb, #1
_022C5B5C:
	cmp sb, #0xf
	blt _022C5B0C
_022C5B64:
	cmp sl, #4
	bhs _022C5B84
	mov r0, #0x16
	mul r1, sl, r0
	ldr r2, _022C5C30 ; =ov00_0231F5D0
	ldrb r0, [r2, r1]
	bic r0, r0, #0xf0
	strb r0, [r2, r1]
_022C5B84:
	ldr r2, _022C5C28 ; =ov00_0231F580
	mov r3, #0
	ldr r0, _022C5C34 ; =ov00_0231F5C8
	mov r1, #0x68
	strh r3, [r2, #0x48]
	bl MBi_Calc_Cksum
	ldr r2, _022C5C28 ; =ov00_0231F580
	strh r0, [r2, #0x48]
	ldr r1, [r2, #0x1c]
	add r0, r1, #0x400
	add r1, r1, #0x300
	ldrh r3, [r0, #0xb0]
	ldrh r0, [r1, #0x5a]
	ldr r1, _022C5C38 ; =ov00_0231F5C0
	cmp r3, r0
	moveq r0, #1
	streqb r0, [r2, #0x24]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #8]
	orr r2, r0, #3
	ldr r0, [sp, #0xc]
	and r4, r2, #0xff
	str r0, [sp]
	mov r0, #0
	mov r2, #0x70
	str r4, [sp, #4]
	bl WM_SetGameInfo
	ldr r0, _022C5C28 ; =ov00_0231F580
	ldr r1, [r0, #0x10]
	cmp r1, #1
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r0, #0x14]
	cmp r1, #0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x4b8]
	blx r1
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C5C28: .word ov00_0231F580
_022C5C2C: .word ov00_0231F628
_022C5C30: .word ov00_0231F5D0
_022C5C34: .word ov00_0231F5C8
_022C5C38: .word ov00_0231F5C0
	arm_func_end MBi_SendVolatBeacon

	arm_func_start ChangeScanChannel
ChangeScanChannel: ; 0x022C5C3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl WM_GetAllowedChannel
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r4, #4]
	mov r2, #1
	mov ip, #0
	mov r5, lr
	mov r3, r2
_022C5C68:
	sub r1, r5, #1
	tst r0, r3, lsl r1
	cmpne lr, r5
	strneh r5, [r4, #4]
	bne _022C5CA4
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	cmp r5, #0x10
	mov ip, r1, lsr #0x10
	moveq r1, r2
	addne r1, r5, #1
	mov r1, r1, lsl #0x10
	cmp ip, #0x10
	mov r5, r1, lsr #0x10
	blo _022C5C68
_022C5CA4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ChangeScanChannel

	arm_func_start MBi_IsSendEnabled
MBi_IsSendEnabled: ; 0x022C5CAC
	ldr r1, _022C5D08 ; =ov00_02325020
	mov r0, #0
	ldr ip, [r1, #8]
	mov r3, r0
	add r1, ip, #0x500
	ldrh r1, [r1, #0x28]
	mov r2, r0
	cmp r1, #1
	ldreqb r1, [ip, #0x50c]
	cmpeq r1, #0
	moveq r3, #1
	cmp r3, #0
	beq _022C5CF0
	add r1, ip, #0x500
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	moveq r2, #1
_022C5CF0:
	cmp r2, #0
	addne r1, ip, #0x500
	ldrneh r1, [r1, #0x2a]
	cmpne r1, #0
	movne r0, #1
	bx lr
	.align 2, 0
_022C5D08: .word ov00_02325020
	arm_func_end MBi_IsSendEnabled

	arm_func_start MBi_OnInitializeDone
MBi_OnInitializeDone: ; 0x022C5D0C
	stmdb sp!, {r3, lr}
	ldr r0, _022C5D54 ; =MBi_ParentCallback
	bl WM_SetIndCallback
	mov r1, r0
	mov r0, #0x80
	bl MBi_CheckWmErrcode
	ldr r3, _022C5D58 ; =ov00_02318820
	ldr r0, _022C5D54 ; =MBi_ParentCallback
	ldrh r1, [r3, #4]
	str r1, [sp]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	bl WM_SetLifeTime
	mov r1, r0
	mov r0, #0x1d
	bl MBi_CheckWmErrcode
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C5D54: .word MBi_ParentCallback
_022C5D58: .word ov00_02318820
	arm_func_end MBi_OnInitializeDone

	arm_func_start MBi_EndCommon
MBi_EndCommon: ; 0x022C5D5C
	stmdb sp!, {r3, lr}
	ldr r2, _022C5D9C ; =ov00_02325020
	mov ip, #0
	ldr r3, [r2, #8]
	mov r1, r0
	strb ip, [r3, #0x50d]
	ldr r0, [r2, #0xc]
	add r0, r0, #0x1300
	strh ip, [r0, #0x16]
	ldr r0, [r2, #8]
	ldr r2, [r0, #0x51c]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x11
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C5D9C: .word ov00_02325020
	arm_func_end MBi_EndCommon

	arm_func_start MBi_ParentCallback
MBi_ParentCallback: ; 0x022C5DA0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldrh r1, [r4]
	cmp r1, #0x19
	bgt _022C5E08
	bge _022C5EE4
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _022C65C8
_022C5DC8: ; jump table
	b _022C5E24 ; case 0
	b _022C6398 ; case 1
	b _022C6488 ; case 2
	b _022C65C8 ; case 3
	b _022C65C8 ; case 4
	b _022C65C8 ; case 5
	b _022C65C8 ; case 6
	b _022C5EAC ; case 7
	b _022C5F80 ; case 8
	b _022C65C8 ; case 9
	b _022C65C8 ; case 10
	b _022C65C8 ; case 11
	b _022C65C8 ; case 12
	b _022C64D0 ; case 13
	b _022C61D4 ; case 14
	b _022C6274 ; case 15
_022C5E08:
	cmp r1, #0x1d
	bgt _022C5E18
	beq _022C5E5C
	b _022C65C8
_022C5E18:
	cmp r1, #0x80
	beq _022C6508
	b _022C65C8
_022C5E24:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022C5E50
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5E50:
	bl MBi_OnInitializeDone
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5E5C:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022C5E88
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5E88:
	ldr r1, _022C65E8 ; =ov00_02325020
	ldr r0, _022C65EC ; =MBi_ParentCallback
	ldr r1, [r1, #8]
	bl WM_SetParentParameter
	mov r1, r0
	mov r0, #7
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5EAC:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x15
	ldr r2, [r2, #0x51c]
	blx r2
	ldr r0, _022C65EC ; =MBi_ParentCallback
	mov r1, #1
	bl WM_SetBeaconIndication
	mov r1, r0
	mov r0, #0x19
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5EE4:
	ldr r2, _022C65E8 ; =ov00_02325020
	ldr ip, [r2, #8]
	add r1, ip, #0x500
	ldrh r3, [r1, #0x26]
	cmp r3, #0
	bne _022C5F44
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022C5F20
	ldr r2, [ip, #0x51c]
	mov r1, r4
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5F20:
	ldr r1, _022C65F0 ; =ov00_02318820
	ldr r0, _022C65EC ; =MBi_ParentCallback
	ldr r1, [r1, #0xc]
	bl WMi_StartParentEx
	mov r1, r0
	mov r0, #8
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5F44:
	ldrh r3, [r4, #2]
	cmp r3, #0
	beq _022C5F74
	mov r0, #0
	strh r0, [r1, #0x26]
	ldr r0, [r2, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5F74:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5F80:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022C5FAC
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C5FAC:
	ldrh r0, [r4, #8]
	cmp r0, #7
	bgt _022C5FDC
	bge _022C6024
	cmp r0, #2
	bgt _022C61B4
	cmp r0, #0
	blt _022C61B4
	beq _022C5FFC
	cmp r0, #2
	beq _022C6180
	b _022C61B4
_022C5FDC:
	cmp r0, #9
	bgt _022C5FEC
	beq _022C6144
	b _022C61B4
_022C5FEC:
	cmp r0, #0x1a
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	b _022C61B4
_022C5FFC:
	ldr r1, _022C65E8 ; =ov00_02325020
	mov r2, #0
	ldr r0, [r1, #8]
	add sp, sp, #0x1c
	add r0, r0, #0x500
	strh r2, [r0, #0x2a]
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	strh r2, [r0, #0x28]
	ldmia sp!, {r3, r4, pc}
_022C6024:
	ldr r2, _022C65E8 ; =ov00_02325020
	ldr r0, [r2, #8]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x26]
	cmp r1, #1
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldrh lr, [r0, #0x2a]
	ldrh r3, [r4, #0x10]
	mov ip, #1
	mov r1, r4
	orr r3, lr, ip, lsl r3
	strh r3, [r0, #0x2a]
	ldr r2, [r2, #8]
	mov r0, #0
	ldr r2, [r2, #0x51c]
	blx r2
	ldr r1, _022C65E8 ; =ov00_02325020
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _022C6114
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r2, [r0, #0x31c]
	cmp r2, #0
	bne _022C6114
	mov r2, #1
	str r2, [r0, #0x31c]
	ldr r0, [r1, #8]
	ldr r1, _022C65E8 ; =ov00_02325020
	add r0, r0, #0x500
	ldrh r0, [r0, #0x2c]
	ldr ip, [r1, #8]
	mov r1, #1
	cmp r0, #0
	movne r2, #0
	mov r0, r2, lsl #0x10
	mov r3, r0, lsr #0x10
	add r0, ip, #0x500
	ldrh r4, [r0, #0x18]
	mov r2, #0
	str r4, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldrh r2, [r0, #0x1a]
	ldr r1, [ip, #0x504]
	ldr r0, _022C65EC ; =MBi_ParentCallback
	add r3, ip, #0x40
	bl WM_StartMpEx
	mov r1, r0
	mov r0, #0xe
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6114:
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldr r1, _022C65E8 ; =ov00_02325020
	mov r0, #0x19
	ldr r2, [r1, #8]
	mov r1, #0
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6144:
	ldr r2, _022C65E8 ; =ov00_02325020
	ldrh r3, [r4, #0x10]
	ldr r1, [r2, #8]
	mov r0, #1
	add r1, r1, #0x500
	ldrh ip, [r1, #0x2a]
	mvn r3, r0, lsl r3
	and r3, ip, r3
	strh r3, [r1, #0x2a]
	ldr r2, [r2, #8]
	mov r1, r4
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6180:
	ldr r0, _022C65E8 ; =ov00_02325020
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #1
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r1, r4
	mov r0, #0x1c
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C61B4:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C61D4:
	ldr r2, _022C65E8 ; =ov00_02325020
	mov r1, #0
	ldr r0, [r2, #0xc]
	add r0, r0, #0x1000
	str r1, [r0, #0x31c]
	ldrh r0, [r4, #4]
	cmp r0, #0xa
	beq _022C6200
	cmp r0, #0xb
	beq _022C623C
	b _022C6258
_022C6200:
	ldr r0, [r2, #8]
	mov r3, #1
	add r0, r0, #0x500
	strh r3, [r0, #0x28]
	ldr r2, [r2, #8]
	add r0, r2, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r2, #0x51c]
	mov r0, #0x19
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C623C:
	ldr r0, [r2, #8]
	ldr r1, [r4, #8]
	ldr r2, [r0, #0x51c]
	mov r0, #3
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6258:
	ldr r0, [r2, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6274:
	ldr r0, _022C65E8 ; =ov00_02325020
	ldr r3, [r0, #0xc]
	add r0, r3, #0x7000
	ldr r0, [r0, #0x4c8]
	cmp r0, #0
	beq _022C62D0
	mov r2, #0
	mov r1, r2
_022C6294:
	add r0, r3, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r0, #0
	beq _022C62B4
	add r2, r2, #1
	cmp r2, #2
	bhs _022C62C0
_022C62B4:
	add r1, r1, #1
	cmp r1, #0xf
	blo _022C6294
_022C62C0:
	cmp r2, #1
	bne _022C62D0
	ldr r0, _022C65F4 ; =0x000032C8
	bl OS_SpinWait
_022C62D0:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r2, #0
	ldr r1, [r0, #8]
	strb r2, [r1, #0x50c]
	ldrh r1, [r4, #2]
	cmp r1, #0
	bne _022C6334
	ldr r0, [r0, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #2
	blx r2
	ldr r0, _022C65E8 ; =ov00_02325020
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6334:
	cmp r1, #0xa
	ldr r0, [r0, #8]
	mov r1, r4
	bne _022C6358
	ldr r2, [r0, #0x51c]
	mov r0, #0x2a
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6358:
	ldr r2, [r0, #0x51c]
	mov r0, #0x13
	blx r2
	ldr r0, _022C65E8 ; =ov00_02325020
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6398:
	ldr r1, _022C65E8 ; =ov00_02325020
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _022C6414
	ldrh r0, [r4, #2]
	mov r2, #0
	cmp r0, #0
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	beq _022C63E8
	strh r2, [r0, #0x26]
	ldr r0, [r1, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C63E8:
	strh r2, [r0, #0x2a]
	ldr r1, [r1, #8]
	ldr r0, _022C65EC ; =MBi_ParentCallback
	add r1, r1, #0x500
	strh r2, [r1, #0x28]
	bl WM_End
	mov r1, r0
	mov r0, #2
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6414:
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl WM_SetPortCallback
	mov r0, #0
	bl WM_SetIndCallback
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022C6468
	ldr r2, _022C65E8 ; =ov00_02325020
	mov r3, #0
	ldr r0, [r2, #8]
	mov r1, r4
	add r0, r0, #0x500
	strh r3, [r0, #0x26]
	ldr r2, [r2, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6468:
	ldr r0, _022C65EC ; =MBi_ParentCallback
	mov r1, #0
	bl WM_SetBeaconIndication
	mov r1, r0
	mov r0, #0x19
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C6488:
	ldrh r1, [r4, #2]
	cmp r1, #0
	beq _022C64C4
	ldr r2, _022C65E8 ; =ov00_02325020
	mov r3, #0
	ldr r0, [r2, #8]
	mov r1, r4
	add r0, r0, #0x500
	strh r3, [r0, #0x26]
	ldr r2, [r2, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C64C4:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C64D0:
	ldrh r0, [r4, #2]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r0, _022C65E8 ; =ov00_02325020
	ldrh r1, [r4, #0xa]
	ldr r0, [r0, #8]
	add sp, sp, #0x1c
	add r0, r0, #0x500
	ldrh r2, [r0, #0x2a]
	mvn r1, r1
	and r1, r2, r1
	strh r1, [r0, #0x2a]
	ldmia sp!, {r3, r4, pc}
_022C6508:
	ldrh r0, [r4, #4]
	sub r0, r0, #0x10
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022C65E0
_022C651C: ; jump table
	b _022C653C ; case 0
	b _022C655C ; case 1
	b _022C657C ; case 2
	b _022C659C ; case 3
	b _022C65E0 ; case 4
	b _022C65E0 ; case 5
	b _022C65BC ; case 6
	b _022C65E0 ; case 7
_022C653C:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x1d
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C655C:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x1f
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C657C:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x20
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C659C:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x21
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C65BC:
	bl WaitForever2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_022C65C8:
	ldr r0, _022C65E8 ; =ov00_02325020
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
_022C65E0:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022C65E8: .word ov00_02325020
_022C65EC: .word MBi_ParentCallback
_022C65F0: .word ov00_02318820
_022C65F4: .word 0x000032C8
	arm_func_end MBi_ParentCallback

	arm_func_start MBi_ChildPortCallback
MBi_ChildPortCallback: ; 0x022C65F8
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldrh r0, [r1, #2]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldrh r0, [r1, #4]
	cmp r0, #0x15
	bgt _022C6634
	bge _022C664C
	cmp r0, #9
	ldmgtia sp!, {r3, pc}
	cmp r0, #7
	ldmltia sp!, {r3, pc}
	cmpne r0, #9
	ldmia sp!, {r3, pc}
_022C6634:
	cmp r0, #0x1a
	ldmgtia sp!, {r3, pc}
	cmp r0, #0x19
	ldmltia sp!, {r3, pc}
	cmpne r0, #0x1a
	ldmia sp!, {r3, pc}
_022C664C:
	ldr r2, _022C6664 ; =ov00_02325020
	mov r0, #9
	ldr r2, [r2, #8]
	ldr r2, [r2, #0x51c]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C6664: .word ov00_02325020
	arm_func_end MBi_ChildPortCallback

	arm_func_start MBi_ChildCallback
MBi_ChildCallback: ; 0x022C6668
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	ldrh r2, [r6]
	ldr r1, _022C6E80 ; =ov00_02325020
	cmp r2, #0x1d
	ldr r4, [r1, #8]
	bgt _022C66F4
	cmp r2, #0x1d
	bge _022C6760
	cmp r2, #0x15
	addls pc, pc, r2, lsl #2
	b _022C6E68
_022C669C: ; jump table
	b _022C6700 ; case 0
	b _022C6D80 ; case 1
	b _022C6DE0 ; case 2
	b _022C6E68 ; case 3
	b _022C6E68 ; case 4
	b _022C6E68 ; case 5
	b _022C6E68 ; case 6
	b _022C6E68 ; case 7
	b _022C6E68 ; case 8
	b _022C6E68 ; case 9
	b _022C67FC ; case 10
	b _022C6AC4 ; case 11
	b _022C6B14 ; case 12
	b _022C6E68 ; case 13
	b _022C6C8C ; case 14
	b _022C6D00 ; case 15
	b _022C6E68 ; case 16
	b _022C6E68 ; case 17
	b _022C6E68 ; case 18
	b _022C6E68 ; case 19
	b _022C6E68 ; case 20
	b _022C6E1C ; case 21
_022C66F4:
	cmp r2, #0x80
	beq _022C6E44
	b _022C6E68
_022C6700:
	ldrh r0, [r6, #2]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	cmp r0, #0
	beq _022C6724
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6724:
	mov r0, #0x15
	blx r2
	ldr r3, _022C6E84 ; =ov00_02318820
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	ldrh r1, [r3, #4]
	str r1, [sp]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	bl WM_SetLifeTime
	mov r1, r0
	mov r0, #0x1d
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6760:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _022C6784
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6784:
	add r0, r4, #0x440
	str r0, [r1, #0x20]
	ldrh r0, [r1, #0x24]
	mov r2, #1
	cmp r0, #0
	moveq r0, #1
	streqh r0, [r1, #0x24]
	ldr r0, _022C6E80 ; =ov00_02325020
	ldrh r1, [r0, #0x26]
	cmp r1, #0
	moveq r1, #0xc8
	streqh r1, [r0, #0x26]
	ldr r0, _022C6E80 ; =ov00_02325020
	mov r1, #0xff
	strb r1, [r0, #0x28]
	strb r1, [r0, #0x29]
	strb r1, [r0, #0x2a]
	strb r1, [r0, #0x2b]
	strb r1, [r0, #0x2c]
	strb r1, [r0, #0x2d]
	str r2, [r4, #0x5e4]
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	ldr r1, _022C6E8C ; =ov00_02325040
	str r2, [r4, #0x5e8]
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C67FC:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _022C6820
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6820:
	ldrh r0, [r6, #8]
	cmp r0, #3
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #4
	beq _022C6A4C
	cmp r0, #5
	bne _022C6AAC
	add ip, r4, #0x600
	mov r5, #0
	add r0, r4, #0x500
	mov fp, #0x180
	b _022C697C
_022C6854:
	mla r2, r5, fp, ip
	ldrb r3, [r6, #0xa]
	ldrb r1, [r2, #0xca]
	mov lr, #0
	mov sl, lr
	cmp r3, r1
	ldreqb r1, [r2, #0xcb]
	ldreqb r2, [r6, #0xb]
	mov r7, lr
	mov r8, lr
	cmpeq r2, r1
	moveq sl, #1
	mov sb, lr
	cmp sl, #0
	beq _022C68A8
	mov r2, #0x180
	mla r2, r5, r2, ip
	ldrb r1, [r6, #0xc]
	ldrb r2, [r2, #0xcc]
	cmp r1, r2
	moveq sb, #1
_022C68A8:
	cmp sb, #0
	beq _022C68C8
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xd]
	ldrb r1, [r1, #0xcd]
	cmp r2, r1
	moveq r8, #1
_022C68C8:
	cmp r8, #0
	beq _022C68E8
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xe]
	ldrb r1, [r1, #0xce]
	cmp r2, r1
	moveq r7, #1
_022C68E8:
	cmp r7, #0
	beq _022C6908
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xf]
	ldrb r1, [r1, #0xcf]
	cmp r2, r1
	moveq lr, #1
_022C6908:
	cmp lr, #0
	beq _022C6978
	mov r0, #0x180
	mla r0, r5, r0, ip
	ldrh r1, [r6, #0x36]
	add sb, r6, #0x38
	add r8, r0, #0xf8
	strh r1, [r0, #0xf6]
	mov r7, #8
_022C692C:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _022C692C
	add r1, r4, #0x600
	mov r0, #0x180
	mla r0, r5, r0, r1
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r1, _022C6E80 ; =ov00_02325020
	add r2, r4, #0x600
	mov r0, #0x180
	mla r2, r5, r0, r2
	ldrh r0, [r1]
	add r1, r4, #0x440
	mov r3, #0xc0
	bl MI_DmaCopy16
	str r5, [r4, #0x5ec]
	b _022C69EC
_022C6978:
	add r5, r5, #1
_022C697C:
	ldrh r1, [r0, #0xe0]
	cmp r5, r1
	blt _022C6854
	cmp r5, #0x10
	bge _022C69EC
	mov r0, #0x180
	mla r1, r5, r0, ip
	mov r0, r6
	add r7, r5, #1
	add r3, r4, #0x500
	add r1, r1, #0xc0
	mov r2, #0xb8
	strh r7, [r3, #0xe0]
	bl MTi_CpuCopy16
	add r1, r4, #0x600
	mov r0, #0x180
	mla r0, r5, r0, r1
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r1, _022C6E80 ; =ov00_02325020
	add r2, r4, #0x600
	mov r0, #0x180
	mla r2, r5, r0, r2
	ldrh r0, [r1]
	add r1, r4, #0x440
	mov r3, #0xc0
	bl MI_DmaCopy16
	str r5, [r4, #0x5ec]
_022C69EC:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #4
	blx r2
	ldr r0, [r4, #0x5e4]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x5e8]
	cmp r0, #0
	beq _022C6A2C
	ldr r0, _022C6E8C ; =ov00_02325040
	bl ChangeScanChannel
	cmp r0, #0
	bne _022C6A2C
	bl MBi_CommEnd
_022C6A2C:
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	ldr r1, _022C6E8C ; =ov00_02325040
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6A4C:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #5
	blx r2
	ldr r0, [r4, #0x5e4]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x5e8]
	cmp r0, #0
	beq _022C6A8C
	ldr r0, _022C6E8C ; =ov00_02325040
	bl ChangeScanChannel
	cmp r0, #0
	bne _022C6A8C
	bl MBi_CommEnd
_022C6A8C:
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	ldr r1, _022C6E8C ; =ov00_02325040
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6AAC:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6AC4:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _022C6AE8
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6AE8:
	ldr r1, [r4, #0x520]
	mov r2, #0
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	mov r3, #1
	str r2, [sp]
	bl WM_StartConnectEx
	mov r1, r0
	mov r0, #0xc
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6B14:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _022C6B44
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0xe0]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0xb
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6B44:
	ldrh r0, [r6, #8]
	cmp r0, #9
	bgt _022C6B70
	cmp r0, #6
	blt _022C6C74
	beq _022C6B80
	cmp r0, #7
	beq _022C6B9C
	cmp r0, #9
	beq _022C6C4C
	b _022C6C74
_022C6B70:
	cmp r0, #0x1a
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	b _022C6C74
_022C6B80:
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x2a]
	mov r1, #1
	strh r1, [r0, #0x28]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6B9C:
	ldrh r2, [r6, #0xa]
	add r0, r4, #0x500
	mov r1, r6
	strh r2, [r0, #0xe2]
	ldr r2, [r4, #0x51c]
	mov r0, #6
	blx r2
	ldr r1, _022C6E90 ; =MBi_ChildPortCallback
	add r3, r4, #0x500
	mov r0, #1
	mov r2, #0
	strh r0, [r3, #0x2a]
	bl WM_SetPortCallback
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r4, #0x500
	ldrh r0, [r0, #0x2c]
	add r1, r4, #0x500
	ldrh r2, [r1, #0x18]
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldrh r2, [r1, #0x1a]
	ldr r1, [r4, #0x504]
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	add r3, r4, #0x40
	bl WM_StartMpEx
	mov r1, r0
	mov r0, #0xe
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6C4C:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0xa
	blx r2
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x2a]
	strh r1, [r0, #0x28]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6C74:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6C8C:
	ldrh r0, [r6, #4]
	cmp r0, #0xa
	beq _022C6CB4
	cmp r0, #0xc
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0xd
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	b _022C6CE8
_022C6CB4:
	add r0, r4, #0x500
	mov r1, #1
	strh r1, [r0, #0x28]
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6CE8:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6D00:
	mov r0, #0
	strb r0, [r4, #0x50c]
	ldrh r0, [r6, #2]
	cmp r0, #0
	bne _022C6D28
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #8
	blx r2
	b _022C6D4C
_022C6D28:
	cmp r0, #9
	ldr r2, [r4, #0x51c]
	mov r1, r6
	bne _022C6D44
	mov r0, #0x29
	blx r2
	b _022C6D4C
_022C6D44:
	mov r0, #0x12
	blx r2
_022C6D4C:
	ldr r0, _022C6E80 ; =ov00_02325020
	ldr r0, [r0, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6D80:
	ldrh r0, [r6, #2]
	cmp r0, #0
	add r0, r4, #0x500
	beq _022C6DB0
	mov r1, #0
	strh r1, [r0, #0x26]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6DB0:
	mov r2, #0
	strh r2, [r0, #0x2a]
	ldr r1, [r1, #8]
	ldr r0, _022C6E88 ; =MBi_ChildCallback
	add r1, r1, #0x500
	strh r2, [r1, #0x28]
	bl WM_End
	mov r1, r0
	mov r0, #2
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6DE0:
	ldrh r1, [r6, #2]
	cmp r1, #0
	beq _022C6E10
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x26]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6E10:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6E1C:
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6E44:
	ldrh r0, [r6, #4]
	cmp r0, #0x16
	beq _022C6E5C
	add sp, sp, #0x1c
	cmp r0, #0x17
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6E5C:
	bl WaitForever2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022C6E68:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C6E80: .word ov00_02325020
_022C6E84: .word ov00_02318820
_022C6E88: .word MBi_ChildCallback
_022C6E8C: .word ov00_02325040
_022C6E90: .word MBi_ChildPortCallback
	arm_func_end MBi_ChildCallback

	arm_func_start MBi_GetBeaconPeriodDispersion
MBi_GetBeaconPeriodDispersion: ; 0x022C6E94
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r1, #0
	add r2, sp, #0
	mov r3, r1
_022C6EB0:
	ldrb r0, [r2], #1
	add r1, r1, #1
	cmp r1, #6
	add r3, r3, r0
	blt _022C6EB0
	ldr r1, _022C6EF4 ; =0x027FFC3C
	ldr r0, _022C6EF8 ; =0xCCCCCCCD
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r3, r1
	rsb r3, r1, r1, lsl #3
	umull r1, r0, r3, r0
	mov r0, r0, lsr #4
	umull r0, r1, r2, r0
	sub r0, r3, r0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C6EF4: .word 0x027FFC3C
_022C6EF8: .word 0xCCCCCCCD
	arm_func_end MBi_GetBeaconPeriodDispersion

	arm_func_start MB_Init
MB_Init: ; 0x022C6EFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022C70D4 ; =ov00_02325020
	mov sb, r1
	ldr r1, [r4, #0xc]
	mov r8, r2
	cmp r1, #0
	addne r1, r1, #0x1300
	ldrneh r1, [r1, #0x16]
	mov r7, r3
	cmpne r1, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r0, #0x1f
	bic r4, r0, #0x1f
	add r0, r4, #0x1f
	add r0, r0, #0x1e00
	cmp r7, #0x10000
	bic r5, r0, #0x1f
	bne _022C6F50
	bl WM_GetNextTgid
	mov r7, r0
_022C6F50:
	bl EnableIrqFlag
	ldr r3, _022C70D8 ; =0x0000FFFF
	ldr r1, _022C70DC ; =ov00_02318820
	mov r2, #5
	strh r3, [r1, #6]
	strh r2, [r1]
	mov r2, #0x28
	strh r2, [r1, #2]
	mov r6, r0
	strh r2, [r1, #4]
	mov r2, #1
	ldr r0, [sp, #0x20]
	ldr r3, _022C70D4 ; =ov00_02325020
	str r2, [r1, #0xc]
	strh r0, [r3]
	str r4, [r3, #8]
	mov r1, r4
	mov r0, #0
	mov r2, #0x1e00
	str r5, [r3, #0xc]
	bl MTi_CpuClear32
	mov r1, r5
	mov r0, #0
	mov r2, #0x1340
	bl MTi_CpuClear16
	ldrb r0, [sb, #1]
	add r2, r4, #0x530
	mov r1, #0
	cmp r0, #0
	ble _022C6FE4
_022C6FC8:
	add r0, sb, r1, lsl #1
	ldrh r0, [r0, #2]
	add r1, r1, #1
	strh r0, [r2], #2
	ldrb r0, [sb, #1]
	cmp r1, r0
	blt _022C6FC8
_022C6FE4:
	add r0, r4, #0x138
	add r3, r0, #0x400
	ldr r0, _022C70DC ; =ov00_02318820
	mov ip, #0
	ldr r1, [r0, #8]
_022C6FF8:
	ldrh r2, [r1]
	cmp r2, #0
	beq _022C701C
	add r1, r1, #2
	add ip, ip, #1
	str r1, [r0, #8]
	cmp ip, #0x10
	strh r2, [r3], #2
	blt _022C6FF8
_022C701C:
	mov r0, sb
	add r1, r5, #0x1300
	mov r2, #0x16
	bl MI_CpuCopy8
	ldrb r0, [sb, #1]
	cmp r0, #0xa
	bhs _022C7048
	add r0, r5, r0, lsl #1
	add r0, r0, #0x1300
	mov r1, #0
	strh r1, [r0, #2]
_022C7048:
	add r0, r4, #0x500
	mov r1, #0x100
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r2, #0
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	mov r1, #1
	strh r1, [r0, #0x2c]
	add r0, r5, #0x400
	str r0, [r4, #0x504]
	strh r2, [r4, #0xe]
	strh r2, [r4, #0x12]
	strh r1, [r4, #0x16]
	strh r2, [r4, #0x14]
	str r8, [r4, #8]
	strh r7, [r4, #0xc]
	bl MBi_GetBeaconPeriodDispersion
	add r0, r0, #0xc8
	strh r0, [r4, #0x18]
	mov r0, #0xf
	strh r0, [r4, #0x10]
	mov r3, #0
	strb r3, [r4, #0x50c]
	strb r3, [r4, #0x50d]
	add r1, r5, #0x1300
	mov r2, #1
	mov r0, r6
	strh r2, [r1, #0x16]
	add r1, r5, #0x1000
	str r3, [r1, #0x31c]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C70D4: .word ov00_02325020
_022C70D8: .word 0x0000FFFF
_022C70DC: .word ov00_02318820
	arm_func_end MB_Init

	arm_func_start MBi_IsCommSizeValid
MBi_IsCommSizeValid: ; 0x022C70E0
	ldr r3, _022C7148 ; =0x000001FE
	cmp r0, r3
	bhi _022C70F4
	cmp r0, #0xe4
	bhs _022C70FC
_022C70F4:
	mov r0, #0
	bx lr
_022C70FC:
	cmp r1, #0x10
	bhi _022C710C
	cmp r1, #8
	bhs _022C7114
_022C710C:
	mov r0, #0
	bx lr
_022C7114:
	add r0, r0, #0x26
	mov r0, r0, lsl #2
	add r1, r1, #0x20
	add r0, r0, #0x4a
	mov r1, r1, lsl #2
	add r3, r0, #0x100
	add r0, r1, #0x70
	mla r1, r2, r0, r3
	ldr r0, _022C714C ; =0x000015E0
	cmp r1, r0
	movlt r0, #1
	movge r0, #0
	bx lr
	.align 2, 0
_022C7148: .word 0x000001FE
_022C714C: .word 0x000015E0
	arm_func_end MBi_IsCommSizeValid

	arm_func_start MB_SetParentCommParam
MB_SetParentCommParam: ; 0x022C7150
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	ldr r1, _022C71E4 ; =ov00_02325020
	mov r6, r0
	ldr r1, [r1, #8]
	ldrb r1, [r1, #0x50d]
	cmp r1, #0
	beq _022C7184
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022C7184:
	mov r0, r5
	mov r2, r4
	mov r1, #8
	bl MBi_IsCommSizeValid
	cmp r0, #0
	bne _022C71AC
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022C71AC:
	ldr r2, _022C71E4 ; =ov00_02325020
	mov r0, r6
	ldr r1, [r2, #8]
	mov r3, #8
	strh r4, [r1, #0x10]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r5, [r1]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #2]
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C71E4: .word ov00_02325020
	arm_func_end MB_SetParentCommParam

	arm_func_start MBi_StartCommon
MBi_StartCommon: ; 0x022C71E8
	stmdb sp!, {r4, lr}
	ldr r2, _022C72B8 ; =ov00_02325020
	mov r3, #0
	ldr r1, [r2, #8]
	mov r0, #0xa
	add r1, r1, #0x500
	strh r3, [r1, #0x28]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x2a]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x26]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x48]
	bl MBi_SetMaxScanTime
	ldr r4, _022C72B8 ; =ov00_02325020
	ldr r0, [r4, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _022C7290
_022C7244:
	ldrh r2, [r4]
	ldmib r4, {r0, r1}
	ldr r1, [r1, #0x508]
	bl WM_InitializeEx
	cmp r0, #4
	beq _022C7244
	cmp r0, #2
	movne r0, #8
	ldmneia sp!, {r4, pc}
	ldr r0, _022C72B8 ; =ov00_02325020
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x508]
	bl WM_SetIndCallback
	ldr r0, _022C72B8 ; =ov00_02325020
	mov r2, #1
	ldr r1, [r0, #8]
	mov r0, #0
	strb r2, [r1, #0x50d]
	ldmia sp!, {r4, pc}
_022C7290:
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x508]
	bl WM_SetIndCallback
	mov r0, r4
	ldr r0, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0x50d]
	bl MBi_OnInitializeDone
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C72B8: .word ov00_02325020
	arm_func_end MBi_StartCommon

	arm_func_start MBi_StartParentCore
MBi_StartParentCore: ; 0x022C72BC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r3, _022C748C ; =ov00_02325020
	mov r4, r0
	ldr r0, [r3, #8]
	ldr r2, _022C7490 ; =0x000069C0
	strh r5, [r0, #0x32]
	ldr r5, [r3, #0xc]
	mov r0, #0
	add r1, r5, #0x1f
	add r1, r1, #0x7d00
	bic r1, r1, #0x1f
	str r1, [r3, #4]
	add r1, r5, #0x1000
	ldr r6, [r1, #0x4e4]
	add r1, r5, #0x1340
	bl MTi_CpuClear16
	mov r0, r6
	bl MB_CommSetParentStateCallback
	ldr r1, _022C748C ; =ov00_02325020
	ldr r0, [r1, #8]
	ldr r2, [r1, #0xc]
	add r0, r0, #0x500
	ldrh r3, [r0]
	add r0, r2, #0x1000
	sub r2, r3, #6
	str r2, [r0, #0x318]
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #2]
	bl MBi_SetChildMpMaxSize
	ldr r0, _022C748C ; =ov00_02325020
	ldr r0, [r0, #0xc]
	add r0, r0, #0x138
	add r0, r0, #0x1400
	bl MBi_SetParentPieceBuffer
	mov r5, #0
	ldr r2, _022C748C ; =ov00_02325020
	mov r0, r5
	mvn r3, #0
_022C7360:
	ldr r1, [r2, #0xc]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x4e8]
	ldr r1, [r2, #0xc]
	add r1, r1, r5
	add r1, r1, #0x1000
	add r5, r5, #1
	strb r3, [r1, #0x526]
	cmp r5, #0xf
	blt _022C7360
	ldr r3, _022C748C ; =ov00_02325020
	ldr r2, _022C7494 ; =0x00005D40
	ldr r1, [r3, #0xc]
	add r1, r1, #0x1000
	strb r0, [r1, #0x524]
	ldr r1, [r3, #0xc]
	add r1, r1, #0x388
	add r1, r1, #0x1400
	bl MTi_CpuClear16
	ldr r0, _022C748C ; =ov00_02325020
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x1e
	add r0, r0, #0x354
	add r0, r0, #0x1400
	bl MI_CpuFill8
	ldr r1, _022C748C ; =ov00_02325020
	mov r2, #1
	ldr r0, [r1, #8]
	ldr r3, _022C7498 ; =MBi_CommParentCallback
	add r0, r0, #0x500
	strh r2, [r0, #0x24]
	ldr r0, [r1, #8]
	ldr r2, _022C749C ; =MBi_ParentCallback
	str r3, [r0, #0x51c]
	ldr r0, [r1, #8]
	str r2, [r0, #0x508]
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrh r0, [r0]
	strh r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldrh r2, [r0, #0x34]
	add r0, r0, #0x500
	add r2, r2, #0x23
	bic r2, r2, #0x1f
	strh r2, [r0, #0x18]
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrh r0, [r0, #2]
	strh r0, [r2, #0x36]
	ldr r0, [r1, #8]
	ldrh r1, [r0, #0x36]
	add r0, r0, #0x500
	add r1, r1, #0xe
	rsb r1, r1, r1, lsl #4
	add r1, r1, #0x29
	bic r1, r1, #0x1f
	mov r1, r1, lsl #1
	strh r1, [r0, #0x1a]
	bl MB_InitSendGameInfoStatus
	bl MBi_StartCommon
	mov r5, r0
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0xf
	mov r1, #1
	bl PXI_IsCallbackReady
	ldr r1, _022C748C ; =ov00_02325020
	ldr r1, [r1, #0xc]
	add r1, r1, #0x7000
	str r0, [r1, #0x4c8]
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C748C: .word ov00_02325020
_022C7490: .word 0x000069C0
_022C7494: .word 0x00005D40
_022C7498: .word MBi_CommParentCallback
_022C749C: .word MBi_ParentCallback
	arm_func_end MBi_StartParentCore

	arm_func_start MB_StartParentFromIdle
MB_StartParentFromIdle: ; 0x022C74A0
	ldr r1, _022C74BC ; =ov00_02325020
	ldr ip, _022C74C0 ; =MBi_StartParentCore
	ldr r1, [r1, #0xc]
	mov r2, #1
	add r1, r1, #0x1000
	str r2, [r1, #0x320]
	bx ip
	.align 2, 0
_022C74BC: .word ov00_02325020
_022C74C0: .word MBi_StartParentCore
	arm_func_end MB_StartParentFromIdle

	arm_func_start MBi_CallReset
MBi_CallReset: ; 0x022C74C4
	stmdb sp!, {r4, lr}
	ldr r0, _022C74F8 ; =ov00_02325020
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x508]
	bl WM_Reset
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl MBi_CheckWmErrcode
	cmp r4, #2
	moveq r4, #0
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C74F8: .word ov00_02325020
	arm_func_end MBi_CallReset

	arm_func_start MBi_OnReset
MBi_OnReset: ; 0x022C74FC
	ldr ip, _022C7504 ; =MBi_CallReset
	bx ip
	.align 2, 0
_022C7504: .word MBi_CallReset
	arm_func_end MBi_OnReset

	arm_func_start MBi_CommEnd
MBi_CommEnd: ; 0x022C7508
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl EnableIrqFlag
	ldr r1, _022C7594 ; =ov00_02325020
	mov r4, r0
	ldr r2, [r1, #8]
	ldrb r0, [r2, #0x50d]
	cmp r0, #0
	bne _022C7538
	mov r0, #0
	bl MBi_EndCommon
	b _022C7584
_022C7538:
	add r0, r2, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	bne _022C7584
	mov r0, #0
	str r0, [r2, #0x5e4]
	ldr r0, [r1, #8]
	mov r1, r5
	add r0, r0, #0x500
	strh r1, [r0, #0x26]
	bl MBi_IsTaskAvailable
	cmp r0, #0
	beq _022C757C
	ldr r0, _022C7598 ; =MBi_OnReset
	bl MBi_EndTaskThread
	mov r5, #0
	b _022C7584
_022C757C:
	bl MBi_CallReset
	mov r5, r0
_022C7584:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C7594: .word ov00_02325020
_022C7598: .word MBi_OnReset
	arm_func_end MBi_CommEnd

	arm_func_start MB_EndToIdle
MB_EndToIdle: ; 0x022C759C
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022C75D4 ; =ov00_02325020
	mov r4, r0
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _022C75C4
	bl WaitForever2
_022C75C4:
	bl MBi_CommEnd
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C75D4: .word ov00_02325020
	arm_func_end MB_EndToIdle

	arm_func_start MB_DisconnectChild
MB_DisconnectChild: ; 0x022C75D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r0, _022C7758 ; =MBi_ParentCallback
	mov r1, r5
	bl WM_Disconnect
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0x10
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _022C775C ; =ov00_02325020
	sub r4, r5, #1
	ldr r0, [r2, #0xc]
	mov r1, #0
	add r0, r0, r4, lsl #1
	add r0, r0, #0x1400
	strh r1, [r0, #0x8a]
	ldr r0, [r2, #0xc]
	mov r2, #4
	add r0, r0, #0xa8
	add r0, r0, #0x1400
	add r0, r0, r4, lsl #2
	bl MI_CpuFill8
	ldr r0, _022C775C ; =ov00_02325020
	mov r2, #0x16
	ldr r0, [r0, #0xc]
	mov r1, #0
	add r0, r0, #0x1340
	mla r0, r4, r2, r0
	bl MI_CpuFill8
	mov r0, r5
	bl MBi_ClearParentPieceBuffer
	ldr ip, _022C775C ; =ov00_02325020
	mov r2, #0
	ldr r0, [ip, #0xc]
	sub r1, r2, #1
	add r0, r0, r4, lsl #1
	add r0, r0, #0x1700
	strh r2, [r0, #0x54]
	ldr r3, [ip, #0xc]
	add r0, r3, r4
	add r0, r0, #0x1500
	ldrsb r2, [r0, #0x26]
	cmp r2, r1
	beq _022C76F8
	ldr r0, _022C7760 ; =0x000005D4
	and r1, r2, #0xff
	mul r0, r1, r0
	add r1, r3, r0
	add r3, r1, #0x1d00
	mov r2, #1
	ldrh r6, [r3, #0x4e]
	mvn r1, r2, lsl r5
	and r6, r6, r1
	strh r6, [r3, #0x4e]
	ldr r3, [ip, #0xc]
	sub r6, r2, #2
	add r3, r3, r0
	add r3, r3, #0x1d00
	ldrh r7, [r3, #0x50]
	mov lr, r4
	orr r2, r7, r2, lsl r5
	strh r2, [r3, #0x50]
	ldr r2, [ip, #0xc]
	add r2, r2, lr
	add r2, r2, #0x1000
	strb r6, [r2, #0x526]
	ldr r2, [ip, #0xc]
	add r0, r2, r0
	add r0, r0, #0x1d00
	ldrh r2, [r0, #0x4c]
	and r1, r2, r1
	strh r1, [r0, #0x4c]
_022C76F8:
	ldr r1, _022C775C ; =ov00_02325020
	mov ip, #1
	ldr r2, [r1, #0xc]
	add r0, r2, #0x1500
	ldrh r0, [r0, #0x36]
	tst r0, ip, lsl r5
	beq _022C773C
	add r0, r2, #0x1000
	ldrb r3, [r0, #0x535]
	mvn r2, ip, lsl r5
	sub r3, r3, #1
	strb r3, [r0, #0x535]
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1500
	ldrh r1, [r0, #0x36]
	and r1, r1, r2
	strh r1, [r0, #0x36]
_022C773C:
	ldr r0, _022C775C ; =ov00_02325020
	mov r1, #0
	ldr r0, [r0, #0xc]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x1000
	str r1, [r0, #0x4e8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C7758: .word MBi_ParentCallback
_022C775C: .word ov00_02325020
_022C7760: .word 0x000005D4
	arm_func_end MB_DisconnectChild

	arm_func_start MBi_SetMaxScanTime
MBi_SetMaxScanTime: ; 0x022C7764
	ldr r1, _022C7770 ; =ov00_02325020
	strh r0, [r1, #0x26]
	bx lr
	.align 2, 0
_022C7770: .word ov00_02325020
	arm_func_end MBi_SetMaxScanTime

	arm_func_start MBi_SetMpData
MBi_SetMpData: ; 0x022C7774
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldrh r4, [sp, #0x18]
	mov r3, r2
	mov r2, r1
	str r4, [sp]
	mov r4, #1
	str r4, [sp, #4]
	mov r4, #3
	mov r1, #0
	str r4, [sp, #8]
	bl WM_SetMpDataToPortEx
	mov r4, r0
	mov r1, r4
	mov r0, #0xf
	bl MBi_CheckWmErrcode
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end MBi_SetMpData

	arm_func_start MBi_SendMP
MBi_SendMP: ; 0x022C77C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022C7898 ; =ov00_02325020
	mov r3, r1, lsl #0x10
	ldr r5, [ip, #8]
	mov ip, r2, lsl #0x10
	add lr, r5, #0x500
	ldrh r4, [lr, #0x28]
	mov r1, r0
	mov r2, r3, lsr #0x10
	cmp r4, #0
	ldrneh r0, [lr, #0x26]
	mov r4, ip, lsr #0x10
	cmpne r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [lr, #0x24]
	cmp r0, #1
	beq _022C7814
	cmp r0, #2
	beq _022C785C
	b _022C7890
_022C7814:
	ldrh r0, [lr, #0x2c]
	cmp r0, #0
	moveq r0, #0x3e8
	movne r0, #0
	mov r3, r0, lsl #0x10
	str r4, [sp]
	ldr r0, [r5, #0x508]
	mov r3, r3, lsr #0x10
	bl MBi_SetMpData
	cmp r0, #2
	bne _022C7850
	ldr r1, _022C7898 ; =ov00_02325020
	mov r2, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x50c]
_022C7850:
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022C785C:
	ldr r0, _022C789C ; =MBi_ChildCallback
	mov r3, #0
	str r4, [sp]
	bl MBi_SetMpData
	cmp r0, #2
	bne _022C7884
	ldr r1, _022C7898 ; =ov00_02325020
	mov r2, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x50c]
_022C7884:
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022C7890:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C7898: .word ov00_02325020
_022C789C: .word MBi_ChildCallback
	arm_func_end MBi_SendMP

	arm_func_start MBi_GetGgid
MBi_GetGgid: ; 0x022C78A0
	ldr r0, _022C78B0 ; =ov00_02325020
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022C78B0: .word ov00_02325020
	arm_func_end MBi_GetGgid

	arm_func_start MBi_GetTgid
MBi_GetTgid: ; 0x022C78B4
	ldr r0, _022C78C4 ; =ov00_02325020
	ldr r0, [r0, #8]
	ldrh r0, [r0, #0xc]
	bx lr
	.align 2, 0
_022C78C4: .word ov00_02325020
	arm_func_end MBi_GetTgid

	arm_func_start MBi_GetAttribute
MBi_GetAttribute: ; 0x022C78C8
	ldr r0, _022C7924 ; =ov00_02325020
	ldr r1, [r0, #8]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	ldrh r0, [r1, #0xe]
	movne r2, #2
	moveq r2, #0
	cmp r0, #0
	movne r3, #1
	ldrh r0, [r1, #0x14]
	moveq r3, #0
	cmp r0, #0
	movne ip, #4
	ldrh r0, [r1, #0x16]
	moveq ip, #0
	cmp r0, #0
	movne r1, #8
	orr r0, r3, r2
	moveq r1, #0
	orr r0, ip, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022C7924: .word ov00_02325020
	arm_func_end MBi_GetAttribute

	arm_func_start MBi_IsStarted
MBi_IsStarted: ; 0x022C7928
	ldr r0, _022C7944 ; =ov00_02325020
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x50d]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022C7944: .word ov00_02325020
	arm_func_end MBi_IsStarted

	arm_func_start MBi_CheckWmErrcode
MBi_CheckWmErrcode: ; 0x022C7948
	stmdb sp!, {r3, lr}
	cmp r1, #2
	cmpne r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _022C797C ; =ov00_02325020
	strh r0, [sp]
	ldr r0, [r2, #8]
	strh r1, [sp, #2]
	ldr r2, [r0, #0x51c]
	add r1, sp, #0
	mov r0, #0xff
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C797C: .word ov00_02325020
	arm_func_end MBi_CheckWmErrcode

	arm_func_start MBi_InitCache
MBi_InitCache: ; 0x022C7980
	ldr ip, _022C7990 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x70
	bx ip
	.align 2, 0
_022C7990: .word MI_CpuFill8
	arm_func_end MBi_InitCache

	arm_func_start MBi_AttachCacheBuffer
MBi_AttachCacheBuffer: ; 0x022C7994
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl EnableIrqFlag
	add r6, r4, #0x30
	mov r5, r0
	add r4, r4, #0x70
_022C79B8:
	cmp r6, r4
	blo _022C79C4
	bl WaitForever2
_022C79C4:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	bne _022C79E8
	str sb, [r6]
	str r8, [r6, #4]
	ldr r0, [sp, #0x20]
	str r7, [r6, #8]
	str r0, [r6, #0xc]
	b _022C79F0
_022C79E8:
	add r6, r6, #0x10
	b _022C79B8
_022C79F0:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end MBi_AttachCacheBuffer

	arm_func_start MBi_MakeParentSendBuffer__022C8210
MBi_MakeParentSendBuffer__022C8210: ; 0x022C79FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r4, #0
	bl EnableIrqFlag
	add r2, sb, #0x30
	add r1, sb, #0x70
	mov r5, r0
	cmp r2, r1
	bhs _022C7A84
_022C7A2C:
	ldr r0, [r2, #0xc]
	cmp r0, #2
	blo _022C7A78
	ldr r0, [r2]
	subs r0, r8, r0
	bmi _022C7A78
	ldr r3, [r2, #4]
	add ip, r0, r6
	cmp ip, r3
	bhi _022C7A78
	ldr r3, [r2, #8]
	mov r1, r7
	mov r2, r6
	add r0, r3, r0
	bl MI_CpuCopy8
	mov r0, #0
	str r0, [sb]
	mov r4, #1
	b _022C7A84
_022C7A78:
	add r2, r2, #0x10
	cmp r2, r1
	blo _022C7A2C
_022C7A84:
	mov r0, r5
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end MBi_MakeParentSendBuffer__022C8210

	arm_func_start MBi_TaskThread
MBi_TaskThread: ; 0x022C7A94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
_022C7A9C:
	bl EnableIrqFlag
	ldr r1, [r7, #0xc0]
	mov r5, r0
	cmp r1, #0
	bne _022C7AD8
	mov r6, #0
	mov r4, r6
_022C7AB8:
	mov r0, r7
	mov r1, r6
	bl OS_SetThreadPriority
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r7, #0xc0]
	cmp r0, #0
	beq _022C7AB8
_022C7AD8:
	ldr r4, [r7, #0xc0]
	ldr r1, [r7, #0xc0]
	mov r0, r7
	ldr r1, [r1]
	str r1, [r7, #0xc0]
	ldr r1, [r4, #4]
	mov r1, r1, lsr #1
	bl OS_SetThreadPriority
	mov r0, r5
	bl SetIrqFlag
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022C7B14
	mov r0, r4
	blx r1
_022C7B14:
	bl EnableIrqFlag
	mov r5, r0
	mov r0, r7
	ldr r6, [r4, #0xc]
	bl OS_GetThreadPriority
	ldr r1, [r7, #0xc0]
	cmp r1, #0
	moveq r1, #0
	beq _022C7B58
	ldr r1, [r7, #0xc0]
	ldr r1, [r1, #4]
	cmp r0, r1, lsr #1
	movhs r1, r0
	bhs _022C7B58
	ldr r1, [r7, #0xc0]
	ldr r1, [r1, #4]
	mov r1, r1, lsr #1
_022C7B58:
	cmp r1, r0
	beq _022C7B68
	mov r0, r7
	bl OS_SetThreadPriority
_022C7B68:
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	cmp r6, #0
	bic r0, r0, #1
	str r0, [r4, #4]
	beq _022C7B8C
	mov r0, r4
	blx r6
_022C7B8C:
	add r0, r7, #0xc4
	cmp r4, r0
	beq _022C7BA4
	mov r0, r5
	bl SetIrqFlag
	b _022C7A9C
_022C7BA4:
	bl OS_ExitThread
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MBi_TaskThread

	arm_func_start MBi_InitTaskThread
MBi_InitTaskThread: ; 0x022C7BAC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	bl EnableIrqFlag
	ldr r1, _022C7C24 ; =ov00_02325060
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _022C7C14
	add r0, r5, #0xc4
	str r5, [r1]
	bl MBi_InitTaskInfo
	sub r0, r6, #0xe4
	mov lr, #0
	bic ip, r0, #3
	add r3, r5, #0xe4
	str lr, [r5, #0xc0]
	ldr r1, _022C7C28 ; =MBi_TaskThread
	mov r0, r5
	mov r2, r5
	add r3, r3, ip
	stmia sp, {ip, lr}
	bl OS_CreateThread
	mov r0, r5
	bl OS_WakeupThreadDirect
_022C7C14:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C7C24: .word ov00_02325060
_022C7C28: .word MBi_TaskThread
	arm_func_end MBi_InitTaskThread

	arm_func_start MBi_IsTaskAvailable
MBi_IsTaskAvailable: ; 0x022C7C2C
	ldr r0, _022C7C44 ; =ov00_02325060
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_022C7C44: .word ov00_02325060
	arm_func_end MBi_IsTaskAvailable

	arm_func_start MBi_InitTaskInfo
MBi_InitTaskInfo: ; 0x022C7C48
	ldr ip, _022C7C58 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x20
	bx ip
	.align 2, 0
_022C7C58: .word MI_CpuFill8
	arm_func_end MBi_InitTaskInfo

	arm_func_start MBi_ReadFromCache
MBi_ReadFromCache: ; 0x022C7C5C
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end MBi_ReadFromCache

	arm_func_start MBi_SetTask
MBi_SetTask: ; 0x022C7C74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022C7DD4 ; =ov00_02325060
	mov sb, r0
	ldr r4, [r4]
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl MBi_IsTaskAvailable
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0x1f
	bls _022C7CF8
	mov r0, r4
	bl OS_GetThreadPriority
	cmp r6, #0x20
	bne _022C7CD4
	cmp r0, #0
	subne r6, r0, #1
	moveq r6, #0
	b _022C7CF8
_022C7CD4:
	cmp r6, #0x21
	bne _022C7CEC
	cmp r0, #0x1f
	addlo r6, r0, #1
	movhs r6, #0x1f
	b _022C7CF8
_022C7CEC:
	cmp r6, #0x22
	moveq r6, r0
	movne r6, #0x1f
_022C7CF8:
	bl EnableIrqFlag
	ldr r1, [sb, #4]
	mov r5, r0
	bic r0, r1, #1
	orr r1, r0, #1
	and r0, r1, #1
	str r1, [sb, #4]
	orr r0, r0, r6, lsl #1
	stmib sb, {r0, r8}
	str r7, [sb, #0xc]
	ldr r0, [r4, #0xc0]
	cmp r0, #0
	add r0, r4, #0xc4
	bne _022C7D50
	cmp sb, r0
	ldreq r0, _022C7DD4 ; =ov00_02325060
	moveq r1, #0
	streq r1, [r0]
	mov r0, r4
	str sb, [r4, #0xc0]
	bl OS_WakeupThreadDirect
	b _022C7DC8
_022C7D50:
	cmp sb, r0
	ldr r1, [r4, #0xc0]
	bne _022C7D8C
	ldr r0, [r1]
	cmp r0, #0
	beq _022C7D78
_022C7D68:
	mov r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _022C7D68
_022C7D78:
	ldr r0, _022C7DD4 ; =ov00_02325060
	str sb, [r1]
	mov r1, #0
	str r1, [r0]
	b _022C7DC8
_022C7D8C:
	ldr r0, [r1, #4]
	cmp r6, r0, lsr #1
	strlo sb, [r4, #0xc0]
	strlo r1, [sb]
	blo _022C7DC8
	b _022C7DA8
_022C7DA4:
	mov r1, r2
_022C7DA8:
	ldr r2, [r1]
	cmp r2, #0
	beq _022C7DC0
	ldr r0, [r2, #4]
	cmp r6, r0, lsr #1
	bhs _022C7DA4
_022C7DC0:
	str r2, [sb]
	str sb, [r1]
_022C7DC8:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C7DD4: .word ov00_02325060
	arm_func_end MBi_SetTask

	arm_func_start MBi_EndTaskThread
MBi_EndTaskThread: ; 0x022C7DD8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r4, r0
	bl MBi_IsTaskAvailable
	cmp r0, #0
	beq _022C7E10
	ldr r0, _022C7E1C ; =ov00_02325060
	mov r1, #0
	ldr r0, [r0]
	mov r2, r5
	mov r3, r1
	add r0, r0, #0xc4
	bl MBi_SetTask
_022C7E10:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C7E1C: .word ov00_02325060
	arm_func_end MBi_EndTaskThread

	arm_func_start MBi_SetChildMpMaxSize
MBi_SetChildMpMaxSize: ; 0x022C7E20
	stmdb sp!, {r3, lr}
	ldr r2, _022C7E4C ; =ov00_02325064
	sub r1, r0, #2
	mov r0, #0x1e
	str r1, [r2, #8]
	bl _s32_div_f
	ldr r1, _022C7E4C ; =ov00_02325064
	mov r2, #0x1e
	str r0, [r1, #0xc]
	str r2, [r1, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C7E4C: .word ov00_02325064
	arm_func_end MBi_SetChildMpMaxSize

	arm_func_start MBi_SetParentPieceBuffer
MBi_SetParentPieceBuffer: ; 0x022C7E50
	ldr r3, _022C7E68 ; =ov00_02325064
	ldr ip, _022C7E6C ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x21c
	str r0, [r3, #4]
	bx ip
	.align 2, 0
_022C7E68: .word ov00_02325064
_022C7E6C: .word MI_CpuFill8
	arm_func_end MBi_SetParentPieceBuffer

	arm_func_start MBi_ClearParentPieceBuffer
MBi_ClearParentPieceBuffer: ; 0x022C7E70
	stmdb sp!, {r4, lr}
	ldr r1, _022C7EB0 ; =ov00_02325064
	ldr r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	sub r4, r0, #1
	add r0, r1, r4, lsl #5
	mov r1, #0
	mov r2, #0x1e
	bl MI_CpuFill8
	ldr r0, _022C7EB0 ; =ov00_02325064
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	str r1, [r0, #0x1e0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C7EB0: .word ov00_02325064
	arm_func_end MBi_ClearParentPieceBuffer

	arm_func_start MBi_MakeParentSendBuffer__022C86C8
MBi_MakeParentSendBuffer__022C86C8: ; 0x022C7EB4
	ldrb r2, [r0]
	mov r3, r1
	add r3, r3, #1
	strb r2, [r1]
	ldrb r1, [r0]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _022C7F28
_022C7ED4: ; jump table
	b _022C7F28 ; case 0
	b _022C7F30 ; case 1
	b _022C7F30 ; case 2
	b _022C7F30 ; case 3
	b _022C7EF0 ; case 4
	b _022C7F30 ; case 5
	b _022C7F30 ; case 6
_022C7EF0:
	ldrh r1, [r0, #2]
	strb r1, [r3]
	ldrh r1, [r0, #2]
	and r1, r1, #0xff00
	mov r1, r1, asr #8
	strb r1, [r3, #1]
	ldrh r1, [r0, #4]
	strb r1, [r3, #2]
	ldrh r0, [r0, #4]
	and r0, r0, #0xff00
	mov r0, r0, asr #8
	strb r0, [r3, #3]
	add r3, r3, #4
	b _022C7F30
_022C7F28:
	mov r0, #0
	bx lr
_022C7F30:
	mov r0, r3
	bx lr
	arm_func_end MBi_MakeParentSendBuffer__022C86C8

	arm_func_start MBi_SetRecvBufferFromChild
MBi_SetRecvBufferFromChild: ; 0x022C7F38
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6]
	mov r5, r1
	mov r4, r2
	strb r0, [r5]
	cmp r0, #7
	beq _022C7F6C
	cmp r0, #8
	beq _022C7FD0
	cmp r0, #9
	beq _022C7FF8
	b _022C8040
_022C7F6C:
	mov r0, r4
	bl IsGetAllRequestData
	cmp r0, #0
	beq _022C7F90
	ldr r0, _022C8050 ; =ov00_02325064
	sub r1, r4, #1
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #5
	ldmia sp!, {r4, r5, r6, pc}
_022C7F90:
	ldrb r2, [r6, #1]
	ldr r0, _022C8050 ; =ov00_02325064
	strb r2, [r5, #2]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, pc}
	ldr r2, [r0, #8]
	add r0, r6, #2
	add r1, r5, #3
	bl MI_CpuCopy8
	mov r0, r5
	mov r1, r4
	bl MBi_ReceiveRequestDataPiece
	mov r4, r0
	b _022C8048
_022C7FD0:
	ldrb r0, [r6, #1]
	add r4, r6, #3
	strh r0, [r5, #2]
	ldrb r0, [r6, #2]
	ldrh r1, [r5, #2]
	mov r0, r0, lsl #8
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [r5, #2]
	b _022C8048
_022C7FF8:
	ldrb r0, [r6, #1]
	add r4, r6, #3
	ldr r1, _022C8050 ; =ov00_02325064
	strh r0, [r5, #2]
	ldrb r2, [r6, #2]
	ldrh r3, [r5, #2]
	mov r0, r4
	mov r2, r2, lsl #8
	and r2, r2, #0xff00
	orr r2, r3, r2
	strh r2, [r5, #2]
	ldr r2, [r1, #8]
	add r1, r5, #4
	bl MI_CpuCopy8
	ldr r0, _022C8050 ; =ov00_02325064
	ldr r0, [r0, #8]
	add r4, r4, r0
	b _022C8048
_022C8040:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022C8048:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C8050: .word ov00_02325064
	arm_func_end MBi_SetRecvBufferFromChild

	arm_func_start MBi_ReceiveRequestDataPiece
MBi_ReceiveRequestDataPiece: ; 0x022C8054
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _022C80DC ; =ov00_02325064
	mov r6, r1
	ldr r3, [r2, #4]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r5, [r0, #2]
	ldr r1, [r2, #0xc]
	cmp r5, r1
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, pc}
	sub r4, r6, #1
	ldr r2, [r2, #8]
	add r1, r3, r4, lsl #5
	mla r1, r5, r2, r1
	add r0, r0, #3
	bl MI_CpuCopy8
	ldr r0, _022C80DC ; =ov00_02325064
	mov r1, #1
	ldr r2, [r0, #4]
	mov r0, r6
	add r3, r2, #0x1e0
	ldr r2, [r3, r4, lsl #2]
	orr r1, r2, r1, lsl r5
	str r1, [r3, r4, lsl #2]
	bl IsGetAllRequestData
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _022C80DC ; =ov00_02325064
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C80DC: .word ov00_02325064
	arm_func_end MBi_ReceiveRequestDataPiece

	arm_func_start IsGetAllRequestData
IsGetAllRequestData: ; 0x022C80E0
	ldr r1, _022C8130 ; =ov00_02325064
	mov r2, #0
	ldr ip, [r1, #0xc]
	cmp ip, #0
	ble _022C8128
	ldr r1, [r1, #4]
	sub r0, r0, #1
	add r0, r1, r0, lsl #2
	ldr r3, [r0, #0x1e0]
	mov r1, #1
_022C8108:
	tst r3, r1, lsl r2
	moveq r0, #0
	bxeq lr
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	cmp ip, r0, lsr #16
	mov r2, r0, lsr #0x10
	bgt _022C8108
_022C8128:
	mov r0, #1
	bx lr
	.align 2, 0
_022C8130: .word ov00_02325064
	arm_func_end IsGetAllRequestData

	arm_func_start reset_network_vars
reset_network_vars: ; 0x022C8134
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022C8228 ; =ov00_02325078
	ldr r2, _022C8228 ; =ov00_02325078
	ldr r1, [r1, #0x50]
	str r0, [r2, #0xc]
	cmp r1, #0
	mov r1, #0
	str r1, [r2, #0x50]
	str r1, [r2, #0x1c]
	str r1, [r2, #0x2c]
	str r1, [r2, #0x60]
	movne r3, #1
	str r1, [r2, #0x64]
	moveq r3, #0
	str r1, [r2, #0x20]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022C822C ; =ov00_023250F8
	mov r2, #0x60
	bl MI_CpuFill8
	ldr r0, _022C8230 ; =OSi_ThreadInfo
	ldr r6, [r0, #8]
	cmp r6, #0
	beq _022C81E4
	mov r5, #0
	mov r4, r5
_022C819C:
	ldr r1, [r6, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	beq _022C81D8
	ldrb r0, [r1, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	strneb r5, [r1, #8]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022C81D8
	str r4, [r1, #4]
	ldr r0, [r1]
	bl OS_WakeupThreadDirect
_022C81D8:
	ldr r6, [r6, #0x68]
	cmp r6, #0
	bne _022C819C
_022C81E4:
	mov r6, #0
	ldr r7, _022C8234 ; =ov00_023253A0
	ldr r4, _022C8228 ; =ov00_02325078
	mov r5, r6
_022C81F4:
	ldrh r0, [r7, #4]
	cmp r0, #0
	beq _022C8210
	ldr r0, [r7, #0x34]
	ldr r1, [r4, #0x40]
	blx r1
	strh r5, [r7, #4]
_022C8210:
	add r6, r6, #1
	cmp r6, #8
	add r7, r7, #0x38
	blt _022C81F4
	bl Cpsi_SslCleanup
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C8228: .word ov00_02325078
_022C822C: .word ov00_023250F8
_022C8230: .word OSi_ThreadInfo
_022C8234: .word ov00_023253A0
	arm_func_end reset_network_vars

	arm_func_start OS_YieldThread2
OS_YieldThread2: ; 0x022C8238
	stmdb sp!, {r3, lr}
	ldr r0, _022C825C ; =ov00_02325078
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _022C8254
	bl OS_YieldThread
	ldmia sp!, {r3, pc}
_022C8254:
	bl OS_Sleep
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C825C: .word ov00_02325078
	arm_func_end OS_YieldThread2

	arm_func_start Empty_Func_Cps
Empty_Func_Cps: ; 0x022C8260
	bx lr
	arm_func_end Empty_Func_Cps

	arm_func_start default_link_is_on
default_link_is_on: ; 0x022C8264
	mov r0, #1
	bx lr
	arm_func_end default_link_is_on

	arm_func_start Cps_Startup
Cps_Startup: ; 0x022C826C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r0, _022C8464 ; =_02000BDC
	bl OSi_ReferSymbol
	ldr r3, [r4, #0x18]
	ldr r5, [r4, #0x14]
	cmp r3, #0
	cmpeq r5, #0
	mov r1, #0
	beq _022C82C4
	ldr r0, _022C8468 ; =ov00_02325078
	ldr r2, _022C846C ; =0x6C078965
	str r5, [r0, #0x68]
	str r3, [r0, #0x6c]
	ldr r3, _022C8470 ; =0x5D588B65
	str r2, [r0, #0x70]
	ldr r2, _022C8474 ; =0x00269EC3
	str r3, [r0, #0x74]
	str r2, [r0, #0x78]
	str r1, [r0, #0x7c]
	b _022C82F4
_022C82C4:
	bl OS_GetTick
	ldr r2, _022C8468 ; =ov00_02325078
	ldr r3, _022C846C ; =0x6C078965
	str r0, [r2, #0x68]
	str r1, [r2, #0x6c]
	ldr r1, _022C8470 ; =0x5D588B65
	str r3, [r2, #0x70]
	ldr r0, _022C8474 ; =0x00269EC3
	str r1, [r2, #0x74]
	str r0, [r2, #0x78]
	mov r0, #0
	str r0, [r2, #0x7c]
_022C82F4:
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r4, #8]
	cmpne r0, #0
	beq _022C8318
	ldr r0, _022C8468 ; =ov00_02325078
	str r1, [r0, #0x14]
	ldr r1, [r4, #8]
	b _022C8324
_022C8318:
	ldr r1, _022C8478 ; =Empty_Func_Cps
	ldr r0, _022C8468 ; =ov00_02325078
	str r1, [r0, #0x14]
_022C8324:
	str r1, [r0, #0x40]
	ldr r1, [r4]
	ldr r0, _022C8468 ; =ov00_02325078
	ldr r2, _022C8468 ; =ov00_02325078
	str r1, [r0, #0x10]
	ldr r1, [r4, #0x24]
	cmp r1, #0
	ldreq r1, _022C847C ; =0x000005B4
	strh r1, [r0, #2]
	ldr r1, [r4, #0x28]
	ldr r0, _022C8468 ; =ov00_02325078
	str r1, [r0, #0x34]
	ldr r1, [r4, #0x2c]
	str r1, [r0, #0x24]
	ldr r1, [r4, #0xc]
	cmp r1, #0
	ldreq r1, _022C8478 ; =Empty_Func_Cps
	str r1, [r0, #0x18]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	ldrne r0, _022C8468 ; =ov00_02325078
	ldreq r1, _022C8480 ; =default_link_is_on
	ldreq r0, _022C8468 ; =ov00_02325078
	str r1, [r0, #0x48]
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r1, [r2, #0x58]
	ldr r3, [r4, #0x20]
	ldr r1, _022C8484 ; =0x00000F88
	str r3, [r2, #0x5c]
	str r0, [r2, #0x30]
	str r0, [r2, #0x28]
	ldr ip, [r2, #0x70]
	ldr r4, [r2, #0x68]
	ldr r3, [r2, #0x6c]
	umull r5, lr, ip, r4
	mla lr, ip, r3, lr
	ldr r3, [r2, #0x74]
	ldr ip, [r2, #0x78]
	mla lr, r3, r4, lr
	ldr r3, [r2, #0x7c]
	adds ip, ip, r5
	adc r5, r3, lr
	umull r3, r4, r5, r1
	mla r4, r5, r0, r4
	mla r4, r0, r1, r4
	str ip, [r2, #0x68]
	ldr r0, _022C8488 ; =ov00_02325560
	str r5, [r2, #0x6c]
	add r1, r4, #0x400
	strh r1, [r2, #8]
	bl OS_GetMacAddress
	ldr r0, _022C8468 ; =ov00_02325078
	mov r2, #0
	strb r2, [r0, #1]
	mov r1, #0x800
	str r1, [sp]
	ldr r0, _022C848C ; =ov00_02318844
	ldr r1, _022C8490 ; =tcpip
	ldr r4, [r0]
	ldr r0, _022C8494 ; =ov00_023252E0
	ldr r3, _022C8498 ; =ov00_023268C0
	str r4, [sp, #4]
	bl OS_CreateThread
	mov r1, #0x800
	ldr r0, _022C848C ; =ov00_02318844
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, _022C849C ; =ov00_02325220
	str r1, [sp, #4]
	ldr r1, _022C84A0 ; =scavenger
	ldr r3, _022C84A4 ; =ov00_023260C0
	mov r2, #0
	bl OS_CreateThread
	ldr r0, _022C8494 ; =ov00_023252E0
	bl OS_WakeupThreadDirect
	ldr r0, _022C849C ; =ov00_02325220
	bl OS_WakeupThreadDirect
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C8464: .word _02000BDC
_022C8468: .word ov00_02325078
_022C846C: .word 0x6C078965
_022C8470: .word 0x5D588B65
_022C8474: .word 0x00269EC3
_022C8478: .word Empty_Func_Cps
_022C847C: .word 0x000005B4
_022C8480: .word default_link_is_on
_022C8484: .word 0x00000F88
_022C8488: .word ov00_02325560
_022C848C: .word ov00_02318844
_022C8490: .word tcpip
_022C8494: .word ov00_023252E0
_022C8498: .word ov00_023268C0
_022C849C: .word ov00_02325220
_022C84A0: .word scavenger
_022C84A4: .word ov00_023260C0
	arm_func_end Cps_Startup

	arm_func_start Cps_CalmDown
Cps_CalmDown: ; 0x022C84A8
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	mov r4, r0
	ldr r0, _022C84F0 ; =ov00_02325220
	bl OS_IsThreadTerminated
	movs r5, r0
	ldreq r1, _022C84F4 ; =ov00_02325078
	ldreq r0, [r1, #0x44]
	cmpeq r0, #0
	bne _022C84E0
	ldr r0, _022C84F0 ; =ov00_02325220
	mov r2, #1
	str r2, [r1, #0x44]
	bl OS_WakeupThreadDirect
_022C84E0:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C84F0: .word ov00_02325220
_022C84F4: .word ov00_02325078
	arm_func_end Cps_CalmDown

	arm_func_start Cps_SetScavengerCallback
Cps_SetScavengerCallback: ; 0x022C84F8
	ldr r1, _022C8504 ; =ov00_02325078
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_022C8504: .word ov00_02325078
	arm_func_end Cps_SetScavengerCallback

	arm_func_start Cps_Cleanup
Cps_Cleanup: ; 0x022C8508
	stmdb sp!, {r3, lr}
	bl Cps_CalmDown
	ldr r0, _022C8544 ; =ov00_02325220
	bl OS_JoinThread
	ldr r0, _022C8548 ; =ov00_023252E0
	bl OS_DestroyThread
	ldr r1, _022C854C ; =ov00_02325078
	mov r0, #0
	str r0, [r1, #0x54]
	bl reset_network_vars
	ldr r0, _022C854C ; =ov00_02325078
	mov r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C8544: .word ov00_02325220
_022C8548: .word ov00_023252E0
_022C854C: .word ov00_02325078
	arm_func_end Cps_Cleanup

	arm_func_start Cps_SetThreadPriority
Cps_SetThreadPriority: ; 0x022C8550
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, _022C857C ; =ov00_02318844
	ldr r0, _022C8580 ; =ov00_023252E0
	mov r1, r4
	str r4, [r2]
	bl OS_SetThreadPriority
	ldr r0, _022C8584 ; =ov00_02325220
	mov r1, r4
	bl OS_SetThreadPriority
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C857C: .word ov00_02318844
_022C8580: .word ov00_023252E0
_022C8584: .word ov00_02325220
	arm_func_end Cps_SetThreadPriority

	arm_func_start calc_checksum_do
calc_checksum_do: ; 0x022C8588
	tst r0, #1
	beq _022C85C0
	cmp r1, #1
	bls _022C8610
_022C8598:
	ldrb ip, [r0]
	ldrb r3, [r0, #1]
	sub r1, r1, #2
	cmp r1, #1
	orr r3, r3, ip, lsl #8
	mov r3, r3, lsl #0x10
	add r2, r2, r3, lsr #16
	add r0, r0, #2
	bhi _022C8598
	b _022C8610
_022C85C0:
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp r1, #1
	mov r2, r2, lsr #0x10
	bls _022C85F4
_022C85E0:
	ldrh r3, [r0], #2
	sub r1, r1, #2
	cmp r1, #1
	add r2, r2, r3
	bhi _022C85E0
_022C85F4:
	ldr r3, _022C8638 ; =0x00FF00FF
	mov ip, r3, lsl #8
	and r3, r3, r2, lsr #8
	and r2, ip, r2, lsl #8
	orr r3, r3, r2
	mov r2, r3, lsl #0x10
	orr r2, r2, r3, lsr #16
_022C8610:
	cmp r1, #0
	ldrneb r0, [r0]
	addne r2, r2, r0, lsl #8
	mov r0, r2, lsl #0x10
	mov r1, r2, lsr #0x10
	add r0, r1, r0, lsr #16
	add r0, r0, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_022C8638: .word 0x00FF00FF
	arm_func_end calc_checksum_do

	arm_func_start invert_checksum
invert_checksum: ; 0x022C863C
	ldr r1, _022C8654 ; =0x0000FFFF
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	moveq r0, r1
	bx lr
	.align 2, 0
_022C8654: .word 0x0000FFFF
	arm_func_end invert_checksum

	arm_func_start calc_checksum
calc_checksum: ; 0x022C8658
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	ldmia sp!, {r3, pc}
	arm_func_end calc_checksum

	arm_func_start check_tcpudpsum
check_tcpudpsum: ; 0x022C8674
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r2, r3
	mov r5, r1
	bl calc_checksum_do
	mov r2, r0
	add r0, r4, #0xc
	mov r1, #8
	bl calc_checksum_do
	add r1, r0, r5
	tst r1, #0x10000
	addne r0, r1, #1
	movne r0, r0, lsl #0x10
	movne r1, r0, lsr #0x10
	ldr r0, _022C86C0 ; =0x0000FFFF
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C86C0: .word 0x0000FFFF
	arm_func_end check_tcpudpsum

	arm_func_start ip_islocal
ip_islocal: ; 0x022C86C4
	mov ip, #1
	sub r1, ip, #2
	cmp r0, r1
	subne r1, ip, #0x81000000
	cmpne r0, r1
	beq _022C86F8
	ldr r1, _022C8700 ; =ov00_02325078
	ldr r3, [r1, #0x1c]
	ldr r1, [r1, #0x50]
	and r2, r0, r3
	and r0, r1, r3
	cmp r2, r0
	movne ip, #0
_022C86F8:
	mov r0, ip
	bx lr
	.align 2, 0
_022C8700: .word ov00_02325078
	arm_func_end ip_islocal

	arm_func_start get_targetip
get_targetip: ; 0x022C8704
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ip_islocal
	cmp r0, #0
	ldreq r0, _022C8724 ; =ov00_02325078
	ldreq r4, [r0, #0x2c]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C8724: .word ov00_02325078
	arm_func_end get_targetip

	arm_func_start is_broadcast
is_broadcast: ; 0x022C8728
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl ip_islocal
	cmp r0, #0
	beq _022C8758
	ldr r0, _022C8760 ; =ov00_02325078
	ldr r0, [r0, #0x1c]
	mvn r1, r0
	and r0, r1, r5
	cmp r1, r0
	moveq r4, #1
_022C8758:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022C8760: .word ov00_02325078
	arm_func_end is_broadcast

	arm_func_start is_multicast
is_multicast: ; 0x022C8764
	and r0, r0, #0xf0000000
	cmp r0, #0xe0000000
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end is_multicast

	arm_func_start ip_isme
ip_isme: ; 0x022C8778
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022C87F0 ; =ov00_02325078
	mov r4, #1
	ldr r1, [r1, #0x50]
	mov r6, r0
	cmp r1, #0
	mov r0, r4
	cmpne r6, r1
	movne r0, #0
	mov r5, r4
	mov r2, r4
	cmp r0, #0
	bne _022C87B8
	ldr r0, _022C87F4 ; =0x7F000001
	cmp r6, r0
	movne r2, #0
_022C87B8:
	cmp r2, #0
	bne _022C87D0
	mov r0, r6
	bl is_broadcast
	cmp r0, #0
	moveq r5, #0
_022C87D0:
	cmp r5, #0
	bne _022C87E8
	mov r0, r6
	bl is_multicast
	cmp r0, #0
	moveq r4, #0
_022C87E8:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C87F0: .word ov00_02325078
_022C87F4: .word 0x7F000001
	arm_func_end ip_isme

	arm_func_start maccmp
maccmp: ; 0x022C87F8
	mov ip, #0
_022C87FC:
	ldrh r3, [r0], #2
	ldrh r2, [r1], #2
	cmp r3, r2
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, #3
	blt _022C87FC
	mov r0, #0
	bx lr
	arm_func_end maccmp

	arm_func_start send_packet
send_packet: ; 0x022C8824
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _022C8878 ; =ov00_02318850
	add r1, r7, #6
	mov r2, #6
	mov r4, r3
	bl MI_CpuCopy8
	mov r0, r7
	mov r3, r5
	add r1, r7, #6
	sub r2, r6, #6
	str r4, [sp]
	bl Wcm_SendDcfData
	cmp r0, #0
	movlt r1, #1
	ldr r0, _022C887C ; =ov00_02325078
	movge r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C8878: .word ov00_02318850
_022C887C: .word ov00_02325078
	arm_func_end send_packet

	arm_func_start put_in_buffer
put_in_buffer: ; 0x022C8880
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _022C8A68 ; =ov00_02325078
	mov r7, r0
	ldr ip, [r4, #0x58]
	mov r6, r2
	cmp ip, #0
	ldrne r0, [r4, #0x5c]
	mov r5, r3
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	add r0, r5, r0
	cmp r0, #8
	ldmloia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _022C8A6C ; =0x000005E4
	cmp r0, r2
	ldmhiia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _022C8A70 ; =ov00_02318850
	ldrb r4, [r6]
	ldrb r3, [r2]
	cmp r4, r3
	ldreqb r4, [r6, #1]
	ldreqb r3, [r2, #1]
	cmpeq r4, r3
	ldreqb r3, [r6, #2]
	ldreqb r2, [r2, #2]
	cmpeq r3, r2
	ldreqb r2, [r6, #6]
	cmpeq r2, #8
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r2, [r6, #7]
	cmp r2, #0
	cmpne r2, #6
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _022C8A68 ; =ov00_02325078
	add r0, r0, #9
	bic r0, r0, #1
	ldr r8, [r2, #0x28]
	mov r0, r0, lsl #0x10
	ldr lr, [r2, #0x28]
	ldr r4, [r2, #0x30]
	mov r3, r0, lsr #0x10
	cmp lr, r4
	add r4, r8, r0, lsr #16
	bhs _022C8940
	ldr r0, [r2, #0x30]
	cmp r0, r4
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_022C8940:
	ldr r0, _022C8A68 ; =ov00_02325078
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bne _022C8964
	ldr r0, [r0, #0x30]
	mov r4, #0
	cmp r0, #0
	bne _022C8980
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C8964:
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bls _022C8980
	ldr r0, [r0, #0x30]
	mov r4, r3
	cmp r0, r3
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_022C8980:
	ldr r0, _022C8A68 ; =ov00_02325078
	ldr lr, [r0, #0x28]
	ldr r2, [r0, #0x5c]
	add lr, lr, r3
	cmp lr, r2
	bls _022C89C0
	ldr lr, [r0, #0x5c]
	ldr r2, [r0, #0x28]
	sub r2, lr, r2
	cmp r2, #2
	ldrhs r0, [r0, #0x28]
	movhs r2, #0
	strhsh r2, [ip, r0]
	ldr r0, _022C8A68 ; =ov00_02325078
	mov r2, #0
	str r2, [r0, #0x28]
_022C89C0:
	ldr ip, _022C8A68 ; =ov00_02325078
	mov r0, r1
	ldr lr, [ip, #0x58]
	ldr r1, [ip, #0x28]
	mov r2, #6
	strh r3, [lr, r1]
	ldr r3, [ip, #0x58]
	ldr r1, [ip, #0x28]
	add r1, r3, r1
	add r1, r1, #2
	bl MI_CpuCopy8
	ldr r1, _022C8A68 ; =ov00_02325078
	mov r0, r7
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	mov r2, #6
	add r1, r3, r1
	add r1, r1, #8
	bl MI_CpuCopy8
	ldr r1, _022C8A68 ; =ov00_02325078
	add r0, r6, #6
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	sub r2, r5, #6
	add r1, r3, r1
	add r1, r1, #0xe
	bl MI_CpuCopy8
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldrne r2, [sp, #0x1c]
	cmpne r2, #0
	beq _022C8A5C
	ldr r1, _022C8A68 ; =ov00_02325078
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	add r1, r3, r1
	add r1, r1, #8
	add r1, r1, r5
	bl MI_CpuCopy8
_022C8A5C:
	ldr r0, _022C8A68 ; =ov00_02325078
	str r4, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C8A68: .word ov00_02325078
_022C8A6C: .word 0x000005E4
_022C8A70: .word ov00_02318850
	arm_func_end put_in_buffer

	arm_func_start Cpsi_RecvCallbackFunc
Cpsi_RecvCallbackFunc: ; 0x022C8A74
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	bl put_in_buffer
	ldr r0, _022C8AC8 ; =ov00_02325078
	ldr r1, [r0, #0x54]
	cmp r1, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #0x54]
	bl OS_IsThreadTerminated
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	ldr r0, _022C8AC8 ; =ov00_02325078
	ldr r0, [r0, #0x54]
	bl OS_WakeupThreadDirect
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C8AC8: .word ov00_02325078
	arm_func_end Cpsi_RecvCallbackFunc

	arm_func_start receive_packet
receive_packet: ; 0x022C8ACC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	bl EnableIrqFlag
	ldr sb, _022C8B84 ; =ov00_02325078
	mov r6, r0
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	bne _022C8B20
	mov r5, #0
	ldr r8, _022C8B88 ; =OSi_ThreadInfo
	mov r4, r5
_022C8AFC:
	ldr r1, [r8, #4]
	mov r0, r5
	str r1, [sb, #0x54]
	bl OS_SleepThread
	str r4, [sb, #0x54]
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	beq _022C8AFC
_022C8B20:
	mov r0, r6
	bl SetIrqFlag
	ldr r0, _022C8B84 ; =ov00_02325078
	mov r3, #0
	ldr r5, [r0, #0x58]
	mov r1, r3
_022C8B38:
	ldr r4, [r0, #0x5c]
	ldr r2, [r0, #0x30]
	sub r2, r4, r2
	cmp r2, #2
	strlo r3, [r0, #0x30]
	ldr r2, [r0, #0x30]
	ldrh r2, [r5, r2]
	cmp r2, #0
	streq r1, [r0, #0x30]
	cmp r2, #0
	beq _022C8B38
	sub r1, r2, #2
	ldr r0, _022C8B84 ; =ov00_02325078
	str r1, [r7]
	ldr r1, [r0, #0x58]
	ldr r0, [r0, #0x30]
	add r0, r1, r0
	add r0, r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C8B84: .word ov00_02325078
_022C8B88: .word OSi_ThreadInfo
	arm_func_end receive_packet

	arm_func_start throw_packet
throw_packet: ; 0x022C8B8C
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r1, _022C8BCC ; =ov00_02325078
	ldr ip, [r1, #0x30]
	ldr r3, [r1, #0x58]
	ldr r2, [r1, #0x30]
	ldrh r2, [r3, r2]
	add r2, ip, r2
	str r2, [r1, #0x30]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x5c]
	cmp r3, r2
	movhs r2, #0
	strhs r2, [r1, #0x30]
	bl SetIrqFlag
	ldmia sp!, {r3, pc}
	.align 2, 0
_022C8BCC: .word ov00_02325078
	arm_func_end throw_packet

	arm_func_start inq_arpcache
inq_arpcache: ; 0x022C8BD0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _022C8C88 ; =0x7F000001
	mov r4, r0
	cmp r5, r1
	ldrne r0, _022C8C8C ; =ov00_02325078
	mov r7, #0
	ldrne r0, [r0, #0x50]
	cmpne r5, r0
	ldreq r7, _022C8C90 ; =ov00_02325560
	beq _022C8C78
	mov r0, r5
	bl is_broadcast
	cmp r0, #0
	bne _022C8C20
	mov r0, r5
	bl is_multicast
	cmp r0, #0
	beq _022C8C28
_022C8C20:
	ldr r7, _022C8C94 ; =ov00_02318848
	b _022C8C78
_022C8C28:
	ldr r1, _022C8C98 ; =ov00_023250F8
	mov r6, r7
_022C8C30:
	ldr r0, [r1]
	cmp r5, r0
	bne _022C8C68
	bl OS_GetTick
	mov r2, #0xc
	mul r3, r6, r2
	ldr r2, _022C8C98 ; =ov00_023250F8
	mov r5, r0, lsr #0x10
	add r0, r2, r3
	ldr r2, _022C8C9C ; =ov00_02325102
	orr r5, r5, r1, lsl #16
	strh r5, [r2, r3]
	add r7, r0, #4
	b _022C8C78
_022C8C68:
	add r6, r6, #1
	cmp r6, #8
	add r1, r1, #0xc
	blo _022C8C30
_022C8C78:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C8C88: .word 0x7F000001
_022C8C8C: .word ov00_02325078
_022C8C90: .word ov00_02325560
_022C8C94: .word ov00_02318848
_022C8C98: .word ov00_023250F8
_022C8C9C: .word ov00_02325102
	arm_func_end inq_arpcache

	arm_func_start send_arprequest
send_arprequest: ; 0x022C8CA0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x2a
	bl MI_CpuFill8
	add r0, sp, #0
	mov r1, #0xff
	mov r2, #6
	bl MI_CpuFill8
	ldr r0, _022C8D8C ; =ov00_02325560
	add r1, sp, #6
	mov r2, #6
	bl MI_CpuCopy8
	mov r0, #1
	ldr r1, _022C8D90 ; =0x00000608
	strb r0, [sp, #0xf]
	strh r1, [sp, #0xc]
	strb r0, [sp, #0x15]
	mov r0, #8
	ldr r1, _022C8D94 ; =0x00000406
	strb r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	ldr r0, _022C8D8C ; =ov00_02325560
	add r1, sp, #0x16
	mov r2, #6
	bl MI_CpuCopy8
	ldr r0, _022C8D98 ; =ov00_02325078
	mov r1, r4, lsr #0x10
	ldr r3, [r0, #0x50]
	mov r0, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r3, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r4, lsl #8
	orr r0, r0, r4, asr #8
	strh r0, [sp, #0x1c]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [sp, #0x1e]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	strh r0, [sp, #0x26]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r2, #0
	strh r0, [sp, #0x28]
	add r0, sp, #0
	mov r1, #0x2a
	mov r3, r2
	bl send_packet
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022C8D8C: .word ov00_02325560
_022C8D90: .word 0x00000608
_022C8D94: .word 0x00000406
_022C8D98: .word ov00_02325078
	arm_func_end send_arprequest

	arm_func_start arprequest
arprequest: ; 0x022C8D9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #0
	ldr r4, _022C8E08 ; =ov00_02325078
	mov sb, r0
	mov r5, #0x64
	mov r6, r7
_022C8DB4:
	mov r0, sb
	bl send_arprequest
	mov r8, r6
_022C8DC0:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl OS_Sleep
	mov r0, sb
	bl inq_arpcache
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r8, r8, #1
	cmp r8, #0x14
	blo _022C8DC0
	add r7, r7, #1
	cmp r7, #8
	blo _022C8DB4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022C8E08: .word ov00_02325078
	arm_func_end arprequest

	arm_func_start reg_arpcache
reg_arpcache: ; 0x022C8E0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _022C8F38 ; =0x7F000001
	mov r6, r1
	mov r7, r0
	cmp r6, r3
	ldrne r0, _022C8F3C ; =ov00_02325078
	mov r5, r2
	ldrne r0, [r0, #0x50]
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ip_islocal
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl is_multicast
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	mov r0, r0, lsl #0x10
	ldr r2, _022C8F40 ; =ov00_023250F8
	mov r4, r0, lsr #0x10
	mov r1, #0
_022C8E70:
	ldr r0, [r2]
	cmp r6, r0
	bne _022C8EA8
	mov r0, #0xc
	mul r5, r1, r0
	ldr r0, _022C8F40 ; =ov00_023250F8
	ldr r3, _022C8F44 ; =ov00_02325102
	add r1, r0, r5
	mov r0, r7
	add r1, r1, #4
	mov r2, #6
	strh r4, [r3, r5]
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C8EA8:
	add r1, r1, #1
	cmp r1, #8
	add r2, r2, #0xc
	blo _022C8E70
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r2, #0
	ldr r3, _022C8F40 ; =ov00_023250F8
	mov r1, r2
	mov r5, r2
_022C8ED0:
	ldr r0, [r3]
	cmp r0, #0
	moveq r1, r5
	beq _022C8F08
	ldrh r0, [r3, #0xa]
	add r3, r3, #0xc
	sub r0, r4, r0
	mov r0, r0, lsl #0x10
	cmp r2, r0, asr #16
	movlt r1, r5
	add r5, r5, #1
	movlt r2, r0, lsr #0x10
	cmp r5, #8
	blo _022C8ED0
_022C8F08:
	mov r0, #0xc
	mul r5, r1, r0
	ldr r3, _022C8F40 ; =ov00_023250F8
	mov r0, r7
	add r1, r3, r5
	add r1, r1, #4
	mov r2, #6
	str r6, [r3, r5]
	bl MI_CpuCopy8
	ldr r0, _022C8F44 ; =ov00_02325102
	strh r4, [r0, r5]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C8F38: .word 0x7F000001
_022C8F3C: .word ov00_02325078
_022C8F40: .word ov00_023250F8
_022C8F44: .word ov00_02325102
	arm_func_end reg_arpcache

	arm_func_start send_ether
send_ether: ; 0x022C8F48
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r5, [sp, #0x1c]
	ldr r4, [sp, #0x18]
	mov r8, r0
	mov r0, r5, lsl #8
	orr ip, r0, r5, asr #8
	mov r0, r4
	mov r7, r1
	mov r6, r2
	mov r5, r3
	strh ip, [r8, #-2]
	bl is_multicast
	cmp r0, #0
	bne _022C8FBC
	mov r0, r4
	bl get_targetip
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl inq_arpcache
	cmp r0, #0
	bne _022C8FA4
	mov r0, r4
	bl arprequest
_022C8FA4:
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r8, #0xe
	mov r2, #6
	bl MI_CpuCopy8
	b _022C8FEC
_022C8FBC:
	mov r0, #1
	strb r0, [r8, #-0xe]
	mov r1, #0
	mov r0, r4, lsr #0x10
	strb r1, [r8, #-0xd]
	mov r1, #0x5e
	strb r1, [r8, #-0xc]
	and r0, r0, #0x7f
	strb r0, [r8, #-0xb]
	mov r0, r4, lsr #8
	strb r0, [r8, #-0xa]
	strb r4, [r8, #-9]
_022C8FEC:
	ldr r0, _022C9014 ; =ov00_02325560
	sub r1, r8, #8
	mov r2, #6
	bl MI_CpuCopy8
	mov r2, r6
	mov r3, r5
	sub r0, r8, #0xe
	add r1, r7, #0xe
	bl send_packet
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C9014: .word ov00_02325560
	arm_func_end send_ether

	arm_func_start send_ip_frag
send_ip_frag: ; 0x022C9018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r5, r3
	add r1, r7, #0x14
	add r1, r1, r5
	mov r1, r1, lsl #0x10
	ldr r3, [sp, #0x24]
	mov r4, r1, lsr #0x10
	mov r1, r3, lsl #0x10
	mov r3, r4, lsl #8
	orr r3, r3, r4, asr #8
	mov r8, r0
	mov r1, r1, lsr #0x10
	mov r0, r1, lsl #8
	strh r3, [r8, #-0x12]
	orr r0, r0, r1, asr #8
	strh r0, [r8, #-0xe]
	mov r3, #0
	sub r0, r8, #0x14
	mov r1, #0x14
	mov r6, r2
	strh r3, [r8, #-0xa]
	ldr r4, [sp, #0x20]
	bl calc_checksum
	mov r2, r0, lsl #8
	ldr r1, _022C9130 ; =0x7F000001
	orr r0, r2, r0, asr #8
	strh r0, [r8, #-0xa]
	cmp r4, r1
	ldrne r0, _022C9134 ; =ov00_02325078
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _022C90C0
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	mov ip, #0x800
	sub r0, r8, #0x14
	add r1, r7, #0x14
	str ip, [sp, #4]
	bl send_ether
_022C90C0:
	ldr r0, _022C9130 ; =0x7F000001
	cmp r4, r0
	ldrne r0, _022C9134 ; =ov00_02325078
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _022C90EC
	mov r0, r4
	bl is_multicast
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_022C90EC:
	ldr r0, _022C9138 ; =ov00_02318850
	sub r1, r8, #0x1c
	mov r2, #8
	bl MI_CpuCopy8
	bl EnableIrqFlag
	mov r4, r0
	ldr r0, _022C913C ; =ov00_02325560
	str r6, [sp]
	mov r1, r0
	str r5, [sp, #4]
	sub r2, r8, #0x1c
	add r3, r7, #0x1c
	bl put_in_buffer
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C9130: .word 0x7F000001
_022C9134: .word ov00_02325078
_022C9138: .word ov00_02318850
_022C913C: .word ov00_02325560
	arm_func_end send_ip_frag

	arm_func_start send_ip
send_ip: ; 0x022C9140
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r0, #0x45
	strb r0, [sl, #-0x14]
	mov r4, #0
	ldr r7, _022C9330 ; =ov00_02325078
	strb r4, [sl, #-0x13]
	ldrh r0, [r7, #6]
	ldr r6, [sp, #0x30]
	ldrb r5, [sp, #0x34]
	add r0, r0, #1
	strh r0, [r7, #6]
	ldrh fp, [r7, #6]
	mov r0, r6, lsr #0x10
	mov r8, #0x80
	mov sb, fp, lsl #8
	orr sb, sb, fp, asr #8
	strh sb, [sl, #-0x10]
	strb r8, [sl, #-0xc]
	strb r5, [sl, #-0xb]
	ldr r8, [r7, #0x50]
	mov r5, r0, lsl #0x10
	mov r0, r8, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r8, lsl #8
	orr r0, r0, r8, asr #8
	strh r0, [sl, #-8]
	ldr r0, [r7, #0x50]
	mov r8, r5, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r5, r7, lsl #8
	mov r0, r6, lsl #0x10
	orr sb, r5, r7, asr #8
	mov r7, r8, lsl #8
	mov r5, r0, lsr #0x10
	mov r0, r5, lsl #8
	strh sb, [sl, #-6]
	orr r7, r7, r8, asr #8
	ldr fp, _022C9334 ; =0x000005C8
	mov sb, r1
	strh r7, [sl, #-4]
	orr r0, r0, r5, asr #8
	mov r8, r2
	mov r7, r3
	strh r0, [sl, #-2]
	cmp sb, fp
	bls _022C92AC
	mov r5, sl
	bls _022C9250
_022C9210:
	mov r0, sl
	mov r1, #0
	mov r2, r5
	mov r3, fp
	str r6, [sp]
	orr ip, r4, #0x2000
	str ip, [sp, #4]
	bl send_ip_frag
	add r1, r4, #0xb9
	add r0, r5, #0x1c8
	sub sb, sb, fp
	mov r1, r1, lsl #0x10
	cmp sb, fp
	add r5, r0, #0x400
	mov r4, r1, lsr #0x10
	bhi _022C9210
_022C9250:
	cmp sb, #0
	beq _022C92AC
	cmp r7, #0
	mov r1, #0
	beq _022C9284
	mov r2, r5
	mov r0, sl
	mov r3, sb
	str r6, [sp]
	orr r5, r4, #0x2000
	str r5, [sp, #4]
	bl send_ip_frag
	b _022C929C
_022C9284:
	str r6, [sp]
	mov r0, sl
	mov r2, r5
	mov r3, sb
	str r4, [sp, #4]
	bl send_ip_frag
_022C929C:
	add r0, r4, sb, lsr #3
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov sb, #0
_022C92AC:
	ldr fp, _022C9334 ; =0x000005C8
	add r0, sb, r7
	cmp r0, fp
	bls _022C9300
_022C92BC:
	sub r5, fp, sb
	mov r1, sb
	mov r0, sl
	mov r2, r8
	mov r3, r5
	str r6, [sp]
	orr sb, r4, #0x2000
	str sb, [sp, #4]
	bl send_ip_frag
	add r0, r4, #0xb9
	sub r7, r7, r5
	mov r0, r0, lsl #0x10
	mov sb, #0
	cmp r7, fp
	add r8, r8, r5
	mov r4, r0, lsr #0x10
	bhi _022C92BC
_022C9300:
	adds r0, sb, r7
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r6, [sp]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl send_ip_frag
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022C9330: .word ov00_02325078
_022C9334: .word 0x000005C8
	arm_func_end send_ip

	arm_func_start send_ping
send_ping: ; 0x022C9338
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	ldr r4, [r5, #0x4c]
	mov r6, r1
	mov r1, #8
	ldr r3, _022C93E0 ; =ov00_02325078
	ldr r2, _022C93E4 ; =OSi_ThreadInfo
	strh r1, [r4, #0x22]
	ldr r2, [r2, #4]
	ldrh lr, [r3, #4]
	mov r7, r0
	strh r2, [r4, #0x26]
	mov r2, #0
	strh r2, [r4, #0x24]
	strh lr, [r5, #0xa]
	add ip, lr, #1
	add r0, r4, #0x22
	strh ip, [r3, #4]
	strh lr, [r4, #0x28]
	bl calc_checksum_do
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #0x24]
	ldr r1, [r5, #0x1c]
	add r0, r4, #0x22
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #8
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C93E0: .word ov00_02325078
_022C93E4: .word OSi_ThreadInfo
	arm_func_end send_ping

	arm_func_start send_udp
send_udp: ; 0x022C93E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r7, _022C9520 ; =ov00_02325078
	mov r5, r2
	ldr r2, [r7, #0x50]
	mov r6, r1
	mov r1, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r3, [r5, #0x4c]
	mov r1, r2, lsl #8
	add r4, r3, #0x22
	orr r1, r1, r2, asr #8
	strh r1, [r4, #-0xc]
	ldr r1, [r7, #0x50]
	add r2, r6, #8
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-0xa]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-8]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r7, r1, r7, asr #8
	mov r1, r2, lsl #8
	strh r7, [r4, #-6]
	mov r7, #0x1100
	strh r7, [r4, #-4]
	orr r1, r1, r2, asr #8
	strh r1, [r4, #4]
	ldrh r1, [r4, #4]
	mov r7, r0
	sub r0, r4, #0xc
	strh r1, [r4, #-2]
	ldrh lr, [r5, #0x18]
	mov r2, #0
	mov r1, #0x14
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r4, #2]
	ldrh lr, [r5, #0xa]
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r3, #0x22]
	strh r2, [r4, #6]
	bl calc_checksum_do
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #6]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	str r1, [sp]
	mov r1, #0x11
	str r1, [sp, #4]
	mov r1, #8
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C9520: .word ov00_02325078
	arm_func_end send_udp

	arm_func_start send_tcp
send_tcp: ; 0x022C9524
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r7, r2
	ldrb r2, [r7, #8]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov r6, r3
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _022C9788 ; =OSi_ThreadInfo
	ldr r1, _022C978C ; =ov00_023252E0
	ldr r0, [r0, #4]
	cmp r0, r1
	ldreq r4, _022C9790 ; =ov00_0232558A
	ldrne r0, [r7, #0x4c]
	addne r4, r0, #0x22
	ldr r0, _022C9794 ; =ov00_02325078
	ands r2, r6, #2
	movne r5, #0x18
	moveq r5, #0x14
	add r1, r5, r8
	ldr sl, [r0, #0x50]
	mov r3, r1, lsl #0x10
	mov r1, sl, lsr #0x10
	mov r1, r1, lsl #0x10
	mov sl, r1, lsr #0x10
	mov r1, sl, lsl #8
	orr r1, r1, sl, asr #8
	strh r1, [r4, #-0xc]
	mov r1, r3, lsr #0x10
	ldr sl, [r0, #0x50]
	mov lr, r1, lsl #8
	mov r3, sl, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-0xa]
	ldr r3, [r7, #0x1c]
	orr r1, lr, r1, asr #8
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-8]
	ldr r3, [r7, #0x1c]
	mov ip, r5, lsr #2
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-6]
	mov r3, #0x600
	strh r3, [r4, #-4]
	strh r1, [r4, #-2]
	ldrh lr, [r7, #0xa]
	mov r3, ip, lsl #4
	cmp r2, #0
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	strh r1, [r4]
	ldrh ip, [r7, #0x18]
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #2]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #4]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #6]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #8]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #0xa]
	strb r3, [r4, #0xc]
	strb r6, [r4, #0xd]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x44]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r4, #0xe]
	mov r1, #0
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	beq _022C9708
	ldrh r1, [r0, #2]
	add r1, r1, #0x2040000
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	strh r1, [r4, #0x14]
	ldrh r0, [r0, #2]
	add r0, r0, #0x2040000
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x16]
_022C9708:
	sub r0, r4, #0xc
	add r1, r5, #0xc
	mov r2, #0
	bl calc_checksum_do
	mov r2, r0
	mov r0, sb
	mov r1, r8
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r3, r0, lsl #8
	orr r0, r3, r0, asr #8
	strh r0, [r4, #0x10]
	mov r0, r4
	ldr r4, [r7, #0x1c]
	mov r3, #6
	str r4, [sp]
	str r3, [sp, #4]
	mov r1, r5
	mov r2, sb
	mov r3, r8
	bl send_ip
	ldr r0, [r7, #0x28]
	tst r6, #3
	add r0, r0, r8
	str r0, [r7, #0x28]
	ldrne r0, [r7, #0x28]
	addne r0, r0, #1
	strne r0, [r7, #0x28]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022C9788: .word OSi_ThreadInfo
_022C978C: .word ov00_023252E0
_022C9790: .word ov00_0232558A
_022C9794: .word ov00_02325078
	arm_func_end send_tcp

	arm_func_start reply_arp
reply_arp: ; 0x022C9798
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r3, #0x200
	add r0, r4, #8
	add r1, r4, #0x12
	mov r2, #0xa
	strh r3, [r4, #6]
	bl MI_CpuCopy8
	ldr r0, _022C9838 ; =ov00_02325560
	add r1, r4, #8
	mov r2, #6
	bl MI_CpuCopy8
	ldr r3, _022C983C ; =ov00_02325078
	add r0, r4, #0x12
	ldr r2, [r3, #0x50]
	sub r1, r4, #0xe
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, ip, lsl #8
	orr r2, r2, ip, asr #8
	strh r2, [r4, #0xe]
	ldr r3, [r3, #0x50]
	mov r2, #6
	mov r3, r3, lsl #0x10
	mov ip, r3, lsr #0x10
	mov r3, ip, lsl #8
	orr r3, r3, ip, asr #8
	strh r3, [r4, #0x10]
	bl MI_CpuCopy8
	ldr r0, _022C9838 ; =ov00_02325560
	sub r1, r4, #8
	mov r2, #6
	bl MI_CpuCopy8
	sub r0, r4, #0xe
	mov r1, #0x2a
	mov r2, #0
	mov r3, r2
	bl send_packet
	ldmia sp!, {r4, pc}
	.align 2, 0
_022C9838: .word ov00_02325560
_022C983C: .word ov00_02325078
	arm_func_end reply_arp

	arm_func_start dispatch_arp
dispatch_arp: ; 0x022C9840
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	cmp r1, #0x1c
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _022C9978 ; =ov00_02325560
	add r0, r6, #8
	bl maccmp
	cmp r0, #0
	ldrne r0, _022C997C ; =ov00_02325078
	ldrne r0, [r0, #0x50]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r6]
	cmp r0, #0x100
	ldreqh r0, [r6, #2]
	cmpeq r0, #8
	ldreqh r1, [r6, #4]
	ldreq r0, _022C9980 ; =0x00000406
	cmpeq r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6, #6]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	cmp r4, #1
	cmpne r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r5, [r6, #0x10]
	ldrh r3, [r6, #0xe]
	ldrh lr, [r6, #0x1a]
	mov r0, r5, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r5, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	ldrh ip, [r6, #0x18]
	ldr r2, _022C997C ; =ov00_02325078
	mov r3, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x50]
	orr r1, r1, r3, lsl #16
	mov r3, ip, lsl #8
	cmp r1, r0
	moveq r5, #1
	mov r2, lr, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	movne r5, #0
	cmp r0, r2
	moveq r7, #1
	movne r7, #0
	cmp r5, #0
	bne _022C993C
	mov r2, r7
	add r0, r6, #8
	bl reg_arpcache
_022C993C:
	cmp r4, #1
	bne _022C9958
	cmp r7, #0
	beq _022C9958
	mov r0, r6
	bl reply_arp
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C9958:
	cmp r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	cmpne r5, #0
	ldrne r0, _022C997C ; =ov00_02325078
	movne r1, #1
	strneb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C9978: .word ov00_02325560
_022C997C: .word ov00_02325078
_022C9980: .word 0x00000406
	arm_func_end dispatch_arp

	arm_func_start reply_icmp
reply_icmp: ; 0x022C9984
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r0
	ldrh r4, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r5, r1
	mov r0, r4, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	mov r4, r2
	bl get_targetip
	movs r7, r0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl inq_arpcache
	cmp r0, #0
	bne _022C99F0
	mov r0, r7
	bl send_arprequest
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022C99F0:
	mov r2, #0
	strb r2, [r5]
	mov r0, r5
	mov r1, r4
	strh r2, [r5, #2]
	bl calc_checksum
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r5, #2]
	ldrh ip, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r2, #0
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r6, r0, r3, lsl #16
	mov r0, r5
	mov r1, r4
	mov r3, r2
	str r6, [sp]
	mov r4, #1
	str r4, [sp, #4]
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end reply_icmp

	arm_func_start process_icmp_reply
process_icmp_reply: ; 0x022C9A68
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl EnableIrqFlag
	ldr r1, _022C9B64 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _022C9B58
_022C9A90:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r3, [r4]
	cmpne r3, #0
	beq _022C9B4C
	ldrb r0, [r4, #8]
	cmp r0, #0xb
	ldreqh r2, [r7, #4]
	moveq r0, r3, lsl #0x10
	cmpeq r2, r0, lsr #16
	ldreqh r2, [r4, #0xa]
	ldreqh r0, [r7, #6]
	cmpeq r2, r0
	ldreq r0, [r4, #0x44]
	cmpeq r0, #0
	bne _022C9B4C
	ldrh lr, [r8, #0xe]
	ldrh ip, [r8, #0xc]
	ldr r0, [r4, #0x1c]
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	cmp r0, r2
	bne _022C9B4C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _022C9B58
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	b _022C9B58
_022C9B4C:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _022C9A90
_022C9B58:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C9B64: .word OSi_ThreadInfo
	arm_func_end process_icmp_reply

	arm_func_start valid_ip
valid_ip: ; 0x022C9B68
	cmp r0, #0
	mvnne r2, #0
	cmpne r0, r2
	cmpne r1, #0
	cmpne r1, r2
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end valid_ip

	arm_func_start dispatch_icmp
dispatch_icmp: ; 0x022C9B88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r0, r5
	mov r1, r4
	bl calc_checksum
	ldr r1, _022C9C54 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r6, #0x12]
	ldrh r8, [r6, #0x10]
	ldrh r7, [r6, #0xe]
	ldrh lr, [r6, #0xc]
	mov r2, r8, lsl #8
	orr r2, r2, r8, asr #8
	mov ip, lr, lsl #8
	mov r2, r2, lsl #0x10
	mov r3, r7, lsl #8
	orr lr, ip, lr, asr #8
	mov r1, r0, lsl #8
	orr ip, r3, r7, asr #8
	orr r3, r1, r0, asr #8
	mov r0, lr, lsl #0x10
	mov r1, ip, lsl #0x10
	mov ip, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r1, r3, lsr #0x10
	orr r0, r0, ip, lsl #16
	orr r1, r1, r2, lsl #16
	bl valid_ip
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r5]
	cmp r0, #0
	beq _022C9C2C
	cmp r0, #8
	beq _022C9C40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C9C2C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl process_icmp_reply
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022C9C40:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl reply_icmp
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022C9C54: .word 0x0000FFFF
	arm_func_end dispatch_icmp

	arm_func_start check_listener
check_listener: ; 0x022C9C58
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _022C9D28 ; =OSi_ThreadInfo
	ldr ip, [r2, #8]
	cmp ip, #0
	beq _022C9D20
_022C9C6C:
	ldr r3, [ip, #0xa4]
	cmp r3, #0
	ldrne r2, [r3]
	cmpne r2, #0
	beq _022C9D14
	ldrb r2, [r3, #8]
	cmp r2, #1
	bne _022C9D14
	ldrh r5, [r1, #2]
	ldrh r4, [r3, #0xa]
	mov r2, r5, lsl #8
	orr r2, r2, r5, asr #8
	mov r2, r2, lsl #0x10
	cmp r4, r2, lsr #16
	bne _022C9D14
	ldrh r5, [r3, #0x18]
	cmp r5, #0
	beq _022C9CCC
	ldrh r4, [r1]
	mov r2, r4, lsl #8
	orr r2, r2, r4, asr #8
	mov r2, r2, lsl #0x10
	cmp r5, r2, lsr #16
	bne _022C9D14
_022C9CCC:
	ldr r2, [r3, #0x1c]
	cmp r2, #0
	beq _022C9D0C
	ldrh r6, [r0, #0xe]
	ldrh r5, [r0, #0xc]
	mov r4, r6, lsl #8
	mov lr, r5, lsl #8
	orr lr, lr, r5, asr #8
	orr r4, r4, r6, asr #8
	mov lr, lr, lsl #0x10
	mov r4, r4, lsl #0x10
	mov lr, lr, lsr #0x10
	mov r4, r4, lsr #0x10
	orr r4, r4, lr, lsl #16
	cmp r2, r4
	bne _022C9D14
_022C9D0C:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
_022C9D14:
	ldr ip, [ip, #0x68]
	cmp ip, #0
	bne _022C9C6C
_022C9D20:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022C9D28: .word OSi_ThreadInfo
	arm_func_end check_listener

	arm_func_start check_socket
check_socket: ; 0x022C9D2C
	stmdb sp!, {r4, r5, r6, lr}
	ldrb r4, [r2, #8]
	mov r3, #0
	mov r5, r3
	cmp r4, #0xa
	cmpne r4, #0xb
	movne r5, #1
	mov ip, r3
	mov r6, r3
	cmp r5, #0
	beq _022C9D74
	ldrh lr, [r1, #2]
	ldrh r5, [r2, #0xa]
	mov r4, lr, lsl #8
	orr r4, r4, lr, asr #8
	mov lr, r4, lsl #0x10
	cmp r5, lr, lsr #16
	moveq r6, #1
_022C9D74:
	cmp r6, #0
	beq _022C9D98
	ldrh lr, [r1]
	ldrh r4, [r2, #0x18]
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	mov r1, r1, lsl #0x10
	cmp r4, r1, lsr #16
	moveq ip, #1
_022C9D98:
	cmp ip, #0
	beq _022C9DD8
	ldrh lr, [r0, #0xc]
	ldrh r4, [r0, #0xe]
	ldr ip, [r2, #0x1c]
	mov r1, lr, lsl #8
	mov r0, r4, lsl #8
	orr r2, r1, lr, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	cmp ip, r0
	moveq r3, #1
_022C9DD8:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end check_socket

	arm_func_start find_socket
find_socket: ; 0x022C9DE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022C9E40 ; =OSi_ThreadInfo
	mov r7, r0
	ldr r5, [r2, #8]
	mov r6, r1
	cmp r5, #0
	beq _022C9E38
_022C9DFC:
	ldr r4, [r5, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _022C9E2C
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl check_socket
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022C9E2C:
	ldr r5, [r5, #0x68]
	cmp r5, #0
	bne _022C9DFC
_022C9E38:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022C9E40: .word OSi_ThreadInfo
	arm_func_end find_socket

	arm_func_start parse_mss
parse_mss: ; 0x022C9E44
	mov r2, #0x218
	strh r2, [r1, #0x2e]
	ldrb r2, [r0, #0xc]
	add r3, r0, #0x14
	and r2, r2, #0xf0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r0, r0, asr #2
	subs r0, r0, #0x14
	sub ip, r0, #1
	bxeq lr
_022C9E70:
	ldrb r0, [r3], #1
	cmp r0, #0
	bxeq lr
	cmp r0, #1
	beq _022C9EB8
	cmp r0, #2
	bne _022C9EA8
	ldrb r2, [r3, #1]
	ldrb r0, [r3, #2]
	add r3, r3, #3
	sub ip, ip, #3
	orr r0, r0, r2, lsl #8
	strh r0, [r1, #0x2e]
	b _022C9EB8
_022C9EA8:
	ldrb r0, [r3]
	sub r0, r0, #1
	sub ip, ip, r0
	add r3, r3, r0
_022C9EB8:
	cmp ip, #0
	sub ip, ip, #1
	bne _022C9E70
	bx lr
	arm_func_end parse_mss

	arm_func_start no_need_inq
no_need_inq: ; 0x022C9EC8
	stmdb sp!, {r3, lr}
	bl get_targetip
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl inq_arpcache
	ldmia sp!, {r3, pc}
	arm_func_end no_need_inq

	arm_func_start tcp_send_handshake
tcp_send_handshake: ; 0x022C9EE4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, [r6, #0x1c]
	mov r5, r1
	mov r4, r2
	bl no_need_inq
	cmp r0, #0
	bne _022C9F1C
	ldr r0, _022C9F50 ; =OSi_ThreadInfo
	ldr r1, _022C9F54 ; =ov00_023252E0
	ldr r0, [r0, #4]
	cmp r0, r1
	beq _022C9F3C
_022C9F1C:
	mov r0, #0
	mov r1, r0
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	bl send_tcp
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
_022C9F3C:
	ldr r0, [r6, #0x1c]
	bl get_targetip
	bl send_arprequest
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022C9F50: .word OSi_ThreadInfo
_022C9F54: .word ov00_023252E0
	arm_func_end tcp_send_handshake

	arm_func_start tcp_send_ack
tcp_send_ack: ; 0x022C9F58
	ldr ip, _022C9F68 ; =tcp_send_handshake
	mov r2, r1
	mov r1, #0x10
	bx ip
	.align 2, 0
_022C9F68: .word tcp_send_handshake
	arm_func_end tcp_send_ack

	arm_func_start tcp_send_finack
tcp_send_finack: ; 0x022C9F6C
	ldr ip, _022C9F7C ; =tcp_send_handshake
	mov r2, r1
	mov r1, #0x11
	bx ip
	.align 2, 0
_022C9F7C: .word tcp_send_handshake
	arm_func_end tcp_send_finack

	arm_func_start tcp_send_rst
tcp_send_rst: ; 0x022C9F80
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _022CA0B0 ; =ov00_023251BC
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r0, r4
	mov r1, #0
	mov r2, #0x64
	mov r5, r3
	bl MI_CpuFill8
	ldrh r3, [r7, #2]
	ldr r0, _022CA0B4 ; =ov00_02325178
	ldr r2, _022CA0B8 ; =ov00_02325078
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x4e]
	ldrh r3, [r7]
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x5c]
	ldrh ip, [r8, #0xe]
	ldrh r3, [r8, #0xc]
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	str r0, [r2, #0x160]
	ldrb r0, [r7, #0xd]
	tst r0, #0x10
	beq _022CA050
	ldrh r6, [r7, #0xa]
	ldrh r3, [r7, #8]
	mov r0, r4
	mov r1, r6, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, r6, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r3, r1, r3, lsl #16
	mov r2, r5
	mov r1, #4
	str r3, [r4, #0x28]
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022CA050:
	mov r0, #0
	str r0, [r4, #0x28]
	ldrh r3, [r7, #6]
	ldrh r2, [r7, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	add r1, r6, r0
	str r1, [r4, #0x24]
	ldrb r0, [r7, #0xd]
	mov r2, r5
	tst r0, #3
	addne r0, r1, #1
	strne r0, [r4, #0x24]
	mov r0, r4
	mov r1, #0x14
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022CA0B0: .word ov00_023251BC
_022CA0B4: .word ov00_02325178
_022CA0B8: .word ov00_02325078
	arm_func_end tcp_send_rst

	arm_func_start dt_syn_listen
dt_syn_listen: ; 0x022CA0BC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r2, #3
	mov r6, r0
	mov r5, r1
	strb r2, [r4, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r4, #0x10]
	ldrh r2, [r6, #0x12]
	ldrh r3, [r6, #0x10]
	mov r0, r5
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	str r1, [r4, #0x14]
	ldrh r3, [r5]
	mov r1, r4
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x18]
	ldrh r3, [r6, #0xe]
	ldrh r6, [r6, #0xc]
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, r6, lsl #8
	orr r2, r2, r6, asr #8
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r6, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r6, lsl #16
	str r2, [r4, #0x1c]
	ldrh r6, [r5, #6]
	ldrh r5, [r5, #4]
	mov r2, r6, lsl #8
	mov r3, r5, lsl #8
	orr r5, r3, r5, asr #8
	orr r3, r2, r6, asr #8
	mov r2, r5, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r5, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r5, lsl #16
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl parse_mss
	mov r0, r4
	mov r1, #0x12
	mov r2, #0
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end dt_syn_listen

	arm_func_start find_specific_socket
find_specific_socket: ; 0x022CA1A8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl find_socket
	movs r2, r0
	beq _022CA228
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _022CA1E0
	mov r0, r6
	mov r1, r5
	bl dt_syn_listen
	b _022CA220
_022CA1E0:
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022CA20C
	ldr r1, [r2, #0x28]
	mov r0, r6
	sub r3, r1, #1
	mov r1, r5
	str r3, [r2, #0x28]
	bl dt_syn_listen
	b _022CA220
_022CA20C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl tcp_send_rst
_022CA220:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022CA228:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end find_specific_socket

	arm_func_start dt_syn
dt_syn: ; 0x022CA230
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldrh r0, [r4, #0x12]
	ldrh r8, [r4, #0x10]
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	mov ip, r8, lsl #8
	orr ip, ip, r8, asr #8
	mov r5, r6, lsl #8
	mov ip, ip, lsl #0x10
	mov lr, r7, lsl #8
	orr r6, r5, r6, asr #8
	mov r3, r0, lsl #8
	orr r5, lr, r7, asr #8
	orr lr, r3, r0, asr #8
	mov r0, r6, lsl #0x10
	mov r3, r5, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov lr, lr, lsl #0x10
	orr r0, r0, r5, lsl #16
	mov ip, ip, lsr #0x10
	mov r3, lr, lsr #0x10
	mov r6, r1
	orr r1, r3, ip, lsl #16
	mov r5, r2
	bl valid_ip
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl find_specific_socket
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl check_listener
	movs r2, r0
	beq _022CA2E0
	mov r0, r4
	mov r1, r6
	bl dt_syn_listen
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022CA2E0:
	bl OS_YieldThread
	mov r0, r4
	mov r1, r6
	bl check_listener
	movs r2, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl dt_syn_listen
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end dt_syn

	arm_func_start dt_synack
dt_synack: ; 0x022CA308
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r6, r2
	bl find_socket
	movs r4, r0
	beq _022CA330
	ldrb r0, [r4, #8]
	cmp r0, #2
	beq _022CA348
_022CA330:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CA348:
	bl OS_YieldThread
	ldrh ip, [r5, #6]
	ldrh r3, [r5, #4]
	mov r0, r5
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	add r1, r1, #1
	str r1, [r4, #0x24]
	ldrh lr, [r5, #0xa]
	ldrh ip, [r5, #8]
	mov r1, r4
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	str r2, [r4, #0x30]
	ldrh r3, [r5, #0xe]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x2c]
	bl parse_mss
	mov r0, r4
	mov r1, #0
	bl tcp_send_ack
	mov r0, #4
	strb r0, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end dt_synack

	arm_func_start dt_ack
dt_ack: ; 0x022CA400
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl find_socket
	movs r5, r0
	bne _022CA434
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022CA434:
	ldrh r6, [sb, #0xa]
	ldrh r3, [sb, #8]
	ldr r2, [r5, #0x30]
	mov r0, r6, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r6, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r3, lsl #16
	sub r0, r1, r2
	ldrb r6, [sb, #0xd]
	cmp r0, #0
	strgt r1, [r5, #0x30]
	ldrh r7, [sb, #6]
	ldrh r3, [sb, #4]
	ldrb r2, [r5, #8]
	mov r0, r7, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r7, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #4
	orr r1, r0, r3, lsl #16
	bne _022CA4C8
	ldr r0, [r5, #0x24]
	cmp r0, r1
	beq _022CA4C8
	mov r0, r5
	mov r1, #0
	bl tcp_send_ack
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022CA4C8:
	ldrh r1, [sb, #0xe]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r5, #0x2c]
	ldrb r0, [r5, #8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022CA6F4
_022CA4E8: ; jump table
	b _022CA510 ; case 0
	b _022CA6F4 ; case 1
	b _022CA510 ; case 2
	b _022CA528 ; case 3
	b _022CA554 ; case 4
	b _022CA6F4 ; case 5
	b _022CA6D0 ; case 6
	b _022CA65C ; case 7
	b _022CA65C ; case 8
	b _022CA6D0 ; case 9
_022CA510:
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl tcp_send_rst
	b _022CA710
_022CA528:
	mov r0, #4
	strb r0, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #1
	bne _022CA54C
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
_022CA54C:
	cmp r8, #0
	beq _022CA710
_022CA554:
	ldr r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	sub r0, r1, r0
	cmp r8, r0
	movhi r7, #0
	movhi r8, r0
	movls r7, #1
	cmp r8, #0
	beq _022CA5F0
	bl EnableIrqFlag
	ldrb r1, [sb, #0xc]
	ldr ip, [r5, #0x40]
	ldr r3, [r5, #0x44]
	and r2, r1, #0xf0
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	mov r4, r0
	mov r2, r8
	add r0, sb, r1, asr #2
	add r1, ip, r3
	bl MI_CpuCopy8
	ldr r1, [r5, #0x44]
	mov r0, r4
	add r1, r1, r8
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x24]
	add r1, r1, r8
	str r1, [r5, #0x24]
	bl SetIrqFlag
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _022CA5F0
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
_022CA5F0:
	cmp r7, #0
	beq _022CA644
	tst r6, #1
	beq _022CA644
	mov r0, #6
	strb r0, [r5, #8]
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, #1
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_finack
	cmp r8, #0
	ldreq r0, [r5, #4]
	cmpeq r0, #2
	bne _022CA710
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _022CA710
_022CA644:
	cmp r8, #0
	beq _022CA710
	mov r0, r5
	mov r1, #0
	bl tcp_send_ack
	b _022CA710
_022CA65C:
	tst r6, #1
	beq _022CA6A4
	ldr r1, [r5, #0x24]
	add r0, r8, #1
	add r2, r1, r0
	mov r0, r5
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_ack
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _022CA710
	str r1, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _022CA710
_022CA6A4:
	cmp r8, #0
	beq _022CA6C4
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, r8
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_ack
_022CA6C4:
	mov r0, #8
	strb r0, [r5, #8]
	b _022CA710
_022CA6D0:
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _022CA710
	str r1, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _022CA710
_022CA6F4:
	tst r6, #1
	ldrne r0, [r5, #0x24]
	mov r1, #0
	addne r0, r0, #1
	strne r0, [r5, #0x24]
	mov r0, r5
	bl tcp_send_ack
_022CA710:
	bl OS_YieldThread
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end dt_ack

	arm_func_start dt_fin
dt_fin: ; 0x022CA718
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl find_socket
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4, #8]
	cmp r1, #4
	beq _022CA7AC
	cmp r1, #7
	beq _022CA754
	cmp r1, #8
	beq _022CA774
	b _022CA7CC
_022CA754:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_ack
	mov r0, #9
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CA774:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_ack
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CA7AC:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_finack
	mov r0, #6
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CA7CC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end dt_fin

	arm_func_start dt_rst
dt_rst: ; 0x022CA7E4
	stmdb sp!, {r4, lr}
	bl find_socket
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	bl OS_YieldThread
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r4, pc}
	arm_func_end dt_rst

	arm_func_start dispatch_tcp
dispatch_tcp: ; 0x022CA820
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, #6
	bl check_tcpudpsum
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [r5, #0xc]
	ldrb r2, [r5, #0xd]
	and r1, r0, #0xf0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	and r1, r2, #0x17
	cmp r1, #0x10
	sub r4, r4, r0, asr #2
	bgt _022CA898
	cmp r1, #0x10
	bge _022CA8F0
	cmp r1, #2
	bgt _022CA918
	cmp r1, #1
	blt _022CA918
	beq _022CA904
	cmp r1, #2
	beq _022CA8B8
	b _022CA918
_022CA898:
	cmp r1, #0x12
	bgt _022CA918
	cmp r1, #0x11
	blt _022CA918
	beq _022CA8F0
	cmp r1, #0x12
	beq _022CA8D4
	b _022CA918
_022CA8B8:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_syn
	ldmia sp!, {r4, r5, r6, pc}
_022CA8D4:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_synack
	ldmia sp!, {r4, r5, r6, pc}
_022CA8F0:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_ack
	ldmia sp!, {r4, r5, r6, pc}
_022CA904:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_fin
	ldmia sp!, {r4, r5, r6, pc}
_022CA918:
	tst r2, #4
	mov r0, r6
	mov r1, r5
	beq _022CA930
	bl dt_rst
	ldmia sp!, {r4, r5, r6, pc}
_022CA930:
	mov r2, r4
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end dispatch_tcp

	arm_func_start dispatch_udp
dispatch_udp: ; 0x022CA940
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r1
	ldrh r1, [r7, #6]
	mov r8, r0
	mov r6, r2
	cmp r1, #0
	beq _022CA978
	mov r0, r7
	mov r1, r6
	mov r2, r8
	mov r3, #0x11
	bl check_tcpudpsum
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022CA978:
	bl EnableIrqFlag
	ldr r1, _022CAB48 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _022CAB3C
	mvn ip, #0
_022CA994:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _022CAB30
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _022CAB30
	ldrh r3, [r7, #2]
	ldrh r2, [r4, #0xa]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	mov r0, r0, lsl #0x10
	cmp r2, r0, lsr #16
	bne _022CAB30
	ldrh r3, [r4, #0x18]
	cmp r3, #0
	beq _022CA9F4
	ldrh r2, [r7]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	bne _022CAB30
_022CA9F4:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	cmpne r0, ip
	beq _022CAA38
	ldrh sb, [r8, #0xe]
	ldrh lr, [r8, #0xc]
	mov r2, sb, lsl #8
	mov r3, lr, lsl #8
	orr lr, r3, lr, asr #8
	orr r3, r2, sb, asr #8
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov lr, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, lr, lsl #16
	cmp r0, r2
	bne _022CAB30
_022CAA38:
	ldrh r3, [r8, #0x12]
	ldrh r2, [r8, #0x10]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _022CAAB4
	ldrh r3, [r8, #0xe]
	ldrh r2, [r8, #0xc]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x1c]
	ldrh r1, [r7]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x18]
_022CAAB4:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _022CAB3C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _022CAB04
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	b _022CAB3C
_022CAB04:
	ldr r3, [r4, #0x38]
	cmp r3, #0
	beq _022CAB3C
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	mov r2, r4
	blx r3
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x44]
	b _022CAB3C
_022CAB30:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _022CA994
_022CAB3C:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022CAB48: .word OSi_ThreadInfo
	arm_func_end dispatch_udp

	arm_func_start check_frag
check_frag: ; 0x022CAB4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r6, #0
	mov sl, r0
	str r6, [r1]
	ldrh r3, [sl, #6]
	str r1, [sp]
	ldr r2, _022CAE08 ; =0x00003FFF
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #8]
	tst r1, r2
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [sl, #0xe]
	ldrh r2, [sl, #0xc]
	ldrb r4, [sl]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r3, r4, lsl #0x1c
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldrh r4, [sl, #4]
	ldr r7, _022CAE0C ; =ov00_023253A0
	mov r0, r6
	mov r5, r3, lsr #0x1a
	orr sb, r1, r2, lsl #16
_022CABD0:
	ldrh r2, [r7, #4]
	cmp r2, #0
	beq _022CABF0
	ldr r1, [r7]
	cmp r1, sb
	ldreqh r1, [r7, #6]
	cmpeq r1, r4
	beq _022CAC0C
_022CABF0:
	add r0, r0, #1
	cmp r2, #0
	cmpeq r6, #0
	moveq r6, r7
	cmp r0, #8
	add r7, r7, #0x38
	blo _022CABD0
_022CAC0C:
	ldrh r2, [sl, #2]
	cmp r0, #8
	ldr r1, _022CAE10 ; =0x00001FFF
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	rsb r0, r5, r0, lsr #16
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	and fp, r0, r1
	ldr r0, [sp, #4]
	add r8, r0, fp, lsl #3
	bne _022CACC8
	cmp r6, #0
	beq _022CAC50
	cmp r8, #0x1000
	bls _022CAC5C
_022CAC50:
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022CAC5C:
	ldr r1, _022CAE14 ; =ov00_02325078
	add r0, r5, #0xe
	ldr r1, [r1, #0x14]
	add r0, r0, #0x1000
	mov r7, r6
	blx r1
	cmp r0, #0
	str r0, [r6, #0x34]
	addeq sp, sp, #0xc
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sb, [r6]
	strh r4, [r6, #6]
	strh r0, [r6, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r6, #0x2c]
	ldr r1, [r6, #0x34]
	mov r0, sl
	add r1, r1, #0xe
	add r1, r1, r5
	str r1, [r6, #0x30]
	ldr r1, [r6, #0x34]
	mov r2, r5
	add r1, r1, #0xe
	bl MI_CpuCopy8
_022CACC8:
	ldrh r0, [r7, #4]
	cmp r0, #8
	beq _022CACDC
	cmp r8, #0x1000
	bls _022CAD00
_022CACDC:
	ldr r1, _022CAE14 ; =ov00_02325078
	mov r0, #0
	strh r0, [r7, #4]
	ldr r0, [r7, #0x34]
	ldr r1, [r1, #0x40]
	blx r1
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022CAD00:
	ldr r0, [sp, #4]
	ldr r2, [sp, #4]
	add r1, r0, #7
	ldr r0, [sp, #8]
	add r3, fp, r1, lsr #3
	tst r0, #0x2000
	streqh r8, [r7, #0xa]
	streqh r3, [r7, #8]
	ldrh r1, [r7, #4]
	add r0, sl, r5
	add r1, r7, r1, lsl #1
	strh fp, [r1, #0xc]
	ldrh r1, [r7, #4]
	add r1, r7, r1, lsl #1
	strh r3, [r1, #0x1c]
	ldrh r1, [r7, #4]
	add r1, r1, #1
	strh r1, [r7, #4]
	ldr r1, [r7, #0x30]
	add r1, r1, fp, lsl #3
	bl MI_CpuCopy8
	ldrh r4, [r7, #8]
	cmp r4, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [r7, #4]
	mov r6, #0
	mov r5, r6
	cmp r3, #0
	bls _022CADB0
	mov r0, r6
_022CAD80:
	add r2, r7, r5, lsl #1
	ldrh r1, [r2, #0xc]
	cmp r1, r6
	bhi _022CADA4
	ldrh r1, [r2, #0x1c]
	cmp r6, r1
	movlo r6, r1
	movlo r5, r0
	blo _022CADA8
_022CADA4:
	add r5, r5, #1
_022CADA8:
	cmp r5, r3
	blo _022CAD80
_022CADB0:
	cmp r6, r4
	addlo sp, sp, #0xc
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, [r7, #0x34]
	ldrh r3, [r7, #0xa]
	ldrb r0, [r4, #0xe]
	mov r2, #0
	mov r1, #1
	mov r0, r0, lsl #0x1c
	add r0, r3, r0, lsr #26
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [r4, #0x10]
	ldr r0, [sp]
	strh r2, [r7, #4]
	str r1, [r0]
	add r0, r4, #0xe
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CAE08: .word 0x00003FFF
_022CAE0C: .word ov00_023253A0
_022CAE10: .word 0x00001FFF
_022CAE14: .word ov00_02325078
	arm_func_end check_frag

	arm_func_start dispatch_ip
dispatch_ip: ; 0x022CAE18
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	ldrh lr, [r4, #0x12]
	ldrh r5, [r4, #0x10]
	mov r2, r6, lsl #8
	mov r3, lr, lsl #8
	mov ip, r5, lsl #8
	mov r0, r7, lsl #8
	orr r5, ip, r5, asr #8
	orr lr, r3, lr, asr #8
	orr r3, r2, r6, asr #8
	orr ip, r0, r7, asr #8
	mov r0, r5, lsl #0x10
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, ip, lsl #0x10
	mov lr, r0, lsr #0x10
	mov r0, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	mov r2, ip, lsr #0x10
	orr r0, r0, lr, lsl #16
	orr r2, r2, r3, lsl #16
	mov r5, r1
	cmp r0, r2
	beq _022CAF3C
	bl ip_isme
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r4, #2]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	cmp r5, r0, lsr #16
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4]
	mov r0, r4
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1a
	bl calc_checksum
	ldr r1, _022CAFD4 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh ip, [r4, #0x12]
	ldrh r3, [r4, #0x10]
	ldr r2, _022CAFD8 ; =ov00_02325078
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	ldr r1, [r2, #0x50]
	orr r0, r0, r3, lsl #16
	cmp r1, r0
	bne _022CAF3C
	ldrh ip, [r4, #0xe]
	ldrh r3, [r4, #0xc]
	sub r0, r4, #8
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	mov r2, #1
	bl reg_arpcache
_022CAF3C:
	add r1, sp, #0
	mov r0, r4
	bl check_frag
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r2, [r4, #2]
	ldrb r3, [r4]
	ldrb ip, [r4, #9]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r3, r3, lsl #0x1c
	mov r2, r1, lsr #0x10
	cmp ip, #0x11
	add r1, r4, r3, lsr #26
	sub r2, r2, r3, lsr #26
	bne _022CAF88
	bl dispatch_udp
	b _022CAFB4
_022CAF88:
	ldr r3, _022CAFD8 ; =ov00_02325078
	ldr r3, [r3, #0x50]
	cmp r3, #0
	beq _022CAFB4
	cmp ip, #1
	bne _022CAFA8
	bl dispatch_icmp
	b _022CAFB4
_022CAFA8:
	cmp ip, #6
	bne _022CAFB4
	bl dispatch_tcp
_022CAFB4:
	ldr r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _022CAFD8 ; =ov00_02325078
	sub r0, r4, #0xe
	ldr r1, [r1, #0x40]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CAFD4: .word 0x0000FFFF
_022CAFD8: .word ov00_02325078
	arm_func_end dispatch_ip

	arm_func_start tcpip
tcpip: ; 0x022CAFDC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _022CB048 ; =0x00000806
	add r4, sp, #0
_022CAFE8:
	mov r0, r4
	bl receive_packet
	ldr r3, [sp]
	cmp r3, #0x22
	bls _022CB040
	ldrh r2, [r0, #0xc]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x800
	beq _022CB024
	cmp r1, r5
	beq _022CB034
	b _022CB040
_022CB024:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl dispatch_ip
	b _022CB040
_022CB034:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl dispatch_arp
_022CB040:
	bl throw_packet
	b _022CAFE8
	.align 2, 0
_022CB048: .word 0x00000806
	arm_func_end tcpip

	arm_func_start Cps_SocGetEport
Cps_SocGetEport: ; 0x022CB04C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _022CB0E8 ; =OSi_ThreadInfo
	ldr r2, _022CB0EC ; =ov00_02325078
	ldr r0, [r0, #8]
	ldr r1, _022CB0F0 ; =0x00001388
	mov r4, #0x400
	mov r3, #1
	mov r5, #0
_022CB06C:
	ldrh ip, [r2, #8]
	mov r6, r5
	add ip, ip, #1
	strh ip, [r2, #8]
	ldrh ip, [r2, #8]
	cmp ip, #0x400
	blo _022CB090
	cmp ip, r1
	blo _022CB094
_022CB090:
	strh r4, [r2, #8]
_022CB094:
	mov r7, r0
	cmp r0, #0
	beq _022CB0D4
	ldrh r8, [r2, #8]
_022CB0A4:
	ldr lr, [r7, #0xa4]
	cmp lr, #0
	ldrne ip, [lr]
	cmpne ip, #0
	beq _022CB0C8
	ldrh ip, [lr, #0xa]
	cmp ip, r8
	moveq r6, r3
	beq _022CB0D4
_022CB0C8:
	ldr r7, [r7, #0x68]
	cmp r7, #0
	bne _022CB0A4
_022CB0D4:
	cmp r6, #0
	bne _022CB06C
	ldr r0, _022CB0EC ; =ov00_02325078
	ldrh r0, [r0, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022CB0E8: .word OSi_ThreadInfo
_022CB0EC: .word ov00_02325078
_022CB0F0: .word 0x00001388
	arm_func_end Cps_SocGetEport

	arm_func_start get_seqno
get_seqno: ; 0x022CB0F4
	stmdb sp!, {r3, lr}
	ldr r1, _022CB134 ; =ov00_02325078
	ldr r3, [r1, #0x70]
	ldr r2, [r1, #0x68]
	ldr r0, [r1, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r0, ip
	ldr r0, [r1, #0x74]
	ldr r3, [r1, #0x78]
	mla ip, r0, r2, ip
	ldr r0, [r1, #0x7c]
	adds r2, r3, lr
	str r2, [r1, #0x68]
	adc r0, r0, ip
	str r0, [r1, #0x6c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CB134: .word ov00_02325078
	arm_func_end get_seqno

	arm_func_start Cps_SocRegister
Cps_SocRegister: ; 0x022CB138
	ldr r1, _022CB148 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	str r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_022CB148: .word OSi_ThreadInfo
	arm_func_end Cps_SocRegister

	arm_func_start Cps_SocUnRegister
Cps_SocUnRegister: ; 0x022CB14C
	ldr r0, _022CB160 ; =OSi_ThreadInfo
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_022CB160: .word OSi_ThreadInfo
	arm_func_end Cps_SocUnRegister

	arm_func_start Cps_SocDatagramMode
Cps_SocDatagramMode: ; 0x022CB164
	ldr r0, _022CB18C ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	mov r0, #0xa
	strb r0, [r1, #8]
	mov r0, #0
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_022CB18C: .word OSi_ThreadInfo
	arm_func_end Cps_SocDatagramMode

	arm_func_start Cps_SocBind
Cps_SocBind: ; 0x022CB190
	stmdb sp!, {r4, lr}
	ldr r3, _022CB1E4 ; =OSi_ThreadInfo
	ldr r3, [r3, #4]
	ldr r4, [r3, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _022CB1E8 ; =0x7F000001
	cmp r2, r3
	ldreq r2, _022CB1EC ; =ov00_02325078
	ldreq r2, [r2, #0x50]
	cmp r0, #0
	strh r1, [r4, #0x1a]
	ldrh r1, [r4, #0x1a]
	strh r1, [r4, #0x18]
	str r2, [r4, #0x20]
	str r2, [r4, #0x1c]
	strneh r0, [r4, #0xa]
	ldmneia sp!, {r4, pc}
	bl Cps_SocGetEport
	strh r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CB1E4: .word OSi_ThreadInfo
_022CB1E8: .word 0x7F000001
_022CB1EC: .word ov00_02325078
	arm_func_end Cps_SocBind

	arm_func_start Cps_SocUse
Cps_SocUse: ; 0x022CB1F0
	ldr r0, _022CB220 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	str r0, [r1]
	mov r0, #0
	strb r0, [r1, #8]
	str r0, [r1, #0x44]
	str r0, [r1, #0x60]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_022CB220: .word OSi_ThreadInfo
	arm_func_end Cps_SocUse

	arm_func_start Cps_SocRelease
Cps_SocRelease: ; 0x022CB224
	ldr r0, _022CB240 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	bx lr
	.align 2, 0
_022CB240: .word OSi_ThreadInfo
	arm_func_end Cps_SocRelease

	arm_func_start Cps_SocDup
Cps_SocDup: ; 0x022CB244
	ldr r1, _022CB258 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_022CB258: .word OSi_ThreadInfo
	arm_func_end Cps_SocDup

	arm_func_start Cps_SetUdpCallback
Cps_SetUdpCallback: ; 0x022CB25C
	ldr r1, _022CB274 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	strne r0, [r1, #0x38]
	bx lr
	.align 2, 0
_022CB274: .word OSi_ThreadInfo
	arm_func_end Cps_SetUdpCallback

	arm_func_start Cpsi_TcpConnectRaw
Cpsi_TcpConnectRaw: ; 0x022CB278
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl get_seqno
	mov r6, #2
	ldr r4, _022CB328 ; =ov00_02325078
	mov r8, r0
	mov r7, #0
	mov r5, #1
	mov fp, r6
_022CB29C:
	str r8, [sl, #0x28]
	strb r6, [sl, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sl, #0x10]
	mov r0, sl
	mov r1, fp
	mov r2, #0x18
	bl tcp_send_handshake
	bl EnableIrqFlag
	mov sb, r0
	ldrb r0, [sl, #8]
	cmp r0, #2
	bne _022CB2F0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _022CB2F0
	mov r0, #0
	str r5, [sl, #4]
	bl OS_SleepThread
_022CB2F0:
	mov r0, sb
	bl SetIrqFlag
	ldrb r0, [sl, #8]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _022CB320
	add r7, r7, #1
	cmp r7, #3
	blo _022CB29C
_022CB320:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CB328: .word ov00_02325078
	arm_func_end Cpsi_TcpConnectRaw

	arm_func_start Cps_TcpConnect
Cps_TcpConnect: ; 0x022CB32C
	stmdb sp!, {r3, lr}
	ldr r0, _022CB368 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _022CB360
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _022CB358
	bl Cpsi_SslConnect
	ldmia sp!, {r3, pc}
_022CB358:
	bl Cpsi_TcpConnectRaw
	ldmia sp!, {r3, pc}
_022CB360:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CB368: .word OSi_ThreadInfo
	arm_func_end Cps_TcpConnect

	arm_func_start Cpsi_TcpShutdownRaw
Cpsi_TcpShutdownRaw: ; 0x022CB36C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_YieldThread
	ldrb r1, [r4, #8]
	add r0, r1, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022CB3A4
	mov r0, r4
	mov r1, #0x19
	bl tcp_send_finack
	mov r0, #7
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_022CB3A4:
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x1a
	bl tcp_send_ack
	ldmia sp!, {r4, pc}
	arm_func_end Cpsi_TcpShutdownRaw

	arm_func_start Cps_TcpShutdown
Cps_TcpShutdown: ; 0x022CB3BC
	stmdb sp!, {r4, lr}
	ldr r0, _022CB3F4 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _022CB3E8
	mov r0, r4
	bl Cpsi_SslShutdown
_022CB3E8:
	mov r0, r4
	bl Cpsi_TcpShutdownRaw
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CB3F4: .word OSi_ThreadInfo
	arm_func_end Cps_TcpShutdown

	arm_func_start Cps_TcpClose
Cps_TcpClose: ; 0x022CB3F8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022CB478 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _022CB424
	mov r0, r4
	bl Cpsi_SslClose
_022CB424:
	bl OS_GetTick
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	ldr r5, _022CB47C ; =ov00_02325078
	b _022CB43C
_022CB438:
	bl OS_YieldThread2
_022CB43C:
	ldr r0, [r5, #0x48]
	blx r0
	cmp r0, #0
	ldrneb r0, [r4, #8]
	cmpne r0, #0
	beq _022CB46C
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x27
	blt _022CB438
_022CB46C:
	mov r0, #0
	strb r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CB478: .word OSi_ThreadInfo
_022CB47C: .word ov00_02325078
	arm_func_end Cps_TcpClose

	arm_func_start udp_read_raw
udp_read_raw: ; 0x022CB480
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	bl EnableIrqFlag
	ldr r6, [r8, #0x44]
	mov r7, r0
	cmp r6, #0
	bne _022CB4C0
	mov r5, #3
	mov r4, #0
_022CB4A8:
	mov r0, r4
	str r5, [r8, #4]
	bl OS_SleepThread
	ldr r6, [r8, #0x44]
	cmp r6, #0
	beq _022CB4A8
_022CB4C0:
	mov r0, r7
	bl SetIrqFlag
	str r6, [sb]
	ldr r0, [r8, #0x40]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end udp_read_raw

	arm_func_start Cpsi_TcpReadRaw
Cpsi_TcpReadRaw: ; 0x022CB4D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r1
	ldr r1, [r4, #0x44]
	mov r5, r0
	cmp r1, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	bne _022CB534
	bl EnableIrqFlag
	mov r8, r0
	mov r7, #2
	mov r6, #0
	b _022CB514
_022CB508:
	mov r0, r6
	str r7, [r4, #4]
	bl OS_SleepThread
_022CB514:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	beq _022CB508
	mov r0, r8
	bl SetIrqFlag
	b _022CB538
_022CB534:
	bl OS_YieldThread
_022CB538:
	ldr r0, [r4, #0x44]
	str r0, [r5]
	cmp r0, #0
	ldrne r0, [r4, #0x40]
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Cpsi_TcpReadRaw

	arm_func_start Cps_SocRead
Cps_SocRead: ; 0x022CB550
	stmdb sp!, {r3, lr}
	ldr r1, _022CB5B0 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	beq _022CB5A0
	ldrb r2, [r1, #8]
	add r2, r2, #0xf6
	and r2, r2, #0xff
	cmp r2, #1
	bhi _022CB584
	bl udp_read_raw
	ldmia sp!, {r3, pc}
_022CB584:
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _022CB598
	bl Cpsi_SslRead
	ldmia sp!, {r3, pc}
_022CB598:
	bl Cpsi_TcpReadRaw
	ldmia sp!, {r3, pc}
_022CB5A0:
	mov r1, #0
	str r1, [r0]
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CB5B0: .word OSi_ThreadInfo
	arm_func_end Cps_SocRead

	arm_func_start Cpsi_SocConsumeRaw
Cpsi_SocConsumeRaw: ; 0x022CB5B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl EnableIrqFlag
	ldr r2, [r4, #0x44]
	ldr r1, [r4, #0x3c]
	mov r5, r0
	cmp r2, r1
	mov r6, #0
	bne _022CB5E4
	cmp r7, #0
	movne r6, #1
_022CB5E4:
	cmp r7, r2
	movhs r0, #0
	strhs r0, [r4, #0x44]
	bhs _022CB608
	ldr r0, [r4, #0x40]
	sub r2, r2, r7
	add r1, r0, r7
	str r2, [r4, #0x44]
	bl memmove
_022CB608:
	mov r0, r5
	bl SetIrqFlag
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _022CB634
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022CB634:
	mov r0, r4
	mov r1, #0x1b
	bl tcp_send_ack
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Cpsi_SocConsumeRaw

	arm_func_start Cps_SocConsume
Cps_SocConsume: ; 0x022CB644
	stmdb sp!, {r3, lr}
	ldr r1, _022CB678 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _022CB670
	bl Cpsi_SslConsume
	ldmia sp!, {r3, pc}
_022CB670:
	bl Cpsi_SocConsumeRaw
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CB678: .word OSi_ThreadInfo
	arm_func_end Cps_SocConsume

	arm_func_start tcp_write_do
tcp_write_do: ; 0x022CB67C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r2
	ldr r6, [r8, #0x34]
	movs fp, r3
	mov sl, r0
	movne r5, #1
	mov r0, r6, lsl #1
	mov sb, r1
	ldreqh r5, [r8, #0x2c]
	add r7, r0, #4
	b _022CB720
_022CB6A8:
	ldr r0, _022CB73C ; =ov00_02325078
	ldrh r4, [r8, #0x2e]
	ldrh r0, [r0, #2]
	ldr r1, [r8, #0x34]
	cmp r4, r5
	movhs r4, r5
	cmp r0, r4
	movlo r4, r0
	cmp fp, #0
	biceq r4, r4, #1
	cmp sb, r4
	sub r0, r1, r6
	movlo r4, sb
	adds r0, r7, r0
	moveq r4, #0
	mov r6, r1
	sub r7, r0, #1
	cmp r4, #0
	beq _022CB734
	mov r2, #0
	str r2, [sp]
	mov r0, sl
	mov r1, r4
	mov r2, r8
	mov r3, #0x18
	sub r5, r5, r4
	bl send_tcp
	bl OS_YieldThread
	add sl, sl, r4
	sub sb, sb, r4
_022CB720:
	cmp sb, #0
	beq _022CB734
	ldrb r0, [r8, #8]
	cmp r0, #4
	beq _022CB6A8
_022CB734:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CB73C: .word ov00_02325078
	arm_func_end tcp_write_do

	arm_func_start tcp_write_do2
tcp_write_do2: ; 0x022CB740
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r2
	mov r4, r3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl tcp_write_do
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [sp, #0x10]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl tcp_write_do
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end tcp_write_do2

	arm_func_start Cpsi_TcpWrite2Raw
Cpsi_TcpWrite2Raw: ; 0x022CB77C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, #0
	mov fp, r0
	ldr r8, [sp, #0x38]
	mov r0, r4
	str r4, [sp, #0x10]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	mov r6, r4
	str r0, [r8, #0x34]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
	b _022CB934
_022CB7C0:
	ldr r7, [r8, #0x28]
	ldr r3, [sp, #8]
	str r8, [sp]
	mov r0, fp
	mov r1, sl
	mov r2, sb
	str r6, [sp, #4]
	bl tcp_write_do2
	bl OS_GetTick
	mov r5, r0, lsr #0x10
	ldr r4, _022CB980 ; =ov00_02325078
	orr r5, r5, r1, lsl #16
_022CB7F0:
	bl OS_YieldThread2
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _022CB848
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _022CB848
	ldr r1, [r8, #0x28]
	ldr r0, [r8, #0x30]
	cmp r1, r0
	beq _022CB848
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	bge _022CB848
	cmp r6, #0
	ldrneh r0, [r8, #0x2c]
	cmpne r0, #0
	beq _022CB7F0
_022CB848:
	ldr r1, [r8, #0x30]
	ldr r0, [r8, #0x28]
	sub r5, r1, r7
	sub r0, r0, r7
	cmp r5, r0
	movhi r5, #0
	ldr r0, [sp, #0x10]
	cmp r5, #0
	add r0, r0, r5
	str r0, [sp, #0x10]
	beq _022CB884
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
_022CB884:
	ldr r0, [r8, #0x30]
	str r0, [r8, #0x28]
	ldrb r0, [r8, #8]
	cmp r0, #4
	ldreqh r0, [r8, #0x2c]
	cmpeq r0, #0
	cmpeq r5, #0
	bne _022CB908
	cmp r6, #0
	bne _022CB90C
	bl OS_GetTick
	mov r7, r0, lsr #0x10
	orr r7, r7, r1, lsl #16
	ldr r4, _022CB980 ; =ov00_02325078
	b _022CB8D0
_022CB8C0:
	bl OS_YieldThread2
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	bne _022CB8F8
_022CB8D0:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _022CB8F8
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r7
	cmp r0, #0xf
	blt _022CB8C0
_022CB8F8:
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	moveq r6, #1
	b _022CB90C
_022CB908:
	mov r6, #0
_022CB90C:
	cmp r5, sl
	addlo fp, fp, r5
	sublo sl, sl, r5
	blo _022CB934
	sub r1, r5, sl
	ldr r0, [sp, #8]
	add fp, sb, r1
	mov sb, #0
	sub sl, r0, r1
	str sb, [sp, #8]
_022CB934:
	ldr r0, _022CB980 ; =ov00_02325078
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	cmpne sl, #0
	beq _022CB974
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _022CB974
	bl OS_GetTick
	mov r2, r0, lsr #0x10
	ldr r0, [sp, #0xc]
	orr r2, r2, r1, lsl #16
	sub r0, r2, r0
	cmp r0, #0x9f
	blt _022CB7C0
_022CB974:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CB980: .word ov00_02325078
	arm_func_end Cpsi_TcpWrite2Raw

	arm_func_start Cpsi_SocWrite2
Cpsi_SocWrite2: ; 0x022CB984
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _022CBA50 ; =OSi_ThreadInfo
	mov r7, r1
	ldr ip, [ip, #4]
	mov r6, r2
	ldr r4, [ip, #0xa4]
	mov r5, r3
	cmp r4, #0
	beq _022CBA48
	ldrb ip, [r4, #8]
	cmp ip, #0xa
	bne _022CB9E4
	cmp r7, #0
	beq _022CB9C4
	mov r2, r4
	bl send_udp
_022CB9C4:
	cmp r5, #0
	beq _022CB9DC
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl send_udp
_022CB9DC:
	add r0, r7, r5
	b _022CBA38
_022CB9E4:
	cmp ip, #0xb
	bne _022CBA1C
	cmp r7, #0
	beq _022CB9FC
	mov r2, r4
	bl send_ping
_022CB9FC:
	cmp r5, #0
	beq _022CBA14
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl send_ping
_022CBA14:
	add r0, r7, r5
	b _022CBA38
_022CBA1C:
	ldrb ip, [r4, #9]
	cmp ip, #0
	str r4, [sp]
	beq _022CBA34
	bl Cpsi_SslWrite2
	b _022CBA38
_022CBA34:
	bl Cpsi_TcpWrite2Raw
_022CBA38:
	ldr r1, _022CBA54 ; =ov00_02325078
	ldrb r1, [r1]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022CBA48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CBA50: .word OSi_ThreadInfo
_022CBA54: .word ov00_02325078
	arm_func_end Cpsi_SocWrite2

	arm_func_start Cps_SocWrite
Cps_SocWrite: ; 0x022CBA58
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022CBAEC ; =OSi_ThreadInfo
	mov r2, r0
	ldr r4, [r3, #4]
	mov r3, r1
	ldr r5, [r4, #0xa4]
	cmp r5, #0
	beq _022CBAE4
	ldr r4, [r5, #0x60]
	cmp r4, #0
	beq _022CBAD4
	ldr r0, [r5, #0x5c]
	mov r1, r4
	bl Cpsi_SocWrite2
	ldr r1, [r5, #0x60]
	mov r4, r0
	cmp r4, r1
	bhs _022CBAC4
	ldr r0, [r5, #0x5c]
	sub r2, r1, r4
	add r1, r0, r4
	bl memmove
	ldr r1, [r5, #0x60]
	mov r0, #0
	sub r1, r1, r4
	str r1, [r5, #0x60]
	ldmia sp!, {r3, r4, r5, pc}
_022CBAC4:
	mov r0, #0
	str r0, [r5, #0x60]
	sub r0, r4, r1
	ldmia sp!, {r3, r4, r5, pc}
_022CBAD4:
	mov r2, #0
	mov r3, r2
	bl Cpsi_SocWrite2
	ldmia sp!, {r3, r4, r5, pc}
_022CBAE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CBAEC: .word OSi_ThreadInfo
	arm_func_end Cps_SocWrite

	arm_func_start Cps_SocGetLength
Cps_SocGetLength: ; 0x022CBAF0
	stmdb sp!, {r3, lr}
	ldr r0, _022CBB5C ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _022CBB54
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _022CBB1C
	bl Cpsi_SslGetLength
	ldmia sp!, {r3, pc}
_022CBB1C:
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _022CBB44
	ldrb r0, [r0, #8]
	cmp r0, #4
	beq _022CBB44
	add r0, r0, #0xf6
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022CBB4C
_022CBB44:
	mov r0, r1
	ldmia sp!, {r3, pc}
_022CBB4C:
	mvn r0, #0
	ldmia sp!, {r3, pc}
_022CBB54:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CBB5C: .word OSi_ThreadInfo
	arm_func_end Cps_SocGetLength

	arm_func_start Cps_SocFlush
Cps_SocFlush: ; 0x022CBB60
	stmdb sp!, {r4, lr}
	ldr r0, _022CBB9C ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldrne r1, [r4, #0x60]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0
	ldr r0, [r4, #0x5c]
	mov r3, r2
	bl Cpsi_SocWrite2
	mov r0, #0
	str r0, [r4, #0x60]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CBB9C: .word OSi_ThreadInfo
	arm_func_end Cps_SocFlush

	arm_func_start set_fixed_ip
set_fixed_ip: ; 0x022CBBA0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022CBC3C ; =ov00_02325078
	ldr r0, [r0, #0x18]
	blx r0
	ldr r0, _022CBC3C ; =ov00_02325078
	ldr r0, [r0, #0x50]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl send_arprequest
	mov r0, #0x64
	bl OS_Sleep
	ldr r0, _022CBC3C ; =ov00_02325078
	ldr r0, [r0, #0x50]
	bl send_arprequest
	bl OS_GetTick
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	mov r5, #0x64
	ldr r4, _022CBC3C ; =ov00_02325078
	b _022CBC10
_022CBBF0:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _022CBC08
	mov r0, #4
	bl reset_network_vars
	ldmia sp!, {r4, r5, r6, pc}
_022CBC08:
	mov r0, r5
	bl OS_Sleep
_022CBC10:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x17
	blt _022CBBF0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CBC3C: .word ov00_02325078
	arm_func_end set_fixed_ip

	arm_func_start scavenger
scavenger: ; 0x022CBC40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _022CBF90 ; =ov00_02325078
	mov r1, #0
	ldr r0, _022CBF94 ; =ov00_02325158
	mov r2, #0x64
	str r1, [r3, #0x44]
	bl MI_CpuFill8
	ldr r1, _022CBF90 ; =ov00_02325078
	mov r3, #0x180
	ldr r0, _022CBF98 ; =ov00_02325724
	str r3, [r1, #0x11c]
	str r0, [r1, #0x120]
	ldr r2, _022CBF9C ; =ov00_023255A4
	str r3, [r1, #0x128]
	ldr r0, _022CBF94 ; =ov00_02325158
	str r2, [r1, #0x12c]
	bl Cps_SocRegister
	mov sl, #1
	ldr r0, _022CBF90 ; =ov00_02325078
	mov fp, sl
	str sl, [sp]
	str sl, [r0, #0xc]
	mov r4, #0
_022CBC9C:
	mov r0, #0x3e8
	bl OS_Sleep
	ldr r0, _022CBF90 ; =ov00_02325078
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _022CBF70
	bl OS_GetTick
	ldr r2, _022CBF90 ; =ov00_02325078
	mov r5, r0, lsr #0x10
	ldr r0, [r2, #0x48]
	orr r5, r5, r1, lsl #16
	blx r0
	cmp r0, #0
	beq _022CBDC8
	ldr r0, [sp]
	subs r0, r0, #1
	str r0, [sp]
	bne _022CBDDC
	ldr r0, _022CBF90 ; =ov00_02325078
	ldr r1, [r0, #0x10]
	tst r1, #1
	beq _022CBD08
	cmp r4, #0
	bne _022CBDDC
	bl set_fixed_ip
	mov r4, #1
	b _022CBDDC
_022CBD08:
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _022CBDDC
_022CBD14: ; jump table
	b _022CBD24 ; case 0
	b _022CBD68 ; case 1
	b _022CBD8C ; case 2
	b _022CBDDC ; case 3
_022CBD24:
	cmp fp, #0
	movne r1, #2
	strne r1, [r0, #0xc]
	movne fp, #0
	bl dhcp_discover_server
	cmp r0, #0
	beq _022CBD54
	add r0, sp, #0
	mov r1, #0
	bl dhcp_request_server
	cmp r0, #0
	bne _022CBD60
_022CBD54:
	bl set_fixed_ip
	mov r4, #3
	b _022CBDDC
_022CBD60:
	mov r4, #1
	b _022CBDDC
_022CBD68:
	add r0, sp, #0
	mov r1, #1
	bl dhcp_request_server
	cmp r0, #0
	bne _022CBDDC
	ldr r0, [sp]
	cmp r0, #0x3c
	movlo r4, #2
	b _022CBDDC
_022CBD8C:
	add r0, sp, #0
	mov r1, #2
	bl dhcp_request_server
	cmp r0, #0
	movne r4, #1
	bne _022CBDDC
	ldr r0, [sp]
	cmp r0, #0x3c
	bhs _022CBDDC
	mov r0, #3
	bl reset_network_vars
	mov sl, #1
	str sl, [sp]
	mov r4, #0
	b _022CBDDC
_022CBDC8:
	mov r0, #1
	bl reset_network_vars
	mov sl, #1
	str sl, [sp]
	mov r4, #0
_022CBDDC:
	mov r3, #0
	ldr r6, _022CBFA0 ; =ov00_023250F8
	ldr r1, _022CBFA4 ; =0x000003BD
	mov r2, r3
_022CBDEC:
	ldr r0, [r6]
	cmp r0, #0
	beq _022CBE0C
	ldrh r0, [r6, #0xa]
	sub r0, r5, r0
	mov r0, r0, lsl #0x10
	cmp r1, r0, asr #16
	strlt r2, [r6]
_022CBE0C:
	add r3, r3, #1
	cmp r3, #8
	add r6, r6, #0xc
	blt _022CBDEC
	ldr r0, _022CBF90 ; =ov00_02325078
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _022CBE3C
	subs sl, sl, #1
	bne _022CBE3C
	bl send_arprequest
	mov sl, #0x69
_022CBE3C:
	ldr r0, _022CBFA8 ; =OSi_ThreadInfo
	ldr sb, [r0, #8]
	cmp sb, #0
	beq _022CBF04
	mov r6, #0
	mov r7, r6
	mov r8, #1
_022CBE58:
	ldr r0, [sb, #0xa4]
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	beq _022CBEF8
	ldrb r1, [r0, #8]
	cmp r1, #3
	bne _022CBEA0
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _022CBEA0
	strb r8, [r0, #8]
	ldrh r1, [r0, #0x1a]
	strh r1, [r0, #0x18]
	ldr r1, [r0, #0x20]
	str r1, [r0, #0x1c]
	b _022CBEF8
_022CBEA0:
	cmp r1, #2
	bne _022CBED8
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _022CBED8
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _022CBEF8
	strb r7, [r0, #8]
	str r7, [r0, #4]
	ldr r0, [r0]
	bl OS_WakeupThreadDirect
	b _022CBEF8
_022CBED8:
	cmp r1, #4
	beq _022CBEF8
	ldr r1, [r0, #4]
	cmp r1, #2
	bne _022CBEF8
	str r6, [r0, #4]
	ldr r0, [r0]
	bl OS_WakeupThreadDirect
_022CBEF8:
	ldr sb, [sb, #0x68]
	cmp sb, #0
	bne _022CBE58
_022CBF04:
	mov sb, #0
	ldr r8, _022CBFAC ; =ov00_023253A0
	ldr r6, _022CBF90 ; =ov00_02325078
	mov r7, sb
_022CBF14:
	ldrh r0, [r8, #4]
	cmp r0, #0
	beq _022CBF40
	ldr r0, [r8, #0x2c]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _022CBF40
	ldr r0, [r8, #0x34]
	ldr r1, [r6, #0x40]
	blx r1
	strh r7, [r8, #4]
_022CBF40:
	add sb, sb, #1
	cmp sb, #8
	add r8, r8, #0x38
	blt _022CBF14
	mov r0, r5
	bl Cpsi_SslPeriodical
	ldr r0, _022CBF90 ; =ov00_02325078
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _022CBC9C
	blx r0
	b _022CBC9C
_022CBF70:
	ldr r0, [r0, #0x10]
	tst r0, #1
	bne _022CBF88
	cmp r4, #3
	beq _022CBF88
	bl dhcp_release_server
_022CBF88:
	bl Cps_SocUnRegister
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CBF90: .word ov00_02325078
_022CBF94: .word ov00_02325158
_022CBF98: .word ov00_02325724
_022CBF9C: .word ov00_023255A4
_022CBFA0: .word ov00_023250F8
_022CBFA4: .word 0x000003BD
_022CBFA8: .word OSi_ThreadInfo
_022CBFAC: .word ov00_023253A0
	arm_func_end scavenger

	arm_func_start dhcp_setcommon
dhcp_setcommon: ; 0x022CBFB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r2, #0xec
	mov r6, r0
	bl MI_CpuFill8
	ldr r0, _022CC120 ; =0x00000101
	mov r1, #6
	strh r0, [r6]
	ldr r0, _022CC124 ; =ov00_02325078
	strb r1, [r6, #2]
	ldr r3, [r0, #0x70]
	ldr r2, [r0, #0x68]
	ldr r1, [r0, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r1, ip
	ldr r1, [r0, #0x74]
	ldr r7, [r0, #0x78]
	mla ip, r1, r2, ip
	ldr r3, [r0, #0x7c]
	adds r7, r7, lr
	adc r1, r3, ip
	str r7, [r0, #0x68]
	str r1, [r0, #0x6c]
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r4, #0
	mov r2, r3, lsl #8
	mov r0, r1, lsl #0x10
	strne r1, [r4]
	mov r1, r0, lsr #0x10
	orr r2, r2, r3, asr #8
	mov r0, r1, lsl #8
	strh r2, [r6, #4]
	orr r0, r0, r1, asr #8
	strh r0, [r6, #6]
	ldr r2, _022CC124 ; =ov00_02325078
	ldr r0, _022CC128 ; =ov00_02325560
	ldr r1, [r2, #0x50]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r6, #0xc]
	ldr r2, [r2, #0x50]
	add r1, r6, #0x1c
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, #6
	strh r3, [r6, #0xe]
	bl MI_CpuCopy8
	ldr r0, _022CC12C ; =0x00008263
	ldr r1, _022CC130 ; =0x00006353
	strh r0, [r6, #0xec]
	strh r1, [r6, #0xee]
	ldr r0, _022CC134 ; =0x00000135
	mov r1, #7
	strh r0, [r6, #0xf0]
	strb r5, [r6, #0xf2]
	mov r0, #0x3d
	strb r0, [r6, #0xf3]
	strb r1, [r6, #0xf4]
	mov r3, #1
	ldr r0, _022CC128 ; =ov00_02325560
	add r1, r6, #0xf6
	mov r2, #6
	strb r3, [r6, #0xf5]
	bl MI_CpuCopy8
	mov r1, #0xc
	strb r1, [r6, #0xfc]
	mov r2, #0xa
	ldr r0, _022CC138 ; =ov00_0231885C
	add r1, r6, #0xfe
	strb r2, [r6, #0xfd]
	bl MI_CpuCopy8
	mov r1, #0x37
	strb r1, [r6, #0x108]
	mov r2, #3
	add r0, r6, #0xd
	strb r2, [r6, #0x109]
	mov r1, #1
	strb r1, [r6, #0x10a]
	strb r2, [r6, #0x10b]
	mov r1, #6
	strb r1, [r6, #0x10c]
	add r0, r0, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CC120: .word 0x00000101
_022CC124: .word ov00_02325078
_022CC128: .word ov00_02325560
_022CC12C: .word 0x00008263
_022CC130: .word 0x00006353
_022CC134: .word 0x00000135
_022CC138: .word ov00_0231885C
	arm_func_end dhcp_setcommon

	arm_func_start pad_mem
pad_mem: ; 0x022CC13C
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r0
	mov r5, r2
	cmp r3, r1
	bhs _022CC168
	sub r4, r1, r3
	mov r0, r5
	mov r1, ip
	mov r2, r4
	bl MI_CpuFill8
	add r5, r5, r4
_022CC168:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end pad_mem

	arm_func_start dhcp_send_discover
dhcp_send_discover: ; 0x022CC170
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, _022CC22C ; =ov00_023255CE
	add r2, sp, #0
	mov r0, r4
	mov r1, #1
	bl dhcp_setcommon
	ldr r1, _022CC230 ; =ov00_02325078
	mov ip, r0
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _022CC1F4
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	strb r0, [ip, #1]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #2]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #3]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #4]
	ldr r0, [r1, #0x34]
	strb r0, [ip, #5]
	add ip, ip, #6
_022CC1F4:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl pad_mem
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl Cps_SocWrite
	ldr r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022CC22C: .word ov00_023255CE
_022CC230: .word ov00_02325078
	arm_func_end dhcp_send_discover

	arm_func_start dhcp_send_request
dhcp_send_request: ; 0x022CC234
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022CC334 ; =ov00_023255CE
	mov r5, r0
	add r2, sp, #0
	mov r0, r4
	mov r1, #3
	bl dhcp_setcommon
	mov ip, r0
	cmp r5, #0
	bne _022CC300
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	ldr r2, _022CC338 ; =ov00_02325078
	strb r0, [ip, #1]
	ldr r1, [r2, #0x34]
	mov r3, #0x36
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #2]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsr #0x10
	strb r1, [ip, #3]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #4]
	ldr r1, [r2, #0x34]
	strb r1, [ip, #5]
	strb r3, [ip, #6]
	strb r0, [ip, #7]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #8]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #9]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #0xa]
	ldr r0, [r2, #0x20]
	strb r0, [ip, #0xb]
	add ip, ip, #0xc
_022CC300:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl pad_mem
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl Cps_SocWrite
	ldr r0, [sp]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CC334: .word ov00_023255CE
_022CC338: .word ov00_02325078
	arm_func_end dhcp_send_request

	arm_func_start dhcp_analyze_response
dhcp_analyze_response: ; 0x022CC33C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	add r1, r1, #1
	str r0, [sp]
	rsb fp, r1, r1, lsl #4
	bl OS_GetTick
	mov r4, r0, lsr #0x10
	orr r4, r4, r1, lsl #16
	mov r5, #0
	b _022CC644
_022CC364:
	bl Cps_SocGetLength
	cmp r0, #0
	bne _022CC378
	bl OS_YieldThread2
	b _022CC644
_022CC378:
	add r0, sp, #4
	bl Cps_SocRead
	ldr r1, [sp, #4]
	mov r6, r0
	cmp r1, #0xf0
	bls _022CC63C
	ldrb r0, [r6]
	cmp r0, #2
	bne _022CC63C
	ldrh r3, [r6, #6]
	ldrh r2, [r6, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r2, lsl #16
	ldr r0, [sp]
	cmp r0, r1
	bne _022CC63C
	ldr r1, _022CC684 ; =ov00_02325560
	add r0, r6, #0x1c
	bl maccmp
	cmp r0, #0
	bne _022CC63C
	ldrb r3, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	ldrb r1, [r6, #0x12]
	ldrb r0, [r6, #0x13]
	orr r3, r2, r3, lsl #8
	ldrb r2, [r6, #0xec]
	orr r1, r0, r1, lsl #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #0x63
	orr r2, r0, r5, lsl #16
	ldreqb r0, [r6, #0xed]
	ldr r3, [sp, #4]
	mov r5, #3
	cmpeq r0, #0x82
	ldreqb r0, [r6, #0xee]
	add r1, r6, r3
	cmpeq r0, #0x53
	ldreqb r0, [r6, #0xef]
	addeq r3, r6, #0xf0
	cmpeq r0, #0x63
	bne _022CC63C
	mov r0, #0
	mov sb, #2
	mov sl, #1
	ldr ip, _022CC688 ; =ov00_02325078
	b _022CC628
_022CC45C:
	cmp r6, #0
	beq _022CC628
	cmp r6, #0x33
	bgt _022CC498
	bge _022CC590
	cmp r6, #6
	bgt _022CC61C
	cmp r6, #1
	blt _022CC61C
	beq _022CC4B4
	cmp r6, #3
	beq _022CC4E8
	cmp r6, #6
	beq _022CC51C
	b _022CC61C
_022CC498:
	cmp r6, #0x35
	bgt _022CC4A8
	beq _022CC5C4
	b _022CC61C
_022CC4A8:
	cmp r6, #0x36
	beq _022CC5EC
	b _022CC61C
_022CC4B4:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x1c]
	b _022CC61C
_022CC4E8:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x2c]
	b _022CC61C
_022CC51C:
	ldrb r6, [r3]
	cmp r6, #8
	strlo r0, [ip, #0x64]
	blo _022CC55C
	ldrb lr, [r3, #5]
	ldrb r8, [r3, #6]
	ldrb r7, [r3, #7]
	ldrb r6, [r3, #8]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x64]
_022CC55C:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x60]
	b _022CC61C
_022CC590:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x4c]
	b _022CC61C
_022CC5C4:
	ldrb r6, [r3, #1]
	cmp r6, #2
	beq _022CC5E0
	cmp r6, #5
	moveq r5, sb
	streq r2, [ip, #0x50]
	b _022CC61C
_022CC5E0:
	mov r5, sl
	str r2, [ip, #0x34]
	b _022CC61C
_022CC5EC:
	ldrb r8, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r6, [r3, #3]
	ldrb lr, [r3, #4]
	orr r7, r7, r8, lsl #8
	mov r7, r7, lsl #0x10
	orr r6, lr, r6, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r7, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x20]
_022CC61C:
	ldrb r6, [r3]
	add r6, r6, #1
	add r3, r3, r6
_022CC628:
	cmp r3, r1
	bhs _022CC63C
	ldrb r6, [r3], #1
	cmp r6, #0xff
	bne _022CC45C
_022CC63C:
	ldr r0, [sp, #4]
	bl Cps_SocConsume
_022CC644:
	ldr r0, _022CC688 ; =ov00_02325078
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _022CC678
	cmp r5, #0
	bne _022CC678
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r4
	cmp r0, fp
	blt _022CC364
_022CC678:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CC684: .word ov00_02325560
_022CC688: .word ov00_02325078
	arm_func_end dhcp_analyze_response

	arm_func_start dhcp_discover_server
dhcp_discover_server: ; 0x022CC68C
	stmdb sp!, {r3, r4, r5, lr}
	bl Cps_SocUse
	bl Cps_SocDatagramMode
	mov r1, #0x43
	sub r2, r1, #0x44
	mov r0, #0x44
	bl Cps_SocBind
	mov r5, #0
_022CC6AC:
	bl dhcp_send_discover
	mov r1, r5
	bl dhcp_analyze_response
	mov r4, r0
	cmp r4, #1
	beq _022CC6D0
	add r5, r5, #1
	cmp r5, #4
	blt _022CC6AC
_022CC6D0:
	bl Cps_SocRelease
	cmp r4, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end dhcp_discover_server

	arm_func_start dhcp_request_server
dhcp_request_server: ; 0x022CC6E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	bl Cps_SocUse
	bl Cps_SocDatagramMode
	cmp r4, #1
	mov r0, #0x44
	bne _022CC718
	ldr r1, _022CC7DC ; =ov00_02325078
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl Cps_SocBind
	b _022CC724
_022CC718:
	mov r1, #0x43
	sub r2, r1, #0x44
	bl Cps_SocBind
_022CC724:
	mov r7, #0
_022CC728:
	mov r0, r4
	bl dhcp_send_request
	mov r1, r7
	bl dhcp_analyze_response
	movs r6, r0
	bne _022CC74C
	add r7, r7, #1
	cmp r7, #4
	blt _022CC728
_022CC74C:
	bl Cps_SocRelease
	cmp r6, #2
	bne _022CC780
	ldr r1, _022CC7DC ; =ov00_02325078
	mov r0, #1
	ldr r2, [r1, #0x4c]
	mov r2, r2, lsr #1
	str r2, [r5]
	ldr r2, [r1, #0x4c]
	add r2, r2, r2, lsl #1
	mov r2, r2, lsr #3
	str r2, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CC780:
	ldr r0, _022CC7DC ; =ov00_02325078
	cmp r4, #1
	ldr r1, [r0, #0x38]
	mov r1, r1, lsr #1
	str r1, [r0, #0x38]
	str r1, [r5]
	beq _022CC7A8
	cmp r4, #2
	beq _022CC7C8
	b _022CC7D4
_022CC7A8:
	cmp r1, #0x3c
	bhs _022CC7D4
	mov r1, #1
	str r1, [r5]
	ldr r1, [r0, #0x4c]
	mov r1, r1, lsr #3
	str r1, [r0, #0x38]
	b _022CC7D4
_022CC7C8:
	cmp r1, #0x3c
	movlo r0, #1
	strlo r0, [r5]
_022CC7D4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CC7DC: .word ov00_02325078
	arm_func_end dhcp_request_server

	arm_func_start dhcp_release_server
dhcp_release_server: ; 0x022CC7E0
	stmdb sp!, {r4, lr}
	bl Cps_SocUse
	bl Cps_SocDatagramMode
	ldr r1, _022CC844 ; =ov00_02325078
	mov r0, #0x44
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl Cps_SocBind
	ldr r4, _022CC848 ; =ov00_023255CE
	mov r1, #7
	mov r0, r4
	mov r2, #0
	bl dhcp_setcommon
	mov r1, #0xff
	add r2, r0, #1
	strb r1, [r0]
	mov r0, #0
	mov r1, #0x12c
	sub r3, r2, r4
	bl pad_mem
	sub r1, r0, r4
	mov r0, r4
	bl Cps_SocWrite
	bl Cps_SocRelease
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CC844: .word ov00_02325078
_022CC848: .word ov00_023255CE
	arm_func_end dhcp_release_server

	arm_func_start dns_skipname
dns_skipname: ; 0x022CC84C
	ldrb r2, [r0], #1
	cmp r2, #0
	bxeq lr
_022CC858:
	and r1, r2, #0xc0
	cmp r1, #0xc0
	addeq r0, r0, #1
	bxeq lr
	add r0, r0, r2
	ldrb r2, [r0], #1
	cmp r2, #0
	bne _022CC858
	bx lr
	arm_func_end dns_skipname

	arm_func_start resolve_common
resolve_common: ; 0x022CC87C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov sb, r2
	mov r2, sb, lsl #8
	mov sl, r1
	orr r1, r2, sb, asr #8
	strh r1, [sp, #4]
	cmp sl, #0x20
	mov r6, #0
	movne r1, #1
	strneh r1, [sp, #6]
	ldreq r1, _022CCB1C ; =0x00001001
	strh r6, [sp, #0xa]
	streqh r1, [sp, #6]
	mov r1, #0x100
	strh r1, [sp, #8]
	add r1, sp, #0x10
	strh r6, [sp, #0xc]
	strh r6, [sp, #0xe]
	str r6, [sp]
	ldrb r7, [r0], #1
	mov fp, r3
	ldr r8, [sp, #0x68]
	add r2, r1, #1
	cmp r7, #0
	beq _022CC944
	mov r4, r6
	add r5, sp, #4
	mov r3, r6
_022CC8F0:
	cmp r7, #0x2e
	beq _022CC920
	sub r6, r2, r5
	cmp r6, #0x3c
	addge sp, sp, #0x40
	mvnge r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r4, #1
	mov r4, r6
	str r6, [sp]
	strb r7, [r2], #1
	b _022CC938
_022CC920:
	strb r6, [r1]
	mov r1, r2
	mov r4, r3
	mov r6, r3
	str r3, [sp]
	add r2, r2, #1
_022CC938:
	ldrb r7, [r0], #1
	cmp r7, #0
	bne _022CC8F0
_022CC944:
	ldr r0, [sp]
	mov r3, #0
	strb r0, [r1]
	strb r3, [r2]
	mov r0, sl, lsr #8
	strb r0, [r2, #1]
	strb sl, [r2, #2]
	strb r3, [r2, #3]
	mov r3, #1
	add r0, sp, #4
	add r1, r2, #5
	sub r1, r1, r0
	strb r3, [r2, #4]
	bl Cps_SocWrite
	mov r4, #0
	bl OS_GetTick
	mov r5, r0, lsr #0x10
	orr r5, r5, r1, lsl #16
	b _022CCADC
_022CC990:
	bl Cps_SocGetLength
	cmp r0, #0
	bne _022CC9A4
	bl OS_YieldThread2
	b _022CCADC
_022CC9A4:
	add r0, sp, #0
	bl Cps_SocRead
	ldr r1, [sp]
	cmp r1, #0xc
	bls _022CCAD4
	ldrh r3, [r0]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp sb, r2, lsr #16
	bne _022CCAD4
	ldrb r2, [r0, #3]
	and r2, r2, #0xf
	cmp r2, #3
	mvneq r4, #0
	beq _022CCAD4
	cmp r2, #0
	bne _022CCAD4
	ldrb r3, [r0, #4]
	ldrb r2, [r0, #5]
	add r6, r0, r1
	add r0, r0, #0xc
	orr r1, r2, r3, lsl #8
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	sub r7, r1, #1
	beq _022CCA24
_022CCA10:
	bl dns_skipname
	cmp r7, #0
	add r0, r0, #4
	sub r7, r7, #1
	bne _022CCA10
_022CCA24:
	cmp r0, r6
	bhs _022CCAD4
_022CCA2C:
	bl dns_skipname
	ldrb r7, [r0, #8]
	ldrb r1, [r0, #9]
	ldrb r3, [r0]
	ldrb r2, [r0, #1]
	orr r1, r1, r7, lsl #8
	mov r1, r1, lsl #0x10
	orr r2, r2, r3, lsl #8
	mov r2, r2, lsl #0x10
	cmp sl, r2, lsr #16
	mov r2, r1, lsr #0x10
	bne _022CCAC4
	cmp sl, #0xc
	beq _022CCAA4
	add r4, r0, #8
	add r0, r0, #6
	add r6, r4, r2
	add r1, r0, r2
	ldrb r3, [r0, r2]
	ldrb r0, [r1, #1]
	ldrb r2, [r4, r2]
	ldrb r1, [r6, #1]
	orr r0, r0, r3, lsl #8
	mov r0, r0, lsl #0x10
	orr r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r4, r0, r2, lsl #16
	b _022CCAD4
_022CCAA4:
	cmp r2, r8
	movhi r4, #2
	bhi _022CCAD4
	mov r1, fp
	add r0, r0, #0xa
	bl MI_CpuCopy8
	mov r4, #1
	b _022CCAD4
_022CCAC4:
	add r1, r2, #0xa
	add r0, r0, r1
	cmp r0, r6
	blo _022CCA2C
_022CCAD4:
	ldr r0, [sp]
	bl Cps_SocConsume
_022CCADC:
	ldr r0, _022CCB20 ; =ov00_02325078
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _022CCB10
	cmp r4, #0
	bne _022CCB10
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	blt _022CC990
_022CCB10:
	mov r0, r4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CCB1C: .word 0x00001001
_022CCB20: .word ov00_02325078
	arm_func_end resolve_common

	arm_func_start strtol10
strtol10: ; 0x022CCB24
	str r0, [r1]
	mov ip, #0
	mov r2, #0xa
_022CCB30:
	ldrb r3, [r0]
	sub r3, r3, #0x30
	and r3, r3, #0xff
	cmp r3, #9
	mlals ip, r2, ip, r3
	addls r0, r0, #1
	strls r0, [r1]
	bls _022CCB30
	mov r0, ip
	bx lr
	arm_func_end strtol10

	arm_func_start rawip
rawip: ; 0x022CCB58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r8, r0
	mov r7, r1
	mov r6, r5
	add r4, sp, #0
_022CCB74:
	mov r0, r8
	mov r1, r4
	bl strtol10
	ldr r2, [sp]
	cmp r8, r2
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r8, r2
	cmp r0, #0xff
	bhi _022CCBC8
	cmp r6, #3
	ldrneb r1, [r2]
	addne r8, r2, #1
	cmpne r1, #0x2e
	bne _022CCBC8
	cmp r6, #3
	bne _022CCBD4
	ldrb r1, [r8]
	cmp r1, #0
	beq _022CCBD4
_022CCBC8:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022CCBD4:
	add r6, r6, #1
	cmp r6, #4
	orr r5, r0, r5, lsl #8
	blt _022CCB74
	str r5, [r7]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end rawip

	arm_func_start resolve_sub
resolve_sub: ; 0x022CCBF4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	movs r5, r1
	mov r6, r0
	mov r4, r2
	addeq sp, sp, #4
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	bl Cps_SocUse
	bl Cps_SocDatagramMode
	mov r2, r5
	mov r0, #0
	mov r1, #0x35
	bl Cps_SocBind
	mov r0, r6
	mov r2, r4
	mov r3, #0
	str r3, [sp]
	mov r1, #1
	bl resolve_common
	mov r4, r0
	bl Cps_SocRelease
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end resolve_sub

	arm_func_start Cps_Resolve
Cps_Resolve: ; 0x022CCC58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, _022CCD88 ; =ov00_02325078
	mov r6, #0
	ldr r5, [r2, #0x70]
	ldr r3, [r2, #0x68]
	ldr r1, [r2, #0x6c]
	umull r8, r7, r5, r3
	ldr sb, [r2, #0x78]
	mla r7, r5, r1, r7
	ldr r4, [r2, #0x74]
	adds fp, sb, r8
	mla r7, r4, r3, r7
	ldr r8, [r2, #0x7c]
	umull r3, r1, r5, fp
	adc sl, r8, r7
	mla r1, r5, sl, r1
	str fp, [r2, #0x68]
	mov r7, r6, lsl #0x10
	adds r5, sb, r3
	mla r1, r4, fp, r1
	str sl, [r2, #0x6c]
	orr r7, r7, sl, lsr #16
	adc r4, r8, r1
	mov r3, r6, lsl #0x10
	str r5, [r2, #0x68]
	orr r3, r3, r4, lsr #16
	add r1, sp, #8
	mov sl, r0
	strh r7, [sp, #2]
	str r4, [r2, #0x6c]
	strh r3, [sp, #4]
	bl rawip
	cmp r0, #0
	ldrne r0, [sp, #8]
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	mov fp, r6
	ldr r7, _022CCD8C ; =ov00_023250D8
	strb r0, [sp]
	strb r0, [sp, #1]
	add r6, sp, #2
	mov r5, fp
	mvn r4, #0
_022CCD0C:
	mov r8, #0
	add sb, sp, #0
_022CCD14:
	ldrb r0, [sb]
	cmp r0, #0
	beq _022CCD4C
	mov r0, r8, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, [r7, r8, lsl #2]
	mov r0, sl
	bl resolve_sub
	cmp r0, #0
	str r0, [sp, #8]
	cmpne r0, r4
	bne _022CCD68
	cmp r0, r4
	streqb r5, [sb]
_022CCD4C:
	add r8, r8, #1
	cmp r8, #2
	add sb, sb, #1
	blt _022CCD14
	add fp, fp, #1
	cmp fp, #3
	blt _022CCD0C
_022CCD68:
	ldr r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	streq r0, [sp, #8]
	ldr r0, [sp, #8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CCD88: .word ov00_02325078
_022CCD8C: .word ov00_023250D8
	arm_func_end Cps_Resolve

    ; NitroWiFi: libsoc.a

	arm_func_start SOCL_Startup
SOCL_Startup: ; 0x022CCD90
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022CCDC4 ; =_02000BF4
	bl OSi_ReferSymbol
	ldr r0, _022CCDC8 ; =ov00_02318868
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	str r4, [r0]
	bl Socli_StartupCps
	bl Socli_StartupSocl
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CCDC4: .word _02000BF4
_022CCDC8: .word ov00_02318868
	arm_func_end SOCL_Startup

	arm_func_start Socli_StartupSocl
Socli_StartupSocl: ; 0x022CCDCC
	stmdb sp!, {r4, lr}
	ldr r0, _022CCE00 ; =ov00_02318868
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl Socli_StartupCommandPacketQueue
	movs r4, r0
	bmi _022CCDF8
	ldr r0, _022CCE04 ; =ov00_023188A0
	bl Socl_CreateSocket
	ldr r1, _022CCE08 ; =ov00_023268C0
	str r0, [r1, #0xc]
_022CCDF8:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CCE00: .word ov00_02318868
_022CCE04: .word ov00_023188A0
_022CCE08: .word ov00_023268C0
	arm_func_end Socli_StartupSocl

	arm_func_start Socli_StartupCps
Socli_StartupCps: ; 0x022CCE0C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022CCF40 ; =ov00_02318868
	ldr r4, _022CCF44 ; =ov00_023268D0
	ldr r5, [r0]
	mov r0, r4
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	ldr r1, [r5, #0x18]
	ldr r0, _022CCF48 ; =ov00_023268C0
	ldr r2, _022CCF4C ; =Socl_LinkIsOn
	str r1, [r0, #0x14]
	ldr r3, [r5, #0x1c]
	mov r1, #0
	str r3, [r0, #0x18]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	ldr r1, [r0]
	str r1, [r0, #0x3c]
	ldr r0, [r5, #0x24]
	cmp r0, #0
	moveq r0, #0x4000
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _022CCE8C
	ldr r1, _022CCF40 ; =ov00_02318868
	ldr r0, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
_022CCE8C:
	str r0, [r4, #0x1c]
	ldr r1, [r5, #0x30]
	ldr lr, [r5, #0x34]
	cmp r1, #0
	moveq r1, #0x240
	sub ip, r1, #0x28
	cmp lr, #0
	moveq lr, #0x10c0
	ldr r2, _022CCF50 ; =ov00_02318888
	add r0, lr, lr, lsr #31
	ldr r1, _022CCF54 ; =ov00_023250C8
	mov r3, #0
	strh lr, [r2, #2]
	mov r0, r0, asr #1
	strh r0, [r2, #4]
	str ip, [r4, #0x24]
	str r3, [r1]
	ldr r0, [r5]
	mov r2, #1
	cmp r0, #0
	beq _022CCF00
	ldr r1, _022CCF58 ; =Socli_DhcpTimeout
	ldr r0, _022CCF48 ; =ov00_023268C0
	str r3, [r4]
	str r1, [r4, #0xc]
	str r2, [r0, #8]
	ldr r0, [r0, #4]
	str r0, [r4, #0x28]
	b _022CCF14
_022CCF00:
	ldr r0, _022CCF48 ; =ov00_023268C0
	ldr r1, _022CCF5C ; =Socli_SetMyIP
	str r3, [r0, #8]
	str r2, [r4]
	str r1, [r4, #0xc]
_022CCF14:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	moveq r0, #0xb
	bl Cps_SetThreadPriority
	ldr r0, _022CCF60 ; =Cpsi_RecvCallbackFunc
	bl Wcm_SetRecvDcfCallback
	ldr r0, _022CCF64 ; =Socli_TrashSocket
	bl Cps_SetScavengerCallback
	mov r0, r4
	bl Cps_Startup
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CCF40: .word ov00_02318868
_022CCF44: .word ov00_023268D0
_022CCF48: .word ov00_023268C0
_022CCF4C: .word Socl_LinkIsOn
_022CCF50: .word ov00_02318888
_022CCF54: .word ov00_023250C8
_022CCF58: .word Socli_DhcpTimeout
_022CCF5C: .word Socli_SetMyIP
_022CCF60: .word Cpsi_RecvCallbackFunc
_022CCF64: .word Socli_TrashSocket
	arm_func_end Socli_StartupCps

	arm_func_start Socli_SetMyIP
Socli_SetMyIP: ; 0x022CCF68
	ldr r0, _022CCFBC ; =ov00_02318868
	ldr r1, _022CCFC0 ; =ov00_023250C8
	ldr ip, [r0]
	ldr r0, _022CCFC4 ; =ov00_02325094
	ldr r3, [ip, #4]
	ldr r2, _022CCFC8 ; =ov00_023250A4
	str r3, [r1]
	ldr r3, [ip, #8]
	ldr r1, _022CCFCC ; =ov00_023250D8
	str r3, [r0]
	ldr r3, [ip, #0xc]
	ldr r0, _022CCFD0 ; =ov00_023268C0
	str r3, [r2]
	ldr r2, [ip, #0x10]
	str r2, [r1]
	ldr r2, [ip, #0x14]
	str r2, [r1, #4]
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022CCFBC: .word ov00_02318868
_022CCFC0: .word ov00_023250C8
_022CCFC4: .word ov00_02325094
_022CCFC8: .word ov00_023250A4
_022CCFCC: .word ov00_023250D8
_022CCFD0: .word ov00_023268C0
	arm_func_end Socli_SetMyIP

	arm_func_start Socli_DhcpTimeout
Socli_DhcpTimeout: ; 0x022CCFD4
	ldr r0, _022CCFE8 ; =ov00_023268C0
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022CCFE8: .word ov00_023268C0
	arm_func_end Socli_DhcpTimeout

	arm_func_start Socl_LinkIsOn
Socl_LinkIsOn: ; 0x022CCFEC
	stmdb sp!, {r3, lr}
	bl Wcm_GetApMacAddress
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Socl_LinkIsOn

	arm_func_start Socli_StartupCommandPacketQueue
Socli_StartupCommandPacketQueue: ; 0x022CD004
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0x2c
	mul r1, r4, r0
	ldr r0, _022CD08C ; =ov00_02318868
	mov r2, r4, lsl #2
	add r2, r2, #3
	ldr r0, [r0]
	add r1, r1, #3
	bic r5, r2, #3
	bic r2, r1, #3
	ldr r1, [r0, #0x18]
	add r0, r2, r5
	blx r1
	movs r6, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _022CD090 ; =ov00_02326904
	mov r1, r6
	mov r2, r4
	bl OS_InitMessageQueue
	cmp r4, #0
	add r5, r6, r5
	ble _022CD07C
_022CD064:
	mov r0, r5
	bl Socli_FreeCommandPacket
	sub r4, r4, #1
	cmp r4, #0
	add r5, r5, #0x2c
	bgt _022CD064
_022CD07C:
	ldr r1, _022CD094 ; =ov00_02326900
	mov r0, #0
	str r6, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CD08C: .word ov00_02318868
_022CD090: .word ov00_02326904
_022CD094: .word ov00_02326900
	arm_func_end Socli_StartupCommandPacketQueue

	arm_func_start Socli_CleanupCommandPacketQueue
Socli_CleanupCommandPacketQueue: ; 0x022CD098
	stmdb sp!, {r3, lr}
	ldr r0, _022CD0D8 ; =ov00_02326900
	ldr r2, [r0, #0x20]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	mvnlt r0, #0
	ldmltia sp!, {r3, pc}
	ldr r1, _022CD0DC ; =ov00_02318868
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	ldr r1, _022CD0D8 ; =ov00_02326900
	mov r0, #0
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CD0D8: .word ov00_02326900
_022CD0DC: .word ov00_02318868
	arm_func_end Socli_CleanupCommandPacketQueue

	arm_func_start Socli_AllocCommandPacket
Socli_AllocCommandPacket: ; 0x022CD0E0
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _022CD104 ; =ov00_02326904
	add r1, sp, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	ldrne r0, [sp]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CD104: .word ov00_02326904
	arm_func_end Socli_AllocCommandPacket

	arm_func_start Socli_CreateCommandPacket
Socli_CreateCommandPacket: ; 0x022CD108
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r0, r4
	mov r5, r1
	bl Socli_AllocCommandPacket
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r6, [r0]
	str r5, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	ldrsb r1, [r5, #0x73]
	strb r1, [r0, #0xc]
	strb r4, [r0, #0xd]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Socli_CreateCommandPacket

	arm_func_start Socli_FreeCommandPacket
Socli_FreeCommandPacket: ; 0x022CD148
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022CD164 ; =ov00_02326904
	mov r2, #0
	bl OS_SendMessage
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CD164: .word ov00_02326904
	arm_func_end Socli_FreeCommandPacket

	arm_func_start Socli_GetCtrlPipe
Socli_GetCtrlPipe: ; 0x022CD168
	ldr r1, [r0, #0x64]
	cmp r1, #0
	ldreq r1, [r0, #0x68]
	mov r0, r1
	bx lr
	arm_func_end Socli_GetCtrlPipe

	arm_func_start Socli_SendCommandPacket
Socli_SendCommandPacket: ; 0x022CD17C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	beq _022CD194
	ldrsb r1, [r5, #0xd]
	tst r1, #1
	beq _022CD19C
_022CD194:
	mov r2, #1
	b _022CD1A0
_022CD19C:
	mov r2, #0
_022CD1A0:
	mov r1, r5
	bl OS_SendMessage
	movs r4, r0
	bne _022CD1B8
	mov r0, r5
	bl Socli_FreeCommandPacket
_022CD1B8:
	cmp r4, #0
	movne r0, #0
	mvneq r0, #0x29
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_SendCommandPacket

	arm_func_start Socli_SendCommandPacketToCtrlPipe
Socli_SendCommandPacketToCtrlPipe: ; 0x022CD1C8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Socli_GetCtrlPipe
	mov r1, r4
	bl Socli_SendCommandPacket
	ldmia sp!, {r4, pc}
	arm_func_end Socli_SendCommandPacketToCtrlPipe

	arm_func_start Socli_ExecCommandPacket
Socli_ExecCommandPacket: ; 0x022CD1E0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r4, r1
	ldrsb r2, [r4, #0xd]
	mov r5, r0
	cmp r2, #1
	bne _022CD234
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #1
	bl OS_InitMessageQueue
	add r2, sp, #8
	mov r0, r5
	mov r1, r4
	str r2, [r4, #8]
	bl Socli_SendCommandPacket
	add r0, sp, #8
	add r1, sp, #4
	mov r2, #1
	bl OS_ReceiveMessage
	b _022CD244
_022CD234:
	mov r2, #0
	str r2, [r4, #8]
	bl Socli_SendCommandPacket
	str r0, [sp, #4]
_022CD244:
	ldr r0, [sp, #4]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_ExecCommandPacket

	arm_func_start Socli_ExecCommandPacketInRecvPipe
Socli_ExecCommandPacketInRecvPipe: ; 0x022CD250
	ldr ip, _022CD25C ; =Socli_ExecCommandPacket
	ldr r0, [r0, #0x64]
	bx ip
	.align 2, 0
_022CD25C: .word Socli_ExecCommandPacket
	arm_func_end Socli_ExecCommandPacketInRecvPipe

	arm_func_start Socli_ExecCommandPacketInSendPipe
Socli_ExecCommandPacketInSendPipe: ; 0x022CD260
	ldr ip, _022CD26C ; =Socli_ExecCommandPacket
	ldr r0, [r0, #0x68]
	bx ip
	.align 2, 0
_022CD26C: .word Socli_ExecCommandPacket
	arm_func_end Socli_ExecCommandPacketInSendPipe

	arm_func_start Socli_ExecCommandPacketInCtrlPipe
Socli_ExecCommandPacketInCtrlPipe: ; 0x022CD270
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Socli_GetCtrlPipe
	mov r1, r4
	bl Socli_ExecCommandPacket
	ldmia sp!, {r4, pc}
	arm_func_end Socli_ExecCommandPacketInCtrlPipe

	arm_func_start Socli_CommandPacketHandler
Socli_CommandPacketHandler: ; 0x022CD288
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r4, #0
	mov sb, r0
	mov sl, r4
	add r6, sp, #0
	mov r5, #1
_022CD2A4:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl OS_ReadMessage
	ldr r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0]
	blx r1
	mov r8, r0
	bl EnableIrqFlag
	mov r7, r0
	bl OS_DisableScheduler
	mov r0, sb
	mov r1, r4
	mov r2, r4
	bl OS_ReceiveMessage
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	strne r8, [r0, #0x6c]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022CD318
	mov r1, r8
	mov r2, sl
	bl OS_SendMessage
_022CD318:
	ldr r0, [sp]
	bl Socli_FreeCommandPacket
	bl OS_EnableScheduler
	mov r0, r7
	bl SetIrqFlag
	b _022CD2A4
	arm_func_end Socli_CommandPacketHandler

	arm_func_start ov00_022CD330
ov00_022CD330: ; 0x022CD330
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov00_022CD330

	arm_func_start Socl_CreateSocket
Socl_CreateSocket: ; 0x022CD338
	stmdb sp!, {r4, lr}
	bl Socli_StartupSocket
	movs r4, r0
	mvneq r0, #0x30
	ldmeqia sp!, {r4, pc}
	ldr r0, _022CD370 ; =Socli_CreateSocketCallBack
	mov r1, r4
	mov r2, #1
	bl Socli_CreateCommandPacket
	mov r1, r0
	mov r0, r4
	bl Socli_ExecCommandPacketInCtrlPipe
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CD370: .word Socli_CreateSocketCallBack
	arm_func_end Socl_CreateSocket

	arm_func_start Socli_CreateSocketCallBack
Socli_CreateSocketCallBack: ; 0x022CD374
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #4]
	mov r0, r4
	bl Cps_SocRegister
	ldrsb r0, [r4, #0x73]
	ldr r1, [r4, #0x68]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022CD3D4
_022CD398: ; jump table
	b _022CD3AC ; case 0
	b _022CD3BC ; case 1
	b _022CD3D0 ; case 2
	b _022CD3D4 ; case 3
	b _022CD3AC ; case 4
_022CD3AC:
	add r0, r1, #0x20
	bl Cps_SocDup
	bl Cps_SocUse
	b _022CD3D4
_022CD3BC:
	bl Cps_SocUse
	bl Cps_SocDatagramMode
	ldr r0, _022CD3E4 ; =Socli_UdpRecvCallback
	bl Cps_SetUdpCallback
	b _022CD3D4
_022CD3D0:
	bl Cps_SocDatagramMode
_022CD3D4:
	mov r0, #1
	strh r0, [r4, #0x70]
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CD3E4: .word Socli_UdpRecvCallback
	arm_func_end Socli_CreateSocketCallBack

	arm_func_start Socli_StartupSocket
Socli_StartupSocket: ; 0x022CD3E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl Socli_GetSizeSocket
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _022CD44C ; =ov00_02318868
	mov r6, r0
	ldr r1, [r1]
	mov r0, r4
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _022CD43C
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	mov r0, r5
	mov r1, r7
	bl Socli_InitSocket
	mov r0, r5
	bl Socli_SocketRegister
_022CD43C:
	mov r0, r6
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CD44C: .word ov00_02318868
	arm_func_end Socli_StartupSocket

	arm_func_start Socli_GetSizeSocket
Socli_GetSizeSocket: ; 0x022CD450
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x80
	cmp r0, #0
	beq _022CD48C
	add r4, r4, #0x114
	bl Socli_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #8]
	bl Socli_RoundUp4
	add r4, r4, r0
	add r0, r5, #0x10
	bl Socli_GetSizeCommandPipe
	add r4, r4, r0
_022CD48C:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _022CD4C8
	add r4, r4, #0x110
	bl Socli_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #0xa]
	bl Socli_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #0xc]
	bl Socli_RoundUp4
	add r4, r4, r0
	add r0, r5, #0x14
	bl Socli_GetSizeCommandPipe
	add r4, r4, r0
_022CD4C8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_GetSizeSocket

	arm_func_start Socli_GetSizeCommandPipe
Socli_GetSizeCommandPipe: ; 0x022CD4D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #2
	bl Socli_RoundUp4
	mov r4, r0
	ldrh r0, [r5]
	bl Socli_RoundUp4
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_GetSizeCommandPipe

	arm_func_start Socli_InitSocket
Socli_InitSocket: ; 0x022CD4F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrsb r1, [r5]
	mov r6, r0
	add r4, r6, #0x80
	strb r1, [r6, #0x73]
	ldrsb r0, [r5, #1]
	strb r0, [r6, #0x72]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _022CD578
	str r4, [r6, #0x64]
	ldrh r2, [r5, #4]
	mov r1, r4
	add r0, r4, #0x114
	strh r2, [r4, #0xfc]
	add r2, r5, #0x10
	mov r7, r4
	bl Socli_InitCommandPipe
	ldrh r2, [r5, #2]
	add r1, r6, #0x3c
	bl Socli_InitSocketBuffer
	ldrh r2, [r5, #8]
	add r1, r6, #0x50
	bl Socli_InitSocketBuffer
	ldrh r3, [r5, #0xe]
	add r1, r7, #0x100
	mov r2, #0
	strh r3, [r1, #0xa]
	str r2, [r7, #0x110]
	mov r4, r0
	str r2, [r7, #0x10c]
_022CD578:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _022CD5D8
	str r4, [r6, #0x68]
	mov r1, r4
	str r6, [r4, #0x10c]
	add r0, r4, #0x110
	add r2, r5, #0x14
	mov r7, r4
	bl Socli_InitCommandPipe
	ldrh r2, [r5, #6]
	add r1, r6, #0x48
	bl Socli_InitSocketBuffer
	ldrh r2, [r5, #0xa]
	add r1, r6, #0x58
	bl Socli_InitSocketBuffer
	ldrh r2, [r5, #0xc]
	add r1, r4, #0xf8
	bl Socli_InitSocketBuffer
	mov r1, #0
	str r1, [r7, #0x108]
	mov r4, r0
	str r1, [r7, #0x104]
	b _022CD5E8
_022CD5D8:
	ldr r0, _022CD5F0 ; =ov00_023268CC
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	str r0, [r6, #0x68]
_022CD5E8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CD5F0: .word ov00_023268CC
	arm_func_end Socli_InitSocket

	arm_func_start Socli_InitSocketBuffer
Socli_InitSocketBuffer: ; 0x022CD5F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #0
	moveq r0, #0
	str r0, [r1, #4]
	mov r0, r2
	str r2, [r1]
	bl Socli_RoundUp4
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end Socli_InitSocketBuffer

	arm_func_start Socli_InitCommandPipe
Socli_InitCommandPipe: ; 0x022CD61C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r0, r5
	mov r6, r1
	bl Socli_GetSizeCommandPipe
	mov r4, r0
	ldrb r2, [r5, #3]
	mov r0, r6
	mov r1, r7
	bl OS_InitMessageQueue
	add r0, r6, #0xe0
	bl OS_InitMutex
	ldrh r2, [r5]
	add r0, r6, #0x20
	ldr r1, _022CD68C ; =Socli_CommandPacketHandler
	str r2, [sp]
	ldrb ip, [r5, #2]
	mov r2, r6
	add r3, r7, r4
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r6, #0x20
	bl OS_WakeupThreadDirect
	add r0, r7, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CD68C: .word Socli_CommandPacketHandler
	arm_func_end Socli_InitCommandPipe

	arm_func_start Socl_Bind
Socl_Bind: ; 0x022CD690
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Socl_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _022CD6C4
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_022CD6C4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #6
	ldmneia sp!, {r3, r4, r5, pc}
	strh r4, [r5, #0x74]
	ldrsb r0, [r5, #0x73]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl Socli_ExecBindCommand
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socl_Bind

	arm_func_start Socl_Connect
Socl_Connect: ; 0x022CD700
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl Socl_SocketIsInvalid
	cmp r0, #0
	bne _022CD728
	ldrsh r0, [r6, #0x70]
	tst r0, #8
	beq _022CD730
_022CD728:
	mvn r0, #0x1b
	ldmia sp!, {r4, r5, r6, pc}
_022CD730:
	cmp r6, #0
	mov r1, #0
	beq _022CD748
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_022CD748:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CD7D4
	ldrsh r0, [r6, #0x70]
	tst r0, #4
	beq _022CD790
	ldrsb r0, [r6, #0x72]
	cmp r0, #1
	mvneq r0, #0x1d
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022CD790:
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	beq _022CD7B4
	ldrsh r0, [r6, #0x70]
	tst r0, #0x40
	ldrne r0, [r6, #0x6c]
	ldreq r0, _022CD7E4 ; =ov00_0231886C
	ldreq r0, [r0]
	ldmia sp!, {r4, r5, r6, pc}
_022CD7B4:
	strh r5, [r6, #0x76]
	mov r0, r6
	str r4, [r6, #0x78]
	bl Socli_ExecBindCommand
	ldrsb r1, [r6, #0x72]
	cmp r1, #1
	mvnne r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
_022CD7D4:
	strh r5, [r6, #0x76]
	str r4, [r6, #0x78]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CD7E4: .word ov00_0231886C
	arm_func_end Socl_Connect

	arm_func_start Socli_ExecBindCommand
Socli_ExecBindCommand: ; 0x022CD7E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r2, [r4, #0x72]
	ldr r0, _022CD83C ; =Socli_BindCallBack
	mov r1, r4
	bl Socli_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	ldrh r2, [r4, #0x74]
	mov r0, r4
	strh r2, [r1, #0x10]
	ldrh r2, [r4, #0x76]
	strh r2, [r1, #0x12]
	ldr r2, [r4, #0x78]
	str r2, [r1, #0x14]
	ldrsh r2, [r4, #0x70]
	orr r2, r2, #2
	strh r2, [r4, #0x70]
	bl Socli_ExecCommandPacketInRecvPipe
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CD83C: .word Socli_BindCallBack
	arm_func_end Socli_ExecBindCommand

	arm_func_start Socli_BindCallBack
Socli_BindCallBack: ; 0x022CD840
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	mov r6, #0
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	bl OS_LockMutex
	ldrh r0, [r7, #0x10]
	ldrh r1, [r7, #0x12]
	ldr r2, [r7, #0x14]
	bl Cps_SocBind
	mov r0, r6
	str r0, [r5, #0xf8]
	ldrsb r0, [r7, #0xc]
	cmp r0, #0
	cmpne r0, #4
	bne _022CD88C
	bl Cps_TcpConnect
	mov r6, r0
_022CD88C:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	cmp r6, #0
	beq _022CD8B0
	ldrsh r1, [r4, #0x70]
	mvn r0, #0x4b
	orr r1, r1, #0x40
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CD8B0:
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #4
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Socli_BindCallBack

	arm_func_start Socl_ReadFrom
Socl_ReadFrom: ; 0x022CD8C4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl Socl_SocketIsInvalid
	cmp r0, #0
	addne sp, sp, #0xc
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x2c]
	tst r0, #4
	bne _022CD908
	ldrsb r0, [sb, #0x72]
	cmp r0, #0
	bne _022CD924
_022CD908:
	ldrsb r0, [sb, #0x73]
	cmp r0, #4
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	b _022CD93C
_022CD924:
	bl GetProcessorMode
	cmp r0, #0x12
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
_022CD93C:
	cmp sb, #0
	mov r1, #0
	beq _022CD954
	ldrsh r0, [sb, #0x70]
	tst r0, #1
	movne r1, #1
_022CD954:
	cmp r1, #0
	addeq sp, sp, #0xc
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldrsb r0, [sb, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CD9A4
	ldrsh r0, [sb, #0x70]
	tst r0, #4
	beq _022CD998
	ldrsh r0, [sb, #0x70]
	tst r0, #8
	beq _022CD9A4
_022CD998:
	add sp, sp, #0xc
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_022CD9A4:
	ldr r4, [sb, #0x64]
	tst r5, #1
	add r0, r4, #0xe0
	bne _022CD9CC
	bl OS_TryLockMutex
	cmp r0, #0
	bne _022CD9D0
	add sp, sp, #0xc
	mvn r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_022CD9CC:
	bl OS_LockMutex
_022CD9D0:
	ldr r0, [sp, #0x28]
	ldr ip, [sp, #0x2c]
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r6
	stmib sp, {r5, ip}
	bl Socli_ReadAndConsumeBuffer
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Socl_ReadFrom

	arm_func_start Socli_ReadAndConsumeBuffer
Socli_ReadAndConsumeBuffer: ; 0x022CDA0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, [sp, #0x28]
	mov r7, r0
	tst r4, #2
	ldr r4, [r7, #0x64]
	cmpne r4, #0
	movne r6, #1
	moveq r6, #0
	cmp r6, #0
	ldrnesb r5, [r4, #0xfe]
	movne r0, #1
	strneb r0, [r4, #0xfe]
	ldrsb r0, [r7, #0x73]
	cmp r0, #1
	bne _022CDA6C
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl Socli_ReadUdpBuffer
	mov r8, r0
	b _022CDA94
_022CDA6C:
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl Socli_ReadBuffer
	movs r8, r0
	bmi _022CDA94
	mov r0, r7
	bl Socli_ConsumeBuffer
_022CDA94:
	cmp r6, #0
	strneb r5, [r4, #0xfe]
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Socli_ReadAndConsumeBuffer

	arm_func_start Socli_ReadBuffer
Socli_ReadBuffer: ; 0x022CDAA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb ip, [r7, #0x73]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #4
	bne _022CDAD8
	ldr r4, [sp, #0x18]
	str r4, [sp]
	bl Socli_ExecReadCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022CDAD8:
	ldr ip, [sp, #0x18]
	str ip, [sp]
	bl Socli_CopyCpsBuffer
	mvn r1, #5
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [sp, #0x1c]
	tst r1, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl Socli_ExecReadCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Socli_ReadBuffer

	arm_func_start Socli_CopyCpsBuffer
Socli_CopyCpsBuffer: ; 0x022CDB1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	add r1, sp, #8
	mov r4, r0
	str r1, [sp]
	add r1, sp, #0xc
	mov r0, sb
	add r2, sp, #6
	add r3, sp, #4
	bl Socli_ReadCpsBuffer
	cmp r0, #0
	beq _022CDBBC
	ldr r5, [sp, #0xc]
	cmp r5, #0
	mvneq r5, #5
	beq _022CDBD8
	ldrsb r1, [sb, #0x73]
	cmp r7, r5
	mov r2, #1
	movgt r7, r5
	cmp r1, #0
	cmpne r1, #4
	movne r2, #0
	cmp r2, #0
	mov r1, r8
	mov r2, r7
	movne r5, r7
	bl MI_CpuCopy8
	ldr r1, [sb, #0x64]
	ldrsb r0, [r1, #0xfe]
	cmp r0, #0
	ldreq r0, [r1, #0xf8]
	addeq r0, r0, r5
	streq r0, [r1, #0xf8]
	b _022CDBD8
_022CDBBC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ldrsh r0, [sb, #0x70]
	moveq r5, #0
	mvnne r5, #0x1b
	bic r0, r0, #6
	strh r0, [sb, #0x70]
_022CDBD8:
	cmp r5, #0
	blt _022CDC10
	cmp r6, #0
	ldrne r1, [sp, #0x30]
	cmpne r1, #0
	beq _022CDC00
	ldrh r0, [sp, #4]
	strh r0, [r6]
	ldr r0, [sp, #8]
	str r0, [r1]
_022CDC00:
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	ldreqh r0, [sp, #6]
	streqh r0, [sb, #0x74]
_022CDC10:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Socli_CopyCpsBuffer

	arm_func_start Socli_ReadCpsBuffer
Socli_ReadCpsBuffer: ; 0x022CDC24
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x64]
	ldr r4, [r0, #0xc4]
	ldr r5, [r0, #0xf8]
	ldr r0, [r4, #0x44]
	subs lr, r0, r5
	bmi _022CDC7C
	ldrh ip, [r4, #0xa]
	ldr r0, [sp, #0x10]
	cmp lr, #0
	strh ip, [r2]
	ldrh r2, [r4, #0x18]
	strh r2, [r3]
	ldr r2, [r4, #0x1c]
	str r2, [r0]
	str lr, [r1]
	bne _022CDC8C
	ldrb r0, [r4, #8]
	cmp r0, #4
	beq _022CDC8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022CDC7C:
	mvn r0, #0
	str r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022CDC8C:
	ldr r0, [r4, #0x40]
	add r0, r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_ReadCpsBuffer

	arm_func_start Socli_ExecReadCommand
Socli_ExecReadCommand: ; 0x022CDC98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _022CDCE0 ; =Socli_ReadCallBack
	mov r1, r7
	mov r2, #1
	mov r4, r3
	bl Socli_CreateCommandPacket
	mov r1, r0
	str r6, [r1, #0x10]
	str r5, [r1, #0x14]
	ldr r2, [sp, #0x18]
	str r4, [r1, #0x18]
	mov r0, r7
	str r2, [r1, #0x1c]
	bl Socli_ExecCommandPacketInRecvPipe
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CDCE0: .word Socli_ReadCallBack
	arm_func_end Socli_ExecReadCommand

	arm_func_start Socli_ReadCallBack
Socli_ReadCallBack: ; 0x022CDCE4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r7, [r0, #4]
	ldr r1, [r0, #0x10]
	ldr r8, [r7, #0x64]
	str r1, [sp, #0xc]
	ldr r1, [r0, #0x18]
	ldr sl, [r0, #0x14]
	ldr r0, [r0, #0x1c]
	ldr sb, [r8, #0xf8]
	str r1, [sp, #8]
	str r0, [sp, #4]
	mov r4, #0
	mov r5, #1
	mov fp, #0xa
	add r6, sp, #0x10
_022CDD24:
	mov r0, r6
	bl Cps_SocRead
	cmp r0, #0
	beq _022CDD78
	ldr r1, [sp, #0x10]
	sub r1, r1, sb
	cmp r1, #0
	bgt _022CDD78
	ldrsb r0, [r7, #0x73]
	mov r1, r5
	cmp r0, #0
	cmpne r0, #4
	movne r1, r4
	cmp r1, #0
	ldrneb r0, [r7, #8]
	cmpne r0, #4
	movne r0, #0
	bne _022CDD78
	mov r0, fp
	bl OS_Sleep
	b _022CDD24
_022CDD78:
	ldrsh r1, [r7, #0x70]
	tst r1, #0x80
	addne sp, sp, #0x14
	mvnne r0, #0xe
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r1, [r7, #0x73]
	cmp r1, #4
	bne _022CDDD4
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #0x10]
	cmp sl, r1
	movhi sl, r1
	ldr r1, [sp, #0xc]
	mov r2, sl
	bl MI_CpuCopy8
	mov r0, sl
	bl Cps_SocConsume
	add sp, sp, #0x14
	mov r0, sl
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022CDDD4:
	cmp r0, #0
	moveq r4, #0
	beq _022CDE00
	ldr r4, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	mov r0, r7
	mov r2, sl
	str r4, [sp]
	bl Socli_CopyCpsBuffer
	mov r4, r0
_022CDE00:
	cmp r4, #0
	addle sp, sp, #0x14
	movle r0, r4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r0, [r8, #0xfc]
	ldr r1, [r8, #0xf8]
	cmp r1, r0
	blt _022CDE28
	mov r0, r7
	bl Socli_ConsumeCpsBuffer
_022CDE28:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Socli_ReadCallBack

	arm_func_start Socli_ConsumeBuffer
Socli_ConsumeBuffer: ; 0x022CDE34
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x64]
	ldrh r0, [r1, #0xfc]
	ldr r1, [r1, #0xf8]
	cmp r1, r0
	movlt r0, #0
	ldmltia sp!, {r4, pc}
	ldr r0, _022CDE7C ; =Socli_ConsumeCallBack
	mov r1, r4
	mov r2, #0
	bl Socli_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl Socli_ExecCommandPacketInRecvPipe
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CDE7C: .word Socli_ConsumeCallBack
	arm_func_end Socli_ConsumeBuffer

	arm_func_start Socli_ConsumeCallBack
Socli_ConsumeCallBack: ; 0x022CDE80
	ldr ip, _022CDE8C ; =Socli_ConsumeCpsBuffer
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022CDE8C: .word Socli_ConsumeCpsBuffer
	arm_func_end Socli_ConsumeCallBack

	arm_func_start Socli_ConsumeCpsBuffer
Socli_ConsumeCpsBuffer: ; 0x022CDE90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x64]
	bl EnableIrqFlag
	ldr r6, [r4, #0xf8]
	mov r5, r0
	cmp r6, #0
	beq _022CDEBC
	mov r1, #0
	mov r0, r6
	str r1, [r4, #0xf8]
	bl Cps_SocConsume
_022CDEBC:
	mov r0, r5
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Socli_ConsumeCpsBuffer

	arm_func_start Socli_ReadUdpBuffer
Socli_ReadUdpBuffer: ; 0x022CDECC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r6, [sl, #0x64]
	str r1, [sp]
	ldr r0, [r6, #0x104]
	str r2, [sp, #4]
	mov fp, r3
	bl EnableIrqFlag
	ldr r7, [r6, #0x104]
	str r0, [sp, #8]
	cmp r7, #0
	bne _022CDF68
	ldr r0, [sp, #0x34]
	mov r4, #1
	and sb, r0, #1
	mov r5, #0
_022CDF10:
	cmp sb, #0
	mvneq r8, #5
	beq _022CDF68
	add r0, r6, #0x10c
	bl OS_SleepThread
	mov r0, sl
	bl Socl_SocketIsInvalid
	cmp r0, #0
	bne _022CDF54
	mov r1, r5
	cmp sl, #0
	beq _022CDF4C
	ldrsh r0, [sl, #0x70]
	tst r0, #1
	movne r1, r4
_022CDF4C:
	cmp r1, #0
	bne _022CDF5C
_022CDF54:
	mvn r8, #0x37
	b _022CDF68
_022CDF5C:
	ldr r7, [r6, #0x104]
	cmp r7, #0
	beq _022CDF10
_022CDF68:
	cmp r7, #0
	beq _022CDFF8
	ldrh r1, [r7, #4]
	ldr r0, [sp, #4]
	cmp r0, r1
	strgt r1, [sp, #4]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r7, #0xc
	bl MI_CpuCopy8
	cmp fp, #0
	ldrneh r0, [r7, #6]
	ldr r1, [sp, #0x30]
	strneh r0, [fp]
	cmp r1, #0
	ldrne r0, [r7, #8]
	strne r0, [r1]
	ldrsb r0, [r6, #0xfe]
	ldrh r8, [r7, #4]
	cmp r0, #0
	bne _022CDFF8
	ldr r0, [r7]
	ldr r1, _022CE00C ; =ov00_02318868
	str r0, [r6, #0x104]
	ldr r0, [r7]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r6, #0x100]
	ldr r1, [r1]
	mov r0, r7
	ldr r1, [r1, #0x1c]
	blx r1
	add r0, r6, #0x100
	ldrh r1, [r0, #8]
	sub r1, r1, r8
	strh r1, [r0, #8]
_022CDFF8:
	ldr r0, [sp, #8]
	bl SetIrqFlag
	mov r0, r8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CE00C: .word ov00_02318868
	arm_func_end Socli_ReadUdpBuffer

	arm_func_start Socli_UdpRecvCallback
Socli_UdpRecvCallback: ; 0x022CE010
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	ldr r4, [r7, #0x64]
	mov sb, r0
	mov r8, r1
	bl EnableIrqFlag
	add r1, r4, #0x100
	ldrh r2, [r1, #8]
	ldrh r1, [r1, #0xa]
	mov r6, r0
	add r0, r2, r8
	cmp r1, r0
	blo _022CE0D4
	ldr r1, _022CE11C ; =ov00_02318868
	add r0, r8, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _022CE0C0
	add r1, r4, #0x100
	ldrh r3, [r1, #8]
	mov r2, #0
	mov r0, sb
	add r3, r3, r8
	strh r3, [r1, #8]
	str r2, [r5]
	strh r8, [r5, #4]
	ldrh r3, [r7, #0x18]
	mov r2, r8
	add r1, r5, #0xc
	strh r3, [r5, #6]
	ldr r3, [r7, #0x1c]
	str r3, [r5, #8]
	bl MI_CpuCopy8
	ldr r0, [r4, #0x100]
	cmp r0, #0
	ldrne r0, [r4, #0x100]
	strne r5, [r0]
	str r5, [r4, #0x100]
	ldr r0, [r4, #0x104]
	cmp r0, #0
	streq r5, [r4, #0x104]
	b _022CE0E4
_022CE0C0:
	ldr r0, _022CE120 ; =ov00_02326924
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	b _022CE0E4
_022CE0D4:
	ldr r0, _022CE120 ; =ov00_02326924
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
_022CE0E4:
	ldrh r0, [r7, #0x74]
	cmp r0, #0
	ldreqh r0, [r7, #0xa]
	streqh r0, [r7, #0x74]
	ldrh r1, [r7, #0x1a]
	add r0, r4, #0x10c
	strh r1, [r7, #0x18]
	ldr r1, [r7, #0x20]
	str r1, [r7, #0x1c]
	bl OS_WakeupThread
	mov r0, r6
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022CE11C: .word ov00_02318868
_022CE120: .word ov00_02326924
	arm_func_end Socli_UdpRecvCallback

	arm_func_start Socl_WriteTo
Socl_WriteTo: ; 0x022CE124
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl Socl_SocketIsInvalid
	cmp r0, #0
	addne sp, sp, #8
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	mov r1, #0
	beq _022CE168
	ldrsh r0, [r8, #0x70]
	tst r0, #1
	movne r1, #1
_022CE168:
	cmp r1, #0
	addeq sp, sp, #8
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsb r0, [r8, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CE1B8
	ldrsh r0, [r8, #0x70]
	tst r0, #4
	beq _022CE1AC
	ldrsh r0, [r8, #0x70]
	tst r0, #8
	beq _022CE1B8
_022CE1AC:
	add sp, sp, #8
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022CE1B8:
	ldr r0, [sp, #0x24]
	ldr r4, [r8, #0x68]
	tst r0, #4
	bne _022CE1D4
	ldrsb r0, [r8, #0x72]
	cmp r0, #0
	bne _022CE1F4
_022CE1D4:
	add r0, r4, #0xe0
	bl OS_TryLockMutex
	cmp r0, #0
	addeq sp, sp, #8
	mvneq r0, #5
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, #0
	b _022CE200
_022CE1F4:
	add r0, r4, #0xe0
	bl OS_LockMutex
	mov ip, #1
_022CE200:
	ldr r1, [sp, #0x20]
	mov r0, r8
	str r1, [sp]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str ip, [sp, #4]
	bl Socli_WriteBuffer
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Socl_WriteTo

	arm_func_start Socli_WriteBuffer
Socli_WriteBuffer: ; 0x022CE238
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r4, [sl, #0x68]
	ldrsb r0, [sl, #0x73]
	ldr r4, [r4, #0x10c]
	mov sb, r1
	str r3, [sp, #0xc]
	cmp r0, #1
	mov r8, r2
	ldr r7, [sp, #0x40]
	ldr r6, [sp, #0x44]
	ldr r0, [r4, #0x48]
	mov r5, #0
	bne _022CE290
	sub r0, r0, #0x2a
	cmp r8, r0
	addgt sp, sp, #0x18
	subgt r0, r5, #0x23
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r8, [sp, #0x10]
	b _022CE2A0
_022CE290:
	sub r0, r0, #0x36
	str r0, [sp, #0x10]
	cmp r8, r0
	strle r8, [sp, #0x10]
_022CE2A0:
	cmp r8, #0
	ble _022CE330
	and fp, r6, #1
_022CE2AC:
	ldr r2, [sp, #0x10]
	mov r0, sl
	mov r1, r8
	add r3, sp, #0x14
	str r6, [sp]
	bl Socli_AllocWriteBuffer
	mov r4, r0
	cmp r4, #0
	ble _022CE30C
	ldr r0, [sp, #0xc]
	mov r1, sb
	stmia sp, {r0, r7}
	str r6, [sp, #8]
	ldr r3, [sp, #0x14]
	mov r0, sl
	mov r2, r4
	bl Socli_ExecWriteCommand
	cmp r0, #0
	addle sp, sp, #0x18
	mvnle r0, #5
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sb, sb, r4
	sub r8, r8, r4
	add r5, r5, r4
_022CE30C:
	cmp fp, #0
	bne _022CE328
	cmp r4, #0
	bgt _022CE330
	add sp, sp, #0x18
	mvn r0, #5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022CE328:
	cmp r8, #0
	bgt _022CE2AC
_022CE330:
	mov r0, r5
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Socli_WriteBuffer

	arm_func_start Socli_AllocWriteBuffer
Socli_AllocWriteBuffer: ; 0x022CE33C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	cmp r8, sb
	mov r7, r3
	ldr r4, [sl, #0x68]
	movgt r8, sb
	bl EnableIrqFlag
	ldr r1, [sp, #0x28]
	mov fp, r0
	and r6, r1, #1
_022CE36C:
	mov r0, sl
	bl Socli_GetWriteBufferFreeSize
	mov r5, r0
	cmp r5, r8
	blt _022CE398
	add r0, r4, #0x100
	ldrh r0, [r0]
	cmp r5, sb
	movge r5, sb
	str r0, [r7]
	b _022CE3B0
_022CE398:
	cmp r6, #0
	moveq r5, #0
	beq _022CE3B0
	add r0, r4, #0x104
	bl OS_SleepThread
	b _022CE36C
_022CE3B0:
	mov r0, fp
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Socli_AllocWriteBuffer

	arm_func_start Socli_GetWriteBufferFreeSize
Socli_GetWriteBufferFreeSize: ; 0x022CE3C0
	ldr r2, [r0, #0x68]
	add r0, r2, #0x100
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	ldr r2, [r2, #0xf8]
	sub r0, r0, r1
	subs r0, r0, #1
	addmi r0, r0, r2
	bx lr
	arm_func_end Socli_GetWriteBufferFreeSize

	arm_func_start Socli_ExecWriteCommand
Socli_ExecWriteCommand: ; 0x022CE3E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0x68]
	mov r6, r1
	mov r8, r2
	ldr r1, [r4, #0x10c]
	ldr r2, [sp, #0x28]
	ldr r0, _022CE554 ; =Socli_WriteCallBack
	mov r7, r3
	bl Socli_CreateCommandPacket
	movs r5, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x28]
	add r1, r7, r8
	tst r0, #1
	ldrnesb r0, [sb, #0x73]
	cmpne r0, #1
	movne r0, #3
	strneb r0, [r5, #0xd]
	moveq r0, #0
	streqb r0, [r5, #0xd]
	ldr r3, [r4, #0xfc]
	ldr r2, [r4, #0xf8]
	add r0, r3, r7
	cmp r1, r2
	str r0, [r5, #0x10]
	bge _022CE46C
	str r8, [r5, #0x14]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r7, r1
	str r0, [r5, #0x1c]
	b _022CE498
_022CE46C:
	sub r0, r2, r7
	str r0, [r5, #0x14]
	str r3, [r5, #0x18]
	ldr r0, [r5, #0x14]
	sub r7, r8, r0
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	mov r2, r7
	add r0, r6, r0
	bl MI_CpuCopy8
_022CE498:
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	mov r0, r6
	bl MI_CpuCopy8
	add r0, r4, #0x100
	ldrh r6, [r0]
	strh r7, [r5, #0x20]
	ldrh r1, [r5, #0x20]
	strh r1, [r0]
	ldrsb r0, [sb, #0x73]
	cmp r0, #1
	bne _022CE528
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	bne _022CE4E4
	bl Cps_SocGetEport
	strh r0, [sb, #0x74]
	ldrh r0, [sb, #0x74]
	strh r0, [sb, #0xa]
_022CE4E4:
	ldrh r0, [sb, #0x74]
	strh r0, [r5, #0x24]
	ldr r1, [sb, #0x78]
	cmp r1, #0
	beq _022CE504
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022CE518
_022CE504:
	ldr r1, [sp, #0x24]
	ldrh r0, [sp, #0x20]
	str r1, [r5, #0x28]
	strh r0, [r5, #0x26]
	b _022CE530
_022CE518:
	str r1, [r5, #0x28]
	ldrh r0, [sb, #0x76]
	strh r0, [r5, #0x26]
	b _022CE530
_022CE528:
	mov r0, #0
	str r0, [r5, #0x28]
_022CE530:
	ldr r0, [r4, #0x10c]
	mov r1, r5
	bl Socli_ExecCommandPacketInSendPipe
	cmp r0, #0
	addne r0, r4, #0x100
	movne r8, #0
	strneh r6, [r0]
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022CE554: .word Socli_WriteCallBack
	arm_func_end Socli_ExecWriteCommand

	arm_func_start Socli_WriteCallBack
Socli_WriteCallBack: ; 0x022CE558
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r0
	ldr r5, [sb, #4]
	mov r7, #0
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	ldr r6, [r5, #0x68]
	cmp r0, #0
	cmpne r0, #4
	movne r1, r7
	cmp r1, #0
	beq _022CE594
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _022CE668
_022CE594:
	ldr r2, [sb, #0x28]
	cmp r2, #0
	beq _022CE5AC
	ldrh r0, [sb, #0x24]
	ldrh r1, [sb, #0x26]
	bl Cps_SocBind
_022CE5AC:
	ldrsb r1, [r5, #0x73]
	mov r0, #1
	ldr r4, [r5, #0x4c]
	cmp r1, #0
	cmpne r1, #4
	movne r0, #0
	cmp r0, #0
	movne r8, #0x36
	moveq r8, #0x2a
	cmp r1, #0
	cmpne r1, #4
	ldrne r0, [r5, #0x48]
	subne sl, r0, r8
	bne _022CE5F4
	ldr r0, [r5, #0x48]
	sub r0, r0, r8
	bl Socli_GetOptimumSendBufLen
	mov sl, r0
_022CE5F4:
	mov r1, sl
	mov r2, sb
	add r0, r4, r8
	bl Socli_MemCpy
	mov r1, r0
	cmp r1, #0
	ble _022CE66C
	add r0, r4, r8
	bl Cps_SocWrite
	cmp r0, #0
	bgt _022CE660
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CE658
	ldrsh r0, [r5, #0x70]
	bic r0, r0, #0xe
	strh r0, [r5, #0x70]
	ldrsh r0, [r5, #0x70]
	orr r0, r0, #0x80
	strh r0, [r5, #0x70]
	bl Cps_TcpClose
_022CE658:
	mvn r7, #0x4b
	b _022CE66C
_022CE660:
	add r7, r7, r0
	b _022CE5F4
_022CE668:
	mvn r7, #0x4b
_022CE66C:
	ldrh r2, [sb, #0x20]
	add r1, r6, #0x100
	add r0, r6, #0x104
	strh r2, [r1, #2]
	bl OS_WakeupThread
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end Socli_WriteCallBack

	arm_func_start Socli_GetOptimumSendBufLen
Socli_GetOptimumSendBufLen: ; 0x022CE688
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022CE724 ; =OSi_ThreadInfo
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r5, [r0, #0xa4]
	bl EnableIrqFlag
	cmp r5, #0
	beq _022CE6EC
	ldrh r3, [r5, #0x2e]
	cmp r3, #0
	ldrneh r2, [r5, #0x2c]
	cmpne r2, #0
	beq _022CE6DC
	ldr r1, _022CE728 ; =ov00_023268D0
	cmp r3, r2
	ldr r1, [r1, #0x24]
	movgt r3, r2
	cmp r3, r1
	movgt r3, r1
	mov r5, r3, lsl #1
	b _022CE6F8
_022CE6DC:
	ldr r1, _022CE728 ; =ov00_023268D0
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
	b _022CE6F8
_022CE6EC:
	ldr r1, _022CE728 ; =ov00_023268D0
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
_022CE6F8:
	bl SetIrqFlag
	cmp r5, #0
	ble _022CE71C
	mov r0, r4
	mov r1, r5
	bl _s32_div_f
	cmp r0, #0
	mulgt r0, r5, r0
	ldmgtia sp!, {r3, r4, r5, pc}
_022CE71C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CE724: .word OSi_ThreadInfo
_022CE728: .word ov00_023268D0
	arm_func_end Socli_GetOptimumSendBufLen

	arm_func_start Socli_MemCpy
Socli_MemCpy: ; 0x022CE72C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r4, [r6, #0x14]
	ldr r5, [r6, #0x1c]
	cmp r4, r1
	mov r7, r0
	movgt r4, r1
	movgt r5, #0
	bgt _022CE75C
	sub r0, r1, r4
	cmp r5, r0
	movgt r5, r0
_022CE75C:
	cmp r4, #0
	ble _022CE78C
	ldr r0, [r6, #0x10]
	mov r1, r7
	mov r2, r4
	bl MI_CpuCopy8
	ldr r0, [r6, #0x10]
	add r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, [r6, #0x14]
	sub r0, r0, r4
	str r0, [r6, #0x14]
_022CE78C:
	cmp r5, #0
	ble _022CE7BC
	ldr r0, [r6, #0x18]
	mov r2, r5
	add r1, r7, r4
	bl MI_CpuCopy8
	ldr r0, [r6, #0x18]
	add r0, r0, r5
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x1c]
	sub r0, r0, r5
	str r0, [r6, #0x1c]
_022CE7BC:
	add r0, r4, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Socli_MemCpy

	arm_func_start Socl_Shutdown
Socl_Shutdown: ; 0x022CE7C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl Socl_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	mov r1, #0
	beq _022CE7F4
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_022CE7F4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #4
	beq _022CE818
	ldrsh r0, [r4, #0x70]
	tst r0, #8
	beq _022CE820
_022CE818:
	mvn r0, #0x37
	ldmia sp!, {r3, r4, r5, pc}
_022CE820:
	ldrsh r0, [r4, #0x70]
	orr r0, r0, #8
	strh r0, [r4, #0x70]
	ldr r5, [r4, #0x68]
	cmp r5, #0
	ldrne r1, [r5, #0x10c]
	cmpne r1, #0
	beq _022CE864
	ldrsb r2, [r4, #0x72]
	ldr r0, _022CE86C ; =Socli_ShutdownCallBack
	bl Socli_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x10c]
	bl Socli_ExecCommandPacketInSendPipe
	ldmia sp!, {r3, r4, r5, pc}
_022CE864:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CE86C: .word Socli_ShutdownCallBack
	arm_func_end Socl_Shutdown

	arm_func_start Socli_ShutdownCallBack
Socli_ShutdownCallBack: ; 0x022CE870
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #4]
	mov r1, #1
	ldrsb r0, [r0, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CE898
	bl Cps_TcpShutdown
_022CE898:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Socli_ShutdownCallBack

	arm_func_start Socl_IsClosed
Socl_IsClosed: ; 0x022CE8A0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bmi _022CE8CC
	bl Socl_SocketIsInvalid
	cmp r0, #0
	beq _022CE8CC
	mov r0, r4
	bl Socl_SocketIsInTrash
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_022CE8CC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end Socl_IsClosed

	arm_func_start close
close: ; 0x022CE8D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0
	mvnle r0, #0x1b
	ldmleia sp!, {r4, pc}
	bl Socl_SocketIsInTrash
	cmp r0, #0
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl Socl_SocketIsInvalid
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	mov r1, #0
	beq _022CE924
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_022CE924:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #0x10
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	mov r1, #1
	orr r0, r0, #0x18
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CE974
	ldr r0, [r4, #0x68]
	mov r1, #0
	bl Socli_SendCommandPacket
_022CE974:
	ldr r0, _022CE9A0 ; =Socli_CloseCallBack
	mov r1, r4
	mov r2, #1
	bl Socli_CreateCommandPacket
	mov r1, r0
	mov r2, #0
	mov r0, r4
	str r2, [r1, #8]
	bl Socli_SendCommandPacketToCtrlPipe
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CE9A0: .word Socli_CloseCallBack
	arm_func_end close

	arm_func_start Socli_CloseCallBack
Socli_CloseCallBack: ; 0x022CE9A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #4]
	mov r1, #1
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CE9E0
	ldr r0, [r4, #0x68]
	add r0, r0, #0x20
	bl OS_JoinThread
	bl Cps_TcpShutdown
	bl Cps_TcpClose
	bl Cps_SocRelease
_022CE9E0:
	bl Cps_SocUnRegister
	ldrsh r0, [r4, #0x70]
	mov r1, #0
	bic r0, r0, #6
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #2
	ldreq r0, [r4, #0x68]
	ldrne r0, [r4, #0x64]
	bl Socli_SendCommandPacket
	bl EnableIrqFlag
	mov r5, r0
	mov r0, r4
	bl Socli_SocketUnregister
	mov r0, r4
	bl Socli_SocketRegisterTrash
	mov r0, r5
	bl SetIrqFlag
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #0x20
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socli_CloseCallBack

	arm_func_start Socli_CleanupSocket
Socli_CleanupSocket: ; 0x022CEA3C
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	strh r0, [r4, #0x70]
	ldrsb r2, [r4, #0x73]
	mov r1, #1
	cmp r2, #0
	cmpne r2, #4
	movne r1, r0
	cmp r1, #0
	beq _022CEA80
	ldr r0, [r4, #0x68]
	bl Socli_FreeCommandPipe
	ldr r0, [r4, #0x64]
	bl Socli_FreeCommandPipe
	b _022CEB00
_022CEA80:
	cmp r2, #1
	bne _022CEAF0
	ldr r0, [r4, #0x64]
	ldr r0, [r0, #0x104]
	cmp r0, #0
	beq _022CEAB8
	ldr r5, _022CEB38 ; =ov00_02318868
_022CEA9C:
	ldr r1, [r5]
	ldr r6, [r0]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r6
	cmp r6, #0
	bne _022CEA9C
_022CEAB8:
	ldr r0, [r4, #0x64]
	mov r1, #0
	add r0, r0, #0x100
	strh r1, [r0, #8]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x100]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x104]
	ldr r0, [r4, #0x64]
	add r0, r0, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x64]
	bl Socli_FreeCommandPipe
	b _022CEB00
_022CEAF0:
	cmp r2, #2
	bne _022CEB00
	ldr r0, [r4, #0x68]
	bl Socli_FreeCommandPipe
_022CEB00:
	bl EnableIrqFlag
	mov r5, r0
	mov r0, r4
	bl Socli_SocketUnregister
	mov r0, r4
	bl Socli_SocketUnregisterTrash
	ldr r1, _022CEB38 ; =ov00_02318868
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CEB38: .word ov00_02318868
	arm_func_end Socli_CleanupSocket

	arm_func_start Socli_FreeCommandPipe
Socli_FreeCommandPipe: ; 0x022CEB3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs sb, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, sb, #0x20
	bl OS_JoinThread
	bl EnableIrqFlag
	mov r8, r0
	bl OS_DisableScheduler
	add r1, sp, #0
	mov r0, sb
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	beq _022CEBC8
	mov r6, #0
	mvn r7, #0xa
	add r5, sp, #0
	mov r4, r6
_022CEB84:
	ldr r0, [sp]
	cmp r0, #0
	beq _022CEBB0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022CEBA8
	mov r1, r7
	mov r2, r6
	bl OS_SendMessage
_022CEBA8:
	ldr r0, [sp]
	bl Socli_FreeCommandPacket
_022CEBB0:
	mov r0, sb
	mov r1, r5
	mov r2, r4
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _022CEB84
_022CEBC8:
	bl OS_EnableScheduler
	bl sub_02079990
	mov r0, r8
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Socli_FreeCommandPipe

	arm_func_start Socli_TrashSocket
Socli_TrashSocket: ; 0x022CEBDC
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	ldr r4, _022CEC14 ; =ov00_02326930
	mov r5, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _022CEC08
_022CEBF8:
	bl Socli_CleanupSocket
	ldr r0, [r4]
	cmp r0, #0
	bne _022CEBF8
_022CEC08:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CEC14: .word ov00_02326930
	arm_func_end Socli_TrashSocket

	arm_func_start Soc_Cleanup
Soc_Cleanup: ; 0x022CEC18
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022CECAC ; =ov00_023268C4
	ldr r0, [r1]
	cmp r0, #0
	ldreq r0, _022CECB0 ; =ov00_023250C8
	ldreq r0, [r0]
	streq r0, [r1]
	bl Socl_CalmDown
	mvn r4, #0x19
	cmp r0, r4
	bne _022CEC5C
	mov r5, #0x64
_022CEC48:
	mov r0, r5
	bl OS_Sleep
	bl Socl_CalmDown
	cmp r0, r4
	beq _022CEC48
_022CEC5C:
	bl Socli_CleanupCommandPacketQueue
	movs r4, r0
	bmi _022CECA4
	bl Cps_Cleanup
	mov r0, #0
	bl Cps_SetScavengerCallback
	ldr r0, _022CECB4 ; =ov00_02318868
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #0
	bne _022CEC98
	ldr r0, _022CECB8 ; =ov00_023268D0
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x1c]
	blx r1
_022CEC98:
	ldr r0, _022CECB4 ; =ov00_02318868
	mov r1, #0
	str r1, [r0]
_022CECA4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CECAC: .word ov00_023268C4
_022CECB0: .word ov00_023250C8
_022CECB4: .word ov00_02318868
_022CECB8: .word ov00_023268D0
	arm_func_end Soc_Cleanup

	arm_func_start Socl_CloseAll
Socl_CloseAll: ; 0x022CECBC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022CED58 ; =ov00_023268CC
	ldr r5, _022CED5C ; =ov00_0232692C
_022CECC8:
	bl EnableIrqFlag
	ldr r6, [r5]
	cmp r6, #0
	beq _022CECFC
	ldr r2, [r4]
_022CECDC:
	cmp r6, r2
	beq _022CECF0
	ldrsh r1, [r6, #0x70]
	tst r1, #0x10
	beq _022CECFC
_022CECF0:
	ldr r6, [r6, #0x7c]
	cmp r6, #0
	bne _022CECDC
_022CECFC:
	bl SetIrqFlag
	cmp r6, #0
	beq _022CED14
	mov r0, r6
	bl close
	b _022CECC8
_022CED14:
	ldr r0, _022CED5C ; =ov00_0232692C
	ldr r1, [r0]
	cmp r1, #0
	beq _022CED3C
	ldr r0, _022CED58 ; =ov00_023268CC
	ldr r0, [r0]
	cmp r1, r0
	ldreq r0, [r1, #0x7c]
	cmpeq r0, #0
	bne _022CED50
_022CED3C:
	ldr r0, _022CED60 ; =ov00_02326930
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_022CED50:
	mvn r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CED58: .word ov00_023268CC
_022CED5C: .word ov00_0232692C
_022CED60: .word ov00_02326930
	arm_func_end Socl_CloseAll

	arm_func_start Socl_CalmDown
Socl_CalmDown: ; 0x022CED64
	stmdb sp!, {r4, lr}
	ldr r0, _022CEDDC ; =ov00_023268CC
	ldr r0, [r0]
	cmp r0, #0
	beq _022CEDB8
	bl Socl_CloseAll
	movs r4, r0
	bne _022CEDB0
	ldr r0, _022CEDDC ; =ov00_023268CC
	ldr r0, [r0]
	bl close
	ldr r0, _022CEDDC ; =ov00_023268CC
	ldr r0, [r0]
	bl Socl_IsClosed
	cmp r0, #0
	ldrne r0, _022CEDDC ; =ov00_023268CC
	movne r1, #0
	strne r1, [r0]
	mvn r4, #0x19
_022CEDB0:
	bl Socli_TrashSocket
	b _022CEDD4
_022CEDB8:
	bl Cps_CalmDown
	cmp r0, #0
	mvneq r4, #0x19
	beq _022CEDD4
	mov r0, #0
	bl Wcm_SetRecvDcfCallback
	mov r4, #0
_022CEDD4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CEDDC: .word ov00_023268CC
	arm_func_end Socl_CalmDown

	arm_func_start Socl_Resolve
Socl_Resolve: ; 0x022CEDE0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x64
	movs r5, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, _022CEE84 ; =ov00_02318868
	mov r0, #0xfd0
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r4, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x64
	bl MI_CpuFill8
	add r0, r4, #0x368
	add r2, r0, #0x800
	ldr r3, _022CEE88 ; =0x00000B68
	ldr r1, _022CEE8C ; =0x00000466
	add r0, sp, #0
	str r4, [sp, #0x40]
	str r3, [sp, #0x3c]
	str r2, [sp, #0x4c]
	str r1, [sp, #0x48]
	bl Cps_SocRegister
	mov r0, r5
	bl Cps_Resolve
	mov r5, r0
	bl Cps_SocUnRegister
	ldr r1, _022CEE84 ; =ov00_02318868
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022CEE84: .word ov00_02318868
_022CEE88: .word 0x00000B68
_022CEE8C: .word 0x00000466
	arm_func_end Socl_Resolve

	arm_func_start Socl_InetAtoH
Socl_InetAtoH: ; 0x022CEE90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _022CEED8 ; =ov00_023250D8
	mov r5, r0
	ldmia r1, {r6, r7}
	mov r2, #0
	str r2, [r1]
	mov r0, r4
	str r2, [r1, #4]
	bl Cps_Resolve
	ldr r1, _022CEED8 ; =ov00_023250D8
	mov r4, r0
	mov r0, r5
	stmia r1, {r6, r7}
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022CEED8: .word ov00_023250D8
	arm_func_end Socl_InetAtoH

	arm_func_start Socl_SetResolver
Socl_SetResolver: ; 0x022CEEDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Socl_GetHostID
	cmp r0, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022CEF0C ; =ov00_023250D8
	mov r0, #0
	str r5, [r1]
	str r4, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CEF0C: .word ov00_023250D8
	arm_func_end Socl_SetResolver

	arm_func_start Socl_GetHostID
Socl_GetHostID: ; 0x022CEF10
	stmdb sp!, {r3, lr}
	ldr r0, _022CEF6C ; =ov00_023250C8
	ldr r2, [r0]
	cmp r2, #0
	bne _022CEF50
	ldr r0, _022CEF70 ; =ov00_023268C8
	ldr r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _022CEF60
	bl GetProcessorMode
	cmp r0, #0x12
	beq _022CEF60
	mov r0, #0xa
	bl OS_Sleep
	b _022CEF60
_022CEF50:
	ldr r0, _022CEF74 ; =ov00_023268C4
	ldr r1, [r0]
	cmp r1, #0
	streq r2, [r0]
_022CEF60:
	ldr r0, _022CEF6C ; =ov00_023250C8
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CEF6C: .word ov00_023250C8
_022CEF70: .word ov00_023268C8
_022CEF74: .word ov00_023268C4
	arm_func_end Socl_GetHostID

	arm_func_start Socl_GetStatus
Socl_GetStatus: ; 0x022CEF78
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r0
	bl Socl_SocketIsInvalid
	cmp r0, #0
	orrne r4, r4, #0x80
	bne _022CF040
	ldrsh r0, [r5, #0x70]
	tst r0, #0x40
	ldrsb r0, [r5, #0x73]
	orrne r4, r4, #0x20
	cmp r0, #1
	beq _022CEFB8
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _022CEFE8
_022CEFB8:
	bl EnableIrqFlag
	mov r6, r0
	mov r0, r5
	bl Socli_GetReadBufferOccpiedSize
	cmp r0, #0
	mov r0, r5
	orrgt r4, r4, #1
	bl Socli_GetWriteBufferFreeSize
	cmp r0, #0
	mov r0, r6
	orrgt r4, r4, #8
	bl SetIrqFlag
_022CEFE8:
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _022CF040
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	ldrneb r0, [r5, #8]
	cmpne r0, #4
	beq _022CF028
	tst r4, #1
	ldreqsh r0, [r5, #0x70]
	biceq r0, r0, #6
	streqh r0, [r5, #0x70]
_022CF028:
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	bne _022CF040
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	orreq r4, r4, #0x40
_022CF040:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Socl_GetStatus

	arm_func_start Socli_GetReadBufferOccpiedSize
Socli_GetReadBufferOccpiedSize: ; 0x022CF048
	ldr r2, [r0, #0x64]
	mov r3, #0
	cmp r2, #0
	beq _022CF088
	ldrsb r1, [r0, #0x73]
	cmp r1, #1
	bne _022CF074
	ldr r0, [r2, #0x104]
	cmp r0, #0
	ldrneh r3, [r0, #4]
	b _022CF088
_022CF074:
	cmp r1, #0
	cmpne r1, #4
	ldreq r1, [r0, #0x44]
	ldreq r0, [r2, #0xf8]
	subeq r3, r1, r0
_022CF088:
	mov r0, r3
	bx lr
	arm_func_end Socli_GetReadBufferOccpiedSize

	arm_func_start Socli_RoundUp4
Socli_RoundUp4: ; 0x022CF090
	add r0, r0, #3
	bic r0, r0, #3
	bx lr
	arm_func_end Socli_RoundUp4

	arm_func_start Socli_SocketRegister
Socli_SocketRegister: ; 0x022CF09C
	ldr ip, _022CF0AC ; =Socli_SocketRegisterList
	mov r1, r0
	ldr r0, _022CF0B0 ; =ov00_0232692C
	bx ip
	.align 2, 0
_022CF0AC: .word Socli_SocketRegisterList
_022CF0B0: .word ov00_0232692C
	arm_func_end Socli_SocketRegister

	arm_func_start Socli_SocketRegisterList
Socli_SocketRegisterList: ; 0x022CF0B4
	ldr r2, [r0]
	str r2, [r1, #0x7c]
	str r1, [r0]
	bx lr
	arm_func_end Socli_SocketRegisterList

	arm_func_start Socli_SocketRegisterTrash
Socli_SocketRegisterTrash: ; 0x022CF0C4
	ldr ip, _022CF0D4 ; =Socli_SocketRegisterList
	mov r1, r0
	ldr r0, _022CF0D8 ; =ov00_02326930
	bx ip
	.align 2, 0
_022CF0D4: .word Socli_SocketRegisterList
_022CF0D8: .word ov00_02326930
	arm_func_end Socli_SocketRegisterTrash

	arm_func_start Socli_SocketUnregister
Socli_SocketUnregister: ; 0x022CF0DC
	ldr ip, _022CF0EC ; =Socli_SocketUnregisterList
	mov r1, r0
	ldr r0, _022CF0F0 ; =ov00_0232692C
	bx ip
	.align 2, 0
_022CF0EC: .word Socli_SocketUnregisterList
_022CF0F0: .word ov00_0232692C
	arm_func_end Socli_SocketUnregister

	arm_func_start Socli_SocketUnregisterList
Socli_SocketUnregisterList: ; 0x022CF0F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Socli_SocketGetNextPtr
	cmp r0, #0
	ldrne r1, [r4, #0x7c]
	strne r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end Socli_SocketUnregisterList

	arm_func_start Socli_SocketGetNextPtr
Socli_SocketGetNextPtr: ; 0x022CF110
	ldr r2, [r0]
	cmp r2, #0
	beq _022CF134
_022CF11C:
	cmp r2, r1
	bxeq lr
	add r0, r2, #0x7c
	ldr r2, [r2, #0x7c]
	cmp r2, #0
	bne _022CF11C
_022CF134:
	mov r0, #0
	bx lr
	arm_func_end Socli_SocketGetNextPtr

	arm_func_start Socli_SocketUnregisterTrash
Socli_SocketUnregisterTrash: ; 0x022CF13C
	ldr ip, _022CF14C ; =Socli_SocketUnregisterList
	mov r1, r0
	ldr r0, _022CF150 ; =ov00_02326930
	bx ip
	.align 2, 0
_022CF14C: .word Socli_SocketUnregisterList
_022CF150: .word ov00_02326930
	arm_func_end Socli_SocketUnregisterTrash

	arm_func_start Socl_SocketIsInvalid
Socl_SocketIsInvalid: ; 0x022CF154
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0
	ble _022CF174
	ldr r0, _022CF184 ; =ov00_0232692C
	bl Socli_SocketGetNextPtr
	cmp r0, #0
	bne _022CF17C
_022CF174:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022CF17C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CF184: .word ov00_0232692C
	arm_func_end Socl_SocketIsInvalid

	arm_func_start Socl_SocketIsInTrash
Socl_SocketIsInTrash: ; 0x022CF188
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _022CF1A8 ; =ov00_02326930
	bl Socli_SocketGetNextPtr
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CF1A8: .word ov00_02326930
	arm_func_end Socl_SocketIsInTrash

	arm_func_start socket
socket: ; 0x022CF1AC
	stmdb sp!, {r3, lr}
	cmp r1, #1
	bne _022CF1C4
	ldr r0, _022CF1D0 ; =ov00_02318888
	bl Socl_CreateSocket
	ldmia sp!, {r3, pc}
_022CF1C4:
	ldr r0, _022CF1D4 ; =ov00_02318870
	bl Socl_CreateSocket
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CF1D0: .word ov00_02318888
_022CF1D4: .word ov00_02318870
	arm_func_end socket

	arm_func_start bind
bind: ; 0x022CF1D8
	ldrh r1, [r1, #2]
	ldr ip, _022CF200 ; =Socl_Bind
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_022CF200: .word Socl_Bind
	arm_func_end bind

	arm_func_start connect
connect: ; 0x022CF204
	stmdb sp!, {r4, lr}
	ldrh r2, [r1, #2]
	ldr lr, [r1, #4]
	mov r4, r2, asr #8
	mov r1, r2, lsl #8
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r4, r4, #0xff
	and r1, r1, #0xff00
	orr r1, r4, r1
	mov r1, r1, lsl #0x10
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	mov r1, r1, lsr #0x10
	orr r2, r3, r2
	bl Socl_Connect
	ldmia sp!, {r4, pc}
	arm_func_end connect

	arm_func_start recv
recv: ; 0x022CF260
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl Socl_ReadFrom
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end recv

	arm_func_start recvfrom
recvfrom: ; 0x022CF284
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	add ip, sp, #0xc
	str ip, [sp]
	str r3, [sp, #4]
	add r3, sp, #8
	bl Socl_ReadFrom
	cmp r0, #0
	addlt sp, sp, #0x10
	ldmltia sp!, {r3, pc}
	ldr r1, [sp, #0x18]
	cmp r1, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldrh r2, [sp, #8]
	mov r3, r2, asr #8
	mov r2, r2, lsl #8
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #2]
	ldr lr, [sp, #0xc]
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	str r2, [r1, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end recvfrom

	arm_func_start send
send: ; 0x022CF314
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl Socl_WriteTo
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end send

	arm_func_start sendto
sendto: ; 0x022CF338
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x20]
	cmp r5, #0
	moveq r5, #0
	moveq r4, r5
	beq _022CF3A4
	ldrh r4, [r5, #2]
	ldr r6, [r5, #4]
	mov r7, r4, asr #8
	mov ip, r4, lsl #8
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r7, r7, #0xff
	and ip, ip, #0xff00
	orr r7, r7, ip
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	mov ip, r7, lsl #0x10
	orr r4, r5, r4
	and r6, r6, #0xff000000
	mov r5, ip, lsr #0x10
	orr r4, r6, r4
_022CF3A4:
	str r4, [sp]
	str r3, [sp, #4]
	mov r3, r5
	bl Socl_WriteTo
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sendto

	arm_func_start Soc_Shutdown
Soc_Shutdown: ; 0x022CF3BC
	ldr ip, _022CF3C4 ; =Socl_Shutdown
	bx ip
	.align 2, 0
_022CF3C4: .word Socl_Shutdown
	arm_func_end Soc_Shutdown

	arm_func_start CloseVeneer
CloseVeneer: ; 0x022CF3C8
	ldr ip, _022CF3D0 ; =close
	bx ip
	.align 2, 0
_022CF3D0: .word close
	arm_func_end CloseVeneer

	arm_func_start Soc_GetHostByName
Soc_GetHostByName: ; 0x022CF3D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl Socl_Resolve
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022CF47C ; =ov00_023269BC
	ldr r2, _022CF480 ; =0x00000101
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _022CF47C ; =ov00_023269BC
	ldr r2, _022CF480 ; =0x00000101
	mov r1, r5
	bl Std_CopyLString
	mov r3, r4, lsr #0x18
	mov r2, r4, lsr #8
	mov ip, r4, lsl #8
	mov lr, r4, lsl #0x18
	ldr r4, _022CF47C ; =ov00_023269BC
	ldr r1, _022CF484 ; =ov00_02326934
	mov r0, #0
	str r4, [r1, #0x20]
	str r0, [r1, #0x24]
	mov r4, #2
	strh r4, [r1, #0x28]
	mov r4, #4
	ldr r5, _022CF488 ; =ov00_0232694C
	strh r4, [r1, #0x2a]
	and r3, r3, #0xff
	and r2, r2, #0xff00
	ldr r4, _022CF48C ; =ov00_02326934
	str r5, [r1, #0x2c]
	str r4, [r1, #0x18]
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	str r0, [r1, #0x1c]
	orr r2, r3, r2
	ldr r0, _022CF490 ; =ov00_02326954
	str r2, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CF47C: .word ov00_023269BC
_022CF480: .word 0x00000101
_022CF484: .word ov00_02326934
_022CF488: .word ov00_0232694C
_022CF48C: .word ov00_02326934
_022CF490: .word ov00_02326954
	arm_func_end Soc_GetHostByName

	arm_func_start Soc_GetSockName
Soc_GetSockName: ; 0x022CF494
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	bl Socl_GetHostID
	cmp r5, #0
	ldrneh r1, [r5, #0x74]
	mov r2, r0, lsr #0x18
	mov r6, #8
	moveq r1, #0
	cmp r0, #0
	moveq r1, #0
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r5, r3, asr #8
	mov lr, r3, lsl #8
	strb r6, [r4]
	mov r6, #2
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r0, r1, #0xff00
	and r2, r2, #0xff
	orr r0, r2, r0
	and r1, r3, #0xff0000
	and r5, r5, #0xff
	and lr, lr, #0xff00
	strb r6, [r4, #1]
	orr r3, r5, lr
	and r2, ip, #0xff000000
	orr r0, r1, r0
	strh r3, [r4, #2]
	orr r0, r2, r0
	str r0, [r4, #4]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Soc_GetSockName

	arm_func_start Soc_GetHostID
Soc_GetHostID: ; 0x022CF528
	stmdb sp!, {r3, lr}
	bl Socl_GetHostID
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	ldmia sp!, {r3, pc}
	arm_func_end Soc_GetHostID

	arm_func_start Soc_SetResolver
Soc_SetResolver: ; 0x022CF560
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r1]
	ldr r0, [r0]
	mov r2, ip, lsr #0x18
	mov r4, r0, lsr #0x18
	mov lr, r0, lsr #8
	mov r1, ip, lsr #8
	mov r5, r0, lsl #8
	mov r3, ip, lsl #8
	mov r0, r0, lsl #0x18
	mov ip, ip, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and lr, r0, #0xff000000
	orr r0, r5, r4
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r0, lr, r0
	orr r1, r2, r1
	bl Socl_SetResolver
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Soc_SetResolver

	arm_func_start fcntl
fcntl: ; 0x022CF5CC
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r1, #3
	beq _022CF5EC
	cmp r1, #4
	beq _022CF600
	b _022CF614
_022CF5EC:
	ldrsb r0, [r0, #0x72]
	cmp r0, #1
	moveq r0, #0
	movne r0, #4
	bx lr
_022CF600:
	tst r2, #4
	movne r1, #0
	strneb r1, [r0, #0x72]
	moveq r1, #1
	streqb r1, [r0, #0x72]
_022CF614:
	mov r0, #0
	bx lr
	arm_func_end fcntl

	arm_func_start AllocFunc_Socl
AllocFunc_Socl: ; 0x022CF61C
	stmdb sp!, {r4, lr}
	ldr r1, _022CF644 ; =ov00_02326934
	add r4, r0, #4
	ldr r2, [r1, #0xc]
	mov r1, r4
	mov r0, #0
	blx r2
	cmp r0, #0
	strne r4, [r0], #4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022CF644: .word ov00_02326934
	arm_func_end AllocFunc_Socl

	arm_func_start FreeFunc_Socl
FreeFunc_Socl: ; 0x022CF648
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022CF670 ; =ov00_02326934
	ldr r2, [r0, #-4]
	ldr r3, [r1, #4]
	sub r1, r0, #4
	mov r0, #0
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CF670: .word ov00_02326934
	arm_func_end FreeFunc_Socl

	arm_func_start SOC_Startup
SOC_Startup: ; 0x022CF674
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0xc]
	ldr ip, _022CF7D8 ; =AllocFunc_Socl
	cmp r1, #1
	moveq r2, #1
	ldr r1, _022CF7DC ; =ov00_02326934
	movne r2, #0
	str r2, [r1, #0x40]
	ldr r6, [r0, #0x10]
	ldr r3, _022CF7E0 ; =FreeFunc_Socl
	mov r4, r6, lsr #0x18
	mov r2, r6, lsr #8
	mov r5, r6, lsl #8
	and r4, r4, #0xff
	and r2, r2, #0xff00
	mov r6, r6, lsl #0x18
	orr r2, r4, r2
	and r5, r5, #0xff0000
	and r4, r6, #0xff000000
	orr r2, r5, r2
	orr r2, r4, r2
	str r2, [r1, #0x44]
	ldr lr, [r0, #0x14]
	mov r2, #0x40
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x48]
	ldr lr, [r0, #0x18]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x4c]
	ldr lr, [r0, #0x1c]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x50]
	ldr r6, [r0, #0x20]
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r6, r6, #0xff000000
	orr r4, r5, r4
	orr r4, r6, r4
	str r4, [r1, #0x54]
	str ip, [r1, #0x58]
	str r3, [r1, #0x5c]
	ldr r3, [r0, #4]
	str r3, [r1, #0xc]
	ldr r3, [r0, #8]
	str r3, [r1, #4]
	str r2, [r1, #0x60]
	ldr r2, [r0, #0x2c]
	str r2, [r1, #0x70]
	ldr r2, [r0, #0x30]
	ldr r0, _022CF7E4 ; =ov00_02326974
	str r2, [r1, #0x74]
	bl SOCL_Startup
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022CF7D8: .word AllocFunc_Socl
_022CF7DC: .word ov00_02326934
_022CF7E0: .word FreeFunc_Socl
_022CF7E4: .word ov00_02326974
	arm_func_end SOC_Startup

	arm_func_start ov00_022CF7E8
ov00_022CF7E8: ; 0x022CF7E8
	ldr ip, _022CF7F0 ; =Soc_Cleanup
	bx ip
	.align 2, 0
_022CF7F0: .word Soc_Cleanup
	arm_func_end ov00_022CF7E8

	arm_func_start Soc_InetNtoA
Soc_InetNtoA: ; 0x022CF7F4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	ldr r2, _022CF820 ; =ov00_023269AC
	add r1, sp, #8
	mov r0, #2
	mov r3, #0x10
	bl Soc_InetNtoP
	ldr r0, _022CF820 ; =ov00_023269AC
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022CF820: .word ov00_023269AC
	arm_func_end Soc_InetNtoA

	arm_func_start Soc_InetAtoN
Soc_InetAtoN: ; 0x022CF824
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl Socl_InetAtoH
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	str r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end Soc_InetAtoN

	arm_func_start Soc_InetNtoP
Soc_InetNtoP: ; 0x022CF874
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	cmp r0, #2
	mov r4, r2
	addne sp, sp, #0x14
	movne r0, #0
	ldmneia sp!, {r3, r4, pc}
	cmp r3, #0x10
	addlo sp, sp, #0x14
	movlo r0, #0
	ldmloia sp!, {r3, r4, pc}
	mov r0, r1
	add r1, sp, #0x10
	mov r2, #4
	bl MI_CpuCopy8
	ldr r0, [sp, #0x10]
	add r1, sp, #0xc
	bl Soc_U32to4U8
	ldrb r1, [sp, #0xe]
	ldr r2, _022CF8F4 ; =ov00_023188B8
	mov r0, r4
	str r1, [sp]
	ldrb r3, [sp, #0xd]
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [sp, #0xc]
	str r3, [sp, #8]
	ldrb r3, [sp, #0xf]
	bl OS_SnPrintf
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022CF8F4: .word ov00_023188B8
	arm_func_end Soc_InetNtoP

	arm_func_start Soc_U32to4U8
Soc_U32to4U8: ; 0x022CF8F8
	mov r2, r0, lsr #0x18
	strb r2, [r1]
	mov r2, r0, lsr #0x10
	strb r2, [r1, #1]
	mov r2, r0, lsr #8
	strb r2, [r1, #2]
	strb r0, [r1, #3]
	bx lr
	arm_func_end Soc_U32to4U8

	arm_func_start Soc_Poll
Soc_Poll: ; 0x022CF918
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r2
	mov r8, r3
	mvn r2, #0
	cmp r8, r2
	cmpeq sb, r2
	movne fp, #1
	str r0, [sp]
	mov sl, r1
	moveq fp, #0
_022CF940:
	mov r6, #0
	ldr r4, [sp]
	mov r5, r6
	cmp sl, #0
	bls _022CF980
_022CF954:
	ldrsh r1, [r4, #4]
	ldr r0, [r4]
	orr r7, r1, #0xe0
	bl Socl_GetStatus
	ands r0, r7, r0
	strh r0, [r4, #6]
	add r5, r5, #1
	addne r6, r6, #1
	add r4, r4, #8
	cmp r5, sl
	blo _022CF954
_022CF980:
	cmp r6, #0
	bgt _022CF9C0
	cmp fp, #0
	beq _022CF9A4
	mov r0, #0
	subs r0, r0, sb
	mov r0, #0
	sbcs r0, r0, r8
	bge _022CF9C0
_022CF9A4:
	mov r0, #1
	bl OS_Sleep
	ldr r0, _022CF9C8 ; =0x0000020B
	subs sb, sb, r0
	mov r0, #0
	sbc r8, r8, r0
	b _022CF940
_022CF9C0:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022CF9C8: .word 0x0000020B
	arm_func_end Soc_Poll

	arm_func_start Socl_EnableSsl
Socl_EnableSsl: ; 0x022CF9CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Socl_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _022CFA20
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_022CFA20:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl Socli_ExecEnableSslCommand
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Socl_EnableSsl

	arm_func_start Socli_ExecEnableSslCommand
Socli_ExecEnableSslCommand: ; 0x022CFA4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r0, _022CFA84 ; =Socli_EnableSslCallBack
	mov r1, r5
	mov r2, #1
	bl Socli_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	str r4, [r1, #0x10]
	bl Socli_ExecCommandPacketInRecvPipe
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CFA84: .word Socli_EnableSslCallBack
	arm_func_end Socli_ExecEnableSslCommand

	arm_func_start Socli_EnableSslCallBack
Socli_EnableSslCallBack: ; 0x022CFA88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	ldr r6, [r5, #0xc4]
	bl OS_LockMutex
	ldr r1, [r7, #0x10]
	cmp r1, #0
	beq _022CFAC8
	mov r0, #1
	str r1, [r6, #0xc]
	bl Cps_SetSsl
	mov r0, #4
	strb r0, [r4, #0x73]
	b _022CFADC
_022CFAC8:
	mov r0, #0
	strb r0, [r4, #0x73]
	bl Cps_SetSsl
	mov r0, #0
	str r0, [r6, #0xc]
_022CFADC:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Socli_EnableSslCallBack

	arm_func_start find_session_from_id
find_session_from_id: ; 0x022CFAEC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl EnableIrqFlag
	mov r4, #0
	ldr r6, _022CFB7C ; =ov00_02326AC8
	mov r5, r0
	strb r4, [r7, #0x30]
	mov r8, #0x20
_022CFB0C:
	ldrb r0, [r6, #0x5a]
	cmp r0, #0
	beq _022CFB60
	ldr r0, [r6, #0x54]
	cmp r0, #0
	ldreqh r0, [r6, #0x58]
	cmpeq r0, #0
	bne _022CFB60
	mov r0, r6
	mov r2, r8
	add r1, r7, #0x74
	bl memcmp
	cmp r0, #0
	bne _022CFB60
	mov r1, r7
	add r0, r6, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	mov r0, #1
	strb r0, [r7, #0x30]
	b _022CFB70
_022CFB60:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _022CFB0C
_022CFB70:
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022CFB7C: .word ov00_02326AC8
	arm_func_end find_session_from_id

	arm_func_start find_session_from_ip
find_session_from_ip: ; 0x022CFB80
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl EnableIrqFlag
	mov r1, #0
	ldr r5, _022CFC1C ; =ov00_02326AC8
	mov r4, r0
	strb r1, [r8, #0x30]
_022CFBA4:
	ldrb r0, [r5, #0x5a]
	cmp r0, #0
	beq _022CFC00
	ldr r0, [r5, #0x54]
	cmp r0, r7
	ldreqh r0, [r5, #0x58]
	cmpeq r0, r6
	bne _022CFC00
	mov r0, r5
	add r1, r8, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r1, r8
	add r0, r5, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r5, #0x50]
	mov r0, #1
	strb r0, [r8, #0x30]
	b _022CFC10
_022CFC00:
	add r1, r1, #1
	cmp r1, #4
	add r5, r5, #0x5c
	blt _022CFBA4
_022CFC10:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022CFC1C: .word ov00_02326AC8
	arm_func_end find_session_from_ip

	arm_func_start cache_session
cache_session: ; 0x022CFC20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl EnableIrqFlag
	mov r4, r0
	bl OS_GetTick
	ldr sb, _022CFD08 ; =ov00_02326AC8
	mov r5, r0, lsr #0x10
	mov r2, #0
	mov r0, r2
	mov r3, sb
	orr r5, r5, r1, lsl #16
	mvn ip, #0
_022CFC58:
	ldrb lr, [r3, #0x5a]
	cmp lr, #0
	cmpne r7, #0
	beq _022CFC8C
	ldr r1, [r3, #0x54]
	cmp r7, r1
	bne _022CFC8C
	cmp r6, #0
	beq _022CFC8C
	ldrh r1, [r3, #0x58]
	cmp r6, r1
	moveq sb, r3
	beq _022CFCC8
_022CFC8C:
	cmp r2, ip
	beq _022CFCB8
	cmp lr, #0
	moveq r2, ip
	moveq sb, r3
	beq _022CFCB8
	ldr r1, [r3, #0x50]
	sub r1, r5, r1
	cmp r1, r2
	movhi r2, r1
	movhi sb, r3
_022CFCB8:
	add r0, r0, #1
	cmp r0, #4
	add r3, r3, #0x5c
	blt _022CFC58
_022CFCC8:
	mov r1, sb
	add r0, r8, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, r8
	add r1, sb, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	str r5, [sb, #0x50]
	mov r0, #1
	strb r0, [sb, #0x5a]
	str r7, [sb, #0x54]
	mov r0, r4
	strh r6, [sb, #0x58]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022CFD08: .word ov00_02326AC8
	arm_func_end cache_session

	arm_func_start purge_session
purge_session: ; 0x022CFD0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	bl EnableIrqFlag
	ldr r7, _022CFD70 ; =ov00_02326AC8
	mov r6, r0
	mov r5, #0
	mov r4, #0x20
_022CFD28:
	ldrb r0, [r7, #0x5a]
	cmp r0, #0
	beq _022CFD54
	mov r0, r7
	mov r2, r4
	add r1, r8, #0x74
	bl memcmp
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r7, #0x5a]
	beq _022CFD64
_022CFD54:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x5c
	blt _022CFD28
_022CFD64:
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022CFD70: .word ov00_02326AC8
	arm_func_end purge_session

	arm_func_start date2sec
date2sec: ; 0x022CFD74
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	add r0, sp, #0xc
	bl Rtc_GetDate
	add r0, sp, #0
	bl Rtc_GetTime
	add r0, sp, #0xc
	add r1, sp, #0
	bl Rtc_ConvertDateTimeToSecond
	ldr r1, _022CFDA8 ; =0x386D4380
	add r0, r0, r1
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	.align 2, 0
_022CFDA8: .word 0x386D4380
	arm_func_end date2sec

	arm_func_start Cps_GetSslLowThreadPriority
Cps_GetSslLowThreadPriority: ; 0x022CFDAC
	ldr r0, _022CFDB8 ; =ov00_023188CC
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022CFDB8: .word ov00_023188CC
	arm_func_end Cps_GetSslLowThreadPriority

	arm_func_start Cps_SetSslLowThreadPriority
Cps_SetSslLowThreadPriority: ; 0x022CFDBC
	ldr r1, _022CFDC8 ; =ov00_023188CC
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_022CFDC8: .word ov00_023188CC
	arm_func_end Cps_SetSslLowThreadPriority

	arm_func_start enter_computebound
enter_computebound: ; 0x022CFDCC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022CFE10 ; =ov00_023188CC
	ldr r0, [r0, #4]
	cmp r0, #0x20
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	ldr r0, _022CFE14 ; =OSi_ThreadInfo
	ldr r5, [r0, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	ldr r1, _022CFE10 ; =ov00_023188CC
	mov r4, r0
	ldr r1, [r1, #4]
	mov r0, r5
	bl OS_SetThreadPriority
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022CFE10: .word ov00_023188CC
_022CFE14: .word OSi_ThreadInfo
	arm_func_end enter_computebound

	arm_func_start exit_computebound
exit_computebound: ; 0x022CFE18
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0x20
	ldmhsia sp!, {r3, pc}
	ldr r0, _022CFE38 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	bl OS_SetThreadPriority
	ldmia sp!, {r3, pc}
	.align 2, 0
_022CFE38: .word OSi_ThreadInfo
	arm_func_end exit_computebound

	arm_func_start Cps_SetRootCa
Cps_SetRootCa: ; 0x022CFE3C
	ldr r2, _022CFE60 ; =OSi_ThreadInfo
	ldr r2, [r2, #4]
	ldr r2, [r2, #0xa4]
	cmp r2, #0
	ldrne r2, [r2, #0xc]
	cmpne r2, #0
	strne r0, [r2, #0x814]
	strne r1, [r2, #0x818]
	bx lr
	.align 2, 0
_022CFE60: .word OSi_ThreadInfo
	arm_func_end Cps_SetRootCa

	arm_func_start Get_RootCA
Get_RootCA: ; 0x022CFE64
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, [r0, #0x818]
	mov r8, r1
	cmp r6, #0
	mov r4, #0
	ble _022CFEA8
	ldr r5, [r0, #0x814]
_022CFE80:
	ldr r7, [r5, r4, lsl #2]
	mov r1, r8
	ldr r0, [r7]
	bl strcmp
	cmp r0, #0
	moveq r0, r7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r4, r4, #1
	cmp r4, r6
	blt _022CFE80
_022CFEA8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Get_RootCA

	arm_func_start cert_item_len
cert_item_len: ; 0x022CFEB0
	ldr r1, [r0]
	ldrb r2, [r1]
	add r3, r1, #1
	tst r2, #0x80
	beq _022CFEF4
	ands r1, r2, #0x7f
	sub ip, r1, #1
	mov r2, #0
	beq _022CFEF4
_022CFED4:
	tst r2, #0xff000000
	mvnne r0, #0
	bxne lr
	ldrb r1, [r3], #1
	cmp ip, #0
	sub ip, ip, #1
	add r2, r1, r2, lsl #8
	bne _022CFED4
_022CFEF4:
	str r3, [r0]
	mov r0, r2
	bx lr
	arm_func_end cert_item_len

	arm_func_start make_dn
make_dn: ; 0x022CFF00
	ldrsb r3, [r0]
	mov ip, r0
	cmp r3, #0
	beq _022CFF48
_022CFF10:
	ldrsb r3, [r0, #1]!
	cmp r3, #0
	bne _022CFF10
	sub r3, r0, ip
	cmp r3, #0xff
	bxge lr
	mov r3, #0x2c
	strb r3, [r0]
	mov r3, #0x20
	strb r3, [r0, #1]
	add r0, r0, #2
	b _022CFF48
_022CFF40:
	ldrsb r3, [r1], #1
	strb r3, [r0], #1
_022CFF48:
	cmp r2, #0
	sub r2, r2, #1
	beq _022CFF60
	sub r3, r0, ip
	cmp r3, #0xff
	blt _022CFF40
_022CFF60:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end make_dn

	arm_func_start parse_time
parse_time: ; 0x022CFF6C
	stmdb sp!, {r4, lr}
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r2, #0xa
	cmp r1, #0x17
	mla r1, r3, r2, ip
	sub lr, r1, #0x210
	bne _022CFFA0
	cmp lr, #0x32
	addlo r4, lr, #0x7d0
	addhs r1, lr, #0x36c
	addhs r4, r1, #0x400
	b _022CFFB8
_022CFFA0:
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r1, #0x64
	mla r2, r3, r2, ip
	sub r2, r2, #0x210
	mla r4, lr, r1, r2
_022CFFB8:
	ldrb ip, [r0, #1]
	ldrb r3, [r0]
	mov r1, #0xa
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #2]
	mla ip, r3, r1, ip
	mla r1, r0, r1, r2
	sub r0, ip, #0x210
	mov r0, r0, lsl #8
	add r2, r0, r4, lsl #16
	sub r0, r1, #0x210
	add r0, r2, r0
	ldmia sp!, {r4, pc}
	arm_func_end parse_time

	arm_func_start cert_item
cert_item: ; 0x022CFFEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov fp, r1
	ldr r1, [fp]
	mov sb, r0
	add r0, r1, #1
	str r0, [sp, #4]
	add r0, sp, #4
	mov r7, r2
	mov r6, r3
	ldr r8, [sp, #0x30]
	ldrb r5, [r1]
	bl cert_item_len
	movs r4, r0
	bmi _022D0030
	cmp r4, #0x7d0
	ble _022D003C
_022D0030:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D003C:
	and r1, r5, #0x1f
	cmp r1, #0x18
	addls pc, pc, r1, lsl #2
	b _022D0460
_022D004C: ; jump table
	b _022D0460 ; case 0
	b _022D0460 ; case 1
	b _022D00B0 ; case 2
	b _022D01A8 ; case 3
	b _022D0460 ; case 4
	b _022D0460 ; case 5
	b _022D0228 ; case 6
	b _022D0460 ; case 7
	b _022D0460 ; case 8
	b _022D0460 ; case 9
	b _022D0460 ; case 10
	b _022D0460 ; case 11
	b _022D02C0 ; case 12
	b _022D0460 ; case 13
	b _022D0460 ; case 14
	b _022D0460 ; case 15
	b _022D0390 ; case 16
	b _022D0410 ; case 17
	b _022D0460 ; case 18
	b _022D02C0 ; case 19
	b _022D02C0 ; case 20
	b _022D0460 ; case 21
	b _022D02C0 ; case 22
	b _022D0340 ; case 23
	b _022D0340 ; case 24
_022D00B0:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _022D0198
	cmp r6, #0
	bne _022D0130
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _022D00EC
_022D00D4:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _022D00D4
_022D00EC:
	cmp r8, #0
	beq _022D0100
	cmp r8, #2
	beq _022D0120
	b _022D0198
_022D0100:
	cmp r4, #0x100
	bgt _022D0198
	add r1, sb, #0x94
	mov r2, r4
	add r1, r1, #0x400
	bl MI_CpuCopy8
	str r4, [sb, #0x594]
	b _022D0198
_022D0120:
	str r4, [sb, #0x484]
	ldr r0, [sp, #4]
	str r0, [sb, #0x488]
	b _022D0198
_022D0130:
	cmp r6, #1
	bne _022D0198
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _022D0160
_022D0148:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _022D0148
_022D0160:
	cmp r8, #0
	beq _022D017C
	cmp r8, #2
	streq r4, [sb, #0x48c]
	ldreq r0, [sp, #4]
	streq r0, [sb, #0x490]
	b _022D0198
_022D017C:
	cmp r4, #8
	bgt _022D0198
	add r1, sb, #0x198
	mov r2, r4
	add r1, r1, #0x400
	bl MI_CpuCopy8
	str r4, [sb, #0x5a0]
_022D0198:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _022D04C4
_022D01A8:
	cmp r7, #1
	bne _022D01CC
	cmp r8, #2
	beq _022D01CC
	ldr r1, [sp, #4]
	sub r0, r4, #1
	add r1, r1, #1
	str r1, [sb, #0x5a4]
	str r0, [sb, #0x5a8]
_022D01CC:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _022D0218
	ldr r0, [sp, #4]
	add r1, sp, #4
	add r0, r0, #1
	str r0, [sp, #4]
	mov r0, sb
	mov r2, r7
	mov r3, #0
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [sb, #0x5ad]
	b _022D04C4
_022D0218:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _022D04C4
_022D0228:
	ldr r6, [sp, #4]
	ldr sl, _022D04D8 ; =ov00_023188D4
	mov r5, #0
_022D0234:
	ldr r7, [sl, r5, lsl #2]
	mov r0, r7
	bl strlen
	mov r2, r0
	mov r0, r6
	mov r1, r7
	bl memcmp
	cmp r0, #0
	bne _022D02A4
	cmp r5, #5
	addls pc, pc, r5, lsl #2
	b _022D02B0
_022D0264: ; jump table
	b _022D02B0 ; case 0
	b _022D027C ; case 1
	b _022D027C ; case 2
	b _022D028C ; case 3
	b _022D028C ; case 4
	b _022D0298 ; case 5
_022D027C:
	cmp r8, #0
	streq r5, [sb, #0x45c]
	strb r5, [sb, #0x5ad]
	b _022D02B0
_022D028C:
	cmp r8, #2
	strne r5, [sb, #0x458]
	b _022D02B0
_022D0298:
	cmp r8, #2
	strneb r5, [sb, #0x5ae]
	b _022D02B0
_022D02A4:
	add r5, r5, #1
	cmp r5, #6
	blt _022D0234
_022D02B0:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _022D04C4
_022D02C0:
	cmp r8, #2
	beq _022D0328
	ldrb r0, [sb, #0x5ac]
	cmp r0, #0
	beq _022D0318
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x6b0
	bl make_dn
	ldrb r0, [sb, #0x5ae]
	cmp r0, #5
	bne _022D0328
	cmp r4, #0x4f
	bgt _022D0328
	ldr r0, [sp, #4]
	mov r2, r4
	add r1, sb, #0x7b0
	bl MI_CpuCopy8
	add r0, sb, r4
	mov r1, #0
	strb r1, [r0, #0x7b0]
	b _022D0328
_022D0318:
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x5b0
	bl make_dn
_022D0328:
	mov r0, #0
	strb r0, [sb, #0x5ae]
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _022D04C4
_022D0340:
	cmp r8, #2
	beq _022D0378
	ldr r0, [sp, #4]
	bl parse_time
	cmp r6, #0
	ldr r1, [sb, #0x80c]
	bne _022D036C
	cmp r1, r0
	movhs r0, #1
	strhsb r0, [sb, #0x5af]
	b _022D0378
_022D036C:
	cmp r1, r0
	movhi r0, #0
	strhib r0, [sb, #0x5af]
_022D0378:
	ldr r1, [sp, #4]
	mov r0, #1
	add r1, r1, r4
	str r1, [sp, #4]
	strb r0, [sb, #0x5ac]
	b _022D04C4
_022D0390:
	cmp r7, #0
	cmpeq r6, #0
	bne _022D03A8
	cmp r8, #2
	ldrne r0, [sp, #4]
	strne r0, [sb, #0x460]
_022D03A8:
	ldr r0, [sp, #4]
	mov r5, #0
	add sl, r0, r4
	cmp r0, sl
	bhs _022D03F8
	add r4, sp, #4
_022D03C0:
	mov r0, sb
	mov r1, r4
	mov r3, r5
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	add r5, r5, #1
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, sl
	blo _022D03C0
_022D03F8:
	cmp r7, #1
	cmpeq r6, #0
	bne _022D04C4
	cmp r8, #2
	strne r0, [sb, #0x464]
	b _022D04C4
_022D0410:
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _022D04C4
	add r5, sp, #4
	mov r4, #0
_022D0428:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _022D0428
	b _022D04C4
_022D0460:
	cmp r5, #0xa0
	bne _022D04B8
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _022D04C4
	add r5, sp, #4
	mov r4, #0
_022D0480:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _022D0480
	b _022D04C4
_022D04B8:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
_022D04C4:
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [fp]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D04D8: .word ov00_023188D4
	arm_func_end cert_item

	arm_func_start validate_signature
validate_signature: ; 0x022D04DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x5a4]
	mov r7, r1
	cmp r0, #0
	ldrne r0, [r8, #0x5a8]
	cmpne r0, #0
	ldrne r0, [r7, #0x10]
	cmpne r0, #0
	ldrne r0, [r7, #0xc]
	cmpne r0, #0
	ldrne r0, [r7, #8]
	cmpne r0, #0
	ldrne r0, [r7, #4]
	cmpne r0, #0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r0, lsl #1
	ldr r1, _022D067C ; =ov00_0232508C
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	ldr r1, [r1]
	mov r0, r5, lsl #3
	blx r1
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r6, r4, r5, lsl #1
	add sb, r6, r5, lsl #1
	ldr r1, [r8, #0x5a4]
	ldr r2, [r8, #0x5a8]
	mov r0, r6
	mov r3, r5
	add sl, sb, r5, lsl #1
	bl Cpsi_Big_From_Char
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	mov r0, sb
	mov r3, r5
	bl Cpsi_Big_From_Char
	ldr r1, [r7, #8]
	ldr r2, [r7, #4]
	mov r0, sl
	mov r3, r5
	bl Cpsi_Big_From_Char
	bl enter_computebound
	mov r2, sb
	mov sb, r0
	mov r0, r4
	mov r1, r6
	mov r3, r5
	str sl, [sp]
	bl Cpsi_Big_Power
	mov r0, sb
	bl exit_computebound
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	mov r3, r5
	bl Cpsi_Char_From_Big
	ldrb r0, [r4, r5, lsl #1]
	mov r5, #0
	cmp r0, #0
	ldreqb r0, [r6, #1]
	cmpeq r0, #1
	movne r5, #2
	bne _022D0660
	ldr r3, [r7, #4]
	mov r2, #2
	cmp r3, #2
	ble _022D061C
_022D0604:
	ldrb r0, [r6, r2]
	cmp r0, #0xff
	bne _022D061C
	add r2, r2, #1
	cmp r2, r3
	blt _022D0604
_022D061C:
	add r1, r2, #1
	cmp r1, r3
	bge _022D065C
	ldrb r0, [r6, r2]
	cmp r0, #0
	ldreqb r0, [r6, r1]
	cmpeq r0, #0x30
	bne _022D065C
	ldr r2, [r8, #0x47c]
	add r0, r8, #0x68
	add r1, r6, r3
	add r0, r0, #0x400
	sub r1, r1, r2
	bl memcmp
	cmp r0, #0
	beq _022D0660
_022D065C:
	mov r5, #2
_022D0660:
	ldr r1, _022D0680 ; =ov00_023250B8
	mov r0, r4
	ldr r1, [r1]
	blx r1
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022D067C: .word ov00_0232508C
_022D0680: .word ov00_023250B8
	arm_func_end validate_signature

	arm_func_start auth_cert
auth_cert: ; 0x022D0684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x5af]
	ldr r1, [r5, #0x45c]
	cmp r0, #0
	movne r4, #0
	moveq r4, #0x8000
	mvn r0, #0
	cmp r1, r0
	orreq r0, r4, #4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x458]
	cmp r0, #3
	beq _022D06C8
	cmp r0, #4
	beq _022D0700
	b _022D0738
_022D06C8:
	add r0, r5, #0x3fc
	bl Cpsi_Md5_Init
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x3fc
	sub r2, r2, r1
	bl Cpsi_Md5_Calc
	add r1, r5, #0x68
	add r0, r5, #0x3fc
	add r1, r1, #0x400
	bl Cpsi_Md5_Result
	mov r0, #0x10
	str r0, [r5, #0x47c]
	b _022D0740
_022D0700:
	add r0, r5, #0x348
	bl Cpsi_Sha1_Init
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x348
	sub r2, r2, r1
	bl Cpsi_Sha1_Calc
	add r1, r5, #0x68
	add r0, r5, #0x348
	add r1, r1, #0x400
	bl Cpsi_Sha1_Result
	mov r0, #0x14
	str r0, [r5, #0x47c]
	b _022D0740
_022D0738:
	orr r0, r4, #3
	ldmia sp!, {r3, r4, r5, pc}
_022D0740:
	mov r0, r5
	add r1, r5, #0x5b0
	bl Get_RootCA
	movs r1, r0
	orreq r0, r4, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl validate_signature
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end auth_cert

	arm_func_start chars_till_end
chars_till_end: ; 0x022D0768
	mov r2, r0
	b _022D0774
_022D0770:
	add r0, r0, #1
_022D0774:
	ldrsb r1, [r0]
	cmp r1, #0x2e
	cmpne r1, #0
	bne _022D0770
	sub r0, r0, r2
	bx lr
	arm_func_end chars_till_end

	arm_func_start compare_fqdn
compare_fqdn: ; 0x022D078C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	b _022D07A8
_022D079C:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_022D07A8:
	ldrsb r0, [r5], #1
	ldrsb r1, [r6], #1
	cmp r1, r0
	beq _022D079C
	cmp r0, #0x2a
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	sub r6, r6, #1
	mov r0, r6
	bl chars_till_end
	mov r4, r0
	mov r0, r5
	bl chars_till_end
	cmp r0, r4
	movgt r0, #1
	ldmgtia sp!, {r4, r5, r6, pc}
	sub r0, r4, r0
	add r6, r6, r0
	b _022D07A8
	arm_func_end compare_fqdn

	arm_func_start ov00_022D07F4
ov00_022D07F4: ; 0x022D07F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov00_022D07F4

	arm_func_start rcv_certificate
rcv_certificate: ; 0x022D07F8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r1, [sp, #0x44]
	mov sl, r0
	ldrb r4, [r1, #2]
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	add r0, r1, #3
	mvn r1, #0
	str r0, [sp, #0x44]
	add r2, r2, r3, lsl #8
	add r0, sp, #8
	str r1, [sl, #0x45c]
	add r8, r4, r2, lsl #8
	bl Rtc_GetDate
	mov r6, #0
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r1, #0x7d0
	mov r0, r0, lsl #8
	ldr r2, [sp, #0x10]
	add r0, r0, r1, lsl #16
	add r0, r2, r0
	str r0, [sl, #0x80c]
	strb r6, [sl, #0x6b0]
	str r6, [sl, #0x5a0]
	mov sb, r6
	str r6, [sl, #0x594]
	mov fp, #2
	mvn r5, #0
	mov r4, r6
_022D0878:
	ldr r1, [sp, #0x44]
	mov r0, sl
	ldrb r2, [r1, #2]
	ldrb ip, [r1]
	ldrb r3, [r1, #1]
	add r7, r1, #3
	add r1, sp, #0x44
	str r7, [sp, #0x44]
	str r5, [sl, #0x458]
	strb r4, [sl, #0x5ad]
	strb r4, [sl, #0x5ac]
	strb r4, [sl, #0x5af]
	strb r4, [sl, #0x6b0]
	strb r4, [sl, #0x5b0]
	strb r4, [sl, #0x7b0]
	add r3, r3, ip, lsl #8
	ldr r7, [sp, #0x44]
	add r3, r2, r3, lsl #8
	add r2, r3, #3
	str r7, [sl, #0x804]
	str r3, [sl, #0x808]
	sub r8, r8, r2
	mov r2, r4
	mov r3, r4
	str r6, [sp]
	bl cert_item
	cmp r0, #0
	bne _022D0900
	ldr r0, [sl, #0x594]
	cmp r0, #0x33
	blo _022D0900
	ldr r0, [sl, #0x5a0]
	cmp r0, #0
	bne _022D0918
_022D0900:
	mov r0, #9
	add sp, sp, #0x18
	strb r0, [sl, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_022D0918:
	mov r0, sl
	bl auth_cert
	mov r7, r0
	cmp sb, #0
	bne _022D0948
	ldr r0, [sl, #0x800]
	cmp r0, #0
	beq _022D0948
	add r1, sl, #0x7b0
	bl compare_fqdn
	cmp r0, #0
	orrne r7, r7, #0x4000
_022D0948:
	and r6, r7, #0xff
	cmp r6, #1
	bne _022D09B8
	cmp r8, #0
	beq _022D09B8
	ldr r1, [sp, #0x44]
	mov r2, #0
	add r1, r1, #3
	str r1, [sp, #4]
	mov r1, #0
	strb r1, [sl, #0x5ad]
	mov r0, sl
	add r1, sp, #4
	mov r3, r2
	str fp, [sp]
	bl cert_item
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x18
	strneb r0, [sl, #0x455]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addne sp, sp, #0x10
	bxne lr
	mov r0, sl
	add r1, sl, #0x480
	bl validate_signature
	bic r1, r7, #0xff
	orr r7, r1, r0
_022D09B8:
	ldr r3, [sl, #0x810]
	cmp r3, #0
	beq _022D09D8
	mov r0, r7
	mov r1, sl
	mov r2, sb
	blx r3
	mov r7, r0
_022D09D8:
	cmp r6, #0
	add sb, sb, #1
	beq _022D09F8
	cmp r7, #0
	bne _022D09F8
	cmp r8, #0
	movne r6, #1
	bne _022D0878
_022D09F8:
	cmp r7, #0
	moveq r0, #3
	streqb r0, [sl, #0x455]
	movne r0, #9
	strneb r0, [sl, #0x455]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end rcv_certificate

	arm_func_start rcv_server_hello
rcv_server_hello: ; 0x022D0A1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	add r0, r5, #2
	add r1, r6, #0x54
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrb r7, [r6, #0x30]
	ldrb r4, [r5, #0x22]
	add r5, r5, #0x23
	cmp r7, #0
	beq _022D0A74
	cmp r4, #0x20
	bne _022D0A74
	mov r1, r5
	add r0, r6, #0x74
	mov r2, #0x20
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r6, #0x31]
	beq _022D0AB0
_022D0A74:
	cmp r7, #0
	beq _022D0A84
	mov r0, r6
	bl purge_session
_022D0A84:
	cmp r4, #0
	moveq r0, #0
	beq _022D0AA4
	mov r0, r5
	add r1, r6, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, #1
_022D0AA4:
	strb r0, [r6, #0x30]
	mov r0, #0
	strb r0, [r6, #0x31]
_022D0AB0:
	add r0, r5, r4
	ldrb r2, [r5, r4]
	ldrb r1, [r0, #1]
	mov r0, #2
	add r1, r1, r2, lsl #8
	strh r1, [r6, #0x32]
	strb r0, [r6, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end rcv_server_hello

	arm_func_start has_method
has_method: ; 0x022D0AD0
	stmdb sp!, {r4, lr}
	cmp r1, #0
	mov r4, #0
	ble _022D0B14
_022D0AE0:
	ldrb lr, [r0]
	ldrb ip, [r0, #1]
	cmp r2, #3
	add lr, ip, lr, lsl #8
	ldreqb ip, [r0, #2]
	addeq lr, ip, lr, lsl #8
	cmp lr, r3
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r1
	add r0, r0, r2
	blt _022D0AE0
_022D0B14:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end has_method

	arm_func_start select_method
select_method: ; 0x022D0B1C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _022D0B78 ; =ov00_023188CC
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
_022D0B34:
	mov r0, r5, lsl #1
	ldrh r3, [r4, r0]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl has_method
	cmp r0, #0
	beq _022D0B64
	ldr r0, _022D0B78 ; =ov00_023188CC
	mov r1, r5, lsl #1
	ldrh r0, [r0, r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022D0B64:
	add r5, r5, #1
	cmp r5, #2
	blo _022D0B34
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022D0B78: .word ov00_023188CC
	arm_func_end select_method

	arm_func_start version_ok
version_ok: ; 0x022D0B7C
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end version_ok

	arm_func_start client_hello_v2
client_hello_v2: ; 0x022D0B8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl version_ok
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r6, #2]
	ldrb r1, [r6, #3]
	ldr r3, _022D0C50 ; =0x55555556
	add r0, r6, #8
	add r4, r1, r2, lsl #8
	smull r2, r1, r3, r4
	add r1, r1, r4, lsr #31
	mov r2, #3
	bl select_method
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	strh r0, [r7, #0x32]
	ldrb r5, [r6, #4]
	ldrb r3, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r0, [r6, #7]
	mov r1, #0
	add r3, r3, r5, lsl #8
	add r5, r0, r2, lsl #8
	add r0, r4, #8
	strb r1, [r7, #0x30]
	cmp r5, #0x20
	add r4, r0, r3
	blt _022D0C24
	add r0, r6, r4
	add r1, r7, #0x34
	mov r2, #0x20
	bl MI_CpuCopy8
	b _022D0C44
_022D0C24:
	add r0, r7, #0x34
	rsb r2, r5, #0x20
	bl MI_CpuFill8
	add r1, r7, #0x54
	mov r2, r5
	add r0, r6, r4
	sub r1, r1, r5
	bl MI_CpuCopy8
_022D0C44:
	mov r0, #1
	strb r0, [r7, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022D0C50: .word 0x55555556
	arm_func_end client_hello_v2

	arm_func_start ov00_022D0C54
ov00_022D0C54: ; 0x022D0C54
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl version_ok
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r6, #2
	add r1, r4, #0x34
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrb r5, [r6, #0x22]
	add r6, r6, #0x23
	cmp r5, #0x20
	movne r0, #0
	strneb r0, [r4, #0x30]
	bne _022D0CB4
	mov r0, r6
	add r1, r4, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, r4
	bl find_session_from_id
_022D0CB4:
	add r0, r6, r5
	ldrb r1, [r0, #1]
	ldrb r3, [r6, r5]
	add r0, r0, #2
	mov r2, #2
	add r1, r1, r3, lsl #8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	bl select_method
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	strh r0, [r4, #0x32]
	movne r0, #1
	strneb r0, [r4, #0x455]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov00_022D0C54

	arm_func_start decrypt_premaster_secret
decrypt_premaster_secret: ; 0x022D0CF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	movs sl, r2
	str r0, [sp, #8]
	ldrne r0, [sl]
	mov fp, r1
	cmpne r0, #0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r0, lsl #1
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r4, r0, #1
	mov r0, #0x14
	mul r0, r4, r0
	ldr r1, _022D0F28 ; =ov00_0232508C
	ldr r1, [r1]
	blx r1
	movs r5, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r5, r4, lsl #1
	add r7, r6, r4, lsl #1
	add r1, r7, r4, lsl #1
	str r1, [sp, #0x10]
	add r1, r1, r4, lsl #1
	add r8, r1, r4, lsl #1
	str r1, [sp, #0xc]
	ldr r2, [sl]
	add sb, r8, r4, lsl #1
	mov r1, fp
	mov r3, r4
	add fp, sb, r4, lsl #1
	bl Cpsi_Big_From_Char
	ldr r1, [sl, #0x1c]
	ldr r2, [sl, #0x18]
	mov r0, r6
	mov r3, r4
	bl Cpsi_Big_From_Char
	ldr r1, [sl, #0xc]
	ldr r2, [sl, #8]
	mov r0, r8
	mov r3, r4
	bl Cpsi_Big_From_Char
	bl enter_computebound
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	str r8, [sp]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl Cpsi_Big_Montpower
	ldr r1, [sl, #0x24]
	ldr r2, [sl, #0x20]
	mov r0, r6
	mov r3, r4
	bl Cpsi_Big_From_Char
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r8
	mov r3, r4
	bl Cpsi_Big_From_Char
	ldr r0, [sp, #0xc]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	str r8, [sp]
	bl Cpsi_Big_Montpower
	ldr r0, [sp, #0x14]
	bl exit_computebound
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	mov r0, r5
	mov r3, r4
	bl Cpsi_Big_Sub
	ldr r1, [sl, #0x2c]
	ldr r2, [sl, #0x28]
	mov r0, r6
	mov r3, r4
	bl Cpsi_Big_From_Char
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl Cpsi_Big_Mult
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r6
	mov r3, r4
	bl Cpsi_Big_From_Char
	mov r0, r5
	mov r1, r7
	mov r2, r6
	mov r3, r4
	bl Cpsi_Big_Mult
	ldr r2, [sp, #0xc]
	mov r0, r7
	mov r1, r5
	mov r3, r4
	bl Cpsi_Big_Add
	ldr r1, [sl, #4]
	ldr r2, [sl]
	mov r0, r6
	mov r3, r4
	bl Cpsi_Big_From_Char
	mov r0, r7
	mov r1, r4
	bl Cpsi_Big_Sign
	cmp r0, #0
	bge _022D0EE4
	mov r0, r7
	mov r1, r4
	bl Cpsi_Big_Negate
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl Cpsi_Big_Div
	mov r0, sb
	mov r1, r6
	mov r2, sb
	mov r3, r4
	bl Cpsi_Big_Sub
	b _022D0EFC
_022D0EE4:
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl Cpsi_Big_Div
_022D0EFC:
	ldr r0, [sp, #8]
	mov r1, sb
	mov r3, r4
	mov r2, #0x30
	bl Cpsi_Char_From_Big
	ldr r1, _022D0F2C ; =ov00_023250B8
	mov r0, r5
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D0F28: .word ov00_0232508C
_022D0F2C: .word ov00_023250B8
	arm_func_end decrypt_premaster_secret

	arm_func_start create_ms_sub
create_ms_sub: ; 0x022D0F30
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r4, r2
	mov r6, r0
	mov r5, r1
	add r0, r4, #0x348
	bl Cpsi_Sha1_Init
	mov r0, r5
	bl strlen
	mov r2, r0
	mov r1, r5
	add r0, r4, #0x348
	bl Cpsi_Sha1_Calc
	add r0, r4, #0x348
	mov r1, r4
	mov r2, #0x30
	bl Cpsi_Sha1_Calc
	add r0, r4, #0x348
	add r1, r4, #0x34
	mov r2, #0x40
	bl Cpsi_Sha1_Calc
	add r0, r4, #0x348
	add r1, sp, #0
	bl Cpsi_Sha1_Result
	add r0, r4, #0x3fc
	bl Cpsi_Md5_Init
	add r0, r4, #0x3fc
	mov r1, r4
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r4, #0x3fc
	add r1, sp, #0
	mov r2, #0x14
	bl Cpsi_Md5_Calc
	add r0, r4, #0x3fc
	mov r1, r6
	bl Cpsi_Md5_Result
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end create_ms_sub

	arm_func_start create_master_secret
create_master_secret: ; 0x022D0FCC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldr r1, _022D1020 ; =ov00_02318918
	add r0, sp, #0
	mov r2, r4
	bl create_ms_sub
	ldr r1, _022D1024 ; =ov00_0231891C
	add r0, sp, #0x10
	mov r2, r4
	bl create_ms_sub
	ldr r1, _022D1028 ; =ov00_02318920
	add r0, sp, #0x20
	mov r2, r4
	bl create_ms_sub
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x30
	bl MI_CpuCopy8
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D1020: .word ov00_02318918
_022D1024: .word ov00_0231891C
_022D1028: .word ov00_02318920
	arm_func_end create_master_secret

	arm_func_start create_key_block
create_key_block: ; 0x022D102C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	ldrh r0, [sl, #0x32]
	cmp r0, #4
	beq _022D1050
	cmp r0, #5
	beq _022D1064
	b _022D1078
_022D1050:
	mov r0, #0x10
	str r0, [sp, #4]
	str r0, [sp]
	mov r2, #0
	b _022D1078
_022D1064:
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
_022D1078:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r7, #0
	add r0, r1, r0
	add r0, r2, r0
	mov fp, r0, lsl #1
	cmp fp, #0
	ble _022D116C
	add r0, sl, #0x74
	mov sb, r7
	str r0, [sp, #8]
	add r5, sp, #0xc
	mov r4, #1
_022D10AC:
	add r0, sl, #0x348
	bl Cpsi_Sha1_Init
	add r0, r7, #0x41
	add r6, r7, #1
	strb r0, [sp, #0xc]
	mov r8, #0
	cmp r6, #0
	ble _022D10E8
_022D10CC:
	add r0, sl, #0x348
	mov r1, r5
	mov r2, r4
	bl Cpsi_Sha1_Calc
	add r8, r8, #1
	cmp r8, r6
	blt _022D10CC
_022D10E8:
	add r0, sl, #0x348
	mov r1, sl
	mov r2, #0x30
	bl Cpsi_Sha1_Calc
	add r0, sl, #0x348
	add r1, sl, #0x54
	mov r2, #0x20
	bl Cpsi_Sha1_Calc
	add r0, sl, #0x348
	add r1, sl, #0x34
	mov r2, #0x20
	bl Cpsi_Sha1_Calc
	add r0, sl, #0x348
	add r1, sp, #0xd
	bl Cpsi_Sha1_Result
	add r0, sl, #0x3fc
	bl Cpsi_Md5_Init
	add r0, sl, #0x3fc
	mov r1, sl
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, sl, #0x3fc
	add r1, sp, #0xd
	mov r2, #0x14
	bl Cpsi_Md5_Calc
	ldr r1, [sp, #8]
	add r0, sl, #0x3fc
	add r1, r1, sb
	bl Cpsi_Md5_Result
	add sb, sb, #0x10
	cmp sb, fp
	add r7, r7, #1
	blt _022D10AC
_022D116C:
	ldrb r0, [sl, #0x454]
	add r3, sl, #0x74
	cmp r0, #0
	beq _022D11A8
	ldr r0, [sp, #4]
	str r3, [sl, #0x1d4]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0x1d8]
	ldr r0, [sp]
	str r2, [sl, #0xbc]
	add r0, r1, r0
	str r0, [sl, #0xc0]
	b _022D11D0
_022D11A8:
	ldr r0, [sp, #4]
	str r3, [sl, #0xbc]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0xc0]
	ldr r0, [sp]
	str r2, [sl, #0x1d4]
	add r0, r1, r0
	str r0, [sl, #0x1d8]
_022D11D0:
	ldr r1, [sl, #0x1d8]
	add r0, sl, #0x1e0
	mov r2, #0x10
	bl Cpsi_Rc4_Init
	ldr r1, [sl, #0xc0]
	add r0, sl, #0xc8
	mov r2, #0x10
	bl Cpsi_Rc4_Init
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end create_key_block

	arm_func_start rcv_client_key_exchange
rcv_client_key_exchange: ; 0x022D11F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0x81c]
	bl decrypt_premaster_secret
	mov r0, r4
	bl create_master_secret
	mov r1, #0
	mov r0, r4
	mov r2, r1
	bl cache_session
	mov r0, r4
	bl create_key_block
	mov r0, #5
	strb r0, [r4, #0x455]
	ldmia sp!, {r4, pc}
	arm_func_end rcv_client_key_exchange

	arm_func_start finished_md5
finished_md5: ; 0x022D1234
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _022D1264
	ldr r1, _022D1308 ; =ov00_02318924
	add r0, r5, #0x3a4
	bl Cpsi_Md5_Calc
	b _022D1270
_022D1264:
	ldr r1, _022D130C ; =ov00_0231892C
	add r0, r5, #0x3a4
	bl Cpsi_Md5_Calc
_022D1270:
	mov r1, r5
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	mov r1, r4
	add r0, r5, #0x3a4
	bl Cpsi_Md5_Result
	add r0, r5, #0x3a4
	bl Cpsi_Md5_Init
	add r0, r5, #0x3a4
	mov r1, r5
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r5, #0x3a4
	add r1, sp, #0
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3a4
	mov r1, r4
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3a4
	mov r1, r4
	bl Cpsi_Md5_Result
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D1308: .word ov00_02318924
_022D130C: .word ov00_0231892C
	arm_func_end finished_md5

	arm_func_start finished_sha1
finished_sha1: ; 0x022D1310
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _022D1340
	ldr r1, _022D13E4 ; =ov00_02318924
	add r0, r5, #0x2ec
	bl Cpsi_Sha1_Calc
	b _022D134C
_022D1340:
	ldr r1, _022D13E8 ; =ov00_0231892C
	add r0, r5, #0x2ec
	bl Cpsi_Sha1_Calc
_022D134C:
	mov r1, r5
	add r0, r5, #0x2ec
	mov r2, #0x30
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x2ec
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	mov r1, r4
	add r0, r5, #0x2ec
	bl Cpsi_Sha1_Result
	add r0, r5, #0x2ec
	bl Cpsi_Sha1_Init
	add r0, r5, #0x2ec
	mov r1, r5
	mov r2, #0x30
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r5, #0x2ec
	add r1, sp, #0
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x2ec
	mov r1, r4
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x2ec
	mov r1, r4
	bl Cpsi_Sha1_Result
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D13E4: .word ov00_02318924
_022D13E8: .word ov00_0231892C
	arm_func_end finished_sha1

	arm_func_start rcv_finished
rcv_finished: ; 0x022D13EC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl finished_md5
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r4
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x14
	strneb r0, [r5, #0x455]
	ldmneia sp!, {r4, r5, pc}
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl finished_sha1
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl MI_CpuCopy8
	add r1, sp, #0
	add r0, r4, #0x10
	mov r2, #0x14
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r5, #0x455]
	moveq r0, #6
	streqb r0, [r5, #0x455]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end rcv_finished

	arm_func_start add1_be8
add1_be8: ; 0x022D14AC
	mov r2, #8
_022D14B0:
	ldrb r1, [r0, #-1]!
	add r1, r1, #1
	ands r1, r1, #0xff
	strb r1, [r0]
	bxne lr
	subs r2, r2, #1
	bne _022D14B0
	bx lr
	arm_func_end add1_be8

	arm_func_start decrypt
decrypt: ; 0x022D14D0
	stmdb sp!, {r4, lr}
	add r0, r0, #0x1e0
	mov r4, r2
	bl Cpsi_Rc4_Crypt
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end decrypt

	arm_func_start make_plaintext
make_plaintext: ; 0x022D14E8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r6, r1
	ldrb r3, [r6, #3]
	ldrb r2, [r6, #4]
	mov r7, r0
	add r1, r6, #5
	add r2, r2, r3, lsl #8
	bl decrypt
	ldrh r1, [r7, #0x32]
	mov r4, r0
	cmp r1, #4
	beq _022D1528
	cmp r1, #5
	beq _022D1608
	b _022D16E4
_022D1528:
	sub r4, r4, #0x10
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x3fc
	bl Cpsi_Md5_Init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r7, #0x3fc
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	add r1, r7, #0x2e4
	mov r2, #8
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	mov r1, r6
	mov r2, #1
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	add r1, r6, #3
	add r2, r4, #2
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl Cpsi_Md5_Result
	add r0, r7, #0x3fc
	bl Cpsi_Md5_Init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r7, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl Cpsi_Md5_Result
	mov r5, #0x10
	b _022D16E4
_022D1608:
	sub r4, r4, #0x14
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x348
	bl Cpsi_Sha1_Init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r7, #0x348
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	add r1, r7, #0x2e4
	mov r2, #8
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	mov r1, r6
	mov r2, #1
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	add r1, r6, #3
	add r2, r4, #2
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl Cpsi_Sha1_Result
	add r0, r7, #0x348
	bl Cpsi_Sha1_Init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r7, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl Cpsi_Sha1_Result
	mov r5, #0x14
_022D16E4:
	add r0, r6, #5
	add r1, sp, #0x30
	mov r2, r5
	add r0, r0, r4
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r7, #0x455]
	add r0, r7, #0x2ec
	bl add1_be8
	add r0, r4, #5
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end make_plaintext

	arm_func_start make_ciphertext
make_ciphertext: ; 0x022D1718
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r4, r1
	mov r5, r0
	ldrh r0, [r5, #0x32]
	ldrb r2, [r4, #3]
	ldrb r1, [r4, #4]
	cmp r0, #4
	add r6, r4, #5
	add r7, r1, r2, lsl #8
	beq _022D1750
	cmp r0, #5
	beq _022D1820
	b _022D18EC
_022D1750:
	add r0, r5, #0x3fc
	bl Cpsi_Md5_Init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x3fc
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3fc
	add r1, r5, #0x1cc
	mov r2, #8
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3fc
	mov r1, r4
	mov r2, #1
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3fc
	add r1, r4, #3
	add r2, r7, #2
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3fc
	add r1, r6, r7
	bl Cpsi_Md5_Result
	add r0, r5, #0x3fc
	bl Cpsi_Md5_Init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r5, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl Cpsi_Md5_Calc
	add r0, r5, #0x3fc
	add r1, r6, r7
	mov r2, #0x10
	bl Cpsi_Md5_Calc
	add r1, r6, r7
	add r0, r5, #0x3fc
	bl Cpsi_Md5_Result
	add r7, r7, #0x10
	b _022D18EC
_022D1820:
	add r0, r5, #0x348
	bl Cpsi_Sha1_Init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x348
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x348
	add r1, r5, #0x1cc
	mov r2, #8
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x348
	mov r1, r4
	mov r2, #1
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x348
	add r1, r4, #3
	add r2, r7, #2
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x348
	add r1, r6, r7
	bl Cpsi_Sha1_Result
	add r0, r5, #0x348
	bl Cpsi_Sha1_Init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r5, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl Cpsi_Sha1_Calc
	add r0, r5, #0x348
	add r1, r6, r7
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	add r1, r6, r7
	add r0, r5, #0x348
	bl Cpsi_Sha1_Result
	add r7, r7, #0x14
_022D18EC:
	mov r0, r7, asr #8
	strb r0, [r4, #3]
	mov r2, r7
	add r0, r5, #0xc8
	add r1, r4, #5
	strb r7, [r4, #4]
	bl Cpsi_Rc4_Crypt
	add r0, r5, #0x1d4
	bl add1_be8
	add r0, r7, #5
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end make_ciphertext

	arm_func_start tcp_read_raw_nbytes
tcp_read_raw_nbytes: ; 0x022D191C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	add r4, sp, #0
_022D1930:
	mov r0, r4
	mov r1, r5
	bl Cpsi_TcpReadRaw
	ldr r1, [sp]
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, r6
	strhi r6, [sp]
	ldr r2, [sp]
	mov r1, r7
	bl MI_CpuCopy8
	ldr r0, [sp]
	mov r1, r5
	bl Cpsi_SocConsumeRaw
	ldr r0, [sp]
	sub r6, r6, r0
	cmp r6, #0
	add r7, r7, r0
	bgt _022D1930
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end tcp_read_raw_nbytes

	arm_func_start update_digest
update_digest: ; 0x022D1988
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	add r0, r6, #0x2ec
	bl Cpsi_Sha1_Calc
	mov r1, r5
	mov r2, r4
	add r0, r6, #0x3a4
	bl Cpsi_Md5_Calc
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end update_digest

	arm_func_start parse_record_in_buf
parse_record_in_buf: ; 0x022D19B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	ldrb r2, [sb, #0x455]
	mov r8, r1
	cmp r2, #9
	bne _022D19E0
	ldr r1, _022D1C30 ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D19E0:
	ldrb r3, [r8, #3]
	ldrb r1, [r8, #4]
	add r0, r2, #0xf9
	and r0, r0, #0xff
	add r1, r1, r3, lsl #8
	cmp r0, #1
	add r6, r1, #5
	ldrb r4, [r8]
	bhi _022D1A0C
	cmp r4, #0x15
	bne _022D1A1C
_022D1A0C:
	cmp r4, #0x15
	bne _022D1A4C
	cmp r6, #7
	bls _022D1A4C
_022D1A1C:
	mov r0, sb
	mov r1, r8
	bl make_plaintext
	ldrb r2, [sb, #0x455]
	mov r6, r0
	cmp r2, #9
	bne _022D1A4C
	ldr r1, _022D1C30 ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D1A4C:
	sub r0, r4, #0x14
	cmp r0, #3
	add r5, r8, #5
	sub r6, r6, #5
	addls pc, pc, r0, lsl #2
	b _022D1C14
_022D1A64: ; jump table
	b _022D1A74 ; case 0
	b _022D1AA4 ; case 1
	b _022D1AB8 ; case 2
	b _022D1BF4 ; case 3
_022D1A74:
	ldr r0, [sb, #0x1d4]
	cmp r0, #0
	moveq r0, #9
	streqb r0, [sb, #0x455]
	beq _022D1C1C
	add r0, sb, #0x2e4
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	mov r0, #7
	strb r0, [sb, #0x455]
	b _022D1C1C
_022D1AA4:
	ldrb r0, [r5]
	cmp r0, #2
	moveq r0, #9
	streqb r0, [sb, #0x455]
	b _022D1C1C
_022D1AB8:
	mov fp, #4
	mov sl, #1
	mov r4, #0
_022D1AC4:
	ldrb r7, [r5, #2]
	ldrb r0, [r5, #1]
	ldrb r3, [r5]
	ldrb r1, [r5, #3]
	mov r7, r7, lsl #8
	add r0, r7, r0, lsl #16
	cmp r3, #0xb
	add r7, r1, r0
	add r5, r5, #4
	bgt _022D1B14
	cmp r3, #0xb
	bge _022D1B88
	cmp r3, #2
	bgt _022D1BBC
	cmp r3, #1
	blt _022D1BBC
	beq _022D1B44
	cmp r3, #2
	beq _022D1B78
	b _022D1BBC
_022D1B14:
	sub r0, r3, #0xd
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022D1BBC
_022D1B24: ; jump table
	b _022D1B9C ; case 0
	b _022D1BA4 ; case 1
	b _022D1BBC ; case 2
	b _022D1B68 ; case 3
	b _022D1BBC ; case 4
	b _022D1BBC ; case 5
	b _022D1BBC ; case 6
	b _022D1BAC ; case 7
_022D1B44:
	ldrb r0, [sb, #0x454]
	cmp r0, #0
	beq _022D1BC4
	cmp r2, #0
	bne _022D1BC4
	mov r0, sb
	mov r1, r5
	bl ov00_022D0C54
	b _022D1BC4
_022D1B68:
	mov r0, sb
	mov r1, r5
	bl rcv_client_key_exchange
	b _022D1BC4
_022D1B78:
	mov r0, sb
	mov r1, r5
	bl rcv_server_hello
	b _022D1BC4
_022D1B88:
	mov r0, sb
	mov r1, r5
	bl rcv_certificate
	strb r4, [sb, #0x5ac]
	b _022D1BC4
_022D1B9C:
	strb sl, [sb, #0x5ac]
	b _022D1BC4
_022D1BA4:
	strb fp, [sb, #0x455]
	b _022D1BC4
_022D1BAC:
	mov r0, sb
	mov r1, r5
	bl rcv_finished
	b _022D1BC4
_022D1BBC:
	mov r0, #9
	strb r0, [sb, #0x455]
_022D1BC4:
	mov r0, sb
	sub r1, r5, #4
	add r2, r7, #4
	bl update_digest
	add r0, r7, #4
	add r5, r5, r7
	subs r6, r6, r0
	beq _022D1C1C
	ldrb r2, [sb, #0x455]
	cmp r2, #9
	bne _022D1AC4
	b _022D1C1C
_022D1BF4:
	str r8, [sb, #0x824]
	mov r0, #5
	str r0, [sb, #0x82c]
	add r0, r6, #5
	str r0, [sb, #0x828]
	mov r0, #1
	strb r0, [sb, #0x456]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D1C14:
	mov r0, #9
	strb r0, [sb, #0x455]
_022D1C1C:
	ldr r1, _022D1C30 ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D1C30: .word ov00_023250B8
	arm_func_end parse_record_in_buf

	arm_func_start parse_record
parse_record: ; 0x022D1C34
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r6, sp, #0
_022D1C48:
	mov r0, r6
	mov r1, r5
	bl Cpsi_TcpReadRaw
	ldr r1, [sp]
	cmp r1, #0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	cmp r1, #5
	blo _022D1C48
	ldrb r1, [r0]
	cmp r1, #0x80
	bne _022D1D30
	ldrb r1, [r4, #0x454]
	cmp r1, #0
	beq _022D1D24
	ldrb r1, [r4, #0x455]
	cmp r1, #0
	bne _022D1D24
	ldrb r2, [r0, #1]
	mov r1, r5
	mov r0, #2
	str r2, [sp]
	bl Cpsi_SocConsumeRaw
	ldr r1, _022D1DC8 ; =ov00_0232508C
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl tcp_read_raw_nbytes
	cmp r0, #0
	ldreqb r0, [r6]
	cmpeq r0, #1
	movne r0, #9
	strneb r0, [r4, #0x455]
	bne _022D1D00
	mov r0, r4
	add r1, r6, #1
	bl client_hello_v2
_022D1D00:
	ldr r2, [sp]
	mov r0, r4
	mov r1, r6
	bl update_digest
	ldr r1, _022D1DCC ; =ov00_023250B8
	mov r0, r6
	ldr r1, [r1]
	blx r1
	b _022D1DBC
_022D1D24:
	mov r0, #9
	strb r0, [r4, #0x455]
	b _022D1DBC
_022D1D30:
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _022D1DD0 ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _022D1DC8 ; =ov00_0232508C
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl tcp_read_raw_nbytes
	cmp r0, #0
	beq _022D1DB0
	ldr r1, _022D1DCC ; =ov00_023250B8
	mov r0, r6
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #4
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022D1DB0:
	mov r0, r4
	mov r1, r6
	bl parse_record_in_buf
_022D1DBC:
	ldrb r0, [r4, #0x455]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022D1DC8: .word ov00_0232508C
_022D1DCC: .word ov00_023250B8
_022D1DD0: .word 0x00004805
	arm_func_end parse_record

	arm_func_start set_random
set_random: ; 0x022D1DD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	ldr r2, _022D1EF4 ; =ov00_02326AC0
	mov sl, r0
	ldrb r0, [r2]
	mov sb, r1
	cmp r0, #0
	bne _022D1E38
	ldr r2, _022D1EF8 ; =ov00_023250E0
	add r0, sp, #0
	ldr r3, [r2]
	ldmib r2, {r1, r4}
	umull r6, r5, r4, r3
	mla r5, r4, r1, r5
	ldr r1, [r2, #0xc]
	ldr r4, [r2, #0x10]
	mla r5, r1, r3, r5
	ldr r1, [r2, #0x14]
	adds r4, r4, r6
	adc r3, r1, r5
	str r4, [r2]
	mov r1, #4
	str r3, [r2, #4]
	str r3, [sp]
	bl Cps_SslAddRandomSeed
_022D1E38:
	cmp sb, #0
	mov r8, #0
	addle sp, sp, #0x74
	mov r1, #0x14
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _022D1EFC ; =ov00_02326C38
	add r6, sp, #0x18
	mov fp, r1
	add r4, sp, #4
_022D1E5C:
	cmp r1, #0x14
	bne _022D1ED0
	mov r0, r6
	bl Cpsi_Sha1_Init
	bl EnableIrqFlag
	mov r7, r0
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl Cpsi_Sha1_Calc
	mov r0, r6
	mov r1, r4
	bl Cpsi_Sha1_Result_Prng
	ldr lr, _022D1F00 ; =ov00_02326C4B
	mov r3, #1
	mov r2, #0x13
	add ip, sp, #0x17
_022D1EA0:
	ldrb r1, [lr]
	ldrb r0, [ip], #-1
	subs r2, r2, #1
	add r0, r1, r0
	add r0, r3, r0
	strb r0, [lr], #-1
	mov r3, r0, lsr #8
	bpl _022D1EA0
	str r0, [sp]
	mov r0, r7
	bl SetIrqFlag
	mov r1, #0
_022D1ED0:
	ldrb r0, [r4, r1]
	add r1, r1, #1
	cmp r0, #0
	strneb r0, [sl, r8]
	addne r8, r8, #1
	cmp r8, sb
	blt _022D1E5C
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D1EF4: .word ov00_02326AC0
_022D1EF8: .word ov00_023250E0
_022D1EFC: .word ov00_02326C38
_022D1F00: .word ov00_02326C4B
	arm_func_end set_random

	arm_func_start Cps_SslAddRandomSeed
Cps_SslAddRandomSeed: ; 0x022D1F04
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x5c
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	bl Cpsi_Sha1_Init
	bl EnableIrqFlag
	mov r4, r0
	ldr r1, _022D1F6C ; =ov00_02326C38
	add r0, sp, #0
	mov r2, #0x14
	bl Cpsi_Sha1_Calc
	mov r1, r6
	mov r2, r5
	add r0, sp, #0
	bl Cpsi_Sha1_Calc
	ldr r1, _022D1F6C ; =ov00_02326C38
	add r0, sp, #0
	bl Cpsi_Sha1_Result
	mov r0, r4
	bl SetIrqFlag
	ldr r0, _022D1F70 ; =ov00_02326AC0
	mov r1, #1
	strb r1, [r0]
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022D1F6C: .word ov00_02326C38
_022D1F70: .word ov00_02326AC0
	arm_func_end Cps_SslAddRandomSeed

	arm_func_start send_change_cipher_spec_and_finished
send_change_cipher_spec_and_finished: ; 0x022D1F74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _022D20C4 ; =ov00_0232508C
	mov r6, r0
	ldr r1, [r1]
	mov r0, #0x83
	ldr r5, [r6, #0xc]
	blx r1
	movs r4, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r5, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r0, #0x14
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	mov r3, #1
	strb r3, [r4, #4]
	add r0, r5, #0x1cc
	mov r2, #8
	strb r3, [r4, #5]
	bl MI_CpuFill8
	mov r0, #0x16
	strb r0, [r4, #6]
	mov r0, #3
	strb r0, [r4, #7]
	mov r1, #0
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	mov r0, #0x28
	strb r0, [r4, #0xa]
	mov r0, #0x14
	strb r0, [r4, #0xb]
	strb r1, [r4, #0xc]
	strb r1, [r4, #0xd]
	mov r3, #0x24
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	strb r3, [r4, #0xe]
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0xf
	mov r2, #0
	bl finished_md5
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl MI_CpuCopy8
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0x1f
	mov r2, #0
	bl finished_sha1
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0xb
	mov r2, #0x28
	bl update_digest
	mov r0, r5
	add r1, r4, #6
	bl make_ciphertext
	mov r2, #0
	add r1, r0, #6
	mov r0, r4
	mov r3, r2
	str r6, [sp]
	bl Cpsi_TcpWrite2Raw
	ldr r1, _022D20C8 ; =ov00_023250B8
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022D20C4: .word ov00_0232508C
_022D20C8: .word ov00_023250B8
	arm_func_end send_change_cipher_spec_and_finished

	arm_func_start send_client_hello
send_client_hello: ; 0x022D20CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022D2254 ; =ov00_0232508C
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x98
	ldr r4, [r7, #0xc]
	blx r1
	movs r5, r0
	moveq r0, #9
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #3
	strb r0, [r5, #9]
	mov r0, #0
	strb r0, [r5, #0xa]
	bl date2sec
	mov r1, r0, lsr #0x18
	strb r1, [r4, #0x34]
	mov r1, r0, lsr #0x10
	strb r1, [r4, #0x35]
	mov r1, r0, lsr #8
	strb r1, [r4, #0x36]
	strb r0, [r4, #0x37]
	add r0, r4, #0x38
	mov r1, #0x1c
	bl set_random
	add r0, r4, #0x34
	add r1, r5, #0xb
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrh r2, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	mov r0, r4
	bl find_session_from_ip
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r5, #0x2b]
	addeq r0, r5, #0x2c
	beq _022D2184
	mov r2, #0x20
	add r0, r4, #0x74
	add r1, r5, #0x2c
	strb r2, [r5, #0x2b]
	bl MI_CpuCopy8
	add r0, r5, #0x4c
_022D2184:
	mov r6, #0
	strb r6, [r0]
	mov r1, #4
	strb r1, [r0, #1]
	ldr r2, _022D2258 ; =ov00_023188CC
	add r0, r0, #2
_022D219C:
	mov r3, r6, lsl #1
	ldrh r1, [r2, r3]
	add r6, r6, #1
	cmp r6, #2
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r2, r3]
	strb r1, [r0, #1]
	add r0, r0, #2
	blo _022D219C
	mov r3, #1
	mov r2, #0
	strb r3, [r0]
	add r1, r0, #2
	sub r1, r1, r5
	sub r6, r1, #5
	strb r2, [r0, #1]
	sub r1, r6, #4
	mov r0, #0x16
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #1]
	strb r2, [r5, #2]
	mov r0, r6, asr #8
	strb r0, [r5, #3]
	strb r6, [r5, #4]
	strb r3, [r5, #5]
	mov r0, r1, asr #0x10
	strb r0, [r5, #6]
	mov r0, r1, asr #8
	strb r0, [r5, #7]
	strb r1, [r5, #8]
	mov r0, r5
	mov r3, r2
	add r1, r6, #5
	str r7, [sp]
	bl Cpsi_TcpWrite2Raw
	mov r0, r4
	mov r2, r6
	add r1, r5, #5
	bl update_digest
	ldr r1, _022D225C ; =ov00_023250B8
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022D2254: .word ov00_0232508C
_022D2258: .word ov00_023188CC
_022D225C: .word ov00_023250B8
	arm_func_end send_client_hello

	arm_func_start send_client_key_exchange
send_client_key_exchange: ; 0x022D2260
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r4, [sl, #0xc]
	ldrb r0, [r4, #0x5ac]
	cmp r0, #0
	beq _022D2294
	mov r2, #0
	ldr r0, _022D2514 ; =ov00_02318150
	mov r3, r2
	mov r1, #7
	str sl, [sp]
	bl Cpsi_TcpWrite2Raw
_022D2294:
	mov r0, #3
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	add r0, r4, #2
	mov r1, #0x2e
	bl set_random
	ldr sb, [r4, #0x594]
	ldr r0, _022D2518 ; =ov00_0232508C
	mov r1, sb, lsl #1
	ldr r2, [r0]
	add r1, r1, r1, lsr #31
	mov r0, sb
	mov r7, r1, asr #1
	blx r2
	movs r8, r0
	moveq r0, #9
	addeq sp, sp, #8
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [r8]
	mov r2, #2
	add r0, r8, #2
	sub r1, sb, #0x33
	strb r2, [r8, #1]
	bl set_random
	add r1, r8, sb
	mov r0, r4
	sub r3, sb, #0x31
	mov r5, #0
	sub r1, r1, #0x30
	mov r2, #0x30
	strb r5, [r8, r3]
	bl MI_CpuCopy8
	ldr r1, _022D2518 ; =ov00_0232508C
	mov r0, r7, lsl #3
	ldr r1, [r1]
	blx r1
	movs r5, r0
	bne _022D2358
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D2358:
	add r0, r5, r7, lsl #1
	add fp, r0, r7, lsl #1
	mov r1, r8
	mov r2, sb
	mov r3, r7
	str r0, [sp, #4]
	add r6, fp, r7, lsl #1
	bl Cpsi_Big_From_Char
	add r0, r4, #0x198
	add r1, r0, #0x400
	ldr r2, [r4, #0x5a0]
	mov r0, fp
	mov r3, r7
	bl Cpsi_Big_From_Char
	add r1, r4, #0x94
	mov r0, r6
	add r1, r1, #0x400
	mov r2, sb
	mov r3, r7
	bl Cpsi_Big_From_Char
	bl enter_computebound
	str r6, [sp]
	mov r6, r0
	ldr r1, [sp, #4]
	mov r2, fp
	mov r3, r7
	mov r0, r5
	bl Cpsi_Big_Power
	mov r0, r6
	bl exit_computebound
	ldr r1, _022D2518 ; =ov00_0232508C
	add r0, sb, #0x49
	ldr r1, [r1]
	blx r1
	movs r6, r0
	bne _022D2418
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r5
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D2418:
	mov r0, #0x16
	strb r0, [r6]
	mov r1, #3
	add r0, sb, #4
	strb r1, [r6, #1]
	mov r1, #0
	strb r1, [r6, #2]
	mov r1, r0, asr #8
	strb r1, [r6, #3]
	strb r0, [r6, #4]
	mov r0, #0x10
	strb r0, [r6, #5]
	mov r0, sb, asr #0x10
	strb r0, [r6, #6]
	mov r0, sb, asr #8
	strb r0, [r6, #7]
	strb sb, [r6, #8]
	tst sb, #1
	add r0, r6, #9
	beq _022D2480
	add r0, sb, sb, lsr #31
	mov r0, r0, asr #1
	mov r0, r0, lsl #1
	ldrh r1, [r5, r0]
	add r0, r6, #0xa
	strb r1, [r6, #9]
_022D2480:
	add r1, sb, sb, lsr #31
	mov r1, r1, asr #1
	subs r3, r1, #1
	bmi _022D24B4
_022D2490:
	mov r2, r3, lsl #1
	ldrh r1, [r5, r2]
	subs r3, r3, #1
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r5, r2]
	strb r1, [r0, #1]
	add r0, r0, #2
	bpl _022D2490
_022D24B4:
	mov r2, #0
	mov r0, r6
	mov r3, r2
	add r1, sb, #9
	str sl, [sp]
	bl Cpsi_TcpWrite2Raw
	mov r0, r4
	add r1, r6, #5
	add r2, sb, #4
	bl update_digest
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r6
	ldr r1, [r1]
	blx r1
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldr r1, _022D251C ; =ov00_023250B8
	mov r0, r8
	ldr r1, [r1]
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D2514: .word ov00_02318150
_022D2518: .word ov00_0232508C
_022D251C: .word ov00_023250B8
	arm_func_end send_client_key_exchange

	arm_func_start mustget_change_cipher_spec_and_finished
mustget_change_cipher_spec_and_finished: ; 0x022D2520
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl parse_record
	cmp r0, #7
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl parse_record
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end mustget_change_cipher_spec_and_finished

	arm_func_start ssl_listen_try
ssl_listen_try: ; 0x022D2550
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	bl send_client_hello
_022D2560:
	mov r0, r5
	bl parse_record
	cmp r0, #9
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #4
	beq _022D2588
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _022D2560
_022D2588:
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _022D25BC
	mov r0, r4
	bl create_key_block
	mov r0, r5
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl send_change_cipher_spec_and_finished
	b _022D260C
_022D25BC:
	mov r0, r5
	bl send_client_key_exchange
	mov r0, r4
	bl create_master_secret
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	beq _022D25E8
	ldrh r2, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	bl cache_session
_022D25E8:
	mov r0, r4
	bl create_key_block
	mov r0, r5
	bl send_change_cipher_spec_and_finished
	mov r0, r5
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_022D260C:
	mov r0, #8
	strb r0, [r4, #0x455]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ssl_listen_try

	arm_func_start Cpsi_SslConnect
Cpsi_SslConnect: ; 0x022D261C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r1, [r5, #8]
	ldr r4, [r5, #0xc]
	cmp r1, #4
	beq _022D2644
	bl Cpsi_TcpConnectRaw
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_022D2644:
	mov r1, #0
	strb r1, [r4, #0x455]
	str r1, [r4, #0x1d4]
	add r0, r4, #0x2ec
	strb r1, [r4, #0x454]
	bl Cpsi_Sha1_Init
	add r0, r4, #0x3a4
	bl Cpsi_Md5_Init
	mov r0, r5
	bl ssl_listen_try
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Cpsi_SslConnect

	arm_func_start Cpsi_SslRead
Cpsi_SslRead: ; 0x022D2670
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xc]
	mov r6, r0
	ldr ip, [r4, #0x824]
	cmp ip, #0
	beq _022D26F4
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	bne _022D26F4
	ldr r3, [r4, #0x82c]
	ldr r1, [r4, #0x828]
	mov r2, r5
	add r0, ip, r3
	sub r1, r1, r3
	bl tcp_read_raw_nbytes
	cmp r0, #0
	beq _022D26D8
	ldr r1, _022D2744 ; =ov00_023250B8
	ldr r0, [r4, #0x824]
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r4, #0x824]
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_022D26D8:
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl parse_record_in_buf
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
_022D26F4:
	ldr r0, [r4, #0x824]
	cmp r0, #0
	bne _022D2724
_022D2700:
	mov r0, r5
	bl parse_record
	cmp r0, #9
	moveq r0, #0
	streq r0, [r6]
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _022D2700
_022D2724:
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	str r0, [r6]
	ldr r1, [r4, #0x824]
	ldr r0, [r4, #0x82c]
	add r0, r1, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D2744: .word ov00_023250B8
	arm_func_end Cpsi_SslRead

	arm_func_start Cpsi_SslConsume
Cpsi_SslConsume: ; 0x022D2748
	stmdb sp!, {r4, lr}
	ldr r4, [r1, #0xc]
	ldr r2, [r4, #0x828]
	ldr r1, [r4, #0x82c]
	sub r2, r2, r1
	cmp r0, r2
	blo _022D2788
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _022D277C
	ldr r1, _022D2794 ; =ov00_023250B8
	ldr r1, [r1]
	blx r1
_022D277C:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
_022D2788:
	add r0, r1, r0
	str r0, [r4, #0x82c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D2794: .word ov00_023250B8
	arm_func_end Cpsi_SslConsume

	arm_func_start try_fill_record
try_fill_record: ; 0x022D2798
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldr r0, [r5, #0x44]
	bne _022D2838
	cmp r0, #5
	addlo sp, sp, #4
	ldmloia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0
	mov r1, r5
	bl Cpsi_TcpReadRaw
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _022D28D4 ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _022D28D8 ; =ov00_0232508C
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	str r0, [r4, #0x824]
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r0, #0
	str r1, [r4, #0x828]
	str r0, [r4, #0x82c]
	strb r0, [r4, #0x456]
	b _022D2844
_022D2838:
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_022D2844:
	add r0, sp, #0
	mov r1, r5
	bl Cpsi_TcpReadRaw
	ldr r3, [r4, #0x828]
	ldr r2, [r4, #0x82c]
	ldr r1, [sp]
	sub r2, r3, r2
	cmp r1, r2
	strhs r2, [sp]
	movhs r6, #1
	ldr r3, [r4, #0x824]
	ldr r1, [r4, #0x82c]
	ldr r2, [sp]
	add r1, r3, r1
	movlo r6, #0
	bl MI_CpuCopy8
	ldr r0, [sp]
	mov r1, r5
	bl Cpsi_SocConsumeRaw
	cmp r6, #0
	beq _022D28BC
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl parse_record_in_buf
	ldrb r0, [r4, #0x456]
	add sp, sp, #4
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022D28BC:
	ldr r1, [r4, #0x82c]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [r4, #0x82c]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022D28D4: .word 0x00004805
_022D28D8: .word ov00_0232508C
	arm_func_end try_fill_record

	arm_func_start Cpsi_SslGetLength
Cpsi_SslGetLength: ; 0x022D28DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	bne _022D2904
	mov r0, r5
	bl try_fill_record
_022D2904:
	ldr r1, [r4, #0x824]
	cmp r1, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	beq _022D2928
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	ldmia sp!, {r3, r4, r5, pc}
_022D2928:
	cmp r1, #0
	bne _022D2950
	ldrb r0, [r5, #8]
	cmp r0, #4
	bne _022D2948
	ldrb r0, [r4, #0x455]
	cmp r0, #9
	bne _022D2950
_022D2948:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D2950:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Cpsi_SslGetLength

	arm_func_start Cpsi_SslWrite2
Cpsi_SslWrite2: ; 0x022D2958
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x30]
	mov sb, r1
	mov r1, r4
	ldr r1, [r1, #0xc]
	mov sl, r0
	mov r0, #0
	str r4, [sp, #0x30]
	str r1, [sp, #8]
	mov r8, r2
	add r5, sb, r3
	str r0, [sp, #4]
_022D298C:
	ldr r0, _022D2A80 ; =0x00000B4F
	ldr r1, _022D2A84 ; =ov00_0232508C
	cmp r5, r0
	movgt r6, r0
	movle r6, r5
	ldr r1, [r1]
	add r0, r6, #0x19
	blx r1
	movs r4, r0
	beq _022D2A74
	cmp sb, r6
	movhs r7, r6
	movlo r7, sb
	mov r0, sl
	add r1, r4, #5
	mov r2, r7
	sub fp, r6, r7
	bl MI_CpuCopy8
	add r1, r4, #5
	mov r0, r8
	add r1, r1, r7
	mov r2, fp
	add sl, sl, r7
	sub sb, sb, r7
	bl MI_CpuCopy8
	mov r0, #0x17
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, r6, asr #8
	strb r0, [r4, #3]
	ldr r0, [sp, #8]
	mov r1, r4
	add r8, r8, fp
	strb r6, [r4, #4]
	bl make_ciphertext
	ldr r1, [sp, #0x30]
	mov r7, r0
	mov r2, #0
	str r1, [sp]
	mov r0, r4
	mov r1, r7
	mov r3, r2
	bl Cpsi_TcpWrite2Raw
	cmp r0, r7
	ldr r1, _022D2A88 ; =ov00_023250B8
	mov r0, r4
	ldr r1, [r1]
	movlo r6, #0
	blx r1
	ldr r0, [sp, #4]
	subs r5, r5, r6
	add r0, r0, r6
	str r0, [sp, #4]
	cmpne r6, #0
	bne _022D298C
_022D2A74:
	ldr r0, [sp, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D2A80: .word 0x00000B4F
_022D2A84: .word ov00_0232508C
_022D2A88: .word ov00_023250B8
	arm_func_end Cpsi_SslWrite2

	arm_func_start Cpsi_SslShutdown
Cpsi_SslShutdown: ; 0x022D2A8C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x20
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldrb r0, [r4, #0x455]
	cmp r0, #8
	bne _022D2AFC
	mov ip, #0
	mov r6, #0x15
	mov lr, #3
	mov r3, #2
	mov r2, #1
	add r1, sp, #4
	mov r0, r4
	strb r6, [sp, #4]
	strb lr, [sp, #5]
	strb ip, [sp, #6]
	strb ip, [sp, #7]
	strb r3, [sp, #8]
	strb r2, [sp, #9]
	strb ip, [sp, #0xa]
	bl make_ciphertext
	mov r2, #0
	mov r1, r0
	add r0, sp, #4
	mov r3, r2
	str r5, [sp]
	bl Cpsi_TcpWrite2Raw
_022D2AFC:
	mov r0, #0
	strb r0, [r4, #0x455]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Cpsi_SslShutdown

	arm_func_start Cpsi_SslClose
Cpsi_SslClose: ; 0x022D2B0C
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xc]
	mov r0, #0
	strb r0, [r4, #0x455]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _022D2B34
	ldr r1, _022D2B40 ; =ov00_023250B8
	ldr r1, [r1]
	blx r1
_022D2B34:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D2B40: .word ov00_023250B8
	arm_func_end Cpsi_SslClose

	arm_func_start Cps_SetSsl
Cps_SetSsl: ; 0x022D2B44
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _022D2B6C ; =_02000C1C
	bl OSi_ReferSymbol
	ldr r0, _022D2B70 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	strneb r4, [r0, #9]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D2B6C: .word _02000C1C
_022D2B70: .word OSi_ThreadInfo
	arm_func_end Cps_SetSsl

	arm_func_start Cpsi_SslPeriodical
Cpsi_SslPeriodical: ; 0x022D2B74
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r4, #0
	ldr r6, _022D2C48 ; =ov00_02326AC8
	ldr r1, _022D2C4C ; =0x000003BD
	mov r2, r4
_022D2B90:
	ldrb r3, [r6, #0x5a]
	cmp r3, #0
	beq _022D2BAC
	ldr r3, [r6, #0x50]
	sub r3, r5, r3
	cmp r3, r1
	strgtb r2, [r6, #0x5a]
_022D2BAC:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _022D2B90
	bl SetIrqFlag
	ldr r0, _022D2C50 ; =OSi_ThreadInfo
	ldr r4, [r0, #8]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
_022D2BD4:
	ldr r1, [r4, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	ldrneb r0, [r1, #9]
	cmpne r0, #0
	beq _022D2C38
	ldrb r0, [r1, #8]
	cmp r0, #4
	bne _022D2C38
	ldr r0, [r1, #0xc]
	ldrb r0, [r0, #0x455]
	cmp r0, #8
	bhs _022D2C38
	ldr r0, [r1, #0x10]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _022D2C38
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _022D2C38
	strb r6, [r1, #8]
	str r6, [r1, #4]
	ldr r0, [r1]
	bl OS_WakeupThreadDirect
_022D2C38:
	ldr r4, [r4, #0x68]
	cmp r4, #0
	bne _022D2BD4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D2C48: .word ov00_02326AC8
_022D2C4C: .word 0x000003BD
_022D2C50: .word OSi_ThreadInfo
	arm_func_end Cpsi_SslPeriodical

	arm_func_start Cpsi_SslCleanup
Cpsi_SslCleanup: ; 0x022D2C54
	ldr ip, _022D2C68 ; =MI_CpuFill8
	ldr r0, _022D2C6C ; =ov00_02326AC8
	mov r1, #0
	mov r2, #0x170
	bx ip
	.align 2, 0
_022D2C68: .word MI_CpuFill8
_022D2C6C: .word ov00_02326AC8
	arm_func_end Cpsi_SslCleanup

	arm_func_start char_from_long_md5
char_from_long_md5: ; 0x022D2C70
	ldr ip, _022D2C84 ; =MI_CpuCopy8
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_022D2C84: .word MI_CpuCopy8
	arm_func_end char_from_long_md5

	arm_func_start long_from_char_md5
long_from_char_md5: ; 0x022D2C88
	ldr ip, _022D2C9C ; =MI_CpuCopy8
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_022D2C9C: .word MI_CpuCopy8
	arm_func_end long_from_char_md5

	arm_func_start Cpsi_Md5_Block
Cpsi_Md5_Block: ; 0x022D2CA0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #4
	mov r2, #0x40
	ldmia r3, {r4, r5, r6, r7}
	bl long_from_char_md5
	mov r3, #0
	ldr lr, _022D30B4 ; =ov00_02318934
	mov ip, r3
	add r2, sp, #4
_022D2CD0:
	ldr r1, _022D30B8 ; =ov00_023189B4
	ldrb r0, [lr]
	add sb, r1, r3, lsl #2
	eor r1, r6, r7
	and r8, r5, r1
	ldr r1, _022D30B8 ; =ov00_023189B4
	ldr r0, [r2, r0, lsl #2]
	ldr sl, [r1, r3, lsl #2]
	eor r1, r7, r8
	add r0, r1, r0
	add r0, sl, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x19
	orr r0, r0, r1, lsl #7
	ldrb r1, [lr, #1]
	add r4, r5, r0
	eor r0, r5, r6
	and r0, r4, r0
	ldr sl, [r2, r1, lsl #2]
	eor r0, r6, r0
	add r0, r0, sl
	ldr r8, [sb, #4]
	ldrb sl, [lr, #2]
	add r0, r8, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x14
	orr r0, r0, r7, lsl #12
	add r7, r4, r0
	eor r0, r4, r5
	and r0, r7, r0
	ldr r1, [sb, #8]
	ldrb fp, [lr, #3]
	ldr sl, [r2, sl, lsl #2]
	eor r0, r5, r0
	add r0, r0, sl
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0xf
	orr r1, r1, r6, lsl #17
	add ip, ip, #1
	eor r8, r7, r4
	add r6, r7, r1
	and r1, r6, r8
	ldr r0, [r2, fp, lsl #2]
	eor r1, r4, r1
	ldr sb, [sb, #0xc]
	add r0, r1, r0
	add r0, sb, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xa
	orr r0, r0, r1, lsl #22
	add lr, lr, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp ip, #4
	blt _022D2CD0
	ldr r0, _022D30B4 ; =ov00_02318934
	ldr lr, _022D30B8 ; =ov00_023189B4
	mov fp, #0
	add sl, r0, r3
	add sb, sp, #4
_022D2DC4:
	ldrb r0, [sl]
	add ip, lr, r3, lsl #2
	eor r1, r5, r6
	and r1, r7, r1
	ldr r8, [lr, r3, lsl #2]
	eor r1, r6, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r2, [ip, #4]
	add r0, r1, r0
	add r0, r8, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1b
	orr r1, r0, r1, lsl #5
	ldrb r0, [sl, #1]
	add r4, r5, r1
	eor r1, r4, r5
	and r1, r6, r1
	eor r1, r5, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r8, [ip, #8]
	add r0, r1, r0
	add r0, r2, r0
	add r2, r7, r0
	ldr r0, [ip, #0xc]
	mov r1, r2, lsr #0x17
	orr r1, r1, r2, lsl #9
	add r7, r4, r1
	eor r1, r7, r4
	and r1, r5, r1
	eor r2, r4, r1
	ldrb r1, [sl, #2]
	ldrb ip, [sl, #3]
	add sl, sl, #4
	ldr r1, [sb, r1, lsl #2]
	ldr ip, [sb, ip, lsl #2]
	add r1, r2, r1
	add r1, r8, r1
	add r2, r6, r1
	mov r1, r2, lsr #0x12
	orr r1, r1, r2, lsl #14
	add r6, r7, r1
	eor r1, r6, r7
	and r1, r4, r1
	eor r1, r7, r1
	add r1, r1, ip
	add r0, r0, r1
	add r1, r5, r0
	mov r0, r1, lsr #0xc
	orr r0, r0, r1, lsl #20
	add r5, r6, r0
	add r3, r3, #4
	add fp, fp, #1
	cmp fp, #4
	blt _022D2DC4
	ldr r0, _022D30B4 ; =ov00_02318934
	ldr r1, _022D30B8 ; =ov00_023189B4
	add r2, r0, r3
	mov r8, #0
	add r0, sp, #4
_022D2EB0:
	ldrb sb, [r2]
	add fp, r1, r3, lsl #2
	eor ip, r5, r6
	ldr sl, [r0, sb, lsl #2]
	eor ip, r7, ip
	ldr sb, [r1, r3, lsl #2]
	add sl, ip, sl
	add sb, sb, sl
	add sb, r4, sb
	mov r4, sb, lsr #0x1c
	ldrb sl, [r2, #1]
	orr r4, r4, sb, lsl #4
	add r4, r5, r4
	eor sb, r4, r5
	eor sb, r6, sb
	ldr ip, [r0, sl, lsl #2]
	ldr sl, [fp, #4]
	add sb, sb, ip
	add sb, sl, sb
	add sb, r7, sb
	mov r7, sb, lsr #0x15
	orr r7, r7, sb, lsl #11
	ldrb sb, [r2, #2]
	add r7, r4, r7
	ldr sl, [fp, #8]
	ldr ip, [r0, sb, lsl #2]
	ldr sb, [fp, #0xc]
	eor fp, r7, r4
	eor fp, r5, fp
	add fp, fp, ip
	add sl, sl, fp
	add sl, r6, sl
	mov r6, sl, lsr #0x10
	orr r6, r6, sl, lsl #16
	add r6, r7, r6
	eor sl, r6, r7
	eor fp, r4, sl
	ldrb sl, [r2, #3]
	add r2, r2, #4
	add r3, r3, #4
	ldr sl, [r0, sl, lsl #2]
	add r8, r8, #1
	add sl, fp, sl
	add sb, sb, sl
	add sb, r5, sb
	cmp r8, #4
	mov r5, sb, lsr #9
	orr r5, r5, sb, lsl #23
	add r5, r6, r5
	blt _022D2EB0
	ldr r0, _022D30B4 ; =ov00_02318934
	mov sb, #0
	add r8, r0, r3
	add r2, sp, #4
_022D2F88:
	ldr r1, _022D30B8 ; =ov00_023189B4
	ldrb r0, [r8]
	add fp, r1, r3, lsl #2
	mvn r1, r7
	orr sl, r5, r1
	ldr r1, _022D30B8 ; =ov00_023189B4
	ldr r0, [r2, r0, lsl #2]
	ldr ip, [r1, r3, lsl #2]
	eor r1, r6, sl
	add r0, r1, r0
	add r0, ip, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1a
	orr r0, r0, r1, lsl #6
	ldrb r1, [r8, #1]
	add r4, r5, r0
	mvn r0, r6
	orr r0, r4, r0
	ldr ip, [r2, r1, lsl #2]
	eor r0, r5, r0
	add r0, r0, ip
	ldr sl, [fp, #4]
	ldrb ip, [r8, #2]
	add r0, sl, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x16
	orr r0, r0, r7, lsl #10
	add r7, r4, r0
	mvn r0, r5
	orr r0, r7, r0
	ldr r1, [fp, #8]
	ldrb lr, [r8, #3]
	ldr ip, [r2, ip, lsl #2]
	eor r0, r4, r0
	add r0, r0, ip
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0x11
	orr r1, r1, r6, lsl #15
	add sb, sb, #1
	mvn sl, r4
	add r6, r7, r1
	orr r1, r6, sl
	ldr r0, [r2, lr, lsl #2]
	eor r1, r7, r1
	ldr fp, [fp, #0xc]
	add r0, r1, r0
	add r0, fp, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r8, r8, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp sb, #4
	blt _022D2F88
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r4
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #0xc]
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D30B4: .word ov00_02318934
_022D30B8: .word ov00_023189B4
	arm_func_end Cpsi_Md5_Block

	arm_func_start Cpsi_Md5_Init
Cpsi_Md5_Init: ; 0x022D30BC
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x58
	mov r4, r0
	bl MI_CpuFill8
	ldr r1, _022D30F4 ; =0x67452301
	ldr r0, _022D30F8 ; =0xEFCDAB89
	str r1, [r4]
	ldr r1, _022D30FC ; =0x98BADCFE
	str r0, [r4, #4]
	ldr r0, _022D3100 ; =0x10325476
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D30F4: .word 0x67452301
_022D30F8: .word 0xEFCDAB89
_022D30FC: .word 0x98BADCFE
_022D3100: .word 0x10325476
	arm_func_end Cpsi_Md5_Init

	arm_func_start Cpsi_Md5_Calc
Cpsi_Md5_Calc: ; 0x022D3104
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x10]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x10]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _022D31A0
	add r1, r8, #0x18
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl MI_CpuCopy8
	mov r0, r8
	add r1, r8, #0x18
	mov r4, #0
	bl Cpsi_Md5_Block
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _022D31A4
_022D3180:
	mov r0, r8
	add r1, r7, r5
	bl Cpsi_Md5_Block
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _022D3180
	b _022D31A4
_022D31A0:
	mov r5, #0
_022D31A4:
	add r1, r8, #0x18
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Cpsi_Md5_Calc

	arm_func_start Cpsi_Md5_Result
Cpsi_Md5_Result: ; 0x022D31BC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x10
	mov r2, #8
	bl char_from_long_md5
	ldr r0, [r5, #0x10]
	ldr r1, _022D3220 ; =ov00_02318974
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl Cpsi_Md5_Calc
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl Cpsi_Md5_Calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x10
	bl char_from_long_md5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D3220: .word ov00_02318974
	arm_func_end Cpsi_Md5_Result

	arm_func_start Cpsi_Sha1_Block_Helper
Cpsi_Sha1_Block_Helper: ; 0x022D3224
	add r2, r0, #0xd
	add ip, r0, #2
	and r3, r2, #0xf
	eor r2, r0, #8
	and ip, ip, #0xf
	ldr r3, [r1, r3, lsl #2]
	ldr r2, [r1, r2, lsl #2]
	ldr ip, [r1, ip, lsl #2]
	eor r2, r3, r2
	ldr r3, [r1, r0, lsl #2]
	eor r2, ip, r2
	eor r3, r3, r2
	mov r2, r3, lsr #0x1f
	orr r2, r2, r3, lsl #1
	str r2, [r1, r0, lsl #2]
	mov r0, r2
	bx lr
	arm_func_end Cpsi_Sha1_Block_Helper

	arm_func_start char_from_long_sha1
char_from_long_sha1: ; 0x022D3268
	stmdb sp!, {r3, lr}
	movs r2, r2, lsr #2
	mov lr, #0
	ldmeqia sp!, {r3, pc}
_022D3278:
	ldr ip, [r1], #4
	add lr, lr, #1
	mov r3, ip, lsr #0x18
	strb r3, [r0]
	mov r3, ip, lsr #0x10
	strb r3, [r0, #1]
	mov r3, ip, lsr #8
	strb r3, [r0, #2]
	strb ip, [r0, #3]
	cmp lr, r2
	add r0, r0, #4
	blo _022D3278
	ldmia sp!, {r3, pc}
	arm_func_end char_from_long_sha1

	arm_func_start long_from_char_sha1
long_from_char_sha1: ; 0x022D32AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_022D32BC:
	add r4, r1, r5
	ldrb r3, [r4, #1]
	ldrb ip, [r1, r5]
	ldrb lr, [r4, #2]
	mov r3, r3, lsl #0x10
	orr r3, r3, ip, lsl #24
	ldrb ip, [r4, #3]
	orr r3, r3, lr, lsl #8
	add r5, r5, #4
	orr r3, ip, r3
	cmp r5, r2
	str r3, [r0], #4
	blo _022D32BC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end long_from_char_sha1

	arm_func_start Cpsi_Sha1_Block
Cpsi_Sha1_Block: ; 0x022D32F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #0x10
	ldmia r3, {r4, r5, r7, r8, sb}
	mov r2, #0x40
	bl long_from_char_sha1
	mov r0, #0
	ldr r3, _022D396C ; =0x5A827999
	mov r2, r0
	add r1, sp, #0x10
_022D3324:
	eor r6, r7, r8
	mov sl, r4, lsr #0x1b
	and r6, r5, r6
	orr fp, sl, r4, lsl #5
	eor r6, r8, r6
	mov sl, r5, lsr #2
	orr sl, sl, r5, lsl #30
	add r5, r1, r0, lsl #2
	add r6, fp, r6
	ldr ip, [r1, r0, lsl #2]
	ldr fp, [r5, #4]
	add r6, ip, r6
	add r6, r6, r3
	add sb, sb, r6
	mov r6, sb, lsr #0x1b
	orr r6, r6, sb, lsl #5
	eor ip, sl, r7
	and ip, r4, ip
	eor ip, r7, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r8, r8, r6
	mov r6, r4, lsr #2
	orr r4, r6, r4, lsl #30
	ldr fp, [r5, #8]
	mov r6, r8, lsr #0x1b
	orr r6, r6, r8, lsl #5
	eor ip, r4, sl
	and ip, sb, ip
	eor ip, sl, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r6, r7, r6
	mov r7, sb, lsr #2
	orr sb, r7, sb, lsl #30
	ldr r7, [r5, #0xc]
	ldr fp, [r5, #0x10]
	mov r5, r6, lsr #0x1b
	orr r5, r5, r6, lsl #5
	eor ip, sb, r4
	and ip, r8, ip
	eor ip, r4, ip
	add r5, r5, ip
	add r5, r7, r5
	add r5, r5, r3
	add r5, sl, r5
	mov r7, r8, lsr #2
	orr r8, r7, r8, lsl #30
	mov r7, r5, lsr #0x1b
	orr r7, r7, r5, lsl #5
	eor sl, r8, sb
	and sl, r6, sl
	eor sl, sb, sl
	add r7, r7, sl
	add r7, fp, r7
	add r7, r7, r3
	add r4, r4, r7
	mov r7, r6, lsr #2
	orr r7, r7, r6, lsl #30
	add r0, r0, #5
	add r2, r2, #1
	cmp r2, #3
	blt _022D3324
	eor r0, r7, r8
	mov r2, r4, lsr #0x1b
	and r0, r5, r0
	orr r3, r2, r4, lsl #5
	eor r0, r8, r0
	add r3, r3, r0
	ldr r6, [sp, #0x4c]
	ldr r0, _022D396C ; =0x5A827999
	add r3, r6, r3
	add r3, r3, r0
	mov r2, r5, lsr #2
	orr r6, r2, r5, lsl #30
	mov r0, #0
	add sb, sb, r3
	bl Cpsi_Sha1_Block_Helper
	eor r1, r6, r7
	mov r3, sb, lsr #0x1b
	and r1, r4, r1
	mov r2, r4, lsr #2
	orr r3, r3, sb, lsl #5
	eor r1, r7, r1
	add r1, r3, r1
	add r3, r1, r0
	ldr r0, _022D396C ; =0x5A827999
	add r1, sp, #0x10
	add r3, r3, r0
	orr r5, r2, r4, lsl #30
	mov r0, #1
	add r8, r8, r3
	bl Cpsi_Sha1_Block_Helper
	eor r1, r5, r6
	mov r2, r8, lsr #0x1b
	and r1, sb, r1
	orr r2, r2, r8, lsl #5
	eor r1, r6, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _022D396C ; =0x5A827999
	mov r1, sb, lsr #2
	add r0, r2, r0
	orr sb, r1, sb, lsl #30
	add r7, r7, r0
	add r1, sp, #0x10
	mov r0, #2
	bl Cpsi_Sha1_Block_Helper
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, sb, r5
	and r1, r8, r1
	eor r1, r5, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _022D396C ; =0x5A827999
	mov r1, r8, lsr #2
	add r0, r2, r0
	orr r8, r1, r8, lsl #30
	add r6, r6, r0
	mov r0, #3
	add r1, sp, #0x10
	bl Cpsi_Sha1_Block_Helper
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r8, sb
	and r1, r7, r1
	eor r1, sb, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _022D396C ; =0x5A827999
	mov r1, r7, lsr #2
	add r0, r2, r0
	add r5, r5, r0
	mov r0, #0
	ldr r4, _022D3970 ; =0x6ED9EBA1
	orr r7, r1, r7, lsl #30
	mov sl, #4
	str r0, [sp, #4]
	add fp, sp, #0x10
_022D355C:
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #3
	blt _022D355C
	mov r0, #0
	ldr r4, _022D3974 ; =0x8F1BBCDC
	str r0, [sp, #8]
	add fp, sp, #0x10
_022D3690:
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	orr r2, r7, r8
	mov r1, r5, lsr #0x1b
	orr r1, r1, r5, lsl #5
	and r3, r6, r2
	and r2, r7, r8
	orr r2, r3, r2
	add r1, r1, r2
	add r1, r1, r0
	mov r0, r6, lsr #2
	add r1, r1, r4
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, sb, lsr #0x1b
	orr r1, r1, sb, lsl #5
	orr r2, r6, r7
	and r3, r5, r2
	and r2, r6, r7
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r8, lsr #0x1b
	orr r1, r1, r8, lsl #5
	orr r2, r5, r6
	and r3, sb, r2
	and r2, r5, r6
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r7, lsr #0x1b
	orr r1, r1, r7, lsl #5
	orr r2, sb, r5
	and r3, r8, r2
	and r2, sb, r5
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r6, lsr #0x1b
	orr r1, r1, r6, lsl #5
	orr r2, r8, sb
	and r3, r7, r2
	and r2, r8, sb
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #2
	blt _022D3690
	mov r0, #0
	ldr r4, _022D3978 ; =0xCA62C1D6
	str r0, [sp, #0xc]
	add fp, sp, #0x10
_022D37EC:
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #4
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl Cpsi_Sha1_Block_Helper
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #1
	blt _022D37EC
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r8
	ldr r0, [sp]
	str r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	add r1, r0, sb
	ldr r0, [sp]
	str r1, [r0, #0x10]
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D396C: .word 0x5A827999
_022D3970: .word 0x6ED9EBA1
_022D3974: .word 0x8F1BBCDC
_022D3978: .word 0xCA62C1D6
	arm_func_end Cpsi_Sha1_Block

	arm_func_start Cpsi_Sha1_Init
Cpsi_Sha1_Init: ; 0x022D397C
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl MI_CpuFill8
	ldr r0, _022D39BC ; =0x67452301
	ldr r1, _022D39C0 ; =0xEFCDAB89
	str r0, [r4]
	ldr r0, _022D39C4 ; =0x98BADCFE
	str r1, [r4, #4]
	ldr r1, _022D39C8 ; =0x10325476
	str r0, [r4, #8]
	ldr r0, _022D39CC ; =0xC3D2E1F0
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D39BC: .word 0x67452301
_022D39C0: .word 0xEFCDAB89
_022D39C4: .word 0x98BADCFE
_022D39C8: .word 0x10325476
_022D39CC: .word 0xC3D2E1F0
	arm_func_end Cpsi_Sha1_Init

	arm_func_start Cpsi_Sha1_Calc
Cpsi_Sha1_Calc: ; 0x022D39D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x18]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x18]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _022D3A6C
	add r1, r8, #0x1c
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl MI_CpuCopy8
	mov r0, r8
	add r1, r8, #0x1c
	mov r4, #0
	bl Cpsi_Sha1_Block
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _022D3A70
_022D3A4C:
	mov r0, r8
	add r1, r7, r5
	bl Cpsi_Sha1_Block
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _022D3A4C
	b _022D3A70
_022D3A6C:
	mov r5, #0
_022D3A70:
	add r1, r8, #0x1c
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Cpsi_Sha1_Calc

	arm_func_start Cpsi_Sha1_Result
Cpsi_Sha1_Result: ; 0x022D3A88
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x14
	mov r2, #8
	bl char_from_long_sha1
	ldr r0, [r5, #0x18]
	ldr r1, _022D3AEC ; =ov00_02318AB4
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl Cpsi_Sha1_Calc
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl Cpsi_Sha1_Calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl char_from_long_sha1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D3AEC: .word ov00_02318AB4
	arm_func_end Cpsi_Sha1_Result

	arm_func_start Cpsi_Sha1_Result_Prng
Cpsi_Sha1_Result_Prng: ; 0x022D3AF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, _022D3B1C ; =ov00_02318AB5
	mov r5, r0
	mov r2, #0x2c
	bl Cpsi_Sha1_Calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl char_from_long_sha1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D3B1C: .word ov00_02318AB5
	arm_func_end Cpsi_Sha1_Result_Prng

	arm_func_start Cpsi_Rc4_Init
Cpsi_Rc4_Init: ; 0x022D3B20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r3, #0
	strb r3, [r0]
	strb r3, [r0, #1]
	add r4, r0, #2
_022D3B34:
	strb r3, [r4, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _022D3B34
	mov r6, #0
	mov r5, r6
	mov r7, r6
	mov r0, r6
_022D3B54:
	ldrb lr, [r4, r7]
	ldrb ip, [r1, r6]
	add r3, r6, #1
	and r6, r3, #0xff
	add r3, lr, ip
	add r3, r5, r3
	and r5, r3, #0xff
	ldrb r3, [r4, r5]
	cmp r6, r2
	movge r6, r0
	strb r3, [r4, r7]
	add r7, r7, #1
	strb lr, [r4, r5]
	cmp r7, #0x100
	blt _022D3B54
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Cpsi_Rc4_Init

	arm_func_start Cpsi_Rc4_Crypt
Cpsi_Rc4_Crypt: ; 0x022D3B94
	stmdb sp!, {r4, r5, r6, lr}
	cmp r2, #0
	add r4, r0, #2
	ldrb ip, [r0]
	ldrb lr, [r0, #1]
	mov r3, #0
	ble _022D3BF4
_022D3BB0:
	add r5, ip, #1
	and ip, r5, #0xff
	ldrb r6, [r4, ip]
	add r5, lr, r6
	and lr, r5, #0xff
	ldrb r5, [r4, lr]
	strb r5, [r4, ip]
	add r5, r6, r5
	strb r6, [r4, lr]
	and r5, r5, #0xff
	ldrb r6, [r1, r3]
	ldrb r5, [r4, r5]
	eor r5, r6, r5
	strb r5, [r1, r3]
	add r3, r3, #1
	cmp r3, r2
	blt _022D3BB0
_022D3BF4:
	strb ip, [r0]
	strb lr, [r0, #1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Cpsi_Rc4_Crypt

	arm_func_start count_digits
count_digits: ; 0x022D3C00
	b _022D3C08
_022D3C04:
	sub r1, r1, #1
	arm_func_end count_digits
_022D3C08:
	cmp r1, #0
	beq _022D3C20
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #-2]
	cmp r2, #0
	beq _022D3C04
_022D3C20:
	mov r0, r1
	bx lr

	arm_func_start Cpsi_Big_Sign
Cpsi_Big_Sign: ; 0x022D3C28
	stmdb sp!, {r3, lr}
	sub r2, r1, #1
	mov r2, r2, lsl #1
	ldrh r2, [r0, r2]
	tst r2, #0x8000
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	bl count_digits
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Cpsi_Big_Sign

	arm_func_start Cpsi_Big_Add
Cpsi_Big_Add: ; 0x022D3C58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl count_digits
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl count_digits
	cmp r4, r0
	movlt r4, r0
	cmp r4, r5
	addne r4, r4, #1
	mov ip, #0
	mov r3, ip
	cmp r4, #0
	ble _022D3CD0
_022D3CA8:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	cmp r3, r4
	add r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, lsr #0x10
	blt _022D3CA8
_022D3CD0:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Cpsi_Big_Add

	arm_func_start Cpsi_Big_Add_Small
Cpsi_Big_Add_Small: ; 0x022D3CF4
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _022D3D28
_022D3D04:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	add r2, r2, ip
	strh r2, [r0, lr]
	movs r2, r2, lsr #0x10
	beq _022D3D28
	add r4, r4, #1
	cmp r4, r3
	blt _022D3D04
_022D3D28:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_022D3D3C:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _022D3D3C
	ldmia sp!, {r4, pc}
	arm_func_end Cpsi_Big_Add_Small

	arm_func_start Cpsi_Big_Negate
Cpsi_Big_Negate: ; 0x022D3D58
	stmdb sp!, {r3, lr}
	mov r3, r1
	cmp r3, #0
	mov ip, #0
	ble _022D3D88
_022D3D6C:
	mov r2, ip, lsl #1
	ldrh r1, [r0, r2]
	add ip, ip, #1
	cmp ip, r3
	mvn r1, r1
	strh r1, [r0, r2]
	blt _022D3D6C
_022D3D88:
	mov r1, r0
	mov r2, #1
	bl Cpsi_Big_Add_Small
	ldmia sp!, {r3, pc}
	arm_func_end Cpsi_Big_Negate

	arm_func_start Cpsi_Big_Sub
Cpsi_Big_Sub: ; 0x022D3D98
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl count_digits
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl count_digits
	cmp r4, r0
	movlt r4, r0
	mov ip, #0
	cmp r4, r5
	addne r4, r4, #1
	mov r3, ip
	b _022D3E04
_022D3DE4:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	sub r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, asr #0x10
_022D3E04:
	cmp r3, r4
	blt _022D3DE4
	cmp r3, r5
	bge _022D3E1C
	cmp ip, #0
	bne _022D3DE4
_022D3E1C:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Cpsi_Big_Sub

	arm_func_start Cpsi_Big_Sub_Small
Cpsi_Big_Sub_Small: ; 0x022D3E40
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _022D3E78
_022D3E50:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	sub ip, ip, r2
	mov r2, ip, lsr #0x10
	strh ip, [r0, lr]
	ands r2, r2, #1
	beq _022D3E78
	add r4, r4, #1
	cmp r4, r3
	blt _022D3E50
_022D3E78:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_022D3E8C:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _022D3E8C
	ldmia sp!, {r4, pc}
	arm_func_end Cpsi_Big_Sub_Small

	arm_func_start Cpsi_Big_Compare
Cpsi_Big_Compare: ; 0x022D3EA8
	subs ip, r2, #1
	bmi _022D3ED8
_022D3EB0:
	mov r2, ip, lsl #1
	ldrh r3, [r1, r2]
	ldrh r2, [r0, r2]
	cmp r2, r3
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	subs ip, ip, #1
	bpl _022D3EB0
_022D3ED8:
	mov r0, #0
	bx lr
	arm_func_end Cpsi_Big_Compare

	arm_func_start Cpsi_Big_Add_Part
Cpsi_Big_Add_Part: ; 0x022D3EE0
	stmdb sp!, {r3, lr}
	b _022D3F00
_022D3EE8:
	mov lr, r2, lsl #1
	ldrh ip, [r0, lr]
	add r2, r2, #1
	add r1, r1, ip
	strh r1, [r0, lr]
	mov r1, r1, lsr #0x10
_022D3F00:
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, r3
	blt _022D3EE8
	ldmia sp!, {r3, pc}
	arm_func_end Cpsi_Big_Add_Part

	arm_func_start Cpsi_Big_Mult
Cpsi_Big_Mult: ; 0x022D3F14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r8, r3
	mov sl, r1
	mov sb, r2
	mov r2, r8, lsl #1
	mov r1, #0
	str r0, [sp]
	bl MI_CpuFill8
	mov r0, sl
	mov r1, r8
	bl count_digits
	mov fp, r0
	mov r0, sb
	mov r1, r8
	bl count_digits
	str r0, [sp, #4]
	cmp r0, #0
	mov r5, #0
	addle sp, sp, #8
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D3F68:
	mov r6, #0
	sub r7, r8, r5
	mov r4, r5, lsl #1
	b _022D3F9C
_022D3F78:
	mov r0, r6, lsl #1
	ldrh r3, [sl, r0]
	ldrh r1, [sb, r4]
	ldr r0, [sp]
	add r2, r5, r6
	mul r1, r3, r1
	mov r3, r8
	bl Cpsi_Big_Add_Part
	add r6, r6, #1
_022D3F9C:
	cmp r6, fp
	cmplt r6, r7
	blt _022D3F78
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _022D3F68
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Cpsi_Big_Mult

	arm_func_start Cpsi_Big_Mult_Small
Cpsi_Big_Mult_Small: ; 0x022D3FC0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, r3
	mov r7, r0
	mov r0, r6
	mov r1, r4
	mov r5, r2
	bl count_digits
	mov r3, #0
	mov ip, r3
	cmp r0, #0
	ble _022D4010
_022D3FF0:
	mov r2, ip, lsl #1
	ldrh r1, [r6, r2]
	add ip, ip, #1
	cmp ip, r0
	mla r1, r5, r1, r3
	strh r1, [r7, r2]
	mov r3, r1, lsr #0x10
	blt _022D3FF0
_022D4010:
	cmp ip, r4
	movlt r0, ip, lsl #1
	addlt ip, ip, #1
	sub r1, r4, ip
	strlth r3, [r7, r0]
	mov r2, r1, lsl #1
	add r0, r7, ip, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Cpsi_Big_Mult_Small

	arm_func_start Cpsi_Big_Sqr
Cpsi_Big_Sqr: ; 0x022D4038
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl count_digits
	mov fp, r0
	cmp r8, fp, lsl #1
	mov r0, fp, lsl #1
	ble _022D4078
	sub r1, r8, r0
	add r0, sl, r0, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
_022D4078:
	cmp fp, #0
	mov r4, #0
	ble _022D40CC
	mov r5, r4
	sub r2, r8, #1
_022D408C:
	cmp r5, r8
	bge _022D40CC
	mov r0, r4, lsl #1
	ldrh r3, [sb, r0]
	mov r0, r5, lsl #1
	cmp r5, r2
	mul r1, r3, r3
	strh r1, [sl, r0]
	beq _022D40CC
	add r4, r4, #1
	mov r1, r1, lsr #0x10
	add r0, sl, r0
	strh r1, [r0, #2]
	cmp r4, fp
	add r5, r5, #2
	blt _022D408C
_022D40CC:
	mov r6, #0
	cmp fp, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022D40D8:
	mov r0, r6, lsl #1
	add r4, r6, #1
	str r0, [sp]
	b _022D4148
_022D40E8:
	mov r0, r4, lsl #1
	ldrh r1, [sb, r0]
	ldr r0, [sp]
	ldrh r0, [sb, r0]
	mul r7, r1, r0
	ldr r0, _022D4168 ; =0x7FFF8000
	cmp r7, r0
	mov r0, sl
	bhi _022D4120
	mov r2, r5
	mov r3, r8
	mov r1, r7, lsl #1
	bl Cpsi_Big_Add_Part
	b _022D4144
_022D4120:
	mov r1, r7
	mov r2, r5
	mov r3, r8
	bl Cpsi_Big_Add_Part
	mov r1, r7
	mov r2, r5
	mov r0, sl
	mov r3, r8
	bl Cpsi_Big_Add_Part
_022D4144:
	add r4, r4, #1
_022D4148:
	cmp r4, fp
	addlt r5, r6, r4
	cmplt r5, r8
	blt _022D40E8
	add r6, r6, #1
	cmp r6, fp
	blt _022D40D8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D4168: .word 0x7FFF8000
	arm_func_end Cpsi_Big_Sqr

	arm_func_start get48bits_1
get48bits_1: ; 0x022D416C
	ldrh r1, [r0]
	mov r0, #0
	bx lr
	arm_func_end get48bits_1

	arm_func_start get48bits_2
get48bits_2: ; 0x022D4178
	ldrh r1, [r0]
	ldrh r0, [r0, #-2]
	mov r0, r0, lsl #0x10
	bx lr
	arm_func_end get48bits_2

	arm_func_start get48bits_3
get48bits_3: ; 0x022D4188
	ldrh r1, [r0]
	ldrh r2, [r0, #-2]
	ldrh r3, [r0, #-4]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end get48bits_3

	arm_func_start get64bits
get64bits: ; 0x022D419C
	ldrh r2, [r0]
	ldrh r3, [r0, #-2]
	orr r1, r3, r2, lsl #16
	ldrh r2, [r0, #-4]
	ldrh r3, [r0, #-6]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end get64bits

	arm_func_start Cpsi_Big_Div
Cpsi_Big_Div: ; 0x022D41B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, [sp, #0x48]
	ldr r8, [sp, #0x4c]
	str r1, [sp, #4]
	add r6, r8, sb, lsl #1
	str r0, [sp]
	mov sl, r2
	mov r0, r6
	mov r2, sb, lsl #2
	mov r1, #0
	str r3, [sp, #8]
	add r7, r6, sb, lsl #1
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	mov r1, sb
	bl count_digits
	mov fp, r0
	mov r0, sl
	mov r1, sb
	bl count_digits
	mov r5, r0
	cmp fp, #0
	cmpgt r5, #0
	ble _022D4350
	sub r0, sb, fp
	add r0, r5, r0
	sub r4, r0, #1
	cmp r4, sb
	blt _022D4244
	ldr r0, [sp, #4]
	mov r1, r7
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
	b _022D4350
_022D4244:
	ldr r0, [sp, #4]
	add r1, r6, r4, lsl #1
	mov r2, fp, lsl #1
	bl MI_CpuCopy8
	cmp r5, #2
	ble _022D4278
	add r0, sl, r5, lsl #1
	sub r0, r0, #2
	mov fp, r5, lsl #1
	bl get48bits_3
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _022D42AC
_022D4278:
	add r0, sl, r5, lsl #1
	cmp r5, #1
	sub r0, r0, #2
	ble _022D429C
	mov fp, r5, lsl #1
	bl get48bits_2
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _022D42AC
_022D429C:
	mov fp, r5, lsl #1
	bl get48bits_1
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
_022D42AC:
	cmp r4, sb
	bge _022D4350
	mov r0, sb, lsl #1
	sub r0, r0, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x14]
_022D42C4:
	ldr r2, [sp, #0x14]
	mov r1, r6
	add r0, r6, #2
	bl memmove
	add r0, r7, fp
	bl get64bits
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x10]
	bl _ll_udiv
	mov r5, r0
	ldr r0, _022D4394 ; =0x0000FFFF
	cmp r5, r0
	movhi r5, r0
_022D42F8:
	mov r2, r5, lsl #0x10
	mov r0, r8
	mov r1, sl
	mov r2, r2, lsr #0x10
	mov r3, sb
	bl Cpsi_Big_Mult_Small
	mov r0, r7
	mov r1, r8
	mov r2, sb
	bl Cpsi_Big_Compare
	cmp r0, #0
	sublt r5, r5, #1
	blt _022D42F8
	mov r0, r7
	mov r1, r7
	mov r2, r8
	mov r3, sb
	bl Cpsi_Big_Sub
	strh r5, [r6]
	add r4, r4, #1
	cmp r4, sb
	blt _022D42C4
_022D4350:
	ldr r0, [sp]
	cmp r0, #0
	beq _022D436C
	ldr r1, [sp]
	mov r0, r6
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
_022D436C:
	ldr r0, [sp, #8]
	cmp r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #8]
	mov r0, r7
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D4394: .word 0x0000FFFF
	arm_func_end Cpsi_Big_Div

	arm_func_start Cpsi_Big_Power
Cpsi_Big_Power: ; 0x022D4398
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _022D4524 ; =ov00_0232508C
	mov r8, r3
	ldr r3, [r4]
	mov sl, r0
	mov r0, r8, lsl #3
	ldr r7, [sp, #0x30]
	str r1, [sp, #8]
	mov sb, r2
	blx r3
	movs r4, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	sub r1, r8, #1
	add r0, sl, #2
	mov r2, r1, lsl #1
	mov r1, #0
	add r5, r4, r8, lsl #1
	bl MI_CpuFill8
	mov r2, #1
	mov r0, sb
	mov r1, r8
	strh r2, [sl]
	bl count_digits
	sub r0, r8, r0
	mov r6, r0, lsl #4
	cmp r6, r8, lsl #4
	bhs _022D444C
	mov r2, #0x8000
_022D4410:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r0, [r0, #-2]
	and r1, r6, #0xf
	tst r0, r2, lsr r1
	beq _022D4440
	ldr r0, [sp, #8]
	mov r1, sl
	mov r2, r8, lsl #1
	bl MI_CpuCopy8
	add r6, r6, #1
	b _022D444C
_022D4440:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _022D4410
_022D444C:
	cmp r6, r8, lsl #4
	bhs _022D450C
	mov fp, r8, lsl #1
_022D4458:
	mov r0, r4
	mov r1, sl
	mov r2, r8
	bl Cpsi_Big_Sqr
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl MI_CpuCopy8
	cmp r7, #0
	beq _022D449C
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl Cpsi_Big_Div
_022D449C:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r1, [r0, #-2]
	and r2, r6, #0xf
	mov r0, #0x8000
	tst r1, r0, lsr r2
	beq _022D4500
	ldr r2, [sp, #8]
	mov r0, r4
	mov r1, sl
	mov r3, r8
	bl Cpsi_Big_Mult
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl MI_CpuCopy8
	cmp r7, #0
	beq _022D4500
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl Cpsi_Big_Div
_022D4500:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _022D4458
_022D450C:
	ldr r1, _022D4528 ; =ov00_023250B8
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D4524: .word ov00_0232508C
_022D4528: .word ov00_023250B8
	arm_func_end Cpsi_Big_Power

	arm_func_start Cpsi_Big_Modinv
Cpsi_Big_Modinv: ; 0x022D452C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr sb, [sp, #0x38]
	mov sl, r3
	add fp, sb, sl, lsl #1
	add r4, fp, sl, lsl #1
	add r5, r4, sl, lsl #1
	add r6, r5, sl, lsl #1
	add r7, r6, sl, lsl #1
	str r0, [sp, #8]
	mov r0, r1
	add r1, r7, sl, lsl #1
	str r1, [sp, #0x10]
	mov r8, sl, lsl #1
	str r2, [sp, #0xc]
	mov r1, sb
	mov r2, r8
	bl MI_CpuCopy8
	ldr r0, [sp, #0xc]
	mov r1, r4
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, #1
	strh r0, [r4, r8]
	mov r0, sb
	mov r1, sl
	bl Cpsi_Big_Sign
	cmp r0, #0
	ble _022D463C
_022D45A0:
	ldr r3, [sp, #0x10]
	str sl, [sp]
	str r3, [sp, #4]
	mov r0, fp
	mov r1, r4
	mov r2, sb
	mov r3, r7
	bl Cpsi_Big_Div
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, sb
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, fp
	mov r2, r5
	mov r3, sl
	bl Cpsi_Big_Mult
	mov r0, r7
	mov r1, r6
	mov r2, r7
	mov r3, sl
	bl Cpsi_Big_Sub
	mov r0, r5
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, r5
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, sb
	mov r1, sl
	bl Cpsi_Big_Sign
	cmp r0, #0
	bgt _022D45A0
_022D463C:
	ldr r2, [sp, #0xc]
	mov r0, r6
	mov r1, r6
	mov r3, sl
	bl Cpsi_Big_Add
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	ldr r4, [sp, #0x10]
	str sl, [sp]
	mov r1, r6
	mov r0, #0
	str r4, [sp, #4]
	bl Cpsi_Big_Div
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Cpsi_Big_Modinv

	arm_func_start Cpsi_Big_Montmult
Cpsi_Big_Montmult: ; 0x022D4678
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r4, r6, lsl #1
	mov r8, r2
	mov r2, r4
	mov r7, r0
	mov sb, r1
	ldr r5, [sp, #0x20]
	bl MI_CpuCopy8
	cmp r8, #1
	bne _022D46B8
	mov r0, r7
	mov r1, sb
	mov r2, r6
	bl Cpsi_Big_Sqr
	b _022D46D4
_022D46B8:
	cmp r8, #0
	beq _022D46D4
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, r6
	bl Cpsi_Big_Mult
_022D46D4:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	mov r1, r7
	mov r3, r5
	bl Cpsi_Big_Mult
	sub r1, r6, r5
	ldr r0, [sp, #0x2c]
	mov r8, r1, lsl #1
	mov r2, r8
	add r0, r0, r5, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	mov r3, r6
	bl Cpsi_Big_Mult
	mov r0, r7
	mov r1, r7
	ldr r2, [sp, #0x30]
	mov r3, r6
	bl Cpsi_Big_Add
	mov r2, r8
	mov r0, r7
	add r1, r7, r5, lsl #1
	bl memmove
	add r0, r7, r6, lsl #1
	sub r0, r0, r5, lsl #1
	mov r2, r5, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	mov r0, r7
	ldr r1, [sp, #0x24]
	mov r2, r6
	bl Cpsi_Big_Compare
	cmp r0, #0
	beq _022D4774
	cmp r0, #1
	beq _022D4788
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D4774:
	mov r0, r7
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D4788:
	ldr r2, [sp, #0x24]
	mov r0, r7
	mov r1, r7
	mov r3, r6
	bl Cpsi_Big_Sub
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Cpsi_Big_Montmult

	arm_func_start Cpsi_Big_Montpower
Cpsi_Big_Montpower: ; 0x022D47A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r3
	mov r3, #0x16
	mul r4, sl, r3
	ldr r3, _022D49A4 ; =ov00_0232508C
	mov fp, r0
	ldr r3, [r3]
	mov r0, r4
	ldr sb, [sp, #0x50]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	blx r3
	str r0, [sp, #0x28]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x28]
	mov r1, sl
	add r6, r0, sl, lsl #1
	add r0, r6, sl, lsl #1
	add r7, r0, sl, lsl #1
	add r8, r7, sl, lsl #1
	str r0, [sp, #0x24]
	add r0, r8, sl, lsl #1
	str r0, [sp, #0x20]
	add r5, r0, sl, lsl #1
	mov r0, sb
	bl count_digits
	mov r4, r0
	ldr r0, [sp, #0x28]
	mov r2, #1
	mov r1, r4, lsl #1
	strh r2, [r0, r1]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp]
	mov r0, r6
	mov r2, sb
	mov r3, sl
	bl Cpsi_Big_Modinv
	ldr r1, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r3, sl
	bl Cpsi_Big_Mult
	mov r0, r6
	mov r1, r7
	mov r2, #1
	mov r3, sl
	bl Cpsi_Big_Sub_Small
	str sl, [sp]
	mov r0, r6
	mov r1, r6
	mov r2, sb
	mov r3, #0
	str r5, [sp, #4]
	bl Cpsi_Big_Div
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	mov r3, sl
	bl Cpsi_Big_Mult
	ldr r1, [sp, #0x24]
	str sl, [sp]
	mov r0, #0
	mov r2, sb
	mov r3, r1
	str r5, [sp, #4]
	bl Cpsi_Big_Div
	str sl, [sp]
	ldr r1, [sp, #0x28]
	mov r0, #0
	mov r2, sb
	mov r3, fp
	str r5, [sp, #4]
	bl Cpsi_Big_Div
	movs r0, r4, lsl #4
	mov r5, #0
	str r0, [sp, #0x1c]
	beq _022D4968
_022D48F0:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r2, #1
	mov r3, sl
	str r8, [sp, #0x10]
	bl Cpsi_Big_Montmult
	ldr r1, [sp, #0x18]
	sub r2, r4, r5, asr #4
	add r1, r1, r2, lsl #1
	ldrh r2, [r1, #-2]
	and r0, r5, #0xf
	mov r1, #0x8000
	tst r2, r1, lsr r0
	beq _022D4958
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	mov r0, fp
	mov r3, sl
	str r8, [sp, #0x10]
	bl Cpsi_Big_Montmult
_022D4958:
	ldr r0, [sp, #0x1c]
	add r5, r5, #1
	cmp r5, r0
	blo _022D48F0
_022D4968:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r3, sl
	mov r2, #0
	str r8, [sp, #0x10]
	bl Cpsi_Big_Montmult
	ldr r1, _022D49A8 ; =ov00_023250B8
	ldr r0, [sp, #0x28]
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022D49A4: .word ov00_0232508C
_022D49A8: .word ov00_023250B8
	arm_func_end Cpsi_Big_Montpower

	arm_func_start Cpsi_Big_From_Char
Cpsi_Big_From_Char: ; 0x022D49AC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r2, r3, lsl #1
	mov r1, #0
	mov r4, r0
	bl MI_CpuFill8
	sub r0, r5, #1
	cmp r5, #1
	add r6, r6, r0
	ble _022D49F8
_022D49D8:
	ldrb r1, [r6]
	ldrb r0, [r6, #-1]
	sub r5, r5, #2
	cmp r5, #1
	add r0, r1, r0, lsl #8
	strh r0, [r4], #2
	sub r6, r6, #2
	bgt _022D49D8
_022D49F8:
	cmp r5, #0
	ldrgtb r0, [r6]
	strgth r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Cpsi_Big_From_Char

	arm_func_start Cpsi_Char_From_Big
Cpsi_Char_From_Big: ; 0x022D4A08
	sub r3, r2, #1
	cmp r2, #1
	add r0, r0, r3
	ble _022D4A3C
_022D4A18:
	ldrh r3, [r1]
	sub ip, r0, #1
	sub r2, r2, #2
	strb r3, [r0], #-2
	ldrh r3, [r1], #2
	cmp r2, #1
	mov r3, r3, asr #8
	strb r3, [ip]
	bgt _022D4A18
_022D4A3C:
	cmp r2, #0
	ldrgth r1, [r1]
	strgtb r1, [r0]
	bx lr
	arm_func_end Cpsi_Char_From_Big

	arm_func_start MD5Init_Ghi
MD5Init_Ghi: ; 0x022D4A4C
	ldr ip, _022D4A54 ; =MD5_Init
	bx ip
	.align 2, 0
_022D4A54: .word MD5_Init
	arm_func_end MD5Init_Ghi

	arm_func_start MD5Update_Ghi
MD5Update_Ghi: ; 0x022D4A58
	ldr ip, _022D4A60 ; =MD5_Update
	bx ip
	.align 2, 0
_022D4A60: .word MD5_Update
	arm_func_end MD5Update_Ghi

	arm_func_start MD5Final_Ghi
MD5Final_Ghi: ; 0x022D4A64
	ldr ip, _022D4A6C ; =MD5_Digest
	bx ip
	.align 2, 0
_022D4A6C: .word MD5_Digest
	arm_func_end MD5Final_Ghi

	arm_func_start Wcm_Init
Wcm_Init: ; 0x022D4A70
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r2, _022D4B84 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _022D4AA0
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4AA0:
	cmp r6, #0
	bne _022D4AB4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4AB4:
	tst r6, #0x1f
	beq _022D4AC8
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4AC8:
	cmp r5, #0x2300
	bhs _022D4ADC
	bl SetIrqFlag
	mov r0, #6
	ldmia sp!, {r4, r5, r6, pc}
_022D4ADC:
	str r6, [r2]
	add r0, r6, #0x2000
	mov r1, #1
	str r1, [r0, #0x260]
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x2200
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x68]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26a]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0xf8]
	bl WcmInitOption
	bl Wcmi_InitCpsif
	bl OS_IsTickAvailable
	cmp r0, #0
	bne _022D4B50
	bl OS_InitTick
_022D4B50:
	bl OS_IsAlarmAvailable
	cmp r0, #0
	bne _022D4B60
	bl OS_InitAlarm
_022D4B60:
	ldr r0, _022D4B84 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl OS_CreateAlarm
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D4B84: .word ov00_02326C4C
	arm_func_end Wcm_Init

	arm_func_start Wcm_Finish
Wcm_Finish: ; 0x022D4B88
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r2, _022D4BDC ; =ov00_02326C4C
	ldr r1, [r2]
	cmp r1, #0
	bne _022D4BAC
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, pc}
_022D4BAC:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _022D4BC8
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, pc}
_022D4BC8:
	mov r1, #0
	str r1, [r2]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D4BDC: .word ov00_02326C4C
	arm_func_end Wcm_Finish

	arm_func_start Wcm_StartupAsync
Wcm_StartupAsync: ; 0x022D4BE0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _022D4DD8 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D4C10
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4C10:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _022D4C34
	cmp r1, #2
	beq _022D4C44
	cmp r1, #3
	beq _022D4C50
	b _022D4C5C
_022D4C34:
	mov r0, r6
	mov r1, r5
	bl WcmConfigure
	b _022D4C68
_022D4C44:
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_022D4C50:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022D4C5C:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4C68:
	ldr r0, _022D4DD8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldr r1, [r1, #0x26c]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl WM_Init
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022D4CD4
_022D4C90: ; jump table
	b _022D4CEC ; case 0
	b _022D4CD4 ; case 1
	b _022D4CD4 ; case 2
	b _022D4CAC ; case 3
	b _022D4CC4 ; case 4
	b _022D4CD4 ; case 5
	b _022D4CD4 ; case 6
_022D4CAC:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022D4CC4:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_022D4CD4:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022D4CEC:
	bl WM_GetAllowedChannel
	cmp r0, #0
	bne _022D4D2C
	bl WM_Finish
	cmp r0, #0
	beq _022D4D1C
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022D4D1C:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_022D4D2C:
	ldr r0, _022D4DDC ; =WcmWmcbIndication
	bl WM_SetIndCallback
	cmp r0, #0
	beq _022D4D54
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022D4D54:
	ldr r0, _022D4DE0 ; =WcmWmcbCommon
	bl WM_Enable
	cmp r0, #2
	beq _022D4D78
	cmp r0, #3
	beq _022D4DB0
	cmp r0, #8
	beq _022D4D98
	b _022D4DB0
_022D4D78:
	mov r0, #2
	bl WcmSetPhase
	ldr r0, _022D4DD8 ; =ov00_02326C4C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D4DC8
_022D4D98:
	mov r0, #0xc
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_022D4DB0:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_022D4DC8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D4DD8: .word ov00_02326C4C
_022D4DDC: .word WcmWmcbIndication
_022D4DE0: .word WcmWmcbCommon
	arm_func_end Wcm_StartupAsync

	arm_func_start Wcm_CleanupAsync
Wcm_CleanupAsync: ; 0x022D4DE4
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022D4ECC ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D4E0C
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D4E0C:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _022D4E38
	cmp r1, #3
	beq _022D4E50
	cmp r1, #4
	bne _022D4E44
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r4, pc}
_022D4E38:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
_022D4E44:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D4E50:
	ldr r0, _022D4ED0 ; =WcmWmcbCommon
	bl WM_PowerOff
	cmp r0, #2
	beq _022D4E74
	cmp r0, #3
	beq _022D4EA4
	cmp r0, #8
	beq _022D4E94
	b _022D4EA4
_022D4E74:
	mov r0, #4
	bl WcmSetPhase
	ldr r0, _022D4ECC ; =ov00_02326C4C
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D4EBC
_022D4E94:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r4, pc}
_022D4EA4:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, pc}
_022D4EBC:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D4ECC: .word ov00_02326C4C
_022D4ED0: .word WcmWmcbCommon
	arm_func_end Wcm_CleanupAsync

	arm_func_start Wcm_SearchAsync
Wcm_SearchAsync: ; 0x022D4ED4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	cmpne r1, #0
	bne _022D4EEC
	bl Wcm_EndSearchAsync
	ldmia sp!, {r3, pc}
_022D4EEC:
	bl Wcm_BeginSearchAsync
	ldmia sp!, {r3, pc}
	arm_func_end Wcm_SearchAsync

	arm_func_start Wcm_BeginSearchAsync
Wcm_BeginSearchAsync: ; 0x022D4EF4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r1, _022D5064 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D4F28
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D4F28:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _022D4F98
	cmp r1, #5
	beq _022D4F4C
	cmp r1, #6
	beq _022D4F6C
	b _022D4F8C
_022D4F4C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	mov r0, r4
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D4F6C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D4F8C:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D4F98:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	ldr r0, _022D5064 ; =ov00_02326C4C
	ldr r0, [r0]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldr r2, _022D5064 ; =ov00_02326C4C
	ldr r0, _022D5068 ; =WcmWmcbScanEx
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl WM_StartScanEx
	cmp r0, #2
	beq _022D500C
	cmp r0, #3
	beq _022D503C
	cmp r0, #8
	beq _022D502C
	b _022D503C
_022D500C:
	mov r0, #5
	bl WcmSetPhase
	ldr r0, _022D5064 ; =ov00_02326C4C
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D5054
_022D502C:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D503C:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D5054:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022D5064: .word ov00_02326C4C
_022D5068: .word WcmWmcbScanEx
	arm_func_end Wcm_BeginSearchAsync

	arm_func_start Wcm_EndSearchAsync
Wcm_EndSearchAsync: ; 0x022D506C
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022D510C ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D5094
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D5094:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _022D50E4
	cmp r1, #6
	beq _022D50B8
	cmp r1, #7
	beq _022D50D8
	b _022D50F0
_022D50B8:
	mov r0, #7
	bl WcmSetPhase
	ldr r0, _022D510C ; =ov00_02326C4C
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D50FC
_022D50D8:
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r4, pc}
_022D50E4:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
_022D50F0:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D50FC:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D510C: .word ov00_02326C4C
	arm_func_end Wcm_EndSearchAsync

	arm_func_start Wcm_ConnectAsync
Wcm_ConnectAsync: ; 0x022D5110
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r2, _022D5308 ; =ov00_02326C4C
	mov r4, r0
	ldr ip, [r2]
	cmp ip, #0
	bne _022D5144
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D5144:
	add r1, ip, #0x2000
	ldr r3, [r1, #0x260]
	cmp r3, #3
	beq _022D5168
	cmp r3, #8
	beq _022D5258
	cmp r3, #9
	beq _022D5264
	b _022D5270
_022D5168:
	cmp r7, #0
	bne _022D517C
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D517C:
	ldrh r3, [r7, #0x3c]
	cmp r3, #0
	beq _022D5194
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D5194:
	cmp r6, #0
	beq _022D520C
	ldrb r3, [r6]
	cmp r3, #4
	ldrlob r0, [r6, #1]
	cmplo r0, #4
	blo _022D51C0
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D51C0:
	strb r3, [r1, #0x250]
	ldr r0, [r2]
	ldrb r1, [r6, #1]
	add r0, r0, #0x2000
	strb r1, [r0, #0x251]
	ldr r1, [r2]
	mov r2, #0x50
	add r0, r1, #0x2000
	ldrb r0, [r0, #0x250]
	cmp r0, #0
	bne _022D51FC
	add r0, r1, #0x2200
	mov r1, #0
	bl MI_CpuFill8
	b _022D521C
_022D51FC:
	add r0, r6, #2
	add r1, r1, #0x2200
	bl MI_CpuCopy8
	b _022D521C
_022D520C:
	add r0, ip, #0x2200
	mov r1, #0
	mov r2, #0x52
	bl MI_CpuFill8
_022D521C:
	ldr r1, _022D5308 ; =ov00_02326C4C
	mov r0, r7
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x2140
	bl MI_CpuCopy8
	ldr r1, _022D5308 ; =ov00_02326C4C
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x2100
	ldrh r2, [r1, #0x6e]
	orr r2, r2, #3
	strh r2, [r1, #0x70]
	bl Wcm_UpdateOption
	b _022D527C
_022D5258:
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D5264:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D5270:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D527C:
	ldr r1, _022D530C ; =0x0000FFFF
	ldr r0, _022D5310 ; =WcmWmcbCommon
	mov r3, r1
	mov r2, #0x50
	str r1, [sp]
	bl WM_SetLifeTime
	cmp r0, #2
	beq _022D52B0
	cmp r0, #3
	beq _022D52E0
	cmp r0, #8
	beq _022D52D0
	b _022D52E0
_022D52B0:
	mov r0, #8
	bl WcmSetPhase
	ldr r0, _022D5308 ; =ov00_02326C4C
	mov r1, #5
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D52F8
_022D52D0:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D52E0:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D52F8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022D5308: .word ov00_02326C4C
_022D530C: .word 0x0000FFFF
_022D5310: .word WcmWmcbCommon
	arm_func_end Wcm_ConnectAsync

	arm_func_start Wcm_DisconnectAsync
Wcm_DisconnectAsync: ; 0x022D5314
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022D5428 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D533C
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D533C:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #3
	beq _022D5368
	cmp r2, #9
	beq _022D5380
	cmp r2, #0xa
	bne _022D5374
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r4, pc}
_022D5368:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
_022D5374:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D5380:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _022D53AC
	mov r0, #0xa
	bl WcmSetPhase
	ldr r0, _022D5428 ; =ov00_02326C4C
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D5418
_022D53AC:
	ldr r0, _022D542C ; =WcmWmcbEndDcf
	bl WM_EndDcf
	cmp r0, #2
	beq _022D53D0
	cmp r0, #3
	beq _022D5400
	cmp r0, #8
	beq _022D53F0
	b _022D5400
_022D53D0:
	mov r0, #0xa
	bl WcmSetPhase
	ldr r0, _022D5428 ; =ov00_02326C4C
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D5418
_022D53F0:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r4, pc}
_022D5400:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r4, pc}
_022D5418:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D5428: .word ov00_02326C4C
_022D542C: .word WcmWmcbEndDcf
	arm_func_end Wcm_DisconnectAsync

	arm_func_start Wcm_TerminateAsync
Wcm_TerminateAsync: ; 0x022D5430
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	ldr r1, _022D5634 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _022D5458
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022D5458:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #0xd
	addls pc, pc, r2, lsl #2
	b _022D54E8
_022D546C: ; jump table
	b _022D54E8 ; case 0
	b _022D54B0 ; case 1
	b _022D54E8 ; case 2
	b _022D54F8 ; case 3
	b _022D54E8 ; case 4
	b _022D54E8 ; case 5
	b _022D54BC ; case 6
	b _022D54E8 ; case 7
	b _022D54E8 ; case 8
	b _022D54F8 ; case 9
	b _022D54E8 ; case 10
	b _022D54E8 ; case 11
	b _022D54F8 ; case 12
	b _022D54A4 ; case 13
_022D54A4:
	bl SetIrqFlag
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_022D54B0:
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D54BC:
	mov r0, #0xd
	bl WcmSetPhase
	ldr r1, _022D5634 ; =ov00_02326C4C
	mov r2, #9
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_022D54E8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022D54F8:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _022D5524
	mov r0, #0xd
	bl WcmSetPhase
	ldr r0, _022D5634 ; =ov00_02326C4C
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D5624
_022D5524:
	bl WMi_GetStatusAddress
	mov r5, r0
	mov r1, #2
	bl DC_InvalidateRange
	ldrh r0, [r5]
	cmp r0, #0
	beq _022D5554
	cmp r0, #1
	beq _022D558C
	cmp r0, #2
	beq _022D5598
	b _022D55A4
_022D5554:
	bl WM_Finish
	cmp r0, #0
	bne _022D55C0
	mov r0, #1
	bl WcmSetPhase
	ldr r1, _022D5634 ; =ov00_02326C4C
	mov r2, #0
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D558C:
	ldr r0, _022D5638 ; =WcmWmcbCommon
	bl WM_Disable
	b _022D55C0
_022D5598:
	ldr r0, _022D5638 ; =WcmWmcbCommon
	bl WM_PowerOff
	b _022D55C0
_022D55A4:
	ldr r1, _022D5634 ; =ov00_02326C4C
	ldr r0, _022D563C ; =WcmWmcbReset
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x2000
	strb r2, [r1, #0x26b]
	bl WM_Reset
_022D55C0:
	cmp r0, #2
	beq _022D55DC
	cmp r0, #3
	beq _022D560C
	cmp r0, #8
	beq _022D55FC
	b _022D560C
_022D55DC:
	mov r0, #0xd
	bl WcmSetPhase
	ldr r0, _022D5634 ; =ov00_02326C4C
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _022D5624
_022D55FC:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_022D560C:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl SetIrqFlag
	mov r0, #7
	ldmia sp!, {r3, r4, r5, pc}
_022D5624:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D5634: .word ov00_02326C4C
_022D5638: .word WcmWmcbCommon
_022D563C: .word WcmWmcbReset
	arm_func_end Wcm_TerminateAsync

	arm_func_start Wcm_GetPhase
Wcm_GetPhase: ; 0x022D5640
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _022D566C ; =ov00_02326C4C
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	addne r1, r1, #0x2000
	ldrne r4, [r1, #0x260]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D566C: .word ov00_02326C4C
	arm_func_end Wcm_GetPhase

	arm_func_start Wcm_UpdateOption
Wcm_UpdateOption: ; 0x022D5670
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _022D5704 ; =ov00_02326C4C
	mov r2, #0
	ldr r3, [r1]
	add r1, r3, #0x2000
	cmp r3, #0
	ldr r4, [r1, #0x264]
	bne _022D56A4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D56A4:
	tst r5, #0x8000
	beq _022D56C4
	ldr r1, _022D5708 ; =0x00003FFE
	orr r2, r2, #0xfe
	tst r5, r1
	orreq r5, r5, #0x82
	orr r2, r2, #0x3f00
	orreq r5, r5, #0xa000
_022D56C4:
	tst r5, #0x20000
	orrne r2, r2, #0x10000
	tst r5, #0x80000
	orrne r2, r2, #0x40000
	tst r5, #0x200000
	orrne r2, r2, #0x100000
	tst r5, #0x800000
	orrne r2, r2, #0x400000
	mvn r1, r2
	and r1, r4, r1
	orr r2, r5, r1
	add r1, r3, #0x2000
	str r2, [r1, #0x264]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D5704: .word ov00_02326C4C
_022D5708: .word 0x00003FFE
	arm_func_end Wcm_UpdateOption

	arm_func_start Wcmi_GetSystemWork
Wcmi_GetSystemWork: ; 0x022D570C
	ldr r0, _022D5718 ; =ov00_02326C4C
	ldr r0, [r0]
	bx lr
	.align 2, 0
_022D5718: .word ov00_02326C4C
	arm_func_end Wcmi_GetSystemWork

	arm_func_start WcmConfigure
WcmConfigure: ; 0x022D571C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _022D576C
	ldr r1, _022D5838 ; =ov00_02326C4C
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x2000
	str r3, [r0, #0x26c]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x278]
	b _022D5824
_022D576C:
	ldr r1, _022D5838 ; =ov00_02326C4C
	ldr r2, [r5]
	ldr r0, [r1]
	and r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x26c]
	ldr r3, [r5, #4]
	ldr r0, [r5, #8]
	and r2, r3, #3
	rsb r2, r2, #4
	and r2, r2, #3
	add r2, r2, #0xc
	cmp r2, r0
	ldr r0, [r1]
	bls _022D57C4
	mov r2, #0
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	b _022D5810
_022D57C4:
	add r2, r3, #3
	bic r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r2, [r5, #4]
	ldr r0, [r1]
	and r2, r2, #3
	rsb r2, r2, #4
	ldr r3, [r5, #8]
	and r2, r2, #3
	sub r2, r3, r2
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	mov r1, #0
	add r2, r0, #0x2000
	ldr r0, [r2, #0x270]
	ldr r2, [r2, #0x274]
	bl MI_CpuFill8
_022D5810:
	ldr r0, _022D5838 ; =ov00_02326C4C
	ldr r1, [r5, #0xc]
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x278]
_022D5824:
	ldr r0, _022D5838 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r4, [r0, #0x27c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D5838: .word ov00_02326C4C
	arm_func_end WcmConfigure

	arm_func_start WcmEditScanExParam
WcmEditScanExParam: ; 0x022D583C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r2
	mov r4, r1
	bl Wcm_UpdateOption
	ldr r2, _022D59C8 ; =ov00_02326C4C
	mov r3, #0x400
	ldr r1, [r2]
	mov r0, #0
	add ip, r1, #0x1500
	add r1, r1, #0x2000
	str ip, [r1, #0x288]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r3, [r1, #0x8c]
	bl WcmGetNextScanChannel
	ldr r1, _022D59C8 ; =ov00_02326C4C
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r0, r0, #0x2200
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bne _022D58B0
	bl WM_GetDispersionScanPeriod
_022D58B0:
	ldr r2, _022D59C8 ; =ov00_02326C4C
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x90]
	ldr r1, [r2]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x264]
	and r0, r0, #0x300000
	cmp r0, #0x300000
	movne r2, #1
	moveq r2, #0
	add r0, r1, #0x2200
	strh r2, [r0, #0x98]
	cmp r5, #0
	mov r2, #6
	bne _022D590C
	ldr r1, _022D59C8 ; =ov00_02326C4C
	ldr r0, _022D59CC ; =ov00_02318158
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl MI_CpuCopy8
	b _022D5924
_022D590C:
	ldr r1, _022D59C8 ; =ov00_02326C4C
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl MI_CpuCopy8
_022D5924:
	cmp r4, #0
	ldrne r0, _022D59D0 ; =ov00_02318160
	mov r2, #0x20
	cmpne r4, r0
	bne _022D5968
	ldr r1, _022D59C8 ; =ov00_02326C4C
	ldr r0, _022D59D0 ; =ov00_02318160
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl MI_CpuCopy8
	ldr r0, _022D59C8 ; =ov00_02326C4C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
	b _022D59B0
_022D5968:
	ldr r1, _022D59C8 ; =ov00_02326C4C
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl MI_CpuCopy8
	mov r1, #0
_022D5984:
	ldrb r0, [r4]
	cmp r0, #0
	beq _022D59A0
	add r1, r1, #1
	cmp r1, #0x20
	add r4, r4, #1
	blt _022D5984
_022D59A0:
	ldr r0, _022D59C8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
_022D59B0:
	ldr r0, _022D59C8 ; =ov00_02326C4C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x284]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D59C8: .word ov00_02326C4C
_022D59CC: .word ov00_02318158
_022D59D0: .word ov00_02318160
	arm_func_end WcmEditScanExParam

	arm_func_start WcmInitOption
WcmInitOption: ; 0x022D59D4
	ldr r0, _022D59EC ; =ov00_02326C4C
	ldr r1, _022D59F0 ; =0x00AAA082
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x264]
	bx lr
	.align 2, 0
_022D59EC: .word ov00_02326C4C
_022D59F0: .word 0x00AAA082
	arm_func_end WcmInitOption

	arm_func_start WcmGetNextScanChannel
WcmGetNextScanChannel: ; 0x022D59F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022D5A7C ; =ov00_02326C4C
	ldr lr, _022D5A80 ; =0x4EC4EC4F
	ldr r2, [r2]
	mov r1, r0
	add r2, r2, #0x2000
	ldr r7, [r2, #0x264]
	mov r6, #0
	mov r5, #1
	mov ip, #0xd
_022D5A1C:
	mov r2, r1, lsr #0x1f
	smull r3, r4, lr, r1
	add r4, r2, r4, asr #2
	smull r2, r3, ip, r4
	sub r4, r1, r2
	add r2, r4, #1
	tst r7, r5, lsl r2
	bne _022D5A4C
	add r6, r6, #1
	cmp r6, #0xd
	add r1, r1, #1
	blt _022D5A1C
_022D5A4C:
	add r3, r0, r6
	ldr r2, _022D5A80 ; =0x4EC4EC4F
	mov r0, r3, lsr #0x1f
	smull r1, ip, r2, r3
	add ip, r0, ip, asr #2
	mov r2, #0xd
	smull r0, r1, r2, ip
	sub ip, r3, r0
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022D5A7C: .word ov00_02326C4C
_022D5A80: .word 0x4EC4EC4F
	arm_func_end WcmGetNextScanChannel

	arm_func_start WcmNotify
WcmNotify: ; 0x022D5A84
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022D5AC4 ; =ov00_02326C4C
	mov r5, r0
	ldr r0, [ip]
	mov r4, r1
	add r1, r0, #0x2200
	ldrsh r0, [r1, #0x80]
	mov ip, #0
	mov lr, r2
	strh ip, [r1, #0x80]
	str r3, [sp]
	mov r1, r5
	mov r2, r4
	mov r3, lr
	bl WcmNotifyEx
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D5AC4: .word ov00_02326C4C
	arm_func_end WcmNotify

	arm_func_start WcmNotifyEx
WcmNotifyEx: ; 0x022D5AC8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr ip, _022D5B18 ; =ov00_02326C4C
	ldr ip, [ip]
	add ip, ip, #0x2000
	ldr lr, [ip, #0x27c]
	cmp lr, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldr lr, [sp, #0x18]
	strh r0, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	str lr, [sp, #0xc]
	strh r1, [sp, #2]
	ldr r1, [ip, #0x27c]
	add r0, sp, #0
	blx r1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D5B18: .word ov00_02326C4C
	arm_func_end WcmNotifyEx

	arm_func_start WcmSetPhase
WcmSetPhase: ; 0x022D5B1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _022D5BA8 ; =ov00_02326C4C
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _022D5B58
	cmp r5, #9
	beq _022D5B58
	add r0, r1, #0x2cc
	add r0, r0, #0x2000
	bl OS_CancelAlarm
_022D5B58:
	ldr r0, _022D5BA8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #0xb
	strne r5, [r0, #0x260]
	cmp r5, #9
	bne _022D5B9C
	mov r2, #0
	ldr r0, _022D5BA8 ; =ov00_02326C4C
	str r2, [sp]
	ldr r0, [r0]
	ldr r1, _022D5BAC ; =0x022F5341
	add r0, r0, #0x2cc
	ldr r3, _022D5BB0 ; =WcmKeepAliveAlarm
	add r0, r0, #0x2000
	bl OS_SetAlarm
_022D5B9C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D5BA8: .word ov00_02326C4C
_022D5BAC: .word 0x022F5341
_022D5BB0: .word WcmKeepAliveAlarm
	arm_func_end WcmSetPhase

	arm_func_start Wcmi_ResetKeepAliveAlarm
Wcmi_ResetKeepAliveAlarm: ; 0x022D5BB4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	bl EnableIrqFlag
	ldr r1, _022D5C1C ; =ov00_02326C4C
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl OS_CancelAlarm
	ldr r0, _022D5C1C ; =ov00_02326C4C
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _022D5C0C
	add r0, r1, #0x2cc
	mov r2, #0
	ldr r1, _022D5C20 ; =0x022F5341
	ldr r3, _022D5C24 ; =WcmKeepAliveAlarm
	add r0, r0, #0x2000
	str r2, [sp]
	bl OS_SetAlarm
_022D5C0C:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022D5C1C: .word ov00_02326C4C
_022D5C20: .word 0x022F5341
_022D5C24: .word WcmKeepAliveAlarm
	arm_func_end Wcmi_ResetKeepAliveAlarm

	arm_func_start WcmKeepAliveAlarm
WcmKeepAliveAlarm: ; 0x022D5C28
	stmdb sp!, {r3, lr}
	bl Wcmi_CpsifSendNullPacket
	bl Wcmi_ResetKeepAliveAlarm
	ldmia sp!, {r3, pc}
	arm_func_end WcmKeepAliveAlarm

	arm_func_start WcmCountBits
WcmCountBits: ; 0x022D5C38
	mov r1, r0
	mov r0, #0
	mov r3, #1
_022D5C44:
	clz r2, r1
	rsbs r2, r2, #0x1f
	blo _022D5C54
	b _022D5C58
_022D5C54:
	bx lr
_022D5C58:
	bic r1, r1, r3, lsl r2
	add r0, r0, #1
	b _022D5C44
	arm_func_end WcmCountBits

	arm_func_start WcmCountLeadingZero
WcmCountLeadingZero: ; 0x022D5C64
	clz r0, r0
	bx lr
	arm_func_end WcmCountLeadingZero

	arm_func_start WcmWmReset
WcmWmReset: ; 0x022D5C6C
	stmdb sp!, {r3, lr}
	ldr r0, _022D5CC0 ; =ov00_02326C4C
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldrb r0, [r1, #0x26b]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r0, _022D5CC4 ; =WcmWmcbReset
	strb r2, [r1, #0x26b]
	bl WM_Reset
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x610
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D5CC0: .word ov00_02326C4C
_022D5CC4: .word WcmWmcbReset
	arm_func_end WcmWmReset

	arm_func_start WcmWmcbIndication
WcmWmcbIndication: ; 0x022D5CC8
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #8
	ldreqh r1, [r0, #4]
	cmpeq r1, #0x16
	ldreqh r0, [r0, #6]
	cmpeq r0, #0x25
	ldmneia sp!, {r3, pc}
	ldr r0, _022D5D3C ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022D5D08: ; jump table
	b _022D5D1C ; case 0
	b _022D5D28 ; case 1
	b _022D5D30 ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _022D5D28 ; case 4
_022D5D1C:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r3, pc}
_022D5D28:
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D5D30:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D5D3C: .word ov00_02326C4C
	arm_func_end WcmWmcbIndication

	arm_func_start WcmWmcbCommon
WcmWmcbCommon: ; 0x022D5D40
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	mov r2, #0x14
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _022D5FA0
_022D5D58: ; jump table
	b _022D5D6C ; case 0
	b _022D5F68 ; case 1
	b _022D5FA0 ; case 2
	b _022D5FA0 ; case 3
	b _022D5FA0 ; case 4
_022D5D6C:
	ldrh r0, [r0]
	cmp r0, #0x19
	bgt _022D5DA4
	bge _022D5E68
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022D5EE0
_022D5D88: ; jump table
	b _022D5EE0 ; case 0
	b _022D5EE0 ; case 1
	b _022D5EE0 ; case 2
	b _022D5DC0 ; case 3
	b _022D5DD0 ; case 4
	b _022D5E24 ; case 5
	b _022D5E44 ; case 6
_022D5DA4:
	cmp r0, #0x1d
	bgt _022D5DB4
	beq _022D5E54
	b _022D5EE0
_022D5DB4:
	cmp r0, #0x27
	beq _022D5E90
	b _022D5EE0
_022D5DC0:
	ldr r0, _022D5FD8 ; =WcmWmcbCommon
	bl WM_PowerOn
	mov r2, r0
	b _022D5EE0
_022D5DD0:
	bl WM_Finish
	cmp r0, #0
	beq _022D5DE4
	cmp r0, #4
	b _022D5E04
_022D5DE4:
	mov r0, #1
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _022D5FDC ; =0x00000663
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5E04:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D5FE0 ; =0x0000066C
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5E24:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _022D5FE4 ; =0x00000673
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5E44:
	ldr r0, _022D5FD8 ; =WcmWmcbCommon
	bl WM_Disable
	mov r2, r0
	b _022D5EE0
_022D5E54:
	ldr r0, _022D5FD8 ; =WcmWmcbCommon
	mov r1, #0
	bl WM_SetBeaconIndication
	mov r2, r0
	b _022D5EE0
_022D5E68:
	ldr r1, _022D5FE8 ; =ov00_02326C4C
	ldr r0, _022D5FD8 ; =WcmWmcbCommon
	ldr r3, [r1]
	add r2, r3, #0x2000
	ldrb r1, [r2, #0x250]
	ldrb r2, [r2, #0x251]
	add r3, r3, #0x2200
	bl WM_SetWepKeyEx
	mov r2, r0
	b _022D5EE0
_022D5E90:
	ldr r0, _022D5FE8 ; =ov00_02326C4C
	ldr r2, [r0]
	add r0, r2, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc0000
	cmp r0, #0xc0000
	moveq r0, #1
	movne r0, #0
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	and r1, r1, #0x30000
	cmp r1, #0x30000
	movne r3, #1
	add r1, r2, #0x2140
	ldr r0, _022D5FEC ; =WcmWmcbConnect
	moveq r3, #0
	mov r2, #0
	str ip, [sp]
	bl WM_StartConnectEx
	mov r2, r0
_022D5EE0:
	cmp r2, #2
	ldmeqia sp!, {r3, pc}
	cmp r2, #3
	beq _022D5F30
	cmp r2, #8
	bne _022D5F30
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _022D5FE8 ; =ov00_02326C4C
	mov r2, #0
	ldr r1, [r0]
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	mov r0, #1
	movne r1, #0
	rsb r3, r0, #0x6b0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5F30:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D5FE8 ; =ov00_02326C4C
	ldr r3, _022D5FF0 ; =0x000006B8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5F68:
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _022D5FE8 ; =ov00_02326C4C
	ldr r3, _022D5FF4 ; =0x000006DE
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #1
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D5FA0:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D5FE8 ; =ov00_02326C4C
	ldr r3, _022D5FF8 ; =0x000006E8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D5FD8: .word WcmWmcbCommon
_022D5FDC: .word 0x00000663
_022D5FE0: .word 0x0000066C
_022D5FE4: .word 0x00000673
_022D5FE8: .word ov00_02326C4C
_022D5FEC: .word WcmWmcbConnect
_022D5FF0: .word 0x000006B8
_022D5FF4: .word 0x000006DE
_022D5FF8: .word 0x000006E8
	arm_func_end WcmWmcbCommon

	arm_func_start WcmWmcbScanEx
WcmWmcbScanEx: ; 0x022D5FFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x14
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022D6294
_022D601C: ; jump table
	b _022D6030 ; case 0
	b _022D6288 ; case 1
	b _022D6294 ; case 2
	b _022D6294 ; case 3
	b _022D6294 ; case 4
_022D6030:
	ldr r0, _022D62B8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #5
	bne _022D6064
	mov r0, #6
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _022D62BC ; =0x00000704
	mov r1, r0
	mov r2, r0
	bl WcmNotify
_022D6064:
	ldr r1, _022D62B8 ; =ov00_02326C4C
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #6
	beq _022D6090
	cmp r0, #7
	beq _022D6208
	cmp r0, #0xd
	beq _022D6218
	b _022D6224
_022D6090:
	add r0, r2, #0x2200
	mov r2, #7
	strh r2, [r0, #0x80]
	ldrh r0, [r5, #8]
	cmp r0, #5
	bne _022D611C
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldrh r0, [r5, #0xe]
	mov r4, #0
	cmp r0, #0
	ble _022D611C
	ldr r8, _022D62C0 ; =0x0000071A
	mov r7, #7
	mov r6, r4
_022D60DC:
	add r0, r5, r4, lsl #1
	add r2, r5, r4, lsl #2
	ldrh r1, [r0, #0x50]
	ldr r0, [r2, #0x10]
	bl Wcmi_EntryApList
	str r8, [sp]
	add r0, r5, r4, lsl #2
	ldr r2, [r0, #0x10]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl WcmNotifyEx
	ldrh r0, [r5, #0xe]
	add r4, r4, #1
	cmp r4, r0
	blt _022D60DC
_022D611C:
	ldr r0, _022D62B8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc00000
	cmp r0, #0xc00000
	bne _022D6188
	ldr r0, _022D62C4 ; =0x00003FFE
	and r0, r1, r0
	bl WcmCountBits
	movs r1, r0
	beq _022D6188
	ldr r0, _022D62B8 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r6, [r0, #0x284]
	mov r0, r6
	bl _u32_div_f
	cmp r1, #0
	bne _022D6188
	ldr r4, _022D62C8 ; =0x00000728
	mov r1, #0
	mov r2, r6
	mov r3, r1
	mov r0, #8
	str r4, [sp]
	bl WcmNotifyEx
_022D6188:
	ldrh r0, [r5, #0xa]
	bl WcmCountLeadingZero
	rsb r0, r0, #0x20
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl WcmGetNextScanChannel
	ldr r1, _022D62B8 ; =ov00_02326C4C
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldr r2, _022D62B8 ; =ov00_02326C4C
	ldr r0, _022D62CC ; =WcmWmcbScanEx
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl WM_StartScanEx
	mov r4, r0
	b _022D6224
_022D6208:
	ldr r0, _022D62D0 ; =WcmWmcbEndScan
	bl WM_EndScan
	mov r4, r0
	b _022D6224
_022D6218:
	bl WcmWmReset
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022D6224:
	cmp r4, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r4, #3
	beq _022D6264
	cmp r4, #8
	bne _022D6264
	mov r0, #0xc
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D62D4 ; =0x00000753
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022D6264:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D62D8 ; =0x0000075C
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022D6288:
	bl WcmWmReset
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022D6294:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D62DC ; =0x0000076D
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022D62B8: .word ov00_02326C4C
_022D62BC: .word 0x00000704
_022D62C0: .word 0x0000071A
_022D62C4: .word 0x00003FFE
_022D62C8: .word 0x00000728
_022D62CC: .word WcmWmcbScanEx
_022D62D0: .word WcmWmcbEndScan
_022D62D4: .word 0x00000753
_022D62D8: .word 0x0000075C
_022D62DC: .word 0x0000076D
	arm_func_end WcmWmcbScanEx

	arm_func_start WcmWmcbEndScan
WcmWmcbEndScan: ; 0x022D62E0
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022D6330
_022D62F4: ; jump table
	b _022D6308 ; case 0
	b _022D6328 ; case 1
	b _022D6330 ; case 2
	b _022D6330 ; case 3
	b _022D6330 ; case 4
_022D6308:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _022D6350 ; =0x00000783
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D6328:
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D6330:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D6354 ; =0x00000793
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D6350: .word 0x00000783
_022D6354: .word 0x00000793
	arm_func_end WcmWmcbEndScan

	arm_func_start WcmWmcbConnect
WcmWmcbConnect: ; 0x022D6358
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022D6578
_022D6370: ; jump table
	b _022D63A4 ; case 0
	b _022D6554 ; case 1
	b _022D6578 ; case 2
	b _022D6578 ; case 3
	b _022D6578 ; case 4
	b _022D6578 ; case 5
	b _022D6568 ; case 6
	b _022D6578 ; case 7
	b _022D6578 ; case 8
	b _022D6578 ; case 9
	b _022D6578 ; case 10
	b _022D6568 ; case 11
	b _022D6568 ; case 12
_022D63A4:
	ldrh r0, [r4, #8]
	cmp r0, #9
	bgt _022D63E4
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _022D652C
_022D63BC: ; jump table
	b _022D652C ; case 0
	b _022D652C ; case 1
	b _022D652C ; case 2
	b _022D652C ; case 3
	b _022D652C ; case 4
	b _022D652C ; case 5
	ldmia sp!, {r4, pc} ; case 6
	b _022D6460 ; case 7
	b _022D63F0 ; case 8
	b _022D63F0 ; case 9
_022D63E4:
	cmp r0, #0x1a
	ldmeqia sp!, {r4, pc}
	b _022D652C
_022D63F0:
	ldr r1, _022D65A0 ; =ov00_02326C4C
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_022D6410: ; jump table
	b _022D6430 ; case 0
	b _022D643C ; case 1
	b _022D6424 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	b _022D6458 ; case 4
_022D6424:
	add r0, r2, #0x2200
	mov r1, #0
	strh r1, [r0, #0x82]
_022D6430:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r4, pc}
_022D643C:
	add r0, r2, #0x2200
	mov r2, #0
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	mov r1, #6
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
_022D6458:
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_022D6460:
	ldr r1, _022D65A0 ; =ov00_02326C4C
	ldr r3, [r1]
	add r0, r3, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _022D6488
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_022D6488:
	ldrh r2, [r4, #0xa]
	cmp r2, #1
	blo _022D6524
	ldr r0, _022D65A4 ; =0x000007D7
	cmp r2, r0
	bhi _022D6524
	add r0, r3, #0x2200
	strh r2, [r0, #0x82]
	ldr r1, [r1]
	ldr r0, _022D65A8 ; =WcmWmcbStartDcf
	add r1, r1, #0x1500
	mov r2, #0x620
	bl WM_StartDcf
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	cmp r0, #3
	beq _022D64FC
	cmp r0, #8
	bne _022D64FC
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _022D65A0 ; =ov00_02326C4C
	ldr r3, _022D65AC ; =0x000007ED
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
_022D64FC:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D65A0 ; =ov00_02326C4C
	ldr r3, _022D65B0 ; =0x000007F6
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
_022D6524:
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_022D652C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D65A0 ; =ov00_02326C4C
	ldrh r2, [r4, #8]
	ldr r0, [r0]
	ldr r3, _022D65B4 ; =0x00000804
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r4, pc}
_022D6554:
	ldr r0, _022D65A0 ; =ov00_02326C4C
	ldrh r1, [r4, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0xf8]
_022D6568:
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_022D6578:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D65A0 ; =ov00_02326C4C
	ldr r3, _022D65B8 ; =0x0000081B
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D65A0: .word ov00_02326C4C
_022D65A4: .word 0x000007D7
_022D65A8: .word WcmWmcbStartDcf
_022D65AC: .word 0x000007ED
_022D65B0: .word 0x000007F6
_022D65B4: .word 0x00000804
_022D65B8: .word 0x0000081B
	arm_func_end WcmWmcbConnect

	arm_func_start WcmWmcbDisconnect
WcmWmcbDisconnect: ; 0x022D65BC
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022D6650
_022D65D0: ; jump table
	b _022D65E4 ; case 0
	b _022D6640 ; case 1
	b _022D6650 ; case 2
	b _022D6640 ; case 3
	b _022D6650 ; case 4
_022D65E4:
	ldr r0, _022D6678 ; =ov00_02326C4C
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _022D660C
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D660C:
	add r1, r1, #0x2200
	mov r2, #0
	mov r0, #3
	strh r2, [r1, #0x82]
	bl WcmSetPhase
	ldr r1, _022D6678 ; =ov00_02326C4C
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _022D667C ; =0x0000083D
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D6640:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D6650:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D6678 ; =ov00_02326C4C
	ldr r3, _022D6680 ; =0x0000084F
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D6678: .word ov00_02326C4C
_022D667C: .word 0x0000083D
_022D6680: .word 0x0000084F
	arm_func_end WcmWmcbDisconnect

	arm_func_start WcmWmcbStartDcf
WcmWmcbStartDcf: ; 0x022D6684
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _022D66A0
	cmp r0, #4
	b _022D675C
_022D66A0:
	ldrh r0, [r4, #4]
	cmp r0, #0xe
	beq _022D66B8
	cmp r0, #0xf
	beq _022D6708
	b _022D6734
_022D66B8:
	ldr r0, _022D6784 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _022D66E0
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_022D66E0:
	mov r0, #9
	bl WcmSetPhase
	ldr r1, _022D6784 ; =ov00_02326C4C
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _022D6788 ; =0x00000872
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	ldmia sp!, {r4, pc}
_022D6708:
	ldr r0, [r4, #8]
	ldrh r0, [r0, #0xe]
	mov r0, r0, asr #8
	and r0, r0, #0xff
	bl Wcmi_ShelterRssi
	ldr r0, [r4, #8]
	mov r1, #0x620
	bl DC_InvalidateRange
	ldr r0, [r4, #8]
	bl Wcmi_CpsifRecvCallback
	ldmia sp!, {r4, pc}
_022D6734:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D6784 ; =ov00_02326C4C
	ldrh r2, [r4, #4]
	ldr r0, [r0]
	ldr r3, _022D678C ; =0x00000881
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r4, pc}
_022D675C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D6784 ; =ov00_02326C4C
	ldr r3, _022D6790 ; =0x0000088C
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D6784: .word ov00_02326C4C
_022D6788: .word 0x00000872
_022D678C: .word 0x00000881
_022D6790: .word 0x0000088C
	arm_func_end WcmWmcbStartDcf

	arm_func_start WcmWmcbEndDcf
WcmWmcbEndDcf: ; 0x022D6794
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022D6878
_022D67A8: ; jump table
	b _022D67BC ; case 0
	b _022D6868 ; case 1
	b _022D6878 ; case 2
	b _022D6868 ; case 3
	b _022D6878 ; case 4
_022D67BC:
	ldr r0, _022D68A0 ; =ov00_02326C4C
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _022D67E4
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D67E4:
	ldr r0, _022D68A4 ; =WcmWmcbDisconnect
	mov r1, #0
	bl WM_Disconnect
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	cmp r0, #3
	beq _022D6830
	cmp r0, #8
	bne _022D6840
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _022D68A0 ; =ov00_02326C4C
	ldr r3, _022D68A8 ; =0x000008B4
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D6830:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D6840:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r1, _022D68A0 ; =ov00_02326C4C
	mov r0, #7
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x2140
	mov r3, #0x8c0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_022D6868:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_022D6878:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D68A0 ; =ov00_02326C4C
	ldr r3, _022D68AC ; =0x000008D3
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D68A0: .word ov00_02326C4C
_022D68A4: .word WcmWmcbDisconnect
_022D68A8: .word 0x000008B4
_022D68AC: .word 0x000008D3
	arm_func_end WcmWmcbEndDcf

	arm_func_start WcmWmcbReset
WcmWmcbReset: ; 0x022D68B0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022D6B88
	ldr r2, _022D6BAC ; =ov00_02326C4C
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r3, [r2]
	add r1, r3, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #0xd
	addls pc, pc, r1, lsl #2
	b _022D6B58
_022D68FC: ; jump table
	b _022D6B58 ; case 0
	b _022D6B58 ; case 1
	b _022D6B58 ; case 2
	b _022D6B58 ; case 3
	b _022D6B58 ; case 4
	b _022D6934 ; case 5
	b _022D6934 ; case 6
	b _022D6958 ; case 7
	b _022D697C ; case 8
	b _022D6A94 ; case 9
	b _022D6AC0 ; case 10
	b _022D6B58 ; case 11
	b _022D6A94 ; case 12
	b _022D6AEC ; case 13
_022D6934:
	mov r0, #3
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D6BB0 ; =0x000008F5
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6958:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _022D6BB4 ; =0x000008FB
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D697C:
	add r1, r3, #0x2200
	ldrh r4, [r1, #0xf8]
	strh r0, [r1, #0xf8]
	cmp r4, #0x12
	bne _022D6A68
	ldr r1, [r2]
	add r1, r1, #0x2100
	ldrh r3, [r1, #0x70]
	and ip, r3, #0x24
	cmp ip, #0x24
	beq _022D6A68
	orr r3, r3, #0x24
	strh r3, [r1, #0x70]
	ldr lr, [r2]
	add r1, lr, #0x2000
	ldr r2, [r1, #0x264]
	and r1, r2, #0xc0000
	cmp r1, #0xc0000
	moveq r0, #1
	and r1, r2, #0x30000
	cmp r1, #0x30000
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	movne r3, #1
	ldr r0, _022D6BB8 ; =WcmWmcbConnect
	moveq r3, #0
	add r1, lr, #0x2140
	mov r2, #0
	str ip, [sp]
	bl WM_StartConnectEx
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _022D6A3C
	cmp r0, #8
	bne _022D6A3C
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _022D6BAC ; =ov00_02326C4C
	ldr r3, _022D6BBC ; =0x0000091C
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6A3C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _022D6BAC ; =ov00_02326C4C
	ldr r3, _022D6BC0 ; =0x00000925
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6A68:
	mov r0, #3
	bl WcmSetPhase
	ldr r0, _022D6BAC ; =ov00_02326C4C
	ldr r3, _022D6BC4 ; =0x0000092D
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6A94:
	mov r0, #3
	bl WcmSetPhase
	ldr r0, _022D6BAC ; =ov00_02326C4C
	ldr r3, _022D6BC8 ; =0x00000935
	ldr r1, [r0]
	mov r0, #0
	add r1, r1, #0x2140
	mov r2, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6AC0:
	mov r0, #3
	bl WcmSetPhase
	ldr r1, _022D6BAC ; =ov00_02326C4C
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _022D6BCC ; =0x0000093C
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6AEC:
	ldr r0, _022D6BD0 ; =WcmWmcbCommon
	bl WM_PowerOff
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _022D6B34
	cmp r0, #8
	bne _022D6B34
	mov r0, #0xc
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D6BD4 ; =0x0000094A
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6B34:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _022D6BD8 ; =0x00000953
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6B58:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r1, _022D6BAC ; =ov00_02326C4C
	mov r0, #7
	ldr r1, [r1]
	rsb r3, r0, #0x960
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	mov r1, #0
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_022D6B88:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x960
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022D6BAC: .word ov00_02326C4C
_022D6BB0: .word 0x000008F5
_022D6BB4: .word 0x000008FB
_022D6BB8: .word WcmWmcbConnect
_022D6BBC: .word 0x0000091C
_022D6BC0: .word 0x00000925
_022D6BC4: .word 0x0000092D
_022D6BC8: .word 0x00000935
_022D6BCC: .word 0x0000093C
_022D6BD0: .word WcmWmcbCommon
_022D6BD4: .word 0x0000094A
_022D6BD8: .word 0x00000953
	arm_func_end WcmWmcbReset

	arm_func_start Wcm_ClearApList
Wcm_ClearApList: ; 0x022D6BDC
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	bne _022D6C00
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
_022D6C00:
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r0, #0
	beq _022D6C24
	ldr r2, [r1, #0x274]
	cmp r2, #0
	ble _022D6C24
	mov r1, #0
	bl MI_CpuFill8
_022D6C24:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	arm_func_end Wcm_ClearApList

	arm_func_start Wcm_CountApList
Wcm_CountApList: ; 0x022D6C30
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	mov r5, #0
	bne _022D6C5C
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_022D6C5C:
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _022D6C78
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r5, [r1]
_022D6C78:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wcm_CountApList

	arm_func_start Wcm_LockApList
Wcm_LockApList: ; 0x022D6C88
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r4, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	bne _022D6CB4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D6CB4:
	add r1, r0, #0x2000
	cmp r5, #0
	ldrb r1, [r1, #0x26a]
	beq _022D6CDC
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #1
	b _022D6CF0
_022D6CDC:
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #0
_022D6CF0:
	strb r1, [r0, #0x26a]
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wcm_LockApList

	arm_func_start Wcm_PointApList
Wcm_PointApList: ; 0x022D6D04
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl EnableIrqFlag
	mov r5, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	bne _022D6D30
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D6D30:
	mov r0, r4
	bl WcmSearchIndexedApList
	movs r4, r0
	mov r0, r5
	bne _022D6D50
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022D6D50:
	bl SetIrqFlag
	add r0, r4, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wcm_PointApList

	arm_func_start Wcmi_EntryApList
Wcmi_EntryApList: ; 0x022D6D5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	bl Wcmi_GetSystemWork
	movs r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, #0x2000
	ldrb r0, [r0, #0x26a]
	cmp r0, #0
	ldreqh r0, [r5, #0x3c]
	cmpeq r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r5, #4
	bl WcmSearchApList
	movs r7, r0
	bne _022D6DA4
	bl WcmAllocApList
	mov r7, r0
_022D6DA4:
	cmp r7, #0
	addeq r0, r6, #0x2000
	ldreq r0, [r0, #0x278]
	cmpeq r0, #1
	bne _022D6DC0
	bl WcmGetOldestApList
	mov r7, r0
_022D6DC0:
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	add r1, r7, #0x10
	mov r2, #0xc0
	strh r4, [r7, #2]
	bl MTi_CpuCopy32Fast
	mov r0, r7
	bl WcmAppendApList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Wcmi_EntryApList

	arm_func_start WcmAllocApList
WcmAllocApList: ; 0x022D6DE8
	stmdb sp!, {r4, lr}
	bl Wcmi_GetSystemWork
	add r2, r0, #0x2000
	ldr r1, [r2, #0x270]
	mov r0, #0
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r2, #0x274]
	cmp r3, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r2, _022D6EB0 ; =0x4EC4EC4F
	sub r3, r3, #0xc
	umull r2, ip, r3, r2
	movs ip, ip, lsr #6
	ldmeqia sp!, {r4, pc}
	ldr r2, [r1]
	cmp ip, r2
	ldmlsia sp!, {r4, pc}
	mov lr, r0
	cmp ip, #0
	bls _022D6E64
	add r4, r1, #0xc
	mov r2, #0xd0
_022D6E44:
	mul r0, lr, r2
	ldrb r3, [r4, r0]
	add r0, r4, r0
	cmp r3, #0
	beq _022D6E64
	add lr, lr, #1
	cmp lr, ip
	blo _022D6E44
_022D6E64:
	cmp lr, ip
	ldmhsia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r0]
	ldr r3, [r1]
	mov r2, #0
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	str r0, [r1, #8]
	ldr r2, [r0, #8]
	cmp r2, #0
	strne r0, [r2, #0xc]
	streq r0, [r1, #4]
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D6EB0: .word 0x4EC4EC4F
	arm_func_end WcmAllocApList

	arm_func_start WcmGetOldestApList
WcmGetOldestApList: ; 0x022D6EB4
	stmdb sp!, {r3, lr}
	bl Wcmi_GetSystemWork
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _022D6EDC
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r0, [r1, #4]
	ldmhiia sp!, {r3, pc}
_022D6EDC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end WcmGetOldestApList

	arm_func_start WcmSearchApList
WcmSearchApList: ; 0x022D6EE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl Wcmi_GetSystemWork
	add r0, r0, #0x2000
	mov r4, #0
	cmp r5, #0
	ldr r1, [r0, #0x270]
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	beq _022D6F48
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	bls _022D6F48
	ldr r4, [r1, #4]
	cmp r4, #0
	beq _022D6F48
_022D6F28:
	mov r1, r5
	add r0, r4, #0x14
	bl Wcm_CompareBssID
	cmp r0, #0
	bne _022D6F48
	ldr r4, [r4, #0xc]
	cmp r4, #0
	bne _022D6F28
_022D6F48:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WcmSearchApList

	arm_func_start WcmSearchIndexedApList
WcmSearchIndexedApList: ; 0x022D6F50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Wcmi_GetSystemWork
	add r1, r0, #0x2000
	ldr r2, [r1, #0x270]
	mov r0, #0
	cmp r2, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r0, [r2, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_022D6F88:
	ldr r1, [r0, #4]
	cmp r1, r4
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	bne _022D6F88
	ldmia sp!, {r4, pc}
	arm_func_end WcmSearchIndexedApList

	arm_func_start WcmAppendApList
WcmAppendApList: ; 0x022D6FA0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Wcmi_GetSystemWork
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r4, #0
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _022D7018
_022D6FD8:
	cmp r3, r4
	bne _022D700C
	ldr r2, [r3, #8]
	ldr r1, [r3, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0, #4]
	ldr r2, [r3, #0xc]
	ldr r1, [r3, #8]
	cmp r2, #0
	strne r1, [r2, #8]
	streq r1, [r0, #8]
	b _022D7018
_022D700C:
	ldr r3, [r3, #0xc]
	cmp r3, #0
	bne _022D6FD8
_022D7018:
	mov r1, #0
	str r1, [r4, #0xc]
	ldr r1, [r0, #8]
	str r1, [r4, #8]
	str r4, [r0, #8]
	ldr r1, [r4, #8]
	cmp r1, #0
	strne r4, [r1, #0xc]
	streq r4, [r0, #4]
	cmp r3, #0
	ldmneia sp!, {r4, pc}
	ldr r1, [r0]
	str r1, [r4, #4]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end WcmAppendApList

	arm_func_start Wcmi_InitCpsif
Wcmi_InitCpsif: ; 0x022D705C
	stmdb sp!, {r3, lr}
	ldr r1, _022D7094 ; =ov00_02326C50
	ldrb r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1]
	mov r2, #0
	str r2, [r1, #0x24]
	str r2, [r1, #8]
	ldr r0, _022D7098 ; =ov00_02326C5C
	str r2, [r1, #4]
	bl OS_InitMutex
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D7094: .word ov00_02326C50
_022D7098: .word ov00_02326C5C
	arm_func_end Wcmi_InitCpsif

	arm_func_start Wcmi_CpsifRecvCallback
Wcmi_CpsifRecvCallback: ; 0x022D709C
	stmdb sp!, {r3, lr}
	ldr r1, _022D70CC ; =ov00_02326C50
	mov r2, r0
	ldr ip, [r1, #0x28]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldrh r3, [r2, #6]
	add r0, r2, #0x1e
	add r1, r2, #0x18
	add r2, r2, #0x2c
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D70CC: .word ov00_02326C50
	arm_func_end Wcmi_CpsifRecvCallback

	arm_func_start Wcmi_CpsifSendNullPacket
Wcmi_CpsifSendNullPacket: ; 0x022D70D0
	stmdb sp!, {r4, lr}
	bl Wcmi_GetSystemWork
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	ldmneia sp!, {r4, pc}
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _022D7138 ; =ov00_02326C5C
	bl WcmCpsifTryLockMutexInIrq
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, r4, #0x144
	ldr r0, _022D713C ; =WcmCpsifKaCallback
	add r1, r1, #0x2000
	add r2, r4, #0xf00
	mov r3, #0
	bl WM_SetDcfData
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	ldr r0, _022D7138 ; =ov00_02326C5C
	bl WcmCpsifUnlockMutexInIrq
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D7138: .word ov00_02326C5C
_022D713C: .word WcmCpsifKaCallback
	arm_func_end Wcmi_CpsifSendNullPacket

	arm_func_start Wcm_GetApMacAddress
Wcm_GetApMacAddress: ; 0x022D7140
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	bl Wcmi_GetSystemWork
	mov r4, r0
	bl EnableIrqFlag
	cmp r4, #0
	beq _022D7178
	add r1, r4, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	addeq r1, r4, #0x144
	addeq r5, r1, #0x2000
_022D7178:
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wcm_GetApMacAddress

	arm_func_start Wcm_GetApEssid
Wcm_GetApEssid: ; 0x022D7184
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r5, r0
	mov r4, r7
	bl Wcmi_GetSystemWork
	mov r6, r0
	bl EnableIrqFlag
	cmp r6, #0
	beq _022D71D0
	add r1, r6, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	bne _022D71D0
	add r1, r6, #0x2100
	ldrh r4, [r1, #0x4a]
	add r1, r6, #0x14c
	add r7, r1, #0x2000
_022D71D0:
	bl SetIrqFlag
	cmp r5, #0
	strneh r4, [r5]
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Wcm_GetApEssid

	arm_func_start Wcm_SetRecvDcfCallback
Wcm_SetRecvDcfCallback: ; 0x022D71E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _022D7200 ; =ov00_02326C50
	str r4, [r1, #0x28]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D7200: .word ov00_02326C50
	arm_func_end Wcm_SetRecvDcfCallback

	arm_func_start Wcm_SendDcfData
Wcm_SendDcfData: ; 0x022D7204
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	mov r6, r3
	bl EnableIrqFlag
	mov r5, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	bne _022D723C
	mov r0, r5
	bl SetIrqFlag
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D723C:
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_LockMutex
	bl Wcmi_GetSystemWork
	movs r7, r0
	bne _022D7268
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_UnlockMutex
	mov r0, r5
	bl SetIrqFlag
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D7268:
	add r0, r7, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	bne _022D7284
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	bne _022D729C
_022D7284:
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_UnlockMutex
	mov r0, r5
	bl SetIrqFlag
	mvn r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D729C:
	mov r0, sb
	mov r2, r8
	add r1, r7, #0xf00
	bl MI_CpuCopy8
	ldr r2, [sp, #0x20]
	cmp r2, #0
	ble _022D72C8
	add r1, r7, #0xf00
	mov r0, r6
	add r1, r1, r8
	bl MI_CpuCopy8
_022D72C8:
	ldr r1, [sp, #0x20]
	ldr r0, _022D7380 ; =WcmCpsifWmCallback
	add r6, r8, r1
	mov r3, r6, lsl #0x10
	mov r1, r4
	add r2, r7, #0xf00
	mov r3, r3, lsr #0x10
	bl WM_SetDcfData
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022D7318
_022D72F4: ; jump table
	b _022D7318 ; case 0
	b _022D7318 ; case 1
	b _022D7330 ; case 2
	b _022D7318 ; case 3
	b _022D7318 ; case 4
	b _022D7318 ; case 5
	b _022D7318 ; case 6
	b _022D7318 ; case 7
	b _022D7318 ; case 8
_022D7318:
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_UnlockMutex
	mov r0, r5
	bl SetIrqFlag
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D7330:
	ldr r0, _022D7384 ; =ov00_02326C54
	bl OS_SleepThread
	ldr r0, _022D7388 ; =ov00_02326C50
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _022D7364
	cmp r0, #1
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_UnlockMutex
	mov r0, r5
	bl SetIrqFlag
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D7364:
	ldr r0, _022D737C ; =ov00_02326C5C
	bl OS_UnlockMutex
	mov r0, r5
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022D737C: .word ov00_02326C5C
_022D7380: .word WcmCpsifWmCallback
_022D7384: .word ov00_02326C54
_022D7388: .word ov00_02326C50
	arm_func_end Wcm_SendDcfData

	arm_func_start WcmCpsifWmCallback
WcmCpsifWmCallback: ; 0x022D738C
	stmdb sp!, {r3, lr}
	ldrh r1, [r0]
	cmp r1, #0x12
	ldmneia sp!, {r3, pc}
	ldrh r2, [r0, #2]
	ldr r1, _022D73C4 ; =ov00_02326C50
	str r2, [r1, #0x24]
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022D73B8
	bl Wcmi_ResetKeepAliveAlarm
_022D73B8:
	ldr r0, _022D73C8 ; =ov00_02326C54
	bl OS_WakeupThread
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D73C4: .word ov00_02326C50
_022D73C8: .word ov00_02326C54
	arm_func_end WcmCpsifWmCallback

	arm_func_start WcmCpsifKaCallback
WcmCpsifKaCallback: ; 0x022D73CC
	ldr ip, _022D73D8 ; =WcmCpsifUnlockMutexInIrq
	ldr r0, _022D73DC ; =ov00_02326C5C
	bx ip
	.align 2, 0
_022D73D8: .word WcmCpsifUnlockMutexInIrq
_022D73DC: .word ov00_02326C5C
	arm_func_end WcmCpsifKaCallback

	arm_func_start WcmCpsifTryLockMutexInIrq
WcmCpsifTryLockMutexInIrq: ; 0x022D73E0
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _022D7408
	ldr r1, _022D742C ; =HardwareInterrupt
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
_022D7408:
	ldr r1, _022D742C ; =HardwareInterrupt
	cmp r2, r1
	movne r0, #0
	bxne lr
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
	.align 2, 0
_022D742C: .word HardwareInterrupt
	arm_func_end WcmCpsifTryLockMutexInIrq

	arm_func_start WcmCpsifUnlockMutexInIrq
WcmCpsifUnlockMutexInIrq: ; 0x022D7430
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	ldr r1, _022D7464 ; =HardwareInterrupt
	cmp r2, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0xc]
	subs r1, r1, #1
	str r1, [r0, #0xc]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	str r1, [r0, #8]
	bl OS_WakeupThread
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D7464: .word HardwareInterrupt
	arm_func_end WcmCpsifUnlockMutexInIrq

	arm_func_start Wcm_CompareBssID
Wcm_CompareBssID: ; 0x022D7468
	mov ip, #0
_022D746C:
	ldrb r3, [r0, ip]
	ldrb r2, [r1, ip]
	cmp r3, r2
	movne r0, #0
	bxne lr
	add ip, ip, #1
	cmp ip, #6
	blt _022D746C
	mov r0, #1
	bx lr
	arm_func_end Wcm_CompareBssID

	arm_func_start Wcm_GetLinkLevel
Wcm_GetLinkLevel: ; 0x022D7494
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl Wcmi_GetSystemWork
	cmp r0, #0
	mov r5, #0
	beq _022D74C8
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _022D74C8
	bl WcmGetLinkLevel
	mov r5, r0
_022D74C8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Wcm_GetLinkLevel

	arm_func_start Wcmi_GetRssiAverage
Wcmi_GetRssiAverage: ; 0x022D74D8
	stmdb sp!, {r3, lr}
	ldr r1, _022D7550 ; =ov00_02326C7C
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x10
	bls _022D751C
	ldr r3, _022D7554 ; =ov00_02326C80
	mov r2, r0
_022D74F8:
	ldrb r1, [r3], #1
	add r2, r2, #1
	cmp r2, #0x10
	add r0, r0, r1
	blt _022D74F8
	mov r1, r0, asr #3
	add r0, r0, r1, lsr #28
	mov r0, r0, asr #4
	b _022D7548
_022D751C:
	cmp r1, #0
	beq _022D7548
	mov ip, r0
	ble _022D7544
	ldr r3, _022D7554 ; =ov00_02326C80
_022D7530:
	ldrb r2, [r3], #1
	add ip, ip, #1
	cmp ip, r1
	add r0, r0, r2
	blt _022D7530
_022D7544:
	bl _s32_div_f
_022D7548:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D7550: .word ov00_02326C7C
_022D7554: .word ov00_02326C80
	arm_func_end Wcmi_GetRssiAverage

	arm_func_start WcmGetLinkLevel
WcmGetLinkLevel: ; 0x022D7558
	stmdb sp!, {r3, lr}
	bl Wcmi_GetRssiAverage
	mov r1, #0
	cmp r0, #0x1c
	movhs r1, #3
	bhs _022D7584
	cmp r0, #0x16
	movhs r1, #2
	bhs _022D7584
	cmp r0, #0x10
	movhs r1, #1
_022D7584:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end WcmGetLinkLevel

	arm_func_start Wcmi_ShelterRssi
Wcmi_ShelterRssi: ; 0x022D758C
	stmdb sp!, {r3, lr}
	ldr r2, _022D75E4 ; =ov00_02326C7C
	tst r0, #2
	ldrb ip, [r2]
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	mov r1, ip, lsr #0x1f
	and lr, r0, #0xff
	rsb r0, r1, ip, lsl #28
	ldr r3, _022D75E8 ; =ov00_02326C80
	add r0, r1, r0, ror #28
	strb lr, [r3, r0]
	add r0, ip, #1
	cmp ip, #0x10
	strlob r0, [r2]
	ldmloia sp!, {r3, pc}
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r0, r1, r0, ror #28
	add r0, r0, #0x10
	strb r0, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D75E4: .word ov00_02326C7C
_022D75E8: .word ov00_02326C80
	arm_func_end Wcmi_ShelterRssi

	arm_func_start Dwc_AC_Create
Dwc_AC_Create: ; 0x022D75EC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4]
	mov r0, #1
	mov r1, #0x24
	blx r2
	mov r1, r0
	ldr r3, _022D778C ; =ov00_02326C90
	mov r0, #0
	mov r2, #0x24
	str r1, [r3, #0xc]
	bl MTi_CpuClear32
	ldr r0, _022D778C ; =ov00_02326C90
	ldr r1, [r4]
	ldr r3, [r0, #0xc]
	mov r2, #1
	str r1, [r3]
	ldr r0, [r4, #4]
	ldr r1, _022D7790 ; =0x00000D18
	str r0, [r3, #4]
	strb r2, [r3, #9]
	strb r2, [r3, #0x16]
	mov r0, #0x10
	strb r2, [r3, #8]
	bl Dwci_AC_Alloc
	ldr r2, _022D778C ; =ov00_02326C90
	mov r1, #0x2300
	str r0, [r2, #0x10]
	mov r0, #2
	bl Dwci_AC_Alloc
	ldr r2, _022D778C ; =ov00_02326C90
	mov r1, #0x58
	str r0, [r2]
	mov r0, #4
	bl Dwci_AC_Alloc
	ldr r2, _022D778C ; =ov00_02326C90
	mov r1, #0xc
	str r0, [r2, #4]
	mov r0, #8
	bl Dwci_AC_Alloc
	ldr r1, _022D778C ; =ov00_02326C90
	ldr r2, _022D7790 ; =0x00000D18
	str r0, [r1, #8]
	ldr r1, [r1, #0x10]
	mov r0, #0
	bl MTi_CpuClear32
	mov r0, #0
	ldr r1, _022D778C ; =ov00_02326C90
	mov r2, #0x2300
	ldr r1, [r1]
	bl MTi_CpuClear32
	mov r0, #0
	ldr r1, _022D778C ; =ov00_02326C90
	mov r2, #0x58
	ldr r1, [r1, #4]
	bl MTi_CpuClear32
	mov r0, #0
	ldr r1, _022D778C ; =ov00_02326C90
	mov r2, #0xc
	ldr r1, [r1, #8]
	bl MTi_CpuClear32
	ldr r1, _022D778C ; =ov00_02326C90
	ldrb r2, [r4, #8]
	ldr r0, [r1, #0x10]
	strb r2, [r0, #0xd0a]
	ldrb r3, [r0, #0xd0b]
	ldrb r2, [r4, #9]
	bic r3, r3, #3
	and r2, r2, #3
	orr r2, r3, r2
	strb r2, [r0, #0xd0b]
	ldr r3, [r1, #8]
	ldr r2, [r4]
	mov r1, #0
	str r2, [r3]
	ldr r2, [r4, #4]
	str r2, [r3, #4]
	str r1, [r3, #8]
	ldrb r2, [r0, #0xd0c]
	ldrb r1, [r4, #0xa]
	bic r2, r2, #0xf
	and r1, r1, #0xf
	orr r2, r2, r1
	strb r2, [r0, #0xd0c]
	ldrb r1, [r4, #0xb]
	and r2, r2, #0xff
	bic r2, r2, #0x30
	mov r1, r1, lsl #0x1e
	orr r1, r2, r1, lsr #26
	strb r1, [r0, #0xd0c]
	bl Dwci_BM_GetApInfo
	ldr r0, _022D778C ; =ov00_02326C90
	mov r1, #0x2300
	ldr r0, [r0]
	bl Wcm_Init
	cmp r0, #1
	beq _022D7778
	cmp r0, #4
	ble _022D7784
_022D7778:
	bl Dwci_AC_FreeAll
	mov r0, #0
	ldmia sp!, {r4, pc}
_022D7784:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D778C: .word ov00_02326C90
_022D7790: .word 0x00000D18
	arm_func_end Dwc_AC_Create

	arm_func_start InitWfc
InitWfc: ; 0x022D7794
	stmdb sp!, {r3, r4, r5, lr}
	bl Dwci_AC_GetPhase
	mov r5, r0
	cmp r5, #1
	bne _022D77B4
	bl Dwci_AC_Start
	mov r5, r0
	b _022D7828
_022D77B4:
	cmp r5, #7
	bhs _022D77DC
	bl EnableIrqFlag
	mov r4, r0
	bl Dwci_AC_SearchAP
	mov r5, r0
	bl Dwci_AC_SetPhase
	mov r0, r4
	bl SetIrqFlag
	b _022D7828
_022D77DC:
	cmp r5, #9
	bhs _022D77F0
	bl Dwci_AC_ConnectAP
	mov r5, r0
	b _022D7828
_022D77F0:
	cmp r5, #0xa
	bhs _022D7804
	bl Dwci_AC_ConnectRetryAP
	mov r5, r0
	b _022D7828
_022D7804:
	cmp r5, #0x10
	bhs _022D7818
	bl Dwci_AC_ConnectTest
	mov r5, r0
	b _022D7828
_022D7818:
	cmp r5, #0x11
	bne _022D7828
	bl Dwci_AC_Error
	mov r5, r0
_022D7828:
	mov r0, r5
	bl Dwci_AC_SetPhase
	cmp r5, #0x10
	bne _022D784C
	bl CheckDuplicate_Dwc
	mov r4, r0
	bl Free_Disused_Dwc
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_022D784C:
	cmp r5, #0x12
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl Free_Disused_Dwc
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitWfc

	arm_func_start Dwc_AC_GetStatus
Dwc_AC_GetStatus: ; 0x022D7864
	stmdb sp!, {r3, lr}
	bl Dwci_AC_GetPhase
	cmp r0, #1
	movls r0, #0
	ldmlsia sp!, {r3, pc}
	cmp r0, #7
	movlo r0, #1
	ldmloia sp!, {r3, pc}
	cmp r0, #9
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa
	movlo r0, #2
	ldmloia sp!, {r3, pc}
	cmp r0, #0xb
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x10
	movlo r0, #3
	ldmloia sp!, {r3, pc}
	moveq r0, #5
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x11
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	bl Dwci_AC_GetResult
	ldmia sp!, {r3, pc}
	arm_func_end Dwc_AC_GetStatus

	arm_func_start Dwc_AC_GetApType
Dwc_AC_GetApType: ; 0x022D78D0
	stmdb sp!, {r4, lr}
	mov r4, #0xff
	bl Dwci_AC_GetPhase
	cmp r0, #0xa
	blo _022D78F4
	cmp r0, #0x10
	ldrls r0, _022D78FC ; =ov00_02326C90
	ldrls r0, [r0, #0xc]
	ldrlsb r4, [r0, #0x17]
_022D78F4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D78FC: .word ov00_02326C90
	arm_func_end Dwc_AC_GetApType

	arm_func_start Dwc_AC_GetApSpotInfo
Dwc_AC_GetApSpotInfo: ; 0x022D7900
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl Dwci_AC_GetPhase
	cmp r0, #0xa
	blo _022D794C
	cmp r0, #0x10
	bhi _022D794C
	ldr r0, _022D7954 ; =ov00_02326C90
	ldr r2, [r0, #0xc]
	ldrb r0, [r2, #0x17]
	cmp r0, #4
	cmpne r0, #8
	bne _022D794C
	mov r1, r5
	add r0, r2, #0x18
	mov r2, #0xa
	bl MI_CpuCopy8
	mov r4, #1
_022D794C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D7954: .word ov00_02326C90
	arm_func_end Dwc_AC_GetApSpotInfo

	arm_func_start Dwc_AC_Destroy
Dwc_AC_Destroy: ; 0x022D7958
	stmdb sp!, {r3, lr}
	bl Dwci_AC_GetPhase
	strb r0, [sp]
	ands r0, r0, #0xff
	cmpne r0, #0x12
	bne _022D797C
	bl Dwci_AC_FreeAll
	mov r0, #1
	ldmia sp!, {r3, pc}
_022D797C:
	add r0, sp, #0
	bl Dwci_AC_CloseNetwork
	ldrb r0, [sp]
	bl Dwci_AC_SetPhase
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Dwc_AC_Destroy

	arm_func_start Dwc_AC_SetSpecifyAp
Dwc_AC_SetSpecifyAp: ; 0x022D7994
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r3
	mov r0, #1
	mov r7, r1
	mov r6, r2
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	cmp r5, #0
	mov r2, #0xa
	beq _022D79D0
	mov r0, r5
	add r1, r4, #0x18
	bl MI_CpuCopy8
	b _022D79DC
_022D79D0:
	add r0, r4, #0x18
	mov r1, #0
	bl MI_CpuFill8
_022D79DC:
	ldr r3, [sp, #0x18]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	strb r3, [r4, #0x22]
	bl Dwc_AC_SetSpecifyApEx
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Dwc_AC_SetSpecifyAp

	arm_func_start Dwc_AC_SetSpecifyApEx
Dwc_AC_SetSpecifyApEx: ; 0x022D79F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x10
	mov r6, r1
	mov r5, r2
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	ldrb r3, [r4, #0xd0c]
	mov r1, #0
	mov r2, #0xf0
	bic r3, r3, #0xf
	orr r3, r3, #1
	strb r3, [r4, #0xd0c]
	bl MI_CpuFill8
	mov r2, #0
_022D7A34:
	ldrb r1, [r7, r2]
	cmp r1, #0
	beq _022D7A54
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #0x40]
	cmp r2, #0x20
	blt _022D7A34
_022D7A54:
	cmp r6, #0
	cmpne r5, #0
	bne _022D7A70
	ldrb r0, [r4, #0xe6]
	bic r0, r0, #3
	strb r0, [r4, #0xe6]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D7A70:
	cmp r5, #1
	moveq r2, #5
	beq _022D7A88
	cmp r5, #2
	moveq r2, #0xd
	movne r2, #0x10
_022D7A88:
	mov r0, r6
	add r1, r4, #0x80
	bl MI_CpuCopy8
	ldrb r1, [r4, #0xe6]
	and r0, r5, #0xff
	and r0, r0, #3
	bic r1, r1, #3
	orr r0, r1, r0
	strb r0, [r4, #0xe6]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Dwc_AC_SetSpecifyApEx

	arm_func_start Dwci_AC_InsertApInfo
Dwci_AC_InsertApInfo: ; 0x022D7AB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x10
	mov r4, r1
	bl Dwci_AC_GetMemPtr
	mov r1, r0
	mov r0, r4
	add r1, r1, r5, lsl #8
	mov r2, #0xf0
	bl MTi_CpuCopy32
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_InsertApInfo

	arm_func_start Dwci_AC_Alloc
Dwci_AC_Alloc: ; 0x022D7ADC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl Dwci_AC_GetMemPtr
	ldrb r1, [r0, #8]
	tst r1, r5
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	orr r1, r1, r5
	strb r1, [r0, #8]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_Alloc

	arm_func_start Dwci_AC_Free
Dwci_AC_Free: ; 0x022D7B1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r5, r1
	mov r4, r2
	bl Dwci_AC_GetMemPtr
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r2, [r0, #8]
	tst r2, r6
	ldmeqia sp!, {r4, r5, r6, pc}
	mvn r1, r6
	and r1, r2, r1
	strb r1, [r0, #8]
	ldr r3, [r0, #4]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	blx r3
	cmp r6, #1
	ldreq r0, _022D7B7C ; =ov00_02326C90
	moveq r1, #0
	streq r1, [r0, #0xc]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D7B7C: .word ov00_02326C90
	arm_func_end Dwci_AC_Free

	arm_func_start Dwci_AC_FreeAll
Dwci_AC_FreeAll: ; 0x022D7B80
	stmdb sp!, {r4, lr}
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #8]
	tst r0, #0x10
	beq _022D7BC8
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	ldrb r3, [r4, #8]
	mov r1, r0
	ldr r2, _022D7C9C ; =0x00000D18
	bic r0, r3, #0x10
	strb r0, [r4, #8]
	ldr r3, [r4, #4]
	mov r0, #0x10
	blx r3
_022D7BC8:
	ldrb r0, [r4, #8]
	tst r0, #8
	beq _022D7BFC
	mov r0, #8
	bl Dwci_AC_GetMemPtr
	ldrb r2, [r4, #8]
	mov r1, r0
	mov r0, #8
	bic r2, r2, #8
	strb r2, [r4, #8]
	ldr r3, [r4, #4]
	mov r2, #0xc
	blx r3
_022D7BFC:
	ldrb r0, [r4, #8]
	tst r0, #4
	beq _022D7C30
	mov r0, #4
	bl Dwci_AC_GetMemPtr
	ldrb r2, [r4, #8]
	mov r1, r0
	mov r0, #4
	bic r2, r2, #4
	strb r2, [r4, #8]
	ldr r3, [r4, #4]
	mov r2, #0x58
	blx r3
_022D7C30:
	ldrb r0, [r4, #8]
	tst r0, #2
	beq _022D7C64
	mov r0, #2
	bl Dwci_AC_GetMemPtr
	ldrb r2, [r4, #8]
	mov r1, r0
	mov r0, #2
	bic r2, r2, #2
	strb r2, [r4, #8]
	ldr r3, [r4, #4]
	mov r2, #0x2300
	blx r3
_022D7C64:
	ldrb r0, [r4, #8]
	tst r0, #1
	ldmeqia sp!, {r4, pc}
	bic r0, r0, #1
	strb r0, [r4, #8]
	ldr r3, [r4, #4]
	mov r1, r4
	mov r0, #1
	mov r2, #0x24
	blx r3
	ldr r0, _022D7CA0 ; =ov00_02326C90
	mov r1, #0
	str r1, [r0, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D7C9C: .word 0x00000D18
_022D7CA0: .word ov00_02326C90
	arm_func_end Dwci_AC_FreeAll

	arm_func_start Dwci_AC_GetMemPtr
Dwci_AC_GetMemPtr: ; 0x022D7CA4
	tst r0, #1
	ldrne r0, _022D7CF8 ; =ov00_02326C90
	ldrne r0, [r0, #0xc]
	bxne lr
	tst r0, #2
	ldrne r0, _022D7CF8 ; =ov00_02326C90
	ldrne r0, [r0]
	bxne lr
	tst r0, #4
	ldrne r0, _022D7CF8 ; =ov00_02326C90
	ldrne r0, [r0, #4]
	bxne lr
	tst r0, #8
	ldrne r0, _022D7CF8 ; =ov00_02326C90
	ldrne r0, [r0, #8]
	bxne lr
	tst r0, #0x10
	ldrne r0, _022D7CF8 ; =ov00_02326C90
	ldrne r0, [r0, #0x10]
	moveq r0, #0
	bx lr
	.align 2, 0
_022D7CF8: .word ov00_02326C90
	arm_func_end Dwci_AC_GetMemPtr

	arm_func_start Dwci_AC_SetPhase
Dwci_AC_SetPhase: ; 0x022D7CFC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r5, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	strb r6, [r5, #9]
	cmp r6, #0x10
	ldmhsia sp!, {r4, r5, r6, pc}
	ldrb r0, [r5, #0x16]
	cmp r6, r0
	strhib r6, [r5, #0x16]
	cmphi r6, #7
	ldmlsia sp!, {r4, r5, r6, pc}
	ldrb r0, [r4, #0xd0d]
	bl Dwci_ConvConnectApType
	strb r0, [r5, #0x15]
	ldrb r0, [r4, #0xd13]
	add r0, r4, r0, lsl #2
	ldrb r0, [r0, #0x444]
	strb r0, [r5, #0x14]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Dwci_AC_SetPhase

	arm_func_start Dwci_AC_GetPhase
Dwci_AC_GetPhase: ; 0x022D7D5C
	ldr r0, _022D7D74 ; =ov00_02326C90
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrneb r0, [r0, #9]
	moveq r0, #0
	bx lr
	.align 2, 0
_022D7D74: .word ov00_02326C90
	arm_func_end Dwci_AC_GetPhase

	arm_func_start Dwci_AC_SetError
Dwci_AC_SetError: ; 0x022D7D78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	str r5, [r4, #0xc]
	bl Dwci_AC_GetPhase
	strb r0, [r4, #0xa]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_SetError

	arm_func_start Dwci_AC_GetError
Dwci_AC_GetError: ; 0x022D7D9C
	ldr r0, _022D7DAC ; =ov00_02326C90
	ldr r0, [r0, #0xc]
	ldr r0, [r0, #0xc]
	bx lr
	.align 2, 0
_022D7DAC: .word ov00_02326C90
	arm_func_end Dwci_AC_GetError

	arm_func_start Dwci_AC_SetApType
Dwci_AC_SetApType: ; 0x022D7DB0
	stmdb sp!, {r4, lr}
	ldr r1, _022D7E54 ; =ov00_02326C90
	ldr r1, [r1, #0xc]
	ldrb r2, [r1, #0x22]
	cmp r2, #0
	bne _022D7DD0
	bl Dwci_ConvConnectApType
	mov r2, r0
_022D7DD0:
	ldr r1, _022D7E54 ; =ov00_02326C90
	mov r0, #0
	ldr r1, [r1, #0xc]
	strb r2, [r1, #0x17]
	bl Wcm_GetApEssid
	movs r4, r0
	beq _022D7E08
	mov r1, #0x20
	bl DC_InvalidateRange
	ldr r1, _022D7E54 ; =ov00_02326C90
	mov r0, r4
	ldr r1, [r1, #0xc]
	add r1, r1, #0x18
	bl Dwci_AC_GetPostalCode
_022D7E08:
	ldr r0, _022D7E54 ; =ov00_02326C90
	mov r1, #0
	ldr r3, [r0, #0xc]
	mov r2, r3
_022D7E18:
	ldrsb r0, [r2, #0x18]
	cmp r0, #0x20
	blt _022D7E2C
	cmp r0, #0x7e
	ble _022D7E40
_022D7E2C:
	add r0, r3, #0x18
	mov r1, #0
	mov r2, #0xa
	bl MI_CpuFill8
	ldmia sp!, {r4, pc}
_022D7E40:
	add r1, r1, #1
	cmp r1, #0xa
	add r2, r2, #1
	blt _022D7E18
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D7E54: .word ov00_02326C90
	arm_func_end Dwci_AC_SetApType

	arm_func_start Dwci_ConvConnectApType
Dwci_ConvConnectApType: ; 0x022D7E58
	cmp r0, #2
	subhi r0, r0, #3
	andhi r0, r0, #0xff
	bx lr
	arm_func_end Dwci_ConvConnectApType

	arm_func_start Free_Disused_Dwc
Free_Disused_Dwc: ; 0x022D7E68
	stmdb sp!, {r3, lr}
	ldr r1, _022D7E98 ; =ov00_02326C90
	mov r0, #8
	ldr r1, [r1, #8]
	mov r2, #0xc
	bl Dwci_AC_Free
	ldr r0, _022D7E98 ; =ov00_02326C90
	ldr r2, _022D7E9C ; =0x00000D18
	ldr r1, [r0, #0x10]
	mov r0, #0x10
	bl Dwci_AC_Free
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D7E98: .word ov00_02326C90
_022D7E9C: .word 0x00000D18
	arm_func_end Free_Disused_Dwc

	arm_func_start CheckDuplicate_Dwc
CheckDuplicate_Dwc: ; 0x022D7EA0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _022D7F3C ; =ov00_02326C90
	mov r1, #0xc0
	ldr r8, [r0, #0x10]
	ldrb r7, [r8, #0xd13]
	ldrb r2, [r8, #0xd0d]
	add r0, r8, #0x74
	smulbb r4, r7, r1
	add r5, r0, #0x400
	cmp r2, #6
	movhs r0, #1
	ldmhsia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb sb, [r8, #0xd12]
	mov r6, #0
	cmp sb, #0
	bls _022D7F34
	mov sl, r1
_022D7EE4:
	cmp r6, r7
	beq _022D7F24
	add r0, r8, r6, lsl #2
	ldrb r0, [r0, #0x445]
	cmp r0, #6
	bhs _022D7F24
	mul r1, r6, sl
	add r0, r8, r1
	add r0, r0, #0x400
	ldrh r2, [r0, #0x7a]
	add r0, r5, r4
	add r1, r5, r1
	bl strncmp
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022D7F24:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, sb
	blo _022D7EE4
_022D7F34:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022D7F3C: .word ov00_02326C90
	arm_func_end CheckDuplicate_Dwc

	arm_func_start Dwci_AC_GetBeacon
Dwci_AC_GetBeacon: ; 0x022D7F40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x10
	mvn r4, #0
	bl Dwci_AC_GetMemPtr
	mov r6, r0
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r1, #1
	strb r1, [r0, #0xb]
	bl Dwci_AC_GetPhase
	cmp r0, #3
	beq _022D7F88
	cmp r0, #4
	beq _022D7FF0
	cmp r0, #5
	beq _022D803C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D7F88:
	ldrh r1, [r7, #0xa]
	ldrb r5, [r6, #0xd11]
	cmp r1, #0
	ldrneb r0, [r7, #0xc]
	cmpne r0, #0
	bne _022D7FAC
	ldrh r0, [r7, #0x36]
	bl Dwci_AC_SetStealthChannel
	b _022D8084
_022D7FAC:
	cmp r1, #1
	cmpeq r0, #0x20
	bne _022D7FD8
	ldrh r0, [r7, #0x36]
	bl Dwci_AC_SetStealthChannel
	ldrb r1, [r6, #0xd10]
	mov r0, r7
	add r2, r6, #0x300
	bl CompareList_Dwc
	mov r4, r0
	b _022D8084
_022D7FD8:
	ldrb r1, [r6, #0xd10]
	mov r0, r7
	add r2, r6, #0x300
	bl CompareList_Dwc
	mov r4, r0
	b _022D8084
_022D7FF0:
	ldrb r2, [r6, #0xd0f]
	mov r1, #0xc0
	mov r0, r7
	mla r1, r2, r1, r6
	add r1, r1, #0x400
	ldrh r2, [r1, #0xa6]
	mov r1, r6
	sub r2, r2, #1
	and r5, r2, #0xff
	bl CompareListDiff_Dwc
	movs r4, r0
	bmi _022D8084
	ldrb r1, [r6, #0xd0f]
	add r0, r6, #0x47
	add r2, r0, #0x400
	ldrb r0, [r2, r1, lsl #2]
	orr r0, r0, #0x80
	strb r0, [r2, r1, lsl #2]
	b _022D8084
_022D803C:
	ldrb r1, [r6, #0xd0f]
	add r2, r6, #0x300
	mov r0, #0x24
	mla r2, r1, r0, r2
	mov r0, r7
	mov r1, #1
	ldrb r5, [r6, #0xd11]
	bl CompareList_Dwc
	movs r4, r0
	bmi _022D8084
	ldrb r1, [r6, #0xd0f]
	mov r0, #0x24
	add r2, r6, #0x300
	smulbb r1, r1, r0
	ldrb r0, [r2, r1]
	bic r0, r0, #0xf
	orr r0, r0, #1
	strb r0, [r2, r1]
_022D8084:
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	mov r1, r7
	mov r2, r5
	mov r3, r6
	bl AddList_Dwc
	mov r1, r6
	bl SortList_Dwc
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Dwci_AC_GetBeacon

	arm_func_start Dwci_AC_CheckNintendoSsid
Dwci_AC_CheckNintendoSsid: ; 0x022D80AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	ldrb r0, [r4, #0xd0c]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	cmpne r0, #4
	bne _022D80FC
	ldrh r0, [r5, #0x2c]
	mov r0, r0, asr #4
	and r0, r0, #1
	cmp r0, #1
	bne _022D80FC
	add r0, r5, #0xc
	bl Dwci_AC_CheckNintendoUsbAP
	cmp r0, #1
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
_022D80FC:
	ldrb r0, [r4, #0xd0c]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	cmpne r0, #5
	bne _022D8138
	ldrh r0, [r5, #0x2c]
	mov r0, r0, asr #4
	and r0, r0, #1
	cmp r0, #1
	bne _022D8138
	add r0, r5, #0xc
	bl Dwci_AC_CheckNintendoShopAP
	cmp r0, #1
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, pc}
_022D8138:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_CheckNintendoSsid

	arm_func_start CompareList_Dwc
CompareList_Dwc: ; 0x022D8140
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	ldrh r3, [r6, #0xa]
	mov r5, r1
	mov r4, r2
	cmp r3, #0x20
	bne _022D8168
	bl Dwci_AC_CheckNintendoSsid
	cmp r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D8168:
	cmp r5, #0
	mov r8, #0
	ble _022D81B4
	ldrh sb, [r6, #0xa]
	and r7, sb, #0xff
_022D817C:
	ldrb r0, [r4, #3]
	cmp r7, r0
	bne _022D81A4
	mov r2, sb
	add r0, r6, #0xc
	add r1, r4, #4
	bl strncmp
	cmp r0, #0
	ldreqb r0, [r4, #1]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022D81A4:
	add r8, r8, #1
	cmp r8, r5
	add r4, r4, #0x24
	blt _022D817C
_022D81B4:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CompareList_Dwc

	arm_func_start CompareListDiff_Dwc
CompareListDiff_Dwc: ; 0x022D81BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	ldrh r2, [sl, #0xa]
	mov sb, r1
	cmp r2, #0x20
	bne _022D81E0
	bl Dwci_AC_CheckNintendoSsid
	cmp r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022D81E0:
	ldrb r8, [sb, #0xd12]
	mov r4, #0
	cmp r8, #0
	ble _022D8244
	ldrh r7, [sl, #0xa]
	add r0, sb, #0x7c
	mov r5, sb
	add r6, r0, #0x400
_022D8200:
	add r0, r5, #0x400
	ldrh r0, [r0, #0x7a]
	cmp r7, r0
	bne _022D8230
	mov r1, r6
	mov r2, r7
	add r0, sl, #0xc
	bl strncmp
	cmp r0, #0
	addeq r0, sb, r4, lsl #2
	ldreqb r0, [r0, #0x445]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022D8230:
	add r4, r4, #1
	cmp r4, r8
	add r5, r5, #0xc0
	add r6, r6, #0xc0
	blt _022D8200
_022D8244:
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end CompareListDiff_Dwc

	arm_func_start AddList_Dwc
AddList_Dwc: ; 0x022D824C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r3
	ldrb r5, [r6, #0xd12]
	mvn r4, #0
	mov r3, #0
	cmp r5, #0
	ble _022D82D0
	ldrb lr, [r1, #4]
	add ip, r6, #0x74
	add ip, ip, #0x400
_022D8274:
	ldrb r7, [ip]
	cmp lr, r7
	ldreqb r8, [r1, #5]
	ldreqb r7, [ip, #1]
	cmpeq r8, r7
	ldreqb r8, [r1, #6]
	ldreqb r7, [ip, #2]
	cmpeq r8, r7
	ldreqb r8, [r1, #7]
	ldreqb r7, [ip, #3]
	cmpeq r8, r7
	ldreqb r8, [r1, #8]
	ldreqb r7, [ip, #4]
	cmpeq r8, r7
	ldreqb r8, [r1, #9]
	ldreqb r7, [ip, #5]
	cmpeq r8, r7
	moveq r4, r3
	beq _022D82D0
	add r3, r3, #1
	cmp r3, r5
	add ip, ip, #0xc0
	blt _022D8274
_022D82D0:
	mvn r3, #0
	cmp r4, r3
	bne _022D8300
	mov r3, r6
	and r0, r0, #0xff
	bl SetDataListTail_Dwc
	ldrb r0, [r6, #0xd12]
	mov r4, #0xa
	cmp r0, #0xa
	addlo r0, r0, #1
	strlob r0, [r6, #0xd12]
	b _022D830C
_022D8300:
	mov r0, r4
	mov r3, r6
	bl UpDateList_Dwc
_022D830C:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end AddList_Dwc

	arm_func_start SetDataListTail_Dwc
SetDataListTail_Dwc: ; 0x022D8314
	stmdb sp!, {r3, lr}
	add ip, r3, #0x6c
	strb r0, [ip, #0x401]
	ldrh r0, [r1, #2]
	and r2, r2, #0x7f
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	strb r0, [ip, #0x402]
	ldrb lr, [ip, #0x403]
	mov r0, r1
	bic r1, lr, #0x7f
	orr lr, r1, r2
	add r1, r3, #0xbf0
	mov r2, #0xc0
	strb lr, [ip, #0x403]
	bl MTi_CpuCopy32
	ldmia sp!, {r3, pc}
	arm_func_end SetDataListTail_Dwc

	arm_func_start UpDateList_Dwc
UpDateList_Dwc: ; 0x022D8360
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r4, [r1, #2]
	add ip, r3, #0x44
	mov lr, #0xc0
	add r5, ip, #0x400
	mul ip, r0, lr
	tst r4, #2
	add r0, r5, r0, lsl #2
	mov r4, r4, asr #2
	addeq r4, r4, #0x19
	and r4, r4, #0xff
	ldrb lr, [r0, #2]
	and r4, r4, #0xff
	add r3, r3, #0x470
	cmp r4, lr
	bls _022D83B8
	strb r4, [r0, #2]
	ldrb lr, [r0, #3]
	and r2, r2, #0x7f
	bic lr, lr, #0x7f
	orr r2, lr, r2
	strb r2, [r0, #3]
_022D83B8:
	mov r0, r1
	add r1, r3, ip
	mov r2, #0xc0
	bl MTi_CpuCopy32
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpDateList_Dwc

	arm_func_start SortList_Dwc
SortList_Dwc: ; 0x022D83CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc4
	mov r4, r0
	add r0, r1, #0x44
	add r7, r0, #0x400
	add r8, r1, #0x470
	subs r6, r4, #1
	bmi _022D8494
	mov r0, #0xc0
	mla sl, r6, r0, r8
	add sb, r7, r6, lsl #2
	add fp, sp, #0
_022D83FC:
	add r0, r7, r4, lsl #2
	ldrb r1, [r0, #2]
	add r0, r7, r6, lsl #2
	ldrb r0, [r0, #2]
	cmp r1, r0
	blo _022D8494
	mov r0, sb
	mov r1, fp
	mov r2, #4
	bl MTi_CpuCopy32
	add r5, r7, r4, lsl #2
	mov r0, r5
	mov r1, sb
	mov r2, #4
	bl MTi_CpuCopy32
	mov r1, r5
	mov r0, fp
	mov r2, #4
	bl MTi_CpuCopy32
	mov r0, sl
	add r1, sp, #4
	mov r2, #0xc0
	bl MTi_CpuCopy32
	mov r0, #0xc0
	mul r5, r4, r0
	add r0, r8, r5
	mov r1, sl
	mov r2, #0xc0
	bl MTi_CpuCopy32
	add r1, r8, r5
	add r0, sp, #4
	mov r2, #0xc0
	bl MTi_CpuCopy32
	mov r4, r6
	sub sb, sb, #4
	sub sl, sl, #0xc0
	subs r6, r6, #1
	bpl _022D83FC
_022D8494:
	add r1, r7, #0x28
	mov r0, #0
	mov r2, #4
	bl MTi_CpuClear32
	add r1, r8, #0x780
	mov r0, #0
	mov r2, #0xc0
	bl MTi_CpuClear32
	add sp, sp, #0xc4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SortList_Dwc

	arm_func_start Dwci_AC_CallBackWcm
Dwci_AC_CallBackWcm: ; 0x022D84BC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	ldrsh r1, [r4]
	cmp r1, #5
	bne _022D8534
	ldrsh r1, [r4, #2]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #8]
	cmp r1, #0xd
	beq _022D8504
	cmp r1, #0xf
	beq _022D8510
	cmp r1, #0x11
	beq _022D851C
	b _022D8528
_022D8504:
	mov r1, #1
	strb r1, [r0, #0xd14]
	ldmia sp!, {r4, pc}
_022D8510:
	mov r1, #2
	strb r1, [r0, #0xd14]
	ldmia sp!, {r4, pc}
_022D851C:
	mov r1, #3
	strb r1, [r0, #0xd14]
	ldmia sp!, {r4, pc}
_022D8528:
	mov r1, #4
	strb r1, [r0, #0xd14]
	ldmia sp!, {r4, pc}
_022D8534:
	cmp r1, #7
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	bl Dwci_AC_GetBeacon
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_CallBackWcm

	arm_func_start Dwci_AC_ConnectAP
Dwci_AC_ConnectAP: ; 0x022D8548
	stmdb sp!, {r4, lr}
	bl Dwci_AC_GetPhase
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	cmp r4, #7
	beq _022D8570
	cmp r4, #8
	beq _022D857C
	b _022D8584
_022D8570:
	bl ConnectStart_Dwc
	mov r4, r0
	b _022D8584
_022D857C:
	bl ConnectAP_Dwc
	mov r4, r0
_022D8584:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_ConnectAP

	arm_func_start ConnectStart_Dwc
ConnectStart_Dwc: ; 0x022D858C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r2, [r5, #0xd13]
	add r3, r5, #0x470
	mov r1, #0xc0
	mla r4, r2, r1, r3
	bl GetConnectType_Dwc
	add r1, r5, #0xb8
	strb r0, [r5, #0xd0d]
	add r0, r1, #0xc00
	mov r1, #0
	mov r2, #0x52
	bl MI_CpuFill8
	add r2, r5, #0xb8
	ldrb r1, [r5, #0xd0d]
	mov r0, r5
	add r2, r2, #0xc00
	bl GetWepKey_Dwc
	cmp r0, #0
	ldrb r0, [r5, #0xd0b]
	bic r0, r0, #0xc
	beq _022D8640
	orr r0, r0, #4
	strb r0, [r5, #0xd0b]
	ldrh r0, [r4, #0x2c]
	mov r0, r0, asr #4
	tst r0, #1
	bne _022D8614
	ldrb r1, [r5, #0xd13]
	mov r2, #3
	mov r0, #9
	add r1, r5, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, pc}
_022D8614:
	ldrb r0, [r5, #0xd0d]
	cmp r0, #6
	ldreqb r0, [r4, #0x15]
	cmpeq r0, #0
	bne _022D8670
	ldrb r1, [r5, #0xd13]
	mov r2, #3
	mov r0, #9
	add r1, r5, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, pc}
_022D8640:
	strb r0, [r5, #0xd0b]
	ldrh r0, [r4, #0x2c]
	mov r0, r0, asr #4
	and r0, r0, #1
	cmp r0, #1
	bne _022D8670
	ldrb r1, [r5, #0xd13]
	mov r2, #3
	mov r0, #9
	add r1, r5, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, pc}
_022D8670:
	mov r0, #0
	strb r0, [r5, #0xd15]
	strb r0, [r5, #0xd14]
	mov r0, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ConnectStart_Dwc

	arm_func_start ConnectAP_Dwc
ConnectAP_Dwc: ; 0x022D8684
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl Wcm_GetPhase
	ldrb r2, [r7, #0xd13]
	mov r1, #0xc0
	cmp r0, #3
	add r5, r7, #0x470
	smulbb r4, r2, r1
	bne _022D8794
	mov r0, r7
	bl GetPowerMode_Dwc
	ldrb r1, [r7, #0xd15]
	mov r6, r0
	add r0, r1, #1
	and r1, r0, #0xff
	strb r0, [r7, #0xd15]
	cmp r1, #3
	bls _022D86EC
	mov r0, #0
	strb r0, [r7, #0xd15]
	ldrb r1, [r7, #0xd13]
	mov r2, #1
	mov r0, #9
	add r1, r7, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D86EC:
	cmp r1, #1
	beq _022D8770
	ldrb r0, [r7, #0xd14]
	cmp r0, #1
	bne _022D8710
	ldrb r0, [r7, #0xd0b]
	bic r0, r0, #0xc
	strb r0, [r7, #0xd0b]
	b _022D8770
_022D8710:
	cmp r0, #2
	bne _022D8738
	mov r0, #0
	strb r0, [r7, #0xd15]
	ldrb r1, [r7, #0xd13]
	mov r2, #3
	mov r0, #9
	add r1, r7, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D8738:
	cmp r0, #3
	bne _022D8760
	mov r0, #0
	strb r0, [r7, #0xd15]
	ldrb r1, [r7, #0xd13]
	mov r2, #4
	mov r0, #9
	add r1, r7, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D8760:
	cmp r1, #3
	ldreqb r0, [r7, #0xd0b]
	biceq r0, r0, #0xc
	streqb r0, [r7, #0xd0b]
_022D8770:
	mov r0, r7
	bl GetAuthMode_Dwc
	mov r2, r0
	add r1, r7, #0xb8
	add r0, r5, r4
	add r1, r1, #0xc00
	orr r2, r6, r2
	bl Wcm_ConnectAsync
	b _022D87B8
_022D8794:
	cmp r0, #9
	bne _022D87B8
	mov r0, #0
	strb r0, [r7, #0xd15]
	bl OS_GetTick
	str r0, [r7, #0xcb0]
	str r1, [r7, #0xcb4]
	mov r0, #0xa
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022D87B8:
	mov r0, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ConnectAP_Dwc

	arm_func_start GetConnectType_Dwc
GetConnectType_Dwc: ; 0x022D87C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r2, [sl, #0xd13]
	ldrb r1, [sl, #0xd0c]
	add r3, sl, #0x470
	mov r0, #0xc0
	mla r4, r2, r0, r3
	mov r0, r1, lsl #0x18
	movs r0, r0, lsr #0x1e
	mov r0, #0
	str r0, [sp]
	bne _022D88DC
	ldrh r0, [r4, #0xa]
	ldr r6, [sp]
	cmp r0, #0x20
	bne _022D8820
	mov r0, r4
	bl Dwci_AC_CheckNintendoSsid
	cmp r0, #0
	str r0, [sp]
	movle r0, #0
	addgt r6, r6, #1
	strle r0, [sp]
	b _022D8844
_022D8820:
	cmp r0, #8
	bne _022D8844
	mov r0, r4
	bl Dwci_AC_CheckFreespot
	cmp r0, #0
	str r0, [sp]
	moveq r0, #0
	addne r6, r6, #1
	streq r0, [sp]
_022D8844:
	ldrb r0, [sl, #0xd10]
	mov r5, #0
	cmp r0, #0
	ble _022D8950
	mov r7, sl
	add r8, sl, #0x304
	add sb, sl, #0x300
	add fp, sl, #0x10c
_022D8864:
	ldrh r2, [r4, #0xa]
	ldrb r0, [r7, #0x303]
	cmp r2, r0
	bne _022D88BC
	mov r1, r8
	add r0, r4, #0xc
	bl strncmp
	cmp r0, #0
	bne _022D88BC
	cmp r6, #0
	ldreqb r0, [r7, #0x301]
	streq r0, [sp]
	beq _022D88B8
	ldrb r0, [sb]
	bic r0, r0, #0xf0
	orr r0, r0, #0x10
	strb r0, [sb]
	ldrb r0, [fp, #0xc00]
	bic r0, r0, #0xc0
	orr r0, r0, #0x40
	strb r0, [fp, #0xc00]
_022D88B8:
	add r6, r6, #1
_022D88BC:
	ldrb r0, [sl, #0xd10]
	add r5, r5, #1
	add r7, r7, #0x24
	cmp r5, r0
	add r8, r8, #0x24
	add sb, sb, #0x24
	blt _022D8864
	b _022D8950
_022D88DC:
	ldrb r0, [sl, #0xd10]
	ldr r5, [sp]
	mov r4, r5
	cmp r0, #0
	ble _022D8940
	mov r3, sl
	add r2, sl, #0x300
_022D88F8:
	ldrb r0, [r2]
	mov r1, r0, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	bne _022D8928
	cmp r4, #0
	bne _022D8924
	bic r0, r0, #0xf0
	strb r0, [r2]
	ldrb r0, [r3, #0x301]
	str r0, [sp]
_022D8924:
	add r4, r4, #1
_022D8928:
	ldrb r0, [sl, #0xd10]
	add r5, r5, #1
	add r2, r2, #0x24
	cmp r5, r0
	add r3, r3, #0x24
	blt _022D88F8
_022D8940:
	cmp r4, #1
	ldreqb r0, [sl, #0xd0c]
	biceq r0, r0, #0xc0
	streqb r0, [sl, #0xd0c]
_022D8950:
	ldr r0, [sp]
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end GetConnectType_Dwc

	arm_func_start GetPowerMode_Dwc
GetPowerMode_Dwc: ; 0x022D895C
	ldrb r0, [r0, #0xd0b]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	moveq r0, #0x30000
	movne r0, #0x20000
	bx lr
	arm_func_end GetPowerMode_Dwc

	arm_func_start GetAuthMode_Dwc
GetAuthMode_Dwc: ; 0x022D8978
	ldrb r0, [r0, #0xd0b]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	moveq r0, #0xc0000
	movne r0, #0x80000
	bx lr
	arm_func_end GetAuthMode_Dwc

	arm_func_start GetWepKey_Dwc
GetWepKey_Dwc: ; 0x022D8994
	stmdb sp!, {r4, lr}
	mov r4, r2
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _022D8A6C
_022D89A8: ; jump table
	b _022D89D8 ; case 0
	b _022D89D4 ; case 1
	b _022D89D0 ; case 2
	b _022D8A04 ; case 3
	b _022D8A00 ; case 4
	b _022D89FC ; case 5
	b _022D8A20 ; case 6
	b _022D8A48 ; case 7
	b _022D8A6C ; case 8
	b _022D8A6C ; case 9
_022D89D0:
	add r0, r0, #0x100
_022D89D4:
	add r0, r0, #0x100
_022D89D8:
	ldrb r2, [r0, #0xe6]
	add r0, r0, #0x80
	add r1, r4, #2
	mov r2, r2, lsl #0x1e
	mov r3, r2, lsr #0x1e
	mov r2, #0x10
	strb r3, [r4]
	bl MI_CpuCopy8
	b _022D8A6C
_022D89FC:
	add r0, r0, #0x100
_022D8A00:
	add r0, r0, #0x100
_022D8A04:
	mov r3, #1
	add r0, r0, #0xd1
	add r1, r4, #2
	mov r2, #5
	strb r3, [r4]
	bl MI_CpuCopy8
	b _022D8A6C
_022D8A20:
	mov r1, #2
	strb r1, [r4]
	ldrb r1, [r0, #0xd13]
	add r0, r0, #0x7c
	add r2, r0, #0x400
	mov r0, #0xc0
	mla r0, r1, r0, r2
	add r1, r4, #2
	bl Dwci_AC_GetNintendoUsbWepKey
	b _022D8A6C
_022D8A48:
	mov r1, #2
	strb r1, [r4]
	ldrb r1, [r0, #0xd13]
	add r0, r0, #0x7c
	add r2, r0, #0x400
	mov r0, #0xc0
	mla r0, r1, r0, r2
	add r1, r4, #2
	bl Dwci_AC_GetNintendoShopWepKey
_022D8A6C:
	ldrb r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetWepKey_Dwc

	arm_func_start Dwci_AC_CloseNetwork
Dwci_AC_CloseNetwork: ; 0x022D8A80
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xa
	bhi _022D8ACC
	bl DisConnectAP_Dwc
	cmp r0, #1
	bne _022D8AB0
	mov r0, #0
	strb r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D8AB0:
	mvn r1, #0
	cmp r0, r1
	bne _022D8B00
	mov r0, #0x12
	strb r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D8ACC:
	cmp r0, #0xe
	bne _022D8AE8
	bl Dwc_Netcheck_Abort
	bl Dwc_Netcheck_Destroy
	mov r0, #0xc
	strb r0, [r4]
	b _022D8B00
_022D8AE8:
	cmp r0, #0x12
	bhs _022D8B00
	bl CloseSocket_Dwc
	cmp r0, #1
	moveq r0, #0xa
	streqb r0, [r4]
_022D8B00:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_CloseNetwork

	arm_func_start DisConnectAP_Dwc
DisConnectAP_Dwc: ; 0x022D8B08
	stmdb sp!, {r3, lr}
	bl Wcm_GetPhase
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022D8B90
_022D8B1C: ; jump table
	b _022D8B50 ; case 0
	b _022D8B58 ; case 1
	b _022D8B90 ; case 2
	b _022D8B60 ; case 3
	b _022D8B90 ; case 4
	b _022D8B90 ; case 5
	b _022D8B68 ; case 6
	b _022D8B90 ; case 7
	b _022D8B90 ; case 8
	b _022D8B70 ; case 9
	b _022D8B90 ; case 10
	b _022D8B80 ; case 11
	b _022D8B78 ; case 12
_022D8B50:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022D8B58:
	bl Wcm_Finish
	b _022D8B90
_022D8B60:
	bl Wcm_CleanupAsync
	b _022D8B90
_022D8B68:
	bl Wcm_EndSearchAsync
	b _022D8B90
_022D8B70:
	bl Wcm_DisconnectAsync
	b _022D8B90
_022D8B78:
	bl Wcm_TerminateAsync
	b _022D8B90
_022D8B80:
	mov r0, #0
	bl Dwci_AC_SetError
	mvn r0, #0
	ldmia sp!, {r3, pc}
_022D8B90:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end DisConnectAP_Dwc

	arm_func_start CloseSocket_Dwc
CloseSocket_Dwc: ; 0x022D8B98
	stmdb sp!, {r3, lr}
	ldr r0, _022D8BDC ; =ov00_02318868
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl Socl_CalmDown
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl ov00_022CF7E8
	cmp r0, #0
	mvnne r1, #0x26
	cmpne r0, r1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D8BDC: .word ov00_02318868
	arm_func_end CloseSocket_Dwc

	arm_func_start Dwci_AC_Error
Dwci_AC_Error: ; 0x022D8BE0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	add r0, r0, #0xa
	bl Dwci_AC_CloseNetwork
	cmp r0, #1
	moveq r0, #0x12
	movne r0, #0x11
	ldmia sp!, {r3, pc}
	arm_func_end Dwci_AC_Error

	arm_func_start Dwci_AC_GetResult
Dwci_AC_GetResult: ; 0x022D8C04
	stmdb sp!, {r4, lr}
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	bl Dwci_AC_GetError
	cmp r0, #4
	bge _022D8C28
	bl GetProgramaError_Dwc
	ldmia sp!, {r4, pc}
_022D8C28:
	cmp r0, #5
	bge _022D8C38
	bl GetIrregularError_Dwc
	ldmia sp!, {r4, pc}
_022D8C38:
	cmp r0, #5
	mov r0, r4
	bne _022D8C4C
	bl GetNotFoundAP_Dwc
	ldmia sp!, {r4, pc}
_022D8C4C:
	bl GetNotFoundInet_Dwc
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_GetResult

	arm_func_start GetProgramaError_Dwc
GetProgramaError_Dwc: ; 0x022D8C54
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022D8C90
_022D8C60: ; jump table
	b _022D8C78 ; case 0
	b _022D8C70 ; case 1
	b _022D8C80 ; case 2
	b _022D8C88 ; case 3
_022D8C70:
	mvn r0, #8
	bx lr
_022D8C78:
	mvn r0, #9
	bx lr
_022D8C80:
	mvn r0, #7
	bx lr
_022D8C88:
	mvn r0, #6
	bx lr
_022D8C90:
	mov r0, #0
	bx lr
	arm_func_end GetProgramaError_Dwc

	arm_func_start GetIrregularError_Dwc
GetIrregularError_Dwc: ; 0x022D8C98
	mvn r0, #5
	bx lr
	arm_func_end GetIrregularError_Dwc

	arm_func_start GetNotFoundAP_Dwc
GetNotFoundAP_Dwc: ; 0x022D8CA0
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	ldreq r0, _022D8CB4 ; =0xFFFF3C4D
	ldrne r0, _022D8CB8 ; =0xFFFF3865
	bx lr
	.align 2, 0
_022D8CB4: .word 0xFFFF3C4D
_022D8CB8: .word 0xFFFF3865
	arm_func_end GetNotFoundAP_Dwc

	arm_func_start GetNotFoundInet_Dwc
GetNotFoundInet_Dwc: ; 0x022D8CBC
	ldrb r1, [r0, #0x22]
	ldrb r2, [r0, #0x16]
	cmp r1, #0
	ldreqb r1, [r0, #0x15]
	cmp r2, #0xa
	bhs _022D8D08
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	ldreq r0, _022D8DA4 ; =0xFFFF3864
	subeq r0, r0, r1
	bxeq lr
	cmp r0, #4
	ldrne r0, _022D8DA8 ; =0xFFFF379C
	subne r0, r0, r1
	bxne lr
	mov r0, #0xc800
	rsb r0, r0, #0
	sub r0, r0, r1
	bx lr
_022D8D08:
	cmp r2, #0xd
	ldrlo r0, _022D8DAC ; =0xFFFF34E0
	sublo r0, r0, r1
	bxlo lr
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldreq r0, _022D8DB0 ; =0xFFFF3CB0
	subeq r0, r0, r1
	bxeq lr
	mvn r3, #0
	cmp r0, r3
	ldreq r0, _022D8DB4 ; =0xFFFF347C
	subeq r0, r0, r1
	bxeq lr
	sub r2, r3, #1
	cmp r0, r2
	ldreq r0, _022D8DB8 ; =0xFFFF3418
	subeq r0, r0, r1
	bxeq lr
	sub r2, r3, #2
	cmp r0, r2
	ldreq r0, _022D8DBC ; =0xFFFF33B4
	subeq r0, r0, r1
	bxeq lr
	sub r2, r3, #3
	cmp r0, r2
	ldreq r0, _022D8DC0 ; =0xFFFF30F8
	subeq r0, r0, r1
	bxeq lr
	sub r2, r3, #4
	cmp r0, r2
	ldreq r0, _022D8DC4 ; =0xFFFF3094
	subeq r0, r0, r1
	bxeq lr
	sub r2, r3, #5
	cmp r0, r2
	ldreq r0, _022D8DC8 ; =0xFFFF3030
	subeq r0, r0, r1
	bx lr
	.align 2, 0
_022D8DA4: .word 0xFFFF3864
_022D8DA8: .word 0xFFFF379C
_022D8DAC: .word 0xFFFF34E0
_022D8DB0: .word 0xFFFF3CB0
_022D8DB4: .word 0xFFFF347C
_022D8DB8: .word 0xFFFF3418
_022D8DBC: .word 0xFFFF33B4
_022D8DC0: .word 0xFFFF30F8
_022D8DC4: .word 0xFFFF3094
_022D8DC8: .word 0xFFFF3030
	arm_func_end GetNotFoundInet_Dwc

	arm_func_start Dwci_AC_MakeSearchList
Dwci_AC_MakeSearchList: ; 0x022D8DCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	cmp r5, #0
	beq _022D8DFC
	cmp r5, #1
	beq _022D8E1C
	cmp r5, #2
	beq _022D8E34
	b _022D8E58
_022D8DFC:
	add r1, r4, #0x300
	mov r0, #0
	mov r2, #0x144
	bl MTi_CpuClear32
	mov r0, r4
	bl MakeAroundList_Dwc
	strb r0, [r4, #0xd10]
	b _022D8E58
_022D8E1C:
	bl MakeDifferChannelList_Dwc
	strb r0, [r4, #0xd10]
	mov r0, r4
	bl CheckDifferChannelStart_Dwc
	strb r0, [r4, #0xd0f]
	b _022D8E58
_022D8E34:
	add r1, r4, #0x300
	mov r0, #0
	mov r2, #0x144
	bl MTi_CpuClear32
	mov r1, #0
	mov r0, r4
	strb r1, [r4, #0xd0f]
	bl MakeStealthList_Dwc
	strb r0, [r4, #0xd10]
_022D8E58:
	ldrb r0, [r4, #0xd10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_MakeSearchList

	arm_func_start Dwci_AC_CheckFreespot
Dwci_AC_CheckFreespot: ; 0x022D8E60
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	ldrb r0, [r0, #0xd0c]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	cmpne r0, #6
	bne _022D8EA0
	ldr r1, _022D8EA8 ; =ov00_02318188
	add r0, r4, #0xc
	mov r2, #8
	bl strncmp
	cmp r0, #0
	moveq r0, #8
	ldmeqia sp!, {r4, pc}
_022D8EA0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D8EA8: .word ov00_02318188
	arm_func_end Dwci_AC_CheckFreespot

	arm_func_start MakeAroundList_Dwc
MakeAroundList_Dwc: ; 0x022D8EAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r4, r5, #0x300
	bl MakeUserList_Dwc
	ldrb r1, [r5, #0xd0c]
	mov r5, r0
	mov r0, #0x24
	mla r4, r5, r0, r4
	mov r1, r1, lsl #0x1c
	movs r0, r1, lsr #0x1c
	cmpne r0, #6
	bne _022D8F00
	ldr r0, _022D8F08 ; =ov00_02318188
	add r1, r4, #4
	mov r2, #8
	bl MI_CpuCopy8
	mov r1, #8
	strb r1, [r4, #3]
	add r0, r5, #1
	strb r1, [r4, #1]
	and r5, r0, #0xff
_022D8F00:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D8F08: .word ov00_02318188
	arm_func_end MakeAroundList_Dwc

	arm_func_start MakeStealthList_Dwc
MakeStealthList_Dwc: ; 0x022D8F0C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r5, r6, #0x300
	bl MakeUserList_Dwc
	ldrb r1, [r6, #0xd0c]
	mov r4, r0
	mov r0, #0x24
	mla r5, r4, r0, r5
	mov r1, r1, lsl #0x1c
	movs r0, r1, lsr #0x1c
	cmpne r0, #4
	bne _022D8F68
	ldr r0, _022D8FEC ; =ov00_02318AF4
	add r1, r5, #4
	mov r2, #8
	bl MI_CpuCopy8
	mov r1, #8
	add r0, r4, #1
	strb r1, [r5, #3]
	mov r1, #6
	strb r1, [r5, #1]
	and r4, r0, #0xff
	add r5, r5, #0x24
_022D8F68:
	ldrb r0, [r6, #0xd0c]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	cmpne r0, #7
	bne _022D8FA8
	ldr r0, _022D8FF0 ; =ov00_02318180
	add r1, r5, #4
	mov r2, #8
	bl MI_CpuCopy8
	mov r1, #8
	add r0, r4, #1
	strb r1, [r5, #3]
	mov r1, #9
	strb r1, [r5, #1]
	and r4, r0, #0xff
	add r5, r5, #0x24
_022D8FA8:
	ldrb r0, [r6, #0xd0c]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	cmpne r0, #8
	bne _022D8FE4
	ldr r0, _022D8FF4 ; =ov00_02318190
	add r1, r5, #4
	mov r2, #0xb
	bl MI_CpuCopy8
	mov r1, #0xb
	add r0, r4, #1
	strb r1, [r5, #3]
	mov r1, #0xa
	strb r1, [r5, #1]
	and r4, r0, #0xff
_022D8FE4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D8FEC: .word ov00_02318AF4
_022D8FF0: .word ov00_02318180
_022D8FF4: .word ov00_02318190
	arm_func_end MakeStealthList_Dwc

	arm_func_start MakeUserList_Dwc
MakeUserList_Dwc: ; 0x022D8FF8
	stmdb sp!, {r4, r5, r6, lr}
	mov r2, #0
	mov r3, r0
	mov r1, r2
	add ip, r0, #0x300
_022D900C:
	ldrb r4, [r0, #0xd0c]
	mov r4, r4, lsl #0x1c
	movs r5, r4, lsr #0x1c
	addne r4, r1, #1
	cmpne r5, r4
	bne _022D90E8
	ldrb r4, [r3, #0xe7]
	cmp r4, #0xff
	beq _022D90E8
	mov r6, #0
_022D9034:
	add r4, r3, r6
	ldrb lr, [r4, #0x40]
	cmp lr, #0
	beq _022D905C
	add r4, r6, #1
	add r5, ip, r6
	and r6, r4, #0xff
	strb lr, [r5, #4]
	cmp r6, #0x20
	blo _022D9034
_022D905C:
	cmp r6, #0
	moveq r4, #0
	beq _022D9074
	strb r6, [ip, #3]
	strb r1, [ip, #1]
	mov r4, #1
_022D9074:
	cmp r4, #0
	ldrb r4, [r3, #0xe7]
	addne r2, r2, #1
	andne r2, r2, #0xff
	addne ip, ip, #0x24
	cmp r4, #1
	bne _022D90E8
	mov r6, #0
_022D9094:
	add r4, r3, r6
	ldrb r5, [r4, #0x60]
	cmp r5, #0
	beq _022D90BC
	add lr, r6, #1
	add r4, ip, r6
	and r6, lr, #0xff
	strb r5, [r4, #4]
	cmp r6, #0x20
	blo _022D9094
_022D90BC:
	cmp r6, #0
	moveq r4, #0
	beq _022D90D8
	strb r6, [ip, #3]
	add lr, r1, #3
	strb lr, [ip, #1]
	mov r4, #1
_022D90D8:
	cmp r4, #0
	addne r2, r2, #1
	andne r2, r2, #0xff
	addne ip, ip, #0x24
_022D90E8:
	add r1, r1, #1
	cmp r1, #3
	add r3, r3, #0x100
	blt _022D900C
	mov r0, r2
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MakeUserList_Dwc

	arm_func_start MakeDifferChannelList_Dwc
MakeDifferChannelList_Dwc: ; 0x022D9100
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r3, [r0, #0xd12]
	mov r2, #0
	mov r1, r2
	cmp r3, #0
	ble _022D9188
	add r3, r0, #0x47
	mov ip, r0
	add r3, r3, #0x400
_022D9124:
	add r4, r0, r1, lsl #2
	ldrb r4, [r4, #0x444]
	cmp r4, #0
	bne _022D9164
	add lr, ip, #0x400
	ldrh r4, [lr, #0xa6]
	ldrb lr, [r3]
	sub r5, r4, #1
	mov r4, lr, lsl #0x19
	cmp r5, r4, lsr #25
	beq _022D9164
	bic lr, lr, #0x80
	add r2, r2, #1
	strb lr, [r3]
	and r2, r2, #0xff
	b _022D9170
_022D9164:
	ldrb lr, [r3]
	orr lr, lr, #0x80
	strb lr, [r3]
_022D9170:
	ldrb lr, [r0, #0xd12]
	add r1, r1, #1
	add r3, r3, #4
	cmp r1, lr
	add ip, ip, #0xc0
	blt _022D9124
_022D9188:
	mov r0, r2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end MakeDifferChannelList_Dwc

	arm_func_start CheckDifferChannelStart_Dwc
CheckDifferChannelStart_Dwc: ; 0x022D9190
	ldrb ip, [r0, #0xd12]
	mov r3, #0
	mov r2, r3
	cmp ip, #0
	bls _022D91CC
_022D91A4:
	add r1, r0, r2, lsl #2
	ldrb r1, [r1, #0x447]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	moveq r3, r2
	beq _022D91CC
	add r1, r2, #1
	and r2, r1, #0xff
	cmp r2, ip
	blo _022D91A4
_022D91CC:
	mov r0, r3
	bx lr
	arm_func_end CheckDifferChannelStart_Dwc

	arm_func_start Dwci_AC_ConnectRetryAP
Dwci_AC_ConnectRetryAP: ; 0x022D91D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	mov r5, #9
	bl Wcm_GetPhase
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022D92A8
_022D91F8: ; jump table
	b _022D92A8 ; case 0
	b _022D92A8 ; case 1
	b _022D92A8 ; case 2
	b _022D922C ; case 3
	b _022D92A8 ; case 4
	b _022D92A8 ; case 5
	b _022D9278 ; case 6
	b _022D92A8 ; case 7
	b _022D92A8 ; case 8
	b _022D9280 ; case 9
	b _022D92A8 ; case 10
	b _022D929C ; case 11
	b _022D9288 ; case 12
_022D922C:
	ldrb r0, [r4, #0xd0c]
	ldrb r5, [r4, #0xd0e]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	bne _022D925C
	ldrb r0, [r4, #0xd13]
	mov r1, #0
	mov r5, #7
	add r0, r4, r0, lsl #2
	strb r1, [r0, #0x444]
	b _022D92A8
_022D925C:
	cmp r5, #3
	blo _022D92A8
	cmp r5, #5
	bhi _022D92A8
	mov r0, r5
	bl Dwci_AC_SearchReStart
	b _022D92A8
_022D9278:
	bl Wcm_EndSearchAsync
	b _022D92A8
_022D9280:
	bl Wcm_DisconnectAsync
	b _022D92A8
_022D9288:
	bl Wcm_TerminateAsync
	mov r0, #4
	bl Dwci_AC_SetError
	mov r5, #0x11
	b _022D92A8
_022D929C:
	mov r0, #0
	bl Dwci_AC_SetError
	mov r5, #0x11
_022D92A8:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_ConnectRetryAP

	arm_func_start Dwci_AC_SearchAP
Dwci_AC_SearchAP: ; 0x022D92B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	bl Dwci_AC_GetPhase
	mov r5, r0
	bl Wcm_GetPhase
	cmp r5, #2
	cmpeq r0, #3
	bne _022D92E8
	mov r0, r4
	bl SearchStart_Dwc
	mov r5, r0
	b _022D936C
_022D92E8:
	cmp r5, #6
	bne _022D9304
	mov r0, r4
	mov r1, r5
	bl SearchEndCheck_Dwc
	mov r5, r0
	b _022D936C
_022D9304:
	cmp r0, #3
	cmpne r0, #6
	bne _022D936C
	mov r0, r4
	mov r1, r5
	bl SearchEndCheck_Dwc
	mov r5, r0
	cmp r5, #7
	beq _022D936C
	cmp r5, #3
	bne _022D9340
	mov r0, r4
	bl SearchAround_Dwc
	mov r5, r0
	b _022D936C
_022D9340:
	cmp r5, #4
	bne _022D9358
	mov r0, r4
	bl SearchDifferChannel_Dwc
	mov r5, r0
	b _022D936C
_022D9358:
	cmp r5, #5
	bne _022D936C
	mov r0, r4
	bl SearchStealth_Dwc
	mov r5, r0
_022D936C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_SearchAP

	arm_func_start Dwci_AC_SetStealthChannel
Dwci_AC_SetStealthChannel: ; 0x022D9374
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	add r0, r0, #0xd00
	cmp r4, #0xd
	movhi r4, #0xd
	ldrh r3, [r0, #0x16]
	sub r1, r4, #1
	mov r2, #1
	orr r1, r3, r2, lsl r1
	strh r1, [r0, #0x16]
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_SetStealthChannel

	arm_func_start Dwci_AC_GetStealthChannel
Dwci_AC_GetStealthChannel: ; 0x022D93A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	add r0, r0, #0xd00
	ldrh ip, [r0, #0x16]
	cmp ip, #0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0
	mov r3, r2
	mov r1, #1
_022D93D8:
	tst ip, r1, lsl r2
	beq _022D93F8
	cmp r3, r4
	moveq r0, r2, lsl #0x18
	moveq r0, r0, asr #0x18
	ldmeqia sp!, {r4, pc}
	add r0, r3, #1
	and r3, r0, #0xff
_022D93F8:
	add r0, r2, #1
	and r2, r0, #0xff
	cmp r2, #0xd
	blo _022D93D8
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_GetStealthChannel

	arm_func_start Dwci_AC_SearchReStart
Dwci_AC_SearchReStart: ; 0x022D9410
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	cmp r5, #3
	beq _022D9440
	cmp r5, #4
	beq _022D9468
	cmp r5, #5
	beq _022D94B4
	ldmia sp!, {r3, r4, r5, pc}
_022D9440:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	add r0, r4, #0xd00
	ldrsb r2, [r0, #0x11]
	ldr r0, _022D94E8 ; =ov00_02318158
	ldr r1, _022D94EC ; =ov00_02318160
	mov r3, #0x200000
	bl ScanStart_Dwc
	ldmia sp!, {r3, r4, r5, pc}
_022D9468:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	ldrb r2, [r4, #0xd0f]
	mov r0, #0xc0
	add r1, r4, #0x74
	smulbb ip, r2, r0
	add r0, r4, ip
	add r0, r0, #0x400
	ldrh r2, [r0, #0xa6]
	add r0, r4, #0x7c
	add r3, r1, #0x400
	add r1, r0, #0x400
	add r0, r3, ip
	add r1, r1, ip
	sub r2, r2, #1
	mov r3, #0x300000
	bl ScanStart_Dwc
	ldmia sp!, {r3, r4, r5, pc}
_022D94B4:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	ldrb r3, [r4, #0xd0f]
	add r1, r4, #0x304
	mov r0, #0x24
	add r2, r4, #0xd00
	mla r1, r3, r0, r1
	ldrsb r2, [r2, #0x11]
	ldr r0, _022D94E8 ; =ov00_02318158
	mov r3, #0x300000
	bl ScanStart_Dwc
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022D94E8: .word ov00_02318158
_022D94EC: .word ov00_02318160
	arm_func_end Dwci_AC_SearchReStart

	arm_func_start SearchStart_Dwc
SearchStart_Dwc: ; 0x022D94F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	mov r0, #0
	strb r0, [r4, #0xd11]
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	add r0, r4, #0xd00
	ldrsb r2, [r0, #0x11]
	ldr r0, _022D9538 ; =ov00_02318158
	ldr r1, _022D953C ; =ov00_02318160
	mov r3, #0x200000
	bl ScanStart_Dwc
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D9538: .word ov00_02318158
_022D953C: .word ov00_02318160
	arm_func_end SearchStart_Dwc

	arm_func_start SearchAround_Dwc
SearchAround_Dwc: ; 0x022D9540
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_GetTick
	ldr r3, [r4, #0xcb0]
	ldr r2, [r4, #0xcb4]
	subs r3, r0, r3
	sbc r0, r1, r2
	mov r1, r0, lsl #6
	ldr r2, _022D95D8 ; =0x000082EA
	orr r1, r1, r3, lsr #26
	mov r0, r3, lsl #6
	mov r3, #0
	bl _ll_udiv
	cmp r1, #0
	cmpeq r0, #0x12c
	blo _022D95D0
	add r0, r4, #0xd00
	ldrsb r1, [r0, #0x11]
	add r1, r1, #2
	strb r1, [r4, #0xd11]
	ldrsb r0, [r0, #0x11]
	cmp r0, #0xd
	blt _022D95AC
	mov r0, r4
	mov r1, #3
	bl NextSearchCheck_Dwc
	ldmia sp!, {r4, pc}
_022D95AC:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	add r0, r4, #0xd00
	ldrsb r2, [r0, #0x11]
	ldr r0, _022D95DC ; =ov00_02318158
	ldr r1, _022D95E0 ; =ov00_02318160
	mov r3, #0x200000
	bl ScanStart_Dwc
_022D95D0:
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D95D8: .word 0x000082EA
_022D95DC: .word ov00_02318158
_022D95E0: .word ov00_02318160
	arm_func_end SearchAround_Dwc

	arm_func_start SearchAround2ndLap_Dwc
SearchAround2ndLap_Dwc: ; 0x022D95E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0xd15]
	ldrb r2, [r4, #0xd0b]
	mov r1, r2, lsl #0x18
	mov r1, r1, lsr #0x1c
	add r1, r1, #1
	and r1, r1, #0xff
	bic r2, r2, #0xf0
	mov r1, r1, lsl #0x1c
	orr r1, r2, r1, lsr #24
	strb r1, [r4, #0xd0b]
	bl Dwci_AC_MakeSearchList
	mov r0, #1
	strb r0, [r4, #0xd11]
	mov r0, #3
	ldmia sp!, {r4, pc}
	arm_func_end SearchAround2ndLap_Dwc

	arm_func_start SearchDifferChannel_Dwc
SearchDifferChannel_Dwc: ; 0x022D962C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_GetTick
	ldr r3, [r4, #0xcb0]
	ldr r2, [r4, #0xcb4]
	subs r3, r0, r3
	sbc r0, r1, r2
	mov r1, r0, lsl #6
	ldr r2, _022D9750 ; =0x000082EA
	orr r1, r1, r3, lsr #26
	mov r0, r3, lsl #6
	mov r3, #0
	bl _ll_udiv
	cmp r1, #0
	cmpeq r0, #0x96
	bhs _022D9688
	ldrb r0, [r4, #0xd0f]
	add r0, r4, r0, lsl #2
	ldrb r0, [r0, #0x447]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	bne _022D9748
_022D9688:
	ldrb r1, [r4, #0xd0f]
	add r0, r4, #0x47
	add r2, r0, #0x400
	ldrb r0, [r2, r1, lsl #2]
	orr r0, r0, #0x80
	strb r0, [r2, r1, lsl #2]
	ldrb r2, [r4, #0xd12]
	ldrb r1, [r4, #0xd0f]
	cmp r1, r2
	bhs _022D96E0
_022D96B0:
	add r0, r4, r1, lsl #2
	ldrb r0, [r0, #0x447]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	beq _022D96E0
	ldrb r0, [r4, #0xd0f]
	add r0, r0, #1
	strb r0, [r4, #0xd0f]
	ldrb r2, [r4, #0xd12]
	and r1, r0, #0xff
	cmp r1, r2
	blo _022D96B0
_022D96E0:
	cmp r2, r1
	bhi _022D9700
	mov r2, #0
	mov r0, r4
	mov r1, #4
	strb r2, [r4, #0xd0f]
	bl NextSearchCheck_Dwc
	ldmia sp!, {r4, pc}
_022D9700:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	ldrb r2, [r4, #0xd0f]
	mov r0, #0xc0
	add r1, r4, #0x74
	smulbb ip, r2, r0
	add r0, r4, ip
	add r0, r0, #0x400
	ldrh r2, [r0, #0xa6]
	add r0, r4, #0x7c
	add r3, r1, #0x400
	add r1, r0, #0x400
	add r0, r3, ip
	add r1, r1, ip
	sub r2, r2, #1
	mov r3, #0x300000
	bl ScanStart_Dwc
_022D9748:
	mov r0, #4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D9750: .word 0x000082EA
	arm_func_end SearchDifferChannel_Dwc

	arm_func_start SearchStealth_Dwc
SearchStealth_Dwc: ; 0x022D9754
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_GetTick
	ldr r3, [r4, #0xcb0]
	ldr r2, [r4, #0xcb4]
	subs r3, r0, r3
	sbc r0, r1, r2
	mov r1, r0, lsl #6
	ldr r2, _022D986C ; =0x000082EA
	orr r1, r1, r3, lsr #26
	mov r0, r3, lsl #6
	mov r3, #0
	bl _ll_udiv
	cmp r1, #0
	cmpeq r0, #0x96
	bhs _022D97B4
	ldrb r1, [r4, #0xd0f]
	mov r0, #0x24
	mla r0, r1, r0, r4
	ldrb r0, [r0, #0x300]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #1
	bne _022D9864
_022D97B4:
	ldrb r1, [r4, #0xd0f]
	mov r0, #0x24
	add r2, r4, #0x300
	smulbb r1, r1, r0
	ldrb r0, [r2, r1]
	bic r0, r0, #0xf
	strb r0, [r2, r1]
	ldrb r0, [r4, #0xd0f]
	add r0, r0, #1
	strb r0, [r4, #0xd0f]
	ldrb r1, [r4, #0xd10]
	and r0, r0, #0xff
	cmp r1, r0
	bhi _022D980C
	ldrb r1, [r4, #0xd15]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #0xd15]
	strb r0, [r4, #0xd0f]
	ldrb r0, [r4, #0xd15]
	bl Dwci_AC_GetStealthChannel
	strb r0, [r4, #0xd11]
_022D980C:
	add r0, r4, #0xd00
	ldrsb r0, [r0, #0x11]
	cmp r0, #0
	bge _022D9834
	mov r2, #0
	mov r0, r4
	mov r1, #5
	strb r2, [r4, #0xd15]
	bl NextSearchCheck_Dwc
	ldmia sp!, {r4, pc}
_022D9834:
	bl OS_GetTick
	str r0, [r4, #0xcb0]
	str r1, [r4, #0xcb4]
	ldrb r3, [r4, #0xd0f]
	add r1, r4, #0x304
	mov r0, #0x24
	add r2, r4, #0xd00
	mla r1, r3, r0, r1
	ldrsb r2, [r2, #0x11]
	ldr r0, _022D9870 ; =ov00_02318158
	mov r3, #0x300000
	bl ScanStart_Dwc
_022D9864:
	mov r0, #5
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D986C: .word 0x000082EA
_022D9870: .word ov00_02318158
	arm_func_end SearchStealth_Dwc

	arm_func_start NextSearchCheck_Dwc
NextSearchCheck_Dwc: ; 0x022D9874
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #3
	beq _022D989C
	cmp r4, #4
	beq _022D98FC
	cmp r4, #5
	beq _022D9908
	b _022D9928
_022D989C:
	ldrb r1, [r5, #0xd12]
	cmp r1, #0
	addeq r1, r5, #0xd00
	ldreqh r1, [r1, #0x16]
	cmpeq r1, #0
	beq _022D98D8
	mov r0, #1
	bl Dwci_AC_MakeSearchList
	cmp r0, #0
	movne r4, #4
	bne _022D9928
	mov r0, r5
	bl CheckStartStealthSearch_Dwc
	mov r4, r0
	b _022D9928
_022D98D8:
	ldrb r1, [r5, #0xd0b]
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	movhs r4, #6
	bhs _022D9928
	bl SearchAround2ndLap_Dwc
	mov r4, r0
	b _022D9928
_022D98FC:
	bl CheckStartStealthSearch_Dwc
	mov r4, r0
	b _022D9928
_022D9908:
	ldrb r1, [r5, #0xd0b]
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	movhs r4, #6
	bhs _022D9928
	bl SearchAround2ndLap_Dwc
	mov r4, r0
_022D9928:
	mov r0, r4
	bl Dwci_AC_SearchReStart
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NextSearchCheck_Dwc

	arm_func_start SearchEndCheck_Dwc
SearchEndCheck_Dwc: ; 0x022D9938
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0x11
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r2, [r5, #0xd12]
	mov r1, #0
	cmp r2, #0
	bls _022D9980
_022D9960:
	add r0, r5, r1, lsl #2
	ldrb r0, [r0, #0x444]
	cmp r0, #0
	beq _022D9980
	add r0, r1, #1
	and r1, r0, #0xff
	cmp r1, r2
	blo _022D9960
_022D9980:
	cmp r4, #6
	bne _022D99B4
	cmp r2, r1
	bne _022D99E0
	cmp r1, #0
	bne _022D99A4
	mov r0, #5
	bl Dwci_AC_SetError
	b _022D99AC
_022D99A4:
	mov r0, #6
	bl Dwci_AC_SetError
_022D99AC:
	mov r0, #0x11
	ldmia sp!, {r3, r4, r5, pc}
_022D99B4:
	cmp r2, #0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r2, r1
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r5, r1, lsl #2
	ldrb r0, [r0, #0x446]
	cmp r0, #0x14
	movlo r0, r4
	ldmloia sp!, {r3, r4, r5, pc}
_022D99E0:
	strb r1, [r5, #0xd13]
	bl Wcm_EndSearchAsync
	cmp r0, #1
	strneb r4, [r5, #0xd0e]
	movne r4, #7
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SearchEndCheck_Dwc

	arm_func_start CheckStartStealthSearch_Dwc
CheckStartStealthSearch_Dwc: ; 0x022D99FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xd00
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	beq _022D9A38
	mov r0, #2
	bl Dwci_AC_MakeSearchList
	cmp r0, #0
	beq _022D9A38
	mov r0, #0
	bl Dwci_AC_GetStealthChannel
	strb r0, [r4, #0xd11]
	mov r0, #5
	ldmia sp!, {r4, pc}
_022D9A38:
	ldrb r0, [r4, #0xd0b]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1c
	cmp r0, #1
	movhs r0, #6
	ldmhsia sp!, {r4, pc}
	mov r0, r4
	bl SearchAround2ndLap_Dwc
	ldmia sp!, {r4, pc}
	arm_func_end CheckStartStealthSearch_Dwc

	arm_func_start ScanStart_Dwc
ScanStart_Dwc: ; 0x022D9A5C
	stmdb sp!, {r3, lr}
	ldr ip, _022D9A7C ; =ov00_0231819C
	cmp r2, #0xc
	movgt r2, #0xc
	ldr r2, [ip, r2, lsl #2]
	orr r2, r3, r2
	bl Wcm_SearchAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D9A7C: .word ov00_0231819C
	arm_func_end ScanStart_Dwc

	arm_func_start Dwci_AC_Start
Dwci_AC_Start: ; 0x022D9A80
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	bl Wcm_GetPhase
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	cmp r4, #1
	bne _022D9AEC
	ldrb r1, [r0, #0xd0a]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	bl Dwci_AC_MakeSearchList
	ldr r1, _022D9B04 ; =Dwci_AC_CallBackWcm
	add r0, sp, #0
	bl Wcm_StartupAsync
	cmp r0, #1
	beq _022D9AD8
	cmp r0, #4
	blt _022D9AF8
_022D9AD8:
	mov r0, #1
	bl Dwci_AC_SetError
	add sp, sp, #0x10
	mov r0, #0x11
	ldmia sp!, {r4, pc}
_022D9AEC:
	add sp, sp, #0x10
	mov r0, #1
	ldmia sp!, {r4, pc}
_022D9AF8:
	mov r0, #2
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D9B04: .word Dwci_AC_CallBackWcm
	arm_func_end Dwci_AC_Start

	arm_func_start Dwci_AC_ConnectTest
Dwci_AC_ConnectTest: ; 0x022D9B08
	stmdb sp!, {r3, r4, r5, lr}
	bl Dwci_AC_GetPhase
	mov r4, r0
	mov r0, #0x10
	bl Dwci_AC_GetMemPtr
	mov r5, r0
	bl Wcm_GetPhase
	cmp r0, #9
	bne _022D9BAC
	sub r0, r4, #0xa
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022D9BFC
_022D9B3C: ; jump table
	b _022D9B54 ; case 0
	b _022D9BA0 ; case 1
	b _022D9B64 ; case 2
	b _022D9B74 ; case 3
	b _022D9B80 ; case 4
	b _022D9B90 ; case 5
_022D9B54:
	mov r0, r5
	bl ConnectTestStart_Dwc
	mov r4, r0
	b _022D9BFC
_022D9B64:
	mov r0, r5
	bl GetIpAddress_Dwc
	mov r4, r0
	b _022D9BFC
_022D9B74:
	bl ConnectTestCreate_Dwc
	mov r4, r0
	b _022D9BFC
_022D9B80:
	mov r0, r5
	bl ConnectTestProcess_Dwc
	mov r4, r0
	b _022D9BFC
_022D9B90:
	mov r0, r5
	bl ConnectTestEnd_Dwc
	mov r4, r0
	b _022D9BFC
_022D9BA0:
	bl ConnectTestRetry_Dwc
	mov r4, r0
	b _022D9BFC
_022D9BAC:
	cmp r4, #0xb
	beq _022D9BD4
	cmp r4, #0xe
	beq _022D9BE0
	cmp r4, #0xf
	bne _022D9BE8
	mov r0, r5
	bl ConnectTestEnd_Dwc
	mov r4, r0
	b _022D9BFC
_022D9BD4:
	bl ConnectTestRetry_Dwc
	mov r4, r0
	b _022D9BFC
_022D9BE0:
	bl Dwc_Netcheck_Abort
	bl Dwc_Netcheck_Destroy
_022D9BE8:
	ldrb r0, [r5, #0xd13]
	mov r1, #2
	mov r4, #0xb
	add r0, r5, r0, lsl #2
	strb r1, [r0, #0x444]
_022D9BFC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Dwci_AC_ConnectTest

	arm_func_start ConnectTestStart_Dwc
ConnectTestStart_Dwc: ; 0x022D9C04
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r5, r0
	mov r0, #4
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl MakeSocConfig_Dwc
	ldr r1, _022D9C64 ; =ov00_023268C0
	mov r2, #4
	mov r0, r4
	str r2, [r1]
	bl SOC_Startup
	cmp r0, #0
	moveq r0, #0xc
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #2
	bl Dwci_AC_SetError
	mov r0, #0x11
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D9C64: .word ov00_023268C0
	arm_func_end ConnectTestStart_Dwc

	arm_func_start GetIpAddress_Dwc
GetIpAddress_Dwc: ; 0x022D9C68
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Soc_GetHostID
	cmp r0, #0
	beq _022D9CA0
	mov r0, r4
	bl CheckSetDns_Dwc
	ldrb r0, [r4, #0xd0c]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	moveq r0, #0xf
	movne r0, #0xd
	ldmia sp!, {r4, pc}
_022D9CA0:
	bl OS_GetTick
	ldr r3, [r4, #0xcb0]
	ldr r2, [r4, #0xcb4]
	subs r3, r0, r3
	sbc r0, r1, r2
	mov r1, r0, lsl #6
	ldr r2, _022D9CF4 ; =0x01FF6210
	orr r1, r1, r3, lsr #26
	mov r0, r3, lsl #6
	mov r3, #0
	bl _ll_udiv
	cmp r1, #0
	cmpeq r0, #0xa
	movlo r0, #0xc
	ldmloia sp!, {r4, pc}
	ldrb r1, [r4, #0xd13]
	mov r2, #1
	mov r0, #0xb
	add r1, r4, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022D9CF4: .word 0x01FF6210
	arm_func_end GetIpAddress_Dwc

	arm_func_start ConnectTestCreate_Dwc
ConnectTestCreate_Dwc: ; 0x022D9CF8
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl Dwci_AC_GetMemPtr
	bl Dwc_Netcheck_Create
	cmp r0, #0
	moveq r0, #0xe
	ldmeqia sp!, {r3, pc}
	mov r0, #3
	bl Dwci_AC_SetError
	mov r0, #0x11
	ldmia sp!, {r3, pc}
	arm_func_end ConnectTestCreate_Dwc

	arm_func_start ConnectTestProcess_Dwc
ConnectTestProcess_Dwc: ; 0x022D9D24
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	bl Dwci_AC_GetMemPtr
	mov r4, r0
	bl Dwc_Netcheck_GetError
	movs r5, r0
	beq _022D9D88
	ldrb r0, [r6, #0xd0d]
	bl Dwci_ConvConnectApType
	ldrb r1, [r4, #0x15]
	cmp r1, r0
	bne _022D9D60
	bl Dwc_Netcheck_GetReturnCode
	str r0, [r4, #0x10]
_022D9D60:
	bl Dwc_Netcheck_Destroy
	cmp r5, #0xb
	moveq r0, #0xf
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r1, [r6, #0xd13]
	mov r2, #1
	mov r0, #0xb
	add r1, r6, r1, lsl #2
	strb r2, [r1, #0x444]
	ldmia sp!, {r4, r5, r6, pc}
_022D9D88:
	mov r0, #0xe
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ConnectTestProcess_Dwc

	arm_func_start ConnectTestEnd_Dwc
ConnectTestEnd_Dwc: ; 0x022D9D90
	stmdb sp!, {r3, lr}
	ldrb r0, [r0, #0xd0d]
	bl Dwci_AC_SetApType
	mov r0, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ConnectTestEnd_Dwc

	arm_func_start ConnectTestRetry_Dwc
ConnectTestRetry_Dwc: ; 0x022D9DA4
	stmdb sp!, {r3, lr}
	bl Socl_CalmDown
	cmp r0, #0
	movne r0, #0xb
	ldmneia sp!, {r3, pc}
	bl ov00_022CF7E8
	cmp r0, #0
	mvnne r1, #0x26
	cmpne r0, r1
	moveq r0, #9
	movne r0, #0xb
	ldmia sp!, {r3, pc}
	arm_func_end ConnectTestRetry_Dwc

	arm_func_start MakeSocConfig_Dwc
MakeSocConfig_Dwc: ; 0x022D9DD4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r0, _022D9E90 ; =ov00_023181D0
	mov r1, r4
	mov r2, #0x58
	bl MI_CpuCopy8
	ldr r0, [r6]
	str r0, [r4, #4]
	ldr r0, [r6, #4]
	str r0, [r4, #8]
	ldrb r0, [r5, #0xd0d]
	cmp r0, #6
	ldmhsia sp!, {r4, r5, r6, pc}
	bl Dwci_ConvConnectApType
	add r5, r5, r0, lsl #8
	ldrb r0, [r5, #0xc0]
	cmp r0, #0
	beq _022D9E6C
	mov r0, #0
	str r0, [r4, #0xc]
	add r0, r5, #0xc0
	bl ConvAddress_Dwc
	str r0, [r4, #0x10]
	ldrb r0, [r5, #0xd0]
	bl ConvNetMask_Dwc
	str r0, [r4, #0x14]
	add r0, r5, #0xc4
	bl ConvAddress_Dwc
	str r0, [r4, #0x18]
	add r0, r5, #0xc8
	bl ConvAddress_Dwc
	str r0, [r4, #0x1c]
	add r0, r5, #0xcc
	bl ConvAddress_Dwc
	str r0, [r4, #0x20]
	ldmia sp!, {r4, r5, r6, pc}
_022D9E6C:
	mov r0, #1
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022D9E90: .word ov00_023181D0
	arm_func_end MakeSocConfig_Dwc

	arm_func_start ConvAddress_Dwc
ConvAddress_Dwc: ; 0x022D9E94
	ldrb r1, [r0]
	ldrb r2, [r0, #1]
	mov r3, #0
	orr r3, r3, r1, lsl #24
	ldrb r1, [r0, #2]
	orr r2, r3, r2, lsl #16
	ldrb r0, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r3, r1, r0
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ConvAddress_Dwc

	arm_func_start ConvNetMask_Dwc
ConvNetMask_Dwc: ; 0x022D9EE8
	rsb r1, r0, #0x20
	cmp r1, #0
	mvn r3, #0
	mov r0, #0
	ble _022D9F0C
_022D9EFC:
	add r0, r0, #1
	cmp r0, r1
	mov r3, r3, lsl #1
	blt _022D9EFC
_022D9F0C:
	mov r1, r3, lsr #0x18
	mov r0, r3, lsr #8
	mov r2, r3, lsl #8
	mov r3, r3, lsl #0x18
	and r1, r1, #0xff
	and r0, r0, #0xff00
	and r2, r2, #0xff0000
	orr r0, r1, r0
	and r1, r3, #0xff000000
	orr r0, r2, r0
	orr r0, r1, r0
	bx lr
	arm_func_end ConvNetMask_Dwc

	arm_func_start CheckSetDns_Dwc
CheckSetDns_Dwc: ; 0x022D9F3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldrb r0, [r4, #0xd0d]
	cmp r0, #6
	addhs sp, sp, #8
	ldmhsia sp!, {r4, pc}
	bl Dwci_ConvConnectApType
	add r4, r4, r0, lsl #8
	ldrb r0, [r4, #0xc0]
	ldrb r2, [r4, #0xc8]
	ldrb r1, [r4, #0xc9]
	cmp r0, #0
	ldrb r3, [r4, #0xca]
	add r1, r2, r1
	ldrb r2, [r4, #0xcb]
	add r1, r3, r1
	addne sp, sp, #8
	add r0, r2, r1
	ldmneia sp!, {r4, pc}
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0xc8
	bl ConvAddress_Dwc
	str r0, [sp, #4]
	add r0, r4, #0xcc
	bl ConvAddress_Dwc
	str r0, [sp]
	add r0, sp, #4
	add r1, sp, #0
	bl Soc_SetResolver
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end CheckSetDns_Dwc

	arm_func_start Dwci_AC_CheckNintendoShopAP
Dwci_AC_CheckNintendoShopAP: ; 0x022D9FC4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	add r1, sp, #0
	bl DecodeSsid_Dwc
	ldr r1, _022D9FF8 ; =ov00_02318B74
	add r0, sp, #0
	mov r2, #8
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_022D9FF8: .word ov00_02318B74
	arm_func_end Dwci_AC_CheckNintendoShopAP

	arm_func_start Dwci_AC_GetNintendoShopWepKey
Dwci_AC_GetNintendoShopWepKey: ; 0x022D9FFC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	mov r4, r1
	add r1, sp, #0
	bl DecodeSsid_Dwc
	add r0, sp, #0
	mov r1, r4
	bl MakeShopWepKey_Dwc
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	arm_func_end Dwci_AC_GetNintendoShopWepKey

	arm_func_start Dwci_AC_GetPostalCode
Dwci_AC_GetPostalCode: ; 0x022DA024
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	mov r4, r1
	add r1, sp, #0
	bl DecodeSsid_Dwc
	ldr r1, _022DA06C ; =ov00_02318B74
	add r0, sp, #0
	mov r2, #8
	bl memcmp
	cmp r0, #0
	addne sp, sp, #0x18
	ldmneia sp!, {r4, pc}
	add r0, sp, #8
	mov r1, r4
	mov r2, #0xa
	bl MI_CpuCopy8
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DA06C: .word ov00_02318B74
	arm_func_end Dwci_AC_GetPostalCode

	arm_func_start Dwci_AC_CheckNintendoUsbAP
Dwci_AC_CheckNintendoUsbAP: ; 0x022DA070
	stmdb sp!, {r3, lr}
	ldr r1, _022DA090 ; =ov00_02318B80
	mov r2, #8
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DA090: .word ov00_02318B80
	arm_func_end Dwci_AC_CheckNintendoUsbAP

	arm_func_start Dwci_AC_GetNintendoUsbWepKey
Dwci_AC_GetNintendoUsbWepKey: ; 0x022DA094
	ldr ip, _022DA0A0 ; =MakeUsbWepKey_Dwc
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_022DA0A0: .word MakeUsbWepKey_Dwc
	arm_func_end Dwci_AC_GetNintendoUsbWepKey

	arm_func_start DecodeSsid_Dwc
DecodeSsid_Dwc: ; 0x022DA0A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	ldr lr, _022DA1A0 ; =ov00_0231822B
	add ip, sp, #0
	mov r4, r1
	mov r3, #0xc
_022DA0BC:
	ldrb r2, [lr]
	ldrb r1, [lr, #1]
	add lr, lr, #2
	strb r2, [ip]
	strb r1, [ip, #1]
	add ip, ip, #2
	subs r3, r3, #1
	bne _022DA0BC
	mov r1, r4
	mov r2, #0x20
	mov r3, #0x18
	bl Db64_Dwc
	ldr r0, _022DA1A4 ; =ov00_02318B0C
	mov r3, #0
_022DA0F4:
	ldr r1, [r0, #8]
	ldrb r2, [r4, r3]
	ldrsb r1, [r1, r3]
	eor r1, r2, r1
	strb r1, [r4, r3]
	add r3, r3, #1
	cmp r3, #0x18
	blt _022DA0F4
	mov r7, #0
	add ip, sp, #0
	mov r1, #0xff
_022DA120:
	and lr, r7, #0xff
	ldrb r0, [ip, lr]
	mov r5, lr
	ldrb r6, [r4, r7]
	cmp r0, #0xff
	beq _022DA164
_022DA138:
	add r3, ip, r5
	ldrb r5, [ip, r5]
	ldrb r0, [ip, lr]
	ldrb r2, [r4, r5]
	mov lr, r5
	strb r6, [r4, r0]
	strb r1, [r3]
	ldrb r0, [ip, r5]
	mov r6, r2
	cmp r0, #0xff
	bne _022DA138
_022DA164:
	add r7, r7, #1
	cmp r7, #0x18
	blt _022DA120
	ldr r0, _022DA1A4 ; =ov00_02318B0C
	mov r3, #0
_022DA178:
	ldr r1, [r0]
	ldrb r2, [r4, r3]
	ldrsb r1, [r1, r3]
	eor r1, r2, r1
	strb r1, [r4, r3]
	add r3, r3, #1
	cmp r3, #0x18
	blt _022DA178
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022DA1A0: .word ov00_0231822B
_022DA1A4: .word ov00_02318B0C
	arm_func_end DecodeSsid_Dwc

	arm_func_start MakeShopWepKey_Dwc
MakeShopWepKey_Dwc: ; 0x022DA1A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x6c
	mov r5, r0
	add r0, sp, #0x14
	mov r4, r1
	bl MD5_Init
	add r0, sp, #0x14
	mov r1, r5
	mov r2, #0x18
	bl MD5_Update
	add r0, sp, #0
	add r1, sp, #0x14
	bl MD5_Digest
	add r0, sp, #3
	mov r1, r4
	mov r2, #0xd
	bl MI_CpuCopy8
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, pc}
	arm_func_end MakeShopWepKey_Dwc

	arm_func_start MakeUsbWepKey_Dwc
MakeUsbWepKey_Dwc: ; 0x022DA1F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr lr, _022DA390 ; =0x92492493
	mov r4, r1
	mov r1, #0
	mov ip, #7
_022DA20C:
	smull r2, r3, lr, r1
	add r3, r1, r3
	mov r2, r1, lsr #0x1f
	add r3, r2, r3, asr #2
	smull r2, r3, ip, r3
	sub r3, r1, r2
	add r2, r0, r3
	ldrb r3, [r0, r1]
	ldrb r2, [r2, #0xd]
	eor r2, r3, r2
	strb r2, [r4, r1]
	add r1, r1, #1
	cmp r1, #0xd
	blt _022DA20C
	mov ip, #0
_022DA248:
	add r3, r4, ip
	add r1, r0, ip
	ldrb r2, [r3, #3]
	ldrb r1, [r1, #0xd]
	add ip, ip, #1
	cmp ip, #7
	eor r1, r2, r1
	strb r1, [r3, #3]
	blt _022DA248
	ldr r0, _022DA394 ; =ov00_02318B0C
	mov r3, #0
_022DA274:
	ldr r1, [r0, #4]
	ldrb r2, [r4, r3]
	ldrsb r1, [r1, r3]
	eor r1, r2, r1
	strb r1, [r4, r3]
	add r3, r3, #1
	cmp r3, #0xd
	blt _022DA274
	add r1, sp, #0
	mov r0, r4
	mov r2, #0xd
	bl MI_CpuCopy8
	ldr r3, _022DA398 ; =ov00_02318244
	add r2, sp, #0
	mov ip, #0
_022DA2B0:
	ldrb r1, [r2], #1
	ldrb r0, [r3], #1
	add ip, ip, #1
	cmp ip, #0xd
	strb r1, [r4, r0]
	blt _022DA2B0
	ldr r0, _022DA394 ; =ov00_02318B0C
	mov r3, #0
_022DA2D0:
	ldr r1, [r0, #0xc]
	ldrb r2, [r4, r3]
	ldrsb r1, [r1, r3]
	eor r1, r2, r1
	strb r1, [r4, r3]
	add r3, r3, #1
	cmp r3, #0xd
	blt _022DA2D0
	ldr r2, _022DA39C ; =ov00_02318254
	mov ip, #0
_022DA2F8:
	ldrb r3, [r4, ip]
	mov r0, r3, asr #4
	and r1, r0, #0xf
	and r0, r3, #0xf
	ldrb r1, [r2, r1]
	ldrb r0, [r2, r0]
	orr r0, r0, r1, lsl #4
	strb r0, [r4, ip]
	add ip, ip, #1
	cmp ip, #0xd
	blt _022DA2F8
	mov r1, #0
_022DA328:
	add r0, r4, r1
	ldrb r3, [r4, r1]
	ldrb r2, [r0, #6]
	eor r2, r3, r2
	strb r2, [r4, r1]
	ldrb r3, [r0, #3]
	ldrb r2, [r0, #9]
	eor r2, r3, r2
	strb r2, [r0, #3]
	ldrb r3, [r0, #6]
	and r2, r2, #0xff
	eor r2, r3, r2
	strb r2, [r0, #6]
	ldrb r3, [r0, #9]
	ldrb r2, [r4, r1]
	eor r2, r3, r2
	strb r2, [r0, #9]
	ldrb r0, [r4, r1]
	ldrb r2, [r4, #0xc]
	add r1, r1, #1
	cmp r1, #3
	eor r0, r2, r0
	strb r0, [r4, #0xc]
	blt _022DA328
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DA390: .word 0x92492493
_022DA394: .word ov00_02318B0C
_022DA398: .word ov00_02318244
_022DA39C: .word ov00_02318254
	arm_func_end MakeUsbWepKey_Dwc

	arm_func_start CodeToValue_Dwc
CodeToValue_Dwc: ; 0x022DA3A0
	cmp r0, #0x41
	blo _022DA3B4
	cmp r0, #0x5a
	subls r0, r0, #0x41
	bxls lr
_022DA3B4:
	cmp r0, #0x61
	blo _022DA3CC
	cmp r0, #0x7a
	subls r0, r0, #0x61
	addls r0, r0, #0x1a
	bxls lr
_022DA3CC:
	cmp r0, #0x30
	blo _022DA3E4
	cmp r0, #0x39
	subls r0, r0, #0x30
	addls r0, r0, #0x34
	bxls lr
_022DA3E4:
	cmp r0, #0x2b
	moveq r0, #0x3e
	bxeq lr
	cmp r0, #0x2f
	moveq r0, #0x3f
	bxeq lr
	cmp r0, #0x3d
	movne r0, #1
	moveq r0, #0
	rsb r0, r0, #0
	bx lr
	arm_func_end CodeToValue_Dwc

	arm_func_start Db64_Dwc
Db64_Dwc: ; 0x022DA410
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	add r4, r2, r2, lsl #1
	str r0, [sp]
	mov r0, r4, lsr #2
	str r1, [sp, #4]
	cmp r3, r4, lsr #2
	str r0, [sp, #8]
	blo _022DA444
	and fp, r2, #3
	sub r0, r2, fp
	str r0, [sp, #0xc]
	b _022DA450
_022DA444:
	add sp, sp, #0x18
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022DA450:
	cmp r0, #0
	mov r7, #0
	ble _022DA4D8
	mov sb, r7
	add r5, sp, #0x14
	mov r4, #6
_022DA468:
	ldr r0, [sp]
	mov r6, #0
	mov r8, r6
	add sl, r0, r7
_022DA478:
	ldrb r0, [sl], #1
	bl CodeToValue_Dwc
	rsb r1, r8, #3
	mul r2, r1, r4
	orr r6, r6, r0, lsl r2
	add r8, r8, #1
	cmp r8, #4
	blt _022DA478
	ldr r0, [sp, #4]
	add r1, sb, sb, lsl #1
	mov r2, #0
	str r6, [sp, #0x14]
	add r1, r0, r1
_022DA4AC:
	rsb r0, r2, #2
	ldrb r0, [r5, r0]
	add r2, r2, #1
	cmp r2, #3
	strb r0, [r1], #1
	blt _022DA4AC
	ldr r0, [sp, #0xc]
	add r7, r7, #4
	cmp r7, r0
	add sb, sb, #1
	blt _022DA468
_022DA4D8:
	cmp fp, #0
	beq _022DA56C
	mov r5, #0
	mov r6, r5
	str r5, [sp, #0x10]
	ble _022DA52C
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	mov r8, r5
	add r4, r1, r0
	mov r7, #6
_022DA504:
	ldrb r0, [r4], #1
	bl CodeToValue_Dwc
	rsb r1, r6, #3
	mul r2, r1, r7
	orr r5, r5, r0, lsl r2
	add r6, r6, #1
	cmp r6, fp
	orr r8, r8, r5
	blt _022DA504
	str r8, [sp, #0x10]
_022DA52C:
	cmp fp, #0
	mov r3, #0
	ble _022DA56C
	ldr r0, [sp, #0xc]
	add r1, r0, r0, lsl #1
	mov r0, r1, asr #1
	add r1, r1, r0, lsr #30
	ldr r0, [sp, #4]
	add r2, r0, r1, asr #2
	add r1, sp, #0x10
_022DA554:
	rsb r0, r3, #2
	ldrb r0, [r1, r0]
	add r3, r3, #1
	cmp r3, fp
	strb r0, [r2], #1
	blt _022DA554
_022DA56C:
	ldr r0, [sp, #8]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Db64_Dwc

	arm_func_start WdsGetRssi8
WdsGetRssi8: ; 0x022DA578
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end WdsGetRssi8

	arm_func_start WdsScanCallback
WdsScanCallback: ; 0x022DA58C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _022DA86C ; =ov00_02326CA4
	mov r6, r0
	ldr r0, [r1]
	mov r1, #0x400
	add r0, r0, #0xf00
	bl DC_InvalidateRange
	ldrh r0, [r6, #2]
	cmp r0, #0
	ldreqh r0, [r6, #8]
	cmpeq r0, #5
	bne _022DA830
	ldrh r0, [r6, #0xe]
	mov r5, #0
	cmp r0, #0
	bls _022DA830
_022DA5D0:
	add r0, r6, r5, lsl #2
	ldr r0, [r0, #0x10]
	ldrh r1, [r0, #0x40]
	cmp r1, #1
	ldreq r2, [r0, #0x44]
	ldreq r1, _022DA870 ; =0x00000857
	cmpeq r2, r1
	bne _022DA820
	ldr r1, _022DA86C ; =ov00_02326CA4
	mov r4, #0
	ldr ip, [r1]
	mov r3, r4
	add r2, ip, #0x1000
	ldr r1, [r2, #0xa88]
	cmp r1, #0
	bls _022DA63C
	ldrh r7, [r0, #0x48]
_022DA614:
	add r1, ip, r3, lsl #1
	add r1, r1, #0x1a00
	ldrh r1, [r1, #0x68]
	cmp r1, r7
	moveq r4, #1
	beq _022DA63C
	ldr r1, [r2, #0xa88]
	add r3, r3, #1
	cmp r3, r1
	blo _022DA614
_022DA63C:
	cmp r4, #1
	beq _022DA820
	ldr r1, _022DA86C ; =ov00_02326CA4
	mov r2, #0x70
	ldr r1, [r1]
	add r0, r0, #0x50
	add r3, r1, #0x1000
	add r1, r1, #0x348
	ldr r3, [r3, #0xa8c]
	add r1, r1, #0x1000
	mla r1, r3, r2, r1
	bl MI_CpuCopy8
	ldr r0, _022DA874 ; =ov00_02318264
	add r1, sp, #0
	mov r2, #4
	bl MI_CpuCopy8
	add r0, r6, r5, lsl #2
	ldr r0, [r0, #0x10]
	add r1, sp, #4
	add r0, r0, #6
	mov r2, #4
	bl MI_CpuCopy8
	ldr r0, _022DA86C ; =ov00_02326CA4
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #8
	add r0, r0, #0x96
	add r0, r0, #0x1c00
	bl CRYPTO_RC4Init
	ldr r0, _022DA86C ; =ov00_02326CA4
	mov r2, #0x70
	ldr r3, [r0]
	add r0, r3, #0x348
	add r4, r0, #0x1000
	add r0, r3, #0x1000
	ldr r1, [r0, #0xa8c]
	add r0, r3, #0x96
	mul r3, r1, r2
	add r1, r4, r3
	add r0, r0, #0x1c00
	add r3, r4, r3
	bl Crypto_RC4Encrypt
	ldr r0, _022DA86C ; =ov00_02326CA4
	mov r1, #0x70
	ldr ip, [r0]
	mov r3, #0x6e
	add r0, ip, #0x348
	add r4, r0, #0x1000
	add r0, ip, #0x1000
	ldr r2, [r0, #0xa8c]
	add r0, ip, #0x96
	mul r7, r2, r1
	add r1, ip, #0x294
	add r0, r0, #0x1a00
	add r1, r1, #0x1800
	add r2, r4, r7
	bl MATHi_CRC16Update
	ldr r0, _022DA86C ; =ov00_02326CA4
	add r1, r4, r7
	ldr r0, [r0]
	mov r2, #0x6e
	add r0, r0, #0x96
	add r0, r0, #0x1a00
	bl MATH_CalcCRC16
	ldr r1, _022DA86C ; =ov00_02326CA4
	mov r2, #0x70
	ldr r4, [r1]
	add r1, r4, #0x1000
	ldr r1, [r1, #0xa8c]
	mul r3, r1, r2
	add r1, r4, r3
	add r1, r1, #0x1300
	ldrh r1, [r1, #0xb6]
	cmp r0, r1
	cmpne r1, #0
	beq _022DA784
	add r0, r4, #0x348
	add r0, r0, #0x1000
	add r0, r0, r3
	mov r1, #0
	bl MI_CpuFill8
	b _022DA820
_022DA784:
	add r0, r6, r5, lsl #2
	ldr r0, [r0, #0x10]
	ldrh r0, [r0, #2]
	and r0, r0, #0xff
	bl WdsGetRssi8
	add r1, r4, #0x1000
	ldr r1, [r1, #0xa8c]
	ldr r3, _022DA86C ; =ov00_02326CA4
	add r1, r4, r1, lsl #1
	add r1, r1, #0x1a00
	strh r0, [r1, #0x48]
	ldr r2, [r3]
	add r1, r6, r5, lsl #2
	add r0, r2, #0x1000
	ldr r1, [r1, #0x10]
	ldr r0, [r0, #0xa8c]
	ldrh r1, [r1, #0x48]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x1a00
	strh r1, [r0, #0x68]
	ldr r0, [r3]
	add r2, r0, #0x1000
	ldr r0, [r2, #0xa8c]
	add r0, r0, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r0, r1, r0, ror #28
	str r0, [r2, #0xa8c]
	ldr r0, [r3]
	add r0, r0, #0x1000
	ldr r1, [r0, #0xa88]
	add r1, r1, #1
	str r1, [r0, #0xa88]
	ldr r0, [r3]
	add r0, r0, #0x1000
	ldr r1, [r0, #0xa88]
	cmp r1, #0x10
	movgt r1, #0x10
	strgt r1, [r0, #0xa88]
_022DA820:
	ldrh r0, [r6, #0xe]
	add r5, r5, #1
	cmp r5, r0
	blo _022DA5D0
_022DA830:
	ldr r1, _022DA86C ; =ov00_02326CA4
	mov r2, #2
	ldr r0, [r1]
	add r0, r0, #0x1000
	str r2, [r0, #0xa90]
	ldr r0, [r1]
	add r0, r0, #0x1000
	ldr r1, [r0, #0x344]
	cmp r1, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022DA86C: .word ov00_02326CA4
_022DA870: .word 0x00000857
_022DA874: .word ov00_02318264
	arm_func_end WdsScanCallback

	arm_func_start Wds_GetWorkAreaSize
Wds_GetWorkAreaSize: ; 0x022DA878
	ldr r0, _022DA880 ; =0x00001DA0
	bx lr
	.align 2, 0
_022DA880: .word 0x00001DA0
	arm_func_end Wds_GetWorkAreaSize

	arm_func_start Wds_Initialize
Wds_Initialize: ; 0x022DA884
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r1
	mov r5, r2
	mov r4, r3
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, _022DA914 ; =ov00_02326CA4
	str r0, [r1]
	bl Wds_GetWorkAreaSize
	ldr r1, _022DA914 ; =ov00_02326CA4
	mov r2, r0
	ldr r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r2, _022DA914 ; =ov00_02326CA4
	mov r3, #0
	ldr r0, [r2]
	ldr r1, _022DA918 ; =0x0000A001
	add r0, r0, #0x1000
	str r3, [r0, #0xa90]
	ldr r0, [r2]
	add r0, r0, #0x1a00
	strh r3, [r0, #0x94]
	ldr r0, [r2]
	add r0, r0, #0x96
	add r0, r0, #0x1a00
	bl MATHi_CRC16InitTable
	ldr r0, _022DA914 ; =ov00_02326CA4
	mov r1, r6
	ldr r0, [r0]
	mov r2, r5
	mov r3, r4
	bl WM_InitializeForListening
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DA914: .word ov00_02326CA4
_022DA918: .word 0x0000A001
	arm_func_end Wds_Initialize

	arm_func_start Wds_End
Wds_End: ; 0x022DA91C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _022DA958 ; =ov00_02326CA4
	mov ip, #3
	ldr r1, [r2]
	mov r3, #0
	add r1, r1, #0x1000
	str ip, [r1, #0xa90]
	str r3, [r2]
	bl WM_End
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DA958: .word ov00_02326CA4
	arm_func_end Wds_End

	arm_func_start Wds_StartScan
Wds_StartScan: ; 0x022DA95C
	stmdb sp!, {r4, lr}
	movs r4, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, _022DAA1C ; =ov00_02326CA4
	mov r2, #0x400
	ldr r0, [r1]
	add r3, r0, #0xf00
	add r0, r0, #0x1000
	str r3, [r0, #0x300]
	ldr r0, [r1]
	add r0, r0, #0x1300
	strh r2, [r0, #4]
	bl WM_GetAllowedChannel
	ldr r1, _022DAA1C ; =ov00_02326CA4
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #6]
	bl WM_GetDispersionScanPeriod
	ldr r3, _022DAA1C ; =ov00_02326CA4
	mov ip, #1
	ldr r2, [r3]
	mov r1, #0xff
	add r2, r2, #0x1300
	strh r0, [r2, #8]
	ldr r0, [r3]
	mov r2, #6
	add r0, r0, #0x1300
	strh ip, [r0, #0x10]
	ldr r0, [r3]
	add r0, r0, #0xa
	add r0, r0, #0x1300
	bl MI_CpuFill8
	ldr r2, _022DAA1C ; =ov00_02326CA4
	mov r3, #1
	ldr r1, [r2]
	ldr r0, _022DAA20 ; =WdsScanCallback
	add r1, r1, #0x1000
	str r4, [r1, #0x344]
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r3, [r1, #0xa90]
	ldr r1, [r2]
	add r1, r1, #0x1300
	bl WM_StartScanEx
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DAA1C: .word ov00_02326CA4
_022DAA20: .word WdsScanCallback
	arm_func_end Wds_StartScan

	arm_func_start Wds_EndScan
Wds_EndScan: ; 0x022DAA24
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _022DAA58 ; =ov00_02326CA4
	mov r2, #2
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r2, [r1, #0xa90]
	bl WM_EndScan
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DAA58: .word ov00_02326CA4
	arm_func_end Wds_EndScan

	arm_func_start Wds_GetApInfoByIndex
Wds_GetApInfoByIndex: ; 0x022DAA5C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _022DAAF4 ; =ov00_02326CA4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x1000
	ldr r1, [r0, #0xa90]
	cmp r1, #2
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	blt _022DAA98
	ldr r0, [r0, #0xa88]
	cmp r5, r0
	blt _022DAAA0
_022DAA98:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022DAAA0:
	mov r0, r4
	mov r1, #0
	mov r2, #0x78
	bl MI_CpuFill8
	mov r0, #1
	ldr r3, _022DAAF4 ; =ov00_02326CA4
	str r0, [r4]
	ldr r0, [r3]
	mov r2, #0x70
	add r0, r0, r5, lsl #1
	add r0, r0, #0x1a00
	ldrh r0, [r0, #0x48]
	add r1, r4, #6
	strh r0, [r4, #4]
	ldr r0, [r3]
	add r0, r0, #0x348
	add r0, r0, #0x1000
	mla r0, r5, r2, r0
	bl MI_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DAAF4: .word ov00_02326CA4
	arm_func_end Wds_GetApInfoByIndex

	arm_func_start Wds_GetApInfoAll
Wds_GetApInfoAll: ; 0x022DAAF8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022DAB98 ; =ov00_02326CA4
	mov r5, r0
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0xa90]
	cmp r1, #2
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #0
	mov r2, #0x780
	bl MI_CpuFill8
	mov r0, #0
	mov r1, r5
	mov r4, r0
_022DAB34:
	add r0, r0, #1
	cmp r0, #0x10
	str r4, [r1], #0x78
	blt _022DAB34
	ldr r7, _022DAB98 ; =ov00_02326CA4
	ldr r0, [r7]
	add r0, r0, #0x1000
	ldr r0, [r0, #0xa88]
	cmp r0, #0
	ble _022DAB90
	mvn r6, #0
_022DAB60:
	mov r0, r4
	mov r1, r5
	bl Wds_GetApInfoByIndex
	cmp r0, r6
	beq _022DAB90
	ldr r0, [r7]
	add r4, r4, #1
	add r0, r0, #0x1000
	ldr r0, [r0, #0xa88]
	add r5, r5, #0x78
	cmp r4, r0
	blt _022DAB60
_022DAB90:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022DAB98: .word ov00_02326CA4
	arm_func_end Wds_GetApInfoAll

	arm_func_start Dwc_AC_StartupGetWdsInfo
Dwc_AC_StartupGetWdsInfo: ; 0x022DAB9C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Wds_GetWorkAreaSize
	mov r1, r0
	mov r0, #1
	bl Dwc_Alloc
	ldr r2, _022DAC04 ; =ov00_02326CA8
	ldr r1, _022DAC08 ; =0x00000794
	str r0, [r2, #4]
	mov r0, #1
	bl Dwc_Alloc
	ldr r2, _022DAC04 ; =ov00_02326CA8
	mov r1, #0
	str r0, [r2]
	ldr r2, _022DAC08 ; =0x00000794
	bl MI_CpuFill8
	ldr r1, _022DAC04 ; =ov00_02326CA8
	mov r2, #0
	ldr r3, [r1]
	mov r0, #1
	str r5, [r3]
	ldr r3, [r1]
	str r4, [r3, #0x790]
	str r2, [r1, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DAC04: .word ov00_02326CA8
_022DAC08: .word 0x00000794
	arm_func_end Dwc_AC_StartupGetWdsInfo

	arm_func_start Dwc_AC_ProcessGetWdsInfo
Dwc_AC_ProcessGetWdsInfo: ; 0x022DAC0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022DAF24 ; =ov00_02326CA8
	ldr r0, [r1, #4]
	cmp r0, #0
	ldrne r3, [r1]
	cmpne r3, #0
	moveq r0, #3
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, [r1, #8]
	mov r6, #1
	cmp r2, #0xb
	addls pc, pc, r2, lsl #2
	b _022DAF1C
_022DAC40: ; jump table
	b _022DAC70 ; case 0
	b _022DAF1C ; case 1
	b _022DAC9C ; case 2
	b _022DAF1C ; case 3
	b _022DACF4 ; case 4
	b _022DAD58 ; case 5
	b _022DAF1C ; case 6
	b _022DAD80 ; case 7
	b _022DAF1C ; case 8
	b _022DAE54 ; case 9
	b _022DAEF0 ; case 10
	b _022DAF18 ; case 11
_022DAC70:
	str r6, [r1, #8]
	ldr r3, [r3, #0x790]
	ldr r1, _022DAF28 ; =Wds_Initialize_CB
	mov r2, #0
	bl Wds_Initialize
	cmp r0, #0
	beq _022DAF1C
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #0xb
	str r1, [r0, #8]
	b _022DAF1C
_022DAC9C:
	ldr r0, _022DAF2C ; =Wds_StartScan_CB
	mov r2, #3
	str r2, [r1, #8]
	bl Wds_StartScan
	cmp r0, #0
	bne _022DACE4
	ldr r0, _022DAF24 ; =ov00_02326CA8
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldr r1, [r1, #4]
	cmp r0, #0
	cmpeq r1, #0
	bne _022DAF1C
	bl OS_GetTick
	ldr r2, _022DAF24 ; =ov00_02326CA8
	ldr r2, [r2]
	stmib r2, {r0, r1}
	b _022DAF1C
_022DACE4:
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #0xa
	str r1, [r0, #8]
	b _022DAF1C
_022DACF4:
	bl OS_GetTick
	ldr r3, _022DAF24 ; =ov00_02326CA8
	ldr r2, _022DAF30 ; =0x000082EA
	ldr r4, [r3]
	mov r3, #0
	ldr r5, [r4, #4]
	ldr r4, [r4, #8]
	subs r5, r0, r5
	sbc r0, r1, r4
	mov r1, r0, lsl #6
	orr r1, r1, r5, lsr #26
	mov r0, r5, lsl #6
	bl _ll_udiv
	ldr r2, _022DAF34 ; =0x00000BB8
	cmp r1, #0
	cmpeq r0, r2
	bhs _022DAD48
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #2
	str r1, [r0, #8]
	b _022DAF1C
_022DAD48:
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #5
	str r1, [r0, #8]
	b _022DAF1C
_022DAD58:
	ldr r0, _022DAF38 ; =Wds_EndScan_CB
	mov r2, #6
	str r2, [r1, #8]
	bl Wds_EndScan
	cmp r0, #0
	beq _022DAF1C
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #0xa
	str r1, [r0, #8]
	b _022DAF1C
_022DAD80:
	add r0, r3, #0xc
	bl Wds_GetApInfoAll
	cmp r0, #0
	mov r4, #0
	ldrne r0, _022DAF24 ; =ov00_02326CA8
	movne r1, #0xa
	strne r1, [r0, #8]
	ldr r8, _022DAF24 ; =ov00_02326CA8
	sub r1, r4, #1
	ldr r0, [r8]
	mov r5, r4
	mov r7, r4
	str r1, [r0, #0x78c]
_022DADB4:
	ldr r2, [r8]
	add r1, r2, r7
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _022DAE18
	ldrb r0, [r1, #0x78]
	tst r0, #2
	beq _022DAE18
	ldrb r0, [r1, #0x77]
	cmp r0, #3
	bhi _022DAE18
	add r0, r2, #0x32
	add r0, r0, r7
	bl IsValidApnum
	cmp r0, #0
	beq _022DAE18
	ldr r1, [r8]
	add r0, r1, r7
	ldrh r0, [r0, #0x10]
	cmp r0, r5
	blo _022DAE18
	str r4, [r1, #0x78c]
	ldr r0, [r8]
	add r0, r0, r7
	ldrh r5, [r0, #0x10]
_022DAE18:
	add r4, r4, #1
	cmp r4, #0x10
	add r7, r7, #0x78
	blt _022DADB4
	ldr r1, _022DAF24 ; =ov00_02326CA8
	mov r2, #8
	ldr r0, _022DAF3C ; =Wds_End_CB
	str r2, [r1, #8]
	bl Wds_End
	cmp r0, #0
	beq _022DAF1C
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #0xb
	str r1, [r0, #8]
	b _022DAF1C
_022DAE54:
	ldr r2, [r3, #0x78c]
	cmp r2, #0
	movlt r0, #0xb
	strlt r0, [r1, #8]
	blt _022DAF1C
	add r1, r3, #0x12
	mov r0, #0x78
	mla r0, r2, r0, r1
	ldr r1, [r3]
	mov r2, #0x20
	bl MI_CpuCopy8
	ldr r1, _022DAF24 ; =ov00_02326CA8
	mov r0, #0x78
	ldr r4, [r1]
	mov r2, #0x20
	ldr r1, [r4]
	ldr r3, [r4, #0x78c]
	add r4, r4, #0x56
	mla r0, r3, r0, r4
	add r1, r1, #0x20
	bl MI_CpuCopy8
	ldr r1, _022DAF24 ; =ov00_02326CA8
	mov r0, #0x78
	ldr r4, [r1]
	mov r2, #0xa
	ldr r5, [r4, #0x78c]
	ldr r3, [r4]
	mla r4, r5, r0, r4
	ldrb r4, [r4, #0x77]
	str r4, [r3, #0x40]
	ldr r4, [r1]
	ldr r1, [r4]
	ldr r3, [r4, #0x78c]
	add r4, r4, #0x32
	mla r0, r3, r0, r4
	add r1, r1, #0x44
	bl MI_CpuCopy8
	mov r6, #2
	b _022DAF1C
_022DAEF0:
	ldr r0, _022DAF40 ; =Wds_Error_End_CB
	mov r2, #8
	str r2, [r1, #8]
	bl Wds_End
	cmp r0, #0
	beq _022DAF1C
	ldr r0, _022DAF24 ; =ov00_02326CA8
	mov r1, #0xb
	str r1, [r0, #8]
	b _022DAF1C
_022DAF18:
	mov r6, #3
_022DAF1C:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022DAF24: .word ov00_02326CA8
_022DAF28: .word Wds_Initialize_CB
_022DAF2C: .word Wds_StartScan_CB
_022DAF30: .word 0x000082EA
_022DAF34: .word 0x00000BB8
_022DAF38: .word Wds_EndScan_CB
_022DAF3C: .word Wds_End_CB
_022DAF40: .word Wds_Error_End_CB
	arm_func_end Dwc_AC_ProcessGetWdsInfo

	arm_func_start Dwc_AC_CancelGetWdsInfo
Dwc_AC_CancelGetWdsInfo: ; 0x022DAF44
	ldr r0, _022DAF5C ; =ov00_02326CA8
	ldr r1, [r0, #8]
	cmp r1, #4
	moveq r1, #5
	streq r1, [r0, #8]
	bx lr
	.align 2, 0
_022DAF5C: .word ov00_02326CA8
	arm_func_end Dwc_AC_CancelGetWdsInfo

	arm_func_start Dwc_AC_CleanupGetWdsInfo
Dwc_AC_CleanupGetWdsInfo: ; 0x022DAF60
	stmdb sp!, {r3, lr}
	ldr r0, _022DAFB8 ; =ov00_02326CA8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _022DAF8C
	mov r0, #1
	mov r2, #0
	bl Dwc_Free
	ldr r0, _022DAFB8 ; =ov00_02326CA8
	mov r1, #0
	str r1, [r0, #4]
_022DAF8C:
	ldr r0, _022DAFB8 ; =ov00_02326CA8
	ldr r1, [r0]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r2, #0
	bl Dwc_Free
	ldr r0, _022DAFB8 ; =ov00_02326CA8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DAFB8: .word ov00_02326CA8
	arm_func_end Dwc_AC_CleanupGetWdsInfo

	arm_func_start IsValidApnum
IsValidApnum: ; 0x022DAFBC
	mov r2, #0
_022DAFC0:
	ldrb r1, [r0, r2]
	cmp r1, #0x20
	blo _022DAFD4
	cmp r1, #0x7e
	bls _022DAFDC
_022DAFD4:
	mov r0, #0
	bx lr
_022DAFDC:
	add r2, r2, #1
	cmp r2, #0xa
	blt _022DAFC0
	mov r0, #1
	bx lr
	arm_func_end IsValidApnum

	arm_func_start Wds_Initialize_CB
Wds_Initialize_CB: ; 0x022DAFF0
	ldr r0, _022DB000 ; =ov00_02326CA8
	mov r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022DB000: .word ov00_02326CA8
	arm_func_end Wds_Initialize_CB

	arm_func_start Wds_StartScan_CB
Wds_StartScan_CB: ; 0x022DB004
	ldr r0, _022DB014 ; =ov00_02326CA8
	mov r1, #4
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022DB014: .word ov00_02326CA8
	arm_func_end Wds_StartScan_CB

	arm_func_start Wds_EndScan_CB
Wds_EndScan_CB: ; 0x022DB018
	ldr r0, _022DB028 ; =ov00_02326CA8
	mov r1, #7
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022DB028: .word ov00_02326CA8
	arm_func_end Wds_EndScan_CB

	arm_func_start Wds_End_CB
Wds_End_CB: ; 0x022DB02C
	ldr r0, _022DB03C ; =ov00_02326CA8
	mov r1, #9
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022DB03C: .word ov00_02326CA8
	arm_func_end Wds_End_CB

	arm_func_start Wds_Error_End_CB
Wds_Error_End_CB: ; 0x022DB040
	ldr r0, _022DB050 ; =ov00_02326CA8
	mov r1, #0xb
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_022DB050: .word ov00_02326CA8
	arm_func_end Wds_Error_End_CB

	arm_func_start Dwc_Init
Dwc_Init: ; 0x022DB054
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, _022DB0CC ; =_02000C34
	mov r5, #0
	bl OSi_ReferSymbol
	mov r0, r6
	bl Dwc_BM_Init
	mov r4, r0
	bl Dwc_Auth_CheckWiFiIdNeedCreate
	cmp r0, #0
	beq _022DB08C
	mov r0, r6
	bl Dwci_Auth_MakeWiFiID
	mov r5, #1
_022DB08C:
	cmp r4, #0
	bge _022DB0A4
	cmp r5, #0
	movne r4, #2
	moveq r4, #3
	b _022DB0B0
_022DB0A4:
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
_022DB0B0:
	ldr r0, _022DB0D0 ; =Dwci_GsMalloc
	ldr r1, _022DB0D4 ; =Dwci_GsFree
	ldr r2, _022DB0D8 ; =Dwci_GsRealloc
	ldr r3, _022DB0DC ; =Dwci_GsMemalign
	bl GsiMemoryCallbacksSet
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DB0CC: .word _02000C34
_022DB0D0: .word Dwci_GsMalloc
_022DB0D4: .word Dwci_GsFree
_022DB0D8: .word Dwci_GsRealloc
_022DB0DC: .word Dwci_GsMemalign
	arm_func_end Dwc_Init
