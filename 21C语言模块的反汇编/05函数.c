#include <stdio.h>

int sub_func(int a, int b) {
	return a * b;
}



int main(int arc, char* arv[]) {
	int r, s;
	r = sub_func(10, 8);//第一次调用
	s = sub_func(r, -1); //第二次调用
	printf("r = %d, s = %d", r, s);
	return 0;
}
/*反汇编代码（部分）
	int r, s;
	r = sub_func(10, 8);//第一次调用
00BC24F8  push        8  ;第二个参数入栈
00BC24FA  push        0Ah  ;第一个参数入栈
00BC24FC  call        sub_func (0BC137Fh)  
00BC2501  add         esp,8  ;栈平衡
00BC2504  mov         dword ptr [r],eax  
	s = sub_func(r, -1); //第二次调用
00BC2507  push        0FFFFFFFFh  
00BC2509  mov         eax,dword ptr [r]  
00BC250C  push        eax  
00BC250D  call        sub_func (0BC137Fh)  
00BC2512  add         esp,8  
00BC2515  mov         dword ptr [s],eax 
*/