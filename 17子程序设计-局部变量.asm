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
    fmt_out db 'r = %d, s = %d', 0ah, 0
    fmt_in db '%d%d', 0
    fmt_msg db 'enter r , s: ', 0ah, 0
    r dd ?
    s dd ?
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）

swap proc C a: ptr dword , b: ptr dword;使用c规则
    local temp: dword ;局部变量
    mov eax, a 
    mov ecx, [eax]
    mov temp, ecx ;temp = *a
    mov ebx, b
    mov edx, [ebx] 
    mov [eax], edx ;*a = *b
    mov edx, temp  
    mov [ebx], edx ;*b = temp
    ret
swap endp


start:
main proc
    invoke printf, offset fmt_msg
    invoke scanf, offset fmt_in, offset r, offset s
    invoke printf, offset fmt_out,  r,  s
    invoke swap, offset r, offset s
    invoke printf, offset fmt_out,  r,  s
main endp
end main
end start

; 使用局部变量，实现两个数数值交换