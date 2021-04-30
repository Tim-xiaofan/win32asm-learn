.386
.model flat

;函数，库文件声明
input PROTO C px:ptr sdword, py: ptr sdword ;要调用的C函数
output PROTO C x:sdword, y:sdword

;数据区
.data
x sdword ?
y sdword ?

;代码区
.code 
main proc C
    invoke input, offset x, offset y
    invoke output, x, y
    ret
main endp
end

;调用C函数，计算并输出x*x+y*y
