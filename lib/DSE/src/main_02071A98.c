#include "main_02071A98.h"

u8* DseTrackEvent_SubLoopBreakOnLastIteration(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 n = track->loop_stack_index;
    struct dse_sub_loop *last_loop = &track->loop_stack[n-1];

    if (last_loop->count - 1 == 0) {
        ptr_next_byte = last_loop->end;
        track->loop_stack_index = n - 1;
    }

    return ptr_next_byte;
}
