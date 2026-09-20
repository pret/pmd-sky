#include "main_0205B440.h"
#include "main_0200330C.h"
#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

extern u8 _020A3550;
extern void _022B5910(void);
extern void _022B57C0(void);
extern void _022B580C(void);

extern u32 _022B57BC;

extern void sub_0204A198(u8 *macAddr);

u8* sub_0205B440(void)
{
    return &_020A3550;
}

void sub_0205B44C(void)
{
    _020B0A54.fp[0] = _022B5910;
    _020B0A54.fp[2] = _022B57C0;
    _020B0A54.fp[1] = _022B580C;
}

void sub_0205B478(void)
{
    u8 macAddr[6];
    s32 i;

    sub_0204A198(macAddr);
    _022B57BC = (macAddr[2] << 24) | (macAddr[3] << 16) | (macAddr[4] << 8) | macAddr[5];
    MemsetSimple((u8 *) _020B0A54.struct0, 0, 0x1600);
    MemsetSimple((u8 *) _020B0A54.struct1.unk8.unk8, 0, 0x4C);

    for (i = 0; i < 32; i++)
    {
        _020B0A54.struct0[i].unk0 = 0;
        _020B0A54.struct0[i].unkA2 = 0;
    }

    ((struct unk_022B580C *) _020B0A54.struct1.unk4)->field_0x0 = 0;

    for (i = 0; i < 32; i++)
    {
        ((struct unk_022B580C *) _020B0A54.struct1.unk4)->field_0x4[i].field_0x0 = 0;
        ((struct unk_022B580C *) _020B0A54.struct1.unk4)->field_0x4[i].field_0x4 = -1;
    }
}
