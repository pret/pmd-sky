#include "overlay_29_023026CC.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "enums.h"
#include "main_0200C4FC.h"
#include "main_0202593C.h"
#include "main_02058C3C.h"
#include "overlay_29_022ED01C.h"
#include "overlay_29_022F7364.h"
#include "overlay_29_02302A38.h"
#include "overlay_29_0234B024.h"
#include "overlay_29_0234B4BC.h"
#include "spawn_2.h"

struct unk_023527F8 {
    s32 field_0x0;
    s32 field_0x4;
};

extern struct dungeon *DUNGEON_PTR[];

extern const struct unk_023527F8 ov29_023527F8[2];

extern void CreateTemporaryEntity(struct entity *entity);
extern void SetPreprocessorArgsStringToName(struct preprocessor_args *preprocessor_args,
                                            s32 pos, struct monster *monster,
                                            u32 param_4, u8 name_type);
extern bool8 IsExpEnabledInDungeon(s32 dungeon_id);
extern bool8 LevelUp(struct entity *user, struct entity *target, bool8 a, bool8 b);
extern s32 GetEvolutions(s16 monster_id, s16 *out, bool8 a, bool8 b);
extern void EvolveMonster(struct entity *user, struct entity *target, s16 evolution_id);
extern void ov29_02302CC8(struct entity *entity, struct preprocessor_args *args);
extern void ov29_02302C04(struct entity *user, struct entity *target, u8 *tactic_flags,
                          bool8 a);

bool8 ItemIsActive__023026CC(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

#ifdef JAPAN
#define MESSAGE_F1F 0x2486
#else
#define MESSAGE_F1F 0xF1F
#endif

void EnemyEvolution(struct entity *entity)
{
    struct entity temp;
    struct preprocessor_args args;
    u8 tactic_flags[12];
    s16 evolutions[DUNGEON_MAX_POKEMON];
    struct unk_023527F8 old_offensive;
    struct unk_023527F8 old_defensive;
    s32 dungeon_id;
    s32 old_hp;
    struct dungeon *dungeon;
    s32 i;
    struct entity *target;
    s32 leveled_up;
    s32 n;
    s32 k;
    s32 j;
    struct monster *monster;
    u32 exp_gain;

    AllocateTemp1024ByteBufferFromPool();
    dungeon = DUNGEON_PTR[0];
    dungeon_id = dungeon->id;
    if (!dungeon->should_enemy_evolve)
        return;
    dungeon->should_enemy_evolve = FALSE;
    if (GetForcedLossReason() != FORCED_LOSS_NONE)
        return;
    if (!EntityIsValid__02302A38(entity)) {
        CreateTemporaryEntity(&temp);
        entity = &temp;
    }

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        leveled_up = FALSE;
        target = DUNGEON_PTR[0]->active_monster_ptrs[i];
        old_offensive = ov29_023527F8[0];
        old_defensive = ov29_023527F8[1];
        old_hp = 0;
        if (target == NULL)
            continue;
        if (!EntityIsValid__02302A38(target))
            continue;
        monster = (struct monster *) target->info;
        if (monster->hp == 0)
            continue;

        if (monster->field_0x102) {
            monster->field_0x102 = 0;
        } else {
            exp_gain = monster->unk_exp_tracker;
            if (exp_gain != 0) {
                if (monster->is_team_leader)
                    GetUnlockedTacticFlags(tactic_flags, monster->level);
                old_hp = monster->max_hp_stat + monster->max_hp_boost;
                if (old_hp > 999)
                    old_hp = 999;
                old_offensive.field_0x0 = monster->offensive_stats[0];
                old_offensive.field_0x4 = monster->offensive_stats[1];
                old_defensive.field_0x0 = monster->defensive_stats[0];
                old_defensive.field_0x4 = monster->defensive_stats[1];
                if (monster->level != 100 && IsExpEnabledInDungeon(dungeon_id)) {
                    monster->exp += exp_gain;
                    SetMessageLogPreprocessorArgsNumberVal(0, exp_gain);
                    SetPreprocessorArgsStringToName(GetMessageLogPreprocessorArgs(), 0,
                                                    monster, 0, 0);
                    LogMessageByIdWithPopup(entity, MESSAGE_F1F);
                    leveled_up |= LevelUp(entity, target, TRUE, TRUE);
                }
            }

            if (monster->should_evolve) {
                n = GetEvolutions(monster->id, evolutions, FALSE, FALSE);
                if (n != 0) {
                    j = DungeonRandInt(n);
                    for (k = 0; k < n; k++) {
                        if (IsOnMonsterSpawnList(evolutions[j]) &&
                            DungeonGetSpriteIndex(evolutions[j]) != 0)
                            break;
                        j++;
                        if (j >= n)
                            j = 0;
                    }
                    if (k < n)
                        EvolveMonster(entity, target, evolutions[j]);
                }
                leveled_up = FALSE;
            }

            if (leveled_up && !monster->is_not_team_member) {
                s32 new_hp = monster->max_hp_stat + monster->max_hp_boost;
                if (new_hp > 999)
                    new_hp = 999;
                args.number_vals[0] = new_hp - old_hp;
                args.number_vals[1] = monster->offensive_stats[0] - old_offensive.field_0x0;
                args.number_vals[2] = monster->defensive_stats[0] - old_defensive.field_0x0;
                args.number_vals[3] = monster->offensive_stats[1] - old_offensive.field_0x4;
                args.number_vals[4] = monster->defensive_stats[1] - old_defensive.field_0x4;
                ov29_02302CC8(target, &args);
            }

            if (exp_gain != 0)
                ov29_02302C04(entity, target, tactic_flags, TRUE);
        }

        monster->unk_exp_tracker = 0;
        monster->should_evolve = FALSE;
    }
}