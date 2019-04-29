	.386					
							
	.model flat,stdcall		
							
	option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
include		windows.inc		;函数声明定义格式：函数名 proto	[距离][语言][参数名]:数据类型 参数名]:数据类型
include		user32.inc
includelib 	user32.lib	;告诉链接器在链接的时候去指定的库文件找，这是导入库 
include 	kernel32.inc
includelib 	kernel32.lib

;数据段
	.data					;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
m1 db 15D   ;十进制（默认为十进制，D可省略）
m2 db 67H   ;十六进制
m3 db 1111000B  ;二进制
m4 db 325Q  ;八进制

;代码段
	.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
	mov AL ,1
	int 21H
	end start
; 伪指令，格式：[变量名] 助记符 操作数