#include "main_02071B8C.h"

u8* DseTrackEvent_SetBankMsb(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    DseChannel_SetBank(channel, (u16) ((*ptr_next_byte << 8) + (channel->swd_id & 0xFF)));
    return ptr_next_byte + 1;
}
