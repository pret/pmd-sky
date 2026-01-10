#include "get_category_string.h"
#include "main_0202593C.h"

void SprintfStatic__02052418(u8*, u8*, u8*); 

extern u8 _020A3200[10];

u8 *GetCategoryString(s32 id) 
{
    u8 *buffer;
    u8 *string;

    buffer = AllocateTemp1024ByteBufferFromPool();

#ifdef EUROPE
    string =  StringFromId((u16) ((id % 600) + 0x2479));
#elif JAPAN
    string =  StringFromId((u16) ((id % 600) + 0x1A40));
#else
    string =  StringFromId((u16) ((id % 600) + 0x2477));
#endif
    
    SprintfStatic__02052418(buffer, _020A3200, string);
    return buffer;
}
