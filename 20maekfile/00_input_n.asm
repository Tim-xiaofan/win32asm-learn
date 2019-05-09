.386	;框架伪指令				
							
.model flat,stdcall	;定义程序的工作模式	
							
option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明
scanf PROTO C:ptr sbyte, :VARARG
public result ;允许被其他模块调用
fact PROTO C: ptr dword ;fact位于其他模块

;数据段
.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
    fmt_out db '%d! = %d', 0ah, 0
    fmt_out1 db 'enter n: ', 0ah, 0
    fmt_in db '%d', 0
    fmt_msg db 'enter n: ', 0ah, 0
    n dd ?
    result dd ?
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）


start:
main proc
    invoke printf, offset fmt_out1
    invoke scanf, offset fmt_in, offset n
    invoke fact, n ;realut = n!
    invoke printf, offset fmt_out, n, result
main endp
end main
end start

; 使用递归调用，求阶乘n!