
A nice solution to add Tasm / Masm Assemblers to Windows environment paths for users who runs these inside specific folder mounted DOSBoxes..

This enables user to invoke tasm / masm and run in dosbox from anywhere in Windows, (even folders with long file names, which are normally not supported in DOSBox)

### Installation:

1. Copy the ASM Folder to C:\
2. Add C:\ASM to Windows Path

Now, the scripts inside ASM folder such as tasm.bat, masm.bat, tlink.bat...etc should be accessible from anywhere via commandline

Included Assemblers and linkers are as follows:-

Turbo Assembler  Version 2.51 (tasm.exe)
Turbo Linker  Version 4.0 (tlink.exe)

Microsoft (R) Macro Assembler  Version 5.00 (masm.exe)
Microsoft (R) Overlay Linker  Version 3.60 (link.exe)

DOSBox Version 0.74-3 (DOSBox.exe)

### Example:

For Masm Assembler, run `masm sample.asm` to generate object file and to link run `link sample.obj` to generate executable file, to check output in a dosbox shell run `dosbox sample.exe` or you can directly execute the .exe if your architecture supports the built.


### Working:

1. On any directory if we ran `tasm hello-world.asm` in command prompt,
2. tasm.bat gets automatically invoked since C:\ASM is added to Windows environment path.
3. The tasm.bat will copy the argument specified which is `hello-world.asm` to C:\ASM\bin and rename it to `clone.asm`.
4. The tasm.bat will mount C:\ASM\bin to DOSBox and Invoke the real tasm.exe with `clone.asm` as argument.
5. The script then pipes the output of Tasm Assembler to `pipe.txt` and to the user cmd terminal.
6. The script finally copies the resultant object file `clone.obj` to the user's directory with the original name `hello-world.obj`

PS: The masm.bat, tlink.bat, link.bat, dosbox.bat also follows the above method.




