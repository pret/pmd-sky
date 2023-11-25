#ifndef PMDSKY_DC_LFO_H
#define PMDSKY_DC_LFO_H

#define SOUND_LFO_TYPE_INVALID        0
#define SOUND_LFO_TYPE_USE_ENVELOPE   1
#define SOUND_LFO_TYPE_CONST_ENVELOPE 3

struct dse_lfo;

typedef s32 (*sound_lfo_waveform_callback)(struct dse_lfo *lfo);

struct dse_lfo
{
    u8 phase_flags;
    u8 type;
    u16 voice_update_flags;
    u16 ticks_per_phase_change;
    u16 ticks_until_phase_change;
    s32 current_output;
    s32 amplitude;

    //+0x10
    u32 unknown;
    s32 output_delta;
    u16 unknown_2;
    u16 ticks_until_lfo_started;
    u16 unknown_3;
    u16 lfo_envelope_ticks_left;

    //+0x20
    s32 envelope_level;
    s32 envelope_delta;
    s16 *output_ptr;
    sound_lfo_waveform_callback waveform_callback;

    //+0x30
    struct dse_lfo *next;
    //+0x34
};

struct dse_lfo_bank
{
    s16 outputs[6];
    struct dse_lfo *lfo_list;

    //+0x10
    struct dse_lfo lfos[4]; //Size: 4 * 0x34 = 0xd0
    //+0xe0
};

void SoundLfoBank_Reset(struct dse_lfo_bank *lfo_bank);

#endif //PMDSKY_DC_LFO_H
