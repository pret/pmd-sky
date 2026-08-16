#include "main_02071A14.h"

u8* DseTrackEvent_MainLoopBegin(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->loop_start = position;
    return position;
}

u8* DseTrackEvent_SubLoopBegin(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    u8 idx = track->loop_stack_index;
    u8 count = *position++;
    struct dse_sub_loop* loop = &track->loop_stack[idx];

    loop->start = position;
    loop->end = NULL;
    loop->count = count;
    loop->octave = track->current_octave;
    track->loop_stack_index = idx + 1;
    return position;
}

u8* DseTrackEvent_SubLoopEnd(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    int idx = track->loop_stack_index - 1;
    struct dse_sub_loop* loop = &track->loop_stack[idx];
    int count = loop->count - 1;

    if (count != 0) {
        loop->end = position;
        loop->count = count;
        track->current_octave = loop->octave;
        return loop->start;
    }
    track->loop_stack_index = idx;
    return position;
}
