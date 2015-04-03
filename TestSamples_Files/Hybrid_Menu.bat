@echo off
setlocal enabledelayedexpansion
:Sample
call :Menu "To jest testowe menu" "--------------------" "Idz w prawo;goto prawo" "Idz w lewo;goto lewo" "Wyjdz;goto :EOF"
%result%
:Sample1
call :Menu "To jest inne menu" "--------------------" "Idz w prawo;goto prawo" "Idz w lewo;goto lewo" "Idz prosto;goto prosto" "Wroc;goto Sample"
%result%
goto Sample1

:Menu
cls
set a=0
for %%X in (%*) do (
	for /F "tokens=1* delims=;" %%a in ("%%~X") do (
		if not "%%b"=="" (
			set /a a+=1
			set O!a!=%%b
			echo.!a!^) %%a
		) else (
			echo.%%a
		)
	)
)
if %a% EQU 0 goto :EOF
set cho=
set /p "cho=> "
for /L %%a in (1,1,%a%) do (if "%cho%"=="%%a" set result=!O%%a!&goto :EOF)
goto menu

:lewo
echo.
echo Poszedles w lewo.
pause
goto Sample1

:prawo
echo.
echo Poszedles w prawo.
pause
goto Sample1

:prosto
echo.
echo Nie ma takiej ulicy. xD
pause
goto Sample
