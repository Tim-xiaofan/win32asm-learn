# win32asm-learn
win32汇编语言学习<br>
![配置环境.pdf](https://github.com/Tim-xiaofan/win32asm-learn/blob/master/vs%E7%BC%96%E5%86%99%E6%B1%87%E7%BC%96%E7%A8%8B%E5%BA%8F%E6%AD%A5%E9%AA%A4.pdf)
# vs 2019 需要加入以下兼容库
includelib ucrt.lib<br>
includelib legacy_stdio_definitions.lib<br>
否则会出现"LNK2019	无法解析的外部符号 _printf(_scanf)，函数 _main@0 中引用了该符号"的错误<br>
