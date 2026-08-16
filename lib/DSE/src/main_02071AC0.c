#include "main_02071AC0.h"

u8* DseTrackEvent_SetOctave(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->current_octave = *ptr_next_byte++;
    return ptr_next_byte;
}

u8* DseTrackEvent_OctaveDelta(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->current_octave += *(s8 *)ptr_next_byte++;
    return ptr_next_byte;
}
