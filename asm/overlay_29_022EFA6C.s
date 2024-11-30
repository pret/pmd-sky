	.include "asm/macros.inc"
	.include "overlay_29_022EFA6C.inc"

	.text

	arm_func_start DebugRecruitingEnabled
DebugRecruitingEnabled: ; 0x022EFA6C
	mov r0, #1
	bx lr
	arm_func_end DebugRecruitingEnabled

	arm_func_start TryActivateIqBooster
TryActivateIqBooster: ; 0x022EFA74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r1, _022EFAE0 ; =DUNGEON_PTR
	ldr r0, _022EFAE4 ; =0x000286D0
	ldr r1, [r1]
	ldrsh r6, [r1, r0]
	cmp r6, #0
	ble _022EFAD8
	add r0, sp, #0
	mov r1, #0x44
	bl TeamMemberHasItemActive
	mov r7, r0
	cmp r7, #0
	ble _022EFAD8
	mov r8, #0
	add r5, sp, #0
	mov r4, r8
	b _022EFAD0
_022EFABC:
	ldr r0, [r5, r8, lsl #2]
	mov r1, r6
	mov r2, r4
	bl BoostIQ
	add r8, r8, #1
_022EFAD0:
	cmp r8, r7
	blt _022EFABC
_022EFAD8:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022EFAE0: .word DUNGEON_PTR
#ifdef JAPAN
_022EFAE4: .word 0x0002862C
#else
_022EFAE4: .word 0x000286D0
#endif
	arm_func_end TryActivateIqBooster

	arm_func_start ov29_022EFAE8
ov29_022EFAE8: ; 0x022EFAE8
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #3
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov29_022EFAE8

	arm_func_start IsSecretBazaarNpcBehavior
IsSecretBazaarNpcBehavior: ; 0x022EFB04
	add r0, r0, #0xf0
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsSecretBazaarNpcBehavior

	arm_func_start ov29_022EFB20
ov29_022EFB20: ; 0x022EFB20
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _022EFB48
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0xa
	mov r1, #0x62
	bl ov29_022EA370
_022EFB48:
	bl ov29_0234D630
	ldr r1, _022EFB7C ; =ov29_023535A4
	mvn r2, #1
	mov r0, #1
	strb r2, [r1]
	bl ov29_022DE5F0
	ldr r1, _022EFB80 ; =ov29_0237C9A0
	strh r0, [r1, #2]
	mov r0, #0
	bl ov29_022DE5F0
	ldr r1, _022EFB80 ; =ov29_0237C9A0
	strh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFB7C: .word ov29_023535A4
_022EFB80: .word ov29_0237C9A0
	arm_func_end ov29_022EFB20

	arm_func_start ov29_022EFB84
ov29_022EFB84: ; 0x022EFB84
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl ov29_0234D8A0
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0xa
	mov r1, #0x62
	bl ov29_022EA370
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022EFB84

	arm_func_start ov29_022EFBAC
ov29_022EFBAC: ; 0x022EFBAC
	ldr r1, _022F04E4 ; =0x000001FE
	cmp r0, r1
	bgt _022F0314
	bge _022F04C4
	cmp r0, #0x1d4
	bgt _022F024C
	bge _022F04C4
	sub r2, r1, #0x53
	cmp r0, r2
	bgt _022F01E4
	sub r1, r1, #0xe9
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022EFE40
_022EFBE4: ; jump table
	b _022F04C4 ; case 0
	b _022F04C4 ; case 1
	b _022F04C4 ; case 2
	b _022F04CC ; case 3
	b _022F04DC ; case 4
	b _022F04DC ; case 5
	b _022F04DC ; case 6
	b _022F04DC ; case 7
	b _022F04DC ; case 8
	b _022F04DC ; case 9
	b _022F04DC ; case 10
	b _022F04DC ; case 11
	b _022F04CC ; case 12
	b _022F04CC ; case 13
	b _022F04DC ; case 14
	b _022F04DC ; case 15
	b _022F04DC ; case 16
	b _022F04DC ; case 17
	b _022F04C4 ; case 18
	b _022F04DC ; case 19
	b _022F04C4 ; case 20
	b _022F04DC ; case 21
	b _022F04DC ; case 22
	b _022F04DC ; case 23
	b _022F04DC ; case 24
	b _022F04DC ; case 25
	b _022F04DC ; case 26
	b _022F04DC ; case 27
	b _022F04DC ; case 28
	b _022F04C4 ; case 29
	b _022F04C4 ; case 30
	b _022F04DC ; case 31
	b _022F04DC ; case 32
	b _022F04DC ; case 33
	b _022F04DC ; case 34
	b _022F04C4 ; case 35
	b _022F04DC ; case 36
	b _022F04DC ; case 37
	b _022F04DC ; case 38
	b _022F04DC ; case 39
	b _022F04DC ; case 40
	b _022F04DC ; case 41
	b _022F04C4 ; case 42
	b _022F04C4 ; case 43
	b _022F04DC ; case 44
	b _022F04DC ; case 45
	b _022F04DC ; case 46
	b _022F04DC ; case 47
	b _022F04DC ; case 48
	b _022F04DC ; case 49
	b _022F04DC ; case 50
	b _022F04DC ; case 51
	b _022F04CC ; case 52
	b _022F04DC ; case 53
	b _022F04DC ; case 54
	b _022F04DC ; case 55
	b _022F04DC ; case 56
	b _022F04DC ; case 57
	b _022F04C4 ; case 58
	b _022F04DC ; case 59
	b _022F04DC ; case 60
	b _022F04DC ; case 61
	b _022F04DC ; case 62
	b _022F04DC ; case 63
	b _022F04CC ; case 64
	b _022F04CC ; case 65
	b _022F04DC ; case 66
	b _022F04DC ; case 67
	b _022F04DC ; case 68
	b _022F04C4 ; case 69
	b _022F04C4 ; case 70
	b _022F04C4 ; case 71
	b _022F04C4 ; case 72
	b _022F04DC ; case 73
	b _022F04DC ; case 74
	b _022F04DC ; case 75
	b _022F04C4 ; case 76
	b _022F04DC ; case 77
	b _022F04DC ; case 78
	b _022F04DC ; case 79
	b _022F04CC ; case 80
	b _022F04C4 ; case 81
	b _022F04DC ; case 82
	b _022F04DC ; case 83
	b _022F04C4 ; case 84
	b _022F04CC ; case 85
	b _022F04CC ; case 86
	b _022F04DC ; case 87
	b _022F04C4 ; case 88
	b _022F04C4 ; case 89
	b _022F04C4 ; case 90
	b _022F04C4 ; case 91
	b _022F04DC ; case 92
	b _022F04DC ; case 93
	b _022F04C4 ; case 94
	b _022F04C4 ; case 95
	b _022F04DC ; case 96
	b _022F04DC ; case 97
	b _022F04DC ; case 98
	b _022F04DC ; case 99
	b _022F04C4 ; case 100
	b _022F04DC ; case 101
	b _022F04C4 ; case 102
	b _022F04C4 ; case 103
	b _022F04C4 ; case 104
	b _022F04C4 ; case 105
	b _022F04DC ; case 106
	b _022F04DC ; case 107
	b _022F04C4 ; case 108
	b _022F04DC ; case 109
	b _022F04C4 ; case 110
	b _022F04DC ; case 111
	b _022F04DC ; case 112
	b _022F04DC ; case 113
	b _022F04DC ; case 114
	b _022F04DC ; case 115
	b _022F04DC ; case 116
	b _022F04C4 ; case 117
	b _022F04CC ; case 118
	b _022F04DC ; case 119
	b _022F04DC ; case 120
	b _022F04CC ; case 121
	b _022F04C4 ; case 122
	b _022F04C4 ; case 123
	b _022F04C4 ; case 124
	b _022F04C4 ; case 125
	b _022F04DC ; case 126
	b _022F04DC ; case 127
	b _022F04CC ; case 128
	b _022F04C4 ; case 129
	b _022F04C4 ; case 130
	b _022F04DC ; case 131
	b _022F04DC ; case 132
	b _022F04C4 ; case 133
	b _022F04DC ; case 134
	b _022F04C4 ; case 135
	b _022F04C4 ; case 136
	b _022F04C4 ; case 137
	b _022F04DC ; case 138
	b _022F04C4 ; case 139
	b _022F04C4 ; case 140
	b _022F04C4 ; case 141
	b _022F04C4 ; case 142
	b _022F04C4 ; case 143
	b _022F04C4 ; case 144
	b _022F04DC ; case 145
	b _022F04DC ; case 146
	b _022F04DC ; case 147
	b _022F04CC ; case 148
	b _022F04CC ; case 149
	b _022F04CC ; case 150
_022EFE40:
	cmp r0, #0xee
	bgt _022F0194
	subs r1, r0, #0x29
	addpl pc, pc, r1, lsl #2
	b _022F016C
_022EFE54: ; jump table
	b _022F04C4 ; case 0
	b _022F04C4 ; case 1
	b _022F04DC ; case 2
	b _022F04DC ; case 3
	b _022F04DC ; case 4
	b _022F04DC ; case 5
	b _022F04DC ; case 6
	b _022F04DC ; case 7
	b _022F04C4 ; case 8
	b _022F04CC ; case 9
	b _022F04CC ; case 10
	b _022F04DC ; case 11
	b _022F04CC ; case 12
	b _022F04DC ; case 13
	b _022F04DC ; case 14
	b _022F04DC ; case 15
	b _022F04DC ; case 16
	b _022F04CC ; case 17
	b _022F04CC ; case 18
	b _022F04DC ; case 19
	b _022F04DC ; case 20
	b _022F04DC ; case 21
	b _022F04DC ; case 22
	b _022F04DC ; case 23
	b _022F04D4 ; case 24
	b _022F04DC ; case 25
	b _022F04DC ; case 26
	b _022F04DC ; case 27
	b _022F04DC ; case 28
	b _022F04DC ; case 29
	b _022F04DC ; case 30
	b _022F04C4 ; case 31
	b _022F04C4 ; case 32
	b _022F04C4 ; case 33
	b _022F04DC ; case 34
	b _022F04DC ; case 35
	b _022F04DC ; case 36
	b _022F04DC ; case 37
	b _022F04DC ; case 38
	b _022F04DC ; case 39
	b _022F04C4 ; case 40
	b _022F04C4 ; case 41
	b _022F04DC ; case 42
	b _022F04DC ; case 43
	b _022F04DC ; case 44
	b _022F04DC ; case 45
	b _022F04DC ; case 46
	b _022F04DC ; case 47
	b _022F04DC ; case 48
	b _022F04DC ; case 49
	b _022F04C4 ; case 50
	b _022F04C4 ; case 51
	b _022F04C4 ; case 52
	b _022F04DC ; case 53
	b _022F04DC ; case 54
	b _022F04DC ; case 55
	b _022F04DC ; case 56
	b _022F04CC ; case 57
	b _022F04CC ; case 58
	b _022F04DC ; case 59
	b _022F04DC ; case 60
	b _022F04DC ; case 61
	b _022F04DC ; case 62
	b _022F04DC ; case 63
	b _022F04DC ; case 64
	b _022F04DC ; case 65
	b _022F04DC ; case 66
	b _022F04DC ; case 67
	b _022F04C4 ; case 68
	b _022F04C4 ; case 69
	b _022F04DC ; case 70
	b _022F04DC ; case 71
	b _022F04DC ; case 72
	b _022F04DC ; case 73
	b _022F04DC ; case 74
	b _022F04C4 ; case 75
	b _022F04C4 ; case 76
	b _022F04C4 ; case 77
	b _022F04C4 ; case 78
	b _022F04DC ; case 79
	b _022F04DC ; case 80
	b _022F04DC ; case 81
	b _022F04DC ; case 82
	b _022F04DC ; case 83
	b _022F04DC ; case 84
	b _022F04DC ; case 85
	b _022F04DC ; case 86
	b _022F04DC ; case 87
	b _022F04C4 ; case 88
	b _022F04C4 ; case 89
	b _022F04DC ; case 90
	b _022F04CC ; case 91
	b _022F04C4 ; case 92
	b _022F04CC ; case 93
	b _022F04CC ; case 94
	b _022F04DC ; case 95
	b _022F04C4 ; case 96
	b _022F04DC ; case 97
	b _022F04DC ; case 98
	b _022F04DC ; case 99
	b _022F04DC ; case 100
	b _022F04C4 ; case 101
	b _022F04DC ; case 102
	b _022F04C4 ; case 103
	b _022F04C4 ; case 104
	b _022F04C4 ; case 105
	b _022F04DC ; case 106
	b _022F04DC ; case 107
	b _022F04DC ; case 108
	b _022F04C4 ; case 109
	b _022F04C4 ; case 110
	b _022F04DC ; case 111
	b _022F04DC ; case 112
	b _022F04DC ; case 113
	b _022F04DC ; case 114
	b _022F04DC ; case 115
	b _022F04DC ; case 116
	b _022F04DC ; case 117
	b _022F04DC ; case 118
	b _022F04DC ; case 119
	b _022F04CC ; case 120
	b _022F04CC ; case 121
	b _022F04CC ; case 122
	b _022F04CC ; case 123
	b _022F04C4 ; case 124
	b _022F04C4 ; case 125
	b _022F04DC ; case 126
	b _022F04DC ; case 127
	b _022F04C4 ; case 128
	b _022F04C4 ; case 129
	b _022F04C4 ; case 130
	b _022F04DC ; case 131
	b _022F04DC ; case 132
	b _022F04DC ; case 133
	b _022F04DC ; case 134
	b _022F04DC ; case 135
	b _022F04DC ; case 136
	b _022F04DC ; case 137
	b _022F04DC ; case 138
	b _022F04DC ; case 139
	b _022F04DC ; case 140
	b _022F04DC ; case 141
	b _022F04DC ; case 142
	b _022F04DC ; case 143
	b _022F04DC ; case 144
	b _022F04DC ; case 145
	b _022F04C4 ; case 146
	b _022F04C4 ; case 147
	b _022F04C4 ; case 148
	b _022F04C4 ; case 149
	b _022F04C4 ; case 150
	b _022F04DC ; case 151
	b _022F04C4 ; case 152
	b _022F04DC ; case 153
	b _022F04DC ; case 154
	b _022F04DC ; case 155
	b _022F04DC ; case 156
	b _022F04CC ; case 157
	b _022F04DC ; case 158
	b _022F04C4 ; case 159
	b _022F04C4 ; case 160
	b _022F04C4 ; case 161
	b _022F04C4 ; case 162
	b _022F04C4 ; case 163
	b _022F04C4 ; case 164
	b _022F04C4 ; case 165
	b _022F04C4 ; case 166
	b _022F04C4 ; case 167
	b _022F04C4 ; case 168
	b _022F04C4 ; case 169
	b _022F04C4 ; case 170
	b _022F04C4 ; case 171
	b _022F04C4 ; case 172
	b _022F04C4 ; case 173
	b _022F04C4 ; case 174
	b _022F04C4 ; case 175
	b _022F04C4 ; case 176
	b _022F04C4 ; case 177
	b _022F04C4 ; case 178
	b _022F04C4 ; case 179
	b _022F04C4 ; case 180
	b _022F04C4 ; case 181
	b _022F04C4 ; case 182
	b _022F04C4 ; case 183
	b _022F04C4 ; case 184
	b _022F04C4 ; case 185
	b _022F04C4 ; case 186
	b _022F04C4 ; case 187
	b _022F04DC ; case 188
	b _022F04DC ; case 189
	b _022F04DC ; case 190
	b _022F04C4 ; case 191
	b _022F04DC ; case 192
	b _022F04C4 ; case 193
	b _022F04DC ; case 194
	b _022F04DC ; case 195
	b _022F04DC ; case 196
	b _022F04C4 ; case 197
_022F016C:
	cmp r0, #0xf
	bgt _022F0188
	cmp r0, #0xc
	blt _022F04DC
	cmpne r0, #0xf
	beq _022F04C4
	b _022F04DC
_022F0188:
	cmp r0, #0x16
	beq _022F04C4
	b _022F04DC
_022F0194:
	cmp r0, #0x104
	bgt _022F01D4
	subs r1, r0, #0xfa
	addpl pc, pc, r1, lsl #2
	b _022F04DC
_022F01A8: ; jump table
	b _022F04C4 ; case 0
	b _022F04DC ; case 1
	b _022F04DC ; case 2
	b _022F04C4 ; case 3
	b _022F04CC ; case 4
	b _022F04DC ; case 5
	b _022F04DC ; case 6
	b _022F04C4 ; case 7
	b _022F04DC ; case 8
	b _022F04DC ; case 9
	b _022F04C4 ; case 10
_022F01D4:
	ldr r1, _022F04E8 ; =0x00000112
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F01E4:
	sub r2, r1, #0x37
	cmp r0, r2
	bgt _022F0220
	bge _022F04C4
	sub r2, r1, #0x39
	cmp r0, r2
	bgt _022F0210
	sub r1, r1, #0x39
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0210:
	sub r1, r1, #0x38
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0220:
	sub r2, r1, #0x2c
	cmp r0, r2
	bgt _022F023C
	sub r1, r1, #0x2c
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F023C:
	sub r1, r1, #0x2b
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F024C:
	sub r2, r1, #0x14
	cmp r0, r2
	bgt _022F02BC
	bge _022F04CC
	sub r2, r1, #0x20
	cmp r0, r2
	bgt _022F0294
	bge _022F04C4
	sub r2, r1, #0x27
	cmp r0, r2
	bgt _022F0288
	sub r1, r1, #0x27
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0288:
	cmp r0, #0x1d8
	beq _022F04CC
	b _022F04DC
_022F0294:
	sub r2, r1, #0x1f
	cmp r0, r2
	bgt _022F02B0
	sub r1, r1, #0x1f
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F02B0:
	cmp r0, #0x1e4
	beq _022F04C4
	b _022F04DC
_022F02BC:
	sub r2, r1, #0xb
	cmp r0, r2
	bgt _022F02F8
	bge _022F04C4
	sub r2, r1, #0xd
	cmp r0, r2
	bgt _022F02E8
	sub r1, r1, #0xd
	cmp r0, r1
	beq _022F04CC
	b _022F04DC
_022F02E8:
	sub r1, r1, #0xc
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F02F8:
	cmp r0, #0x1f4
	bgt _022F0308
	beq _022F04C4
	b _022F04DC
_022F0308:
	cmp r0, #0x1f8
	beq _022F04C4
	b _022F04DC
_022F0314:
	add r2, r1, #0x9b
	cmp r0, r2
	bgt _022F03FC
	bge _022F04D4
	add r2, r1, #0x10
	cmp r0, r2
	bgt _022F0398
	bge _022F04CC
	cmp r0, #0x204
	bgt _022F036C
	bge _022F04C4
	add r2, r1, #1
	cmp r0, r2
	bgt _022F035C
	add r1, r1, #1
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F035C:
	add r1, r1, #4
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F036C:
	add r2, r1, #0xb
	cmp r0, r2
	bgt _022F0388
	add r1, r1, #0xb
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0388:
	add r1, r1, #0xf
	cmp r0, r1
	beq _022F04CC
	b _022F04DC
_022F0398:
	add r2, r1, #0x17
	cmp r0, r2
	bgt _022F03D0
	bge _022F04C4
	add r2, r1, #0x15
	cmp r0, r2
	bgt _022F03C4
	add r1, r1, #0x15
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F03C4:
	cmp r0, #0x214
	beq _022F04C4
	b _022F04DC
_022F03D0:
	add r2, r1, #0x37
	cmp r0, r2
	bgt _022F03EC
	add r1, r1, #0x37
	cmp r0, r1
	beq _022F04CC
	b _022F04DC
_022F03EC:
	add r1, r1, #0x38
	cmp r0, r1
	beq _022F04CC
	b _022F04DC
_022F03FC:
	ldr r2, _022F04EC ; =0x0000037F
	cmp r0, r2
	bgt _022F0464
	bge _022F04C4
	sub r1, r2, #0x82
	cmp r0, r1
	bgt _022F0440
	bge _022F04C4
	sub r1, r2, #0xa6
	cmp r0, r1
	bgt _022F0430
	beq _022F04C4
	b _022F04DC
_022F0430:
	sub r1, r2, #0xa5
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0440:
	sub r1, r2, #0x81
	cmp r0, r1
	bgt _022F0454
	beq _022F04C4
	b _022F04DC
_022F0454:
	sub r1, r2, #0x61
	cmp r0, r1
	beq _022F04CC
	b _022F04DC
_022F0464:
	add r1, r2, #0x9f
	cmp r0, r1
	bgt _022F0498
	bge _022F04C4
	add r1, r2, #0x5a
	cmp r0, r1
	bgt _022F0488
	beq _022F04C4
	b _022F04DC
_022F0488:
	add r1, r2, #0x6a
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F0498:
	add r1, r2, #0xcb
	cmp r0, r1
	bgt _022F04B8
	bge _022F04C4
	add r1, r2, #0xab
	cmp r0, r1
	beq _022F04C4
	b _022F04DC
_022F04B8:
	add r1, r2, #0xcc
	cmp r0, r1
	bne _022F04DC
_022F04C4:
	mov r0, #0
	bx lr
_022F04CC:
	mov r0, #1
	bx lr
_022F04D4:
	mov r0, #0
	bx lr
_022F04DC:
	mov r0, #1
	bx lr
	.align 2, 0
_022F04E4: .word 0x000001FE
_022F04E8: .word 0x00000112
_022F04EC: .word 0x0000037F
	arm_func_end ov29_022EFBAC

	arm_func_start ov29_022F04F0
ov29_022F04F0: ; 0x022F04F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldrsh r0, [r4, #4]
	bl ov29_022EFBAC
	cmp r0, #0
	movne r0, #1
	strneb r0, [r5, #0xb3]
#ifdef JAPAN
	strneb r0, [r4, #0x16d]
#else
	strneb r0, [r4, #0x171]
#endif
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022F04F0

	arm_func_start ov29_022F0518
ov29_022F0518: ; 0x022F0518
	ldr r2, [r0, #0xb4]
	mov r1, #0
	ldr ip, _022F0530 ; =sub_0201D198
	add r0, r0, #0x2c
#ifdef JAPAN
	strb r1, [r2, #0x16d]
#else
	strb r1, [r2, #0x171]
#endif
	bx ip
	.align 2, 0
_022F0530: .word sub_0201D198
	arm_func_end ov29_022F0518

	arm_func_start ov29_022F0534
ov29_022F0534: ; 0x022F0534
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _022F058C ; =DUNGEON_PTR
	mov r7, r0
	mov r5, #0
_022F0544:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022F0590
	cmp r0, #0
	beq _022F057C
	cmp r7, #0
	mov r0, r6
	bne _022F0578
	bl ov29_022F0518
	b _022F057C
_022F0578:
	bl ov29_022F04F0
_022F057C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022F0544
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F058C: .word DUNGEON_PTR
	arm_func_end ov29_022F0534
