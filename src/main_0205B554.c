#include "main_0205B554.h"

extern u32 sub_02048C3C(void);
extern u32 _022B57BC;

void sub_0205B554(struct unkStruct_0205B560 *v1, struct unkStruct_0205B560 *v2)
{
    sub_0205B560(v1, v2);
}

bool8 sub_0205B560(struct unkStruct_0205B560 *v1, struct unkStruct_0205B560 *v2)
{
    if (v1->unk0 == v2->unk0 && v1->unk1 == v2->unk1)
    {
        return TRUE;
    }

    return FALSE;
}

void sub_0205B584(struct unkStruct_0205B560 *ptr)
{
    ptr->unk0 = _022B57BC;
    ptr->unk1 = sub_02048C3C();
}
