#include "main_020725D4.h"

#define IME (*(vu16*)0x4000208)

u8* DseTrackEvent_PanDelta(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s32 v = *(s8 *)ptr_next_byte + (channel->pan.current >> 16);

    if (v > 0x7f) {
        v = 0x7f;
    } else if (v < 0) {
        v = 0;
    }
    channel->pan.target = v << 16;
    channel->pan.current = v << 16;
    channel->pan.ticks_remaining = 0;
    channel->pan_final = v + (channel->container->pan - 0x40);

    {
        u16 old_ime = IME;
        IME = 0;
        struct dse_voice *voice = channel->voice_list;
        if (voice) {
            do {
                voice->update_flags = voice->update_flags | 0x40;
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
