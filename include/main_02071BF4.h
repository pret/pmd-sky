#ifndef PMDSKY_MAIN_02071BF4_H
#define PMDSKY_MAIN_02071BF4_H

#include "dse.h"

u8* DseTrackEvent_Dummy1Byte(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);
u8* DseTrackEvent_SetInstrument(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel);

#endif //PMDSKY_MAIN_02071BF4_H
