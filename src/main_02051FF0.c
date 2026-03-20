#include "main_02051FF0.h"
#include "main_02008BD4.h"

extern void LoadFileFromRom(struct iovec *handle, u32 fileId, s32 param2);
extern s32 GetAtSize(void *data);
extern void *MemAlloc(u32 size, u32 heapId);
extern void DecompressAtNormalVeneer(void *dest, u32 size, void *src);

s32 sub_02051FF0(u32 fileId, void **outPtr, s32 param2)
{
    struct iovec handle;

    LoadFileFromRom(&handle, fileId, param2);

    s32 size = GetAtSize(handle.iov_base);

    if (size <= 0) {
        *outPtr = handle.iov_base;
        size = handle.iov_len;
    } else {
        void *dest = MemAlloc((u32)size, 0);

        DecompressAtNormalVeneer(dest, (u32)size, handle.iov_base);
        *outPtr = dest;
        size = ((s32 *)dest)[3];
        UnloadFile(&handle);
    }

    return size;
}
