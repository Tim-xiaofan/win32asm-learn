	.386					
							
	.model flat,stdcall		
							
	option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib msvcrt.lib
printf PROTO C:ptr sbyte, :VARARG

;数据段
	.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
szText    sbyte	 'hello,world !',0ah, 0
m1 db 15D   ;十进制（默认为十进制，D可省略）
m2 db 67H   ;十六进制
m3 db 1111000B  ;二进制
m4 db 325Q  ;八进制
m5 dw 4*5
m6 dd 1234H
;m7 dw m2	;m2的偏移量
m8 dd m2    ;m2偏移量、段基
m9 db '15', 'AB$'

;代码段
	.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
main proc
	invoke printf, offset szText
	mov al, m1	;(al) = 15
	mov bx, m5	;(bx) = 20
	add m5, 6	;(m5) = 26
	mov al, m9	;(al) = '1' = 31 
	mov bl, m9+2;(bl) = 'A' = 41,其中m9+2为直接寻址方式
	ret
main endp
	end main