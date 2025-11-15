#ifndef PMDSKY_MATH_H
#define PMDSKY_MATH_H

#define INFINITY 999
#define INFINITY_2 999999
#define INFINITY_3 10000

#define IntToF248(x) ((int)((x) * 0x100))
#define F248ToInt(x) ((s24_8)((x) / 256))

#define F248LessThanInt(x, y) ((x) < 0x100 * (y))
#define F248LessThanFloat(x, y) ((x) < (int)((y) * 0x100))
#define FloatLessThanF248(x, y) ((int)((x) * 0x100) < (y))
#define F248LessThan(x, y) ((x) < (y))
#define F248GreaterThan(x, y) ((x) > (y))
#define F248Equal(x, y) ((x) == (y))
#define F248EqualsInt(x, y) ((x) == 0x100 * (y))
#define F248_AddInt(x, y) ((s24_8)((x) + 0x100 * (y))
#define F248_SubInt(x, y) ((s24_8)((x) - 0x100 * (y))
#define F248_Add(x, y)((x) + (y))
#define F248_Sub(x, y)((x) - (y))
#define F248_MulInt(x, y)((x) * (y))

#endif // PMDSKY_MATH_H
