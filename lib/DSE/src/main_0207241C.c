#include "main_0207241C.h"

#define IME (*(vu16*)0x4000208)

u8* DseTrackEvent_SetExpression(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 e = *ptr_next_byte;

    channel->expression = e;
    channel->volume_final = channel->container->song_and_global_volume * ((channel->volume.current >> 16) * e) / (127 * 127);

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
