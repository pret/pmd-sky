#ifndef NITRO_GXSTATE_H_
#define NITRO_GXSTATE_H_

#include <nitro/gx/gx.h>
#include <nitro/gx/gx_vramcnt.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
	u16 lcdc;
	u16 bg;
	u16 obj;
	u16 arm7;
	u16 tex;
	u16 texPltt;
	u16 clrImg;
	u16 bgExtPltt;
	u16 objExtPltt;
	u16 sub_bg;
	u16 sub_obj;
	u16 sub_bgExtPltt;
	u16 sub_objExtPltt;
} GX_VRAMCnt_;

typedef struct {
	GX_VRAMCnt_ vramCnt;
} GX_State;

extern GX_State gGXState;

void GX_InitGXState(void);

#ifdef SDK_DEBUG
    void GX_StateCheck_VRAMCnt_(void);
    void GX_RegionCheck_BG_(u32 first, u32 last);
    void GX_RegionCheck_OBJ_(u32 first, u32 last);
    void GX_RegionCheck_SubBG_(u32 first, u32 last);
    void GX_RegionCheck_SubOBJ_(u32 first, u32 last);
    void GX_RegionCheck_Tex_(GXVRamTex tex, u32 first, u32 last);
    void GX_RegionCheck_TexPltt_(GXVRamTexPltt texPltt, u32 first, u32 last);
#endif

#ifdef SDK_DEBUG
    static inline void GX_StateCheck_VRAMCnt (void)
    {
        GX_StateCheck_VRAMCnt_();
    }

    static inline void GX_RegionCheck_BG (u32 first, u32 last)
    {
        GX_RegionCheck_BG_(first, last);
    }

    static inline void GX_RegionCheck_OBJ (u32 first, u32 last)
    {
        GX_RegionCheck_OBJ_(first, last);
    }

    static inline void GX_RegionCheck_SubBG (u32 first, u32 last)
    {
        GX_RegionCheck_SubBG_(first, last);
    }

    static inline void GX_RegionCheck_SubOBJ (u32 first, u32 last)
    {
        GX_RegionCheck_SubOBJ_(first, last);
    }

    static inline void GX_RegionCheck_Tex (GXVRamTex tex, u32 first, u32 last)
    {
        GX_RegionCheck_Tex_(tex, first, last);
    }

    static inline void GX_RegionCheck_TexPltt (GXVRamTexPltt texPltt, u32 first, u32 last)
    {
        GX_RegionCheck_TexPltt_(texPltt, first, last);
    }
#else
    static inline void GX_StateCheck_VRAMCnt (void)
    {
    }

    static inline void GX_RegionCheck_BG (u32, u32)
    {
    }

    static inline void GX_RegionCheck_OBJ (u32, u32)
    {
    }

    static inline void GX_RegionCheck_SubBG (u32, u32)
    {
    }

    static inline void GX_RegionCheck_SubOBJ (u32, u32)
    {
    }

    static inline void GX_RegionCheck_Tex (GXVRamTex, u32, u32)
    {
    }

    static inline void GX_RegionCheck_TexPltt (GXVRamTexPltt, u32, u32)
    {
    }
#endif

#ifdef __cplusplus
}
#endif

#endif
