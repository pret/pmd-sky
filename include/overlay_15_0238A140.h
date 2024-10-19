#ifndef PMDSKY_OVERLAY_15_0238A140_H
#define PMDSKY_OVERLAY_15_0238A140_H

#include "window.h"

// Represents arguments that might be passed to the PreprocessString function
typedef struct  {
    u32 flag_vals[4];  // 0x0: These are usually IDs with additional flags attached to them
    u32 id_vals[5];    // 0x10
    int number_vals[5]; // 0x24
    char* strings[5];       // 0x38
    // 0x4C: An optional argument that is used to insert the name of a Pokémon
    // When they're talking through a window. It requires its respective flag to be on
    u32 speaker_id;
    u8 fill88[0x88 - 0x3C];
    u32 unkproc88;
} preprocessor_args;

typedef struct {
    void* unk0;
    u8 fill10[0x10 - 0x5];
    u32 unk10;
    u8 fill68[0x68 - 0x14];
    s8 unk68;
    u8 fill80[0x80 - 0x69];
    s8 unk80;
    s8 unk81;
    u8 fill88[0x88 - 0x82];
    u32 unk88;
    u8 fillAC[0xAC - 0x8C];
    u32 unkAC;
    u8 fillD4[0xD4 - 0xB0];
    u32 unkD4;
    u8 fillDC[0xDC - 0xD8];
    portrait_params* unkDC;
} unkBankStruct;

u16 ov15_0238A140(void);

#endif //PMDSKY_OVERLAY_15_0238A140_H
