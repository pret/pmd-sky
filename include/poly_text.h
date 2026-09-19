#ifndef PMDSKY_OVERLAY_29_022DC240_H
#define PMDSKY_OVERLAY_29_022DC240_H

struct unk_ov29_022DC240_1962a_t {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unka;
    s16 unkc;
    s16 unke;
};

struct unk_ov29_022DC240_18304_t {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unka;
    u8 unkc;
    u8 unkd;
};

struct unk_ov29_022DC240_t {
    s8 unk0[0x17704];
    s16 unk17704[0x600];
    struct unk_ov29_022DC240_18304_t unk18304[350];
    u16 unk19628;
    struct unk_ov29_022DC240_1962a_t unk1962a;
    s16 unk1963a;
};

void ov29_022DC240(struct unk_ov29_022DC240_t *param0);
void ov29_022DC2B8(struct unk_ov29_022DC240_t *param0);
void ov29_022DC314(void *a, const u8 *b);
void ov29_022DC33C(u8 *p);
void ov29_022DC544(s32 a);

#endif //PMDSKY_OVERLAY_29_022DC240_H
