#include "dc_lfo_2.h"

extern s32 SoundUtil_GetRandomNumber();

void SoundLfoBank_SetConstEnvelopes(struct dse_lfo_bank *lfo_bank, s8 level)
{
    struct dse_lfo *lfo;

    lfo = lfo_bank->lfo_list;

    while (lfo != NULL)
    {
        if (lfo->type == SOUND_LFO_TYPE_CONST_ENVELOPE)
        {
            lfo->envelope_level = (((s32)level << 8) / 127 * 0x10000);
        }
        lfo = lfo->next;
    }
}

u16 SoundLfoBank_Tick(struct dse_lfo_bank *lfo_bank)
{
    s32 output;
    struct dse_lfo *lfo;
    u16 new_flags;

    new_flags = 0;

    //Clear all outputs
    *(u32 *)(&lfo_bank->outputs[0]) = 0;
    *(u32 *)(&lfo_bank->outputs[2]) = 0;
    *(u32 *)(&lfo_bank->outputs[4]) = 0;

    for (lfo = lfo_bank->lfo_list; lfo != NULL; lfo = lfo->next)
    {
        if (lfo->ticks_until_lfo_started != 0)
        {
            lfo->ticks_until_lfo_started--;
        }
        else
        {
            u32 envelope_level;

            output = ((*lfo->waveform_callback)(lfo) >> 8);

            if (lfo->lfo_envelope_ticks_left != 0)
            {
                lfo->lfo_envelope_ticks_left--;

                if (lfo->lfo_envelope_ticks_left != 0)
                {
                    lfo->envelope_level += lfo->envelope_delta;
                }
                else
                {
                    lfo->envelope_level = 0x1000000;
                }
            }

            envelope_level = (u32)lfo->envelope_level;

            envelope_level = output * (envelope_level >> 8);

            *lfo->output_ptr += ((s32) envelope_level >> 16);

            new_flags |= lfo->voice_update_flags;
        }
    }
    return new_flags;
}

s32 SoundLfoWave_InvalidFunc(struct dse_lfo *lfo)
{
    lfo->phase_flags = 0;
    lfo->type = SOUND_LFO_TYPE_INVALID;
    return 0;
}

s32 SoundLfoWave_HalfSquareFunc(struct dse_lfo *lfo)
{
    s32 new_output;

    /* square: 0 to amplitude */
    if (lfo->ticks_until_phase_change == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;

        if (lfo->current_output != 0)
        {
            new_output = 0;
        }
        else
        {
            new_output = lfo->amplitude;
        }
        lfo->current_output = new_output;
    }

    lfo->ticks_until_phase_change--;

    return lfo->current_output;
}

s32 SoundLfoWave_FullSquareFunc(struct dse_lfo *lfo)
{
    s32 new_output;

    /* square: switch between amplitude and -amplitude */
    if (lfo->ticks_until_phase_change == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;

        if ((lfo->phase_flags & 2) != 0)
        {
            new_output = -lfo->amplitude;
        }
        else
        {
            new_output = lfo->amplitude;
        }
        lfo->current_output = new_output;
        lfo->phase_flags ^= 2;
    }
    lfo->ticks_until_phase_change--;
    return lfo->current_output;
}

s32 SoundLfoWave_HalfTriangleFunc(struct dse_lfo *lfo)
{
    u8 flags;

    if (lfo->ticks_until_phase_change == 0)
    {
        flags = lfo->phase_flags;
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;

        if ((flags & 1) != 0)
        {
            lfo->output_delta = -lfo->output_delta;
        }
        lfo->phase_flags = (u8)(flags | 0x1);
    }

    lfo->ticks_until_phase_change--;
    lfo->current_output += lfo->output_delta;

    return lfo->current_output;
}

s32 SoundLfoWave_FullTriangleFunc(struct dse_lfo *lfo)
{
    s32 new_output;
    u16 ticks_left;
    u8 flags;

    ticks_left = lfo->ticks_until_phase_change;
    if (ticks_left == 0)
    {
        ticks_left = lfo->ticks_per_phase_change;
        flags = lfo->phase_flags;
        if ((flags & 1) != 0)
        {
            lfo->output_delta = -lfo->output_delta;
        }
        else
        {
            ticks_left /= 2;
            if (ticks_left < 1)
            {
                ticks_left = 1;
            }
        }
        lfo->phase_flags = (u8)(flags | 0x1);
    }
    lfo->ticks_until_phase_change = (u16)(ticks_left - 1u);
    new_output = lfo->current_output + lfo->output_delta;
    lfo->current_output = new_output;
    return new_output;
}

s32 SoundLfoWave_SawFunc(struct dse_lfo *lfo)
{
    u16 ticks_left;

    ticks_left = lfo->ticks_until_phase_change;
    if (ticks_left == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;
        lfo->current_output = 0;
    }
    else
    {
        lfo->current_output += lfo->output_delta;
    }

    lfo->ticks_until_phase_change--;
    return lfo->current_output;
}

s32 SoundLfoWave_ReverseSawFunc(struct dse_lfo *lfo)
{
    s32 new_output;

    if (lfo->ticks_until_phase_change == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;
        new_output = lfo->amplitude;
    }
    else
    {
        new_output = lfo->current_output - lfo->output_delta;
    }
    lfo->current_output = new_output;
    lfo->ticks_until_phase_change--;
    return lfo->current_output;
}

s32 SoundLfoWave_HalfNoiseFunc(struct dse_lfo *lfo)
{
    s32 random;

    if (lfo->ticks_until_phase_change == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;
        random = SoundUtil_GetRandomNumber();
        lfo->current_output = (s32)((lfo->amplitude >> 0x10) * random);
    }
    lfo->ticks_until_phase_change--;
    return lfo->current_output;
}

s32 SoundLfoWave_FullNoiseFunc(struct dse_lfo *lfo)
{
    s32 random;
    s32 amplitude;

    if (lfo->ticks_until_phase_change == 0)
    {
        lfo->ticks_until_phase_change = lfo->ticks_per_phase_change;
        amplitude = lfo->amplitude;
        random = SoundUtil_GetRandomNumber();
        lfo->current_output = (s32)((amplitude >> 0xf) * random - (amplitude >> 1));
    }
    lfo->ticks_until_phase_change--;
    return lfo->current_output;
}
