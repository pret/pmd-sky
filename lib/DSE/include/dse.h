#ifndef PMDSKY_DSE_H
#define PMDSKY_DSE_H

#include "file.h"
#include "thread.h"

struct dse_fade {
    s32 current;
    s32 delta;
    s32 target;
    u16 ticks_remaining;
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
    u8* output_ptr;
    u8* waveform_callback;
    struct dse_lfo* next;
};

struct dse_lfo_bank {
    s16 outputs[6];
    struct dse_lfo* lfo_list;
    struct dse_lfo lfos[4];
};

struct dse_sub_loop {
    u8* start;
    u8* end;
    u8 count;
    u8 octave;
    u8 field4_0xa;
    u8 field5_0xb;
};

struct sound_envelope_parameters {
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

struct sound_envelope {
    struct sound_envelope_parameters parameters;
    s32 current_volume;
    s32 volume_delta;
    s32 ticks_left;
    u8 state;
    u8 target_volume;
    u8 update_volume;
};

struct dse_track {
    u16 field_0x0;
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
    struct dse_channel* channel;
    u8 field_0x58;
    u8 field_0x59;
    u8 field_0x5a;
    u8 field_0x5b;
};

struct dse_sample {
    u8 field_0x0[3];
    u8 sample_format;
    u8 field_0x4[5];
    u8 psg_duty;
    u8 field_0xA[10];
    void* sample_pcm_data;
    s32 sample_loop_start;
    s32 sample_size;
};

struct dse_voice {
    u32 allocated_sequence_id;
    u16 note_off_flag;
    u16 update_flags;
    u16 hw_voice_index;
    u16 hw_voice_bit;
    u8 field_0xC;
    u8 current_note_number;
    s8 wave_index;
    u8 key_bend_sensitivity;
    s16 key_bend;
    u16 note_key;
    s16 key_base;
    u8 note_volume;
    u8 wave_pan;
    u16 channel_and_keygroup;
    u16 field_0x1C;
    struct dse_sample sample;
    struct sound_envelope envelope;
    struct dse_lfo_bank lfo_bank;
    s32 timer;
    s32 volume;
    s32 pan;
    u32 field_0x148;
    u8 envelope_volume;
    u8 field_0x14D[7];
    struct dse_voice* next_in_channel_allocation_list;
    struct dse_channel* channel_allocation;
};

struct dse_lfo_settings {
    u8 field_0x0;
    u8 type;
    u8 output_type;
    u8 lfo_waveform_index;
    s32 amplitude;
    u16 lfo_phase_change_msec;
    u16 msec_until_lfo_started;
    u16 lfo_envelope_len_msec;
};

struct dse_wavebank {
    void* file;
    u16 id;
    u16 mainbank_id;
    s16 num_waves;
    u16 num_instruments;
    u8 num_keygroups;
    u8 sample_container_kind;
    u16 field_0xE;

    void* wavi_chunk_location;
    void* prgi_chunk_location;
    void* kgrp_chunk_location;
    void* pcmd_chunk_location;

    u32 pcm_data_size;

    struct dse_wavebank* next;
};

struct dse_channel {
    u32 sequence_id;
    u8 channel_flags;
    u8 channel_index;
    u8 field_0x6;
    u8 field_0x7;
    u8 field_0x8;
    s8 total_num_voices;
    u16 bend_jitter_amplitude;
    u8 note_random_region_begin;
    u8 note_random_region_end;
    u16 swd_id;
    u16 selected_instrument_index;
    s16 field_0x12;
    s16 field_0x14;
    u16 bend_final;
    u16 volume_final;
    s16 pan_final;
    struct dse_fade bend;
    struct dse_fade volume;
    struct dse_fade pan;
    u32 field_0x4C;
    u8 expression;
    u8 lfo_amplitude;
    s16 key_bend;
    s16 tuning;
    s16 field_0x56;
    u8 optional_volume;
    u8 bend_sensitivity_override;
    u8 field_0x5A[10];
    struct sound_envelope_parameters envelope_override;
    struct dse_lfo_settings lfo_settings[4];
    struct dse_voice* voice_list;
    struct dse_note_list* held_notes_list;
    struct dse_wavebank* wavebank;
    struct dse_instrument* instrument;
    struct dse_synth* container;
};

struct dse_instrument_split {
    u8 field_0x0;
    u8 index;
    u8 bend_sensitivity;
    u8 field_0x3;
    u8 min_note_num;
    u8 max_note_num;
    u8 field_0x6;
    u8 field_0x7;
    u8 min_note_volume;
    u8 max_note_volume;
    u8 field_0xC[8];
    s16 wave_index;
    s16 key_base;
    u8 field_0x16;
    s8 note_delta;
    u8 volume;
    u8 pan;
    u8 keygroup_index;
    u8 field_0x1B[5];

    struct sound_envelope_parameters envelope_params;
};

struct dse_instrument {
    u16 field_0x0;
    u8 num_splits;
    u8 field_0x3;
    u8 volume;
    u8 field_0x5[11];

    struct dse_lfo_settings lfo_settings;
    u8 field_0x20[16];

