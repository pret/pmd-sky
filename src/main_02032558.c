#include "main_02032558.h"

s32 GetSelectedItemOnPage(struct unk_02032558* p)
{
    return p->field_0xBC;
}

s32 GetCurrentPage(struct unk_02032558* p)
{
    return p->field_0xC8;
}

s32 GetPageStart(struct unk_02032558* p)
{
    return p->field_0xC8 * p->field_0xC4;
}

s32 GetSelectedMenuItemIdx(struct unk_02032558* p)
{
    return p->field_0xC8 * p->field_0xC4 + p->field_0xBC;
}
