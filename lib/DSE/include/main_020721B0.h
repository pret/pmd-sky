#ifndef PMDSKY_MAIN_020721B0_H
#define PMDSKY_MAIN_020721B0_H

#include "dse.h"

u8* DseTrackEvent_SetUnknown2(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_SetKeyBendRange(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
