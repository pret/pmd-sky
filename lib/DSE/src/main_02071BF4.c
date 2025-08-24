#include "main_02071BF4.h"

extern struct dse_driver_work DRIVER_WORK;

extern u32 DseChannel_SetInstrument(struct dse_channel *channel, u16 instrument_index);
extern u32 _u32_div_f(u32 dividend, u32 divisor);
extern u32 _s32_div_f(s32 dividend, s32 divisor);

u8* DseTrackEvent_Dummy1Byte(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetInstrument(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s32 iVar1;

    iVar1 = DseChannel_SetInstrument(channel,(u16)*ptr_next_byte);
    if (iVar1 < 0) {
        sequence->signal_callback(sequence->id,-0xcc,(u32)(u16)channel->swd_id * 0x10000 - iVar1,sequence->callback_arg);
    }
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SongVolumeFade(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s32 iVar2;
    u32 uVar3;
    u16 uVar4;

    uVar4 = (u32)*ptr_next_byte + (u32)ptr_next_byte[1] * 0x100 & 0xffff;
    if (uVar4 == 0) {
        uVar4 = 0;
    }
    else {
        uVar4 = _u32_div_f(uVar4 * 1000,DRIVER_WORK.microseconds_per_driver_tick);
        if (uVar4 == 0) {
            uVar4 = 1;
        }
    }
    iVar2 = (u32)ptr_next_byte[2] * 0x10000;
    (sequence->volume).target = iVar2;
    if (uVar4 == 0) {
        (sequence->volume).current = iVar2;
    }
    else {
        iVar2 = iVar2 - (sequence->volume).current;
        if (iVar2 == 0) {
            uVar4 = 0;
        }
        else {
            uVar3 = _s32_div_f(iVar2,uVar4);
            (sequence->volume).delta = uVar3;
        }
    }
    (sequence->volume).ticks_remaining = (short)uVar4;
    return ptr_next_byte + 3;
}
