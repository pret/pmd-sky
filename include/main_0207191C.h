#ifndef PMDSKY_MAIN_0207191C_H
#define PMDSKY_MAIN_0207191C_H

#include "dse.h"

u8* DseTrackEvent_Invalid(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);
u8* DseTrackEvent_WaitSame(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);
u8* DseTrackEvent_WaitDelta(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);
u8* DseTrackEvent_Wait8(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);
u8* DseTrackEvent_Wait16(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);
u8* DseTrackEvent_Wait24(u8* position, struct dse_sequence* seq, struct dse_track* track, struct dse_channel* channel);

#endif
