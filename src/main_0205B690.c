#include "main_0205B690.h"

struct unkStruct_0205B690 {
    u8 unk0;
    u8 fill0[175];
};

extern struct unkStruct_0205B690 *_020B0A54;

s32 sub_0205B690(void)
{
    for (s32 i = 2; i < 32; i++)
    {
        if (_020B0A54[i].unk0 == 0)
        {
            return i;
        }
    }

    return -1;
}
