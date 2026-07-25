#ifndef PMDSKY_DC_ENVELOPE_H
#define PMDSKY_DC_ENVELOPE_H

#include "dse.h"

#define ENVELOPE_STATE_OFF          ((u8)0x00)
#define ENVELOPE_STATE_CONST        ((u8)0x01)
#define ENVELOPE_STATE_DONE         ((u8)0x02)
#define ENVELOPE_STATE_ATTACK       ((u8)0x03)
#define ENVELOPE_STATE_HOLD         ((u8)0x04)
#define ENVELOPE_STATE_DECAY        ((u8)0x05)
#define ENVELOPE_STATE_SUSTAIN      ((u8)0x06)
#define ENVELOPE_STATE_RELEASE      ((u8)0x07)
#define ENVELOPE_STATE_RELEASE_END  ((u8)0x08)

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
