#include "main_0205B440.h"
#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

extern u8 _020A3550;
extern void _022B5910(void);
extern void _022B57C0(void);
extern void _022B580C(void);

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
