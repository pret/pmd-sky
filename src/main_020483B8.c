#include "main_020483B8.h"
#include "script_variable.h"

extern struct unk_020AFEF4 *_020AFEF4;

extern void sub_020476EC(s16 a);

extern bool8 sub_0204771C(void);

extern void sub_02048B74(void);

extern void sub_02048B48(void);

extern void sub_0206637C(void);

extern void sub_02048C0C(s32 a);

extern void sub_02048C4C(s32 a);

extern void sub_02048C5C(void);

extern s32 sub_02048C3C(void);

extern void ClearAdventureLogStruct(void);

extern void sub_0204F9B8(void);

void sub_020483B8(void)
{
    sub_020476EC(_020AFEF4->field_0x31B8);
}

bool8 sub_020483D8(void)
{
    bool8 ok = sub_0204771C();

    if (ok) {
        _020AFEF4->field_0x31B2 = 0;
    }

    return ok;
}

bool8 sub_02048400(void)
{
    return _020AFEF4 != NULL;
}

void sub_02048420(void)
{
    DebugPrintEventFlagSize();
    sub_02048B74();
}

void sub_02048430(void)
{
    sub_0206637C();
    sub_02048C0C(0);
    sub_02048C4C(-1);
    sub_0204F9B8();
    sub_02048B48();
}

void sub_02048454(void)
{
    ClearAdventureLogStruct();
    sub_0206637C();
    sub_02048C0C(0);
    sub_02048C4C(-1);
    sub_0204F9B8();
    sub_02048B48();
    sub_02048C5C();
}

bool8 sub_02048480(void)
{
    return sub_02048C3C() != -1;
}
