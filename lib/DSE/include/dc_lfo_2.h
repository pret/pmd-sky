#ifndef PMDSKY_DC_LFO_2_H
#define PMDSKY_DC_LFO_2_H

#include "dc_lfo.h"

void SoundLfoBank_SetConstEnvelopes(struct dse_lfo_bank *lfo_bank, s8 level);
u16 SoundLfoBank_Tick(struct dse_lfo_bank *lfo_bank);

//Waveform callbacks
s32 SoundLfoWave_InvalidFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_HalfSquareFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_FullSquareFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_HalfTriangleFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_FullTriangleFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_SawFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_ReverseSawFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_HalfNoiseFunc(struct dse_lfo *lfo);
s32 SoundLfoWave_FullNoiseFunc(struct dse_lfo *lfo);

#endif //PMDSKY_DC_LFO_2_H
