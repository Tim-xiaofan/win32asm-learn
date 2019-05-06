	.386	;框架伪指令				
							
	.model flat,stdcall	;定义程序的工作模式	
							
	option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感
;include 文件定义
includelib user32.lib   ;库文件
MessageBoxA PROTO :dword, :dword, :dword, :dword;函数声明
MessageBox equ <MessageBoxA>
NULL equ 0
MB_OK equ 0
    .stack 4096
;数据段
	.data					
	;定义这些分段是把不同类型的数据或代码归类，放到不同的属性内存页中，dos下定义是赋值给寄存器
szTitle sbyte	 'Hi!', 0;字符窜以0结束,消息框标题
szMsg sbyte 'Hello World!',0
;代码段
	.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
    invoke MessageBox,\
           NULL,\ ;父窗口
           offset szMsg,\ ;消息内容
           offset szTitle,\ ;标题
           MB_OK ;显示确定按钮
    ret
end start