#include "main_02008BD4.h"
#include "main_02001188.h"

void UnloadFile(struct iovec* iov) {
    MemFree(iov->iov_base);
    iov->iov_base = 0;
    iov->iov_len = 0;
}
