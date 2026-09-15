#include "main_020526EC.h"
#include "main_02051FF0.h"
#include "main_02008BD4.h"
#include "main_02001188.h"
#include "main_0202593C.h"
#include "monster_data.h"
#include "ground_bg.h"
#include <stdarg.h>

extern void LoadFileFromRom(struct iovec *iov, const char *filepath, u32 flags);
extern s32 GetAtSize(void *data);
extern void DecompressAtNormalVeneer(void *dest, u32 size, void *src);
extern void LoadM2nAndN2m(void);
extern s16 GetBaseForm(s16 id);
extern u8 *strncpy(u8 *dst, const u8 *src, u32 n);
extern s32 vsprintf(u8 *str, const u8 *format, va_list ap);

extern const char _020A31B8[];
extern const char _020A31D4[];
extern const char _020A31E4[];
extern const char _020A31F4[];
extern const char _020A31FC[];
#ifdef JAPAN
extern const char _020A45C8_JP[];
#endif
extern const char *const UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE[28];
extern const RGB_Array ARM9_UNKNOWN_PTR__NA_20A2C84;

struct unk_020B09B0_sub {
    u8 field_0x0[0x10];
    u32 field_0x10;
    u8 field_0x14[4];
};

struct unk_020B09B0_job {
    s32 field_0x0;
    void *field_0x4;
    s32 field_0x8;
    s32 field_0xc;
    s32 field_0x10;
};

struct unk_020B09B0 {
    struct unk_020B09B0_sub field_0x0[2][2];
    struct unk_020B09B0_job field_0x60[16];
    s16 field_0x1a0;
    u8 field_0x1a2[0x1cc - 0x1a2];
    struct UnkStruct_2324CBC_Sub98 field_0x1cc[2];
};

extern struct unk_020B09B0 *_020B09B0;

extern void sub_02051804(struct unk_020B09B0_job *jobs, u32 a, const void *b,
                         s32 c, s32 d, u32 e);
extern void sub_02051D8C(s16 a, s16 b, u16 c, s32 d, s32 e);
extern void sub_02051E60(s32 a, s32 b);

void sub_020522F0(const char *path, struct unk_020522F0 *state, s32 param2)
{
    u8 *data;

    state->field_0x8 = sub_02051FF0(path, (void **)&state->field_0x0, param2);
    data = (u8 *)state->field_0x0;
    state->field_0x4 = data + state->field_0x0->field_0x8;
    state->field_0xc = data + state->field_0x0->field_0x10;
    state->field_0x10 = data + state->field_0x0->field_0x0;
}

void sub_02052334(struct unk_020522F0 *state)
{
    if (state->field_0x0 != NULL) {
        MemFree(state->field_0x0);
        state->field_0x0 = NULL;
    }
}

void LoadMonsterMd(void)
{
    LoadFileFromRom(&MONSTER_DATA_TABLE_PTR.field_0xc, _020A31B8, 0);
    LoadM2nAndN2m();
#ifdef EUROPE
    MONSTER_DATA_TABLE_PTR.field_0x8 = MONSTER_DATA_TABLE_PTR.field_0xc.iov_base;
    MONSTER_DATA_TABLE_PTR.field_0x0 = &MONSTER_DATA_TABLE_PTR.field_0x8->table;
#else
    MONSTER_DATA_TABLE_PTR.field_0x4 = MONSTER_DATA_TABLE_PTR.field_0xc.iov_base;
    MONSTER_DATA_TABLE_PTR.field_0x0 = &MONSTER_DATA_TABLE_PTR.field_0x4->table;
#endif
}

void GetNameRaw(u8 *dest, s32 monster_id)
{
#ifdef EUROPE
    strncpy(dest, StringFromId((u16)(monster_id % 600 + 0x2221)), 20);
#elif JAPAN
    strncpy(dest, StringFromId((u16)(monster_id % 600 + 0x1590)), 20);
#else
    strncpy(dest, StringFromId((u16)(monster_id % 600 + 0x221F)), 20);
#endif
}

void GetName(char *dest, enum monster_id monster_id, char color_id)
{
#ifdef EUROPE
    SprintfStatic__02052418(dest, _020A31D4, color_id,
                            StringFromId((u16)(monster_id % 600 + 0x2221)));
#elif JAPAN
    SprintfStatic__02052418(dest, _020A31D4, color_id,
                            StringFromId((u16)(monster_id % 600 + 0x1590)));
#else
    SprintfStatic__02052418(dest, _020A31D4, color_id,
                            StringFromId((u16)(monster_id % 600 + 0x221F)));
#endif
}

void SprintfStatic__02052418(char *dest, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(dest, format, args);
}

void GetNameWithGender(char *dest, s16 monster_id, char color_id)
{
#ifdef EUROPE
    u8 *name = StringFromId((u16)(monster_id % 600 + 0x2221));
#elif JAPAN
    u8 *name = StringFromId((u16)(monster_id % 600 + 0x1590));
#else
    u8 *name = StringFromId((u16)(monster_id % 600 + 0x221F));
#endif

    if (MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].gender == 3 ||
        monster_id == MONSTER_NIDORAN_F || monster_id == MONSTER_NIDORAN_M) {
        SprintfStatic__02052418(dest, _020A31D4, color_id, name);
    }
