	.include "asm/macros.inc"
	.include "overlay_29_0233CF84.inc"

	.text

	arm_func_start GetGridPositions
GetGridPositions: ; 0x0233CF84
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	mov r6, r4
	mov r5, #0x38
	b _0233CFC0
_0233CFA8:
	mov r0, r5
	mov r1, r8
	str r4, [sl, r6, lsl #2]
	bl _s32_div_f
	add r4, r4, r0
	add r6, r6, #1
_0233CFC0:
	cmp r6, r8
	blt _0233CFA8
	mov r6, #0
	str r4, [sl, r8, lsl #2]
	mov r5, r6
	mov r4, #0x20
	b _0233CFF4
_0233CFDC:
	mov r0, r4
	mov r1, r7
	str r6, [sb, r5, lsl #2]
	bl _s32_div_f
	add r6, r6, r0
	add r5, r5, #1
_0233CFF4:
	cmp r5, r7
	blt _0233CFDC
	str r6, [sb, r7, lsl #2]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end GetGridPositions

	arm_func_start InitDungeonGrid
InitDungeonGrid: ; 0x0233D004
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add r5, r1, r1, lsl #1
	mov r4, r5, asr #1
	add r3, r1, r1, lsr #31
	add ip, r5, r4, lsr #30
	mov r7, #0
	b _0233D0F0
_0233D020:
	ldr r4, _0233D0FC ; =0x000001C2
	mov r8, #0
	mla sb, r7, r4, r0
	mov r5, #1
	mov r4, r8
	mov r6, r5
	mov lr, r8
	b _0233D0E4
_0233D040:
	ldr sl, _0233D100 ; =FLOOR_GENERATION_STATUS
	ldrb sl, [sl, #6]
	cmp sl, #1
	bne _0233D064
	cmp r7, r3, asr #1
	movge sl, #0x1e
	mlage sl, r8, sl, sb
	strgeb r6, [sl, #8]
	bge _0233D08C
_0233D064:
	cmp sl, #2
	bne _0233D080
	cmp r7, ip, asr #2
	movge sl, #0x1e
	mlage sl, r8, sl, sb
	strgeb r5, [sl, #8]
	bge _0233D08C
_0233D080:
	mov sl, #0x1e
	mla sl, r8, sl, sb
	strb r4, [sl, #8]
_0233D08C:
	mov fp, #1
	strb fp, [sl, #0xa]
	strb lr, [sl, #0xb]
	strb lr, [sl, #0xf]
	and fp, lr, #0xff
	strb fp, [sl, #0xe]
	strb fp, [sl, #0xc]
	strb lr, [sl, #0x16]
	strb fp, [sl, #0x15]
	strb fp, [sl, #0x14]
	strb fp, [sl, #0x13]
	strb lr, [sl, #0x1a]
	strb fp, [sl, #0x19]
	strb fp, [sl, #0x18]
	strb fp, [sl, #0x17]
	strb lr, [sl, #9]
	strb lr, [sl, #0x11]
	strb lr, [sl, #0x10]
	strb lr, [sl, #0x12]
	strb lr, [sl, #0x1c]
	strb lr, [sl, #0x1d]
	add r8, r8, #1
_0233D0E4:
	cmp r8, r2
	blt _0233D040
	add r7, r7, #1
_0233D0F0:
	cmp r7, r1
	blt _0233D020
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D0FC: .word 0x000001C2
_0233D100: .word FLOOR_GENERATION_STATUS
	arm_func_end InitDungeonGrid

	arm_func_start AssignRooms
AssignRooms: ; 0x0233D104
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	mov sl, r0
	mov r4, r3
	mov r0, #3
	mov sb, r1
	mov r8, r2
	bl DungeonRandInt
	cmp r4, #0
	rsblt r4, r4, #0
	addge r4, r4, r0
	mov r2, #0
	mov r1, #1
	add r0, sp, #4
	b _0233D148
_0233D140:
	strb r1, [r0, r2]
	add r2, r2, #1
_0233D148:
	cmp r2, r4
	blt _0233D140
	mov r1, #0
	add r0, sp, #4
	b _0233D164
_0233D15C:
	strb r1, [r0, r2]
	add r2, r2, #1
_0233D164:
	cmp r2, #0x100
	blt _0233D15C
	mul r7, sb, r8
	mov r6, #0
	add r4, sp, #4
_0233D178:
	mov r0, r7
	bl DungeonRandInt
	mov r5, r0
	mov r0, r7
	bl DungeonRandInt
	add r6, r6, #1
	ldrb r2, [r4, r5]
	ldrb r1, [r4, r0]
	cmp r6, #0x40
	strb r1, [r4, r5]
	strb r2, [r4, r0]
	blt _0233D178
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	mov fp, #0
	sub r1, sb, #1
	str fp, [r0, #0x14]
	mov r3, fp
	and r5, sb, #1
	add r0, r1, r1, lsr #31
	mov r2, fp
	add lr, sp, #4
	b _0233D25C
_0233D1D0:
	ldr r1, _0233D314 ; =0x000001C2
	mov r4, #0
	mla r6, r3, r1, sl
	ldr r1, _0233D310 ; =FLOOR_GENERATION_STATUS
	b _0233D250
_0233D1E4:
	mov r7, #0x1e
	mla r7, r4, r7, r6
	ldrb ip, [r7, #8]
	cmp ip, #0
	bne _0233D24C
	ldr ip, [r1, #0x14]
	cmp ip, #0x20
	strgeb r2, [r7, #0xa]
	ldrb ip, [lr, fp]
	cmp ip, #0
	beq _0233D240
	mov ip, #1
	strb ip, [r7, #0xa]
	ldr ip, [r1, #0x14]
	cmp r5, #0
	add ip, ip, #1
	str ip, [r1, #0x14]
	beq _0233D248
	cmp r3, r0, asr #1
	cmpeq r4, #1
	moveq ip, #0
	streqb ip, [r7, #0xa]
	b _0233D248
_0233D240:
	mov ip, #0
	strb ip, [r7, #0xa]
_0233D248:
	add fp, fp, #1
_0233D24C:
	add r4, r4, #1
_0233D250:
	cmp r4, r8
	blt _0233D1E4
	add r3, r3, #1
_0233D25C:
	cmp r3, sb
	blt _0233D1D0
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x14]
	cmp r0, #2
	bge _0233D308
	mov r4, #0
	b _0233D2F4
_0233D27C:
	mov r0, #0
	str r0, [sp]
	mov r6, r0
	b _0233D2DC
_0233D28C:
	ldr r0, _0233D314 ; =0x000001C2
	mov r7, #0
	mla fp, r6, r0, sl
	b _0233D2D0
_0233D29C:
	mov r0, #0x1e
	mla r5, r7, r0, fp
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _0233D2CC
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x3c
	movlt r0, #1
	strlt r0, [sp]
	strltb r0, [r5, #0xa]
	blt _0233D2E4
_0233D2CC:
	add r7, r7, #1
_0233D2D0:
	cmp r7, r8
	blt _0233D29C
	add r6, r6, #1
_0233D2DC:
	cmp r6, sb
	blt _0233D28C
_0233D2E4:
	ldr r0, [sp]
	cmp r0, #0
	bne _0233D2FC
	add r4, r4, #1
_0233D2F4:
	cmp r4, #0xc8
	blt _0233D27C
_0233D2FC:
	ldr r0, _0233D310 ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	strb r1, [r0]
_0233D308:
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D310: .word FLOOR_GENERATION_STATUS
_0233D314: .word 0x000001C2
	arm_func_end AssignRooms

	arm_func_start CreateRoomsAndAnchors
CreateRoomsAndAnchors: ; 0x0233D318
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r5, [sp, #0x5c]
	str r0, [sp]
	and r0, r5, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x58]
	mov r4, #0
	str r4, [sp, #0x1c]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r0, [sp, #0x58]
	b _0233D658
_0233D350:
	ldr r0, [sp]
	mov r1, #0x1e
	mla sb, r4, r1, r0
	ldr r0, [sp, #4]
	mov sl, #0
	sub r0, r0, #1
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	sub r0, r0, #1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x58]
	add r0, r0, r4, lsl #2
	str r0, [sp, #0x20]
	b _0233D648
_0233D388:
	ldr r0, [sp, #0xc]
	ldr r3, [r0, sl, lsl #2]
	ldr r0, [sp, #0x58]
	add fp, r3, #2
	ldr r2, [r0, r4, lsl #2]
	add r0, r2, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r0, r0, sl, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x20]
	sub r1, r1, r3
	ldr r0, [r0, #4]
	sub r5, r1, #4
	sub r0, r0, r2
	sub r6, r0, #3
	ldr r0, _0233D66C ; =0x000001C2
	mla r0, sl, r0, sb
	str r0, [sp, #0x10]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0233D644
	ldr r0, [sp, #0x10]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _0233D580
	mov r0, #5
	mov r1, r5
	bl DungeonRandRange
	mov r7, r0
	mov r0, #4
	mov r1, r6
	bl DungeonRandRange
	mov r8, r0
	orr r0, r7, #1
	cmp r0, r5
	movlt r7, r0
	orr r0, r8, #1
	cmp r0, r6
	movlt r8, r0
	add r0, r8, r8, lsl #1
	add r0, r0, r0, lsr #31
	cmp r7, r0, asr #1
	mov r0, r0, asr #1
	movgt r7, r0
	add r0, r7, r7, lsl #1
	add r0, r0, r0, lsr #31
	cmp r8, r0, asr #1
	mov r0, r0, asr #1
	movgt r8, r0
	sub r0, r5, r7
	bl DungeonRandInt
	add r5, fp, r0
	sub r0, r6, r8
	bl DungeonRandInt
	ldr r1, [sp, #0x18]
	add fp, r5, r7
	add r6, r1, r0
	ldr r0, _0233D66C ; =0x000001C2
	add r7, r6, r8
	mul r0, sl, r0
	strh r5, [sb, r0]
	add r0, sb, r0
	strh fp, [r0, #4]
	strh r6, [r0, #2]
	strh r7, [r0, #6]
	ldr r0, [sp, #0x1c]
	and r0, r0, #0xff
	str r0, [sp, #0x24]
	b _0233D4F0
_0233D4A0:
	mov r8, r6
	b _0233D4E4
_0233D4A8:
	mov r0, r5
	mov r1, r8
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r8
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldr r1, [sp, #0x24]
	add r8, r8, #1
	strb r1, [r0, #7]
_0233D4E4:
	cmp r8, r7
	blt _0233D4A8
	add r5, r5, #1
_0233D4F0:
	cmp r5, fp
	blt _0233D4A0
	mov r5, #1
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x50
	movlt r0, r5
	movge r0, #0
	and r6, r0, #0xff
	ldr r0, _0233D670 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	ldr r0, [sp, #0x14]
	moveq r6, #0
	cmp r0, #0
	moveq r5, #0
	cmp r5, #0
	cmpne r6, #0
	beq _0233D550
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x32
	movlt r5, #0
	movge r6, #0
_0233D550:
	cmp r5, #0
	ldrne r0, [sp, #0x10]
	movne r1, #1
	strneb r1, [r0, #0x1c]
	cmp r6, #0
	ldrne r0, [sp, #0x10]
	movne r1, #1
	strneb r1, [r0, #0x1d]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	b _0233D644
_0233D580:
	mov r2, #2
	ldr r0, [sp, #0x28]
	mov r8, r2
	cmp sl, #0
	moveq r2, #1
	cmp r4, #0
	moveq r8, #1
	cmp sl, r0
	mov r1, #4
	mov r7, r1
	ldr r0, [sp, #0x2c]
	moveq r1, #2
	cmp r4, r0
	add r0, fp, r2
	add r2, fp, r5
	sub r1, r2, r1
	moveq r7, #2
	bl DungeonRandRange
	ldr r1, [sp, #0x18]
	add r1, r1, r6
	mov r6, r0
	ldr r0, [sp, #0x18]
	sub r1, r1, r7
	add r0, r0, r8
	bl DungeonRandRange
	mov r5, r0
	ldr r0, _0233D66C ; =0x000001C2
	mul r0, sl, r0
	strh r6, [sb, r0]
	add r1, sb, r0
	add r0, r6, #1
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	add r0, r5, #1
	strh r0, [r1, #6]
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r6
	bl GetTileSafe
	mov r1, #0xfe
	strb r1, [r0, #7]
_0233D644:
	add sl, sl, #1
_0233D648:
	ldr r0, [sp, #4]
	cmp sl, r0
	blt _0233D388
	add r4, r4, #1
_0233D658:
	ldr r0, [sp, #8]
	cmp r4, r0
	blt _0233D350
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D66C: .word 0x000001C2
_0233D670: .word FLOOR_GENERATION_STATUS
	arm_func_end CreateRoomsAndAnchors

	arm_func_start GenerateSecondaryStructures
GenerateSecondaryStructures: ; 0x0233D674
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	mov r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r0, [sp, #0x20]
	b _0233E03C
_0233D694:
	ldr r0, [sp, #0x20]
	mov r1, #0x1e
	mul r7, r0, r1
	mov r0, #0
	add r6, sl, r7
	str r0, [sp, #0x24]
	b _0233E020
_0233D6B0:
	ldr r1, [sp, #0x24]
	ldr r0, _0233E054 ; =0x000001C2
	mul sb, r1, r0
	add r8, r6, sb
	ldrb r0, [r8, #8]
	cmp r0, #0
	ldreqb r0, [r8, #0xe]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x12]
	cmpeq r0, #0
	bne _0233E014
	ldrb r0, [r8, #0xa]
	cmp r0, #0
	beq _0233E014
	ldrb r0, [r8, #0x1c]
	cmp r0, #0
	bne _0233E014
	ldrb r0, [r8, #0x1d]
	cmp r0, #0
	beq _0233E014
	mov r0, #6
	bl DungeonRandInt
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0233E014
_0233D714: ; jump table
	b _0233E014 ; case 0
	b _0233DE94 ; case 1
	b _0233DDC8 ; case 2
	b _0233DC9C ; case 3
	b _0233D938 ; case 4
	b _0233D72C ; case 5
_0233D72C:
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	mov r0, #2
	bl DungeonRandInt
	cmp r0, #0
	mov r0, #0
	beq _0233D850
	str r0, [sp, #0x10]
	mov r4, r8
	ldrsh r1, [r6, sb]
	ldrsh r0, [r4, #4]
	ldrsh r5, [r4, #2]
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov fp, r0, asr #1
	b _0233D7AC
_0233D78C:
	mov r0, fp
	mov r1, r5
	bl IsNextToHallway
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x10]
	bne _0233D7B8
	add r5, r5, #1
_0233D7AC:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D78C
_0233D7B8:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0233E014
	ldrsh r5, [r4, #2]
	b _0233D7F4
_0233D7CC:
	mov r0, fp
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233D7F4:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D7CC
	ldrsh sb, [r4]
	b _0233D83C
_0233D808:
	ldrsh r5, [r4, #2]
	b _0233D82C
_0233D810:
	mov r0, sb
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	orr r1, r1, #0x80
	strh r1, [r0]
_0233D82C:
	ldrsh r0, [r4, #6]
	cmp r5, r0
	blt _0233D810
	add sb, sb, #1
_0233D83C:
	cmp sb, fp
	blt _0233D808
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233D850:
	str r0, [sp, #0x14]
	mov r4, r8
	ldrsh r1, [r4, #2]
	ldrsh r0, [r4, #6]
	ldrsh r5, [r6, sb]
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov fp, r0, asr #1
	b _0233D894
_0233D874:
	mov r0, r5
	mov r1, fp
	bl IsNextToHallway
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x14]
	bne _0233D8A0
	add r5, r5, #1
_0233D894:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D874
_0233D8A0:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0233E014
	ldrsh r5, [r4]
	b _0233D8DC
_0233D8B4:
	mov r0, r5
	mov r1, fp
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233D8DC:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D8B4
	ldrsh sb, [r4, #2]
	b _0233D924
_0233D8F0:
	ldrsh r5, [r4]
	b _0233D914
_0233D8F8:
	mov r0, r5
	mov r1, sb
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	orr r1, r1, #0x80
	strh r1, [r0]
_0233D914:
	ldrsh r0, [r4, #4]
	cmp r5, r0
	blt _0233D8F8
	add sb, sb, #1
_0233D924:
	cmp sb, fp
	blt _0233D8F0
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233D938:
	mov r1, r8
	ldrsh r4, [r6, sb]
	ldrsh r3, [r1, #4]
	sub r0, r3, r4
	cmp r0, #6
	ldrgesh r2, [r1, #2]
	ldrgesh r1, [r1, #6]
	subge r0, r1, r2
	cmpge r0, #6
	blt _0233E014
	add r0, r4, r3
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	add r1, r2, r1
	ldr r0, [r0, #0x18]
	add r1, r1, r1, lsr #31
	mov r4, r1, asr #1
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	sub r0, r4, #2
	str r0, [sp, #0xc]
	sub r0, r5, #2
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	sub fp, r5, #1
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r1, [r0]
	sub sb, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #6
	strh r1, [r0]
	ldr r0, [sp, #8]
	mov r1, sb
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	ldr r0, [sp, #8]
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	add r1, r4, #1
	orr r2, r2, #4
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0]
	ldr r1, [sp, #0xc]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, sb
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r4, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #6
	strh r2, [r0]
	add r0, r5, #1
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, sb
	orr r2, r2, #6
	strh r2, [r0]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #4
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #0x40
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #2
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, sb
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, fp
	bl GetTileSafe
	ldrh r2, [r0, #2]
	mov r1, r4
	orr r2, r2, #0x10
	strh r2, [r0, #2]
	mov r0, r5
	bl GetTileSafe
	ldrh r1, [r0, #2]
	orr r1, r1, #0x10
	strh r1, [r0, #2]
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DC9C:
	mov r4, r8
	ldrsh r3, [r6, sb]
	ldrsh r2, [r4, #4]
	sub r0, r2, r3
	cmp r0, #5
	ldrgesh r1, [r4, #6]
	ldrgesh r0, [r4, #2]
	subge r0, r1, r0
	cmpge r0, #5
	blt _0233E014
	add r0, r3, #2
	sub r1, r2, #3
	bl DungeonRandRange
	ldrsh r1, [r4, #6]
	str r0, [sp, #0x28]
	mov r5, r0
	ldrsh r0, [r4, #2]
	sub r1, r1, #3
	add r0, r0, #2
	bl DungeonRandRange
	str r0, [sp, #0x18]
	ldrsh r0, [r4]
	ldrsh r1, [r4, #4]
	add r0, r0, #2
	sub r1, r1, #3
	bl DungeonRandRange
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #2]
	ldrsh r1, [r4, #6]
	add r0, r0, #2
	sub r1, r1, #3
	bl DungeonRandRange
	mov fp, r0
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	movgt r5, r0
	movgt r0, r1
	strgt r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	cmp r0, fp
	strgt fp, [sp, #0x18]
	movgt fp, r0
	b _0233DDB0
_0233DD74:
	ldr r4, [sp, #0x18]
	b _0233DDA4
_0233DD7C:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233DDA4:
	cmp r4, fp
	ble _0233DD7C
	add r5, r5, #1
_0233DDB0:
	ldr r0, [sp, #0x1c]
	cmp r5, r0
	ble _0233DD74
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DDC8:
	mov r2, r8
	ldrsh r1, [r2, #4]
	ldrsh r0, [r6, sb]
	sub r0, r1, r0
	tst r0, #1
	beq _0233E014
	ldrsh r1, [r2, #6]
	ldrsh r0, [r2, #2]
	sub r0, r1, r0
	tst r0, #1
	ldrne r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldrne r0, [r0, #0x18]
	cmpne r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	add r0, sl, sb
	add r0, r0, r7
	bl SetSpawnFlag5
	mov r5, #0
_0233DE1C:
	ldrsh r1, [r8, #4]
	ldrsh r0, [r8]
	sub r0, r1, r0
	bl DungeonRandInt
	mov r4, r0
	ldrsh r1, [r8, #6]
	ldrsh r0, [r8, #2]
	sub r0, r1, r0
	bl DungeonRandInt
	mov r2, r0
	add r0, r4, r2
	tst r0, #1
	beq _0233DE7C
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	add r0, r0, r4
	add r1, r1, r2
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
_0233DE7C:
	add r5, r5, #1
	cmp r5, #0x40
	blt _0233DE1C
	mov r0, #1
	strb r0, [r8, #9]
	b _0233E014
_0233DE94:
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0233E014
	sub r1, r0, #1
	ldr r0, _0233E058 ; =FLOOR_GENERATION_STATUS
	str r1, [r0, #0x18]
	mov r0, r8
	ldrsh r2, [r0, #4]
	ldrsh r1, [r6, sb]
	sub r3, r2, r1
	tst r3, #1
	beq _0233DEDC
	ldrsh r2, [r0, #6]
	ldrsh r1, [r0, #2]
	sub r1, r2, r1
	tst r1, #1
	bne _0233DFF4
_0233DEDC:
	cmp r3, #5
	ldrsh r4, [r0]
	ldrsh r3, [r0, #4]
	ldrsh r2, [r0, #6]
	ldrsh r1, [r0, #2]
	add r0, r4, r3
	add r0, r0, r0, lsr #31
	mov r4, r0, asr #1
	add r0, r1, r2
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	subge r0, r2, r1
	cmpge r0, #5
	blt _0233DFCC
	add r0, r4, #1
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	add r1, r5, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	sub r0, r4, #1
	bl GetTileSafe
	ldrh r2, [r0]
	sub r1, r5, #1
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	mov r1, r5
	ldrh r2, [r0]
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #2
	strh r2, [r0]
	mov r0, r4
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	b _0233E00C
_0233DFCC:
	mov r0, r4
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	b _0233E00C
_0233DFF4:
	add r4, sl, sb
	add r0, r4, r7
	bl SetSpawnFlag5
	add r0, r4, r7
	mov r1, #1
	bl GenerateMaze
_0233E00C:
	mov r0, #1
	strb r0, [r8, #9]
_0233E014:
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
_0233E020:
	ldr r1, [sp, #0x24]
	ldr r0, [sp]
	cmp r1, r0
	blt _0233D6B0
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
_0233E03C:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _0233D694
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E054: .word 0x000001C2
_0233E058: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateSecondaryStructures

	arm_func_start AssignGridCellConnections
AssignGridCellConnections: ; 0x0233E05C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r4, [sp, #0x3c]
	mov r8, r1
	mov r1, r4
	ldrb r1, [r1, #5]
	mov sb, r0
	mov r0, #4
	str r4, [sp, #0x3c]
	mov fp, r2
	mov r7, r3
	ldr r5, [sp, #0x38]
	str r1, [sp, #4]
	bl DungeonRandInt
	mov r6, r0
	mov sl, #0
	b _0233E208
_0233E0A0:
	mov r0, #8
	bl DungeonRandInt
	mov r4, r0
	mov r0, #4
	bl DungeonRandInt
	mov lr, #1
	cmp r4, #4
	movlt r6, r0
	sub r1, r8, #1
	sub r0, fp, #1
	mov ip, lr
	mov r3, #0
_0233E0D0:
	and r2, r6, #3
	mov r4, r3
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0233E130
_0233E0E4: ; jump table
	b _0233E0F4 ; case 0
	b _0233E104 ; case 1
	b _0233E114 ; case 2
	b _0233E124 ; case 3
_0233E0F4:
	cmp r7, r1
	movlt r4, ip
	addge r6, r6, #1
	b _0233E130
_0233E104:
	cmp r5, #0
	movgt r4, lr
	addle r6, r6, #1
	b _0233E130
_0233E114:
	cmp r7, #0
	movgt r4, #1
	addle r6, r6, #1
	b _0233E130
_0233E124:
	cmp r5, r0
	movlt r4, #1
	addge r6, r6, #1
_0233E130:
	cmp r4, #0
	beq _0233E0D0
	and r0, r6, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233E204
_0233E148: ; jump table
	b _0233E158 ; case 0
	b _0233E184 ; case 1
	b _0233E1B0 ; case 2
	b _0233E1DC ; case 3
_0233E158:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x16]
	streqb r0, [r1, #0x1d7]
	addeq r7, r7, #1
	b _0233E204
_0233E184:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #-0x16]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x13]
	streqb r0, [r1, #-0xa]
	subeq r5, r5, #1
	b _0233E204
_0233E1B0:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #-0x1ba]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x15]
	streqb r0, [r1, #-0x1ac]
	subeq r7, r7, #1
	b _0233E204
_0233E1DC:
	ldr r0, _0233E438 ; =0x000001C2
	mov r1, #0x1e
	mla r0, r7, r0, sb
	mla r1, r5, r1, r0
	ldrb r0, [r1, #0x26]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x14]
	streqb r0, [r1, #0x31]
	addeq r5, r5, #1
_0233E204:
	add sl, sl, #1
_0233E208:
	ldr r0, [sp, #4]
	cmp sl, r0
	blt _0233E0A0
	ldr r0, [sp, #0x3c]
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0233E430
_0233E224:
	sub r0, r8, #1
	mov r6, #0
	str r0, [sp, #8]
	sub r0, fp, #1
	str r6, [sp]
	str r0, [sp, #0xc]
	b _0233E41C
_0233E240:
	ldr r0, _0233E438 ; =0x000001C2
	mov r7, #0
	mla sl, r6, r0, sb
	b _0233E410
_0233E250:
	mov r1, #0x1e
	mla r5, r7, r1, sl
	ldrb r1, [r5, #8]
	mov r0, #0
	cmp r1, #0
	ldreqb r1, [r5, #0xa]
	cmpeq r1, #0
	bne _0233E40C
	ldrb r1, [r5, #0x13]
	cmp r1, #0
	ldrb r1, [r5, #0x14]
	addne r0, r0, #1
	cmp r1, #0
	ldrb r1, [r5, #0x15]
	addne r0, r0, #1
	cmp r1, #0
	ldrb r1, [r5, #0x16]
	addne r0, r0, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r0, #1
	bne _0233E40C
	mov r4, #0
	mov r0, #4
	bl DungeonRandInt
	mov r1, r4
	b _0233E370
_0233E2BC:
	and r2, r0, #3
	mov r4, #0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0233E364
_0233E2D0: ; jump table
	b _0233E2E0 ; case 0
	b _0233E304 ; case 1
	b _0233E324 ; case 2
	b _0233E344 ; case 3
_0233E2E0:
	ldr r2, [sp, #8]
	cmp r6, r2
	bge _0233E2FC
	ldrb r2, [r5, #0x16]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E2FC:
	add r0, r0, #1
	b _0233E364
_0233E304:
	cmp r7, #0
	ble _0233E31C
	ldrb r2, [r5, #0x13]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E31C:
	add r0, r0, #1
	b _0233E364
_0233E324:
	cmp r6, #0
	ble _0233E33C
	ldrb r2, [r5, #0x15]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E33C:
	add r0, r0, #1
	b _0233E364
_0233E344:
	ldr r2, [sp, #0xc]
	cmp r7, r2
	bge _0233E360
	ldrb r2, [r5, #0x14]
	cmp r2, #0
	moveq r4, #1
	beq _0233E364
_0233E360:
	add r0, r0, #1
_0233E364:
	cmp r4, #0
	bne _0233E378
	add r1, r1, #1
_0233E370:
	cmp r1, #8
	blt _0233E2BC
_0233E378:
	cmp r4, #0
	beq _0233E40C
	and r0, r0, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233E40C
_0233E390: ; jump table
	b _0233E3A0 ; case 0
	b _0233E3BC ; case 1
	b _0233E3D8 ; case 2
	b _0233E3F4 ; case 3
_0233E3A0:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x16]
	streqb r0, [r5, #0x1d7]
	streq r0, [sp]
	b _0233E40C
_0233E3BC:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x13]
	streqb r0, [r5, #-0xa]
	streq r0, [sp]
	b _0233E40C
_0233E3D8:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x15]
	streqb r0, [r5, #-0x1ac]
	streq r0, [sp]
	b _0233E40C
_0233E3F4:
	ldrb r0, [r5, #0x1ca]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x14]
	streqb r0, [r5, #0x31]
	streq r0, [sp]
_0233E40C:
	add r7, r7, #1
_0233E410:
	cmp r7, fp
	blt _0233E250
	add r6, r6, #1
_0233E41C:
	cmp r6, r8
	blt _0233E240
	ldr r0, [sp]
	cmp r0, #0
	bne _0233E224
_0233E430:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E438: .word 0x000001C2
	arm_func_end AssignGridCellConnections
