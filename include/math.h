#ifndef PMDSKY_MATH_H
#define PMDSKY_MATH_H

#define INFINITY 999
#define INFINITY_2 999999
#define INFINITY_3 10000

#define F248LessThanFloat(x, y) (x < (int)(y * 0x100))
#define F248LessThanInt(x, y) (x < 0x100 * y)
#define FloatToF248(x) (x * 0x100)
#define FloatLessThanF248(x, y) ((int)(x * 0x100) < y)
#define F248LessThan(x, y) (x < y)
#define F248GreaterThan(x, y) (x > y)
#define F248Equal(x, y) (x == y)
#define F248EqualsInt(x, y) (x == 0x100 * y)

#endif // PMDSKY_MATH_H
