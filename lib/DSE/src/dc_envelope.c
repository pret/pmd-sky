#include "dc_envelope.h"

extern u16 MUSIC_DURATION_LOOKUP_TABLE_1[128];
extern u32 MUSIC_DURATION_LOOKUP_TABLE_2[128];

void SoundEnvelope_Reset(struct sound_envelope *envelope)
{
    envelope->parameters.use_envelope = 0;
    envelope->state = ENVELOPE_STATE_OFF;
    envelope->current_volume = 0;
}

void SoundEnvelopeParameters_Reset(struct sound_envelope_parameters *parameters)
{
    /*
    parameters->use_envelope = 0;
    parameters->slide_time_multiplier = 0xff;
    parameters->unknown = 0xffff;
    parameters->unknown_2 = 0xffffffff;
    parameters->attack_begin = 0xff;
    parameters->attack_time = 0xff;
    parameters->decay_time = 0xff;
    parameters->sustain_level = 0xff;
    parameters->hold_time = 0xff;
    parameters->sustain_time = 0xff;
    parameters->release_time = 0xff;
    parameters->unknown_3 = 0xff;
    */
    ((u32 *)parameters)[0] = 0xffffff00;
    ((u32 *)parameters)[1] = 0xffffffff;
    ((u32 *)parameters)[2] = 0xffffffff;
    ((u32 *)parameters)[3] = 0xffffffff;
}

void SoundEnvelopeParameters_CheckValidity(struct sound_envelope_parameters *parameters)
{
    parameters->use_envelope = 1;

    if (parameters->slide_time_multiplier > 0x7f &&
        parameters->attack_begin > 0x7f &&
        parameters->attack_time > 0x7f &&
        parameters->decay_time > 0x7f &&
        parameters->sustain_level > 0x7f &&
        parameters->hold_time > 0x7f &&
        parameters->sustain_time > 0x7f &&
        parameters->release_time > 0x7f)
    {
        parameters->use_envelope = 0;
    }
}

void SoundEnvelope_SetParameters(struct sound_envelope *envelope, struct sound_envelope_parameters *parameters)
{
    if (parameters->slide_time_multiplier <= 0x7f)
    {
        envelope->parameters.slide_time_multiplier = parameters->slide_time_multiplier;
    }
    if (parameters->attack_begin <= 0x7f)
    {
        envelope->parameters.attack_begin = parameters->attack_begin;
    }
    if (parameters->attack_time <= 0x7f)
    {
        envelope->parameters.attack_time = parameters->attack_time;
    }
    if (parameters->decay_time <= 0x7f)
    {
        envelope->parameters.decay_time = parameters->decay_time;
    }
    if (parameters->sustain_level <= 0x7f)
    {
        envelope->parameters.sustain_level = parameters->sustain_level;
    }
    if (parameters->hold_time <= 0x7f)
    {
        envelope->parameters.hold_time = parameters->hold_time;
    }
    if (parameters->sustain_time <= 0x7f)
    {
        envelope->parameters.sustain_time = parameters->sustain_time;
    }
    if (parameters->release_time <= 0x7f)
    {
        envelope->parameters.release_time = parameters->release_time;
    }
}

void SoundEnvelope_SetSlide(struct sound_envelope *envelope, s32 target_volume, s32 msec_tab_index)
{
    u8 slide_time_multiplier;

    if (msec_tab_index == 0x7f)
    {
        envelope->volume_delta = 0;
        envelope->ticks_left = 0x7fffffff;
        return;
    }

    envelope->target_volume = (u8)target_volume;

    slide_time_multiplier = envelope->parameters.slide_time_multiplier;

    if (slide_time_multiplier == 0)
    {
        envelope->ticks_left = MUSIC_DURATION_LOOKUP_TABLE_2[msec_tab_index] * 1000 / DRIVER_WORK.usec_per_sound_driver_tick;
    }
    else
    {
        envelope->ticks_left = slide_time_multiplier * MUSIC_DURATION_LOOKUP_TABLE_1[msec_tab_index] * 1000 / DRIVER_WORK.usec_per_sound_driver_tick;
    }

    if (envelope->ticks_left != 0)
    {
        envelope->volume_delta = ((target_volume << 23) - envelope->current_volume) / envelope->ticks_left;
    }
    else
    {
        envelope->volume_delta = 0;
    }
}

