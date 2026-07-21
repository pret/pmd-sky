#include "main_0200224C.h"
#include "main_02065B3C.h"
#include "main_02065C48.h"

void RandomizeDemoActors(void)
{
    int team = RandInt(18);
    SPECIAL_ACTORS.demo_hero = (enum monster_id)DEMO_TEAMS[team].field_0x0;
    SPECIAL_ACTORS.demo_partner = (enum monster_id)DEMO_TEAMS[team].field_0x2;
}
