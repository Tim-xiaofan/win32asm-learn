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
    s_str db 10 dup(0) ;保存字符窜
    input dd ? ;输入
    fmt_msg byte 'Enter a number:', 0ah, 0
    fmt_in byte '%d', 0
    fmt_out byte '%s', 0ah, 0
;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
main proc
    invoke printf, offset fmt_msg
    invoke scanf, offset fmt_in, offset input
    mov eax, input ;被除数，余数
    xor ecx, ecx ;循环次数
    xor edx, edx ;保存余数
    mov ebx, 10
a10:
    div ebx
    push edx ;余数入栈
    inc ecx ;循环次数+1
    xor edx, edx
    cmp eax, edx
    jnz a10 ;余数不为0，继续循环

    mov edi, offset s_str
a20:
    pop eax ;余数出栈
    add al, '0';转换为ASII码
    mov [edi], al
    inc edi
    loop a20

    mov byte ptr [edi], 0 ;字符窜以0结尾
	invoke printf, offset fmt_out, offset s_str
main endp
end main
end start

;将数窜转换为十进制字符窜:连续除以10，直到商为0结束
; 8192 / 10 = 819 ... 2
; 819 / 10 = 81 ...9
; 81 /10 = 8 ... 1
; 8 / 10 = 0 ... 8
;先进后出