#include "main_020332AC.h"

extern void PlaySeVolumeWrapper(s32 idx);

extern void sub_020331D4(struct unk_020332AC *m);

void InventoryMenuPreviousPage(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8;

    if (page <= 0) {
        page = m->field_0xCC;
    }

    m->field_0xC8 = page - 1;
    sub_020331D4(m);
}

void InventoryMenuNext10Pages(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8 + 10;

    if (page >= m->field_0xCC) {
        page = m->field_0xCC - 1;
    }

    m->field_0xC8 = page;
    sub_020331D4(m);
}

void InventoryMenuPrevious10Pages(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8 - 10;

    if (page < 0) {
        page = 0;
    }

    m->field_0xC8 = page;
    sub_020331D4(m);
}

void sub_0203330C(struct unk_020332AC *m, s32 a)
{
    if (a > 0) {
        m->field_0xB8 = (a << 8) / m->field_0xC4;
    } else {
        m->field_0xB8 = (((m->field_0x4 - m->field_0x0) - m->field_0xB4) << 8) /
                        m->field_0xC4;
    }
}

s32 sub_02033350(struct unk_020332AC *m, s32 i)
{
    return m->field_0xB4 + (i * m->field_0xB8) / 256;
}

s32 sub_0203336C(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}

s32 sub_02033390(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}

s32 sub_020333B4(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}

s32 sub_020333D8(struct unk_020332AC *m, s32 idx)
{
    if (!(m->field_0x10 & 0x10)) {
        return 0;
    }

    PlaySeVolumeWrapper(idx);
    return 1;
}

void sub_020333FC(struct unk_020332AC *m)
{
    m->field_0xE8 = -1;
    m->field_0xF0 = -1;
    m->field_0xE4 = -1;
    m->field_0xEC = -1;
}
