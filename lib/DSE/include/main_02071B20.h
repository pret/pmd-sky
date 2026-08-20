#ifndef PMDSKY_MAIN_02071B20_H
#define PMDSKY_MAIN_02071B20_H

#include "dse.h"

u32 _u32_div_f(u32 dividend, u32 divisor);

u8* DseTrackEvent_SetBpm2(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif
