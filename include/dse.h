#ifndef PMDSKY_DSE_H
#define PMDSKY_DSE_H

struct dse_fade {
    s32 val;
    u32 delta;
    u32 target;
    u16 steps;
    u8 field4_0xe;
    u8 field5_0xf;
};

struct dse_lfo {
    u8 phase_flags;
    u8 type;
    u16 voice_update_flags;
    u16 ticks_per_phase_change;
    u16 ticks_until_phase_change;
    s32 current_output;
    s32 amplitude;
    u32 unk_0x10;
    s32 output_delta;
    u16 unk_0x18;
    u16 ticks_until_lfo_started;
    u16 unk_0x1c;
    u16 lfo_envelope_ticks_left;
    s32 envelope_level;
    s32 envelope_delta;
    u8 *output_ptr;
    u8 *waveform_callback;
    struct dse_lfo *next;
};

struct dse_lfo_bank {
    s16 outputs[6];
    struct dse_lfo *lfo_list;
    struct dse_lfo lfos[4];
};

struct dse_sub_loop {
    u8 *start;
    u8 *end;
    u8 count;
    u8 octave;
    u8 field4_0xa;
    u8 field5_0xb;
};

struct dse_sound_envelope_parameters {
    u8 use_envelope;
    u8 slide_time_multiplier;
    u16 unk_0x2;
    u32 unk_0x4;
    u8 attack_begin;
    u8 attack_time;
    u8 decay_time;
    u8 sustain_level;
    u8 hold_time;
    u8 sustain_time;
    u8 release_time;
    u8 unk_0xf;
};

struct dse_sound_envelope {
    struct dse_sound_envelope_parameters parameters;
    s32 current_volume;
    s32 volume_delta;
    s32 ticks_left;
    u8 state;
    u8 target_volume;
    u8 update_volume;
    u8 field7_0x1f;
};

struct dse_track {
    u16 field0_0x0;
    u8 is_playing;
    u8 field_0x3;
    u8 current_octave;
    u8 note_duration_multiplier;
    u8 loop_stack_index;
    u8 previous_note_number;
    u8 ignore_playnote;
    u8 field_0x9;
    u16 main_loop_count;
    u32 wait_ticks_left;
    u32 previous_wait_ticks;
    u32 previous_duration;
    u8* track_data_location;
    u8* position;
    u8* loop_start;
    struct dse_sub_loop loop_stack[4];
    struct dse_channel *channel;
    u8 field_0x58;
    u8 field_0x59;
    u8 field_0x5a;
    u8 field_0x5b;
};

struct dse_voice {
    u32 field0_0x0;
    u16 unk_flags_0x4;
    u16 unk_flags_0x6;
    u16 field3_0x8;
    u16 field4_0xa;
    u8 field5_0xc;
    u8 key; /* Created by retype action */
    u8 field7_0xe;
    u8 field8_0xf;
    u16 field9_0x10;
    u16 field10_0x12;
    s16 field11_0x14;
    u8 field12_0x16;
    u8 field13_0x17;
    u16 field14_0x18;
    u8 field15_0x1a;
    u8 field16_0x1b;
    u32 field17_0x1c;
    u32 field18_0x20;
    u32 field19_0x24;
    u32 field20_0x28;
    u32 field21_0x2c;
    u32 field22_0x30;
    u32 field23_0x34;
    u32 field24_0x38;
    struct dse_sound_envelope envelope;
    struct dse_lfo_bank lfo_bank;
    u8 field27_0x13c;
    u8 field28_0x13d;
    u8 field29_0x13e;
    u8 field30_0x13f;
    u8 field31_0x140;
    u8 field32_0x141;
    u8 field33_0x142;
    u8 field34_0x143;
    u8 field35_0x144;
    u8 field36_0x145;
    u8 field37_0x146;
    u8 field38_0x147;
    u8 field39_0x148;
    u8 field40_0x149;
    u8 field41_0x14a;
    u8 field42_0x14b;
    u32 field43_0x14c;
    u8 field44_0x150;
    u8 field45_0x151;
    u8 field46_0x152;
    u8 field47_0x153;
    struct dse_voice *next;
    struct dse_channel *channel;
};

struct dse_channel_unk_0x74dt {
    u8 field0_0x0;
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
    u32 field4_0x4;
    u16 field5_0x8;
    u16 field6_0xa;
    u16 field7_0xc;
    u8 field8_0xe;
    u8 field9_0xf;
};

