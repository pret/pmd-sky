#include "dc_lfo.h"

void SoundLfoBank_Reset(struct dse_lfo_bank *lfo_bank)
{
    /*
    lfo_bank->outputs[0] = 0;
    lfo_bank->outputs[1] = 0;
    lfo_bank->outputs[2] = 0;
    lfo_bank->outputs[3] = 0;
    lfo_bank->outputs[4] = 0;
    lfo_bank->outputs[5] = 0;
    */

    *(u32 *)(&lfo_bank->outputs[0]) = 0;
    *(u32 *)(&lfo_bank->outputs[2]) = 0;
    *(u32 *)(&lfo_bank->outputs[4]) = 0;

    lfo_bank->lfo_list = NULL;
}
