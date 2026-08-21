#include "main_02017B58.h"

extern void PlayMeById(s32 a);

extern void PlaySeByIdVolume(s32 se_id, s32 volume);

extern void sub_020182AC(s32 a);

extern void sub_02018278(s32 a);

extern void StopBgmCommand(void);

extern s32 sub_020181E0(void);

extern void sub_02018194(void);

extern void sub_02018158(void);

extern void sub_02018118(void);

extern void sub_020180A0(void);

extern void sub_02018024(void);

extern s32 sub_02017FBC(void);

extern void sub_02017F64(void);

extern void sub_02017F28(void);

void PlayBgmById(s32 bgm_id);
void PlayBgmByIdVolume(s32 bgm_id, s32 volume);

void PlayBgmByIdVeneer(s32 bgm_id)
{
    PlayBgmById(bgm_id);
}

void PlayBgmByIdVolumeVeneer(s32 bgm_id, s32 volume)
{
    PlayBgmByIdVolume(bgm_id, volume);
}

void sub_02017B70(void)
{
    StopBgmCommand();
}

void sub_02017B7C(void)
{
    sub_02017F28();
}

void sub_02017B88(void)
{
    sub_02017F64();
}

bool8 sub_02017B94(s32 id)
{
    s32 cur = sub_02017FBC();

    if (id == 0x3E7) {
        return cur != 0x3E7;
    }

    return cur == id;
}

void sub_02017BD4(void)
{
    sub_02018024();
}

void sub_02017BE0(void)
{
    sub_020180A0();
}

void sub_02017BEC(void)
{
    sub_02018118();
}

void sub_02017BF8(void)
{
    sub_02018158();
}

void sub_02017C04(void)
{
    sub_02018194();
}

bool8 IsMePlaying(s32 id)
{
    s32 cur = sub_020181E0();

    if (id == 0x3E6) {
        return cur != 0x3E6;
    }

    return cur == id;
}

void sub_02017C50(s32 a)
{
    PlayMeById(a);
}

void sub_02017C5C(s32 a)
{
    sub_02018278(a);
}

void sub_02017C68(s32 a)
{
    sub_020182AC(a);
}

void sub_02017C74(s32 se_id, s32 volume)
{
    PlaySeByIdVolume(se_id, volume);
}