struct dse_channel {
    u32 field0_0x0;
    u8 unk_flags_0x4;
    u8 field2_0x5;
    u8 field3_0x6;
    u8 field4_0x7;
    u8 field5_0x8;
    u8 field6_0x9;
    u16 jitter_range;
    u8 random_note_min;
    u8 random_note_max;
    u16 bank_id;
    u16 field11_0x10;
    u8 field12_0x12;
    u8 field13_0x13;
    u16 field14_0x14;
    u16 tune_final;
    u16 vol_final;
    u16 pan_final;
    struct dse_fade tune_fade;
    struct dse_fade vol_fade;
    struct dse_fade pan_fade;
    u8 field21_0x4c;
    u8 field22_0x4d;
    u8 field23_0x4e;
    u8 field24_0x4f;
    u8 expression;
    s8 field26_0x51;
    u16 field27_0x52;
    u16 field28_0x54;
    u16 field29_0x56;
    u8 opt_volume; /* Created by retype action */
    u8 bend_range; /* Created by retype action */
    u8 field32_0x5a;
    u8 field33_0x5b;
    u8 field34_0x5c;
    u8 field35_0x5d;
    u8 field36_0x5e;
    u8 field37_0x5f;
    u8 field38_0x60;
    u8 field39_0x61;
    u8 field40_0x62;
    u8 field41_0x63;
    struct dse_sound_envelope_parameters envelope;
    struct dse_channel_unk_0x74dt field43_0x74[4];
    struct dse_voice *voices;
    struct dse_note_node *notes;
    u32 field46_0xbc;
    u32 field47_0xc0;
    struct dse_synth *container;
};

struct dse_synth {
    u8 field0_0x0;
    u8 n_channels;
    u8 global_vol;
    u8 global_vol_idx;
    s16 bend;
    s8 vol;
    s8 pan;
    s8 combined_vol;
    u8 field8_0x9;
    u8 field9_0xa;
    u8 field10_0xb;
    struct dse_synth *next;
    struct dse_channel channels[16]; /* flexible */
};

struct dse_note_parameters {
    u8 field0_0x0;
    u8 channel_idx;
    u8 key;
    u8 volume;
};

struct dse_note_node {
    struct dse_note_parameters parameters;
    s32 duration;
    struct dse_note_node *next;
};

struct dse_seq_unk_0x0 {
    u8 field0_0x0;
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
};

struct dse_seq_unk_0x4 {
    u8 field0_0x0;
    s8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
};

struct dse_seq_unk_0x8 {
    s8 field0_0x0;
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
};

struct dse_seq {
    struct dse_seq_unk_0x0 field0_0x0;
    struct dse_seq_unk_0x4 field1_0x4;
    struct dse_seq_unk_0x8 field2_0x8;
    u8 unk_flags_0xc;
    u8 n_active_tracks;
    u8 field5_0xe;
    u8 n_tracks;
    u8 n_channels;
    u8 field8_0x11;
    u8 field9_0x12;
    u8 field10_0x13;
    u8 field11_0x14;
    u8 field12_0x15;
    u8 field13_0x16;
    u8 bpm;
    u8 field15_0x18;
    u8 field16_0x19;
    s16 field17_0x1a;
    u8 *seq_file;
    u8 *field19_0x20;
    struct dse_synth *synth;
    u32 id;
    u16 field22_0x2c;
    u8 field23_0x2e;
    u8 field24_0x2f;
    u32 field25_0x30;
    u32 field26_0x34;
    u32 field27_0x38;
    u32 field28_0x3c;
    u32 field29_0x40;
    s32 us_per_standard_qn; /* us per 256 ticks */
    struct dse_fade tpqn_fade;
    struct dse_fade bend_fade;
    struct dse_fade vol_fade;
    struct dse_fade pan_fade;
    u8 field35_0x88;
    u8 field36_0x89;
    u8 field37_0x8a;
    u8 field38_0x8b;
    u8 field39_0x8c;
    u8 field40_0x8d;
    u8 field41_0x8e;
    u8 field42_0x8f;
    u8 field43_0x90;
    u8 field44_0x91;
    u8 field45_0x92;
    u8 field46_0x93;
    u8 field47_0x94;
    u8 field48_0x95;
    u8 field49_0x96;
    u8 field50_0x97;
    s8 field51_0x98;
    u8 field52_0x99;
    u8 field53_0x9a;
    u8 field54_0x9b;
    void (*unk_callback)(u32, u32, u32, u32);
    u32 field56_0xa0;
    struct dse_seq *next;
    struct dse_track tracks[16];
};

#endif //PMDSKY_DSE_H
