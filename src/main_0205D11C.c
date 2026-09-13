#include "main_0205D11C.h"

#include "debug.h"
#include "dungeon.h"
#include "item_util.h"
#include "item_util_4.h"
#include "mission.h"
#include "item_util.h"
#include "main_02001188.h"
#include "main_0200224C.h"
#include "main_02054BE0.h"
#include "main_02062A58.h"
#include "main_0205E01C.h"
#include "main_0205E288.h"
#include "dungeon_recruitment_2.h"

extern u8 _020A39C0;
extern u8 _020A39D4;
extern u8 _020A39F0;
extern u8 _020A3A08;
extern u8 _020A3A24;
extern u8 _020A3A44;
extern u8 _020A3A6C;
extern u8 _020A3AA0;
extern const char _020A3AD4[];
extern const char _020A3AF4[];
extern const char _020A3B18[];

extern s32 RandIntSafe(s32 n);
extern void ClearMissionData(struct mission *mission);
extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;
extern s32 CanDungeonBeUsedForMission(enum dungeon_id);
extern s32 GetAllPossibleMonsters(s16 **out);
extern u8 GetMissionSpecificFixedRoom(enum mission_type, u32);
extern bool8 IsAvailableItem(s16 item_id);
extern void *LoadMissionTemplates(void);
extern s32 MtNext(void);
extern void RollRandomItemReward(struct dungeon_floor_pair *, enum mission_type, s16 *out);
extern void sub_02062900(u16, s16 *, void *out);
extern bool8 sub_02062AD0(enum monster_id);
extern bool8 sub_02062C4C(s32, u8 *, struct dungeon_floor_pair *, s32);
extern s32 sub_02062814(void **out);
extern s32 sub_0206282C(u8 *out);
extern bool8 sub_02062D40(struct dungeon_floor_pair *);
extern s16 *sub_020627F4(void);

extern enum monster_id GetBaseForm(enum monster_id);
extern s32 GetBodySize(enum monster_id);
extern bool8 IsForbiddenFloor(struct dungeon_floor_pair*);
extern bool8 IsInvalidForMission(enum dungeon_id);
extern bool8 IsItemValidVeneer(s16 item_id);
extern bool8 IsMissionValid(struct mission *mission);
extern bool8 IsMonsterIllegalForMissions(enum monster_id);
extern bool8 IsMonsterMissionAllowed(enum monster_id);
extern s32 sub_02063424(enum mission_type, union mission_subtype*, enum dungeon_id);

bool8 sub_0205CF58(enum mission_type type, union mission_subtype* subtype, struct dungeon_floor_pair* df_pair)
{
    if (type != MISSION_FIND_ITEM || subtype->find_item != MISSION_TOGETIC_GABITE_SCALE) {
        if (type != MISSION_TYPE_CONSUMABLE) {
            if (IsInvalidForMission(df_pair->dungeon_id)) {
                Debug_Print0(&_020A39C0, df_pair->dungeon_id);
                return FALSE;
            }
            
            if (df_pair->floor_id > sub_02063424(type, subtype, df_pair->dungeon_id)) {
                Debug_Print0(&_020A39D4, df_pair->floor_id);
                return FALSE;
            }
            
            if (IsForbiddenFloor(df_pair) != 0) {
                Debug_Print0(&_020A39F0);
                return FALSE;
            }
        }
    }
    
    return TRUE;
}

bool8 CheckMonsterForMissionType(enum mission_type type, union mission_subtype* subtype, enum monster_id outlaw_backup_species, bool8 arg3)
{
    if (arg3 && outlaw_backup_species == MONSTER_NONE) {
        Debug_Print0(&_020A3A08);
        return FALSE;
    }
    
    if ((s32)outlaw_backup_species >= 0x483) {
        Debug_Print0(&_020A3A24);
        return FALSE;
    }
    
    if (outlaw_backup_species != GetBaseForm(outlaw_backup_species)) {
        Debug_Print0(&_020A3A44, outlaw_backup_species);
        return FALSE;
    }
    
    if (IsMonsterIllegalForMissions(outlaw_backup_species)) {
        Debug_Print0(&_020A3A6C, outlaw_backup_species);
        return FALSE;
    }
    
    if (arg3 &&
        (type == MISSION_ESCORT_TO_TARGET ||
         type == MISSION_EXPLORE_WITH_CLIENT ||
         type == MISSION_PROSPECT_WITH_CLIENT ||
         type == MISSION_GUIDE_CLIENT) &&
        GetBodySize(outlaw_backup_species) != 1) {
        return FALSE;
    }
    
    if (arg3 && type != MISSION_ARREST_OUTLAW && type != MISSION_TYPE_CONSUMABLE && type != MISSION_CHALLENGE_REQUEST) {
        if (!IsMonsterMissionAllowed(outlaw_backup_species)) {
            Debug_Print0(&_020A3AA0, outlaw_backup_species);
            return FALSE;
        }
    }
    
    return TRUE;
}