#ifdef JAPAN
    else if (MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].gender == 2) {
        SprintfStatic__02052418(dest, _020A31E4, color_id, name);
    }
    else {
        SprintfStatic__02052418(dest, _020A45C8_JP, color_id, name);
    }
#else
    else if (MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].gender == 2) {
        SprintfStatic__02052418(dest, _020A31E4, color_id, name, 0xBE);
    }
    else {
        SprintfStatic__02052418(dest, _020A31E4, color_id, name, 0xBD);
    }
#endif
}

void GetSpeciesString(char *dest, s16 monster_id)
{
    s32 idx;

    if (GetBaseForm(monster_id) == MONSTER_UNOWN_A) {
        if (monster_id == MONSTER_UNOWN_B) {
            idx = 1;
        }
        else if (monster_id == MONSTER_UNOWN_C) {
            idx = 2;
        }
        else if (monster_id == MONSTER_UNOWN_D) {
            idx = 3;
        }
        else if (monster_id == MONSTER_UNOWN_E) {
            idx = 4;
        }
        else if (monster_id == MONSTER_UNOWN_F) {
            idx = 5;
        }
        else if (monster_id == MONSTER_UNOWN_G) {
            idx = 6;
        }
        else if (monster_id == MONSTER_UNOWN_H) {
            idx = 7;
        }
        else if (monster_id == MONSTER_UNOWN_I) {
            idx = 8;
        }
        else if (monster_id == MONSTER_UNOWN_J) {
            idx = 9;
        }
        else if (monster_id == MONSTER_UNOWN_K) {
            idx = 10;
        }
        else if (monster_id == MONSTER_UNOWN_L) {
            idx = 11;
        }
        else if (monster_id == MONSTER_UNOWN_M) {
            idx = 12;
        }
        else if (monster_id == MONSTER_UNOWN_N) {
            idx = 13;
        }
        else if (monster_id == MONSTER_UNOWN_O) {
            idx = 14;
        }
        else if (monster_id == MONSTER_UNOWN_P) {
            idx = 15;
        }
        else if (monster_id == MONSTER_UNOWN_Q) {
            idx = 16;
        }
        else if (monster_id == MONSTER_UNOWN_R) {
            idx = 17;
        }
        else if (monster_id == MONSTER_UNOWN_S) {
            idx = 18;
        }
        else if (monster_id == MONSTER_UNOWN_T) {
            idx = 19;
        }
        else if (monster_id == MONSTER_UNOWN_U) {
            idx = 20;
        }
        else if (monster_id == MONSTER_UNOWN_V) {
            idx = 21;
        }
        else if (monster_id == MONSTER_UNOWN_W) {
            idx = 22;
        }
        else if (monster_id == MONSTER_UNOWN_X) {
            idx = 23;
        }
        else if (monster_id == MONSTER_UNOWN_Y) {
            idx = 24;
        }
        else if (monster_id == MONSTER_UNOWN_Z) {
            idx = 25;
        }
        else if (monster_id == MONSTER_UNOWN_EXCLAMATION) {
            idx = 26;
        }
        else if (monster_id == MONSTER_UNOWN_QUESTION) {
            idx = 27;
        }
        else {
            idx = 0;
        }
#ifdef EUROPE
        SprintfStatic__02052418(dest, _020A31F4, StringFromId(0x22EA),
                                UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE[idx]);
#elif JAPAN
        SprintfStatic__02052418(dest, _020A31F4, StringFromId(0x1659),
                                UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE[idx]);
#else
        SprintfStatic__02052418(dest, _020A31F4, StringFromId(0x22E8),
                                UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE[idx]);
#endif
    }
    else {
#ifdef EUROPE
        SprintfStatic__02052418(dest, _020A31FC,
                                StringFromId((u16)(monster_id % 600 + 0x2221)));
#elif JAPAN
        SprintfStatic__02052418(dest, _020A31FC,
                                StringFromId((u16)(monster_id % 600 + 0x1590)));
#else
        SprintfStatic__02052418(dest, _020A31FC,
                                StringFromId((u16)(monster_id % 600 + 0x221F)));
#endif
    }
}

const u8* GetNameString(enum monster_id monster_id)
{
#ifdef EUROPE
    return StringFromId((u16)(monster_id % 600 + 0x2221));
#elif JAPAN
    return StringFromId((u16)(monster_id % 600 + 0x1590));
#else
    return StringFromId((u16)(monster_id % 600 + 0x221F));
#endif
}

u16 GetSpriteIndex__020526EC(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].sprite_index;
}

u16 GetSpriteIndex__02052708(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].sprite_index;
}

u16 GetSpriteIndex__02052724(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].sprite_index;
}

s16 GetDexNumber(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR.field_0x0->entries[monster_id].pokedex_number;
}
