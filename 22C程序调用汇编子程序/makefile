22.exe: 00.obj 01.obj
	link /c /coff 00.obj 01.obj /out:22.exe /subsystem:console
00.obj:00.c
	cl /c 00.c
01.obj:01.asm
	ml /c /coff 01.asm