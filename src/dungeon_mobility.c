#include "dungeon_mobility.h"
#include "dungeon_util_static.h"

extern enum mobility_type GetMobilityTypeCheckSlip(s16 species, bool8 walk_on_water);
extern bool8 IsFloating(struct entity *entity);

enum mobility_type GetMobilityTypeCheckSlipAndFloating(struct entity *monster, s16 species)
{
    struct monster *entity_info = GetEntInfo(monster);
    enum mobility_type mobility_type = GetMobilityTypeCheckSlip(species, entity_info->invisible_class_status.status == STATUS_INVISIBLE_SLIP);
    if (mobility_type != MOBILITY_INTANGIBLE && IsFloating(monster))
        return MOBILITY_HOVERING;
    return mobility_type;
}
