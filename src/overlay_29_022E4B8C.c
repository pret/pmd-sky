#include "overlay_29_022E4B8C.h"
#include "dg_effect.h"
#include "dungeon.h"

extern void PlaySeByIdIfShouldDisplayEntity(struct entity *entity, s32 se_id);

void ov29_022E4B8C(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x30E);
}

void ov29_022E4BA0(struct entity *entity)
{
    PlaySeByIdIfShouldDisplayEntity(entity, 0x30E);
}

extern s32 GetEffectAnimationWanOffset(s32 id);
extern struct dungeon *DUNGEON_PTR[];
extern s32 ov29_0230D618(s32 a);

void ov29_022E4BB4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x15, 1, GetEffectAnimationWanOffset(0x15),
                              2, 0, -1, 0);
}

void PlayAttractHitEffect(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0xF, 1, GetEffectAnimationWanOffset(0xF),
                              2, 0, -1, 0);
}

void ov29_022E4C4C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x15, 1, 3, 2, 0, -1, 0);
}

void ov29_022E4C84(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1F7, 1, GetEffectAnimationWanOffset(0x1F7),
                              2, 0, -1, 0);
}

void ov29_022E4CD4(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x1F9, 1, GetEffectAnimationWanOffset(0x1F9),
                              2, 0, -1, 0);
}

void ov29_022E4D24(void)
{

}

void PlayOffensiveStatDownEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x194, 1, GetEffectAnimationWanOffset(0x194),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x193, 1, GetEffectAnimationWanOffset(0x193),
                                  2, 0, -1, 0);
    }
}

void PlayDefensiveStatDownEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18F, 1, GetEffectAnimationWanOffset(0x18F),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x191, 1, GetEffectAnimationWanOffset(0x191),
                                  2, 0, -1, 0);
    }
}

void PlayOffensiveStatUpEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x1A9, 1, GetEffectAnimationWanOffset(0x1A9),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x192, 1, GetEffectAnimationWanOffset(0x192),
                                  2, 0, -1, 0);
    }
}

void PlayDefensiveStatUpEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18E, 1, GetEffectAnimationWanOffset(0x18E),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x190, 1, GetEffectAnimationWanOffset(0x190),
                                  2, 0, -1, 0);
    }
}

void PlayOffensiveStatMultiplierUpEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x1A9, 1, GetEffectAnimationWanOffset(0x1A9),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x192, 1, GetEffectAnimationWanOffset(0x192),
                                  2, 0, -1, 0);
    }
}

void PlayOffensiveStatMultiplierDownEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x194, 1, GetEffectAnimationWanOffset(0x194),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x193, 1, GetEffectAnimationWanOffset(0x193),
                                  2, 0, -1, 0);
    }
}

void PlayDefensiveStatMultiplierUpEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18E, 1, GetEffectAnimationWanOffset(0x18E),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x190, 1, GetEffectAnimationWanOffset(0x190),
                                  2, 0, -1, 0);
    }
}

void PlayDefensiveStatMultiplierDownEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18F, 1, GetEffectAnimationWanOffset(0x18F),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0x191, 1, GetEffectAnimationWanOffset(0x191),
                                  2, 0, -1, 0);
    }
}

void PlayHitChanceUpEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18C, 1, GetEffectAnimationWanOffset(0x18C),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0xD, 1, GetEffectAnimationWanOffset(0xD),
                                  2, 0, -1, 0);
    }
}

void PlayHitChanceDownEffect(struct entity *entity, struct StatIndex stat_index)
{
    if (stat_index.id == 0) {
        PlayEffectAnimationEntity(entity, 0x18D, 1, GetEffectAnimationWanOffset(0x18D),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(entity, 0xE, 1, GetEffectAnimationWanOffset(0xE),
                                  2, 0, -1, 0);
    }
}

void PlayExclamationPointEffect__022E5D4C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x143, 1, GetEffectAnimationWanOffset(0x143),
                              2, 0, -1, 0);
}

void ov29_022E53EC(void)
{

}

void ov29_022E53F0(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x19, 1, GetEffectAnimationWanOffset(0x19),
                              2, 0, -1, 0);
}

void ov29_022E543C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x15, 1, 3, 2, 0, -1, 0);
}

void ov29_022E5474(void)
{

}

void ov29_022E5478(struct entity *entity, struct unk_02308FE0 *damage_data)
{
    s32 id;
    s32 v = damage_data->field_0x8;

    if (DUNGEON_PTR[0]->last_damage_calc.fire_move_ability_drop_activated) {
        v = ov29_0230D618(v);
    }

    switch (v) {
    default:
    case 0:
        id = 8;
        break;
    case 1:
        id = 9;
        break;
    case 2:
        id = 0xA;
        break;
    case 3:
        id = 0xB;
        break;
    }

    PlayEffectAnimationEntity(entity, id, 1, 3, 0, 1, -1, 0);
}

void ov29_022E550C(struct entity *entity)
{
    PlayEffectAnimationEntity(entity, 0x13E, 1, GetEffectAnimationWanOffset(0x13E),
                              2, 0, -1, 0);
}

void ov29_022E555C(void)
{

}

void ov29_022E5560(struct entity *a, struct entity *b, s32 c)
{
    if (c == 1) {
        PlayEffectAnimationEntity(b, 0xF8, 1, GetEffectAnimationWanOffset(0xF8),
                                  2, 0, -1, 0);
    }
    else {
        PlayEffectAnimationEntity(b, 0xF9, 1, GetEffectAnimationWanOffset(0xF9),
                                  2, 0, -1, 0);
    }
}

void ov29_022E55F0(struct entity *a, struct entity *b)
{
    PlayEffectAnimationEntity(b, 0x2A, 1, GetEffectAnimationWanOffset(0x2A),
                              2, 0, -1, 0);
}
