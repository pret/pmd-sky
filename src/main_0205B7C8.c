#include "main_0205B7C8.h"
#include "main_0200330C.h"

struct unkStruct_020B0A54 {
    u8 f0;
    u8 pad[161];
    u16 fA2;
    u8 pad2[12];
};

// Should match the struct in main_0205B77C, but haven't gotten it to match yet.
// https://decomp.me/scratch/WXX6d
extern struct unkStruct_020B0A54 *_020B0A54;

void sub_0205B7C8(s32 index)
{
    MemsetSimple((u8*) &_020B0A54[index], 0, 0xB0);
    _020B0A54[index].f0 = 0;
    _020B0A54[index].fA2 = 0;
}
