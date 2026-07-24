#include "main_02003ED0.h"

extern const u8 _02092580[];

const struct prog_pos_info _02092558[] = {
    {(u8*)_02092580, 887},
    {(u8*)_02092580, 534},
    {(u8*)_02092580, 177},
    {(u8*)_02092580, 269},
    {(u8*)_02092580, 626},
};

extern u8 _0209258C;
extern s32 LOADED_OVERLAY_GROUP_0[3];

bool8 OverlayIsLoaded(s32 group_id)
{
    struct prog_pos_info ppi;

    switch (group_id) {
        case 0:
            return 1;
        case 1:
        case 2:
        case 3:
            return LOADED_OVERLAY_GROUP_0[2] == group_id;
        case 4:
        case 5:
            if (LOADED_OVERLAY_GROUP_0[2] != 1) {
                return 0;
            }
            return LOADED_OVERLAY_GROUP_0[1] == group_id;
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
            if (LOADED_OVERLAY_GROUP_0[1] != 4) {
                return 0;
            }
            return LOADED_OVERLAY_GROUP_0[0] == group_id;
        case 13:
        case 14:
        case 15:
            if (LOADED_OVERLAY_GROUP_0[2] != 2) {
                return 0;
            }
            return LOADED_OVERLAY_GROUP_0[1] == group_id;
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
            if (LOADED_OVERLAY_GROUP_0[1] != 0xd) {
                return 0;
            }
            return LOADED_OVERLAY_GROUP_0[0] == group_id;
        case 33:
        case 34:
        case 35:
        case 36:
            if (LOADED_OVERLAY_GROUP_0[1] != 0xe) {
                return 0;
            }
            return LOADED_OVERLAY_GROUP_0[0] == group_id;
        default:
            ppi = _02092558[2];
            Debug_FatalError(&ppi, &_0209258C);
    }
}
