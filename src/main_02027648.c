#include "main_02027648.h"
#include "main_02001188.h"
#include "main_02027AF0.h"
#include "main_020278A8.h"
#include "main_02029A50.h"
#include "window.h"

u32 sub_02027624(s32 window_id)
{
    WindowTemplate *tmpl = &WINDOW_LIST[window_id].template;

    return (tmpl->width * tmpl->height) << 5;
}

s32 NewWindowScreenCheck(s32 a, s32 b)
{
    s8 i;
    Window *w;
    s32 main_count;
    s32 sub_count;

    sub_count = 0;
    main_count = 0;
    w = WINDOW_LIST;

    for (i = 0; i < 20; i++, w++) {
        if (w->is_active != 0) {
            if (w->template.bg_id == 0) {
                main_count++;
            } else {
                sub_count++;
            }
        }
    }
    if (main_count == 0) {
        _022A7A6C.field_0x8 = 1;
    }
    if (sub_count == 0) {
        _022A7A6C.field_0xA = 1;
    }
    return NewWindow(a, b);
}

s32 NewWindow(s32 a, s32 b)
{
    s8 i;
    Window *w;
    struct unk_022A7B1C *p;
    WindowTemplate *tmpl;
    u16 tile;
    s32 bg;
    s32 n;
    u32 vbase;
    u8 *vram;

    tmpl = (WindowTemplate *)a;
    w = WINDOW_LIST;
    p = _022A7B1C;
    for (i = 0; i < 20; i++, w++, p++) {
        if (w->is_active == 0) {
            break;
        }
    }

    w->template = *tmpl;
    w->row_stride = (tmpl->width * 8) - 8;
    w->pixel_buffer = MemAlloc(w->template.height * (w->template.width * 64), 8);

    bg = w->template.bg_id;
    tile = _022A7A74[bg];
    n = w->template.width * w->template.height + tile;
    w->base_tile = tile;
    _022A7A74[bg] = n;
    if (w->template.unk09 == -9) {
        w->unk30 = tile | 0x1000;
    } else {
        w->unk30 = tile;
    }
    if (w->template.bg_id == 0) {
        vbase = 0x6000000;
    } else {
        vbase = 0x6200000;
    }
    vram = (u8 *)(vbase + (tile << 6));
    w->vram_base = vram;
    w->active_vram_dest = vram;
    w->transfer_length = (w->template.width * w->template.height) << 6;
    w->unk11 = 0;
    sub_02027B1C(i);
    w->id = i;
    w->is_active = 1;
    w->unkB7 = 1;
    w->unkB4 = b;
    sub_020278C4(i);
    w->unkB8 = -1;
    InitRender3dElement64(&w->render_elem_1);
    w->render_elem_1.unk3C = 2;
    w->render_elem_1.unk2A = 9;
    w->render_elem_1.unk3E = 2;
    w->render_elem_1.unk2C = 0x20;
    w->render_elem_1.unk2D = 0x20;
    w->render_elem_1.unk2E = 0x20;
    w->render_elem_1.unk2F = 0x90;
    InitRender3dElement64(&w->render_elem_2);
    w->render_elem_2.unk14 = _022A7A6C.field_0x48;
    w->render_elem_2.unk16 = 0;
    w->render_elem_2.unk18 = 0;
    w->render_elem_2.unk1A = 0x18;
    w->render_elem_2.unk1C = 0x18;
    w->render_elem_2.unk20 = _022A7A6C.field_0x54;
    w->render_elem_2.unk24 = GetPaletteBaseAddress__020278A8(_022A7A6C.field_0x58, 0);
    w->render_elem_2.unk3C = 6;
    w->render_elem_2.unk2A = 0xA;
    w->render_elem_2.unk00 = 0;
    w->render_elem_2.unk02 = 0;
    w->render_elem_2.unk04 = 0;
    w->render_elem_2.unk06 = 0;
    InitWindowTrailer(&w->cursor_params);
    p->field_0x0 = 0;
    sub_02029A50(&p->field_0x4);
    p->field_0x4.unk26 = w->template.bg_id;
    return i;
}
