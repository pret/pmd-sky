#include "main_02026174.h"

struct unk_02020B60 {
    s32 field_0x0;
    s32 field_0x4;
};

extern void sub_02020B60(void *p, struct unk_02020B60 *pos);
extern void AnalyzeText(void *p);
extern void sub_02020D7C(void *p, void *dst);
extern void sub_02025E84(struct unk_02026130 *p, s32 window_id);


extern void sub_02020B74(void *p);

extern void sub_02020BB8(void *p);

extern void sub_02020BC4(void *p, u32 flags, char *string);

extern void sub_02020CCC(void *p);

extern void sub_02020D18(void *p);

extern void sub_02020D40(void *p);

extern void sub_02020D54(void *p);

extern void sub_02020D5C(void *p);

void sub_02026174(struct unk_02026130* p)
{
    sub_02020B74((void *) p + 4);
}

void sub_02026184(struct unk_02026130* p)
{
    sub_02020BB8((void *) p + 4);
}

void sub_02026194(struct unk_02026130* p, u32 flags, char* string)
{
    sub_02020BC4((void *) p + 4, flags, string);
}

void sub_020261A4(struct unk_02026130* p)
{
    sub_02020CCC((void *) p + 4);
}

void sub_020261B4(struct unk_02026130* p)
{
    sub_02020D18((void *) p + 4);
}

void sub_020261C4(struct unk_02026130* p)
{
    sub_02020D40((void *) p + 4);
}

void sub_020261D4(struct unk_02026130* p)
{
    sub_02020D54((void *) p + 4);
}

void sub_020261E4(struct unk_02026130* p)
{
    sub_02020D5C((void *) p + 4);
}

void sub_020261F4(struct unk_02026130* p, void* dst)
{
    sub_02020D7C((void *) p + 4, dst);
}

void sub_02026204(struct unk_02026130* p)
{
    AnalyzeText((void *) p + 4);
}

void DrawTextInWindow(s32 window_id, s32 x, s32 y, char* string)
{
    struct unk_02020B60 pos;
    struct unk_02026130 state;

    pos.field_0x0 = x;
    pos.field_0x4 = y;
    sub_02025E84(&state, window_id);
    sub_02020B60(state.field_0x4, &pos);
    sub_02020BC4(state.field_0x4, 0xC402, string);
    AnalyzeText(state.field_0x4);
}
