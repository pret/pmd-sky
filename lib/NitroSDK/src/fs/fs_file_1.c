#include "main_0207F3E4.h"

extern BOOL _022BB5F8;
//static BOOL is_init = FALSE;

extern void FSi_InitRom(u32);

void FS_Init (u32 default_dma_no)
{
	if (!_022BB5F8) {
		_022BB5F8 = TRUE;
		FSi_InitRom(default_dma_no);
	}
}

void FS_InitFile(struct file_stream* file)
{
    file->field_0x0 = 0;
    file->field_0x4 = 0;
    file->field_0x1c = 0;
    file->field_0x18 = 0;
    file->field_0x8 = 0;
    file->field_0x10 = 0xe;
    file->field_0xc = 0;
}