bool8 CheckItemForMissionType(u32 r0, union mission_subtype *r1, s16 r2)
{
    if (r2 == 0) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsValidTargetItem(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (!IsItemValidVeneer(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsThrownItem(r2) && r0 == 4 && r2 != 10 && r2 != 9) {
        Debug_Print0(_020A3AF4, r2);
        return FALSE;
    }

    if (IsStorableItem(r2)) {
        return TRUE;
    }

    Debug_Print0(_020A3B18, r2);
    return FALSE;
}

bool8 sub_0205D1F4(struct mission *mission) {
    if (!IsMissionValid(mission) || ((mission->status >= NUM_MISSIONS_STATUS))) {
        return FALSE;
    }
    return TRUE; 
}

s32 GenerateMission(struct unk_0205D224 *tmpl, struct mission *mission)
{
    s16 *sp10;
    void *sp0c;
    s16 *sp08;
    struct { u8 list[1]; struct dungeon_floor_pair df; } x;
    s32 count;
    s32 err;

    s16 m;

    count = GetAllPossibleMonsters(&sp10);
    if (count == 0) {
        ClearMissionData(mission);
        return 2;
    }
    mission->status = MISSION_STATUS_SUSPENDED;
    mission->type = tmpl->field_0x20;
    mission->subtype = tmpl->field_0x21;
    {
        s32 e;

        do {
            switch (tmpl->field_0x2[1].field_0x0) {
            case 0:
            case 1:
                x.list[0] = *(u16 *)&tmpl->field_0x2[1].field_0x4;
                x.df.dungeon_id = (enum dungeon_id)x.list[0];
                if (tmpl->field_0x2[1].field_0x0 == 0 && CanDungeonBeUsedForMission(x.df.dungeon_id) == 0) {
                    e = 1;
                } else if (!sub_02062C4C(1, x.list, &x.df, sub_0205E258(mission))) {
                    e = sub_0205E258(mission) ? 1 : 2;
                } else if (!sub_0205CF58(tmpl->field_0x20, &tmpl->field_0x21, &x.df)) {
                    e = 1;
                } else {
                    e = 0;
                    mission->dungeon_id = x.df.dungeon_id;
                    mission->floor = x.df.floor_id;
                }
                continue;
            case 5:
                {
                    s32 n;
                    s32 ok;
                    u8 *p;
                    n = sub_02062814(&sp0c);
                    if (tmpl->field_0x20 != 3 || tmpl->field_0x21.other != 3) {
                        e = 1;
                        continue;
                    }
                    p = MemAlloc(n, 0xf);
                    n = sub_0206282C(p);
                    if (n == 0) {
                        MemFree(p);
                        e = 1;
                        continue;
                    }
                    ok = sub_02062C4C(n, p, &x.df, sub_0205E258(mission));
                    x.df.floor_id = sub_02063424(mission->type, &mission->subtype, x.df.dungeon_id);
                    while (x.df.floor_id != 0) {
                        if (!IsForbiddenFloor(&x.df)) {
                            break;
                        }
                        x.df.floor_id--;
                    }
                    MemFree(p);
                    if (ok && x.df.floor_id != 0) {
                        e = 0;
                        mission->dungeon_id = x.df.dungeon_id;
                        mission->floor = x.df.floor_id;
                        continue;
                    }
                }
                break;
            case 2:
            case 3:
            case 4:
            default:
                {
                    s32 n;
                    u8 *p;
                    e = 1;
                    n = *(s32 *)&MISSION_DELIVER_LIST_PTR.unk0[0xc];
                    p = *(u8 **)&MISSION_DELIVER_LIST_PTR.unk0[8];
                    if (n == 0) {
                        e = 2;
                        continue;
                    }
                    if (!sub_02062C4C(n, p, &x.df, sub_0205E258(mission))) {
                        if (sub_0205E258(mission) == 0) {
                            e = 2;
                        }
                        continue;
                    }
                    switch (mission->type) {
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        if (GetMaxMembersAllowed(x.df.dungeon_id) < 4) {
                            e = 0;
                        }
                        break;
                    case 7:
                        if (GetMaxItemsAllowed(x.df.dungeon_id) == 0) {
                            e = 0;
                        }
                    case 6:
                        if (!sub_02062D40(&x.df)) {
                            e = 0;
                        }
                        break;
                    case 10:
                        if (mission->subtype.other == 4 && GetMaxMembersAllowed(x.df.dungeon_id) < 4) {
                            e = 0;
                        }
                        break;
                    default:
                        break;
                    }
                    if (e != 0) {
                        e = 0;
                        mission->dungeon_id = x.df.dungeon_id;
                        mission->floor = x.df.floor_id;
                        continue;
                    }
                }
                break;
            }
            e = 1;
        } while (0);
        if (e) {
            ClearMissionData(mission);
            return e;
        }
        mission->description_id = MtNext() & 0xFFFFFF;
        sp08 = NULL;
    }
    do {
        switch (tmpl->field_0x2[2].field_0x0) {
        case 0:
        case 1: {
            m = tmpl->field_0x2[2].field_0x4;
            if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)m, TRUE)) {
                err = 1;
            } else if (tmpl->field_0x20 == MISSION_CHALLENGE_REQUEST && tmpl->field_0x21.other == 0) {
                if (CanMonsterBeUsedForMission(m, m != MONSTER_LUCARIO && m != MONSTER_LUCARIO_SECONDARY)) {
                    mission->client = (enum monster_id)m;
                    mission->target = (enum monster_id)*(u16 *)&tmpl->field_0x2[3].field_0x4;
                    mission->outlaw_backup_species = (enum monster_id)*(u16 *)&tmpl->field_0x2[4].field_0x4;
                    err = 0;
                } else {
                    err = 1;
                }
            } else {
                if (tmpl->field_0x2[2].field_0x0 == 0) {
                    if (!CanMonsterBeUsedForMissionWrapper(m)) {
                        err = 1;
                        continue;
                    }
                } else if (!sub_02062AD0((enum monster_id)m)) {
                    err = 1;
                    continue;
                }
                mission->client = (enum monster_id)m;
                break;
            }
            continue;
        }
        case 2: {
            err = CountAndPopulateValidMissionTableMonsters(&sp08, &tmpl->field_0x2[2]);
            if (err == 0) {
                MemFree(sp08);
                sp08 = NULL;
                err = 1;
            } else {
                m = sp08[RandInt(err)];
                if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)m, TRUE)) {
                    MemFree(sp08);
                    sp08 = NULL;
                    err = 1;
                } else {
                    if (!(tmpl->field_0x2[2].field_0x0 == tmpl->field_0x2[3].field_0x0
                          && tmpl->field_0x2[2].field_0x2 == tmpl->field_0x2[3].field_0x2
                          && (u16)tmpl->field_0x2[2].field_0x4 == (u16)tmpl->field_0x2[3].field_0x4)) {
                        err = 0;
                        MemFree(sp08);
                        sp08 = NULL;
                    }
                    mission->client = (enum monster_id)m;
                    if (!(mission->floor & 1)) {
                        mission->client = (enum monster_id)GetSecondFormIfValid((enum monster_id)mission->client);
                    }
                    break;
                }
            }
            continue;
        }
        case 3: {
            u16 n = tmpl->field_0x2[2].field_0x2;
            sp08 = sub_020627F4() + (u16)tmpl->field_0x2[2].field_0x4;
            m = sp08[RandInt(n)];
            if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)m, TRUE)) {
                err = 1;
            } else if (!sub_02062AD0((enum monster_id)m)) {
                err = 1;
            } else {
                mission->client = (enum monster_id)m;
                if (!(mission->floor & 1)) {
                    mission->client = (enum monster_id)GetSecondFormIfValid((enum monster_id)mission->client);
                }
                err = 0;
                sp08 = NULL;
                break;
            }
            continue;
        }
        case 4: {
            s32 n = GetAllPossibleMonsters(&sp08);
            if (n == 0) {
                err = 2;
            } else {
                m = sp08[RandIntSafe(n)];
                if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)m, TRUE)) {
                    err = 1;
                } else {
                    mission->client = (enum monster_id)m;
                    if (!(mission->floor & 1)) {
                        mission->client = (enum monster_id)GetSecondFormIfValid((enum monster_id)mission->client);
                    }
                    err = 0;
                    sp08 = NULL;
                    break;
                }
            }
            continue;
        }
        }
        if (sub_0205E1E8(mission)) {
            if (sp08 != NULL) {
                MemFree(sp08);
                sp08 = NULL;
            }
            mission->target = (enum monster_id)mission->client;
            mission->outlaw_backup_species = (enum monster_id)0;
            err = 0;
        } else {
            int i;
            s32 sl;

            if ((mission->type == MISSION_ARREST_OUTLAW && mission->subtype.outlaw == MISSION_OUTLAW_HIDEOUT) ||
                (mission->type == MISSION_CHALLENGE_REQUEST && mission->subtype.challenge == MISSION_CHALLENGE_NORMAL)) {
                sl = 2;
            } else {
                mission->outlaw_backup_species = (enum monster_id)0;
                sl = 1;
            }
            for (i = 0; i < sl || (err = 0); i++) {
                switch (tmpl->field_0x2[i + 3].field_0x0) {
                case 0:
                case 1: {
                    m = tmpl->field_0x2[i + 3].field_0x4;
                    if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)m, 0)) {
                        err = 1;
                        break;
                    } else if (tmpl->field_0x20 == MISSION_ARREST_OUTLAW &&
                               tmpl->field_0x21.outlaw == MISSION_OUTLAW_HIDEOUT) {
                        if (!CanMonsterBeUsedForMissionWrapper(m)) {
                            err = 1;
                        } else {
                            mission->target = (enum monster_id)m;
                            mission->outlaw_backup_species = (enum monster_id)*(u16 *)&tmpl->field_0x2[4].field_0x4;
                            err = 0;
                        }
                        break;
                    } else if (tmpl->field_0x2[i + 3].field_0x0 == 0) {
                        if (!CanMonsterBeUsedForMissionWrapper(m)) {
                            err = 1;
                            break;
                        }
                    } else {
                        if (!sub_02062AD0((enum monster_id)m)) {
                            err = 1;
                            break;
                        }
                    }
                    ((s16 *)&mission->target)[i] = m;
                    continue;
                }
                case 2: {
                    s16 id;
                    if (sp08 == NULL) {
                        err = CountAndPopulateValidMissionTableMonsters(&sp08, &tmpl->field_0x2[3] + i);
                        if (err == 0) {
                            MemFree(sp08);
                            sp08 = NULL;
                            err = 1;
                            break;
                        }
                    }
                    id = sp08[RandInt(err)];
                    if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)id, 0)) {
                        MemFree(sp08);
                        sp08 = NULL;
                        err = 1;
                    } else {
                        if (i + 1 >= sl ||
                            tmpl->field_0x2[(u32)i + 3].field_0x0 != tmpl->field_0x2[(u32)i + 4].field_0x0 ||
                            tmpl->field_0x2[(u32)i + 3].field_0x2 != tmpl->field_0x2[(u32)i + 4].field_0x2 ||
                            (u16)tmpl->field_0x2[(u32)i + 3].field_0x4 != (u16)tmpl->field_0x2[(u32)i + 4].field_0x4) {
                            err = 0;
                            MemFree(sp08);
                            sp08 = NULL;
                        }
                        ((s16 *)&mission->target)[i] = id;
                        if (!(mission->floor & 1)) {
                            ((s16 *)&mission->target)[i] = GetSecondFormIfValid(((s16 *)&mission->target)[i]);
                        }
                        continue;
                    }
                    break;
                }
                case 3: {
                    s16 id;
                    s32 m = tmpl->field_0x2[i + 3].field_0x2;
                    sp08 = sub_020627F4() + (u16)tmpl->field_0x2[i + 3].field_0x4;
                    id = sp08[RandInt(m)];
                    if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)id, 0)) {
                        err = 1;
                    } else if (!sub_02062AD0((enum monster_id)id)) {
                        err = 1;
                    } else {
                        ((s16 *)&mission->target)[i] = id;
                        if (!(mission->floor & 1)) {
                            ((s16 *)&mission->target)[i] = GetSecondFormIfValid(((s16 *)&mission->target)[i]);
                        }
                        sp08 = NULL;
                        err = 0;
                        continue;
                    }
                    break;
                }
                case 4:
                case 6: {
                    s16 id;
                    s32 m = GetAllPossibleMonsters(&sp08);
                    if (m == 0) {
                        err = 2;
                    } else {
                        id = sp08[RandIntSafe(m)];
                        if (!CheckMonsterForMissionType(tmpl->field_0x20, &tmpl->field_0x21, (enum monster_id)id, 0)) {
                            err = 1;
                        } else {
                            ((s16 *)&mission->target)[i] = id;
                            if (!(mission->floor & 1)) {
                                ((s16 *)&mission->target)[i] = GetSecondFormIfValid(((s16 *)&mission->target)[i]);
                            }
                            sp08 = NULL;
                            continue;
                        }
                    }
                    break;
                }
                default:
                    continue;
                }
                break;
            }
        }
    } while (0);
    if (err != 0) {
        ClearMissionData(mission);
        return err;
    }
    do {
        s16 item;

        switch (tmpl->field_0x2[0].field_0x0) {
        case 0:
        case 1:
            item = tmpl->field_0x2[0].field_0x4;
            if (CheckItemForMissionType(tmpl->field_0x20, &tmpl->field_0x21, item) == 0) {
                err = 1;
            } else if (tmpl->field_0x2[0].field_0x0 == 0 && IsAvailableItem(item) == 0) {
                err = 1;
            } else {
                mission->item_wanted = (enum item_id)item;
                break;
            }
            continue;
        case 2: {
            s16 *buf;
            s32 k;
            s32 i;
            s32 n;
            s32 off;
            s16 v;
            s16 *base;

            n = tmpl->field_0x2[0].field_0x2;
            off = (u16)tmpl->field_0x2[0].field_0x4;
            k = 0;
            base = (s16 *)LoadMissionTemplates();
            buf = (s16 *)MemAlloc(n * 2, 0xf);
            for (i = 0; i < n; i++) {
                v = base[off + i];
                if (IsAvailableItem(v) != 0) {
                    buf[k] = v;
                    k++;
                }
            }
            if (k == 0) {
                MemFree(buf);
                err = 1;
            } else {
                item = buf[RandIntSafe(k)];
                MemFree(buf);
                if (CheckItemForMissionType(tmpl->field_0x20, &tmpl->field_0x21, item) == 0) {
                    err = 1;
                } else {
                    mission->item_wanted = (enum item_id)item;
                    break;
                }
            }
            continue;
        }
        case 3: {
            s32 off;
            s32 n;
            s16 *p;

            n = tmpl->field_0x2[0].field_0x2;
            off = (u16)tmpl->field_0x2[0].field_0x4;
            p = (s16 *)LoadMissionTemplates() + off;
            item = p[RandIntSafe(n)];
            if (CheckItemForMissionType(tmpl->field_0x20, &tmpl->field_0x21, item) == 0) {
                err = 1;
            } else {
                mission->item_wanted = (enum item_id)item;
                break;
            }
            continue;
        }
        case 4: {
            s32 cnt;
            s16 *lst;
            s16 v;

            cnt = *(s32 *)&MISSION_DELIVER_LIST_PTR.unk0[4];
            lst = *(s16 **)&MISSION_DELIVER_LIST_PTR.unk0[0];
            if (cnt == 0)
                v = 0x46;
            else
                v = lst[RandIntSafe(cnt)];
            mission->item_wanted = (enum item_id)v;
            if (*(s16 *)&mission->item_wanted == 0) {
                if (mission->type == 6 || mission->type == 7) {
                    err = 1;
                    continue;
                } else {
                    do {
                        RollRandomItemReward((struct dungeon_floor_pair *)&mission->dungeon_id,
                                             mission->type,
                                             (s16 *)&mission->item_wanted);
                    } while (IsThrownItem(*(s16 *)&mission->item_wanted)
                             || !IsStorableItem(*(s16 *)&mission->item_wanted));
                }
            }
            break;
        }
        default:
            break;
        }
        err = 0;
    } while (0);
    if (err != 0) {
        ClearMissionData(mission);
        return err;
    }
    if (mission->dungeon_id == 0x26 || mission->dungeon_id == 0x29 ||
        GetMaxMembersAllowed(*(volatile enum dungeon_id *)&mission->dungeon_id) < 4) {
        mission->restriction_type = (enum mission_restriction_type)0;
        mission->restriction.monster_id = (enum monster_id)0;
    } else {
        sub_02062900((u16)count, sp10, &mission->restriction_type);
    }
    err = 0;
    mission->unique_map_id = 0;
    switch (mission->type) {
    case 3:
        switch (mission->subtype.other) {
        case 1:
            mission->unique_map_id = GetMissionSpecificFixedRoom(mission->type, mission->subtype.other);
            break;
        case 2:
            mission->unique_map_id = GetMissionSpecificFixedRoom(mission->type, mission->subtype.other);
            break;
        case 3:
            break;
        }
        break;
    case 6:
        switch (mission->subtype.other) {
        case 0:
        case 1:
        case 2:
        case 3:
            break;
        case 4:
        {
            enum dungeon_id dn = mission->dungeon_id;
            s32 v = sub_02063424(*(volatile enum mission_type *)&mission->type, &mission->subtype, dn);
            if (sub_0205E090(dn, v, 1)) {
                err = 1;
            } else {
                mission->floor = v;
            }
            break;
        }
        }
        break;
    case 9:
        if (*(s16 *)&mission->item_wanted == 0x49 || mission->client == mission->target) {
            err = 1;
        }
        break;
    case 10:
        switch (mission->subtype.other) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 7:
            break;
        case 6:
            mission->unique_map_id = GetMissionSpecificFixedRoom(mission->type, mission->subtype.other);
            break;
        }
        break;
    case 11:
        switch (mission->subtype.other) {
        case 5:
        {
            enum dungeon_id dn = mission->dungeon_id;
            s32 v = sub_02063424(*(volatile enum mission_type *)&mission->type, &mission->subtype, dn);
            if (sub_0205E090(dn, v, 1)) {
                err = 1;
                break;
            }
            mission->floor = v;
        }
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        default:
            mission->unique_map_id = GetMissionSpecificFixedRoom(mission->type, mission->subtype.other);
            break;
        }
        break;
    case 12:
        mission->unique_map_id = GetMissionSpecificFixedRoom(mission->type, mission->subtype.other);
        mission->restriction_type = (enum mission_restriction_type)0;
        mission->restriction.monster_id = (enum monster_id)0;
        break;
    case 14:
        switch (mission->subtype.other) {
        case 1:
            mission->restriction_type = (enum mission_restriction_type)0;
            mission->restriction.monster_id = (enum monster_id)0;
            break;
        case 2:
            err = 1;
            break;
        }
        break;
    }
    if (err) {
        ClearMissionData(mission);
        return err;
    }

    return 0;
}

s32 CountAndPopulateValidMissionTableMonsters(s16 **out, struct unk_0205DFAC *spec)
{
    s16 *base;
    s32 i;
    s32 n;
    s32 k;
    s16 v;
    s16 *buf;
    s32 off;

    n = spec->field_0x2;
    off = (u16)spec->field_0x4;
    k = 0;
    base = sub_020627F4();
    buf = (s16 *)MemAlloc(n * 2, 0xf);
    for (i = 0; i < n; i++) {
        v = base[off + i];
        if (CanMonsterBeUsedForMissionWrapper(v) != 0) {
            buf[k] = v;
            k++;
        }
    }
    *out = buf;
    return k;
}
