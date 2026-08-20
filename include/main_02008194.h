#ifndef PMDSKY_MAIN_02008194_H
#define PMDSKY_MAIN_02008194_H

#include "util.h"
#include "file.h"

struct unk_020AF360 {
    u8 field_0x0[4];
    s32 field_0x4;
};

void FileRom_StopDataTransfer(void);
void sub_020081C8(void);
void sub_020081DC(void);
void sub_020081F0(void);
void FileRom_Veneer_FileInit(struct file_stream* file);

#endif
