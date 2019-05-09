.386	;框架伪指令				
							
.model flat,stdcall	;定义程序的工作模式	
							
option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明
scanf PROTO C:ptr sbyte, :VARARG
public fact ;允许被其他模块调用fact
extern result:dword ;result位于外部模块
;数据段
.data					

;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）

fact proc C k: ptr dword ;使用c规则
    cmp k, 1
    jbe exit
    mov ebx, k
    dec ebx
    invoke fact, ebx; fac(k - 1)
    mul k ;k! = k * (k - 1)!
    mov result, eax
    ret
exit:
    mov eax, 1 
    mov result, eax
    ret
fact endp
end

; 使用递归调用，求阶乘n!