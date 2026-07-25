#include "main_02071BF4.h"
#include "dc_envelope.h"

#define IME (*(vu16*)0x4000208)

extern struct dse_driver_work DRIVER_WORK;

extern u32 DseChannel_SetInstrument(struct dse_channel *channel, u16 instrument_index);
extern void DseChannel_SetLfoConstEnvelopeLevel(struct dse_channel *channel, s8 envelope_level);
void DseChannel_SetBank(struct dse_channel*, u16); 
extern void DseVoice_ReleaseHeld(struct dse_channel *);
extern u32 _u32_div_f(u32 dividend, u32 divisor);
extern u32 _s32_div_f(s32 dividend, s32 divisor);

u8* DseTrackEvent_SetBankLsb(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    DseChannel_SetBank(channel, (u16) ((channel->swd_id & ~0xFF) + *ptr_next_byte));
    return ptr_next_byte + 1;
}

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

u8* DseTrackEvent_RestoreEnvelopeDefaults(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    SoundEnvelopeParameters_Reset(&channel->envelope_override);
    return ptr_next_byte;
}

u8* DseTrackEvent_SetEnvelopeAttackBegin(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->envelope_override.attack_begin = *ptr_next_byte;
    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetEnvelopeAttackTime(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->envelope_override.attack_time = *ptr_next_byte;
    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetEnvelopeHoldTime(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->envelope_override.hold_time = *ptr_next_byte;
    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{

    if(ptr_next_byte[0] != 0xFF) channel->envelope_override.decay_time = ptr_next_byte[0];
    if(ptr_next_byte[1] != 0xFF) channel->envelope_override.sustain_level = ptr_next_byte[1];

    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 2;
}

u8* DseTrackEvent_SetEnvelopeSustainTime(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->envelope_override.sustain_time = *ptr_next_byte;
    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetEnvelopeReleaseTime(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->envelope_override.release_time = *ptr_next_byte;
    SoundEnvelopeParameters_CheckValidity(&channel->envelope_override);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetNoteDurationMultiplier(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{ 
    track->note_duration_multiplier = ptr_next_byte[0];
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_ForceLfoEnvelopeLevel(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    DseChannel_SetLfoConstEnvelopeLevel(channel, (s8)ptr_next_byte[0]);
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetHoldNotes(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{

    struct dse_channel* track_channel = track->channel;
    
    if ((u32) *ptr_next_byte >= 0x40) {
        track_channel->channel_flags |= 1;
    } else {
        track_channel->channel_flags &= ~1;
        DseVoice_ReleaseHeld(track_channel);
    }
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_SetFlagBit1Unknown(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    channel->channel_flags |= 2;
    return ptr_next_byte;

}

u8* DseTrackEvent_SetOptionalVolume(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{

    channel->optional_volume = ptr_next_byte[0];
    return ptr_next_byte + 1;
}

u8* DseTrackEvent_Dummy2Bytes(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    return ptr_next_byte + 2;
}

u8* DseTrackEvent_SetTuning(u8 *ptr_next_byte, struct dse_sequence *sequence, struct dse_track *track, struct dse_channel *channel)
{
    s16 tune = *(s8*)ptr_next_byte<<8;
    channel->tuning = tune;

    channel->bend_final = tune + (s16)(channel->bend.current >> 0x10) + channel->container->bend;
    u16 old_ime = IME;
    IME = 0;
    struct dse_voice *voice = channel->voice_list;
    if(voice) {
        do {
            voice->update_flags = voice->update_flags | 0x10;
            voice = voice->next_in_channel_allocation_list;
        } while(voice);
    }
    u16 unused = IME;
    IME = old_ime;
    return ptr_next_byte + 1;
}
