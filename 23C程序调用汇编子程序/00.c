#include <stdio.h>

extern  void print();

int main() {
	print();
}

//通过make命令链接失败，但通过vc工程可以连接成功
//调用汇编子程序print输出hello world