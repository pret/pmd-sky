#include <nitro.h>

typedef enum {
	G2_BLENDTYPE_NONE    = 0x0000,
	G2_BLENDTYPE_ALPHA   = 0x0040,
	G2_BLENDTYPE_FADEIN  = 0x0080,
	G2_BLENDTYPE_FADEOUT = 0x00c0
} G2_BLENDTYPE;

void G2x_SetBlendAlpha_ (u32 addr, int plane1, int plane2, int ev1, int ev2)
{
	SDK_MINMAX_ASSERT(plane1, 0, 0x20 - 1);
	SDK_MINMAX_ASSERT(plane2, 0, 0x40 - 1);
	SDK_MINMAX_ASSERT(ev1, 0, 31);
	SDK_MINMAX_ASSERT(ev2, 0, 31);

	*((vu32 *)addr + 0) = (u32)((G2_BLENDTYPE_ALPHA | plane1 | plane2 << 8) | ((ev1 | ev2 << 8) << 16));
}

void G2x_SetBlendBrightness_ (u32 addr, int plane, int brightness)
{
	SDK_MINMAX_ASSERT(brightness, -31, 31);
	SDK_MINMAX_ASSERT(plane, 0, 0x40 - 1);

	if (brightness < 0) {
		*((vu16 *)addr + 0) = (u16)(G2_BLENDTYPE_FADEOUT | plane);
		*((vu16 *)addr + 2) = (u16) - brightness;
	} else {
		*((vu16 *)addr + 0) = (u16)(G2_BLENDTYPE_FADEIN | plane);
		*((vu16 *)addr + 2) = (u16)brightness;
	}
}

void G2x_ChangeBlendBrightness_ (u32 addr, int brightness)
{
	u16 tmp;
	SDK_MINMAX_ASSERT(brightness, -31, 31);

	tmp = *((vu16 *)addr + 0);

	if (brightness < 0) {
		if (G2_BLENDTYPE_FADEIN == (tmp & REG_G2_BLDCNT_EFFECT_MASK)) {
			*((vu16 *)addr + 0) = (u16)((tmp & ~REG_G2_BLDCNT_EFFECT_MASK) | G2_BLENDTYPE_FADEOUT);
		}

		*((vu16 *)addr + 2) = (u16) - brightness;
	} else {
		if (G2_BLENDTYPE_FADEOUT == (tmp & REG_G2_BLDCNT_EFFECT_MASK)) {
			*((vu16 *)addr + 0) = (u16)((tmp & ~REG_G2_BLDCNT_EFFECT_MASK) | G2_BLENDTYPE_FADEIN);
		}

		*((vu16 *)addr + 2) = (u16)brightness;
	}
}
