#ifndef PMDSKY_MAIN_02071A14_H
#define PMDSKY_MAIN_02071A14_H

#include "dse.h"

u8* DseTrackEvent_MainLoopBegin(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_SubLoopBegin(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_SubLoopEnd(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
