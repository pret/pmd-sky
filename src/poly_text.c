#include "poly_text.h"
#include "debug.h"
#include "file.h"
#include "main_0201E380.h"

struct unk_ov29_022DC240_1962a_t unk1962a;

extern u8 *_020AFC70;

struct unk_02353880 {
    u16 field_0x0;
    u16 field_0x2;
    u32 field_0x4;
    u32 field_0x8;
    s16 field_0xc;
    s16 field_0xe;
    s16 field_0x10;
    s16 field_0x12;
    u16 field_0x14;
    s16 field_0x16;
    s16 field_0x18;
    s16 field_0x1a;
    s16 field_0x1c;
    s16 field_0x1e;
    s16 field_0x20;
    u16 field_0x22;
    u16 field_0x24;
    u8 field_0x26;
    u8 field_0x27;
    u8 field_0x28[0xc];
};

extern struct unk_02353880 ov29_02353880;

extern const u8 ov29_0234FD14[];

extern const u8 ov29_0234FD04[][4];

extern u32 ov29_0234FD48[];

extern u32 ov29_0234FD4C[];

extern u32 ov29_0234FD50[];

extern u32 ov29_0234FD54[];

extern const char *ov29_023534E8[];

extern void LoadFileFromRom(struct iovec *iov, const char *filepath, u32 flags);

extern void sub_02008BF4(void *a, const u8 *b);

extern void sub_0201E050(void *src, u32 dst, u32 len, u32 d);

extern void Render3dSetTextureParams(void *params, u32 a);

extern void Render3dSetPaletteBase(void *params, u32 base);

extern void Render3dTextureNoSetup(void *elem);

extern void MemZero(void* ptr, u32 len);

void ov29_022DC240(struct unk_ov29_022DC240_t *param0)
{
    MemZero(param0, sizeof(struct unk_ov29_022DC240_t));
    param0->unk1962a.unk0 = 0;
    param0->unk1962a.unk2 = 0;
    param0->unk1962a.unk4 = 0x100;
    param0->unk1962a.unk6 = 0xc0;
    param0->unk1962a.unk8 = 0x40;
    param0->unk1962a.unka = 0x18;
    param0->unk1962a.unkc = 0x4;
    param0->unk1962a.unke = 0x8;
}

void ov29_022DC2B8(struct unk_ov29_022DC240_t *param0) {
    param0->unk19628 = 0;
    int v1 = (short)(param0->unk1962a.unk8 * param0->unk1962a.unka);
    for(int i = 0; i < v1; i = (short)(i + 1)) {
        (param0->unk17704)[i] = 0;
    }
}

void ov29_022DC314(void* a, const u8* b)
{
    Debug_Print0(ov29_0234FD14, b);
    sub_02008BF4(a, b);
}

void ov29_022DC33C(u8* p)
{
    struct unk_ov29_022DC240_t* d = (struct unk_ov29_022DC240_t*)p;
    struct unk_02353880* g;
    struct unk_ov29_022DC240_t* q;
    u16 params;
    u16 *pp;
    u32 vram;
    s16 i;
    u16 col;
    u8 c;

    if (d->unk19628 == 0) {
        return;
    }

    {
        struct unk_02353880* const e = &ov29_02353880;
        e->field_0x14 = (e->field_0x14 & ~0x700) | 0x200;
        pp = &params;
        *pp = (*pp & ~0x700) | 0x200;
        e->field_0x14 = (e->field_0x14 & ~0x7) | 0x5;
        *pp = (*pp & ~0x7) | 0x5;
        e->field_0x16 = 0;
        e->field_0x18 = 0;
        e->field_0x1a = 0;
        e->field_0x1c = 0;
        e->field_0x1e = 0x1000;
        e->field_0x20 = 0x1000;
        e->field_0xc = 0;
        e->field_0xe = 0;
        e->field_0x10 = 0;
        e->field_0x12 = 0;
        e->field_0x24 = 0;
        e->field_0x4 = 0;
        e->field_0x8 = 0;
        e->field_0x26 = 0;
        e->field_0x2 = 0;
        e->field_0x14 = (e->field_0x14 & ~0x38) | 0x28;
        e->field_0x22 = 0x7fff;
        e->field_0x27 = 0x1f;
        *pp = (*pp & ~0x38) | 0x28;
        vram = *(u32*)(_020AFC70 + 0xe0);
    }

    Render3dSetTextureParams(&params, 0x1b000);
    Render3dSetPaletteBase(&params, vram + 0x3c00);

    for (i = 0, g = &ov29_02353880; i < d->unk19628; i++) {
        q = (struct unk_ov29_022DC240_t*)&((struct unk_ov29_022DC240_18304_t*)p)[i];
        if (q->unk18304[0].unkd != 0) {
            c = q->unk18304[0].unkc & 3;
            g->field_0x16 = q->unk18304[0].unk0;
            g->field_0x18 = q->unk18304[0].unk2;
            col = (u16)((ov29_0234FD04[c][2] & 0xf8) << 7) | ((ov29_0234FD04[c][1] & 0xf8) << 2) | ((ov29_0234FD04[c][0] & 0xf8) >> 3);
            g->field_0xc = q->unk18304[0].unk4;
            g->field_0xe = q->unk18304[0].unk6;
            g->field_0x10 = q->unk18304[0].unk8;
            g->field_0x12 = q->unk18304[0].unka;
            g->field_0x14 = (g->field_0x14 & ~0x700) | 0x200;
            g->field_0x2 = 0;
            g->field_0x27 = 0x1f;
            g->field_0x22 = col;
            g->field_0x0 = 3;
            Render3dTextureNoSetup(g);
        }
    }
}

void ov29_022DC544(s32 a)
{
    struct iovec iov;
    void* base;
    u32 len;

    LoadFileFromRom(&iov, ov29_023534E8[a], 0x300);
    base = iov.iov_base;
    len = iov.iov_len;
    sub_0201E050(base, 0x1b000, len, 0);
    sub_0201E050(base, 0, 0, 2);
    sub_0201E380((struct unk_0201E380*)(_020AFC70 + 0xcc), ov29_0234FD48, 0x1e, 0);
    sub_0201E380((struct unk_0201E380*)(_020AFC70 + 0xcc), ov29_0234FD4C, 0x1e, 1);
    sub_0201E380((struct unk_0201E380*)(_020AFC70 + 0xcc), ov29_0234FD50, 0x1e, 2);
    sub_0201E380((struct unk_0201E380*)(_020AFC70 + 0xcc), ov29_0234FD54, 0x1e, 3);
}
