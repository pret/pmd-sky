#ifndef PMDSKY_DC_LFO_2_H
#define PMDSKY_DC_LFO_2_H

#include "dc_lfo.h"

void SoundLfoBankSetConstEnvelopes(struct dse_lfo_bank *lfo_bank, s8 level);
u16 SoundLfoBankTick(struct dse_lfo_bank *lfo_bank);

//Waveform callbacks
s32 SoundLfoWaveInvalidFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveHalfSquareFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveFullSquareFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveHalfTriangleFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveFullTriangleFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveSawFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveReverseSawFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveHalfNoiseFunc(struct dse_lfo *lfo);
s32 SoundLfoWaveFullNoiseFunc(struct dse_lfo *lfo);

#endif //PMDSKY_DC_LFO_2_H
