#ifndef PMDSKY_OVERLAY_29_022DC240_H
#define PMDSKY_OVERLAY_29_022DC240_H

struct unk_ov29_022DC240_t {
    char unk0[0x1962a];

    struct unk_ov29_022DC240_1962a_t {
        short unk0;
        short unk2;
        short unk4;
        short unk6;
        short unk8;
        short unka;
        short unkc;
        short unke;
    } unk1962a;

    short unk1963a;
};

void ov29_022DC240(struct unk_ov29_022DC240_t *param0);

#endif //PMDSKY_OVERLAY_29_022DC240_H
