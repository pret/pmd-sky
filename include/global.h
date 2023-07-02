#ifndef PMDSKY_GLOBAL_H
#define PMDSKY_GLOBAL_H

#include <nitro.h>
#include <nitro/code16.h>
#include <nnsys.h>

#include <string.h>
#include <stddef.h>

#include "config.h" // MUST COME BEFORE ANY OTHER GAME-SPECIFIC HEADERS
#include "assert.h"

#define NELEMS(a) (sizeof(a) / sizeof(*(a)))

typedef struct {
    int x;
    int y;
    int z;
} Vec32;

#endif //PMDSKY_GLOBAL_H
