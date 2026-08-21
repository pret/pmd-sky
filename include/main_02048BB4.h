#ifndef PMDSKY_MAIN_02048BB4_H
#define PMDSKY_MAIN_02048BB4_H

struct unk_020AFF38 {
    char *field_0x0;
    s32 field_0x4;
};

#include "util.h"

char * ReadStringSave(char *dst);
bool8 CheckStringSave(const char *s);
s32 sub_02048BFC(void);
void sub_02048C0C(s32 v);
s32 sub_02048C3C(void);
void sub_02048C4C(s32 v);

#endif
