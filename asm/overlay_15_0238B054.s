	.include "asm/macros.inc"
	.include "overlay_15_0238B054.inc"

	.text
	; 0x0238B054

	.rodata
	.global BANK_MAIN_MENU_ITEMS
BANK_MAIN_MENU_ITEMS:
#ifdef JAPAN
#define OV15_DATA_OFFSET 0x2EC5
#else
#define OV15_DATA_OFFSET 0
#endif
	.word 0x36F + OV15_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x370 + OV15_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x371 + OV15_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x372 + OV15_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x12, 0x1E, 0x05
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_2
BANK_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x1C, 0x03
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_3
BANK_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x08, 0x0B, 0x07
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_4
BANK_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0A, 0x05
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#ifndef EUROPE
	.global ov15_0238B0CC
ov15_0238B0CC:
	.byte 0x43, 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00
#endif
	.global ov15_0238B0D4
ov15_0238B0D4:
	.byte 0x52, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0E0
ov15_0238B0E0:
	.byte 0x4D, 0x2D, 0x4F, 0x70
	.byte 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B0E8
ov15_0238B0E8:
	.byte 0x53, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0F4
ov15_0238B0F4:
	.byte 0x4D, 0x65, 0x6E, 0x75, 0x5F, 0x42, 0x61, 0x6E, 0x6B, 0x5F, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x43
	.byte 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00, 0x00
	.global ov15_0238B10C
ov15_0238B10C:
	.byte 0x50, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B114
ov15_0238B114:
	.byte 0x47, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.data
	.global OVERLAY15_UNKNOWN_POINTER__NA_238B180
OVERLAY15_UNKNOWN_POINTER__NA_238B180:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
