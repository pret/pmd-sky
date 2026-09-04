#ifndef PMD_SKY_OVERLAY_30_H
#define PMD_SKY_OVERLAY_30_H

#include "dungeon_mode.h"

struct Overlay30Main {
    s32 state;
    s32 unk4;
    s32 unk8;
    u8 unkC;
    s8 isGameModeRescue; // GAME_MODE_RESCUE
};

struct DataSerializer {
    u8 *stream;
    u8 *end;
    u32 count;
};

void ov30_02382820(s32 arg0, s32 arg1, s32 isGameModeRescue);
s32 ov30_02382874(void);
u8 ov30_0238298C(void);
void ov30_023829A0(void);
void ov30_023829CC(s32 arg0, s32 arg1, s8 arg2);
s32 ov30_02382A34(void);
void ov30_02382C30(void);
void WriteQuicksaveData(void *buffer, s32 size);
void ov30_02382D80(void *buffer);
void ov30_02382E94(void *buffer);
void ov30_02382FB8(void *buffer);
void ov30_02383084(void *buffer);
void ov30_023831E8(void *buffer, struct entity* entity);
void ov30_02383C70(void *buffer);
void ov30_0238409C(void *buffer);
void ov30_02384208(void *buffer);
void ov30_02384268(void *buffer, struct item *item);
void ov30_023842B0(void *buffer, struct tile* tile);
void ov30_023842F4(void *buffer, s32 arg1);
void ov30_02384400(void *buffer);
void ov30_0238483C(void *buffer, struct tile* tile);
void ov30_023848A0(void *buffer);
void ov30_02384A20(void *buffer);
void ov30_02384A94(void *buffer);
void ov30_02384B24(void *buffer, struct item *item);
void ov30_02384B84(void *buffer);
void ov30_02384C6C(void *buffer);
void ov30_02384CD4(void *buffer);
void ov30_02384E28(void *arg0, s32 arg1, s32 index);
struct entity* ov30_023859DC(s16 id, s16 apparent_id, s32 monster_slot_index);
struct entity* ov30_02385B10(s16 id, s16 apparent_id, s32 monster_slot_index);
void ov30_02385C3C(struct DataSerializer *r0, u8 *r1, s32 r2); // InitBitWriter
void ov30_02385C54(struct DataSerializer* r0, const void* src, s32 numBits); // WriteBits
void ov30_02385C8C(struct DataSerializer *r0, u8 *r1, s32 r2); // InitBitReader
void ov30_02385CA4(struct DataSerializer* r0, void* src, s32 numBits); // ReadBits
void FinishBitSerializer(struct DataSerializer *r0);
void ov30_02385CE0(struct DataSerializer *arg0, const void *string);
void ov30_02385CF0(struct DataSerializer *arg0, const void *string);
void ov30_02385D14(struct DataSerializer *arg0, u16 r1);
void ov30_02385D34(struct DataSerializer *arg0, s16 r1);
void ov30_02385D54(struct DataSerializer *arg0, u8 r1);
void ov30_02385D74(struct DataSerializer *arg0, s32 r1);
void ov30_02385D94(struct DataSerializer *arg0, s32 r1);
void ov30_02385DB4(struct DataSerializer *arg0, s32 r1);
void ov30_02385DD4(struct DataSerializer *arg0, u8 arg1);
void ov30_02385DF8(struct DataSerializer *arg0, struct position *pos);
void ov30_02385E20(struct DataSerializer *arg0, struct position *pos);
void ov30_02385E48(struct DataSerializer *arg0, s32 *arg1);
void ov30_02385E90(struct DataSerializer *arg0, u16 *arg1);
void ov30_02385EB8(struct DataSerializer *arg0, u8 *arg1, s32 num);
u16 ov30_02385EC4(struct DataSerializer *arg0);
s16 ov30_02385EDC(struct DataSerializer *arg0);
u8 ov30_02385EF4(struct DataSerializer *arg0);
u32 ov30_02385F0C(struct DataSerializer *arg0);
s32 ov30_02385F24(struct DataSerializer *arg0);
s32 ov30_02385F3C(struct DataSerializer *arg0);
u8 ov30_02385F54(struct DataSerializer *arg0);
void ov30_02385F7C(struct DataSerializer *arg0, struct position *pos);
void ov30_02385FB0(struct DataSerializer *arg0, struct position *pos);
void ov30_02385FE4(struct DataSerializer *arg0, s32 *arg1);
void ov30_02386040(struct DataSerializer *arg0, u16 *arg1);
void ov30_02386074(struct DataSerializer *arg0, u8 *arg1, s32 num);

#endif // PMD_SKY_OVERLAY_30_H
