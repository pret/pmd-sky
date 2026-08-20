#include "main_02048CB8.h"

extern struct unk_022AAE74 _022AAE74;

extern s32 Debug_GetDebugFlag(s32 id);

s32 sub_02048CB8(void)
{
    if (Debug_GetDebugFlag(9) && _022AAE74.field_0x28 == 0x000F1208) {
        return 0x000F1208 - 1;
    }

    return _022AAE74.field_0x28;
}
