#include "main_0205D11C.h"

#include "debug.h"
#include "item_util.h"
#include "item_util_4.h"

extern const char _020A3AD4[];
extern const char _020A3AF4[];
extern const char _020A3B18[];

extern bool8 IsItemValidVeneer(s16 item_id);

bool8 sub_0205D11C(u32 r0, u32 r1, s16 r2)
{
    if (r2 == 0) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsValidTargetItem(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (!IsItemValidVeneer(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsThrownItem(r2) && r0 == 4 && r2 != 10 && r2 != 9) {
        Debug_Print0(_020A3AF4, r2);
        return FALSE;
    }

    if (IsStorableItem(r2)) {
        return TRUE;
    }

    Debug_Print0(_020A3B18, r2);
    return FALSE;
}
