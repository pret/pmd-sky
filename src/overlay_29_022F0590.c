#include "overlay_29_022F0590.h"


extern void FreezeAnim(struct entity *e);

extern void UnfreezeAnim(struct entity *e);

extern void ov29_022F0AE0(void);

extern void ov29_0234D668(void);

extern void ov29_0234D838(void);

extern void ov29_022EA370(s32 a, s32 b);

extern s32 TalkToSecretBazaarNpc(struct entity *a, struct entity *b, s32 c, s32 d, s32 e);
#include "dungeon_util_static.h"

bool8 EntityIsValid__022F0590(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_022F05B4(struct entity* a, struct entity* b, bool8 freeze)
{
    if (!freeze) {
        UnfreezeAnim(a);
        UnfreezeAnim(b);
    } else {
        FreezeAnim(a);
        FreezeAnim(b);
    }
}

void ov29_022F05E4(void)
{
    ov29_022F0AE0();
    ov29_0234D668();
    ov29_0234D838();
    ov29_022EA370(0x20, 0x62);
}

s32 TalkToSecretBazaarNpcStandard(struct entity* a, struct entity* b, s32 c)
{
    return TalkToSecretBazaarNpc(a, b, c, 0, 0);
}

s32 ov29_022F0618(struct entity* a, struct entity* b, s32 c, s32 d)
{
    return TalkToSecretBazaarNpc(a, b, c, d, 0);
}

s32 TalkToSecretBazaarNpcWithYesNoMenu(struct entity* a, struct entity* b, s32 c, s32 d)
{
    s32 result = TalkToSecretBazaarNpc(a, b, c, d, 1);

    ov29_022F0AE0();

    return result;
}
