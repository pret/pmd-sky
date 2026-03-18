#include "main_0205B690.h"

// Should match the struct in main_0205B77C, but haven't gotten it to match yet.
// https://decomp.me/scratch/J6Sh5
struct unkStruct_020B0A54 {
    u8 unk0;
    u8 fill0[175];
};

extern struct unkStruct_020B0A54 *_020B0A54;

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
