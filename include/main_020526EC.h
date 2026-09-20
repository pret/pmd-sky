#ifndef PMDSKY_MAIN_020526EC_H
#define PMDSKY_MAIN_020526EC_H

#include "enums.h"
#include <file.h>

struct unk_02052060 {
    u32 field_0x0;
    s32 field_0x4;
    u32 field_0x8;
    u32 field_0xc;
    u32 field_0x10;
};

struct unk_020522F0 {
    struct unk_02052060 *field_0x0;
    u8 *field_0x4;
    s32 field_0x8;
    u8 *field_0xc;
    u8 *field_0x10;
};


void sub_020522F0(const char *path, struct unk_020522F0 *state, s32 param2);
void sub_02052334(struct unk_020522F0 *state);
void LoadMonsterMd(void);
void GetNameRaw(u8 *dest, s32 monster_id);
void GetName(char *dest, enum monster_id monster_id, char color_id);
void SprintfStatic__02052418(char *dest, const char *format, ...);
void GetNameWithGender(char *dest, s16 monster_id, char color_id);
void GetSpeciesString(char *dest, s16 monster_id);
const u8* GetNameString(enum monster_id monster_id);
u16 GetSpriteIndex__020526EC(s16 monster_id);
u16 GetSpriteIndex__02052708(s16 monster_id);
u16 GetSpriteIndex__02052724(s16 monster_id);
s16 GetDexNumber(s16 monster_id);

#endif //PMDSKY_MAIN_020526EC_H
