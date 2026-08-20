#include "main_02071A14.h"

u8* DseTrackEvent_MainLoopBegin(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    track->loop_start = ptr_next_byte;
    return ptr_next_byte;
}

u8* DseTrackEvent_SubLoopBegin(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 idx = track->loop_stack_index;
    u8 count = *ptr_next_byte++;
    struct dse_sub_loop *loop = &track->loop_stack[idx];

    loop->start = ptr_next_byte;
    loop->end = NULL;
    loop->count = count;
    loop->octave = track->current_octave;
    track->loop_stack_index = idx + 1;
    return ptr_next_byte;
}

u8* DseTrackEvent_SubLoopEnd(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    int idx = track->loop_stack_index - 1;
    struct dse_sub_loop *loop = &track->loop_stack[idx];
    int count = loop->count - 1;

    if (count != 0) {
        loop->end = ptr_next_byte;
        loop->count = count;
        track->current_octave = loop->octave;
        return loop->start;
    }
    track->loop_stack_index = idx;
    return ptr_next_byte;
}
