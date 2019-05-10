#include <stdio.h>

extern void input(int* px, int* py);
extern void output(int x, int y);

void input(int* px, int* py){
    printf("enter x, y: ");
    scanf("%d%d", px, py);
}

void output(int x, int y){
    printf("%d * %d + %d * %d = %d", x, x, y, y, x * x + y * y);
}
