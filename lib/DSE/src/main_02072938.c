#include "main_02072938.h"

u8* DseTrackEvent_UseLfo(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 idx = ptr_next_byte[0];
    u8 type = ptr_next_byte[1];
    u8 out = ptr_next_byte[2];
    struct dse_lfo_settings *lfo = &channel->lfo_settings[idx];

    channel->field_0x5A[7] = idx;
    if (type == 2) {
        type = 1;
    }
    lfo->type = type;
    lfo->output_type = out;
    ptr_next_byte += 3;
    return ptr_next_byte;
}
