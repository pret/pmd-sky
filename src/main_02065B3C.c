#include "enums.h"
#include "main_02065B3C.h"
#include "script_variable.h"

void SetActorTalkMainAndActorTalkSub(enum script_entity_id talk_main, enum script_entity_id talk_sub)
{
    SPECIAL_ACTORS.talk_main = talk_main;
    SPECIAL_ACTORS.talk_sub = talk_sub;
}

void SetActorTalkMain(enum script_entity_id talk_main)
{
    SPECIAL_ACTORS.talk_main = talk_main;
}

void SetActorTalkSub(enum script_entity_id talk_sub)
{
    SPECIAL_ACTORS.talk_sub = talk_sub;
}

void SetActorEventMain(enum script_entity_id event_npc_main)
{
    SPECIAL_ACTORS.event_npc_main = event_npc_main;
}

void SetRandomRequestNpcs1And2(enum monster_id random_request_npc01, enum monster_id random_request_npc02)
{
    SPECIAL_ACTORS.random_request_npc01 = random_request_npc01;
    SPECIAL_ACTORS.random_request_npc02 = random_request_npc02;
}

void SetRandomRequestNpc03KindVar(enum monster_id kind)
{
    SaveScriptVariableValue(0, VAR_RANDOM_REQUEST_NPC03_KIND, kind);
}

void SetAllEventNpcs(enum monster_id event_npc01, enum monster_id event_npc02, enum monster_id event_npc03, enum monster_id event_npc04)
{
    SPECIAL_ACTORS.event_npc01 = event_npc01;
    SPECIAL_ACTORS.event_npc02 = event_npc02;
    SPECIAL_ACTORS.event_npc03 = event_npc03;
    SPECIAL_ACTORS.event_npc04 = event_npc04;
}

void SetNewFriendActor(enum monster_id new_friend)
{
    SPECIAL_ACTORS.new_friend = new_friend;
}
