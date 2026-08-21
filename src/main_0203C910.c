#include "main_0203C910.h"

extern void ov11_02310C18(void);

extern void sub_0203CCD8(s16 a);

extern s32 ov11_0230D220(void);

extern void ov11_0230D92C(void);

extern const struct unk_0209C7F4 _0209C7F4;

extern void MemFree(void * ptr);

extern struct unk_020AFE70 *_020AFE70;

bool8 sub_0203C910(void)
{
    if (_020AFE70 == NULL) {
        return 0;
    }

    return _020AFE70->field_0xC == 4;
}

s32 sub_0203C940(void)
{
    if (_020AFE70 == NULL) {
        return 1;
    }

    if (_020AFE70->field_0xC != 0xA) {
        return 0;
    }

    MemFree(_020AFE70);
    _020AFE70 = NULL;
    return 1;
}

void sub_0203C984(void)
{
    if (_020AFE70 != NULL) {
        _020AFE70->field_0x8 = 0;
    }
}

s32 sub_0203C9A0(s16 a)
{
    if (a == _020AFE70->field_0x4) {
        return 0;
    }

    _020AFE70->field_0x4 = a;
    return 1;
}

void sub_0203C9C4(void)
{
    _020AFE70->field_0x6 = -1;
    _020AFE70->field_0x4 = -1;
}

void sub_0203C9E4(void)
{
    struct unk_0209C7F4 t;

    if (_020AFE70 == NULL) {
        return;
    }

    t = _0209C7F4;
    t.field_0x0[_020AFE70->field_0xC]();
}

void sub_0203CA40(void)
{
    if (ov11_0230D220()) {
        return;
    }

    ov11_0230D92C();
    _020AFE70->field_0xC = 1;
}

void sub_0203CA6C(void)
{
    if (ov11_0230D220() == 0) {
        _020AFE70->field_0xC = 2;
    }
}

void sub_0203CA90(void)
{
    if (ov11_0230D220()) {
        return;
    }

    sub_0203CCD8(_020AFE70->field_0x4);
    ov11_02310C18();
    _020AFE70->field_0xC = 3;
}

void sub_0203CACC(void)
{
    if (ov11_0230D220() == 0) {
        _020AFE70->field_0xC = 4;
    }
}
