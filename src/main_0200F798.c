#include "main_0200F798.h"

u32 RemoveFirstUnequippedItemOfType(s16 type)
{
    return RemoveItemNoHoleCheck(GetFirstUnequippedItemOfType(type));
}
