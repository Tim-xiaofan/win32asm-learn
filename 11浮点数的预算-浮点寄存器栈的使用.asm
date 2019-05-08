.386	;框架伪指令				
							
.model flat,stdcall	;定义程序的工作模式	
							
option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明
scanf PROTO C:ptr sbyte, :VARARG

;数据段
.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
fmt_out sbyte '%f', 0ah, 0
a real8 3.2
b real8 2.6
m real8 7.1
f real8 ?

;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
main proc
    finit ;FPU寄存器的初始化
    fld m ;进栈
    fld b
    fmul st(0), st(1)
    fld a
    fadd st(0), st(1)
    fst f;出栈
    invoke printf, offset fmt_out, f
main endp
end main
end start

;计算f = a + b * m