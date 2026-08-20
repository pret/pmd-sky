#include "main_020721B0.h"

u8* DseTrackEvent_SetUnknown2(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->field_0x56 = (ptr_next_byte[0] << 8) + ptr_next_byte[1];
    ptr_next_byte += 2;
    return ptr_next_byte;
}

u8* DseTrackEvent_SetKeyBendRange(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->bend_sensitivity_override = *ptr_next_byte++;
    return ptr_next_byte;
}
