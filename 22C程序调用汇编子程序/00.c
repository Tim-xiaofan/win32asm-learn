/*计算a*x + b*y
c模块读入x, y，输出结果
汇编模块读入a, b, 进行计算
*/
#pragma comment(linker,"/NODEFAULTLIB:msvcrt.lib")

#include "stdio.h"

extern int a, b; //a,b来自汇编模块
extern int calcAXBX(int x, int y);//调用汇编模块子程序
extern int z; //可以被外部模块使用
int z;

int main(int argc, char* argv[]){
    int x = 0, y = 0;
    printf("enter x, y");
    scanf("%d%d", &x, &y);
    int r = calcAXBX(x, y);
    printf("%d * %d + %d * %d = %d, r = %d\n", a, x, b, y, z, r);
}