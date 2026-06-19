#include <nitro/snd/common/util.h>
#include <nitro/snd/common/channel.h>

#define SND_VOLUME_SHIFT_2_MIN -240
#define SND_VOLUME_SHIFT_1_MIN -120
#define SND_VOLUME_SHIFT_0_MIN -60

extern const u8 VolumeTable[SND_VOLUME_TABLE_SIZE];

u16 Snd_CalcChannelVolume (int dB)
{
    SNDChannelDataShift shift;
    u8 volume;

    if (dB < SND_VOLUME_DB_MIN) {
        dB = SND_VOLUME_DB_MIN;
    } else if (dB > SND_VOLUME_DB_MAX)   {
        dB = SND_VOLUME_DB_MAX;
    }

#ifdef SND_USE_SYSTEM_ROM_TABLE
    volume = SVC_GetVolumeTable(dB - SND_VOLUME_DB_MIN);
#else
    volume = VolumeTable[dB - SND_VOLUME_DB_MIN];
#endif

    if (dB < SND_VOLUME_SHIFT_2_MIN) {
        shift = SND_CHANNEL_DATASHIFT_4BIT;
    } else if (dB < SND_VOLUME_SHIFT_1_MIN)   {
        shift = SND_CHANNEL_DATASHIFT_2BIT;
    } else if (dB < SND_VOLUME_SHIFT_0_MIN)   {
        shift = SND_CHANNEL_DATASHIFT_1BIT;
    } else {
        shift = SND_CHANNEL_DATASHIFT_NONE;
    }

    return (u16)(shift << 8 | volume);
}
