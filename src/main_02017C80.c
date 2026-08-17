#include "main_02017C80.h"

void PlaySeByIdVolume(s32 se_id, s32 volume);

void PlaySeByIdVolumeWrapper(s32 se_id)
{
    PlaySeByIdVolume(se_id, 0x100);
}
