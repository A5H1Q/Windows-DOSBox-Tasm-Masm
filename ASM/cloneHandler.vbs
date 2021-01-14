 CreateObject("Wscript.Shell").Run "C:\ASM\bin\dosbox -c ""mount X: C:\ASM\bin"" -c ""X:"" -c ""link clone.obj;>pipe.txt"" -c ""exit""", 0, true 
