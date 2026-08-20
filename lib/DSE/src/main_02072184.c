#include "main_02072184.h"

u8* DseTrackEvent_SetKeyBend(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    DseChannel_SetKeyBend(channel, (s16) ((ptr_next_byte[0] << 8) + ptr_next_byte[1]));
    return ptr_next_byte + 2;
}
