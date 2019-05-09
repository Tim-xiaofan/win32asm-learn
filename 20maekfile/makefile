00.exe: 00_caculate.obj 00_input_n.obj
	link 00_caculate.obj 00_input_n.obj /out:00.exe /subsystem:console
00_caculate.obj: 00_caculate.asm
	ml /c /coff 00_caculate.asm
00_input_n.obj: 00_input_n.asm
	ml /c /coff 00_input_n.asm

