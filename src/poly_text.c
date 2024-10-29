#include "poly_text.h"

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
