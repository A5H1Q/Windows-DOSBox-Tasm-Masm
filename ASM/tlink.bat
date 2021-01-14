@echo off
IF "%~1" == "" GOTO noarg
SET src=%1
SET src=%src:"=%
IF "%src%" == "/help" goto noarg
IF "%src%" == "/?" goto noarg
IF NOT EXIST "%cd%\%src%" (goto empty)
IF EXIST C:\ASM\bin\clone.obj (del C:\ASM\bin\clone.obj /Q)
IF EXIST C:\ASM\bin\clone.exe (del C:\ASM\bin\clone.exe /Q)
copy "%cd%\%src%" C:\ASM\bin\clone.obj /V /Y >nul
echo  CreateObject("Wscript.Shell").Run "C:\ASM\bin\dosbox -c ""mount X: C:\ASM\bin"" -c ""X:"" -c ""tlink clone.obj>pipe.txt"" -c ""exit""", 0, true >C:\ASM\cloneHandler.vbs
start /WAIT C:\ASM\cloneHandler.vbs
copy C:\ASM\bin\clone.exe "%cd%\%src:~0,-4%.exe" /V /Y >nul
TYPE C:\ASM\bin\pipe.txt
goto done
:noarg
echo  CreateObject("Wscript.Shell").Run "C:\ASM\bin\dosbox -c ""mount X: C:\ASM\bin"" -c ""X:"" -c ""tlink>pipe.txt"" -c ""exit""", 0, true >C:\ASM\cloneHandler.vbs
start /WAIT C:\ASM\cloneHandler.vbs
echo.
TYPE C:\ASM\bin\pipe.txt
echo.
echo.
echo Note: To use these above arguments you must invoke real tlink.exe from dosbox or from explorer path
echo if you're reading this message, it means a batch script capable of taking only one argument is used to invoke the real tlink.exe, so you can only use one argument. which is the input .asm file, more than one arguments will be automatically ignored.
echo.
echo example: tlink myFile.obj
echo.
echo To view this message again type: tlink /help or tlink /? or tlink without any Arguments
echo.
goto done
:empty
echo.
echo File: "%cd%\%src%" Not Found at the location
echo.
:done
