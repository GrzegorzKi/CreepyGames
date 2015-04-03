@echo off
::Created by Jaydyn Zimmerman (CyC0s)
MODE CON: COLS=16 LINES=1
title Adminy
set /p "=Checking rights"<nul

:Adminy1
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto Adminy2
) else (goto Adminy3)
 
:Adminy2
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\adminy.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\adminy.vbs"
"%temp%\adminy.vbs"
del "%temp%\adminy.vbs"
exit /B
 
:Adminy3
pushd "%CD%"
CD /D "%~dp0"
 
:Cleanup
title C:\Windows\system32\cmd.exe
MODE CON: COLS=80 LINES=25
cls
 
:YourCodeGoesBelowHere
title Its working
echo Admin rights granted.
pause