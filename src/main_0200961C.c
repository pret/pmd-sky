#include "main_0200961C.h"

extern void GX_DisableBankForBG();
extern void GX_DisableBankForBGExtPltt();
extern void GX_DisableBankForOBJ();
extern void GX_DisableBankForOBJExtPltt();
extern void GX_DisableBankForSubBG();
extern void GX_DisableBankForSubBGExtPltt();
extern void GX_DisableBankForSubOBJ();
extern void GX_DisableBankForTex();
extern void GX_DisableBankForTexPltt();

void sub_0200961C(void)
{
    GX_DisableBankForBG();
    GX_DisableBankForOBJ();
    GX_DisableBankForBGExtPltt();
    GX_DisableBankForOBJExtPltt();
    GX_DisableBankForTex();
    GX_DisableBankForTexPltt();
    GX_DisableBankForSubBG();
    GX_DisableBankForSubOBJ();
    GX_DisableBankForSubBGExtPltt();
}
