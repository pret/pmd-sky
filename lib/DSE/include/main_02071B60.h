#ifndef PMDSKY_MAIN_02071B60_H
#define PMDSKY_MAIN_02071B60_H

#include "dse.h"

void DseChannel_SetBank(struct dse_channel *channel, u16 bank);

u8* DseTrackEvent_SetBank(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
