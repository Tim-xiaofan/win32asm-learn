#include <stdio.h>

int a;
static int b; 


int main(int arc, char* arv[]) {
	int c; 
	static int d; 
	a = 0;//全局变量
	b = 1;//全局静态变量
	c = 2;//局部变量
	d = 3;//局部静态变量
	return 0;
}
/*反汇编代码（部分）
a = 0;//全局变量
00101718  mov         dword ptr [a (0109138h)],0  
	b = 1;//全局静态变量
00101722  mov         dword ptr [b (010913Ch)],1  
	c = 2;//局部变量
0010172C  mov         dword ptr [c],2  
	d = 3;//局部静态变量
00101733  mov         dword ptr [d (0109140h)],3  
*/