#include "main_0207191C.h"

u8* DseTrackEvent_Invalid(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->is_playing = FALSE;
    return ptr_next_byte;
}

u8* DseTrackEvent_WaitSame(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->wait_ticks_left = track->previous_wait_ticks;
    return ptr_next_byte;
}

u8* DseTrackEvent_WaitDelta(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->previous_wait_ticks += *(s8 *)ptr_next_byte++;
    track->wait_ticks_left = track->previous_wait_ticks;
    return ptr_next_byte;
}

u8* DseTrackEvent_Wait8(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->previous_wait_ticks = *ptr_next_byte++;
    track->wait_ticks_left = track->previous_wait_ticks;
    return ptr_next_byte;
}

u8* DseTrackEvent_Wait16(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->previous_wait_ticks = ptr_next_byte[0] + (ptr_next_byte[1] << 8);
    ptr_next_byte += 2;
    track->wait_ticks_left = track->previous_wait_ticks;
    return ptr_next_byte;
}

u8* DseTrackEvent_Wait24(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->previous_wait_ticks = ptr_next_byte[0] + (ptr_next_byte[1] << 8) + (ptr_next_byte[2] << 16);
    ptr_next_byte += 3;
    track->wait_ticks_left = track->previous_wait_ticks;
    return ptr_next_byte;
}

u8* DseTrackEvent_WaitUntilFadeout(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    if (DseVoice_CountNumActiveInChannel(channel) > 0) {
        track->wait_ticks_left = *ptr_next_byte;
        ptr_next_byte--;
    } else {
        ptr_next_byte++;
    }
    return ptr_next_byte;
}

u8* DseTrackEvent_EndTrack(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    if (track->loop_start == NULL) {
        track->is_playing = FALSE;
        ptr_next_byte--;
        DseChannel_DeallocateVoices(channel);
    } else {
        track->main_loop_count++;
        sequence->field_0x0.has_looped = TRUE;
        ptr_next_byte = track->loop_start;
    }
    return ptr_next_byte;
}
