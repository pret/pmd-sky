#ifndef PMDSKY_MAIN_0206C98C_H
#define PMDSKY_MAIN_0206C98C_H

void DseMem_Quit(void);
void* DseMem_AllocateUser(u32 size, u32 alignment);
void* DseMem_Allocate(u32 size, u32 alignment, u32 label);

#endif //PMDSKY_MAIN_0206C98C_H
