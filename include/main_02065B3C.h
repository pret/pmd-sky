#ifndef PMDSKY_MAIN_02065B3C_H
#define PMDSKY_MAIN_02065B3C_H

#include "enums.h"

struct unk_020A7FF0 {
    s16 field_0x0;
    s16 field_0x2;
    char *field_0x4;
    u16 field_0x8;
    u8 field_0xa;
    u8 field_0xb;
};

extern struct unk_020A7FF0 ENTITIES[];

//The earlier fields in this were changed from script_entity_id to monster_id based on how they are handled; if evidence suggests they can handle both, they should be converted into a union.
struct special_actors {
    enum monster_id event_npc02;
    enum monster_id event_npc01;
    enum monster_id demo_partner;
    enum monster_id event_npc04;
    enum monster_id event_npc03;
    enum monster_id demo_hero;
    enum monster_id new_friend;
    enum monster_id random_request_npc02;
    enum monster_id random_request_npc01;
    enum script_entity_id event_npc_sub;
    enum script_entity_id event_npc_main;
    enum script_entity_id talk_sub;
    enum script_entity_id talk_main;
    u8 padding[2];
};

extern struct special_actors SPECIAL_ACTORS;

u16 sub_02065B14(s16 id);
void SetActorTalkMainAndActorTalkSub(enum script_entity_id talk_main, enum script_entity_id talk_sub);
void SetActorTalkMain(enum script_entity_id talk_main);
void SetActorTalkSub(enum script_entity_id talk_sub);
void SetActorEventMain(enum script_entity_id event_npc_main);
void SetRandomRequestNpcs1And2(enum monster_id random_request_npc01, enum monster_id random_request_npc02);
void SetRandomRequestNpc03KindVar(enum monster_id kind);
void SetAllEventNpcs(enum monster_id event_npc01, enum monster_id event_npc02, enum monster_id event_npc03, enum monster_id event_npc04);
void SetNewFriendActor(enum monster_id new_friend);
void sub_02065BD8(u8 *dst, s32 n);
void sub_02065BF0(u8 *dst);
void sub_02065C08(u8 *src, s32 n);

#endif
