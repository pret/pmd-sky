#include "main_02071BF4.h"

extern u32 DseChannel_SetInstrument(struct dse_channel *channel, u16 instrument_index);

u8* DseTrackEvent_SetInstrument(u8 *ptr_next_byte, struct dse_seq *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s32 iVar1;

    iVar1 = DseChannel_SetInstrument(channel,(u16)*ptr_next_byte);
    if (iVar1 < 0) {
        sequence->unk_callback(sequence->id,-0xcc,(u32)(u16)channel->bank_id * 0x10000 - iVar1,sequence->field56_0xa0);
    }
    return ptr_next_byte + 1;
}
