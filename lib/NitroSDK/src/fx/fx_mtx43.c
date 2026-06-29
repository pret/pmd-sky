#include <nitro.h>
#include <nitro/fx/fx_mtx43.h>
#include <nitro/fx/fx_vec.h>

void MTX_LookAt (const VecFx32 *camPos, const VecFx32 *camUp, const VecFx32 *target, MtxFx43 *mtx)
{
	VecFx32 vLook, vRight, vUp;

	SDK_NULL_ASSERT(camPos);
	SDK_NULL_ASSERT(camUp);
	SDK_NULL_ASSERT(target);
	SDK_NULL_ASSERT(mtx);

	vLook.x = camPos->x - target->x;
	vLook.y = camPos->y - target->y;
	vLook.z = camPos->z - target->z;

	VEC_Normalize(&vLook, &vLook);
	VEC_CrossProduct(camUp, &vLook, &vRight);
	VEC_Normalize(&vRight, &vRight);
	VEC_CrossProduct(&vLook, &vRight, &vUp);

	mtx->_00 = vRight.x;
	mtx->_01 = vUp.x;
	mtx->_02 = vLook.x;
	mtx->_10 = vRight.y;
	mtx->_11 = vUp.y;
	mtx->_12 = vLook.y;
	mtx->_20 = vRight.z;
	mtx->_21 = vUp.z;
	mtx->_22 = vLook.z;
	mtx->_30 = -VEC_DotProduct(camPos, &vRight);
	mtx->_31 = -VEC_DotProduct(camPos, &vUp);
	mtx->_32 = -VEC_DotProduct(camPos, &vLook);
}

