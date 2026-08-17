#include "main_0203755C.h"

struct unk_020AFDF0 {
    u8 field_0x0[0xF8];
    s32 field_0xF8;
};

extern struct unk_020AFDF0 *_020AFDF0;

s32 GetKeyboardStringResult(void)
{
    return _020AFDF0->field_0xF8;
}
