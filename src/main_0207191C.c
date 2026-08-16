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
