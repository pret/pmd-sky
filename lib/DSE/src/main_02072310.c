#include "main_02072310.h"

#define IME (*(vu16*)0x4000208)

u8* DseTrackEvent_VolumeDelta(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s32 v = *(s8 *)ptr_next_byte + (channel->volume.current >> 16);

    if (v > 0x7f) {
        v = 0x7f;
    } else if (v < 0) {
        v = 0;
    }
    channel->volume.target = v << 16;
    channel->volume.current = v << 16;
    channel->volume.ticks_remaining = 0;
    channel->volume_final = channel->container->song_and_global_volume * (v * channel->expression) / (127 * 127);

    {
        u16 old_ime = IME;
        IME = 0;
        struct dse_voice *voice = channel->voice_list;
        if (voice) {
            do {
                voice->update_flags = voice->update_flags | 0x20;
                voice = voice->next_in_channel_allocation_list;
            } while (voice);
        }
        {
            u16 unused = IME;
            IME = old_ime;
        }
    }
    return ptr_next_byte + 1;
}
