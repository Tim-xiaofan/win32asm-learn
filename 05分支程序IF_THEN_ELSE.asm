	.386	;框架伪指令				
							
	.model flat,stdcall	;定义程序的工作模式	
							
	option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf proto C :dword, :VARARG ;函数声明
scanf proto C :dword, :VARARG

;数据段
	.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
szInput sbyte '%d%d', 0 ;格式字符窜
szOutput sbyte 'max(%d, %d) = %d', 0ah,0
szOutput1 sbyte 'enter a, b for max(a,b):', 0ah, 0
a sbyte ?
b sbyte ?
;代码段
	.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
    main proc
	invoke printf, offset szOutput1
    invoke scanf, offset szInput, offset a, offset b
    mov al, a
	cmp al, b
    jge a_is_larger ;a >= b,跳转到a_is_larger
	mov bl, b;
	jmp done
a_is_larger:
    mov bl, al;
done:
	invoke printf, offset szOutput, a, b, bl
    main endp
    end main
end start

;使用转移指令实现max(a,b), if结构