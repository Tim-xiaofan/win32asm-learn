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
fmt_out db 's = %lf', 0ah, 0
fmt_in db '%lf',  0
fmt_msg db 'enter radius, please:', 0ah, 0
radius real8 ? ;定义8字节（64位）浮点数， 半径
s real8 ? ;面积

;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
main proc
    invoke printf, offset fmt_msg
    invoke scanf, offset fmt_in, offset radius
    finit ;FPU寄存器的初始化
    fld radius ;半径进栈
    fld radius ;
    fmul st(0), st(1)
    fldpi ;加载pi常量
    fmul st(0), st(1)
    fst s;保存面积
    invoke printf, offset fmt_out, s
main endp
end main
end start

;计算f = a + b * m