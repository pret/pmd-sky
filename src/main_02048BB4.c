#include "main_02048BB4.h"

extern s32 _022AAE70;

extern const char _0209CD4C[];

extern void Debug_Print0(const char *fmt, s32 a, s32 b);

extern s32 strncmp(const char *a, const char *b, s32 n);

extern struct unk_020AFF38 _020AFF38;

extern char *strncpy(char *d, const char *s, s32 n);

extern char *ReadStringSave(char *dst);

char * ReadStringSave(char *dst)
{
    return strncpy(dst, _020AFF38.field_0x0, 0x20);
}

bool8 CheckStringSave(const char *s)
{
    return strncmp(s, _020AFF38.field_0x0, 0x20) == 0;
}

s32 sub_02048BFC(void)
{
    return _020AFF38.field_0x4;
}

void sub_02048C0C(s32 v)
{
    Debug_Print0(_0209CD4C, _020AFF38.field_0x4, v);
    _020AFF38.field_0x4 = v;
}

s32 sub_02048C3C(void)
{
    return _022AAE70;
}

void sub_02048C4C(s32 v)
{
    _022AAE70 = v;
}
