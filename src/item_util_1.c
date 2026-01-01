#include "debug.h"
#include "item_util_1.h"
#include "item.h"

struct item_data_entry_alt {
    u8 type;
    u16 unk2;
};

extern struct item_data_entry *ITEM_DATA_TABLE_PTRS[3];

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
#ifdef EUROPE
    return ((struct item_data_entry_alt**) (void**)ITEM_DATA_TABLE_PTRS)[1][item_id].type;
#else
    return ((struct item_data_entry_alt**) (void**)ITEM_DATA_TABLE_PTRS)[0][item_id].type;
#endif
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
    if (ITEM_DATA_TABLE_PTRS[ITEM_DATA_TABLE_PTRS_INDEX][item_id].flags & ITEM_DATA_FLAG_VALID)
        return TRUE;

    return FALSE;
}

s16 GetExclusiveItemParameter(s16 item_id) {
    item_id = GetExclusiveItemOffsetEnsureValid(item_id);
#ifdef EUROPE
    return ((struct item_data_entry_alt**) (void**)ITEM_DATA_TABLE_PTRS)[1][item_id].unk2;
#else
    return ((struct item_data_entry_alt**) (void**)ITEM_DATA_TABLE_PTRS)[0][item_id].unk2;
#endif
}
