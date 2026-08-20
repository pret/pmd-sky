#include "main_02009D48.h"

extern u8 _022A37AC[];

extern u8 _022A37AD[];

extern u8 _022A37AE[];

extern u8 _022A37AF[];

extern u8 _022A37B0[];

void sub_02009C54(s32);
void sub_02009C38(s32);
void sub_02009C70(s32);
void sub_02009C8C(s32);
void sub_020095AC(s32);
void sub_020095C8(s32);
void sub_020095E4(s32);
void sub_02009600(s32);

extern unkStruct_02009D48 _022A37CC[];
extern unkStruct_02009D48 _022A37D0[];
extern unkStruct_02009D48 _022A37D4[];
extern unkStruct_02009D48 _022A37D8[];

void sub_02009D48(s32 arg0)
{
    if (arg0 == 0) {
        sub_02009C54(_022A37CC[arg0].val);
        sub_02009C38(_022A37D0[arg0].val);
        sub_02009C70(_022A37D4[arg0].val);
        sub_02009C8C(_022A37D8[arg0].val);
        return;
    }
    sub_020095AC(_022A37CC[arg0].val);
    sub_020095C8(_022A37D0[arg0].val);
    sub_020095E4(_022A37D4[arg0].val);
    sub_02009600(_022A37D8[arg0].val);
}

void sub_02009DCC(s32 engine)
{
    s32 idx = engine * 5;
    u32 mask = 0x1F;

    if (_022A37AC[idx] != 0) {
        mask &= ~1;
    }

    if (_022A37AD[idx] != 0) {
        mask &= ~2;
    }

    if (_022A37AE[idx] != 0) {
        mask &= ~4;
    }

    if (_022A37AF[idx] != 0) {
        mask &= ~8;
    }

    if (_022A37B0[idx] != 0) {
        mask &= ~0x10;
    }

    if (engine == 0) {
        *(vu32 *) 0x04000000 = (*(vu32 *) 0x04000000 & ~0x1F00) | (mask << 8);
    } else {
        *(vu32 *) 0x04001000 = (*(vu32 *) 0x04001000 & ~0x1F00) | (mask << 8);
    }
}
