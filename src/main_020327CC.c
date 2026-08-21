#include "main_020327CC.h"
#include "main_020332AC.h"

extern void sub_02032754(struct unk_020332AC *m);

void sub_020327CC(struct unk_020332AC *m, s32 a, s32 b)
{
    m->field_0xD0 = a;
    m->field_0xC4 = b;
    m->field_0xBC = 0;
    m->field_0xC8 = 0;
}

void sub_020327E4(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8;

    if (page >= m->field_0xCC - 1) {
        page = 0;
    } else {
        page = page + 1;
    }

    m->field_0xC8 = page;
    sub_02032754(m);
}

void sub_0203280C(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8;

    if (page <= 0) {
        page = m->field_0xCC;
    }

    m->field_0xC8 = page - 1;
    sub_02032754(m);
}

void sub_0203282C(struct unk_020332AC *m)
{
    s32 last;
    s32 page;

    last = m->field_0xCC - 1;
    page = m->field_0xC8;

    if (page >= last) {
        m->field_0xC8 = 0;
    } else {
        page += 10;

        if (page <= last) {
            last = page;
        }

        m->field_0xC8 = last;
    }

    sub_02032754(m);
}

void sub_02032864(struct unk_020332AC *m)
{
    s32 page;

    page = m->field_0xC8;

    if (page <= 0) {
        m->field_0xC8 = m->field_0xCC - 1;
    } else {
        page -= 10;

        if (page < 0) {
            page = 0;
        }

        m->field_0xC8 = page;
    }

    sub_02032754(m);
}

void sub_02032894(struct unk_020332AC *m, s32 a)
{
    if (a > 0) {
        m->field_0xB8 = (a << 8) / m->field_0xC4;
    } else {
        m->field_0xB8 = (((m->field_0x4 - m->field_0x0) - m->field_0xB4) << 8) /
                        m->field_0xC4;
    }
}

s32 GetPageItemYOffset(struct unk_020332AC *m, s32 i)
{
    return m->field_0xB4 + (i * m->field_0xB8) / 256;
}

s32 sub_020328F4(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}

s32 sub_02032918(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}

s32 sub_0203293C(struct unk_020332AC *m)
{
    if (m->field_0x10 & 0x8000) {
        if (m->field_0xCC > 1) {
            return 1;
        }
    }

    return 0;
}
