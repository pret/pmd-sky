#include "main_02064FFC.h"
#include "main_02065B3C.h"
#include "script_variable.h"
#include "debug.h"

void sub_02064F94(struct unk_02064F94* a, u32* data, int count)
{
    int i;

    for (i = 0; i < count; i++, data++) {
        sub_0201E380(_020AFC70 + 0xcc, data, a->field_0x8, i);
    }
}

void sub_02064FE4(struct unk_02064F94* a, struct unk_02064FE4* b)
{
    sub_02064F94(a, (u32*)((u8*)b + b->field_0x20), b->field_0x24);
}

char* sub_02064FFC(s16 id)
{
    return EVENTS[id].field_0x8;
}

int sub_02065014(s16 id)
{
    if (id != -1) {
        s16 value = EVENTS[id].field_0x0;

        if (value == 5 || value == 6 || value == 8) {
            return 0;
        }
    }
    return 1;
}

int sub_02065050(s16* p)
{
    s16 id;
    int ret;
    int a;
    int b;
    int member;
    u8 unit_buf[8];
    u8 adv_buf[8];

    id = *p;
    ret = -1;

    if (id == 0x2e) {
        *p = SPECIAL_ACTORS.talk_main;
    } else if (id == 0x2f) {
        *p = SPECIAL_ACTORS.talk_sub;
    } else if (id == 0x30) {
        *p = SPECIAL_ACTORS.event_npc_main;
    } else if (id == 0x31) {
        *p = SPECIAL_ACTORS.event_npc_sub;
    }

    id = *p;
    if (id == -1) {
        return -1;
    }

    if (ENTITIES[id].field_0x0 == 1) {
        if (id == 0) {
            switch (LoadScriptVariableValue(0, 0x34)) {
                case 0:
                    *p = 1;
                    break;
                case 1:
                    *p = 2;
                    break;
                case 3:
                    member = GetAppointedLeaderMemberIdx();
                    if (member == -1) {
                        *p = 1;
                        break;
                    }
                    if (member == GetMainCharacter1MemberIdx()) {
                        *p = 1;
                        break;
                    }
                    if (member == GetMainCharacter2MemberIdx()) {
                        *p = 2;
                    } else {
                        *p = 4;
                    }
                    break;
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                    *p = LoadScriptVariableValue(0, 0x34) + 1;
                    break;
                default:
                    *p = -1;
                    return -1;
            }
        }
        ret = 0;
    } else if (ENTITIES[id].field_0x0 == 2) {
        a = LoadScriptVariableValue(0, 0x35);
        b = LoadScriptVariableValue(0, 0x36);
        id = *p;
        if ((u16)(s16)(id - 0xa) <= 1) {
            if (id == 0xa) {
                if (a == 0) {
                    a = b;
                }
            } else {
                if (a == 0) {
                    b = 0;
                }
                a = b;
            }
            switch (a) {
                case 1:
                    *p = 0xc;
                    break;
                case 2:
                    *p = 0xd;
                    break;
                case 4:
                    member = GetAppointedLeaderMemberIdx();
                    if (member == -1) {
                        *p = 0xc;
                        break;
                    }
                    if (member == GetMainCharacter1MemberIdx()) {
                        *p = 0xc;
                        break;
                    }
                    if (member == GetMainCharacter2MemberIdx()) {
                        *p = 0xd;
                    } else {
                        *p = 0xf;
                    }
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    *p = a + 0xb;
                    break;
                case 10:
                    *p = 0x15;
                    break;
                default:
                    *p = -1;
                    return -1;
            }
        }
        switch (*p - 0xc) {
            case 0:
                ret = 2;
                break;
            case 1:
                ret = 1;
                break;
            case 3:
            case 9:
                ret = 2;
                break;
            case 2:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            default:
                *p = -1;
                return -1;
        }
    } else if (ENTITIES[id].field_0x0 == 3) {
        if (id >= 0x16 && id <= 0x19) {
            member = id - 0x16;
            if (OverlayIsLoaded(0xd)) {
                if (ov11_022E96E4()) {
                    return -1;
                }
            }
            if (Debug_GetDebugFlag(DEBUG_FLAG_STAGE_NPC_DUMMY)) {
                if (*p <= 0x17) {
                    return -1;
                }
            } else if (member < GetUnitNpcIds(unit_buf)) {
                return -1;
            }
        } else if (id >= 0x1a && id <= 0x1d) {
            member = id - 0x1a;
            if (OverlayIsLoaded(0xd)) {
                if (ov11_022E96E4()) {
                    return -1;
                }
            }
            if (Debug_GetDebugFlag(DEBUG_FLAG_STAGE_NPC_DUMMY)) {
                if (*p <= 0x1c) {
                    return -1;
                }
            } else if (member < GetAdventureNpcIds(adv_buf)) {
                return -1;
            }
        }
        *p = -1;
        return -1;
    } else {
        member = GetAppointedLeaderMemberIdx();
        if (*p == 0x3f) {
            if (member == -1) {
                *p = 0x3c;
            } else if (sub_02055410(member)) {
                *p = 0x3c;
            } else if (sub_02055474(member)) {
                *p = 0x3d;
            } else if (sub_020554D8(member)) {
                *p = 0x3e;
            }
        }
    }
    return ret;
}
