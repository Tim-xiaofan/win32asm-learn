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
fmt_in sbyte'%s', 0
fmt_out sbyte 'after: %s', 0ah, 0
s_str db  ?

;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
main proc
    invoke scanf, offset fmt_in, offset s_str
    mov esi, offset s_str ;esi用于寻窜操作
g10: 
    mov al, [esi]
    cmp al, 0
    jz g40 ;结束
    cmp al, 'A'
    jz g30 ; = 'A'
    cmp al, 'A'
    jb g20 ;低于‘A’
    cmp al, 'Z'
    jz g30 ; = 'Z'
    cmp al, 'Z'
    ja g20 ;高于‘Z’
    add al, 'a' - 'A'
    mov [esi], al
g20: ;不是大写
    inc esi
    jmp g10
g30: ; A or Z
    add al, 'a' - 'A'
    mov [esi], al
    jmp g20
g40:
	invoke printf, offset fmt_out, offset s_str
main endp
end main
end start

;将字符窜中的大写字母转换为小写,遇到零，结束循环