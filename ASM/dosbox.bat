@echo off
IF "%~1" == "" GOTO noarg
SET src=%1
SET src=%src:"=%
IF NOT EXIST "%cd%\%src%" (goto empty)
copy "%cd%\%src%" C:\ASM\bin\clone.exe /V /Y >nul
start C:\ASM\bin\dosbox -c "mount x: C:\ASM\bin" -c "X:" -c "cls" -c "clone.exe"
goto done
:noarg
echo.
echo Starting DOSBox Without Mount.
echo.
start C:\ASM\bin\dosbox
goto done
:empty
echo.
echo File: "%cd%\%src%" Not Found at the location
echo.
:done
