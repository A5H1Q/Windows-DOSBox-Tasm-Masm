@echo off
IF "%~1" == "" GOTO noarg
SET src=%1
SET src=%src:"=%
IF "%src%" == "/help" goto noarg
IF "%src%" == "/?" goto noarg
IF NOT EXIST "%cd%\%src%" (goto empty)
IF EXIST C:\ASM\bin\clone.obj (del C:\ASM\bin\clone.obj /Q)
IF EXIST C:\ASM\bin\clone.asm (del C:\ASM\bin\clone.asm /Q)
copy "%cd%\%src%" C:\ASM\bin\clone.asm /V /Y >nul
echo CreateObject("Wscript.Shell").Run "C:\ASM\bin\dosbox -c ""mount X: C:\ASM\bin"" -c ""X:"" -c ""tasm clone.asm>pipe.txt"" -c ""exit""", 0, true >C:\ASM\cloneHandler.vbs
start /WAIT C:\ASM\cloneHandler.vbs
copy C:\ASM\bin\clone.obj "%cd%\%src:~0,-4%.obj" /V /Y >nul
echo.
TYPE C:\ASM\bin\pipe.txt
goto done
:noarg
echo CreateObject("Wscript.Shell").Run "C:\ASM\bin\dosbox -c ""mount X: C:\ASM\bin"" -c ""X:"" -c ""tasm>pipe.txt"" -c ""exit""", 0, true >C:\ASM\cloneHandler.vbs 
start /WAIT C:\ASM\cloneHandler.vbs
TYPE C:\ASM\bin\pipe.txt
echo.
echo.
echo Note: To use these above arguments you must invoke real tasm.exe from dosbox or from explorer path
echo if you're reading this message, it means a batch script capable of taking only one argument is used to invoke the real tasm.exe, so you can only use one argument. which is the input .asm file, more than one arguments will be automatically ignored.
echo.
echo example: tasm myFile.asm
echo.
echo To view this message again type: tasm /help or tasm /? or tasm without any Arguments
echo.
goto done
:empty
echo.
echo File: "%cd%\%src%" Not Found at the location
echo.
:done
