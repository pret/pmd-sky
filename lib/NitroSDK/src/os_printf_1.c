#include <nitro.h>

/* static */ void string_put_char (dst_string * p, char c)
{
    if (p->len > 0)
        *p->cur = c, --p->len;

    ++p->cur;
}

/* static */ void string_fill_char (dst_string * p, char c, int n)
{
    if (n > 0) {
        size_t i, k = p->len;

        if (k > (size_t) n)
            k = (size_t) n;

        for (i = 0; i < k; ++i)
            p->cur[i] = c;

        p->len -= k;
        p->cur += n;
    }
}

/* static */ void string_put_string (dst_string * p, const char * s, int n)
{
    if (n > 0) {
        size_t i, k = p->len;

        if (k > (size_t) n)
            k = (size_t) n;

        for (i = 0; i < k; ++i)
            p->cur[i] = s[i];

        p->len -= k;
        p->cur += n;
    }
}

// TODO: Add OS_VsNPrintfEx once unicode stuff is done
// TODO: Enable static defs once func is moved to C

