#include "main_0205B440.h"

extern u8 _020A3550;
extern void _022B5910(void);
extern void _022B57C0(void);
extern void _022B580C(void);
// Should match the struct in main_0205B77C, but haven't gotten it to match yet.
// https://decomp.me/scratch/fRcSA
extern void (*_020B0A54[])(void);

u8* sub_0205B440(void)
{
    return &_020A3550;
}

void sub_0205B44C(void)
{
    _020B0A54[0] = _022B5910;
    _020B0A54[2] = _022B57C0;
    _020B0A54[1] = _022B580C;
}
