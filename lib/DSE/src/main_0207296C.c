#include "main_0207296C.h"

u8* DseTrackEvent_Signal(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    u8 v = *ptr_next_byte;

    sequence->field_0x16 = v;
    sequence->signal_callback(sequence->id, 8, v, sequence->callback_arg);
    return ptr_next_byte + 1;
}
