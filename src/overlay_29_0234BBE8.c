#include "overlay_29_0234BBE8.h"
#include "main_0204AFF8.h"
#include "overlay_29_022DC61C.h"
#include "overlay_29_0234CA68.h"
#include "util.h"

struct unk_ov29_023537DC {
    s32 v0;
    u8 v4;
    s32 v8;
    u8 v0xc;
    u8 v0xd;
};

typedef struct {
    u8 v0;
    struct unk_ov29_023537DC *v4;
} unk_ov29_023537D8_t;

extern unk_ov29_023537D8_t ov29_023537D8;
void ov29_022DEBA4(); // thunk_FUN_022deadc
void ov29_0234CB00();
void ov30_02382820(s32, s32, s32);
s32 ov30_02382874();
void ov29_022DDEF8();
s32 ov30_0238298C();
void ov30_023829A0();
void sub_02048DC4(s32);
void ov29_022DEBB0();
void sub_02051DD0(s32, s32);
void sub_02051E60(s32, s32);
void ov29_0234BEE0(s32);
void ov29_0234BF04(s32);
s32 GetDungeonPtrMaster();
void RunDungeon(void *, s32);
s32 sub_0205BAB0(void *);
void ov29_022DE418();
void sub_020091B0(s32, s32);
void sub_02009194(s32, s32);
void StartFadeDungeonWrapper(s32,s32,s32);
void ov29_0234C738(s32);
void SetAdventureLogDungeonFloor(void *);
void StopBgmCommand();
void ov30_023829CC(s32, s32, s32);
void ov29_022DDE00(s32);
void ov30_02382C30();
void ov29_0234CACC();
void ov29_022DC65C();
void sub_02017B70();

void ov29_0234BBE8(void)
{
    s32 uVar3;
    s32 uVar4;
    s32 uVar5;
    s32 iVar6;
    bool8 bVar1 = FALSE;
    struct unk_ov29_023537DC *iVar7 = ov29_023537D8.v4;
    ov29_022DC61C(); // mem init?
    if (iVar7[1].v4 != 0)
    {
        ov29_022DEBA4(); // thunk_FUN_022deadc/fade?
        ov29_0234CB00(); // do something with overlays
        uVar3 = ov29_0234CA68();
        uVar4 = ov29_0234CA7C();
        uVar5 = IsGameModeRescue(); // is GAME_MODE rescue?
        ov30_02382820(uVar3,uVar4,uVar5); // alloc these values
        while (iVar6 = ov30_02382874(), iVar6 != 0)
        {
            ov29_022DDEF8();
        }
        iVar6 = ov30_0238298C();
        ov30_023829A0();
        if (iVar6 != 0)
        {
            sub_02048DC4(0xF1208);
        }
        else
        {
            sub_02048DC4(0xF1209);
        }
        ov29_022DEBB0();
        if (iVar6 == 0)
        {
            iVar7[12].v0 = 5;
            bVar1 = TRUE;
            ov29_022DDEF8();
        }
    }
    while (!bVar1)
    {
        ov29_022DDEF8();
        if (ov29_023537D8.v0 != 0) continue;
        switch (ov29_023537D8.v4->v8)
        {
            case 1:
                sub_02051DD0(0,0);
                sub_02051DD0(1,0);
                sub_02051DD0(0,1);
                sub_02051DD0(1,1);
                sub_02051E60(0,0);
                sub_02051E60(1,0);
                sub_02051E60(0,1);
                sub_02051E60(1,1);
                ov29_0234BEE0(0);
                ov29_0234BEE0(1);
                ov29_0234BF04(0);
                ov29_0234BF04(1);
                uVar3 = GetDungeonPtrMaster();
                RunDungeon(&(ov29_023537D8.v4[1]), uVar3);
                bVar1 = TRUE;
                break;
            case 2:
                bVar1 = TRUE;
                break;
        }
    }
    if (&(ov29_023537D8.v4[1]) == (void *)0) goto _0234beb8;
    iVar7 = &(ov29_023537D8.v4[1]);
    iVar6 = -2;
    if (iVar7[11].v0 == -2)
    {
        iVar6 = sub_0205BAB0(&(iVar7[11].v8));
    }
    if (iVar7[11].v0 != 3)
    {
        iVar6 = -2;
        if (iVar7[11].v0 != iVar6) goto _0234beb8;
    }
    iVar7 = ov29_023537D8.v4;
    ov29_022DE418();
    sub_020091B0(0,0);
    sub_020091B0(1,0);
    sub_02009194(2,0);
    sub_02009194(3,0);
    sub_020091B0(4,0);
    StartFadeDungeonWrapper(1,0x4000,0);
    ov29_0234C738(0);
    SetAdventureLogDungeonFloor(&(iVar7[12].v4));
    sub_02017B70();
    if (iVar7[12].v0 != -2 && IsGameModeRescue())
    {
        uVar3 = 1;
    }
    else
    {
        uVar3 = 0;
    }
    uVar4 = ov29_0234CA68();
    uVar5 = ov29_0234CA7C();
    ov30_023829CC(uVar4,uVar5,uVar3);
    ov29_022DDE00(0x10);
    iVar7 = ov29_023537D8.v4;
    iVar7[0x1b].v0xc = 1;
    while (ov29_023537D8.v4[0x1b].v0xc != 0)
    {
        ov29_022DDEF8();
    }
    ov30_02382C30();
    ov29_0234CACC();
    ov29_022DDE00(2);
    StartFadeDungeonWrapper(2,0x4000,0);
    ov29_0234C738(0);
_0234beb8:
    ov29_022DC65C();
    ov29_023537D8.v4[0x1b].v0xd = 1;
    do
    {
        ov29_022DDEF8();
    } while( TRUE );
}
