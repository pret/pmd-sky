#include "main_02071E34.h"

#define IME (*(vu16*)0x4000208)

u8* DseTrackEvent_SetTuning(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s16 tune = *(s8*)ptr_next_byte<<8;
    channel->tuning = tune;

    channel->bend_final = tune + (s16)(channel->bend.current >> 0x10) + channel->container->bend;
    u16 old_ime = IME;
    IME = 0;
    struct dse_voice *voice = channel->voice_list;
    if(voice) {
        do {
            voice->update_flags = voice->update_flags | 0x10;
            voice = voice->next_in_channel_allocation_list;
        } while(voice);
    }
    u16 unused = IME;
    IME = old_ime;
    return ptr_next_byte + 1;
}
