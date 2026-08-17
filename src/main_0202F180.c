#include "main_0202F180.h"
#include "main_0202AAA8.h"

bool8 IsDialogueBoxActive(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    return w->field_0x8;
}
