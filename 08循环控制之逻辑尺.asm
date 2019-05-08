.386	;框架伪指令				
							
.model flat,stdcall	;定义程序的工作模式	
							
option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明

;数据段
.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
x dword 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
y dword 5, 8, 7, 6, 1, 2, 3, 4, 10, 9
z dword 10 dup(?)
rule dword 0000000011011100b
fmt_out sbyte 'Z[%d] = %d', 0ah, 0

;代码段
.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
main proc
    mov ecx, 10 ;循环次数
    mov edx, rule ;逻辑尺
    mov ebx, 0; 下标
next:
    mov eax, x[ebx] ;取x中的一个数
    shr edx, 1 ;逻辑尺右移一位
    jc subs ;cf = 1, 相减法
    add eax, y[ebx] ;相加
    jmp result
subs:
    sub eax, y[ebx]
result: 
    mov z[ebx], eax ;保存结果
    add ebx, 4 ;修改指针地址
    loop next

    xor ebx, ebx ;清零
print_result:
    invoke printf, offset fmt_out, ebx, z[ebx * 4] ;通过偏移量模拟数组访问
    inc ebx
	cmp ebx, 10
	jb print_result
    ret
main endp
end main
end start