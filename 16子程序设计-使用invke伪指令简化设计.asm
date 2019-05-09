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
    fmt_out db '%d - %d = %d', 0ah, 0
    fmt_out1 db '%d + %d = %d', 0ah, 0
    fmt_in db '%d%d', 0
    fmt_msg db 'enter a , b: ', 0ah, 0
    a dd ?
    b dd ?
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）

sub_pro1 proc C ma: dword , mb: dword;使用c规则
    mov eax, ma ;取出第一个参数
    sub eax, mb;取出第二个参数, eax保存结果
    ret
sub_pro1 endp

sub_pro2 proc stdcall ma: dword, mb: dword;使用stacall规则
    mov eax, ma ;取出第一个参数
    add eax, mb;取出第二个参数, eax保存结果
    ret
sub_pro2 endp

start:
main proc
    invoke printf, offset fmt_msg
    invoke scanf, offset fmt_in, offset a, offset b
    invoke sub_pro1, a, b
    invoke printf, offset fmt_out, a, b, eax
    invoke sub_pro2, a, b
    invoke printf, offset fmt_out1, a, b, eax
main endp
end main
end start

; 使用invoke伪指令，无需通过[ebp + x]访问参数， 无需栈平衡, 调用方式简介