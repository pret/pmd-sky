#include "enums.h"

extern void StrncpySimpleNoPadSafe(u8 *dest, const u8 *src, u32 n);

extern u8 _022B7310[];

extern void StrncpySimple(u8 *dest, const u8 *src, s32 n);
#include "main_02065B3C.h"
#include "script_variable.h"

u16 sub_02065B14(s16 id)
{
    struct unk_020A7FF0 *entity;

    if (id == -1) {
        return 0;
    }
    entity = &ENTITIES[id];
    return entity->field_0x8;
}

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

void sub_02065BD8(u8 *dst, s32 n)
{
    StrncpySimple(dst, _022B7310, n);
}

void sub_02065BF0(u8 *dst)
{
    StrncpySimpleNoPadSafe(dst, _022B7310, 10);
}

void sub_02065C08(u8 *src, s32 n)
{
    u8 *dst;
    s32 i;

    dst = _022B7310;
    i = 0;

    while (i < n) {
        *dst++ = *src++;
        i++;
    }

    while (i < 0x10) {
        *dst++ = 0;
        i++;
    }
}
