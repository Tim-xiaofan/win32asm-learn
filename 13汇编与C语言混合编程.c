
#include "pch.h"
#include <stdio.h>

int main(int arc, char* arv) {
	float s, radius;
	printf("enter radius ,please:\n");
	scanf("%f", &radius);
	__asm {
		fld radius
		fld radius
		fmul st(0), st(1)
		fldpi
		fmul st(0), st(1)
		fst s
	}
	printf("s = %f\n", s);
	return 0;
}

//vc ++环境 