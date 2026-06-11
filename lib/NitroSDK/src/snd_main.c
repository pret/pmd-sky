#include <nitro.h>

//static OSMutex sSndMutex;
extern OSMutex sSndMutex;
extern BOOL _022B99EC; // static bool initialized = FALSE

extern void OS_InitMutex(OSMutex *);
extern void OS_LockMutex(OSMutex *);
extern void OS_UnlockMutex(OSMutex *);
extern void SND_CommandInit(void);
extern void Snd_AlarmInit(void);


void SND_Init (void)
{
    {
        if (_022B99EC)
            return;
        _022B99EC = TRUE;
    }

    OS_InitMutex(&sSndMutex);
    SND_CommandInit();
    Snd_AlarmInit();
}

void Sndi_LockMutex (void)
{
    OS_LockMutex(&sSndMutex);
}

void Sndi_UnlockMutex (void)
{
    OS_UnlockMutex(&sSndMutex);
}
