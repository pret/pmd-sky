#ifndef PMDSKY_MAIN_02064FFC_H
#define PMDSKY_MAIN_02064FFC_H

struct unk_02064F94 {
    u8 field_0x0[8];
    s16 field_0x8;
};

struct unk_02064FE4 {
    u8 field_0x0[0x20];
    u32 field_0x20;
    int field_0x24;
};

struct unk_020A5488 {
    s16 field_0x0;
    u16 field_0x2;
    u16 field_0x4;
    u16 field_0x6;
    char *field_0x8;
};

struct unk_020B0A48 {
    u8 field_0x0[4];
    s16 field_0x4;
    u8 field_0x6[0x3e];
};

extern struct unk_020A5488 EVENTS[];
extern u8 *_020AFC70;
extern s16 ARM9_UNKNOWN_TABLE__NA_20A68BC[];
extern struct unk_020B0A48 *TEAM_MEMBER_TABLE_PTR;

void sub_0201E380(u8* a, u32* b, s16 c, s16 d);

int GetAppointedLeaderMemberIdx(void);
int GetMainCharacter1MemberIdx(void);
int GetMainCharacter2MemberIdx(void);
int OverlayIsLoaded(s32 overlay_id);
int ov11_022E96E4(void);
int GetUnitNpcIds(void* buf);
int GetAdventureNpcIds(void* buf);
int sub_02055410(int a);
int sub_02055474(int a);
int sub_020554D8(int a);
struct unk_020B0A48* GetMainCharacter1(void);
struct unk_020B0A48* GetMainCharacter2(void);
struct unk_020B0A48* GetMainCharacter3(void);
struct unk_020B0A48* GetHero(void);
struct unk_020B0A48* GetPartner(void);
struct unk_020B0A48* sub_02056914(void);

void sub_02064F94(struct unk_02064F94* a, u32* data, int count);
void sub_02064FE4(struct unk_02064F94* a, struct unk_02064FE4* b);
char* sub_02064FFC(s16 id);
int sub_02065014(s16 id);
int sub_02065050(s16* p);
int sub_0206549C(s16* p, s16* out);

#endif
