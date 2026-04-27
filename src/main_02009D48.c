#include "main_02009D48.h"

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
