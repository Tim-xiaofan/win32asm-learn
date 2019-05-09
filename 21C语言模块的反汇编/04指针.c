#include <stdio.h>


int main(int arc, char* arv[]) {
	int a; //局部变量
	int* p; //局部变量
	a = 10;
	p = &a;
	return 0;
}
/*反汇编代码（部分）
int a;
	int* p;
	a = 10;
00C63C62  mov         dword ptr [a],0Ah  
	p = &a;
00C63C69  lea         eax,[a]  ;地址传送指令， 将[a]的地址传送给eax寄存器
00C63C6C  mov         dword ptr [p],eax  
*/