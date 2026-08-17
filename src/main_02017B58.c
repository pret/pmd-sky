#include "main_02017B58.h"

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
