	.386	;框架伪指令				
							
	.model flat;定义程序的工作模式	
							
	option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib   ;库文件
printf PROTO C:ptr sbyte, :VARARG ;函数声明
public print
;数据段
	.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
szText    sbyte	 'hello,world !',0ah, 0;字符窜以0结束

;代码段
	.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
print  proc c
    ;invoke printf, offset szText ;报错：无法解析的外部符号_printf
    ret
print endp
end