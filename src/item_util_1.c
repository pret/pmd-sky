#include "debug.h"
#include "item_util_1.h"
#include "item.h"

extern struct item_tables ITEM_DATA_TABLE_PTRS;

extern s32 vsprintf(u8* str, const u8* format, va_list ap);

#ifdef EUROPE
void SprintfStatic__0200E808_EU(char* buf, const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
}
#endif

u8 GetExclusiveItemType(s16 item_id) {
    item_id = GetExclusiveItemOffsetEnsureValid(item_id);
    return ITEM_DATA_TABLE_PTRS.exclusive_data[item_id].type;
}

s16 GetExclusiveItemOffsetEnsureValid(s16 item_id) {
    if (item_id < ITEM_PRISM_RUFF || item_id >= NUM_ITEM_IDS) {
        return ITEM_PLAIN_SEED;
    }
    if (IsItemValid(item_id)) {
        return (s16)(item_id - ITEM_PRISM_RUFF);
    }
    return ITEM_PLAIN_SEED;
}

bool8 IsItemValid(s16 item_id)
{
    if (ITEM_DATA_TABLE_PTRS.data[item_id].flags & ITEM_DATA_FLAG_VALID)
        return TRUE;

    return FALSE;
}

s16 GetExclusiveItemParameter(s16 item_id) {
    item_id = GetExclusiveItemOffsetEnsureValid(item_id);
    return ITEM_DATA_TABLE_PTRS.exclusive_data[item_id].unk2;
}