void UpdateTrackVolumeEnvelopes(struct sound_envelope *envelope)
{
    if (envelope->parameters.use_envelope)
    {
        if (envelope->parameters.attack_time != 0)
        {
            envelope->current_volume = envelope->parameters.attack_begin << 23;
            envelope->state = ENVELOPE_STATE_ATTACK;
            SoundEnvelope_SetSlide(envelope, 0x7f, envelope->parameters.attack_time);
        }
        else
        {
            envelope->current_volume = 0x3f800000;

            if (envelope->parameters.hold_time != 0)
            {
                SoundEnvelope_SetSlide(envelope, 0x7f, envelope->parameters.hold_time);
                envelope->state = ENVELOPE_STATE_HOLD;
            }
            else if (envelope->parameters.decay_time != 0)
            {
                SoundEnvelope_SetSlide(envelope, (s8)envelope->parameters.sustain_level, envelope->parameters.decay_time);

                envelope->state = ENVELOPE_STATE_DECAY;
            }
            else
            {
                //Do not set volume to sustain level?
                SoundEnvelope_SetSlide(envelope, 0, envelope->parameters.sustain_time);
                envelope->state = ENVELOPE_STATE_SUSTAIN;
            }
        }

        envelope->update_volume = 1;
    }
    else
    {
        if (envelope->state == ENVELOPE_STATE_CONST)
            return;

        envelope->state = ENVELOPE_STATE_OFF;
        envelope->current_volume = 0x3f800000;
    }
}

void SoundEnvelope_Release(struct sound_envelope *envelope)
{
    if (envelope->state == ENVELOPE_STATE_OFF)
        return;

    SoundEnvelope_SetSlide(envelope, 0, envelope->parameters.release_time);
    envelope->state = ENVELOPE_STATE_RELEASE;
}

void SoundEnvelope_Stop(struct sound_envelope *envelope)
{
    envelope->state = ENVELOPE_STATE_OFF;
    envelope->current_volume = 0;
    envelope->ticks_left = 0;
    envelope->update_volume = 0;
}

void SoundEnvelope_ForceVolume(struct sound_envelope *envelope, s32 volume)
{
    envelope->parameters.use_envelope = 0;
    envelope->state = ENVELOPE_STATE_CONST;
    envelope->current_volume = volume;
    envelope->ticks_left = 0;
    envelope->update_volume = 1;
}

void SoundEnvelope_Stop2(struct sound_envelope *envelope)
{
    envelope->state = ENVELOPE_STATE_OFF;
    envelope->current_volume = 0;
    envelope->ticks_left = 0;
    envelope->update_volume = 0;
}

s8 SoundEnvelope_Tick(struct sound_envelope *envelope)
{
    if (envelope->state > ENVELOPE_STATE_DONE) //OFF, CONST, DONE
    {
        if (envelope->ticks_left == 0)
        {
            envelope->current_volume = envelope->target_volume << 23;

            switch(envelope->state)
            {
                u8 hold_time, decay_time, sustain_time;

                case ENVELOPE_STATE_OFF:
                    break;
                case ENVELOPE_STATE_CONST:
                    break;
                case ENVELOPE_STATE_DONE:
                    break;
                case ENVELOPE_STATE_ATTACK:
                    hold_time = envelope->parameters.hold_time;
                    if (hold_time != 0)
                    {
                        SoundEnvelope_SetSlide(envelope, 0x7f, hold_time);
                        envelope->state = ENVELOPE_STATE_HOLD;
                        break;
                    }
                case ENVELOPE_STATE_HOLD:
                    decay_time = envelope->parameters.decay_time;
                    if (decay_time != 0)
                    {
                        SoundEnvelope_SetSlide(envelope, (s8)envelope->parameters.sustain_level, decay_time);
                        envelope->state = ENVELOPE_STATE_DECAY;
                        break;
                    }
                envelope->current_volume = envelope->parameters.sustain_level << 23;
                case ENVELOPE_STATE_DECAY:
                    sustain_time = envelope->parameters.sustain_time;
                    if (sustain_time != 0)
                    {
                        SoundEnvelope_SetSlide(envelope, 0, sustain_time);
                        envelope->state = ENVELOPE_STATE_SUSTAIN;
                        break;
                    }
                case ENVELOPE_STATE_SUSTAIN:
                    SoundEnvelope_SetSlide(envelope, 0, 0);
                    envelope->state = ENVELOPE_STATE_DONE;
                    break;
                case ENVELOPE_STATE_RELEASE:
                    envelope->state = ENVELOPE_STATE_RELEASE_END;
                    envelope->current_volume = 0;
                    envelope->ticks_left = 0;
                default:
                    break;
                }
        }
        else
        {
            s32 next_volume = envelope->current_volume + envelope->volume_delta;

            if (next_volume > 0x3fffffff)
            {
                next_volume = 0x3fffffff;
            }
            if (next_volume < 0)
            {
                next_volume = 0;
            }

            envelope->ticks_left--;
            envelope->current_volume = next_volume;
        }
    }

    return (s8)(envelope->current_volume >> 23);
}
