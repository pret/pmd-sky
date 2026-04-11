#include "overlay_03_0233CA80.h"

extern void MemZero(void* ptr, u32 len);

struct Overlay03Main ov03_02346BE0;

void ov03_0233CA80(void) {
    MemZero(&ov03_02346BE0, sizeof(struct Overlay03Main));
}

void ov03_0233CA98(s32 arg0) {
    ov03_02346BE0.unk0 = arg0;
}

void ov03_0233CAA8(s32 arg0) {
    ov03_02346BE0.unk4 = arg0;
}

s32 ov03_0233CAB8(void) {
    return ov03_02346BE0.unk4;
}

void ov03_0233CAC8(s32 arg0) {
    ov03_02346BE0.unk8 = arg0;
}

s32 ov03_0233CAD8(void) {
    return ov03_02346BE0.unk8;
}

void ov03_0233CAE8(s32 arg0) {
    ov03_02346BE0.unkC = arg0;
}

s32 ov03_0233CAF8(void) {
    return ov03_02346BE0.unkC;
}


