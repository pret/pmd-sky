#include "main_0205B7C8.h"
#include "main_0200330C.h"

extern struct unkStruct_020B0A54 *_020B0A54;

void sub_0205B7C8(s32 index)
{
    MemsetSimple((u8*) &_020B0A54[index], 0, 0xB0);
    _020B0A54[index].f0 = 0;
    _020B0A54[index].fA2 = 0;
}
