#include "main_02071A14.h"

u8* DseTrackEvent_MainLoopBegin(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel)
{
    track->loop_start = position;
    return position;
}
