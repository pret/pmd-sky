#include <nitro.h>
#include <nitro/fx/fx_mtx44.h>
#include <nitro/fx/fx_vec.h>
#include <nitro/fx/fx_cp.h>

#include <nitro/code32.h>

void MTX_OrthoW (fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, fx32 scaleW, MtxFx44 *mtx)
{
	fx64c inv1, inv2, inv3;

	SDK_NULL_ASSERT(mtx);
	SDK_ASSERTMSG(t != b, "G3_Ortho: 't' and 'b' clipping planes are equal.");
	SDK_ASSERTMSG(l != r, "G3_Ortho: 'l' and 'r' clipping planes are equal.");
	SDK_ASSERTMSG(n != f, "G3_Ortho: 'n' and 'f' clipping planes are equal.");

	SDK_MINMAX_ASSERT(f, -0x10000 * FX32_ONE, 0x10000 * FX32_ONE - 1);
	SDK_MINMAX_ASSERT(n, -0x10000 * FX32_ONE, 0x10000 * FX32_ONE - 1);

	{
		FX_InvAsync(r - l);
		mtx->_01 = 0;
		mtx->_02 = 0;
		mtx->_03 = 0;
		mtx->_10 = 0;
		mtx->_12 = 0;
		mtx->_13 = 0;
		mtx->_20 = 0;
		mtx->_21 = 0;
		mtx->_23 = 0;
		mtx->_33 = scaleW;
		inv1 = FX_GetInvResultFx64c();
	}
	{
		FX_InvAsyncImm(t - b);
		if (scaleW != FX32_ONE) {
			inv1 = (inv1 * scaleW) / FX32_ONE;
		}
		mtx->_00 = FX_Mul32x64c(FX32_ONE * 2, inv1);
		inv2 = FX_GetInvResultFx64c();
	}
	{
		FX_InvAsyncImm(n - f);
		if (scaleW != FX32_ONE) {
			inv2 = (inv2 * scaleW) / FX32_ONE;
		}
		mtx->_11 = FX_Mul32x64c(FX32_ONE * 2, inv2);
		inv3 = FX_GetInvResultFx64c();
	}

	if (scaleW != FX32_ONE) {
		inv3 = (inv3 * scaleW) / FX32_ONE;
	}
	mtx->_22 = FX_Mul32x64c(FX32_ONE * 2, inv3);
	mtx->_30 = FX_Mul32x64c(-r - l, inv1);
	mtx->_31 = FX_Mul32x64c(-t - b, inv2);
	mtx->_32 = FX_Mul32x64c(f + n, inv3);
}

#include <nitro/codereset.h>

