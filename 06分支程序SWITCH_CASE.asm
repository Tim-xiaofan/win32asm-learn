.386 ;框架伪指令
.model  flat, stdcall ;定义程序的内存工作模式

option casemap:none		;告诉编译器程序大小写敏感，因为win32API大小写敏感

;include 文件定义及函数声明
includelib msvcrt.lib   ;库文件
printf proto C :dword, :VARARG ;printf函数用法
scanf proto C :dword, :VARARG ;scanf函数用法


;数据段
.data
msg_menu db '1--create', 0ah ;菜单选项字符窜
         db '2--update', 0ah 
         db '3--delete', 0ah
         db '4--print', 0ah
         db '5--quit', 0ah, 0
msg_input db 'input selection:',0ah, 0
fmt_in db '%d', 0 ;scanf的格式字符窜
op dd ? ;保存输入
msg_error db 'Error!', 0ah, 0 ;出错显示的信息
msg_c db 'create', 0ah, 0ah, 0
msg_u db 'update', 0ah, 0ah, 0
msg_d db 'delete', 0ah, 0ah, 0
msg_p db 'print', 0ah, 0ah, 0
msg_q db 'quit', 0ah, 0ah, 0
;跳转表
cr dd ?
up dd ?
de dd ?
pr dd ?
qu dd ?
jmp_tab dd offset cr 
        dd offset up 
        dd offset de 
        dd offset pr 
        dd offset qu

.code					;所有指令都必须放在代码段，在可执行文件中，代码段放在_TEXT节区（区块）中）
start:
    main proc
    invoke printf, offset msg_menu
work:
	invoke printf, offset msg_input
    invoke scanf, offset fmt_in
    cmp op, 1 
    jb beep ;小于1出错
    cmp op, 5
    ja beep ;大于5出错
    mov ebx, op
    dec ebx ;转换为跳转表索引
    mov eax, jmp_tab[eax * 4] ;得到表项地址
    jmp eax ;跳转到表项
    ;或者直接jmp jmp_tab[eax * 4]
beep:
    invoke printf, offset msg_error ;提示输入错误
    jmp work
CR:
    invoke printf, offset msg_c
    jmp start
UP:
    invoke printf, offset msg_u
    jmp start
DE:
    invoke printf, offset msg_d
    jmp start
PR:
    invoke printf, offset msg_p
    jmp start
QU:
    invoke printf, offset msg_q
    ret
    main endp
    end main
end start

;switch_case,关键建立跳转表
;代码无法运行
