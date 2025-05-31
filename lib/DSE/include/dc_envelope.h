#ifndef PMDSKY_DC_ENVELOPE_H
#define PMDSKY_DC_ENVELOPE_H

#define ENVELOPE_STATE_OFF          ((u8)0x00)
#define ENVELOPE_STATE_CONST        ((u8)0x01)
#define ENVELOPE_STATE_DONE         ((u8)0x02)
#define ENVELOPE_STATE_ATTACK       ((u8)0x03)
#define ENVELOPE_STATE_HOLD         ((u8)0x04)
#define ENVELOPE_STATE_DECAY        ((u8)0x05)
#define ENVELOPE_STATE_SUSTAIN      ((u8)0x06)
#define ENVELOPE_STATE_RELEASE      ((u8)0x07)
#define ENVELOPE_STATE_RELEASE_END  ((u8)0x08)

struct sound_envelope_parameters
{
    u8 use_envelope;
    u8 slide_time_multiplier;
    u16 unknown;
    u32 unknown_2;
    //+0x08
    u8 attack_begin;
    u8 attack_time;
    u8 decay_time;
    u8 sustain_level;
    u8 hold_time;
    u8 sustain_time;
    u8 release_time;
    u8 unknown_3;
    //+0x10
};

struct sound_envelope
{
    struct sound_envelope_parameters parameters;
    //+0x10
    s32 current_volume;
    s32 volume_delta;
    s32 ticks_left;
    u8 state;
    u8 target_volume;
    u8 update_volume;
    //+0x20
};

struct driver_work {
    u8 fill0[0x27];
    s16 usec_per_sound_driver_tick;
    u8 fill1[0x6c8];
    void* heap_start;
    void* heap_end;
    void* heap_size;
};

extern struct driver_work DRIVER_WORK;

void SoundEnvelope_Reset(struct sound_envelope *envelope);
void SoundEnvelopeParameters_Reset(struct sound_envelope_parameters *parameters);
void SoundEnvelopeParameters_CheckValidity(struct sound_envelope_parameters *parameters);
void SoundEnvelope_SetParameters(struct sound_envelope *envelope, struct sound_envelope_parameters *parameters);
void SoundEnvelope_SetSlide(struct sound_envelope *envelope, s32 target_volume, s32 msec_tab_index);
void UpdateTrackVolumeEnvelopes(struct sound_envelope *envelope);
void SoundEnvelope_Release(struct sound_envelope *envelope);
void SoundEnvelope_Stop(struct sound_envelope *envelope);
void SoundEnvelope_ForceVolume(struct sound_envelope *envelope, s32 volume);
void SoundEnvelope_Stop2(struct sound_envelope *envelope);
s8 SoundEnvelope_Tick(struct sound_envelope *envelope);

#endif //PMDSKY_DC_ENVELOPE_H