    struct dse_instrument_split splits[];
};

struct dse_synth {
    u8 field_0x0;
    u8 num_channels;
    s8 global_volume;
    s8 global_volume_index;
    s16 bend;
    s8 volume;
    s8 pan;
    s8 song_and_global_volume;
    u8 clear_volume_and_timer;
    u8 field_0xA;
    u8 num_voices;
    struct dse_synth* next;
    struct dse_channel channels[16]; /* flexible */
};

struct dse_note_parameters {
    u8 field_0x0;
    u8 channel_idx;
    u8 key;
    u8 volume;
};

struct dse_note_list {
    struct dse_note_parameters parameters;
    s32 duration;
    struct dse_note_list* next;
};

struct dse_sequence_unk_0x0 {
    s8 initialized;
    s8 is_stopped;
    s8 restart;
    u8 has_looped;
};

struct dse_sequence_unk_0x4 {
    s8 is_playing;
    s8 field_0x1;
    s8 field_0x2;
    s8 field_0x3;
};

struct dse_sequence_unk_0x8 {
    s8 field_0x0;
    s8 field_0x1;
    s8 field_0x2;
    u8 field_0x3;
};

struct dse_sequence {
    struct dse_sequence_unk_0x0 field_0x0;
    struct dse_sequence_unk_0x4 field_0x4;
    struct dse_sequence_unk_0x8 field_0x8;
    u8 active_fades_flags;
    u8 num_tracks_playing;
    s8 num_tracks;
    s8 num_tracks_2;
    s8 num_channels;
    u8 field_0x11;
    u8 field_0x12;
    u8 global_volume_index;
    u8 effect_id;
    u8 seq_ticks_per_eighth_beat;
    u8 field_0x16;
    u8 bpm;
    u8 field_0x18;
    u8 field_0x19;
    s16 ticks_until_update;
    u8* file;
    u8* field_0x20;
    struct dse_synth* synth;
    s32 id;
    u16 field_0x2C;
    u16 field_0x2E;
    s32 total_driver_ticks_at_reset;
    s32 field_0x34;
    s32 seq_tick_counter;
    s32 time_since_last_seq_tick;
    s32 beatsplit_times_ticktime;
    s32 microseconds_per_beat; /* us per 256 ticks */
    struct dse_fade tempo;
    struct dse_fade bend;
    struct dse_fade volume;
    struct dse_fade pan;
    u8 field_0x88[16];
    s8 volume_fade_target;
    u8 field_0x99[3];
    void (*signal_callback)(u32, u32, u32, void*);
    void* callback_arg;
    struct dse_sequence* next;
    struct dse_track tracks[16];
};

struct dse_note {
    u8 is_note_on;
    u8 is_held;
    u8 note_number;
    s8 volume;
    s32 duration;
};

struct dse_note_list_node {
    struct dse_note note;
    struct dse_note_list_node* next;
};

struct dse_se_bank {
    void* file;
    s16 field_0x4;
    u16 id;
    struct dse_se_bank* next;
    void* seq_location;
    void* mcrl_location;
    void* bnkl_location;

    u8 field_0x18[4];
};

struct dse_heap_allocator {
    void* allocate_fun;
    void* free_fun;
    void* arg;
};

struct dse_mainbank {
    u16 id;
    u16 num_wavi;
    u32 pcm_data_offset;
    void* wavi_data;
    u32 field_0xC;
    u32 field_0x10;

    struct file_stream file;

    struct dse_mainbank* next;
};

struct dse_driver_work {
    s8 initialized;
    u8 stopped;
    u16 unknown_0x2;
    s32 error_code;
    u32 error_data;
    u32 error_data2;
    s32 error2_code;
    u32 error2_data;
    u32 error2_data2;
    void* error_callback;
    void* error2_callback;
    u32 field_0x24;
    s16 microseconds_per_driver_tick;
    u16 field_0x2A;
    s32 total_driver_ticks;
    s32 driver_tick_rate;
    u32 current_rng_seed;
    u8 field_0x38;
    u8 field_0x39;
    u8 last_se_bank_num_sequences;
    u8 last_se_bank_tracks_per_sequence;
    u8 field_0x3C;
    s8 field_0x3D;
    u16 field_0x3E;
    u8 global_volumes[16];
    struct dse_note_list_node notes[128];
    struct dse_note_list_node* free_notes_list;
    u32 field_0x654;
    struct dse_synth* synth_list;
    u32 field_0x65C;
    struct dse_wavebank* loaded_wavebanks_list;
    struct dse_sequence* bgm_sequences_list;
    struct dse_sequence* se_sequences_list;
    struct dse_se_bank* loaded_effect_banks;
    u8 field_0x670[132];
    void* heap_node_list;
    void* heap_end;
    s32 heap_size;
    struct dse_heap_allocator heap_allocator;
    u8 field_0x70C[36];
    s16 num_voices;
    u16 active_voices_bits;
    u16 start_voices_bits;
    u16 deactivate_voices_bits;
    u16 deallocate_voices_bits;
    u16 field_0x73C;

    struct dse_voice voices[16];

    u16 field_0x1CFC;
    u16 field_0x1CFE;
    s32 num_active_voices;
    s32 prev_nom_active_voices;
    s32 ticks_until_num_active_voices_timeout;
    u32 microseconds_per_driver_tick_2;
    u32 field_1D10;
    u32 field_1D14;

    struct thread driver_thread;
    void* driver_stack;

    u32 field_0x1DDC;
    struct dse_mainbank* loaded_mainbanks;
    s32 mainbank_max_read_size;
    void* mainbank_read_callback;
    void* mainbank_read_callback_param;

    u8 loader_thread_priority;
    u8 field_0x1DF1;
    s8 quit_sample_loader;
    s8 is_sample_loader_sleeping;
    struct thread sample_loader_thread;
    void* sample_loader_thread_stack;
    struct dse_wavebank* loading_bank;
    void* loading_bank_pcm_data;
};

#endif //PMDSKY_DSE_H
