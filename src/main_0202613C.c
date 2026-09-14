#include "main_0202613C.h"

extern void sub_02020B14(void *p);

extern void sub_02020B60(void *p, void *pair, u32 unk, void *pair2);









void sub_0202613C(struct unk_02026130* p)
{
    sub_02020B14((void *) p + 4);
}

void sub_0202614C(struct unk_02026130* p, u32 a, u32 b)
{
    struct { u32 x; u32 y; } v;
    void* r = &v;
    v.x = a;
    v.y = b;
    sub_02020B60((u8 *) p + 4, r, b, r);
}
