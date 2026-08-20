#include "main_0207216C.h"

u8* DseTrackEvent_SetTuningJitterAmplitude(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->bend_jitter_amplitude = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    ptr_next_byte += 2;
    return ptr_next_byte;
}
