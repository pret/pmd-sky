#include <nitro/gx/g3_util.h>
#include <nitro.h>


void G3i_OrthoW_ (fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, fx32 scaleW, BOOL draw, MtxFx44 *mtx)
{
	MtxFx44 tmp[1];

	if (mtx == NULL) {
		mtx = tmp;
	}

	MTX_OrthoW(t, b, l, r, n, f, scaleW, mtx);

	if (draw) {
		G3_MtxMode(GX_MTXMODE_PROJECTION);
		G3_LoadMtx44(mtx);
	}
}

void G3i_LookAt_ (const VecFx32 *camPos, const VecFx32 *camUp, const VecFx32 *target, BOOL draw, MtxFx43 *mtx)
{
	MtxFx43 tmp[1];

	if (mtx == NULL) {
		mtx = tmp;
	}

	MTX_LookAt(camPos, camUp, target, mtx);

	if (draw) {
		G3_MtxMode(GX_MTXMODE_POSITION_VECTOR);
		G3_LoadMtx43(mtx);
	}
}
