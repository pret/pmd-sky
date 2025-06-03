#include "dungeon_mobility.h"
#include "dungeon_util_static.h"
#include "main_02052874.h"
#include "overlay_29_02318A4C.h"

extern enum mobility_type MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE[NUM_MOBILITY_TYPES];

enum mobility_type GetMobilityTypeCheckSlip(s16 species, bool8 walk_on_water)
{
    enum mobility_type mobility_type = GetMobilityType(species);

    if (walk_on_water)
    {
        bool8 cannot_normally_cross_water = mobility_type == MOBILITY_NORMAL || mobility_type == MOBILITY_LAVA;
        if (cannot_normally_cross_water)
            return MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE[MOBILITY_WATER];
    }

    if (mobility_type >= MOBILITY_LAVA)
        // Pokémon that can cross water or lava have a mobility type of 4 (MOBILITY_LAVA) or 5 (MOBILITY_WATER), respectively.
        // Indices 4 and 5 in this array are assigned either MOBILITY_NORMAL or MOBILITY_WATER
        // depending on whether the dungeon's liquid is water or lava.
        // For example, a lava dungeon would have these values:
        //   MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE[MOBILITY_LAVA]: MOBILITY_WATER
        //   MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE[MOBILITY_WATER]: MOBILITY_NORMAL
        // This means a Fire-type can cross the dungeon's liquid, while a Water-type cannot.
        return MOBILITY_TYPE_TO_DUNGEON_MOBILITY_TYPE[mobility_type];

    return mobility_type;
}

enum mobility_type GetMobilityTypeCheckSlipAndFloating(struct entity *monster, s16 species)
{
    struct monster *entity_info = GetEntInfo(monster);

    enum mobility_type mobility_type = GetMobilityTypeCheckSlip(species, entity_info->invisible_class_status.status == STATUS_INVISIBLE_SLIP);
    if (mobility_type != MOBILITY_INTANGIBLE && IsFloating(monster))
        return MOBILITY_HOVERING;

    return mobility_type;
}
