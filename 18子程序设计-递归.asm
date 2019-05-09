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
    fmt_out db '%d! = %d', 0ah, 0
    fmt_out1 db 'enter n: ', 0ah, 0
    fmt_in db '%d', 0
    fmt_msg db 'enter n: ', 0ah, 0
    n dd ?
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）

fact proc C k: ptr dword ;使用c规则
    cmp k, 1
    jbe exit
    mov ebx, k
    dec ebx
    invoke fact, ebx; fac(k - 1)
    mul k ;k! = k * (k - 1)!
    ret
exit:
    mov eax, 1;
    ret
fact endp


start:
main proc
    invoke printf, offset fmt_out1
    invoke scanf, offset fmt_in, offset n
    invoke fact, n ;eax = n!
    invoke printf, offset fmt_out, n, eax
main endp
end main
end start

; 使用递归调用，求阶乘n!