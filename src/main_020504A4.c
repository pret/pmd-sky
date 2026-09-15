#include "main_020504A4.h"
#include "adventure_log.h"
#include "main_0200330C.h"
#include "main_0202593C.h"
#include "main_020251AC.h"
#include "main_020517D4.h"
#include "progression.h"

struct unk_022AB918 {
#ifdef JAPAN
    u8 field_0x0[8];
#else
    u8 field_0x0[0xc];
#endif
    s32 field_0xc;
    u8 field_0x10;
};

extern struct unk_022AB918 TEAM_NAME;
#ifdef JAPAN
extern u8 _022AB918[8];
#else
extern u8 _022AB918[0xc];
#endif
extern s32 _022AB924;
extern u8 CONVERSION2_TYPE_TABLE[];

extern void StrncpyName(char *dest, const char *src, u32 n);
extern void ComputeSpecialCounters(void);
extern void Copy16BitsTo(struct bitstream *stream, void *buf_write);
extern void Copy16BitsFrom(struct bitstream *stream, void *buf_read);

u32 GetSentryDutyGamePoints(s32 index)
{
    return ADVENTURE_LOG_PTR->sentry_duty_game_points[index];
}

s32 SetSentryDutyGamePoints(u32 points)
{
    s16 i;
    s16 j;

    for (i = 0; i < 5; i++)
    {
        if (points > ADVENTURE_LOG_PTR->sentry_duty_game_points[i])
        {
            break;
        }
    }
    if (i >= 5)
    {
        return -1;
    }
    for (j = 4; j > i; j--)
    {
        ADVENTURE_LOG_PTR->sentry_duty_game_points[j] = ADVENTURE_LOG_PTR->sentry_duty_game_points[j - 1];
    }
    ADVENTURE_LOG_PTR->sentry_duty_game_points[i] = points;
    return i;
}

void CopyLogTo(struct bitstream *stream)
{
    ComputeSpecialCounters();
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_dungeons_cleared, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_friend_rescues, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_evolutions, 0x14);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->completion_flags, 0x80);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->pokemon_joined_counter, 0xe);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->pokemon_battled_counter, 0xe);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->moves_learned_counter, 9);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_victories_on_one_floor, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_faints, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_eggs_hatched, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_big_treasure_wins, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_recycled, 0x14);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->nb_gifts_sent, 0x14);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->pokemon_joined_flags, 0x4a0);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->pokemon_battled_flags, 0x4a0);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->moves_learned_flags, 0x220);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->items_acquired_flags, 0x580);
    CopyBitsTo(stream, &ADVENTURE_LOG_PTR->special_challenge_flags, 0x20);
    CopyBitsTo(stream, ADVENTURE_LOG_PTR->sentry_duty_game_points, 0xa0);
    Copy16BitsTo(stream, &ADVENTURE_LOG_PTR->current_floor);
}

void CopyLogFrom(struct bitstream *stream)
{
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_dungeons_cleared, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_friend_rescues, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_evolutions, 0x14);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->completion_flags, 0x80);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->pokemon_joined_counter, 0xe);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->pokemon_battled_counter, 0xe);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->moves_learned_counter, 9);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_victories_on_one_floor, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_faints, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_eggs_hatched, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_big_treasure_wins, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_recycled, 0x14);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->nb_gifts_sent, 0x14);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->pokemon_joined_flags, 0x4a0);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->pokemon_battled_flags, 0x4a0);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->moves_learned_flags, 0x220);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->items_acquired_flags, 0x580);
    CopyBitsFrom(stream, &ADVENTURE_LOG_PTR->special_challenge_flags, 0x20);
    CopyBitsFrom(stream, ADVENTURE_LOG_PTR->sentry_duty_game_points, 0xa0);
    Copy16BitsFrom(stream, &ADVENTURE_LOG_PTR->current_floor);
}

void GetAbilityString(char *buf, s32 ability_id)
{
#if defined(EUROPE)
    CopyNStringFromId(buf, (u16)(ability_id + 0x35e0), 0x50);
#elif defined(JAPAN)
    CopyNStringFromId(buf, (u16)(ability_id + 0x4881), 0x50);
#else
    CopyNStringFromId(buf, (u16)(ability_id + 0x35de), 0x50);
#endif
}

u16 GetAbilityDescStringId(s32 ability_id)
{
#if defined(EUROPE)
    return ability_id + 0x365c;
#elif defined(JAPAN)
    return ability_id + 0x48fd;
#else
    return ability_id + 0x365a;
#endif
}

u16 GetTypeStringId(s32 type_id)
{
#if defined(EUROPE)
    return type_id + 0x35cd;
#elif defined(JAPAN)
    return type_id + 0x486e;
#else
    return type_id + 0x35cb;
#endif
}

u8 GetConversion2ConvertToType(s32 type_id)
{
    return CONVERSION2_TYPE_TABLE[type_id];
}

void InitBitstreamForWrite(struct bitstream *stream, void *buf, s32 len)
{
    stream->ptr = buf;
    stream->bit_idx = 0;
    stream->bit_count = 0;
    stream->end = (u32)buf + len;
}

