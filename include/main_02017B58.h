#ifndef PMDSKY_MAIN_02017B58_H
#define PMDSKY_MAIN_02017B58_H

#include "util.h"

void PlayBgmByIdVeneer(s32 bgm_id);
void PlayBgmByIdVolumeVeneer(s32 bgm_id, s32 volume);
void sub_02017B70(void);
void sub_02017B7C(void);
void sub_02017B88(void);
bool8 sub_02017B94(s32 id);
void sub_02017BD4(void);
void sub_02017BE0(void);
void sub_02017BEC(void);
void sub_02017BF8(void);
void sub_02017C04(void);
bool8 IsMePlaying(s32 id);
void sub_02017C50(s32 a);
void sub_02017C5C(s32 a);
void sub_02017C68(s32 a);
void sub_02017C74(s32 se_id, s32 volume);

#endif
