.386	;框架伪指令				
							
.model flat,stdcall	;定义程序的工作模式	
							
option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明
scanf PROTO C:ptr sbyte, :VARARG
public a, b ;允许被C模块使用
public _calcAXBX
extern z: sdword ;来自C模块

;数据段
.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
    fmt_in db '%d%d', 0
    fmt_msg db 'enter a, b: ', 0ah, 0
    a sdword ?
    b sdword ?
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）

_calcAXBX proc C x:sdword, y:sdword ;使用c规则
    invoke scanf, a, b
    push edi ;
    push esi ;子程序用到ESI, EDI, EAX必须保存到堆栈
    mov eax, a
    mul x ;eax = a*x
    mov edi, eax ;edi = a*x
    mov eax, b
    mul x ;eax = b*x
    mov esi, eax ;esi = b*y
    add edi, esi ;edi = a*x + b*y
    mov z, edi ;z = a*x + b*y
    mov eax, 0 ;返回值设为零
    pop esi ;恢复ESI
    pop edi ;恢复EDI
    ret
_calcAXBX endp
end ;必须使用
