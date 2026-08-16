#include "main_0207191C.h"

u8* DseTrackEvent_Invalid(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->is_playing = FALSE;
    return position;
}

u8* DseTrackEvent_WaitSame(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->wait_ticks_left = track->previous_wait_ticks;
    return position;
}

u8* DseTrackEvent_WaitDelta(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->previous_wait_ticks += *(s8*)position++;
    track->wait_ticks_left = track->previous_wait_ticks;
    return position;
}

u8* DseTrackEvent_Wait8(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->previous_wait_ticks = *position++;
    track->wait_ticks_left = track->previous_wait_ticks;
    return position;
}

u8* DseTrackEvent_Wait16(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->previous_wait_ticks = position[0] + (position[1] << 8);
    position += 2;
    track->wait_ticks_left = track->previous_wait_ticks;
    return position;
}

u8* DseTrackEvent_Wait24(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->previous_wait_ticks = position[0] + (position[1] << 8) + (position[2] << 16);
    position += 3;
    track->wait_ticks_left = track->previous_wait_ticks;
    return position;
}

u8* DseTrackEvent_WaitUntilFadeout(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    if (DseVoice_CountNumActiveInChannel(channel) > 0) {
        track->wait_ticks_left = *position;
        position--;
    } else {
        position++;
    }
    return position;
}

u8* DseTrackEvent_EndTrack(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    if (track->loop_start == NULL) {
        track->is_playing = FALSE;
        position--;
        DseChannel_DeallocateVoices(channel);
    } else {
        track->main_loop_count++;
        seq->field_0x0.has_looped = TRUE;
        position = track->loop_start;
    }
    return position;
}
