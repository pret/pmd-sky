#ifndef PMDSKY_MAIN_02072184_H
#define PMDSKY_MAIN_02072184_H

#include "dse.h"

void DseChannel_SetKeyBend(struct dse_channel *channel, s16 bend);

u8* DseTrackEvent_SetKeyBend(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
