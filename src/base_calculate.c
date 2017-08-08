#include "base_calculate.h"


double
add(double a, double b)
{
    return a + b;
}

double
sub(double a, double b)
{
    return a - b;
}

double
mul(double a, double b)
{
    return a * b;
}

double 
div(double a, double b)
{
    if (b < 0.0001 && b > -0.0001) {
        return 0;
    }

    return a / b;
}
