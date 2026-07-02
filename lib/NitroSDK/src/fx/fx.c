#include <nitro.h>

void FX_Init(void)
{
	SDK_ASSERT(2 == sizeof(fx16));
	SDK_ASSERT(4 == sizeof(fx32));
	SDK_ASSERT(8 == sizeof(fx64));
	SDK_ASSERT(8 == sizeof(fx64c));
	SDK_ASSERT(6 == sizeof(VecFx16));
	SDK_ASSERT(12 == sizeof(VecFx32));

	SDK_ASSERT(64 == sizeof(MtxFx44));
	SDK_ASSERT(48 == sizeof(MtxFx43));
	SDK_ASSERT(36 == sizeof(MtxFx33));
	SDK_ASSERT(16 == sizeof(MtxFx22));

}
