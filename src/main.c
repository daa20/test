#include <stdio.h>
#include <base_calculate.h>



int 
main(int argc, char *argv[])
{
    double a = 0;
    double b = 0;

    a = 2;
    b = 3;

    printf("%f + %f = %f\n", a, b, add(a, b));
       
    a = 2;
    b = 5;

    printf("%f - %f = %f\n", a, b, sub(a, b));


    a = 4;
    b = 5;

    printf("%f * %f = %f\n", a, b, mul(a, b));


    a = -1;
    b = 3;

    printf("%f / %f = %f\n", a, b, div(a, b));


    a = 2;
    b = 0.00001;

    printf("%f / %f = %f\n", a, b, div(a, b));

    printf("this is a test!\n");    
   
    printf(" test helloworld!\n");    
    
    return 0;
}
