#include "main_02071A98.h"

u8* DseTrackEvent_SubLoopBreakOnLastIteration(u8 *cur, struct dse_seq *seq, struct dse_track *trk, struct dse_channel *chn)
{
    u8 n = trk->n_sub_loops;
    struct dse_sub_loop *last_loop = &trk->sub_loops[n-1];

    if (last_loop->count - 1 == 0) {
        cur = last_loop->end;
        trk->n_sub_loops = n - 1;
    }

    return cur;
}
