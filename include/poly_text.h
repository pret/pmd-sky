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
} unk1962a;

struct unk_ov29_022DC240_t {
    s8 unk0[0x17704];
    s16 unk17704[0xf92];
    s16 unk19628;
    struct unk_ov29_022DC240_1962a_t unk1962a;
    s16 unk1963a;
};

void ov29_022DC240(struct unk_ov29_022DC240_t *param0);
void ov29_022DC2B8(struct unk_ov29_022DC240_t *param0);

#endif //PMDSKY_OVERLAY_29_022DC240_H
