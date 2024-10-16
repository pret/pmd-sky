#include "main_02003D2C.h"
#include <debug.h>

extern u8 _0209251C[];
extern u8 _02092508[];
extern u8 _0209252C[];
extern u8 _020AEF7C[];

void sub_020081DC(void);
void sub_020025F8(u32 param_0);

void CardPullOutWithStatus(u32 status)
{
    if (_020AEF7C[0xd] == '\0') {
        return;
    }
    Debug_Print0(_02092508,status);
    if (status != 0) {
        sub_020081DC();
    }
    sub_020025F8(0);
    return;
}

void CardPullOut(void)
{
    Debug_Print0(_0209251C);
    _020AEF7C[0xd]=1;
}

void CardBackupError(void)
{
    Debug_Print0(_0209252C);
    _020AEF7C[0xc]=1;
}
