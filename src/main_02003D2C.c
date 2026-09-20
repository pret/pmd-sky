#include "main_02003D2C.h"
#include <debug.h>
#include "main_0200238C.h"
#include "main_020027E8.h"

extern u8 _02092540[];
extern u8 _020AF050[];
extern struct unk_020027E8 _020AF078;

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


void OS_WaitIrq(BOOL clear, s32 irq);
struct unk_020027E8 *sub_02002580(void);
void sub_020029B8(void *a);
void sub_020081C8(void);
bool8 sub_020081F0(void);
void sub_0200B76C(s32 a);
void sub_020184A8(void);
void Card_TerminateForPulledOut(void);

void HaltProcessDisp(s32 a)
{
    u8 is_main;
    s32 i;

    is_main = sub_02002580() == &_020AF078;
    if (_020AEF7C[0xf] == 0) {
        _020AEF7C[0xf] = 1;
        if (is_main) {
            while (!sub_020081F0()) {
                OS_SleepThread(NULL);
                sub_020029B8(_020AF050);
            }
        } else {
            sub_020081C8();
        }
    }

    sub_02002824(1);
    sub_020184A8();
    Debug_Print0(_02092540, a);

    if (a == 2) {
        sub_0200B76C(1);
        for (i = 0; i < 300; i++) {
            if (_020AEF7C[0xd] != 0) {
                break;
            }
            OS_WaitIrq(TRUE, 1);
        }
        if (_020AEF7C[0xd] == 0) {
            sub_02002448(0);
        }
    }

    if (a != 1) {
        sub_0200B76C(0);
    }
    Card_TerminateForPulledOut();
    sub_020025F8(0);
}
void sub_02003ECC(void)
{
}