#ifndef PMDSKY_MATH_H
#define PMDSKY_MATH_H

#define INFINITY 999
#define INFINITY_2 999999
#define INFINITY_3 10000

#define F248LessThanFloat(x, y) (x < (int)(y * 0x100))
#define F248LessThanInt(x, y) (x < 0x100 * y)

#endif //PMDSKY_MATH_H