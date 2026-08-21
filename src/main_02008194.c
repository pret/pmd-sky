#include "main_02008194.h"
#include "main_0207F3E4.h"

extern struct unk_020AF360 _020AF360;

extern u8 _020AF368[];



extern void sub_02002E98(u8 *p);

extern void sub_02002CB4(u8 *p);

extern void sub_02002E10(u8 *p);

extern void *sub_02002580(void);

extern void sub_020027F8(void *a, s32 b);













void FileRom_StopDataTransfer(void)
{
    s32 saved = _020AF360.field_0x4;

    _020AF360.field_0x4 = 0;
    sub_02002E98(_020AF368);
    sub_020027F8(sub_02002580(), saved);
}

void sub_020081C8(void)
{
    sub_02002CB4(_020AF368);
}

void sub_020081DC(void)
{
    sub_02002E98(_020AF368);
}

void sub_020081F0(void)
{
    sub_02002E10(_020AF368);
}

void FileRom_Veneer_FileInit(struct file_stream* file)
{
    FS_InitFile(file);
}