void InitBitstreamForRead(struct bitstream *stream, void *buf, s32 len)
{
    stream->ptr = buf;
    stream->bit_idx = 0;
    stream->bit_count = 0;
    stream->end = (u32)buf + len;
    MemZero(buf, len);
}

void BitstreamDebug(struct bitstream *stream)
{
}

void CopyBitsTo(struct bitstream *stream, void *buf_write, s32 nbits)
{
    u8 *src = buf_write;
    s32 bit = 0;

    while (nbits != 0)
    {
        nbits--;
        if (*src & (1 << bit))
        {
            *stream->ptr |= 1 << stream->bit_idx;
        }
        bit++;
        if (bit == 8)
        {
            bit = 0;
            src++;
        }
        stream->bit_idx++;
        if (stream->bit_idx == 8)
        {
            stream->ptr++;
            stream->bit_idx = 0;
        }
        stream->bit_count++;
    }
}

void CopyBitsFrom(struct bitstream *stream, void *buf_read, s32 nbits)
{
    u8 *dest = buf_read;
    s32 bit = 0;

    while (nbits != 0)
    {
        if (bit == 0)
        {
            *dest = 0;
        }
        nbits--;
        if (*stream->ptr & (1 << stream->bit_idx))
        {
            *dest |= 1 << bit;
        }
        bit++;
        if (bit == 8)
        {
            bit = 0;
            dest++;
        }
        stream->bit_idx++;
        if (stream->bit_idx == 8)
        {
            stream->ptr++;
            stream->bit_idx = 0;
        }
        stream->bit_count++;
    }
}

void StoreDefaultTeamData(void)
{
    u8 buf[0x14];

#ifdef JAPAN
    GetStringFromFileVeneer(buf, 0x4c5);
    StrncpyName((char *)_022AB918, (const char *)buf, 5);
#else
    GetStringFromFileVeneer(buf, 0x234);
    StrncpyName((char *)_022AB918, (const char *)buf, 0xa);
#endif
    TEAM_NAME.field_0xc = 0;
    TEAM_NAME.field_0x10 = 0;
}

void GetMainTeamNameWithCheck(u8 *buf)
{
    u8 name[0x40];

    if (GetResolvedPerformanceProgressFlag(1) && TEAM_NAME.field_0x0[0] != 0)
    {
#ifdef JAPAN
        StrncpySimpleNoPad(buf, _022AB918, 5);
#else
        StrncpySimpleNoPad(buf, _022AB918, 0xa);
#endif
    }
    else
    {
#ifdef JAPAN
        GetStringFromFileVeneer(name, 0x4c8);
        StrncpyName((char *)buf, (const char *)name, 5);
#else
        GetStringFromFileVeneer(name, 0x237);
        StrncpyName((char *)buf, (const char *)name, 0xa);
#endif
    }
}

void GetMainTeamName(u8 *buf)
{
#ifdef JAPAN
    StrncpySimpleNoPadSafe(buf, TEAM_NAME.field_0x0, 5);
#else
    StrncpySimpleNoPadSafe(buf, TEAM_NAME.field_0x0, 0xa);
#endif
}

void SetMainTeamName(const u8 *name)
{
    s32 i;

#ifdef JAPAN
    for (i = 0; i < 5; i++)
#else
    for (i = 0; i < 0xa; i++)
#endif
    {
        TEAM_NAME.field_0x0[i] = *name++;
    }
}

s32 GetRankupPoints(void)
{
    u8 rank = GetRank();

    if (GetResolvedPerformanceProgressFlag(0x16))
    {
        if (rank == 0xc)
        {
            return 0;
        }
    }
    else if (rank >= 8)
    {
        return 0;
    }
    return GetRankUpEntry(rank)->field_0x4 - TEAM_NAME.field_0xc;
}

void sub_02050C10(s32 points)
{
    TEAM_NAME.field_0xc += points;
    if (GetResolvedPerformanceProgressFlag(0x16))
    {
        if (TEAM_NAME.field_0xc > 99999999)
        {
            TEAM_NAME.field_0xc = 99999999;
        }
    }
    else
    {
        s32 max = GetRankUpEntry(7)->field_0x4;

        if (TEAM_NAME.field_0xc > max)
        {
            TEAM_NAME.field_0xc = max;
        }
    }
}

u8 GetRank(void)
{
    u8 rank = 0;

    while (rank < 0xc)
    {
        if (TEAM_NAME.field_0xc < GetRankUpEntry(rank)->field_0x4)
        {
            break;
        }
        rank++;
    }
    if (!GetResolvedPerformanceProgressFlag(0x16))
    {
        if (rank > 8)
        {
            rank = 8;
        }
    }
    return rank;
}

u8 sub_02050CD0(void)
{
    u8 rank = GetRank();

    if (rank > 8)
    {
        rank = 8;
    }
    return rank;
}

s32 GetRankStorageSize(void)
{
    return GetRankUpEntry(GetRank())->field_0x8;
}
