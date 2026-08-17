#include "main_02048758.h"

void EventFlagBackup(void);

void EventFlagBackupVeneer(void)
{
    EventFlagBackup();
}
